// Modificado      : 23 OCT 2004
unit IntMQrAvDoc;

interface

uses SysUtils, Windows, Messages, Classes,   Graphics, Controls, StdCtrls,
     ExtCtrls, Forms,   Quickrpt, QRCtrls,   Db,       DBTables, IntHead,
     UnSQL2,   Dialogs, InterApl, IntGenCre, IntQRPreview;

type
  TQrReportState = ( reStart, rePreview, rePrinting );
  TQrAvDoc = class(TQuickRep)
    QRGroup1: TQRGroup;
    qyAvDoc: TQuery;
    QRDetalle: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    dbID_CESION: TQRDBText;
    dbNOMBRE: TQRDBText;
    QRLabel2: TQRLabel;
    dbRFC: TQRDBText;
    dbCOLONIA: TQRDBText;
    dbDELEGACION: TQRDBText;
    dbCODIGO_POSTAL: TQRDBText;
    dbCIUDAD: TQRDBText;
    QRLabel8: TQRLabel;
    dbCUENTA_BANCO: TQRDBText;
    QRLabel9: TQRLabel;
    lbAviso: TQRLabel;
    QRLabel15: TQRLabel;
    dbDESC_L_PRODUCTO: TQRDBText;
    QRLbCapDocto: TQRLabel;
    dbDIRECCION: TQRDBText;
    dbImpCapital: TQRDBText;
    dbFechaPago: TQRDBText;
    dbNumDias: TQRDBText;
    dbValTasa: TQRDBText;
    dbImpTotal: TQRDBText;
    dbImporte: TQRDBText;
    dbCapital: TQRDBText;
    dbImpDeposito: TQRDBText;
    shLinea: TQRShape;
    shRemLine: TQRShape;
    qrlFecha: TQRLabel;
    QRLbRenglon1: TQRLabel;
    QRLbRenglon2: TQRLabel;
    QRLbRenglon3: TQRLabel;
    QRLbRengTot: TQRLabel;
    QRImageCARGO: TQRImage;
    QRImageABONO: TQRImage;
    QRLFechaSello: TQRLabel;
    QRDBText1: TQRDBText;
    procedure qrlFechaPrint(sender: TObject; var Value: String);
    procedure QRDetalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QRDetalleAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRLFechaSelloPrint(sender: TObject; var Value: String);
  private
    vgCesion        : String;
    vgDataBaseName  : String;
    vgSessionName   : String;
    vgCveAviso      : String;
    vgTipoAviso     : String;
    vgReportState   : TQrReportState;
  private
//    procedure  StpActImprAviso( pbMail, pTipoAviso, pCesion, pDocto : String );
    procedure  SetTipoRelacion( sRelacion : String );
    procedure  SetTipoAviso   ( pTipoAviso: String );
    function   ObtenDocumento ( var pCadena: String;  var pDocto: String ): String;
  public
    Function   FormaQuery( sAviso, sRelacion : String; pFecha    : TDate ) : String;
  end;

const coEP          = 'EP';
      coEE          = 'EE';
      coCveReman    = 'RE';
      coCveIntXDev  = 'IN';
      coCveMoras    = 'MO';
      coREMAB       = 'REAB';
      coDEVAB       = 'DEAB';
      coMORCA       = 'MOCA';
      coSeparador   = ', ';
      coLengthMax   = 150;

//
var   QrAvDoc: TQrAvDoc;
  vgApli: TInterApli;
//
Procedure RepAvisosxDoc( sAviso,  sRelacion, sFecha :String;
                         iCopias :Integer;
                         pAPli     : TInterApli;
                         pPreview  : Boolean);


Implementation
const coLbLeft  = 3;
      coEdLeft  = 120;
      coLnLeft  = 155;
      coEdFecha = 100;
      coEdDias  = 220;
      coNominal   = 'MONTO NOMINAL';
      coAforado   = 'MONTO AFORADO';
      coRemanente = 'REMANENTE';
      coIntXDeven = 'INTERESES X DEVENGAR';
      coIntMora   = 'INTERESES MORATORIOS';
      coPipe      = '|';


{$R *.DFM}

Procedure RepAvisosxDoc( sAviso,  sRelacion, sFecha :String;
                         iCopias   : Integer;
                         pAPli     : TInterApli;
                         pPreview  : Boolean);
var QrAvDoc : TQrAvDoc;
    Preview : TIntQRPreview;
Begin
    QrAvDoc := TQrAvDoc.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrAvDoc);
    vgApli := pApli;    
    Try
        { Asigna variables globales }
        QrAvDoc.vgDataBaseName := pApli.DataBaseName;
        QrAvDoc.vgSessionName  := pApli.SessionName;
        QrAvDoc.vgTipoAviso    := sAviso;
        QrAvDoc.vgCveAviso     := Format( '%s%s', [ sRelacion, sAviso ] );
        QrAvDoc.PrinterSettings.Copies := iCopias;
        { Asigna los valores al Query y construye la sentencia SQL }
        QrAvDoc.qyAvDoc.DatabaseName    := pApli.DataBaseName;
        QrAvDoc.qyAvDoc.SessionName     := pApli.SessionName;
        QrAvDoc.FormaQuery( sAviso, sRelacion, StrToDate(sFecha) );
        { Coloca el tipo de relación }
        QrAvDoc.SetTipoRelacion( sRelacion );
        { Coloca el tipo de aviso }
        QrAvDoc.SetTipoAviso( sAviso );
        QrAvDoc.qyAvDoc.SQL.SaveToFile('c:\avisosDOC.txt');
        { Abre el query principal }
        QrAvDoc.qyAvDoc.Open;
        { Muestra/Imprime el reporte }
        QrAvDoc.vgCesion := '';
        if not QrAvDoc.qyAvDoc.IsEmpty then
        begin
          if pPreview then
          begin
            QrAvDoc.vgReportState := reStart;
            QrAvDoc.Preview
          end else
          begin
            QrAvDoc.vgReportState := rePrinting;
            QrAvDoc.Print;
          end;//ends_if
        end else begin
          ShowMessage('No se encontró información con el criterio selecccionado');
        end;
        QrAvDoc.qyAvDoc.Close;
    Finally
      if Assigned(QrAvDoc) then
      begin
        QrAvDoc.Free;
      end;
      //
      if Assigned(Preview) then
        Preview.Free;
      //ends_if
    End;
