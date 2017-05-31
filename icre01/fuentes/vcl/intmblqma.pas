// Sistema         : Clase de MBLQMA
// Fecha de Inicio : 19/11/2008
// Función forma   : Clase de MBLQMA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntMblqma;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, CheckLst,

IntParamCre,
IntGenCre
;

Const
  C_ENTRE = 'Entre';
  C_ESPACIO_EN_BLANCO = ' ';

Type
 TMblqma= class; 

  TWMblqma=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CREDITO: TLabel;
    lbID_CONTRATO: TLabel;
    lbID_CONTRATO_DV: TLabel;
    lbID_ACREDITADO: TLabel;
    lbCVE_PRODUCTO_CRE: TLabel;
    lbCVE_PRODUCTO_GPO: TLabel;
    lbF_DISPOSICION: TLabel;
    lbF_VENCIMIENTO_A: TLabel;
    lbF_VENCIMIENTO: TLabel;
    lbF_ALTA: TLabel;
    Bevel1: TBevel;
    Label8: TLabel;
    lbCVE_BLQ_CPTO: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edID_CREDITO: TEdit;
    btID_CREDITO: TBitBtn;
    edNOM_CREDITO: TEdit;
    edID_CONTRATO: TEdit;
    btID_CONTRATO: TBitBtn;
    edNOM_CONTRATO: TEdit;
    edID_CONTRATO_DV: TEdit;
    btID_CONTRATO_DV: TBitBtn;
    edNOM_CONTRATO_DV: TEdit;
    chkID_CREDITO: TCheckBox;
    chkID_CONTRATO: TCheckBox;
    chkID_ACREDITADO: TCheckBox;
    chkF_VENCIMIENTO_A: TCheckBox;
    edID_ACREDITADO: TEdit;
    btID_ACREDITADO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    chkCVE_PRODUCTO_GPO: TCheckBox;
    chkCVE_PRODUCTO_CRE: TCheckBox;
    chkID_CONTRATO_DV: TCheckBox;
    chkF_DISPOSICION_F: TCheckBox;
    edCVE_PRODUCTO_CRE: TEdit;
    btCVE_PRODUCTO_CRE: TBitBtn;
    edDESC_L_PRODUCTO: TEdit;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edDESC_L_PROD_GPO: TEdit;
    cbxF_DISPOSICION: TComboBox;
    dtpF_DISPOSICION_F: TDateTimePicker;
    dtpF_DISPOSICION_I: TDateTimePicker;
    cbxF_VENCIMIENTO_A: TComboBox;
    dtpF_VENCIMIENTO_A_F: TDateTimePicker;
    dtpF_VENCIMIENTO_A_I: TDateTimePicker;
    chkF_VENCIMIENTO: TCheckBox;
    cbxF_VENCIMIENTO: TComboBox;
    dtpF_VENCIMIENTO_F: TDateTimePicker;
    dtpF_VENCIMIENTO_I: TDateTimePicker;
    chkF_ALTA: TCheckBox;
    cbxF_ALTA: TComboBox;
    dtpF_ALTA_F: TDateTimePicker;
    dtpF_ALTA_I: TDateTimePicker;
    chkExcel: TCheckBox;
    edFileName: TEdit;
    btFileExcel: TButton;
    opPlano: TRadioButton;
    opReporte: TRadioButton;
    chklstCVE_BLQ_CPTO: TCheckListBox;
    chkCVE_BLQ_CPTO: TCheckBox;
    ilID_CREDITO: TInterLinkit;
    ilID_CONTRATO: TInterLinkit;
    ilID_ACREDITADO: TInterLinkit;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    ilCVE_PRODUCTO_CRE: TInterLinkit;
    ilID_CONTRATO_DV: TInterLinkit;
    SaveDialog1: TSaveDialog;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure btID_ACREDITADOClick(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure btCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure btID_CONTRATO_DVClick(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure ilID_ACREDITADOEjecuta(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
    procedure ilID_CONTRATO_DVEjecuta(Sender: TObject);
    procedure chkID_CREDITOClick(Sender: TObject);
    procedure chkID_CONTRATOClick(Sender: TObject);
    procedure chkID_ACREDITADOClick(Sender: TObject);
    procedure chkCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure chkCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure chkID_CONTRATO_DVClick(Sender: TObject);
    procedure chkCVE_BLQ_CPTOClick(Sender: TObject);
    procedure chkF_VENCIMIENTOClick(Sender: TObject);
    procedure chkF_ALTAClick(Sender: TObject);
    procedure btFileExcelClick(Sender: TObject);
    procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure cbxF_DISPOSICIONChange(Sender: TObject);
    procedure cbxF_VENCIMIENTO_AChange(Sender: TObject);
    procedure cbxF_VENCIMIENTOChange(Sender: TObject);
    procedure cbxF_ALTAChange(Sender: TObject);
    procedure chkF_DISPOSICION_FClick(Sender: TObject);
    procedure chkF_VENCIMIENTO_AClick(Sender: TObject);
    procedure chkExcelClick(Sender: TObject);
    procedure InterForma1Imprimir(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TMblqma;

    procedure ObtenDescripcion(peStrBuffer, peStrSQL, peStrNomCampo: String;
                               peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo;
                               peCheckBox : TCheckBox);
    procedure HabilitaCtrlsFecha(peDateTimePicker1 : TDateTimePicker;
                                 peComboBox : TComboBox;
                                 peDateTimePicker2 : TDateTimePicker;
                                 pebEnabled : Boolean
                                );
    procedure MuestraCtrlsFecha(peDateTimePicker1 : TDateTimePicker; peComboBox : TComboBox);

    function ObtenNombreArchivo : String;
    function ObtenOpcion : Integer;
    procedure LLenaCptosBloqueo;
    procedure SetDataToControls;

    procedure LimpiaControles(peCheckBox : TCheckBox; peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo);
    procedure CreaBuscador1(peStrNomBuscador : String;
                           peStrCamposBuscador : String;
                           penResultBusc1, penResultBusc2 : Integer;
                           peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo;
                           peCheckBox : TCheckBox
                          );
end;
 TMblqma= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre               : TParamCre;

        ID_CREDITO             : TInterCampo;
        ID_CONTRATO            : TInterCampo;
        ID_ACREDITADO          : TInterCampo;
        CVE_PRODUCTO_GPO       : TInterCampo;
        CVE_PRODUCTO_CRE       : TInterCampo;
        ID_CONTRATO_DV         : TInterCampo;

        F_DISPOSICION_I        : TInterCampo;
        F_VENCIMIENTO_A_I      : TInterCampo;
        F_VENCIMIENTO_I        : TInterCampo;
        F_ALTA_I               : TInterCampo;

        CVE_F_DISPOSICION_I    : TInterCampo;
        CVE_F_VENCIMIENTO_A_I  : TInterCampo;
        CVE_F_VENCIMIENTO_I    : TInterCampo;
        CVE_F_ALTA_I           : TInterCampo;

        F_DISPOSICION_F        : TInterCampo;
        F_VENCIMIENTO_A_F      : TInterCampo;
        F_VENCIMIENTO_F        : TInterCampo;
        F_ALTA_F               : TInterCampo;

        NOM_CREDITO            : TInterCampo;
        NOM_CONTRATO           : TInterCampo;
        NOM_ACREDITADO         : TInterCampo;
        DESC_L_PROD_GPO        : TInterCampo;
        DESC_L_PRODUCTO        : TInterCampo;
        NOM_CONTRATO_DV        : TInterCampo;

        B_MUESTRA_BLOQ         : TInterCampo;

        vgStrListCptos         : TStringList;
        vgCheckListBox         : TCheckListBox;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

        procedure   GetDataFromControls;
        function    ArmaSQL : String;
      published
      end;


implementation

uses IntMQrBlqma;
{$R *.DFM}


constructor TMblqma.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
                ID_CREDITO.Caption:='No. Diposición';
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,False);
                ID_CONTRATO.Caption:='No. Autorización';
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);
                ID_ACREDITADO.Caption:='No. Acreditado';
      CVE_PRODUCTO_GPO :=CreaCampo('CVE_PRODUCTO_GPO',ftInteger,tsNinguno,tsNinguno,False);
                CVE_PRODUCTO_GPO.Caption:='Grupo de Producto';
      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftInteger,tsNinguno,tsNinguno,False);
                CVE_PRODUCTO_CRE.Caption:='Producto';
      ID_CONTRATO_DV :=CreaCampo('ID_CONTRATO_DV',ftInteger,tsNinguno,tsNinguno,False);
                ID_CONTRATO_DV.Caption:='Chequera';

      F_DISPOSICION_I :=CreaCampo('F_DISPOSICION_I',ftDate,tsNinguno,tsNinguno,False);
                F_DISPOSICION_I.Caption:='Fecha de Disposición';
      F_VENCIMIENTO_A_I :=CreaCampo('F_VENCIMIENTO_A_I',ftDate,tsNinguno,tsNinguno,False);
                F_VENCIMIENTO_A_I.Caption:='Fecha de Vencimiento de la Próxima Amortización';
      F_VENCIMIENTO_I :=CreaCampo('F_VENCIMIENTO_I',ftDate,tsNinguno,tsNinguno,False);
                F_VENCIMIENTO_I.Caption:='Fecha de Vencimiento de la Próxima Amortización';
      F_ALTA_I :=CreaCampo('F_ALTA_I',ftDate,tsNinguno,tsNinguno,False);
                F_ALTA_I.Caption:='Fecha de Alta del Bloqueo';

      CVE_F_DISPOSICION_I :=CreaCampo('CVE_F_DISPOSICION_F',ftString,tsNinguno,tsNinguno,False);
      CVE_F_VENCIMIENTO_A_I :=CreaCampo('CVE_F_VENCIMIENTO_A_F',ftString,tsNinguno,tsNinguno,False);
      CVE_F_VENCIMIENTO_I :=CreaCampo('CVE_F_VENCIMIENTO_F',ftString,tsNinguno,tsNinguno,False);
      CVE_F_ALTA_I :=CreaCampo('CVE_F_ALTA_F',ftString,tsNinguno,tsNinguno,False);

      F_DISPOSICION_F :=CreaCampo('F_DISPOSICION_F',ftDate,tsNinguno,tsNinguno,False);
                F_DISPOSICION_F.Caption:='Fecha de Disposición';
      F_VENCIMIENTO_A_F :=CreaCampo('F_VENCIMIENTO_A_F',ftDate,tsNinguno,tsNinguno,False);
                F_VENCIMIENTO_A_F.Caption:='Fecha de Vencimiento de la Próxima Amortización';
      F_VENCIMIENTO_F :=CreaCampo('F_VENCIMIENTO_F',ftDate,tsNinguno,tsNinguno,False);
                F_VENCIMIENTO_F.Caption:='Fecha de Vencimiento de la Próxima Amortización';
      F_ALTA_F :=CreaCampo('F_ALTA_F',ftDate,tsNinguno,tsNinguno,False);
                F_ALTA_F.Caption:='Fecha de Alta del Bloqueo';

      NOM_CREDITO :=CreaCampo('NOM_CREDITO',ftString,tsNinguno,tsNinguno,False);
                NOM_CREDITO.Caption:='Nombre del Acreditado';
      NOM_CONTRATO :=CreaCampo('NOM_CONTRATO',ftString,tsNinguno,tsNinguno,False);
                NOM_CONTRATO.Caption:='Nombre del Acreditado';
      NOM_ACREDITADO :=CreaCampo('NOM_ACREDITADO',ftString,tsNinguno,tsNinguno,False);
                NOM_ACREDITADO.Caption:='Nombre del Acreditado';
      DESC_L_PROD_GPO :=CreaCampo('DESC_L_PROD_GPO',ftString,tsNinguno,tsNinguno,False);
                DESC_L_PROD_GPO.Caption:='Grupo de Producto';
      DESC_L_PRODUCTO :=CreaCampo('DESC_L_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
                DESC_L_PRODUCTO.Caption:='Producto';
      NOM_CONTRATO_DV :=CreaCampo('NOM_CONTRATO_DV',ftString,tsNinguno,tsNinguno,False);
                NOM_CONTRATO_DV.Caption:='Titular Chequera';

      B_MUESTRA_BLOQ :=CreaCampo('B_MUESTRA_BLOQ',ftString,tsNinguno,tsNinguno,False);
                B_MUESTRA_BLOQ.Caption:='Muestra Bloqueados';

      vgStrListCptos := TStringList.Create;

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntMblqma.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMblqma.Destroy;
begin
  vgStrListCptos.Clear;
  vgStrListCptos.Free;
  inherited;
end;


function TMblqma.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMblqma;
begin
   W:=TWMblqma.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TMblqma.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IMblqma.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA MBLQMA********************)
(*                                                                              *)
(*  FORMA DE MBLQMA                                                            *)
(*                                                                              *)
(***********************************************FORMA MBLQMA********************)

procedure TWMblqma.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    // Asigna el No. Control al Objeto
    ID_CREDITO.Control         := edID_CREDITO;
    ID_CONTRATO.Control        := edID_CONTRATO;
    ID_ACREDITADO.Control      := edID_ACREDITADO;
    CVE_PRODUCTO_GPO.Control   := edCVE_PRODUCTO_GPO;
    CVE_PRODUCTO_CRE.Control   := edCVE_PRODUCTO_CRE;
    ID_CONTRATO_DV.Control     := edID_CONTRATO_DV;

    F_DISPOSICION_I.Control    := dtpF_DISPOSICION_I;
    F_VENCIMIENTO_A_I.Control  := dtpF_VENCIMIENTO_A_I;
    F_VENCIMIENTO_I.Control    := dtpF_VENCIMIENTO_I;
    F_ALTA_I.Control           := dtpF_ALTA_I;

    CVE_F_DISPOSICION_I.Control    := cbxF_DISPOSICION;
    CVE_F_VENCIMIENTO_A_I.Control  := cbxF_VENCIMIENTO_A;
    CVE_F_VENCIMIENTO_I.Control    := cbxF_VENCIMIENTO;
    CVE_F_ALTA_I.Control           := cbxF_ALTA;

    CVE_F_DISPOSICION_I.AsString   := C_ESPACIO_EN_BLANCO;
    CVE_F_VENCIMIENTO_A_I.AsString := C_ESPACIO_EN_BLANCO;
    CVE_F_VENCIMIENTO_I.AsString   := C_ESPACIO_EN_BLANCO;
    CVE_F_ALTA_I.AsString          := C_ESPACIO_EN_BLANCO;

    F_DISPOSICION_F.Control    := dtpF_DISPOSICION_F;
    F_VENCIMIENTO_A_F.Control  := dtpF_VENCIMIENTO_A_F;
    F_VENCIMIENTO_F.Control    := dtpF_VENCIMIENTO_F;
    F_ALTA_F.Control           := dtpF_ALTA_F;


    
    F_DISPOSICION_I.AsDateTime    := Apli.DameFechaEmpresa;
    F_VENCIMIENTO_A_I.AsDateTime  := F_DISPOSICION_I.AsDateTime;
    F_VENCIMIENTO_I.AsDateTime    := F_DISPOSICION_I.AsDateTime;
    F_ALTA_I.AsDateTime           := F_DISPOSICION_I.AsDateTime;
    F_DISPOSICION_F.AsDateTime    := F_DISPOSICION_I.AsDateTime;
    F_VENCIMIENTO_A_F.AsDateTime  := F_DISPOSICION_I.AsDateTime;
    F_VENCIMIENTO_F.AsDateTime    := F_DISPOSICION_I.AsDateTime;
    F_ALTA_F.AsDateTime           := F_DISPOSICION_I.AsDateTime;

    dtpF_DISPOSICION_F.DateTime     := F_DISPOSICION_I.AsDateTime;
    dtpF_VENCIMIENTO_A_F.DateTime   := F_DISPOSICION_I.AsDateTime;
    dtpF_VENCIMIENTO_F.DateTime     := F_DISPOSICION_I.AsDateTime;
    dtpF_ALTA_F.DateTime            := F_DISPOSICION_I.AsDateTime;
    dtpF_DISPOSICION_I.DateTime     := F_DISPOSICION_I.AsDateTime;
    dtpF_VENCIMIENTO_A_I.DateTime   := F_DISPOSICION_I.AsDateTime;
    dtpF_VENCIMIENTO_I.DateTime     := F_DISPOSICION_I.AsDateTime;
    dtpF_ALTA_I.DateTime            := F_DISPOSICION_I.AsDateTime;




    NOM_CREDITO.Control        := edNOM_CREDITO;
    NOM_CONTRATO.Control       := edNOM_CONTRATO;
    NOM_ACREDITADO.Control     := edNOM_ACREDITADO;
    DESC_L_PROD_GPO.Control    := edDESC_L_PROD_GPO;
    DESC_L_PRODUCTO.Control    := edDESC_L_PRODUCTO;
    NOM_CONTRATO_DV.Control    := edNOM_CONTRATO_DV;

    B_MUESTRA_BLOQ.AsString := CVERDAD;

    vgCheckListBox := chklstCVE_BLQ_CPTO;

    LLenaCptosBloqueo;
    End;
end;

procedure TWMblqma.FormDestroy(Sender: TObject);
begin
  With Objeto Do
    Begin
    ID_CREDITO.Control         := Nil;
    ID_CONTRATO.Control        := Nil;
    ID_ACREDITADO.Control      := Nil;
    CVE_PRODUCTO_GPO.Control   := Nil;
    CVE_PRODUCTO_CRE.Control   := Nil;
    ID_CONTRATO_DV.Control     := Nil;

    F_DISPOSICION_I.Control    := Nil;
    F_VENCIMIENTO_A_I.Control  := Nil;
    F_VENCIMIENTO_I.Control    := Nil;
    F_ALTA_I.Control           := Nil;

    CVE_F_DISPOSICION_I.Control    := Nil;
    CVE_F_VENCIMIENTO_A_I.Control  := Nil;
    CVE_F_VENCIMIENTO_I.Control    := Nil;
    CVE_F_ALTA_I.Control           := Nil;

    F_DISPOSICION_F.Control    := Nil;
    F_VENCIMIENTO_A_F.Control  := Nil;
    F_VENCIMIENTO_F.Control    := Nil;
    F_ALTA_F.Control           := Nil;

    NOM_CREDITO.Control        := Nil;
    NOM_CONTRATO.Control       := Nil;
    NOM_ACREDITADO.Control     := Nil;
    DESC_L_PROD_GPO.Control    := Nil;
    DESC_L_PRODUCTO.Control    := Nil;
    NOM_CONTRATO_DV.Control    := Nil;

    vgCheckListBox := Nil;
    End;
end;

procedure TWMblqma.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMBlqMa.ilID_CREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show := True;
end;

procedure TWMBlqMa.ObtenDescripcion(peStrBuffer, peStrSQL, peStrNomCampo: String;
                                           peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo;
                                           peCheckBox : TCheckBox
                                          );
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

procedure TWMBlqMa.ilID_CREDITOEjecuta(Sender: TObject);
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
                       chkID_CREDITO
                     );
