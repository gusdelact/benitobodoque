unit IntMQrEdoCta;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
  Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl, IntQRPreview,
  QRPrntr, Printers, IntGenCre, UnSQL2, UnTasaimp, U_InterCustomStar,
  U_InterDigDoc, Psock, NMFtp, Unzip, ZipTypes, NMsmtp,  Dialogs,  ShellApi;

type           
  TQrEdoCta = class(TQuickRep)
    qyQuery: TQuery;
    //qrlFechas: TQRLabel;    
    qrShape14: TQRShape;
    qrLabel70: TQRLabel;
    qrLabel71: TQRLabel;
    qrLabel72: TQRLabel;
    qrDBText77: TQRDBText;
    qrLabel73: TQRLabel;
    qrDBText78: TQRDBText;
    qrLabel81: TQRLabel;
    qrLabel82: TQRLabel;
    qrDBText81: TQRDBText;
    qrDBText82: TQRDBText;
    qrLabel11: TQRLabel;
    qrLabel13: TQRLabel;
    qrLabel14: TQRLabel;
    qrLabel15: TQRLabel;
    qrLabel16: TQRLabel;
    qrLabel17: TQRLabel;
    qyQueryID_CREDITO: TFloatField;
    qyQueryID_CONTRATO: TFloatField;
    qyQueryID_TITULAR: TFloatField;
    qyQueryNOMBRE: TStringField;
    qyQueryCALLE_NUMERO: TStringField;
    qyQueryCOLONIA: TStringField;
    qyQueryCVE_CIUDAD: TStringField;
    qyQueryCODIGO_POSTAL: TStringField;
    qyQueryCVE_ESTADO: TStringField;
    qyQueryCVE_PAIS: TStringField;
    qyQueryDELEGACION: TStringField;
    qyQueryESTADO: TStringField;
    qyQueryPAIS: TStringField;
    qyQueryCVE_RFC: TStringField;
    qyQueryF_ALTA: TDateTimeField;
    qyQueryTIPO_CREDITO: TStringField;
    qyQueryDESC_MONEDA: TStringField;
    qyQueryIMP_CREDITO: TFloatField;
    qyQueryDESC_TASA_INDIC: TStringField;
    qyQueryDESC_CALCULO: TStringField;
    qyQueryDESC_AMORTIZA: TStringField;
    qyQueryDESC_PAG_INTERES: TStringField;
    qyQueryF_INICIO: TDateTimeField;
    qyQueryF_VENCIMIENTO: TDateTimeField;
    qyQueryF_CORTE: TDateTimeField;
    qyQueryFOLIO_CORTE: TFloatField;
    qyQueryTASA_CREDITO_CTE: TFloatField;
    qyQueryCAP_PAG: TStringField;
    qyQueryINT_PAG: TStringField;
    qyQuerySDO_INSOLUTO_ACU: TFloatField;
    qyQuerySDO_FIN_ADIC_ACU: TFloatField;
    qyQueryIMP_AMORTIZA_ACU: TFloatField;
    qyQueryIMP_CORTE: TFloatField;
    qyQuerySDO_CORTE_ACU: TFloatField;
    qyQuerySDO_CORTE_VDO: TFloatField;
    qyQueryIMP_INTERES_CTE: TFloatField;
    qyQueryIMP_CAPITAL_CTE: TFloatField;
    qyQueryIMP_COMIS_CTE: TFloatField;
    qyQuerySDO_FIN_ADIC_CTE: TFloatField;
    qyQueryIDGRUPO: TFloatField;
    qyQueryF_VALOR: TDateTimeField;
    qyQueryID_PERIODO: TFloatField;
    qyQueryDESC_C_OPERACION: TStringField;
    qyQueryIMP_NETO: TFloatField;
    qyQuerySUMA: TFloatField;
    qyQueryCTO_DEP: TMemoField;
    qrLabel9: TQRLabel;
    qrLabel20: TQRLabel;
    qrLabel21: TQRLabel;
    qrLabel22: TQRLabel;
    qrLabel23: TQRLabel;
    qrShape3: TQRShape;
    qrShape7: TQRShape;
    qrDBText56: TQRDBText;
    qrDBText57: TQRDBText;
    qrDBText58: TQRDBText;
    qrDBText59: TQRDBText;
    qrDBText60: TQRDBText;
    qrDBText61: TQRDBText;
    qrDBText62: TQRDBText;
    qrDBText63: TQRDBText;
    qrDBText64: TQRDBText;
    qrDBText65: TQRDBText;
    qrDBText66: TQRDBText;
    qrLabel48: TQRLabel;
    qrLabel49: TQRLabel;
    qrLabel50: TQRLabel;
    qrLabel51: TQRLabel;
    qrLabel52: TQRLabel;
    qrLabel53: TQRLabel;
    qrLabel54: TQRLabel;
    qrLabel55: TQRLabel;
    qrLabel56: TQRLabel;
    qrLabel57: TQRLabel;
    qrLabel58: TQRLabel;
    qrLabel59: TQRLabel;
    qrLabel60: TQRLabel;
    qrDBText67: TQRDBText;
    qrShape4: TQRShape;
    qrShape9: TQRShape;
    qrShape13: TQRShape;
    qrLabel61: TQRLabel;
    qrLabel62: TQRLabel;
    qrLabel63: TQRLabel;
    qrLabel65: TQRLabel;
    qrLabel66: TQRLabel;
    qrDBText68: TQRDBText;
    qrDBText69: TQRDBText;
    qrDBText70: TQRDBText;
    qrLabel67: TQRLabel;
    qrDBText71: TQRDBText;
    qrDBText73: TQRDBText;
    qrLabel7: TQRLabel;
    qrLabel8: TQRLabel;
    qrLabel10: TQRLabel;
    qrShape8: TQRShape;
    qrLabel74: TQRLabel;
    qrExpr2: TQRExpr;
    FootTOTAL_DET_ADEUDO: TQRBand;
    qrShape10: TQRShape;
    qrlTotal: TQRLabel;
    PageFooterBand1: TQRBand;
    qrShape11: TQRShape;
    qrLabel2: TQRLabel;
    FootTOTAL_DET_MOVTOS: TQRBand;
    qyQueryCVE_REFERENCIA: TStringField;
    qrSuma: TQRLabel;
    qrDBText1: TQRDBText;
    qrLabel4: TQRLabel;
    qrDBText2: TQRDBText;
    qrLabel5: TQRLabel;
    qrLabel6: TQRLabel;
    qrLabel12: TQRLabel;
    qrLabel18: TQRLabel;
    qrLabel24: TQRLabel;
    qrLabel25: TQRLabel;
    qrLabel26: TQRLabel;
    qrDBText3: TQRDBText;
    qrShape12: TQRShape;
    qrLabel27: TQRLabel;
    qrLabel28: TQRLabel;
    qrLabel29: TQRLabel;
    qrLabel30: TQRLabel;
    qrDBText7: TQRDBText;
    qrExpr1: TQRExpr;
    qrExpr3: TQRExpr;
    qrDBText4: TQRDBText;
    qyQuerySDO_CORTE: TFloatField;
    qrLabel31: TQRLabel;
    qrLabel19: TQRLabel;
    qyQueryIMP_AMORT_CTE: TFloatField;
    qyQueryIMP_FIN_ADIC_PER: TFloatField;
    qrLabel32: TQRLabel;
    qyQueryFACT_MORAS: TFloatField;
    qrExpr4: TQRExpr;
    FootTOTAL_DET_PROG: TQRBand;
    qrLabel33: TQRLabel;
    qrLabel34: TQRLabel;
    qrLabel35: TQRLabel;
    qrLabel36: TQRLabel;
    qrLabel37: TQRLabel;
    qrLabel38: TQRLabel;
    qrBIVA: TQRLabel;
    qrBIVAComis: TQRLabel;
    qrLabel39: TQRLabel;
    qrShape15: TQRShape;
    qrLabel40: TQRLabel;
    qrLSumaProgramado: TQRLabel;
    qrShape1: TQRShape;
    s2DatosAcred: TQRShape;
    s1DatosAcred: TQRShape;
    qrShape6: TQRShape;
    qrDBText44: TQRDBText;
    qrLabel3: TQRLabel;
    qrDBText45: TQRDBText;
    qrDBText46: TQRDBText;
    qrDBText47: TQRDBText;
    qrDBText48: TQRDBText;
    qrDBText49: TQRDBText;
    qrDBText50: TQRDBText;
    qrDBText51: TQRDBText;
    qrDBText52: TQRDBText;
    qrDBText53: TQRDBText;
    qrDBText54: TQRDBText;
    qrDBText55: TQRDBText;
    qrLabel44: TQRLabel;
    qrLabel45: TQRLabel;
    qrLabel46: TQRLabel;
    qrLabel47: TQRLabel;
    qrLabel42: TQRLabel;
    qrGpoTitulo: TQRGroup;
    qrGpoAutoriazcion: TQRGroup;
    GpoCredito: TQRGroup;
    qrGroupDATOS: TQRGroup;
    qrGroupDETALLE_MOVTOS: TQRGroup;
    qrGroupDETALLE_ADEUDO: TQRGroup;
    qrGroupDETALLE_PROGRAMADO: TQRGroup;
    qrlFechas: TQRLabel;
    qyQueryGRUPO: TStringField;
    qyQueryTITULAR: TStringField;
    qyQueryBANCO: TStringField;
    qyQueryCONVENIOCUENTA: TStringField;
    qyQuerySUCURSAL: TStringField;
    qyQueryID_BANCO: TFloatField;
    qyQueryREFERENCIA: TStringField;
    gpo_DETPROGRAMADOS: TQRGroup;
    chil_DET_PROG: TQRChildBand;
    qrDBText12: TQRDBText;
    qrDBText13: TQRDBText;
    qrDBText14: TQRDBText;
    qrDBText19: TQRDBText;
    qrDBText20: TQRDBText;
    GPO_TIT_REF: TQRGroup;
    qrShape2: TQRShape;
    qrLabel43: TQRLabel;
    qrLabel64: TQRLabel;
    qrLabel69: TQRLabel;
    qrShape5: TQRShape;
    qrShape16: TQRShape;
    qrShape17: TQRShape;
    qrLabel75: TQRLabel;
    GPO_REF: TQRGroup;
    qrDBText6: TQRDBText;
    qrDBText8: TQRDBText;
    qrDBText9: TQRDBText;
    qrShape18: TQRShape;
    qrShape19: TQRShape;
    qrShape20: TQRShape;
    qrShape21: TQRShape;
    qrDBText10: TQRDBText;
    qrShape23: TQRShape;
    qrShape24: TQRShape;
    spCadena: TStoredProc;
    qrCadena: TQuery;
    qrLabel80: TQRLabel;
    qrLabel83: TQRLabel;
    qrLabel78: TQRLabel;
    qrLabel77: TQRLabel;
    qrLabel76: TQRLabel;
    qrShape25: TQRShape;
    qrLabel84: TQRLabel;
    qrLabel85: TQRLabel;
    qrLabel86: TQRLabel;
    qrLabel87: TQRLabel;
    qrLabel88: TQRLabel;
    qrLabel89: TQRLabel;
    qrLabel90: TQRLabel;
    qrLabel91: TQRLabel;
    qrLabel79: TQRLabel;
    qrBand1: TQRBand;
    qrLabel93: TQRLabel;
    qyQueryNCOUNT: TFloatField;
    qrshpCat: TQRShape;
    tqrmCat: TQRMemo;
    qrlblEtiCat: TQRLabel;
    qrlblTasaCat: TQRLabel;
    QRLabel68: TQRLabel;
    InterDigDoc1: TInterDigDoc;
    NMFTP1: TNMFTP;
    Memo2: TQRMemo;
    Memo1: TQRMemo;
    NMSMTP1: TNMSMTP;
    QRLabel92: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRBAux: TQRBand;
    QRIQr: TQRImage;
    qrlSelloSat: TQRLabel;
    qrlSelloTimbre: TQRLabel;
    qrlCadenaSat: TQRLabel;
    qrlCadenaTimbre: TQRLabel;
    qlrFechaTimbreLabel: TQRLabel;
    qrlCertificadoPacLabel: TQRLabel;
    qrlFechaTimbre: TQRLabel;
    qrlCertificadoPac: TQRLabel;
    qrlFolioFiscalLabel: TQRLabel;
    qrlFolioFiscal: TQRLabel;
    QrSum: TQRBand;
    QRLabel41: TQRLabel;
    QRLabel1: TQRLabel;
    lbTotAutoriz: TQRLabel;
    lbTotDispos: TQRLabel;
    QRShape22: TQRShape;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    procedure QRGroupDATOSBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRGroupDETALLE_MOVTOSBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRGroupDETALLE_ADEUDOBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FootTOTAL_DET_ADEUDOBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure DetailBandDETALLEBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure FootTOTAL_DET_ADEUDOAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure FootTOTAL_DET_PROGBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QrGpoAutoriazcionBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QrSumBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QrGpoAutoriazcionAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRGpoTituloBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure chil_DET_PROGBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure GPO_TIT_REFBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRGroupDETALLE_PROGRAMADOBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure PageFooterBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRGpoTituloAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure GPO_TIT_REFAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    sFIniRep, sFFinRep: String;
    sFechaInicial: String;
    APli: TInterApli;
    dSuma: Double;
    VLMsg: String;
    procedure HabilitaGrupos;
    procedure ProductoCtoIVA(PPIDContrato: Integer; var pBAplicaIVA: String; var PctIVA: Double);
    // </ICASE JMML 08/Septiembre/2006>   Nuevos procedimientos
    procedure MuestraCtrlsAcred;
    procedure OcultaCtrlsAcred;
    //<SISDES/> 11/2008   Control de accesos
    function ObtenAcceso: String; //SISDES

  public
    Bandera: Boolean;
    Bandera2: Boolean;
    function FormaQuery(sDisposicion, sFInicio, sFFin,
                        sGpoProd, sProducto, sSituacion,
                        sFCorte, sFolio, sAcreditado, sPromAsoc,
                        sPromAdmon, sEmpresa, sSucursal, sOrden, sEnRecup: String;
                        bUltEdoCta, bConsolidado: Boolean): String;
    procedure GeneraCat(peIdCredito: Integer; pesFCorte: String); //SST240611
    procedure ColocaCat(pePixels: Integer); //SST140711
    procedure GeneraSello(peIdCredito: Integer; peF_Corte: String) ;
    procedure ColocaSello ;
    procedure InicializaComponentes;
