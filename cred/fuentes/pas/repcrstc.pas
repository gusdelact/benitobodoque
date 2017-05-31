unit RepCrStC;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, Db, DBTables,
  IntFrm, UnSql2, Dialogs;

type
  TReportCrStC = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    Query1: TQuery;
    QRInterEncabezado1: TQRInterEncabezado;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel5: TQRLabel;
    QRlbTotal: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    procedure RepTemplateBeforePrint(Sender: TQuickRep; var PrintReport: Boolean);
  private
    FInterFrame: TInterFrame;
    FRequery: Boolean;
  protected
    procedure SetRequery(Open:Boolean);
  public
    Property Requery:Boolean Read FRequery Write SetRequery;
  Property
    InterFrame: TInterFrame Read FInterFrame Write FInterFrame;
    procedure PreparaQuery;
  end;


  procedure ExecRepCrStC(Padre: TInterFrame; Preview: Boolean);

var
  ReportCrStC: TReportCrStC;

implementation

{$R *.DFM}

procedure ExecRepCrStC(Padre: TInterFrame; Preview: Boolean);
var
  Rep: TReportCrStC;
begin
  Rep:= TReportCrStC.Create(nil);
  Rep.InterFrame := Padre;
  try
    Rep.Requery := False;
    Rep.PreparaQuery;
    Rep.Requery := True;

    Rep.Prepare;
    Rep.QRlbTotal.Caption := InttoStr(rep.QRPrinter.PageCount);

    if Preview then
      Rep.Preview
    else Rep.Print;
  finally
    Rep.Free;
  end;
end;

procedure TReportCrStC.SetRequery(Open:Boolean);
begin FRequery := Open;
      If Open
         Then Begin Query1.Open;	{VALIDACIONES PARA ABRIR QUERYS}
              end
         else Begin Query1.Close;
              end;
end;

procedure TReportCrStC.PreparaQuery;
begin Query1.DataBaseName := InterFrame.DataBaseName; {ASIGANACION DEL DataBaseName y el SessionName DE LOS QUERYS}
      Query1.SessionName  := InterFrame.SessionName;
      Query1.SQL.Clear;						{PREPARACION DE LOS QUERYS}
      Query1.SQL.Text:=
        'SELECT TC.CVE_TIPO_CREDITO , TC.DESC_TIPO_CRED , STC.CVE_SUB_TIP_CNBV , STC.DESC_SUB_TIPO , STC.CTA_CONTABLE , STC.CTA_INTERES , STC.CTA_INTERES_VDO , STC.CTA_CAPITAL_VDO ' +
        'FROM   CRE_TIPO_CREDITO TC, CRE_SUB_TIP_CNBV STC ' +
        'WHERE  TC.CVE_TIPO_CREDITO = STC.CVE_TIPO_CREDITO ' +
        'ORDER BY TC.CVE_TIPO_CREDITO , STC.CVE_SUB_TIP_CNBV'
end;


procedure TReportCrStC.RepTemplateBeforePrint(Sender: TQuickRep; var PrintReport: Boolean);
begin {ASIGNACION DE VALORES EN EL REPORTE}
  QRInterEncabezado1.Apli := InterFrame.Apli;
end;





end.
