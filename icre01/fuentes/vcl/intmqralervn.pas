unit IntMQrAlerVn;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, unSQL2,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead,InterApl,
  IntQRPreview, Dialogs, IntGenCre, U_InterCustomStar, U_InterDigDoc;

type
  TQrAlerVn = class(TQuickRep)
    qyAlerVen: TQuery;
    QRBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
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
    Encabezado: TQRBand;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRShape5: TQRShape;
    QRLabel4: TQRLabel;
    QRShape6: TQRShape;
    QRLabel5: TQRLabel;
    QRShape7: TQRShape;
    QRLabel6: TQRLabel;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    QRShape10: TQRShape;
    QRLabel10: TQRLabel;
    QRShape13: TQRShape;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBPROV: TQRDBText;
    QRShape14: TQRShape;
    QRLabel11: TQRLabel;
    QRDBEMI: TQRDBText;
    QRDBNOM_EMI: TQRDBText;
    v: TQRBand;
    QRDBNOMBRE: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRFooterEmisor: TQRBand;
    QRLabel13: TQRLabel;
    QRFooterProveedor: TQRBand;
    QRLabel16: TQRLabel;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    qyAlerVenID_CESION: TFloatField;
    qyAlerVenID_EMISOR: TFloatField;
    qyAlerVenNOM_EMISOR: TStringField;
    qyAlerVenID_PROVEEDOR: TFloatField;
    qyAlerVenNOM_PROVEEDOR: TStringField;
    qyAlerVenID_DOCUMENTO: TStringField;
    qyAlerVenCVE_DOCUMENTO: TStringField;
    qyAlerVenDESC_DOCUMENTO: TStringField;
    qyAlerVenTASA_AFORO: TFloatField;
    qyAlerVenIMP_NOMINAL: TFloatField;
    qyAlerVenIMP_AFORADO: TFloatField;
    qyAlerVenF_COMPRA: TDateTimeField;
    qyAlerVenF_PROG_PAGO: TDateTimeField;
    qyAlerVenPLAZO: TFloatField;
    qyAlerVenF_EMISION: TDateTimeField;
    qyAlerVenF_INGRESO_DOC: TDateTimeField;
    qyAlerVenF_VENC_REAL: TDateTimeField;
    qyAlerVenDIAS_VTO_EMIS: TFloatField;
    qyAlerVenSIT_DOCUMENTO: TStringField;
    QRDBText13: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    InterDigDoc1: TInterDigDoc;
    QRShape12: TQRShape;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    procedure vBeforePrint(Sender: TQRCustomBand;   var PrintBand: Boolean);
    procedure QRFooterEmisorBeforePrint(Sender: TQRCustomBand;    var PrintBand: Boolean);

  private



  public
    function FormaQuery( sF_EMISIni, sF_INGRIni, sF_INGRFin,
                         sID_CESION, sID_EMISOR, sID_PROVEEDOR, sDOCUMENTO, sCVE_DOCUMENTO,
                         sIdEmpresa, sIDSucursal :String):String;


  end;

var

  vlstod, vlsac,
  vlsna, vlsca,
  vlslq, vlsim : String;
  QrAlerVn: TQrAlerVn;
  bGenArch: Boolean;
  sArchivo:String;
  vgFechaHoy : TDateTime;
  F: TextFile;
  Apli : TInterApli;

  procedure RepAlerVn( sF_EMISIni, sF_INGRIni, sF_INGRFin,
                       sID_CESION, sID_EMISOR, sID_PROVEEDOR, sDOCUMENTO, sCVE_DOCUMENTO,
                       sIdEmpresa, sIDSucursal,
                       SNbrArch : String;
                       vltod, vlAC,
                       vlNA, vlCA,
                       vlLQ,vlIM : String;
                       grOpcion  : TGenRepOption;
                       pPreview : Boolean;
                       pApli    : TInterApli);




implementation

{$R *.DFM}

procedure RepAlerVn( sF_EMISIni, sF_INGRIni, sF_INGRFin,
                     sID_CESION, sID_EMISOR, sID_PROVEEDOR, sDOCUMENTO, sCVE_DOCUMENTO,
                     sIdEmpresa, sIDSucursal,
                     SNbrArch : String;
                     vltod, vlAC,
                     vlNA, vlCA,
                     vlLQ,vlIM : String;
                     grOpcion  : TGenRepOption;
                     pPreview : Boolean;
                     pApli    : TInterApli);

var
    QrAlerVn   : TQrAlerVn;
    VLTitulo  : String;
    Preview   : TIntQRPreview;
    A : Array [0..255]  of Char;
    strFileName : String;
