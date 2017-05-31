unit IntQrSatHipAv;

interface
            
uses
  SysUtils, Windows,    Messages, Classes,  Graphics,     Controls,
  StdCtrls, ExtCtrls,   Forms,    Quickrpt, QRCtrls,      Db, DBTables,
  IntFrm,   IntTraduce, UnGene,   UnSQL2,   InterApl,     IntQRPreview,
  Dialogs, IntGenCre;

type
  TQrSatHipAv = class(TQuickRep)
    QRDetalle: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText7: TQRDBText;
    qMain: TQuery;
    PageHeaderBand1: TQRBand;
    qrlbCVE_CORRESP: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape11: TQRShape;
    QRDBText21: TQRDBText;                       
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRMemo: TQRMemo;
    qMainID_CREDITO: TFloatField;
    qMainID_CONTRATO: TFloatField;
    qMainID_TITULAR: TFloatField;
    qMainID_DOMICILIO: TFloatField;
    qMainCVE_CORRESP: TStringField;
    qMainAPELLIDO_PATERNO: TStringField;
    qMainAPELLIDO_MATERNO: TStringField;
    qMainNOMBRE_PERSONA: TStringField;
    qMainNOMBRE: TStringField;
    qMainRFC: TStringField;
    qMainCVE_MONEDA: TFloatField;
    qMainF_LIQ_BNC: TDateTimeField;
    qMainCALLE_NUMERO: TStringField;
    qMainCOLONIA: TStringField;
    qMainCODIGO_POSTAL: TStringField;
    qMainCIUDAD: TStringField;
    qMainESTADO: TStringField;
    qMainPAIS: TStringField;
    qrlblEjercicio: TQRLabel;
    qMainCVE_PRODUCTO: TStringField;
    procedure QRDetalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
  public
    procedure PreparaQuery(peEJERCICIO, peID_CREDITO_INI, peID_CREDITO_FIN : Integer);
  end;

procedure RepSatHipAv(Ejercicio : Integer; nID_CREDITO_INI, nID_CREDITO_FIN : Integer; peApli :  TInterApli; Preview : Boolean );


var
  QrSatHipAv : TQrSatHipAv;

implementation
{$R *.DFM}

procedure RepSatHipAv(Ejercicio : Integer; nID_CREDITO_INI, nID_CREDITO_FIN : Integer; peApli :  TInterApli; Preview : Boolean );
var
  Rep : TQrSatHipAv;
  IntQRPreview : TIntQRPreview;
begin
  Rep := TQrSatHipAv.Create(nil);
  IntQRPreview := TIntQRPreview.CreatePreview(Application, Rep);
  try
    Rep.qMain.DatabaseName := peApli.DataBaseName;
    Rep.qMain.SessionName  := peApli.SessionName;
    Rep.qrlblEjercicio.Caption := IntToStr(Ejercicio);
    Rep.PreparaQuery( Ejercicio, nID_CREDITO_INI, nID_CREDITO_FIN );

    if not Rep.qMain.IsEmpty then
    begin
        if Preview then
          Rep.Preview
        else
          Rep.Print;
    end;
  finally
    if Rep <> nil then
      Rep.Free;
    if IntQRPreview <> nil then
      IntQRPreview.Free;
  end;
end;

procedure TQrSatHipAv.PreparaQuery(peEJERCICIO, peID_CREDITO_INI, peID_CREDITO_FIN : Integer);
var vlSQL : String;
begin
  vlSQL :=   '    SELECT CC.ID_CREDITO,'+coCRLF+
             '           CC.ID_CONTRATO,'+coCRLF+
             '           CTTO.ID_TITULAR,'+coCRLF+
             '           CTTO.ID_DOMICILIO,'+coCRLF+
             '           CTTO.CVE_CORRESP,'+coCRLF+
//             '           L.CVE_SUB_TIP_BCO,'+coCRLF+
             '           CC.CVE_PRODUCTO,'+coCRLF+ // EASA 17FEB2010
             '           PF.APELLIDO_PATERNO,'+coCRLF+
             '           PF.APELLIDO_MATERNO,'+coCRLF+
             '           PF.NOMBRE_PERSONA,'+coCRLF+
             '           PF.APELLIDO_PATERNO || '' '' ||PF.APELLIDO_MATERNO || '' '' ||PF.NOMBRE_PERSONA NOMBRE,'+coCRLF+
             '           RFC.SIGLAS_RFC ||'+coCRLF+
             '           RFC.F_RFC      ||'+coCRLF+
             '           RFC.HOMOCLAVE_RFC       "RFC",'+coCRLF+
             '           CTTO.CVE_MONEDA,'+coCRLF+
             '           CC.F_LIQ_BNC,'+coCRLF+
             '           D.CALLE_NUMERO,'+coCRLF+
             '           D.COLONIA,'+coCRLF+
             '           D.CODIGO_POSTAL,'+coCRLF+
             '           C.DESC_POBLACION CIUDAD,'+coCRLF+
             '           E.DESC_POBLACION ESTADO,'+coCRLF+
             '           P.DESC_POBLACION PAIS'+coCRLF+
