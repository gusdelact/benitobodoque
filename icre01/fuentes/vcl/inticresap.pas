// Sistema         : Clase de ICRESAP
// Fecha de Inicio : 11/04/2008
// Función forma   : Clase de ICRESAP
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntIcresap;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid, DBGrids,
IntLinkit, Clipbrd, DBCtrls, Menus,

IntCrProduct,     // Producto de crédito
Intempre,         // Empresa
IntParamCre,      // Parametros Crédito
IntMon,           // Moneda
IntCgCueEqu,      // Cuentas Equivalentes
IntCrConFalt      // Registros con Configuración Faltante 
;
const
  CO_SEPARATOR = #9;

Type
 TIcresap= class;

  TWIcresap=Class(TForm)
    InterForma1             : TInterForma;
    lbEmpresa: TLabel;
    edID_EMPRESA: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dtpF_OPERACION: TDateTimePicker;
    Label1: TLabel;
    btEMPRESA: TSpeedButton;
    edDESC_EMPRESA: TEdit;
    MemMensajes: TMemo;
    TabSheet3: TTabSheet;
    QryMapeoSAP: TQuery;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    Panel1: TPanel;
    Splitter1: TSplitter;
    dsrcMovtoSinCta: TDataSource;
    dscMapeoSAP: TDataSource;
    QryMapeoSAPF_OPERACION: TDateTimeField;
    QryMapeoSAPCVE_MONEDA: TFloatField;
    QryMapeoSAPCVE_CTA_CONTABLE: TStringField;
    Panel3: TPanel;
    bitbtnMuestra: TBitBtn;
    edCVE_CTA_CONTABLE: TEdit;
    Label2: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    edCVE_TIPO_SECTOR: TEdit;
    lbCVE_PRODUCTO_CRE: TLabel;
    lbCVE_TIPO_SECTOR: TLabel;
    dbGridResult1: TDBGrid;
    TabSheet4: TTabSheet;
    Splitter2: TSplitter;
    dbGridResult2: TDBGrid;
    grbxMoneda: TGroupBox;
    opMXN: TRadioButton;
    opUSD: TRadioButton;
    grbxSistema: TGroupBox;
    opICRE: TRadioButton;
    opINTERCREDITOS: TRadioButton;
    SpeedButton1: TSpeedButton;
    edDESC_PRODUCTO: TEdit;
    Qry1: TQuery;
    Qry2: TQuery;
    dsrc1: TDataSource;
    dsrc2: TDataSource;
    PnDatos: TPanel;
    Label3: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilEmpresa: TInterLinkit;
    ilCVE_PRODUCTO_CRE: TInterLinkit;
    DatabasePCONT: TDatabase;
    btnCopia: TButton;
    btnCopiaTodo: TButton;
    cbxCopiaCabecera: TCheckBox;
    cbxCVE_PRODUCTO_CRE: TCheckBox;
    bitbtnReinicializa: TBitBtn;
    DBGrid3: TDBGrid;
    qryGeneracion: TQuery;
    dsrcGeneracion: TDataSource;
    qryGeneracionFOL_GENERACION: TFloatField;
    qryGeneracionF_OPERACION: TDateTimeField;
    qryGeneracionNUM_TRANS_GEN: TFloatField;
    qryGeneracionIMPORTE_GEN: TFloatField;
    qryGeneracionSIT_GENERACION: TStringField;
    Label4: TLabel;
    dbFOLIO_GENERACION: TDBText;
    bitbtnDeriva: TBitBtn;
    lblMoneda: TLabel;
    edCVE_MONEDA: TEdit;
    bitbtnCVE_MONEDA: TSpeedButton;
    edDESC_MONEDA: TEdit;
    ilCVE_MONEDA: TInterLinkit;
    QryMovtoSinCta: TQuery;
    QryMovtoSinCtaCVE_OPE_CONT: TStringField;
    QryMovtoSinCtaSEP_II: TStringField;
    QryMovtoSinCtaID_CREDITO: TFloatField;
    QryMovtoSinCtaCVE_OPER_CRED_2: TStringField;
    QryMovtoSinCtaCVE_COMISION_2: TStringField;
    QryMovtoSinCtaCVE_CONCEPTO_2: TStringField;
    QryMovtoSinCtaCVE_TIPO_MOVTO_2: TStringField;
    QryMovtoSinCtaIMP_CONCEPTO: TFloatField;
    QryMovtoSinCtaCVE_PRODUCTO_1: TStringField;
    QryMovtoSinCtaCVE_MONEDA_1: TFloatField;
    QryMovtoSinCtaID_CENT_COSTO: TFloatField;
    QryMovtoSinCtaID_ACREDITADO: TFloatField;
    QryMovtoSinCtaCVE_TIPO_SECTOR: TStringField;
    QryMovtoSinCtaREFINANCIAMIENTO: TStringField;
    BitBtn1: TBitBtn;
    btnRefrescar: TBitBtn;
    QryMovtoSinCtaID_TRANSACCION: TFloatField;
    chbMuestra: TCheckBox;
    PopupMenu1: TPopupMenu;
    Registro1: TMenuItem;
    InsertarRegistrodeMapeo1: TMenuItem;
    Label5: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure bitbtnMuestraClick(Sender: TObject);
    procedure opINTERCREDITOSClick(Sender: TObject);
    procedure opICREClick(Sender: TObject);
    procedure ilEmpresaCapture(Sender: TObject; var Show: Boolean);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure btEMPRESAClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnCopiaClick(Sender: TObject);
    procedure btnCopiaTodoClick(Sender: TObject);
    procedure dbGridResult2Enter(Sender: TObject);
    procedure cbxCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure bitbtnDerivaClick(Sender: TObject);
    procedure bitbtnReinicializaClick(Sender: TObject);
    procedure dtpF_OPERACIONCloseUp(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure bitbtnCVE_MONEDAClick(Sender: TObject);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure chbMuestraClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure Registro1Click(Sender: TObject);
    procedure InsertarRegistrodeMapeo1Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TIcresap;

    vgTopicGrid : TDBGrid;

    procedure EjecutaQueries;
    procedure EjecutaQuery(peQry : TQuery; peSQL : String);
    procedure CopiaRegistros(pebCopiaTodo : Boolean);
    procedure RecuperaMensajes(peCVE_MONEDA : Integer);
    procedure MuestraGeneracion;
    procedure Refrescar;

    function ConectaBasePCONT : Boolean;
    function Deriva(peFecha : TDateTime; peCVE_MONEDA : Integer) : Boolean;
    function Reinicializa(peCVE_MONEDA, peFOL_GENERACION : Integer): Boolean;
    function FunGenMovtosSAP(pFecha: TDateTime; var PPResultado: String): Boolean;
    function FunGenContaDllsICRE(pFecha: TDateTime; var PPResultado: String): Boolean;
end;

 TIcresap= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_EMPRESA  : TInterCampo;
        F_OPERACION : TInterCampo;
        DESC_EMPRESA : TInterCampo;

        ParamCre : TParamCre;
        Producto : TCrProduct;
        Empresa  : TEmpresa;
        Moneda   : TMoneda;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

        function ArmaQueryCtasContables(peFECHA : TDateTime) : String;
        function ArmaQueryCtasSAP(peFECHA : TDateTime) : String;
        function ArmaQueryMXN_ICRE(peFECHA: TDateTime; peMetodo : Integer;
                                            peCVE_CTA_CONTABLE, peCVE_TIPO_SECTOR, peCVE_PRODUCTO_CRE : String): String;
        function ArmaQueryUSD_ICRE(peFECHA: TDateTime; peMetodo : Integer;
                                            peCVE_CTA_CONTABLE, peCVE_TIPO_SECTOR, peCVE_PRODUCTO_CRE : String): String;
        function ArmaQueryMXN(peFECHA: TDateTime; peMetodo : Integer;
                                       peCVE_CTA_CONTABLE, peCVE_TIPO_SECTOR, peCVE_SUB_TIP_BCO : String): String;
      published
      end;

implementation

uses IntGenCre;
{$R *.DFM}

constructor TIcresap.Create( AOwner : TComponent );
begin Inherited;
      ID_EMPRESA := CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,False);
      DESC_EMPRESA := CreaCampo('DESC_EMPRESA',ftString,tsNinguno,tsNinguno,False);
      F_OPERACION := CreaCampo('F_OPERACION',ftDate,tsNinguno,tsNinguno,False);

      {$WARNINGS OFF} Producto := TCrProduct.Create(Self); {$WARNINGS ON}
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField := 'CVE_PRODUCTO_CRE';

      {$WARNINGS OFF} Moneda := TMoneda.Create(Self); {$WARNINGS ON}
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField := 'CVE_MONEDA';

      {$WARNINGS OFF} Empresa := TEmpresa.Create(Self); {$WARNINGS ON}

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntIcresap.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TIcresap.Destroy;
begin
  If Assigned(Producto) Then Producto.Free;
  If Assigned(Empresa ) Then Empresa.free;
  If Assigned(Moneda )  Then Moneda.free;
  inherited;
end;

function TIcresap.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWIcresap;
begin
   W:=TWIcresap.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TIcresap.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IIcresap.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      Finally  T.Free;
      End; 
end;

(***********************************************FORMA ICRESAP********************)
(*                                                                              *)
(*  FORMA DE ICRESAP                                                            *)
(*                                                                              *)
(***********************************************FORMA ICRESAP********************)

procedure TWIcresap.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
    //PINTA DATOS DEL PANEL INFERIOR
    PageControl1.ActivePageIndex := 0; 

    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    ID_EMPRESA.Control := edID_EMPRESA;
    F_OPERACION.Control := dtpF_OPERACION;
    DESC_EMPRESA.Control := edDESC_EMPRESA;

    Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
    Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO;
    Producto.GetParams(Objeto);
    edDESC_PRODUCTO.Hint := Producto.DESC_C_PRODUCTO.AsString;
    edDESC_PRODUCTO.ShowHint := True;

    Empresa.ID_EMPRESA.Control := edID_EMPRESA;
    Empresa.PersonaMoral.Nombre.Control := edDESC_EMPRESA;
    Empresa.GetParams(Objeto);
    Empresa.FindKey([2]);

    Moneda.CVE_MONEDA.Control := edCVE_MONEDA;
    Moneda.DESC_MONEDA.Control := edDESC_MONEDA;
    Moneda.GetParams(Objeto);
    Moneda.FindKey([484]);

    dtpF_OPERACION.Date := Apli.DameFechaEmpresa - 1;
    If dtpF_OPERACION.CanFocus Then dtpF_OPERACION.SetFocus;

    RecuperaMensajes(Objeto.Moneda.CVE_MONEDA.AsInteger);
    End;
end;

procedure TWIcresap.FormDestroy(Sender: TObject);
begin
  With Objeto Do
    Begin
    ID_EMPRESA.Control := Nil;
    F_OPERACION.Control := Nil;
    DESC_EMPRESA.Control := Nil;

    Producto.CVE_PRODUCTO_CRE.Control := Nil;
    Producto.DESC_C_PRODUCTO.Control := Nil;

    Empresa.ID_Empresa.Control := Nil;
    Empresa.PersonaMoral.Nombre.Control := Nil;

    Moneda.CVE_MONEDA.Control := Nil;
    Moneda.DESC_MONEDA.Control := Nil;
    End;
end;

procedure TWIcresap.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

function TIcresap.ArmaQueryCtasContables(peFECHA: TDateTime): String;
var vlSQL : String;
    vlStrFecha : String;
