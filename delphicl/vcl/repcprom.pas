unit RepCProm;

interface
               
uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, Db, DBTables,
  InterApl, unsql2, IntFrm, QRExport;

type
  TReporteCProm = class(TQuickRep)
	 PageHeaderBand1: TQRBand;
	 Query1: TQuery;
    Detalle: TQRBand;
	 QRDBText2: TQRDBText;
	 QRDBText3: TQRDBText;
    headerEntidad: TQRGroup;
	 FooterPromotor: TQRBand;
	 ChildBand1: TQRChildBand;
	 QRLabel2: TQRLabel;
	 QRLabel3: TQRLabel;
	 QRShape1: TQRShape;
    HeaderPromotor: TQRGroup;
	 QRLabel5: TQRLabel;
	 FooterEntidad: TQRBand;
	 QRLabel6: TQRLabel;
	 QRExpr1: TQRExpr;
	 QRDBText5: TQRDBText;
	 QRDBText6: TQRDBText;
	 QRInterEncabezado1: TQRInterEncabezado;
    QRExcelFilter1: TQRExcelFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRTextFilter1: TQRTextFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRRTFFilter1: TQRRTFFilter;
    Query1ID_FOL_CAMBIO: TFloatField;
    Query1CVE_APLICACION: TStringField;
    Query1CVE_GPO_MOTIVO: TStringField;
    Query1CVE_MOTIVO: TStringField;
    Query1ID_CONTRATO: TFloatField;
    Query1ID_PROMOTOR_ANT: TFloatField;
    Query1ID_PROMOTOR_NVO: TFloatField;
    Query1F_REGISTRO: TDateTimeField;
    Query1CVE_USU_REGISTRO: TStringField;
    Query1ID_EMPRESA: TFloatField;
    Query1ID_ENTIDAD: TFloatField;
    Query1SIT_CONTRATO: TStringField;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    Query1NOMBRE: TStringField;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    Query1NOM_EMPRESA: TStringField;
    Query1SUCURSAL: TStringField;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel4: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    Query1NOM_PROM_ANTERIOR: TStringField;
    Query1NOM_PROM_ACTUAL: TStringField;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRShape2: TQRShape;
    Query1DESC_MOTIVO: TStringField;
    QRLabel13: TQRLabel;
    QRDBText16: TQRDBText;
    Query1USUARIO_CAPTURA: TStringField;
    QRLabel14: TQRLabel;
    QRDBText15: TQRDBText;
	 procedure ReporteCtesBeforePrint(Sender: TCustomQuickRep;
		var PrintReport: Boolean);
  private
	FInterFrame: TInterFrame;
  protected
  public
	 Procedure PreparaQuery(FramePadre: TInterFrame;
                                empresa :String;
                                promAnterior:Integer;
                                promNuevo:Integer;
                                estatus:String;
                                fechaIni:String;
                                fechaFin:String;
                                idContrato : String;
                                cveTipoCtto : String);
	 Property InterFrame: TInterFrame Read FInterFrame Write FInterFrame;
  end;

  procedure ExecuteRepCProm(Frame: TInterFrame; Preview: Boolean;
                            empresa :String;
                            promAnterior:Integer;
                            promNuevo:Integer;
                            estatus:String;
                            fechaIni:String;
                            fechaFin:String;
                            idContrato : String;
                            cveTipoCtto : String);

var
  ReporteCProm: TReporteCProm;

implementation

Uses IntRepCProm;

{$R *.DFM}


procedure ExecuteRepCProm(Frame: TInterFrame; Preview: Boolean;
                          empresa :String;
                          promAnterior:Integer;
                          promNuevo:Integer;
                          estatus:String;
                          fechaIni:String;
                          fechaFin:String;
                          idContrato : String;
                          cveTipoCtto : String);
var Reporte: TReporteCProm;
begin
	Reporte:= TReporteCProm.Create(nil);
	Try
		Reporte.Query1.Close;
		Reporte.InterFrame:= Frame;
		Reporte.QRInterEncabezado1.Apli := Frame.Apli;
		Reporte.PreparaQuery(Frame,
                                     empresa,
                                     promAnterior,
                                     promNuevo,
                                     estatus,
                                     fechaIni,
                                     fechaFin,
                                     idContrato,
                                     cveTipoCtto);
		If Preview Then Reporte.Preview
		else Reporte.Print;
	Finally
		Reporte.Free;
	end;
