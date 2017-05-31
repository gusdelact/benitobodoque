// Sistema         : Clase de CR_CT_PROEMIO_PM
// Fecha de Inicio : 01/06/2004
// Función forma   : Clase de CR_CT_PROEMIO_PM
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMProemio;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, InterEdit, IntCrAcredit, Intdom, IntMPers,
IntMTpCto, Menus;

Type
 TMProemio= class;

  TwMProemio=Class(TForm)
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIF: TEdit;
    rgSIT_SOLICITUD: TRadioGroup;
    edID_SOLICITUD: TEdit;
    Label3: TLabel;
    InterForma1: TInterForma;
    ilID_PERSONA: TInterLinkit;
    ilID_DOMICILIO: TInterLinkit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    edACR_ESC_NUMERO: TEdit;
    dtpACR_ESC_FECHA: TInterDateTimePicker;
    edACR_ESC_FECHA: TEdit;
    edACR_ESC_NOT_PUB: TEdit;
    edACR_ESC_NOM_LIC: TEdit;
    edACR_ESC_PLAZA: TEdit;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    edACR_REG_NUMERO: TEdit;
    dtpACR_REG_FECHA: TInterDateTimePicker;
    edACR_REG_FECHA: TEdit;
    edACR_REG_PLAZA: TEdit;
    dtpF_SOLICITUD: TInterDateTimePicker;
    edF_SOLICITUD: TEdit;
    Label13: TLabel;
    edNOM_ID_PERSONA: TEdit;
    btID_PERSONA: TBitBtn;
    edID_PERSONA: TEdit;
    Label5: TLabel;
    Label2: TLabel;
    edOBJETO_SOCIAL: TEdit;
    Label6: TLabel;
    edID_DOMICILIO: TEdit;
    btID_DOMICILIO: TBitBtn;
    edNOM_ID_DOMICILIO: TEdit;
    TabSheet2: TTabSheet;
    Label12: TLabel;
    edNOM_REPRESEN_ACR: TMemo;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    edREP_A_ESC_NUMERO: TEdit;
    dtpedREP_A_ESC_FECHA: TInterDateTimePicker;
    edREP_A_ESC_FECHA: TEdit;
    edREP_A_ESC_NOT_PU: TEdit;
    edREP_A_ESC_PLAZA: TEdit;
    GroupBox5: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edREP_A_REG_NUMERO: TEdit;
    dtpedREP_A_REG_FECHA: TInterDateTimePicker;
    edREP_A_REG_FECHA: TEdit;
    edREP_A_REG_PLAZA: TEdit;
    TabSheet3: TTabSheet;
    Label23: TLabel;
    edNOM_REPRESEN_BIN: TMemo;
    GroupBox6: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    edREP_B_ESC_NUMERO: TEdit;
    dtpREP_B_ESC_FECHA: TInterDateTimePicker;
    edREP_B_ESC_FECHA: TEdit;
    edREP_B_ESC_NOT_PU: TEdit;
    edREP_B_ESC_NOM_LI: TEdit;
    edREP_B_ESC_PLAZA: TEdit;
    GroupBox7: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edREP_B_REG_NUMERO: TEdit;
    dtpREP_B_REG_FECHA: TInterDateTimePicker;
    edREP_B_REG_FECHA: TEdit;
    edREP_B_REG_PLAZA: TEdit;
    TabSheet4: TTabSheet;
    Label32: TLabel;
    edOPE_MONTO: TInterEdit;
    Label33: TLabel;
    edOPE_DESTINO_CRED: TEdit;
    edOPE_DISPOSICION: TEdit;
    Label34: TLabel;
    edOPE_COMISION: TEdit;
    Label35: TLabel;
    edOPE_F_VENC: TEdit;
    dtpOPE_F_VENC: TInterDateTimePicker;
    Label36: TLabel;
    edOPE_PAGO_CREDITO: TEdit;
    Label37: TLabel;
    edOPE_PAGO_INTER: TEdit;
    Label38: TLabel;
    edOPE_TASA_INT_MOR: TEdit;
    Label39: TLabel;
    Label40: TLabel;
    edOPE_GARANTIA_CRE: TMemo;
    edOPE_TASA_INT_ORD: TEdit;
    Label41: TLabel;
    PnlMsg: TPanel;
    edREP_A_ESC_NOM_LIC: TEdit;
    Label18: TLabel;
    Label42: TLabel;
    edCVE_CTO_CRE: TEdit;
    btCVE_CTO_CRE: TBitBtn;
    edNOM_CVE_CTO_CRE: TEdit;
    ilCVE_CTO_CRE: TInterLinkit;
    Label8: TLabel;
    pmDomicilio: TPopupMenu;
    AltadeDomicilio1: TMenuItem;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btID_PERSONAClick(Sender: TObject);
    procedure ilID_PERSONACapture(Sender: TObject; var Show: Boolean);
    procedure ilID_PERSONAEjecuta(Sender: TObject);
    procedure btID_DOMICILIOClick(Sender: TObject);
    procedure ilID_DOMICILIOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_DOMICILIOEjecuta(Sender: TObject);
    procedure edACR_ESC_NOT_PUBKeyPress(Sender: TObject; var Key: Char);
    procedure edID_PERSONAKeyPress(Sender: TObject; var Key: Char);
    procedure edID_DOMICILIOKeyPress(Sender: TObject; var Key: Char);
    procedure edID_PERSONAExit(Sender: TObject);
    procedure edOBJETO_SOCIALExit(Sender: TObject);
    procedure edID_DOMICILIOExit(Sender: TObject);
    procedure edF_SOLICITUDExit(Sender: TObject);
    procedure btID_DOMICILIOExit(Sender: TObject);
    procedure edACR_ESC_NUMEROExit(Sender: TObject);
    procedure edACR_ESC_NOT_PUBExit(Sender: TObject);
    procedure edACR_ESC_PLAZAExit(Sender: TObject);
    procedure edACR_ESC_FECHAExit(Sender: TObject);
    procedure edACR_REG_PLAZAExit(Sender: TObject);
    procedure edACR_REG_NUMEROExit(Sender: TObject);
    procedure edACR_REG_FECHAExit(Sender: TObject);
    procedure rgSIT_SOLICITUDExit(Sender: TObject);
    procedure edNOM_REPRESEN_ACRExit(Sender: TObject);
    procedure edREP_A_ESC_NOT_PUExit(Sender: TObject);
    procedure edREP_A_ESC_NUMEROExit(Sender: TObject);
    procedure edREP_A_ESC_PLAZAExit(Sender: TObject);
    procedure edREP_A_ESC_FECHAExit(Sender: TObject);
    procedure edREP_A_REG_PLAZAExit(Sender: TObject);
    procedure edREP_A_REG_NUMEROExit(Sender: TObject);
    procedure edREP_A_REG_FECHAExit(Sender: TObject);
    procedure edNOM_REPRESEN_BINExit(Sender: TObject);
    procedure edREP_B_ESC_NUMEROExit(Sender: TObject);
    procedure edREP_B_ESC_NOT_PUExit(Sender: TObject);
    procedure edREP_B_ESC_PLAZAExit(Sender: TObject);
    procedure edREP_B_ESC_FECHAExit(Sender: TObject);
    procedure edREP_B_REG_PLAZAExit(Sender: TObject);
    procedure edREP_B_REG_NUMEROExit(Sender: TObject);
    procedure edREP_B_REG_FECHAExit(Sender: TObject);
    procedure edOPE_MONTOExit(Sender: TObject);
    procedure edOPE_DESTINO_CREDExit(Sender: TObject);
    procedure edOPE_DISPOSICIONExit(Sender: TObject);
    procedure edOPE_COMISIONExit(Sender: TObject);
    procedure edOPE_F_VENCExit(Sender: TObject);
    procedure edOPE_PAGO_CREDITOExit(Sender: TObject);
    procedure edOPE_PAGO_INTERExit(Sender: TObject);
    procedure edOPE_TASA_INT_ORDExit(Sender: TObject);
    procedure edOPE_TASA_INT_MORExit(Sender: TObject);
    procedure edOPE_GARANTIA_CREExit(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure ilCVE_CTO_CREEjecuta(Sender: TObject);
    procedure ilCVE_CTO_CRECapture(Sender: TObject; var Show: Boolean);
    procedure btCVE_CTO_CREClick(Sender: TObject);
    procedure edCVE_CTO_CREExit(Sender: TObject);
    procedure edACR_ESC_NOM_LICExit(Sender: TObject);
    procedure edREP_B_ESC_NOM_LIExit(Sender: TObject);
    procedure edREP_A_ESC_NOM_LICExit(Sender: TObject);
    procedure edOBJETO_SOCIALKeyPress(Sender: TObject; var Key: Char);
    procedure edACR_ESC_NUMEROKeyPress(Sender: TObject; var Key: Char);
    procedure edACR_ESC_NOM_LICKeyPress(Sender: TObject; var Key: Char);
    procedure edACR_ESC_PLAZAKeyPress(Sender: TObject; var Key: Char);
    procedure edACR_ESC_FECHAKeyPress(Sender: TObject; var Key: Char);
    procedure edACR_REG_NUMEROKeyPress(Sender: TObject; var Key: Char);
    procedure edACR_REG_PLAZAKeyPress(Sender: TObject; var Key: Char);
    procedure edACR_REG_FECHAKeyPress(Sender: TObject; var Key: Char);
    procedure edNOM_REPRESEN_ACRKeyPress(Sender: TObject; var Key: Char);
    procedure edREP_A_ESC_NUMEROKeyPress(Sender: TObject; var Key: Char);
    procedure edREP_A_ESC_NOT_PUKeyPress(Sender: TObject; var Key: Char);
    procedure edREP_A_ESC_NOM_LICKeyPress(Sender: TObject; var Key: Char);
    procedure edREP_A_ESC_PLAZAKeyPress(Sender: TObject; var Key: Char);
    procedure edREP_A_REG_NUMEROKeyPress(Sender: TObject; var Key: Char);
    procedure edREP_A_REG_PLAZAKeyPress(Sender: TObject; var Key: Char);
    procedure edNOM_REPRESEN_BINKeyPress(Sender: TObject; var Key: Char);
    procedure edREP_B_ESC_NUMEROKeyPress(Sender: TObject; var Key: Char);
    procedure edREP_B_ESC_NOT_PUKeyPress(Sender: TObject; var Key: Char);
    procedure edREP_B_ESC_NOM_LIKeyPress(Sender: TObject; var Key: Char);
    procedure edREP_B_ESC_PLAZAKeyPress(Sender: TObject; var Key: Char);
    procedure edREP_B_REG_NUMEROKeyPress(Sender: TObject; var Key: Char);
    procedure edREP_B_REG_PLAZAKeyPress(Sender: TObject; var Key: Char);
    procedure edOPE_DESTINO_CREDKeyPress(Sender: TObject; var Key: Char);
    procedure edOPE_DISPOSICIONKeyPress(Sender: TObject; var Key: Char);
    procedure edOPE_COMISIONKeyPress(Sender: TObject; var Key: Char);
    procedure edOPE_F_VENCKeyPress(Sender: TObject; var Key: Char);
    procedure edOPE_PAGO_CREDITOKeyPress(Sender: TObject; var Key: Char);
    procedure edOPE_PAGO_INTERKeyPress(Sender: TObject; var Key: Char);
    procedure edOPE_TASA_INT_ORDKeyPress(Sender: TObject; var Key: Char);
    procedure edOPE_TASA_INT_MORKeyPress(Sender: TObject; var Key: Char);
    procedure edOPE_GARANTIA_CREKeyPress(Sender: TObject; var Key: Char);
    procedure AltadeDomicilio1Click(Sender: TObject);

    private
      Function ObtFolio(pCveFolio : String; pMsg : String): Integer;
      Procedure ObtNomRep;
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMProemio;
    end;

 TMProemio= class(TInterFrame)
      private
         iIdSolicitud : Integer;
      protected
      public
        { Public declarations }

        ID_SOLICITUD        : TInterCampo;
        ID_PERSONA          : TInterCampo;
        F_SOLICITUD         : TInterCampo;
        OBJETO_SOCIAL       : TInterCampo;
        ID_DOMICILIO        : TInterCampo;
        ACR_ESC_NUMERO      : TInterCampo;
        ACR_ESC_FECHA       : TInterCampo;
        ACR_ESC_NOT_PUB     : TInterCampo;
        ACR_ESC_NOM_LIC     : TInterCampo;
        ACR_ESC_PLAZA       : TInterCampo;
        ACR_REG_PLAZA       : TInterCampo;
        ACR_REG_FECHA       : TInterCampo;
        ACR_REG_NUMERO      : TInterCampo;
        NOM_REPRESEN_ACR    : TInterCampo;
        REP_A_ESC_NUMERO    : TInterCampo;
        REP_A_ESC_FECHA     : TInterCampo;
        REP_A_ESC_NOT_PU    : TInterCampo;
        REP_A_ESC_NOM_LI    : TInterCampo;
        REP_A_ESC_PLAZA     : TInterCampo;
        REP_A_REG_PLAZA     : TInterCampo;
        REP_A_REG_FECHA     : TInterCampo;
        REP_A_REG_NUMERO    : TInterCampo;
        NOM_REPRESEN_BIN    : TInterCampo;
        REP_B_ESC_NUMERO    : TInterCampo;
        REP_B_ESC_FECHA     : TInterCampo;
        REP_B_ESC_NOT_PU    : TInterCampo;
        REP_B_ESC_NOM_LI    : TInterCampo;
        REP_B_ESC_PLAZA     : TInterCampo;
        REP_B_REG_PLAZA     : TInterCampo;
        REP_B_REG_FECHA     : TInterCampo;
        REP_B_REG_NUMERO    : TInterCampo;
        OPE_MONTO           : TInterCampo;
        OPE_DESTINO_CRED    : TInterCampo;
        OPE_DISPOSICION     : TInterCampo;
        OPE_COMISION        : TInterCampo;
        OPE_F_VENC          : TInterCampo;
        OPE_PAGO_CREDITO    : TInterCampo;
        OPE_PAGO_INTER      : TInterCampo;
        OPE_TASA_INT_MOR    : TInterCampo;
        OPE_TASA_INT_ORD    : TInterCampo;
        OPE_GARANTIA_CRE    : TInterCampo;
        SIT_SOLICITUD       : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_CTO_CRE          : TInterCampo;

        ParamCre            : TParamCre;
        Persona             : TMPersona;
        Domicilio           : TDomicilio;
        MTpCto              : TMTpCto;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}