begin
  vlStrFecha := #39+FormatDateTime('DD/MM/YYYY',peFECHA)+#39;
  vlSQL :=   '   SELECT CCCT.*,''<<>>'' AS SEP_I ,CCOC.*, ''<<>>'' AS SEP_II ,JAVI.*'+coCRLF+
             '   FROM'+coCRLF+
             '   (      SELECT CT.Id_Credito,'+coCRLF+
             '                CT.Id_Transaccion, CT.Cve_Operacion As Cve_Oper_Cred,'+coCRLF+
             '                NVL(CT.Cve_Comision, ''NA'') AS Cve_Comision,'+coCRLF+
             '                CDT.Cve_Concepto,CT.Cve_Tipo_Movto,'+coCRLF+
             '                CDT.Imp_Concepto,CT.F_Operacion,'+coCRLF+
             '                CT.F_Valor,CT.Sit_Transaccion,'+coCRLF+
             '                CTO.id_empresa,CRCTO.Cve_Producto_Cre As Cve_Producto,'+coCRLF+
             '                CTO.Cve_Moneda,'+coCRLF+
             '                PKGCRREDESCTO.OBTCCOSTO(CT.Id_Credito) AS Id_Cent_Costo,'+coCRLF+
             '                CTO.Id_Titular as Id_Acreditado,'+coCRLF+
             '                ''TRA'' AS Cve_Origen_tran,'+coCRLF+
             '                TO_CHAR(CT.Id_Transaccion) AS Tx_Referencia,'+coCRLF+
             '                PER.Cve_Tipo_Sector,'+coCRLF+
             '                     PROD.Cve_Ind_Adi_Cont AS Refinanciamiento,'+coCRLF+
             '                     PROD.Cve_Pr_Contable AS Num_Prod_Contabilidad'+coCRLF+
             '           FROM Cr_Transaccion CT, Persona PER, Cr_Det_Transac CDT,'+coCRLF+
             '                Cr_Credito CRED, Contrato CTO, Cr_Contrato CRCTO, Cr_Producto PROD,'+coCRLF+
             '                Cr_Operacion COPE, CR_CONT_SIS_PROD SPROD, CR_CONCEPTO CCO'+coCRLF+
             '                /* ROIM 17/04/2006 SE AGREGA CAMPO PARA DESCRIMINER CONCEPTOS*/'+coCRLF+
             '                ,CR_REL_OPE_CON CROC'+coCRLF+
             '                /* /ROIM */'+coCRLF+
             '          WHERE CDT.Id_Transaccion = CT.Id_Transaccion'+coCRLF+
             '            AND CDT.Cve_Operacion  = CT.Cve_Operacion'+coCRLF+
             '            AND CT.Id_Credito = CRED.Id_Credito'+coCRLF+
             '            AND CRED.Id_Contrato = CTO.Id_Contrato'+coCRLF+
             '            AND CRED.Id_Contrato = CRCTO.Id_Contrato'+coCRLF+
             '            AND CRED.Fol_Contrato = CRCTO.Fol_Contrato'+coCRLF+
             '            AND CRCTO.Cve_Producto_Cre = PROD.Cve_Producto_Cre'+coCRLF+
             '            AND CRCTO.Cve_Producto_Cre = SPROD.Cve_Producto_Cre'+coCRLF+
             '            AND CT.Cve_Operacion = COPE.Cve_Operacion'+coCRLF+
             '            AND SPROD.CVE_CONT_SISTEMA = ''CTICRE'''+coCRLF+
             '            AND PROD.B_Genera_Conta = ''V'''+coCRLF+
             '            AND CCO.Cve_Concepto = CDT.Cve_Concepto'+coCRLF+
             '            AND CCO.b_gen_conta_icre = ''V'''+coCRLF+
             '            AND COPE.B_Gen_Conta_Icre = ''V'''+coCRLF+
             '            AND CT.Sit_Transaccion = ''AC'''+coCRLF+
             '            AND NVL(CT.B_Contabilizado,''F'') = ''F'''+coCRLF+
             '            AND CTO.id_empresa = 2'+coCRLF+
             '            AND CT.F_Operacion = TO_DATE('+vlStrFecha+',''DD/MM/YYYY'')'+coCRLF+
             '            AND PER.Id_Persona = CTO.Id_Titular'+coCRLF+
             '            /* ROIM 17/04/2006 SE AGREGA CAMPO PARA DESCRIMINER CONCEPTOS*/'+coCRLF+
             '            AND CROC.CVE_OPERACION = CDT.CVE_OPERACION'+coCRLF+
             '            AND CROC.CVE_CONCEPTO = CDT.CVE_CONCEPTO'+coCRLF+
             '            AND (CROC.B_OMITE_CON_I IS NULL OR CROC.B_OMITE_CON_I = ''F'')'+coCRLF+
             '            /* /ROIM */'+coCRLF+
             '          UNION ALL'+coCRLF+
             '          SELECT CH.Id_Credito,'+coCRLF+
             '                CH.Id_Credito AS Id_Transaccion,'+coCRLF+
             '                /*ROIM*/'+coCRLF+
             '                DECODE(CCE.CVE_TIPO_INTERES,''IN'',''INPROV'',NULL,''PROVIS'',''PROVIS'') AS Cve_Oper_Cred,'+coCRLF+
             '                /*ROIM FIN*/'+coCRLF+
             '                ''NA'' AS Cve_Comision, ''IMPBRU'' AS Cve_Concepto,'+coCRLF+
             '                DECODE(CH.F_Traspaso_Venc, NULL, ''MD'', ''IV'') AS Cve_Tipo_Movto,'+coCRLF+
             '                CH.Imp_Interes_Dia AS Imp_Concepto,'+coCRLF+
             '                CH.F_Cierre AS F_Operacion, CH.F_Cierre AS F_Valor,'+coCRLF+
             '                ''AC'' AS Sit_Transaccion, CTO.id_empresa,'+coCRLF+
             '                CRCTO.Cve_Producto_Cre As Cve_Producto,'+coCRLF+
             '                CTO.Cve_Moneda,'+coCRLF+
             '                PKGCRREDESCTO.OBTCCOSTO(CH.Id_Credito) AS Id_Cent_Costo,'+coCRLF+
             '                CTO.Id_Titular as Id_Acreditado,''PRO'' AS Cve_Origen_tran,'+coCRLF+
             '                TO_CHAR(CH.Id_Credito) AS Tx_Referencia,'+coCRLF+
             '                PER.Cve_Tipo_Sector,'+coCRLF+
             '                     PROD.Cve_Ind_Adi_Cont AS Refinanciamiento,'+coCRLF+
             '                     PROD.Cve_Pr_Contable AS Num_Prod_Contabilidad'+coCRLF+
             '           FROM Cr_Histo_Cred CH, Cr_Credito CRED, Contrato CTO,'+coCRLF+
             '                Cr_Contrato CRCTO, Persona PER, Cr_Producto PROD, CR_CONT_SIS_PROD SPROD'+coCRLF+
             '                /*ROIM*/'+coCRLF+
             '                ,(SELECT * FROM CR_CESION) CCE'+coCRLF+
             '                /*ROIM FIN*/'+coCRLF+
             '          WHERE CH.Id_Credito = CRED.Id_Credito'+coCRLF+
             '            AND CRED.Id_Contrato = CTO.Id_Contrato'+coCRLF+
             '            AND CRED.Id_Contrato = CRCTO.Id_Contrato'+coCRLF+
             '            AND CRED.Fol_Contrato = CRCTO.Fol_Contrato'+coCRLF+
             '            AND CRCTO.Cve_Producto_Cre = PROD.Cve_Producto_Cre'+coCRLF+
             '            AND CRCTO.Cve_Producto_Cre = SPROD.Cve_Producto_Cre'+coCRLF+
             '            AND SPROD.CVE_CONT_SISTEMA = ''CTICRE'''+coCRLF+
             '            AND PROD.B_Genera_Conta = ''V'''+coCRLF+
             '            AND NVL(CH.B_Contabilizado,''F'') = ''F'''+coCRLF+
             '            AND CTO.id_empresa = 2'+coCRLF+
             '            AND CH.F_Cierre    = TO_DATE('+vlStrFecha+',''DD/MM/YYYY'')'+coCRLF+
             '            AND PER.Id_Persona = CTO.Id_Titular'+coCRLF+
             '                /*ROIM*/'+coCRLF+
             '            AND CCE.ID_CESION (+)= CRED.Id_Credito'+coCRLF+
             '                /*ROIM FIN*/'+coCRLF+
             '          UNION ALL'+coCRLF+
             '          SELECT CRED.Id_Credito,'+coCRLF+
             '                GA.Id_Solicitud AS Id_Transaccion,'+coCRLF+
             '                ''GARANT'' AS Cve_Oper_Cred,'+coCRLF+
             '                ''NA'' AS Cve_Comision,'+coCRLF+
             '                ''IMPBRU'' AS Cve_Concepto,'+coCRLF+
             '                ''NA'' AS Cve_Tipo_Movto,'+coCRLF+
             '                GAD.Imp_Garantia AS Imp_Concepto,'+coCRLF+
             '                GA.F_Revision_Gar AS F_Operacion,'+coCRLF+
             '                GA.F_Revision_Gar AS F_Valor,'+coCRLF+
             '                ''AC'' AS Sit_Transaccion,'+coCRLF+
             '                CTO.id_empresa,'+coCRLF+
             '                CRCTO.Cve_Producto_Cre As Cve_Producto,'+coCRLF+
             '                CTO.Cve_Moneda,'+coCRLF+
             '                PKGCRREDESCTO.OBTCCOSTO(CRED.Id_Credito) AS Id_Cent_Costo,'+coCRLF+
             '                CTO.Id_Titular as Id_Acreditado,'+coCRLF+
             '                ''GAR'' AS Cve_Origen_tran,'+coCRLF+
             '                TO_CHAR(GA.Id_Solicitud) AS Tx_Referencia,'+coCRLF+
             '                PER.Cve_Tipo_Sector,'+coCRLF+
             '                     PROD.Cve_Ind_Adi_Cont AS Refinanciamiento,'+coCRLF+
             '                     PROD.Cve_Pr_Contable AS Num_Prod_Contabilidad'+coCRLF+
             '           FROM Cr_Ga_Registro GA, Cr_Ga_Dis_Gar GAD, Cr_Credito CRED,'+coCRLF+
             '                 Contrato CTO, Cr_Contrato CRCTO, Persona PER, Cr_Producto PROD, CR_CONT_SIS_PROD SPROD'+coCRLF+
             '           WHERE GA.Id_Solicitud = GAD.Id_Reg_Sol_Gar'+coCRLF+
             '            AND GAD.Id_Disposicion = CRED.Id_Credito'+coCRLF+
             '            AND CRED.Id_Contrato = CTO.Id_Contrato'+coCRLF+
             '            AND CRED.Id_Contrato = CRCTO.Id_Contrato'+coCRLF+
             '            AND CRED.Fol_Contrato = CRCTO.Fol_Contrato'+coCRLF+
             '            AND CRCTO.Cve_Producto_Cre = PROD.Cve_Producto_Cre'+coCRLF+
             '            AND CRCTO.Cve_Producto_Cre = SPROD.Cve_Producto_Cre'+coCRLF+
             '            AND SPROD.CVE_CONT_SISTEMA = ''CTICRE'''+coCRLF+
             '            AND PROD.B_Genera_Conta = ''V'''+coCRLF+
             '            AND NVL(GA.B_Contabilizado,''F'') = ''F'''+coCRLF+
             '            AND CTO.id_empresa = 2'+coCRLF+
             '            AND GA.F_Revision_Gar = TO_DATE('+vlStrFecha+',''DD/MM/YYYY'')'+coCRLF+
             '            AND PER.Id_Persona = CTO.Id_Titular'+coCRLF+
             '          ORDER BY Id_credito, Cve_Origen_tran, Tx_Referencia ) JAVI,'+coCRLF+
             '   (      SELECT * FROM cr_cont_cnf_tran) CCCT,'+coCRLF+
             '   (      SELECT * FROM cr_cont_ope_con) CCOC'+coCRLF+
             '   WHERE CCCT.ID_EMPRESA    (+)= JAVI.id_empresa'+coCRLF+
             '   AND   CCCT.CVE_PRODUCTO  (+)= JAVI.CVE_PRODUCTO'+coCRLF+
             '   AND   CCCT.CVE_MONEDA    (+)= JAVI.CVE_MONEDA'+coCRLF+
             '   AND   CCCT.CVE_OPER_CRED (+)= JAVI.CVE_OPER_CRED'+coCRLF+
             '   AND   CCCT.CVE_COMISION  (+)= JAVI.CVE_COMISION'+coCRLF+
             '   AND   CCCT.CVE_CONCEPTO  (+)= JAVI.CVE_CONCEPTO'+coCRLF+
             '   AND   CCCT.CVE_TIPO_MOVTO(+)= JAVI.CVE_TIPO_MOVTO'+coCRLF+
             '   AND   CCOC.ID_EMPRESA    (+)= JAVI.id_empresa'+coCRLF+
             '   AND   CCOC.CVE_OPER_CRED (+)= JAVI.CVE_OPER_CRED'+coCRLF+
             '   AND   CCOC.CVE_COMISION  (+)= JAVI.CVE_COMISION'+coCRLF+
             '   AND   CCOC.CVE_CONCEPTO  (+)= JAVI.CVE_CONCEPTO'+coCRLF+
             '   AND   CCOC.CVE_TIPO_MOVTO(+)= JAVI.CVE_TIPO_MOVTO'+coCRLF+
             '   AND   JAVI.CVE_OPER_CRED <> ''GARANT'''+coCRLF+
             '    AND   (CCCT.CVE_PRODUCTO IS NULL'+coCRLF+
             '    OR    CCOC.CVE_OPER_CRED IS NULL)'+coCRLF+
             '   --And   javi.cve_producto LIKE ''%PPI%'''+coCRLF
            ;
 Result := vlSQL;
