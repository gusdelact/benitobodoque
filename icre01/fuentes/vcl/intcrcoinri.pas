// Sistema         : Clase de CrCoInRi
// Fecha de Inicio : 20/10/2008
// Función forma   : Clase de CrCoInRi
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     : EASA FEB.2010      Se adicionaron nuevas columnas para la calificación de deudores,
//                                      y excepción de créditos


Unit IntCrCoInRi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
// Unidades Adicionales
IntParamCre, Grids, DBGrids, IntGenCre,
ComObj,
IntXls,
IntPers,
Clipbrd
;

Type
 TCrCoInRi= class;

  TWCrCoInRi=Class(TForm)
    InterForma1             : TInterForma;
    Label1: TLabel;
    dtpF_CIERRE: TDateTimePicker;
    btMuestraDatos: TBitBtn;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    edFileNameXLS: TEdit;
    btnSaveFileName: TButton;
    btnGeneraArchivo: TButton;
    ProgressBar: TProgressBar;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    SaveDialog: TSaveDialog;
    QryCOINCRE: TQuery;
    dsrcCOINCRE: TDataSource;
    cbTest: TCheckBox;
    QryCOINCREID_CREDITO: TFloatField;
    QryCOINCREIMP_CAP_VIG: TFloatField;
    QryCOINCREIMP_CAP_IMP: TFloatField;
    QryCOINCREIMP_CAP_VDO_EX: TFloatField;
    QryCOINCREIMP_CAP_VDO_NE: TFloatField;
    QryCOINCREIMP_INT_VIG: TFloatField;
    QryCOINCREIMP_INT_IMP: TFloatField;
    QryCOINCREIMP_INT_VDO_EX: TFloatField;
    QryCOINCREIMP_INT_VDO_NE: TFloatField;
    QryCOINCREIMP_CTAS_ORD: TFloatField;
    QryCOINCREIMP_AUTORIZADO: TFloatField;
    QryCOINCREIMP_INT_X_COB: TFloatField;
    QryCOINCREPCT_GTIA_FND: TFloatField;
    QryCOINCREPCT_GARANTIZA: TFloatField;
    QryCOINCREIMP_GARANTIA: TFloatField;
    QryCOINCREIMP_COMISION_C: TFloatField;
    QryCOINCREFH_ALTA: TDateTimeField;
    QryCOINCREID_REG_VIGENTE: TFloatField;
    QryCOINCRENOM_ACREDITADO: TStringField;
    QryCOINCREID_ACREDITADO: TFloatField;
    QryCOINCREID_CONTRATO: TFloatField;
    QryCOINCRERFC: TStringField;
    QryCOINCRECVE_GRUPO_ECO: TStringField;
    QryCOINCREDESC_GRUPO_ECO: TStringField;
    QryCOINCRECVE_CAT_MINIMO: TStringField;
    QryCOINCRECVE_SENICREB: TStringField;
    QryCOINCREDESC_SENICREB: TStringField;
    QryCOINCRECVE_LOCAL_CNBV: TStringField;
    QryCOINCREDESC_LOCAL_CNBV: TStringField;
    QryCOINCRECVE_TAM_ACRED: TStringField;
    QryCOINCREDESC_TAM_ACRED: TStringField;
    QryCOINCRECVE_CLAS_CONTAB: TStringField;
    QryCOINCRECVE_DESTINO: TStringField;
    QryCOINCREDESC_DESTINO: TStringField;
    QryCOINCREF_DISPOSICION: TDateTimeField;
    QryCOINCREF_VENCIMIENTO: TDateTimeField;
    QryCOINCREF_AMORTIZACION: TDateTimeField;
    QryCOINCRECVE_AMORTIZACION: TStringField;
    QryCOINCREDESC_AMORTIZACION: TStringField;
    QryCOINCRECVE_PAG_INTERES: TStringField;
    QryCOINCREDESC_PAG_INTERES: TStringField;
    QryCOINCREDESC_MONEDA: TStringField;
    QryCOINCREDESC_FUENTE_PAGO: TStringField;
    QryCOINCRETASA_BASE: TFloatField;
    QryCOINCRECVE_TASA_REFER: TStringField;
    QryCOINCRESOBRETASA: TFloatField;
    QryCOINCRENUM_FREC_REV_TAS: TFloatField;
    QryCOINCRECVE_SIT_CREDITO: TStringField;
    QryCOINCRECVE_REESTRUCTURA: TStringField;
    QryCOINCRECVE_TIPO_GTIA: TStringField;
    QryCOINCREF_VAL_GARANTIA: TDateTimeField;
    QryCOINCRENUM_PRELACION: TFloatField;
    QryCOINCREB_ACRED_RELAC: TStringField;
    QryCOINCRECVE_ACRED_RELAC: TStringField;
    QryCOINCREID_PROM_ADM: TFloatField;
    QryCOINCRENOM_PROM_ADM: TStringField;
    QryCOINCREID_PROM_ASOC: TFloatField;
    QryCOINCRENOM_PROM_ASOC: TStringField;
    QryCOINCRECVE_LIQUIDACION: TStringField;
    QryCOINCRECVE_SECTOR_ECO: TStringField;
    QryCOINCREDESC_SECTOR_ECO: TStringField;
    QryCOINCREID_MERC_OBJ_DET: TFloatField;
    QryCOINCRECVE_ORIGEN_INFO: TStringField;
    QryCOINCRECVE_MERC_OB_GPO: TStringField;
    QryCOINCRECVE_PRODUCTO_CRE: TStringField;
    QryCOINCREDESC_L_PRODUCTO: TStringField;
    QryCOINCRECVE_SECTOR: TStringField;
    QryCOINCRECTA_K_VIG: TStringField;
    QryCOINCRECTA_K_IMP: TStringField;
    QryCOINCRECTA_K_VEN_EX: TStringField;
    QryCOINCRECTA_K_VEN_NE: TStringField;
    QryCOINCRECTA_I_VIG: TStringField;
    QryCOINCRECTA_I_IMP: TStringField;
    QryCOINCRECTA_I_VEN_EX: TStringField;
    QryCOINCRECTA_I_COB_XANT: TStringField;
    QryCOINCRECVE_MER_OBJETIVO: TStringField;
    QryCOINCREDESC_MERC_OBJETI: TStringField;
    QryCOINCREDESC_MER_OB_GPO: TStringField;
    QryCOINCRECVE_ORIGEN_REC: TStringField;
    QryCOINCREDESC_ORIGEN_REC: TStringField;
    QryCOINCRECVE_POBLAC_EDO: TStringField;
    QryCOINCREDESC_POBLAC_EDO: TStringField;
    QryCOINCREROE_BRUTA_1: TFloatField;
    QryCOINCREROE_NETA_1: TFloatField;
    QryCOINCRECALIF_DEUDOR: TStringField;
    Label10: TLabel;
    QryCOINCREIMP_CARTA_CREDITO: TFloatField;
    QryCOINCREPct_Adicional: TFloatField;
    QryCOINCREImp_Total_CCI: TFloatField;
    QryCOINCREPagos_Mes: TFloatField;
    QryCOINCRESaldo_Actual_CCI: TFloatField;
    QryCOINCREDesc_Calculo: TStringField;
    QryCOINCREF_Inicio_Int: TDateTimeField;
    QryCOINCREF_Vencimiento_Int: TDateTimeField;
    QryCOINCRETC: TCurrencyField;
    QryCOINCREEstructurado: TStringField;
    QryCOINCRECal_FITCH: TStringField;
    QryCOINCRECal_MOODYS: TStringField;
    QryCOINCRECal_HR: TStringField;
    QryCOINCRECal_STANDARD: TStringField;
    QryCOINCREIMP_PREVEN_CUB: TFloatField;
    QryCOINCREIMP_PREVEN_EXP: TFloatField;
    QryCOINCRECVE_CAL_DEU: TStringField;
    QryCOINCRECVE_CAL_OPE_CUB: TStringField;
    QryCOINCRECVE_CAL_OPE_EXP: TStringField;
    QryCOINCREIMP_EXPUESTO: TFloatField;
    QryCOINCREIMP_CUBIERTO: TFloatField;
    QryCOINCRECVE_CALCULO: TStringField;
    QryCOINCREINS_FEDERAL: TStringField;
    QryCOINCREREG_SECRETARIA: TStringField;
    QryCOINCREF_INS_FEDERAL: TDateTimeField;
    QryCOINCREID_AVAL_GOB: TFloatField;
    QryCOINCRECAL_VERUM: TStringField;
    QryCOINCRENUM_CALIF: TFloatField;
    QryCOINCREF_CIERRE: TDateTimeField;
    spGenera08: TStoredProc;
    QryCOINCRECVE_MONEDA: TStringField;
    Label5: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    cbAcreditado: TCheckBox;
    QryCOINCRERAM_MEZCLA: TFloatField;
    QryCOINCRERAM_FTP: TFloatField;
    QryCOINCREP_INCUMPL: TFloatField;
    QryCOINCRES_PERDIDA: TFloatField;
    QryCOINCREB_REVOLVENTE: TStringField;
    QryCOINCREB_REVOCABLE: TStringField;
    QryCOINCREF_VENCIMIENTO_CONTRATO: TDateTimeField;
    QryCOINCREDESC_CAT_MINIMO: TStringField;
    QryCOINCREIMP_RESERVA: TFloatField;
    QryCOINCRECVE_CALIFIC_CNBV: TStringField;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btMuestraDatosClick(Sender: TObject);
    procedure btnGeneraArchivoClick(Sender: TObject);
    procedure btnSaveFileNameClick(Sender: TObject);
    function  GeneraArchivoExcel(peFileName : String) : Boolean;
    procedure HabilitaControles(pebHabilita : Boolean);
    procedure edFileNameXLSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure cbAcreditadoClick(Sender: TObject);
    private
    { Private declarations }
      procedure EnableCheckBox(var CheckBox : TCheckBox);
    public
    { Public declarations }
    Objeto : TCrCoInRi;

    function    fnGeneraR08 : Boolean;
    function    ArmaQuery(peFecha : TDateTime; pebTest : Boolean) :  String;

end;


 TCrCoInRi= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        ID_ACREDITADO             : TInterCampo;

        ParamCre         : TParamCre;
        Persona          : TPersona;

        { Public declarations }

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;

      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrCoInRi.Create( AOwner : TComponent );
begin Inherited;
  ID_ACREDITADO    :=CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);

  Persona := TPersona.Create(Self);
  Persona.MasterSource := Self;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrCoInRi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCoInRi.Destroy;
begin inherited;
end;


function TCrCoInRi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCoInRi;
begin
   W:=TWCrCoInRi.Create(Self);
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


Function TCrCoInRi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrcoinr.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrCoInRi.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CrCoInRi********************)
(*                                                                              *)
(*  FORMA DE CrCoInRi                                                            *)
(*                                                                              *)
(***********************************************FORMA CrCoInRi********************)

procedure TWCrCoInRi.FormShow(Sender: TObject);
begin
     With Objeto Do
     Begin
          lbDempresa.Caption := ParamCre.EMPRESA.AsString;
          lbDfecha.Caption   := ParamCre.FECHA.AsString;
          lbDUsuario.Caption := ParamCre.USUARIO.AsString;
          lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

          dtpF_CIERRE.DateTime := Objeto.Apli.DameFechaEmpresa - 1;

          spGenera08.DatabaseName  := Objeto.Apli.DataBaseName;
          spGenera08.SessionName   := Objeto.Apli.SessionName;
          spGenera08.StoredProcName:= 'PKGCIRIESGOS.STP_GEN_CONSULTA_R08';
          QryCOINCRE.DatabaseName  := Objeto.Apli.DatabaseName;
          QryCOINCRE.SessionName   := Objeto.Apli.SessionName;

          ID_ACREDITADO.Control    :=edACREDITADO;
          Persona.Id_Persona.Control := edACREDITADO;
          Persona.Nombre.Control := edNOMBRE_ACRED;
     End;

end;

procedure TWCrCoInRi.FormDestroy(Sender: TObject);
begin
     //Objeto

  Objeto.ID_ACREDITADO.Control    :=Nil;     
  Objeto.Persona.Id_Persona.Control :=Nil;
  Objeto.Persona.Nombre.Control :=Nil;
     
end;

procedure TWCrCoInRi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryCOINCRE.Close;
  Action := caFree;
end;

