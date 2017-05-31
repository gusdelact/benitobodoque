unit IntSICC;

interface

uses Windows, Forms, Dialogs, SysUtils, DB, DBTables, InterApl, UnSql2,
     stdCtrls, IntFrm, Controls, Comctrls, Buttons, Aligrid, Clipbrd, NMsmtp,
     classes, 
     
IntGenCre;

const
     CSICC_VERDAD = '1';
     CSICC_FALSO  = '0';

     CCHECKED   = 'V';
     CUNCHECKED = 'F';
     CNOTCHECK  = '-';

     C_NO_COL_EXCEL = ''; // No es una columna de Excel

     CSIT_RE  = 'RE';  // Situacion SICC "Reportado"
     CSIT_NR  = 'RN';  // Situacion SICC "No Reportado"

     CLIMITE_INFERIOR = 'IN'; // Limite SICC Inferior
     CLIMITE_MEDIO    = 'ME'; // Limite SICC Medio
     CLIMITE_SUPERIOR = 'SU'; // Limite SICC Superior

     CESTADO          = 'ES';
     CMUNICIPIO       = 'MU';
     CGOBIERNO_DESC   = 'CR';
     // CCREDITOS_ESTRUCTURADOS  = 'CE';

     CTIPO_AVAL_NORMAL      = '0'; // Normal
     CTIPO_AVAL_INSTITUCION = '1'; // Institución de crédito
     CTIPO_AVAL_FIDEICOMISO = '2'; // Fideicomisos públicos
     CTIPO_AVAL_SOCIEDAD    = '3'; // Sociedad Controladora
     CTIPO_AVAL_ENTIDADFIN  = '4'; // Entidades financieras exceptuadas

     CMEDIO_SICC_ICRE  = 'I';  // Sistema de Créditos ICRE
     CMEDIO_SICC_CRED  = 'C';  // Sistema de Intercréditos
     CMEDIO_SICC_USU   = 'U';  // Usuario
     CMEDIO_SICC_EXC   = 'E';  // Externo (Archivo de Excel)

     CCR_SICC_ACCION   = 'CR_SICC_ACCION';   // Nombre de Tabla "CR_SICC_ACCION"
     CCR_SICC_ACRED    = 'CR_SICC_ACRED';    // Nombre de Tabla "CR_SICC_ACRED"
     CCR_SICC_AR_ACRE  = 'CR_SICC_AR_ACRE';  // Nombre de Tabla "CR_SICC_AR_ACRE"
     CCR_SICC_ADJUDI   = 'CR_SICC_ADJUDI';   // Nombre de Tabla "CR_SICC_ADJUDI"
     CCR_SICC_AR_CARG  = 'CR_SICC_AR_CARG';  // Nombre de Tabla "CR_SICC_AR_CARG"
     CCR_SICC_AR_BNC   = 'CR_SICC_AR_BNC';   // Nombre de Tabla "CR_SICC_AR_BNC"
     CCR_SICC_CONSUM   = 'CR_SICC_CONSUM';   // Nombre de Tabla "CR_SICC_CONSUM"
     CCR_SICC_CORRIDA  = 'CR_SICC_CORRIDA';  // Nombre de Tabla "CR_SICC_CORRIDA"
     CCR_SICC_EJEC     = 'CR_SICC_EJEC';     // Nombre de Tabla "CR_SICC_EJEC"
     CCR_SICC_GA_PERS  = 'CR_SICC_GA_PERS';  // Nombre de Tabla "CR_SICC_GA_PERS"
     CCR_SICC_GA_PE_OP = 'CR_SICC_GA_PE_OP'; // Nombre de Tabla "CR_SICC_GA_PE_OP"
     CCR_SICC_GA_REAL  = 'CR_SICC_GA_REAL';  // Nombre de Tabla "CR_SICC_GA_REAL"
     CCR_SICC_GA_RE_OP = 'CR_SICC_GA_RE_OP'; // Nombre de Tabla "CR_SICC_GA_RE_OP"
     CCR_SICC_HIPO     = 'CR_SICC_HIPO';     // Nombre de Tabla "CR_SICC_HIPO"
     CCR_SICC_OBL_SOL  = 'CR_SICC_OBL_SOL';  // Nombre de Tabla "CR_SICC_OBL_SOL"
     CCR_SICC_OB_SO_OP = 'CR_SICC_OB_SO_OP'; // Nombre de Tabla "CR_SICC_OB_SO_OP"
     CCR_SICC_OPERA    = 'CR_SICC_OPERA';    // Nombre de Tabla "CR_SICC_OPERA"
     CCR_SICC_ANEXO4   = 'CR_SICC_ANEXO4';   // Nombre de Tabla "CR_SICC_ANEXO4"
     CCR_SICC_CALANEXO = 'CR_SICC_CALANEXO'; // Nombre de Tabla "CR_SICC_CALANEXO"
     CCR_SICC_BNC_TEI  = 'CR_SICC_BNC_TEI';  // Nombre de Tabla "CR_SICC_BNC_TEI"
     CCR_SICC_EXP_PAGO = 'CR_SICC_EXP_PAGO';
     CCR_COD_INDUST    = 'CR_COD_INDUST';   // Nombre de Tabla "Código Industria"

     CO_A_TABLAS : Array [0..13] of String = ( CCR_SICC_ACCION   ,     CCR_SICC_ACRED    ,     CCR_SICC_ADJUDI   ,
                                               CCR_SICC_CONSUM   ,     CCR_SICC_HIPO     ,     CCR_SICC_CORRIDA  ,
                                               CCR_SICC_EJEC     ,     CCR_SICC_GA_PERS  ,     CCR_SICC_GA_PE_OP ,
                                               CCR_SICC_GA_REAL  ,     CCR_SICC_GA_RE_OP ,     CCR_SICC_OBL_SOL  ,
                                               CCR_SICC_OB_SO_OP ,     CCR_SICC_OPERA    );

     CFOL_GPOCART      = 'GPOCART';   // Fol. de Grupos de Cartera
     CFOL_SICCACCI     = 'SICCACCI';  // Fol. Accionista CR_SICC_ACCION
     CFOL_SICCACRE     = 'SICCACRE';  // Fol. Acreditado CR_SICC_ACRED
     CFOL_SICCARAC     = 'SICCARAC';  // Fol. Archivo de Acreditado CR_SICC_AR_ACRE
     CFOL_SICCADJU     = 'SICCADJU';  // Fol. Adjudicación CR_SICC_ADJUDI
     CFOL_SICCARCH     = 'SICCARCH';  // Fol. Archivo a Cargar CR_SICC_ARCH
     CFOL_SICCARBN     = 'SICCARBN';  // Fol. Archivo BNC CR_SICC_AR_BNC
     CFOL_SICCARCA     = 'SICCARCA';  // Fol. Archivos a Cargar CR_SICC_AR_CARG
     CFOL_SICCCONF     = 'SICCCONF';  // Fol. Configuración SICC CR_SICC_CONF
     CFOL_SICCCONS     = 'SICCCONS';  // Fol. Cartera Consumo CR_SICC_CONSUM
     CFOL_SICCCORR     = 'SICCCORR';  // Fol. Corrida Financiera CR_SICC_CORRIDA
     CFOL_SICCEJEC     = 'SICCEJEC';  // Fol. Ejecutivos Cuenta CR_SICC_EJEC
     CFOL_SICCGAPE     = 'SICCGAPE';  // Fol. Gtía. Personales CR_SICC_GA_PERS
     CFOL_SICCGAPO     = 'SICCGAPO';  // Fol. Gtía. Personales-Crédito CR_SICC_GA_PE_OP
     CFOL_SICCGARE     = 'SICCGARE';  // Fol. Gtía. Reales CR_SICC_GA_REAL
     CFOL_SICCGARO     = 'SICCGARO';  // Fol. Gtía. Reales-Crédito CR_SICC_GA_RE_OP
     CFOL_SICCHIPO     = 'SICCHIPO';  // Fol. Cartera Hipotecario CR_SICC_HIPO
     CFOL_SICCINST     = 'SICCINST';  // Fol. SICC Instituciones CR_SICC_INST
     CFOL_SICCINSA     = 'SICCINSA';  // Fol. Instituciones como Avales CR_SICC_INS_AVAL
     CFOL_SICCOBLS     = 'SICCOBLS';  // Fol. Obigados Solidarios CR_SICC_OBL_SOL
     CFOL_SICCOBSO     = 'SICCOBSO';  // Fol. Obigados Solidarios-Crédito CR_SICC_OB_SO_OP
     CFOL_SICCOPER     = 'SICCOPER';  // Fol. Cartera CR_SICC_OPERA
     CFOL_SICCSUC      = 'SICCSUC' ;  // Fol. SICC Sucursal CR_SICC_SUC
     CFOL_SICCBTEI     = 'SICCBTEI';  // Fol. Buró De Crédito Tradicional e Interno

     CFOL_CALIAVAL     = 'CALIAVAL';  // Fol. SICC Calificación del Aval
     CFOL_CALIACRE     = 'CALIACRE';  // Fol. SICC Calificación del Acreditado
     CFOL_CALIGTIA     = 'CALIGTIA';  // Fol. SICC Calificación de la Garantía
     CFOL_CALICRED     = 'CALICRED';  // Fol. SICC Calificación de la Disposición
     CFOL_CALIRESV     = 'CALIRESV';  // Fol. SICC Calificación de las Reservas
     CFOL_CALPCTAV     = 'CALPCTAV';  // Fol. SICC Calificación Porcentaje del Aval
     CFOL_CALPCTGT     = 'CALPCTGT';  // Fol. SICC Calificación Porcentaje de la Garatía Real

     CFOL_CRCALACR     = 'CRCALACR';  // Fol. Calificación Acreditado por Calificadora
     CFOL_CRCALCAB     = 'CRCALCAB';  // Fol. Calificación Carga Archivo Cabecera
     CFOL_CRCALDET     = 'CRCALDET';  // Fol. Calificación Carga Archivo Detalle

     // Eliminar Folios
     CFOL_CALIACAR     = 'CALIACAR';  // Fol. Calificación Acred. por Calif.Archivo
     CFOL_CALIGPAR     = 'CALIGPAR';  // Fol. Gpo. Calificación Acred. por Calif.Archivo

     CCVE_RIESGO = 'RIESGO';

     CARACRE	 = 'ARACRE'; // Archivo Acreditado.CSV
     CARDAAC  = 'ARDAAC'; // Archivo Acreditado "Datos Adicionales"
     CARACCI	 = 'ARACCI'; // Archivo Accionistas.CSV
     CARBIEN	 = 'ARBIEN'; // Archivo Bienes ADJUDICADOS
     CARBURO	 = 'ARBURO'; // Archivo Buró (experiencia del Acreditado).CSV
     CARCONS	 = 'ARCONS'; // Archivo Cartera de Consumo.CSV
     CARHIPO	 = 'ARHIPO'; // Archivo Cartera Hipotecaria.CSV
     CARCORR	 = 'ARCORR'; // Archivo Corrida Financiera.CSV
     CAREJEC	 = 'AREJEC'; // Archivo Ejecutivo de Cuenta.CSV
     CARANX4  = 'ARANX4'; // Archivo Anexo 4.CSV
     CARCANX  = 'ARCANX'; // Archivo Calificación de Anexo 4.CSV
     CARPERS	 = 'ARPERS'; // Archivo Garantía Personal .CSV
     CARPEOP	 = 'ARPEOP'; // Archivo Garantía Personal-Operación.CSV
     CARREAL	 = 'ARREAL'; // Archivo Garantía Real .CSV
     CARREOP	 = 'ARREOP'; // Archivo Garantía Real-Operación.CSV
     CAROBGL	 = 'AROBGL'; // Archivo Obligado Solidario .CSV
     CAROBOP	 = 'AROBOP'; // Archivo Obligado Solidario-Operación.CSV
     CAROPER	 = 'AROPER'; // Archivo Operación.CSV
     CBNCTEI  = 'BNCTEI'; // Archivo Buró De Crédito Tradicional e Interno.CSV

     CMSGCANCELACONFIRMA = '¿Desea Cancelar el Registro?.';
     CMSGCANCELAOK       = 'Registro Cancelado.';
     CMSGCANCELAERROR    = 'Problemas al Cancelar Registro.';
     CMSGCONFIRMMODSIS   = 'Los datos a modificar son provenientes del Sistema, ¿Desea continuar con las modificaciones?';

