// Sistema         : Clase de CR_COB_MCHQRA
// Fecha de Inicio : 07/07/2005
// Función forma   : Clase de CR_COB_MCHQRA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Sergio Eduardo Lopez Lopez
// Comentarios     :
Unit IntCrCobMchq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, CheckLst, InterEdit, IntSGCtrl,
  Grids, Aligrid, ImgList,

  IntConTransa,  // Consulta Depositos a la Vista
  IntCrCto,      // Contrato
  IntCrCobConst, // Constantes y procedimientos de la cobranza
  IntGenCre,     // Constantes de creditos
  Menus
  ;

Type
  TCrCobMchq= class;

  TWCrCobMchqra=Class(TForm)
    InterForma1             : TInterForma;
    lbCAMPO1 : TLabel;
    Label1: TLabel;
    sagDatos: TStringAlignGrid;
    ImageList: TImageList;
    pTitle: TPanel;
    edTIT_SEL: TEdit;
    edTIT_FECHA: TEdit;
    edTIT_MODO_PAGO: TEdit;
    Label2: TLabel;
    edIMP_TOTAL: TInterEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    edIMP_REAL: TInterEdit;
    edIMP_COMPROMETIDO: TInterEdit;
    edIMP_DISPONIBLE: TInterEdit;
    lbIMP_X_CUBRIR: TLabel;
    edIMP_X_CUBRIR: TInterEdit;
    edIMP_COBRANZA: TInterEdit;
    PopupMenu1: TPopupMenu;
    CargaArchivo1: TMenuItem;
    OpenDialog: TOpenDialog;
    btCargaArchivo: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure sagDatosDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure sagDatosMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sagDatosSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure sagDatosDblClick(Sender: TObject);
    procedure sagDatosKeyPress(Sender: TObject; var Key: Char);
    procedure CargaArchivo1Click(Sender: TObject);
    procedure btCargaArchivoClick(Sender: TObject);
    procedure sagDatosExit(Sender: TObject);
  private
    fFound     : Boolean;
  private
    procedure AsignaColRow( peColor : TColor; peRow : Integer );
  private
    function  CargaConfChqra(sFileName : String; cSep : char; cTexto : char ):Boolean;
  private
    procedure SumaImportes;
    procedure InicializaPantalla;
    procedure LimpiaGrid;
    procedure SaveData( IdCredito : Integer;    RowGrid   : Integer;
                        IdCtoLiq  : Integer;    ImpAplica : Currency;
                        BAplica   : String );
    procedure ValidaMontos;
  public
    property Found : Boolean  read fFound write fFound;
  public
    Objeto : TCrCobMchq;
  end;

  TCrCobMchq= class(TInterFrame)
  private
  protected
    function   funObtTitular( pIdContrato  : Integer ):String;
    procedure  stpObtChqraCred(peIdCredito : Integer; var pNumChqras: Integer;
                               var pResult: Integer;  var pTxResult: String );
    procedure  stpObtIndChqra( peIdCredito,
                               peNumItem      : Integer;
                               var pIdCtoLiq  : Integer;
                               var pImpAplica : Double;
                               var pBAplica   : String;
                               var pResult    : Integer;
                               var pTxResult  : String );
    procedure  stpUpdItemChqra( peIdCredito,
                                peItemChqra    : Integer;
                                pIdCtoLiq      : Integer;
                                pImpAplica     : Double;
                                pBAplica       : String;
                                var pResult    : Integer;
                                var pTxResult  : String );
    procedure  stpClrValItemChqra( peMetodo        : Integer;
                                   peIdCredito     : Integer;
                                   pIdCtoLiq       : Integer;
                                   var psItemChqra : Integer;
                                   var pResult     : Integer;
                                   var pTxResult   : String );
  public
    //
    ID_CREDITO   : TInterCampo;
    B_APLICA     : TInterCampo;
    ID_CTO_LIQ   : TInterCampo;
    IMP_APLICA   : TInterCampo;
    //
    COBRANZA     : TInterCampo;
    TIPO_FILTRO  : TInterCampo;
    //
    IMP_COBRANZA : TInterCampo;
    IMP_DISP_TOT : TInterCampo;
    IMP_COMP_TOT : TInterCampo;
    IMP_REAL_TOT : TInterCampo;
    IMP_APCA_TOT : TInterCampo;
    IMP_X_CUBRIR : TInterCampo;
    //
    CrContrato   : TCrCto;
    ConTransa    : TConTransa;
    //
    function     InternalBusca : Boolean; override;
    constructor  Create( AOwner : TComponent ); override;
    destructor   Destroy; override;
    function     ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function     Reporte:Boolean; override;
  published
  end;