procedure TWCrCoInRi.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCoInRi.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCoInRi.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;

procedure TWCrCoInRi.btMuestraDatosClick(Sender: TObject);
begin
  if Objeto.ValidaAccesoEsp('TCRCOINRI_CONSU',True,True) then
    fnGeneraR08;
end;


procedure TWCrCoInRi.btnGeneraArchivoClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOINRI_GENER',True,True) then
   begin
      If Not QryCOINCRE.Active Then
      Begin
        MessageDlg('No hay información COINCRE para guardar del Año Mes '+ FormatDateTime('YYYYMM',dtpF_CIERRE.DateTime),
                    mtWarning, [mbOk], 0 );
        Exit;
      End
      Else If (Trim(ExtractFileName(edFileNameXLS.Text)) = '') Then
      Begin
        MessageDlg('Debe de indicar primero el nombre del archivo en donde desea guardar la información.',
                    mtWarning, [mbOk], 0 );
        Exit;
      End
      Else If (LowerCase(Trim(ExtractFileExt(edFileNameXLS.Text))) <> '.xls') Then
      Begin
        edFileNameXLS.Text := edFileNameXLS.Text + '.xls';
      End;

      HabilitaControles(False);
      try
         GeneraArchivoExcel(edFileNameXLS.Text);
      except
           ShowMessage('Proceso concluido');
      end;
      HabilitaControles(True);
   end;
end;


procedure TWCrCoInRi.HabilitaControles(pebHabilita: Boolean);
begin
  dtpF_CIERRE.Enabled := pebHabilita;
  btMuestraDatos.Enabled := pebHabilita;
  dsrcCOINCRE.Enabled := pebHabilita;
  edFileNameXLS.Enabled := pebHabilita;
  btnSaveFileName.Enabled := pebHabilita;
  btnGeneraArchivo.Enabled := pebHabilita;
end;

procedure TWCrCoInRi.btnSaveFileNameClick(Sender: TObject);
begin
  If SaveDialog.Execute Then
    edFileNameXLS.Text := SaveDialog.FileName;
end;

(*
//  Respaldo antes de optimización en la generación del excel
function TWCrCoInRi.GeneraArchivoExcel(peFileName: String): Boolean;
var
    vlRange : Variant;
    vlCol, vlRow : Integer;
    vgExcelApp : OleVariant;
    vlColumnRange : Variant;
    VLSalida      : Boolean;
    BookMark : TBookMark;
begin
    Result := False;
    ProgressBar.Min := 0;
    ProgressBar.Position := 0;
    VLSalida := False;

    If Not QryCOINCRE.Active Then
      Exit;

    vgExcelApp := CreateOleObject('Excel.Application');
    Try
       vgExcelApp.Workbooks.Add;
       //----------------------------------
       // INICIA COLOCACIÓN DE ENCABEZADOS
       vlRow := 1;

       vgExcelApp.Cells[ vlRow , ColumnXlS('A') ].Value  := QryCOINCREF_CIERRE.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('B') ].Value  := QryCOINCREID_CREDITO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('C') ].Value  := QryCOINCREIMP_CAP_VIG.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('D') ].Value  := QryCOINCREIMP_CAP_IMP.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('E') ].Value  := QryCOINCREIMP_CAP_VDO_EX.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('F') ].Value  := QryCOINCREIMP_CAP_VDO_NE.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('G') ].Value  := QryCOINCREIMP_INT_VIG.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('H') ].Value  := QryCOINCREIMP_INT_IMP.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('I') ].Value  := QryCOINCREIMP_INT_VDO_EX.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('J') ].Value  := QryCOINCREIMP_INT_VDO_NE.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('K') ].Value  := QryCOINCREIMP_CTAS_ORD.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('L') ].Value  := QryCOINCREIMP_CONCEP_COB.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('M') ].Value  := QryCOINCREIMP_CONCEP_VIG.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('N') ].Value  := QryCOINCREIMP_CONCEP_IMP.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('O') ].Value  := QryCOINCREIMP_MOR_CP.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('P') ].Value  := QryCOINCREIMP_MOR_FN.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('Q') ].Value  := QryCOINCREIMP_MOR_IN.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('R') ].Value  := QryCOINCREIMP_MOR_CN.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('S') ].Value  := QryCOINCREIMP_RESP_TOT.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('T') ].Value  := QryCOINCREPCT_CUB_CREDITO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('U') ].Value  := QryCOINCREIMP_AUTORIZADO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('V') ].Value  := QryCOINCREIMP_AMORTIZA.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('W') ].Value  := QryCOINCREIMP_INT_X_COB.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('X') ].Value  := QryCOINCREPCT_GTIA_FND.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('Y') ].Value  := QryCOINCREIMP_CAPITALIZA.DisplayLabel;
//easa mar2010
//       vgExcelApp.Cells[ vlRow , ColumnXlS('Z') ].Value  := QryCOINCREIMP_CUBIERTO.DisplayLabel;
//       vgExcelApp.Cells[ vlRow , ColumnXlS('AA') ].Value  := QryCOINCREIMP_EXPUESTO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('Z') ].Value  := QryCOINCREIMP_RESERVA_CUB.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AA') ].Value  := QryCOINCREIMP_RESERVA_EXP.DisplayLabel;

       vgExcelApp.Cells[ vlRow , ColumnXlS('AB') ].Value  := QryCOINCREPCT_GARANTIZA.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AC') ].Value  := QryCOINCREIMP_GARANTIA.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AD') ].Value  := QryCOINCREIMP_SPM_CAP_VIG.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AE') ].Value  := QryCOINCREIMP_SPM_CAP_IMP.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AF') ].Value  := QryCOINCREIMP_SPM_CAP_VDO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AG') ].Value  := QryCOINCREIMP_COMISION_C.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AH') ].Value  := QryCOINCRENOM_ACREDITADO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AI') ].Value  := QryCOINCREID_ACREDITADO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AJ') ].Value  := QryCOINCREID_CONTRATO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AK') ].Value  := QryCOINCRERFC.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AL') ].Value  := QryCOINCRECVE_GRUPO_ECO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AM') ].Value  := QryCOINCREDESC_GRUPO_ECO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AN') ].Value  := QryCOINCRECVE_CAT_MINIMO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AO') ].Value  := QryCOINCRECVE_SENICREB.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AP') ].Value  := QryCOINCREDESC_SENICREB.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AQ') ].Value  := QryCOINCRECVE_LOCAL_CNBV.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AR') ].Value  := QryCOINCREDESC_LOCAL_CNBV.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AS') ].Value  := QryCOINCRECVE_TAM_ACRED.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AT') ].Value  := QryCOINCREDESC_TAM_ACRED.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AU') ].Value  := QryCOINCRECVE_CLAS_CONTAB.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AV') ].Value  := QryCOINCRECVE_DESTINO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AW') ].Value  := QryCOINCREDESC_DESTINO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AX') ].Value  := QryCOINCREF_DISPOSICION.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AY') ].Value  := QryCOINCREF_VENCIMIENTO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('AZ') ].Value  := QryCOINCREF_AMORTIZACION.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BA') ].Value  := QryCOINCRECVE_AMORTIZACION.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BB') ].Value  := QryCOINCREDESC_AMORTIZACION.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BC') ].Value  := QryCOINCRECVE_PAG_INTERES.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BD') ].Value  := QryCOINCREDESC_PAG_INTERES.DisplayLabel;

{AGF 2011.11.17 Información de intereses}
       vgExcelApp.Cells[ vlRow , ColumnXlS('BE') ].Value  := QryCOINCREDesc_Calculo.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BF') ].Value  := QryCOINCREF_Inicio_Int.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BG') ].Value  := QryCOINCREF_Vencimiento_Int.DisplayLabel;
{/AGF 2011.11.17}

       vgExcelApp.Cells[ vlRow , ColumnXlS('BH') ].Value  := QryCOINCRECVE_MONEDA.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BI') ].Value  := QryCOINCREDESC_MONEDA.DisplayLabel;

{AGF 2011.11.17 Se agrega el tipo de cambio para efectos de valorización}
       vgExcelApp.Cells[ vlRow , ColumnXlS('BJ') ].Value  := QryCOINCRETC.DisplayLabel;
{/AGF 2011.11.17}

       vgExcelApp.Cells[ vlRow , ColumnXlS('BK') ].Value  := QryCOINCRECVE_FUENTE_PAGO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BL') ].Value  := QryCOINCREDESC_FUENTE_PAGO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BM') ].Value  := QryCOINCRETASA_BASE.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BN') ].Value  := QryCOINCRECVE_TASA_REFER.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BO') ].Value  := QryCOINCRESOBRETASA.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BP') ].Value  := QryCOINCRENUM_FREC_REV_TAS.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BQ') ].Value  := QryCOINCRECVE_SIT_CREDITO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BR') ].Value  := QryCOINCRECVE_REESTRUCTURA.DisplayLabel;

//easa mar2010
//       vgExcelApp.Cells[ vlRow , ColumnXlS('BO') ].Value  := QryCOINCRECVE_CAL_DEU.DisplayLabel;
//       vgExcelApp.Cells[ vlRow , ColumnXlS('BP') ].Value  := QryCOINCRECVE_CAL_OPE_CUB.DisplayLabel;
//       vgExcelApp.Cells[ vlRow , ColumnXlS('BQ') ].Value  := QryCOINCRECVE_CAL_OPE_EXP.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BS') ].Value  := QryCOINCRECALIF_DEUDOR.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BT') ].Value  := QryCOINCRECVE_CALIFIC_CUB.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BU') ].Value  := QryCOINCRECVE_CALIFIC_EXP.DisplayLabel;

       vgExcelApp.Cells[ vlRow , ColumnXlS('BV') ].Value  := QryCOINCRECVE_TIPO_GTIA.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BW') ].Value  := QryCOINCREF_VAL_GARANTIA.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BX') ].Value  := QryCOINCRENUM_PRELACION.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BY') ].Value  := QryCOINCREB_ACRED_RELAC.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('BZ') ].Value  := QryCOINCRECVE_ACRED_RELAC.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CA') ].Value  := QryCOINCREID_PROM_ADM.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CB') ].Value  := QryCOINCRENOM_PROM_ADM.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CC') ].Value  := QryCOINCREID_PROM_ASOC.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CD') ].Value  := QryCOINCRENOM_PROM_ASOC.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CE') ].Value  := QryCOINCRENUM_PERIODO_G.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CF') ].Value  := QryCOINCRECVE_LIQUIDACION.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CG') ].Value  := QryCOINCRECVE_SECTOR_ECO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CH') ].Value  := QryCOINCREDESC_SECTOR_ECO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CI') ].Value  := QryCOINCRECVE_ORIGEN_INFO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CJ') ].Value  := QryCOINCRECVE_MER_OBJETIVO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CK') ].Value  := QryCOINCREDESC_MERC_OBJETI.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CL') ].Value  := QryCOINCRECVE_MERC_OB_GPO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CM') ].Value  := QryCOINCREDESC_MER_OB_GPO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CN') ].Value  := QryCOINCRECVE_ORIGEN_REC.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CO') ].Value  := QryCOINCREDESC_ORIGEN_REC.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CP') ].Value  := QryCOINCRECVE_POBLAC_EDO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CQ') ].Value  := QryCOINCREDESC_POBLAC_EDO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CR') ].Value  := QryCOINCRECVE_PRODUCTO_CRE.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CS') ].Value  := QryCOINCREDESC_L_PRODUCTO.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CT') ].Value  := QryCOINCRECVE_SECTOR.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CU') ].Value  := QryCOINCRECTA_K_VIG.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CV') ].Value  := QryCOINCRECTA_K_IMP.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CW') ].Value  := QryCOINCRECTA_K_VEN_EX.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CX') ].Value  := QryCOINCRECTA_K_VEN_NE.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CY') ].Value  := QryCOINCRECTA_I_VIG.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('CZ') ].Value  := QryCOINCRECTA_I_IMP.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('DA') ].Value  := QryCOINCRECTA_I_VEN_EX.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('DB') ].Value  := QryCOINCRECTA_I_COB_XANT.DisplayLabel;