end;

Procedure TReporteCProm.PreparaQuery(FramePadre: TInterFrame;
                                     empresa :String;
                                     promAnterior:Integer;
                                     promNuevo:Integer;
                                     estatus:String;
                                     fechaIni:String;
                                     fechaFin:String;
                                     idContrato:String;
                                     cveTipoCtto : String);
Var
   Sql: String;
Begin
   Query1.DatabaseName := InterFrame.Apli.DataBaseName;
   Query1.SessionName  := InterFrame.Apli.SessionName;

   Sql:= ' select a.id_fol_cambio,    a.cve_aplicacion,  a.cve_gpo_motivo,  a.cve_motivo, ' +
         '        a.id_contrato,      a.id_promotor_ant, a.id_promotor_nvo, a.f_registro, ' +
         '        a.cve_usu_registro, b.id_empresa,      b.id_entidad,      b.sit_contrato, ' +
         '        c.nombre, empresa.nombre as nom_empresa, sucursal.desc_entidad as sucursal, ' +
         '        promotor_ant.nombre as nom_prom_anterior, ' +
         '        promotor_nvo.nombre as nom_prom_actual, mot.desc_motivo ' +
         '        , percaptura.nombre as usuario_captura ' +
         '   from contrato_campro a ' +
         '    join contrato b ' +
         '                 on b.id_contrato = a.id_contrato ' +
         '    join persona c ' +
         '                 on c.id_persona = b.id_titular ' +
         '    join persona promotor_ant ' +
         '                 on promotor_ant.id_persona = a.id_promotor_ant ' +
         '    join persona promotor_nvo ' +
         '                 on promotor_nvo.id_persona = a.id_promotor_nvo ' +
         '    join persona empresa ' +
         '                 on empresa.id_persona = b.id_empresa ' +
         '    left outer join unidad_negocio sucursal ' +
         '                 on sucursal.id_entidad = b.id_entidad ' +
         '    left outer join motivo mot on mot.cve_aplicacion = a.cve_aplicacion ' +
         '                              and mot.cve_gpo_motivo = a.cve_gpo_motivo ' +
         '                              and mot.cve_motivo     = a.cve_motivo ' +
         '    join usuario usrcaptura ' +
         '                 on usrcaptura.cve_usuario = a.cve_usu_registro ' +
         '    join persona percaptura ' +
         '                 on percaptura.id_persona = usrcaptura.id_persona ' +
         '   Where 1 = 1 ';

   if (empresa <> '') then
      Sql := Sql + ' AND b.id_empresa = ' + quotedstr(empresa);
   if (idContrato <> '') then
      Sql := Sql + ' AND b.id_contrato = ' + quotedstr(idContrato);
   if (cveTipoCtto <> '') then
      Sql := Sql + ' AND b.cve_tip_contrato = ' + quotedstr(cveTipoCtto);
   if (promAnterior <> 0) then
      Sql := Sql + ' AND a.id_promotor_ant = ' + IntTOStr(promAnterior);
   if (promNuevo <> 0) then
      Sql := Sql + ' AND a.id_promotor_nvo = ' + IntTOStr(promNuevo);
   if (estatus <> '') then
      Sql := Sql + ' AND b.sit_contrato = ' + quotedstr(estatus);
   if (fechaIni <> '') then
      Sql := Sql + ' AND a.f_registro >= ' + ' TO_DATE(''' + fechaIni + ''',''DD/MM/YYYY'') ' ;
   if (fechaFin <> '') then
      Sql := Sql + ' AND a.f_registro <= ' + ' TO_DATE(''' + fechaFin + ''',''DD/MM/YYYY'') ' ;

   Sql := Sql + ' ORDER BY a.id_fol_cambio ';
   Query1.SQL.Clear;
   Query1.Sql.Text:= Sql;
   Query1.Open;
end;

procedure TReporteCProm.ReporteCtesBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   {TITULO DEL REPORTE}
   QRInterEncabezado1.Titulo2:= '['+ 'REPORTE DE CAMBIOS DE PROMOTORES' + ']';
end;

end.