begin
    VLTitulo := '';
    QrAlerVn:= TQrAlerVn.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrAlerVn);
    Apli := pApli;
      Try
        vgFechaHoy  :=  pAPli.DameFechaEmpresa;
        bGenArch    :=  False;
        sArchivo    :=  sNbrArch;
        QrAlerVn.QRInterEncabezado1.Apli := pApli;


        vlstod      := vltod;
        vlsac       := vlAC;
        vlsna       := vlNA;
        vlsca       := vlCA;
        vlslq       := vlLQ;
        vlsim       := vlIM;

        QrAlerVn.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrAlerVn.QRInterEncabezado1.NomReporte:='IntMQrAlerVn';
        QrAlerVn.QRInterEncabezado1.Titulo1:= 'Reporte de Alertas de Vencimientos "EMISOR"';

        VLTitulo := VLTitulo + ' Fecha de corte al '+sF_EMISIni;


        QrAlerVn.QRInterEncabezado1.Titulo2 := VLTitulo;
        QrAlerVn.qyAlerVen.DatabaseName := pApli.DataBaseName;
        QrAlerVn.qyAlerVen.SessionName  := pApli.SessionName;

        QrAlerVn.qyAlerVen.Active:=False;

        QrAlerVn.qyAlerVen.SQL.Text:= QrAlerVn.FormaQuery( sF_EMISIni, sF_INGRIni, sF_INGRFin,
                                                           sID_CESION, sID_EMISOR, sID_PROVEEDOR, sDOCUMENTO, sCVE_DOCUMENTO,
                                                           sIdEmpresa, sIDSucursal);

        QrAlerVn.qyAlerVen.SQL.SaveToFile('c:\AlerVen.txt');
        QrAlerVn.qyAlerVen.Active:=True;


        If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrAlerVn.QRInterEncabezado1.Titulo1+ #09 );
         Writeln(F, QrAlerVn.QRInterEncabezado1.Titulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F,
                    'CESION'+ #09 +
                    'EMISOR'+ #09 +
                    'NOMBRE EMISOR'+ #09 +
                    'PROVEEDOR'+ #09 +
                    'NOMBRE PROV'+ #09 +
                    'DOCUMENTO'+ #09 +
                    'TIPO DOCUMENTO'+ #09 +
                    'DESC TIPO DOCTO'+ #09 +
                    'TASA AFORO'+ #09 +
                    'IMPORTE NOMINAL'+ #09 +
                    'IMPORTE AFORADO'+ #09 +
                    'F_COMPRA'+ #09 +
                    'F_PROG_PAGO'+ #09 +
                    'PLAZO'+ #09 +
                    'F_EMISION'+ #09 +
                    'F_INGRESO_DOC'+ #09 +
                    'F_VENC EMISOR'+ #09 +
                    'VTO VS EMIS'+ #09 +
                    'SITUACION');

      End;

       If grOpcion = grPreview Then
               QrAlerVn.Preview
        Else if grOpcion = grPrint Then
           QrAlerVn.Print
        Else if grOpcion = grDigitaliza Then
        Begin
         strFileName := 'C:\tmp\Venc_Emisor.pdf';
         QrAlerVn.PrinterSettings.PrinterIndex := QrAlerVn.InterDigDoc1.SetPrinter;
         QrAlerVn.InterDigDoc1.FileName := strFileName;
         QrAlerVn.Print;
       End;

     Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrAlerVn.free;
      If Assigned(Preview) Then Preview.Free;
    End;

end;

function TQrAlerVn.FormaQuery(sF_EMISIni, sF_INGRIni, sF_INGRFin,
                              sID_CESION, sID_EMISOR, sID_PROVEEDOR, sDOCUMENTO, sCVE_DOCUMENTO,
                              sIdEmpresa, sIDSucursal:String):String;
Var
    sSQL  : String;

