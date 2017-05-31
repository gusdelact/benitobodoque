{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// Sistema         : Clase de CR_GA_SOL_FEGA
// Fecha de Inicio : 29/06/2004
// Función forma   : Clase de CR_GA_SOL_FEGA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrGaSoFe;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit,

IntGenCre,
IntParamCre,    // Parámetros de Crédito
IntCrFiCaPa,    // Catálogo de FIRA Causa de Pago
IntCrFiCaSe,    // Catálogo FIRA Seguros
IntCrFiCoIn,    // Catálogo FIRA Concepto Inversión
IntCrGaSoLi,    // Solicitud de Garantía Liquida
IntMQrFmt8FIRA, // Formato 8 de FIRA
IntMQrFmt9FIRA, // Formato 9 de FIRA
IntCrCredito;   //Alta de solicitudes de Disposición / DISPOSICION

Type
 TCrGaSoFe= class; 

  TWCrGaSolFega=Class(TForm)
    InterForma1             : TInterForma;
    lblID_SOLICITUD: TLabel;
    lblID_CREDITO: TLabel;
    lblNUM_PERIODO: TLabel;
    Label11: TLabel;
    lblF_ALTA: TLabel;
    lblF_MODIFICA: TLabel;
    lblCVE_USU_MODIFICA: TLabel;
    lblCVE_USU_ALTA: TLabel;
    Label9: TLabel;
    lblCVE_SEGURO: TLabel;
    Label29: TLabel;
    lblCVE_CAUSA: TLabel;
    GroupBox1: TGroupBox;
    lbCAMPO1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    lblIMP_OTROS: TLabel;
    edID_CREDITO: TEdit;
    btnID_SOLIC_LIQ: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    edID_SOLICITUD: TEdit;
    edNUM_PERIODO: TEdit;
    rgCVE_SITUACION_FI: TRadioGroup;
    edDESC_SEGURO: TEdit;
    edDESC_CON_INV: TEdit;
    GroupBox2: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    edF1_RECUPERA: TEdit;
    edF2_RECUPERA: TEdit;
    dtpF2_RECUPERA: TInterDateTimePicker;
    rgSIT_GAR_SOL_FEG: TRadioGroup;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    GroupBox3: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    lblIMP_APLICADO: TLabel;
    edF_MAX_SOLICITAR: TEdit;
    dtF_INICIAL: TInterDateTimePicker;
    Edit20: TEdit;
    InterDateTimePicker3: TInterDateTimePicker;
    edIMP_APLICADO_FEGA: TInterEdit;
    btnFmt8FIRA: TBitBtn;
    btnFmt9FIRA: TBitBtn;
    btnCancela: TBitBtn;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edDESC_CAUS_PAG: TEdit;
    edCVE_SEGURO: TEdit;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    edCVE_CONT_INV: TEdit;
    btnCVE_SEGURO: TBitBtn;
    btnCVE_CONT_INV: TBitBtn;
    dtpF1_RECUPERA: TInterDateTimePicker;
    edIMP_PRODUCTOS: TInterEdit;
    edIMP_SEGUROS: TInterEdit;
    edIMP_FINCAS: TInterEdit;
    edIMP_AVALES: TInterEdit;
    edIMP_GTIA_GRAVAD: TInterEdit;
    edIMP_OTROS: TInterEdit;
    edTXT_UN: TEdit;
    ilCVE_SEGURO: TInterLinkit;
    ilCVE_CONT_INV: TInterLinkit;
    edID_SOLIC_LIQ: TEdit;
    Label1: TLabel;
    ilID_SOLIC_LIQ: TInterLinkit;
    edIMP1_RECUPERA: TInterEdit;
    edIMP2_RECUPERA: TInterEdit;
    edIMP_SDO_VENCIDO: TInterEdit;
    edIMP_RECUPERACIONES: TInterEdit;
    edIMP_SOLICITAR: TInterEdit;
    edCVE_CAUS_PAG: TEdit;
    btnCVE_CAUS_PAG: TBitBtn;
    ilCVE_CAUSA_PAG: TInterLinkit;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    edDIAS_MORAS_PROY: TInterEdit;
    Label3: TLabel;
    Label10: TLabel;
    edID_CONTROL_EXT: TEdit;
    edID_CRED_EXTERNO: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btnCVE_CAUS_PAGClick(Sender: TObject);
    procedure btnCVE_SEGUROClick(Sender: TObject);
    procedure btnCVE_CONT_INVClick(Sender: TObject);
    procedure ilCVE_CAUS_PAGCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_CAUS_PAGEjecuta(Sender: TObject);
    procedure ilCVE_SEGUROEjecuta(Sender: TObject);
    procedure ilCVE_CONT_INVEjecuta(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btnID_SOLIC_LIQClick(Sender: TObject);
    procedure ilID_SOLIC_LIQEjecuta(Sender: TObject);
    procedure edIMP_PRODUCTOSExit(Sender: TObject);
    procedure edID_SOLIC_LIQExit(Sender: TObject);
    procedure edCVE_CAUS_PAGExit(Sender: TObject);
    procedure edCVE_SEGUROExit(Sender: TObject);
    procedure edCVE_CONT_INVExit(Sender: TObject);
    procedure edTXT_UNExit(Sender: TObject);
    procedure rgCVE_SITUACION_FIExit(Sender: TObject);
    procedure edF1_RECUPERAExit(Sender: TObject);
    procedure btnFmt8FIRAClick(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure btnFmt9FIRAClick(Sender: TObject);
    procedure edDIAS_MORAS_PROYExit(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure edIMP_PRODUCTOSEnter(Sender: TObject);
    private
    { Private declarations }
      m_Importe : Double;
      procedure SumaRecuperaciones;
      procedure BuscaAcreditado;
      function  ObtenImpAdeudo : Double;
      procedure CalculaImporteFEGA;
    public
    { Public declarations }
    Objeto : TCrGaSoFe;
end;
 TCrGaSoFe= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_SOLICITUD             : TInterCampo;
        ID_SOLIC_LIQ             : TInterCampo;
        IMP_SDO_VENCIDO          : TInterCampo;
        ID_CREDITO               : TInterCampo;
        NUM_PERIODO              : TInterCampo;
        IMP_SOLICITAR            : TInterCampo;
        IMP_APLICADO             : TInterCampo;
        CVE_CAUS_PAG             : TInterCampo;
        CVE_SEGURO               : TInterCampo;
        CVE_CONT_INV             : TInterCampo;
        TXT_UN                   : TInterCampo;
        IMP_PRODUCTOS            : TInterCampo;
        IMP_SEGUROS              : TInterCampo;
        IMP_FINCAS               : TInterCampo;
        IMP_AVALES               : TInterCampo;
        IMP_GTIA_GRAVAD          : TInterCampo;
        IMP_OTROS                : TInterCampo;
        IMP_MORAS_PROY           : TInterCampo;
        F1_RECUPERA              : TInterCampo;
        IMP1_RECUPERA            : TInterCampo;
        F2_RECUPERA              : TInterCampo;
        IMP2_RECUPERA            : TInterCampo;
        SIT_GAR_SOL_FEG          : TInterCampo;
        DIAS_MORAS_PROY          : TInterCampo;
        F_MAX_SOLICITAR          : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        CVE_SITUACION_FI         : TInterCampo;

        IMP_RECUPERACIONES       : TInterCampo;

        m_nID_SOLIC_LIQ : Integer;
        m_nID_CREDITO   : Integer;
        m_nNUM_PERIODO  : Integer;

        ParamCre      : TParamCre;
        CausaPago     : TCrFiCaPa;
        CausaSeguro   : TCrFiCaSe;
        ConceptoInv   : TCrFiCoIn;
        SolicitudLiq   : TCrGaSoLi;
        Credito       : TCrCredito;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    InsertaSolicitudFEGA : Boolean;
        Function    InternalPost : Boolean; override;
        function    ObtenImporteFEGA(peID_SOLICITUD : Integer; peIMP_RECUPERADO_ADIC, peIMP_MORAS_PROYEC : Double; 
                                     var psRESULTADO : Integer; var psTX_RESULTADO : String) : Double;
        function    ErrorCancelaSolicitud : Boolean;
        function    ObtenMorasProyectadas(pDIAS_MORAS_PROY : Integer) : Double;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrGaSoFe.Create( AOwner : TComponent );
begin Inherited; 
      ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
                ID_SOLICITUD.Caption:='Número de Solicitud';
      ID_SOLIC_LIQ :=CreaCampo('ID_SOLIC_LIQ',ftFloat,tsNinguno,tsNinguno,True);
                ID_SOLIC_LIQ.Caption:='Número de Solic Liq';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      NUM_PERIODO :=CreaCampo('NUM_PERIODO',ftFloat,tsNinguno,tsNinguno,True);
                NUM_PERIODO.Caption:='Número Periodo';
      IMP_SOLICITAR :=CreaCampo('IMP_SOLICITAR',ftFloat,tsNinguno,tsNinguno,True);
                IMP_SOLICITAR.Caption:='Imp Solicitado';
      IMP_APLICADO :=CreaCampo('IMP_APLICADO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_APLICADO.Caption:='Imp Aplicado';
      CVE_CAUS_PAG :=CreaCampo('CVE_CAUS_PAG',ftString,tsNinguno,tsNinguno,True);
                CVE_CAUS_PAG.Caption:='Clave Causa de Pago';
      CVE_SEGURO :=CreaCampo('CVE_SEGURO',ftString,tsNinguno,tsNinguno,True);
                CVE_SEGURO.Caption:='Clave de Seguro';
      CVE_CONT_INV :=CreaCampo('CVE_CONT_INV',ftString,tsNinguno,tsNinguno,True);
                CVE_CONT_INV.Caption:='Clave Concepto de Inversion';
      TXT_UN :=CreaCampo('TXT_UN',ftString,tsNinguno,tsNinguno,True);
                TXT_UN.Caption:='Txt Un';
      IMP_PRODUCTOS :=CreaCampo('IMP_PRODUCTOS',ftFloat,tsNinguno,tsNinguno,True);
                IMP_PRODUCTOS.Caption:='Imp Productos';
      IMP_SEGUROS :=CreaCampo('IMP_SEGUROS',ftFloat,tsNinguno,tsNinguno,True);
                IMP_SEGUROS.Caption:='Imp Seguros';
      IMP_FINCAS :=CreaCampo('IMP_FINCAS',ftFloat,tsNinguno,tsNinguno,True);
                IMP_FINCAS.Caption:='Imp Fincas';
      IMP_AVALES :=CreaCampo('IMP_AVALES',ftFloat,tsNinguno,tsNinguno,True);
                IMP_FINCAS.Caption:='Imp Avales';
      IMP_GTIA_GRAVAD :=CreaCampo('IMP_GTIA_GRAVAD',ftFloat,tsNinguno,tsNinguno,True);
                IMP_GTIA_GRAVAD.Caption:='Imp Gtia Gravad';
      IMP_OTROS :=CreaCampo('IMP_OTROS',ftFloat,tsNinguno,tsNinguno,True);
                IMP_OTROS.Caption:='Imp Otros';
      IMP_MORAS_PROY :=CreaCampo('IMP_MORAS_PROY',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MORAS_PROY.Caption:='Imp Otros';
      F1_RECUPERA :=CreaCampo('F1_RECUPERA',ftDate,tsNinguno,tsNinguno,True);
                F1_RECUPERA.Caption:='F1 Recupera';
      IMP1_RECUPERA :=CreaCampo('IMP1_RECUPERA',ftFloat,tsNinguno,tsNinguno,True);
                IMP1_RECUPERA.Caption:='Imp1 Recupera';
      F2_RECUPERA :=CreaCampo('F2_RECUPERA',ftDate,tsNinguno,tsNinguno,True);
                F2_RECUPERA.Caption:='F2 Recupera';
      IMP2_RECUPERA :=CreaCampo('IMP2_RECUPERA',ftFloat,tsNinguno,tsNinguno,True);
                IMP2_RECUPERA.Caption:='Imp2 Recupera';
      IMP_SDO_VENCIDO :=CreaCampo('IMP_SDO_VENCIDO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_SDO_VENCIDO.Caption:='Imp Sdo Vencido';
      SIT_GAR_SOL_FEG :=CreaCampo('SIT_GAR_SOL_FEG',ftString,tsNinguno,tsNinguno,True);
                SIT_GAR_SOL_FEG.Caption:='Situación Gar Sol Feg';
      With SIT_GAR_SOL_FEG Do
      begin
        Size:=5;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_LQ);
        ComboLista.Add('2'); ComboDatos.Add(CSIT_RE);
        ComboLista.Add('3'); ComboDatos.Add(CSIT_CA);
        ComboLista.Add('4'); ComboDatos.Add('DF');
        ComboLista.Add('5'); ComboDatos.Add('OF');        
      end;
      DIAS_MORAS_PROY :=CreaCampo('DIAS_MORAS_PROY',ftFloat,tsNinguno,tsNinguno,True);
                DIAS_MORAS_PROY.Caption:='Dias Moratorios Proyectados';
      F_MAX_SOLICITAR :=CreaCampo('F_MAX_SOLICITAR',ftDate,tsNinguno,tsNinguno,True);
                F_MAX_SOLICITAR.Caption:='Fecha Máxima a Solicitar';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      CVE_SITUACION_FI :=CreaCampo('CVE_SITUACION_FI',ftString,tsNinguno,tsNinguno,True);
      With CVE_SITUACION_FI do
      begin
        Size:=6;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add('VP');
        ComboLista.Add('1'); ComboDatos.Add('DP');
        ComboLista.Add('2'); ComboDatos.Add('JU');
        ComboLista.Add('3'); ComboDatos.Add('VA');
        ComboLista.Add('4'); ComboDatos.Add('EX');
        ComboLista.Add('5'); ComboDatos.Add('IN');
      end;

      IMP_RECUPERACIONES :=CreaCampo('IMP_RECUPERACIONES',ftFloat,tsNinguno,tsNinguno,False);

      FKeyFields.Add('ID_SOLICITUD');
      FKeyFields.Add('ID_SOLIC_LIQ');
      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('NUM_PERIODO');

      TableName := 'CR_GA_SOL_FEGA';
      UseQuery := True;
      HelpFile := 'IntCrGaSoFe.Hlp';

      CausaPago := TCrFiCaPa.Create(Self);
      CausaPago.MasterSource:=Self;
      CausaPago.FieldByName('CVE_CAUS_PAG').MasterField := 'CVE_CAUS_PAG';
      CausaPago.ShowAll := True;

      CausaSeguro := TCrFiCaSe.Create(Self);
      CausaSeguro.MasterSource:=Self;
      CausaSeguro.FieldByName('CVE_SEGURO').MasterField:='CVE_SEGURO';
      CausaSeguro.ShowAll := True;

      ConceptoInv := TCrFiCoIn.Create(Self);
      ConceptoInv.MasterSource:=Self;
      ConceptoInv.FieldByName('CVE_CONT_INV').MasterField:='CVE_CONT_INV';
      ConceptoInv.ShowAll := True;

      SolicitudLiq := TCrGaSoLi.Create(Self);
      SolicitudLiq.MasterSource:=Self;
      SolicitudLiq.FieldByName('ID_SOLICITUD').MasterField := 'ID_SOLIC_LIQ';
      SolicitudLiq.BuscaWhereString := 'CR_GA_SOL_LIQ.SIT_GAR_SOL_LIQ = '+SQLStr(CSIT_LQ);

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField := 'ID_CREDITO';
      Credito.ShowAll := True;

      m_nID_SOLIC_LIQ := 0;
      m_nID_CREDITO   := 0;
      m_nNUM_PERIODO  := 0;
end;

Destructor TCrGaSoFe.Destroy;
begin
 If Assigned(CausaPago) Then CausaPago.Free;
 If Assigned(CausaSeguro) Then CausaSeguro.Free;
 If Assigned(ConceptoInv) Then ConceptoInv.Free;
 If Assigned(SolicitudLiq) Then SolicitudLiq.Free;
 If Assigned(Credito) Then Credito.Free;
 Inherited;
end;


function TCrGaSoFe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGaSolFega;
begin
   W:=TWCrGaSolFega.Create(Self);
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


Function TCrGaSoFe.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrGaSF.it','F,F,F,F');
      Try if Active then begin T.Param(0,ID_SOLICITUD.AsString);
                               T.Param(1,ID_SOLIC_LIQ.AsString);
                               T.Param(2,ID_CREDITO.AsString);
                               T.Param(3,NUM_PERIODO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
      finally  T.Free;
      end;
end;

function TCrGaSoFe.InternalPost: Boolean;
begin
  If (Modo = moAppend) then
    Try
      Result := InsertaSolicitudFEGA;
    Except
      On e: exception do
      Begin
       Beep;Beep;Beep;Beep;
       ShowMessage('Problemas con el Alta de la Solicitud FEGA. Avise a Sistemas');
       ShowMessage(e.Message);
      End;
    End
  Else
   Result := Inherited InternalPost;
end;

function TCrGaSoFe.InsertaSolicitudFEGA : Boolean;
var stpSolicitudFEGA : TStoredProc;
begin
  Result := True;
  stpSolicitudFEGA := TStoredProc.Create(Nil);
  With stpSolicitudFEGA Do
    Try
        DatabaseName := Apli.DataBaseName;
        SessionName := Apli.SessionName;
        StoredProcName := 'PKGCRCREDITOO1.STP_ALTA_SOL_FEGA';

        Params.Clear;
        Params.CreateParam(ftInteger,'PEID_SOLIC_LIQ',ptInput);
        Params.CreateParam(ftString,'PECVE_CAUS_PAG',ptInput);
        Params.CreateParam(ftString,'PECVE_SEGURO',ptInput);
        Params.CreateParam(ftString,'PECVE_CONT_INV',ptInput);
        Params.CreateParam(ftString,'PETXT_UN',ptInput);
        Params.CreateParam(ftFloat,'PEIMP_PRODUCTOS',ptInput);
        Params.CreateParam(ftFloat,'PEIMP_SEGUROS',ptInput);
        Params.CreateParam(ftFloat,'PEIMP_FINCAS',ptInput);
        Params.CreateParam(ftFloat,'PEIMP_GTIA_GRAVAD',ptInput);
        Params.CreateParam(ftFloat,'PEIMP_OTROS',ptInput);
        Params.CreateParam(ftString,'PECVE_SITUACION_FI',ptInput);
        Params.CreateParam(ftDate,'PEF1_RECUPERA',ptInput);
        Params.CreateParam(ftFloat,'PEIMP1_RECUPERA',ptInput);
        Params.CreateParam(ftDate,'PEF2_RECUPERA',ptInput);
        Params.CreateParam(ftFloat,'PEIMP2_RECUPERA',ptInput);
        Params.CreateParam(ftFloat,'PEIMP_SDO_VENCIDO',ptInput);
        Params.CreateParam(ftInteger,'PEDIAS_MORAS_PROY',ptInput);
        Params.CreateParam(ftDate,'PEF_ALTA',ptInput);
        Params.CreateParam(ftString,'PECVE_USU_ALTA',ptInput);
        Params.CreateParam(ftString,'PSSIT_GAR_SOL_FEG',ptOutput);
        Params.CreateParam(ftInteger,'PESID_SOLICITUD',ptInputOutput);
        Params.CreateParam(ftString,'PEB_COMMIT',ptInput);
        Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTX_RESULTADO',ptOutput);

        ID_SOLIC_LIQ.GetFromControl;
        IMP_SOLICITAR.GetFromControl;
        IMP_APLICADO.GetFromControl;
        CVE_CAUS_PAG.GetFromControl;
        CVE_SEGURO.GetFromControl;
        CVE_CONT_INV.GetFromControl;
        TXT_UN.GetFromControl;
        IMP_PRODUCTOS.GetFromControl;
        IMP_SEGUROS.GetFromControl;
        IMP_FINCAS.GetFromControl;
        IMP_GTIA_GRAVAD.GetFromControl;
        IMP_OTROS.GetFromControl;
        CVE_SITUACION_FI.GetFromControl;
        F1_RECUPERA.GetFromControl;
        IMP1_RECUPERA.GetFromControl;
        F2_RECUPERA.GetFromControl;
        IMP2_RECUPERA.GetFromControl;
        IMP_SDO_VENCIDO.GetFromControl;
        DIAS_MORAS_PROY.GetFromControl;        
        SIT_GAR_SOL_FEG.GetFromControl;

        ParamByName('PEID_SOLIC_LIQ').AsInteger := ID_SOLIC_LIQ.AsInteger;
        ParamByName('PECVE_CAUS_PAG').AsString := CVE_CAUS_PAG.AsString;
        ParamByName('PECVE_SEGURO').AsString := CVE_SEGURO.AsString;
        ParamByName('PECVE_CONT_INV').AsString := CVE_CONT_INV.AsString;
        ParamByName('PETXT_UN').AsString := TXT_UN.AsString;
        ParamByName('PEIMP_PRODUCTOS').AsFloat := IMP_PRODUCTOS.AsFloat;
        ParamByName('PEIMP_SEGUROS').AsFloat := IMP_SEGUROS.AsFloat;
        ParamByName('PEIMP_FINCAS').AsFloat := IMP_FINCAS.AsFloat;
        ParamByName('PEIMP_GTIA_GRAVAD').AsFloat := IMP_GTIA_GRAVAD.AsFloat;
        ParamByName('PEIMP_OTROS').AsFloat := IMP_OTROS.AsFloat;
        ParamByName('PECVE_SITUACION_FI').AsString := CVE_SITUACION_FI.AsString;

        If (Not F1_RECUPERA.IsNull) Then
          ParamByName('PEF1_RECUPERA').AsDateTime := F1_RECUPERA.AsDateTime;

        If (Not IMP1_RECUPERA.IsNull) Then
          ParamByName('PEIMP1_RECUPERA').AsFloat := IMP1_RECUPERA.AsFloat;

        If (Not F2_RECUPERA.IsNull) Then
         ParamByName('PEF2_RECUPERA').AsDateTime := F2_RECUPERA.AsDateTime;

        If (Not IMP2_RECUPERA.IsNull) Then
         ParamByName('PEIMP2_RECUPERA').AsFloat := IMP2_RECUPERA.AsFloat;

        ParamByName('PEIMP_SDO_VENCIDO').AsFloat := IMP_SDO_VENCIDO.AsFloat;
        ParamByName('PEDIAS_MORAS_PROY').AsInteger := DIAS_MORAS_PROY.AsInteger; 
        ParamByName('PEF_ALTA').AsDateTime := Apli.DameFechaEmpresa;
        ParamByName('PECVE_USU_ALTA').AsString := Apli.Usuario;
        ParamByName('PEB_COMMIT').AsString := CVERDAD;
        ExecProc;

        If (ParamByName('PSRESULTADO').AsInteger <> 0) Then
         ShowMEssage(ParamByName('PSTX_RESULTADO').AsString)
        Else
         Begin
         ID_SOLICITUD.AsInteger := ParamByName('PESID_SOLICITUD').AsInteger;
         SIT_GAR_SOL_FEG.AsString := ParamByName('PSSIT_GAR_SOL_FEG').AsString;
         Result := True;
         End;
   Finally
     stpSolicitudFEGA.Free;
   End;
end;

function TCrGaSoFe.ObtenImporteFEGA(peID_SOLICITUD : Integer; peIMP_RECUPERADO_ADIC, peIMP_MORAS_PROYEC : Double; 
                          var psRESULTADO : Integer; var psTX_RESULTADO : String) : Double;
var stpObtImpSolFEGA : TStoredProc;
begin
  Result := 0;
  stpObtImpSolFEGA := TStoredProc.Create(Nil);
  If Assigned(stpObtImpSolFEGA) Then
    With stpObtImpSolFEGA Do
     Try
      DatabaseName := Apli.DatabaseName;
      SessionName := Apli.SessionName;
      StoredProcName := 'PKGCRCREDITOO1.STP_OBT_IMP_SOL_FEGA';

      Params.Clear;
      Params.CreateParam(ftInteger,'PEID_SOLICITUD',ptInput);
      Params.CreateParam(ftFloat,'PEIMP_RECUPERADO_ADIC',ptInput);
      Params.CreateParam(ftFloat,'PEIMP_MORAS_PROYEC',ptInput);
      Params.CreateParam(ftFloat,'PSIMP_SOLICITAR',ptOutput);
      Params.CreateParam(ftFloat,'psPCT_GTIA_FEGA_NO',ptOutput);
      Params.CreateParam(ftFloat,'psPCT_GTIA_FEGA_EF',ptOutput);
      Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
      Params.CreateParam(ftString,'PSTX_RESULTADO',ptOutput);

      ParamByName('PEID_SOLICITUD').AsInteger := peID_SOLICITUD;
      ParamByName('PEIMP_RECUPERADO_ADIC').AsFloat := peIMP_RECUPERADO_ADIC;
      ParamByName('PEIMP_MORAS_PROYEC').AsFloat := peIMP_MORAS_PROYEC;
      ExecProc;
    
      Result := ParamByName('PSIMP_SOLICITAR').AsFloat;
      psRESULTADO := ParamByName('PSRESULTADO').AsInteger;
      psTX_RESULTADO := ParamByName('PSTX_RESULTADO').AsString;
     Finally
      stpObtImpSolFEGA.Free;
     End;
end;

function TCrGaSoFe.ErrorCancelaSolicitud : Boolean;
var stpCancelaSolicitud : TStoredProc;
begin
   Result := False;
   If Active Then
     Begin
       stpCancelaSolicitud := TStoredProc.Create(Nil);
       With stpCancelaSolicitud Do
        Try
          DatabaseName := Apli.DataBaseName;
          SessionName := Apli.SessionName;
          StoredProcName := 'PKGCRCREDITOO1.STP_CANC_SOL_FEGA';

          Params.Clear;
          Params.CreateParam(ftInteger,'PEID_SOLICITUD',ptInput);
          Params.CreateParam(ftString,'peCVE_USU_MODIFICA',ptInput);
          Params.CreateParam(ftDate,'peF_MODIFICA',ptInput);
          Params.CreateParam(ftString,'PEB_COMMIT',ptInput);
          Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTX_RESULTADO',ptOutput);

          ParamByName('PEID_SOLICITUD').AsInteger := ID_SOLICITUD.AsInteger;
          ParamByName('peCVE_USU_MODIFICA').AsString := Apli.Usuario;
          ParamByName('peF_MODIFICA').AsDate := Apli.DameFechaEmpresa;
          ParamByName('PEB_COMMIT').AsString := CVERDAD;
          ExecProc;

          If (ParamByName('PSRESULTADO').AsInteger <> 0) Then
           Begin
           ShowMessage(ParamByName('PSTX_RESULTADO').AsString);
           Result := True;
           End;

        Finally
          stpCancelaSolicitud.Free;
        End;
     End;
end;


function TCrGaSoFe.ObtenMorasProyectadas(pDIAS_MORAS_PROY : Integer) : Double;
var stpObtMorasProyecXCap : TStoredProc;
begin
   Result := 0;
   If Active Then
     Begin
       stpObtMorasProyecXCap := TStoredProc.Create(Nil);
       With stpObtMorasProyecXCap Do
        Try
          DatabaseName := Apli.DataBaseName;
          SessionName := Apli.SessionName;
          StoredProcName := 'PKGCRCREDITOO1.STP_OBT_MORAS_PROYEC_X_CAP';
          Params.Clear;
          Params.CreateParam(ftInteger,'PEID_CREDITO',ptInput);
          Params.CreateParam(ftInteger,'PENUM_PERIODO_K',ptInput);
          Params.CreateParam(ftInteger,'PEDIAS_PROYEC',ptInput);
          Params.CreateParam(ftFloat,'PSMORAS_K',ptOutput);
          Params.CreateParam(ftFloat,'PSMORAS_IVA_K',ptOutput);
          Params.CreateParam(ftFloat,'PSMORAS_F',ptOutput);
          Params.CreateParam(ftFloat,'PSMORAS_IVA_F',ptOutput);
          Params.CreateParam(ftFloat,'PSMORAS_C',ptOutput);
          Params.CreateParam(ftFloat,'PSMORAS_IVA_C',ptOutput);
          Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftFloat,'PSTX_RESULTADO',ptOutput);

          ParamByName('PEID_CREDITO').AsInteger := SolicitudLiq.ID_CREDITO.AsInteger;
          ParamByName('PENUM_PERIODO_K').AsInteger := SolicitudLiq.NUM_PERIODO.AsInteger;
          ParamByName('PEDIAS_PROYEC').AsFloat := pDIAS_MORAS_PROY;
          ExecProc;

          If (ParamByName('PSRESULTADO').AsInteger <> 0) Then
            ShowMessage(ParamByName('PSTX_RESULTADO').AsString)
          Else
            Result := ParamByName('PSMORAS_K').AsFloat + ParamByName('PSMORAS_IVA_K').AsFloat +
                      ParamByName('PSMORAS_F').AsFloat + ParamByName('PSMORAS_IVA_F').AsFloat +
                      ParamByName('PSMORAS_C').AsFloat + ParamByName('PSMORAS_IVA_C').AsFloat;
        Finally
          If Assigned(stpObtMorasProyecXCap) Then stpObtMorasProyecXCap.Free;
        End;
     End;
end;



(***********************************************FORMA CR_GA_SOL_FEGA********************)
(*                                                                              *)
(*  FORMA DE CR_GA_SOL_FEGA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_SOL_FEGA********************)

procedure TWCrGaSolFega.FormShow(Sender: TObject);
begin
  With Objeto Do
   Begin
   ID_SOLIC_LIQ.Control:=edID_SOLIC_LIQ;
   ID_SOLICITUD.Control:=edID_SOLICITUD;
   ID_CREDITO.Control:=edID_CREDITO;
   NUM_PERIODO.Control:=edNUM_PERIODO;
   IMP_SOLICITAR.Control:=edIMP_SOLICITAR;
   IMP_APLICADO.Control:=edIMP_APLICADO_FEGA;
   CVE_CAUS_PAG.Control:=edCVE_CAUS_PAG;
   CVE_SEGURO.Control:=edCVE_SEGURO;
   CVE_CONT_INV.Control:=edCVE_CONT_INV;
   TXT_UN.Control:=edTXT_UN;
   IMP_PRODUCTOS.Control:=edIMP_PRODUCTOS;
   IMP_SEGUROS.Control:=edIMP_SEGUROS;
   IMP_FINCAS.Control:=edIMP_FINCAS;
   IMP_AVALES.Control:=edIMP_AVALES;
   IMP_GTIA_GRAVAD.Control:=edIMP_GTIA_GRAVAD;
   IMP_OTROS.Control:=edIMP_OTROS;
   F1_RECUPERA.Control:=edF1_RECUPERA;
   IMP1_RECUPERA.Control:=edIMP1_RECUPERA;
   F2_RECUPERA.Control:=edF2_RECUPERA;
   IMP2_RECUPERA.Control:=edIMP2_RECUPERA;
   IMP_SDO_VENCIDO.Control:=edIMP_SDO_VENCIDO;
   DIAS_MORAS_PROY.Control:=edDIAS_MORAS_PROY;
   F_MAX_SOLICITAR.Control := edF_MAX_SOLICITAR;   
   F_ALTA.Control:=edF_ALTA;
   CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
   F_MODIFICA.Control:=edF_MODIFICA;
   CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;
   CVE_SITUACION_FI.Control := rgCVE_SITUACION_FI;
   SIT_GAR_SOL_FEG.Control := rgSIT_GAR_SOL_FEG;

   IMP_RECUPERACIONES.Control := edIMP_RECUPERACIONES;

   lbDempresa.Caption := ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := ParamCre.FECHA.AsString;
   lbDUsuario.Caption := ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

   SolicitudLiq.ID_CREDITO.Control := edID_CREDITO;
   SolicitudLiq.NUM_PERIODO.Control := edNUM_PERIODO;
   SolicitudLiq.IMP_APLICADO.Control := edIMP_AVALES;

   CausaPago.DESC_CAUS_PAG.Control     := edDESC_CAUS_PAG;
   CausaSeguro.DESC_SEGURO.Control     := edDESC_SEGURO;
   ConceptoInv.DESC_CON_INV.Control   := edDESC_CON_INV;

   Credito.ID_CONTROL_EXT.Control := edID_CONTROL_EXT;
   Credito.ID_CRED_EXTERNO.Control := edID_CRED_EXTERNO;
   BuscaAcreditado;
   SumaRecuperaciones;

   Interforma1.MsgPanel := MsgPanel;
   End;
end;

procedure TWCrGaSolFega.FormDestroy(Sender: TObject);
begin
  With Objeto Do
   Begin
   ID_SOLICITUD.Control     := Nil;
   ID_SOLIC_LIQ.Control     := Nil;
   ID_CREDITO.Control       := Nil;
   NUM_PERIODO.Control      := Nil;
   IMP_SOLICITAR.Control   := Nil;
   IMP_APLICADO.Control     := Nil;
   CVE_CAUS_PAG.Control     := Nil;
   CVE_SEGURO.Control       := Nil;
   CVE_CONT_INV.Control     := Nil;
   TXT_UN.Control           := Nil;
   IMP_PRODUCTOS.Control    := Nil;
   IMP_SEGUROS.Control      := Nil;
   IMP_AVALES.Control       := Nil;
   IMP_FINCAS.Control       := Nil;
   IMP_GTIA_GRAVAD.Control  := Nil;
   IMP_OTROS.Control        := Nil;
   F1_RECUPERA.Control      := Nil;
   IMP1_RECUPERA.Control    := Nil;
   F2_RECUPERA.Control      := Nil;
   IMP2_RECUPERA.Control    := Nil;
   IMP_SDO_VENCIDO.Control  := Nil;
   CVE_SITUACION_FI.Control := Nil;
   SIT_GAR_SOL_FEG.Control  := Nil;
   DIAS_MORAS_PROY.Control  := Nil;
   F_ALTA.Control           := Nil;
   F_MAX_SOLICITAR.Control  := Nil;
   CVE_USU_ALTA.Control     := Nil;
   F_MODIFICA.Control       := Nil;
   CVE_USU_MODIFICA.Control := Nil;

   IMP_RECUPERACIONES.Control := Nil;

   SolicitudLiq.ID_CREDITO.Control   := Nil;
   SolicitudLiq.NUM_PERIODO.Control  := Nil;
   SolicitudLiq.IMP_APLICADO.Control := Nil;
   CausaPago.DESC_CAUS_PAG.Control   := Nil;
   CausaSeguro.DESC_SEGURO.Control   := Nil;
   ConceptoInv.DESC_CON_INV.Control  := Nil;
   Credito.ID_CONTROL_EXT.Control := Nil;
   Credito.ID_CRED_EXTERNO.Control := Nil;
   End;
   //Objeto
end;

function TWCrGaSolFega.ObtenImpAdeudo : Double;
var stpObtSolLiqAdeudo : TStoredProc;
begin
  Result := 0;
  stpObtSolLiqAdeudo := TStoredProc.Create(Nil);
  If Assigned(stpObtSolLiqAdeudo) Then
    With stpObtSolLiqAdeudo Do
      Try
        DatabaseName := Objeto.Apli.DataBaseName;
        SessionName := Objeto.Apli.SessionName;
        StoredProcName := 'PKGCRCREDITOO1.STP_OBT_SOL_LIQ_ADEUDO';

        Params.Clear;
        Params.CreateParam(ftInteger,'PEID_SOLICITUD',ptInput);
        Params.CreateParam(ftFloat,'RESULT',ptResult);
        ParamByName('PEID_SOLICITUD').AsInteger := Objeto.SolicitudLiq.ID_SOLICITUD.AsInteger;
        ExecProc;
        Result := ParamByName('RESULT').AsFloat;
      Finally
        stpObtSolLiqAdeudo.Free;
      End;
end;

procedure TWCrGaSolFega.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrGaSolFega.InterForma1DespuesNuevo(Sender: TObject);
begin If edID_SOLIC_LIQ.CanFocus Then edID_SOLIC_LIQ.SetFocus;

      If (Objeto.m_nID_SOLIC_LIQ > 0) Then
       Begin
       Objeto.ID_SOLIC_LIQ.AsInteger := Objeto.m_nID_SOLIC_LIQ;
       Objeto.ID_CREDITO.AsInteger := Objeto.m_nID_CREDITO;
       Objeto.NUM_PERIODO.AsInteger := Objeto.m_nNUM_PERIODO;
       Objeto.SolicitudLiq.FindKey([Objeto.m_nID_SOLIC_LIQ, Objeto.m_nID_CREDITO, Objeto.m_nNUM_PERIODO]);
       Objeto.Credito.FindKey([Objeto.m_nID_CREDITO]);
       BuscaAcreditado;
       Objeto.IMP_SDO_VENCIDO.AsFloat := ObtenImpAdeudo;       
       End;
end;

procedure TWCrGaSolFega.InterForma1DespuesModificar(Sender: TObject);
begin If edCVE_CAUS_PAG.CanFocus Then edCVE_CAUS_PAG.SetFocus;
end;

procedure TWCrGaSolFega.btnCVE_CAUS_PAGClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGASOFE_CAUS',True,True) then
   begin
     If  Objeto.CausaPago.Busca Then
      InterForma1.NextTab(edCVE_CAUS_PAG);
   end;
end;

procedure TWCrGaSolFega.btnCVE_SEGUROClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGASOFE_TPSEG',True,True) then
   begin
     If  Objeto.CausaSeguro.Busca Then
      InterForma1.NextTab(edCVE_SEGURO);
   end;
end;

procedure TWCrGaSolFega.btnCVE_CONT_INVClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGASOFE_CNINV',True,True) then
   begin
     If  Objeto.ConceptoInv.Busca Then
      InterForma1.NextTab(edCVE_CONT_INV);
   end;
end;

procedure TWCrGaSolFega.btnID_SOLIC_LIQClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGASOFE_SOLGT',True,True) then
   begin
     If Objeto.SolicitudLiq.Busca Then
      Begin
      BuscaAcreditado;
      Objeto.Credito.FindKey([Objeto.SolicitudLiq.ID_CREDITO.AsInteger]);
      Objeto.IMP_SDO_VENCIDO.AsFloat := ObtenImpAdeudo;
      InterForma1.NextTab(edID_SOLIC_LIQ);
      End;
   end;
end;

procedure TWCrGaSolFega.ilCVE_CAUS_PAGCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrGaSolFega.ilID_SOLIC_LIQEjecuta(Sender: TObject);
begin
 If Objeto.CausaPago.FindKey([ilID_SOLIC_LIQ.Buffer]) then
  Begin
  BuscaAcreditado;
  Objeto.IMP_SDO_VENCIDO.AsFloat := ObtenImpAdeudo;
  Objeto.Credito.FindKey([Objeto.SolicitudLiq.ID_CREDITO.AsInteger]);  
  InterForma1.NextTab(edID_SOLIC_LIQ);
  End;
end;

procedure TWCrGaSolFega.ilCVE_CAUS_PAGEjecuta(Sender: TObject);
begin
 If Objeto.CausaPago.FindKey([ilCVE_CAUSA_PAG.Buffer]) then
   InterForma1.NextTab(edCVE_CAUS_PAG);
end;

procedure TWCrGaSolFega.ilCVE_SEGUROEjecuta(Sender: TObject);
begin
 If Objeto.CausaSeguro.FindKey([ilCVE_SEGURO.Buffer]) then
   InterForma1.NextTab(edCVE_SEGURO);
end;

procedure TWCrGaSolFega.ilCVE_CONT_INVEjecuta(Sender: TObject);
begin
 If Objeto.ConceptoInv.FindKey([ilCVE_CONT_INV.Buffer]) then
   InterForma1.NextTab(edCVE_CONT_INV);
end;

procedure TWCrGaSolFega.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlstrMessage : String;
    mrResult : Word;
begin
 If IsNewData then vlstrMessage := '¿Desea almacenar los datos capturados?'
 Else vlstrMessage := '¿Desea guardar los datos modificados?';
 mrResult := MessageDlg(vlstrMessage, mtConfirmation, [mbYes, mbNo], 0);
 Realizado := mrResult = mrYes;

 With Objeto Do
   If (mrResult = mrYes) Then
    If (IsNewData) Then
     Begin
     F_ALTA.AsDateTime     := Apli.DameFechaEmpresa;
     CVE_USU_ALTA.AsString := Apli.Usuario;
     End
    Else
     Begin
     F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresa;
     CVE_USU_MODIFICA.AsString := Apli.Usuario;
     End;
end;

procedure TWCrGaSolFega.edIMP_PRODUCTOSExit(Sender: TObject);
var vlImporte : Double;
begin
 If (Sender Is TInterEdit) Then
  With (Sender As TInterEdit) Do
   If IsFloat(Text) Then
     vlImporte := StrToFloat(Text)
   Else
     vlImporte := 0;
  If (m_Importe <> vlImporte) Then
   Begin
   SumaRecuperaciones;
   CalculaImporteFEGA;
   End;
end;

procedure TWCrGaSolFega.SumaRecuperaciones;
begin
 With Objeto Do
   Begin
   If (Modo = moAppend) then
    Begin
     IMP_PRODUCTOS.GetFromControl;
     IMP_SEGUROS.GetFromControl;
     IMP_FINCAS.GetFromControl;
     IMP_AVALES.GetFromControl;
     IMP_GTIA_GRAVAD.GetFromControl;
     IMP_OTROS.GetFromControl;
    End; 
   edIMP_RECUPERACIONES.Text := Format(CFORMAT_DINERO,[IMP_PRODUCTOS.AsFloat + IMP_SEGUROS.AsFloat + IMP_FINCAS.AsFloat +
                                IMP_AVALES.AsFloat + IMP_GTIA_GRAVAD.AsFloat + IMP_OTROS.AsFloat]);
   End;
end;

procedure TWCrGaSolFega.BuscaAcreditado;
begin
 If (Objeto.Modo = moAppend) Or (Objeto.Modo = moAppend) Then
    Objeto.ID_CREDITO.GetFromControl;
  edNOM_ACREDITADO.Text := Obten_NombreAcreditado(Objeto.ID_CREDITO.AsInteger, Objeto.Apli);
end;

procedure TWCrGaSolFega.edID_SOLIC_LIQExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edID_SOLIC_LIQ, (Trim(edID_SOLIC_LIQ.Text) <> '') ,
                        'Favor de indicar el "Folio de la Solicitud de Garantía Líquida".',True);
end;

procedure TWCrGaSolFega.edCVE_CAUS_PAGExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edCVE_CAUS_PAG, (Trim(edCVE_CAUS_PAG.Text) <> '') ,
                        'Favor de indicar el "Folio de la Clave de Causa de Pago".',True);
end;

procedure TWCrGaSolFega.edCVE_SEGUROExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edCVE_SEGURO, (Trim(edCVE_SEGURO.Text) <> '') ,
                        'Favor de indicar el "Tipo de Seguro".',True);
end;

procedure TWCrGaSolFega.edCVE_CONT_INVExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edCVE_CONT_INV, (Trim(edCVE_CONT_INV.Text) <> '') ,
                        'Favor de indicar el "Concepto de Inversión".',True);
end;

procedure TWCrGaSolFega.edTXT_UNExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edTXT_UN, (Trim(edTXT_UN.Text) <> '') ,
                        'Favor de indicar la Unidades.',True);
end;

procedure TWCrGaSolFega.rgCVE_SITUACION_FIExit(Sender: TObject);
begin
 InterForma1.ValidaExit(rgCVE_SITUACION_FI, (rgCVE_SITUACION_FI.ItemIndex > -1) ,
                        'Favor de indicar la Situación de Solicitud de Garantía FEGA.',True);
end;

procedure TWCrGaSolFega.edDIAS_MORAS_PROYExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edDIAS_MORAS_PROY, (Trim(edDIAS_MORAS_PROY.Text) <> '') ,
                        'Favor de indicar el número de días a proyectar de Moras.',True);
 CalculaImporteFEGA;