constructor TMProemio.Create( AOwner : TComponent );
begin Inherited;
   ID_SOLICITUD:= CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
      ID_SOLICITUD.Caption:='Identificador de Solicitud';
   ID_PERSONA:= CreaCampo('ID_PERSONA',ftFloat,tsNinguno,tsNinguno,True);
      ID_PERSONA.Caption:='Identificador de Persona';
   F_SOLICITUD:= CreaCampo('F_SOLICITUD',ftDate,tsNinguno,tsNinguno,True);
      F_SOLICITUD.Caption:='Fecha Solicitud';
      F_SOLICITUD.NoCompare:= True;
   OBJETO_SOCIAL:= CreaCampo('OBJETO_SOCIAL',ftString,tsNinguno,tsNinguno,True);
      OBJETO_SOCIAL.Caption:='Objeto Social';
      OBJETO_SOCIAL.NoCompare:= True;
   ID_DOMICILIO:= CreaCampo('ID_DOMICILIO',ftFloat,tsNinguno,tsNinguno,True);
      ID_DOMICILIO.Caption:='Identificador de Domicilio';
      ID_DOMICILIO.NoCompare:= True;
   ACR_ESC_NUMERO:= CreaCampo('ACR_ESC_NUMERO',ftString,tsNinguno,tsNinguno,True);
      ACR_ESC_NUMERO.Caption:='Número de escritura constitutiva';
      ACR_ESC_NUMERO.NoCompare:= True;
   ACR_ESC_FECHA:= CreaCampo('ACR_ESC_FECHA',ftDate,tsNinguno,tsNinguno,True);
      ACR_ESC_FECHA.Caption:='Fecha de escritura constitutiva';
      ACR_ESC_FECHA.NoCompare:= True;
   ACR_ESC_NOT_PUB:= CreaCampo('ACR_ESC_NOT_PUB',ftString,tsNinguno,tsNinguno,True);
      ACR_ESC_NOT_PUB.Caption:='Notario Público de escritura constitutiva';
      ACR_ESC_NOT_PUB.NoCompare:= True;
   ACR_ESC_NOM_LIC:= CreaCampo('ACR_ESC_NOM_LIC',ftString,tsNinguno,tsNinguno,True);
      ACR_ESC_NOM_LIC.Caption:='Nombre de Licenciado';
      ACR_ESC_NOM_LIC.NoCompare:= True;
   ACR_ESC_PLAZA:= CreaCampo('ACR_ESC_PLAZA',ftString,tsNinguno,tsNinguno,True);
      ACR_ESC_PLAZA.Caption:='Plaza de escritura constitutiva';
      ACR_ESC_PLAZA.NoCompare:= True;
   ACR_REG_PLAZA:= CreaCampo('ACR_REG_PLAZA',ftString,tsNinguno,tsNinguno,True);
      ACR_REG_PLAZA.Caption:='Plaza de registro público de comercio';
      ACR_REG_PLAZA.NoCompare:= True;
   ACR_REG_FECHA:= CreaCampo('ACR_REG_FECHA',ftDate,tsNinguno,tsNinguno,True);
      ACR_REG_FECHA.Caption:='Fecha de registro público de comercio';
      ACR_REG_FECHA.NoCompare:= True;
   ACR_REG_NUMERO:= CreaCampo('ACR_REG_NUMERO',ftString,tsNinguno,tsNinguno,True);
      ACR_REG_NUMERO.Caption:='Número de registro público de comercio';
      ACR_REG_NUMERO.NoCompare:= True;
   NOM_REPRESEN_ACR:= CreaCampo('NOM_REPRESEN_ACR',ftString,tsNinguno,tsNinguno,True);
      NOM_REPRESEN_ACR.Caption:='Nombres de los representantes del acreditado';
      NOM_REPRESEN_ACR.NoCompare:= True;
   REP_A_ESC_NUMERO:= CreaCampo('REP_A_ESC_NUMERO',ftString,tsNinguno,tsNinguno,True);
      REP_A_ESC_NUMERO.Caption:='Número de escritura donde consta el poder';
      REP_A_ESC_NUMERO.NoCompare:= True;
   REP_A_ESC_FECHA:= CreaCampo('REP_A_ESC_FECHA',ftDate,tsNinguno,tsNinguno,True);
      REP_A_ESC_FECHA.Caption:='Fecha de escritura donde consta el poder';
      REP_A_ESC_FECHA.NoCompare:= True;
   REP_A_ESC_NOT_PU:= CreaCampo('REP_A_ESC_NOT_PU',ftString,tsNinguno,tsNinguno,True);
      REP_A_ESC_NOT_PU.Caption:='Notario Público de escritura donde consta el poder';
      REP_A_ESC_NOT_PU.NoCompare:= True;
   REP_A_ESC_NOM_LI:= CreaCampo('REP_A_ESC_NOM_LI',ftString,tsNinguno,tsNinguno,True);
      REP_A_ESC_NOM_LI.Caption:='Nombre de Licenciado';
      REP_A_ESC_NOM_LI.NoCompare:= True;
   REP_A_ESC_PLAZA:= CreaCampo('REP_A_ESC_PLAZA',ftString,tsNinguno,tsNinguno,True);
      REP_A_ESC_PLAZA.Caption:='Plaza de escritura donde consta el poder';
      REP_A_ESC_PLAZA.NoCompare:= True;
   REP_A_REG_PLAZA:= CreaCampo('REP_A_REG_PLAZA',ftString,tsNinguno,tsNinguno,True);
      REP_A_REG_PLAZA.Caption:='Plaza de registro público del comercio';
      REP_A_REG_PLAZA.NoCompare:= True;
   REP_A_REG_FECHA:= CreaCampo('REP_A_REG_FECHA',ftDate,tsNinguno,tsNinguno,True);
      REP_A_REG_FECHA.Caption:='Fecha de registro público del comercio';
      REP_A_REG_FECHA.NoCompare:= True;
   REP_A_REG_NUMERO:= CreaCampo('REP_A_REG_NUMERO',ftString,tsNinguno,tsNinguno,True);
      REP_A_REG_NUMERO.Caption:='Folio mercantil de registro público del comercio';
      REP_A_REG_NUMERO.NoCompare:= True;
   NOM_REPRESEN_BIN:= CreaCampo('NOM_REPRESEN_BIN',ftString,tsNinguno,tsNinguno,True);
      NOM_REPRESEN_BIN.Caption:='Representantes de BINTER';
      NOM_REPRESEN_BIN.NoCompare:= True;
   REP_B_ESC_NUMERO:= CreaCampo('REP_B_ESC_NUMERO',ftString,tsNinguno,tsNinguno,True);
      REP_B_ESC_NUMERO.Caption:='Número de escritura donde consta el poder';
      REP_B_ESC_NUMERO.NoCompare:= True;
   REP_B_ESC_FECHA:= CreaCampo('REP_B_ESC_FECHA',ftDate,tsNinguno,tsNinguno,True);
      REP_B_ESC_FECHA.Caption:='Fecha de escritura donde consta el poder';
      REP_B_ESC_FECHA.NoCompare:= True;
   REP_B_ESC_NOT_PU:= CreaCampo('REP_B_ESC_NOT_PU',ftString,tsNinguno,tsNinguno,True);
      REP_B_ESC_NOT_PU.Caption:='Notario Público de escritura donde consta el poder';
      REP_B_ESC_NOT_PU.NoCompare:= True;
   REP_B_ESC_NOM_LI:= CreaCampo('REP_B_ESC_NOM_LI',ftString,tsNinguno,tsNinguno,True);
      REP_B_ESC_NOM_LI.Caption:='Nombre de Licenciado';
      REP_B_ESC_NOM_LI.NoCompare:= True;
   REP_B_ESC_PLAZA:= CreaCampo('REP_B_ESC_PLAZA',ftString,tsNinguno,tsNinguno,True);
      REP_B_ESC_PLAZA.Caption:='Plaza de escritura donde consta el poder';
      REP_B_ESC_PLAZA.NoCompare:= True;
   REP_B_REG_PLAZA:= CreaCampo('REP_B_REG_PLAZA',ftString,tsNinguno,tsNinguno,True);
      REP_B_REG_PLAZA.Caption:='Plaza de registro público de comercio';
      REP_B_REG_PLAZA.NoCompare:= True;
   REP_B_REG_FECHA:= CreaCampo('REP_B_REG_FECHA',ftDate,tsNinguno,tsNinguno,True);
      REP_B_REG_FECHA.Caption:='Fecha de registro público de comercio';
      REP_B_REG_FECHA.NoCompare:= True;
   REP_B_REG_NUMERO:= CreaCampo('REP_B_REG_NUMERO',ftString,tsNinguno,tsNinguno,True);
      REP_B_REG_NUMERO.Caption:='Folio Mercantil de registro público de comercio';
      REP_B_REG_NUMERO.NoCompare:= True;
   OPE_MONTO:= CreaCampo('OPE_MONTO',ftFloat,tsNinguno,tsNinguno,True);
      OPE_MONTO.Caption:='Monto del Crédito';
      OPE_MONTO.NoCompare:= True;
   OPE_DESTINO_CRED:= CreaCampo('OPE_DESTINO_CRED',ftString,tsNinguno,tsNinguno,True);
      OPE_DESTINO_CRED.Caption:='Destino del Crédito';
      OPE_DESTINO_CRED.NoCompare:= True;
   OPE_DISPOSICION:= CreaCampo('OPE_DISPOSICION',ftString,tsNinguno,tsNinguno,True);
      OPE_DISPOSICION.Caption:='Forma en que se dispondra del Crédito';
      OPE_DISPOSICION.NoCompare:= True;
   OPE_COMISION:= CreaCampo('OPE_COMISION',ftString,tsNinguno,tsNinguno,True);
      OPE_COMISION.Caption:='Comisión';
      OPE_COMISION.NoCompare:= True;
   OPE_F_VENC:= CreaCampo('OPE_F_VENC',ftString,tsNinguno,tsNinguno,True);
      OPE_F_VENC.Caption:='Fecha Vencimiento';
      OPE_F_VENC.NoCompare:= True;
   OPE_PAGO_CREDITO:= CreaCampo('OPE_PAGO_CREDITO',ftString,tsNinguno,tsNinguno,True);
      OPE_PAGO_CREDITO.Caption:='Forma del pago del crédito';
      OPE_PAGO_CREDITO.NoCompare:= True;
   OPE_PAGO_INTER:= CreaCampo('OPE_PAGO_INTER',ftString,tsNinguno,tsNinguno,True);
      OPE_PAGO_INTER.Caption:='Forma de pago de los intereses ordinarios';
      OPE_PAGO_INTER.NoCompare:= True;
   OPE_TASA_INT_MOR:= CreaCampo('OPE_TASA_INT_MOR',ftString,tsNinguno,tsNinguno,True);
      OPE_TASA_INT_MOR.Caption:='Tasa de interés moratoria';
      OPE_TASA_INT_MOR.NoCompare:= True;
   OPE_TASA_INT_ORD:= CreaCampo('OPE_TASA_INT_ORD',ftString,tsNinguno,tsNinguno,True);
      OPE_TASA_INT_ORD.Caption:='Tasa de interés ordinaria';
      OPE_TASA_INT_ORD.NoCompare:= True;
   OPE_GARANTIA_CRE:= CreaCampo('OPE_GARANTIA_CRE',ftString,tsNinguno,tsNinguno,True);
      OPE_GARANTIA_CRE.Caption:='Garatía del Crédito';
      OPE_GARANTIA_CRE.NoCompare:= True;
   CVE_CTO_CRE :=CreaCampo('CVE_CTO_CRE',ftString,tsNinguno,tsNinguno,True);
      CVE_CTO_CRE.Caption:='Bloque de Firmas';
      CVE_CTO_CRE.NoCompare:= True;

   SIT_SOLICITUD :=CreaCampo('SIT_SOLICITUD',ftString,tsNinguno,tsNinguno,True);
   With SIT_SOLICITUD do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   end;
      SIT_SOLICITUD.Caption:='Situación de la solicitud';

   CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Clave de Usu Alta';
   F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha de Alta';
   CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
   F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
      F_MODIFICA.Caption:='Fecha Modifica';

   FKeyFields.Add('ID_SOLICITUD');
   TableName := 'CR_CT_PROEMIO_PM';
   UseQuery := True;
   HelpFile := 'IntMProemio.Hlp';
   ShowMenuReporte:=True;

   Persona := TMPersona.Create(Self);
   Persona.FilterBy := fbTMPersonaMoral;
   Persona.MasterSource := Self;
   Persona.FieldByName('ID_PERSONA').MasterField := 'ID_PERSONA';

   Domicilio := TDomicilio.Create(Self);
   Domicilio.MasterSource:=Self;
   Domicilio.FieldByName('ID_DOMICILIO').MasterField:='ID_DOMICILIO';

   MTpCto := TMTpCto.Create(Self);
   MTpCto.MasterSource := Self;
   MTpCto.FieldByName('CVE_CTO_CRE').MasterField := 'CVE_CTO_CRE';