const
  COL_BAP  = 0;
  COL_CTO  = 1;
  COL_TIT  = 2;
  COL_SDI  = 3;
  COL_SCO  = 4;
  COL_SRE  = 5;
  COL_IMP  = 6;
  COL_IMA  = 7;
  coPosSel = 10;

  coMsgImp = '¿Deseas modificar el importe a aplicar de %m a %m';
  coFmtCurrency = '###,###,###,###,###,###,###,##0.00';


implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrCobMchq.Create( AOwner : TComponent );
begin
  Inherited;
  ID_CREDITO   := CreaCampo( 'ID_CREDITO',   ftString, tsNinguno, tsNinguno, False );
  B_APLICA     := CreaCampo( 'B_APLICA',     ftString, tsNinguno, tsNinguno, False );
  ID_CTO_LIQ   := CreaCampo( 'ID_CTO_LIQ',   ftFloat,  tsNinguno, tsNinguno, False );
  IMP_COBRANZA := CreaCampo( 'IMP_COBRANZA', ftFloat,  tsNinguno, tsNinguno, False );
  IMP_APLICA   := CreaCampo( 'IMP_APLICA',   ftFloat,  tsNinguno, tsNinguno, False );
  //
  COBRANZA     := CreaCampo( 'COBRANZA',     ftFloat,  tsNinguno, tsNinguno, False );
  TIPO_FILTRO  := CreaCampo( 'TIPO_FILTRO',  ftFloat,  tsNinguno, tsNinguno, False );
  // TOTALES
  IMP_DISP_TOT := CreaCampo( 'IMP_DISP_TOT', ftFloat,  tsNinguno, tsNinguno, False );
  IMP_COMP_TOT := CreaCampo( 'IMP_COMP_TOT', ftFloat,  tsNinguno, tsNinguno, False );
  IMP_REAL_TOT := CreaCampo( 'IMP_REAL_TOT', ftFloat,  tsNinguno, tsNinguno, False );
  IMP_APCA_TOT := CreaCampo( 'IMP_APCA_TOT', ftFloat,  tsNinguno, tsNinguno, False );
  IMP_X_CUBRIR := CreaCampo( 'IMP_X_CUBRIR', ftFloat,  tsNinguno, tsNinguno, False );
  // Autorizacion
  CrContrato := TCrCto.Create(self);
  CrContrato.MasterSource := Self;
  // Chequera
  ConTransa := TConTransa.Create( Self );
  ConTransa.MasterSource := Self;

  //
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntCrCobMchq.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrCobMchq.Destroy;
begin
  inherited;
  // Catalogos de "Informacion General"
  if CrContrato <> nil then
     CrContrato.Free;
  //end if
  if ConTransa <> nil then
     ConTransa.free;
  //end if
end;


function TCrCobMchq.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCobMchqra;
begin
   W:=TWCrCobMchqra.Create(Self);
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


Function TCrCobMchq.InternalBusca:Boolean;
Var T : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrCoMc.it','');
  Try
    if Active then begin end;
    if T.Execute then InternalBusca := FindKey([]);
  finally
    T.Free;
  end;
end;

function TCrCobMchq.Reporte:Boolean;
begin //Execute_Reporte();
end;


procedure TCrCobMchq.stpObtChqraCred(peIdCredito : Integer; var pNumChqras: Integer;
                                     var pResult: Integer;  var pTxResult: String );
var stpObtChqraCr : TStoredProc;
begin
  pNumChqras := 0;
  pResult    := 0;
  pTxResult  := '';
  //
  stpObtChqraCr := TStoredProc.Create(nil);
  try
    with stpObtChqraCr do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName := 'PKGCRCOBRANZA.STPOBTCHQRACRED';
      Params.Clear;
      Params.CreateParam(ftFloat,   'PEIDCREDITO',   ptInput  );
      Params.CreateParam(ftFloat,   'PSNUMCHQRAS',   ptOutput );
      Params.CreateParam(ftFloat,   'PSRESULTADO',   ptOutput );
      Params.CreateParam(ftString,  'PSTXRESULTADO', ptOutput );
      ParamByName('PEIDCREDITO').AsInteger := peIdCredito;
      ExecProc;
      pResult    := ParamByName('PSResultado').AsInteger;
      pTxResult  := ParamByName('PSTxResultado').AsString;
      if (ParamByName('PSResultado').AsInteger = 0) then
      begin
        pNumChqras := ParamByName('psNumChqras').AsInteger;
      end;
    end;
  finally
    if stpObtChqraCr <> nil then
      stpObtChqraCr.Free;
  end;
