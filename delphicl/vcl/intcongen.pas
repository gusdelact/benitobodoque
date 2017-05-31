unit IntConGen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, InterEdit, IntCtto, IntFrm, InterFor, db,
  dbtables, UnSQL2, Grids, DBGrids, Buttons, Wwdbigrd, Wwquery, Wwdatsrc,
  Wwdbgrid, IntCtoHeader, DBCtrls, DBCGrids, Mask, wwdbedit, UnSubGen,
  IntDocumCtto, IntSGCtrl;

Const WM_DespuesShow=WM_USER+1;
		WM_DespuesShowDoc=WM_USER+2;

type
  TConInfGen = class;

  TwConInfoGen = class(TForm)
	 lbTitulo: TLabel;
	 Label2: TLabel;
	 Label26: TLabel;
	 edContrato: TInterEdit;
	 lbMensajeContrato: TLabel;
	 TabSheet1: TTabSheet;
	 TabSheet2: TTabSheet;
	 TabSheet3: TTabSheet;
	 TabSheet4: TTabSheet;
	 TabSheet5: TTabSheet;
	 TabSheet6: TTabSheet;
	 TabSheet7: TTabSheet;
	 InterForma1: TInterForma;
	 Panel1: TPanel;
	 Label3: TLabel;
	 edTitular: TLabel;
	 Label4: TLabel;
	 edProducto: TLabel;
	 Label5: TLabel;
	 edPromotor: TLabel;
	 Label6: TLabel;
	 edEmpresa: TLabel;
	 Label7: TLabel;
	 Label12: TLabel;
	 Label8: TLabel;
	 dsTitular: TwwDataSource;
	 qTitular: TwwQuery;
	 qCotitular: TwwQuery;
	 dsCotitular: TwwDataSource;
	 qBeneficiario: TwwQuery;
	 dsBeneficiario: TwwDataSource;
	 gTitular: TwwDBGrid;
	 qTitularNOMBRE: TStringField;
	 qTitularCVE_TIPO_FIRMA: TStringField;
	 qTitularRFC: TStringField;
	 qTitularID_PERSONA: TFloatField;
	 gCotitular: TwwDBGrid;
	 gBeneficiario: TwwDBGrid;
	 qCotitularNOMBRE: TStringField;
	 qCotitularCVE_TIPO_FIRMA: TStringField;
	 qCotitularRFC: TStringField;
	 qCotitularID_PERSONA: TFloatField;
	 qBeneficiarioNOMBRE: TStringField;
	 qBeneficiarioPCT_BENEFICIO: TFloatField;
	 Label19: TLabel;
	 edMoneda: TLabel;
	 Label21: TLabel;
	 edConcepto: TLabel;
	 Label23: TLabel;
	 edSegmento: TLabel;
	 GroupBox1: TGroupBox;
	 Label14: TLabel;
	 edFAlta: TEdit;
	 Label11: TLabel;
	 cbCorrespondencia: TComboBox;
	 edCorrespondencia: TEdit;
	 Label10: TLabel;
	 cbTipoCuenta: TComboBox;
	 edTipoCuenta: TEdit;
	 gbCIBC: TGroupBox;
	 cbDiscrecional: TComboBox;
	 Label9: TLabel;
	 edDiscrecional: TEdit;
	 gbCDVI: TGroupBox;
	 edCveRegimen: TEdit;
	 Label13: TLabel;
	 edCombFirmas: TEdit;
	 Label15: TLabel;
	 cbCveRegimen: TComboBox;
	 gbFide: TGroupBox;
	 Label28: TLabel;
	 cbCveTipoFide: TComboBox;
	 edIdContraDV: TEdit;
	 Label27: TLabel;
	 Label29: TLabel;
	 edIDContraIB: TEdit;
	 edCveTipoFide: TEdit;
	 Label1: TLabel;
	 edCveSegObjetivo: TEdit;
	 Label24: TLabel;
	 edFIniPzoObj: TEdit;
	 Label25: TLabel;
	 edPlazoObjetivo: TEdit;
	 Label16: TLabel;
	 edSdoPosLiquida: TEdit;
	 Label17: TLabel;
	 edSitContrato: TEdit;
	 Label18: TLabel;
	 gDocCtto: TwwDBGrid;
	 qDocCtto: TwwQuery;
	 dsDocCtto: TwwDataSource;
	 qDocCttoINTERMEDIACION: TFloatField;
	 qDocCttoAPERTURA: TFloatField;
	 qDocCttoASIGNACION: TFloatField;
	 qDocCttoPROSPECTO: TFloatField;
	 qDocCttoCONVENIO: TFloatField;
	 qDocCttoRECOMPRA: TFloatField;
	 qDocCttoMANUAL: TFloatField;
	 qDocCtteDet: TwwQuery;
	 dsDocCtte: TwwDataSource;
	 qDocAdic: TwwQuery;
	 dsDocAdic: TwwDataSource;
	 gDocCtte: TwwDBGrid;
	 Label22: TLabel;
	 gDocAdic: TwwDBGrid;
	 qCtte2: TwwQuery;
	 qDocCtte: TwwQuery;
	 StringField14: TStringField;
	 StringField15: TStringField;
	 StringField16: TStringField;
	 StringField17: TStringField;
	 StringField18: TStringField;
	 StringField19: TStringField;
	 StringField20: TStringField;
	 StringField21: TStringField;
	 StringField22: TStringField;
	 StringField23: TStringField;
	 qDocCtteID_CONTRATO: TFloatField;
	 qDocCtteID_PERSONA: TFloatField;
	 qDocCtteNUM_COTITULAR: TFloatField;
	 qDocCtteCVE_CONTRATANTE: TStringField;
	 qDocCttoCompleto: TStringField;
	 Label20: TLabel;
	 edStatusContrato: TLabel;
	 dsCtte2: TwwDataSource;
	 qDomicilio: TwwQuery;
	 dsDomicilio: TwwDataSource;
	 qCtte2NOMBRE: TStringField;
	 qCtte2DESC_CONTRATANTE: TStringField;
	 qCtte2DOM_CONTRATO: TFloatField;
	 qCtte2DOM_PERSONA: TFloatField;
	 qCtte2Domicilio: TStringField;
	 qCtte2TELEF_FAX: TStringField;
	 qCtte2TELEF_CASA: TStringField;
	 qCtte2TELEF_OFICINA: TStringField;
	 qCtte2Telefonos: TStringField;
	 qDomicilioCALLE_NUMERO: TStringField;
	 qDomicilioCODIGO_POSTAL: TStringField;
	 qCtte: TwwQuery;
	 dsCtte: TwwDataSource;
	 qCtteNOMBRE: TStringField;
	 qCtteDESC_CONTRATANTE: TStringField;
	 qCtteDOM_PERSONA: TFloatField;
	 qCtteTELEF_FAX: TStringField;
	 qCtteTELEF_CASA: TStringField;
	 qCtteTELEF_OFICINA: TStringField;
	 qCtteCODIGO_POSTAL: TStringField;
	 qCtteID_DOMICILIO: TFloatField;
	 gReq: TwwDBGrid;
	 qReq: TwwQuery;
	 dsReq: TwwDataSource;
	 Panel9: TPanel;
	 Panel8: TPanel;
	 Panel7: TPanel;
	 Panel6: TPanel;
	 gDomicilio: TDBCtrlGrid;
	 Bevel5: TBevel;
	 Bevel6: TBevel;
	 Bevel7: TBevel;
	 Bevel8: TBevel;
	 DBText12: TDBText;
	 DBText13: TDBText;
	 DBText14: TDBText;
	 DBText15: TDBText;
	 DBText16: TDBText;
	 DBText17: TDBText;
	 DBText18: TDBText;
	 DBText19: TDBText;
	 Label33: TLabel;
	 Label35: TLabel;
	 Label36: TLabel;
	 DBText20: TDBText;
	 Label37: TLabel;
	 DBText21: TDBText;
	 DBText22: TDBText;
	 Panel2: TPanel;
	 Panel3: TPanel;
	 gChequera: TDBCtrlGrid;
	 Bevel1: TBevel;
	 Bevel2: TBevel;
	 DBText1: TDBText;
	 DBText2: TDBText;
	 DBText3: TDBText;
	 DBText4: TDBText;
	 DBText5: TDBText;
	 Label34: TLabel;
	 DBText10: TDBText;
	 DBText11: TDBText;
	 qCheq: TwwQuery;
	 dsCheq: TwwDataSource;
	 Label30: TLabel;
	 Label31: TLabel;
	 Label32: TLabel;
	 qCheqNOMBRE: TStringField;
	 qCheqDESC_CONTRATANTE: TStringField;
	 qCheqCUENTA_BANCO: TStringField;
	 qCheqNOM_BANCO: TStringField;
	 qCheqCVE_SUC_BANCO: TStringField;
	 qCheqNOM_SUC_BANCO: TStringField;
	 qCheqNOM_PLAZA_BANCO: TStringField;
	 GroupBox2: TGroupBox;
	 GroupBox3: TGroupBox;
	 Label38: TLabel;
	 Label39: TLabel;
	 Label40: TLabel;
	 Label41: TLabel;
	 Label42: TLabel;
	 lbGrupo: TLabel;
	 lbUnNegocio: TLabel;
	 lbFAlta: TLabel;
	 lbFhModificacion: TLabel;
	 lbCveUsuarModif: TLabel;
	 qDocAdicDet: TwwQuery;
	 dsDocAdicDet: TwwDataSource;
	 qDocAdicDetID_CONTRATO: TFloatField;
	 qDocAdicDetID_PERSONA: TFloatField;
	 qDocAdicDetCVE_DOCUMENTO: TStringField;
	 qDocAdicDetNOMBRE: TStringField;
	 qDocAdicDetDESC_DOCUMENTO: TStringField;
	 edIdPromotor: TLabel;
	 edNombreTitular: TwwDBEdit;
	 Panel4: TPanel;
	 Panel5: TPanel;
	 Panel11: TPanel;
	 gPoderes: TDBCtrlGrid;
	 Bevel3: TBevel;
	 Bevel4: TBevel;
	 Bevel10: TBevel;
	 DBText23: TDBText;
	 DBText24: TDBText;
	 DBText25: TDBText;
	 DBText26: TDBText;
	 Label43: TLabel;
	 Label44: TLabel;
	 Label45: TLabel;
	 DBText28: TDBText;
	 DBText29: TDBText;
	 qPoderes: TwwQuery;
	 dsPoderes: TwwDataSource;
	 Label46: TLabel;
	 DBText6: TDBText;
	 Label47: TLabel;
	 DBText7: TDBText;
	 BitBtn1: TBitBtn;
	 Timer1: TTimer;
	 edNombreLargo: TPanel;
	 qCtteCALLE_NUMERO: TStringField;
	 PageControl1: TPageControl;
	 qTitularDESC_POBLACION: TStringField;
	 qCotitularDESC_POBLACION: TStringField;
	 qCtteCOLONIA: TStringField;
	 qCtteDESC_CIUDAD: TStringField;
	 qCtteDESC_ESTADO: TStringField;
	 qDomicilioCOLONIA: TStringField;
	 qDomicilioDESC_CIUDAD: TStringField;
	 qDomicilioDESC_ESTADO: TStringField;
	 InterGridDoctos: TSGCtrl;
    TabSheet8: TTabSheet;
    gComentario: TwwDBGrid;
    qCtte2TX_COMENTARIO: TStringField;
    qCtteTX_COMENTARIO: TStringField;
    iCteAAA: TAnimate;
    stpVerificaCteAAA: TStoredProc;
    qCtteTELEF_CEL: TStringField;
    qCtte2TELEF_CEL: TStringField;
    Label48: TLabel;
    DBText8: TDBText;
	 procedure FormShow(Sender: TObject);
	 procedure FormHide(Sender: TObject);
	 procedure edContratoCambioPrefijo(Sender: TObject);
	 procedure dChange(Sender: TObject);
	 procedure edContratoKeyPress(Sender: TObject; var Key: Char);
	 procedure qBeneficiarioPCT_BENEFICIOGetText(Sender: TField;
		var Text: String; DisplayText: Boolean);
	 procedure edSitContratoChange(Sender: TObject);
	 procedure qDocCttoINTERMEDIACIONGetText(Sender: TField;
		var Text: String; DisplayText: Boolean);
	 procedure qDocCtteCalcFields(DataSet: TDataSet);
	 procedure qDocCttoCalcFields(DataSet: TDataSet);
	 procedure gDocCtteMouseMove(Sender: TObject; Shift: TShiftState; X,
		Y: Integer);
	 procedure qCtte2CalcFields(DataSet: TDataSet);
	 procedure edFAltaChange(Sender: TObject);
	 procedure gReqCalcCellColors(Sender: TObject; Field: TField;
		State: TGridDrawState; Highlight: Boolean; AFont: TFont;
		ABrush: TBrush);
	 procedure gDocCtteEnter(Sender: TObject);
	 procedure gDocCtteExit(Sender: TObject);
	 procedure BitBtn1Click(Sender: TObject);
	 procedure Timer1Timer(Sender: TObject);
	 procedure gDocCtteDrawDataCell(Sender: TObject; const Rect: TRect;
		Field: TField; State: TGridDrawState);
  private
	 { Private declarations }
		Repeticion: Integer;
		LastRow: Integer;
		mX: Integer;
		mY: Integer;
  protected
		procedure gDocCtteTopChanged(Sender: TObject);
  public
	 { Public declarations }
		Objeto: TConInfGen;
		Procedure RefrescaConsulta;
		Procedure RefrescaQGenerales;
		Procedure RefrescaQDocumentos;
		Procedure RefrescaQDomicilios;
		Procedure RefrescaQChequeras;
		Procedure RefrescaQPoderes;
		Procedure RefrescaQComentarios;
		Procedure RefrescaQDoctosFaltantes;
		Procedure DespuesShowGeneral(Var Msg:TMessage); Message WM_DESPUESSHOW;
		Procedure DespuesShowDocumento(Var Msg:TMessage); Message WM_DESPUESSHOWDOC;
  end;

  TConInfGen = class(TInterFrame)
  private
		FContrato: TContrato;
		FStatusContrato: String;
		FDoctosFaltantes: String;
		FDoctosActuales: Boolean;
		FPoderesActuales: Boolean;
		FListaCtte: TStringList;
  protected
		Procedure SetContrato(Ctto: TContrato);
  public
		Doctos: TDocumCtto;

		Query: TQuery;
		constructor Create( AOwner : TComponent ); override;
		destructor  Destroy; override;
		function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
		Procedure  	DataBaseChange; override;
		function 	Reporte:Boolean; override;
		Procedure   Execute;

		Property 	Contrato: TContrato Read FContrato Write SetContrato;
		Property    StatusContrato: String Read FStatusContrato Write FStatusContrato;
		Property    DoctosActuales: Boolean Read FDoctosActuales Write FDoctosActuales;
		Property    PoderesActuales: Boolean Read FPoderesActuales Write FPoderesActuales;
		Property    ListaCtte: TStringList Read FListaCtte Write FListaCtte;
  end;

