unit IntMQrFaEle;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, unSQL2,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead,InterApl,
  IntQRPreview, Dialogs, IntGenCre;

type
  TQrFaEle = class(TQuickRep)
    QRBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRBandDetalle: TQRBand;
    QRDBFHOPER: TQRDBText;
    QRBNombre: TQRBand;
    QRExpr61: TQRExpr;
    QRExpr62: TQRExpr;
    QRExpr63: TQRExpr;
    QRExpr64: TQRExpr;
    QRExpr65: TQRExpr;
    QRExpr66: TQRExpr;
    QRExpr67: TQRExpr;
    QRExpr68: TQRExpr;
    QRExpr69: TQRExpr;
    QRExpr70: TQRExpr;
    QRExpr71: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBEMI: TQRDBText;
    QRDBNOM_EMI: TQRDBText;
    QRFooterEmisor: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr6: TQRExpr;
    qyFacEle: TQuery;
    qyFacEleEMISOR: TFloatField;
    qyFacEleNOM_EMISOR: TStringField;
    qyFacElePROVEEDOR: TFloatField;
    qyFacEleNOM_PROVEEDOR: TStringField;
    qyFacEleFOL_ACUSE: TStringField;
    qyFacEleID_DOCUMENTO: TStringField;
    qyFacEleRFC_PYME: TStringField;
    qyFacEleNOMBRE_PYME: TStringField;
    qyFacEleF_EMISION_DOC: TDateTimeField;
    qyFacEleF_EFEC_DESCTO: TDateTimeField;
    qyFacEleF_VENCIMIENTO_DO: TDateTimeField;
    qyFacEleIMP_DOCUMENTO: TFloatField;
    qyFacEleCVE_MONEDA: TStringField;
    qyFacEleSIT_DOCUMENTO: TStringField;
    qyFacEleF_ALTA: TDateTimeField;
    qyFacEleCVE_USU_ALTA: TStringField;
    qyFacEleF_MODIFICA: TDateTimeField;
    qyFacEleCVE_USU_MODIFICA: TStringField;
    qyFacEleFOL_ACUSE_OPER: TStringField;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRGroupEmisor: TQRGroup;
    QRGroupProv: TQRGroup;
    QRShape13: TQRShape;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    QRShape14: TQRShape;
    QRDBPROV: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRFooterProv: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr1: TQRExpr;
    qyFacEleDESC_SITUACION: TStringField;
    QRDBText1: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBRFC: TQRDBText;
    procedure QRBandDetalleBeforePrint(Sender: TQRCustomBand;   var PrintBand: Boolean);
    procedure QRFooterDiaBeforePrint(Sender: TQRCustomBand;    var PrintBand: Boolean);

  private


  public
    function FormaQuery(sF_VntoIni, sF_VntoFin, sF_DsctoIni, sF_DsctoFin,
                        sCVE_MONEDA, sID_EMISOR, sID_PROVEEDOR, sUSU_NETCTO, sDOCUMENTO,
                        sFOL_ACUSE, sFOL_OPER, sIdEmpresa, sIDSucursal : String):String;




  end;

var
  QrFaEle: TQrFaEle;
  bGenArch: Boolean;
  sArchivo:String;
  Tiporep : String;
  titrep : String;
  agrupa : String;
  vlstod, vlsng,
  vlsxd, vlsor,
  vlsca, vlscs,
  vlsba, vlsvs : String;
  vgFechaHoy : TDateTime;
  F: TextFile;
  Apli : TInterApli;
  Query1 : TQuery;
  vRes    : String;    // JASM 20160331

  procedure RepFacEle(  sF_VntoIni, sF_VntoFin, sF_DsctoIni, sF_DsctoFin, sCVE_MONEDA,
                        sID_EMISOR, sID_PROVEEDOR, sUSU_NETCTO, sDOCUMENTO, sFOL_ACUSE, sFOL_OPER, sIdEmpresa, sIDSucursal,
                        SNbrArch : String;
                        tiprep   : String;
                        agrup    : String;
                        vltod, vlng, vlxd,
                        vlor, vlca,vlcs,
                        vlba, vlvs : String;
                        pPreview : Boolean;
                        pApli    : TInterApli);


