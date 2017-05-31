// Sistema         : Clase de CRCIERRE
// Fecha de Inicio : 09/12/2003
// Función forma   : Clase de CRCIERRE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrRnvPag;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid, ImgList,
IntLinkit, InterEdit, IntDmMain, Math,

InterApl,      // Apli
IntGenCre,
IntParamCre,
IntCrCto,      // Autorización
IntBasicCred,  // Clase Vacía de Crédito
IntCtoHeader,  // Contrato Corporativo
IntCrAcredit,  // Datos Acreditado
IntValidPwd    // Valida el Pasword
;

Const
  CO_A_LBL_PAGARE : Array[0..23] of String = (  'Imp. Neto Vto.',
                                                'Fecha Vencimiento',
                                                'Imp. Capital',
                                                'Imp. Interés al Corte',                                                
                                                'Imp. Interés',
                                                'Tasa. Neta',
                                                'Contrato Pagaré',
                                                'Nombre del Contrato',
                                                'Cve. Mdo. Objetivo',
                                                'Mdo. Objetivo',
                                                'Id. Promotor Administrador',
                                                'Promotor Administrador',
                                                'Id. Promotor Asociado',
                                                'Promotor Asociado',
                                                'Cve. Grupo de Producto',
                                                'Cve. Producto',
                                                'Producto',                                                                                                
                                                'Fecha Apertura',
                                                'Comentarios',
                                                'Instrucciones',
                                                'Gtia.FWD',
                                                'Empresa',
                                                'Sucursal',
                                                '');

  CO_B_CORTE          = 0;
  CO_ID_REL_PAG_DISP  = 1;
  CO_ID_CREDITO       = 2;
  CO_NOM_ACREDITADO   = 3;
  CO_ID_PAGARE        = 4;
  CO_CVE_SIT_PAGARE   = 5;

  CO_IMP_NETO_VTO     = 0;
  CO_F_VENCIMIENTO    = 1;
  CO_IMP_CAPITAL      = 2;
  CO_IMP_NETO_CORTE   = 3;
  CO_IMP_INTERES      = 4;
  CO_TASA_NETA_ORIG   = 5;
  CO_ID_CONTRATO      = 6;
  CO_NOM_CONTRATO     = 7;
  CO_CVE_PRESUPUESTO  = 8;
  CO_DESC_PRESUPUESTO = 9;
  CO_ID_PROM_ADM      = 10;
  CO_NOM_PROM_ADMIN   = 11;
  CO_ID_PERS_ASOCIAD  = 12;
  CO_NOM_PROM_ASOC    = 13;
  CO_CVE_PRODUCTO_GPO = 14;
  CO_CVE_PRODUCTO_CRE = 15;
  CO_DESC_L_PRODUCTO  = 16;
  CO_F_APERTURA       = 17;
  CO_TX_COM_PAG       = 18;
  CO_TX_INST_CAJERO   = 19;
  CO_B_GTIA_FWD       = 20;
  CO_ID_EMPRESA       = 21;
  CO_ID_SUCURSAL      = 22;

  CO_CVE_IMP_RENOV       = 0;
  CO_TASA_BRUTA          = 1;
  CO_TASA_NETA           = 2;
  CO_DIAS_PLAZO          = 3;
  CO_DESC_CVE_IMP_RENOV  = 4;
  CO_PCT_ISR             = 5;
  CO_IMP_RENOVAR         = 6;
  CO_F_NVA_VTO           = 7;
  CO_CHK_RENOVAR         = 8;

  CO_CAR_DELETE = #32'$,';

  CO_CHECKED   = 'V';
  CO_UNCHECKED = 'F';
  CO_NOTCHECK  = '-';

  // INICIO de constantes utilizadas por pagarés
  CO_TOTAL_AL_VENCER = 'TO';
  CO_SOLO_CAPITAL    = 'CP';
  CO_IMPORTE         = 'IM';
  CO_NO_RENOVAR      = 'NA';

  CO_MANUAL          = 'MN';

  CO_ALTA_PAGARE     = 'AP';

  CO_VENCE_PAGARE    = 'VE';
  // FIN de constantes utilizadas por pagarés

  CO_FORMAT_DINERO_GRID = '###,###,###,###,###,###,##0.00';
  CO_FORMAT_TASA_GRID   = '###,###,###,##0.00000000'; // La tasa del Pagare esta definida a 8 décimales
  CO_FORMAT_PCT_GRID    = '###,###,###,##0.0000';
  COFORMAT_TASA         = '%8.8n';


Type PDataRegistro = ^DataRegistro;
     DataRegistro = record
     ID_REL_PAG_DISP     : Integer;
     ID_CONTRATO         : Integer;
     ID_PAGARE           : Integer;
     CVE_SIT_PAGARE      : String;
     IMP_CAPITAL         : Double;
     IMP_INTERES         : Double;
     TASA_NETA_ORIG      : Double;
     //TASA_BRUTA_ORIG     : Double;
     IMP_NETO_VTO        : Double;
     F_VENCIMIENTO       : TDateTime;
     CVE_IMP_RENOV       : String;
     DESC_CVE_IMP_RENOV  : String;
     TASA_BRUTA          : Double;     
     TASA_NETA           : Double;
     PCT_ISR             : Double;
     DIAS_PLAZO          : Integer;
     IMP_RENOVAR         : Double;
     F_NVA_VTO           : TDateTime;
     CHK_RENOVAR         : String;
     ID_EMPRESA          : Integer;
     ID_SUCURSAL         : Integer;
     end;