End;
{}
function  TQrAvDoc.ObtenDocumento ( var pCadena: String;  var pDocto: String ): String;
var vlPos : Integer;
begin
  pDocto := '';
  if pCadena <> '' then
  begin
    vlPos := pos(coPipe, pCadena);
    if vlPos = 0  then begin
      pDocto  := pCadena;
      pCadena := '';
    end else begin
      pDocto  := copy( pCadena, 1, vlPos - 1 );
      delete( pCadena, 1, vlPos );
    end;
  end;
  result := pDocto;
end;
{}
Function TQrAvDoc.FormaQuery( sAviso, sRelacion : String; pFecha : TDate ) : String;
  function AddSqlStr( pCad, pSubCad : String ):String;
  begin
    if pCad = '' then
      result := pSubCad
    else
      result := pCad + coCRLF + ' OR ' + pSubCad;
    //ENDS_IF
  end;
var
    sSQLREM        : String;
    sSQLDEV        : String;
    sSQLMOR        : String;
    sSQL           : String;
    vlCveReman     : String;
    vlCndDomicilio : String;
    vlInfoSql      : String;
begin
    if sRelacion = coEE then
      vlCndDomicilio := '  AND  DM.ID_DOMICILIO      = CTO.ID_DOMICILIO' //domicilio del emisor(contrato)
    else if sRelacion = coEP then
      vlCndDomicilio := '  AND  DM.ID_DOMICILIO      = PP.ID_DOMICILIO'; //domicilio del proveedor(persona)
    //ends_if

    vlCveReman   := '';
    if Trim(sAviso) = coREMAB then
    begin
      vlCveReman   := SqlStr(coCveReman);
    end else if Trim(sAviso)= coDEVAB then
    begin
      vlCveReman   := SqlStr(coCveIntXDev);
    end else if Trim(sAviso)= coMORCA then
    begin
      vlCveReman   := SqlStr(coCveMoras  );
    end;

    if ( Trim(sAviso)= coDEVAB ) then
    begin
      vlInfoSql :=
          'SELECT  ID_CESION, '                                                             + coCRLF +
          '        F_PAGO, '                                                                + coCRLF +
          '        F_VALOR, '                                                               + coCRLF +
          '        DIAS_X_DEV, '                                                            + coCRLF +
          '        TASA_APLICADA, '                                                         + coCRLF +
          '        PKGCRAVISOS.FUNOBTDOCTOSINT( ID_CESION,  CVE_TIPO_REMAN, F_PAGO, '       + coCRLF +
          '                                     F_VALOR,    DIAS_X_DEV,     TASA_APLICADA,' + coCRLF +
          '                                    ' + SqlStr(coSeparador)                      + coCRLF +
          '                                   ) ID_DOCUMENTO, '                             + coCRLF +
          '        PKGCRAVISOS.FUNOBTDOCTOSINT( ID_CESION,  CVE_TIPO_REMAN, F_PAGO, '       + coCRLF +
          '                                     F_VALOR,    DIAS_X_DEV,     TASA_APLICADA,' + coCRLF +
          '                                    ' + SqlStr(coPipe)                           + coCRLF +
          '                                   ) ID_IMPRESION, '                             + coCRLF +
          '        SUM( IMP_DEPOSITO  ) IMP_DEPOSITO, '                                     + coCRLF +
          '        SUM( IMP_CAPITAL   ) IMP_CAPITAL,  '                                     + coCRLF +
          '        SUM( IMP_REMANENTE ) IMP_REMANENTE '                                     + coCRLF +
          'FROM    (SELECT CD.ID_CESION                       ID_CESION, '                  + coCRLF +
          '                REMAN.F_PAGO                       F_PAGO, '                     + coCRLF +
          '                REMAN.F_VALOR                      F_VALOR, '                    + coCRLF +
          '                CA.F_VENCIMIENTO - REMAN.F_VALOR   DIAS_X_DEV, '                 + coCRLF +
          '                CI.TASA_APLICADA                   TASA_APLICADA, '              + coCRLF +
          '                0                                  IMP_DEPOSITO, '               + coCRLF +
          '                CA.IMP_CAPITAL                     IMP_CAPITAL, '                + coCRLF +
          '                NVL( REMAN.IMP_DEV_REMAN, 0 )      IMP_REMANENTE, '              + coCRLF +
          '                REMAN.CVE_TIPO_REMAN               CVE_TIPO_REMAN '              + coCRLF +
          '         FROM   CR_REMANENTE   REMAN, '                                          + coCRLF +
          '                CR_DOCUMENTO   CD, '                                             + coCRLF +
          '                CR_CAPITAL     CA, '                                             + coCRLF +
          '                CR_INTERES     CI '                                              + coCRLF +
          '         WHERE  REMAN.CVE_TIPO_REMAN =   ' + vlCveReman                          + coCRLF +
          '           AND  REMAN.IMP_DEV_REMAN  > 0 '                                       + coCRLF +
          '           AND  (  PKGCRAVISOS.EXISTEAVISO( CD.ID_CESION,      '                 + coCRLF +
          '                               CD.ID_DOCUMENTO,   '                              + coCRLF +
          '                               REMAN.CVE_TIPO_REMAN ) = ''V'' ) '                + coCRLF +
          '           AND REMAN.ID_CESION       = CD.ID_CESION '                            + coCRLF +
          '           AND REMAN.ID_DOCUMENTO    = CD.ID_DOCUMENTO '                         + coCRLF +
          '           AND CA.ID_CREDITO         = CD.ID_CESION '                            + coCRLF +
          '           AND CA.NUM_PERIODO        = CD.NUM_PERIODO_DOC '                      + coCRLF +
          '           AND CI.ID_CREDITO         = CA.ID_CREDITO '                           + coCRLF +
          '           AND CI.NUM_PERIODO        = CA.NUM_PERIODO '                          + coCRLF +
          '        ) '                                                                      + coCRLF +
          'GROUP BY ID_CESION, CVE_TIPO_REMAN, F_PAGO, F_VALOR, DIAS_X_DEV, TASA_APLICADA ';
    end else if ( Trim(sAviso) = coREMAB ) then
    begin
      vlInfoSql :=
          'SELECT  ID_CESION, '                                                             + coCRLF +
          '        F_PAGO, '                                                                + coCRLF +
          '        F_VALOR, '                                                               + coCRLF +
          '        PKGCRAVISOS.FUNOBTDOCTOSREM( ID_CESION, CVE_TIPO_REMAN, '                + coCRLF +
          '                                     F_PAGO,    F_VALOR,        '                + coCRLF +
          '                                    ' + SqlStr(coSeparador)                      + coCRLF +
          '                                   ) ID_DOCUMENTO, '                             + coCRLF +
          '        PKGCRAVISOS.FUNOBTDOCTOSREM( ID_CESION, CVE_TIPO_REMAN, '                + coCRLF +
          '                                     F_PAGO,    F_VALOR,        '                + coCRLF +
          '                                    ' + SqlStr(coPipe)                           + coCRLF +
          '                                   ) ID_IMPRESION, '                             + coCRLF +
          '        SUM( IMP_DEPOSITO  ) IMP_DEPOSITO, '                                     + coCRLF +
          '        SUM( IMP_CAPITAL   ) IMP_CAPITAL,  '                                     + coCRLF +
          '        SUM( IMP_REMANENTE ) IMP_REMANENTE '                                     + coCRLF +
          'FROM   (SELECT CD.ID_CESION, '                                                   + coCRLF +
          '                CD.ID_DOCUMENTO, '                                               + coCRLF +
          '                REMAN.F_PAGO, '                                                  + coCRLF +
          '                REMAN.F_VALOR, '                                                 + coCRLF +
          '                NVL( DEPO.IMP_DEPOSITO, 0 )   IMP_DEPOSITO, '                    + coCRLF +
          '                CA.IMP_CAPITAL, '                                                + coCRLF +
          '                NVL( REMAN.IMP_DEV_REMAN, 0 ) IMP_REMANENTE, '                   + coCRLF +
          '                REMAN.CVE_TIPO_REMAN '                                           + coCRLF +
          '         FROM   ( SELECT CT.ID_CESION, '                                         + coCRLF +
          '                         CT.ID_DOCUMENTO, '                                      + coCRLF +
          '                         SUM(CT.IMP_NETO) IMP_DEPOSITO '                         + coCRLF +
          '                 FROM   CR_TRANSACCION CT, CR_PARAMETRO CP '                     + coCRLF +
          '                 WHERE  F_OPERACION = ' + SQLFecha(pFecha)  + coCRLF +
          '                   AND  CP.CVE_PARAMETRO   = ''CRE''  '                          + coCRLF +
          '                   AND  CT.SIT_TRANSACCION = ''AC''   '                          + coCRLF +
          '                   AND  CT.ID_TRANS_CANCELA IS NULL '                            + coCRLF +
          '                   AND  CT.CVE_OPERACION = CP.CVE_RET_EMISOR '                   + coCRLF +
          '                 GROUP BY CT.ID_CREDITO, '                                       + coCRLF +
          '                          CT.ID_CESION, '                                        + coCRLF +
          '                          CT.ID_DOCUMENTO '                                      + coCRLF +
          '                ) DEPO, '                                                        + coCRLF +
          '                CR_REMANENTE   REMAN, '                                          + coCRLF +
          '                CR_DOCUMENTO   CD, '                                             + coCRLF +
          '                CR_CAPITAL     CA, '                                             + coCRLF +
          '                CR_INTERES     CI '                                              + coCRLF +
          '         WHERE  REMAN.CVE_TIPO_REMAN =   ' + vlCveReman                          + coCRLF +
          '           AND  REMAN.IMP_DEV_REMAN  > 0 '                                       + coCRLF +
          '           AND  (  PKGCRAVISOS.EXISTEAVISO( CD.ID_CESION, '                      + coCRLF +
          '                                            CD.ID_DOCUMENTO, '                   + coCRLF +
          '                                            REMAN.CVE_TIPO_REMAN '               + coCRLF +
          '                                          ) = ''V'' ) '                          + coCRLF +
          '           AND DEPO.ID_CESION       = CD.ID_CESION '                             + coCRLF +
          '           AND DEPO.ID_DOCUMENTO    = CD.ID_DOCUMENTO '                          + coCRLF +
          '           AND REMAN.ID_CESION      = CD.ID_CESION '                             + coCRLF +
          '           AND REMAN.ID_DOCUMENTO   = CD.ID_DOCUMENTO '                          + coCRLF +
          '           AND CA.ID_CREDITO        = CD.ID_CESION '                             + coCRLF +
          '           AND CA.NUM_PERIODO       = CD.NUM_PERIODO_DOC '                       + coCRLF +
          '           AND CI.ID_CREDITO        = CA.ID_CREDITO '                            + coCRLF +
          '           AND CI.NUM_PERIODO       = CA.NUM_PERIODO '                           + coCRLF +
          '        ) '                                                                      + coCRLF +
          ' GROUP BY ID_CESION, CVE_TIPO_REMAN, F_PAGO, F_VALOR ';
    end else if Trim(sAviso)= coMORCA then
    begin
      {MORATORIOS}
      vlInfoSql :=
          'SELECT  ID_CESION,'                                                  + coCRLF +
          '        F_PAGO,'                                                     + coCRLF +
          '        F_VALOR,'                                                    + coCRLF +
          '        TASA_X_MOR,'                                                 + coCRLF +
          '        DIAS_X_MOR,'                                                 + coCRLF +
          '        PKGCRAVISOS.FUNOBTDOCTOSMOR( ID_CESION,'                     + coCRLF +
          '                                     CVE_TIPO_REMAN,'                + coCRLF +
          '                                     F_PAGO,'                        + coCRLF +
          '                                     F_VALOR,'                       + coCRLF +
          '                                     DIAS_X_MOR,'                    + coCRLF +
          '                                     TASA_X_MOR,'                    + coCRLF +
          '                                     ' + SqlStr(coSeparador)         + coCRLF +
          '                                   ) ID_DOCUMENTO,'                  + coCRLF +
          '        PKGCRAVISOS.FUNOBTDOCTOSMOR( ID_CESION,'                     + coCRLF +
          '                                     CVE_TIPO_REMAN,'                + coCRLF +
          '                                     F_PAGO,'                        + coCRLF +
          '                                     F_VALOR,'                       + coCRLF +
          '                                     DIAS_X_MOR,'                    + coCRLF +
          '                                     TASA_X_MOR,'                    + coCRLF +
          '                                     ' + SqlStr(coPipe)              + coCRLF +
          '                                   ) ID_IMPRESION,'                  + coCRLF +
          '        SUM( IMP_CAPITAL   ) IMP_CAPITAL,'                           + coCRLF +
          '        SUM( IMP_TOT_MORA  ) IMP_TOT_MORA'                           + coCRLF +
          'FROM   ( SELECT CD.ID_CESION,'                                       + coCRLF +
          '                ' + vlCveReman  + ' CVE_TIPO_REMAN,'                 + coCRLF +
          '                PAGO.F_PAGO,'                                        + coCRLF +
          '                PAGO.F_VALOR,'                                       + coCRLF +
          '                PAGO.TASA_X_MOR,'                                    + coCRLF +
          '                PAGO.F_VALOR - CA.F_VENCIMIENTO DIAS_X_MOR,'         + coCRLF +
          '                CA.IMP_CAPITAL,'                                     + coCRLF +
          //'                CA.IMP_MORATORIO + CA.IMP_IVA_MORA  IMP_TOT_MORA'    + coCRLF + // LOLS 23 10 2004
          '                CA.IMP_PAGADO_MORA  IMP_TOT_MORA'    + coCRLF +
          '         FROM   ( SELECT  CT.ID_CESION              ID_CESION,'       + coCRLF +
          '                          CT.ID_DOCUMENTO           ID_DOCUMENTO,'   + coCRLF +
          '                          CT.F_OPERACION            F_PAGO,'         + coCRLF +
          '                          CT.F_VALOR                F_VALOR,'        + coCRLF +
          '                          NVL(CT.TASA_APLICADA, 0)  TASA_X_MOR'      + coCRLF +
          '                   FROM   CR_TRANSACCION CT,'                        + coCRLF +
          '                          CR_REL_CON_AFEC CRCA,'                     + coCRLF +
          '                          CR_DET_TRANSAC  CDT,'                      + coCRLF +
          '                          CR_PARAMETRO CP'                           + coCRLF +
          '                   WHERE  CVE_PARAMETRO      = ''CRE'' '             + coCRLF +
          '                     AND  CT.F_OPERACION     = ' + SQLFecha(pFecha)  + coCRLF +
          '                     AND  CT.SIT_TRANSACCION = ''AC'''               + coCRLF +
          '                     AND  CT.ID_TRANS_CANCELA IS NULL'               + coCRLF +
          //
          '                     AND  CRCA.CVE_AFECTACION = ''CAMORP'' '         + coCRLF +
          '                     AND  CT.ID_TRANSACCION  = CDT.ID_TRANSACCION'   + coCRLF +
          '                     AND  CT.CVE_OPERACION   = CDT.CVE_OPERACION'    + coCRLF +
          '                     AND  CDT.CVE_OPERACION  = CRCA.CVE_OPERACION'   + coCRLF +
          '                     AND  CDT.CVE_CONCEPTO   = CRCA.CVE_CONCEPTO'    + coCRLF +
          '                     AND  CT.CVE_TIPO_MOVTO  = CRCA.CVE_TIPO_MOVTO'  + coCRLF +
          //
          '                     AND  CT.CVE_OPERACION   = CP.CVE_OPE_PAG_CP'    + coCRLF +
          '                 ) PAGO,'                                            + coCRLF +
          '                 CR_DOCUMENTO   CD,'                                 + coCRLF +
          '                 CR_CAPITAL     CA'                                  + coCRLF +
          '          WHERE CA.IMP_MORATORIO + CA.IMP_IVA_MORA > 0'              + coCRLF +
          '            AND PKGCRAVISOS.EXISTEAVISO( CD.ID_CESION,'              + coCRLF +
          '                                         CD.ID_DOCUMENTO, '          + coCRLF +
          '                                         ' + vlCveReman              + coCRLF +
                                                  ') = ''V'' '                  + coCRLF +
          '            AND PAGO.ID_CESION       = CD.ID_CESION'                 + coCRLF +
          '            AND PAGO.ID_DOCUMENTO    = CD.ID_DOCUMENTO'              + coCRLF +
          '            AND CA.ID_CREDITO        = CD.ID_CESION'                 + coCRLF +
          '            AND CA.NUM_PERIODO       = CD.NUM_PERIODO_DOC'           + coCRLF +
          '        )'                                                           + coCRLF +
          'GROUP BY  ID_CESION,   F_PAGO,   F_VALOR,  TASA_X_MOR, DIAS_X_MOR';
    end;
    //
    sSQLREM :=  'SELECT INFO.ID_CESION,'                                        + coCRLF +
                '       INFO.F_PAGO, '                                          + coCRLF +
                '       INFO.F_VALOR, '                                         + coCRLF +
                '       INFO.IMP_DEPOSITO, '                                    + coCRLF +
                '       INFO.IMP_CAPITAL, '                                     + coCRLF +
                '       INFO.IMP_REMANENTE, '                                   + coCRLF +
                '       INFO.ID_DOCUMENTO, '                                    + coCRLF +
                '       INFO.ID_IMPRESION, '                                    + coCRLF +
                '       EFECTO_DOBLE.NUM_IMPRESION, '                           + coCRLF +
                '       CPR.DESC_L_PRODUCTO, '                                  + coCRLF +
                '       DECODE(PCE.CVE_PER_JURIDICA,''PM'', '                   + coCRLF +
                '              PCE.NOMBRE,PE.APELLIDO_PATERNO||'' ''|| '        + coCRLF +
                '              PE.APELLIDO_MATERNO||'' ''|| '                   + coCRLF +
                '              PE.NOMBRE_PERSONA) NOM_EMISOR, '                 + coCRLF +
                '       (RFC.SIGLAS_RFC||''-''||RFC.F_RFC||''-''||'             + coCRLF +
                '        RFC.HOMOCLAVE_RFC) RFC_E, '                            + coCRLF +
                '       PKGCRPERIODO.STPObtChqCte(CCE.ID_EMISOR, '              + coCRLF +
                '                                 CCE.CVE_EMISOR_NAFIN, '       + coCRLF +
                '                                 CCE.ID_CESION,''AC'', '       + coCRLF +
                '                                 ''AD'',''CR'') CTA_EMI, '     + coCRLF +
                '       PP.NOMBRE NOM_PROVEEDOR, '                              + coCRLF +
                '       (RFC_P.SIGLAS_RFC||''-''||RFC_P.F_RFC||''-''|| '        + coCRLF +
                '        RFC_P.HOMOCLAVE_RFC) RFC_P,  '                         + coCRLF +
                '       PKGCRPERIODO.STPObtChqCte(CCE.ID_PROVEEDOR,NULL,  '     + coCRLF +
                '                                 CCE.ID_CESION, ''PR'',  '     + coCRLF +
                '                                 ''AD'',''AB'') CTA_PROV,'     + coCRLF +
                '       DM.CALLE_NUMERO DIRECCION,  '                           + coCRLF +
                '       DM.COLONIA, '                                           + coCRLF +
                '       PBD.DESC_POBLACION DELEGACION, '                        + coCRLF +
                '       DM.CODIGO_POSTAL, '                                     + coCRLF +
                '       PBC.DESC_POBLACION CIUDAD '                             + coCRLF +
                'FROM   ( '                                                     + coCRLF +
                         vlInfoSql                                              + coCRLF +
                '       )INFO, '                                                + coCRLF +
                '       CR_CREDITO    CC,  '                                    + coCRLF +
                '       CR_CESION     CCE, '                                    + coCRLF +
                '       CR_CONTRATO    CCTO,'                                   + coCRLF +
                '       CR_PRODUCTO    CPR,'                                    + coCRLF +
                '       CR_EMISOR      CE, '                                    + coCRLF +
                '       CR_PROVEEDOR   CPV,'                                    + coCRLF +
                '       PERSONA        PCE,'                                    + coCRLF +
                '       PERSONA_FISICA PE, '                                    + coCRLF +
                '       PERSONA        PP, '                                    + coCRLF +
                '       RFC,'                                                   + coCRLF +
                '       RFC           RFC_P,'                                   + coCRLF +
                '       CONTRATO      CTO,  '                                   + coCRLF +
                '       DOMICILIO     DM,   '                                   + coCRLF +
                '       POBLACION     PBD,  '                                   + coCRLF +
                '       POBLACION     PBC,  '                                   + coCRLF +
                '        (SELECT ''IMPRESION 1 (UNO)'' NUM_IMPRESION FROM DUAL                ' + coCRLF +
                '         UNION  ALL -- PARA SELECCIONAR 2 VECES LA MISMA INFORMACION         ' + coCRLF +
                '         SELECT ''IMPRESION 2 (DOS)'' NUM_IMPRESION FROM DUAL ) EFECTO_DOBLE ' + coCRLF +
                'WHERE  CC.ID_CREDITO = INFO.ID_CESION '                        + coCRLF +
                '  AND  CCE.ID_CESION = INFO.ID_CESION '                        + coCRLF +
                '  AND  CCTO.ID_CONTRATO     = CC.ID_CONTRATO '                 + coCRLF +
                '  AND  CCTO.FOL_CONTRATO    = CC.FOL_CONTRATO '                + coCRLF +
                '  AND  CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE '          + coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
                '  AND  CE.CVE_FND_ENT_DES   = CCE.CVE_FND_ENT_DES '                  + coCRLF +
                '  AND  CE.ID_ACREDITADO     = CCE.ID_EMISOR '                  + coCRLF +
