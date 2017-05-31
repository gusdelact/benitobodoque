 // Sistema         : Clase de CR_CAPITAL
 // Fecha de Inicio : 25/07/2003
 // Función forma   : Clase de CR_CAPITAL
 // Desarrollo por  : MACV. Class Maker.
 // Diseñado por    : Victor Hugo Santillan Trejo
 // Comentarios     :
unit IntCrDocFact;

interface 

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, IntFrm, DB, DBTables, Mask,
  StdCtrls, Buttons, ExtCtrls, InterFor, IntFind, UnSQL2,
  InterFun, ComCtrls, IntDtPk, IntGenCre, IntLinkit, InterEdit, ComObj,
  ImgList, Grids, Gauges,
  IntParamCre,
  IntCrCto,     // Catálogo de Contratos
  IntMon,       // Moneda                                                                                                       
  IntCrEmisor,  // Catálogo de Emsiores
  IntCrProveed, // Catálogo de Proveedores
  IntCrCartrIm, //Detalle de Impagado  
  IntCrCarNaf,  // Clase del Header de la Carga de Archivo NAFIN
  IntCrFrmtNaf, // Formato de archivo NAFIN
  IntCrEmiPro,  // Relación Emisor Proveedor
  IntMInstDesc, // Catalogo de Entidad Descontadora       //easa4011 16.05.2008 bancomext descuento
  IntCrReAcBu, Aligrid   // <SATV4766 16Jun2008> Buscador de Contrato
  ;

const
  C_SEPARATOR    = ',';
  C_HEADER       = 'H';
  C_DETALLE      = 'D';
  C_TOTAL        = 'T';
  C_LINEA        = 'Autorización';
  C_WIDTH_FECHA  = 64;
  C_WIDTH_DINERO = 78;
  C_WIDTH_TASA   = 92;
  C_COLAPLICA    = 0;
  C_COLACUSE     = 1;
  C_COLLINEA     = 3;
  C_COLNOMEPO    = 3;

  //Tabla de errores
  C_COLEPO       = 1;
  C_COLEMISOR    = 2;
  C_COLSIRAC     = 3;
  C_COLPROVEEDOR = 4;
  //Tabla de errores 1
  C_COLMENSAJE   = 1;

  C_ERROR_INSERT = 3;
  C_ERROR_INSERT_CARGA = 4;
  C_ERROR_CARGA_ACUSE_YA_APLICADOS = 7;
  C_APLICA       = '1';
  C_NOAPLICA     = '0';

  //Tabla de documentos inicial
  C_COLSGDOC_CARGAR             = 0;
  C_COLSGDOC_CVE_MONEDA         = 1;
//  C_COLSGDOC_DESC_MONEDA        = 2;
  C_COLSGDOC_ID_EPO             = 2;
  C_COLSGDOC_NOMBRE_EPO         = 3;
  C_COLSGDOC_RFC_PYME           = 4;
  C_COLSGDOC_NOMBRE_PYME        = 5;
  C_COLSGDOC_ID_DOCUMENTO       = 6;
  C_COLSGDOC_F_VENCIMIENTO_DO   = 7;
  C_COLSGDOC_PLAZO              = 8;
  C_COLSGDOC_IMP_DOCUMENTO      = 9;
  C_COLSGDOC_CVE_FND_ENT_DES    = 10;
  C_COLSGDOC_FOL_ACUSE          = 11;
  C_COLSGDOC_FOL_ACUSE_ARCHIVO  = 12;
  C_COLSGDOC_CVE_OFICINA        = 13;
  C_COLSGDOC_ID_INTER_FINAN     = 14;
  C_COLSGDOC_F_EMISION_DOC      = 15;
  C_COLSGDOC_DESC_MONEDA        = 16;
  C_COLSGDOC_RFC_BENEFICIARIO   = 17;
  C_COLSGDOC_F_EFEC_DESCTO      = 18;
  C_COLSGDOC_CUENTA_DEPOSITO    = 19;
  C_COLSGDOC_CVEPROVEXT         = 20;
  C_COLSGDOC_IDCESION           = 21;
  C_NCOLS_COLSGDOC              = 22;

  //Tabla de documentos a procesar
  C_COLGRID_CARGAR       = 0;
  C_COLGRID_NOM_EPO      = 1;
  C_COLGRID_DESC_MONEDA  = 2;
  C_COLGRID_TOTAL_DOCS   = 3;
  C_COLGRID_NOMBRE_PYME  = 4;
  C_COLGRID_LINEA        = 5;
  C_COLGRID_TITULAR      = 6;
  C_COLGRID_ID_EPO       = 7;
  C_COLGRID_CVE_MONEDA   = 8;
//  C_COLGRID_TIPO_FACTORAJE = 8;
  C_COLGRID_FOL_ACUSE = 9;
  C_COLGRID_ID_PROVEEDOR = 10;

  C_NCOLS_COLGRID = 11;

{
  C_COLGRID_DESC_MONEDA = 6;
  C_COLGRID_LINEA       = 7;
  C_COLGRID_TITULAR     = 8;
  C_COLGRID_EMISOR      = 9;
  C_COLGRID_PROVEEDOR   = 10;
  C_COLGRID_FOLCTTO     = 11;
  C_COLGRID_CVEPROVEXT  = 12;
  C_COLGRID_CVE_FND_ENT_DES = 13;
  C_COLGRID_FOL_ACUSE    = 14;
  C_COLGRID_TIPO_FACTORAJE = 15;
  C_COLGRID_F_VENCIMIENTO_DO = 16;
}

  C_COLPYMESIRAC = 2;


  C_NOMBRE_CAM_BD   = 0;
  C_NOMBRE_CAM_ARC  = 1;
  C_VALOR_OMISON    = 2;
  C_SIT_CONF_ARCNAF = 3;
  C_B_OBLIGATORIO   = 4;
  C_DATA_TYPE       = 5;
  C_DATA_LENGTH     = 6;
  C_CADENA          = 'CADENA';
  C_CRPYME          = 'CRPYME';
  C_MSG_FMT         = '¡Debe seleccionar un formato de archivo!';
  C_FMT_UNK         = '¡El formato de archivo no está soportado!';
  C_TOT_CTE         = 'Total de Clientes';