Type
 TCrRnvPag = class;

  TWCrRnvPag=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    StrGrdAlgnPagare1: TStringAlignGrid;
    lblID_CREDITO: TLabel;
    lblNOM_ACREDITADO: TLabel;
    lblID_PAGARE: TLabel;
    lbl1: TLabel;
    StrGrdAlgnPagare2: TStringAlignGrid;
    btnAplicaRenovaciones: TButton;
    lblID_CREDITO1: TLabel;
    lblNOM_ACREDITADO1: TLabel;
    lblID_PAGARE1: TLabel;
    lbl11: TLabel;
    lbl21: TLabel;
    lbl2: TLabel;
    lblCVE_SIT_PAGARE1: TLabel;
    lblCVE_SIT_PAGARE: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    StrGrdAlgnPagare3: TStringAlignGrid;
    Label1: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    cbxCVE_IMP_RENOV: TComboBox;
    Label23: TLabel;
    Label24: TLabel;
    btnAplicar: TBitBtn;
    Label12: TLabel;
    Label13: TLabel;
    rgCVE_SIT_PAGARE: TRadioGroup;
    PnlNOM_ACREDITADO: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    gbx: TGroupBox;
    Label2: TLabel;
    edID_CREDITO: TEdit;
    btnID_CREDITO: TBitBtn;
    edNOM_CREDITO: TEdit;
    Label3: TLabel;
    edID_CONTRATO: TEdit;
    btnID_CONTRATO: TBitBtn;
    edNOM_CONTRATO: TEdit;
    Label5: TLabel;
    edID_CTO_PAGARE: TEdit;
    btnID_CTO_PAGARE: TBitBtn;
    edNOM_CTO_PAGARE: TEdit;
    cbID_CREDITO: TCheckBox;
    chkbxID_CONTRATO: TCheckBox;
    chkbxID_ACREDITADO: TCheckBox;
    chkbxID_CTO_PAGARE: TCheckBox;
    Label6: TLabel;
    edID_ACREDITADO: TEdit;
    btnID_ACREDITADO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    ilID_CREDITO: TInterLinkit;
    ilID_CONTRATO: TInterLinkit;
    ilID_ACREDITADO: TInterLinkit;
    ilID_CTO_PAGARE: TInterLinkit;
    lblCountPagares: TLabel;
    lblCountPagares1: TLabel;
    edTASA_NETA: TInterEdit;
    sbtnTrue: TSpeedButton;
    sbtnFalse: TSpeedButton;
    btBusca: TBitBtn;
    edDIAS_PLAZO: TInterEdit;
    Timer1: TTimer;
    memMessages: TMemo;
    Label4: TLabel;
    Label8: TLabel;
    edPCT_ISR: TInterEdit;
    rgOpcion: TRadioGroup;
    PnlPagare: TPanel;
    lblAl_PAGARE: TLabel;
    lblID_PAGARE_SEL: TLabel;
    btnRestauraTasa: TButton;
    ImageList: TImageList;
    rgMostrar: TRadioGroup;
    Label9: TLabel;
    lbCVE_PRODUCTO_GPO: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edDESC_L_PROD_GPO: TEdit;
    cbCVE_PRODUCTO_GPO: TCheckBox;
    cbCVE_PRODUCTO_CRE: TCheckBox;
    edDESC_L_PRODUCTO: TEdit;
    ilCVE_PRESUPUESTO: TInterLinkit;
    ilCVE_PRODUCTO_CRE: TInterLinkit;
    btCVE_PRODUCTO_CRE: TBitBtn;
    edCVE_PRODUCTO_CRE: TEdit;
    lbCVE_PRODUCTO_CRE: TLabel;
    Label10: TLabel;
    edCVE_PRESUPUESTO: TEdit;
    btCVE_PRESUPUESTO: TBitBtn;
    edDESC_PRESUPUESTO: TEdit;
    cbCVE_PRESUPUESTO: TCheckBox;
    lblID_PROM_ADMIN: TLabel;
    edID_PROM_ADMIN: TEdit;
    btID_PROM_ADMIN: TBitBtn;
    edNOM_PROM_ADMIN: TEdit;
    cbID_PROM_ADMIN: TCheckBox;
    lblID_PROM_ASOC: TLabel;
    edID_PROM_ASOC: TEdit;
    btID_PROM_ASOC: TBitBtn;
    edNOM_PROM_ASOC: TEdit;
    cbID_PROM_ASOC: TCheckBox;
    ilID_PROM_ASOC: TInterLinkit;
    ilID_PROM_ADMIN: TInterLinkit;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    lblFontRow: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    edTASA_BRUTA: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure StrGrdAlgnPagare1SelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure StrGrdAlgnPagare1TopLeftChanged(Sender: TObject);
    procedure StrGrdAlgnPagare2DrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure btnID_CREDITOClick(Sender: TObject);
    procedure btnID_CONTRATOClick(Sender: TObject);
    procedure btnID_ACREDITADOClick(Sender: TObject);
    procedure btnID_CTO_PAGAREClick(Sender: TObject);
    procedure cbID_CREDITOClick(Sender: TObject);
    procedure chkbxID_CONTRATOClick(Sender: TObject);
    procedure chkbxID_ACREDITADOClick(Sender: TObject);
    procedure chkbxID_CTO_PAGAREClick(Sender: TObject);
    procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure ilID_ACREDITADOEjecuta(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure sbtnTrueClick(Sender: TObject);
    procedure sbtnFalseClick(Sender: TObject);
    procedure btnAplicaRenovacionesClick(Sender: TObject);
    procedure StrGrdAlgnPagare3MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure StrGrdAlgnPagare3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btBuscaClick(Sender: TObject);
    procedure rgCVE_SIT_PAGAREClick(Sender: TObject);
    procedure StrGrdAlgnPagare1DrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure edTASA_NETAChange(Sender: TObject);
    procedure edDIAS_PLAZOChange(Sender: TObject);
    procedure cbxCVE_IMP_RENOVChange(Sender: TObject);
    procedure ilID_CTO_PAGAREEjecuta(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edPCT_ISRChange(Sender: TObject);
    procedure StrGrdAlgnPagare3DblClick(Sender: TObject);
    procedure edTASA_NETAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRestauraTasaClick(Sender: TObject);
    procedure lblAl_PAGAREClick(Sender: TObject);
    procedure btID_PROM_ADMINClick(Sender: TObject);
    procedure btID_PROM_ASOCClick(Sender: TObject);
    procedure btCVE_PRESUPUESTOClick(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure btCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure cbID_PROM_ADMINClick(Sender: TObject);
    procedure cbID_PROM_ASOCClick(Sender: TObject);
    procedure cbCVE_PRESUPUESTOClick(Sender: TObject);
    procedure cbCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure cbCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure ilID_PROM_ADMINEjecuta(Sender: TObject);
    procedure ilID_PROM_ASOCEjecuta(Sender: TObject);
    procedure ilCVE_PRESUPUESTOEjecuta(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
    procedure StrGrdAlgnPagare3DrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure edTASA_BRUTAChange(Sender: TObject);
    private
    { Private declarations }
     vgGrid : TStringAlignGrid;
     vgB_RESTAURA_TASA      ,
     vgTASA_BRUTAChanged    ,
     vgTASA_NETAChanged     ,
     vgDIAS_PLAZOChanged    ,
     vgCVE_IMP_RENOVChanged ,
     vgPCT_ISRChanged       : Boolean;

     function ObtPagPorRenovar : Integer;
     procedure CambiaRenovacionGlobal(peCHK_RENOVAR : Boolean);
     procedure MuestraPantallaEdicion(penRow : Integer);
     function AplicaRenovaciones : Boolean;
     function ActualizaConfPagare(peID_REL_PAG_DISP, peTASA_NETA: Double; peDIAS_PLAZO: Integer;
                                  pePCT_ISR : Double;  peCVE_IMP_RENOV: String;
                                  peIMP_RENOVAR: Double; peCHK_RENOVAR: String): Boolean;
     function  AplicaCambiodeBandera(penRow: Integer; peCHK_RENOVAR: String) : Boolean;

     procedure ClearAlignGrid(StringAlignGrid : TStringAlignGrid; nStartRow : Integer = 1);
     procedure InvertCheck(StringAlignGrid : TStringAlignGrid; nCol, nRow : Integer);
     procedure ColorFontRow(penRow : Integer; Color : TColor);
     procedure MostrarDatos;
     procedure ActivaPanel;
     procedure ObtenValoresdelRegistro(penRow : Integer;var DataRegistro : PDataRegistro);

     procedure ActualizaValores(penRow : Integer;
                                peTASA_BRUTA   : Double;     
                                peTASA_NETA    : Double;
                                peDIAS_PLAZO   : Integer;
                                peCVE_IMP_RENOV : String;
                                pePCT_ISR : Double;
                                peDESC_CVE_IMP_RENOV : String;
                                peIMP_RENOVAR : Double;
                                peF_NVA_VTO : TDateTime;
                                peCHK_RENOVAR : String
                                );
     function Obten_DESC_CVE_IMP_RENOV(peCVE_IMP_RENOV : String) : String;

     procedure LimpiaControles(peCheckBox : TCheckBox; peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo);
     procedure CreaBuscador1(peStrNomBuscador : String;
                            peStrCamposBuscador : String;
                            penResultBusc1, penResultBusc2 : Integer;
                            peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo;
                            peCheckBox : TCheckBox
                           );
     procedure ObtenDescripcion(peStrBuffer, peStrSQL, peStrNomCampo: String;
                                peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo;
                                peCheckBox : TCheckBox);
     procedure ColoreaCorte(peSender : TObject; peRow: Integer; peColor : TColor);
     function TasaInflacion:Double;

    public
    { Public declarations }
    Objeto : TCrRnvPag;
end;
 TCrRnvPag= class(TInterFrame)
      private
      protected
      public
        { Public declarations }

        ParamCre        : TParamCre;

        Autorizacion      : TCrCto;     // Autorización
        Acreditado        : TCrAcredit; // Acreditado
        Cto_Pagare        : TCtrlCto;   // Contrato Corporativo

        ID_CREDITO          : TInterCampo;
        NOM_CREDITO         : TInterCampo;
        TASA_BRUTA          : TInterCampo;
        TASA_NETA           : TInterCampo;
        DIAS_PLAZO          : TInterCampo;
        CVE_IMP_RENOV       : TInterCampo;
        DESC_CVE_IMP_RENOV  : TInterCampo;
        PCT_ISR             : TInterCampo;

        ID_PROM_ADMIN       : TInterCampo;
        NOM_PROM_ADMIN      : TInterCampo;
        ID_PROM_ASOC        : TInterCampo;
        NOM_PROM_ASOC       : TInterCampo;
        CVE_PRESUPUESTO     : TInterCampo;
        DESC_PRESUPUESTO    : TInterCampo;
        CVE_PRODUCTO_GPO    : TInterCampo;
        DESC_L_PROD_GPO     : TInterCampo;
        CVE_PRODUCTO_CRE    : TInterCampo;
        DESC_L_PRODUCTO     : TInterCampo;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
        procedure ObtenEmpresaSucursal(var pesID_EMPRESA, pesID_SUCURSAL : Integer);
      end;


function ObtenNvaFVto(peDIAS_PLAZO: Integer; peApli : TInterApli): TDateTime;
//MARA4356 OBTIENE TASA BRUTA A PARTIR DE LA NETA
procedure BuscaTasaBruta(pApli       : TInterApli;
                         pPct_Isr    : Double;
                         pTasa_Neta  : Double;
                         pF_VENCTO   : TDateTime;
                         var pTasa_Bruta  : Double);
//MARA4356 OBTIENE TASA NETA A PARTIR DE LA BRUTA
procedure BuscaTasaNeta(pApli        : TInterApli;
                        pPct_Isr     : Double;
                        pTasa_Bruta  : Double;
                        pF_VENCTO    : TDateTime;
                        var pTasa_Neta  : Double);

function ObtenTasasInteres( peID_CONTRATO        : Integer;
                            peIMP_CAPITAL        : Double;
                            peDIAS_PLAZO         : Integer;
                            peISR                : Double; //MARA4356 PARA TASAS BRUTAS
                            peFECHA              : TDateTime; //MARA4356 PARA TASAS BRUTAS
                            var psTASA_ASIG      : Double;
                            var psTASA_COSTO     : Double;
                            peApli : TInterApli
                           ) : Boolean;

function ValidaTasaInteres( peID_CONTRATO        : Integer;
                            peIMP_CAPITAL        : Double;
                            peDIAS_PLAZO         : Integer;
                            peISR                : Double; //MARA4356 PARA TASAS BRUTAS
                            peFECHA              : TDateTime; //MARA4356 PARA TASAS BRUTAS
                            peNVA_TASA_INTERES   : Double;
                            peApli : TInterApli
                           ) : Boolean;

function ConfirmacionNvaTasaInteres(peID_CONTRATO : Integer; peNVA_TASA_INTERES : Double) : Boolean;

procedure LogicaNegocioPagares(peIMP_CAPITAL, peIMP_NETO_VTO, peNVO_IMPORTE : Double;
                               peCVE_IMP_RENOV : String;
                               peDIAS_PLAZO: Integer;
                               var psIMP_RENOVAR : Double;
                               var psF_NVA_VTO : TDateTime;
                               peApli : TInterApli
                              );

implementation

Uses IntCrRePaOp;    // Opciones de renovacion pagaré

{$R *.DFM}

function ObtenNvaFVto(peDIAS_PLAZO: Integer; peApli : TInterApli): TDateTime;
// var stpFIncDiasHabil : TStoredProc;
begin
  { Obtiene la nueva Fecha de Vencimiento }
  Result := peApli.DameFechaEmpresa + peDIAS_PLAZO;
  {
  Result := peApli.DameFechaEmpresa;
  stpFIncDiasHabil := TStoredProc.Create(Nil);
  If Assigned(stpFIncDiasHabil) Then
    With stpFIncDiasHabil Do
     Try
       DatabaseName := peApli.DatabaseName;
       SessionName  := peApli.SessionName;
       StoredProcName := 'PKGCRCREDITOO1.STP_F_INC_DIAS_HABIL';

       Params.Clear;
       Params.CreateParam(ftDateTime,'peFECHA',ptInput).AsFloat;
       Params.CreateParam(ftFloat,'peDIAS_INC',ptInput).AsFloat;
       Params.CreateParam(ftDateTime,'RESULT',ptResult).AsFloat;

       ParamByName('peFECHA').AsDateTime := peApli.DameFechaEmpresa;
       ParamByName('peDIAS_INC').AsFloat := peDIAS_PLAZO;
       ExecProc;
       Result := ParamByName('RESULT').AsDateTime;
     Finally
       stpFIncDiasHabil.Params.Clear;
       stpFIncDiasHabil.Free;
     End;
   }
end;

{SE AGREGA ESTE PROCEDIMIENTO PARA GENERAR LA TASA NETA}

//MARA4356 OBTIENE TASA BRUTA A PARTIR DE LA NETA
procedure BuscaTasaBruta(pApli       : TInterApli; 
                         pPct_Isr    : Double;
                         pTasa_Neta  : Double;
                         pF_VENCTO   : TDateTime;
                         var pTasa_Bruta  : Double);
var vlTASA_BRUTA, vlTASA : Real;
    vlSQL  : String;
Begin
   if (pPCT_ISR = 0)
   then vlTasa:=0
   else begin
        vlSQL:='SELECT '+FloatToStr(pPCT_ISR)+'/PKGINVERS.FUNOBTENANO('+SQLFecha(pF_VENCTO)+', 2, NULL) *'+
                       ' PKGINVERS.FUNOBTENANO('+SQLFecha(pF_VENCTO)+', 1, NULL) AS VALOR FROM DUAL';
        GetSQLFloat(vlSQL, pApli.DataBaseName, pApli.SessionName, 'VALOR', vlTASA, True);
   end;
   vlTASA_BRUTA := pTasa_Neta + vlTASA;
   pTasa_Bruta := vlTASA_BRUTA;
end;

//MARA4356 OBTIENE TASA NETA A PARTIR DE LA BRUTA
procedure BuscaTasaNeta(pApli        : TInterApli; 
                        pPct_Isr     : Double;
                        pTasa_Bruta  : Double;
                        pF_VENCTO    : TDateTime;
                        var pTasa_Neta  : Double);
var vlTasa_Neta : Real;
Begin
   GetSQLFloat('SELECT PKGINVERS.FUNOBTENNETA('+SQLFecha(pF_VENCTO)+','+FloatToStr(pTasa_Bruta)+','+FloatToStr(pPct_Isr)+' ) AS VALOR FROM DUAL',
                pApli.DataBaseName, pApli.SessionName, 'VALOR', vlTasa_Neta, True);
   pTasa_Neta := vlTasa_Neta;
end;


function ObtenTasasInteres( peID_CONTRATO        : Integer;
                            peIMP_CAPITAL        : Double;
                            peDIAS_PLAZO         : Integer;
                            peISR                : Double; //MARA4356 PARA TASAS BRUTAS
                            peFECHA              : TDateTime; //MARA4356 PARA TASAS BRUTAS
                            var psTASA_ASIG      : Double;
                            var psTASA_COSTO     : Double;                            
                            peApli : TInterApli
                           ) : Boolean;
var
  StpCaTas : TStoredProc;
begin
    // Inicializa Variables
    Result := False;  psTASA_ASIG  := -1; psTASA_COSTO  := -1;
    StpCaTas := TStoredProc.Create(Nil);
    // Obtiene la Tasa Asinada y la Tasa Costo correspondientes
    If Assigned(StpCaTas) Then
     With StpCaTas Do
      Try
       DatabaseName   := peApli.DataBaseName;
       SessionName    := peApli.SessionName;
       StoredProcName :='PKGINVERS.STPCATAS';
       Params.Clear;
       // Crea Parametros
       Params.CreateParam(ftFloat, 'V_CONTRATO',   ptInput);
       Params.CreateParam(ftFloat, 'V_IMP_CAPITAL',ptInput);
       Params.CreateParam(ftFloat, 'V_PLAZO',      ptInput);
       Params.CreateParam(ftFloat, 'V_TASA_ASIG',  ptOutput);
       Params.CreateParam(ftFloat, 'V_TASA_COSTO', ptOutput);
       Params.CreateParam(ftString,'V_DESC_TASA',  ptOutput);
       Params.CreateParam(ftFloat, 'RESP',         ptOutput);
       // Asigna los valores de entrada
       Params.ParamByName('V_CONTRATO').AsFloat    := peID_CONTRATO;
       Params.ParamByName('V_IMP_CAPITAL').AsFloat := peIMP_CAPITAL;
       Params.ParamByName('V_PLAZO').AsFloat       := peDIAS_PLAZO;
       // Prepara y ejecuta el stored procedure
       ExecProc;

       If (Parambyname('RESP').AsFloat <> 0) Then
        MessageDlg(Parambyname('V_DESC_TASA').AsString, mtError, [mbOk], 0)
       Else
        Begin
         psTASA_ASIG   := Parambyname('V_TASA_ASIG').AsFloat;
         psTASA_COSTO  := Parambyname('V_TASA_COSTO').AsFloat;
         Result := True;
        End;
     Finally
      StpCaTas.Params.Clear;
      StpCaTas.free;
     End;
end;

function ValidaTasaInteres( peID_CONTRATO        : Integer;
                            peIMP_CAPITAL        : Double;
                            peDIAS_PLAZO         : Integer;
                            peISR                : Double; //MARA4356 PARA TASAS BRUTAS
                            peFECHA              : TDateTime; //MARA4356 PARA TASAS BRUTAS
                            peNVA_TASA_INTERES   : Double;
                            peApli : TInterApli
                           ) : Boolean;
var
  vlTASA_ASIG, vlTASA_COSTO, vlTASA_NETA : Double;
begin
    Result := False;
    If ObtenTasasInteres(peID_CONTRATO, peIMP_CAPITAL, peDIAS_PLAZO, 
                         peISR, peFECHA, //MARA4356 PARA TASAS BRUTAS
                         vlTASA_ASIG, vlTASA_COSTO, peApli) Then
    begin
      //MARA4356 EL PROCEDIMIENTO OBTENTASAS INTERES DEVUELVE TASAS BRUTAS, POR LO CUAL SE 
      //AGREGA EL SIGUIENTE PROCEDIMIENTO PARA OBTENER LA TASA NETA
      BuscaTasaNeta(peApli, peIsr, vlTASA_ASIG, peFecha, vlTASA_NETA);
      //Result := (peNVA_TASA_INTERES <= vlTASA_ASIG);
      Result := (peNVA_TASA_INTERES <= vlTASA_NETA);
    end;
end;

function ConfirmacionNvaTasaInteres(peID_CONTRATO : Integer; peNVA_TASA_INTERES : Double) : Boolean;
begin
 Result := MessageDlg('La nueva tasa de interés con valor ' + FloatToStr(peNVA_TASA_INTERES)+
                      ' del Contrato '+IntToStr(peID_CONTRATO)+
                      ', se encuentra fuera de Mercado. ¿Desea Continuar?.',
                      mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;                      

procedure LogicaNegocioPagares(peIMP_CAPITAL, peIMP_NETO_VTO, peNVO_IMPORTE : Double;
                               peCVE_IMP_RENOV : String;
                               peDIAS_PLAZO: Integer;
                               var psIMP_RENOVAR : Double;
                               var psF_NVA_VTO : TDateTime;
                               peApli : TInterApli
                               );
begin
 // ****************** Obtención del Importe a Renovar o Invertir ******************
 // Si la clave es No Renovar "NA", entonces...
 If (peCVE_IMP_RENOV = CO_NO_RENOVAR) Then
  Begin
  psIMP_RENOVAR  := 0;
  End
 // Si la clave es Importe "IM", entonces...
 Else If (peCVE_IMP_RENOV = CO_IMPORTE) Then
  Begin
   psIMP_RENOVAR  := peNVO_IMPORTE;
  End
 // Si la clave es Total al vencer "TO", entonces...
 Else If (peCVE_IMP_RENOV = CO_TOTAL_AL_VENCER) Then
  Begin
  psIMP_RENOVAR  := peIMP_NETO_VTO;
  End
 // Si la clave es Solo Capital "CP", entonces...
 Else If (peCVE_IMP_RENOV = CO_SOLO_CAPITAL) Then
  Begin
  psIMP_RENOVAR  := peIMP_CAPITAL;
  End;
 // ****************** Obtención de Nueva Fecha de Vencimiento ******************
 // Si la clave es No Renovar "NA", entonces...
 If (peCVE_IMP_RENOV = CO_NO_RENOVAR) Then
  psF_NVA_VTO := 0
 // Si la clave es Importe "IM" ó Total al vencer "TO" ó  Solo Capital "CP", entonces...
 Else If (peCVE_IMP_RENOV = CO_IMPORTE) Or (peCVE_IMP_RENOV = CO_TOTAL_AL_VENCER)
           Or (peCVE_IMP_RENOV = CO_SOLO_CAPITAL) Then
  psF_NVA_VTO := ObtenNvaFVto(peDIAS_PLAZO, peApli);
end;


constructor TCrRnvPag.Create( AOwner : TComponent );
begin Inherited;
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'InTCrRnvPag.Hlp';
      ShowMenuReporte:=True;

      ID_CREDITO        := CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,False);
      NOM_CREDITO       := CreaCampo('NOM_CREDITO',ftFloat,tsNinguno,tsNinguno,False);
      TASA_BRUTA        := CreaCampo('TASA_BRUTA',ftFloat,tsNinguno,tsNinguno,False);      
      TASA_NETA         := CreaCampo('TASA_NETA',ftFloat,tsNinguno,tsNinguno,False);
      DIAS_PLAZO        := CreaCampo('DIAS_PLAZO',ftFloat,tsNinguno,tsNinguno,False);
      CVE_IMP_RENOV     := CreaCampo('CVE_IMP_RENOV',ftString,tsNinguno,tsNinguno,False);
      PCT_ISR           := CreaCampo('PCT_ISR',ftFloat,tsNinguno,tsNinguno,False);
      With CVE_IMP_RENOV Do
        Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('Total al vencer "'+CO_TOTAL_AL_VENCER+'"'); comboDatos.Add(CO_TOTAL_AL_VENCER);
        ComboLista.Add('Solo Capital    "'+CO_SOLO_CAPITAL+'"');    comboDatos.Add(CO_SOLO_CAPITAL);
        ComboLista.Add('Importe         "'+CO_IMPORTE+'"');         comboDatos.Add(CO_IMPORTE);
        ComboLista.Add('No Renovar      "'+CO_NO_RENOVAR+'"');      comboDatos.Add(CO_NO_RENOVAR);
        End;

      ID_PROM_ADMIN       := CreaCampo('ID_PROM_ADMIN',ftInteger,tsNinguno,tsNinguno,False);
      NOM_PROM_ADMIN      := CreaCampo('NOM_PROM_ADMIN',ftString,tsNinguno,tsNinguno,False);
      ID_PROM_ASOC        := CreaCampo('ID_PROM_ASOC',ftInteger,tsNinguno,tsNinguno,False);
      NOM_PROM_ASOC       := CreaCampo('NOM_PROM_ASOC',ftString,tsNinguno,tsNinguno,False);
      CVE_PRESUPUESTO     := CreaCampo('CVE_PRESUPUESTO',ftInteger,tsNinguno,tsNinguno,False);
      DESC_PRESUPUESTO    := CreaCampo('DESC_PRESUPUESTO',ftString,tsNinguno,tsNinguno,False);
      CVE_PRODUCTO_GPO    := CreaCampo('CVE_PRODUCTO_GPO',ftString,tsNinguno,tsNinguno,False);
      DESC_L_PROD_GPO     := CreaCampo('DESC_L_PROD_GPO',ftString,tsNinguno,tsNinguno,False);
      CVE_PRODUCTO_CRE    := CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,False);
      DESC_L_PRODUCTO     := CreaCampo('DESC_L_PRODUCTO',ftString,tsNinguno,tsNinguno,False);

      {$WARNINGS OFF}
      Autorizacion := TCrCto.Create(Self);
      {$WARNINGS ON}
      Autorizacion.MasterSource := Self;
      Autorizacion.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';

      {$WARNINGS OFF}
      Acreditado := TCrAcredit.Create(Self);
      {$WARNINGS ON}      
      Acreditado.MasterSource := Self;
      Acreditado.FieldByName('ID_ACREDITADO').MasterField := 'ID_ACREDITADO';

      {$WARNINGS OFF}
      Cto_Pagare := TCtrlCto.Create(Self);
      {$WARNINGS ON}      
      Cto_Pagare.MasterSource := Self;
      Cto_Pagare.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';
end;

Destructor TCrRnvPag.Destroy;
begin
 If Assigned(Autorizacion) Then Autorizacion.Free;
 If Assigned(Acreditado) Then Acreditado.Free;
 If Assigned(Cto_Pagare) Then Cto_Pagare.Free;
 inherited;
end;

procedure TCrRnvPag.ObtenEmpresaSucursal(var pesID_EMPRESA, pesID_SUCURSAL : Integer);
var vlID_EMPRESA, vlID_SUCURSAL : Integer;
begin
  // Las inicializo, en caso de que no este configuradas en CR_PARAMETRO 
  pesID_EMPRESA := 2; pesID_SUCURSAL := 654;
  // Las actualizao con la onfiguración deseada
  If GetSQLInt('SELECT ID_EMPRESA_PRLV FROM CR_PARAMETRO WHERE CVE_PARAMETRO = '+SqlStr('CRE'),
                Apli.DataBaseName, Apli.SessionName,'ID_EMPRESA_PRLV', vlID_EMPRESA, False) Then
    pesID_EMPRESA := vlID_EMPRESA;

  If GetSQLInt('SELECT ID_SUCURSAL_PRLV FROM CR_PARAMETRO WHERE CVE_PARAMETRO = '+SqlStr('CRE'),
             Apli.DataBaseName, Apli.SessionName,'ID_SUCURSAL_PRLV', vlID_SUCURSAL, False) Then
    pesID_SUCURSAL := vlID_SUCURSAL;
end;

function TCrRnvPag.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRnvPag;
begin
   W:=TWCrRnvPag.Create(Self);
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

(***********************************************FORMA CRCIERRE********************)
(*                                                                              *)
(*  FORMA DE CRCIERRE                                                            *)
(*                                                                              *)
(***********************************************FORMA CRCIERRE********************)

procedure TWCrRnvPag.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  Autorizacion.ID_CONTRATO.Control        := edID_CONTRATO;
  Autorizacion.Contrato.TITNombre.Control := edNOM_CONTRATO;

  Acreditado.ID_ACREDITADO.Control  := edID_ACREDITADO;
  Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;

  Cto_Pagare.ID_CONTRATO.Control    := edID_CTO_PAGARE;
  Cto_Pagare.TITNombre.Control      := edNOM_CTO_PAGARE;

  ID_CREDITO.Control := edID_CREDITO;
  NOM_CREDITO.Control := edNOM_CREDITO;

  TASA_BRUTA.Control := edTASA_BRUTA;  
  TASA_NETA.Control := edTASA_NETA;
  DIAS_PLAZO.Control := edDIAS_PLAZO;
  CVE_IMP_RENOV.Control := cbxCVE_IMP_RENOV;
  PCT_ISR.Control := edPCT_ISR;

  ID_PROM_ADMIN.Control     := edID_PROM_ADMIN;
  NOM_PROM_ADMIN.Control    := edNOM_PROM_ADMIN;
  ID_PROM_ASOC.Control      := edID_PROM_ASOC;
  NOM_PROM_ASOC.Control     := edNOM_PROM_ASOC;
  CVE_PRESUPUESTO.Control   := edCVE_PRESUPUESTO;
  DESC_PRESUPUESTO.Control  := edDESC_PRESUPUESTO;
  CVE_PRODUCTO_GPO.Control  := edCVE_PRODUCTO_GPO;
  DESC_L_PROD_GPO.Control   := edDESC_L_PROD_GPO;
  CVE_PRODUCTO_CRE.Control  := edCVE_PRODUCTO_CRE;
  DESC_L_PRODUCTO.Control   := edDESC_L_PRODUCTO;

  MostrarDatos;
  End;
end;

procedure TWCrRnvPag.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  Autorizacion.ID_CONTRATO.Control        := Nil;
  Autorizacion.Contrato.TITNombre.Control := Nil;

  Acreditado.ID_ACREDITADO.Control  := Nil;
  Acreditado.Persona.Nombre.Control := Nil;

  Cto_Pagare.ID_CONTRATO.Control    := Nil;
  Cto_Pagare.TITNombre.Control      := Nil;

  ID_PROM_ADMIN.Control     := Nil;
  NOM_PROM_ADMIN.Control    := Nil;
  ID_PROM_ASOC.Control      := Nil;
  NOM_PROM_ASOC.Control     := Nil;
  CVE_PRESUPUESTO.Control   := Nil;
  DESC_PRESUPUESTO.Control  := Nil;
  CVE_PRODUCTO_GPO.Control  := Nil;
  DESC_L_PROD_GPO.Control   := Nil;
  CVE_PRODUCTO_CRE.Control  := Nil;
  DESC_L_PRODUCTO.Control   := Nil;

  ID_CREDITO.Control    := Nil;
  NOM_CREDITO.Control   := Nil;
  TASA_BRUTA.Control    := Nil;
  TASA_NETA.Control     := Nil;
  DIAS_PLAZO.Control    := Nil;
  CVE_IMP_RENOV.Control := Nil;
  PCT_ISR.Control       := Nil;
  End;
end;

procedure TWCrRnvPag.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrRnvPag.StrGrdAlgnPagare1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);

  procedure AsignaSeleccion( Sender, Grid : TStringAlignGrid );
  begin
    if Sender <> Grid then
     Begin
     Grid.Row := ARow;
     End;
  end;

begin
 If Sender Is TStringGrid  Then
  Begin

    If Not Assigned(vgGrid) Then
     vgGrid := (Sender As TStringAlignGrid);

    If (vgGrid = Sender) Then
     Begin
     AsignaSeleccion( Sender As TStringAlignGrid, StrGrdAlgnPagare1 );
     AsignaSeleccion( Sender As TStringAlignGrid, StrGrdAlgnPagare2 );
     AsignaSeleccion( Sender As TStringAlignGrid, StrGrdAlgnPagare3 );
     vgGrid := Nil;
     End;

    ActivaPanel;    
    // Actualiza la Opción de Pagaré
    lblAl_PAGARE.Enabled := (StrGrdAlgnPagare3.Cells[CO_CHK_RENOVAR, StrGrdAlgnPagare1.Row] <> CO_NOTCHECK);
    If lblAl_PAGARE.Enabled Then
     lblID_PAGARE_SEL.Caption := StrGrdAlgnPagare1.Cells[CO_ID_PAGARE, StrGrdAlgnPagare1.Row]
    Else
     lblID_PAGARE_SEL.Caption := '';
  End;
end;

procedure TWCrRnvPag.StrGrdAlgnPagare1TopLeftChanged(Sender: TObject);

  procedure AsignaTopRow( Sender, Grid : TStringAlignGrid );
  begin
    if Sender <> Grid then
      Grid.TopRow := Sender.TopRow
  end;

begin
 If Sender Is TStringGrid Then
   Try
    AsignaTopRow( Sender As TStringAlignGrid, StrGrdAlgnPagare1 );
    AsignaTopRow( Sender As TStringAlignGrid, StrGrdAlgnPagare2 );
    AsignaTopRow( Sender As TStringAlignGrid, StrGrdAlgnPagare3 );
   Finally
   End;
end;

procedure TWCrRnvPag.StrGrdAlgnPagare2DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var nLeftCol : Integer;
begin
 If (Sender = StrGrdAlgnPagare2) Then
   Begin
   nLeftCol := StrGrdAlgnPagare2.LeftCol;
   lbl1.Caption := CO_A_LBL_PAGARE[nLeftCol];
   lbl2.Caption := CO_A_LBL_PAGARE[nLeftCol+1];
   End;
end;

function TWCrRnvPag.ObtPagPorRenovar : Integer;
var stpObtPagPorRenovar : TStoredProc;
begin
  Result := -1;
  stpObtPagPorRenovar := TStoredProc.Create(Nil);
  If Assigned(stpObtPagPorRenovar) Then
    With stpObtPagPorRenovar Do
     Try
       DatabaseName := Objeto.Apli.DatabaseName;
       SessionName  := Objeto.Apli.SessionName;
       StoredProcName := 'PKGCRCREDITOO1.STP_OBT_PAG_POR_RENOVAR';
       Params.CreateParam(ftFloat,'RESULT',ptResult).AsFloat;
       ExecProc;
       Result := ParamByName('RESULT').AsInteger;
     Finally
       stpObtPagPorRenovar.Params.Clear;
       stpObtPagPorRenovar.Free;
     End;
end;

procedure TWCrRnvPag.ClearAlignGrid(StringAlignGrid : TStringAlignGrid; nStartRow : Integer = 1);
var I, J : Integer;
begin
 If Assigned(StringAlignGrid) Then
  With StringAlignGrid Do
   For I := nStartRow To RowCount-1 Do
    Begin
    RowHeights[I] := DefaultRowHeight;
    For J := 0 To ColCount-1 Do
       Cells[J,I] := '';
    End ;
end;

procedure TWCrRnvPag.ColorFontRow(penRow : Integer; Color : TColor);
begin
  StrGrdAlgnPagare1.RowFont[penRow].Color := Color;
  StrGrdAlgnPagare2.RowFont[penRow].Color := Color;
  StrGrdAlgnPagare3.RowFont[penRow].Color := Color;
end;

procedure TWCrRnvPag.MostrarDatos;

    procedure SincronizaRow(nRow : Integer);
    begin
      StrGrdAlgnPagare1.RowCount := nRow;
      StrGrdAlgnPagare2.RowCount := StrGrdAlgnPagare1.RowCount;
      StrGrdAlgnPagare3.RowCount := StrGrdAlgnPagare1.RowCount;
    end;

var vlQry : TQuery;
    vlstrSQL,
    vlStrCVE_PRESUPUESTO,
    vlCVE_SIT_PAGARE,
    vlstrFilterID_CREDITO,
    vlstrFilterID_CONTRATO,
    vlstrFilterID_PROM_ASOC,
    vlstrFilterID_PROM_ADMIN,
    vlstrFilterCVE_PRESUPUESTO,
    vlstrFilterCVE_PRODUCTO_CRE,
    vlstrFilterCVE_PRODUCTO_GPO : String;

    vlTASA_ASIG, vlTASA_COSTO, vlTASA_NETA, vlTasa_Bruta : Double;
    vlnRow : Integer;
begin
  lblCountPagares1.Caption := '0';
  btnAplicar.Enabled := False;
  vgB_RESTAURA_TASA      := False;
  vgTASA_BRUTAChanged    := btnAplicar.Enabled;
  vgTASA_NETAChanged     := btnAplicar.Enabled;
  vgDIAS_PLAZOChanged    := btnAplicar.Enabled;
  vgCVE_IMP_RENOVChanged := btnAplicar.Enabled;
  vgPCT_ISRChanged       := btnAplicar.Enabled;

  //Limpia Datos
  ClearAlignGrid(StrGrdAlgnPagare1,0);
  ClearAlignGrid(StrGrdAlgnPagare2,0);
  ClearAlignGrid(StrGrdAlgnPagare3,0);

  SincronizaRow(0);

  // Arma Query
  vlCVE_SIT_PAGARE  := '';
  Case rgCVE_SIT_PAGARE.ItemIndex Of
   1  : vlCVE_SIT_PAGARE := SQLStr('PA');// Por activar
   2  : vlCVE_SIT_PAGARE := SQLStr('PU');// Por autorizar
   3  : vlCVE_SIT_PAGARE := SQLStr('AC');// Activo
   4  : vlCVE_SIT_PAGARE := SQLStr('VE');// Vencido
   5  : vlCVE_SIT_PAGARE := SQLStr('RE');// Renovado
  End;

  Objeto.ID_CREDITO.GetFromControl;
  Objeto.ID_PROM_ASOC.GetFromControl;
  Objeto.ID_PROM_ADMIN.GetFromControl;
  Objeto.CVE_PRESUPUESTO.GetFromControl;
  Objeto.CVE_PRODUCTO_CRE.GetFromControl;
  Objeto.CVE_PRODUCTO_GPO.GetFromControl;

  vlstrFilterID_CREDITO := '';
  If (Objeto.ID_CREDITO.AsInteger <> 0) Then
    vlstrFilterID_CREDITO := '              AND CC.ID_CREDITO = '+edID_CREDITO.Text+coCRLF;

  vlstrFilterID_CONTRATO := '';
  If (Trim(edID_CONTRATO.Text) <> '') Then
    vlstrFilterID_CONTRATO := '              AND CC.ID_CONTRATO = '+edID_CONTRATO.Text+coCRLF;

  vlstrFilterID_PROM_ADMIN := '';
  If (Objeto.ID_PROM_ADMIN.AsInteger <> 0) Then
    vlstrFilterID_PROM_ADMIN := '    AND  CC.ID_PROM_ADM = '+Objeto.ID_PROM_ADMIN.AsString+coCRLF;

  vlstrFilterID_PROM_ASOC := '';
  If (Objeto.ID_PROM_ASOC.AsInteger <> 0) Then
    vlstrFilterID_PROM_ASOC := '    AND CTO.ID_PERS_ASOCIAD = '+Objeto.ID_PROM_ASOC.AsString+coCRLF;

  vlstrFilterCVE_PRESUPUESTO := '';
  If (Trim(Objeto.CVE_PRESUPUESTO.AsString) <> '') Then
    vlstrFilterCVE_PRESUPUESTO :=  '    AND CC.CVE_PRESUPUESTO = '+SQLStr(Objeto.CVE_PRESUPUESTO.AsString)+coCRLF;

  vlstrFilterCVE_PRODUCTO_CRE := '';
  If (Trim(Objeto.CVE_PRODUCTO_CRE.AsString) <> '') Then
    vlstrFilterCVE_PRODUCTO_CRE := '    AND CC.CVE_PRODUCTO_CRE = '+SQLStr(Objeto.CVE_PRODUCTO_CRE.AsString)+coCRLF;

  vlstrFilterCVE_PRODUCTO_GPO := '';
  If (Trim(Objeto.CVE_PRODUCTO_GPO.AsString) <> '') Then
    vlstrFilterCVE_PRODUCTO_GPO := '    AND CC.CVE_PRODUCTO_GPO = '+SQLStr(Objeto.CVE_PRODUCTO_GPO.AsString)+coCRLF;

{  // Query Original
  vlstrSQL :=
             ' SELECT'+coCRLF+
             '      CC.CVE_PRESUPUESTO,'+cocRLF+
             '      CRPD.ID_REL_PAG_DISP,'+coCRLF+
             '      CRPD.ID_CREDITO,'+coCRLF+
             '      SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITULAR(NULL,CC.ID_CONTRATO, NULL),1,255) AS NOM_ACREDITADO,'+coCRLF+
             '      IP.ID_PAGARE,'+coCRLF+
             '      IP.CVE_SIT_PAGARE,'+coCRLF+
             '      IP.IMP_NETO_VTO,'+coCRLF+
             '      IP.IMP_CAPITAL,'+coCRLF+
             '      IP.F_VENCIMIENTO,'+coCRLF+
             '      (IP.IMP_ACUM_INT - IP.IMP_ACUM_ISR) AS IMP_NETO_CORTE,'+coCRLF+             
             '      (IP.IMP_INT_VTO - IP.IMP_ISR_VTO) AS IMP_INTERES,'+coCRLF+
             '      IP.ID_CONTRATO,'+coCRLF+
             '      SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITULAR(NULL,IP.ID_CONTRATO, NULL),1,255) AS NOM_CONTRATO,'+coCRLF+
             '      IP.F_APERTURA,'+coCRLF+
             '      IP.TX_COM_PAG,'+coCRLF+
             '      IP.TX_INST_CAJERO,'+coCRLF+
             '      IP.B_GTIA_FWD,'+coCRLF+
             '      IP.ID_EMPRESA,'+coCRLF+
             '      IP.ID_SUCURSAL,'+coCRLF+
             '      IP.TASA_NETA AS TASA_NETA_ORIG,'+coCRLF+
             '      NVL(CRPO.DIAS_PLAZO,     IP.DIAS_PLAZO) AS DIAS_PLAZO,'+coCRLF+
             '      NVL(CRPO.TASA_NETA,      0) AS TASA_NETA,'+coCRLF+
             '      NVL(CRPO.CVE_IMP_RENOV , IP.CVE_IMP_RENOV) AS CVE_IMP_RENOV,'+coCRLF+
             '      DECODE( NVL(CRPO.CVE_IMP_RENOV , IP.CVE_IMP_RENOV),''TO'',''Total al vencer "TO"'','+coCRLF+
             '                                                         ''CP'',''Solo Capital    "CP"'','+coCRLF+
             '                                                         ''IM'',''Importe         "IM"'','+coCRLF+
             '                                                         ''NA'',''No Renovar      "NA"'','+coCRLF+
             '                                                         '''') AS DESC_IMP_RENOV,'+coCRLF+
             '      DECODE( NVL(CRPO.CVE_IMP_RENOV , IP.CVE_IMP_RENOV),''TO'', NVL(CRPO.IMP_RENOVAR,    IP.IMP_NETO_VTO ),'+coCRLF+
             '                                                         ''CP'', NVL(CRPO.IMP_RENOVAR,    IP.IMP_CAPITAL  ),'+coCRLF+
             '                                                         ''IM'', NVL(CRPO.IMP_RENOVAR,    IP.IMP_NETO_VTO ),'+coCRLF+
             '                                                         ''NA'', 0,'+coCRLF+
             '                                                          NVL(IP.IMP_NETO_VTO, 0)) AS IMP_RENOVAR,'+coCRLF+
//           '      NVL(CRPO.IMP_RENOVAR,    IP.IMP_RENOVAR ) AS IMP_RENOVAR,'+coCRLF+
             '      NVL(CRPO.PCT_ISR, IP.PCT_ISR) AS PCT_ISR, '+coCRLF+
             '      NVL(CRPO.B_RENOVAR,''V'') AS B_RENOVAR, '+coCRLF+
             '      PRES.DESC_PRESUPUESTO, '+coCRLF+
             '      CC.ID_PROM_ADM, '+coCRLF+
             '      PROM_ADMIN.NOMBRE AS NOM_PROM_ADMIN, '+coCRLF+
             '      CTO.ID_PERS_ASOCIAD, '+coCRLF+
             '      PROM_ASOC.NOMBRE AS NOM_PROM_ASOC, '+coCRLF+
             '      CC.CVE_PRODUCTO_CRE, '+coCRLF+
             '      CC.DESC_L_PRODUCTO, '+coCRLF+
             '      CC.CVE_PRODUCTO_GPO '+coCRLF+
             '  FROM  ( SELECT *'+coCRLF+
             '          FROM ADMIPROD.CR_REL_PAG_DISP'+coCRLF+
             '          WHERE SIT_REL_PAG_DISP <> ''CA'''+coCRLF+
             '        ) CRPD,'+coCRLF+
             '        (   SELECT CC.ID_CREDITO, CC.ID_CONTRATO, CC.ID_PROM_ADM,'+coCRLF+
             '                   CO.CVE_PRODUCTO_CRE, CP.CVE_PRESUPUESTO,'+coCRLF+
             '                   CP.DESC_L_PRODUCTO, CP.CVE_PRODUCTO_GPO'+coCRLF+
             '            FROM CR_CREDITO CC,'+coCRLF+
             '                 CR_CONTRATO CO,'+coCRLF+
             '                 CR_PRODUCTO CP'+coCRLF+
             '            WHERE CC.SIT_CREDITO <> ''CA'''+coCRLF+
             '              AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '              AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE'+coCRLF+
             vlstrFilterID_PROM_ADMIN+
             vlstrFilterID_CREDITO+
             vlstrFilterID_CONTRATO+
             '          UNION'+coCRLF+
             '            SELECT CC.ID_CREDITO, CC.ID_CONTRATO, CC.ID_PROM_ADM,'+coCRLF+
             '                   TO_CHAR(CO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE, CC.CVE_PRESUPUESTO,'+coCRLF+
             '                   CSTB.DESC_SUB_TIPO AS DESC_L_PRODUCTO, TO_CHAR(CO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_GPO'+coCRLF+
             '            FROM CRE_CREDITO CC,'+coCRLF+
             '                 CRE_CONTRATO CO,'+coCRLF+
             '                 CRE_SUB_TIP_BCO CSTB'+coCRLF+
             '            WHERE CC.SIT_CREDITO NOT IN (''TA'',''CA'')'+coCRLF+
             '              AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '              AND CSTB.CVE_SUB_TIP_BCO = CO.CVE_SUB_TIP_BCO'+coCRLF+
             vlstrFilterID_PROM_ADMIN+
             vlstrFilterID_CREDITO+
             vlstrFilterID_CONTRATO+
             '        ) CC,'+coCRLF+
             '        INV_PAGARE IP,'+coCRLF+
             '        ADMIPROD.CR_REL_PAG_OPRN CRPO,'+coCRLF+
             '        CONTRATO CTO,'+coCRLF+
             '        CRE_PRESUPUESTO PRES,'+coCRLF+
             '        PERSONA PROM_ADMIN,'+coCRLF+
             '        PERSONA PROM_ASOC'+coCRLF+
             '  WHERE CC.ID_CREDITO = CRPD.ID_CREDITO'+coCRLF+
             '    AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             vlstrFilterID_PROM_ASOC+
             vlstrFilterCVE_PRODUCTO_CRE+
             vlstrFilterCVE_PRODUCTO_GPO+
             vlstrFilterCVE_PRESUPUESTO+
             '    AND IP.ID_CONTRATO = CRPD.ID_CONTRATO'+coCRLF+
             '    AND IP.ID_PAGARE = CRPD.ID_PAGARE'+coCRLF+
             '    AND PRES.CVE_PRESUPUESTO (+)= CC.CVE_PRESUPUESTO'+coCRLF+
             '    AND CRPO.ID_REL_PAG_DISP (+)= CRPD.ID_REL_PAG_DISP'+coCRLF+
             '    AND PROM_ADMIN.ID_PERSONA (+)= CC.ID_PROM_ADM'+coCRLF+
             '    AND PROM_ASOC.ID_PERSONA (+)= CTO.ID_PERS_ASOCIAD'+coCRLF;    
}

  vlstrSQL :=
             ' SELECT'+coCRLF+
             '       CC.CVE_PRESUPUESTO,'+coCRLF+
             '       CC.ID_REL_PAG_DISP,'+coCRLF+
             '       CC.ID_CREDITO,'+coCRLF+
             '       SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITULAR(NULL,CC.ID_CONTRATO, NULL),1,255) AS NOM_ACREDITADO,'+coCRLF+
             '       IP.ID_PAGARE,'+coCRLF+
             '       IP.CVE_SIT_PAGARE,'+coCRLF+
             '       IP.IMP_NETO_VTO,'+coCRLF+
             '       IP.IMP_CAPITAL,'+coCRLF+
             '       IP.F_VENCIMIENTO,'+coCRLF+
             '       (IP.IMP_ACUM_INT - IP.IMP_ACUM_ISR) AS IMP_NETO_CORTE,'+coCRLF+
             '       (IP.IMP_INT_VTO - IP.IMP_ISR_VTO) AS IMP_INTERES,'+coCRLF+
             '       IP.ID_CONTRATO,'+coCRLF+
             '       SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITULAR(NULL,IP.ID_CONTRATO, NULL),1,255) AS NOM_CONTRATO,'+coCRLF+
             '       IP.F_APERTURA,'+coCRLF+
             '       IP.TX_COM_PAG,'+coCRLF+
             '       IP.TX_INST_CAJERO,'+coCRLF+
             '       IP.B_GTIA_FWD,'+coCRLF+
             '       IP.ID_EMPRESA,'+coCRLF+
             '       IP.ID_SUCURSAL,'+coCRLF+
             '       IP.TASA_NETA AS TASA_NETA_ORIG,'+coCRLF+
             '       NVL(CRPO.DIAS_PLAZO,     IP.DIAS_PLAZO) AS DIAS_PLAZO,'+coCRLF+
             '       NVL(CRPO.TASA_NETA,      0) AS TASA_NETA,'+coCRLF+
//             '       NVL(CRPO.TASA_BRUTA,     0) AS TASA_BRUTA,'+coCRLF+ // IMPORTANTE
             '       0 AS TASA_BRUTA,'+coCRLF+
             '       NVL(CRPO.CVE_IMP_RENOV , IP.CVE_IMP_RENOV) AS CVE_IMP_RENOV,'+coCRLF+
             '       DECODE( NVL(CRPO.CVE_IMP_RENOV , IP.CVE_IMP_RENOV),''TO'',''Total al vencer "TO"'','+coCRLF+
             '                                                          ''CP'',''Solo Capital    "CP"'','+coCRLF+
             '                                                          ''IM'',''Importe         "IM"'','+coCRLF+
             '                                                          ''NA'',''No Renovar      "NA"'','+coCRLF+
             '                                                          '''') AS DESC_IMP_RENOV,'+coCRLF+
             '       DECODE( NVL(CRPO.CVE_IMP_RENOV , IP.CVE_IMP_RENOV),''TO'', NVL(CRPO.IMP_RENOVAR,    IP.IMP_NETO_VTO ),'+coCRLF+
             '                                                          ''CP'', NVL(CRPO.IMP_RENOVAR,    IP.IMP_CAPITAL  ),'+coCRLF+
             '                                                          ''IM'', NVL(CRPO.IMP_RENOVAR,    IP.IMP_NETO_VTO ),'+coCRLF+
             '                                                          ''NA'', 0,'+coCRLF+
             '                                                           NVL(IP.IMP_NETO_VTO, 0)) AS IMP_RENOVAR,'+coCRLF+
             '       NVL(CRPO.PCT_ISR, IP.PCT_ISR) AS PCT_ISR,'+coCRLF+
             '       NVL(CRPO.B_RENOVAR,''V'') AS B_RENOVAR,'+coCRLF+
             '       PRES.DESC_PRESUPUESTO,'+coCRLF+
             '       CC.ID_PROM_ADM,'+coCRLF+
             '       PROM_ADMIN.NOMBRE AS NOM_PROM_ADMIN,'+coCRLF+
             '       CTO.ID_PERS_ASOCIAD,'+coCRLF+
             '       PROM_ASOC.NOMBRE AS NOM_PROM_ASOC,'+coCRLF+
             '       CC.CVE_PRODUCTO_CRE,'+coCRLF+
             '       CC.DESC_L_PRODUCTO,'+coCRLF+
             '       CC.CVE_PRODUCTO_GPO'+coCRLF+
             '   FROM'+coCRLF+
             '         (   SELECT CRPD.ID_REL_PAG_DISP, CRPD.ID_CTO_PAGARE, CRPD.ID_PAGARE,'+coCRLF+
             '                    CC.ID_CREDITO, CC.ID_CONTRATO, CC.ID_PROM_ADM,'+coCRLF+
             '                    CO.CVE_PRODUCTO_CRE, CP.CVE_PRESUPUESTO,'+coCRLF+
             '                    CP.DESC_L_PRODUCTO, CP.CVE_PRODUCTO_GPO'+coCRLF+
             '             FROM (  SELECT CRPD.ID_REL_PAG_DISP,'+coCRLF+
             '                            CRPD.ID_CREDITO,'+coCRLF+
             '                            CRPD.ID_CONTRATO AS ID_CTO_PAGARE,'+coCRLF+
             '                            CRPD.ID_PAGARE'+coCRLF+
             '                     FROM CR_REL_PAG_DISP CRPD'+coCRLF+
             '                     WHERE CRPD.SIT_REL_PAG_DISP <> ''CA'''+coCRLF+
             '                   ) CRPD,'+coCRLF+
             '                  CR_CREDITO CC,'+coCRLF+
             '                  CR_CONTRATO CO,'+coCRLF+
             '                  CR_PRODUCTO CP'+coCRLF+
             '             WHERE CC.ID_CREDITO = CRPD.ID_CREDITO'+coCRLF+
             '               AND CC.SIT_CREDITO <> ''CA'''+coCRLF+
             '               AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '               AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE'+coCRLF+
             vlstrFilterID_PROM_ADMIN+
             vlstrFilterID_CREDITO+
             vlstrFilterID_CONTRATO+             
             '           UNION'+coCRLF+
             '             SELECT CRPD.ID_REL_PAG_DISP, CRPD.ID_CTO_PAGARE, CRPD.ID_PAGARE,'+coCRLF+
             '                    CC.ID_CREDITO, CC.ID_CONTRATO, CC.ID_PROM_ADM,'+coCRLF+
             '                    TO_CHAR(CO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE, CC.CVE_PRESUPUESTO,'+coCRLF+
             '                    CSTB.DESC_SUB_TIPO AS DESC_L_PRODUCTO, TO_CHAR(CO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_GPO'+coCRLF+
             '             FROM (  SELECT CRPD.ID_REL_PAG_DISP,'+coCRLF+
             '                            CRPD.ID_CREDITO,'+coCRLF+
             '                            CRPD.ID_CONTRATO AS ID_CTO_PAGARE,'+coCRLF+
             '                            CRPD.ID_PAGARE'+coCRLF+
             '                     FROM CR_REL_PAG_DISP CRPD'+coCRLF+
             '                     WHERE CRPD.SIT_REL_PAG_DISP <> ''CA'''+coCRLF+
             '                   ) CRPD,'+coCRLF+
             '                   CRE_CREDITO CC,'+coCRLF+
             '                  CRE_CONTRATO CO,'+coCRLF+
             '                  CRE_SUB_TIP_BCO CSTB'+coCRLF+
             '             WHERE CC.ID_CREDITO = CRPD.ID_CREDITO'+coCRLF+
             '               AND CC.SIT_CREDITO NOT IN (''CA'',''TA'')'+coCRLF+
             '               AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '               AND CSTB.CVE_SUB_TIP_BCO = CO.CVE_SUB_TIP_BCO'+coCRLF+
             vlstrFilterID_PROM_ADMIN+
             vlstrFilterID_CREDITO+
             vlstrFilterID_CONTRATO+             
             '         ) CC,'+coCRLF+
             '         INV_PAGARE IP,'+coCRLF+
             '         CR_REL_PAG_OPRN CRPO,'+coCRLF+
             '         CONTRATO CTO,'+coCRLF+
             '         CRE_PRESUPUESTO PRES,'+coCRLF+
             '         PERSONA PROM_ADMIN,'+coCRLF+
             '         PERSONA PROM_ASOC'+coCRLF+
             '   WHERE CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             vlstrFilterID_PROM_ASOC+
             vlstrFilterCVE_PRODUCTO_CRE+
             vlstrFilterCVE_PRODUCTO_GPO+
             vlstrFilterCVE_PRESUPUESTO+             
             '     AND IP.ID_CONTRATO = CC.ID_CTO_PAGARE'+coCRLF+
             '     AND IP.ID_PAGARE = CC.ID_PAGARE'+coCRLF+
             '     AND PRES.CVE_PRESUPUESTO (+)= CC.CVE_PRESUPUESTO'+coCRLF+
             '     AND CRPO.ID_REL_PAG_DISP (+)= CC.ID_REL_PAG_DISP'+coCRLF+
             '     AND PROM_ADMIN.ID_PERSONA (+)= CC.ID_PROM_ADM'+coCRLF+
             '     AND PROM_ASOC.ID_PERSONA (+)= CTO.ID_PERS_ASOCIAD'+coCRLF;

     If (Trim(edID_ACREDITADO.Text) <> '') Then
         vlstrSQL :=   vlstrSQL + '   AND CTO.ID_TITULAR = '+edID_ACREDITADO.Text+coCRLF;

     If (Trim(edID_CTO_PAGARE.Text) <> '') Then
         vlstrSQL :=   vlstrSQL + '   AND IP.ID_CONTRATO = '+edID_CTO_PAGARE.Text+coCRLF;

     If (Trim(vlCVE_SIT_PAGARE) <> '') Then
         vlstrSQL :=   vlstrSQL + '   AND IP.CVE_SIT_PAGARE = '+vlCVE_SIT_PAGARE+coCRLF;

     // Si eligio que se muestren únicamente los pendientes por renovar "ItemIndex = 1", entonces...
     If (rgMostrar.ItemIndex = 1) Then
         vlstrSQL :=   vlstrSQL + '   AND IP.F_VENCIMIENTO <= '+SQLFecha(Objeto.Apli.DameFechaEmpresa);

     vlstrSQL :=   vlstrSQL + ' ORDER BY PRES.DESC_PRESUPUESTO, CTO.ID_TITULAR '+coCRLF;

   vlQry := GetSQLQuery(vlstrSQL,Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, False);

   // Si hay registros de Pagares, Habilita el botón de Aplica Renovaciones
   btnAplicaRenovaciones.Enabled := Assigned(vlQry);
   // Si hay registros de Pagares, entonces...
   If Assigned(vlQry) Then
    With vlQry Do
     Begin
      Last;
      SincronizaRow(vlQry.RecordCount * 2);

      TDateField(FieldByName('F_APERTURA')).DisplayFormat    := CFORMAT_FECHA;
      TDateField(FieldByName('F_VENCIMIENTO')).DisplayFormat := CFORMAT_FECHA;

      TNumericField(FieldByName('IMP_NETO_VTO')).DisplayFormat   := CO_FORMAT_DINERO_GRID;
      TNumericField(FieldByName('IMP_CAPITAL')).DisplayFormat    := CO_FORMAT_DINERO_GRID;
      TNumericField(FieldByName('IMP_INTERES')).DisplayFormat    := CO_FORMAT_DINERO_GRID;
      TNumericField(FieldByName('IMP_RENOVAR')).DisplayFormat    := CO_FORMAT_DINERO_GRID;
      TNumericField(FieldByName('TASA_BRUTA')).DisplayFormat     := CO_FORMAT_TASA_GRID;
      TNumericField(FieldByName('TASA_NETA')).DisplayFormat      := CO_FORMAT_TASA_GRID;
      TNumericField(FieldByName('TASA_NETA_ORIG')).DisplayFormat := CO_FORMAT_TASA_GRID;
      TNumericField(FieldByName('PCT_ISR')).DisplayFormat        := CO_FORMAT_PCT_GRID;

      First;
      vlnRow := 0; vlStrCVE_PRESUPUESTO := '';
      While Not Eof Do
       Begin
        If (vlStrCVE_PRESUPUESTO <> FieldByName('CVE_PRESUPUESTO').AsString) Then
          Begin
          vlStrCVE_PRESUPUESTO := FieldByName('CVE_PRESUPUESTO').AsString;
          StrGrdAlgnPagare1.Cells[CO_B_CORTE,vlnRow]     := 'V';
          StrGrdAlgnPagare1.Cells[CO_ID_CREDITO,vlnRow]  := 'Mdo. Objetivo:';
          StrGrdAlgnPagare1.Cells[CO_NOM_ACREDITADO,vlnRow]   := FieldByName('DESC_PRESUPUESTO').AsString;

          ColoreaCorte(StrGrdAlgnPagare1, vlnRow, clBlack);
          ColoreaCorte(StrGrdAlgnPagare2, vlnRow, clBlack);
          ColoreaCorte(StrGrdAlgnPagare3, vlnRow, clBlack);
          Inc(vlnRow);
          End
        Else
          Begin
          ColoreaCorte(StrGrdAlgnPagare1, vlnRow, clWindow);
          ColoreaCorte(StrGrdAlgnPagare2, vlnRow, clWindow);
          ColoreaCorte(StrGrdAlgnPagare3, vlnRow, clWindow);
          End;

        StrGrdAlgnPagare1.Cells[CO_B_CORTE,vlnRow]            := 'F';
        StrGrdAlgnPagare1.Cells[CO_ID_REL_PAG_DISP,vlnRow]    := FieldByName('ID_REL_PAG_DISP').DisplayText;
        StrGrdAlgnPagare1.Cells[CO_ID_CREDITO,vlnRow]         := FieldByName('ID_CREDITO').DisplayText;
        StrGrdAlgnPagare1.Cells[CO_NOM_ACREDITADO,vlnRow]     := FieldByName('NOM_ACREDITADO').DisplayText;
        StrGrdAlgnPagare1.Cells[CO_ID_PAGARE,vlnRow]          := FieldByName('ID_PAGARE').DisplayText;
        StrGrdAlgnPagare1.Cells[CO_CVE_SIT_PAGARE,vlnRow]     := FieldByName('CVE_SIT_PAGARE').DisplayText;

        StrGrdAlgnPagare2.Cells[CO_IMP_NETO_VTO,vlnRow]       := FieldByName('IMP_NETO_VTO').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_F_VENCIMIENTO,vlnRow]      := FieldByName('F_VENCIMIENTO').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_IMP_CAPITAL,vlnRow]        := FieldByName('IMP_CAPITAL').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_IMP_INTERES,vlnRow]        := FieldByName('IMP_INTERES').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_IMP_NETO_CORTE,vlnRow]     := FieldByName('IMP_NETO_CORTE').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_TASA_NETA_ORIG,vlnRow]     := FieldByName('TASA_NETA_ORIG').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_CVE_PRESUPUESTO,vlnRow]    := FieldByName('CVE_PRESUPUESTO').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_DESC_PRESUPUESTO,vlnRow]   := FieldByName('DESC_PRESUPUESTO').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_ID_PROM_ADM,vlnRow]        := FieldByName('ID_PROM_ADM').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_NOM_PROM_ADMIN,vlnRow]     := FieldByName('NOM_PROM_ADMIN').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_ID_PERS_ASOCIAD,vlnRow]    := FieldByName('ID_PERS_ASOCIAD').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_NOM_PROM_ASOC,vlnRow]      := FieldByName('NOM_PROM_ASOC').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_CVE_PRODUCTO_GPO,vlnRow]   := FieldByName('CVE_PRODUCTO_GPO').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_CVE_PRODUCTO_CRE,vlnRow]   := FieldByName('CVE_PRODUCTO_CRE').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_DESC_L_PRODUCTO,vlnRow]    := FieldByName('DESC_L_PRODUCTO').DisplayText;

        StrGrdAlgnPagare2.Cells[CO_ID_CONTRATO,vlnRow]        := FieldByName('ID_CONTRATO').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_NOM_CONTRATO,vlnRow]       := FieldByName('NOM_CONTRATO').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_F_APERTURA,vlnRow]         := FieldByName('F_APERTURA').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_TX_COM_PAG,vlnRow]         := FieldByName('TX_COM_PAG').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_TX_INST_CAJERO,vlnRow]     := FieldByName('TX_INST_CAJERO').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_B_GTIA_FWD,vlnRow]         := FieldByName('B_GTIA_FWD').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_ID_EMPRESA,vlnRow]         := FieldByName('ID_EMPRESA').DisplayText;
        StrGrdAlgnPagare2.Cells[CO_ID_SUCURSAL,vlnRow]        := FieldByName('ID_SUCURSAL').DisplayText;

        // Si la Fecha de Vencimiento del crédito es < a la Fecha del Día D000 entonces...
        If ((FieldByName('F_VENCIMIENTO').AsDateTime) <=  Objeto.Apli.DameFechaEmpresa) Then
         Begin
         // Coloca el registro para renovarse
         ColorFontRow(vlnRow, clWindowText);
         // Si no se ha indicado la tasa de interés entonces...
         If (FieldByName('TASA_NETA').AsFloat <= 0) Then
          Begin
           // Obtiene la Tasa de Interés
           If ObtenTasasInteres( FieldByName('ID_CONTRATO').AsInteger,
                                 FieldByName('IMP_RENOVAR').AsFloat,
                                 FieldByName('DIAS_PLAZO').AsInteger,
                                 FieldByName('PCT_ISR').AsFloat,//MARA4356 PARA TASAS BRUTAS
                                 FieldByName('F_VENCIMIENTO').AsDateTime,//MARA4356 PARA TASAS BRUTAS
                                 vlTASA_ASIG, vlTASA_COSTO,
                                 Objeto.Apli
                               ) Then begin
             // Asigna la tasa de interés calculada
             //StrGrdAlgnPagare3.Cells[CO_TASA_NETA,vlnRow]       := Format(COFORMAT_TASA,[vlTASA_ASIG]);
             //MARA4356 EL PROCEDIMIENTO OBTENTASAS INTERES DEVUELVE TASAS BRUTAS, POR LO CUAL SE
             //AGREGA EL SIGUIENTE PROCEDIMIENTO PARA OBTENER LA TASA NETA
             BuscaTasaNeta(Objeto.Apli, FieldByName('PCT_ISR').AsFloat, vlTASA_ASIG, FieldByName('F_VENCIMIENTO').AsDateTime, vlTASA_NETA);
             StrGrdAlgnPagare3.Cells[CO_TASA_NETA,vlnRow]       := Format(COFORMAT_TASA,[vlTASA_NETA]);
             end;
          End
         Else
          Begin
          StrGrdAlgnPagare3.Cells[CO_TASA_NETA,vlnRow]           := FieldByName('TASA_NETA').DisplayText;
          End;

         //
         If (FieldByName('TASA_BRUTA').AsFloat <> 0) Then
            StrGrdAlgnPagare3.Cells[CO_TASA_BRUTA, vlnRow] := FieldByName('TASA_BRUTA').DisplayText
         Else
            Begin
            BuscaTasaBruta(Objeto.Apli,
                           FieldByName('PCT_ISR').AsFloat,
                           FieldByName('TASA_NETA').AsFloat,
                           FieldByName('F_VENCIMIENTO').AsDateTime,
                           vlTasa_Bruta
                         );
            StrGrdAlgnPagare3.Cells[CO_TASA_BRUTA, vlnRow] := Format('%4.8f', [vlTasa_Bruta]);
            End;

         StrGrdAlgnPagare3.Cells[CO_DIAS_PLAZO,vlnRow]         := FieldByName('DIAS_PLAZO').DisplayText;
         StrGrdAlgnPagare3.Cells[CO_CVE_IMP_RENOV,vlnRow]      := FieldByName('CVE_IMP_RENOV').DisplayText;
         StrGrdAlgnPagare3.Cells[CO_DESC_CVE_IMP_RENOV,vlnRow] := FieldByName('DESC_IMP_RENOV').DisplayText;
         StrGrdAlgnPagare3.Cells[CO_IMP_RENOVAR,vlnRow]        := FieldByName('IMP_RENOVAR').DisplayText;
         StrGrdAlgnPagare3.Cells[CO_PCT_ISR,vlnRow]            := FieldByName('PCT_ISR').DisplayText;
         StrGrdAlgnPagare3.Cells[CO_CHK_RENOVAR,vlnRow]        := FieldByName('B_RENOVAR').DisplayText;

         If (FieldByName('CVE_IMP_RENOV').AsString <> CO_NO_RENOVAR) Then
           Begin
           StrGrdAlgnPagare3.Cells[CO_F_NVA_VTO,vlnRow]          := DateToStr(ObtenNvaFVto(FieldByName('DIAS_PLAZO').AsInteger, Objeto.Apli));
           End;
         End
       Else
         Begin
         // Deshabilitalo, para que no se pueda renovar
         ColorFontRow(vlnRow, clGrayText);
         StrGrdAlgnPagare3.Cells[CO_TASA_BRUTA,vlnRow]         := '';         
         StrGrdAlgnPagare3.Cells[CO_TASA_NETA,vlnRow]          := '';
         StrGrdAlgnPagare3.Cells[CO_DIAS_PLAZO,vlnRow]         := '';
         StrGrdAlgnPagare3.Cells[CO_CVE_IMP_RENOV,vlnRow]      := '';
         StrGrdAlgnPagare3.Cells[CO_DESC_CVE_IMP_RENOV,vlnRow] := '';
         StrGrdAlgnPagare3.Cells[CO_IMP_RENOVAR,vlnRow]        := '';
         StrGrdAlgnPagare3.Cells[CO_PCT_ISR,vlnRow]            := '';
         StrGrdAlgnPagare3.Cells[CO_F_NVA_VTO,vlnRow]          := '';
         StrGrdAlgnPagare3.Cells[CO_CHK_RENOVAR,vlnRow]        := CO_NOTCHECK;
         End;

        Next;
        Inc(vlnRow);
        End;

      SincronizaRow(vlnRow);
      lblCountPagares1.Caption := IntToStr(vlnRow);
      vlQry.Close;
      vlQry.Free;
     End;
