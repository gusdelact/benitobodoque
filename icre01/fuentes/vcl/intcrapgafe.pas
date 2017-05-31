// Sistema         : Clase de CR_APL_GAR_FEGA
// Fecha de Inicio : 16/08/2004
// Función forma   : Clase de CR_APL_GAR_FEGA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Sergio Eduardo Lopez Lopez
// Comentarios     :
Unit IntCrApGaFe;

interface

uses
Windows, Messages, SysUtils, Classes,  Graphics, Controls,  Forms,     Dialogs,
IntFrm,  DB,       DbTables, Mask,     StdCtrls, Buttons,   ExtCtrls,  InterFor,
IntFind, UnSQL2,   InterFun, ComCtrls, IntDtPk,  IntLinkit, Grids,     Aligrid,

IntParamCre,   // Unidad de paramétros del Panel
IntGenCre,     // Unidad genérica de funciones y constantes
IntCrCobConst, // Unidad genérica de funciones y constantes de cobranza
IntCrAcredit,  // Acrediado
IntCrProduct,  // Producto
IntCrProveed,  // Proveedor
IntCrCredito, ImgList, InterEdit   // Disposición


;

Type
 TCrApGaFe = class; 

  TWCrAplGarFega=Class(TForm)
    InterForma1             : TInterForma;
    lbFiltro: TLabel;
    edValorFiltro: TEdit;
    btnFiltro: TBitBtn;
    ikValorFiltro: TInterLinkit;
    edDESC_FILTRO: TEdit;
    pnColumnas: TPanel;
    edTitDocto: TEdit;
    edTitFVentto: TEdit;
    edTitImpDep: TEdit;
    edTitSEL: TEdit;
    edTitDisp: TEdit;
    edTitImpCap: TEdit;
    edTitFOper: TEdit;
    sagDATOS: TStringAlignGrid;
    btnAplica: TButton;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    MErrores: TMemo;
    rgTipoFiltro: TRadioGroup;
    Edit1: TEdit;
    ImageList: TImageList;
    Edit2: TEdit;
    Edit3: TEdit;
    rgMotivo: TRadioGroup;
    lbMotivo: TLabel;
    edTxMotivo: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure ikValorFiltroEjecuta(Sender: TObject);
    procedure rgTipoFiltroClick(Sender: TObject);
    procedure sagDATOSDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sagDATOSMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sagDATOSSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure rgMotivoClick(Sender: TObject);
    procedure edTxMotivoExit(Sender: TObject);
    procedure btnAplicaClick(Sender: TObject);
  private
    fBolSearch   : Boolean;
    fDataFound   : Boolean;
  private
    function     ExisteRegActivo : Boolean;
    procedure    LimpiaPantalla;
    Function     BeginSearch( BBusca : Boolean; const Llave : array of TVarRec ): Boolean;
    procedure    MuestraDatos;
    procedure    SetTipoFiltro;
    //
    procedure    GetFromGrid( peRowGrid, peColGrid : Integer);
    procedure    UpdateToGrid;
    procedure    DrawControls;
    procedure    GetFromControls;
    procedure    ProcesaCambio;
  public
    Objeto : TCrApGaFe;
  end;
  //
  TCrApGaFe= class(TInterFrame)
  private
  protected
  public
    TIPO_FILTRO              : TInterCampo;
    VALOR_FILTRO             : TInterCampo;
    //
    INDICE_GRID              : TInterCampo;
    COLUMNA_GRID             : TInterCampo;
    B_APLICA                 : TInterCampo;
    ID_CREDITO               : TInterCampo;
    NUM_PERIODO              : TInterCampo;
    ID_SOLICITUD             : TInterCampo;
    IMP_SOLICITADO           : TInterCampo;
    IMP_APLICADO             : TInterCampo;
    IMP_RECUPERADO           : TInterCampo;
    IMP_X_RECUPERAR          : TInterCampo;
    TIPO_APLICACION          : TInterCampo;
    CVE_TIPO_APLICA          : TInterCampo;
    TX_MOTIVO                : TInterCampo;
    SITUACION                : TInterCampo;
    //
    ParamCre                 : TParamCre;
    CatAcreditado            : TCrAcredit;
    CatCredito               : TCrCredito;
  private
    function    BuildSQLStr : String;
    function    BoolToStr( peValor : Boolean ) : String;
    function    StrToBool( peValor : String  ) : Boolean;
    procedure   stpAplicaGarFEGA( peIdSolicitud     : Integer;
                                  peTipoMetodo      : String;
                                  peTxMotivo        : String;
                                  var psResultado   : Integer;
                                  var psTxResultado : String );
  public
    function     InternalBusca : Boolean; override;
    constructor  Create( AOwner : TComponent ); override;
    destructor   Destroy; override;
    function     ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;


