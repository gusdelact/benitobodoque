unit IntQrCntPPO;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, unSQL2,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead,InterApl,
  IntQRPreview, Dialogs, IntGenCre;

type
  TQrCntPPO = class(TQuickRep)
    QRBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
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
    QRBand2: TQRBand;
    qCntPPO: TQuery;
    QRLabel13: TQRLabel;
    qrbDETALLE: TQRBand;
    QRDBText23: TQRDBText;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRShape6: TQRShape;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    qCntPPOID_CREDITO: TFloatField;
    qCntPPOID_ACREDITADO: TFloatField;
    qCntPPOACREDITADO: TStringField;
    qCntPPOPROV: TFloatField;
    qCntPPOCNCEJANT: TFloatField;
    qCntPPOGASTO: TFloatField;
    qCntPPOMOVIMIENTO: TStringField;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr15: TQRExpr;
    SummaryBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRShape9: TQRShape;
    QRGroupMon: TQRGroup;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRFooterMov: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr10: TQRExpr;
    QRShape10: TQRShape;
    procedure qrbDETALLEBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterMovBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private


  public
    function FormaQuery( sFECHAINI, SFECHAFIN, sACREDITADO, sID_CESION,
                         sTipRep :String ):String;

  end;

var
  QrCntPPO: TQrCntPPO;
  bGenArch: Boolean;
  sArchivo:String;
  Tiporep : String;
  titrep : String;
  vgFechaHoy : TDateTime;
  F: TextFile;
  vgTotal : Currency;
  vgPROV  : Currency;
  vgCNCE  : Currency;
  vgGSTO  : Currency;
  Apli : TInterApli;


  procedure RepContPPO( sFECHAINI, SFECHAFIN, sACREDITADO, sID_CESION, sTipRep,
                        SNbrArch : String;
                        pPreview : Boolean;
                        pApli    : TInterApli);


implementation

{$R *.DFM}

 procedure RepContPPO(  sFECHAINI, SFECHAFIN, sACREDITADO, sID_CESION, sTipRep,
                        SNbrArch : String;
                        pPreview : Boolean;
                        pApli    : TInterApli);

var
    QrCntPPO   : TQrCntPPO;
    VLTitulo  : String;
    Preview   : TIntQRPreview;

begin
    VLTitulo := '';
    QrCntPPO:= TQrCntPPO.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrCntPPO);
    Apli := pApli;
      Try
        vgTotal   := 0.00;
        vgPROV    := 0.00;
        vgCNCE    := 0.00;
        vgGSTO    := 0.00;

        vgFechaHoy  :=  pAPli.DameFechaEmpresa;
        bGenArch    :=  False;
        sArchivo    := sNbrArch;
        Tiporep     :=  '';//tiprep;

        if Tiporep = 'CMS' then
           Titrep := 'Comisiones';

        QrCntPPO.QRInterEncabezado1.Apli := pApli;

        QrCntPPO.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrCntPPO.QRInterEncabezado1.NomReporte:='IntQrCntPPO';
        QrCntPPO.QRInterEncabezado1.Titulo1:= 'Resúmen de movimientos de provisión de PPO';


