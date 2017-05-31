// Sistema         : Clase de CrGenCuota
// Fecha de Inicio : 15/07/2004
// Función forma   : Clase de CrGenCuota
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
// Modificaciones  : LOLS 24 NOV 2005 SE AGREGA CARGA DE TABLA NAFIN
Unit IntCrgencuot;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,InterEdit,IntSGCtrl,Menus,
//unidades adicionales
IntParamCre, IntGenCre, Excel97, OleServer, IntCrActPa, Gauges;


Type
 TCrgencuot= class;

  TWCrgencuota=Class(TForm)
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
    SGClBusMovNoAut: TSGCtrl;
    lbID_CREDITO: TLabel;
    edID_CREDITO: TEdit;
    lbID_CONTRATO: TLabel;
    iedID_CONTRATO: TInterEdit;
    edCVE_PRODUCTO: TEdit;
    edDESC_PRODUCTO: TEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    lbCVE_AMORTIZACION: TLabel;
    edCVE_AMORTIZACION: TEdit;
    edDESC_TIPO_AMORT: TEdit;
    edF_INI_PAG_CAP: TEdit;
    edNUM_UNIDADES_CP: TInterEdit;
    GroupBox1: TGroupBox;
    lbCVE_PAG_INTERES: TLabel;
    Label7: TLabel;
    edCVE_PAG_INTERES: TEdit;
    edDESC_PAGO_INT: TEdit;
    Label20: TLabel;
    edNUM_UNIDADES_IN: TInterEdit;
    Label8: TLabel;
    Label14: TLabel;
    edF_INI_PAG_INT: TEdit;
    PopupMenu1: TPopupMenu;
    AgregarPeriodo1: TMenuItem;
    BorrarPeriodo1: TMenuItem;
    cbUNIDAD_TIEMPO_CP: TEdit;
    cbDIA_PAGO_CAP: TInterEdit;
    cbUNIDAD_TIEMPO_IN: TEdit;
    cbDIA_PAGO_INT: TInterEdit;
    N1: TMenuItem;
    AgregarPeriododeInters1: TMenuItem;
    BorrarPeriododeInters1: TMenuItem;
    ModificarMonto1: TMenuItem;
    Label22: TLabel;
    edF_INICIO: TEdit;
    dtpF_INICIO: TInterDateTimePicker;
    lbIMP_CREDITO: TLabel;
    btAGREGA_CUOTA: TBitBtn;
    btREINICIA_TABLA: TBitBtn;
    btVALIDA_TABLA: TBitBtn;
    GroupBox2: TGroupBox;
    Bevel1: TBevel;
    Label1: TLabel;
    lbTOT_PER_INT: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    lbTOT_PER_CAP: TLabel;
    lbTOT_PER_COM: TLabel;
    Label11: TLabel;
    btCANCELA: TBitBtn;
    edIMP_CREDITO: TInterEdit;
    Label2: TLabel;
    lbTOT_IMP_CAP: TLabel;
    lbIMP_DISP: TLabel;
    Label10: TLabel;
    lbIMP_FALTANTE: TLabel;
    N2: TMenuItem;
    CargadeTablaPYME1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Rtfinan: TRadioGroup;
    cbAllFA: TCheckBox;
    GroupBox4: TGroupBox;
    lbArchivoEntrada: TLabel;
    sbArchivoEntrada: TSpeedButton;
    edArchivoEntrada: TEdit;
    bbImportar: TBitBtn;
    pAniBar: TPanel;
    ExcelWorksheetI: TExcelWorksheet;
    ExcelApplicationI: TExcelApplication;
    ExcelWorkbookI: TExcelWorkbook;
    odArchivoEntrada: TOpenDialog;
    ModificarMontodeComision1: TMenuItem;
    Rcarga: TRadioGroup;
    Rconcepto: TRadioGroup;
    bbCamFhProg: TBitBtn;
    Label32: TLabel;
    edF_FIN_PERGRA_FA: TEdit;    // --- ASOR --- MAYO 2016 ---
    Label9: TLabel;              // --- ASOR --- MAYO 2016 ---
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure SGClBusMovNoAutCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure AgregarPeriodo1Click(Sender: TObject);
    procedure AgregarPeriododeInters1Click(Sender: TObject);
    procedure btAGREGA_CUOTAClick(Sender: TObject);
    procedure BorrarPeriodo1Click(Sender: TObject);
    procedure btREINICIA_TABLAClick(Sender: TObject);
    procedure BorrarPeriododeInters1Click(Sender: TObject);
    procedure ModificarMonto1Click(Sender: TObject);
    procedure btVALIDA_TABLAClick(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
    procedure edIMP_CREDITOExit(Sender: TObject);
    procedure edIMP_CREDITOKeyPress(Sender: TObject; var Key: Char);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure CargadeTablaPYME1Click(Sender: TObject);
    procedure SGClBusMovNoAutDblClick(Sender: TObject);
    procedure SGClBusMovNoAutMoveRow(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure RtfinanClick(Sender: TObject);
    procedure cbAllFAClick(Sender: TObject);
    procedure edArchivoEntradaExit(Sender: TObject);
    procedure sbArchivoEntradaClick(Sender: TObject);
    procedure bbImportarClick(Sender: TObject);
    procedure ModificarMontodeComision1Click(Sender: TObject);
    procedure RconceptoClick(Sender: TObject);
    procedure bbCamFhProgClick(Sender: TObject);
    private
    { Private declarations }
       vgCountCap               : Integer;
       vgImpCap                 : Double;
       vgCountIn                : Integer;
       vgCountCo                : Integer;

    public
    { Public declarations }
    Objeto : TCrgencuot;

    Procedure   ActualizaINT_FND(PEIDCredito, PENUM_PERIODO : Integer);
    Procedure   ActualizaFinAdic(PEIDCredito, PEnumperiodo : Integer; PEFinAdic:String);
    Procedure   ActualizaCveFinAdic(PEIDCredito, PEnumperiodo : Integer; PEFinAdic:String);
    Procedure   ValidaTabla(PPIDCredito : Integer);
    Procedure   AgregaCuota(PPAccesorio, PPF_Vencimiento, PPImp_cuota : String);
    Procedure   EliminaCuota(PPNumCuota : Integer;PPAccesorio : String);
    Procedure   ModImpCuota(PPNumCuota : Integer;PPAccesorio : String;PPImpCuota : Double);
    Procedure   ModImpCuota2(PPNumCuota : Integer;PPAccesorio : String;PPImpCuota : Double);
    Procedure   ModFProgCuota(PPNumCuota : Integer;PPAccesorio : String;PPProgCuota :Double; PPAutomat : Integer);
    Procedure   ArmaTabla;
    Procedure   ArmaCadenaSQLCuotas;
    Procedure   ReQueryCuotas;
    Function    ValidaDato(pDato: String): Boolean;
    Procedure   ValidaSitCred;
    Procedure   RestauraTabla;
    Function    FindCredOrigen : Boolean;
    Function    CargaTablaPYME( sFileName : TFileName ): Integer;
    procedure   CalculaFega;    

end;
 TCrgencuot= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_CONTRATO              : TInterCampo;
        CVE_PRODUCTO_CRE         : TInterCampo;
        DESC_L_PRODUCTO          : TInterCampo;

        CVE_AMORTIZACION         : TInterCampo;
        CVE_PAG_INTERES          : TInterCampo;
        UNIDAD_TIEMPO_CP         : TInterCampo;
        NUM_UNIDADES_CP          : TInterCampo;
        DIA_PAGO_CAP             : TInterCampo;
        UNIDAD_TIEMPO_IN         : TInterCampo;
        NUM_UNIDADES_IN          : TInterCampo;
        DIA_PAGO_INT             : TInterCampo;
        F_INI_PAG_CAP            : TInterCampo;
        F_INI_PAG_INT            : TInterCampo;
        DESC_AMORTIZA            : TInterCampo;
        DESC_PAG_INTERES         : TInterCampo;

        IMP_CUOTA                : TInterCampo;
        F_VENCIMIENTO            : TInterCampo;
        SIT_CREDITO              : TInterCampo;
        IMP_CREDITO              : TInterCampo;
        F_FIN_PERGRA_FA          : TInterCampo;  // --- ASOR --- MAYO 2016 ---

        ParamCre                 : TParamCre;
        VGCredito                : Integer;
        VGCredRenuev             : Integer;
        CadenaSql                : String;
        VGFolioTabla             : Integer;
        VGCveAccesorioAdd        : String;
        VGCveAccion              : String;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;

var  vlNumRow:Integer;
     vlQry : TQuery;
     vlsql, vlSB_FINANC_ADIC : string;


const
  C_SEPARATOR = ',';
  C_TOKEN_TEXTO = '"';

  C_NUM_AMORT    = 'Numero de Amortización';
  C_FECHA_AMORT  = 'Fecha de Amortización';
  C_TIPO_CUOTA   = 'Tipo de Cuota';
  C_MONTO_AMORT  = 'Monto de Amortización';

  C_TBPYME_CP    = 'CP';
  C_TBPYME_IN    = 'IN';
  C_TBPYME_CPIN  = 'CPIN';

  CO_MENSAJE_FIN  = 'Esta séguro de modificar el Financiamiento Adicional.';
  CO_MENSAJE_CVEFIN  = 'Esta séguro de modificar el Tipo de Financiamiento Adicional.';
  Co_Verdad = 'V';
  Co_Falso  = 'F';
  Co_Directo    = 'DR';
  Co_Prorrateo  = 'PR';
  Co_LQ = 'LQ';

implementation

{$R *.DFM}


constructor TCrgencuot.Create( AOwner : TComponent );
begin Inherited;

      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,False);
                ID_CONTRATO.Caption:='Contrato / Producto';
      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,False);
                CVE_PRODUCTO_CRE.Caption:='Clave de Producto';
      DESC_L_PRODUCTO :=CreaCampo('DESC_L_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
                DESC_L_PRODUCTO.Caption:='Descripción Larga';
      CVE_AMORTIZACION :=CreaCampo('CVE_AMORTIZACION',ftString,tsNinguno,tsNinguno,False);
                CVE_AMORTIZACION.Caption:='Tipo de Amortización';
      CVE_PAG_INTERES :=CreaCampo('CVE_PAG_INTERES',ftString,tsNinguno,tsNinguno,False);
                CVE_PAG_INTERES.Caption:='Pago de Intereses';
      UNIDAD_TIEMPO_CP :=CreaCampo('UNIDAD_TIEMPO_CP',ftString,tsNinguno,tsNinguno,False);
                UNIDAD_TIEMPO_CP.Caption:='Unidad Tiempo CP';
      NUM_UNIDADES_CP :=CreaCampo('NUM_UNIDADES_CP',ftFloat,tsNinguno,tsNinguno,False);
                NUM_UNIDADES_CP.Caption:='Num. Unidades CP';
      DIA_PAGO_CAP :=CreaCampo('DIA_PAGO_CAP',ftFloat,tsNinguno,tsNinguno,False);
                DIA_PAGO_CAP.Caption:='Dia PAgo capital';
      UNIDAD_TIEMPO_IN :=CreaCampo('UNIDAD_TIEMPO_IN',ftString,tsNinguno,tsNinguno,False);
                UNIDAD_TIEMPO_IN.Caption:='Unidad Tiempo Interes';
      NUM_UNIDADES_IN :=CreaCampo('NUM_UNIDADES_IN',ftFloat,tsNinguno,tsNinguno,False);
                NUM_UNIDADES_IN.Caption:='Num. Unidades interes';
      DIA_PAGO_INT :=CreaCampo('DIA_PAGO_INT',ftFloat,tsNinguno,tsNinguno,False);
                DIA_PAGO_INT.Caption:='Dia PAgo Interes';
      F_INI_PAG_CAP :=CreaCampo('F_INI_PAG_CAP',ftDate,tsNinguno,tsNinguno,False);
                F_INI_PAG_CAP.Caption:='Fecha Pago Capital';
      F_INI_PAG_INT :=CreaCampo('F_INI_PAG_INT',ftDate,tsNinguno,tsNinguno,False);
                F_INI_PAG_INT.Caption:='Fecha Inicio pago interes';
      DESC_AMORTIZA :=CreaCampo('DESC_AMORTIZA',ftString,tsNinguno,tsNinguno,False);
                DESC_AMORTIZA.Caption:='Descripción';
      DESC_PAG_INTERES :=CreaCampo('DESC_PAG_INTERES',ftString,tsNinguno,tsNinguno,False);
                DESC_PAG_INTERES.Caption:='Descripción';
      IMP_CUOTA :=CreaCampo('IMP_CUOTA',ftFloat,tsNinguno,tsNinguno,False);
                IMP_CUOTA.Caption:='IMP_CUOTA';
      F_VENCIMIENTO :=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,False);
                F_VENCIMIENTO.Caption:='Fecha Vencimiento';
      SIT_CREDITO :=CreaCampo('SIT_CREDITO',ftString,tsNinguno,tsNinguno,False);
                SIT_CREDITO.Caption:='Situación Credito';
      IMP_CREDITO :=CreaCampo('IMP_CREDITO',ftFloat,tsNinguno,tsNinguno,False);
                IMP_CREDITO.Caption:='IMP_CREDITO';

      F_FIN_PERGRA_FA :=CreaCampo('F_FIN_PERGRA_FA',ftDate,tsNinguno,tsNinguno,False);   // --- ASOR --- MAYO 2016 ---
      F_FIN_PERGRA_FA.Caption:='F_FIN_PERGRA_FA';                                        // --- ASOR --- MAYO 2016 ---

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrgencuot.Hlp';
      ShowMenuReporte:=True;