end;

function TIcresap.ArmaQueryCtasSAP(peFECHA: TDateTime): String;
var vlSQL : String;
    vlStrFecha : String;
begin
  vlStrFecha := SQLFecha(peFECHA);
{  vlSQL := ' SELECT /*+ CHOOSE */ CTA_FALTANTES.F_OPERACION, CCSTD.*, P.NOMBRE, CP.DESC_L_PRODUCTO'+coCRLF+
           ' FROM ( SELECT /*+ CHOOSE */ TEMP.*'+coCRLF+
           '        FROM ( SELECT CCSTD.FOL_GENERACION,'+coCRLF+
           '                      CCST.F_OPERACION,'+coCRLF+
           '                      CCSTD.CVE_MONEDA,'+coCRLF+
           '                      CCE.CUENTA,'+coCRLF+
           '                      CCSTD.CVE_CTA_CONTABLE'+coCRLF+
           '               FROM CR_CONT_GEN_TR_D CCSTD,'+coCRLF+
           '                    CR_CREDITO CC,'+coCRLF+
           '                    CR_CONTRATO CO,'+coCRLF+
           '                    CONTRATO CTO,'+coCRLF+
           '                    CG_CUENTA_EQUIV@CONT CCE,'+coCRLF+
           '                    ( SELECT FOL_GENERACION, F_OPERACION'+coCRLF+
           '                      FROM CR_CONT_GEN_TRAN'+coCRLF+
           '                      WHERE SIT_GENERACION = ''GEN'''+coCRLF+
           '                        AND F_OPERACION = '+vlStrFecha+coCRLF+
           '                    ) CCST'+coCRLF+
           '               WHERE CCSTD.FOL_GENERACION = CCST.FOL_GENERACION'+coCRLF+
           '                 AND CC.ID_CREDITO = CCSTD.ID_CREDITO'+coCRLF+
           '                 AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
           '                 AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
           '                 AND CTO.ID_EMPRESA = 2'+coCRLF+
           '                 AND CTO.CVE_MONEDA = 484'+coCRLF+
           '                 AND CCE.CVE_CTA_CONTABLE (+)= CCSTD.CVE_CTA_CONTABLE'+coCRLF+
           '               GROUP BY CCSTD.FOL_GENERACION, CCST.F_OPERACION, CCSTD.CVE_MONEDA, CCE.CUENTA, CCSTD.CVE_CTA_CONTABLE'+coCRLF+
           '              ) TEMP'+coCRLF+
           '        WHERE TEMP.CUENTA IS NULL'+coCRLF+
           '      ) CTA_FALTANTES,'+coCRLF+
           '      CR_CONT_GEN_TR_D CCSTD,'+coCRLF+
           '      PERSONA P,'+coCRLF+
           '      CR_PRODUCTO CP'+coCRLF+
           ' WHERE CCSTD.FOL_GENERACION = CTA_FALTANTES.FOL_GENERACION'+coCRLF+
           '   AND CCSTD.CVE_MONEDA = CTA_FALTANTES.CVE_MONEDA'+coCRLF+
           '   AND CCSTD.CVE_CTA_CONTABLE = CTA_FALTANTES.CVE_CTA_CONTABLE'+coCRLF+
           '   AND P.ID_PERSONA = CCSTD.ID_ACREDITADO'+coCRLF+
           '   AND CP.CVE_PRODUCTO_CRE = CCSTD.CVE_PRODUCTO'+coCRLF; }

  vlSQL :=  ' SELECT TEMP.*'+coCRLF+
            ' FROM ( SELECT CCSTD.FOL_GENERACION,'+coCRLF+
            '               CCST.F_OPERACION,'+coCRLF+
            '               CCSTD.CVE_MONEDA,'+coCRLF+
            '               CCE.CUENTA,'+coCRLF+
            '               CCSTD.CVE_CTA_CONTABLE'+coCRLF+
            '        FROM CR_CONT_GEN_TR_D CCSTD,'+coCRLF+
            '             CR_CREDITO CC,'+coCRLF+
            '             CR_CONTRATO CO,'+coCRLF+
            '             CONTRATO CTO,'+coCRLF+
            '             CG_CUENTA_EQUIV@CONT CCE,'+coCRLF+
            '             ( SELECT FOL_GENERACION, F_OPERACION'+coCRLF+
            '               FROM CR_CONT_GEN_TRAN'+coCRLF+
            '               WHERE SIT_GENERACION = ''GEN'' '+coCRLF+
            '                 AND F_OPERACION = '+vlStrFecha+coCRLF+
            '             ) CCST'+coCRLF+
            '        WHERE CCSTD.FOL_GENERACION = CCST.FOL_GENERACION'+coCRLF+
            '          AND CC.ID_CREDITO = CCSTD.ID_CREDITO'+coCRLF+
            '          AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '          AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '          AND CTO.ID_EMPRESA = 2'+coCRLF+
            '          AND CTO.CVE_MONEDA = 484'+coCRLF+
            '          AND CCE.CVE_CTA_CONTABLE (+)= CCSTD.CVE_CTA_CONTABLE'+coCRLF+
            '        GROUP BY CCSTD.FOL_GENERACION, CCST.F_OPERACION, CCSTD.CVE_MONEDA, CCE.CUENTA, CCSTD.CVE_CTA_CONTABLE'+coCRLF+
            '       ) TEMP'+coCRLF+
            ' WHERE TEMP.CUENTA IS NULL'+coCRLF;
  Result := vlSQL;
end;

function TIcresap.ArmaQueryMXN_ICRE(peFECHA: TDateTime; peMetodo : Integer;
                                             peCVE_CTA_CONTABLE, peCVE_TIPO_SECTOR, peCVE_PRODUCTO_CRE : String): String;
var vlSQL : String;
    vlStrFecha, vlCVE_CTA_CONTABLE, vlCVE_PRODUCTO_CRE, vlCVE_TIPO_SECTOR : String;