//                '  AND  CE.CVE_EMISOR_NAFIN  = CCE.CVE_EMISOR_NAFIN '           + coCRLF +
                '  AND  CE.CVE_EMISOR_EXT    = CCE.CVE_EMISOR_NAFIN '           + coCRLF +
                '  AND  CPV.CVE_FND_ENT_DES  = CCE.CVE_FND_ENT_DES '                  + coCRLF +
                '  AND  CPV.ID_ACREDITADO    = CCE.ID_PROVEEDOR '               + coCRLF +
{/ROIM}
                '  AND  PCE.ID_PERSONA       = CE.ID_ACREDITADO '               + coCRLF +
                '  AND  PE.ID_PERSONA(+)     = CE.ID_ACREDITADO '               + coCRLF +
                '  AND  PP.ID_PERSONA        = CPV.ID_ACREDITADO '              + coCRLF +
                '  AND  RFC.ID_PERSONA       = CE.ID_ACREDITADO '               + coCRLF +
                '  AND  RFC_P.ID_PERSONA     = CPV.ID_ACREDITADO '              + coCRLF +
                '  AND  CTO.ID_CONTRATO      = CCTO.ID_CONTRATO '               + coCRLF +
                   vlCndDomicilio                                               + coCRLF +
                '  AND  PBD.CVE_POBLACION    = DM.CVE_ESTADO  '                 + coCRLF +
                '  AND  PBC.CVE_POBLACION    = DM.CVE_CIUDAD  '                 + coCRLF +
                'ORDER BY ID_CESION,    F_PAGO,       F_VALOR, '                + coCRLF +
                '         IMP_DEPOSITO, IMP_CAPITAL,  IMP_REMANENTE, '          + coCRLF +
                '         ID_DOCUMENTO, ID_IMPRESION, NUM_IMPRESION ';

    // INTERESES X DEVENGAR
    sSQLDEV :=  ' SELECT INFO.ID_CESION,'                                       + coCRLF +
                '        INFO.F_PAGO, '                                         + coCRLF +
                '        INFO.F_VALOR,'                                         + coCRLF +
                '        INFO.IMP_CAPITAL, '                                    + coCRLF +
                '        INFO.DIAS_X_DEV,  '                                    + coCRLF +
                '        INFO.TASA_APLICADA TASA_X_DEV,  '                      + coCRLF +
                '        INFO.IMP_REMANENTE IMP_INTERES, '                      + coCRLF +
                '        INFO.ID_DOCUMENTO, '                                   + coCRLF +
                '        INFO.ID_IMPRESION, '                                   + coCRLF +
                '        EFECTO_DOBLE.NUM_IMPRESION, '                          + coCRLF +
                '        CPR.DESC_L_PRODUCTO, '                                 + coCRLF +
                '        DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE, '       + coCRLF +
                '          PE.APELLIDO_PATERNO||'' ''||PE.APELLIDO_MATERNO '    + coCRLF +
                '          ||'' ''||PE.NOMBRE_PERSONA) NOM_EMISOR,  '           + coCRLF +
                '        (RFC.SIGLAS_RFC||''-''||RFC.F_RFC||''-''|| '           + coCRLF +
                '         RFC.HOMOCLAVE_RFC) RFC_E, '                           + coCRLF +
                '        PKGCRPERIODO.STPObtChqCte(CCE.ID_EMISOR, '             + coCRLF +
                '                                  CCE.CVE_EMISOR_NAFIN, '      + coCRLF +
                '                                  CCE.ID_CESION, '             + coCRLF +
                '                                  ''AC'', '                    + coCRLF +
                '                                  ''AD'', '                    + coCRLF +
                '                                  ''CR'') CTA_EMI,'            + coCRLF +
                '        PP.NOMBRE NOM_PROVEEDOR, '                             + coCRLF +
                '        (RFC_P.SIGLAS_RFC||''-''||RFC_P.F_RFC||''-''|| '       + coCRLF +
                '         RFC_P.HOMOCLAVE_RFC) RFC_P, '                         + coCRLF +
                '        PKGCRPERIODO.STPObtChqCte(CCE.ID_PROVEEDOR, NULL, '    + coCRLF +
                '                                  CCE.ID_CESION, '             + coCRLF +
                '                                  ''PR'', '                    + coCRLF +
                '                                  ''AD'', '                    + coCRLF +
                '                                  ''AB'') CTA_PROV, '          + coCRLF +
                '        DM.CALLE_NUMERO DIRECCION, '                           + coCRLF +
                '        DM.COLONIA, '                                          + coCRLF +
                '        PBD.DESC_POBLACION DELEGACION, '                       + coCRLF +
                '        DM.CODIGO_POSTAL, '                                    + coCRLF +
                '        PBC.DESC_POBLACION CIUDAD '                            + coCRLF +
                ' FROM   ( '                                                    + coCRLF +
                                  vlInfoSql                                     + coCRLF +
                '        )INFO, '                                               + coCRLF +
                '        CR_CESION     CCE, '                                   + coCRLF +
                '        CR_CREDITO    CC, '                                    + coCRLF +
                '        CR_CONTRATO   CCTO, '                                  + coCRLF +
                '        CR_PRODUCTO   CPR, '                                   + coCRLF +
                '        CR_EMISOR     CE, '                                    + coCRLF +
                '        CR_PROVEEDOR  CPV, '                                   + coCRLF +
                '        PERSONA_FISICA PE, '                                   + coCRLF +
                '        PERSONA       PCE, '                                   + coCRLF +
                '        PERSONA       PP, '                                    + coCRLF +
                '        RFC, '                                                 + coCRLF +
                '        RFC RFC_P, '                                           + coCRLF +
                '        CONTRATO      CTO, '                                   + coCRLF +
                '        DOMICILIO     DM,  '                                   + coCRLF +
                '        POBLACION     PBD, '                                   + coCRLF +
                '        POBLACION     PBC, '                                   + coCRLF +
                '        (SELECT ''IMPRESION 1 (UNO)'' NUM_IMPRESION FROM DUAL '                + coCRLF +
                '         UNION  ALL -- PARA SELECCIONAR 2 VECES LA MISMA INFORMACION '         + coCRLF +
                '         SELECT ''IMPRESION 2 (DOS)'' NUM_IMPRESION FROM DUAL ) EFECTO_DOBLE ' + coCRLF +
                ' WHERE  INFO.ID_CESION = CCE.ID_CESION  '                      + coCRLF +
                '   AND  CC.ID_CREDITO = CCE.ID_CESION  '                       + coCRLF +
                '   AND  CCTO.ID_CONTRATO = CC.ID_CONTRATO  '                   + coCRLF +
                '   AND  CCTO.FOL_CONTRATO = CC.FOL_CONTRATO  '                 + coCRLF +
                '   AND  CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE  '        + coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
                '   AND  CE.CVE_FND_ENT_DES = CCE.CVE_FND_ENT_DES  '                    + coCRLF +
                '   AND  CE.ID_ACREDITADO = CCE.ID_EMISOR  '                    + coCRLF +