{        If (Trim(sCVE_PRODUCTO_CRE)<>'') Then
            VLTitulo := VLTitulo + ' Por Producto de Crédito';}


        QrCntPPO.QRInterEncabezado1.Titulo2 := 'Fecha del '+ sFECHAINI + ' al ' +SFECHAFIN;
        QrCntPPO.qCntPPO.DatabaseName := pApli.DataBaseName;
        QrCntPPO.qCntPPO.SessionName  := pApli.SessionName;

        QrCntPPO.qCntPPO.Active:=False;

        QrCntPPO.qCntPPO.SQL.Text:= QrCntPPO.FormaQuery(sFECHAINI, SFECHAFIN, sACREDITADO, sID_CESION, sTipRep);

        QrCntPPO.qCntPPO.SQL.SaveToFile('c:\RepContPPO.txt');
        QrCntPPO.qCntPPO.Active:=True;


        If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, 'BANCO INTERACCIONES, S.A.' + #09 );
         Writeln(F, 'Resúmen de movimientos de provisión de PPO' + #09 );
         Writeln(F, 'Fecha del: ' + sFECHAINI + ' al '+SFECHAFIN+ #09);
         Writeln(F,  #09 );


         Writeln(F,
                   'CREDITO' + #09 +
                   'ACREDITADO' + #09 +
                   'NOMBRE' + #09 +
                   'PROVISION' + #09 +
                   'CANCELA EJ ANT' + #09 +
                   'GASTO' + #09 +
                   'TOTAL' + #09 +
                   'MOVTO.'
                   );


           Writeln(F, '');
      End;

      If pPreview Then
         QrCntPPO.Preview
      Else
         QrCntPPO.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrCntPPO.free;
      If Assigned(Preview) Then Preview.Free;
   End;
end;

function TQrCntPPO.FormaQuery(sFECHAINI, SFECHAFIN, sACREDITADO, sID_CESION, sTipRep :String):String;
Var
    sSQL : String;

begin

      sSQL:= '  SELECT cont.id_credito,  ' +coCRLF+
             '         id_acreditado,' +coCRLF+
             '         CAST(pkgcrconsolidado.fun_nom_tit_cred (cont.id_acreditado) AS VARCHAR2 (100)) acreditado,' +coCRLF+
             '         SUM(CASE WHEN CUENTA = (SELECT cuenta' +coCRLF+
	     '					    FROM (SELECT   *' +coCRLF+
	     '					            FROM cr_ppo_cat_ctas_cont' +coCRLF+
	     '					           WHERE f_inicio <= '+SQLFecha(StrToDate(sFECHAFIN))+coCRLF+
	     '					             AND cve_cuenta = ''PROV''' +coCRLF+
	     '					           ORDER BY f_inicio DESC, fh_registro DESC)' +coCRLF+
	     '					   WHERE ROWNUM = 1) THEN (CASE WHEN tipo_afectacion = ''C'' THEN imp_concepto ELSE (imp_concepto * -1) END) ELSE 0 END) AS PROV,' +coCRLF+
             '	       SUM(CASE WHEN CUENTA = (SELECT cuenta' +coCRLF+
	     '					    FROM (SELECT   *' +coCRLF+
	     '					            FROM cr_ppo_cat_ctas_cont' +coCRLF+
	     '					           WHERE f_inicio <= '+SQLFecha(StrToDate(sFECHAFIN))+coCRLF+
	     '					             AND cve_cuenta = ''CNEJ''' +coCRLF+
	     '					           ORDER BY f_inicio DESC, fh_registro DESC)' +coCRLF+
	     '					   WHERE ROWNUM = 1) THEN (CASE WHEN tipo_afectacion = ''C'' THEN imp_concepto ELSE (imp_concepto * -1) END) ELSE 0 END) AS CNCEJANT,' +coCRLF+
             '	       SUM(CASE WHEN CUENTA = (SELECT cuenta' +coCRLF+
	     '					    FROM (SELECT   *' +coCRLF+
	     '					            FROM cr_ppo_cat_ctas_cont' +coCRLF+
	     '					           WHERE f_inicio <= '+SQLFecha(StrToDate(sFECHAFIN))+coCRLF+
	     '					             AND cve_cuenta = ''GSTO''' +coCRLF+
	     '					           ORDER BY f_inicio DESC, fh_registro DESC)' +coCRLF+
	     '					   WHERE ROWNUM = 1) THEN (CASE WHEN tipo_afectacion = ''C'' THEN imp_concepto ELSE (imp_concepto * -1) END) ELSE 0 END) AS GASTO,' +coCRLF+
             '         CASE WHEN MOVTO.CVE_OPERACION = ''PPPPAG'' THEN ''PAGADO''' +coCRLF+
             '                     WHEN MOVTO.CVE_OPERACION = ''PPPREM'' THEN ''CANCELADO''' +coCRLF+
             '                         ELSE ''PROVISIONADO'' END AS MOVIMIENTO' +coCRLF+
             '   FROM cr_cont_evento_det cont,' +coCRLF+
             '            (' +coCRLF+
             '                       SELECT cmp.id_credito,' +coCRLF+
             '                              crpr.cve_operacion' +coCRLF+
             '                         FROM cr_ppo_mov crpm, cr_ppo_rel_mov_ope crpr, cr_ppo_mov_premio cmp' +coCRLF+
             '                        WHERE 1 = 1' +coCRLF+
             '                          AND crpm.cve_ppo_mov = crpr.cve_ppo_mov' +coCRLF+
             '                          AND crpr.cve_ppo_mov = cmp.cve_ppo_mov' +coCRLF+
             '                          AND cmp.f_alta BETWEEN '+SQLFecha(StrToDate(sFECHAINI))+' AND '+SQLFecha(StrToDate(SFECHAFIN)) +coCRLF+
             '                               group by id_credito, cve_operacion' +coCRLF+
             '                ) movto' +coCRLF+
             '  WHERE 1 = 1' +coCRLF+
             '    AND movto.id_credito (+) = cont.id_credito' +coCRLF+
             '    AND cont.cve_origen = ''PO''' +coCRLF+
             '    AND cont.f_operacion BETWEEN '+SQLFecha(StrToDate(sFECHAINI))+' AND '+SQLFecha(StrToDate(SFECHAFIN)) +coCRLF;

             if trim(sACREDITADO) <> '' then
             sSQL := sSQL +

             '    AND CONT.ID_ACREDITADO = '+sACREDITADO +coCRLF;

             if trim(sID_CESION) <> '' then
             sSQL := sSQL +

             '    AND CONT.ID_CREDITO = '+sID_CESION +coCRLF;

            sSQL := sSQL +
             '    AND cont.cuenta IN (' +coCRLF+
             '                        (SELECT cuenta' +coCRLF+
             '                           FROM (SELECT   *' +coCRLF+
             '                                   FROM cr_ppo_cat_ctas_cont' +coCRLF+
             '                                  WHERE f_inicio <= '+SQLFecha(StrToDate(sFECHAFIN))+coCRLF+
             '                                    AND cve_cuenta = ''PROV''' +coCRLF+
             '                                  ORDER BY f_inicio DESC, fh_registro DESC)' +coCRLF+
             '                          WHERE ROWNUM = 1),' +coCRLF+
             '                        (SELECT cuenta' +coCRLF+
             '                           FROM (SELECT   *' +coCRLF+
             '                                   FROM cr_ppo_cat_ctas_cont' +coCRLF+
             '                                  WHERE f_inicio <= '+SQLFecha(StrToDate(sFECHAFIN))+coCRLF+
             '                                    AND cve_cuenta = ''CNEJ''' +coCRLF+
             '                                  ORDER BY f_inicio DESC, fh_registro DESC)' +coCRLF+
             '                          WHERE ROWNUM = 1),' +coCRLF+
             '                        (SELECT cuenta' +coCRLF+
             '                           FROM (SELECT   *' +coCRLF+
             '                                   FROM cr_ppo_cat_ctas_cont' +coCRLF+
             '                                  WHERE f_inicio <= '+SQLFecha(StrToDate(sFECHAFIN))+coCRLF+
             '                                    AND cve_cuenta = ''GSTO''' +coCRLF+
             '                                  ORDER BY f_inicio DESC, fh_registro DESC)' +coCRLF+
             '                          WHERE ROWNUM = 1)' +coCRLF+
             '                        )' +coCRLF+
             '  GROUP BY cont.ID_CREDITO, MOVTO.CVE_OPERACION, id_acreditado' +coCRLF+
             '  ORDER BY movimiento, cont.id_credito';

    Result:= sSQL;

end;


procedure TQrCntPPO.qrbDETALLEBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

    vgTotal := qCntPPO.FieldByName('PROV').AsFloat + qCntPPO.FieldByName('CNCEJANT').AsFloat + qCntPPO.FieldByName('GASTO').AsFloat;

    If sArchivo <>'' Then Begin


         vgPROV := vgPROV + qCntPPO.FieldByName('PROV').AsFloat;
         vgCNCE := vgCNCE + qCntPPO.FieldByName('CNCEJANT').AsFloat;
         vgGSTO := vgGSTO + qCntPPO.FieldByName('GASTO').AsFloat;


         Writeln(F,
                 qCntPPO.FieldByName('ID_CREDITO').AsString + #09 +
                 qCntPPO.FieldByName('ID_ACREDITADO').AsString + #09 +
                 qCntPPO.FieldByName('ACREDITADO').AsString + #09 +
                 FormatFloat('###,###,###,##0.00',qCntPPO.FieldByName('PROV').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.00',qCntPPO.FieldByName('CNCEJANT').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.00',qCntPPO.FieldByName('GASTO').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.00',vgTotal)+ #09 +
                 qCntPPO.FieldByName('MOVIMIENTO').AsString + #09
                 );

    End;
end;

procedure TQrCntPPO.QRFooterMovBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If (sArchivo <>'') then
  begin
      Writeln(F,  #09+#09+'Total'+#09+FormatFloat('###,###,###,##0.00',vgPROV)+#09+FormatFloat('###,###,###,##0.00',vgCNCE)+#09+FormatFloat('###,###,###,##0.00',vgGSTO)+#09 );
      Writeln(F,  #09);
      Writeln(F,  #09);            
  end;
   vgPROV := 0.00;
   vgCNCE := 0.00;
   vgGSTO := 0.00;
end;

end.