end;

procedure TWCrRnvPag.btnID_CREDITOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRRNVPAG_DISP',True,True) then
   begin
       With Objeto Do
         CreaBuscador1('CONSDISP.IT','',0,3, ID_CREDITO, NOM_CREDITO, cbID_CREDITO);
   end;
end;

procedure TWCrRnvPag.btnID_CONTRATOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRRNVPAG_AUTOR',True,True) then
   begin
     With Objeto Do
      Begin
       Autorizacion.ShowAll := True;
       If Autorizacion.Busca Then
        Begin
        chkbxID_CONTRATO.Checked:=True;
        chkbxID_CONTRATO.Enabled:=True;
        InterForma1.NextTab(edID_CONTRATO);
        End;
     End;
   end;  
end;

procedure TWCrRnvPag.btnID_ACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRRNVPAG_ACRED',True,True) then
   begin
     With Objeto Do
      Begin
       Acreditado.ShowAll := True;
       If Acreditado.Busca Then
        Begin
        chkbxID_ACREDITADO.Checked:=True;
        chkbxID_ACREDITADO.Enabled:=True;
        InterForma1.NextTab(edID_ACREDITADO);
        End;
     End;
   end;
end;

procedure TWCrRnvPag.btnID_CTO_PAGAREClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRRNVPAG_CTTO',True,True) then
   begin
       With Objeto Do
        Begin
         Cto_Pagare.ShowAll := True;
         If Cto_Pagare.Busca Then
          Begin
          chkbxID_CTO_PAGARE.Checked:=True;
          chkbxID_CTO_PAGARE.Enabled:=True;
          InterForma1.NextTab(edID_CTO_PAGARE);
          End;
       End;
   end;