//                '   AND  CE.CVE_EMISOR_NAFIN = CCE.CVE_EMISOR_NAFIN  '          + coCRLF +
                '   AND  CE.CVE_EMISOR_EXT = CCE.CVE_EMISOR_NAFIN  '          + coCRLF +
{/ROIM}
                '   AND  PE.ID_PERSONA (+)= CCE.ID_EMISOR  '                    + coCRLF +
                '   AND  PCE.ID_PERSONA = CCE.ID_EMISOR  '                      + coCRLF +
                '   AND  RFC.ID_PERSONA = CCE.ID_EMISOR  '                      + coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
                '   AND  CPV.CVE_FND_ENT_DES = CCE.CVE_FND_ENT_DES  '                    + coCRLF +
                '   AND  CPV.ID_ACREDITADO = CCE.ID_PROVEEDOR  '                + coCRLF +
{/ROIM}
                '   AND  PP.ID_PERSONA = CCE.ID_PROVEEDOR  '                    + coCRLF +
                '   AND  RFC_P.ID_PERSONA = PP.ID_PERSONA  '                    + coCRLF +
                '   AND  CTO.ID_CONTRATO = CC.ID_CONTRATO  '                    + coCRLF +
                    vlCndDomicilio                                              + coCRLF +
                '   AND  PBD.CVE_POBLACION = DM.CVE_ESTADO  '                   + coCRLF +
                '   AND  PBC.CVE_POBLACION = DM.CVE_CIUDAD  '                   + coCRLF +
                ' ORDER BY  ID_CESION,   F_PAGO,     F_VALOR,     IMP_CAPITAL,' + coCRLF +
                '           DIAS_X_DEV,  TASA_X_DEV, IMP_INTERES, ID_DOCUMENTO,'+ coCRLF +
                '           ID_IMPRESION,NUM_IMPRESION';



    sSQLMOR :=      'SELECT INFO.ID_CESION, '     + coCRLF +
                    '       INFO.F_PAGO, '        + coCRLF +
                    '       INFO.F_VALOR,'        + coCRLF +
                    '       INFO.IMP_CAPITAL,  '  + coCRLF +
                    '       INFO.DIAS_X_MOR,  '   + coCRLF +
                    '       INFO.TASA_X_MOR,  '   + coCRLF +
                    '       INFO.IMP_TOT_MORA,  ' + coCRLF +
                    '       INFO.ID_DOCUMENTO, '  + coCRLF +
                    '       INFO.ID_IMPRESION, '  + coCRLF +
                    '       EFECTO_DOBLE.NUM_IMPRESION, '  + coCRLF +
                    '       CPR.DESC_L_PRODUCTO,  '        + coCRLF +
                    '       DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PE.APELLIDO_PATERNO||'' ''||PE.APELLIDO_MATERNO||'' ''||PE.NOMBRE_PERSONA) NOM_EMISOR,  ' + coCRLF +
                    '       (RFC.SIGLAS_RFC||RFC.F_RFC||RFC.HOMOCLAVE_RFC) RFC_E,  ' + coCRLF +
                    '       PKGCRPERIODO.STPObtChqCte(CCE.ID_EMISOR,CCE.CVE_EMISOR_NAFIN,CCE.ID_CESION,''AC'',''AD'',''CR'') CTA_EMI,  ' + coCRLF +
                    '       PP.NOMBRE NOM_PROVEEDOR,  ' + coCRLF +
                    '       (RFC_P.SIGLAS_RFC||RFC_P.F_RFC||RFC_P.HOMOCLAVE_RFC) RFC_P,  ' + coCRLF +
                    '       PKGCRPERIODO.STPObtChqCte(CCE.ID_PROVEEDOR,NULL,CCE.ID_CESION,''PR'',''AD'',''AB'') CTA_PROV,  ' + coCRLF +
                    '       DM.CALLE_NUMERO DIRECCION,  ' + coCRLF +
                    '       DM.COLONIA,  ' + coCRLF +
                    '       PBD.DESC_POBLACION DELEGACION,  ' + coCRLF +
                    '       DM.CODIGO_POSTAL,  ' + coCRLF +
                    '       PBC.DESC_POBLACION CIUDAD  ' + coCRLF +
                    ' FROM  ( ' + coCRLF +
                                  vlInfoSql                                   + coCRLF +
                    '       )INFO, ' + coCRLF +
                    '       CR_CESION     CCE,   ' + coCRLF +
                    '       CR_CREDITO    CC,    ' + coCRLF +
                    '       CR_CONTRATO   CCTO,  ' + coCRLF +
                    '       CR_PRODUCTO   CPR,   ' + coCRLF +
                    '       CR_EMISOR     CE,   ' + coCRLF +
                    '       CR_PROVEEDOR  CPV,  ' + coCRLF +
                    '       PERSONA_FISICA PE,  ' + coCRLF +
                    '       PERSONA       PCE,  ' + coCRLF +
                    '       PERSONA       PP,   ' + coCRLF +
                    '       RFC,                ' + coCRLF +
                    '       RFC RFC_P,          ' + coCRLF +
                    '       CONTRATO      CTO,  ' + coCRLF +
                    '       DOMICILIO     DM,   ' + coCRLF +
                    '       POBLACION     PBD,  ' + coCRLF +
                    '       POBLACION     PBC,  ' + coCRLF +
                    '       (SELECT ''IMPRESION 1 (UNO)'' NUM_IMPRESION FROM DUAL '                + coCRLF +
                    '        UNION  ALL -- PARA SELECCIONAR 2 VECES LA MISMA INFORMACION '         + coCRLF +
                    '        SELECT ''IMPRESION 2 (DOS)'' NUM_IMPRESION FROM DUAL ) EFECTO_DOBLE ' + coCRLF +
                    ' WHERE CCE.ID_CESION = INFO.ID_CESION ' + coCRLF +
                    ' AND   CC.ID_CREDITO = CCE.ID_CESION                    ' + coCRLF +
                    ' AND   CCTO.ID_CONTRATO = CC.ID_CONTRATO                ' + coCRLF +
                    ' AND   CCTO.FOL_CONTRATO = CC.FOL_CONTRATO              ' + coCRLF +
                    ' AND   CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE     ' + coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
                    ' AND   CE.CVE_FND_ENT_DES = CCE.CVE_FND_ENT_DES                 ' + coCRLF +
                    ' AND   CE.ID_ACREDITADO = CCE.ID_EMISOR                 ' + coCRLF +