const
   // Claves de los tipos de búsqueda
   coCFAcred     = 'AC';
   coCFProv      = 'PR';
   coCFDisp      = 'CR';
   coCFNoCtrl    = 'NC';
   coCFIdFIRA    = 'IF';
   coCFEmNaf     = 'EN';
   coCFProcrea   = 'PC';
   //
   coMsgErrTipo   = 'Debe indicar el tipo de aplicación y el motivo.' + coCRLF +
                    '¿Desea continuar con el siguiente registro?';
   coMsgErrProc   = 'Ocurrió un error.%sCódigo: %d%sMesg: %s%s¿Desea continuar?';
   // Posicion de los datos en el GRID ( Datos Visibles )
   COL_SEL  = 0;         // Aplica cobro
   COL_CRED = 1;         // Número de disposición
   COL_NPER = 2;         // Número de periodo
   COL_IDSO = 3;         // Id de solicitud
   COL_ISOL = 4;         // Importe solicitado
   COL_IAPL = 5;         // Importe aplicado
   COL_IREC = 6;         // Importe x recuperado
   COL_IXRE = 7;         // Importe x aplicar
   COL_TIPA = 8;         // Tipo de aplicación
   COL_TXNT = 9;         // Tx Nota
   COL_VIS  = COL_TXNT;  // Ultima columna visible del grid
   COL_SITG = 10;        // Situacion
   COL_CTIP = 11;        // Clave tipo de aplicacion




implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrApGaFe.Create( AOwner : TComponent ); 
begin
  Inherited;
  // Crea los intercampos utilizados para la busqueda
  TIPO_FILTRO  := CreaCampo( 'TIPO_FILTRO',  ftString, tsNinguno, tsNinguno, False);
  With TIPO_FILTRO do
  begin
    Size     := 2;
    UseCombo := True;
    ComboLista.Add('0');      ComboDatos.Add( coCFAcred   );
    ComboLista.Add('1');      ComboDatos.Add( coCFDisp    );
    ComboLista.Add('2');      ComboDatos.Add( coCFNoCtrl  );
    ComboLista.Add('3');      ComboDatos.Add( coCFIdFIRA  );
  end;
  VALOR_FILTRO := CreaCampo( 'VALOR_FILTRO', ftString, tsNinguno, tsNinguno, False );
  //
  INDICE_GRID       := CreaCampo( 'INDICE_GRID',       ftInteger, tsNinguno, tsNinguno, False );
  COLUMNA_GRID      := CreaCampo( 'COLUMNA_GRID',      ftInteger, tsNinguno, tsNinguno, False );
  B_APLICA          := CreaCampo( 'B_APLICA',          ftString,  tsNinguno, tsNinguno, False );
  ID_CREDITO        := CreaCampo( 'ID_CREDITO',        ftInteger, tsNinguno, tsNinguno, False );
  NUM_PERIODO       := CreaCampo( 'NUM_PERIODO',       ftInteger, tsNinguno, tsNinguno, False );
  ID_SOLICITUD      := CreaCampo( 'ID_SOLICITUD',      ftInteger, tsNinguno, tsNinguno, False );
  IMP_SOLICITADO    := CreaCampo( 'IMP_SOLICITADO',    ftFloat,   tsNinguno, tsNinguno, False );
  IMP_APLICADO      := CreaCampo( 'IMP_APLICADO',      ftFloat,   tsNinguno, tsNinguno, False );
  IMP_RECUPERADO    := CreaCampo( 'IMP_RECUPERADO',    ftFloat,   tsNinguno, tsNinguno, False );
  IMP_X_RECUPERAR   := CreaCampo( 'IMP_X_RECUPERAR',   ftFloat,   tsNinguno, tsNinguno, False );
  TIPO_APLICACION   := CreaCampo( 'TIPO_APLICACION',   ftString,  tsNinguno, tsNinguno, False );
  TX_MOTIVO         := CreaCampo( 'TX_MOTIVO',         ftString,  tsNinguno, tsNinguno, False );
  SITUACION         := CreaCampo( 'SITUACION',         ftString,  tsNinguno, tsNinguno, False );
  CVE_TIPO_APLICA   := CreaCampo( 'CVE_TIPO_APLICA',   ftString,  tsNinguno, tsNinguno, False );
  With CVE_TIPO_APLICA do
  begin
    Size     := 2;
    UseCombo := True;
    ComboLista.Add('0');      ComboDatos.Add( coCveAutoriza );
    ComboLista.Add('1');      ComboDatos.Add( coCveDevol    );
  end;
  {$WARNINGS OFF}
  {   Clases de busqueda }
  CatAcreditado := TCrAcredit.Create(Self);      // Clase de acreditado
  CatAcreditado.MasterSource := Self;
  //
  CatCredito := TCrCredito.Create(Self);         // Clase de disposición
  CatCredito.MasterSource := Self;
  {$WARNINGS ON}
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntCrApGaFe.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrApGaFe.Destroy;
begin inherited;
end;


