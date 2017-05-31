// Modificaciones : 03 08 2005

// Modificaciones : 30 06 2006 LOLS SE AGREGA FILTRO PARA DISMINUIR TIEMPO DE GENERACION
unit IntMQrContVenc;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, unSQL2,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, Dialogs, IntGenCre, U_InterCustomStar, U_InterDigDoc, uRedigitalizacion;
Const
   coCRLF       = #13#10;
   sCveGpoComis = 'FOMENT';
type
  TQrContVenc = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRShape7: TQRShape;
    QRLabel22: TQRLabel;
    QRShape8: TQRShape;
    QRLabel24: TQRLabel;
    qrDetalle: TQRBand;
    QRFooterMoneda: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    qrIVA: TQRShape;
    QRLabel6: TQRLabel;
    qrsGarantia: TQRShape;
    qrsTotal: TQRShape;
    qrlGarantia: TQRLabel;
    qrlTotal: TQRLabel;
    QRFooterCesion: TQRBand;
    QRFooterProducto: TQRBand;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    qrImpTotal: TQRDBText;
    qrGarantia: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    QRFooterCliente: TQRBand;
    QRShape14: TQRShape;
    QRDBText15: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape21: TQRShape;
    QRExpr5: TQRExpr;
    QRShape19: TQRShape;
    QRLabel28: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel30: TQRLabel;
    qrlGarantiaB: TQRLabel;
    qrMoratorios: TQRDBText;
    SummaryBand1: TQRBand;
    qrGarantiaB: TQRDBText;
    PageHeaderBand1: TQRBand;
    qrsGarantiaB: TQRShape;
    qrsIVAMora: TQRShape;
    qrlIVAMora: TQRLabel;
    QRShape6: TQRShape;
    QRLabel16: TQRLabel;
    dbMoneda: TQRDBText;
    qrlAccesorio: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    qrlCredComis: TQRLabel;
    QRLabel26: TQRLabel;
    qrFooterTIPO_INT: TQRBand;
    qrFooterAccesorio: TQRBand;
    qreTitulo: TQRLabel;
    qreTitAccesorio: TQRLabel;
    qrlCFIMP_BINTER: TQRLabel;
    qrlCFIMP_IVA: TQRLabel;
    qrlCFIMP_FEGA: TQRLabel;
    qrlCFIMPORTE: TQRLabel;
    qrlCFMORATORIOS: TQRLabel;
    qrlCFIMP_TOTAL: TQRLabel;
    qrlINTIMP_TOTAL: TQRLabel;
    qrlINTMORATORIOS: TQRLabel;
    qrlINTIMPORTE: TQRLabel;
    qrlINTIMP_FEGA: TQRLabel;
    qrlINTIMP_IVA: TQRLabel;
    qrlINTIMP_BINTER: TQRLabel;
    qyProgVen: TQuery;
    qrCredCapital: TQRLabel;
    qrCredIntReg: TQRLabel;
    qrCredIntNoReg: TQRLabel;
    qrCredMora: TQRLabel;
    qrCredSeguro: TQRLabel;
    qrCredTotal: TQRLabel;
    qrIVAMora: TQRDBText;
    qrECapIvaMora: TQRExpr;
    qrEIntIvaMora: TQRExpr;
    QRInterEncabezado1: TQRInterEncabezado;
    QRShape13: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel34: TQRLabel;
    qrAcredCapital: TQRLabel;
    QRLabel35: TQRLabel;
    qrAcredIntReg: TQRLabel;
    QRLabel45: TQRLabel;
    qrAcredIntNoReg: TQRLabel;
    QRLabel46: TQRLabel;
    qrAcredMora: TQRLabel;
    qrlMoraComis: TQRLabel;
    qrAcredSeguro: TQRLabel;
    QRLabel48: TQRLabel;
    qrAcredTotal: TQRLabel;
    qrsMoratorios: TQRShape;
    qrlMoratorios: TQRLabel;
    QRShape3: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel29: TQRLabel;
    qrProdCapital: TQRLabel;
    QRLabel40: TQRLabel;
    qrProdIntReg: TQRLabel;
    QRLabel41: TQRLabel;
    qrProdIntNoReg: TQRLabel;
    QRLabel42: TQRLabel;
    qrProdMora: TQRLabel;
    qrlProdComis: TQRLabel;
    qrProdSeguro: TQRLabel;
    QRLabel49: TQRLabel;
    qrProdTotal: TQRLabel;
    QRShape10: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel36: TQRLabel;
    qrMonCapital: TQRLabel;
    QRLabel37: TQRLabel;
    qrMonIntReg: TQRLabel;
    QRLabel38: TQRLabel;
    qrMonIntNoReg: TQRLabel;
    QRLabel39: TQRLabel;
    qrMonMora: TQRLabel;
    qrlMonComis: TQRLabel;
    qrMonSeguro: TQRLabel;
    QRLabel51: TQRLabel;
    qrMonTotal: TQRLabel;
    dbProducto: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText23: TQRDBText;
    qrCtaImpK: TQRDBText;
    qrCtaImpInt: TQRDBText;
    lbCtaImp: TQRLabel;
    lbCtaVen: TQRLabel;
    qrCtaVenK: TQRDBText;
    qrCtaVenInt: TQRDBText;
    QRShape12: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText10: TQRDBText;
    qrlTitGtiaCr: TQRLabel;
    qrCredGtia: TQRLabel;
    qrlTitGtiaTit: TQRLabel;
    qrlTitGtiaProd: TQRLabel;
    qrlTitGtiaMon: TQRLabel;
    qrAcredGtia: TQRLabel;
    qrProdGtia: TQRLabel;
    qrMonGtia: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    qrCredIVA: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    qrAcredIVA: TQRLabel;
    qrProdIVA: TQRLabel;
    qrMonIVA: TQRLabel;
    QRLabel25: TQRLabel;
    lbTipoCambio: TQRLabel;
    qrMonTotalTC: TQRLabel;
    QRLabel66: TQRLabel;
    qrMonIVATC: TQRLabel;
    QRLabel64: TQRLabel;
    qrMonSeguroTC: TQRLabel;
    QRLabel62: TQRLabel;
    qrMonGtiaTC: TQRLabel;
    qrlTitGtiaMonTC: TQRLabel;
    qrMonMoraTC: TQRLabel;
    QRLabel58: TQRLabel;
    qrMonIntNoRegTC: TQRLabel;
    QRLabel56: TQRLabel;
    qrMonIntRegTC: TQRLabel;
    QRLabel54: TQRLabel;
    qrMonCapitalTC: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel47: TQRLabel;
    QRShape9: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRGroupMoneda : TQRGroup;
    QRGroupSector : TQRGroup;
    QRGroup2: TQRGroup;
    QRGroupProducto: TQRGroup;
    QRGroup1: TQRGroup;
    QRGroupCesion: TQRGroup;
    QRGpoAccesoriio: TQRGroup;
    qrGpoGpoInter: TQRGroup;    
    QRPromAdmon: TQRGroup;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    InterDigDoc1: TInterDigDoc;
    procedure qrDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterProductoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterClienteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGpoGpoInterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrFooterTIPO_INTBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrFooterAccesorioBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGpoAccesoriioBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupCesionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterCesionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupProductoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    vlCFIMP_BINTER, vlCFIMP_IVA, vlCFIMP_FEGA, vlCFIMPORTE, vlCFMORATORIOS, vlCFIMP_TOTAL:Double;
    vlSEIMP_BINTER, vlSEIMP_IVA, vlSEIMP_FEGA, vlSEIMPORTE, vlSEMORATORIOS, vlSEIMP_TOTAL:Double;
    vlINTIMP_BINTER, vlINTIMP_IVA, vlINTIMP_FEGA, vlINTIMPORTE, vlINTMORATORIOS, vlINTIMP_TOTAL:Double;
    vlINT1IMP_BINTER, vlINT1IMP_IVA, vlINT1IMP_FEGA, vlINT1IMPORTE, vlINT1MORATORIOS, vlINT1IMP_TOTAL:Double;
    vlCredCapital, vlCredIntReg, vlCredIntNoReg, vlCredMora, vlCredSeguro, vlCredTotal,vlCredGtia,vlCredIVA,
    vlAcredCapital, vlAcredIntReg, vlAcredIntNoReg, vlAcredMora, vlAcredSeguro, vlAcredTotal, vlAcredGtia,vlAcredIVA,
    vlProdCapital, vlProdIntReg, vlProdIntNoReg, vlProdMora, vlProdSeguro, vlProdTotal, vlProdGtia,vlProdIVA,
    vlMonCapital, vlMonIntReg, vlMonIntNoReg, vlMonMora, vlMonSeguro, vlMonTotal, vlMonGtia, vlMonIVA :Double;
    iTipReporte:Integer; dTipoCambio,vgTCambioMes,vgTCambioUDIS  : Double;
    BOrdxProAdmon: Boolean;
{roim 02/02/06 Se agrega filtro para que los reportes sean más rápidos}
    VlFFiltroCre        :       String;
    VLIDEmpresa         :       String;
{/roim}


  public


   Function FormaQuery(sF_Vencimiento,sF_Programada,sMoneda,
                        sSituacion,sOrden,sTipoReporte,sFecRep,
                        sEmpresa, sSucursal,sGpoProd, sOperDD, sCveCatMin:String;
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
//                        bIncTipoSec, bFinSemana, bOperaBanco:Boolean; iReporte: Integer):String;
                        bIncTipoSec, bFinSemana, bOperaBanco, bOrdxProAdmon:Boolean; iReporte: Integer):String;
{/roim}

{AGF 2011.11.14 Optimización del reporte}
//    Function AgregaGarFega(PPCveAccesorio : String;PPFecha : String): String;
    Function AgregaGarFega(PPFecha : String): String;
{/AGF 2011.11.14 Optimización del reporte}
  end;

var
  QrContVenc: TQrContVenc;
  bGenArch, vgCompactar: Boolean;
  sArchivo:String;
  F: TextFile;

