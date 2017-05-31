unit IntMQrSdoProyMSig;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2;

type
  TQrSdoProyMSig = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyConsulta: TQuery;
    qrDetalle: TQRBand;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    ChildBand1: TQRChildBand;
    qrFooterMoneda: TQRBand;
    QRLabel5: TQRLabel;
    qrFooterProducto: TQRBand;
    QRLabel6: TQRLabel;
    qrSumaAcred: TQRExpr;
    QRExpr2: TQRExpr;
    QRShape1: TQRShape;
    QRLabel16: TQRLabel;
    QRShape2: TQRShape;
    qrTituloPromotor: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel43: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRGroupPromAsoc: TQRGroup;
    QRGroupPromAdmin: TQRGroup;
    qrlPromAsoc: TQRLabel;
    qrdbIdPersAsoc: TQRDBText;
    qrdbNomPersAsoc: TQRDBText;
    QRFooterPromotor: TQRBand;
    QRFooterPromAsoc: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    qrdbID_PROMOTOR: TQRDBText;
    qrdbNOMBRE_PROM: TQRDBText;
    qrProyectado: TQRExpr;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    procedure qrFooterProductoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrFooterProductoAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterPromotorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupPromAsocBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
     iRegistros : Integer;
     Apli : TInterApli;
     Function FormaQuery( iMoneda, iIdPromAdm, iIdPromAsoc: Integer;
                          sIdEmpresa, sSucursal, sProducto,
                          sMes, sPromotor:String): String;
  end;

var
  QrSdoProyMSig: TQrSdoProyMSig;

Procedure RepSdoProyMesSig( iMoneda, iIdPromAdm, iIdPromAsoc: Integer;
                            sIdEmpresa, sSucursal, sProducto, sMes, sPromotor:String;
                            pAPli : TInterApli; pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepSdoProyMesSig( iMoneda, iIdPromAdm, iIdPromAsoc: Integer;
                            sIdEmpresa, sSucursal, sProducto, sMes, sPromotor:String;
                            pAPli : TInterApli; pPreview  : Boolean);
Var
   QrSdoProyMSig   : TQrSdoProyMSig;
   Preview     : TIntQRPreview;
Begin
   QrSdoProyMSig   := TQrSdoProyMSig.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrSdoProyMSig);
   QrSdoProyMSig.Apli := pAPli;
   Try
      QrSdoProyMSig.QRInterEncabezado1.Apli:=pApli;
      QrSdoProyMSig.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrSdoProyMSig.QRInterEncabezado1.NomReporte:='IntMQrSdoProyMSig';
      QrSdoProyMSig.QRInterEncabezado1.Titulo1:='Saldo Proyectado Mes Siguiente';

      If sPromotor = 'ADM' Then Begin
         QrSdoProyMSig.qrDetalle.Enabled:= True;
         QrSdoProyMSig.qrdbID_PROMOTOR.DataField:='ID_PROM_ADM';
         QrSdoProyMSig.qrdbNOMBRE_PROM.DataField:='NOMBRE_ADM';
         QrSdoProyMSig.QRGroupPromAdmin.Enabled:=False;
         QrSdoProyMSig.QRFooterPromotor.Enabled:=False;
         QrSdoProyMSig.QRGroupPromAsoc.Enabled:=False;
         QrSdoProyMSig.QRFooterPromAsoc.Enabled:=False;
         QrSdoProyMSig.qrTituloPromotor.Caption:='Nombre del Promotor Administrador';
      End Else If sPromotor = 'ASC' Then Begin
         QrSdoProyMSig.qrDetalle.Enabled:= True;
         QrSdoProyMSig.qrdbID_PROMOTOR.DataField:='ID_PERS_ASOCIAD';
         QrSdoProyMSig.qrdbNOMBRE_PROM.DataField:='NOMBRE_ASOC';
         QrSdoProyMSig.QRGroupPromAsoc.Enabled:=False;
         QrSdoProyMSig.QRFooterPromAsoc.Enabled:=False;
         QrSdoProyMSig.QRGroupPromAdmin.Enabled:=False;
         QrSdoProyMSig.QRFooterPromotor.Enabled:=False;
         QrSdoProyMSig.qrTituloPromotor.Caption:='Nombre del Promotor Asociado';
      End Else Begin
         QrSdoProyMSig.qrDetalle.Enabled:= False;
      End;

      QrSdoProyMSig.qyConsulta.DatabaseName := pApli.DataBaseName;
      QrSdoProyMSig.qyConsulta.SessionName := pApli.SessionName;
      QrSdoProyMSig.qyConsulta.Active:=False;
      QrSdoProyMSig.qyConsulta.SQL.Text:=
      QrSdoProyMSig.FormaQuery(iMoneda, iIdPromAdm, iIdPromAsoc,
                               sIdEmpresa, sSucursal, sProducto,
                               sMes, sPromotor);
      QrSdoProyMSig.qyConsulta.Active:=True;
      If pPreview Then
         QrSdoProyMSig.Preview
      Else QrSdoProyMSig.Print;
   Finally
      QrSdoProyMSig.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrSdoProyMSig.FormaQuery( iMoneda, iIdPromAdm, iIdPromAsoc: Integer;
                            sIdEmpresa, sSucursal, sProducto,
                            sMes, sPromotor:String): String;