//ROIM748  12/Jun   Se integra campos de consulta de Riesgos
       vgExcelApp.Cells[ vlRow , ColumnXlS('DC') ].Value  := QryCOINCREROE_BRUTA_1.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('DD') ].Value  := QryCOINCREROE_NETA_1.DisplayLabel;
{RUCJ4248}
       vgExcelApp.Cells[ vlRow , ColumnXlS('DE') ].Value  := QryCOINCRERAM_MEZCLA.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('DF') ].Value  := QryCOINCRERAM_FTP.DisplayLabel;
{//RUCJ4248}
       vgExcelApp.Cells[ vlRow , ColumnXlS('DG') ].Value  := QryCOINCREPCT_REQ_CAP_MER_1.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('DH') ].Value  := QryCOINCREPCT_REQ_CAP_CRE_1.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('DI') ].Value  := QryCOINCREPCT_CAPITALIZ_1.DisplayLabel;
////ROIM748
{AGF 2011.12.07 Se agrega la información de las calificadoras}
       vgExcelApp.Cells[ vlRow , ColumnXlS('DJ') ].Value  := QryCOINCREEstructurado.DisplayLabel;
{RUCJ4248}
       vgExcelApp.Cells[ vlRow , ColumnXlS('DK') ].Value  := QryCOINCREINS_FEDERAL.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('DL') ].Value  := QryCOINCREF_INS_FEDERAL.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('DM') ].Value  := QryCOINCREID_AVAL_GOB.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('DN') ].Value  := QryCOINCRENUM_CALIF.DisplayLabel;
{//RUCJ4248}
       vgExcelApp.Cells[ vlRow , ColumnXlS('DO') ].Value  := QryCOINCRECal_FITCH.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('DP') ].Value  := QryCOINCRECal_MOODYS.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('DQ') ].Value  := QryCOINCRECal_HR.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('DR') ].Value  := QryCOINCRECal_STANDARD.DisplayLabel;
{RUCJ4248}
       vgExcelApp.Cells[ vlRow , ColumnXlS('DS') ].Value  := QryCOINCRECAL_VERUM.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('DT') ].Value  := QryCOINCREPND.DisplayLabel;
{//RUCJ4248}

{/AGF 2011.12.07 Se agrega la información de las calificadoras}
////AGF 06.SEP.2011 Se incluye la información de cartas de crédito
       vgExcelApp.Cells[ vlRow , ColumnXlS('DU') ].Value  := QryCOINCREIMP_CARTA_CREDITO.DisplayLabel;
////AGF 06.SEP.2011 Se incluye la información de cartas de crédito
////AGF 05.OCT.2011 Se incluyen los pagos de cartas de crédito
       vgExcelApp.Cells[ vlRow , ColumnXlS('DV') ].Value  := QryCOINCREPct_Adicional.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('DW') ].Value  := QryCOINCREImp_Total_CCI.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('DX') ].Value  := QryCOINCREPagos_Mes.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('DY') ].Value  := QryCOINCRESaldo_Actual_CCI.DisplayLabel;
////AGF 05.OCT.2011 Se incluyen los pagos de cartas de crédito
////AGF 05.NOV.2015 Se incluye la información de PI, SP, Revolvente, Revocable y Fecha de Vencimiento del contrato
       vgExcelApp.Cells[ vlRow , ColumnXlS('DZ') ].Value  := QryCOINCREP_INCUMPL.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('EA') ].Value  := QryCOINCRES_PERDIDA.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('EB') ].Value  := QryCOINCREB_REVOLVENTE.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('EC') ].Value  := QryCOINCREB_REVOCABLE.DisplayLabel;
       vgExcelApp.Cells[ vlRow , ColumnXlS('ED') ].Value  := QryCOINCREF_VENCIMIENTO_CONTRATO.DisplayLabel;
////AGF 05.NOV.2015 Se incluye la información de PI, SP, Revolvente, Revocable y Fecha de Vencimiento del contrato


       //Para no mover el frid
       BookMark := QryCOINCRE.GetBookmark;
       //----------------------------------
       // INICIA EL LLENADO DE DATOS HACIA
       // EL ARCHIVO DE EXCEL
       vlRow := 2;
       QryCOINCRE.Last; ProgressBar.Max := QryCOINCRE.RecordCount; QryCOINCRE.First;
       vgExcelApp.Range ['C2'].Select;
       vgExcelApp.ActiveWindow.FreezePanes := True;


       While Not QryCOINCRE.Eof Do
       Begin
           vgExcelApp.Cells[ vlRow , ColumnXlS('A') ].Value  := dtpF_CIERRE.DateTime;
////AGF 06.SEP.2011 Se incluye la información de cartas de crédito
           if not QryCOINCRE.FieldByName('ID_CREDITO').IsNull then
             vgExcelApp.Cells[ vlRow , ColumnXlS('B') ].Value  := QryCOINCRE.FieldByName('ID_CREDITO').AsInteger
           else
             vgExcelApp.Cells[ vlRow , ColumnXlS('B') ].Value  := QryCOINCRE.FieldByName('ID_CREDITO_1').AsInteger;
////AGF 06.SEP.2011 Se incluye la información de cartas de crédito
           vgExcelApp.Cells[ vlRow , ColumnXlS('C') ].Value  := QryCOINCRE.FieldByName('IMP_CAP_VIG').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('D') ].Value  := QryCOINCRE.FieldByName('IMP_CAP_IMP').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('E') ].Value  := QryCOINCRE.FieldByName('IMP_CAP_VDO_EX').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('F') ].Value  := QryCOINCRE.FieldByName('IMP_CAP_VDO_NE').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('G') ].Value  := QryCOINCRE.FieldByName('IMP_INT_VIG').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('H') ].Value  := QryCOINCRE.FieldByName('IMP_INT_IMP').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('I') ].Value  := QryCOINCRE.FieldByName('IMP_INT_VDO_EX').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('J') ].Value  := QryCOINCRE.FieldByName('IMP_INT_VDO_NE').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('K') ].Value  := QryCOINCRE.FieldByName('IMP_CTAS_ORD').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('L') ].Value  := QryCOINCRE.FieldByName('IMP_CONCEP_COB').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('M') ].Value  := QryCOINCRE.FieldByName('IMP_CONCEP_VIG').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('N') ].Value  := QryCOINCRE.FieldByName('IMP_CONCEP_IMP').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('O') ].Value  := QryCOINCRE.FieldByName('IMP_MOR_CP').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('P') ].Value  := QryCOINCRE.FieldByName('IMP_MOR_FN').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('Q') ].Value  := QryCOINCRE.FieldByName('IMP_MOR_IN').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('R') ].Value  := QryCOINCRE.FieldByName('IMP_MOR_CN').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('S') ].Value  := QryCOINCRE.FieldByName('IMP_RESP_TOT').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('T') ].Value  := QryCOINCRE.FieldByName('PCT_CUB_CREDITO').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('U') ].Value  := QryCOINCRE.FieldByName('IMP_AUTORIZADO').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('V') ].Value  := QryCOINCRE.FieldByName('IMP_AMORTIZA').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('W') ].Value  := QryCOINCRE.FieldByName('IMP_INT_X_COB').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('X') ].Value  := QryCOINCRE.FieldByName('PCT_GTIA_FND').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('Y') ].Value  := QryCOINCRE.FieldByName('IMP_CAPITALIZA').AsFloat;
//EASA MAR2010 Se integra campos de consulta de Riesgos
//           vgExcelApp.Cells[ vlRow , ColumnXlS('Z') ].Value  := QryCOINCRE.FieldByName('IMP_PREVEN_CUB').AsFloat;
//           vgExcelApp.Cells[ vlRow , ColumnXlS('AA') ].Value  := QryCOINCRE.FieldByName('IMP_PREVEN_EXP').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('Z') ].Value  := QryCOINCRE.FieldByName('IMP_RESERVA_CUB').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AA') ].Value  := QryCOINCRE.FieldByName('IMP_RESERVA_EXP').AsFloat;

           vgExcelApp.Cells[ vlRow , ColumnXlS('AB') ].Value  := QryCOINCRE.FieldByName('PCT_GARANTIZA').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AC') ].Value  := QryCOINCRE.FieldByName('IMP_GARANTIA').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AD') ].Value  := QryCOINCRE.FieldByName('IMP_SPM_CAP_VIG').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AE') ].Value  := QryCOINCRE.FieldByName('IMP_SPM_CAP_IMP').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AF') ].Value  := QryCOINCRE.FieldByName('IMP_SPM_CAP_VDO').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AG') ].Value  := QryCOINCRE.FieldByName('IMP_COMISION_C').AsFloat;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AH') ].Value  := QryCOINCRE.FieldByName('NOM_ACREDITADO').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AI') ].Value  := QryCOINCRE.FieldByName('ID_ACREDITADO').AsInteger;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AJ') ].Value  := QryCOINCRE.FieldByName('ID_CONTRATO').AsInteger;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AK') ].Value  := QryCOINCRE.FieldByName('RFC').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AL') ].Value  := QryCOINCRE.FieldByName('CVE_GRUPO_ECO').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AM') ].Value  := QryCOINCRE.FieldByName('DESC_GRUPO_ECO').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AN') ].Value  := ''''+QryCOINCRE.FieldByName('CVE_CAT_MINIMO').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AO') ].Value  := QryCOINCRE.FieldByName('CVE_SENICREB').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AP') ].Value  := QryCOINCRE.FieldByName('DESC_SENICREB').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AQ') ].Value  := QryCOINCRE.FieldByName('CVE_LOCAL_CNBV').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AR') ].Value  := QryCOINCRE.FieldByName('DESC_LOCAL_CNBV').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AS') ].Value  := QryCOINCRE.FieldByName('CVE_TAM_ACRED').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AT') ].Value  := QryCOINCRE.FieldByName('DESC_TAM_ACRED').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AU') ].Value  := ''''+QryCOINCRE.FieldByName('CVE_CLAS_CONTAB').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AV') ].Value  := QryCOINCRE.FieldByName('CVE_DESTINO').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('AW') ].Value  := QryCOINCRE.FieldByName('DESC_DESTINO').AsString;
           if QryCOINCRE.FieldByName('F_DISPOSICION').AsString <> '' then
             vgExcelApp.Cells[ vlRow , ColumnXlS('AX') ].Value  := FormatDateTime('mm/dd/yyyy', QryCOINCRE.FieldByName('F_DISPOSICION').AsDatetime)
           else vgExcelApp.Cells[ vlRow , ColumnXlS('AX') ].Value  := '';
           if QryCOINCRE.FieldByName('F_VENCIMIENTO').AsString <> '' then
             vgExcelApp.Cells[ vlRow , ColumnXlS('AY') ].Value  := FormatDateTime('mm/dd/yyyy', QryCOINCRE.FieldByName('F_VENCIMIENTO').AsDatetime)
           else vgExcelApp.Cells[ vlRow , ColumnXlS('AY') ].Value  := '';
           if QryCOINCRE.FieldByName('F_AMORTIZACION').AsString <> '' then
             vgExcelApp.Cells[ vlRow , ColumnXlS('AZ') ].Value  := FormatDateTime('mm/dd/yyyy', QryCOINCRE.FieldByName('F_AMORTIZACION').AsDatetime)
           else vgExcelApp.Cells[ vlRow , ColumnXlS('AZ') ].Value  := '';
           vgExcelApp.Cells[ vlRow , ColumnXlS('BA') ].Value  := QryCOINCRE.FieldByName('CVE_AMORTIZACION').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('BB') ].Value  := QryCOINCRE.FieldByName('DESC_AMORTIZACION').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('BC') ].Value  := QryCOINCRE.FieldByName('CVE_PAG_INTERES').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('BD') ].Value  := QryCOINCRE.FieldByName('DESC_PAG_INTERES').AsString;

{AGF 2011.11.17 Información de intereses}
           vgExcelApp.Cells[ vlRow , ColumnXlS('BE') ].Value  := QryCOINCRE.FieldByName('DESC_CALCULO').AsString;
           if QryCOINCRE.FieldByName('F_INICIO_INT').AsString <> '' then
             vgExcelApp.Cells[ vlRow , ColumnXlS('BF') ].Value  := FormatDateTime('mm/dd/yyyy', QryCOINCRE.FieldByName('F_INICIO_INT').AsDatetime)
           else vgExcelApp.Cells[ vlRow , ColumnXlS('BF') ].Value  := '';
           if QryCOINCRE.FieldByName('F_VENCIMIENTO_INT').AsString <> '' then
             vgExcelApp.Cells[ vlRow , ColumnXlS('BG') ].Value  := FormatDateTime('mm/dd/yyyy', QryCOINCRE.FieldByName('F_VENCIMIENTO_INT').AsDatetime)
           else vgExcelApp.Cells[ vlRow , ColumnXlS('BG') ].Value  := '';
{/AGF 2011.11.17}

           vgExcelApp.Cells[ vlRow , ColumnXlS('BH') ].Value  := QryCOINCRE.FieldByName('CVE_MONEDA').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('BI') ].Value  := QryCOINCRE.FieldByName('DESC_MONEDA').AsString;

