unit QRRepEdoCta;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,intfrm, IntHead, Db,
  DBTables,dialogs,UNCONDI,UnSQL2, InterApl, QRPrntr;

type
  TqrCartaDepRef = class(TQuickRep)
    qry: TQuery;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    qryNOMBRE: TStringField;
    qryID_CONTRATO: TStringField;
    qryREF1: TFloatField;
    qryREF2: TFloatField;
    SPDIGIT: TStoredProc;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRLabel1: TQRLabel;
    QRMemo4: TQRMemo;
    QRMemo5: TQRMemo;
    QRMemo6: TQRMemo;
    QRMemo7: TQRMemo;
    QRMC: TQRMemo;
    QRMemo9: TQRMemo;
    QRMemo10: TQRMemo;
    QRMemo11: TQRMemo;
    QRMemo12: TQRMemo;
    QRMemo13: TQRMemo;
    QRMemo14: TQRMemo;
    QRM1: TQRMemo;
    QRMemo16: TQRMemo;
    QRLabel3: TQRLabel;
    QRMemo17: TQRMemo;
    QRMemo18: TQRMemo;
    QRMemo19: TQRMemo;
    QRMemo20: TQRMemo;
    QRMemo21: TQRMemo;
    QRMemo22: TQRMemo;
    QRMemo23: TQRMemo;
    QRMemo24: TQRMemo;
    QRM2: TQRMemo;
    QRM3: TQRMemo;
    QRM4: TQRMemo;
    QRM5: TQRMemo;
    QRMemo29: TQRMemo;
    QRMemo30: TQRMemo;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRMemo8: TQRMemo;
    QRMemo15: TQRMemo;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrCartaDepRef: TqrCartaDepRef;
  vgultimos:integer;
  vgObjeto:TInterFrame;
  VGSQL:STRING;
  pApli : TInterApli;

procedure Rpt_CartaDepRef(Objeto:TInterFrame;Fecha, sFiltro:String;Preview, peBManual:boolean);

implementation

{$R *.DFM}
procedure Rpt_CartaDepRef(Objeto:TInterFrame;Fecha, sFiltro:String;Preview, peBManual:boolean);
var sSQL:String;// sWhere:STRING;    
begin
  try
    qrCartaDepRef:=TqrCartaDepRef.Create(nil);
    qrCartaDepRef.qry.DatabaseName:=Objeto.Apli.DataBaseName;
    qrCartaDepRef.qry.SessionName:=Objeto.Apli.SessionName;
    qrCartaDepRef.SPDIGIT.SessionName:=Objeto.Apli.SessionName;
    qrCartaDepRef.SPDIGIT.DatabaseName:=Objeto.Apli.DatabaseName;
    qrCartaDepRef.qry.Close;
    pApli:=Objeto.Apli;
