unit RepProd;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, Db, DBTables,
  intfrm, dialogs, IntCtoHeader, UnSql2;

type
  TReporteProd = class(TQuickRep)
    qGeneral: TQuery;
    dsGeneral: TDataSource;
    qDocCtto: TQuery;
    qConTit: TQuery;
    qConCtte: TQuery;
    qCtte: TQuery;
    PageHeaderBand1: TQRBand;
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
    GroupHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    sdDocContrato: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    GroupHeaderBand2: TQRBand;
    QRLabel2: TQRLabel;
    sdContratante: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    sbConceptoTit: TQRSubDetail;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    sdConceptoCtte: TQRSubDetail;
    sdPersonalidad: TQRSubDetail;
    sdNacionalidad: TQRSubDetail;
    sdRequisitos: TQRSubDetail;
    sdDocumento: TQRSubDetail;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    qPersonalidad: TQuery;
    qPersonalidadCVE_PER_JURIDICA: TStringField;
    qPersonalidadDESC_PER_JURIDICA: TStringField;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    qNacionalidad: TQuery;
    qNacionalidadCVE_TIP_NACIONAL: TStringField;
    qNacionalidadDESC_TIP_NACIONAL: TStringField;
    qNacionalidadNACIONALIDAD: TStringField;
    qRequisito: TQuery;
    qDocumento: TQuery;
    QRDBText8: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
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
    qDocCttoCVE_PRODUCTO: TStringField;
    qDocCttoCVE_DOCUMENTO: TStringField;
    qDocCttoDESC_DOCUMENTO: TStringField;
    qCtteCVE_CONTRATANTE: TStringField;
    qCtteDESC_CONTRATANTE: TStringField;
    qConTitCVE_CONCEP_CTTE: TStringField;
    qConTitDESC_CONCEPTO: TStringField;
    qConCtteCVE_CONCEPTO_CO: TStringField;
    qConCtteDESC_CONCEPTO: TStringField;
    qDocumentoCVE_DOCUMENTO: TStringField;
    qDocumentoDESC_DOCUMENTO: TStringField;
    qRequisitoCVE_REQUISITO: TStringField;
    qRequisitoDESC_REQUISITO: TStringField;
    qConCtteCVE_CONCEP_CTTE: TStringField;
    lbConcepto: TQRLabel;
    lbDescConcepto: TQRLabel;
    lbCveConcepCtte: TQRLabel;
    QRMacvHeader1: TQRMacvHeader;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure sdContratanteAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure sdConceptoCtteAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure sdPersonalidadAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure sbConceptoTitAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure sdRequisitosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ReporteProInfo2BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure sdContratanteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
		FRequery: Boolean;
      FInterFrame: TInterFrame;
{      lConcepto: TStringList;
      lPerJuridica: TStringList;
      lNacionalidad: TStringList;
      procedure PreparaListas;
      procedure ValidaPersonalidad(Per: String);
      Function ObtenDato(Datos: String): String;}
  protected
  		procedure SetRequery(Open: Boolean);
  public
  		Requisitos: String;
      procedure PreparaProductos;
      property Requery: Boolean read FRequery Write SetRequery;
      property InterFrame: TInterFrame read FInterFrame write FInterFrame;
  end;

var
  ReporteProInfo2: TReporteProd;


procedure Execute_RepProd(Padre: TInterFrame; Preview: Boolean);

implementation

{$R *.DFM}