end;

procedure TWMBlqMa.ilID_CONTRATOEjecuta(Sender: TObject);
begin
 With Objeto Do
    ObtenDescripcion(  ilID_CONTRATO.Buffer,
                       ' SELECT P.NOMBRE AS NOM_ACREDITADO'+coCRLF+
                       ' FROM  CONTRATO CTO,'+coCRLF+
                       '       PERSONA P'+coCRLF+
                       ' WHERE CTO.ID_CONTRATO = '+ilID_CONTRATO.Buffer+coCRLF+
                       '   AND P.ID_PERSONA = CTO.ID_TITULAR',
                       'NOM_ACREDITADO',
                       ID_CONTRATO,
                       NOM_CONTRATO,
                       chkID_CONTRATO
                     );
end;

procedure TWMBlqMa.ilID_ACREDITADOEjecuta(Sender: TObject);
begin
 With Objeto Do
    ObtenDescripcion(  ilID_ACREDITADO.Buffer,
                       ' SELECT P.NOMBRE AS NOM_ACREDITADO'+coCRLF+
                       ' FROM  PERSONA P'+coCRLF+
                       ' WHERE P.ID_PERSONA = '+ilID_ACREDITADO.Buffer,
                       'NOM_ACREDITADO',
                       ID_ACREDITADO,
                       NOM_ACREDITADO,
                       chkID_ACREDITADO
                     );