Procedure RepVencimientos(  sF_Vencimiento,sF_Programada,sMoneda,
                       sSituacion,sOrden,sTipoReporte,sFecRep,
                       sNbrArch, sEmpresa, sSucursal,
                       sGpoProd, sOperDD, sCveCatMin:String;
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
//                       bIncTipoSec, bFinSemana, bOperaBanco, bCompactar:Boolean;
                       bIncTipoSec, bFinSemana, bOperaBanco, bOrdxProAdmon, bCompactar:Boolean;
{/roim}
                       iReporte : Integer;
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

function  NvlStr( pStr, pStrNvl : String ) : String;
begin
 if pStr <> '' then
   Result := pStr
  else
   Result := pStrNvl;
end;

Procedure RepVencimientos(  sF_Vencimiento,sF_Programada,sMoneda,
                       sSituacion,sOrden,sTipoReporte,sFecRep,
                       sNbrArch, sEmpresa, sSucursal,
                       sGpoProd, sOperDD, sCveCatMin:String;
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
//                       bIncTipoSec, bFinSemana, bOperaBanco, bCompactar:Boolean;
                       bIncTipoSec, bFinSemana, bOperaBanco, bOrdxProAdmon, bCompactar:Boolean;
{/roim}
                       iReporte : Integer;
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
   QrContVenc: TQrContVenc;
   VLTitulo : String;
   Preview     : TIntQRPreview; iX, iZ: Integer;
   //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
   sDigDocFileName : String;
   //</LOLS>
   // RUCJ4248: Variable para la validación de la digitalización;
   bDigitalizaCorrecta : Boolean;
Begin
   VLTitulo := '';
   QrContVenc:=TQrContVenc.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrContVenc);

   Try
      bGenArch:= False;
      sArchivo:= sNbrArch;
      vgCompactar:=bCompactar;
      QrContVenc.iTipReporte:= iReporte;
      QrContVenc.QRInterEncabezado1.Apli:=pApli;
      QrContVenc.vlCFIMP_BINTER:=0;
      QrContVenc.vlCFIMP_IVA:=0;
      QrContVenc.vlCFIMP_FEGA:=0;
      QrContVenc.vlCFIMPORTE:=0;
      QrContVenc.vlCFMORATORIOS:=0;
      QrContVenc.vlCFIMP_TOTAL:=0;
      QrContVenc.vlSEIMP_BINTER:=0;
      QrContVenc.vlSEIMP_IVA:=0;
      QrContVenc.vlSEIMP_FEGA:=0;
      QrContVenc.vlSEIMPORTE:=0;
      QrContVenc.vlSEMORATORIOS:=0;
      QrContVenc.vlSEIMP_TOTAL:=0;
      QrContVenc.vlINTIMP_BINTER:=0;
      QrContVenc.vlINTIMP_IVA:=0;
      QrContVenc.vlINTIMP_FEGA:=0;
      QrContVenc.vlINTIMPORTE:=0;
      QrContVenc.vlINTMORATORIOS:=0;
      QrContVenc.vlINTIMP_TOTAL:=0;
      QrContVenc.vlINT1IMP_BINTER:=0;
      QrContVenc.vlINT1IMP_IVA:=0;
      QrContVenc.vlINT1IMP_FEGA:=0;
      QrContVenc.vlINT1IMPORTE:=0;
      QrContVenc.vlINT1MORATORIOS:=0;
      QrContVenc.vlINT1IMP_TOTAL:=0;
      QrContVenc.BOrdxProAdmon := BOrdxProAdmon;

{roim 02/02/06 Se agrega filtro para que los reportes sean más rápidos}

      If Trim(sF_Vencimiento) <> '' Then
         QrContVenc.VlFFiltroCre := sF_Vencimiento;
      //end if
      If Trim(sF_Programada) <> '' Then
         QrContVenc.VlFFiltroCre := sF_Programada;
      //end if
      QrContVenc.VLIDEmpresa := sEmpresa;
{/roim}

      QrContVenc.vgTCambioMes := ObtTipoCambio( pAPli.DameFechaEmpresaDia('D000'),
                                                IntToStr ( C_DLLS ) ,
                                                pAPli.DataBaseName, pAPli.SessionName);
      QrContVenc.vgTCambioUDIS := ObtTipoCambio( pAPli.DameFechaEmpresaDia('D000'),
                                                 IntToStr ( 800 ) ,
                                                 pAPli.DataBaseName, pAPli.SessionName);

      QrContVenc.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrContVenc.QRInterEncabezado1.NomReporte:='IntMQrContVenc';

      iX:= QrContVenc.qrIVA.Left + QrContVenc.qrIVA.Width -1;
      iZ:= Trunc((QrContVenc.qrsGarantia.Width + QrContVenc.qrsGarantiaB.Width)/3);

      //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
      sDigDocFileName := 'VENCIMIENTOS_CONTABLE';
      //</LOLS>
      If iReporte = 0 Then Begin
         //TITULOS
         QrContVenc.qrsMoratorios.Left:=iX;
         QrContVenc.qrsMoratorios.Width:=QrContVenc.qrsMoratorios.Width+ iZ;

         QrContVenc.qrsIVAMora.Left:=QrContVenc.qrsMoratorios.Left + QrContVenc.qrsMoratorios.Width -1;
         QrContVenc.qrsIVAMora.Width:=QrContVenc.qrsIVAMora.Width+ iZ;

         QrContVenc.qrsTotal.Left:= QrContVenc.qrsIVAMora.Left + QrContVenc.qrsIVAMora.Width -1;
         QrContVenc.qrsTotal.Width:=QrContVenc.qrsTotal.Width+ iZ -2;

         QrContVenc.qrlMoratorios.Left:=QrContVenc.qrsMoratorios.Left+1;
         QrContVenc.qrlMoratorios.Width:=QrContVenc.qrsMoratorios.Width-2;
         QrContVenc.qrlIVAMora.Left:=QrContVenc.qrsIVAMora.Left+1;
         QrContVenc.qrlIVAMora.Width:=QrContVenc.qrsIVAMora.Width-2;
         QrContVenc.qrlTotal.Left:=QrContVenc.qrsTotal.Left+1;
         QrContVenc.qrlTotal.Width:=QrContVenc.qrsTotal.Width-2;
         //CAMPOS
         QrContVenc.qrGarantia.Enabled:= False;
         QrContVenc.qrlINTIMP_FEGA.Enabled:= False;
         QrContVenc.qrlCFIMP_FEGA.Enabled:= False;
         QrContVenc.qrGarantiaB.Enabled:= False;
         QrContVenc.qrlINTIMPORTE.Enabled:= False;
         QrContVenc.qrlCFIMPORTE.Enabled:= False;
         QrContVenc.qrMoratorios.Left:= QrContVenc.qrlMoratorios.Left;
         QrContVenc.qrMoratorios.Width:= QrContVenc.qrlMoratorios.Width;
         QrContVenc.qrlINTMORATORIOS.Left:= QrContVenc.qrlMoratorios.Left;
         QrContVenc.qrlINTMORATORIOS.Width:= QrContVenc.qrlMoratorios.Width;
         QrContVenc.qrlCFMORATORIOS.Left:= QrContVenc.qrlMoratorios.Left;
         QrContVenc.qrlCFMORATORIOS.Width:= QrContVenc.qrlMoratorios.Width;

         QrContVenc.qrIVAMora.Left:= QrContVenc.qrlIVAMora.Left;
         QrContVenc.qrIVAMora.Width:= QrContVenc.qrlIVAMora.Width;
         QrContVenc.qrECapIvaMora.Left:= QrContVenc.qrlIVAMora.Left;
         QrContVenc.qrECapIvaMora.Width:= QrContVenc.qrlIVAMora.Width;
         QrContVenc.qrEIntIvaMora.Left:= QrContVenc.qrlIVAMora.Left;
         QrContVenc.qrEIntIvaMora.Width:= QrContVenc.qrlIVAMora.Width;

         QrContVenc.qrImpTotal.Left:= QrContVenc.qrlTotal.Left;
         QrContVenc.qrImpTotal.Width:= QrContVenc.qrlTotal.Width;
         QrContVenc.qrlINTIMP_TOTAL.Left:= QrContVenc.qrlTotal.Left;
         QrContVenc.qrlINTIMP_TOTAL.Width:= QrContVenc.qrlTotal.Width;
         QrContVenc.qrlCFIMP_TOTAL.Left:= QrContVenc.qrlTotal.Left;
         QrContVenc.qrlCFIMP_TOTAL.Width:= QrContVenc.qrlTotal.Width;

         If  sSituacion='IM'Then  //Impagada
            //QrContVenc.QRInterEncabezado1.Titulo1:='Reporte Contable Impagada Cartera de Créditos'
            QrContVenc.QRInterEncabezado1.Titulo1:='Reporte Operativo de Impagada Cartera de Créditos'   //RABA AGO 2015 B-6
         Else If sSituacion='VE' Then //Vencida Exigible
            //QrContVenc.QRInterEncabezado1.Titulo1:='Reporte Contable Vencida Cartera de Créditos'
            QrContVenc.QRInterEncabezado1.Titulo1:='Reporte Operativo de Vencida Cartera de Créditos'   //RABA AGO 2015 B-6
         Else If (sSituacion='IV') Then Begin //Impagada + Vencida Exigible
                //QrContVenc.QRInterEncabezado1.Titulo1:='Reporte Contable Impagada + Vencida Exigible Cartera de Créditos';
                QrContVenc.QRInterEncabezado1.Titulo1:='Reporte Operativo de Impagada + Vencida Exigible Cartera de Créditos';   //RABA AGO 2015 B-6
         End;
         //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
         If sSituacion = 'IM' Then  // Impagada
            sDigDocFileName := 'VENCTOS_CONT_IM'
         Else If sSituacion='VE' Then //Vencida Exigible
            sDigDocFileName := 'VENCTOS_CONT_VDA'
         Else If (sSituacion='IV') Then Begin //Impagada + Vencida Exigible
            sDigDocFileName := 'VENCTOS_CONT_IM_VDA';
         End;
         //</LOLS>
      End Else If iReporte = 1 Then Begin
         If  sSituacion='IM'Then  //Impagada
            //QrContVenc.QRInterEncabezado1.Titulo1:='Reporte Contable Impagada con Garantía de Fondos'
            QrContVenc.QRInterEncabezado1.Titulo1:='Reporte Operativo de Impagada con Garantía de Fondos'   //RABA AGO 2015 B-6
         Else If sSituacion='VE' Then //Vencida Exigible
            //QrContVenc.QRInterEncabezado1.Titulo1:='Reporte Contable Vencida Exigible con Garantía de Fondos'
            QrContVenc.QRInterEncabezado1.Titulo1:='Reporte Operativo de Vencida Exigible con Garantía de Fondos' //RABA AGO 2015 B-6
         Else If (sSituacion='IV')Then Begin //Impagada + Vencida Exigible
               //QrContVenc.QRInterEncabezado1.Titulo1:='Reporte Contable Impagada + Vencida Exigible en Garantía de Fondos';
               QrContVenc.QRInterEncabezado1.Titulo1:='Reporte Operativo de Impagada + Vencida Exigible en Garantía de Fondos';   //RABA AGO 2015 B-6
         End;
         //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
         If sSituacion = 'IM' Then  // Impagada
            sDigDocFileName := 'VENCTOS_CONT_IM_GTIA'
         Else If sSituacion='VE' Then //Vencida Exigible
            sDigDocFileName := 'VENCTOS_CONT_VDA_GTIA'
         Else If (sSituacion='IV') Then Begin //Impagada + Vencida Exigible
            sDigDocFileName := 'VENCTOS_CONT_IM_VDA_GTIA';
         End;
         //</LOLS>
      End;
      //Pone titulo
      If Trim(sF_Vencimiento) <> '' Then
         VLTitulo := VLTitulo + ' Saldos al(F_Vencimiento) ' + sF_Vencimiento
      Else If Trim(sF_Programada) <> '' Then
         VLTitulo := VLTitulo + ' Saldos al(F_Programada) ' + sF_Programada;

      QrContVenc.lbCtaImp.Enabled := False;
      QrContVenc.qrCtaImpK.Enabled := False;
      QrContVenc.qrCtaImpInt.Enabled := False;
      QrContVenc.lbCtaVen.Enabled := False;
      QrContVenc.qrCtaVenK.Enabled := False;
      QrContVenc.qrCtaVenInt.Enabled := False;

      //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
      If Trim(sF_Vencimiento) <> '' Then
      Begin
        sDigDocFileName := sDigDocFileName + '_FVENC_';
        sDigDocFileName := sDigDocFileName + '_' + FormatDateTime( 'DD_MM_YYYY', StrToDate(sF_Vencimiento)) + '_' +
                           sMoneda         + '_' +
                           sOrden          + '_' + sTipoReporte   + '_' +
                           sFecRep         + '_' + sEmpresa       + '_' +
                           sSucursal       + '_' + sGpoProd       + '_' +
                           sOperDD         + '_' + sCveCatMin     + '_' +
                           BoolToStr(bIncTipoSec ) + '_' + BoolToStr(bFinSemana)     + '_' +
                           BoolToStr(bOperaBanco ) + '_' + BoolToStr(bOrdxProAdmon ) + '_' +
                           BoolToStr(bCompactar  );
      End Else If Trim(sF_Programada) <> '' Then
      Begin
        sDigDocFileName := sDigDocFileName + '_FPROG_';
        sDigDocFileName := sDigDocFileName + '_' +
                           FormatDateTime( 'DD_MM_YYYY', StrToDate(sF_Programada))   + '_' +
                           sMoneda         + '_' +
                           sOrden          + '_' + sTipoReporte   + '_' +
                           sFecRep         + '_' + sEmpresa       + '_' +
                           sSucursal       + '_' + sGpoProd       + '_' +
                           sOperDD         + '_' + sCveCatMin     + '_' +
                           BoolToStr( bIncTipoSec ) + '_' + BoolToStr(bFinSemana)     + '_' +
                           BoolToStr( bOperaBanco ) + '_' + BoolToStr(bOrdxProAdmon ) + '_' +
                           BoolToStr( bCompactar  );
      End
      ;
      //</LOLS>

      If (Trim(sMoneda)<>'') Then
          VLTitulo := VLTitulo + ' Por Moneda';
      If (Trim(sSituacion)<>'') Then Begin
         if Trim(sSituacion) = 'AC' then Begin
            QrContVenc.lbCtaImp.Enabled := False;
            QrContVenc.qrCtaImpK.Enabled := False;
            QrContVenc.qrCtaImpInt.Enabled := False;
            QrContVenc.lbCtaVen.Enabled := False;
            QrContVenc.qrCtaVenK.Enabled := False;
            QrContVenc.qrCtaVenInt.Enabled := False;
         end
         else if Trim(sSituacion) = 'IM' then Begin
            QrContVenc.lbCtaImp.Enabled := True;
            QrContVenc.qrCtaImpK.Enabled := True;
            QrContVenc.qrCtaImpInt.Enabled := True;
            QrContVenc.lbCtaVen.Enabled := False;
            QrContVenc.qrCtaVenK.Enabled := False;
            QrContVenc.qrCtaVenInt.Enabled := False;
         end
         else if Trim(sSituacion) = 'VE' then Begin
            QrContVenc.lbCtaImp.Enabled := False;
            QrContVenc.qrCtaImpK.Enabled := False;
            QrContVenc.qrCtaImpInt.Enabled := False;
            QrContVenc.lbCtaVen.Enabled := True;
            QrContVenc.qrCtaVenK.Enabled := True;
            QrContVenc.qrCtaVenInt.Enabled := True;
         end
         else if Trim(sSituacion) = 'IV' then Begin
            QrContVenc.lbCtaImp.Enabled := True;
            QrContVenc.qrCtaImpK.Enabled := True;
            QrContVenc.qrCtaImpInt.Enabled := True;
            QrContVenc.lbCtaVen.Enabled := True;
            QrContVenc.qrCtaVenK.Enabled := True;
            QrContVenc.qrCtaVenInt.Enabled := True;
         end
         else Begin
            QrContVenc.lbCtaImp.Enabled := False;
            QrContVenc.qrCtaImpK.Enabled := False;
            QrContVenc.qrCtaImpInt.Enabled := False;
            QrContVenc.lbCtaVen.Enabled := False;
            QrContVenc.qrCtaVenK.Enabled := False;
            QrContVenc.qrCtaVenInt.Enabled := False;
         end;
      end;

      If Trim(sGpoProd)<>'' Then
         VLTitulo := VLTitulo + ' Por Gpo.Producto';
      If bOperaBanco Then
         VLTitulo := VLTitulo + ' Operado por BINTER';
      If Trim(sCveCatMin)<>'' Then
         VLTitulo := VLTitulo + ' Por Cat.Min';
      If bFinSemana Then
         VLTitulo := VLTitulo + ' Por Fin de Semana';

      QrContVenc.QRInterEncabezado1.Titulo2 := VLTitulo;
      If Not(bIncTipoSec) Then Begin
         QrContVenc.QRGroupSector.Enabled := False;
         QrContVenc.QRGroupSector.Expression := '';
      End;

      QrContVenc.qyProgVen.DatabaseName := pApli.DataBaseName;
      QrContVenc.qyProgVen.SessionName := pApli.SessionName;

      QrContVenc.qyProgVen.Active:=False;
      QrContVenc.qyProgVen.SQL.Text:= QrContVenc.FormaQuery(sF_Vencimiento,sF_Programada,sMoneda,
                      sSituacion,sOrden,sTipoReporte, sFecRep,sEmpresa, sSucursal,sGpoProd,
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
//                      sOperDD, sCveCatMin,bIncTipoSec, bFinSemana, bOperaBanco,  iReporte);
                      sOperDD, sCveCatMin,bIncTipoSec, bFinSemana, bOperaBanco, bOrdxProAdmon, iReporte);
{/roim}
      QrContVenc.qyProgVen.SQL.SaveToFile('c:\' + sArchivoDig + '.Nvo.sql');
      QrContVenc.qyProgVen.Active:=True;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrContVenc.QRInterEncabezado1.Titulo1+ #09 );
         Writeln(F, QrContVenc.QRInterEncabezado1.Titulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F,
            //Grupos
            'Moneda'+ #09#09 +
            'Tipo de Cambio'+ #09 +
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
            'Prom. Admon'+ #09#09 +
{/roim}
            'Sector'+ #09 +
            'Producto'+ #09#09 +
            'Cuenta Impagado'+ #09#09 +
            'Cuenta Vencido'+ #09#09 +
            'Titular'+ #09#09 +
            'Chequera Admin'+ #09+
            'Catálogo Mínimo'+ #09#09 +
            //Registros
            'Concepto'+ #09 +
            'Crédito'+ #09 +
            'Fecha Inicio' +#09 +
            'Fecha de Vnto.'+#09 +
            'Periodo / Documento'+ #09 +
            'Días Imp/Vdo' + #09 +
            'Tasa Moratoria' + #09+
            'Fecha Último Pago' + #09 +
            'Importe / BINTER' +#09 +
            'IVA' + #09+
            'Garantia FEGA'+ #09+
            'Garantía FEGA + BINTER' +#09 +
            'Moratorios'+#09+
            'IVA Moratorios'+ #09 +
            'Total Adeudo');
      End;

      //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
      if grOpcion = grPreview then
         QrContVenc.Preview
      else if grOpcion = grPrint then
         QrContVenc.Print
      else if grOpcion = grDigitaliza then
      begin
        QrContVenc.InterDigDoc1.RootDir  := obtValorGpoCve( 'CONFRH', 'ROOTDIR',   pApli );
        QrContVenc.InterDigDoc1.HostName := obtValorGpoCve( 'CONFRH', 'FTPSERVER', pApli );
        QrContVenc.InterDigDoc1.UserName := obtValorGpoCve( 'CONFRH', 'USERNAME',  pApli );
        QrContVenc.InterDigDoc1.Password := HexToStr( obtValorGpoCve( 'CONFRH', 'PASSWORD',  pApli ) );
        If Trim(sF_Vencimiento) <> '' Then
          QrContVenc.InterDigDoc1.SendTo   := ObtSendTo( sF_Vencimiento )
        Else If Trim(sF_Programada) <> '' Then
          QrContVenc.InterDigDoc1.SendTo   := ObtSendTo( sF_Programada );
        //
        QrContVenc.InterDigDoc1.FileName := sArchivoDig; // sDigDocFileName; //<LOLS 17FEB2006. DIGITALIZACION DE REPORTES>
        QrContVenc.PrinterSettings.PrinterIndex := QrContVenc.InterDigDoc1.SetPrinter;
        QrContVenc.Print;

//      RUCJ4248 : validar que la digitalización se genere de forma correcta
        bDigitalizaCorrecta := (QrContVenc.InterDigDoc1.Compress and QrContVenc.InterDigDoc1.SendFile);

//        QrContVenc.InterDigDoc1.Compress;
//        QrContVenc.InterDigDoc1.SendFile;
        QrContVenc.PrinterSettings.PrinterIndex := QrContVenc.InterDigDoc1.RestorePrinter;
      end;
      //If pPreview Then
      //   QrContVenc.Preview
      //Else
      //   QrContVenc.Print;
      //</LOLS>
   Finally
//    ----------------------------------------------
//    RUCJ4248 03/12/2009: Rastreo de digitalización
      if trim(sArchivoDig) <> '' then
      begin
      TRecolectaDatos.Recoleccion(FormatDateTime( 'dd/mm/yyyy', StrToDate(sF_Vencimiento)),
         TRecolectaDatos.delString(sArchivoDig), 'CONFRH', pAPli.NomAplicacion,
         TRecolectaDatos.BooleanToByte(bDigitalizaCorrecta),pAPli);
      end;

      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrContVenc.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

(*
AGF 2011.10.14 Optimización del reporte
Código Original
Function TQrContVenc.AgregaGarFega(PPCveAccesorio : String;PPFecha : String): String;
var VLIncrementa, VLDecrementa,VLString : String;
begin
     if PPCveAccesorio = 'CP' then
     begin
          VLIncrementa := '( ''PGCPGF'', ''PGCPGP'')';
          VLDecrementa := '( ''RCGFCP'', ''RCGPCP'')';
     end
     else if PPCveAccesorio = 'IN' then
     begin
          VLIncrementa := '(''PGINGF'', ''PGINGP'')';
          VLDecrementa := '(''RCGFIN'', ''RCGPIN'')';
     end
     else if PPCveAccesorio = 'CN' then
     begin
          VLIncrementa := '(''PGCNGF'',''PGCNGP'')';
          VLDecrementa := '(''RCGFCN'',''RCGPCN'')';
     end
     else if PPCveAccesorio = 'FN' then
     begin
          VLIncrementa := '(''PGFNGF'',''PGFNGP'')';
          VLDecrementa := '(''RCGFFN'',''RCGPFN'')';
     end;
     VLString :=
        ' (' +
        ' SELECT FG_I.ID_CREDITO, FG_I.ID_PERIODO, (NVL(FG_I.IMP_CONCEPTO,0) - NVL(FG_D.IMP_CONCEPTO,0)) AS IMP_CONCEPTO ' +
        ' FROM ' +
        ' (SELECT CC.ID_CREDITO, CT.ID_PERIODO, SUM(CDT.IMP_CONCEPTO) AS IMP_CONCEPTO ' +
        '  FROM (SELECT * FROM CR_TRANSACCION WHERE SIT_TRANSACCION = ''AC'' ' +
        '        AND ID_TRANS_CANCELA IS NULL AND F_VALOR <= ' + SQLFecha( StrToDate(PPFecha) ) + ') CT, ' +
        '       (SELECT * FROM CR_DET_TRANSAC WHERE CVE_CONCEPTO = ''IMPBRU'') CDT, ' +
{roim 02/02/06 Se agrega filtro para que los reportes sean más rápidos}
        '       (SELECT * FROM CR_CREDITO  WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_HISTO_CRED WHERE F_CIERRE = ' + SQLFecha( StrToDate(VlFFiltroCre) ) + ')  AND ID_CONTRATO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_EMPRESA = ' + VLIDEmpresa + ') ) CC,' +
{/roim}
//        '       CR_GA_SOL_FEGA CGSF, CR_XTRANSACCION CXT, ' + //EASA4011       02/08/2005
        //< EASA4011      02.AGO.2007
        '       ( select ID_SOLICITUD, ID_CREDITO FROM CR_GA_SOL_FEGA CGF ' +
        '       UNION ' +
        '       select ID_SOLICITUD, ID_CREDITO FROM CR_GA_SOL_NAFIN CGP ' +
        '       )CGSF, CR_XTRANSACCION CXT, ' +
        // EASA4011 >/
        '       CONTRATO CTTO,CR_CONTRATO CTO,CR_CVE_OPERACION CCO ' +
        '  WHERE CCO.CVE_PARAMETRO  IN ' + VLIncrementa +
        '    AND CT.ID_CREDITO      = CC.ID_CREDITO         AND CT.CVE_OPERACION   = CCO.CVE_OPERACION ' +
        '    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION     AND CDT.CVE_OPERACION  = CT.CVE_OPERACION ' +
        '    AND CXT.ID_SOLICITUD   = CGSF.ID_SOLICITUD     AND CXT.ID_TRANSACCION = CT.ID_TRANSACCION ' + //EASA4011       02/08/2005
        '    AND CGSF.ID_CREDITO    = CC.ID_CREDITO         AND CTTO.ID_CONTRATO   = CC.ID_CONTRATO '+
        '    AND CTO.ID_CONTRATO    = CC.ID_CONTRATO        AND CTO.FOL_CONTRATO   = CC.FOL_CONTRATO '+
        '    AND CCO.CVE_PRODUCTO   = CTO.CVE_PRODUCTO_CRE  AND CCO.CVE_MONEDA     = CTTO.CVE_MONEDA '+
        '  GROUP BY CC.ID_CREDITO, CT.ID_PERIODO) FG_I, ' +
        ' (SELECT CC.ID_CREDITO, CT.ID_PERIODO, SUM(CDT.IMP_CONCEPTO) AS IMP_CONCEPTO ' +
        '  FROM (SELECT * FROM CR_TRANSACCION WHERE SIT_TRANSACCION = ''AC'' ' +
        '        AND ID_TRANS_CANCELA IS NULL AND F_VALOR <= ' + SQLFecha( StrToDate(PPFecha) ) + ') CT, ' +
        '       (SELECT * FROM CR_DET_TRANSAC WHERE CVE_CONCEPTO = ''IMPBRU'') CDT, ' +
//        '       CR_GA_SOL_FEGA CGSF, CR_XTRANSACCION CXT, ' + //EASA4011       02/08/2005

        //< EASA4011      02.AGO.2007
        '       ( select ID_SOLICITUD, ID_CREDITO FROM CR_GA_SOL_FEGA CGF ' +
        '       UNION ' +
        '       select ID_SOLICITUD, ID_CREDITO FROM CR_GA_SOL_NAFIN CGP ' +
        '       )CGSF, CR_XTRANSACCION CXT, ' +
        // EASA4011 >/

        '       CONTRATO CTTO,CR_CONTRATO CTO, ' +
{roim 02/02/06 Se agrega filtro para que los reportes sean más rápidos}
        '       (SELECT * FROM CR_CREDITO  WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_HISTO_CRED WHERE F_CIERRE = ' + SQLFecha( StrToDate(VlFFiltroCre) ) + ')   AND ID_CONTRATO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_EMPRESA = ' + VLIDEmpresa + ') ) CC,' +
{/roim}
        '       CR_CVE_OPERACION CCO' +
        '  WHERE CCO.CVE_PARAMETRO  IN ' + VLDecrementa +
        '    AND CT.ID_CREDITO      = CC.ID_CREDITO         AND CT.CVE_OPERACION = CCO.CVE_OPERACION ' +
        '    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION     AND CDT.CVE_OPERACION = CT.CVE_OPERACION ' +
        '    AND CXT.ID_TRANSACCION = CT.ID_TRANSACCION     AND CXT.ID_SOLICITUD = CGSF.ID_SOLICITUD' + //EASA4011       02/08/2005
        '    AND CC.ID_CREDITO      = CGSF.ID_CREDITO       AND CTTO.ID_CONTRATO = CC.ID_CONTRATO ' +
        '    AND CTO.ID_CONTRATO    = CC.ID_CONTRATO        AND CTO.FOL_CONTRATO = CC.FOL_CONTRATO ' +
        '    AND CCO.CVE_PRODUCTO   = CTO.CVE_PRODUCTO_CRE  AND CCO.CVE_MONEDA  = CTTO.CVE_MONEDA ' +
        '  GROUP BY CC.ID_CREDITO, CT.ID_PERIODO) FG_D ' +
        ' WHERE FG_D.ID_CREDITO (+)= FG_I.ID_CREDITO ' +
        ' AND   FG_D.ID_PERIODO (+)= FG_I.ID_PERIODO ) FEGA ';

     Result := VLString;
end;*)


{AGF 2011.11.14 Optimización del reporte
                Modifica la obtención de los importes de garantía FEGA. Antes de iniciar se realizan 8 consultas a la misma información (los cuatro accesorios
                invocados dos veces, uno para los importes que suman y otra para los que restan. Todos estos importes pueden ser obtenidos en una sola pasada
                extrayendo todos los conceptos y enviando cada uno a diferente columna.
}
//Function TQrContVenc.AgregaGarFega(PPCveAccesorio : String;PPFecha : String): String;
Function TQrContVenc.AgregaGarFega(PPFecha : String): String;
var
{AGF 2011.11.14
    VLIncrementa, VLDecrementa,
/AGF}
    VLString : String;
begin
  {AGF 2011.11.14
     if PPCveAccesorio = 'CP' then
     begin
          VLIncrementa := '( ''PGCPGF'', ''PGCPGP'')';
          VLDecrementa := '( ''RCGFCP'', ''RCGPCP'')';
     end
     else if PPCveAccesorio = 'IN' then
     begin
          VLIncrementa := '(''PGINGF'', ''PGINGP'')';
          VLDecrementa := '(''RCGFIN'', ''RCGPIN'')';
     end
     else if PPCveAccesorio = 'CN' then
     begin
          VLIncrementa := '(''PGCNGF'',''PGCNGP'')';
          VLDecrementa := '(''RCGFCN'',''RCGPCN'')';
     end
     else if PPCveAccesorio = 'FN' then
     begin
          VLIncrementa := '(''PGFNGF'',''PGFNGP'')';
          VLDecrementa := '(''RCGFFN'',''RCGPFN'')';
     end;
/AGF}

     VLString :=
        ' (' + coCRLF +
{AGF 2011.11
        ' SELECT FG_I.ID_CREDITO, FG_I.ID_PERIODO, (NVL(FG_I.IMP_CONCEPTO,0) - NVL(FG_D.IMP_CONCEPTO,0)) AS IMP_CONCEPTO ' +
        ' FROM ' +
        ' (SELECT CC.ID_CREDITO, CT.ID_PERIODO, SUM(CDT.IMP_CONCEPTO) AS IMP_CONCEPTO ' +
/AGF}
        'Select   CT.ID_CREDITO, CT.ID_PERIODO,' + coCRLF +
        '         Nvl (Sum (Case When CCO.CVE_PARAMETRO In (''PGCPGF'', ''PGCPGP'') Then CDT.IMP_CONCEPTO            --Capital +' + coCRLF +
        '                        Else Null' + coCRLF +
        '                   End), 0) -' + coCRLF +
        '         Nvl (Sum (Case When CCO.CVE_PARAMETRO In (''RCGFCP'', ''RCGPCP'') Then CDT.IMP_CONCEPTO            --Capital -' + coCRLF +
        '                        Else Null' + coCRLF +
        '                     End), 0)                                                                           IMP_CONCEPTO_CP,' + coCRLF +
        '         Nvl (Sum (Case When CCO.CVE_PARAMETRO In (''PGINGF'', ''PGINGP'') Then CDT.IMP_CONCEPTO            --Interés +' + coCRLF +
        '                        Else Null' + coCRLF +
        '                   End), 0) -' + coCRLF +
        '         Nvl (Sum (Case When CCO.CVE_PARAMETRO In (''RCGFIN'', ''RCGPIN'') Then CDT.IMP_CONCEPTO            --Interés -' + coCRLF +
        '                        Else Null' + coCRLF +
        '                     End), 0)                                                                           IMP_CONCEPTO_IN,' + coCRLF +
        '         Nvl (Sum (Case When CCO.CVE_PARAMETRO In (''PGFNGF'', ''PGFNGP'') Then CDT.IMP_CONCEPTO            --Financiamiento adicional +' + coCRLF +
        '                        Else Null' + coCRLF +
        '                   End), 0) -' + coCRLF +
        '         Nvl (Sum (Case When CCO.CVE_PARAMETRO In (''RCGFFN'', ''RCGPFN'') Then CDT.IMP_CONCEPTO            --Financiamiento adicional -' + coCRLF +
        '                        Else Null' + coCRLF +
        '                     End), 0)                                                                           IMP_CONCEPTO_FN,' + coCRLF +
        '         Nvl (Sum (Case When CCO.CVE_PARAMETRO In (''PGCNGF'', ''PGCNGP'') Then CDT.IMP_CONCEPTO            --Comisiones +' + coCRLF +
        '                        Else Null' + coCRLF +
        '                   End), 0) -' + coCRLF +
        '         Nvl (Sum (Case When CCO.CVE_PARAMETRO In (''RCGFCN'', ''RCGPCN'') Then CDT.IMP_CONCEPTO            --Comisiones -' + coCRLF +
        '                        Else Null' + coCRLF +
        '                     End), 0)                                                                           IMP_CONCEPTO_CN' + coCRLF +
        '  FROM (SELECT * FROM CR_TRANSACCION WHERE SIT_TRANSACCION = ''AC'' ' + coCRLF +
        '        AND ID_TRANS_CANCELA IS NULL AND F_VALOR <= ' + SQLFecha( StrToDate(PPFecha) ) + ') CT, ' + coCRLF +
        '       (SELECT * FROM CR_DET_TRANSAC WHERE CVE_CONCEPTO = ''IMPBRU'') CDT, ' + coCRLF +
{roim 02/02/06 Se agrega filtro para que los reportes sean más rápidos}
        '       (SELECT * FROM CR_CREDITO  WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_HISTO_CRED WHERE F_CIERRE = ' + SQLFecha( StrToDate(VlFFiltroCre) ) + ')  AND ID_CONTRATO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_EMPRESA = ' + VLIDEmpresa + ') ) CC,' + coCRLF +
{/roim}
//        '       CR_GA_SOL_FEGA CGSF, CR_XTRANSACCION CXT, ' + //EASA4011       02/08/2005
        //< EASA4011      02.AGO.2007
        '       ( select ID_SOLICITUD, ID_CREDITO FROM CR_GA_SOL_FEGA CGF ' + coCRLF +
        '         WHERE CGF.SIT_GAR_SOL_FEG NOT IN (''CA'') ' + coCRLF +  //HERJA JULIO 2013
        '       UNION ' + coCRLF +
        '       select ID_SOLICITUD, ID_CREDITO FROM CR_GA_SOL_NAFIN CGP ' + coCRLF +
        '         WHERE CGP.SIT_GA_SOL_NAFIN NOT IN (''CA'') ' + coCRLF +  //HERJA JULIO 2013        
        '       )CGSF, CR_XTRANSACCION CXT, ' + coCRLF +
        // EASA4011 >/
        '       CONTRATO CTTO,CR_CONTRATO CTO,CR_CVE_OPERACION CCO ' + coCRLF +
{AGF 2011.11.14
        '  WHERE CCO.CVE_PARAMETRO  IN ' + VLIncrementa + coCRLF +
/AGF 2011.11.14}
        '  WHERE CCO.CVE_PARAMETRO IN ' + coCRLF +
        '                              (''PGCPGF'', ''PGCPGP'',   --Capital +' + coCRLF +
        '                               ''RCGFCP'', ''RCGPCP'',   --Capital -' + coCRLF +
        '                               ''PGINGF'', ''PGINGP'',   --Interés +' + coCRLF +
        '                               ''RCGFIN'', ''RCGPIN'',   --Interés -' + coCRLF +
        '                               ''PGFNGF'', ''PGFNGP'',   --Financiamiento adicional +' + coCRLF +
        '                               ''RCGFFN'', ''RCGPFN'',   --Financiamiento adicional -' + coCRLF +
        '                               ''PGCNGF'', ''PGCNGP'',   --Comisiones +' + coCRLF +
        '                               ''RCGFCN'', ''RCGPCN''    --Comisiones -' + coCRLF +
        '                              )' + coCRLF +
        '    AND CT.ID_CREDITO      = CC.ID_CREDITO         AND CT.CVE_OPERACION   = CCO.CVE_OPERACION ' + coCRLF +
        '    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION     AND CDT.CVE_OPERACION  = CT.CVE_OPERACION ' + coCRLF +
        '    AND CXT.ID_SOLICITUD   = CGSF.ID_SOLICITUD     AND CXT.ID_TRANSACCION = CT.ID_TRANSACCION ' + coCRLF + //EASA4011       02/08/2005
        '    AND CGSF.ID_CREDITO    = CC.ID_CREDITO         AND CTTO.ID_CONTRATO   = CC.ID_CONTRATO ' + coCRLF +
        '    AND CTO.ID_CONTRATO    = CC.ID_CONTRATO        AND CTO.FOL_CONTRATO   = CC.FOL_CONTRATO ' + coCRLF +
        '    AND CCO.CVE_PRODUCTO   = CTO.CVE_PRODUCTO_CRE  AND CCO.CVE_MONEDA     = CTTO.CVE_MONEDA ' + coCRLF +
        '  GROUP BY CT.ID_CREDITO, CT.ID_PERIODO) FEGA ';

(*AGF 2011.11.14
        '  GROUP BY CC.ID_CREDITO, CT.ID_PERIODO) FG_I, ' + coCRLF +
        ' (SELECT CC.ID_CREDITO, CT.ID_PERIODO, SUM(CDT.IMP_CONCEPTO) AS IMP_CONCEPTO ' +
        '  FROM (SELECT * FROM CR_TRANSACCION WHERE SIT_TRANSACCION = ''AC'' ' +
        '        AND ID_TRANS_CANCELA IS NULL AND F_VALOR <= ' + SQLFecha( StrToDate(PPFecha) ) + ') CT, ' +
        '       (SELECT * FROM CR_DET_TRANSAC WHERE CVE_CONCEPTO = ''IMPBRU'') CDT, ' +
//        '       CR_GA_SOL_FEGA CGSF, CR_XTRANSACCION CXT, ' + //EASA4011       02/08/2005

        //< EASA4011      02.AGO.2007
        '       ( select ID_SOLICITUD, ID_CREDITO FROM CR_GA_SOL_FEGA CGF ' +
        '       UNION ' +
        '       select ID_SOLICITUD, ID_CREDITO FROM CR_GA_SOL_NAFIN CGP ' +
        '       )CGSF, CR_XTRANSACCION CXT, ' +
        // EASA4011 >/

        '       CONTRATO CTTO,CR_CONTRATO CTO, ' +
{roim 02/02/06 Se agrega filtro para que los reportes sean más rápidos}
        '       (SELECT * FROM CR_CREDITO  WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_HISTO_CRED WHERE F_CIERRE = ' + SQLFecha( StrToDate(VlFFiltroCre) ) + ')   AND ID_CONTRATO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_EMPRESA = ' + VLIDEmpresa + ') ) CC,' +
{/roim}
        '       CR_CVE_OPERACION CCO' +
        '  WHERE CCO.CVE_PARAMETRO  IN ' + VLDecrementa +
        '    AND CT.ID_CREDITO      = CC.ID_CREDITO         AND CT.CVE_OPERACION = CCO.CVE_OPERACION ' +
        '    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION     AND CDT.CVE_OPERACION = CT.CVE_OPERACION ' +
        '    AND CXT.ID_TRANSACCION = CT.ID_TRANSACCION     AND CXT.ID_SOLICITUD = CGSF.ID_SOLICITUD' + //EASA4011       02/08/2005
        '    AND CC.ID_CREDITO      = CGSF.ID_CREDITO       AND CTTO.ID_CONTRATO = CC.ID_CONTRATO ' +
        '    AND CTO.ID_CONTRATO    = CC.ID_CONTRATO        AND CTO.FOL_CONTRATO = CC.FOL_CONTRATO ' +
        '    AND CCO.CVE_PRODUCTO   = CTO.CVE_PRODUCTO_CRE  AND CCO.CVE_MONEDA  = CTTO.CVE_MONEDA ' +
        '  GROUP BY CC.ID_CREDITO, CT.ID_PERIODO) FG_D ' +
        ' WHERE FG_D.ID_CREDITO (+)= FG_I.ID_CREDITO ' +
        ' AND   FG_D.ID_PERIODO (+)= FG_I.ID_PERIODO ) FEGA ';
/AGF 2011.11.14*)

     Result := VLString;
end;

(* AGF 2011.11.14 Código original
Function TQrContVenc.FormaQuery(  sF_Vencimiento,sF_Programada,sMoneda,
                        sSituacion,sOrden,sTipoReporte,sFecRep,
                        sEmpresa, sSucursal,sGpoProd, sOperDD, sCveCatMin:String;
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
//                        bIncTipoSec, bFinSemana, bOperaBanco:Boolean; iReporte: Integer):String;
                        bIncTipoSec, bFinSemana, bOperaBanco, bOrdxProAdmon:Boolean; iReporte: Integer):String;
{/roim}
Var
    sSQL, sSQL1, sSQL2 ,sSQL3, sSQL4, sSQL5, sSQL6 : String;
    VLBFechaTras : Boolean;
    sSQLWhere, VlSituacion, VLDiaHoy, VLComparador,
    VLTipoRep, sF_Calculo   : String;
    slSQL: TStringList;
Begin
   VLDiaHoy := 'D000';
   If sSituacion = 'VE' Then Begin
      VLBFechaTras := True;
      VlSituacion := 'IM';
   End Else If sSituacion = 'IV' Then Begin
      VLBFechaTras := False;
      VlSituacion := 'IM';
   End Else If sSituacion = 'AC' Then Begin
      VLBFechaTras := False;
      VlSituacion := 'AC';
   End Else Begin
      VLBFechaTras := False;
      VlSituacion := sSituacion;
   End;

   If (((sSituacion = 'VE') Or (sSituacion = 'IM') Or (sSituacion = 'IV')) And  (sFecRep = 'A'))Then
      VLComparador := '<='
   Else VLComparador := '=';

   //ROIM 30/08/2005 SE QUITA ESTE CÓDIGO YA QUE SE SUSTITUYE CON
   //LA FUNCIÓN DE MORAS CON PARAMETRO DE FIN DE DÍA (PKGCRPERIODO.FUNOBTMORA)
   VLTipoRep := '';
   {If Trim(sTipoReporte)='O' Then
      VLTipoRep := '';
   If Trim(sTipoReporte)='C' Then
      VLTipoRep := ' + 1 ';}

   If Trim(sF_Vencimiento) = '' Then
      sF_Calculo := Trim(sF_Programada)
   Else sF_Calculo := Trim(sF_Vencimiento);

   sSQL:=  ' SELECT '+ coCRLF +
            '   NVL(ACCE.F_PAGO,(F_REF.F_REFERENCIA +1 )) - ACCE.F_PROG_PAGO  diasImVe,'+
            '   SUBDIV.ID_CESION        ,       CD.ID_DOCUMENTO, ' + coCRLF +
            '   ACCE.*                  ,       ACCE.NUM_PERIODO AS NUM_PERIODO_PER,'+ coCRLF +
            '   CTO.CVE_MONEDA          ,       M.DESC_MONEDA                   , '+
            '   CC.ID_PROM_ADM          ,       PPR.NOMBRE NOM_PROMOTOR_ADM     , '+
            '   CTO.ID_PERS_ASOCIAD     ,       PPRC.NOMBRE NOM_PROMOTOR_ASO    , '+
            '   CPR.CVE_PRODUCTO_CRE    ,       CPR.DESC_L_PRODUCTO             , '+
            '   CPR.CVE_TIPO_CRED_BC    ,       CTC.DESC_TIPO_CRED              , '+
            '   CC.ID_CONTRATO          ,       CPR.CVE_PRODUCTO_GPO            , '+ coCRLF +
            '   DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PTIT.APELLIDO_PATERNO||'' ''||PTIT.APELLIDO_MATERNO||'' ''||PTIT.NOMBRE_PERSONA) NOMBRE, '+ coCRLF +
            '   SUBDIV.ID_EMISOR        ,       NVL(SUBDIV.CVE_EMISOR_NAFIN,0) CVE_EMISOR_NAFIN,'+
            '   SUBDIV.ID_PROVEEDOR     ,       SUBDIV.NOMBRE_EMISOR    ,   PCE.CVE_TIPO_SECTOR, '+
            '   SUBSTR(PKGCRPERIODO.STPObtChqCte(NVL(SUBDIV.ID_EMISOR,CTO.ID_TITULAR),NVL(SUBDIV.CVE_EMISOR_NAFIN,0),NVL(SUBDIV.ID_CESION,ACCE.ID_CREDITO),NVL(SUBDIV.TIPO_ACRED,''AC''),''AD'',''CR''),1,20) CUENTA_BANCO,'+ coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//            '   PP.NOMBRE NOM_PROVEEDOR ,       CP.ID_PROV_NAFINSA                      , '+
            '   PP.NOMBRE NOM_PROVEEDOR ,       CP.ID_PROV_EXTERNO AS ID_PROV_NAFINSA                      , '+
{/ROIM}
            '   CC.SDO_INSOLUTO         ,       CC.SDO_VIG_TOTAL                        , '+
            '   CC.IMP_CREDITO          ,       CC.CVE_CALCULO                          , '+
            '   0 NO_REFER              ,       CTO.ID_TITULAR                          , '+
            '   MORATORIOS              ,       NVL(CD.IMP_NOMINAL,0) AS IMP_NOMINAL    , '+
//            '   TABVENCTA.CUENTA_VEN_KAP_EX       ,       TABVENCTA.CUENTA_VENCIDA_INT  , '+
//            '   TABIMPCTA.CUENTA_IMPAGADO_KAP     ,       TABIMPCTA.CUENTA_IMPAGADO_INT , '+ coCRLF +

            '   NVL(TABVENCTA.CUENTA_VEN_KAP_EX,TABVENCTAICRE.CVE_CTA_CONT_CAVEEX)   CUENTA_VEN_KAP_EX    ,       NVL(TABVENCTA.CUENTA_VENCIDA_INT,TABVENCTAICRE.CVE_CTA_CONT_INVEEX)     CUENTA_VENCIDA_INT                 , '+ //easa4011    17072005
            '   NVL(TABIMPCTA.CUENTA_IMPAGADO_KAP,TABIMPCTAICRE.CVE_CTA_CONT_CPIMVD)  CUENTA_IMPAGADO_KAP   ,       NVL(TABIMPCTA.CUENTA_IMPAGADO_INT,TABIMPCTAICRE.CVE_CTA_CONT_CIIMVD)  CUENTA_IMPAGADO_INT                 ,    '+ coCRLF +
{ROIM 08122005 SE CAMBIA EL CAMPO FECHA DE TRASPASO DE CR_CREDITO A CR_HISTO_CRED}
            //'   CM.CVE_CAT_MINIMO       ,       CM.DESC_CAT_MINIMO,    CC.F_TRASPASO_VENC, '+ coCRLF +
            '   CM.CVE_CAT_MINIMO       ,       CM.DESC_CAT_MINIMO,    DECODE(CHCR.ID_CREDITO,NULL,CC.F_TRASPASO_VENC,CHCR.F_TRASPASO_VENC) F_TRASPASO_VENC, '+ coCRLF +
            '   DECODE(DECODE(CHCR.ID_CREDITO,NULL,CC.F_TRASPASO_VENC,CHCR.F_TRASPASO_VENC),NULL,' + #39 + ' ' + #39 + ',' + #39 +'*' + #39 + ') B_F_TRASPASO_VENC, '+ coCRLF +
{/ROIM}
            '   NVL(INTREG.GRUPO,0) AS GRUPO, DECODE(ACCE.ORD_ACC,''A'',0,''B'',0,''C'',1,''D'',2,3) GPOACC, '+ coCRLF +
            '   0 AS IVA_MORATORIOS '+ coCRLF +

            //FROM DEL QUERY PRINCIPAL
            ' FROM ' + coCRLF;
            sSQL1 := sSQL;
            sSQL := '';

            //************************CAPITAL
            sSQL:= sSQL +
            ' (SELECT ''A'' ORD_ACC ,CCA.ID_CREDITO,''CAPITAL'' ACCESORIO,CCA.NUM_PERIODO,CCA.PLAZO,(CCA.F_VENCIMIENTO - CCA.PLAZO) F_INICIO, '+ coCRLF +
            '         CCA.F_VENCIMIENTO,CCA.F_PROG_PAGO,CCA.F_PAGO,' +
            '         (PKGCRCOMUN.FUNOBTENTASA(''CP'',CCA.ID_CREDITO,CCA.NUM_PERIODO,CCA.F_VENCIMIENTO-1) * CCA.FACT_MORAS) TASA_APLICADA,' +
            '        (CCA.IMP_CAPITAL - CCA.IMP_PAGADO_HIST ) IMPORTE,0 IMP_IVA,CCA.SIT_CAPITAL, '+
            '        (CCA.IMP_CAPITAL - CCA.IMP_PAGADO_HIST - CCA.IMP_CONCEPTO) IMP_BINTER, '+
            '        CCA.IMP_CONCEPTO IMP_FEGA, '+
            '        (CCA.IMP_BENEF_BCO + CCA.IMP_BENEF_GOB) IMP_BENEFICIO, '+
            '        (CCA.IMP_CAPITAL - CCA.IMP_BENEF_BCO - CCA.IMP_BENEF_GOB  + ' +
            '         CCA.MORATORIOS  - CCA.IMP_PAGADO_HIST ) IMP_TOTAL, CCA.MORATORIOS'+ coCRLF +
            '  FROM  (SELECT CCA.*, CRE.FACT_MORAS, NVL(FEGA.IMP_CONCEPTO,0) IMP_CONCEPTO, '+
            '                NVL( PKGCRPERIODO.FUNOBTMORA( ''CP'',''V'',CCA.ID_CREDITO,CCA.NUM_PERIODO,'  + coCRLF +
            '                NULL,NULL,' +  SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ','+
            '                NULL,''V''), 0 ) AS MORATORIOS, '+ coCRLF +
            '                NVL(  PKGCRCOMUN.STPOBTIMPPAG( ''CP'', ''IMPBRU'',CCA.ID_CREDITO, CCA.NUM_PERIODO,  '   + coCRLF +
            '                NULL,' +  SQLFecha(StrToDate(sF_Calculo )) + ','+ coCRLF +
            '                ''V'',''F'' ), 0 ) AS IMP_PAGADO_HIST '+ coCRLF +
            '         FROM   (SELECT * FROM CR_CAPITAL CCA ' +
            '                 WHERE 1 = 1';

            //<LOLS 30JUN2006 SI SE APLICA FILTRO POR CREDITO O EMPRESA SE AGREGA EN LOS SUBQUERIES>
            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + ' AND   PKGCRACTUALIZA.STPOBTEMPRESA(CCA.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;

            If Trim(sF_Vencimiento)<>'' Then
               sSQL := sSQL + ' AND  CCA.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            If Trim(sF_Programada)<>'' Then
               sSQL := sSQL + ' AND  CCA.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;


            If (Trim(VlSituacion)='IM') Then
            begin
               sSQL := sSQL + ' AND  ((CCA.F_PROG_PAGO < CCA.F_PAGO AND CCA.SIT_CAPITAL <> ''CA'''  + coCRLF +
                              ' AND   CCA.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                              '  OR   (CCA.SIT_CAPITAL = ''IM'' ))' + coCRLF ;
            end;

            sSQL := sSQL + '       ) CCA, '+

{roim 02/02/06 Se agrega filtro para que los reportes sean más rápidos}
//                           ' CR_CREDITO CRE,' +
                           ' (SELECT * FROM CR_CREDITO  WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_HISTO_CRED WHERE F_CIERRE = ' + SQLFecha( StrToDate(VlFFiltroCre) ) + ')   AND ID_CONTRATO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_EMPRESA = ' + VLIDEmpresa + ') ) CRE, ' +
{/roim}

                           {CR_INTERES CI, '} AgregaGarFega('CP',sF_Calculo) + coCRLF + //EASA4011 29072005
                           ' WHERE CRE.ID_CREDITO = CCA.ID_CREDITO ' + {CI.ID_CREDITO    (+)= CCA.ID_CREDITO'  + EASA4011 29072005
                           ' AND   CI.NUM_PERIODO   (+)= CCA.NUM_PERIODO' +EASA4011 29072005
                           ' AND   }
                           ' AND   FEGA.ID_CREDITO  (+)= CCA.ID_CREDITO'  +
                           ' AND   FEGA.ID_PERIODO (+)= CCA.NUM_PERIODO) CCA' + coCRLF ;
            sSQL2 := sSQL;
            sSQL := '';

            //************************INTERES
            sSQL:= sSQL + '  UNION '+ coCRLF +
            '  SELECT ''C'' ORD_ACC ,CCI.ID_CREDITO,''INTERES'' ACCESORIO,CCI.NUM_PERIODO,'+ coCRLF +
            '         CCI.PLAZO,(CCI.F_VENCIMIENTO - CCI.PLAZO) F_INICIO, '+ coCRLF +
            '         CCI.F_VENCIMIENTO,CCI.F_PROG_PAGO,CCI.F_PAGO, CCI.TASA_APLICADA,'+ coCRLF +
            '         (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST) IMPORTE, '+ coCRLF +
            '         CCI.IMP_IVA - CCI.IMP_IVA_PAG_HIST,CCI.SIT_INTERES, '+ coCRLF +
            '         (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST - NVL(CCI.IMP_CONCEPTO,0)) IMP_BINTER, '+ coCRLF +
            '         NVL(CCI.IMP_CONCEPTO,0) IMP_FEGA, '+ coCRLF +
            '         (CCI.IMP_BENEF_BCO + CCI.IMP_BENEF_GOB) IMP_BENEFICIO, '+ coCRLF +
            '         (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST + CCI.IMP_IVA - CCI.IMP_IVA_PAG_HIST - CCI.IMP_BENEF_BCO - CCI.IMP_BENEF_GOB) IMP_TOTAL,  '+  coCRLF +
{roim 02/02/06 Se Agrega moratorios de Interés}
//            '         0 MORATORIOS '+ coCRLF +
            '         CCI.MORATORIOS AS MORATORIOS '+ coCRLF +
{/roim}
            '  FROM  (SELECT CCI.*, FEGA.IMP_CONCEPTO, NVL( PKGCRCOMUN.STPOBTIMPPAG( ''IN'', ''IMPBRU'', '  + coCRLF +
            '                CCI.ID_CREDITO,  CCI.NUM_PERIODO, NULL, ' +  SQLFecha( StrToDate( sF_Calculo ) ) + ','         + coCRLF +
            '                ''V'',''F'' ), 0) AS IMP_PAGADO_HIST,'                      + coCRLF +

{roim 02/02/06 Se Agrega moratorios de Interés}
            '                NVL( PKGCRPERIODO.FUNOBTMORA( ''IN'',''V'',CCI.ID_CREDITO,CCI.NUM_PERIODO,'  + coCRLF +
            '                NULL,NULL,' +  SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ','+
            '                NULL,''V''), 0 ) AS MORATORIOS, '+ coCRLF +
{/roim}
            '                NVL( PKGCRCOMUN.STPOBTIMPPAG( ''IN'', ''IMPIVA'', '  + coCRLF +
            '                CCI.ID_CREDITO,  CCI.NUM_PERIODO, NULL,  ' +  SQLFecha( StrToDate( sF_Calculo ) ) + ','         + coCRLF +
            '                ''V'', ''F'' ), 0) AS IMP_IVA_PAG_HIST '                     + coCRLF +
            '         FROM   (SELECT * FROM CR_INTERES CCI '+
            '                 WHERE 1 = 1';

            //<LOLS 30JUN2006 SI SE APLICA FILTRO POR CREDITO O EMPRESA SE AGREGA EN LOS SUBQUERIES>
            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + ' AND   PKGCRACTUALIZA.STPOBTEMPRESA(CCI.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;

            If Trim(sF_Vencimiento)<>'' Then
               sSQL := sSQL + ' AND CCI.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            If Trim(sF_Programada)<>'' Then
               sSQL := sSQL + ' AND CCI.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;

            If (Trim(VlSituacion)='IM') Then
            begin
               sSQL := sSQL + ' AND ((CCI.F_PROG_PAGO < CCI.F_PAGO AND  CCI.SIT_INTERES <> ''CA''' +  coCRLF +
                              ' AND  CCI.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                              '  OR  (CCI.SIT_INTERES = ''IM'' ))'+  coCRLF ;
            end;
            sSQL := sSQL + '            ) CCI , ' + AgregaGarFega('IN',sF_Calculo) + coCRLF +
                           ' WHERE FEGA.ID_CREDITO  (+)= CCI.ID_CREDITO '  + coCRLF +
                           ' AND   FEGA.ID_PERIODO  (+)= CCI.NUM_PERIODO) CCI' + coCRLF;
            sSQL3 := sSQL;
            sSQL := '';

            //************************REFINANCIAMIENTO
            sSQL:= sSQL + '  UNION '+ coCRLF +
            '  SELECT ''B'' ORD_ACC ,CFA.ID_CREDITO,''REFINANCIAMIENTO'' ACCESORIO,'+ coCRLF +
            '         CFA.NUM_PERIODO,CFA.PLAZO,(CFA.F_VENCIMIENTO - CFA.PLAZO) F_INICIO, '+  coCRLF +
            '         CFA.F_VENCIMIENTO,CFA.F_PROG_PAGO,CFA.F_PAGO, '+
            '         (PKGCRCOMUN.FUNOBTENTASA(''FN'',CFA.ID_CREDITO,CFA.NUM_PERIODO,CFA.F_VENCIMIENTO-1) * CFA.FACT_MORAS) AS TASA_APLICADA,'+ coCRLF +
            '         (CFA.IMP_FINAN_ADIC - CFA.IMP_PAGADO_HIST) IMPORTE,   0 IMP_IVA,CFA.SIT_FINAN_ADIC, '+ coCRLF +
            '         (CFA.IMP_FINAN_ADIC - CFA.IMP_PAGADO_HIST - NVL(CFA.IMP_CONCEPTO,0)) IMP_BINTER, '+ coCRLF +
            '         NVL(CFA.IMP_CONCEPTO,0) IMP_FEGA, '+ coCRLF +
            '         0 IMP_BENEFICIO, '+ coCRLF +
            '         (CFA.IMP_FINAN_ADIC + CFA.MORATORIOS - CFA.IMP_PAGADO_HIST ) IMP_TOTAL,  '+ coCRLF +
            '         CFA.MORATORIOS'+  coCRLF +
            '  FROM ( SELECT CFA.*, CRE.FACT_MORAS, FEGA.IMP_CONCEPTO, NVL( PKGCRPERIODO.FUNOBTMORA(''FN'',''V'' ,CFA.ID_CREDITO ,'  + coCRLF +
            '                CFA.NUM_PERIODO , NULL, NULL,' +  SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ','+ coCRLF +
            '                NULL,''V''), 0 ) AS MORATORIOS,'                               + coCRLF +
            '                NVL( PKGCRCOMUN.STPOBTIMPPAG( ''FN'', ''IMPBRU'', '  + coCRLF +
            '                CFA.ID_CREDITO,  CFA.NUM_PERIODO,   NULL,  ' +  SQLFecha(StrToDate(sF_Calculo )) + ','       + coCRLF +
            '                ''V'',''F'' ), 0 ) AS IMP_PAGADO_HIST '                 + coCRLF +
            '         FROM (SELECT * FROM CR_FINAN_ADIC  CFA ' +
            '                 WHERE 1 = 1';

            //<LOLS 30JUN2006 SI SE APLICA FILTRO POR CREDITO O EMPRESA SE AGREGA EN LOS SUBQUERIES>
            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + ' AND   PKGCRACTUALIZA.STPOBTEMPRESA(CFA.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;

            If Trim(sF_Vencimiento)<>'' Then
               sSQL := sSQL + ' AND CFA.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            If Trim(sF_Programada)<>'' Then
               sSQL := sSQL + ' AND CFA.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;

            If (Trim(VlSituacion)='IM')Then
            begin
               sSQL := sSQL + ' AND ((CFA.F_PROG_PAGO < CFA.F_PAGO AND ' + coCRLF +  '  CFA.SIT_FINAN_ADIC <> ''CA''' + coCRLF +
                              ' AND  CFA.F_PAGO > '+ SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                              '  OR  (CFA.SIT_FINAN_ADIC = ''IM'' ))'+  coCRLF ;
            end;

            sSQL := sSQL + '             )  CFA, CR_CREDITO CRE, ' + AgregaGarFega('FN',sF_Calculo) + coCRLF +
                           ' WHERE  CRE.ID_CREDITO = CFA.ID_CREDITO'  + coCRLF +
                           ' AND    FEGA.ID_CREDITO  (+)= CFA.ID_CREDITO'  + coCRLF +
                           ' AND    FEGA.ID_PERIODO (+)= CFA.NUM_PERIODO )CFA' + coCRLF ;
            sSQL4 := sSQL;
            sSQL := '';

            //************************COMISIONES
            sSQL:= sSQL + '  UNION '+  coCRLF +
            '  SELECT ''D'' ORD_ACC ,CCC.ID_CREDITO,CCC.DESC_COMISION,CCC.NUM_PERIODO,0 PLAZO,'+ coCRLF +
            '         CCC.F_VENCIMIENTO F_INICIO, '+  coCRLF +
            '         CCC.F_VENCIMIENTO,CCC.F_PROG_PAGO,CCC.F_PAGO,'+  coCRLF +
            '         (PKGCRCOMUN.FUNOBTENTASA(''CN'',CCC.ID_CREDITO,CCC.NUM_PERIODO,CCC.F_VENCIMIENTO-1) * CCC.FACT_MORAS) AS TASA_APLICADA,'+ coCRLF +
            '         (CCC.IMP_COMISION - CCC.IMP_PAGADO_HIST) IMPORTE,'+ coCRLF +
            '         CCC.IMP_IVA-CCC.IMP_IVA_PAG_HIST,CCC.SIT_COMISION, '+ coCRLF +
            '         (CCC.IMP_COMISION - CCC.IMP_PAGADO_HIST - NVL(CCC.IMP_CONCEPTO,0)) IMP_BINTER, '+ coCRLF +
            '         NVL(CCC.IMP_CONCEPTO,0) IMP_FEGA, '+ coCRLF +
            '         0 IMP_BENEFICIO, '+ coCRLF +
            '         (CCC.IMP_COMISION  + CCC.IMP_IVA + CCC.MORATORIOS - CCC.IMP_PAGADO_HIST -CCC.IMP_IVA_PAG_HIST) IMP_TOTAL, '+ coCRLF +
            '         CCC.MORATORIOS'+  coCRLF +
            '  FROM ( SELECT CCC.*, CRE.FACT_MORAS, FEGA.IMP_CONCEPTO, CCCO.DESC_COMISION,'+ coCRLF +
            '                NVL( PKGCRPERIODO.FUNOBTMORA( ''CN'' ,''V'' ,CCC.ID_CREDITO ,CCC.NUM_PERIODO , CCC.CVE_COMISION ,'+ coCRLF +
            '                NULL,TO_DATE('#39+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Calculo))+#39',''DD/MM/YYYY'')' + VLTipoRep + ','+ coCRLF +
            '                NULL,''V''), 0 ) AS MORATORIOS, '+ coCRLF +
            '                NVL( PKGCRCOMUN.STPOBTIMPPAG( ''CN'', ''IMPBRU'', '      +
            '                CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,' +  SQLFecha(StrToDate(sF_Calculo )) + ','   + coCRLF +
            '                ''V'', ''F'' ), 0 ) AS IMP_PAGADO_HIST, '                   + coCRLF +
            '                NVL( PKGCRCOMUN.STPOBTIMPPAG( ''CN'', ''IMPIVA'', '      + coCRLF +
            '                CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,' +  SQLFecha(StrToDate(sF_Calculo )) + ','   + coCRLF +
            '                ''V'',''F'' ), 0 ) AS IMP_IVA_PAG_HIST '                   + coCRLF +
            '         FROM   (SELECT * FROM CR_COMISION CCC ' +
            '                 WHERE 1 = 1';

            //<LOLS 30JUN2006 SI SE APLICA FILTRO POR CREDITO O EMPRESA SE AGREGA EN LOS SUBQUERIES>
            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + ' AND   PKGCRACTUALIZA.STPOBTEMPRESA(CCC.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;


            If Trim(sF_Vencimiento)<>'' Then
               sSQL := sSQL + ' AND CCC.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            If Trim(sF_Programada)<>'' Then
               sSQL := sSQL + ' AND CCC.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;

            If (Trim(VlSituacion)='IM')Then
            begin
               sSQL := sSQL + ' AND  ((CCC.F_PROG_PAGO < CCC.F_PAGO AND ' +  coCRLF + '  CCC.SIT_COMISION <> ''CA''' +  coCRLF +
                              ' AND   CCC.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                              '  OR   (CCC.SIT_COMISION = ''IM'' ))'+  coCRLF ;
            end;

            sSQL := sSQL + '             ) CCC, CR_CAT_COMISION CCCO , CR_CREDITO CRE, ' + AgregaGarFega('CN',sF_Calculo) + coCRLF +
                           ' WHERE  CCCO.CVE_COMISION = CCC.CVE_COMISION '+  coCRLF +
                           ' AND    CRE.ID_CREDITO = CCC.ID_CREDITO'  + coCRLF +
                           ' AND    FEGA.ID_CREDITO  (+)= CCC.ID_CREDITO'  + coCRLF +
                           ' AND    FEGA.ID_PERIODO (+)= CCC.NUM_PERIODO ' + coCRLF;

            If (iReporte =0)Or(iReporte =1) Then Begin
               If (iReporte =0) Then
                  sSQL:= sSQL + ' AND CCC.CVE_COMISION IN (SELECT CVE_COMISION  FROM CR_CAT_COMISION WHERE NVL(CVE_GRUPO_COMIS,0) <> '''+
                                  sCveGpoComis +''')'+ coCRLF;
               If(iReporte =1) Then
                  sSQL:= sSQL + ' AND CCC.CVE_COMISION IN (SELECT CVE_COMISION  FROM CR_CAT_COMISION WHERE NVL(CVE_GRUPO_COMIS,0) = '''+
                                  sCveGpoComis +''')'+ coCRLF;
            End;
            sSQL := sSQL + '  ) CCC' + coCRLF;
            sSQL5 := sSQL;
            sSQL := '';

            //************************ FIN DE UNION
            sSQL:= sSQL + ') ACCE, '+  coCRLF ;

            if Trim(sF_Vencimiento)<>'' then
               sSQL:= sSQL + ' (SELECT ' + ' TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Vencimiento))+''',''DD/MM/YYYY'')' + ' AS F_REFERENCIA FROM DUAL) F_REF, '+  coCRLF
            else
               sSQL:= sSQL + ' (SELECT ' + ' TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Programada))+''',''DD/MM/YYYY'')' + ' AS F_REFERENCIA FROM DUAL) F_REF, '+  coCRLF ;

            sSQL:= sSQL +
{roim 02/02/06 Se agrega filtro para que los reportes sean más rápidos}
//            ' CR_CREDITO        CC, '+  coCRLF +
            ' (SELECT * FROM CR_CREDITO  WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_HISTO_CRED WHERE F_CIERRE = ' + SQLFecha( StrToDate(VlFFiltroCre) ) + ')   AND ID_CONTRATO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_EMPRESA = ' + VLIDEmpresa + ') ) CC, '+  coCRLF +
{/roim}
            ' (SELECT SUB.CVE_SUB_DIVISION CVE_EMISOR_NAFIN, SUB.NOMBRE_SUB_DIV NOMBRE_EMISOR,'+
            '         ID_ACREDITADO ID_EMISOR, PROCAM.ID_CREDITO  ID_CESION,'+
            '         0 ID_PROVEEDOR, ''F'' B_OPERADO_NAFIN, ''AP'' TIPO_ACRED'+  coCRLF +
            '  FROM CR_SUBDIV_PROCAM SUB, CR_PROCAMPO PROCAM'+  coCRLF +
            '  WHERE PROCAM.CVE_SUB_DIVISION = SUB.CVE_SUB_DIVISION'+  coCRLF +
            '  UNION'+  coCRLF +
            '  SELECT CS.CVE_EMISOR_NAFIN, CE.NOMBRE_EMISOR ID_EMISOR,'+
            '         CE.ID_ACREDITADO , CS.ID_CESION,'+
            '         CS.ID_PROVEEDOR, CS.B_OPERADO_NAFIN, ''AC'' TIPO_ACRED'+  coCRLF +
            '  FROM CR_EMISOR CE, CR_CESION CS'+  coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//            '  WHERE CS.ID_EMISOR = CE.ID_ACREDITADO'+  coCRLF +