end;

procedure TWCrRnvPag.cbID_CREDITOClick(Sender: TObject);
begin
  LimpiaControles(cbID_CREDITO, Objeto.ID_CREDITO, Objeto.NOM_CREDITO);
end;

procedure TWCrRnvPag.chkbxID_CONTRATOClick(Sender: TObject);
begin
    If Not chkbxID_CONTRATO.Checked Then
      Begin
      Objeto.Autorizacion.Active:=False;
      chkbxID_CONTRATO.Checked:=False;
      End
    Else
      Begin
      chkbxID_CONTRATO.Checked:=True;
      End;
end;

procedure TWCrRnvPag.chkbxID_ACREDITADOClick(Sender: TObject);
begin
    If Not chkbxID_ACREDITADO.Checked Then
      Begin
      Objeto.Acreditado.Active:=False;
      chkbxID_ACREDITADO.Checked:=False;
      End
    Else
      Begin
      chkbxID_ACREDITADO.Checked:=True;
      End;
end;

procedure TWCrRnvPag.chkbxID_CTO_PAGAREClick(Sender: TObject);
begin
    If Not chkbxID_CTO_PAGARE.Checked Then
      Begin
      Objeto.Cto_Pagare.Active:=False;
      chkbxID_CTO_PAGARE.Checked:=False;
      End
    Else
      Begin
      chkbxID_CTO_PAGARE.Checked:=True;
      End;
end;

procedure TWCrRnvPag.ilID_CREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrRnvPag.ilID_CREDITOEjecuta(Sender: TObject);
begin
 With Objeto Do
    ObtenDescripcion(  ilID_CREDITO.Buffer,
                       ' SELECT P.NOMBRE AS NOM_ACREDITADO'+coCRLF+
                       ' FROM ( SELECT CC.ID_CONTRATO'+coCRLF+
                       '        FROM CR_CREDITO CC'+coCRLF+
                       '        WHERE CC.ID_CREDITO = '+ilID_CREDITO.Buffer+coCRLF+
                               '          AND CC.SIT_CREDITO <> ''CA'''+coCRLF+
                       '      UNION'+coCRLF+
                       '        SELECT CC.ID_CONTRATO'+coCRLF+
                       '        FROM CRE_CREDITO CC'+coCRLF+
                       '        WHERE CC.ID_CREDITO = '+ilID_CREDITO.Buffer+coCRLF+
                       '          AND CC.SIT_CREDITO NOT IN (''TA'',''CA'')'+coCRLF+
                       '      ) CC,'+coCRLF+
                       '      CONTRATO CTO,'+coCRLF+
                       '      PERSONA P'+coCRLF+
                       ' WHERE CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                       '   AND P.ID_PERSONA = CTO.ID_TITULAR',
                       'NOM_ACREDITADO',
                       ID_CREDITO,
                       NOM_CREDITO,
                       cbID_CREDITO
                     );
end;

procedure TWCrRnvPag.ilID_CONTRATOEjecuta(Sender: TObject);
begin
     If Objeto.Autorizacion.FindKey([ilID_CONTRATO.Buffer,1])Then
     Begin
     chkbxID_CONTRATO.Checked:=True;
     chkbxID_CONTRATO.Enabled:=True;
     InterForma1.NextTab(edID_CONTRATO);
     End;
end;

procedure TWCrRnvPag.ilID_ACREDITADOEjecuta(Sender: TObject);
begin
     If Objeto.Acreditado.FindKey([ilID_ACREDITADO.Buffer])Then
     Begin
     chkbxID_ACREDITADO.Checked:=True;
     chkbxID_ACREDITADO.Enabled:=True;
     InterForma1.NextTab(edID_ACREDITADO);
     End;
end;

procedure TWCrRnvPag.ilID_CTO_PAGAREEjecuta(Sender: TObject);
begin
     If Objeto.Cto_Pagare.FindKey([ilID_CTO_PAGARE.Buffer])Then
     Begin
     chkbxID_CTO_PAGARE.Checked:=True;
     chkbxID_CTO_PAGARE.Enabled:=True;
     InterForma1.NextTab(edID_CTO_PAGARE);
     End;
end;

procedure TWCrRnvPag.btnAplicarClick(Sender: TObject);
var vlnRow : Integer;
    vlIMP_RENOVAR : Double;
    vlF_NVA_VTO : TDateTime;
    vlTASA_ASIG, vlTASA_COSTO, vlTASA_NETA : Double;
    DataRegistro  : PDataRegistro;
    vlB_VALIDA_TASA : Boolean;
begin
   if Objeto.ValidaAccesoEsp('TCRRNVPAG_ACTULI',True,True) then
   begin
       // Inicia Bandera
       vlB_VALIDA_TASA := True;
       With StrGrdAlgnPagare3 Do
         For vlnRow := 0 To RowCount - 1 Do
          Begin
            // Obtiene los datos para actualizar las configuraciones de pagaré
            Objeto.TASA_NETA.GetFromControl;
            Objeto.DIAS_PLAZO.GetFromControl;
            Objeto.CVE_IMP_RENOV.GetFromControl;
            Objeto.PCT_ISR.GetFromControl;
            // Obtiene los valores de las celdas
            New(DataRegistro);
            ObtenValoresdelRegistro(vlnRow, DataRegistro);
            // Valida que el registro se pueda renovar
            If (DataRegistro^.CHK_RENOVAR <> CO_NOTCHECK) Then
              Begin
              // Obtiene las modificaciones de los valores que cambiaron sustituyendo los originales
              If vgDIAS_PLAZOChanged Then DataRegistro^.DIAS_PLAZO := Objeto.DIAS_PLAZO.AsInteger;
              If vgPCT_ISRChanged    Then DataRegistro^.PCT_ISR := Objeto.PCT_ISR.AsFloat;
              If vgCVE_IMP_RENOVChanged Then
                Begin
                DataRegistro^.CVE_IMP_RENOV      := Objeto.CVE_IMP_RENOV.AsString;
                DataRegistro^.DESC_CVE_IMP_RENOV := cbxCVE_IMP_RENOV.Items[cbxCVE_IMP_RENOV.ItemIndex];
                End;
              // Conforme a la lógica de negocio obtiene los nuevos valores
              LogicaNegocioPagares(DataRegistro^.IMP_CAPITAL,
                                   DataRegistro^.IMP_NETO_VTO,
                                   DataRegistro^.IMP_RENOVAR,
                                   DataRegistro^.CVE_IMP_RENOV,
                                   DataRegistro^.DIAS_PLAZO,
                                   vlIMP_RENOVAR,
                                   vlF_NVA_VTO,
                                   Objeto.Apli);
             // Si cambio la tasa, el plazo el Metódo de Renovación entonces...
             If (vgTASA_BRUTAChanged Or vgTASA_NETAChanged Or vgDIAS_PLAZOChanged Or vgCVE_IMP_RENOVChanged) Then
               Begin
               // Valida si se requiere restaurar la Tasa Neta
               If (vgB_RESTAURA_TASA Or vgDIAS_PLAZOChanged Or
                    (vgCVE_IMP_RENOVChanged And (vlIMP_RENOVAR > 0))) Then
                 // Obtiene la Tasa de Interés correspondiente al contrato, plazo e Importe
                 Begin
                   If ObtenTasasInteres( DataRegistro^.ID_CONTRATO,
                                         vlIMP_RENOVAR,
                                         DataRegistro^.DIAS_PLAZO,
                                         DataRegistro^.PCT_ISR,//MARA4356 PARA TASAS BRUTAS
                                         DataRegistro^.F_VENCIMIENTO, //MARA4356 PARA TASAS BRUTAS
                                         vlTASA_ASIG,
                                         vlTASA_COSTO,
                                         Objeto.Apli
                                       ) Then begin
                     //DataRegistro^.TASA_NETA := vlTASA_ASIG;
                     //MARA4356 EL PROCEDIMIENTO OBTENTASAS INTERES DEVUELVE TASAS BRUTAS, POR LO CUAL SE
                     //AGREGA EL SIGUIENTE PROCEDIMIENTO PARA OBTENER LA TASA NETA
                     BuscaTasaNeta(Objeto.Apli, DataRegistro^.PCT_ISR, vlTASA_ASIG, DataRegistro^.F_VENCIMIENTO, vlTASA_NETA);
                     DataRegistro^.TASA_NETA := vlTASA_NETA;
                     end;
                 End
               // Si no se quiere restaurar la tasa por su valor original entonces...
               // Verifica si se desea validar la tasa. ( Está bandera sirve para que el usuario solo indique que se aplique
               //  el tipo de tasa especial para todos los pagarés al momemnto de que aparezca el mensaje de confirmación
               //   y no tenga que hacerlo para cada tasa que encuentre diferente )
               Else If vlB_VALIDA_TASA Then
                     //  Válida que la tasa se encuentre dentro de las Bandas de Mercado y que el usuario este de acuerdo....
                      If Not ValidaTasaInteres( DataRegistro^.ID_CONTRATO,
                                                vlIMP_RENOVAR,
                                                DataRegistro^.DIAS_PLAZO,
                                                DataRegistro^.PCT_ISR,//MARA4356 PARA TASAS BRUTAS
                                                DataRegistro^.F_VENCIMIENTO, //MARA4356 PARA TASAS BRUTAS
                                                Objeto.TASA_NETA.AsFloat,
                                                Objeto.Apli
                                               ) Then
                         Begin
                         // Si no es así, píde confirmación al usuario, para poder continuar...
                         If ConfirmacionNvaTasaInteres(DataRegistro^.ID_CONTRATO, Objeto.TASA_NETA.AsFloat) Then
                            Begin
                             // Valida el Usuario para poder continuar con la actualización de Tasa.
                             If (ValidaPassword(Objeto.Apli.Usuario, Objeto.Apli) = mrYes) Then
                                Begin
                                // Si el usuario esta de acuerdo, actualiza el valor de la tasa del registro...
                                DataRegistro^.TASA_NETA := Objeto.TASA_NETA.AsFloat;
                                vlB_VALIDA_TASA := False;
                                End
                             Else
                                Begin
                                MessageDlg('Debe de indicar su usuario y password, para poder cambiar la tasa.', mtWarning, [mbOk], 0);
                                Exit;
                                End;
                            End
                         Else
                            Exit;
                            // If (ValidaPassword(
                         End
                      Else
                         Begin
                         DataRegistro^.TASA_NETA := Objeto.TASA_NETA.AsFloat;
                         End;
                      // If Not  ValidaTasaInteres
               End;

              // Actualiza la bandera, conforme al tipo de renovación seleccionado
              If (DataRegistro^.CVE_IMP_RENOV = CO_NO_RENOVAR) Then DataRegistro^.CHK_RENOVAR := CO_UNCHECKED
              Else DataRegistro^.CHK_RENOVAR := CO_CHECKED;

              // Si se actualiza la Configuración del Pagaré correctamente, entonces...
              If ActualizaConfPagare(DataRegistro^.ID_REL_PAG_DISP, DataRegistro^.TASA_NETA,
                                     DataRegistro^.DIAS_PLAZO, DataRegistro^.PCT_ISR, DataRegistro^.CVE_IMP_RENOV,
                                     vlIMP_RENOVAR, DataRegistro^.CHK_RENOVAR) Then
                 Begin
                 // Actualiza los valores de las celdas
                 ActualizaValores(vlnRow,
                                  DataRegistro^.TASA_BRUTA,
                                  DataRegistro^.TASA_NETA,
                                  DataRegistro^.DIAS_PLAZO,
                                  DataRegistro^.CVE_IMP_RENOV,
                                  DataRegistro^.PCT_ISR,
                                  Obten_DESC_CVE_IMP_RENOV(DataRegistro^.CVE_IMP_RENOV),
                                  vlIMP_RENOVAR,
                                  vlF_NVA_VTO,
                                  DataRegistro^.CHK_RENOVAR
                                  );
                 Application.ProcessMessages;
                 End; // If ActualizaConfPagare(
              End; // If (DataRegistro^.CHK_RENOVAR <> CO_NOTCHECK) Then
          End; // End For
       // Limpia los controles
       {
        Se decidio en la junta del 04/Enero/2004 ue no se limpiaran los controles
        Objeto.TASA_NETA.AsFloat      := 0;
        Objeto.DIAS_PLAZO.AsInteger   := 0;
        Objeto.CVE_IMP_RENOV.AsString := '';
        Objeto.PCT_ISR.AsFloat        := 0;
       }
       // Desactiva el botón de Aplicar Cambios
       btnAplicar.Enabled := False;
       vgB_RESTAURA_TASA      := btnAplicar.Enabled;
       vgTASA_BRUTAChanged    := btnAplicar.Enabled;
       vgTASA_NETAChanged     := btnAplicar.Enabled;
       vgDIAS_PLAZOChanged    := btnAplicar.Enabled;
       vgCVE_IMP_RENOVChanged := btnAplicar.Enabled;
       vgPCT_ISRChanged       := btnAplicar.Enabled;

   end;   