end;

procedure TCrCobMchq.stpObtIndChqra(peIdCredito, peNumItem: Integer;
  var pIdCtoLiq: Integer; var pImpAplica: Double; var pBAplica: String;
  var pResult: Integer;   var pTxResult: String);
var stpObtItemChqr : TStoredProc;
begin
  pIdCtoLiq  := 0;
  pImpAplica := 0;
  pBAplica   := '';
  pResult    := 0;
  pTxResult  := '';
  //
  stpObtItemChqr := TStoredProc.Create(nil);
  try
    with stpObtItemChqr do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName := 'PKGCRCOBRANZA.STPOBTITEMCHQRA';
      Params.Clear;
      Params.CreateParam(ftFloat,   'PEIDCREDITO',   ptInput  );
      Params.CreateParam(ftFloat,   'PEITEMCHQRA',   ptInput  );
      Params.CreateParam(ftFloat,   'PSIDCTOLIQ',    ptOutput );
      Params.CreateParam(ftFloat,   'PSIMPAPLICA',   ptOutput );
      Params.CreateParam(ftString,  'PSBAPLICA',     ptOutput );
      Params.CreateParam(ftFloat,   'PSRESULTADO',   ptOutput );
      Params.CreateParam(ftString,  'PSTXRESULTADO', ptOutput );
      ParamByName('PEIDCREDITO').AsInteger := peIdCredito;
      ParamByName('PEITEMCHQRA').AsInteger := peNumItem;
      ExecProc;
      pResult   := ParamByName('PSRESULTADO').AsInteger;
      pTxResult := ParamByName('PSTXRESULTADO').AsString;
      if (ParamByName('PSResultado').AsInteger = 0) then
      begin
        pIdCtoLiq  := ParamByName('PSIDCTOLIQ').AsInteger;
        pImpAplica := ParamByName('PSIMPAPLICA').AsFloat;
        pBAplica   := ParamByName('PSBAPLICA').AsString;
      end;
    end;
  finally
    if stpObtItemChqr <> nil then
      stpObtItemChqr.Free;
  end;
end;

procedure TCrCobMchq.stpUpdItemChqra(peIdCredito, peItemChqra,
  pIdCtoLiq: Integer; pImpAplica: Double; pBAplica: String;
  var pResult: Integer; var pTxResult: String);
var stpUpdItemChqr : TStoredProc;
begin
  pResult    := 0;
  pTxResult  := '';
  //
  stpUpdItemChqr := TStoredProc.Create(nil);
  try
    with stpUpdItemChqr do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName := 'PKGCRCOBRANZA.STPUPDITEMCHQRA';
      Params.Clear;
      Params.CreateParam(ftFloat,   'PEIDCREDITO',   ptInput  );
      Params.CreateParam(ftFloat,   'PEITEMCHQRA',   ptInput  );
      Params.CreateParam(ftFloat,   'PEIDCTOLIQ',    ptInput  );
      Params.CreateParam(ftFloat,   'PEIMPAPLICA',   ptInput  );
      Params.CreateParam(ftString,  'PEBAPLICA',     ptInput  );
      Params.CreateParam(ftFloat,   'PSRESULTADO',   ptOutput );
      Params.CreateParam(ftString,  'PSTXRESULTADO', ptOutput );
      ParamByName('PEIDCREDITO').AsInteger := peIdCredito;
      ParamByName('PEITEMCHQRA').AsInteger := peItemChqra;
      ParamByName('PEIDCTOLIQ' ).AsInteger := pIdCtoLiq;
      ParamByName('PEIMPAPLICA').AsFloat   := pImpAplica;
      ParamByName('PEBAPLICA'  ).AsString  := pBAplica;
      ExecProc;
      pResult   := ParamByName('PSRESULTADO').AsInteger;
      pTxResult := ParamByName('PSTXRESULTADO').AsString;
    end;
  finally
    if stpUpdItemChqr <> nil then
      stpUpdItemChqr.Free;
  end;
end;
//
procedure TCrCobMchq.stpClrValItemChqra(peMetodo, peIdCredito, pIdCtoLiq: Integer;
            var psItemChqra, pResult: Integer; var pTxResult: String);