//            '  AND   CS.CVE_EMISOR_NAFIN = CE.CVE_EMISOR_NAFIN'+  coCRLF +
            '  WHERE CS.ID_EMISOR = CE.CVE_FND_ENT_DES'+  coCRLF +
            '  AND   CS.ID_EMISOR = CE.ID_ACREDITADO'+  coCRLF +
            '  AND   CS.CVE_EMISOR_NAFIN = CE.CVE_EMISOR_EXT'+  coCRLF +
{/ROIM}
            ' )SUBDIV, '+  coCRLF +

            ' (SELECT * FROM CONTRATO WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CREDITO))         CTO, '+  coCRLF +
            ' MONEDA            M, '+
            ' PERSONA           PPR, '+
            ' PERSONA           PPRC, '+
//            ' CR_CONTRATO       CCTO, '+
            ' (SELECT CCTO.*, CPRO.ID_EMPRESA FROM   CR_PRODUCTO CPRO, CR_CONTRATO CCTO WHERE  CPRO.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE) CCTO,';


{roim 02/02/06 Se agrega filtro para que los reportes sean más rápidos}
            If (Trim(sEmpresa)<>'') Then
                  //sSQL:= sSQL + ' AND CPR.ID_EMPRESA ='+ Trim(sEmpresa) +coCRLF
                  sSQL:= sSQL + ' (SELECT * FROM CR_PRODUCTO WHERE ID_EMPRESA = '+ Trim(sEmpresa) +') CPR, '
            ELSE
                 sSQL:= sSQL +  ' CR_PRODUCTO       CPR, ';
            //end if
{/roim}
            sSQL:= sSQL +
            ' CR_TIP_CRED_BC    CTC, '+
            ' PERSONA_FISICA    PTIT, '+
            ' PERSONA           PCE, '+
            ' PERSONA           PP, '+
            ' CR_PROVEEDOR      CP, '+
{roim 02/02/06 Se agrega filtro para que los reportes sean más rápidos}
//            ' CR_CESION, '+
              ' (SELECT * FROM CR_CESION  WHERE ID_CESION IN (SELECT ID_CREDITO FROM CR_HISTO_CRED WHERE F_CIERRE = ' + SQLFecha( StrToDate(VlFFiltroCre) ) + ')) CR_CESION, ' +
{/roim}

