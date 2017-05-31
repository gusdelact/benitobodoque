Unit IntMQrColoca;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport, U_InterCustomStar,
  U_InterDigDoc, uRedigitalizacion;
Type
  TQrColoca = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyColoca: TQuery;
    QRSHPTCredito: TQRShape;
    QRLabel9: TQRLabel;
    QRSHPTContrato: TQRShape;
    QRSHPTSaldo: TQRShape;
    qrlSaldo: TQRLabel;
    QRSHPTCliente: TQRShape;
    QRLabel17: TQRLabel;
    QRSHPTMonto: TQRShape;
    QRLabel18: TQRLabel;
    QRSHPTSaldoIsoluto: TQRShape;
    QRLabel20: TQRLabel;
    QRSHPTF_Inicio: TQRShape;
    QRSHPTPlazo: TQRShape;
    QRLabel24: TQRLabel;
    QRBand1: TQRBand;
    QRFooterMoneda: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRSHPF_Vencimiento: TQRShape;
    QRLabel6: TQRLabel;
    QRSHPTTasa: TQRShape;
    QRSHPTSobretasa: TQRShape;
    QRSHPTSituacion: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRFooterOrigen: TQRBand;
    QRFooterProducto: TQRBand;
    QRFooterPromotor: TQRBand;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    qrlTOTAL: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    qyColocaID_CREDITO: TFloatField;
    qyColocaCHEQUERA: TFloatField;
    qyColocaSALDO_AL: TFloatField;
    qyColocaIMP_CRED: TFloatField;
    qyColocaSDO_INSOL: TFloatField;
    qyColocaPLAZO: TFloatField;
    qyColocaSITUACION: TStringField;
    qyColocaORIGEN: TStringField;
    qyColocaB_OPERADO_NAFIN: TStringField;
    qyColocaF_INICIO: TDateTimeField;
    qyColocaF_VENCIMIENTO: TDateTimeField;
    qyColocaTITULAR: TStringField;
    qyColocaID_PROM_ADM: TFloatField;
    qyColocaNOM_PROMOTOR_ADM: TStringField;
    qyColocaID_PERS_ASOCIAD: TFloatField;
    qyColocaNOM_PROMOTOR_ASO: TStringField;
    qyColocaDESC_MONEDA: TStringField;
    qyColocaCVE_PRODUCTO_CRE: TStringField;
    qyColocaDESC_L_PRODUCTO: TStringField;
    qyColocaCVE_MONEDA: TFloatField;
    QRSHPTImpDispuesto: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText10: TQRDBText;
    qyColocaIMP_DISPUESTO: TFloatField;
    QRExpr4: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel3: TQRLabel;
    QRExpr8: TQRExpr;
    QRLabel4: TQRLabel;
    QRExpr9: TQRExpr;
    QRLabel5: TQRLabel;
    QRExpr10: TQRExpr;
    QRFechaFooter: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr11: TQRExpr;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    qyColocaTASA: TStringField;
    qyColocaDESC_CAT_MINIMO: TStringField;
    qyColocaCVE_CLAS_CONTAB: TStringField;
    QRLabel10: TQRLabel;
    QRSHPTChequera: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    qyColocaID_CONTRATO: TFloatField;
    QRBFootSector: TQRBand;
    QRSHPTotalSector: TQRShape;
    QRLabel49: TQRLabel;
    QRExpr52: TQRExpr;
    QRLabel50: TQRLabel;
    QRDBText39: TQRDBText;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    qyColocaCVE_TIPO_SECTOR: TStringField;
    QRFooterPromAsoc: TQRBand;
    QRLabel23: TQRLabel;
    QRExpr24: TQRExpr;
    QRLabel25: TQRLabel;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRSHPLine: TQRShape;
    QRFootContador: TQRBand;
    QRLabel26: TQRLabel;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRSHPTProveedor: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText24: TQRDBText;
    qyColocaPROVEEDOR: TStringField;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qrgrpFooterEmisor: TQRBand;
    QRLabel28: TQRLabel;
    QRExpr32: TQRExpr;
    QRLabel34: TQRLabel;
    QRExpr33: TQRExpr;
    QRExpr34: TQRExpr;
    QRExpr35: TQRExpr;
    qrgrpFooterProveedor: TQRBand;
    qrgrpHeaderProveedor: TQRGroup;
    QRLabel36: TQRLabel;
    QRExpr36: TQRExpr;
    QRLabel37: TQRLabel;
    QRExpr37: TQRExpr;
    QRExpr38: TQRExpr;
    QRExpr39: TQRExpr;
    QRGroupContador: TQRGroup;
    qrgrpHeaderEmisor: TQRGroup;
    QRGroupPromAsoc: TQRGroup;
    QRGroupPromAdmin: TQRGroup;
    QRGroupFecha: TQRGroup;
    QRGroupMoneda: TQRGroup;
    QRGroupSector: TQRGroup;
    QROrigen: TQRGroup;
    QRGroupProducto: TQRGroup;
    QRLabel39: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape1: TQRShape;
    QRDBText27: TQRDBText;
    qyColocaF_LIQUIDACION: TDateTimeField;
    QRLabel30: TQRLabel;
    QRExpIntPagXAnt: TQRExpr;
    QRLMsgErr: TQRLabel;
    QRLMsgErr1: TQRLabel;
    QRSHPTitular: TQRShape;
    QRDBText25: TQRDBText;
    QRLabel27: TQRLabel;
    QRSHPProveedor: TQRShape;
    QRDBText26: TQRDBText;
    QRLabel35: TQRLabel;
    QRSHPPromAsoc: TQRShape;
    QRDBText16: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel15: TQRLabel;
    QRSHPPromAdm: TQRShape;
    dbNombre_Promotor: TQRDBText;
    dbNom_Promotor: TQRDBText;
    qrlPromotor: TQRLabel;
    QRSHPFecha: TQRShape;
    QRDBText11: TQRDBText;
    QRFecha: TQRLabel;
    QRSHPOrigen: TQRShape;
    QRDBText6: TQRDBText;
    QRSHPProducto: TQRShape;
    QRLabel2: TQRLabel;
    dbProducto: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel29: TQRLabel;
    QRExpr40: TQRExpr;
    QRExpr41: TQRExpr;
    QRLabel40: TQRLabel;
    QRExpr42: TQRExpr;
    QRLabel41: TQRLabel;
    SummaryBand1: TQRBand;
    qyColocaIMP_CRED_VAL: TFloatField;
    qyColocaSDO_INSOL_VAL: TFloatField;
    qyColocaIMP_DISPUESTO_VAL: TFloatField;
    QRLabel42: TQRLabel;
    QRTCMAT: TQRLabel;
    QRLabel43: TQRLabel;
    QRTCMASec: TQRLabel;
    qyColocaSOTASA: TFloatField;
    QRSHPSector: TQRShape;
    QRLabel52: TQRLabel;
    QRDBText38: TQRDBText;
    QRSHPMoneda: TQRShape;
    QRLabel46: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel38: TQRLabel;
    QRTCMA: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    qyColocaCUENTA_VIGENTE_K: TStringField;
    qyColocaCUENTA_VIGENTE_INT: TStringField;
    QRShape2: TQRShape;
    QRLabel44: TQRLabel;
    qyColocaTIPO_DISPOSICION: TStringField;
    QRDBText30: TQRDBText;
    InterDigDoc1: TInterDigDoc;
    qyColocaF_FIN: TDateTimeField;
    qyColocaIMP_CONTRATO: TFloatField;
    qyColocaId_Emisor: TFloatField;
    qyColocaId_Proveedor: TFloatField;
    qyColocaId_Cliente: TFloatField;
    qyColocaF_ALTA_CTO: TStringField;
    qyColocaF_VENC_CTO: TStringField;
    qyColocaF_AUT_CTO: TStringField;
    qyColocaF_AUT_DISP: TStringField;
    qyColocaCVE_COMITE_AUT: TStringField;


    Procedure qyColocaCalcFields(DataSet: TDataSet);
    Procedure QRFootContadorBeforePrint(SEnder: TQRCustomBand;
      Var PrintBand: Boolean);
    Procedure QRBand1BeforePrint(SEnder: TQRCustomBand;
      Var PrintBand: Boolean);
    Procedure QuickRepBeforePrint(SEnder: TCustomQuickRep;
      Var PrintReport: Boolean);
    procedure QRGroupSectorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterProductoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterOrigenBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBFootSectorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFechaFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterPromotorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterPromAsocBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpFooterProveedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpFooterEmisorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  Private
  Public
    vgImpDispuesto : Double;
    vgSdoInsoluto  : Double;
    vgSumIntInLq   : Double;
    vgFechaMesAnt  : TDate;
    vgTCambioMesAnt: Double;
    Function FormaQuery(sFInicio,sFFin,sProducto,sMoneda,
                        sAcreditado,sPromAsoc,sPromAdmon,
                        sCesion,sSituacion,sGpoProd, sProcam, sOperDD,sTipoDisp,
                        sEmpresa, sSucursal,
                        sMedio:String;      // <ICASE JMML 28/Septiembre/2006>   Nuevo parámetro
                        sPromotorAso,sPromotorAdm,bIncTipoSec, bEmisorProv:Boolean):String;
    Function ObtTotIntInLq(sSit,sFIni,sFFin : String;pAPli: TInterApli) :Double;
  End;
