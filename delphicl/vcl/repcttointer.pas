unit RepCttoInter;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm, UnGene,
  UnSql2, InterMemo;

type
  TRepCttoInternet = class(TQuickRep)
    DetailBand1: TQRBand;
    lbFecha: TQRLabel;
    qContrato: TQuery;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    subCttoAsoc: TQRSubDetail;
    GroupHeaderBand1: TQRBand;
    QRLabel21: TQRLabel;
    QRDBText3: TQRDBText;
    qContratoAsoc: TQuery;
    dsContrato: TDataSource;
    QRDBText4: TQRDBText;
    SummaryBand1: TQRBand;
    qrlabel: TQRLabel;
    QRLabel34: TQRLabel;
    qContratoAsocIdContratoAsoc: TStringField;
    qContratoAsocID_CONTRATO: TFloatField;
    qContratoAsocID_CTO_ASOC: TFloatField;
    qContratoAsocCVE_MONEDA: TFloatField;
    qContratoAsocCVE_PRODUCTO: TStringField;
    qContratoAsocCVE_TIP_CONTRATO: TStringField;
    qContratoAsocDESC_MONEDA: TStringField;
    qContratoAsocDESC_PRODUCTO: TStringField;
    qContratoAsocDESC_TIPO_CONTRA: TStringField;
    qContratoAsocF_ALTA: TDateTimeField;
    qContratoAsocID_EMPRESA: TFloatField;
    qContratoAsocNOMB_EMPRESA: TStringField;
    qContratoAsocNOMBRE_TITULAR: TStringField;
    qContratoAsocSIT_CONTRATO: TStringField;
    qContratoID_CONTRATO: TFloatField;
    qContratoID_TITULAR: TFloatField;
    qContratoID_DOMICILIO: TFloatField;
    qContratoCODIGO_POSTAL: TStringField;
    qContratoCALLE_NUMERO: TStringField;
    qContratoCOLONIA: TStringField;
    qContratoDESC_CIUDAD: TStringField;
    qContratoDESC_ESTADO: TStringField;
    qContratoDESC_PAIS: TStringField;
    QRDBText5: TQRDBText;
    qContratoAsocTipoContrato: TStringField;
    QRShape9: TQRShape;
    lbNombre: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    lbUsuario: TQRLabel;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRImage5: TQRImage;
    QRLabel33: TQRLabel;
    QRLabel28: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure RepCttoInternetBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qContratoAsocCalcFields(DataSet: TDataSet);
  private
    FReQuery: Boolean;
  Protected
    Procedure SetReQuery(Open: Boolean);
  public
    InterFrame: TInterFrame;
    Property ReQuery: Boolean Read FReQuery Write SetReQuery;
  end;

var
  RepCttoInternet: TRepCttoInternet;

Procedure Execute_RepCttoInt(Padre: TInterFrame; Preview: Boolean);

implementation

{$R *.DFM}

Procedure Execute_RepCttoInt(Padre: TInterFrame; Preview: Boolean);
Var
  Rep: TRepCttoInternet;
begin
  Rep:= TRepCttoInternet.Create(nil);
  Try
    Rep.InterFrame := Padre;
    Rep.Requery := False;
    Rep.qContrato.DatabaseName := Rep.InterFrame.SeguDataBaseName;
    Rep.qContrato.SessionName := Rep.InterFrame.SeguSessionName;
    Rep.qContratoAsoc.DatabaseName := Rep.InterFrame.DataBaseName;
    Rep.qContratoAsoc.SessionName := Rep.InterFrame.SessionName;
    Rep.Requery := True;
    if Preview then
       Rep.Preview
    else
       Rep.Print;
  Finally
    if Rep<>nil then
       Rep.Free;
  end;
end;

Procedure TRepCttoInternet.SetReQuery(Open: Boolean);
begin
  FRequery := Open;
  if Open then begin
     qContrato.ParamByName('ID_CONTRATO').asString := InterFrame.FieldByName('ID_CONTRATO').asString;
     qContrato.Open;
     qContratoAsoc.Open;
  end
  else begin
     qContratoAsoc.Close;
     qContrato.Close;
  end;
end;

procedure TRepCttoInternet.DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  lbFecha.Caption := FmtFecha(Now,'@D de @MMMM de @YYYY');
  lbnombre.Caption := InterFrame.FieldByName('NOMBRE').asString;
  lbUsuario.Caption := InterFrame.FieldByName('CVE_USUARIO').asString;
  //lbPassword.Caption := InterFrame.FieldByName('CVE_USUARIO').asString;
end;

procedure TRepCttoInternet.RepCttoInternetBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
Var
  Q: TQuery;
  Servicios: String;
begin
  {SEVICIOS DEL CONTRATO}
  Q := GetSqlQuery('SELECT Cve_Servicio FROM net_serv_usr '+
                   'WHERE Id_Contrato = ' + InterFrame.FieldByName('ID_CONTRATO').asString,
                   InterFrame.DataBaseName, InterFrame.SessionName, True);
  Servicios:= '';
  if(Q <> nil)and(Q.FindFirst)then
     repeat
       if Trim(Servicios) = '' then
          Servicios:= Q.FieldByName('CVE_SERVICIO').asString
       else
          Servicios:= Servicios + ', ' + Q.FieldByName('CVE_SERVICIO').asString;
     until not Q.FindNext;
  {SEVICIOS DE MONITOR BURSATIL}
  {SEVICIOS DE PORTAFOLIO DE INVERSIONES}
  if(Pos('EDOS', Servicios) = 0) then
     qContratoAsoc.Close;
  {SEVICIOS DE CAPTURA DE ORDENES DE CAPITALES}
end;

procedure TRepCttoInternet.qContratoAsocCalcFields(DataSet: TDataSet);
begin
  if qContratoAsoc.FieldByName('ID_CTO_ASOC').asString <> '' then begin
     qContratoAsoc.FieldByName('IdContratoAsoc').asString := qContratoAsoc.FieldByName('ID_CTO_ASOC').asString;
     qContratoAsoc.FieldByName('TipoContrato').asString := qContratoAsoc.FieldByName('NOMB_EMPRESA').asString;
  end;
end;

end.
