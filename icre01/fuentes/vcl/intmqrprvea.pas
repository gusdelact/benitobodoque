unit IntMQrPrVeA;

interface
                  
uses Windows, SysUtils, Messages, Classes, Graphics, Controls, unSQL2,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead,InterApl,
  IntQRPreview, Dialogs, IntGenCre;

type
  TQrPrVeA = class(TQuickRep)
    qyPrVeA: TQuery;
    QRBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRShape14: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape6: TQRShape;
    QRLabelNOMBRE: TQRLabel;
    QRLabelID_CREDITO: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape31: TQRShape;
    QRLabel7: TQRLabel;
    QRBandDetalle: TQRBand;
    QRDBNOMBRE: TQRDBText;
    QRDBNOM_PROVEEDOR: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabelPromAsoc: TQRLabel;
    QRDBID_PERS_ASOCIAD: TQRDBText;
    QRDBNOM_PROMOTOR_ASO: TQRDBText;
    QRLabelPromAdm: TQRLabel;
    QRDBID_PROM_ADM: TQRDBText;
    QRDBNOM_PROMOTOR_ADM: TQRDBText;
    QRFooterDia: TQRBand;
    QRLabel45: TQRLabel;
    QRExpr54: TQRExpr;
    QRBNombre: TQRBand;
    QRExpr61: TQRExpr;
    QRExpr62: TQRExpr;
    QRExpr63: TQRExpr;
    QRExpr64: TQRExpr;
    QRExpr65: TQRExpr;
    QRExpr66: TQRExpr;
    QRExpr67: TQRExpr;
    QRExpr68: TQRExpr;
    QRExpr69: TQRExpr;
    QRExpr70: TQRExpr;
    QRExpr71: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr3: TQRExpr;
    QRDBText5: TQRDBText;
    QRExpr7: TQRExpr;
    QRDBText6: TQRDBText;
    QRLabel4: TQRLabel;
    QRShape7: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape3: TQRShape;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    QRShape4: TQRShape;
    QRExpr14: TQRExpr;
    QRLabel1: TQRLabel;
    QRExpr1: TQRExpr;
    QRShape5: TQRShape;
    QRDBDESC_MONEDA: TQRDBText;
    QRFooterMoneda: TQRBand;
    QRLabel2: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    procedure QRGroupMonedaBeforePrint(Sender: TQRCustomBand;   var PrintBand: Boolean);
    procedure QRGroupPromAsocBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRGroupPromAdmBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
    procedure QRBandDetalleBeforePrint(Sender: TQRCustomBand;   var PrintBand: Boolean);
    procedure QRFooterDiaBeforePrint(Sender: TQRCustomBand;    var PrintBand: Boolean);

  private

     //para el footer de Moneda
    VL_M_Capital    : Double;
    VL_M_FINAN_ADIC : Double;
    VL_M_INTERES    : Double;
    VL_M_Importe    : Double;

     //para el footer de P Administrador
    VL_PAD_Capital    : Double;
    VL_PAD_FINAN_ADIC : Double;
    VL_PAD_INTERES    : Double;
    VL_PAD_Importe    : Double;

     //para el footer de P Asociado
    VL_PAS_Capital    : Double;
    VL_PAS_FINAN_ADIC : Double;
    VL_PAS_INTERES    : Double;
    VL_PAS_Importe    : Double;


  public
    function FormaQuery(sF_CORTEIni, sF_CORTEFin, sACREDITADO, sID_CESION,
                        sCVE_PRODUCTO_CRE, sCVE_PRODUCTO_GPO, sID_PROM_ADMOTOR,
                        sID_PROM_ADM, sCVE_MONEDA,  sIdEmpresa, SIDSucursal :String):String;


  end;

var
  QrPrVeA: TQrPrVeA;
  bGenArch: Boolean;
  sArchivo:String;
  vgFechaHoy : TDateTime;
  F: TextFile;
  Apli : TInterApli;

  procedure RepPrVeA( sF_CORTEIni, sF_CORTEFin, sACREDITADO, sID_CESION,
                      sCVE_PRODUCTO_CRE, sCVE_PRODUCTO_GPO, sID_PROM_ADMOTOR,
                      sID_PROM_ADM, sCVE_MONEDA,  sIdEmpresa, sIDSucursal,
                      SNbrArch : String;
                      pPreview : Boolean;
                      pApli    : TInterApli);




implementation

{$R *.DFM}

