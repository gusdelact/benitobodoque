unit RepCtto;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, IntFrm,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, Wwquery,
	Dialogs, IntHead, UnSql2;
type
  TReporteCtto = class(TQuickRep)
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRSubDetail2: TQRSubDetail;
    QRSubDetail3: TQRSubDetail;
    GroupHeaderBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRShape3: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText21: TQRDBText;
    GroupHeaderBand2: TQRBand;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRSubDetail4: TQRSubDetail;
    GroupHeaderBand3: TQRBand;
    QRLabel9: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRSubDetail5: TQRSubDetail;
    QRDBText26: TQRDBText;
    QRSubDetail6: TQRSubDetail;
    QRDBText27: TQRDBText;
    QRSubDetail7: TQRSubDetail;
    QRSubDetail8: TQRSubDetail;
    GroupHeaderBand4: TQRBand;
    GroupHeaderBand5: TQRBand;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    lblCorrespondencia: TQRLabel;
    lblTipoCuenta: TQRLabel;
    lblSegmento: TQRLabel;
    lblSitContrato: TQRLabel;
    lblSitDocumentos: TQRLabel;
    qReqCtte: TwwQuery;
    qReqCtteDESC_REQUISITO: TStringField;
    qReqCtteCVE_REQUISITO: TStringField;
    qContratante: TwwQuery;
    qContratanteID_PERSONA: TFloatField;
    qContratanteNOMBRE: TStringField;
    qContratanteDESC_CONTRATANTE: TStringField;
    qContratanteID_CONTRATO: TFloatField;
    qContratanteCVE_CONTRATANTE: TStringField;
    qDocPresCtte: TwwQuery;
    qDocPresCtteID_CONTRATO: TFloatField;
    qDocPresCtteID_PERSONA: TFloatField;
    qDocPresCtteCVE_CONTRATANTE: TStringField;
    qDocPresCtteCVE_DOCUMENTO: TStringField;
    qDocPresCtteCVE_REQUISITO: TStringField;
    qDocPresCtteF_PROX_REV_DOC: TDateTimeField;
    qDocPresCtteF_ULT_REV_DOC: TDateTimeField;
    qDocPresCtteDESC_DOCUMENTO: TStringField;
    qDocPresCtteDESC_REQUISITO: TStringField;
    qDocum: TwwQuery;
    qDocumDESC_DOCUMENTO: TStringField;
    qDocumCVE_DOCUMENTO: TStringField;
    qContrato: TwwQuery;
    qContratoID_PERSONA: TFloatField;
    qContratoNOMBRE: TStringField;
    qContratoCVE_TIP_CONTRATO: TStringField;
    qContratoDESC_TIPO_CONTRA: TStringField;
    qContratoCVE_PRODUCTO: TStringField;
    qContratoDESC_PRODUCTO: TStringField;
    qContratoCVE_MONEDA: TFloatField;
    qContratoDESC_MONEDA: TStringField;
    qContratoID_PERSONA_1: TFloatField;
    qContratoNOMBRE_1: TStringField;
    qContratoDESC_GPO_CONTRAT: TStringField;
    qContratoDESC_ENTIDAD: TStringField;
    qContratoDESC_SEGMENTO: TStringField;
    qContratoID_CTO_LIQ: TFloatField;
    qContratoID_CONTRATO: TFloatField;
    qContratoCODIGO_POSTAL: TStringField;
    qContratoNOMBRE_2: TStringField;
    qContratoID_EMPRESA: TFloatField;
    qContratoF_ALTA: TDateTimeField;
    qContratoCVE_CORRESP: TStringField;
    qContratoCVE_TIPO_CTA: TStringField;
    qContratoB_ASIG_SEG_AUT: TStringField;
    qContratoSIT_DOCUMENTOS: TStringField;
    qContratoF_BAJA: TDateTimeField;
    qContratoSIT_CONTRATO: TStringField;
    qDocCtto: TwwQuery;
    qDocCttoFalta: TwwQuery;
    PageHeaderBand1: TQRBand;
    qContratoCVE_CONCEP_CTO: TStringField;
    qContratanteCVE_CONCEP_CTTE: TStringField;
    qDocCttoID_CONTRATO: TFloatField;
    qDocCttoCVE_DOCUMENTO: TStringField;
    qDocCttoDESC_DOCUMENTO: TStringField;
    qDocCttoFaltaCVE_DOCUMENTO: TStringField;
    qDocCttoFaltaDESC_DOCUMENTO: TStringField;
    qContratanteCVE_NACIONALIDAD: TStringField;
    qContratanteCVE_PER_JURIDICA: TStringField;
    QRLabel1: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRLabel2: TQRLabel;
    qContratoDESC_CONCEPTO: TStringField;
    qContratanteDESC_CONCEPTO: TStringField;
    QRMacvHeader1: TQRMacvHeader;
    QRDBText32: TQRDBText;
    qContratoCALLE_NUMERO: TStringField;
    qContratoCOLONIA: TStringField;
    qContratoDESC_POBLACION: TStringField;
    qContratoDESC_POBLACION_1: TStringField;
    qContratoDESC_POBLACION_2: TStringField;
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetail2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetail4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetail5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
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