Type PDataExportCol = ^DataExportCol;
     DataExportCol = record
      CSV_COL         : Integer;       // Dato Obtenido por el Sistema
      CSV_COLUMN_NAME : String;        // Dato indicado por el Usuario
      ORA_COLUMN_NAME : String;        // Dato indicado por el Usuario
      ORA_FIELD_TYPE  : TFieldType;    // Dato indicado por el Usuario
      ORA_DATA_SIZE   : Integer;       // Dato Obtenido por el Sistema
      ORA_REQUIRED    : Boolean;       // Dato Obtenido por el Sistema
      DATA_DEFAULT    : Variant;       // Dato indicado por el Usuario
      CHAR_CASE       : TEditCharCase; // Dato Obtenido por el Sistema (ecNormal, ecUpperCase, ecLowerCase);
    end;

Type
     TArrayExportCol = Array of PDataExportCol;

// Funciones y Procedimientos Generales, para el SICC
function TruncateStr2(var str : String; cKey : Char; bCOLCSV : Boolean = False) : String;

function ParseStr2(var A : TArrayString; StrToParse : String; cSeparator : Char; bCOLCSV : Boolean = False) : Integer;

function CanOpenFile(peStrFileName : String; pebShowMessage : Boolean; var psLastError : Integer) : Boolean;

function FileCountCRLF( pestrFileName : String ) : Integer;

procedure ClearAlignGrid(StringAlignGrid: TStringAlignGrid; nStartRow: Integer; bLimpiaFormatos : Boolean = True);

procedure TakeDataGridToClipBoardSICC(pebCopyHeader : Boolean; StrAlgnGrd1, StrAlgnGrd2 : TStringAlignGrid; SelectedRect : TRect; strTitles : String = '');

function MensajeHoraInicio : String;

function ObtenSeparadordeListadeWindows : String;

function UpperCaseAcentos(str : String) : String;

function SendEMail(peApli : TInterApli; peSubType : TSubType; peUseInterpriseData : Boolean; peSubject, peEmail, peTo,
                   peFromAddress, peFromName: String; peFileNameToAttach : String = '') : Boolean;
// Funciones para la Clases SICC

procedure RefreshBtnCancela(pestrSituacion : String; var BitBtn : TBitBtn);

procedure AsignaValores_SICC_ANIO_MES(peANIO_MES : TInterCampo; var peANIO, peMES : TInterCampo);

function MsgMemo(Memo : TMemo; const Msg: string; DlgType: TMsgDlgType;
                  Buttons: TMsgDlgButtons; HelpCtx: Longint): Word;

function DameMesAnio(peANIO_MES : Integer) : String;

// Funciones y Procedimientos de Obtención de Datos SICC
function ObtenConfiguracionSICC(peID_SICC_CONF     : Integer;
                                peApli             : TInterApli;
                                var psF_INICIAL    : TDateTime;
                                var psF_FINAL      : TDateTime;
                                var psRESULTADO    : Integer;
                                var psTX_RESULTADO : String) : Boolean;

function ObtenStpExperieciadePago(peID_SICC_CONF, peID_ACREDITADO : Integer;
                                  peApli : TInterApli) : TStoredProc;

function ObtenCuantosRegHay_Oracle(peMetodo           : Integer;
                                   peID_SICC_CONF     : Integer;
                                   peCVE_MEDIO_SICC   : String;
                                   peTABLE_NAME       : String;
                                   peApli             : TInterApli) : Integer;

// Carga de Archivos
function SICC_IsInteger(peStrValue : String; var psValue : Integer) : Boolean;
function SICC_IsFloat(peStrValue : String; var psValue : Double) : Boolean;
function SICC_IsDate(peStrValue : String; var psValue : Double) : Boolean;
function SICC_IsDateTime(peStrValue : String; var psValue : TDateTime) : Boolean;

function min(x,y: longint):longint;
function max(x,y: longint):longint;
function GetPointer(index: integer; memblock: THandle):pointer;
procedure StringToStream(stream:TMemorystream; const s:string);
procedure StreamToClipboard(stream : TStream; format:integer);

function SICC_ValidTable(peTABLE_NAME : String; var peArrayExportCol : TArrayExportCol;
                         peApli : TInterApli; var psDescProc : String) : Boolean;

function SICC_QueryPrepare( peCOLUMN_NAME_FOLIO, peTABLE_NAME : String;
                            peArrayExportCol : TArrayExportCol; peApli : TInterApli;
                            var psQry : TQuery;
                            var psDescProc : String) : Boolean;

procedure SICC_DisposeArrayExport(var peArrayExportCol : TArrayExportCol);

function SICC_LoadFileCSV( peBreakOnError : Boolean;
                           peStrFileName : String;
                           peCharSeparator : Char;
                           peTABLE_NAME,
                           peCVE_FOLIO,
                           peCOLUMN_NAME_FOLIO : String;
                           peArrayExportCol : TArrayExportCol;
                           var psCountReg : Integer;
                           peApli : TInterApli;
                           var psDescProc : String;
                           LabelCounter : TLabel;
                           ProgressBar : TProgressBar;
                           strExpValida : String = ''
                           ) : Boolean;

// Armado de Datos
function StpArmaDatos( pestrStoredProcName  : String;
                       peID_SICC_CONF       : Integer;
                       peCVE_USU_ALTA       : String;
                       peF_ALTA             : TDateTime;
                       peB_COMMIT           : String;
                       var psRESULTADO      : Integer;
                       var psTX_RESULTADO   : String;
                       peApli : TInterApli;
                       pebMuestraError      : Boolean
                      ) : Boolean;

// Cancelacion de Datos
function StpCancelaRegistros( peMetodo             ,
                              peID_SICC_CONF       ,
                              peID_SICC            : Integer;
                              peCVE_MEDIO_SICC     ,
                              peTABLE_NAME         ,
                              peB_COMMIT           : String;
                              var psRESULTADO      : Integer;
                              var psTX_RESULTADO   : String;
                              peApli : TInterApli;
                              pebMuestraError      : Boolean
                            ) : Boolean;

// Actualización de Situación a Reportado de los registros enviados al SICC                            
function StpRegistrosReportados(  peID_SICC_CONF       : Integer;
                                  peTABLE_NAME         ,
                                  peB_COMMIT           : String;
                                  var psRESULTADO      : Integer;
                                  var psTX_RESULTADO   : String;
                                  peApli : TInterApli;
                                  pebMuestraError      : Boolean
                                ) : Boolean;

function StpCambiaBanderaRegistros( peMetodo             ,
                                    peID_SICC_CONF       ,
                                    peID_SICC            : Integer;
                                    peB_ENVIAR_SICC      : String;
                                    peTABLE_NAME         : String;
                                    peB_COMMIT           : String;
                                    var psRESULTADO      : Integer;
                                    var psTX_RESULTADO   : String;
                                    peApli : TInterApli;
                                    pebMuestraError      : Boolean
                                  ) : Boolean;

function AsignaValoresAntesAceptar( peStrNombreFolio  : String; peApli : TInterApli;
                                    pebIsNewData : Boolean; peID_CONF : Integer;
                                    var peID_SICC_CONF    ,  peID_SICC         ,
                                        peSITUACION       ,  peCVE_MEDIO_SICC  ,
                                        peF_ALTA          ,  peCVE_USU_ALTA    ,
                                        peF_MODIFICA      ,  peCVE_USU_MODIFICA : TInterCampo
                                  ) : Boolean;

function StpCancelaRegCalif(  peANIO_MES           : Integer;
                              peTABLE_NAME         ,
                              peB_COMMIT           : String;
                              var psRESULTADO      : Integer;
                              var psTX_RESULTADO   : String;
                              peApli : TInterApli;
                              pebMuestraError      : Boolean
                            ) : Boolean;

function StpActExpPagoAcred(  peID_SICC_CONF       : Integer;
                              peCVE_USU_MODIFICA   : String;
                              peF_MODIFICA         : TDateTime;
                              peB_COMMIT           : String;
                              var psRESULTADO      : Integer;
                              var psTX_RESULTADO   : String;
                              peApli : TInterApli;
                              pebMuestraError      : Boolean
                            ) : Boolean;

