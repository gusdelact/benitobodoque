//------------------------------------------------------------------------------
// Función    : Reporte de Documentacion de Contratos y Contratantes
// Desarrollo : Alberto Ramírez Pacheco
// Modifico   : Cesar Zamora Ramirez
// Fecha      : Agosto 2004
//------------------------------------------------------------------------------
unit UnCtoBitInactiva;

interface
 
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, UnGene,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntWFind, InterApl,
  IntEmpre, Intunneg, IntGCto, IntCtto, IntLinkit, IntTCto, IntProd, IntMotIna;

type
  TCtoBitIn = class;

  TWCtoBitInactiva = class(TForm)
    InterForma1: TInterForma;
    pnPrincipal: TPanel;
    sbEmpresa: TSpeedButton;
    edNomEmpresa: TEdit;
    Label1: TLabel;
    edIdEmpresa: TEdit;
    linkEmpresa: TInterLinkit;
    sbTipoCtto: TSpeedButton;
    edNomTipoCtto: TEdit;
    Label3: TLabel;
    edIdTipoCtto: TEdit;
    linkTipoCtto: TInterLinkit;
    Label4: TLabel;
    edCveProducto: TEdit;
    sbProducto: TSpeedButton;
    edNomProducto: TEdit;
    linkProducto: TInterLinkit;
    Label6: TLabel;
    edIdPromotor: TEdit;
    sbPromotor: TSpeedButton;
    edNomPromotor: TEdit;
    linkPromotor: TInterLinkit;
    Label7: TLabel;
    sbContrato: TSpeedButton;
    edNomCliente: TEdit;
    linkContrato: TInterLinkit;
    edIdContrato: TInterEdit;
    GroupBox2: TGroupBox;
    chkSitAC: TCheckBox;
    chkSitIN: TCheckBox;
    chkSitDB: TCheckBox;
    chkSitBL: TCheckBox;
    chkSitAll: TCheckBox;
    Label5: TLabel;
    edFProcesoIni: TEdit;
    InterDateTimePicker1: TInterDateTimePicker;
    Label2: TLabel;
    edFProcesoFin: TEdit;
    InterDateTimePicker2: TInterDateTimePicker;
    Label8: TLabel;
    edCveMotivo: TEdit;
    sbMotivo: TSpeedButton;
    edDescMotivo: TEdit;
    linkMotivo: TInterLinkit;
    chkSitBP: TCheckBox;
    chkSitDP: TCheckBox;
    Label9: TLabel;
    chkSitCA: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure linkEmpresaCapture(Sender: TObject; var Show: Boolean);
    procedure linkTipoCttoCapture(Sender: TObject; var Show: Boolean);
    procedure linkProductoCapture(Sender: TObject; var Show: Boolean);
    procedure linkUnidadCapture(Sender: TObject; var Show: Boolean);
    procedure linkPromotorCapture(Sender: TObject; var Show: Boolean);
    procedure linkContratoCapture(Sender: TObject; var Show: Boolean);
    procedure linkEmpresaEjecuta(Sender: TObject);
    procedure linkTipoCttoEjecuta(Sender: TObject);
    procedure linkProductoEjecuta(Sender: TObject);
    procedure linkPromotorEjecuta(Sender: TObject);
    procedure linkContratoEjecuta(Sender: TObject);
    procedure sbEmpresaClick(Sender: TObject);
    procedure sbTipoCttoClick(Sender: TObject);
    procedure sbProductoClick(Sender: TObject);
    procedure sbPromotorClick(Sender: TObject);
    procedure sbContratoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1Imprimir(Sender: TObject);
    procedure sbMotivoClick(Sender: TObject);
    procedure linkMotivoCapture(Sender: TObject; var Show: Boolean);
    procedure linkMotivoEjecuta(Sender: TObject);
    procedure chkSitAllClick(Sender: TObject);
    procedure InterForma1BtnAyudaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TCtoBitIn;
  end;

  TCtoBitIn = class(TInterFrame)
  private
    { Private declarations }
    procedure Impresion(Preview: Boolean);
  protected
    { Protected declarations }
  public
    { Public declarations }
    FProcesoIni   : TInterCampo;
    FProcesoFin   : TInterCampo;
    SitALL        : TInterCampo;
    SitAC         : TInterCampo;
    SitIN         : TInterCampo;
    SitBL         : TInterCampo;
    SitDB         : TInterCampo;
    SitBP         : TInterCampo;
    SitDP         : TInterCampo;
    SitCA         : TInterCampo;

    Empresa       : TEmpresa;
    Contrato      : TContrato;
    Promotor      : TGpoCto;
    TipoContrato  : TTipoCto;
    Producto      : TProducto;
    Motivo        : TMotIna;

    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    procedure   DataBaseChange; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte: Boolean; override;
    function    UltimoProceso: Integer;
  published
    { Published declarations }
  end;