//                    ' AND   CE.CVE_EMISOR_NAFIN = CCE.CVE_EMISOR_NAFIN       ' + coCRLF +
                    ' AND   CE.CVE_EMISOR_EXT = CCE.CVE_EMISOR_NAFIN       ' + coCRLF +
{/ROIM}
                    ' AND   PE.ID_PERSONA(+)= CCE.ID_EMISOR                  ' + coCRLF +
                    ' AND   PCE.ID_PERSONA = CCE.ID_EMISOR                   ' + coCRLF +
                    ' AND   RFC.ID_PERSONA = CCE.ID_EMISOR                   ' + coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
                    ' AND   CPV.CVE_FND_ENT_DES = CCE.CVE_FND_ENT_DES                 ' + coCRLF +
                    ' AND   CPV.ID_ACREDITADO = CCE.ID_PROVEEDOR             ' + coCRLF +
{/ROIM}
                    ' AND   PP.ID_PERSONA = CCE.ID_PROVEEDOR                 ' + coCRLF +
                    ' AND   RFC_P.ID_PERSONA = PP.ID_PERSONA                 ' + coCRLF +
                    ' AND   CTO.ID_CONTRATO = CC.ID_CONTRATO                 ' + coCRLF +
                      vlCndDomicilio                                           + coCRLF +
                    ' AND   PBD.CVE_POBLACION = DM.CVE_ESTADO                ' + coCRLF +
                    ' AND   PBC.CVE_POBLACION = DM.CVE_CIUDAD '                + coCRLF +
                ' ORDER BY ID_CESION,  F_PAGO,     F_VALOR,      IMP_CAPITAL,' + coCRLF +
                '          DIAS_X_MOR, TASA_X_MOR, IMP_TOT_MORA, ID_DOCUMENTO,'+ coCRLF +
                '          ID_IMPRESION, NUM_IMPRESION';


    sSQL:='';
    If Trim(sAviso)     = coREMAB Then
        sSQL:= sSQLREM
    Else If Trim(sAviso)= coDEVAB Then
        sSQL:= sSQLDEV
    Else If Trim(sAviso)= coMORCA Then
        sSQL:= sSQLMOR;         //+ ' UNION ALL '+ sSQLMOR + ' ORDER BY ID_CESION, IMP_TOT_MORA';
    //ends_if
    {}
    qyAvDoc.SQL.Clear;
    qyAvDoc.SQL.Add( sSQL );


    Result:= sSQL;