begin
    vlStrFecha := SQLFecha(peFECHA);
    vlCVE_CTA_CONTABLE := #39+Trim(peCVE_CTA_CONTABLE)+#39;
    vlCVE_PRODUCTO_CRE := #39+Trim(peCVE_PRODUCTO_CRE)+#39;
    vlCVE_TIPO_SECTOR  := #39+Trim(peCVE_TIPO_SECTOR)+#39;

    vlSQL := '   SELECT ''ICRE'' AS ID,'+coCRLF+
             '          NVL(ACT.TIPO_SALDO, ANT.TIPO_SALDO) AS TIPO,'+coCRLF+
             '          ANT.ID_CREDITO AS CRED_ANT,'+coCRLF+
             '          ACT.ID_CREDITO AS CRED_ACT,'+coCRLF+
             '          NVL(ACT.ID_OLTP_PRODUCTO, ANT.ID_OLTP_PRODUCTO) AS PRODUCTO,'+coCRLF+
             '          NVL(ACT.CVE_TIPO_SECTOR, ANT.CVE_TIPO_SECTOR) AS SECTOR,'+coCRLF+
             '          ''<<>>'' AS S1,'+coCRLF+
             '          NVL(ANT.SDO,0) AS IMP_ANT,'+coCRLF+
             '          NVL(SAP.SDO,0) AS IMP_MOVTO_SAP,'+coCRLF+
             '          (NVL(ANT.SDO,0) + NVL(SAP.SDO,0)) AS IMP_ACT,'+coCRLF+
             '          ''<<>>'' AS S2,'+coCRLF+
             '          NVL(ACT.SDO,0) AS IMP_ACTUAL,'+coCRLF+
             '          ''<<>>'' AS S3,'+coCRLF+
             '          (NVL(ANT.SDO,0) + NVL(SAP.SDO,0) - NVL(ACT.SDO,0)) AS DIF'+coCRLF+
             '   FROM  ( SELECT CCS.*'+coCRLF+
             '           FROM ( SELECT CCS.ID_OLTP_PRODUCTO,'+coCRLF+
             '                         P.CVE_TIPO_SECTOR,'+coCRLF+
             '                         CCS.CVE_SECTOR_SAP,'+coCRLF+
             '                         CCAS.ID_CREDITO,'+coCRLF+
             '                         DECODE ( ID_REPORTE, 4, ''IMP_CAP_VIG'','+coCRLF+
             '                                             16, ''IMP_CAP_IMP'','+coCRLF+
             '                                             20, ''IMP_CAP_VDO'','+coCRLF+
             '                                             30, ''IMP_INT_VIG'','+coCRLF+
             '                                              9, ''IMP_INT_IMP'','+coCRLF+
             '                                             31, ''IMP_INT_VDO'','+coCRLF+
             '                                             32, ''IMP_INT_COB_ANT'''+coCRLF+
             '                                ) AS TIPO_SALDO,'+coCRLF+
             '                         DECODE ( ID_REPORTE, 4, CCAS.IMP_CAP_VIG,'+coCRLF+
             '                                             16, CCAS.IMP_CAP_IMP,'+coCRLF+
             '                                             20, (CCAS.IMP_CAP_VDO_EX + CCAS.IMP_CAP_VDO_NE),'+coCRLF+
             '                                             30, (CCAS.IMP_INT_VIG),'+coCRLF+
             '                                              9, (CCAS.IMP_INT_IMP),'+coCRLF+
             '                                             31, (CCAS.IMP_INT_VDO_EX + CCAS.IMP_INT_VDO_NE),'+coCRLF+
             '                                             32, (CCAS.IMP_COMISION_C * -1)'+coCRLF+
             '                                ) AS SDO'+coCRLF+
             '                  FROM ( SELECT ID_OLTP_PRODUCTO, ID_REPORTE, CVE_SECTOR_SAP'+coCRLF+
             '                         FROM CR_COINCRE_SAP'+coCRLF+
             '                         WHERE CVE_CUENTA IN ('+vlCVE_CTA_CONTABLE+')'+coCRLF+
             '                           AND CVE_SECTOR_SAP = '+vlCVE_TIPO_SECTOR+coCRLF+
             '                           AND CVE_MONEDA = 484'+coCRLF+
             '                       ) CCS,'+coCRLF+
             '                       CR_CON_ADEUDO_SDO CCAS,'+coCRLF+
             '                       CR_CREDITO CC,'+coCRLF+
             '                       CR_CONTRATO CO,'+coCRLF+
             '                       CONTRATO CTO,'+coCRLF+
             '                       PERSONA P'+coCRLF+
             '                  WHERE CCAS.F_CIERRE = ('+vlStrFecha+' - 1)'+coCRLF+
             '                    AND CC.ID_CREDITO = CCAS.ID_CREDITO'+coCRLF+
             '                    AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '                    AND CTO.CVE_MONEDA = 484'+coCRLF+
             '                    AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '                    AND CO.CVE_PRODUCTO_CRE = CCS.ID_OLTP_PRODUCTO'+coCRLF+
             '                    AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
             '                    AND P.CVE_TIPO_SECTOR = CCS.CVE_SECTOR_SAP'+coCRLF+
             '                ) CCS'+coCRLF+
             '            WHERE CCS.SDO <> 0'+coCRLF;
    vlSQL := vlSQL +
             '         ) ANT,'+coCRLF+
             '         ( SELECT CCS.*'+coCRLF+
             '           FROM ( SELECT CCS.ID_OLTP_PRODUCTO,'+coCRLF+
             '                         P.CVE_TIPO_SECTOR,'+coCRLF+
             '                         CCS.CVE_SECTOR_SAP,'+coCRLF+
             '                         CCAS.ID_CREDITO,'+coCRLF+
             '                         DECODE ( ID_REPORTE, 4, ''IMP_CAP_VIG'','+coCRLF+
             '                                             16, ''IMP_CAP_IMP'','+coCRLF+
             '                                             20, ''IMP_CAP_VDO'','+coCRLF+
             '                                             30, ''IMP_INT_VIG'','+coCRLF+
             '                                              9, ''IMP_INT_IMP'','+coCRLF+
             '                                             31, ''IMP_INT_VDO'','+coCRLF+
             '                                             32, ''IMP_INT_COB_ANT'''+coCRLF+             
             '                                ) AS TIPO_SALDO,'+coCRLF+
             '                         DECODE ( ID_REPORTE, 4, CCAS.IMP_CAP_VIG,'+coCRLF+
             '                                             16, CCAS.IMP_CAP_IMP,'+coCRLF+
             '                                             20, (CCAS.IMP_CAP_VDO_EX + CCAS.IMP_CAP_VDO_NE),'+coCRLF+
             '                                             30, (CCAS.IMP_INT_VIG),'+coCRLF+
             '                                              9, (CCAS.IMP_INT_IMP),'+coCRLF+
             '                                             31, (CCAS.IMP_INT_VDO_EX + CCAS.IMP_INT_VDO_NE),'+coCRLF+
             '                                             32, (CCAS.IMP_COMISION_C * -1)'+coCRLF+
             '                                ) AS SDO'+coCRLF+
             '                  FROM ( SELECT ID_OLTP_PRODUCTO, ID_REPORTE, CVE_SECTOR_SAP'+coCRLF+
             '                         FROM CR_COINCRE_SAP'+coCRLF+
             '                         WHERE CVE_CUENTA IN ('+vlCVE_CTA_CONTABLE+')'+coCRLF+
             '                           AND CVE_SECTOR_SAP = '+vlCVE_TIPO_SECTOR+coCRLF+
             '                           AND CVE_MONEDA = 484'+coCRLF+
             '                       ) CCS,'+coCRLF+
             '                       CR_CON_ADEUDO_SDO CCAS,'+coCRLF+
             '                       CR_CREDITO CC,'+coCRLF+
             '                       CR_CONTRATO CO,'+coCRLF+
             '                       CONTRATO CTO,'+coCRLF+
             '                       PERSONA P'+coCRLF+
             '                  WHERE CCAS.F_CIERRE = '+vlStrFecha+coCRLF+
             '                    AND CC.ID_CREDITO = CCAS.ID_CREDITO'+coCRLF+
             '                    AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '                    AND CTO.CVE_MONEDA = 484'+coCRLF+
             '                    AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '                    AND CO.CVE_PRODUCTO_CRE = CCS.ID_OLTP_PRODUCTO'+coCRLF+
             '                    AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
             '                    AND P.CVE_TIPO_SECTOR = CCS.CVE_SECTOR_SAP'+coCRLF+
             '                ) CCS'+coCRLF+
             '            WHERE CCS.SDO <> 0'+coCRLF;
    vlSQL := vlSQL +
             '         ) ACT,'+coCRLF+
             '         ('+coCRLF+
             '           SELECT TEMP.ID_CREDITO, SUM(TEMP.SDO) AS SDO'+coCRLF+
             '           FROM ('+coCRLF+
             '                 SELECT CCE.CUENTA, MOVTOS.*'+coCRLF+
             '                 FROM'+coCRLF+
             '                    ( SELECT * FROM CG_CUENTA_EQUIV@CONT'+coCRLF+
             '                      WHERE ID_EMPRESA = 2'+coCRLF+
             '                    ) CCE,'+coCRLF+
             '                    ( SELECT CCGTD.CVE_CTA_CONTABLE,'+coCRLF+
             '                             P.CVE_TIPO_SECTOR,'+coCRLF+
             '                             CCGTD.ID_CREDITO,'+coCRLF+
             '                             SUM((CCGTD.IMP_MOVIMIENTO * DECODE(CCGTD.TIPO_AFECTACION,''D'',1,-1))) AS SDO'+coCRLF+
             '                      FROM CR_CONT_GEN_TR_D CCGTD,'+coCRLF+
             '                           ( SELECT ID_OLTP_PRODUCTO, ID_REPORTE, CVE_SECTOR_SAP'+coCRLF+
             '                             FROM CR_COINCRE_SAP'+coCRLF+
             '                             WHERE CVE_CUENTA IN ('+vlCVE_CTA_CONTABLE+')'+coCRLF+
             '                               AND CVE_SECTOR_SAP = '+vlCVE_TIPO_SECTOR+coCRLF+
             '                               AND CVE_MONEDA = 484'+coCRLF;

    vlSQL := vlSQL +               
             '                           ) CCS,'+coCRLF+
             '                           ( SELECT FOL_GENERACION, F_OPERACION, SIT_GENERACION'+coCRLF+
             '                             FROM CR_CONT_GEN_TRAN'+coCRLF+
             '                             WHERE F_OPERACION = '+vlStrFecha+coCRLF+
             '                           ) CCGT,'+coCRLF+
             '                           CR_CREDITO CC,'+coCRLF+
             '                           CONTRATO CTO,'+coCRLF+
             '                           PERSONA P'+coCRLF+
             '                      WHERE CCGTD.FOL_GENERACION = CCGT.FOL_GENERACION'+coCRLF+
             '                        AND CCGTD.CVE_MONEDA = 484'+coCRLF+
             '                        AND CCGTD.CVE_PRODUCTO = CCS.ID_OLTP_PRODUCTO'+coCRLF+
             '                        AND CC.ID_CREDITO = CCGTD.ID_CREDITO'+coCRLF+
             '                        AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '                        AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
             '                        AND P.CVE_TIPO_SECTOR = '+vlCVE_TIPO_SECTOR+coCRLF+
             '                      GROUP BY CCGTD.CVE_CTA_CONTABLE, P.CVE_TIPO_SECTOR, CCGTD.ID_CREDITO'+coCRLF+
             '                    ) MOVTOS'+coCRLF+
             '                 WHERE CCE.CVE_CTA_CONTABLE = MOVTOS.CVE_CTA_CONTABLE'+coCRLF+
             '                   AND CCE.SECTOR = MOVTOS.CVE_TIPO_SECTOR'+coCRLF+
             '                   AND CCE.CUENTA IN ('+vlCVE_CTA_CONTABLE+')'+coCRLF+
             '                 ) TEMP'+coCRLF+
             '            GROUP BY ID_CREDITO'+coCRLF+
            '       ) SAP'+coCRLF+
            '  WHERE 1 = 1'+coCRLF;

  If (Trim(peCVE_PRODUCTO_CRE) <> '') Then
    vlSQL := vlSQL +
                  ' AND NVL(ACT.ID_OLTP_PRODUCTO, ANT.ID_OLTP_PRODUCTO) = '+vlCVE_PRODUCTO_CRE+coCRLF;

  If (peMetodo = 1) Then
    vlSQL := vlSQL +
             '    AND ACT.ID_CREDITO (+)= ANT.ID_CREDITO AND SAP.ID_CREDITO (+)= ANT.ID_CREDITO'+coCRLF
  Else
    vlSQL := vlSQL +
             '    AND ANT.ID_CREDITO (+)= ACT.ID_CREDITO AND SAP.ID_CREDITO (+)= ACT.ID_CREDITO'+coCRLF;
  Result := vlSQL;
end;


function TIcresap.ArmaQueryUSD_ICRE(peFECHA: TDateTime; peMetodo: Integer;
                                             peCVE_CTA_CONTABLE, peCVE_TIPO_SECTOR, peCVE_PRODUCTO_CRE: String): String;
var vlSQL : String;
    vlStrFecha, vlCVE_CTA_CONTABLE, vlCVE_PRODUCTO_CRE, vlCVE_TIPO_SECTOR : String;
