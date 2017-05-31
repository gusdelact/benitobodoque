unit RepCrTip;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, Db, DBTables,
  IntFrm, UnSql2, Dialogs;

type
  TReportCrTip = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    Query1: TQuery;
    QRInterEncabezado1: TQRInterEncabezado;
    DetailBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText4: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel5: TQRLabel;
    QRlbTotal: TQRLabel;
    QRShape2: TQRShape;
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


  procedure ExecRepCrTip(Padre: TInterFrame; Preview: Boolean);

var
  ReportCrTip: TReportCrTip;

implementation

{$R *.DFM}

procedure ExecRepCrTip(Padre: TInterFrame; Preview: Boolean);
var
  Rep: TReportCrTip;
begin
  Rep:= TReportCrTip.Create(nil);
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

procedure TReportCrTip.SetRequery(Open:Boolean);
begin FRequery := Open;
      If Open
         Then Begin Query1.Open;	{VALIDACIONES PARA ABRIR QUERYS}
              end
         else Begin Query1.Close;
              end;
end;

procedure TReportCrTip.PreparaQuery;
begin Query1.DataBaseName := InterFrame.DataBaseName; {ASIGANACION DEL DataBaseName y el SessionName DE LOS QUERYS}
      Query1.SessionName  := InterFrame.SessionName;
      Query1.SQL.Clear;						{PREPARACION DE LOS QUERYS}
      Query1.SQL.Text:= 'SELECT CRE_TIPO_CREDITO.CVE_TIPO_CREDITO, CRE_TIPO_CREDITO.DESC_TIPO_CRED, CRE_TIPO_CREDITO.TIPO_CUENTA FROM CRE_TIPO_CREDITO ORDER BY CVE_TIPO_CREDITO';
end;


procedure TReportCrTip.RepTemplateBeforePrint(Sender: TQuickRep; var PrintReport: Boolean);
begin {ASIGNACION DE VALORES EN EL REPORTE}
  QRInterEncabezado1.Apli := InterFrame.Apli;
end;


end.