Var
  QrColoca: TQrColoca;
  bGenArch: Boolean;
  Apli : TInterApli;
  sCampoF, sArchivo:String;
  F: TextFile;

Procedure RepColocaciones(  sF_Inicio, sF_Fin,sProducto, sMoneda,
                            sAcreditado, sPromAsoc, sPromAdmon,
                            sCesion, sSituacion, sGpoProd, sProcam:String;
                            sPromotorAso, sPromotorAdm, bIncTipoSec, bEmisorProv:Boolean;
                            sNbrArch, sOperDD, sTipoDisp, sEmpresa, sSucursal,
                            sMedio: String;     // <ICASE JMML 28/Septiembre/2006>   Nuevo parámetro
                            pAPli     : TInterApli;
                            pPreview  : Boolean;
                            //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
                            grOpcion  : TGenRepOption;
                            //</LOLS>
                            //
                            //<LOLS 17FEB2006. DIGITALIZACION DE REPORTES>
                            sArchivoDig : String
                            //</LOLS>
                            );
Implementation
{$R *.DFM}

{Se incluyen rutinas para generar un PDF sencillo al vuelo, para el caso de que el reporte venga vacío}
function StrToPDF (s: string): string;
    function Reemplaza (c: char): string;
    type
      RLetra = record
                 Letra: char;
                 Codigo: integer;
               end;

    const
      Letras: array [1..12] of RLetra = ((Letra: 'á'; Codigo: 207), (Letra: 'é'; Codigo: 216), (Letra: 'í'; Codigo: 222),
                                         (Letra: 'ó'; Codigo: 227), (Letra: 'ú'; Codigo: 234), (Letra: 'Á'; Codigo: 347),
                                         (Letra: 'É'; Codigo: 203), (Letra: 'Í'; Codigo: 352), (Letra: 'Ó'; Codigo: 356),
                                         (Letra: 'Ú'; Codigo: 362), (Letra: 'ñ'; Codigo: 226), (Letra: 'Ñ'; Codigo: 204));

    var
      i: integer;
    begin
      result := c;

      for i := Low (Letras) to High (Letras) do
        if c = Letras [i].Letra then
        begin
          result := '\' + IntToStr (Letras [i].Codigo);
          exit;
        end;
    end;

var
  i: integer;
begin
  result := '';

  for i := 1 to Length (s) do
    result := result + Reemplaza (s [i]);
end;

procedure GeneraPDF (FileName, s: string);
var
  Lines: TStringList;
begin
  Lines := TStringList.Create;

  try
    Lines.Add ('%PDF-1.4');
    Lines.Add ('1 0 obj');
    Lines.Add ('<< /Type /Catalog');
    Lines.Add ('/Outlines 2 0 R');
    Lines.Add ('/Pages 3 0 R');
    Lines.Add ('>>');
    Lines.Add ('endobj');
    Lines.Add ('2 0 obj');
    Lines.Add ('<< /Type /Outlines');
    Lines.Add ('/Count 0');
    Lines.Add ('>>');
    Lines.Add ('endobj');
    Lines.Add ('3 0 obj');
    Lines.Add ('<< /Type /Pages');
    Lines.Add ('/Kids [4 0 R]');
    Lines.Add ('/Count 1');
    Lines.Add ('>>');
    Lines.Add ('endobj');
    Lines.Add ('4 0 obj');
    Lines.Add ('<< /Type /Page');
    Lines.Add ('/Parent 3 0 R');
    Lines.Add ('/MediaBox [0 0 612 792]');
    Lines.Add ('/Contents 5 0 R');
    Lines.Add ('/Resources << /ProcSet 6 0 R');
    Lines.Add ('/Font << /F1 7 0 R >>');
    Lines.Add ('>>');
    Lines.Add ('>>');
    Lines.Add ('endobj');
    Lines.Add ('5 0 obj');
    Lines.Add ('<< /Length 73 >>');
    Lines.Add ('stream');
    Lines.Add ('BT');
    Lines.Add ('/F1 12 Tf');
    Lines.Add ('20 700 Td');
    Lines.Add (Format ('(%s) Tj', [StrToPDF (s)]));
    Lines.Add ('ET');
    Lines.Add ('endstream');
    Lines.Add ('endobj');
    Lines.Add ('6 0 obj');
    Lines.Add ('[/PDF /Text]');
    Lines.Add ('endobj');
    Lines.Add ('7 0 obj');
    Lines.Add ('<< /Type /Font');
    Lines.Add ('/Subtype /Type1');
    Lines.Add ('/Name /F1');
    Lines.Add ('/BaseFont /Helvetica');
    Lines.Add ('/Encoding /MacRomanEncoding');
    Lines.Add ('>>');
    Lines.Add ('endobj');
    Lines.Add ('xref');
    Lines.Add ('0 8');
    Lines.Add ('0000000000 65535 f');
    Lines.Add ('0000000009 00000 n');
    Lines.Add ('0000000074 00000 n');
    Lines.Add ('0000000120 00000 n');
    Lines.Add ('0000000179 00000 n');
    Lines.Add ('0000000364 00000 n');
    Lines.Add ('0000000466 00000 n');
    Lines.Add ('0000000496 00000 n');
    Lines.Add ('trailer');
    Lines.Add ('<< /Size 8');
    Lines.Add ('/Root 1 0 R');
    Lines.Add ('>>');
    Lines.Add ('startxref');
    Lines.Add ('625');
    Lines.Add ('%%EOF');
    Lines.SaveToFile (FileName);
  finally
    Lines.Free;
  end;
end;

Procedure RepColocaciones(  sF_Inicio, sF_Fin, sProducto, sMoneda,
                            sAcreditado, sPromAsoc, sPromAdmon,
                            sCesion, sSituacion, sGpoProd, sProcam :String;
                            sPromotorAso, sPromotorAdm, bIncTipoSec, bEmisorProv:Boolean;
                            sNbrArch, sOperDD,sTipoDisp, sEmpresa, sSucursal,
                            sMedio: String;     // <ICASE JMML 28/Septiembre/2006>   Nuevo parámetro
                            pAPli     : TInterApli;
                            pPreview  : Boolean;
                            //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
                            grOpcion  : TGenRepOption;
                            //</LOLS>
                            //
                            //<LOLS 17FEB2006. DIGITALIZACION DE REPORTES>
                            sArchivoDig : String
                            //</LOLS>
                            );
Var
   QrColoca: TQrColoca;
   Preview     : TIntQRPreview;
   sTitulo1, sTitulo2:String;
   VLTipoDisp    : String;
   //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
   sDigDocFileName : String;
   //</LOLS>

   // RUCJ4248: Variable para la validación de la digitalización;
   bDigitalizaCorrecta : Boolean;