function TCrApGaFe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAplGarFega;
begin
   W:=TWCrAplGarFega.Create(Self);
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


Function TCrApGaFe.InternalBusca:Boolean;
var   T : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrApGF.it','');
  Try
    if Active then begin end;
    if T.Execute then
      InternalBusca := FindKey([]);
    //ends_if
  finally
    T.Free;
  end;
end;

function TCrApGaFe.BuildSQLStr: String;
var vlBusca : String;
    vlsql   : String;
begin
   vlBusca := '';
   if VALOR_FILTRO.AsString <> '' then
   begin
      if TIPO_FILTRO.AsString = coCFAcred        then
         vlBusca := 'AND A.ID_ACREDITADO = '      + VALOR_FILTRO.AsString
      else if TIPO_FILTRO.AsString = coCFDisp    then
         vlBusca := 'AND C.ID_CREDITO = '        + VALOR_FILTRO.AsString
      else if TIPO_FILTRO.AsString = coCFNoCtrl  then
         vlBusca := 'AND C.ID_CONTROL_EXT  = '   + SQLStr( VALOR_FILTRO.AsString )
      else if TIPO_FILTRO.AsString = coCFIdFIRA  then
         vlBusca := 'AND C.ID_CRED_EXTERNO = '   + SQLStr( VALOR_FILTRO.AsString );
      //
   end;
   // Arma la sentencia SQL.
   vlsql := ' SELECT CFG.ID_SOLICITUD,'                                          + coCRLF +
            '        CFG.ID_CREDITO,'                                            + coCRLF +
            '        CFG.NUM_PERIODO,'                                           + coCRLF +
            '        SUM(CFG.IMP_SOLICITAR)  IMP_SOLICITAR,'                     + coCRLF +
            '        SUM(CFG.IMP_APLICADO)   IMP_APLICADO,'                      + coCRLF +
            '        SUM(CFG.IMP_RECUPERADO) IMP_RECUPERADO,'                    + coCRLF +
            '        SUM(CFG.IMP_APLICADO - CFG.IMP_RECUPERADO) IMP_X_RECUPERAR,'+ coCRLF +
            '        CFG.SIT_GAR_SOL_FEG'                                        + coCRLF +
            ' FROM   CR_GA_SOL_FEGA CFG,'                                        + coCRLF +
            '        CR_CREDITO  C,'                                             + coCRLF +
            '        CR_CONTRATO L,'                                             + coCRLF +
            '        CONTRATO    CTTO'                                           + coCRLF +
            ' WHERE  C.ID_CREDITO     = CFG.ID_CREDITO'                          + coCRLF +
            '  '     + vlBusca                                                   + coCRLF +
            '   AND  CFG.SIT_GAR_SOL_FEG NOT IN ( ''CA'' )'                      + coCRLF +
            '   AND  CFG.IMP_APLICADO - CFG.IMP_RECUPERADO > 0 '                 + coCRLF +
            '   AND  L.ID_CONTRATO    = C.ID_CONTRATO'                           + coCRLF +
            '   AND  L.FOL_CONTRATO   = C.FOL_CONTRATO'                          + coCRLF +
            '   AND  CTTO.ID_CONTRATO = L.ID_CONTRATO'                           + coCRLF +
            ' GROUP BY CFG.ID_SOLICITUD, CFG.ID_CREDITO, CFG.NUM_PERIODO,'       + coCRLF +
            '          CFG.SIT_GAR_SOL_FEG';

  Result := vlsql;
