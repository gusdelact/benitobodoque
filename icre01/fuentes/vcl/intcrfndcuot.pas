// Sistema         : Clase de CrGenCuota
// Fecha de Inicio : 15/07/2004
// Función forma   : Clase de CrGenCuota
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
// Modificaciones  : LOLS 24 NOV 2005 SE AGREGA CARGA DE TABLA NAFIN
Unit IntCRFNDcuot;

interface      
                                      
uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,InterEdit,IntSGCtrl,Menus,
//unidades adicionales
IntParamCre, IntGenCre, Excel97, OleServer, IntCrActPa, Gauges;

Type
 TCRFNDcuot= class;

  TWCRFNDcuot=Class(TForm)
    InterForma1 : TInterForma;
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
    lbTOT_PER_CAP: TLabel;
    Label11: TLabel;
    btCANCELA: TBitBtn;
    edIMP_CREDITO: TInterEdit;
    Label2: TLabel;
    lbTOT_IMP_CAP: TLabel;
    lbIMP_DISP: TLabel;
    N2: TMenuItem;
    OpenDialog1: TOpenDialog;
    lbIMP_FALTANTE: TLabel;
    Label10: TLabel;
    GroupBox4: TGroupBox;
    lbArchivoEntrada: TLabel;
    edArchivoEntrada: TEdit;
    sbArchivoEntrada: TSpeedButton;
    bbImportar: TBitBtn;
    pAniBar: TPanel;
    ExcelWorksheetI: TExcelWorksheet;
    ExcelApplicationI: TExcelApplication;
    ExcelWorkbookI: TExcelWorkbook;
    odArchivoEntrada: TOpenDialog;
    Label6: TLabel;
    lbTOT_PER_COM: TLabel;
    ModificarMontodeComision1: TMenuItem;
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
    procedure SGClBusMovNoAutMoveRow(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure edArchivoEntradaExit(Sender: TObject);
    procedure sbArchivoEntradaClick(Sender: TObject);
    procedure bbImportarClick(Sender: TObject);
    procedure ModificarMontodeComision1Click(Sender: TObject);
    private
    { Private declarations }
       vgCountCap               : Integer;
       vgImpCap                 : Double;
       vgCountIn                : Integer;
       vgCountCo                : Integer;

    public
    { Public declarations }
    Objeto : TCRFNDcuot;

    Procedure   ActualizaCveFinAdic(PEIDCredito, PEnumperiodo : Integer; PEFinAdic:String);
    Procedure   ValidaTabla(PPIDCredito : Integer);
    Procedure   AgregaCuota(PPAccesorio, PPF_Vencimiento, PPImp_cuota : String);
    Procedure   EliminaCuota(PPNumCuota : Integer;PPAccesorio : String);
    Procedure   ModImpCuota(PPNumCuota : Integer;PPAccesorio : String;PPImpCuota : Double);
    Procedure   ModImpCuota2(PPNumCuota : Integer;PPAccesorio : String;PPImpCuota : Double);    
    Procedure   ArmaCadenaSQLCuotas;
    Procedure   ReQueryCuotas;
    Function    ValidaDato(pDato: String): Boolean;
    Procedure   ValidaSitCred;
    procedure   CalculaFega;    

end;
 TCRFNDcuot= class(TInterFrame)
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

        ParamCre                 : TParamCre;

        VGCredito                : Integer;
        VGEntDesc                : String;
        VGPrograma               : String;
        VGCredRenuev             : Integer;
        CadenaSql                : String;
        VGFolioTabla             : Integer;
        VGCveAccesorioAdd        : String;
        VGCveAccion              : String;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    stpGenPeriodos: Boolean;
        function    stpDelCuotas  : Boolean;

      published
      end;

var  vlNumRow:Integer;
     vlQry : TQuery;
     vlsql : string;     

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

  Co_Verdad = 'V';
  Co_Falso  = 'F';
  Co_LQ = 'LQ';

implementation

{$R *.DFM}


constructor TCRFNDcuot.Create( AOwner : TComponent );
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
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCRFNDcuotHlp';
      ShowMenuReporte:=True;

end;

Destructor TCRFNDcuot.Destroy;
begin inherited;
end;


function TCRFNDcuot.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCRFNDcuot;
begin
   W:=TWCRFNDcuot.Create(Self);
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


Function TCRFNDcuot.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICRFNDCUOT.IT','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCRFNDcuot.stpGenPeriodos: Boolean;
var vlStpGenPer : TStoredProc;
    vlResult    : Integer;
    vlTxResult  : String;
begin
  Result      := False;
  vlStpGenPer := TStoredProc.Create(nil);
  try
    with vlStpGenPer do
    begin
      StoredProcName := 'PKGCRREDESCTO.STPGENPERIODOS';
      DatabaseName   := Apli.DataBaseName;
      SessionName    := Apli.SessionName;
      Params.Clear;
      Params.CreateParam( ftFloat,  'PEMetodo',       ptInput  ); //
      Params.CreateParam( ftFloat,  'PEIDCredito',    ptInput  ); //
      Params.CreateParam( ftString, 'PECveEntidad',   ptInput  ); //
{ROIM 03052007  CAMBIO LIBERACIÓN FACTORAJE ELECTRONICO ENTIDAD DESCONTADORA}
      Params.CreateParam( ftString, 'PECveFndEntDes',   ptInput  ); //
{/ROIM}
      Params.CreateParam( ftString, 'PECvePrograma',  ptInput  ); //
      Params.CreateParam( ftFloat,  'PENumPeriodo',   ptInput  ); //
      Params.CreateParam( ftString, 'PECveUsuAlta',   ptInput  ); //
      Params.CreateParam( ftString, 'PEBCommit',      ptInput  ); //
      Params.CreateParam( ftFloat,  'PSResultado',    ptOutput ); //
      Params.CreateParam( ftString, 'PSTxResultado',  ptOutput ); //
      //
      ParamByName( 'PEMetodo'      ).AsInteger := 1;
      ParamByName( 'PEIDCredito'   ).AsInteger := VGCredito;
      ParamByName( 'PECveEntidad'  ).AsString  := VGEntDesc;
{ROIM 03052007  CAMBIO LIBERACIÓN FACTORAJE ELECTRONICO ENTIDAD DESCONTADORA}
      ParamByName( 'PECveFndEntDes'  ).AsString  := VGEntDesc;
{/ROIM}
      ParamByName( 'PECvePrograma' ).AsString  := VGPrograma;
      ParamByName( 'PENumPeriodo'  ).Clear;
      ParamByName( 'PECveUsuAlta'  ).AsString  := Apli.Usuario;
      ParamByName( 'PEBCommit'     ).AsString  := 'V';
      //
      ExecProc;
      vlResult    := ParamByName( 'PSResultado' ).AsInteger;
      vlTxResult  := ParamByName( 'PSTxResultado' ).AsString;
      if vlResult <> 0 then
      begin
        ShowMessage( 'Error al generar los períodos de la solicitud de redescuento.' + coCRLF+
                     'Avise a Sistemas'+ coCRLF+
                     'Código  : ' + IntToStr(vlResult) + coCRLF+
                     'Mensaje : ' + vlTxResult );
      end else
        Result := True;
    end;
  finally
    if vlStpGenPer <> nil then
       vlStpGenPer.Free;
  end;
end;


function TCRFNDcuot.stpDelCuotas: Boolean;
var vlStpDelCuot : TStoredProc;
    vlResult    : Integer;
    vlTxResult  : String;
begin
  Result      := False;
  vlStpDelCuot := TStoredProc.Create(nil);
  try
    with vlStpDelCuot do
    begin
      StoredProcName := 'PKGCRREDESCTO.STPDELCUOTAFND';
      DatabaseName   := Apli.DataBaseName;
      SessionName    := Apli.SessionName;
      Params.Clear;
      Params.CreateParam( ftFloat,  'PEIDCredito',    ptInput  ); //
      Params.CreateParam( ftString, 'PECVE_ENT_DES',   ptInput  ); //
      Params.CreateParam( ftString, 'PECVE_FND_PROG',  ptInput  ); //
      Params.CreateParam( ftString, 'PEBCommit',      ptInput  ); //
      Params.CreateParam( ftFloat,  'PSResultado',    ptOutput ); //
      Params.CreateParam( ftString, 'PSTxResultado',  ptOutput ); //
      //
      ParamByName( 'PEIDCredito'   ).AsInteger := VGCredito;
      ParamByName( 'PECVE_ENT_DES'  ).AsString  := VGEntDesc;
      ParamByName( 'PECVE_FND_PROG' ).AsString  := VGPrograma;
      ParamByName( 'PEBCommit'     ).AsString  := 'V';
      //
      ExecProc;
      vlResult    := ParamByName( 'PSResultado' ).AsInteger;
      vlTxResult  := ParamByName( 'PSTxResultado' ).AsString;
      if vlResult <> 0 then
      begin
        ShowMessage( 'Error al eliminar las cuotas de la solicitud de redescuento.' + coCRLF+
                     'Avise a Sistemas'+ coCRLF+
                     'Código  : ' + IntToStr(vlResult) + coCRLF+
                     'Mensaje : ' + vlTxResult );
      end else
        Result := True;
    end;
  finally
    if vlStpDelCuot <> nil then
       vlStpDelCuot.Free;
  end;
end;


(***********************************************FORMA CrGenCuota********************)
(*                                                                              *)
(*  FORMA DE CrGenCuota                                                            *)
(*                                                                              *)
(***********************************************FORMA CrGenCuota********************)
Procedure TWCRFNDcuot.ValidaSitCred;
begin
   if ( Objeto.SIT_CREDITO.AsString = 'AC' ) or
      ( Objeto.SIT_CREDITO.AsString = 'CA' ) then
   Begin
      AgregarPeriodo1.Enabled := False;
      BorrarPeriodo1.Enabled := False;
      ModificarMonto1.Enabled := False;
      AgregarPeriododeInters1.Enabled := False;
      BorrarPeriododeInters1.Enabled := False;

      btAGREGA_CUOTA.Enabled := False;
      btREINICIA_TABLA.Enabled:= False;
      btVALIDA_TABLA.Enabled := False;
      btCANCELA.Enabled := False;

      ModificarMontodeComision1.Enabled:=False;

      bbImportar.Enabled := False;
      sbArchivoEntrada.Enabled := False;
   end
   else
   Begin
      AgregarPeriodo1.Enabled := Objeto.CVE_AMORTIZACION.AsInteger = 3;
      BorrarPeriodo1.Enabled := Objeto.CVE_AMORTIZACION.AsInteger = 3;
      ModificarMonto1.Enabled := ((Objeto.CVE_AMORTIZACION.AsInteger = 2) or (Objeto.CVE_AMORTIZACION.AsInteger = 3));

      bbImportar.Enabled := ((Objeto.CVE_AMORTIZACION.AsInteger = 2) or (Objeto.CVE_AMORTIZACION.AsInteger = 3));
      sbArchivoEntrada.Enabled := ((Objeto.CVE_AMORTIZACION.AsInteger = 2) or (Objeto.CVE_AMORTIZACION.AsInteger = 3));

      AgregarPeriododeInters1.Enabled := Objeto.CVE_PAG_INTERES.AsInteger = 3;
      BorrarPeriododeInters1.Enabled := Objeto.CVE_PAG_INTERES.AsInteger = 3;

      ModificarMontodeComision1.Enabled := ((Objeto.CVE_AMORTIZACION.AsInteger = 2) or (Objeto.CVE_AMORTIZACION.AsInteger = 3));

      btAGREGA_CUOTA.Enabled := True;
      btREINICIA_TABLA.Enabled:= True;
      btVALIDA_TABLA.Enabled := True;
      btCANCELA.Enabled := True;
   end;
end;

Function TWCRFNDcuot.ValidaDato(pDato: String): Boolean;
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

Procedure   TWCRFNDcuot.ActualizaCveFinAdic(PEIDCredito, PEnumperiodo : Integer; PEFinAdic:String);
var STPActCveFinAdic  : TStoredProc;
begin
   try
     STPActCveFinAdic:=TStoredProc.Create(Nil);
     STPActCveFinAdic.DatabaseName:=Objeto.Apli.DatabaseName;
     STPActCveFinAdic.SessionName:=Objeto.Apli.SessionName;
     STPActCveFinAdic.StoredProcName:='PKGCRREDESCTO.STP_UPDCVEFINADIC';
     STPActCveFinAdic.Params.CreateParam(ftInteger,'peIdCredito',ptInput);
     STPActCveFinAdic.Params.CreateParam(ftString,'PECVE_ENT_DES',ptInput);
     STPActCveFinAdic.Params.CreateParam(ftString,'PECVE_FND_PROG',ptInput);
     STPActCveFinAdic.Params.CreateParam(ftString, 'peCveFinanAdic'   ,ptInput);
     STPActCveFinAdic.Params.CreateParam(ftInteger,'peNumPeriodo'   ,ptInput);
     STPActCveFinAdic.Params.CreateParam(ftInteger,'peTabla'   ,ptInput);     
     STPActCveFinAdic.Params.CreateParam(ftString, 'PEBCOMMIT'     ,ptInput);

     STPActCveFinAdic.Params.CreateParam(ftFloat,'psResultado',ptOutput);
     STPActCveFinAdic.Params.CreateParam(ftString,'psTxResultado',ptOutput);

     STPActCveFinAdic.Prepare;

     STPActCveFinAdic.ParamByName('peIdCredito').AsInteger := PEIDCredito;
     STPActCveFinAdic.ParamByName('PECVE_ENT_DES').AsString := Objeto.VGEntDesc;
     STPActCveFinAdic.ParamByName('PECVE_FND_PROG').AsString := Objeto.VGPrograma;
     STPActCveFinAdic.ParamByName('peCveFinanAdic').AsString     := PEFinAdic;
     STPActCveFinAdic.ParamByName('peNumPeriodo').AsInteger    := PEnumperiodo;
     STPActCveFinAdic.ParamByName('peTabla').AsInteger         := 0; //MODIFICA CR_FND_CUOTA
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
end;


Procedure   TWCRFNDcuot.ValidaTabla(PPIDCredito : Integer);
var STPObtSuc  : TStoredProc;
begin
     lbIMP_FALTANTE.Font.Color := clActiveCaption;
     lbIMP_FALTANTE.Caption := '0';
     try
          STPObtSuc:=TStoredProc.Create(Nil);
          STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
          STPObtSuc.SessionName:=Objeto.Apli.SessionName;
          STPObtSuc.StoredProcName:='PKGCRREDESCTO.STPVALIDAAMORT';
          STPObtSuc.Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PECVE_ENT_DES',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PECVE_FND_PROG',ptInput);
          STPObtSuc.Params.CreateParam(ftFloat,'PSDiferencia',ptOutput);
          STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
          STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
          STPObtSuc.Prepare;
          STPObtSuc.ParamByName('PEIDCREDITO').AsInteger := PPIDCredito;
          STPObtSuc.ParamByName('PECVE_ENT_DES').AsString := Objeto.VGEntDesc;
          STPObtSuc.ParamByName('PECVE_FND_PROG').AsString := Objeto.VGPrograma;
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