end;

procedure TWMBlqMa.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
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
                       chkCVE_PRODUCTO_GPO
                     );
end;

procedure TWMBlqMa.ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
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
                       chkCVE_PRODUCTO_CRE
                     );
end;

procedure TWMBlqMa.ilID_CONTRATO_DVEjecuta(Sender: TObject);
begin
 With Objeto Do
    ObtenDescripcion(  ilID_CONTRATO_DV.Buffer,
                       ' SELECT P.NOMBRE AS NOM_CONTRATO_DV'+coCRLF+
                       ' FROM  CONTRATO CTO,'+coCRLF+
                       '       PERSONA P'+coCRLF+
                       ' WHERE CTO.ID_CONTRATO = '+ilID_CONTRATO_DV.Buffer+coCRLF+
                       '   AND P.ID_PERSONA = CTO.ID_TITULAR',
                       'NOM_CONTRATO_DV',
                       ID_CONTRATO_DV,
                       NOM_CONTRATO_DV,
                       chkID_CONTRATO_DV
                     );
end;

procedure TWMBlqMa.HabilitaCtrlsFecha(peDateTimePicker1 : TDateTimePicker;
                                             peComboBox : TComboBox;
                                             peDateTimePicker2 : TDateTimePicker;
                                             pebEnabled : Boolean
                                            );