end;

var
  QrEdoCta: TQrEdoCta;
  // </ICASE JMML 08/Septiembre/2006>
  vgMuestraCtrl: Boolean;
  vgbConsolidado: Boolean;
  iTotAutoriz:  Integer;
  iTotDispos:  Integer;
  vgIdCredito: Integer; //SST270611
  vgsFCorte: String; //SST140711
  vgGPO_TIT_REFPage     :Integer;//17Oct2013 Hcf Para referencias y sello queden en la misma página
  vgPageFooterBand1Page :Integer;//17Oct2013 Hcf Para referencias y sello queden en la misma página

  cNomArchivoPDF    : String;
  cNomArchivoUNZIP  : String;
  cNomPathTemp      : String;
  cMascaraUnzip     : String;
  Count             : longint;
  BytesExtracted    : longint;
  CompressedSize    : longint;
  UnzippedSize      : longint;

  sDirMail : String;

  vBOffSet : Boolean;

  function RepEdoCta(sDisposicion, sFInicio, sFFin,
                     sGpoProd, sProducto, sSituacion,
                     sFCorte, sFolio, sAcreditado, sPromAsoc,
                     sPromAdmon, sEmpresa, sSucursal, sOrden: String;
                     bUltEdoCta, bConsolidado: Boolean;
                     pAPli: TInterApli; pPreview, peBManual: Boolean;
                     grOpcion  : TGenRepOption;     // NUEVO PARAMETRO PARA DIGITALIZAR REPORTE JFOF 27/12/2011
                     sArchivoDig, sEnRecup : String): String;

Implementation

procedure Report ( Retcode : longint; R : pReportRec ); stdcall;
var pct : Byte;
    R1  : Real;
begin
  WITH r^ DO BEGIN
   CASE Status of
    file_starting  :
    begin
      Application.ProcessMessages;
    end;

    file_completed :
    begin
      Application.ProcessMessages;
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

function RepEdoCta(sDisposicion, sFInicio, sFFin,
                   sGpoProd, sProducto, sSituacion,
                   sFCorte, sFolio, sAcreditado, sPromAsoc,
                   sPromAdmon, sEmpresa, sSucursal, sOrden: String;
                   bUltEdoCta, bConsolidado: Boolean;
                   pAPli: TInterApli; pPreview,peBManual: Boolean;
                   grOpcion  : TGenRepOption;      // NUEVO PARAMETRO PARA DIGITALIZAR REPORTE JFOF 27/12/2011
                   sArchivoDig, sEnRecup : String): String;   //FJR 07.06.2012  PARA PERMITIR FILTRADO DE ACREDITADOS EN RECUPERACION
var
  QrEdoCta   : TQrEdoCta;
  vlTitulo   : String;
  Preview    : TIntQRPreview;
  vlMsg      : String;
  sSql1      : String;
  Directorio : String;
  sLocalFile : String;
  sAcrobatFile : String;
  sRemoteFile  : String;
  s, d, ss : ShortString;
  Count2, nCount   : Integer;
  vlFromName, vlAviso, Valor, strAnioMes : String;

  bDigitalizaCorrecta : Boolean;
  fechaUltCorte : TDateTime;
  vlQuery:Tquery; //13Nov2013 HCF Para generar mensajes que indiquen problemas de sellado
  vlSql,          //13Nov2013 HCF Para generar mensajes que indiquen problemas de sellado
  vlDisposicion,  //13Nov2013 HCF Para generar mensajes que indiquen problemas de sellado
  vlMsgPDFConError:String; //13Nov2013 HCF Para generar mensajes que indiquen problemas de sellado
  vlMsgPdfErrores,         //13Nov2013 HCF Para generar mensajes que indiquen problemas de sellado
  vlMsgPdf        :TStringList; //13Nov2013 HCF Para generar mensajes que indiquen problemas de sellado

  function AbreConexion( pCURPATH: String): Boolean;
  begin
    Result := False;
    // Si no esta conectado abre la conexion
    if not QrEdoCta.NMFTP1.Connected then
    begin
      QrEdoCta.NMFTP1.Connect;
      QrEdoCta.NMFTP1.Mode(MODE_IMAGE);
      Result := True;
    end else begin
      QrEdoCta.NMFTP1.DoCommand('PWD');
      Result := True;
    end;

    if QrEdoCta.NMFTP1.Connected then
    Begin
      QrEdoCta.NMFTP1.ChangeDir( pCURPATH);
    End;

  end;

