//------------------------------------------------------------------------------
// Función    : Tipo de Operacion por Contrato
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 14 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntCtoOpTipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntFrm,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind, UnSQL2,
  InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit, IntCtoOpGpo;

Type
  TCtoOpTipo = Class;

  TWCtoOpTipo = Class(TForm)
    InterForma1 : TInterForma;
    lGrupo: TLabel;
    lClave: TLabel;
    lDescripcion: TLabel;
    ieDescTipoOp: TInterEdit;
    ieCveTipoOp: TInterEdit;
    ieCveGpoOp: TInterEdit;
    sbGrupo: TSpeedButton;
    eDescGpoOp: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbGrupoClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
       { Private declarations }
    public
       { Public declarations }
       Objeto : TCtoOpTipo;
    end;

  TCtoOpTipo = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
    public
       { Public declarations }
       Grupo : TCtoOpGpo;

       Cve_Tipo_Operacion  : TInterCampo;
       Desc_Tipo_Operacion : TInterCampo;
       Cve_Grupo_Operacion : TInterCampo;

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

constructor TCtoOpTipo.Create( AOwner : TComponent );
begin
   Inherited;

   Grupo              := TCtoOpGpo.Create(Self);
   Grupo.MasterSource := Self;
   Grupo.FieldByName('CVE_GRUPO_OPERACION').MasterField := 'CVE_GRUPO_OPERACION';

   Cve_Tipo_Operacion  := CreaCampo('CVE_TIPO_OPERACION',  ftString, tsNinguno, tsNinguno, True);
   Desc_Tipo_Operacion := CreaCampo('DESC_TIPO_OPERACION', ftString, tsNinguno, tsNinguno, True);
   Cve_Grupo_Operacion := CreaCampo('CVE_GRUPO_OPERACION', ftString, tsNinguno, tsNinguno, True);

   FKeyFields.Add('CVE_TIPO_OPERACION');

   TableName       := 'CTO_OPERACION_TIPO';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TCtoOpTipo.Destroy;
begin
   inherited;
end;

procedure TCtoOpTipo.DataBaseChange;
begin
   inherited;
   Grupo.GetParams(Self);
end;

function TCtoOpTipo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWCtoOpTipo;
begin
   W := TWCtoOpTipo.Create(Self);
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

function TCtoOpTipo.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITCTOOPTIPO.IT', 'S');
   try
      if Active then      T.Param(0, Cve_Tipo_Operacion.AsString);
      if T.Execute then   InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

procedure TWCtoOpTipo.sbGrupoClick(Sender: TObject);
begin
   Objeto.Grupo.Busca;
end;

procedure TWCtoOpTipo.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Grupo.Cve_Grupo_Operacion.Control  := ieCveGpoOp;
      Grupo.Desc_Grupo_Operacion.Control := eDescGpoOp;
      Grupo.ShowMenuCatalogo             := True;
      Grupo.ShowMenuReporte              := False;
      Grupo.ShowMenuClear                := False;
      ieCveGpoOp.PopupMenu               := Grupo.PopMenu;
      Cve_Tipo_Operacion.Control         := ieCveTipoOp;
      Desc_Tipo_Operacion.Control        := ieDescTipoOp;
   end;
end;

procedure TWCtoOpTipo.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Grupo.Cve_Grupo_Operacion.Control  := nil;
      Grupo.Desc_Grupo_Operacion.Control := nil;
      Cve_Tipo_Operacion.Control         := nil;
      Desc_Tipo_Operacion.Control        := nil;
   end;
end;

procedure TWCtoOpTipo.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if trim(Grupo.Cve_Grupo_Operacion.AsString) = '' then
         begin
            ieCveGpoOp.SetFocus;
            raise EInterFrame.Create('Seleccione un Grupo');
         end;
         if trim(Cve_Tipo_Operacion.AsString) = '' then
         begin
            ieCveTipoOp.SetFocus;
            raise EInterFrame.Create('Ingrese una Clave');
         end;
         if trim(Desc_Tipo_Operacion.AsString) = '' then
         begin
            ieDescTipoOp.SetFocus;
            raise EInterFrame.Create('Ingrese una Descripcion');
         end;
         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from cto_operacion_tipo '
                    + ' where cve_tipo_operacion = ' + Cve_Tipo_Operacion.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('El Tipo de Operacion por Contrato ya existe');
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

procedure TWCtoOpTipo.InterForma1DespuesNuevo(Sender: TObject);
begin
   ieCveGpoOp.SetFocus;
end;

procedure TWCtoOpTipo.InterForma1DespuesModificar(Sender: TObject);
begin
   ieCveGpoOp.SetFocus;
end;

procedure TWCtoOpTipo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