end;

Destructor TCrgencuot.Destroy;
begin inherited;
end;


function TCrgencuot.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrgencuota;
begin
   W:=TWCrgencuota.Create(Self);
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


Function TCrgencuot.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrgencu.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CrGenCuota********************)
(*                                                                              *)
(*  FORMA DE CrGenCuota                                                            *)
(*                                                                              *)
(***********************************************FORMA CrGenCuota********************)
Procedure TWCrgencuota.ValidaSitCred;
begin
   if ( Objeto.SIT_CREDITO.AsString = 'AC' ) or
      ( Objeto.SIT_CREDITO.AsString = 'CA' ) then
   Begin
      AgregarPeriodo1.Enabled := False;
      BorrarPeriodo1.Enabled := False;
      ModificarMonto1.Enabled := False;
      AgregarPeriododeInters1.Enabled := False;
      BorrarPeriododeInters1.Enabled := False;

      ModificarMontodeComision1.Enabled := False;

      btAGREGA_CUOTA.Enabled := False;
      btREINICIA_TABLA.Enabled:= False;
      btVALIDA_TABLA.Enabled := False;
      btCANCELA.Enabled := False;

      bbImportar.Enabled := False;
      sbArchivoEntrada.Enabled := False;
   end
   else
   Begin
      AgregarPeriodo1.Enabled := Objeto.CVE_AMORTIZACION.AsInteger = 3;
      BorrarPeriodo1.Enabled := Objeto.CVE_AMORTIZACION.AsInteger = 3;
      ModificarMonto1.Enabled := ((Objeto.CVE_AMORTIZACION.AsInteger = 2) or (Objeto.CVE_AMORTIZACION.AsInteger = 3));

  //HERJA AGOSTO 2014
  //    bbImportar.Enabled := ((Objeto.CVE_AMORTIZACION.AsInteger = 2) or (Objeto.CVE_AMORTIZACION.AsInteger = 3));
  //    sbArchivoEntrada.Enabled := ((Objeto.CVE_AMORTIZACION.AsInteger = 2) or (Objeto.CVE_AMORTIZACION.AsInteger = 3));

      AgregarPeriododeInters1.Enabled := Objeto.CVE_PAG_INTERES.AsInteger = 3;
      BorrarPeriododeInters1.Enabled := Objeto.CVE_PAG_INTERES.AsInteger = 3;

      ModificarMontodeComision1.Enabled := ((Objeto.CVE_AMORTIZACION.AsInteger = 2) or (Objeto.CVE_AMORTIZACION.AsInteger = 3));

      btAGREGA_CUOTA.Enabled := True;
      btREINICIA_TABLA.Enabled:= True;
      btVALIDA_TABLA.Enabled := True;
      btCANCELA.Enabled := True;
   end;
end;

Function TWCrgencuota.ValidaDato(pDato: String): Boolean;
var vlResult : Boolean;
begin
   vlResult := True;
   if pDato = '' then
   Begin
      ShowMessage('Favor de Indicar el número de Periodo');
      vlResult := False;
   end;
   ValidaDato := vlResult;
end;

Procedure TWCrgencuota.ActualizaINT_FND(PEIDCredito, PENUM_PERIODO : Integer);
var STPActINT_FND  : TStoredProc;
begin
   try
     STPActINT_FND:=TStoredProc.Create(Nil);
     STPActINT_FND.DatabaseName:=Objeto.Apli.DatabaseName;
     STPActINT_FND.SessionName:=Objeto.Apli.SessionName;

     with STPActINT_FND do
     begin
        StoredProcName:='PKGCRREDESCTO.STPACTUALIZA_BANDCVE_FA';
        Params.CreateParam(ftInteger,'PEIDCredito'  ,ptInput);
        Params.CreateParam(ftInteger,'PENUMPERIODO'  ,ptInput);
        Params.CreateParam(ftString, 'PEBaut'       ,ptInput);
        Params.CreateParam(ftString, 'PEBCOMMIT'    ,ptInput);
        Params.CreateParam(ftFloat,  'PSResultado'    ,ptOutput);
        Params.CreateParam(ftString, 'PSTxResultado' ,ptOutput);

        Prepare;

        ParamByName('PEIDCredito').AsInteger := PEIDCredito;
        ParamByName('PENUMPERIODO').AsInteger := PENUM_PERIODO;
        ParamByName('PEBaut').AsString     := 'F';
        ParamByName('PEBCOMMIT').AsString    := 'V';
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
           ShowMessage(ParamByName('PSTxResultado').AsString+'. ACTUALIZE EL PASIVO DE FORMA MANUAL');
     end;

   finally
     STPActINT_FND.Free;
   end;
end;

Procedure   TWCrgencuota.ActualizaFinAdic(PEIDCredito, PEnumperiodo : Integer; PEFinAdic:String);
var STPActFinAdic  : TStoredProc;
begin
   try
     STPActFinAdic:=TStoredProc.Create(Nil);
     STPActFinAdic.DatabaseName:=Objeto.Apli.DatabaseName;
     STPActFinAdic.SessionName:=Objeto.Apli.SessionName;
     STPActFinAdic.StoredProcName:='PKGCRCUOTAS.STP_UPDFINADIC_SOLCUOT';
     STPActFinAdic.Params.CreateParam(ftInteger,'peIdRefSolCuota',ptInput);
     STPActFinAdic.Params.CreateParam(ftString, 'peBFinanAdic'   ,ptInput);
     STPActFinAdic.Params.CreateParam(ftInteger,'peNumPeriodo'   ,ptInput);
     STPActFinAdic.Params.CreateParam(ftString, 'PEBCOMMIT'     ,ptInput);

     STPActFinAdic.Params.CreateParam(ftFloat,'psResultado',ptOutput);
     STPActFinAdic.Params.CreateParam(ftString,'psTxResultado',ptOutput);

     STPActFinAdic.Prepare;

     STPActFinAdic.ParamByName('peIdRefSolCuota').AsInteger := PEIDCredito;
     STPActFinAdic.ParamByName('peBFinanAdic').AsString     := PEFinAdic;
     STPActFinAdic.ParamByName('peNumPeriodo').AsInteger    := PEnumperiodo;
     STPActFinAdic.ParamByName('PEBCOMMIT').AsString        := Co_Verdad;
     STPActFinAdic.ExecProc;

     if (STPActFinAdic.ParamByName('psResultado').AsInteger <> 0) then
     begin
        if (STPActFinAdic.ParamByName('psResultado').AsInteger = 1) then
            ShowMessage(STPActFinAdic.ParamByName('psTxResultado').AsString + ' No se modifico el Financiamiento Adicional')
        else
            ShowMessage(STPActFinAdic.ParamByName('psTxResultado').AsString);
     end;

   finally
     STPActFinAdic.Free;
   end;

   ActualizaINT_FND(PEIDCredito, PEnumperiodo);
end;

Procedure   TWCrgencuota.ActualizaCveFinAdic(PEIDCredito, PEnumperiodo : Integer; PEFinAdic:String);
var STPActCveFinAdic  : TStoredProc;
begin

   try
     STPActCveFinAdic:=TStoredProc.Create(Nil);
     STPActCveFinAdic.DatabaseName:=Objeto.Apli.DatabaseName;
     STPActCveFinAdic.SessionName:=Objeto.Apli.SessionName;
     STPActCveFinAdic.StoredProcName:='PKGCRCUOTAS.STP_UPDCVEFINADIC';
     STPActCveFinAdic.Params.CreateParam(ftInteger,'peIdRefSolCuota',ptInput);
     STPActCveFinAdic.Params.CreateParam(ftString, 'peCveFinanAdic'   ,ptInput);
     STPActCveFinAdic.Params.CreateParam(ftInteger,'peNumPeriodo'   ,ptInput);
     STPActCveFinAdic.Params.CreateParam(ftInteger,'peTabla'   ,ptInput);
     STPActCveFinAdic.Params.CreateParam(ftString, 'PEBCOMMIT'     ,ptInput);

     STPActCveFinAdic.Params.CreateParam(ftFloat,'psResultado',ptOutput);
     STPActCveFinAdic.Params.CreateParam(ftString,'psTxResultado',ptOutput);

     STPActCveFinAdic.Prepare;

     STPActCveFinAdic.ParamByName('peIdRefSolCuota').AsInteger := PEIDCredito;
     STPActCveFinAdic.ParamByName('peCveFinanAdic').AsString     := PEFinAdic;
     STPActCveFinAdic.ParamByName('peNumPeriodo').AsInteger    := PEnumperiodo;
     STPActCveFinAdic.ParamByName('peTabla').AsInteger         := 0; //MODIFICA CR_SOL_CUOTA
     STPActCveFinAdic.ParamByName('PEBCOMMIT').AsString        := Co_Verdad;
     STPActCveFinAdic.ExecProc;

     if (STPActCveFinAdic.ParamByName('psResultado').AsInteger <> 0) then
     begin
        if (STPActCveFinAdic.ParamByName('psResultado').AsInteger = 1) then
            ShowMessage(STPActCveFinAdic.ParamByName('psTxResultado').AsString + ' No se modifico la Clave de Financiamiento Adicional')
        else
            ShowMessage(STPActCveFinAdic.ParamByName('psTxResultado').AsString);
     end;

   finally
     STPActCveFinAdic.Free;
   end;

   ActualizaINT_FND(PEIDCredito, PEnumperiodo);
end;


Procedure   TWCrgencuota.ValidaTabla(PPIDCredito : Integer);
var STPObtSuc  : TStoredProc;
begin
     lbIMP_FALTANTE.Font.Color := clActiveCaption;
     lbIMP_FALTANTE.Caption := '0';
     try
          STPObtSuc:=TStoredProc.Create(Nil);
          STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
          STPObtSuc.SessionName:=Objeto.Apli.SessionName;
          STPObtSuc.StoredProcName:='PKGCRCUOTAS.STPVALIDAAMORT';
          STPObtSuc.Params.CreateParam(ftInteger,'PEIDRefSolCuota',ptInput);
          STPObtSuc.Params.CreateParam(ftFloat,'PSDiferencia',ptOutput);
          STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
          STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
          STPObtSuc.Prepare;
          STPObtSuc.ParamByName('PEIDRefSolCuota').AsInteger := PPIDCredito;
          STPObtSuc.ExecProc;
          if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
          begin
               if (STPObtSuc.ParamByName('PSResultado').AsInteger = 2) then
               Begin
                  ShowMessage(STPObtSuc.ParamByName('PSTXResultado').AsString + ' (' +  FormatFloat('###,###,###,###,##.00',STPObtSuc.ParamByName('PSDiferencia').AsFloat) + ') ');
                  lbIMP_FALTANTE.Caption := FormatFloat('###,###,###,###,##.00',STPObtSuc.ParamByName('PSDiferencia').AsFloat);
                  lbIMP_FALTANTE.Font.Color := clRed;
               end
               else
                  ShowMessage(STPObtSuc.ParamByName('PSTXResultado').AsString);
          end
          else
          Begin
              ShowMessage('La tabla de amortización está OK');
              lbIMP_FALTANTE.Font.Color := clActiveCaption;
              lbIMP_FALTANTE.Caption := '0';
          end;

     finally
            STPObtSuc.Free;
     end;
end;

Procedure   TWCrgencuota.ModImpCuota(PPNumCuota : Integer;PPAccesorio : String;PPImpCuota : Double);
var STPObtSuc  : TStoredProc;
    VLTipoAcc  : String;