implementation
uses UnRpCtoBitInactiva;
{$R *.DFM}

constructor TCtoBitIn.Create( AOwner : TComponent );
begin
   Inherited;

   FProcesoIni := CreaCampo('FProcesoIni', ftDate,    tsNinguno, tsNinguno, False);
   FProcesoFin := CreaCampo('FProcesoFin', ftDate,    tsNinguno, tsNinguno, False);
   SitALL      := CreaCampo('SitALL',      ftBoolean, tsNinguno, tsNinguno, False);
   SitAC       := CreaCampo('SitAC',       ftBoolean, tsNinguno, tsNinguno, False);
   SitIN       := CreaCampo('SitIN',       ftBoolean, tsNinguno, tsNinguno, False);
   SitBL       := CreaCampo('SitBL',       ftBoolean, tsNinguno, tsNinguno, False);
   SitDB       := CreaCampo('SitBD',       ftBoolean, tsNinguno, tsNinguno, False);
   SitBP       := CreaCampo('SitBP',       ftBoolean, tsNinguno, tsNinguno, False);
   SitDP       := CreaCampo('SitDP',       ftBoolean, tsNinguno, tsNinguno, False);
   SitCA       := CreaCampo('SitCA',       ftBoolean, tsNinguno, tsNinguno, False);
   SitAll.SetAsString('V');

   Empresa      := TEmpresa.Create(Self);
   Promotor     := TGpoCto.Create(Self);
   Contrato     := TContrato.Create(Self);
   TipoContrato := TTipoCto.Create(Self);
   Producto     := TProducto.Create(Self);
   Motivo       := TMotIna.Create(Self);

   Empresa.MasterSource      := Self;
   Promotor.MasterSource     := Self;
   Contrato.MasterSource     := Self;
   TipoContrato.MasterSource := Self;
   Producto.MasterSource     := Self;
   Motivo.MasterSource       := Self;

   Empresa.ShowMenuClear      := True;
   Contrato.ShowMenuClear     := True;
   Promotor.ShowMenuClear     := True;
   TipoContrato.ShowMenuClear := True;
   Producto.ShowMenuClear     := True;
   Motivo.ShowMenuClear       := True;

   ShowMenuReporte := True;
end;

destructor TCtoBitIn.Destroy;
begin
   if Empresa      <> nil then Empresa.Free;
   if Contrato     <> nil then Contrato.Free;
   if Promotor     <> nil then Promotor.Free;
   if TipoContrato <> nil then TipoContrato.Free;
   if Producto     <> nil then Producto.Free;
   if Motivo       <> nil then Motivo.Free;
   inherited;
end;

procedure TCtoBitIn.DataBaseChange;
begin
   inherited;
   Empresa.GetParams(self);
   Contrato.GetParams(self);
   Promotor.GetParams(self);
   TipoContrato.GetParams(self);
   Producto.GetParams(self);
   Motivo.GetParams(self);
end;

function TCtoBitIn.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W: TWCtoBitInactiva;
begin
   W := TWCtoBitInactiva.Create(Self);
   Try
      W.Objeto := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := ftImprimir;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TCtoBitIn.UltimoProceso: Integer;
var
   Qry : TQuery;
begin
   UltimoProceso := 0;
   Qry := GetQuery('SELECT SQ01_CTO_BIT_INACTIVA_GProceso.CURRVAL AS SECUENCIA FROM DUAL', False);
   if Qry <> nil then
   begin
      try
         UltimoProceso := Qry.FieldByName('SECUENCIA').AsInteger;
      finally
         FreeAndNil(Qry);
      end;
   end;