{ROIM 08122005 SE CAMBIA EL CAMPO FECHA DE TRASPASO DE CR_CREDITO A CR_HISTO_CRED}
            ' (SELECT * FROM CR_HISTO_CRED '+  coCRLF +
            '  WHERE  F_CIERRE = ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ') CHCR, ' +
{/ROIM}

            C_QUERY_CTAS_IMP_ICRE +
            C_QUERY_CTAS_VEN_ICRE+
            C_QUERY_CTAS_IMP +
            C_QUERY_CTAS_VEN+ //easa4011        17072005


{roim 02/02/06 Se agrega filtro para que los reportes sean más rápidos}
//            ' CR_DOCUMENTO      CD, '+  coCRLF +
              ' (SELECT * FROM CR_DOCUMENTO  WHERE ID_CESION IN (SELECT ID_CREDITO FROM CR_HISTO_CRED WHERE F_CIERRE = ' + SQLFecha( StrToDate(VlFFiltroCre) ) + ')) CD, '+  coCRLF +
{/roim}

            ' CR_CAT_MINIMO	CM , '+  coCRLF;

            If bOperaBanco Or (Trim(sOperDD)<>'')Then
               sSQL:= sSQL + ' CR_FND_CREDITO CFC, '+ coCRLF;

            sSQL:= sSQL +
            //Esta tabla es para saber si son intereses registrados o intereses pendientes de registrar
            '('+  coCRLF +
            '        SELECT ''C'' ORD_ACC, 0 AS GRUPO, CI.ID_CREDITO, CI.NUM_PERIODO,'+  coCRLF +
            '               (CI.F_VENCIMIENTO-CI.PLAZO) F_INICIO ,'+  coCRLF +
            '               CI.F_VENCIMIENTO , CC.F_TRASPASO_VENC'+  coCRLF +
{ROIM 08122005 SE CAMBIA EL CAMPO FECHA DE TRASPASO DE CR_CREDITO A CR_HISTO_CRED}
            //'          FROM CR_CREDITO CC,  CR_INTERES CI'+  coCRLF +
            '           FROM  CR_INTERES CI,  (SELECT CC.ID_CREDITO, DECODE(CHC.ID_CREDITO,NULL,CC.F_TRASPASO_VENC,CHC.F_TRASPASO_VENC) AS F_TRASPASO_VENC '+  coCRLF +
                                             ' FROM (SELECT * FROM CR_HISTO_CRED '+  coCRLF +
                                                   ' WHERE  F_CIERRE = ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ') CHC, CR_CREDITO CC '+  coCRLF +
                                             ' WHERE CHC.ID_CREDITO (+)= CC.ID_CREDITO) CC'+  coCRLF +
{/ROIM}
            '         WHERE CI.ID_CREDITO = CC.ID_CREDITO'+  coCRLF +
            '           AND CC.F_TRASPASO_VENC IS NOT NULL'+  coCRLF +
            '           AND ((CC.F_TRASPASO_VENC BETWEEN (CI.F_VENCIMIENTO-CI.PLAZO) AND CI.F_VENCIMIENTO'+  coCRLF +
            '                 AND CC.F_TRASPASO_VENC - (CI.F_VENCIMIENTO-CI.PLAZO) >= CI.F_VENCIMIENTO - CC.F_TRASPASO_VENC)'+  coCRLF +
            '            OR CI.F_VENCIMIENTO <= CC.F_TRASPASO_VENC)'+  coCRLF +
            '        UNION ALL'+  coCRLF +
            '        SELECT ''C'' ORD_ACC, 1 AS GRUPO, CI.ID_CREDITO, CI.NUM_PERIODO,'+  coCRLF +
            '               (CI.F_VENCIMIENTO-CI.PLAZO) F_INICIO,'+  coCRLF +
            '               CI.F_VENCIMIENTO , CC.F_TRASPASO_VENC'+  coCRLF +
{ROIM 08122005 SE CAMBIA EL CAMPO FECHA DE TRASPASO DE CR_CREDITO A CR_HISTO_CRED}
            //'          FROM CR_CREDITO CC,  CR_INTERES CI'+  coCRLF +
            '           FROM  CR_INTERES CI,  (SELECT CC.ID_CREDITO, DECODE(CHC.ID_CREDITO,NULL,CC.F_TRASPASO_VENC,CHC.F_TRASPASO_VENC) AS F_TRASPASO_VENC '+  coCRLF +
                                             ' FROM (SELECT * FROM CR_HISTO_CRED '+  coCRLF +
                                                   ' WHERE  F_CIERRE = ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ') CHC, CR_CREDITO CC '+  coCRLF +
                                             ' WHERE CHC.ID_CREDITO (+)= CC.ID_CREDITO) CC'+  coCRLF +
{/ROIM}
            '         WHERE CI.ID_CREDITO = CC.ID_CREDITO'+  coCRLF +
            '           AND CC.F_TRASPASO_VENC IS NOT NULL'+  coCRLF +
            '           AND ((CC.F_TRASPASO_VENC BETWEEN (CI.F_VENCIMIENTO-CI.PLAZO) AND CI.F_VENCIMIENTO'+  coCRLF +
            '                 AND (CC.F_TRASPASO_VENC - (CI.F_VENCIMIENTO-CI.PLAZO)) < (CI.F_VENCIMIENTO - CC.F_TRASPASO_VENC))'+  coCRLF +
            '            OR  ((CI.F_VENCIMIENTO > CC.F_TRASPASO_VENC)AND (CI.F_VENCIMIENTO-CI.PLAZO) >CC.F_TRASPASO_VENC))'+  coCRLF +
            ' ) INTREG '+  coCRLF +
            /////////

            ' WHERE CC.ID_CREDITO         = ACCE.ID_CREDITO'+
{ROIM 08122005 SE CAMBIA EL CAMPO FECHA DE TRASPASO DE CR_CREDITO A CR_HISTO_CRED}
            ' AND   CHCR.ID_CREDITO    (+)= CC.ID_CREDITO'+
{/ROIM}
            ' AND   CCTO.ID_CONTRATO      = CC.ID_CONTRATO '+
            ' AND   CCTO.FOL_CONTRATO     = CC.FOL_CONTRATO ' +
            ' AND   CTO.ID_CONTRATO       = CC.ID_CONTRATO '+
            ' AND   M.CVE_MONEDA          = CTO.CVE_MONEDA '+
            ' AND   PPR.ID_PERSONA        = CC.ID_PROM_ADM '+
            ' AND   PPRC.ID_PERSONA       = CTO.ID_PERS_ASOCIAD '+
            ' AND   CPR.CVE_PRODUCTO_CRE  = CCTO.CVE_PRODUCTO_CRE '+
            ' AND   CTC.CVE_TIPO_CRED_BC(+)= CPR.CVE_TIPO_CRED_BC '+   //EASA4011      28022005
            ' AND   PTIT.ID_PERSONA    (+)= CTO.ID_TITULAR '+
            ' AND   PCE.ID_PERSONA     (+)= CTO.ID_TITULAR '+
            ' AND   SUBDIV.ID_CESION   (+)= CC.ID_CREDITO '+
            ' AND   PP.ID_PERSONA      (+)= SUBDIV.ID_PROVEEDOR '+
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
            ' AND   CP.CVE_FND_ENT_DES   (+)= CR_CESION.CVE_FND_ENT_DES '+