begin
    vlStrFecha := SQLFecha(peFECHA);
    vlCVE_CTA_CONTABLE := #39+peCVE_CTA_CONTABLE+#39;
    vlCVE_PRODUCTO_CRE := #39+peCVE_PRODUCTO_CRE+#39;
    vlCVE_TIPO_SECTOR  := #39+peCVE_TIPO_SECTOR+#39;
    
    vlSQL :=      ' SELECT NVL(ACT.TIPO_SALDO, ANT.TIPO_SALDO) AS TIPO,'+coCRLF+
                  '        ANT.ID_CREDITO AS CRED_ANT,'+coCRLF+
                  '        ACT.ID_CREDITO AS CRED_ACT,'+coCRLF+
                  '        NVL(ACT.ID_OLTP_PRODUCTO, ANT.ID_OLTP_PRODUCTO) AS PRODUCTO,'+coCRLF+
                  '        NVL(ACT.CVE_TIPO_SECTOR, ANT.CVE_TIPO_SECTOR) AS SECTOR,'+coCRLF+
                  '        ''<<>>'' AS S1,'+coCRLF+
                  '        NVL(ANT.SDO,0) AS IMP_ANT,'+coCRLF+
                  '        NVL(SAP.SDO,0) AS IMP_MOVTO_SAP,'+coCRLF+
                  '        (NVL(ANT.SDO,0) + NVL(SAP.SDO,0)) AS IMP_SAP2,'+coCRLF+
                  '        ''<<>>'' AS S2,'+coCRLF+
                  '        NVL(ACT.SDO,0) AS IMP_ACTUAL,'+coCRLF+
                  '        ''<<>>'' AS S3,'+coCRLF+
                  '        (NVL(ANT.SDO,0) + NVL(SAP.SDO,0) - NVL(ACT.SDO,0)) AS DIF'+coCRLF+
                  ' FROM  ( SELECT CCS.*'+coCRLF+
                  '         FROM ( SELECT CCS.ID_OLTP_PRODUCTO,'+coCRLF+
                  '                       P.CVE_TIPO_SECTOR,'+coCRLF+
                  '                       CCS.CVE_SECTOR_SAP,'+coCRLF+
                  '                       CCAS.ID_CREDITO,'+coCRLF+
                  '                       DECODE ( ID_REPORTE, 4, ''IMP_CAP_VIG'','+coCRLF+
                  '                                           16, ''IMP_CAP_IMP'','+coCRLF+
                  '                                           20, ''IMP_CAP_VDO'','+coCRLF+
                  '                                           30, ''IMP_INT_VIG'','+coCRLF+
                  '                                            9, ''IMP_INT_IMP'','+coCRLF+
                  '                                           31, ''IMP_INT_VDO'''+coCRLF+
                  '                              ) AS TIPO_SALDO,'+coCRLF+
                  '                       DECODE ( ID_REPORTE, 4, CCAS.IMP_CAP_VIG,'+coCRLF+
                  '                                           16, CCAS.IMP_CAP_IMP,'+coCRLF+
                  '                                           20, (CCAS.IMP_CAP_VDO_EX + CCAS.IMP_CAP_VDO_NE),'+coCRLF+
                  '                                           30, (CCAS.IMP_INT_VIG),'+coCRLF+
                  '                                            9, (CCAS.IMP_INT_IMP),'+coCRLF+
                  '                                           31, (CCAS.IMP_INT_VDO_EX + CCAS.IMP_INT_VDO_NE)'+coCRLF+
                  '                              ) AS SDO'+coCRLF+
                  '                FROM ( SELECT ID_OLTP_PRODUCTO, ID_REPORTE, CVE_SECTOR_SAP'+coCRLF+
                  '                       FROM CR_COINCRE_SAP'+coCRLF+
                  '                       WHERE CVE_CUENTA = '+vlCVE_CTA_CONTABLE+coCRLF+
                  '                         AND CVE_SECTOR_SAP = '+vlCVE_TIPO_SECTOR+coCRLF+
                  '                         AND CVE_MONEDA = 840'+coCRLF+
                  '                     ) CCS,'+coCRLF+
                  '                     CR_CON_ADEUDO_SDO CCAS,'+coCRLF+
                  '                     CR_CREDITO CC,'+coCRLF+
                  '                     CR_CONTRATO CO,'+coCRLF+
                  '                     CONTRATO CTO,'+coCRLF+
                  '                     PERSONA P'+coCRLF+
                  '                WHERE CCAS.F_CIERRE = ('+vlStrFecha+' - 1)'+coCRLF+
                  '                  AND CC.ID_CREDITO = CCAS.ID_CREDITO'+coCRLF+
                  '                  AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                  '                  AND CTO.CVE_MONEDA = 840'+coCRLF+
                  '                  AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                  '                  AND CO.CVE_PRODUCTO_CRE = CCS.ID_OLTP_PRODUCTO'+coCRLF+
                  '                  AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
                  '                  AND P.CVE_TIPO_SECTOR = CCS.CVE_SECTOR_SAP'+coCRLF+
                  '              ) CCS'+coCRLF+
                  '          WHERE CCS.SDO <> 0'+coCRLF;

         If (Trim(peCVE_PRODUCTO_CRE) <> '') Then
           vlSQL := vlSQL + '    AND CCS.ID_OLTP_PRODUCTO = '+vlCVE_PRODUCTO_CRE+coCRLF;

         vlSQL := vlSQL +
                  '       ) ANT,'+coCRLF+
                  '       ( SELECT CCS.*'+coCRLF+
                  '         FROM ( SELECT CCS.ID_OLTP_PRODUCTO,'+coCRLF+
                  '                       P.CVE_TIPO_SECTOR,'+coCRLF+
                  '                       CCS.CVE_SECTOR_SAP,'+coCRLF+
                  '                       CCAS.ID_CREDITO,'+coCRLF+
                  '                       DECODE ( ID_REPORTE, 4, ''IMP_CAP_VIG'','+coCRLF+
                  '                                           16, ''IMP_CAP_IMP'','+coCRLF+
                  '                                           20, ''IMP_CAP_VDO'','+coCRLF+
                  '                                           30, ''IMP_INT_VIG'','+coCRLF+
                  '                                            9, ''IMP_INT_IMP'','+coCRLF+
                  '                                           31, ''IMP_INT_VDO'''+coCRLF+
                  '                              ) AS TIPO_SALDO,'+coCRLF+
                  '                       DECODE ( ID_REPORTE, 4, CCAS.IMP_CAP_VIG,'+coCRLF+
                  '                                           16, CCAS.IMP_CAP_IMP,'+coCRLF+
                  '                                           20, (CCAS.IMP_CAP_VDO_EX + CCAS.IMP_CAP_VDO_NE),'+coCRLF+
                  '                                           30, (CCAS.IMP_INT_VIG),'+coCRLF+
                  '                                            9, (CCAS.IMP_INT_IMP),'+coCRLF+
                  '                                           31, (CCAS.IMP_INT_VDO_EX + CCAS.IMP_INT_VDO_NE)'+coCRLF+
                  '                              ) AS SDO'+coCRLF+
                  '                FROM ( SELECT ID_OLTP_PRODUCTO, ID_REPORTE, CVE_SECTOR_SAP'+coCRLF+
                  '                       FROM CR_COINCRE_SAP'+coCRLF+
                  '                       WHERE CVE_CUENTA = '+vlCVE_CTA_CONTABLE+coCRLF+
                  '                         AND CVE_SECTOR_SAP = '+vlCVE_TIPO_SECTOR+coCRLF+
                  '                         AND CVE_MONEDA = 840'+coCRLF+
                  '                     ) CCS,'+coCRLF+
                  '                     CR_CON_ADEUDO_SDO CCAS,'+coCRLF+
                  '                     CR_CREDITO CC,'+coCRLF+
                  '                     CR_CONTRATO CO,'+coCRLF+
                  '                     CONTRATO CTO,'+coCRLF+
                  '                     PERSONA P'+coCRLF+
                  '                WHERE CCAS.F_CIERRE = '+vlStrFecha+coCRLF+
                  '                  AND CC.ID_CREDITO = CCAS.ID_CREDITO'+coCRLF+
                  '                  AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                  '                  AND CTO.CVE_MONEDA = 840'+coCRLF+
                  '                  AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                  '                  AND CO.CVE_PRODUCTO_CRE = CCS.ID_OLTP_PRODUCTO'+coCRLF+
                  '                  AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
                  '                  AND P.CVE_TIPO_SECTOR = CCS.CVE_SECTOR_SAP'+coCRLF+
                  '              ) CCS'+coCRLF+
                  '          WHERE CCS.SDO <> 0'+coCRLF;

         If (Trim(peCVE_PRODUCTO_CRE) <> '') Then
           vlSQL := vlSQL + '    AND CCS.ID_OLTP_PRODUCTO = '+vlCVE_PRODUCTO_CRE+coCRLF;

         vlSQL := vlSQL +
                  '       ) ACT,'+coCRLF+
                  '       ( SELECT CCSTD.CVE_CUENTA,'+coCRLF+
                  '                CCSTD.ID_CREDITO,'+coCRLF+
                  '                SUM((CCSTD.IMP_MOVIMIENTO * DECODE(TIPO_AFECTACION,''D'',1,-1))) AS SDO'+coCRLF+
                  '         FROM CR_CONT_SAP_TR_D CCSTD,'+coCRLF+
                  '              ( SELECT FOL_GENERACION, F_OPERACION'+coCRLF+
                  '                FROM CR_CONT_SAP_TRAN'+coCRLF+
                  '                WHERE SIT_GENERACION = ''DER'''+coCRLF+
                  '                  AND F_OPERACION = '+vlStrFecha+coCRLF+
                  '              ) CCST'+coCRLF+
                  '         WHERE CCSTD.FOL_GENERACION = CCST.FOL_GENERACION'+coCRLF+
                  '           AND CCSTD.CVE_MONEDA = 840'+coCRLF+
                  '           AND CCSTD.CVE_CUENTA = '+vlCVE_CTA_CONTABLE+coCRLF+
                  '           AND CCSTD.CVE_SECTOR_SAP = '+vlCVE_TIPO_SECTOR+coCRLF+
                  '         GROUP BY CCSTD.CVE_CUENTA, CCSTD.ID_CREDITO'+coCRLF+
                  '       ) SAP'+coCRLF;
                  
  If (peMetodo = 1) Then
    vlSQL := vlSQL +
                  ' WHERE ACT.ID_CREDITO (+)= ANT.ID_CREDITO AND SAP.ID_CREDITO (+)= ANT.ID_CREDITO'+coCRLF
  Else
    vlSQL := vlSQL +
                  ' WHERE ANT.ID_CREDITO (+)= ACT.ID_CREDITO AND SAP.ID_CREDITO (+)= ACT.ID_CREDITO'+coCRLF;

  Result := vlSQL;
end;

function TIcresap.ArmaQueryMXN(peFECHA: TDateTime;  peMetodo: Integer;
                                        peCVE_CTA_CONTABLE, peCVE_TIPO_SECTOR,  peCVE_SUB_TIP_BCO : String): String;
var vlSQL : String;
    vlStrFecha, vlCVE_CTA_CONTABLE, vlCVE_SUB_TIP_BCO, vlCVE_TIPO_SECTOR : String;