End;
{}
procedure TQrAvDoc.SetTipoRelacion( sRelacion: String);
begin
  If ( sRelacion  = coEP ) Then
  Begin
    dbNOMBRE.DataField := 'NOM_PROVEEDOR';
    dbRFC.DataField    := 'RFC_P';
    dbCUENTA_BANCO.DataField := 'CTA_PROV';
  End Else If ( sRelacion  = coEE ) Then
  Begin
    dbNOMBRE.DataField := 'NOM_EMISOR';
    dbRFC.DataField    := 'RFC_E';
    dbCUENTA_BANCO.DataField := 'CTA_EMI';
  End;
end;
{}
procedure TQrAvDoc.SetTipoAviso( pTipoAviso : String );
const arrEtiquetas :  array[ 1..3, 1..4 ] of String =
                     ( ('', 'CAPITAL NOMINAL', 'CAPITAL AFORADO', 'REMANENTE'),
                       ('CAPITAL', 'DIAS(POR DEVENGAR)', 'TASA %', 'IMPORTE'),
                       ('CAPITAL', 'DIAS(IMPAGADO)', 'TASA %', 'IMPORTE')
                     );
var vlBDeMor  : Boolean;
    vlBReman  : Boolean;
    vlIndex   : Integer;
begin
  vlIndex  := 0;
  vlBDeMor := ( ( pTipoAviso = coDEVAB ) or ( pTipoAviso = coMORCA ) );
  vlBReman := ( pTipoAviso = coREMAB );
  // EDITS
  dbImpDeposito.Enabled := vlBReman;
  // EDITS
  dbNumDias.Enabled     := vlBDeMor;
  dbFechaPago.Enabled   := vlBDeMor;
  // ETIQUETAS
  QRLbRenglon1.Enabled  := vlBDeMor;
  //
  dbImpCapital.Top := 301;

  if pTipoAviso = coREMAB then
  begin
    vlIndex := 1;
    lbAviso.Caption    := coRemanente;
    //
    dbImpDeposito.Left := coEdLeft;
    dbImpCapital.Top   := 333;
    //
    dbImpTotal.DataField := 'IMP_REMANENTE';
    QRLbRengTot.Caption  := 'REMANENTE';
    //
  end else if pTipoAviso = coDEVAB then
  begin
    vlIndex := 2;
    lbAviso.Caption  := coIntXDeven;
    //
    dbImpTotal.DataField := 'IMP_INTERES';
    dbNumDias.DataField  := 'DIAS_X_DEV';
    dbValTasa.DataField  := 'TASA_X_DEV';
  end else if pTipoAviso = coMORCA then
  begin
    vlIndex := 3;
    lbAviso.Caption  := coIntMora;
    //
    dbImpTotal.DataField := 'IMP_TOT_MORA';
    dbNumDias.DataField  := 'DIAS_X_MOR';
    dbValTasa.DataField  := 'TASA_X_MOR';
  end;
  //
  QRLbRenglon1.Caption := arrEtiquetas[ vlIndex, 1 ];
  QRLbRenglon2.Caption := arrEtiquetas[ vlIndex, 2 ];
  QRLbRenglon3.Caption := arrEtiquetas[ vlIndex, 3 ];
  QRLbRengTot.Caption  := arrEtiquetas[ vlIndex, 4 ];
