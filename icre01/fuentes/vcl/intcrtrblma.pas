// Sistema         : Clase de CR_TRANS_BLQ_MAS
// Fecha de Inicio : 12/11/2008
// Función forma   : Clase de CR_TRANS_BLQ_MAS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrTrBlMa;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Tabs, IntLinkit, CheckLst,
Clipbrd,

IntParamCre,
IntGenCre,
Grids,
ImgList, Menus;

Const
  C_ENTRE = 'Entre';
  C_ESPACIO_EN_BLANCO = ' ';

  C_COL_B_CORTE             = 0;
  C_COL_ID_BLQ_TRANSAC      = 1;
  C_COL_BDESBLOQUEO         = 2;
  C_COL_ORIGEN              = 3;
  C_COL_ID_CONTRATO         = 4;
  C_COL_NOM_ACREDITADO      = 5;
  C_COL_ID_CREDITO          = 6;

  C_COL_F_INICIO           = 0;
  C_COL_F_VENCIMIENTO      = 1;
  C_COL_F_VENCIMIENTO_A    = 2;
  C_COL_CVE_PRODUCTO_GPO   = 3;
  C_COL_CVE_PRODUCTO_CRE   = 4;
  C_COL_CVE_BLQ_CPTO       = 5;
  C_COL_TX_REFERENCIA      = 6;
  C_COL_CVE_USU_ACTIVACION = 7;
  C_COL_FH_ACTIVACION      = 8;

  C_COL_ID_CONTRATO_DV  = 0;
  C_COL_NOM_TITULAR     = 1;
  C_COL_IMP_SALDO       = 2;

  CO_A_LBL : Array[0..9] of String = ('Fecha Inicio','Fecha Vencimiento','Fecha Próx. Amortización','Grupo de Producto',
                                      'Clave de Producto','Clave Cpto. Bloqueo','Id. Referencia','Usuario Activa','Fecha Activación',' ');

Type PDataRegistro = ^DataRegistro;
     DataRegistro = record
     ID_CREDITO          : Integer;
     ID_CONTRATO_DV      : Integer;
     CVE_BLQ_CPTO        : String;
     CVE_BLQ_OPERACION   : String;
     IMP_SALDO           : Double;
     end;