procedure RepPrVeA(   sF_CORTEIni, sF_CORTEFin, sACREDITADO, sID_CESION,
                      sCVE_PRODUCTO_CRE, sCVE_PRODUCTO_GPO, sID_PROM_ADMOTOR,
                      sID_PROM_ADM, sCVE_MONEDA,  sIdEmpresa, sIDSucursal,
                      SNbrArch : String;
                      pPreview : Boolean;
                      pApli    : TInterApli);

var
    QrPrVeA   : TQrPrVeA;
    VLTitulo  : String;
    Preview   : TIntQRPreview;
begin
    VLTitulo := '';
    QrPrVeA:= TQrPrVeA.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrPrVeA);
    Apli := pApli;
      Try
        vgFechaHoy  :=  pAPli.DameFechaEmpresa;
        bGenArch    :=  False;
        sArchivo    :=  sNbrArch;
        QrPrVeA.QRInterEncabezado1.Apli := pApli;

        QrPrVeA.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrPrVeA.QRInterEncabezado1.NomReporte:='IntMQrPrVeA';
        QrPrVeA.QRInterEncabezado1.Titulo1:= 'Reporte de Impagos  Fechas de: ' + sF_CORTEIni + ' al ' + sF_CORTEFin ;


        If (Trim(sCVE_PRODUCTO_CRE)<>'') Then
            VLTitulo := VLTitulo + ' Por Producto de Crédito';
        If (Trim(sCVE_PRODUCTO_GPO)<>'') Then
            VLTitulo := VLTitulo + ' Por Gpo. Producto';

        QrPrVeA.QRInterEncabezado1.Titulo2 := VLTitulo;
        QrPrVeA.qyPrVeA.DatabaseName := pApli.DataBaseName;
        QrPrVeA.qyPrVeA.SessionName  := pApli.SessionName;

        QrPrVeA.qyPrVeA.Active:=False;

        QrPrVeA.qyPrVeA.SQL.Text:= QrPrVeA.FormaQuery( sF_CORTEIni, sF_CORTEFin, sACREDITADO, sID_CESION,
                                                       sCVE_PRODUCTO_CRE, sCVE_PRODUCTO_GPO, sID_PROM_ADMOTOR,
                                                       sID_PROM_ADM, sCVE_MONEDA,  sIdEmpresa, sIDSucursal);

        QrPrVeA.qyPrVeA.SQL.SaveToFile('c:\PrVeAg.txt');
        QrPrVeA.qyPrVeA.Active:=True;


        If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrPrVeA.QRInterEncabezado1.Titulo1+ #09 );
         Writeln(F, QrPrVeA.QRInterEncabezado1.Titulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F,
                    'ID_CREDITO' + #09 +
                    'ID_CONTRATO' + #09 +
                    'CVE_PRODUCTO_CRE' + #09 +
                    'CVE_MONEDA' + #09 +
                    'DESC_MONEDA' + #09 +
                    'ID_PERS_ASOCIAD' + #09 +
                    'NOM_PROMOTOR_ASO' + #09 +
                    'ID_PROM_ADM' + #09 +
                    'NOM_PROMOTOR_ADM' + #09 +
                    'ID_TITULAR' + #09 +
                    'NOMBRE' + #09 +
                    'CAPITAL' + #09 +
                    'FINAN_ADIC' + #09 +
                    'INTERES'+ #09 +
                    'F_VENCIMIENTO');

      End;
        If pPreview Then
            QrPrVeA.Preview
        Else
            QrPrVeA.Print;

     Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrPrVeA.free;
      If Assigned(Preview) Then Preview.Free;
    End;

end;

function TQrPrVeA.FormaQuery(sF_CORTEIni, sF_CORTEFin, sACREDITADO, sID_CESION,
                             sCVE_PRODUCTO_CRE, sCVE_PRODUCTO_GPO, sID_PROM_ADMOTOR,
                             sID_PROM_ADM, sCVE_MONEDA,  sIdEmpresa, SIDSucursal:String):String;
Var
    sSQL         : String;

begin

    sSQL:=  '  SELECT FECHAS.F_VENCIMIENTO, '+ coCRLF +
            '   CCR.ID_CREDITO, CCR.ID_CONTRATO, CCT.CVE_PRODUCTO_CRE, '+ coCRLF +
            '   CTO.CVE_MONEDA, '+ coCRLF +
            '   (SELECT DESC_MONEDA FROM MONEDA WHERE CVE_MONEDA = CTO.CVE_MONEDA) AS DESC_MONEDA,'+ coCRLF +
            '   CTO.ID_PERS_ASOCIAD, '+ coCRLF +
            '   (SELECT NOMBRE FROM PERSONA WHERE ID_PERSONA=CTO.ID_PERS_ASOCIAD) AS NOM_PROMOTOR_ASO, '+ coCRLF +
            '   CCR.ID_PROM_ADM, '+ coCRLF +
            '   (SELECT NOMBRE FROM PERSONA WHERE ID_PERSONA=CCR.ID_PROM_ADM) AS NOM_PROMOTOR_ADM, '+ coCRLF +
            '   CTO.ID_TITULAR, '+ coCRLF +
            '   (SELECT NOMBRE FROM PERSONA WHERE ID_PERSONA=CTO.ID_TITULAR) AS NOMBRE, '+ coCRLF +
            '   ADEUDO.CAPITAL, '+ coCRLF +
            '   ADEUDO.INTERES, '+ coCRLF +
            '   ADEUDO.FINAN_ADIC '+ coCRLF +
         ' FROM CR_CREDITO CCR, '+ coCRLF +