end;
{
procedure TQrAvDoc.StpActImprAviso(  pbMail, pTipoAviso,  pCesion,   pDocto : String);
var vlStpAct : TStoredProc;
begin
  vlStpAct := TStoredProc.Create( nil );
  try
    vlStpAct.DatabaseName := vgDataBaseName;
    vlStpAct.SessionName  := vgSessionName;
    vlStpAct.StoredProcName := 'PKGCRPERIODO.STPACTIMPRAVISO';
    vlStpAct.Params.Clear;
    vlStpAct.Params.CreateParam( ftInteger,  'peID_CREDITO',    ptInput  );
    vlStpAct.Params.CreateParam( ftString,   'peID_DOCUMENTO',  ptInput  );
    vlStpAct.Params.CreateParam( ftString,   'peCVE_AVISO',     ptInput  );
    vlStpAct.Params.CreateParam( ftInteger,  'peNUM_IMPRESION', ptInput  );
    vlStpAct.Params.CreateParam( ftString,   'pB_MAIL',       ptInput  );
    vlStpAct.Params.CreateParam( ftString,   'peBCommit',       ptInput  );
    vlStpAct.Params.CreateParam( ftString,   'psTXResultado',   ptOutput );
    vlStpAct.Params.CreateParam( ftInteger,  'psResultado',     ptOutput );

    vlStpAct.ParamByName( 'peID_CREDITO'    ).AsString  := pCesion;
    vlStpAct.ParamByName( 'peID_DOCUMENTO'  ).AsString  := pDocto;
    vlStpAct.ParamByName( 'peCVE_AVISO'     ).AsString  := pTipoAviso;
    vlStpAct.ParamByName( 'peNUM_IMPRESION' ).AsInteger := PrinterSettings.Copies;
    vlStpAct.ParamByName( 'pB_MAIL' ).AsString := pbMail;
    vlStpAct.ParamByName( 'peBCommit'       ).AsString  := 'V';
    vlStpAct.ExecProc;
    if vlStpAct.ParamByName( 'psResultado' ).AsInteger <> 0 then
    begin
      ShowMessage('Error al actualizar el número de impresiones de la cesión: '
                  + pCesion + ' Documento ' +  pDocto );
    end;
  finally
    vlStpAct.Free;
  end;
end;
}
procedure TQrAvDoc.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if vgReportState = reStart then
    vgReportState := rePreview
  else if vgReportState = rePreview then
    vgReportState := rePrinting;
  //ends_if