var
  wConInfoGen: TwConInfoGen;

Procedure Execute_Generales(Frame: TInterFrame);

implementation
{$R *.DFM}

Uses RepCtto;


Procedure Execute_Generales(Frame: TInterFrame);
Var
	Contrato: TContrato;
	Gen: TConInfGen;
Begin
	Gen:= TConInfGen.Create(nil);
	try
//		Gen.IsCheckSecu:= False;
		Gen.GetParams(Frame);

		If Frame is TContrato Then Contrato:= TContrato(Frame)
		else
		Begin
			Contrato:= TContrato.create(nil);
			Contrato.GetParams(Frame);
		end;

		If Not Contrato.Active Then
			Contrato.FindKey([Frame.FieldByName('ID_CONTRATO').asString]);
		Gen.Contrato:= Contrato;
		Gen.Catalogo;
	finally
		If Contrato <> nil Then
		Begin
			If Frame is TContrato Then Contrato:= nil
			else Contrato.Free;
		end;

		if Gen <> nil then Gen.free;
	end;

end;


constructor TConInfGen.Create( AOwner : TComponent );
begin
	inherited;
	Doctos:= TDocumCtto.Create(self);

	IsCheckSecu := False;
	Query:=TQuery.Create(self);
	ListaCtte:= TStringList.Create;
