// Sistema         : Clase de SAT_CRE_LAYOUT
// Fecha de Inicio : 23/01/2005
// Función forma   : Clase de SAT_CRE_LAYOUT
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntSatCreLay;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntCtoPanel, IntLinkit,
QRPrntr, Printers,

IntCrCre,        // Disposición
IntPers,         // Persona
IntEmpre,        // Empresa
IntSatConst,     // Unidad Común para el SAT
IntCtoHeader,    // Contrato Corporativo
IntQrSatCrlayo,  // Reporte de Constancia 1
IntQrSatCrlayo2; // Reporte de Constancia 2

Type
 TSatCreLay= class;

  TWSatCreLayout=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_EMPRESA : TLabel; 
    edID_EMPRESA : TEdit;
    lbEJERCICIO : TLabel;
    edEJERCICIO : TEdit;
    edID_CREDITO: TEdit;
    lbID_CREDITO : TLabel;
    lbRFC_CURP : TLabel; 
    edRFC_CURP : TEdit; 
    edNOMBRE_TIT : TEdit;
    lbDOMICILIO_INMU : TLabel;
    lbNUM_IMPRESION : TLabel; 
    edNUM_IMPRESION : TEdit;
    lbPCT_PARTICIPACION : TLabel; 
    edPCT_PARTICIPACION : TEdit;
    lbF_IMPRESION : TLabel; 
    dtpF_IMPRESION : TInterDateTimePicker; 
    edF_IMPRESION : TEdit; 
    chB_REPORTA_SAT : TCheckBox;
    btnID_EMPRESA: TBitBtn;
    edNOM_RAZON_SOCIAL: TEdit;
    btID_CREDITO: TBitBtn;
    edNOM_CREDITO: TEdit;
    icpCONTRATO: TInterCtoPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    lbRFC_CURP_CONYU: TLabel;
    edRFC_CURP_CONYU: TEdit;
    lbNOMBRE_CONYU: TLabel;
    edNOMBRE_CONYU: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    ilID_EMPRESA: TInterLinkit;
    ilID_CREDITO: TInterLinkit;
    btnVer: TBitBtn;
    Bevel1: TBevel;
    rgConstancia: TRadioGroup;
    Label4: TLabel;
    edID_REPRESENTA: TEdit;
    btnID_REPRESENTANTE: TBitBtn;
    edNOM_REPRESENTANTE: TEdit;
    ilID_REPRESENTANTE: TInterLinkit;
    memDOMICILIO: TMemo;
    memDOMICILIO_INMU: TMemo;
    Bevel2: TBevel;
    lblNOM_RETENEDOR: TLabel;
    edNOM_RETENEDOR: TEdit;
    bntImprimir: TBitBtn;
    Label5: TLabel;
    edCURPRepresentante: TEdit;
    chkAlimentacionHojas: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btnVerClick(Sender: TObject);
    procedure bntImprimirClick(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure btnID_EMPRESAClick(Sender: TObject);
    procedure ilID_EMPRESACapture(Sender: TObject; var Show: Boolean);
    procedure ilID_EMPRESAEjecuta(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure ilID_REPRESENTANTEEjecuta(Sender: TObject);
    procedure btnID_REPRESENTANTEClick(Sender: TObject);
    private
    { Private declarations }
      procedure ImprimeConstancia(peB_PREVIEW : Boolean);
      procedure MuestraInformacion;
      procedure HabilitaBotones;
    public
    { Public declarations }
    Objeto : TSatCreLay;
end;
 TSatCreLay= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_EMPRESA               : TInterCampo;
        EJERCICIO                : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        ID_CREDITO               : TInterCampo;
        SDO_PROMEDIO             : TInterCampo;
        TIPO_REGISTRO            : TInterCampo;
        CONSECUTIVO              : TInterCampo;
        CVE_IDENTIFICADOR        : TInterCampo;
        RFC_CURP                 : TInterCampo;
        NOMBRE_TIT               : TInterCampo;
        DOMICILIO                : TInterCampo;
        NUM_REFERENCIA           : TInterCampo;
        NUM_REG_FIDE             : TInterCampo;
        CVE_DEST_CREDITO         : TInterCampo;
        IMP_INT_NOM_DEV          : TInterCampo;
        IMP_INT_PAG_ORD          : TInterCampo;
        IMP_INT_MOR_DEV          : TInterCampo;
        IMP_INT_MOR_PAG          : TInterCampo;
        IMP_INT_REAL             : TInterCampo;
        SDO_CIE_ANIO_ANT         : TInterCampo;
        SDO_FEC_CONTR            : TInterCampo;
        F_CONTRATACION           : TInterCampo;
        PROP_DEDUCIBLE           : TInterCampo;
        PCT_COP_SOC_CONY         : TInterCampo;
        NUM_COPROPIET            : TInterCampo;
        RFC_CURP_COPRO           : TInterCampo;
        NOMBRE_COPRO             : TInterCampo;
        RFC_CURP_CONYU           : TInterCampo;
        NOMBRE_CONYU             : TInterCampo;
        DOMICILIO_INMU           : TInterCampo;
        NUM_IMPRESION            : TInterCampo;
        PCT_PARTICIPACION        : TInterCampo;
        F_IMPRESION              : TInterCampo;
        NOMBRE_TIT_ARCH          : TInterCampo;
        B_REPORTA_SAT            : TInterCampo;
        ID_REPRESENTA            : TInterCampo;

        Credito     : TCrCre;     // Disposición de Intercréditos
        Empresa     : TEmpresa;   // Empresa
        Contrato    : TCtrlCto;   // Contrato Corporativo
        Persona     : TPersona;   // Persona

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation
//Uses RepMon;

{$R *.DFM}

constructor TSatCreLay.Create( AOwner : TComponent );
begin Inherited;
      ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
                ID_EMPRESA.Caption:='Número de Empresa';
      EJERCICIO :=CreaCampo('EJERCICIO',ftFloat,tsNinguno,tsNinguno,True);
                EJERCICIO.Caption:='Ejercicio';
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Número de Contrato';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      SDO_PROMEDIO :=CreaCampo('SDO_PROMEDIO',ftFloat,tsNinguno,tsNinguno,True);
                SDO_PROMEDIO.Caption:='Sdo Promedio';
      TIPO_REGISTRO :=CreaCampo('TIPO_REGISTRO',ftFloat,tsNinguno,tsNinguno,True);
                TIPO_REGISTRO.Caption:='Tipo Registro';
      CONSECUTIVO :=CreaCampo('CONSECUTIVO',ftFloat,tsNinguno,tsNinguno,True);
                CONSECUTIVO.Caption:='Consecutivo';
      CVE_IDENTIFICADOR :=CreaCampo('CVE_IDENTIFICADOR',ftFloat,tsNinguno,tsNinguno,True);
                CVE_IDENTIFICADOR.Caption:='Clave de Identificador';
      RFC_CURP :=CreaCampo('RFC_CURP',ftString,tsNinguno,tsNinguno,True);
                RFC_CURP.Caption:='Rfc Curp';
      NOMBRE_TIT :=CreaCampo('NOMBRE_TIT',ftString,tsNinguno,tsNinguno,True);
                NOMBRE_TIT.Caption:='Nombre Tit';
      DOMICILIO :=CreaCampo('DOMICILIO',ftString,tsNinguno,tsNinguno,True);
                DOMICILIO.Caption:='Domicilio';
      NUM_REFERENCIA :=CreaCampo('NUM_REFERENCIA',ftString,tsNinguno,tsNinguno,True);
                NUM_REFERENCIA.Caption:='Número Referencia';
      NUM_REG_FIDE :=CreaCampo('NUM_REG_FIDE',ftString,tsNinguno,tsNinguno,True);
                NUM_REG_FIDE.Caption:='Número Reg Fide';
      CVE_DEST_CREDITO :=CreaCampo('CVE_DEST_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                CVE_DEST_CREDITO.Caption:='Clave de Dest Credito';
      IMP_INT_NOM_DEV :=CreaCampo('IMP_INT_NOM_DEV',ftFloat,tsNinguno,tsNinguno,True);
                IMP_INT_NOM_DEV.Caption:='Imp Int Nombre Dev';
      IMP_INT_PAG_ORD :=CreaCampo('IMP_INT_PAG_ORD',ftFloat,tsNinguno,tsNinguno,True);
                IMP_INT_PAG_ORD.Caption:='Imp Int Pag Ord';
      IMP_INT_MOR_DEV :=CreaCampo('IMP_INT_MOR_DEV',ftFloat,tsNinguno,tsNinguno,True);
                IMP_INT_MOR_DEV.Caption:='Imp Int Mor Dev';
      IMP_INT_MOR_PAG :=CreaCampo('IMP_INT_MOR_PAG',ftFloat,tsNinguno,tsNinguno,True);
                IMP_INT_MOR_PAG.Caption:='Imp Int Mor Pag';
      IMP_INT_REAL :=CreaCampo('IMP_INT_REAL',ftFloat,tsNinguno,tsNinguno,True);
                IMP_INT_REAL.Caption:='Imp Int Real';
      SDO_CIE_ANIO_ANT :=CreaCampo('SDO_CIE_ANIO_ANT',ftFloat,tsNinguno,tsNinguno,True);
                SDO_CIE_ANIO_ANT.Caption:='Sdo Cie Anio Ant';
      SDO_FEC_CONTR :=CreaCampo('SDO_FEC_CONTR',ftFloat,tsNinguno,tsNinguno,True);
                SDO_FEC_CONTR.Caption:='Sdo Fec Contr';
      F_CONTRATACION :=CreaCampo('F_CONTRATACION',ftFloat,tsNinguno,tsNinguno,True);
                F_CONTRATACION.Caption:='Fecha Contratacion';
      PROP_DEDUCIBLE :=CreaCampo('PROP_DEDUCIBLE',ftFloat,tsNinguno,tsNinguno,True);
                PROP_DEDUCIBLE.Caption:='Prop Deducible';
      PCT_COP_SOC_CONY :=CreaCampo('PCT_COP_SOC_CONY',ftFloat,tsNinguno,tsNinguno,True);
                PCT_COP_SOC_CONY.Caption:='Pct Cop Soc Cony';
      NUM_COPROPIET :=CreaCampo('NUM_COPROPIET',ftFloat,tsNinguno,tsNinguno,True);
                NUM_COPROPIET.Caption:='Número Copropiet';
      RFC_CURP_COPRO :=CreaCampo('RFC_CURP_COPRO',ftString,tsNinguno,tsNinguno,True);
                RFC_CURP_COPRO.Caption:='Rfc Curp Copro';
      NOMBRE_COPRO :=CreaCampo('NOMBRE_COPRO',ftString,tsNinguno,tsNinguno,True);
                NOMBRE_COPRO.Caption:='Nombre Copro';
      RFC_CURP_CONYU :=CreaCampo('RFC_CURP_CONYU',ftString,tsNinguno,tsNinguno,True);
                RFC_CURP_CONYU.Caption:='Rfc Curp Conyu';
      NOMBRE_CONYU :=CreaCampo('NOMBRE_CONYU',ftString,tsNinguno,tsNinguno,True);
                NOMBRE_CONYU.Caption:='Nombre Conyu';
      DOMICILIO_INMU :=CreaCampo('DOMICILIO_INMU',ftString,tsNinguno,tsNinguno,True);
                DOMICILIO_INMU.Caption:='Domicilio Inmu';
      NUM_IMPRESION :=CreaCampo('NUM_IMPRESION',ftFloat,tsNinguno,tsNinguno,True);
                NUM_IMPRESION.Caption:='Número Impresion';
      PCT_PARTICIPACION :=CreaCampo('PCT_PARTICIPACION',ftFloat,tsNinguno,tsNinguno,True);
                PCT_PARTICIPACION.Caption:='Pct Participacion';
      F_IMPRESION :=CreaCampo('F_IMPRESION',ftDate,tsNinguno,tsNinguno,True);
                F_IMPRESION.Caption:='Fecha Impresion';
      NOMBRE_TIT_ARCH :=CreaCampo('NOMBRE_TIT_ARCH',ftString,tsNinguno,tsNinguno,True);
                NOMBRE_TIT_ARCH.Caption:='Nombre Tit Arch';
      B_REPORTA_SAT :=CreaCampo('B_REPORTA_SAT',ftString,tsNinguno,tsNinguno,True);
                B_REPORTA_SAT.Caption:='Reporta Sat';

      ID_REPRESENTA :=CreaCampo('ID_REPRESENTA',ftInteger,tsNinguno,tsNinguno,False);
                ID_REPRESENTA.Caption:='Representante';
      FKeyFields.Add('ID_EMPRESA');
      FKeyFields.Add('EJERCICIO');
      FKeyFields.Add('ID_CONTRATO');
      FKeyFields.Add('ID_CREDITO');

      TableName := 'SAT_CRE_LAYOUT';
      UseQuery := True;
      HelpFile := 'IntSatCreLay.Hlp';
      ShowMenuReporte:=True;

      Empresa := TEmpresa.Create(Self);
      Empresa.MasterSource:=Self;
      Empresa.FieldByName('ID_EMPRESA').MasterField:='ID_EMPRESA';

      Contrato := TCtrlCto.Create(Self);
      Contrato.MasterSource:=Self;
      Contrato.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';

      Credito := TCrCre.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Persona := TPersona.Create(Self);
      Persona.MasterSource:=Self;
      Persona.FieldByName('ID_PERSONA').MasterField:='ID_REPRESENTA';
end;

Destructor TSatCreLay.Destroy;
begin
 If Assigned(Credito)  Then Credito.Free;
 If Assigned(Contrato) Then Contrato.Free;
 If Assigned(Empresa)  Then Empresa.Free;
 If Assigned(Persona)  Then Persona.Free;
 Inherited;
end;

function TSatCreLay.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWSatCreLayout;
begin
   W:=TWSatCreLayout.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftGrid;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TSatCreLay.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ISaCrLa.it','F,F,F,F');
      Try if Active then begin T.Param(0,ID_EMPRESA.AsString);
                               T.Param(1,EJERCICIO.AsString);
                               T.Param(2,ID_CONTRATO.AsString);
                               T.Param(3,ID_CREDITO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA SAT_CRE_LAYOUT********************)
(*                                                                              *)
(*  FORMA DE SAT_CRE_LAYOUT                                                            *)
(*                                                                              *)
(***********************************************FORMA SAT_CRE_LAYOUT********************)

procedure TWSatCreLayout.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_EMPRESA.Control            := edID_EMPRESA;
  EJERCICIO.Control             := edEJERCICIO;
  ID_CREDITO.Control            := edID_CREDITO;
  RFC_CURP.Control              := edRFC_CURP;
  NOMBRE_TIT.Control            := edNOMBRE_TIT;
  DOMICILIO.Control             := memDOMICILIO;
  RFC_CURP_CONYU.Control        := edRFC_CURP_CONYU;
  NOMBRE_CONYU.Control          := edNOMBRE_CONYU;
  DOMICILIO_INMU.Control        := memDOMICILIO_INMU;
  NUM_IMPRESION.Control         := edNUM_IMPRESION;
  PCT_PARTICIPACION.Control     := edPCT_PARTICIPACION;
  F_IMPRESION.Control           := edF_IMPRESION;
  B_REPORTA_SAT.Control         := chB_REPORTA_SAT;
  ID_REPRESENTA.Control         := edID_REPRESENTA;

  Credito.ID_CREDITO.Control    := edID_CREDITO;
  Credito.Autorizacion.Contrato.TITNombre.Control := edNOM_CREDITO;
  Credito.GetParams(Objeto);

  Empresa.ID_EMPRESA.Control    := edID_EMPRESA;
  Empresa.PersonaMoral.Nombre.Control := edNOM_RAZON_SOCIAL;
  Empresa.GetParams(Objeto);

  Persona.ID_PERSONA.Control    := edID_REPRESENTA;
  Persona.Nombre.Control        := edNOM_REPRESENTANTE;
  Persona.GetParams(Objeto);

  icpCONTRATO.Frame := Contrato;
  icpCONTRATO.RefrescaInfo;

  btnVer.Enabled := False;
  bntImprimir.Enabled := False;
  End;
end;

procedure TWSatCreLayout.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_EMPRESA.Control            := Nil;
  EJERCICIO.Control             := Nil;
  ID_CREDITO.Control            := Nil;
  RFC_CURP.Control              := Nil;
  NOMBRE_TIT.Control            := Nil;
  DOMICILIO.Control             := Nil;
  RFC_CURP_CONYU.Control        := Nil;
  NOMBRE_CONYU.Control          := Nil;
  DOMICILIO_INMU.Control        := Nil;
  NUM_IMPRESION.Control         := Nil;
  PCT_PARTICIPACION.Control     := Nil;
  F_IMPRESION.Control           := Nil;
  B_REPORTA_SAT.Control         := Nil;
  ID_REPRESENTA.Control         := Nil;

  Credito.ID_CREDITO.Control    := Nil;
  Credito.Autorizacion.Contrato.TITNombre.Control := Nil;

  Empresa.ID_EMPRESA.Control    := Nil;
  Empresa.PersonaMoral.Nombre.Control := Nil;

  Persona.ID_PERSONA.Control    := Nil;
  Persona.Nombre.Control        := Nil;

  icpCONTRATO.Frame := Nil;
  End;
end;

procedure TWSatCreLayout.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWSatCreLayout.InterForma1DespuesNuevo(Sender: TObject);
begin If edID_EMPRESA.CanFocus Then edID_EMPRESA.SetFocus;
end;

procedure TWSatCreLayout.InterForma1DespuesModificar(Sender: TObject);
begin If edNOMBRE_TIT.CanFocus Then edNOMBRE_TIT.SetFocus;
end;

procedure TWSatCreLayout.btnVerClick(Sender: TObject);
begin
 ImprimeConstancia(True);
end;

procedure TWSatCreLayout.bntImprimirClick(Sender: TObject);
begin
 ImprimeConstancia(False);
end;

procedure TWSatCreLayout.ImprimeConstancia(peB_PREVIEW : Boolean);
var vlSQL : String;
    vlImprimePapel : Boolean;
    vlCopias : Integer;
begin
 With Objeto Do
  Begin
    vlSQL := ArmaQryConstanciaSAT(ID_EMPRESA.AsInteger, Persona.ID_PERSONA.AsInteger, EJERCICIO.AsInteger,
                                  ID_CREDITO.AsInteger, ID_CREDITO.AsInteger);
    Case rgConstancia.ItemIndex Of
      0 : vlImprimePapel := RepConstancias(vlSQL,  edNOM_RETENEDOR.Text, Apli, peB_PREVIEW, vlCopias);
      1 : vlImprimePapel := RepConstancias2(vlSQL,  edNOM_RETENEDOR.Text, edCURPRepresentante.Text, Apli, peB_PREVIEW, vlCopias, chkAlimentacionHojas.Checked);
    Else
      vlImprimePapel := False;
    End;

    If (vlImprimePapel) Then
     If (Trim(edF_IMPRESION.Text) = '') Then
        If CambiaBanderaImprConst(EJERCICIO.AsInteger, ID_EMPRESA.AsInteger,
                                  ID_CREDITO.AsInteger, ID_CREDITO.AsInteger,
                                  vlCopias, True, Objeto.Apli) Then
          FindKey([ID_EMPRESA.AsInteger, EJERCICIO.AsInteger, ID_CONTRATO.AsInteger, ID_CREDITO.AsInteger]);
  End;
end;

procedure TWSatCreLayout.InterForma1Buscar(Sender: TObject);
begin
 With Objeto Do
  If Busca Then
   MuestraInformacion;
end;

procedure TWSatCreLayout.MuestraInformacion;
begin
 With Objeto Do
  Begin
  Empresa.FindKey([ID_EMPRESA.AsInteger]);
  Credito.FindKey([ID_CREDITO.AsInteger]);
  icpCONTRATO.RefrescaInfo;
  HabilitaBotones;
  Persona.FindKey([107]);
  End;
end;

procedure TWSatCreLayout.HabilitaBotones;
begin
 With Objeto Do
  Begin
  btnVer.Enabled := (ID_EMPRESA.AsInteger > 0) And (ID_CREDITO.AsInteger > 0);
  bntImprimir.Enabled := btnVer.Enabled;
  End;
end;

procedure TWSatCreLayout.btnID_EMPRESAClick(Sender: TObject);
begin
 Objeto.Empresa.Busca;
end;

procedure TWSatCreLayout.btID_CREDITOClick(Sender: TObject);
begin
 Objeto.Credito.Busca;
end;

procedure TWSatCreLayout.btnID_REPRESENTANTEClick(Sender: TObject);
begin
 Objeto.Persona.Busca;
end;

procedure TWSatCreLayout.ilID_EMPRESACapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWSatCreLayout.ilID_EMPRESAEjecuta(Sender: TObject);
begin
 With Objeto Do
   Empresa.FindKey([ilID_EMPRESA.Buffer]);
end;

procedure TWSatCreLayout.ilID_CREDITOEjecuta(Sender: TObject);
begin
 With Objeto Do
   Credito.FindKey([ilID_CREDITO.Buffer]);
end;

procedure TWSatCreLayout.ilID_REPRESENTANTEEjecuta(Sender: TObject);
begin
 With Objeto Do
   Persona.FindKey([ilID_REPRESENTANTE.Buffer]);
end;


end.