{AGF 2011.11.17 Se agrega el tipo de cambio para efectos de valorización}
           vgExcelApp.Cells[ vlRow , ColumnXlS('BJ') ].Value  := QryCOINCRE.FieldByName('TC').AsString;
{/AGF 2011.11.17}

           vgExcelApp.Cells[ vlRow , ColumnXlS('BK') ].Value  := QryCOINCRE.FieldByName('CVE_FUENTE_PAGO').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('BL') ].Value  := QryCOINCRE.FieldByName('DESC_FUENTE_PAGO').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('BM') ].Value  := QryCOINCRE.FieldByName('TASA_BASE').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('BN') ].Value  := QryCOINCRE.FieldByName('CVE_TASA_REFER').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('BO') ].Value  := QryCOINCRE.FieldByName('SOBRETASA').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('BP') ].Value  := QryCOINCRE.FieldByName('NUM_FREC_REV_TAS').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('BQ') ].Value  := QryCOINCRE.FieldByName('CVE_SIT_CREDITO').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('BR') ].Value  := QryCOINCRE.FieldByName('CVE_REESTRUCTURA').AsString;
//EASA MAR2010 Se integra campos de consulta de Riesgos
//           vgExcelApp.Cells[ vlRow , ColumnXlS('BO') ].Value  := QryCOINCRE.FieldByName('CVE_CAL_DEU').AsString;
//           vgExcelApp.Cells[ vlRow , ColumnXlS('BP') ].Value  := QryCOINCRE.FieldByName('CVE_CAL_OPE_CUB').AsString;
//           vgExcelApp.Cells[ vlRow , ColumnXlS('BQ') ].Value  := QryCOINCRE.FieldByName('CVE_CAL_OPE_EXP').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('BS') ].Value  := QryCOINCRE.FieldByName('CALIF_DEUDOR').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('BT') ].Value  := QryCOINCRE.FieldByName('CVE_CALIFIC_CUB').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('BU') ].Value  := QryCOINCRE.FieldByName('CVE_CALIFIC_EXP').AsString;

           vgExcelApp.Cells[ vlRow , ColumnXlS('BV') ].Value  := QryCOINCRE.FieldByName('CVE_TIPO_GTIA').AsString;
           if QryCOINCRE.FieldByName('F_VAL_GARANTIA').AsString <> '' then
             vgExcelApp.Cells[ vlRow , ColumnXlS('BW') ].Value  := FormatDateTime('mm/dd/yyyy', QryCOINCRE.FieldByName('F_VAL_GARANTIA').AsDatetime)
           else vgExcelApp.Cells[ vlRow , ColumnXlS('BW') ].Value  := '';
           vgExcelApp.Cells[ vlRow , ColumnXlS('BX') ].Value  := QryCOINCRE.FieldByName('NUM_PRELACION').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('BY') ].Value  := QryCOINCRE.FieldByName('B_ACRED_RELAC').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('BZ') ].Value  := QryCOINCRE.FieldByName('CVE_ACRED_RELAC').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CA') ].Value  := QryCOINCRE.FieldByName('ID_PROM_ADM').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CB') ].Value  := QryCOINCRE.FieldByName('NOM_PROM_ADM').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CC') ].Value  := QryCOINCRE.FieldByName('ID_PROM_ASOC').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CD') ].Value  := QryCOINCRE.FieldByName('NOM_PROM_ASOC').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CE') ].Value  := QryCOINCRE.FieldByName('NUM_PERIODO_G').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CF') ].Value  := QryCOINCRE.FieldByName('CVE_LIQUIDACION').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CG') ].Value  := QryCOINCRE.FieldByName('CVE_SECTOR_ECO').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CH') ].Value  := QryCOINCRE.FieldByName('DESC_SECTOR_ECO').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CI') ].Value  := QryCOINCRE.FieldByName('CVE_ORIGEN_INFO').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CJ') ].Value  := QryCOINCRE.FieldByName('CVE_MER_OBJETIVO').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CK') ].Value  := QryCOINCRE.FieldByName('DESC_MERC_OBJETI').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CL') ].Value  := QryCOINCRE.FieldByName('CVE_MERC_OB_GPO').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CM') ].Value  := QryCOINCRE.FieldByName('DESC_MER_OB_GPO').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CN') ].Value  := QryCOINCRE.FieldByName('CVE_ORIGEN_REC').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CO') ].Value  := QryCOINCRE.FieldByName('DESC_ORIGEN_REC').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CP') ].Value  := QryCOINCRE.FieldByName('CVE_POBLAC_EDO').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CQ') ].Value  := QryCOINCRE.FieldByName('DESC_POBLAC_EDO').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CR') ].Value  := QryCOINCRE.FieldByName('CVE_PRODUCTO_CRE').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CS') ].Value  := QryCOINCRE.FieldByName('DESC_L_PRODUCTO').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CT') ].Value  := QryCOINCRE.FieldByName('CVE_SECTOR').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CU') ].Value  := QryCOINCRE.FieldByName('CTA_K_VIG').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CV') ].Value  := QryCOINCRE.FieldByName('CTA_K_IMP').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CW') ].Value  := QryCOINCRE.FieldByName('CTA_K_VEN_EX').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CX') ].Value  := QryCOINCRE.FieldByName('CTA_K_VEN_NE').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CY') ].Value  := QryCOINCRE.FieldByName('CTA_I_VIG').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('CZ') ].Value  := QryCOINCRE.FieldByName('CTA_I_IMP').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('DA') ].Value  := QryCOINCRE.FieldByName('CTA_I_VEN_EX').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('DB') ].Value  := QryCOINCRE.FieldByName('CTA_I_COB_XANT').AsString;


//ROIM748  12/Jun   Se integra campos de consulta de Riesgos
           vgExcelApp.Cells[ vlRow , ColumnXlS('DC') ].Value  := QryCOINCRE.FieldByName('ROE_BRUTA_1').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('DD') ].Value  := QryCOINCRE.FieldByName('ROE_NETA_1').AsString;
{RUCJ4248}
           vgExcelApp.Cells[ vlRow , ColumnXlS('DE') ].Value  := QryCOINCRE.FieldByName('RAM_MEZCLA').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('DF') ].Value  := QryCOINCRE.FieldByName('RAM_FTP').AsString;
{RUCJ4248}
           vgExcelApp.Cells[ vlRow , ColumnXlS('DG') ].Value  := QryCOINCRE.FieldByName('PCT_REQ_CAP_MER_1').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('DH') ].Value  := QryCOINCRE.FieldByName('PCT_REQ_CAP_CRE_1').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('DI') ].Value  := QryCOINCRE.FieldByName('PCT_CAPITALIZ_1').AsString;
////ROIM748
{AGF 2011.12.07 Se agrega la información de las calificadoras}
           vgExcelApp.Cells[ vlRow , ColumnXlS('DJ') ].Value  := QryCOINCRE.FieldByName('ESTRUCTURADO').AsString;
{RUCJ4248}
           vgExcelApp.Cells[ vlRow , ColumnXlS('DK') ].Value  := QryCOINCRE.FieldByName('INS_FEDERAL').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('DL') ].Value  := QryCOINCRE.FieldByName('F_INS_FEDERAL').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('DM') ].Value  := QryCOINCRE.FieldByName('ID_AVAL_GOB').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('DN') ].Value  := QryCOINCRE.FieldByName('NUM_CALIF').AsString;
{//RUCJ4248}

           vgExcelApp.Cells[ vlRow , ColumnXlS('DO') ].Value  := QryCOINCRE.FieldByName('CAL_FITCH').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('DP') ].Value  := QryCOINCRE.FieldByName('CAL_MOODYS').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('DQ') ].Value  := QryCOINCRE.FieldByName('CAL_HR').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('DR') ].Value  := QryCOINCRE.FieldByName('CAL_STANDARD').AsString;
{RUCJ4248}
           vgExcelApp.Cells[ vlRow , ColumnXlS('DS') ].Value  := QryCOINCRE.FieldByName('CAL_VERUM').AsString;
           vgExcelApp.Cells[ vlRow , ColumnXlS('DT') ].Value  := QryCOINCRE.FieldByName('PND').AsString;
{//RUCJ4248}


{/AGF 2011.12.07 Se agrega la información de las calificadoras}
////AGF 06.SEP.2011 Se incluye la información de cartas de crédito
//           if QryCOINCRE.FieldByName('ID_CREDITO').IsNull then
//           begin
             vgExcelApp.Cells[ vlRow , ColumnXlS('DU') ].Value  := QryCOINCRE.FieldByName('IMP_CARTA_CREDITO').AsString;
////AGF 06.SEP.2011 Se incluye la información de cartas de crédito
             vgExcelApp.Cells[ vlRow , ColumnXlS('DV') ].Value  := QryCOINCRE.FieldByName('PCT_ADICIONAL').AsString;
             vgExcelApp.Cells[ vlRow , ColumnXlS('DW') ].Value  := QryCOINCRE.FieldByName('IMP_TOTAL_CCI').AsString;
             vgExcelApp.Cells[ vlRow , ColumnXlS('DX') ].Value  := QryCOINCRE.FieldByName('PAGOS_MES').AsString;
             vgExcelApp.Cells[ vlRow , ColumnXlS('DY') ].Value  := QryCOINCRE.FieldByName('SALDO_ACTUAL_CCI').AsString;
////AGF 05.OCT.2011 Se incluyen los pagos de cartas de crédito
////AGF 05.OCT.2011 Se incluyen los pagos de cartas de crédito
////AGF 05.NOV.2015 Se incluye la información de PI, SP, Revolvente, Revocable y Fecha de Vencimiento del contrato
             vgExcelApp.Cells[ vlRow , ColumnXlS('DZ') ].Value  := QryCOINCRE.FieldByName('P_INCUMPL').AsString;
             vgExcelApp.Cells[ vlRow , ColumnXlS('EA') ].Value  := QryCOINCRE.FieldByName('S_PERDIDA').AsString;
             vgExcelApp.Cells[ vlRow , ColumnXlS('EB') ].Value  := QryCOINCRE.FieldByName('B_REVOLVENTE').AsString;
             vgExcelApp.Cells[ vlRow , ColumnXlS('EC') ].Value  := QryCOINCRE.FieldByName('B_REVOCABLE').AsString;

             if QryCOINCRE.FieldByName('F_VENCIMIENTO_CONTRATO').AsString <> '' then
               vgExcelApp.Cells[ vlRow , ColumnXlS('ED') ].Value  := FormatDateTime('mm/dd/yyyy', QryCOINCRE.FieldByName('F_VENCIMIENTO_CONTRATO').AsDatetime);

////AGF 05.NOV.2015 Se incluye la información de PI, SP, Revolvente, Revocable y Fecha de Vencimiento del contrato

//           end;
////AGF 06.SEP.2011 Se incluye la información de cartas de crédito


            Application.ProcessMessages;
            ProgressBar.Position := vlRow;
            Inc(vlRow);
            QryCOINCRE.Next;
       End;


       //-----------------------------------------------
       //         INICIA FORMATOS DE CELDAS
       //-----------------------------------------------
       //

       // ShowMessage(Format('Excel Version %s: ', [vgExcelApp.Version]));

       // Modifica el tamaño de la fuente
       vlColumnRange := vgExcelApp.Workbooks[1].WorkSheets[1].Columns;
       For vlCol := 1 To ColumnXlS('ED') {137} Do
       Begin
            vlColumnRange.Columns[vlCol].Font.Size := 8;
       End;

       // Colocación de colores de banda de titulos
//       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['A1:DC1']; EASA 23.FEB.2010
       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['A1:ED1'];
       vlRange.Font.FontStyle := 'Bold';
       vlRange.Font.Color := clWhite;
       vlRange.Columns.Interior.ColorIndex := 1; // Negro
       vlRange.WrapText := True;

       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['C1:S'+IntToStr(vlRow-1)];
       vlRange.NumberFormat := '#,##0.00';

       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['U1:W'+IntToStr(vlRow-1)];
       vlRange.NumberFormat := '#,##0.00';

       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['Y1:AA'+IntToStr(vlRow-1)];
       vlRange.NumberFormat := '#,##0.00';

       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['AC1:AG'+IntToStr(vlRow-1)];
       vlRange.NumberFormat := '#,##0.00';

       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['CY1:DC'+IntToStr(vlRow-1)];
       vlRange.NumberFormat := '#,##0.0000';

       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['DD:DY'+IntToStr(vlRow-1)];
       vlRange.NumberFormat := '#,##0.00';

       For vlCol := 1 To ColumnXlS('ED') {137} Do
       Begin
            vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range[IntToColumnXlS(vlCol)+'1:'+IntToColumnXlS(vlCol)+'1'];
            vlRange.WrapText := True;
       End;

    VLSalida := True;


    Finally
       HabilitaControles(True);
       vgExcelApp.ActiveWorkBook.SaveAs(peFileName);
       if CloseExcelFile(vgExcelApp) then
          ShowMessage('Archivo Generado')
       else
          ShowMessage('Archio no generado');
       //end if
    End;

    GeneraArchivoExcel := VLSalida;
end;
*)

