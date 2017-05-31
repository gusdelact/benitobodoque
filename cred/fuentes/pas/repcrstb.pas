unit RepCrStB;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, Db, DBTables,
  IntFrm, UnSql2, Dialogs;

type
  TReportCrStB = class(TQuickRep)
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
    QRDBText10: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
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


  procedure ExecRepCrStB(Padre: TInterFrame; Preview: Boolean);

var
  ReportCrStB: TReportCrStB;

implementation

{$R *.DFM}

procedure ExecRepCrStB(Padre: TInterFrame; Preview: Boolean);
var
  Rep: TReportCrStB;
begin
  Rep:= TReportCrStB.Create(nil);
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

procedure TReportCrStB.SetRequery(Open:Boolean);
begin FRequery := Open;
      If Open
         Then Begin Query1.Open;	{VALIDACIONES PARA ABRIR QUERYS}
              end
         else Begin Query1.Close;
              end;
end;

procedure TReportCrStB.PreparaQuery;
begin Query1.DataBaseName := InterFrame.DataBaseName; {ASIGANACION DEL DataBaseName y el SessionName DE LOS QUERYS}
      Query1.SessionName  := InterFrame.SessionName;
{      Query1.SQL.Clear;						{PREPARACION DE LOS QUERYS}
{      Query1.SQL.Text:=
      'SELECT                                                   ' +
      ' STC.CVE_SUB_TIP_CNBV ,                                  ' +
      '	STB.CVE_SUB_TIP_BCO ,                                   ' +
      '	TC.DESC_TIPO_CRED,                                      ' +
      ' STC.DESC_SUB_TIPO DESCRIPCION,                          ' +
      '	STC.DESC_SUB_TIPO ,                                     ' +
      '	STB.DESC_SUB_TIPO ,                                     ' +
      ' STB.B_ANTICIPADO ,                                      ' +
      '	STB.B_APLICA_IVA ,                                      ' +
      '	STB.B_GENERA_BNC ,                                      ' +
      '	STB.B_REESTRUCTURA ,                                    ' +
      '	STB.FACT_EROG_NETA ,                                    ' +
      '	STB.FACT_COMIS_BCO ,                                    ' +
      '	STB.FACT_COMIS_FOVI ,                                   ' +
      '	STB.FACT_PAGO_MILLAR                                    ' +
      'FROM CRE_TIPO_CREDITO TC, CRE_SUB_TIP_CNBV STC, CRE_SUB_TIP_BCO STB ' +
      'WHERE TC.CVE_TIPO_CREDITO = STC.CVE_TIPO_CREDITO AND                ' +
      'STC.CVE_SUB_TIP_CNBV = STB.CVE_SUB_TIP_CNBV                         ' +
      'ORDER BY STC.CVE_SUB_TIP_CNBV , STB.CVE_SUB_TIP_BCO                 ';}
end;


procedure TReportCrStB.RepTemplateBeforePrint(Sender: TQuickRep; var PrintReport: Boolean);
begin {ASIGNACION DE VALORES EN EL REPORTE}
  QRInterEncabezado1.Apli := InterFrame.Apli;
end;



end.