Begin
   QrColoca:=TQrColoca.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrColoca);
   Try

      bGenArch:= False;
      Apli := pApli;
      sArchivo:= sNbrArch;
      QrColoca.QRInterEncabezado1.Apli:=pApli;
      QrColoca.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrColoca.QRInterEncabezado1.NomReporte:='IntMQrColoca';
      //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
      sDigDocFileName := 'COLOCACION';
      //</LOLS>

      If Trim(sF_Inicio)<>'' Then Begin
         If sSituacion <> SQLStr('LQ') Then Begin
            QrColoca.QRInterEncabezado1.Titulo1:='Reporte de Colocaciones';
            QrColoca.QRGroupFecha.Expression := 'qyColoca.F_INICIO';
            QrColoca.QRDBText11.DataField := 'F_INICIO';
            sTitulo1:= 'Reporte de Colocaciones';
            sCampoF:= 'F_INICIO';
            //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
            sDigDocFileName := 'COLOCACION';
            //</LOLS>
         End Else Begin
            QrColoca.QRInterEncabezado1.Titulo1:='Reporte de Liquidaciones';
            QrColoca.QRGroupFecha.Expression := 'qyColoca.F_FIN';
            QrColoca.QRDBText11.DataField := 'F_FIN';
            sTitulo1:= 'Reporte de Liquidaciones';
            sCampoF:= 'F_FIN';
            //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
            sDigDocFileName := 'LIQUIDACION';
            //</LOLS>
         End;
      End;

      QrColoca.QRInterEncabezado1.Titulo2:='Periodo del '+  sF_Inicio + ' al ' + sF_Fin;
      sTitulo2:= 'Periodo del '+  sF_Inicio + ' al ' + sF_Fin;

      If (Trim(sTipoDisp)<>'') Then
      begin
           if sTipoDisp = 'DI' then
               VLTipoDisp := ' (DISPOSICIÓN)'
           else if sTipoDisp = 'RE' then
               VLTipoDisp := ' (RENOVACIÓN)'
           else if sTipoDisp = 'RS' then
               VLTipoDisp := ' (REESTRUCTURACIÓN)';
           //end if;
      end;

      //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
      sDigDocFileName := sDigDocFileName  + '_' + FormatDateTime( 'DD_MM_YYYY', StrToDate(sF_Inicio))
                         + '_' + FormatDateTime( 'DD_MM_YYYY', StrToDate(sF_Fin))   + '_' +
                         sProducto  + '_' + sMoneda    + '_' +  sAcreditado   + '_' +
                         sPromAsoc  + '_' + sPromAdmon + '_' + sCesion  + '_' +
                         sSituacion + '_' + sGpoProd   + '_' + sProcam  + '_' +
                         BoolToStr(sPromotorAso) + '_' + BoolToStr(sPromotorAdm) + '_' +
                         BoolToStr(bIncTipoSec ) + '_' + BoolToStr(bEmisorProv ) + '_' +
                         sOperDD    + '_' + sTipoDisp  + '_' + sEmpresa + '_' + sSucursal;
      //</LOLS>

      QrColoca.QRInterEncabezado1.Titulo2 := QrColoca.QRInterEncabezado1.Titulo2 + VLTipoDisp;
      sTitulo2 := sTitulo2 + VLTipoDisp;

      QrColoca.qrlSaldo.Caption:='Saldo al '+ FormatDateTime('dd/mm/yyyy',pAPli.DameFechaEmpresa);
      QrColoca.qyColoca.DatabaseName := pApli.DataBaseName;
      QrColoca.qyColoca.SessionName := pApli.SessionName;


      QrColoca.vgFechaMesAnt := ObtFechaMesAnt( C_FMAN, pApli );
      QrColoca.vgTCambioMesAnt := ObtTipoCambio( QrColoca.vgFechaMesAnt,
                                                   IntToStr ( C_DLLS ) ,
                                                   pAPli.DataBaseName, pAPli.SessionName);

      If Not(sPromotorAso) Then Begin
         QrColoca.QRGroupPromAsoc.Enabled:=False;
         QrColoca.QRGroupPromAsoc.Expression:='';
         QrColoca.QRFooterPromAsoc.Enabled:=False;
      End;

      If Not(sPromotorAdm) Then Begin
         QrColoca.QRGroupPromAdmin.Enabled:=False;
         QrColoca.QRGroupPromAdmin.Expression:='';
         QrColoca.QRFooterPromotor.Enabled:=False;
      End;

      If (sOperDD = 'F') or (sProcam <> '') then Begin
         QrColoca.QROrigen.Enabled := False;
         QrColoca.QROrigen.Expression := '';
         QrColoca.QROrigen.Enabled := False;
      End;

      If Not(bIncTipoSec) then Begin
         QrColoca.QRGroupSector.Enabled := False;
         QrColoca.QRGroupSector.Expression := '';
         QrColoca.QRBFootSector.Enabled := False;
      End;

      If (bEmisorProv) then Begin
         QrColoca.QRGroupMoneda.Enabled := False;
         QrColoca.QRGroupMoneda.Expression := '';
         QrColoca.QRFooterMoneda.Enabled := False;

         QrColoca.QROrigen.Enabled := False;
         QrColoca.QROrigen.Expression := '';
         QrColoca.QRFooterOrigen.Enabled := False;

         QrColoca.QRGroupProducto.Enabled := False;
         QrColoca.QRGroupProducto.Expression := '';
         QrColoca.QRFooterProducto.Enabled := False;
      End Else Begin
         QrColoca.qrgrpHeaderEmisor.Enabled := False;
         QrColoca.qrgrpHeaderEmisor.Expression := '';
         QrColoca.qrgrpFooterEmisor.Enabled := False;

         QrColoca.qrgrpHeaderProveedor.Enabled := False;
         QrColoca.qrgrpHeaderProveedor.Expression := '';
         QrColoca.qrgrpFooterProveedor.Enabled := False;
      End;

      QrColoca.qyColoca.Active:=False;
      QrColoca.qyColoca.SQL.Text:= QrColoca.FormaQuery(sF_Inicio,sF_Fin,sProducto,sMoneda,
                        sAcreditado,sPromAsoc,sPromAdmon,sCesion,sSituacion,sGpoProd,sProcam, sOperDD,sTipoDisp,
                        sEmpresa, sSucursal, sMedio,        // <ICASE JMML 28/Septiembre/2006>   Nuevo parámetro
                        sPromotorAso,sPromotorAdm,bIncTipoSec, bEmisorProv);
      QrColoca.qyColoca.SQL.SaveToFile('c:\coloca.txt');
      QrColoca.qyColoca.Active:=True;

      QrColoca.vgSdoInsoluto  := 0;
      QrColoca.vgImpDispuesto := 0;
      QrColoca.vgSumIntInLq   := QrColoca.ObtTotIntInLq(sSituacion, sF_Inicio, sF_Fin, pAPli);

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, sTitulo1+ #09 );
         Writeln(F, sTitulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F,
             'Emisor'+ #09 +
             'Proveedor'+ #09 +
             'Promotor Asociado'+ #09+ 'Nombre Promotor Asociado' +#09 +
             'Promotor Administrador'+#09 + 'Nombre Promotor Administrador' +#09 +
             'Fecha' + #09 +
             'Sector' + #09 +
             'Moneda' + #09+'Descripción Moneda'+#09+ 'Origen' +#09 +
             'Producto' + #09+ 'Descripción Producto' +#09 +
             'Clasificación Contable:'+ #09#09 +
             'Cesion/Crédito' +  #09+
             'Chequera' +  #09 +
             'Saldo al '+ FormatDateTime('dd/mm/yyyy',Apli.DameFechaEmpresaDia('D000'))+  #09 +
             'Contrato' +  #09 +
             'Cliente' +  #09 +
             'Proveedor' +#09 +
             'Tipo Disposición' +#09 +
             'Monto del Crédito'+ #09+
             'Saldo Insoluto'+ #09 +
             'Importe Dispuesto'+#09 +
             'Fecha Liquidación'+ #09 +
             'Fecha Inicio'+ #09 +
             'Plazo'+ #09 +
             'Fecha de Vencimiento'+ #09 +
             'Tasa'+ #09 +
             'Sobretasa'+ #09 +
             'Situación'+ #09 +
             'Imp_Contrato'+ #09 + // >>> CAMPOS EN REPORTE DE EXCEL JFOF 03/08/2011
             'Fecha Alta'+ #09 +
             'Fecha Vmnto Cto'+ #09 +
             'Fecha Aut Comité'+ #09 +
             'Fecha Aut Disposición'+ #09 +
             'Id_Emisor'+ #09 +
             'Id_Proveedor'+ #09 +
             'Id_Cliente'+ #09 +
             'Cve_Autoriza');      // <<< CAMPOS EN REPORTE DE EXCEL JFOF 03/08/2011

      End;

      //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
      If grOpcion = grPreview Then
         QrColoca.Preview
      Else if grOpcion = grPrint Then
         QrColoca.Print
      Else if grOpcion = grDigitaliza Then
      Begin
            QrColoca.InterDigDoc1.RootDir  := obtValorGpoCve( 'CONFRH', 'ROOTDIR',   pApli );
            QrColoca.InterDigDoc1.HostName := obtValorGpoCve( 'CONFRH', 'FTPSERVER', pApli );
            QrColoca.InterDigDoc1.UserName := obtValorGpoCve( 'CONFRH', 'USERNAME',  pApli );
            QrColoca.InterDigDoc1.Password := HexToStr( obtValorGpoCve( 'CONFRH', 'PASSWORD',  pApli ) );
            QrColoca.InterDigDoc1.SendTo   := ObtSendTo( sF_Inicio );
            QrColoca.InterDigDoc1.FileName := sArchivoDig; // sDigDocFileName; //<LOLS 17FEB2006. DIGITALIZACION DE REPORTES>
            QrColoca.PrinterSettings.PrinterIndex := QrColoca.InterDigDoc1.SetPrinter;

            //AGF: Verifica que el reporte tenga datos, pues si trae 0 registros, es cuando se genera el error.
            if QrColoca.qyColoca.RecordCount > 0 then
              QrColoca.Print
            else
              //AGF: Se genera el archivo pdf al vuelo con la leyenda respectiva
              GeneraPDF (sArchivoDig, Format ('No se encontró información para el %s en el reporte de Colocaciones.', [sF_Fin]));
			  
//          RUCJ4248 : validar que la digitalización se genere de forma correcta
            bDigitalizaCorrecta := (QrColoca.InterDigDoc1.Compress and QrColoca.InterDigDoc1.SendFile);

//            QrColoca.InterDigDoc1.Compress;
//            QrColoca.InterDigDoc1.SendFile;
            QrColoca.PrinterSettings.PrinterIndex := QrColoca.InterDigDoc1.RestorePrinter;
      End;
      //If pPreview Then
      //   QrColoca.Preview
      //Else
      //   QrColoca.Print;
      //</LOLS>
   Finally
//    ----------------------------------------------
//    RUCJ4248 03/12/2009: Rastreo de digitalización
      if trim(sArchivoDig) <> '' then
      begin
      TRecolectaDatos.Recoleccion(FormatDateTime( 'dd/mm/yyyy', StrToDate(sF_Inicio)),
         TRecolectaDatos.delString(sArchivoDig), 'CONFRH', pAPli.NomAplicacion,
         TRecolectaDatos.BooleanToByte(bDigitalizaCorrecta),pAPli);
      end;

      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrColoca.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrColoca.FormaQuery(sFInicio,sFFin,sProducto,sMoneda,
                              sAcreditado,sPromAsoc,sPromAdmon,
                              sCesion,sSituacion,sGpoProd, sProcam,
                              sOperDD,sTipoDisp,sEmpresa, sSucursal,
                              sMedio:String;        // <ICASE JMML 28/Septiembre/2006>   Nuevo parámetro
                              sPromotorAso,sPromotorAdm,bIncTipoSec,
                              bEmisorProv:Boolean):String;