end;

destructor  TConInfGen.Destroy;
begin
	If Doctos <> nil Then Doctos.Free;
	if Query <> nil then Query.Free;
	if ListaCtte <> nil then ListaCtte.Free;
	inherited;
end;


Procedure  TConInfGen.DataBaseChange;
begin
	inherited;
	Doctos.GetParams(self);
	Query.Close;
	Query.DataBaseName:=DataBaseName;
	Query.SessionName:=SessionName;
end;


function TConInfGen.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var 	W : TwConInfoGen;
begin
	W:=TwConInfoGen.Create(Self);
	try
		W.Objeto:= Self;
		W.InterForma1.InterFrame:= Self;
		Doctos.StrGrid:= W.InterGridDoctos;
//      W.DataSource1.DataSet := Query;
		W.InterForma1.FormaTipo := ftConsulta;
		W.InterForma1.ShowGrid := False;
		W.InterForma1.ShowNavigator := False;
		W.InterForma1.Funcion := FInterFun;
		W.InterForma1.CentrarForma := True;
		W.InterForma1.ShowModal;
		ShowWindow := W.InterForma1.ModalResult;
	finally
		W.Free;
	end;
end;

Procedure TConInfGen.SetContrato(Ctto: TContrato);
begin
	FContrato := Ctto;
	If Ctto = nil then
		begin
		end
	else
		begin
		end;
end;

function TConInfGen.Reporte:Boolean;
begin
	Reporte:= False;
	if Contrato.Active Then
	begin
		Execute_RepCtto(True, Self, Contrato.ID_Contrato.AsInteger);
		Reporte:= True;
	end
	else messagedlg('No existe un contrato activo para reportar', mtError, [mbOK], 0);
end;


Procedure TConInfGen.Execute;
begin {}
end;


(***************************************************************************)
(*													FORMA	-- ENCABEZADO --					*)
(***************************************************************************)

procedure TwConInfoGen.FormShow(Sender: TObject);
begin
  if Objeto.Contrato <> nil then begin
    Objeto.Contrato.Id_contrato.Control := edContrato;
    Objeto.Contrato.Producto.Desc_Producto.Control := edProducto;
    Objeto.Contrato.TITNOMBRE.Control := edTitular;
    Objeto.Contrato.Empresa.Nombre.Control := edEmpresa;
    Objeto.Contrato.Sit_Contrato.Control := edSitContrato;
    Objeto.Contrato.Grupo.NUM_PROMOTOR.Control := edIdPromotor;
//      Objeto.Contrato.Id_Pers_Asociad.Control := edIdPromotor;
    Objeto.Contrato.Grupo.PromAutorizado.Nombre.Control := edPromotor;
    Objeto.Contrato.Segmento.Desc_Segmento.Control := edSegmento;
    Objeto.Contrato.CVE_DISCRECIONAL.Control := cbDiscrecional;
    Objeto.Contrato.Cve_Corresp.Control := cbCorrespondencia;
    Objeto.Contrato.Concepto.DESC_CONCEPTO.Control := edConcepto;
    Objeto.Contrato.Cve_Tipo_Cta.Control := cbTipoCuenta;
    Objeto.Contrato.Moneda.Desc_Moneda.Control := edMoneda;
    Objeto.Contrato.F_Alta.Control := edFAlta;
    Objeto.Contrato.COMB_FIRMAS.Control := edCombFirmas;
    Objeto.Contrato.CVE_REGIMEN.Control := cbCveRegimen;
    Objeto.Contrato.F_INI_PZO_OBJ.Control := edFIniPzoObj;
    Objeto.Contrato.SDO_POS_LIQUIDA.Control := edSdoPosLiquida;
//      Objeto.Contrato.CVE_SEG_OBJETIVO.Control := edCveSegObjetivo;
    Objeto.Contrato.CIBCSegmento.Desc_Segmento.Control:= edCveSegObjetivo;
    Objeto.Contrato.PLAZO_OBJETIVO.Control :=  edPlazoObjetivo;
    Objeto.Contrato.CVE_TIPO_FIDE.Control := cbCveTipoFide;
    Objeto.Contrato.ID_CONTRA_DV.Control := edIdContraDV;
    Objeto.Contrato.ID_CONTRA_IB.Control := edIDContraIB;
    Objeto.Contrato.Grupo.Desc_Gpo_Contrat.Control := lbGrupo;
    Objeto.Contrato.UnNegocio.Desc_Entidad.Control := lbUnNegocio;
//      Objeto.Contrato.F_Alta.Control := lbFAlta;
    Objeto.Contrato.FH_Modificacion.Control := lbFHModificacion;
    Objeto.Contrato.Cve_Usuar_Modif.Control := lbCveUsuarModif;
    edContratoCambioPrefijo(self);
    RefrescaConsulta;
    iCteAAA.Visible := Objeto.Contrato.EsClienteAAA;
    if not iCteAAA.Visible then
      iCteAAA.Visible := Objeto.Contrato.Titular.EsClienteAAA;
    if not iCteAAA.Visible then
       iCteAAA.Destroy;
  end;
  LastRow := -1;
end;

procedure TwConInfoGen.FormHide(Sender: TObject);
begin
	if Objeto.Contrato <> nil then
	begin
		Objeto.Contrato.Id_contrato.Control := nil;
		Objeto.Contrato.Producto.Desc_Producto.Control := nil;
		Objeto.Contrato.TITNOMBRE.Control := nil;
		Objeto.Contrato.Empresa.Nombre.Control := nil;
		Objeto.Contrato.Sit_Contrato.Control := nil;
		Objeto.Contrato.Grupo.NUM_PROMOTOR.Control := nil;
//      Objeto.Contrato.Id_Pers_Asociad.Control := nil;
		Objeto.Contrato.Grupo.PromAutorizado.Nombre.Control := nil;
		Objeto.Contrato.Segmento.Desc_Segmento.Control := nil;
		Objeto.Contrato.CVE_DISCRECIONAL.Control := nil;
		Objeto.Contrato.Cve_Corresp.Control := nil;
		Objeto.Contrato.Concepto.DESC_CONCEPTO.Control := nil;
		Objeto.Contrato.Cve_Tipo_Cta.Control := nil;
		Objeto.Contrato.Moneda.Desc_Moneda.Control := nil;
		Objeto.Contrato.F_Alta.Control := nil;
		Objeto.Contrato.COMB_FIRMAS.Control := nil;
		Objeto.Contrato.CVE_REGIMEN.Control := nil;
		Objeto.Contrato.F_INI_PZO_OBJ.Control := nil;
		Objeto.Contrato.SDO_POS_LIQUIDA.Control := nil;
//      Objeto.Contrato.CVE_SEG_OBJETIVO.Control := nil;
		Objeto.Contrato.CIBCSegmento.Desc_Segmento.Control:= nil;
		Objeto.Contrato.PLAZO_OBJETIVO.Control :=  nil;
		Objeto.Contrato.CVE_TIPO_FIDE.Control := nil;
		Objeto.Contrato.ID_CONTRA_DV.Control := nil;
		Objeto.Contrato.ID_CONTRA_IB.Control := nil;
		Objeto.Contrato.Grupo.Desc_Gpo_Contrat.Control := nil;
		Objeto.Contrato.UnNegocio.Desc_Entidad.Control := nil;
//      Objeto.Contrato.F_Alta.Control := nil;
		Objeto.Contrato.FH_Modificacion.Control := nil;
		Objeto.Contrato.Cve_Usuar_Modif.Control := nil;
	end;
end;