//            '   CR_CONTRATO CCT, '+ coCRLF +
            '   CONTRATO CTO, '+ coCRLF +
            '   (SELECT DISTINCT(F_VENCIMIENTO), ID_CREDITO FROM CR_CAPITAL '+ coCRLF +
            '     WHERE SIT_CAPITAL IN (''AC'',''PA'') '+ coCRLF +
            '    UNION '+ coCRLF +
            '    SELECT DISTINCT(F_VENCIMIENTO), ID_CREDITO FROM CR_INTERES '+ coCRLF +
            '     WHERE SIT_INTERES IN (''AC'') '+ coCRLF +
            '    UNION '+ coCRLF +
            '    SELECT DISTINCT(F_VENCIMIENTO), ID_CREDITO FROM CR_FINAN_ADIC '+ coCRLF +
            '     WHERE SIT_FINAN_ADIC IN (''AC'',''PA'') ) FECHAS, '+ coCRLF +
            '   (SELECT ID_CREDITO, F_VENCIMIENTO , SUM(ADEUDO_CP) AS CAPITAL, SUM(ADEUDO_IN ) AS INTERES, SUM(ADEUDO_FN) AS FINAN_ADIC '+ coCRLF +
            '      FROM ( '+ coCRLF +
//            '            SELECT ID_CREDITO, F_VENCIMIENTO, '+ coCRLF +
            '            SELECT CR_CAPITAL.ID_CREDITO, F_VENCIMIENTO, NUM_PERIODO,'+ coCRLF +  //HERJA ENERO 2013
//            '               SUM(IMP_CAPITAL - PKGCRCOMUN.STPOBTIMPPAG (''CP'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL,F_PROG_PAGO,''V'',''F'')) AS ADEUDO_CP , '+ coCRLF +
            '               SUM(IMP_CAPITAL - PKGCRCOMUN.STPOBTIMPPAG (''CP'',''IMPBRU'',CR_CAPITAL.ID_CREDITO,NUM_PERIODO,NULL,F_PROG_PAGO,''V'',''F'') + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) ) AS ADEUDO_CP , '+ coCRLF +   //HERJA ENERO 2013
            '                  0 AS ADEUDO_IN , 0 AS  ADEUDO_FN '+ coCRLF +
            '              FROM CR_CAPITAL '+ coCRLF +
// HERJA ENERO 2013
	    '		       ,( '+ coCRLF +
	    '		         SELECT CT.ID_CREDITO, CT.ID_PERIODO, '+ coCRLF +
	    '		                NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP '+ coCRLF +
	    '		           FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT '+ coCRLF +
	    '		          WHERE 1=1 '+ coCRLF +
	    '		            AND CT.SIT_TRANSACCION = ''AC'' '+ coCRLF +
	    '		            AND CT.ID_TRANS_CANCELA IS NULL '+ coCRLF +
	    '		            AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION '+ coCRLF +
	    '		            AND CT.CVE_OPERACION IN (''PGDMCP'') '+ coCRLF +
	    '		            AND CDT.CVE_CONCEPTO IN (''IMPBRU'') '+ coCRLF +
	    '		          GROUP BY CT.ID_CREDITO, CT.ID_PERIODO '+ coCRLF +
	    '		        ) CA_HIST_PGDMCP '+ coCRLF +
// FIN HERJA
            '             WHERE SIT_CAPITAL IN (''AC'',''PA'') '+ coCRLF +
//            '             GROUP BY ID_CREDITO, F_VENCIMIENTO '+ coCRLF +
//HERJA ENERO 2013
            '               AND CA_HIST_PGDMCP.ID_CREDITO (+)= CR_CAPITAL.ID_CREDITO '+ coCRLF +
	    '	            AND CA_HIST_PGDMCP.ID_PERIODO (+)= CR_CAPITAL.NUM_PERIODO '+ coCRLF +
            '             GROUP BY CR_CAPITAL.ID_CREDITO, F_VENCIMIENTO, NUM_PERIODO '+ coCRLF +  