Type
 TCrTrBlMa= class;

  TWCrTransBlqMas=Class(TForm)
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
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btnBusca: TBitBtn;
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
    chkCVE_PRODUCTO_CRE: TCheckBox;
    chkID_CONTRATO_DV: TCheckBox;
    chkF_DISPOSICION_F: TCheckBox;
    edCVE_PRODUCTO_CRE: TEdit;
    btCVE_PRODUCTO_CRE: TBitBtn;
    edDESC_L_PRODUCTO: TEdit;
    edCVE_PRODUCTO_GPO: TEdit;
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
    btnDesbloquear: TButton;
    ilID_CREDITO: TInterLinkit;
    ilID_CONTRATO: TInterLinkit;
    ilID_ACREDITADO: TInterLinkit;
    ilCVE_PRODUCTO_CRE: TInterLinkit;
    ilID_CONTRATO_DV: TInterLinkit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    chkCVE_PRODUCTO_GPO: TCheckBox;
    shpIMP_SALDO: TShape;
    lbIMP_SALDO1: TLabel;
    shp2: TShape;
    shp1: TShape;
    lbl1: TLabel;
    lbl2: TLabel;
    shpBDESBLOQUEO: TShape;
    lblBDESBLOQUEO1: TLabel;
    shpNOM_ACREDITADO: TShape;
    lbNOM_ACREDITADO1: TLabel;
    StrGrd2: TStringGrid;
    StrGrd3: TStringGrid;
    shpCVE_ORIGEN: TShape;
    lblCVE_ORIGEN1: TLabel;
    shpID_CONTRATO: TShape;
    lbID_CONTRATO1: TLabel;
    shpID_CREDITO: TShape;
    lbID_CREDITO1: TLabel;
    shpID_CONTRATO_DV: TShape;
    lbID_CONTRATO_DV1: TLabel;
    shpNOM_TITULAR: TShape;
    lbNOM_TITULAR1: TLabel;
    shpTitulo: TShape;
    lbTitulo: TLabel;
    lbFH_ACTIVACION: TLabel;
    chkFH_ACTIVACION: TCheckBox;
    cbxFH_ACTIVACION: TComboBox;
    dtpFH_ACTIVACION_F: TDateTimePicker;
    dtpFH_ACTIVACION_I: TDateTimePicker;
    ImageList: TImageList;
    StrGrd1: TStringGrid;
    lbCVE_BLQ_CPTO: TLabel;
    chklstCVE_BLQ_CPTO: TCheckListBox;
    chkCVE_BLQ_CPTO: TCheckBox;
    PopupMenu1: TPopupMenu;
    CopiaTodoConCabecera1: TMenuItem;
    CopiaTodoSinCabecera1: TMenuItem;
    Copia1: TMenuItem;
    CopiaRegistroConCabecera1: TMenuItem;
    CopiaRegistroSinCabecera1: TMenuItem;
    CopiaTodoConCabeceraySinTotales1: TMenuItem;
    CopiaTodoSinCabeceraySinTotales1: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormDestroy(Sender : TObject);
    procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
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
    procedure btID_CREDITOClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure btID_ACREDITADOClick(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure btCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure btID_CONTRATO_DVClick(Sender: TObject);
    procedure chkF_DISPOSICION_FClick(Sender: TObject);
    procedure chkF_VENCIMIENTO_AClick(Sender: TObject);
    procedure chkF_VENCIMIENTOClick(Sender: TObject);
    procedure chkFH_ACTIVACIONClick(Sender: TObject);
    procedure cbxF_DISPOSICIONChange(Sender: TObject);
    procedure cbxF_VENCIMIENTO_AChange(Sender: TObject);
    procedure cbxF_VENCIMIENTOChange(Sender: TObject);
    procedure cbxFH_ACTIVACIONChange(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure StrGrd1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StrGrd1TopLeftChanged(Sender: TObject);
    procedure StrGrd1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure TabSetChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure StrGrd1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnDesbloquearClick(Sender: TObject);
    procedure chkCVE_BLQ_CPTOClick(Sender: TObject);
    procedure StrGrd3KeyPress(Sender: TObject; var Key: Char);
    procedure CopiaTodoConCabecera1Click(Sender: TObject);
    procedure CopiaTodoSinCabecera1Click(Sender: TObject);
    procedure CopiaTodoConCabeceraySinTotales1Click(Sender: TObject);
    procedure CopiaTodoSinCabeceraySinTotales1Click(Sender: TObject);
    procedure CopiaRegistroConCabecera1Click(Sender: TObject);
    procedure CopiaRegistroSinCabecera1Click(Sender: TObject);
    private
    { Private declarations }
    vgGrid : TStringGrid;
    public
    { Public declarations }
    Objeto : TCrTrBlMa;
    procedure ObtenDescripcion(peStrBuffer, peStrSQL, peStrNomCampo: String;
                               peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo;
                               peCheckBox : TCheckBox);
    procedure HabilitaCtrlsFecha(peDateTimePicker1 : TDateTimePicker;
                                 peComboBox : TComboBox;
                                 peDateTimePicker2 : TDateTimePicker;
                                 pebEnabled : Boolean
                                );
    procedure MuestraCtrlsFecha(peDateTimePicker1 : TDateTimePicker; peComboBox : TComboBox);

    procedure LimpiaControles(peCheckBox : TCheckBox; peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo);
    procedure CreaBuscador1(peStrNomBuscador : String;
                           peStrCamposBuscador : String;
                           penResultBusc1, penResultBusc2 : Integer;
                           peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo;
                           peCheckBox : TCheckBox
                          );
    procedure DespliegaDatos;
    procedure ObtenValoresdelRegistro(penRow : Integer; var DataRegistro : PDataRegistro);
    procedure ColocaDatos(peQry : TQuery);
    procedure LLenaCptosBloqueo;
    procedure SetDataToControls;

    procedure CopiaRegistrosaClipBoard(pebConCabecera, pebConTotales : Boolean; penPrimerRenglon, penUltimoRenglon : Integer);
end;
 TCrTrBlMa= class(TInterFrame)
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
        FH_ACTIVACION_I               : TInterCampo;

        CVE_F_DISPOSICION_I    : TInterCampo;
        CVE_F_VENCIMIENTO_A_I  : TInterCampo;
        CVE_F_VENCIMIENTO_I    : TInterCampo;
        CVE_FH_ACTIVACION_I           : TInterCampo;

        F_DISPOSICION_F        : TInterCampo;
        F_VENCIMIENTO_A_F      : TInterCampo;
        F_VENCIMIENTO_F        : TInterCampo;
        FH_ACTIVACION_F               : TInterCampo;

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
        function    StpRealizaDesbloq_X_Trans(peID_BLQ_TRANSAC: Integer) : Boolean;
        function    StpRealizaDesbloq_X_Row(peDataRegistro : PDataRegistro; var vlStrMsg : String ) : Boolean;
        function    InsTransBloqueo(peDataRegistro : PDataRegistro; var peID_BLQ_TRANSAC: Integer; var vlStrMsg : String ) : Boolean;
        function    ActivaTransBloqueo(peID_BLQ_TRANSAC : Integer; var vlStrMsg : String) : Boolean;
        function    ArmaSQL : String;
        function    ArmaSQL_1: String;
      published
      end;

implementation

{$R *.DFM}

constructor TCrTrBlMa.Create( AOwner : TComponent );
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
      FH_ACTIVACION_I :=CreaCampo('FH_ACTIVACION_I',ftDate,tsNinguno,tsNinguno,False);
                FH_ACTIVACION_I.Caption:='Fecha de Alta del Bloqueo';

      CVE_F_DISPOSICION_I :=CreaCampo('CVE_F_DISPOSICION_F',ftString,tsNinguno,tsNinguno,False);
      CVE_F_VENCIMIENTO_A_I :=CreaCampo('CVE_F_VENCIMIENTO_A_F',ftString,tsNinguno,tsNinguno,False);
      CVE_F_VENCIMIENTO_I :=CreaCampo('CVE_F_VENCIMIENTO_F',ftString,tsNinguno,tsNinguno,False);
      CVE_FH_ACTIVACION_I :=CreaCampo('CVE_FH_ACTIVACION_F',ftString,tsNinguno,tsNinguno,False);

      F_DISPOSICION_F :=CreaCampo('F_DISPOSICION_F',ftDate,tsNinguno,tsNinguno,False);
                F_DISPOSICION_F.Caption:='Fecha de Disposición';
      F_VENCIMIENTO_A_F :=CreaCampo('F_VENCIMIENTO_A_F',ftDate,tsNinguno,tsNinguno,False);
                F_VENCIMIENTO_A_F.Caption:='Fecha de Vencimiento de la Próxima Amortización';
      F_VENCIMIENTO_F :=CreaCampo('F_VENCIMIENTO_F',ftDate,tsNinguno,tsNinguno,False);
                F_VENCIMIENTO_F.Caption:='Fecha de Vencimiento de la Próxima Amortización';
      FH_ACTIVACION_F :=CreaCampo('FH_ACTIVACION_F',ftDate,tsNinguno,tsNinguno,False);
                FH_ACTIVACION_F.Caption:='Fecha de Alta del Bloqueo';

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
      HelpFile := 'IntCrTrBlMa.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrTrBlMa.Destroy;
begin inherited;
end;


function TCrTrBlMa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTransBlqMas;
begin
   W:=TWCrTransBlqMas.Create(Self);
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


Function TCrTrBlMa.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrTrBM.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_TRANS_BLQ_MAS********************)
(*                                                                              *)
(*  FORMA DE CR_TRANS_BLQ_MAS                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_TRANS_BLQ_MAS********************)

procedure TWCrTransBlqMas.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    // Coloca el ancho de las columnas
    StrGrd1.ColWidths[C_COL_B_CORTE]         := 0;
    StrGrd1.ColWidths[C_COL_ID_BLQ_TRANSAC]  := 0;
    StrGrd1.ColWidths[C_COL_BDESBLOQUEO]     := shpBDESBLOQUEO.Width - 2;
    StrGrd1.ColWidths[C_COL_ORIGEN]          := shpCVE_ORIGEN.Width - 2;
    StrGrd1.ColWidths[C_COL_ID_CONTRATO]     := shpID_CONTRATO.Width - 2;
    StrGrd1.ColWidths[C_COL_NOM_ACREDITADO]  := shpNOM_ACREDITADO.Width - 2;
    StrGrd1.ColWidths[C_COL_ID_CREDITO]      := shpID_CREDITO.Width - 2;

    StrGrd2.ColWidths[C_COL_F_INICIO]           := shp1.Width - 2;
    StrGrd2.ColWidths[C_COL_F_VENCIMIENTO]      := shp2.Width - 2;
    StrGrd2.ColWidths[C_COL_F_VENCIMIENTO_A]    := shp2.Width - 2;
    StrGrd2.ColWidths[C_COL_CVE_PRODUCTO_GPO]   := shp2.Width - 2;
    StrGrd2.ColWidths[C_COL_CVE_PRODUCTO_CRE]   := shp2.Width - 2;
    StrGrd2.ColWidths[C_COL_CVE_BLQ_CPTO]       := shp2.Width - 2;
    StrGrd2.ColWidths[C_COL_TX_REFERENCIA]      := shp2.Width - 2;
    StrGrd2.ColWidths[C_COL_CVE_USU_ACTIVACION] := shp2.Width - 2;
    StrGrd2.ColWidths[C_COL_FH_ACTIVACION]      := shp1.Width + shp2.Width - 2;

    StrGrd3.ColWidths[C_COL_ID_CONTRATO_DV]  := shpID_CONTRATO_DV.Width - 2;
    StrGrd3.ColWidths[C_COL_NOM_TITULAR]     := shpNOM_TITULAR.Width - 2;
    StrGrd3.ColWidths[C_COL_IMP_SALDO]       := shpIMP_SALDO.Width - 2;

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
    FH_ACTIVACION_I.Control    := dtpFH_ACTIVACION_I;

    CVE_F_DISPOSICION_I.Control    := cbxF_DISPOSICION;
    CVE_F_VENCIMIENTO_A_I.Control  := cbxF_VENCIMIENTO_A;
    CVE_F_VENCIMIENTO_I.Control    := cbxF_VENCIMIENTO;
    CVE_FH_ACTIVACION_I.Control    := cbxFH_ACTIVACION;

    CVE_F_DISPOSICION_I.AsString   := C_ESPACIO_EN_BLANCO;
    CVE_F_VENCIMIENTO_A_I.AsString := C_ESPACIO_EN_BLANCO;
    CVE_F_VENCIMIENTO_I.AsString   := C_ESPACIO_EN_BLANCO;
    CVE_FH_ACTIVACION_I.AsString   := C_ESPACIO_EN_BLANCO;

    F_DISPOSICION_F.Control    := dtpF_DISPOSICION_F;
    F_VENCIMIENTO_A_F.Control  := dtpF_VENCIMIENTO_A_F;
    F_VENCIMIENTO_F.Control    := dtpF_VENCIMIENTO_F;
    FH_ACTIVACION_F.Control    := dtpFH_ACTIVACION_F;

    NOM_CREDITO.Control        := edNOM_CREDITO;
    NOM_CONTRATO.Control       := edNOM_CONTRATO;
    NOM_ACREDITADO.Control     := edNOM_ACREDITADO;
    DESC_L_PROD_GPO.Control    := edDESC_L_PROD_GPO;
    DESC_L_PRODUCTO.Control    := edDESC_L_PRODUCTO;
    NOM_CONTRATO_DV.Control    := edNOM_CONTRATO_DV;


    F_DISPOSICION_F.AsDateTime     := Apli.DameFechaEmpresa;
    F_VENCIMIENTO_A_F.AsDateTime   := F_DISPOSICION_F.AsDateTime;
    F_VENCIMIENTO_F.AsDateTime     := F_DISPOSICION_F.AsDateTime;
    FH_ACTIVACION_F.AsDateTime     := F_DISPOSICION_F.AsDateTime;
    F_DISPOSICION_I.AsDateTime     := F_DISPOSICION_F.AsDateTime;
    F_VENCIMIENTO_A_I.AsDateTime   := F_DISPOSICION_F.AsDateTime;
    F_VENCIMIENTO_I.AsDateTime     := F_DISPOSICION_F.AsDateTime;
    FH_ACTIVACION_I.AsDateTime     := F_DISPOSICION_F.AsDateTime;

    dtpF_DISPOSICION_F.DateTime    := F_DISPOSICION_F.AsDateTime;
    dtpF_VENCIMIENTO_A_F.DateTime  := F_DISPOSICION_F.AsDateTime;
    dtpF_VENCIMIENTO_F.DateTime    := F_DISPOSICION_F.AsDateTime;
    dtpFH_ACTIVACION_F.DateTime    := F_DISPOSICION_F.AsDateTime;
    dtpF_DISPOSICION_I.DateTime    := F_DISPOSICION_F.AsDateTime;
    dtpF_VENCIMIENTO_A_I.DateTime  := F_DISPOSICION_F.AsDateTime;
    dtpF_VENCIMIENTO_I.DateTime    := F_DISPOSICION_F.AsDateTime;
    dtpFH_ACTIVACION_I.DateTime    := F_DISPOSICION_F.AsDateTime;


    vgCheckListBox := chklstCVE_BLQ_CPTO;
    LLenaCptosBloqueo;    

    B_MUESTRA_BLOQ.AsString := CVERDAD;
    End;
end;

procedure TWCrTransBlqMas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrTransBlqMas.FormDestroy(Sender: TObject);
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
    FH_ACTIVACION_I.Control    := Nil;

    CVE_F_DISPOSICION_I.Control    := Nil;
    CVE_F_VENCIMIENTO_A_I.Control  := Nil;
    CVE_F_VENCIMIENTO_I.Control    := Nil;
    CVE_FH_ACTIVACION_I.Control    := Nil;

    F_DISPOSICION_F.Control    := Nil;
    F_VENCIMIENTO_A_F.Control  := Nil;
    F_VENCIMIENTO_F.Control    := Nil;
    FH_ACTIVACION_F.Control    := Nil;

    NOM_CREDITO.Control        := Nil;
    NOM_CONTRATO.Control       := Nil;
    NOM_ACREDITADO.Control     := Nil;
    DESC_L_PROD_GPO.Control    := Nil;
    DESC_L_PRODUCTO.Control    := Nil;
    NOM_CONTRATO_DV.Control    := Nil;

    vgStrListCptos.Clear;
    vgStrListCptos.Free;
    End;
    Inherited;
end;

procedure TWCrTransBlqMas.ilID_CREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show := True;
end;

procedure TWCrTransBlqMas.ObtenDescripcion(peStrBuffer, peStrSQL, peStrNomCampo: String;
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

procedure TWCrTransBlqMas.ilID_CREDITOEjecuta(Sender: TObject);
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

procedure TWCrTransBlqMas.ilID_CONTRATOEjecuta(Sender: TObject);
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

procedure TWCrTransBlqMas.ilID_ACREDITADOEjecuta(Sender: TObject);
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

procedure TWCrTransBlqMas.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
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

procedure TWCrTransBlqMas.ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
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

procedure TWCrTransBlqMas.ilID_CONTRATO_DVEjecuta(Sender: TObject);
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

procedure TWCrTransBlqMas.HabilitaCtrlsFecha(peDateTimePicker1 : TDateTimePicker;
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

procedure TWCrTransBlqMas.MuestraCtrlsFecha(peDateTimePicker1 : TDateTimePicker; peComboBox : TComboBox);
begin
  peDateTimePicker1.Visible := peComboBox.Items[peComboBox.ItemIndex] = C_ENTRE;
end;

procedure TWCrTransBlqMas.LimpiaControles(peCheckBox: TCheckBox; peCVE_INTERCAMPO, peDESC_INTERCAMPO: TInterCampo);
begin
  If (Not peCheckBox.Checked) Then
    Begin
    peCVE_INTERCAMPO.AsString  := '';
    peDESC_INTERCAMPO.AsString := '';
    End;
end;

procedure TWCrTransBlqMas.chkID_CREDITOClick(Sender: TObject);
begin
  LimpiaControles(chkID_CREDITO, Objeto.ID_CREDITO, Objeto.NOM_CREDITO);
end;

procedure TWCrTransBlqMas.chkID_CONTRATOClick(Sender: TObject);
begin
  LimpiaControles(chkID_CONTRATO, Objeto.ID_CONTRATO, Objeto.NOM_CONTRATO);
end;

procedure TWCrTransBlqMas.chkID_ACREDITADOClick(Sender: TObject);
begin
  LimpiaControles(chkID_ACREDITADO, Objeto.ID_ACREDITADO, Objeto.NOM_ACREDITADO);
end;

procedure TWCrTransBlqMas.chkCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
  LimpiaControles(chkCVE_PRODUCTO_GPO, Objeto.CVE_PRODUCTO_GPO, Objeto.DESC_L_PROD_GPO);
end;

procedure TWCrTransBlqMas.chkCVE_PRODUCTO_CREClick(Sender: TObject);
begin
  LimpiaControles(chkCVE_PRODUCTO_CRE, Objeto.CVE_PRODUCTO_CRE, Objeto.DESC_L_PRODUCTO);
end;

procedure TWCrTransBlqMas.chkID_CONTRATO_DVClick(Sender: TObject);
begin
  LimpiaControles(chkID_CONTRATO_DV, Objeto.ID_CONTRATO_DV, Objeto.NOM_CONTRATO_DV);
end;

procedure TWCrTransBlqMas.CreaBuscador1(peStrNomBuscador : String;
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

procedure TWCrTransBlqMas.btID_CREDITOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRTRBLMA_DISP',True,True) then
   begin
     With Objeto Do
       CreaBuscador1('CONSDISP.IT','',0,3, ID_CREDITO, NOM_CREDITO, chkID_CREDITO);
   end;
end;

procedure TWCrTransBlqMas.btID_CONTRATOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRTRBLMA_AUTOR',True,True) then
   begin
     With Objeto Do
       CreaBuscador1('CONSCTO.IT','S,S',0,2, ID_CONTRATO, NOM_CONTRATO, chkID_CONTRATO);
   end;
end;

procedure TWCrTransBlqMas.btID_ACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRTRBLMA_ACRED',True,True) then
   begin
     With Objeto Do
       CreaBuscador1('CONSACRED.IT','',0,1,ID_ACREDITADO, NOM_ACREDITADO, chkID_ACREDITADO);
   end;
end;

procedure TWCrTransBlqMas.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRTRBLMA_GPOPD',True,True) then
   begin
     With Objeto Do
       CreaBuscador1('CONSPRODGPO.IT','',0,1,CVE_PRODUCTO_GPO, DESC_L_PROD_GPO, chkCVE_PRODUCTO_GPO);
   end;
end;

procedure TWCrTransBlqMas.btCVE_PRODUCTO_CREClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRTRBLMA_PROD',True,True) then
   begin
     With Objeto Do
       CreaBuscador1('CONSCRPROD.IT','',0,1,CVE_PRODUCTO_CRE, DESC_L_PRODUCTO, chkCVE_PRODUCTO_CRE);
   end;
end;

procedure TWCrTransBlqMas.btID_CONTRATO_DVClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRTRBLMA_CHEQ',True,True) then
   begin
     With Objeto Do
       CreaBuscador1('CONSCHEQ.IT','S,S',0,2,ID_CONTRATO_DV, NOM_CONTRATO_DV, chkID_CONTRATO_DV);
   end;
end;

procedure TWCrTransBlqMas.chkF_DISPOSICION_FClick(Sender: TObject);
begin
  HabilitaCtrlsFecha(dtpF_DISPOSICION_I, cbxF_DISPOSICION, dtpF_DISPOSICION_F,
                     chkF_DISPOSICION_F.Checked);
end;

procedure TWCrTransBlqMas.chkF_VENCIMIENTO_AClick(Sender: TObject);
begin
  HabilitaCtrlsFecha(dtpF_VENCIMIENTO_A_I, cbxF_VENCIMIENTO_A, dtpF_VENCIMIENTO_A_F,
                     chkF_VENCIMIENTO_A.Checked);
end;

procedure TWCrTransBlqMas.chkF_VENCIMIENTOClick(Sender: TObject);
begin
  HabilitaCtrlsFecha(dtpF_VENCIMIENTO_I, cbxF_VENCIMIENTO, dtpF_VENCIMIENTO_F,
                     chkF_VENCIMIENTO.Checked);
end;

procedure TWCrTransBlqMas.chkFH_ACTIVACIONClick(Sender: TObject);
begin
  HabilitaCtrlsFecha(dtpFH_ACTIVACION_I, cbxFH_ACTIVACION, dtpFH_ACTIVACION_F,
                     chkFH_ACTIVACION.Checked);
end;

procedure TWCrTransBlqMas.cbxF_DISPOSICIONChange(Sender: TObject);
begin
  MuestraCtrlsFecha(dtpF_DISPOSICION_I, cbxF_DISPOSICION);
end;

procedure TWCrTransBlqMas.cbxF_VENCIMIENTO_AChange(Sender: TObject);
begin
  MuestraCtrlsFecha(dtpF_VENCIMIENTO_A_I, cbxF_VENCIMIENTO_A);
end;

procedure TWCrTransBlqMas.cbxF_VENCIMIENTOChange(Sender: TObject);
begin
  MuestraCtrlsFecha(dtpF_VENCIMIENTO_I, cbxF_VENCIMIENTO);
end;

procedure TWCrTransBlqMas.cbxFH_ACTIVACIONChange(Sender: TObject);
begin
  MuestraCtrlsFecha(dtpFH_ACTIVACION_I, cbxFH_ACTIVACION);
end;

procedure TWCrTransBlqMas.SetDataToControls;
begin
  With Objeto Do
    Begin
    F_DISPOSICION_I.AsDateTime   := dtpF_DISPOSICION_I.DateTime;
    F_VENCIMIENTO_A_I.AsDateTime := dtpF_VENCIMIENTO_A_I.DateTime;
    F_VENCIMIENTO_I.AsDateTime   := dtpF_VENCIMIENTO_I.DateTime;
    FH_ACTIVACION_I.AsDateTime   := dtpFH_ACTIVACION_I.DateTime;

    F_DISPOSICION_F.AsDateTime   := dtpF_DISPOSICION_F.DateTime;
    F_VENCIMIENTO_A_F.AsDateTime := dtpF_VENCIMIENTO_A_F.DateTime;
    F_VENCIMIENTO_F.AsDateTime   := dtpF_VENCIMIENTO_F.DateTime;
    FH_ACTIVACION_F.AsDateTime   := dtpFH_ACTIVACION_F.DateTime;
    End;
end;


procedure TCrTrBlMa.GetDataFromControls;
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
  CVE_FH_ACTIVACION_I.GetFromControl;

  NOM_CREDITO.GetFromControl;
  NOM_CONTRATO.GetFromControl;
  NOM_ACREDITADO.GetFromControl;
  DESC_L_PROD_GPO.GetFromControl;
  DESC_L_PRODUCTO.GetFromControl;
  NOM_CONTRATO_DV.GetFromControl;
end;


function TCrTrBlMa.ArmaSQL: String;

   function FiltroFecha(peStrCampo : String; peInterCampoFechaI, peInterCampoFiltro, peInterCampoFechaF : TInterCampo) : String;
   begin
      Result := '';
      If (Trim(peInterCampoFiltro.AsString) <> '') Then
         Begin
         If (Trim(peInterCampoFiltro.AsString) = C_ENTRE) Then
            Result := ' AND '+peStrCampo+' BETWEEN '+SQLFecha(peInterCampoFechaI.AsDateTime)+' BETWEEN '+SQLFecha(peInterCampoFechaF.AsDateTime)+coCRLF
         Else
            Result := ' AND '+peStrCampo+' '+peInterCampoFiltro.AsString+' '+SQLFecha(peInterCampoFechaF.AsDateTime)+coCRLF;
         End;
   end;

var vlSQL, vlstrComa,
    vlstrFilterID_CREDITO,
    vlstrFilterID_CONTRATO,
    vlstrFilterID_ACREDITADO,
    vlstrFilterCVE_PRODUCTO_GPO,
    vlstrFilterCVE_PRODUCTO_CRE,
    vlstrFilterID_CONTRATO_DV,
    vlstrFilterF_DISPOSICION,
    vlstrFilterF_VENCIMIENTO_A,
    vlstrFilterF_VENCIMIENTO,
    vlstrFilterFH_ACTIVACION,
    vlstrFilterB_MUESTRA_BLOQ,
    vlstrFilterCVE_BLQ_CPTO : String;
    vlnItem : Integer;
begin
  GetDataFromControls;

  vlstrFilterID_CREDITO       := '';
  vlstrFilterID_CONTRATO      := '';
  vlstrFilterID_ACREDITADO    := '';
  vlstrFilterCVE_PRODUCTO_GPO := '';
  vlstrFilterCVE_PRODUCTO_CRE := '';
  vlstrFilterID_CONTRATO_DV   := '';
  vlstrFilterF_DISPOSICION    := FiltroFecha('F_INICIO', F_DISPOSICION_I, CVE_F_DISPOSICION_I, F_DISPOSICION_F);
  vlstrFilterF_VENCIMIENTO_A  := FiltroFecha('F_PROX_AMORT', F_VENCIMIENTO_A_I, CVE_F_VENCIMIENTO_A_I, F_VENCIMIENTO_A_F);
  vlstrFilterF_VENCIMIENTO    := FiltroFecha('F_VENCIMIENTO', F_VENCIMIENTO_I, CVE_F_VENCIMIENTO_I, F_VENCIMIENTO_F);
  vlstrFilterFH_ACTIVACION    := FiltroFecha('TRUNC(FH_ACTIVACION)', FH_ACTIVACION_I, CVE_FH_ACTIVACION_I, FH_ACTIVACION_F);

  // Incia la obtención de los filtros de Clave de Conceptos
  vlstrFilterCVE_BLQ_CPTO := ''; vlstrComa := '';
  For vlnItem := 0 To vgCheckListBox.Items.Count - 1 Do
    If (Not vgCheckListBox.Checked[vlnItem]) Then
       Begin
       vlstrFilterCVE_BLQ_CPTO := vlstrFilterCVE_BLQ_CPTO + vlstrComa + SQLStr(vgStrListCptos[vlnItem]);
       vlstrComa := ',';
       End;
  If (vlstrFilterCVE_BLQ_CPTO <> '') Then
    vlstrFilterCVE_BLQ_CPTO := ' AND CBT.CVE_BLQ_CPTO NOT IN (' + vlstrFilterCVE_BLQ_CPTO + ')'+coCRLF;

  If (ID_CREDITO.AsInteger <> 0) Then
    vlstrFilterID_CREDITO  := ' AND CC.ID_CREDITO = '+ID_CREDITO.AsString+coCRLF;

  If (ID_CONTRATO.AsInteger <> 0) Then
    vlstrFilterID_CONTRATO := ' AND CO.ID_CONTRATO = '+ID_CONTRATO.AsString+coCRLF;

  If (ID_ACREDITADO.AsInteger <> 0) Then
    vlstrFilterID_ACREDITADO := ' AND CTO.ID_TITULAR = '+ID_ACREDITADO.AsString+coCRLF;

  If (TRim(CVE_PRODUCTO_GPO.AsString) <> '') Then
    vlstrFilterCVE_PRODUCTO_GPO := ' AND TEMP.CVE_PRODUCTO_GPO = '+SQLStr(CVE_PRODUCTO_GPO.AsString)+coCRLF;

  If (Trim(CVE_PRODUCTO_CRE.AsString) <> '') Then
    vlstrFilterCVE_PRODUCTO_CRE := ' AND TEMP.CVE_PRODUCTO_CRE = '+SQLStr(CVE_PRODUCTO_CRE.AsString)+coCRLF;

  If (ID_CONTRATO_DV.AsInteger <> 0) Then
    vlstrFilterID_CONTRATO_DV := ' AND CBLS.ID_CONTRATO_DV = '+ID_CONTRATO_DV.AsString+coCRLF;

  If (B_MUESTRA_BLOQ.AsString = CVERDAD) Then
    vlstrFilterB_MUESTRA_BLOQ := ' AND CBO.TIPO_AFECTACION = ' + SQLStr('I') + ' -- Sólo muestra Bloqueos'+coCRLF
  Else
    vlstrFilterB_MUESTRA_BLOQ := ' AND CBO.TIPO_AFECTACION = ' + SQLStr('D') + ' -- Sólo muestra Desbloqueos'+coCRLF;

  vlSQL := 
            ' SELECT R.*'+coCRLF+
            ' FROM ( SELECT CTO.ID_TITULAR AS ID_ACREDITADO,'+coCRLF+
            '               P.NOMBRE AS NOM_ACREDITADO,'+coCRLF+
            '               PDV.NOMBRE AS NOM_TITULAR,'+coCRLF+
            '               TEMP.*,'+coCRLF+
            '               PKGCRGTIA.OBT_F_PROX_AMORT(0, TEMP.ID_CREDITO, TRUNC(SYSDATE)) AS F_PROX_AMORT'+coCRLF+
            '        FROM  ( -------------------------------------------------------'+coCRLF+
            '                -- Obtiene las diposiciones que están en ICRE'+coCRLF+
            '                SELECT ''ICRE'' AS CVE_ORIGEN,'+coCRLF+
            '                       CP.CVE_PRODUCTO_GPO,'+coCRLF+
            '                       CO.CVE_PRODUCTO_CRE,'+coCRLF+
            '                       CO.ID_CONTRATO,'+coCRLF+
            '                       CC.ID_CREDITO,'+coCRLF+
            '                       CC.F_INICIO,'+coCRLF+
            '                       CC.F_VENCIMIENTO,'+coCRLF+
            '                       CBT.ID_BLQ_TRANSAC,'+coCRLF+
            '                       CBT.CVE_BLQ_CPTO,'+coCRLF+
            '                       CBT.CVE_BLQ_OPERACION,'+coCRLF+
            '                       CBT.ID_CONTRATO_DV,'+coCRLF+
            '                       CBT.IMP_SALDO,'+coCRLF+
            '                       CBT.FH_ACTIVACION,'+coCRLF+
            '                       CBT.CVE_USU_ACTIVACION'+coCRLF+
            '                FROM ( SELECT CBT.*'+coCRLF+
            '                       FROM CR_BLQ_TRANSAC CBT,'+coCRLF+
            '                            CR_BLQ_OPERACION CBO'+coCRLF+
            '                       WHERE CBO.CVE_BLQ_OPERACION = CBT.CVE_BLQ_OPERACION'+coCRLF+
            '                         AND CBT.SIT_TRANS_BLOQ = ''AC'' -- Sólo muestra las transacciones activas'+coCRLF+
            '                         AND CBT.ID_TRANS_CANCELA IS NULL  -- y q no esten canceladas'+coCRLF+
            '                         '+vlstrFilterB_MUESTRA_BLOQ+
            coCRLF+
            '                     ) CBT,'+coCRLF+
            '                     CR_CREDITO CC,'+coCRLF+
            '                     CR_CONTRATO CO,'+coCRLF+
            '                     CR_PRODUCTO CP'+coCRLF+
            '                WHERE 1 = 1'+coCRLF+
            '                   '+vlstrFilterID_CREDITO+
            '                   '+vlstrFilterID_CONTRATO+
            '                   '+vlstrFilterID_CONTRATO_DV+
            '                   '+vlstrFilterCVE_BLQ_CPTO+
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
            '                       CC.F_VALOR_CRED AS F_INICIO,'+coCRLF+
            '                       (CC.F_VALOR_CRED + CC.DIAS_PLAZO) F_VENCIMIENTO,'+coCRLF+
            '                       CBT.ID_BLQ_TRANSAC,'+coCRLF+
            '                       CBT.CVE_BLQ_CPTO,'+coCRLF+
            '                       CBT.CVE_BLQ_OPERACION,'+coCRLF+
            '                       CBT.ID_CONTRATO_DV,'+coCRLF+
            '                       CBT.IMP_SALDO,'+coCRLF+
            '                       CBT.FH_ACTIVACION,'+coCRLF+
            '                       CBT.CVE_USU_ACTIVACION'+coCRLF+
            '                FROM ( SELECT CBT.*'+coCRLF+
            '                       FROM CR_BLQ_TRANSAC CBT,'+coCRLF+
            '                            CR_BLQ_OPERACION CBO'+coCRLF+
            '                       WHERE CBO.CVE_BLQ_OPERACION = CBT.CVE_BLQ_OPERACION'+coCRLF+
            '                         AND CBT.SIT_TRANS_BLOQ = ''AC'' -- Sólo muestra las transacciones activas'+coCRLF+
            '                         AND CBT.ID_TRANS_CANCELA IS NULL  -- y q no esten canceladas'+coCRLF+
            '                         '+vlstrFilterB_MUESTRA_BLOQ+
            coCRLF+
            '                     ) CBT,'+coCRLF+
            '                     CRE_CREDITO CC,'+coCRLF+
            '                     CRE_CONTRATO CO'+coCRLF+
            '                WHERE 1 = 1'+coCRLF+
            '                   '+vlstrFilterID_CREDITO+
            '                   '+vlstrFilterID_CONTRATO+
            '                   '+vlstrFilterID_CONTRATO_DV+
            '                   '+vlstrFilterCVE_BLQ_CPTO+            
            coCRLF+
            '                  AND CC.ID_CREDITO = CBT.ID_CREDITO'+coCRLF+
            '                  AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '               ) TEMP,'+coCRLF+
            '               CONTRATO CTO,'+coCRLF+
            '               PERSONA P,'+coCRLF+
            '               CONTRATO CTODV,'+coCRLF+
            '               PERSONA PDV'+coCRLF+
            '         WHERE CTO.ID_CONTRATO = TEMP.ID_CONTRATO'+coCRLF+
            '           '+vlstrFilterID_ACREDITADO+
            '           '+vlstrFilterCVE_PRODUCTO_GPO+
            '           '+vlstrFilterCVE_PRODUCTO_CRE+
            coCRLF+
            '           AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
            '           AND CTODV.ID_CONTRATO = TEMP.ID_CONTRATO_DV'+coCRLF+
            '           AND PDV.ID_PERSONA = CTODV.ID_TITULAR'+coCRLF+
            '       ) R'+coCRLF+
            'WHERE 1 = 1'+coCRLF+
            'ORDER BY R.NOM_TITULAR, R.ID_CONTRATO_DV'+coCRLF
          ;
  Result := vlSQL;
end;

function TCrTrBlMa.ArmaSQL_1: String;

   function FiltroFecha(peStrCampo : String; peInterCampoFechaI, peInterCampoFiltro, peInterCampoFechaF : TInterCampo) : String;
   begin
      Result := '';
      If (Trim(peInterCampoFiltro.AsString) <> '') Then
         Begin
         If (Trim(peInterCampoFiltro.AsString) = C_ENTRE) Then
            Result := ' AND '+peStrCampo+' BETWEEN '+SQLFecha(peInterCampoFechaI.AsDateTime)+' BETWEEN '+SQLFecha(peInterCampoFechaF.AsDateTime)+coCRLF
         Else
            Result := ' AND '+peStrCampo+' '+peInterCampoFiltro.AsString+' '+SQLFecha(peInterCampoFechaF.AsDateTime)+coCRLF;
         End;
   end;

var vlSQL, vlstrComa,
    vlstrFilterID_CREDITO,
    vlstrFilterID_CONTRATO,
    vlstrFilterID_ACREDITADO,
    vlstrFilterCVE_PRODUCTO_GPO,
    vlstrFilterCVE_PRODUCTO_CRE,
    vlstrFilterID_CONTRATO_DV,
    vlstrFilterF_DISPOSICION,
    vlstrFilterF_VENCIMIENTO_A,
    vlstrFilterF_VENCIMIENTO,
    vlstrFilterFH_ACTIVACION,
    vlstrFilterB_MUESTRA_BLOQ,
    vlstrFilterCVE_BLQ_CPTO : String;
    vlnItem : Integer;
begin
  GetDataFromControls;

  vlstrFilterID_CREDITO       := '';
  vlstrFilterID_CONTRATO      := '';
  vlstrFilterID_ACREDITADO    := '';
  vlstrFilterCVE_PRODUCTO_GPO := '';
  vlstrFilterCVE_PRODUCTO_CRE := '';
  vlstrFilterID_CONTRATO_DV   := '';
  vlstrFilterF_DISPOSICION    := FiltroFecha('F_INICIO', F_DISPOSICION_I, CVE_F_DISPOSICION_I, F_DISPOSICION_F);
  vlstrFilterF_VENCIMIENTO_A  := FiltroFecha('F_PROX_AMORT', F_VENCIMIENTO_A_I, CVE_F_VENCIMIENTO_A_I, F_VENCIMIENTO_A_F);
  vlstrFilterF_VENCIMIENTO    := FiltroFecha('F_VENCIMIENTO', F_VENCIMIENTO_I, CVE_F_VENCIMIENTO_I, F_VENCIMIENTO_F);
  vlstrFilterFH_ACTIVACION    := FiltroFecha('FH_ACTIVACION', FH_ACTIVACION_I, CVE_FH_ACTIVACION_I, FH_ACTIVACION_F);

  // Incia la obtención de los filtros de Clave de Conceptos
  vlstrFilterCVE_BLQ_CPTO := ''; vlstrComa := '';
  For vlnItem := 0 To vgCheckListBox.Items.Count - 1 Do
    If (Not vgCheckListBox.Checked[vlnItem]) Then
       Begin
       vlstrFilterCVE_BLQ_CPTO := vlstrFilterCVE_BLQ_CPTO + vlstrComa + SQLStr(vgStrListCptos[vlnItem]);
       vlstrComa := ',';
       End;
  If (vlstrFilterCVE_BLQ_CPTO <> '') Then
    vlstrFilterCVE_BLQ_CPTO := ' AND CBLS.CVE_BLQ_CPTO NOT IN (' + vlstrFilterCVE_BLQ_CPTO + ')'+coCRLF;

  If (ID_CREDITO.AsInteger <> 0) Then
    vlstrFilterID_CREDITO  := ' AND CC.ID_CREDITO = '+ID_CREDITO.AsString+coCRLF;

  If (ID_CONTRATO.AsInteger <> 0) Then
    vlstrFilterID_CONTRATO := ' AND CO.ID_CONTRATO = '+ID_CONTRATO.AsString+coCRLF;

  If (ID_ACREDITADO.AsInteger <> 0) Then
    vlstrFilterID_ACREDITADO := ' AND CTO.ID_TITULAR = '+ID_ACREDITADO.AsString+coCRLF;

  If (TRim(CVE_PRODUCTO_GPO.AsString) <> '') Then
    vlstrFilterCVE_PRODUCTO_GPO := ' AND TEMP.CVE_PRODUCTO_GPO = '+SQLStr(CVE_PRODUCTO_GPO.AsString)+coCRLF;

  If (Trim(CVE_PRODUCTO_CRE.AsString) <> '') Then
    vlstrFilterCVE_PRODUCTO_CRE := ' AND TEMP.CVE_PRODUCTO_CRE = '+SQLStr(CVE_PRODUCTO_CRE.AsString)+coCRLF;

  If (ID_CONTRATO_DV.AsInteger <> 0) Then
    vlstrFilterID_CONTRATO_DV := ' AND CBLS.ID_CONTRATO_DV = '+ID_CONTRATO_DV.AsString+coCRLF;

  If (B_MUESTRA_BLOQ.AsString = CVERDAD) Then
    vlstrFilterB_MUESTRA_BLOQ := ' AND CBO.TIPO_AFECTACION = ' + SQLStr('I') + ' -- Sólo muestra Bloqueos'+coCRLF
  Else
    vlstrFilterB_MUESTRA_BLOQ := ' AND CBO.TIPO_AFECTACION = ' + SQLStr('D') + ' -- Sólo muestra Desbloqueos'+coCRLF;

  vlSQL :=  ' SELECT R.*'+coCRLF+
            ' FROM ( SELECT CTO.ID_TITULAR AS ID_ACREDITADO,'+coCRLF+
            '               P.NOMBRE AS NOM_ACREDITADO,'+coCRLF+
            '               PDV.NOMBRE AS NOM_TITULAR,'+coCRLF+
            '               TEMP.*,'+coCRLF+
            '               PKGCRGTIA.OBT_F_PROX_AMORT(0, TEMP.ID_CREDITO, TRUNC(SYSDATE)) AS F_PROX_AMORT'+coCRLF+
            '        FROM  ( -------------------------------------------------------'+coCRLF+
            '                -- Obtiene las diposiciones que están en ICRE'+coCRLF+
            '                SELECT'+coCRLF+
            '                     ''ICRE'' AS CVE_ORIGEN,'+coCRLF+
            '                      CP.CVE_PRODUCTO_GPO,'+coCRLF+
            '                      CO.CVE_PRODUCTO_CRE,'+coCRLF+
            '                      CO.ID_CONTRATO,'+coCRLF+
            '                      CC.ID_CREDITO,'+coCRLF+
            '                      CC.F_INICIO,'+coCRLF+
            '                      CC.F_VENCIMIENTO,'+coCRLF+
            '                      0 AS ID_BLQ_TRANSAC,'+coCRLF+
            '                      CBLS.CVE_BLQ_CPTO,'+coCRLF+
            '                      '' '' AS CVE_BLQ_OPERACION,'+coCRLF+
            '                      CBLS.ID_CONTRATO_DV,'+coCRLF+
            '                      CBLS.IMP_SDO_BLOQUEO AS IMP_SALDO,'+coCRLF+
            '                      0 AS FH_ACTIVACION,'+coCRLF+
            '                      '' '' AS CVE_USU_ACTIVACION'+coCRLF+
            '                FROM CR_BLQ_SDO_CHEQ CBLS,'+coCRLF+
            '                     CR_CREDITO CC,'+coCRLF+
            '                     CR_CONTRATO CO,'+coCRLF+
            '                     CR_PRODUCTO CP'+coCRLF+
            '                WHERE 1 = 1'+coCRLF+
            '                 '+vlstrFilterID_CREDITO+
            '                 '+vlstrFilterID_CONTRATO+
            '                 '+vlstrFilterID_CONTRATO_DV+
            '                 '+vlstrFilterCVE_BLQ_CPTO+
            '                  AND CBLS.IMP_SDO_BLOQUEO <> 0'+coCRLF+
            '                  AND CC.ID_CREDITO = CBLS.ID_CREDITO'+coCRLF+
            '                  AND CC.SIT_CREDITO <> ''CA'''+coCRLF+
            '                  AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '                  AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE'+coCRLF+
            '             UNION ALL'+coCRLF+
            '                -------------------------------------------------------'+coCRLF+
            '                -- Obtiene las diposiciones que están en INTERCRÉDITOS'+coCRLF+
            '                SELECT'+coCRLF+
            '                     ''CRED'' AS CVE_ORIGEN,'+coCRLF+
            '                      TO_CHAR(CO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_GPO,'+coCRLF+
            '                      TO_CHAR(CO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE,'+coCRLF+
            '                      CO.ID_CONTRATO,'+coCRLF+
            '                      CC.ID_CREDITO,'+coCRLF+
            '                      CC.F_VALOR_CRED AS F_INICIO,'+coCRLF+
            '                      (CC.F_VALOR_CRED + CC.DIAS_PLAZO) AS F_VENCIMIENTO,'+coCRLF+
            '                      0 AS ID_BLQ_TRANSAC,'+coCRLF+
            '                      CBLS.CVE_BLQ_CPTO,'+coCRLF+
            '                      '' '' AS CVE_BLQ_OPERACION,'+coCRLF+
            '                      CBLS.ID_CONTRATO_DV,'+coCRLF+
            '                      CBLS.IMP_SDO_BLOQUEO AS IMP_SALDO,'+coCRLF+
            '                      0 AS FH_ACTIVACION,'+coCRLF+
            '                      '' '' AS CVE_USU_ACTIVACION'+coCRLF+
            '                FROM CR_BLQ_SDO_CHEQ CBLS,'+coCRLF+
            '                     CRE_CREDITO CC,'+coCRLF+
            '                     CRE_CONTRATO CO'+coCRLF+
            '                WHERE 1 = 1'+coCRLF+
            '                 '+vlstrFilterID_CREDITO+
            '                 '+vlstrFilterID_CONTRATO+
            '                 '+vlstrFilterID_CONTRATO_DV+
            '                 '+vlstrFilterCVE_BLQ_CPTO+            
            '                  AND CBLS.IMP_SDO_BLOQUEO <> 0'+coCRLF+
            '                  AND CC.ID_CREDITO = CBLS.ID_CREDITO'+coCRLF+
            '                  AND CC.SIT_CREDITO NOT IN (''CA'',''TA'')'+coCRLF+
            '                  AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '               ) TEMP,'+coCRLF+
            '               CONTRATO CTO,'+coCRLF+
            '               PERSONA P,'+coCRLF+
            '               CONTRATO CTODV,'+coCRLF+
            '               PERSONA PDV'+coCRLF+
            '         WHERE CTO.ID_CONTRATO = TEMP.ID_CONTRATO'+coCRLF+
            '          '+vlstrFilterID_ACREDITADO+
            '          '+vlstrFilterCVE_PRODUCTO_GPO+
            '          '+vlstrFilterCVE_PRODUCTO_CRE+
            '           AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
            '           AND CTODV.ID_CONTRATO = TEMP.ID_CONTRATO_DV'+coCRLF+
            '           AND PDV.ID_PERSONA = CTODV.ID_TITULAR'+coCRLF+
            '       ) R'+coCRLF+
            'WHERE 1 = 1'+coCRLF+
            'ORDER BY R.NOM_TITULAR, R.ID_CONTRATO_DV'+coCRLF;
          ;
  Result := vlSQL;
end;



procedure TWCrTransBlqMas.DespliegaDatos;
var vlQry : TQuery;
begin
  ClearGrid(StrGrd1, 0);
  ClearGrid(StrGrd2, 0);
  ClearGrid(StrGrd3, 0);

  With Objeto Do
    Begin
       // vlQry := GetSQLQueryNoNil(ArmaSQL, Apli.DataBaseName, Apli.SessionName, True);
       vlQry := GetSQLQueryNoNil(ArmaSQL_1, Apli.DataBaseName, Apli.SessionName, True);

    If Not Assigned(vlQry) Then
       MessageDlg('No se encontraron datos para la consulta solicitada', mtWarning, [mbOk], 0)
    Else
       ColocaDatos(vlQry);
    End;
end;

procedure TWCrTransBlqMas.btnBuscaClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRTRBLMA_BUSQ',True,True) then
   begin
      DespliegaDatos;
   end;
end;

procedure TWCrTransBlqMas.ColocaDatos(peQry: TQuery);

  procedure ColocaCorteporChequera(penRow, peID_CONTRATO_DV : Integer; var peSUM_SALDO : Double);
  begin
    StrGrd1.Cells[C_COL_B_CORTE,     penRow] := CVERDAD;
    StrGrd1.Cells[C_COL_BDESBLOQUEO, penRow] := ' ';
    StrGrd3.Cells[C_COL_NOM_TITULAR, penRow] := 'Total de Chequera '+IntToSTr(peID_CONTRATO_DV);
    StrGrd3.Cells[C_COL_IMP_SALDO,   penRow] := Format(CFORMAT_DINERO,[peSUM_SALDO]);
    peSUM_SALDO := 0;
  end;

  procedure ColocaRenglonDatos(penRow : Integer);
  begin
    StrGrd1.Cells[C_COL_B_CORTE,        penRow] := CFALSO;
    StrGrd1.Cells[C_COL_ID_BLQ_TRANSAC, penRow] := peQry.FieldByName('ID_BLQ_TRANSAC').AsString;

    // Si esta seleccionado la pestaña de Mostrar Bloqueados muestra el CheckBox, colocando la bandera CFALSO
    StrGrd1.Cells[C_COL_BDESBLOQUEO,    penRow] := CFALSO;
    {
    // Si esta seleccionado la pestaña de Mostrar Bloqueados muestra el CheckBox, colocando la bandera CFALSO    
    If (TabSet.TabIndex = 0) Then StrGrd1.Cells[C_COL_BDESBLOQUEO,    penRow] := CFALSO
    Else StrGrd1.Cells[C_COL_BDESBLOQUEO,    penRow] := ' ';
    }

    StrGrd1.Cells[C_COL_ORIGEN,            penRow] := peQry.FieldByName('CVE_ORIGEN').AsString;
    StrGrd1.Cells[C_COL_ID_CONTRATO,       penRow] := peQry.FieldByName('ID_CONTRATO').AsString;
    StrGrd1.Cells[C_COL_NOM_ACREDITADO,    penRow] := peQry.FieldByName('NOM_ACREDITADO').AsString;
    StrGrd1.Cells[C_COL_ID_CREDITO,        penRow] := peQry.FieldByName('ID_CREDITO').AsString;

    StrGrd2.Cells[C_COL_F_INICIO,           penRow] := DateToStr(peQry.FieldByName('F_INICIO').AsDateTime);
    StrGrd2.Cells[C_COL_F_VENCIMIENTO,      penRow] := DateToStr(peQry.FieldByName('F_VENCIMIENTO').AsDateTime);
    StrGrd2.Cells[C_COL_F_VENCIMIENTO_A,    penRow] := DateToStr(peQry.FieldByName('F_PROX_AMORT').AsDateTime);
    StrGrd2.Cells[C_COL_CVE_PRODUCTO_GPO,   penRow] := peQry.FieldByName('CVE_PRODUCTO_GPO').AsString;
    StrGrd2.Cells[C_COL_CVE_PRODUCTO_CRE,   penRow] := peQry.FieldByName('CVE_PRODUCTO_CRE').AsString;
    StrGrd2.Cells[C_COL_CVE_BLQ_CPTO,       penRow] := peQry.FieldByName('CVE_BLQ_CPTO').AsString;
    StrGrd2.Cells[C_COL_TX_REFERENCIA,      penRow] := peQry.FieldByName('ID_BLQ_TRANSAC').AsString;
    StrGrd2.Cells[C_COL_CVE_USU_ACTIVACION, penRow] := peQry.FieldByName('CVE_USU_ACTIVACION').AsString;
    StrGrd2.Cells[C_COL_FH_ACTIVACION,      penRow] := peQry.FieldByName('FH_ACTIVACION').AsString;

    StrGrd3.Cells[C_COL_ID_CONTRATO_DV,  penRow] := peQry.FieldByName('ID_CONTRATO_DV').AsString;
    StrGrd3.Cells[C_COL_NOM_TITULAR,     penRow] := peQry.FieldByName('NOM_TITULAR').AsString;
    StrGrd3.Cells[C_COL_IMP_SALDO,       penRow] := Format(CFORMAT_DINERO,[peQry.FieldByName('IMP_SALDO').AsFloat]);
  end;

var vlnRow, vlID_CONTRATO_DV : Integer;
    vlSUM_SALDO : Double;
begin
  SetDataToControls;

  With (peQry) Do
    Try
      vlnRow := 0; vlID_CONTRATO_DV := 0; vlSUM_SALDO := 0;
      // Si tiene Datos el Query, entonces...
      If Not Eof Then
        Begin
          Repeat
            If (vlID_CONTRATO_DV = 0) Then
               vlID_CONTRATO_DV := FieldByName('ID_CONTRATO_DV').AsInteger

            Else If ((vlID_CONTRATO_DV <> FieldByName('ID_CONTRATO_DV').AsInteger)) Then
               Begin
               ColocaCorteporChequera(vlnRow, vlID_CONTRATO_DV, vlSUM_SALDO);
               vlID_CONTRATO_DV := FieldByName('ID_CONTRATO_DV').AsInteger;
               Inc(vlnRow);
               End;

            vlSUM_SALDO := vlSUM_SALDO + peQry.FieldByName('IMP_SALDO').AsFloat;
            ColocaRenglonDatos(vlnRow);
            Inc(vlnRow);
            peQry.Next;
          Until Eof;

          If (vlID_CONTRATO_DV <> 0) Then
           Begin
           ColocaCorteporChequera(vlnRow, vlID_CONTRATO_DV, vlSUM_SALDO);
           Inc(vlnRow);
           End;
        End; // If Not Eof Then 

      If (vlnRow <= 0) Then vlnRow := 1;

      StrGrd1.RowCount := vlnRow;
      StrGrd2.RowCount := vlnRow;
      StrGrd3.RowCount := vlnRow;
    Finally
      peQry.Free;
    End;
end;

procedure TWCrTransBlqMas.StrGrd1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);

  procedure AsignaSeleccion( Sender, Grid : TStringGrid );
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
     vgGrid := (Sender As TStringGrid);

    If (vgGrid = Sender) Then
     Begin
     AsignaSeleccion( Sender As TStringGrid, StrGrd1 );
     AsignaSeleccion( Sender As TStringGrid, StrGrd2 );
     AsignaSeleccion( Sender As TStringGrid, StrGrd3 );
     vgGrid := Nil;
     End;
  End;

end;

procedure TWCrTransBlqMas.StrGrd1TopLeftChanged(Sender: TObject);

  procedure AsignaTopRow( Sender, Grid : TStringGrid );
  begin
    if Sender <> Grid then
      Grid.TopRow := Sender.TopRow
  end;

begin
 If Sender Is TStringGrid Then
   Try
    AsignaTopRow( Sender As TStringGrid, StrGrd1 );
    AsignaTopRow( Sender As TStringGrid, StrGrd2 );
    AsignaTopRow( Sender As TStringGrid, StrGrd3 );
   Finally
   End;
end;

procedure TWCrTransBlqMas.StrGrd1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);

