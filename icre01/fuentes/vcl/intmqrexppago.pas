Unit IntMQrExpPago;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport, Dialogs,
  IntBlqCtos,
  ComObj,
  IntXls,
  ShellApi,
  IntQrCedExPg
  ;
  
Type
  TQrExpPago = Class(TQuickRep)
    qyExpPago: TQuery;
    QRBand1: TQRBand;
    qrdbID_PERSONA: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText24: TQRDBText;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRGroupContador: TQRGroup;
    qyExpPagoID_PERSONA: TFloatField;
    QRDBText3: TQRDBText;
    qyExpPagoNOMBRE: TStringField;
    ColumnHeaderBand1: TQRBand;
    QRShape2: TQRShape;
    QRSHPTMonto: TQRShape;
    QRLabel18: TQRLabel;
    QRSHPTSaldoIsoluto: TQRShape;
    QRLabel20: TQRLabel;
    QRSHPTChequera: TQRShape;
    QRLabel14: TQRLabel;
    QRSHPTProveedor: TQRShape;
    QRLabel33: TQRLabel;
    QRShape8: TQRShape;
    QRLabel44: TQRLabel;
    QRShape9: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    qyExpPagoDIASANIO: TFloatField;
    qyExpPagoDIASTOT: TFloatField;
    qyExpPagoDIAS_MOR: TFloatField;
    QRDBText2: TQRDBText;
    qyExpPagoF_MOR: TFloatField;
    qrlblID_ACREDITADO: TQRLabel;
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);

  Private
    vgBGeneraArchivoExcel : Boolean;
    vgNumRow : Integer;
    vgExcelAppPlano : OleVariant;
    vgFileNameExcel : String;    

    procedure IniciaArchivoExcel(peFileName : String);
    function  Cierra_Y_Guarda_ArchivoExcel : Boolean;
  Public
    Function FormaQuery(peApli : TInterApli; sAcreditado, sEmpresa, sSucursal : String;
                        dFecha   : TDateTime ): String;
    Function FormaQuery2(peApli : TInterApli; sAcreditado, sEmpresa, sSucursal : String;
                         dFecha   : TDateTime ): String;
  end;
Var
  QrExpPago: TQrExpPago;
  Apli : TInterApli;

Procedure RepExpPago( sAcreditado, sEmpresa, sSucursal : String;
                       dFecha   : TDateTime;
                       pAPli    : TInterApli;
                       pPreview : Boolean;
                       pNombArchivo : String
                    );
Implementation
{$R *.DFM}

Procedure RepExpPago( sAcreditado, sEmpresa, sSucursal : String;
                      dFecha   : TDateTime;
                      pAPli    : TInterApli;
                      pPreview : Boolean;
                      pNombArchivo : String
                    );
Var
   QrExpPago: TQrExpPago;
   Preview     : TIntQRPreview;
Begin
   QrExpPago:=TQrExpPago.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrExpPago);
   Try

      Apli := pApli;
      QrExpPago.QRInterEncabezado1.Apli:=pApli;
      QrExpPago.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrExpPago.QRInterEncabezado1.NomReporte:='IntMQrExpPago';
      QrExpPago.QRInterEncabezado1.Titulo1:='Reporte de Experiencia de Pago';
      QrExpPago.QRInterEncabezado1.Titulo2:='Al ' + DateToStr(dFecha);


      QrExpPago.vgBGeneraArchivoExcel := (Trim(ExtractFileName(pNombArchivo)) <> '');
      If (QrExpPago.vgBGeneraArchivoExcel) Then
        Begin
        QrExpPago.vgFileNameExcel := pNombArchivo;
        QrExpPago.IniciaArchivoExcel(pNombArchivo);
        End;


      QrExpPago.qyExpPago.DatabaseName := pApli.DataBaseName;
      QrExpPago.qyExpPago.SessionName := pApli.SessionName;

      QrExpPago.qyExpPago.Active:=False;
      QrExpPago.qyExpPago.SQL.Text:= QrExpPago.FormaQuery2(pApli, sAcreditado, sEmpresa, sSucursal,dFecha);
      QrExpPago.qyExpPago.SQL.SaveToFile('c:\ExtPago.txt');
      QrExpPago.qyExpPago.Active:=True;

      If pPreview Then
         QrExpPago.Preview
      Else
         QrExpPago.Print;

      If QrExpPago.vgBGeneraArchivoExcel Then
        Begin
        If QrExpPago.Cierra_Y_Guarda_ArchivoExcel Then
           If (MessageDlg('Se generó el archivo '+pNombArchivo+'.'+coCRLF+
                           '¿Desea abrirlo?', mtInformation, [mbYes, mbNo], 0) = mrYes) Then
              ShellExecute(QrExpPago.Handle, 'open', 'excel', Pchar('"'+pNombArchivo+'"'), Nil, SW_SHOW);
        End;
         
   Finally
      QrExpPago.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