//             '    FROM   CRE_CREDITO  CC,'+coCRLF+
             '    FROM  ('+coCRLF+
             '            SELECT CC.ID_CREDITO, CC.ID_CONTRATO, TO_CHAR(L.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO, CC.F_LIQ_BNC'+coCRLF+
             '            FROM CRE_CREDITO CC, CRE_CONTRATO L'+coCRLF+
             '            WHERE CC.SIT_CREDITO NOT IN (''CA'',''TA'')'+coCRLF+
             '              AND L.ID_CONTRATO  = CC.ID_CONTRATO'+coCRLF+
             '         UNION ALL'+coCRLF+
             '            SELECT CC.ID_CREDITO, CC.ID_CONTRATO, CTO.CVE_PRODUCTO_CRE AS CVE_PRODUCTO, CC.F_LIQUIDACION AS F_LIQ_BNC'+coCRLF+
             '            FROM CR_CREDITO CC, CR_CONTRATO CTO'+coCRLF+
             '            WHERE CC.SIT_CREDITO  <> ''CA'''+coCRLF+
             '              AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '           ) CC,'+coCRLF+
//             '           CRE_CONTRATO L,'+coCRLF+
             '           CONTRATO CTTO,'+coCRLF+
             '           PERSONA      P,'+coCRLF+
             '           PERSONA_FISICA PF,'+coCRLF+
             '           RFC,'+coCRLF+
             '           DOMICILIO D,'+coCRLF+
             '           POBLACION C,'+coCRLF+
             '           POBLACION E,'+coCRLF+
             '           POBLACION P,'+coCRLF+
             '           SAT_CRE_LAYOUT SCL'+coCRLF+
             '    WHERE 1 = 1'+coCRLF;

    If (peEjercicio > 0) Then
        vlSQL := vlSQL + '   AND  SCL.EJERCICIO  = '+IntToStr(peEjercicio)+coCRLF;

    If (peID_CREDITO_INI > 0) And (peID_CREDITO_FIN > 0) Then
       vlSQL := vlSQL + '   AND SCL.ID_CREDITO BETWEEN '+IntToStr(peID_CREDITO_INI)+' AND '+IntToSTr(peID_CREDITO_FIN)+coCRLF
    Else If (peID_CREDITO_INI > 0)  Then
             vlSQL := vlSQL + '   AND SCL.ID_CREDITO = '+IntToStr(peID_CREDITO_INI)+coCRLF;
                  
  vlSQL := vlSQL +
              '      AND  SCL.B_REPORTA_SAT = ''V'' '+coCRLF+
//              '      AND SCL.ID_CREDITO NOT IN (44978,47589,45398,48022,45522,45557,46360,265005,261950,16548,6485,5013,4998,5002,5188,5048,4973,5064,5186,5056,5052,4990,4991,5134,47601) ' + // EASA 12.FEB.2010
              '      AND  CC.ID_CREDITO     = SCL.ID_CREDITO'+coCRLF+
//              '      AND  L.ID_CONTRATO     = CC.ID_CONTRATO'+coCRLF+
//              '      AND  CTTO.ID_CONTRATO  = L.ID_CONTRATO'+coCRLF+
              '      AND  CTTO.ID_CONTRATO  = CC.ID_CONTRATO'+coCRLF+
              '      AND  P.ID_PERSONA      = CTTO.ID_TITULAR'+coCRLF+
              '      AND  PF.ID_PERSONA     = P.ID_PERSONA'+coCRLF+
              '      AND  RFC.ID_PERSONA(+) = CTTO.ID_TITULAR'+coCRLF+
              '      AND  D.ID_DOMICILIO = CTTO.ID_DOMICILIO'+coCRLF+
              '      AND  D.CVE_CIUDAD   = C.CVE_POBLACION'+coCRLF+
              '      AND  D.CVE_ESTADO   = E.CVE_POBLACION'+coCRLF+
              '      AND  D.CVE_PAIS     = P.CVE_POBLACION'+coCRLF+
              '    ORDER BY ID_CREDITO'+coCRLF;

  qMain.Close;
  qMain.SQL.Clear;
  qMain.SQL.Add(vlSQL);
  qMain.SQL.SaveToFile('C:\qryAviso.txt');
  qMain.Open;
end;

procedure TQrSatHipAv.QRDetalleBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
  //Correspondencia
  if qMain.FieldByName('CVE_CORRESP').AsString = 'RT' then
    qrlbCVE_CORRESP.Caption := 'Retener Correspondencia'
  else
    qrlbCVE_CORRESP.Caption := '';
end;


end.

