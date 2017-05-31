unit IntMQrInCoCob2;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, UNSQL2, Dialogs,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre, U_InterCustomStar, U_InterDigDoc, uRedigitalizacion;

const      coCRLF      = #13#10;     
type
  TQrInCoCob2 = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    qyInfCobConta: TQuery;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRShape3: TQRShape;
    QRLabel15: TQRLabel;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    QRShape7: TQRShape;
    QRLabel22: TQRLabel;
    QRShape8: TQRShape;
    QRLabel24: TQRLabel;
    qrbCONCEPTOS: TQRBand;
    QRFooterMoneda: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBTxtCAP_ANT_PROG: TQRDBText;
    QRDBTxtCAP_VEN_EXIG: TQRDBText;
    QRDBTxtCAP_IMP: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBTSituacion: TQRDBText;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShSituacion: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLbSituacion: TQRLabel;
    QRFooterCesion: TQRBand;
    QRFooterProducto: TQRBand;
    QRDBTxtINT_IMP: TQRDBText;
    QRDBTxtINT_ANT_PROG: TQRDBText;
    QRDBTxtPAGO_CONCEPTOS: TQRDBText;
    QRDBTxtINT_PEN_AFEC_RES: TQRDBText;
    QRDBTxtINT_VENC: TQRDBText;
    QRDBTxtIMPMOR: TQRDBText;
    QRDBTxtIVA_CO: TQRDBText;
    QRDBTxtIVA_INT: TQRDBText;
    QRDBTxtBENBCO: TQRDBText;
    QRDBTxtIVA_MOR: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRExpr32: TQRExpr;
    QRExpr33: TQRExpr;
    QRExpr34: TQRExpr;
    QRExpr35: TQRExpr;
    QRExpr36: TQRExpr;
    QRExpr37: TQRExpr;
    QRExpr52: TQRExpr;
    QRExpr53: TQRExpr;
    QRExpr54: TQRExpr;
    QRExpr55: TQRExpr;
    QRExpr56: TQRExpr;
    QRExpr57: TQRExpr;
    QRExpr58: TQRExpr;
    QRExpr59: TQRExpr;
    QRExpr60: TQRExpr;
    QRExpr61: TQRExpr;
    QRExpr62: TQRExpr;
    QRExpr63: TQRExpr;
    QRExpr64: TQRExpr;
    QRExpr65: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape23: TQRShape;
    QRLabel42: TQRLabel;
    QRShape22: TQRShape;
    QRLabel43: TQRLabel;
    QRShape26: TQRShape;
    QRLabel45: TQRLabel;
    QRShape24: TQRShape;
    QRDBText9: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText15: TQRDBText;
    QRGroupMoneda: TQRGroup;
    QRGroupGpoProducto: TQRGroup;
    QRGroupProducto: TQRGroup;
    QRLabel8: TQRLabel;
    QRDBText33: TQRDBText;
    QRExpr98: TQRExpr;
    QRLabel47: TQRLabel;
    QRLabel51: TQRLabel;
    QRExpr100: TQRExpr;
    QRLabel55: TQRLabel;
    QRExpr103: TQRExpr;
    QRShape9: TQRShape;
    QRLabel6: TQRLabel;
    QRShape10: TQRShape;
    QRLabel21: TQRLabel;
    QRShape11: TQRShape;
    QRLabel31: TQRLabel;
    QRShape13: TQRShape;
    QRLabel32: TQRLabel;
    QRDBTxtCAP_VEN_NOEX: TQRDBText;
    SummaryBand1: TQRBand;
    QRGroupDisp: TQRGroup;
    QRFooterGpoProducto: TQRBand;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr38: TQRExpr;
    QRExpr39: TQRExpr;
    QRExpr40: TQRExpr;
    QRExpr41: TQRExpr;
    QRExpr42: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRExpr43: TQRExpr;
    dbMoneda: TQRDBText;
    QRDBText14: TQRDBText;
    QRLProveedor: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape4: TQRShape;
    QRDBText8: TQRDBText;
    QRDBText16: TQRDBText;
    dbProducto: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText17: TQRDBText;
    InterDigDoc1: TInterDigDoc;
    QRShape18: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText18: TQRDBText;

    qyInfCobContaPER_DOC: TStringField;
    qyInfCobContaCAP_ANT_PROG: TFloatField;
    qyInfCobContaCAP_VEN_NOEX: TFloatField;
    qyInfCobContaCAP_IMP: TFloatField;
    qyInfCobContaCAP_VEN_EXIG: TFloatField;
    qyInfCobContaIVA_MOR: TFloatField;
    qyInfCobContaINT_ANT_PROG: TFloatField;
    qyInfCobContaINT_PEN_AFEC_RES: TFloatField;

    qyInfCobContaINT_IMP: TFloatField;
    qyInfCobContaINT_VENC: TFloatField;
    qyInfCobContaIVA_INT: TFloatField;
    qyInfCobContaPAGO_CONCEPTOS: TFloatField;
    qyInfCobContaIVA_CO: TFloatField;

    qyInfCobContaID_CREDITO: TFloatField;
    qyInfCobContaNOMBRE: TStringField;

    qyInfCobContaID_PERIODO: TFloatField;
    qyInfCobContaID_DOCUMENTO: TStringField;
    qyInfCobContaSIT_TRANSACCION: TStringField;
    qyInfCobContaCONCEPTO: TStringField;
    qyInfCobContaCVE_MONEDA: TFloatField;
    qyInfCobContaDESC_MONEDA: TStringField;
    qyInfCobContaCVE_PRODUCTO_CRE: TStringField;
    qyInfCobContaDESC_L_PRODUCTO: TStringField;
    qyInfCobContaCVE_TIPO_SECTOR: TStringField;
    qyInfCobContaCHEQUERA: TStringField;
    qyInfCobContaCVE_CAT_MINIMO: TStringField;
    qyInfCobContaDESC_CAT_MINIMO: TStringField;
    qyInfCobContaTIPO_CAMBIO: TFloatField;
    qyInfCobContaCVE_USU_ALTA: TStringField;
    qyInfCobContaID_TRANSACCION: TFloatField;
    qyInfCobContaCVE_ACCESORIO: TStringField;
    qyInfCobContaIMPBRU: TFloatField;
    qyInfCobContaIMPIVA: TFloatField;
    qyInfCobContaIMPMOR: TFloatField;
    qyInfCobContaIVAMOR: TFloatField;
    qyInfCobContaCOIMP: TFloatField;
    qyInfCobContaCOIVA: TFloatField;
    qyInfCobContaBENBCO: TFloatField;
    qyInfCobContaBENGOB: TFloatField;
    qyInfCobContaFH_ALTA: TDateTimeField;
    qyInfCobContaFH_CANCELA: TDateTimeField;
    qyInfCobContaF_VALOR: TDateTimeField;
    qyInfCobContaDESC_COMISION: TStringField;
    qyInfCobContaID_CESION: TFloatField;
    qyInfCobContaSALDO: TFloatField;
    qyInfCobContaF_OPERACION: TDateTimeField;
    qyInfCobContaF_TRASPASO_VENC: TDateTimeField;
    qyInfCobContaCVE_PRODUCTO_GPO: TStringField;
    qyInfCobContaDESC_L_PROD_GPO: TStringField;
    qyInfCobContaCUENTA_VIGENTE_INT: TStringField;
    qyInfCobContaCUENTA_VIGENTE_K: TStringField;
    qyInfCobContaTOT_IVA_INT_PROG: TFloatField;
    qyInfCobContaTOT_IVA_INT_IMP: TFloatField;
    qyInfCobContaTOT_IVA_INT_ANT: TFloatField;
    qyInfCobContaTOT_IVA_CO_ANT: TFloatField;
    qyInfCobContaTOT_IVA_CO_PROG: TFloatField;
    qyInfCobContaTOT_IVA_CO_IMP: TFloatField;
    qyInfCobContaCLAVE_CON: TStringField;
    QRDBText19: TQRDBText;
    qyInfCobContaCVE_ENT_DES: TStringField;
    qyInfCobContaDESC_ENT_DES: TStringField;
    QRDBText20: TQRDBText;
    qyInfCobContaLEYENDA_ENT_DES: TStringField;
    qyInfCobContaCVE_TIPO_MOVTO: TStringField;
    qyInfCobContaCVE_OPERACION: TStringField;
    procedure qyInfCobContaCalcFields(DataSet: TDataSet);
    procedure qrbCONCEPTOSBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterCesionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterProductoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
     bQrResumen: Boolean;
  public

    Function FormaQuery(sF_Inicio,sF_Final,sProducto,sMoneda,
                        sAcreditado, sCatMinimo, sCredito,
                        sSitMov, sOrden, sEmpresa, sSucursal, sGpoProd:String;
                        bIncTipoSec:Boolean;bPagoFIRA : Integer):String;
  end;