end;

function TWCrRnvPag.ActualizaConfPagare(peID_REL_PAG_DISP, peTASA_NETA: Double; peDIAS_PLAZO: Integer;
                                        pePCT_ISR : Double;  peCVE_IMP_RENOV: String;
                                        peIMP_RENOVAR: Double; peCHK_RENOVAR: String): Boolean;
var stpActConfPagare : TStoredProc;
begin
  Result := False;
  stpActConfPagare := TStoredProc.Create(Nil);
  If Assigned(stpActConfPagare) Then
    With stpActConfPagare Do
     Try
       DatabaseName := Objeto.Apli.DatabaseName;
       SessionName  := Objeto.Apli.SessionName;
       StoredProcName := 'PKGCRCREDITOO1.STP_ACT_CONF_PAGARE';

       Params.Clear;
       Params.CreateParam(ftFloat,'peID_REL_PAG_DISP',ptInput);
       Params.CreateParam(ftFloat,'peTASA_NETA',ptInput);
       Params.CreateParam(ftFloat,'peDIAS_PLAZO',ptInput);
       Params.CreateParam(ftString,'peCVE_IMP_RENOV',ptInput);
       Params.CreateParam(ftFloat,'peIMP_RENOVAR',ptInput);
       Params.CreateParam(ftFloat,'pePCT_ISR',ptInput);
       Params.CreateParam(ftString,'peB_RENOVAR',ptInput);
       Params.CreateParam(ftString,'peB_COMMIT',ptOutput);
       Params.CreateParam(ftFloat,'psRESULTADO',ptOutput);
       Params.CreateParam(ftString,'psTX_RESULTADO',ptOutput);

       ParamByName('peID_REL_PAG_DISP').AsFloat  := peID_REL_PAG_DISP;
       ParamByName('peTASA_NETA').AsFloat        := peTASA_NETA;
       ParamByName('peDIAS_PLAZO').AsFloat       := peDIAS_PLAZO;
       ParamByName('peCVE_IMP_RENOV').AsString   := peCVE_IMP_RENOV;
       ParamByName('peIMP_RENOVAR').AsFloat      := peIMP_RENOVAR;
       ParamByName('pePCT_ISR').AsFloat          := pePCT_ISR;
       ParamByName('peB_RENOVAR').AsString       := peCHK_RENOVAR;
       ParamByName('peB_COMMIT').AsString        := CVERDAD;
       ExecProc;

       If (ParamByName('psRESULTADO').AsFloat <> 0) Then
         MessageDlg(ParamByName('psTX_RESULTADO').AsString, mtError, [mbOk], 0)
       Else
         Result := True;
     Finally
       stpActConfPagare.Params.Clear;
       stpActConfPagare.Free;
     End;
end;

procedure TWCrRnvPag.ObtenValoresdelRegistro(penRow : Integer; var DataRegistro : PDataRegistro);
begin
 // Si el registro seleccionado, se encuentra vacío entonces...
 If (Trim(StrGrdAlgnPagare1.Cells[CO_ID_REL_PAG_DISP,penRow]) = '') Then
  Begin
  // Lo coloca como que el registro "No Aplica".
  DataRegistro^.CHK_RENOVAR := CO_NOTCHECK;
  End
 Else
  Begin
  // De lo contrario, obtiene los valores del registro indicado.
     With StrGrdAlgnPagare1 Do
      Begin
      DataRegistro^.ID_REL_PAG_DISP := StrToInt(Cells[CO_ID_REL_PAG_DISP,penRow]);
      DataRegistro^.ID_PAGARE := StrToInt(Cells[CO_ID_PAGARE,penRow]);
      DataRegistro^.CVE_SIT_PAGARE := Cells[CO_CVE_SIT_PAGARE,penRow];
      End;

     With StrGrdAlgnPagare2 Do
      Begin
      DataRegistro^.IMP_CAPITAL     := StrToFloat(TrimChar(Cells[CO_IMP_CAPITAL,   penRow],CO_CAR_DELETE));
      DataRegistro^.IMP_INTERES     := StrToFloat(TrimChar(Cells[CO_IMP_INTERES,   penRow],CO_CAR_DELETE));
      DataRegistro^.TASA_NETA_ORIG  := StrToFloat(TrimChar(Cells[CO_TASA_NETA_ORIG,penRow],CO_CAR_DELETE));
      DataRegistro^.IMP_NETO_VTO    := StrToFloat(TrimChar(Cells[CO_IMP_NETO_VTO,  penRow],CO_CAR_DELETE));
      DataRegistro^.F_VENCIMIENTO   := StrToDate (Cells[CO_F_VENCIMIENTO,  penRow]);
      DataRegistro^.ID_CONTRATO     := StrToInt  (Cells[CO_ID_CONTRATO,  penRow]);
      DataRegistro^.ID_EMPRESA      := StrToInt  (Cells[CO_ID_EMPRESA,penRow]);
      DataRegistro^.ID_SUCURSAL     := StrToInt  (Cells[CO_ID_SUCURSAL,penRow]);
      End;

     With StrGrdAlgnPagare3 Do
      Begin

      If (Cells[CO_TASA_BRUTA,penRow] <> '') Then DataRegistro^.TASA_BRUTA := StrToFloat(TrimChar(Cells[CO_TASA_BRUTA,penRow],CO_CAR_DELETE))
      Else DataRegistro^.TASA_BRUTA   := 0;
      If (Cells[CO_TASA_NETA,penRow] <> '') Then DataRegistro^.TASA_NETA := StrToFloat(TrimChar(Cells[CO_TASA_NETA,penRow],CO_CAR_DELETE))
      Else DataRegistro^.TASA_NETA   := 0;
      If (Cells[CO_DIAS_PLAZO,penRow] <> '') Then DataRegistro^.DIAS_PLAZO := StrToInt(TrimChar(Cells[CO_DIAS_PLAZO,penRow],CO_CAR_DELETE))
      Else DataRegistro^.DIAS_PLAZO  := 0;
      If (Cells[CO_IMP_RENOVAR,penRow] <> '') Then DataRegistro^.IMP_RENOVAR := StrToFLoat(TrimChar(Cells[CO_IMP_RENOVAR,penRow],CO_CAR_DELETE))
      Else DataRegistro^.IMP_RENOVAR := 0;
      If (Cells[CO_PCT_ISR,penRow] <> '') Then DataRegistro^.PCT_ISR := StrToFLoat(TrimChar(Cells[CO_PCT_ISR,penRow],CO_CAR_DELETE))
      Else DataRegistro^.PCT_ISR := 0;
      DataRegistro^.CVE_IMP_RENOV      := Cells[CO_CVE_IMP_RENOV,      penRow];
      DataRegistro^.DESC_CVE_IMP_RENOV := Cells[CO_DESC_CVE_IMP_RENOV, penRow];
      DataRegistro^.CHK_RENOVAR        := Cells[CO_CHK_RENOVAR,        penRow];
      If (Cells[CO_F_NVA_VTO,penRow] <> '') Then DataRegistro^.F_NVA_VTO := StrToDate(Cells[CO_F_NVA_VTO,penRow])
      Else DataRegistro^.F_NVA_VTO := 0
      End;
  End;
end;

procedure TWCrRnvPag.ActualizaValores(penRow : Integer;
                                      peTASA_BRUTA   : Double;
                                      peTASA_NETA    : Double;
                                      peDIAS_PLAZO   : Integer;
                                      peCVE_IMP_RENOV : String;
                                      pePCT_ISR : Double;
                                      peDESC_CVE_IMP_RENOV : String;
                                      peIMP_RENOVAR : Double;
                                      peF_NVA_VTO : TDateTime;
                                      peCHK_RENOVAR : String
                                      );
begin
 With StrGrdAlgnPagare3 Do
  Begin
  Cells[CO_TASA_BRUTA,           penRow] := Format(COFORMAT_TASA,[peTASA_BRUTA]);  
  Cells[CO_TASA_NETA,            penRow] := Format(COFORMAT_TASA,[peTASA_NETA]);
  Cells[CO_DIAS_PLAZO,           penRow] := IntToStr(peDIAS_PLAZO);
  Cells[CO_CVE_IMP_RENOV,        penRow] := peCVE_IMP_RENOV;
  Cells[CO_DESC_CVE_IMP_RENOV,   penRow] := peDESC_CVE_IMP_RENOV;
  Cells[CO_IMP_RENOVAR,          penRow] := Format(CFORMAT_DINERO,[peIMP_RENOVAR]);
  Cells[CO_PCT_ISR,              penRow] := Format(COFORMAT_TASA,[pePCT_ISR]);

  If (peF_NVA_VTO = 0) Then Cells[CO_F_NVA_VTO,  penRow] := ''
  Else Cells[CO_F_NVA_VTO,  penRow] := FormatDateTime(CFORMAT_FECHA, peF_NVA_VTO);
  Cells[CO_CHK_RENOVAR,          penRow] := peCHK_RENOVAR;
  End;
end;

function TWCrRnvPag.Obten_DESC_CVE_IMP_RENOV(peCVE_IMP_RENOV : String) : String;
begin
  Result := '';
  If (peCVE_IMP_RENOV = CO_TOTAL_AL_VENCER)    Then Result := 'Total al vencer "'+CO_TOTAL_AL_VENCER+'"'
  Else If (peCVE_IMP_RENOV = CO_SOLO_CAPITAL ) Then Result := 'Solo Capital    "'+CO_SOLO_CAPITAL+'"'
  Else If (peCVE_IMP_RENOV = CO_IMPORTE )      Then Result := 'Importe         "'+CO_IMPORTE+'"'
  Else If (peCVE_IMP_RENOV = CO_NO_RENOVAR )   Then Result := 'No Renovar      "'+CO_NO_RENOVAR+'"';
end;

function TWCrRnvPag.AplicaCambiodeBandera(penRow : Integer; peCHK_RENOVAR : String) : Boolean;
var
    vlIMP_RENOVAR, vlTASA_ASIG, vlTASA_COSTO, vlTASA_NETA : Double;
    vlF_NVA_VTO    : TDateTime;
    DataRegistro : PDataRegistro;
begin
  Result := False;
  // Obtiene los valores de las celdas
  New(DataRegistro);
  ObtenValoresdelRegistro(penRow, DataRegistro);
  // Valida que el registro se pueda renovar
  If (DataRegistro^.CHK_RENOVAR <> CO_NOTCHECK) Then
    Begin
     // Si se dese renovar renovar, entonces la clave de renovación es por Inporte "IM"
     // de lo contrario, no se renueva
     If (peCHK_RENOVAR = CVERDAD) Then DataRegistro^.CVE_IMP_RENOV := CO_TOTAL_AL_VENCER
     Else DataRegistro^.CVE_IMP_RENOV := CO_NO_RENOVAR;
     // Conforme a la lógica de negocio obtiene los nuevos valores
     LogicaNegocioPagares(DataRegistro^.IMP_CAPITAL,
                          DataRegistro^.IMP_NETO_VTO,
                          DataRegistro^.IMP_RENOVAR,
                          DataRegistro^.CVE_IMP_RENOV,
                          DataRegistro^.DIAS_PLAZO,
                          vlIMP_RENOVAR,
                          vlF_NVA_VTO,
                          Objeto.Apli);

     If ObtenTasasInteres( DataRegistro^.ID_CONTRATO,
                           vlIMP_RENOVAR,
                           DataRegistro^.DIAS_PLAZO,
                           DataRegistro^.PCT_ISR, //MARA4356 PARA TASAS BRUTAS
                           DataRegistro^.F_VENCIMIENTO, //MARA4356 PARA TASAS BRUTAS
                           vlTASA_ASIG,
                           vlTASA_COSTO,
                           Objeto.Apli
                         ) Then begin
       //DataRegistro^.TASA_NETA := vlTASA_ASIG;
       //MARA4356 EL PROCEDIMIENTO OBTENTASAS INTERES DEVUELVE TASAS BRUTAS, POR LO CUAL SE 
       //AGREGA EL SIGUIENTE PROCEDIMIENTO PARA OBTENER LA TASA NETA
       BuscaTasaNeta(Objeto.Apli, DataRegistro^.PCT_ISR, vlTASA_ASIG, DataRegistro^.F_VENCIMIENTO, vlTASA_NETA);
       DataRegistro^.TASA_NETA := vlTASA_NETA;
       DataRegistro^.TASA_BRUTA := vlTASA_ASIG; //
       end;

     // Si se actualiza la Configuración del Pagaré correctamente, entonces
     If ActualizaConfPagare(DataRegistro^.ID_REL_PAG_DISP, DataRegistro^.TASA_NETA,
                            DataRegistro^.DIAS_PLAZO, DataRegistro^.PCT_ISR, DataRegistro^.CVE_IMP_RENOV, vlIMP_RENOVAR,
                            peCHK_RENOVAR) Then
        Begin
        // Actualiza los valores de las celdas
        ActualizaValores(penRow,
                         DataRegistro^.TASA_BRUTA,        
                         DataRegistro^.TASA_NETA,
                         DataRegistro^.DIAS_PLAZO,
                         DataRegistro^.CVE_IMP_RENOV,
                         DataRegistro^.PCT_ISR,
                         Obten_DESC_CVE_IMP_RENOV(DataRegistro^.CVE_IMP_RENOV),
                         vlIMP_RENOVAR,
                         vlF_NVA_VTO,
                         peCHK_RENOVAR
                         );
        Application.ProcessMessages;
        End; // If ActualizaConfPagare(
    End; // If (DataRegistro^.CHK_RENOVAR <> CO_NOTCHECK) Then
end;

procedure TWCrRnvPag.CambiaRenovacionGlobal(peCHK_RENOVAR : Boolean);
var vlnRow : Integer;
    vlstr : String;
begin
 If (peCHK_RENOVAR) Then vlstr := CO_CHECKED
 Else vlstr := CO_UNCHECKED;

 For vlnRow := 0 To StrGrdAlgnPagare3.RowCount - 1 Do
  // Si su nueva situación es diferente de la actual entonces...
  If (StrGrdAlgnPagare3.Cells[CO_CHK_RENOVAR, vlnRow] <> vlstr) Then
    AplicaCambiodeBandera(vlnRow, vlstr);
end;

procedure TWCrRnvPag.sbtnTrueClick(Sender: TObject);
begin
 CambiaRenovacionGlobal(True);
end;

procedure TWCrRnvPag.sbtnFalseClick(Sender: TObject);
begin
 CambiaRenovacionGlobal(False);
end;

procedure TWCrRnvPag.btnAplicaRenovacionesClick(Sender: TObject);

    function CuentaPagares_a_Renovar : Integer;
    var vlnRow, vlnCount : Integer;
    begin
      vlnCount := 0; // Contador de Pagares a Renovar
      For vlnRow := 0 To StrGrdAlgnPagare3.RowCount - 1 Do
        // Si se va a renovar o no el pagaré, incrementa el contador
        If (StrGrdAlgnPagare3.Cells[CO_CHK_RENOVAR,vlnRow] <> CO_NOTCHECK) Then
          Inc(vlnCount);
      Result := vlnCount;
    end;

    function ValidaFechasVencimiento : Integer;
    var vlnRow, vlnCount : Integer;
        stpFechaEmpresa : TStoredProc;
    begin
      // Crea el Store Procedure que válidará que la Fecha sea un día hábil
      Result := -1; vlnCount := 0;
      stpFechaEmpresa := TStoredProc.Create(Nil);
      If Assigned(stpFechaEmpresa) Then
       With stpFechaEmpresa Do
        Try
         DatabaseName := Objeto.Apli.DatabaseName;
         SessionName  := Objeto.Apli.SessionName;
         StoredProcName := 'PKGFECHAS.SPE_FECHAMET1';

         Params.Clear;
         Params.CreateParam(ftInteger ,'p_IdEmpresa',ptInputOutput);
         Params.CreateParam(ftDateTime,'p_Fecha'    ,ptInputOutput);
         Params.CreateParam(ftInteger ,'ps_Resp'    ,ptInputOutput);
         // Asigna Identificador común
         ParamByName('p_IdEmpresa').AsInteger   := Objeto.Apli.IdEmpresa;
         For vlnRow := 0 To StrGrdAlgnPagare3.RowCount - 1 Do
           Begin
           // Si se va a renovar, el pagaré
           If (StrGrdAlgnPagare3.Cells[CO_CHK_RENOVAR,vlnRow] = CO_CHECKED) Then
              Begin
              // Asigna la Fecha de Vencimiento a Validar
              ParamByName('p_Fecha').AsDateTime :=
                             StrToDate(StrGrdAlgnPagare3.Cells[CO_F_NVA_VTO, vlnRow]);
              ExecProc;
              // Si es festivo entonces...
              If (ParamByName('ps_Resp').AsInteger <> 0) Then
               Inc(vlnCount); // Incrementa el Contador
              End;
           End; // For
           Result := vlnCount;
        Finally
           stpFechaEmpresa.Params.Clear;
           stpFechaEmpresa.Free;
        End;
    end;

    function CorrigeFechas : Boolean;
    var vlnRow : Integer;
        vlDias_Plazo : Integer;
        stpBuscaDiaHabil : TStoredProc;
        DataRegistro : PDataRegistro;
    begin
      Result := False;
      stpBuscaDiaHabil := TStoredProc.Create(Nil);
      If Assigned(stpBuscaDiaHabil) Then
        With stpBuscaDiaHabil Do
         Try
           DatabaseName := Objeto.Apli.DatabaseName;
           SessionName  := Objeto.Apli.SessionName;
           StoredProcName := 'PKGCRCREDITOO1.STP_BUSCA_DIA_HABIL';
           // Crea los parametros a utilizar
           Params.Clear;
           Params.CreateParam(ftInteger,'peID_EMPRESA',ptInput);
           Params.CreateParam(ftDateTime,'peFECHA',ptInput);
           Params.CreateParam(ftDateTime,'RESULT',ptResult);
           // Inicializa Paramatros Comúnes
           ParamByName('peID_EMPRESA').AsInteger := Objeto.Apli.IdEmpresa;
           // Corrige las Fechas
           With StrGrdAlgnPagare3 Do
             For vlnRow := 0 To RowCount - 1 Do
              Begin
               // Si el registro se piensa renovar entonces...
               If (Cells[CO_CHK_RENOVAR,vlnRow] = CO_CHECKED) Then
                 Begin
                 ParamByName('peFECHA').AsDateTime := StrToDate(Cells[CO_F_NVA_VTO,vlnRow]);
                 ExecProc;
                 vlDias_Plazo := Trunc(ParamByName('RESULT').AsDateTime - Objeto.Apli.DameFechaEmpresa);
                 // Obtiene los valores de las celdas
                 New(DataRegistro);
                 ObtenValoresdelRegistro(vlnRow, DataRegistro);
                 // Actualiza Configuración del Pagaré
                 If ActualizaConfPagare(DataRegistro^.ID_REL_PAG_DISP, DataRegistro^.TASA_NETA,
                                         vlDias_Plazo, DataRegistro^.PCT_ISR, DataRegistro^.CVE_IMP_RENOV,
                                         DataRegistro^.IMP_RENOVAR, DataRegistro^.CHK_RENOVAR) Then
                   Begin
                   // Asigna el Resultado
                   Cells[CO_F_NVA_VTO,vlnRow]  := DateToStr(ParamByName('RESULT').AsDateTime);
                   Cells[CO_DIAS_PLAZO,vlnRow] := IntToStr(vlDias_Plazo);
                   End;
                 End; // If (Cells[CO_CHK_RENOVAR,vlnRow] = CO_CHECKED) Then
              End;
           Result := True;   
         Finally
           stpBuscaDiaHabil.Params.Clear;
           stpBuscaDiaHabil.Free;
         End;
    end;

