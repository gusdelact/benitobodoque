//------------------------------------------------------------------------------
// Función    : Validador de datos en el Alta de Personas
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 26 de Marzo del 2010
//------------------------------------------------------------------------------

unit IntValDatIds;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  InterFor, IntFrm, InterApl, StdCtrls, ComCtrls, Buttons, Grids, 
  UnSQL2, Mask, db, DbTables, ExtCtrls, IntLinkit, InterEdit;

type
  TValDatIds    = class;

  TFrmValDatIds = class(TForm)
    InterForma: TInterForma;
    lvwPersonas: TListView;
    procedure FormShow(Sender: TObject);
    procedure InterFormaSalir(Sender: TObject);
  private
    { Private declarations }
  public
    Objeto: TValDatIds;
  end;


  TValDatIds = class(TInterFrame)
  private
    { Private declarations }
    vlPersonas : TListView;
    vResul     : String;
  protected
    { Protected declarations }
    procedure   AgregarFila(lvw : Tlistview; informacion : Array of String);
  public
    { Public declarations }
    property    plPersonas : TListView read vlPersonas write vlPersonas;
    property    pResul     : String    read vResul     write vResul;

    constructor Create(AOwner : TComponent); override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
    { Published declarations }
  end;

var
   FrmValDatIds : TFrmValDatIds;
implementation
   {$R *.DFM}

procedure TValDatIds.AgregarFila(lvw : Tlistview; informacion : array of String);
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

constructor TValDatIds.Create(AOwner : TComponent);
begin
   inherited;
   UseQuery        := True;
   ShowMenuReporte := True;
   AutoRefresh     := False;
   IsCheckSecu     := False;    
end;

function TValDatIds.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var
   w : TFrmValDatIds;
begin
   try
      w                             := TFrmValDatIds.Create(Self);
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

procedure TFrmValDatIds.FormShow(Sender: TObject);
var
   Qry : TQuery;
begin
   Objeto.plPersonas := lvwPersonas;
   Objeto.plPersonas.Items.Clear;
   with Qry do
      try
         Qry := GetSQLQuery(Objeto.pResul, Objeto.DataBaseName, Objeto.SessionName, True);
         while not eof do
         begin
            Objeto.AgregarFila(Objeto.plPersonas, [IntToStr(FieldByName('ID_PERSONA').AsInteger), trim(FieldByName('NOMBRE').AsString),
                                                   trim(FieldByName('SEXO').AsString), DateToStr(FieldByName('F_NACIMIENTO').AsDateTime)]);
            next;
         end;
         close;
      finally
       if Qry <> nil then
          Free;
      end;
   Objeto.pResul := 'F';
end;

procedure TFrmValDatIds.InterFormaSalir(Sender: TObject);
begin
   if GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION = ''CLASE_' + UpperCase(Objeto.ClassName) + ''') AND (CVE_USUARIO = ''' + Objeto.DameUsuario + ''') and (CVE_OPER_ACC = ''SP'')',
             Objeto.SeguDataBaseName, Objeto.SeguSessionName, True) then
   begin
      if MessageDlg('Aun con las semejanzas, ¿ Desea dar de Alta a la Persona ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         Objeto.pResul := 'V';
   end;
   InterForma.Cierra;
end;
end.