begin
  If (pebEnabled) Then
    Begin
    peDateTimePicker1.Color := clWindow;
    peComboBox.Color := clWindow;
    peComboBox.ItemIndex := 1;
    peDateTimePicker2.Color := clWindow;
    End
  Else
    Begin
    peDateTimePicker1.Color := clBtnFace;
    peComboBox.Color := clBtnFace;
    peComboBox.ItemIndex := 0;
    peDateTimePicker2.Color := clBtnFace;
    End;

  peDateTimePicker1.Enabled := pebEnabled;
  peComboBox.Enabled := pebEnabled;
  peDateTimePicker2.Enabled := pebEnabled;
end;

procedure TWMBlqMa.MuestraCtrlsFecha(peDateTimePicker1 : TDateTimePicker; peComboBox : TComboBox);
begin
  peDateTimePicker1.Visible := peComboBox.Items[peComboBox.ItemIndex] = C_ENTRE;
end;

procedure TWMBlqMa.LimpiaControles(peCheckBox: TCheckBox; peCVE_INTERCAMPO, peDESC_INTERCAMPO: TInterCampo);
begin
  If (Not peCheckBox.Checked) Then
    Begin
    peCVE_INTERCAMPO.AsString  := '';
    peDESC_INTERCAMPO.AsString := '';
    End;
end;

procedure TWMBlqMa.chkID_CREDITOClick(Sender: TObject);
begin
  LimpiaControles(chkID_CREDITO, Objeto.ID_CREDITO, Objeto.NOM_CREDITO);
end;

procedure TWMBlqMa.chkID_CONTRATOClick(Sender: TObject);
begin
  LimpiaControles(chkID_CONTRATO, Objeto.ID_CONTRATO, Objeto.NOM_CONTRATO);
end;

procedure TWMBlqMa.chkID_ACREDITADOClick(Sender: TObject);
begin
  LimpiaControles(chkID_ACREDITADO, Objeto.ID_ACREDITADO, Objeto.NOM_ACREDITADO);
end;

procedure TWMBlqMa.chkCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
  LimpiaControles(chkCVE_PRODUCTO_GPO, Objeto.CVE_PRODUCTO_GPO, Objeto.DESC_L_PROD_GPO);
end;

procedure TWMBlqMa.chkCVE_PRODUCTO_CREClick(Sender: TObject);
begin
  LimpiaControles(chkCVE_PRODUCTO_CRE, Objeto.CVE_PRODUCTO_CRE, Objeto.DESC_L_PRODUCTO);
end;

procedure TWMBlqMa.chkID_CONTRATO_DVClick(Sender: TObject);
begin
  LimpiaControles(chkID_CONTRATO_DV, Objeto.ID_CONTRATO_DV, Objeto.NOM_CONTRATO_DV);
end;