end;

function TCtoBitIn.Reporte:Boolean;
begin
   Execute_RepCtoBitInactiva(True, Self);
end;

procedure TCtoBitIn.Impresion(Preview: Boolean);
begin
   GetFromControl;
   if (not FProcesoFin.IsNull) and (not FProcesoIni.IsNull) and (FProcesoFin.AsDateTime < FProcesoIni.AsDateTime) then
      InterMsg(tmCuidado, '', 0, 'Revise que la fecha final sea mayor o igual que la inicial')
   else
      Execute_RepCtoBitInactiva(Preview, Self);
end;

procedure TWCtoBitInactiva.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      FProcesoIni.Control                   := edFProcesoIni;
      FProcesoFin.Control                   := edFProcesoFin;
      SitALL.Control                        := chkSitAll;
      SitAC.Control                         := chkSitAC;
      SitIN.Control                         := chkSitIN;
      SitBL.Control                         := chkSitBL;
      SitDB.Control                         := chkSitDB;
      SitBP.Control                         := chkSitBP;
      SitDP.Control                         := chkSitDP;
      SitCA.Control                         := chkSitCA;
      Empresa.ID_Empresa.Control            := edIdEmpresa;
      Empresa.PersonaMoral.Nombre.Control   := edNomEmpresa;
      Contrato.ID_Contrato.Control          := edIdContrato;
      Contrato.TITNOMBRE.Control            := edNomCliente;
      Promotor.NUM_PROMOTOR.Control         := edIdPromotor;
      Promotor.PROMASOCIADO.Nombre.Control  := edNomPromotor;
      TipoContrato.Cve_Tip_Contrato.Control := edIdTipoCtto;
      TipoContrato.Desc_Tipo_Contra.Control := edNomTipoCtto;
      Producto.Cve_Producto.Control         := edCveProducto;
      Producto.Desc_Producto.Control        := edNomProducto;
      Motivo.Cve_Motivo.Control             := edCveMotivo;
      Motivo.DESC_MOTIVO.Control            := edDescMotivo;
      edIdEmpresa.PopupMenu                 := Empresa.PopMenu;
      edIdContrato.PopupMenu                := Contrato.PopMenu;
      edIdPromotor.PopupMenu                := Promotor.PopMenu;
      edIdTipoCtto.PopupMenu                := TipoContrato.PopMenu;
      edCveProducto.PopupMenu               := Producto.PopMenu;
      edCveMotivo.PopupMenu                 := Motivo.PopMenu;
      InterForma1.F.btAyuda.Caption         := '&Limpiar';
      InterForma1.F.btAyuda.Hint            := 'Limpiar campos';
      DrawControl;
   end;
end;

procedure TWCtoBitInactiva.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      FProcesoIni.Control                   := nil;
      FProcesoFin.Control                   := nil;
      SitALL.Control                        := nil;
      SitAC.Control                         := nil;
      SitIN.Control                         := nil;
      SitBL.Control                         := nil;
      SitDB.Control                         := nil;
      SitBP.Control                         := nil;
      SitDP.Control                         := nil;
      SitCA.Control                         := nil;
      Empresa.ID_Empresa.Control            := nil;
      Empresa.PersonaMoral.Nombre.Control   := nil;
      Contrato.ID_Contrato.Control          := nil;
      Contrato.TITNOMBRE.Control            := nil;
      Promotor.NUM_PROMOTOR.Control         := nil;
      Promotor.PROMASOCIADO.Nombre.Control  := nil;
      TipoContrato.Cve_Tip_Contrato.Control := nil;
      TipoContrato.Desc_Tipo_Contra.Control := nil;
      Producto.Cve_Producto.Control         := nil;
      Producto.Desc_Producto.Control        := nil;
      Motivo.CVE_MOTIVO.Control             := nil;
      Motivo.DESC_MOTIVO.Control            := nil;
   end;
end;

procedure TWCtoBitInactiva.sbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.Busca;
end;