begin

    if sF_EMISIni = '' then
       sF_EMISIni := DateToStr(vgFechaHoy);


    sSQL:=  ' select crd.id_cesion, crc.id_emisor, '+ coCRLF +
            '        (select nombre from persona where id_persona = crc.id_emisor and sit_persona = ''AC'') as nom_emisor,'+ coCRLF +
            '        crc.id_proveedor,'+ coCRLF +
            '        (select nombre from persona where id_persona = crc.id_proveedor and sit_persona = ''AC'') as nom_proveedor,'+ coCRLF +
            '        crd.id_documento,'+ coCRLF +
            '        crd.cve_documento, ctd.desc_documento, crd.tasa_aforo, crd.imp_nominal,'+ coCRLF +
            '        pkgcrperiodo.obtenimpaforo (crd.imp_nominal, crd.tasa_aforo) as imp_aforado,'+ coCRLF +
            '        crd.f_compra, cca.f_vencimiento as f_prog_pago, cca.f_vencimiento - crd.f_compra as plazo,'+ coCRLF +
            '        crd.f_emision, crd.f_ingreso_doc, crd.f_venc_real,'+ coCRLF +
                    SQLFecha(StrToDate(sF_EMISIni))+'- crd.f_venc_real as dias_vto_emis, crd.sit_documento'+ coCRLF +
            '   from cr_documento crd, cr_cesion crc, cr_tipo_docto ctd, cr_capital cca'+ coCRLF +
            '  where 1 = 1'+ coCRLF +
            '    and crc.id_cesion = crd.id_cesion'+ coCRLF +
            '    and ctd.cve_documento = crd.cve_documento'+ coCRLF +
            '    and cca.id_credito = crd.id_cesion'+ coCRLF +
            '    and cca.num_periodo = crd.num_periodo_doc'+ coCRLF +
            '    and (crd.sit_documento in (''AC'',''IM'')'+ coCRLF +
            '    and crd.f_venc_real < '+SQLFecha(StrToDate(sF_EMISIni))+')'+ coCRLF;


      if Trim(sID_CESION)<>'' then
       sSQL := sSQL +
            '    AND crd.id_cesion = '+ sID_CESION + coCRLF;

      if Trim(sID_EMISOR)<>'' then
       sSQL := sSQL +
            '    AND crc.id_emisor = '+ sID_EMISOR + coCRLF;

      if Trim(sID_PROVEEDOR)<>'' then
       sSQL := sSQL +
            '    AND crc.id_proveedor = '+ sID_PROVEEDOR  + coCRLF;

      if Trim(sDOCUMENTO)<>'' then
       sSQL := sSQL +
            '    AND crd.id_documento = '''+ sDOCUMENTO + ''''+ coCRLF;

      if Trim(sCVE_DOCUMENTO)<>'' then
       sSQL := sSQL +
            '    AND crd.cve_documento = '''+ sCVE_DOCUMENTO + ''''+ coCRLF;


//      if Trim(vlstod) = '' then
//          begin
//           sSQL := sSQL +
//            '    AND crd.sit_documento in ('''+vlsAC+''','''+vlsNA+''','''+vlsCA+''','''+vlsLQ+''','''+vlsIM+''')'+ coCRLF;
//          end;

       sSQL := sSQL +
	    ' ORDER BY ID_CESION, ID_EMISOR '+ coCRLF;

     Result:=sSQL;
end;


procedure TQrAlerVn.vBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
   sFIngreso , sFVReal : String;

begin

If sArchivo <>'' Then
  Begin

      If qyAlerVen.FieldByName('F_INGRESO_DOC').AsDateTime > 0 Then
       begin
         sFIngreso:= FormatDateTime('dd/mm/yyyy', qyAlerVen.FieldByName('F_INGRESO_DOC').AsDateTime)
       end
       else begin
       sFIngreso:= '';
       end;

      If qyAlerVen.FieldByName('F_VENC_REAL').AsDateTime > 0 Then
       begin
         sFVReal:= FormatDateTime('dd/mm/yyyy', qyAlerVen.FieldByName('F_VENC_REAL').AsDateTime)
       end
       else begin
         sFVReal:= '';
       end;

         Writeln(F,
                  qyAlerVen.FieldByName('ID_CESION').AsString + #09 +
                  qyAlerVen.FieldByName('ID_EMISOR').AsString + #09 +
                  qyAlerVen.FieldByName('NOM_EMISOR').AsString + #09 +
                  qyAlerVen.FieldByName('ID_PROVEEDOR').AsString + #09 +
                  qyAlerVen.FieldByName('NOM_PROVEEDOR').AsString + #09 +
                  qyAlerVen.FieldByName('ID_DOCUMENTO').AsString + #09 +
                  qyAlerVen.FieldByName('CVE_DOCUMENTO').AsString + #09 +
                  qyAlerVen.FieldByName('DESC_DOCUMENTO').AsString + #09 +
                  qyAlerVen.FieldByName('TASA_AFORO').AsString + #09 +
                  FormatFloat('###,###,###,###,###,##0.00',qyAlerVen.FieldByName('IMP_NOMINAL').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyAlerVen.FieldByName('IMP_AFORADO').AsFloat) + #09+
                  FormatDateTime('DD/MM/YYYY',qyAlerVen.FieldByName('F_COMPRA').AsDateTime)+ #09+
                  FormatDateTime('DD/MM/YYYY',qyAlerVen.FieldByName('F_PROG_PAGO').AsDateTime)+ #09+
                  qyAlerVen.FieldByName('PLAZO').AsString + #09 +
                  FormatDateTime('DD/MM/YYYY',qyAlerVen.FieldByName('F_EMISION').AsDateTime)+ #09+
                  sFIngreso+ #09+
                  sFVReal+ #09+
                  qyAlerVen.FieldByName('DIAS_VTO_EMIS').AsString + #09 +
                  qyAlerVen.FieldByName('SIT_DOCUMENTO').AsString);

   End;
end;

procedure TQrAlerVn.QRFooterEmisorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If qyAlerVen.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

end.