procedure TQrExpPago.IniciaArchivoExcel(peFileName : String);
const aColumnWidth : Array[1..4] of Double = (  11.00,  40.00, 11.00, 11.00 );
      aColumnTitle : Array[1..4] of String = ( 'Id. Acreditado', 'Acreditado', 'Experiencia de pago en 12 meses', 'Experiencia de pago total (durante la vida del acreditado)');

var vlColumnRange : Variant;
    vlRange : Variant;
    vlCol : Integer;
begin
  vgNumRow := 1;

  vgExcelAppPlano := CreateOleObject('Excel.Application');
  vgExcelAppPlano.Workbooks.Add;

  vlColumnRange := vgExcelAppPlano.Workbooks[1].WorkSheets[1].Columns;
  // Coloca el ancho de las columnas
  For vlCol := 1 To High(aColumnWidth) Do
    Begin
    vlColumnRange.Columns[vlCol].Font.Size     := 8;
    vlColumnRange.Columns[vlCol].ColumnWidth   := aColumnWidth[vlCol];
    vgExcelAppPlano.Cells[ vgNumRow , vlCol ].Value := aColumnTitle[vlCol]; // Coloca el título de las columna
    End;

  vgExcelAppPlano.Range['A'+IntToStr(vgNumRow)+':'+IntToColumnXlS(High(aColumnTitle))+IntToStr(vgNumRow)].Font.Bold  := True;
  vgExcelAppPlano.Range['A'+IntToStr(vgNumRow)+':'+IntToColumnXlS(High(aColumnTitle))+IntToStr(vgNumRow)].Font.Color := clWhite;
  vlRange := vgExcelAppPlano.Workbooks[1].WorkSheets[1].Range['A'+IntToStr(vgNumRow)+':'+IntToColumnXlS(High(aColumnTitle))+IntToStr(vgNumRow)];
  vlRange.Columns.Interior.ColorIndex := 1;
  // Se aumenta un renglon más en donde dara inicio la colocación de la información
  Inc(vgNumRow);
end;

function TQrExpPago.Cierra_Y_Guarda_ArchivoExcel : Boolean;
begin
  Result := False;
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivoExcel) Then Exit;

  vgExcelAppPlano.ActiveWorkBook.SaveAs(vgFileNameExcel);
  Result := CloseExcelFile(vgExcelAppPlano);
end;



Function TQrExpPago.FormaQuery(peApli : TInterApli; sAcreditado, sEmpresa, sSucursal : String;
                               dFecha   : TDateTime ): String;
Var
    sSQL:String;