var vlnPagFaltantesxRenovar, vlnPagxRenovar, vlnFechasInvalidas, vlnRow : Integer;
    vlstrID_PAGARE, vlstrID_CONTRATO, vlstrMessage : String;
    mrResult : Word;
begin
   if Objeto.ValidaAccesoEsp('TCRRNVPAG_APLICA',True,True) then
   begin
    // vlnPagFaltantesxRenovar := ObtPagPorRenovar;
     vlnPagFaltantesxRenovar := 100; // Quitar en Liberación
     vlnPagxRenovar := CuentaPagares_a_Renovar;
     mrResult := mrNo; vlstrMessage := '';
     vlnRow := StrGrdAlgnPagare1.Row;
     // Valida la Fechas de Vencimiento
     vlnFechasInvalidas := ValidaFechasVencimiento;
     If (vlnFechasInvalidas = -1) Then
       Begin
       MessageDlg('Hubo problemas al validar las Fechas de Vencimiento. Avise a Sistemas.',
                  mtError, [mbOk], 0);
       Exit;
       End
     Else If (vlnFechasInvalidas > 0) Then
           Begin
             If (MessageDlg('Se han encontrado ' + IntToStr(vlnFechasInvalidas) + ' fecha(s) de vencimiento inválida(s).'+coCRLF+
                             '¿Desea que se ajusten automáticamenté esta(s) fecha(s) al primer día siguiente hábil?',
                             mtConfirmation, [mbYes, mbNo] ,0) = mrYes) Then
                If Not CorrigeFechas Then
                  MessageDlg('Problemas al corregir las fechas de vencimiento. Avisar a Sistemas', mtError, [mbOk], 0);
                // End If Not CorrigeFechas Then
             // End If (MessageDlg(
             MessageDlg('Favor de Validar la Fechas de Vencimiento antes de continuar.', mtWarning, [mbOk], 0);
             Exit;
           End;

     // Verifca la opción seleccionada
     Case rgOpcion.ItemIndex Of
       0 :  // A Todos
            Begin
               If (vlnPagxRenovar <= 0) Then
                MessageDlg('Debe de indicar al menos un pagaré, para poder vencer/renovar.', mtWarning,[mbOk],0)
               Else If (vlnPagFaltantesxRenovar > 0) Then
                mrResult := MessageDlg('Se renovarán  '+IntToStr(vlnPagFaltantesxRenovar)+' de los '+IntToStr(vlnPagxRenovar)+
                                       ' pagarés faltantes por Renovar. ¿Desea continuar?',
                                       mtConfirmation,[mbYes, mbNo],0)
               Else
                mrResult := MessageDlg('Se vencerán/renovarán  '+IntToStr(vlnPagxRenovar)+' pagarés. ¿Desea continuar?',
                                       mtConfirmation,[mbYes, mbNo],0);
               // Se asigna el Mensaje para terminó de operación
               vlstrMessage := 'Se vencierón/renovarón todos los pagarés seleccionados.'
            End;
      1 : // Al Pagaré "X"
            Begin
              If (StrGrdAlgnPagare3.Cells[CO_CHK_RENOVAR,vlnRow] = CO_NOTCHECK) Then
                MessageDlg('Debe de seleccionar un pagaré que se encuentre "Activo" '+
                           'ó "Vencido", para poder vencer/renovar.', mtWarning,[mbOk],0)
              Else
                Begin
                vlstrID_PAGARE   := StrGrdAlgnPagare1.Cells[CO_ID_PAGARE, vlnRow];
                vlstrID_CONTRATO := StrGrdAlgnPagare2.Cells[CO_ID_CONTRATO, vlnRow];
                mrResult := MessageDlg('¿Desea vencer/renovar el pagaré '+vlstrID_PAGARE+' con contrato '+vlstrID_CONTRATO+'?',
                                       mtConfirmation,[mbYes, mbNo],0);
                End;
              // Se asigna el Mensaje para terminó de operación
              vlstrMessage := 'Se venció/renovó el pagaré seleccionado.'
            End;
       Else
         Exit;
     End;

     If (mrResult = mrYes) Then
      // Valida el Usuario
      If (ValidaPassword(Objeto.Apli.Usuario, Objeto.Apli) = mrYes) Then
       Begin
         If AplicaRenovaciones Then
           MessageDlg(vlstrMessage, mtInformation, [mbOk], 0)
         Else
           MessageDlg('Hubo problemas al vencer/renovar, favor de validar.', mtWarning,[mbOk], 0);
       End
      Else
       MessageDlg('Debe de indicar su usuario y password, para poder iniciar el proceso.', mtWarning, [mbOk], 0)
      // If (ValidaPassword(Objeto.Apli.Usuario, Objeto.Apli) = mrYes) Then
   end;   
end;

function TWCrRnvPag.AplicaRenovaciones: Boolean;

     function RenuevaRelacionPagDisp( peID_REL_PAG_DISP, peNVO_ID_CONTRATO, peNVO_ID_PAGARE : Integer;
                                      var psNVO_ID_REL_PAG_DISP : Integer;
                                      var peDESCPROC      : String
                                     ) : Boolean;
     var StpRnvRelPagDisp : TStoredProc;
     begin
        Result := False; psNVO_ID_REL_PAG_DISP := -1; peDESCPROC := '';
        StpRnvRelPagDisp := TStoredProc.Create(Nil);
        If Assigned(StpRnvRelPagDisp) Then
          With StpRnvRelPagDisp Do
           Try
             DatabaseName := Objeto.Apli.DatabaseName;
             SessionName  := Objeto.Apli.SessionName;
             StoredProcName := 'PKGCRCREDITOO1.STP_RNV_REL_PAG_DISP';
             // Crea parametros
             Params.Clear;
             Params.CreateParam(ftInteger ,'peID_REL_PAG_DISP'    ,ptInput);
             Params.CreateParam(ftInteger ,'peNVO_ID_CONTRATO'    ,ptInput);
             Params.CreateParam(ftInteger ,'peNVO_ID_PAGARE'      ,ptInput);
             Params.CreateParam(ftString  ,'peCVE_USU_ALTA'       ,ptInput);
             Params.CreateParam(ftDateTime,'peF_ALTA'             ,ptInput);
             Params.CreateParam(ftString  ,'peB_COMMIT'           ,ptInput);
             Params.CreateParam(ftInteger ,'psNVO_ID_REL_PAG_DISP',ptOutput);
             Params.CreateParam(ftInteger ,'psRESULTADO'          ,ptOutput);
             Params.CreateParam(ftString  ,'psTX_RESULTADO'       ,ptOutput);
             // Asigna Variables
             ParamByName('peID_REL_PAG_DISP').AsInteger := peID_REL_PAG_DISP;
             ParamByName('peNVO_ID_CONTRATO').AsInteger := peNVO_ID_CONTRATO;
             ParamByName('peNVO_ID_PAGARE').AsInteger   := peNVO_ID_PAGARE;
             ParamByName('peCVE_USU_ALTA').AsString     := Objeto.DameUsuario;
             ParamByName('peF_ALTA').AsDateTime         := Objeto.Apli.DameFechaEmpresa;
             ParamByName('peB_COMMIT').AsString         := CVERDAD;
             ExecProc;

             If (ParamByName('psRESULTADO').AsInteger <> 0) Then
               peDESCPROC := ParamByName('psRESULTADO').AsString
             Else
               Begin
               psNVO_ID_REL_PAG_DISP := ParamByName('psNVO_ID_REL_PAG_DISP').AsInteger;
               Result := True;
               End;
           Finally
             StpRnvRelPagDisp.Params.Clear;
             StpRnvRelPagDisp.Free;
           End;
     end; // RenuevaRelacionPagDisp


     function Calcula_Importes(
                                peIMP_CAPITAL       : Double;
                                peTASA_NETA         : Double;
                                //peTASA_BRUTA        : Double;//MARA4356 PARA TASAS BRUTAS
                                pePCT_ISR           : Double;
                                peDIAS_PLAZO        : Integer;
                                peFVenc             : TDateTime;//MARA4356 PARA ISR EN 366 DIAS
                                var peTASA_BRUTA    : Double;
                                var peIMP_ISR       : Double;
                                var peIMP_INT_BRUTO : Double;
                                var peIMP_INT_NETO  : Double;
                                var peIMP_NETO_VTO  : Double;
                                var peDESCPROC      : String
                                ) : Boolean;
     Var stpCalculaImportes : TStoredProc;
     Begin
         Result := False; peDESCPROC := '';
         peTASA_BRUTA    := -1; peIMP_ISR       := -1; peIMP_INT_BRUTO := -1;
         peIMP_INT_NETO  := -1; peIMP_NETO_VTO  := -1;
         stpCalculaImportes := TStoredProc.Create(Nil);
         //MARA4356 PARA OBTENER LA TASA BRUTA A PARTIR DE LA TASA NETA
         BuscaTasaBruta(Objeto.Apli, pePCT_ISR, peTASA_NETA, peFVenc, peTASA_BRUTA);
         If Assigned(stpCalculaImportes) Then
           With stpCalculaImportes Do
            Try
              DatabaseName := Objeto.Apli.DataBaseName;
              SessionName  := Objeto.Apli.SessionName;
              StoredProcName := 'PKGINVERS.STPCALCULAIMPORTES';
              Params.Clear;
              Params.CreateParam(ftFloat, 'VCapital',    ptInput);
              Params.CreateParam(ftFloat, 'VTasaNeta',   ptInput);
              Params.CreateParam(ftFloat, 'VTasaBruta',  ptInput);//MARA4356 TASA BRUTAS Y NETAS
              Params.CreateParam(ftFloat, 'VPctIsr',     ptInput);
              Params.CreateParam(ftFloat, 'VPlazo',      ptInput);
              Params.CreateParam(ftDate,  'VFVenc',      ptInput);   //MARA4356 PARA ISR EN 366 DIAS
              Params.CreateParam(ftFloat, 'VImpISR',     ptOutput);              
              Params.CreateParam(ftFloat, 'VImpIntbruto',ptOutput);
              Params.CreateParam(ftFloat, 'VImpIntNeto', ptOutput);
              Params.CreateParam(ftFloat, 'VImpTotNeto', ptOutput);
              Params.CreateParam(ftString,'desc_proceso',ptOutput);
              Params.CreateParam(ftFloat, 'pCodResp',    ptOutput);

              Params.ParamByName('VCapital').AsFloat := peIMP_CAPITAL;
              Params.ParamByName('VTasaNeta').AsFloat:= peTASA_NETA;
              Params.ParamByName('VPctIsr').AsFloat  := pePCT_ISR;
              Params.ParamByName('VPlazo').AsFloat   := peDIAS_PLAZO;
              Params.ParamByName('VFVenc').AsDateTime:= peFVenc;//MARA4356 PARA ISR EN 366 DIAS
              Params.ParamByName('VTasaBruta').AsFloat:= peTASA_BRUTA;//MARA4356 TASA BRUTAS Y NETAS
              ExecProc;

              If (ParamByName('PCodResp').AsInteger <> 0) Then
               Begin
               peDESCPROC := ParamByName('desc_proceso').AsString;
               memMessages.Lines.Add(peDESCPROC);
               MessageDlg(peDESCPROC, mtError, [mbOK], 0);
               End
              Else
               Begin
                // Asigna valores de Salida
                peTASA_BRUTA    := ParamByName('VTasaBruta').AsFloat;
                peIMP_ISR       := ParamByName('VImpISR').AsFloat;
                peIMP_INT_BRUTO := ParamByName('VImpIntbruto').AsFloat;
                peIMP_INT_NETO  := ParamByName('VImpIntNeto').AsFloat;
                peIMP_NETO_VTO  := ParamByName('VImpTotNeto').AsFloat;
                Result := True;
               End;
             Finally
               stpCalculaImportes.Params.Clear;
               stpCalculaImportes.Free;
             End;
     end; // Calcula_Importes(



     function AutorizaPagare(peID_EMPRESA, peID_SUCURSAL,
                             peID_CONTRATO, peID_PAGARE : Integer;
                             var peDESCPROC      : String) : Boolean;
     var StpAuInv : TStoredProc;
         vlCVE_SIT_PAGARE : String;
     begin
       Result := False; peDESCPROC := '';
       StpAuInv := TStoredProc.Create(Nil);
       If Assigned(StpAuInv) Then
         With StpAuInv Do
          Try
            DatabaseName := Objeto.Apli.DataBaseName;
            SessionName  := Objeto.Apli.SessionName;
            StoredProcName := 'PKGINVERS.STPAUINV';

            // Limpia y Crea Variables
            Params.Clear;
            Params.CreateParam(ftDateTime,'V_FAPERTURA',ptInput);
            Params.CreateParam(ftInteger,'VID_EMPRESA',ptInput);            
            Params.CreateParam(ftInteger,'VID_SUCURSAL',ptInput);
            Params.CreateParam(ftInteger,'RESP',ptOutput);

            // Asigna Variables
            ParamByName('V_FAPERTURA').AsDateTime := Objeto.Apli.DameFechaEmpresa;
            ParamByName('VID_EMPRESA').AsInteger := peID_EMPRESA;            
            ParamByName('VID_SUCURSAL').AsInteger := peID_SUCURSAL;
            ExecProc;

            // El parametro RESP, regresa el número de pagarés autorizados
            If (StpAuInv.ParamByName('RESP').AsInteger <= 0) Then
             peDESCPROC := 'Problemas al autorizar el pagaré.'
            Else
             Begin
               GetSQLStr(' SELECT CVE_SIT_PAGARE FROM INV_PAGARE '+coCRLF+
                         ' WHERE ID_EMPRESA = '+IntToStr(peID_EMPRESA)+coCRLF+
                         '   AND ID_SUCURSAL = '+IntToStr(peID_SUCURSAL)+coCRLF+
                         '   AND ID_CONTRATO = '+IntToStr(peID_CONTRATO)+coCRLF+
                         '   AND ID_PAGARE = '+IntToStr(peID_PAGARE)+coCRLF,
                         Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'CVE_SIT_PAGARE', vlCVE_SIT_PAGARE, False);
               // Si no se encuentra Activo el pagaré, entonces...
               If (vlCVE_SIT_PAGARE <> CSIT_AC) Then
                peDESCPROC := 'El pagaré no se pudo autorizar.'
               Else
                Result := True;
             End;
          Finally
             StpAuInv.Params.Clear;
             StpAuInv.Free;
          End;
     End; // AutorizaPagare(


     // <SATV4766 16Feb2009>
     function CalculaTasaBruta_y_Neta(peID_CONTRATO : Integer; peIMP_CAPITAL : Double; pePLAZO : Integer;
                                      var psTASA_ASIG : Double; var psTASA_COSTO : Double;
                                      var psRESP : Integer; var psDESC_TASA : String) : Boolean;
     var StpCaTas : TStoredProc;
     begin
       Result := False;
       psTASA_ASIG := 0; psTASA_COSTO := 0;
       psRESP := 0; psDESC_TASA := '';

       StpCaTas := TStoredProc.Create(Nil);
       If Assigned(StpCaTas) Then
         With StpCaTas Do
          Try
            DatabaseName := Objeto.Apli.DataBaseName;
            SessionName  := Objeto.Apli.SessionName;
            StoredProcName := 'PKGINVERS.STPCATAS';

            // Limpia y Crea Variables
            Params.Clear;
            Params.CreateParam(ftInteger ,'V_CONTRATO'    ,ptInput);
            Params.CreateParam(ftFloat   ,'V_IMP_CAPITAL' ,ptInput);
            Params.CreateParam(ftInteger ,'V_PLAZO'       ,ptInput);
            Params.CreateParam(ftFloat   ,'V_TASA_ASIG'   ,ptOutput);
            Params.CreateParam(ftFloat   ,'V_TASA_COSTO'  ,ptOutput);
            Params.CreateParam(ftInteger ,'RESP'          ,ptOutput);
            Params.CreateParam(ftString  ,'V_DESC_TASA'   ,ptOutput);

            // Asigna Variables
            ParamByName('V_CONTRATO').AsInteger := peID_CONTRATO;
            ParamByName('V_IMP_CAPITAL').AsFloat := peIMP_CAPITAL;
            ParamByName('V_PLAZO').AsInteger := pePLAZO;
            ExecProc;

            // El parametro RESP, regresa el número de pagarés autorizados
            If (ParamByName('RESP').AsInteger <= 0) Then
              Begin
              psRESP       := ParamByName('RESP').AsInteger;
              psDESC_TASA  := 'Error:'+ParamByName('V_DESC_TASA').AsString;
              End
            Else
             Begin
             psTASA_ASIG  := ParamByName('V_TASA_ASIG').AsFloat;
             psTASA_COSTO := ParamByName('V_TASA_COSTO').AsFloat;
             psRESP       := ParamByName('RESP').AsInteger;
             psDESC_TASA  := ParamByName('V_DESC_TASA').AsString;
             End;
             
          Finally
             StpCaTas.Params.Clear;
             StpCaTas.Free;
          End;
     End; // CalculaTasaBruta_y_Neta(
     // </SATV4766 16Feb2009>


     function ObtenSdoDisponible(peID_CONTRATO : Integer; var psID_CTIO_LIQ : Integer) : Real;
     var vlSDO_DISP : Real;
     begin
       // Obtiene el contrato de liquidación
       GetSQLInt(' SELECT ID_CTO_LIQ FROM CONTRATO WHERE ID_CONTRATO = '+IntToStr(peID_CONTRATO)+')',
                  Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'ID_CTO_LIQ', psID_CTIO_LIQ, False );
       // Obtiene el saldo disponible del contrato de liquidación
       GetSQLFloat('SELECT (NVL(SDO_EFE_VIRT,0) - NVL(SDO_BLOQ_VIRT,0) - NVL(SDO_COMP_VIRT,0)) AS SDO_DISP FROM DV_CONTRATO '+coCRLF+
                   'WHERE ID_CONTRATO = (SELECT ID_CTO_LIQ FROM CONTRATO WHERE ID_CONTRATO = '+IntToStr(peID_CONTRATO)+')',
                   Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'SDO_DISP', vlSDO_DISP, False );
       Result := vlSDO_DISP;
     end;

     function MantenimientoPagare( peIMP_RENOVAR : Double;
                                   peTASA_NETA : Double;
                                   //peTASA_BRUTA : Double;//MARA4356 TASAS BRUTAS
                                   pePCT_ISR : Double;
                                   peF_NVA_VTO : TDateTime;
                                   peCVE_IMP_RENOV : String;
                                   peID_CONTRATO : Integer;
                                   var peDESCPROC : String;
                                   var psID_PAGARE : Integer
                                   ) : Boolean;
     var StpManttoPagare : TStoredProc;
         vlTASA_BRUTA,
         vlIMP_ISR_VTO,
         vlIMP_INT_BRUTO,
         vlIMP_INT_VTO,
         vlIMP_NETO_VTO : Double;
         vlSDO_DISP  : Real;
         vlDIAS_PLAZO,
         vlID_CTIO_LIQ : Integer;
         vlTasaInflacion : Double;
     begin
       Result := False; peDESCPROC := ''; psID_PAGARE := -1;
       // Valida que tenga saldo disponible, antes de crear el pagaré
       vlSDO_DISP := ObtenSdoDisponible(peID_CONTRATO, vlID_CTIO_LIQ);
       If (vlSDO_DISP <= 0) Then
         Begin
         peDESCPROC := 'La chequera del contrato '+IntToStr(peID_CONTRATO)+' no tiene saldo disponible, para realizar el pagaré.'+coCRLF+
                       'Saldo Disp. de la chequera '+IntToStr(vlID_CTIO_LIQ)+' = '+Format(CFORMAT_DINERO,[vlSDO_DISP]);
         Exit;
         End;

       // Si calcula correctamente los importes, entonces...
       vlDIAS_PLAZO := Trunc(peF_NVA_VTO) - Trunc(Objeto.Apli.DameFechaEmpresa);
       If Calcula_Importes(
                           peIMP_RENOVAR,
                           peTASA_NETA,
                           pePCT_ISR,
                           vlDIAS_PLAZO,
                           peF_NVA_VTO, //MARA4356 PARA ISR EN 366 DIAS
                           vlTASA_BRUTA,
                           vlIMP_ISR_VTO,
                           vlIMP_INT_BRUTO,
                           vlIMP_INT_VTO,
                           vlIMP_NETO_VTO,
                           peDESCPROC
                         ) Then
          Begin
             //Recupera Tasa Inflación para el cálculo de la GAT

             vlTasaInflacion := TasaInflacion;

             StpManttoPagare := TStoredProc.Create(Nil);
             If Assigned(StpManttoPagare) Then
               With StpManttoPagare Do
                Try
                  DatabaseName := Objeto.Apli.DatabaseName;
                  SessionName  := Objeto.Apli.SessionName;
                  StoredProcName := 'PKGINVERS.STPMANTOPAGARE';
                  Params.Clear;
                  Params.CreateParam(ftString  ,'VTIPOOPER'     ,ptInput);
                  Params.CreateParam(ftInteger ,'VCONTRATO'     ,ptInput);
                  Params.CreateParam(ftString  ,'VBRENOVACION'  ,ptInput);
                  Params.CreateParam(ftString  ,'VCVE_IMP_RENOV',ptInput);
                  Params.CreateParam(ftInteger ,'VDIAS_PLAZO'   ,ptInput);
                  Params.CreateParam(ftInteger ,'VDIAS_PLAZOREN',ptInput);
                  Params.CreateParam(ftDateTime,'VF_ALTA'       ,ptInput);
                  Params.CreateParam(ftDateTime,'VF_APERTURA'   ,ptInput);
                  Params.CreateParam(ftDateTime,'VF_VENCIMIENTO',ptInput);
                  Params.CreateParam(ftFloat   ,'VIMP_CAPITAL'  ,ptInput);
                  Params.CreateParam(ftFloat   ,'VIMP_INT_VTO'  ,ptInput);
                  Params.CreateParam(ftFloat   ,'VIMP_ISR_VTO'  ,ptInput);
                  Params.CreateParam(ftFloat   ,'VIMP_NETO_VTO' ,ptInput);
                  Params.CreateParam(ftFloat   ,'VIMP_RENOVAR'  ,ptInput);
                  Params.CreateParam(ftFloat   ,'VPCT_ISR'      ,ptInput);
                  Params.CreateParam(ftFloat   ,'VTASA_BRUTA'   ,ptInput);
                  Params.CreateParam(ftFloat   ,'VTASA_NETA'    ,ptInput);
                  Params.CreateParam(ftString  ,'VTX_COM_PAG'   ,ptInput);
                  Params.CreateParam(ftFloat   ,'VTASA_COSTO'   ,ptInput);
                  Params.CreateParam(ftString  ,'VCVE_USUARIO'  ,ptInput);
                  Params.CreateParam(ftString  ,'VTX_INST_CAJ'  ,ptInput);
                  Params.CreateParam(ftString  ,'VTasa_Inflac'  ,ptInput);
                  Params.CreateParam(ftInteger ,'VID_PAGARE'    ,ptInputOutput);
                  Params.CreateParam(ftString  ,'VPENDIENTE'    ,ptInput);
                  Params.CreateParam(ftString  ,'DESC_PROCESO'  ,ptOutput);
                  Params.CreateParam(ftInteger ,'PCODRESP'      ,ptOutput);

                  ParamByName('VTIPOOPER').AsString        := CO_ALTA_PAGARE;
                  ParamByName('VCONTRATO').AsInteger       := peID_CONTRATO;
                  ParamByName('VBRENOVACION').AsString     := CFALSO;
                  ParamByName('VCVE_IMP_RENOV').AsString   := peCVE_IMP_RENOV;
                  ParamByName('VDIAS_PLAZO').AsInteger     := vlDIAS_PLAZO;
                  ParamByName('VDIAS_PLAZOREN').AsInteger  := vlDIAS_PLAZO;
                  ParamByName('VF_ALTA').AsDateTime        := Objeto.Apli.DameFechaEmpresa;
                  ParamByName('VF_APERTURA').AsDateTime    := Objeto.Apli.DameFechaEmpresa;
                  ParamByName('VF_VENCIMIENTO').AsDateTime := peF_NVA_VTO;
                  ParamByName('VIMP_CAPITAL').AsFloat      := peIMP_RENOVAR;
                  ParamByName('VIMP_INT_VTO').AsFloat      := vlIMP_INT_BRUTO;
                  ParamByName('VIMP_ISR_VTO').AsFloat      := vlIMP_ISR_VTO;
                  ParamByName('VIMP_NETO_VTO').AsFloat     := peIMP_RENOVAR + vlIMP_INT_BRUTO - vlIMP_ISR_VTO;
                  If (peCVE_IMP_RENOV = CO_IMPORTE) Then ParamByName('VIMP_RENOVAR').AsFloat := peIMP_RENOVAR + vlIMP_INT_BRUTO - vlIMP_ISR_VTO
                  Else ParamByName('VIMP_RENOVAR').AsFloat := 0;
                  ParamByName('VPCT_ISR').AsFloat          := pePCT_ISR;
                  ParamByName('VTASA_BRUTA').AsFloat       := vlTASA_BRUTA;
                  ParamByName('VTASA_NETA').AsFloat        := peTASA_NETA;
                  ParamByName('VTX_COM_PAG').AsString      := '';
                  ParamByName('VTASA_COSTO').AsFloat       := 0;
                  ParamByName('VCVE_USUARIO').AsString     := Objeto.DameUsuario;
                  ParamByName('VTX_INST_CAJ').AsString     := '';
                  ParamByName('VTasa_Inflac').AsFloat      := vlTasaInflacion;
                  ParamByName('VPendiente').AsString       := CFALSO; // La situación del pagaré se encontrará como PA si es Falso
                                                                      // de lo contrario, la situación es PU
                  ExecProc;

                  If (ParamByName('PCODRESP').AsInteger <> 0) Then
                   Begin
                   peDESCPROC := ParamByName('DESC_PROCESO').AsString;
                   memMessages.Lines.Add(peDESCPROC);
                   MessageDlg(peDESCPROC, mtError, [mbOk], 0);
                   End
                  Else
                   Begin
                   psID_PAGARE := ParamByName('VID_PAGARE').AsInteger;
                   Result := True;
                   End;
                Finally
                  StpManttoPagare.Params.Clear;
                  StpManttoPagare.Free;
                End;
           End; // If CalculaImportes(
       End; // MantenimientoPagare(



        function VencePagare(peID_CONTRATO, peID_PAGARE,
                             peID_EMPRESA,  peID_SUCURSAL  : Integer;
                             peF_VENCIMIENTO     : TDateTime;
                             var peDESCPROC      : String) : Boolean;
        var StpPreInv : TStoredProc;
        begin
             Result := False; peDESCPROC := '';
             StpPreInv := TStoredProc.Create(Nil);
             If Assigned(StpPreInv) Then
               With StpPreInv Do
                Try
                  DatabaseName := Objeto.Apli.DataBaseName;
                  SessionName  := Objeto.Apli.SessionName;
                  StoredProcName := 'PKGINVERS.STPREINV';
                  // Limpia y Crea Variables
                  Params.Clear;
                  Params.CreateParam(ftDateTime,'V_FVENCTO'    ,ptInput);
                  Params.CreateParam(ftString,  'V_TIP_RENOV'  ,ptInput);
                  Params.CreateParam(ftInteger, 'V_CONTRATO'   ,ptInput);
                  Params.CreateParam(ftInteger, 'V_PAGARE'     ,ptInput);
                  Params.CreateParam(ftString,  'V_USUARIO'    ,ptInput);
                  Params.CreateParam(ftString,  'V_INST_CAJ'   ,ptInput);
                  Params.CreateParam(ftInteger, 'V_EMPRESA'    ,ptInput);
                  Params.CreateParam(ftInteger, 'V_SUCURSAL'   ,ptInput);
                  Params.CreateParam(ftString,  'DESC_PROCESO' ,ptOutput);
                  Params.CreateParam(ftInteger, 'PCODRESP'     ,ptOutput);
                  // Asigna Datos de Variables
                  ParamByName('V_FVENCTO').AsDateTime   := peF_VENCIMIENTO; 
                  ParamByName('V_TIP_RENOV').AsString   := CO_VENCE_PAGARE;
                  ParamByName('V_CONTRATO').AsInteger   := peID_CONTRATO;
                  ParamByName('V_PAGARE').AsInteger     := peID_PAGARE;
                  ParamByName('V_USUARIO').AsString     := Objeto.DameUsuario;
                  ParamByName('V_INST_CAJ').AsString    := '';
                  ParamByName('V_EMPRESA').AsInteger    := peID_EMPRESA;
                  ParamByName('V_SUCURSAL').AsInteger   := peID_SUCURSAL;
                  ExecProc;
                  // Valida el Resultado Obtenido
                  If (ParamByName('PCODRESP').AsInteger <> 0) Then
                   peDESCPROC := ParamByName('DESC_PROCESO').AsString
                  Else
                   Result := True;
                Finally
                 StpPreInv.Params.Clear;
                 StpPreInv.Free;
                End;
           end; // VencePagare(


           function CancelaPagare(peID_EMPRESA, peID_SUCURSAL,
                                  peID_CONTRATO, peID_PAGARE : Integer;
                                  var peDESCPROC : String) : Boolean;
           var StpDepuraPA : TStoredProc;
           begin
             Result := False; // Al usar esta función, NO se debe limpiar la variable "peDESCPROC"
             StpDepuraPA := TStoredProc.Create(Nil);
             If Assigned(StpDepuraPA) Then
               With StpDepuraPA Do
                Try
                  DatabaseName := Objeto.Apli.DataBaseName;
                  SessionName  := Objeto.Apli.SessionName;
                  StoredProcName := 'PKGINVERS.STPDEPURAPA';
                  // Limpia y Crea Variables
                  Params.Clear;
                  Params.CreateParam(ftInteger,'PE_IDEMPRESA' ,ptInput);
                  Params.CreateParam(ftInteger,'PE_IDSUCURSAL',ptInput);
                  Params.CreateParam(ftInteger,'PE_IDCONTRATO',ptInput);
                  Params.CreateParam(ftInteger,'PE_IDPAGARE'  ,ptInput);
                  Params.CreateParam(ftString, 'PE_BCOMMIT'   ,ptInput);
                  Params.CreateParam(ftInteger,'PS_IDCODRESP' ,ptOutput);
                  Params.CreateParam(ftString ,'PS_DESCRESP'  ,ptOutput);
                  // Asigna Variables
                  ParamByName('PE_IDEMPRESA').AsInteger   := peID_EMPRESA;
                  ParamByName('PE_IDSUCURSAL').AsInteger  := peID_SUCURSAL;
                  ParamByName('PE_IDCONTRATO').AsInteger  := peID_CONTRATO;
                  ParamByName('PE_IDPAGARE').AsInteger    := peID_PAGARE;

                  ParamByName('PE_BCOMMIT').AsString      := CVERDAD;
                  ExecProc;
                  // Válida
                  If (ParamByName('PS_IDCODRESP').AsInteger <> 0) Then
                     peDESCPROC := peDESCPROC + coCRLF +
                                   'Problemas al Cancelar el Pagaré '+ IntToStr(peID_PAGARE) + ' con Contrato ' + IntToStr(peID_CONTRATO) + coCRLF +
                                   ParamByName('PS_DESCRESP').AsString
                  Else
                     Result := True;
                Finally
                 StpDepuraPA.Params.Clear;
                 StpDepuraPA.Free;
                End;
           end; // CancelaPagare;


           function DesbloqueaSucursal(peID_EMPRESA, peID_SUCURSAL : Integer;
                                       var psDESCPROC : String) : Boolean;
           var StpBloqueoSucursal : TStoredProc;
           begin
             Result := False; psDESCPROC := '';
             StpBloqueoSucursal := TStoredProc.Create(Nil);
             If Assigned(StpBloqueoSucursal) Then
              With StpBloqueoSucursal Do
                Try
                  DatabaseName := Objeto.Apli.DataBaseName;
                  SessionName  := Objeto.Apli.SessionName;
                  StoredProcName := 'PKGCRCREDITOO1.STP_BLOQUEO_SUCURSAL';
                  // Limpia y Crea Variables
                  Params.Clear;
                  Params.CreateParam(ftInteger,'peID_EMPRESA'  ,ptInput);
                  Params.CreateParam(ftInteger,'peID_SUCURSAL' ,ptInput);
                  Params.CreateParam(ftString ,'peB_BLOQUEO'   ,ptInput);
                  Params.CreateParam(ftString ,'peB_COMMIT'    ,ptInput);
                  Params.CreateParam(ftInteger,'psRESULTADO'   ,ptOutput);
                  Params.CreateParam(ftString ,'psTX_RESULTADO',ptOutput);
                  // Asigna Variables
                  ParamByName('peID_EMPRESA'  ).AsInteger := peID_EMPRESA;
                  ParamByName('peID_SUCURSAL' ).AsInteger := peID_SUCURSAL;
                  ParamByName('peB_BLOQUEO').AsString     := CFALSO;
                  ParamByName('peB_COMMIT').AsString      := CVERDAD;
                  ExecProc;

                  If (ParamByName('psRESULTADO').AsInteger <> 0) Then
                    Begin
                    psDESCPROC := ParamByName('psTX_RESULTADO').AsString;
                    MessageDlg(psDESCPROC, mtError, [mbOk], 0);
                    End
                  Else
                    Result := True;

                Finally
                 StpBloqueoSucursal.Params.Clear;
                 StpBloqueoSucursal.Free;
                End;
           end;

