// Sistema         : ICRE
// Fecha de Inicio : 04/12/2009
// Función forma   :
// Diseñado por    : Roberto Andres Silva Tello
// Comentarios     :
unit qrCrPlazoRe;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, QRExport;

type
  TqrCrPlazoRes = class(TQuickRep)
    qrPlazoRes: TQuery;
    qrPlazoResID_CREDITO: TFloatField;
    qrPlazoResCONCEPTO: TStringField;
    qrPlazoResCAD_PRODUCTIVA: TStringField;
    qrPlazoResSECTOR: TStringField;
    qrPlazoResSALDO_INICIAL: TFloatField;
    qrPlazoResSALDO: TFloatField;
    qrPlazoResSALDO_PROMEDIO: TFloatField;
    qrPlazoResPLAZO: TStringField;
    qrPlazoResMONEDA: TStringField;
    qrPlazoResHABER: TFloatField;
    QRBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel33: TQRLabel;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    qrAgrupa: TQuery;
    qrAgrupaCONCEPTO: TStringField;
    qrAgrupaCAD_PRODUCTIVA: TStringField;
    qrAgrupaMONEDA: TStringField;
    QuickRep1: TQuickRep;
    qrAgrupaCP: TFloatField;
    qrAgrupaLP: TFloatField;
    TitleBand2: TQRBand;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    qrAgrupaImpBalanza: TCurrencyField;
    SummaryBand2: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr4: TQRExpr;
    QRImage2: TQRImage;
    QRLabel51: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRImage1: TQRImage;
    QRLabel50: TQRLabel;
    DetailBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText18: TQRDBText;
    QRBand2: TQRBand;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRGroup3: TQRGroup;
    QRGroup4: TQRGroup;
    QRDBText20: TQRDBText;
    QRBand3: TQRBand;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel5: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr10: TQRExpr;
    QRLabel10: TQRLabel;
    QRExpr11: TQRExpr;
    DetailBand1: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData2: TQRSysData;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    procedure qrPlazoResCalcFields(DataSet: TDataSet);
    procedure qrAgrupaCalcFields(DataSet: TDataSet);
  private

  public

  end;

var
  qrCrPlazoRes: TqrCrPlazoRes;

implementation

{$R *.DFM}

procedure TqrCrPlazoRes.qrPlazoResCalcFields(DataSet: TDataSet);
begin
 //qrPlazoResSALDO_FINAL.Value:= qrPlazoResSALDO_INICIAL.Value - qrPlazoResSALDO.Value; 
end;

procedure TqrCrPlazoRes.qrAgrupaCalcFields(DataSet: TDataSet);
begin
qrAgrupaImpBalanza.Value:= qrAgrupaCP.Value + qrAgrupaLP.Value;
end;

end.
