unit RepCrCls;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, Db, DBTables,
  IntFrm, UnSql2, Dialogs;

type
  TReportCrCls = class(TQuickRep)
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
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel9: TQRLabel;
    procedure RepTemplateBeforePrint(Sender: TQuickRep; var PrintReport: Boolean);
  private
    FInterFrame: TInterFrame;
    FRequery: Boolean;
    FCNBV : Boolean;
  protected
    procedure SetRequery(Open:Boolean);
  public
    Property Requery:Boolean Read FRequery Write SetRequery;
  Property
    InterFrame: TInterFrame Read FInterFrame Write FInterFrame;
    procedure PreparaQuery;
  end;


  procedure ExecRepCrCls(Padre: TInterFrame; Preview: Boolean; vlCNBV : boolean);

var
  ReportCrCls: TReportCrCls;

implementation

{$R *.DFM}

procedure ExecRepCrCls(Padre: TInterFrame; Preview: Boolean; vlCNBV : boolean);
var
  Rep: TReportCrCls;
begin
  Rep:= TReportCrCls.Create(nil);
  Rep.InterFrame := Padre;
  Rep.FCNBV := vlCNBV;
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

procedure TReportCrCls.SetRequery(Open:Boolean);
begin FRequery := Open;
      If Open
         Then Begin Query1.Open;	{VALIDACIONES PARA ABRIR QUERYS}
              end
         else Begin Query1.Close;
              end;
end;

procedure TReportCrCls.PreparaQuery;
begin Query1.DataBaseName := InterFrame.DataBaseName; {ASIGANACION DEL DataBaseName y el SessionName DE LOS QUERYS}
      Query1.SessionName  := InterFrame.SessionName;
      Query1.SQL.Clear;						{PREPARACION DE LOS QUERYS}
      if fCNBV then
        begin
          QRInterEncabezado1.Titulo1 := 'Reporte de Clasificación CNBV';
          Query1.SQL.Text:=
                       'SELECT	C.CVE_TIPO_CLASIF CVEPRIN, C.DESC_TIPO_CLASIF DESPRIN, SC.CVE_TIPO_CLASIF CVESEC, SC.DESC_TIPO_CLASIF DESSEC ' +
                       'FROM	CRE_TIPO_CLASIF C, CRE_TIPO_CLASIF SC ' +
                       'WHERE	SC.CVE_TIPO_PRIN = C.CVE_TIPO_CLASIF ' +
                       '    AND SC.CVE_INSTITUCION = ''C'' ' +
                       'ORDER BY C.CVE_TIPO_CLASIF, SC.CVE_TIPO_CLASIF';
        end
      else
        begin
          QRInterEncabezado1.Titulo1 := 'Reporte de Clasificación SHCP';
          Query1.SQL.Text:=
                       'SELECT	C.CVE_TIPO_CLASIF CVEPRIN, C.DESC_TIPO_CLASIF DESPRIN, SC.CVE_TIPO_CLASIF CVESEC, SC.DESC_TIPO_CLASIF DESSEC ' +
                       'FROM	CRE_TIPO_CLASIF C, CRE_TIPO_CLASIF SC ' +
                       'WHERE	SC.CVE_TIPO_PRIN = C.CVE_TIPO_CLASIF (+) ' +
                       '    AND SC.CVE_INSTITUCION = ''H'' ' +
                       'ORDER BY SC.CVE_TIPO_CLASIF';
        end;
end;


procedure TReportCrCls.RepTemplateBeforePrint(Sender: TQuickRep; var PrintReport: Boolean);
begin {ASIGNACION DE VALORES EN EL REPORTE}
  QRInterEncabezado1.Apli := InterFrame.Apli;
end;





end.
