// Sistema         : Clase de TMAvDoc
// Fecha de Inicio : 01/10/2003
// Función forma   : Clase de TMAvDoc
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
// Modificado      : 23 OCT 2004
unit IntMAvDoc;


interface

uses
Windows,  Messages,  SysUtils,  Classes,  Graphics,  Controls,  Forms,     Dialogs,
IntFrm,   DB,        DbTables,  Mask,     StdCtrls,  Buttons,   ExtCtrls,  InterFor,
IntFind,  UnSQL2,    InterFun,  ComCtrls, IntDtPk,   IntLinkit, InterEdit, Math,
ImgList,  Grids,     Aligrid,   IntGenCre,
Unzip,ZipTypes,NMsmtp, ShellApi,Psock, NMFtp  ,
//Unidades Adicionales
IntCrEmisor,      //Emisor
IntCrProveed,     //Prooveedor
IntCrCredito,     //Disposición
IntMQrAvDoc,      //Reporte
IntMQrAvMailDoc,  //Digitalizacion de Reporte
IntParamCre, Menus
;

const
  C_COL_CESION  = 0;
  C_COL_NUMERO  = 1;
  C_COL_TIPO    = 2;
  C_COL_IMPDEV  = 3;
  C_COL_APLICA  = 4;
  C_ESPACIO     = 6;
  C_NUM_IMPRESO = 6;
  C_CVE_REMAN   = 7;
  C_MAIL        = 8;
  C_PROV        = 9;
  C_EMIS        = 10;
  //

  C_TIT_CESION = 'Cesión';
  C_TIT_NUMERO = 'No.de Documento';
  C_TIT_TIPO   = 'Tipo de Documento';
  C_TIT_REMAN  = 'Remanente';
  C_TIT_INTDEV = 'Int x Devengar';
  C_TIT_INTMOR = 'Int Moratorios';
  C_TIT_SEL    = 'Sel';
  C_TIT_APLICA = 'Aplica';

  C_APLICA   = '1';
  C_NOAPLICA = '0';

  C_NUM_ROW_DEFAULT = 2;
  C_DEF_MONEY_MASK  = '###,###,###,##0.00';
  C_NO_PRINTED  = clWhite;
  {
  C_COL_REMA    = TColor( 255 or  ( 255 shl 8 ) or ( 27  shl 16 ) );
  C_COL_INT     = TColor(  33 or  ( 244 shl 8 ) or ( 249 shl 16 ) );
  C_COL_MORA    = TColor(  45 or  ( 237 shl 8 ) or ( 150 shl 16 ) );
  }

  C_COL_REMA    = TColor( 195 or  ( 230 shl 8 ) or ( 200 shl 16 ) );  // Color del GRID


  coMsgRePrint  = 'El Tipo de Aviso ''%s'' de la relación ''%s'' ' +
                  'para el documento %s de la cesión %s.' + coCRLF +
                  'Ya se imprimió anteriormente, ¿Desea reimprimirlo?';
  coMsgNoDoctos = 'Seleccione los avisos que desea imprimir.';
  coMaxLength   = 'Los documentos de la cesión %s rebasan el limite máximo de documentos.' + coCRLF +
                  'Favor de imprimir por bloques';