//FIN HERJA
            '         UNION '+ coCRLF +
//            '            SELECT ID_CREDITO, F_VENCIMIENTO , 0 AS ADEUDO_CP, '+ coCRLF +
            '            SELECT ID_CREDITO, F_VENCIMIENTO , NUM_PERIODO, 0 AS ADEUDO_CP, '+ coCRLF +    //HERJA ENERO 2013
                           // SE CAMBIA IMP_INTERES POR IMP_INTERES_PROY  JFOF 06/09/2011
            '               SUM(IMP_INTERES_PROY - PKGCRCOMUN.STPOBTIMPPAG (''IN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL,F_PROG_PAGO,''V'',''F'')) AS ADEUDO_IN , 0 AS  ADEUDO_FN '+ coCRLF +
            '              FROM CR_INTERES '+ coCRLF +
            '             WHERE SIT_INTERES IN (''AC'') '+ coCRLF +
//            '             GROUP BY ID_CREDITO, F_VENCIMIENTO '+ coCRLF +
            '             GROUP BY ID_CREDITO, F_VENCIMIENTO, NUM_PERIODO '+ coCRLF +   //HERJA ENERO 2013
            '         UNION '+ coCRLF +
//            '            SELECT ID_CREDITO, F_VENCIMIENTO, 0 AS ADEUDO_CP, 0 AS ADEUDO_IN, '+ coCRLF +
            '            SELECT ID_CREDITO, F_VENCIMIENTO, NUM_PERIODO, 0 AS ADEUDO_CP, 0 AS ADEUDO_IN, '+ coCRLF +   //HERJA ENERO 2013
            '               SUM(IMP_FINAN_ADIC - PKGCRCOMUN.STPOBTIMPPAG (''FN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL,F_PROG_PAGO,''V'',''F'')) AS ADEUDO_FN '+ coCRLF +
            '              FROM CR_FINAN_ADIC '+ coCRLF +
            '             WHERE SIT_FINAN_ADIC IN (''AC'',''PA'') '+ coCRLF +
