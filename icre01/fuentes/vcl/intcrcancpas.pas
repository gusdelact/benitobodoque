// Sistema         : Clase de CrVencAnt
// Fecha de Inicio : 08/02/2011
// Función forma   : Clase de CrVencAnt
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :      

Unit IntCrCancPas;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Excel97, OleServer, IntSGCtrl,
//Clases Adicionales
IntParamCre,IntCrActPa,
IntCrCredito,     //Disposición
IntCrAcredit,     //Acreditado
IntMInstDesc, IntMPrgApoyo, IntMDispFond,
Gauges, Grids, Aligrid,IntGenCre, ImgList,
IntLinkit;

Const
   coCRLF      = #13#10;
   CO_COL_IDCREDITO  = 0;
   CO_COL_ENTDES     = CO_COL_IDCREDITO + 1;
   CO_COL_PROGRAMA   = CO_COL_ENTDES + 1;
   CO_COL_PCT        = CO_COL_PROGRAMA + 1;

   CO_COL_F_CUFEGA   = CO_COL_PCT + 1;
   CO_COL_DIAS_FEGA  = CO_COL_F_CUFEGA + 1;

   CO_COL_CAP        = CO_COL_DIAS_FEGA + 1;
   CO_COL_FA         = CO_COL_CAP + 1;
   CO_COL_INT        = CO_COL_FA + 1;

   CO_COL_SITPROCESO = CO_COL_INT + 1;
   CO_COL_SITCRE     = CO_COL_SITPROCESO + 1;
   CO_COL_CHECK      = CO_COL_SITCRE + 1;

   CO_ERROR     = 'ERR';  // Mensaje de Error
   CO_CHECKED   = 'V';
   CO_UNCHECKED = 'F';
   CO_NOTCHECK  = '-';

