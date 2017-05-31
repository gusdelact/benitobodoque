//------------------------------------------------------------------------------
// Función    : Grupo de Operacion por Contrato
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 14 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntCtoOpGpo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit;

Type
  TCtoOpGpo = Class;

  TWCtoOpGpo = Class(TForm)
    InterForma1 : TInterForma;
    lClave: TLabel;
    lDescripcion: TLabel;
    ieDescGpoOp: TInterEdit;
    ieCveGpoOp: TInterEdit;
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
       Objeto : TCtoOpGpo;
    end;

  TCtoOpGpo = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
    public
       { Public declarations }
       Cve_Grupo_Operacion  : TInterCampo;
       Desc_Grupo_Operacion : TInterCampo;

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

constructor TCtoOpGpo.Create( AOwner : TComponent );
begin
   Inherited;

   Cve_Grupo_Operacion  := CreaCampo('CVE_GRUPO_OPERACION',  ftString, tsNinguno, tsNinguno, True);
   Desc_Grupo_Operacion := CreaCampo('DESC_GRUPO_OPERACION', ftString, tsNinguno, tsNinguno, True);

   FKeyFields.Add('CVE_GRUPO_OPERACION');

   TableName       := 'CTO_OPERACION_GRUPO';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TCtoOpGpo.Destroy;
begin
   inherited;
end;

procedure TCtoOpGpo.DataBaseChange;
begin
   inherited;
end;

function TCtoOpGpo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWCtoOpGpo;
begin
   W := TWCtoOpGpo.Create(Self);
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

function TCtoOpGpo.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITCTOOPGPO.IT', 'S');
   try
      if Active    then   T.Param(0, Cve_Grupo_Operacion.AsString);
      if T.Execute then   InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

procedure TWCtoOpGpo.FormShow(Sender: TObject);
begin
   Objeto.Cve_Grupo_Operacion.Control  := ieCveGpoOp;
   Objeto.Desc_Grupo_Operacion.Control := ieDescGpoOp;
end;

procedure TWCtoOpGpo.FormDestroy(Sender: TObject);
begin
   Objeto.Cve_Grupo_Operacion.Control  := nil;
   Objeto.Desc_Grupo_Operacion.Control := nil;
end;

procedure TWCtoOpGpo.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if trim(Cve_Grupo_Operacion.AsString) = '' then
         begin
            ieCveGpoOp.SetFocus;
            raise EInterFrame.Create('Ingrese una Clave');
         end;
         if trim(Desc_Grupo_Operacion.AsString) = '' then
         begin
            ieDescGpoOp.SetFocus;
            raise EInterFrame.Create('Ingrese una Descripcion');
         end;
         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from cto_operacion_grupo '
                    + ' where cve_grupo_operacion = ' + Cve_Grupo_Operacion.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('El Grupo de Operacion por Contrato ya existe');
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

procedure TWCtoOpGpo.InterForma1DespuesNuevo(Sender: TObject);
begin
   ieCveGpoOp.SetFocus;
end;

procedure TWCtoOpGpo.InterForma1DespuesModificar(Sender: TObject);
begin
   ieDescGpoOp.SetFocus;
end;

procedure TWCtoOpGpo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