//            ' AND   CP.ID_ACREDITADO   (+)= SUBDIV.ID_PROVEEDOR '+
            ' AND   CP.ID_ACREDITADO   (+)= CR_CESION.ID_PROVEEDOR '+
{/ROIM}
            ' AND   CD.ID_CESION       (+)= ACCE.ID_CREDITO '+
            ' AND   CD.NUM_PERIODO_DOC (+)= ACCE.NUM_PERIODO '+
            ' AND   CR_CESION.ID_CESION (+)= CC.ID_CREDITO '+

            ' AND   TABVENCTAICRE.ID_EMPRESA (+)= CCTO.ID_EMPRESA'+ coCRLF +
            ' AND   TABVENCTAICRE.CVE_PRODUCTO_CRE (+)= CCTO.CVE_PRODUCTO_CRE'+ coCRLF +
            ' AND   TABVENCTAICRE.CVE_MONEDA (+)= CCTO.CVE_MONEDA'+ coCRLF +
            ' AND   TABIMPCTAICRE.ID_EMPRESA (+)= CCTO.ID_EMPRESA'+ coCRLF +
            ' AND   TABIMPCTAICRE.CVE_PRODUCTO_CRE (+)= CCTO.CVE_PRODUCTO_CRE'+ coCRLF +
            ' AND   TABIMPCTAICRE.CVE_MONEDA (+)= CCTO.CVE_MONEDA'+ coCRLF +

            ' AND   TABVENCTA.CVE_PRODUCTO_CRE (+)= CPR.CVE_PRODUCTO_CRE ' + coCRLF + //easa 17072005
            ' AND   TABIMPCTA.CVE_PRODUCTO_CRE (+)= CPR.CVE_PRODUCTO_CRE ' + coCRLF + //easa4011      29122004
            ' AND   CM.CVE_CAT_MINIMO   = CPR.CVE_CLAS_CONTAB '+ coCRLF +
            ' AND   INTREG.ID_CREDITO  (+)= ACCE.ID_CREDITO '+ coCRLF +
            ' AND   INTREG.NUM_PERIODO (+)= ACCE.NUM_PERIODO '+ coCRLF +
            ' AND   INTREG.ORD_ACC     (+)= ACCE.ORD_ACC '+ coCRLF;


            If bOperaBanco Or (Trim(sOperDD)<>'')Then
               sSQL:= sSQL + ' AND CC.ID_CREDITO = CFC.ID_CREDITO '+ coCRLF;
   //FILTROS DE QUERY PRINCIPAL
   If ((sSituacion = 'VE') or (sSituacion = 'IM'))  Then Begin
      If VLBFechaTras Then
{ROIM 08122005 SE CAMBIA EL CAMPO FECHA DE TRASPASO DE CR_CREDITO A CR_HISTO_CRED}
//         sSQL:= sSQL + ' AND CC.F_TRASPASO_VENC IS NOT NULL '+  coCRLF
//      Else sSQL:= sSQL + ' AND CC.F_TRASPASO_VENC IS NULL '+  coCRLF;
         sSQL:= sSQL + ' AND DECODE(CHCR.ID_CREDITO,NULL,CC.F_TRASPASO_VENC,CHCR.F_TRASPASO_VENC) IS NOT NULL '+  coCRLF
      Else sSQL:= sSQL + ' AND DECODE(CHCR.ID_CREDITO,NULL,CC.F_TRASPASO_VENC,CHCR.F_TRASPASO_VENC) IS NULL '+  coCRLF;
{/ROIM}
   End;
   If (Trim(sMoneda)<>'') Then
       sSQL:= sSQL + ' AND CTO.CVE_MONEDA ='+sMoneda +  coCRLF ;
   If ((Trim(VlSituacion)<>'') and (Trim(VlSituacion)<>'IM')) Then
       sSQL:= sSQL + ' AND ACCE.SIT_CAPITAL ='''+ VlSituacion+''''+  coCRLF ;
   If (Trim(sGpoProd)<>'') Then
      sSQL:= sSQL + ' AND CPR.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd )+ coCRLF;
   If Trim(sOperDD)<>'' Then
      sSQL:= sSQL + ' AND CFC.CVE_FND_ENT_DES ='+ SQLStr( Trim(sOperDD) )+ coCRLF;
   If bOperaBanco Then
      sSQL:= sSQL + ' AND CC.ID_CREDITO NOT IN (SELECT ID_CREDITO FROM CR_FND_CREDITO)'+ coCRLF;
   If bFinSemana Then
      sSQL:= sSQL + ' AND ACCE.F_VENCIMIENTO < ACCE.F_PROG_PAGO '+ coCRLF;
   If Trim(sCveCatMin)<>'' Then
      sSQL:= sSQL + ' AND   CM.CVE_CAT_MINIMO   ='''+ Trim(sCveCatMin) +''''+  coCRLF ;

   If (iReporte =0)Or(iReporte =1) Then Begin
      If (iReporte =0) Then
{         sSQL:= sSQL + ' AND CC.ID_CREDITO NOT IN (SELECT ID_CREDITO'+
                                                  '  FROM CR_COMISION CO, CR_CAT_COMISION CAT'+
                                                  ' WHERE CAT.CVE_COMISION= CO.CVE_COMISION'+
                                                  '   AND NVL(CAT.CVE_GRUPO_COMIS,0)='''+ sCveGpoComis + ''''+
                                                  ' GROUP BY ID_CREDITO)'+ coCRLF;}

        sSQL:= sSQL + ' AND  CPR.CVE_PRODUCTO_GPO NOT IN ( ''AGRONE'', ''CBINTE'')';

      If(iReporte =1) Then
{         sSQL:= sSQL + ' AND CC.ID_CREDITO IN (SELECT ID_CREDITO'+
                                              '  FROM CR_COMISION CO, CR_CAT_COMISION CAT'+
                                              ' WHERE CAT.CVE_COMISION= CO.CVE_COMISION'+
                                              '   AND NVL(CAT.CVE_GRUPO_COMIS,0)='''+ sCveGpoComis + ''''+
                                              ' GROUP BY ID_CREDITO)'+ coCRLF;}

        sSQL:= sSQL + ' AND  CPR.CVE_PRODUCTO_GPO IN ( ''AGRONE'', ''CBINTE'')';

   End;


   //ORDER DE QUERY PRINCIPAL
   sSQL:= sSQL +' ORDER BY DESC_MONEDA, CPR.CVE_PRODUCTO_GPO, CPR.CVE_PRODUCTO_CRE ,'+  coCRLF; //DESC_L_PRODUCTO
   if bIncTipoSec then
      sSQL:= sSQL + ' PCE.CVE_TIPO_SECTOR,'+  coCRLF ;
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
   if bOrdxProAdmon    then
      sSQL:= sSQL + ' NOM_PROMOTOR_ADM,'+  coCRLF ;
{/roim}
   If Trim(sOrden)='A' Then
      sSQL:= sSQL + ' NOMBRE,CC.ID_CREDITO'+  coCRLF
   Else  sSQL:= sSQL + ' CC.ID_CREDITO,NOMBRE'+  coCRLF ;
   sSQL := sSQL + ',DECODE(ACCE.ORD_ACC,''A'',0,''B'',0,''C'',1,''D'',2,3), NVL(INTREG.GRUPO,0), ACCE.NUM_PERIODO';
   sSQL6 := sSQL;

   slSQL:= TStringList.Create;
   slSQL.Clear;
   slSQL.Add(sSQL1 + sSQL2 + sSQL3 + sSQL4 + sSQL5 + sSQL6);
   slSQL.SaveToFile('c:\SQL.txt');
   slSQL.Free;
   Result:= sSQL1 + sSQL2 + sSQL3 + sSQL4 + sSQL5 + sSQL6;
End;

AGF 2011.11.14*)

Function TQrContVenc.FormaQuery(  sF_Vencimiento,sF_Programada,sMoneda,
                        sSituacion,sOrden,sTipoReporte,sFecRep,
                        sEmpresa, sSucursal,sGpoProd, sOperDD, sCveCatMin:String;
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
//                        bIncTipoSec, bFinSemana, bOperaBanco:Boolean; iReporte: Integer):String;
                        bIncTipoSec, bFinSemana, bOperaBanco, bOrdxProAdmon:Boolean; iReporte: Integer):String;
{/roim}
Var
    sSQL, sSQL1, sSQL2 ,sSQL3, sSQL4, sSQL5, sSQL6 : String;
    VLBFechaTras : Boolean;
    sSQLWhere, VlSituacion, VLDiaHoy, VLComparador,
    VLTipoRep, sF_Calculo   : String;
    slSQL: TStringList;
Begin
   VLDiaHoy := 'D000';
   If sSituacion = 'VE' Then Begin
      VLBFechaTras := True;
      VlSituacion := 'IM';
   End Else If sSituacion = 'IV' Then Begin
      VLBFechaTras := False;
      VlSituacion := 'IM';
   End Else If sSituacion = 'AC' Then Begin
      VLBFechaTras := False;
      VlSituacion := 'AC';
   End Else Begin
      VLBFechaTras := False;
      VlSituacion := sSituacion;
   End;

   If (((sSituacion = 'VE') Or (sSituacion = 'IM') Or (sSituacion = 'IV')) And  (sFecRep = 'A'))Then
      VLComparador := '<='
   Else VLComparador := '=';

   //ROIM 30/08/2005 SE QUITA ESTE CÓDIGO YA QUE SE SUSTITUYE CON
   //LA FUNCIÓN DE MORAS CON PARAMETRO DE FIN DE DÍA (PKGCRPERIODO.FUNOBTMORA)
   VLTipoRep := '';
   {If Trim(sTipoReporte)='O' Then
      VLTipoRep := '';
   If Trim(sTipoReporte)='C' Then
      VLTipoRep := ' + 1 ';}

   If Trim(sF_Vencimiento) = '' Then
      sF_Calculo := Trim(sF_Programada)
   Else sF_Calculo := Trim(sF_Vencimiento);

   sSQL:=  ' SELECT '+ coCRLF +
            '   NVL(ACCE.F_PAGO,(F_REF.F_REFERENCIA +1 )) - ACCE.F_PROG_PAGO  diasImVe,'+
            '   SUBDIV.ID_CESION        ,       CD.ID_DOCUMENTO, ' + coCRLF +
            '   ACCE.*                  ,       ACCE.NUM_PERIODO AS NUM_PERIODO_PER,'+ coCRLF +
            '   CTO.CVE_MONEDA          ,       M.DESC_MONEDA                   , '+
            '   CC.ID_PROM_ADM          ,       PPR.NOMBRE NOM_PROMOTOR_ADM     , '+
            '   CTO.ID_PERS_ASOCIAD     ,       PPRC.NOMBRE NOM_PROMOTOR_ASO    , '+
            '   CPR.CVE_PRODUCTO_CRE    ,       CPR.DESC_L_PRODUCTO             , '+
            '   CPR.CVE_TIPO_CRED_BC    ,       CTC.DESC_TIPO_CRED              , '+
            '   CC.ID_CONTRATO          ,       CPR.CVE_PRODUCTO_GPO            , '+ coCRLF +
            '   DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PTIT.APELLIDO_PATERNO||'' ''||PTIT.APELLIDO_MATERNO||'' ''||PTIT.NOMBRE_PERSONA) NOMBRE, '+ coCRLF +
            '   SUBDIV.ID_EMISOR        ,       NVL(SUBDIV.CVE_EMISOR_NAFIN,0) CVE_EMISOR_NAFIN,'+
            '   SUBDIV.ID_PROVEEDOR     ,       SUBDIV.NOMBRE_EMISOR    ,   PCE.CVE_TIPO_SECTOR, '+
            '   SUBSTR(PKGCRPERIODO.STPObtChqCte(NVL(SUBDIV.ID_EMISOR,CTO.ID_TITULAR),NVL(SUBDIV.CVE_EMISOR_NAFIN,0),NVL(SUBDIV.ID_CESION,ACCE.ID_CREDITO),NVL(SUBDIV.TIPO_ACRED,''AC''),''AD'',''CR''),1,20) CUENTA_BANCO,'+ coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//            '   PP.NOMBRE NOM_PROVEEDOR ,       CP.ID_PROV_NAFINSA                      , '+
            '   PP.NOMBRE NOM_PROVEEDOR ,       CP.ID_PROV_EXTERNO AS ID_PROV_NAFINSA                      , '+
{/ROIM}
            '   CC.SDO_INSOLUTO         ,       CC.SDO_VIG_TOTAL                        , '+
            '   CC.IMP_CREDITO          ,       CC.CVE_CALCULO                          , '+
            '   0 NO_REFER              ,       CTO.ID_TITULAR                          , '+
            '   MORATORIOS              ,       NVL(CD.IMP_NOMINAL,0) AS IMP_NOMINAL    , '+
//            '   TABVENCTA.CUENTA_VEN_KAP_EX       ,       TABVENCTA.CUENTA_VENCIDA_INT  , '+
//            '   TABIMPCTA.CUENTA_IMPAGADO_KAP     ,       TABIMPCTA.CUENTA_IMPAGADO_INT , '+ coCRLF +

            '   NVL(TABVENCTA.CUENTA_VEN_KAP_EX,TABVENCTAICRE.CVE_CTA_CONT_CAVEEX)   CUENTA_VEN_KAP_EX    ,       NVL(TABVENCTA.CUENTA_VENCIDA_INT,TABVENCTAICRE.CVE_CTA_CONT_INVEEX)     CUENTA_VENCIDA_INT                 , '+ //easa4011    17072005
            '   NVL(TABIMPCTA.CUENTA_IMPAGADO_KAP,TABIMPCTAICRE.CVE_CTA_CONT_CPIMVD)  CUENTA_IMPAGADO_KAP   ,       NVL(TABIMPCTA.CUENTA_IMPAGADO_INT,TABIMPCTAICRE.CVE_CTA_CONT_CIIMVD)  CUENTA_IMPAGADO_INT                 ,    '+ coCRLF +
{ROIM 08122005 SE CAMBIA EL CAMPO FECHA DE TRASPASO DE CR_CREDITO A CR_HISTO_CRED}
            //'   CM.CVE_CAT_MINIMO       ,       CM.DESC_CAT_MINIMO,    CC.F_TRASPASO_VENC, '+ coCRLF +
            '   CM.CVE_CAT_MINIMO       ,       CM.DESC_CAT_MINIMO,    DECODE(CHCR.ID_CREDITO,NULL,CC.F_TRASPASO_VENC,CHCR.F_TRASPASO_VENC) F_TRASPASO_VENC, '+ coCRLF +
            '   DECODE(DECODE(CHCR.ID_CREDITO,NULL,CC.F_TRASPASO_VENC,CHCR.F_TRASPASO_VENC),NULL,' + #39 + ' ' + #39 + ',' + #39 +'*' + #39 + ') B_F_TRASPASO_VENC, '+ coCRLF +
{/ROIM}
            '   NVL(INTREG.GRUPO,0) AS GRUPO, DECODE(ACCE.ORD_ACC,''A'',0,''B'',0,''C'',1,''D'',2,3) GPOACC, '+ coCRLF +
            '   0 AS IVA_MORATORIOS '+ coCRLF +

            //FROM DEL QUERY PRINCIPAL
            ' FROM ' + coCRLF;
            sSQL1 := sSQL;
            sSQL := '';


(* AGF 2011.11.14 Optimización del reporte

            //************************CAPITAL
            sSQL:= sSQL +
            ' (SELECT ''A'' ORD_ACC ,CCA.ID_CREDITO,''CAPITAL'' ACCESORIO,CCA.NUM_PERIODO,CCA.PLAZO,(CCA.F_VENCIMIENTO - CCA.PLAZO) F_INICIO, '+ coCRLF +
            '         CCA.F_VENCIMIENTO,CCA.F_PROG_PAGO,CCA.F_PAGO,' +
            '         (PKGCRCOMUN.FUNOBTENTASA(''CP'',CCA.ID_CREDITO,CCA.NUM_PERIODO,CCA.F_VENCIMIENTO-1) * CCA.FACT_MORAS) TASA_APLICADA,' +
            '        (CCA.IMP_CAPITAL - CCA.IMP_PAGADO_HIST ) IMPORTE,0 IMP_IVA,CCA.SIT_CAPITAL, '+
            '        (CCA.IMP_CAPITAL - CCA.IMP_PAGADO_HIST - CCA.IMP_CONCEPTO) IMP_BINTER, '+
            '        CCA.IMP_CONCEPTO IMP_FEGA, '+
            '        (CCA.IMP_BENEF_BCO + CCA.IMP_BENEF_GOB) IMP_BENEFICIO, '+
            '        (CCA.IMP_CAPITAL - CCA.IMP_BENEF_BCO - CCA.IMP_BENEF_GOB  + ' +
            '         CCA.MORATORIOS  - CCA.IMP_PAGADO_HIST ) IMP_TOTAL, CCA.MORATORIOS'+ coCRLF +
            '  FROM  (SELECT CCA.*, CRE.FACT_MORAS, NVL(FEGA.IMP_CONCEPTO,0) IMP_CONCEPTO, '+
            '                NVL( PKGCRPERIODO.FUNOBTMORA( ''CP'',''V'',CCA.ID_CREDITO,CCA.NUM_PERIODO,'  + coCRLF +
            '                NULL,NULL,' +  SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ','+
            '                NULL,''V''), 0 ) AS MORATORIOS, '+ coCRLF +
            '                NVL(  PKGCRCOMUN.STPOBTIMPPAG( ''CP'', ''IMPBRU'',CCA.ID_CREDITO, CCA.NUM_PERIODO,  '   + coCRLF +
            '                NULL,' +  SQLFecha(StrToDate(sF_Calculo )) + ','+ coCRLF +
            '                ''V'',''F'' ), 0 ) AS IMP_PAGADO_HIST '+ coCRLF +
            '         FROM   (SELECT * FROM CR_CAPITAL CCA ' +
            '                 WHERE 1 = 1';

            //<LOLS 30JUN2006 SI SE APLICA FILTRO POR CREDITO O EMPRESA SE AGREGA EN LOS SUBQUERIES>
            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + ' AND   PKGCRACTUALIZA.STPOBTEMPRESA(CCA.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;

            If Trim(sF_Vencimiento)<>'' Then
               sSQL := sSQL + ' AND  CCA.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            If Trim(sF_Programada)<>'' Then
               sSQL := sSQL + ' AND  CCA.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;


            If (Trim(VlSituacion)='IM') Then
            begin
               sSQL := sSQL + ' AND  ((CCA.F_PROG_PAGO < CCA.F_PAGO AND CCA.SIT_CAPITAL <> ''CA'''  + coCRLF +
                              ' AND   CCA.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                              '  OR   (CCA.SIT_CAPITAL = ''IM'' ))' + coCRLF ;
            end;

            sSQL := sSQL + '       ) CCA, '+