var
  QrInCoCob2: TQrInCoCob2;
  bGenArch, bDetDD: Boolean;
  sArchivo:String;
  F: TextFile;

  vlFND_ENT_DES, vlDESC_ENT_DES:String; //HERJA
  vlB_FONDEO:Boolean;

Procedure RepInfCobrConta2(  sF_Inicio,sF_Final,sProducto,sMoneda,
                            sAcreditado, sCatMinimo, sCredito,
                            sSitMov, sNbrArch, sOrden,
                            sEmpresa, sSucursal, sGpoProd:String;
                            bIncTipoSec, bResumen, bDetalleDD:Boolean;
                            bPagoFIRA : Integer;
                            pAPli     : TInterApli;
                            bCreFondeo:Boolean; //HERJA - PARA FILTRAR SOLO CREDITOS CON FONDEO
                            pPreview  : Boolean;
                            //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
                            grOpcion  : TGenRepOption;
                            //</LOLS>
                            //
                            //<LOLS 17FEB2006. DIGITALIZACION DE REPORTES>
                            sArchivoDig : String
                            //</LOLS>
                            );
Implementation
{$R *.DFM}

Procedure RepInfCobrConta2(  sF_Inicio,sF_Final,sProducto,sMoneda,
                            sAcreditado, sCatMinimo, sCredito,
                            sSitMov, sNbrArch, sOrden,
                            sEmpresa, sSucursal, sGpoProd:String;
                            bIncTipoSec, bResumen, bDetalleDD :Boolean;
                            bPagoFIRA : Integer;
                            pAPli     : TInterApli;
                            bCreFondeo:Boolean; //HERJA - PARA FILTRAR SOLO CREDITOS CON FONDEO                            
                            pPreview  : Boolean;
                            //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
                            grOpcion  : TGenRepOption;
                            //</LOLS>
                            //
                            //<LOLS 17FEB2006. DIGITALIZACION DE REPORTES>
                            sArchivoDig : String
                            //</LOLS>
                            );
Var
   QrInCoCob2 : TQrInCoCob2;
   Preview     : TIntQRPreview;
   //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
   sDigDocFileName : String;
   //</LOLS>
   // RUCJ4248: Variable para la validación de la digitalización;
   bDigitalizaCorrecta : Boolean;