function StpObtenRiesgoAcreditado( peID_ACREDITADO   : Integer;
                                   peCVE_TIPO_RIESGO : String;
                                   peF_REFERENCIA    : TDateTime;
                                   peApli : TInterApli;
                                   var psCVE_CALIFICACION : String
                                 ) : Boolean;
                                                             
implementation

//----------------------------------------------------------------------------------------------------------------------

function TruncateStr2(var str : String; cKey : Char; bCOLCSV : Boolean = False) : String;
var bAplicaCSV : Boolean;
    vlnPosMarks : Integer;
begin
 If Trim(str) <> '' Then
  Begin
   bAplicaCSV := False; vlnPosMarks := 0;
   If bCOLCSV Then
    Begin
    vlnPosMarks := SearchStr('"',Copy(str,2,Length(str)));
    bAplicaCSV := (str[1] = '"') And (vlnPosMarks > 0);
    End;
   If bAplicaCSV Then
    Begin
    Result := Copy(str,2,vlnPosMarks-1);
    str := Copy(str,vlnPosMarks+3,Length(str));
    End
   Else
    Begin
    Result := Copy(str,1,Pos(cKey,str)-1);
    str := Copy(str,Pos(cKey,str)+1,Length(str));
    End;
  End
 Else
  Result := str;
end;

function ParseStr2(var A : TArrayString; StrToParse : String; cSeparator : Char; bCOLCSV : Boolean = False) : Integer;
var nCount : Integer;
    str, strDblSeparator : String;