end;


Destructor TMProemio.Destroy;
begin
   If Persona <> Nil Then
      Persona.Free;
   If Domicilio <> Nil Then
      Domicilio.Free;
   If MTpCto <> Nil Then
      MTpCto.Free;
   Inherited;
end;

function TMProemio.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMProemio;
begin
   W:=TWMProemio.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TMProemio.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMProemio.it','F');
   Try
      if Active then begin
         T.Param(0,ID_SOLICITUD.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

function TMProemio.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_CT_PROEMIO_PM********************)
(*                                                                              *)
(*  FORMA DE CR_CT_PROEMIO_PM                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CT_PROEMIO_PM********************)

procedure TwMProemio.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_SOLICITUD.Control         := edID_SOLICITUD;
      ID_PERSONA.Control           := edID_PERSONA;
      F_SOLICITUD.Control          := edF_SOLICITUD;
      OBJETO_SOCIAL.Control        := edOBJETO_SOCIAL;
      ID_DOMICILIO.Control         := edID_DOMICILIO;
      ACR_ESC_NUMERO.Control       := edACR_ESC_NUMERO;
      ACR_ESC_FECHA.Control        := edACR_ESC_FECHA;
      ACR_ESC_NOT_PUB.Control      := edACR_ESC_NOT_PUB;
      ACR_ESC_NOM_LIC.Control      := edACR_ESC_NOM_LIC;
      ACR_ESC_PLAZA.Control        := edACR_ESC_PLAZA;
      ACR_REG_PLAZA.Control        := edACR_REG_PLAZA;
      ACR_REG_FECHA.Control        := edACR_REG_FECHA;
      ACR_REG_NUMERO.Control       := edACR_REG_NUMERO;
      NOM_REPRESEN_ACR.Control     := edNOM_REPRESEN_ACR;
      REP_A_ESC_NUMERO.Control     := edREP_A_ESC_NUMERO;
      REP_A_ESC_FECHA.Control      := edREP_A_ESC_FECHA;
      REP_A_ESC_NOT_PU.Control     := edREP_A_ESC_NOT_PU;
      REP_A_ESC_NOM_LI.Control     := edREP_A_ESC_NOM_LIC;
      REP_A_ESC_PLAZA.Control      := edREP_A_ESC_PLAZA;
      REP_A_REG_PLAZA.Control      := edREP_A_REG_PLAZA;
      REP_A_REG_FECHA.Control      := edREP_A_REG_FECHA;
      REP_A_REG_NUMERO.Control     := edREP_A_REG_NUMERO;
      NOM_REPRESEN_BIN.Control     := edNOM_REPRESEN_BIN;
      REP_B_ESC_NUMERO.Control     := edREP_B_ESC_NUMERO;
      REP_B_ESC_FECHA.Control      := edREP_B_ESC_FECHA;
      REP_B_ESC_NOT_PU.Control     := edREP_B_ESC_NOT_PU;
      REP_B_ESC_NOM_LI.Control     := edREP_B_ESC_NOM_LI;
      REP_B_ESC_PLAZA.Control      := edREP_B_ESC_PLAZA;
      REP_B_REG_PLAZA.Control      := edREP_B_REG_PLAZA;
      REP_B_REG_FECHA.Control      := edREP_B_REG_FECHA;
      REP_B_REG_NUMERO.Control     := edREP_B_REG_NUMERO;
      OPE_MONTO.Control            := edOPE_MONTO;
      OPE_DESTINO_CRED.Control     := edOPE_DESTINO_CRED;
      OPE_DISPOSICION.Control      := edOPE_DISPOSICION;
      OPE_COMISION.Control         := edOPE_COMISION;
      OPE_F_VENC.Control           := edOPE_F_VENC;
      OPE_PAGO_CREDITO.Control     := edOPE_PAGO_CREDITO;
      OPE_PAGO_INTER.Control       := edOPE_PAGO_INTER;
      OPE_TASA_INT_MOR.Control     := edOPE_TASA_INT_MOR;
      OPE_TASA_INT_ORD.control     := edOPE_TASA_INT_ORD;
      OPE_GARANTIA_CRE.Control     := edOPE_GARANTIA_CRE;
      SIT_SOLICITUD.Control        := rgSIT_SOLICITUD;
      CVE_USU_ALTA.Control         := edCVE_USU_ALTA;
      F_ALTA.Control               := edF_ALTA;
      CVE_USU_MODIFICA.Control     := edCVE_USU_MODIF;
      F_MODIFICA.Control           := edF_MODIFICA;
      CVE_CTO_CRE.Control          := edCVE_CTO_CRE;
      InterForma1.MsgPanel      := PnlMsg;
   End;
   Objeto.Persona.ID_Persona.Control :=edID_PERSONA;
   Objeto.Persona.Nombre.Control :=edNOM_ID_PERSONA;
   Objeto.Persona.GetParams(Objeto);
   edNOM_ID_PERSONA.Hint := Objeto.Persona.Nombre.AsString;
   edNOM_ID_PERSONA.ShowHint := True;

   Objeto.Domicilio.IdDomicilio.Control := edID_DOMICILIO;
   Objeto.Domicilio.CalleNumero.Control := edNOM_ID_DOMICILIO;
   Objeto.Domicilio.GetParams(Objeto);

   Objeto.MTpCto.CVE_CTO_CRE.Control := edCVE_CTO_CRE;
   Objeto.MTpCto.DESC_L_CONTRATO.Control := edNOM_CVE_CTO_CRE;
   Objeto.MTpCto.GetParams(Objeto);