end;

procedure TWCrGaSolFega.edF1_RECUPERAExit(Sender: TObject);
var vlbIndicados1, vlbIndicados2, vlbContinua : Boolean;
    vlstrMsg : String;
begin
 If (Objeto.Modo = moAppend) Or (Objeto.Modo = moAppend) Then
  Begin
  Objeto.IMP1_RECUPERA.GetFromControl;
  Objeto.IMP2_RECUPERA.GetFromControl;
  Objeto.IMP_SOLICITAR.GetFromControl;
  End;

 vlbIndicados1 := (edF1_RECUPERA.Text <> '') And (Objeto.IMP1_RECUPERA.AsFloat > 0);
 vlbIndicados2 := (edF2_RECUPERA.Text <> '') And (Objeto.IMP2_RECUPERA.AsFloat > 0);
 vlbContinua := vlbIndicados1 Or vlbIndicados2;
 If Not (vlbContinua) Then
  vlstrMsg := 'Favor de indicar al menos una Fecha e Importe de Recuperación.'
 Else
  Begin
  vlstrMsg := 'La Suma de los importes de Recuperación, debe ser igual al Importe FEGA a Solicitar.';
  vlbContinua := (Objeto.IMP1_RECUPERA.AsFloat + Objeto.IMP2_RECUPERA.AsFloat) = Objeto.IMP_SOLICITAR.AsFloat;
  End;
 InterForma1.ValidaExit(edF1_RECUPERA, vlbContinua, vlstrMsg, True);