//            '             GROUP BY ID_CREDITO, F_VENCIMIENTO) '+ coCRLF +
            '             GROUP BY ID_CREDITO, F_VENCIMIENTO, NUM_PERIODO) '+ coCRLF +   //HERJA ENERO 2013
            '     GROUP BY ID_CREDITO, F_VENCIMIENTO )ADEUDO, '+ coCRLF;

             If (Trim(sCVE_PRODUCTO_CRE)<>'')OR(Trim(sCVE_PRODUCTO_GPO)<>'') Then
                  begin
                     If (Trim(sCVE_PRODUCTO_CRE)<>'') Then
                     begin
                        sSQL:= sSQL +
                        ' (SELECT ID_CONTRATO, FOL_CONTRATO, ID_PROM_ADMON, CVE_PRODUCTO_CRE FROM CR_CONTRATO '+  coCRLF +
                        ' WHERE CVE_PRODUCTO_CRE IN ('''+sCVE_PRODUCTO_CRE+''')'+  coCRLF +
                        ' ) CCT '+  coCRLF;
                     end;
                     If (Trim(sCVE_PRODUCTO_GPO)<>'') Then
                     begin
                        sSQL:= sSQL +
                        ' (SELECT ID_CONTRATO, FOL_CONTRATO, ID_PROM_ADMON, CVE_PRODUCTO_CRE FROM CR_CONTRATO '+  coCRLF +
                        ' WHERE CVE_PRODUCTO_CRE IN ( SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO WHERE CVE_PRODUCTO_GPO ='+ SQLStr( sCVE_PRODUCTO_GPO )+ ')'+ coCRLF +
                        ' ) CCT '+  coCRLF;
                     end;
                  end
                  else
                     sSQL := sSQL + ' CR_CONTRATO CCT '+  coCRLF;
        sSQL := sSQL +
        ' WHERE 1 = 1 '+ coCRLF +
         '  AND CCR.SIT_CREDITO = ''AC'' '+ coCRLF +
         '  AND CCT.ID_CONTRATO = CCR.ID_CONTRATO '+ coCRLF +
         '  AND CTO.ID_CONTRATO = CCR.ID_CONTRATO '+ coCRLF +
         '  AND CTO.ID_EMPRESA = 2 '+ coCRLF +
         '  AND FECHAS.F_VENCIMIENTO BETWEEN ' + SQLFecha( StrToDate(sF_CORTEIni))+' AND ' + SQLFecha( StrToDate(sF_CORTEFin) ) + coCRLF +
         '  AND CCR.ID_CREDITO        = FECHAS.ID_CREDITO '+ coCRLF +
         '  AND ADEUDO.ID_CREDITO     = CCR.ID_CREDITO '+ coCRLF +
         '  AND ADEUDO.F_VENCIMIENTO  = FECHAS.F_VENCIMIENTO '+ coCRLF;

          If (Trim(sCVE_MONEDA)<>'') Then
              sSQL:= sSQL + '      AND CTO.CVE_MONEDA = '+sCVE_MONEDA +  coCRLF ;

          If (Trim(sID_PROM_ADMOTOR)<>'') Then
              sSQL:= sSQL + '      AND CTO.ID_PERS_ASOCIAD = '+ sID_PROM_ADMOTOR  +  coCRLF ;

          If (Trim(sID_PROM_ADM)<>'') Then
              sSQL:= sSQL + '      AND CCR.ID_PROM_ADM = '+ sID_PROM_ADM +  coCRLF ;

//          If (Trim(sCVE_PRODUCTO_CRE)<>'') Then
//              sSQL:= sSQL + '      AND CCT.CVE_PRODUCTO_CRE = '+ SQLStr(Trim(sCVE_PRODUCTO_CRE)) +coCRLF ;
//
//          If (Trim(sCVE_PRODUCTO_GPO)<>'') Then
//              sSQL:= sSQL + '      AND  CCT.CVE_PRODUCTO_GPO = '+ SQLStr(Trim(sCVE_PRODUCTO_GPO)) +coCRLF ;

          If (Trim(sACREDITADO)<>'') Then
              sSQL:= sSQL + '      AND CTO.ID_TITULAR ='+ sACREDITADO  +  coCRLF ;

          If (Trim(sID_CESION)<>'') Then
              sSQL:= sSQL + '      AND CCR.ID_CREDITO ='+ sID_CESION +  coCRLF ;

         sSQL:= sSQL + '  ORDER BY CTO.CVE_MONEDA desc, F_VENCIMIENTO '+ coCRLF;

     Result:=sSQL;
end;


procedure TQrPrVeA.QRGroupMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        VL_M_Capital := 0;
        VL_M_FINAN_ADIC    := 0;
        VL_M_INTERES    := 0;
        VL_M_Importe := 0;
end;

procedure TQrPrVeA.QRGroupPromAsocBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        VL_PAS_Capital  := 0;
        VL_PAS_FINAN_ADIC    := 0;
        VL_PAS_INTERES    := 0;
        VL_PAS_Importe := 0;
end;

procedure TQrPrVeA.QRGroupPromAdmBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        VL_PAD_Capital  := 0;
        VL_PAD_FINAN_ADIC    := 0;
        VL_PAD_INTERES    := 0;
        VL_PAD_Importe := 0;
end;

procedure TQrPrVeA.QRBandDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
   sFVenc: String;

begin

If sArchivo <>'' Then Begin

      If qyPrVeA.FieldByName('F_VENCIMIENTO').AsDateTime > 0 Then
         sFVenc:= FormatDateTime('dd/mm/yyyy', qyPrVeA.FieldByName('F_VENCIMIENTO').AsDateTime);

         Writeln(F,
                  qyPrVeA.FieldByName('ID_CREDITO').AsString + #09 +
                  qyPrVeA.FieldByName('ID_CONTRATO').AsString + #09 +
                  qyPrVeA.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
                  qyPrVeA.FieldByName('CVE_MONEDA').AsString + #09 +
                  qyPrVeA.FieldByName('DESC_MONEDA').AsString + #09 +                  
                  qyPrVeA.FieldByName('ID_PERS_ASOCIAD').AsString + #09 +
                  qyPrVeA.FieldByName('NOM_PROMOTOR_ASO').AsString + #09 +
                  qyPrVeA.FieldByName('ID_PROM_ADM').AsString + #09 +
                  qyPrVeA.FieldByName('NOM_PROMOTOR_ADM').AsString + #09 +
                  qyPrVeA.FieldByName('ID_TITULAR').AsString + #09 +
                  qyPrVeA.FieldByName('NOMBRE').AsString + #09 +
                  FormatFloat('###,###,###,###,###,##0.00',qyPrVeA.FieldByName('CAPITAL').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyPrVeA.FieldByName('FINAN_ADIC').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyPrVeA.FieldByName('INTERES').AsFloat) + #09+
                  FormatDateTime('DD/MM/YYYY',qyPrVeA.FieldByName('F_VENCIMIENTO').AsDateTime));



   End;
end;

procedure TQrPrVeA.QRFooterDiaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If qyPrVeA.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

end.