(*
Function TReporteProd.ObtenDato(Datos: String): String;
var Temp: string;
	 Posicion: Integer;
    Continua: Boolean;
begin
	Result := '';
   Posicion := 0;
   Continua:= True;
   while Continua do
   begin
   	Posicion := Pos('''',Datos);
      if posicion = 0 then Continua := False
      else
      begin
         Datos[Posicion] := '@';
         Temp := copy(Datos,Posicion + 1, 2);
         if Result = '' Then Result := '''' + Temp + ''''
         else Result := Result + ', ''' + Temp + ''''
         Datos[Pos('''',Datos)] := '@';
      end;
   end;
end;


procedure ValidaPersonalidad(Per: String);
begin


end;

procedure TReporteProd.PreparaListas;
begin
	If lConcepto <> nil Then lConcepto.Clear else lConcepto:= TStringList.Create;
   If lPerJuridica <> nil Then lPerJuridica.Clear else lPerJuridica:= TStringList.Create;
   If lNacionalidad <> nil Then lNacionalidad.Clear else lNacionalidad:= TStringList.Create;

   lconcepto.Add('T014');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T013');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
   lconcepto.Add('T015');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T016');		lPerJuridica.Add('PM');		lNacionalidad.Add('ME');
   lconcepto.Add('T016');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T016');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
   lconcepto.Add('T017');		lPerJuridica.Add('PM');		lNacionalidad.Add('EX');
   lconcepto.Add('T017');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
   lconcepto.Add('T017');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
end;
*)


procedure TReporteProd.PreparaProductos;
begin
	qGeneral.SQL.Text :=
         ' select distinct'+
         '  Prod.cve_Producto,'+
         '  Prod.Desc_Producto,'+
         '  Tabla.Id_empresa,'+
         '  Nvl (Tabla.Nom_Razon_Social,''NO TIENE EMPRESA ASIGNADA'') Nom_Razon_Social,'+
         '  Prod.Cve_Per_Jur_Prod,'+
         '  Prod.Sit_Producto,'+
         '  Mon.Cve_Moneda,'+
         '  Nvl (Mon.Desc_Moneda,''NO TIENE MONEDA ASIGNADA'') Desc_Moneda,'+
         '  TCon.Cve_Tip_Contrato,'+
         '  Nvl(TCon.Desc_Tipo_Contra,''NO TIENE TIPO ASIGNADO'') Desc_Tipo_Contra'+
         ' from'+
         '  Producto         Prod,'+
         '  Moneda           Mon,'+
         '  Tipo_Contrato    TCon,'+
         '  (select'+
         '     prod_aut_empresa.cve_producto,'+
         '     prod_aut_empresa.id_empresa,'+
         '     persona_moral.nom_razon_social'+
         '   from'+
         '     persona_moral,'+
         '     prod_aut_empresa'+
         '   where'+
         '     prod_aut_empresa.id_empresa = persona_moral.id_persona(+)'+
         '     and sit_prod_aut = ''AC'')   Tabla'+
         ' Where'+
         '  Prod.Sit_producto     = ''AC'''+
         '  and Mon.Cve_Moneda (+) = Prod.Cve_Moneda'+
         '  and TCon.Cve_Tip_Contrato (+) = Prod.Cve_Tip_Contrato'+
         '  and Tabla.cve_producto (+) = Prod.cve_producto';

   if Trim(InterFrame.FieldByName('CVE_PRODUCTO').asString) <> '' Then
      begin qGeneral.SQL.Text := qGeneral.SQL.Text + ' and prod.Cve_Producto = '''+ InterFrame.FieldByName('CVE_PRODUCTO').asString + '''';
      end;

   if Trim(InterFrame.FieldByName('ID_EMPRESA').asString) <> '' Then
      begin qGeneral.SQL.Text := qGeneral.SQL.Text + ' and Tabla.Id_empresa = '+ InterFrame.FieldByName('ID_EMPRESA').asString;
      end;


   qGeneral.SQL.Text := qGeneral.SQL.Text + ' Order by Prod.Desc_Producto';
end;


procedure Execute_RepProd(Padre: TInterFrame; Preview: Boolean);
Var	Rep: TReporteProd;
begin
	Rep:= TReporteProd.create(nil);
   Try
      Rep.InterFrame := Padre;

   	Rep.PreparaProductos;
      Rep.InterFrame:= Padre;

      Rep.Requery := False;
      Rep.qDocumento.DataBaseName := Padre.DataBaseName;
      Rep.qDocumento.SessionName := Padre.SessionName;
      Rep.qRequisito.DataBaseName := Padre.DataBaseName;
      Rep.qRequisito.SessionName := Padre.SessionName;
      Rep.qNacionalidad.DataBaseName := Padre.DataBaseName;
      Rep.qNacionalidad.SessionName := Padre.SessionName;
      Rep.qPersonalidad.DataBaseName := Padre.DataBaseName;
      Rep.qPersonalidad.SessionName := Padre.SessionName;
      Rep.qCtte.DataBaseName := Padre.DataBaseName;
      Rep.qCtte.SessionName := Padre.SessionName;
      Rep.qConCtte.DataBaseName := Padre.DataBaseName;
      Rep.qConCtte.SessionName := Padre.SessionName;
      Rep.qConTit.DataBaseName := Padre.DataBaseName;
      Rep.qConTit.SessionName := Padre.SessionName;
      Rep.qDocCtto.DataBaseName := Padre.DataBaseName;
      Rep.qDocCtto.SessionName := Padre.SessionName;
      Rep.qGeneral.DataBaseName := Padre.DataBaseName;
      Rep.qGeneral.SessionName := Padre.SessionName;
      Rep.Requery := True;

      if Preview Then Rep.Preview
      else Rep.Print;

      Rep.Requery := False;
   finally
   	Rep.Free;
   end;
end;

procedure TReporteProd.SetRequery(Open: Boolean);
begin
	if Open Then
      begin
      	qGeneral.Open;
         qDocCtto.Open;
         qCtte.Open;
         //qConTit.Open;
         //qConCtte.Open;
      end
   else
		begin
			qDocumento.Close;
      	qRequisito.Close;
      	qNacionalidad.Close;
      	qPersonalidad.Close;
      	qCtte.Close;
      	qConCtte.Close;
      	qConTit.Close;
      	qDocCtto.Close;
      	qGeneral.Close;
      end;
end;


procedure TReporteProd.DetailBand1BeforePrint(Sender: TQRCustomBand;
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

procedure TReporteProd.sdContratanteAfterPrint(Sender: TQRCustomBand;              {CONCEPTO TITULAR Y REQUISITOS}
  BandPrinted: Boolean);
begin
{	qConTit.Close;
   qConTit.SQL.Clear;
   qConTit.SQL.Text :=
      ' Select distinct'+
      '  Req_Prod_ctte.Cve_Concep_ctte,'+
      '  Concepto_Ctte.Desc_Concepto'+
      ' From'+
      '  Req_Prod_ctte,'+
      '  Concepto_Ctte'+
      ' Where Req_prod_ctte.id_empresa = '+ qGeneral.FieldByName('ID_EMPRESA').asString +
      '    and Req_prod_ctte.Cve_producto = ''' + qGeneral.FieldByName('CVE_PRODUCTO').asString + '''' +
      '    and Req_prod_ctte.Cve_Contratante = '''+ qCtte.FieldByName('CVE_CONTRATANTE').asString + '''' +
      '    and Req_Prod_ctte.Cve_Concep_Ctte = 	Concepto_Ctte.Cve_Concep_Ctte';

	if Trim(InterFrame.FieldByName('CVE_CONCEP_CTTE').asString) <> '' Then
   	qConTit.SQL.Text := qConTit.SQL.Text + '  and Req_Prod_Ctte.Cve_Concep_Ctte = '''+ InterFrame.FieldByName('CVE_CONCEP_CTTE').asString +'''';
   qConTit.Open;}

   qRequisito.Close;
   qRequisito.ParamByName('ID_EMPRESA').asString := qGeneral.FieldByName('ID_EMPRESA').asString;
   qRequisito.ParamByName('CVE_PRODUCTO').asString := qGeneral.FieldByName('CVE_PRODUCTO').asString;
   qRequisito.ParamByName('CVE_CONTRATANTE').asString := qCtte.FieldByName('CVE_CONTRATANTE').asString;
   qRequisito.ParamByName('CVE_CONCEP_CTTE').asString := qConTit.FieldByName('CVE_CONCEP_CTTE').asString;
   qRequisito.Open;

   Requisitos:= '';
   qRequisito.First;
   While Not qRequisito.EOF do
   begin
   	if Requisitos='' Then Requisitos := '''' + qRequisito.FieldByName('CVE_REQUISITO').asString + ''''
      else Requisitos := Requisitos + ', ''' + qRequisito.FieldByName('CVE_REQUISITO').asString + '''';
      qRequisito.Next;
   end;
   qRequisito.First;
end;


procedure TReporteProd.sbConceptoTitAfterPrint(Sender: TQRCustomBand;				{CONCEPTO CTTE}
  BandPrinted: Boolean);
var s: String;
begin
	S := '';
   if qCtte.FieldByName('CVE_CONTRATANTE').asString <> 'C011' Then
      S := '  and Doc_comp_req.Cve_concepto_co <> ''A004'''
   else
   	S := '  and Doc_comp_req.Cve_concepto_co <> ''A001''';

   if qCtte.FieldByName('CVE_CONTRATANTE').asString <> 'C005' Then
      S := S + '  and Doc_comp_req.Cve_concepto_co <> ''A005''';

   if (qConTit.FieldByName('CVE_CONCEP_CTTE').asString = 'T020')  and (qCtte.FieldByName('CVE_CONTRATANTE').asString = 'C001') Then
   	S := S + '  and Doc_comp_req.Cve_concepto_co <> ''A001''';

   if (qConTit.FieldByName('CVE_CONCEP_CTTE').asString = 'T010') and (qCtte.FieldByName('CVE_CONTRATANTE').asString = 'C001') Then
   	S := S + '  and Doc_comp_req.Cve_concepto_co = ''A001''';



	qConCtte.Close;
   qConCtte.SQL.Text :=
      ' select distinct'+
      '   doc_comp_req.cve_concepto_co,'+
      '   concepto_ctte.Cve_Concep_Ctte,'+
      '   concepto_ctte.desc_concepto'+
      ' from'+
      '  concepto_ctte,'+
      '  doc_comp_req'+
      ' where'+
      ' 	doc_comp_req.id_empresa = '+ qGeneral.FieldByName('ID_EMPRESA').asString +
      '   and doc_comp_req.cve_concepto_ti = '''+ qConTit.FieldByName('CVE_CONCEP_CTTE').asString + '''' +
      '	and doc_comp_req.cve_concepto_co = concepto_ctte.cve_concep_ctte ' + S;

   {qConCtte.ParamByName('ID_EMPRESA').asString := qGeneral.FieldByName('ID_EMPRESA').asString;
   qConCtte.ParamByName('CVE_CONCEPTO_TI').asString := qConTit.FieldByName('CVE_CONCEP_CTTE').asString;}
   qConCtte.Open;

   if qConCtte.IsEmpty Then
   begin
      qConCtte.Close;
      qConCtte.SQL.Text :=
         ' select distinct'+
         '   doc_comp_req.cve_concepto_co,'+
         '   concepto_ctte.Cve_Concep_Ctte,'+
         '   concepto_ctte.desc_concepto'+
         ' from'+
         '  concepto_ctte,'+
         '  doc_comp_req'+
         ' where'+
         ' 	doc_comp_req.id_empresa = '+ qGeneral.FieldByName('ID_EMPRESA').asString +
         '   and doc_comp_req.cve_concepto_ti = ''T001''' +
         '	and doc_comp_req.cve_concepto_co = concepto_ctte.cve_concep_ctte '+ S;
      qConCtte.Open;
   end;

{	CvePerJuridica := DocCompReq_Campo(InterFrame.Apli,'CVE_PER_JURIDICA',
   						qGeneral.FieldByName('ID_EMPRESA').asInteger,
                     qRequisito.Fi			eldByName('CVE_REQUISITO').asString,
                     '', '',
                     qConCtte.FieldByName('CVE_CONCEP_CTTE').asString,
                     qConTit.FieldByName('CVE_CONCEP_CTTE').asString);

   if Trim(CvePerJuridica) = '' Then CvePerJuridica := '''''';

	qPersonalidad.SQL.text :=
         ' select Cve_Per_Juridica, Desc_Per_Juridica from'+
         '   (		select ''PF'' as Cve_Per_Juridica, ''PERSONA FISICA'' as Desc_Per_Juridica from dual'+
         '   union select ''PM'' as Cve_Per_Juridica, ''PERSONA MORAL'' as Desc_Per_Juridica from dual)'+
         ' where cve_per_juridica in('+ CvePerJuridica +')';
   qPersonalidad.Open;}

end;


procedure TReporteProd.sdConceptoCtteAfterPrint(Sender: TQRCustomBand;				{PERSONALIDAD}
  BandPrinted: Boolean);
Var	CvePerJuridica: String;
begin
	CvePerJuridica := DocCompReq_Campo(InterFrame.Apli,'CVE_PER_JURIDICA',
   						qGeneral.FieldByName('ID_EMPRESA').asInteger,
                     Requisitos, //qRequisito.FieldByName('CVE_REQUISITO').asString,
                     '', '',
                     qConCtte.FieldByName('CVE_CONCEP_CTTE').asString,
                     qConTit.FieldByName('CVE_CONCEP_CTTE').asString,
                     qGeneral.FieldByName('CVE_PRODUCTO').asString,qCtte.FieldByName('CVE_CONTRATANTE').asString);


   if Trim(CvePerJuridica) = '' Then CvePerJuridica := '''''';

	qPersonalidad.SQL.text :=
         ' select Cve_Per_Juridica, Desc_Per_Juridica from'+
         '   (		select ''PF'' as Cve_Per_Juridica, ''PERSONA FISICA'' as Desc_Per_Juridica from dual'+
         '   union select ''PM'' as Cve_Per_Juridica, ''PERSONA MORAL'' as Desc_Per_Juridica from dual)'+
         ' where cve_per_juridica in('+ CvePerJuridica +')';
   qPersonalidad.Open;
end;


procedure TReporteProd.sdPersonalidadAfterPrint(Sender: TQRCustomBand;					{NACIONALIDAD}
  BandPrinted: Boolean);
	Var	CveTipNacional: String;
begin
	CveTipNacional := DocCompReq_Campo(InterFrame.Apli,'CVE_TIP_NACIONAL',
   						qGeneral.FieldByName('ID_EMPRESA').asInteger,
                     Requisitos, //qRequisito.FieldByName('CVE_REQUISITO').asString,
                     qPersonalidad.fieldbyname('CVE_PER_JURIDICA').asString,
                     '',
                     qConCtte.FieldByName('CVE_CONCEP_CTTE').asString,
                     qConTit.FieldByName('CVE_CONCEP_CTTE').asString,
                     qGeneral.FieldByName('CVE_PRODUCTO').asString,qCtte.FieldByName('CVE_CONTRATANTE').asString);

   if Trim(CveTipNacional) = '' Then CveTipNacional := '''''';

	qNacionalidad.SQL.text :=
         ' select Nacionalidad, Cve_Tip_Nacional, Desc_Tip_Nacional from'+
         '   (		select    ''OTRA'' as Nacionalidad, ''EX'' as Cve_Tip_Nacional, ''EXTRANJERO'' as Desc_Tip_Nacional from dual'+
         '   union select ''PAMEXI'' as Nacionalidad, ''ME'' as Cve_Tip_Nacional,   ''MEXICANO'' as Desc_Tip_Nacional from dual)'+
         ' where cve_tip_nacional in ('+ CveTipNacional +')';
   qNacionalidad.Open;
end;

procedure TReporteProd.sdRequisitosBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var Doc: String;
begin
	Doc := DocCompReq_Campo(InterFrame.Apli,'CVE_DOCUMENTO',
   						qGeneral.FieldByName('ID_EMPRESA').asInteger,
                     ''''+ qRequisito.FieldByName('CVE_REQUISITO').asString +'''',
                     qPersonalidad.fieldbyname('CVE_PER_JURIDICA').asString,
                     qNacionalidad.FieldByName('NACIONALIDAD').asString,
                     qConCtte.FieldByName('CVE_CONCEP_CTTE').asString,
                     qConTit.FieldByName('CVE_CONCEP_CTTE').asString,
                     '','');

	if Trim(Doc) = '' Then Doc := '''''';

	qDocumento.SQL.text :=
			' Select Cve_Documento, Desc_Documento'+
			' From Documento'+
         ' Where Cve_Documento in('+ Doc +')'+
         ' Order by Cve_Documento';
   qDocumento.Open;

   PrintBand := Not QDocumento.IsEmpty;
end;

procedure TReporteProd.ReporteProInfo2BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
	QRMacvHeader1.Apli := InterFrame.Apli;
   if Trim(Interframe.FieldByName('DESC_CONCEPTO').asString) <> '' Then
   begin
   	lbConcepto.Enabled := True;
      lbCveConcepCtte.Enabled := True;
      lbDescConcepto.Enabled := True;
      lbCveConcepCtte.Caption := Interframe.FieldByName('CVE_CONCEP_CTTE').asString;
      lbDescConcepto.Caption := Interframe.FieldByName('DESC_CONCEPTO').asString;
   end
   else
   begin
   	lbConcepto.Enabled := False;
      lbCveConcepCtte.Enabled := False;
      lbDescConcepto.Enabled := False;
   end;
end;


procedure TReporteProd.sdContratanteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var Num: Integer;
begin
	qConTit.Close;
   qConTit.SQL.Clear;
   qConTit.SQL.Text :=
      ' Select distinct'+
      '  Req_Prod_ctte.Cve_Concep_ctte,'+
      '  Concepto_Ctte.Desc_Concepto'+
      ' From'+
      '  Req_Prod_ctte,'+
      '  Concepto_Ctte'+
      ' Where Req_prod_ctte.id_empresa = '+ qGeneral.FieldByName('ID_EMPRESA').asString +
      '    and Req_prod_ctte.Cve_producto = ''' + qGeneral.FieldByName('CVE_PRODUCTO').asString + '''' +
      '    and Req_prod_ctte.Cve_Contratante = '''+ qCtte.FieldByName('CVE_CONTRATANTE').asString + '''' +
      '    and Req_Prod_ctte.Cve_Concep_Ctte = 	Concepto_Ctte.Cve_Concep_Ctte';

	if Trim(InterFrame.FieldByName('CVE_CONCEP_CTTE').asString) <> '' Then
   	qConTit.SQL.Text := qConTit.SQL.Text + '  and Req_Prod_Ctte.Cve_Concep_Ctte = '''+ InterFrame.FieldByName('CVE_CONCEP_CTTE').asString +'''';
   qConTit.Open;

   if qConTit.RecordCount <= 0 Then PrintBand := False;

{   GetSQLInt(
      ' select count(*) from req_prod_ctte where id_empresa = '+ qGeneral.FieldByName('ID_EMPRESA').asString +
      ' and cve_producto = ''' + qGeneral.FieldByName('CVE_PRODUCTO').asString + '''' +
      ' and cve_concep_ctte = '''+ qCtte.FieldByName('CVE_CONTRATANTE').asString + '''' +
      ' and cve_contratante = '''+ qCtte.FieldByName('CVE_CONTRATANTE').asString + '''' +
   	InterFrame.DataBaseName,InterFrame.SessionName,'NUM',Num,False);}
end;





end.