Procedure   TWCRFNDcuot.ModImpCuota(PPNumCuota : Integer;PPAccesorio : String;PPImpCuota : Double);
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

                STPObtSuc.StoredProcName:='PKGCRREDESCTO.STPMODIMPCONCEPTOS';
                STPObtSuc.Params.CreateParam(ftInteger,'PEIDCredito',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECVE_ENT_DES',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECVE_FND_PROG',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECveAccesorio',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECveAmortiza',ptInput);
                STPObtSuc.Params.CreateParam(ftInteger,'PENumPeriodo',ptInput);
                STPObtSuc.Params.CreateParam(ftFloat,'PEImpCuota',ptInput);
                STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
                STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
                STPObtSuc.Prepare;
                STPObtSuc.ParamByName('PEIDCredito').AsInteger := Objeto.VGCredito;
                STPObtSuc.ParamByName('PECVE_ENT_DES').AsString := Objeto.VGEntDesc;
                STPObtSuc.ParamByName('PECVE_FND_PROG').AsString := Objeto.VGPrograma;
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

Procedure   TWCRFNDcuot.ModImpCuota2(PPNumCuota : Integer;PPAccesorio : String;PPImpCuota : Double);
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

                STPObtSuc.StoredProcName:='PKGCRREDESCTO.STPMODIMPCONCEPTOS';
                STPObtSuc.Params.CreateParam(ftInteger,'PEIDCredito',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECVE_ENT_DES',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECVE_FND_PROG',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECveAccesorio',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECveAmortiza',ptInput);
                STPObtSuc.Params.CreateParam(ftInteger,'PENumPeriodo',ptInput);
                STPObtSuc.Params.CreateParam(ftFloat,'PEImpCuota',ptInput);
                STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
                STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
                STPObtSuc.Prepare;
                STPObtSuc.ParamByName('PEIDCredito').AsInteger := Objeto.VGCredito;
                STPObtSuc.ParamByName('PECVE_ENT_DES').AsString := Objeto.VGEntDesc;
                STPObtSuc.ParamByName('PECVE_FND_PROG').AsString := Objeto.VGPrograma;
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