function IntToExcelStr (n: integer; XLSColumnName: string): string;
begin
  //XLSColumnName no se utiliza, es solo para mantener el orden dentro de la generación del excel

  result := IntToStr (n);
end;

function FloatToExcelStr (n: Extended; XLSColumnName: string): string;
begin
  //XLSColumnName no se utiliza, es solo para mantener el orden dentro de la generación del excel

  result := FloatToStr (n);
end;

function StrToExcelStr (s: string; XLSColumnName: string): string;
begin
  //XLSColumnName no se utiliza, es solo para mantener el orden dentro de la generación del excel

  result := s;
end;

function DateToExcelStr (Field: TDateTimeField; XLSColumnName: string): string;
begin
  //XLSColumnName no se utiliza, es solo para mantener el orden dentro de la generación del excel

  result := '';
  if Field.AsString <> '' then
//    result := FormatDateTime('mm/dd/yyyy', Field.AsDatetime)
    result := FormatDateTime('dd/mm/yyyy', Field.AsDatetime)
end;

function DateTimeToExcelStr (Field: TDateTimeField; XLSColumnName: string): string;
begin
  //XLSColumnName no se utiliza, es solo para mantener el orden dentro de la generación del excel

  result := '';
  if Field.AsString <> '' then
    result := FormatDateTime('mm/dd/yyyy hh:nn:ss', Field.AsDatetime)
end;

function TWCrCoInRi.GeneraArchivoExcel(peFileName: String): Boolean;
const
  Tab = #9;
var
    vlRange : Variant;
    vlCol, vlRow : Integer;
    vgExcelApp : OleVariant;
    vlColumnRange : Variant;
    VLSalida      : Boolean;
    BookMark : TBookMark;
    List: TStringList;
    Renglon: string;
begin
    Result               := False;
    ProgressBar.Min      := 0;
    ProgressBar.Position := 0;
    VLSalida             := False;

    If Not QryCOINCRE.Active Then
      Exit;

    List       := TStringList.Create;
    vgExcelApp := CreateOleObject('Excel.Application');
    Try
       vgExcelApp.Workbooks.Add;
       //----------------------------------
       // INICIA COLOCACIÓN DE ENCABEZADOS
       vlRow := 1;
       Renglon := StrToExcelStr (QryCOINCREF_CIERRE              .DisplayLabel, 'A' ) + Tab +
                  StrToExcelStr (QryCOINCREID_CREDITO            .DisplayLabel, 'B' ) + Tab +
                  StrToExcelStr (QryCOINCREIMP_CAP_VIG           .DisplayLabel, 'C' ) + Tab +
                  StrToExcelStr (QryCOINCREIMP_CAP_IMP           .DisplayLabel, 'D' ) + Tab +
                  StrToExcelStr (QryCOINCREIMP_CAP_VDO_EX        .DisplayLabel, 'E' ) + Tab +
                  StrToExcelStr (QryCOINCREIMP_CAP_VDO_NE        .DisplayLabel, 'F' ) + Tab +
                  StrToExcelStr (QryCOINCREIMP_INT_VIG           .DisplayLabel, 'G' ) + Tab +
                  StrToExcelStr (QryCOINCREIMP_INT_IMP           .DisplayLabel, 'H' ) + Tab +
                  StrToExcelStr (QryCOINCREIMP_INT_VDO_EX        .DisplayLabel, 'I' ) + Tab +
                  StrToExcelStr (QryCOINCREIMP_INT_VDO_NE        .DisplayLabel, 'J' ) + Tab +
                  StrToExcelStr (QryCOINCREIMP_CTAS_ORD          .DisplayLabel, 'K' ) + Tab +
//                  StrToExcelStr (QryCOINCREIMP_CONCEP_COB        .DisplayLabel, 'L' ) + Tab +
//                  StrToExcelStr (QryCOINCREIMP_CONCEP_VIG        .DisplayLabel, 'M' ) + Tab +
//                  StrToExcelStr (QryCOINCREIMP_CONCEP_IMP        .DisplayLabel, 'N' ) + Tab +
//                  StrToExcelStr (QryCOINCREIMP_MOR_CP            .DisplayLabel, 'O' ) + Tab +
//                  StrToExcelStr (QryCOINCREIMP_MOR_FN            .DisplayLabel, 'P' ) + Tab +
//                  StrToExcelStr (QryCOINCREIMP_MOR_IN            .DisplayLabel, 'Q' ) + Tab +
//                  StrToExcelStr (QryCOINCREIMP_MOR_CN            .DisplayLabel, 'R' ) + Tab +
//                  StrToExcelStr (QryCOINCREIMP_RESP_TOT          .DisplayLabel, 'S' ) + Tab +
//                  StrToExcelStr (QryCOINCREPCT_CUB_CREDITO       .DisplayLabel, 'T' ) + Tab +
                  StrToExcelStr (QryCOINCREIMP_AUTORIZADO        .DisplayLabel, 'L' ) + Tab +
//                  StrToExcelStr (QryCOINCREIMP_AMORTIZA          .DisplayLabel, 'V' ) + Tab +
                  StrToExcelStr (QryCOINCREIMP_INT_X_COB         .DisplayLabel, 'M' ) + Tab +
                  StrToExcelStr (QryCOINCREPCT_GTIA_FND          .DisplayLabel, 'N' ) + Tab +
//                  StrToExcelStr (QryCOINCREIMP_CAPITALIZA        .DisplayLabel, 'Y' ) + Tab +
//easa mar2010
//                  StrToExcelStr (QryCOINCREIMP_CUBIERTO          .DisplayLabel, 'Z' ) + Tab +
//                  StrToExcelStr (QryCOINCREIMP_EXPUESTO          .DisplayLabel, 'AA') + Tab +
                  StrToExcelStr (QryCOINCREIMP_RESERVA            .DisplayLabel, 'O' ) + Tab +
//                  StrToExcelStr (QryCOINCREIMP_RESERVA_EXP       .DisplayLabel, 'AA') + Tab +

                  StrToExcelStr (QryCOINCREPCT_GARANTIZA         .DisplayLabel, 'P' ) + Tab +
                  StrToExcelStr (QryCOINCREIMP_GARANTIA          .DisplayLabel, 'Q' ) + Tab +
//                  StrToExcelStr (QryCOINCREIMP_SPM_CAP_VIG       .DisplayLabel, 'AC') + Tab +
//                  StrToExcelStr (QryCOINCREIMP_SPM_CAP_IMP       .DisplayLabel, 'AD') + Tab +
//                  StrToExcelStr (QryCOINCREIMP_SPM_CAP_VDO       .DisplayLabel, 'AE') + Tab +
                  StrToExcelStr (QryCOINCREIMP_COMISION_C        .DisplayLabel, 'R' ) + Tab +
                  StrToExcelStr (QryCOINCRENOM_ACREDITADO        .DisplayLabel, 'S' ) + Tab +
                  StrToExcelStr (QryCOINCREID_ACREDITADO         .DisplayLabel, 'T' ) + Tab +
                  StrToExcelStr (QryCOINCREID_CONTRATO           .DisplayLabel, 'U' ) + Tab +
                  StrToExcelStr (QryCOINCRERFC                   .DisplayLabel, 'V' ) + Tab +
                  StrToExcelStr (QryCOINCRECVE_GRUPO_ECO         .DisplayLabel, 'W' ) + Tab +
                  StrToExcelStr (QryCOINCREDESC_GRUPO_ECO        .DisplayLabel, 'X') + Tab +
                  StrToExcelStr (QryCOINCRECVE_CAT_MINIMO        .DisplayLabel, 'Y' ) + Tab +
                  StrToExcelStr (QryCOINCRECVE_SENICREB          .DisplayLabel, 'Z' ) + Tab +
                  StrToExcelStr (QryCOINCREDESC_SENICREB         .DisplayLabel, 'AA') + Tab +
                  StrToExcelStr (QryCOINCRECVE_LOCAL_CNBV        .DisplayLabel, 'AB') + Tab +
                  StrToExcelStr (QryCOINCREDESC_LOCAL_CNBV       .DisplayLabel, 'AC') + Tab +
                  StrToExcelStr (QryCOINCRECVE_TAM_ACRED         .DisplayLabel, 'AD') + Tab +
                  StrToExcelStr (QryCOINCREDESC_TAM_ACRED        .DisplayLabel, 'AE') + Tab +
                  StrToExcelStr (QryCOINCRECVE_CLAS_CONTAB       .DisplayLabel, 'AF') + Tab +
                  StrToExcelStr (QryCOINCRECVE_DESTINO           .DisplayLabel, 'AG') + Tab +
                  StrToExcelStr (QryCOINCREDESC_DESTINO          .DisplayLabel, 'AH') + Tab +
                  StrToExcelStr (QryCOINCREF_DISPOSICION         .DisplayLabel, 'AI') + Tab +
                  StrToExcelStr (QryCOINCREF_VENCIMIENTO         .DisplayLabel, 'AJ') + Tab +
                  StrToExcelStr (QryCOINCREF_AMORTIZACION        .DisplayLabel, 'AK') + Tab +
                  StrToExcelStr (QryCOINCRECVE_AMORTIZACION      .DisplayLabel, 'AL') + Tab +
                  StrToExcelStr (QryCOINCREDESC_AMORTIZACION     .DisplayLabel, 'AM') + Tab +
                  StrToExcelStr (QryCOINCRECVE_PAG_INTERES       .DisplayLabel, 'AN') + Tab +
                  StrToExcelStr (QryCOINCREDESC_PAG_INTERES      .DisplayLabel, 'AO') + Tab +

{AGF 2011.11.17 Información de intereses}
                  StrToExcelStr (QryCOINCREDesc_Calculo          .DisplayLabel, 'AP') + Tab +
                  StrToExcelStr (QryCOINCREF_Inicio_Int          .DisplayLabel, 'AQ') + Tab +
                  StrToExcelStr (QryCOINCREF_Vencimiento_Int     .DisplayLabel, 'AR') + Tab +
{/AGF 2011.11.17}

                  StrToExcelStr (QryCOINCRECVE_MONEDA            .DisplayLabel, 'AS') + Tab +
                  StrToExcelStr (QryCOINCREDESC_MONEDA           .DisplayLabel, 'AT') + Tab +

{AGF 2011.11.17 Se agrega el tipo de cambio para efectos de valorización}
                  StrToExcelStr (QryCOINCRETC                    .DisplayLabel, 'AU') + Tab +
{/AGF 2011.11.17}

//                  StrToExcelStr (QryCOINCRECVE_FUENTE_PAGO       .DisplayLabel, 'BJ') + Tab +
                  StrToExcelStr (QryCOINCREDESC_FUENTE_PAGO      .DisplayLabel, 'AV') + Tab +
                  StrToExcelStr (QryCOINCRETASA_BASE             .DisplayLabel, 'AW') + Tab +
                  StrToExcelStr (QryCOINCRECVE_TASA_REFER        .DisplayLabel, 'AX') + Tab +
                  StrToExcelStr (QryCOINCRESOBRETASA             .DisplayLabel, 'AY') + Tab +
                  StrToExcelStr (QryCOINCRENUM_FREC_REV_TAS      .DisplayLabel, 'AZ') + Tab +
                  StrToExcelStr (QryCOINCRECVE_SIT_CREDITO       .DisplayLabel, 'BA') + Tab +
                  StrToExcelStr (QryCOINCRECVE_REESTRUCTURA      .DisplayLabel, 'BB') + Tab +