Var
    sSQL:String;
Begin
{    sSQL:=  'SELECT '+
            '       CR_CONTRATO.IMP_AUTORIZADO AS IMP_CONTRATO,'+  // >>> CAMPOS EN REPORTE DE EXCEL JFOF 03/08/2011
            '       To_Char(CR_CONTRATO.F_ALTA,''dd/mm/yyyy'') AS F_ALTA_CTO,'+
            '       To_Char(CR_CONTRATO.F_VENCIMIENTO,''dd/mm/yyyy'') AS F_VENC_CTO,'+
            '       To_Char(CR_CONTRATO.F_AUT_COMITE,''dd/mm/yyyy'') AS F_AUT_CTO,'+
            '       To_Char(CR_CREDITO.F_AUTORIZA,''dd/mm/yyyy'') AS F_AUT_DISP,'+
            '       CR_CESION.ID_EMISOR,'+
            '       CR_CESION.ID_PROVEEDOR,'+
            '       CONTRATO.ID_TITULAR AS ID_CLIENTE,'+
            '       '''' || to_char(CVE_COMITE_AUT) as CVE_COMITE_AUT,'+ // <<<CAMPOS EN REPORTE DE EXCEL JFOF 03/08/2011
            '       CR_CREDITO.ID_CREDITO,'+
            '       CR_TRANSACCION.ID_CTO_LIQ CHEQUERA,'+
            '       PKGDPVISTASERV.SPTObtSaldo(CR_TRANSACCION.ID_CTO_LIQ,''D000'') SALDO_AL,'+
            '       CR_CONTRATO.ID_CONTRATO,  DECODE(PTF.CVE_PER_JURIDICA,''PM'', PTF.NOMBRE,'+
            '       PTIT.APELLIDO_PATERNO||'' ''||PTIT.APELLIDO_MATERNO||'' ''||PTIT.NOMBRE_PERSONA) TITULAR,'+
            '       DECODE(PP.CVE_PER_JURIDICA,''PM'',PP.NOMBRE,'+
            '       PFP.APELLIDO_PATERNO||'' ''||PFP.APELLIDO_MATERNO||'' ''||PFP.NOMBRE_PERSONA) PROVEEDOR,'+
            '       PTF.CVE_TIPO_SECTOR,  CR_EMISOR.NOMBRE_EMISOR ,  ' +
            '       CR_TRANSACCION.IMP_NETO IMP_CRED,'+
            '       CR_CREDITO.SDO_INSOLUTO SDO_INSOL,'+
            '       CR_CREDITO.IMP_DISPUESTO,'+
            '       (CR_TRANSACCION.IMP_NETO * NVL(PKGCORPO.OBTTIPOCAMBIO (PKGCRCOMUN.STPOBTENFECHA(2,''FMAN'') ,CONTRATO.CVE_MONEDA,''V'' ), 1 ))  IMP_CRED_VAL,'+
            '       (CR_CREDITO.SDO_INSOLUTO * NVL(PKGCORPO.OBTTIPOCAMBIO (PKGCRCOMUN.STPOBTENFECHA(2,''FMAN'') ,CONTRATO.CVE_MONEDA,''V'' ), 1 )) SDO_INSOL_VAL,'+
            '       (CR_CREDITO.IMP_DISPUESTO * NVL(PKGCORPO.OBTTIPOCAMBIO (PKGCRCOMUN.STPOBTENFECHA(2,''FMAN'') ,CONTRATO.CVE_MONEDA,''V'' ), 1 )) IMP_DISPUESTO_VAL,'+
}{ROIM 07122005 SE CAMBIA LA COLUMNA DE FECHA DE INICIO DEL DATO DE FECHA DE AUTORIZACIÓN A FECHA DE INICIO}
//            '       TRUNC(CR_CREDITO.F_AUTORIZA) F_INICIO, CR_CREDITO.F_LIQUIDACION,'+
{            '       TRUNC(CR_CREDITO.F_INICIO) F_INICIO, CR_CREDITO.F_LIQUIDACION,'+
}{/ROIM}
{            '       TRUNC(CR_CREDITO.F_LIQUIDACION) F_FIN,'+
            '       NVL(PKGCRPERIODO.ObtPlazoMax(CR_CREDITO.ID_CREDITO),0) PLAZO,'+
            '       CR_CREDITO.F_VENCIMIENTO,'+
            '       (CR_CREDITO.CVE_TASA_REFER||DECODE(CR_CREDITO.CVE_TASA_REFER,''FIJA'',''(''||CR_CREDITO.TASA_BASE||'')'','' '')||CR_CREDITO.OPERADOR_STASA||''(''||CR_CREDITO.SOBRETASA||'')'') TASA,'+
            '       CR_CREDITO.TASA_CREDITO SOTASA,'+
            '       SIT_CREDITO SITUACION, CR_CREDITO.ID_PROM_ADM ,  PPR.NOMBRE NOM_PROMOTOR_ADM,'+
            '       CONTRATO.ID_PERS_ASOCIAD, PPRC.NOMBRE NOM_PROMOTOR_ASO, CONTRATO.CVE_MONEDA,'+
            '       MONEDA.DESC_MONEDA, CR_PRODUCTO.CVE_PRODUCTO_CRE,  CR_PRODUCTO.DESC_L_PRODUCTO,'+
            '       CR_PRODUCTO.CVE_CLAS_CONTAB,  CR_CAT_MINIMO.DESC_CAT_MINIMO,'+
            '       NVL(CR_CESION.B_OPERADO_NAFIN,''F'')B_OPERADO_NAFIN, '+
            '       CR_PRODUCTO.CVE_PRODUCTO_GPO, ' + coCRLF +
//            '       TABCTA.CUENTA_VIGENTE_INT, ' + coCRLF +
//            '       TABCTA.CUENTA_VIGENTE_K,' + coCRLF +
            '       NVL(TABCTA.CUENTA_VIGENTE_K,TABCTAICRE.CVE_CTA_CONT_CAREVI) AS CUENTA_VIGENTE_K     ,'+
            '       NVL(TABCTA.CUENTA_VIGENTE_INT,TABCTAICRE.CVE_CTA_CONT_INREVI) AS CUENTA_VIGENTE_INT,'+ coCRLF +
            '       CR_CREDITO.TIPO_DISPOSICION'+ coCRLF +

            '  FROM CR_TRANSACCION, CR_CREDITO, CONTRATO, PERSONA_FISICA PTIT,'+
            '       PERSONA  PTF, CR_CESION, CR_EMISOR, PERSONA PPR, PERSONA PPRC, MONEDA,'+
//            '       CR_CONTRATO,  '+
            '      (SELECT CCTO.*, CPRO.ID_EMPRESA FROM   CR_PRODUCTO CPRO, CR_CONTRATO CCTO WHERE  CPRO.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE) CR_CONTRATO,'+
            '       CR_PRODUCTO,  CR_CAT_MINIMO, PERSONA_FISICA PFP, PERSONA PP,'+
            '       CR_PRODUCTO_GPO, ' + coCRLF +
                C_QUERY_CTAS_ICRE +
                C_QUERY_CTAS +

//            ' WHERE CR_TRANSACCION.CVE_OPERACION IN (''DISPCS'',''DISPCR'',''DISPRE'',''DISPRS'',''DSCSDL'')'+ //EASA4011
            ' WHERE CR_TRANSACCION.CVE_OPERACION IN (''DISPCS'',''DISPCR'',''DISPRE'',''DISPRS'',''DSCSDL'', ''DSCRDL'')'+
            '   AND CR_CREDITO.ID_CREDITO = CR_TRANSACCION.ID_CREDITO'+
            '   AND CONTRATO.ID_CONTRATO = CR_TRANSACCION.ID_CONTRATO'+
            '   AND PTIT.ID_PERSONA(+)= CONTRATO.ID_TITULAR'+
            '   AND PTF.ID_PERSONA = CONTRATO.ID_TITULAR'+
            '   AND CR_CESION.ID_CESION (+)= CR_TRANSACCION.ID_CREDITO'+
}{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
{            '   AND CR_EMISOR.CVE_FND_ENT_DES (+)= CR_CESION.CVE_FND_ENT_DES'+
            '   AND CR_EMISOR.ID_ACREDITADO (+)= CR_CESION.ID_EMISOR'+
//            '   AND CR_EMISOR.CVE_EMISOR_NAFIN (+)= CR_CESION.CVE_EMISOR_NAFIN'+
            '   AND CR_EMISOR.CVE_EMISOR_EXT (+)= CR_CESION.CVE_EMISOR_NAFIN'+
}{/ROIM}
{            '   AND PPR.ID_PERSONA = CR_CREDITO.ID_PROM_ADM'+
            '   AND PPRC.ID_PERSONA = CONTRATO.ID_PERS_ASOCIAD'+
            '   AND PP.ID_PERSONA (+)= CR_CESION.ID_PROVEEDOR'+
            '   AND PFP.ID_PERSONA (+)= PP.ID_PERSONA'+
            '   AND MONEDA.CVE_MONEDA = CONTRATO.CVE_MONEDA'+
            '   AND CR_CONTRATO.ID_CONTRATO = CR_CREDITO.ID_CONTRATO'+
            '   AND CR_CONTRATO.FOL_CONTRATO = CR_CREDITO.FOL_CONTRATO'+
            '   AND CR_PRODUCTO.CVE_PRODUCTO_CRE = CR_CONTRATO.CVE_PRODUCTO_CRE'+
            '   AND CR_CAT_MINIMO.CVE_CAT_MINIMO (+)= CR_PRODUCTO.CVE_CLAS_CONTAB'+
            '   AND CR_PRODUCTO_GPO.CVE_PRODUCTO_GPO (+)= CR_PRODUCTO.CVE_PRODUCTO_GPO ' + coCRLF +
            '   AND TABCTAICRE.ID_EMPRESA (+)= CR_CONTRATO.ID_EMPRESA'+ coCRLF +
            '   AND TABCTAICRE.CVE_PRODUCTO_CRE (+)= CR_CONTRATO.CVE_PRODUCTO_CRE'+ coCRLF +
            '   AND TABCTAICRE.CVE_MONEDA (+)= CR_CONTRATO.CVE_MONEDA'+ coCRLF +
            '   AND TABCTA.CVE_PRODUCTO_CRE(+) = CR_PRODUCTO.CVE_PRODUCTO_CRE ' + coCRLF;
}

// RABA JUL 2015 SE REESTRUCTURA EL QUERY PARA MEJOR FUNCIONALIDAD DE LOS HISTORICOS
    sSQL:=  'SELECT OPERA.*, ' + coCRLF +
            '       NVL (CS.B_OPERADO_NAFIN, ''F'') B_OPERADO_NAFIN, ' + coCRLF +
            '       CS.ID_EMISOR, CS.ID_PROVEEDOR, ' + coCRLF +
            '       DECODE (PP.CVE_PER_JURIDICA,  ''PM'', PP.NOMBRE, PFP.APELLIDO_PATERNO||'' ''|| PFP.APELLIDO_MATERNO||'' ''|| PFP.NOMBRE_PERSONA) PROVEEDOR, ' + coCRLF +
            '       EM.NOMBRE_EMISOR, ' + coCRLF +
            '       TABCTAICRE.CVE_CTA_CONT_CAREVI AS CUENTA_VIGENTE_K, ' + coCRLF +
            '       TABCTAICRE.CVE_CTA_CONT_INREVI AS CUENTA_VIGENTE_INT ' + coCRLF +
            'FROM ' + coCRLF +
            '     (SELECT CRCTO.IMP_AUTORIZADO AS IMP_CONTRATO, ' + coCRLF +
            '             TO_CHAR (CRCTO.F_ALTA, ''DD/MM/YYYY'') AS F_ALTA_CTO, ' + coCRLF +
            '             TO_CHAR (CRCTO.F_VENCIMIENTO, ''DD/MM/YYYY'') AS F_VENC_CTO, ' + coCRLF +
            '             TO_CHAR (CRCTO.F_AUT_COMITE, ''DD/MM/YYYY'') AS F_AUT_CTO, ' + coCRLF +
            '             TO_CHAR (CRE.F_AUTORIZA, ''DD/MM/YYYY'') AS F_AUT_DISP, ' + coCRLF +
            '             CTO.ID_TITULAR AS ID_CLIENTE, ' + coCRLF +
            '             '''' || TO_CHAR (CVE_COMITE_AUT) AS CVE_COMITE_AUT, ' + coCRLF +
            '             CRE.ID_CREDITO, CT.ID_CTO_LIQ CHEQUERA, ' + coCRLF +
            '             PKGDPVISTASERV.SPTOBTSALDO (CT.ID_CTO_LIQ, ''D000'') SALDO_AL, ' + coCRLF +
            '             CRCTO.ID_CONTRATO, ' + coCRLF +
            '             DECODE (PTF.CVE_PER_JURIDICA, ''PM'', PTF.NOMBRE, PTIT.APELLIDO_PATERNO||'' ''|| PTIT.APELLIDO_MATERNO||'' ''|| PTIT.NOMBRE_PERSONA) TITULAR, ' + coCRLF +
            '             PTF.CVE_TIPO_SECTOR, ' + coCRLF +
            '             CT.IMP_NETO IMP_CRED, CRE.SDO_INSOLUTO SDO_INSOL, ' + coCRLF +
            '             CRE.IMP_DISPUESTO, ' + coCRLF +
            '             (CT.IMP_NETO * NVL (PKGCORPO.OBTTIPOCAMBIO (PKGCRCOMUN.STPOBTENFECHA (2, ''FMAN''), CTO.CVE_MONEDA, ''V''), 1)) IMP_CRED_VAL, ' + coCRLF +
            '             (CRE.SDO_INSOLUTO  * NVL (PKGCORPO.OBTTIPOCAMBIO (PKGCRCOMUN.STPOBTENFECHA (2, ''FMAN''), CTO.CVE_MONEDA, ''V''), 1)) SDO_INSOL_VAL, ' + coCRLF +
            '             (CRE.IMP_DISPUESTO * NVL (PKGCORPO.OBTTIPOCAMBIO (PKGCRCOMUN.STPOBTENFECHA (2, ''FMAN''), CTO.CVE_MONEDA, ''V''), 1)) IMP_DISPUESTO_VAL, ' + coCRLF +
            '             TRUNC (CRE.F_INICIO) F_INICIO, CRE.F_LIQUIDACION, ' + coCRLF +
            '             TRUNC (CRE.F_LIQUIDACION) F_FIN, ' + coCRLF +
            '             NVL (PKGCRPERIODO.OBTPLAZOMAX (CRE.ID_CREDITO), 0) PLAZO, ' + coCRLF +
            '             CRE.F_VENCIMIENTO, ' + coCRLF +
            '             (CRE.CVE_TASA_REFER||DECODE(CRE.CVE_TASA_REFER,''FIJA'',''(''||CRE.TASA_BASE||'')'','' '')||CRE.OPERADOR_STASA || ''(''|| CRE.SOBRETASA || '')'' ) TASA, ' + coCRLF +
            '             CRE.TASA_CREDITO SOTASA, SIT_CREDITO SITUACION, ' + coCRLF +
            '             CRE.ID_PROM_ADM, PPR.NOMBRE NOM_PROMOTOR_ADM, ' + coCRLF +
            '             CTO.ID_PERS_ASOCIAD, ' + coCRLF +
            '             PPRC.NOMBRE NOM_PROMOTOR_ASO, ' + coCRLF +
            '             CTO.CVE_MONEDA, ' + coCRLF +
            '             MON.DESC_MONEDA, ' + coCRLF +
            '             PROD.CVE_PRODUCTO_CRE, PROD.DESC_L_PRODUCTO, ' + coCRLF +
            '             PROD.CVE_CLAS_CONTAB_OLD CVE_CLAS_CONTAB, CATMIN.DESC_CAT_MINIMO, ' + coCRLF +
            '             PROD.CVE_PRODUCTO_GPO, ' + coCRLF +
            '             CRE.TIPO_DISPOSICION, ' + coCRLF +
            '             PROD.ID_EMPRESA ' + coCRLF +
            '    FROM     CR_TRANSACCION CT, ' + coCRLF +
            '             CR_CREDITO CRE, ' + coCRLF +
            '             CONTRATO CTO, ' + coCRLF +
            '             PERSONA_FISICA PTIT, ' + coCRLF +
            '             PERSONA PTF, ' + coCRLF +
            '             PERSONA PPR, ' + coCRLF +
            '             PERSONA PPRC, ' + coCRLF +
            '             MONEDA MON, ' + coCRLF +
            '             --CR_CONTRATO CRCTO,    --RABA JUL 2015 B-6 HISTORICOS ' + coCRLF +
            '             --CR_PRODUCTO PROD,     --RABA JUL 2015 B-6 HISTORICOS ' + coCRLF +
            '             (SELECT CAST(CASE  WHEN AU.CVE_PRODUCTO_CRE IS NOT NULL THEN AU.CVE_PRODUCTO_CRE ELSE RAIZ.CVE_PRODUCTO_CRE END AS VARCHAR2(10)) CVE_PRODUCTO_OLD, ' + coCRLF +
            '                     RAIZ.* ' + coCRLF +
            '              FROM CR_CONTRATO RAIZ ' + coCRLF +
            '                           LEFT JOIN ' + coCRLF +
            '                                (SELECT DENSE_RANK () OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY FH_REGISTRO DESC) R, ' + coCRLF +
            '                                        CASE WHEN LAG (FH_REGISTRO) OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY ID_AUDIT) IS NULL ' + coCRLF +
            '                                                  THEN TO_DATE (1, ''J'') ' + coCRLF +
            '                                             ELSE CAST (LAG (FH_REGISTRO) OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY ID_AUDIT) AS DATE) ' + coCRLF +
            '                                        END F_INI, ' + coCRLF +
            '                                        CASE WHEN LEAD (FH_REGISTRO) OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY ID_AUDIT) IS NULL ' + coCRLF +
            '                                                  THEN TO_DATE (''31/12/9999'', ''DD/MM/YYYY'') ' + coCRLF +
            '                                             ELSE CAST (FH_REGISTRO AS DATE) ' + coCRLF +
            '                                        END F_FIN, ' + coCRLF +
            '                                        ID_CONTRATO, ' + coCRLF +
            '                                        CVE_PRODUCTO_CRE ' + coCRLF +
            '                                 FROM   (SELECT * ' + coCRLF +
            '                                         FROM   (SELECT CASE WHEN LAG (B_AD) OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY ID_AUDIT) IS NULL ' + coCRLF +
            '                                                                  AND   TO_NUMBER (ID_CONTRATO) = LEAD (TO_NUMBER (ID_CONTRATO) ) OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY ID_AUDIT) ' + coCRLF +
            '                                                                  THEN 1 ' + coCRLF +
            '                                                             ELSE 0 ' + coCRLF +
            '                                                        END L, ' + coCRLF +
            '                                                        HIS.* ' + coCRLF +
            '                                                 FROM   (SELECT H.B_AD, H.FH_REGISTRO, DET.ID_AUDIT, DET.CAMPO, DET.VALOR ' + coCRLF +
            '                                                         FROM   CORP_AUDIT_CAMBIO H, CORP_AUDIT_CAMBIO_DET DET ' + coCRLF +
            '                                                         WHERE  H.ORIGEN_DATOS = ''CR_CONTRATO'' ' + coCRLF +
            '                                                         AND    H.ID_AUDIT = DET.ID_AUDIT) ' + coCRLF +
            '                                                         PIVOT(MAX(VALOR) FOR CAMPO IN(''ID_CONTRATO'' AS ID_CONTRATO,''FOL_CONTRATO'' AS FOL_CONTRATO,''CVE_PRODUCTO_CRE'' AS CVE_PRODUCTO_CRE)) HIS ' + coCRLF +
            '                                                         ) ' + coCRLF +
            '                                                 WHERE  1 = 1 ' + coCRLF +
            '                                                 AND    (   B_AD = ''D'' OR L = 1) ) REGS ' + coCRLF +
            '                                 ) AU ' + coCRLF +
            '                           ON  TO_NUMBER (AU.ID_CONTRATO) = RAIZ.ID_CONTRATO ' + coCRLF +
            '                           AND TO_DATE (TO_CHAR (TO_DATE ('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''', ''DD/MM/YYYY''), ''DD/MM/YYYY'') || ''23:59:59'', ''DD/MM/YYYY HH24:MI:SS'') BETWEEN AU.F_INI AND AU.F_FIN ' + coCRLF +
            '              )  CRCTO, ' + coCRLF +
            '             -- ' + coCRLF +
            '             (SELECT CAST(CASE WHEN AU.CVE_CLAS_CONTAB IS NOT NULL THEN AU.CVE_CLAS_CONTAB ELSE RAIZ.CVE_CLAS_CONTAB END AS VARCHAR2(20)) CVE_CLAS_CONTAB_OLD, ' + coCRLF +
            '                     RAIZ.* ' + coCRLF +
            '              FROM   CR_PRODUCTO RAIZ ' + coCRLF +
            '                           LEFT JOIN ' + coCRLF +
            '                                (SELECT DENSE_RANK () OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY FH_REGISTRO DESC) R, ' + coCRLF +
            '                                        CASE WHEN LAG (FH_REGISTRO) OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY ID_AUDIT) IS NULL ' + coCRLF +
            '                                                  THEN TO_DATE (1, ''J'') ' + coCRLF +
            '                                             ELSE CAST (LAG (FH_REGISTRO) OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY ID_AUDIT) AS DATE) ' + coCRLF +
            '                                        END F_INI, ' + coCRLF +
            '                                        CASE WHEN LEAD (FH_REGISTRO) OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY ID_AUDIT) IS NULL ' + coCRLF +
            '                                                  THEN TO_DATE (''31/12/9999'', ''DD/MM/YYYY'') ' + coCRLF +
            '                                             ELSE CAST (FH_REGISTRO AS DATE) ' + coCRLF +
            '                                        END F_FIN, ' + coCRLF +
            '                                        CVE_PRODUCTO_CRE, ' + coCRLF +
            '                                        CVE_CLAS_CONTAB ' + coCRLF +
            '                                 FROM   (SELECT * ' + coCRLF +
            '                                         FROM   (SELECT CASE WHEN LAG (B_AD) OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY ID_AUDIT) IS NULL ' + coCRLF +
            '                                                                  AND   CVE_PRODUCTO_CRE = LEAD (CVE_PRODUCTO_CRE) OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY ID_AUDIT) ' + coCRLF +
            '                                                                  THEN 1 ' + coCRLF +
            '                                                             ELSE 0 ' + coCRLF +
            '                                                        END L, ' + coCRLF +
            '                                                        HIS.* ' + coCRLF +
            '                                                 FROM   (SELECT H.B_AD, H.FH_REGISTRO, DET.ID_AUDIT, DET.CAMPO, DET.VALOR ' + coCRLF +
            '                                                         FROM   CORP_AUDIT_CAMBIO H, CORP_AUDIT_CAMBIO_DET DET ' + coCRLF +
            '                                                         WHERE  H.ORIGEN_DATOS = ''CR_PRODUCTO'' ' + coCRLF +
            '                                                         AND    H.ID_AUDIT = DET.ID_AUDIT) ' + coCRLF +
            '                                                         PIVOT(MAX(VALOR) FOR CAMPO IN(''CVE_PRODUCTO_CRE'' AS CVE_PRODUCTO_CRE,''CVE_CLAS_CONTAB'' AS CVE_CLAS_CONTAB)) HIS ' + coCRLF +
            '                                                 ) ' + coCRLF +
            '                                         WHERE  1 = 1 ' + coCRLF +
            '                                         AND    (   B_AD = ''D'' OR L = 1) ) REGS ' + coCRLF +
            '                                 ) AU ' + coCRLF +
            '                           ON  AU.CVE_PRODUCTO_CRE = RAIZ.CVE_PRODUCTO_CRE ' + coCRLF +
            '                           AND TO_DATE (TO_CHAR (TO_DATE ('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''', ''DD/MM/YYYY''), ''DD/MM/YYYY'') || ''23:59:59'', ''DD/MM/YYYY HH24:MI:SS'') BETWEEN AU.F_INI AND AU.F_FIN ' + coCRLF +
            '              ) PROD, ' + coCRLF +
            '             CR_CAT_MINIMO CATMIN, ' + coCRLF +
            '             CR_PRODUCTO_GPO PRGPO ' + coCRLF +
            '             -- ' + coCRLF +
            '    WHERE    CT.CVE_OPERACION IN (''DISPCS'', ''DISPCR'', ''DISPRE'', ''DISPRS'', ''DSCSDL'', ''DSCRDL'') ' + coCRLF +
            '    AND      CRE.ID_CREDITO = CT.ID_CREDITO ' + coCRLF +
            '    AND      CTO.ID_CONTRATO = CT.ID_CONTRATO ' + coCRLF +
            '    AND      PTF.ID_PERSONA = CTO.ID_TITULAR ' + coCRLF +
            '    AND      PTIT.ID_PERSONA(+) = CTO.ID_TITULAR ' + coCRLF +
            '    AND      PPR.ID_PERSONA = CRE.ID_PROM_ADM ' + coCRLF +
            '    AND      PPRC.ID_PERSONA = CTO.ID_PERS_ASOCIAD ' + coCRLF +
            '    AND      MON.CVE_MONEDA = CTO.CVE_MONEDA ' + coCRLF +
            '    AND      CRCTO.ID_CONTRATO = CRE.ID_CONTRATO ' + coCRLF +
            '    AND      CRCTO.FOL_CONTRATO = CRE.FOL_CONTRATO ' + coCRLF +
            '    AND      PROD.CVE_PRODUCTO_CRE = CRCTO.CVE_PRODUCTO_OLD ' + coCRLF +      //RABA JUL 2015 HISTORICOS
            '    AND      CATMIN.CVE_CAT_MINIMO = PROD.CVE_CLAS_CONTAB_OLD ' + coCRLF +    //RABA JUL 2015 HISTORICOS
            '    AND      PRGPO.CVE_PRODUCTO_GPO = PROD.CVE_PRODUCTO_GPO ' + coCRLF;

    If sSituacion <> SQLStr('LQ') Then Begin
       If (Trim(sFInicio)<>'') Then Begin
          sSQL:= sSQL + '    AND      TRUNC(CRE.F_AUTORIZA) >= TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'') ' + coCRLF;
       End;

       If (Trim(sFFin)<>'') Then Begin
             sSQL:= sSQL + '    AND      TRUNC(CRE.F_AUTORIZA) <= TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'') ' + coCRLF;
       End;
    End Else If sSituacion = SQLStr('LQ') Then Begin
        If (Trim(sFInicio)<>'') Then Begin
           sSQL:= sSQL + '    AND      TRUNC(CRE.F_LIQUIDACION) >= TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'') ' + coCRLF;
       End;

       If (Trim(sFFin)<>'') Then Begin
          sSQL:= sSQL + '    AND      TRUNC(CRE.F_LIQUIDACION) <= TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'') ' + coCRLF;
       End;
    End;

    If (Trim(sProducto)<>'') Then
       sSQL:= sSQL + '    AND      PROD.CVE_PRODUCTO_CRE =' + SQLStr( sProducto ) + coCRLF;
    If (Trim(sMoneda)<>'') Then
       sSQL:= sSQL + '    AND      CTO.CVE_MONEDA ='+sMoneda + coCRLF;
    If (Trim(sAcreditado)<>'') Then
       sSQL:= sSQL + '    AND      CTO.ID_TITULAR ='+ sAcreditado + coCRLF;
    If (Trim(sPromAsoc)<>'') Then
       sSQL:= sSQL + '    AND      CTO.ID_PERS_ASOCIAD ='+ sPromAsoc + coCRLF;
    If (Trim(sPromAdmon)<>'') Then
       sSQL:= sSQL + '    AND      CRE.ID_PROM_ADM ='+ sPromAdmon + coCRLF;
    If (Trim(sCesion)<>'') Then
       sSQL:= sSQL + '    AND      CRE.ID_CREDITO ='+ sCesion + coCRLF;
    If (Trim(sSituacion)<>'') Then
       Begin
          sSQL:= sSQL + '    AND      ( CRE.SIT_CREDITO IN ( ' + sSituacion + ' ) ' + coCRLF;
          if ( sSituacion = 'AC' ) OR ( sSituacion = 'CA') THEN
             sSQL:= sSQL + '    AND      CT.SIT_TRANSACCION IN ( ' + sSituacion + ' )) ' + coCRLF
          ELSE sSQL:= sSQL + '              ) ' + coCRLF;
       END;
    If (Trim(sGpoProd)<>'') Then
       sSQL:= sSQL + '    AND      PROD.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd ) + coCRLF;
    If (Trim(sTipoDisp)<>'') Then
       sSQL:= sSQL + '    AND      CRE.TIPO_DISPOSICION ='+ SQLStr( sTipoDisp ) + coCRLF;
    If (Trim(sEmpresa)<>'') Then
       sSQL:= sSQL + '    AND      PROD.ID_EMPRESA ='+  Trim(sEmpresa) + coCRLF;
    If (Trim(sMedio)<>'') Then
       sSQL:= sSQL + '    AND      CRE.CVE_MEDIO ='''+ Trim(sMedio) + '''' + coCRLF;

    If (Trim(sOperDD)<>'') Then
      sSQL:= sSQL + '    ) OPERA JOIN CR_CESION CS ON  CS.ID_CESION = OPERA.ID_CREDITO ' + coCRLF +
                    '                              AND CS.B_OPERADO_NAFIN ='+ SQLStr( sOperDD ) + coCRLF
    else
      sSQL:= sSQL + '    ) OPERA LEFT JOIN CR_CESION CS ON  CS.ID_CESION = OPERA.ID_CREDITO ' + coCRLF;
    //end If


    sSQL:= sSQL + '            LEFT JOIN CR_EMISOR EM ON  EM.CVE_FND_ENT_DES = CS.CVE_FND_ENT_DES ' + coCRLF +
            '                                    AND EM.ID_ACREDITADO   = CS.ID_EMISOR ' + coCRLF +
            '                                    AND EM.CVE_EMISOR_EXT  = CS.CVE_EMISOR_NAFIN ' + coCRLF +
            '            LEFT JOIN PERSONA PP   ON CS.ID_PROVEEDOR = PP.ID_PERSONA ' + coCRLF +
            '            LEFT JOIN PERSONA_FISICA PFP ON PFP.ID_PERSONA = PP.ID_PERSONA ' + coCRLF +
            '            LEFT JOIN ' + copy(C_QUERY_CTAS_ICRE,1, Length(C_QUERY_CTAS_ICRE)-4)  + coCRLF +
            '                                    ON  TABCTAICRE.ID_EMPRESA = OPERA.ID_EMPRESA ' + coCRLF +
            '                                    AND TABCTAICRE.CVE_PRODUCTO_CRE = OPERA.CVE_PRODUCTO_CRE  ' + coCRLF +
            '                                    AND TABCTAICRE.CVE_MONEDA = OPERA.CVE_MONEDA ' + coCRLF;

   sSQL:= sSQL + ' ORDER BY ';
   If sPromotorAso Then
      sSQL:= sSQL + ' OPERA.NOM_PROMOTOR_ASO,';
   If sPromotorAdm Then
      sSQL:= sSQL + ' OPERA.NOM_PROMOTOR_ADM,';

   If bEmisorProv Then
      sSQL:= sSQL + ' OPERA.TITULAR,  PROVEEDOR, '; // SATV4766

   sSQL:= sSQL + ' OPERA.F_INICIO, OPERA.DESC_MONEDA, CS.B_OPERADO_NAFIN, OPERA.DESC_L_PRODUCTO,';

   If bIncTipoSec Then
      sSQL:= sSQL + ' OPERA.CVE_TIPO_SECTOR,';

   sSQL:= sSQL + ' OPERA.TITULAR, OPERA.ID_CREDITO';
// FIN RABA JUL 2015 SE REESTRUCTURA EL QUERY PARA MEJOR FUNCIONALIDAD DE LOS HISTORICOS

   Result:= sSQL;
End;

Procedure TQrColoca.qyColocaCalcFields(DataSet: TDataSet);
Begin
   If (Trim(qyColocaB_OPERADO_NAFIN.AsString) = 'V')Then Begin
        qyColocaORIGEN.AsString:='Operado por NAFIN';
   End Else Begin
        qyColocaORIGEN.AsString:='Recursos Propios';
   End;
   qrlTOTAL.Caption:= 'Total '+ qyColocaORIGEN.AsString;
End;

Procedure TQrColoca.QRFootContadorBeforePrint(SEnder: TQRCustomBand;
  Var PrintBand: Boolean);
Var vlDif : Double;
    vlResta : Double;
    sDif, sInt : String;
Begin
   QRTCMAT.Caption := FormatFloat('###,##0.0000',vgTCambioMesAnt);


   QRLMsgErr.Caption  := ' ';
   QRLMsgErr1.Caption := ' ';
   vlDif := 0;
   vlResta := 0;
   sDif := '';
   sInt := '';
   If vgSdoInsoluto > 0  Then Begin
      vlDif := vgSdoInsoluto - vgImpDispuesto;
      sDif := FormatFloat('###,###,###,###,###,##0.00',vlDif);
      sInt := FormatFloat('###,###,###,###,###,##0.00',vgSumIntInLq);
      vlResta := CurrFromFrmFloat(sDif) - CurrFromFrmFloat(sInt);
{     if ( vlResta <> 0 ) then
     Begin
        QRLMsgErr.Caption  := ' ¡ ¡ ¡  E R R O R   E N   S A L D O S  ! ! ! ' ;
        QRLMsgErr1.Caption := ' Monto Cred. - Imp.Disp.: ' + sDif + '                ' +
                              ' Calculado : ' + sInt;
     End else Begin
        QRLMsgErr.Caption  := '';
        QRLMsgErr1.Caption := '';
     End;}
   End Else Begin
      QRExpIntPagXAnt.Caption :=  FormatFloat('###,###,###,###,###,##0.00',vlDif);
      QRLMsgErr.Caption  := '';
      QRLMsgErr1.Caption := '';
   End;

   If sArchivo <>'' Then Begin
      Writeln(F, #09);
      Writeln(F, #09+'GRAN TOTAL:' + #09+
                  FormatFloat('###,###,###,###,###,##0',QRExpr28.Value.intResult) + #09+
                  '' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr29.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr30.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr31.Value.dblResult)+#09+#09+
                  'Int. Pag. x Ant.' +#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpIntPagXAnt.Value.dblResult));
      Writeln(F, #09 );
      Writeln(F, #09+#09+#09+ QRLMsgErr.Caption);
      Writeln(F, #09+#09+#09+ QRLMsgErr1.Caption);
   End;

End;

Procedure TQrColoca.QRBand1BeforePrint(SEnder: TQRCustomBand;
  Var PrintBand: Boolean);
Begin

   vgImpDispuesto := vgImpDispuesto + qyColocaIMP_DISPUESTO.AsFloat;
   vgSdoInsoluto := vgSdoInsoluto + qyColocaSDO_INSOL.AsFloat;
   If sArchivo <>'' Then Begin
         Writeln(F,

                  qyColoca.FieldByName('TITULAR').AsString + #09 +
                  qyColoca.FieldByName('PROVEEDOR').AsString + #09 +
                  qyColoca.FieldByName('ID_PERS_ASOCIAD').AsString + #09 +
                  qyColoca.FieldByName('NOM_PROMOTOR_ASO').AsString+ #09 +
                  qyColoca.FieldByName('ID_PROM_ADM').AsString + #09 +
                  qyColoca.FieldByName('NOM_PROMOTOR_ADM').AsString + #09 +
                  FormatDateTime('dd/mm/yyyy',qyColoca.FieldByName(sCampoF).AsDateTime) + #09 +
                  qyColoca.FieldByName('CVE_TIPO_SECTOR').AsString + #09 +
                  qyColoca.FieldByName('CVE_MONEDA').AsString + #09 +
                  qyColoca.FieldByName('DESC_MONEDA').AsString + #09 +
                  qyColoca.FieldByName('ORIGEN').AsString + #09 +
                  qyColoca.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
                  qyColoca.FieldByName('DESC_L_PRODUCTO').AsString + #09 +
                  qyColoca.FieldByName('CVE_CLAS_CONTAB').AsString + #09 +
                  qyColoca.FieldByName('DESC_CAT_MINIMO').AsString + #09 +
                  qyColoca.FieldByName('ID_CREDITO').AsString  + #09+
                  qyColoca.FieldByName('CHEQUERA').AsString    + #09 +
                  qyColoca.FieldByName('SALDO_AL').AsString + #09 +
                  qyColoca.FieldByName('ID_CONTRATO').AsString + #09+
                  qyColoca.FieldByName('TITULAR').AsString +#09 +
                  qyColoca.FieldByName('PROVEEDOR').AsString + #09+
                  qyColoca.FieldByName('TIPO_DISPOSICION').AsString + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyColoca.FieldByName('IMP_CRED').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyColoca.FieldByName('SDO_INSOL').AsFloat) + #09 +
                  FormatFloat('###,###,###,###,###,##0.00',qyColoca.FieldByName('IMP_DISPUESTO').AsFloat) + #09+
                  //< / easa4011    06 abril 2006 baja fechas de liquidación incorrectas
//                  FormatDateTime('dd/mm/yyyy',qyColoca.FieldByName('F_LIQUIDACION').AsDateTime) + #09+
                  qyColoca.FieldByName('F_LIQUIDACION').AsString+ #09+
                  // easa4011 >/
                  FormatDateTime('dd/mm/yyyy',qyColoca.FieldByName('F_INICIO').AsDateTime) + #09+
                  qyColoca.FieldByName('PLAZO').AsString + #09 +
                  FormatDateTime('dd/mm/yyyy',qyColoca.FieldByName('F_VENCIMIENTO').AsDateTime) + #09 +
                  qyColoca.FieldByName('TASA').AsString + #09+
                  qyColoca.FieldByName('SOTASA').AsString + #09+
                  qyColoca.FieldByName('SITUACION').AsString + #09+
                    // >>> JFOF 03/08/2011 CAMPOS PARA REPORTE EN EXCEL
                  FormatFloat('###,###,###,###,###,##0.00',qyColoca.FieldByName('IMP_CONTRATO').AsFloat) + #09+
                  FormatDateTime('DD/MM/YYYY',qyColoca.FieldByName('F_Alta_Cto').AsDateTime)+ #09+
                  FormatDateTime('DD/MM/YYYY',qyColoca.FieldByName('F_Venc_Cto').AsDateTime)+ #09+
                  FormatDateTime('DD/MM/YYYY',qyColoca.FieldByName('F_Aut_Cto').AsDateTime)+ #09+
                  FormatDateTime('DD/MM/YYYY',qyColoca.FieldByName('F_Aut_Disp').AsDateTime)+ #09+
                  qyColoca.FieldByName('Id_Emisor').AsString  + #09+
                  qyColoca.FieldByName('Id_Proveedor').AsString  + #09+
                  qyColoca.FieldByName('Id_Cliente').AsString + #09 +
                  qyColoca.FieldByName('CVE_COMITE_AUT').AsString);
                 // <<< JFOF 03/08/2011

   End;
End;

Procedure TQrColoca.QuickRepBeforePrint(SEnder: TCustomQuickRep;
  Var PrintReport: Boolean);
Begin
   vgSdoInsoluto  := 0;
   vgImpDispuesto := 0;
End;

Function TQrColoca.ObtTotIntInLq(sSit, sFIni, sFFin: String; pAPli : TInterApli): Double;
Var vlImpInt : String;
    vlSQL    : String;
Begin
   vlsql := 'SELECT NVL(SUM(NVL(IMP_INTERES,0)),0) SUMA_INT           ' +
            '  FROM CR_INTERES CI, CR_DOCUMENTO CD, CR_CREDITO CC     ' +
            ' WHERE CI.ID_CREDITO = CD.ID_CESION                     ' +
            '   AND CI.NUM_PERIODO = CD.NUM_PERIODO_DOC              ' +
            '   AND CD.CVE_TIPO_INTERES = ''IN''                       ' +
            '   AND CI.SIT_INTERES = ''LQ''                            ' +
            '   AND CC.ID_CREDITO = CD.ID_CESION                       ';
   If sSit <> 'LQ' Then Begin
      vlSQL:= vlSQL + ' AND CC.F_AUTORIZA >= TO_DATE('''+
                       FormatDateTime('DD/MM/YYYY',StrToDate(sFIni))+''',''DD/MM/YYYY'')';

      If (Trim(sFFin)<>'') Then Begin
                vlSQL:= vlSQL + ' AND CC.F_AUTORIZA <= TO_DATE('''+
                       FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'')';
      End;
   End Else If sSit = 'LQ' Then Begin
      If (Trim(sFIni)<>'') Then Begin
         vlSQL:= vlSQL + ' AND CC.F_LIQUIDACION >= TO_DATE('''+
                       FormatDateTime('DD/MM/YYYY',StrToDate(sFIni))+''',''DD/MM/YYYY'')';
      End;
      If (Trim(sFFin)<>'') Then Begin
         vlSQL:= vlSQL + ' AND CC.F_LIQUIDACION <= TO_DATE('''+
                       FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'')';
      End;
   End;
   GetSQLStr(vlSQL,pAPli.DataBaseName,pAPli.SessionName,'SUMA_INT',vlimpInt,False);
   Result := StrToFloat(vlImpInt);