Var
   sSQL:String;
   Year, Month, Day: Word; slSQL: TStringList;
Begin
   DecodeDate(Apli.DameFechaEmpresaDia('D000'), Year, Month, Day);

   sSQL:= ' SELECT CVE_MONEDA, DESC_MONEDA, CVE_PRODUCTO_CRE, DESC_L_PRODUCTO, '+ #13#10;
   If (sPromotor = 'ASC')or(sPromotor = '')Then
      sSQL:= sSQL + ' ID_PERS_ASOCIAD, NOMBRE_ASOC, '+ #13#10;
   If (sPromotor = 'ADM')or(sPromotor = '')Then
      sSQL:= sSQL + ' ID_PROM_ADM, NOMBRE_ADM, '+ #13#10;

   sSQL:= sSQL +
          '        TO_DATE(''01/'+ sMes +'/'+ FormatFloat('0000', Year) +''',''DD/MM/YYYY'') INI_DIA, '+ #13#10 +
          '        LAST_DAY(TO_DATE(''01/'+ sMes +'/'+ FormatFloat('0000', Year) +''',''DD/MM/YYYY'')) ULT_DIA, '+ #13#10 +
          '        SUM(NVL(CHC.IMPORTE,0) - NVL(CP.IMPORTE,0) - '+ #13#10 +
          '        NVL(CFA.IMPORTE,0) + NVL(CC.IMPORTE,0)) AS SDO_INICIO, '+ #13#10 +
          '        SUM(NVL(CPMS.IMPORTE,0) + NVL(CFAMS.IMPORTE,0)) AS SDO_VENC '+ #13#10 +
          '   FROM (SELECT CC.ID_CREDITO, CC.ID_CONTRATO, '+ #13#10 +
          '                CTO.CVE_MONEDA, MON.DESC_MONEDA, '+ #13#10 +
          '                CCTO.CVE_PRODUCTO_CRE, CPR.DESC_L_PRODUCTO, '+ #13#10 +
          '                CTO.ID_PERS_ASOCIAD, PASOC.NOMBRE NOMBRE_ASOC, '+ #13#10 +
          '                CC.ID_PROM_ADM, PADM.NOMBRE NOMBRE_ADM, CTO.ID_EMPRESA '+ #13#10 +
          '           FROM CR_CREDITO CC, CR_CONTRATO CCTO, CONTRATO CTO, CR_PRODUCTO CPR, '+ #13#10 +
          '                MONEDA MON, PERSONA PASOC, PERSONA PADM '+ #13#10 +
          '          WHERE CC.F_AUTORIZA <= LAST_DAY(TO_DATE(''01/'+ sMes +'/'+ FormatFloat('0000', Year) +''',''DD/MM/YYYY'')) '+ #13#10 +
          '            AND (CC.F_LIQUIDACION >= TO_DATE(''01/'+ sMes +'/'+ FormatFloat('0000', Year) +''',''DD/MM/YYYY'')'+ #13#10 +
          '                 OR CC.F_LIQUIDACION IS NULL) '+  #13#10 +
          '            AND CCTO.ID_CONTRATO = CC.ID_CONTRATO '+ #13#10 +
          '            AND CCTO.FOL_CONTRATO = CC.FOL_CONTRATO '+ #13#10 +
          '            AND CTO.ID_CONTRATO = CCTO.ID_CONTRATO '+ #13#10 +
          '            AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE '+ #13#10 +
          '            AND MON.CVE_MONEDA = CTO.CVE_MONEDA '+ #13#10 +
          '            AND PASOC.ID_PERSONA = CTO.ID_PERS_ASOCIAD '+ #13#10 +
          '            AND PADM.ID_PERSONA = CC.ID_PROM_ADM '+ #13#10 +
          '        )DATOS, '+ #13#10 +
          '        (SELECT ID_CREDITO, NVL(SDO_VIG_TOTAL,0) AS IMPORTE, F_CIERRE '+ #13#10 +
          '           FROM CR_HISTO_CRED '+ #13#10 +
          '          WHERE F_CIERRE = ADD_MONTHS(LAST_DAY(TO_DATE(''01/'+ sMes +'/'+ FormatFloat('0000', Year) +''',''DD/MM/YYYY'')),-1) '+ #13#10 +
          '        )CHC, '+ #13#10 +
          '        (SELECT ID_CREDITO, SUM(NVL(IMP_CAPITAL,0)- '+ #13#10 +
          '                (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',ID_CREDITO,NUM_PERIODO, '+ #13#10 +
                   '        NULL,ADD_MONTHS(LAST_DAY(TO_DATE(''01/'+ sMes +'/'+ FormatFloat('0000', Year) +''',''DD/MM/YYYY'')),-1), '+ #13#10 +
                   '        ''V''))) AS IMPORTE '+ #13#10 +
          '           FROM CR_CAPITAL '+ #13#10 +
          '          WHERE F_VENCIMIENTO BETWEEN TO_DATE(''01/'+ sMes +'/'+ FormatFloat('0000', Year) +''',''DD/MM/YYYY'') '+ #13#10 +
          '            AND LAST_DAY(TO_DATE(''01/'+ sMes +'/'+ FormatFloat('0000', Year) +''',''DD/MM/YYYY'')) '+ #13#10 +
          '          GROUP BY ID_CREDITO '+ #13#10 +
          '        )CP, '+ #13#10 +
          '        (SELECT ID_CREDITO, SUM(NVL(IMP_FINAN_ADIC,0)- '+ #13#10 +
          '                (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,'+ #13#10 +
                   '         NULL,ADD_MONTHS(LAST_DAY(TO_DATE(''01/'+ sMes +'/'+ FormatFloat('0000', Year) +''',''DD/MM/YYYY'')),-1), '+ #13#10 +
                   '       ''V''))) AS IMPORTE '+ #13#10 +
          '           FROM CR_FINAN_ADIC '+ #13#10 +
          '          WHERE F_VENCIMIENTO BETWEEN TO_DATE(''01/'+ sMes +'/'+  FormatFloat('0000', Year) +''',''DD/MM/YYYY'') '+ #13#10 +
          '            AND LAST_DAY(TO_DATE(''01/'+ sMes +'/'+ FormatFloat('0000', Year) +''',''DD/MM/YYYY'')) '+ #13#10 +
          '          GROUP BY ID_CREDITO '+ #13#10 +
          '            )CFA, '+ #13#10 +
          '        (SELECT ID_CREDITO, SUM(NVL(IMP_CREDITO,0)) AS IMPORTE '+ #13#10 +
          '           FROM CR_CREDITO '+ #13#10 +
          '          WHERE F_AUTORIZA BETWEEN TO_DATE(''01/'+ sMes +'/'+ FormatFloat('0000', Year) +''',''DD/MM/YYYY'') '+ #13#10 +
          '            AND LAST_DAY(TO_DATE(''01/'+ sMes +'/'+ FormatFloat('0000', Year) +''',''DD/MM/YYYY'')) '+ #13#10 +
          '          GROUP BY ID_CREDITO '+ #13#10 +
          '        )CC, '+ #13#10 +
          '        (SELECT ID_CREDITO, SUM(NVL(IMP_CAPITAL,0)-'+ #13#10 +
          '                (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,'+ #13#10 +
                   '        NULL,ADD_MONTHS(LAST_DAY(TO_DATE(''01/'+ sMes +'/'+ FormatFloat('0000', Year) +''',''DD/MM/YYYY'')),1), '+ #13#10 +
                   '        ''V''))) AS IMPORTE '+ #13#10 +
          '           FROM CR_CAPITAL '+ #13#10 +
          '          WHERE F_VENCIMIENTO BETWEEN ADD_MONTHS(TO_DATE(''01/'+ sMes +'/'+  FormatFloat('0000', Year) +''',''DD/MM/YYYY''),1) '+ #13#10 +
          '            AND ADD_MONTHS(LAST_DAY(TO_DATE(''01/'+ sMes +'/'+ FormatFloat('0000', Year) +''',''DD/MM/YYYY'')),1) '+ #13#10 +
          '          GROUP BY ID_CREDITO '+ #13#10 +
          '        )CPMS, '+ #13#10 +
          '        (SELECT ID_CREDITO, SUM(NVL(IMP_FINAN_ADIC,0)-'+ #13#10 +
          '                (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,'+ #13#10 +
                   '        NULL,ADD_MONTHS(LAST_DAY(TO_DATE(''01/'+ sMes +'/'+ FormatFloat('0000', Year) +''',''DD/MM/YYYY'')),1),'+ #13#10 +
                   '        ''V''))) AS IMPORTE '+ #13#10 +
          '           FROM CR_FINAN_ADIC '+ #13#10 +
          '          WHERE F_VENCIMIENTO BETWEEN ADD_MONTHS(TO_DATE(''01/'+ sMes +'/'+ FormatFloat('0000', Year) +''',''DD/MM/YYYY''),1) '+ #13#10 +
          '            AND ADD_MONTHS(LAST_DAY(TO_DATE(''01/'+ sMes +'/'+  FormatFloat('0000', Year) +''',''DD/MM/YYYY'')),1) '+ #13#10 +
          '          GROUP BY ID_CREDITO '+ #13#10 +
          '        )CFAMS '+ #13#10 +
          '  WHERE CHC.ID_CREDITO (+)= DATOS.ID_CREDITO '+ #13#10 +
          '    AND CP.ID_CREDITO (+)= DATOS.ID_CREDITO '+ #13#10 +
          '    AND CFA.ID_CREDITO (+)= DATOS.ID_CREDITO '+ #13#10 +
          '    AND CC.ID_CREDITO (+)= DATOS.ID_CREDITO '+ #13#10 +
          '    AND CPMS.ID_CREDITO (+)= DATOS.ID_CREDITO '+ #13#10 +
          '    AND CFAMS.ID_CREDITO (+)= DATOS.ID_CREDITO '+ #13#10;

   If iMoneda > 0 Then
      sSQL:= sSQL + ' AND DATOS.CVE_MONEDA = '+ IntToStr(iMoneda)+ #13#10;
   If iIdPromAdm > 0 Then
      sSQL:= sSQL + ' AND DATOS.ID_PROM_ADM = '+ IntToStr(iIdPromAdm)+ #13#10;
   If iIdPromAsoc > 0 Then
      sSQL:= sSQL + ' AND DATOS.ID_PERS_ASOCIAD = '+ IntToStr(iIdPromAsoc)+ #13#10;
   If Trim(sIdEmpresa)<>'' Then
       sSQL:= sSQL + ' AND DATOS.ID_EMPRESA ='+ Trim(sIdEmpresa)+ #13#10;
   If Trim(sProducto) <> '' Then
      sSQL:= sSQL + ' AND DATOS.CVE_PRODUCTO_CRE = '''+ sProducto +''''+ #13#10;

   sSQL:= sSQL + ' GROUP BY CVE_MONEDA , DESC_MONEDA, CVE_PRODUCTO_CRE, DESC_L_PRODUCTO ' + #13#10;
   If (sPromotor = 'ASC')or(sPromotor = '')Then
      sSQL:= sSQL + ' , ID_PERS_ASOCIAD, NOMBRE_ASOC '+ #13#10;
   If (sPromotor = 'ADM')or(sPromotor = '')Then
      sSQL:= sSQL + ' , ID_PROM_ADM, NOMBRE_ADM '+ #13#10;

   sSQL:= sSQL + ' ORDER BY DESC_MONEDA, DESC_L_PRODUCTO '+ #13#10;
   If (sPromotor = 'ASC')or(sPromotor = '')Then
      sSQL:= sSQL + ' , NOMBRE_ASOC '+ #13#10;
   If (sPromotor = 'ADM')or(sPromotor = '')Then
      sSQL:= sSQL + ' , NOMBRE_ADM '+ #13#10;

 {  slSQL:= TStringList.Create;
   slSQL.Clear;
   slSQL.Add(sSQL);
   slSQL.SaveToFile('C:\SQL.txt');
   slSQL.Free;}
   Result:= sSQL;
End;


procedure TQrSdoProyMSig.qrFooterProductoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   //If iRegistros > 1 Then PrintBand:= True
   //Else PrintBand:= False;
end;

procedure TQrSdoProyMSig.qrFooterProductoAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   //qrSumaAcred.Reset;
end;

procedure TQrSdoProyMSig.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRInterEncabezado1.Titulo2:= 'Del '+
              FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('INI_DIA').AsDateTime)+
              ' al '+ FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('ULT_DIA').AsDateTime);
end;

procedure TQrSdoProyMSig.QRFooterPromotorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   iRegistros := iRegistros + 1;
end;

procedure TQrSdoProyMSig.QRGroupPromAsocBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   iRegistros:=0;
end;

End.