end;
{}
procedure TQrAvDoc.QRDetalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if ( vgTipoAviso = coREMAB ) OR ( vgTipoAviso = coDEVAB )then
  begin
    QRImageABONO.Enabled := True;
    QRImageCARGO.Enabled := False;
  end
  else if vgTipoAviso = coMORCA then
  begin
     QRImageABONO.Enabled := False;
     QRImageCARGO.Enabled := True;
  end;
end;
{}
procedure TQrAvDoc.QRDetalleAfterPrint(Sender: TQRCustomBand;  BandPrinted: Boolean);
var vlIdCes  : String;
    vlDoctos : String;
    vlIdDoc  : String;
    vlMsg    : String;
    vlBImpr  : Boolean;
begin
  vlBImpr := ( ( PrinterSettings.FirstPage = 0 ) and ( PrinterSettings.LastPage = 0 ) ) or
             ( ( PageNumber >= PrinterSettings.FirstPage ) and ( PageNumber <= PrinterSettings.LastPage  ) );
  //
  if ( vgReportState = rePrinting ) and ( vlBImpr ) then
  begin
    vlIdCes  := qyAvDoc.FieldByName('ID_CESION').AsString;
    vlDoctos := qyAvDoc.FieldByName('ID_IMPRESION').AsString;
    while ObtenDocumento (vlDoctos, vlIdDoc ) <> '' do
//      StpActImprAviso( 'F',vgCveAviso, vlIdCes, vlIdDoc );
      StpInsertUpdAv(vgCveAviso, vlIdCes, vlIdDoc,'F', 'SOLO IMPRESION EN PAPEL',DateTimeToStr(now),
                     qyAvDoc.FieldByName('F_PAGO').AsString, 1{StrToInt(vlDoctos)},
                     vgApli, vlMsg);
  end;
end;
{}
procedure TQrAvDoc.qrlFechaPrint(sender: TObject; var Value: String);
begin
  Value:= FormatDateTime( '"México D.F. a " dd " de " mmmm " del " yyyy',
                          qyAvDoc.FieldByName('F_PAGO').AsDateTime       );
end;
{}
procedure TQrAvDoc.QRLFechaSelloPrint(sender: TObject; var Value: String);
begin
  Value:= FormatDateTime('dd" "mmm" "yyyy', qyAvDoc.FieldByName('F_PAGO').AsDateTime );
end;



End.