var vlnRow : Integer;
    vlDESCPROC, vlStrTASA_NETA : String;
    vlID_EMPRESA, vlID_SUCURSAL,
    vl_NVO_ID_PAGARE, vlNVO_ID_REL_PAG_DISP : Integer;

    vlTASA_ASIG, vlTASA_COSTO, vlTASA_NETA : Double;

    DataRegistro : PDataRegistro;
    vlbResult, vlbOk : Boolean;
    vlnStartRow, vlnEndRow : Integer;
begin
 Result := False;
 // Genera las Renovaciones
 memMessages.Lines.Add('====================================================');
 memMessages.Lines.Add('***         INICIA PROCESO DE RENOVACIÓN         ***');
 memMessages.Lines.Add('Hora de inicio:' + TimeToStr(Time));

 // Establece el rango a barrer, conforme la opción seleccionada...
 Case rgOpcion.ItemIndex Of
    0 :  // A Todos
         Begin
         vlnStartRow := 0;
         vlnEndRow   := StrGrdAlgnPagare1.RowCount - 1;
         End;
    1 : // Al Pagaré "X"
         Begin
         vlnStartRow := StrGrdAlgnPagare1.Row;
         vlnEndRow   := vlnStartRow;
         End;
 Else // En caso de otra opción, no hace nada pues puede haber error en la programación
         Exit;
 End;

 // Obtiene la Empresa y la Sucursal
 Objeto.ObtenEmpresaSucursal(vlID_EMPRESA, vlID_SUCURSAL);
 // Si no desbloquea la suscursal, entonces....
 If Not DesbloqueaSucursal(vlID_EMPRESA, vlID_SUCURSAL, vlDESCPROC) Then
  Begin
  memMessages.Lines.Add('');  
  memMessages.Lines.Add(vlDESCPROC);
  vlbResult := False;
  End
 Else
   Begin
     vlbResult := True;
     For vlnRow := vlnStartRow To vlnEndRow Do
      Begin
      New(DataRegistro);
      ObtenValoresdelRegistro(vlnRow, DataRegistro);
      // Si el pagaré se puede renovar, entonces...
    //  If (Trunc(DataRegistro^.F_VENCIMIENTO) <= Trunc(Objeto.Apli.DameFechaEmpresa)) Then
      // Si el pagaré se puede procesar, entonces...
      If (DataRegistro^.CHK_RENOVAR <> CO_NOTCHECK) Then
       Begin
          // Si el pagaré, se encuentra Activo, entonces...
          If (DataRegistro^.CVE_SIT_PAGARE = CSIT_AC) Then
              Begin
              vlbOk := (VencePagare(DataRegistro^.ID_CONTRATO, DataRegistro^.ID_PAGARE,
                                    DataRegistro^.ID_EMPRESA, DataRegistro^.ID_SUCURSAL,
                                    DataRegistro^.F_VENCIMIENTO, vlDESCPROC));
              End
           Else
              Begin
              vlbOk := True;
              End; // If (DataRegistro^.CVE_SIT_PAGARE = CSIT_AC) Then

          // Si el pagaré se desea renovar, entonces...
          If (vlbOk) And (DataRegistro^.CHK_RENOVAR = CO_CHECKED) Then
              Begin
              vlbOk := False;

              
              If ObtenTasasInteres( DataRegistro^.ID_CONTRATO,
                                    DataRegistro^.IMP_RENOVAR,
                                    DataRegistro^.DIAS_PLAZO,
                                    DataRegistro^.PCT_ISR,//MARA4356 PARA TASAS BRUTAS
                                    DataRegistro^.F_NVA_VTO,//MARA4356 PARA TASAS BRUTAS
                                    vlTASA_ASIG, vlTASA_COSTO,
                                    Objeto.Apli
                                  ) Then
                  Begin
                  BuscaTasaNeta( Objeto.Apli, DataRegistro^.PCT_ISR, vlTASA_ASIG, DataRegistro^.F_NVA_VTO, vlTASA_NETA);
                  memMessages.Lines.Add(' ');
                  // memMessages.Lines.Add('vlTASA_ASIG = '+FloatToStr(vlTASA_ASIG));
                  // memMessages.Lines.Add('vlTASA_NETA = '+FloatToStr(vlTASA_NETA));
                  // memMessages.Lines.Add('vlTASA_COSTO = '+FloatToStr(vlTASA_COSTO));
                  End
               Else
                  Begin
                  memMessages.Lines.Add('ERROR al renovar el Pagaré '+IntToStr(DataRegistro^.ID_PAGARE)+' con Contrato '+IntToStr(DataRegistro^.ID_CONTRATO));
                  memMessages.Lines.Add('---');
                  End;

              If  MantenimientoPagare( DataRegistro^.IMP_RENOVAR,
                                       DataRegistro^.TASA_NETA,
                                       // DataRegistro^.TASA_BRUTA, //MARA4356 TASAS BRUTAS
                                       DataRegistro^.PCT_ISR,
                                       DataRegistro^.F_NVA_VTO,
                                       DataRegistro^.CVE_IMP_RENOV,
                                       DataRegistro^.ID_CONTRATO,
                                       vlDESCPROC,
                                       vl_NVO_ID_PAGARE
                                       ) Then

                   // <SATV4766 16/12/2008>
                   // Actualiza el registro de relación de pagaré, con el próximo nuevo pagaré.
                   // Esto es importante, ya que es INDISPENSABLE para que se pueda cancelar el
                   // saldo COMPROMETIDO en la chequera en caso de existir, para el nuevo paagaré

                   If RunSQL(' UPDATE CR_REL_PAG_DISP SET ID_PAGARE_REN = '+IntToStr(vl_NVO_ID_PAGARE)+
                             ' WHERE ID_REL_PAG_DISP = '+IntToStr(DataRegistro^.ID_REL_PAG_DISP),
                             Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True) Then
                      Begin
                       // Nuevo Cambio <16/02/2006 SATV4766>
                       vlStrTASA_NETA := Format(COFORMAT_TASA, [vlTASA_NETA]);
                       vlTASA_NETA := StrToFloat(vlStrTASA_NETA); // Es importante realizar esta asignación por la precisión decimal
                       // Si la "Tasa asignada al pagare" es mayor a la "tasa asigna por el sistema", entonces...
                       If (DataRegistro^.TASA_NETA > vlTASA_NETA) Then
                         Begin
                           // Tesorería debe de proceder a autorizar el pagare; por lo que se coloca como "Pendiente de Autorizar"
                           If RunSQL(' UPDATE INV_PAGARE'+coCRLF+
                                     ' SET CVE_SIT_PAGARE = ''PU'''+coCRLF+
                                     ' WHERE ID_CONTRATO = '+IntToStr(DataRegistro^.ID_CONTRATO)+coCRLF+
                                     '   AND ID_PAGARE = '+IntToStr(vl_NVO_ID_PAGARE)+coCRLF+
                                     '   AND ID_EMPRESA = '+IntToStr(DataRegistro^.ID_EMPRESA)+coCRLF+
                                     '   AND ID_SUCURSAL = '+IntToStr(DataRegistro^.ID_SUCURSAL)+coCRLF,
                                     Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True) Then
                              Begin
                               vlbOk := RenuevaRelacionPagDisp( DataRegistro^.ID_REL_PAG_DISP, DataRegistro^.ID_CONTRATO, vl_NVO_ID_PAGARE,
                                                                vlNVO_ID_REL_PAG_DISP, vlDESCPROC
                                                              )
                              End
                            Else
                              Begin
                              CancelaPagare( vlID_EMPRESA, vlID_SUCURSAL,
                                             DataRegistro^.ID_CONTRATO, vl_NVO_ID_PAGARE, vlDESCPROC);
                              End;
                         End
                       Else
                         Begin
                            // Si la "Tasa del Sistema" es menor o igual a la asignada por el pagare; lo autoriza en automático
                            If AutorizaPagare(DataRegistro^.ID_EMPRESA, DataRegistro^.ID_SUCURSAL, //SATV4766 16Dic2008 -- Se habilita para cualquier empresa o sucursal la gestación de pagarés
                                              DataRegistro^.ID_CONTRATO, vl_NVO_ID_PAGARE,vlDESCPROC) Then
                               Begin               
                               vlbOk := RenuevaRelacionPagDisp( DataRegistro^.ID_REL_PAG_DISP, DataRegistro^.ID_CONTRATO, vl_NVO_ID_PAGARE,
                                                                vlNVO_ID_REL_PAG_DISP, vlDESCPROC
                                                              )
                               End                               
                            Else
                              Begin
                              CancelaPagare( vlID_EMPRESA, vlID_SUCURSAL,
                                             DataRegistro^.ID_CONTRATO, vl_NVO_ID_PAGARE, vlDESCPROC);
                              End;
                         End;


                        // </SATV4766 16/02/2009>
                       // End If AutorizaPagare(
                      End
                   Else

                   // </SATV4766 16/12/2008>

                   // If RunSQL(
              // End If MantenimientoPagare(
              CancelaPagare( vlID_EMPRESA, vlID_SUCURSAL, DataRegistro^.ID_CONTRATO, vl_NVO_ID_PAGARE, vlDESCPROC);

           End; // If (DataRegistro^.CHK_RENOVAR = CO_CHECKED) Then

              // Si ocurió un error en el proceso, entonces...
              If Not vlbOk Then
                Begin
                memMessages.Lines.Add('');
                memMessages.Lines.Add('ERROR al renovar el Pagaré '+IntToStr(DataRegistro^.ID_PAGARE)+' con Contrato '+
                                      IntToStr(DataRegistro^.ID_CONTRATO));
                memMessages.Lines.Add('DESCPROC: '+vlDESCPROC);
                End;
              vlbResult := vlbResult And vlbOk;
        End;
      End;
   End;
 // If DesbloqueaSucursal(vlID_EMPRESA, vlID_SUCURSAL) Then

  memMessages.Lines.Add('Hora de término:' + TimeToStr(Time));
  memMessages.Lines.Add('***          TERMINA PROCESO DE RENOVACIÓN       ***');
  If Not vlbResult Then // Si encontró errores, entonces...
   memMessages.Lines.Add('***  !!!! CON ERRORES, FAVOR DE VERIFICAR !!!!  ***');
  memMessages.Lines.Add('====================================================');

  btBuscaClick(Self);
  Result := vlbResult;
