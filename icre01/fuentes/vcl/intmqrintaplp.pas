unit IntMQrIntAplp;
interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, unSQL2;
Const
   coCRLF    = #13#10;
type
  TQrIntAplp = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    qrbDETALLE: TQRBand;
    qrshF_OPERA: TQRShape;
    qyIntAplp: TQuery;
    qrshTIPOCALC: TQRShape;
    qrshCVETASA: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape18: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel14: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText1: TQRDBText;
    qyIntAplpID_CREDITO: TFloatField;
    qyIntAplpID_CONTRATO: TFloatField;
    qyIntAplpF_CIERRE: TDateTimeField;
    qyIntAplpCOMISION_COBRADA: TFloatField;
    qyIntAplpIMP_ESTIMACION: TFloatField;
    qyIntAplpIMP_PREMIO: TFloatField;
    qyIntAplpEXCESO: TFloatField;
    qyIntAplpPPOTOPADO: TFloatField;
    qyIntAplpTOTRESERVADO: TFloatField;
    qyIntAplpDIFERENCIA: TFloatField;
    qyIntAplpFALTANTE: TFloatField;
    qyIntAplpCVE_PRODUCTO_GPO: TStringField;
    qyIntAplpDESC_C_PROD_GPO: TStringField;
    qyIntAplpID_TITULAR: TFloatField;
    qyIntAplpACREDITADO: TStringField;
    qyIntAplpSIT_CREDITO: TStringField;
    qyIntAplpSIT_PPO_PREMIO: TStringField;
    QRExpr15: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRShape8: TQRShape;
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDETALLEBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

    Function FormaQuery(sF_Al, sGpoProd, sAcreditado,
                        sContrato,sCesion,sSitPre,sSitCred : String):String;
  end;

var
  QrIntAplp: TQrIntAplp;
  bGenArch: Boolean;
  F: TextFile;
  sArchivo : String;
  vlNumCred : Integer;
  vlNumCrPr : Integer;
  vlIdCred  : Integer;
  vgFechaAl : String ;

Procedure RepIntAplpr(sF_Al, sGpoProd, sAcreditado,
                      sContrato,sCesion,sSitPre,sSitCred,sNbrArch :String;
                      pAPli : TInterApli;
                      pPreview : Boolean);
Implementation
{$R *.DFM}

Procedure RepIntAplpr(sF_Al, sGpoProd, sAcreditado,
                      sContrato,sCesion,sSitPre,sSitCred,sNbrArch :String;
                      pAPli : TInterApli;
                      pPreview : Boolean);
Var
   QrIntAplp : TQrIntAplp;
   Preview     : TIntQRPreview;