Type
 TCrCancPas= class;

  TWCrCancPas=Class(TForm)
    InterForma1             : TInterForma; 
    edCAMPO1 : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    GBVenc: TGroupBox;
    lbArchivoEntrada: TLabel;
    sbArchivoEntrada: TSpeedButton;
    edArchivoEntrada: TEdit;
    bbImportar: TBitBtn;
    pAniBar: TPanel;
    ExcelWorksheetI: TExcelWorksheet;
    ExcelApplicationI: TExcelApplication;
    ExcelWorkbookI: TExcelWorkbook;
    btPROC_INFO: TBitBtn;
    GBAutorizacion: TGroupBox;
    MemoMessages: TMemo;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Label14: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    Label12: TLabel;
    Label4: TLabel;
    Shape11: TShape;
    Label9: TLabel;
    strgrdCanc: TStringGrid;
    Label1: TLabel;
    Ropcion: TRadioGroup;
    GBreversa: TGroupBox;
    BnMostrar: TBitBtn;
    odArchivoEntrada: TOpenDialog;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    Label3: TLabel;
    ImageList: TImageList;
    Shape3: TShape;
    Label5: TLabel;
    Label6: TLabel;
    Lcreditos: TListBox;
    Lentdes: TListBox;
    Lprograma: TListBox;
    Shape4: TShape;
    Label7: TLabel;
    Label8: TLabel;
    Shape5: TShape;
    Label11: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    edID_ACREDITADO: TEdit;
    btID_ACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    cbAcreditado: TCheckBox;
    Label17: TLabel;
    edID_CESION: TEdit;
    btID_CESION: TBitBtn;
    edCESION: TEdit;
    chbxCESION: TCheckBox;
    ilCesion: TInterLinkit;
    ilACREDITADO: TInterLinkit;
    BBBusca: TBitBtn;
    lbLiqF_INICIO: TLabel;
    dtpF_Aplicacion: TInterDateTimePicker;
    edF_Aplicacion: TEdit;
    CBdevpasivo: TCheckBox;
    dtpF_RECUPERACION: TDateTimePicker;
    BRedesctoCERO: TBitBtn;

    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure bbImportarClick(Sender: TObject);
    procedure bnMostrarClick(Sender: TObject);

    Procedure ReQueryVA(peID_CREDITO : String; nfila:boolean; var irow:word);

    procedure sbArchivoEntradaClick(Sender: TObject);
    procedure btPROC_INFOClick(Sender: TObject);
    procedure strgrdCancDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure RopcionClick(Sender: TObject);
    procedure strgrdCancMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edID_CESIONChange(Sender: TObject);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure edID_ACREDITADOChange(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure cbAcreditadoClick(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure btID_CESIONClick(Sender: TObject);
    procedure btID_ACREDITADOClick(Sender: TObject);
    procedure BBBuscaClick(Sender: TObject);
    procedure edF_AplicacionChange(Sender: TObject);
    procedure CBdevpasivoClick(Sender: TObject);
    procedure BRedesctoCEROClick(Sender: TObject);


    private 
    { Private declarations }

     procedure InvertCheck(StrinGrid : TStringGrid; nCol, nRow : Integer);
     Procedure BarridoCadena(PPID_Credito, PPCadena : String);
     Procedure Calcula_FEGA(PPID_Credito, PPCVE_ENT_DES, PP_PROGRAMA, PP_TQUERY : String);



    public
    { Public declarations }
    Objeto : TCrCancPas;

    Procedure ValidaPagos(PPID_Credito, PPCVE_ENT_DES, PP_PROGRAMA : String);
    Procedure ValidaCredito(PPID_Credito, PPCVE_ENT_DES, PP_PROGRAMA, PP_PCTREDES : String);
    Procedure Traspaso(PPID_Credito : Integer; PPEnt_Desc, PPPrograma, PPtipocanc:String);
    Procedure Reversa_Traspaso(PPID_Credito : Integer; PPEnt_Desc, PPPrograma:String);
    procedure ConfGrid( SGrid : TStringGrid );
    procedure EnableCheckBox(var CheckBox : TCheckBox; var obID, obDESC : Tedit);
    procedure Buscanombre(vlID_CREDITO : String);
    Procedure Cancela_Redescto_CERO(PPID_Credito : Integer);
end;
 TCrCancPas= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CAMPO1                   : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Credito                  : TCrCredito;//Disposición
        Acreditado               : TCrAcredit;

        VGCredito                : Integer;

        CadenaSql                : String;

        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
 ///       function    Reporte:Boolean; override;

      published
      end;


var
    vlIMP_CAP_ANT, vlIMP_INT_ANT, vlIMP_FA_ANT : single;
    vlSIT_PROCESO, vlSIT_CREDITO, vlTXT_DESCRIPCION :string;
    vlENT_DES, vlPROGRAMA, VLPCT_REDES : string;
    vlF_CUFEGA, vlDIAS_FEGA, vlF_APLICACION : string;

    vlID_CREDITO:STRING;

    nRow : word;
    vlError : String;

    sSQL    : String;
    qyQuery : TQuery;

    vlQry: TQuery;
    vlSql: string;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrCancPas.Create( AOwner : TComponent ); 
begin Inherited; 
      CAMPO1 :=CreaCampo('CAMPO1',ftString,tsNinguno,tsNinguno,False);
                CAMPO1.Caption:='Campo1';
                CAMPO1.Parametro:='CAMPO1';

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

{      MInstDesc := TMInstDesc.Create(Self);
      MInstDesc.MasterSource:=Self;
      MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';

      MPrgApoyo := TMPrgApoyo.Create(Self);
      MPrgApoyo.MasterSource:=Self;
      MPrgApoyo.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
      MPrgApoyo.FieldByName('CVE_FND_PROGRAMA').MasterField:='CVE_FND_PROGRAMA';
 }
      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrCancPas.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCancPas.Destroy;
begin
   if Credito <> nil then
      Credito.Free;
   if Acreditado <> nil then
      Acreditado.Free;
{   If MInstDesc <> Nil Then
      MInstDesc.Free;
   If MPrgApoyo <> Nil Then
      MPrgApoyo.Free;
 }           
   inherited;
end;


function TCrCancPas.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCancPas;
begin
   W:=TWCrCancPas.Create(Self);
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


Function TCrCancPas.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrvenca.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

{
function TCrCancPas.Reporte:Boolean;
begin //Execute_Reporte();
end;
 }




(***********************************************FORMA CrCancPas********************)
(*                                                                              *)
(*  FORMA DE CrCancPas                                                            *)
(*                                                                              *)
(***********************************************FORMA CrCancPas********************)

procedure TWCrCancPas.EnableCheckBox(var CheckBox : TCheckBox; var obID, obDESC : Tedit);
begin
    If Not CheckBox.Checked Then
    Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;

        obID.Text:='';
        obDESC.Text:='';
    End
    Else
    Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;


procedure TWCrCancPas.Buscanombre(vlID_CREDITO : String);
begin
   edCESION.Text:='';
 vlSql :='SELECT NOMBRE FROM PERSONA ' +
         ' WHERE ID_PERSONA IN (SELECT ID_TITULAR FROM CONTRATO ' +
         '                       WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CREDITO ' +
         '      		                       WHERE ID_CREDITO = '+vlID_CREDITO+
	 '	       		                      ) ' +
         '                     ) ';

    vlQry := GetSQLQuery(vlSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

    try
      if vlQry <> nil then
      begin
         edCESION.Text :=  vlQry.FieldByName('NOMBRE').asString;
      end;
   finally
        if vlQry <> nil then vlQry.free;
    end;
end;


Procedure  TWCrCancPas.ValidaPagos(PPID_Credito, PPCVE_ENT_DES, PP_PROGRAMA : String);
var STPCancPas  : TStoredProc;
 vlResultado: String;
begin
     try
        STPCancPas:=TStoredProc.Create(Nil);
        STPCancPas.DatabaseName:=Objeto.Apli.DatabaseName;
        STPCancPas.SessionName:=Objeto.Apli.SessionName;

        STPCancPas.StoredProcName:='PKGCR_VENCIMIENTO_ANTICIPADO.STP_VALIDA_PAGOS';
        STPCancPas.Params.CreateParam(ftInteger,'PEID_CREDITO',ptInput);
        STPCancPas.Params.CreateParam(ftString,'PECVEFNDENTDES',ptInput);
        STPCancPas.Params.CreateParam(ftString,'PECVEFNDPROGRAMA',ptInput);
        STPCancPas.Params.CreateParam(ftString,'PETIPO_CRED',ptInput);
        STPCancPas.Params.CreateParam(ftString,'PSSIT_PROCESO',ptOutput);
        STPCancPas.Params.CreateParam(ftString,'PSSIT_CREDITO',ptOutput);
        STPCancPas.Params.CreateParam(ftString,'PSTXT_DESCRIPCION',ptOutput);
        STPCancPas.Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        STPCancPas.Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

        STPCancPas.Prepare;

        STPCancPas.ParamByName('PEID_CREDITO').AsInteger := StrToInt(PPID_Credito);
        STPCancPas.ParamByName('PECVEFNDENTDES').AsString := PPCVE_ENT_DES;
        STPCancPas.ParamByName('PECVEFNDPROGRAMA').AsString := PP_PROGRAMA;
        STPCancPas.ParamByName('PETIPO_CRED').AsString := 'PS';
        STPCancPas.ExecProc;

        vlSIT_PROCESO := STPCancPas.ParamByName('psSIT_PROCESO').AsString;
        vlSIT_CREDITO := STPCancPas.ParamByName('psSIT_CREDITO').AsString;
        vlTXT_DESCRIPCION := STPCancPas.ParamByName('psTXT_DESCRIPCION').AsString;

        if (STPCancPas.ParamByName('PSRESULTADO').AsInteger <> 0) then
        begin
                vlResultado := 'PROBLEMAS AL VALIDAR CRÉDITO ';
                vlTXT_DESCRIPCION:=IntToStr(STPCancPas.ParamByName('PSRESULTADO').AsInteger) + STPCancPas.ParamByName('PSTXRESULTADO').AsString + ';' + vlTXT_DESCRIPCION;
                ShowMessage(vlResultado);
        end;
   finally
          STPCancPas.Free;
   end;
end;

// Crea el proceso de llamado al paquete de validación
Procedure  TWCrCancPas.ValidaCredito(PPID_Credito, PPCVE_ENT_DES, PP_PROGRAMA, PP_PCTREDES : String);
var STPCancPas  : TStoredProc;
begin

     try
        STPCancPas:=TStoredProc.Create(Nil);
        STPCancPas.DatabaseName:=Objeto.Apli.DatabaseName;
        STPCancPas.SessionName:=Objeto.Apli.SessionName;
        STPCancPas.StoredProcName:='PKGCR_VENCIMIENTO_ANTICIPADO.STP_VALIDA_CREDITO_PAS';
        STPCancPas.Params.CreateParam(ftInteger,'peID_CREDITO',ptInput);
        STPCancPas.Params.CreateParam(ftString,'PECVEFNDENTDES',ptInput);
        STPCancPas.Params.CreateParam(ftString,'PECVEFNDPROGRAMA',ptInput);
        STPCancPas.Params.CreateParam(ftString,'peFALTA',ptInput);
        STPCancPas.Params.CreateParam(ftString,'peCveUsuario',ptInput);
        STPCancPas.Params.CreateParam(ftString,'peB_COMMIT',ptInput);

        STPCancPas.Params.CreateParam(ftFloat,'psIMP_CAP_ANT',ptOutput);
        STPCancPas.Params.CreateParam(ftFloat,'psIMP_INT_ANT',ptOutput);
        STPCancPas.Params.CreateParam(ftFloat,'psIMP_FA_ANT',ptOutput);
        STPCancPas.Params.CreateParam(ftString,'psSIT_PROCESO',ptOutput);
        STPCancPas.Params.CreateParam(ftString,'psSIT_CREDITO',ptOutput);
        STPCancPas.Params.CreateParam(ftString,'psTXT_DESCRIPCION',ptOutput);

        STPCancPas.Params.CreateParam(ftFloat,'psResultado',ptOutput);
        STPCancPas.Params.CreateParam(ftString,'psTxResultado',ptOutput);

        STPCancPas.Prepare;

        STPCancPas.ParamByName('peID_CREDITO').AsInteger := StrToInt(PPID_Credito);
        STPCancPas.ParamByName('PECVEFNDENTDES').AsString := PPCVE_ENT_DES;
        STPCancPas.ParamByName('PECVEFNDPROGRAMA').AsString := PP_PROGRAMA;
        STPCancPas.ParamByName('peFALTA').AsDatetime := StrToDateTime(vlF_APLICACION); //Objeto.Apli.DameFechaEmpresa;
        STPCancPas.ParamByName('peCveUsuario').AsString := Objeto.Apli.Usuario;
        STPCancPas.ParamByName('peB_COMMIT').AsString := 'V';
        STPCancPas.ExecProc;

        if (STPCancPas.ParamByName('psResultado').AsInteger = 0) then
        begin
           vlENT_DES:= PPCVE_ENT_DES;
           vlPROGRAMA:= PP_PROGRAMA;
           VLPCT_REDES:= PP_PCTREDES;

           vlIMP_CAP_ANT := STPCancPas.ParamByName('psIMP_CAP_ANT').AsFloat;
           vlIMP_INT_ANT := STPCancPas.ParamByName('psIMP_INT_ANT').AsFloat;
           vlIMP_FA_ANT := STPCancPas.ParamByName('psIMP_FA_ANT').AsFloat;

           vlSIT_PROCESO := STPCancPas.ParamByName('psSIT_PROCESO').AsString;
           vlSIT_CREDITO := STPCancPas.ParamByName('psSIT_CREDITO').AsString;

           vlTXT_DESCRIPCION := STPCancPas.ParamByName('psTXT_DESCRIPCION').AsString;
        end;

        if (STPCancPas.ParamByName('psResultado').AsInteger <> 0) then
        begin
              vlTXT_DESCRIPCION := 'PROBLEMAS AL INSERTAR CRÉDITO ' + IntToStr(STPCancPas.ParamByName('psResultado').AsInteger) + STPCancPas.ParamByName('PSTXResultado').AsString;
              ShowMessage(vlTXT_DESCRIPCION);
        end;
   finally
          STPCancPas.Free;
   end;
end;


Procedure  TWCrCancPas.Traspaso(PPID_Credito : Integer; PPEnt_Desc, PPPrograma, PPtipocanc:String);
var STPCancPas  : TStoredProc;
begin
     try
          STPCancPas:=TStoredProc.Create(Nil);
          STPCancPas.DatabaseName:=Objeto.Apli.DatabaseName;
          STPCancPas.SessionName:=Objeto.Apli.SessionName;
          STPCancPas.StoredProcName:='PKGCR_VENCIMIENTO_ANTICIPADO.STPLIQCREDPASIVO';

          STPCancPas.Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          STPCancPas.Params.CreateParam(ftInteger,'PECVEFNDENTDES',ptInput);
          STPCancPas.Params.CreateParam(ftInteger,'PECVEFNDPROGRAMA',ptInput);
          STPCancPas.Params.CreateParam(ftString,'PEFAPLICACION',ptInput);
          STPCancPas.Params.CreateParam(ftString,'PETIPO_CANC',ptInput);
          STPCancPas.Params.CreateParam(ftString,'PEF_RESCATE',ptInput);
          STPCancPas.Params.CreateParam(ftString,'PECVEUSUARIO',ptInput);
          STPCancPas.Params.CreateParam(ftString,'PEBCOMMIT',ptInput);

          STPCancPas.Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          STPCancPas.Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          STPCancPas.Prepare;

          STPCancPas.ParamByName('PEIDCREDITO').AsInteger := PPID_Credito;
          STPCancPas.ParamByName('PECVEFNDENTDES').AsString := PPEnt_Desc;
          STPCancPas.ParamByName('PECVEFNDPROGRAMA').AsString := PPPrograma;
          STPCancPas.ParamByName('PEFAPLICACION').AsDatetime := StrToDateTime(vlF_APLICACION); //Objeto.Apli.DameFechaEmpresa;
          STPCancPas.ParamByName('PETIPO_CANC').AsString := PPtipocanc;
          STPCancPas.ParamByName('PEF_RESCATE').AsDatetime := StrToDate(DateToStr(dtpF_RECUPERACION.Date));
          STPCancPas.ParamByName('PECVEUSUARIO').AsString := Objeto.Apli.Usuario;

          STPCancPas.ParamByName('PEBCOMMIT').AsString := 'V';
          STPCancPas.ExecProc;

          if (STPCancPas.ParamByName('PSRESULTADO').AsInteger = 0) then
          begin
             vlIMP_CAP_ANT := 0;
             vlIMP_INT_ANT := 0;
             vlIMP_FA_ANT := 0;

             vlSIT_PROCESO := 'PR';
             vlSIT_CREDITO := 'PR';
             vlTXT_DESCRIPCION := ' ';
          end;

          if (STPCancPas.ParamByName('PSRESULTADO').AsInteger <> 0) then
          begin
                vlTXT_DESCRIPCION := 'PROBLEMAS AL TRASPASAR CRÉDITO ' + IntToStr(STPCancPas.ParamByName('PSRESULTADO').AsInteger) + STPCancPas.ParamByName('PSTXRESULTADO').AsString;
                ShowMessage(vlTXT_DESCRIPCION);
          end;
     finally
            STPCancPas.Free;
     end;
end;

Procedure  TWCrCancPas.Reversa_Traspaso(PPID_Credito : Integer; PPEnt_Desc, PPPrograma:String);
var STPCancPas  : TStoredProc;
begin
     try
          STPCancPas:=TStoredProc.Create(Nil);
          STPCancPas.DatabaseName:=Objeto.Apli.DatabaseName;
          STPCancPas.SessionName:=Objeto.Apli.SessionName;
          STPCancPas.StoredProcName:='PKGCR_VENCIMIENTO_ANTICIPADO.STPREVCREDPASIVO';

          STPCancPas.Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          STPCancPas.Params.CreateParam(ftInteger,'PECVEFNDENTDES',ptInput);
          STPCancPas.Params.CreateParam(ftInteger,'PECVEFNDPROGRAMA',ptInput);
          STPCancPas.Params.CreateParam(ftString,'PECVE_USUARIO',ptInput);
          STPCancPas.Params.CreateParam(ftString,'PEBCOMMIT',ptInput);

          STPCancPas.Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          STPCancPas.Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          STPCancPas.Prepare;

          STPCancPas.ParamByName('PEIDCREDITO').AsInteger := PPID_Credito;
          STPCancPas.ParamByName('PECVEFNDENTDES').AsString := PPEnt_Desc;
          STPCancPas.ParamByName('PECVEFNDPROGRAMA').AsString := PPPrograma;
          STPCancPas.ParamByName('PECVE_USUARIO').AsString := Objeto.Apli.Usuario;
          STPCancPas.ParamByName('PEBCOMMIT').AsString := 'V';
          STPCancPas.ExecProc;

          if (STPCancPas.ParamByName('PSRESULTADO').AsInteger = 0) then
          begin
             vlIMP_CAP_ANT := 0;
             vlIMP_INT_ANT := 0;
             vlIMP_FA_ANT := 0;

             vlSIT_PROCESO := 'RV';
             vlSIT_CREDITO := 'RV';
             vlTXT_DESCRIPCION := ' ';
          end;

          if (STPCancPas.ParamByName('PSRESULTADO').AsInteger <> 0) then
          begin
                vlTXT_DESCRIPCION := 'PROBLEMAS AL TRASPASAR CRÉDITO ' + IntToStr(STPCancPas.ParamByName('PSRESULTADO').AsInteger) + STPCancPas.ParamByName('PSTXRESULTADO').AsString;
                ShowMessage(vlTXT_DESCRIPCION);
          end;
     finally
            STPCancPas.Free;
     end;
end;



Procedure  TWCrCancPas.Cancela_Redescto_CERO(PPID_Credito : Integer);
var STPCancPas  : TStoredProc;
begin
     try
          STPCancPas:=TStoredProc.Create(Nil);
          STPCancPas.DatabaseName:=Objeto.Apli.DatabaseName;
          STPCancPas.SessionName:=Objeto.Apli.SessionName;
          STPCancPas.StoredProcName:='PKGCR_VENCIMIENTO_ANTICIPADO.STP_CANC_FEGA';

          STPCancPas.Params.CreateParam(ftInteger,'PEID_CREDITO',ptInput);
          STPCancPas.Params.CreateParam(ftInteger,'PEF_VALOR',ptInput);
          STPCancPas.Params.CreateParam(ftInteger,'PEID_GPO_TRAN',ptInput);
          STPCancPas.Params.CreateParam(ftString,'PECVE_USUARIO',ptInput);
          STPCancPas.Params.CreateParam(ftString,'PEBCOMMIT',ptInput);

          STPCancPas.Params.CreateParam(ftFloat,'PSGPOTRANS',ptOutput);
          STPCancPas.Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          STPCancPas.Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          STPCancPas.Prepare;

          STPCancPas.ParamByName('PEID_CREDITO').AsInteger := PPID_Credito;
          STPCancPas.ParamByName('PEF_VALOR').AsDatetime := StrToDateTime(vlF_APLICACION);
          STPCancPas.ParamByName('PEID_GPO_TRAN').AsInteger := 0;
          STPCancPas.ParamByName('PECVE_USUARIO').AsString := Objeto.Apli.Usuario;
          STPCancPas.ParamByName('PEBCOMMIT').AsString := 'V';
          STPCancPas.ExecProc;

          if (STPCancPas.ParamByName('PSRESULTADO').AsInteger = 0) then
          begin
             vlIMP_CAP_ANT := 0;
             vlIMP_INT_ANT := 0;
             vlIMP_FA_ANT := 0;

             vlSIT_PROCESO := 'RV';
             vlSIT_CREDITO := 'RV';
             vlTXT_DESCRIPCION := ' ';
          end;

          if (STPCancPas.ParamByName('PSRESULTADO').AsInteger <> 0) then
          begin
                vlTXT_DESCRIPCION := 'PROBLEMAS AL TRASPASAR CRÉDITO ' + IntToStr(STPCancPas.ParamByName('PSRESULTADO').AsInteger) + STPCancPas.ParamByName('PSTXRESULTADO').AsString;
                ShowMessage(vlTXT_DESCRIPCION);
          end;
     finally
            STPCancPas.Free;
     end;
end;


procedure TWCrCancPas.ConfGrid( SGrid : TStringGrid );
begin
 With SGrid Do
   Begin
      ColCount := 12;

      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;

      ColWidths[CO_COL_IDCREDITO] := 65;
      ColWidths[CO_COL_ENTDES] := 71;
      ColWidths[CO_COL_PROGRAMA] := 71;
      ColWidths[CO_COL_PCT] := 47;

      ColWidths[CO_COL_F_CUFEGA] := 74;
      ColWidths[CO_COL_DIAS_FEGA] := 45;

      ColWidths[CO_COL_CAP] := 100;
      ColWidths[CO_COL_INT] := 100;
      ColWidths[CO_COL_FA] := 100;
      ColWidths[CO_COL_SITPROCESO] := 92;
      ColWidths[CO_COL_SITCRE] := 120;

      ColWidths[CO_COL_CHECK] := 30;

    End;
end;


procedure TWCrCancPas.InvertCheck(StrinGrid : TStringGrid; nCol, nRow : Integer);
begin
 With (StrinGrid) Do
  If (Cells[nCol, nRow] <>  CO_NOTCHECK) Then
   Begin
     If (Cells[nCol, nRow] = CO_CHECKED) Then
        Cells[nCol, nRow] := CO_UNCHECKED
     Else
        Cells[nCol, nRow] := CO_CHECKED;
   End;
end;

Procedure TWCrCancPas.BarridoCadena(PPID_Credito, PPCadena : String);
var
   vlIndex, vlTotal, vlCiclo: Integer;
   vlCar,vlRenglon: String;
begin
   vlTotal:= Length (Trim(PPCadena));
   vlRenglon:='';
   vlCiclo:=1;

   for vlIndex := 1 to vlTotal do
   begin
      vlCar:= Copy(PPCadena, vlIndex, 1);
      if  vlCar = ';' then
      begin
         if vlCiclo=1 then
         begin
            MemoMessages.Lines.Add(PPID_Credito+'. . .'+Trim(vlRenglon));
            vlCiclo:=2;
         end
         else
            MemoMessages.Lines.Add('              '+Trim(vlRenglon));
         vlRenglon:='';
      end
      else
         vlRenglon:=vlRenglon+vlCar;
   end;
   if Length(vlRenglon)>0 then
        if vlCiclo=1 then
           MemoMessages.Lines.Add(PPID_Credito+'. . .'+Trim(vlRenglon))
        else
           MemoMessages.Lines.Add('                '+Trim(vlRenglon));
end;


Procedure TWCrCancPas.Calcula_FEGA(PPID_Credito, PPCVE_ENT_DES, PP_PROGRAMA, PP_TQUERY : String);
var vlQry2, vlQry3: TQuery;
    vlSql2, vlSql3: string;
begin

   if  PP_TQUERY='0' then
   begin
    vlSql2 :=' SELECT MIN(F_PROG_PAGO) AS F_PROG_PAGO ' +
            ' FROM CR_FND_COMISION' +
            ' WHERE ID_CREDITO IN ('+PPID_Credito+')' +
            ' AND CVE_FND_ENT_DES IN ('''+PPCVE_ENT_DES+''')' +
            ' AND CVE_FND_PROGRAMA IN ('''+PP_PROGRAMA+''')' +
            ' AND F_PROG_PAGO > TO_DATE('''+DateTimeToStr(Objeto.Apli.DameFechaEmpresa)+''',''DD/MM/YYYY'')' + 
            ' AND SIT_COMISION NOT IN (''LQ'',''CA'')' +
            ' AND CVE_COMISION IN (''CUFEGA'') ';
    end;
    if  PP_TQUERY='1' then
    begin
    vlSql2 :=' SELECT MIN(F_PROG_PAGO) AS F_PROG_PAGO ' +
            ' FROM CR_FND_COMISION' +
            ' WHERE ID_CREDITO IN ('+PPID_Credito+')' +
            ' AND CVE_FND_ENT_DES IN ('''+PPCVE_ENT_DES+''')' +
            ' AND CVE_FND_PROGRAMA IN ('''+PP_PROGRAMA+''')' +
            ' AND F_MODIFICA = TO_DATE('''+DateTimeToStr(Objeto.Apli.DameFechaEmpresa)+''',''DD/MM/YYYY'')' + 
            ' AND SIT_COMISION IN (''CA'')' +
            ' AND CVE_COMISION IN (''CUFEGA'') ';
    end;

    vlQry2 := GetSQLQuery(vlSql2,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
    try
        if vlQry2 <> nil then
        begin
           vlF_CUFEGA  := vlQry2.FieldByName('F_PROG_PAGO').AsString;
           vlSql3 :=' SELECT ( TO_DATE('''+vlF_CUFEGA+''',''DD/MM/YYYY'') - TO_DATE('''+DateTimeToStr(Objeto.Apli.DameFechaEmpresa)+''',''DD/MM/YYYY'') ) AS NUM_DIAS FROM DUAL';
           vlQry3 := GetSQLQuery(vlSql3,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
           try
             if vlQry3 <> nil then
                 vlDIAS_FEGA := vlQry3.FieldByName('NUM_DIAS').AsString
             else
                 vlDIAS_FEGA := '0';
           finally
               if vlQry3 <> nil then vlQry3.free;
           end;
        end
        else
        begin
           vlF_CUFEGA  := 'N.A.';
           vlDIAS_FEGA := '0';
        end;
    finally
        if vlQry2 <> nil then vlQry2.free;
    end;
end;

Procedure  TWCrCancPas.ReQueryVA(peID_CREDITO : String; nfila:boolean; var irow:word);
var vlMemo_Leyenda: string;
begin

  With strgrdCanc Do
   Begin
      Cells[CO_COL_CHECK, irow] := CO_UNCHECKED;

      Cells[CO_COL_IDCREDITO, irow] := peID_CREDITO;
      Cells[CO_COL_ENTDES, irow] := vlENT_DES;
      Cells[CO_COL_PROGRAMA, irow] := vlPROGRAMA;
      Cells[CO_COL_PCT, irow] := VLPCT_REDES;

      Calcula_FEGA(peID_CREDITO, vlENT_DES, vlPROGRAMA,'0');
      if Trim(vlF_CUFEGA)='' then vlF_CUFEGA  := 'N.A.';
      if Trim(vlDIAS_FEGA)='' then vlDIAS_FEGA  := '0';
      Cells[CO_COL_F_CUFEGA, irow] := vlF_CUFEGA;
      Cells[CO_COL_DIAS_FEGA, irow] := vlDIAS_FEGA;

      Cells[CO_COL_CAP, irow] := FormatFloat('###,##0.00',vlIMP_CAP_ANT);
      Cells[CO_COL_INT, irow] := FormatFloat('###,##0.00',vlIMP_INT_ANT);
      Cells[CO_COL_FA, irow] := FormatFloat('###,##0.00',vlIMP_FA_ANT);

      if vlSIT_PROCESO='XP' then  Cells[CO_COL_SITPROCESO, irow] := 'Por Procesar';
      if vlSIT_PROCESO='PR' then  Cells[CO_COL_SITPROCESO, irow] := 'Procesado';
      if vlSIT_PROCESO='RV' then  Cells[CO_COL_SITPROCESO, irow] := 'Procesado';

      if vlSIT_CREDITO='ER' then
      begin
         Cells[CO_COL_SITCRE, irow] := 'Error en Validacion';
         vlMemo_Leyenda:=vlTXT_DESCRIPCION;
      end;

      if vlSIT_CREDITO='OK' then
      begin
         Cells[CO_COL_CHECK, irow] := CO_CHECKED;
         Cells[CO_COL_SITCRE, irow] := 'Validacion Correcta';
         vlMemo_Leyenda:='Validado Correctamente';
      end;

      if vlSIT_CREDITO='PR' then
      begin
         Cells[CO_COL_SITCRE, irow] := 'Procesado';
         vlMemo_Leyenda:='Procesado Correctamente';
      end;

      if vlSIT_CREDITO='RV' then
      begin
         Cells[CO_COL_SITCRE, irow] := 'Reversa Correcta';
         vlMemo_Leyenda:='Reversa Procesada Correctamente';
      end;

      BarridoCadena (peID_CREDITO, vlMemo_Leyenda);

      if nfila then Inc(irow);
   End;
end;


procedure TWCrCancPas.FormShow(Sender: TObject);
begin
 With Objeto Do
   Begin
      CAMPO1.Control:=edCAMPO1;

      dtpF_RECUPERACION.Date := Apli.DameFechaEmpresa;
      dtpF_RECUPERACION.Enabled:=false;

      Credito.ID_CREDITO.Control := edID_CESION;
      Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
      Credito.GetParams(Objeto);
      edCESION.Hint := Credito.ContratoCre.Contrato.TITNombre.AsString;
      edCESION.ShowHint := True;

      Acreditado.ID_ACREDITADO.Control := edID_ACREDITADO;
      Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

      dtpF_Aplicacion.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_Aplicacion.text:=FormatDateTime('dd/mm/yyyy',dtpF_Aplicacion.DateTime);

      vlF_APLICACION:=edF_Aplicacion.Text;

      //InterForma1.BtnEliminar.Visible:=false;
   end;
end;

procedure TWCrCancPas.FormDestroy(Sender: TObject);
begin
      Objeto.CAMPO1.Control:=nil;
   //Objeto
end;

procedure TWCrCancPas.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCancPas.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCancPas.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCancPas.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrCancPas.bbImportarClick(Sender: TObject);
var
  LCID: integer;
  fila: integer;

  valida: String;

  //Para la barra de progreso
  ani: TAniBarThread;
  r: TRect;

  vlMesg:string;
  vlClave : String;

begin
//JFOF VALIDA USUARIO 12/10/2011
//    vlClave := '28';
 //if ValidaUsuario(Objeto.Apli,vlclave) then
//JFOF VALIDA USUARIO 12/10/2011
   if Objeto.ValidaAccesoEsp('TCRCANCPAS_IMPOR',True,True) then
   begin

     CBdevpasivo.Checked:=false;
     MemoMessages.Clear;
     ClearGrid(strgrdCanc,0);
     ConfGrid(strgrdCanc);
     nRow := 0;

    if Trim(edArchivoEntrada.Text) = '' then
    begin
       ShowMessage('Seleccione un archivo');
       Exit;
    end;

    vlMesg:='¿Esta seguro de cargar el archivo seleccionado?';
    if MessageDlg(vlMesg, mtConfirmation,[mbYes, mbNo], 0) = mrYes then
    Begin

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
          vlID_CREDITO := ExcelWorksheetI.Cells.Item[fila, 'A'];

          //Realiza validaciones
          sSQL:='SELECT ID_CREDITO, CVE_FND_ENT_DES, CVE_FND_PROGRAMA, PCT_REDESCONTADO '+
                '  FROM CR_FND_CREDITO '+
                ' WHERE ID_CREDITO = '  + vlID_CREDITO;
          qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
          If qyQuery <> Nil Then
          Begin
             While not qyQuery.Eof Do
             Begin
                ValidaCredito(vlID_CREDITO, qyQuery.FieldByName('CVE_FND_ENT_DES').AsString, qyQuery.FieldByName('CVE_FND_PROGRAMA').AsString, qyQuery.FieldByName('PCT_REDESCONTADO').AsString);
                ReQueryVA(vlID_CREDITO, True, nrow);

                qyQuery.Next;
             End;
             qyQuery.Free;
          End;

          inc(fila);
          valida := Trim(ExcelWorksheetI.Cells.Item[fila, 'A']);
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

      strgrdCanc.RowCount:=fila-2;
      //Si no existe error notifica al usuario que se generó el reporte
      //ShowMessage('Informacion leida con Exito');
      edArchivoEntrada.Text:='';

    except
      on e: Exception do
      begin
        MessageDlg('No se importó completo el archivo.' +
          IntToStr(Fila) + e.Message, mtError, [mbOK], 0);
      end;
    end;
    end;
  end;
//  else
//  begin
//  ShowMessage('    No tiene suficientes permisos para esta Acción');
//  end;
end;


//////////////////////////
procedure TWCrCancPas.bnMostrarClick(Sender: TObject);
begin

   ClearGrid(strgrdCanc,0);

    vlSql :=' SELECT C.ID_CREDITO, C.CVE_FND_ENT_DES, C.CVE_FND_PROGRAMA, C.PCT_REDESCONTADO, C.F_CANC_PAS, ' +
            '       (SELECT NVL(SUM(IMP_CAPITAL), 0) FROM CR_FND_CAPITAL WHERE ID_CREDITO=C.ID_CREDITO AND CVE_FND_ENT_DES=C.CVE_FND_ENT_DES AND CVE_FND_PROGRAMA=C.CVE_FND_PROGRAMA AND F_VENCIMIENTO>=TO_DATE('''+DateTimeToStr(Objeto.Apli.DameFechaEmpresa)+''',''DD/MM/YYYY'')) IMP_CAPITAL,' +
	    '	    (SELECT NVL(SUM(IMP_INTERES), 0) FROM CR_FND_INTERES WHERE ID_CREDITO=C.ID_CREDITO AND CVE_FND_ENT_DES=C.CVE_FND_ENT_DES AND CVE_FND_PROGRAMA=C.CVE_FND_PROGRAMA AND F_VENCIMIENTO>=TO_DATE('''+DateTimeToStr(Objeto.Apli.DameFechaEmpresa)+''',''DD/MM/YYYY'')) IMP_INTERES,' +
	    '	    (SELECT NVL(SUM(IMP_FINAN_ADIC), 0) FROM CR_FND_FIN_ADIC WHERE ID_CREDITO=C.ID_CREDITO AND CVE_FND_ENT_DES=C.CVE_FND_ENT_DES AND CVE_FND_PROGRAMA=C.CVE_FND_PROGRAMA AND F_VENCIMIENTO>=TO_DATE('''+DateTimeToStr(Objeto.Apli.DameFechaEmpresa)+''',''DD/MM/YYYY'')) IMP_FINAN_ADIC' +
            ' FROM CR_FND_CREDITO C' +
//            ' WHERE C.F_CANC_PAS = TO_DATE('''+DateTimeToStr(Objeto.Apli.DameFechaEmpresa)+''',''DD/MM/YYYY'')' +

//            ' WHERE (C.F_CANC_PAS >= TO_DATE(TRUNC(TO_DATE('''+DateTimeToStr(Objeto.Apli.DameFechaEmpresa)+''',''MM/DD/YYYY''),''MM''),''DD/MM/YYYY'')) '+
            ' WHERE (C.F_CANC_PAS >= TO_DATE( (SELECT ''01''||TO_CHAR(TO_DATE('''+DateTimeToStr(Objeto.Apli.DameFechaEmpresa)+''',''DD/MM/YYYY''),''MM/YYYY'') AS MES_ANIO FROM DUAL) , ''DD/MM/YYYY'') ) '+
            '   AND (C.F_CANC_PAS <= LAST_DAY(TO_DATE('''+DateTimeToStr(Objeto.Apli.DameFechaEmpresa)+''',''DD/MM/YYYY''))) ' +
            ' GROUP BY C.ID_CREDITO, C.CVE_FND_ENT_DES, C.CVE_FND_PROGRAMA, C.PCT_REDESCONTADO, C.F_CANC_PAS ' +
            ' ORDER BY C.F_CANC_PAS, C.ID_CREDITO, C.CVE_FND_ENT_DES, C.CVE_FND_PROGRAMA ';

    vlQry := GetSQLQuery(vlSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

    try
        ConfGrid(strgrdCanc);
        nRow := 0;

        if vlQry <> nil then
        begin
        while not vlQry.Eof do
        begin
           vlID_CREDITO :=  vlQry.FieldByName('ID_CREDITO').asString;
           vlENT_DES :=  vlQry.FieldByName('CVE_FND_ENT_DES').asString;
           vlPROGRAMA :=  vlQry.FieldByName('CVE_FND_PROGRAMA').asString;
           vlPCT_REDES :=  vlQry.FieldByName('PCT_REDESCONTADO').asString;

           ValidaPagos(vlID_CREDITO, vlENT_DES, vlPROGRAMA);
           ReQueryVA(vlID_CREDITO, True, nrow);

           strgrdCanc.Cells[CO_COL_SITPROCESO, nRow-1] := DateTimeToStr(vlQry.FieldByName('F_CANC_PAS').asDateTime);
           strgrdCanc.Cells[CO_COL_CHECK, nRow-1] := CO_UNCHECKED;
           vlQry.Next;
        end;
        end;
    finally
        if vlQry <> nil then vlQry.free;
    end;
    strgrdCanc. RowCount := nRow;
end;

//////////////////////////

procedure TWCrCancPas.sbArchivoEntradaClick(Sender: TObject);
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

procedure TWCrCancPas.btPROC_INFOClick(Sender: TObject);
var
   cont1, RegTot : word;
   bproc : boolean;
   vltipocanc:string;
   vlClave : String;
begin
//JFOF VALIDA USUARIO 12/10/2011
//    vlClave := '08';
// if ValidaUsuario(Objeto.Apli,vlclave) then
//JFOF VALIDA USUARIO 12/10/2011
   if Objeto.ValidaAccesoEsp('TCRCANCPAS_CANC',True,True) then
   begin
   MemoMessages.Clear;
   Lcreditos.Clear;
   Lentdes.Clear;
   Lprograma.Clear;
   cont1:=0;
   RegTot:=strgrdCanc.RowCount;

   if CBdevpasivo.Checked = false then vltipocanc:='VA'
   else vltipocanc:='DP';

   if Ropcion.Itemindex = 0 then //Cancelacion Pasiva
   begin
      while (cont1 <= RegTot) do
      begin
         bproc :=false;
         if (trim(strgrdCanc.Cells[CO_COL_SITPROCESO, cont1])='Por Procesar') AND (trim(strgrdCanc.Cells[CO_COL_SITCRE, cont1])='Validacion Correcta') AND
            (trim(strgrdCanc.Cells[CO_COL_CHECK, cont1])=CO_CHECKED) then
         begin
            //if (trim(strgrdCanc.Cells[CO_COL_F_CUFEGA, cont1]) = 'N.A.') then
                bproc :=true;

           { if (trim(strgrdCanc.Cells[CO_COL_F_CUFEGA, cont1]) <> 'N.A.') then
            begin
               if (StrToInt(strgrdCanc.Cells[CO_COL_DIAS_FEGA, cont1]) > 5 ) then
               begin
                  bproc :=true;
               end
               else
               begin
                  if MessageDlg('El credito '+strgrdCanc.Cells[CO_COL_IDCREDITO, cont1]+' tiene proximo el vencimiento de su Cuota FEGA, ¿Desea continuar?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
                     bproc :=true;
               end;
            end;
            }

            if bproc then
            begin
               Lcreditos.Items.Add(strgrdCanc.Cells[CO_COL_IDCREDITO, cont1]);
               Lentdes.Items.Add(strgrdCanc.Cells[CO_COL_ENTDES, cont1]);
               Lprograma.Items.Add(strgrdCanc.Cells[CO_COL_PROGRAMA, cont1]);
            end;
         end;
         cont1:=cont1+1;
      end;

      ClearGrid(strgrdCanc,0);
      cont1:=0;
      while (cont1 <= Lcreditos.Items.Count-1) do
      begin
         vlID_CREDITO:=Lcreditos.Items.Strings[cont1];
         Traspaso(StrToInt(vlID_CREDITO), Lentdes.Items.Strings[cont1], Lprograma.Items.Strings[cont1], vltipocanc);
         ReQueryVA(vlID_CREDITO, False, cont1);
         cont1:=cont1+1;
      end;
   end;

   if Ropcion.Itemindex = 1 then //Reversa Cancelacion Pasiva
   begin
      while (cont1 <= RegTot) do
      begin
         if (trim(strgrdCanc.Cells[CO_COL_CHECK, cont1])=CO_CHECKED) then
         begin
            Lcreditos.Items.Add(strgrdCanc.Cells[CO_COL_IDCREDITO, cont1]);
            Lentdes.Items.Add(strgrdCanc.Cells[CO_COL_ENTDES, cont1]);
            Lprograma.Items.Add(strgrdCanc.Cells[CO_COL_PROGRAMA, cont1]);
         end;
         cont1:=cont1+1;
      end;

      ClearGrid(strgrdCanc,0);
      cont1:=0;
      while (cont1 <= Lcreditos.Items.Count-1) do
      begin
         vlID_CREDITO:=Lcreditos.Items.Strings[cont1];
         Reversa_Traspaso(StrToInt(vlID_CREDITO), Lentdes.Items.Strings[cont1], Lprograma.Items.Strings[cont1]);
         ReQueryVA(vlID_CREDITO, False, cont1);
         cont1:=cont1+1;
      end;
   end;

   If (cont1 = 0) Then strgrdCanc.RowCount := 1
   else  strgrdCanc.RowCount := cont1;

   ShowMessage('Informacion Procesada con Exito');
 end;
// else
//  begin
//   ShowMessage('    No tiene suficientes permisos para esta Acción');
//  end;
end;

procedure TWCrCancPas.strgrdCancDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var str : String;
    Bmp : TBitmap;
    sTexto: String;           // Texto que va a imprimir en la celda actual
    Alineacion: TAlignment;   // Alineación que le vamos a dar al texto
    iAnchoTexto: Integer;     // Ancho del texto a imprimir en pixels
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin

      If (gdSelected In State) Then Canvas.Brush.Color := clWhite;

      Canvas.Font.Color := clBlack;

      str := Cells[CO_COL_SITCRE,ARow];
      If (str = 'Error en Validacion') Then
      begin
         Canvas.Font.Color := clRed;
         Canvas.Font.Style := [fsBold];
      end;
      If (str = 'Validacion Correcta')or(str = 'Procesado')or(str = 'Reversa Correcta') Then
      begin
         Canvas.Font.Color := clGreen;
         Canvas.Font.Style := [fsBold];
      end;
      If (Cells[CO_COL_SITPROCESO,ARow] = 'Procesado') then
      begin
         Canvas.Font.Color := clGreen;
         Canvas.Font.Style := [fsBold];
      end;

      Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);


      if (ACol = CO_COL_IDCREDITO)or(ACol = CO_COL_ENTDES)or(ACol = CO_COL_PROGRAMA)or(ACol = CO_COL_PCT)or(ACol = CO_COL_CHECK)or
         (ACol = CO_COL_F_CUFEGA)or(ACol = CO_COL_DIAS_FEGA) then
         Alineacion := taCenter;

      if (ACol = CO_COL_CAP)or(ACol = CO_COL_INT)or(ACol = CO_COL_FA) then
         Alineacion := taRightJustify;

      if (ACol = CO_COL_SITPROCESO)or(ACol = CO_COL_SITCRE) then
         Alineacion := taLeftJustify;

      sTexto := Cells[ACol,ARow];
      Canvas.FillRect( Rect );
      iAnchoTexto := Canvas.TextWidth( sTexto );

      case Alineacion of
        taLeftJustify:  Canvas.TextOut( Rect.Left + 5, Rect.Top + 2, sTexto );
        taCenter:       Canvas.TextOut( Rect.Left + ( ( Rect.Right - Rect.Left ) - iAnchoTexto ) div 2, Rect.Top + 2, sTexto );
        taRightJustify: Canvas.TextOut( Rect.Right - iAnchoTexto - 2, Rect.Top + 2, sTexto );
      end;


      If (ACol = CO_COL_CHECK) Then
      Begin
         Bmp := TBitmap.Create;
         If (Cells[CO_COL_CHECK,ARow] = CO_CHECKED) Then ImageList.GetBitmap(1,Bmp)
         Else ImageList.GetBitmap(0,Bmp);
         Canvas.Draw(Rect.Left,Rect.Top,Bmp);
         Bmp.FreeImage;
         Bmp.Free;
      End;
  End;
end;

procedure TWCrCancPas.RopcionClick(Sender: TObject);
begin
   MemoMessages.Clear;
   ClearGrid(strgrdCanc,0);
   ConfGrid(strgrdCanc);
   nRow := 0;

   cbAcreditado.Checked:=false;
   chbxCESION.Checked:=false;

   if Ropcion.ItemIndex=0 then
   begin
      BRedesctoCERO.Visible:=true;
      GBVenc.Visible:=true;
      GBreversa.Visible:=false;

      edID_ACREDITADO.Enabled:=true;
      edID_CESION.Enabled:=true;

      btID_ACREDITADO.Enabled:=true;
      btID_CESION.Enabled:=true;

      edID_ACREDITADO.Color:=clWindow;
      edID_CESION.Color:=clWindow;

      edF_Aplicacion.Enabled:=true;
      dtpF_Aplicacion.Enabled:=true;

      edF_Aplicacion.Color:=clWindow;

      BBBusca.Enabled:=true;

      Label4.Caption:='Status Credito';

      CBdevpasivo.Visible:=true;
      CBdevpasivo.Checked:=false;
      dtpF_RECUPERACION.Visible:=true;
   end;

   if Ropcion.ItemIndex=1 then
   begin
      BRedesctoCERO.Visible:=false;
      GBVenc.Visible:=false;
      GBreversa.Visible:=true;

      edID_ACREDITADO.Enabled:=false;
      edID_CESION.Enabled:=false;

      btID_ACREDITADO.Enabled:=false;
      btID_CESION.Enabled:=false;

      edID_ACREDITADO.Color:=clBtnFace;
      edID_CESION.Color:=clBtnFace;

      edF_Aplicacion.Enabled:=false;
      dtpF_Aplicacion.Enabled:=false;

      edF_Aplicacion.Color:=clBtnFace;

      BBBusca.Enabled:=false;

      Label4.Caption:='Fecha Proceso';

      CBdevpasivo.Visible:=false;
      dtpF_RECUPERACION.Visible:=false;      
   end;
end;

procedure TWCrCancPas.strgrdCancMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol, nRow : Integer;
    MInstDesc      : TMInstDesc;
    MPrgApoyo      : TMPrgApoyo;
    MDispFond      : TMDispFond;
begin
   strgrdCanc.MouseToCell(X, Y, nCol, nRow);
   if nCol = CO_COL_CHECK then
   begin
      if strgrdCanc.Cells[CO_COL_SITCRE, nRow] <> 'Error en Validacion' then
         InvertCheck(strgrdCanc, CO_COL_CHECK, nRow);
   end;

//   if nCol = CO_COL_IDCREDITO then
//   begin
    {$WARNINGS OFF}
//     MDispFond := TMDispFond.Create(self);
    {$WARNINGS ON}
{    try
       MDispFond.Apli:=Objeto.Apli;
       MDispFond.ParamCre:=Objeto.ParamCre;
       MDispFond.ID_CREDITO.AsString := strgrdCanc.Cells[CO_COL_IDCREDITO , nRow];
       MDispFond.vgIdCredito := StrToInt(strgrdCanc.Cells[CO_COL_IDCREDITO , nRow]);
       MDispFond.CVE_FND_ENT_DES.AsString := strgrdCanc.Cells[CO_COL_ENTDES, nRow];
       MDispFond.CVE_FND_PROGRAMA.AsString := strgrdCanc.Cells[CO_COL_PROGRAMA, nRow];
       MDispFond.FindKey([ strgrdCanc.Cells[CO_COL_IDCREDITO, nRow], strgrdCanc.Cells[CO_COL_ENTDES, nRow], strgrdCanc.Cells[CO_COL_PROGRAMA, nRow] ]);
       MDispFond.Consulta;
    finally
      MDispFond.Free;
    end;
   end;
 }

   if nCol = CO_COL_ENTDES then
   begin
    {$WARNINGS OFF}
     MInstDesc := TMInstDesc.Create(self);
    {$WARNINGS ON}
    try
       MInstDesc.Apli:=Objeto.Apli;
       MInstDesc.ParamCre:=Objeto.ParamCre;
       MInstDesc.CVE_FND_ENT_DES.AsString := strgrdCanc.Cells[CO_COL_ENTDES, nRow];
       MInstDesc.FindKey([strgrdCanc.Cells[CO_COL_ENTDES, nRow]]);
       MInstDesc.Consulta;
    finally
      MInstDesc.Free;
    end;
   end;

   if nCol = CO_COL_PROGRAMA then
   begin
    {$WARNINGS OFF}
     MPrgApoyo := TMPrgApoyo.Create(self);
    {$WARNINGS ON}
    try
       MPrgApoyo.Apli:=Objeto.Apli;
       MPrgApoyo.ParamCre:=Objeto.ParamCre;
       MPrgApoyo.CVE_FND_ENT_DES.AsString := strgrdCanc.Cells[CO_COL_ENTDES, nRow];
       MPrgApoyo.CVE_FND_PROGRAMA.AsString := strgrdCanc.Cells[CO_COL_PROGRAMA, nRow];
       MPrgApoyo.FindKey([strgrdCanc.Cells[CO_COL_ENTDES, nRow], strgrdCanc.Cells[CO_COL_PROGRAMA, nRow]]);
       MPrgApoyo.Consulta;
    finally
      MPrgApoyo.Free;
    end;
   end;


end;

procedure TWCrCancPas.edID_CESIONChange(Sender: TObject);
begin
    If Trim(edID_CESION.Text)<>'' Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End Else Begin
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End;
end;

procedure TWCrCancPas.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);

        Buscanombre(edID_CESION.Text);
        cbAcreditado.Checked:=False;
        EnableCheckBox(cbAcreditado, edID_ACREDITADO, edNOMBRE_ACRED);
    End;
end;

procedure TWCrCancPas.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        cbAcreditado.Checked:=True;
        cbAcreditado.Enabled:=True;
        InterForma1.NextTab(edID_ACREDITADO);

        chbxCesion.Checked:=False;
        EnableCheckBox(chbxCESION, edID_CESION, edCESION);
    End;
end;

procedure TWCrCancPas.edID_ACREDITADOChange(Sender: TObject);
begin
    If Trim(edID_ACREDITADO.Text)<>'' Then Begin
        cbAcreditado.Checked:=True;
        cbAcreditado.Enabled:=True;
    End Else Begin
        cbAcreditado.Checked:=False;
        cbAcreditado.Enabled:=False;
    End;
end;

procedure TWCrCancPas.chbxCESIONClick(Sender: TObject);
begin
   EnableCheckBox(chbxCESION, edID_CESION, edCESION);

   cbAcreditado.Checked:=False;
   EnableCheckBox(cbAcreditado, edID_ACREDITADO, edNOMBRE_ACRED);

   MemoMessages.Clear;
   ClearGrid(strgrdCanc,0);
   ConfGrid(strgrdCanc);
end;

procedure TWCrCancPas.cbAcreditadoClick(Sender: TObject);
begin
   EnableCheckBox(cbAcreditado, edID_ACREDITADO, edNOMBRE_ACRED);

   chbxCesion.Checked:=False;
   EnableCheckBox(chbxCESION, edID_CESION, edCESION);
   Objeto.Acreditado.Active := cbAcreditado.Checked;

   MemoMessages.Clear;
   ClearGrid(strgrdCanc,0);
   ConfGrid(strgrdCanc);
end;

procedure TWCrCancPas.ilCesionCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TWCrCancPas.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrCancPas.btID_CESIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCANCPAS_DISP',True,True) then
   begin
       Objeto.Credito.BuscaWhereString:= ' CONTRATO.ID_EMPRESA ='+ IntToStr(Objeto.Apli.IdEmpresa);
       Objeto.Credito.ShowAll := True;
       if Objeto.Credito.Busca then begin
            chbxCESION.Checked:=True;
            chbxCESION.Enabled:=True;
            InterForma1.NextTab(edID_CESION);

            Buscanombre(edID_CESION.Text);
            cbAcreditado.Checked:=False;
            EnableCheckBox(cbAcreditado, edID_ACREDITADO, edNOMBRE_ACRED);
       End;
   end;
end;

procedure TWCrCancPas.btID_ACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCANCPAS_ACRED',True,True) then
   begin
       Objeto.Acreditado.ShowAll := True;
       If Objeto.Acreditado.Busca Then Begin
            cbAcreditado.Checked:=True;
            cbAcreditado.Enabled:=True;
            InterForma1.NextTab(edID_ACREDITADO);

            chbxCesion.Checked:=False;
            EnableCheckBox(chbxCESION, edID_CESION, edCESION);
       End;
   end;
end;

procedure TWCrCancPas.BBBuscaClick(Sender: TObject);
var vlClave : String;
begin
//JFOF VALIDA USUARIO 12/10/2011
//    vlClave := '27';
// if ValidaUsuario(Objeto.Apli,vlclave) then
//JFOF VALIDA USUARIO 12/10/2011
   if Objeto.ValidaAccesoEsp('TCRCANCPAS_BUSCA',True,True) then
   begin

   if (cbAcreditado.Checked)or(chbxCESION.Checked) then
   begin
      CBdevpasivo.Checked:=false;
      MemoMessages.Clear;
      ClearGrid(strgrdCanc,0);
      ConfGrid(strgrdCanc);
      nRow := 0;

      if (cbAcreditado.Checked) then
         vlSql :=  ' SELECT ID_CREDITO, CVE_FND_ENT_DES, CVE_FND_PROGRAMA, PCT_REDESCONTADO FROM CR_FND_CREDITO '+
                   '  WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_CREDITO '+
                   '                       WHERE ID_CONTRATO IN ( SELECT ID_CONTRATO FROM CONTRATO '+
                   '                                               WHERE ID_TITULAR = '+edID_ACREDITADO.Text+
                   '                                            ) ' +
//                   '                         AND SIT_CREDITO IN (''AC'')' +
                   '                       )';

      if (chbxCESION.Checked) then
         vlSql := ' SELECT ID_CREDITO, CVE_FND_ENT_DES, CVE_FND_PROGRAMA, PCT_REDESCONTADO FROM CR_FND_CREDITO '+
                  '  WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_CREDITO ' +
                  '                        WHERE ID_CREDITO = '+edID_CESION.Text +
//                  '                          AND SIT_CREDITO IN (''AC'')' +
                  '                       )';

      vlQry := GetSQLQuery(vlSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

      try
        if vlQry <> nil then
        begin
           while not vlQry.Eof do
           begin
              vlID_CREDITO :=  vlQry.FieldByName('ID_CREDITO').asString;
              ValidaCredito(vlID_CREDITO, vlQry.FieldByName('CVE_FND_ENT_DES').AsString, vlQry.FieldByName('CVE_FND_PROGRAMA').AsString, vlQry.FieldByName('PCT_REDESCONTADO').AsString);
              ReQueryVA(vlID_CREDITO, True, nrow);

              vlQry.Next;
           end;
        end;
      finally
        if vlQry <> nil then vlQry.free;
      end;
      strgrdCanc. RowCount := nRow;
    end;
  end;
//  else
//  begin
//   ShowMessage('    No tiene suficientes permisos para esta Acción');
//  end;
end;

procedure TWCrCancPas.edF_AplicacionChange(Sender: TObject);
begin
   if Trim(edF_Aplicacion.Text)<>'' then
   begin
      if StrToDate(edF_Aplicacion.Text) > Objeto.Apli.DameFechaEmpresa then
      begin
         ShowMessage('La fecha no puede ser mayor al dia de HOY');
         dtpF_Aplicacion.DateTime:= Objeto.Apli.DameFechaEmpresa;
         edF_Aplicacion.text:=FormatDateTime('dd/mm/yyyy',dtpF_Aplicacion.DateTime);
      end
      else
         vlF_APLICACION:=edF_Aplicacion.Text;

      MemoMessages.Clear;
      ClearGrid(strgrdCanc,0);
      ConfGrid(strgrdCanc);         
   end;
end;

procedure TWCrCancPas.CBdevpasivoClick(Sender: TObject);
begin
   if CBdevpasivo.Checked=true then
   begin
      dtpF_RECUPERACION.Enabled:=true;
   end;
   if CBdevpasivo.Checked=false then
   begin
      dtpF_RECUPERACION.Enabled:=false;
      dtpF_RECUPERACION.Date := Objeto.Apli.DameFechaEmpresa;
   end;
end;

procedure TWCrCancPas.BRedesctoCEROClick(Sender: TObject);
var
   cont1, RegTot : word;
   bproc : boolean;
   vlQry : TQuery;
   vlClave : String;
begin
//JFOF VALIDA USUARIO 12/10/2011
//    vlClave := '01';
// if ValidaUsuario(Objeto.Apli,vlclave) then
//JFOF VALIDA USUARIO 12/10/2011
   if Objeto.ValidaAccesoEsp('TCRCANCPAS_REDS0',True,True) then
   begin

  if MessageDlg('Este proceso Cancela Pasivos con Porcentaje Redescontado en CERO (NAFIN), ¿Desea Continuar?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
  Begin

   MemoMessages.Clear;
   cont1:=0;
   RegTot:=strgrdCanc.RowCount;

   if Ropcion.Itemindex = 0 then //Cancelacion Pasiva
   begin
      while (cont1 <= RegTot) do
      begin
         bproc :=false;
         //if (trim(strgrdCanc.Cells[CO_COL_SITPROCESO, cont1])='Por Procesar') AND (trim(strgrdCanc.Cells[CO_COL_SITCRE, cont1])='Validacion Correcta') AND
         //   (trim(strgrdCanc.Cells[CO_COL_CHECK, cont1])=CO_CHECKED) then
         if (trim(strgrdCanc.Cells[CO_COL_PCT, cont1])='0') then
         begin
            bproc :=true;

            if bproc then
            begin
               Lcreditos.Items.Add(strgrdCanc.Cells[CO_COL_IDCREDITO, cont1]);
               Lentdes.Items.Add(strgrdCanc.Cells[CO_COL_ENTDES, cont1]);
               Lprograma.Items.Add(strgrdCanc.Cells[CO_COL_PROGRAMA, cont1]);
            end;
         end;
         cont1:=cont1+1;
      end;

      ClearGrid(strgrdCanc,0);
      cont1:=0;
      while (cont1 <= Lcreditos.Items.Count-1) do
      begin
         vlID_CREDITO:=Lcreditos.Items.Strings[cont1];
         //Cancela_Redescto_CERO(StrToInt(vlID_CREDITO));
         try
           vlQry := TQuery.Create(Self);
           vlQry.DatabaseName  := Objeto.Apli.DataBaseName;
           vlQry.SessionName   := Objeto.Apli.SessionName;
           vlQry.close;

           vlQry.SQL.Text:= ' UPDATE CR_FND_CREDITO ' +
                            '	  SET SIT_CREDITO=''LQ'' ' +
                            ' WHERE ID_CREDITO =  ' +  vlID_CREDITO +
                            '   AND PCT_REDESCONTADO = 0 ';
           vlQry.ExecSQL;

         finally
             vlQry.close;
         end;

         ReQueryVA(vlID_CREDITO, False, cont1);
         cont1:=cont1+1;
      end;
   end;

   If (cont1 = 0) Then strgrdCanc.RowCount := 1
   else strgrdCanc.RowCount := cont1;

   ShowMessage('Informacion Procesada con Exito');
  end;

 end;
//  else
//  begin
//   ShowMessage('    No tiene suficientes permisos para esta Acción');
//  end;

 end;

 end.