Begin
    sSQL:= ' SELECT ACR.ID_TITULAR AS ID_PERSONA, '+coCRLF+
           '        NOM.NOMBRE, '+coCRLF+
           '        NVL(DIAS_BINTER.DIASANIO,0) AS DIASANIO, '+coCRLF+
           '        NVL(DIAS_BINTER.DIASTOT,0) AS DIASTOT, '+coCRLF+
           '        ATRASO_MAYOR_BNC AS DIAS_MOR, '+coCRLF+
           '        MAX_F_ACTUALIZA_BNC F_MOR '+coCRLF+

           '   FROM (SELECT CTO.ID_TITULAR '+coCRLF+
           '           FROM CR_CONTRATO CCTO, CONTRATO CTO '+coCRLF+
           '          WHERE CCTO.ID_CONTRATO = CTO.ID_CONTRATO '+coCRLF+coCRLF+
           ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMEXPPAGO', '            AND CCTO.ID_CONTRATO ', False ) { < SATV4766 04/09/2006> }
           ;

   If (Trim(sAcreditado)<>'') Then
      sSQL:= sSQL + ' AND CTO.ID_TITULAR = '+ sAcreditado+coCRLF;
   If (Trim(sEmpresa)<>'') Then
      sSQL:= sSQL + ' AND CTO.ID_EMPRESA = '+ sEmpresa+coCRLF;

    sSQL:= sSQL +
           '          GROUP BY CTO.ID_TITULAR '+coCRLF+
           '        )ACR, '+coCRLF+

           ' (SELECT CSAB.ID_ACREDITADO , '+coCRLF+
           '         MAX(ATRASO_MAYOR) AS ATRASO_MAYOR_BNC, '+coCRLF+
           '         MAX(F_ACTUALIZA_BNC) AS MAX_F_ACTUALIZA_BNC '+coCRLF+
           '    FROM CR_SICC_AR_BNC CSAB, '+coCRLF+
           '         (SELECT CSC.ID_SICC_CONF, CONFIGURACION.* '+coCRLF+
           '            FROM CR_SICC_CONF CSC, '+coCRLF+
           '                 (SELECT MAX(CSC.ANIO_MES) AS ANIO_MES, FECHAS.ANIO_MES_INICIAL, FECHAS.ANIO_MES_FINAL '+coCRLF+
           '                    FROM '+coCRLF+
           '                      (SELECT TO_NUMBER(TO_CHAR(ADD_MONTHS(F.F_REFERENCIA,-12),''YYYYMM'')) AS ANIO_MES_INICIAL, '+coCRLF+
           '                              TO_NUMBER(TO_CHAR(F.F_REFERENCIA,''YYYYMM'')) AS ANIO_MES_FINAL '+coCRLF+
           '                       FROM  ( SELECT LAST_DAY(' + SQLFecha(dFecha) + ') AS F_REFERENCIA FROM DUAL ) F '+coCRLF+
           '                      ) FECHAS, '+coCRLF+
           '                      (SELECT * FROM CR_SICC_CONF '+coCRLF+
           '                        WHERE SIT_SICC_CONF <> ''CA''' +coCRLF+
           '                      )CSC '+coCRLF+
           '                   WHERE ANIO_MES <= FECHAS.ANIO_MES_FINAL '+coCRLF+
           '                   GROUP BY FECHAS.ANIO_MES_INICIAL, FECHAS.ANIO_MES_FINAL '+coCRLF+
           '                 ) CONFIGURACION '+coCRLF+
           '           WHERE CSC.ANIO_MES  = CONFIGURACION.ANIO_MES '+coCRLF+
           '             AND CSC.SIT_SICC_CONF <> ''CA''' +coCRLF+
           '         )TEMP '+coCRLF+
           '   WHERE CSAB.ID_SICC_CONF = TEMP.ID_SICC_CONF '+coCRLF+
           '     AND CSAB.F_ACTUALIZA_BNC BETWEEN TEMP.ANIO_MES_INICIAL AND TEMP.ANIO_MES_FINAL '+coCRLF+
           '     AND CSAB.SIT_SICC_AR_BNC <> ''CA'''+coCRLF;

   If (Trim(sAcreditado)<>'') Then
      sSQL:= sSQL + ' AND CSAB.ID_ACREDITADO = '+ sAcreditado+coCRLF;

   sSQL:= sSQL +

           '   GROUP BY ID_ACREDITADO '+coCRLF+
           '  )BURO, PERSONA NOM, '+coCRLF+

           ' (SELECT ID_TITULAR, MAX(DIASANIO) as DIASANIO,MAX(DIAS_TOTAL) as DIASTOT '+coCRLF+
           '    FROM '+coCRLF+
           ' (SELECT T1.ID_CREDITO, T1.DIASANIO, T2.DIAS_TOTAL, CTO.ID_TITULAR '+coCRLF+
           '    FROM (SELECT * FROM CR_CREDITO CC '+coCRLF+
           '           WHERE CC.F_AUTORIZA <=  ' + SQLFecha(dFecha) +coCRLF+
           '             AND (CC.F_LIQUIDACION >=  ' + SQLFecha(dFecha) +coCRLF+
           '             OR CC.F_LIQUIDACION IS NULL) '+coCRLF+
           '             AND CC.SIT_CREDITO <> ''CA'''+coCRLF+
           '         ) CC, '+coCRLF+
           '  (SELECT ID_CREDITO, '+coCRLF+
           '          MAX(NVL2(CR1.F_PAGO, DECODE(SIGN(CR1.F_PAGO - CR1.F_PROG_PAGO),-1, 0, CR1.F_PAGO - CR1.F_PROG_PAGO), '+coCRLF+
           '                   DECODE(SIGN(' + SQLFecha(dFecha) + '- CR1.F_PROG_PAGO),-1, 0, '+coCRLF+
           '                      ' + SQLFecha(dFecha) + '- CR1.F_PROG_PAGO))) DIASANIO '+coCRLF+
           '     FROM (SELECT ID_CREDITO, F_PROG_PAGO, F_PAGO '+coCRLF+
           '             FROM CR_CAPITAL '+coCRLF+
           '            WHERE F_PROG_PAGO BETWEEN ADD_MONTHS(' + SQLFecha(dFecha) + ',-12) AND  ' + SQLFecha(dFecha) +coCRLF+
           '            GROUP BY ID_CREDITO, F_PROG_PAGO, F_PAGO '+coCRLF+
           '           UNION ALL '+coCRLF+
           '           SELECT ID_CREDITO, F_PROG_PAGO, F_PAGO '+coCRLF+
           '             FROM CR_INTERES '+coCRLF+
           '            WHERE F_PROG_PAGO BETWEEN ADD_MONTHS(' + SQLFecha(dFecha) + ',-12) AND ' + SQLFecha(dFecha) + '     GROUP BY ID_CREDITO, F_PROG_PAGO, F_PAGO '+coCRLF+
           '           UNION ALL '+coCRLF+
           '           SELECT ID_CREDITO, F_PROG_PAGO, F_PAGO '+coCRLF+
           '             FROM CR_COMISION '+coCRLF+
           '            WHERE F_PROG_PAGO BETWEEN ADD_MONTHS(' + SQLFecha(dFecha) + ',-12) AND ' + SQLFecha(dFecha) +coCRLF+
           '            GROUP BY ID_CREDITO, F_PROG_PAGO, F_PAGO '+coCRLF+
           '           UNION ALL '+coCRLF+
           '           SELECT ID_CREDITO, F_PROG_PAGO, F_PAGO '+coCRLF+
           '             FROM CR_FINAN_ADIC '+coCRLF+
           '            WHERE F_PROG_PAGO BETWEEN ADD_MONTHS(' + SQLFecha(dFecha) + ',-12) AND ' + SQLFecha(dFecha) +coCRLF+
           '            GROUP BY ID_CREDITO, F_PROG_PAGO, F_PAGO '+coCRLF+
           '          )CR1 '+coCRLF+
           '    GROUP BY CR1.ID_CREDITO '+coCRLF+
           '  )T1, '+coCRLF+
           '  (SELECT ID_CREDITO, '+coCRLF+
           '          MAX(NVL2(CR2.F_PAGO, DECODE(SIGN(CR2.F_PAGO - CR2.F_PROG_PAGO),-1, 0, CR2.F_PAGO - CR2.F_PROG_PAGO) , '+coCRLF+
           '                   DECODE(SIGN(' + SQLFecha(dFecha) + '- CR2.F_PROG_PAGO),-1, 0, '+coCRLF+
           '                      ' + SQLFecha(dFecha) + '- CR2.F_PROG_PAGO))) DIAS_TOTAL '+coCRLF+
           '     FROM (SELECT ID_CREDITO, F_PROG_PAGO, F_PAGO '+coCRLF+
           '             FROM CR_CAPITAL '+coCRLF+
           '            WHERE F_PROG_PAGO < ' + SQLFecha(dFecha) +coCRLF+
           '            GROUP BY ID_CREDITO, F_PROG_PAGO, F_PAGO '+coCRLF+
           '           UNION ALL '+coCRLF+
           '           SELECT ID_CREDITO, F_PROG_PAGO, F_PAGO '+coCRLF+
           '             FROM CR_INTERES '+coCRLF+
           '            WHERE F_PROG_PAGO < ' + SQLFecha(dFecha) +coCRLF+
           '            GROUP BY ID_CREDITO, F_PROG_PAGO, F_PAGO '+coCRLF+
           '           UNION ALL '+coCRLF+
           '           SELECT ID_CREDITO, F_PROG_PAGO, F_PAGO '+coCRLF+
           '             FROM CR_COMISION '+coCRLF+
           '            WHERE F_PROG_PAGO < ' + SQLFecha(dFecha) +coCRLF+
           '            GROUP BY ID_CREDITO, F_PROG_PAGO, F_PAGO '+coCRLF+
           '           UNION ALL '+coCRLF+
           '           SELECT ID_CREDITO, F_PROG_PAGO, F_PAGO '+coCRLF+
           '             FROM CR_FINAN_ADIC '+coCRLF+
           '            WHERE F_PROG_PAGO < ' + SQLFecha(dFecha) +coCRLF+
           '            GROUP BY ID_CREDITO, F_PROG_PAGO, F_PAGO '+coCRLF+
           '          )CR2 '+coCRLF+
           '    GROUP BY CR2.ID_CREDITO '+coCRLF+
           '  )T2, CONTRATO CTO '+coCRLF+
           ' WHERE T1.ID_CREDITO = CC.ID_CREDITO '+coCRLF+
           '   AND T1.ID_CREDITO = T2.ID_CREDITO '+coCRLF+
           '   AND CTO.ID_CONTRATO = CC.ID_CONTRATO '+coCRLF+coCRLF+
           ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMEXPPAGO', '   AND CTO.ID_CONTRATO ', False ) { < SATV4766 04/09/2006> }
           ;

   If (Trim(sAcreditado)<>'') Then
      sSQL:= sSQL + ' AND CTO.ID_TITULAR = '+ sAcreditado;
   If (Trim(sEmpresa)<>'') Then
      sSQL:= sSQL + ' AND CTO.ID_EMPRESA = '+ sEmpresa;

    sSQL:= sSQL +
           ' )'+
           ' GROUP BY ID_TITULAR '+
           ' )DIAS_BINTER '+

           '  WHERE BURO.ID_ACREDITADO (+)= ACR.ID_TITULAR '+
           '    AND NOM.ID_PERSONA = ACR.ID_TITULAR '+
           '    AND DIAS_BINTER.ID_TITULAR (+)= ACR.ID_TITULAR '+

           ' ORDER BY NOM.NOMBRE ';

   Result:= sSQL;