end;

procedure TwMProemio.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_SOLICITUD.Control         := Nil;
      ID_PERSONA.Control           := Nil;
      F_SOLICITUD.Control          := Nil;
      OBJETO_SOCIAL.Control        := Nil;
      ID_DOMICILIO.Control         := Nil;
      ACR_ESC_NUMERO.Control       := Nil;
      ACR_ESC_FECHA.Control        := Nil;
      ACR_ESC_NOT_PUB.Control      := Nil;
      ACR_ESC_NOM_LIC.Control      := Nil;
      ACR_ESC_PLAZA.Control        := Nil;
      ACR_REG_PLAZA.Control        := Nil;
      ACR_REG_FECHA.Control        := Nil;
      ACR_REG_NUMERO.Control       := Nil;
      NOM_REPRESEN_ACR.Control     := Nil;
      REP_A_ESC_NUMERO.Control     := Nil;
      REP_A_ESC_FECHA.Control      := Nil;
      REP_A_ESC_NOT_PU.Control     := Nil;
      REP_A_ESC_NOM_LI.Control     := Nil;
      REP_A_ESC_PLAZA.Control      := Nil;
      REP_A_REG_PLAZA.Control      := Nil;
      REP_A_REG_FECHA.Control      := Nil;
      REP_A_REG_NUMERO.Control     := Nil;
      NOM_REPRESEN_BIN.Control     := Nil;
      REP_B_ESC_NUMERO.Control     := Nil;
      REP_B_ESC_FECHA.Control      := Nil;
      REP_B_ESC_NOT_PU.Control     := Nil;
      REP_B_ESC_NOM_LI.Control     := Nil;
      REP_B_ESC_PLAZA.Control      := Nil;
      REP_B_REG_PLAZA.Control      := Nil;
      REP_B_REG_FECHA.Control      := Nil;
      REP_B_REG_NUMERO.Control     := Nil;
      OPE_MONTO.Control            := Nil;
      OPE_DESTINO_CRED.Control     := Nil;
      OPE_DISPOSICION.Control      := Nil;
      OPE_COMISION.Control         := Nil;
      OPE_F_VENC.Control           := Nil;
      OPE_PAGO_CREDITO.Control     := Nil;
      OPE_PAGO_INTER.Control       := Nil;
      OPE_TASA_INT_MOR.Control     := Nil;
      OPE_TASA_INT_ORD.Control     := Nil;
      OPE_GARANTIA_CRE.Control     := Nil;
      SIT_SOLICITUD.Control        := Nil;
      CVE_USU_ALTA.Control         := Nil;
      F_ALTA.Control               := Nil;
      CVE_USU_MODIFICA.Control     := Nil;
      F_MODIFICA.Control           := Nil;
      CVE_CTO_CRE.Control      := Nil;
      InterForma1.MsgPanel      := Nil;
   End;
   Objeto.Persona.ID_Persona.Control := Nil;
   Objeto.Persona.Nombre.Control := Nil;
   Objeto.Domicilio.IdDomicilio.Control := Nil;
   Objeto.Domicilio.CalleNumero.Control := Nil;
   Objeto.MTpCto.CVE_CTO_CRE.Control := Nil;
   Objeto.MTpCto.DESC_L_CONTRATO.Control := Nil;   