Procedure Execute_RepCtto(ShowPreview:Boolean; Padre:TInterFrame; Id_Contrato:Integer);

implementation

{$R *.DFM}

Procedure Execute_RepCtto(ShowPreview:Boolean; Padre:TInterFrame; Id_Contrato:Integer);
var
	Reporte: TReporteCtto;
begin
	Reporte:=TReporteCtto.Create(Padre);
   Try
   	Reporte.DataBaseName:= Padre.DataBaseName;
      Reporte.SessionName := Padre.SessionName;

		Reporte.qContrato.Close;
      Reporte.qContrato.ParamByName('P_ID_CONTRATO').AsInteger := Id_Contrato;
      Reporte.qContrato.Open;

      Reporte.qContratante.Close;
      Reporte.qContratante.ParamByName('P_ID_CONTRATO').AsInteger := Id_Contrato;
      Reporte.qContratante.Open;

      Reporte.qDocCtto.Close;
      Reporte.qDocCtto.ParamByName('P_ID_CONTRATO').AsInteger := Id_Contrato;
      Reporte.qDocCtto.Open;

      Reporte.qDocCttoFalta.Close;
      Reporte.qDocCttoFalta.ParamByName('P_ID_CONTRATO').asInteger := Reporte.qContrato.fieldByName('ID_CONTRATO').asInteger;
      Reporte.qDocCttoFalta.ParamByName('P_ID_EMPRESA').asInteger  := Reporte.qContrato.fieldByName('ID_EMPRESA').asInteger;
      Reporte.qDocCttoFalta.ParamByName('P_CVE_PRODUCTO').asString := Reporte.qContrato.fieldByName('CVE_PRODUCTO').asString;
      Reporte.qDocCttoFalta.Open;

      Reporte.QRMacvHeader1.Titulo1 := 'INFORMACION DEL CONTRATO '+ IntToStr(Id_Contrato);
      Reporte.QRMacvHeader1.Apli := Padre.Apli;

      if ShowPreview then
         begin Reporte.Preview;
         end
      else Reporte.Print;
   Finally
   	Reporte.Free;
   end;
end;

procedure TReporteCtto.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  { form1.qReqCtte.Close;
   form1.qReqCtte.Params[0].AsString  := form1.qContratoCVE_PRODUCTO.AsString;
   form1.qReqCtte.Params[1].AsString  := form1.qContratanteCVE_CONTRATANTE.AsString;
   form1.qReqCtte.Params[2].AsInteger := form1.qContratoID_EMPRESA.AsInteger;
   form1.qReqCtte.Params[3].AsInteger := form1.qContratoID_CONTRATO.AsInteger;
   form1.qReqCtte.Params[4].AsInteger := form1.qContratanteID_PERSONA.AsInteger;
   form1.qReqCtte.Open;}
end;

procedure TReporteCtto.SetDataBaseName(DataBase: String);
Begin
	FDataBaseName := DataBase;
	qContrato.DatabaseName 		:= DataBase;
	qContratante.DatabaseName 	:= DataBase;
	qReqCtte.DatabaseName 		:= DataBase;
   qDocPresCtte.DatabaseName 	:= DataBase;
   qDocum.DatabaseName 			:= DataBase;
   qDocCtto.DatabaseName 		:= DataBase;
   qDocCttoFalta.DatabaseName	:= DataBase;
end;

procedure TReporteCtto.SetSessionName(Session: String);
Begin
	FSessionName := Session;
	qContrato.SessionName 		:= Session;
	qContratante.SessionName 	:= Session;
	qReqCtte.SessionName			:= Session;
   qDocPresCtte.SessionName 	:= Session;
   qDocum.SessionName 			:= Session;
   qDocCtto.SessionName 		:= Session;
   qDocCttoFalta.SessionName	:= Session;