Procedure   TWCRFNDcuot.EliminaCuota(PPNumCuota : Integer;PPAccesorio : String);
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

                STPObtSuc.StoredProcName:='PKGCRREDESCTO.STPELIMINACONCEPTOS';
                STPObtSuc.Params.CreateParam(ftInteger,'PEIDCredito',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECVE_ENT_DES',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECVE_FND_PROG',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECveAccesorio',ptInput);
                STPObtSuc.Params.CreateParam(ftString,'PECveAmortiza',ptInput);
                STPObtSuc.Params.CreateParam(ftInteger,'PENumPeriodo',ptInput);
                STPObtSuc.Params.CreateParam(ftInteger,'PEIDEMPRESA',ptInput);
                STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
                STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
                STPObtSuc.Prepare;
                STPObtSuc.ParamByName('PEIDCredito').AsInteger := Objeto.VGCredito;
                STPObtSuc.ParamByName('PECVE_ENT_DES').AsString := Objeto.VGEntDesc;
                STPObtSuc.ParamByName('PECVE_FND_PROG').AsString := Objeto.VGPrograma;
                STPObtSuc.ParamByName('PECveAccesorio').AsString := PPAccesorio;
                if PPAccesorio = 'CP' then
                   STPObtSuc.ParamByName('PECveAmortiza').AsString := Objeto.CVE_AMORTIZACION.AsString
                else
                   STPObtSuc.ParamByName('PECveAmortiza').AsString := Objeto.CVE_PAG_INTERES.AsString;
                //end if;
                STPObtSuc.ParamByName('PENumPeriodo').AsFloat := PPNumCuota;
                STPObtSuc.ParamByName('PEIDEMPRESA').AsInteger := Objeto.Apli.IdEmpresa;

                STPObtSuc.ExecProc;
                if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
                     ShowMessage('PROBLEMAS AL BORRAR CUOTA: ' + IntToStr(STPObtSuc.ParamByName('PSResultado').AsInteger) + STPObtSuc.ParamByName('PSTXResultado').AsString);
                //end if;
           finally
                  STPObtSuc.Free;
           end;
      end;
end;


Procedure  TWCRFNDcuot.AgregaCuota(PPAccesorio, PPF_Vencimiento, PPImp_cuota : String);
var STPObtSuc  : TStoredProc;
begin
     try
          STPObtSuc:=TStoredProc.Create(Nil);
          STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
          STPObtSuc.SessionName:=Objeto.Apli.SessionName;
          STPObtSuc.StoredProcName:='PKGCRREDESCTO.STPAGREGACONCEPTOS';
          STPObtSuc.Params.CreateParam(ftInteger,'PEIDCredito',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PECVE_ENT_DES',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PECVE_FND_PROG',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PECveAccesorio',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PECveAmortiza',ptInput);
          STPObtSuc.Params.CreateParam(ftDateTime,'PEFVencimiento',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PECveDireccion',ptInput);
          STPObtSuc.Params.CreateParam(ftFloat,'PEImpCuota',ptInput);
          STPObtSuc.Params.CreateParam(ftInteger,'PEIDEMPRESA',ptInput);
          STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
          STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
          STPObtSuc.Prepare;
          STPObtSuc.ParamByName('PEIDCredito').AsInteger := Objeto.VGCredito;
          STPObtSuc.ParamByName('PECVE_ENT_DES').AsString := Objeto.VGEntDesc;
          STPObtSuc.ParamByName('PECVE_FND_PROG').AsString := Objeto.VGPrograma;
          STPObtSuc.ParamByName('PECveAccesorio').AsString := PPAccesorio;
          if PPAccesorio = 'CP' then
             STPObtSuc.ParamByName('PECveAmortiza').AsString := Objeto.CVE_AMORTIZACION.AsString
          else
             STPObtSuc.ParamByName('PECveAmortiza').AsString := Objeto.CVE_PAG_INTERES.AsString;
          //end if;
          STPObtSuc.ParamByName('PEFVencimiento').AsDateTime := StrToDate(PPF_Vencimiento); //Objeto.F_VENCIMIENTO.AsDateTime;
          STPObtSuc.ParamByName('PECveDireccion').AsString := 'D0';
          STPObtSuc.ParamByName('PEImpCuota').AsFloat := StrToFloat(PPImp_cuota); //Objeto.IMP_CUOTA.AsFloat;
          STPObtSuc.ParamByName('PEIDEMPRESA').AsInteger := Objeto.Apli.IdEmpresa;
          STPObtSuc.ExecProc;
          if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
               ShowMessage('PROBLEMAS AL AGREGAR CUOTA: ' + IntToStr(STPObtSuc.ParamByName('PSResultado').AsInteger) + STPObtSuc.ParamByName('PSTXResultado').AsString);
          //end if;
     finally
            STPObtSuc.Free;
     end;
end;


procedure TWCRFNDcuot.CalculaFega;
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
          ParamByName( 'PECveEntidad'  ).AsString  := Objeto.VGEntDesc;
          ParamByName( 'PECvePrograma' ).AsString  := Objeto.VGPrograma;
          ParamByName( 'PENumPeriodo'  ).Clear;
          ParamByName( 'PETCred'       ).AsString  := 'PS';
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

Procedure  TWCRFNDcuot.ArmaCadenaSQLCuotas;
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
                 ' CIN.B_FINAN_ADIC B_FINAN_ADIC_IN, ' +
                 ' CIN.CVE_FINAN_ADIC CVE_FINAN_ADIC_IN, ' +
                 #39 + '   ' + #39 + ' AS B3, ' +
                 ' CCO.NUM_PERIODO NUM_PERIODO_CO, ' +
                 ' CCO.PLAZO PLAZO_CO, ' +
                 ' CCO.IMP_CUOTA IMP_CUOTA_CO, ' +
                 ' CCO.SIT_CAPITAL SIT_CAPITAL_CO ' +
                 ' FROM ' +
                 ' CR_FND_CUOTA CCP, ' +
                 ' CR_FND_CUOTA CIN, ' +
                 ' CR_FND_CUOTA CCO, ' +
                 ' (SELECT DISTINCT(F_VENCIMIENTO) AS F_VENCIMIENTO, F_PROG_PAGO, ID_CREDITO, CVE_FND_ENT_DES, CVE_FND_PROGRAMA' +
                 '  FROM CR_FND_CUOTA ' +
                 '  WHERE ID_CREDITO = ' + IntToStr(Objeto.VGCredito) +
                 '  AND CVE_FND_ENT_DES = ''' +Objeto.VGEntDesc+'''' +
                 '  AND CVE_FND_PROGRAMA = ''' +Objeto.VGPrograma+ ''''+
                 //  SE REALIZA EL UNION PARA QUE MUESTRE EL PRIMER PERIODO DE COMISION
                 '  UNION ' +
                 '  SELECT F_VENCIMIENTO, F_PROG_PAGO, ID_CREDITO, CVE_FND_ENT_DES, CVE_FND_PROGRAMA' +
                 '  FROM CR_FND_CUOTA ' +
                 '  WHERE ID_CREDITO = ' + IntToStr(Objeto.VGCredito) +
                 '  AND NUM_PERIODO = 1 ' +
                 '  AND CVE_FND_ENT_DES = ''' +Objeto.VGEntDesc+'''' +
                 '  AND CVE_FND_PROGRAMA = ''' +Objeto.VGPrograma+ ''''+
                 '  AND CVE_ACCESORIO = '+#39+'CF'+#39+
                 //
                 ') FEC ' +
                 ' WHERE CCP.ID_CREDITO (+)= FEC.ID_CREDITO ' +
                 ' AND   CCP.CVE_FND_ENT_DES (+)= FEC.CVE_FND_ENT_DES ' +
                 ' AND   CCP.CVE_FND_PROGRAMA (+)= FEC.CVE_FND_PROGRAMA ' +
                 ' AND   CCP.CVE_ACCESORIO (+)= '+#39+'CP'+#39+
                 ' AND   CCP.F_VENCIMIENTO (+)= FEC.F_VENCIMIENTO ' +

                 ' AND   CIN.ID_CREDITO (+)= FEC.ID_CREDITO ' +
                 ' AND   CIN.CVE_FND_ENT_DES (+)= FEC.CVE_FND_ENT_DES ' +
                 ' AND   CIN.CVE_FND_PROGRAMA (+)= FEC.CVE_FND_PROGRAMA ' +
                 ' AND   CIN.CVE_ACCESORIO (+)= '+#39+'IN'+#39+
                 ' AND   CIN.F_VENCIMIENTO (+)= FEC.F_VENCIMIENTO ' +
                 ' AND   CCO.ID_CREDITO (+)= FEC.ID_CREDITO ' +
                 ' AND   CCO.CVE_ACCESORIO (+)= '+#39+'CF'+#39+
                 ' AND   CCO.F_VENCIMIENTO (+)= FEC.F_VENCIMIENTO ' +

                 ' ORDER BY FEC.F_VENCIMIENTO ';
end;
//**********************************
Procedure  TWCRFNDcuot.ReQueryCuotas;
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
               SGClBusMovNoAut.Titulo2 := '.                                              |                   CAPITAL                  |                       INTERES                          |                CONCEPTOS              .';
               SGClBusMovNoAut.addQry(Q,True,True,-1,-1,-1,True);

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


procedure TWCRFNDcuot.FormShow(Sender: TObject);
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

      Objeto.IMP_CUOTA.Control := edIMP_CREDITO;
      Objeto.F_VENCIMIENTO.Control := edF_INICIO;

      edID_CREDITO.Text := IntToStr(Objeto.VGCredito);
      ArmaCadenaSQLCuotas;
      ReQueryCuotas;
      ValidaSitCred;
end;

procedure TWCRFNDcuot.FormDestroy(Sender: TObject);
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

      Objeto.IMP_CUOTA.Control := nil;
      Objeto.F_VENCIMIENTO.Control := nil;
end;

procedure TWCRFNDcuot.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCRFNDcuot.SGClBusMovNoAutCalcRow(Sendet: TObject;
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

procedure TWCRFNDcuot.AgregarPeriodo1Click(Sender: TObject);
begin
     ShowMessage('Favor de Indicar la nueva fecha de Vencimiento e Importe de Capital');
     edF_INICIO.Enabled := True;
     dtpF_INICIO.Enabled := True;
     edIMP_CREDITO.Enabled := True;
//     Objeto.F_VENCIMIENTO.AsDateTime := Objeto.Apli.DameFechaEmpresa;

     if (SGClBusMovNoAut.CellStr['F_VENCIMIENTO',SGClBusMovNoAut.SG.Selection.Top])<>'' then
         Objeto.F_VENCIMIENTO.AsDateTime := StrToDateTime(SGClBusMovNoAut.CellStr['F_VENCIMIENTO',SGClBusMovNoAut.SG.Selection.Top]);
     btAGREGA_CUOTA.Caption := 'Agregar Cuota';
     btAGREGA_CUOTA.Enabled := True;
     Objeto.VGCveAccesorioAdd := 'CP';
     Objeto.VGCveAccion := 'AG';
     btCANCELA.Visible := True;
     edF_INICIO.SetFocus;
end;

procedure TWCRFNDcuot.AgregarPeriododeInters1Click(Sender: TObject);
begin
     ShowMessage('Favor de Indicar la nueva fecha de Vencimiento');
     edF_INICIO.Enabled := True;
     dtpF_INICIO.Enabled := True;
//     Objeto.F_VENCIMIENTO.AsDateTime := Objeto.Apli.DameFechaEmpresa;

     if (SGClBusMovNoAut.CellStr['F_VENCIMIENTO',SGClBusMovNoAut.SG.Selection.Top])<>'' then
        Objeto.F_VENCIMIENTO.AsDateTime := StrToDateTime(SGClBusMovNoAut.CellStr['F_VENCIMIENTO',SGClBusMovNoAut.SG.Selection.Top]);
     btAGREGA_CUOTA.Caption := 'Agregar Cuota';
     btAGREGA_CUOTA.Enabled := True;
     Objeto.VGCveAccion := 'AG';
     Objeto.VGCveAccesorioAdd := 'IN';
     Objeto.IMP_CUOTA.AsFloat := 0;
     edF_INICIO.SetFocus;
     btCANCELA.Visible := True;
end;

procedure TWCRFNDcuot.btAGREGA_CUOTAClick(Sender: TObject);
var
   Y          :  Integer;
   X          :  Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRFNDCUOT_AGREG',True,True) then
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

procedure TWCRFNDcuot.BorrarPeriodo1Click(Sender: TObject);
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

procedure TWCRFNDcuot.btREINICIA_TABLAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRFNDCUOT_REINI',True,True) then
   begin
       if MessageDlg('¿Desea generar la tabla de amortización en base a las condiciones iniciales de la disposición?.  Los cambios realizados a la misma anteriormente se perderán',
          mtConfirmation,[mbYes, mbNo], 0) = mrYes then
       Begin
          if Objeto.stpDelCuotas then
          begin
             if Objeto.stpGenPeriodos then
             begin
                ShowMessage('Se generarion las cuotas ');
                ArmaCadenaSQLCuotas;
                ReQueryCuotas;

                vlsql:=' SELECT ID_CREDITO FROM CR_FND_COMISION '+
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
   end;
end;

procedure TWCRFNDcuot.BorrarPeriododeInters1Click(Sender: TObject);
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

procedure TWCRFNDcuot.ModificarMonto1Click(Sender: TObject);
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



procedure TWCRFNDcuot.btVALIDA_TABLAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRFNDCUOT_VALID',True,True) then
      ValidaTabla(Objeto.VGCredito);
end;

procedure TWCRFNDcuot.btCANCELAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRFNDCUOT_CANC',True,True) then
   begin
     edIMP_CREDITO.Enabled := False;
     btCANCELA.Visible := False;
     edF_INICIO.Enabled := False;
     btAGREGA_CUOTA.Enabled := False;
     dtpF_INICIO.Enabled := False;
     btVALIDA_TABLA.SetFocus;
   end;
end;

procedure TWCRFNDcuot.edIMP_CREDITOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edIMP_CREDITO,True,'',True);
end;

procedure TWCRFNDcuot.edIMP_CREDITOKeyPress(Sender: TObject;
  var Key: Char);
begin
   ShowMessage('Salida');
end;

procedure TWCRFNDcuot.InterForma1DespuesShow(Sender: TObject);
begin
   lbIMP_DISP.Caption := Format(CFORMAT_DINERO,[ Objeto.IMP_CREDITO.AsFloat ] );
   ValidaTabla(Objeto.VGCredito);
end;

procedure TWCRFNDcuot.SGClBusMovNoAutMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   if (SGClBusMovNoAut.CellStr[ 'B_FINAN_ADIC_IN', ToIndex ]=co_Verdad) then
   begin
      if (SGClBusMovNoAut.CellStr[ 'SIT_CAPITAL_IN', ToIndex ] <> Co_LQ) then
      begin
         vlNumRow:=ToIndex;
      end;
   end;
end;

procedure TWCRFNDcuot.edArchivoEntradaExit(Sender: TObject);
var
  vlMesg: string;
  vlSalida: boolean;
begin
  vlMesg := 'Debe definir el nombre del archivo';
  if (edArchivoEntrada.Text = '') then  vlSalida := False;
  InterForma1.ValidaExit(edArchivoEntrada, vlSalida, vlMesg, True);
end;

procedure TWCRFNDcuot.sbArchivoEntradaClick(Sender: TObject);
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

procedure TWCRFNDcuot.bbImportarClick(Sender: TObject);
var
  LCID: integer;
  fila: integer;
  vlAccesorio : string;

  //Variables del reporte
  vlNUM_PERIODO : String;
  vlF_VENCIMIENTO  : String;
  vlIMP_CUOTA  : String;

  valida: String;

  //Para la inserción a la base de datos
  vlSQL: string;
  vlQry : TQuery;

  //Para la barra de progreso
  ani: TAniBarThread;
  r: TRect;

  vlMesg:string;
begin
   if Objeto.ValidaAccesoEsp('TCRFNDCUOT_IMPOR',True,True) then
   begin
      if Trim(edArchivoEntrada.Text) = '' then Exit;

      if (Objeto.CVE_AMORTIZACION.AsInteger = 2) then vlMesg:='Este proceso actualizara el Importe de las Cuotas de Capital. ¿Desea continuar?';
      if (Objeto.CVE_AMORTIZACION.AsInteger = 3) then vlMesg:='Este proceso eliminara las Cuotas de Capital. ¿Desea continuar?';

      vlAccesorio :='CP';

      if MessageDlg(vlMesg, mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin

         if (Objeto.CVE_AMORTIZACION.AsInteger = 3) then
         begin
            vlSQL :=' DELETE FROM CR_FND_CUOTA '+
                    '  WHERE ID_CREDITO = ' + IntToStr(Objeto.VGCredito) +
                    '    AND CVE_FND_ENT_DES = '''+Objeto.VGEntDesc+''''+
                    '    AND CVE_FND_PROGRAMA = '''+Objeto.VGPrograma+''''+
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

            if (Objeto.CVE_AMORTIZACION.AsInteger = 3) then
               AgregaCuota(vlAccesorio, vlF_VENCIMIENTO, vlIMP_CUOTA);

            if (Objeto.CVE_AMORTIZACION.AsInteger = 2) then
               ModImpCuota2(StrToInt(vlNUM_PERIODO),'CP',StrToFloat(vlIMP_CUOTA));

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

        vlsql:=' SELECT ID_CREDITO FROM CR_COMISION '+
               '  WHERE ID_CREDITO = '+ IntToStr(Objeto.VGCredito) +
               '    AND CVE_COMISION  IN (SELECT CVE_COMISION FROM CR_CAT_COMISION WHERE DESC_COMISION LIKE ''%CUOTA%GARANT%'')';

        vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
        try
           if vlQry <> nil then CalculaFega;
        finally
           if vlQry <> nil then vlQry.free;
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

procedure TWCRFNDcuot.ModificarMontodeComision1Click(Sender: TObject);
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

end.