begin
      if PPAccesorio = 'CP' then
         VLTipoAcc := ' Capital ';
      if PPAccesorio = 'IN' then
         VLTipoAcc := ' Interes ';
      if PPAccesorio = 'CF' then
         VLTipoAcc := ' Cuota FEGA ';

//      else
//         VLTipoAcc := ' Interés ';
      //end if;

      if MessageDlg('¿Desea Modificar el importe de la cuota No. ' + IntToStr(PPNumCuota) + ' de ' + VLTipoAcc + '?. ', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           try
                STPObtSuc:=TStoredProc.Create(Nil);
                STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
                STPObtSuc.SessionName:=Objeto.Apli.SessionName;

                STPObtSuc.StoredProcName:='PKGCRCUOTAS.STPMODIMPCONCEPTOS';
                STPObtSuc.Params.CreateParam(ftInteger,'PEIDRefSolCuota',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECveAccesorio',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECveAmortiza',ptInput);
                STPObtSuc.Params.CreateParam(ftInteger,'PENumPeriodo',ptInput);
                STPObtSuc.Params.CreateParam(ftFloat,'PEImpCuota',ptInput);
                STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
                STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
                STPObtSuc.Prepare;
                STPObtSuc.ParamByName('PEIDRefSolCuota').AsInteger := Objeto.VGCredito;
                STPObtSuc.ParamByName('PECveAccesorio').AsString := PPAccesorio;
                if PPAccesorio = 'CP' then
                   STPObtSuc.ParamByName('PECveAmortiza').AsString := Objeto.CVE_AMORTIZACION.AsString
                else
                   STPObtSuc.ParamByName('PECveAmortiza').AsString := Objeto.CVE_PAG_INTERES.AsString;
                //end if;
                STPObtSuc.ParamByName('PENumPeriodo').AsFloat := PPNumCuota;
                STPObtSuc.ParamByName('PEImpCuota').AsFloat := PPImpCuota;

                STPObtSuc.ExecProc;
                if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
                     ShowMessage('PROBLEMAS AL MODIFICAR CUOTA ' + IntToStr(STPObtSuc.ParamByName('PSResultado').AsInteger) + STPObtSuc.ParamByName('PSTXResultado').AsString);
                //end if;
           finally
                  STPObtSuc.Free;
           end;
           btCANCELA.Visible := False;
      end;
end;

Procedure   TWCrgencuota.ModImpCuota2(PPNumCuota : Integer;PPAccesorio : String;PPImpCuota : Double);
var STPObtSuc  : TStoredProc;
    VLTipoAcc  : String;
begin
      if PPAccesorio = 'CP' then
         VLTipoAcc := ' Capital '
      else
         VLTipoAcc := ' Interés ';
      //end if;

           try
                STPObtSuc:=TStoredProc.Create(Nil);
                STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
                STPObtSuc.SessionName:=Objeto.Apli.SessionName;

                STPObtSuc.StoredProcName:='PKGCRCUOTAS.STPMODIMPCONCEPTOS';
                STPObtSuc.Params.CreateParam(ftInteger,'PEIDRefSolCuota',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECveAccesorio',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECveAmortiza',ptInput);
                STPObtSuc.Params.CreateParam(ftInteger,'PENumPeriodo',ptInput);
                STPObtSuc.Params.CreateParam(ftFloat,'PEImpCuota',ptInput);
                STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
                STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
                STPObtSuc.Prepare;
                STPObtSuc.ParamByName('PEIDRefSolCuota').AsInteger := Objeto.VGCredito;
                STPObtSuc.ParamByName('PECveAccesorio').AsString := PPAccesorio;
                if PPAccesorio = 'CP' then
                   STPObtSuc.ParamByName('PECveAmortiza').AsString := Objeto.CVE_AMORTIZACION.AsString
                else
                   STPObtSuc.ParamByName('PECveAmortiza').AsString := Objeto.CVE_PAG_INTERES.AsString;
                //end if;
                STPObtSuc.ParamByName('PENumPeriodo').AsFloat := PPNumCuota;
                STPObtSuc.ParamByName('PEImpCuota').AsFloat := PPImpCuota;

                STPObtSuc.ExecProc;
                if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
                     ShowMessage('PROBLEMAS AL MODIFICAR CUOTA ' + IntToStr(STPObtSuc.ParamByName('PSResultado').AsInteger) + STPObtSuc.ParamByName('PSTXResultado').AsString);
                //end if;
           finally
                  STPObtSuc.Free;
           end;
           btCANCELA.Visible := False;
end;


Procedure   TWCrgencuota.ModFProgCuota(PPNumCuota : Integer;PPAccesorio : String;PPProgCuota:Double; PPAutomat : Integer);
var STPObtSuc  : TStoredProc;
begin
     try
        STPObtSuc:=TStoredProc.Create(Nil);
        STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
        STPObtSuc.SessionName:=Objeto.Apli.SessionName;

        STPObtSuc.StoredProcName:='PKGCRCUOTAS.STPMODFPROGCONCEPTOS';
        //
        STPObtSuc.Params.CreateParam(ftInteger,'PEIDRefSolCuota',ptInput);
        STPObtSuc.Params.CreateParam(ftString, 'PECveAccesorio',ptInput);
        STPObtSuc.Params.CreateParam(ftInteger,'PENumPeriodo',ptInput);
        STPObtSuc.Params.CreateParam(ftFloat,  'PEFProgCuota',ptInput);
        STPObtSuc.Params.CreateParam(ftInteger,'PEModoAut',ptInput);
        STPObtSuc.Params.CreateParam(ftString, 'PECommit',ptInput);
        STPObtSuc.Params.CreateParam(ftFloat,  'PSResultado',ptOutput);
        STPObtSuc.Params.CreateParam(ftString, 'PSTXResultado',ptOutput);
        //
        STPObtSuc.Prepare;
        //
        STPObtSuc.ParamByName('PEIDRefSolCuota').AsInteger := Objeto.VGCredito;
        STPObtSuc.ParamByName('PECveAccesorio').AsString := PPAccesorio;
        STPObtSuc.ParamByName('PENumPeriodo').AsFloat := PPNumCuota;
        STPObtSuc.ParamByName('PEFProgCuota').AsFloat := PPProgCuota;
        STPObtSuc.ParamByName('PEModoAut').AsInteger := PPAutomat;
        STPObtSuc.ParamByName('PECommit').AsString := 'V';

        STPObtSuc.ExecProc;
        if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
            ShowMessage('PROBLEMAS AL MODIFICAR CUOTA ' + IntToStr(STPObtSuc.ParamByName('PSResultado').AsInteger) + STPObtSuc.ParamByName('PSTXResultado').AsString);

        if (PPAutomat=1) and (STPObtSuc.ParamByName('PSResultado').AsInteger = 0) then
            ShowMessage('Fechas Programadas actualizadas con Exito');

    finally
        STPObtSuc.Free;
    end;
    btCANCELA.Visible := False;
end;


Procedure   TWCrgencuota.EliminaCuota(PPNumCuota : Integer;PPAccesorio : String);
var STPObtSuc  : TStoredProc;
    VLTipoAcc  : String;
begin
      if PPAccesorio = 'CP' then
         VLTipoAcc := ' Capital '
      else
         VLTipoAcc := ' Interés ';
      //end if;

      if MessageDlg('¿Desea Eliminar cuota No. ' + IntToStr(PPNumCuota) + ' de ' + VLTipoAcc + '?. ', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           try
                STPObtSuc:=TStoredProc.Create(Nil);
                STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
                STPObtSuc.SessionName:=Objeto.Apli.SessionName;

                STPObtSuc.StoredProcName:='PKGCRCUOTAS.STPELIMINACONCEPTOS';
                STPObtSuc.Params.CreateParam(ftInteger,'PEIDRefSolCuota',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECveAccesorio',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECveAmortiza',ptInput);
                STPObtSuc.Params.CreateParam(ftInteger,'PENumPeriodo',ptInput);
                STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
                STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
                STPObtSuc.Prepare;
                STPObtSuc.ParamByName('PEIDRefSolCuota').AsInteger := Objeto.VGCredito;
                STPObtSuc.ParamByName('PECveAccesorio').AsString := PPAccesorio;
                if PPAccesorio = 'CP' then
                   STPObtSuc.ParamByName('PECveAmortiza').AsString := Objeto.CVE_AMORTIZACION.AsString
                else
                   STPObtSuc.ParamByName('PECveAmortiza').AsString := Objeto.CVE_PAG_INTERES.AsString;
                //end if;
                STPObtSuc.ParamByName('PENumPeriodo').AsFloat := PPNumCuota;

                STPObtSuc.ExecProc;
                if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
                     ShowMessage('PROBLEMAS AL BORRAR CUOTA: ' + IntToStr(STPObtSuc.ParamByName('PSResultado').AsInteger) + STPObtSuc.ParamByName('PSTXResultado').AsString);
                //end if;
           finally
                  STPObtSuc.Free;
           end;
      end;
end;


Procedure  TWCrgencuota.AgregaCuota(PPAccesorio, PPF_Vencimiento, PPImp_cuota  : String);
var STPObtSuc  : TStoredProc;
begin
     try
          STPObtSuc:=TStoredProc.Create(Nil);
          STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
          STPObtSuc.SessionName:=Objeto.Apli.SessionName;
          STPObtSuc.StoredProcName:='PKGCRCUOTAS.STPAGREGACONCEPTOS';
          STPObtSuc.Params.CreateParam(ftInteger,'PEIDRefSolCuota',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PECveAccesorio',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PECveAmortiza',ptInput);
          STPObtSuc.Params.CreateParam(ftDateTime,'PEFVencimiento',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PECveDireccion',ptInput);
          STPObtSuc.Params.CreateParam(ftFloat,'PEImpCuota',ptInput);
          STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
          STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
          STPObtSuc.Prepare;
          STPObtSuc.ParamByName('PEIDRefSolCuota').AsInteger := Objeto.VGCredito;
          STPObtSuc.ParamByName('PECveAccesorio').AsString := PPAccesorio;
          if PPAccesorio = 'CP' then
             STPObtSuc.ParamByName('PECveAmortiza').AsString := Objeto.CVE_AMORTIZACION.AsString
          else
             STPObtSuc.ParamByName('PECveAmortiza').AsString := Objeto.CVE_PAG_INTERES.AsString;
          //end if;
          STPObtSuc.ParamByName('PEFVencimiento').AsDateTime := StrToDate(PPF_Vencimiento); //Objeto.F_VENCIMIENTO.AsDateTime;
          STPObtSuc.ParamByName('PECveDireccion').AsString := 'D0';
          STPObtSuc.ParamByName('PEImpCuota').AsFloat := StrToFloat(PPImp_cuota); //Objeto.IMP_CUOTA.AsFloat;
          STPObtSuc.ExecProc;
          if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
               ShowMessage('PROBLEMAS AL AGREGAR CUOTA: ' + IntToStr(STPObtSuc.ParamByName('PSResultado').AsInteger) + STPObtSuc.ParamByName('PSTXResultado').AsString);
          //end if;
     finally
            STPObtSuc.Free;
     end;
end;

Procedure  TWCrgencuota.ArmaTabla;
var STPObtSuc  : TStoredProc;
begin
     try
          STPObtSuc:=TStoredProc.Create(Nil);
          STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
          STPObtSuc.SessionName:=Objeto.Apli.SessionName;
          STPObtSuc.StoredProcName:='PKGCRCUOTAS.STPGENCRCONCEPTOS';
          STPObtSuc.Params.CreateParam(ftInteger,'PEIdCredito',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
          STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
          STPObtSuc.Prepare;
          STPObtSuc.ParamByName('PEIdCredito').AsInteger := Objeto.VGCredito;
          STPObtSuc.ExecProc;
          if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
               ShowMessage('PROBLEMAS AL ARMAR TABLA DE DISPOSICIÓN: ' + IntToStr(STPObtSuc.ParamByName('PSResultado').AsInteger) + STPObtSuc.ParamByName('PSTXResultado').AsString);
          //end if;
     finally
            STPObtSuc.Free;
     end;
end;


procedure TWCrgencuota.RestauraTabla;
var stpResTab  : TStoredProc;
begin
     try
          stpResTab:=TStoredProc.Create(Nil);
          stpResTab.DatabaseName:= Objeto.Apli.DatabaseName;
          stpResTab.SessionName:= Objeto.Apli.SessionName;
          stpResTab.StoredProcName:='PKGCRCUOTAS.STPREESPERIODCR';
          stpResTab.Params.CreateParam(ftInteger,'peIdCredito',ptInput);
          stpResTab.Params.CreateParam(ftString,'peBCommit',ptInput);
          stpResTab.Params.CreateParam(ftFloat,'psResultado',ptOutput);
          stpResTab.Params.CreateParam(ftString,'psTxResultado',ptOutput);
          stpResTab.Prepare;
          stpResTab.ParamByName('peIdCredito').AsInteger := Objeto.VGCredito;
          stpResTab.ParamByName('peBCommit').AsString := 'V';
          stpResTab.ExecProc;
          if (stpResTab.ParamByName('psResultado').AsInteger <> 0) then
               ShowMessage('PROBLEMAS AL RESTAURAR TABLA DE PERIODOS: ' +
               IntToStr(stpResTab.ParamByName('psResultado').AsInteger) +
                        stpResTab.ParamByName('psTXResultado').AsString);
          //end if;
     finally
            stpResTab.Free;
     end;
end;


procedure TWCrgencuota.CalculaFega;
var stpRecalFEGA  : TStoredProc;
begin
   ShowMessage('Se recalcularan las cuotas FEGA en caso de que existan');
     try
       stpRecalFEGA:=TStoredProc.Create(Nil);
       with stpRecalFEGA do
       begin
          DatabaseName:= Objeto.Apli.DatabaseName;
          SessionName:= Objeto.Apli.SessionName;
          StoredProcName:='PKGCRREDESCTO.STPRECALCUOTFEGA';
          Params.Clear;
          Params.CreateParam( ftFloat,  'PEMetodo',       ptInput  ); //
          Params.CreateParam( ftFloat,  'PEIDCredito',    ptInput  ); //
          Params.CreateParam( ftString, 'PECveEntidad',   ptInput  ); //
          Params.CreateParam( ftString, 'PECvePrograma',  ptInput  ); //
          Params.CreateParam( ftFloat,  'PENumPeriodo',   ptInput  ); //
          Params.CreateParam( ftString, 'PETCred',        ptInput  ); //
          Params.CreateParam( ftString, 'PECveUsuAlta',   ptInput  ); //
          Params.CreateParam( ftString, 'PEBCommit',      ptInput  ); //
          Params.CreateParam( ftFloat,  'PSResultado',    ptOutput ); //
          Params.CreateParam( ftString, 'PSTxResultado',  ptOutput ); //
          Prepare;
          ParamByName( 'PEMetodo'      ).AsInteger := 1;
          ParamByName( 'PEIDCredito'   ).AsInteger := Objeto.VGCredito;
          ParamByName( 'PECveEntidad'  ).Clear;
          ParamByName( 'PECvePrograma' ).Clear;
          ParamByName( 'PENumPeriodo'  ).Clear;
          ParamByName( 'PETCred'       ).AsString  := 'AC';
          ParamByName( 'PECveUsuAlta'  ).AsString  := Objeto.Apli.Usuario;
          ParamByName( 'PEBCommit'     ).AsString  := 'V';
          //
          ExecProc;
          if (ParamByName('psResultado').AsInteger <> 0) then
               ShowMessage('PROBLEMAS AL REGENERAR CUOTAS FEGA: ' +
               IntToStr(stpRecalFEGA.ParamByName('psResultado').AsInteger) +
                        stpRecalFEGA.ParamByName('psTXResultado').AsString);
       end;
     finally
            stpRecalFEGA.Free;
     end;
end;

Procedure  TWCrgencuota.ArmaCadenaSQLCuotas;
begin

     Objeto.CadenaSql :=' SELECT ' +

                 ' FEC.F_VENCIMIENTO, ' +
                 ' FEC.F_PROG_PAGO, ' +
                 #39 + '   ' + #39 + ' AS B1, ' +
                 ' CCP.NUM_PERIODO NUM_PERIODO_CP, ' +
                 ' CCP.PLAZO PLAZO_CP, ' +
                 ' CCP.IMP_CUOTA IMP_CUOTA_CP, ' +
                 ' CCP.SIT_CAPITAL SIT_CAPITAL_CP, ' +
                 #39 + '   ' + #39 + ' AS B2, ' +
                 ' CIN.NUM_PERIODO NUM_PERIODO_IN, ' +
                 ' CIN.PLAZO PLAZO_IN, ' +
                 ' CIN.IMP_CUOTA IMP_CUOTA_IN, ' +
                 ' CIN.SIT_CAPITAL SIT_CAPITAL_IN, ' +
                 ' CIN.B_FINAN_ADIC B_FINAN_ADIC_IN, ' +   //HERJA - FINANCIAMIMENTO ADICIONAL
                 ' CIN.CVE_FINAN_ADIC CVE_FINAN_ADIC_IN, ' +   //HERJA - CVE FINANCIAMIENTO ADICIONAL
                 #39 + '   ' + #39 + ' AS B3, ' +
                 ' CCO.NUM_PERIODO NUM_PERIODO_CO, ' +
                 ' CCO.PLAZO PLAZO_CO, ' +
                 ' CCO.IMP_CUOTA IMP_CUOTA_CO, ' +
                 ' CCO.SIT_CAPITAL SIT_CAPITAL_CO ' +
                 ' FROM ' +
                 ' CR_SOL_CUOTA CCP, ' +
                 ' CR_SOL_CUOTA CIN, ' +
                 ' CR_SOL_CUOTA CCO, ' +
                 ' (SELECT DISTINCT(F_VENCIMIENTO) AS F_VENCIMIENTO, F_PROG_PAGO, ID_REF_SOL_CUOTA ' +
                 '  FROM CR_SOL_CUOTA ' +
                 '  WHERE ID_REF_SOL_CUOTA = ' + IntToStr(Objeto.VGCredito) +
                 //  SE REALIZA EL UNION PARA QUE MUESTRE EL PRIMER PERIODO DE COMISION
                 '  UNION ' +
                 '  SELECT F_VENCIMIENTO, F_PROG_PAGO, ID_REF_SOL_CUOTA' +
                 '  FROM CR_SOL_CUOTA ' +
                 '  WHERE ID_REF_SOL_CUOTA = ' + IntToStr(Objeto.VGCredito) +
                 '  AND NUM_PERIODO = 1 ' +
                 '  AND CVE_ACCESORIO = '+#39+'CO'+#39+
                 //
                 ' ) FEC ' +
                 ' WHERE CCP.ID_REF_SOL_CUOTA (+)= FEC.ID_REF_SOL_CUOTA ' +
                 ' AND   CCP.CVE_ACCESORIO (+)= '+#39+'CP'+#39+
                 ' AND   CCP.F_VENCIMIENTO (+)= FEC.F_VENCIMIENTO ' +
                 ' AND   CIN.ID_REF_SOL_CUOTA (+)= FEC.ID_REF_SOL_CUOTA ' +
                 ' AND   CIN.CVE_ACCESORIO (+)= '+#39+'IN'+#39+
                 ' AND   CIN.F_VENCIMIENTO (+)= FEC.F_VENCIMIENTO ' +
                // ' AND   CCO.ID_CREDITO (+)= FEC.ID_REF_SOL_CUOTA ' +
                 ' AND   CCO.ID_REF_SOL_CUOTA (+)= FEC.ID_REF_SOL_CUOTA ' +
                 ' AND   CCO.CVE_ACCESORIO (+)= '+#39+'CO'+#39+
                 ' AND   CCO.F_VENCIMIENTO (+)= FEC.F_VENCIMIENTO ' +

                 ' ORDER BY FEC.F_VENCIMIENTO ';
end;
//**********************************
Procedure  TWCrgencuota.ReQueryCuotas;
var Q : TQuery;
begin
     vgCountCap := 0;
     vgImpCap   := 0;
     vgCountIn  := 0;
     vgCountCo  := 0;
     Q :=  GetSQLQuery(Objeto.CadenaSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     try
          if Q <> nil then
          begin
               //COLUMNAS OCULTAS
               //ASIGNACION DE ETIQUETAS
               Q.FieldByName('F_VENCIMIENTO').DisplayLabel := 'F.V.' + #30 +'>C';
               Q.FieldByName('F_PROG_PAGO').DisplayLabel := 'F.P.P' + #30 +'>C';
               Q.FieldByName('B1').DisplayLabel := '   ' + #30 +'>C';
               Q.FieldByName('NUM_PERIODO_CP').DisplayLabel := 'N.P' + #30 +'>C';
               Q.FieldByName('PLAZO_CP').DisplayLabel := 'Plazo' + #30 +'>C';
               Q.FieldByName('IMP_CUOTA_CP').DisplayLabel := 'Importe' + #30 +'>C';
               Q.FieldByName('SIT_CAPITAL_CP').DisplayLabel := 'Sit' + #30 +'>C';
               Q.FieldByName('B2').DisplayLabel := '   ' + #30 +'>C';
               Q.FieldByName('NUM_PERIODO_IN').DisplayLabel := 'N.P' + #30 +'>C';
               Q.FieldByName('PLAZO_IN').DisplayLabel := 'Plazo' + #30 +'>C';
               Q.FieldByName('IMP_CUOTA_IN').DisplayLabel := 'Importe' + #30 +'>C';
               Q.FieldByName('SIT_CAPITAL_IN').DisplayLabel := 'Sit' + #30 +'>C';
               Q.FieldByName('B_FINAN_ADIC_IN').DisplayLabel := 'FA' + #30 +'>C';  //FINANCIAMIENTO ADICIONAL
               Q.FieldByName('CVE_FINAN_ADIC_IN').DisplayLabel := 'T.FA' + #30 +'>C';  //CVE FINANCIAMIENTO ADICIONAL
               Q.FieldByName('B3').DisplayLabel := '   ' + #30 +'>C';
               Q.FieldByName('NUM_PERIODO_CO').DisplayLabel := 'N.P' + #30 +'>C';
               Q.FieldByName('PLAZO_CO').DisplayLabel := 'Plazo' + #30 +'>C';
               Q.FieldByName('IMP_CUOTA_CO').DisplayLabel := 'Importe' + #30 +'>C';
               Q.FieldByName('SIT_CAPITAL_CO').DisplayLabel := 'Sit' + #30 +'>C';

               //ASIGNACION DE MASCARAS DE EDICION
               TDateField(Q.FieldByName('F_VENCIMIENTO')).DisplayFormat := 'DD/MM/YYYY';
               TDateField(Q.FieldByName('F_PROG_PAGO')).DisplayFormat := 'DD/MM/YYYY';
               TNumericField(Q.FieldByName('IMP_CUOTA_CP')).DisplayFormat := '###,###,###,##0.00';
               TNumericField(Q.FieldByName('IMP_CUOTA_IN')).DisplayFormat := '###,###,###,##0.00';
               TNumericField(Q.FieldByName('IMP_CUOTA_CO')).DisplayFormat := '###,###,###,##0.00';

               //ASIGNACION DE LONGITUD DE COLUMNAS
               Q.FieldByName('F_VENCIMIENTO').DisplayWidth := 11;  //12
               Q.FieldByName('F_PROG_PAGO').DisplayWidth := 11;    //12
               Q.FieldByName('B1').DisplayWidth := 2;      //3
               Q.FieldByName('NUM_PERIODO_CP').DisplayWidth := 3; //3
               Q.FieldByName('PLAZO_CP').DisplayWidth := 5;
               Q.FieldByName('IMP_CUOTA_CP').DisplayWidth := 11; //12
               Q.FieldByName('SIT_CAPITAL_CP').DisplayWidth := 4;
               Q.FieldByName('B2').DisplayWidth := 2;      //3
               Q.FieldByName('NUM_PERIODO_IN').DisplayWidth := 4;
               Q.FieldByName('PLAZO_IN').DisplayWidth := 5;
               Q.FieldByName('IMP_CUOTA_IN').DisplayWidth := 11; //12
               Q.FieldByName('SIT_CAPITAL_IN').DisplayWidth := 4;
               Q.FieldByName('B_FINAN_ADIC_IN').DisplayWidth := 4;  //FINANCIAMIENTO ADICIONAL
               Q.FieldByName('CVE_FINAN_ADIC_IN').DisplayWidth := 4;  //CVE FINANCIAMIENTO ADICIONAL
               Q.FieldByName('B3').DisplayWidth := 2;      //3
               Q.FieldByName('NUM_PERIODO_CO').DisplayWidth := 4;
               Q.FieldByName('PLAZO_CO').DisplayWidth := 5;
               Q.FieldByName('IMP_CUOTA_CO').DisplayWidth := 12;
               Q.FieldByName('SIT_CAPITAL_CO').DisplayWidth := 4;

               SGClBusMovNoAut.Titulo1 := 'Crédito ' + IntToStr(Objeto.VGCredito);
//             SGClBusMovNoAut.Titulo2 := '.                                                 |                     CAPITAL                      |                     INTERES                    |                CONCEPTOS              .';
               SGClBusMovNoAut.Titulo2 := '.                                              |                   CAPITAL                  |                       INTERES                          |                CONCEPTOS              .';
               SGClBusMovNoAut.addQry(Q,True,True,-1,-1,-1,True);
      //       SGClBusMovNoAut.SG.Row := SGClBusMovNoAut.SG.FixedRows + 1;

               SGClBusMovNoAut.ColumnByName('B_FINAN_ADIC_IN').IsCheck := True;
          end
          else
          begin
               SGClBusMovNoAut.Clear('NO EXISTEN CUOTAS DEFINIDAS'#30'>C');
          end;
     finally
          if Q <> nil then
             Q.free;
          //end if
     end;
end;


procedure TWCrgencuota.FormShow(Sender: TObject);
VAR
   vlsql: String;
   vlQry :TQuery;
begin
{CAPITAL/COMISINN   (CP,CO)
--0	NO APLICA  OPERACIONES FUERA DE BALANCE
--1	AMORTIZACIONES PERIÓDICAS AL CAPITAL DE MONTO IDÉNTICO  ok
--2	AMORTIZACIONES PERIÓDICAS AL CAPITAL DE MONTO DIFERENTE  ok
--3	AMORTIZACIONES IRREGULARES PAGOS REALIZADOS EN ESP  DE TIEMPO DIFERENTES
--4	AMORTIZACIÓN  ÚNICA AL VENCIMIENTO}

{--INTERÉS  (IN)
--0	NO APLICA  OPERACIONES FUERA DE BALANCE
--1	SI SE COBRAN EN SU TOTALIDAD POR ANTICIPADO
--2	SI SE COBRAN EN SU TOTALIDAD AL VENCIMIENTO
--3	SI SE COBRAN EN FORMA PERIÓDICA}
      //ONFIGURA POP UP MENU

{POP UP MENU
Agrega Periodo de Capital
Agrega Cuotas Periodicas de Capital
Borra Periodo de Capital
Modificar Monto

Agrega Periodo de Interés
Borra Periodo de Interés}
      edIMP_CREDITO.Enabled := False;
      edF_INICIO.Enabled := False;

      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_CONTRATO.Control := iedID_CONTRATO;
      Objeto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO;
      Objeto.DESC_L_PRODUCTO.Control := edDESC_PRODUCTO;
      Objeto.CVE_AMORTIZACION.Control:=edCVE_AMORTIZACION;
      Objeto.CVE_PAG_INTERES.Control:=edCVE_PAG_INTERES;
      Objeto.UNIDAD_TIEMPO_CP.Control := cbUNIDAD_TIEMPO_CP;
      Objeto.NUM_UNIDADES_CP.Control := edNUM_UNIDADES_CP;
      Objeto.DIA_PAGO_CAP.Control := cbDIA_PAGO_CAP;
      Objeto.UNIDAD_TIEMPO_IN.Control := cbUNIDAD_TIEMPO_IN;
      Objeto.NUM_UNIDADES_IN.Control := edNUM_UNIDADES_IN;
      Objeto.DIA_PAGO_INT.Control := cbDIA_PAGO_INT;
      Objeto.DESC_AMORTIZA.Control := edDESC_TIPO_AMORT;
      Objeto.DESC_PAG_INTERES.Control := edDESC_PAGO_INT;
      Objeto.F_INI_PAG_CAP.Control := edF_INI_PAG_CAP;
      Objeto.F_INI_PAG_INT.Control := edF_INI_PAG_INT;
      Objeto.F_FIN_PERGRA_FA.Control:= edF_FIN_PERGRA_FA; // --- ASOR --- MAYO 2016 ---

      Objeto.IMP_CUOTA.Control := edIMP_CREDITO;
      Objeto.F_VENCIMIENTO.Control := edF_INICIO;

      edID_CREDITO.Text := IntToStr(Objeto.VGCredito);
      // --- INICIO --- ASOR --- MAYO 2016 ---
      vlsql  := 'SELECT NVL(cc.B_FINANC_ADIC, ''F'') B_FINANC_ADIC, F_FIN_PERGRA_FA FROM   cr_Credito cc WHERE  cc.ID_CREDITO = ' + IntToStr(Objeto.VGCredito);
      vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
      vlSB_FINANC_ADIC:= vlQry.FieldByName('B_FINANC_ADIC').AsString;
      if (vlQry.FieldByName('B_FINANC_ADIC').AsString = 'V') then
        begin
             Label9.Visible:= True;
             edF_FIN_PERGRA_FA.Visible:= True;
             edF_FIN_PERGRA_FA.Text:= vlQry.FieldByName('F_FIN_PERGRA_FA').AsString;
        end
      Else
        begin
             Label9.Visible:= false;
             edF_FIN_PERGRA_FA.Visible:= false;
             edF_FIN_PERGRA_FA.Destroy;
      end;
      // --- FIN --- ASOR --- MAYO 2016 ---

      ArmaCadenaSQLCuotas;
      ReQueryCuotas;
      ValidaSitCred;

      CargadeTablaPYME1.Visible:=false;
      ModificarMontodeComision1.Visible:=false;



end;

procedure TWCrgencuota.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CONTRATO.Control := nil;
      Objeto.CVE_PRODUCTO_CRE.Control := nil;
      Objeto.DESC_L_PRODUCTO.Control := nil;
      Objeto.CVE_AMORTIZACION.Control:=nil;
      Objeto.CVE_PAG_INTERES.Control:=nil;
      Objeto.UNIDAD_TIEMPO_CP.Control := nil;
      Objeto.NUM_UNIDADES_CP.Control := nil;
      Objeto.DIA_PAGO_CAP.Control := nil;
      Objeto.UNIDAD_TIEMPO_IN.Control := nil;
      Objeto.NUM_UNIDADES_IN.Control := nil;
      Objeto.DIA_PAGO_INT.Control := nil;
      Objeto.DESC_AMORTIZA.Control := nil;
      Objeto.DESC_PAG_INTERES.Control := nil;
      Objeto.F_INI_PAG_CAP.Control := nil;
      Objeto.F_INI_PAG_INT.control := nil;
      Objeto.F_FIN_PERGRA_FA.control:= nil;       // --- INICIO --- ASOR --- MAYO 2016 ---
      Objeto.IMP_CUOTA.Control := nil;
      Objeto.F_VENCIMIENTO.Control := nil;
end;

procedure TWCrgencuota.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrgencuota.SGClBusMovNoAutCalcRow(Sendet: TObject;
  DataSet: TDataSet; CurrRow: Integer; RowCaso: TRowCaso;
  var ShowRow: Boolean);
begin
     Case RoWCaso of
     rcRowBegin : begin
                        if ((DataSet.FieldByName('SIT_CAPITAL_CP').AsString='PA') OR
                            (DataSet.FieldByName('SIT_CAPITAL_IN').AsString='PA') OR
                            (DataSet.FieldByName('SIT_CAPITAL_CO').AsString='PA')) then
                           SGClBusMovNoAut.SetFontColor(clGray);
                        if ((DataSet.FieldByName('SIT_CAPITAL_CP').AsString='AC') OR
                            (DataSet.FieldByName('SIT_CAPITAL_IN').AsString='AC') OR
                            (DataSet.FieldByName('SIT_CAPITAL_CO').AsString='AC')) then
                           SGClBusMovNoAut.SetFontColor(clGreen);
                        if ((DataSet.FieldByName('SIT_CAPITAL_CP').AsString='IM') OR
                            (DataSet.FieldByName('SIT_CAPITAL_IN').AsString='IM') OR
                            (DataSet.FieldByName('SIT_CAPITAL_CO').AsString='IM')) then
                           SGClBusMovNoAut.SetFontColor(clRed);
                        If DataSet.FieldByName('NUM_PERIODO_CP').AsString <> '' THEN
                        Begin
                           vgCountCap := vgCountCap + 1;
                           lbTOT_PER_CAP.Caption := IntToStr(vgCountCap);
                           vgImpCap := vgImpCap + DataSet.FieldByName('IMP_CUOTA_CP').AsFloat;
                           lbTOT_IMP_CAP.Caption := Format(CFORMAT_DINERO,[ vgImpCap]);
                        end;
                        If DataSet.FieldByName('NUM_PERIODO_IN').AsString <> '' THEN
                        Begin
                           vgCountIn := vgCountIn + 1;
                           lbTOT_PER_INT.Caption := IntToStr(vgCountIn);
                        end;
                        If DataSet.FieldByName('NUM_PERIODO_CO').AsString <> '' THEN
                        Begin
                           vgCountCo := vgCountCo + 1;
                           lbTOT_PER_COM.Caption := IntToStr(vgCountCo);
                        end;
                  end
     end; // Case
end;

procedure TWCrgencuota.AgregarPeriodo1Click(Sender: TObject);
begin
     ShowMessage('Favor de Indicar la nueva fecha de Vencimiento e Importe de Capital');
     edF_INICIO.Enabled := True;
     dtpF_INICIO.Enabled := True;
     edIMP_CREDITO.Enabled := True;
//     Objeto.F_VENCIMIENTO.AsDateTime := Objeto.Apli.DameFechaEmpresa;
     Objeto.F_VENCIMIENTO.AsDateTime := StrToDateTime(SGClBusMovNoAut.CellStr['F_VENCIMIENTO',SGClBusMovNoAut.SG.Selection.Top]);
     btAGREGA_CUOTA.Caption := 'Agregar Cuota';
     btAGREGA_CUOTA.Enabled := True;
     Objeto.VGCveAccesorioAdd := 'CP';
     Objeto.VGCveAccion := 'AG';
     btCANCELA.Visible := True;
     edF_INICIO.SetFocus;
end;

procedure TWCrgencuota.AgregarPeriododeInters1Click(Sender: TObject);
begin
     ShowMessage('Favor de Indicar la nueva fecha de Vencimiento');
     edF_INICIO.Enabled := True;
     dtpF_INICIO.Enabled := True;
//     Objeto.F_VENCIMIENTO.AsDateTime := Objeto.Apli.DameFechaEmpresa;
     Objeto.F_VENCIMIENTO.AsDateTime := StrToDateTime(SGClBusMovNoAut.CellStr['F_VENCIMIENTO',SGClBusMovNoAut.SG.Selection.Top]);
     btAGREGA_CUOTA.Caption := 'Agregar Cuota';
     btAGREGA_CUOTA.Enabled := True;
     Objeto.VGCveAccion := 'AG';
     Objeto.VGCveAccesorioAdd := 'IN';
     Objeto.IMP_CUOTA.AsFloat := 0;
     edF_INICIO.SetFocus;
     btCANCELA.Visible := True;
end;

procedure TWCrgencuota.btAGREGA_CUOTAClick(Sender: TObject);
var
   Y          :  Integer;
   X          :  Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRGENCUOT_AGREG',True,True) then
   begin
     if Objeto.VGCveAccion = 'MD' then
     begin
         Objeto.IMP_CUOTA.GetFromControl;
         X:=SGClBusMovNoAut.SG.Selection.Left;
         Y:=SGClBusMovNoAut.SG.Selection.Top;

         if Objeto.VGCveAccesorioAdd='CP' then
            ModImpCuota(StrToInt(SGClBusMovNoAut.CellStr['NUM_PERIODO_CP',Y]),'CP',Objeto.IMP_CUOTA.AsFloat);

         if Objeto.VGCveAccesorioAdd='CF' then
         ModImpCuota(StrToInt(SGClBusMovNoAut.CellStr['NUM_PERIODO_CO',Y]),'CF',Objeto.IMP_CUOTA.AsFloat);
     end;

     if Objeto.VGCveAccion = 'AG' then
     begin
         Objeto.F_VENCIMIENTO.GetFromControl;
         Objeto.IMP_CUOTA.GetFromControl;
         AgregaCuota(Objeto.VGCveAccesorioAdd, edF_INICIO.Text, edIMP_CREDITO.Text);
     end;

     if Objeto.VGCveAccesorioAdd='CP' then
     begin
        vlsql:=' SELECT ID_CREDITO FROM CR_FND_COMISION '+
               '  WHERE ID_CREDITO = '+ IntToStr(Objeto.VGCredito) +
               '    AND CVE_COMISION  IN (SELECT CVE_COMISION FROM CR_CAT_COMISION WHERE DESC_COMISION LIKE ''%CUOTA%GARANT%'')';

        vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
        try
           if vlQry <> nil then CalculaFega;
        finally
           if vlQry <> nil then vlQry.free;
        end;
     end;

     edF_INICIO.Clear;
     edIMP_CREDITO.Enabled := False;
     edF_INICIO.Enabled := False;
     dtpF_INICIO.Enabled := False;
     edIMP_CREDITO.Enabled := False;
     ArmaCadenaSQLCuotas;
     ReQueryCuotas;
     ValidaTabla(Objeto.VGCredito);
   end;
end;

procedure TWCrgencuota.BorrarPeriodo1Click(Sender: TObject);
var
   Y          :  Integer;
   X          :  Integer;
begin
     X:=SGClBusMovNoAut.SG.Selection.Left;
     Y:=SGClBusMovNoAut.SG.Selection.Top;
     if ValidaDato(SGClBusMovNoAut.CellStr['NUM_PERIODO_CP',Y]) then
     Begin
       EliminaCuota(StrToInt(SGClBusMovNoAut.CellStr['NUM_PERIODO_CP',Y]),'CP');
       ArmaCadenaSQLCuotas;
       ReQueryCuotas;
       btCANCELA.Visible := True;
     end;
end;

procedure TWCrgencuota.btREINICIA_TABLAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGENCUOT_REINI',True,True) then
   begin
      if MessageDlg('¿Desea generar la tabla de amortización en base a las condiciones iniciales de la disposición?.  Los cambios realizados a la misma anteriormente se perderán',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
         if not(FindCredOrigen) then Begin
            ArmaTabla;
         end
         else Begin
            RestauraTabla;
         end;
         ArmaCadenaSQLCuotas;
         ReQueryCuotas;

         vlsql:=' SELECT ID_CREDITO FROM CR_COMISION '+
                '  WHERE ID_CREDITO = '+ IntToStr(Objeto.VGCredito) +
                '    AND CVE_COMISION  IN (SELECT CVE_COMISION FROM CR_CAT_COMISION WHERE DESC_COMISION LIKE ''%CUOTA%GARANT%'')';

         vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
         try
           if vlQry <> nil then CalculaFega;
         finally
           if vlQry <> nil then vlQry.free;
         end;

         ValidaTabla(Objeto.VGCredito);
      end;
   end;
end;

procedure TWCrgencuota.BorrarPeriododeInters1Click(Sender: TObject);
var
   Y          :  Integer;
   X          :  Integer;
begin
     X:=SGClBusMovNoAut.SG.Selection.Left;
     Y:=SGClBusMovNoAut.SG.Selection.Top;
     if ValidaDato(SGClBusMovNoAut.CellStr['NUM_PERIODO_IN',Y]) then
     Begin
       EliminaCuota(StrToInt(SGClBusMovNoAut.CellStr['NUM_PERIODO_IN',Y]),'IN');
       ArmaCadenaSQLCuotas;
       ReQueryCuotas;
       btCANCELA.Visible := True;
     end;
end;

procedure TWCrgencuota.ModificarMonto1Click(Sender: TObject);
var
   Y          :  Integer;
   X          :  Integer;
begin
     X:=SGClBusMovNoAut.SG.Selection.Left;
     Y:=SGClBusMovNoAut.SG.Selection.Top;
     if ValidaDato(SGClBusMovNoAut.CellStr['NUM_PERIODO_CP',Y]) then
     Begin
        ShowMessage('Favor de Indicar le nuevo Importe de Capital para el periodo ' +
                     SGClBusMovNoAut.CellStr['NUM_PERIODO_CP',Y]);
        edIMP_CREDITO.Enabled := True;
        btAGREGA_CUOTA.Caption := 'Modifica cuota Capital';
        Objeto.VGCveAccion := 'MD';
        Objeto.VGCveAccesorioAdd := 'CP';
        edIMP_CREDITO.SetFocus;
        btCANCELA.Visible := True;
     end;
end;



procedure TWCrgencuota.btVALIDA_TABLAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGENCUOT_VALID',True,True) then
      ValidaTabla(Objeto.VGCredito);
end;

procedure TWCrgencuota.btCANCELAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGENCUOT_CANC',True,True) then
   begin
     edIMP_CREDITO.Enabled := False;
     btCANCELA.Visible := False;
     edF_INICIO.Enabled := False;
     btAGREGA_CUOTA.Enabled := False;
     dtpF_INICIO.Enabled := False;
     btVALIDA_TABLA.SetFocus;
   end;
end;

procedure TWCrgencuota.edIMP_CREDITOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edIMP_CREDITO,True,'',True);
end;

procedure TWCrgencuota.edIMP_CREDITOKeyPress(Sender: TObject;
  var Key: Char);
begin
   ShowMessage('Salida');
end;

procedure TWCrgencuota.InterForma1DespuesShow(Sender: TObject);
begin
   lbIMP_DISP.Caption := Format(CFORMAT_DINERO,[ Objeto.IMP_CREDITO.AsFloat ] );
   ValidaTabla(Objeto.VGCredito);
end;

function TWCrgencuota.FindCredOrigen: Boolean;
var vlsql: String;    vlCount: Integer;
Begin
     vlsql:= ' SELECT COUNT(*) COUNT FROM CR_CREDITO_REST WHERE ID_CREDITO = ' + IntToStr(Objeto.VGCredito) +
             '  AND FOL_GRUPO_RENUEVA = ' + IntToStr(Objeto.VGCredRenuev);
     GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlCount,False);
     if vlCount = 1 then
        Result := True
     else
        Result := False;
end;


// <LOLS 24112005 SE AGREGA CARGA DE TABLA NAFIN>
function TWCrgencuota.CargaTablaPYME(sFileName: TFileName): Integer;
var F       : TextFile;
    aBuffer : TArrayString;
    bHeader : Boolean;
    bParser : Boolean;
    nItem   : Integer;
    Cnt     : Integer;
    strBuf  : String;
    sList   : TStringList;
    sAccesorio : String;
    sCveAmort  : String;
begin
  Result   := 0;
  sList    := TStringList.Create;
  Try
    {$I-}
    AssignFile( F, sFileName );
    FileMode := 0;
    Reset(F);
    bHeader  := False;
    bParser  := False;
    sList.Clear;
    //
    while not Eof(F) do
    begin
      bParser  := True;
      ReadLn( F, strBuf  );
      nItem := ParseQuotedString( aBuffer, strBuf, C_SEPARATOR, C_TOKEN_TEXTO );
      if bHeader = False then
      begin
        if nItem = 4 then
          bHeader := ( aBuffer[0] = C_NUM_AMORT   ) and // El primer campo debe ser
                     ( aBuffer[1] = C_FECHA_AMORT ) and
                     ( aBuffer[2] = C_TIPO_CUOTA  ) and
                     ( aBuffer[3] = C_MONTO_AMORT );
        //ends_if
      end else begin
        if nItem = 4 then
        begin
          GetSQLStr( 'SELECT CVE_REFERENCIA FROM CR_GRUPO_CLAVE WHERE VALOR = '  + SQLStr(aBuffer[2]),
                     Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'CVE_REFERENCIA', sAccesorio, False );
          if sAccesorio = '' then
          begin
            bParser  := False;
            MessageDlg( 'No encontré la clave de accesorio de la descripción ' + aBuffer[2],
                        mtError, [mbOk], 0 );
            break;
          end;
          //
          if not ((sAccesorio = C_TBPYME_CP) or (sAccesorio = C_TBPYME_IN) or (sAccesorio = C_TBPYME_CPIN)) then
          begin
            bParser  := False;
            MessageDlg( 'Relación "Tipo de Cuota" - "Clave de Accesorio" desconocida ' +
                        aBuffer[2] + ' - ' + sAccesorio, mtError, [mbOk], 0 );
            break;
          end;
          //
          sList.Add( aBuffer[0] + '|' +  aBuffer[1] + '|' +  sAccesorio + '|' +  aBuffer[3] );
        end;
      end;//ends_if_bHeader_=_False_then
      Application.ProcessMessages;
    end;
    {$I+}
    CloseFile(F);
    //
    if bParser then
    begin
      if sList.Count > 0 then
      begin
        MessageDlg( 'Se encontraron ' + IntToStr(sList.Count) +  ' ' +
                    'registro(s) en el archivo.', mtInformation, [mbOk], 0 );
        // Borra la tabla
        RunSQL('DELETE FROM CR_SOL_CUOTA WHERE ID_REF_SOL_CUOTA = ' + IntToStr(Objeto.VGCredito),
               Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
        //
        sCveAmort := Objeto.CVE_AMORTIZACION.AsString;
        for Cnt := 0 to sList.Count - 1 do
        begin
          strBuf := sList.Strings[Cnt];
          ParseQuotedString( aBuffer, strBuf, '|', C_TOKEN_TEXTO );
          if ( aBuffer[2] = C_TBPYME_CP ) or ( aBuffer[2] = C_TBPYME_CPIN ) then
          begin
            Objeto.CVE_AMORTIZACION.AsString := '3';
            Objeto.F_VENCIMIENTO.AsDateTime  := StrToDate ( aBuffer[1] );
            Objeto.IMP_CUOTA.AsFloat         := StrToFloat( aBuffer[3] );
            AgregaCuota('CP', edF_INICIO.Text, edIMP_CREDITO.Text);
          end;//if_(_aBuffer[2]_=_C_TBPYME_CP_)_or_(_aBuffer[2]_=_C_TBPYME_CPIN_)_then
          if ( aBuffer[2] = C_TBPYME_IN ) or ( aBuffer[2] = C_TBPYME_CPIN ) then
          begin
            Objeto.F_VENCIMIENTO.AsDateTime := StrToDate( aBuffer[1] );
            Objeto.IMP_CUOTA.AsFloat        := 0;
            AgregaCuota('IN', edF_INICIO.Text, edIMP_CREDITO.Text);
          end;//ends_if_(_aBuffer[2]_=_C_TBPYME_IN_)_or_(_aBuffer[2]_=_C_TBPYME_CPIN_)_then
        end;
        Objeto.CVE_AMORTIZACION.AsString := sCveAmort;
        //
        ArmaCadenaSQLCuotas;
        ReQueryCuotas;
        ValidaTabla(Objeto.VGCredito);
      end else
        MessageDlg( 'No se encontraron registros en el archivo. Favor de verificar que sea un archivo válido',
                     mtInformation, [mbOk], 0 );
    end;
  Finally
    If Assigned(sList) Then Begin sList.Clear; sList.Free; End;
    SetLength(aBuffer,0);
    //
  End;
end;


procedure TWCrgencuota.CargadeTablaPYME1Click(Sender: TObject);
begin
{  if OpenDialog1.Execute then
  begin
    if MessageDlg( 'Esta seguro de procesar el archivo' + #13#10 + OpenDialog1.FileName,
                mtInformation, [mbOK, mbCancel ], 0 ) = mrOk then
    begin
      CargaTablaPYME( OpenDialog1.FileName );
    end;
  end else
    MessageDlg( 'No seleccionó archivo a cargar. Operación cancelada', mtInformation,
                [mbOK], 0 );
´}                
end;
// </LOLS>


procedure TWCrgencuota.SGClBusMovNoAutDblClick(Sender: TObject);
var IsChecked : Boolean;
    I, nMax_Periodo : Integer;
    vlnumperIN, vlnumperK, vlsql, vlsql2, vtempcve : String;
    vlQry, vlQry2 : TQuery;
begin
   if SGClBusMovNoAut.SG.Col=15 then  //COLUMNA DEL FINANCIAMIENTO ADICIONAL
   begin
      IsChecked:= ( SGClBusMovNoAut.CellStr[ 'B_FINAN_ADIC_IN', SGClBusMovNoAut.SG.Row ] = Co_Verdad );
      if IsChecked then
      begin
         If (MessageDlg(CO_MENSAJE_FIN
                        + #13 + 'Periodo : ' + SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_IN', SGClBusMovNoAut.SG.Row] +
                        ', Vencimiento : ' + SGClBusMovNoAut.CellStr[ 'F_VENCIMIENTO', SGClBusMovNoAut.SG.Row]
                        , mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
         begin
            ActualizaFinAdic(StrToInt(edID_CREDITO.Text),StrToInt(SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_IN', SGClBusMovNoAut.SG.Row]),Co_Falso);
            SGClBusMovNoAut.CellStr[ 'B_FINAN_ADIC_IN', SGClBusMovNoAut.SG.Row ] := Co_Falso;

            ActualizaCveFinAdic(StrToInt(edID_CREDITO.Text),StrToInt(SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_IN', SGClBusMovNoAut.SG.Row]),'');
            SGClBusMovNoAut.CellStr[ 'CVE_FINAN_ADIC_IN', SGClBusMovNoAut.SG.Row] := '';

            Rtfinan.Enabled:=false;
            Rtfinan.ItemIndex:=-1;
         end;
      end
      else
      begin
         { Aplica Financiamiento }
         // --- INICIO --- ASOR --- MAYO 2016 --- VALIDACIÓN DE ACTIVACIPON DE FINANCIAMIENTO ADICIONAL DE ACUERDO CON LA DISPOSICION ---
         if vlSB_FINANC_ADIC = 'F' then
              begin
                   MessageDlg('No se puede activar el financiamiento adicional de este periodo ya que no '
                              + #13 + 'tiene activada esta opción en la disposición, favor de actualizar la '
                              + #13 + 'información de la diposición y vuelva a intentar ' , mtError,[mbOK],0);

                   Exit;
         end;
         // --- FIN --- ASOR --- MAYO 2016 ---

         nMax_Periodo := 0;
         For I := 3 To SGClBusMovNoAut.SG.RowCount - 1 Do
         Begin
            vlnumperIN := SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_IN', I ];
            If IsInteger(vlnumperIN) Then
            Begin
               If (StrToInt(vlnumperIN) > nMax_Periodo) Then
                  nMax_Periodo := StrToInt(vlnumperIN);
            End;
         End;

         vlnumperK:= SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_CP', SGClBusMovNoAut.SG.Row];

         If (nMax_Periodo = StrToInt(SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_IN', SGClBusMovNoAut.SG.Row ])) Then
         begin
            Rtfinan.Enabled:=false;
            Rtfinan.ItemIndex:=-1;
            MessageDlg('El último periodo no se puede Financiar.', mtError, [mbOk], 0);
         end
         Else
         If IsInteger(vlnumperK) Then
         begin
            Rtfinan.Enabled:=false;
            Rtfinan.ItemIndex:=-1;
            MessageDlg('No se puede modificar el Financiamiento de un periodo de Capital.'
                       + #13 + 'Periodo : ' + SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_IN', SGClBusMovNoAut.SG.Row] +
                       ', Vencimiento : ' + SGClBusMovNoAut.CellStr[ 'F_VENCIMIENTO', SGClBusMovNoAut.SG.Row]
                       , mtError, [mbOk], 0);
         end
         Else
           begin
              // --- INICIO --- ASOR --- ABRIL 2016 --- VALIDACIÓN DE LA ACTIVACION DE UN PERIODO DE F.A. ---
            IF vlSB_FINANC_ADIC = 'V' THEN
              begin
                if (edF_FIN_PERGRA_FA.text <> '') then
                begin
                    if StrToDateTime(SGClBusMovNoAut.CellStr[ 'F_VENCIMIENTO', SGClBusMovNoAut.SG.Row]) >
                       StrToDateTime(edF_FIN_PERGRA_FA.text) then
                    Begin
                            MessageDlg('La fecha del vencimeinto del periodo seleccionado es mayor a ' + #13 +
                                       '         la fecha de fin de periodo de gracia de F. A. ' + #13 +
                                       ' ' + #13 +
                                       'No se puede activar el financiamiento para este periodo'
                                       + #13 + 'Periodo : ' + SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_IN', SGClBusMovNoAut.SG.Row] +
                                       ', Vencimiento : ' + SGClBusMovNoAut.CellStr[ 'F_VENCIMIENTO', SGClBusMovNoAut.SG.Row]
                                       , mtWarning, [mbOK], 0);

                            Exit;
                    end;
                end;
            end;
              // --- FIN --- ASOR ---

              If (MessageDlg(CO_MENSAJE_FIN
                             + #13 + 'Periodo : ' + SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_IN', SGClBusMovNoAut.SG.Row] +
                             ', Vencimiento : ' + SGClBusMovNoAut.CellStr[ 'F_VENCIMIENTO', SGClBusMovNoAut.SG.Row]
                             , mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
                 begin
                    ActualizaFinAdic(StrToInt(edID_CREDITO.Text),StrToInt(SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_IN', SGClBusMovNoAut.SG.Row]),Co_Verdad);
                    SGClBusMovNoAut.CellStr[ 'B_FINAN_ADIC_IN', SGClBusMovNoAut.SG.Row ] := Co_Verdad;

                    vtempcve:=Co_Directo;

                    vlsql:= ' SELECT P.CVE_FINANC_ADIC ' +
                            ' FROM CR_CREDITO C, ' +
                            '      CR_CONTRATO L, ' +
                            '      CR_PRODUCTO P, ' +
                            '      CONTRATO CTTO ' +
                            ' WHERE CTTO.ID_EMPRESA =  ' + IntToStr(Objeto.Apli.IdEmpresa) +
                            '       AND L.ID_CONTRATO   = C.ID_CONTRATO ' +
                            '       AND L.FOL_CONTRATO  = C.FOL_CONTRATO ' +
                            '       AND L.CVE_PRODUCTO_CRE  = P.CVE_PRODUCTO_CRE ' +
                            '       AND CTTO.ID_CONTRATO    = L.ID_CONTRATO ' +
                            '       AND P.B_FINANC_ADIC =  ''' + Co_Verdad + '''' +
                            '       AND L.B_FINANC_ADIC =  ''' + Co_Verdad + '''' +
                            '       AND C.B_FINANC_ADIC =  ''' + Co_Verdad + '''' +
                            '       AND C.ID_CREDITO = '+ edID_CREDITO.Text;

                    vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
                    try
                       if vlQry <> nil then
                          if Trim(vlQry.FieldByName('CVE_FINANC_ADIC').AsString)<>'' then vtempcve:=vlQry.FieldByName('CVE_FINANC_ADIC').AsString;
                    finally
                       if vlQry <> nil then vlQry.free;
                    end;

                    ActualizaCveFinAdic(StrToInt(edID_CREDITO.Text),StrToInt(SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_IN', SGClBusMovNoAut.SG.Row]),vtempcve);
                    SGClBusMovNoAut.CellStr[ 'CVE_FINAN_ADIC_IN', SGClBusMovNoAut.SG.Row] := vtempcve;

                    Rtfinan.Enabled:=true;
                    vlNumRow:=SGClBusMovNoAut.SG.Row;
                    if (SGClBusMovNoAut.CellStr[ 'CVE_FINAN_ADIC_IN', SGClBusMovNoAut.SG.Row ]=Co_Directo) then Rtfinan.ItemIndex:=0;
                    if (SGClBusMovNoAut.CellStr[ 'CVE_FINAN_ADIC_IN', SGClBusMovNoAut.SG.Row ]=Co_Prorrateo) then Rtfinan.ItemIndex:=1;
                 end;
         end;
      end;
   end;
end;

procedure TWCrgencuota.SGClBusMovNoAutMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   if (SGClBusMovNoAut.CellStr[ 'B_FINAN_ADIC_IN', ToIndex ]=co_Verdad) then
   begin
      if (SGClBusMovNoAut.CellStr[ 'SIT_CAPITAL_IN', ToIndex ] <> Co_LQ) then
      begin
         Rtfinan.Enabled:=true;
         vlNumRow:=ToIndex;
         if (SGClBusMovNoAut.CellStr[ 'CVE_FINAN_ADIC_IN', ToIndex ]=Co_Directo) then Rtfinan.ItemIndex:=0;
         if (SGClBusMovNoAut.CellStr[ 'CVE_FINAN_ADIC_IN', ToIndex ]=Co_Prorrateo) then Rtfinan.ItemIndex:=1;
      end;
      if (SGClBusMovNoAut.CellStr[ 'SIT_CAPITAL_IN', ToIndex ] = Co_LQ) then
      begin
         Rtfinan.Enabled:=false;
         Rtfinan.ItemIndex:=-1;
      end;
   end;
   if (SGClBusMovNoAut.CellStr[ 'B_FINAN_ADIC_IN', ToIndex ]=co_Falso) then
   begin
      Rtfinan.Enabled:=false;
      Rtfinan.ItemIndex:=-1;
   end;
end;

procedure TWCrgencuota.RtfinanClick(Sender: TObject);
var I:integer;
begin
   if Rtfinan.ItemIndex=0 then
   begin
      if (cbAllFA.Checked) then
      begin
         If (MessageDlg(CO_MENSAJE_CVEFIN
                        + #13 + 'Periodo : ' + SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_IN', SGClBusMovNoAut.SG.Row] +
                        ', Vencimiento : ' + SGClBusMovNoAut.CellStr[ 'F_VENCIMIENTO', SGClBusMovNoAut.SG.Row]
                       , mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
         begin
            For I := 3 To SGClBusMovNoAut.SG.RowCount - 1 Do
            Begin
               if (SGClBusMovNoAut.CellStr[ 'B_FINAN_ADIC_IN', I ] = Co_Verdad) then
               begin
                  if (SGClBusMovNoAut.CellStr[ 'SIT_CAPITAL_IN', I ] <> Co_LQ) then
                  begin
                     ActualizaCveFinAdic(StrToInt(edID_CREDITO.Text),StrToInt(SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_IN', I]),Co_Directo);
                     SGClBusMovNoAut.CellStr[ 'CVE_FINAN_ADIC_IN', I ] := Co_Directo;
                  end;
               end;
            End;
            Rtfinan.Enabled:=false;
            Rtfinan.ItemIndex:=-1;
         end
         else
         begin
            Rtfinan.Enabled:=false;
            Rtfinan.ItemIndex:=-1;
         end;
         cbAllFA.Checked:=false;
      end;

      if not(cbAllFA.Checked) then
      begin
         if SGClBusMovNoAut.CellStr[ 'CVE_FINAN_ADIC_IN', vlNumRow] = Co_Prorrateo then
         begin
            If (SGClBusMovNoAut.CellStr[ 'SIT_CAPITAL_IN', vlNumRow] = Co_LQ) Then
            begin
               MessageDlg('No se puede modificar el Financiamiento de un periodo liquidado.', mtError, [mbOk], 0);
               Rtfinan.ItemIndex:=1;
            end
            else
            begin
               If (MessageDlg(CO_MENSAJE_CVEFIN
                              + #13 + 'Periodo : ' + SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_IN', SGClBusMovNoAut.SG.Row] +
                              ', Vencimiento : ' + SGClBusMovNoAut.CellStr[ 'F_VENCIMIENTO', SGClBusMovNoAut.SG.Row]
                              , mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
               begin
                  ActualizaCveFinAdic(StrToInt(edID_CREDITO.Text),StrToInt(SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_IN', vlNumRow]),Co_Directo);
                  SGClBusMovNoAut.CellStr[ 'CVE_FINAN_ADIC_IN', vlNumRow ] := Co_Directo;
               end
               else Rtfinan.ItemIndex:=1;
            end;
         end;
      end;
   end;

   if Rtfinan.ItemIndex=1 then
   begin
      if (cbAllFA.Checked) then
      begin
         If (MessageDlg(CO_MENSAJE_CVEFIN
                        , mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
         begin
            For I := 3 To SGClBusMovNoAut.SG.RowCount - 1 Do
            Begin
               if (SGClBusMovNoAut.CellStr[ 'B_FINAN_ADIC_IN', I ] = Co_Verdad) then
               begin
                  if (SGClBusMovNoAut.CellStr[ 'SIT_CAPITAL_IN', I ] <> Co_LQ) then
                  begin
                     ActualizaCveFinAdic(StrToInt(edID_CREDITO.Text),StrToInt(SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_IN', I]),Co_Prorrateo);
                     SGClBusMovNoAut.CellStr[ 'CVE_FINAN_ADIC_IN', I ] := Co_Prorrateo;
                  end;
               end;
            End;
            Rtfinan.Enabled:=false;
            Rtfinan.ItemIndex:=-1;
         end
         else
         begin
            Rtfinan.Enabled:=false;
            Rtfinan.ItemIndex:=-1;
         end;
         cbAllFA.Checked:=false;
      end;

      if not(cbAllFA.Checked) then
      begin
         if SGClBusMovNoAut.CellStr[ 'CVE_FINAN_ADIC_IN', vlNumRow] = Co_Directo then
         begin
            If (SGClBusMovNoAut.CellStr[ 'SIT_CAPITAL_IN', vlNumRow] = Co_LQ) Then
            begin
               MessageDlg('No se puede modificar el Financiamiento de un periodo liquidado.', mtError, [mbOk], 0);
               Rtfinan.ItemIndex:=0;
            end
            else
            begin
               If (MessageDlg(CO_MENSAJE_CVEFIN
                              + #13 + 'Periodo : ' + SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_IN', SGClBusMovNoAut.SG.Row] +
                              ', Vencimiento : ' + SGClBusMovNoAut.CellStr[ 'F_VENCIMIENTO', SGClBusMovNoAut.SG.Row]
                              , mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
               begin
                  ActualizaCveFinAdic(StrToInt(edID_CREDITO.Text),StrToInt(SGClBusMovNoAut.CellStr[ 'NUM_PERIODO_IN', vlNumRow]),Co_Prorrateo);
                  SGClBusMovNoAut.CellStr[ 'CVE_FINAN_ADIC_IN', vlNumRow ] := Co_Prorrateo;
               end
               else Rtfinan.ItemIndex:=0;
            end;
         end;
      end;
   end;
end;

procedure TWCrgencuota.cbAllFAClick(Sender: TObject);
begin
   if cbAllFA.Checked then
   begin
      Rtfinan.ItemIndex:=-1;
      Rtfinan.Enabled:=true;
   end;   
end;

procedure TWCrgencuota.edArchivoEntradaExit(Sender: TObject);
var
  vlMesg: string;
  vlSalida: boolean;
begin
  vlMesg := 'Debe definir el nombre del archivo';
  if (edArchivoEntrada.Text = '') then vlSalida := False;
  InterForma1.ValidaExit(edArchivoEntrada, vlSalida, vlMesg, True);
end;

procedure TWCrgencuota.sbArchivoEntradaClick(Sender: TObject);
var
  correcto: boolean;
begin
  correcto := False;
  while not correcto and odArchivoEntrada.Execute do
  begin
    edArchivoEntrada.Text := odArchivoEntrada.FileName;
    if FileExists(odArchivoEntrada.FileName) then
      correcto := True
    else
    begin
      edArchivoEntrada.Text := '';
      ShowMessage('Reporte inexistente. Por favor seleccione un reporte existente');
    end;
  end;
end;

procedure TWCrgencuota.bbImportarClick(Sender: TObject);
var
  LCID: integer;
  fila: integer;
  vlAccesorio : string;

  //Variables del reporte
  vlNUM_PERIODO   : String;
  vlF_VENCIMIENTO : String;
  vlF_PROGRAMADA  : String;
  vlIMP_CUOTA     : String;

  valida: String;

  //Para la inserción a la base de datos
  vlSQL: string;
  vlQry : TQuery;

  //Para la barra de progreso
  ani: TAniBarThread;
  r: TRect;

  vlMesg:string;
begin
   if Objeto.ValidaAccesoEsp('TCRGENCUOT_IMPOR',True,True) then
   begin
      if Trim(edArchivoEntrada.Text) = '' then Exit;

      if Rconcepto.ItemIndex=0 then
      begin
         vlAccesorio :='CP';

         if ( (Objeto.CVE_AMORTIZACION.AsInteger = 1) or (Objeto.CVE_AMORTIZACION.AsInteger = 4)) then
         begin
             if (Rcarga.ItemIndex=0) or (Rcarga.ItemIndex=2) then
             begin
                MessageDlg('Con esta Clave de Amortizacion NO se permite cambiar las Amortizaciones', mtError,[mbOk], 0);
                Exit;
             end;
         end;

         if Rcarga.ItemIndex=0 then
         begin
            if (Objeto.CVE_AMORTIZACION.AsInteger = 2) then vlMesg:='Este proceso actualizara el Importe de las Cuotas de Capital. ¿Desea continuar?';
            if (Objeto.CVE_AMORTIZACION.AsInteger = 3) then vlMesg:='Este proceso eliminara las Cuotas de Capital. ¿Desea continuar?';
         end;
         if Rcarga.ItemIndex=1 then
         begin
            vlMesg:='Este proceso actualizara las Fechas Programadas de Capital. ¿Desea continuar?';
         end;
         if Rcarga.ItemIndex=2 then
         begin
            if (Objeto.CVE_AMORTIZACION.AsInteger = 2) then vlMesg:='Este proceso actualizara el Importe de las Cuotas de Capital y actualizara las Fechas Programadas de Capital . ¿Desea continuar?';
            if (Objeto.CVE_AMORTIZACION.AsInteger = 3) then vlMesg:='Este proceso eliminara las Cuotas de Capital y actualizara las Fechas Programadas de Capital. ¿Desea continuar?';
         end;
      end;
      if Rconcepto.ItemIndex=1 then
      begin
         vlAccesorio :='IN';
         vlMesg:='Este proceso actualizara las Fechas Programadas de Interes. ¿Desea continuar?';
      end;

      if MessageDlg(vlMesg, mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin

         if (vlAccesorio='CP') and (Objeto.CVE_AMORTIZACION.AsInteger = 3) AND
            ((Rcarga.ItemIndex=0) or (Rcarga.ItemIndex=2)) then
         begin
            vlSQL :=' DELETE FROM CR_SOL_CUOTA '+
                    '  WHERE ID_REF_SOL_CUOTA = ' + IntToStr(Objeto.VGCredito) +
                    '    AND CVE_ACCESORIO = '''+vlAccesorio+''' ';
            RunSQL(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
         end;

      {* Inicia las variables para actualizar el medidor *}

      r := pAniBar.ClientRect;
      InflateRect(r, -pAniBar.BevelWidth, -pAniBar.BevelWidth);
      ani := TAniBarThread.Create(pAniBar, r, pAniBar.color, clBlue, 100);
      bbImportar.Enabled := False;
      Application.ProcessMessages;

      LCID := GetUserDefaultLCID;
      //Si el campo con el nombre del reporte está vacio lee la información de
      //de la base de datos y utiliza el reporte
      if edArchivoEntrada.Text <> '' then
      begin
        {* Instrucciones para el archivo excel de entrada
         *}
        ExcelApplicationI.Connect;
        // Hace a Excel invisible
        ExcelApplicationI.Visible[LCID] := False;
        ExcelApplicationI.DisplayAlerts[LCID] := False;

        // Abre el archivo
        ExcelApplicationI.Workbooks.Open(edArchivoEntrada.Text,
          EmptyParam, //UpdateLinks: OleVariant
          EmptyParam, //ReadOnly: OleVariant
          EmptyParam, //Format: OleVariant
          EmptyParam, //Password: OleVariant
          EmptyParam, //WriteResPassword: OleVariant
          EmptyParam, //IgnoreReadOnlyRecommended: OleVariant
          EmptyParam, //Orign: OleVariant
          EmptyParam, //Delimiter: OleVariant
          EmptyParam, //Editable: OleVariant
          EmptyParam, //Notify: OleVariant
          EmptyParam, //Converter: OleVariant
          EmptyParam, //AddToMru: OleVariant
          LCID
          );
        ExcelWorkbookI.ConnectTo(ExcelApplicationI.ActiveWorkbook);
        ExcelWorksheetI.ConnectTo(ExcelApplicationI.ActiveSheet as _Worksheet);
      end;

      {* Extrae la información del archivo Excel *}
      fila := 2;
      try
        try
          //Para cada renglón con información

          valida := ExcelWorksheetI.Cells.Item[fila, 'A']; //PERIODO
          while (valida <> '') do
          begin
            // Extrae la información
            vlNUM_PERIODO    := ExcelWorksheetI.Cells.Item[fila, 'A'];
            vlF_VENCIMIENTO  := ExcelWorksheetI.Cells.Item[fila, 'B'];
            vlIMP_CUOTA      := ExcelWorksheetI.Cells.Item[fila, 'C'];
            vlF_PROGRAMADA   := ExcelWorksheetI.Cells.Item[fila, 'D'];

            if (Rconcepto.ItemIndex=0) then
            begin
               if (Rcarga.ItemIndex=0) or (Rcarga.ItemIndex=2) then
               begin
                  if (Objeto.CVE_AMORTIZACION.AsInteger = 3) then
                      AgregaCuota(vlAccesorio, vlF_VENCIMIENTO, vlIMP_CUOTA);

                  if (Objeto.CVE_AMORTIZACION.AsInteger = 2) then
                      ModImpCuota2(StrToInt(vlNUM_PERIODO),'CP',StrToFloat(vlIMP_CUOTA));
               end;
               if (Rcarga.ItemIndex=1) or (Rcarga.ItemIndex=2) then
               begin
                  ModFProgCuota(StrToInt(vlNUM_PERIODO), vlAccesorio, StrToInt(vlF_PROGRAMADA), 0);
               end;
            end;

            if (Rconcepto.ItemIndex=1) then
            begin
               ModFProgCuota(StrToInt(vlNUM_PERIODO), vlAccesorio, StrToInt(vlF_PROGRAMADA), 0);
            end;

            inc(fila);
            valida := ExcelWorksheetI.Cells.Item[fila, 'A']; //PERIODO
          end;

        finally
          //detiene la barra de progreso
          bbImportar.Enabled := True;
          ani.Terminate;

          ExcelApplicationI.Visible[LCID] := True;
          ExcelWorksheetI.Disconnect;
          ExcelWorkbookI.Disconnect;
          ExcelApplicationI.Disconnect;
        end;

        if (vlAccesorio='CP') then
        begin
           if (Rcarga.ItemIndex=0) or (Rcarga.ItemIndex=2) then
           begin
              vlsql:=' SELECT ID_CREDITO FROM CR_FND_COMISION '+
                     '  WHERE ID_CREDITO = '+ IntToStr(Objeto.VGCredito) +
                     '    AND CVE_COMISION  IN (SELECT CVE_COMISION FROM CR_CAT_COMISION WHERE DESC_COMISION LIKE ''%CUOTA%GARANT%'')';

              vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
              try
                 if vlQry <> nil then CalculaFega;
              finally
                 if vlQry <> nil then vlQry.free;
              end;
           end;
        end;

        //Si no existe error notifica al usuario que se generó el reporte
        ShowMessage('Informacion leida con Exito');
        edArchivoEntrada.Text:='';
        ArmaCadenaSQLCuotas;
        ReQueryCuotas;
        ValidaTabla(Objeto.VGCredito);
        ValidaSitCred;
      except
        on e: Exception do
        begin
          MessageDlg('No se importó completo el archivo.' +
            IntToStr(Fila) + e.Message, mtError, [mbOK], 0);
        end;
      end;
      end;
   end;
end;

procedure TWCrgencuota.ModificarMontodeComision1Click(Sender: TObject);
var
   Y          :  Integer;
   X          :  Integer;
begin
     X:=SGClBusMovNoAut.SG.Selection.Left;
     Y:=SGClBusMovNoAut.SG.Selection.Top;
     if ValidaDato(SGClBusMovNoAut.CellStr['NUM_PERIODO_CO',Y]) then
     Begin
        ShowMessage('Favor de Indicar le nuevo Importe de Comision para el periodo ' +
                     SGClBusMovNoAut.CellStr['NUM_PERIODO_CO',Y]);
        edIMP_CREDITO.Enabled := True;
        btAGREGA_CUOTA.Caption := 'Modifica cuota Comision';
        Objeto.VGCveAccion := 'MD';
        Objeto.VGCveAccesorioAdd := 'CF';
        edIMP_CREDITO.SetFocus;
        btCANCELA.Visible := True;
     end;
end;

procedure TWCrgencuota.RconceptoClick(Sender: TObject);
begin
   if Rconcepto.ItemIndex=0 then
      Rcarga.Visible:=true
   else
      Rcarga.Visible:=false;
end;

procedure TWCrgencuota.bbCamFhProgClick(Sender: TObject);
var vlAccesorio : string;
    vlMesg:string;
begin
   if Objeto.ValidaAccesoEsp('TCRGENCUOT_FHPRO',True,True) then
   begin

      if Rconcepto.ItemIndex=0 then
      begin
         vlAccesorio :='CP';
         vlMesg:='Este proceso actualizara las Fechas Programadas de Capital. ¿Desea continuar?';
      end;   
      if Rconcepto.ItemIndex=1 then
      begin
         vlAccesorio :='IN';
         vlMesg:='Este proceso actualizara las Fechas Programadas de Interes. ¿Desea continuar?';
      end;

      if MessageDlg(vlMesg, mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
          ModFProgCuota(0, vlAccesorio, 0, 1);

          //Si no existe error notifica al usuario que se generó el reporte
          ArmaCadenaSQLCuotas;
          ReQueryCuotas;
          ValidaTabla(Objeto.VGCredito);
          ValidaSitCred;
      end;
   end;  
end;

end.








