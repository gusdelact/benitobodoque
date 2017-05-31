unit RepProd2;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, IntFrm,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, Wwquery,
  IntHead;

type
  TReporteProd2 = class(TQuickRep)
    qGeneral: TwwQuery;
    qContratante: TwwQuery;
    qRequisito: TwwQuery;
    qDocumento: TwwQuery;
    qDocCtto: TwwQuery;
    DetailBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel22: TQRLabel;
    edIdEmpresa: TQRDBText;
    QRDBText4: TQRDBText;
    edCveProducto: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText12: TQRDBText;
    lbDescPerJuridica: TQRLabel;
    lbDescSituacion: TQRLabel;
    subContratante: TQRSubDetail;
    GroupHeaderBand1: TQRBand;
    QRLabel6: TQRLabel;
    subRequisito: TQRSubDetail;
    subDocumento: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    subDocCtto: TQRSubDetail;
    GroupHeaderBand2: TQRBand;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    dsGeneral: TDataSource;
    dsContratante: TDataSource;
    qContratanteCVE_CONTRATANTE: TStringField;
    qContratanteDESC_CONTRATANTE: TStringField;
    qContratanteCVE_PRODUCTO: TStringField;
    qContratanteID_EMPRESA: TFloatField;
    qGeneralCVE_PRODUCTO: TStringField;
    qGeneralDESC_PRODUCTO: TStringField;
    qGeneralID_EMPRESA: TFloatField;
    qGeneralNOM_RAZON_SOCIAL: TStringField;
    qGeneralCVE_PER_JUR_PROD: TStringField;
    qGeneralSIT_PRODUCTO: TStringField;
    qGeneralCVE_MONEDA: TFloatField;
    qGeneralDESC_MONEDA: TStringField;
    qGeneralCVE_TIP_CONTRATO: TStringField;
    qGeneralDESC_TIPO_CONTRA: TStringField;
    qRequisitoCVE_REQUISITO: TStringField;
    qRequisitoDESC_REQUISITO: TStringField;
    dsRequisito: TDataSource;
    qRequisitoID_EMPRESA: TFloatField;
    PageHeaderBand1: TQRBand;
    QRMacvHeader1: TQRMacvHeader;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  	FDataBaseName: String;
   FSessionName: String;
  	Procedure SetDataBaseName(DataBase: String);
	Procedure SetSessionName(Session: String);
  public
  	Property DataBaseName:String Read FDataBaseName Write SetDataBaseName;
  	Property SessionName:String Read FSessionName Write SetSessionName;
  end;

Procedure Execute_RepProd2(ShowPreview:Boolean; Padre:TInterFrame; Cve_Producto:String);

implementation

{$R *.DFM}

Procedure Execute_RepProd2(ShowPreview:Boolean; Padre:TInterFrame; Cve_Producto:String);
var Reporte: TReporteProd2;
begin
	Reporte := TReporteProd2.Create(Padre);
   Try
		Reporte.DataBaseName := Padre.DataBaseName;
      Reporte.SessionName := Padre.SessionName;

      Reporte.qGeneral.ParamByName('P_CVE_PRODUCTO').asString := Cve_Producto;
      Reporte.qGeneral.Open;
      Reporte.qContratante.Open;
      Reporte.qRequisito.Open;
      Reporte.qDocumento.Open;
      Reporte.qDocCtto.Open;
      Reporte.QRMacvHeader1.Apli := Padre.Apli;

      If ShowPreview then
      	Reporte.Preview
      else
      	Reporte.Print;
   finally
   	Reporte.Free;
   end;
end;

Procedure TReporteProd2.SetDataBaseName(DataBase: String);
begin
	qGeneral.DatabaseName    := DataBase;
   qContratante.DatabaseName:= DataBase;
   qRequisito.DatabaseName  := DataBase;
	qDocumento.DatabaseName  := DataBase;
   qDocCtto.DatabaseName    := DataBase;
end;

Procedure TReporteProd2.SetSessionName(Session: String);
begin
	qGeneral.SessionName    := Session;
   qContratante.SessionName:= Session;
   qRequisito.SessionName  := Session;
	qDocumento.SessionName  := Session;
   qDocCtto.SessionName    := Session;
end;

procedure TReporteProd2.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
	if qGeneral.FieldByName('CVE_PER_JUR_PROD').asString = 'PF' then
   	lbDescPerJuridica.Caption := 'PERSONA FISICA'
   else if qGeneral.FieldByName('CVE_PER_JUR_PROD').asString = 'PM' then
   	lbDescPerJuridica.Caption := 'PERSONA MORAL'
   else lbDescPerJuridica.Caption := '';

   if qGeneral.FieldByName('SIT_PRODUCTO').asString = 'AC' then
   	lbDescsituacion.Caption := 'ACTIVO'
   else if qGeneral.FieldByName('SIT_PRODUCTO').asString = 'IN' then
   	lbDescsituacion.Caption := 'INACTIVO'
   else if qGeneral.FieldByName('SIT_PRODUCTO').asString = 'BL' then
   	lbDescsituacion.Caption := 'BLOQUEADO'
   else lbDescsituacion.Caption := '';
end;



end.
