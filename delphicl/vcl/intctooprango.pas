//------------------------------------------------------------------------------
// Función    : Rango de Operacion por Contrato
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 15 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntCtoOpRango;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit;

Type
  TCtoOpRan = Class;

  TWCtoOpRan = Class(TForm)
    InterForma1 : TInterForma;
    lClave: TLabel;
    lDescripcion: TLabel;
    ieDescRangoOp: TInterEdit;
    ieCveRangoOp: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
       { Private declarations }
    public
       { Public declarations }
       Objeto : TCtoOpRan;
    end;

  TCtoOpRan = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
    public
       { Public declarations }
       Cve_Rango_Operacion  : TInterCampo;
       Desc_Rango_Operacion : TInterCampo;

       procedure   DataBaseChange;
       function    InternalBusca : Boolean; override;
       constructor Create( AOwner : TComponent ); override;
       destructor  Destroy; override;
       function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
       { Published declarations }
    end;
implementation
   {$R *.DFM}

constructor TCtoOpRan.Create( AOwner : TComponent );
begin
   Inherited;

   Cve_Rango_Operacion  := CreaCampo('CVE_RANGO_OPERACION',  ftString, tsNinguno, tsNinguno, True);
   Desc_Rango_Operacion := CreaCampo('DESC_RANGO_OPERACION', ftString, tsNinguno, tsNinguno, True);

   FKeyFields.Add('CVE_RANGO_OPERACION');

   TableName       := 'CTO_OPERACION_RANGO';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TCtoOpRan.Destroy;
begin
   inherited;
end;

procedure TCtoOpRan.DataBaseChange;
begin
   inherited;
end;

function TCtoOpRan.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWCtoOpRan;
begin
   W := TWCtoOpRan.Create(Self);
   try
      W.Objeto                    := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowBtnAyuda  := False;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow                  := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TCtoOpRan.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITCTOOPRANGO.IT', 'S');
   try
      if Active    then   T.Param(0, Cve_Rango_Operacion.AsString);
      if T.Execute then   InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

procedure TWCtoOpRan.FormShow(Sender: TObject);
begin
   Objeto.Cve_Rango_Operacion.Control  := ieCveRangoOp;
   Objeto.Desc_Rango_Operacion.Control := ieDescRangoOp;
end;

procedure TWCtoOpRan.FormDestroy(Sender: TObject);
begin
   Objeto.Cve_Rango_Operacion.Control  := nil;
   Objeto.Desc_Rango_Operacion.Control := nil;
end;

procedure TWCtoOpRan.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if trim(Cve_Rango_Operacion.AsString) = '' then
         begin
            ieCveRangoOp.SetFocus;
            raise EInterFrame.Create('Ingrese una Clave');
         end;
         if trim(Desc_Rango_Operacion.AsString) = '' then
         begin
            ieDescRangoOp.SetFocus;
            raise EInterFrame.Create('Ingrese una Descripcion');
         end;
         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from cto_operacion_rango '
                    + ' where cve_rango_operacion = ' + Cve_Rango_Operacion.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('El Rango de Operacion por Contrato ya existe');
         end;
         Realizado := True;
      except
         on e: EInterFrame do
         begin
            MessageDlg(e.Message, mtInformation, [mbOK], 0);
            Realizado := False;
         end;
      end;
end;

procedure TWCtoOpRan.InterForma1DespuesNuevo(Sender: TObject);
begin
   ieCveRangoOp.SetFocus;
end;

procedure TWCtoOpRan.InterForma1DespuesModificar(Sender: TObject);
begin
   ieDescRangoOp.SetFocus;
end;

procedure TWCtoOpRan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