procedure TwConInfoGen.dChange(Sender: TObject);
begin
	if PageControl1.ActivePage = TabSheet1 then
	begin
		InterForma1.F.Caption := 'Consulta de Contratos y Personas [Generales]';
		lbTitulo.Caption := 'CONSULTA CONTRATOS Y PERSONAS';
	end
	else if PageControl1.ActivePage = TabSheet2 then
	begin
		InterForma1.F.Caption := 'Consulta de Contratos y Personas [Documentos]';
		lbTitulo.Caption := 'CONSULTA DE DOCUMENTOS';
	end
	else if PageControl1.ActivePage = TabSheet3 then
	begin
		InterForma1.F.Caption := 'Consulta de Contratos y Personas [Telefonos y direcciones]';
		lbTitulo.Caption := 'CONSULTA DE TELEFONOS Y DIRECCIONES';
	end
	else if PageControl1.ActivePage = TabSheet4 then
	begin
		InterForma1.F.Caption := 'Consulta de Contratos y Personas [Chequeras]';
		lbTitulo.Caption := 'CONSULTA DE CHEQUERAS';
	end
	else if PageControl1.ActivePage = TabSheet5 then
	begin
		InterForma1.F.Caption := 'Consulta de Contratos y Personas [Documentos Faltantes]';
		lbTitulo.Caption := 'CONSULTA DE DOCUMENTOS FALTANTES';
                if Not Objeto.DoctosActuales Then RefrescaQDoctosFaltantes;
	end
	else if PageControl1.ActivePage = TabSheet6 then
	begin
		InterForma1.F.Caption := 'Consulta de Contratos y Personas [Poderes]';
		lbTitulo.Caption := 'CONSULTA DATOS DE PODERES';
		if Not Objeto.PoderesActuales Then RefrescaQPoderes;
	end
	else if PageControl1.ActivePage = TabSheet7 then
	begin
		InterForma1.F.Caption := 'Consulta de Contratos y Personas [Varios]';
		lbTitulo.Caption := 'CONSULTA DATOS VARIOS';
	end;
end;

Procedure TwConInfoGen.RefrescaConsulta;
begin
	RefrescaQGenerales;
	RefrescaQDocumentos;
	RefrescaQDomicilios;
	RefrescaQChequeras;
	RefrescaQDoctosFaltantes;
	//RefrescaQPoderes;

	Objeto.DoctosActuales  := True;
	Objeto.PoderesActuales := False;
end;


procedure TwConInfoGen.edSitContratoChange(Sender: TObject);
begin
	if edSitContrato.Text = 'AC' then edSitContrato.Text := 'ACTIVO'
	else if edSitContrato.Text = 'IN' then edSitContrato.Text := 'INACTIVO'
	else if edSitContrato.Text = 'CA' then edSitContrato.Text := 'CANCELADO';
end;

procedure TwConInfoGen.edContratoKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 Then
		begin
			PageControl1.ActivePage := TabSheet1;
			TabSheet1.SetFocus;
			Objeto.Contrato.FindKey([edContrato.text]);
			edContratoCambioPrefijo(sender);
			RefrescaConsulta;
			If Not Objeto.Contrato.Active Then edContrato.SetFocus;
		end;
end;

procedure TwConInfoGen.edContratoCambioPrefijo(Sender: TObject);
var Res:String;
begin
	Res := Objeto.Contrato.Producto.TipoContrato.Desc_Tipo_Contra.AsString;
	if Res = '' then
	begin
		GetSQLStr('SELECT DESC_TIPO_CONTRA FROM TIPO_CONTRATO WHERE ID_PREFIJO_CONTR='+#39+edContrato.Prefijo+#39
				,Objeto.DataBaseName,Objeto.SessionName,'DESC_TIPO_CONTRA',Res,False);

		if Res='' then Res:=' <<< ERROR PREFIJO NO EXISTE >>>';
	end
	else edContrato.Prefijo := Objeto.Contrato.Producto.TipoContrato.Id_Prefijo_contr.AsString;

   lbMensajeContrato.Caption:= '[ '+edContrato.Prefijo+' ]  '+ Res;

{
   GetSQLStr('SELECT DESC_TIPO_CONTRA FROM TIPO_CONTRATO WHERE ID_PREFIJO_CONTR='+#39+edContrato.Prefijo+#39
            ,Objeto.DataBaseName,Objeto.SessionName,'DESC_TIPO_CONTRA',Res,False);
   if Res='' then
   begin
   	if Objeto.Contrato.Producto.TipoContrato.Id_Prefijo_contr.AsString = '' Then
      	Res:=' <<< ERROR PREFIJO NO EXISTE >>>'
      else
      begin
	      edContrato.Prefijo := Objeto.Contrato.Producto.TipoContrato.Id_Prefijo_contr.AsString;
   	   Res:='[ '+edContrato.Prefijo+' ]  '+ Objeto.Contrato.Producto.TipoContrato.Desc_Tipo_Contra.AsString;
      end;
   end;

   lbMensajeContrato.Caption:='[ '+edContrato.Prefijo+' ]  '+Res;}
end;

(***************************************************************************)
(*													FORMA	-- GENERALES --					*)
(***************************************************************************)

Procedure TwConInfoGen.DespuesShowGeneral(Var Msg:TMessage);
begin
	gbCDVI.Visible:=(Objeto.Contrato.Cve_Tip_Contrato.AsString='CDVI');
	gbCIBC.Visible:=  (Objeto.Contrato.Cve_Tip_Contrato.AsString='CIBC')
						OR (Objeto.Contrato.Cve_Tip_Contrato.AsString='IFSM')
						OR (Objeto.Contrato.Cve_Tip_Contrato.AsString='OMDC')
						OR (Objeto.Contrato.Cve_Tip_Contrato.AsString='OMDI')
						OR (Objeto.Contrato.Cve_Tip_Contrato.AsString='OMSC');
	gbFIDE.Visible:=(Objeto.Contrato.Cve_Tip_Contrato.AsString='FIDE');
end;

Procedure TwConInfoGen.RefrescaQGenerales;
begin
	qTitular.DisableControls;
	qCotitular.DisableControls;
	qBeneficiario.DisableControls;

	qTitular.Close;
	qCotitular.Close;
	qBeneficiario.Close;

	qTitular.DatabaseName := Objeto.DataBaseName;
	qCotitular.DatabaseName := Objeto.DataBaseName;
	qBeneficiario.DatabaseName := Objeto.DataBaseName;
	qTitular.SessionName := Objeto.SessionName;
	qCotitular.SessionName := Objeto.SessionName;
	qBeneficiario.SessionName := Objeto.SessionName;

	qTitular.ParamByName('Id_contrato').asString := Objeto.Contrato.ID_Contrato.AsString;    //edContrato.Text;
	qCotitular.ParamByName('Id_contrato').asString := Objeto.Contrato.ID_Contrato.AsString;    //edContrato.Text;
	qBeneficiario.ParamByName('Id_contrato').asString := Objeto.Contrato.ID_Contrato.AsString;    //edContrato.Text;

	qTitular.Open;
	qCotitular.Open;
	qBeneficiario.Open;

	qTitular.EnableControls;
	qCotitular.EnableControls;
	qBeneficiario.EnableControls;

	gTitular.ShowVertScrollBar     := (qTitular.RecordCount > 1);
	gCotitular.ShowVertScrollBar   := (qCotitular.RecordCount > 4);
	gBeneficiario.ShowVertScrollBar:= (qBeneficiario.RecordCount > 4);

	edDiscrecional.Text := cbDiscrecional.Text;
	edCorrespondencia.text := cbCorrespondencia.text;
	edTipoCuenta.Text := cbTipoCuenta.Text;
	edCveRegimen.Text := cbCveRegimen.Text;
	edCveTipoFide.Text := cbCveTipoFide.Text;

	gDocCtte.OnTopRowChanged := gDocCtteTopChanged;

	PostMessage(Handle,WM_DESPUESSHOW,0,0);
{   if gbCDVI.Visible Then gbCDVI.BringToFront
	else if gbCIBC.Visible Then gbCIBC.BringToFront
	else if gbFIDE.Visible Then gbFIDE.BringToFront;}
end;


procedure TwConInfoGen.qBeneficiarioPCT_BENEFICIOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	If qBeneficiario.FieldByName('PCT_BENEFICIO').asString <> '' Then
		Text := '% BENEFICIO:  ' + qBeneficiario.FieldByName('PCT_BENEFICIO').asString
	else	Text := '';
end;

(***************************************************************************)
(*													FORMA	-- DOCUMENTOS --					*)
(***************************************************************************)

Procedure TwConInfoGen.RefrescaQDocumentos;
var SQL, Union, Nombre: String;
	 Cont: Integer;
	 LastName: String;