end;
// +---------------------------------------------------------------------------+
// +                  Convierte un booleano a una cadena                       +
// +---------------------------------------------------------------------------+
function TCrApGaFe.BoolToStr( peValor : Boolean ) : String;
begin
  if peValor then result := 'V' else result := 'F';
end;
// +---------------------------------------------------------------------------+
// +                  Convierte una cadena a un booleano                       +
// +---------------------------------------------------------------------------+
function TCrApGaFe.StrToBool(peValor: String): Boolean;
begin
  result := ( peValor = 'V' );
end;
// +---------------------------------------------------------------------------+
// +                    Aplica la garantia FEGA                                +
// +---------------------------------------------------------------------------+
procedure TCrApGaFe.stpAplicaGarFEGA( peIdSolicitud     : Integer;
                                      peTipoMetodo      : String;
                                      peTxMotivo        : String;
                                      var psResultado   : Integer;
                                      var psTxResultado : String );
var  STPApicaGF : TStoredProc;
begin
  STPApicaGF := TStoredProc.Create(Nil);
  try
    with STPApicaGF do
    begin
      DatabaseName   := Apli.DatabaseName;
      SessionName    := Apli.SessionName;
      StoredProcName := 'PKGCRCOBRANZA.STPAPLICAGARFEGA';
      // Se crean los parametros del Stored Procedure
      Params.Clear;

      Params.CreateParam( ftFloat,  'PEIDSOLICITUD',   ptInput  );
      Params.CreateParam( ftString, 'PETIPOMETODO',    ptInput  );
      Params.CreateParam( ftString, 'PETXMOTIVO',      ptInput  );
      Params.CreateParam( ftString, 'PECVEUSUARIO',    ptInput  );
      Params.CreateParam( ftString, 'PEBCOMMIT',       ptInput  );
      Params.CreateParam( ftFloat,  'PSRESULTADO',     ptOutput );
      Params.CreateParam( ftString, 'PSTXRESULTADO',   ptOutput );
      //
      ParamByName('PEIDSOLICITUD' ).AsInteger := peIdSolicitud;
      ParamByName('PETIPOMETODO'  ).AsString  := peTipoMetodo;
      ParamByName('PETXMOTIVO'    ).AsString  := peTxMotivo;
      ParamByName('PECVEUSUARIO'  ).AsString  := Apli.Usuario;
      ParamByName('PEBCOMMIT'     ).AsString  := 'V';
      //
      ExecProc;
      psResultado   := ParamByName('psResultado').AsInteger;
      psTxResultado := ParamByName('psTxResultado').AsString;
    end;
  finally
    STPApicaGF.Free;
  end;
end;
(***********************************************FORMA CR_APL_GAR_FEGA********************)
(*                                                                              *)
(*  FORMA DE CR_APL_GAR_FEGA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_APL_GAR_FEGA********************)

// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
function TWCrAplGarFega.ExisteRegActivo : Boolean;
begin
  result := ( fDataFound ) and ( Objeto.ID_CREDITO.AsInteger > 0 );
end;

// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TWCrAplGarFega.LimpiaPantalla;
var vlCol, vlRow : Integer;
begin
  // Barre el grid de datos y quita la información
  for vlRow := 0 to sagDATOS.RowCount - 1 do
  begin
    for vlCol := 0 to sagDATOS.ColCount - 1 do
    begin
      sagDATOS.Cells    [ vlCol, vlRow ] := '';
      sagDATOS.ColorCell[ vlCol, vlRow ] := clWindow;
      //
      if  vlCol > COL_VIS then
        sagDATOS.ColWidths[vlCol]:= 0;
      //ends_if
    end;
    sagDATOS.RowHeights[ vlRow ] := sagDATOS.DefaultRowHeight;
  end;
  sagDATOS.RowCount := 1;
  //
  Application.ProcessMessages;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TWCrAplGarFega.SetTipoFiltro;
  procedure  LimpiaFiltro;                           // Desactiva las clases internas de busqueda
  begin
    Objeto.CatAcreditado.Active := False;
    Objeto.CatCredito.Active    := False;
    fBolSearch       := False;
  end;