procedure TWMBlqMa.CreaBuscador1(peStrNomBuscador : String;
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

procedure TWMBlqMa.btID_CREDITOClick(Sender: TObject);
begin
 With Objeto Do
   CreaBuscador1('CONSDISP.IT','',0,3, ID_CREDITO, NOM_CREDITO, chkID_CREDITO);
end;

procedure TWMBlqMa.btID_CONTRATOClick(Sender: TObject);
begin
 With Objeto Do
   CreaBuscador1('CONSCTO.IT','S,S',0,2, ID_CONTRATO, NOM_CONTRATO, chkID_CONTRATO);
end;

procedure TWMBlqMa.btID_ACREDITADOClick(Sender: TObject);
begin
 With Objeto Do
   CreaBuscador1('CONSACRED.IT','',0,1,ID_ACREDITADO, NOM_ACREDITADO, chkID_ACREDITADO);
end;

procedure TWMBlqMa.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
 With Objeto Do
   CreaBuscador1('CONSPRODGPO.IT','',0,1,CVE_PRODUCTO_GPO, DESC_L_PROD_GPO, chkCVE_PRODUCTO_GPO);
end;

procedure TWMBlqMa.btCVE_PRODUCTO_CREClick(Sender: TObject);
begin
 With Objeto Do
   CreaBuscador1('CONSCRPROD.IT','',0,1,CVE_PRODUCTO_CRE, DESC_L_PRODUCTO, chkCVE_PRODUCTO_CRE);
end;

procedure TWMBlqMa.btID_CONTRATO_DVClick(Sender: TObject);
begin
 With Objeto Do
   CreaBuscador1('CONSCHEQ.IT','S,S',0,2,ID_CONTRATO_DV, NOM_CONTRATO_DV, chkID_CONTRATO_DV);
end;

procedure TWMBlqMa.chkF_DISPOSICION_FClick(Sender: TObject);
begin
  HabilitaCtrlsFecha(dtpF_DISPOSICION_I, cbxF_DISPOSICION, dtpF_DISPOSICION_F,
                     chkF_DISPOSICION_F.Checked);
end;

procedure TWMBlqMa.chkF_VENCIMIENTO_AClick(Sender: TObject);
begin
  HabilitaCtrlsFecha(dtpF_VENCIMIENTO_A_I, cbxF_VENCIMIENTO_A, dtpF_VENCIMIENTO_A_F,
                     chkF_VENCIMIENTO_A.Checked);
end;

procedure TWMBlqMa.chkF_VENCIMIENTOClick(Sender: TObject);
begin
  HabilitaCtrlsFecha(dtpF_VENCIMIENTO_I, cbxF_VENCIMIENTO, dtpF_VENCIMIENTO_F,
                     chkF_VENCIMIENTO.Checked);
end;

procedure TWMBlqMa.chkF_ALTAClick(Sender: TObject);
begin
  HabilitaCtrlsFecha(dtpF_ALTA_I, cbxF_ALTA, dtpF_ALTA_F,
                     chkF_ALTA.Checked);
end;

procedure TWMBlqMa.cbxF_DISPOSICIONChange(Sender: TObject);
begin
  MuestraCtrlsFecha(dtpF_DISPOSICION_I, cbxF_DISPOSICION);
end;

procedure TWMBlqMa.cbxF_VENCIMIENTO_AChange(Sender: TObject);
begin
  MuestraCtrlsFecha(dtpF_VENCIMIENTO_A_I, cbxF_VENCIMIENTO_A);
end;

procedure TWMBlqMa.cbxF_VENCIMIENTOChange(Sender: TObject);
begin
  MuestraCtrlsFecha(dtpF_VENCIMIENTO_I, cbxF_VENCIMIENTO);
end;

procedure TWMBlqMa.cbxF_ALTAChange(Sender: TObject);
begin
  MuestraCtrlsFecha(dtpF_ALTA_I, cbxF_ALTA);
end;

procedure TMBlqMa.GetDataFromControls;
begin
  ID_CREDITO.GetFromControl;
  ID_CONTRATO.GetFromControl;
  ID_ACREDITADO.GetFromControl;
  CVE_PRODUCTO_GPO.GetFromControl;
  CVE_PRODUCTO_CRE.GetFromControl;
  ID_CONTRATO_DV.GetFromControl;

  CVE_F_DISPOSICION_I.GetFromControl;
  CVE_F_VENCIMIENTO_A_I.GetFromControl;
  CVE_F_VENCIMIENTO_I.GetFromControl;
  CVE_F_ALTA_I.GetFromControl;

  NOM_CREDITO.GetFromControl;
  NOM_CONTRATO.GetFromControl;
  NOM_ACREDITADO.GetFromControl;
  DESC_L_PROD_GPO.GetFromControl;
  DESC_L_PRODUCTO.GetFromControl;
  NOM_CONTRATO_DV.GetFromControl;
end;


function TMBlqMa.ArmaSQL: String;

   function FiltroFecha(peStrCampo : String; peInterCampoFechaI, peInterCampoFiltro, peInterCampoFechaF : TInterCampo) : String;
   begin
      Result := '';
      If (Trim(peInterCampoFiltro.AsString) <> '') Then
         Begin
         If (Trim(peInterCampoFiltro.AsString) = C_ENTRE) Then
            Result := ' AND '+peStrCampo+' BETWEEN '+SQLFecha(peInterCampoFechaI.AsDateTime)+' AND '+SQLFecha(peInterCampoFechaF.AsDateTime)+coCRLF
            //Result := ' AND '+peStrCampo+' BETWEEN '+SQLFecha(peInterCampoFechaI.AsDateTime)+' BETWEEN '+SQLFecha(peInterCampoFechaF.AsDateTime)+coCRLF
         Else
            Result := ' AND '+peStrCampo+' '+peInterCampoFiltro.AsString+' '+SQLFecha(peInterCampoFechaF.AsDateTime)+coCRLF;
         End;
   end;

var vlSQL, vlstrComa,
    vlstrFilterID_CREDITO,
    vlstrFilterID_CREDITO_1,
    vlstrFilterID_CONTRATO,
    vlstrFilterID_ACREDITADO,
    vlstrFilterCVE_PRODUCTO_GPO,
    vlstrFilterCVE_PRODUCTO_CRE,
    vlstrFilterID_CONTRATO_DV,
    vlstrFilterID_CONTRATO_DV_1,
    vlstrFilterF_DISPOSICION,
    vlstrFilterF_VENCIMIENTO_A,
    vlstrFilterF_VENCIMIENTO,
    vlstrFilterF_ALTA,
    vlstrFilterCVE_BLQ_CPTO : String;

    vlnItem : Integer;
begin
  GetDataFromControls;

  vlstrFilterID_CREDITO       := '';
  vlstrFilterID_CREDITO_1     := '';
  vlstrFilterID_CONTRATO      := '';
  vlstrFilterID_ACREDITADO    := '';
  vlstrFilterCVE_PRODUCTO_GPO := '';
  vlstrFilterCVE_PRODUCTO_CRE := '';
  vlstrFilterID_CONTRATO_DV   := '';
  vlstrFilterF_DISPOSICION    := FiltroFecha('R.F_INICIO', F_DISPOSICION_I, CVE_F_DISPOSICION_I, F_DISPOSICION_F);
  vlstrFilterF_VENCIMIENTO_A  := FiltroFecha('R.F_PROX_AMORT', F_VENCIMIENTO_A_I, CVE_F_VENCIMIENTO_A_I, F_VENCIMIENTO_A_F);
  vlstrFilterF_VENCIMIENTO    := FiltroFecha('R.F_VENCIMIENTO', F_VENCIMIENTO_I, CVE_F_VENCIMIENTO_I, F_VENCIMIENTO_F);
  vlstrFilterF_ALTA           := FiltroFecha('TRUNC(CBT.FH_ACTIVACION)', F_ALTA_I, CVE_F_ALTA_I, F_ALTA_F);


  // Incia la obtención de los filtros de Clave de Conceptos
  vlstrFilterCVE_BLQ_CPTO := ''; vlstrComa := '';
  For vlnItem := 0 To vgCheckListBox.Items.Count - 1 Do
    If (Not vgCheckListBox.Checked[vlnItem]) Then
       Begin
       vlstrFilterCVE_BLQ_CPTO := vlstrFilterCVE_BLQ_CPTO + vlstrComa + SQLStr(vgStrListCptos[vlnItem]);
       vlstrComa := ',';
       End;

  If (vlstrFilterCVE_BLQ_CPTO <> '') Then
    vlstrFilterCVE_BLQ_CPTO := ' AND CBC.CVE_BLQ_CPTO NOT IN (' + vlstrFilterCVE_BLQ_CPTO + ')'+coCRLF;

  If (ID_CREDITO.AsInteger <> 0) Then
    Begin
    vlstrFilterID_CREDITO   := ' AND CC.ID_CREDITO = '+ID_CREDITO.AsString+coCRLF;
    vlstrFilterID_CREDITO_1 := ' AND CBSC.ID_CREDITO = '+ID_CREDITO.AsString+coCRLF;
    End;

  If (ID_CONTRATO.AsInteger <> 0) Then
    Begin
    vlstrFilterID_CONTRATO   := ' AND CO.ID_CONTRATO = '+ID_CONTRATO.AsString+coCRLF;
    End;

  If (ID_ACREDITADO.AsInteger <> 0) Then
    vlstrFilterID_ACREDITADO   := ' AND CTO.ID_TITULAR = '+ID_ACREDITADO.AsString+coCRLF;

  If (TRim(CVE_PRODUCTO_GPO.AsString) <> '') Then
    vlstrFilterCVE_PRODUCTO_GPO := ' AND TEMP.CVE_PRODUCTO_GPO = '+SQLStr(CVE_PRODUCTO_GPO.AsString)+coCRLF;

  If (Trim(CVE_PRODUCTO_CRE.AsString) <> '') Then
    vlstrFilterCVE_PRODUCTO_CRE := ' AND TEMP.CVE_PRODUCTO_CRE = '+SQLStr(CVE_PRODUCTO_CRE.AsString)+coCRLF;

  If (ID_CONTRATO_DV.AsInteger <> 0) Then
    Begin
    vlstrFilterID_CONTRATO_DV    := ' AND CBT.ID_CONTRATO_DV  = '+ID_CONTRATO_DV.AsString+coCRLF;
    vlstrFilterID_CONTRATO_DV_1  := ' AND CBSC.ID_CONTRATO_DV = '+ID_CONTRATO_DV.AsString+coCRLF;
    End;

  vlSQL :=
            ' SELECT R.*'+coCRLF+
            ' FROM ( SELECT CTO.ID_TITULAR AS ID_ACREDITADO,'+coCRLF+
            '               P.NOMBRE AS NOM_ACREDITADO,'+coCRLF+
            '               PDV.NOMBRE AS NOM_TITULAR,'+coCRLF+
            '               CTO.CVE_MONEDA,'+coCRLF+
            '               CTODV.CVE_MONEDA AS CVE_MONEDA_DV,'+coCRLF+
            '               M.DESC_MONEDA,'+coCRLF+
            '               MDV.DESC_MONEDA AS DESC_MONEDA_DV,'+coCRLF+
            '               TEMP.*,'+coCRLF+
            '               DECODE(TEMP.TIPO_AFECTACION, ''I'', ''Bloqueados'', ''Desbloqueados'') AS DESC_AFECTACION,'+coCRLF+
            '               ''F'' AS B_RESUMEN'+coCRLF;

 If (Trim(vlstrFilterF_VENCIMIENTO_A) <> '') Then
  vlSQL :=   vlSQL +
            '               , PKGCRGTIA.OBT_F_PROX_AMORT(0, TEMP.ID_CREDITO, TRUNC('+SQLFecha(Apli.DameFechaEmpresa)+')) AS F_PROX_AMORT'+coCRLF;

  vlSQL :=   vlSQL +
            '        FROM  ( -------------------------------------------------------'+coCRLF+
            '                -- Obtiene las diposiciones que están en ICRE'+coCRLF+
            '                SELECT ''ICRE'' AS CVE_ORIGEN,'+coCRLF+
            '                       CP.CVE_PRODUCTO_GPO,'+coCRLF+
            '                       CO.CVE_PRODUCTO_CRE,'+coCRLF+
            '                       CO.ID_CONTRATO,'+coCRLF+
            '                       CC.ID_CREDITO,'+coCRLF+
            '                       CC.SIT_CREDITO,'+coCRLF+
            '                       CC.F_INICIO,'+coCRLF+
            '                       CC.F_VENCIMIENTO,'+coCRLF+
            '                       CBT.ID_BLQ_TRANSAC,'+coCRLF+
            '                       CBT.CVE_BLQ_CPTO,'+coCRLF+
            '                       CBT.CVE_BLQ_OPERACION,'+coCRLF+
            '                       CBT.ID_CONTRATO_DV,'+coCRLF+
            '                       (CBT.IMP_SALDO * DECODE(CBT.TIPO_AFECTACION, ''I'', 1, -1)) AS IMP_SALDO,'+coCRLF+
            '                       CBT.FH_ACTIVACION,'+coCRLF+
            '                       CBT.CVE_USU_ACTIVACION,'+coCRLF+
            '                       CBT.DESC_BLQ_CPTO,'+coCRLF+
            '                       CBT.TIPO_AFECTACION'+coCRLF+
            '                FROM ( SELECT CBT.*, CBO.TIPO_AFECTACION, CBC.DESC_BLQ_CPTO'+coCRLF+
            '                       FROM CR_BLQ_TRANSAC CBT,'+coCRLF+
            '                            CR_BLQ_OPERACION CBO,'+coCRLF+
            '                            CR_BLQ_CONCEPTO CBC'+coCRLF+
            '                       WHERE CBO.CVE_BLQ_OPERACION = CBT.CVE_BLQ_OPERACION'+coCRLF+
            '                         AND CBT.SIT_TRANS_BLOQ NOT IN (''PA'',''ER'') -- Se muestran las transacciones procesadas'+coCRLF+
            '                         AND CBC.CVE_BLQ_CPTO = CBT.CVE_BLQ_CPTO'+coCRLF+
            '                         '+vlstrFilterCVE_BLQ_CPTO+
            '                         '+vlstrFilterF_ALTA+            
            coCRLF+
            '                     ) CBT,'+coCRLF+
            '                     CR_CREDITO CC,'+coCRLF+
            '                     CR_CONTRATO CO,'+coCRLF+
            '                     CR_PRODUCTO CP'+coCRLF+
            '                WHERE 1 = 1'+coCRLF+
            '                   '+vlstrFilterID_CREDITO+
            '                   '+vlstrFilterID_CONTRATO+
            '                   '+vlstrFilterID_CONTRATO_DV+
            coCRLF+
            '                  AND CC.ID_CREDITO = CBT.ID_CREDITO'+coCRLF+
            '                  AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '                  AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE'+coCRLF+
            '             UNION'+coCRLF+
            '                -------------------------------------------------------'+coCRLF+
            '                -- Obtiene las diposiciones que están en INTERCRÉDITOS'+coCRLF+
            '                SELECT ''CRED'' AS CVE_ORIGEN,'+coCRLF+
            '                       TO_CHAR(CO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_GPO,'+coCRLF+
            '                       TO_CHAR(CO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE,'+coCRLF+
            '                       CO.ID_CONTRATO,'+coCRLF+
            '                       CC.ID_CREDITO,'+coCRLF+
            '                       CC.SIT_CREDITO,'+coCRLF+            
            '                       CC.F_VALOR_CRED AS F_INICIO,'+coCRLF+
            '                       (CC.F_VALOR_CRED + CC.DIAS_PLAZO) F_VENCIMIENTO,'+coCRLF+
            '                       CBT.ID_BLQ_TRANSAC,'+coCRLF+
            '                       CBT.CVE_BLQ_CPTO,'+coCRLF+
            '                       CBT.CVE_BLQ_OPERACION,'+coCRLF+
            '                       CBT.ID_CONTRATO_DV,'+coCRLF+
            '                       (CBT.IMP_SALDO * DECODE(CBT.TIPO_AFECTACION, ''I'', 1, -1)) AS IMP_SALDO,'+coCRLF+
            '                       CBT.FH_ACTIVACION,'+coCRLF+
            '                       CBT.CVE_USU_ACTIVACION,'+coCRLF+
            '                       CBT.DESC_BLQ_CPTO,'+coCRLF+
            '                       CBT.TIPO_AFECTACION'+coCRLF+
            '                FROM ( SELECT CBT.*, CBO.TIPO_AFECTACION, CBC.DESC_BLQ_CPTO'+coCRLF+
            '                       FROM CR_BLQ_TRANSAC CBT,'+coCRLF+
            '                            CR_BLQ_OPERACION CBO,'+coCRLF+
            '                            CR_BLQ_CONCEPTO CBC'+coCRLF+
            '                       WHERE CBO.CVE_BLQ_OPERACION = CBT.CVE_BLQ_OPERACION'+coCRLF+
            '                         AND CBT.SIT_TRANS_BLOQ NOT IN (''PA'',''ER'') -- Se muestran las transacciones procesadas'+coCRLF+
            '                         AND CBC.CVE_BLQ_CPTO = CBT.CVE_BLQ_CPTO'+coCRLF+
            '                         '+vlstrFilterCVE_BLQ_CPTO+
            '                         '+vlstrFilterF_ALTA+                        
            coCRLF+
            '                     ) CBT,'+coCRLF+
            '                     CRE_CREDITO CC,'+coCRLF+
            '                     CRE_CONTRATO CO'+coCRLF+
            '                WHERE 1 = 1'+coCRLF+
            '                   '+vlstrFilterID_CREDITO+
            '                   '+vlstrFilterID_CONTRATO+
            '                   '+vlstrFilterID_CONTRATO_DV+
            coCRLF+
            '                  AND CC.ID_CREDITO = CBT.ID_CREDITO'+coCRLF+
            '                  AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '               ) TEMP,'+coCRLF+
            '               CONTRATO CTO,'+coCRLF+
            '               PERSONA P,'+coCRLF+
            '               CONTRATO CTODV,'+coCRLF+
            '               PERSONA PDV,'+coCRLF+
            '               MONEDA M,'+coCRLF+
            '               MONEDA MDV'+coCRLF+
            '         WHERE CTO.ID_CONTRATO = TEMP.ID_CONTRATO'+coCRLF+
            '           '+vlstrFilterID_ACREDITADO+
            '           '+vlstrFilterCVE_PRODUCTO_GPO+
            '           '+vlstrFilterCVE_PRODUCTO_CRE+
            coCRLF+
            '           AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
            '           AND CTODV.ID_CONTRATO = TEMP.ID_CONTRATO_DV'+coCRLF+
            '           AND PDV.ID_PERSONA = CTODV.ID_TITULAR'+coCRLF+
            '           AND M.CVE_MONEDA = CTO.CVE_MONEDA'+coCRLF+
            '           AND MDV.CVE_MONEDA = CTODV.CVE_MONEDA'+coCRLF+
            ' UNION ALL'+coCRLF+
            '           SELECT 0 AS ID_ACREDITADO,'+coCRLF+
            '                  '' '' AS NOM_ACREDITADO,'+coCRLF+
            '                  PDV.NOMBRE AS NOM_TITULAR,'+coCRLF+
            '                  0 AS CVE_MONEDA,'+coCRLF+
            '                  CTODV.CVE_MONEDA AS CVE_MONEDA_DV,'+coCRLF+
            '                  '' '' AS DESC_MONEDA,'+coCRLF+
            '                  MDV.DESC_MONEDA AS DESC_MONEDA_DV,'+coCRLF+
            '                  '' '' AS CVE_ORIGEN,'+coCRLF+
            '                  '' '' AS CVE_PRODUCTO_GPO,'+coCRLF+
            '                  '' '' AS CVE_PRODUCTO_CRE,'+coCRLF+
            '                  0 AS ID_CONTRATO,'+coCRLF+
            '                  0 AS ID_CREDITO,'+coCRLF+
            '                  '' '' AS SIT_CREDITO,'+coCRLF+            
            '                  TO_DATE(''01/01/1980'',''DD/MM/YYYY'') AS F_INICIO,'+coCRLF+
            '                  TO_DATE(''01/01/1980'',''DD/MM/YYYY'') AS F_VENCIMIENTO,'+coCRLF+
            '                  0 AS ID_BLQ_TRANSAC,'+coCRLF+
            '                  CBSC.CVE_BLQ_CPTO,'+coCRLF+
            '                  '' '' AS CVE_BLQ_OPERACION,'+coCRLF+
            '                  CBSC.ID_CONTRATO_DV,'+coCRLF+
            '                  CBSC.IMP_SDO_BLOQUEO AS IMP_SALDO,'+coCRLF+
            '                  TO_DATE(''01/01/1980'',''DD/MM/YYYY'') AS FH_ACTIVACION,'+coCRLF+
            '                  '' '' AS CVE_USU_ACTIVACION,'+coCRLF+
            '                  CBC.DESC_BLQ_CPTO,'+coCRLF+
            '                  ''D'' AS TIPO_AFECTACION,'+coCRLF+
            '                  '' '' AS DESC_AFECTACION,'+coCRLF+
            '                  ''V'' AS B_RESUMEN'+coCRLF+
            '           FROM   ( SELECT CBT.ID_CONTRATO_DV'+coCRLF+
            '                    FROM CR_BLQ_TRANSAC CBT,'+coCRLF+
            '                         CR_BLQ_OPERACION CBO,'+coCRLF+
            '                         CR_BLQ_CONCEPTO CBC,'+coCRLF+
            '                         CONTRATO CTO'+coCRLF+
            '                    WHERE CBO.CVE_BLQ_OPERACION = CBT.CVE_BLQ_OPERACION'+coCRLF+
            '                      AND CBT.SIT_TRANS_BLOQ NOT IN (''PA'',''ER'') -- Se muestran las transacciones procesadas'+coCRLF+
            '                      AND CBC.CVE_BLQ_CPTO = CBT.CVE_BLQ_CPTO'+coCRLF+
            '                      AND CTO.ID_CONTRATO = CBT.ID_CONTRATO'+coCRLF+
            '                      '+vlstrFilterF_ALTA+
            '                      '+vlstrFilterID_CONTRATO_DV+coCRLF+
            '                      '+vlstrFilterCVE_BLQ_CPTO+coCRLF+
            '                      '+vlstrFilterID_ACREDITADO+            
            '                    GROUP BY CBT.ID_CONTRATO_DV'+coCRLF+
            '                   ) CTO_DV_MOSTRAR,'+coCRLF+
            '                ( SELECT CBSC.ID_CONTRATO_DV, CBSC.CVE_BLQ_CPTO, SUM(CBSC.IMP_SDO_BLOQUEO) AS IMP_SDO_BLOQUEO'+coCRLF+
            '                  FROM CR_BLQ_SDO_CHEQ CBSC'+coCRLF+
            '                  WHERE 1 = 1'+coCRLF+
            '                  '+vlstrFilterID_CREDITO_1+
            '                  GROUP BY CBSC.ID_CONTRATO_DV, CBSC.CVE_BLQ_CPTO'+coCRLF+
            '                ) CBSC,'+coCRLF+
            '                CR_BLQ_CONCEPTO CBC,'+coCRLF+
            '                CONTRATO CTODV,'+coCRLF+
            '                PERSONA PDV,'+coCRLF+
            '                MONEDA MDV'+coCRLF+
            '           WHERE CTODV.ID_CONTRATO = CBSC.ID_CONTRATO_DV'+coCRLF+
            '             AND CTO_DV_MOSTRAR.ID_CONTRATO_DV = CBSC.ID_CONTRATO_DV'+coCRLF+
            '             AND PDV.ID_PERSONA = CTODV.ID_TITULAR'+coCRLF+
            '             AND CBC.CVE_BLQ_CPTO = CBSC.CVE_BLQ_CPTO'+coCRLF+
            '             AND MDV.CVE_MONEDA = CTODV.CVE_MONEDA'+coCRLF+
            '             '+vlstrFilterID_CONTRATO_DV_1+
            '             '+vlstrFilterCVE_BLQ_CPTO+