Type
  TMAvDoc= class;

  TwMAvDoc=Class(TForm)
    InterForma1             : TInterForma;
    rgRelacion: TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgTipo_Av: TRadioGroup;
    Label1: TLabel;
    edCopias: TEdit;
    updCopias: TUpDown;
    ilCREDITO: TInterLinkit;
    Label2: TLabel;
    edID_CREDITO: TEdit;
    btCREDITO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    ImgListcheko: TImageList;
    edFECHA: TEdit;
    lbLiqF_INICIO: TLabel;
    dtpFECHA: TInterDateTimePicker;
    Label3: TLabel;
    cbID_CREDITO: TCheckBox;
    strGrdDocumentos: TStringAlignGrid;
    ImageList: TImageList;
    chbxApTodos: TCheckBox;
    pupPanelDatos: TPopupMenu;
    NoImpresos1: TMenuItem;
    Label4: TLabel;
    edID_EMISOR: TEdit;
    btEmisor: TBitBtn;
    edNOMBRE_EMISOR: TEdit;
    ilEmisor: TInterLinkit;
    Label5: TLabel;
    edID_PROVEEDOR: TEdit;
    btPROVEEDOR: TBitBtn;
    edID_PROV_NAFINSA: TEdit;
    edNOM_PROVEEDOR: TEdit;
    ilPROVEEDOR: TInterLinkit;
    cbEmisor: TCheckBox;
    cbProveedor: TCheckBox;
    btSendMail: TBitBtn;
    NMFTP1: TNMFTP;
    NMSMTP1: TNMSMTP;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure ilCREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure strGrdDocumentosDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure strGrdDocumentosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure strGrdDocumentosMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure edFECHAExit(Sender: TObject);
    procedure cbID_CREDITOClick(Sender: TObject);
    procedure rgRelacionClick(Sender: TObject);
    procedure dtpFECHAEnter(Sender: TObject);
    procedure strGrdDocumentosTopLeftChanged(Sender: TObject);
    procedure rgTipo_AvClick(Sender: TObject);
    procedure chbxApTodosClick(Sender: TObject);
    procedure NoImpresos1Click(Sender: TObject);
    procedure btEmisorClick(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure ilEmisorEjecuta(Sender: TObject);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure cbEmisorClick(Sender: TObject);
    procedure cbProveedorClick(Sender: TObject);
    procedure btSendMailClick(Sender: TObject);
  private
    procedure ClearData;
    procedure SetColorGrid;
    procedure RefreshData;
    procedure ShowData;
    Procedure SeleccionaReg( peBandera : Boolean );
    function  IsPrinted( peNumRow : Integer ) : Boolean;
    Function  FormaQuery( pCesion    : Integer; pEmisor : Integer;
                          pProveedor : Integer; PFecha  : TDateTime;
                          pTipo   : String;  pRelac: String;
                          pTipoRel: String  ) : TStringList;
    procedure FillDataDocumentos(StrGrd: TStringAlignGrid);
    procedure InvertCheck(StrGrd: TStringGrid; nCol, nRow: Integer);
    Procedure ImprimeReporte(bPreview,bMail:Boolean);
    procedure ObtenTipoRel( var psTipoAviso, psDescTipoAv,  psRelacion,
                                psDescRel,   psRelCveAviso, psCveAviso  : String);
  private
    vgFecha : TDateTime;
  public
    Objeto : TMAvDoc;
  end;
  {}
  TMAvDoc= class(TInterFrame)
  private
  protected
  public
    F_PAGO                   : TInterCampo;
    //
    ParamCre                 : TParamCre;
    Emisor                   : TCrEmisor;
    Proveedor                : TCrProveed;
    Credito                  : TCrCredito;
  public
    function    LimpiaTblAviso: Boolean;
    function    AgregaAviso( peIdCesion     : Integer; peIdDocumento : String;
                             peCveTipoReman : String ): Boolean;
  public
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

var
    cNomArchivoPDF    : String;
    cNomArchivoUNZIP  : String;
    cNomPathTemp      : String;
    cMascaraUnzip     : String;
    Count             : longint;
    BytesExtracted    : longint;
    CompressedSize    : longint;
    UnzippedSize      : longint;

implementation
//Uses RepMon;

Function TmpDir : AnsiString;
var p : array [ 0 .. 259 ] of char;
Begin
  if GetTempPath( sizeof(p), p) > 0
  then Result := StrPas(p)
  else Result := 'c:\temp\';
End;
//
procedure Report ( Retcode : longint; R : pReportRec ); stdcall;
var pct : Byte;
    R1  : Real;
begin
  WITH r^ DO BEGIN
  CASE Status of
    file_starting  :
    begin
      Application.ProcessMessages;
      //Form1.Panel1.Caption := StrPas(FileName);
    end;

    file_completed :
    begin
      Application.ProcessMessages;
      //Form1.Panel1.Caption := '';
    end;

    file_unzipping :
    if Retcode > 0 then
    begin
      Inc ( BytesExtracted, Retcode);
      R1 := ( BytesExtracted / UnzippedSize ) * 100;
      Pct := Round ( R1 );
      Application.ProcessMessages;
      Application.ProcessMessages;
    end;
    unzip_completed :
    begin
      Application.ProcessMessages;
    end;
 END {case}
 END;

end; {report}
//

PROCEDURE Report2 ( Retcode : longint;R : pReportRec ); STDCALL;
Var
s:String;
BEGIN
   WITH r^ DO begin
        if Status <> unzip_completed then begin
           s := strpas ( filename );
           cNomArchivoPDF := s;
        end;
   end;
END; {Report2}


{$R *.DFM}


constructor TMAvDoc.Create( AOwner : TComponent );
begin
  Inherited;
  F_PAGO := CreaCampo( 'F_PAGO', ftDate, tsNinguno, tsNinguno, False );
  F_PAGO.Caption := 'Fecha de Pago';

  {$WARNINGS OFF}
  Emisor    := TCrEmisor.Create(Self);
  Emisor.MasterSource := Self;
  {$WARNINGS ON}

  //

  {$WARNINGS OFF}
  Proveedor := TCrProveed.Create(Self);
  Proveedor.MasterSource := Self;
  {$WARNINGS ON}

  //

  {$WARNINGS OFF}
  Credito := TCrCredito.Create(Self);
  Credito.MasterSource := Self;
  Credito.FieldByName('ID_CREDITO').MasterField := 'ID_CREDITO';
  {$WARNINGS ON}
  UseQuery := False;
  HelpFile := 'InTMAvDoc.Hlp';
  ShowMenuReporte := True;
end;

Destructor TMAvDoc.Destroy;
begin
   if Emisor <> nil then
     Emisor.Free;
   //ends_if
   if Proveedor <> nil then
     Proveedor.Free;
   //ends_if
   if Credito <> nil then
      Credito.Free;
   //ends_if
   inherited;
end;


function TMAvDoc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W :  TwMAvDoc;
begin
   W  := TwMAvDoc.Create(Self);
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


Function TMAvDoc.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TMAvDoc.Reporte:Boolean;
begin //Execute_Reporte();
  Result := False;
end;


function TMAvDoc.LimpiaTblAviso: Boolean;
var  STPLimpTblAv  : TStoredProc;
Begin
  Result := True;
  STPLimpTblAv := TStoredProc.Create(Nil);
  try
    with STPLimpTblAv do
    begin
      DatabaseName   := Apli.DatabaseName;
      SessionName    := Apli.SessionName;
      StoredProcName :='PKGCRAVISOS.STPLIMPIATBLAV';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam(ftFloat,  'psResultado',   ptOutput );
      Params.CreateParam(ftString, 'psTxResultado', ptOutput );
      //
      ExecProc;
      if (ParamByName('PSResultado').AsInteger <> 0) then
      begin
        ShowMessage('Problemas al limpiar tabla de avisos: '            + coCRLF +
                    'Código : ' + ParamByName('psResultado').AsString   + coCRLF +
                    'Mensaje: ' + ParamByName('psTxResultado').AsString );
        Result := False;
      end;
    end;
  finally
    STPLimpTblAv.Free;
  end;
end;

function  TMAvDoc.AgregaAviso( peIdCesion     : Integer; peIdDocumento : String;
                               peCveTipoReman : String ): Boolean;
var  STPAddElemento : TStoredProc;
begin
  Result := True;
  STPAddElemento := TStoredProc.Create(nil);
  try
      with STPAddElemento do
      begin
        DatabaseName   := Apli.DatabaseName;
        SessionName    := Apli.SessionName;
        StoredProcName := 'PKGCRAVISOS.STPAGREGAAVISO';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftInteger, 'peIdCesion',      ptInput );
        Params.CreateParam(ftString,  'peIdDocumento',   ptInput );
        Params.CreateParam(ftString,  'peCveTipoReman',  ptInput );
        Params.CreateParam(ftInteger, 'psResultado',     ptInput );
        Params.CreateParam(ftString,  'psTxResultado',   ptInput );
        //
        ParamByName('peIdCesion'     ).AsInteger := peIdCesion;
        ParamByName('peIdDocumento'  ).AsString  := peIdDocumento;
        ParamByName('peCveTipoReman' ).AsString  := peCveTipoReman;
        //
        ExecProc;
        if ( ParamByName('psResultado').AsInteger <> 0 ) then
        begin
          ShowMessage('Problemas al agregar datos : '                      + coCRLF +
                      'Código : ' + ParamByName('psRESULTADO').AsString    + coCRLF +
                      'Mensaje: ' + ParamByName('psTxResultado').AsString );
          Result := False;
        end;
      end;
  finally
    STPAddElemento.Free;
  end;