begin
  lbFiltro.Caption := '';
  LimpiaFiltro;                           // Desactiva las clases internas de busqueda
  // Libera los controles
  if Objeto.CatAcreditado.ID_ACREDITADO.Control <> nil then
    Objeto.CatAcreditado.ID_ACREDITADO.Control := nil;
  //ends if
  if Objeto.CatCredito.ID_CREDITO.Control <> nil then
    Objeto.CatCredito.ID_CREDITO.Control := nil;
  //ends if
  if Objeto.CatCredito.ID_CONTROL_EXT.Control <> nil then
    Objeto.CatCredito.ID_CONTROL_EXT.Control := nil;
  //ends if
  if Objeto.CatCredito.ID_CRED_EXTERNO.Control <> nil then
    Objeto.CatCredito.ID_CRED_EXTERNO.Control := nil;
  //ends if
  //
  // Liga los controles
  Objeto.TIPO_FILTRO.GetFromControl;      // Obtiene el valor del filtro
  if Objeto.TIPO_FILTRO.AsString = coCFAcred then                               // Filtro por acreditado
  begin
    lbFiltro.Caption := coDescAcred;
    Objeto.CatAcreditado.ID_ACREDITADO.Control  := edValorFiltro;
    Objeto.CatAcreditado.Persona.Nombre.Control := edDESC_FILTRO;
  end else if Objeto.TIPO_FILTRO.AsString = coCFDisp then                       // Filtro por disposicion
  begin
    lbFiltro.Caption := coDescDisp;
    Objeto.CatCredito.ID_CREDITO.Control := edValorFiltro;
    Objeto.CatCredito.ContratoCre.Contrato.TITNombre.Control := edDESC_FILTRO;
  end else if Objeto.TIPO_FILTRO.AsString = coCFNoCtrl then                     // Filtro por No. Control
  begin
    lbFiltro.Caption := coDescNoCtrl;
    Objeto.CatCredito.ID_CONTROL_EXT.Control := edValorFiltro;
    Objeto.CatCredito.ContratoCre.Contrato.TITNombre.Control := edDESC_FILTRO;
  end else if Objeto.TIPO_FILTRO.AsString = coCFIdFIRA then                     // Filtro por ID Fira
  begin
    lbFiltro.Caption := coDescIdFIRA;
    Objeto.CatCredito.ID_CRED_EXTERNO.Control := edValorFiltro;
    Objeto.CatCredito.ContratoCre.Contrato.TITNombre.Control := edDESC_FILTRO;
  end;
  //
  if edValorFiltro.CanFocus then
    edValorFiltro.SetFocus;
  //
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
function TWCrAplGarFega.BeginSearch(BBusca: Boolean;  const Llave: array of TVarRec): Boolean;
begin
  fBolSearch := False;
  if Objeto.TIPO_FILTRO.AsString = coCFAcred then                               // Busqueda sobre acreditado
  begin
    if BBusca then
      fBolSearch := Objeto.CatAcreditado.Busca
    else
      fBolSearch := Objeto.CatAcreditado.FindKey( Llave  );
    // ends_if
  end else if Objeto.TIPO_FILTRO.AsString = coCFDisp then                       // Busqueda sobre disposición
  begin
    if BBusca then
      fBolSearch := Objeto.CatCredito.Busca
    else
      fBolSearch := Objeto.CatCredito.FindKey( Llave );
    // ends_if
  end else if Objeto.TIPO_FILTRO.AsString = coCFNoCtrl then                     // Busqueda por No de Control
  begin
    if BBusca then
      fBolSearch := Objeto.CatCredito.Busca
    else
      fBolSearch := Objeto.CatCredito.FindKeyNear( Llave, [ cID_CONTROL_EXT  ] );
    // ends_if
  end else if Objeto.TIPO_FILTRO.AsString = coCFIdFIRA then                     // Busqueda por un ID-FIRA determinado
  begin
    if BBusca then
      fBolSearch := Objeto.CatCredito.Busca
    else
      fBolSearch := Objeto.CatCredito.FindKeyNear( Llave, [ cID_CRED_EXTERNO ] );
    // ends_if
  end;
  // Obtiene el valor del control
  Objeto.VALOR_FILTRO.GetFromControl;
  //
  Result := fBolSearch;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TWCrAplGarFega.MuestraDatos;