//    sWhere:=InputBox('Condición Adicional','Condición:','and rownum=1');
    sSQL:=//ICRE
          ' SELECT * FROM ( '+
          ' SELECT '+
          '  DECODE(C.ID_TITULAR,319039,''300002917'',371745,''300054364'',407652,''300058386'', '+
             ' substr(Pkgcrperiodo.stpobtchqcte(C.ID_TITULAR,''0'',NULL,''AC'',''AD'',''CR''),1,9)) AS ID_CONTRATO, '+
          '  Pkgdigvrf.fundigvrfrefnum(DECODE(C.ID_TITULAR,319039,300002917,371745,300054364,407652,300058386, '+
             ' substr(Pkgcrperiodo.stpobtchqcte(C.ID_TITULAR,''0'',NULL,''AC'',''AD'',''CR''),1,9)),2) AS REF1, '+
          '  Pkgdigvrf.fundigvrfrefnum(DECODE(C.ID_TITULAR,319039,300002917,371745,300054364,407652,300058386, '+
             ' substr(Pkgcrperiodo.stpobtchqcte(C.ID_TITULAR,''0'',NULL,''AC'',''AD'',''CR''),1,9)),11) AS REF2, '+
          ' 	   P.NOMBRE '+
          ' FROM CR_CON_ADEUDO_SDO CC, CR_CREDITO CR, CR_CONTRATO CO, CR_PRODUCTO CP, CONTRATO C, PERSONA P '+
          ' WHERE F_CIERRE          = '''+FECHA+''' '+
          ' AND CR.ID_CREDITO       = CC.ID_CREDITO '+
          ' AND CO.ID_CONTRATO      = CR.ID_CONTRATO  '+
          ' AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE '+
          ' AND ((CP.CVE_PRODUCTO_GPO <> ''FACTOR'') and (CP.CVE_PRODUCTO_CRE NOT IN (''033AGR'',''034AGR'','+
                ' ''035AGR'',''036AGR'',''037AGR'',''040AGR'',''038AGR'')) ) '+
          ' AND C.ID_CONTRATO       = CR.ID_CONTRATO '+
          ' AND P.ID_PERSONA        = C.ID_TITULAR '+
          ' AND c.id_titular NOT IN (194793,343214,388792,390083) '+
          sFiltro+
          ' GROUP BY SUBSTR(Pkgcrperiodo.stpobtchqcte(C.ID_TITULAR,''0'',NULL,''AC'',''AD'',''CR''),1,9), C.ID_TITULAR, P.NOMBRE '+
          ' UNION ALL '+
          //INTERCREDITOS          
          ' SELECT TO_CHAR(C.ID_CTO_LIQ) AS id_contrato, Pkgdigvrf.fundigvrfrefnum(c.id_cto_liq,2) AS ref1, '+
          '        Pkgdigvrf.fundigvrfrefnum(c.id_cto_liq,11) AS ref2,P.NOMBRE '+
          ' FROM CR_CON_ADEUDO_SDO CC, CRE_CREDITO CR, CONTRATO C, PERSONA P '+
          ' WHERE F_CIERRE    = '''+FECHA+''' '+
          ' AND CR.ID_CREDITO = CC.ID_CREDITO '+
          ' AND C.ID_CONTRATO = CR.ID_CONTRATO '+
          ' AND P.ID_PERSONA  = C.ID_TITULAR '+
          ' AND (C.ID_CTO_LIQ,c.id_titular) NOT IN '+
                               ' (SELECT SUBSTR(Pkgcrperiodo.stpobtchqcte(C.ID_TITULAR,''0'',NULL,''AC'',''AD'',''CR''),1,9) AS ID_CONTRATO, '+
                                       ' C.ID_TITULAR '+
                                 '  FROM CR_CON_ADEUDO_SDO CC, CR_CREDITO CR, CR_CONTRATO CO, CR_PRODUCTO CP, CONTRATO C '+
                                 '  WHERE F_CIERRE          = '''+FECHA+''' '+
                                 '  AND CR.ID_CREDITO       = CC.ID_CREDITO '+
                                 '  AND CO.ID_CONTRATO      = CR.ID_CONTRATO '+
                                 '  AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE '+
                                 '  AND ((CP.CVE_PRODUCTO_GPO <> ''FACTOR'') and (CP.CVE_PRODUCTO_CRE NOT IN (''033AGR'',''034AGR'','+
                                      ' ''035AGR'',''036AGR'',''037AGR'',''040AGR'',''038AGR'')) ) '+
                                 '  AND C.ID_CONTRATO       = CR.ID_CONTRATO '+
                                 '  GROUP BY SUBSTR(Pkgcrperiodo.stpobtchqcte(C.ID_TITULAR,''0'',NULL,''AC'',''AD'',''CR''),1,9), C.ID_TITULAR)  '+
          sFiltro+
          ' GROUP BY C.ID_CTO_LIQ, C.ID_TITULAR, P.NOMBRE '+
          ' ) ORDER BY ID_CONTRATO ';
    qrCartaDepRef.qry.sql.Text:=sSQL;
    qrCartaDepRef.qry.Open;

    if qrCartaDepRef.RecordCount<>0 then
    begin 
          If peBManual = True 
          then qrCartaDepRef.PrinterSettings.OutputBin := manual
          else qrCartaDepRef.PrinterSettings.OutputBin := Auto;
          if Preview           
          Then qrCartaDepRef.Preview
          else qrCartaDepRef.Print;
    end
    else showmessage('No Existen Registros ')
  finally
  //If qrCartaDepRef <> nil then qrCartaDepRef.Free;
  end;
end;

procedure TqrCartaDepRef.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
//var SPClabe : TStoredProc;
begin
  QRM1.Lines.Clear;
  QRM2.Lines.Clear;
  QRM3.Lines.Clear;
  QRM4.Lines.Clear;
  QRM5.Lines.Clear;
  QRM1.Lines.Add(chr(13)+qrCartaDepRef.qry.fieldbyname( 'ref1' ).AsString);
  QRM2.Lines.Add(chr(13)+qrCartaDepRef.qry.fieldbyname( 'ref1' ).AsString);
  QRM3.Lines.Add(chr(13)+qrCartaDepRef.qry.fieldbyname( 'ref1' ).AsString);
  QRM4.Lines.Add(chr(13)+qrCartaDepRef.qry.fieldbyname( 'ref1' ).AsString);
  QRM5.Lines.Add(chr(13)+qrCartaDepRef.qry.fieldbyname( 'ref2' ).AsString);

  SPDIGIT.Params.ParamByName('PEREFNUMERICA').AsString:='';
  SPDIGIT.Params.ParamByName('PEREFALFNUMERICA').AsString:= '03718000'+qrCartaDepRef.qry.fieldbyname( 'ID_Contrato').AsString;
  SPDIGIT.Params.ParamByName('PEIDMETODO').AsInteger:=9;
  SPDIGIT.ExecProc;
  QRMC.Lines.Clear;
  if SPDIGIT.ParamByName('PSRESULTADO').AsInteger = 0 then
     QRMC.Lines.Add(chr(13)+'  CLABE: 03718000'+qrCartaDepRef.qry.FieldByName('ID_Contrato').AsString+SPDIGIT.ParamByName('PSDIGVERIFICADORV').AsString);
  PrintBand:=TRUE;
end;

end.