{roim 02/02/06 Se agrega filtro para que los reportes sean más rápidos}
//                           ' CR_CREDITO CRE,' +
                           ' (SELECT * FROM CR_CREDITO  WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_HISTO_CRED WHERE F_CIERRE = ' + SQLFecha( StrToDate(VlFFiltroCre) ) + ')   AND ID_CONTRATO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_EMPRESA = ' + VLIDEmpresa + ') ) CRE, ' +
{/roim}

                           {CR_INTERES CI, '} AgregaGarFega('CP',sF_Calculo) + coCRLF + //EASA4011 29072005
                           ' WHERE CRE.ID_CREDITO = CCA.ID_CREDITO ' + {CI.ID_CREDITO    (+)= CCA.ID_CREDITO'  + EASA4011 29072005
                           ' AND   CI.NUM_PERIODO   (+)= CCA.NUM_PERIODO' +EASA4011 29072005
                           ' AND   }
                           ' AND   FEGA.ID_CREDITO  (+)= CCA.ID_CREDITO'  +
                           ' AND   FEGA.ID_PERIODO (+)= CCA.NUM_PERIODO) CCA' + coCRLF ;
            sSQL2 := sSQL;
            sSQL := '';

            //************************INTERES
            sSQL:= sSQL + '  UNION '+ coCRLF +
            '  SELECT ''C'' ORD_ACC ,CCI.ID_CREDITO,''INTERES'' ACCESORIO,CCI.NUM_PERIODO,'+ coCRLF +
            '         CCI.PLAZO,(CCI.F_VENCIMIENTO - CCI.PLAZO) F_INICIO, '+ coCRLF +
            '         CCI.F_VENCIMIENTO,CCI.F_PROG_PAGO,CCI.F_PAGO, CCI.TASA_APLICADA,'+ coCRLF +
            '         (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST) IMPORTE, '+ coCRLF +
            '         CCI.IMP_IVA - CCI.IMP_IVA_PAG_HIST,CCI.SIT_INTERES, '+ coCRLF +
            '         (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST - NVL(CCI.IMP_CONCEPTO,0)) IMP_BINTER, '+ coCRLF +
            '         NVL(CCI.IMP_CONCEPTO,0) IMP_FEGA, '+ coCRLF +
            '         (CCI.IMP_BENEF_BCO + CCI.IMP_BENEF_GOB) IMP_BENEFICIO, '+ coCRLF +
            '         (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST + CCI.IMP_IVA - CCI.IMP_IVA_PAG_HIST - CCI.IMP_BENEF_BCO - CCI.IMP_BENEF_GOB) IMP_TOTAL,  '+  coCRLF +
{roim 02/02/06 Se Agrega moratorios de Interés}
//            '         0 MORATORIOS '+ coCRLF +
            '         CCI.MORATORIOS AS MORATORIOS '+ coCRLF +
{/roim}
            '  FROM  (SELECT CCI.*, FEGA.IMP_CONCEPTO, NVL( PKGCRCOMUN.STPOBTIMPPAG( ''IN'', ''IMPBRU'', '  + coCRLF +
            '                CCI.ID_CREDITO,  CCI.NUM_PERIODO, NULL, ' +  SQLFecha( StrToDate( sF_Calculo ) ) + ','         + coCRLF +
            '                ''V'',''F'' ), 0) AS IMP_PAGADO_HIST,'                      + coCRLF +

{roim 02/02/06 Se Agrega moratorios de Interés}
            '                NVL( PKGCRPERIODO.FUNOBTMORA( ''IN'',''V'',CCI.ID_CREDITO,CCI.NUM_PERIODO,'  + coCRLF +
            '                NULL,NULL,' +  SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ','+
            '                NULL,''V''), 0 ) AS MORATORIOS, '+ coCRLF +
{/roim}
            '                NVL( PKGCRCOMUN.STPOBTIMPPAG( ''IN'', ''IMPIVA'', '  + coCRLF +
            '                CCI.ID_CREDITO,  CCI.NUM_PERIODO, NULL,  ' +  SQLFecha( StrToDate( sF_Calculo ) ) + ','         + coCRLF +
            '                ''V'', ''F'' ), 0) AS IMP_IVA_PAG_HIST '                     + coCRLF +
            '         FROM   (SELECT * FROM CR_INTERES CCI '+
            '                 WHERE 1 = 1';

            //<LOLS 30JUN2006 SI SE APLICA FILTRO POR CREDITO O EMPRESA SE AGREGA EN LOS SUBQUERIES>
            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + ' AND   PKGCRACTUALIZA.STPOBTEMPRESA(CCI.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;

            If Trim(sF_Vencimiento)<>'' Then
               sSQL := sSQL + ' AND CCI.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            If Trim(sF_Programada)<>'' Then
               sSQL := sSQL + ' AND CCI.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;

            If (Trim(VlSituacion)='IM') Then
            begin
               sSQL := sSQL + ' AND ((CCI.F_PROG_PAGO < CCI.F_PAGO AND  CCI.SIT_INTERES <> ''CA''' +  coCRLF +
                              ' AND  CCI.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                              '  OR  (CCI.SIT_INTERES = ''IM'' ))'+  coCRLF ;
            end;
            sSQL := sSQL + '            ) CCI , ' + AgregaGarFega('IN',sF_Calculo) + coCRLF +
                           ' WHERE FEGA.ID_CREDITO  (+)= CCI.ID_CREDITO '  + coCRLF +
                           ' AND   FEGA.ID_PERIODO  (+)= CCI.NUM_PERIODO) CCI' + coCRLF;
            sSQL3 := sSQL;
            sSQL := '';

            //************************REFINANCIAMIENTO
            sSQL:= sSQL + '  UNION '+ coCRLF +
            '  SELECT ''B'' ORD_ACC ,CFA.ID_CREDITO,''REFINANCIAMIENTO'' ACCESORIO,'+ coCRLF +
            '         CFA.NUM_PERIODO,CFA.PLAZO,(CFA.F_VENCIMIENTO - CFA.PLAZO) F_INICIO, '+  coCRLF +
            '         CFA.F_VENCIMIENTO,CFA.F_PROG_PAGO,CFA.F_PAGO, '+
            '         (PKGCRCOMUN.FUNOBTENTASA(''FN'',CFA.ID_CREDITO,CFA.NUM_PERIODO,CFA.F_VENCIMIENTO-1) * CFA.FACT_MORAS) AS TASA_APLICADA,'+ coCRLF +
            '         (CFA.IMP_FINAN_ADIC - CFA.IMP_PAGADO_HIST) IMPORTE,   0 IMP_IVA,CFA.SIT_FINAN_ADIC, '+ coCRLF +
            '         (CFA.IMP_FINAN_ADIC - CFA.IMP_PAGADO_HIST - NVL(CFA.IMP_CONCEPTO,0)) IMP_BINTER, '+ coCRLF +
            '         NVL(CFA.IMP_CONCEPTO,0) IMP_FEGA, '+ coCRLF +
            '         0 IMP_BENEFICIO, '+ coCRLF +
            '         (CFA.IMP_FINAN_ADIC + CFA.MORATORIOS - CFA.IMP_PAGADO_HIST ) IMP_TOTAL,  '+ coCRLF +
            '         CFA.MORATORIOS'+  coCRLF +
            '  FROM ( SELECT CFA.*, CRE.FACT_MORAS, FEGA.IMP_CONCEPTO, NVL( PKGCRPERIODO.FUNOBTMORA(''FN'',''V'' ,CFA.ID_CREDITO ,'  + coCRLF +
            '                CFA.NUM_PERIODO , NULL, NULL,' +  SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ','+ coCRLF +
            '                NULL,''V''), 0 ) AS MORATORIOS,'                               + coCRLF +
            '                NVL( PKGCRCOMUN.STPOBTIMPPAG( ''FN'', ''IMPBRU'', '  + coCRLF +
            '                CFA.ID_CREDITO,  CFA.NUM_PERIODO,   NULL,  ' +  SQLFecha(StrToDate(sF_Calculo )) + ','       + coCRLF +
            '                ''V'',''F'' ), 0 ) AS IMP_PAGADO_HIST '                 + coCRLF +
            '         FROM (SELECT * FROM CR_FINAN_ADIC  CFA ' +
            '                 WHERE 1 = 1';

            //<LOLS 30JUN2006 SI SE APLICA FILTRO POR CREDITO O EMPRESA SE AGREGA EN LOS SUBQUERIES>
            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + ' AND   PKGCRACTUALIZA.STPOBTEMPRESA(CFA.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;

            If Trim(sF_Vencimiento)<>'' Then
               sSQL := sSQL + ' AND CFA.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            If Trim(sF_Programada)<>'' Then
               sSQL := sSQL + ' AND CFA.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;

            If (Trim(VlSituacion)='IM')Then
            begin
               sSQL := sSQL + ' AND ((CFA.F_PROG_PAGO < CFA.F_PAGO AND ' + coCRLF +  '  CFA.SIT_FINAN_ADIC <> ''CA''' + coCRLF +
                              ' AND  CFA.F_PAGO > '+ SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                              '  OR  (CFA.SIT_FINAN_ADIC = ''IM'' ))'+  coCRLF ;
            end;

            sSQL := sSQL + '             )  CFA, CR_CREDITO CRE, ' + AgregaGarFega('FN',sF_Calculo) + coCRLF +
                           ' WHERE  CRE.ID_CREDITO = CFA.ID_CREDITO'  + coCRLF +
                           ' AND    FEGA.ID_CREDITO  (+)= CFA.ID_CREDITO'  + coCRLF +
                           ' AND    FEGA.ID_PERIODO (+)= CFA.NUM_PERIODO )CFA' + coCRLF ;
            sSQL4 := sSQL;
            sSQL := '';

            //************************COMISIONES
            sSQL:= sSQL + '  UNION '+  coCRLF +
            '  SELECT ''D'' ORD_ACC ,CCC.ID_CREDITO,CCC.DESC_COMISION,CCC.NUM_PERIODO,0 PLAZO,'+ coCRLF +
            '         CCC.F_VENCIMIENTO F_INICIO, '+  coCRLF +
            '         CCC.F_VENCIMIENTO,CCC.F_PROG_PAGO,CCC.F_PAGO,'+  coCRLF +
            '         (PKGCRCOMUN.FUNOBTENTASA(''CN'',CCC.ID_CREDITO,CCC.NUM_PERIODO,CCC.F_VENCIMIENTO-1) * CCC.FACT_MORAS) AS TASA_APLICADA,'+ coCRLF +
            '         (CCC.IMP_COMISION - CCC.IMP_PAGADO_HIST) IMPORTE,'+ coCRLF +
            '         CCC.IMP_IVA-CCC.IMP_IVA_PAG_HIST,CCC.SIT_COMISION, '+ coCRLF +
            '         (CCC.IMP_COMISION - CCC.IMP_PAGADO_HIST - NVL(CCC.IMP_CONCEPTO,0)) IMP_BINTER, '+ coCRLF +
            '         NVL(CCC.IMP_CONCEPTO,0) IMP_FEGA, '+ coCRLF +
            '         0 IMP_BENEFICIO, '+ coCRLF +
            '         (CCC.IMP_COMISION  + CCC.IMP_IVA + CCC.MORATORIOS - CCC.IMP_PAGADO_HIST -CCC.IMP_IVA_PAG_HIST) IMP_TOTAL, '+ coCRLF +
            '         CCC.MORATORIOS'+  coCRLF +
            '  FROM ( SELECT CCC.*, CRE.FACT_MORAS, FEGA.IMP_CONCEPTO, CCCO.DESC_COMISION,'+ coCRLF +
            '                NVL( PKGCRPERIODO.FUNOBTMORA( ''CN'' ,''V'' ,CCC.ID_CREDITO ,CCC.NUM_PERIODO , CCC.CVE_COMISION ,'+ coCRLF +
            '                NULL,TO_DATE('#39+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Calculo))+#39',''DD/MM/YYYY'')' + VLTipoRep + ','+ coCRLF +
            '                NULL,''V''), 0 ) AS MORATORIOS, '+ coCRLF +
            '                NVL( PKGCRCOMUN.STPOBTIMPPAG( ''CN'', ''IMPBRU'', '      +
            '                CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,' +  SQLFecha(StrToDate(sF_Calculo )) + ','   + coCRLF +
            '                ''V'', ''F'' ), 0 ) AS IMP_PAGADO_HIST, '                   + coCRLF +
            '                NVL( PKGCRCOMUN.STPOBTIMPPAG( ''CN'', ''IMPIVA'', '      + coCRLF +
            '                CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,' +  SQLFecha(StrToDate(sF_Calculo )) + ','   + coCRLF +
            '                ''V'',''F'' ), 0 ) AS IMP_IVA_PAG_HIST '                   + coCRLF +
            '         FROM   (SELECT * FROM CR_COMISION CCC ' +
            '                 WHERE 1 = 1';

            //<LOLS 30JUN2006 SI SE APLICA FILTRO POR CREDITO O EMPRESA SE AGREGA EN LOS SUBQUERIES>
            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + ' AND   PKGCRACTUALIZA.STPOBTEMPRESA(CCC.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;


            If Trim(sF_Vencimiento)<>'' Then
               sSQL := sSQL + ' AND CCC.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            If Trim(sF_Programada)<>'' Then
               sSQL := sSQL + ' AND CCC.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;

            If (Trim(VlSituacion)='IM')Then
            begin
               sSQL := sSQL + ' AND  ((CCC.F_PROG_PAGO < CCC.F_PAGO AND ' +  coCRLF + '  CCC.SIT_COMISION <> ''CA''' +  coCRLF +
                              ' AND   CCC.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                              '  OR   (CCC.SIT_COMISION = ''IM'' ))'+  coCRLF ;
            end;

            sSQL := sSQL + '             ) CCC, CR_CAT_COMISION CCCO , CR_CREDITO CRE, ' + AgregaGarFega('CN',sF_Calculo) + coCRLF +
                           ' WHERE  CCCO.CVE_COMISION = CCC.CVE_COMISION '+  coCRLF +
                           ' AND    CRE.ID_CREDITO = CCC.ID_CREDITO'  + coCRLF +
                           ' AND    FEGA.ID_CREDITO  (+)= CCC.ID_CREDITO'  + coCRLF +
                           ' AND    FEGA.ID_PERIODO (+)= CCC.NUM_PERIODO ' + coCRLF;

            If (iReporte =0)Or(iReporte =1) Then Begin
               If (iReporte =0) Then
                  sSQL:= sSQL + ' AND CCC.CVE_COMISION IN (SELECT CVE_COMISION  FROM CR_CAT_COMISION WHERE NVL(CVE_GRUPO_COMIS,0) <> '''+
                                  sCveGpoComis +''')'+ coCRLF;
               If(iReporte =1) Then
                  sSQL:= sSQL + ' AND CCC.CVE_COMISION IN (SELECT CVE_COMISION  FROM CR_CAT_COMISION WHERE NVL(CVE_GRUPO_COMIS,0) = '''+
                                  sCveGpoComis +''')'+ coCRLF;
            End;
            sSQL := sSQL + '  ) CCC' + coCRLF;
            sSQL5 := sSQL;
            sSQL := '';

            //************************ FIN DE UNION
            sSQL:= sSQL + ') ACCE, '+  coCRLF ;
/AGF 2011.11.14 OPTIMIZACIÓN DEL REPORTE*)

            sSQL:= sSQL +
            ' (' + coCRLF +
            '    Select DAT.ORD_ACC,' + coCRLF +
            '           DAT.ID_CREDITO,' + coCRLF +
            '           DAT.ACCESORIO,' + coCRLF +
            '           DAT.NUM_PERIODO,' + coCRLF +
            '           DAT.PLAZO,' + coCRLF +
            '           DAT.F_INICIO,' + coCRLF +
            '           DAT.F_VENCIMIENTO,' + coCRLF +
            '           DAT.F_PROG_PAGO,' + coCRLF +
            '           DAT.F_PAGO,' + coCRLF +
            '           DAT.TASA_APLICADA,' + coCRLF +
            '           DAT.IMP_ACCESORIO - DAT.IMP_PAGADO_HIST                                IMPORTE,' + coCRLF +
            '           DAT.IMP_IVA - DAT.IMP_IVA_PAG_HIST                                     IMP_IVA,' + coCRLF +
            '           DAT.SITUACION                                                          SIT_CAPITAL,' + coCRLF +
            '           DAT.IMP_ACCESORIO - DAT.IMP_PAGADO_HIST - Nvl (DAT.IMP_FEGA, 0)        IMP_BINTER,' + coCRLF +
            '           DAT.IMP_FEGA,' + coCRLF +
            '           DAT.IMP_BENEFICIO,' + coCRLF +
            '           Case DAT.CVE_ACCESORIO' + coCRLF +
            '              When ''CP'' Then DAT.IMP_ACCESORIO   -' + coCRLF +
            '                             DAT.IMP_BENEF_BCO   -' + coCRLF +
            '                             DAT.IMP_BENEF_GOB   +' + coCRLF +
            '                             DAT.MORATORIOS      -' + coCRLF +
            '                             DAT.IMP_PAGADO_HIST' + coCRLF +
            '              When ''IN'' Then DAT.IMP_ACCESORIO    -' + coCRLF +
            '                             DAT.IMP_PAGADO_HIST  +' + coCRLF +
            '                             DAT.IMP_IVA          -' + coCRLF +
            '                             DAT.IMP_IVA_PAG_HIST -' + coCRLF +
            '                             DAT.IMP_BENEF_BCO    -' + coCRLF +
            '                             DAT.IMP_BENEF_GOB' + coCRLF +
            '              When ''FN'' Then DAT.IMP_ACCESORIO   +' + coCRLF +
            '                             DAT.MORATORIOS      -' + coCRLF +
            '                             DAT.IMP_PAGADO_HIST' + coCRLF +
            '              When ''CN'' Then DAT.IMP_ACCESORIO    +' + coCRLF +
            '                             DAT.IMP_IVA          +' + coCRLF +
            '                             DAT.MORATORIOS       -' + coCRLF +
            '                             DAT.IMP_PAGADO_HIST  -' + coCRLF +
            '                             DAT.IMP_IVA_PAG_HIST' + coCRLF +
            '           End IMP_TOTAL,' + coCRLF +
            '           DAT.MORATORIOS' + coCRLF +
            '      From (Select   ACC.ORD_ACC,' + coCRLF +
            '                     ACC.ID_CREDITO,' + coCRLF +
            '                     ACC.ACCESORIO,' + coCRLF +
            '                     ACC.CVE_ACCESORIO,' + coCRLF +
            '                     ACC.NUM_PERIODO,' + coCRLF +
            '                     ACC.PLAZO,' + coCRLF +
            '                     ACC.F_INICIO,' + coCRLF +
            '                     ACC.F_VENCIMIENTO,' + coCRLF +
            '                     ACC.F_PROG_PAGO,' + coCRLF +
            '                     ACC.F_PAGO,' + coCRLF +
            '                     ACC.SITUACION,' + coCRLF +
            '                     ACC.IMP_IVA                                                                                                                   IMP_IVA,' + coCRLF +
            '                     Case' + coCRLF +
            '                        When ACC.CVE_ACCESORIO In (''CP'', ''FN'', ''CN'') Then' + coCRLF +
            '                           PKGCRCOMUN.FUNOBTENTASA (ACC.CVE_ACCESORIO, ACC.ID_CREDITO, ACC.NUM_PERIODO, ACC.F_VENCIMIENTO - 1) * ACC.FACT_MORAS' + coCRLF +
            '                        When ACC.CVE_ACCESORIO = ''IN'' Then' + coCRLF +
            '                           ACC.TASA_APLICADA' + coCRLF +
            '                     End                                                                                                                           TASA_APLICADA,' + coCRLF +
            '                     Nvl (PKGCRPERIODO.FUNOBTMORA (ACC.CVE_ACCESORIO,' + coCRLF +
            '                                                   ''V'', ' + coCRLF +
            '                                                   ACC.ID_CREDITO,' + coCRLF +
            '                                                   ACC.NUM_PERIODO,' + coCRLF +
            '                                                   ACC.CVE_COMISION,' + coCRLF +
            '                                                   Null,' + coCRLF +
            '                                                   ' + SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ',' + coCRLF +
            '                                                   Null,' + coCRLF +
            '                                                   ''V''' + coCRLF +
            '                                                  ),' + coCRLF +
            '                          0' + coCRLF +
            '                         )                                                                                                                         MORATORIOS,' + coCRLF +
            '                     Nvl (PKGCRCOMUN.STPOBTIMPPAG (ACC.CVE_ACCESORIO,' + coCRLF +
            '                                                   ''IMPBRU'',' + coCRLF +
            '                                                   ACC.ID_CREDITO,' + coCRLF +
            '                                                   ACC.NUM_PERIODO,' + coCRLF +
            '                                                   ACC.CVE_COMISION,' + coCRLF +
            '                                                   ' + SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ',' + coCRLF +
            '                                                   ''V'',' + coCRLF +
            '                                                   ''F''' + coCRLF +
            '                                                  ),' + coCRLF +
            '                          0' + coCRLF +
            '                         )                                                                                                                         IMP_PAGADO_HIST,' + coCRLF +
            '                     ACC.IMP_BENEFICIO,' + coCRLF +
            '                     ACC.FACT_MORAS,' + coCRLF +
            '                     ACC.IMP_ACCESORIO,' + coCRLF +
            '                     ACC.IMP_BENEF_BCO,' + coCRLF +
            '                     ACC.IMP_BENEF_GOB,' + coCRLF +
            '                     Nvl (Case ACC.CVE_ACCESORIO When ''CP'' Then FEGA.IMP_CONCEPTO_CP' + coCRLF +
            '                                                 When ''IN'' Then FEGA.IMP_CONCEPTO_IN' + coCRLF +
            '                                                 When ''FN'' Then FEGA.IMP_CONCEPTO_FN' + coCRLF +
            '                                                 When ''CN'' Then FEGA.IMP_CONCEPTO_CN' + coCRLF +
            '                          End,' + coCRLF +
            '                          0' + coCRLF +
            '                         )                                                                                                                         IMP_FEGA,' + coCRLF +
            '                     Case' + coCRLF +
            '                        When ACC.CVE_ACCESORIO In (''IN'', ''CN'') Then' + coCRLF +
            '                           Nvl (PKGCRCOMUN.STPOBTIMPPAG (ACC.CVE_ACCESORIO,' + coCRLF +
            '                                                         ''IMPIVA'',' + coCRLF +
            '                                                         ACC.ID_CREDITO,' + coCRLF +
            '                                                         ACC.NUM_PERIODO,' + coCRLF +
            '                                                         ACC.CVE_COMISION,' + coCRLF +
            '                                                         ' + SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ',' + coCRLF +
            '                                                         ''V'',' + coCRLF +
            '                                                         ''F''' + coCRLF +
            '                                                        ),' + coCRLF +
            '                                0' + coCRLF +
            '                               )' + coCRLF +
            '                        Else 0' + coCRLF +
            '                     End                                                                                                                           IMP_IVA_PAG_HIST' + coCRLF +
            //************************CAPITAL
            '                From (Select ''A''                                              ORD_ACC,' + coCRLF +
            '                             CCA.ID_CREDITO,' + coCRLF +
            '                             ''CAPITAL''                                        ACCESORIO,' + coCRLF +
            '                             ''CP''                                             CVE_ACCESORIO,' + coCRLF +
            '                             CCA.NUM_PERIODO,' + coCRLF +
            '                             Null                                             CVE_COMISION,' + coCRLF +
            '                             CCA.PLAZO,' + coCRLF +
            '                             CCA.F_VENCIMIENTO - CCA.PLAZO                    F_INICIO,' + coCRLF +
            '                             CCA.F_VENCIMIENTO,' + coCRLF +
            '                             CCA.F_PROG_PAGO,' + coCRLF +
            '                             CCA.F_PAGO,' + coCRLF +
            '                             CCA.FACT_MORAS,' + coCRLF +
            '                             Null                                             TASA_APLICADA,' + coCRLF +
            '                             CCA.IMP_CAPITAL                                  IMP_ACCESORIO,' + coCRLF +
            '                             0                                                IMP_IVA,' + coCRLF +
            '                             CCA.SIT_CAPITAL                                  SITUACION,' + coCRLF +
            '                             CCA.IMP_BENEF_BCO + CCA.IMP_BENEF_GOB            IMP_BENEFICIO,' + coCRLF +
            '                             CCA.IMP_BENEF_BCO,' + coCRLF +
            '                              CCA.IMP_BENEF_GOB' + coCRLF +
            '                        From (Select CCA.*,' + coCRLF +
            '                                     CRE.FACT_MORAS' + coCRLF +
            '                                From (Select *' + coCRLF +
            '                                        From CR_CAPITAL CCA' + coCRLF +
            '                                       Where 1 = 1' + coCRLF;

            //<LOLS 30JUN2006 SI SE APLICA FILTRO POR CREDITO O EMPRESA SE AGREGA EN LOS SUBQUERIES>
            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + '                                         AND PKGCRACTUALIZA.STPOBTEMPRESA(CCA.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;

            If Trim(sF_Vencimiento)<>'' Then
               sSQL := sSQL + '                                          AND CCA.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            If Trim(sF_Programada)<>'' Then
               sSQL := sSQL + '                                          AND  CCA.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;


            If (Trim(VlSituacion)='IM') Then
            begin
               sSQL := sSQL + '                                          AND  ((CCA.F_PROG_PAGO < CCA.F_PAGO AND CCA.SIT_CAPITAL <> ''CA''' + coCRLF +
                              '                                          AND   CCA.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                              '                                           OR   (CCA.SIT_CAPITAL = ''IM'' ))' + coCRLF ;
            end;

            sSQL := sSQL + '                                     ) CCA, ' + coCRLF +
            '                                     (Select *' + coCRLF +
            '                                        From CR_CREDITO' + coCRLF +
            '                                       Where ID_CREDITO In (Select ID_CREDITO' + coCRLF +
            '                                                              From CR_HISTO_CRED' + coCRLF +
            '                                                             Where F_CIERRE = ' + SQLFecha( StrToDate(VlFFiltroCre) ) + coCRLF +
            '                                                           )' + coCRLF +
            '                                         And ID_CONTRATO In (Select ID_CONTRATO' + coCRLF +
            '                                                               From CONTRATO' + coCRLF +
            '                                                              Where ID_EMPRESA = ' + VLIDEmpresa + coCRLF +
            '                                                            )' + coCRLF +
            '                                     ) CRE' + coCRLF +
            '                               Where CRE.ID_CREDITO = CCA.ID_CREDITO' + coCRLF +
            '                             ) CCA' + coCRLF +
            '                      Union' + coCRLF +
            //************************INTERES
            '                      Select ''C''                                              ORD_ACC,' + coCRLF +
            '                             CCI.ID_CREDITO,' + coCRLF +
            '                             ''INTERES''                                        ACCESORIO,' + coCRLF +
            '                             ''IN''                                             CVE_ACCESORIO,' + coCRLF +
            '                             CCI.NUM_PERIODO,' + coCRLF +
            '                             Null                                             CVE_COMISION,' + coCRLF +
            '                             CCI.PLAZO,' + coCRLF +
            '                             CCI.F_VENCIMIENTO - CCI.PLAZO                    F_INICIO,' + coCRLF +
            '                             CCI.F_VENCIMIENTO,' + coCRLF +
            '                             CCI.F_PROG_PAGO,' + coCRLF +
            '                             CCI.F_PAGO,' + coCRLF +
            '                             0                                                FACT_MORAS,' + coCRLF +
            '                             CCI.TASA_APLICADA,' + coCRLF +
            '                             CCI.IMP_INTERES_PROY                             IMP_ACCESORIO,' + coCRLF +
            '                             CCI.IMP_IVA IMP_IVA,' + coCRLF +
            '                             CCI.SIT_INTERES                                  SITUACION,' + coCRLF +
            '                             CCI.IMP_BENEF_BCO + CCI.IMP_BENEF_GOB            IMP_BENEFICIO,' + coCRLF +
            '                             CCI.IMP_BENEF_BCO,' + coCRLF +
            '                             CCI.IMP_BENEF_GOB' + coCRLF +
            '                        From CR_INTERES CCI' + coCRLF +
            '                       Where 1 = 1' + coCRLF;

            //<LOLS 30JUN2006 SI SE APLICA FILTRO POR CREDITO O EMPRESA SE AGREGA EN LOS SUBQUERIES>
            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + '                                          AND   PKGCRACTUALIZA.STPOBTEMPRESA(CCI.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;

            If Trim(sF_Vencimiento)<>'' Then
               sSQL := sSQL + '                                          AND CCI.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            If Trim(sF_Programada)<>'' Then
               sSQL := sSQL + '                                          AND CCI.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;

            If (Trim(VlSituacion)='IM') Then
            begin
               sSQL := sSQL + '                                          AND ((CCI.F_PROG_PAGO < CCI.F_PAGO AND  CCI.SIT_INTERES <> ''CA''' +  coCRLF +
                              '                                          AND  CCI.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                              '                                           OR  (CCI.SIT_INTERES = ''IM'' ))'+  coCRLF ;
            end;
            sSQL := sSQL +
            '                      Union' + coCRLF +
            //************************FINANCIAMIENTO ADICIONAL
            '                      Select ''B''                                              ORD_ACC,' + coCRLF +
            '                             CFA.ID_CREDITO,' + coCRLF +
            '                             ''REFINANCIAMIENTO''                               ACCESORIO,' + coCRLF +
            '                             ''FN''                                             CVE_ACCESORIO,' + coCRLF +
            '                             CFA.NUM_PERIODO,' + coCRLF +
            '                             Null                                             CVE_COMISION,' + coCRLF +
            '                             CFA.PLAZO,' + coCRLF +
            '                             CFA.F_VENCIMIENTO - CFA.PLAZO                    F_INICIO,' + coCRLF +
            '                             CFA.F_VENCIMIENTO,' + coCRLF +
            '                             CFA.F_PROG_PAGO,' + coCRLF +
            '                             CFA.F_PAGO,' + coCRLF +
            '                             CFA.FACT_MORAS,' + coCRLF +
            '                             Null                                             TASA_APLICADA,' + coCRLF +
            '                             CFA.IMP_FINAN_ADIC                               IMP_ACCESORIO,' + coCRLF +
            '                             0                                                IMP_IVA,' + coCRLF +
            '                             CFA.SIT_FINAN_ADIC                               SITUACION,' + coCRLF +
            '                             0                                                IMP_BENEFICIO,' + coCRLF +
            '                             0                                                IMP_BENEF_BCO,' + coCRLF +
            '                             0                                                IMP_BENEF_GOB' + coCRLF +
            '                        From (Select CFA.*,' + coCRLF +
            '                                     CRE.FACT_MORAS' + coCRLF +
            '                                From (Select *' + coCRLF +
            '                                        From CR_FINAN_ADIC CFA' + coCRLF +
            '                                       Where 1 = 1' + coCRLF;

            //<LOLS 30JUN2006 SI SE APLICA FILTRO POR CREDITO O EMPRESA SE AGREGA EN LOS SUBQUERIES>
            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + '                                         AND PKGCRACTUALIZA.STPOBTEMPRESA(CFA.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;

            If Trim(sF_Vencimiento)<>'' Then
               sSQL := sSQL + '                                         AND CFA.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            If Trim(sF_Programada)<>'' Then
               sSQL := sSQL + '                                         AND CFA.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;

            If (Trim(VlSituacion)='IM')Then
            begin
               sSQL := sSQL + '                                         AND ((CFA.F_PROG_PAGO < CFA.F_PAGO AND CFA.SIT_FINAN_ADIC <> ''CA''' + coCRLF +
                              '                                         AND  CFA.F_PAGO > '+ SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                              '                                          OR  (CFA.SIT_FINAN_ADIC = ''IM'' ))'+  coCRLF ;
            end;

            sSQL := sSQL +
            '                                     ) CFA,' + coCRLF +
            '                                     CR_CREDITO CRE' + coCRLF +
            '                               Where CRE.ID_CREDITO = CFA.ID_CREDITO' + coCRLF +
            '                             ) CFA' + coCRLF +
            '                      Union' + coCRLF +
            //************************COMISION
            '                      Select ''D''                                              ORD_ACC,' + coCRLF +
            '                             CCC.ID_CREDITO,' + coCRLF +
            '                             CCC.DESC_COMISION,' + coCRLF +
            '                             ''CN''                                             CVE_ACCESORIO,' + coCRLF +
            '                             CCC.NUM_PERIODO,' + coCRLF +
            '                             CCC.CVE_COMISION,' + coCRLF +
            '                             0                                                PLAZO,' + coCRLF +
            '                             CCC.F_VENCIMIENTO                                F_INICIO,' + coCRLF +
            '                             CCC.F_VENCIMIENTO,' + coCRLF +
            '                             CCC.F_PROG_PAGO,' + coCRLF +
            '                             CCC.F_PAGO,' + coCRLF +
            '                             CCC.FACT_MORAS,' + coCRLF +
            '                             Null                                             TASA_APLICADA,' + coCRLF +
            '                             CCC.IMP_COMISION                                 IMP_ACCESORIO,' + coCRLF +
            '                             CCC.IMP_IVA IMP_IVA,' + coCRLF +
            '                             CCC.SIT_COMISION                                 SITUACION,' + coCRLF +
            '                             0                                                IMP_BENEFICIO,' + coCRLF +
            '                             0                                                IMP_BENEF_BCO,' + coCRLF +
            '                             0                                                IMP_BENEF_GOB' + coCRLF +
            '                        From (Select CCC.*,' + coCRLF +
            '                                     CRE.FACT_MORAS,' + coCRLF +
            '                                     CCCO.DESC_COMISION' + coCRLF +
            '                                From (Select *' + coCRLF +
            '                                        From CR_COMISION CCC' + coCRLF +
            '                                       Where 1 = 1' + coCRLF;


            //<LOLS 30JUN2006 SI SE APLICA FILTRO POR CREDITO O EMPRESA SE AGREGA EN LOS SUBQUERIES>
            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + '                                         AND PKGCRACTUALIZA.STPOBTEMPRESA(CCC.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;


            If Trim(sF_Vencimiento)<>'' Then
               sSQL := sSQL + '                                         AND CCC.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            If Trim(sF_Programada)<>'' Then
               sSQL := sSQL + '                                         AND CCC.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;

            If (Trim(VlSituacion)='IM')Then
            begin
               sSQL := sSQL + '                                         AND  ((CCC.F_PROG_PAGO < CCC.F_PAGO AND CCC.SIT_COMISION <> ''CA''' +  coCRLF +
                              '                                         AND   CCC.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                              '                                          OR   (CCC.SIT_COMISION = ''IM'' ))'+  coCRLF ;
            end;

            sSQL := sSQL +
            '                                     ) CCC,' + coCRLF +
            '                                     CR_CAT_COMISION CCCO,' + coCRLF +
            '                                     CR_CREDITO CRE' + coCRLF +
            '                               Where CCCO.CVE_COMISION = CCC.CVE_COMISION' + coCRLF +
            '                                 And CRE.ID_CREDITO = CCC.ID_CREDITO' + coCRLF;

            If (iReporte =0)Or(iReporte =1) Then Begin
               If (iReporte =0) Then
                  sSQL:= sSQL + '                                 AND CCC.CVE_COMISION IN (SELECT CVE_COMISION  FROM CR_CAT_COMISION WHERE NVL(CVE_GRUPO_COMIS,0) <> '''+
                                  sCveGpoComis +''')'+ coCRLF;
               If(iReporte =1) Then
                  sSQL:= sSQL + '                                 AND CCC.CVE_COMISION IN (SELECT CVE_COMISION  FROM CR_CAT_COMISION WHERE NVL(CVE_GRUPO_COMIS,0) = '''+
                                  sCveGpoComis +''')'+ coCRLF;
            End;

            sSQL := sSQL +
            '                                 ) CCC) ACC' + coCRLF;
            //************************INCLUYE GARANTÍAS FEGA
            sSQL := sSQL +
            '                    Left Outer Join ' + AgregaGarFega (sF_Calculo) + coCRLF +
                                                 ' On ACC.ID_CREDITO = FEGA.ID_CREDITO AND' + coCRLF +
            '                                              ACC.NUM_PERIODO = FEGA.ID_PERIODO' + coCRLF +
            '         ) DAT'+  coCRLF +
            ') ACCE, '+  coCRLF ;

            if Trim(sF_Vencimiento)<>'' then
               sSQL:= sSQL + ' (SELECT ' + ' TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Vencimiento))+''',''DD/MM/YYYY'')' + ' AS F_REFERENCIA FROM DUAL) F_REF, '+  coCRLF
            else
               sSQL:= sSQL + ' (SELECT ' + ' TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Programada))+''',''DD/MM/YYYY'')' + ' AS F_REFERENCIA FROM DUAL) F_REF, '+  coCRLF ;

            sSQL:= sSQL +
{roim 02/02/06 Se agrega filtro para que los reportes sean más rápidos}
//            ' CR_CREDITO        CC, '+  coCRLF +
            ' (SELECT * FROM CR_CREDITO  WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_HISTO_CRED WHERE F_CIERRE = ' + SQLFecha( StrToDate(VlFFiltroCre) ) + ')   AND ID_CONTRATO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_EMPRESA = ' + VLIDEmpresa + ') ) CC, '+  coCRLF +
{/roim}
            ' (SELECT SUB.CVE_SUB_DIVISION CVE_EMISOR_NAFIN, SUB.NOMBRE_SUB_DIV NOMBRE_EMISOR,' + coCRLF +
            '         ID_ACREDITADO ID_EMISOR, PROCAM.ID_CREDITO  ID_CESION,' + coCRLF +
            '         0 ID_PROVEEDOR, ''F'' B_OPERADO_NAFIN, ''AP'' TIPO_ACRED' + coCRLF +
            '  FROM CR_SUBDIV_PROCAM SUB, CR_PROCAMPO PROCAM'+  coCRLF +
            '  WHERE PROCAM.CVE_SUB_DIVISION = SUB.CVE_SUB_DIVISION'+  coCRLF +
            '  UNION'+  coCRLF +
            '  SELECT CS.CVE_EMISOR_NAFIN, CE.NOMBRE_EMISOR ID_EMISOR,' + coCRLF +
            '         CE.ID_ACREDITADO , CS.ID_CESION,' + coCRLF +
            '         CS.ID_PROVEEDOR, CS.B_OPERADO_NAFIN, ''AC'' TIPO_ACRED'+  coCRLF +
            '  FROM CR_EMISOR CE, CR_CESION CS'+  coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//            '  WHERE CS.ID_EMISOR = CE.ID_ACREDITADO'+  coCRLF +