end;



(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
Procedure TwMAvDoc.SeleccionaReg( peBandera : Boolean );
var vlRow     : Integer;
    vlNumImpr : Integer;
begin
  for vlRow := 1 to strGrdDocumentos.RowCount - 1 do
  begin
    if strGrdDocumentos.Cells[ C_COL_CESION, vlRow ] <> '' then
    begin
        //
        vlNumImpr := StrToIntDef( strGrdDocumentos.Cells[C_NUM_IMPRESO,vlRow], 0 );
        strGrdDocumentos.Cells[C_COL_APLICA,vlRow] := C_NOAPLICA;
        //
        if peBandera then
        begin
          if ( vlNumImpr = 0 ) then
            strGrdDocumentos.Cells[C_COL_APLICA,vlRow] := C_APLICA;
        end else begin
            if ( chbxApTodos.Checked ) then
              strGrdDocumentos.Cells[C_COL_APLICA,vlRow] := C_APLICA
        end;//ends_if
        //
    end;
  end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.SetColorGrid;
var vlRow : Integer;
begin
  for vlRow := 1 to strGrdDocumentos.RowCount - 1 do
  begin
    strGrdDocumentos.ColorCell[ C_COL_IMPDEV, vlRow ]  := C_NO_PRINTED;
    if  StrToIntDef(  strGrdDocumentos.Cells[ C_NUM_IMPRESO, vlRow ], 0 ) > 0 then
        strGrdDocumentos.ColorCell[ C_COL_IMPDEV, vlRow ] := C_COL_REMA;
  end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
Function  TwMAvDoc.FormaQuery( pCesion    : Integer; pEmisor : Integer;
                               pProveedor : Integer; PFecha  : TDateTime;
                               pTipo   : String;  pRelac: String;
                               pTipoRel: String  ) : TStringList;

begin
  Result := TStringList.Create;

  Result.Clear;

  if ( pTipo = coCveReman ) or ( pTipo = coCveIntXDev ) then
  begin
    Result.Add('SELECT INFO.ID_CESION,'                                           );
    Result.Add('       INFO.ID_DOCUMENTO,'                                        );
    Result.Add('       INFO.DESC_L_PRODUCTO,'                                     );
    Result.Add('       INFO.IMP_DEV_REMAN,'                                       );
    Result.Add('       NVL( CTRL.NUM_IMPRESION, 0 ) NUM_IMPRESION,'                );
    Result.Add('       INFO.E_MAIL,'      );
    Result.Add('       INFO.NOM_PROV,'      );
    Result.Add('       INFO.NOM_EMIS'      );
    Result.Add('FROM  ('                                );
    Result.Add('        SELECT CD.ID_CESION,'           );
    Result.Add('               CD.ID_DOCUMENTO,'        );
    Result.Add('               CPR.DESC_L_PRODUCTO,'    );
    Result.Add('               NVL( CRM.IMP_DEV_REMAN, 0 ) IMP_DEV_REMAN,' );
    Result.Add('               CRM.CVE_TIPO_REMAN,'      );
    Result.Add('               PROV.E_MAIL,'      );
    Result.Add('               PROV.NOMBRE AS NOM_PROV,'      );
    Result.Add('               EMI.NOMBRE AS NOM_EMIS'      );
    Result.Add('        FROM   CR_DOCUMENTO   CD,'      );
    Result.Add('               CR_CESION      CCE,'     );
    Result.Add('               CR_CREDITO     CC,'      );
    Result.Add('               CR_CONTRATO    CCTO,'    );
    Result.Add('               CR_PRODUCTO    CPR,'     );
    Result.Add('               CR_REMANENTE   CRM, '     );
    Result.Add('               PERSONA        PROV,'     );
    Result.Add('               PERSONA        EMI'     );
    Result.Add('        WHERE CRM.CVE_TIPO_REMAN = ' + SQLStr  ( pTipo )  );  // VARIABLE tipo de remanente
    Result.Add('          AND CRM.F_PAGO         = ' + SQLFecha( PFecha ) );  // VARIABLE fecha
    Result.Add('          AND CCE.SIT_CESION     <> ''CA'' '   );
    Result.Add('          AND CD.SIT_DOCUMENTO   <> ''CA'' '   );
    if pCesion > 0 then
      Result.Add('          AND CCE.ID_CESION       =  ' + IntToStr( pCesion ) );
    //ends_if
    if pEmisor > 0 then
      Result.Add('          AND CCE.ID_EMISOR       =  ' + IntToStr( pEmisor ) );
    //ends_if
    if pProveedor > 0 then
      Result.Add('          AND CCE.ID_PROVEEDOR    =  ' + IntToStr( pProveedor ) );
    //ends_if
    Result.Add('          AND CCE.ID_CESION      = CD.ID_CESION'     );
    Result.Add('          AND CC.ID_CREDITO      = CCE.ID_CESION'    );
    Result.Add('          AND CRM.ID_CESION      = CD.ID_CESION'     );
    Result.Add('          AND CRM.ID_DOCUMENTO   = CD.ID_DOCUMENTO'  );
    Result.Add('          AND CCTO.ID_CONTRATO   = CC.ID_CONTRATO'   );
    Result.Add('          AND CCTO.FOL_CONTRATO  = CC.FOL_CONTRATO'  );
    Result.Add('          AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE' );
    Result.Add('          AND CCE.ID_PROVEEDOR   = PROV.ID_PERSONA' );
    Result.Add('          AND CCE.ID_EMISOR      = EMI.ID_PERSONA' );
    Result.Add('       )INFO,'                  );
    Result.Add('       CR_CTRL_AVISO CTRL'      );
    Result.Add('WHERE  INFO.IMP_DEV_REMAN > 0'  );
    Result.Add('  AND  CTRL.ID_CREDITO   (+) = INFO.ID_CESION'        );
    Result.Add('  AND  CTRL.ID_DOCUMENTO (+) = INFO.ID_DOCUMENTO'     );
    Result.Add('  AND  CTRL.CVE_AVISO    (+) = ' + SQLStr( pTipoRel ) );           // VARIABLE
    Result.Add('ORDER BY INFO.ID_CESION, INFO.ID_DOCUMENTO' );
  end else if pTipo = coCveMoras then
  begin
    Result.Add('SELECT INFO.ID_CESION, '         );
    Result.Add('       INFO.ID_DOCUMENTO, '      );
    Result.Add('       INFO.DESC_L_PRODUCTO, '   );
    Result.Add('       INFO.IMP_DEV_REMAN, '     );
    Result.Add('       NVL( CTRL.NUM_IMPRESION, 0 ) NUM_IMPRESION, ' );
    Result.Add('       INFO.E_MAIL,'      );
    Result.Add('       INFO.NOM_PROV,'      );
    Result.Add('       INFO.NOM_EMIS'      );
    Result.Add('FROM   (SELECT CD.ID_CESION, '                      );
    Result.Add('               CD.ID_DOCUMENTO, '                   );
    Result.Add('               CPR.DESC_L_PRODUCTO, '               );
    //Result.Add('               (CCA.IMP_MORATORIO + CCA.IMP_IVA_MORA) IMP_DEV_REMAN ' ); // LOLS 23 10 2004
    Result.Add('               (CCA.IMP_PAGADO_MORA ) IMP_DEV_REMAN, ' );
    Result.Add('               PROV.E_MAIL,'      );
    Result.Add('               PROV.NOMBRE AS NOM_PROV,'      );
    Result.Add('               EMI.NOMBRE AS NOM_EMIS'      );
    Result.Add('        FROM   CR_DOCUMENTO   CD, '      );
    Result.Add('               CR_CESION      CCE, '     );
    Result.Add('               CR_CREDITO     CC, '      );
    Result.Add('               CR_CONTRATO    CCTO, '    );
    Result.Add('               CR_PRODUCTO    CPR, '     );
    Result.Add('               CR_CAPITAL     CCA, '     );
    Result.Add('               CR_TRANSACCION CTR, '     );
    Result.Add('               CR_REL_CON_AFEC CRCA, '   );
    Result.Add('               CR_DET_TRANSAC  CDT, '    );
    Result.Add('               (SELECT CVE_OPE_PAG_CP '  );
    Result.Add('                FROM   CR_PARAMETRO '    );
    Result.Add('                WHERE  CVE_PARAMETRO = ''CRE'' ' );
    Result.Add('               )PARAM, '  );
    Result.Add('               PERSONA        PROV,'     );
    Result.Add('               PERSONA        EMI'     );
    Result.Add('        WHERE CTR.F_OPERACION = ' + SQLFecha( PFecha ) );  // VARIABLE fecha
    Result.Add('          AND CCE.SIT_CESION     <> ''CA'' '   );
    Result.Add('          AND CD.SIT_DOCUMENTO   <> ''CA'' '   );
    if pCesion > 0 then
      Result.Add('          AND CCE.ID_CESION       =  ' + IntToStr( pCesion ) );
    //ends_if
    if pEmisor > 0 then
      Result.Add('          AND CCE.ID_EMISOR       =  ' + IntToStr( pEmisor ) );
    //ends_if
    if pProveedor > 0 then
      Result.Add('          AND CCE.ID_PROVEEDOR    =  ' + IntToStr( pProveedor ) );
    //ends_if
    Result.Add('          AND CTR.SIT_TRANSACCION = ''AC'' '  );
    Result.Add('          AND CTR.ID_TRANS_CANCELA IS NULL '  );
    Result.Add('          AND CCA.SIT_CAPITAL = ''LQ'' '      );
    Result.Add('          AND  CRCA.CVE_AFECTACION = ''CAMORP''' );
    Result.Add('          AND  CTR.ID_TRANSACCION  = CDT.ID_TRANSACCION'    );
    Result.Add('          AND  CTR.CVE_OPERACION   = CDT.CVE_OPERACION'     );
    Result.Add('          AND  CDT.CVE_OPERACION   = CRCA.CVE_OPERACION'    );
    Result.Add('          AND  CDT.CVE_CONCEPTO    = CRCA.CVE_CONCEPTO'     );
    Result.Add('          AND  CTR.CVE_TIPO_MOVTO  = CRCA.CVE_TIPO_MOVTO'   );
    Result.Add('          AND CTR.CVE_OPERACION  =  PARAM.CVE_OPE_PAG_CP '  );
    Result.Add('          AND CD.ID_CESION       =  CTR.ID_CESION '         );
    Result.Add('          AND CD.ID_DOCUMENTO    =  CTR.ID_DOCUMENTO '      );
    Result.Add('          AND CCE.ID_CESION      =  CTR.ID_CESION '         );
    Result.Add('          AND CC.ID_CREDITO      =  CTR.ID_CREDITO '        );
    Result.Add('          AND CCE.ID_CESION      = CD.ID_CESION '           );
    Result.Add('          AND CC.ID_CREDITO      = CCE.ID_CESION '          );
    Result.Add('          AND CCA.ID_CREDITO     = CD.ID_CESION '           );
    Result.Add('          AND CCA.NUM_PERIODO    = CD.NUM_PERIODO_DOC '     );
    Result.Add('          AND CCTO.ID_CONTRATO   = CC.ID_CONTRATO '         );
    Result.Add('          AND CCTO.FOL_CONTRATO  = CC.FOL_CONTRATO '        );
    Result.Add('          AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE ');
    Result.Add('          AND CCE.ID_PROVEEDOR   = PROV.ID_PERSONA' );
    Result.Add('          AND CCE.ID_EMISOR      = EMI.ID_PERSONA' );
    Result.Add('       )INFO, ' );
    Result.Add('       CR_CTRL_AVISO CTRL '       );
    Result.Add('WHERE  INFO.IMP_DEV_REMAN > 0 '   );
    Result.Add('  AND  CTRL.CVE_AVISO     (+) = ' + SQLStr( pTipoRel ) );           // VARIABLE
    Result.Add('  AND  CTRL.ID_CREDITO    (+) = INFO.ID_CESION '      );
    Result.Add('  AND  CTRL.ID_DOCUMENTO  (+) = INFO.ID_DOCUMENTO '   );
    Result.Add('ORDER BY INFO.ID_CESION, INFO.ID_DOCUMENTO' );
  end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.FillDataDocumentos( StrGrd: TStringAlignGrid );
var Qry         : TQuery;
    nRow        : Integer;
    vlTipoAviso : String;
    vlDescTipoAv: String;
    vlRelacion  : String;
    vlDescRel   : String;
    vlTipoRel   : String;
    vlCveAviso  : String;
begin
  ClearData;   // Limpia el grid de datos
  Application.ProcessMessages;
  StrGrd.Cells[C_COL_CESION, 0 ] := C_TIT_CESION;
  StrGrd.Cells[C_COL_NUMERO, 0 ] := C_TIT_NUMERO;
  StrGrd.Cells[C_COL_TIPO  , 0 ] := C_TIT_TIPO;
  StrGrd.Cells[C_COL_IMPDEV, 0 ] := C_TIT_REMAN;
  StrGrd.Cells[C_COL_APLICA, 0 ] := C_TIT_SEL;
  StrGrd.ColWidths[C_ESPACIO]    := 20;

  Objeto.F_PAGO.GetFromControl;

  ObtenTipoRel( vlTipoAviso, vlDescTipoAv, vlRelacion, vlDescRel, vlTipoRel,  vlCveAviso );
  // Coloca el caption en el GRID.
  if vlTipoAviso = coCveReman then
    StrGrd.Cells[C_COL_IMPDEV,0] := C_TIT_REMAN
  else if vlTipoAviso = coCveIntXDev then
    StrGrd.Cells[C_COL_IMPDEV,0] := C_TIT_INTDEV
  else if vlTipoAviso = coCveMoras then
    StrGrd.Cells[C_COL_IMPDEV,0] := C_TIT_INTMOR;
  //ends_if


  Qry := TQuery.Create(Self);
  if Assigned(Qry) then
    with Qry do
      try
         DataBaseName := Objeto.DataBaseName;
         SessionName := Objeto.SessionName;
         SQL.Clear;
         SQL.Assign( FormaQuery( Objeto.Credito.ID_CREDITO.AsInteger,
                                 Objeto.Emisor.ID_ACREDITADO.AsInteger,
                                 Objeto.Proveedor.ID_ACREDITADO.AsInteger,
                                 Objeto.F_PAGO.AsDateTime,
                                 vlTipoAviso,   vlRelacion, vlTipoRel ) );
         Open;
         nRow := 1;
         TIntegerField( FieldByName( 'IMP_DEV_REMAN' ) ).DisplayFormat := C_DEF_MONEY_MASK;
         while Not Eof Do Begin
           StrGrd.AlignCell[ C_COL_CESION, nRow ] := alRight;
           StrGrd.AlignCell[ C_COL_NUMERO, nRow ] := alRight;
           StrGrd.AlignCell[ C_COL_IMPDEV, nRow ] := alRight;
           StrGrd.AlignCell[ C_COL_APLICA, nRow ] := alCenter;

           StrGrd.Cells[C_COL_CESION,  nRow] := FieldByName('ID_CESION').AsString;
           StrGrd.Cells[C_COL_NUMERO,  nRow] := FieldByName('ID_DOCUMENTO').AsString;
           StrGrd.Cells[C_COL_TIPO  ,  nRow] := FieldByName('DESC_L_PRODUCTO').AsString;
           StrGrd.Cells[C_COL_IMPDEV,  nRow] := FormatCurr( C_DEF_MONEY_MASK, FieldByName('IMP_DEV_REMAN').AsCurrency );
           StrGrd.Cells[C_COL_APLICA,  nRow] := C_NOAPLICA;
           StrGrd.Cells[C_ESPACIO,     nRow] := '';
           StrGrd.Cells[C_NUM_IMPRESO, nRow] := FieldByName('NUM_IMPRESION').AsString;
           StrGrd.Cells[C_CVE_REMAN,   nRow] := vlTipoAviso;
           StrGrd.Cells[C_MAIL,   nRow] := FieldByName('E_MAIL').AsString;
           StrGrd.Cells[C_PROV,   nRow] := FieldByName('NOM_PROV').AsString;
           StrGrd.Cells[C_EMIS,   nRow] := FieldByName('NOM_EMIS').AsString;

           Inc(nRow);
           StrGrd.RowCount := StrGrd.RowCount + 1;
           Next;
           Application.ProcessMessages;
         end;
         //
         if ( nRow >= C_NUM_ROW_DEFAULT ) then
           StrGrd.RowCount := nRow;
         //ends_if
         SetColorGrid;
         SeleccionaReg( False );
      finally
        Close;
        Free;
      end;//ends_try..finally
    //ends_with
  //ends_if
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.ClearData;
begin
  ClearGrid(strGrdDocumentos);
  strGrdDocumentos.RowCount := C_NUM_ROW_DEFAULT;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+

procedure TwMAvDoc.ObtenTipoRel( var psTipoAviso, psDescTipoAv,  psRelacion,
                                     psDescRel,   psRelCveAviso, psCveAviso  : String);
begin
  psTipoAviso  := '';      psDescTipoAv := '';      psRelacion   := '';
  psDescRel    := '';      psRelCveAviso:= '';      psCveAviso   := '';
  //
  case rgTipo_Av.ItemIndex of
    0 :  begin                        // Remanente(Abono)
           psTipoAviso  := coCveReman;
           psCveAviso   := coREMAB;
           psDescTipoAv := 'Remanente';
         end;
    1 :  begin                        // Intereses por devengar(abono)
           psTipoAviso  := coCveIntXDev;
           psCveAviso   := coDEVAB;
           psDescTipoAv := 'Intereses por devengar';
         end;
    2 :  begin                        // Interés moratorio(Cargo)
           psTipoAviso  := coCveMoras;
           psCveAviso   := coMORCA;
           psDescTipoAv := 'Intereses moratorios';
         end;
  end;
  //
  case rgRelacion.ItemIndex of
    0 : begin                                   // Emisor - Proveedor
          psRelacion := coEP;
          psDescRel  := 'Emisor-Proveedor';
        end;//Emisor-Proveedor
    1 : begin                                   // Emisor - Emisor
          psRelacion := coEE;
          psDescRel  := 'Emisor-Emisor';
        end;
  end;
  psRelCveAviso := psRelacion + psCveAviso;
end;

// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
function TwMAvDoc.IsPrinted( peNumRow : Integer ) : Boolean;
begin
  Result:= ( StrToIntDef( strGrdDocumentos.Cells[  C_NUM_IMPRESO, peNumRow ], 0 ) > 0 );
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.RefreshData;
begin
    FillDataDocumentos(strGrdDocumentos);
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.ShowData;
begin
    With Objeto Do Begin
        RefreshData;
    End;
end;

// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
Procedure TwMAvDoc.ImprimeReporte(bPreview, bMail:Boolean);
var vlCurRow    : Integer;
    //
    vlTipoAv    : String;
    vlDescAv    : String;
    vlRelacion  : String;
    vlDescRel   : String;
    vlRelCveAv  : String;
    vlCveAviso  : String;
    vlIdCesion  : String;
    vlIdDocto   : String;
    vlCveReman  : String;
    vlBImprime  : Boolean;
    vlConfirm   : Word;
    vlCnt       : Word;
    vlIndice    : Integer;
    vlLength    : Integer;
    vlLista     : TStringList;
    grOpcion : TGenRepOption;

    Qry : TQuery;
    sLocalFile : String;
    sAcrobatFile : String;
    sRemoteFile  : String;
    s, d, ss : ShortString;
    Count2,nCount   : Integer;
    vlmail,vlNomProv,vlNomEmi   : string;
    sFileName,vlSql, Directorio : String;
    vlFromName, vlAviso, vlMsg : String;

  function AbreConexion( pCURPATH: String): Boolean;
  begin
    Result := False;
    // Si no esta conectado abre la conexion
    if not NMFTP1.Connected then
    begin
      NMFTP1.Connect;
      NMFTP1.Mode(MODE_IMAGE);
      Result := True;
    end else begin
      NMFTP1.DoCommand('PWD');
      Result := True;
    end;
    //
    //
    if NMFTP1.Connected then
    Begin
      NMFTP1.ChangeDir( pCURPATH);
    End;
    //
  end;

  function ObtSmtpHost: String;
  const
   coSMTPIP        = 'SELECT TX_QUERY_DATA FROM EMAIL_MSG WHERE CVE_MSG = ''ENV_MSG'' AND B_BLOQUEADO = ''V'' ';
  begin
    result := '';
    GetSQLStr( coSMTPIP, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'TX_QUERY_DATA', Result, False );
    if result = '' then
      result := '132.1.6.62';
    //ends_if
  end;

Begin
  if not Objeto.LimpiaTblAviso then
    exit;
  //ends_if
  ObtenTipoRel( vlTipoAv, vlDescAv, vlRelacion, vlDescRel, vlRelCveAv, vlCveAviso );

  if vlTipoAv = coCveReman then
  Begin
    vlFromName := 'Aviso Remanentes ( Abono )';
    vlAviso := 'ABONO';
  end
  else if vlTipoAv = coCveIntXDev then
  Begin
    vlFromName := 'Aviso Devolución Interés ( Abono )';
    vlAviso := 'ABONO';
  end
  else if vlTipoAv = coCveMoras then
  Begin
    vlFromName := 'Aviso Moratorios ( Cargo )';
    vlAviso := 'CARGO';
  end;


  //
  vlCnt   := 0;
  nCount := 1;
  vlLista := TStringList.Create;
  vlLista.Clear;
  try
      with strGrdDocumentos do
      begin
        for vlCurRow := 0  to RowCount - 1 do
        begin
          if ( Cells[ C_COL_APLICA, vlCurRow ] = C_APLICA  ) then
          begin
            vlBImprime := False;
            vlIdCesion := Cells[ C_COL_CESION, vlCurRow ];
            vlIdDocto  := Cells[ C_COL_NUMERO, vlCurRow ];
            vlCveReman := Cells[ C_CVE_REMAN,  vlCurRow ];
            vlMail     := Cells[ C_MAIL,       vlCurRow ];
            vlNomProv  := Cells[ C_PROV,       vlCurRow ];
            vlNomEmi   := Cells[ C_EMIS,       vlCurRow ];
            //
            if NOT bMail then Begin
                if IsPrinted( vlCurRow ) then
                begin
                  vlConfirm :=  MessageDlg( Format( coMsgRePrint, [ vlDescAv, vlDescRel,
                                            vlIdDocto, vlIdCesion  ] ), mtConfirmation,
                                           [ mbYes, mbNo, mbCancel ], 0 );
                  case vlConfirm of
                    mrYes    : vlBImprime := True;
                    mrNo     : vlBImprime := False;
                    mrCancel : Exit;
                  end;
                end else
                  vlBImprime := True;
                //ends_if_IsPrinted
            END
            ELSE vlBImprime := True;

            if vlBImprime  then
            begin
              vlLength := StrToIntDef(vlLista.Values[vlIdCesion], 0 );
              vlLength := vlLength + ( length(vlIdDocto) + length(coSeparador) );
              vlLista.Values[vlIdCesion] := IntToStr(vlLength);
              vlLista.Sort;
              Objeto.AgregaAviso( StrToIntDef(vlIdCesion, 0 ), vlIdDocto, vlCveReman );
              inc(vlCnt);
            end;//ends_if_vlBImprime_then

            if bMail then Begin
                //
//                if vlMail <> '' then Begin
                   sFileName := 'CESION_' + vlIdCesion +'_'+ FormatDateTime('dd_mm_yyyy', StrToDateTime(edFECHA.Text) );

                   RepAvMailxDoc( vlIdCesion , vlCveAviso, vlTipoAv, vlRelacion,vlRelCveAv, edFECHA.Text,
                               Objeto.Apli, False, grDigitaliza, sFileName, vlMail);
//                end;
//                else ShowMessage( 'No existe Correo electrónico para el proveedor de la cesión ' + vlIdCesion);
            end;
          end;//ends_if_(_Cells[_C_COL_APLICA,_i_]_=_C_APLICA_)_then
        end;//ends_for_i_:=_0_to_RowCount_-_1_do
      end;//ends_with_strGrdDocumentos_do
      //
      if vlCnt <= 0 then
      begin
        ShowMessage( coMsgNoDoctos );
        exit;
      end;
      //
      for vlIndice := 0 to vlLista.count - 1 do
      begin
        vlLength := StrToIntDef( vlLista.Values[ vlLista.Names[vlIndice] ], 0 );
        if vlLength > coLengthMax then
        begin
          ShowMessage( Format( coMaxLength, [ vlLista.Names[vlIndice] ] ) );
          Exit;
        end;
      end;
      //
      if not bMail then
      begin
         RepAvisosxDoc( vlCveAviso, vlRelacion, edFECHA.Text,
                     StrToInt(edCopias.Text),  Objeto.Apli,bPreview);
      end{
      else Begin
         RepAvMailxDoc( vlIdCesion , vlCveAviso, vlRelacion, edFECHA.Text,
                       Objeto.Apli,bPreview,
                       grOpcion, '');
      end;
      }
  finally
    vlLista.Free;
  end;
End;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.FormShow(Sender: TObject);
begin
  //PINTA DATOS DEL PANEL INFERIOR
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
  {}
  Objeto.F_PAGO.Control    := edFECHA;
  Objeto.F_PAGO.AsDateTime := Objeto.Apli.DameFechaEmpresa;
  dtpFECHA.DateTime        := Objeto.F_PAGO.AsDateTime;
  {}
  Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
  Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edNOM_ACREDITADO;
  Objeto.Credito.GetParams(Objeto);


  Objeto.Emisor.ID_ACREDITADO.Control             := edID_EMISOR;
  Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOMBRE_EMISOR;
  Objeto.Emisor.GetParams(Objeto);

  Objeto.Proveedor.ID_ACREDITADO.Control   := edID_PROVEEDOR;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//  Objeto.Proveedor.ID_PROV_NAFINSA.Control := edID_PROV_NAFINSA;
  Objeto.Proveedor.ID_PROV_EXTERNO.Control := edID_PROV_NAFINSA;
{/ROIM}
  Objeto.Proveedor.Persona.Nombre.Control  := edNOM_PROVEEDOR;
  Objeto.Proveedor.GetParams(Objeto);

  edNOM_ACREDITADO.Hint     := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
  edNOM_ACREDITADO.ShowHint := True;
  vgFecha := Objeto.F_PAGO.AsDateTime;
  ShowData;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.FormDestroy(Sender: TObject);
begin
  Objeto.F_PAGO.Control := nil;
  Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
  Objeto.Credito.ID_CREDITO.Control := nil;

  Objeto.Emisor.ID_ACREDITADO.Control             := nil;
  Objeto.Emisor.Acreditado.Persona.Nombre.Control := nil;

  Objeto.Proveedor.ID_ACREDITADO.Control   := nil;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//  Objeto.Proveedor.ID_PROV_NAFINSA.Control :=  nil;
  Objeto.Proveedor.ID_PROV_EXTERNO.Control :=  nil;
{/ROIM}
  Objeto.Proveedor.Persona.Nombre.Control  := nil;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.strGrdDocumentosDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Bmp   : TBitmap;
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
    if (ACol = C_COL_APLICA) And ( ARow > 0 ) then
    begin
      Bmp := TBitmap.Create;
      if Assigned(Bmp) then
      begin
        // Determina la imagen a utilizar
        If (Cells[C_COL_APLICA,ARow] = C_APLICA) Then
          ImageList.GetBitmap(1,Bmp)
        Else
          ImageList.GetBitmap(0,Bmp);
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
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.strGrdDocumentosTopLeftChanged(Sender: TObject);
begin
  strGrdDocumentos.LeftCol := 0;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.strGrdDocumentosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    Case Key Of
        32 : InvertCheck((Sender As TStringGrid),0,(Sender As TStringGrid).Row);
    End;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.InvertCheck(StrGrd: TStringGrid; nCol, nRow: Integer);
var
    strBool : String;
begin
    With StrGrd Do Begin
        If (Cells[nCol,nRow] = C_APLICA) Then
            strBool := C_NOAPLICA
        Else
            strBool := C_APLICA;
        Cells[nCol,nRow] := strBool;
    End;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.strGrdDocumentosMouseDown(Sender: TObject; Button: TMouseButton;
                                             Shift: TShiftState; X, Y: Integer);
var nCol, nRow : LongInt;
begin
    With (Sender As TStringGrid) Do Begin
        MouseToCell(X,Y,nCol, nRow);
        If (nCol = C_COL_APLICA) And (nRow > 0) Then
            InvertCheck((Sender As TStringGrid), C_COL_APLICA, nRow);
    End;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.btEmisorClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMAVDOC_ACRED',True,True) then
   begin
      Objeto.Emisor.ShowAll := True;
      if Objeto.Emisor.Busca then
      begin
        cbEmisor.Checked := True;
        ShowData;
      end;
   end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.ilEmisorEjecuta(Sender: TObject);
begin
  if Objeto.Emisor.FindKeyNear([ilEMISOR.Buffer],['ID_ACREDITADO']) then
  begin
    cbEmisor.Checked := True;
    ShowData;
  end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.cbEmisorClick(Sender: TObject);
begin
  if not(cbEmisor.Checked) then
  begin
    if Objeto.Emisor.Active then
    begin
      Objeto.Emisor.Active := False;
      ShowData;
    end;
  end;
  //
  if not(Objeto.Emisor.Active) then
     cbEmisor.Checked := False;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.btPROVEEDORClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMAVDOC_PROVEE',True,True) then
   begin
      Objeto.Proveedor.ShowAll := True;
      if Objeto.Proveedor.Busca then
      begin
        cbProveedor.Checked := True;
        ShowData;
      end;
   end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.ilPROVEEDOREjecuta(Sender: TObject);
begin
  if Objeto.Proveedor.FindKey([ilPROVEEDOR.Buffer]) then
  begin
    cbProveedor.Checked := True;
    ShowData;
  end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.cbProveedorClick(Sender: TObject);
begin
  if not(cbProveedor.Checked) then
  begin
    if Objeto.Proveedor.Active then
    begin
      Objeto.Proveedor.Active := False;
      ShowData;
    end;
  end;
  //
  if not(Objeto.Proveedor.Active) then
     cbProveedor.Checked := False;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.btCREDITOClick(Sender: TObject);
var
    bEncontrado : Boolean;
begin
   if Objeto.ValidaAccesoEsp('TMAVDOC_DISPO',True,True) then
   begin
      With Objeto Do Begin
          Objeto.Credito.ShowAll := True;
          bEncontrado := Objeto.Credito.Busca;
          If bEncontrado Then
          Begin
              cbID_CREDITO.Checked := True;
              InterForma1.NextTab(edID_CREDITO);
              ShowData;
          end;
          //End Else ClearData;
      End;
   end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.edID_CREDITOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CREDITO,True,'',True);
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.ilCREDITOCapture(Sender: TObject; var Show: Boolean);
begin
 Show := True;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.ilCREDITOEjecuta(Sender: TObject);