end;

procedure TwMProemio.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMProemio.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   With Objeto Do Begin
      if IsNewData then Begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            If ID_PERSONA.AsInteger<>0 Then Begin
               If F_SOLICITUD.AsFloat<>0 Then Begin
                  CVE_USU_ALTA.AsString := DameUsuario;
                  F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
                  ID_SOLICITUD.AsInteger := ObtFolio('CRSOL','ID SOLICITUD: ');
                  If ID_SOLICITUD.AsInteger <> 0 Then
                     Realizado := True
                  Else
                     Realizado := False;
               End Else Begin
                  ShowMessage('Indique la fecha de la solicitud');
                  Realizado := False;
               End;
            End Else Begin
               ShowMessage('Indique el identificador de la persona');
               Realizado := False;
            End;
         end else
            Realizado := False;
      end else Begin
         if MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USU_MODIFICA.AsString := DameUsuario;
            F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         end else
            Realizado := False;
      end
   End;
end;

procedure TwMProemio.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
   End;
end;

procedure TwMProemio.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;

   Objeto.F_SOLICITUD.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.ACR_ESC_FECHA.AsDateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.ACR_REG_FECHA.AsDateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.REP_A_ESC_FECHA.AsDateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.REP_A_REG_FECHA.AsDateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.REP_B_ESC_FECHA.AsDateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.REP_B_REG_FECHA.AsDateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.OPE_F_VENC.AsString:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));

   rgSIT_SOLICITUD.ItemIndex:= 0;
   PageControl1.ActivePageIndex:=0;
   Objeto.F_SOLICITUD.AsDateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   edID_PERSONA.SetFocus;