begin

  vlTitulo:= '';
  iTotAutoriz:= 0;
  iTotDispos:= 0;
  //</SST010711>
  if sFCorte <> '' then
    vgsFCorte:= sFCorte;
  //<SST140711/>
  vgbConsolidado:= bConsolidado;
  vlMsg:= 'Edo Cta Crédito: '  + sDisposicion + ' NO SE PUEDE GENERAR';
  vBOffSet := False;
  QrEdoCta:= TQrEdoCta.Create(Nil);

  Preview:= TIntQRPreview.CreatePreview(Application, QrEdoCta);
  try
    QrEdoCta.VLMsg:= 'OK';
    QrEdoCta.sFIniRep:= sFInicio;
    QrEdoCta.sFFinRep:= sFFin;
    QrEdoCta.APli:= pAPli;
    QrEdoCta.qyQuery.DatabaseName:= pApli.DataBaseName;
    QrEdoCta.qyQuery.SessionName:= pApli.SessionName;
    QrEdoCta.qyQuery.Active:= False;

    QrEdoCta.qrCadena.Close;
    QrEdoCta.qrCadena.SQL.Clear ;
    QrEdoCta.qrCadena.SQL.Add('SELECT NVL(VALOR, ''0'') AS VALOR FROM FAC_PARAM '+
                                 'WHERE CVE_SERIE = ''ECOL''                    '+
                                 'AND CVE_PARAM = ''FHVIGEN'' ') ;
    QrEdoCta.qrCadena.Open ;

    Valor := QrEdoCta.qrCadena.Fields[0].AsString ;

    QrEdoCta.qrCadena.Close;
    QrEdoCta.qrCadena.Sql.Clear ;
    //</SST270711>
    {sFInicio:= '01/05/2011';
    sFFin:= '31/05/2011'; //Forzar Fecha para Pruebas.}
    //<SST/>
    QrEdoCta.qyQuery.SQL.Text:= QrEdoCta.FormaQuery(sDisposicion, sFInicio, sFFin,
                                sGpoProd, sProducto, sSituacion,
                                sFCorte, sFolio, sAcreditado, sPromAsoc,
                                sPromAdmon, sEmpresa, sSucursal, sOrden, sEnRecup, bUltEdoCta,bConsolidado);
    // </ICASE JMML 08/Septiembre/2006>   Si se va a mostrar el reporte consolidado...
    if bConsolidado then
    begin
      QrEdoCta.QRGpoTitulo.Expression:= 'qyQuery.ID_TITULAR';
      QrEdoCta.QrGpoAutoriazcion.Expression:= 'qyQuery.ID_CONTRATO';
      QrEdoCta.QrGpoAutoriazcion.ForceNewPage:= True;
    end;
    // <ICASE JMML/ 08/Septiembre/2006>
    QrEdoCta.qyQuery.SQL.SaveToFile('c:\EdoCta.sql');
    QrEdoCta.qyQuery.Active:= True;

    //{13Nov2013 HCF Para generar mensajes que indiquen problemas de sellado
    //try
    //   vlQuery:=TQuery.Create(nil);
    //   vlQuery.DatabaseName:= QrEdoCta.Apli.DatabaseName;
    //   vlQuery.SessionName:= QrEdoCta.Apli.SessionName;
    //   vlDisposicion:='';
    //   vlMsgPdfErrores:=TStringList.Create;
    //   QrEdoCta.qyQuery.First;
    //   while not QrEdoCta.qyQuery.Eof do
    //   begin
    //      if (QrEdoCta.qyQuery.fieldByName('id_credito').asString<> vlDisposicion) then
    //      begin
    //         vlQuery.Close;
    //         vlQuery.SQL.Clear ;
    //         //14Nov2013 HCF el siguiente query es copia exacta del que se usa en generasello
    //         vlSql :='SELECT SIT_PROCESO, (SERIE||'' ''|| FOLIO) FOLIO, CERTIFICADO,  SELLO, CADENA, ' +
    //        ' ANO_APROBACION, NUM_APROBACION, FECHA_CREACION '+
    //        ',length(nvl(QR,''0'')) lengthQR '+
    //        //FRP     CAMPOS CFDI
    //        ' , UUID ' +
    //        ', QR '+
    //        ', SELLO_TIMBRE '+
    //        ', CADENA_TIMBRE '+
    //        //UTL_RAW.CAST_TO_VARCHAR2(cadena_timbre)
    //        ', LUGAR_EXPEDICION '+
    //       ', FECHA_TIMBRE '+
    //        ', CERTIFICADO_PAC '+
    //        ', SERIE '+
    //        //FJR 11.06.2012 AGREGADURIA PARA NUEVOS DATOS
    //        ' , DESC_MONEDA, TX_REFERENCIA, METODO_PAGO, TIPO_CAMBIO, CUENTA, REGIMEN  '+
    //        {
    //        20Nov2013  JHerminioM CarreónF  Se califican todos los objetos de la facturación electrónica (CFDI) que están en ambos esquemas (ADMIPROD) (CFDI)
    //                                          se califican con el prefijo del esquema CFDI
    //        }
    //        '  FROM CFDI.RFE_COMPROBANTE RC, CFDI.RFE_EMISOR  RE  '+
    //        '  WHERE 1=1 '+
    //        '  AND RC.SERIE_RECIBO = RE.SERIE_RECIBO '+
    //        '  AND RC.ID_EMPRESA = RE.ID_EMPRESA        '+
    //        '  AND RC.ID_CESION =RE.ID_CESION           '+
    //        '  AND RC.ID_DOCUMENTO = RE.ID_DOCUMENTO    '+
    //        '  AND RC.id_contrato = RE.ID_CONTRATO      '+
    //        '  AND RC.F_OPERACION = to_date(' + #39 + sFCorte + #39 +
    //        ' ,' + #39 + 'DD/MM/YYYY' + #39 + ') AND RE.ID_CONTRATO = ' +  QrEdoCta.qyQuery.fieldByName('id_credito').asString;
    //        vlQuery.Sql.Add(vlSql) ;
    //         vlQuery.Open ;
    //
    //         if vlQuery.IsEmpty
    //         then
    //            vlMsgPdfErrores.add('No se ha generado el estado de cuenta del credito:'+QrEdoCta.qyQuery.fieldByName('id_credito').asString+' fecha corte:'+sFCorte)
    //         else if (vlQuery.FieldByName('SIT_PROCESO').AsString <> '1' ) then
    //                  vlMsgPdfErrores.add('CFDI no procesado o con error del credito:'+QrEdoCta.qyQuery.fieldByName('id_credito').asString+' fecha corte:'+sFCorte);
    //         vlDisposicion:=QrEdoCta.qyQuery.fieldByName('id_credito').asString;
    //      end;
    //      QrEdoCta.qyQuery.next;
    //end;
    //finally
    //   QrEdoCta.qyQuery.First;
    //   freeAndNil(vlQuery);
    //end;
    //13Nov2013 HCF Para generar mensajes que indiquen problemas de sellado}

        VLMsg  := 'Edo Cta Crédito: '  + sDisposicion + ' OK ';

        If peBManual = True Then QrEdoCta.PrinterSettings.OutputBin := manual
        Else QrEdoCta.PrinterSettings.OutputBin := Auto;

      // INICIO DIGITALIZAR REPORTE JFOF 27/12/2011
{    if pPreview then
      QrEdoCta.Preview
    else
      QrEdoCta.Print;}
             {
        try//17Oct2013 Hcf Para referencias y sello queden en la misma página
            QrEdoCta.GPO_TIT_REF.ForceNewPage := False;//17Oct2013 Hcf Para referencias y sello queden en la misma página
            QrEdoCta.prepare;
           if vgGPO_TIT_REFPage <> vgPageFooterBand1Page then
            begin
               QrEdoCta.GPO_TIT_REF.ForceNewPage := True;
               QrEdoCta.Prepare;
            end;
        finally
        end;//17Oct2013 Hcf Para referencias y sello queden en la misma página
       }
      If grOpcion = grPreview Then
         QrEdoCta.Preview
      Else if grOpcion = grPrint Then
         QrEdoCta.Print
      Else if grOpcion = grDigitaliza Then
      Begin
            QrEdoCta.InterDigDoc1.RootDir  := obtValorGpoCve( 'EDOCTA', 'ROOTDIR',   pApli);
            QrEdoCta.InterDigDoc1.HostName := obtValorGpoCve( 'CONFRH', 'FTPSERVER', pApli);
            QrEdoCta.InterDigDoc1.UserName := obtValorGpoCve( 'CONFRH', 'USERNAME',  pApli);
            QrEdoCta.InterDigDoc1.Password := HexToStr(obtValorGpoCve( 'CONFRH', 'PASSWORD',  pApli));
            QrEdoCta.InterDigDoc1.SendTo   := ObtSendTo(sFFin);//ObtSendTo(sFFin); //2012/01 prueba desarrollo
            QrEdoCta.InterDigDoc1.FileName := sArchivoDig;
            QrEdoCta.PrinterSettings.PrinterIndex := QrEdoCta.InterDigDoc1.SetPrinter;
            QrEdoCta.Print;
            QrEdoCta.InterDigDoc1.SendFile;
            QrEdoCta.PrinterSettings.PrinterIndex := QrEdoCta.InterDigDoc1.RestorePrinter;
       End;
     // FIN DIGITALIZAR REPORTE JFOF  27/12/2011

     if QrEdoCta.VLMsg <> 'OK' then
      vlMsg:= QrEdoCta.vlMsg
  finally

    QrEdoCta.Free;
  end;
    vlMsgPdf:=TStringList.Create;
    vlMsgPdf.add(vlMsg);
    //vlMsgPdf.add(vlMsgPdfErrores.Text);
    vlMsg:= vlMsgPdf.text;
    //freeAndNil(vlMsgPdfErrores);
    freeAndNil(vlMsgPdf);

  RepEdoCta:= vlMsg;
end;

//</SST150611>
procedure TQrEdoCta.GeneraCat(peIdCredito: Integer; pesFCorte: String);
var
  vlFolioCorte: Integer;
  quQuery: TQuery;
  sSQL: String;
begin
  try
    {sSQL:= ' SELECT MAX(EC.FOLIO_CORTE) AS FOLIO_CORTE ' +
           ' FROM CR_EC_CREDITO EC ' +
           ' WHERE EC.ID_CREDITO = ' + IntToStr(peIdCredito) +
             ' AND EC.F_CORTE = TO_DATE(' + QuotedStr(pesFCorte) + ',' + QuotedStr('DD/MM/YYYY') + ')' +
             ' AND EC.TASA_CAT IS NOT NULL ' +
             ' AND EC.TASA_CAT <> 0 ';} //SST040811 Se cambia a llamado de bandera.
    sSQL:= ' SELECT NVL(MAX(ECU.FOLIO_CORTE), 0) AS FOLIO_CORTE ' +
           ' FROM CR_PRODUCTO_GPO GPO, CR_PRODUCTO PRO, CR_CONTRATO CON, ' +
                ' CR_CREDITO CRE, CR_EC_CREDITO ECU ' +
           ' WHERE GPO.CVE_PRODUCTO_GPO = PRO.CVE_PRODUCTO_GPO ' +
             ' AND PRO.CVE_PRODUCTO_CRE = CON.CVE_PRODUCTO_CRE ' +
             ' AND CON.ID_CONTRATO = CRE.ID_CONTRATO ' +
             ' AND CRE.ID_CREDITO = ECU.ID_CREDITO ' +
             ' AND ECU.ID_CREDITO = ' + IntToStr(peIdCredito) +
             ' AND ECU.F_CORTE = TO_DATE(' + QuotedStr(pesFCorte) + ',' + QuotedStr('DD/MM/YYYY') + ')' +
             ' AND ECU.TASA_CAT IS NOT NULL ' +
//             ' AND CRE.SIT_CREDITO = ' + QuotedStr('AC') +        
             ' AND ( (CRE.SIT_CREDITO = ''AC'') OR ( (CRE.SIT_CREDITO = ''LQ'') AND (CRE.F_LIQUIDACION <= TO_DATE(''' + pesFCorte + ''', ''DD/MM/YYYY'' ))) )' + //HERJA MAYO 2014
             ' AND GPO.B_APLICA_CAT = ' + QuotedStr('V');
    quQuery:= TQuery.Create(Self);
    quQuery.DatabaseName:= Apli.DatabaseName;
    quQuery.SessionName:= Apli.SessionName;
    quQuery.Close;
    quQuery.SQL.Text:= sSQL;
    quQuery.Open;
    vlFolioCorte:= 0;
    if quQuery <> nil then
      vlFolioCorte:= quQuery.FieldByName('FOLIO_CORTE').AsInteger;
    quQuery.Close;
    if vlFolioCorte <> 0 then
    begin
      ColocaCat(32);
      sSQL:= ' SELECT ECU.TASA_CAT, GPO.DESC_CAT_TFIJA, GPO.DESC_CAT_TVARIABLE, CRE.CVE_TASA_REFER ' +
             ' FROM CR_PRODUCTO_GPO GPO, CR_PRODUCTO PRO, CR_CONTRATO CON, ' +
               ' CR_CREDITO CRE, CR_EC_CREDITO ECU ' +
             ' WHERE GPO.CVE_PRODUCTO_GPO = PRO.CVE_PRODUCTO_GPO ' +
               ' AND PRO.CVE_PRODUCTO_CRE = CON.CVE_PRODUCTO_CRE ' +
               ' AND CON.ID_CONTRATO = CRE.ID_CONTRATO ' +
               ' AND CRE.ID_CREDITO = ECU.ID_CREDITO ' +
               ' AND CRE.ID_CREDITO = ' + IntToStr(peIdCredito) +
               ' AND ECU.F_CORTE = TO_DATE(' + QuotedStr(pesFCorte) + ',' + QuotedStr('DD/MM/YYYY') + ')' +
               ' AND ECU.FOLIO_CORTE = ' + IntToStr(vlFolioCorte);
      quQuery.SQL.Text:= sSQL;
      quQuery.Open;
      if quQuery <> nil then
      begin
        if quQuery.FieldByName('TASA_CAT').AsFloat >= 0 then
        begin
          qrlblEtiCat.Caption:= 'CAT *: ';
          qrlblTasaCat.Caption:= FormatFloat('##0.0',quQuery.FieldByName('TASA_CAT').AsFloat) + ' % Sin IVA.';
          tqrmCat.Lines.Clear;
          if quQuery.FieldByName('CVE_TASA_REFER').AsString = 'FIJA' then
            tqrmCat.Lines.Add(quQuery.FieldByName('DESC_CAT_TFIJA').AsString)
          else
            tqrmCat.Lines.Add(quQuery.FieldByName('DESC_CAT_TVARIABLE').AsString);
        end
        else
          ColocaCat(-32);
      end;
      quQuery.Close;
    end
    else
    begin
      ColocaCat(-32);
    end;
  finally
    if quQuery <> nil then
      quQuery.Free;
  end;
end;

procedure TQrEdoCta.ColocaCat(pePixels: Integer);
begin
  if pePixels < 0 then
  begin
    tqrmCat.Enabled:= False;
    qrlblEtiCat.Enabled:= False;
    qrlblTasaCat.Enabled:= False;
    if qrshpCat.Enabled = True then
      qrshpCat.Enabled:= False
    else
      pePixels:= 0;//SST030811 Se cambia el modo de no mostrar leyenda CAT
    {if QRGroupDATOS.Height = 413 then
      pePixels:= 0;}
  end
  else
  begin
    tqrmCat.Enabled:= True;
    qrlblEtiCat.Enabled:= True;
    qrlblTasaCat.Enabled:= True;
    if qrshpCat.Enabled = False then
      qrshpCat.Enabled:= True
    else
      pePixels:= 0;
    {qrshpCat.Enabled:= True;
    if QRGroupDATOS.Height <> 413 then
      pePixels:= 0;}
  end;
  if pePixels <> 0 then
  begin
    QRGroupDATOS.Height:= QRGroupDATOS.Height + pePixels;
    QRLabel61.Top:= QRLabel61.Top + pePixels;
    QRShape9.Top:= QRShape9.Top + pePixels;
    QRShape4.Top:= QRShape4.Top + pePixels;
    QRShape12.Top:= QRShape12.Top + pePixels;
    QRLabel62.Top:= QRLabel62.Top + pePixels;
    QRLabel10.Top:= QRLabel10.Top + pePixels;
    QRLabel63.Top:= QRLabel63.Top + pePixels;
    QRLabel7.Top:= QRLabel7.Top + pePixels;
    QRLabel65.Top:= QRLabel65.Top + pePixels;
    QRLabel8.Top:= QRLabel8.Top + pePixels;
    QRLabel66.Top:= QRLabel66.Top + pePixels;
    QRLabel27.Top:= QRLabel27.Top + pePixels;
    QRDBText1.Top:= QRDBText1.Top + pePixels;
    QRLabel28.Top:= QRLabel28.Top + pePixels;
    QRDBText70.Top:= QRDBText70.Top + pePixels;
    QRDBText68.Top:= QRDBText68.Top + pePixels;
    QRLabel70.Top:= QRLabel70.Top + pePixels;
    QRLabel73.Top:= QRLabel73.Top + pePixels;
    QRLabel71.Top:= QRLabel71.Top + pePixels;
    QRBIVA.Top:= QRBIVA.Top + pePixels;
    QRDBText77.Top:= QRDBText77.Top + pePixels;
    QRLabel72.Top:= QRLabel72.Top + pePixels;
    QRDBText78.Top:= QRDBText78.Top + pePixels;
    QRLabel82.Top:= QRLabel82.Top + pePixels;
    QRBIVAComis.Top:= QRBIVAComis.Top + pePixels;
    QRDBText81.Top:= QRDBText81.Top + pePixels;
    QRLabel81.Top:= QRLabel81.Top + pePixels;
    QRDBText82.Top:= QRDBText82.Top + pePixels;
    QRDBText69.Top:= QRDBText69.Top + pePixels;
    QRLabel31.Top:= QRLabel31.Top + pePixels;
    QRDBText73.Top:= QRDBText73.Top + pePixels;
    QRShape13.Top:= QRShape13.Top + pePixels;
    QRLabel67.Top:= QRLabel67.Top + pePixels;
    QRLabel5.Top:= QRLabel5.Top + pePixels;
    QRLabel6.Top:= QRLabel6.Top + pePixels;
    QRLabel12.Top:= QRLabel12.Top + pePixels;
    QRLabel18.Top:= QRLabel18.Top + pePixels;
    QRLabel24.Top:= QRLabel24.Top + pePixels;
    QRLabel4.Top:= QRLabel4.Top + pePixels;
    QRLabel29.Top:= QRLabel29.Top + pePixels;
    QRDBText2.Top:= QRDBText2.Top + pePixels;
    QRLabel30.Top:= QRLabel30.Top + pePixels;
    QRDBText71.Top:= QRDBText71.Top + pePixels;
    QRDBText7.Top:= QRDBText7.Top + pePixels;
    QRExpr1.Top:= QRExpr1.Top + pePixels;
    QRDBText4.Top:= QRDBText4.Top + pePixels;
    QRLabel25.Top:= QRLabel25.Top + pePixels;
    QRDBText3.Top:= QRDBText3.Top + pePixels;
    QRLabel26.Top:= QRLabel26.Top + pePixels;
    QRExpr3.Top:= QRExpr3.Top + pePixels;
    QRLabel68.Top:= QRLabel68.Top + pePixels;
    QRShape8.Top:= QRShape8.Top + pePixels;
    QRLabel74.Top:= QRLabel74.Top + pePixels;
    QRExpr2.Top:= QRExpr2.Top + pePixels;
    QRShape14.Top:= QRShape14.Top + pePixels;
  end;
end;
//<SST/>

// FJR 28/06/2012
Procedure TQrEdoCta.GeneraSello(peIdCredito: Integer; peF_Corte: String);
var sSQL,
    Valor,
    strAnioMes   : String  ;
    fechaUltCorte: TDatetime; 
begin

    qrCadena.DatabaseName:= Apli.DatabaseName;
    qrCadena.SessionName:= Apli.SessionName;

    qrCadena.Close;
    qrCadena.SQL.Clear ;
    qrCadena.SQL.Add('SELECT NVL(VALOR, ''0'') AS VALOR FROM FAC_PARAM '+
                                 'WHERE CVE_SERIE = ''ECOL''                    '+
                                 'AND CVE_PARAM = ''FHVIGEN'' ') ;
    qrCadena.Open ;

    Valor := qrCadena.Fields[0].AsString ;
    fechaUltCorte := IncMonth(qyQuery.FieldByname('F_CORTE').AsDatetime, -1);
    strAnioMes := formatdateTime('yyyymm', fechaUltCorte);

    qrCadena.Close;
    qrCadena.Sql.Clear ;  //FRP Se agregan campos nuevos CFDI
    sSQL := 'SELECT SIT_PROCESO, (SERIE||'' ''|| FOLIO) FOLIO, CERTIFICADO,  SELLO, CADENA, ' +
            ' ANO_APROBACION, NUM_APROBACION, FECHA_CREACION '+
            ',length(nvl(QR,''0'')) lengthQR '+
            //FRP     CAMPOS CFDI
            ' , UUID ' +
            ', QR '+
            ', SELLO_TIMBRE '+
            ', CADENA_TIMBRE '+
            //UTL_RAW.CAST_TO_VARCHAR2(cadena_timbre)
            ', LUGAR_EXPEDICION '+
            ', FECHA_TIMBRE '+
            ', CERTIFICADO_PAC '+
            ', SERIE '+
            //FJR 11.06.2012 AGREGADURIA PARA NUEVOS DATOS
            ' , DESC_MONEDA, TX_REFERENCIA, METODO_PAGO, TIPO_CAMBIO, CUENTA, REGIMEN  '+
            '  FROM CFDI.RFE_COMPROBANTE RC, CFDI.RFE_EMISOR  RE  '+
            '  WHERE 1=1 '+
            '  AND RC.SERIE_RECIBO = RE.SERIE_RECIBO '+
            '  AND RC.ID_EMPRESA = RE.ID_EMPRESA        '+
            '  AND RC.ID_CESION =RE.ID_CESION           '+
            '  AND RC.ID_DOCUMENTO = RE.ID_DOCUMENTO    '+
            '  AND RC.id_contrato = RE.ID_CONTRATO      '+
            '  AND RC.F_OPERACION = to_date(' + #39 + peF_Corte + #39 +
            ' ,' + #39 + 'DD/MM/YYYY' + #39 + ') AND RE.ID_CONTRATO = ' +  IntToStr(peIdCredito);

    qrCadena.Sql.Add(sSQL) ;
    qrCadena.SQL.SaveToFile('c:\qcfdi.sql');
    qrCadena.Open ;

    InicializaComponentes;//15Ene2014 HCF
    if qrCadena.IsEmpty or (qrCadena.FieldByName('SIT_PROCESO').asInteger<>1)then
    begin//25Nov2013 HCF No está sellado.
         {15Ene2014 HCF Ini}
         //Linea 1
         {SE DEBE VER}//QRLabel78//'Sello Digital del CFDI:'
         {SE DEBE VER}//QRLabel77//Folio
         QRLabel76.Height:=0;//qrCadena.FieldByName('SERIE').AsString  + ' ' + qrCadena.FieldByName('FOLIO').AsString ;
         //Linea 2
         QRLabel79.Height:=0;// qrCadena.FieldByName('SELLO').AsString;
         //Linea 3
         {SE DEBE VER}//QRLabel83//Cadena:
         //Linea 4
         QRLabel80.Height:=0;//qrCadena.FieldByName('CADENA').AsString;
         //Linea 5
         qrlSelloSat.Height:=0;//Sello del SAT:
         //Linea 6
         qrlSelloTimbre.Height:=0;//qrCadena.FieldByName('SELLO_TIMBRE').AsString;
         //Linea 7
         qrlCadenaSat.Height:=0;//Cadena Original del Complemento de Certificación Digital del SAT:
         //Linea 8
         qrlCadenaTimbre.Height:=0;//qrCadena.FieldByName('CADENA_TIMBRE').AsString;
         //Linea 9
         {SE DEBE VER}//QRLabel84//Año Aprobación:
         QRLabel84.Top:= 199-65;  //como si fuera cfdi
         {SE DEBE VER}//QRLabel86//No Aprobación:
         QRLabel86.Top:= 199-65;  //como si fuera cfdi
         {SE DEBE VER}//QRLabel88// 'No de Serie del Certificado del CSD: ';
         QRLabel88.Top:= 199-65;  //como si fuera cfdi
         {SE DEBE VER}//QRLabel90// Lugar. Fecha y Hora de Emisión:
         QRLabel90.Top:= 199-65;  //como si fuera cfdi
         //Linea 10
         QRLabel85.Height:=0;// qrCadena.FieldByName('ANO_APROBACION').AsString;
         QRLabel87.Height:=0;// qrCadena.FieldByName('NUM_APROBACION').AsString;
         QRLabel89.Height:=0;// qrCadena.FieldByName('CERTIFICADO').AsString;
         QRLabel91.Height:=0;// qrCadena.FieldByName('LUGAR_EXPEDICION').AsString +' '+ qrCadena.FieldByName('FECHA_CREACION').AsString;
         //Linea 11
         QRLabel92.Height:=0;// 'Régimen Fiscal :';
         QRLabel94.Height:=0;// qrCadena.FieldByName('REGIMEN').AsString;
         //Linea 12
         QRLabel95.Height:=0;// 'Método de Pago :';
         QRLabel96.Height:=0;// qrCadena.FieldByName('METODO_PAGO').AsString;
         //Linea 13
         QRLabel99.Height:=0;// 'Número de Cuenta:';
         QRLabel100.Height:=0;// qrCadena.FieldByName('CUENTA').AsString;
         //Linea 14
         QRLabel101.Height:=0;// 'Unidad de Pago :';
         QRLabel102.Height:=0;// qrCadena.FieldByName('DESC_MONEDA').AsString;
         //Linea 15
         QRLabel103.Height:=0;// 'Tipo de Cambio :';
         QRLabel104.Height:=0;// qrCadena.FieldByName('TIPO_CAMBIO').AsString;
         //Linea 16
         qrlFolioFiscalLabel.Height:=0;// 'Folio Fiscal:';
         qrlFolioFiscal.Height:=0;// qrCadena.FieldByName('UUID').AsString;
         //Linea 17
         qrlCertificadoPacLabel.Height:=0;// 'No de Serie del Certificado del SAT :';
         QRLCertificadoPac.Height:=0;// qrCadena.FieldByName('CERTIFICADO_PAC').AsString;
         //Linea 18
         qlrFechaTimbreLabel.Height:=0;// 'Fecha y Hora de Certificación:';
         qrlFechaTimbre.Height:=0;// qrCadena.FieldByName('FECHA_TIMBRE').AsString;
         {15Ene2014 HCF Fin}

         QRShape25.Height:= 150;
         PageFooterBand1.Height:= 150 ;
         QRLabel93.Top := 188;

         qrCadena.Close;
    end
    else
    begin//25nOV2013 HCF Si está sellado
      //FJR 11.06.2012 OCULTAN NUEVOS CAMPOS
      QRLabel92.Caption:= '';
      QRLabel95.Caption:= '';
      QRLabel99.Caption:= '';
      QRLabel101.Caption:= '';
      QRLabel103.Caption:= '';
      QRLabel94.Caption:= '';
      QRLabel96.Caption:= '';
      QRLabel100.Caption:= '';
      QRLabel102.Caption:= '';
      QRLabel104.Caption:= '';

      PageFooterBand1.Height:= 181 ;

      QRLabel76.Caption:= qrCadena.FieldByName('SERIE').AsString  + ' ' + qrCadena.FieldByName('FOLIO').AsString ;
      QRLabel79.Caption:= qrCadena.FieldByName('SELLO').AsString;
      QRLabel80.Caption:= qrCadena.FieldByName('CADENA').AsString;
      QRLabel85.Caption:= qrCadena.FieldByName('ANO_APROBACION').AsString;
      QRLabel87.Caption:= qrCadena.FieldByName('NUM_APROBACION').AsString;
      QRLabel89.Caption:= qrCadena.FieldByName('CERTIFICADO').AsString;
      QRLabel91.Caption:= qrCadena.FieldByName('FECHA_CREACION').AsString;

      qrlFolioFiscalLabel.Caption:= 'Folio Fiscal:';
      qrlCertificadoPacLabel.Caption:= 'No de Serie del Certificado del SAT :';
      qlrFechaTimbreLabel.Caption:= 'Fecha y Hora de Certificación:';

      //22Nov2012 HCF Campos nuevos
      if qrCadena.FieldByName('lengthQR').AsInteger>1 then
      begin
         TBlobField(qrCadena.FieldByName('QR')).SaveToFile('c:\temporal.jpg');
         QRIQr.Picture.LoadFromFile('c:\temporal.jpg');
         QRIQr.Enabled:=True;
      end;

      QRLSelloTimbre.Caption   := qrCadena.FieldByName('SELLO_TIMBRE').AsString;
      qrlCadenaTimbre.Caption  := qrCadena.FieldByName('CADENA_TIMBRE').AsString;
      qrlFechaTimbre.Caption   := qrCadena.FieldByName('FECHA_TIMBRE').AsString;
      QRLCertificadoPac.Caption:= qrCadena.FieldByName('CERTIFICADO_PAC').AsString;
      qrlFolioFiscal.Caption   := qrCadena.FieldByName('UUID').AsString;

      QRLabel92.Caption:= 'Régimen Fiscal :';
      QRLabel95.Caption:= 'Método de Pago :';
      QRLabel99.Caption:= 'Número de Cuenta:';
      QRLabel101.Caption:= 'Unidad de Pago :';
      QRLabel103.Caption:= 'Tipo de Cambio :';
      QRLabel100.Caption:= qrCadena.FieldByName('CUENTA').AsString;
      QRLabel102.Caption:= qrCadena.FieldByName('DESC_MONEDA').AsString;
      QRLabel104.Caption:= qrCadena.FieldByName('TIPO_CAMBIO').AsString;
      QRLabel94.Caption:= qrCadena.FieldByName('REGIMEN').AsString;
      QRLabel96.Caption:= qrCadena.FieldByName('METODO_PAGO').AsString;
      //FRP MUESTRAN NUEVOS CAMPOS  CFDI

      If (StrToInt(Valor) <= StrToInt(strAnioMes)) OR (TRIM(qrCadena.FieldByName('SELLO_TIMBRE').AsString) <> '') then
         begin //25Nov2013 HCF Es CFDI

            QRLabel83.Height := 0;
            QRLabel80.Height := 0;
            QRLabel78.Caption :='Sello Digital del CFDI:';
            {15Ene2014 HCF}//QRLabel88.Caption := 'No de Serie del Certificado del CSD: ';
            {15Ene2014 HCF}//QRLabel90.Caption := 'Lugar. Fecha y Hora de Emisión:';

            QRLabel91.Caption:= qrCadena.FieldByName('LUGAR_EXPEDICION').AsString +' '+ qrCadena.FieldByName('FECHA_CREACION').AsString;

            qrlSelloSat.Top            := 130-65;//qrlSelloSat.Top-vOffSet1;
            qrlSelloTimbre.Top         := 143-65;//qrlSelloTimbre.Top-vOffSet1;
            qrlCadenaSat.Top           := 157-65;//qrlCadenaSat.Top-vOffSet1;
            qrlCadenaTimbre.Top        := 170-65;//qrlCadenaTimbre.Top-vOffSet1;
            QRLabel84.Top              := 199-65;//QRLabel84.Top-vOffSet1;
            QRLabel85.Top              := 213-65;//QRLabel85.Top-vOffSet1;
            QRLabel86.Top              := 199-65;//QRLabel86.Top-vOffSet1;
            QRLabel87.Top              := 213-65;//QRLabel87.Top-vOffSet1;
            QRLabel88.Top              := 199-65;//QRLabel88.Top-vOffSet1;
            QRLabel89.Top              := 213-65;//QRLabel89.Top-vOffSet1;
            QRLabel90.Top              := 199-65;//QRLabel90.Top-vOffSet1;
            QRLabel91.Top              := 213-65;//QRLabel91.Top-vOffSet1;
            QRLabel92.Top              := 230-65;//QRLabel92.Top-vOffSet1;
            QRLabel93.Top              := 358-65;//QRLabel93.Top-vOffSet1;
            QRLabel94.Top              := 230-65;//QRLabel94.Top-vOffSet1;
            QRLabel95.Top              := 241-65;//QRLabel95.Top-vOffSet1;
            QRLabel96.Top              := 241-65;//QRLabel96.Top-vOffSet1;
            QRLabel99.Top              := 252-65;//QRLabel99.Top-vOffSet1;
            QRLabel100.Top             := 252-65;//QRLabel100.Top-vOffSet1;
            QRLabel101.Top             := 263-65;//QRLabel101.Top-vOffSet1;
            QRLabel102.Top             := 263-65;//QRLabel102.Top-vOffSet1;
            QRLabel103.Top             := 274-65;//QRLabel103.Top-vOffSet1;
            QRLabel104.Top             := 274-65;//QRLabel104.Top-vOffSet1;
            qrlFolioFiscalLabel.Top    := 286-65;//qrlFolioFiscalLabel.Top-vOffSet1;
            qrlFolioFiscal.Top         := 286-65;//qrlFolioFiscal.Top-vOffSet1;
            qrlCertificadoPacLabel.Top := 298-65;//qrlCertificadoPacLabel.Top-vOffSet1;
            qrlCertificadoPac.Top      := 298-65;//qrlCertificadoPac.Top-vOffSet1;
            qlrFechaTimbreLabel.Top    := 310-65;//qlrFechaTimbreLabel.Top-vOffSet1;
            qrlFechaTimbre.Top         := 310-65;//qrlFechaTimbre.Top-vOffSet1;
            QRIQr.Top                  := 231-65;//QRIQr.Top-vOffSet1;

            QRShape25.Height           := 321-65;//QRShape25.Height-vOffSet1;

            PageFooterBand1.Height     := 388-65;//PageFooterBand1.Height -vOffSet1  ;
         end
      else
         begin //25Nov2013 HCF Es CFD
            qrlSelloSat.Height           := 0;
            qrlSelloTimbre.Height        := 0;
            qrlCadenaSat.Height          := 0;
            qrlCadenaTimbre.Height       := 0;
            qrlFolioFiscalLabel.Height   := 0;
            qrlFolioFiscal.Height        := 0;
            qrlCertificadoPacLabel.Height:= 0;
            qrlCertificadoPac.Height     := 0;
            qlrFechaTimbreLabel.Height   := 0;
            qrlFechaTimbre.Height        := 0;

            QRLabel84.Top  := 199-69;//QRLabel84.Top-vOffSet2;
            QRLabel85.Top  := 213-69;//QRLabel85.Top-vOffSet2;
            QRLabel86.Top  := 199-69;//QRLabel86.Top-vOffSet2;
            QRLabel87.Top  := 213-69;//QRLabel87.Top-vOffSet2;
            QRLabel88.Top  := 199-69;//QRLabel88.Top-vOffSet2;
            QRLabel89.Top  := 213-69;//QRLabel89.Top-vOffSet2;
            QRLabel90.Top  := 199-69;//QRLabel90.Top-vOffSet2;
            QRLabel91.Top  := 213-69;//QRLabel91.Top-vOffSet2;
            QRLabel92.Top  := 230-69;//QRLabel92.Top-vOffSet2;
            QRLabel94.Top  := 230-69;//QRLabel94.Top-vOffSet2;
            QRLabel95.Top  := 241-69;//QRLabel95.Top-vOffSet2;
            QRLabel96.Top  := 241-69;//QRLabel96.Top-vOffSet2;
            QRLabel99.Top  := 252-69;//QRLabel99.Top-vOffSet2;
            QRLabel100.Top := 252-69;//QRLabel100.Top-vOffSet2;
            QRLabel101.Top := 263-69;//QRLabel101.Top-vOffSet2;
            QRLabel102.Top := 263-69;//QRLabel102.Top-vOffSet2;
            QRLabel103.Top := 274-69;//QRLabel103.Top-vOffSet2;
            QRLabel104.Top := 274-69;//QRLabel104.Top-vOffSet2;

            QRLabel93.Top         := 358-120;//QRLabel93.Top-vOffSet3;
            QRShape25.Height      := 321-120;//QRShape25.Height-vOffSet3;
            PageFooterBand1.Height:= 388-120;//PageFooterBand1.Height -vOffSet3 ;
         end ;

      qrCadena.Close;
    end;
end ;

Procedure TQrEdoCta.ColocaSello ;
begin
end ;
//15Ene2014 HCF
procedure TQrEdoCta.InicializaComponentes;
begin
      //Linea 1
      //QRLabel78//'Sello Digital del CFDI:'
      //QRLabel77//Folio
      QRLabel76.caption:='';//qrCadena.FieldByName('SERIE').AsString  + ' ' + qrCadena.FieldByName('FOLIO').AsString ;
      //Linea 2
      QRLabel79.caption:='';// qrCadena.FieldByName('SELLO').AsString;
      //Linea 3
      //QRLabel83//Cadena:
      //Linea 4
      QRLabel80.caption:='';//qrCadena.FieldByName('CADENA').AsString;
      //Linea 5
      //qrlSelloSat//Sello del SAT:
      //Linea 6
      qrlSelloTimbre.caption:='';//qrCadena.FieldByName('SELLO_TIMBRE').AsString;
      //Linea 7
      //qrlCadenaSat//Cadena Original del Complemento de Certificación Digital del SAT:
      //Linea 8
      qrlCadenaTimbre.Caption:='';//qrCadena.FieldByName('CADENA_TIMBRE').AsString;
      //Linea 9
      //QRLabel84//Año Aprobación:
      //QRLabel86//No Aprobación:
      //QRLabel88// No de Serie del Certificado del CSD:
      //QRLabel90// Lugar. Fecha y Hora de Emisión:
      //Linea 10
      QRLabel85.Caption:='';// qrCadena.FieldByName('ANO_APROBACION').AsString;
      QRLabel87.Caption:='';// qrCadena.FieldByName('NUM_APROBACION').AsString;
      QRLabel89.Caption:='';// qrCadena.FieldByName('CERTIFICADO').AsString;
      QRLabel91.Caption:='';// qrCadena.FieldByName('LUGAR_EXPEDICION').AsString +' '+ qrCadena.FieldByName('FECHA_CREACION').AsString;
      //Linea 11
      QRLabel92.Caption:='';// 'Régimen Fiscal :';
      QRLabel94.Caption:='';// qrCadena.FieldByName('REGIMEN').AsString;
      //Linea 12
      QRLabel95.Caption:='';// 'Método de Pago :';
      QRLabel96.Caption:='';// qrCadena.FieldByName('METODO_PAGO').AsString;
      //Linea 13
      QRLabel99.Caption:='';// 'Número de Cuenta:';
      QRLabel100.Caption:='';// qrCadena.FieldByName('CUENTA').AsString;
      //Linea 14
      QRLabel101.Caption:='';// 'Unidad de Pago :';
      QRLabel102.Caption:='';// qrCadena.FieldByName('DESC_MONEDA').AsString;
      //Linea 15
      QRLabel103.Caption:='';// 'Tipo de Cambio :';
      QRLabel104.Caption:='';// qrCadena.FieldByName('TIPO_CAMBIO').AsString;
      //Linea 16
      qrlFolioFiscalLabel.Caption:='';// 'Folio Fiscal:';
      qrlFolioFiscal.Caption   :='';// qrCadena.FieldByName('UUID').AsString;
      //Linea 17
      qrlCertificadoPacLabel.Caption:='';// 'No de Serie del Certificado del SAT :';
      QRLCertificadoPac.Caption:='';// qrCadena.FieldByName('CERTIFICADO_PAC').AsString;
      //Linea 18
      qlrFechaTimbreLabel.Caption:='';// 'Fecha y Hora de Certificación:';
      qrlFechaTimbre.Caption   :='';// qrCadena.FieldByName('FECHA_TIMBRE').AsString;
      QRIQr.Enabled:=False;
end;
// FJR 28/06/2012

Procedure TQrEdoCta.ProductoCtoIVA(PPIDContrato : Integer; var pBAplicaIVA : String; var PctIVA : Double);
var
  qyQuery: TQuery;
  sSQL: String;
begin
  sSQL:= ' SELECT PKGIMPUESTO.ObtPctIVA(CT.ID_CONTRATO) AS PCT_IVA, ' +
           ' PR.B_APLICA_IVA ' +
         ' FROM (SELECT * FROM CR_CONTRATO WHERE ID_CONTRATO = ' + IntToStr(PPIDContrato) + ') CT, ' +
           ' CR_PRODUCTO PR ' +
         ' WHERE  PR.CVE_PRODUCTO_CRE = CT.CVE_PRODUCTO_CRE ';
  qyQuery:= GetSQLQuery(sSQL, APli.DataBaseName, APli.SessionName, False);
  try
    if qyQuery <> nil then
    begin
      pBAplicaIVA:= qyQuery.FieldByName('B_APLICA_IVA').AsString;
      PctIVA:= qyQuery.FieldByName('PCT_IVA').AsFloat;
      PctIVA:=  StrToFloat(fDameIVA(qyQueryF_CORTE.AsDateTime, fmtEnt,APli));
    end
    else
    begin
      pBAplicaIVA:= 'F';
      PctIVA:= 0;
    end;
  finally
    qyQuery.Free;
  end;
end;

function TQrEdoCta.FormaQuery(sDisposicion, sFInicio, sFFin,
                              sGpoProd, sProducto, sSituacion,
                              sFCorte, sFolio, sAcreditado, sPromAsoc,
                              sPromAdmon, sEmpresa, sSucursal, sOrden, sEnRecup: String;
                              bUltEdoCta, bConsolidado: Boolean): String;
var
  sSQL1, sSQL2, sSQLCodPos: String;
begin
  if sOrden = '0' then
    sSQLCodPos:= ' CODIGO_POSTAL, '
  else
    sSQLCodPos:= ' ';


   sSQL1:= ' SELECT * FROM( '+ coCRLF +
           '     SELECT  ''A'' AS GRUPO,'+ coCRLF +
           '             CR_CREDITO.ID_CREDITO,   CR_CREDITO.ID_CONTRATO,'+ coCRLF +
           '             CONTRATO.ID_TITULAR,     PERSONA.NOMBRE,'+ coCRLF +
           '             DOMICILIO.CALLE_NUMERO,  DOMICILIO.COLONIA,'+ coCRLF +
           '             DOMICILIO.CVE_CIUDAD,    DOMICILIO.CODIGO_POSTAL,'+ coCRLF +
           '             DOMICILIO.CVE_ESTADO,    DOMICILIO.CVE_PAIS,'+ coCRLF +
           '             POBCD.DESC_POBLACION DELEGACION, EDO.DESC_POBLACION ESTADO,'+ coCRLF +
           '             PAIS.DESC_POBLACION PAIS,'+ coCRLF +
           '             RFC.SIGLAS_RFC||RFC.F_RFC||RFC.HOMOCLAVE_RFC  CVE_RFC,'+ coCRLF +
           '             CR_CREDITO.F_ALTA,       CR_PRODUCTO.DESC_L_PRODUCTO TIPO_CREDITO,'+ coCRLF +
           '             PKGCRPERIODO.STPObtChqCte(NULL,NULL,CR_CREDITO.ID_CREDITO,''AC'',''AD'',''CR'') CTO_DEP,'+ coCRLF +
           '             MONEDA.DESC_MONEDA, CR_EC_CREDITO.IMP_CREDITO,'+ coCRLF +
           '             TASA_INDIC_FINAN.DESC_TASA_INDIC,'+ coCRLF +
           '             CR_CALCULO_INT.DESC_CALCULO, CR_AMORTIZACION.DESC_AMORTIZA,'+ coCRLF +
           '             CR_PAGO_INTERES.DESC_PAG_INTERES, CR_EC_CREDITO.F_INICIO,'+ coCRLF +
           '             CR_EC_CREDITO.F_VENCIMIENTO,'+ coCRLF +
           '             CR_EC_CREDITO.F_CORTE, CR_EC_CREDITO.FOLIO_CORTE,'+ coCRLF +
           '             CR_EC_CREDITO.TASA_CREDITO_CTE,'+ coCRLF +
           '             CR_EC_CREDITO.ID_PER_K_CTE_VIG||''/''||CR_EC_CREDITO.ID_PER_K_CTE_TOT||'' con vencimiento al ''||TO_CHAR(CR_EC_CREDITO.F_VENTO_K_CTE,''DD/MM/YYYY'') CAP_PAG,'+ coCRLF +
           '             CR_EC_CREDITO.ID_PER_I_CTE_VIG||''/''||CR_EC_CREDITO.ID_PER_I_CTE_TOT||'' con vencimiento al ''||TO_CHAR(CR_EC_CREDITO.F_VENTO_I_CTE,''DD/MM/YYYY'') INT_PAG,'+ coCRLF +
           '             CR_EC_CREDITO.SDO_INSOLUTO_ACU, CR_EC_CREDITO.SDO_FIN_ADIC_ACU,'+ coCRLF +
           '             CR_EC_CREDITO.IMP_AMORTIZA_ACU, CR_EC_CREDITO.IMP_CORTE,'+ coCRLF +
           '             CR_EC_CREDITO.SDO_CORTE_ACU, CR_EC_CREDITO.SDO_CORTE_VDO,'+ coCRLF +
           '             CR_EC_CREDITO.SDO_INSOLUTO_ACU + CR_EC_CREDITO.SDO_FIN_ADIC_CTE - (CR_EC_CREDITO.IMP_CAPITAL_CTE + CR_EC_CREDITO.SDO_FIN_ADIC_CTE)  AS SDO_CORTE,'+ coCRLF +
           '             CR_EC_CREDITO.IMP_INTERES_CTE, CR_EC_CREDITO.IMP_CAPITAL_CTE,'+ coCRLF +
           '             CR_EC_CREDITO.IMP_COMIS_CTE, CR_EC_CREDITO.SDO_FIN_ADIC_CTE,'+ coCRLF +
           '             CR_PRODUCTO.CVE_PRODUCTO_CRE, CR_PRODUCTO.ID_EMPRESA,'+ coCRLF +
           '             DECODE(CR_EC_DETALLE_CR.CVE_TIPO_MOVTO,''VE'',2,''VI'',1,''SD'',3,0) AS IDGRUPO, '+ coCRLF +
           '             CR_EC_DETALLE_CR.F_TRANSACCION AS F_VALOR,'+ coCRLF +
           '             CR_EC_DETALLE_CR.CVE_REFERENCIA,'+ coCRLF +
           '             CR_EC_DETALLE_CR.ID_PERIODO ID_PERIODO,'+ coCRLF +
           '             CR_EC_DETALLE_CR.DESC_OPERACION AS DESC_C_OPERACION,'+ coCRLF +
//HERJA 18.01.2011
           '            (ROWNUM) AS NCOUNT, '+ coCRLF +
//FIN HERJA 18.01.2011

           '             CR_EC_DETALLE_CR.IMP_CONCEPTO AS IMP_NETO,'+ coCRLF +
           '             CR_EC_CREDITO.IMP_FIN_ADIC_PER,'+ coCRLF +
           '             CR_EC_CREDITO.IMP_AMORT_CTE,'+ coCRLF +
           '             CR_CREDITO.FACT_MORAS, '+ coCRLF +
           '             '' '' AS TITULAR,'' '' AS BANCO, '' '' AS CONVENIOCUENTA,'+coCRLF +
           '             '' '' AS SUCURSAL, 0 AS ID_BANCO,'+coCRLF +
           '             '' '' AS REFERENCIA'+coCRLF +
//FJR 05.06.2012 EXCLUSION DE ACREDITADOS EN RECUPERACION
           '              --FJR FILTRADO DE ACREDITADO EN RECUPERACION                         '+coCRLF +
           '             ,(SELECT (CASE WHEN COUNT(ID_ACREDITADO) = 0 THEN '' ''                '+coCRLF +
           '                            WHEN COUNT(ID_ACREDITADO) > 0 THEN ''En Recuperacion'' '+coCRLF +
           '                            ELSE ''CE'' END) AS Status_1                           '+coCRLF +
           '              FROM CR_ACRE_RE                                                      '+coCRLF +
           '              WHERE CR_EC_CREDITO.F_CORTE >= F_ALTA_RECU                           '+coCRLF +
           '              AND F_BAJA_RECU IS NULL                                              '+coCRLF +
           '              AND ID_ACREDITADO = CONTRATO.ID_TITULAR                              '+coCRLF +
           '              ) AS StatusRecu                                                      '+coCRLF +
           '              --FJR FIN                                                            '+coCRLF +
//FJR 05.06.2012 FIN
           '        FROM CR_CREDITO, CR_CONTRATO, CONTRATO, PERSONA,'+ coCRLF +
           '             DOMICILIO, POBLACION POBCD, POBLACION EDO, POBLACION PAIS,'+ coCRLF +
           '             RFC, CR_PRODUCTO, MONEDA , CR_EC_CREDITO ,'+ coCRLF +
           '             TASA_INDIC_FINAN, CR_CALCULO_INT, CR_AMORTIZACION,'+ coCRLF +
           '             CR_PAGO_INTERES, CR_EC_DETALLE_CR, CR_PRODUCTO_GPO '+ coCRLF +
           '       WHERE 1 = 1'+ coCRLF ;

   If (Trim(sGpoProd)='') and (Trim(sProducto)='')and (Trim(sDisposicion)='') Then Begin
      If bUltEdoCta Then Begin
         sSQL1:= sSQL1 + ' AND CR_EC_CREDITO.FOLIO_CORTE IN (SELECT MAX(CD2.FOLIO_CORTE)'+ coCRLF +
                         '     FROM CR_EC_CREDITO CD2 '+ coCRLF +
                         '    WHERE CD2.ID_CREDITO = CR_EC_CREDITO.ID_CREDITO ' + coCRLF ;
      End Else Begin
         sSQL1:= sSQL1 + ' AND CR_EC_CREDITO.FOLIO_CORTE IN (SELECT MIN(CD2.FOLIO_CORTE)'+ coCRLF +
                         '     FROM CR_EC_CREDITO CD2 '+ coCRLF +
                         '    WHERE CD2.ID_CREDITO = CR_EC_CREDITO.ID_CREDITO '+ coCRLF ;
      End;
      If Trim(sFFin)<>'' Then
         sSQL1:= sSQL1+' AND CD2.F_CORTE = TO_DATE('''+ sFFin +''',''DD/MM/YYYY''))'
      Else  sSQL1:= sSQL1+')'+ coCRLF;
   End;

   If (Trim(sGpoProd)<>'') Or (Trim(sProducto)<>'') Then Begin
      If (Trim(sDisposicion)='') Then Begin
         If bUltEdoCta Then Begin
            sSQL1:= sSQL1 + ' AND CR_EC_CREDITO.FOLIO_CORTE IN (SELECT MAX(CD2.FOLIO_CORTE)'+ coCRLF +
                            '     FROM CR_EC_CREDITO CD2 '+ coCRLF +
                            '    WHERE CD2.ID_CREDITO = CR_EC_CREDITO.ID_CREDITO )'+ coCRLF;
         If Trim(sFFin)<>'' Then
            sSQL1:= sSQL1+' AND CR_EC_CREDITO.F_CORTE = TO_DATE('''+ sFFin +''',''DD/MM/YYYY'')';

         End Else Begin
            sSQL1:= sSQL1 + ' AND CR_EC_CREDITO.FOLIO_CORTE IN (SELECT MIN(CD2.FOLIO_CORTE)'+ coCRLF +
                            '     FROM CR_EC_CREDITO CD2 '+ coCRLF +
                            '    WHERE CD2.ID_CREDITO = CR_EC_CREDITO.ID_CREDITO )'+ coCRLF ;
         End;
      End;
   End;

   If (Trim(sDisposicion)<>'') Then Begin
      sSQL1:= sSQL1 +
            '   AND CR_CREDITO.ID_CREDITO = '+ Trim(sDisposicion)+ coCRLF ;
      If (Trim(sFCorte)<> '') Then
         sSQL1:= sSQL1 +
            '   AND CR_EC_CREDITO.F_CORTE = TO_DATE('''+ sFCorte +''',''DD/MM/YYYY'') '+ coCRLF
      Else
         sSQL1:= sSQL1 +
            '   AND CR_EC_CREDITO.F_CORTE = TO_DATE('''+ sFFin +''',''DD/MM/YYYY'') '+ coCRLF ;
      sSQL1:= sSQL1 +
            '   AND CR_EC_CREDITO.FOLIO_CORTE = '+ sFolio+ coCRLF ;
   End;
//SISDES 11/2008   Control de accesos
   sSQL1 := sSQL1 + ObtenAcceso;
//SISDES

// HEGC OCTI SE INTEGRA CLB PARA SELECCION DE MULTIGRUPOS
   If (Trim(sGpoProd)<>'') Then
//      sSQL1:= sSQL1 + '   AND CR_PRODUCTO.CVE_PRODUCTO_GPO ='''+ Trim(sGpoProd) +''''+ coCRLF ;
      sSQL1:= sSQL1 + '   AND CR_PRODUCTO.CVE_PRODUCTO_GPO IN ('+ Trim(sGpoProd) +')'+ coCRLF ;
// HEGC
//ROIM OCT SE INTEGRA CLB PARA SELECCIÓN DE MULTIPRODUCTOS
   If (Trim(sProducto)<>'') Then
      sSQL1:= sSQL1 + '   AND CR_PRODUCTO.CVE_PRODUCTO_CRE IN ('+ Trim(sProducto) +')'+ coCRLF ;
//ROIM
   If Trim(sSituacion)= '0' Then
      sSQL1:= sSQL1 + '     AND CR_CREDITO.SIT_CREDITO IN (''AC'') '+ coCRLF ;
   If Trim(sSituacion)= '1' Then
      sSQL1:= sSQL1 + '     AND CR_CREDITO.SIT_CREDITO IN (''LQ'') '+ coCRLF ;
   If Trim(sSituacion)= '2' Then
      sSQL1:= sSQL1 + '     AND CR_CREDITO.SIT_CREDITO IN (''AC'',''LQ'') '+ coCRLF ;
   If Trim(sAcreditado)<> '' Then
      sSQL1:= sSQL1 + '     AND CONTRATO.ID_TITULAR ='+ Trim(sAcreditado)+ coCRLF ;
   If Trim(sPromAsoc)<> '' Then
      sSQL1:= sSQL1 + '     AND CONTRATO.ID_PERS_ASOCIAD ='+ Trim(sPromAsoc)+ coCRLF ;
   If Trim(sPromAdmon)<> '' Then
      sSQL1:= sSQL1 + '     AND CR_CREDITO.ID_PROM_ADM ='+ Trim(sPromAdmon)+ coCRLF ;
   If Trim(sEmpresa)<> '' Then
      sSQL1:= sSQL1 + '     AND CR_PRODUCTO.ID_EMPRESA ='+ Trim(sEmpresa)+ coCRLF ;

      sSQL1:= sSQL1 +
           '         AND CR_CREDITO.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO'+ coCRLF +
           '         AND CR_CREDITO.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO'+ coCRLF +
           '         AND CR_CONTRATO.ID_CONTRATO = CONTRATO.ID_CONTRATO'+ coCRLF +
           '         AND CONTRATO.ID_TITULAR = PERSONA.ID_PERSONA'+ coCRLF +
           //'         AND PERSONA.ID_DOMICILIO = DOMICILIO.ID_DOMICILIO'+ coCRLF +//12Nov2013 HCF Para obtener domicilio con id_domicilio de contrato
           '         AND CONTRATO.ID_DOMICILIO = DOMICILIO.ID_DOMICILIO'+ coCRLF +  //12Nov2013 HCF Para obtener domicilio con id_domicilio de contrato
           '         AND DOMICILIO.CVE_CIUDAD = POBCD.CVE_POBLACION'+ coCRLF +
           '         AND DOMICILIO.CVE_ESTADO = EDO.CVE_POBLACION'+ coCRLF +
           '         AND DOMICILIO.CVE_PAIS = PAIS.CVE_POBLACION'+ coCRLF +
           '         AND CONTRATO.ID_TITULAR = RFC.ID_PERSONA'+ coCRLF +
           '         AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE'+ coCRLF +
           '         AND CR_CONTRATO.CVE_MONEDA = MONEDA.CVE_MONEDA'+ coCRLF +
           '         AND CR_CREDITO.ID_CREDITO = CR_EC_CREDITO.ID_CREDITO (+)'+ coCRLF +
           '         AND CR_EC_CREDITO.CVE_TASA_REFER = TASA_INDIC_FINAN.CVE_TASA_INDICAD(+)'+ coCRLF +
           '         AND CR_EC_CREDITO.CVE_CALCULO = CR_CALCULO_INT.CVE_CALCULO_INT(+)'+ coCRLF +
           '         AND CR_EC_CREDITO.CVE_AMORTIZACION = CR_AMORTIZACION.CVE_AMORTIZACION(+)'+ coCRLF +
           '         AND CR_EC_CREDITO.CVE_PAG_INTERES = CR_PAGO_INTERES.CVE_PAG_INTERES(+)'+ coCRLF +
           '         AND CR_EC_CREDITO.ID_CREDITO = CR_EC_DETALLE_CR.ID_CREDITO(+)'+ coCRLF +
           '         AND CR_EC_CREDITO.F_CORTE = CR_EC_DETALLE_CR.F_CORTE(+)'+ coCRLF +
           '         AND CR_EC_CREDITO.FOLIO_CORTE = CR_EC_DETALLE_CR.FOLIO_CORTE(+)'+ coCRLF +
           '         AND CR_PRODUCTO_GPO.CVE_PRODUCTO_GPO (+)= CR_PRODUCTO.CVE_PRODUCTO_GPO '+ coCRLF +
           //FJR 01/06/2012 LINEAS QUE RESTRINGEN ACCESO A TRANSACCIONES QUE NO ESTEN DENTRO DEL MISMO PERIODO DE ANALISIS
           ' --       AND CR_EC_DETALLE_CR.F_TRANSACCION > (SELECT F_CORTE FROM CR_EC_CREDITO WHERE ID_CREDITO = CR_CREDITO.ID_CREDITO AND FOLIO_CORTE = ('+sFolio+'-1) ) -- FJR 01/06/2012 LIMITE INFERIOR '+coCRLF+
           ' --	      AND ((CR_EC_DETALLE_CR.F_TRANSACCION <= CR_EC_CREDITO.F_CORTE) OR (CR_EC_DETALLE_CR.CVE_REFERENCIA = 0)) --FJR 01/06/2012 LIMITE SUPERIOR'+coCRLF+
'UNION '+ coCRLF +
           '     SELECT  ''B'' AS GRUPO,'+ coCRLF +
           '             CR_CREDITO.ID_CREDITO,   0 AS ID_CONTRATO,'+ coCRLF +
           '             CONTRATO.ID_TITULAR,     PERSONA.NOMBRE,'+ coCRLF +
           '             '' '' AS CALLE_NUMERO,  '' '' AS COLONIA,'+ coCRLF +
//ROIM OCT SE AGREGA ORDER POR CODIGO POSTAL
//           '             '' '' AS CVE_CIUDAD,    '' '' AS CODIGO_POSTAL,'+ coCRLF +
           '             '' '' AS CVE_CIUDAD,    DOMICILIO.CODIGO_POSTAL,'+ coCRLF +
//ROIM
           '             '' '' AS CVE_ESTADO,    '' '' AS CVE_PAIS,'+ coCRLF +
           '             '' '' AS DELEGACION,    '' '' AS ESTADO,'+ coCRLF +
           '             '' '' AS PAIS,          '' '' AS CVE_RFC,'+ coCRLF +
           '             CR_CREDITO.F_ALTA,    CR_PRODUCTO.DESC_L_PRODUCTO TIPO_CREDITO,'+ coCRLF +
           '             PKGCRPERIODO.STPObtChqCte(NULL,NULL,CR_CREDITO.ID_CREDITO,''AC'',''AD'',''CR'') CTO_DEP,'+ coCRLF +
           '             '' '' AS DESC_MONEDA, CR_EC_CREDITO.IMP_CREDITO,'+ coCRLF +
           '             '' '' AS DESC_TASA_INDIC, '' '' AS DESC_CALCULO, '' '' AS DESC_AMORTIZA,'+ coCRLF +
           '             '' '' AS DESC_PAG_INTERES, TO_DATE(''01/01/2000'',''DD/MM/YYYY'')  AS F_INICIO,'+ coCRLF +
           '             CR_EC_CREDITO.F_VENCIMIENTO,'+ coCRLF +
           '             CR_EC_CREDITO.F_CORTE, CR_EC_CREDITO.FOLIO_CORTE,'+ coCRLF +
           '             CR_EC_CREDITO.TASA_CREDITO_CTE,'+ coCRLF +
           '             '' '' AS CAP_PAG,'' '' AS INT_PAG,'+ coCRLF +
           '             CR_EC_CREDITO.SDO_INSOLUTO_ACU, CR_EC_CREDITO.SDO_FIN_ADIC_ACU,'+ coCRLF +
           '             CR_EC_CREDITO.IMP_AMORTIZA_ACU, CR_EC_CREDITO.IMP_CORTE,'+ coCRLF +
           '             CR_EC_CREDITO.SDO_CORTE_ACU, CR_EC_CREDITO.SDO_CORTE_VDO,'+ coCRLF +
           '             CR_EC_CREDITO.SDO_INSOLUTO_ACU + CR_EC_CREDITO.SDO_FIN_ADIC_CTE - (CR_EC_CREDITO.IMP_CAPITAL_CTE + CR_EC_CREDITO.SDO_FIN_ADIC_CTE)  AS SDO_CORTE,'+ coCRLF +
           '             CR_EC_CREDITO.IMP_INTERES_CTE, CR_EC_CREDITO.IMP_CAPITAL_CTE,'+ coCRLF +
           '             CR_EC_CREDITO.IMP_COMIS_CTE, CR_EC_CREDITO.SDO_FIN_ADIC_CTE,'+ coCRLF +
           '             CR_PRODUCTO.CVE_PRODUCTO_CRE, CR_PRODUCTO.ID_EMPRESA,'+ coCRLF +
           '             4 AS IDGRUPO, '+ coCRLF +
           '             TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_VALOR,'+ coCRLF +
           '             '' '' AS CVE_REFERENCIA,'+ coCRLF +
           '             0 AS ID_PERIODO,'+ coCRLF +
           '             '' '' AS DESC_C_OPERACION,'+ coCRLF +
//HERJA 18.01.2011
           '            (0) AS NCOUNT, '+ coCRLF +
//FIN HERJA 18.01.2011
           '             0 AS IMP_NETO,'+ coCRLF +
           '             CR_EC_CREDITO.IMP_FIN_ADIC_PER,'+ coCRLF +
           '             CR_EC_CREDITO.IMP_AMORT_CTE,'+ coCRLF +
           '             CR_CREDITO.FACT_MORAS,'+ coCRLF +
           '             P.NOMBRE AS TITULAR,NOM_INET AS BANCO,'+coCRLF +
           '		 CVE_CONVENIO AS CONVENIOCUENTA,'+coCRLF +
           '		 CVE_SUC_BANCO AS SUCURSAL,'+coCRLF +
           '             ID_BANCO_CHQRA AS ID_BANCO,'+coCRLF +
           '             to_char(PKGDIGVRF.FUNDIGVRFREFNUM(NVL(PKGCRPERIODO.STPObtChqCte(NULL,NULL,CR_CREDITO.ID_CREDITO,''AC'',''AD'',''CR''),0), SCP.ID_METODO)) AS '+coCRLF +
//ROIM OCT SE AGREGA ORDER POR CODIGO POSTAL
//           '  FROM CR_EC_CREDITO, CR_CREDITO, CR_CONTRATO, CR_PRODUCTO, CONTRATO,PERSONA, '+coCRLF +
//FJR 05.06.2012 EXCLUSION DE ACREDITADOS EN RECUPERACION
           '              --FJR FILTRADO DE ACREDITADO EN RECUPERACION                         '+coCRLF +
           '             ,(SELECT (CASE WHEN COUNT(ID_ACREDITADO) = 0 THEN '' ''                '+coCRLF +
           '                            WHEN COUNT(ID_ACREDITADO) > 0 THEN ''En Recuperacion'' '+coCRLF +
           '                            ELSE ''CE'' END) AS Status_1                           '+coCRLF +
           '              FROM CR_ACRE_RE                                                      '+coCRLF +
           '              WHERE CR_EC_CREDITO.F_CORTE >= F_ALTA_RECU                           '+coCRLF +
           '              AND F_BAJA_RECU IS NULL                                              '+coCRLF +
           '              AND ID_ACREDITADO = CONTRATO.ID_TITULAR                              '+coCRLF +
           '              ) AS StatusRecu                                                      '+coCRLF +
           '              --FJR FIN                                                            '+coCRLF +
//FJR 05.06.2012 FIN
           '  FROM CR_EC_CREDITO, CR_CREDITO, CR_CONTRATO, CR_PRODUCTO, CONTRATO,PERSONA,DOMICILIO, '+coCRLF +
//ROIM
           '      (SELECT ID_EMPRESA, CVE_CONVENIO, ID_BANCO_CHQRA, CVE_SUC_BANCO, ID_METODO'+coCRLF +
           '       FROM SC_CHEQRA_PROPIA'+coCRLF +
           '       WHERE ID_EMPRESA = '+ sEmpresa +coCRLF +
           '           AND B_DEP_REFER  = ''V'''+coCRLF +
           '           AND SIT_CHEQUERA = ''AC'') SCP,'+coCRLF +
           '      (SELECT ID_INTERMEDIARIO, NOM_INET'+coCRLF +
           '        FROM INTERMEDIARIO) I,  PERSONA P'+coCRLF +
           '  WHERE I.ID_INTERMEDIARIO = SCP.ID_BANCO_CHQRA'+coCRLF +
           '    AND P.ID_PERSONA = SCP.ID_EMPRESA'+coCRLF;
   If (Trim(sGpoProd)='') and (Trim(sProducto)='')and (Trim(sDisposicion)='') Then Begin
      If bUltEdoCta Then Begin
         sSQL1:= sSQL1 + ' AND CR_EC_CREDITO.FOLIO_CORTE IN (SELECT MAX(CD2.FOLIO_CORTE)'+ coCRLF +
                         '     FROM CR_EC_CREDITO CD2 '+ coCRLF +
                         '    WHERE CD2.ID_CREDITO = CR_EC_CREDITO.ID_CREDITO ' + coCRLF ;
      End Else Begin
         sSQL1:= sSQL1 + ' AND CR_EC_CREDITO.FOLIO_CORTE IN (SELECT MIN(CD2.FOLIO_CORTE)'+ coCRLF +
                         '     FROM CR_EC_CREDITO CD2 '+ coCRLF +
                         '    WHERE CD2.ID_CREDITO = CR_EC_CREDITO.ID_CREDITO '+ coCRLF ;
      End;
    if Trim(sFFin) <> '' then
      sSQL1:= sSQL1 + ' AND CD2.F_CORTE = TO_DATE('''+ sFFin +''',''DD/MM/YYYY''))'
      Else  sSQL1:= sSQL1+')'+ coCRLF;
  end;

   If (Trim(sGpoProd)<>'') Or (Trim(sProducto)<>'') Then Begin
      If (Trim(sDisposicion)='') Then Begin
         If bUltEdoCta Then Begin
            sSQL1:= sSQL1 + ' AND CR_EC_CREDITO.FOLIO_CORTE IN (SELECT MAX(CD2.FOLIO_CORTE)'+ coCRLF +
                            '     FROM CR_EC_CREDITO CD2 '+ coCRLF +
                            '    WHERE CD2.ID_CREDITO = CR_EC_CREDITO.ID_CREDITO )'+ coCRLF;
         If Trim(sFFin)<>'' Then
            sSQL1:= sSQL1+' AND CR_EC_CREDITO.F_CORTE = TO_DATE('''+ sFFin +''',''DD/MM/YYYY'')';

         End Else Begin
            sSQL1:= sSQL1 + ' AND CR_EC_CREDITO.FOLIO_CORTE IN (SELECT MIN(CD2.FOLIO_CORTE)'+ coCRLF +
                            '     FROM CR_EC_CREDITO CD2 '+ coCRLF +
                            '    WHERE CD2.ID_CREDITO = CR_EC_CREDITO.ID_CREDITO )'+ coCRLF ;
         End;
      End;
   End;

   If (Trim(sDisposicion)<>'') Then Begin
      sSQL1:= sSQL1 +
            '   AND CR_CREDITO.ID_CREDITO = '+ Trim(sDisposicion)+ coCRLF ;
      If (Trim(sFCorte)<> '') Then
         sSQL1:= sSQL1 +
            '   AND CR_EC_CREDITO.F_CORTE = TO_DATE('''+ sFCorte +''',''DD/MM/YYYY'') '+ coCRLF
    else
      sSQL1:= sSQL1 +
            '   AND CR_EC_CREDITO.F_CORTE = TO_DATE('''+ sFFin +''',''DD/MM/YYYY'') '+ coCRLF ;
      sSQL1:= sSQL1 +
            '   AND CR_EC_CREDITO.FOLIO_CORTE = '+ sFolio+ coCRLF ;
   End;

//SISDES 11/2008   Control de accesos
   sSQL1 := sSQL1 + ObtenAcceso;
//SISDES

//HEGC OCT SE INTEGRA CLB PARA SELECCIÓN DE MULTIPRODUCTOS
   If (Trim(sGpoProd)<>'') Then
//      sSQL1:= sSQL1 + '   AND CR_PRODUCTO.CVE_PRODUCTO_GPO ='''+ Trim(sGpoProd) +''''+ coCRLF ;
        sSQL1:= sSQL1 + '   AND CR_PRODUCTO.CVE_PRODUCTO_GPO IN ('+ Trim(sGpoProd) +')'+ coCRLF ;
// HEGC
//ROIM OCT SE INTEGRA CLB PARA SELECCIÓN DE MULTIPRODUCTOS
   If (Trim(sProducto)<>'') Then
      sSQL1:= sSQL1 + '   AND CR_PRODUCTO.CVE_PRODUCTO_CRE IN ('+ Trim(sProducto) +')'+ coCRLF ;
//ROIM
   If Trim(sSituacion)= '0' Then
      sSQL1:= sSQL1 + '     AND CR_CREDITO.SIT_CREDITO IN (''AC'') '+ coCRLF ;
   If Trim(sSituacion)= '1' Then
      sSQL1:= sSQL1 + '     AND CR_CREDITO.SIT_CREDITO IN (''LQ'') '+ coCRLF ;
   If Trim(sSituacion)= '2' Then
      sSQL1:= sSQL1 + '     AND CR_CREDITO.SIT_CREDITO IN (''AC'',''LQ'') '+ coCRLF ;
   If Trim(sAcreditado)<> '' Then
      sSQL1:= sSQL1 + '     AND CONTRATO.ID_TITULAR ='+ Trim(sAcreditado)+ coCRLF ;
   If Trim(sPromAsoc)<> '' Then
      sSQL1:= sSQL1 + '     AND CONTRATO.ID_PERS_ASOCIAD ='+ Trim(sPromAsoc)+ coCRLF ;
   If Trim(sPromAdmon)<> '' Then
      sSQL1:= sSQL1 + '     AND CR_CREDITO.ID_PROM_ADM ='+ Trim(sPromAdmon)+ coCRLF ;
   If Trim(sEmpresa)<> '' Then
      sSQL1:= sSQL1 + '     AND CR_PRODUCTO.ID_EMPRESA ='+ Trim(sEmpresa)+ coCRLF ;

      sSQL1:= sSQL1 +
           '    AND CR_CREDITO.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO'+ coCRLF +
           '    AND CR_CREDITO.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO'+ coCRLF +
           '    AND CR_CONTRATO.ID_CONTRATO = CONTRATO.ID_CONTRATO'+ coCRLF +
           '    AND CONTRATO.ID_TITULAR = PERSONA.ID_PERSONA'+ coCRLF +
//ROIM OCT SE AGREGA ORDER POR CODIGO POSTAL
           //'    AND DOMICILIO.ID_DOMICILIO = PERSONA.ID_DOMICILIO'+ coCRLF +//12Nov2013 HCF Para obtener domicilio con id_domicilio de contrato
           '    AND DOMICILIO.ID_DOMICILIO = CONTRATO.ID_DOMICILIO'+ coCRLF + //12Nov2013 HCF Para obtener domicilio con id_domicilio de contrato
//ROIM
           '    AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE'+ coCRLF +
           '    AND CR_CREDITO.ID_CREDITO = CR_EC_CREDITO.ID_CREDITO (+)'+ coCRLF +
           '    )TODO '+ coCRLF+
           ' WHERE 1=1 '+coCRLF;
//FJR 07.06.2012 EXCLUSION o INCLUSION DE ACREDITADOS EN RECUPERACION
        IF sEnRecup = '0' then
           sSQL2 := sSQL2 + 'AND (NOT STATUSRECU = ''En Recuperacion'') --FJR 07.06.2012 FILTRADO DE ACREDITADO EN RECUPERACION '+coCRLF;
        IF sEnRecup = '1' then
           sSQL2 := sSQL2 + 'AND (STATUSRECU = ''En Recuperacion'') --FJR 07.06.2012 FILTRADO DE ACREDITADO EN RECUPERACION '+coCRLF;

           //<EASA4011   24/08/2006      ORDENAR POR ACREDITADO Y DESPUES POR CREDITO
//           ' ORDER BY ID_CREDITO, IDGRUPO, F_VALOR,ID_PERIODO, IMP_NETO DESC '+ coCRLF ;

//ROIM OCT SE AGREGA ORDER POR CODIGO POSTAL
        If bConsolidado Then         // </ICASE JMML 08/Septiembre/2006>   Ordena por TITULAR en caso de reporte consolidado. FJR 01/06/2012 Ordenar correctamente con NCOUNT
           sSQL2 := sSQL2 + ' ORDER BY ' + sSQLCodPos + ' ID_TITULAR, ID_CONTRATO, ID_CREDITO, GRUPO, IDGRUPO, /*FJR 01/06/2012 PARA ORDENAR CORRECTAMENTE*/ NCOUNT, F_VALOR, ID_PERIODO, IMP_NETO DESC, BANCO  '
        Else
           sSQL2 := sSQL2 + ' ORDER BY ' + sSQLCodPos + ' NOMBRE, ID_CREDITO, GRUPO, IDGRUPO, /*FJR 01/06/2012 PARA ORDENAR CORRECTAMENTE*/ NCOUNT, F_VALOR,ID_PERIODO, IMP_NETO DESC, BANCO  ';
//ROIM OCT SE AGREGA ORDER POR CODIGO POSTAL

           //EASA4011 >/
   Result:= sSQL1 + sSQL2;
End;

//SISDES 11/2008   Control de accesos
Function TQrEdoCta.ObtenAcceso: String;
var vlQry : TQuery;
    vlsql : String;
    vlSalida : String;
begin
     vlSalida := '';
     vlsql:= ' SELECT B_CTRL_EDO_CTA, F_INICIO ' + coCRLF +
             ' FROM CR_CTRL_EXCEP ' + coCRLF +
             ' WHERE ID_EMPRESA  = ' + IntToStr(APli.IdEmpresa) + coCRLF +
             '   AND CVE_CTRL_EXCEP = ''EDOCTA'' ' + coCRLF ;

     vlQry := GetSQLQuery(vlsql,APli.DataBaseName, APli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
             if vlQry.FieldByName('B_CTRL_EDO_CTA').AsString = 'V' then
                vlSalida := '    AND CR_EC_CREDITO.F_CORTE >= (' + SQLFecha(vlQry.FieldByName('F_INICIO').AsDateTime) + ') ';
             //end if;
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;

     ObtenAcceso := vlSalida;
end;
//SISDES

procedure TQrEdoCta.HabilitaGrupos;
begin
    QRGroupDATOS.Enabled:= True;
    QrGpoAutoriazcion.Enabled:= True;
    GpoCredito.Enabled:= True;
    QRGroupDETALLE_MOVTOS.Enabled:= True;
    QRGroupDETALLE_ADEUDO.Enabled:= True;
    FootTOTAL_DET_MOVTOS.Enabled:= True;
    FootTOTAL_DET_ADEUDO.Enabled:= True;
    gpo_DETPROGRAMADOS.Enabled:= True;
    //</SST150711> Se quita la repetición de Proximos vencimientos.
    FootTOTAL_DET_PROG.Enabled:= True;
    QRGroupDETALLE_PROGRAMADO.Enabled:= True;
    //<SST/>
    chil_DET_PROG.Enabled:= True;
    GPO_TIT_REF.Enabled:= True;
    GPO_REF.Enabled:= True;

  if qyQuery.FieldByName('GRUPO').AsString = 'A' then
  begin
    GPO_TIT_REF.Enabled:= False;
    GPO_REF.Enabled:= False;
    if qyQuery.FieldByName('IDGRUPO').AsInteger = 0 then
    begin
      QRGroupDATOS.Enabled:= True;
      QrGpoAutoriazcion.Enabled:= True;
      GpoCredito.Enabled:= True;
      QRGroupDETALLE_MOVTOS.Enabled:= False;
      QRGroupDETALLE_ADEUDO.Enabled:= False;
      //Bandera:= False;
      FootTOTAL_DET_MOVTOS.Enabled:= False;
      FootTOTAL_DET_ADEUDO.Enabled:= False;
      gpo_DETPROGRAMADOS.Enabled:= False;
    end
       Else If ( qyQuery.FieldByName('IDGRUPO').AsInteger = 1 ) OR
               ( qyQuery.FieldByName('IDGRUPO').AsInteger = 2 ) OR
               ( qyQuery.FieldByName('IDGRUPO').AsInteger = 3 ) Then
      begin
           If qyQuery.FieldByName('IDGRUPO').AsInteger = 1 Then Begin
          QRGroupDATOS.Enabled:= True;
          QrGpoAutoriazcion.Enabled:= True;
          GpoCredito.Enabled:= True;
          QRGroupDETALLE_MOVTOS.Enabled:= True;
          QRGroupDETALLE_ADEUDO.Enabled:= False;
          //Bandera:= False;
          QRGroupDETALLE_PROGRAMADO.Enabled:= False;
          gpo_DETPROGRAMADOS.Enabled:= False;
          FootTOTAL_DET_MOVTOS.Enabled:= True;
          FootTOTAL_DET_ADEUDO.Enabled:= False;
          FootTOTAL_DET_PROG.Enabled:= False;
           End Else If qyQuery.FieldByName('IDGRUPO').AsInteger = 2 Then Begin
            QRGroupDATOS.Enabled:= True;
            QrGpoAutoriazcion.Enabled:= True;
            GpoCredito.Enabled:= True;
            QRGroupDETALLE_MOVTOS.Enabled:= False;
            QRGroupDETALLE_ADEUDO.Enabled:= True;
            //Bandera:= True;
            QRGroupDETALLE_PROGRAMADO.Enabled:= False;
            gpo_DETPROGRAMADOS.Enabled:= False;
            FootTOTAL_DET_MOVTOS.Enabled:= False;
            FootTOTAL_DET_ADEUDO.Enabled:= True;
            FootTOTAL_DET_PROG.Enabled:= False;
           End Else If qyQuery.FieldByName('IDGRUPO').AsInteger = 3 Then Begin
              QRGroupDATOS.Enabled:= True;
              QrGpoAutoriazcion.Enabled:= True;
              GpoCredito.Enabled:= True;
              QRGroupDETALLE_MOVTOS.Enabled:= False;
              QRGroupDETALLE_ADEUDO.Enabled:= False;
              //Bandera:= False;
              QRGroupDETALLE_PROGRAMADO.Enabled:= True;
              gpo_DETPROGRAMADOS.Enabled:= True;
              FootTOTAL_DET_MOVTOS.Enabled:= False;
              FootTOTAL_DET_ADEUDO.Enabled:= False;
              FootTOTAL_DET_PROG.Enabled:= True;
              chil_DET_PROG.Enabled:= True;
            end;
      end;
  end
  else
  begin
    QRGroupDATOS.Enabled:= True;
    QrGpoAutoriazcion.Enabled:= True;
    GpoCredito.Enabled:= True;
    QRGroupDETALLE_MOVTOS.Enabled:= False;
    QRGroupDETALLE_ADEUDO.Enabled:= False;
    FootTOTAL_DET_MOVTOS.Enabled:= False;
    FootTOTAL_DET_ADEUDO.Enabled:= False;
    gpo_DETPROGRAMADOS.Enabled:= False;
    //</SST150711> Se quita la repetición de Proximos vencimientos.
    FootTOTAL_DET_PROG.Enabled:= False;
    QRGroupDETALLE_PROGRAMADO.Enabled:= False;
    //<SST/>
    chil_DET_PROG.Enabled:= False;
    GPO_TIT_REF.Enabled:= True;
    GPO_REF.Enabled:= True;
  end;
end;

procedure TQrEdoCta.QRGroupDATOSBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
var
  vlDif, vlPctIVA: Double;
  vlBAplicaIVA: String;
begin
  vlDif:= (qyQuerySDO_CORTE_ACU.AsFloat - (qyQuerySDO_INSOLUTO_ACU.AsFloat + qyQuerySDO_FIN_ADIC_CTE.AsFloat - (qyQueryIMP_CAPITAL_CTE.AsFloat + qyQuerySDO_FIN_ADIC_CTE.AsFloat)));
  if 0 <> vlDif then
    vlMsg:= 'Edo Cta Crédito: '  + qyQueryID_CREDITO.AsString + ' ERROR EN SALDOS X ' + FormatFloat('###,###,###,###,###,##0.00',VLDif);
  //Se quita esta referencia ya que el apli retorna la fecha de inicio de mes pero hábil
  //Apli.Fecha.FechaReferencia := qyQuery.FieldByName('F_CORTE').AsDateTime;
  //sFechaInicial:= FormatDateTime('dd/mm/yyyy',APli.Fecha.DiaLiquidacion('IMAC'));
  sFechaInicial:=  '01' + FormatDateTime('/mm/YYYY',qyQuery.FieldByName('F_CORTE').AsDateTime);
  HabilitaGrupos;
  QRLabel68.Caption:= 'RESUMEN DE VENCIMIENTOS DEL '+ sFechaInicial + ' AL '+
                       qyQuery.FieldByName('F_CORTE').AsString;
  //qrlFechas.Caption:= 'Estado de Cuenta de Crédito del '+ sFechaInicial +' al '+
                         //qyQuery.FieldByName('F_CORTE').AsString;
  //Busca IVA
  ProductoCtoIVA(qyQueryID_CONTRATO.AsInteger, VLBAplicaIVA, VLPctIVA);
  if VLBAplicaIVA = 'V' then
    QRBIVA.Caption:= '(+ IVA ' + FormatFloat('###0',VLPctIVA) + ' % )'
  else
    QRBIVA.Caption:= ' ';
  QRBIVAComis.Caption:= '(+ IVA ' + FormatFloat('###0',VLPctIVA) + ' % )';
  iTotDispos:= iTotDispos + 1;

  vgIdCredito:= StrToInt(qyQueryID_CREDITO.AsString); //SST010711
  GeneraSello(qyQueryID_CREDITO.AsInteger, qyQueryF_CORTE.AsString) ;
//  GeneraCat(vgIdCredito, vgsFCorte); //SST010711
  GeneraCat(vgIdCredito, qyQueryF_CORTE.AsString); //HERJA MAYO 2014 
end;

procedure TQrEdoCta.QRGroupDETALLE_MOVTOSBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  //Apli.Fecha.FechaReferencia:= qyQuery.FieldByName('F_CORTE').AsDateTime;
  //sFechaInicial:= FormatDateTime('dd/mm/yyyy',APli.Fecha.DiaLiquidacion('IMAC'));
   sFechaInicial:=  '01' + FormatDateTime('/mm/YYYY',qyQuery.FieldByName('F_CORTE').AsDateTime);
  HabilitaGrupos;
  QRLabel11.Caption:= 'DETALLE DE MOVIMIENTOS DEL '+ sFechaInicial + ' AL '+
                       qyQuery.FieldByName('F_CORTE').AsString;
end;

procedure TQrEdoCta.QRGroupDETALLE_ADEUDOBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  HabilitaGrupos;
  dSuma:= 0;
end;

procedure TQrEdoCta.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  QRGroupDATOS.Enabled:= True;
  QrGpoAutoriazcion.Enabled:= True;
  GpoCredito.Enabled:= True;
  QRGroupDETALLE_MOVTOS.Enabled:= True;
  QRGroupDETALLE_ADEUDO.Enabled:= True;
  FootTOTAL_DET_MOVTOS.Enabled:= True;
  FootTOTAL_DET_ADEUDO.Enabled:= True;
  Bandera:= False;
  QRBAux.Height:=0;//08Oct2012 HCF
  //GeneraCat(vgIdCredito, vgsFCorte); //SST010711
end;

procedure TQrEdoCta.FootTOTAL_DET_ADEUDOBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlTotal.Caption:='Total de Adeudo Vencido al '+ qyQuery.FieldByName('F_CORTE').AsString;
  qrSuma.Caption:= FormatFloat('###,###,###,###,##0.00',dSuma);
end;

procedure TQrEdoCta.DetailBandDETALLEBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  dSuma:= dSuma + qyQuery.FieldByName('IMP_NETO').AsFloat;
end;

procedure TQrEdoCta.FootTOTAL_DET_ADEUDOAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  dSuma:= 0;
end;

procedure TQrEdoCta.FootTOTAL_DET_PROGBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLSumaProgramado.Caption:= FormatFloat('###,###,###,###,##0.00',dSuma);
end;

//</ICASE JMML 08/Septiembre/2006>   Nuevo procedimiento
procedure TQrEdoCta.MuestraCtrlsAcred;
begin
  s1DatosAcred.Pen.Color:= clBlack;
  s1DatosAcred.SendToBack;
  s2DatosAcred.Pen.Color:= clBlack;
  s2DatosAcred.Brush.Color:= clBlack;
  s2DatosAcred.SendToBack;
end;

// </ICASE JMML 08/Septiembre/2006>   Nuevo procedimiento
procedure TQrEdoCta.OcultaCtrlsAcred;
begin
  s1DatosAcred.BringToFront;
  s1DatosAcred.Pen.Color:= clWindow;
  s2DatosAcred.BringToFront;
  s2DatosAcred.Pen.Color:= clWindow;
  s2DatosAcred.Brush.Color:= clWindow;
end;

// </ICASE JMML 08/Septiembre/2006>   Nuevo procedimiento
procedure TQrEdoCta.QrGpoAutoriazcionBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  sFechaInicial:=  '01' + FormatDateTime('/mm/YYYY',qyQuery.FieldByName('F_CORTE').AsDateTime);
  qrlFechas.Caption:= 'Estado de Cuenta de Crédito del '+ sFechaInicial +' al '+
                       qyQuery.FieldByName('F_CORTE').AsString;
  iTotAutoriz:= iTotAutoriz + 1;
  if vgbConsolidado then
  begin
    if vgMuestraCtrl then
      QrGpoAutoriazcion.ForceNewPage:= False
    else
      QrGpoAutoriazcion.ForceNewPage:= True;
  end;
end;

// </ICASE JMML 08/Septiembre/2006>   Nuevo procedimiento
procedure TQrEdoCta.QrSumBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if vgbConsolidado then
  begin
    lbTotAutoriz.Caption:= IntToStr(iTotAutoriz);
    lbTotDispos.Caption:= IntToStr(iTotDispos);
  end
  else
  //</RAST>
  begin
    QrSum.Height:= 0;
    QRLabel41.Visible:= False;
  end;
  //<RAST/>
end;

//</ICASE JMML 08/Septiembre/2006>   Nuevo procedimiento
procedure TQrEdoCta.QrGpoAutoriazcionAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if vgbConsolidado then
  begin
    OcultaCtrlsAcred;
    vgMuestraCtrl:= False;
  end;
end;

//</ICASE JMML 08/Septiembre/2006>   Nuevo procedimiento
procedure TQrEdoCta.QRGpoTituloBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if vgbConsolidado then
  begin
    MuestraCtrlsAcred;
    vgMuestraCtrl:= True;
  end;
  QRBAux.Height:=0;//08Oct2012 HCF
end;

procedure TQrEdoCta.chil_DET_PROGBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  dSuma:= dSuma + qyQuery.FieldByName('IMP_NETO').AsFloat;
  HabilitaGrupos;
end;

procedure TQrEdoCta.GPO_TIT_REFBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  HabilitaGrupos;
end;

procedure TQrEdoCta.QRGroupDETALLE_PROGRAMADOBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  HabilitaGrupos;
end;

procedure TQrEdoCta.PageFooterBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
var
  Contador: Integer;
begin
  GPO_TIT_REF.ForceNewColumn:= False;
  Bandera:= True;
  vgPageFooterBand1Page:=pageNumber;//17Oct2013 Hcf Para referencias y sello queden en la misma página
end;

procedure TQrEdoCta.QuickRepAfterPreview(Sender: TObject);
begin
  Bandera:= False;
end;

procedure TQrEdoCta.QuickRepAfterPrint(Sender: TObject);
begin
  Bandera:= False;
end;

procedure TQrEdoCta.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PageFooterBand1.Enabled:= True;
end;

procedure TQrEdoCta.QRBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  PageFooterBand1.Enabled:= True;
end;
procedure TQrEdoCta.QRGpoTituloAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   QRBAux.Height:=96;//08Oct2012 HCF
end;


procedure TQrEdoCta.GPO_TIT_REFAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  vgGPO_TIT_REFPage  :=pageNumber;//17Oct2013 Hcf Para referencias y sello queden en la misma página
end;

end.