end;

procedure TWCrGaSolFega.btnFmt8FIRAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGASOFE_IMPF8',True,True) then
   begin
     If (Trim(edID_SOLICITUD.Text) <> '') Then Formato8FIRA(Objeto.Apli, StrToInt(edID_SOLICITUD.Text) )
     Else ShowMessage('Debe de seleccionar antes una solicitud, para poder Imprimirla');
   end;
end;

procedure TWCrGaSolFega.btnFmt9FIRAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGASOFE_IMPF9',True,True) then
   begin
     If (Trim(edID_SOLICITUD.Text) <> '') Then Formato9FIRA(Objeto.Apli, StrToInt(edID_SOLICITUD.Text) )
     Else ShowMessage('Debe de seleccionar antes una solicitud, para poder Imprimirla');
   end;
end;

procedure TWCrGaSolFega.CalculaImporteFEGA;
var vlResultado : Integer;
    vlTxResultado : String;
    vlIMP_FEGA, vlIMP_MORAS_PROYEC : Double;
begin
 With Objeto Do
  Begin
    If (Modo = moAppend) Or (Modo = moEdit) Then
     Begin
       DIAS_MORAS_PROY.GetFromControl;
       IMP_SDO_VENCIDO.GetFromControl;
       ID_CREDITO.GetFromControl;

       Objeto.IMP_SDO_VENCIDO.AsFloat := ObtenImpAdeudo;
       IMP_MORAS_PROY.AsFloat := 0;

       If (DIAS_MORAS_PROY.AsInteger > 0) Then
        IMP_MORAS_PROY.AsFloat := ObtenMorasProyectadas(DIAS_MORAS_PROY.AsInteger);        
       IMP_SDO_VENCIDO.AsFloat := IMP_SDO_VENCIDO.AsFloat + IMP_MORAS_PROY.AsFloat;

       vlIMP_FEGA := ObtenImporteFEGA( SolicitudLiq.ID_SOLICITUD.AsInteger,
                                       IMP_RECUPERACIONES.AsFloat,
                                       IMP_MORAS_PROY.AsFloat,
                                       vlResultado,
                                       vlTxResultado);
       If (vlResultado = 0) Then IMP_SOLICITAR.AsFloat := vlIMP_FEGA
       Else ShowMessage(vlTxResultado);
     End;
  End;
end;

procedure TWCrGaSolFega.InterForma1Buscar(Sender: TObject);
begin
 With Objeto Do
  Begin
  InternalBusca;
  BuscaAcreditado;
  SumaRecuperaciones;
  End;
end;

procedure TWCrGaSolFega.btnCancelaClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGASOFE_CANCS',True,True) then
   begin
      If (MessageDlg('¿Desea Cancelar la Solicitud?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
      If Objeto.ErrorCancelaSolicitud Then
        ShowMessage('Problemas al Cancelar la Solicitud.')
      Else
        Begin
        Objeto.FindKey([Objeto.ID_SOLICITUD.AsInteger, Objeto.ID_CREDITO.AsInteger, Objeto.NUM_PERIODO.AsInteger]);
        MessageDlg('Solicitud Cancelada', mtInformation, [mbOk], 0);
        End;
   end;
end;

procedure TWCrGaSolFega.edIMP_PRODUCTOSEnter(Sender: TObject);
begin
 If (Sender Is TInterEdit) Then
  With (Sender As TInterEdit) Do
   If IsFloat(Text) Then
     m_Importe := StrToFloat(Text)
   Else
     m_Importe := 0;
end;

end.
