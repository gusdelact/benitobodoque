Unit IntMQrPlazoRes;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport;
Type
  TQrPlazoRes = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyPzoRes: TQuery;
    QRSHPTCredito: TQRShape;
    QRLabel9: TQRLabel;
    QRSHPTCliente: TQRShape;
    QRLabel17: TQRLabel;
    QRSHPTMonto: TQRShape;
    QRLabel18: TQRLabel;
    QRSHPTSaldoIsoluto: TQRShape;
    QRLabel20: TQRLabel;
    QRSHPTF_Inicio: TQRShape;
    QRDetalle: TQRBand;
    QRFooterMoneda: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRFooterOrigen: TQRBand;
    QRFooterProducto: TQRBand;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    qrlTOTAL: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel19: TQRLabel;
    QRSHPTImpDispuesto: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText10: TQRDBText;
    QRExpr4: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel3: TQRLabel;
    qreCntxMon: TQRExpr;
    QRLabel5: TQRLabel;
    QRExpr10: TQRExpr;
    QRExpr1: TQRExpr;
    qreImpCredxMon: TQRExpr;
    QRExpr6: TQRExpr;
    qreImpIntxMon: TQRExpr;
    QRExpr17: TQRExpr;
    qreImpTotxMon: TQRExpr;
    QRBFootPzo: TQRBand;
    qreImpCredxPzo: TQRExpr;
    qreImpIntxPzo: TQRExpr;
    qreImpTotxPzo: TQRExpr;
    QRFootContador: TQRBand;
    QRLabel26: TQRLabel;
    qreCntxGlob: TQRExpr;
    QRSHPTProveedor: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText24: TQRDBText;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRGroupContador: TQRGroup;
    QRGroupMoneda: TQRGroup;
    QRGroupPzo: TQRGroup;
    QROrigen: TQRGroup;
    QRGroupProducto: TQRGroup;
    QRLabel39: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    SummaryBand1: TQRBand;
    QRSHPSector: TQRShape;
    QRLabel52: TQRLabel;
    QRDBText38: TQRDBText;
    QRSHPMoneda: TQRShape;
    QRLabel46: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRGroupEntDes: TQRGroup;
    QRFooterEntDes: TQRBand;
    QRGroupPrograma: TQRGroup;
    QRFooterPrograma: TQRBand;
    QRShape2: TQRShape;
    QRLabel44: TQRLabel;
    QRDBText30: TQRDBText;
    QRShape3: TQRShape;
    QRLabel45: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    qreCntxEnt: TQRExpr;
    QRLabel51: TQRLabel;
    qreImpCredxEnt: TQRExpr;
    qreImpIntxEnt: TQRExpr;
    qreImpTotxEnt: TQRExpr;
    qreCntxProg: TQRExpr;
    QRLabel54: TQRLabel;
    qreImpCredxProg: TQRExpr;
    qreImpIntxProg: TQRExpr;
    qreImpTotxProg: TQRExpr;
    qreImpCredxMonVal: TQRExpr;
    qreImpIntxMonVal: TQRExpr;
    qreImpTotxMonVal: TQRExpr;
    QRLabel6: TQRLabel;
    qreCntxPzo: TQRExpr;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    qrdbTCMoneda: TQRDBText;
    QRDBPlazoRes: TQRDBText;
    QRlbPlazoRes: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape4: TQRShape;
    QRLabel10: TQRLabel;
    QRShape5: TQRShape;
    QRLabel13: TQRLabel;
    QRShape6: TQRShape;
    QRLabel14: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr11: TQRExpr;
    qreImpCredxPzoVal: TQRExpr;
    qreImpIntxPzoVal: TQRExpr;
    qreImpTotxPzoVal: TQRExpr;
    qreImpCredxProgVal: TQRExpr;
    qreImpIntxProgVal: TQRExpr;
    qreImpTotxProgVal: TQRExpr;
    qreImpCredxEntVal: TQRExpr;
    qreImpIntxEntVal: TQRExpr;
    qreImpTotxEntVal: TQRExpr;
    qrdbTCInstitucion: TQRDBText;
    qrdbTCPrograma: TQRDBText;
    qreImpCredxGlobVal: TQRExpr;
    qreImpIntxGlobVal: TQRExpr;
    qreImpTotxGlobVal: TQRExpr;
    QRGroupCatMinimo: TQRGroup;
    QRFooterCatMinimo: TQRBand;
    QRShape7: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel8: TQRLabel;
    qreCntxCMin: TQRExpr;
    QRLabel15: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    qreImpCredxCMinVal: TQRExpr;
    qreImpIntxCMinVal: TQRExpr;
    qreImpTotxCMinVal: TQRExpr;
    qrmResxEntidad: TQRMemo;
    qrmResxEntTotal: TQRMemo;
    qrmResxEntTotVal: TQRMemo;
    QRLabel16: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape8: TQRShape;
    QRDBText16: TQRDBText;
    Procedure QRFootContadorBeforePrint(SEnder: TQRCustomBand; Var PrintBand: Boolean);
    Procedure QRDetalleBeforePrint(SEnder: TQRCustomBand; Var PrintBand: Boolean);
    procedure QRFooterMonedaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBFootPzoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRFooterProgramaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterEntDesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterCatMinimoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupEntDesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  Private
    TipoRep : String;
  Public
    Function FormaQuery( FReporte  :  TDate; sGpoProd, sProducto, sMoneda,
                         sEntidad,    sPrograma, sTipoRep, sTipoSubRep, sPzoRes,
                         sEmpresa,    sSucursal : String ) : String;
  End;

const
  coTab    = #9;
  coFndVig = 'FN';
  coVigAct = 'VG';
  coVdaAct = 'VD';
  //
  coPlazo  = 'PL';
  coUDIS   = 'UD';
  coDLLS   = 'DL';
  //
  coPESO   = 484;
  coDOLAR  = 840;
  //
  coHEIGHT = 11;



  

Var
  QrPlazoRes1 : TQrPlazoRes;
  bGenArch    : Boolean;
  Apli        : TInterApli;
  sCampoF     : String;
  sArchivo    : String;
  F           : TextFile;


Procedure RepPlazoResidual( sF_Reporte  : TDate; sGpoProd, sProducto,   sMoneda,
                            sEntidad, sPrograma, sTipoRep, sTipoSubRep, sPzoRes,
                            sEmpresa, sSucursal :string;   sNbrArch  : String;
                            pAPli     : TInterApli; pPreview  : Boolean);



Implementation
{$R *.DFM}