//            '  AND   CS.CVE_EMISOR_NAFIN = CE.CVE_EMISOR_NAFIN'+  coCRLF +
            '  WHERE CS.ID_EMISOR = CE.CVE_FND_ENT_DES'+  coCRLF +
            '  AND   CS.ID_EMISOR = CE.ID_ACREDITADO'+  coCRLF +
            '  AND   CS.CVE_EMISOR_NAFIN = CE.CVE_EMISOR_EXT'+  coCRLF +
{/ROIM}
            ' )SUBDIV, '+  coCRLF +

            ' (SELECT * FROM CONTRATO WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CREDITO))         CTO, '+  coCRLF +
            ' MONEDA            M, ' + coCRLF +
            ' PERSONA           PPR, ' + coCRLF +
            ' PERSONA           PPRC, ' + coCRLF +
//            ' CR_CONTRATO       CCTO, '+
            ' (SELECT CCTO.*, CPRO.ID_EMPRESA FROM   CR_PRODUCTO CPRO, CR_CONTRATO CCTO WHERE  CPRO.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE) CCTO,';


{roim 02/02/06 Se agrega filtro para que los reportes sean más rápidos}
            If (Trim(sEmpresa)<>'') Then
                  //sSQL:= sSQL + ' AND CPR.ID_EMPRESA ='+ Trim(sEmpresa) +coCRLF
                  sSQL:= sSQL + ' (SELECT * FROM CR_PRODUCTO WHERE ID_EMPRESA = '+ Trim(sEmpresa) +') CPR, '
            ELSE
                 sSQL:= sSQL +  ' CR_PRODUCTO       CPR, ';
            //end if
{/roim}
            sSQL:= sSQL +
            ' CR_TIP_CRED_BC    CTC, ' + coCRLF +
            ' PERSONA_FISICA    PTIT, ' + coCRLF +
            ' PERSONA           PCE, ' + coCRLF +
            ' PERSONA           PP, ' + coCRLF +
            ' CR_PROVEEDOR      CP, ' + coCRLF +
{roim 02/02/06 Se agrega filtro para que los reportes sean más rápidos}
//            ' CR_CESION, '+
              ' (SELECT * FROM CR_CESION  WHERE ID_CESION IN (SELECT ID_CREDITO FROM CR_HISTO_CRED WHERE F_CIERRE = ' + SQLFecha( StrToDate(VlFFiltroCre) ) + ')) CR_CESION, ' + coCRLF +
{/roim}

{ROIM 08122005 SE CAMBIA EL CAMPO FECHA DE TRASPASO DE CR_CREDITO A CR_HISTO_CRED}
            ' (SELECT * FROM CR_HISTO_CRED '+  coCRLF +
            '  WHERE  F_CIERRE = ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ') CHCR, ' + coCRLF +
{/ROIM}

            C_QUERY_CTAS_IMP_ICRE +
            C_QUERY_CTAS_VEN_ICRE+
            C_QUERY_CTAS_IMP +
            C_QUERY_CTAS_VEN+ //easa4011        17072005


{roim 02/02/06 Se agrega filtro para que los reportes sean más rápidos}
//            ' CR_DOCUMENTO      CD, '+  coCRLF +
              ' (SELECT * FROM CR_DOCUMENTO  WHERE ID_CESION IN (SELECT ID_CREDITO FROM CR_HISTO_CRED WHERE F_CIERRE = ' + SQLFecha( StrToDate(VlFFiltroCre) ) + ')) CD, '+  coCRLF +
{/roim}

            ' CR_CAT_MINIMO	CM , '+  coCRLF;

            If bOperaBanco Or (Trim(sOperDD)<>'')Then
               sSQL:= sSQL + ' CR_FND_CREDITO CFC, '+ coCRLF;

            sSQL:= sSQL +
            //Esta tabla es para saber si son intereses registrados o intereses pendientes de registrar
            '('+  coCRLF +
            '        SELECT ''C'' ORD_ACC, 0 AS GRUPO, CI.ID_CREDITO, CI.NUM_PERIODO,'+  coCRLF +
            '               (CI.F_VENCIMIENTO-CI.PLAZO) F_INICIO ,'+  coCRLF +
            '               CI.F_VENCIMIENTO , CC.F_TRASPASO_VENC'+  coCRLF +
{ROIM 08122005 SE CAMBIA EL CAMPO FECHA DE TRASPASO DE CR_CREDITO A CR_HISTO_CRED}
            //'          FROM CR_CREDITO CC,  CR_INTERES CI'+  coCRLF +
            '           FROM  CR_INTERES CI,  (SELECT CC.ID_CREDITO, DECODE(CHC.ID_CREDITO,NULL,CC.F_TRASPASO_VENC,CHC.F_TRASPASO_VENC) AS F_TRASPASO_VENC '+  coCRLF +
                                             ' FROM (SELECT * FROM CR_HISTO_CRED '+  coCRLF +
                                                   ' WHERE  F_CIERRE = ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ') CHC, CR_CREDITO CC '+  coCRLF +
                                             ' WHERE CHC.ID_CREDITO (+)= CC.ID_CREDITO) CC'+  coCRLF +
{/ROIM}
            '         WHERE CI.ID_CREDITO = CC.ID_CREDITO'+  coCRLF +
            '           AND CC.F_TRASPASO_VENC IS NOT NULL'+  coCRLF +
            '           AND ((CC.F_TRASPASO_VENC BETWEEN (CI.F_VENCIMIENTO-CI.PLAZO) AND CI.F_VENCIMIENTO'+  coCRLF +
            '                 AND CC.F_TRASPASO_VENC - (CI.F_VENCIMIENTO-CI.PLAZO) >= CI.F_VENCIMIENTO - CC.F_TRASPASO_VENC)'+  coCRLF +
            '            OR CI.F_VENCIMIENTO <= CC.F_TRASPASO_VENC)'+  coCRLF +
            '        UNION ALL'+  coCRLF +
            '        SELECT ''C'' ORD_ACC, 1 AS GRUPO, CI.ID_CREDITO, CI.NUM_PERIODO,'+  coCRLF +
            '               (CI.F_VENCIMIENTO-CI.PLAZO) F_INICIO,'+  coCRLF +
            '               CI.F_VENCIMIENTO , CC.F_TRASPASO_VENC'+  coCRLF +
{ROIM 08122005 SE CAMBIA EL CAMPO FECHA DE TRASPASO DE CR_CREDITO A CR_HISTO_CRED}
            //'          FROM CR_CREDITO CC,  CR_INTERES CI'+  coCRLF +
            '           FROM  CR_INTERES CI,  (SELECT CC.ID_CREDITO, DECODE(CHC.ID_CREDITO,NULL,CC.F_TRASPASO_VENC,CHC.F_TRASPASO_VENC) AS F_TRASPASO_VENC '+  coCRLF +
                                             ' FROM (SELECT * FROM CR_HISTO_CRED '+  coCRLF +
                                                   ' WHERE  F_CIERRE = ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ') CHC, CR_CREDITO CC '+  coCRLF +
                                             ' WHERE CHC.ID_CREDITO (+)= CC.ID_CREDITO) CC'+  coCRLF +
{/ROIM}
            '         WHERE CI.ID_CREDITO = CC.ID_CREDITO'+  coCRLF +
            '           AND CC.F_TRASPASO_VENC IS NOT NULL'+  coCRLF +
            '           AND ((CC.F_TRASPASO_VENC BETWEEN (CI.F_VENCIMIENTO-CI.PLAZO) AND CI.F_VENCIMIENTO'+  coCRLF +
            '                 AND (CC.F_TRASPASO_VENC - (CI.F_VENCIMIENTO-CI.PLAZO)) < (CI.F_VENCIMIENTO - CC.F_TRASPASO_VENC))'+  coCRLF +
            '            OR  ((CI.F_VENCIMIENTO > CC.F_TRASPASO_VENC)AND (CI.F_VENCIMIENTO-CI.PLAZO) >CC.F_TRASPASO_VENC))'+  coCRLF +
            ' ) INTREG '+  coCRLF +
            /////////

            ' WHERE CC.ID_CREDITO         = ACCE.ID_CREDITO'+
{ROIM 08122005 SE CAMBIA EL CAMPO FECHA DE TRASPASO DE CR_CREDITO A CR_HISTO_CRED}
            ' AND   CHCR.ID_CREDITO    (+)= CC.ID_CREDITO'+
{/ROIM}
            ' AND   CCTO.ID_CONTRATO      = CC.ID_CONTRATO '+
            ' AND   CCTO.FOL_CONTRATO     = CC.FOL_CONTRATO ' +
            ' AND   CTO.ID_CONTRATO       = CC.ID_CONTRATO '+
            ' AND   M.CVE_MONEDA          = CTO.CVE_MONEDA '+
            ' AND   PPR.ID_PERSONA        = CC.ID_PROM_ADM '+
            ' AND   PPRC.ID_PERSONA       = CTO.ID_PERS_ASOCIAD '+
            ' AND   CPR.CVE_PRODUCTO_CRE  = CCTO.CVE_PRODUCTO_CRE '+
            ' AND   CTC.CVE_TIPO_CRED_BC(+)= CPR.CVE_TIPO_CRED_BC '+   //EASA4011      28022005
            ' AND   PTIT.ID_PERSONA    (+)= CTO.ID_TITULAR '+
            ' AND   PCE.ID_PERSONA     (+)= CTO.ID_TITULAR '+
            ' AND   SUBDIV.ID_CESION   (+)= CC.ID_CREDITO '+
            ' AND   PP.ID_PERSONA      (+)= SUBDIV.ID_PROVEEDOR '+
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
            ' AND   CP.CVE_FND_ENT_DES   (+)= CR_CESION.CVE_FND_ENT_DES '+