end;


procedure TReporteCtto.QRSubDetail2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   qDocPresCtte.Close;
   qDocPresCtte.ParamByName('P_ID_CONTRATO').asInteger := qContrato.FieldByName('ID_CONTRATO').AsInteger;
   qDocPresCtte.ParamByName('P_ID_PERSONA').AsInteger := qContratante.FieldByName('ID_PERSONA').AsInteger;
   qDocPresCtte.Open;
end;

procedure TReporteCtto.QRSubDetail4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   qReqCtte.Close;
   qReqCtte.ParamByName('P_CVE_PRODUCTO').AsString  := qContrato.FieldByName('CVE_PRODUCTO').AsString;
   qReqCtte.ParamByName('P_CVE_CONTRATANTE').AsString  := qContratante.FieldByName('CVE_CONTRATANTE').AsString;
   qReqCtte.ParamByName('P_ID_EMPRESA').AsInteger := qContrato.FieldByName('ID_EMPRESA').AsInteger;
   qReqCtte.ParamByName('P_ID_CONTRATO').AsInteger := qContrato.FieldByName('ID_CONTRATO').AsInteger;
   qReqCtte.ParamByName('P_ID_PERSONA').AsInteger := qContratante.FieldByName('ID_PERSONA').AsInteger;
   qReqCtte.ParamByName('P_CVE_CONCEP_CTTE').AsString := qContrato.FieldByName('CVE_CONCEP_CTO').AsString;
   qReqCtte.Open;
end;


procedure TReporteCtto.QRSubDetail5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var 	q: TQuery;
		Cont: Integer;
		CveNacionalidad: String;
		DocCompReq: String;