var Qry         : TQuery;
    nRowCount   : Integer;
begin
  fDataFound := False;
  try
    LimpiaPantalla;
    Objeto.VALOR_FILTRO.GetFromControl;
    // ---------  Construye la cadena SQL de busqueda y obtiene un Query ---------
    Qry := GetSQLQueryNoNil( Objeto.BuildSQLStr, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
    nRowCount := 0;
    // ------------------------- Barre el QUERY de datos -------------------------
    if Assigned(Qry) and NOT( Qry.IsEmpty ) THEN
    begin
      fDataFound := True;
      while Not Qry.Eof Do
      begin
        with sagDATOS do
        begin
          // Asigna los formatos de las celdas
          AlignCell[COL_ISOL,nRowCount] := alRight;
          AlignCell[COL_IAPL,nRowCount] := alRight;
          AlignCell[COL_IREC,nRowCount] := alRight;
          AlignCell[COL_IXRE,nRowCount] := alRight;
          AlignCell[COL_TIPA,nRowCount] := alCenter;
          //
          Cells[COL_SEL, nRowCount] := Objeto.BoolToStr( False );
          Cells[COL_CRED,nRowCount] := Qry.FieldByName('ID_CREDITO').AsString;
          Cells[COL_NPER,nRowCount] := Qry.FieldByName('NUM_PERIODO').AsString;
          Cells[COL_IDSO,nRowCount] := Qry.FieldByName('ID_SOLICITUD').AsString;
          Cells[COL_ISOL,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('IMP_SOLICITAR').AsFloat ] );
          Cells[COL_IAPL,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('IMP_APLICADO').AsFloat ] );
          Cells[COL_IREC,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('IMP_RECUPERADO').AsFloat ]);
          Cells[COL_IXRE,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('IMP_X_RECUPERAR').AsFloat ]);
          Cells[COL_SITG,nRowCount] := Qry.FieldByName('SIT_GAR_SOL_FEG').AsString;
        end; //end with
        Qry.Next;
        if not Qry.Eof then
        begin
          nRowCount := sagDATOS.RowCount;
          sagDATOS.RowCount := sagDATOS.RowCount + 1; //Incrementa un reglon
        end;
        Application.ProcessMessages;
      end; //end While
    end;
    if Assigned(Qry) then
    begin
      Qry.Close;
      Qry.Free;
    end;
  except
    on e : exception do
      fDataFound := False;
  end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TWCrAplGarFega.DrawControls;
begin
  Objeto.CVE_TIPO_APLICA.DrawControl;
  Objeto.TX_MOTIVO.DrawControl;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TWCrAplGarFega.GetFromControls;