procedure TWCtoBitInactiva.sbTipoCttoClick(Sender: TObject);
begin
   if Objeto.TipoContrato.Busca then
   begin
      Objeto.Producto.Active := False;
      Objeto.Producto.BuscaWhereString:= 'Producto.Cve_Tip_Contrato = ' + QuotedStr(Objeto.TipoContrato.Cve_Tip_Contrato.AsString);
   end;
end;

procedure TWCtoBitInactiva.sbProductoClick(Sender: TObject);
begin
   Objeto.Producto.Busca;
end;

procedure TWCtoBitInactiva.sbPromotorClick(Sender: TObject);
begin
   Objeto.Promotor.Busca;
end;

procedure TWCtoBitInactiva.sbContratoClick(Sender: TObject);
begin
   Objeto.Contrato.Busca;
end;

procedure TWCtoBitInactiva.sbMotivoClick(Sender: TObject);
begin
   Objeto.Motivo.Busca;
end;

procedure TWCtoBitInactiva.linkEmpresaCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWCtoBitInactiva.linkTipoCttoCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWCtoBitInactiva.linkProductoCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWCtoBitInactiva.linkUnidadCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWCtoBitInactiva.linkPromotorCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWCtoBitInactiva.linkContratoCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWCtoBitInactiva.linkMotivoCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWCtoBitInactiva.linkEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([linkEmpresa.Buffer]);
end;

procedure TWCtoBitInactiva.linkTipoCttoEjecuta(Sender: TObject);
begin
   if Objeto.TipoContrato.FindKey([linkTipoCtto.Buffer]) then
   begin
      Objeto.Producto.Active := False;
      Objeto.Producto.BuscaWhereString := 'Producto.Cve_Tip_Contrato = ' + QuotedStr(Objeto.TipoContrato.Cve_Tip_Contrato.AsString);
   end;
end;

procedure TWCtoBitInactiva.linkProductoEjecuta(Sender: TObject);
begin
   Objeto.Producto.FindKey([linkProducto.Buffer]);
end;

procedure TWCtoBitInactiva.linkPromotorEjecuta(Sender: TObject);
var
   Qry : TQuery;
begin
   Qry := GetSQLQuery('SELECT ID_PERS_ASOCIAD, ID_GRUPO FROM GPO_CONTRATO WHERE NUM_PROMOTOR = ' + linkPromotor.Buffer, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
   if Qry = nil then
      Objeto.Promotor.Active := False
   else
      try
         Objeto.Promotor.FindKey([Qry.FieldByName('ID_PERS_ASOCIAD').AsString, Qry.FieldByName('ID_GRUPO').AsString]);
      finally
         FreeAndNil(Qry);
      end;
end;

procedure TWCtoBitInactiva.linkContratoEjecuta(Sender: TObject);
begin
   Objeto.Contrato.FindKey([linkContrato.Buffer]);
end;

procedure TWCtoBitInactiva.linkMotivoEjecuta(Sender: TObject);
begin
   Objeto.Motivo.FindKey([linkMotivo.Buffer]);
end;

procedure TWCtoBitInactiva.InterForma1BtnPreviewClick(Sender: TObject);
begin
   Objeto.Impresion(True);
end;

procedure TWCtoBitInactiva.InterForma1Imprimir(Sender: TObject);
begin
   Objeto.Impresion(False);
end;

procedure TWCtoBitInactiva.chkSitAllClick(Sender: TObject);
begin
   chkSitAC.Enabled:= not chkSitAll.Checked;
   chkSitIN.Enabled:= not chkSitAll.Checked;
   chkSitBL.Enabled:= not chkSitAll.Checked;
   chkSitDB.Enabled:= not chkSitAll.Checked;
   chkSitBP.Enabled:= not chkSitAll.Checked;
   chkSitDP.Enabled:= not chkSitAll.Checked;
   chkSitCA.Enabled:= not chkSitAll.Checked;
end;

procedure TWCtoBitInactiva.InterForma1BtnAyudaClick(Sender: TObject);
begin
   with Objeto do
   begin
      Empresa.Active      := False;
      Contrato.Active     := False;
      Promotor.Active     := False;
      TipoContrato.Active := False;
      Producto.Active     := False;
      Motivo.Active       := False;
      FieldsClear;
      SitALL.SetAsString('V');
   end;
end;

procedure TWCtoBitInactiva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;
end.