const LIGHT_YELLOW = $00CCFFFF;

 // Esta función se hizo con el fin de reemplazar a la conocida función RECT()
 // debido a que el compilador confunde el llamado entre la variable y la función
 // en este procedimiento...
 function Rect_(nLeft, nTop, nRight, nBottom : Integer) : TRect;
 var R : TRect;
 begin
  R.Left := nLeft;
  R.Top := nTop;
  R.Right := nRight;
  R.Bottom := nBottom;
  Result := R;
 end;

var vlStrBCorte : String;
    vlBmp : TBitmap;
//    Rect1 : TRect;
    vlnLeftCol : Integer;
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin
     vlStrBCorte := StrGrd1.Cells[C_COL_B_CORTE, ARow];

     If (vlStrBCorte = CVERDAD) And (Not (gdSelected In State)) Then
        Canvas.Brush.Color := LIGHT_YELLOW;

     If ( (Sender = StrGrd1) And (ACol = C_COL_ID_CREDITO)
          Or (Sender = StrGrd3) And (ACol = C_COL_IMP_SALDO) ) Then
        Canvas.TextRect(Rect,Rect.Right - Canvas.TextWidth(Cells[ACol, ARow]) - 3,Rect.Top,Cells[ACol, ARow])
     Else
        Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);

     If (Sender = StrGrd2) Then
       Begin
       vlnLeftCol := StrGrd2.LeftCol;
       lbl1.Caption := CO_A_LBL[vlnLeftCol];
       lbl2.Caption := CO_A_LBL[vlnLeftCol+1];
       End;

     // Coloca el CheckBox
     If (Sender = StrGrd1) Then
       If ((ACol = C_COL_BDESBLOQUEO) And (vlStrBCorte = CFALSO)) Then
         Begin
         vlBmp := TBitmap.Create;
         If (StrGrd1.Cells[C_COL_BDESBLOQUEO,ARow] = CVERDAD) Then ImageList.GetBitmap(1,vlBmp)
         Else ImageList.GetBitmap(0,vlBmp);
         StrGrd1.Canvas.Draw(Rect.Left-20,Rect.Top,vlBmp);
         vlBmp.FreeImage;
         vlBmp.Free;
         End;      
  End;