implementation

{$R *.DFM}

procedure RepFacEle(  sF_VntoIni, sF_VntoFin, sF_DsctoIni, sF_DsctoFin, sCVE_MONEDA,
                      sID_EMISOR, sID_PROVEEDOR, sUSU_NETCTO, sDOCUMENTO, sFOL_ACUSE, sFOL_OPER, sIdEmpresa, sIDSucursal,
                      SNbrArch : String;
                      tiprep   : String;
                      agrup    : String;                      
                      vltod, vlng, vlxd,
                      vlor, vlca,vlcs,
                      vlba, vlvs : String;
                      pPreview : Boolean;
                      pApli    : TInterApli);

var
    QrFaEle   : TQrFaEle;
    VLTitulo  : String;
    Preview   : TIntQRPreview;
begin
    VLTitulo := '';
    QrFaEle:= TQrFaEle.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrFaEle);
    Apli := pApli;
      Try
        vgFechaHoy  := pAPli.DameFechaEmpresa;
        bGenArch    := False;
        sArchivo    := sNbrArch;
        Tiporep     := tiprep;
        agrupa      := agrup;
        vlstod      := vltod;
        vlsng       := vlng;
        vlsxd       := vlxd;
        vlsor       := vlor;
        vlsca       := vlca;
        vlscs       := vlcs;
        vlsba       := vlba;
        vlsvs       := vlvs;


        QrFaEle.QRInterEncabezado1.Apli := pApli;

        QrFaEle.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrFaEle.QRInterEncabezado1.NomReporte:='IntMQrFaEle';

        if (Trim(sF_VntoIni)= '') and (Trim(sF_DsctoIni) = '') and (Trim(sCVE_MONEDA) = '')and
           (Trim(sID_EMISOR)= '') and (Trim(sID_PROVEEDOR) = '') and (Trim(sDOCUMENTO) = '') and
           (Trim(sFOL_ACUSE)= '') and (Trim(sUSU_NETCTO) = '') then
        QrFaEle.QRInterEncabezado1.Titulo1:= 'Reporte de Factoraje (Sin Filtros)'
        else
        QrFaEle.QRInterEncabezado1.Titulo1:= 'Reporte de Documentos de Factoraje';



          If (Trim(sF_VntoIni)<>'') and (Trim(sF_DsctoIni)= '') Then
          begin
              VLTitulo := VLTitulo + ' Por rango de Fechas Prog. Pago del '+sF_VntoIni+' al '+sF_VntoFin ;
          end
          else If (Trim(sF_DsctoIni)<>'') and (Trim(sF_VntoIni)= '') Then
          begin
              VLTitulo := VLTitulo + ' Por rango de Fechas de Publicación '+sF_DsctoIni+' al '+sF_DsctoFin;
          end
          else If (Trim(sF_VntoIni)<>'') and (Trim(sF_DsctoIni)<>'') Then
              VLTitulo := VLTitulo + ' Fechas Prog. Pago del '+sF_VntoIni+' al '+sF_VntoFin+' y Fechas de Publicación del '+sF_DsctoIni+' al '+sF_DsctoFin;


        If (Trim(sCVE_MONEDA)<>'') Then
            VLTitulo := VLTitulo + ' Por Moneda';

        If (Trim(sID_EMISOR)<>'') Then
            VLTitulo := VLTitulo + ' Por Emisor';

        If (Trim(sID_PROVEEDOR)<>'') Then
            VLTitulo := VLTitulo + ' Por Proveedor';

        If (Trim(sUSU_NETCTO)<>'') Then
            VLTitulo := VLTitulo + ' Por Usuario';

        If (Trim(sDOCUMENTO)<>'') Then
            VLTitulo := VLTitulo + ' Por Documento';

        If (Trim(sFOL_ACUSE)<>'') Then
            VLTitulo := VLTitulo + ' Por Folio Acuse';

        If (Trim(sFOL_OPER)<>'') Then
            VLTitulo := VLTitulo + ' Por Folio Oper';

        if tiporep = 'FHD' then
        VLTitulo := VLTitulo + ' < Ordenado x Fecha de Publicación > ';

        if tiporep = 'FHV' then
        VLTitulo := VLTitulo + ' < Ordenado x Fecha Prog. Pago > ';

        if tiporep = 'SIT' then
        VLTitulo := VLTitulo + ' < Ordenado x Situación > ';

        if tiporep = 'DOC' then
        VLTitulo := VLTitulo + ' < Ordenado x Documento > ';



        QrFaEle.QRInterEncabezado1.Titulo2 := VLTitulo;
        QrFaEle.qyFacEle.DatabaseName := pApli.DataBaseName;
        QrFaEle.qyFacEle.SessionName  := pApli.SessionName;

        QrFaEle.qyFacEle.Active:=False;

        QrFaEle.qyFacEle.SQL.Text:= QrFaEle.FormaQuery(sF_VntoIni, sF_VntoFin, sF_DsctoIni, sF_DsctoFin, sCVE_MONEDA,
                                                       sID_EMISOR, sID_PROVEEDOR, sUSU_NETCTO, sDOCUMENTO, sFOL_ACUSE, sFOL_OPER, sIdEmpresa, sIDSucursal);

        QrFaEle.qyFacEle.SQL.SaveToFile('c:\RepFacEle.txt');
        if vRes <> '0' then                                     // JASM 20160331
        begin
           vRes := '0';
           Exit;
        end;
        QrFaEle.qyFacEle.Active:=True;


         if agrupa = 'PRO' then  // agrupa por PROVEEDOR - EMISOR
        begin
          QrFaEle.QRGroupEmisor.Expression := 'qyFacEle.PROVEEDOR';
          QrFaEle.QRLabel5.Caption := 'Proveedor:';
          QrFaEle.QRDBEMI.DataField := 'PROVEEDOR';
          QrFaEle.QRDBNOM_EMI.DataField  := 'NOM_PROVEEDOR';
          QrFaEle.QRGroupEmisor.FooterBand := QrFaEle.QRFooterProv;

          QrFaEle.QRGroupProv.Expression := 'qyFacEle.EMISOR';
          QrFaEle.QRLabel15.Caption := 'Emisor: ';
          QrFaEle.QRDBPROV.DataField := 'EMISOR';
          QrFaEle.QRDBText11.DataField := 'NOM_EMISOR';
          QrFaEle.QRGroupProv.FooterBand := QrFaEle.QRFooterEmisor;
        end;

        If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrFaEle.QRInterEncabezado1.Titulo1+ #09 );
         Writeln(F, QrFaEle.QRInterEncabezado1.Titulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F,'EMISOR' + #09 +
                   'NOM EMISOR' + #09 +
                   'PROVEEDOR' + #09 +
                   'NOM PROVEEDOR' + #09 +
                   'FOLIO ACUSE' + #09 +
                   'DOCUMENTO' + #09 +
                   'RFC PYME' + #09 +
                   'NOMBRE PYME' + #09 +
                   'FH FACTURA' + #09 +     //FH EMISION DOC
                   'FH PUBLICACION' + #09 + //FH_DESCTO
                   'FH PROG. PAGO' + #09 +  //FH_VENCIMIENTO
                   'IMPORTE DOC' + #09 +
                   'MONEDA' + #09 +
                   'FH/HR ALTA' + #09 +
                   'USUARIO ALTA' + #09 +
                   'FH/HR MODIFICA' + #09 +
                   'USUARIO MODIFICA' + #09 +
                   'FOLIO ACUSE OPER' + #09 +
                   'SITUACION'+ #09 +
                   'DESC SITUACION');

      End;
        If pPreview Then
            QrFaEle.Preview
        Else
            QrFaEle.Print;
     Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrFaEle.free;
      If Assigned(Preview) Then Preview.Free;
    End;