//            '             AND CBSC.IMP_SDO_BLOQUEO > 0'+coCRLF+
            '       ) R'+coCRLF+
            ' WHERE 1 = 1'+coCRLF+
            ' '+vlstrFilterF_DISPOSICION+
            ' '+vlstrFilterF_VENCIMIENTO+
            ' ORDER BY R.CVE_MONEDA_DV, R.NOM_TITULAR, R.ID_CONTRATO_DV, R.TIPO_AFECTACION DESC, R.B_RESUMEN, R.DESC_BLQ_CPTO'+coCRLF
          ;

  Result := vlSQL;
end;

procedure TWMBlqMa.chkCVE_BLQ_CPTOClick(Sender: TObject);
var vlIndex : Integer;
begin
  For vlIndex := 0 To chklstCVE_BLQ_CPTO.Items.Count - 1 Do
    chklstCVE_BLQ_CPTO.Checked[vlIndex] := chkCVE_BLQ_CPTO.Checked;
end;

procedure TWMBlqMa.chkExcelClick(Sender: TObject);
begin
 edFileName.Enabled  := chkExcel.Checked;
 btFileExcel.Enabled := chkExcel.Checked;
 opPlano.Enabled     := chkExcel.Checked;
 opReporte.Enabled   := chkExcel.Checked;

 If chkExcel.Enabled Then edFileName.Color := clWindow
 Else edFileName.Color := clBtnFace;