begin
  Objeto.CVE_TIPO_APLICA.GetFromControl;
  Objeto.TX_MOTIVO.GetFromControl;
  if Objeto.CVE_TIPO_APLICA.AsString      =  coCveAutoriza then
    Objeto.TIPO_APLICACION.AsString := coAutorizacion
  else if Objeto.CVE_TIPO_APLICA.AsString =  coCveDevol then
    Objeto.TIPO_APLICACION.AsString := coDevolucion 
  else
    Objeto.TIPO_APLICACION.AsString := '';
  //ends_if
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TWCrAplGarFega.GetFromGrid(peRowGrid, peColGrid: Integer);
begin
  Objeto.INDICE_GRID.AsInteger     := peRowGrid;
  Objeto.COLUMNA_GRID.AsInteger    := peColGrid;
  Objeto.B_APLICA.AsString         := sagDATOS.Cells[ COL_SEL,  peRowGrid ];
  Objeto.ID_CREDITO.AsString       := sagDATOS.Cells[ COL_CRED, peRowGrid ];
  Objeto.NUM_PERIODO.AsString      := sagDATOS.Cells[ COL_NPER, peRowGrid ];
  Objeto.ID_SOLICITUD.AsString     := sagDATOS.Cells[ COL_IDSO, peRowGrid ];
  Objeto.IMP_SOLICITADO.AsString   := sagDATOS.Cells[ COL_ISOL, peRowGrid ];
  Objeto.IMP_APLICADO.AsString     := sagDATOS.Cells[ COL_IAPL, peRowGrid ];
  Objeto.IMP_RECUPERADO.AsString   := sagDATOS.Cells[ COL_IREC, peRowGrid ];
  Objeto.IMP_X_RECUPERAR.AsString  := sagDATOS.Cells[ COL_IXRE, peRowGrid ];
  Objeto.TIPO_APLICACION.AsString  := sagDATOS.Cells[ COL_TIPA, peRowGrid ];
  Objeto.TX_MOTIVO.AsString        := sagDATOS.Cells[ COL_TXNT, peRowGrid ];
  Objeto.SITUACION.AsString        := sagDATOS.Cells[ COL_SITG, peRowGrid ];
  Objeto.CVE_TIPO_APLICA.AsString  := sagDATOS.Cells[ COL_CTIP, peRowGrid ];
  //
  sagDATOS.HintCell[COL_TXNT, peRowGrid ] := Objeto.TX_MOTIVO.AsString;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TWCrAplGarFega.UpdateToGrid;
begin
  sagDATOS.Cells[ COL_SEL,  Objeto.INDICE_GRID.AsInteger ] := Objeto.B_APLICA.AsString;
  sagDATOS.Cells[ COL_TIPA, Objeto.INDICE_GRID.AsInteger ] := Objeto.TIPO_APLICACION.AsString;
  sagDATOS.Cells[ COL_TXNT, Objeto.INDICE_GRID.AsInteger ] := Objeto.TX_MOTIVO.AsString;
  sagDATOS.Cells[ COL_CTIP, Objeto.INDICE_GRID.AsInteger ] := Objeto.CVE_TIPO_APLICA.AsString;
end;
// +---------------------------------------------------------------------------+
// +    Realiza las modificaciones derivadas de un cambio en algun parametro   +
// +---------------------------------------------------------------------------+
procedure TWCrAplGarFega.ProcesaCambio;
begin
  GetFromControls;  // Salva la información de la pantalla al registro actual
  UpdateToGrid;     // Regresa los valores al GRID.
  GetFromGrid( Objeto.INDICE_GRID.AsInteger, Objeto.COLUMNA_GRID.AsInteger );
  DrawControls;     // Regresa los valores a la pantalla
end;

// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TWCrAplGarFega.FormShow(Sender: TObject);
begin
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
  //
  Objeto.TIPO_FILTRO.Control     := rgTipoFiltro;
  Objeto.VALOR_FILTRO.Control    := edValorFiltro;
  Objeto.CVE_TIPO_APLICA.Control := rgMotivo;
  Objeto.TX_MOTIVO.Control       := edTxMotivo;
  //
  Objeto.TIPO_FILTRO.AsString  := coCFDisp;
  fDataFound  := False;
  LimpiaPantalla;
end;

procedure TWCrAplGarFega.FormDestroy(Sender: TObject);
begin
  {CONTROLES DE FILTROS}
  Objeto.TIPO_FILTRO.Control     := nil;
  Objeto.VALOR_FILTRO.Control    := nil;
  Objeto.CVE_TIPO_APLICA.Control := nil;
  Objeto.TX_MOTIVO.Control       := nil;
end;

procedure TWCrAplGarFega.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TWCrAplGarFega.sagDATOSDrawCell(Sender: TObject; ACol, ARow: Integer;
                                          Rect  : TRect;   State: TGridDrawState);
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
    if (ACol = COL_SEL) then
    begin
      vlCol := ACol;
      Bmp := TBitmap.Create;
      if Assigned(Bmp) then
      begin
        // Determina la imagen a utilizar
        If Objeto.StrToBool( Cells[ vlCol, ARow ] ) then
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