end;

function TQrFaEle.FormaQuery(sF_VntoIni, sF_VntoFin, sF_DsctoIni, sF_DsctoFin, sCVE_MONEDA,
                             sID_EMISOR, sID_PROVEEDOR, sUSU_NETCTO, sDOCUMENTO, sFOL_ACUSE, sFOL_OPER, sIdEmpresa, sIDSucursal : String):String;
Var
    sSQL : String;

begin
      vRes := '1';                                                      // JASM 20160331
      sSQL:= '  SELECT cfe.id_epo AS emisor,'+ coCRLF+
//      (select NOMBRE from persona where id_persona = cfe.ID_EPO and sit_persona = ''AC'') as NOM_EMISOR,'+ coCRLF+
             '         cast(pkgcrconsolidado.fun_nom_tit_cred(cfe.id_epo)as VARCHAR2(100)) AS nom_emisor,'+ coCRLF+ // se cambia el campo por función
//             '         rf.id_persona AS proveedor,
{             '         CASE'+ coCRLF+                                  // JASM 20160331
             '            WHEN rf.rfc IS NULL'+ coCRLF+
             '               THEN 0'+ coCRLF+
             '            ELSE (SELECT rf.id_persona'+ coCRLF+
             '                    FROM (SELECT    siglas_rfc ||''''|| f_rfc||''''|| homoclave_rfc rfc, id_persona'+ coCRLF+
             '                            FROM rfc) rf, persona pers'+ coCRLF+
             '                   WHERE rf.rfc = cfe.rfc_pyme'+ coCRLF+
             '                     AND pers.id_persona = rf.id_persona'+ coCRLF+
             '                     AND pers.sit_persona = ''AC'')'+ coCRLF+
             '         END AS proveedor,'+ coCRLF+}
             '         NVL(rf.id_persona,0) AS PROVEEDOR,'+ coCRLF +    // JASM 20160331             
             '         cfe.nombre_pyme as NOM_PROVEEDOR,'+ coCRLF+
             '         cfe.fol_acuse,'+ coCRLF+
             '         cfe.id_documento, cfe.rfc_pyme, cfe.nombre_pyme, cfe.f_emision_doc,'+ coCRLF+
             '         cfe.f_efec_descto, cfe.f_vencimiento_do, cfe.imp_documento,'+ coCRLF+
             '         cfe.cve_moneda, cfe.sit_documento, cata.NOMBRE_EDO_DOCTO as desc_situacion,'+ coCRLF+
             '         cfe.f_alta, cfe.cve_usu_alta,'+ coCRLF+
             '         cfe.f_modifica, cfe.cve_usu_modifica, cfe.fol_acuse_oper'+ coCRLF+
             '    FROM cr_fe_documento cfe, '+ coCRLF+ //(SELECT siglas_rfc ||'''' || f_rfc ||''''|| homoclave_rfc rfc,  id_persona FROM rfc) rf,'+ coCRLF+ // CAMBIO PARA EVITAR DUPLICIDAD DE ID_PERSONAS CONEL MISMO RFC JFOF 15/01/2014
             ///////////////////////// INICIO JFOF
             '         (SELECT siglas_rfc || '''' || f_rfc || '''' || homoclave_rfc rfc, ref.id_persona'+ coCRLF+
	     '	          FROM rfc ref, persona per'+ coCRLF+
	     '	         WHERE 1 = 1'+ coCRLF+
	     '	      	   AND per.id_persona = ref.id_persona'+ coCRLF+
	     '	      	   AND per.sit_persona = ''AC'') rf,'+ coCRLF+
             ///////////////////////// FIN JFOF
             '          cr_fe_cat_edo_docto cata'+ coCRLF+