end;

procedure TWCrTransBlqMas.TabSetChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  With Objeto Do
    Begin
    If (NewTab = 0) Then B_MUESTRA_BLOQ.AsString := CVERDAD
    Else B_MUESTRA_BLOQ.AsString := CFALSO;
    btnBuscaClick(Self);
    btnDesbloquear.Enabled := (NewTab = 0);
    End;
end;

procedure TWCrTransBlqMas.StrGrd1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var vlnCol, vlnRow : Integer;
begin
  StrGrd1.MouseToCell(X, Y, vlnCol, vlnRow);
  If (vlnCol = C_COL_BDESBLOQUEO) Then
    Begin
    If (StrGrd1.Cells[C_COL_B_CORTE, StrGrd1.Row] = CFALSO) Then
       Begin
       If (StrGrd1.Cells[C_COL_BDESBLOQUEO, StrGrd1.Row] = CFALSO) Then
          StrGrd1.Cells[C_COL_BDESBLOQUEO, StrGrd1.Row] := CVERDAD
       Else
          StrGrd1.Cells[C_COL_BDESBLOQUEO, StrGrd1.Row] := CFALSO;
       StrGrd1.Repaint;
       End;
    End;
end;

procedure TWCrTransBlqMas.ObtenValoresdelRegistro(penRow : Integer; var DataRegistro : PDataRegistro);
begin
  DataRegistro^.ID_CREDITO          := StrToInt(StrGrd1.Cells[C_COL_ID_CREDITO,penRow]);
  DataRegistro^.ID_CONTRATO_DV      := StrToInt(StrGrd3.Cells[C_COL_ID_CONTRATO_DV,penRow]);
  DataRegistro^.CVE_BLQ_CPTO        := StrGrd2.Cells[C_COL_CVE_BLQ_CPTO, penRow];

  If (DataRegistro^.CVE_BLQ_CPTO = 'BLPRLV') Then
    DataRegistro^.CVE_BLQ_OPERACION   := 'RGTIAV' // RETIRO
  Else
    If (DataRegistro^.CVE_BLQ_CPTO = 'BLCOMI') Then  // RABA FEB 2012
      DataRegistro^.CVE_BLQ_OPERACION   := 'DCOPPP' // RETIRO
    Else
      DataRegistro^.CVE_BLQ_OPERACION   := 'RGTIAC';

  DataRegistro^.IMP_SALDO           := StrToFloat(TrimChar(StrGrd3.Cells[C_COL_IMP_SALDO,penRow],'$,'#32));
end;

procedure TWCrTransBlqMas.btnDesbloquearClick(Sender: TObject);
var vlRow, vlCountDesbloqueos : Integer;
    vlbResult : Boolean;
    vlStrMsg : String;
    vlDataRegistro : PDataRegistro;
begin
   if Objeto.ValidaAccesoEsp('TCRTRBLMA_DESBL',True,True) then
   begin
      vlCountDesbloqueos := 0; vlbResult := False;
      For vlRow := 0 To StrGrd1.RowCount - 1 Do
        If (StrGrd1.Cells[C_COL_BDESBLOQUEO, vlRow] = CVERDAD)Then
           Inc(vlCountDesbloqueos);

      If (vlCountDesbloqueos = 0) Then
         Begin
         MessageDlg('Debe de selecionar por lo menos una opción para proceder a realizar el desbloqueo.',
                      mtInformation, [mbOk], 0);
         End
      Else
         Begin
         If (MessageDlg('Se procederá a realizar el desbloqueo. ¿Desea continuar?',
                         mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
            Begin

            For vlRow := 0 To StrGrd1.RowCount - 1 Do
              If (StrGrd1.Cells[C_COL_BDESBLOQUEO, vlRow] = CVERDAD)Then
                Begin
                New(vlDataRegistro);
                ObtenValoresdelRegistro(vlRow, vlDataRegistro);
                vlbResult := Objeto.StpRealizaDesbloq_X_Row(vlDataRegistro, vlStrMsg);
                Dispose(vlDataRegistro);
                If Not (vlbResult) Then
                  Begin
                  // vlbResult := Objeto.StpRealizaDesbloq_X_Trans(StrToInt(StrGrd1.Cells[C_COL_ID_BLQ_TRANSAC,vlRow]));
                  MessageDlg(vlStrMsg,mtError,[mbOk],0);
                  If (MessageDlg('¿Desea continuar con el proceso de desbloqueo?',mtConfirmation,[mbNo, mbYes], 0) = mrNo) Then
                     Break;
                  End;
                End;

            If vlbResult Then
              Begin
              MessageDlg('Desbloqueo Realizado', mtInformation, [mbYes], 0);
              btnBuscaClick(Self);
              End;
            End;
         End;
   end;    
end;

function TCrTrBlMa.StpRealizaDesbloq_X_Trans(peID_BLQ_TRANSAC: Integer) : Boolean;
var vlStp : TStoredProc;
begin
  Result := False;
  vlStp := TStoredProc.Create(Nil);
  GetDataFromControls;
  With vlStp Do
     Try
       //Inicia el SPT
       vlStp.DatabaseName := Apli.DatabaseName;
       vlStp.SessionName  := Apli.SessionName;
       StoredProcName:= 'PKGCRGTIA.STP_CANC_TRAN_BLQ_SDO_CHEQ';

       Params.Clear;
       Params.CreateParam( ftInteger ,'peID_BLQ_TRANSAC',    ptInput);
       Params.CreateParam( ftString  ,'peCVE_USU_CANCELA',  ptInput);
       Params.CreateParam( ftString  ,'peB_COMMIT',          ptInput);
       Params.CreateParam( ftInteger ,'psRESULTADO',         ptOutput);
       Params.CreateParam( ftString  ,'psTX_RESULTADO',      ptOutput);

       // Asigna los valores
       ParamByName('peID_BLQ_TRANSAC').AsInteger   := peID_BLQ_TRANSAC;
       ParamByName('peCVE_USU_CANCELA').AsString   := DameUsuario;
       ParamByName('peB_COMMIT').AsString          := 'V';

       ExecProc;
       If (ParamByName('psRESULTADO').AsInteger = 0) Then
         Begin
         Result := True;
         End
       Else
         Begin
         MessageDlg(ParamByName('psTX_RESULTADO').AsString, mtError, [mbOk], 0);
         End;
     Finally
       Free;
     End;
end;

function TCrTrBlMa.InsTransBloqueo(peDataRegistro : PDataRegistro; var peID_BLQ_TRANSAC: Integer; var vlStrMsg : String ) : Boolean;
var vlStp : TStoredProc;
begin
  Result := False; vlStrMsg := '';
  vlStp := TStoredProc.Create(Nil);
  GetDataFromControls;
  With vlStp Do
     Try
       //Inicia el SPT
       vlStp.DatabaseName := Apli.DatabaseName;
       vlStp.SessionName  := Apli.SessionName;
       StoredProcName:= 'PKGCRGTIA.STP_INS_TRANS_BLOQUEO';

       Params.Clear;
       Params.CreateParam( ftInteger ,'peID_CREDITO',        ptInput);
       Params.CreateParam( ftInteger ,'peID_CONTRATO_DV',    ptInput);
       Params.CreateParam( ftString  ,'peCVE_BLQ_CPTO',      ptInput);
       Params.CreateParam( ftString  ,'peCVE_BLQ_OPERACION', ptInput);
       Params.CreateParam( ftFloat   ,'peIMP_SALDO',         ptInput);
       Params.CreateParam( ftFloat   ,'pePCT_BLOQUEADO',     ptInput);
       Params.CreateParam( ftString  ,'peCVE_USU_ALTA',      ptInput);
       Params.CreateParam( ftString  ,'peTX_MOTIVO',         ptInput);
       Params.CreateParam( ftString  ,'peB_COMMIT',          ptInput);
       Params.CreateParam( ftInteger ,'psID_BLQ_TRANSAC',    ptOutput);
       Params.CreateParam( ftInteger ,'psRESULTADO',         ptOutput);
       Params.CreateParam( ftString  ,'psTX_RESULTADO',      ptOutput);

       // Asigna los valores
       ParamByName('peID_CREDITO').AsInteger       := peDataRegistro^.ID_CREDITO;
       ParamByName('peID_CONTRATO_DV').AsInteger   := peDataRegistro^.ID_CONTRATO_DV;
       ParamByName('peCVE_BLQ_CPTO').AsString      := peDataRegistro^.CVE_BLQ_CPTO;
       ParamByName('peCVE_BLQ_OPERACION').AsString := peDataRegistro^.CVE_BLQ_OPERACION;
       ParamByName('peIMP_SALDO').AsFloat          := peDataRegistro^.IMP_SALDO;
       ParamByName('pePCT_BLOQUEADO').AsFloat      := 0;
       ParamByName('peCVE_USU_ALTA').AsString      := DameUsuario;
       ParamByName('peTX_MOTIVO').AsString         := 'Desbloqueo de Saldo MASIVO.';
       ParamByName('peB_COMMIT').AsString          := 'V';

       ExecProc;
       If (ParamByName('psRESULTADO').AsInteger = 0) Then
         Begin
         peID_BLQ_TRANSAC := ParamByName('psID_BLQ_TRANSAC').AsInteger;
         Result := True;
         End
       Else
         Begin
         vlStrMsg := ParamByName('psTX_RESULTADO').AsString;
         End;
         
     Finally
       Free;
     End;
end;

function TCrTrBlMa.ActivaTransBloqueo(peID_BLQ_TRANSAC : Integer; var vlStrMsg : String) : Boolean;
var vlStp : TStoredProc;
begin
  Result := False; vlStrMsg := '';
  vlStp := TStoredProc.Create(Nil);
  GetDataFromControls;
  With vlStp Do
     Try
       //Inicia el SPT
       vlStp.DatabaseName := Apli.DatabaseName;
       vlStp.SessionName  := Apli.SessionName;
       StoredProcName:= 'PKGCRGTIA.STP_ACTIVA_TRANS_BLOQUEO';

       Params.Clear;
       Params.CreateParam( ftInteger ,'peID_BLQ_TRANSAC',     ptInput);
       Params.CreateParam( ftString  ,'peCVE_USU_ACTIVACION', ptInput);
       Params.CreateParam( ftString  ,'peB_COMMIT',           ptInput);
       Params.CreateParam( ftInteger ,'psRESULTADO',          ptOutput);
       Params.CreateParam( ftString  ,'psTX_RESULTADO',       ptOutput);

       // Asigna los valores
       ParamByName('peID_BLQ_TRANSAC').AsInteger     := peID_BLQ_TRANSAC;
       ParamByName('peCVE_USU_ACTIVACION').AsString  := DameUsuario;
       ParamByName('peB_COMMIT').AsString          := 'V';

       ExecProc;
       If (ParamByName('psRESULTADO').AsInteger = 0) Then
         Begin
         Result := True;
         End
       Else
         Begin
         vlStrMsg := ParamByName('psTX_RESULTADO').AsString;
         End;
     Finally
       Free;
     End;
end;

function TCrTrBlMa.StpRealizaDesbloq_X_Row(peDataRegistro : PDataRegistro; var vlStrMsg : String ) : Boolean;
var vlID_BLQ_TRANSAC : Integer;
begin
  Result := False;
  If (InsTransBloqueo(peDataRegistro, vlID_BLQ_TRANSAC, vlStrMsg)) Then
    Result := ActivaTransBloqueo(vlID_BLQ_TRANSAC, vlStrMsg);
end;

procedure TWCrTransBlqMas.chkCVE_BLQ_CPTOClick(Sender: TObject);
var vlIndex : Integer;
begin
  For vlIndex := 0 To chklstCVE_BLQ_CPTO.Items.Count - 1 Do
    chklstCVE_BLQ_CPTO.Checked[vlIndex] := chkCVE_BLQ_CPTO.Checked;
end;

procedure TWCrTransBlqMas.LLenaCptosBloqueo;
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

procedure TWCrTransBlqMas.StrGrd3KeyPress(Sender: TObject; var Key: Char);
begin
  If (StrGrd3.Col <> C_COL_IMP_SALDO) Then Key := #0;
end;

procedure TWCrTransBlqMas.CopiaTodoConCabecera1Click(Sender: TObject);
begin
 // CopiaRegistrosaClipBoard(pebConCabecera, pebConTotales: Boolean; penPrimerRenglon, penUltimoRenglon: Integer);
 CopiaRegistrosaClipBoard(True, True, 1, StrGrd1.RowCount);
end;

procedure TWCrTransBlqMas.CopiaTodoSinCabecera1Click(Sender: TObject);
begin
 // CopiaRegistrosaClipBoard(pebConCabecera, pebConTotales: Boolean; penPrimerRenglon, penUltimoRenglon: Integer);
 CopiaRegistrosaClipBoard(False, True, 1, StrGrd1.RowCount);
end;

procedure TWCrTransBlqMas.CopiaTodoConCabeceraySinTotales1Click(
  Sender: TObject);
begin
 // CopiaRegistrosaClipBoard(pebConCabecera, pebConTotales: Boolean; penPrimerRenglon, penUltimoRenglon: Integer);
 CopiaRegistrosaClipBoard(True, False, 1, StrGrd1.RowCount);
end;

procedure TWCrTransBlqMas.CopiaTodoSinCabeceraySinTotales1Click(
  Sender: TObject);
begin
 // CopiaRegistrosaClipBoard(pebConCabecera, pebConTotales: Boolean; penPrimerRenglon, penUltimoRenglon: Integer);
 CopiaRegistrosaClipBoard(False, False, 1, StrGrd1.RowCount);
end;

procedure TWCrTransBlqMas.CopiaRegistroConCabecera1Click(Sender: TObject);
begin
 // CopiaRegistrosaClipBoard(pebConCabecera, pebConTotales: Boolean; penPrimerRenglon, penUltimoRenglon: Integer);
 CopiaRegistrosaClipBoard(True, True, StrGrd1.Row, StrGrd1.Row);
end;

procedure TWCrTransBlqMas.CopiaRegistroSinCabecera1Click(Sender: TObject);
begin
 // CopiaRegistrosaClipBoard(pebConCabecera, pebConTotales: Boolean; penPrimerRenglon, penUltimoRenglon: Integer);
 CopiaRegistrosaClipBoard(False, True, StrGrd1.Row, StrGrd1.Row);
end;

procedure TWCrTransBlqMas.CopiaRegistrosaClipBoard(pebConCabecera, pebConTotales: Boolean; penPrimerRenglon, penUltimoRenglon: Integer);
var vlRow : Integer;
    str : String;
begin
 str := '';

 // Copia la Cabecera, si se desea copiar
 If (pebConCabecera) Then
   Begin
   str := lblCVE_ORIGEN1.Caption + #9 +
          lbID_CONTRATO1.Caption + #9 +
          lbNOM_ACREDITADO1.Caption + #9 +
          lbID_CREDITO1.Caption;

   For vlRow := 0 To High(CO_A_LBL) Do
      str := str + #9 + CO_A_LBL[vlRow];

   str := str + 
          lbID_CONTRATO_DV1.Caption + #9 +
          lbNOM_TITULAR1.Caption + #9 +
          lbIMP_SALDO1.Caption + #13#10;
   End;


   For vlRow := penPrimerRenglon To penUltimoRenglon - 1 Do
       Begin
         // Si es cun corte por Totales, y no se desea copiar el registro de Totales, entonces salta al siguiente registro
         If ((StrGrd1.Cells[C_COL_B_CORTE, vlRow] = CVERDAD) And (Not pebConTotales)) Then
           Continue;

       str := str +           
         StrGrd1.Cells[C_COL_ORIGEN,            vlRow] + #9 +
         StrGrd1.Cells[C_COL_ID_CONTRATO,       vlRow] + #9 +
         StrGrd1.Cells[C_COL_NOM_ACREDITADO,    vlRow] + #9 +
         StrGrd1.Cells[C_COL_ID_CREDITO,        vlRow] + #9 +

         StrGrd2.Cells[C_COL_F_INICIO,           vlRow] + #9 +
         StrGrd2.Cells[C_COL_F_VENCIMIENTO,      vlRow] + #9 +
         StrGrd2.Cells[C_COL_F_VENCIMIENTO_A,    vlRow] + #9 +
         StrGrd2.Cells[C_COL_CVE_PRODUCTO_GPO,   vlRow] + #9 +
         StrGrd2.Cells[C_COL_CVE_PRODUCTO_CRE,   vlRow] + #9 +
         StrGrd2.Cells[C_COL_CVE_BLQ_CPTO,       vlRow] + #9 +
         StrGrd2.Cells[C_COL_TX_REFERENCIA,      vlRow] + #9 +
         StrGrd2.Cells[C_COL_CVE_USU_ACTIVACION, vlRow] + #9 +
         StrGrd2.Cells[C_COL_FH_ACTIVACION,      vlRow] + #9 +

         StrGrd3.Cells[C_COL_ID_CONTRATO_DV,     vlRow] + #9 +
         StrGrd3.Cells[C_COL_NOM_TITULAR,        vlRow] + #9 +
         StrGrd3.Cells[C_COL_IMP_SALDO,          vlRow] + #13#10;
       End;

   Clipboard.SetTextBuf(PChar(str));
end;

end.
