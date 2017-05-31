//------------------------------------------------------------------------------
// Función    : Validador de RFC en el Alta de Personas
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 10 de Agosto del 2010
//------------------------------------------------------------------------------

unit IntValRFC;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  InterFor, IntFrm, InterApl, StdCtrls, ComCtrls, Buttons, Grids, 
  UnSQL2, Mask, db, DbTables, ExtCtrls, IntLinkit, InterEdit;

type
  TValRFC    = class;

  TFrmValRFC = class(TForm)
    InterForma: TInterForma;
    lvwPersonas: TListView;
    procedure FormShow(Sender: TObject);
    procedure InterFormaSalir(Sender: TObject);
    procedure AgregarFila(lvw : Tlistview; informacion : Array of String);
  private
    { Private declarations }
  public
    Objeto: TValRFC;
  end;


  TValRFC = class(TInterFrame)
  private
    { Private declarations }
    vQry : TQuery;
  protected
    { Protected declarations }
  public
    { Public declarations }
    property    pQry : TQuery read vQry write vQry;

    constructor Create(AOwner : TComponent); override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
    { Published declarations }
  end;

var
   FrmValRFC : TFrmValRFC;
implementation
   {$R *.DFM}
   
constructor TValRFC.Create(AOwner : TComponent);
begin
   inherited;
   UseQuery        := True;
   ShowMenuReporte := True;
   AutoRefresh     := False;
end;

function TValRFC.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var
   w : TFrmValRFC;
begin
   try
      w                             := TFrmValRFC.Create(Self);
      w.Objeto                      := Self;
      w.InterForma.InterFrame       := Self;
      w.InterForma.FormaTipo        := FormaTipo;
      w.InterForma.ShowGrid         := False;
      w.InterForma.ShowNavigator    := False;
      w.InterForma.ShowBtnNuevo     := False;
      w.InterForma.ShowBtnModificar := False;
      w.InterForma.ShowBtnEliminar  := False;
      w.InterForma.ShowBtnAceptar   := False;
      w.InterForma.ShowBtnCancelar  := False;
      w.InterForma.ShowBtnBuscar    := False;
      w.InterForma.ShowBtnAyuda     := False;
      w.InterForma.Funcion          := FInterFun;
      w.InterForma.ShowModal;
      ShowWindow                    := w.InterForma.ModalResult;
   finally
      w.Free;
   end;
end;

procedure TFrmValRFC.AgregarFila(lvw : Tlistview; informacion : array of String);
var
   fila : Tlistitem;
   n    : Integer;
begin
   for n := low(informacion) to high(informacion) do
   begin
      with lvw do
         if n = 0 then
         begin
            fila         := Items.Add;
            fila.Caption := informacion[n]
         end
         else
            fila.SubItems.Add(informacion[n]);
   end;
end;

procedure TFrmValRFC.FormShow(Sender: TObject);
begin
   lvwPersonas.Items.Clear;
   with Objeto.pQry do
      try
         first;
         while not eof do
         begin
            AgregarFila(lvwPersonas, [IntToStr(FieldByName('ID_PERSONA').AsInteger),
                                      Trim(FieldByName('NOMBRE').AsString),
                                      Trim(FieldByName('SIGLAS_RFC').AsString),
                                      Trim(FieldByName('F_RFC').AsString),
                                      Trim(FieldByName('HOMOCLAVE_RFC').AsString)
                                     ]);
            next;
         end;
         close;
      finally
         if Objeto.pQry <> nil then
            free;
      end;
end;

procedure TFrmValRFC.InterFormaSalir(Sender: TObject);
begin
   InterForma.Cierra;
end;
end.