end;

procedure TwMProemio.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   If PageControl1.ActivePageIndex=0 Then
      edOBJETO_SOCIAL.SetFocus;
end;

procedure TwMProemio.btID_PERSONAClick(Sender: TObject);
begin
   Objeto.Persona.ShowAll := True;
   If Objeto.Persona.Busca Then Begin
      InterForma1.NextTab(edID_PERSONA);
   End;
end;

procedure TwMProemio.ilID_PERSONACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TwMProemio.ilID_PERSONAEjecuta(Sender: TObject);
begin
   If Objeto.Persona.FindKey([ilID_PERSONA.Buffer]) Then Begin
      InterForma1.NextTab(edID_PERSONA);
   End;
end;

procedure TwMProemio.btID_DOMICILIOClick(Sender: TObject);
begin
   Objeto.Domicilio.ShowAll := True;
   If Objeto.Domicilio.Busca Then Begin
      InterForma1.NextTab(edID_DOMICILIO);
   End;
end;

procedure TwMProemio.ilID_DOMICILIOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)or(InterForma1.IsNewData);
end;

procedure TwMProemio.ilID_DOMICILIOEjecuta(Sender: TObject);
begin
   If Objeto.Domicilio.FindKey([ilID_DOMICILIO.Buffer]) Then
      InterForma1.NextTab(edID_DOMICILIO);
end;

Function TwMProemio.ObtFolio(pCveFolio : String; pMsg : String): Integer;
var     STPObtFolios : TStoredProc;
        vlFolio     : Integer;