End;

Function TQrExpPago.FormaQuery2(peApli : TInterApli; sAcreditado, sEmpresa, sSucursal : String;
                               dFecha   : TDateTime ): String;
var vlSQL, vlSQLFormaQuery : String;
    vlQrCedExPg : TQrCedExPg;
    sFIni, sFFin, vlstrFilterAcreditado : String;
begin
  vlSQL := '';
  vlQrCedExPg := TQrCedExPg.Create(Nil);
  If Assigned(vlQrCedExPg) Then
    Try
      sFFin := DateToStr(dFecha);
      GetSQLStr('SELECT TO_CHAR(ADD_MONTHS('+SQLFecha(dFecha)+',-12), ''DD/MM/YYYY'') AS STRFECHA FROM DUAL',
                peApli.DatabaseName,peApli.SessionName,'STRFECHA',sFIni,False);

      If (Trim(sAcreditado) = '') Then vlstrFilterAcreditado := ''
      Else  vlstrFilterAcreditado := '            AND CTO.ID_TITULAR = '+sAcreditado+coCRLF;

       //  FormaQuery(peApli, sFIni, sFFin, sAcreditado, sDisp, sPromAsoc, sPromAdm, sGpoEconomico,
       //            sProducto, sGpoProd, sFondeo, sEmpresa, sSucursal, sMoneda, sProveedor, sCveFndEntDes, sDiasImp );
      vlSQLFormaQuery := vlQrCedExPg.FormaQuery(peApli, sFIni, sFFin, sAcreditado, '', '', '', '',
                                                '', '', '', sEmpresa, sSucursal, '', '', '', False, False);

      vlSQL :=  ' SELECT RESULTADO_DIAS_VDO.*, RESULTADO_TOTAL.DIASTOT, 0 AS DIAS_MOR, 0 AS F_MOR,'+coCRLF+
                '        DECODE((IN_DIASANIO - CP_DIASANIO) - ABS(IN_DIASANIO - CP_DIASANIO), 0, IN_DIASANIO, CP_DIASANIO) AS DIASANIO'+coCRLF+
                ' FROM'+coCRLF+
                ' ('+coCRLF+
                '   SELECT RESULTADO.ID_PERSONA, RESULTADO.NOMBRE, MAX(RESULTADO.CP_NUM_DIAS_VDO) AS CP_DIASANIO, MAX(RESULTADO.CI_NUM_DIAS_VDO) AS IN_DIASANIO'+coCRLF+
                '   FROM ('+coCRLF+
                vlSQLFormaQuery +coCRLF+
                '        ) RESULTADO'+coCRLF+
                '   GROUP BY RESULTADO.ID_PERSONA, RESULTADO.NOMBRE'+coCRLF+
                ' ) RESULTADO_DIAS_VDO,'+coCRLF+
                ' ('+coCRLF+
                '       -- <INICIA OBTENCION DE DIAS TOTALES>'+coCRLF+
                '       SELECT DATA_RESULT.ID_TITULAR,'+coCRLF+
                '              MAX(DATA_RESULT.DIAS_TOTAL) AS DIASTOT'+coCRLF+
                '       FROM ('+coCRLF+
                '            -- <ICRE01>'+coCRLF+
                '            -- Obtiene todos los días de impagado de todas las disposiciones del acreditado'+coCRLF+
                '            SELECT CTO.ID_TITULAR,'+coCRLF+
                '                 MAX(NVL2(ICRE01.F_PAGO, DECODE(SIGN(ICRE01.F_PAGO - ICRE01.F_PROG_PAGO),-1, 0, ICRE01.F_PAGO - ICRE01.F_PROG_PAGO) ,'+coCRLF+
                '                          DECODE(SIGN('+SQLFecha(dFecha)+'- ICRE01.F_PROG_PAGO),-1, 0,'+coCRLF+
                '                             '+SQLFecha(dFecha)+'- ICRE01.F_PROG_PAGO))) DIAS_TOTAL'+coCRLF+
                '            FROM (SELECT ID_CREDITO, F_PROG_PAGO, F_PAGO'+coCRLF+
                '                    FROM CR_CAPITAL'+coCRLF+
                '                   WHERE F_PROG_PAGO < '+SQLFecha(dFecha)+coCRLF+
                '                   GROUP BY ID_CREDITO, F_PROG_PAGO, F_PAGO'+coCRLF+
                '                  UNION ALL'+coCRLF+
                '                  SELECT ID_CREDITO, F_PROG_PAGO, F_PAGO'+coCRLF+
                '                    FROM CR_INTERES'+coCRLF+
                '                   WHERE F_PROG_PAGO < '+SQLFecha(dFecha)+coCRLF+
                '                   GROUP BY ID_CREDITO, F_PROG_PAGO, F_PAGO'+coCRLF+
                '                  UNION ALL'+coCRLF+
                '                  SELECT ID_CREDITO, F_PROG_PAGO, F_PAGO'+coCRLF+
                '                    FROM CR_COMISION'+coCRLF+
                '                   WHERE F_PROG_PAGO < '+SQLFecha(dFecha)+coCRLF+
                '                   GROUP BY ID_CREDITO, F_PROG_PAGO, F_PAGO'+coCRLF+
                '                  UNION ALL'+coCRLF+
                '                  SELECT ID_CREDITO, F_PROG_PAGO, F_PAGO'+coCRLF+
                '                    FROM CR_FINAN_ADIC'+coCRLF+
                '                   WHERE F_PROG_PAGO < '+SQLFecha(dFecha)+coCRLF+
                '                   GROUP BY ID_CREDITO, F_PROG_PAGO, F_PAGO'+coCRLF+
                '                 ) ICRE01,'+coCRLF+
                '                 CR_CREDITO CC,'+coCRLF+
                '                 CONTRATO CTO'+coCRLF+
                '          WHERE CC.ID_CREDITO = ICRE01.ID_CREDITO'+coCRLF+
                '            AND CC.SIT_CREDITO <> ''CA'''+coCRLF+
                '            AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                vlstrFilterAcreditado+                
                '          GROUP BY CTO.ID_TITULAR'+coCRLF+
                '          -- </ICRE01>'+coCRLF+
                '         UNION ALL'+coCRLF+
                '            -- <INTERCREDITOS>'+coCRLF+
                '            -- Obtiene todos los días de impagado de todas las disposiciones del acreditado'+coCRLF+
                '            SELECT CTO.ID_TITULAR,'+coCRLF+
                '                 MAX(NVL2(ICRE01.F_PAGO, DECODE(SIGN(ICRE01.F_PAGO - ICRE01.F_PROG_PAGO),-1, 0, ICRE01.F_PAGO - ICRE01.F_PROG_PAGO) ,'+coCRLF+
                '                          DECODE(SIGN('+SQLFecha(dFecha)+'- ICRE01.F_PROG_PAGO),-1, 0,'+coCRLF+
                '                             '+SQLFecha(dFecha)+'- ICRE01.F_PROG_PAGO))) DIAS_TOTAL'+coCRLF+
                '            FROM (SELECT ID_CREDITO, F_PROG_PAGO, F_PAGO'+coCRLF+
                '                    FROM CRE_CAPITAL'+coCRLF+
                '                   WHERE F_PROG_PAGO < '+SQLFecha(dFecha)+coCRLF+
                '                   GROUP BY ID_CREDITO, F_PROG_PAGO, F_PAGO'+coCRLF+
                '                  UNION ALL'+coCRLF+
                '                  SELECT ID_CREDITO, F_PROG_PAGO, F_PAGO'+coCRLF+
                '                    FROM CRE_INTERES'+coCRLF+
                '                   WHERE F_PROG_PAGO < '+SQLFecha(dFecha)+coCRLF+
                '                   GROUP BY ID_CREDITO, F_PROG_PAGO, F_PAGO'+coCRLF+
                '                  UNION ALL'+coCRLF+
                '                  SELECT ID_CREDITO, F_PROG_PAGO, F_PAGO'+coCRLF+
                '                    FROM CRE_DET_COMISION'+coCRLF+
                '                   WHERE F_PROG_PAGO < '+SQLFecha(dFecha)+coCRLF+
                '                   GROUP BY ID_CREDITO, F_PROG_PAGO, F_PAGO'+coCRLF+
                '                 ) ICRE01,'+coCRLF+
                '                 CRE_CREDITO CC,'+coCRLF+
                '                 CONTRATO CTO'+coCRLF+
                '          WHERE CC.ID_CREDITO = ICRE01.ID_CREDITO'+coCRLF+
                '            AND CC.SIT_CREDITO NOT IN (''CA'',''TA'')'+coCRLF+
                '            AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                vlstrFilterAcreditado+
                '          GROUP BY CTO.ID_TITULAR'+coCRLF+
                '            -- </INTERCREDITOS>'+coCRLF+
                '          ) DATA_RESULT'+coCRLF+
                '       GROUP BY DATA_RESULT.ID_TITULAR'+coCRLF+
                '       -- <TERMINA OBTENCION DE DIAS TOTALES>'+coCRLF+
                ' ) RESULTADO_TOTAL'+coCRLF+
                ' WHERE RESULTADO_DIAS_VDO.ID_PERSONA = RESULTADO_TOTAL.ID_TITULAR'+coCRLF+
                ' ORDER BY RESULTADO_DIAS_VDO.NOMBRE'+coCRLF
                ;
     Finally
       vlQrCedExPg.Free;
     End;
     Result := vlSQL;
end;

procedure TQrExpPago.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  If ((BandPrinted) And (vgBGeneraArchivoExcel) ) Then
   With qyExpPago Do
    Begin
    vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('A')].Value := FieldByName('ID_PERSONA').AsString;
    vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('B')].Value := FieldByName('NOMBRE').AsString;
    vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('C')].Value := FieldByName('DIASANIO').AsInteger;
    vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('D')].Value := FieldByName('DIASTOT').AsInteger;
    Inc(vgNumRow);            
    End;
end;

End.