begin
	qDocum.Close;
	{qDocum.ParamByName('P_ID_EMPRESA').AsInteger := qContrato.FieldByName('ID_EMPRESA').AsInteger;
	qDocum.ParamByName('P_CVE_REQUISITO').AsString  := qReqCtte.FieldByName('CVE_REQUISITO').AsString;}

			if qContratante.FieldByName('CVE_NACIONALIDAD').AsString = 'PAMEXI' Then CveNacionalidad := 'ME'
			else CveNacionalidad := 'EX';

			Q := GetSqlQuery(
				' select'+
				'    Doc_Comp_Req.cve_documento'+
				' from'+
				'    Doc_Comp_Req,'+
				'    Documento'+
				' where '+
				'    Doc_Comp_Req.id_empresa = '+ qContrato.FieldByName('ID_EMPRESA').AsString +
				'    and Doc_Comp_Req.Cve_Requisito = '''+ qReqCtte.FieldByName('CVE_REQUISITO').asString +''''+
				'    and Doc_Comp_Req.Cve_Documento = Documento.Cve_Documento'+
				'    and Doc_Comp_Req.Cve_Concepto_Ti = ''' + qContrato.FieldByName('CVE_CONCEP_CTO').AsString + '''' +
				'    and Doc_Comp_Req.Cve_Per_Juridica = ''' + qContratante.FieldByName('CVE_PER_JURIDICA').AsString + '''' +
				'    and Doc_Comp_Req.Cve_Tip_Nacional = ''' + CveNacionalidad + '''' +
				'    and Doc_Comp_Req.Cve_Concepto_Co  = ''' + qContratante.FieldByName('CVE_CONCEP_CTTE').AsString + '''' +
				'    and ( Documento.F_Vigencia >= to_date('''+ FormatDateTime('dd/mm/yyyy',Now) + ''', ''dd/mm/yyyy'')'+
				'     	  or Documento.F_Vigencia is null)',
				DataBaseName, SessionName, False);
		  Try

			If Q = nil then
			begin
				Q := GetSqlQuery(
					' select'+
					'    Doc_Comp_Req.cve_documento'+
					' from'+
					'    Doc_Comp_Req,'+
					'    Documento'+
					' where '+
					'    Doc_Comp_Req.id_empresa = '+ qContrato.FieldByName('ID_EMPRESA').AsString +
					'    and Doc_Comp_Req.Cve_Requisito = '''+ qReqCtte.FieldByName('CVE_REQUISITO').asString +''''+
					'    and Doc_Comp_Req.Cve_Documento = Documento.Cve_Documento'+
					'    and Doc_Comp_Req.Cve_Concepto_Ti = ''T001''' +
					'    and Doc_Comp_Req.Cve_Per_Juridica = ''' + qContratante.FieldByName('CVE_PER_JURIDICA').AsString + '''' +
					'    and Doc_Comp_Req.Cve_Tip_Nacional = ''' + CveNacionalidad + '''' +
					'    and Doc_Comp_Req.Cve_Concepto_Co  = ''' + qContratante.FieldByName('CVE_CONCEP_CTTE').AsString + '''' +
					'    and ( Documento.F_Vigencia >= to_date('''+ FormatDateTime('dd/mm/yyyy',Now) + ''', ''dd/mm/yyyy'')'+
					'     	  or Documento.F_Vigencia is null)',
					DataBaseName, SessionName, False);
			end;

			DocCompReq := '';
			If Q <> nil then
			begin
				Q.First;
				For Cont := 1 to q.RecordCount do
				begin
					If Cont = 1 then DocCompReq := '''' + q.FieldByName('CVE_DOCUMENTO').asString + ''''
					else DocCompReq := DocCompReq + ',''' + q.FieldByName('CVE_DOCUMENTO').asString + '''';
					Q.Next;
				end;
			end;

		 Finally  if Q<>nil then Q.Free;
		 end;

	if DocCompReq <> '' then
	begin
		qDocum.SQL.Text := 'Select Desc_Documento, Cve_Documento From Documento Where Cve_Documento in('+ DocCompReq +')';
		qDocum.Open;
	end;
end;

procedure TReporteCtto.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
												//	CORRESPONDENCIA
	if qContrato.fieldByName('CVE_CORRESP').asString = 'RT' then
   	lblCorrespondencia.Caption := 'RETENER';
   if qContrato.fieldByName('CVE_CORRESP').asString = 'CR' then
   	lblCorrespondencia.Caption := 'CORREO';
	if qContrato.fieldByName('CVE_CORRESP').asString = 'DH' then
	   lblCorrespondencia.Caption := 'DHL';
   if qContrato.fieldByName('CVE_CORRESP').asString = 'FX' then
   	lblCorrespondencia.Caption := 'FEDERAL EXPRESS';
   if qContrato.fieldByName('CVE_CORRESP').asString = 'LQ' then
   	lblCorrespondencia.Caption := 'LIQUIDACION';
   if qContrato.fieldByName('CVE_CORRESP').asString = 'RB' then
   	lblCorrespondencia.Caption := 'RET. DE BANCO';
   if qContrato.fieldByName('CVE_CORRESP').asString = 'RP' then
   	lblCorrespondencia.Caption := 'RET. DE CTAS. PROPIAS';
   if qContrato.fieldByName('CVE_CORRESP').asString = 'RC' then
   	lblCorrespondencia.Caption := 'RET. DE CTES. MENSAJEROS';
   {end if}

												//	TIPO CUENTA
	if qContrato.fieldByName('CVE_TIPO_CTA').asString = 'AD' then
      lblTipoCuenta.Caption := 'ADMINISTRATIVO';
   if qContrato.fieldByName('CVE_TIPO_CTA').asString = 'EM' then
   	lblTipoCuenta.Caption := 'EMPLEADO';
	if qContrato.fieldByName('CVE_TIPO_CTA').asString = 'NO' then
	   lblTipoCuenta.Caption := 'NORMAL';
   {end if}

												//	SEGMENTO AUTOMATICO
	if qContrato.fieldByName('B_ASIG_SEG_AUT').asString = 'V' then
      lblSegmento.Caption := 'SI';
   if qContrato.fieldByName('B_ASIG_SEG_AUT').asString = 'F' then
   	lblSegmento.Caption := 'NO';
   {end if}

												// SITUACION DE CONTRATO
	if qContrato.fieldByName('SIT_CONTRATO').asString = 'AC' then
   	lblSitContrato.Caption := 'ACTIVO';
	if qContrato.fieldByName('SIT_CONTRATO').asString = 'IN' then
   	lblSitContrato.Caption := 'INACTIVO';
	if qContrato.fieldByName('SIT_CONTRATO').asString = 'CA' then
   	lblSitContrato.Caption := 'CANCELADO';
   {end if}

												// SITUACION DE DOCUMENTOS
	if qContrato.fieldByName('SIT_DOCUMENTOS').asString = 'CO' then
   	lblSitDocumentos.Caption := 'COMPLETOS';
   if qContrato.fieldByName('SIT_DOCUMENTOS').asString = 'IN' then
   	lblSitDocumentos.Caption := 'INCOMPLETOS';
   {end if}
end;






end.