end;

procedure TWCrRnvPag.InvertCheck(StringAlignGrid: TStringAlignGrid; nCol,
  nRow: Integer);
var vlStr : String;
begin
 With (StringAlignGrid) Do
  If (Cells[nCol, nRow] <> CO_NOTCHECK) Then // Si se puede editar, entonces...
   Begin
   If (Cells[nCol, nRow] =  CO_CHECKED) Then vlStr := CO_UNCHECKED
   Else vlStr := CO_CHECKED;

   AplicaCambiodeBandera(nRow, vlStr);
   End;
end;

procedure TWCrRnvPag.StrGrdAlgnPagare3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var vlnCol, vlnRow : Integer;
begin
 StrGrdAlgnPagare3.MouseToCell(X, Y, vlnCol, vlnRow);
 If (vlnCol = CO_CHK_RENOVAR) Then
  InvertCheck(StrGrdAlgnPagare3, CO_CHK_RENOVAR, vlnRow);
end;

procedure TWCrRnvPag.StrGrdAlgnPagare3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_RETURN Then
   MuestraPantallaEdicion(StrGrdAlgnPagare1.Row);
end;

procedure TWCrRnvPag.MuestraPantallaEdicion(penRow : Integer);
var CrRePaOp : TCrRePaOp;
    vlnTopRow : Integer;
    DataRegistro : PDataRegistro; 
begin
 // Obtiene los valores de las celdas
 New(DataRegistro);
 ObtenValoresdelRegistro(penRow, DataRegistro);
 // Valida que el registro se pueda renovar
 If (DataRegistro^.CHK_RENOVAR <> CO_NOTCHECK) Then
  Begin
     // Muestra Pantalla de Edición
      {$WARNINGS OFF}     
      CrRePaOp :=  TCrRePaOp.Create(self);
      {$WARNINGS ON}
      Try
         CrRePaOp.Apli := dmMain.apMain;
         CrRePaOp.ParamCre := Objeto.ParamCre;
         // Busca el Registro de Ocpción
         CrRePaOp.FindKey([DataRegistro^.ID_REL_PAG_DISP]);

         // Asigna datos Comúnes
         CrRePaOp.vgIMP_CAPITAL    := DataRegistro^.IMP_CAPITAL;
         CrRePaOp.vgIMP_NETO_VTO   := DataRegistro^.IMP_NETO_VTO;
         CrRePaOp.vgID_CONTRATO    := DataRegistro^.ID_CONTRATO;
         CrRePaOp.vgTASA_NETA_ORIG := DataRegistro^.TASA_NETA_ORIG;
         CrRePaOp.vgTASA_BRUTA     := DataRegistro^.TASA_BRUTA;         
         CrRePaOp.vgTASA_NETA      := DataRegistro^.TASA_NETA;
         CrRePaOp.vgPCT_ISR        := DataRegistro^.PCT_ISR;

         // Si el registro de Opción ya existe, entonces...
         If (CrRePaOp.ID_REL_PAG_DISP.AsInteger <> 0) Then
          Begin
          // Modifica
              // Si existe el registro pero no estan asignado los datos, entonces...
              If (Trim(CrRePaOp.CVE_IMP_RENOV.AsString) = '') Then
                 Begin
                 CrRePaOp.vgID_REL_PAG_DISP := DataRegistro^.ID_REL_PAG_DISP;
                 CrRePaOp.vgDIAS_PLAZO      := DataRegistro^.DIAS_PLAZO;
                 CrRePaOp.vgCVE_IMP_RENOV   := DataRegistro^.CVE_IMP_RENOV;
                 CrRePaOp.vgIMP_RENOVAR     := DataRegistro^.IMP_RENOVAR;
                 CrRePaOp.vgB_RENOVAR       := DataRegistro^.CHK_RENOVAR;
                 End;
          CrRePaOp.ShowWindow(ftModifica);
          End
         Else
          Begin
          // Crea uno nuevo
          CrRePaOp.vgID_REL_PAG_DISP := DataRegistro^.ID_REL_PAG_DISP;
          CrRePaOp.vgDIAS_PLAZO      := DataRegistro^.DIAS_PLAZO;
          CrRePaOp.vgCVE_IMP_RENOV   := DataRegistro^.CVE_IMP_RENOV;
          CrRePaOp.vgIMP_RENOVAR     := DataRegistro^.IMP_RENOVAR;
          CrRePaOp.vgB_RENOVAR       := DataRegistro^.CHK_RENOVAR;
          CrRePaOp.ShowWindow(ftCaptura);
          End;

       vlnTopRow := StrGrdAlgnPagare1.TopRow;
       btBuscaClick(Self);
       // Vuelve a sellecionar el registro
       StrGrdAlgnPagare1.TopRow := vlnTopRow;
       StrGrdAlgnPagare2.TopRow := vlnTopRow;
       StrGrdAlgnPagare3.TopRow := vlnTopRow;
       StrGrdAlgnPagare1.Row := penRow;
       StrGrdAlgnPagare2.Row := penRow;
       StrGrdAlgnPagare3.Row := penRow;
      Finally
       CrRePaOp.Free;
      End;
  End; // If (DataRegistro^.CHK_RENOVAR <> CO_NOTCHECK) Then
end;

procedure TWCrRnvPag.btBuscaClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRRNVPAG_BUSQ',True,True) then
   begin
      MostrarDatos;
   end;
end;

procedure TWCrRnvPag.rgCVE_SIT_PAGAREClick(Sender: TObject);
begin
 btBuscaClick(Self); // Aplica la búsqueda
end;

procedure TWCrRnvPag.StrGrdAlgnPagare1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
 If (StrGrdAlgnPagare1.Row = ARow) Then
   Begin
   PnlNOM_ACREDITADO.Caption := StrGrdAlgnPagare1.Cells[CO_NOM_ACREDITADO, StrGrdAlgnPagare1.Row];
   PnlNOM_ACREDITADO.Width   := StrGrdAlgnPagare1.Canvas.TextWidth(PnlNOM_ACREDITADO.Caption) + 5;
   PnlNOM_ACREDITADO.Left    := 42;
   PnlNOM_ACREDITADO.Top     := Rect.Top + StrGrdAlgnPagare1.Top + PnlNOM_ACREDITADO.Height + 2;
   End;
end;

procedure TWCrRnvPag.edTASA_BRUTAChange(Sender: TObject);
begin
 vgTASA_BRUTAChanged := True;
 btnAplicar.Enabled := vgTASA_BRUTAChanged;
end;

procedure TWCrRnvPag.edTASA_NETAChange(Sender: TObject);
begin
 vgTASA_NETAChanged := True;
 btnAplicar.Enabled := vgTASA_NETAChanged;
end;

procedure TWCrRnvPag.edDIAS_PLAZOChange(Sender: TObject);
begin
 vgDIAS_PLAZOChanged := True;
 btnAplicar.Enabled := vgDIAS_PLAZOChanged;
end;

procedure TWCrRnvPag.cbxCVE_IMP_RENOVChange(Sender: TObject);
begin
 vgCVE_IMP_RENOVChanged := True;
 btnAplicar.Enabled := vgCVE_IMP_RENOVChanged;
end;

procedure TWCrRnvPag.edPCT_ISRChange(Sender: TObject);
begin
 vgPCT_ISRChanged := True;
 btnAplicar.Enabled := vgPCT_ISRChanged;
end;

procedure TWCrRnvPag.Timer1Timer(Sender: TObject);
begin
 PnlNOM_ACREDITADO.Visible := False;
 Timer1.Enabled := False;
end;

procedure TWCrRnvPag.ActivaPanel;
begin
 Timer1.Enabled := False;
 PnlNOM_ACREDITADO.Visible := PnlNOM_ACREDITADO.Caption <> '';
 Timer1.Enabled := PnlNOM_ACREDITADO.Visible;
end;

procedure TWCrRnvPag.StrGrdAlgnPagare3DblClick(Sender: TObject);
begin
 MuestraPantallaEdicion(StrGrdAlgnPagare1.Row);
end;

procedure TWCrRnvPag.edTASA_NETAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_RETURN Then
   btnAplicarClick(Self);
end;

procedure TWCrRnvPag.btnRestauraTasaClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRRNVPAG_RSTIN',True,True) then
   begin
     If (MessageDlg('Este proceso restaurará la Tasa Interés de todos los pagarés pendientes de '+
                    'vencer/renovar. ¿Desea Continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
      Begin
      vgB_RESTAURA_TASA := True;
      vgTASA_NETAChanged := True;
      btnAplicarClick(Self);
      End;
   end;   
end;

procedure TWCrRnvPag.lblAl_PAGAREClick(Sender: TObject);
begin
 rgOpcion.ItemIndex := 1;
end;

// Inicia Modificaciones SATV4766

procedure TWCrRnvPag.CreaBuscador1(peStrNomBuscador : String;
                                   peStrCamposBuscador : String;
                                   penResultBusc1, penResultBusc2 : Integer;
                                   peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo;
                                   peCheckBox : TCheckBox
                                  );
Var vlInterFindit : TInterFindit;
begin
  VlInterFindit := Objeto.CreaBuscador(peStrNomBuscador, peStrCamposBuscador);
  Try
    If vlInterFindit.Execute Then
      Begin
      peCVE_INTERCAMPO.AsString  := vlInterFindit.DameCampo(penResultBusc1);
      peDESC_INTERCAMPO.AsString := vlInterFindit.DameCampo(penResultBusc2);
      peCheckBox.Checked := True;
      End;
  Finally
      vlInterFindit.Free;
  End;
end;

procedure TWCrRnvPag.ObtenDescripcion(peStrBuffer, peStrSQL, peStrNomCampo: String;
                                      peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo;
                                      peCheckBox : TCheckBox);
var vlStrCampoResult : String;
begin
  With Objeto Do
    Begin
      GetSQLStr(peStrSQL, Apli.DataBaseName, Apli.SessionName, peStrNomCampo, vlStrCampoResult, False);
      If (Trim(vlStrCampoResult) <> '') Then
         Begin
         peCheckBox.Checked := True;
         peCVE_INTERCAMPO.AsString := Trim(peStrBuffer);
         peDESC_INTERCAMPO.AsString := vlStrCampoResult;
         End
      Else
         Begin
         peCheckBox.Checked := False;
         End;
    End;
end;

procedure TWCrRnvPag.LimpiaControles(peCheckBox: TCheckBox;
  peCVE_INTERCAMPO, peDESC_INTERCAMPO: TInterCampo);
begin
  If (Not peCheckBox.Checked) Then
    Begin
    peCVE_INTERCAMPO.AsString  := '';
    peDESC_INTERCAMPO.AsString := '';
    End;
end;

procedure TWCrRnvPag.btID_PROM_ADMINClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRRNVPAG_PRMAD',True,True) then
   begin
     With Objeto Do
       CreaBuscador1('IPROMO.IT','',0,1, ID_PROM_ADMIN, NOM_PROM_ADMIN, cbID_PROM_ADMIN);
   end;
end;

procedure TWCrRnvPag.btID_PROM_ASOCClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRRNVPAG_PRMAS',True,True) then
   begin
     With Objeto Do
       CreaBuscador1('IPROMO.IT','',0,1, ID_PROM_ASOC, NOM_PROM_ASOC, cbID_PROM_ASOC);
   end;    
end;

procedure TWCrRnvPag.btCVE_PRESUPUESTOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRRNVPAG_MDOOB',True,True) then
   begin
     With Objeto Do
       CreaBuscador1('INTCRPRE.IT','',0,1, CVE_PRESUPUESTO, DESC_PRESUPUESTO, cbCVE_PRESUPUESTO);
   end;    
end;

procedure TWCrRnvPag.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRRNVPAG_GPOPR',True,True) then
   begin
     With Objeto Do
       CreaBuscador1('CONSPRODGPO.IT','',0,1,CVE_PRODUCTO_GPO, DESC_L_PROD_GPO, cbCVE_PRODUCTO_GPO);
   end;    
end;

procedure TWCrRnvPag.btCVE_PRODUCTO_CREClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRRNVPAG_PROD',True,True) then
   begin
     With Objeto Do
       CreaBuscador1('CONSCRPROD.IT','',0,1,CVE_PRODUCTO_CRE, DESC_L_PRODUCTO, cbCVE_PRODUCTO_CRE);
   end;    
end;

procedure TWCrRnvPag.cbID_PROM_ADMINClick(Sender: TObject);
begin
  LimpiaControles(cbID_PROM_ADMIN, Objeto.ID_PROM_ADMIN, Objeto.NOM_PROM_ADMIN);
end;

procedure TWCrRnvPag.cbID_PROM_ASOCClick(Sender: TObject);
begin
  LimpiaControles(cbID_PROM_ASOC, Objeto.ID_PROM_ASOC, Objeto.NOM_PROM_ASOC);
end;

procedure TWCrRnvPag.cbCVE_PRESUPUESTOClick(Sender: TObject);
begin
  LimpiaControles(cbCVE_PRESUPUESTO, Objeto.CVE_PRESUPUESTO, Objeto.DESC_PRESUPUESTO);
end;

procedure TWCrRnvPag.cbCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
  LimpiaControles(cbCVE_PRODUCTO_GPO, Objeto.CVE_PRODUCTO_GPO, Objeto.DESC_L_PROD_GPO);
end;

procedure TWCrRnvPag.cbCVE_PRODUCTO_CREClick(Sender: TObject);
begin
  LimpiaControles(cbCVE_PRODUCTO_CRE, Objeto.CVE_PRODUCTO_CRE, Objeto.DESC_L_PRODUCTO);
end;

procedure TWCrRnvPag.ilID_PROM_ADMINEjecuta(Sender: TObject);
begin
 With Objeto Do
    ObtenDescripcion(  ilID_PROM_ADMIN.Buffer,
                       ' SELECT P.NOMBRE'+coCRLF+
                       ' FROM  PERSONA P'+coCRLF+
                       ' WHERE P.ID_PERSONA = '+SQLStr(ilID_PROM_ADMIN.Buffer),
                       'NOMBRE',
                       ID_PROM_ADMIN,
                       NOM_PROM_ADMIN,
                       cbID_PROM_ADMIN
                     );
end;

procedure TWCrRnvPag.ilID_PROM_ASOCEjecuta(Sender: TObject);
begin
 With Objeto Do
    ObtenDescripcion(  ilID_PROM_ASOC.Buffer,
                       ' SELECT P.NOMBRE'+coCRLF+
                       ' FROM  PERSONA P'+coCRLF+
                       ' WHERE P.ID_PERSONA = '+SQLStr(ilID_PROM_ASOC.Buffer),
                       'NOMBRE',
                       ID_PROM_ASOC,
                       NOM_PROM_ASOC,
                       cbID_PROM_ASOC
                     );
end;

procedure TWCrRnvPag.ilCVE_PRESUPUESTOEjecuta(Sender: TObject);
begin
 With Objeto Do
    ObtenDescripcion(  ilCVE_PRESUPUESTO.Buffer,
                       ' SELECT CP.DESC_PRESUPUESTO'+coCRLF+
                       ' FROM  CRE_PRESUPUESTO CP'+coCRLF+
                       ' WHERE CP.CVE_PRESUPUESTO = '+SQLStr(ilCVE_PRESUPUESTO.Buffer),
                       'DESC_PRESUPUESTO',
                       CVE_PRESUPUESTO,
                       DESC_PRESUPUESTO,
                       cbCVE_PRESUPUESTO
                     );
end;

procedure TWCrRnvPag.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
 With Objeto Do
    ObtenDescripcion(  ilCVE_PRODUCTO_GPO.Buffer,
                       ' SELECT DESC_L_PROD_GPO'+coCRLF+
                       ' FROM  CR_PRODUCTO_GPO CPG'+coCRLF+
                       ' WHERE CPG.CVE_PRODUCTO_GPO = '+SQLStr(ilCVE_PRODUCTO_GPO.Buffer)+
                       'UNION '+coCRLF+
                       ' SELECT CSTB.DESC_SUB_TIPO'+coCRLF+
                       ' FROM  CRE_SUB_TIP_BCO CSTB'+coCRLF+
                       ' WHERE TO_CHAR(CSTB.CVE_SUB_TIP_BCO) = '+SQLStr(ilCVE_PRODUCTO_CRE.Buffer),
                       'DESC_L_PROD_GPO',
                       CVE_PRODUCTO_GPO,
                       DESC_L_PROD_GPO,
                       cbCVE_PRODUCTO_GPO
                     );
end;

procedure TWCrRnvPag.ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
begin
 With Objeto Do
    ObtenDescripcion(  ilCVE_PRODUCTO_CRE.Buffer,
                       ' SELECT DESC_L_PRODUCTO'+coCRLF+
                       ' FROM  CR_PRODUCTO CP'+coCRLF+
                       ' WHERE CP.CVE_PRODUCTO_CRE = '+SQLStr(ilCVE_PRODUCTO_CRE.Buffer)+
                       'UNION '+coCRLF+
                       ' SELECT CSTB.DESC_SUB_TIPO'+coCRLF+
                       ' FROM  CRE_SUB_TIP_BCO CSTB'+coCRLF+
                       ' WHERE TO_CHAR(CSTB.CVE_SUB_TIP_BCO) = '+SQLStr(ilCVE_PRODUCTO_CRE.Buffer),
                       'DESC_L_PRODUCTO',
                       CVE_PRODUCTO_CRE,
                       DESC_L_PRODUCTO,
                       cbCVE_PRODUCTO_CRE
                     );
end;


procedure TWCrRnvPag.ColoreaCorte(peSender : TObject; peRow: Integer; peColor : TColor);
var vlCol : Integer;
begin
 With (peSender As TStringAlignGrid) Do
   Begin
   RowFont[peRow] := lblFontRow.Font;
   For vlCol := 0 To ColCount - 1 Do
     ColorCell[vlCol, peRow] := peColor;
   End;
end;

procedure TWCrRnvPag.StrGrdAlgnPagare3DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Bmp : TBitmap;
begin
 If (StrGrdAlgnPagare1.Cells[CO_B_CORTE, ARow] = CVERDAD) Then
   Exit;

 With StrGrdAlgnPagare3 Do
  If (ACol = CO_CHK_RENOVAR) Then
    Begin
      Bmp := TBitmap.Create;
      If (Cells[CO_CHK_RENOVAR, ARow] = CO_CHECKED) Then ImageList.GetBitmap(1,Bmp)
      Else ImageList.GetBitmap(0,Bmp);
      Canvas.Draw(Rect.Left,Rect.Top,Bmp);
      Bmp.FreeImage;
      Bmp.Free;
    End;
end;

function TWCrRnvPag.TasaInflacion:Double;
var
    sSQL          :String;
    TasaInflacion : Double;
    vlQry         : TQuery;
begin
   TasaInflacion := 0;

   sSQL:= ' SELECT TASA_INFLAC FROM INV_TASA_INFLAC ' +
          ' WHERE ROWNUM = 1 ' +
          ' ORDER BY ANO_MES DESC ';

   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
      Try
         If vlQry <> Nil Then Begin
            TasaInflacion:= vlQry.FieldByName('TASA_INFLAC').AsFloat;
         End;
      Finally
         If vlQry <> Nil Then
            vlQry.free;
      End;
   End;
   Result := TasaInflacion;
end;

end.