Begin
   QrIntAplp:=TQrIntAplp.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrIntAplp);
   Try
      bGenArch:= False;
      sArchivo:= sNbrArch;
      QrIntAplp.QRInterEncabezado1.Apli:=pApli;
      QrIntAplp.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrIntAplp.QRInterEncabezado1.NomReporte:='IntMQrIntAplp';
      QrIntAplp.QRInterEncabezado1.Titulo1:='Reporte de Integración y Aplicación de Premios por Pagar con fecha al: '+sF_Al;

      QrIntAplp.qyIntAplp.DatabaseName := pApli.DataBaseName;
      QrIntAplp.qyIntAplp.SessionName := pApli.SessionName;

      QrIntAplp.qyIntAplp.Active:=False;
      QrIntAplp.qyIntAplp.SQL.Text:= QrIntAplp.FormaQuery(sF_Al, sGpoProd, sAcreditado, sContrato, sCesion, sSitPre, sSitCred) ;
      vgFechaAl:= sF_Al ;
      QrIntAplp.qyIntAplp.SQL.SaveToFile('C:\IntAplp.sql');
      QrIntAplp.qyIntAplp.Active:=True;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, 'BANCO INTERACCIONES, S.A.' + #09 );
         Writeln(F, 'INTEGRACIÓN Y APLICACIÓN DE PREMIOS POR PAGAR' + #09 );
         Writeln(F, 'AL CIERRE DEL: ' + sF_Al + #09);
         Writeln(F,  #09 );

      Writeln(F, 'CREDITO'+ #09 +
                 'ACREDITADO'+ #09 +
                 'COMISION COBRADA'+ #09 +
                 'EST PREV RIESGOS ACTUAL '+ #09 +
                 'PREMIO POSIBLE ACTUAL'+ #09 +
                 'EXCESO EPRC SOBRE PPO'+ #09 +
                 'PPO PROVISIONADO TOPADO A PPO'+ #09 +
                 'TOTAL RES PROV TOPADO A PPO'+ #09 +
                 'DIFERENCIA CONTRA PPO'+ #09 +
                 'FALTANTE COMISION'+ #09
                 );
                 
         Writeln(F, '');
      End;

      If pPreview Then
         QrIntAplp.Preview
      Else
         QrIntAplp.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrIntAplp.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrIntAplp.FormaQuery(sF_Al, sGpoProd, sAcreditado,
                               sContrato,sCesion,sSitPre,sSitCred: String ):String;
Var
    sSQL:String;
Begin
    sSQL:= ' SELECT ppo.id_credito, ppo.id_contrato, ppo.f_cierre, '+coCRLF+
           '        coms.comis_cob comision_cobrada,'+coCRLF+
           '        ppo.imp_estimacion, '+coCRLF+
           '        ppo.imp_premio, ppo.exceso, ppo.ppotopado, ppo.totreservado, '+coCRLF+
           '        ppo.imp_premio - ppo.totreservado diferencia, ABS(ppo.exceso) faltante, '+coCRLF+
           '        ppo.cve_producto_gpo, ppo.desc_c_prod_gpo, ppo.id_titular, '+coCRLF+
           '        ppo.acreditado, ppo.sit_credito, cppp.sit_ppo_premio '+coCRLF+
           '   FROM (SELECT f_cierre, id_credito, imp_estimacion, imp_premio, exceso, '+coCRLF+
           '                ppotopado, '+coCRLF+
           '                CASE '+coCRLF+
           '                   WHEN imp_estimacion > imp_premio '+coCRLF+
           '                      THEN imp_premio '+coCRLF+
           '                   ELSE imp_estimacion + ppotopado '+coCRLF+
           '                END totreservado, '+coCRLF+
           '                id_contrato, sit_credito, cve_producto_gpo, desc_c_prod_gpo, '+coCRLF+
           '                cve_producto_cre, desc_c_producto, id_titular, acreditado '+coCRLF+
           '           FROM (SELECT crh.f_cierre, crh.id_credito, crh.imp_estimacion, '+coCRLF+
           '                        crh.imp_premio, '+coCRLF+
           '                        CASE '+coCRLF+
           '                           WHEN crh.imp_estimacion < crh.imp_premio '+coCRLF+
           '                              THEN 0 '+coCRLF+
           '                           ELSE crh.imp_estimacion - crh.imp_premio '+coCRLF+
           '                        END exceso, '+coCRLF+
           '                        CASE '+coCRLF+
           '                           WHEN crh.imp_estimacion > crh.imp_premio '+coCRLF+
           '                              THEN 0 '+coCRLF+
           '                           ELSE crh.imp_premio - crh.imp_estimacion '+coCRLF+
           '                        END ppotopado, '+coCRLF+
           '                        cr.id_contrato, cr.sit_credito, crp.cve_producto_gpo, '+coCRLF+
           '                        cpg.desc_c_prod_gpo, crc.cve_producto_cre, '+coCRLF+
           '                        crp.desc_c_producto, cont.id_titular, '+coCRLF+
           '                        cast(pkgcrconsolidado.fun_nom_tit_cred(cont.id_titular)as varchar2(100)) acreditado '+coCRLF+
           '                   FROM cr_ppo_histo crh, '+coCRLF+
           '                        cr_credito cr, '+coCRLF+
           '                        cr_contrato crc, '+coCRLF+
           '                        cr_producto crp, '+coCRLF+
           '                        cr_producto_gpo cpg, '+coCRLF+
           '                        contrato cont '+coCRLF+
           '                  WHERE 1 = 1 '+coCRLF+
           '                    AND crh.f_cierre = ' +SQLFecha(StrToDate(sF_Al))+coCRLF+
           '                    AND cr.id_credito = crh.id_credito '+coCRLF+
           '                    AND cr.id_contrato = crc.id_contrato '+coCRLF+
           '                    AND crc.id_contrato = cont.id_contrato '+coCRLF+
           '                    AND crc.cve_producto_cre = crp.cve_producto_cre '+coCRLF+
           '                    AND crp.cve_producto_gpo = cpg.cve_producto_gpo '+coCRLF;

           if Trim(sGpoProd) <> '' then
           sSQL:= sSQL + '                    AND crp.cve_producto_gpo in '+sGpoProd+''+coCRLF;

           if Trim(sAcreditado) <> '' then
           sSQL:= sSQL + '                    AND cont.id_titular = '+sAcreditado+''+coCRLF;

           if Trim(sContrato) <> '' then
           sSQL:= sSQL + '                    AND cr.id_contrato = '+sContrato+''+coCRLF;

           if Trim(sCesion) <> '' then
           sSQL:= sSQL + '                    AND crh.id_credito = '+sCesion+''+coCRLF;

           If Trim(sSitCred) <> '' then
           sSQL:= sSQL + '                    AND cr.sit_credito '+sSitCred+''+coCRLF;

           sSQL:= sSQL +
           '        )) ppo, '+coCRLF+
           '        cr_ppo_premio cppp, '+coCRLF+
           '        (SELECT   id_credito, SUM (comision_cobrada) comis_cob '+coCRLF+
           '         FROM (SELECT id_credito, NVL (SUM (imp_pagado), 0) comision_cobrada '+coCRLF+
           '                  FROM cr_comision cco, cr_cat_comision cct '+coCRLF+
           '                 WHERE 1=1 '+coCRLF+
	   '		      AND cct.cve_comision = cco.cve_comision '+coCRLF+
	   '		      AND cco.f_pago >= (SELECT f_comis_arran '+coCRLF+
           '                                       FROM cr_ppo_param '+coCRLF+
           '                                      WHERE cve_ppo_param = ''CREDPP'') '+coCRLF+
           '                  AND cco.f_pago <= '+SQLFecha(StrToDate(sF_Al)) +coCRLF+
	   '		      AND cct.b_comis_prem = ''V'' '+coCRLF+
           '                GROUP BY id_credito '+coCRLF+
           '               UNION '+coCRLF+
           '               SELECT id_credito, NVL (SUM (imp_comis_arran), 0) '+coCRLF+
           '                 FROM cr_ppo_premio '+coCRLF+
           '                GROUP BY id_credito) '+coCRLF+
           '        GROUP BY id_credito) coms '+coCRLF+
           '  WHERE 1 = 1 '+coCRLF+
           '    AND cppp.id_credito = ppo.id_credito' +coCRLF+
           '    AND coms.id_credito = ppo.id_credito' +coCRLF;

          If Trim(sSitPre) <> '' then
          sSQL:= sSQL + '    AND cppp.sit_ppo_premio = '''+sSitPre+'''  '+coCRLF ;

          sSQL:= sSQL + ' ORDER BY ppo.acreditado, ppo.id_credito'+coCRLF;


    Result:= sSQL;
End;



procedure TQrIntAplp.qrbDETALLEBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

   If (sArchivo <>'') then//and (qyIntAplp.Active) then
      Writeln(F, qyIntAplp.FieldByName('ID_CREDITO').AsString + #09 + // CREDITO
                 qyIntAplp.FieldByName('ACREDITADO').AsString + #09 + // ACREDITADO
                 FormatFloat('###,###,###,##0.00',qyIntAplp.FieldByName('COMISION_COBRADA').AsFloat) + #09 + //COMISION_COBRADA
                 FormatFloat('###,###,###,##0.00',qyIntAplp.FieldByName('IMP_ESTIMACION').AsFloat) + #09 + //ESTIMACION PREVENTIVA
                 FormatFloat('###,###,###,##0.00',qyIntAplp.FieldByName('IMP_PREMIO').AsFloat) + #09 + //PREMIO POSIBLE A OTORGAR
                 FormatFloat('###,###,###,##0.00',qyIntAplp.FieldByName('EXCESO').AsFloat) + #09 + //EXCESO DE EPRC
                 FormatFloat('###,###,###,##0.00',qyIntAplp.FieldByName('PPOTOPADO').AsFloat) + #09 + //PREMIO PROVISIONADO
                 FormatFloat('###,###,###,##0.00',qyIntAplp.FieldByName('TOTRESERVADO').AsFloat) + #09 + //TOTAL RESERVADO Y PROVISIONADO
                 FormatFloat('###,###,###,##0.00',qyIntAplp.FieldByName('DIFERENCIA').AsFloat) + #09 + //DIFERENCIA
                 FormatFloat('###,###,###,##0.00',qyIntAplp.FieldByName('FALTANTE').AsFloat) + #09 //FALTANTE
               );
end;

procedure TQrIntAplp.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If qyIntAplp.Eof Then Begin
      If Trim(sArchivo)<>'' Then
      Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

End.