end;

procedure TWMBlqMa.btFileExcelClick(Sender: TObject);
begin
  If SaveDialog1.Execute Then
    edFileName.Text := SaveDialog1.FileName;
end;

function TWMblqma.ObtenNombreArchivo: String;
begin
  Result := '';
  If ((chkExcel.Checked) And (Trim(edFileName.Text) <> '')) Then
    Result := edFileName.Text;
end;

function TWMblqma.ObtenOpcion: Integer;
begin
  Result := -1;
  If (chkExcel.Checked) Then
    Begin
    If opPlano.Checked Then Result := 0
    Else Result := 1;
    End;
end;

procedure TWMblqma.SetDataToControls;
begin
  With Objeto Do
    Begin
    F_DISPOSICION_I.AsDateTime   := dtpF_DISPOSICION_I.DateTime;
    F_VENCIMIENTO_A_I.AsDateTime := dtpF_VENCIMIENTO_A_I.DateTime;
    F_VENCIMIENTO_I.AsDateTime   := dtpF_VENCIMIENTO_I.DateTime;
    F_ALTA_I.AsDateTime          := dtpF_ALTA_I.DateTime;

    F_DISPOSICION_F.AsDateTime   := dtpF_DISPOSICION_F.DateTime;
    F_VENCIMIENTO_A_F.AsDateTime := dtpF_VENCIMIENTO_A_F.DateTime;
    F_VENCIMIENTO_F.AsDateTime   := dtpF_VENCIMIENTO_F.DateTime;
    F_ALTA_F.AsDateTime          := dtpF_ALTA_F.DateTime;
    End;