//easa mar2010
//                  StrToExcelStr (QryCOINCRECVE_CAL_DEU           .DisplayLabel, 'BO') + Tab +
//                  StrToExcelStr (QryCOINCRECVE_CAL_OPE_CUB       .DisplayLabel, 'BP') + Tab +
//                  StrToExcelStr (QryCOINCRECVE_CAL_OPE_EXP       .DisplayLabel, 'BQ') + Tab +
                  StrToExcelStr (QryCOINCRECALIF_DEUDOR          .DisplayLabel, 'BC') + Tab +
//                  StrToExcelStr (QryCOINCRECVE_CALIFIC_CUB       .DisplayLabel, 'BS') + Tab +
//                  StrToExcelStr (QryCOINCRECVE_CALIFIC_EXP       .DisplayLabel, 'BT') + Tab +
                  StrToExcelStr (QryCOINCRECVE_CALIFIC_CNBV      .DisplayLabel, 'BD') + Tab +

                  StrToExcelStr (QryCOINCRECVE_TIPO_GTIA         .DisplayLabel, 'BE') + Tab +
                  StrToExcelStr (QryCOINCREF_VAL_GARANTIA        .DisplayLabel, 'BF') + Tab +
                  StrToExcelStr (QryCOINCRENUM_PRELACION         .DisplayLabel, 'BG') + Tab +
                  StrToExcelStr (QryCOINCREB_ACRED_RELAC         .DisplayLabel, 'BH') + Tab +
                  StrToExcelStr (QryCOINCRECVE_ACRED_RELAC       .DisplayLabel, 'BI') + Tab +
                  StrToExcelStr (QryCOINCREID_PROM_ADM           .DisplayLabel, 'BJ') + Tab +
                  StrToExcelStr (QryCOINCRENOM_PROM_ADM          .DisplayLabel, 'BK') + Tab +
                  StrToExcelStr (QryCOINCREID_PROM_ASOC          .DisplayLabel, 'BL') + Tab +
                  StrToExcelStr (QryCOINCRENOM_PROM_ASOC         .DisplayLabel, 'BM') + Tab +
//                  StrToExcelStr (QryCOINCRENUM_PERIODO_G         .DisplayLabel, 'CC') + Tab +
                  StrToExcelStr (QryCOINCRECVE_LIQUIDACION       .DisplayLabel, 'BN') + Tab +
                  StrToExcelStr (QryCOINCRECVE_SECTOR_ECO        .DisplayLabel, 'BO') + Tab +
                  StrToExcelStr (QryCOINCREDESC_SECTOR_ECO       .DisplayLabel, 'BP') + Tab +
                  StrToExcelStr (QryCOINCRECVE_ORIGEN_INFO       .DisplayLabel, 'BQ') + Tab +
                  StrToExcelStr (QryCOINCRECVE_MER_OBJETIVO      .DisplayLabel, 'BR') + Tab +
                  StrToExcelStr (QryCOINCREDESC_MERC_OBJETI      .DisplayLabel, 'BS') + Tab +
                  StrToExcelStr (QryCOINCRECVE_MERC_OB_GPO       .DisplayLabel, 'BT') + Tab +
                  StrToExcelStr (QryCOINCREDESC_MER_OB_GPO       .DisplayLabel, 'BU') + Tab +
                  StrToExcelStr (QryCOINCRECVE_ORIGEN_REC        .DisplayLabel, 'BV') + Tab +
                  StrToExcelStr (QryCOINCREDESC_ORIGEN_REC       .DisplayLabel, 'BW') + Tab +
                  StrToExcelStr (QryCOINCRECVE_POBLAC_EDO        .DisplayLabel, 'BX') + Tab +
                  StrToExcelStr (QryCOINCREDESC_POBLAC_EDO       .DisplayLabel, 'BY') + Tab +
                  StrToExcelStr (QryCOINCRECVE_PRODUCTO_CRE      .DisplayLabel, 'BZ') + Tab +
                  StrToExcelStr (QryCOINCREDESC_L_PRODUCTO       .DisplayLabel, 'CA') + Tab +
                  StrToExcelStr (QryCOINCRECVE_SECTOR            .DisplayLabel, 'CB') + Tab +
                  StrToExcelStr (QryCOINCRECTA_K_VIG             .DisplayLabel, 'CC') + Tab +
                  StrToExcelStr (QryCOINCRECTA_K_IMP             .DisplayLabel, 'CD') + Tab +
                  StrToExcelStr (QryCOINCRECTA_K_VEN_EX          .DisplayLabel, 'CE') + Tab +
                  StrToExcelStr (QryCOINCRECTA_K_VEN_NE          .DisplayLabel, 'CF') + Tab +
                  StrToExcelStr (QryCOINCRECTA_I_VIG             .DisplayLabel, 'CG') + Tab +
                  StrToExcelStr (QryCOINCRECTA_I_IMP             .DisplayLabel, 'CH') + Tab +
                  StrToExcelStr (QryCOINCRECTA_I_VEN_EX          .DisplayLabel, 'CI') + Tab +
                  StrToExcelStr (QryCOINCRECTA_I_COB_XANT        .DisplayLabel, 'CJ') + Tab +

//ROIM748  12/Jun   Se integra campos de consulta de Riesgos
                  StrToExcelStr (QryCOINCREROE_BRUTA_1           .DisplayLabel, 'CK') + Tab +
                  StrToExcelStr (QryCOINCREROE_NETA_1            .DisplayLabel, 'CL') + Tab +
{RUCJ4248}
                  StrToExcelStr (QryCOINCRERAM_MEZCLA            .DisplayLabel, 'CM') + Tab +
                  StrToExcelStr (QryCOINCRERAM_FTP               .DisplayLabel, 'CN') + Tab +
{//RUCJ4248}
//                  StrToExcelStr (QryCOINCREPCT_REQ_CAP_MER_1     .DisplayLabel, 'DG') + Tab +
//                  StrToExcelStr (QryCOINCREPCT_REQ_CAP_CRE_1     .DisplayLabel, 'DH') + Tab +
//                  StrToExcelStr (QryCOINCREPCT_CAPITALIZ_1       .DisplayLabel, 'DI') + Tab +
////ROIM748
{AGF 2011.12.07 Se agrega la información de las calificadoras}
                  StrToExcelStr (QryCOINCREEstructurado          .DisplayLabel, 'CO') + Tab +
{RUCJ4248}
                  StrToExcelStr (QryCOINCREINS_FEDERAL           .DisplayLabel, 'CP') + Tab +
                  StrToExcelStr (QryCOINCREF_INS_FEDERAL         .DisplayLabel, 'CQ') + Tab +
                  StrToExcelStr (QryCOINCREID_AVAL_GOB           .DisplayLabel, 'CR') + Tab +
                  StrToExcelStr (QryCOINCRENUM_CALIF             .DisplayLabel, 'CS') + Tab +
{//RUCJ4248}
                  StrToExcelStr (QryCOINCRECal_FITCH             .DisplayLabel, 'CT') + Tab +
                  StrToExcelStr (QryCOINCRECal_MOODYS            .DisplayLabel, 'CU') + Tab +
                  StrToExcelStr (QryCOINCRECal_HR                .DisplayLabel, 'CV') + Tab +
                  StrToExcelStr (QryCOINCRECal_STANDARD          .DisplayLabel, 'CW') + Tab +
{RUCJ4248}
                  StrToExcelStr (QryCOINCRECAL_VERUM             .DisplayLabel, 'CX') + Tab +
//                  StrToExcelStr (QryCOINCREPND                   .DisplayLabel, 'DT') + Tab +
{//RUCJ4248}

{/AGF 2011.12.07 Se agrega la información de las calificadoras}
////AGF 06.SEP.2011 Se incluye la información de cartas de crédito
                  StrToExcelStr (QryCOINCREIMP_CARTA_CREDITO     .DisplayLabel, 'CY') + Tab +
////AGF 06.SEP.2011 Se incluye la información de cartas de crédito
////AGF 05.OCT.2011 Se incluyen los pagos de cartas de crédito
                  StrToExcelStr (QryCOINCREPct_Adicional         .DisplayLabel, 'CZ') + Tab +
                  StrToExcelStr (QryCOINCREImp_Total_CCI         .DisplayLabel, 'DA') + Tab +
                  StrToExcelStr (QryCOINCREPagos_Mes             .DisplayLabel, 'DB') + Tab +
                  StrToExcelStr (QryCOINCRESaldo_Actual_CCI      .DisplayLabel, 'DC') + Tab +
////AGF 05.OCT.2011 Se incluyen los pagos de cartas de crédito
////AGF 05.NOV.2015 Se incluye la información de PI, SP, Revolvente, Revocable y Fecha de Vencimiento del contrato
                  StrToExcelStr (QryCOINCREP_INCUMPL             .DisplayLabel, 'DD') + Tab +
                  StrToExcelStr (QryCOINCRES_PERDIDA             .DisplayLabel, 'DE') + Tab +
                  StrToExcelStr (QryCOINCREB_REVOLVENTE          .DisplayLabel, 'DF') + Tab +
                  StrToExcelStr (QryCOINCREB_REVOCABLE           .DisplayLabel, 'DG') + Tab +
                  StrToExcelStr (QryCOINCREF_VENCIMIENTO_CONTRATO.DisplayLabel, 'DH') + Tab +
////AGF 05.NOV.2015 Se incluye la información de PI, SP, Revolvente, Revocable y Fecha de Vencimiento del contrato

////AGF 26.ENE.2016 Se incluyen nuevas variables solicitadas por el área de riesgos
                  StrToExcelStr (QryCOINCREDESC_CAT_MINIMO       .DisplayLabel, 'DI');
////AGF 26.ENE.2016 Se incluyen nuevas variables solicitadas por el área de riesgos
       List.Add (Renglon);


       //Para no mover el frid
       BookMark := QryCOINCRE.GetBookmark;
       //----------------------------------
       // INICIA EL LLENADO DE DATOS HACIA
       // EL ARCHIVO DE EXCEL
       vlRow := 2;
       QryCOINCRE.Last; ProgressBar.Max := QryCOINCRE.RecordCount; QryCOINCRE.First;
       vgExcelApp.Range ['C2'].Select;
       vgExcelApp.ActiveWindow.FreezePanes := True;


       While Not QryCOINCRE.Eof Do
       Begin
           Renglon := FormatDateTime ('dd/mm/yyyy', dtpF_CIERRE.DateTime) + Tab; // 'A'


////AGF 06.SEP.2011 Se incluye la información de cartas de crédito
           if not QryCOINCRE.FieldByName('ID_CREDITO').IsNull then
             Renglon := Renglon + IntToExcelStr (QryCOINCRE.FieldByName('ID_CREDITO')  .AsInteger, 'B') + Tab
           else
             Renglon := Renglon + IntToExcelStr (QryCOINCRE.FieldByName('ID_CREDITO_1').AsInteger, 'B') + Tab;

////AGF 06.SEP.2011 Se incluye la información de cartas de crédito
           Renglon := Renglon +
                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_CAP_VIG')     .AsFloat,    'C' ) + Tab +
                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_CAP_IMP')     .AsFloat,    'D' ) + Tab +
                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_CAP_VDO_EX')  .AsFloat,    'E' ) + Tab +
                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_CAP_VDO_NE')  .AsFloat,    'F' ) + Tab +
                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_INT_VIG')     .AsFloat,    'G' ) + Tab +
                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_INT_IMP')     .AsFloat,    'H' ) + Tab +
                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_INT_VDO_EX')  .AsFloat,    'I' ) + Tab +
                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_INT_VDO_NE')  .AsFloat,    'J' ) + Tab +
                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_CTAS_ORD')    .AsFloat,    'K' ) + Tab +
//                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_CONCEP_COB')  .AsFloat,    'L' ) + Tab +
//                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_CONCEP_VIG')  .AsFloat,    'M' ) + Tab +
//                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_CONCEP_IMP')  .AsFloat,    'N' ) + Tab +
//                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_MOR_CP')      .AsFloat,    'O' ) + Tab +
//                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_MOR_FN')      .AsFloat,    'P' ) + Tab +
//                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_MOR_IN')      .AsFloat,    'Q' ) + Tab +
//                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_MOR_CN')      .AsFloat,    'R' ) + Tab +
//                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_RESP_TOT')    .AsFloat,    'S' ) + Tab +
//                      FloatToExcelStr (QryCOINCRE.FieldByName('PCT_CUB_CREDITO') .AsFloat,    'T' ) + Tab +
                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_AUTORIZADO')  .AsFloat,    'L') + Tab +
//                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_AMORTIZA')    .AsFloat,    'V' ) + Tab +
                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_INT_X_COB')   .AsFloat,    'M' ) + Tab +
                      FloatToExcelStr (QryCOINCRE.FieldByName('PCT_GTIA_FND')    .AsFloat,    'N' ) + Tab +
//                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_CAPITALIZA')  .AsFloat,    'Y' ) + Tab +
//EASA MAR2010 Se integra campos de consulta de Riesgos
//                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_PREVEN_CUB')  .AsFloat,    'Z' ) + Tab +
//                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_PREVEN_EXP')  .AsFloat,    'AA') + Tab +
//                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_RESERVA_CUB') .AsFloat,    'Z' ) + Tab +
//                    FloatToExcelStr (QryCOINCRE.FieldByName('IMP_RESERVA_EXP') .AsFloat,    'AA') + Tab +
                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_RESERVA')     .AsFloat,    'O' ) + Tab +

                      FloatToExcelStr (QryCOINCRE.FieldByName('PCT_GARANTIZA')   .AsFloat,    'P' ) + Tab +
                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_GARANTIA')    .AsFloat,    'Q' ) + Tab +
//                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_SPM_CAP_VIG') .AsFloat,    'AC') + Tab +
//                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_SPM_CAP_IMP') .AsFloat,    'AD') + Tab +
//                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_SPM_CAP_VDO') .AsFloat,    'AE') + Tab +
                      FloatToExcelStr (QryCOINCRE.FieldByName('IMP_COMISION_C')  .AsFloat,    'R') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('NOM_ACREDITADO')  .AsString,   'S' ) + Tab +
                      IntToExcelStr   (QryCOINCRE.FieldByName('ID_ACREDITADO')   .AsInteger,  'T' ) + Tab +
                      IntToExcelStr   (QryCOINCRE.FieldByName('ID_CONTRATO')     .AsInteger,  'U' ) + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('RFC')             .AsString,   'V' ) + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_GRUPO_ECO')   .AsString,   'W' ) + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('DESC_GRUPO_ECO')  .AsString,   'X') + Tab +
                      StrToExcelStr   (''''+QryCOINCRE.FieldByName('CVE_CAT_MINIMO').AsString, 'Y' ) + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_SENICREB')    .AsString,   'Z') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('DESC_SENICREB')   .AsString,   'AA') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_LOCAL_CNBV')  .AsString,   'AB') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('DESC_LOCAL_CNBV') .AsString,   'AC') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_TAM_ACRED')   .AsString,   'AD') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('DESC_TAM_ACRED')  .AsString,   'AE') + Tab +
                      StrToExcelStr   (''''+QryCOINCRE.FieldByName('CVE_CLAS_CONTAB').AsString, 'AF') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_DESTINO')     .AsString,   'AG') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('DESC_DESTINO')    .AsString,   'AH') + Tab +
                      DateToExcelStr  (QryCOINCRE.FieldByName('F_DISPOSICION')  as TDateTimeField, 'AI') + Tab +
                      DateToExcelStr  (QryCOINCRE.FieldByName('F_VENCIMIENTO')  as TDateTimeField, 'AJ') + Tab +
                      DateToExcelStr  (QryCOINCRE.FieldByName('F_AMORTIZACION') as TDateTimeField, 'AK') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_AMORTIZACION') .AsString,  'AL') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('DESC_AMORTIZACION').AsString,  'AM') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_PAG_INTERES')  .AsString,  'AN') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('DESC_PAG_INTERES') .AsString,  'AO') + Tab +
{AGF 2011.11.17 Información de intereses}
                      StrToExcelStr   (QryCOINCRE.FieldByName('DESC_CALCULO')     .AsString,  'AP') + Tab +
                      DateToExcelStr  (QryCOINCRE.FieldByName('F_INICIO_INT')      as TDateTimeField, 'AQ') + Tab +
                      DateToExcelStr  (QryCOINCRE.FieldByName('F_VENCIMIENTO_INT') as TDateTimeField, 'AR') + Tab +
{/AGF 2011.11.17}
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_MONEDA')       .AsString,  'AS') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('DESC_MONEDA')      .AsString,  'AT') + Tab +