procedure TWCrAplGarFega.sagDATOSMouseDown(Sender: TObject; Button: TMouseButton;
                                           Shift : TShiftState; X, Y: Integer);
var ACol   : Integer;
    ARow   : Integer;
    vlBSel : Boolean;
begin
  if fDataFound then
  begin
    sagDATOS.MouseToCell(X, Y ,ACol, ARow);
    //SELECCIONA LA APLICACION DE GARANTIA FEGA
    If (  ACol = COL_SEL  ) Then //  selecciona la cobranza de los conceptos
    begin
      vlBSel := Objeto.StrToBool( Objeto.B_APLICA.AsString );
      Objeto.B_APLICA.AsString := Objeto.BoolToStr( not vlBSel );
      ProcesaCambio;
      //
      if Objeto.CVE_TIPO_APLICA.AsString = '' then
      begin
        Objeto.CVE_TIPO_APLICA.AsString := coCveAutoriza;
        if rgMotivo.CanFocus then
          rgMotivo.SetFocus;
      end else if Objeto.TX_MOTIVO.AsString = '' then
      begin
        if edTxMotivo.CanFocus then
          edTxMotivo.SetFocus;
      end;
    end;
  end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TWCrAplGarFega.rgTipoFiltroClick(Sender: TObject);
begin
  SetTipoFiltro;
end;
//
procedure TWCrAplGarFega.btnFiltroClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRAPGAFE_ACRED',True,True) then
   begin
      if BeginSearch( True, [] ) then
        MuestraDatos;
      //ends_if
   end;
end;

procedure TWCrAplGarFega.ikValorFiltroEjecuta(Sender: TObject);
begin
  if BeginSearch( False, [ ikValorFiltro.Buffer ] ) then
    MuestraDatos;
  //ends_if
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TWCrAplGarFega.sagDATOSSelectCell(Sender: TObject; ACol,  ARow: Integer; var CanSelect: Boolean);
begin
  if fDataFound then
  begin
    GetFromGrid( ARow, ACol );
    DrawControls;
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TWCrAplGarFega.edTxMotivoExit(Sender: TObject);
begin
  IF ExisteRegActivo THEN
    ProcesaCambio;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TWCrAplGarFega.rgMotivoClick(Sender: TObject);
begin
  if ExisteRegActivo then
  begin
    ProcesaCambio;
  end;
  //
  if rgMotivo.ItemIndex <> 0 then
    rgMotivo.ItemIndex := 0;
end;

procedure TWCrAplGarFega.btnAplicaClick(Sender: TObject);
var vlRow         : Integer;
    vlBProcesa    : Boolean;
    vlBContinua   : Boolean;
    vlResultado   : Integer;
    vlTxResultado : String;
begin
   if Objeto.ValidaAccesoEsp('TCRAPGAFE_PROCE',True,True) then
   begin
      if fDataFound then
      begin
        vlBContinua := True;
        for vlRow   := 0 to sagDATOS.RowCount - 1 do
        begin
          GetFromGrid( vlRow,  0 );
          if Objeto.B_APLICA.AsString = 'V' then
          begin
            vlBProcesa := True;
            if ( trim(Objeto.TX_MOTIVO.AsString) = '' ) or ( trim(Objeto.CVE_TIPO_APLICA.AsString) = '' )  then
            begin
              vlBContinua := ( MessageDlg( coMsgErrTipo, mtConfirmation,  mbYesNoCancel,  0 ) = mrYes );
              vlBProcesa := False;
            end;
            //
            if vlBProcesa then
            begin
              Objeto.stpAplicaGarFEGA( Objeto.ID_SOLICITUD.AsInteger,
                                       Objeto.CVE_TIPO_APLICA.AsString,
                                       Objeto.TX_MOTIVO.AsString,
                                       vlResultado,  vlTxResultado );
              if vlResultado <> 0 then
              vlBContinua := ( MessageDlg( Format(coMsgErrProc, [ coCRLF, vlResultado,
                               coCRLF, vlTxResultado, coCRLF] ), mtConfirmation,
                               mbYesNoCancel,  0 ) = mrYes );
            end;
            //
            if not vlBContinua then
              exit;
            //
          end;
        end;//ends_for
      end;
      MuestraDatos;
   end;
end;

end.