end;  

procedure TWMblqma.InterForma1Imprimir(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMBLQMA_IMPRI',True,True) then
   begin
      SetDataToControls;
      RepBlqMa(Objeto.Apli, Objeto.ArmaSQL, False,
               ObtenNombreArchivo, ObtenOpcion);
   end;
end;

procedure TWMblqma.InterForma1Preview(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMBLQMA_PREVI',True,True) then
   begin
      SetDataToControls;
      RepBlqMa(Objeto.Apli, Objeto.ArmaSQL, True,
               ObtenNombreArchivo, ObtenOpcion);
   end;
end;

procedure TWMblqma.LLenaCptosBloqueo;
var vlQry : TQuery;
    vlnItem : Integer;
begin
  vlQry := GetSQLQueryNoNil('SELECT CVE_BLQ_CPTO, DESC_BLQ_CPTO FROM CR_BLQ_CONCEPTO WHERE SIT_BLQ_CONCEPTO = ''AC'' ',
                            Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
  If Assigned(vlQry) Then
     With vlQry Do
       Try
         vlnItem := 0;
         While Not Eof do
           Begin
           Objeto.vgStrListCptos.Add(FieldByName('CVE_BLQ_CPTO').AsString);
           chklstCVE_BLQ_CPTO.Items.Add(FieldByName('DESC_BLQ_CPTO').AsString);
           chklstCVE_BLQ_CPTO.Checked[vlnItem] := True;
           Next; Inc(vlnItem);
           End;
       Finally
           vlQry.Close;
           vlQry.Free;
       End;
end;

end.