begin
    vlStrFecha := SQLFecha(peFECHA);
    vlCVE_CTA_CONTABLE := #39+peCVE_CTA_CONTABLE+#39;
    vlCVE_SUB_TIP_BCO  := #39+peCVE_SUB_TIP_BCO+#39;
    vlCVE_TIPO_SECTOR  := #39+peCVE_TIPO_SECTOR+#39;
    
    vlSQL := vlSQL +
            ' SELECT ''INTERCREDITOS'' AS ID,'+coCRLF+
            '        NVL(ACT.TIPO_SALDO, ANT.TIPO_SALDO) AS TIPO,'+coCRLF+
            '        ANT.ID_CREDITO AS CRED_ANT,'+coCRLF+
            '        ACT.ID_CREDITO AS CRED_ACT,'+coCRLF+
            '        NVL(ACT.ID_OLTP_PRODUCTO, ANT.ID_OLTP_PRODUCTO) AS CVE_SUB_TIP_BCO,'+coCRLF+
            '        NVL(ACT.CVE_TIPO_SECTOR, ANT.CVE_TIPO_SECTOR) AS SECTOR,'+coCRLF+
            '        ''<<>>'' AS S1,'+coCRLF+
            '        NVL(ANT.SDO,0) AS IMP_ANT,'+coCRLF+
            '        NVL(SAP.SDO,0) AS IMP_MOVTO_SAP,'+coCRLF+
            '        (NVL(ANT.SDO,0) + NVL(SAP.SDO,0)) AS IMP_ACT,'+coCRLF+
            '        ''<<>>'' AS S2,'+coCRLF+
            '        NVL(ACT.SDO,0) AS IMP_ACTUAL,'+coCRLF+
            '        ''<<>>'' AS S3,'+coCRLF+
            '        (NVL(ANT.SDO,0) + NVL(SAP.SDO,0) - NVL(ACT.SDO,0)) AS DIF'+coCRLF+
            ' FROM  ( SELECT CCS.*'+coCRLF+
            '         FROM ( SELECT CCS.ID_OLTP_PRODUCTO,'+coCRLF+
            '                       P.CVE_TIPO_SECTOR,'+coCRLF+
            '                       CCS.CVE_SECTOR_SAP,'+coCRLF+
            '                       CCAS.ID_CREDITO,'+coCRLF+
            '                       DECODE ( ID_REPORTE, 4, ''IMP_CAP_VIG'','+coCRLF+
            '                                           16, ''IMP_CAP_IMP'','+coCRLF+
            '                                           20, ''IMP_CAP_VDO'','+coCRLF+
            '                                           30, ''IMP_INT_VIG'','+coCRLF+
            '                                            9, ''IMP_INT_IMP'','+coCRLF+
            '                                           31, ''IMP_INT_VDO'''+coCRLF+
            '                              ) AS TIPO_SALDO,'+coCRLF+
            '                       DECODE ( ID_REPORTE, 4, CCAS.IMP_CAP_VIG,'+coCRLF+
            '                                           16, CCAS.IMP_CAP_IMP,'+coCRLF+
            '                                           20, (CCAS.IMP_CAP_VDO_EX + CCAS.IMP_CAP_VDO_NE),'+coCRLF+
            '                                           30, (CCAS.IMP_INT_VIG),'+coCRLF+
            '                                            9, (CCAS.IMP_INT_IMP),'+coCRLF+
            '                                           31, (CCAS.IMP_INT_VDO_EX + CCAS.IMP_INT_VDO_NE)'+coCRLF+
            '                              ) AS SDO'+coCRLF+
            '                FROM ( SELECT ID_OLTP_PRODUCTO, ID_REPORTE, CVE_SECTOR_SAP'+coCRLF+
            '                       FROM CR_COINCRE_SAP'+coCRLF+
            '                       WHERE CVE_CUENTA IN ('+vlCVE_CTA_CONTABLE+')'+coCRLF+
            '                         AND CVE_SECTOR_SAP = '+vlCVE_TIPO_SECTOR+coCRLF+
            '                         AND CVE_MONEDA = 484'+coCRLF+
            '                     ) CCS,'+coCRLF+
            '                     CR_CON_ADEUDO_SDO CCAS,'+coCRLF+
            '                     CRE_CREDITO CC,'+coCRLF+
            '                     CRE_CONTRATO CO,'+coCRLF+
            '                     CONTRATO CTO,'+coCRLF+
            '                     PERSONA P'+coCRLF+
            '                WHERE CCAS.F_CIERRE = ('+vlStrFecha+' - 1)'+coCRLF+
            '                  AND CC.ID_CREDITO = CCAS.ID_CREDITO'+coCRLF+
            '                  AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '                  AND CTO.CVE_MONEDA = 484'+coCRLF+
            '                  AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '                  AND TO_CHAR(CO.CVE_SUB_TIP_BCO) = CCS.ID_OLTP_PRODUCTO'+coCRLF+
            '                  AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
            '                  AND P.CVE_TIPO_SECTOR = CCS.CVE_SECTOR_SAP'+coCRLF+
            '              ) CCS'+coCRLF+
            '          WHERE CCS.SDO <> 0'+coCRLF+
            '       ) ANT,'+coCRLF+
            '       ('+coCRLF+
            '        SELECT CCS.*'+coCRLF+
            '         FROM ( SELECT CCS.ID_OLTP_PRODUCTO,'+coCRLF+
            '                       P.CVE_TIPO_SECTOR,'+coCRLF+
            '                       CCS.CVE_SECTOR_SAP,'+coCRLF+
            '                       CCAS.ID_CREDITO,'+coCRLF+
            '                       DECODE ( ID_REPORTE, 4, ''IMP_CAP_VIG'','+coCRLF+
            '                                           16, ''IMP_CAP_IMP'','+coCRLF+
            '                                           20, ''IMP_CAP_VDO'','+coCRLF+
            '                                           30, ''IMP_INT_VIG'','+coCRLF+
            '                                            9, ''IMP_INT_IMP'','+coCRLF+
            '                                           31, ''IMP_INT_VDO'''+coCRLF+
            '                              ) AS TIPO_SALDO,'+coCRLF+
            '                       DECODE ( ID_REPORTE, 4, CCAS.IMP_CAP_VIG,'+coCRLF+
            '                                           16, CCAS.IMP_CAP_IMP,'+coCRLF+
            '                                           20, (CCAS.IMP_CAP_VDO_EX + CCAS.IMP_CAP_VDO_NE),'+coCRLF+
            '                                           30, (CCAS.IMP_INT_VIG),'+coCRLF+
            '                                            9, (CCAS.IMP_INT_IMP),'+coCRLF+
            '                                           31, (CCAS.IMP_INT_VDO_EX + CCAS.IMP_INT_VDO_NE)'+coCRLF+
            '                              ) AS SDO'+coCRLF+
            '                FROM ( SELECT ID_OLTP_PRODUCTO, ID_REPORTE, CVE_SECTOR_SAP'+coCRLF+
            '                       FROM CR_COINCRE_SAP'+coCRLF+
            '                       WHERE CVE_CUENTA IN ('+vlCVE_CTA_CONTABLE+')'+coCRLF+
            '                         AND CVE_SECTOR_SAP = '+vlCVE_TIPO_SECTOR+coCRLF+
            '                         AND CVE_MONEDA = 484'+coCRLF+
            '                     ) CCS,'+coCRLF+
            '                     CR_CON_ADEUDO_SDO CCAS,'+coCRLF+
            '                     CRE_CREDITO CC,'+coCRLF+
            '                     CRE_CONTRATO CO,'+coCRLF+
            '                     CONTRATO CTO,'+coCRLF+
            '                     PERSONA P'+coCRLF+
            '                WHERE CCAS.F_CIERRE = '+vlStrFecha+coCRLF+
            '                  AND CC.ID_CREDITO = CCAS.ID_CREDITO'+coCRLF+
            '                  AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '                  AND CTO.CVE_MONEDA = 484'+coCRLF+
            '                  AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '                  AND TO_CHAR(CO.CVE_SUB_TIP_BCO) = CCS.ID_OLTP_PRODUCTO'+coCRLF+
            '                  AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
            '                  AND P.CVE_TIPO_SECTOR = CCS.CVE_SECTOR_SAP'+coCRLF+
            '              ) CCS'+coCRLF+
            '          WHERE CCS.SDO <> 0'+coCRLF+
            '       ) ACT,'+coCRLF+
            '       ( SELECT CO.CVE_SUB_TIP_BCO,'+coCRLF+
            '                TO_NUMBER(IZT.ID_REFERENCIA) AS ID_CREDITO,'+coCRLF+
            '                SUM(IMP_NETO * DECODE(CVE_TIPO_MOVTO, ''C'', 1, -1) ) AS SDO'+coCRLF+
            '         FROM  ( SELECT IGC.CUENTA,'+coCRLF+
            '                        IGC.CVE_IMP_NEGATIVO AS CVE_TIPO_MOVTO,'+coCRLF+
            '                        IZ.*'+coCRLF+
            '                 FROM IZ_TRANSACCION@CONT IZ,'+coCRLF+
            '                      IZ_GUIA_CONTABLE@CONT IGC'+coCRLF+
            '                 WHERE IZ.ID_EMPRESA = 4010'+coCRLF+
            '                   AND IZ.F_OPERACION = '+vlStrFecha+coCRLF+
            '                   AND IZ.SIT_TRANSACCION = ''AC'''+coCRLF+
            '                   AND IGC.ID_EMPRESA = IZ.ID_EMPRESA'+coCRLF+
            '                   AND IGC.CVE_CONTABLE = IZ.CVE_CONTABLE'+coCRLF+
            '                   AND IGC.CUENTA LIKE SUBSTR('+vlCVE_CTA_CONTABLE+',1,8) || ''%'''+coCRLF+
            '                ) IZT,'+coCRLF+
            '                ( SELECT ID_OLTP_PRODUCTO AS CVE_SUB_TIP_BCO, ID_REPORTE, CVE_SECTOR_SAP'+coCRLF+
            '                  FROM CR_COINCRE_SAP'+coCRLF+
            '                  WHERE CVE_CUENTA IN ('+vlCVE_CTA_CONTABLE+')'+coCRLF+
            '                    AND CVE_SECTOR_SAP = '+vlCVE_TIPO_SECTOR+coCRLF+
            '                    AND CVE_MONEDA = 484'+coCRLF+
            '                    AND ID_OLTP_PRODUCTO NOT IN (SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO)'+coCRLF+
            '                ) CCS,'+coCRLF+
            '                CRE_CONTRATO CO,'+coCRLF+
            '                CONTRATO CTO,'+coCRLF+
            '                PERSONA P'+coCRLF+
            '         WHERE CO.ID_CONTRATO = IZT.ID_CONTRATO'+coCRLF+
            '           AND TO_CHAR(CO.CVE_SUB_TIP_BCO) = CCS.CVE_SUB_TIP_BCO'+coCRLF+
            '           AND CTO.ID_CONTRATO = IZT.ID_CONTRATO'+coCRLF+
            '           AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
            '           AND P.CVE_TIPO_SECTOR = CCS.CVE_SECTOR_SAP'+coCRLF+
            '        GROUP BY CO.CVE_SUB_TIP_BCO, IZT.ID_REFERENCIA'+coCRLF+
            '       ) SAP'+coCRLF+
            '  WHERE 1 = 1'+coCRLF;

  If (Trim(peCVE_SUB_TIP_BCO) <> '') Then
    vlSQL := vlSQL +
                  ' AND NVL(ACT.ID_OLTP_PRODUCTO, ANT.ID_OLTP_PRODUCTO) = '+vlCVE_SUB_TIP_BCO+coCRLF;

  If (peMetodo = 1) Then
    vlSQL := vlSQL +
                  ' AND ACT.ID_CREDITO (+)= ANT.ID_CREDITO AND SAP.ID_CREDITO (+)= ANT.ID_CREDITO'+coCRLF
  Else
    vlSQL := vlSQL +
                  ' AND ANT.ID_CREDITO (+)= ACT.ID_CREDITO AND SAP.ID_CREDITO (+)= ACT.ID_CREDITO'+coCRLF;

  Result := vlSQL;
end;

procedure TWIcresap.EjecutaQuery(peQry : TQuery; peSQL : String);
begin
  If Assigned(peQry) Then
    With peQry Do
      Try
       If Active Then Close;
       DatabaseName := Objeto.Apli.DataBaseName;
       SessionName  := Objeto.Apli.SessionName;
       SQL.Clear;
       SQL.Add(peSQL);
       Open;
      Except
      End;
end;

procedure TWIcresap.EjecutaQueries;
var vlFecha : TDateTime;
begin
  vlFecha := dtpF_OPERACION.Date;
  EjecutaQuery(QryMovtoSinCta, Objeto.ArmaQueryCtasContables(vlFecha) );
  EjecutaQuery(QryMapeoSAP,    Objeto.ArmaQueryCtasSAP(vlFecha) );
end;

procedure TWIcresap.TabSheet2Show(Sender: TObject);
begin
  EjecutaQueries;
end;

procedure TWIcresap.bitbtnMuestraClick(Sender: TObject);
begin
  If (Trim(edCVE_CTA_CONTABLE.Text) = '') Then
     Begin
     MessageDlg('Favor de indicar la Cuenta Contable', mtWarning, [mbOk], 0);
     If edCVE_CTA_CONTABLE.CanFocus Then edCVE_CTA_CONTABLE.SetFocus;
     Exit;
     End;

  If (Trim(edCVE_TIPO_SECTOR.Text) = '') Then
     Begin
     MessageDlg('Favor de indicar el Tipo de Sector', mtWarning, [mbOk], 0);
     If edCVE_TIPO_SECTOR.CanFocus Then edCVE_TIPO_SECTOR.SetFocus;
     Exit;
     End;
  //
  If (opICRE.Checked) Then
     Begin
     If (opMXN.Checked) Then
         Begin
         EjecutaQuery(Qry1,
                      Objeto.ArmaQueryMXN_ICRE(dtpF_OPERACION.Date, 1,
                                               edCVE_CTA_CONTABLE.Text, edCVE_TIPO_SECTOR.Text, edCVE_PRODUCTO_CRE.Text)
                     );
         EjecutaQuery(Qry2,
                      Objeto.ArmaQueryMXN_ICRE(dtpF_OPERACION.Date, 2,
                                               edCVE_CTA_CONTABLE.Text, edCVE_TIPO_SECTOR.Text, edCVE_PRODUCTO_CRE.Text)
                     );
         End
     Else
         Begin
         EjecutaQuery(Qry1,
                      Objeto.ArmaQueryUSD_ICRE(dtpF_OPERACION.Date, 1,
                                               edCVE_CTA_CONTABLE.Text, edCVE_TIPO_SECTOR.Text, edCVE_PRODUCTO_CRE.Text)
                     );
         EjecutaQuery(Qry2,
                      Objeto.ArmaQueryUSD_ICRE(dtpF_OPERACION.Date, 2,
                                               edCVE_CTA_CONTABLE.Text, edCVE_TIPO_SECTOR.Text, edCVE_PRODUCTO_CRE.Text)
                     );
         End;
     End
 Else
     Begin
         EjecutaQuery(Qry1,
                      Objeto.ArmaQueryMXN(dtpF_OPERACION.Date, 1,
                                          edCVE_CTA_CONTABLE.Text, edCVE_TIPO_SECTOR.Text, edCVE_PRODUCTO_CRE.Text)
                     );
         EjecutaQuery(Qry2,
                      Objeto.ArmaQueryMXN(dtpF_OPERACION.Date, 2,
                                          edCVE_CTA_CONTABLE.Text, edCVE_TIPO_SECTOR.Text, edCVE_PRODUCTO_CRE.Text)
                     );

     End;
end;

procedure TWIcresap.opINTERCREDITOSClick(Sender: TObject);
begin
  opMXN.Checked := True;
  opUSD.Enabled := False;
end;

procedure TWIcresap.opICREClick(Sender: TObject);
begin
  opUSD.Enabled := True;
end;

procedure TWIcresap.ilEmpresaCapture(Sender: TObject; var Show: Boolean);
begin
  Show := True;
end;

procedure TWIcresap.ilEmpresaEjecuta(Sender: TObject);
begin
  With Objeto Do
    Begin
    Empresa.FindKey([ilEmpresa.Buffer]);
    End;
end;

procedure TWIcresap.btEMPRESAClick(Sender: TObject);
begin
  With Objeto Do
    Begin
    Empresa.ShowAll := True;
    Empresa.Busca;
    End;
end;

