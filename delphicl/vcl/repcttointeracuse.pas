unit RepCttoInterAcuse;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm, UnGene,
  UnSql2, InterMemo;

type
  TRepCttoInternetAcuse = class(TQuickRep)
    DetailBand1: TQRBand;
    lbFecha: TQRLabel;
    qContrato: TQuery;
    lbNombre: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    lbCiudadEstado: TQRLabel;
    lbPaisCodigoPostal: TQRLabel;
    subCttoAsoc: TQRSubDetail;
    GroupHeaderBand1: TQRBand;
    qContratoAsoc: TQuery;
    SummaryBand1: TQRBand;
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
    qContratoAsocTipoContrato: TStringField;
    QRShape6: TQRShape;
    QRLabel9: TQRLabel;
    dsContrato: TDataSource;
    QRInterMemo1: TQRInterMemo;
    QRLabel6: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    lbNombre1: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape5: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape7: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel7: TQRLabel;
    QRImage4: TQRImage;
    QRShape8: TQRShape;
    QRLabel16: TQRLabel;
    QRShape1: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel17: TQRLabel;
    QRImage5: TQRImage;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
		var PrintBand: Boolean);
	 procedure RepCttoInternetAcuseBeforePrint(Sender: TCustomQuickRep;
		var PrintReport: Boolean);
	 procedure qContratoAsocCalcFields(DataSet: TDataSet);
    procedure QuickRepAfterPrint(Sender: TObject);
  private
		FReQuery: Boolean;
  Protected
		Procedure SetReQuery(Open: Boolean);
  public
		InterFrame: TInterFrame;
		Property ReQuery: Boolean Read FReQuery Write SetReQuery;
  end;

var
  RepCttoInternetAcuse: TRepCttoInternetAcuse;

Procedure Execute_RepCttoIntAcuse(Padre: TInterFrame; Preview: Boolean);

implementation

{$R *.DFM}

Procedure Execute_RepCttoIntAcuse(Padre: TInterFrame; Preview: Boolean);
Var	Rep: TRepCttoInternetAcuse;
begin
	Rep:= TRepCttoInternetAcuse.Create(nil);
	Try
		Rep.InterFrame := Padre;
		Rep.Requery := False;
		Rep.qContrato.DatabaseName := Rep.InterFrame.SeguDataBaseName;
		Rep.qContrato.SessionName := Rep.InterFrame.SeguSessionName;
		Rep.qContratoAsoc.DatabaseName := Rep.InterFrame.DataBaseName;
		Rep.qContratoAsoc.SessionName := Rep.InterFrame.SessionName;
		Rep.Requery := True;

		If Preview Then Rep.Preview
		else Rep.Print;
	Finally
		If Rep<>nil then Rep.Free;
	end;

end;


Procedure TRepCttoInternetAcuse.SetReQuery(Open: Boolean);
Begin
	FRequery := Open;

	If Open Then
		Begin
			qContrato.ParamByName('ID_CONTRATO').asString := InterFrame.FieldByName('ID_CONTRATO').asString;
			qContrato.Open;
			qContratoAsoc.Open;
		end
	else
		Begin
			qContratoAsoc.Close;
			qContrato.Close;
		end;
end;

procedure TRepCttoInternetAcuse.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
	lbFecha.Caption := FmtFecha(Now,'@D de @MMMM de @YYYY');
	lbnombre.Caption := InterFrame.FieldByName('NOMBRE').asString;
	lbnombre1.Caption := InterFrame.FieldByName('NOMBRE').asString;        
	lbCiudadEstado.Caption := qContrato.FieldByName('DESC_CIUDAD').asString + ', ' + qContrato.FieldByName('DESC_ESTADO').asString;
	lbPaisCodigoPostal.Caption := qContrato.FieldByName('DESC_PAIS').asString + ' ' + qContrato.FieldByName('CODIGO_POSTAL').asString;
end;

procedure TRepCttoInternetAcuse.RepCttoInternetAcuseBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
Var
	Q: TQuery;
	Servicios: String;
        R : Tquery;
        SQL: string;
begin
{        SQL:=' SELECT CVE_PRODUCTO '
            +' FROM NET_CTO_ASOC '
            +' WHERE '
            +'     ID_CONTRATO       = ' + InterFrame.FieldByName('ID_CONTRATO').asString
            +' AND CVE_PRODUCTO      = ''T001'' '
            +' AND CVE_TIP_CONTRATO  = ''CIBC'' ';
        R := GetSqlQuery(SQL,InterFrame.DataBaseName,InterFrame.SessionName,True);
        if R<>nil then
           begin
            try
              QRImage3.Height := 0;
              QRShape1.Height := 0;
              QRLabel6.Caption := ' ';
              QRLabel10.Caption := ' ';
              QRLabel17.Caption := ' ';
            Finally
              R.Free;
            end;
        end;
        if R=nil then
           begin }
              QRLabel6.Caption := 'SU DIRECCIÓN DE CORREO ELECTRÓNICO';
              QRLabel10.Caption := '(Para enviarle la confirmación de la habilitación';
              QRLabel17.Caption := 'de sus claves)';
{              R.Free;
        end; }

//	lbUsuario.Caption := InterFrame.FieldByName('CVE_USUARIO').asString;
//	lbPassword.Caption := InterFrame.FieldByName('PASSWORD').asString;

										{SEVICIOS DEL CONTRATO}
	Q:= GetSqlQuery(
		' SELECT Cve_Servicio FROM net_serv_usr'+
		' WHERE Id_Contrato = ' + InterFrame.FieldByName('ID_CONTRATO').asString,
		InterFrame.DataBaseName, InterFrame.SessionName, True);

	Servicios:= '';
  if(Q <> nil)and(Q.FindFirst)then
  	While Not Q.EOF do
	  Begin
		  If Trim(Servicios) = '' Then Servicios:= Q.FieldByName('CVE_SERVICIO').asString
  		else Servicios:= Servicios + ', ' + Q.FieldByName('CVE_SERVICIO').asString;
	  	Q.Next;
  	end;

										{SEVICIOS DE PORTAFOLIO DE INVERSIONES}
	if (Pos('EDOS', Servicios) = 0) Then qContratoAsoc.Close;
end;

procedure TRepCttoInternetAcuse.qContratoAsocCalcFields(DataSet: TDataSet);
begin
     If qContratoAsoc.FieldByName('ID_CTO_ASOC').asString <> '' Then
       begin
	qContratoAsoc.FieldByName('IdContratoAsoc').asString :=
		IntToStr(StrToInt(Copy(qContratoAsoc.FieldByName('ID_CTO_ASOC').asString,3,9)));
	qContratoAsoc.FieldByName('TipoContrato').asString :=
		qContratoAsoc.FieldByName('DESC_TIPO_CONTRA').asString + '   .' + qContratoAsoc.FieldByName('NOMB_EMPRESA').asString;
     end;
end;

procedure TRepCttoInternetAcuse.QuickRepAfterPrint(Sender: TObject);
begin
  qContrato.Close;
  qContratoAsoc.Close;
end;

end.