//            ' AND   CP.ID_ACREDITADO   (+)= SUBDIV.ID_PROVEEDOR '+
            ' AND   CP.ID_ACREDITADO   (+)= CR_CESION.ID_PROVEEDOR '+
{/ROIM}
            ' AND   CD.ID_CESION       (+)= ACCE.ID_CREDITO '+
            ' AND   CD.NUM_PERIODO_DOC (+)= ACCE.NUM_PERIODO '+
            ' AND   CR_CESION.ID_CESION (+)= CC.ID_CREDITO '+

            ' AND   TABVENCTAICRE.ID_EMPRESA (+)= CCTO.ID_EMPRESA'+ coCRLF +
            ' AND   TABVENCTAICRE.CVE_PRODUCTO_CRE (+)= CCTO.CVE_PRODUCTO_CRE'+ coCRLF +
            ' AND   TABVENCTAICRE.CVE_MONEDA (+)= CCTO.CVE_MONEDA'+ coCRLF +
            ' AND   TABIMPCTAICRE.ID_EMPRESA (+)= CCTO.ID_EMPRESA'+ coCRLF +
            ' AND   TABIMPCTAICRE.CVE_PRODUCTO_CRE (+)= CCTO.CVE_PRODUCTO_CRE'+ coCRLF +
            ' AND   TABIMPCTAICRE.CVE_MONEDA (+)= CCTO.CVE_MONEDA'+ coCRLF +

            ' AND   TABVENCTA.CVE_PRODUCTO_CRE (+)= CPR.CVE_PRODUCTO_CRE ' + coCRLF + //easa 17072005
            ' AND   TABIMPCTA.CVE_PRODUCTO_CRE (+)= CPR.CVE_PRODUCTO_CRE ' + coCRLF + //easa4011      29122004
            ' AND   CM.CVE_CAT_MINIMO   = CPR.CVE_CLAS_CONTAB '+ coCRLF +
            ' AND   INTREG.ID_CREDITO  (+)= ACCE.ID_CREDITO '+ coCRLF +
            ' AND   INTREG.NUM_PERIODO (+)= ACCE.NUM_PERIODO '+ coCRLF +
            ' AND   INTREG.ORD_ACC     (+)= ACCE.ORD_ACC '+ coCRLF;


            If bOperaBanco Or (Trim(sOperDD)<>'')Then
               sSQL:= sSQL + ' AND CC.ID_CREDITO = CFC.ID_CREDITO '+ coCRLF;
   //FILTROS DE QUERY PRINCIPAL
   If ((sSituacion = 'VE') or (sSituacion = 'IM'))  Then Begin
      If VLBFechaTras Then
{ROIM 08122005 SE CAMBIA EL CAMPO FECHA DE TRASPASO DE CR_CREDITO A CR_HISTO_CRED}
//         sSQL:= sSQL + ' AND CC.F_TRASPASO_VENC IS NOT NULL '+  coCRLF
//      Else sSQL:= sSQL + ' AND CC.F_TRASPASO_VENC IS NULL '+  coCRLF;
         sSQL:= sSQL + ' AND DECODE(CHCR.ID_CREDITO,NULL,CC.F_TRASPASO_VENC,CHCR.F_TRASPASO_VENC) IS NOT NULL '+  coCRLF
      Else sSQL:= sSQL + ' AND DECODE(CHCR.ID_CREDITO,NULL,CC.F_TRASPASO_VENC,CHCR.F_TRASPASO_VENC) IS NULL '+  coCRLF;
{/ROIM}
   End;
   If (Trim(sMoneda)<>'') Then
       sSQL:= sSQL + ' AND CTO.CVE_MONEDA ='+sMoneda +  coCRLF ;
   If ((Trim(VlSituacion)<>'') and (Trim(VlSituacion)<>'IM')) Then
       sSQL:= sSQL + ' AND ACCE.SIT_CAPITAL ='''+ VlSituacion+''''+  coCRLF ;
   If (Trim(sGpoProd)<>'') Then
      sSQL:= sSQL + ' AND CPR.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd )+ coCRLF;
   If Trim(sOperDD)<>'' Then
      sSQL:= sSQL + ' AND CFC.CVE_FND_ENT_DES ='+ SQLStr( Trim(sOperDD) )+ coCRLF;
   If bOperaBanco Then
      sSQL:= sSQL + ' AND CC.ID_CREDITO NOT IN (SELECT ID_CREDITO FROM CR_FND_CREDITO)'+ coCRLF;
   If bFinSemana Then
      sSQL:= sSQL + ' AND ACCE.F_VENCIMIENTO < ACCE.F_PROG_PAGO '+ coCRLF;
   If Trim(sCveCatMin)<>'' Then
      sSQL:= sSQL + ' AND   CM.CVE_CAT_MINIMO   ='''+ Trim(sCveCatMin) +''''+  coCRLF ;

   If (iReporte =0)Or(iReporte =1) Then Begin
      If (iReporte =0) Then
         {sSQL:= sSQL + ' AND CC.ID_CREDITO NOT IN (SELECT ID_CREDITO'+
                                                  '  FROM CR_COMISION CO, CR_CAT_COMISION CAT'+
                                                  ' WHERE CAT.CVE_COMISION= CO.CVE_COMISION'+
                                                  '   AND NVL(CAT.CVE_GRUPO_COMIS,0)='''+ sCveGpoComis + ''''+
                                                  ' GROUP BY ID_CREDITO)'+ coCRLF;}

         sSQL:= sSQL + ' AND  CPR.CVE_PRODUCTO_GPO NOT IN ( ''AGRONE'', ''CBINTE'')';

      If(iReporte =1) Then
         {sSQL:= sSQL + ' AND CC.ID_CREDITO IN (SELECT ID_CREDITO'+
                                              '  FROM CR_COMISION CO, CR_CAT_COMISION CAT'+
                                              ' WHERE CAT.CVE_COMISION= CO.CVE_COMISION'+
                                              '   AND NVL(CAT.CVE_GRUPO_COMIS,0)='''+ sCveGpoComis + ''''+
                                              ' GROUP BY ID_CREDITO)'+ coCRLF;}

        sSQL:= sSQL + ' AND  CPR.CVE_PRODUCTO_GPO IN ( ''AGRONE'', ''CBINTE'')';

   End;


   //ORDER DE QUERY PRINCIPAL
   sSQL:= sSQL +' ORDER BY DESC_MONEDA, CPR.CVE_PRODUCTO_GPO, CPR.CVE_PRODUCTO_CRE ,'+  coCRLF; //DESC_L_PRODUCTO
   if bIncTipoSec then
      sSQL:= sSQL + ' PCE.CVE_TIPO_SECTOR,'+  coCRLF ;
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
   if bOrdxProAdmon    then
      sSQL:= sSQL + ' NOM_PROMOTOR_ADM,'+  coCRLF ;
{/roim}
   If Trim(sOrden)='A' Then
      sSQL:= sSQL + ' NOMBRE,CC.ID_CREDITO'+  coCRLF
   Else  sSQL:= sSQL + ' CC.ID_CREDITO,NOMBRE'+  coCRLF ;
   sSQL := sSQL + ',DECODE(ACCE.ORD_ACC,''A'',0,''B'',0,''C'',1,''D'',2,3), NVL(INTREG.GRUPO,0), ACCE.NUM_PERIODO';
   sSQL6 := sSQL;

   slSQL:= TStringList.Create;
   slSQL.Clear;
   slSQL.Add(sSQL1 + sSQL2 + sSQL3 + sSQL4 + sSQL5 + sSQL6);
   slSQL.SaveToFile('c:\SQL.txt');
   slSQL.Free;
   Result:= sSQL1 + sSQL2 + sSQL3 + sSQL4 + sSQL5 + sSQL6;
End;


procedure TQrContVenc.qrDetalleBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
Var
   sFInicio, sFVenc, sFProgPago, sFPago: String;
begin
   If (qyProgVen.FieldByName('ORD_ACC').AsString = 'A')Or (qyProgVen.FieldByName('ORD_ACC').AsString = 'B') Then Begin
      qrlAccesorio.Caption:= 'CAPITAL';
      vlCFIMP_BINTER:= vlCFIMP_BINTER + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
      vlCFIMP_IVA:= vlCFIMP_IVA + qyProgVen.FieldByName('IMP_IVA').AsFloat;
      vlCFIMP_FEGA:= vlCFIMP_FEGA + qyProgVen.FieldByName('IMP_FEGA').AsFloat;
      vlCFIMPORTE:= vlCFIMPORTE + qyProgVen.FieldByName('IMPORTE').AsFloat;
      vlCFMORATORIOS:= vlCFMORATORIOS + qyProgVen.FieldByName('MORATORIOS').AsFloat;
      vlCFIMP_TOTAL:= vlCFIMP_TOTAL + qyProgVen.FieldByName('IMP_TOTAL').AsFloat;

      vlCredCapital:= vlCredCapital + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
      vlAcredCapital:= vlAcredCapital + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
      vlProdCapital:= vlProdCapital + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
      vlMonCapital:= vlMonCapital + qyProgVen.FieldByName('IMP_BINTER').AsFloat;

      vlCredGtia:= vlCredGtia + qyProgVen.FieldByName('IMP_FEGA').AsFloat;
      vlAcredGtia:= vlAcredGtia + qyProgVen.FieldByName('IMP_FEGA').AsFloat;
      vlProdGtia:= vlProdGtia + qyProgVen.FieldByName('IMP_FEGA').AsFloat;
      vlMonGtia:= vlMonGtia + qyProgVen.FieldByName('IMP_FEGA').AsFloat;

      vlCredMora:= vlCredMora + qyProgVen.FieldByName('MORATORIOS').AsFloat;
      vlAcredMora:= vlAcredMora + qyProgVen.FieldByName('MORATORIOS').AsFloat;
      vlProdMora:= vlProdMora + qyProgVen.FieldByName('MORATORIOS').AsFloat;
      vlMonMora:= vlMonMora + qyProgVen.FieldByName('MORATORIOS').AsFloat;

   End Else If (qyProgVen.FieldByName('ORD_ACC').AsString = 'C') Then Begin
      qrlAccesorio.Caption:= 'INTERESES';

      vlCredGtia:= vlCredGtia + qyProgVen.FieldByName('IMP_FEGA').AsFloat;
      vlAcredGtia:= vlAcredGtia + qyProgVen.FieldByName('IMP_FEGA').AsFloat;
      vlProdGtia:= vlProdGtia + qyProgVen.FieldByName('IMP_FEGA').AsFloat;
      vlMonGtia:= vlMonGtia + qyProgVen.FieldByName('IMP_FEGA').AsFloat;

      If qyProgVen.FieldByName('GRUPO').AsInteger = 0  Then Begin
         vlINTIMP_BINTER:= vlINTIMP_BINTER + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
         vlINTIMP_IVA:= vlINTIMP_IVA + qyProgVen.FieldByName('IMP_IVA').AsFloat;
         vlINTIMP_FEGA:= vlINTIMP_FEGA + qyProgVen.FieldByName('IMP_FEGA').AsFloat;
         vlINTIMPORTE:= vlINTIMPORTE + qyProgVen.FieldByName('IMPORTE').AsFloat;
         vlINTMORATORIOS:= vlINTMORATORIOS + qyProgVen.FieldByName('MORATORIOS').AsFloat;
         vlINTIMP_TOTAL:= vlINTIMP_TOTAL + qyProgVen.FieldByName('IMP_TOTAL').AsFloat;

         vlCredIntReg:= vlCredIntReg + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
         vlAcredIntReg:= vlAcredIntReg + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
         vlProdIntReg:= vlProdIntReg + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
         vlMonIntReg:= vlMonIntReg + qyProgVen.FieldByName('IMP_BINTER').AsFloat;

      End Else Begin
         vlINT1IMP_BINTER:= vlINT1IMP_BINTER + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
         vlINT1IMP_IVA:= vlINT1IMP_IVA + qyProgVen.FieldByName('IMP_IVA').AsFloat;
         vlINT1IMP_FEGA:= vlINT1IMP_FEGA + qyProgVen.FieldByName('IMP_FEGA').AsFloat;
         vlINT1IMPORTE:= vlINT1IMPORTE + qyProgVen.FieldByName('IMPORTE').AsFloat;
         vlINT1MORATORIOS:= vlINT1MORATORIOS + qyProgVen.FieldByName('MORATORIOS').AsFloat;
         vlINT1IMP_TOTAL:= vlINT1IMP_TOTAL + qyProgVen.FieldByName('IMP_TOTAL').AsFloat;

         vlCredIntNoReg:= vlCredIntNoReg + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
         vlAcredIntNoReg:= vlAcredIntNoReg + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
         vlProdIntNoReg:= vlProdIntNoReg + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
         vlMonIntNoReg:= vlMonIntNoReg + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
      End;
   End Else If (qyProgVen.FieldByName('ORD_ACC').AsString = 'D') Then Begin
      qrlAccesorio.Caption:= qyProgVen.FieldByName('ACCESORIO').AsString;
      vlSEIMP_BINTER:= vlSEIMP_BINTER + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
      vlSEIMP_IVA:= vlSEIMP_IVA + qyProgVen.FieldByName('IMP_IVA').AsFloat;
      vlSEIMP_FEGA:= vlSEIMP_FEGA + qyProgVen.FieldByName('IMP_FEGA').AsFloat;
      vlSEIMPORTE:= vlSEIMPORTE + qyProgVen.FieldByName('IMPORTE').AsFloat;
      vlSEMORATORIOS:= vlSEMORATORIOS + qyProgVen.FieldByName('MORATORIOS').AsFloat;
      vlSEIMP_TOTAL:= vlSEIMP_TOTAL + qyProgVen.FieldByName('IMP_TOTAL').AsFloat;

      vlCredIVA:= vlCredIVA + qyProgVen.FieldByName('IMP_IVA').AsFloat;
      vlAcredIVA:= vlAcredIVA + qyProgVen.FieldByName('IMP_IVA').AsFloat;
      vlProdIVA:= vlProdIVA + qyProgVen.FieldByName('IMP_IVA').AsFloat;
      vlMonIVA:= vlMonIVA + qyProgVen.FieldByName('IMP_IVA').AsFloat;

      vlCredSeguro:= vlCredSeguro + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
      vlAcredSeguro:= vlAcredSeguro + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
      vlProdSeguro:= vlProdSeguro + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
      vlMonSeguro:= vlMonSeguro + qyProgVen.FieldByName('IMP_BINTER').AsFloat;
   End;

      vlCredTotal:= vlCredTotal + qyProgVen.FieldByName('IMP_TOTAL').AsFloat;
      vlAcredTotal:= vlAcredTotal + qyProgVen.FieldByName('IMP_TOTAL').AsFloat;
      vlProdTotal:= vlProdTotal + qyProgVen.FieldByName('IMP_TOTAL').AsFloat;
      vlMonTotal:= vlMonTotal + qyProgVen.FieldByName('IMP_TOTAL').AsFloat;

   If (sArchivo <>'')and(not vgCompactar)Then Begin
         Writeln(F,
                  qyProgVen.FieldByName('CVE_MONEDA').AsString + #09 +
                  qyProgVen.FieldByName('DESC_MONEDA').AsString+ #09 +
                  FormatFloat('###,##0.0000', dTipoCambio)+ #09 +
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
                  qyProgVen.FieldByName('ID_PROM_ADM').AsString + #09 +
                  qyProgVen.FieldByName('NOM_PROMOTOR_ADM').AsString + #09 +
{/roim}
                  qyProgVen.FieldByName('CVE_TIPO_SECTOR').AsString + #09 +
                  qyProgVen.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
                  qyProgVen.FieldByName('DESC_L_PRODUCTO').AsString + #09 +
                  qyProgVen.FieldByName('CUENTA_IMPAGADO_KAP').AsString + #09 +
                  qyProgVen.FieldByName('CUENTA_IMPAGADO_INT').AsString + #09 +
                  qyProgVen.FieldByName('CUENTA_VEN_KAP_EX').AsString + #09 +
                  qyProgVen.FieldByName('CUENTA_VENCIDA_INT').AsString + #09 +
                  qyProgVen.FieldByName('ID_TITULAR').AsString + #09 +
                  qyProgVen.FieldByName('NOMBRE').AsString + #09 +
                  qyProgVen.FieldByName('CUENTA_BANCO').AsString + #09 +
                  qyProgVen.FieldByName('CVE_CAT_MINIMO').AsString + #09 +
                  qyProgVen.FieldByName('DESC_CAT_MINIMO').AsString + #09 +
                  //Registros
                  Self.qrlAccesorio.Caption + #09 +
                  qyProgVen.FieldByName('ID_CREDITO').AsString + #09 +
                  qyProgVen.FieldByName('F_INICIO').AsString + #09 +
                  qyProgVen.FieldByName('F_VENCIMIENTO').AsString + #09 +
                  qyProgVen.FieldByName('NUM_PERIODO_PER').AsString + #09 +
                  FormatFloat('###,##0',QRExpr5.Value.intResult) + #09+
                  FormatFloat('###,##0.0000',qyProgVen.FieldByName('TASA_APLICADA').AsFloat) + #09+
                  qyProgVen.FieldByName('F_PAGO').AsString + #09 +
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_BINTER').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_IVA').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_FEGA').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMPORTE').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('MORATORIOS').AsFloat) + #09#09+
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_TOTAL').AsFloat));
   End;

   PrintBand:= not vgCompactar;
end;

procedure TQrContVenc.QRFooterMonedaBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
var sRegArch: String;
begin
   sRegArch:='';
   If (iTipReporte =0) Then Begin
      qrlMonComis.Caption:= 'SEGUROS';
      qrlTitGtiaMon.Enabled:= False;
      qrMonGtia.Enabled:= False;
      qrlTitGtiaMonTC.Enabled:= False;
      qrMonGtiaTC.Enabled:= False;
   End;
   If(iTipReporte =1) Then
      qrlMonComis.Caption:= 'CUOTAS';

   qrMonCapital.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlMonCapital);
   qrMonIntReg.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlMonIntReg);
   qrMonIntNoReg.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlMonIntNoReg);
   qrMonMora.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlMonMora);
   qrMonSeguro.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlMonSeguro);
   qrMonTotal.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlMonTotal);
   qrMonGtia.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlMonGtia);
   qrMonIVA.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlMonIVA);

   qrMonCapitalTC.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlMonCapital*dTipoCambio);
   qrMonIntRegTC.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlMonIntReg*dTipoCambio);
   qrMonIntNoRegTC.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlMonIntNoReg*dTipoCambio);
   qrMonMoraTC.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlMonMora*dTipoCambio);
   qrMonSeguroTC.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlMonSeguro*dTipoCambio);
   qrMonTotalTC.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlMonTotal*dTipoCambio);
   qrMonGtiaTC.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlMonGtia*dTipoCambio);
   qrMonIVATC.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlMonIVA*dTipoCambio);

   If (sArchivo <>'')Then Begin
      //Total de Moneda
      sRegArch:=    'Total por Moneda'+ #09 +
                    'CAPITAL'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlMonCapital) + #09 +
                    'INTERESES REGISTRADOS'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlMonIntReg)+ #09 +
                    'INTERESES PENDIENTES'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlMonIntNoReg)+ #09 +
                    'MORATORIOS CAPITAL'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlMonMora)+ #09;
      If(iTipReporte =1) Then
         sRegArch:= sRegArch +
                    'GARANTIA EJERCIDA'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlMonGtia)+ #09;

      sRegArch:= sRegArch +
                    qrlMonComis.Caption+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlMonSeguro)+ #09 +
                    'IVA'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlMonIVA)+ #09 +
                    'TOTAL'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlMonTotal);
      Writeln(F, sRegArch);
      //Total de Moneda Valorizada
      sRegArch:=    'Total por Moneda Valorizada'+ #09 +
                    'CAPITAL'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlMonCapital*dTipoCambio) + #09 +
                    'INTERESES REGISTRADOS'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlMonIntReg*dTipoCambio)+ #09 +
                    'INTERESES PENDIENTES'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlMonIntNoReg*dTipoCambio)+ #09 +
                    'MORATORIOS CAPITAL'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlMonMora*dTipoCambio)+ #09;
      If(iTipReporte =1) Then
         sRegArch:= sRegArch +
                    'GARANTIA EJERCIDA'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlMonGtia*dTipoCambio)+ #09;

      sRegArch:= sRegArch +
                    qrlMonComis.Caption+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlMonSeguro*dTipoCambio)+ #09 +
                    'IVA'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlMonIVA*dTipoCambio)+ #09 +
                    'TOTAL'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlMonTotal*dTipoCambio);
      Writeln(F, sRegArch);

      Writeln(F, ' ');
   End;

end;

procedure TQrContVenc.QRFooterProductoBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
var sRegArch: String;
begin
   If (iTipReporte =0) Then Begin
      qrlProdComis.Caption:= 'SEGUROS';
      qrlTitGtiaProd.Enabled:= False;
      qrProdGtia.Enabled:= False;
   End;
   If(iTipReporte =1) Then
      qrlProdComis.Caption:= 'CUOTAS';

   qrProdCapital.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlProdCapital);
   qrProdIntReg.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlProdIntReg);
   qrProdIntNoReg.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlProdIntNoReg);
   qrProdMora.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlProdMora);
   qrProdSeguro.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlProdSeguro);
   qrProdTotal.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlProdTotal);
   qrProdGtia.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlProdGtia);
   qrProdIVA.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlProdIVA);

   If (sArchivo <>'')Then Begin
      sRegArch:=    'Total por Producto'+ #09 +
                    'CAPITAL'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlProdCapital) + #09 +
                    'INTERESES REGISTRADOS'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlProdIntReg)+ #09 +
                    'INTERESES PENDIENTES'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlProdIntNoReg)+ #09 +
                    'MORATORIOS CAPITAL'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlProdMora)+ #09;
      If (iTipReporte =1) Then
         sRegArch:= sRegArch +
                    'GARANTIA EJERCIDA'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlProdGtia)+ #09;
      sRegArch:= sRegArch +
                    qrlProdComis.Caption+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlProdSeguro)+ #09 +
                    'IVA'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlProdIVA)+ #09 +
                    'TOTAL'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlProdTotal);
      Writeln(F,sRegArch);
   End;

end;

procedure TQrContVenc.QRFooterClienteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var sRegArch: String;
begin
   If (iTipReporte =0) Then Begin
      qrlMoraComis.Caption:= 'SEGUROS';
      qrlTitGtiaTit.Enabled:= False;
      qrAcredGtia.Enabled:= False;
   End;
   If(iTipReporte =1) Then
      qrlMoraComis.Caption:= 'CUOTAS';

   qrAcredCapital.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlAcredCapital);
   qrAcredIntReg.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlAcredIntReg);
   qrAcredIntNoReg.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlAcredIntNoReg);
   qrAcredMora.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlAcredMora);
   qrAcredSeguro.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlAcredSeguro);
   qrAcredTotal.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlAcredTotal);
   qrAcredGtia.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlAcredGtia);
   qrAcredIVA.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlAcredIVA);

   If (sArchivo <>'')Then Begin
      sRegArch:=    'Total por Cliente'+ #09 +
                    'CAPITAL'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlAcredCapital) + #09 +
                    'INTERESES REGISTRADOS'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlAcredIntReg)+ #09 +
                    'INTERESES PENDIENTES'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlAcredIntNoReg)+ #09 +
                    'MORATORIOS CAPITAL'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlAcredMora)+ #09;

      If (iTipReporte =1) Then
         sRegArch:= sRegArch +
                    'GARANTIA EJERCIDA'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlAcredGtia)+ #09;

      sRegArch:= sRegArch +
                    qrlMoraComis.Caption+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlAcredSeguro)+ #09 +
                    'IVA'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlAcredIVA)+ #09 +
                    'TOTAL'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlAcredTotal);
      Writeln(F,sRegArch);
   End;

end;

procedure TQrContVenc.qrGpoGpoInterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   vlINTIMP_BINTER:=0;  vlINTIMP_IVA:=0;   vlINTIMP_FEGA:=0;   vlINTIMPORTE:=0;
   vlINTMORATORIOS:=0;   vlINTIMP_TOTAL:=0;   vlINT1IMP_BINTER:=0;   vlINT1IMP_IVA:=0;
   vlINT1IMP_FEGA:=0;   vlINT1IMPORTE:=0;   vlINT1MORATORIOS:=0;   vlINT1IMP_TOTAL:=0;
   PrintBand := (qyProgVen.FieldByName('ORD_ACC').AsString = 'C');
end;

procedure TQrContVenc.qrFooterTIPO_INTBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If (qyProgVen.FieldByName('ORD_ACC').AsString = 'C')And(qyProgVen.FieldByName('GRUPO').AsInteger = 0) Then Begin
      qreTitulo.Caption:= 'Intereses Registrados';
      qrlINTIMP_BINTER.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINTIMP_BINTER);
      qrlINTIMP_IVA.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINTIMP_IVA);
      qrlINTIMP_FEGA.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINTIMP_FEGA);
      qrlINTIMPORTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINTIMPORTE);
      qrlINTMORATORIOS.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINTMORATORIOS);
      qrlINTIMP_TOTAL.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINTIMP_TOTAL);
   End Else If (qyProgVen.FieldByName('ORD_ACC').AsString = 'C')And(qyProgVen.FieldByName('GRUPO').AsInteger = 1) Then Begin
      qreTitulo.Caption:= 'Intereses Pend. de Reg.';
      qrlINTIMP_BINTER.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINT1IMP_BINTER);
      qrlINTIMP_IVA.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINT1IMP_IVA);
      qrlINTIMP_FEGA.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINT1IMP_FEGA);
      qrlINTIMPORTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINT1IMPORTE);
      qrlINTMORATORIOS.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINT1MORATORIOS);
      qrlINTIMP_TOTAL.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINT1IMP_TOTAL);
   End;

   If (sArchivo <>'')and(qyProgVen.FieldByName('ORD_ACC').AsString = 'C') Then Begin
         Writeln(F,
                  #09#09#09#09#09#09#09#09#09#09#09#09+
                  qreTitulo.Caption + #09#09#09#09#09#09#09#09#09#09#09#09#09+
                  qrlINTIMP_BINTER.Caption + #09+
                  qrlINTIMP_IVA.Caption + #09+
                  qrlINTIMP_FEGA.Caption + #09+
                  qrlINTIMPORTE.Caption + #09+
                  qrlINTMORATORIOS.Caption + #09#09+
                  qrlINTIMP_TOTAL.Caption);
   End;
   PrintBand := (qyProgVen.FieldByName('ORD_ACC').AsString = 'C');
end;

procedure TQrContVenc.qrFooterAccesorioBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If (qyProgVen.FieldByName('ORD_ACC').AsString = 'A')Or(qyProgVen.FieldByName('ORD_ACC').AsString = 'B')Then Begin
      qreTitAccesorio.Caption:= 'Capital';
      qrlCFIMP_BINTER.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCFIMP_BINTER);
      qrlCFIMP_IVA.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCFIMP_IVA);
      qrlCFIMP_FEGA.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCFIMP_FEGA);
      qrlCFIMPORTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCFIMPORTE);
      qrlCFMORATORIOS.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCFMORATORIOS);
      qrlCFIMP_TOTAL.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCFIMP_TOTAL);
   End Else If (qyProgVen.FieldByName('ORD_ACC').AsString = 'D') Then Begin
      If (iTipReporte =0) Then
         qreTitAccesorio.Caption:= 'Seguros';
      If(iTipReporte =1) Then
         qreTitAccesorio.Caption:= 'Cuotas';
      //qreTitAccesorio.Caption:= 'Seguros';
      qrlCFIMP_BINTER.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlSEIMP_BINTER);
      qrlCFIMP_IVA.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlSEIMP_IVA);
      qrlCFIMP_FEGA.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlSEIMP_FEGA);
      qrlCFIMPORTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlSEIMPORTE);
      qrlCFMORATORIOS.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlSEMORATORIOS);
      qrlCFIMP_TOTAL.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlSEIMP_TOTAL);
   End;
   If (sArchivo <>'')and(qyProgVen.FieldByName('ORD_ACC').AsString <> 'C')Then Begin
         Writeln(F,#09#09#09#09#09#09#09#09#09#09#09#09 +
                  qreTitAccesorio.Caption + #09#09#09#09#09#09#09#09#09#09#09#09#09 +
                  qrlCFIMP_BINTER.Caption + #09+
                  qrlCFIMP_IVA.Caption + #09+
                  qrlCFIMP_FEGA.Caption + #09+
                  qrlCFIMPORTE.Caption + #09+
                  qrlCFMORATORIOS.Caption + #09#09+
                  qrlCFIMP_TOTAL.Caption);
   End;
   PrintBand := (qyProgVen.FieldByName('ORD_ACC').AsString <> 'C');
end;

procedure TQrContVenc.QRGpoAccesoriioBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   vlCFIMP_BINTER:= 0;   vlCFIMP_IVA:= 0;   vlCFIMP_FEGA:= 0;   vlCFIMPORTE:= 0;
   vlCFMORATORIOS:= 0;   vlCFIMP_TOTAL:= 0;
   vlSEIMP_BINTER:= 0;   vlSEIMP_IVA:= 0;   vlSEIMP_FEGA:= 0;   vlSEIMPORTE:= 0;
   vlSEMORATORIOS:= 0;   vlSEIMP_TOTAL:= 0;

end;

procedure TQrContVenc.QRGroupCesionBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

   vlCredCapital:= 0;
   vlCredIntReg:= 0;
   vlCredIntNoReg:= 0;
   vlCredMora:= 0;
   vlCredSeguro:= 0;
   vlCredTotal:= 0;
   vlCredGtia:= 0;

   vlCredIVA:=0;

   PrintBand:= not vgCompactar;
end;

procedure TQrContVenc.QRFooterCesionBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var sRegArch: String;
begin
   If (iTipReporte =0) Then Begin
      qrlCredComis.Caption:= 'SEGUROS';
      qrlTitGtiaCr.Enabled:= False;
      qrCredGtia.Enabled:= False;
   End;
   If(iTipReporte =1) Then
      qrlCredComis.Caption:= 'CUOTAS';

   qrCredCapital.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCredCapital);
   qrCredIntReg.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCredIntReg);
   qrCredIntNoReg.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCredIntNoReg);
   qrCredMora.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCredMora);
   qrCredSeguro.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCredSeguro);
   qrCredTotal.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCredTotal);
   qrCredGtia.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCredGtia);
   qrCredIVA.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCredIVA);

   If (sArchivo <>'')Then Begin
      sRegArch:=    'Total por Crédito '+ qyProgVen.FieldByName('ID_CREDITO').AsString + #09 +
                    'CAPITAL'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlCredCapital) + #09 +
                    'INTERESES REGISTRADOS'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlCredIntReg)+ #09 +
                    'INTERESES PENDIENTES'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlCredIntNoReg)+ #09 +
                    'MORATORIOS CAPITAL'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlCredMora)+ #09;
      If (iTipReporte =1) Then
         sRegArch:= sRegArch +
                    'GARANTIA EJERCIDA'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlCredGtia)+ #09;

      sRegArch:= sRegArch +
                    qrlCredComis.Caption+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlCredSeguro)+ #09 +
                    'IVA'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlCredIVA)+ #09 +
                    'TOTAL'+ #09 +
                    FormatFloat('###,###,###,###,###,##0.00',vlCredTotal);
      Writeln(F,sRegArch);
   End;

end;

procedure TQrContVenc.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   vlAcredCapital:= 0; vlAcredIntReg:= 0; vlAcredIntNoReg:= 0;
   vlAcredMora:= 0; vlAcredSeguro:= 0; vlAcredTotal:= 0; vlAcredGtia:=0;
   vlAcredIVA:=0;
end;

procedure TQrContVenc.QRGroupProductoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   vlProdCapital:= 0; vlProdIntReg:= 0; vlProdIntNoReg:= 0;
   vlProdMora:= 0; vlProdSeguro:= 0; vlProdTotal:= 0; vlProdGtia:=0;
   vlProdIVA:= 0;
end;

procedure TQrContVenc.QRGroupMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   vlMonCapital:= 0;vlMonCapital:= 0;vlMonIntReg:= 0; vlMonIntNoReg:= 0;
   vlMonMora:= 0;vlMonSeguro:= 0;vlMonTotal:= 0; vlMonGtia:=0;
   vlMonIVA:=0;

   If qyProgVen.FieldByName('CVE_MONEDA').AsInteger = C_DLLS Then Begin
      dTipoCambio:= vgTCambioMes;
      lbTipoCambio.Caption := FormatFloat('###,##0.0000', vgTCambioMes);
   End Else If qyProgVen.FieldByName('CVE_MONEDA').AsInteger = 800 Then Begin
      dTipoCambio:= vgTCambioUDIS;
      lbTipoCambio.Caption := FormatFloat('###,##0.0000',vgTCambioUDIS)
   End Else Begin
      dTipoCambio:= 1;
      lbTipoCambio.Caption := '1.0000';
   End;
end;

procedure TQrContVenc.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If (sArchivo <>'')Then Begin
         Writeln(F, ' ');
   End;

   If qyProgVen.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

procedure TQrContVenc.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
   if Not(BOrdxProAdmon) then
   begin
      QRPromAdmon.Enabled := FALSE;
      QRPromAdmon.Expression := '';
   end;
{/roim}
end;

End.