Procedure RepPlazoResidual( sF_Reporte : TDate;
                            sGpoProd,
                            sProducto,
                            sMoneda,
                            sEntidad,
                            sPrograma,
                            sTipoRep,
                            sTipoSubRep,
                            sPzoRes,
                            sEmpresa,
                            sSucursal :String;
                            sNbrArch  : String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
   sTitulo1    : String;
   sTitulo2    : String;
   Preview     : TIntQRPreview;
   QrPlazoRes  : TQrPlazoRes;
   sCatMin     : String;
   sEntProg    : String;
Begin
   QrPlazoRes  := TQrPlazoRes.Create(Nil);
   Preview     := TIntQRPreview.CreatePreview(Application, QrPlazoRes );
   Try
      Apli     := pApli;
      bGenArch := False;
      sArchivo := sNbrArch;
      //
      QrPlazoRes.TipoRep := sTipoRep;
      if sTipoRep = coFndVig then
      Begin
        sTitulo1 := 'Relación de Fondeos Vigentes';
        //
        QrPlazoRes.QRGroupEntDes.Enabled     := True;
        QrPlazoRes.QRFooterEntDes.Enabled    := True;
        QrPlazoRes.QRGroupPrograma.Enabled   := True;
        QrPlazoRes.QRFooterPrograma.Enabled  := True;
        //
        QrPlazoRes.QRGroupCatMinimo.Enabled  := False;
        QrPlazoRes.QRFooterCatMinimo.Enabled := False;
      End Else if ( sTipoRep = coVigAct ) then
      Begin
        sTitulo1 := 'Relación de créditos vigentes';
        //
        QrPlazoRes.QRGroupEntDes.Enabled     := False;
        QrPlazoRes.QRFooterEntDes.Enabled    := False;
        QrPlazoRes.QRGroupPrograma.Enabled   := False;
        QrPlazoRes.QRFooterPrograma.Enabled  := False;
        //
        QrPlazoRes.QRGroupCatMinimo.Enabled  := True;
        QrPlazoRes.QRFooterCatMinimo.Enabled := True;
      End else if ( sTipoRep = coVdaAct )then
      Begin
        sTitulo1 := 'Relación de créditos vencidos';
        //
        QrPlazoRes.QRGroupEntDes.Enabled     := False;
        QrPlazoRes.QRFooterEntDes.Enabled    := False;
        QrPlazoRes.QRGroupPrograma.Enabled   := False;
        QrPlazoRes.QRFooterPrograma.Enabled  := False;
        //
        QrPlazoRes.QRGroupCatMinimo.Enabled  := True;
        QrPlazoRes.QRFooterCatMinimo.Enabled := True;
      End;
      //
      sTitulo2 := 'Al día '+ FormatDateTime( 'DD/MM/YYYY', sF_Reporte );
      //
      if sTipoSubRep = coPlazo then begin
        sTitulo1 := sTitulo1 + ' por plazos';
      end else if sTipoSubRep = coUDIS then begin
        QrPlazoRes.QRDBPlazoRes.Enabled := True;
        QrPlazoRes.QRlbPlazoRes.Enabled := True;
        QrPlazoRes.QRDBPlazoRes.DataField := 'UDI';
        sTitulo1 := sTitulo1 + ' por rangos';
      end else if sTipoSubRep = coDLLS then begin
        QrPlazoRes.QRDBPlazoRes.Enabled := True;
        QrPlazoRes.QRlbPlazoRes.Enabled := True;
        QrPlazoRes.QRDBPlazoRes.DataField := 'DOLAR';
        sTitulo1 := sTitulo1 + ' por rangos';
      end;
      //
      QrPlazoRes.QRInterEncabezado1.Titulo1 := sTitulo1;
      QrPlazoRes.QRInterEncabezado1.Titulo2 := sTitulo2;
      //
      QrPlazoRes.QRInterEncabezado1.Apli      := pApli;
      QrPlazoRes.QRInterEncabezado1.IdEmpresa := pAPli.IdEmpresa;

      QrPlazoRes.qyPzoRes.DatabaseName := pApli.DataBaseName;
      QrPlazoRes.qyPzoRes.SessionName := pApli.SessionName;

      QrPlazoRes.qyPzoRes.Active   := False;
      QrPlazoRes.qyPzoRes.SQL.Text := QrPlazoRes.FormaQuery( sF_Reporte,
        sGpoProd, sProducto, sMoneda,  sEntidad,
        sPrograma,  sTipoRep, sTipoSubRep,   sPzoRes,   sEmpresa, sSucursal );
      //QrPlazoRes.qyPzoRes.SQL.SaveToFile('C:\DELPHI.PLAZO.RES.' + FormatDateTime( 'dd_mm_yyyy hh_ss_nn_zzz', Now ) + '.SQL'); // LOLS 02 05 2005
      QrPlazoRes.qyPzoRes.Active:=True;

      If Trim(sArchivo)<>'' Then Begin
         sCatMin  := '';
         sEntProg := '';
         if QrPlazoRes.TipoRep = coFndVig then
         Begin
           sEntProg := 'Institución Descontadora'              + coTab +
                       'Programa de Apoyo'                     + coTab;
         End else if ( QrPlazoRes.TipoRep = coVigAct ) or ( QrPlazoRes.TipoRep = coVdaAct ) then
         Begin
           sCatMin  := 'Catálogo Mínimo'                       + coTab +
                       'Desc. Catálogo Mínimo'                 + coTab;
         End;
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, sTitulo1+ #09 );
         Writeln(F, sTitulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F,  sCatMin  +
                     'Moneda' + coTab +
                     'Descripción Moneda' + coTab +
                     'Plazo Residual'                        + coTab +
                     sEntProg                                +
                     //detalle
                     'Crédito'                               + coTab +
                     'Nombre'                                + coTab +
                     'Fecha de Inicio'                       + coTab +
                     'Fecha de Vencimiento'                  + coTab +
                     'Plazo'                                 + coTab +
                     'Tasa'                                  + coTab +
                     'Importe de Crédito'                    + coTab +
                     'Importe de Interés'                    + coTab +
                     'Importe Total'                         + coTab +
                     'Importe de Crédito Valorizado'         + coTab +
                     'Importe de Interés Valorizado'         + coTab +
                     'Importe Total Valorizado'              
                );
      End;

      If pPreview Then
         QrPlazoRes.Preview
      Else
         QrPlazoRes.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrPlazoRes.Free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;


Function TQrPlazoRes.FormaQuery( FReporte  :  TDate;   sGpoProd, sProducto,
  sMoneda, sEntidad, sPrograma, sTipoRep, sTipoSubRep, sPzoRes, sEmpresa,
  sSucursal: String): String;
var sFRep       : String;
    sFMan       : String;
    sSQL        : String;
    sPzoResSql  : String;
    sCvePzoRes  : String;
    sWPzoResSql : String;
    sFTraspaso  : String;
    sIniRango   : String;
    sSubRangoMon: String;
begin
  sFRep := SQLFecha(FReporte);
  sFMan := ' LAST_DAY( ' + SQLFecha(FReporte) + ' ) ';
  //
  sCvePzoRes := '';
  sIniRango  := '-1';
  if sTipoRep = coFndVig then
  begin
    if sTipoSubRep = coPlazo then begin
       sIniRango   := '0';
       sCvePzoRes  := 'PRFNDI';
       sWPzoResSql := 'AND  CR.F_VENCIMIENTO - ( PARAM.F_REFERENCIA + 1 ) BETWEEN PZ.RANGO_INI AND PZ.RANGO_FIN';
    end else if sTipoSubRep = coUDIS then begin
      sCvePzoRes  := 'PRFNMU';
      sWPzoResSql := 'AND  DECODE( CTTO.CVE_MONEDA, ' + coCRLF +
                     '             840, ROUND( CR.IMP_CREDITO * PARAM.DOLAR / PARAM.UDI, 2 ),' + coCRLF +
                     '             484, ROUND( CR.IMP_CREDITO / PARAM.UDI, 2 ),'               + coCRLF +
                     '             CR.IMP_CREDITO ' + coCRLF +
                     '           ) BETWEEN PZ.RANGO_INI AND PZ.RANGO_FIN';
    end else if sTipoSubRep = coDLLS then begin
      sCvePzoRes  := 'PRFNMD';
      sWPzoResSql := 'AND  DECODE( CTTO.CVE_MONEDA, ' + coCRLF +
                     '             800, ROUND( CR.IMP_CREDITO * PARAM.UDI / PARAM.DOLAR, 2 ),' + coCRLF +
                     '             484, ROUND( CR.IMP_CREDITO / PARAM.DOLAR, 2 ),'             + coCRLF +
                     '             CR.IMP_CREDITO ' + coCRLF +
                     '           ) BETWEEN PZ.RANGO_INI AND PZ.RANGO_FIN';
    end;//ends_if
  // Cartera Vigente
  End else if sTipoRep = coVigAct  then
  begin
    sFTraspaso  := '';
    if sTipoSubRep = coPlazo then begin
      sIniRango   := '0';
      sCvePzoRes  := 'PRVGDI';
      sWPzoResSql := 'AND  CR.F_VENCIMIENTO - ( PARAM.F_REFERENCIA + 1 ) BETWEEN PZ.RANGO_INI AND PZ.RANGO_FIN';
    end else if sTipoSubRep = coUDIS then begin
      sCvePzoRes  := 'PRVGMU';
      sWPzoResSql := 'AND  DECODE( CTTO.CVE_MONEDA, ' + coCRLF +
                     '             840, ROUND( CR.IMP_CREDITO * PARAM.DOLAR / PARAM.UDI, 2 ),' + coCRLF +
                     '             484, ROUND( CR.IMP_CREDITO / PARAM.UDI, 2 ),'               + coCRLF +
                     '             CR.IMP_CREDITO ' + coCRLF +
                     '           ) BETWEEN PZ.RANGO_INI AND PZ.RANGO_FIN';
    end else if sTipoSubRep = coDLLS then begin
      sCvePzoRes  := 'PRVGMD';
      sWPzoResSql := 'AND  DECODE( CTTO.CVE_MONEDA, ' + coCRLF +
                     '             800, ROUND( CR.IMP_CREDITO * PARAM.UDI / PARAM.DOLAR, 2 ),' + coCRLF +
                     '             484, ROUND( CR.IMP_CREDITO / PARAM.DOLAR, 2 ),'             + coCRLF +
                     '             CR.IMP_CREDITO ' + coCRLF +
                     '           ) BETWEEN PZ.RANGO_INI AND PZ.RANGO_FIN';
    end;//ends_if
    //
  // Cartera Vencida
  End else if sTipoRep = coVdaAct then
  Begin
    sFTraspaso  := 'NOT';
    if sTipoSubRep = coPlazo then begin
      sIniRango   := '0';
      sCvePzoRes  := 'PRVDDI';
      sWPzoResSql := 'AND  CR.F_VENCIMIENTO - ( PARAM.F_REFERENCIA + 1 ) BETWEEN PZ.RANGO_INI AND PZ.RANGO_FIN';
    end else if sTipoSubRep = coUDIS then begin
      sCvePzoRes  := 'PRVDMU';
      sWPzoResSql := 'AND  DECODE( CTTO.CVE_MONEDA, ' + coCRLF +
                     '             840, ROUND( CR.IMP_CREDITO * PARAM.DOLAR / PARAM.UDI, 2 ),' + coCRLF +
                     '             484, ROUND( CR.IMP_CREDITO / PARAM.UDI, 2 ),'               + coCRLF +
                     '             CR.IMP_CREDITO ' + coCRLF +
                     '           ) BETWEEN PZ.RANGO_INI AND PZ.RANGO_FIN';
    end else if sTipoSubRep = coDLLS then begin
      sCvePzoRes  := 'PRVDMD';
      sWPzoResSql := 'AND  DECODE( CTTO.CVE_MONEDA, ' + coCRLF +
                     '             800, ROUND( CR.IMP_CREDITO * PARAM.UDI / PARAM.DOLAR, 2 ),' + coCRLF +
                     '             484, ROUND( CR.IMP_CREDITO / PARAM.DOLAR, 2 ),'             + coCRLF +
                     '             CR.IMP_CREDITO ' + coCRLF +
                     '           ) BETWEEN PZ.RANGO_INI AND PZ.RANGO_FIN';
    end;//ends_if
  end;
  //
  sPzoResSql := '               (SELECT GC.CVE_REFERENCIA CVE_PZO_RES,' + coCRLF +
                '                       GC.VALOR DESC_PZO_RES,' + coCRLF +
                '                       R_FIN.CVE_GRUPO_CLAVE,' + coCRLF +
                '                       TO_NUMBER( NVL( R_INI.CVE_CLAVE, ' + sqlstr(sIniRango) + ' ) ) + 1 RANGO_INI,' + coCRLF +
                '                       TO_NUMBER( R_FIN.CVE_CLAVE ) RANGO_FIN' + coCRLF +
                '                FROM   (SELECT ROWNUM RN,' + coCRLF +
                '                               MC.*' + coCRLF +
                '                        FROM   CR_MAPEO_CLAVE MC' + coCRLF +
                '                        WHERE  MC.CVE_GRUPO_CLAVE = '  + SQLStr(sCvePzoRes) + coCRLF +
                '                        ORDER BY MC.CVE_CORP' + coCRLF +
                '                       )R_FIN,' + coCRLF +
                '                       (SELECT ROWNUM + 1 RN,' + coCRLF +
                '                               MC.*' + coCRLF +
                '                        FROM   CR_MAPEO_CLAVE MC' + coCRLF +
                '                        WHERE  MC.CVE_GRUPO_CLAVE = '  + SQLStr(sCvePzoRes) + coCRLF +
                '                        ORDER BY MC.CVE_CORP' + coCRLF +
                '                       )R_INI,' + coCRLF +
                '                       CR_GRUPO_CLAVE GC' + coCRLF +
                '                WHERE  R_FIN.RN = R_INI.RN(+)' + coCRLF +
                '                  AND  GC.CVE_GRUPO_CLAVE = R_FIN.CVE_GRUPO_CLAVE' + coCRLF +
                '                  AND  GC.CVE_REFERENCIA  = R_FIN.CVE_CORP' + coCRLF +
                '               )PZ';
  //
  sSubRangoMon := '';
  IF sTipoSubRep = coUDIS then
     sSubRangoMon := ' AND CVE_MONEDA <> 840';
  IF sTipoSubRep = coDLLS then
     sSubRangoMon := ' AND CVE_MONEDA =  840';
  //
  if sTipoRep = coFndVig then
  begin
    sSQL := 'SELECT ID_CREDITO,' + coCRLF +
            '       NOMBRE,' + coCRLF +
            '       F_INICIO,' + coCRLF +
            '       F_VENCIMIENTO,' + coCRLF +
            '       F_REFERENCIA,' + coCRLF +
            '       PLAZO_RESIDUAL,' + coCRLF +
            '       PCT_REDESCONTADO,' + coCRLF +
            '       IMP_CREDITO,' + coCRLF +
            '       IMP_INTERES,' + coCRLF +
            '       IMP_CREDITO + IMP_INTERES IMP_TOTAL,' + coCRLF +
            '       ROUND( IMP_CREDITO * TIPO_CAMBIO_MON, 2 ) IMP_CREDITO_VAL,'   + coCRLF +
            '       ROUND( IMP_INTERES * TIPO_CAMBIO_MON, 2 ) IMP_INTERES_VAL,'   + coCRLF +
            '       ROUND( IMP_CREDITO * TIPO_CAMBIO_MON, 2 ) +'                  + coCRLF +
            '       ROUND( IMP_INTERES * TIPO_CAMBIO_MON, 2 ) IMP_TOTAL_VAL,'     + coCRLF +
            '       CVE_MONEDA,' + coCRLF +
            '       DESC_MONEDA,' + coCRLF +
            '       CVE_FND_ENT_DES,' + coCRLF +
            '       DESC_ENT_DES,' + coCRLF +
            '       CVE_FND_PROGRAMA,' + coCRLF +
            '       DESC_PROGRAMA,' + coCRLF +
            '       UDI,' + coCRLF +
            '       DOLAR,' + coCRLF +
            '       CVE_PZO_RES,'  + coCRLF +
            '       DESC_PZO_RES,' + coCRLF +
            '       TC_CREDITO,'   + coCRLF +
            '       TASA_APLICADA' + coCRLF +
            {
            '       (SELECT NVL( TASA_APLICADA, 0 ) TASA_APLICADA '            + coCRLF +
            '        FROM   CR_FND_HIST_CRED CHC'                              + coCRLF +
            '        WHERE  CHC.ID_CREDITO       (+) = DATOS.ID_CREDITO'       + coCRLF +
            '          AND  CHC.CVE_FND_ENT_DES  (+) = DATOS.CVE_FND_ENT_DES'  + coCRLF +
            '          AND  CHC.CVE_FND_PROGRAMA (+) = DATOS.CVE_FND_PROGRAMA' + coCRLF +
            '          AND  CHC.F_CIERRE         (+) = DATOS.F_REFERENCIA'     + coCRLF +
            '       ) TASA_APLICADA' + coCRLF +
            }
            'FROM   (SELECT CR.ID_CREDITO,' + coCRLF +
            '               P.NOMBRE,' + coCRLF +
            '               CR.F_INICIO,' + coCRLF +
            '               CR.F_VENCIMIENTO,' + coCRLF +
            '               PARAM.F_REFERENCIA,' + coCRLF +
            '               CR.F_VENCIMIENTO - PARAM.F_REFERENCIA PLAZO_RESIDUAL,' + coCRLF +
            '               CR.PCT_REDESCONTADO,' + coCRLF +
            '               CR.IMP_CREDITO,' + coCRLF +
            '               CR.TASA_APLICADA,' + coCRLF +
            '               PKGBURO.STPCROBTINTPR( 2, CVE_SUB_METODO, CR.ID_CREDITO, ED.CVE_FND_ENT_DES, FP.CVE_FND_PROGRAMA, PARAM.F_REFERENCIA ) IMP_INTERES,' + coCRLF +
            '               MON.CVE_MONEDA,'              + coCRLF +
            '               MON.DESC_MONEDA,'             + coCRLF +
            '               MON.TIPO_CAMBIO_MON,'         + coCRLF +
            '               MON.TIPO_CAMBIO_MON TC_CREDITO,'       + coCRLF +
            '               ED.CVE_FND_ENT_DES,'          + coCRLF +
            '               ED.DESC_ENT_DES,'             + coCRLF +
            '               FP.CVE_FND_PROGRAMA,'         + coCRLF +
            '               FP.DESC_PROGRAMA,'            + coCRLF +
            '               PARAM.UDI,'                   + coCRLF +
            '               PARAM.DOLAR,'                 + coCRLF +
            '               PZ.CVE_PZO_RES,'              + coCRLF +
            '               PZ.DESC_PZO_RES,'             + coCRLF +
            '               CTTO.ID_EMPRESA,'             + coCRLF +
            '               CR.CVE_PRODUCTO_CRE,'         + coCRLF +
            '               CR.CVE_PRODUCTO_GPO'          + coCRLF +
            '       FROM    ('                            + coCRLF +
            '                SELECT CR.ID_CREDITO,'       + coCRLF +
            '                       CRED.ID_CONTRATO,'    + coCRLF +
            '                       CR.F_INICIO,'         + coCRLF +
            '                       CR.F_VENCIMIENTO,'    + coCRLF +
            '                       CR.PCT_REDESCONTADO,' + coCRLF +
            '                       CHC.SDO_INSOLUTO IMP_CREDITO,' + coCRLF +
            //'                       CR.IMP_CREDITO,'      + coCRLF +
            '                       CHC.TASA_APLICADA,'      + coCRLF +
            '                       CR.SIT_CREDITO,'      + coCRLF +
            '                       CR.F_LIQUIDACION,'    + coCRLF +
            '                       CR.CVE_FND_ENT_DES,'  + coCRLF +
            '                       CR.CVE_FND_PROGRAMA,' + coCRLF +
            '                       P.CVE_PRODUCTO_CRE,'  + coCRLF +
            '                       P.DESC_L_PRODUCTO,'   + coCRLF +
            '                       P.CVE_PRODUCTO_GPO,'  + coCRLF +
            '                       1 CVE_SUB_METODO'     + coCRLF +
            '                FROM   CR_FND_CREDITO CR,'   + coCRLF +
            '                       CR_CREDITO  CRED,'    + coCRLF +
            '                       CR_CONTRATO L,'       + coCRLF +
            '                       CR_PRODUCTO P,'       + coCRLF +
            '                       CR_FND_HIST_CRED CHC' + coCRLF +
            '                WHERE  CRED.ID_CREDITO    = CR.ID_CREDITO'      + coCRLF +
            '                  AND  L.ID_CONTRATO      = CRED.ID_CONTRATO'   + coCRLF +
            '                  AND  L.FOL_CONTRATO     = CRED.FOL_CONTRATO'  + coCRLF +
            '                  AND  P.CVE_PRODUCTO_CRE = L.CVE_PRODUCTO_CRE' + coCRLF +
            '                  AND  CHC.ID_CREDITO     = CR.ID_CREDITO'         + coCRLF +
            '                  AND  CHC.CVE_FND_ENT_DES  = CR.CVE_FND_ENT_DES'  + coCRLF +
            '                  AND  CHC.CVE_FND_PROGRAMA = CR.CVE_FND_PROGRAMA' + coCRLF +
            '                  AND  CHC.F_CIERRE       = ' + sFRep              + coCRLF +
            '                UNION' + coCRLF +
            '                SELECT CRED.ID_CREDITO,' + coCRLF +
            '                       CRED.ID_CONTRATO,' + coCRLF +
            '                       CRED.F_VALOR_CRED F_INICIO,' + coCRLF +
            '                       CRED.F_VALOR_CRED + CRED.DIAS_PLAZO F_VENCIMIENTO,' + coCRLF +
            '                       100 PCT_REDESCONTADO,' + coCRLF +
            '                       PROV.SDO_INSOLUTO IMP_CREDITO,' + coCRLF +
            //'                       CRED.IMP_CREDITO,' + coCRLF +
            '                       PROV.TASA_APLICADA,'      + coCRLF +
            '                       CRED.SIT_CREDITO,'        + coCRLF +
            '                       CRED.F_LIQ_BNC F_LIQUIDACION,' + coCRLF +
            '                       PA.CVE_FND_ENT_DES,' + coCRLF +
            '                       PA.CVE_FND_PROGRAMA,' + coCRLF +
            '                       TO_CHAR( CST.CVE_SUB_TIP_BCO ) CVE_SUB_TIP_BCO,' + coCRLF +
            '                       CST.DESC_SUB_TIPO,' + coCRLF +
            '                       ''GPFOVI'' CVE_PRODUCTO_GPO,' + coCRLF +
            '                       2 CVE_SUB_METODO' + coCRLF +
            '                FROM   CRE_CREDITO      CRED,' + coCRLF +
            '                       CRE_CONTRATO     L,' + coCRLF +
            '                       CRE_SUB_TIP_BCO  CST,' + coCRLF +
            '                       CRE_PROV_DIARIA  PROV,' + coCRLF +
            '                       (SELECT GCED.VALOR CVE_FND_ENT_DES,' + coCRLF +
            '                               GCPA.VALOR CVE_FND_PROGRAMA' + coCRLF +
            '                        FROM   CR_GRUPO_CLAVE  GCED,' + coCRLF +
            '                               CR_GRUPO_CLAVE  GCPA' + coCRLF +
            '                        WHERE  GCED.CVE_GRUPO_CLAVE = ''PRFOVI''' + coCRLF +
            '                          AND  GCED.CVE_REFERENCIA  = ''ENTIDADDES''' + coCRLF +
            '                          AND  GCPA.CVE_REFERENCIA  = ''PROGAPOYO''' + coCRLF +
            '                          AND  GCPA.CVE_GRUPO_CLAVE = GCED.CVE_GRUPO_CLAVE' + coCRLF +
            '                       )PA' + coCRLF +
            '                WHERE  CST.CVE_SUB_TIP_BCO = ''57''' + coCRLF +
            '                  AND  L.CVE_SUB_TIP_BCO   = CST.CVE_SUB_TIP_BCO' + coCRLF +
            '                  AND  L.ID_CONTRATO       = CRED.ID_CONTRATO' + coCRLF +
            '                  AND  PROV.ID_CREDITO     = CRED.ID_CREDITO'  + coCRLF +
            '                  AND  PROV.F_PROVISION    = ' + sFRep         + coCRLF +
            '               )CR,' + coCRLF +
            '               CR_FND_ENT_DES ED,' + coCRLF +
            '               CR_FND_PROGRAMA FP,' + coCRLF +
            '               CONTRATO    CTTO,' + coCRLF +
            '               PERSONA     P,' + coCRLF +
            '               ( SELECT MON.*,'                                                                                 + coCRLF +
            '                        NVL( PKGCORPO.OBTTIPOCAMBIO( LAST_DAY( ' + sFRep + '), MON.CVE_MONEDA, ''V'' ), 1 ) TIPO_CAMBIO_MON'+ coCRLF +
            '                 FROM   MONEDA MON'                                                                             + coCRLF +
            '               ) MON,'                                                                                          + coCRLF +
            '               (SELECT F_REFERENCIA,  UDI,   DOLAR'                                       + coCRLF +
            '                FROM   (SELECT ' + sFRep + ' F_REFERENCIA,'                               + coCRLF +
            '                               PKGCORPO.OBTTIPOCAMBIO( ' + sFMan + ', 800, ''V'' ) UDI,'  + coCRLF +
            '                               PKGCORPO.OBTTIPOCAMBIO( ' + sFMan + ', 840, ''V'' ) DOLAR' + coCRLF +
            '                        FROM   DUAL '          + coCRLF +
            '                        WHERE  ROWNUM <= 1'    + coCRLF +
            '                       )'                      + coCRLF +
            '               )PARAM,'                        + coCRLF +
            sPzoResSql                                      + coCRLF +
            '        WHERE  ( ( CR.SIT_CREDITO   = ''AC'' ) OR'        + coCRLF +
            '                 ( CR.SIT_CREDITO   = ''LQ'' AND'         + coCRLF +
            '                   CR.F_LIQUIDACION > PARAM.F_REFERENCIA' + coCRLF +
            '                 )' + coCRLF +
            '               )' + coCRLF +
            '          AND  CR.F_VENCIMIENTO  > PARAM.F_REFERENCIA' + coCRLF +
            '          AND  FP.CVE_FND_ENT_DES  = CR.CVE_FND_ENT_DES'  + coCRLF +
            '          AND  FP.CVE_FND_PROGRAMA = CR.CVE_FND_PROGRAMA' + coCRLF +
            '          AND  ED.CVE_FND_ENT_DES  = FP.CVE_FND_ENT_DES'  + coCRLF +
            '          AND  CTTO.ID_CONTRATO = CR.ID_CONTRATO'   + coCRLF +
            '          AND  P.ID_PERSONA     = CTTO.ID_TITULAR' + coCRLF +
            '          AND  MON.CVE_MONEDA   = CTTO.CVE_MONEDA' + coCRLF +
            sWPzoResSql                                         + coCRLF +
            '       ) DATOS WHERE 1 = 1 ' +  sSubRangoMon;
    //
    if sGpoProd  <> '' then
      sSQL := sSQL + '       AND CVE_PRODUCTO_GPO = ' + SQLStr( sGpoProd ) + coCRLF;
    //
    if sProducto <> '' then
      sSQL := sSQL + '       AND CVE_PRODUCTO_CRE = ' + SQLStr( sProducto )+ coCRLF;
    //
    if sMoneda   <> '' then
      sSQL := sSQL + '       AND CVE_MONEDA = ' + sMoneda + coCRLF;
    //
    if sEntidad  <> '' then
      sSQL := sSQL + '       AND CVE_FND_ENT_DES = ' + SQLStr( sEntidad ) + coCRLF;
    //
    if sPrograma <> '' then
      sSQL := sSQL + '       AND CVE_FND_PROGRAMA = ' + SQLStr( sPrograma ) + coCRLF;
    //
    if sPzoRes   <> '' then
      sSQL := sSQL + '       AND CVE_PZO_RES = ' + SQLStr( sPzoRes ) + coCRLF;
    //
    if sEmpresa  <> '' then
      sSQL := sSQL + '       AND ID_EMPRESA = ' + sEmpresa + coCRLF;
    //

    sSQL := sSQL + 'ORDER BY DESC_MONEDA, DESC_ENT_DES, DESC_PROGRAMA, CVE_PZO_RES, NOMBRE, ID_CREDITO';
  End else if ( sTipoRep = coVigAct ) OR ( sTipoRep = coVdaAct )then
  begin
    sSQL := 'SELECT DATOS.ID_CREDITO,'                          + coCRLF +
            '       DATOS.NOMBRE,'                              + coCRLF +
            '       DATOS.F_INICIO,'                            + coCRLF +
            '       DATOS.F_VENCIMIENTO,'                       + coCRLF +
            '       DATOS.F_REFERENCIA,'                        + coCRLF +
            '       DATOS.PLAZO_RESIDUAL,'                      + coCRLF +
            '       DATOS.IMP_CREDITO,'                         + coCRLF +
            '       DATOS.IMP_INTERES,'                         + coCRLF +
            '       DATOS.IMP_CREDITO + DATOS.IMP_INTERES IMP_TOTAL,'                         + coCRLF +
            '       ROUND( DATOS.IMP_CREDITO * DATOS.TIPO_CAMBIO_MON, 2 ) IMP_CREDITO_VAL,'   + coCRLF +
            '       ROUND( DATOS.IMP_INTERES * DATOS.TIPO_CAMBIO_MON, 2 ) IMP_INTERES_VAL,'   + coCRLF +
            '       ROUND( DATOS.IMP_CREDITO * DATOS.TIPO_CAMBIO_MON, 2 ) +'                  + coCRLF +
            '       ROUND( DATOS.IMP_INTERES * DATOS.TIPO_CAMBIO_MON, 2 ) IMP_TOTAL_VAL,'     + coCRLF +
            '       DATOS.CVE_MONEDA,'                          + coCRLF +
            '       DATOS.DESC_MONEDA,'                         + coCRLF +
            '       DATOS.UDI,'                                 + coCRLF +
            '       DATOS.DOLAR,'                               + coCRLF +
            '       DATOS.CVE_PZO_RES,'                         + coCRLF +
            '       DATOS.DESC_PZO_RES,'                        + coCRLF +
            '       DATOS.TC_CREDITO,'                          + coCRLF +
            '       DATOS.CVE_CAT_MIN,'                         + coCRLF +
            '       DATOS.DESC_CAT_MIN,'                        + coCRLF +
            '       (SELECT NVL( TASA_APLICADA, 0 ) TASA_APLICADA '           + coCRLF +
            '        FROM   CR_HISTO_CRED CHC'                                + coCRLF +
            '        WHERE  CHC.ID_CREDITO       (+) = DATOS.ID_CREDITO'      + coCRLF +
            '          AND  CHC.F_CIERRE         (+) = DATOS.F_REFERENCIA'    + coCRLF +
            '       ) TASA_APLICADA' + coCRLF +
            'FROM   ('                                          + coCRLF +
            '        SELECT CR.ID_CREDITO,'                     + coCRLF +
            '               P.NOMBRE,'                          + coCRLF +
            '               CR.F_INICIO,'                       + coCRLF +
            '               CR.F_VENCIMIENTO,'                  + coCRLF +
            '               PARAM.F_REFERENCIA,'                + coCRLF +
            '               CR.F_VENCIMIENTO - PARAM.F_REFERENCIA PLAZO_RESIDUAL,'  + coCRLF +
            '               CR.IMP_CREDITO,'                    + coCRLF +
            '               PKGBURO.STPCROBTINTPR( 1, CR.CVE_SUB_METODO, CR.ID_CREDITO, NULL, NULL, PARAM.F_REFERENCIA ) IMP_INTERES,' + coCRLF +
            '               CTTO.CVE_MONEDA,'                   + coCRLF +
            '               MON.DESC_MONEDA,'                   + coCRLF +
            '               PARAM.UDI,'                         + coCRLF +
            '               PARAM.DOLAR,'                       + coCRLF +
            '               PZ.CVE_PZO_RES,'                    + coCRLF +
            '               PZ.DESC_PZO_RES,'                   + coCRLF +
            '               MON.TIPO_CAMBIO_MON TC_CREDITO,'    + coCRLF +
            '               CR.CVE_CAT_MIN,'                    + coCRLF +
            '               CR.DESC_CAT_MIN,'                   + coCRLF +
            '               CR.CVE_PRODUCTO_GPO,'               + coCRLF +
            '               CR.CVE_PRODUCTO_CRE,'               + coCRLF +
            '               MON.TIPO_CAMBIO_MON'                + coCRLF +
            '        FROM   ('                                  + coCRLF +
            '                 SELECT ID_CREDITO, '              + coCRLF +
            '                        ID_CONTRATO,'              + coCRLF +
            '                        F_INICIO,'                 + coCRLF +
            '                        F_VENCIMIENTO,'            + coCRLF +
            '                        IMP_CREDITO,'              + coCRLF +
            '                        SIT_CREDITO,'              + coCRLF +
            '                        F_LIQUIDACION,'            + coCRLF +
            '                        F_TRASPASO_VENC,'          + coCRLF +
            '                        CVE_CAT_MIN,'              + coCRLF +
            '                        DESC_CAT_MIN,'             + coCRLF +
            '                        CVE_PRODUCTO_GPO,'         + coCRLF +
            '                        CVE_PRODUCTO_CRE,'         + coCRLF +
            '                        ORIGEN,'                   + coCRLF +
            '                        CVE_SUB_METODO'            + coCRLF +
            '                 FROM '                            + coCRLF +
            '                        ( '                        + coCRLF +
            '                           SELECT  ''CRED'' ORIGEN,'        + coCRLF +
            '                                   2 CVE_SUB_METODO,'       + coCRLF +
            '                                   A.ID_CREDITO, '          + coCRLF +
            '                                   A.ID_CONTRATO,'          + coCRLF +
            '                                   A.F_INICIO,'             + coCRLF +
            '                                   A.F_VENCIMIENTO,'        + coCRLF +
            '                                   NVL( PROV.SDO_INSOLUTO, 0 ) IMP_CREDITO,' + coCRLF +
            //'                                   A.IMP_CREDITO,'          + coCRLF +
            '                                   A.SIT_CREDITO,'          + coCRLF +
            '                                   A.F_LIQUIDACION,'        + coCRLF +
            '                                   NVL( PROV.F_TRASPASO_VEN, A.F_TRASPASO_VENC ) F_TRASPASO_VENC,' + coCRLF +
            '                                   A.CVE_CAT_MIN,'           + coCRLF +
            '                                   A.DESC_CAT_MIN,'          + coCRLF +
            '                                   A.F_TRASPASO_ICRE,'       + coCRLF +
            '                                   ''XX'' CVE_PRODUCTO_GPO,' + coCRLF +
            '                                   ''XX'' CVE_PRODUCTO_CRE'  + coCRLF +
            '                           FROM   (   '                      + coCRLF +
            '                                        SELECT C.ID_CREDITO, '        + coCRLF +
            '                                               C.ID_CONTRATO,'        + coCRLF +
            '                                               C.F_VALOR_CRED F_INICIO,'      + coCRLF +
            '                                               C.F_VALOR_CRED + C.DIAS_PLAZO F_VENCIMIENTO,' + coCRLF +
            '                                               C.IMP_CREDITO,'         + coCRLF +
            '                                               C.SIT_CREDITO,'         + coCRLF +
            '                                               C.F_LIQ_BNC F_LIQUIDACION,'    + coCRLF +
            '                                               C.F_TRASPASO_VENC,'     + coCRLF +
            '                                               L.CVE_CAT_MIN,'         + coCRLF +
            '                                               CATMIN.DESC_CAT_MIN,'   + coCRLF +
            '                                               CST.F_TRASPASO_ICRE '   + coCRLF +
            '                                        FROM   CRE_CREDITO C,'         + coCRLF +
            '                                               CRE_CONTRATO L,'        + coCRLF +
            '                                               CRE_SUB_TIP_BCO CST, '  + coCRLF +
            '                                               CRE_CAT_MINIMO CATMIN,' + coCRLF +
            '                                               CRE_CESION CS         ' + coCRLF +
            '                                        WHERE  L.ID_CONTRATO       = C.ID_CONTRATO'       + coCRLF +
            '                                          AND  CST.CVE_SUB_TIP_BCO = L.CVE_SUB_TIP_BCO '  + coCRLF +
            '                                          AND  CS.ID_CESION (+)    = C.ID_CESION'         + coCRLF +
            '                                          AND  CATMIN.CVE_CAT_MIN  = L.CVE_CAT_MIN'       + coCRLF +
            '                                          AND  CST.CVE_SUB_TIP_BCO NOT IN (78, 82, 88, 90, 118, 119, 120, 121, 134, 136)' + coCRLF +
            '                                  ) A,'                                  + coCRLF +
            '                                  CRE_PROV_DIARIA PROV'                  + coCRLF +
            '                           WHERE  ( ( A.F_TRASPASO_ICRE IS NOT NULL AND' + coCRLF +
            '                                      A.SIT_CREDITO NOT IN ( ''TA'' )'   + coCRLF +
            '                                    ) OR'                                + coCRLF +
            '                                    A.F_TRASPASO_ICRE IS NULL'           + coCRLF +
            '                                  )'                                     + coCRLF +
            '                             AND  ( ( A.SIT_CREDITO   = ''AC'' ) OR'     + coCRLF +
            '                                     ( A.SIT_CREDITO   = ''LQ'' AND'     + coCRLF +
            '                                       A.F_LIQUIDACION > ' + sFRep       + coCRLF +
            '                                     )'                                  + coCRLF +
            '                                  )'                                     + coCRLF +
            '                             AND  A.F_INICIO <= ' + sFRep                + coCRLF +
            '                             AND  PROV.ID_CREDITO  (+) = A.ID_CREDITO'   + coCRLF +
            '                             AND  PROV.F_PROVISION (+) = ' + sFRep       + coCRLF +
            '                           UNION ALL   '                                 + coCRLF +
            '                           SELECT A.ORIGEN,'                             + coCRLF +
            '                                  1 CVE_SUB_METODO,'                     + coCRLF +
            '                                  A.ID_CREDITO, '                        + coCRLF +
            '                                  A.ID_CONTRATO,'                        + coCRLF +
            '                                  A.F_INICIO,'                           + coCRLF +
            '                                  A.F_VENCIMIENTO,'                      + coCRLF +
            '                                   NVL( CHC.SDO_VIG_TOTAL, 0 ) IMP_CREDITO,' + coCRLF +
            //'                                  A.IMP_CREDITO,'                        + coCRLF +
            '                                  A.SIT_CREDITO,'                        + coCRLF +
            '                                  A.F_LIQUIDACION,'                      + coCRLF +
            '                                  NVL( CHC.F_TRASPASO_VENC, A.F_TRASPASO_VENC ) F_TRASPASO_VENC,'  + coCRLF +
            '                                  A.CVE_CAT_MIN,'                          + coCRLF +
            '                                  A.DESC_CAT_MIN,'                         + coCRLF +
            '                                  A.F_TRASPASO_ICRE,'                      + coCRLF +
            '                                  A.CVE_PRODUCTO_GPO,'                     + coCRLF +
            '                                  A.CVE_PRODUCTO_CRE'                      + coCRLF +
            '                           FROM   ('                                       + coCRLF +
            '                                   SELECT ''ICRE''             ORIGEN,'    + coCRLF +
            '                                          C.ID_CREDITO,'                   + coCRLF +
            '                                          C.ID_CONTRATO,'                  + coCRLF +
            '                                          C.F_INICIO,'                     + coCRLF +
            '                                          C.F_VENCIMIENTO,'                + coCRLF +
            '                                          C.IMP_CREDITO,'                  + coCRLF +
            '                                          C.SIT_CREDITO,'                  + coCRLF +
            '                                          C.F_LIQUIDACION,'                + coCRLF +
            '                                          C.F_TRASPASO_VENC,'              + coCRLF +
            '                                          A.CVE_CAT_MIN,'                  + coCRLF +
            '                                          A.DESC_CAT_MINIMO DESC_CAT_MIN,' + coCRLF +
            '                                          A.F_TRASPASO_ICRE,'              + coCRLF +
            '                                          A.CVE_PRODUCTO_GPO,'             + coCRLF +
            '                                          A.CVE_PRODUCTO_CRE'              + coCRLF +
            '                                   FROM   (SELECT ICST.ID_CONTRATO, '      + coCRLF +
            '                                                  ICST.FOL_CONTRATO, '     + coCRLF +
            '                                                  ICST.CVE_CAT_MIN,'       + coCRLF +
            '                                                  ICST.DESC_CAT_MINIMO,'   + coCRLF +
            '                                                  ICST.CVE_SUB_TIP_BCO,'   + coCRLF +
            '                                                  CST.F_TRASPASO_ICRE, '   + coCRLF +
            '                                                  ICST.CVE_PRODUCTO_GPO, ' + coCRLF +
            '                                                  ICST.CVE_PRODUCTO_CRE '  + coCRLF +
            '                                           FROM   (SELECT L.ID_CONTRATO, '   + coCRLF +
            '                                                          L.FOL_CONTRATO, '  + coCRLF +
            '                                                          SUBSTR( PROD.CVE_CLAS_CONTAB, 1, 8 ) CVE_CAT_MIN,'    + coCRLF +
            '                                                          CATMIN.DESC_CAT_MINIMO,'                              + coCRLF +
            '                                                          NVL( CTO_SBT.CVE_SUB_TIP_BCO, PST.CVE_SUB_TIP_BCO ) CVE_SUB_TIP_BCO,' + coCRLF +
            '                                                          PROD.CVE_PRODUCTO_GPO,'                               + coCRLF +
            '                                                          PROD.CVE_PRODUCTO_CRE '                               + coCRLF +
            '                                                   FROM   CR_PROD_SUB_TIPO PST, '                               + coCRLF +
            '                                                          CR_CONTRATO      L, '                                 + coCRLF +
            '                                                          CR_PRODUCTO      PROD, '                              + coCRLF +
            '                                                          CR_CAT_MINIMO    CATMIN,'                             + coCRLF +
            '                                                          CR_CTTO_SUB_TIPO CTO_SBT '                            + coCRLF +
            '                                                   WHERE  PROD.CVE_PRODUCTO_CRE  = PST.CVE_PRODUCTO_CRE '       + coCRLF +
            '                                                     AND  L.CVE_PRODUCTO_CRE     = PROD.CVE_PRODUCTO_CRE '      + coCRLF +
            '                                                     AND  CTO_SBT.ID_CONTRATO(+) = L.ID_CONTRATO '              + coCRLF +
            '                                                     AND  CATMIN.CVE_CAT_MINIMO  = PROD.CVE_CLAS_CONTAB'        + coCRLF +
            '                                                  )ICST, CRE_SUB_TIP_BCO CST '                                  + coCRLF +
            '                                           WHERE  ICST.CVE_SUB_TIP_BCO = CST.CVE_SUB_TIP_BCO '                  + coCRLF +
            '                                          )A, '                                                                 + coCRLF +
            '                                          CR_CREDITO C, '                                                       + coCRLF +
            '                                          CR_CESION CS'                                                         + coCRLF +
            '                                   WHERE  A.F_TRASPASO_ICRE IS NOT NULL'                                        + coCRLF +
            '                                     AND  C.ID_CONTRATO   = A.ID_CONTRATO'                                      + coCRLF +
            '                                     AND  C.FOL_CONTRATO  = A.FOL_CONTRATO'                                     + coCRLF +
            '                                     AND  CS.ID_CESION(+) = C.ID_CREDITO'                                       + coCRLF +
            '                                     AND  ( ( C.SIT_CREDITO   = ''AC'' ) OR'                                    + coCRLF +
            '                                             ( C.SIT_CREDITO   = ''LQ'' AND'                                    + coCRLF +
            '                                               C.F_LIQUIDACION > ' + sFRep                                      + coCRLF +
            '                                             )'                                                                 + coCRLF +
            '                                          )'                                                                    + coCRLF +
            '                                     AND  C.F_INICIO       <= '    + sFRep                                      + coCRLF +
            '                                  )A,'                                                                          + coCRLF +
            '                                  CR_HISTO_CRED CHC'                                                            + coCRLF +
            '                           WHERE  CHC.ID_CREDITO(+) = A.ID_CREDITO'                                             + coCRLF +
            '                             AND  CHC.F_CIERRE  (+) = '  + sFRep                                                + coCRLF +
            '                        )  CR '                                                                                 + coCRLF +
            '               )CR,'                                                                                            + coCRLF +
            '               CONTRATO CTTO,'                                                                                  + coCRLF +
            '               PERSONA P,'                                                                                      + coCRLF +
            '               ( SELECT MON.*,'                                                                                 + coCRLF +
            '                        NVL( PKGCORPO.OBTTIPOCAMBIO( LAST_DAY( ' + sFRep + '), MON.CVE_MONEDA, ''V'' ), 1 ) TIPO_CAMBIO_MON'+ coCRLF +
            '                 FROM   MONEDA MON'                                                                             + coCRLF +
            '               ) MON,'                                                                                          + coCRLF +
            '               (SELECT F_REFERENCIA,  UDI,   DOLAR'                                                             + coCRLF +
            '                FROM   (SELECT ' + sFRep + ' F_REFERENCIA,'                                                     + coCRLF +
            '                               PKGCORPO.OBTTIPOCAMBIO(  LAST_DAY( ' + sFRep + ') , 800, ''V'' ) UDI,'           + coCRLF +
            '                               PKGCORPO.OBTTIPOCAMBIO(  LAST_DAY( ' + sFRep + ') , 840, ''V'' ) DOLAR'          + coCRLF +
            '                        FROM   DUAL '                                                                           + coCRLF +
            '                        WHERE  ROWNUM <= 1'                                                                     + coCRLF +
            '                       )'                                                                                       + coCRLF +
            '               )PARAM,'                                                                                         + coCRLF +
                        sPzoResSql                                                                                                                       + coCRLF +
            '        WHERE  CTTO.ID_CONTRATO = CR.ID_CONTRATO'                                                               + coCRLF +
            '          AND  P.ID_PERSONA     = CTTO.ID_TITULAR'                                                              + coCRLF +
            '          AND  MON.CVE_MONEDA   = CTTO.CVE_MONEDA  '                                                            + coCRLF +
                        sWPzoResSql                                                                                          + coCRLF +
            '          AND  CR.F_TRASPASO_VENC IS ' + sFTraspaso + ' NULL'                                                    + coCRLF +
            '          AND  CTTO.ID_EMPRESA = ' + IntToStr( Apli.IdEmpresa )                                                 + coCRLF +
            '       )DATOS'                                                                                                  + coCRLF +
            'WHERE 1 = 1 ' + sSubRangoMon;
    if sGpoProd  <> '' then
      sSQL := sSQL + '       AND DATOS.CVE_PRODUCTO_GPO = ' + SQLStr( sGpoProd ) + coCRLF;
    //
    if sProducto <> '' then
      sSQL := sSQL + '       AND DATOS.CVE_PRODUCTO_CRE = ' + SQLStr( sProducto )+ coCRLF;
    //
    if sMoneda   <> '' then
      sSQL := sSQL + '       AND DATOS.CVE_MONEDA = ' + sMoneda + coCRLF;
    //
    if sPzoRes   <> '' then
      sSQL := sSQL + '       AND DATOS.CVE_PZO_RES = ' + SQLStr( sPzoRes ) + coCRLF;
    //
    sSQL := sSQL + 'ORDER BY DATOS.CVE_CAT_MIN, DATOS.DESC_MONEDA, DATOS.CVE_PZO_RES, DATOS.NOMBRE, DATOS.ID_CREDITO';
  end;
  //
  Result := sSQL;
end;

procedure TQrPlazoRes.QRGroupEntDesBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
  qrmResxEntidad.Lines.Clear;
  qrmResxEntTotal.Lines.Clear;
  qrmResxEntTotVal.Lines.Clear;
end;


function StrToDblDef(const S: string; Default: Double): Double;
begin
  try result := StrToFloat(S); except result := Default; end;
end;


Procedure TQrPlazoRes.QRDetalleBeforePrint(SEnder: TQRCustomBand; Var PrintBand: Boolean);
var sEntProg : String;
    sCatMin  : String;
    sName    : String;
begin
  sName := qyPzoRes.FieldByName('CVE_PZO_RES').AsString + '_' +
           qyPzoRes.FieldByName('DESC_PZO_RES').AsString;
  qrmResxEntidad.Lines.Values[ sName ]   := IntToStr  ( StrToIntDef(qrmResxEntidad.Lines.Values[ sName ], 0 ) + 1 );
  qrmResxEntTotal.Lines.Values[ sName ]  := FloatToStr( StrToDblDef(qrmResxEntTotal.Lines.Values[ sName ], 0 ) +
                                                                    qyPzoRes.FieldByName('IMP_TOTAL').AsFloat );
  qrmResxEntTotVal.Lines.Values[ sName ] := FloatToStr( StrToDblDef(qrmResxEntTotVal.Lines.Values[ sName ], 0 ) +
                                                                    qyPzoRes.FieldByName('IMP_TOTAL_VAL').AsFloat );
  If sArchivo <>'' Then
  begin
    sCatMin  := '';
    sEntProg := '';
    if TipoRep = coFndVig then
    Begin
      sEntProg := qyPzoRes.FieldByName('DESC_ENT_DES').AsString     + coTab +
                  qyPzoRes.FieldByName('DESC_PROGRAMA').AsString    + coTab;
    End else if ( TipoRep = coVigAct ) or ( TipoRep = coVdaAct ) then
    Begin
      sCatMin  := qyPzoRes.FieldByName('CVE_CAT_MIN').AsString      + coTab +
                  qyPzoRes.FieldByName('DESC_CAT_MIN').AsString     + coTab;
    End;
    //
    Writeln(F,
            sCatMin                                           +
            qyPzoRes.FieldByName('CVE_MONEDA').AsString       + coTab +
            qyPzoRes.FieldByName('DESC_MONEDA').AsString      + coTab +
            qyPzoRes.FieldByName('DESC_PZO_RES').AsString     + coTab +
            sEntProg                                          +
            qyPzoRes.FieldByName('ID_CREDITO').AsString       + coTab +
            qyPzoRes.FieldByName('NOMBRE').AsString           + coTab +
            qyPzoRes.FieldByName('F_INICIO').AsString         + coTab +
            qyPzoRes.FieldByName('F_VENCIMIENTO').AsString    + coTab +
            qyPzoRes.FieldByName('PLAZO_RESIDUAL').AsString   + coTab +
            qyPzoRes.FieldByName('TASA_APLICADA').AsString    + coTab +
            qyPzoRes.FieldByName('IMP_CREDITO').AsString      + coTab +
            qyPzoRes.FieldByName('IMP_INTERES').AsString      + coTab +
            qyPzoRes.FieldByName('IMP_TOTAL').AsString        + coTab +
            qyPzoRes.FieldByName('IMP_CREDITO_VAL').AsString  + coTab +
            qyPzoRes.FieldByName('IMP_INTERES_VAL').AsString  + coTab +
            qyPzoRes.FieldByName('IMP_TOTAL_VAL').AsString
           );
  end;
  //
End;

procedure TQrPlazoRes.QRBFootPzoBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
var s1, s2 : string;
begin
  If sArchivo <>'' Then
  begin
    s1 := '';    s2 := '';
    if QRlbPlazoRes.Enabled then
    begin
      s1 := 'TC Plazo Residual';
    //
      if QRDBPlazoRes.DataField = 'UDI' then
        s2 := qyPzoRes.FieldByName('UDI').AsString
      else if QRDBPlazoRes.DataField = 'DOLAR' then
        s2 := qyPzoRes.FieldByName('DOLAR').AsString;
    end;
    //
    Writeln(F, coTab + coTab + coTab + coTab + coTab + 'Total x Plazo Residual ' +
               qyPzoRes.FieldByName('DESC_PZO_RES').AsString   + coTab +
               IntToStr( qreCntxPzo.Value.intResult )          + coTab +
               coTab + coTab + s1 + coTab + s2                 + coTab +
               FloatToStr( qreImpCredxPzo.Value.dblResult )    + coTab +
               FloatToStr( qreImpIntxPzo.Value.dblResult  )    + coTab +
               FloatToStr( qreImpTotxPzo.Value.dblResult  )    + coTab +
               FloatToStr( qreImpCredxPzoVal.Value.dblResult ) + coTab +
               FloatToStr( qreImpIntxPzoVal.Value.dblResult  ) + coTab +
               FloatToStr( qreImpTotxPzoVal.Value.dblResult  )
           );
  end;
  //
end;

procedure TQrPlazoRes.QRFooterProgramaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  If sArchivo <>'' Then
  begin
    Writeln(F, coTab + coTab + coTab + coTab + coTab + 'Total x Programa' + coTab +
               IntToStr( qreCntxProg.Value.intResult ) +
               coTab + coTab + coTab + coTab +
               qyPzoRes.FieldByName('TC_CREDITO').AsString   + coTab   +
               FloatToStr( qreImpCredxProg.Value.dblResult ) + coTab +
               FloatToStr( qreImpIntxProg.Value.dblResult  ) + coTab +
               FloatToStr( qreImpTotxProg.Value.dblResult  ) + coTab +
               FloatToStr( qreImpCredxProgVal.Value.dblResult ) + coTab +
               FloatToStr( qreImpIntxProgVal.Value.dblResult  ) + coTab +
               FloatToStr( qreImpTotxProgVal.Value.dblResult  )
           );
  end;
end;
//
procedure ProcesaMemo( Lista : TStrings; QuitaLeft : Boolean; FormatAsCurr : Boolean  );
var i     : integer;
    ipos  : integer;
    sCad  : String;
    sList : TStringList;
begin
  sList  := TStringList.Create;
  try
    //
    sList.Clear;
    sList.Assign(Lista);
    sList.Sort;
    //
    for i := 0 to sList.Count - 1 do
    Begin
      sCad := sList.Strings[i];
      ipos := pos( '=', sCad );
      if QuitaLeft then
        sCad := copy(sCad, ipos + 1, length(sCad) )
      else begin
        sCad := copy(sCad, 1,  ipos - 1 );
        ipos := pos( '_', sCad );
        sCad := copy(sCad, ipos + 1, length(sCad) );
      end;
      //
      if FormatAsCurr then
        sCad := FormatCurr( '###,###,###,###,###,##0.00', StrToDblDef( sCad, 0 ) );
      //
      sList.Strings[i] := sCad;
    End;
    Lista.Assign(sList);
    //
  finally
    sList.Free;
  end;
  //
end;
//
procedure TQrPlazoRes.QRFooterEntDesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var i : integer;
    c1, c2 : Double;
begin
  ProcesaMemo( qrmResxEntidad.Lines,   False, False );
  ProcesaMemo( qrmResxEntTotal.Lines,  True,  True  );
  ProcesaMemo( qrmResxEntTotVal.Lines, True,  True  );
  //
  qrmResxEntidad.Lines.Add('');
  qrmResxEntTotal.Lines.Add('__________________');
  qrmResxEntTotVal.Lines.Add('__________________');
  //
  FillChar( c1, sizeof(c1), #0 );
  FillChar( c2, sizeof(c2), #0 );
  for i := 0 to qrmResxEntTotVal.Lines.Count - 1 do
  begin
    c1 := c1 + CurrFromFrmFloat( qrmResxEntTotal.Lines.Strings[i] );
    c2 := c2 + CurrFromFrmFloat( qrmResxEntTotVal.Lines.Strings[i] );
  end;
  qrmResxEntidad.Lines.Add('TOTAL');
  qrmResxEntTotal.Lines.Add ( FormatCurr( '###,###,###,###,###,##0.00', c1 ) );
  qrmResxEntTotVal.Lines.Add( FormatCurr( '###,###,###,###,###,##0.00', c2 ) );
  //
  qrmResxEntidad.Height   := ( ( qrmResxEntidad.Lines.Count   ) * coHEIGHT );
  qrmResxEntTotal.Height  := ( ( qrmResxEntTotal.Lines.Count  ) * coHEIGHT );
  qrmResxEntTotVal.Height := ( ( qrmResxEntTotVal.Lines.Count ) * coHEIGHT );
  //
  QRFooterEntDes.Height   := ( coHEIGHT * 2 ) + qrmResxEntidad.Height;
  //
  If sArchivo <>'' Then
  begin
    Writeln(F, coTab + coTab + coTab + coTab + coTab + 'Total x Entidad' + coTab +
               IntToStr( qreCntxEnt.Value.intResult ) +
               coTab + coTab + coTab + coTab +
               qyPzoRes.FieldByName('TC_CREDITO').AsString  + coTab +
               FloatToStr( qreImpCredxEnt.Value.dblResult ) + coTab +
               FloatToStr( qreImpIntxEnt.Value.dblResult  ) + coTab +
               FloatToStr( qreImpTotxEnt.Value.dblResult  ) + coTab +
               FloatToStr( qreImpCredxEntVal.Value.dblResult ) + coTab +
               FloatToStr( qreImpIntxEntVal.Value.dblResult  ) + coTab +
               FloatToStr( qreImpTotxEntVal.Value.dblResult  )
           );
  end;
end;

procedure TQrPlazoRes.QRFooterMonedaBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
  If sArchivo <>'' Then
  begin
    //
    Writeln(F, coTab + coTab + coTab + coTab + coTab + 'Total x Moneda' + coTab +
               IntToStr( qreCntxMon.Value.intResult ) + coTab   + coTab +
               qyPzoRes.FieldByName('DESC_MONEDA').AsString     + coTab + coTab +
               qyPzoRes.FieldByName('TC_CREDITO').AsString      + coTab +
               FloatToStr(qreImpCredxMon.Value.dblResult)       + coTab +
               FloatToStr(qreImpIntxMon.Value.dblResult)        + coTab +
               FloatToStr(qreImpTotxMon.Value.dblResult)        + coTab +
               FloatToStr(qreImpCredxMonVal.Value.dblResult)    + coTab +
               FloatToStr(qreImpIntxMonVal.Value.dblResult)     + coTab +
               FloatToStr(qreImpTotxMonVal.Value.dblResult)
           );
  end;
  //
end;

procedure TQrPlazoRes.QRFooterCatMinimoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If sArchivo <>'' Then
  begin
    Writeln(F, coTab + coTab + coTab + coTab + coTab + 'Total x catálogo mínimo' + coTab +
               IntToStr( qreCntxCMin.Value.intResult ) + coTab   + coTab +
               qyPzoRes.FieldByName('DESC_CAT_MIN').AsString     + coTab + coTab + coTab +
               // qyPzoRes.FieldByName('TC_CREDITO').AsString
               coTab + // FloatToStr(qreImpCredxMon.Value.dblResult)       + coTab +
               coTab + // FloatToStr(qreImpIntxMon.Value.dblResult)        + coTab +
               coTab + // FloatToStr(qreImpTotxMon.Value.dblResult)        + coTab +
               FloatToStr(qreImpCredxCMinVal.Value.dblResult)    + coTab +
               FloatToStr(qreImpIntxCMinVal.Value.dblResult)     + coTab +
               FloatToStr(qreImpTotxCMinVal.Value.dblResult)
           );
  end;
  //
end;




Procedure TQrPlazoRes.QRFootContadorBeforePrint(SEnder: TQRCustomBand; var PrintBand: Boolean);
Begin
  If sArchivo <>'' Then
  begin
    //
    Writeln(F, coTab + coTab + coTab + coTab + coTab + 'Total General' + coTab +
               IntToStr( qreCntxGlob.Value.intResult )  + coTab + coTab +
               coTab + coTab + coTab +
               coTab + // FloatToStr(qreImpCredxGlob.Value.dblResult) + coTab +
               coTab + // FloatToStr(qreImpIntxGlob.Value.dblResult)  + coTab +
               coTab + // FloatToStr(qreImpTotxGlob.Value.dblResult)  + coTab +
               FloatToStr(qreImpCredxGlobVal.Value.dblResult) + coTab +
               FloatToStr(qreImpIntxGlobVal.Value.dblResult)  + coTab +
               FloatToStr(qreImpTotxGlobVal.Value.dblResult)
           );
    Flush(F);
  end;
  //
End;



End.