var stpUpdItemChqr : TStoredProc;
begin
  pResult := 0;        pTxResult := '';
  //
  stpUpdItemChqr := TStoredProc.Create(nil);
  try
    with stpUpdItemChqr do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName := 'PKGCRCOBRANZA.STPCLRVALITEMCHQRA';
      Params.Clear;
      Params.CreateParam(ftFloat,   'PEMETODO',      ptInput  );
      Params.CreateParam(ftFloat,   'PEIDCREDITO',   ptInput  );
      Params.CreateParam(ftFloat,   'PEIDCTOLIQ',    ptInput  );
      Params.CreateParam(ftFloat,   'PSITEMCHQRA',   ptOutput );
      Params.CreateParam(ftFloat,   'PSRESULTADO',   ptOutput );
      Params.CreateParam(ftString,  'PSTXRESULTADO', ptOutput );
      ParamByName('PEMETODO').AsInteger    := peMetodo;
      ParamByName('PEIDCREDITO').AsInteger := peIdCredito;
      ParamByName('PEIDCTOLIQ' ).AsInteger := pIdCtoLiq;
      ExecProc;
      psItemChqra := ParamByName('PSITEMCHQRA').AsInteger;
      pResult     := ParamByName('PSRESULTADO').AsInteger;
      pTxResult   := ParamByName('PSTXRESULTADO').AsString;
    end;
  finally
    if stpUpdItemChqr <> nil then
      stpUpdItemChqr.Free;
  end;
end;
//
function TCrCobMchq.funObtTitular(pIdContrato: Integer): String;
begin
  GetSQLStr( 'SELECT SPF_NOMBRE_CTTE(ID_CONTRATO, ID_TITULAR) AS NOMBRE ' +
             'FROM   CONTRATO WHERE  ID_CONTRATO = ' +  IntToStr( pIdContrato ),
             Apli.DataBaseName, Apli.SessionName, 'NOMBRE', Result, False );
end;


(***********************************************FORMA CR_COB_MCHQRA********************)
(*                                                                              *)
(*  FORMA DE CR_COB_MCHQRA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_COB_MCHQRA********************)
function  TWCrCobMchqra.CargaConfChqra(sFileName : String; cSep : char; cTexto : char ):Boolean;
const
    coChequera  = 1;
    coTitular   = 2;
    coMonto     = 3;
    coMaxPos    = 4;
    //
    coHdrChqra   = 'CHEQUERA';
    coHdrTitular = 'TITULAR';
    coHdrMonto   = 'IMPORTE A APLICAR';
//
var F : TextFile;
    sHeader  : string;
    aHeader  : TArrayString;
    sRecord  : string;
    aRecord  : TArrayString;
    nTokens  : Integer;
    aPosItem : Array [1 .. 4 ] of Integer;
    i        : Integer;
    sValChqra   : String;
    sValTitular : String;
    sValMonto   : String;
    iItemChqra  : Integer;
    iResult     : Integer;
    sTxResult   : String;
