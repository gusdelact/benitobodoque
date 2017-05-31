unit RepPuest;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, IntFrm, InterApl;

type
  TReportePuest = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    Query1: TQuery;
    QRInterEncabezado1: TQRInterEncabezado;
    lbDescPuesto: TQRLabel;
    procedure ReportePuestBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ReportePuestNeedData(Sender: TObject; var MoreData: Boolean);
  private

  public

  end;

var
  ReportePuest: TReportePuest;

  Procedure Execute_RepPuest(ShowPreview:Boolean; Padre:TInterFrame);

implementation

{$R *.DFM}

Procedure Execute_RepPuest(ShowPreview:Boolean; Padre:TInterFrame);
var Rep: TReportePuest;
begin Rep:=TReportePuest.Create(nil);
      Try
         Rep.Query1.Close;
         Rep.Query1.DataBaseName:=Padre.DataBaseName;
         Rep.Query1.SessionName:=Padre.SessionName;
         Rep.Query1.Open;
         Rep.QRInterEncabezado1.Apli := Padre.Apli;
         if ShowPreview then
            begin Rep.Preview;
            end
         else Rep.Print;
      Finally
             Rep.Free;
      end;
end;

procedure TReportePuest.ReportePuestBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
	Query1.Close;
	Query1.Open;
end;

procedure TReportePuest.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
	lbDescPuesto.Caption := Query1.FieldByName('DESC_PUESTO').asString;
//   Query1.Next;
end;

procedure TReportePuest.ReportePuestNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
//	MoreData:= (Not Query1.EOF);
end;

end.