Begin
   QrInCoCob2:=TQrInCoCob2.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrInCoCob2);

   vlB_FONDEO:=bCreFondeo; //HERJA

   Try
      bGenArch:= False;
      sArchivo:= sNbrArch;
      QrInCoCob2.bQrResumen := bResumen;
      bDetDD := bDetalleDD; //EASA4011 29122004
      QrInCoCob2.QRInterEncabezado1.Apli:=pApli;
      QrInCoCob2.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrInCoCob2.QRInterEncabezado1.NomReporte:='IntMQrInCoCob2';
      QrInCoCob2.QRInterEncabezado1.Titulo1:='Informe Contable de Cobranza Área de Contabilidad';

      If (Trim(sSitMov) = 'AC') Then
          QrInCoCob2.QRInterEncabezado1.Titulo2:=QrInCoCob2.QRInterEncabezado1.Titulo2 + 'Movtos ACTIVOS ';

      If (Trim(sSitMov) = 'CA') Then
          QrInCoCob2.QRInterEncabezado1.Titulo2:=QrInCoCob2.QRInterEncabezado1.Titulo2 + 'Movtos CANCELADOS ';

      If Trim(sF_Inicio)<>'' Then
          QrInCoCob2.QRInterEncabezado1.Titulo2:=QrInCoCob2.QRInterEncabezado1.Titulo2 + ' del '+
                                      sF_Inicio + ' al ' + sF_Final;
      if bResumen then Begin
         QrInCoCob2.QRGroupDisp.Enabled := False;
         QrInCoCob2.qrbCONCEPTOS.Enabled := False;
         QrInCoCob2.QRFooterCesion.Enabled := False;
         QrInCoCob2.QRInterEncabezado1.Titulo1:= 'Resumen del ' + QrInCoCob2.QRInterEncabezado1.Titulo1;
      end
      else Begin
         if not bDetalleDD then
            QrInCoCob2.QRInterEncabezado1.Titulo2:= QrInCoCob2.QRInterEncabezado1.Titulo2 + ' ( No Incluye Det de Doctos. )'
         else
            QrInCoCob2.QRInterEncabezado1.Titulo2:= QrInCoCob2.QRInterEncabezado1.Titulo2 + ' ( Incluye Det de Doctos. )';
      end;

      if bPagoFIRA = 0 then
          QrInCoCob2.QRInterEncabezado1.Titulo2:=QrInCoCob2.QRInterEncabezado1.Titulo2 + ' (SOLO BINTER) '
      else if bPagoFIRA = 1 then
          QrInCoCob2.QRInterEncabezado1.Titulo2:=QrInCoCob2.QRInterEncabezado1.Titulo2 + ' (SOLO FIRA) '
      else
          QrInCoCob2.QRInterEncabezado1.Titulo2:=QrInCoCob2.QRInterEncabezado1.Titulo2 + ' (INDISTINTO) ';
      //end if


      QrInCoCob2.qyInfCobConta.DatabaseName := pApli.DataBaseName;
      QrInCoCob2.qyInfCobConta.SessionName := pApli.SessionName;

      QrInCoCob2.QRLbSituacion.Visible := False; //ales
      QrInCoCob2.QRLbSituacion.Enabled := False; //ales

      QrInCoCob2.qyInfCobConta.Active:=False;
      QrInCoCob2.qyInfCobConta.SQL.Text:= QrInCoCob2.FormaQuery(sF_Inicio,sF_Final,sProducto,sMoneda,
                      sAcreditado, sCatMinimo, sCredito,sSitMov, sOrden,
                      sEmpresa, sSucursal, sGpoProd,bIncTipoSec, bPagoFIRA);
      QrInCoCob2.qyInfCobConta.SQL.SaveToFile('C:\COBCONT.TXT');
      QrInCoCob2.qyInfCobConta.Active:=True;

      //HERJA
      vlFND_ENT_DES:=' ';
      vlDESC_ENT_DES:=' ';
      if vlB_FONDEO = true then
      begin
         vlFND_ENT_DES:='Entidad';
         vlDESC_ENT_DES:='Desc. Entidad';
      end;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrInCoCob2.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F, QrInCoCob2.QRInterEncabezado1.Titulo2 + #09 );
         Writeln(F, #09 );
         Writeln(F, #09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                    'Pago de Capital / Financiamiento Adicional'+ #09#09#09#09 +
                    'Pago de Intereses'+ #09#09#09#09#09#09 +
                    'Pago de IVA');

         Writeln(F,
             'Moneda' + #09#09 +
             'Producto'+ #09#09 +
             'Cta.' + #09 +
             'Crédito' +  #09+
             'Cliente' +  #09 +
             'Cuenta de Cheques' +  #09 +
             'Catálogo Mínimo'+ #09#09 +
             'Tipo de Cambio' + #09 +
             'Usuario' + #09 +
             'Concepto' + #09 +
             'Per. / DOC.' + #09 +
             'Anticipado / Programado' +  #09 +
             'Impagado' +  #09 +
             'Vencido' +#09 +
             ''+ #09+
             'Programados / Anticipados'+ #09 +
             'Impagado'+#09 +
             'Vencido'+#09 +
             'Pend. de Afec. a Result. Cta. 6378'+ #09 +
             'Pago de Conceptos'+ #09 +
             'Moratorios'+ #09 +
             'Intereses Ordinarios'+ #09 +
             'Conceptos'+ #09 +
             'Intereses Moratorios'+ #09 +
             'Beneficio'+ #09 +
             'Fecha Alta'+ #09 +
             'Fecha Valor'+ #09 + //HERJA - SE AGREGA FECHA VALOR
             'Fecha Cancela'+ #09 +
             //HERJA
             vlFND_ENT_DES+ #09 +
             vlDESC_ENT_DES
             );
         Writeln(F, #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
             'Exigible' +#09 + // 1314 01
             'No Exigible'); // 1314 02
         Writeln(F, '');
      End;

      //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
      if grOpcion = grPreview then
         QrInCoCob2.Preview
      else if grOpcion = grPrint then
         QrInCoCob2.Print
      else if grOpcion = grDigitaliza then
      begin
         //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
         sDigDocFileName := 'INF_COB_CONT_'  + FormatDateTime( 'DD_MM_YYYY', StrToDate(sF_Inicio)) + '_' +
                            FormatDateTime( 'DD_MM_YYYY', StrToDate(sF_Final))     + '_' +
                            sProducto  + '_' + sMoneda   + '_' + sAcreditado + '_' +
                            sCatMinimo + '_' + sCredito  + '_' + sSitMov     + '_' +
                            sOrden     + '_' + sEmpresa  + '_' + sSucursal   + '_' +
                            sGpoProd   + '_' + BoolToStr( bIncTipoSec )      + '_' +
                            BoolToStr( bResumen ) + '_' + BoolToStr( bDetalleDD ) + '_' +
                            IntToStr( bPagoFIRA );
         QrInCoCob2.InterDigDoc1.RootDir  := obtValorGpoCve( 'CONFRH', 'ROOTDIR',   pApli );
         QrInCoCob2.InterDigDoc1.HostName := obtValorGpoCve( 'CONFRH', 'FTPSERVER', pApli );
         QrInCoCob2.InterDigDoc1.UserName := obtValorGpoCve( 'CONFRH', 'USERNAME',  pApli );
         QrInCoCob2.InterDigDoc1.Password := HexToStr( obtValorGpoCve( 'CONFRH', 'PASSWORD',  pApli ) );
         QrInCoCob2.InterDigDoc1.SendTo   := ObtSendTo( sF_Inicio );
         QrInCoCob2.InterDigDoc1.FileName := sArchivoDig; // sDigDocFileName; //<LOLS 17FEB2006. DIGITALIZACION DE REPORTES>
         QrInCoCob2.PrinterSettings.PrinterIndex := QrInCoCob2.InterDigDoc1.SetPrinter;
         QrInCoCob2.Print;

//       RUCJ4248: Con esta condición sabremos si un documento fue digitalizado o no?
//                En caso de que hubiera un error en la compresión o creación del archivo!
//       Para hacer el llenado de la tabla en la redigitalización.
         bDigitalizaCorrecta := ( QrInCoCob2.InterDigDoc1.Compress and QrInCoCob2.InterDigDoc1.SendFile);

//         QrInCoCob2.InterDigDoc1.Compress;
//         QrInCoCob2.InterDigDoc1.SendFile;
         QrInCoCob2.PrinterSettings.PrinterIndex := QrInCoCob2.InterDigDoc1.RestorePrinter;
      end;
        //If pPreview Then
        //    QrInCoCob2.Preview
        //Else
        //    QrInCoCob2.Print;
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

      If bGenArch Then ShowMessage('El Archivo se generó correctamente');
            
      QrInCoCob2.free;
      If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrInCoCob2.FormaQuery( sF_Inicio,sF_Final,sProducto,sMoneda,
                                sAcreditado, sCatMinimo, sCredito,
                                sSitMov, sOrden, sEmpresa, sSucursal, sGpoProd:String;
                                bIncTipoSec :Boolean;
                                bPagoFIRA : Integer):String;
Var
    sSQL                : String;
    sCrTransaccion      : String;
    sFhAlta             : String;
    sFiltroFO           : String;
Begin
      if ( Trim(sF_Inicio)<> '' ) and ( Trim(sF_Final)<> '' ) then
        sFiltroFO := ' CT.F_OPERACION BETWEEN ' + SQLFecha(StrToDate(sF_Inicio)) +
                     '                AND     ' + SQLFecha(StrToDate(sF_Final ));

    sSQL:=  ' SELECT ID_CREDITO         , NOMBRE              , '+ coCRLF +
            '        ID_PERIODO         , ID_DOCUMENTO        , '+ coCRLF +
            '        SIT_TRANSACCION    , CONCEPTO            , '+ coCRLF +
            '        CVE_MONEDA         , DESC_MONEDA         , '+ coCRLF +
            '        CVE_PRODUCTO_CRE   , DESC_L_PRODUCTO     , '+ coCRLF +
            '        CVE_TIPO_SECTOR    , CHEQUERA            , '+ coCRLF +
            '        CVE_CAT_MINIMO     , DESC_CAT_MINIMO     , '+ coCRLF +
            '        TIPO_CAMBIO        , CVE_USU_ALTA        , '+ coCRLF +
            '        ID_TRANSACCION     , CVE_ACCESORIO       , '+ coCRLF +
            '        SUBSTR(TO_CHAR(CVE_TIPO_MOVTO),1,2) AS CVE_TIPO_MOVTO    , SUBSTR(TO_CHAR(CVE_OPERACION),1,6) AS CVE_OPERACION       , '+ coCRLF +
            '        SUM(DECODE(CVE_CONCEPTO,''IMPBRU'',IMP_CONCEPTO,0)) IMPBRU, '+ coCRLF +
            '        SUM(DECODE(CVE_CONCEPTO,''IMPIVA'',IMP_CONCEPTO,0)) IMPIVA, '+ coCRLF +
            '        SUM(DECODE(CVE_CONCEPTO,''IMPMOR'',IMP_CONCEPTO,0)) IMPMOR, '+ coCRLF +
            '        SUM(DECODE(CVE_CONCEPTO,''IVAMOR'',IMP_CONCEPTO,0)) IVAMOR, '+ coCRLF +
            '        SUM(DECODE(CVE_CONCEPTO,''IMPBRU'',IMP_CONCEPTO,0)) COIMP , '+ coCRLF +
            '        SUM(DECODE(CVE_CONCEPTO,''IMPIVA'',IMP_CONCEPTO,0)) COIVA , '+ coCRLF +
            '        SUM(DECODE(CVE_CONCEPTO,''BENBCO'',IMP_CONCEPTO,0)) BENBCO, '+ coCRLF +
            '        SUM(DECODE(CVE_CONCEPTO,''BENGOB'',IMP_CONCEPTO,0)) BENGOB, '+ coCRLF +
            '        F_OPERACION FH_ALTA, FH_CANCELA           , '+ coCRLF +
            '        F_VALOR                                   ,       ' + coCRLF +  //HERJA - SE AGREGA FECHA VALOR
            '        DESC_COMISION      , ID_CESION            , '+ coCRLF +
            '        SALDO              , F_OPERACION          , '+ coCRLF +
            '        F_TRASPASO_VENC    , CVE_PRODUCTO_GPO     , '+ coCRLF +
            '        DESC_L_PROD_GPO    , CUENTA_VIGENTE_INT   , '+ coCRLF +
            '        CUENTA_VIGENTE_K   ' + coCRLF ;

          //HERJA - SE AGREGA FILTRO DE FONDEO
          if vlB_FONDEO = True then
          begin
             sSQL:= sSQL +
            '       ,''Ent. Desc.'' AS LEYENDA_ENT_DES' + coCRLF +
            '       ,CVE_FND_ENT_DES AS CVE_ENT_DES' + coCRLF +
            '       ,DESC_ENT_DES' + coCRLF ;
          end
          else
          begin
             sSQL:= sSQL +
            '       ,'' '' AS LEYENDA_ENT_DES' + coCRLF +
            '       ,'' '' AS CVE_ENT_DES' + coCRLF +
            '       ,'' '' AS DESC_ENT_DES' + coCRLF ;
          end;

             sSQL:= sSQL +
            ' FROM '+ coCRLF +
            '   ( SELECT '+ coCRLF +
            '           CC.ID_CREDITO           ,       M.CVE_MONEDA    ,' + coCRLF +
            '           M.DESC_MONEDA           ,       PT.CVE_TIPO_SECTOR      ,' + coCRLF +
            '           CP.CVE_PRODUCTO_CRE     ,       CP.DESC_L_PRODUCTO      ,' + coCRLF +
            '           CTO.ID_TITULAR          ,       PT.NOMBRE               ,' + coCRLF +
            '           CC.ID_PROM_ADM          ,       TRA.F_OPERACION         ,' + coCRLF +
            '           TRA.F_VALOR             ,' + coCRLF + //HERJA - SE AGREGA FECHA VALOR
            '           TRA.ID_PERIODO          ,       SUBSTR(TRA.ID_CTO_LIQ,1,20) CHEQUERA    ,' + coCRLF +
            '           TRA.TIPO_CAMBIO         ,       TRA.ID_TRANSACCION      ,' + coCRLF +
            '           TRA.CVE_USU_ALTA        ,       TRA.FH_CANCELA          ,' + coCRLF +
            '           TRA.SIT_TRANSACCION     ,       TRA.CVE_ACCESORIO       ,' + coCRLF +
            '           TRA.CVE_TIPO_MOVTO      ,       TRA.CVE_OPERACION       ,' + coCRLF +
{ROIM 03/01/2006 SE AGREGA SOLUCIÓN PARA PRESENTAR CANCELACIONES }
            '           TRA.CVE_OPERACION_ORI,     ' + coCRLF +
{ROIM}
            '           DECODE(TRA.CVE_TIPO_MOVTO,''AN'',TRA.DESC_C_OPERACION||'' ''||TRA.CVE_COMISION||'' Anticipado'',' + coCRLF +
            '                                     ''AV'',TRA.DESC_C_OPERACION||'' ''||TRA.CVE_COMISION||'' Anticipado'',' + coCRLF +
            '                                     ''MD'',TRA.DESC_C_OPERACION||'' ''||TRA.CVE_COMISION||'' Programado'',' + coCRLF +
            '                                     ''MV'',TRA.DESC_C_OPERACION||'' ''||TRA.CVE_COMISION||'' Programado'',' + coCRLF +
            '                                     ''CO'',TRA.DESC_C_OPERACION||'' ''||TRA.CVE_COMISION||'' En Cuentas de Orden'',' + coCRLF +  //HERJA MARZO 2013            
            '                                     DECODE(CC.F_TRASPASO_VENC,NULL,TRA.DESC_C_OPERACION||'' ''||TRA.CVE_COMISION||'' Impagado''  ,' + coCRLF +
            '                                                                    TRA.DESC_C_OPERACION||'' ''||TRA.CVE_COMISION||'' Vencido '')) CONCEPTO,' + coCRLF +
            '           TRA.CVE_CONCEPTO        ,       TRA.IMP_CONCEPTO        ,' + coCRLF +
            '           TRA.CVE_COMISION        ,       COM.DESC_COMISION       ,' + coCRLF +
            '           TRA.ID_CONTRATO         ,       PKGDPVISTASERV.SPTObtSaldo(TRA.ID_CTO_LIQ,''D000'') SALDO,' + coCRLF +
            '           TRA.ID_DOCUMENTO        ,       TRA.ID_TRANS_CANCELA    ,' + coCRLF +
            '           TRA.ID_CESION           ,       CC.F_TRASPASO_VENC      ,' + coCRLF +
            '           CM.CVE_CAT_MINIMO       ,       CM.DESC_CAT_MINIMO      ,' + coCRLF +
            '           TRA.SIT_AFECTACION      ,       CP.ID_EMPRESA           ,' + coCRLF +
            '           CP.CVE_PRODUCTO_GPO     ,       CPG.DESC_L_PROD_GPO     ,' + coCRLF +
            '           NVL(TABCTA.CUENTA_VIGENTE_K,TABCTAICRE.CVE_CTA_CONT_CAREVI) AS CUENTA_VIGENTE_K     ,'+
            '           NVL(TABCTA.CUENTA_VIGENTE_INT,TABCTAICRE.CVE_CTA_CONT_INREVI) AS CUENTA_VIGENTE_INT '+ coCRLF;

          //HERJA - SE AGREGA FILTRO DE FONDEO
          if vlB_FONDEO = True then
          begin
             sSQL:= sSQL +
            '       ,CFC.CVE_FND_ENT_DES ' + coCRLF +
            '       ,(SELECT DESC_ENT_DES FROM CR_FND_ENT_DES WHERE CVE_FND_ENT_DES = CFC.CVE_FND_ENT_DES ) AS DESC_ENT_DES' + coCRLF ;
          end;

             sSQL:= sSQL +
            '     FROM (SELECT * FROM CR_CREDITO) CC      ,' + coCRLF +
            '          (SELECT * FROM CR_CESION) CS       ,' + coCRLF +
            '          ( --ACTIVOS ' + coCRLF +
            '            SELECT ''AC'' SIT_AFECTACION     ,       CT.ID_CREDITO,' + coCRLF +
            '                   CT.F_OPERACION            ,       CT.ID_PERIODO,' + coCRLF +
            '                   CT.F_VALOR                ,       ' + coCRLF +  //HERJA - SE AGREGA FECHA VALOR
            '                   CT.ID_CTO_LIQ             ,       CT.TIPO_CAMBIO,' + coCRLF +
            '                   CT.ID_TRANSACCION         ,       CT.CVE_USU_ALTA,' + coCRLF +
            '                   CT.FH_CANCELA             ,       CT.SIT_TRANSACCION,' + coCRLF +
//HERJA MARZO 2013
//            '                   CT.CVE_TIPO_MOVTO         ,       CT.CVE_OPERACION,' + coCRLF +
	    '	        (CASE' + coCRLF +
	    '	             WHEN CO.CVE_ACCESORIO = ''IN''' + coCRLF +
	    '	                  THEN PKGCRCONTA.STPOBTCVE_TIPO_MOV(CT.ID_CREDITO, CT.CVE_OPERACION, CT.ID_PERIODO,' + coCRLF +
	    '		     	                                     CDT.CVE_CONCEPTO, CT.CVE_TIPO_MOVTO, CT.F_OPERACION)' + coCRLF +
	    '			  ELSE CT.CVE_TIPO_MOVTO' + coCRLF +
	    '		     END' + coCRLF +
	    '		 ) CVE_TIPO_MOVTO,       CT.CVE_OPERACION,' + coCRLF +
//FIN HERJA MARZO 2013
            '                   CT.CVE_COMISION           ,       CT.ID_CONTRATO,' + coCRLF +
            '                   CT.ID_DOCUMENTO           ,       CT.ID_TRANS_CANCELA,' + coCRLF +
            '                   CT.ID_CESION              ,' + coCRLF +
            '                   CDT.CVE_CONCEPTO          ,       CDT.IMP_CONCEPTO  ,' + coCRLF +
            '                   CO.CVE_ACCESORIO          ,       CO.DESC_C_OPERACION      ' + coCRLF +
{ROIM 03/01/2006 SE AGREGA SOLUCIÓN PARA PRESENTAR CANCELACIONES }
            '                  ,CO.CVE_OPERACION CVE_OPERACION_ORI     ' + coCRLF +
{ROIM}
            '            FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_OPERACION CO' + coCRLF +
            '            WHERE  ' + sFiltroFO + coCRLF +
            '              AND ( CT.SIT_TRANSACCION = ''AC'')'+ coCRLF + //AND ID_TRANS_CANCELA IS NULL)' + coCRLF + EASA4011       13122004
            '              AND CO.CVE_AFEC_SALDO    = ''I''' + coCRLF +
            '              AND CO.CVE_ACCESORIO NOT IN (''CR'')' + coCRLF +
            '              AND   CDT.ID_TRANSACCION = CT.ID_TRANSACCION' + coCRLF +
            '              AND   CO.CVE_OPERACION = CT.CVE_OPERACION' + coCRLF +
            '           UNION' + coCRLF +
            '            --CANCELADOS' + coCRLF +
            '            SELECT ''CA'' SIT_AFECTACION     ,       CT.ID_CREDITO,' + coCRLF +
            '                   CT.F_OPERACION            ,       CT.ID_PERIODO,' + coCRLF +
            '                   CT.F_VALOR                ,       ' + coCRLF +  //HERJA - SE AGREGA FECHA VALOR
            '                   CT.ID_CTO_LIQ             ,       CT.TIPO_CAMBIO,' + coCRLF +
            '                   CT.ID_TRANSACCION         ,       CT.CVE_USU_ALTA,' + coCRLF +
            '                   NVL(TRUNC(CT.FH_CANCELA),F_OPERACION) FH_CANCELA,' + coCRLF +
//HERJA MARZO 2013
//            '                   CT.SIT_TRANSACCION        ,       CT.CVE_TIPO_MOVTO,' + coCRLF +
            '                   CT.SIT_TRANSACCION        ,      ' + coCRLF +
	    '	        (CASE' + coCRLF +
	    '	             WHEN CO.CVE_ACCESORIO = ''IN''' + coCRLF +
	    '	                  THEN PKGCRCONTA.STPOBTCVE_TIPO_MOV(CT.ID_CREDITO, CT.CVE_OPERACION, CT.ID_PERIODO,' + coCRLF +
	    '		     	                                     CDT.CVE_CONCEPTO, CT.CVE_TIPO_MOVTO, CT.F_OPERACION)' + coCRLF +
	    '			  ELSE CT.CVE_TIPO_MOVTO' + coCRLF +
	    '		     END' + coCRLF +
	    '		 ) CVE_TIPO_MOVTO,     ' + coCRLF +
//FIN HERJA MARZO 2013
            '                   CT.CVE_OPERACION          ,       CT.CVE_COMISION,' + coCRLF +
            '                   CT.ID_CONTRATO            ,       CT.ID_DOCUMENTO,' + coCRLF +
            '                   CT.ID_TRANS_CANCELA       ,       CT.ID_CESION,' + coCRLF +
            '                   CDT.CVE_CONCEPTO          ,       CDT.IMP_CONCEPTO,' + coCRLF +
            '                   CO.CVE_ACCESORIO          ,       CO.DESC_C_OPERACION' + coCRLF +
{ROIM 03/01/2006 SE AGREGA SOLUCIÓN PARA PRESENTAR CANCELACIONES }
            '                  ,CO.CVE_OPERACION CVE_OPERACION_ORI     ' + coCRLF +
{ROIM}
            '            FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_OPERACION CO' + coCRLF +
            '            WHERE  ' + sFiltroFO + coCRLF +
            '              AND CT.SIT_TRANSACCION = ''CA''' + coCRLF +
            '              AND CO.CVE_AFEC_SALDO    = ''I''' + coCRLF +
            '              AND CO.CVE_ACCESORIO NOT IN (''CR'')' + coCRLF +
            '              AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION' + coCRLF +
            '              AND CO.CVE_OPERACION = CT.CVE_OPERACION' + coCRLF +
            '          UNION' + coCRLF +
            '            SELECT ''CA'' SIT_AFECTACION     ,       CT.ID_CREDITO,' + coCRLF +
            '                   CT.F_OPERACION            ,       CT.ID_PERIODO,' + coCRLF +
            '                   CT.F_VALOR                ,       ' + coCRLF +  //HERJA - SE AGREGA FECHA VALOR
            '                   CT.ID_CTO_LIQ             ,       CT.TIPO_CAMBIO,' + coCRLF +
            '                   CT.ID_TRANSACCION         ,       CT.CVE_USU_ALTA,' + coCRLF +
            '                   NVL(TRUNC(CT.FH_CANCELA),CTC.F_OPERACION) FH_CANCELA,' + coCRLF +
//HERJA MARZO 2013
//            '                   CT.SIT_TRANSACCION        ,       CT.CVE_TIPO_MOVTO,' + coCRLF +
            '                   CT.SIT_TRANSACCION        ,      ' + coCRLF +
	    '	        (CASE' + coCRLF +
	    '	             WHEN CO.CVE_ACCESORIO = ''IN''' + coCRLF +
	    '	                  THEN PKGCRCONTA.STPOBTCVE_TIPO_MOV(CT.ID_CREDITO, CT.CVE_OPERACION, CT.ID_PERIODO,' + coCRLF +
	    '		     	                                     CDT.CVE_CONCEPTO, CT.CVE_TIPO_MOVTO, CT.F_OPERACION)' + coCRLF +
	    '			  ELSE CT.CVE_TIPO_MOVTO' + coCRLF +
	    '		     END' + coCRLF +
	    '		 ) CVE_TIPO_MOVTO,     ' + coCRLF +
//FIN HERJA MARZO 2013
            '                   CT.CVE_OPERACION          ,       CT.CVE_COMISION,' + coCRLF +
            '                   CT.ID_CONTRATO            ,       CT.ID_DOCUMENTO,' + coCRLF +
            '                   CT.ID_TRANS_CANCELA       ,       CT.ID_CESION,' + coCRLF +
            '                   CDT.CVE_CONCEPTO          ,       CDT.IMP_CONCEPTO,' + coCRLF +
            '                   CO.CVE_ACCESORIO          ,       CO.DESC_C_OPERACION' + coCRLF +
{ROIM 03/01/2006 SE AGREGA SOLUCIÓN PARA PRESENTAR CANCELACIONES }
            '                  ,CO.CVE_OPERACION CVE_OPERACION_ORI     ' + coCRLF +
{ROIM}
            '            FROM CR_TRANSACCION CT, CR_TRANSACCION CTC, CR_DET_TRANSAC CDT, CR_OPERACION CO' + coCRLF +
            '            WHERE  ' + sFiltroFO + coCRLF +
            '              AND CT.SIT_TRANSACCION = ''AC''' + coCRLF +
            '              AND CO.CVE_AFEC_SALDO    = ''I''' + coCRLF +
            '              AND CO.CVE_ACCESORIO NOT IN (''CR'')' + coCRLF +
{ROIM 17/01/2006 SE AGREGA JOIN A TABLA DE OPERACIÓN PARA EVITAR DOBLE REGISTRO }
            '              AND CO.CVE_OPERACION= CTC.CVE_OPERACION ' + coCRLF +
{ROIM}
            '              AND CTC.ID_TRANSACCION = CT.ID_TRANS_CANCELA' + coCRLF +
            '              AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION' + coCRLF +
            '              AND CO.CVE_OPER_CANCELA  = CT.CVE_OPERACION' + coCRLF +
            '          ) TRA,' + coCRLF +
            '          ( SELECT CCTO.*, CPRO.ID_EMPRESA' + coCRLF +
            '            FROM   CR_PRODUCTO CPRO, CR_CONTRATO CCTO' + coCRLF +
            '            WHERE  CPRO.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE' + coCRLF +
            '          ) CRCTO,              CR_PRODUCTO        CP  ,'+ coCRLF +
            '          CR_PRODUCTO_GPO CPG , CONTRATO           CTO ,' + coCRLF +
            '          MONEDA          M   , PERSONA            PT  ,' + coCRLF +
            '          PERSONA         PP  , CR_CAT_COMISION    COM ,' + coCRLF +
            '          CR_CAT_MINIMO   CM  , ' + coCRLF +

            //Para Obtener cuentas de Contabilidad
            C_QUERY_CTAS_ICRE +
            C_QUERY_CTAS ;

          //HERJA - SE AGREGA FILTRO DE FONDEO
          if vlB_FONDEO=True then
          begin
             sSQL:= sSQL +
            '          ,CR_FND_CREDITO CFC ' + coCRLF ;
          end;

        sSQL:= sSQL +
            '     WHERE CS.ID_CESION(+)                = CC.ID_CREDITO' + coCRLF +
            '       AND TRA.ID_CREDITO                 = CC.ID_CREDITO' + coCRLF +
            '       AND CRCTO.ID_CONTRATO              = CC.ID_CONTRATO' + coCRLF +
            '       AND CRCTO.FOL_CONTRATO             = CC.FOL_CONTRATO' + coCRLF +
            '       AND CP.CVE_PRODUCTO_CRE            = CRCTO.CVE_PRODUCTO_cRE' + coCRLF +
            '       AND CPG.CVE_PRODUCTO_GPO           = CP.CVE_PRODUCTO_GPO   ' + coCRLF +
            '       AND CTO.ID_CONTRATO                = CRCTO.ID_CONTRATO' + coCRLF +
            '       AND M.CVE_MONEDA                   = CTO.CVE_MONEDA' + coCRLF +
            '       AND PT.ID_PERSONA                  = CTO.ID_TITULAR' + coCRLF +
            '       AND PP.ID_PERSONA                  = CC.ID_PROM_ADM' + coCRLF +
            '       AND COM.CVE_COMISION(+)            = TRA.CVE_COMISION' + coCRLF +
            '       AND CM.CVE_CAT_MINIMO              = CP.CVE_CLAS_CONTAB' + coCRLF +
            '       AND TABCTAICRE.ID_EMPRESA(+)       = CRCTO.ID_EMPRESA'+ coCRLF +
            '       AND TABCTAICRE.CVE_PRODUCTO_CRE (+)= CRCTO.CVE_PRODUCTO_CRE'+ coCRLF +
            '       AND TABCTAICRE.CVE_MONEDA(+)       = CRCTO.CVE_MONEDA'+ coCRLF +
            '       AND TABCTA.CVE_PRODUCTO_CRE(+)     = CP.CVE_PRODUCTO_CRE ' + coCRLF ;

          //HERJA - SE AGREGA FILTRO DE FONDEO
          if vlB_FONDEO=True then
          begin
             sSQL:= sSQL +
            '       AND CC.ID_CREDITO = CFC.ID_CREDITO ' + coCRLF +
            '       AND CFC.SIT_CREDITO = ''AC'' ' + coCRLF +
            '       AND CFC.PCT_REDESCONTADO > 0 ' + coCRLF ;            
          end;

        sSQL:= sSQL +
            '           )';
    //BINTER  //FIRA
    if ((bPagoFIRA = 0) or (bPagoFIRA = 1)) then
    begin
        sSQL:= sSQL +
            '  TEMP1,' + coCRLF +
            '      (SELECT CVE_PRODUCTO CVE_PRODUCTO_CCO,CVE_MONEDA CVE_MONEDA_CCO,CVE_OPERACION CVE_OPERACION_CCO' + coCRLF +
            '       FROM CR_CVE_OPERACION' + coCRLF +
            '       WHERE CVE_PARAMETRO ';

        if bPagoFIRA = 0 then
        begin
           sSQL:= sSQL +
               ' NOT ' + coCRLF;
        end;

        sSQL:= sSQL +
            'IN (''RCGFCP'',''RCGFIN'',''RCGFCN'',''RCGFFN''))   CCO';
    end;

    sSQL:= sSQL +
            ' WHERE 1=1 '+ coCRLF;

    if ((bPagoFIRA = 0) or (bPagoFIRA = 1)) then
    begin
        sSQL:= sSQL +
            '   AND   CCO.CVE_PRODUCTO_CCO  = TEMP1.CVE_PRODUCTO_CRE' + coCRLF +
            '   AND   CCO.CVE_MONEDA_CCO    = TEMP1.CVE_MONEDA' + coCRLF +
{ROIM 03/01/2006 SE AGREGA SOLUCIÓN PARA PRESENTAR CANCELACIONES }
            '   AND   CCO.CVE_OPERACION_CCO = TEMP1.CVE_OPERACION_ORI';
{ROIM}
    end;

    If (Trim(sSitMov) <> '') Then
        sSQL:= sSQL + ' AND SIT_AFECTACION  =  ' + SQLStr(sSitMov );
    If (Trim(sProducto)<>'') Then
        sSQL:= sSQL + ' AND  CVE_PRODUCTO_CRE ='''+sProducto+'''' + coCRLF ;
    If (Trim(sMoneda)<>'') Then
        sSQL:= sSQL + ' AND  CVE_MONEDA  ='+sMoneda + coCRLF ;
    If (Trim(sAcreditado)<>'') Then
        sSQL:= sSQL + ' AND  ID_TITULAR  ='+ sAcreditado + coCRLF ;
    If (Trim(sCredito)<>'') Then
        sSQL:= sSQL + ' AND  ID_CREDITO ='+ sCredito + coCRLF ;
    If (Trim(sEmpresa)<>'') Then
        sSQL:= sSQL + ' AND  ID_EMPRESA ='+ Trim(sEmpresa) + coCRLF ;
    If (Trim(sGpoProd)<>'') Then
        sSQL:= sSQL + ' AND  CVE_PRODUCTO_GPO ='+ SQLStr(Trim(sGpoProd)) + coCRLF ;

    sSQL:= sSQL + ' GROUP BY ID_PERIODO      ,   TIPO_CAMBIO     ,   ID_TRANSACCION  ,   CVE_USU_ALTA     ,'+ coCRLF +
                  ' FH_CANCELA      ,   SIT_TRANSACCION ,   CVE_ACCESORIO    ,'+ coCRLF +
                  ' CVE_TIPO_MOVTO  ,   CVE_OPERACION   ,   CONCEPTO        ,   CVE_MONEDA       ,'+ coCRLF +
                  ' DESC_MONEDA     ,   CVE_PRODUCTO_CRE,   DESC_L_PRODUCTO ,   ID_CREDITO       ,'+ coCRLF +
                  ' ID_CONTRATO     ,   NOMBRE          ,   CHEQUERA        ,   SALDO            ,'+ coCRLF +
                  ' DESC_COMISION   ,   ID_DOCUMENTO    ,   ID_CESION       ,   ID_TITULAR       ,'+ coCRLF +
                  ' F_OPERACION     ,   CVE_TIPO_SECTOR ,   CVE_CAT_MINIMO  ,   DESC_CAT_MINIMO  ,'+ coCRLF +
                  ' F_TRASPASO_VENC ,   CVE_PRODUCTO_GPO,   DESC_L_PROD_GPO ,   CUENTA_VIGENTE_INT,'+ coCRLF +
                  ' CUENTA_VIGENTE_K,   '+ coCRLF +
                  ' F_VALOR   '+ coCRLF ;    //HERJA - SE AGREGA FECHA VALOR

          //HERJA - SE AGREGA FILTRO DE FONDEO
          if vlB_FONDEO=True then
          begin
             sSQL:= sSQL +
            '       , CVE_FND_ENT_DES, DESC_ENT_DES ' + coCRLF ;
          end;

    sSQL:= sSQL + ' ORDER BY CVE_MONEDA,DESC_L_PRODUCTO,';

    if bIncTipoSec then
        sSQL:= sSQL + ' CVE_TIPO_SECTOR,'+ coCRLF ;

    IF sOrden = 'D' THEN
       sSQL:= sSQL + ' ID_CREDITO, NOMBRE'+ coCRLF
    ELSE
       sSQL:= sSQL + ' NOMBRE, ID_CREDITO '+ coCRLF ;
    //END IF

    Result:= sSQL;

End;

procedure TQrInCoCob2.qyInfCobContaCalcFields(DataSet: TDataSet);
Var
    sFecha:String;
begin
    If (Trim(qyInfCobContaID_CESION.AsString) = '')OR (Trim(qyInfCobContaID_CESION.AsString) = '0') Then Begin
        QRLProveedor.Enabled:=False;
        qyInfCobContaPER_DOC.AsString:=qyInfCobContaID_PERIODO.AsString;
    End Else Begin
        qyInfCobContaPER_DOC.AsString:=qyInfCobContaID_PERIODO.AsString + ' / ' +qyInfCobContaID_DOCUMENTO.AsString;
    End;
    sFecha:= FormatDateTime('dd/mm/yy hh:mm AM/PM',qyInfCobContaFH_ALTA.AsDateTime);

    If ( qyInfCobContaCVE_ACCESORIO.AsString='CP' ) OR ( qyInfCobContaCVE_ACCESORIO.AsString='FN' )Then
    Begin
{ROIM 23/11/2005 SE REASIGNA EL CAMPO TIPO DE MOVIMIENTO}
//        If ( qyInfCobContaCVE_TIPO_MOVTO.AsString='AN' ) OR (qyInfCobContaCVE_TIPO_MOVTO.AsString='MD') OR
//           ( qyInfCobContaCVE_TIPO_MOVTO.AsString='AV' ) OR (qyInfCobContaCVE_TIPO_MOVTO.AsString='MV') Then
//            qyInfCobContaCAP_ANT_PROG.AsFloat:= qyInfCobContaIMPBRU.AsFloat
//        Else If ( qyInfCobContaCVE_TIPO_MOVTO.AsString='IM' ) OR ( qyInfCobContaCVE_TIPO_MOVTO.AsString='IV' ) Then
//           Begin
//              if qyInfCobContaF_TRASPASO_VENC.AsString <> '' THEN
//              Begin
//                 If ( qyInfCobContaCVE_TIPO_MOVTO.AsString='AN') OR (qyInfCobContaCVE_TIPO_MOVTO.AsString='MD' ) OR
//                    ( qyInfCobContaCVE_TIPO_MOVTO.AsString='AV' ) OR (qyInfCobContaCVE_TIPO_MOVTO.AsString='MV') Then
//                    qyInfCobContaCAP_VEN_NOEX.AsFloat:= qyInfCobContaIMPBRU.AsFloat
//                 else qyInfCobContaCAP_VEN_EXIG.AsFloat:= qyInfCobContaIMPBRU.AsFloat;
//              end
//              else qyInfCobContaCAP_IMP.AsFloat:= qyInfCobContaIMPBRU.AsFloat
//           end

        if (qyInfCobContaCVE_TIPO_MOVTO.AsString='AN') then
            qyInfCobContaCAP_ANT_PROG.AsFloat:= qyInfCobContaIMPBRU.AsFloat;
        if (qyInfCobContaCVE_TIPO_MOVTO.AsString='MD') then
            qyInfCobContaCAP_ANT_PROG.AsFloat:= qyInfCobContaIMPBRU.AsFloat;
        if (qyInfCobContaCVE_TIPO_MOVTO.AsString='AV') then
            qyInfCobContaCAP_VEN_NOEX.AsFloat:= qyInfCobContaIMPBRU.AsFloat;
        if (qyInfCobContaCVE_TIPO_MOVTO.AsString='MV') then
            qyInfCobContaCAP_VEN_NOEX.AsFloat:= qyInfCobContaIMPBRU.AsFloat;
        if (qyInfCobContaCVE_TIPO_MOVTO.AsString='IM') then
            qyInfCobContaCAP_IMP.AsFloat:= qyInfCobContaIMPBRU.AsFloat;
        if (qyInfCobContaCVE_TIPO_MOVTO.AsString='IV') then
            qyInfCobContaCAP_VEN_EXIG.AsFloat:= qyInfCobContaIMPBRU.AsFloat;

        qyInfCobContaIVA_MOR.AsFloat:= qyInfCobContaIVAMOR.AsFloat;
{/ROIM}
    End
    Else If qyInfCobContaCVE_ACCESORIO.AsString='IN' Then
    Begin
{ROIM 23/11/2005 SE REASIGNA EL CAMPO TIPO DE MOVIMIENTO}
//        If (qyInfCobContaCVE_TIPO_MOVTO.AsString='AN') OR (qyInfCobContaCVE_TIPO_MOVTO.AsString='MD')  OR
//           ( qyInfCobContaCVE_TIPO_MOVTO.AsString='AV' ) OR (qyInfCobContaCVE_TIPO_MOVTO.AsString='MV') Then Begin
//            qyInfCobContaINT_ANT_PROG.AsFloat:= qyInfCobContaIMPBRU.AsFloat;
//        End Else If ( qyInfCobContaCVE_TIPO_MOVTO.AsString='IM' ) OR ( qyInfCobContaCVE_TIPO_MOVTO.AsString='IV' ) Then Begin
//              if qyInfCobContaF_TRASPASO_VENC.AsString <> '' THEN
//              Begin
//                 If ( qyInfCobContaCVE_TIPO_MOVTO.AsString='AN') OR (qyInfCobContaCVE_TIPO_MOVTO.AsString='MD')  OR
//                    ( qyInfCobContaCVE_TIPO_MOVTO.AsString='AV' ) OR (qyInfCobContaCVE_TIPO_MOVTO.AsString='MV') Then
//                    qyInfCobContaINT_PEN_AFEC_RES.AsFloat:= qyInfCobContaIMPBRU.AsFloat
//                 else qyInfCobContaINT_VENC.AsFloat:= qyInfCobContaIMPBRU.AsFloat;
//              end
//              else qyInfCobContaINT_IMP.AsFloat:= qyInfCobContaIMPBRU.AsFloat;
//        End;

        if (qyInfCobContaCVE_TIPO_MOVTO.AsString='AN') then
            qyInfCobContaINT_ANT_PROG.AsFloat:= qyInfCobContaIMPBRU.AsFloat;
        if (qyInfCobContaCVE_TIPO_MOVTO.AsString='MD') then
            qyInfCobContaINT_ANT_PROG.AsFloat:= qyInfCobContaIMPBRU.AsFloat;
        if (qyInfCobContaCVE_TIPO_MOVTO.AsString='AV') then
            qyInfCobContaINT_PEN_AFEC_RES.AsFloat:= qyInfCobContaIMPBRU.AsFloat;
        if (qyInfCobContaCVE_TIPO_MOVTO.AsString='MV') then
            qyInfCobContaINT_PEN_AFEC_RES.AsFloat:= qyInfCobContaIMPBRU.AsFloat;
        if (qyInfCobContaCVE_TIPO_MOVTO.AsString='CO') then
            qyInfCobContaINT_PEN_AFEC_RES.AsFloat:= qyInfCobContaIMPBRU.AsFloat;            
        if (qyInfCobContaCVE_TIPO_MOVTO.AsString='IM') then
            qyInfCobContaINT_IMP.AsFloat:= qyInfCobContaIMPBRU.AsFloat;
        if (qyInfCobContaCVE_TIPO_MOVTO.AsString='IV') then
            qyInfCobContaINT_VENC.AsFloat:= qyInfCobContaIMPBRU.AsFloat;
{ / EASA 20/01/2005     SE ADICIONÓ MOSTRAR EL IMPORTE DE IVA DE INTERES Y EL IVA DE MORATORIOS DE INTERES}

        qyInfCobContaIVA_INT.AsFloat:= qyInfCobContaIMPIVA.AsFloat;
        qyInfCobContaIVA_MOR.AsFloat:= qyInfCobContaIVAMOR.AsFloat;
{ / EASA 20/01/2005 }

{/ROIM}
    End
    Else If qyInfCobContaCVE_ACCESORIO.AsString='CN' Then
    Begin
            qyInfCobContaPAGO_CONCEPTOS.AsFloat:= qyInfCobContaCOIMP.AsFloat;
            qyInfCobContaIVA_CO.AsFloat := qyInfCobContaCOIVA.AsFloat;
    End;
    QRDBTSituacion.Enabled := False; //ales
    QRDBTSituacion.Visible := True;//ales
   //EASA4011 29122004
   if ( not( bDetDD ) AND (qyInfCobContaID_DOCUMENTO.AsString <> '') )then
   Begin
       qrbCONCEPTOS.Enabled := False;
   end
   else if ( not( bDetDD ) AND (qyInfCobContaID_DOCUMENTO.AsString = '') )then
   Begin
      if not bQrResumen then
         qrbCONCEPTOS.Enabled := True
      else qrbCONCEPTOS.Enabled := False;
   end;

end;

procedure TQrInCoCob2.qrbCONCEPTOSBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
Var
   sRegistro: String;
   iImporte1: Double;
begin

   QRDBText33.Visible := qyInfCobContaFH_CANCELA.AsString <> '';
   QRDBText33.Enabled := qyInfCobContaFH_CANCELA.AsString <> '';

   QRDBTxtCAP_ANT_PROG.Enabled := qyInfCobContaCAP_ANT_PROG.AsFloat <> 0;
   QRDBTxtCAP_IMP.Enabled := qyInfCobContaCAP_IMP.AsFloat <> 0;
   QRDBTxtCAP_VEN_EXIG.Enabled := qyInfCobContaCAP_VEN_EXIG.AsFloat <> 0;
   QRDBTxtCAP_VEN_NOEX.Enabled := qyInfCobContaCAP_VEN_NOEX.AsFloat <> 0;
   QRDBTxtINT_ANT_PROG.Enabled := qyInfCobContaINT_ANT_PROG.AsFloat <> 0;
   QRDBTxtINT_IMP.Enabled := qyInfCobContaINT_IMP.AsFloat <> 0;
   QRDBTxtINT_VENC.Enabled := qyInfCobContaINT_VENC.AsFloat <> 0;
   QRDBTxtINT_PEN_AFEC_RES.Enabled := qyInfCobContaINT_PEN_AFEC_RES.AsFloat <> 0;
   QRDBTxtPAGO_CONCEPTOS.Enabled := qyInfCobContaPAGO_CONCEPTOS.AsFloat <> 0;
   QRDBTxtIMPMOR.Enabled := qyInfCobContaIMPMOR.AsFloat <> 0;
   QRDBTxtIVA_INT.Enabled := qyInfCobContaIVA_INT.AsFloat <> 0;
   QRDBTxtIVA_CO.Enabled := qyInfCobContaCOIVA.AsFloat <> 0;
   QRDBTxtIVA_MOR.Enabled := qyInfCobContaIVA_MOR.AsFloat <> 0;
   QRDBTxtBENBCO.Enabled := qyInfCobContaBENBCO.AsFloat <> 0;

   //HERJA
   if vlB_FONDEO=true then
   begin
      QRDBText19.Visible:=true;
      QRDBText19.Enabled:=true;
   end
   else
   begin
      QRDBText19.Visible:=false;
      QRDBText19.Enabled:=false;
   end;

   If (sArchivo <>'')and (not bQrResumen) Then Begin

      sRegistro:=
                 qyInfCobConta.FieldByName('CVE_MONEDA').AsString + #09 +
                 qyInfCobConta.FieldByName('DESC_MONEDA').AsString + #09 +
                 qyInfCobConta.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
                 qyInfCobConta.FieldByName('DESC_L_PRODUCTO').AsString + #09 +
                 qyInfCobConta.FieldByName('CVE_TIPO_SECTOR').AsString + #09 +
                 qyInfCobConta.FieldByName('ID_CREDITO').AsString + #09 +
                 qyInfCobConta.FieldByName('NOMBRE').AsString + #09 +
                 qyInfCobConta.FieldByName('CHEQUERA').AsString + #09 +
                 qyInfCobConta.FieldByName('CVE_CAT_MINIMO').AsString + #09 +
                 qyInfCobConta.FieldByName('DESC_CAT_MINIMO').AsString + #09 +
                 qyInfCobConta.FieldByName('TIPO_CAMBIO').AsString + #09 +
                 qyInfCobConta.FieldByName('CVE_USU_ALTA').AsString + #09 +
                 qyInfCobConta.FieldByName('CONCEPTO').AsString + #09 +
                 qyInfCobConta.FieldByName('PER_DOC').AsString + #09;

      If QRDBTxtCAP_ANT_PROG.Enabled Then
         sRegistro:= sRegistro + FormatFloat('###,###,###,##0.00',qyInfCobConta.FieldByName('CAP_ANT_PROG').AsFloat) + #09
      Else sRegistro:= sRegistro + #09;

      If QRDBTxtCAP_IMP.Enabled Then
         sRegistro:= sRegistro + FormatFloat('###,###,###,##0.00',qyInfCobConta.FieldByName('CAP_IMP').AsFloat) + #09
      Else sRegistro:= sRegistro + #09;

      If QRDBTxtCAP_VEN_EXIG.Enabled Then
         sRegistro:= sRegistro + FormatFloat('###,###,###,##0.00',qyInfCobConta.FieldByName('CAP_VEN_EXIG').AsFloat) + #09
      Else sRegistro:= sRegistro + #09;

      If QRDBTxtCAP_VEN_NOEX.Enabled Then
         sRegistro:= sRegistro + FormatFloat('###,###,###,##0.00',qyInfCobConta.FieldByName('CAP_VEN_NOEX').AsFloat) + #09
      Else sRegistro:= sRegistro + #09;

      If QRDBTxtINT_ANT_PROG.Enabled Then
         sRegistro:= sRegistro + FormatFloat('###,###,###,##0.00',qyInfCobConta.FieldByName('INT_ANT_PROG').AsFloat) + #09
      Else sRegistro:= sRegistro + #09;

      If QRDBTxtINT_IMP.Enabled Then
         sRegistro:= sRegistro + FormatFloat('###,###,###,##0.00',qyInfCobConta.FieldByName('INT_IMP').AsFloat) + #09
      Else sRegistro:= sRegistro + #09;

      If QRDBTxtINT_VENC.Enabled Then
         sRegistro:= sRegistro + FormatFloat('###,###,###,##0.00',qyInfCobConta.FieldByName('INT_VENC').AsFloat) + #09
      Else sRegistro:= sRegistro + #09;

      If QRDBTxtINT_PEN_AFEC_RES.Enabled Then
         sRegistro:= sRegistro + FormatFloat('###,###,###,##0.00',qyInfCobConta.FieldByName('INT_PEN_AFEC_RES').AsFloat) + #09
      Else sRegistro:= sRegistro + #09;

      If QRDBTxtPAGO_CONCEPTOS.Enabled Then
         sRegistro:= sRegistro + FormatFloat('###,###,###,##0.00',qyInfCobConta.FieldByName('PAGO_CONCEPTOS').AsFloat) + #09
      Else sRegistro:= sRegistro + #09;

      If QRDBTxtIMPMOR.Enabled Then
         sRegistro:= sRegistro + FormatFloat('###,###,###,##0.00',qyInfCobConta.FieldByName('IMPMOR').AsFloat) + #09
      Else sRegistro:= sRegistro + #09;

      If QRDBTxtIVA_INT.Enabled Then
         sRegistro:= sRegistro + FormatFloat('###,###,###,##0.00',qyInfCobConta.FieldByName('IVA_INT').AsFloat) + #09
      Else sRegistro:= sRegistro + #09;

      If QRDBTxtIVA_CO.Enabled Then
         sRegistro:= sRegistro + FormatFloat('###,###,###,##0.00',qyInfCobConta.FieldByName('IVA_CO').AsFloat) + #09
      Else sRegistro:= sRegistro + #09;

      If QRDBTxtIVA_MOR.Enabled Then
         sRegistro:= sRegistro + FormatFloat('###,###,###,##0.00',qyInfCobConta.FieldByName('IVA_MOR').AsFloat) + #09
      Else sRegistro:= sRegistro + #09;

      If QRDBTxtBENBCO.Enabled Then
         sRegistro:= sRegistro + FormatFloat('###,###,###,##0.00',qyInfCobConta.FieldByName('BENBCO').AsFloat) + #09
      Else sRegistro:= sRegistro + #09;

      If qyInfCobConta.FieldByName('FH_ALTA').AsDateTime > 0 Then
         sRegistro:= sRegistro + FormatDateTime('dd/mm/yyyy',qyInfCobConta.FieldByName('FH_ALTA').AsDateTime) + #09
      Else sRegistro:= sRegistro + #09;

      //HERJA - SE AGREGA FECHA VALOR
      If qyInfCobConta.FieldByName('F_VALOR').AsDateTime > 0 Then
         sRegistro:= sRegistro + FormatDateTime('dd/mm/yyyy',qyInfCobConta.FieldByName('F_VALOR').AsDateTime) + #09
      Else sRegistro:= sRegistro + #09;

      If QRDBText33.Enabled Then
         sRegistro:= sRegistro + FormatDateTime('dd/mm/yyyy',qyInfCobConta.FieldByName('FH_CANCELA').AsDateTime) + #09
      Else sRegistro:= sRegistro + #09;


      //HERJA
      If QRDBText19.Enabled Then
         sRegistro:= sRegistro + qyInfCobConta.FieldByName('CVE_ENT_DES').AsString + #09 + qyInfCobConta.FieldByName('DESC_ENT_DES').AsString + #09
      Else sRegistro:= sRegistro + #09;

      Writeln(F, sRegistro);

   End;
end;

procedure TQrInCoCob2.QRFooterCesionBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09 +'Total por Crédito' + #09#09#09#09#09#09#09#09#09#09#09#09#09 +
                 FormatFloat('###,###,###,##0.00',QRExpr2.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr3.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr16.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr1.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr17.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr18.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr19.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr20.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr21.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr22.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr23.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr24.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr25.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr26.Value.dblResult) + #09 +
                 'TOTAL' + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr98.Value.dblResult));
   End;
end;

procedure TQrInCoCob2.QRFooterProductoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      If bQrResumen Then Begin
         Writeln(F,  #09 +'Producto' + #09 +
                    qyInfCobConta.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
                    qyInfCobConta.FieldByName('DESC_L_PRODUCTO').AsString);
      End;
      Writeln(F, #09 +'Total por Producto' + #09#09#09#09#09#09#09#09#09#09#09#09#09 +
                 FormatFloat('###,###,###,##0.00',QRExpr14.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr15.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr27.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr13.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr28.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr29.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr30.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr31.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr32.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr33.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr34.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr35.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr36.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr37.Value.dblResult) + #09 +
                 'TOTAL' + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr100.Value.dblResult));
      Writeln(F, '');
   End;
end;

procedure TQrInCoCob2.QRFooterMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin

      Writeln(F, #09 +'Total por Moneda' + #09#09#09 +
                 qyInfCobConta.FieldByName('DESC_MONEDA').AsString + #09#09#09#09#09#09#09#09#09#09 +
                 FormatFloat('###,###,###,##0.00',QRExpr53.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr54.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr55.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr52.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr56.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr57.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr58.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr59.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr60.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr61.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr62.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr63.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr64.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr65.Value.dblResult) + #09 +
                 'TOTAL' + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr103.Value.dblResult));
   End;
end;

procedure TQrInCoCob2.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If qyInfCobConta.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

End.