begin
  // La variable Result indica si se debe o no actualizar la información de la pantalla
  Result := False;
  //
  if not ( ( Objeto.TIPO_FILTRO.AsString = cobpDisp   ) or ( Objeto.TIPO_FILTRO.AsString = cobpNoCtrl ) or
           ( Objeto.TIPO_FILTRO.AsString = cobpIdFIRA )
         )then
  Begin
    MessageDlg( 'Para esta opción el tipo de cobranza debe ser por disposición',
                mtInformation, [mbOk], 0 );
    Exit;
  End;
  //
  if not FileExists(sFileName) then
  Begin
    MessageDlg( 'Favor de validar que exista el archivo' + #13#10 + sFileName,
                mtInformation, [mbOk], 0 );
    Exit;
  End;
  //
  if not MessageDlg( '¿Desea procesar la información del archivo ' + sFileName + '?',
                     mtInformation, [mbOk], 0 ) = mrOk then
  Begin
    ShowMessage('Proceso abortado');
    Exit;
  End;//ends_if
  //
  Result := True;
  //
  AssignFile(F, sFileName);
  Reset ( F );
  try
     Readln( F, sHeader );
     nTokens := ParseQuotedString( aHeader, sHeader, cSep, cTexto );
     //
     FillChar(aPosItem, sizeof(aPosItem), #0 );
     aPosItem[coChequera] := -1;
     aPosItem[coTitular ] := -1;
     aPosItem[coMonto   ] := -1;
     aPosItem[coMaxPos  ] := -1;
     //
     for i := Low(aHeader) to High(aHeader) do
     Begin
       if UpperCase( aHeader[i] ) = UpperCase( coHdrChqra ) then
       Begin
         If aPosItem[coChequera] <> -1 then
           Raise Exception.Create('La columna "' + coHdrChqra + '" esta duplicada en el archivo ' + sFileName );
         //Ends if;
         aPosItem[coChequera] := i;
         if aPosItem[coMaxPos] < i then
            aPosItem[coMaxPos] := i;
         //Ends if;
       End
       else if UpperCase( aHeader[i] ) = UpperCase( coHdrTitular ) then
       Begin
         If aPosItem[coTitular] <> -1 then
           Raise Exception.Create('La columna "' + coHdrTitular + '" esta duplicada en el archivo ' + sFileName );
         //Ends if;
         aPosItem[coTitular] := i;
         if aPosItem[coMaxPos] < i then
            aPosItem[coMaxPos] := i;
         //Ends if;
       End
       else if UpperCase( aHeader[i] ) = UpperCase( coHdrMonto ) then
       Begin
         If aPosItem[ coMonto ] <> -1 then
           Raise Exception.Create('La columna "' + coHdrMonto + '" esta duplicada en el archivo ' + sFileName );
         //Ends if;
         aPosItem[coMonto] := i;
         if aPosItem[coMaxPos] < i then
            aPosItem[coMaxPos] := i;
         //Ends if;
       End;
     End;
     //
     If aPosItem[ coChequera ] = -1 then
       Raise Exception.Create('La columna "' + coHdrChqra + '" no existe en el archivo ' + sFileName )
     Else If aPosItem[ coTitular ] = -1 then
       Raise Exception.Create('La columna "' + coHdrTitular + '" no existe en el archivo ' + sFileName )
     Else If aPosItem[ coMonto ] = -1 then
       Raise Exception.Create('La columna "' + coHdrMonto + '" no existe en el archivo ' + sFileName );
     //Ends_if
     //
     Objeto.stpClrValItemChqra( 1, Objeto.ID_CREDITO.AsInteger, 0, iItemChqra, iResult, sTxResult );
     if iResult <> 0 then
       Raise Exception.Create('Error al inicializar la estructura de chequeras: ' + coCRLF +
                   'Código:'  + IntToStr( iResult ) + coCRLF +
                   'Mensaje:' + sTxResult );
     //Ends_if
     //
     while not Eof( F ) do
     Begin
       Readln( F, sRecord );
       nTokens := ParseQuotedString( aRecord, sRecord, cSep, cTexto );
       if aPosItem[coMaxPos] + 1 > nTokens  then
         Raise Exception.Create('Favor de validar que el archivo ' + sFileName + ' ' +
                                'tenga el número de columnas correcto en cada registro');
       //ends_if
       sValChqra   := aRecord[ aPosItem[ coChequera ] ];
       sValTitular := aRecord[ aPosItem[ coTitular  ] ];
       sValMonto   := aRecord[ aPosItem[ coMonto    ] ];
       //
       Objeto.stpClrValItemChqra( 2, Objeto.ID_CREDITO.AsInteger, StrToIntDef( sValChqra , 0 ),
                                     iItemChqra,       iResult,   sTxResult );
       if iResult <> 0 then
         Raise Exception.Create( 'Error al actualizar obtener el índice de chequeras: ' + coCRLF +
                                 'Código:'  + IntToStr( iResult ) + coCRLF +
                                 'Mensaje:' + sTxResult );
       //ENDS_IF
       //
       Objeto.stpUpdItemChqra( Objeto.ID_CREDITO.AsInteger,  iItemChqra,
                               StrToIntDef( sValChqra , 0 ), StrToFloat(sValMonto),
                               'V',   iResult,   sTxResult );
       if iResult <> 0 then
         Raise Exception.Create( 'Error al actualizar la estructura de chequeras: ' + coCRLF +
                                 'Código:'  + IntToStr( iResult ) + coCRLF +
                                 'Mensaje:' + sTxResult );
       //ENDS_IF
     End;
     //
  except
    on e : exception do
    Begin
      CloseFile(F);
      MessageDlg(e.Message, mtError, [mbOk], 0 );
    End;
  end;
  ShowMessage('Proceso Terminado');
end;
//
procedure TWCrCobMchqra.SumaImportes;
var vlRow   : Integer;
    vlTotal : Double;
begin
  Objeto.IMP_DISP_TOT.AsFloat := 0;
  Objeto.IMP_COMP_TOT.AsFloat := 0;
  Objeto.IMP_REAL_TOT.AsFloat := 0;
  Objeto.IMP_APCA_TOT.AsFloat := 0;
  for vlRow := 0 to sagDATOS.RowCount - 1 do
  begin
    Objeto.IMP_DISP_TOT.AsFloat := Objeto.IMP_DISP_TOT.AsFloat + CurrFromFrmFloat( sagDATOS.Cells[ COL_SDI, vlRow ] );
    Objeto.IMP_COMP_TOT.AsFloat := Objeto.IMP_COMP_TOT.AsFloat + CurrFromFrmFloat( sagDATOS.Cells[ COL_SCO, vlRow ] );
    Objeto.IMP_REAL_TOT.AsFloat := Objeto.IMP_REAL_TOT.AsFloat + CurrFromFrmFloat( sagDATOS.Cells[ COL_SRE, vlRow ] );
    if sagDATOS.Cells[ COL_BAP, vlRow ] = 'V' then
      Objeto.IMP_APCA_TOT.AsFloat := Objeto.IMP_APCA_TOT.AsFloat + CurrFromFrmFloat( sagDATOS.Cells[ COL_IMP, vlRow ] );
    //ends_if
  end;
  Objeto.IMP_X_CUBRIR.AsFloat := CurrFromFrmFloat( FormatFloat( coFmtCurrency, Objeto.IMP_APCA_TOT.AsFloat - Objeto.IMP_COBRANZA.AsFloat ) );
  {}
  Objeto.IMP_DISP_TOT.DrawControl;
  Objeto.IMP_COMP_TOT.DrawControl;
  Objeto.IMP_REAL_TOT.DrawControl;
  Objeto.IMP_APCA_TOT.DrawControl;
  Objeto.IMP_X_CUBRIR.DrawControl;
end;
// +---------------------------------------------------------------------------+
// +                          Limpia la pantalla                               +
// +---------------------------------------------------------------------------+
procedure TWCrCobMchqra.AsignaColRow(peColor: TColor; peRow: Integer);
var vlCol : Integer;
begin
  for vlCol := 0 to sagDATOS.ColCount - 1 do
    sagDATOS.ColorCell[ vlCol, peRow ] := peColor;
end;


procedure TWCrCobMchqra.LimpiaGrid;
var vlCol, vlRow : Integer;
begin
  // Barre el grid de datos y quita la información
  for vlRow := 0 to sagDATOS.RowCount - 1 do
  begin
    for vlCol := 0 to sagDATOS.ColCount - 1 do
    begin
      sagDATOS.Cells    [ vlCol, vlRow ] := '';
      sagDATOS.ColorCell[ vlCol, vlRow ] := clWindow;
    end;
    sagDATOS.RowHeights[ vlRow ] := sagDATOS.DefaultRowHeight;
  end;
  sagDATOS.RowCount := 1;
end;



procedure TWCrCobMchqra.InicializaPantalla;
var NumChqra    : String;
    Querie      : TQuery;
    vlNumChq    : Integer;
    vlCntChqr   : Integer;
    vlIdCtoLiq  : Integer;
    nRowCount   : Integer;
    vlImpAplica : Double;
    vlBAplica   : String;
    vlQrySaldos : String;
    i           : Integer;
    vlSdoDisp   : Real;
    vlSdoComp   : Real;
    vlSdoTot    : Real;
    vlResult    : Integer;
    vlTxResult  : String;
//
begin
  Found    := False;
  LimpiaGrid;
  Objeto.stpObtChqraCred( Objeto.ID_CREDITO.AsInteger, vlNumChq, vlResult, vlTxResult );
  //
  if vlResult = 0  then
  begin
    for vlCntChqr := 1 to vlNumChq do
    begin
      Found    := True;
      Objeto.stpObtIndChqra(Objeto.ID_CREDITO.AsInteger, // peIdCredito,
                            vlCntChqr,                   // peNumItem: Integer;
                            vlIdCtoLiq,                  // var pIdCtoLiq: Integer;
                            vlImpAplica,                 // var pImpAplica: Double;
                            vlBAplica,                   // var pBAplica: String;
                            vlResult,                    // var pResult: Integer;
                            vlTxResult                   // var pTxResult: String
                           );
      //
      vlSdoDisp := 0;      vlSdoComp := 0;      vlSdoTot  := 0;
      for i := 1 to 3 do
      begin
        vlQrySaldos := 'SELECT pkgCrSaldos.StpObtTipSdoCtaDV(' + IntToStr(vlIdCtoLiq) +
                       ',' +  IntToStr(i) + ' ) SALDO FROM DUAL';
        case i of
         1  :  GetSQLFloat( vlQrySaldos, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'SALDO', vlSdoDisp, True );
         2  :  GetSQLFloat( vlQrySaldos, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'SALDO', vlSdoComp, True );
         3  :  GetSQLFloat( vlQrySaldos, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'SALDO', vlSdoTot,  True );
        end;
      end;
      nRowCount := vlCntChqr - 1;
      with sagDATOS do
      begin
        AlignCell[COL_BAP,  nRowCount] := alRight;
        AlignCell[COL_CTO,  nRowCount] := alRight;
        AlignCell[COL_TIT,  nRowCount] := alLeft;
        AlignCell[COL_SDI,  nRowCount] := alRight;
        AlignCell[COL_SCO,  nRowCount] := alRight;
        AlignCell[COL_SRE,  nRowCount] := alRight;
        AlignCell[COL_IMP,  nRowCount] := alRight;
        //
        Cells[COL_BAP, nRowCount] := vlBAplica;
        Cells[COL_CTO, nRowCount] := IntToStr(vlIdCtoLiq);
        Cells[COL_TIT, nRowCount] := Objeto.funObtTitular(vlIdCtoLiq);
        Cells[COL_SDI, nRowCount] := FormatFloat( coFmtCurrency, vlSdoDisp);
        Cells[COL_SCO, nRowCount] := FormatFloat( coFmtCurrency, vlSdoComp);
        Cells[COL_SRE, nRowCount] := FormatFloat( coFmtCurrency, vlSdoDisp - vlSdoComp);
        Cells[COL_IMP, nRowCount] := FormatFloat( coFmtCurrency, vlImpAplica);
        Cells[COL_IMA, nRowCount] := FormatFloat( coFmtCurrency, vlImpAplica);
        if nRowCount mod 2 = 1 then
          AsignaColRow( clBtnFace, nRowCount );
        //ends_if

      end;
      //
      if vlCntChqr < vlNumChq then
         sagDATOS.RowCount := sagDATOS.RowCount + 1;
      //
    end;
    SumaImportes;
  end else
    ShowMessage(vlTxResult);
  //
end;
//
procedure TWCrCobMchqra.FormShow(Sender: TObject);
begin
  Objeto.IMP_COBRANZA.Control  := edIMP_COBRANZA;
  Objeto.IMP_DISP_TOT.Control  := edIMP_DISPONIBLE;
  Objeto.IMP_COMP_TOT.Control  := edIMP_COMPROMETIDO;
  Objeto.IMP_REAL_TOT.Control  := edIMP_REAL;
  Objeto.IMP_APCA_TOT.Control  := edIMP_TOTAL;
  Objeto.IMP_X_CUBRIR.Control  := edIMP_X_CUBRIR;
  InicializaPantalla;
end;
//
procedure TWCrCobMchqra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrCobMchqra.FormDestroy(Sender: TObject);
begin
{}
end;

procedure TWCrCobMchqra.SaveData( IdCredito : Integer;    RowGrid   : Integer;
                                  IdCtoLiq  : Integer;    ImpAplica : Currency;
                                  BAplica   : String );
var vlResult    : Integer;
    vlTxResult  : String;
begin
  Objeto.stpUpdItemChqra( IdCredito, RowGrid + 1,  IdCtoLiq,  ImpAplica,
                          BAplica,   vlResult,     vlTxResult );
  if vlResult <> 0 then
    ShowMessage(vlTxResult);
  //ends_if vlResult <> 0 then
end;


procedure TWCrCobMchqra.ValidaMontos;
var i : integer;
    c1, c2 : currency;
begin
  for i := 0 to sagDatos.RowCount - 1 do
  Begin
    c1 := CurrFromFrmFloat( sagDatos.Cells[COL_IMA , i] );
    c2 := CurrFromFrmFloat( sagDatos.Cells[COL_IMP,  i] );
    if c1 <> c2 then
    Begin
      if MessageDlg( Format( coMsgImp, [ c1, c2 ] ), mtConfirmation, mbYesNoCancel, 0 ) = mrYes  then
      begin
        sagDatos.cells[ COL_IMA, i ]  := FormatFloat( coFmtCurrency, c2 );
        sagDatos.cells[ COL_IMP, i ]  := FormatFloat( coFmtCurrency, c2 );
        SaveData( Objeto.ID_CREDITO.AsInteger, i, StrToIntDef(sagDatos.cells[ COL_CTO, i ], 0 ),
                  CurrFromFrmFloat( sagDatos.cells[ COL_IMP, i ] ), sagDatos.cells[ COL_BAP, i ] );
        SumaImportes;
      end else begin
        sagDatos.cells[ COL_IMA, i ]  := FormatFloat( coFmtCurrency, c1 );
        sagDatos.cells[ COL_IMP, i ]  := FormatFloat( coFmtCurrency, c1 );
      end;
    End;
    //
  End;
end;


procedure TWCrCobMchqra.sagDatosDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Bmp   : TBitmap;
    vlCol : Integer;
  function Rect_(ALeft, ATop, ARight, ABottom : Integer) : TRect;
  var R : TRect;
  begin
    R.Left := ALeft;
    R.Top := ATop;
    R.Right := ARight;
    R.Bottom := ABottom;
    Result := R;
  end;
begin
  with (Sender As TStringGrid) Do
  begin
    if (ACol = COL_BAP) then
    begin
      vlCol := ACol;
      Bmp := TBitmap.Create;
      if Assigned(Bmp) then
      begin
        // Determina la imagen a utilizar
        If Cells[ vlCol, ARow ] = 'V' then
           ImageList.GetBitmap( 1, Bmp )
        else
           ImageList.GetBitmap( 0, Bmp);
        //ends_if
        Canvas.FillRect( Rect_( Rect.Left - 2, Rect.Top - 2, Rect.Right + 2, Rect.Bottom + 2 ) );
        Bmp.TransparentColor := $00E7EFF7; //color de imagelist
        Bmp.Transparent := True;
        Canvas.Draw(Rect.Left,Rect.Top,Bmp);  Bmp.FreeImage;
        Canvas.Brush.Color := color;
        Bmp.Free;
      end;
    end;
  end;
end;

procedure TWCrCobMchqra.sagDatosMouseDown(Sender: TObject; Button: TMouseButton;
                                          Shift : TShiftState; X, Y: Integer);
var ACol  : Integer;
    ARow  : Integer;
begin
  if Found then
  begin
    sagDATOS.MouseToCell(X, Y ,ACol, ARow);
    If (  ACol = COL_BAP ) Then //  selecciona la cobranza de los conceptos
    begin
      //
      if Objeto.B_APLICA.AsString  = 'V' then
         Objeto.B_APLICA.AsString := 'F'
      else
         Objeto.B_APLICA.AsString := 'V';
      //ends_if
      sagDatos.Cells[ACol, ARow] := Objeto.B_APLICA.AsString;
      SaveData( Objeto.ID_CREDITO.AsInteger, ARow, StrToIntDef(sagDatos.cells[ COL_CTO, ARow ], 0 ),
                CurrFromFrmFloat( sagDatos.cells[ COL_IMP, ARow ] ), sagDatos.cells[ COL_BAP, ARow ] );
      SumaImportes;
    end;
  end;
end;
{}
procedure TWCrCobMchqra.sagDatosSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if Found then
  begin
    ValidaMontos;
    {}
    Objeto.B_APLICA.AsString   := sagDatos.Cells[COL_BAP, ARow];
    Objeto.ID_CTO_LIQ.AsString := sagDatos.Cells[COL_CTO, ARow];
    {}
    if ACol = COL_IMP then
    begin
      sagDatos.Options := sagDatos.Options + [goEditing];
    end else begin
      sagDatos.Options := sagDatos.Options - [goEditing];
    end;//
  end;//ends_if
end;


procedure TWCrCobMchqra.sagDatosKeyPress(Sender: TObject; var Key: Char);
var s : string;
begin
  if Found then
  begin
    if not ( Key in  [ '1','2','3','4','5','6','7','8','9','0','-', '.', '+', ',', #13, #9 ] )then
    begin
      Key := #0;
    end;
    //
    if Key in [ #13, #9 ] then
       ValidaMontos;
  end;
  //
end;

procedure TWCrCobMchqra.sagDatosDblClick(Sender: TObject);
begin
  //
  if Objeto.ID_CTO_LIQ.AsString <> ''then
  begin
    //
    if Objeto.CrContrato.Contrato.FindKey([ Objeto.ID_CTO_LIQ.AsString ]) then
    begin
        Objeto.ConTransa.Contrato := Objeto.CrContrato.Contrato;
        Objeto.ConTransa.Catalogo;
    end;
    //
  end;
  //
end;
//
procedure TWCrCobMchqra.sagDatosExit(Sender: TObject);
begin
  if Found then
     ValidaMontos;
  //ends_if
end;
//
procedure TWCrCobMchqra.CargaArchivo1Click(Sender: TObject);
begin
  if OpenDialog.Execute then
  Begin
    if CargaConfChqra( OpenDialog.FileName, ',', '"' ) then
      InicializaPantalla;
    //
  End;
  //
end;
//
procedure TWCrCobMchqra.btCargaArchivoClick(Sender: TObject);
begin
  CargaArchivo1Click(Sender);
end;



end.