{AGF 2011.11.17 Se agrega el tipo de cambio para efectos de valorización}
                      StrToExcelStr   (QryCOINCRE.FieldByName('TC')               .AsString,  'AU') + Tab +
{/AGF 2011.11.17}

//                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_FUENTE_PAGO')  .AsString,  'BJ') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('DESC_FUENTE_PAGO') .AsString,  'AV') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('TASA_BASE')        .AsString,  'AW') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_TASA_REFER')   .AsString,  'AX') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('SOBRETASA')        .AsString,  'AY') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('NUM_FREC_REV_TAS') .AsString,  'AZ') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_SIT_CREDITO')  .AsString,  'BA') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_REESTRUCTURA') .AsString,  'BB') + Tab +
//EASA MAR2010 Se integra campos de consulta de Riesgos
//                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_CAL_DEU')      .AsString,  'BO') + Tab +
//                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_CAL_OPE_CUB')  .AsString,  'BP') + Tab +
//                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_CAL_OPE_EXP')  .AsString,  'BQ') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CALIF_DEUDOR')     .AsString,  'BC') + Tab +
//                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_CALIFIC_CUB')  .AsString,  'BS') + Tab +
//                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_CALIFIC_EXP')  .AsString,  'BT') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_CALIFIC_CNBV') .AsString,  'BD') + Tab +

                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_TIPO_GTIA')    .AsString,  'BE') + Tab +
                      DateToExcelStr  (QryCOINCRE.FieldByName('F_VAL_GARANTIA') as TDateTimeField, 'BF') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('NUM_PRELACION')    .AsString,  'BG') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('B_ACRED_RELAC')    .AsString,  'BH') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_ACRED_RELAC')  .AsString,  'BI') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('ID_PROM_ADM')      .AsString,  'BJ') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('NOM_PROM_ADM')     .AsString,  'BK') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('ID_PROM_ASOC')     .AsString,  'BL') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('NOM_PROM_ASOC')    .AsString,  'BM') + Tab +
//                      StrToExcelStr   (QryCOINCRE.FieldByName('NUM_PERIODO_G')    .AsString,  'CC') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_LIQUIDACION')  .AsString,  'BN') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_SECTOR_ECO')   .AsString,  'BO') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('DESC_SECTOR_ECO')  .AsString,  'BP') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_ORIGEN_INFO')  .AsString,  'BQ') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_MER_OBJETIVO') .AsString,  'BR') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('DESC_MERC_OBJETI') .AsString,  'BS') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_MERC_OB_GPO')  .AsString,  'BT') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('DESC_MER_OB_GPO')  .AsString,  'BU') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_ORIGEN_REC')   .AsString,  'BV') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('DESC_ORIGEN_REC')  .AsString,  'BW') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_POBLAC_EDO')   .AsString,  'BX') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('DESC_POBLAC_EDO')  .AsString,  'BY') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_PRODUCTO_CRE') .AsString,  'BZ') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('DESC_L_PRODUCTO')  .AsString,  'CA') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CVE_SECTOR')       .AsString,  'CB') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CTA_K_VIG')        .AsString,  'CC') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CTA_K_IMP')        .AsString,  'CD') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CTA_K_VEN_EX')     .AsString,  'CE') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CTA_K_VEN_NE')     .AsString,  'CF') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CTA_I_VIG')        .AsString,  'CG') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CTA_I_IMP')        .AsString,  'CH') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CTA_I_VEN_EX')     .AsString,  'CI') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CTA_I_COB_XANT')   .AsString,  'CJ') + Tab +

//ROIM748  12/Jun   Se integra campos de consulta de Riesgos
                      StrToExcelStr   (QryCOINCRE.FieldByName('ROE_BRUTA_1')      .AsString,  'CK') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('ROE_NETA_1')       .AsString,  'CL') + Tab +
{RUCJ4248}
                      StrToExcelStr   (QryCOINCRE.FieldByName('RAM_MEZCLA')       .AsString,  'CM') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('RAM_FTP')          .AsString,  'CN') + Tab +
{RUCJ4248}
//                      StrToExcelStr   (QryCOINCRE.FieldByName('PCT_REQ_CAP_MER_1').AsString,  'DG') + Tab +
//                      StrToExcelStr   (QryCOINCRE.FieldByName('PCT_REQ_CAP_CRE_1').AsString,  'DH') + Tab +
//                      StrToExcelStr   (QryCOINCRE.FieldByName('PCT_CAPITALIZ_1')  .AsString,  'DI') + Tab +
////ROIM748
{AGF 2011.12.07 Se agrega la información de las calificadoras}
                      StrToExcelStr   (QryCOINCRE.FieldByName('ESTRUCTURADO')     .AsString,  'CO') + Tab +
{RUCJ4248}
                      StrToExcelStr   (QryCOINCRE.FieldByName('INS_FEDERAL')      .AsString,  'CP') + Tab +
                      DateToExcelStr  (QryCOINCRE.FieldByName('F_INS_FEDERAL') as TDateTimeField, 'CQ') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('ID_AVAL_GOB')      .AsString,  'CR') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('NUM_CALIF')        .AsString,  'CS') + Tab +
{//RUCJ4248}

                      StrToExcelStr   (QryCOINCRE.FieldByName('CAL_FITCH')        .AsString,  'CT') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CAL_MOODYS')       .AsString,  'CU') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CAL_HR')           .AsString,  'CV') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('CAL_STANDARD')     .AsString,  'CW') + Tab +
{RUCJ4248}
                      StrToExcelStr   (QryCOINCRE.FieldByName('CAL_VERUM')        .AsString,  'CX') + Tab +
//                      StrToExcelStr   (QryCOINCRE.FieldByName('PND')              .AsString,  'DT') + Tab +
{//RUCJ4248}


{/AGF 2011.12.07 Se agrega la información de las calificadoras}
////AGF 06.SEP.2011 Se incluye la información de cartas de crédito
//           if QryCOINCRE.FieldByName('ID_CREDITO').IsNull then
//           begin
                      StrToExcelStr   (QryCOINCRE.FieldByName('IMP_CARTA_CREDITO').AsString,  'CY') + Tab +
////AGF 06.SEP.2011 Se incluye la información de cartas de crédito
                      StrToExcelStr   (QryCOINCRE.FieldByName('PCT_ADICIONAL')    .AsString,  'CZ') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('IMP_TOTAL_CCI')    .AsString,  'DA') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('PAGOS_MES')        .AsString,  'DB') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('SALDO_ACTUAL_CCI') .AsString,  'DC') + Tab +
////AGF 05.OCT.2011 Se incluyen los pagos de cartas de crédito
////AGF 05.OCT.2011 Se incluyen los pagos de cartas de crédito
////AGF 05.NOV.2015 Se incluye la información de PI, SP, Revolvente, Revocable y Fecha de Vencimiento del contrato
                      StrToExcelStr   (QryCOINCRE.FieldByName('P_INCUMPL')        .AsString,  'DD') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('S_PERDIDA')        .AsString,  'DE') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('B_REVOLVENTE')     .AsString,  'DF') + Tab +
                      StrToExcelStr   (QryCOINCRE.FieldByName('B_REVOCABLE')      .AsString,  'DG') + Tab +
                      DateToExcelStr  (QryCOINCRE.FieldByName('F_VENCIMIENTO_CONTRATO') as TDateTimeField, 'DH') + Tab +
////AGF 05.NOV.2015 Se incluye la información de PI, SP, Revolvente, Revocable y Fecha de Vencimiento del contrato

////AGF 26.ENE.2016 Se incluyen nuevas variables solicitadas por el área de riesgos
                      StrToExcelStr   (QryCOINCRE.FieldByName('DESC_CAT_MINIMO')  .AsString,  'DI');
////AGF 26.ENE.2016 Se incluyen nuevas variables solicitadas por el área de riesgos