End;

procedure TQrColoca.QRGroupSectorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if qyColoca.FieldByName('CVE_MONEDA').AsInteger <> 484 then
   begin
        QRLabel38.Caption := 'Tipo de Cambio (Mes Ant.)';
       QRTCMA.Caption := FormatFloat('###,##0.0000',vgTCambioMesAnt);
   end
   else
   begin
        QRLabel38.Caption := '';
        QRTCMA.Caption := '';
   end;
end;

procedure TQrColoca.QRFooterProductoBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total de Disposiciones:' + #09 +
                  FormatFloat('###,###,###,###,###,##0',QRExpr7.Value.intResult) +#09+
                  'Total por Producto' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr13.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr14.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr4.Value.dblResult)+#09+#09+
                  'Int. Pag. x Ant.' +#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr40.Value.dblResult));
   End;
end;

procedure TQrColoca.QRFooterOrigenBeforePrint(Sender: TQRCustomBand;    var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total de Disposiciones:' + #09 +
                  FormatFloat('###,###,###,###,###,##0',QRExpr10.Value.intResult) +#09 +
                  'Total '+ qyColoca.FieldByName('ORIGEN').AsString + #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr1.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr6.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr17.Value.dblResult));
   End;
end;

procedure TQrColoca.QRFooterMonedaBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total de Disposiciones:'+ #09 +
                  FormatFloat('###,###,###,###,###,##0',QRExpr8.Value.intResult) +#09 +
                  'Total por Moneda' + #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr2.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr12.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr18.Value.dblResult)+#09+#09+
                  'Int. Pag. x Ant.' +#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr41.Value.dblResult));
   End;
end;

procedure TQrColoca.QRBFootSectorBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   QRTCMASec.Caption := FormatFloat('###,##0.0000',vgTCambioMesAnt);
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 +'Total de Disposiciones:' +#09+
                  FormatFloat('###,###,###,###,###,##0',QRExpr52.Value.intResult) +#09+
                  'Total de SECTOR' +#09+
                  qyColoca.FieldByName('CVE_TIPO_SECTOR').AsString +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr21.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr22.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr23.Value.dblResult)+#09+#09+
                  'Int. Pag. x Ant.' +#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr42.Value.dblResult));
   End;