procedure TWIcresap.ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
begin
  With Objeto Do
    Begin
    Producto.FindKey([ilCVE_PRODUCTO_CRE.Buffer]);
    cbxCVE_PRODUCTO_CRE.Checked:= True;
    cbxCVE_PRODUCTO_CRE.Enabled:= True;
    End;
end;

procedure TWIcresap.SpeedButton1Click(Sender: TObject);
begin
  With Objeto Do
    Begin
    Producto.ShowAll := True;
    If Producto.Busca Then
      Begin
      cbxCVE_PRODUCTO_CRE.Checked:= True;
      cbxCVE_PRODUCTO_CRE.Enabled:= True;
      End;
    End;
end;

procedure TWIcresap.btnCopiaClick(Sender: TObject);
begin
  CopiaRegistros(False);
end;

procedure TWIcresap.btnCopiaTodoClick(Sender: TObject);
begin
  CopiaRegistros(True);
end;

procedure TWIcresap.CopiaRegistros(pebCopiaTodo : Boolean);
var vlClipboard : TClipboard;
    vlStrBuffer, vlstrSeparator : String;
    vlCol, vlRow, vlRowFinal : Integer;
begin
  vlClipboard := TClipboard.Create;
  vlStrBuffer := ''; vlstrSeparator := '';

    If cbxCopiaCabecera.Checked Then
      Begin
      For vlCol := 0 To vgTopicGrid.Columns.Count - 1 Do
        Begin
        vlStrBuffer := vlStrBuffer + vlstrSeparator + vgTopicGrid.Columns[vlCol].DisplayName;
        vlstrSeparator := CO_SEPARATOR;
        End;
      vlStrBuffer := vlStrBuffer + coCRLF;
      End;

    If (pebCopiaTodo) Then
      Begin
      vgTopicGrid.DataSource.DataSet.FindFirst;
      vlRowFinal  := vgTopicGrid.DataSource.DataSet.RecordCount;
      End
    Else
      Begin
      vlRowFinal  := vgTopicGrid.SelectedRows.Count-1;
      End;

    With vgTopicGrid.DataSource.DataSet Do
      For vlRow := 0 To vlRowFinal Do
        Begin
        If Not (pebCopiaTodo) Then
           GotoBookmark(Pointer(vgTopicGrid.SelectedRows.Items[vlRow]));

        vlstrSeparator := '';
        For vlCol := 0 to FieldCount - 1 do
          Begin
          vlStrBuffer := vlStrBuffer + vlstrSeparator + Fields[vlCol].AsString;
          vlstrSeparator := CO_SEPARATOR;
          End;
        vlStrBuffer := vlStrBuffer + coCRLF;

        If (pebCopiaTodo) Then
           FindNext;
        End;
    vlClipboard.SetTextBuf(Pchar(vlStrBuffer));
end;

procedure TWIcresap.dbGridResult2Enter(Sender: TObject);
begin
 If (Sender Is TDBGrid) Then
    vgTopicGrid := (Sender As TDBGrid);
end;

procedure TWIcresap.cbxCVE_PRODUCTO_CREClick(Sender: TObject);
begin
    If Not cbxCVE_PRODUCTO_CRE.Checked Then
       Begin
       Objeto.Producto.Active:=False;
       cbxCVE_PRODUCTO_CRE.Checked:=False;
       cbxCVE_PRODUCTO_CRE.Enabled:=False;
       End
    Else
       Begin
       cbxCVE_PRODUCTO_CRE.Checked:=True;
       cbxCVE_PRODUCTO_CRE.Enabled:=True;
       End;
end;

procedure TWIcresap.bitbtnDerivaClick(Sender: TObject);
begin
  If (Objeto.Moneda.CVE_MONEDA.AsInteger = 0) Then
     Begin
     MessageDlg('Favor de Especificar una Moneda', mtWarning, [mbOk], 0);
     If edCVE_MONEDA.CanFocus Then edCVE_MONEDA.SetFocus;
     Exit;
     End;

  If (MessageDlg('Se procederá a DERIVAR los movimientos de la moneda '+Objeto.Moneda.CVE_MONEDA.AsString+' "'+
                 Objeto.Moneda.DESC_MONEDA.AsString+'". ¿Desea continuar?',
                 mtConfirmation, [mbYes, mbNo], 0) = mrNo) Then
     Begin
     MessageDlg('Proceso de DERIVACIÓN Cancelado', mtWarning, [mbOk], 0);
     Exit;
     End;

  If Deriva(dtpF_OPERACION.Date, Objeto.Moneda.CVE_MONEDA.AsInteger) Then
     Begin
     Application.ProcessMessages;
     MessageDlg('El día '+DateToStr(dtpF_OPERACION.Date)+' se acaba de DERIVAR',
                mtInformation, [mbOk], 0);
     End
   Else
     Begin
     Application.ProcessMessages;
     MessageDlg('Errores al DERIVAR la moneda PESOS del día '+DateToStr(dtpF_OPERACION.Date)+'. Favor de revisar la bitácora',
                mtError, [mbOk], 0);
     End;
end;

function TWIcresap.ConectaBasePCONT : Boolean;
var vlstrMsg : String;
begin
  If Not DatabasePCONT.Connected Then
    Try
      If Objeto.Apli.IsProd Then DatabasePCONT.AliasName := 'PCONT'
      Else
        Begin
        DatabasePCONT.AliasName := 'RCONT';
        DatabasePCONT.Params.Clear;
        DatabasePCONT.Params.Add('USER NAME=SISTEMAS');
        DatabasePCONT.Params.Add('PASSWORD=DESARROLLO');
        End;
      DatabasePCONT.Connected := True;
    Except
      vlstrMsg := 'No se pudo conectar a la base de datos CONT. Favor de revisarlo con Sistemas';
      MemMensajes.Lines.Add(vlstrMsg);
      MessageDlg(vlstrMsg, mtError, [mbOk], 0);
    End;
  Result := DatabasePCONT.Connected;
end;

function TWIcresap.Deriva(peFecha : TDateTime; peCVE_MONEDA : Integer) : Boolean;

   function DerivaPesos : Boolean;
   var vlSTP : TStoredProc;
   begin
      Result := False;
      If Not ConectaBasePCONT Then
         Begin
         Exit;
         End;

      MemMensajes.Lines.Add(' ');

      vlSTP := TStoredProc.Create(Nil);
      If Assigned(vlSTP) Then
       With vlSTP Do
        Try
          DatabaseName := DatabasePCONT.DatabaseName;
          SessionName  := DatabasePCONT.SessionName;
          StoredProcName := 'PKGINTERFAZSAP.STP_PROCESA_ICRE_SAP';

          Params.Clear;
          Params.CreateParam(ftInteger, 'peID_EMPRESA'  , ptInput);
          Params.CreateParam(ftDate,    'peF_OPERACION' , ptInput);
          Params.CreateParam(ftString,  'peCVE_USUARIO' , ptInput);
          Params.CreateParam(ftInteger, 'psRESULTADO'   , ptOutput);
          Params.CreateParam(ftString,  'psTX_RESULTADO', ptOutput);

          Params.ParamByName('peID_EMPRESA').AsInteger := 2;
          Params.ParamByName('peF_OPERACION').AsDate   := peFecha;
          Params.ParamByName('peCVE_USUARIO').AsString := Objeto.Apli.Usuario;
          ExecProc;

          If (Params.ParamByName('psRESULTADO').AsInteger = 0) Then
             Begin
             Result := True;
             RecuperaMensajes(Objeto.Moneda.CVE_MONEDA.AsInteger);
             End
          Else
             Begin
             RecuperaMensajes(Objeto.Moneda.CVE_MONEDA.AsInteger);
             MemMensajes.Lines.Add(Params.ParamByName('psTX_RESULTADO').AsString);
             End;

        Finally
          vlSTP.Free;
        End;
   end;

   function DerivaDolar : Boolean;
   var vlbResult : Boolean;
       vlStrResultado : String;
       vlnTotal : Integer;
   begin
     vlbResult := False;
     GetSQLInt( ' SELECT COUNT(*) AS TOTAL FROM CR_CONT_SAP_TRAN CCST'+coCRLF+
                '   WHERE CCST.F_OPERACION = '+SQLFecha(peFecha)+' AND CCST.SIT_GENERACION = ''GEN'' AND NUM_TRANS_GEN > 0',
                Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'TOTAL', vlnTotal, True);
     If (vlnTotal > 0) Then
       Begin
       If FunGenContaDllsICRE(peFecha, vlStrResultado) Then
          vlbResult := True;
       End
     Else
       Begin
       If FunGenMovtosSAP(peFecha, vlStrResultado) Then
         If FunGenContaDllsICRE(peFecha, vlStrResultado) Then
            vlbResult := True;
       End;     

     If (vlbResult = False) Then
       Begin
       Application.ProcessMessages;
       MessageDlg(vlStrResultado, mtError, [mbOk], 0);
       MemMensajes.Lines.Add(vlStrResultado);
       End;

     Result := vlbResult;
   end;

begin
  Result := False;
  Case peCVE_MONEDA Of
    484 : Result := DerivaPesos;
    840 : Result := DerivaDolar;
  Else
    Begin
    MemMensajes.Lines.Add('La moneda '+Objeto.Moneda.CVE_MONEDA.AsString+' "'+Objeto.Moneda.Desc_MONEDA.AsString+'" '+
                          ' no existe para DERIVAR. Sólo Pesos y Dólar.');
    End;
  End;  
end;

procedure TWIcresap.RecuperaMensajes(peCVE_MONEDA : Integer);
var vlQry : TQuery;
begin
   MemMensajes.Lines.Clear;
  //--
  If Not ConectaBasePCONT Then
     Begin
     Exit;
     End;
  //--
  vlQry := TQuery.Create(Nil);
  If Assigned(vlQry) Then
    With vlQry Do
      Try
        DatabaseName := DatabasePCONT.DatabaseName;
        SessionName  := DatabasePCONT.SessionName;
        Close;
        SQL.Clear;
        If (peCVE_MONEDA = 484) Then
            Begin
            SQL.Add('SELECT CCBM.* FROM CG_CONT_BIT_MSG CCBM'+coCRLF+
                    'WHERE CCBM.CVE_APLICACION = ''ICRE01'' '+coCRLF+
                    '  AND CCBM.CVE_PROCESO = ''SAPMXN'' '+coCRLF+
                    '  AND CCBM.FOL_GENERACION IN ( SELECT FOL_GENERACION FROM CR_CONT_GEN_TRAN@CORP'+coCRLF+
                    '                               WHERE ID_EMPRESA = 2'+coCRLF+
                    '                                 AND F_OPERACION = '+SQLFecha(dtpF_OPERACION.Date)+coCRLF+
                    '                             )'+coCRLF+
                    '  ORDER BY CCBM.FOL_GENERACION, CCBM.FOL_MOVTO_MSG'
                   )
            End
        Else If (peCVE_MONEDA = 840) Then
            Begin
            DatabaseName := Objeto.Apli.DatabaseName;
            SessionName  := Objeto.Apli.SessionName;
            SQL.Add('  SELECT CCSM.*'+coCRLF+
                    '  FROM ( SELECT MAX(CCST.FOL_GENERACION) AS FOL_GENERACION'+coCRLF+
                    '         FROM CR_CONT_SAP_TRAN CCST'+coCRLF+
                    '         WHERE CCST.F_OPERACION = '+SQLFecha(dtpF_OPERACION.Date)+coCRLF+
                    '       ) CCST,'+coCRLF+
                    '       CR_CONT_SAP_MSG CCSM'+coCRLF+
                    '  WHERE CCSM.FOL_GENERACION = CCST.FOL_GENERACION');
            End;
        //-
        If (SQL.Text <> '') Then
          Begin
          Open; First;
          While Not Eof Do
            Begin
            MemMensajes.Lines.Add(FieldByName('TX_MENSAJE').AsString);
            Next;
            End;
          End;
            
      Finally
        vlQry.Close;
        vlQry.Free;
      End;
end;