begin
 str := StrToParse;
 strDblSeparator := cSeparator + cSeparator; nCount := 0;

 While (SearchStr(strDblSeparator, StrToParse) > 0) Do
  StrToParse := ReplaceStr(StrToParse, strDblSeparator, cSeparator + #32 + cSeparator);

 While Trim(StrToParse) <> '' Do
  Begin
  SetLength(A,nCount+1);
  str := TruncateStr2(StrToParse,cSeparator,bCOLCSV);
  If (str = '') And (Pos(cSeparator,StrToParse) = 0) Then Begin A[nCount] := StrToParse; StrToParse := ''; End
  Else A[nCount] := str;
  Inc(nCount);
  End;
 Result := nCount;
end;

//----------------------------------------------------------------------------------------------------------------------

function CanOpenFile(peStrFileName : String; pebShowMessage : Boolean; var psLastError : Integer) : Boolean;
var F : TextFile;
    vlbOpenFile : Boolean;
    vlstrMsg : String;
begin
 vlbOpenFile := False;
 Result := vlbOpenFile;
 If FileExists(peStrFileName) Then
  Try
   {$I-}
   AssignFile(F, pestrFileName);
   Reset(F);
   vlbOpenFile := IOResult = 0;
   {$I+}
  Finally
   If vlbOpenFile Then CloseFile(F);
   Result := vlbOpenFile;
   vlstrMsg := ''; psLastError := GetLastError;
   If Not vlbOpenFile Then
     Begin
       Case psLastError Of
         1   : vlstrMsg := 'Invalid function number';
         2   : vlstrMsg := 'File not found';
         3   : vlstrMsg := 'Path not found';
         4   : vlstrMsg := 'Too many open files';
         5   : vlstrMsg := 'File access denied';
         6   : vlstrMsg := 'Invalid file handle';
         12  : vlstrMsg := 'Invalid file access code';
         15  : vlstrMsg := 'Invalid drive number';
         16  : vlstrMsg := 'Cannot remove current directory';
         17  : vlstrMsg := 'Cannot rename across drives';
         32  : vlstrMsg := 'El archivo "'+peStrFileName+'" se encuentra abierto por otra aplicación.'+coCRLF+
                           'Favor de cerrar el archivo en la otra aplicación para poder continuar.';
         100 : vlstrMsg := 'Disk read error';
         101 : vlstrMsg := 'Disk write error';
         102 : vlstrMsg := 'File not assigned';
         103 : vlstrMsg := 'File not open';
         104 : vlstrMsg := 'File not open for input';
         105 : vlstrMsg := 'File not open for output';
         106 : vlstrMsg := 'Invalid numeric format';
         200 : vlstrMsg := 'Division by zero';
         201 : vlstrMsg := 'Range check error';
         202 : vlstrMsg := 'Stack overflow error';
         203 : vlstrMsg := 'Heap overflow error';
         204 : vlstrMsg := 'Invalid pointer operation';
         205 : vlstrMsg := 'Floating point overflow';
         206 : vlstrMsg := 'Floating point underflow';
         207 : vlstrMsg := 'Invalid floating point operation';
         210 : vlstrMsg := 'Object not initialized';
         211 : vlstrMsg := 'Call to abstract method';
         212 : vlstrMsg := 'Stream registration error';
         213 : vlstrMsg := 'Collection index out of range';
         214 : vlstrMsg := 'Collection overflow error';
         215 : vlstrMsg := 'Arithmetic overflow error';
         216 : vlstrMsg := 'General protection fault';
       end;
     If pebShowMessage Then
       MessageDlg(vlstrMsg, mtError, [mbOk], 0);
     End;
  End;
end;

function FileCountCRLF( pestrFileName : String ) : Integer;
var F : TextFile;
    bOpenFile : Boolean;
    vlstrBuf : String;
    vlnCount : Integer;
begin
 Result := 0; vlnCount := 0; bOpenFile := False;
 If FileExists(pestrFileName) Then
  Try
   {$I-}
   AssignFile(F, pestrFileName);
   FileMode := fmOpenRead or fmShareDenyNone;  // Set file access to read only and shared to everybody
   Reset(F);
   bOpenFile := IOResult = 0;
   vlnCount := 0;
   While Not Eof(F) Do
    Begin
    ReadLn(F, vlstrBuf);
    Inc(vlnCount);
    End;
  Finally
   If bOpenFile Then Begin CloseFile(F); Result := vlnCount; End
   Else Result := -1;
   {$I+}
  End;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure ClearAlignGrid(StringAlignGrid: TStringAlignGrid; nStartRow: Integer; bLimpiaFormatos : Boolean = True);
var I, J : Integer;
begin
 If Assigned(StringAlignGrid) Then
  With StringAlignGrid Do
   Begin
   If bLimpiaFormatos Then
     Begin
     ResetColorRowAll;
     ResetAlignColAll;
     ResetFontRowAll;
     End;
   For I := nStartRow To RowCount-1 Do
    Begin
    RowHeights[I] := DefaultRowHeight;
    For J := 0 To ColCount-1 Do
       Cells[J,I] := '';
    End ;
   End ;
end;

(*@/// function min(x,y: longint):longint; *)
function min(x,y: longint):longint;
begin
  if x<y then result:=x
         else result:=y;
  end;
(*@\\\*)
(*@/// function max(x,y: longint):longint; *)
function max(x,y: longint):longint;
begin
  if x>y then result:=x
         else result:=y;
  end;
(*@\\\*)

(*@/// Make Stream and Clipboard work together *)
(*@/// function GetPointer(index: integer; memblock: THandle):pointer; *)
function GetPointer(index: integer; memblock: THandle):pointer;
(*$ifdef delphi_1 *)
var
  selector, offset: word;
  P: pointer;
begin
  selector:=(index div 65536) * selectorinc + memblock;
  offset:=(index mod 65536);
  p:=GlobalLock(Selector);
  result:=Ptr(selector,offset);
  end;
(*$else *)
begin
  result:=pointer(longint(GlobalLock(memblock))+index);
  end;
(*$endif *)
(*@\\\0000000212*)
(*@/// procedure Stream2Clipboard(stream:TStream; format:integer); *)

//----------------------------------------------------------------------------------------------------------------------
procedure StreamToClipboard(stream : TStream; format:integer);
const
  max_write = $8000;    
var
  size: longint;
  s: word;
  curpos: longint;
  Memblock: THandle;
  FClipboardWindow: THandle;
begin
  FClipboardWindow := Application.Handle;
  if FClipboardWindow = 0 then
    FClipboardWindow := AllocateHWnd(NIL);
  OpenClipboard(FClipboardWindow);

  stream.seek(0,0);
  size:=stream.size;
  stream.seek(0,0);
  MemBlock:=GlobalAlloc(gmem_moveable or gmem_zeroinit,size+1);
  curpos:=0;
  while curpos+1<size do begin
    s:=stream.read(getPointer(curpos,MemBlock)^,min(max_write,size-curpos));
    inc(curpos,s);
    GlobalUnLock(MemBlock);
    if s=0 then BREAK;
    end;
  char(getPointer(curpos,memblock)^):=#0;
  GlobalUnLock(MemBlock);
  EmptyClipBoard;
  SetClipBoardData(format,memblock);

  CloseClipboard;
  if FClipboardWindow<>Application.Handle then
    DeallocateHWnd(FClipboardWindow);
end;

procedure StringToStream(stream:TMemorystream; const s:string);
begin
  stream.write(s[1],length(s));
end;

procedure TakeDataGridToClipBoardSICC(pebCopyHeader : Boolean;
                                      StrAlgnGrd1, StrAlgnGrd2 : TStringAlignGrid;
                                      SelectedRect : TRect; strTitles : String = '');
var I, J, J1, nLeft, nRight, nTop, nBottom : Integer;
    str : String;
    h : TMemorystream;
begin
  h := Nil;
  Try
      h := TMemorystream.Create;

      If Not pebCopyHeader Then
       strTitles := '';
      str := strTitles;
      With StrAlgnGrd2 Do
       Begin
       If SelectedRect.Left   < 0         Then nLeft   := 0 Else nLeft := SelectedRect.Left;
       If SelectedRect.Right  >= ColCount Then nRight  := ColCount - 1 Else nRight := SelectedRect.Right;
       If SelectedRect.Top    <= 0        Then nTop    := 1 Else nTop := SelectedRect.Top;
       If SelectedRect.Bottom >= RowCount Then nBottom := RowCount - 1 Else nBottom := SelectedRect.Bottom;

       If (pebCopyHeader) Then
         Begin
           If Assigned(StrAlgnGrd1) Then
            Begin
            For J := 0 To StrAlgnGrd1.ColCount-1 Do
             str := str + StrAlgnGrd1.Cells[J,0] + #9;
            End;
           For J1 := nLeft To nRight Do
            str := str + Cells[J1,0] + #9;
           StringToStream(h, str + coCRLF);
         End;

       For I := nTop To nBottom Do
        Begin
         str := '';
         If Assigned(StrAlgnGrd1) Then
         Begin
           For J := 0 To StrAlgnGrd1.ColCount-1 Do
            str := str + StrAlgnGrd1.Cells[J,I] + #9;
         End;
         //
         For J1 := nLeft To nRight Do
          str := str + Cells[J1,I] + #9;
         StringToStream(h, str + coCRLF);
        End;

       StreamToClipboard(h, CF_TEXT);
       End;
  Finally
     If Assigned(h) Then h.free;
  End;
end;

//----------------------------------------------------------------------------------------------------------------------

function MensajeHoraInicio : String;
begin
 Result := 'Hora de inicio:' + TimeToStr(Time);
end;

//----------------------------------------------------------------------------------------------------------------------

function ObtenSeparadordeListadeWindows : String;
var pcSeparator : PChar;
begin
// function GetLocaleInfo(Locale: LCID;
//                          LCType: LCTYPE;
//                          lpLCData: PChar;
//                          cchData: Integer): Integer; stdcall;
 pcSeparator := StrAlloc(10);
 GetLocaleInfo( LOCALE_USER_DEFAULT, // LOCALE_SYSTEM_DEFAULT,
                LOCALE_SLIST,
                pcSeparator,
                10);
 Result := String(pcSeparator);
end;

function UpperCaseAcentos(str : String) : String;
var I : Integer;
    strResult, strChar : String;
begin
  strResult := '';
  str := UpperCase(str);
  For I := 1 To Length(str) Do
   Begin
     Case str[I] Of
       'á' : strChar := 'Á';
       'í' : strChar := 'Í';
       'ó' : strChar := 'Ó';
       'ú' : strChar := 'Ú';
       'é' : strChar := 'É';
       'ñ' : strChar := 'Ñ';
     Else
       strChar := str[I];
     End;
     strResult := strResult + strChar;
   End;
  Result := strResult;
end;

procedure RefreshBtnCancela(pestrSituacion : String; var BitBtn : TBitBtn);
begin
   BitBtn.Enabled := (pestrSituacion = CSIT_AC);
   If Not BitBtn.Enabled Then BitBtn.Tag := 0;
end;

procedure AsignaValores_SICC_ANIO_MES(peANIO_MES : TInterCampo; var peANIO, peMES : TInterCampo);
var vlstr : String;
begin
  peANIO.AsInteger := StrToInt(Copy(peANIO_MES.AsString, 1, 4));
  vlstr := Copy(peANIO_MES.AsString, 5, 2);
  peMES.AsString := Copy('00',1,2-Length(vlstr)) + vlstr;
end;

//----------------------------------------------------------------------------------------------------------------------

function MsgMemo(Memo : TMemo; const Msg: string; DlgType: TMsgDlgType;
                 Buttons: TMsgDlgButtons; HelpCtx: Longint): Word;
begin
 Memo.Lines.Add(Msg);
 Result := MessageDlg(Msg, DlgType, Buttons, HelpCtx);
end;

//----------------------------------------------------------------------------------------------------------------------

function DameMesAnio(peANIO_MES : Integer) : String;
const CMES : Array[0..11] of String = ( 'ENE', 'FEB', 'MAR', 'ABR', 'MAY', 'JUN',
                                        'JUL', 'AGO', 'SEP', 'OCT', 'NOV', 'DIC' );
begin
 Result := '';
 If (peANIO_MES > 0) Then
  Result := CMES [ StrToInt(Copy( IntToStr(peANIO_MES), 5, 2)) - 1 ] + ' ' + Copy(IntToStr(peANIO_MES), 1, 4);
end;

//----------------------------------------------------------------------------------------------------------------------

function ObtenConfiguracionSICC(peID_SICC_CONF     : Integer;
                                peApli             : TInterApli;
                                var psF_INICIAL    : TDateTime;
                                var psF_FINAL      : TDateTime;
                                var psRESULTADO    : Integer;
                                var psTX_RESULTADO : String) : Boolean;
var Stp : TStoredProc;
begin
  Result := False;
  Stp := TStoredProc.Create(Nil);
  If Assigned(Stp) Then
   With Stp Do
    Try
     StoredProcName := 'PKGCRSICC.STP_SICC_OBT_CONF';
     DatabaseName   := peApli.DatabaseName;
     SessionName    := peApli.SessionName;
     // Crea Variables
     Params.Clear;
     Params.CreateParam(ftInteger ,'peID_SICC_CONF' ,ptInput);
     Params.CreateParam(ftDateTime,'psF_INICIAL'    ,ptOutput);
     Params.CreateParam(ftDateTime,'psF_FINAL'      ,ptOutput);
     Params.CreateParam(ftInteger ,'psRESULTADO'    ,ptOutput);
     Params.CreateParam(ftString  ,'psTX_RESULTADO' ,ptOutput);
     // Asigna Variables
     ParamByName('peID_SICC_CONF').AsInteger    := peID_SICC_CONF;
     ExecProc;
     // Asigna Variables de Salida
     psF_INICIAL    := ParamByName('psF_INICIAL').AsDateTime;
     psF_FINAL      := ParamByName('psF_FINAL').AsDateTime;
     psRESULTADO    := ParamByName('psRESULTADO').AsInteger;
     psTX_RESULTADO := ParamByName('psTX_RESULTADO').AsString;
     Result := psRESULTADO = 0;
    Finally
     Stp.Params.Clear;
     Stp.Free;
    End;
end;

//----------------------------------------------------------------------------------------------------------------------

function ObtenStpExperieciadePago(peID_SICC_CONF, peID_ACREDITADO : Integer;
                                  peApli : TInterApli) : TStoredProc;
var vlStp : TStoredProc;
begin
  vlStp := TStoredProc.Create(Nil);
  If Assigned(vlStp) Then
   With vlStp Do
     Begin
     StoredProcName := 'PKGCRSICC.GET_EXP_PAGO_QRY';
     DatabaseName   := peApli.DatabaseName;
     SessionName    := peApli.SessionName;
     // Crea Variables
     Params.Clear;
     Params.CreateParam(ftInteger ,'peID_SICC_CONF' ,ptInput);
     Params.CreateParam(ftInteger ,'peID_ACREDITADO',ptInput);
     Params.CreateParam(ftCursor  ,'RESULT'      ,ptResult);
     // Asigna Variables
     ParamByName('peID_SICC_CONF').AsInteger  := peID_SICC_CONF;
     If (peID_ACREDITADO < 0) Then
      ParamByName('peID_ACREDITADO').Clear
     Else
      ParamByName('peID_ACREDITADO').AsInteger := peID_ACREDITADO;
     End;
  Result := vlStp;
End;

function ObtenCuantosRegHay_Oracle(peMetodo           : Integer;
                                   peID_SICC_CONF     : Integer;
                                   peCVE_MEDIO_SICC   : String;
                                   peTABLE_NAME       : String;
                                   peApli             : TInterApli) : Integer;
var vlStp : TStoredProc;
begin
  Result := -1;
  vlStp := TStoredProc.Create(Nil);
  If Assigned(vlStp) Then
   With vlStp Do
     Try
       StoredProcName := 'PKGCRSICC.GET_COUNT_DATA';
       DatabaseName   := peApli.DatabaseName;
       SessionName    := peApli.SessionName;
       // Crea Variables
       Params.Clear;
       Params.CreateParam(ftInteger ,'peMetodo'         ,ptInput);
       Params.CreateParam(ftInteger ,'peID_SICC_CONF'   ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_MEDIO_SICC' ,ptInput);
       Params.CreateParam(ftString  ,'peTABLE_NAME'     ,ptInput);
       Params.CreateParam(ftInteger ,'RESULT'           ,ptResult);
       // Asigna Variables
       ParamByName('peMetodo').AsInteger         := peMetodo;
       ParamByName('peID_SICC_CONF').AsInteger   := peID_SICC_CONF;
       ParamByName('peCVE_MEDIO_SICC').AsString  := peCVE_MEDIO_SICC;
       ParamByName('peTABLE_NAME').AsString      := Copy(peTABLE_NAME, Pos('.',peTABLE_NAME)+1, Length(peTABLE_NAME));
       ExecProc;
     Finally
       Result := ParamByName('RESULT').AsInteger;
       vlStp.Free;
     End;
end;

function SICC_IsInteger(peStrValue : String; var psValue : Integer) : Boolean;
begin
  psValue := 0;
  Try
    psValue := StrToInt(peStrValue);
    Result := True;
  Except
    Result := False;
  End;
end;

//----------------------------------------------------------------------------------------------------------------------

function SICC_IsFloat(peStrValue : String; var psValue : Double) : Boolean;
begin
  psValue := 0;
  Try
    psValue := StrToFloat(peStrValue);
    Result := True;
  Except
    Result := False;
  End;
end;

//----------------------------------------------------------------------------------------------------------------------

function SICC_IsDate(peStrValue : String; var psValue : Double) : Boolean;
begin
  psValue := 0;
  Try
    psValue := StrToDate(peStrValue);
    Result := True;
  Except
    Result := False;
  End;
end;

//----------------------------------------------------------------------------------------------------------------------

function SICC_IsDateTime(peStrValue : String; var psValue : TDateTime) : Boolean;
begin
  psValue := 0;
  Try
    psValue := StrToDateTime(peStrValue);
    Result := Frac(psValue) > 0;
  Except
    Result := False;
  End;
end;

//----------------------------------------------------------------------------------------------------------------------

function SICC_ValidTable(peTABLE_NAME : String; var peArrayExportCol : TArrayExportCol;
                         peApli : TInterApli; var psDescProc : String) : Boolean;
var vlQryExists, vlQry : TQuery;
    vlField : TField;
    vlbResult, vlbOK : Boolean;
    vlstrComa : String;
    I : Integer;
begin
 Result := False; psDescProc := '';
 vlQryExists := GetSQLQuery(' SELECT * FROM ALL_TABLES,'+coCRLF+
                            '      ('+coCRLF+
                            '       SELECT SUBSTR('+SqlStr(peTABLE_NAME)+','+coCRLF+
                            '                     INSTR('+SqlStr(peTABLE_NAME)+',''.'')+1,'+coCRLF+
                            '                     LENGTH('+SqlStr(peTABLE_NAME)+')'+coCRLF+
                            '                     ) AS TABLE_NAME FROM DUAL'+coCRLF+
                            '      ) D'+coCRLF+
                            ' WHERE ALL_TABLES.TABLE_NAME = D.TABLE_NAME'+coCRLF,
                            peApli.DataBaseName, peApli.SessionName, False);
 // Si no encontró la tabla entonces...
 If Not Assigned(vlQryExists) Then
  psDescProc := 'No existe la tabla "'+peTABLE_NAME+'", favor de avisar a Sistemas.'
 Else
  With vlQry Do
    Begin
      vlQry := TQuery.Create(Nil);
      Try
       // Inicializa Datos
       DataBaseName := peApli.DataBaseName;
       SessionName  := peApli.SessionName;
       SQL.Clear;
       SQL.Add('SELECT * FROM '+peTABLE_NAME+' WHERE ROWNUM = 1');
       Open;
       // Identifica Tipo de Columnas
       vlbResult := True;  vlstrComa := '';
       For I := 0 To High(peArrayExportCol) Do
        Begin
        vlField := FindField(peArrayExportCol[I].ORA_COLUMN_NAME);
        If Not Assigned(vlField) Then
          Begin
          vlbOK := False;
          psDescProc := psDescProc + vlstrComa + peArrayExportCol[I].ORA_COLUMN_NAME;
          vlstrComa := ',';
          End
        Else
          Begin
          vlbOK := True;
          peArrayExportCol[I].ORA_FIELD_TYPE := vlField.DataType;
          peArrayExportCol[I].ORA_REQUIRED := Not vlField.Required;
          peArrayExportCol[I].ORA_DATA_SIZE := vlField.DataSize - 1;
          End;
        vlbResult := vlbResult And vlbOK;
        End;
       If (psDescProc <> '') Then
        psDescProc := 'No se encontraron las siguientes columna(s) '+psDescProc+
                      ' en la tabla "'+peTABLE_NAME+'".';
       Result := vlbResult;
      Finally
       If Assigned(vlQryExists) Then vlQryExists.Free;
       If Assigned(vlQry) Then Begin vlQry.Close; vlQry.Free; End;
      End;
    End;
  // End With  
end;

//----------------------------------------------------------------------------------------------------------------------

function SICC_QueryPrepare( peCOLUMN_NAME_FOLIO, peTABLE_NAME : String;
                            peArrayExportCol : TArrayExportCol; peApli : TInterApli;
                            var psQry : TQuery;
                            var psDescProc : String) : Boolean;
var vlSQL_COLUMN_NAMES, vlSQL_PARAMS_NAMES : String;
    vlstrComa, vlstrColumnName, vlstrParamName, vlstrCase, vlstrCase1 : String;
    I : Integer;
begin
 Try
    // Inicializa Variables
    vlSQL_COLUMN_NAMES := ''; vlSQL_PARAMS_NAMES := '';  vlstrComa := '';
    // Crea Query
    psQry := TQuery.Create(Nil);
    psQry.DataBaseName := peApli.DataBaseName;
    psQry.SessionName  := peApli.SessionName;
    psQry.SQL.Clear;
    psQry.Params.Clear;



    // Crea Variables para el Query
    For I := 0 To High(peArrayExportCol) Do
      Begin
      vlstrColumnName := peArrayExportCol[I].ORA_COLUMN_NAME;
      vlstrParamName  := ':V' + vlstrColumnName;

      // Si tiene asignado formato entonces...
      If (peArrayExportCol[I].CHAR_CASE = ecUpperCase) Then
       Begin
       vlstrCase  := 'UPPER(';
       vlstrCase1 := ')';
       End
      Else If (peArrayExportCol[I].CHAR_CASE = ecLowerCase) Then
       Begin
       vlstrCase  := 'LOWER(';
       vlstrCase1 := ')';
       End
      Else
       Begin
       vlstrCase  := '';
       vlstrCase1 := '';
       End;

      vlSQL_COLUMN_NAMES := vlSQL_COLUMN_NAMES + vlstrComa + coCRLF + '          ' + vlstrColumnName;
      vlSQL_PARAMS_NAMES := vlSQL_PARAMS_NAMES + vlstrComa + coCRLF + '          ' + vlstrCase + vlstrParamName + vlstrCase1;
      vlstrComa := ',';
      psQry.Params.CreateParam(peArrayExportCol[I].ORA_FIELD_TYPE, vlstrParamName, ptInput);
      End;
    // Si utiliza Columna de Folio, entonces...
    If (Trim(peCOLUMN_NAME_FOLIO) <> '') Then
     Begin
     // Crea la variable correspondiente para el Folio
     vlstrColumnName := peCOLUMN_NAME_FOLIO;
     vlstrParamName  := ':V' + vlstrColumnName;
     vlSQL_COLUMN_NAMES := vlSQL_COLUMN_NAMES + vlstrComa + coCRLF + '          ' + vlstrColumnName;
     vlSQL_PARAMS_NAMES := vlSQL_PARAMS_NAMES + vlstrComa + coCRLF + '          ' + vlstrParamName ;
     psQry.Params.CreateParam(ftInteger, vlstrParamName, ptInput);
     End; 
    // Arma SQL
    psQry.SQL.Add(' INSERT INTO '+ peTABLE_NAME + coCRLF +
                  '        ( ' +
                  vlSQL_COLUMN_NAMES +
                  '        )' + coCRLF +
                  ' VALUES (' + 
                  vlSQL_PARAMS_NAMES +
                  '        )'
                  );
    Result := True;
  Except
    Result := False;
  End;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure SICC_GetIndexCol( ATitles : TArrayString; peArrayExportCol : TArrayExportCol);

    function FindFieldCSV(strCSV_COLUMN_NAME : String) : Integer;
    var I : Integer;
    begin
     Result := -1;
      For I := 0 To High(ATitles) Do
       If (strCSV_COLUMN_NAME = UpperCaseAcentos(Trim(ATitles[I]))) Then
        Begin
        Result := I;
        Break;
        End;
    end;

var  vlIndex : Integer;
begin
 For vlIndex := 0 To High(peArrayExportCol) Do
  If (peArrayExportCol[vlIndex].CSV_COLUMN_NAME <> C_NO_COL_EXCEL) Then
   peArrayExportCol[vlIndex].CSV_COL := FindFieldCSV(peArrayExportCol[vlIndex].CSV_COLUMN_NAME)
  Else
   peArrayExportCol[vlIndex].CSV_COL := -1;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure SICC_DisposeArrayExport(var peArrayExportCol : TArrayExportCol);
var I : Integer;
    P : PDataExportCol;
begin
 // Libera la Memoria de cada uno de los registros
 For I := 0 To High(peArrayExportCol) Do
  Begin
  P := peArrayExportCol[I];
  Dispose(P);
  End;
 // Libera la memoria del Arreglo
 SetLength(peArrayExportCol,0);
end;

//----------------------------------------------------------------------------------------------------------------------

function Nvl(strData : String; vlValue : Variant ) : Variant;
begin
 If (Trim(strData) = '') Then Result := vlValue
 Else Result := strData;
end;

//----------------------------------------------------------------------------------------------------------------------

function RegistroValido(peATitles, peAData : TArrayString; pestrExpression : String;
                        peArrayExportCol : TArrayExportCol) : Boolean;

   function ObtenValor(pestrVariable : String) : Variant;
   var I, vlnCol : Integer;
       vlFieldType : TFieldType;
   begin
     vlnCol := -1; pestrVariable := Trim(pestrVariable);
     vlFieldType := ftUnknown;
     For I := 0 To High(peArrayExportCol) Do
       If (peArrayExportCol[I].CSV_COLUMN_NAME = pestrVariable) Then
        Begin
        vlnCol := peArrayExportCol[I].CSV_COL;
        vlFieldType := peArrayExportCol[I].ORA_FIELD_TYPE;
        Break;
        End;

     If (vlnCol > 0) Then
       Begin
         Case (vlFieldType) Of
           ftInteger   : Result := Trim(Nvl(peAData[vlnCol],0));
           ftFloat     : Result := Trim(Nvl(peAData[vlnCol],0));
           ftString    : Result := peAData[vlnCol];
           ftDateTime  : Result := Trim(Nvl(peAData[vlnCol],0));
         End; // End Case
       End
     Else Result := TrimChar(pestrVariable, #39);
   end;

const CO_OPERADOR : Array [0..5] of String = ('=','<>','>=','<=','>','<');
var strOperador, strValueExp1, strValueExp2 : String;
    vlValue1, vlValue2 : Variant;
    I, vlnPos : Integer;
begin
 // Busca el Operador y sus valores
 Result := False; 
 For I := 0 To High(CO_OPERADOR) Do
  Begin
  vlnPos := SearchStr(CO_OPERADOR[I], pestrExpression);
  If (vlnPos > 0) Then
    Begin
    strOperador := CO_OPERADOR[I];
    strValueExp1 := Trim( Copy(pestrExpression, 1, vlnPos-1) );
    strValueExp2 := Trim( Copy(pestrExpression, vlnPos + Length(strOperador), Length(pestrExpression)) );
    vlValue1 := ObtenValor(strValueExp1);
    vlValue2 := ObtenValor(strValueExp2);
    If (strOperador = '=') Then Result := vlValue1 = vlValue2
    Else If (strOperador = '<>') Then Result := vlValue1 <> vlValue2
    Else If (strOperador = '>=') Then Result := vlValue1 >= vlValue2
    Else If (strOperador = '<=') Then Result := vlValue1 <= vlValue2
    Else If (strOperador = '>' ) Then Result := vlValue1 > vlValue2
    Else If (strOperador = '<' ) Then Result := vlValue1 < vlValue2
    Else Result := False;
    Break;
    End;
  End;
end;

//----------------------------------------------------------------------------------------------------------------------

function SICC_LoadFileCSV( peBreakOnError : Boolean;
                           peStrFileName : String;
                           peCharSeparator : Char;
                           peTABLE_NAME,
                           peCVE_FOLIO,
                           peCOLUMN_NAME_FOLIO : String;
                           peArrayExportCol : TArrayExportCol;
                           var psCountReg : Integer;
                           peApli : TInterApli;
                           var psDescProc : String;
                           LabelCounter : TLabel;
                           ProgressBar : TProgressBar;
                           strExpValida : String = ''
                           ) : Boolean;
var F : TextFile;
    vlstr, vlstrTemp, vlstrData, vlstrBuffer, vlstrValue,
    vlstrColumnName, vlstrParamName, vlstrMsg, vlstrTempValue  : String;
    ATitles, AData : TArrayString;
    I, J, vlnValue, vlNUM_FOLIO, vlnCount,
    vlnCountErrors, vlnColTitle, vlnColTitleFound, vlnCountRegister : Integer;
    vldValue : Double;
    vlQryInsert : TQuery;
    vlBHaveData, vlBProcesaRegistro : Boolean;
begin
  Result := False; psDescProc := ''; vlnCountErrors := 0;
  // Valida que el Archivo Exista
  If Not FileExists(peStrFileName) Then
   Begin
   psDescProc := 'El Archivo "'+peStrFileName+'" no se encontró o no existe en la ubicación especificada.';
   Exit;
   End;

  // Si se indico el control de Progress Bar, entonces inicializa sus valores
  If Assigned(ProgressBar) Then
    Begin
    ProgressBar.Position := 0;
    ProgressBar.Min      := 0;
    vlnCountRegister := FileCountCRLF(peStrFileName);
    ProgressBar.Max      := 0;
    // Verifica que haya encontrado registros
    If (vlnCountRegister > 0) Then
     ProgressBar.Max := vlnCountRegister - 1 // Se le resta uno por el registro de cabecera
    Else If (vlnCountRegister = 0) Then
     Begin
     psDescProc := 'El Archivo "'+peStrFileName+'" no tiene registros, favor de verificar.'+coCRLF;
     Exit;
     End
    Else
     Begin
     psDescProc := 'El Archivo "'+peStrFileName+'" se encuentra abierto por otra aplicación.'+coCRLF+
                   'Por favor, en la otra aplicación, cierre el archivo para poder continuar.';
     Exit;
     End;
    End;

  // Valida que la tabla sea válida y obtiene el tipo de dato de la columna correspondiente
  If Not SICC_ValidTable(peTABLE_NAME, peArrayExportCol, peApli, psDescProc) Then
   Begin
   Exit;
   End;

  // Prepara el Query para insertar la información
  If Not SICC_QueryPrepare( peCOLUMN_NAME_FOLIO, peTABLE_NAME, peArrayExportCol,
                            peApli, vlQryInsert, psDescProc) Then
   Begin
   psDescProc := 'Problemas al prepare el Query para insertar en la tabla de "'+peTABLE_NAME+'".';
   Exit;
   End;

  // Inicia la Carga de Datos
  Try
   AssignFile(F, peStrFileName);
   Reset(F);
   // Obtiene los titulos del Archivo
   ReadLn(F, vlstrBuffer);
   vlnColTitle := ParseStr2(ATitles, vlstrBuffer + peCharSeparator, peCharSeparator, True);
   // Valida que tengan datos las columnas
   vlnColTitleFound := 0;
   For J := 0 To High(ATitles) Do
    If (Trim(ATitles[J]) <> '') Then
     Inc(vlnColTitleFound);
   // Valida que tenga la cabecera de títulos el archivo
   If (vlnColTitle = 0) Or (vlnColTitleFound = 0) Then
    Begin
    psDescProc := 'No se encontraron los títulos de las columnas. Aseguresé de que existan en el archivo'+coCRLF+
                  'y que estos se encuentren en el 1er renglón.';
    Exit;
    End;

   // Asigna los indices de las columnas, conforme el Archivo de Excel
   SICC_GetIndexCol( ATitles, peArrayExportCol );

   // Evita un Error al llamar el SparseStr2
   vlstr := '';
   For I := 0 To vlnColTitle Do
    vlstr := vlstr + peCharSeparator;

   vlnCount := 0;
   While Not Eof(F) Do
    Begin
    ReadLn(F, vlstrBuffer);
    // Si tiene datos el registro a leer, entonces...
    If (ParseStr2(AData, vlstrBuffer + vlstr, peCharSeparator, True) > 0) Then
       Begin
        // Si existe una expresión para válidar el registro antes de continuar, entonces...
        If (strExpValida <> '') Then
         vlBProcesaRegistro := RegistroValido(ATitles, AData, strExpValida, peArrayExportCol)
        Else
         vlBProcesaRegistro := True;
       End
    Else
       vlBProcesaRegistro := False;    

    // Si el registro es Válido, entonces...
    If vlBProcesaRegistro Then
       Begin
        // Asigna los valores
        vlBHaveData := False;
        For I := 0 To High(peArrayExportCol) Do
           Begin
             vlstrColumnName := peArrayExportCol[I].ORA_COLUMN_NAME;
             vlstrParamName  := 'V' + vlstrColumnName;

             // Si no es un dato que provenga del Archivo de Excel, entonces...
             If (peArrayExportCol[I].CSV_COLUMN_NAME = C_NO_COL_EXCEL) Then
              Begin
                 // Asigna el Valor Default
                 Case (peArrayExportCol[I].ORA_FIELD_TYPE)Of
                   ftInteger   : vlQryInsert.ParamByName(vlstrParamName).AsInteger  := peArrayExportCol[I].DATA_DEFAULT;
                   ftFloat     : vlQryInsert.ParamByName(vlstrParamName).AsFloat    := peArrayExportCol[I].DATA_DEFAULT;
                   ftString    : vlQryInsert.ParamByName(vlstrParamName).AsString   := peArrayExportCol[I].DATA_DEFAULT;
                   ftDateTime  : vlQryInsert.ParamByName(vlstrParamName).AsDateTime := peArrayExportCol[I].DATA_DEFAULT;
                 End; // End Case
              End
             Else
              Begin
                 // Conforme al Indice de la Columna, obtiene el dato
                 vlstrData := '';
                 If (peArrayExportCol[I].CSV_COL > -1) Then
                  Begin
                  vlstrData := AData[peArrayExportCol[I].CSV_COL];
                  If (Trim(vlstrData) = '') Then
                   vlstrData := peArrayExportCol[I].DATA_DEFAULT;
                  // End If (Trim(vlstrData) = '') Then
                  End;
                 // End If

                 If (Trim(vlstrData) <> '') Then
                   vlBHaveData := True;

                 Case (peArrayExportCol[I].ORA_FIELD_TYPE)Of
                   ftInteger   : Begin
                                   vlstrTemp := TrimChar(vlstrData,'$," ');
                                   vlstrTempValue := peArrayExportCol[I].DATA_DEFAULT;
                                   If (vlstrTemp = '') And (vlstrTempValue = '') Then
                                    Begin
                                    // Asigna NULL a la VARIABLE
                                    vlQryInsert.ParamByName(vlstrParamName).Value := '';
                                    vlQryInsert.ParamByName(vlstrParamName).Clear;
                                    vlQryInsert.ParamByName(vlstrParamName).Bound := True;
                                    End
                                   Else
                                    Begin
                                     If (vlstrTemp = '') And (vlstrTempValue <> '') Then
                                      vlnValue := peArrayExportCol[I].DATA_DEFAULT
                                     Else
                                      SICC_IsInteger(vlstrTemp, vlnValue);
                                     vlQryInsert.ParamByName(vlstrParamName).AsInteger  := vlnValue;
                                    End;
                                 End;
                   ftFloat     : Begin
                                   vlstrTemp := TrimChar(vlstrData,'$," ');
                                   vlstrTempValue := peArrayExportCol[I].DATA_DEFAULT;
                                   If (vlstrTemp = '') And (vlstrTempValue = '') Then
                                    Begin
                                    // Asigna NULL a la VARIABLE
                                    vlQryInsert.ParamByName(vlstrParamName).Value := '';
                                    vlQryInsert.ParamByName(vlstrParamName).Clear;
                                    vlQryInsert.ParamByName(vlstrParamName).Bound := True;
                                    End
                                   Else
                                    Begin
                                     If (vlstrTemp = '') And (vlstrTempValue <> '') Then
                                      vldValue := peArrayExportCol[I].DATA_DEFAULT
                                     Else
                                      SICC_IsFloat(vlstrTemp, vldValue);
                                     vlQryInsert.ParamByName(vlstrParamName).AsFloat    := vldValue;
                                    End; 
                                 End;
                   ftString    : Begin
                                  vlstrTemp := TrimCharLR(vlstrData,'" ');
                                  vlstrTempValue := peArrayExportCol[I].DATA_DEFAULT;
                                  // Si no está vacío, entonces...
                                  If (vlstrTemp = '') And (vlstrTempValue = '') Then
                                   Begin
                                   // Asigna NULL a la VARIABLE
                                   vlQryInsert.ParamByName(vlstrParamName).AsString := '';
                                   End
                                  Else
                                   Begin
                                    If (vlstrTemp = '') And (vlstrTempValue <> '') Then
                                      vlstrValue := peArrayExportCol[I].DATA_DEFAULT
                                    Else
                                      vlstrValue := Copy(vlstrTemp, 1, peArrayExportCol[I].ORA_DATA_SIZE);
                                   vlQryInsert.ParamByName(vlstrParamName).AsString := vlstrValue
                                   End; 
                                 End;
                   ftDateTime  : Begin
                                 SICC_IsDate(vlstrData, vldValue);
                                 If (vldValue = 0) Then
                                  Begin
                                  // Asigna NULL a la VARIABLE
                                  vlQryInsert.ParamByName(vlstrParamName).Value := '';
                                  vlQryInsert.ParamByName(vlstrParamName).Clear;
                                  vlQryInsert.ParamByName(vlstrParamName).Bound := True;
                                  End
                                 Else
                                  vlQryInsert.ParamByName(vlstrParamName).AsDateTime := vldValue;
                                 End;
                 End; // End Case
              End; // End If (peArrayExportCol[I].CSV_COLUMN_NAME = C_NO_COL_EXCEL) Then
           End; // End For

           // Si no tiene información el Registro, continua con la siguiente línea del Archivo
           If vlBHaveData Then
              Begin
                   // Si se espcifico la columna de Folio, entonces...
                   If (Trim(peCOLUMN_NAME_FOLIO) <> '') Then
                     Begin
                     vlNUM_FOLIO := ObtenFolio(peCVE_FOLIO, psDescProc, peApli);
                     If (vlNUM_FOLIO <= 0) Then
                       Break // Termina el While
                     Else
                       // Asigna el Folio
                       vlQryInsert.ParamByName('V'+peCOLUMN_NAME_FOLIO).AsInteger := vlNUM_FOLIO;
                     End;

                   // Realiza el INSERT
                   Try
                    vlQryInsert.ExecSQL;
                   Except
                     On E : Exception Do
                      Begin
                       vlstrMsg   := 'Problemas con el Alta del Registro.'+coCRLF+
                                     e.Message+coCRLF+
                                     'Registro '+vlstrBuffer+coCRLF
                                     ;
                       psDescProc := psDescProc + coCRLF +
                                     vlstrMsg;
                       Inc(vlnCountErrors);
                       If (peBreakOnError) Then
                        Begin
                        Beep;Beep;Beep;Beep;
                        MessageDlg(vlstrMsg, mtError, [mbOk], 0);
                        Break; // Termina el While
                        End;
                      End;
                   End;
              End; // If vlBHaveData Then

           // Limpia todas las parámetros del Query, asignadole a cada uno de ellos NULL
           For I := 0 To vlQryInsert.Params.Count - 1 Do
             vlQryInsert.Params[I].Clear;

       End; // If RegistroValido(ATitles, AData, strExpValida, peArrayExportCol) Then
      // If (strExpValida <> '') Then

      // Libera Memoria
      SetLength(AData, 0);
      Inc(vlnCount);
      If Assigned(LabelCounter) Then
        LabelCounter.Caption := IntToStr(vlnCount);
      If Assigned(ProgressBar) Then
        ProgressBar.Position := vlnCount;

      Application.ProcessMessages;
    End;

  If (vlnCountErrors > 0) Then
    Begin
    Beep; Beep; Beep;
    vlstrMsg := ' Se encontraron errores al realizar la carga del Archivo.'+coCRLF+
                ' No se pudieron cargar '+IntToStr(vlnCountErrors)+' registros.'+coCRLF+
                ' Favor de revisar comentarios y el archivo que se solicito cargar.';
    MessageDlg(vlstrMsg, mtError, [mbOk], 0);
    psDescProc := psDescProc + coCRLF + vlstrMsg;
    End;
  Result := True;
  Finally
  // Libera Memoria
   SetLength(ATitles, 0);
   CloseFile(F);
  End;
end;

//----------------------------------------------------------------------------------------------------------------------

function StpArmaDatos( pestrStoredProcName  : String;
                       peID_SICC_CONF       : Integer;
                       peCVE_USU_ALTA       : String;
                       peF_ALTA             : TDateTime;
                       peB_COMMIT           : String;
                       var psRESULTADO      : Integer;
                       var psTX_RESULTADO   : String;
                       peApli : TInterApli;
                       pebMuestraError      : Boolean
                      ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;
  Stp := TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := pestrStoredProcName;
       DataBaseName   := peApli.DataBaseName;
       SessionName    := peApli.SessionName;
       Params.CreateParam(ftInteger ,'peID_SICC_CONF' ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_USU_ALTA' ,ptInput);
       Params.CreateParam(ftDateTime,'peF_ALTA'       ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'     ,ptInput);
       Params.CreateParam(ftInteger ,'psRESULTADO'    ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO' ,ptOutput);

       ParamByName('peID_SICC_CONF').AsInteger := peID_SICC_CONF;
       ParamByName('peCVE_USU_ALTA').AsString  := peCVE_USU_ALTA;
       ParamByName('peF_ALTA').AsDateTime      := peF_ALTA;
       ParamByName('peB_COMMIT').AsString      := peB_COMMIT;
       ExecProc;

       psRESULTADO     := ParamByName('psRESULTADO').AsInteger  ;
       psTX_RESULTADO  := ParamByName('psTX_RESULTADO').AsString;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

//----------------------------------------------------------------------------------------------------------------------
function StpCancelaRegistros( peMetodo             ,
                              peID_SICC_CONF       ,
                              peID_SICC            : Integer;
                              peCVE_MEDIO_SICC     ,  
                              peTABLE_NAME         ,
                              peB_COMMIT           : String;
                              var psRESULTADO      : Integer;
                              var psTX_RESULTADO   : String;
                              peApli : TInterApli;
                              pebMuestraError      : Boolean
                            ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRSICC.STP_SICC_CANC_REGISTROS';
       DataBaseName   := peApli.DataBaseName;
       SessionName    := peApli.SessionName;
       Params.CreateParam(ftInteger ,'peMetodo'          ,ptInput);
       Params.CreateParam(ftInteger ,'peID_SICC_CONF'    ,ptInput);
       Params.CreateParam(ftInteger ,'peID_SICC'         ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_MEDIO_SICC'  ,ptInput);
       Params.CreateParam(ftString  ,'peTABLE_NAME'      ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_USU_MODIFICA',ptInput);
       Params.CreateParam(ftDateTime,'peF_MODIFICA'      ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'     ,ptInput);
       Params.CreateParam(ftInteger ,'psRESULTADO'    ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO' ,ptOutput);

       ParamByName('peMetodo').AsInteger            := peMetodo;
       ParamByName('peID_SICC_CONF').AsInteger      := peID_SICC_CONF;
       ParamByName('peID_SICC').AsInteger           := peID_SICC;
       ParamByName('peCVE_MEDIO_SICC').AsString     := peCVE_MEDIO_SICC;
       ParamByName('peTABLE_NAME').AsString         := peTABLE_NAME;
       ParamByName('peCVE_USU_MODIFICA').AsString   := peApli.Usuario;
       ParamByName('peF_MODIFICA').AsDateTime       := peApli.DameFechaEmpresa;
       ParamByName('peB_COMMIT').AsString           := peB_COMMIT;
       ExecProc;

       psRESULTADO     := ParamByName('psRESULTADO').AsInteger  ;
       psTX_RESULTADO  := ParamByName('psTX_RESULTADO').AsString;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

//----------------------------------------------------------------------------------------------------------------------

function StpRegistrosReportados(  peID_SICC_CONF       : Integer;
                                  peTABLE_NAME         ,
                                  peB_COMMIT           : String;
                                  var psRESULTADO      : Integer;
                                  var psTX_RESULTADO   : String;
                                  peApli : TInterApli;
                                  pebMuestraError      : Boolean
                                ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRSICC.STP_SICC_REGISTROS_REP';
       DataBaseName   := peApli.DataBaseName;
       SessionName    := peApli.SessionName;
       Params.CreateParam(ftInteger ,'peID_SICC_CONF'    ,ptInput);
       Params.CreateParam(ftString  ,'peTABLE_NAME'      ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'     ,ptInput);
       Params.CreateParam(ftInteger ,'psRESULTADO'    ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO' ,ptOutput);

       ParamByName('peID_SICC_CONF').AsInteger      := peID_SICC_CONF;
       ParamByName('peTABLE_NAME').AsString         := peTABLE_NAME;
       ParamByName('peB_COMMIT').AsString           := peB_COMMIT;
       ExecProc;

       psRESULTADO     := ParamByName('psRESULTADO').AsInteger  ;
       psTX_RESULTADO  := ParamByName('psTX_RESULTADO').AsString;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

//----------------------------------------------------------------------------------------------------------------------
function StpCambiaBanderaRegistros( peMetodo             ,
                                    peID_SICC_CONF       ,
                                    peID_SICC            : Integer;
                                    peB_ENVIAR_SICC      : String;
                                    peTABLE_NAME         : String;
                                    peB_COMMIT           : String;
                                    var psRESULTADO      : Integer;
                                    var psTX_RESULTADO   : String;
                                    peApli : TInterApli;
                                    pebMuestraError      : Boolean
                                  ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRSICC.STP_SICC_ENVIAR_SICC';
       DataBaseName   := peApli.DataBaseName;
       SessionName    := peApli.SessionName;

       Params.CreateParam(ftInteger ,'peMetodo'          ,ptInput);
       Params.CreateParam(ftInteger ,'peID_SICC_CONF'    ,ptInput);
       Params.CreateParam(ftInteger ,'peID_SICC'         ,ptInput);
       Params.CreateParam(ftString  ,'peB_ENVIAR_SICC'   ,ptInput);
       Params.CreateParam(ftString  ,'peTABLE_NAME'      ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_USU_MODIFICA',ptInput);       
       Params.CreateParam(ftDateTime,'peF_MODIFICA'      ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'     ,ptInput);
       Params.CreateParam(ftInteger ,'psRESULTADO'    ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO' ,ptOutput);

       ParamByName('peMetodo').AsInteger            := peMetodo;
       ParamByName('peID_SICC_CONF').AsInteger      := peID_SICC_CONF;
       ParamByName('peID_SICC').AsInteger           := peID_SICC;
       ParamByName('peB_ENVIAR_SICC').AsString      := peB_ENVIAR_SICC;
       ParamByName('peTABLE_NAME').AsString         := peTABLE_NAME;
       ParamByName('peCVE_USU_MODIFICA').AsString   := peApli.Usuario;
       ParamByName('peF_MODIFICA').AsDateTime       := peApli.DameFechaEmpresa;
       ParamByName('peB_COMMIT').AsString           := peB_COMMIT;
       ExecProc;

       psRESULTADO     := ParamByName('psRESULTADO').AsInteger  ;
       psTX_RESULTADO  := ParamByName('psTX_RESULTADO').AsString;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

//----------------------------------------------------------------------------------------------------------------------
function AsignaValoresAntesAceptar( peStrNombreFolio  : String; peApli : TInterApli;
                                    pebIsNewData : Boolean; peID_CONF : Integer;
                                    var peID_SICC_CONF    ,  peID_SICC         ,
                                        peSITUACION       ,  peCVE_MEDIO_SICC  ,
                                        peF_ALTA          ,  peCVE_USU_ALTA    ,
                                        peF_MODIFICA      ,  peCVE_USU_MODIFICA : TInterCampo
                                  ) : Boolean;
var vlstrMessage : String;
    mrResult : Word;
begin
 If pebIsNewData Then vlstrMessage := CCONFIRM_ALMACENA_INS
 Else If (peCVE_MEDIO_SICC.AsString = CMEDIO_SICC_ICRE)
         Or (peCVE_MEDIO_SICC.AsString = CMEDIO_SICC_CRED) Then
        vlstrMessage := CMSGCONFIRMMODSIS
      Else
        vlstrMessage := CCONFIRM_ALMACENA_MOD;

 mrResult := MessageDlg(vlstrMessage, mtConfirmation, [mbYes, mbNo], 0);
 Result  := mrResult = mrYes;
 If (mrResult = mrYes) Then
  If (pebIsNewData) Then
   Begin
   peID_SICC_CONF.AsInteger   := peID_CONF;
   peID_SICC.AsInteger        := ObtenFolio(peStrNombreFolio, '', peApli);
   peSITUACION.AsString       := CSIT_AC;
   peCVE_MEDIO_SICC.AsString  := CMEDIO_SICC_USU;
   peF_ALTA.AsDateTime        := peApli.DameFechaEmpresa;
   peCVE_USU_ALTA.AsString    := peApli.Usuario;
   End
  Else
   Begin
   peF_MODIFICA.AsDateTime     := peApli.DameFechaEmpresa;
   peCVE_USU_MODIFICA.AsString := peApli.Usuario;
   End;
end;

//----------------------------------------------------------------------------------------------------------------------
function StpCancelaRegCalif(  peANIO_MES           : Integer;
                              peTABLE_NAME         ,
                              peB_COMMIT           : String;
                              var psRESULTADO      : Integer;
                              var psTX_RESULTADO   : String;
                              peApli : TInterApli;
                              pebMuestraError      : Boolean
                            ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRSICC.STP_SICC_CANC_REG_CALIF';
       DataBaseName   := peApli.DataBaseName;
       SessionName    := peApli.SessionName;
       Params.CreateParam(ftInteger ,'peANIO_MES'         ,ptInput);
       Params.CreateParam(ftString  ,'peTABLE_NAME'      ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_USU_MODIFICA',ptInput);
       Params.CreateParam(ftDateTime,'peF_MODIFICA'      ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'     ,ptInput);
       Params.CreateParam(ftInteger ,'psRESULTADO'    ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO' ,ptOutput);

       ParamByName('peANIO_MES').AsInteger          := peANIO_MES;
       ParamByName('peTABLE_NAME').AsString         := peTABLE_NAME;
       ParamByName('peCVE_USU_MODIFICA').AsString   := peApli.Usuario;
       ParamByName('peF_MODIFICA').AsDateTime       := peApli.DameFechaEmpresa;
       ParamByName('peB_COMMIT').AsString           := peB_COMMIT;
       ExecProc;

       psRESULTADO     := ParamByName('psRESULTADO').AsInteger  ;
       psTX_RESULTADO  := ParamByName('psTX_RESULTADO').AsString;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

//----------------------------------------------------------------------------------------------------------------------
function StpActExpPagoAcred(  peID_SICC_CONF       : Integer;
                              peCVE_USU_MODIFICA   : String;
                              peF_MODIFICA         : TDateTime;
                              peB_COMMIT           : String;                              
                              var psRESULTADO      : Integer;
                              var psTX_RESULTADO   : String;
                              peApli : TInterApli;
                              pebMuestraError      : Boolean
                            ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRSICC.STP_ACT_EXP_PAGO_ACRED';
       DataBaseName   := peApli.DataBaseName;
       SessionName    := peApli.SessionName;
       Params.CreateParam(ftInteger ,'peID_SICC_CONF'    ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_USU_MODIFICA',ptInput);
       Params.CreateParam(ftDateTime,'peF_MODIFICA'      ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'        ,ptInput);
       Params.CreateParam(ftInteger ,'psRESULTADO'       ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'    ,ptOutput);
       // Asigna Valores
       ParamByName('peID_SICC_CONF').AsInteger      := peID_SICC_CONF;
       // Valida que no este vacio el usuario, sino asigna null
       If (Trim(peCVE_USU_MODIFICA) <> '') Then
        ParamByName('peCVE_USU_MODIFICA').AsString  := peCVE_USU_MODIFICA
       Else
        ParamByName('peCVE_USU_MODIFICA').Clear;
       // Valida que no este vacia la fecha, sino asigna null
       If (peF_MODIFICA > 0) Then
         ParamByName('peF_MODIFICA').AsDateTime     := peF_MODIFICA
       Else
         ParamByName('peF_MODIFICA').Clear;
       ParamByName('peB_COMMIT').AsString           := peB_COMMIT;
       ExecProc;

       psRESULTADO     := ParamByName('psRESULTADO').AsInteger  ;
       psTX_RESULTADO  := ParamByName('psTX_RESULTADO').AsString;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

function StpObtenRiesgoAcreditado( peID_ACREDITADO   : Integer;
                                   peCVE_TIPO_RIESGO : String;
                                   peF_REFERENCIA    : TDateTime;
                                   peApli : TInterApli;
                                   var psCVE_CALIFICACION : String
                                 ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False; psCVE_CALIFICACION := '';
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRSICC.GET_RIESGO_ACREDITADO';
       DataBaseName   := peApli.DataBaseName;
       SessionName    := peApli.SessionName;
       Params.CreateParam(ftInteger ,'peID_ACREDITADO'   ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_TIPO_RIESGO' ,ptInput);
       Params.CreateParam(ftDateTime,'peF_REFERENCIA'    ,ptInput);
       Params.CreateParam(ftString  ,'RESULT'            ,ptResult);
       // Asigna Valores
       ParamByName('peID_ACREDITADO').AsInteger    := peID_ACREDITADO;
       ParamByName('peCVE_TIPO_RIESGO').AsString   := peCVE_TIPO_RIESGO;
       ParamByName('peF_REFERENCIA').AsDateTime    := peF_REFERENCIA;
       ExecProc;
       psCVE_CALIFICACION := ParamByName('RESULT').AsString;

       vlbResult := (psCVE_CALIFICACION <> '');
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

function SendEMail(peApli : TInterApli; peSubType : TSubType; peUseInterpriseData : Boolean; peSubject, peEmail, peTo,
                   peFromAddress, peFromName: String; peFileNameToAttach : String = '') : Boolean;

  function GetServerEmail(var psIP : String; var psTX_FROM_ADDRESS : String; var psTX_FROM_NAME : String) : Boolean;
  var vlstrSQL, vlstrMsg, vlstrComa : String;
      vlQry : TQuery;
  begin
   Result := False;
   // Obtiene la dirección del POPSERVER (OUT) entre otros datos
   vlstrSQL := ' SELECT TX_QUERY_DATA, TX_FROM_ADDRESS, TX_FROM_NAME '+coCRLF+
               ' FROM EMAIL_MSG WHERE CVE_MSG = '+SQLStr('ENV_MSG')+' AND B_BLOQUEADO = '+SQLStr(CVERDAD);
   vlQry := GetSQLQuery(vlstrSQL, peApli.DataBaseName, peApli.SessionName, False);
   If Assigned(vlQry) Then
    With vlQry Do
     Begin
     psIP := FieldByName('TX_QUERY_DATA').AsString;
     psTX_FROM_ADDRESS := FieldByName('TX_FROM_ADDRESS').AsString;
     psTX_FROM_NAME := FieldByName('TX_FROM_NAME').AsString;

     // Arma un mensaje, en caso de encontrar errores en la configuración
     vlstrMsg := ''; vlstrComa := '';
     If (Trim(psIP) = '') Then
       Begin vlstrMsg := 'la IP del Correo'; vlstrComa := ','; End;
     If (Trim(psTX_FROM_ADDRESS) = '') Then
       Begin vlstrMsg := vlstrMsg + vlstrComa + 'el TX_FROM_ADDRESS'; vlstrComa := ','; End;
     If (Trim(psTX_FROM_ADDRESS) = '') Then
       Begin vlstrMsg := vlstrMsg + vlstrComa + 'el TX_FROM_NAME';  End;

     // Muestra el Error en caso de haberlo y asigna resultado
     If (vlstrMsg <> '') Then
      MessageDlg('Falta configurar '+vlstrMsg+' del Correo en EMAIL_MSG'+coCRLF+
                 'Favor de comunicarse con Sistemas.', mtError, [mbOk], 0);

     Result := (Trim(psIP) <> '') And (Trim(psTX_FROM_ADDRESS) <> '') And
               (Trim(psTX_FROM_NAME) <> '');
     End;
  end;

var aBody, aTo : TArrayString;
    I, nCountBody, nCountTo : Integer;
    vlIP, vlTX_FROM_ADDRESS, vlTX_FROM_NAME : String;

    NMSMTP1 : TNMSMTP;
begin
  Result := False;
  // Separa las direcciones que se les va a neviar en un arreglo
  nCountTo   := ParseStr(aTo, peTo, C_SEPARATOR_MAIL);
  // Separa el cuerpo del correo en un arreglo
  nCountBody := ParseStr(aBody, peEmail, #10);
  NMSMTP1 := TNMSMTP.Create(Nil);
  If Assigned(NMSMTP1) Then
    With NMSMTP1 Do
     Try
     // Si no obtiene los datos para enviar la información NO CONTINÚA
     If Not GetServerEmail(vlIP, vlTX_FROM_ADDRESS, vlTX_FROM_NAME) Then
      Begin
      Result := False;
      Exit; // Se sale de la función
      End
     Else
      Result := True;
     // Configura el Componente para realizar el envío de datos
     Host        :=  vlIP;
     Port        :=  25;
     ReportLevel :=  0;
     EncodeType  :=  uuMime;
     ClearParams :=  True;
     SubType     :=  peSubType;
     Charset     := 'OEM_CHARSET';
     Connect;
     // Asigna quien envía el correo electrónico
     If peUseInterpriseData Then
      Begin
      PostMessage.FromAddress := vlTX_FROM_ADDRESS;
      PostMessage.FromName    := vlTX_FROM_NAME;
      End
     Else
      Begin
      PostMessage.FromAddress := peFromAddress;
      PostMessage.FromName    := peFromName;
      End;
     // Asigna los destinatarios, tomandolos del arreglo
     PostMessage.ToAddress.Clear;
     For I := 0 To nCountTo-1 Do
      PostMessage.ToAddress.Add(aTo[I]);
     // Asigna el Curepo del Correo, tomandolos del arreglo
     PostMessage.Body.Clear;
     For I := 0 To nCountBody-1 Do
      PostMessage.Body.Add(aBody[I]);
     // Valida si hay algún archivo por añadir al correo
     If (Trim(peFileNameToAttach) <> '') Then
      If FileExists(peFileNameToAttach) Then
        PostMessage.Attachments.Add(peFileNameToAttach);
     // Assigna el Titulo del Correo
     PostMessage.Subject := peSubject;
     // PostMessage.Date := No se especifica el Date, esto con la finalidad de que la fecha la tome del servidor de correos
     SendMail;
     Disconnect;
     Except
      Result := False;
     End;
  If Assigned(NMSMTP1) Then NMSMTP1.Free;
end;

end.