begin
	If (Objeto.Contrato.Cve_Tip_Contrato.AsString = 'IFSM') or
   	(Objeto.Contrato.Cve_Tip_Contrato.AsString = 'IFON') Then
	Begin
		InterGridDoctos.Visible:= True;
		InterGridDoctos.BringToFront;
		Objeto.Doctos.StrGrid:= InterGridDoctos;
		Objeto.Doctos.Id_Contrato.AsInteger:= Objeto.Contrato.Id_Contrato.asInteger;
		Objeto.Doctos.Cve_Tip_Contrato.asString:= Objeto.Contrato.Cve_Tip_Contrato.AsString;
		Objeto.Doctos.Sit_Doctos.AsInteger:= 2;
		Objeto.Doctos.ShowHeader:= False;
		Objeto.Doctos.Execute(True);
	end
	else 
	Begin
		InterGridDoctos.Visible:= False;
		InterGridDoctos.SendToBack;
	end;
	
	LastName:= '';
	Objeto.StatusContrato := 'COMPLETO';
	Objeto.ListaCtte.Clear;

	qDocCtto.DisableControls;
	qDocCtte.DisableControls;
	qDocCtteDet.DisableControls;
	qDocAdic.DisableControls;

	qDocCtto.Close;
	qDocCtteDet.Close;
	qDocCtte.Close;
	qDocAdicDet.Close;
	qDocAdic.Close;

	qDocCtto.DatabaseName := Objeto.DataBaseName;
	qDocCtte.DatabaseName := Objeto.DataBaseName;
	qDocCtteDet.DatabaseName := Objeto.DataBaseName;
	qDocAdic.DatabaseName := Objeto.DataBaseName;
	qDocAdicDet.DatabaseName := Objeto.DataBaseName;
	qDocCtto.SessionName := Objeto.SessionName;
	qDocCtte.SessionName := Objeto.SessionName;
	qDocCtteDet.SessionName := Objeto.SessionName;
	qDocAdic.SessionName := Objeto.SessionName;
	qDocAdicDet.SessionName := Objeto.SessionName;

	qDocCtto.ParamByName('Id_contrato').asString := Objeto.Contrato.ID_Contrato.AsString;    //edContrato.Text;
	qDocCtte.ParamByName('Id_contrato').asString := Objeto.Contrato.ID_Contrato.AsString;    //edContrato.Text;
	qDocAdicDet.ParamByName('Id_contrato').asString := Objeto.Contrato.ID_Contrato.AsString;    //edContrato.Text;

																			{ARMA qDOC_ADIC}
	SQL:= '';
	Union := ' ';
	Cont:= 0;
	qDocAdicDet.Open;
	if qDocAdicDet.IsEmpty Then SQL := 'SELECT '' '' as Nombre, '' '' as Documento from DUAL'
	else
	begin
		qDocAdicDet.First;
		While (not qDocAdicDet.EOF) do
		Begin
			Inc(Cont);
			if LastName <> qDocAdicDet.FieldByName('NOMBRE').asString Then
			begin
				Nombre := '''' + qDocAdicDet.FieldByName('NOMBRE').asString + '''';
				LastName := qDocAdicDet.FieldByName('NOMBRE').asString;
			end
			else Nombre:= ''' ''';

			SQL:= SQL + Union + '(SELECT '+ IntToStr(Cont) + ' Num, ' + Nombre + ' Nombre, ''' + qDocAdicDet.FieldByName('DESC_DOCUMENTO').asString + ''' Documento FROM DUAL)';
			Union := ' UNION ';
			qDocAdicDet.Next;
		end;
		SQL := 'Select Nombre, Documento from ('+ SQL +') Order By Num';
	end;

	qDocAdic.SQL.Clear;
	qDocAdic.SQL.Text := SQL;

	qDocCtto.Open;
	qDocCtteDet.Open;
	qDocCtte.Open;
	qDocAdic.Open;
	qDocAdic.FieldByName('NOMBRE').DisplayLabel := 'Nombre';
	qDocAdic.FieldByName('DOCUMENTO').DisplayLabel := 'Documento';
	qDocAdic.FieldByName('NOMBRE').DisplayWidth := 60;
	qDocAdic.FieldByName('DOCUMENTO').DisplayWidth := 41;

	qDocCtto.EnableControls;
	qDocCtte.EnableControls;
	qDocCtteDet.EnableControls;
	qDocAdic.EnableControls;

	gDocCtto.ShowVertScrollBar := (qDocCtto.RecordCount > 1);
	gDocCtte.ShowVertScrollBar := (qDocCtte.RecordCount > 4);
	gDocAdic.ShowVertScrollBar := (qDocAdic.RecordCount > 4);

	edStatusContrato.Caption := Objeto.StatusContrato;
end;

procedure TwConInfoGen.qDocCttoINTERMEDIACIONGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	if Sender.AsInteger = 1 Then Text := 'SI'
	else Text := 'NO';
end;

procedure TwConInfoGen.qDocCtteCalcFields(DataSet: TDataSet);
Var
	Req, Requisitos, ReqPresentados: String;
	Num: Integer;
	q: TQuery;
begin
	qDocCtte.FieldByName('PODER').asString := '--';
	qDocCtte.FieldByName('IDENTIDAD').asString := '--';
	qDocCtte.FieldByName('NACIONALIDAD').asString := '--';
	qDocCtte.FieldByName('RFC').asString := '--';
	qDocCtte.FieldByName('PROFESION').asString := '--';
	qDocCtte.FieldByName('ACTIVIDAD').asString := '--';
	qDocCtte.FieldByName('DOMICILIO').asString := '--';
	qDocCtte.FieldByName('NACIMIENTO').asString := '--';

	qDocCtteDet.Close;
	qDocCtteDet.ParamByName('ID_CONTRATO').asInteger := Objeto.Contrato.ID_Contrato.AsInteger;
	qDocCtteDet.ParamByName('ID_PERSONA').asInteger := qDocCtte.FieldByName('ID_PERSONA').asInteger;
	qDocCtteDet.Open;

	While (NOT qDocCtteDet.EOF) do
	begin
		Req := qDocCtteDet.FieldByName('CVE_REQUISITO').asString;

		if Trim(ReqPresentados) = '' Then ReqPresentados := '''' + Req + ''''
		else ReqPresentados := ReqPresentados + ', ''' + Req + '''';

		If (Req = 'R004') or (Req = 'R028') or (Req = 'R030') or (Req = 'R035') or
			(Req = 'R037') or (Req = 'R040') or (Req = 'R046') or (Req = 'R049') or
			(Req = 'R051') or (Req = 'R053')
		Then qDocCtte.FieldByName('PODER').asString := 'SI'
		else
		If (Req = 'R001') or (Req = 'R063') or (Req = 'R018') or (Req = 'R025') or (Req = 'R010')
		Then qDocCtte.FieldByName('IDENTIDAD').asString := 'SI'
		else
		If (Req = 'R002') or (Req = 'R062')
		Then qDocCtte.FieldByName('NACIONALIDAD').asString := 'SI'
		else
		If (Req = 'R003') or (Req = 'R017') or (Req = 'R070')
		Then qDocCtte.FieldByName('RFC').asString := 'SI'
		else
		If (Req = 'R057')
		Then qDocCtte.FieldByName('PROFESION').asString := 'SI'
		else
		If (Req = 'R058') or (Req = 'R061') or (Req = 'R094') or (Req = 'R097') or
			(Req = 'R098') or (Req = 'R101') or (Req = 'R103') or (Req = 'R105') or
			(Req = 'R107') or (Req = 'R109') or (Req = 'R112') or (Req = 'R114') or
			(Req = 'R116') or (Req = 'R118')
		Then qDocCtte.FieldByName('ACTIVIDAD').asString := 'SI'
		else
		If (Req = 'R022') or (Req = 'R092') or (Req = 'R099')
		Then qDocCtte.FieldByName('DOMICILIO').asString := 'SI'
		else
		If (Req = 'R060') or (Req = 'R091')
		Then qDocCtte.FieldByName('NACIMIENTO').asString := 'SI';

		qDocCtteDet.Next;
	end;


	Requisitos := ReqProdCtte(Objeto.Apli,
									Objeto.Contrato.Id_Empresa.AsInteger,
									qDocCtte.FieldByName('CVE_CONTRATANTE').asString,
									Objeto.Contrato.Cve_Producto.AsString,
									Objeto.Contrato.CVE_CONCEP_CTO.AsString);

	if Trim(Requisitos) = '' Then Requisitos := '''''';
	if Trim(ReqPresentados) = '' Then ReqPresentados := '''''';
	q := GetSQLQuery(
			' select cve_requisito'+
			' from requisito where cve_requisito in('+ Requisitos +')' +
			' MINUS'+
			' select cve_requisito'+
			' from requisito where cve_requisito in('+ ReqPresentados +')',
			Objeto.DataBaseName, Objeto.SessionName,False);

	If q = nil then qDocCtte.FieldByName('COMPLETO').asString := 'SI'
	else
	begin
		q.Free;
		qDocCtte.FieldByName('COMPLETO').asString := 'NO';
		Objeto.StatusContrato := 'INCOMPLETO';

			If (qDocCtte.FieldByName('PODER').asString = '--') and
			  ((Pos('R004',Requisitos) <> 0) or (Pos('R028',Requisitos) <> 0) or
				(Pos('R030',Requisitos) <> 0) or (Pos('R035',Requisitos) <> 0) or
				(Pos('R037',Requisitos) <> 0) or (Pos('R040',Requisitos) <> 0) or
				(Pos('R046',Requisitos) <> 0) or (Pos('R049',Requisitos) <> 0) or
				(Pos('R051',Requisitos) <> 0) or (Pos('R053',Requisitos) <> 0))
			Then qDocCtte.FieldByName('PODER').asString := 'NO';

			If (qDocCtte.FieldByName('IDENTIDAD').asString = '--') and
			  ((Pos('R001',Requisitos) <> 0) or (Pos('R063',Requisitos) <> 0) or
				(Pos('R018',Requisitos) <> 0) or (Pos('R025',Requisitos) <> 0) or
				(Pos('R010',Requisitos) <> 0))
			Then qDocCtte.FieldByName('IDENTIDAD').asString := 'NO';

			If (qDocCtte.FieldByName('NACIONALIDAD').asString = '--') and
			  ((Pos('R002',Requisitos) <> 0) or (Pos('R062',Requisitos) <> 0))
			Then qDocCtte.FieldByName('NACIONALIDAD').asString := 'NO';

			If (qDocCtte.FieldByName('RFC').asString = '--') and
			  ((Pos('R003',Requisitos) <> 0) or (Pos('R017',Requisitos) <> 0) or
				(Pos('R070',Requisitos) <> 0))
			Then qDocCtte.FieldByName('RFC').asString := 'NO';

			If (qDocCtte.FieldByName('PROFESION').asString = '--') and
				(Pos('R057',Requisitos) <> 0)
			Then qDocCtte.FieldByName('PROFESION').asString := 'NO';

			If (qDocCtte.FieldByName('ACTIVIDAD').asString = '--') and
			  ((Pos('R058',Requisitos) <> 0) or (Pos('R061',Requisitos) <> 0) or
				(Pos('R094',Requisitos) <> 0) or (Pos('R097',Requisitos) <> 0) or
				(Pos('R098',Requisitos) <> 0) or (Pos('R101',Requisitos) <> 0) or
				(Pos('R103',Requisitos) <> 0) or (Pos('R105',Requisitos) <> 0) or
				(Pos('R107',Requisitos) <> 0) or (Pos('R109',Requisitos) <> 0) or
				(Pos('R112',Requisitos) <> 0) or (Pos('R114',Requisitos) <> 0) or
				(Pos('R116',Requisitos) <> 0) or (Pos('R118',Requisitos) <> 0))
			Then qDocCtte.FieldByName('ACTIVIDAD').asString := 'NO';

			If (qDocCtte.FieldByName('DOMICILIO').asString = '--') and
			  ((Pos('R022',Requisitos) <> 0) or (Pos('R092',Requisitos) <> 0) or
				(Pos('R099',Requisitos) <> 0))
			Then qDocCtte.FieldByName('DOMICILIO').asString := 'NO';

			If (qDocCtte.FieldByName('NACIMIENTO').asString = '--') and
			  ((Pos('R060',Requisitos) <> 0) or (Pos('R091',Requisitos) <> 0))
			Then qDocCtte.FieldByName('NACIMIENTO').asString := 'NO';
	end
end;

procedure TwConInfoGen.qDocCttoCalcFields(DataSet: TDataSet);
var	q: TQuery;
begin
	Objeto.FDoctosFaltantes:= '';

	q := GetSQLQuery(
			'   select cve_documento from doc_prod_cto'+
			'   where id_empresa = '+ Objeto.Contrato.Id_empresa.AsSQL +
			'    and cve_producto = '+ Objeto.Contrato.Cve_Producto.AsSQL +
			'   MINUS'+
			'   select cve_documento from doc_contrato where id_contrato = '+ Objeto.Contrato.ID_Contrato.AsSQL,
			Objeto.DataBaseName, Objeto.SessionName,False);

	Try
		If q = nil then qDocCtto.FieldByName('COMPLETO').asString := 'SI'
		else
		begin
         qDocCtto.FieldByName('COMPLETO').asString := 'NO';
         Objeto.StatusContrato := 'INCOMPLETO';

         while not q.EOF do											{OBTENCION DE LOS DOCUMENTOS FALTANTES DEL CONTRATO}
         begin
         	if Trim(Objeto.FDoctosFaltantes) = '' Then Objeto.FDoctosFaltantes := '''' + q.FieldByname('CVE_DOCUMENTO').asString + ''''
            else Objeto.FDoctosFaltantes := Objeto.FDoctosFaltantes + ', ''' + q.FieldByname('CVE_DOCUMENTO').asString + '''';
         	q.next;
         end;
      end;
   Finally
   	if q <> nil then q.Free;
   end;
end;

procedure TwConInfoGen.gDocCtteEnter(Sender: TObject);
begin edNombreTitular.Visible := True;
end;

procedure TwConInfoGen.gDocCtteExit(Sender: TObject);
begin
	edNombreTitular.Visible := False;
   Repeticion := 0;
   Timer1.Enabled := False;
end;


procedure TwConInfoGen.Timer1Timer(Sender: TObject);
Var Coord : TGridCoord;
    LinActiva: Integer;
    Campo: TField;
begin
	if Repeticion = 3 then
   begin
      Repeticion := 0;
      Timer1.Enabled := False;
      edNombreLargo.Visible := False;
      //gDocCtte.Repaint;
   end
   else Inc(Repeticion);



{	if Repeticion = 3 then
   begin
      Repeticion := 0;
      Timer1.Enabled := False;

      Coord := gDocCtte.MouseCoord(mX,mY);
      LinActiva:= gDocCtte.GetActiveRow;
      Campo:= gDocCtte.GetActiveField;
      gDocCtte.SetActiveRow(Coord.Y-1);
      gDocCtte.SetActiveField('NOMBRE');
      gDocCtte.ShowHint := True;
      gDocCtte.Hint := gDocCtte.GetActiveField.AsString;		//qDocCtte.fieldbyname('NOMBRE').asString;
      gDocCtte.SetActiveRow(LinActiva);
      gDocCtte.SetActiveField(Campo.FieldName);
   end
   else Inc(Repeticion);}
end;


procedure TwConInfoGen.gDocCtteMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
Var
	Coord : TGridCoord;
   LinActiva: Integer;
   Campo: TField;
   Dato: String;
begin
{   Coord := gDocCtte.MouseCoord(X,Y);
   if (Coord.X = 1) and (Coord.Y > 0) and (not qDocCtte.IsEmpty) Then
   begin
   	if (Coord.Y <> LastRow) Then
      begin
      	LastRow := Coord.Y;

         edNombreLargo.Caption := Objeto.ListaCtte.Strings[Coord.Y-1];
         edNombreLargo.Width := Canvas.TextWidth(edNombreLargo.Caption) + 5;
         if y >= 84 Then edNombreLargo.Top := 164
         else if y >= 67 Then edNombreLargo.Top := 147
         else if y >= 50 Then edNombreLargo.Top := 130
         else if y >= 33 Then edNombreLargo.Top := 113;
         Timer1.Enabled := True;
         Repeticion := 0;
         edNombreLargo.visible:= True;
      end;
   end
   else
   begin
   	edNombreLargo.Visible := False;
      LastRow := 0;
      Timer1.Enabled := False;
      Repeticion := 0;
	end;}
end;

Procedure TwConInfoGen.DespuesShowDocumento(Var Msg:TMessage);
begin
   Objeto.ListaCtte.Free;
	Objeto.ListaCtte := TStringList.Create;
end;

procedure TwConInfoGen.gDocCtteTopChanged(Sender: TObject);
begin
	//Objeto.ListaCtte.Clear;
{   Objeto.ListaCtte.Free;
	Objeto.ListaCtte := TStringList.Create;}

   PostMessage(Handle,WM_DESPUESSHOWDOC,0,0);
end;

procedure TwConInfoGen.gDocCtteDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
	if (Field.FieldName = 'NOMBRE') and (Objeto.ListaCtte.Count <= 3) Then
	begin
		Objeto.ListaCtte.Add(Field.asString);
	end;
end;



(***************************************************************************)
(*													FORMA	-- DIRECCIONES --					*)
(***************************************************************************)

{Procedure TwConInfoGen.DespuesShowGeneral(Var Msg:TMessage);
begin
	gbCDVI.Visible:=(Objeto.Contrato.Cve_Tip_Contrato.AsString='CDVI');
	gbCIBC.Visible:=  (Objeto.Contrato.Cve_Tip_Contrato.AsString='CIBC')
						OR (Objeto.Contrato.Cve_Tip_Contrato.AsString='IFSM')
						OR (Objeto.Contrato.Cve_Tip_Contrato.AsString='OMDC')
						OR (Objeto.Contrato.Cve_Tip_Contrato.AsString='OMDI')
						OR (Objeto.Contrato.Cve_Tip_Contrato.AsString='OMSC');
	gbFIDE.Visible:=(Objeto.Contrato.Cve_Tip_Contrato.AsString='FIDE');
end;}

procedure TwConInfoGen.qCtte2CalcFields(DataSet: TDataSet);
begin

	qDomicilio.Close;
	if Trim(qCtte.FieldByName('DOM_CONTRATO').asString) <> '' Then
		qDomicilio.ParamByName('ID_DOMICILIO').asString := qCtte.FieldByName('DOM_CONTRATO').asString
	else qDomicilio.ParamByName('ID_DOMICILIO').asString := qCtte.FieldByName('DOM_PERSONA').asString;
	qDomicilio.Open;

	qCtte.FieldByName('DOMICILIO').asString :=
		qDomicilio.FieldByName('CALLE_NUMERO').asString + '~' +
		'COLONIA ' + qDomicilio.FieldByName('COLONIA').asString + '~' +
		'CP ' + qDomicilio.FieldByName('CODIGO_POSTAL').asString + ' ' + qDomicilio.FieldByName('DESC_CIUDAD').asString + '~' +
		qDomicilio.FieldByName('DESC_ESTADO').asString;
end;


Procedure TwConInfoGen.RefrescaQDomicilios;
begin
	qCtte.DisableControls;
   qCtte.Close;
   qCtte.DatabaseName := Objeto.DataBaseName;
   qCtte.SessionName := Objeto.SessionName;
   qCtte.ParamByName('Id_contrato').asString := Objeto.Contrato.ID_Contrato.AsString;    //edContrato.Text;
   qCtte.Open;
   qCtte.EnableControls;


   If (qCtte.RecordCount >= 0) and (qCtte.RecordCount <= 4) Then
   	gDomicilio.RowCount:= qCtte.RecordCount
   else gDomicilio.RowCount:= 4;

//   PostMessage(Handle,WM_DESPUESSHOW,0,0);
end;



(***************************************************************************)
(*													FORMA	-- CHEQUERAS --					*)
(***************************************************************************)

{Procedure TwConInfoGen.DespuesShowGeneral(Var Msg:TMessage);
begin
	gbCDVI.Visible:=(Objeto.Contrato.Cve_Tip_Contrato.AsString='CDVI');
   gbCIBC.Visible:=  (Objeto.Contrato.Cve_Tip_Contrato.AsString='CIBC')
   					OR (Objeto.Contrato.Cve_Tip_Contrato.AsString='IFSM')
                  OR (Objeto.Contrato.Cve_Tip_Contrato.AsString='OMDC')
                  OR (Objeto.Contrato.Cve_Tip_Contrato.AsString='OMDI')
                  OR (Objeto.Contrato.Cve_Tip_Contrato.AsString='OMSC');
   gbFIDE.Visible:=(Objeto.Contrato.Cve_Tip_Contrato.AsString='FIDE');
end;}

Procedure TwConInfoGen.RefrescaQChequeras;
begin
   qCheq.DisableControls;
   qCheq.Close;
   qCheq.DatabaseName := Objeto.DataBaseName;
   qCheq.SessionName := Objeto.SessionName;
   qCheq.ParamByName('Id_contrato').asString := Objeto.Contrato.ID_Contrato.AsString;    //edContrato.Text;
   qCheq.Open;
	qCheq.EnableControls;

	If (qCheq.RecordCount >= 0) and (qCheq.RecordCount <= 4) Then
   	gChequera.RowCount:= qCheq.RecordCount
   else gChequera.RowCount:= 4;

//   PostMessage(Handle,WM_DESPUESSHOW,0,0);
end;



(***************************************************************************)
(*													FORMA	-- DOCUMENTOS FALTANTES --		*)
(***************************************************************************)

Procedure TwConInfoGen.RefrescaQDoctosFaltantes;
var
	qRequisito, qContratante, qDocumento: TQuery;
   SQL, Union, Req, Doc: STring;
   Cont: Integer;
   LastName, LastReq, LastTipoCtte, Nombre, Requisito: String;

begin
   qReq.DisableControls;
   qReq.Close;
   qReq.DatabaseName := Objeto.DataBaseName;
   qReq.SessionName := Objeto.SessionName;

   LastName:= '';
   LastReq := '';
   LastTipoCtte := '';
   SQL := '';
   Union := ' ';
   Cont:= 0;

   if Trim(Objeto.FDoctosFaltantes) = '' then Objeto.FDoctosFaltantes := '''''';
   qDocumento := GetSQLQuery(
		'Select Desc_Documento from Documento Where Cve_documento in ('+ Objeto.FDoctosFaltantes +')',
      Objeto.DataBaseName, Objeto.SessionName,False);

   try
      if qDocumento <> nil then
		begin
      	While (not qDocumento.EOF) do
         begin
         	Inc(Cont);
            If Trim(SQL) = '' Then Nombre := '''DOCUMENTOS DEL CONTRATO: '''
            else Nombre := '''''';

            SQL:= SQL + Union + '(SELECT 1 Tipo, '+ IntToStr(Cont) + ' Num, '+ Nombre +' Nombre, ''' +
               qDocumento.FieldByName('DESC_DOCUMENTO').asString + ''' Requisito, ''' +
               qDocumento.FieldByName('DESC_DOCUMENTO').asString + ''' Documento FROM DUAL)';

            Union := ' UNION ';
            qDocumento.Next;
         end;

         Inc(Cont);
         SQL:= SQL + Union + '(SELECT 0 Tipo, '+ IntToStr(Cont) + ' Num, '' '' Nombre, '' '' Requisito, '' '' Documento FROM DUAL)';
      end;
   finally
   	if qDocumento <> nil then qDocumento.Free;
   end;

	qContratante := GetSQLQuery(
   		' SELECT Contratante.Id_Persona, Contratante.Cve_Contratante, '+
         '   Contratante.Cve_Concep_ctte, Tipo_Contratante.Desc_Contratante, '+
         '   SubStr(spf_Nombre_Ctte(Contratante.Id_Contrato, Contratante.Id_Persona),1,80) as Nombre, '+
         '   Persona.Cve_Nacionalidad, Persona.Cve_Per_Juridica'+
         ' FROM contratante, Persona, Tipo_Contratante'+
         ' WHERE id_contrato = '+ Objeto.Contrato.ID_Contrato.AsSQL +
         '    and Contratante.Id_Persona = Persona.Id_Persona' +
         '    and Contratante.Cve_Contratante <> ''C021''' +
         '    and Contratante.Cve_Contratante = Tipo_Contratante.Cve_Contratante'+
         '    and sit_contratante = ''AC'''+
         ' Order by Contratante.Cve_contratante, Persona.Nombre',
         Objeto.DataBaseName, Objeto.SessionName, False);

   Try
      If qContratante <> nil then
      begin
      	qContratante.First;
         While (Not qContratante.EOF) do
         begin
				Req :=ReqProdCtte(Objeto.Apli,
                           	Objeto.Contrato.Id_Empresa.AsInteger,
                           	qContratante.FieldByName('CVE_CONTRATANTE').asString,
                           	Objeto.Contrato.Cve_Producto.AsString,
                           	Objeto.Contrato.CVE_CONCEP_CTO.AsString);

				if Trim(Req) = '' Then Req := '''''';
            qRequisito := GetSQLQuery (
               ' Select Cve_Requisito, Desc_Requisito from Requisito '+
               ' Where Cve_Requisito in('+
               '   SELECT Cve_requisito'+
               '   FROM requisito where cve_requisito in('+ Req +')' +
               '   MINUS'+
               '   SELECT Doc_Contratante.cve_requisito'+
               '   FROM doc_contratante'+
               '   WHERE id_contrato = '+ Objeto.Contrato.ID_Contrato.asSQL +
               '      and id_persona = '+ qContratante.FieldByName('ID_PERSONA').asString +
               ' ) and cve_requisito <> ''R016'' ORDER BY Desc_Requisito',
		         Objeto.DataBaseName, Objeto.SessionName,False);
            try
            	if qRequisito <> nil then
					begin
               	qRequisito.First;
               	while not qRequisito.EOF do
                  begin
                  	Doc := DocCompReq(Objeto.Apli,Objeto.
                     				Contrato.Id_Empresa.AsInteger,
                                 qRequisito.FieldByName('CVE_REQUISITO').asString,
                                 qContratante.FieldByName('CVE_PER_JURIDICA').asString,
                                 qContratante.FieldByName('CVE_NACIONALIDAD').asString,
                                 qContratante.FieldByName('CVE_CONCEP_CTTE').asString,
                                 Objeto.Contrato.CVE_CONCEP_CTO.AsString);

                     If Trim(Doc) = '' then Doc := '''''';
                     qDocumento := GetSQLQuery(
                     						' Select Desc_Documento from Documento'+
                                       ' where cve_documento in ('+ Doc +')' +
                                       ' Order by Desc_Documento',
                                       Objeto.DataBaseName, Objeto.SessionName, False);
                     Try
                     	if qDocumento <> nil then
                        begin
									qDocumento.First;
                           While not qDocumento.EOF do
                           begin

                                 Inc(Cont);

                                 if LastName <> qContratante.FieldByName('NOMBRE').asString Then
                                 begin
                                    Nombre := '''' + qContratante.FieldByName('NOMBRE').asString + '''';
                                    LastName := qContratante.FieldByName('NOMBRE').asString;
                                    LastReq := '';
                                 end
                                 else Nombre:= ''' ''';

                                 if LastReq <> qRequisito.FieldByName('DESC_REQUISITO').asString Then
                                 begin
                                    Requisito := '''' + qRequisito.FieldByName('DESC_REQUISITO').asString + '''';
                                    LastReq := qRequisito.FieldByName('DESC_REQUISITO').asString;
                                 end
                                 else Requisito:= ''' ''';

											if LastTipoCtte <> qContratante.FieldByName('DESC_CONTRATANTE').asString Then
                                 begin
                                 	SQL:= SQL + Union + '(SELECT 0 Tipo, '+ IntToStr(Cont) + ' Num, '' '' Nombre, '' '' Requisito, '' '' Documento FROM DUAL)';
                                    Inc(Cont);
                                    Union := ' UNION ';

	                                 SQL:= SQL + Union + '(SELECT 2 Tipo, '+ IntToStr(Cont) + ' Num, ''' + qContratante.FieldByName('DESC_CONTRATANTE').asString + ': '' Nombre, ' +
                                 		''' '' Requisito, '' '' Documento FROM DUAL)';
                                    LastTipoCtte := qContratante.FieldByName('DESC_CONTRATANTE').asString;
                                    Inc(Cont);
                                 end;

                                 SQL:= SQL + Union + '(SELECT 3 Tipo, '+ IntToStr(Cont) + ' Num, ' + Nombre + ' Nombre, ' +
                                 		Requisito + ' Requisito, ''' + qDocumento.FieldByName('DESC_DOCUMENTO').asString + ''' Documento FROM DUAL)';

                                 Union := ' UNION ';
                                 Objeto.StatusContrato := 'INCOMPLETO';

                                 qDocumento.Next;
                           end;			{CICLO DE DOCUMENTOS}
                        end;
							finally
                     	if qDocumento <> nil then qDocumento.Free;
                     end;

                  	qRequisito.Next;
                  end;			{CICLO DE REQUISITOS}
               end;
            finally
            	if qRequisito<> nil then qRequisito.Free;
            end;

            qContratante.Next;
         end;			{CICLO DE CONTRATANTES}
      end;
   finally
   	If qContratante <> nil then qContratante.Free; qContratante:=nil;
   end;


   if Trim(SQL) <> '' Then SQL := 'Select Tipo, Nombre, Requisito, Documento from ('+ SQL +') Order By Num'
   else SQL := ' Select 0 as Tipo, '' '' as Nombre, '' '' as Requisito, '' '' as Documento from DUAL';

   qReq.SQL.Text := SQL;
   qReq.Open;

   qReq.FieldByName('TIPO').Visible := False;
   qReq.FieldByName('NOMBRE').DisplayLabel := 'Nombre';
   qReq.FieldByName('REQUISITO').DisplayLabel := 'Requisito';
   qReq.FieldByName('DOCUMENTO').DisplayLabel := 'Documento';
   qReq.FieldByName('NOMBRE').DisplayWidth := 46;
   qReq.FieldByName('REQUISITO').DisplayWidth := 34;
   qReq.FieldByName('DOCUMENTO').DisplayWidth := 34;

   gReq.ShowVertScrollBar := (qReq.RecordCount > 15);
   qReq.EnableControls;
   edStatusContrato.Caption := Objeto.StatusContrato;

   Objeto.DoctosActuales:= True;
end;


procedure TwConInfoGen.gReqCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  	if	(not qReq.IsEmpty) and (qReq.FieldByName('TIPO').asInteger in ([1,2]))
   	and (Field.FieldName = 'NOMBRE') Then AFont.Style := [fsBold];
end;



(***************************************************************************)
(*													FORMA	-- PODERES --						*)
(***************************************************************************)

Procedure TwConInfoGen.RefrescaQPoderes;
begin
   CursorEspera;
   Try
      qPoderes.DisableControls;
      qPoderes.Close;
      qPoderes.DatabaseName := Objeto.DataBaseName;
      qPoderes.SessionName := Objeto.SessionName;
      qPoderes.ParamByName('Id_contrato').asString := Objeto.Contrato.ID_Contrato.AsString;    //edContrato.Text;
		qPoderes.Open;
      qPoderes.EnableControls;

      If (qPoderes.RecordCount >= 0) and (qPoderes.RecordCount <= 4) Then
			gPoderes.RowCount:= qPoderes.RecordCount
      else gPoderes.RowCount:= 4;


		Objeto.PoderesActuales:= True;
	//   PostMessage(Handle,WM_DESPUESSHOW,0,0);
	finally
		CursorNormal;
	end;
end;



(***************************************************************************)
(*													FORMA	-- COMENTARIOS --	 				*)
(***************************************************************************)
Procedure TwConInfoGen.RefrescaQComentarios;
begin {}
end;




(***************************************************************************)
(*													FORMA	-- VARIOS --						*)
(***************************************************************************)

procedure TwConInfoGen.edFAltaChange(Sender: TObject);
begin lbFAlta.Caption := edFAlta.Text;
end;

procedure TwConInfoGen.BitBtn1Click(Sender: TObject);
begin Objeto.Reporte;
end;
end.