end;

procedure TQrColoca.QRFechaFooterBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total de Disposiciones:' +#09 +
                  FormatFloat('###,###,###,###,###,##0',QRExpr11.Value.intResult) +#09+
                  'Total por DIA' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr5.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr16.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr20.Value.dblResult));
   End;
end;

procedure TQrColoca.QRFooterPromotorBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total de Disposiciones:' +#09+
                  FormatFloat('###,###,###,###,###,##0',QRExpr9.Value.intResult) +#09+
                  'Total por Promotor Administrador' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr3.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr15.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr19.Value.dblResult));
   End;
end;

procedure TQrColoca.QRFooterPromAsocBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09+ 'Total de Disposiciones:' +#09+
                  FormatFloat('###,###,###,###,###,##0',QRExpr24.Value.intResult) +#09+
                  'Total por Promotor Asociado' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr25.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr26.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr27.Value.dblResult));
   End;
end;

procedure TQrColoca.qrgrpFooterProveedorBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09+ 'Total de Disposiciones:' +#09 +
                  FormatFloat('###,###,###,###,###,##0',QRExpr36.Value.intResult) +#09+
                  'Total por Proveedor' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr37.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr38.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr39.Value.dblResult));
   End;
end;

procedure TQrColoca.qrgrpFooterEmisorBeforePrint(Sender: TQRCustomBand;     var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09+'Total de Disposiciones:' +#09+
                  FormatFloat('###,###,###,###,###,##0',QRExpr32.Value.intResult) +#09+
                  'Total por Emisor' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr33.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr34.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr35.Value.dblResult));
   End;
end;

procedure TQrColoca.SummaryBand1BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If qyColoca.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

End.