procedure TWIcresap.MuestraGeneracion;
var vlSQL : String;
begin
  vlSQL := '  SELECT * FROM CR_CONT_GEN_TRAN'+coCRLF+
           '  WHERE ID_EMPRESA = 2'+coCRLF+
           '    AND F_OPERACION = '+SQLFecha(dtpF_OPERACION.Date)+coCRLF+
           '  ORDER  BY FOL_GENERACION';
  With qryGeneracion Do
    Try
      Close;
      SQL.Clear;
      SQL.Add(vlSQL);
      DatabaseName := Objeto.Apli.DatabaseName;
      SessionName  := Objeto.Apli.SessionName;
      Open;
    Finally
    End;
end;

procedure TWIcresap.bitbtnReinicializaClick(Sender: TObject);
begin
  If Not qryGeneracion.Active Then
    Begin
    MessageDlg('Debe de seleccionar una Fecha de Operación', mtWarning, [mbOk], 0);
    Exit;
    End;

  If (qryGeneracion.FieldByName('FOL_GENERACION').AsInteger <= 0) Then
    Begin
    MessageDlg('No existen generaciones por reinicializar. Favor de verificar en WEBICRECONTA.', mtWarning, [mbOk], 0);
    Exit;
    End;

  If (qryGeneracion.FieldByName('SIT_GENERACION').AsString = 'DER') Then
    Begin
    If (MessageDlg('El folio '+qryGeneracion.FieldByName('FOL_GENERACION').AsString+
                   ' ya se encuentra DERIVADO para la moneda "'+Objeto.Moneda.DESC_MONEDA.AsString+'". ¿Desea proceder a REINICIALIZARLO?',
                   mtConfirmation, [mbYes, mbNo], 0) = mrNo) Then
       Begin
       MessageDlg('Proceso de REINICIALIZACION Cancelado', mtWarning, [mbOk], 0);
       Exit;
       End;
    End;

  If (qryGeneracion.FieldByName('SIT_GENERACION').AsString = 'GEN') Then
    Begin
    If (MessageDlg('El folio '+qryGeneracion.FieldByName('FOL_GENERACION').AsString+
                   ' con moneda "'+Objeto.Moneda.DESC_MONEDA.AsString+'" a va ha RECINIALIZAR. ¿Desea continuar?',
                   mtConfirmation, [mbYes, mbNo], 0) = mrNo) Then
       Begin
       MessageDlg('Proceso de REINICIALIZACION Cancelado', mtWarning, [mbOk], 0);
       Exit;
       End;
    End;

  If Reinicializa(Objeto.Moneda.CVE_MONEDA.AsInteger, qryGeneracion.FieldByName('FOL_GENERACION').AsInteger ) Then
    Begin
    Application.ProcessMessages;
    MessageDlg('El folio '+qryGeneracion.FieldByName('FOL_GENERACION').AsString+
               ' del día '+DateToStr(dtpF_OPERACION.Date)+' se acaba de REINICIALIZAR',
               mtInformation, [mbOk], 0);
    End
  Else
    Begin
    Application.ProcessMessages;
    MessageDlg('Errores al REINICIALIZAR el folio '+qryGeneracion.FieldByName('FOL_GENERACION').AsString+
               ' del día '+DateToStr(dtpF_OPERACION.Date)+'.',
               mtError, [mbOk], 0);
    End;
  MuestraGeneracion;
end;

function TWIcresap.Reinicializa(peCVE_MONEDA, peFOL_GENERACION : Integer): Boolean;
var vlSTP : TStoredProc;
begin
  Result := False;
  vlSTP := TStoredProc.Create(Nil);
  If Assigned(vlSTP) Then
   With vlSTP Do
    Try
      DatabaseName := Objeto.Apli.DatabaseName;
      SessionName  := Objeto.Apli.SessionName;
      StoredProcName := 'PKGCRSAP.STP_REINICIA_GEN_ICRE';

      Params.Clear;
      Params.CreateParam(ftInteger, 'peFOL_GENERACION' , ptInput);
      Params.CreateParam(ftInteger, 'peCVE_MONEDA'     , ptInput);
      Params.CreateParam(ftString,  'peCVE_USUARIO'    , ptInput);
      Params.CreateParam(ftInteger, 'psRESULTADO'      , ptOutput);
      Params.CreateParam(ftString,  'psTX_RESULTADO'   , ptOutput);

      Params.ParamByName('peFOL_GENERACION').AsInteger := peFOL_GENERACION;
      Params.ParamByName('peCVE_MONEDA').AsInteger := peCVE_MONEDA;
      Params.ParamByName('peCVE_USUARIO').AsString := Objeto.Apli.Usuario;
      ExecProc;

      If (Params.ParamByName('psRESULTADO').AsInteger = 0) Then
         Result := True
      Else
         Begin
         MessageDlg(Params.ParamByName('psTX_RESULTADO').AsString, mtError, [mbOk], 0);
         End;

    Finally
      vlSTP.Free;
    End;
end;

procedure TWIcresap.Refrescar;
begin
  Case PageControl1.ActivePageIndex Of
    0 : RecuperaMensajes(Objeto.Moneda.CVE_MONEDA.AsInteger);
    1 : EjecutaQueries;
    2 : MuestraGeneracion;
    3 : bitbtnMuestraClick(Self);
  End;
end;

procedure TWIcresap.dtpF_OPERACIONCloseUp(Sender: TObject);
begin
  Refrescar;
end;

procedure TWIcresap.TabSheet4Show(Sender: TObject);
begin
  MuestraGeneracion;
end;

procedure TWIcresap.bitbtnCVE_MONEDAClick(Sender: TObject);
begin
  If Objeto.Moneda.Busca Then
    RecuperaMensajes(Objeto.Moneda.CVE_MONEDA.AsInteger);
end;

procedure TWIcresap.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
  With Objeto Do
    Begin
    If Moneda.FindKey([ilCVE_MONEDA.Buffer]) Then
      RecuperaMensajes(Objeto.Moneda.CVE_MONEDA.AsInteger);    
    End;
end;

procedure TWIcresap.DBGrid2DblClick(Sender: TObject);
var vlCgCueEqu : TCgCueEqu;
begin
 If Not QryMapeoSAP.Active Then
   Begin
   Exit;
   End;
 {$WARNINGS OFF}
 vlCgCueEqu := TCgCueEqu.Create(Self);
 {$WARNINGS ON}
 Try
    vlCgCueEqu.GetParams(Objeto);
    vlCgCueEqu.ParamCre := Objeto.ParamCre;
    vlCgCueEqu.vgID_EMPRESA := Objeto.ID_EMPRESA.AsInteger;
    vlCgCueEqu.vgCVE_MONEDA := 484;
    vlCgCueEqu.vgCVE_MONEDA_EXT := 484;
    vlCgCueEqu.vgCVE_CTA_CONTABLE := QryMapeoSAP.FieldByName('CVE_CTA_CONTABLE').AsString;
    vlCgCueEqu.vgCVE_SECTOR := Copy(QryMapeoSAP.FieldByName('CVE_CTA_CONTABLE').AsString, 11,2);
    vlCgCueEqu.ShowWindow(ftCaptura);
  Finally
    vlCgCueEqu.Free;
  End;
end;

function TWIcresap.FunGenMovtosSAP(pFecha: TDateTime; var PPResultado: String): Boolean;
var  StpGenMovtosSAP : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := False;
   StpGenMovtosSAP := TStoredProc.Create(Self);
   Try
     With StpGenMovtosSAP Do
     Begin
        //Inicia el SPT
        StpGenMovtosSAP.DatabaseName:= Objeto.Apli.DatabaseName;
        StpGenMovtosSAP.SessionName:= Objeto.Apli.SessionName;
        StpGenMovtosSAP.StoredProcName:= 'ADMIPROD.PKGCRSAP.STP_GENERA_MOVTOS_SAP';

        Params.Clear;
        Params.CreateParam( ftFloat,  'peID_EMPRESA',   ptInput);
        Params.CreateParam( ftDate,   'peF_OPERACION',  ptInput);
        Params.CreateParam( ftString, 'peCVE_USUARIO',  ptInput);
        Params.CreateParam( ftFloat,  'psRESULTADO',    ptOutput);
        Params.CreateParam( ftString, 'psTX_RESULTADO', ptOutput);

        Prepare;
        ParamByName('peID_EMPRESA').AsInteger   := Objeto.Apli.IdEmpresa;
        ParamByName('peF_OPERACION').AsDateTime := Trunc(pFecha);
        ParamByName('peCVE_USUARIO').asString   := Objeto.Apli.Usuario;
        ExecProc;

        If (ParamByName('PSRESULTADO').AsInteger <> 0) then
           PPResultado := 'Error No ' + ParamByName('psTX_RESULTADO').AsString
        Else
           vlResult := True;        
        //end if;
     end;
   Finally
        If Assigned(StpGenMovtosSAP) Then
           StpGenMovtosSAP.Free;
        //end if;
   End;
   Result := vlResult;
end;

function TWIcresap.FunGenContaDllsICRE(pFecha: TDateTime; var PPResultado: String): Boolean;
var  StpGenMovtosSAP : TStoredProc;
     vlResult     : Boolean;
Begin
   Result := False;
   vlResult := False;

  If Not ConectaBasePCONT Then
     Begin
     Exit;
     End;

   StpGenMovtosSAP := TStoredProc.Create(Self);
   Try
     With StpGenMovtosSAP Do
     Begin
        //Inicia el SPT
        StpGenMovtosSAP.DatabaseName:= DatabasePCONT.DatabaseName;
        StpGenMovtosSAP.SessionName:= DatabasePCONT.SessionName;
        StpGenMovtosSAP.StoredProcName:= 'ADMIPROD.PKGINTERFAZSAP.STP_CONTA_DLLS_ICRE01';

        Params.Clear;
        Params.CreateParam( ftFloat,  'peID_EMPRESA',   ptInput);
        Params.CreateParam( ftDate,   'peF_OPERACION',  ptInput);
        Params.CreateParam( ftFloat,  'psRESULTADO',    ptOutput);
        Params.CreateParam( ftString, 'psTX_RESULTADO', ptOutput);

        Prepare;
        ParamByName('peID_EMPRESA').AsInteger   := Objeto.Apli.IdEmpresa;
        ParamByName('peF_OPERACION').AsDateTime := Trunc(pFecha);
        ExecProc;

        If (ParamByName('PSRESULTADO').AsInteger <> 0) then
          PPResultado := 'Error No ' + ParamByName('psTX_RESULTADO').AsString
        Else
          vlResult := True;
        //end if;
     end;
   Finally
        If Assigned(StpGenMovtosSAP) Then
           StpGenMovtosSAP.Free;
        //end if;
   End;
   Result := vlResult;
end;


procedure TWIcresap.BitBtn1Click(Sender: TObject);
var CgCueEqu : TCgCueEqu;
begin
  {$WARNINGS OFF}
  CgCueEqu :=  TCgCueEqu.Create(self);
  {$WARNINGS ON}  
  try
     CgCueEqu.Apli := Objeto.Apli;
     CgCueEqu.ParamCre := Objeto.ParamCre;
     CgCueEqu.Catalogo;
  finally
     CgCueEqu.Free;
  end;
end;

procedure TWIcresap.btnRefrescarClick(Sender: TObject);
begin
  Refrescar;
end;

procedure TWIcresap.chbMuestraClick(Sender: TObject);
begin
  Qry1.Filtered := chbMuestra.Checked;
  Qry2.Filtered := chbMuestra.Checked;
end;

procedure TWIcresap.TabSheet1Show(Sender: TObject);
begin
  Refrescar;
end;

procedure TWIcresap.Registro1Click(Sender: TObject);
var vlStr, vlStrComa : String;
begin
  QryMapeoSAP.First; vlStrComa := '';
  While Not QryMapeoSAP.Eof Do
     Begin
     vlStr := vlStr + vlStrComa + SQLStr(QryMapeoSAP.FieldByName('CVE_CTA_CONTABLE').AsString);
     vlStrComa := ',';
     QryMapeoSAP.Next;
     End;
  QryMapeoSAP.First;

  MuestraVentana(Objeto.Apli, Objeto.ParamCre, vlStr, dtpF_OPERACION.Date);
end;

procedure TWIcresap.InsertarRegistrodeMapeo1Click(Sender: TObject);
begin
  DBGrid2DblClick(Self);
end;

end.