begin
    if Objeto.Credito.FindKey([ilCREDITO.Buffer]) then
    begin
        cbID_CREDITO.Checked := True;
        InterForma1.NextTab(edID_CREDITO);
        ShowData;
    end;
    //End Else ClearData;
end;

// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.dtpFECHAEnter(Sender: TObject);
begin
  Objeto.F_PAGO.GetFromControl;
  vgFecha := Objeto.F_PAGO.AsDateTime;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.edFECHAExit(Sender: TObject);
begin
  Objeto.F_PAGO.GetFromControl;
  if vgFecha <> Objeto.F_PAGO.AsDateTime then
  begin
    vgFecha := Objeto.F_PAGO.AsDateTime;
    ShowData;
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.cbID_CREDITOClick(Sender: TObject);
begin
  if not(cbID_CREDITO.Checked) then
  begin
    if Objeto.Credito.Active then
    begin
      Objeto.Credito.Active := False;
      ShowData;
    end;
  end;
  //
  if not(Objeto.Credito.Active) then
     cbID_CREDITO.Checked := False;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.rgTipo_AvClick(Sender: TObject);
begin
  ShowData;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.rgRelacionClick(Sender: TObject);
begin
  ShowData;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.chbxApTodosClick(Sender: TObject);
begin
   SeleccionaReg(False);
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.NoImpresos1Click(Sender: TObject);
begin
   SeleccionaReg(True);
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMAVDOC_PREVI',True,True) then
   begin
      ImprimeReporte(True,False);
      ShowData;
   end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
procedure TwMAvDoc.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMAVDOC_IMPRI',True,True) then
   begin
      ImprimeReporte(False,False);
      ShowData;
   END;
end;

procedure TwMAvDoc.btSendMailClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMAVDOC_ENVIA',True,True) then
   begin
      ImprimeReporte(True, True);
      ShowData;
   end;
end;

end.