type
  TCrDocFact = class;

  TWCrDocFact = class(TForm)
    InterForma1:     TInterForma;
    PnDatos:         TPanel;
    lbEmpresa:       TLabel;
    lbUsuario:       TLabel;
    lbFecha:         TLabel;
    lbPerfil:        TLabel;
    lbDUsuario:      TLabel;
    lbDPerfil:       TLabel;
    lbDFecha:        TLabel;
    lbDEmpresa:      TLabel;
    ImgList:         TImageList;
    PageControl:     TPageControl;
    TabSheet1:       TTabSheet;
    TabSheet2:       TTabSheet;
    lblStep2:        TLabel;
    lblAcusesER:     TLabel;
    lblAcusesAC:     TLabel;
    lblAcusesAP:     TLabel;
    Bevel1:          TBevel;
    Bevel2:          TBevel;
    strGrdDataErrors: TStringGrid;
    strGrdDataErrors1: TStringGrid;
    edAcusesAC:      TEdit;
    edAcusesER:      TEdit;
    edLoadedFileName: TEdit;
    btnEmisor:       TButton;
    btnProveedor:    TButton;
    tbshAplicar:     TTabSheet;
    Label1:          TLabel;
    StringGrid:      TStringGrid;
    StringGrid1:     TStringGrid;
    btAplicar: TButton;
    btnId_Contrato:  TBitBtn;
    MemoMessages:    TMemo;
    Label4:          TLabel;
    Bevel3:          TBevel;
    btnRelacionEmiProv: TButton;
    chB_OPERA_DIA_SIG: TCheckBox;
    Label7:          TLabel;
    SGDocumentos: TStringGrid;
    btnDocumentos: TButton;
    btnProcesar: TButton;
    rgTipoAgrupacion: TRadioGroup;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    chbxMoneda: TCheckBox;
    lbID_EMISOR: TLabel;
    lbID_PROVEEDOR: TLabel;
    edID_EMISOR: TEdit;
    edID_PROVEEDOR: TEdit;
    btPROVEEDOR: TBitBtn;
    btEMISOR: TBitBtn;
    edNOM_EMISOR: TEdit;
    edID_PROV_EXTERNO: TEdit;
    edNOM_PROVEEDOR: TEdit;
    chbxEmisor: TCheckBox;
    chbxProveedor: TCheckBox;
    ilMONEDA: TInterLinkit;
    ilEMISOR: TInterLinkit;
    ilPROVEEDOR: TInterLinkit;
    MsgPanel: TPanel;
    Label2: TLabel;
    LeerEdosCta: TBitBtn;
    ImageList: TImageList;
    procedure StringGridDrawCell(Sender: TObject; ACol, ARow: integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure StringGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure StringGridKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure strGrdDataErrorsSelectCell(Sender: TObject; ACol, ARow: integer;
      var CanSelect: boolean);
    procedure strGrdDataErrorsDrawCell(Sender: TObject; ACol, ARow: integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGridSelectCell(Sender: TObject; ACol, ARow: integer;
      var CanSelect: boolean);
    procedure btnId_ContratoClick(Sender: TObject);
    procedure strGrdDataErrors1KeyPress(Sender: TObject; var Key: char);
    procedure btAplicarClick(Sender: TObject);
    procedure StringGridKeyPress(Sender: TObject; var Key: char);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: integer;
      var CanSelect: boolean);
    procedure btnEmisorClick(Sender: TObject);
    procedure btnProveedorClick(Sender: TObject);
    procedure strGrdDataErrorsTopLeftChanged(Sender: TObject);
    procedure StringGrid1TopLeftChanged(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRelacionEmiProvClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCVE_FORMATO_NAFClick(Sender: TObject);
    procedure btnCVE_FORMATO_NAFExit(Sender: TObject);
    procedure btCVE_ENT_DESCClick(Sender: TObject);
    procedure SGDocumentosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnDocumentosClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure SGDocumentosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SGDocumentosKeyPress(Sender: TObject; var Key: Char);
    procedure SGDocumentosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure ilEMISORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure ilPROVEEDORCapture(Sender: TObject; var Show: Boolean);
    procedure chbxMonedaClick(Sender: TObject);
    procedure chbxEmisorClick(Sender: TObject);
    procedure chbxProveedorClick(Sender: TObject);
    procedure rgTipoAgrupacionClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure LeerEdosCtaClick(Sender: TObject);

  private
    { Private declarations }
    m_nCount, m_nMaxCount, m_nId_Carga_NAFIN: integer;

    m_bLoaded: boolean;
    documentosAplicados : Boolean;

    procedure InvertCheck(StrGrd: TStringGrid; nCol, nRow: integer);
    procedure ShowProgress;
    procedure Set_Count(nValue: integer);
    procedure Set_MaxCount(nValue: integer);
    procedure LoadErrors;

    Function QuitaComas(PPCadena : String):String;


    function CanLoadColumnFile(aRelationalKey: TArrayString;
      strFieldName: string; var strB_OBLIGATORIO: string)
      : boolean;
    function FindRelationalField(aRelationalKey: TArrayString;
      strFieldName: string; var strFileFieldName: string;
      var nMaxLength: integer; var strValue: string): boolean;
    function FindColumnFile(aCaptionsFile: TArrayString;
      strFileFieldName: string; var nFileCol: integer): boolean;
    procedure AddAcuse(StrLstAcuses: TStringList; strId_Acuse: string);

    function LoadDataErrors(strAcuses: string;
      var nDocsAC, nDocsER, nDocsAP: integer): integer;
    function LoadAcuses: integer;
    procedure Enable_Dtp_BySign(strSign: string; DtpFrom, DtpTo: TDateTimePicker);

    procedure Set_Acuses(strValue: string);
    function Get_Acuses: string;

    function GetProveedorByCveNAFIN(nID_PROV_NAFINSA: integer): integer;
    function GetEmisorByCveNAFIN(strCVE_EMISOR_NAFIN: string): integer;
    function GetPromotorByEmiProv(nID_EMISOR, nID_PROVEEDOR: integer): integer;
    procedure EnableDisableButtons;
    procedure RestauraEstado;
    procedure CambiaEstadoEP;
    Procedure BuscaSolicitudes;

  public
    { Public declarations }
    Objeto: TCrDocFact;
    property Count: integer Read m_nCount Write Set_Count;
    property MaxCount: integer Read m_nMaxCount Write Set_MaxCount;
    property Acuses: string Read Get_Acuses Write Set_Acuses;

  end;

  TCrDocFact = class(TInterFrame)
  private
    fInputFormat: string;
  private
    F_CARGA_PYME_INI: TInterCampo;
    F_CARGA_PYME_FIN: TInterCampo;
  protected
  private
  public
    { Public declarations }
    ParamCre:   TParamCre;
    Contrato:   TCrCto;
    CargaNafin: TCrCarNaf;
    CrFrmtoNaf: TCrFrmtNaf;
    MInstDesc:  TMInstDesc; //easa4011 16.05.2008 bancomext descuento
    Moneda                   : TMoneda;
    Emisor                   : TCrEmisor;
    Proveedor                : TCrProveed;
    DetImpagado              : TCrCartrIm;    




    function InternalBusca: boolean; override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ShowWindow(FormaTipo: TFormaTipo): integer; override;
    function Reporte: boolean; override;
    function FiltroFmt: boolean;
    {ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
    procedure AsignaEntidadDescontadora(var Stp: TStoredProc; StrParamByName: string);
    function ObtenEntidadDescontadoraBINTER: string;
    {/ROIM}
    function ObtenDisposiciones(sFCarga: TDateTime; strAcuses: string): string;
  published
    property InputFormat: string Read fInputFormat Write fInputFormat;
  end;

implementation

{$R *.DFM}

constructor TCrDocFact.Create(AOwner: TComponent);
begin
  inherited;

  F_CARGA_PYME_INI := CreaCampo('F_CARGA_PYME_INI', ftDate,
    tsNinguno, tsNinguno, False);
  F_CARGA_PYME_FIN := CreaCampo('F_CARGA_PYME_FIN', ftDate,
    tsNinguno, tsNinguno, False);


  Contrato := TCrCto.Create(Self);
  Contrato.MasterSource := Self;
  Contrato.ID_CONTRATO.MasterField := 'ID_CONTRATO';

  CargaNafin := TCrCarNaf.Create(Self);
  CargaNafin.MasterSource := Self;
  CargaNafin.ID_ACUSE.MasterField := 'ID_ACUSE';

  CrFrmtoNaf := TCrFrmtNaf.Create(Self);
  CrFrmtoNaf.MasterSource := Self;
  CrFrmtoNaf.CVE_FORMATO_NAF.MasterField := 'CVE_FORMATO_NAF';

  //easa4011 16.05.2008 bancomext descuento
  MInstDesc := TMInstDesc.Create(Self);
  MInstDesc.MasterSource := Self;
  //end_easa4011


      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;
      Emisor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
      Emisor.FieldByName('ID_ACREDITADO').MasterField:='ID_EMISOR';
      Emisor.FieldByName('CVE_EMISOR_EXT').MasterField:='CVE_EMISOR_EXT';

      Proveedor := TCrProveed.Create(Self);
      Proveedor.MasterSource:=Self;      StpName  := ' ';
      Proveedor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
      Proveedor.FieldByName('ID_ACREDITADO').MasterField:='ID_PROVEEDOR';


  UseQuery := True;
  HelpFile := 'IntCrDocFact.Hlp';
  ShowMenuReporte := True;
end;

destructor TCrDocFact.Destroy;
begin
  if Contrato <> nil then
    Contrato.Free;

  if CargaNafin <> nil then
    CargaNafin.Free;

  if CrFrmtoNaf <> nil then
    CrFrmtoNaf.Free;

  if MInstDesc <> nil then
    MInstDesc.Free;


   if Moneda <> nil then
      Moneda.Free;
   if Emisor <> nil then
      Emisor.Free;
   if Proveedor <> nil then
      Proveedor.Free;


  inherited;
end;

function TCrDocFact.ShowWindow(FormaTipo: TFormaTipo): integer;
var
  W: TWCrDocFact;
begin
  W := TWCrDocFact.Create(Self);
  try
    W.Objeto := Self;
    W.InterForma1.InterFrame := Self;
    W.InterForma1.FormaTipo := ftConsulta;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowModal;
    W.documentosAplicados := False;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;


function TCrDocFact.InternalBusca: boolean;
  //Var T:TInterFindit;
begin
  InternalBusca := False;
  {    T := CreaBuscador('ICrDocFact.it','F,F');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString);
                               T.Param(1,NUM_PERIODO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; }
end;

function TCrDocFact.Reporte: boolean;
begin
  Result := False;
end;

function TCrDocFact.FiltroFmt: boolean;
begin
  Result := (CrFrmtoNaf.Active) and (CrFrmtoNaf.CVE_FORMATO_NAF.AsString <> '');
end;



{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
function TCrDocFact.ObtenEntidadDescontadoraBINTER: string;
begin
  ObtenEntidadDescontadoraBINTER := '0070020';
end;

{/ROIM}

{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
procedure TCrDocFact.AsignaEntidadDescontadora(var Stp: TStoredProc;
  StrParamByName: string);
begin
  if (Assigned(Stp)) then
  begin
    Stp.ParamByName(StrParamByName).AsString := ObtenEntidadDescontadoraBINTER;
  end;
end;

{/ROIM}


function TCrDocFact.ObtenDisposiciones(sFCarga: TDateTime; strAcuses: string): string;
var
  Qry: TQuery;
  strDisp: string;
  strComa: string;
begin
  Result := '';
  Qry := TQuery.Create(Self);
  if Assigned(Qry) then
    with Qry do
      try

        DatabaseName := Apli.DatabaseName;
        SessionName  := Apli.SessionName;
        SQL.Clear;
        SQl.Add(
          ' SELECT ID_CREDITO ' +
          ' FROM   CR_ARCHIVO_PYME ' +
          ' WHERE  F_CARGA  =  ' + SQLFecha(sFCarga) +
          '   AND  ID_ACUSE =  ' + strAcuses +
          ' GROUP BY ID_CREDITO ORDER BY ID_CREDITO '
          );
        Open;
        First;

        strDisp := '';
        strComa := '';
        while not EOF do
        begin
          strDisp := strDisp + strComa + FieldByName('ID_CREDITO').AsString;
          strComa := ', ';
          Next;
        end;

        Result := strDisp;
      finally
        Close;
        Free;
      end;
end;



 (************************FORMA CR_ARCHIVO_NAFIN********************)
 (*                                                                *)
 (*                       FORMA CR_ARCHIVO_NAFIN                   *)
 (*                                                                *)
 (************************FORMA CR_ARCHIVO_NAFIN********************)

procedure TWCrDocFact.Set_Acuses(strValue: string);
var
  aAcuses: TArrayString;
  I: integer;
begin

end;

function TWCrDocFact.Get_Acuses: string;
var
  I: integer;
  strResult, strSeparator: string;
begin

end;



procedure TWCrDocFact.InvertCheck(StrGrd: TStringGrid; nCol, nRow: integer);
var
  strBool: string;
begin
  with StrGrd do
  begin
    if (Cells[nCol, nRow] = C_APLICA) then
      strBool := C_NOAPLICA
    else
    begin
         if StrGrd.Name = 'SGDocumentos' then
         begin
              if Cells[C_COLSGDOC_IDCESION, nRow] = '0' then
                 strBool := C_APLICA
              else
              begin
                  ShowMessage('El documento está en proceso de autorización en la Cesion No: ' + Cells[C_COLSGDOC_IDCESION, nRow]);
                  strBool := C_NOAPLICA;
              end;
         end
         else
             strBool := C_APLICA;
    end;
    Cells[nCol, nRow] := strBool;
  end;
end;

// Se hace generica la función.
function TWCrDocFact.CanLoadColumnFile(aRelationalKey: TArrayString;
  strFieldName: string;
  var strB_OBLIGATORIO: string): boolean;
var
  I: integer;
  A: TArrayString;
begin
  Result := False;
  strFieldName := UpperCase(Trim(strFieldName));
  strB_OBLIGATORIO := '';
  for I := 0 to High(aRelationalKey) do
  begin
    ParseStr(A, aRelationalKey[I], C_SEPARATOR);
    if (strFieldName = UpperCase(Trim(A[C_NOMBRE_CAM_BD]))) then
    begin
      strB_OBLIGATORIO := A[C_B_OBLIGATORIO];
      if (A[C_B_OBLIGATORIO] = 'V') then
        Result := True
      else if A[C_SIT_CONF_ARCNAF] = 'AC' then
        Result := True;
      Break;
    end;
  end;
end;

// Se hace generica la función.
function TWCrDocFact.FindRelationalField(aRelationalKey: TArrayString;
  strFieldName: string; var strFileFieldName: string;
  var nMaxLength: integer; var strValue: string): boolean;
var
  I: integer;
  A: TArrayString;
begin
  Result := False;
  strFileFieldName := '';
  for I := 0 to High(aRelationalKey) do
  begin
    ParseStr(A, aRelationalKey[I], C_SEPARATOR);
    if (strFieldName = A[C_NOMBRE_CAM_BD]) then
    begin
      strFileFieldName := UpperCase(A[C_NOMBRE_CAM_ARC]);
      strValue := A[C_VALOR_OMISON];
      nMaxLength := StrToInt(A[C_DATA_LENGTH]);
      Result := strFileFieldName <> '';
    end;
    SetLength(A, 0);
  end;
end;

// Se hace generica la función.
function TWCrDocFact.FindColumnFile(aCaptionsFile: TArrayString;
  strFileFieldName: string; var nFileCol: integer): boolean;
var
  I: integer;
begin
  Result := False;
  nFileCol := -1;
  for I := 0 to High(aCaptionsFile) do
    if (UpperCase(Trim(aCaptionsFile[I])) = Trim(strFileFieldName)) then
    begin
      nFileCol := I;
      Result := True;
      Break;
    end;
end;

// Se hace generica la función.
procedure TWCrDocFact.AddAcuse(StrLstAcuses: TStringList; strId_Acuse: string);
var
  nIndex: integer;
begin
  with StrLstAcuses do
  begin
    if not Find(strId_Acuse, nIndex) then
    begin
      Add(strId_Acuse);
      Sort;
    end;
  end;
end;






function TWCrDocFact.LoadDataErrors(strAcuses: string;
  var nDocsAC, nDocsER, nDocsAP: integer): integer;
var
  Qry: TQuery;
  nCol, nRow: integer;
  strCaption, strTopicSit_Archivo: string;
begin
  Result := 0;

end;

function TWCrDocFact.LoadAcuses: integer;
var
  Qry:  TQuery;
  nRow: integer;
  strComa: string;
  vlsql: string;//ales
  I,K : Integer;
  id_epos, ent_des, id_documentos, fol_acuses : String;
begin
     ClearGrid(StringGrid);
     ClearGrid(StringGrid1);

     Result := 0;

     Qry := TQuery.Create(Nil);

     If not Assigned(Qry) Then
        exit;

     StringGrid.RowCount  := 20;
     StringGrid.ColCount  := C_NCOLS_COLGRID;
     StringGrid1.RowCount := StringGrid.RowCount;
     StringGrid1.ColCount := 1;

     With Qry Do
     Try
         vlSQL :=   '  select   CFD.ID_EPO,      CE.NOMBRE AS NOMBRE_EMISOR,         M.CVE_MONEDA,' +
                    '  decode (M.CVE_MONEDA, 484, ''PESO'', 840, ''DLLS'', M.CVE_MONEDA) as DESC_MONEDA,' +
		    '  SUM(CFD.IMP_DOCUMENTO) AS IMP_NOMINAL,         count(*) as TOTAL_DOCS,' +
		    '  CFD.TIPO_FACTORAJE,           nvl (CE.ID_ACREDITADO, 0) as PERSONA_EMISOR,' +
		    '  PE.ID_ACREDITADO,  PE.NOMBRE AS NOMBRE_PYM';

         if rgTipoAgrupacion.ItemIndex = 0 then
              vlSQL := vlSQL + ' ,CFD.FOL_ACUSE ';
         //end if;

         vlSQL := vlSQL +
                    ' from     CR_FE_DOCUMENTO CFD, ' +
                    '          (select CR_EMISOR.*, P.NOMBRE ' +
                    '           from   CR_EMISOR,PERSONA P ' +
                    '           where  ID_ACREDITADO = P.ID_PERSONA and CVE_FND_ENT_DES = ''0070020'') CE, ' +
                    '          (select CP.ID_ACREDITADO, CP.ID_PROV_EXTERNO, P.NOMBRE ' +
                    '           from   CR_PROVEEDOR CP, ' +
                    ' 	 	       PERSONA P ' +
                    '           where  CP.ID_ACREDITADO = P.ID_PERSONA and CVE_FND_ENT_DES = ''0070020'') PE, ' +
                    '           MONEDA M, ' +
//ROIM 04/07/2012  Se agrega el filtro para relacionar RFC con persona en situación Activa)
//                    '          (select ID_PERSONA,SIGLAS_RFC || F_RFC || HOMOCLAVE_RFC as RFC from RFC) RFC ' +
                    ' (select PER.ID_PERSONA,SIGLAS_RFC || F_RFC || HOMOCLAVE_RFC as RFC ' +
                    '    from RFC, PERSONA PER ' +
                    '   WHERE PER.ID_PERSONA = RFC.ID_PERSONA ' +
                    '     AND   PER.SIT_PERSONA = ''AC'' ) RFC ' +
//Fin ROIM

                    ' where    CFD.SIT_DOCUMENTO = ''XD'' and CE.CVE_EMISOR_EXT(+) = CFD.ID_EPO and PE.ID_ACREDITADO(+) = RFC.ID_PERSONA and M.CVE_MON_NAFIN(+) = CFD.CVE_MONEDA ' +
                    '          and CFD.RFC_PYME = RFC.RFC(+) ';

         // Copia los documentos seleccionados
         id_epos := ' and    cfd.id_epo in ( ';
         ent_des := ' and		 cfd.cve_fnd_ent_des in (';
         id_documentos := ' and		 cfd.id_documento in (';
         fol_acuses := ' and		 cfd.fol_acuse in (';
         K:=0;
         for I:= 1 to SGDocumentos.RowCount-1 do
         begin
              if SGDocumentos.Cells[0,I] = C_APLICA then
              begin
                   inc(K);
                   if K <> 1 then
                   begin
                        id_epos := id_epos + ',';
                        ent_des := ent_des + ',';
                        id_documentos := id_documentos + ',';
                        fol_acuses := fol_acuses + ',';
                   end;
                   id_epos := id_epos + SGDocumentos.Cells[C_COLSGDOC_ID_EPO, I];
                   ent_des := ent_des + '''' +SGDocumentos.Cells[C_COLSGDOC_CVE_FND_ENT_DES, I]+'''';
                   id_documentos := id_documentos + '''' + SGDocumentos.Cells[C_COLSGDOC_ID_DOCUMENTO, I]+'''';
                   fol_acuses := fol_acuses +  '''' +SGDocumentos.Cells[C_COLSGDOC_FOL_ACUSE, I]+'''';
              end;
         end;
         vlsql := vlsql + id_epos + ') ';
         vlsql := vlsql + ent_des + ') ';
         vlsql := vlsql + id_documentos + ') ';
         vlsql := vlsql + fol_acuses + ') ';

         if rgTipoAgrupacion.ItemIndex = 0 then
            vlsql := vlsql + '  group by CFD.ID_EPO, CE.NOMBRE, M.CVE_MONEDA, TIPO_FACTORAJE, CE.ID_ACREDITADO,PE.ID_ACREDITADO , PE.NOMBRE ,CFD.FOL_ACUSE' +
                             '  order by M.CVE_MONEDA, CE.ID_ACREDITADO,PE.ID_ACREDITADO, TIPO_FACTORAJE ';

         if rgTipoAgrupacion.ItemIndex = 1 then
            vlsql := vlsql + '  group by CFD.ID_EPO, CE.NOMBRE, M.CVE_MONEDA, TIPO_FACTORAJE, CE.ID_ACREDITADO,PE.ID_ACREDITADO , PE.NOMBRE ' +
                             '  order by M.CVE_MONEDA, CE.ID_ACREDITADO,PE.ID_ACREDITADO, TIPO_FACTORAJE ';

         DataBaseName := Objeto.DataBaseName;
         SessionName  := Objeto.SessionName;
         SQL.Clear;
         SQL.Add(vlSql);
         Open;

         with StringGrid do
         begin
            Cells[C_COLGRID_CARGAR, 0] := 'Cga.';
            ColWidths[C_COLGRID_CARGAR] := 20;

            Cells[C_COLGRID_NOM_EPO, 0] := 'Empresa de Primer Orden (EPO)';
            ColWidths[C_COLGRID_NOM_EPO] := 164;

            Cells[C_COLGRID_DESC_MONEDA, 0] := 'Mon.';
            ColWidths[C_COLGRID_DESC_MONEDA] := 40;

            Cells[C_COLGRID_TOTAL_DOCS, 0] := 'Docs.';
            ColWidths[C_COLGRID_DESC_MONEDA] := 40;

            Cells[C_COLGRID_NOMBRE_PYME ,0] := 'Nombre PYME';


            Cells[C_COLGRID_LINEA, 0] := C_LINEA;
            ColWidths[C_COLGRID_LINEA] := 101;

            Cells[C_COLGRID_TITULAR, 0] := 'Titular de la Autorización';
            ColWidths[C_COLGRID_TITULAR] := 138;

            ColWidths[C_COLGRID_ID_EPO] := 0;
            ColWidths[C_COLGRID_CVE_MONEDA] := 0;
//            ColWidths[C_COLGRID_TIPO_FACTORAJE] := 0;

            if rgTipoAgrupacion.ItemIndex = 0 then
            begin
                 Cells[C_COLGRID_FOL_ACUSE, 0] := 'Acuse';
                 ColWidths[C_COLGRID_FOL_ACUSE] := 138;
            end
            else
            begin
                 Cells[C_COLGRID_FOL_ACUSE, 0] := '';
                 ColWidths[C_COLGRID_FOL_ACUSE] := 0;
            end;

            Cells[C_COLGRID_ID_PROVEEDOR , 0] := '';
            ColWidths[C_COLGRID_TITULAR] := 0;

         end;

         StringGrid1.Cells[0, 0]  := 'Imp. Nominal';

         nRow := 1;
         while not EOF do
         begin
            StringGrid.Cells[C_COLGRID_CARGAR, nRow] := C_APLICA;
            StringGrid.Cells[C_COLGRID_NOM_EPO, nRow] := FieldByName('NOMBRE_EMISOR').AsString;
            StringGrid.Cells[C_COLGRID_DESC_MONEDA, nRow] := FieldByName('DESC_MONEDA').AsString;
            StringGrid.Cells[C_COLGRID_TOTAL_DOCS, nRow] := FieldByName('TOTAL_DOCS').AsString;
            StringGrid.Cells[C_COLGRID_NOMBRE_PYME, nRow] := FieldByName('NOMBRE_PYM').AsString;
            StringGrid.Cells[C_COLGRID_ID_EPO, nRow] := FieldByName('ID_EPO').AsString;
            StringGrid.Cells[C_COLGRID_CVE_MONEDA, nRow] := FieldByName('CVE_MONEDA').AsString;
//            StringGrid.Cells[C_COLGRID_TIPO_FACTORAJE, nRow] := FieldByName('TIPO_FACTORAJE').AsString;
            if rgTipoAgrupacion.ItemIndex = 0 then
               StringGrid.Cells[C_COLGRID_FOL_ACUSE, nRow] := FieldByName('FOL_ACUSE').AsString
            else
               StringGrid.Cells[C_COLGRID_FOL_ACUSE, nRow] := '0';
            // end if;
            StringGrid.Cells[C_COLGRID_ID_PROVEEDOR , nRow] := FieldByName('ID_ACREDITADO').AsString;
            StringGrid1.Cells[0, nRow] := FORMAT(CFORMAT_DINERO, [FieldByName('IMP_NOMINAL').AsFloat]);//FieldByName('IMP_NOMINAL').AsString; JFOF
            Inc(nRow);
            Next;
         end;

         // Ajusta el Grid con los resultados mostrados
         if (nRow > 1) then
            StringGrid.RowCount := nRow
         else
            StringGrid.RowCount := 2;
         //end if
         StringGrid1.RowCount := StringGrid.RowCount;

         if (Trim(StringGrid.Cells[C_COLSGDOC_ID_EPO, 1]) = '') then
            ShowMessage('No existen documentos por Aplicar');
         //end if
     Finally
        Close;
        Free;
     End;
end;


procedure TWCrDocFact.LoadErrors;
var
  I, K, nDocsER, nTotalAcuses: integer;
  Stp: TStoredProc;
  strOpcion, strMsgAcuse: string;
  Qry: TQuery;
  vlsql: string;
  id_epos, ent_des, id_documentos, fol_acuses : String;
  nCol, nRow: integer;
begin

  edLoadedFileName.Visible := False;
  strOpcion := 'de la Consulta';

//  lblOpcion.Caption := strOpcion + ' =';
  lblStep2.Caption  := 'Al realizar los documentos pendientes ' + #13#10 +
    'se encontraron los siguientes documentos con Errores...';

  Stp := TStoredProc.Create(Self);
  if not Assigned(Stp) Then
    exit;

  ClearGrid(strGrdDataErrors);
  ClearGrid(strGrdDataErrors1);

  strGrdDataErrors.ColCount := 5;
  strGrdDataErrors.RowCount := 2003;
  strGrdDataErrors1.ColCount := 2;
  strGrdDataErrors1.RowCount := strGrdDataErrors.RowCount;

  Qry := TQuery.Create(nil);

  if not Assigned(Qry) then
    Exit;

  with Qry do
  try
      // Se agregan todos los documentos a la tabla
      // que el usuario haya seleccionado
      vlsql :=
        ' select cfd.ID_EPO, ' +
        '        cfd.CVE_FND_ENT_DES, ' +
        '        cfd.ID_DOCUMENTO, ' +
        '        cfd.FOL_ACUSE, ' +
        '        cfd.FOL_ACUSE_ARCHIVO, ' +
        '        cfd.CVE_OFICINA, ' +
        '        cfd.RFC_PYME, ' +
        '        cfd.NOMBRE_PYME, ' +
        '        cfd.ID_INTER_FINAN, ' +
        '        cfd.F_EMISION_DOC, ' +
        '        cfd.F_VENCIMIENTO_DO, ' +
        '        cfd.CVE_MONEDA, ' +
        '        decode (M.CVE_MONEDA, 484, ''PESO'', 840, ''DLLS'', M.CVE_MONEDA) as DESC_MONEDA, ' +
        '        cfd.TIPO_FACTORAJE, ' +
        '        cfd.IMP_DOCUMENTO, ' +
        '        cfd.RFC_BENEFICIARIO, ' +
        '        cfd.F_EFEC_DESCTO, ' +
        '        cfd.CUENTA_DEPOSITO, ' +
        '        nvl (PE.ID_ACREDITADO, 0) as PROVEEDOR_EXT ' +
        ' from   cr_fe_documento cfd, ' +
        '        moneda M, ' +
        '        (select CP.ID_ACREDITADO, CP.ID_PROV_EXTERNO, P.NOMBRE ' +
        '           from   CR_PROVEEDOR CP, ' +
        ' 								 PERSONA P ' +
        '           where  CP.ID_ACREDITADO = P.ID_PERSONA and CVE_FND_ENT_DES = '''+objeto.ObtenEntidadDescontadoraBINTER+''') PE, ' +
//ROIM 04/07/2012  Se agrega el filtro para relacionar RFC con persona en situación Activa)
//                    '          (select ID_PERSONA,SIGLAS_RFC || F_RFC || HOMOCLAVE_RFC as RFC from RFC) RFC ' +
                    ' (select PER.ID_PERSONA,SIGLAS_RFC || F_RFC || HOMOCLAVE_RFC as RFC ' +
                    '    from RFC, PERSONA PER ' +
                    '   WHERE PER.ID_PERSONA = RFC.ID_PERSONA ' +
                    '     AND   PER.SIT_PERSONA = ''AC'' ) RFC ' +
//Fin ROIM
        ' where  M.CVE_MON_NAFIN(+) = CFD.CVE_MONEDA ' +
        ' and		 cfd.SIT_DOCUMENTO = ''XD''' +
        ' and		 PE.ID_ACREDITADO(+) = RFC.ID_PERSONA ' +
        ' and		 CFD.RFC_PYME = RFC.RFC(+) ';
      // Copia los documentos seleccionados
      id_epos := 'and    cfd.id_epo in ( ';
      ent_des := 'and		 cfd.cve_fnd_ent_des in (';
      id_documentos := 'and		 cfd.id_documento in (';
      fol_acuses := 'and		 cfd.fol_acuse in (';
      K := 0;
      for I:= 1 to SGDocumentos.RowCount-1 do
      begin
        if SGDocumentos.Cells[0,I] = C_APLICA then 
        begin
          inc(K);
          if K <> 1 then
          begin
            id_epos := id_epos + ',';
            ent_des := ent_des + ',';
            id_documentos := id_documentos + ',';
            fol_acuses := fol_acuses + ',';
          end;
          id_epos := id_epos + SGDocumentos.Cells[C_COLSGDOC_ID_EPO, I];
          ent_des := ent_des + '''' + SGDocumentos.Cells[C_COLSGDOC_CVE_FND_ENT_DES, I]+'''';
          id_documentos := id_documentos + '''' + SGDocumentos.Cells[C_COLSGDOC_ID_DOCUMENTO, I]+ '''' ;
          fol_acuses := fol_acuses +  '''' +SGDocumentos.Cells[C_COLSGDOC_FOL_ACUSE, I]+'''';
        end;
      end;
      vlsql := vlsql + id_epos + ') ';
      vlsql := vlsql + ent_des + ') ';
      vlsql := vlsql + id_documentos + ') ';
      vlsql := vlsql + fol_acuses + ') ';

      DataBaseName := Objeto.DataBaseName;
      SessionName  := Objeto.SessionName;
      SQL.Clear;
      SQL.Add(vlSql);
      Open;


      strGrdDataErrors.RowCount  := 60;
      strGrdDataErrors.ColCount  := C_NCOLS_COLSGDOC-1;

      with strGrdDataErrors do
      begin
          ColWidths[C_COLSGDOC_CARGAR] := 20;
          Cells[C_COLSGDOC_CARGAR     ,0] := C_NOAPLICA;
          Cells[C_COLSGDOC_ID_EPO     ,0] := 'Cve. EPO';
          Cells[C_COLSGDOC_CVE_FND_ENT_DES     ,0] := 'Ent, Desc.';
          Cells[C_COLSGDOC_ID_DOCUMENTO     ,0] := 'Núm Doc.';
          Cells[C_COLSGDOC_FOL_ACUSE     ,0] := 'Número de Acuse';
          Cells[C_COLSGDOC_FOL_ACUSE_ARCHIVO     ,0] := 'Acuse Archivo';
          Cells[C_COLSGDOC_CVE_OFICINA     ,0] := 'Cve. Oficina';
          Cells[C_COLSGDOC_RFC_PYME     ,0] := 'RFC PYME';
          Cells[C_COLSGDOC_NOMBRE_PYME     ,0] := 'Nombre PYME';
          Cells[C_COLSGDOC_ID_INTER_FINAN     ,0] := 'Cve.Inter. Finan';
          Cells[C_COLSGDOC_F_EMISION_DOC     ,0] := 'Fecha Emisión';
          Cells[C_COLSGDOC_F_VENCIMIENTO_DO     ,0] := 'Fecha Venc.';
          Cells[C_COLSGDOC_CVE_MONEDA     ,0] := 'Cve. Moneda';
          Cells[C_COLSGDOC_DESC_MONEDA     ,0] := 'Moneda';
//          Cells[C_COLSGDOC_TIPO_FACTORAJE     ,0] := 'Factoraje';
          Cells[C_COLSGDOC_IMP_DOCUMENTO     ,0] := '    Imp. Docto';
          ColWidths[C_COLSGDOC_IMP_DOCUMENTO] := 76;
          Cells[C_COLSGDOC_RFC_BENEFICIARIO     ,0] := 'RFC Beneficiario';
          Cells[C_COLSGDOC_F_EFEC_DESCTO     ,0] := 'Fecha Efec. Venc.';
          Cells[C_COLSGDOC_CUENTA_DEPOSITO     ,0] := 'Cuenta Depósito';
          ColWidths[C_COLSGDOC_CVEPROVEXT] := 0;
      end;
      strGrdDataErrors1.ColWidths[0] := 0;
      strGrdDataErrors1.ColWidths[1] := 245;

      nRow := 1;
      while not EOF do
      begin
          strGrdDataErrors.Cells[C_COLGRID_CARGAR, nRow] := C_APLICA;
          strGrdDataErrors.Cells[C_COLSGDOC_ID_EPO, nRow] := FieldByName('ID_EPO').AsString;
          strGrdDataErrors.Cells[C_COLSGDOC_CVE_FND_ENT_DES, nRow] := FieldByName('CVE_FND_ENT_DES').AsString;
          strGrdDataErrors.Cells[C_COLSGDOC_ID_DOCUMENTO, nRow] := FieldByName('ID_DOCUMENTO').AsString;
          strGrdDataErrors.Cells[C_COLSGDOC_FOL_ACUSE, nRow] := FieldByName('FOL_ACUSE').AsString;
          strGrdDataErrors.Cells[C_COLSGDOC_FOL_ACUSE_ARCHIVO, nRow] := FieldByName('FOL_ACUSE_ARCHIVO').AsString;
          strGrdDataErrors.Cells[C_COLSGDOC_CVE_OFICINA, nRow] := FieldByName('CVE_OFICINA').AsString;
          strGrdDataErrors.Cells[C_COLSGDOC_RFC_PYME, nRow] := FieldByName('RFC_PYME').AsString;
//          strGrdDataErrors.Cells[C_COLSGDOC_NOMBRE_PYME, nRow] := FieldByName('NOMBRE_PYME').AsString;
          strGrdDataErrors.Cells[C_COLSGDOC_ID_INTER_FINAN, nRow] := FieldByName('ID_INTER_FINAN').AsString;
          strGrdDataErrors.Cells[C_COLSGDOC_F_EMISION_DOC, nRow] := FieldByName('F_EMISION_DOC').AsString;
          strGrdDataErrors.Cells[C_COLSGDOC_F_VENCIMIENTO_DO, nRow] := FieldByName('F_VENCIMIENTO_DO').AsString;
          strGrdDataErrors.Cells[C_COLSGDOC_CVE_MONEDA, nRow] := FieldByName('CVE_MONEDA').AsString;
          strGrdDataErrors.Cells[C_COLSGDOC_DESC_MONEDA, nRow] := FieldByName('DESC_MONEDA').AsString;
//          strGrdDataErrors.Cells[C_COLSGDOC_TIPO_FACTORAJE, nRow] := FieldByName('TIPO_FACTORAJE').AsString;
          strGrdDataErrors.Cells[C_COLSGDOC_IMP_DOCUMENTO, nRow] :=   FORMAT(CFORMAT_DINERO, [FieldByName('IMP_DOCUMENTO').AsFloat]);
          strGrdDataErrors.Cells[C_COLSGDOC_RFC_BENEFICIARIO, nRow] := FieldByName('RFC_BENEFICIARIO').AsString;
          strGrdDataErrors.Cells[C_COLSGDOC_F_EFEC_DESCTO, nRow] := FieldByName('F_EFEC_DESCTO').AsString;
          strGrdDataErrors.Cells[C_COLSGDOC_CUENTA_DEPOSITO, nRow] := FieldByName('CUENTA_DEPOSITO').AsString;
          strGrdDataErrors.Cells[C_COLSGDOC_CVEPROVEXT, nRow] := FieldByName('PROVEEDOR_EXT').AsString;

          Inc(nRow);
          Next;
      end;

      // Ajusta el Grid con los resultados mostrados
      if (nRow > 1) then
         strGrdDataErrors.RowCount := nRow
      else
         strGrdDataErrors.RowCount := 2;
      //end if

      strGrdDataErrors1.RowCount := strGrdDataErrors.RowCount;

      if (Trim(SGDocumentos.Cells[C_COLGRID_CARGAR, 1]) = '') then
          ShowMessage('No existen documentos por Aplicar');
  finally
  	Close;
  	Free;
  end;


  Stp.DatabaseName := Objeto.DatabaseName;
  Stp.SessionName  := Objeto.SessionName;
  //Verifica emisor y proveedor
  Stp.StoredProcName := 'PKGCRPERIODO.STPVALIDAEMISPROVNAFIN';
  with Stp Do
  begin
       Params.CreateParam(ftString,'peCVE_FND_ENT_DES',ptInput);
       Params.CreateParam(ftInteger,'peId_sirac',ptInput);
       Params.CreateParam(ftInteger,'peId_epo',ptInput);
       Params.CreateParam(ftFloat,'psResultado',ptOutput);
       Params.CreateParam(ftString,'psTxResultado',ptOutput);
  end;
  nDocsER := 1;

  for I := 0 to strGrdDataErrors.RowCount - 1 do
  begin
      //Si no está checado el registro continúa
      if strGrdDataErrors.Cells[C_COLSGDOC_CARGAR, I] = C_NOAPLICA then
         continue;
      //endif

      Stp.ParamByName('peCVE_FND_ENT_DES').AsString := strGrdDataErrors.Cells[C_COLSGDOC_CVE_FND_ENT_DES,I]; //.ObtenEntidadDescontadoraBINTER;
      Stp.ParamByName('peId_sirac').AsString := strGrdDataErrors.Cells[C_COLSGDOC_CVEPROVEXT, I];
      Stp.ParamByName('peId_epo').AsString := strGrdDataErrors.Cells[C_COLSGDOC_ID_EPO, I];

      Stp.ExecProc;

      if (Stp.ParamByName('psResultado').AsInteger > 0) then
      begin
            strGrdDataErrors1.Cells[C_COLMENSAJE, nDocsER] := Stp.ParamByName('psTxResultado').AsString;
            Inc(nDocsER);
      end;
  end;

  //Verifica emisor/proveedor
  Stp.StoredProcName := 'PKGCRPERIODO.STPVALIDAPROMOTOR_EMISPROV';
  with Stp Do
  begin
      Params.CreateParam(ftString,'peCVE_FND_ENT_DES',ptInput);
      Params.CreateParam(ftInteger,'peId_sirac',ptInput);
      Params.CreateParam(ftInteger,'peId_epo',ptInput);
      Params.CreateParam(ftFloat,'psResultado',ptOutput);
      Params.CreateParam(ftString,'psTxResultado',ptOutput);
  end;


  for I := 1 to strGrdDataErrors.RowCount - 1 do
  begin
        Stp.ParamByName('peCVE_FND_ENT_DES').AsString := strGrdDataErrors.Cells[C_COLSGDOC_CVE_FND_ENT_DES,I];
        Stp.ParamByName('peId_sirac').AsString := strGrdDataErrors.Cells[C_COLSGDOC_CVEPROVEXT, I];
        Stp.ParamByName('peId_epo').AsString := strGrdDataErrors.Cells[C_COLSGDOC_ID_EPO, I];

        Stp.ExecProc;

        if (Stp.ParamByName('psResultado').AsInteger > 0) then
        begin
          strGrdDataErrors1.Cells[C_COLMENSAJE, nDocsER] := Stp.ParamByName('psTxResultado').AsString;
          Inc(nDocsER);
        end;
  end;
  //strGrdDataErrors.RowCount := nDocsER;
  //strGrdDataErrors1.RowCount := nDocsER;

  if nDocsER > 1 then
     PageControl.ActivePageIndex := 1
  else
     PageControl.ActivePageIndex := 2;
  //end if


end;


procedure TWCrDocFact.ShowProgress;
begin

end;

procedure TWCrDocFact.Set_Count(nValue: integer);
begin

end;

procedure TWCrDocFact.Set_MaxCount(nValue: integer);
begin

end;

function TWCrDocFact.GetEmisorByCveNAFIN(strCVE_EMISOR_NAFIN: string): integer;
var
  Qry: TQuery;
begin
  Qry := TQuery.Create(Self);
  Result := 0;
  if Assigned(Qry) then
    with Qry do
      try
        DataBaseName := Objeto.DataBaseName;
        SessionName  := Objeto.SessionName;
        SQL.Clear;
        {ROIM  09042007 CAMBIO POR EMISOR NAFIN}
        //   SQL.Add('SELECT ID_ACREDITADO FROM CR_EMISOR WHERE CVE_EMISOR_NAFIN = '#39+strCVE_EMISOR_NAFIN+#39);
        SQL.Add(' SELECT ID_ACREDITADO FROM CR_EMISOR ' +
          ' WHERE  CVE_FND_ENT_DES = ' + #39 + objeto.ObtenEntidadDescontadoraBINTER +
          #39 + ' AND    CVE_EMISOR_EXT  = ' + #39 + strCVE_EMISOR_NAFIN + #39);
        {/ROIM}
        Open;
        Result := FieldByName('ID_ACREDITADO').AsInteger;
      finally
        Close;
        Free;
      end;
end;

function TWCrDocFact.GetProveedorByCveNAFIN(nID_PROV_NAFINSA: integer): integer;
var
  Qry: TQuery;
begin
  Qry := TQuery.Create(Self);
  Result := 0;
  if Assigned(Qry) then
    with Qry do
      try
        DataBaseName := Objeto.DataBaseName;
        SessionName  := Objeto.SessionName;
        SQL.Clear;
        {ROIM  09042007 CAMBIO POR EMISOR NAFIN}
        //   SQL.Add('SELECT ID_ACREDITADO FROM CR_PROVEEDOR WHERE ID_PROV_NAFINSA =  '+IntToStr(nID_PROV_NAFINSA));
        SQL.Add(' SELECT ID_ACREDITADO FROM CR_PROVEEDOR ' +
          ' WHERE  CVE_FND_ENT_DES = ' + #39 + objeto.ObtenEntidadDescontadoraBINTER +
          #39 + ' AND    ID_PROV_EXTERNO =  ' + IntToStr(nID_PROV_NAFINSA));
        {/ROIM}
        Open;
        Result := FieldByName('ID_ACREDITADO').AsInteger;
      finally
        Close;
        Free;
      end;
end;

function TWCrDocFact.GetPromotorByEmiProv(nID_EMISOR, nID_PROVEEDOR: integer): integer;
var
  Qry: TQuery;
begin
  Qry := TQuery.Create(Self);
  Result := 0;
  if Assigned(Qry) then
    with Qry do
      try
        DataBaseName := Objeto.DataBaseName;
        SessionName  := Objeto.SessionName;
        SQL.Clear;
        SQL.Add(' SELECT ID_PROMOTOR FROM CR_EMISOR_PROV '#13#10 +
          ' WHERE CVE_FND_ENT_DES = ' + #39 + objeto.ObtenEntidadDescontadoraBINTER +
          #39 + ' AND   ID_EMISOR = ' + IntToStr(nID_EMISOR) +
          ' AND   ID_PROMOTOR = ' + IntToStr(nID_PROVEEDOR));
        Open;
        Result := FieldByName('ID_PROMOTOR').AsInteger;
      finally
        Close;
        Free;
      end;
end;

procedure TWCrDocFact.Enable_Dtp_BySign(strSign: string;
  DtpFrom, DtpTo: TDateTimePicker);
begin
  if (Trim(strSign) <> '') then
    if (UpperCase(strSign) = 'ENTRE') then
    begin
      DtpFrom.Visible := True;
      DtpFrom.Enabled := True;
    end
    else
    begin
      DtpFrom.Visible := False;
      DtpFrom.Enabled := False;
    end;
end;

procedure TWCrDocFact.EnableDisableButtons;
var bEnabled : Boolean;
begin
  bEnabled := ( Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CADENA );
  btnEmisor.Enabled    := bEnabled;
  btnProveedor.Enabled := bEnabled;
  btnRelacionEmiProv.Enabled := bEnabled;
end;

{
+------------------------------------------------------------------------------+
|                                                                              |
|                                                                              |
|                                                                              |
+------------------------------------------------------------------------------+
}
procedure TWCrDocFact.FormShow(Sender: TObject);
begin
      with Objeto do
      begin
           lbDempresa.Caption := ParamCre.EMPRESA.AsString;
           lbDfecha.Caption  := ParamCre.FECHA.AsString;
           lbDUsuario.Caption := ParamCre.USUARIO.AsString;
           lbDPerfil.Caption := ParamCre.PERFIL.AsString;
      end;

      Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);
      edDESC_MONEDA.Hint := Objeto.Moneda.Desc_Moneda.AsString;
      edDESC_MONEDA.ShowHint := True;

      Objeto.Emisor.ID_ACREDITADO.Control := edID_EMISOR;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOM_EMISOR;
      Objeto.Emisor.GetParams(Objeto);
      edNOM_EMISOR.Hint := Objeto.Emisor.Acreditado.Persona.Nombre.AsString;
      edNOM_EMISOR.ShowHint := True;

      Objeto.Proveedor.ID_ACREDITADO.Control := edID_PROVEEDOR;
      Objeto.Proveedor.Persona.Nombre.Control := edNOM_PROVEEDOR;
      Objeto.Proveedor.ID_PROV_EXTERNO.Control := edID_PROV_EXTERNO;
      Objeto.Proveedor.GetParams(Objeto);
      edNOM_PROVEEDOR.Hint := Objeto.Proveedor.Persona.Nombre.AsString;
      edNOM_PROVEEDOR.ShowHint := True;


      if Objeto.InputFormat <> '' then
        if Objeto.CrFrmtoNaf.FindKey([Objeto.InputFormat]) then
          EnableDisableButtons;
        //ends_if
      //ends_if

      Interforma1.MsgPanel := MsgPanel;

//      rgTipoAgrupacion.ItemIndex := 1;  Se comenta para dejar por default ItemIndex 1 JFOF 27/08/2012

end;

procedure TWCrDocFact.FormDestroy(Sender: TObject);
begin
     RestauraEstado;
     Objeto.Moneda.Cve_Moneda.Control := nil;
     Objeto.Moneda.Desc_Moneda.Control := nil;
     Objeto.Emisor.ID_ACREDITADO.Control := nil;
     Objeto.Emisor.Acreditado.Persona.Nombre.Control := nil;
     Objeto.Proveedor.ID_ACREDITADO.Control := nil;
     Objeto.Proveedor.Persona.Nombre.Control := nil;
     Objeto.Proveedor.ID_PROV_EXTERNO.Control := nil;

end;

procedure TWCrDocFact.FormClose(Sender: TObject; var Action: TCloseAction);
begin

end;

{
                  +   Grids del TabSheet 2   +
}
procedure TWCrDocFact.strGrdDataErrorsDrawCell(Sender: TObject;
  ACol, ARow: integer; Rect: TRect; State: TGridDrawState);

const
  LIGHT_YELLOW = $00CCFFFF;
  LIGHT_GRAY = $00F0F0F0;
  NAMEGRIDERRORS = 'strGrdDataErrors';

  // Esta función se hizo con el fin de reemplazar a la conocida función RECT()
  // debido a que el compilador confunde el llamado entre la variable y la función
  // en este procedimiento...
  function Rect_(nLeft, nTop, nRight, nBottom: integer): TRect;
  var
    R: TRect;
  begin
    R.Left := nLeft;
    R.Top  := nTop;
    R.Right := nRight;
    R.Bottom := nBottom;
    Result := R;
  end;

var
  Rect1: TRect;
  str: string;
  bNoExistenDatos: boolean;
  dValue: double;
begin
  if (Sender is TStringGrid) and (ARow > 0) then
    with (Sender as TStringGrid) do
    begin
      str := Cells[0, ARow];
      if (str = CSIT_AC) then
        Canvas.Font.Color := clBlack;
      if (str = CSIT_ER) then
        Canvas.Font.Color := clRed;
      if (str = CSIT_AP) then
        Canvas.Font.Color := clMaroon;
      if (gdSelected in State) then
      begin
        Canvas.Font.Color  := clWhite;
        Canvas.Brush.Color := clNavy;
      end;

      bNoExistenDatos := (Trim(Cells[0, 1]) = '');
      if ((bNoExistenDatos) or ((Cells[1, ARow] <> '') and (Cells[2, ARow] = ''))) and
        (Name = NAMEGRIDERRORS) then
      begin
        Rect1 := Rect_(0, Rect.Top, Width, Rect.Bottom);
        Canvas.FillRect(Rect1);

        if bNoExistenDatos then
        begin
          Canvas.TextRect(Rect1, (Rect1.Right - Canvas.TextWidth(str)) div
            2, Rect1.Top, CERROR_NOEXISTEN);
        end
        else
        begin
          str := Cells[1, ARow];
          Canvas.TextRect(Rect1, Rect1.Left + 10, Rect1.Top, str);
        end;

      end
      else
      begin

        with Sender as TStringGrid do
        begin
          if (ColWidths[ACol] = C_WIDTH_DINERO) or (ColWidths[ACol] = C_WIDTH_TASA) then
          begin
            if (Trim(Cells[ACol, ARow]) <> '') then
              dValue := StrToFloat(Cells[ACol, ARow])
            else
              dValue := 0;
            if (ColWidths[ACol] = C_WIDTH_DINERO) then
              str := Format(CFORMAT_DINERO, [dValue])
            else
              str := Format(CFORMAT_TASA, [dValue]);

            Canvas.TextRect(Rect, Rect.Right - Canvas.TextWidth(str), Rect.Top, str);
          end
          else
            Canvas.TextRect(Rect, Rect.Left, Rect.Top, Cells[ACol, ARow]);
        end;

      end;
    end; // End With
end;
// Grids del TabSheet 2
procedure TWCrDocFact.strGrdDataErrorsSelectCell(Sender: TObject;
  ACol, ARow: integer; var CanSelect: boolean);

  procedure SelectRect(Sender, Grid: TStringGrid; Rect: TGridRect);
  begin
    Rect.Right := Grid.ColCount - 1;
    if Sender <> Grid then
      Grid.Selection := Rect;
  end;

var
  Rect: TGridRect;
begin
  Rect.Left := 0;
  Rect.Top  := ARow;
  Rect.Bottom := ARow;

  if Sender is TStringGrid then
  begin
    SelectRect(Sender as TStringGrid, strGrdDataErrors, Rect);
    SelectRect(Sender as TStringGrid, strGrdDataErrors1, Rect);
  end;

  with strGrdDataErrors1 do
  begin
    Hint := Cells[C_COLMENSAJE, ARow];
    ShowHint := True;

    btnEmisor.Enabled := Trim(Hint) <> '';
    btnProveedor.Enabled := btnEmisor.Enabled;
    btnRelacionEmiProv.Enabled := btnEmisor.Enabled;
  end;
end;
// Grids del TabSheet 2
procedure TWCrDocFact.strGrdDataErrorsTopLeftChanged(Sender: TObject);

  procedure SelectTopRow(Sender, Grid: TStringGrid);
  begin
    if Sender <> Grid then
      Grid.TopRow := Sender.TopRow;
  end;//ends_procedure

begin
  if Sender is TStringGrid then
  begin
    SelectTopRow(Sender as TStringGrid, strGrdDataErrors);
    SelectTopRow(Sender as TStringGrid, strGrdDataErrors1);
  end;
end;
// Grids del TabSheet 2 B
procedure TWCrDocFact.strGrdDataErrors1KeyPress(Sender: TObject; var Key: char);
begin
  Key := #0;
end;

{
                  +   Grids del TabSheet 3   +
}

procedure TWCrDocFact.StringGridDrawCell(Sender: TObject; ACol, ARow: integer;
  Rect: TRect; State: TGridDrawState);
var
  Bmp: TBitmap;
begin
  if (ACol = 0) and (ARow > 0) then
    if (Trim(StringGrid.Cells[0, ARow]) <> '') then
    begin
      Bmp := TBitmap.Create;
      if Assigned(Bmp) then
      begin

        if (StringGrid.Cells[0, ARow] = '1') then
          ImageList.GetBitmap(1, Bmp)
        else
          ImageList.GetBitmap(0, Bmp);
        StringGrid.Canvas.Draw(Rect.Left, Rect.Top, Bmp);

        Bmp.FreeImage;
        Bmp.Free;
      end;
    end;

  if (gdFocused in State) then
  begin
    if (StringGrid.Cells[ACol, 0] = C_LINEA) then
    begin
      btnId_Contrato.Height := Rect.Bottom - Rect.Top;
      btnId_Contrato.Width := btnId_Contrato.Height;
      btnId_Contrato.Left := StringGrid.Left + Rect.Right - btnId_Contrato.Width + 2;
      btnId_Contrato.Top  := Rect.Top + StringGrid.top + 2;
      btnId_Contrato.Visible := True;
    end;
  end;
end;
// Grids del TabSheet 3
procedure TWCrDocFact.StringGridKeyDown(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  case Key of
    32: InvertCheck(StringGrid, 0, StringGrid.Row);
  end;
end;
// Grids del TabSheet 3
procedure TWCrDocFact.StringGridKeyPress(Sender: TObject; var Key: char);
begin
  // With StringGrid Do
  //  If Col <> C_COLLINEA Then Key := #0;
  Key := #0;
end;
// Grids del TabSheet 3
procedure TWCrDocFact.StringGridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
var
  nCol, nRow: longint;
begin
  with StringGrid do
  begin
    MouseToCell(X, Y, nCol, nRow);
    if (nCol = 0) and (nRow > 0) then
      InvertCheck(StringGrid, 0, nRow);
  end;
end;
// Grids del TabSheet 3
procedure TWCrDocFact.StringGridSelectCell(Sender: TObject;
  ACol, ARow: integer; var CanSelect: boolean);
begin
  CanSelect := ACol > 0;
  btnId_Contrato.Visible := True;
  if StringGrid.Focused then
  begin
    StringGrid1.Row := ARow;
    StringGrid1.TopRow := StringGrid.TopRow;
  end;
end;
// Grids del TabSheet 3
procedure TWCrDocFact.StringGrid1TopLeftChanged(Sender: TObject);

  procedure SelectTopRow(Sender, Grid: TStringGrid);
  begin
    if Sender <> Grid then
      Grid.TopRow := Sender.TopRow;
  end;//ends_procedure
begin
  if Sender is TStringGrid then
  begin
    SelectTopRow(Sender as TStringGrid, StringGrid);
    SelectTopRow(Sender as TStringGrid, StringGrid1);
  end;
end;
// Grids del TabSheet 3
procedure TWCrDocFact.StringGrid1DrawCell(Sender: TObject; ACol, ARow: integer;
  Rect: TRect; State: TGridDrawState);
var
  str: string;
  dValue: double;
  Alineacion: TAlignment;
  sTexto: String;
  iAnchoTexto: Integer;
begin

 If (Sender Is TStringGrid) Then
  with Sender as TStringGrid do
  begin
    if (ARow > 0) then
        Alineacion := taRightJustify;


    sTexto := trim(Cells[ACol,ARow]);
    Canvas.FillRect( Rect );
    iAnchoTexto := Canvas.TextWidth( sTexto );

    case Alineacion of
         taLeftJustify:  Canvas.TextOut( Rect.Left + 5, Rect.Top + 2, sTexto );
         taCenter:       Canvas.TextOut( Rect.Left + ( ( Rect.Right - Rect.Left ) - iAnchoTexto ) div 2, Rect.Top + 2, sTexto );
         taRightJustify: Canvas.TextOut( Rect.Right - iAnchoTexto - 2, Rect.Top + 2, sTexto );
    end;
  end;

end;
// Grids del TabSheet 3
procedure TWCrDocFact.StringGrid1SelectCell(Sender: TObject;
  ACol, ARow: integer; var CanSelect: boolean);
begin
  if StringGrid1.Focused then
  begin
    StringGrid.Row := ARow;
    StringGrid.TopRow := StringGrid1.TopRow;
  end;
end;

{
  + ------------------------------------------------------------------------ +
  |                                                                          |
  |                                                                          |
  + ------------------------------------------------------------------------ +
}
procedure TWCrDocFact.btnCVE_FORMATO_NAFClick(Sender: TObject);
begin
  if Objeto.CrFrmtoNaf.Busca then
    EnableDisableButtons;
end;

procedure TWCrDocFact.btnCVE_FORMATO_NAFExit(Sender: TObject);
begin
end;

// Catalogo de Emisor
procedure TWCrDocFact.btnEmisorClick(Sender: TObject);
var
  CrEmisor:  TCrEmisor;
  strCve_Emisor_Nafin, strNombre_Emisor: string;
  bHasError: boolean;
  nID_EMISOR: integer;
begin
   if Objeto.ValidaAccesoEsp('TCRDOCFACT_EMI',True,True) then
   begin
      CrEmisor := TCrEmisor.Create(Self);
      try
        CrEmisor.GetParams(Objeto);
        CrEmisor.ParamCre := Objeto.ParamCre;

        strCve_Emisor_Nafin := strGrdDataErrors.Cells[C_COLEPO, strGrdDataErrors.Row];
        strNombre_Emisor := Trim(strGrdDataErrors.Cells[C_COLNOMEPO, strGrdDataErrors.Row]);
        bHasError := (strGrdDataErrors1.Cells[C_COLMENSAJE, strGrdDataErrors.Row] <> '');

        if bHasError then
        begin
          nID_EMISOR := GetEmisorByCveNAFIN(strCve_Emisor_Nafin);
          if (nID_EMISOR <> 0) then
          begin
            {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
            //         CrEmisor.FindKey([nID_EMISOR, strCve_Emisor_Nafin]);
            CrEmisor.FindKey([Objeto.ObtenEntidadDescontadoraBINTER, nID_EMISOR,
              strCve_Emisor_Nafin]);
            {/ROIM}
            CrEmisor.Catalogo;
          end
          else
          begin
            {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
            //      CrEmisor.strCve_Emisor_Nafin       := strCve_Emisor_Nafin;
            CrEmisor.strCve_Emisor_Ext := strCve_Emisor_Nafin;
            {/ROIM}
            CrEmisor.strNombre_Emisor  := strNombre_Emisor;
            {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
            //      CrEmisor.CVE_EMISOR_NAFIN.AsString := CrEmisor.strCve_Emisor_Nafin;
            CrEmisor.CVE_EMISOR_EXT.AsString := CrEmisor.strCve_Emisor_Ext;
            {/ROIM}
            CrEmisor.NOMBRE_EMISOR.AsString := CrEmisor.strNombre_Emisor;
            CrEmisor.ShowWindow(ftGrid);
          end;
        end;

      finally
        LoadErrors;
        if Assigned(CrEmisor) then
          CrEmisor.Free;
      end;
   end;
end;
// Catalogo de Emisor
procedure TWCrDocFact.btnProveedorClick(Sender: TObject);
var
  CrProveed: TCrProveed;
  nID_PROV_NAFINSA, nID_PROVEEDOR: integer;
  provExt, proveedor:  string;
  bHasError: boolean;
  I : integer;
begin
   if Objeto.ValidaAccesoEsp('TCRDOCFACT_PRVSR',True,True) then
   begin
      CrProveed := TCrProveed.Create(Self);
      try
        CrProveed.GetParams(Objeto);
        CrProveed.ParamCre := Objeto.ParamCre;

        provExt  := strGrdDataErrors.Cells[C_COLSGDOC_CVEPROVEXT, strGrdDataErrors.Row];
        proveedor := strGrdDataErrors.Cells[C_COLSGDOC_CVEPROVEXT, strGrdDataErrors.Row];
        bHasError := (strGrdDataErrors1.Cells[C_COLMENSAJE, strGrdDataErrors.Row] <> '');

        if IsInteger(provExt) and (bHasError) then
        begin
          nID_PROV_NAFINSA := StrToInt(provExt);
          nID_PROVEEDOR := GetProveedorByCveNAFIN(nID_PROV_NAFINSA);
          if (nID_PROVEEDOR <> 0) then
          begin
            CrProveed.FindKey([Objeto.ObtenEntidadDescontadoraBINTER, nID_PROVEEDOR]);
            CrProveed.Catalogo;
          end
          else
          begin
            CrProveed.ID_ACREDITADO.AsString := strGrdDataErrors.Cells[C_COLSGDOC_CVEPROVEXT, strGrdDataErrors.Row];
            CrProveed.nID_PROV_EXTERNO := StrToInt(proveedor); //El id externo e interno son iguales
            CrProveed.ID_PROV_EXTERNO.AsInteger := CrProveed.nID_PROV_EXTERNO;
            CrProveed.m_sCVE_FND_ENT_DES := Objeto.ObtenEntidadDescontadoraBINTER;
            CrProveed.ShowWindow(ftGrid);
          end;
  {
          //Actualiza la llave en los documentos
          for I := 1 to StringGrid.RowCount - 1 do
          begin
            if (SGDocumentos.Cells[C_COLSGDOC_ID_EPO, I] = proveedor) and
               (SGDocumentos.Cells[C_COLSGDOC_CVEPROVEXT, I] = provExt) then
            SGDocumentos.Cells[C_COLSGDOC_CVEPROVEXT, I] := IntToStr(CrProveed.nID_PROV_EXTERNO);
          end;
  }
        end;
      finally
        LoadErrors;
        if Assigned(CrProveed) then
          CrProveed.Free;
      end;

    //ends_if
   end;
end;
// Catalogo de Emisor Proveedor
procedure TWCrDocFact.btnRelacionEmiProvClick(Sender: TObject);
var
  CrEmiPro: TCrEmiPro;
  strCve_Proveedor_Nafin, strCve_Emisor_Nafin: string;
  nID_EMISOR, nID_PROVEEDOR: integer;
begin
   if Objeto.ValidaAccesoEsp('TCRDOCFACT_EMPRV',True,True) then
   begin
      CrEmiPro := TCrEmiPro.Create(Self);
      try
        CrEmiPro.GetParams(Objeto);
        CrEmiPro.ParamCre := Objeto.ParamCre;

        strCve_Emisor_Nafin := strGrdDataErrors.Cells[C_COLEPO, strGrdDataErrors.Row];
        strCve_Proveedor_Nafin := strGrdDataErrors.Cells[C_COLSIRAC, strGrdDataErrors.Row];

        // Tiene Datos entonces...
        if (Trim(strCve_Proveedor_Nafin) <> '') and (Trim(strCve_Emisor_Nafin) <> '') then
        begin
          nID_EMISOR := GetEmisorByCveNAFIN(strCve_Emisor_Nafin);
          nID_PROVEEDOR := GetProveedorByCveNAFIN(StrToInt(strCve_Proveedor_Nafin));

          // Si encuentra el Promotor entonces
          if GetPromotorByEmiProv(nID_EMISOR, nID_PROVEEDOR) <> 0 then
          begin
            // Muestra el Promotor
            {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
            //    CrEmiPro.FindKey([nID_EMISOR, nID_PROVEEDOR]);
            CrEmiPro.FindKey([Objeto.ObtenEntidadDescontadoraBINTER, nID_EMISOR, nID_PROVEEDOR]);
            {/ROIM}
            CrEmiPro.Catalogo;
          end
          else
          begin
            // Muestra en Modo de Captura
            CrEmiPro.m_nPRE_ID_EMISOR := nID_EMISOR;
            {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
            //    CrEmiPro.m_strCve_Emisor_Nafin := strCve_Emisor_Nafin;
            CrEmiPro.m_strCVE_EMISOR_EXT := strCve_Emisor_Nafin;
            CrEmiPro.m_sCVE_FND_ENT_DES := Objeto.ObtenEntidadDescontadoraBINTER;
            {/ROIM}
            CrEmiPro.m_nPRE_ID_PROVEEDOR := nID_PROVEEDOR;
            CrEmiPro.ShowWindow(ftCaptura);
          end;

        end
        else
          CrEmiPro.Catalogo;

      finally
        LoadErrors;
        if Assigned(CrEmiPro) then
          CrEmiPro.Free;
      end;
   end;
end;
// Contrato de NAFIN
procedure TWCrDocFact.btnId_ContratoClick(Sender: TObject);
var
  strTitular, strMoneda: string;
  vlID_CONTRATO, vlFOL_CONTRATO: integer;
  vlNOMB_CONTRATO, vlCVE_FND_ENT_DES, vlCVE_EMISOR_EXT: string;
begin
  strTitular := StringGrid.Cells[C_COLGRID_ID_EPO, StringGrid.Row];
  strMoneda  := StringGrid.Cells[C_COLGRID_CVE_MONEDA, StringGrid.Row];
  if (Trim(strTitular) <> '') then
  begin
    // <SATV4766 26May2008>  Inclusión de otros contratos
    if BuscaAutorizacionCADENAS(Objeto.Apli, StrToInt(strTitular),
      StrToInt(strMoneda), vlID_CONTRATO,
      vlFOL_CONTRATO, vlNOMB_CONTRATO,
      vlCVE_FND_ENT_DES, vlCVE_EMISOR_EXT) then
    begin
      if vlID_CONTRATO <> 0 then
      begin
        StringGrid.Cells[C_COLGRID_LINEA, StringGrid.Row] :=
          IntToStr(vlID_CONTRATO);
        StringGrid.Cells[C_COLGRID_TITULAR, StringGrid.Row] := vlNOMB_CONTRATO;
        //StringGrid.Cells[C_COLGRID_CVEPROVEXT, StringGrid.Row] := vlCVE_EMISOR_EXT;
{
        if (Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CRPYME) then
          StringGrid.Cells[C_COLGRID_FOLCTTO, StringGrid.Row] :=
            IntToStr(vlFOL_CONTRATO);
}            
      end
      else
        ShowMessage('Su Usuario ' + Objeto.DameUsuario +
          '. No tiene permisos para operar sobre este contrato.'#13#10);
    end;
  end;
end;


// Boton para aplicar el ajuste
procedure TWCrDocFact.btAplicarClick(Sender: TObject);

  function EsValidoAplicaAcuses: boolean;
  var
    I, nCount, nChecks: integer;
  begin
    nCount  := 0;
    nChecks := 0;
    with StringGrid do
      for I := 1 to RowCount - 1 do
      begin
        if (Cells[C_COLAPLICA, I] = C_APLICA) then
        begin
          Inc(nChecks);
          if (Trim(Cells[C_COLACUSE, I]) = '') or (Trim(Cells[C_COLGRID_LINEA, I]) = '') then
          begin
            ShowMessage('Falta Indicar la Línea del Acuse a Aplicar');
            Row := I;
            Col := C_COLGRID_LINEA;
            nCount := 0;
            Break;
          end;
          Inc(nCount);
        end;
      end;

    if (nChecks = 0) then
      ShowMessage('Favor de Marcar las casillas de los Acuses que desea Aplicar.');

    Result := (nCount > 0) and (nChecks > 0);
  end;

var
  Stp: TStoredProc;
  vlQry : TQuery;
  strMessage, strUsuario, strAcuse, strLinea: string;
  comision, tasa, contrato: string;
  bOk: boolean;
  I, J, K {, nProcesados }: integer;
  sFCarga, sFolCtto: string;
  sTxResult: string;
  iResult: integer;
  vlOperaDiaSig: string;  //EASA 27.ABR.2007 Req. Desc. Dolares
  vlCveEmisorExt: string; // SATV4766 16.JUN.2008 Req. Rel Emisor-Autorioacion
  VLsql: string;
  VLCesion: Integer;
  VLCadenaNuevaCesion: String;
begin
   if Objeto.ValidaAccesoEsp('TCRDOCFACT_APLCA',True,True) then
   begin
       if (EsValidoAplicaAcuses) then
       begin

          VLCadenaNuevaCesion := '';

          documentosAplicados := True;

          strUsuario := Objeto.DameUsuario;
          bOk := True;

          vlOperaDiaSig := 'F';
          if chB_OPERA_DIA_SIG.Checked then
             vlOperaDiaSig := 'V';

          Objeto.AsignaEntidadDescontadora(Stp, 'PECVE_FND_ENT_DES');


          with StringGrid do
          for I := 1 to RowCount - 1 do
          begin
               for K := 1 to SGDocumentos.RowCount - 1 do
               begin
                    if (cells[C_COLGRID_ID_EPO, I] = SGDocumentos.cells[C_COLSGDOC_ID_EPO, K]) and
                       (cells[C_COLGRID_CVE_MONEDA, I] = SGDocumentos.cells[C_COLSGDOC_CVE_MONEDA, K]) and
  //                     (cells[C_COLGRID_TIPO_FACTORAJE, I] = SGDocumentos.cells[C_COLSGDOC_TIPO_FACTORAJE, K]) and
                       (Cells[C_COLGRID_ID_PROVEEDOR , I] =  SGDocumentos.Cells[C_COLSGDOC_RFC_PYME, K]) and
                       (Cells[C_COLAPLICA, I] = C_APLICA) and
                       (SGDocumentos.Cells[C_COLAPLICA, K] = C_APLICA) and
                       ((Cells[C_COLGRID_FOL_ACUSE, I] = '0') or (Cells[C_COLGRID_FOL_ACUSE, I] = SGDocumentos.Cells[C_COLSGDOC_FOL_ACUSE, K])) then
                    begin
                         if rgTipoAgrupacion.ItemIndex = 0 then
                         begin
                             //Busca el contrato global
                             for J := 1 to StringGrid.RowCount do
                             begin
                                   if (StringGrid.Cells[C_COLGRID_ID_EPO, J] = SGDocumentos.Cells[C_COLSGDOC_ID_EPO, K]) and
                                      (StringGrid.Cells[C_COLGRID_CVE_MONEDA, J] = SGDocumentos.Cells[C_COLSGDOC_CVE_MONEDA, K]) and
  //                                    (StringGrid.Cells[C_COLGRID_TIPO_FACTORAJE, J] = SGDocumentos.Cells[C_COLSGDOC_TIPO_FACTORAJE, K]) and
                                      (StringGrid.Cells[C_COLGRID_FOL_ACUSE, J] = SGDocumentos.Cells[C_COLSGDOC_FOL_ACUSE, K])then
                                       contrato := StringGrid.Cells[C_COLGRID_LINEA,J];
                             end;
                         end
                         else
                         begin
                             //Busca el contrato global
                             for J := 1 to StringGrid.RowCount do
                             begin
                                   if (StringGrid.Cells[C_COLGRID_ID_EPO, J] = SGDocumentos.Cells[C_COLSGDOC_ID_EPO, K]) and
                                      (StringGrid.Cells[C_COLGRID_CVE_MONEDA, J] = SGDocumentos.Cells[C_COLSGDOC_CVE_MONEDA, K]) then
  //                                    (StringGrid.Cells[C_COLGRID_TIPO_FACTORAJE, J] = SGDocumentos.Cells[C_COLSGDOC_TIPO_FACTORAJE, K]) then
                                       contrato := StringGrid.Cells[C_COLGRID_LINEA,J];
                             end;
                         end;

                         if (((VLCadenaNuevaCesion  <> SGDocumentos.Cells[C_COLSGDOC_ID_EPO, K] +
                                                       SGDocumentos.Cells[C_COLSGDOC_CVEPROVEXT, K] +
                                                       SGDocumentos.Cells[C_COLSGDOC_CVE_MONEDA, K])
                         and (rgTipoAgrupacion.ItemIndex = 1)) or (rgTipoAgrupacion.ItemIndex = 0)) then
                         begin
                               try
                                   Stp := TStoredProc.Create(Self);
                                   Stp.DatabaseName := Objeto.DatabaseName;
                                   Stp.SessionName  := Objeto.SessionName;
                                   Stp.StoredProcName := 'PKGCRFECESION.STPALTACESIONFE';
                                   With Stp Do
                                   Begin
                                        Params.CreateParam(ftFloat,'peIdContrato',ptInput);
                                        Params.CreateParam(ftString,'peCveEntDesc',ptInput);
                                        Params.CreateParam(ftFloat,'peIdEmisor',ptInput);
                                        Params.CreateParam(ftFloat,'peIdProveedor',ptInput);
                                        Params.CreateParam(ftFloat,'peImpCesion',ptInput);
                                        Params.CreateParam(ftString,'peCveUsuAlta',ptInput);
                                        Params.CreateParam(ftString,'peCveTipoInteres',ptInput);
                                        Params.CreateParam(ftString,'peBCommit',ptInput);
                                        Params.CreateParam(ftFloat,'psIdCesion',ptOutput);
                                        Params.CreateParam(ftString,'psSitCesion',ptOutput);
                                        Params.CreateParam(ftFloat,'psResultado',ptOutput);
                                        Params.CreateParam(ftString,'psTxResultado',ptOutput);

                                        ParamByName('peIdContrato').AsString := contrato;
                                        ParamByName('peCveEntDesc').AsString := SGDocumentos.Cells[C_COLSGDOC_CVE_FND_ENT_DES, K];
                                        ParamByName('peIdEmisor').AsString := SGDocumentos.Cells[C_COLSGDOC_ID_EPO, K];
                                        ParamByName('peIdProveedor').AsString := SGDocumentos.Cells[C_COLSGDOC_CVEPROVEXT, K];
                                        ParamByName('peImpCesion').AsString := '0';
                                        ParamByName('peCveUsuAlta').AsString := Objeto.Apli.Usuario;
                                        ParamByName('peCveTipoInteres').AsString := 'IN';
                                        ParamByName('peBCommit').AsString := 'V';

                                        VLCadenaNuevaCesion := SGDocumentos.Cells[C_COLSGDOC_ID_EPO, K] +
                                                               SGDocumentos.Cells[C_COLSGDOC_CVEPROVEXT, K] +
                                                               SGDocumentos.Cells[C_COLSGDOC_CVE_MONEDA, K];

                                        ExecProc;

                                        if (ParamByName('psResultado').AsInteger <> 0) then
                                        begin
                                          MemoMessages.Lines.Add('<' + ParamByName(
                                            'psResultado').AsString + '> ' +
                                            ParamByName('psTxResultado').AsString);
                                          bOk := False;
                                        end
                                        else
                                        begin
                                          if (ParamByName('psTxResultado').AsString <> '') then
                                            MemoMessages.Lines.Add(ParamByName(
                                              'PSTXRESULTADO').AsString);
                                        end;
                                        if bOk then
                                        begin
                                             MemoMessages.Lines.Add('Proceso Terminado Correctamente. Cesion: ' + ParamByName('psIDCesion').AsString);
                                             VLCesion := ParamByName('psIDCesion').AsInteger;
                                        end
                                        else
                                           MemoMessages.Lines.Add('Se produjeron errores al Aplicar las Cesiones, favor de verificarlos.');

                                   end;
                               finally
                                  if Assigned(Stp) then
                                  begin
                                    Stp.Params.Clear;
                                    Stp.Free;
                                  end;
                               end;
                         end;

                         if bOk then
                         begin
                               try
                                   Stp := TStoredProc.Create(Self);
                                   Stp.DatabaseName := Objeto.DatabaseName;
                                   Stp.SessionName  := Objeto.SessionName;
                                   Stp.StoredProcName := 'PKGCRFECESION.STPALTADOCUMENTOFE';
                                   With Stp Do
                                   Begin

                                        Params.CreateParam(ftString,'peIdDocto',ptInput);
                                        Params.CreateParam(ftFloat,'peIdCesion',ptInput);
                                        Params.CreateParam(ftString,'peCveDocto',ptInput);
                                        Params.CreateParam(ftFloat,'peTipoInteres',ptInput);
                                        Params.CreateParam(ftFloat,'peFEmision',ptInput);
                                        Params.CreateParam(ftFloat,'peFCompra',ptInput);
                                        Params.CreateParam(ftFloat,'pePlazoCapital',ptInput);
                                        Params.CreateParam(ftFloat,'peImpNominal',ptInput);
                                        Params.CreateParam(ftString,'peCveUsuAlta',ptInput);
                                        Params.CreateParam(ftString,'peBCommit',ptInput);
                                        Params.CreateParam(ftFloat,'psNumPeriodoDoc',ptOutput);
                                        Params.CreateParam(ftString,'psSitDocto',ptOutput);
                                        Params.CreateParam(ftFloat,'psResultado',ptOutput);
                                        Params.CreateParam(ftString,'psTxResultado',ptOutput);

                                        ParamByName('peIdDocto').AsString := SGDocumentos.Cells[C_COLSGDOC_ID_DOCUMENTO, K];
                                        ParamByName('peIdCesion').AsString := IntToStr(VLCesion);
                                        ParamByName('peCveDocto').AsString :=  'ELEC';
                                        ParamByName('peTipoInteres').AsString :=  'IN';
                                        ParamByName('peFEmision').AsString :=  SGDocumentos.Cells[C_COLSGDOC_F_EMISION_DOC, K];
                                        ParamByName('peFCompra').AsDate := Objeto.Apli.DameFechaEmpresa;
                                        ParamByName('pePlazoCapital').AsInteger := trunc(StrToDate(SGDocumentos.Cells[C_COLSGDOC_F_VENCIMIENTO_DO, K])) - trunc(Objeto.Apli.DameFechaEmpresa);
                                        ParamByName('peImpNominal').AsString := QuitaComas(trim(SGDocumentos.Cells[C_COLSGDOC_IMP_DOCUMENTO, K]));//SGDocumentos.Cells[C_COLSGDOC_IMP_DOCUMENTO, K];
                                        ParamByName('peCveUsuAlta').AsString := Objeto.Apli.Usuario;
                                        ParamByName('peBCommit').AsString := 'V';

                                        ExecProc;

                                        if (ParamByName('psResultado').AsInteger <> 0) then
                                        begin
                                          MemoMessages.Lines.Add('<' + ParamByName(
                                            'psResultado').AsString + '> ' +
                                            ParamByName('psTxResultado').AsString);
                                          bOk := False;
                                        end
                                        else
                                        begin
                                          if (ParamByName('psTxResultado').AsString <> '') then
                                            MemoMessages.Lines.Add(ParamByName(
                                              'PSTXRESULTADO').AsString);
                                        end;
                                        if bOk then
                                           MemoMessages.Lines.Add('Proceso Terminado Correctamente. Documento: ' + ParamByName('psNumPeriodoDoc').AsString)
                                        else
                                           MemoMessages.Lines.Add('Se produjeron errores al Aplicar los Documentos, favor de verificarlos.');


                                        if ParamByName('psResultado').AsInteger = 0 then
                                        begin
                                          VLsql := 'update CR_FE_DOCUMENTO set SIT_DOCUMENTO = ''OR'' where ' +
                                            ' ID_EPO = ' + SGDocumentos.Cells[C_COLSGDOC_ID_EPO, K] +
                                            ' and FOL_ACUSE = ''' + SGDocumentos.Cells[C_COLSGDOC_FOL_ACUSE, K] +  ''' ';
                                          RunSQL( VLsql , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
                                        end;
                                   end;
                               finally
                                  if Assigned(Stp) then
                                  begin
                                    Stp.Params.Clear;
                                    Stp.Free;
                                  end;
                               end;
                         end;
                    end; //end if Si aplica
               end; //end for K
          end; //end for I
      end;

      //Establece el status de negociable a los documentos que no se procesaron
      RestauraEstado;

      strMessage := 'Proceso Terminado..  Favor de validar';

      MemoMessages.Lines.Add(strMessage);
      MemoMessages.Lines.Add('*****************************************************************');
      ShowMessage(strMessage);
      //   End;

      LoadAcuses;
   end;   
end;


procedure TWCrDocFact.btCVE_ENT_DESCClick(Sender: TObject);
begin
  if Objeto.MInstDesc.Busca then
    EnableDisableButtons;
end;
//end_ easa4011

//Carga los documentos de la tabla CR_FE_DOCUMENTO
procedure TWCrDocFact.CambiaEstadoEP;
var
  I : integer;
  vlSQL : String;
begin
  //Regresa el status de negociable
  with SGDocumentos do
    for I := 1 to RowCount - 1 do
    begin
      if Cells[0,I] = C_APLICA then
      begin
        vlSQL :=
          'update CR_FE_DOCUMENTO set SIT_DOCUMENTO = ''EP'' where ' +
          ' ID_EPO = ' + Cells[C_COLSGDOC_ID_EPO, I] +
          ' and CVE_FND_ENT_DES = ''' + Cells[C_COLSGDOC_CVE_FND_ENT_DES, I] + ''' ' +
          ' and ID_DOCUMENTO = ''' + Cells[C_COLSGDOC_ID_DOCUMENTO, I] + ''' ' +
          ' and FOL_ACUSE = ''' + Cells[C_COLSGDOC_FOL_ACUSE, I];
        RunSQL( vlSQl
          , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      end;
    end;
end;

procedure TWCrDocFact.RestauraEstado;
var
  I, J : integer;
begin
  //Regresa el status de negociable
  with SGDocumentos do
    for I := 1 to RowCount - 1 do
    begin
      if (not documentosAplicados) or (Cells[C_COLAPLICA, I] <> C_APLICA) then
      begin
        RunSQL( 'update CR_FE_DOCUMENTO set SIT_DOCUMENTO = ''XD'' where ' +
          ' ID_EPO = ' + Cells[C_COLSGDOC_ID_EPO, I] +
          ' and CVE_FND_ENT_DES = ''' + Cells[C_COLSGDOC_CVE_FND_ENT_DES, I] + ''' ' +
          ' and ID_DOCUMENTO = ''' + Cells[C_COLSGDOC_ID_DOCUMENTO, I] + ''' ' +
          ' and FOL_ACUSE = ''' + Cells[C_COLSGDOC_FOL_ACUSE, I] +  ''' '
          , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      end;
    end;
end;    

procedure TWCrDocFact.SGDocumentosDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  Bmp: TBitmap;
  sTexto: String;        
  Alineacion: TAlignment;
  iAnchoTexto: Integer;  
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin
   if    (ACol = C_COLSGDOC_PLAZO) or(ACol = C_COLSGDOC_IMP_DOCUMENTO) or (ACol = C_COLSGDOC_CARGAR) then
          Alineacion := taRightJustify;

   if    (ACol = C_COLSGDOC_CVE_MONEDA) or(ACol = C_COLSGDOC_ID_EPO) or(ACol = C_COLSGDOC_NOMBRE_EPO ) or(ACol = C_COLSGDOC_RFC_PYME) or
         (ACol = C_COLSGDOC_NOMBRE_PYME)  or(ACol = C_COLSGDOC_ID_DOCUMENTO) or(ACol = C_COLSGDOC_F_VENCIMIENTO_DO) or
         (ACol = C_COLSGDOC_CVE_FND_ENT_DES)  or(ACol = C_COLSGDOC_FOL_ACUSE) or(ACol = C_COLSGDOC_FOL_ACUSE_ARCHIVO) or
         (ACol = C_COLSGDOC_CVE_OFICINA)  or(ACol = C_COLSGDOC_ID_INTER_FINAN) or(ACol = C_COLSGDOC_F_EMISION_DOC) or
         (ACol = C_COLSGDOC_IDCESION)  or(ACol = C_COLSGDOC_RFC_BENEFICIARIO) or(ACol = C_COLSGDOC_F_EFEC_DESCTO) or
         (ACol = C_COLSGDOC_CUENTA_DEPOSITO)  or(ACol = C_COLSGDOC_CVEPROVEXT) or(ACol = C_COLSGDOC_DESC_MONEDA) or
         (ACol = C_NCOLS_COLSGDOC) then
         Alineacion := taLeftJustify;

      sTexto := Cells[ACol,ARow];
      Canvas.FillRect( Rect );
      iAnchoTexto := Canvas.TextWidth( sTexto );

      case Alineacion of
        taLeftJustify:  Canvas.TextOut( Rect.Left + 5, Rect.Top + 2, sTexto );
        taCenter:       Canvas.TextOut( Rect.Left + ( ( Rect.Right - Rect.Left ) - iAnchoTexto ) div 2, Rect.Top + 2, sTexto );
        taRightJustify: Canvas.TextOut( Rect.Right - iAnchoTexto - 2, Rect.Top + 2, sTexto );
      end;

       if (ACol = 0) and (ARow > 0) then
    if (Trim(SGDocumentos.Cells[0, ARow]) <> '') then
    begin
      Bmp := TBitmap.Create;
      if Assigned(Bmp) then
      begin

        if (SGDocumentos.Cells[0, ARow] = '1') then
          ImageList.GetBitmap(1, Bmp)
        else
          ImageList.GetBitmap(0, Bmp);
        SGDocumentos.Canvas.Draw(Rect.Left, Rect.Top, Bmp);

        Bmp.FreeImage;
        Bmp.Free;
      end;
    end;

  end;


end;

Procedure TWCrDocFact.BuscaSolicitudes;
var
  Qry : TQuery;
  vlsql : String;
  nRow : Integer;
begin
  //Cambia el estado    de los documentos existentes en pantalla
  RestauraEstado;

  //Borra la tabla de documentos
  ClearGrid(SGDocumentos);

  //--> Selecciona los nuevos documentos
  Qry := TQuery.Create(nil);

  if not Assigned(Qry) then
    Exit;

  with Qry do
    try
      // Se agregan todos los documentos a la tabla
      // que cumplan con la situación definida con el fin de que el usuario
      // seleccione los que se requieren procesar
      vlsql :=   ' SELECT BASE.*, NVL(CESI.ID_CESION,0) AS ID_CESION  FROM ( ' +
        ' select cfd.ID_EPO, ' +
        '        cfd.CVE_FND_ENT_DES, ' +
        '        cfd.ID_DOCUMENTO, ' +
        '        cfd.FOL_ACUSE, ' +
        '        cfd.FOL_ACUSE_ARCHIVO, ' +
        '        cfd.CVE_OFICINA, ' +
        '        cfd.RFC_PYME, ' +
        '        cfd.NOMBRE_PYME, ' +
        '        cfd.ID_INTER_FINAN, ' +
        '        cfd.F_EMISION_DOC, ' +
        '        cfd.F_VENCIMIENTO_DO, ' +
        '        M.CVE_MONEDA, ' +
        '        decode (M.CVE_MONEDA, 484, ''PESO'', 840, ''DLLS'', M.CVE_MONEDA) as DESC_MONEDA, ' +
        '        cfd.TIPO_FACTORAJE, ' +
        '        cfd.IMP_DOCUMENTO, ' +
        '        cfd.RFC_BENEFICIARIO, ' +
        '        cfd.F_EFEC_DESCTO, ' +
        '        cfd.CUENTA_DEPOSITO, ' +
        '        PEM.NOMBRE AS NOMBRE_EMISOR, ' +
        '        nvl (PE.ID_PROV_EXTERNO, 0) as PROVEEDOR_EXT, ' +
        '        PE.ID_ACREDITADO AS ID_PROVEEDOR ' +
        ' from   cr_fe_documento cfd, ' +
        '        moneda M, ' +
        '        (select CP.ID_ACREDITADO, CP.ID_PROV_EXTERNO, P.NOMBRE ' +
        '           from CR_PROVEEDOR CP, ' +
        '                PERSONA P ' +
        '          Where CP.ID_ACREDITADO = P.ID_PERSONA and CVE_FND_ENT_DES = '''+objeto.ObtenEntidadDescontadoraBINTER+''') PE, ' +
        '        (select CP.ID_ACREDITADO, P.NOMBRE ' +
        '           from CR_EMISOR CP, ' +
        '                PERSONA P ' +
        '          Where CP.ID_ACREDITADO = P.ID_PERSONA and CVE_FND_ENT_DES = '''+objeto.ObtenEntidadDescontadoraBINTER+''') PEM, ' +
//ROIM 04/07/2012  Se agrega el filtro para relacionar RFC con persona en situación Activa)
//                    '          (select ID_PERSONA,SIGLAS_RFC || F_RFC || HOMOCLAVE_RFC as RFC from RFC) RFC ' +
                    ' (select PER.ID_PERSONA,SIGLAS_RFC || F_RFC || HOMOCLAVE_RFC as RFC ' +
                    '    from RFC, PERSONA PER ' +
                    '   WHERE PER.ID_PERSONA = RFC.ID_PERSONA ' +
                    '     AND   PER.SIT_PERSONA = ''AC'' ) RFC ' +
//Fin ROIM
        ' where  M.CVE_MON_NAFIN(+) = CFD.CVE_MONEDA ' +
        ' and	 cfd.SIT_DOCUMENTO = ''XD'' ' +
        ' AND    PEM.ID_ACREDITADO(+) = cfd.ID_EPO ' +
        ' and	 PE.ID_ACREDITADO(+) = RFC.ID_PERSONA ' +
        ' and	 CFD.RFC_PYME = RFC.RFC(+)' +
        '         ) BASE, ' +
        '        (SELECT CCES.ID_CESION, CCES.ID_EMISOR, CCES.CVE_EMISOR_NAFIN, CCES.ID_PROVEEDOR, CCES.CVE_FND_ENT_DES, ' +
        '         CDOC.ID_DOCUMENTO, CDOC.F_EMISION ' +
        '         FROM   CR_CESION CCES, ' +
        '         CR_DOCUMENTO CDOC ' +
        '         WHERE  CCES.ID_CESION = CDOC.ID_CESION) CESI ' +

        ' WHERE  CESI.ID_EMISOR (+)= BASE.ID_EPO ' +
        ' AND    CESI.CVE_EMISOR_NAFIN (+)= TO_CHAR(BASE.ID_EPO) ' +
        ' AND    CESI.ID_PROVEEDOR (+)= BASE.ID_PROVEEDOR ' +
        ' AND    CESI.CVE_FND_ENT_DES (+)= BASE.CVE_FND_ENT_DES ' +
        ' AND    CESI.ID_DOCUMENTO (+)= BASE.ID_DOCUMENTO ' +
        ' AND    CESI.F_EMISION (+)= BASE.F_EMISION_DOC ';

      if edCVE_MONEDA.Text <> '' then
      begin
          vlsql := vlsql +
                   ' AND BASE.CVE_MONEDA = ' + objeto.Moneda.Cve_Moneda.AsSQL;
      end;

      if edID_EMISOR.Text <> '' then
      begin
          vlsql := vlsql +
                   ' AND BASE.ID_EPO = ' + objeto.Emisor.ID_ACREDITADO.AsSQL;
      end;

      if edID_PROVEEDOR.Text <> '' then
      begin
          vlsql := vlsql +
                   ' AND BASE.RFC_PYME = ' + #39 +  Trim(objeto.Proveedor.Persona.Siglas_RFC.AsString) +
                                                   Trim(Objeto.Proveedor.Persona.F_RFC.AsString) +
                                                   Trim(Objeto.Proveedor.Persona.Homoclave_RFC.AsString) +  #39;
      end;

      DataBaseName := Objeto.DataBaseName;
      SessionName  := Objeto.SessionName;
      SQL.Clear;
      SQL.Add(vlSql);
      Open;


      SGDocumentos.RowCount  := 60;
      SGDocumentos.ColCount  := C_NCOLS_COLSGDOC;

      with SGDocumentos do
      begin
        ColWidths[C_COLSGDOC_CARGAR] := 25;
        Cells[C_COLSGDOC_CARGAR     ,0] := '';
        Cells[C_COLSGDOC_ID_EPO     ,0] := 'Cve. EPO';
        ColWidths[C_COLSGDOC_ID_EPO] := 55;        
        Cells[C_COLSGDOC_NOMBRE_EPO, 0] := 'Nombre EPO';
        ColWidths[C_COLSGDOC_NOMBRE_EPO] := 130;
        Cells[C_COLSGDOC_CVE_FND_ENT_DES     ,0] := 'Ent, Desc.';
        ColWidths[C_COLSGDOC_CVE_FND_ENT_DES] := 0;
        Cells[C_COLSGDOC_ID_DOCUMENTO     ,0] := 'Núm Doc.';
        Cells[C_COLSGDOC_FOL_ACUSE     ,0] := 'Número de Acuse';
        ColWidths[C_COLSGDOC_FOL_ACUSE] := 130;
        Cells[C_COLSGDOC_FOL_ACUSE_ARCHIVO     ,0] := 'Acuse Archivo';
        ColWidths[C_COLSGDOC_FOL_ACUSE_ARCHIVO] := 0;
        Cells[C_COLSGDOC_CVE_OFICINA     ,0] := 'Cve. Oficina';
        ColWidths[C_COLSGDOC_CVE_OFICINA] := 0;
        Cells[C_COLSGDOC_RFC_PYME     ,0] := 'Cve PYME';
        ColWidths[C_COLSGDOC_RFC_PYME ] := 75;        
        Cells[C_COLSGDOC_NOMBRE_PYME     ,0] := 'Nombre PYME';
        ColWidths[C_COLSGDOC_NOMBRE_PYME] := 130;
        Cells[C_COLSGDOC_ID_INTER_FINAN     ,0] := 'Cve.Inter. Finan';
        ColWidths[C_COLSGDOC_ID_INTER_FINAN] := 0;
        Cells[C_COLSGDOC_F_EMISION_DOC     ,0] := 'Fecha Emisión';
        ColWidths[C_COLSGDOC_F_EMISION_DOC] := 0;
        Cells[C_COLSGDOC_F_VENCIMIENTO_DO     ,0] := 'Fecha Venc.';
        ColWidths[C_COLSGDOC_F_VENCIMIENTO_DO] := 70;
        Cells[C_COLSGDOC_PLAZO          ,0] := '     Plazo';
        ColWidths[C_COLSGDOC_PLAZO] := 45;
        Cells[C_COLSGDOC_CVE_MONEDA     ,0] := 'Cve. Moneda';
        ColWidths[C_COLSGDOC_CVE_MONEDA] := 0;
        Cells[C_COLSGDOC_DESC_MONEDA     ,0] := 'Moneda';
//        Cells[C_COLSGDOC_TIPO_FACTORAJE     ,0] := 'Factoraje';
        Cells[C_COLSGDOC_IMP_DOCUMENTO     ,0] := '    Imp. Docto';
        ColWidths[C_COLSGDOC_IMP_DOCUMENTO] := 100;
        Cells[C_COLSGDOC_RFC_BENEFICIARIO     ,0] := 'RFC Beneficiario';
        ColWidths[C_COLSGDOC_RFC_BENEFICIARIO] := 0;
        Cells[C_COLSGDOC_F_EFEC_DESCTO     ,0] := 'Fecha Efec. Venc.';
        ColWidths[C_COLSGDOC_F_EFEC_DESCTO] := 0;
        Cells[C_COLSGDOC_CUENTA_DEPOSITO     ,0] := 'Cuenta Depósito';
        ColWidths[C_COLSGDOC_CUENTA_DEPOSITO] := 0;

        Cells[C_COLSGDOC_IDCESION     ,0] := 'No Cesion';
        ColWidths[C_COLSGDOC_CVEPROVEXT] := 0;

      end;

      nRow := 1;
      while not EOF do
      begin
        if  FieldByName('ID_CESION').AsString = '0' THEN
           SGDocumentos.Cells[C_COLGRID_CARGAR, nRow] := C_APLICA
        else
           SGDocumentos.Cells[C_COLGRID_CARGAR, nRow] := C_NOAPLICA;
        //end if
        SGDocumentos.Cells[C_COLSGDOC_ID_EPO, nRow] := FieldByName('ID_EPO').AsString;
        SGDocumentos.Cells[C_COLSGDOC_NOMBRE_EPO, nRow] := FieldByName('NOMBRE_EMISOR').AsString;
        SGDocumentos.Cells[C_COLSGDOC_CVE_FND_ENT_DES, nRow] := FieldByName('CVE_FND_ENT_DES').AsString;
        SGDocumentos.Cells[C_COLSGDOC_ID_DOCUMENTO, nRow] := FieldByName('ID_DOCUMENTO').AsString;
        SGDocumentos.Cells[C_COLSGDOC_FOL_ACUSE, nRow] := FieldByName('FOL_ACUSE').AsString;
        SGDocumentos.Cells[C_COLSGDOC_FOL_ACUSE_ARCHIVO, nRow] := FieldByName('FOL_ACUSE_ARCHIVO').AsString;
        SGDocumentos.Cells[C_COLSGDOC_CVE_OFICINA, nRow] := FieldByName('CVE_OFICINA').AsString;
        SGDocumentos.Cells[C_COLSGDOC_RFC_PYME, nRow] := FieldByName('ID_PROVEEDOR').AsString;
        SGDocumentos.Cells[C_COLSGDOC_NOMBRE_PYME, nRow] := FieldByName('NOMBRE_PYME').AsString;
        SGDocumentos.Cells[C_COLSGDOC_ID_INTER_FINAN, nRow] := FieldByName('ID_INTER_FINAN').AsString;
        SGDocumentos.Cells[C_COLSGDOC_F_EMISION_DOC, nRow] := FieldByName('F_EMISION_DOC').AsString;
        SGDocumentos.Cells[C_COLSGDOC_F_VENCIMIENTO_DO, nRow] := FieldByName('F_VENCIMIENTO_DO').AsString;
        // JFOF AGRAGA COLUMNA DE PLAZO
//        SGDocumentos.Cells[C_COLSGDOC_PLAZO, nRow] := IntToStr(trunc(StrToDate(FieldByName('F_VENCIMIENTO_DO').AsString))- trunc(Objeto.Apli.DameFechaEmpresa));
        SGDocumentos.Cells[C_COLSGDOC_PLAZO, nRow] := IntToStr(trunc(StrToDate(FieldByName('F_VENCIMIENTO_DO').AsString))- trunc(Objeto.Apli.DameFechaEmpresa));
        // JFOF
        SGDocumentos.Cells[C_COLSGDOC_CVE_MONEDA, nRow] := FieldByName('CVE_MONEDA').AsString;
        SGDocumentos.Cells[C_COLSGDOC_DESC_MONEDA, nRow] := FieldByName('DESC_MONEDA').AsString;
//        SGDocumentos.Cells[C_COLSGDOC_TIPO_FACTORAJE, nRow] := FieldByName('TIPO_FACTORAJE').AsString;
        SGDocumentos.Cells[C_COLSGDOC_IMP_DOCUMENTO, nRow] := FORMAT(CFORMAT_DINERO, [FieldByName('IMP_DOCUMENTO').AsFloat]);//FieldByName('IMP_DOCUMENTO').AsString;
        SGDocumentos.Cells[C_COLSGDOC_RFC_BENEFICIARIO, nRow] := FieldByName('RFC_BENEFICIARIO').AsString;
        SGDocumentos.Cells[C_COLSGDOC_F_EFEC_DESCTO, nRow] := FieldByName('F_EFEC_DESCTO').AsString;
        SGDocumentos.Cells[C_COLSGDOC_CUENTA_DEPOSITO, nRow] := FieldByName('CUENTA_DEPOSITO').AsString;
        SGDocumentos.Cells[C_COLSGDOC_CVEPROVEXT, nRow] := FieldByName('PROVEEDOR_EXT').AsString;
        SGDocumentos.Cells[C_COLSGDOC_IDCESION, nRow] := FieldByName('ID_CESION').AsString;

        Inc(nRow);
        Next;
      end;

      // Ajusta el Grid con los resultados mostrados
      if (nRow > 1) then
        SGDocumentos.RowCount := nRow
      else
        SGDocumentos.RowCount := 2;

      if (Trim(SGDocumentos.Cells[C_COLGRID_CARGAR, 1]) = '') then
        ShowMessage('No existen documentos por Aplicar');
    finally
      Close;
      Free;
    end;
end;

procedure TWCrDocFact.btnDocumentosClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRDOCFACT_DOCXP',True,True) then
   begin
      BuscaSolicitudes;
   end;
end;

procedure TWCrDocFact.btnProcesarClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRDOCFACT_PRCDC',True,True) then
   begin
     LoadAcuses;
     LoadErrors;
   end;
end;

procedure TWCrDocFact.SGDocumentosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  nCol, nRow: longint;
  Bmp: TBitmap;
begin
  with SGDocumentos do
  begin
    MouseToCell(X, Y, nCol, nRow);
    if (nCol = 0) and (nRow > 0) then
      InvertCheck(SGDocumentos, 0, nRow);
  end;
end;

procedure TWCrDocFact.SGDocumentosKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TWCrDocFact.SGDocumentosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    32: InvertCheck(SGDocumentos, 0, SGDocumentos.Row);
  end;
end;

procedure TWCrDocFact.btCVE_MONEDAClick(Sender: TObject);
begin                                                             
   if Objeto.ValidaAccesoEsp('TCRDOCFACT_MON',True,True) then
   begin
     Objeto.Moneda.ShowAll := True;
     If Objeto.Moneda.Busca Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        BuscaSolicitudes;
        InterForma1.NextTab(edCVE_MONEDA);
     End;
   end;
end;

procedure TWCrDocFact.btEMISORClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRDOCFACT_EMIS',True,True) then
   begin
     Objeto.Emisor.BuscaWhereString := ' CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + '0070020' + #39;
     Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;

     Objeto.Emisor.ShowAll := True;
     If Objeto.Emisor.Busca Then Begin
        chbxEmisor.Checked:=True;
        chbxEmisor.Enabled:=True;
        BuscaSolicitudes;
        InterForma1.NextTab(edID_EMISOR);
     End;
   end;
end;

procedure TWCrDocFact.btPROVEEDORClick(Sender: TObject);
Var vlMensaje :String;
begin
   if Objeto.ValidaAccesoEsp('TCRDOCFACT_PROV',True,True) then
   begin
     Objeto.Proveedor.BuscaWhereString := ' CR_PROVEEDOR.CVE_FND_ENT_DES = ' + #39 + '0070020' + #39;
     Objeto.Proveedor.FilterString := Objeto.Proveedor.BuscaWhereString;


     Objeto.Proveedor.ShowAll := True;
     If Objeto.Proveedor.Busca Then Begin
        chbxProveedor.Checked:=True;
        chbxProveedor.Enabled:=True;
          //EASA  REQ. 20007 - 07 / 018   CARTERA IMPAGADA
          InterForma1.NextTab(edID_EMISOR);
          InterForma1.MsgPanel.Caption := '';
          InterForma1.MsgPanel.Color := clBtnFace;
          InterForma1.MsgPanel.Font.Color := clWhite;
          if not ( FindDispIMPProv(Objeto.Proveedor.ID_ACREDITADO.AsInteger,Objeto.Apli, vlMensaje)) then
          Begin
             InterForma1.MsgPanel.Caption := vlMensaje;
             InterForma1.MsgPanel.Color := clRed;
             InterForma1.MsgPanel.Font.Color := clWhite;
             if MessageDlg(vlMensaje + ', desea ver el detalle?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
             Begin
                Objeto.DetImpagado := TCrCartrIm.Create(self);
                Try
                  Objeto.DetImpagado.Apli:= Objeto.Apli;
                  Objeto.DetImpagado.ID_ACREDITADO.AsString := Objeto.Proveedor.ID_ACREDITADO.ASstring;
                  Objeto.DetImpagado.NOM_ACREDITADO.AsString := Objeto.Proveedor.Persona.nombre.asstring;
                  Objeto.DetImpagado.TIPO_CLIENTE.AsString := 'PR';
                  Objeto.DetImpagado.ParamCre:=Objeto.ParamCre;
                  Objeto.DetImpagado.Catalogo;
                finally
                  Objeto.DetImpagado.Free;
                end;
             end;
          end;
          //END EASA
        BuscaSolicitudes;
        InterForma1.NextTab(edID_PROVEEDOR);
     End;
   end;
end;

procedure TWCrDocFact.ilMONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) then Begin
      chbxMoneda.Checked:=True;
      chbxMoneda.Enabled:=True;
      BuscaSolicitudes;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWCrDocFact.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrDocFact.ilEMISOREjecuta(Sender: TObject);
begin
  Objeto.Emisor.BuscaWhereString := ' CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + '0070020' + #39 ;
  Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;

   If Objeto.Emisor.FindKeyNear([ilEMISOR.Buffer],['ID_ACREDITADO']) Then Begin
      chbxEmisor.Checked:=True;
      chbxEmisor.Enabled:=True;
      BuscaSolicitudes;
      InterForma1.NextTab(edID_EMISOR);
   End;
end;

procedure TWCrDocFact.ilEMISORCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TWCrDocFact.ilPROVEEDOREjecuta(Sender: TObject);
Var vlMensaje :String;
begin
  Objeto.Proveedor.BuscaWhereString := ' CR_PROVEEDOR.CVE_FND_ENT_DES = ' + #39 + '0070020' + #39;
  Objeto.Proveedor.FilterString := Objeto.Proveedor.BuscaWhereString;

  If Objeto.Proveedor.FindKeyNear([ilPROVEEDOR.Buffer],['ID_ACREDITADO']) Then Begin
      chbxProveedor.Checked:=True;
      chbxProveedor.Enabled:=True;
        //EASA  REQ. 20007 - 07 / 018   CARTERA IMPAGADA
        InterForma1.NextTab(edID_EMISOR);
        InterForma1.MsgPanel.Caption := '';
        InterForma1.MsgPanel.Color := clBtnFace;
        InterForma1.MsgPanel.Font.Color := clWhite;
        if not ( FindDispIMPProv(Objeto.Proveedor.ID_ACREDITADO.AsInteger,Objeto.Apli, vlMensaje)) then
        Begin
           InterForma1.MsgPanel.Caption := vlMensaje;
           InterForma1.MsgPanel.Color := clRed;
           InterForma1.MsgPanel.Font.Color := clWhite;
           if MessageDlg(vlMensaje + ', desea ver el detalle?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Begin
              Objeto.DetImpagado := TCrCartrIm.Create(self);
              Try
                Objeto.DetImpagado.Apli:= Objeto.Apli;
                Objeto.DetImpagado.ID_ACREDITADO.AsString := Objeto.Proveedor.ID_ACREDITADO.ASstring;
                Objeto.DetImpagado.NOM_ACREDITADO.AsString := Objeto.Proveedor.Persona.nombre.asstring;
                Objeto.DetImpagado.TIPO_CLIENTE.AsString := 'PR';
                Objeto.DetImpagado.ParamCre:=Objeto.ParamCre;
                Objeto.DetImpagado.Catalogo;
              finally
                Objeto.DetImpagado.Free;
              end;
           end;
        end;
        //END EASA
      BuscaSolicitudes;        
      InterForma1.NextTab(edID_PROVEEDOR);
   End;
end;

procedure TWCrDocFact.ilPROVEEDORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TWCrDocFact.chbxMonedaClick(Sender: TObject);
begin
    If not chbxMoneda.Checked Then Begin
        Objeto.Moneda.Active:=False;
        chbxMoneda.Checked:=False;
        chbxMoneda.Enabled:=False;
    End Else Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
    End;
    BuscaSolicitudes;
end;

procedure TWCrDocFact.chbxEmisorClick(Sender: TObject);
begin
    If not chbxEmisor.Checked Then Begin
        Objeto.Emisor.Active:=False;
        chbxEmisor.Checked:=False;
        chbxEmisor.Enabled:=False;
    End Else Begin
        chbxEmisor.Checked:=True;
        chbxEmisor.Enabled:=True;
    End;
    BuscaSolicitudes;
end;

procedure TWCrDocFact.chbxProveedorClick(Sender: TObject);
begin
    If not chbxProveedor.Checked Then Begin
        Objeto.Proveedor.Active:=False;
        chbxProveedor.Checked:=False;
        chbxProveedor.Enabled:=False;
    End Else Begin
        chbxProveedor.Checked:=True;
        chbxProveedor.Enabled:=True;
    End;
    BuscaSolicitudes;    
end;

procedure TWCrDocFact.rgTipoAgrupacionClick(Sender: TObject);
begin
     BuscaSolicitudes;
end;

procedure TWCrDocFact.PageControlChange(Sender: TObject);
begin
     if PageControl.ActivePageIndex = 0 then
     begin
          BuscaSolicitudes;     
     end;
end;

procedure TWCrDocFact.LeerEdosCtaClick(Sender: TObject);
const
  xlWBATWorksheet = -4167;
var
  Excel, WorkBook, WorkSheet: Variant;
  I, J : Integer;
 begin
   if Objeto.ValidaAccesoEsp('TCRDOCFACT_EXCEL',True,True) then
   begin
      Excel := CreateOleObject('Excel.Application');
      Excel.DisplayAlerts := false;
      Workbook := Excel.Workbooks.Add(xlWBATWorksheet);
      WorkSheet := WorkBook.WorkSheets[1];
      WorkSheet.Name := 'Factoraje';
       // Tomando desde un StringGrid
       for I := 0 to SGDocumentos.ColCount -1 do
         begin
           for J := 0 to SGDocumentos.RowCount -1 do
           WorkSheet.Cells[J+1, I+1] := SGDocumentos.Cells[I, J];
         end;
       // guarda el archivo
      if WorkBook.SaveAs('C:\Docs_Factoraje.xlsx') then
      Showmessage(' Se generó Archivo "Docs_Factoraje" en C:\ ');
      Excel.Quit;
   end;
 end;

function TWCrDocFact.QuitaComas(PPCadena: String): String;
var
   vlIndex, vlTotal : Integer;
   vlCar,vlRenglon: String;
begin
   vlTotal:= Length (Trim(PPCadena));
   vlRenglon:='';

   for vlIndex := 1 to vlTotal do
   begin
      vlCar:= Copy(PPCadena, vlIndex, 1);
      if  vlCar <> ',' then vlRenglon:=vlRenglon+vlCar;
   end;
   QuitaComas:=vlRenglon;
end;

end.