//                       , persona per'+ coCRLF+
             '   WHERE 1 = 1'+ coCRLF+
//             '     AND rf.siglas_rfc ||''''|| rf.f_rfc ||''''|| rf.homoclave_rfc = cfe.rfc_pyme'+ coCRLF+
             '     AND rf.rfc (+)= cfe.rfc_pyme'+ coCRLF+
             '     AND cfe.sit_documento = cata.cve_edo_docto'+ coCRLF;
//             '     AND per.id_persona = rf.id_persona'+ coCRLF+
//             '     AND per.sit_persona = ''AC'''+ coCRLF;

      if (Trim(sF_VntoIni)<>'') and (Trim(sF_VntoFin)<>'') then
      sSQL := sSQL +
             '     AND cfe.f_vencimiento_do between '+SQLFecha(StrToDate(sF_VntoIni))+' and '+SQLFecha(StrToDate(sF_VntoFin))+ coCRLF;

      if (Trim(sF_DsctoIni)<>'') and (Trim(sF_DsctoFin)<>'') then
      sSQL := sSQL +
             '     AND cfe.f_efec_descto between '+SQLFecha(StrToDate(sF_DsctoIni))+' and '+SQLFecha(StrToDate(sF_DsctoFin))+ coCRLF;

      if Trim(sCVE_MONEDA)<>'' then
      begin
       if Trim(sCVE_MONEDA) = '484' then
       sSQL := sSQL +
             '     AND cfe.cve_moneda = 1'+ coCRLF
       else
       sSQL := sSQL +
             '     AND cfe.cve_moneda = 2'+ coCRLF
      end;

      if Trim(sID_EMISOR)<>'' then
       sSQL := sSQL +
             '     AND cfe.id_epo = '+ sID_EMISOR + coCRLF;

      if Trim(sID_PROVEEDOR)<>'' then
       sSQL := sSQL +
             '     AND rf.ID_PERSONA = '+ sID_PROVEEDOR  + coCRLF;


      if Trim(sUSU_NETCTO)<>'' then
       sSQL := sSQL +
             '     AND cfe.cve_usu_modifica = '''+ sUSU_NETCTO + ''''+ coCRLF;

      if Trim(sDOCUMENTO)<>'' then
       sSQL := sSQL +
             '     AND cfe.id_documento = '''+ sDOCUMENTO + ''''+ coCRLF;

      if Trim(sFOL_ACUSE)<>'' then
       sSQL := sSQL +
             '     AND cfe.fol_acuse = '''+ sFOL_ACUSE + ''''+ coCRLF;


      if Trim(sFOL_OPER)<>'' then
       sSQL := sSQL +
             '     AND cfe.fol_acuse_oper = '''+ sFOL_OPER + ''''+ coCRLF;


      if Trim(vlstod) = '' then
      begin
       sSQL := sSQL +
             '     AND cfe.sit_documento in ('''+vlsng+''','''+vlsxd+''','''+vlsor+''','''+vlsca+''','''+vlscs+''','''+vlsba+''','''+vlsvs+''')'+ coCRLF;
      end;


    if tiporep = 'FHD' then
      sSQL := sSQL +
//             '     order by cfe.id_epo, rf.id_persona, cfe.f_efec_descto' + coCRLF;   // JASM 20160331
             '     order by cfe.id_epo, cfe.rfc_pyme, CASE rf.id_persona WHEN 0 THEN 999999999 ELSE rf.id_persona END ASC, cfe.f_efec_descto' + coCRLF;  // JASM 20160331
    if tiporep = 'FHV' then
      sSQL := sSQL +
//             '     order by cfe.id_epo, rf.id_persona, cfe.f_vencimiento_do' + coCRLF; // JASM 20160331
             '     order by cfe.id_epo, cfe.rfc_pyme, CASE rf.id_persona WHEN 0 THEN 999999999 ELSE rf.id_persona END ASC, cfe.f_vencimiento_do' + coCRLF;  // JASM 20160331
    if tiporep = 'SIT' then
      sSQL := sSQL +
//             '     order by cfe.id_epo, rf.id_persona, cfe.sit_documento' + coCRLF;   // JASM 20160331
             '     order by cfe.id_epo, cfe.rfc_pyme, CASE rf.id_persona WHEN 0 THEN 999999999 ELSE rf.id_persona END ASC, cfe.sit_documento' + coCRLF;  // JASM 20160331
    if tiporep = 'DOC' then
      sSQL := sSQL +
//             '     order by cfe.id_epo, rf.id_persona, cfe.id_documento' + coCRLF;    // JASM 20160331
             '     order by cfe.id_epo, cfe.rfc_pyme, CASE rf.id_persona WHEN 0 THEN 999999999 ELSE rf.id_persona END ASC, cfe.id_documento' + coCRLF;  // JASM 20160331


//     Query1 :=  GetSQLQuery(sSQL, Apli.DataBaseName, Apli.SessionName, True );

    TRY                                                                 // JASM 20160331
       Query1 :=  GetSQLQuery(sSQL, Apli.DataBaseName, Apli.SessionName, True );
       vRes := '0';
    EXCEPT
       On Error: EDatabaseError DO
          ShowMessage ('Error al cargar los datos: '+Error.Message + '. ' + coCRLF + coCRLF +
                       'Posibles Errores a Revisar : ' + coCRLF + coCRLF +
                       ' - RFC Duplicado en Tabla RFC de la BD.' + coCRLF +
                       ' - Acceso Fallido a la BD.');
       ON Error: Exception DO
          ShowMessage ('Excepción: '+Error.Message);
    END;

        if Query1 = nil then
        Showmessage('  ATENCIÓN: ¡No existen datos con los criterios de búsqueda utilizados!');

    Result:= sSQL;

end;


procedure TQrFaEle.QRBandDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

begin

If sArchivo <>'' Then
    Begin
      Writeln(F,
                qyFacEle.FieldByName('EMISOR').AsString + #09 +
                qyFacEle.FieldByName('NOM_EMISOR').AsString + #09 +
                qyFacEle.FieldByName('PROVEEDOR').AsString + #09 +
                qyFacEle.FieldByName('NOM_PROVEEDOR').AsString + #09 +
                qyFacEle.FieldByName('FOL_ACUSE').AsString + #09 +
                qyFacEle.FieldByName('ID_DOCUMENTO').AsString + #09 +
                qyFacEle.FieldByName('RFC_PYME').AsString + #09 +
                qyFacEle.FieldByName('NOMBRE_PYME').AsString + #09 +
                FormatDateTime('DD/MM/YYYY',qyFacEle.FieldByName('F_EMISION_DOC').AsDateTime) + #09 +
                FormatDateTime('DD/MM/YYYY',qyFacEle.FieldByName('F_EFEC_DESCTO').AsDateTime) + #09 +
                FormatDateTime('DD/MM/YYYY',qyFacEle.FieldByName('F_VENCIMIENTO_DO').AsDateTime) + #09 +
                FormatFloat('###,###,###,###,###,##0.00',qyFacEle.FieldByName('IMP_DOCUMENTO').AsFloat) + #09+
                qyFacEle.FieldByName('CVE_MONEDA').AsString + #09 +
                FormatDateTime('DD/MM/YYYY HH:NN:SS AMPM',qyFacEle.FieldByName('F_ALTA').AsDateTime) + #09 +
                qyFacEle.FieldByName('CVE_USU_ALTA').AsString + #09 +
                FormatDateTime('DD/MM/YYYY HH:NN:SS AMPM',qyFacEle.FieldByName('F_MODIFICA').AsDateTime) + #09 +
                qyFacEle.FieldByName('CVE_USU_MODIFICA').AsString + #09 +
                qyFacEle.FieldByName('FOL_ACUSE_OPER').AsString + #09 +
                qyFacEle.FieldByName('SIT_DOCUMENTO').AsString + #09 +
                qyFacEle.FieldByName('DESC_SITUACION').AsString);

    End;
end;

procedure TQrFaEle.QRFooterDiaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If qyFacEle.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;


end.