//           end;
////AGF 06.SEP.2011 Se incluye la información de cartas de crédito


            Application.ProcessMessages;
            ProgressBar.Position := vlRow;
            Inc(vlRow);
            QryCOINCRE.Next;
            List.Add (Renglon);
       End;

       ///AGF 06.ENE.2016 Optimización de la generación del reporte a Excel
       //Envía el contenido de la lista al portapapeles
       Clipboard.AsText := List.Text;
       vgExcelApp.Range ['A1'].Select;
       vgExcelApp.Workbooks[1].WorkSheets[1].Paste;

       //-----------------------------------------------
       //         INICIA FORMATOS DE CELDAS
       //-----------------------------------------------
       //

       // ShowMessage(Format('Excel Version %s: ', [vgExcelApp.Version]));

       // Modifica el tamaño de la fuente
       vlColumnRange := vgExcelApp.Workbooks[1].WorkSheets[1].Columns;
       For vlCol := 1 To ColumnXlS('DI') {117} Do
       Begin
            vlColumnRange.Columns[vlCol].Font.Size := 8;
       End;

       // Colocación de colores de banda de titulos
//       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['A1:DC1']; EASA 23.FEB.2010
       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['A1:DI1'];
       vlRange.Font.FontStyle := 'Bold';
       vlRange.Font.Color := clWhite;
       vlRange.Columns.Interior.ColorIndex := 1; // Negro
       vlRange.WrapText := True;

       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['C1:K'+IntToStr(vlRow-1)];
       vlRange.NumberFormat := '#,##0.00';

       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['K1:L'+IntToStr(vlRow-1)];
       vlRange.NumberFormat := '#,##0.00';

       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['O1:P'+IntToStr(vlRow-1)];
       vlRange.NumberFormat := '#,##0.00';

       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['Q1:R'+IntToStr(vlRow-1)];
       vlRange.NumberFormat := '#,##0.00';

       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['CG1:CM'+IntToStr(vlRow-1)];
       vlRange.NumberFormat := '#,##0.0000';

       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['CN:DB'+IntToStr(vlRow-1)];
       vlRange.NumberFormat := '#,##0.00';

       For vlCol := 1 To ColumnXlS('DI') {117} Do
       Begin
            vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range[IntToColumnXlS(vlCol)+'1:'+IntToColumnXlS(vlCol)+'1'];
            vlRange.WrapText := True;
       End;

    VLSalida := True;


    Finally
       HabilitaControles(True);
       vgExcelApp.ActiveWorkBook.SaveAs(peFileName);
       if CloseExcelFile(vgExcelApp) then
          ShowMessage('Archivo Generado')
       else
          ShowMessage('Archio no generado');
       //end if
    End;

    GeneraArchivoExcel := VLSalida;
end;

procedure TWCrCoInRi.edFileNameXLSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 Then btnGeneraArchivoClick(Self);
end;

procedure TWCrCoInRi.FormCreate(Sender: TObject);
begin
  DecimalSeparator  := '.';
  ThousandSeparator := ',';
end;


function TWCrCoInRi.fnGeneraR08;
var
  PPResultado : String;
  bResultado  : Boolean;
  vlstrQry    : string;
begin
  bResultado := true;

  Try
    With spGenera08 Do
    Begin

       Params.Clear;
       Params.CreateParam( ftFloat,  'peID_ACREDITADO',   ptInput);
       Params.CreateParam( ftFloat,  'peF_CONSULTA',      ptInput);
       Params.CreateParam( ftFloat,  'psRESULTADO',     ptOutput);
       Params.CreateParam( ftString, 'psTX_RESULTADO',  ptOutput);

       Prepare;
       ParamByName('peID_ACREDITADO').AsString  := trim(edAcreditado.Text);
       ParamByName('peF_CONSULTA').AsDate       := dtpF_CIERRE.Date;
       ExecProc;
       ///ShowMessage(ParamByName('psRESULTADO').AsString);
       If (ParamByName('psRESULTADO').AsInteger <> 0) then
       Begin
          PPResultado := 'Error No ' + ParamByName('psTX_RESULTADO').AsString;
          MessageDlg('' + #13 + #10 + PPResultado , mtError, [mbOK], 0);
          bResultado := false;
       End;
       //end if;
    end;
  Finally

  End;


    vlstrQry := ' select ' + cocRLF +
      ' ID_CREDITO, F_CIERRE, FH_ALTA, ID_REG_VIGENTE, ID_MERC_OBJ_DET, IMP_CAP_VIG, IMP_CAP_IMP, IMP_CAP_VDO_EX, ' + cocRLF +
      ' IMP_CAP_VDO_NE, IMP_INT_VIG, IMP_INT_IMP, IMP_INT_VDO_EX, IMP_INT_VDO_NE, IMP_CTAS_ORD, ' + cocRLF +
      ' IMP_AUTORIZADO, IMP_INT_X_COB, PCT_GTIA_FND, ' + cocRLF +
      ' IMP_PREVEN_CUB, IMP_PREVEN_EXP,	PCT_GARANTIZA, IMP_GARANTIA, ' + cocRLF +
      ' IMP_COMISION_C, NOM_ACREDITADO, ID_ACREDITADO, ID_CONTRATO, RFC,	CVE_GRUPO_ECO, ' + cocRLF +
      ' DESC_GRUPO_ECO, CVE_CAT_MINIMO, CVE_SENICREB, DESC_SENICREB, CVE_LOCAL_CNBV, DESC_LOCAL_CNBV, ' + cocRLF +
      ' CVE_TAM_ACRED, DESC_TAM_ACRED, CVE_CLAS_CONTAB, CVE_DESTINO, DESC_DESTINO, F_DISPOSICION, ' + cocRLF +
      ' F_VENCIMIENTO, F_AMORTIZACION, CVE_AMORTIZACION, DESC_AMORTIZACION, CVE_PAG_INTERES, DESC_PAG_INTERES, ' + cocRLF +
      ' CVE_MONEDA,	DESC_MONEDA, DESC_FUENTE_PAGO, TASA_BASE, CVE_TASA_REFER, SOBRETASA, ' + cocRLF +
      ' NUM_FREC_REV_TAS, CVE_SIT_CREDITO, CVE_REESTRUCTURA, CVE_CAL_DEU, CVE_CAL_OPE_CUB, CVE_CAL_OPE_EXP, ' + cocRLF +
      ' CVE_TIPO_GTIA, F_VAL_GARANTIA, NUM_PRELACION, B_ACRED_RELAC, CVE_ACRED_RELAC, ID_PROM_ADM, NOM_PROM_ADM, ' + cocRLF +
      ' ID_PROM_ASOC,	NOM_PROM_ASOC, CVE_LIQUIDACION, CVE_SECTOR_ECO, DESC_SECTOR_ECO, ' + cocRLF +
      ' CVE_ORIGEN_INFO, CVE_MER_OBJETIVO, DESC_MERC_OBJETI, CVE_MERC_OB_GPO, DESC_MER_OB_GPO, CVE_ORIGEN_REC, ' + cocRLF +
      ' DESC_ORIGEN_REC, CVE_POBLAC_EDO, DESC_POBLAC_EDO, CVE_PRODUCTO_CRE, DESC_L_PRODUCTO, CVE_SECTOR, CTA_K_VIG, ' + cocRLF +
      ' CTA_K_IMP, CTA_K_VEN_EX, CTA_K_VEN_NE, CTA_I_VIG, CTA_I_IMP, CTA_I_VEN_EX, CTA_I_COB_XANT, ROE_BRUTA_1, ' + cocRLF +
      ' ROE_NETA_1, RAM_MEZCLA, RAM_FTP, CALIF_DEUDOR, IMP_EXPUESTO, ' + cocRLF +
      ' IMP_CUBIERTO, CVE_CALIFIC_CNBV, IMP_RESERVA, IMP_CARTA_CREDITO, ' + cocRLF +
      ' PCT_ADICIONAL, IMP_TOTAL_CCI, PAGOS_MES, SALDO_ACTUAL_CCI, CVE_CALCULO, DESC_CALCULO, F_INICIO_INT, ' + cocRLF +
      ' F_VENCIMIENTO_INT, TC, ESTRUCTURADO, INS_FEDERAL, REG_SECRETARIA, F_INS_FEDERAL, ID_AVAL_GOB, CAL_FITCH, ' + cocRLF +
      ' CAL_MOODYS, CAL_HR, CAL_STANDARD, CAL_VERUM, NUM_CALIF, P_INCUMPL, S_PERDIDA, B_REVOLVENTE, B_REVOCABLE, F_VENCIMIENTO_CONTRATO, ' + cocRLF +
      ' DESC_CAT_MINIMO' + coCRLF +
      ' from RP_TMP_R08 where 2 = 2 ';

  ///if QryCOINCRE.Active then
    QryCOINCRE.close;

  QryCOINCRE.SQL.Clear;
  QryCOINCRE.SQL.Add(vlstrQry);
  QryCOINCRE.SQL.SaveToFile('c:\ConsRapida.txt');
  QryCOINCRE.Open;

  Result := bResultado;

end;

function TWCrCoInRi.ArmaQuery(peFecha: TDateTime; pebTest: Boolean): String;
    function  ValidaInfoSICC(PPFecha: String) : Boolean;
    var vlSQL : String;
        vlSIT : String;
    begin
      Result := False;
      vlSQL := ' SELECT NVL(VOBO.CVE_SITUACION,''NP'') AS CVE_SITUACION, REFER.FECHA  FROM '+cocRLF +
               ' (SELECT CVE_SITUACION, ANIO_MES '+cocRLF +
               '  FROM   ADMIPROD.CR_SICC_VOBO_PER VOBO '+cocRLF +
               '  WHERE  ANIO_MES = ' + PPFecha + ' AND CVE_VOBO = 1 AND CVE_SITUACION = ''AC'') VOBO, '+cocRLF +
               ' (SELECT ' + PPFecha + ' AS FECHA '+cocRLF +
               '  FROM DUAL '+cocRLF +
               '  WHERE ' + PPFecha + ' = ' + PPFecha + ') REFER '+cocRLF +
               ' WHERE VOBO.ANIO_MES (+)= REFER.FECHA '+cocRLF;


      GetSQLStr(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'CVE_SITUACION', vlSIT, True);
      if vlSIT <> 'AC'Then
         ShowMessage('Importante: La información que se obtiene del SICC (calificación) aun no está autorizada por el área de Crédito');
      //END IF;
    end;

var
  vlstrQry, vlStrTipoReporte : String;
  vlaniomes : String;
  MesSICC, AnioSICC : Integer;
  vlaniomesSICC: String;
  StpGenR08   : TStoredProc;
  PPResultado : String;

begin

  vlaniomes := copy( DateTimeToStr(peFecha), 7,4) + copy( DateTimeToStr(peFecha), 4,2);

  MesSICC :=  StrToInt(copy( DateTimeToStr(peFecha), 4,2));

  AnioSICC := StrToInt(copy( DateTimeToStr(peFecha), 7,4));

  //Valida si es fin de mes
  if  IncMonth(StrToDate('01/'+FormatDateTime('MM/YYYY',peFecha)),1) - 1 <> peFecha  then
  begin
        if MesSICC = 1 then
        begin
             MesSICC := 12;
             AnioSICC := AnioSICC - 1;
        end
        else
        begin
             MesSICC := MesSICC - 1;
        end;
  end;


  vlaniomesSICC := IntToStr(AnioSICC) +  FormatFloat('0#',MesSICC+0.00);

  ValidaInfoSICC(vlaniomesSICC);

  Result := vlstrQry;

end;

procedure TWCrCoInRi.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Persona.ShowAll := True;
   If Objeto.Persona.Busca Then
   Begin
      cbAcreditado.Checked:= True;
      cbAcreditado.Enabled:= True;
   End;
end;

procedure TWCrCoInRi.cbAcreditadoClick(Sender: TObject);
begin
  EnableCheckBox(cbAcreditado);
  Objeto.Persona.Active := cbAcreditado.Checked;

end;

procedure TWCrCoInRi.EnableCheckBox(var CheckBox: TCheckBox);
begin
  If Not CheckBox.Checked Then Begin
    CheckBox.Checked:=False;
    CheckBox.Enabled:=False;
  End Else Begin
    CheckBox.Checked:=True;
    CheckBox.Enabled:=True;
  End;
end;

end.