Begin
     vlFolio := 0;
     STPObtFolios := TStoredProc.Create(Nil);
     try
       with STPObtFolios do
       begin
          DatabaseName:= Objeto.Apli.DatabaseName;
          SessionName:= Objeto.Apli.SessionName;
          StoredProcName:='PKGCRDOCUMENTACION.STPOBTENFOLIO';

          Params.Clear;
          Params.CreateParam(ftFloat,'PEIDEMPRESA',ptInput);
          Params.CreateParam(ftString,'PECVEFOLIO',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Params.CreateParam(ftFloat,'RESULT',ptResult);
          ParamByName('PEIDEmpresa').AsInteger := Objeto.Apli.IdEmpresa;
          ParamByName('PECVEFolio').AsString := pCveFolio;
          ParamByName('PEBCommit').AsString := 'V';

          ExecProc;

          if (ParamByName('PSResultado').AsInteger = 0) then
          begin
               vlFolio := ParamByName('Result').AsInteger;
          end
          else
               ShowMessage('PROBLEMAS AL OBTENER EL ' + pMsg +
               IntToStr(ParamByName('PSResultado').AsInteger));
       end;
     finally
            STPObtFolios.Free;
     end;
     ObtFolio:= vlFolio;
end;

procedure TwMProemio.edACR_ESC_NOT_PUBKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
   If ((Pos(Key,'0123456789'#8)) = 0) Then Key := #0;
end;

procedure TwMProemio.edID_PERSONAKeyPress(Sender: TObject; var Key: Char);
begin
   If ((Pos(Key,'0123456789'#8)) = 0) Then Key := #0;
end;

procedure TwMProemio.edID_DOMICILIOKeyPress(Sender: TObject;
  var Key: Char);
begin
   If ((Pos(Key,'0123456789'#8)) = 0) Then Key := #0;
end;

procedure TwMProemio.edID_PERSONAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_PERSONA.GetFromControl;
      If Objeto.ID_PERSONA.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el identificador del acreditado';
      End;
      InterForma1.ValidaExit(edID_PERSONA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edOBJETO_SOCIALExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.OBJETO_SOCIAL.GetFromControl;
      If Objeto.OBJETO_SOCIAL.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el Objeto Social';
      End;
      InterForma1.ValidaExit(edOBJETO_SOCIAL,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edID_DOMICILIOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_DOMICILIO.GetFromControl;
      If Objeto.ID_DOMICILIO.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el domiciliio';
      End;
      InterForma1.ValidaExit(edID_DOMICILIO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edF_SOLICITUDExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.F_SOLICITUD.GetFromControl;
      If (Objeto.F_SOLICITUD.AsFloat = 0) Then Begin
         If InterForma1.IsNewData Then Begin
            If Objeto.F_SOLICITUD.AsDateTime < Objeto.Apli.DameFechaEmpresaDia('D000') Then Begin
               vlSalida   := False;
               vlMsg := 'La fecha de solicitud debe ser mayor al día de hoy';
            End;
         End Else Begin
            vlSalida   := False;
            vlMsg := 'Debe indicar la fecha de solicitud';
         End;
      End;
      InterForma1.ValidaExit(edF_SOLICITUD,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.btID_DOMICILIOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btID_DOMICILIO,True,CNULL,True);
end;

procedure TwMProemio.edACR_ESC_NUMEROExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ACR_ESC_NUMERO.GetFromControl;
      If Objeto.ACR_ESC_NUMERO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el número de la Escritura Constitutiva';
      End;
      InterForma1.ValidaExit(edACR_ESC_NUMERO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edACR_ESC_NOT_PUBExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ACR_ESC_NOT_PUB.GetFromControl;
      If Objeto.ACR_ESC_NOT_PUB.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el identificador del Notario Público';
      End;
      InterForma1.ValidaExit(edACR_ESC_NOT_PUB,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edACR_ESC_PLAZAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ACR_ESC_PLAZA.GetFromControl;
      If Objeto.ACR_ESC_PLAZA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la Plaza';
      End;
      InterForma1.ValidaExit(edACR_ESC_PLAZA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edACR_ESC_FECHAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ACR_ESC_FECHA.GetFromControl;
      If Objeto.ACR_ESC_FECHA.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la fecha de la Escritura Constitutiva';
      End;
      InterForma1.ValidaExit(edACR_ESC_FECHA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edACR_REG_PLAZAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ACR_REG_PLAZA.GetFromControl;
      If Objeto.ACR_REG_PLAZA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la plaza de la inscripción en el Registro Público de Comercio';
      End;
      InterForma1.ValidaExit(edACR_REG_PLAZA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edACR_REG_NUMEROExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ACR_REG_NUMERO.GetFromControl;
      If Objeto.ACR_REG_NUMERO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el número de inscripción en el Registro Público de Comercio';
      End;
      InterForma1.ValidaExit(edACR_REG_NUMERO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edACR_REG_FECHAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ACR_REG_FECHA.GetFromControl;
      If Objeto.ACR_REG_FECHA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la fecha de inscripción en el Registro Público de Comercio';
      End;
      InterForma1.ValidaExit(edACR_REG_FECHA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.rgSIT_SOLICITUDExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_SOLICITUD,True,CNULL,True);
end;

procedure TwMProemio.edNOM_REPRESEN_ACRExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.NOM_REPRESEN_ACR.GetFromControl;
      If Objeto.NOM_REPRESEN_ACR.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el nombre de los Representantes';
      End;
      InterForma1.ValidaExit(edNOM_REPRESEN_ACR,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edREP_A_ESC_NOT_PUExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.REP_A_ESC_NOT_PU.GetFromControl;
      If Objeto.REP_A_ESC_NOT_PU.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el identificador de Notario';
      End;
      InterForma1.ValidaExit(edREP_A_ESC_NOT_PU,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edREP_A_ESC_NUMEROExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.REP_A_ESC_NUMERO.GetFromControl;
      If Objeto.REP_A_ESC_NUMERO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el número de la Escritura Constitutiva';
      End;
      InterForma1.ValidaExit(edREP_A_ESC_NUMERO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edREP_A_ESC_PLAZAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.REP_A_ESC_PLAZA.GetFromControl;
      If Objeto.REP_A_ESC_PLAZA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la Plaza';
      End;
      InterForma1.ValidaExit(edREP_A_ESC_PLAZA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edREP_A_ESC_FECHAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.REP_A_ESC_FECHA.GetFromControl;
      If Objeto.REP_A_ESC_FECHA.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la fecha de la Escritura Constitutiva';
      End;
      InterForma1.ValidaExit(edREP_A_ESC_FECHA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edREP_A_REG_PLAZAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.REP_A_REG_PLAZA.GetFromControl;
      If Objeto.REP_A_REG_PLAZA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la plaza de inscripción en el Registro Público de Comercio';
      End;
      InterForma1.ValidaExit(edREP_A_REG_PLAZA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edREP_A_REG_NUMEROExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.REP_A_REG_NUMERO.GetFromControl;
      If Objeto.REP_A_REG_NUMERO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el número de inscripción en el Registro Público de Comercio';
      End;
      InterForma1.ValidaExit(edREP_A_REG_NUMERO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edREP_A_REG_FECHAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.REP_A_REG_FECHA.GetFromControl;
      If Objeto.REP_A_REG_FECHA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la fecha de inscripción en el Registro Público de Comercio';
      End;
      InterForma1.ValidaExit(edREP_A_REG_FECHA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edNOM_REPRESEN_BINExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.NOM_REPRESEN_BIN.GetFromControl;
      If Objeto.NOM_REPRESEN_BIN.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el nombre de los Representantes';
      End;
      InterForma1.ValidaExit(edNOM_REPRESEN_BIN,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edREP_B_ESC_NUMEROExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.REP_B_ESC_NUMERO.GetFromControl;
      If Objeto.REP_B_ESC_NUMERO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el número de la Escritura Constitutiva';
      End;
      InterForma1.ValidaExit(edREP_B_ESC_NUMERO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edREP_B_ESC_NOT_PUExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.REP_B_ESC_NOT_PU.GetFromControl;
      If Objeto.REP_B_ESC_NOT_PU.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el identificador de Notario';
      End;
      InterForma1.ValidaExit(edREP_B_ESC_NOT_PU,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edREP_B_ESC_PLAZAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.REP_B_ESC_PLAZA.GetFromControl;
      If Objeto.REP_B_ESC_PLAZA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la Plaza';
      End;
      InterForma1.ValidaExit(edREP_B_ESC_PLAZA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edREP_B_ESC_FECHAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.REP_B_ESC_FECHA.GetFromControl;
      If Objeto.REP_B_ESC_FECHA.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la fecha de la Escritura Constitutiva';
      End;
      InterForma1.ValidaExit(edREP_B_ESC_FECHA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edREP_B_REG_PLAZAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.REP_B_REG_PLAZA.GetFromControl;
      If Objeto.REP_B_REG_PLAZA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la plaza de inscripción en el Registro Público de Comercio';
      End;
      InterForma1.ValidaExit(edREP_B_REG_PLAZA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edREP_B_REG_NUMEROExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.REP_B_REG_NUMERO.GetFromControl;
      If Objeto.REP_B_REG_NUMERO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el número de inscripción en el Registro Público de Comercio';
      End;
      InterForma1.ValidaExit(edREP_B_REG_NUMERO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edREP_B_REG_FECHAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.REP_B_REG_FECHA.GetFromControl;
      If Objeto.REP_B_REG_FECHA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la fecha de inscripción en el Registro Público de Comercio';
      End;
      InterForma1.ValidaExit(edREP_B_REG_FECHA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edOPE_MONTOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.OPE_MONTO.GetFromControl;
      If Objeto.OPE_MONTO.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el monto del crédito';
      End;
      InterForma1.ValidaExit(edOPE_MONTO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edOPE_DESTINO_CREDExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.OPE_DESTINO_CRED.GetFromControl;
      If Objeto.OPE_DESTINO_CRED.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el destino del crédito';
      End;
      InterForma1.ValidaExit(edOPE_DESTINO_CRED,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edOPE_DISPOSICIONExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.OPE_DISPOSICION.GetFromControl;
      If Objeto.OPE_DISPOSICION.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la forma en que se diapondrá del crédito';
      End;
      InterForma1.ValidaExit(edOPE_DISPOSICION,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edOPE_COMISIONExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.OPE_COMISION.GetFromControl;
      If Objeto.OPE_COMISION.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la comisión';
      End;
      InterForma1.ValidaExit(edOPE_COMISION,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edOPE_F_VENCExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.OPE_F_VENC.GetFromControl;
      If Objeto.OPE_F_VENC.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la fecha de vencimiento';
      End;
      InterForma1.ValidaExit(edOPE_F_VENC,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edOPE_PAGO_CREDITOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.OPE_PAGO_CREDITO.GetFromControl;
      If Objeto.OPE_PAGO_CREDITO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la forma de pago';
      End;
      InterForma1.ValidaExit(edOPE_PAGO_CREDITO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edOPE_PAGO_INTERExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.OPE_PAGO_INTER.GetFromControl;
      If Objeto.OPE_PAGO_INTER.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el pago de intereses ordinarios';
      End;
      InterForma1.ValidaExit(edOPE_PAGO_INTER,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edOPE_TASA_INT_ORDExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.OPE_TASA_INT_ORD.GetFromControl;
      If Objeto.OPE_TASA_INT_ORD.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la tasa de interés ordinaria';
      End;
      InterForma1.ValidaExit(edOPE_TASA_INT_ORD,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edOPE_TASA_INT_MORExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.OPE_TASA_INT_MOR.GetFromControl;
      If Objeto.OPE_TASA_INT_MOR.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la tasa de interés moratorio';
      End;
      InterForma1.ValidaExit(edOPE_TASA_INT_MOR,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edOPE_GARANTIA_CREExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.OPE_GARANTIA_CRE.GetFromControl;
      If Objeto.OPE_GARANTIA_CRE.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la Garantía del crédito';
      End;
      InterForma1.ValidaExit(edOPE_GARANTIA_CRE,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.InterForma1DespuesEliminar(Sender: TObject);
Var
   sSQL: String;
begin
   sSQL:= 'DELETE CR_CT_CONTROL_IM WHERE ID_SOLICITUD='+ IntToStr(Objeto.iIdSolicitud);
   RunSQL(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
end;

procedure TwMProemio.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
begin
   Objeto.iIdSolicitud:= Objeto.ID_SOLICITUD.AsInteger;
   Realizado:= True;
end;

procedure TwMProemio.ilCVE_CTO_CREEjecuta(Sender: TObject);
begin
   If Objeto.MTpCto.FindKey([ilCVE_CTO_CRE.Buffer]) Then Begin
      ObtNomRep;
//      edTX_ENCABEZADO.Lines.Text := Objeto.MTpCto.MCatEncab.TX_ENCABEZADO.AsString;   
      InterForma1.NextTab(edCVE_CTO_CRE);
   End;
end;

procedure TwMProemio.ilCVE_CTO_CRECapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.IsNewData);
end;

procedure TwMProemio.btCVE_CTO_CREClick(Sender: TObject);
begin
   Objeto.MTpCto.BuscaWhereString := ' CR_CT_CONTRATO_C.SIT_CONTRATO =''AC'' ';
   Objeto.MTpCto.FilterString := Objeto.MTpCto.BuscaWhereString;
   Objeto.MTpCto.ShowAll := True;
   If Objeto.MTpCto.Busca Then Begin
      ObtNomRep;
      InterForma1.NextTab(edCVE_CTO_CRE);
   End;
end;

procedure TwMProemio.edCVE_CTO_CREExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_CTO_CRE.GetFromControl;
      If Objeto.CVE_CTO_CRE.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el tipo de contrato';
      End;
      InterForma1.ValidaExit(edCVE_CTO_CRE,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edACR_ESC_NOM_LICExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ACR_ESC_NOM_LIC.GetFromControl;
      If Objeto.ACR_ESC_NOM_LIC.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el nombre del Licenciado';
      End;
      InterForma1.ValidaExit(edACR_ESC_NOM_LIC,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edREP_B_ESC_NOM_LIExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.REP_B_ESC_NOM_LI.GetFromControl;
      If Objeto.REP_B_ESC_NOM_LI.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el Nombre del Licenciado';
      End;
      InterForma1.ValidaExit(edREP_B_ESC_NOM_LI,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProemio.edREP_A_ESC_NOM_LICExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.REP_A_ESC_NOM_LI.GetFromControl;
      If Objeto.REP_A_ESC_NOM_LI.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el nombre del Licenciado';
      End;
      InterForma1.ValidaExit(edREP_A_ESC_NOM_LIC,vlSalida,vlMsg,True);
   End;
end;

Procedure TwMProemio.ObtNomRep;
Var
   sSQL, sNombres: String; bPrimero: Boolean;
   qyQuery: TQuery;
Begin
   sSQL:='SELECT PERSONA.NOMBRE '+
         '  FROM CR_CT_CONTRATO_C, CR_CT_USU_FIRMA, USUARIO, PERSONA '+
         ' WHERE CR_CT_CONTRATO_C.CVE_CTO_CRE = '+ Objeto.CVE_CTO_CRE.AsSQL +
         '   AND CR_CT_CONTRATO_C.CVE_FIRMA = CR_CT_USU_FIRMA.CVE_FIRMA '+
         '   AND CR_CT_USU_FIRMA.CVE_TIPO_ROL =''AP'' '+
         '   AND CR_CT_USU_FIRMA.SIT_USU_FIRMA =''AC'' '+
         '   AND CR_CT_USU_FIRMA.CVE_USUARIO = USUARIO.CVE_USUARIO '+
         '   AND USUARIO.ID_PERSONA = PERSONA.ID_PERSONA';
   qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False );
   If qyQuery <> Nil Then Begin
      sNombres:='';
      bPrimero:=True;
      While not qyQuery.Eof Do Begin
         If bPrimero Then Begin
            sNombres:= qyQuery.FieldByName('NOMBRE').AsString;
            bPrimero:= False;
         End Else
            sNombres:= sNombres+ #44+ #13#10 +qyQuery.FieldByName('NOMBRE').AsString;
         qyQuery.Next;
      End;
      qyQuery.Free;
   End;
   edNOM_REPRESEN_BIN.Lines.Text:= sNombres;
End;
procedure TwMProemio.edOBJETO_SOCIALKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edACR_ESC_NUMEROKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edACR_ESC_NOM_LICKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edACR_ESC_PLAZAKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edACR_ESC_FECHAKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edACR_REG_NUMEROKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edACR_REG_PLAZAKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edACR_REG_FECHAKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edNOM_REPRESEN_ACRKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edREP_A_ESC_NUMEROKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edREP_A_ESC_NOT_PUKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edREP_A_ESC_NOM_LICKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edREP_A_ESC_PLAZAKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edREP_A_REG_NUMEROKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edREP_A_REG_PLAZAKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edNOM_REPRESEN_BINKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edREP_B_ESC_NUMEROKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edREP_B_ESC_NOT_PUKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edREP_B_ESC_NOM_LIKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edREP_B_ESC_PLAZAKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edREP_B_REG_NUMEROKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edREP_B_REG_PLAZAKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edOPE_DESTINO_CREDKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edOPE_DISPOSICIONKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edOPE_COMISIONKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edOPE_F_VENCKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edOPE_PAGO_CREDITOKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edOPE_PAGO_INTERKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edOPE_TASA_INT_ORDKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edOPE_TASA_INT_MORKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.edOPE_GARANTIA_CREKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMProemio.AltadeDomicilio1Click(Sender: TObject);
begin
      Objeto.Domicilio.GetParams(Objeto);
      Objeto.Domicilio.FindKey([Objeto.ID_DOMICILIO.AsString]);
      Objeto.Domicilio.Catalogo;
      Objeto.FindKey([Objeto.ID_SOLICITUD.AsString]);
end;

end.
