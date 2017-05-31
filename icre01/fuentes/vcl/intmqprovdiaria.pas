unit IntMQProvDiaria;
interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre, UnSQL2, Dialogs, QRExport, U_InterCustomStar,
  U_InterDigDoc, uRedigitalizacion;
Const                                                                                        
   coCRLF      = #13#10;
type                                                
  TQrProvDiaria = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyConsulta: TQuery;
    qrDetalle: TQRBand;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    FootProducto: TQRBand;
    FootDivisa: TQRBand;
    FootTipoCar: TQRBand;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    SummaryBand1: TQRBand;
    QRDBText29: TQRDBText;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRDBText30: TQRDBText;
    qyConsultaPARTE: TStringField;
    qyConsultaCARTERA: TStringField;
    qyConsultaVENCIDA: TStringField;
    qyConsultaCVE_PER_JURIDICA: TStringField;
    qyConsultaNOMBRE: TStringField;
    qyConsultaF_TRASPASO_VEN: TDateTimeField;
    qyConsultaDIAS_PROV: TFloatField;
    qyConsultaCVE_CAT_MIN: TStringField;
    qyConsultaDESC_CAT_MIN: TStringField;
    qyConsultaCVE_MONEDA: TFloatField;
    qyConsultaCVE_SUB_CARTERA: TStringField;
    qyConsultaDIAS_FINAL: TFloatField;
    qyConsultaINT_ACUM_OPC1: TFloatField;
    qyConsultaFEC_VENC_CRED: TDateTimeField;
    qyConsultaFEC_INICIO_INTERES: TDateTimeField;
    qyConsultaDESC_MONEDA: TStringField;
    qyConsultaTC_CONT_USD: TFloatField;
    qyConsultaTC_CONT_UDI: TFloatField;
    qyConsultaCVE_SUB_TIP_BCO: TFloatField;
    qyConsultaDESC_SUB_TIPO: TStringField;
    qyConsultaDESC_SUB_TIPO1: TStringField;
    qyConsultaID_CREDITO: TFloatField;
    qyConsultaID_CESION: TFloatField;
    qyConsultaCVE_CALCULO: TStringField;
    qyConsultaCVE_TASA_REFER: TStringField;
    qyConsultaDIAS_PLAZO: TFloatField;
    qyConsultaF_VALOR_CRED: TDateTimeField;
    qyConsultaIMP_CREDITO: TFloatField;
    qyConsultaSOBRETASA: TFloatField;
    qyConsultaTIPO_DISPOSICION: TStringField;
    qyConsultaB_PROG_FOPYME: TStringField;
    qyConsultaB_OPERADO_NAFIN: TStringField;
    qyConsultaCTA_CONTABLE: TStringField;
    qyConsultaCTA_INTERES: TStringField;
    qyConsultaF_PROVISION: TDateTimeField;
    qyConsultaIMP_INTERES_AYER: TFloatField;
    qyConsultaIMP_INTERES_DIA: TFloatField;
    qyConsultaIMP_INTERES_PER: TFloatField;
    qyConsultaSDO_INSOLUTO: TFloatField;
    qyConsultaTASA_APLICADA: TFloatField;
    qyConsultaTIPO_CUENTA: TFloatField;
    qyConsultaF_VENCIMIENTO: TDateTimeField;
    qyConsultaPLAZO: TFloatField;
    qyConsultaID_PERSONA: TFloatField;
    qyConsultaID_PROM_ADM: TFloatField;
    qyConsultaPROMADM: TStringField;
    qyConsultaID_PERS_ASOCIAD: TFloatField;
    qyConsultaP_ASOC: TStringField;
    qyConsultaCVE_PRODUCTO_CRE: TStringField;
    qyConsultaDESC_C_PRODUCTO: TStringField;
    QRLabel2: TQRLabel;
    lbTipoCambio: TQRLabel;
    QRDBText4: TQRDBText;
    qyConsultaINT_ACUM: TFloatField;
    qyConsultaINT_DIA: TFloatField;
    qyConsultaINT_ACUM_ETQ: TFloatField;
    qyConsultaTOT_IMPCRED_DIV: TFloatField;
    qyConsultaTOT_SDOIN_DIV: TFloatField;
    qyConsultaTOT_INTDIA_DIV: TFloatField;
    qyConsultaTOT_INTACUM_DIV: TFloatField;
    qyConsultaTOT_INTACUMETQ_DIV: TFloatField;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText13: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRDBText18: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText16: TQRDBText;
    lbCtaInt: TQRLabel;
    lbCtaCap: TQRLabel;
    QRLabel18: TQRLabel;
    qyConsultaDESC_TIPO_CRED: TStringField;
    QRLabel26: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText20: TQRDBText;
    GpoPromAdmon: TQRGroup;
    GpoPromAdm: TQRGroup;
    GpoCliente: TQRGroup;
    GpoTipoCar: TQRGroup;
    GpoDivisa: TQRGroup;
    GpoProducto: TQRGroup;
    InterDigDoc1: TInterDigDoc;
    qyConsultaSTATUSRECU: TStringField;
    QRDBText25: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText31: TQRDBText;
    qyConsultaIVA_ACUM: TFloatField;
    qyConsultaID_EMPRESA: TFloatField;
    qyConsultaIVA_ACUMULADO: TFloatField;
    qyConsultaTOT_IVAACUM_DIV: TFloatField;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRLabel29: TQRLabel;
    procedure GpoProductoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FootProductoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FootDivisaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FootTipoCarBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
      sSubTipoRep : String;
  public
     vgFechaMesAnt  : TDate;
     vgTCambioMesAnt: Double;
     vgTCambioUDIS  : Double;
     Apli : TInterApli;
     Function LlenaEncabezado(sFInicio, sFFin, sGpoProducto,
                              sProducto, sPromAdmin, sPromAsoc,
                              sCartera, sTraspaso, sAcreditado,
                              sEmpresa, sSucursal: String;
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
//                              OrdenProm, OrdenCliente, Resumen,
                              OrdenProm, OrdenPromAdm, OrdenCliente, Resumen,
{/roim}
                              OrdenCatMin : Boolean;
                              OperadoNafin, OperadoFOVI, OperadoFIRA : Boolean) : String;
  end;


var
  QrProvDiaria: TQrProvDiaria;
  bGenArch: Boolean;
  sArchivo:String;
  sTipRecu2:String;
  F: TextFile;

Procedure EjecutarReporteProvisionDiaria(  sF_Inicio, sF_Fin, sGpoProducto,
                                           sProducto, sPromAdmin, sPromAsoc,
                                           sCartera, sTraspaso, sNbrArch,sSubTipo,
                                           sAcreditado, sEmpresa, sSucursal:String;
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
//                                           OrdenProm, OrdenCliente, Resumen,
                                           OrdenProm, OrdenPromAdm, OrdenCliente, Resumen,
{/roim}
                                           OrdenCatMin : Boolean;
                                           OperadoNafin, OperadoFOVI, OperadoFIRA : Boolean;
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


Procedure EjecutarReporteProvisionDiaria2(  sF_Inicio, sF_Fin, sGpoProducto,
                                           sProducto, sPromAdmin, sPromAsoc,
                                           sCartera, sTraspaso, sNbrArch,sSubTipo, sTipRecu1, //sTipRecu1 - ACREDITADO EN RECUPERACION
                                           sAcreditado, sEmpresa, sSucursal:String;
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
//                                           OrdenProm, OrdenCliente, Resumen,
                                           OrdenProm, OrdenPromAdm, OrdenCliente, Resumen,
{/roim}                                           
                                           OrdenCatMin : Boolean;
                                           OperadoNafin, OperadoFOVI, OperadoFIRA : Boolean;
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


Procedure EjecutarReporteProvisionDiaria(  sF_Inicio, sF_Fin, sGpoProducto,
                                           sProducto, sPromAdmin, sPromAsoc,

                                           sCartera, sTraspaso, sNbrArch, sSubTipo,

                                           sAcreditado, sEmpresa, sSucursal:String;
                                           OrdenProm, OrdenPromAdm, OrdenCliente, Resumen,
{/roim}
                                           OrdenCatMin : Boolean;
                                           OperadoNafin, OperadoFOVI, OperadoFIRA : Boolean;
                                           pAPli     : TInterApli;
                                           pPreview  : Boolean;
                                           //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
                                           grOpcion  : TGenRepOption;
                                           //</LOLS>
                                           //<LOLS 17FEB2006. DIGITALIZACION DE REPORTES>
                                           sArchivoDig : String
                                           //</LOLS>
                                           );
begin

EjecutarReporteProvisionDiaria2(  sF_Inicio, sF_Fin, sGpoProducto,
                                  sProducto, sPromAdmin, sPromAsoc,
//                                  sCartera, '', sNbrArch, sSubTipo, sTipRecu1,
                                  sCartera, sTraspaso, sNbrArch, sSubTipo, '2',
                                  sAcreditado, sEmpresa, sSucursal,
                                  OrdenProm, OrdenPromAdm, OrdenCliente, Resumen,
                                  OrdenCatMin,
                                  OperadoNafin, OperadoFOVI, OperadoFIRA,
                                  pAPli,
                                  pPreview,
                                  grOpcion,
                                  sArchivoDig
                                           );

end;


Procedure EjecutarReporteProvisionDiaria2(  sF_Inicio, sF_Fin, sGpoProducto,
                                           sProducto, sPromAdmin, sPromAsoc,
                                           sCartera, sTraspaso, sNbrArch, sSubTipo, sTipRecu1, //sTipRecu1 - ACREDITADO EN RECUPERACION
                                           sAcreditado, sEmpresa, sSucursal:String;
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
//                                           OrdenProm, OrdenCliente, Resumen,
                                           OrdenProm, OrdenPromAdm, OrdenCliente, Resumen,
{/roim}
                                           OrdenCatMin : Boolean;
                                           OperadoNafin, OperadoFOVI, OperadoFIRA : Boolean;
                                           pAPli     : TInterApli;
                                           pPreview  : Boolean;
                                           //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
                                           grOpcion  : TGenRepOption;
                                           //</LOLS>
                                           //<LOLS 17FEB2006. DIGITALIZACION DE REPORTES>
                                           sArchivoDig : String
                                           //</LOLS>
                                           );
Var
   QrProvDiaria   : TQrProvDiaria;
   Preview     : TIntQRPreview;
   //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
   sFileName   : String;
   //</LOLS>

   // RUCJ4248: Variable para la validación de la digitalización;
   bDigitalizaCorrecta : Boolean;
Begin
   QrProvDiaria   := TQrProvDiaria.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrProvDiaria);
   QrProvDiaria.Apli := pAPli;
   Try
      bGenArch:= False;
      sArchivo:= sNbrArch;
      QrProvDiaria.sSubTipoRep:= sSubTipo;
      sTipRecu2:=sTipRecu1;
      QrProvDiaria.QRInterEncabezado1.Apli:=pApli;
      QrProvDiaria.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrProvDiaria.QRInterEncabezado1.NomReporte:='IntMQrProvDiaria';

      QrProvDiaria.QRInterEncabezado1.Titulo1:='Cartera Vigente y Provisiones al día : '+ sF_Inicio;



      if OperadoNafin then
         QrProvDiaria.QRInterEncabezado1.Titulo2:=QrProvDiaria.QRInterEncabezado1.Titulo2 + 'Creditos NAFIN';
      //end if;
      if OperadoFOVI then
      begin
         IF OperadoNafin THEN
            QrProvDiaria.QRInterEncabezado1.Titulo2:=QrProvDiaria.QRInterEncabezado1.Titulo2 + ', ';
         //END IF
         QrProvDiaria.QRInterEncabezado1.Titulo2:=QrProvDiaria.QRInterEncabezado1.Titulo2 + 'Creditos FOVI';
      end;

      if OperadoFIRA then
      begin
         IF OperadoNafin OR OperadoFOVI THEN
            QrProvDiaria.QRInterEncabezado1.Titulo2:=QrProvDiaria.QRInterEncabezado1.Titulo2 + ', ';
         //END IF
         QrProvDiaria.QRInterEncabezado1.Titulo2:=QrProvDiaria.QRInterEncabezado1.Titulo2 + 'Creditos FIRA';
      end;

      If (Trim(sGpoProducto)<>'') Then
            QrProvDiaria.QRInterEncabezado1.Titulo2:=QrProvDiaria.QRInterEncabezado1.Titulo2 + '( Gpo: Producto: ' + sGpoProducto + ')';
      // end if;

      If (Trim(sProducto)<>'') Then
            QrProvDiaria.QRInterEncabezado1.Titulo2:=QrProvDiaria.QRInterEncabezado1.Titulo2 + '( Producto: ' + sProducto + ')';
      // end if;


      QrProvDiaria.vgFechaMesAnt := ObtFechaMesAnt( C_FMAN, pApli );
      QrProvDiaria.vgTCambioMesAnt := ObtTipoCambio( QrProvDiaria.vgFechaMesAnt,
                                                   IntToStr ( C_DLLS ) ,
                                                   pAPli.DataBaseName, pAPli.SessionName);
      QrProvDiaria.vgTCambioUDIS := ObtTipoCambio( pAPli.DameFechaEmpresaDia('D000'),
                                                   IntToStr ( 800 ) ,
                                                   pAPli.DataBaseName, pAPli.SessionName);
      QrProvDiaria.DataSet := QrProvDiaria.qyConsulta;
      QrProvDiaria.qyConsulta.DatabaseName := pApli.DataBaseName;
      QrProvDiaria.qyConsulta.SessionName := pApli.SessionName;

      QrProvDiaria.qyConsulta.Active:=False;
      QrProvDiaria.qyConsulta.SQL.Clear;
      QrProvDiaria.qyConsulta.SQL.Add(
      QrProvDiaria.LlenaEncabezado( sF_Inicio, sF_Fin, sGpoProducto,
                                    sProducto, sPromAdmin, sPromAsoc,
                                    sCartera, sTraspaso, sAcreditado,
                                    sEmpresa, sSucursal,

{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
//                                    OrdenProm, OrdenCliente, Resumen, OrdenCatMin,
                                    OrdenProm,OrdenPromAdm, OrdenCliente, Resumen, OrdenCatMin,
{/roim}

                                    OperadoNafin, OperadoFOVI, OperadoFIRA));
      QrProvDiaria.qyConsulta.Active:=True;
      If OrdenCatMin Then Begin
         QrProvDiaria.GpoProducto.Expression := 'qyConsulta.DESC_CAT_MIN';
         QrProvDiaria.QRDBText16.DataField:= 'DESC_CAT_MIN';
      End Else Begin
         QrProvDiaria.GpoProducto.Expression := 'qyConsulta.DESC_SUB_TIPO1';
         QrProvDiaria.QRDBText16.DataField:= 'DESC_SUB_TIPO1';
      End;
      If not OrdenProm Then Begin
         QrProvDiaria.GpoPromAdm.Enabled := False;
         QrProvDiaria.GpoPromAdm.Expression := '';
      End;
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
      If not OrdenPromAdm Then Begin
         QrProvDiaria.GpoPromAdmon.Enabled := False;
         QrProvDiaria.GpoPromAdmon.Expression := '';
      End;
{/roim}
      If not OrdenCliente Then Begin
         QrProvDiaria.GpoCliente.Enabled := False;
         QrProvDiaria.GpoCliente.Expression := '';
      End;

      If Resumen Then Begin
         QrProvDiaria.qrDetalle.Enabled := False;
         QrProvDiaria.GpoCliente.Enabled := False;
         QrProvDiaria.GpoCliente.Expression := '';
         QrProvDiaria.GpoPromAdm.Enabled := False;
         QrProvDiaria.GpoPromAdm.Expression := '';
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
         QrProvDiaria.GpoPromAdmon.Enabled := False;
         QrProvDiaria.GpoPromAdmon.Expression := '';
{/roim}
      End;

      If (QrProvDiaria.qyConsulta.RecordCount > 0) Then Begin
         If Trim(sArchivo)<>'' Then Begin
            AssignFile(F, sArchivo);
            Rewrite(F);
            Writeln(F, QrProvDiaria.QRInterEncabezado1.Titulo1 + #09 );
            Writeln(F, QrProvDiaria.QRInterEncabezado1.Titulo2 + #09 );
            Writeln(F, #09 );
            Writeln(F,
         // Grupo
         'Promotor Asociado' + #09#09 +
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
         'Promotor Admon.' + #09#09 +
{/roim}
         'Cliente Especial' + #09#09 +
         'Cartera'+ #09 +
         'Moneda' + #09#09 +
         'Cve Cat. Min.' + #09 +
         'Producto' + #09 +
         //'Tipo Crédito' + #09#09 +
         //****JRG LatBC---  Correción de doble tabulación.
         'Tipo Crédito' + #09 +
         //*************************************
         'Cta. Cap.' + #09 +
         'Cta. Int' + #09 +
         //Registros
                'Cartera Vencida' +  #09+
                //*******JRG LatBC se agrega estado
                'En Recuperacion' +  #09+
                //************************
                'Crédito' +  #09 +
                'Cliente'+  #09 +
                'Nombre' +  #09 +
                'Fecha de Inicio de Crédito' +  #09 +
                'Fecha Final de Crédito'+  #09 +
                'Fecha de Inicio de Intereses' +  #09 +
                'Fecha Final de Intereses' +  #09 +
                'Tasa' +  #09 + #09 +
                'Sobretasa' +  #09 +
                'Tipo de Cálculo' +  #09 +
                'Monto de Crédito' +  #09 +
                'Saldo Insoluto' +  #09 +
                'Interés del día'  +  #09 +
                'Días Acumulados'  +  #09 +
                'Intereses Acumulados' +  #09 +
                'IVA Acumulado' +  #09 +
                'Oper. Nafin'
                );
            Writeln(F, '');
         End;

         //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
         if grOpcion = grPreview then
             QrProvDiaria.Preview
         else if grOpcion = grPrint then
             QrProvDiaria.Print
         else if grOpcion = grDigitaliza then
         begin
           sFileName := 'CAR_VIG_Y_PROV_AL_DIA_'  +  FormatDateTime( 'DD_MM_YYYY', StrToDate(sF_Inicio) ) + '_' +
                        FormatDateTime( 'DD_MM_YYYY', StrToDate(sF_Fin) )  + '_' +
                        sGpoProducto +  '_' + sProducto + '_' + sPromAdmin + '_' + sPromAsoc   + '_' +
                        sCartera     +  '_' + sTraspaso + '_' + sSubTipo   + '_' + sAcreditado + '_' +
                        sEmpresa     +  '_' + sSucursal + '_' + BoolToStr(OrdenProm) + '_' +
                        BoolToStr(OrdenPromAdm) + '_' + BoolToStr(OrdenCliente) + '_' + BoolToStr(Resumen)     + '_' +
                        BoolToStr(OrdenCatMin)  + '_' + BoolToStr(OperadoNafin) + '_' + BoolToStr(OperadoFOVI) + '_' +
                        BoolToStr(OperadoFIRA);
            QrProvDiaria.InterDigDoc1.RootDir  := obtValorGpoCve( 'CONFRH', 'ROOTDIR',   pApli );
            QrProvDiaria.InterDigDoc1.HostName := obtValorGpoCve( 'CONFRH', 'FTPSERVER', pApli );
            QrProvDiaria.InterDigDoc1.UserName := obtValorGpoCve( 'CONFRH', 'USERNAME',  pApli );
            QrProvDiaria.InterDigDoc1.Password := HexToStr( obtValorGpoCve( 'CONFRH', 'PASSWORD',  pApli ) );
            QrProvDiaria.InterDigDoc1.SendTo   := ObtSendTo( sF_Inicio );
            QrProvDiaria.InterDigDoc1.FileName := sArchivoDig; // sFileName;  // LOLS 17FEB2006. DIGITALIZACION DE REPORTES
            QrProvDiaria.PrinterSettings.PrinterIndex := QrProvDiaria.InterDigDoc1.SetPrinter;
            QrProvDiaria.Print;
//            RUCJ4248 : validar que la digitalización se genere de forma correcta
            bDigitalizaCorrecta := (QrProvDiaria.InterDigDoc1.Compress and QrProvDiaria.InterDigDoc1.SendFile);
//            QrProvDiaria.InterDigDoc1.Compress;
//            QrProvDiaria.InterDigDoc1.SendFile;
            QrProvDiaria.PrinterSettings.PrinterIndex := QrProvDiaria.InterDigDoc1.RestorePrinter;
         end;
         //If pPreview Then
         //   QrProvDiaria.Preview
         //Else
         //   QrProvDiaria.Print;
         //</LOLS>
      End Else
        ShowMessage(CERROR_NOEXISTEN);
   Finally
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
      QrProvDiaria.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

{ TQrProvDiaria }

function TQrProvDiaria.LlenaEncabezado(sFInicio, sFFin, sGpoProducto,
                                    sProducto, sPromAdmin, sPromAsoc,
                                    sCartera, sTraspaso, sAcreditado,
                                    sEmpresa, sSucursal: String;
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
//                                    OrdenProm,  OrdenCliente, Resumen,OrdenCatMin: Boolean;
                                    OrdenProm, OrdenPromAdm, OrdenCliente, Resumen,OrdenCatMin: Boolean;
{/roim}
                                    OperadoNafin, OperadoFOVI, OperadoFIRA : Boolean): String;
Var
   sSQL, sSQLTabCR, sSQLTabCI,sFiltros:String; slSQL: TStringList;
       sStatus     : String;
Begin
    sStatus:='Si';

   If (Trim(sAcreditado)<>'') Then
      sFiltros:= sFiltros + ' CONTRATO.ID_TITULAR ='+ sAcreditado +' AND ' + coCRLF;
   If (Trim(sPromAdmin)<>'') Then
      sFiltros:= sFiltros + ' CR.ID_PROM_ADM ='+sPromAdmin + 'AND '+ coCRLF;
   If (Trim(sPromAsoc)<>'') Then
      sFiltros:= sFiltros + ' CONTRATO.ID_PERS_ASOCIAD = '+sPromAsoc+ 'AND '+ coCRLF;
   If (Trim(sTraspaso)='T') Then
      sFiltros:= sFiltros + ' CRE_PROV_DIARIA.F_TRASPASO_VEN IS NOT NULL AND '+ coCRLF;
   If (Trim(sTraspaso)='NT') Then
      sFiltros:= sFiltros + ' CRE_PROV_DIARIA.F_TRASPASO_VEN IS NULL  AND '+ coCRLF;
   If (Trim(sEmpresa)<>'') Then
      sFiltros:= sFiltros + ' CONTRATO.ID_EMPRESA='+ Trim(sEmpresa) +' AND '+ coCRLF;

   If sSubTipoRep = 'GL' Then Begin
      sFiltros:= sFiltros + ' CR.CVE_SUB_TIP_BCO NOT IN (118,119,120,121) AND '+ coCRLF;
   End;
   If sSubTipoRep = 'CO' Then Begin

      sFiltros:= sFiltros + ' CR.CVE_SUB_TIP_BCO NOT IN (57,59,60,61,65,20,118,119,120,121,139,140,147 ) AND '+ coCRLF;
   End;
   If sSubTipoRep = 'HI' Then Begin
      sFiltros:= sFiltros + ' CR.CVE_SUB_TIP_BCO IN (57,59,60,61,65,20,139,140,147 ) AND '+ coCRLF;
   End;

   sSQLTabCR:= '  SELECT  ''CRED'' AS ORIGEN,'+ coCRLF +
         '          ID_CREDITO,      ID_CONTRATO,      ID_CESION,'+ coCRLF +
         '          CVE_CALCULO,     CVE_TASA_REFER,   SOBRETASA,'+ coCRLF +
         '          B_PROG_FOPYME,   TIPO_DISPOSICION, F_VALOR_CRED,'+ coCRLF +
         '          IMP_CREDITO,     DIAS_PLAZO,'+ coCRLF +
         '          F_VALOR_CRED +   DIAS_PLAZO FEC_VENC_CRED,'+ coCRLF +
         '          CVE_CAT_MIN,     CVE_SUB_TIP_BCO,  DESC_SUB_TIPO,'+ coCRLF +
         '          CVE_SUB_CARTERA, CVE_SUB_TIP_CNBV, DESC_SUB_TIPO1,'+ coCRLF +
         '          B_OPERADO_NAFIN, ID_PROM_ADM'+ coCRLF +
         '   FROM   ('+ coCRLF +
         '           SELECT C.ID_CREDITO,      C.ID_CONTRATO,      C.ID_CESION,'+ coCRLF +
         '                  C.CVE_CALCULO,     C.CVE_TASA_REFER,   C.SOBRETASA,'+ coCRLF +
         '                  C.B_PROG_FOPYME,   C.TIPO_DISPOSICION, C.F_VALOR_CRED,'+ coCRLF +
         '                  C.IMP_CREDITO,     C.DIAS_PLAZO,'+ coCRLF +
         '                  C.F_VALOR_CRED + C.DIAS_PLAZO FEC_VENC_CRED,'+ coCRLF +
         '                  C.ID_PROM_ADM,'+ coCRLF +
         '                  A.CVE_CAT_MIN,     A.CVE_SUB_TIP_BCO, A.DESC_SUB_TIPO,'+ coCRLF +
         '                  A.CVE_SUB_CARTERA, A.CVE_SUB_TIP_CNBV,'+ coCRLF +
         '                  PKGCREINGRESO.STPOBTDESCSUBTIP01( C.CVE_CALCULO, C.TIPO_DISPOSICION,'+ coCRLF +
         '                  A.CVE_SUB_TIP_BCO, A.DESC_SUB_TIPO ) DESC_SUB_TIPO1,'+ coCRLF +
         '                  CS.B_OPERADO_NAFIN, A.F_TRASPASO_ICRE, C.SIT_CREDITO'+ coCRLF +
         '            FROM  (SELECT L.ID_CONTRATO,        L.CVE_CAT_MIN,'+ coCRLF +
         '                          CST.CVE_SUB_TIP_BCO,  CST.CVE_SUB_CARTERA,'+ coCRLF +
         '                          CST.CVE_SUB_TIP_CNBV,'+ coCRLF +
         '                          CST.DESC_SUB_TIPO,    CST.F_TRASPASO_ICRE'+ coCRLF +
         '                     FROM CRE_SUB_TIP_BCO CST,  CRE_CONTRATO L'+ coCRLF +
         '                    WHERE L.CVE_SUB_TIP_BCO  =  CST.CVE_SUB_TIP_BCO'+ coCRLF +
         '                   )A ,'+ coCRLF +
         '                   CRE_CREDITO C,'+ coCRLF +
         '                   CRE_CESION  CS'+ coCRLF +
         '            WHERE  C.ID_CONTRATO  = A.ID_CONTRATO'+ coCRLF +
         '              AND  CS.ID_CESION(+)= C.ID_CESION'+ coCRLF +
         '          )B'+ coCRLF +
         '  WHERE  ( B.F_TRASPASO_ICRE IS NOT NULL AND'+ coCRLF +
         '           B.SIT_CREDITO NOT IN ( ''TA'' )'+ coCRLF +
         '          )'+ coCRLF +
         '     OR  B.F_TRASPASO_ICRE IS NULL'+ coCRLF;

   sSQLTabCI :=
         '(	SELECT ''CRED'' AS ORIGEN,'+ coCRLF +
         '         CI.ID_CREDITO,  CI.NUM_PERIODO,  CI.F_VENCIMIENTO, CI.PLAZO'+ coCRLF +
         '        ,CI.IMP_IVA'+ coCRLF + // HERJA CAMPO IMP_IVA
         '    FROM CRE_INTERES CI, CRE_CREDITO CR'+ coCRLF +
         '   WHERE CR.ID_CREDITO = CI.ID_CREDITO'+ coCRLF +
         '     AND CR.SIT_CREDITO NOT IN ( ''CA'', ''TA'' )'+ coCRLF +
         ')CI' + coCRLF ;



   sSQL:=
         'SELECT B.*,'+ coCRLF +
         '       DECODE(CVE_MONEDA,800,TC_CONT_UDI*IMP_CREDITO,840,TC_CONT_USD*IMP_CREDITO,IMP_CREDITO)TOT_IMPCRED_DIV,'+ coCRLF +
         '       DECODE(CVE_MONEDA,800,TC_CONT_UDI*SDO_INSOLUTO,840,TC_CONT_USD*SDO_INSOLUTO,SDO_INSOLUTO)TOT_SDOIN_DIV,'+ coCRLF +
         '       DECODE(CVE_MONEDA,800,TC_CONT_UDI*INT_DIA,840,TC_CONT_USD*INT_DIA,INT_DIA)TOT_INTDIA_DIV,'+ coCRLF +
         '       DECODE(CVE_MONEDA,800,TC_CONT_UDI*INT_ACUM,840,TC_CONT_USD*INT_ACUM,INT_ACUM)TOT_INTACUM_DIV,'+ coCRLF +
         '       DECODE(CVE_MONEDA,800,TC_CONT_UDI*INT_ACUM_ETQ,840,TC_CONT_USD*INT_ACUM_ETQ,INT_ACUM_ETQ)TOT_INTACUMETQ_DIV'+ coCRLF +
         '      ,DECODE(CVE_MONEDA,800,TC_CONT_UDI*IVA_ACUMULADO,840,TC_CONT_USD*IVA_ACUMULADO,IVA_ACUMULADO)TOT_IVAACUM_DIV'+ coCRLF + //HERJA CAMPO IVA
         '  FROM ('+ coCRLF +
         'SELECT A.*, '+ coCRLF +
         '			DECODE(PARTE,''A'','+ coCRLF +
         '	  	   DECODE(CVE_SUB_TIP_BCO,57,IMP_INTERES_DIA*DIAS_PROV,'+ coCRLF +
         '              59,IMP_INTERES_DIA*DIAS_PROV,'+ coCRLF +
         '					60,IMP_INTERES_DIA*DIAS_PROV,'+ coCRLF +
         '					61,IMP_INTERES_DIA*DIAS_PROV,'+ coCRLF +
         '					65,IMP_INTERES_DIA*DIAS_PROV,'+ coCRLF +
         '					140,IMP_INTERES_DIA*DIAS_PROV,'+ coCRLF +
         '					147,IMP_INTERES_DIA*DIAS_PROV,'+ coCRLF +
         '					20,IMP_INTERES_DIA*DIAS_PROV,'+ coCRLF +
         '					DECODE(CVE_CALCULO,''AN'',0,IMP_INTERES_PER)),'+ coCRLF +
         '                     ''B'', INT_ACUM_OPC1 )INT_ACUM,'+ coCRLF +
         '			DECODE(PARTE,''A'','+ coCRLF +
         '	  	   DECODE(CVE_SUB_TIP_BCO,57,IMP_INTERES_DIA,'+ coCRLF +
         '               59,IMP_INTERES_DIA,'+ coCRLF +
         '					60,IMP_INTERES_DIA,'+ coCRLF +
         '					61,IMP_INTERES_DIA,'+ coCRLF +
         '					65,IMP_INTERES_DIA,'+ coCRLF +
         '					140,IMP_INTERES_DIA,'+ coCRLF +
         '					147,IMP_INTERES_DIA,'+ coCRLF +
         '					20,IMP_INTERES_DIA,'+ coCRLF +
         '					DECODE(CVE_CALCULO,''AN'',0,''PA'',IMP_INTERES_DIA,'+ coCRLF +
         '                     IMP_INTERES_PER-IMP_INTERES_AYER)),'+ coCRLF +
         '                     ''B'', IMP_INTERES_DIA )INT_DIA,'+ coCRLF +
         '			DECODE(PARTE,''A'','+ coCRLF +
         '	  	   DECODE(CVE_SUB_TIP_BCO,57,INT_ACUM_OPC1,'+ coCRLF +
         '                                      59,INT_ACUM_OPC1,'+ coCRLF +
         '					60,INT_ACUM_OPC1,'+ coCRLF +
         '					61,INT_ACUM_OPC1,'+ coCRLF +
         '					65,INT_ACUM_OPC1,'+ coCRLF +
         '					140,INT_ACUM_OPC1,'+ coCRLF +
         '					147,INT_ACUM_OPC1,'+ coCRLF +
         '					20,INT_ACUM_OPC1,'+ coCRLF +
         '					DECODE(CVE_CALCULO,''AN'',0,IMP_INTERES_PER)),'+ coCRLF +
         '                     ''B'', INT_ACUM_OPC1 )INT_ACUM_ETQ'+ coCRLF +
	 '	               ,DECODE(PARTE,''A'', '+ coCRLF +   //HERJA INICIO CALCULO DE IMP_IVA
  	 ' 	           DECODE(CVE_SUB_TIP_BCO,57,IVA_ACUM,'+ coCRLF +
         '                                       59,IVA_ACUM,'+ coCRLF +
         '                                       60,IVA_ACUM,'+ coCRLF +
         '                                       61,IVA_ACUM,'+ coCRLF +
         '                                       65,IVA_ACUM,'+ coCRLF +
         '                                       140,IVA_ACUM,'+ coCRLF +
         '                                       147,IVA_ACUM,'+ coCRLF +
         '                                       20,IVA_ACUM,'+ coCRLF +
         '                                       DECODE(CVE_CALCULO,''AN'',0,IVA_ACUM)),'+ coCRLF +
	 '                    ''B'', IVA_ACUM ) IVA_ACUMULADO'+ coCRLF +      //HERJA FIN CALCULO DE IMP_IVA
         '  FROM (('+ coCRLF +
//InterCréditosInterCréditosInterCréditosInterCréditosInterCréditosInterCréditos
//InterCréditosInterCréditosInterCréditosInterCréditosInterCréditosInterCréditos

         '    SELECT'+ coCRLF +
         '      ''A'' AS PARTE,'+ coCRLF +
         '      ''CARTERA NO BANCARIA'' AS CARTERA,'+ coCRLF +
         '      NVL2(CRE_PROV_DIARIA.F_TRASPASO_VEN,''*'','' '') AS VENCIDA,'+ coCRLF +
         '      PERSONA.CVE_PER_JURIDICA,'+ coCRLF +
         '      PERSONA_MORAL.NOM_RAZON_SOCIAL ||PERSONA_FISICA.APELLIDO_PATERNO || '' '' || PERSONA_FISICA.APELLIDO_MATERNO || '' '' || PERSONA_FISICA.NOMBRE_PERSONA AS NOMBRE,'+ coCRLF +
         '      CRE_PROV_DIARIA.F_TRASPASO_VEN,'+ coCRLF +
         '      CRE_PROV_DIARIA.F_PROVISION-( CI.F_VENCIMIENTO-CI.PLAZO) + 1 AS dias_prov,'+ coCRLF +
         '      CR.CVE_CAT_MIN, CRE_CAT_MINIMO.DESC_CAT_MIN, CONTRATO.CVE_MONEDA,'+ coCRLF +
         '      CR.CVE_SUB_CARTERA,'+ coCRLF +
         '      CRE_PROV_DIARIA.F_PROVISION - (CI.F_VENCIMIENTO - CI.PLAZO) + 1 AS DIAS_FINAL,'+ coCRLF +
         '      CRE_PROV_DIARIA.IMP_INTERES_DIA * (CRE_PROV_DIARIA.F_PROVISION - (CI.F_VENCIMIENTO - CI.PLAZO) + 1) AS INT_ACUM_OPC1,'+ coCRLF +
         '      CR.F_VALOR_CRED + CR.DIAS_PLAZO AS FEC_VENC_CRED,'+ coCRLF +
         '      CI.F_VENCIMIENTO - CI.PLAZO AS FEC_INICIO_INTERES,'+ coCRLF +
         '      MONEDA.DESC_MONEDA, CRE_PARAMETRO.TC_CONT_USD, CRE_PARAMETRO.TC_CONT_UDI,'+ coCRLF +
         '      CR.CVE_SUB_TIP_BCO, CR.DESC_SUB_TIPO AS DESC_SUB_TIPO,'+ coCRLF +
         '      SUBSTR( CR.DESC_SUB_TIPO1, 1, 200 ) AS DESC_SUB_TIPO1,'+ coCRLF +
         '      CR.ID_CREDITO, CR.ID_CESION, CR.CVE_CALCULO, CR.CVE_TASA_REFER,'+ coCRLF +
         '      CR.DIAS_PLAZO, CR.F_VALOR_CRED, CR.IMP_CREDITO, CR.SOBRETASA,'+ coCRLF +
         '      CR.TIPO_DISPOSICION, CR.B_PROG_FOPYME, '+ coCRLF +
         '      DECODE(CVE_SUB_TIP_BCO,52,DECODE(CR.B_OPERADO_NAFIN,''V'',''N'','' ''),'' '')AS B_OPERADO_NAFIN,'+ coCRLF +
         '      CRE_SUB_TIP_CNBV.CTA_CONTABLE, CRE_SUB_TIP_CNBV.CTA_INTERES,'+ coCRLF +
         '      CRE_PROV_DIARIA.F_PROVISION, CRE_PROV_DIARIA.IMP_INTERES_AYER,'+ coCRLF +
         '      CRE_PROV_DIARIA.IMP_INTERES_DIA, CRE_PROV_DIARIA.IMP_INTERES_PER,'+ coCRLF +
         '	CI.IMP_IVA AS IVA_ACUM,'+ coCRLF + // HERJA CAMPO IMP_IVA
         '      CRE_PROV_DIARIA.SDO_INSOLUTO, CRE_PROV_DIARIA.TASA_APLICADA,'+ coCRLF +
         '      CRE_TIPO_CREDITO.TIPO_CUENTA,CRE_TIPO_CREDITO.DESC_TIPO_CRED, '+ coCRLF +         //EASA4011 28022005
         '      CI.F_VENCIMIENTO, CI.PLAZO,'+ coCRLF +
         '      CONTRATO.ID_TITULAR AS ID_PERSONA, CR.ID_PROM_ADM,'+ coCRLF +
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
//         '      '' '' AS PROMADM, CONTRATO.ID_PERS_ASOCIAD, PASOC.NOMBRE P_ASOC,'+ coCRLF +
         '      PADMON.NOMBRE AS PROMADM, CONTRATO.ID_PERS_ASOCIAD, PASOC.NOMBRE P_ASOC,'+ coCRLF +
{/roim}
         '      '' '' AS CVE_PRODUCTO_CRE, '' '' AS DESC_C_PRODUCTO, CONTRATO.ID_EMPRESA '+ coCRLF +

         '     , ''  '' AS StatusRecu'+ coCRLF +
         '    FROM'+ coCRLF +
         '      PERSONA, CONTRATO, PERSONA_FISICA, PERSONA_MORAL,'+ coCRLF +
         '      MONEDA, CRE_PARAMETRO, PERSONA PASOC, '+ coCRLF +
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
         '      PERSONA PADMON, '+ coCRLF +
{/roim}
         '('+ coCRLF;

   sSQL := sSQL + sSQLTabCR + coCRLF +
         ') CR, CRE_SUB_TIP_CNBV, CRE_PROV_DIARIA, CRE_CAT_MINIMO, CRE_TIPO_CREDITO,'+ coCRLF;

   sSQL := sSQL + sSQLTabCI + coCRLF +
         '    WHERE ' + coCRLF;
///// filtros
   sSQL:= sSQL + sFiltros;
/////
   sSQL:= sSQL +
         '      CONTRATO.ID_TITULAR = PERSONA.ID_PERSONA AND'+ coCRLF +
         '      CONTRATO.ID_TITULAR = PERSONA_FISICA.ID_PERSONA (+) AND'+ coCRLF +
         '      CONTRATO.ID_TITULAR = PERSONA_MORAL.ID_PERSONA (+) AND'+ coCRLF +
         '      CONTRATO.ID_CONTRATO = CR.ID_CONTRATO AND'+ coCRLF +
         '      CONTRATO.CVE_MONEDA = MONEDA.CVE_MONEDA AND'+ coCRLF +
         '      CONTRATO.CVE_TIP_CONTRATO = CRE_PARAMETRO.CVE_TIP_CONTRATO AND'+ coCRLF +
         '      CR.CVE_CAT_MIN = CRE_CAT_MINIMO.CVE_CAT_MIN(+) AND'+ coCRLF +
         '      CR.ID_CREDITO = CRE_PROV_DIARIA.ID_CREDITO AND'+ coCRLF +
         '		 CRE_PROV_DIARIA.F_PROVISION = TO_DATE('''+
             FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'') AND'+ coCRLF +
         '      CR.CVE_SUB_TIP_CNBV = CRE_SUB_TIP_CNBV.CVE_SUB_TIP_CNBV AND'+ coCRLF +
         '      CRE_SUB_TIP_CNBV.CVE_TIPO_CREDITO = CRE_TIPO_CREDITO.CVE_TIPO_CREDITO AND'+ coCRLF +
         '      CR.ORIGEN = CI.ORIGEN  AND'+ coCRLF +
         '      CRE_PROV_DIARIA.ID_CREDITO = CI.ID_CREDITO AND'+ coCRLF +
         '      CRE_PROV_DIARIA.NUM_PERIODO = CI.NUM_PERIODO AND'+ coCRLF +
         '      CR.CVE_SUB_TIP_BCO IN(50,59,60,118,119,120,121,51) AND'+ coCRLF +
         '      PASOC.ID_PERSONA(+)= CONTRATO.ID_PERS_ASOCIAD '+ coCRLF ;

{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
          sSQL:= sSQL + ' AND PADMON.ID_PERSONA(+)= CR.ID_PROM_ADM '+ coCRLF ;
{/roim}

{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
         If (Trim(sGpoProducto)<>'') Then
             sSQL:= sSQL + ' AND PADMON.ID_PERSONA(+)= CR.ID_PROM_ADM '+ coCRLF ;
{/roim}

         If (Trim(sGpoProducto)<>'') Then
             sSQL:= sSQL + ' AND CR.CVE_SUB_TIP_BCO IN (999) '+ coCRLF ;

         If (Trim(sProducto)<>'') Then
             sSQL:= sSQL + ' AND CR.CVE_SUB_TIP_BCO IN (999) '+ coCRLF ;

   sSQL:= sSQL +
         '    UNION ALL'+ coCRLF +
         '    SELECT'+ coCRLF +
         '      ''A'' AS PARTE,'+ coCRLF +
         '      ''CARTERA BANCARIA'' AS CARTERA,'+ coCRLF +
         '      NVL2(CRE_PROV_DIARIA.F_TRASPASO_VEN,''*'','' '') AS VENCIDA,'+ coCRLF +
         '      PERSONA.CVE_PER_JURIDICA,'+ coCRLF +
         '      PERSONA_MORAL.NOM_RAZON_SOCIAL ||PERSONA_FISICA.APELLIDO_PATERNO || '' '' || PERSONA_FISICA.APELLIDO_MATERNO || '' '' || PERSONA_FISICA.NOMBRE_PERSONA AS NOMBRE,'+ coCRLF +
         '      CRE_PROV_DIARIA.F_TRASPASO_VEN,'+ coCRLF +
         '      CRE_PROV_DIARIA.F_PROVISION-(CI.F_VENCIMIENTO-CI.PLAZO) + 1 AS dias_prov,'+ coCRLF +
         '      CR.CVE_CAT_MIN, CRE_CAT_MINIMO.DESC_CAT_MIN, CONTRATO.CVE_MONEDA,'+ coCRLF +
         '      CR.CVE_SUB_CARTERA,'+ coCRLF +
         '      CRE_PROV_DIARIA.F_PROVISION - (CI.F_VENCIMIENTO - CI.PLAZO) + 1 AS DIAS_FINAL,'+ coCRLF +
         '      CRE_PROV_DIARIA.IMP_INTERES_DIA * (CRE_PROV_DIARIA.F_PROVISION - (CI.F_VENCIMIENTO - CI.PLAZO) + 1) INT_ACUM_OPC1,'+ coCRLF +
         '      CR.F_VALOR_CRED + CR.DIAS_PLAZO AS FEC_VENC_CRED,'+ coCRLF +
         '      CI.F_VENCIMIENTO - CI.PLAZO AS FEC_INICIO_INTERES,'+ coCRLF +
         '      MONEDA.DESC_MONEDA, CRE_PARAMETRO.TC_CONT_USD,'+ coCRLF +
         '      CRE_PARAMETRO.TC_CONT_UDI, CR.CVE_SUB_TIP_BCO,'+ coCRLF +
         '      CR.DESC_SUB_TIPO AS DESC_SUB_TIPO,'+ coCRLF +
         '      SUBSTR( CR.DESC_SUB_TIPO1, 1, 200 ) AS DESC_SUB_TIPO1,'+ coCRLF +
         '      CR.ID_CREDITO, CR.ID_CESION, CR.CVE_CALCULO, CR.CVE_TASA_REFER,'+ coCRLF +
         '      CR.DIAS_PLAZO,CR.F_VALOR_CRED, CR.IMP_CREDITO, CR.SOBRETASA,'+ coCRLF +
         '      CR.TIPO_DISPOSICION, CR.B_PROG_FOPYME, '+ coCRLF +
         ' DECODE(CVE_SUB_TIP_BCO,52,DECODE(CR.B_OPERADO_NAFIN,''V'',''N'','' ''),'' '') AS B_OPERADO_NAFIN,'+ coCRLF +
         '      CRE_SUB_TIP_CNBV.CTA_CONTABLE, CRE_SUB_TIP_CNBV.CTA_INTERES,'+ coCRLF +
         '      CRE_PROV_DIARIA.F_PROVISION, CRE_PROV_DIARIA.IMP_INTERES_AYER,'+ coCRLF +
         '      CRE_PROV_DIARIA.IMP_INTERES_DIA, CRE_PROV_DIARIA.IMP_INTERES_PER,'+ coCRLF +
         '	CI.IMP_IVA AS IVA_ACUM,'+ coCRLF + //HERJA CAMPO IMP_IVA
         '      CRE_PROV_DIARIA.SDO_INSOLUTO, CRE_PROV_DIARIA.TASA_APLICADA,'+ coCRLF +
         '      CRE_TIPO_CREDITO.TIPO_CUENTA,CRE_TIPO_CREDITO.DESC_TIPO_CRED, '+ coCRLF +         //EASA4011 28022005
         '      CI.F_VENCIMIENTO, CI.PLAZO,'+ coCRLF +
         '      CONTRATO.ID_TITULAR AS ID_PERSONA, CR.ID_PROM_ADM,'+ coCRLF +

{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
//         '      '' '' AS PROMADM, CONTRATO.ID_PERS_ASOCIAD, PASOC.NOMBRE P_ASOC,'+ coCRLF +
         '      PADMON.NOMBRE AS PROMADM, CONTRATO.ID_PERS_ASOCIAD, PASOC.NOMBRE P_ASOC,'+ coCRLF +
{/roim}
         '      '' '' AS CVE_PRODUCTO_CRE, '' '' AS DESC_C_PRODUCTO, CONTRATO.ID_EMPRESA '+ coCRLF +
         '     , ''  '' AS StatusRecu'+ coCRLF +
         '    FROM'+ coCRLF +
         '      PERSONA,CONTRATO, PERSONA_FISICA, PERSONA_MORAL, MONEDA,'+ coCRLF +
         '      CRE_PARAMETRO, PERSONA PASOC, '+ coCRLF +
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
         '      PERSONA PADMON, '+ coCRLF +
{/roim}


         '(' + coCRLF;
   sSQL := sSQL + sSQLTabCR + coCRLF +
         ') CR,'+ coCRLF +
         '      CRE_SUB_TIP_CNBV, CRE_PROV_DIARIA, CRE_CAT_MINIMO,'+ coCRLF +
         '      CRE_TIPO_CREDITO,'+ coCRLF;

   sSQL := sSQL + sSQLTabCI + coCRLF +
         '    WHERE '+ coCRLF;
///// filtros
   sSQL:= sSQL + sFiltros;
/////
   sSQL:= sSQL +
         '       CONTRATO.ID_TITULAR = PERSONA.ID_PERSONA AND '+ coCRLF +
         '       CONTRATO.ID_TITULAR = PERSONA_FISICA.ID_PERSONA (+) AND'+ coCRLF +
         '       CONTRATO.ID_TITULAR = PERSONA_MORAL.ID_PERSONA (+) AND'+ coCRLF +
         '       CONTRATO.ID_CONTRATO = CR.ID_CONTRATO AND'+ coCRLF +
         '       CONTRATO.CVE_MONEDA = MONEDA.CVE_MONEDA AND'+ coCRLF +
         '       CONTRATO.CVE_TIP_CONTRATO = CRE_PARAMETRO.CVE_TIP_CONTRATO AND'+ coCRLF +
         '       CR.CVE_CAT_MIN = CRE_CAT_MINIMO.CVE_CAT_MIN(+) AND'+ coCRLF +
         '       CR.ID_CREDITO = CRE_PROV_DIARIA.ID_CREDITO AND'+ coCRLF +
         ' 			CRE_PROV_DIARIA.F_PROVISION = TO_DATE('''+
             FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'') AND'+ coCRLF +
         '       CR.CVE_SUB_TIP_CNBV = CRE_SUB_TIP_CNBV.CVE_SUB_TIP_CNBV AND'+ coCRLF +
         '       CRE_SUB_TIP_CNBV.CVE_TIPO_CREDITO = CRE_TIPO_CREDITO.CVE_TIPO_CREDITO AND'+ coCRLF +
         '       CR.ORIGEN = CI.ORIGEN AND'+ coCRLF +
         '       CRE_PROV_DIARIA.ID_CREDITO = CI.ID_CREDITO   AND'+ coCRLF +
         '       CRE_PROV_DIARIA.NUM_PERIODO = CI.NUM_PERIODO AND'+ coCRLF +
         '       CR.CVE_SUB_TIP_BCO NOT IN(50,59,60,118,119,120,121,51) AND'+ coCRLF +
         '       CONTRATO.ID_PERS_ASOCIAD = PASOC.ID_PERSONA(+)'+ coCRLF;
         
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
          sSQL:= sSQL + ' AND PADMON.ID_PERSONA(+)= CR.ID_PROM_ADM '+ coCRLF ;
{/roim}

         If (Trim(sGpoProducto)<>'') Then
             sSQL:= sSQL + ' AND CR.CVE_SUB_TIP_BCO IN (999) '+ coCRLF;

         If (Trim(sProducto)<>'') Then
             sSQL:= sSQL + ' AND CR.CVE_SUB_TIP_BCO IN (999) '+ coCRLF;

         sSQL:= sSQL + ' )'+  coCRLF;


//ICREICREICREICREICREICREICREICREICREICREICREICREICREICREICREICREICREICREICREICRE
//ICREICREICREICREICREICREICREICREICREICREICREICREICREICREICREICREICREICREICREICRE

   If (sSubTipoRep = 'CO')Or(sSubTipoRep = 'GL') Then Begin
      sSQL:= sSQL + coCRLF +
               'UNION ALL ('+ coCRLF +
               'SELECT ''B'' AS PARTE,'+  coCRLF +
               ' TIPCAR.VALOR AS CARTERA,' +  coCRLF + //SASB 09/09/2005
               //' ''CARTERA BANCARIA'' CARTERA, '+ coCRLF +
{ROIM 29/11/2005 SE CAMBIA LA FECHA DE VENCIMIENTO DEL CREDITO AL HISTO}
               //' NVL2(CR_CREDITO.F_TRASPASO_VENC,''*'','' '') AS VENCIDA,'+ coCRLF +
               ' NVL2(CR_HISTO_CRED.F_TRASPASO_VENC,''*'','' '') AS VENCIDA,'+ coCRLF +
{/ROIM}
               ' P.CVE_PER_JURIDICA,'+ coCRLF +
               ' DECODE(P.CVE_PER_JURIDICA, ''PF'','+ coCRLF +
               ' PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO || '' '' || PF.NOMBRE_PERSONA,'+
               ' PM.NOM_RAZON_SOCIAL ) AS NOMBRE,'+ coCRLF +
{ROIM 29/11/2005 SE CAMBIA LA FECHA DE VENCIMIENTO DEL CREDITO AL HISTO}
               //' CR_CREDITO.F_TRASPASO_VENC,'+ coCRLF +
               ' CR_HISTO_CRED.F_TRASPASO_VENC,'+ coCRLF +
{/ROIM}
               ' (TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')-FECHA_INT.F_INICIO) AS dias_prov,'+ coCRLF +
               ' CR_CAT_MINIMO.CVE_CAT_MINIMO AS CVE_CAT_MIN,'+ coCRLF +
               ' CR_CAT_MINIMO.DESC_CAT_MINIMO AS DESC_CAT_MIN,'+ coCRLF +
               ' CONTRATO.CVE_MONEDA,'+ coCRLF +
               ' '' '' AS CVE_SUB_CARTERA,'+ coCRLF +
               ' ((TO_DATE(''' + FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')-FECHA_INT.F_INICIO) +1) DIAS_FINAL,'+ coCRLF +
               ' NVL(CDH.IMP_INTERES,0) AS INT_ACUM_OPC1,'+ coCRLF +
               ' CR_CREDITO.F_VENCIMIENTO FEC_VENC_CRED,'+ coCRLF +
               ' FECHA_INT.F_INICIO AS FEC_INICIO_INTERES,'+ coCRLF +
               ' MONEDA.DESC_MONEDA,'+ coCRLF +
               ' CRE_PARAMETRO.TC_CONT_USD,'+
               ' CRE_PARAMETRO.TC_CONT_UDI,'+  coCRLF +
               ' 0 AS CVE_SUB_TIP_BCO,'+
               ' '' '' AS DESC_SUB_TIPO,'+ coCRLF +
               ' CR_PRODUCTO.DESC_C_PRODUCTO AS DESC_SUB_TIPO1,'+
               ' CR_CREDITO.ID_CREDITO,'+ coCRLF +
               ' CR_CESION.ID_CESION,'+
               ' CR_CREDITO.CVE_CALCULO,'+ coCRLF +
               ' CR_CREDITO.CVE_TASA_REFER || CR_CREDITO.OPERADOR_STASA  AS CVE_TASA_REFER,'+ coCRLF +
               ' 0 DIAS_PLAZO,'+
               ' CR_CREDITO.F_INICIO	AS F_VALOR_CRED,'+ coCRLF +
               ' CR_HISTO_CRED.IMP_CREDITO,'+
               ' CR_CREDITO.SOBRETASA,'+ coCRLF +
               ' '' '' AS TIPO_DISPOSICION,'+
               ' '' '' AS B_PROG_FOPYME,'+ coCRLF +
               ' DECODE(CR_CESION.B_OPERADO_NAFIN,''V'',''N'','' '') AS B_OPERADO_NAFIN,'+ coCRLF +
               ' NVL(TABCTA.CUENTA_VIGENTE_K,TABCTAICRE.CVE_CTA_CONT_CAREVI) AS CTA_CONTABLE,'+
               ' NVL(TABCTA.CUENTA_VIGENTE_INT,TABCTAICRE.CVE_CTA_CONT_INREVI) AS CTA_INTERES,'+ coCRLF +
               ' TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'') AS F_PROVISION,'+ coCRLF +
               ' 0 AS IMP_INTERES_AYER,'+ coCRLF +
               ' DECODE(CR_CESION.CVE_TIPO_INTERES,''IN'',0,CR_HISTO_CRED.IMP_INTERES_DIA) IMP_INTERES_DIA,'+ coCRLF +
               ' NVL(CDH.IMP_INTERES,0) AS IMP_INTERES_PER,'+ coCRLF +
               ' FECHA_INT.IMP_IVA AS IVA_ACUM,'+ coCRLF + // HERJA 
               ' CR_HISTO_CRED.SDO_VIG_TOTAL AS SDO_INSOLUTO,'+ coCRLF +
               ' CR_HISTO_CRED.TASA_APLICADA,'+ coCRLF +
//               '			 0 TIPO_CUENTA,'+
               ' CR_PRODUCTO.CVE_TIPO_CRED_BC TIPO_CUENTA, CR_TIP_CRED_BC.DESC_TIPO_CRED,'+  coCRLF +//EASA4011         28022005
               ' FECHA_INT.F_VENCIMIENTO,'+
               ' (FECHA_INT.F_VENCIMIENTO - FECHA_INT.F_INICIO)PLAZO,'+ coCRLF +
               ' P.ID_PERSONA,'+
               ' CR_CREDITO.ID_PROM_ADM,'+ coCRLF +
               ' PERSONA.NOMBRE PROMADM,'+
               ' CONTRATO.ID_PERS_ASOCIAD,'+ coCRLF +
               ' PASOC.NOMBRE P_ASOC,'+
               ' CR_PRODUCTO.CVE_PRODUCTO_CRE,'+ coCRLF +
               ' CR_PRODUCTO.DESC_C_PRODUCTO, '+
               ' CR_PRODUCTO.ID_EMPRESA '+ coCRLF +

 //-------------------------------------------------------
           '                ,(SELECT  (CASE  WHEN COUNT(ID_ACREDITADO) = 0 THEN ''  '' ' + coCRLF +
           '                     WHEN COUNT(ID_ACREDITADO) > 0 THEN ''Si'' ' + coCRLF +
           '                     ELSE ''CE'' ' + coCRLF +
           '                     END) AS Status_1  ' + coCRLF +
           '                FROM CR_ACRE_RE WHERE '+ coCRLF +
           '                TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'')'+' >= F_ALTA_RECU ' + coCRLF +
//           '                AND ('+'TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'')'+' <= F_BAJA_RECU OR F_BAJA_RECU IS NULL) ' + coCRLF +
           '                AND F_BAJA_RECU IS NULL ' + coCRLF +
           '                AND ID_ACREDITADO = CONTRATO.ID_TITULAR) AS StatusRecu ' + coCRLF +

//-------------------------------------------------------
               ' FROM CR_CREDITO,'+  coCRLF +
               '      CR_HISTO_CRED, ('+ coCRLF +
               '      SELECT ID_CREDITO, SUM(IMP_INTERES) AS IMP_INTERES'+ coCRLF +
               '        FROM CR_DET_HIST_CR'+ coCRLF +
               '       WHERE 1 = 1 '+ coCRLF ;
     If (Trim(sFInicio)<>'') Then
       sSQL:= sSQL + ' AND F_CIERRE >= TO_DATE('''+
                FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')'+  coCRLF;

     If (Trim(sFFin)<>'') Then
       sSQL:= sSQL + '                        AND F_CIERRE <= TO_DATE('''+
                FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')'+  coCRLF;

       sSQL:= sSQL +
               ' GROUP BY ID_CREDITO ) CDH, '+  coCRLF +
               ' PERSONA,'+  coCRLF +
               ' (SELECT CCTO.*, CPRO.ID_EMPRESA FROM   CR_PRODUCTO CPRO, CR_CONTRATO CCTO WHERE  CPRO.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE) CR_CONTRATO,'+  coCRLF +
               ' CR_PRODUCTO, CONTRATO, MONEDA,'+ coCRLF +
               ' CR_TIP_CRED_BC, ' + //EASA4011         28022005
               '  PERSONA P, PERSONA_FISICA PF, PERSONA_MORAL PM, PERSONA PASOC, CR_CAT_MINIMO,'+ coCRLF +
               '(SELECT ID_CREDITO, MIN(F_INICIO)F_INICIO, MAX(F_VENCIMIENTO)F_VENCIMIENTO'+ coCRLF +
               '        ,MAX(IMP_IVA) IMP_IVA'+ coCRLF + //CAMPO IMP_IVA HERJA
               '   FROM '+ coCRLF +
               '  (SELECT ID_CREDITO, NUM_PERIODO,'+ coCRLF +
               '          (F_VENCIMIENTO-PLAZO) F_INICIO, F_VENCIMIENTO'+ coCRLF +
               '           ,IMP_IVA'+ coCRLF + //CAMPO IMP_IVA HERJA
               '     FROM CR_INTERES'+ coCRLF +
               '    WHERE (F_VENCIMIENTO-PLAZO) <= TO_DATE('''+
                FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')'+ coCRLF +
               '      AND F_VENCIMIENTO >= TO_DATE('''+
                FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')) TABLA'+ coCRLF +
               '    GROUP BY TABLA.ID_CREDITO '+ coCRLF +
               '  )FECHA_INT, CR_CESION, CRE_PARAMETRO, '+ coCRLF +
               //Para sacar cuentas
               '( '+
               'SELECT CP.CVE_PRODUCTO_CRE, CUENTA_VIGENTE_INT,'+ coCRLF +
               '       NVL(CtaAgrK.CUENTA_VIGENTE,CtaDDK.CUENTA_VIGENTE ) CUENTA_VIGENTE_K'+ coCRLF +
               '  FROM cr_producto CP,'+ coCRLF +
               '      (SELECT ''IN'' AS CVE_CONCEPTO,'+
               '              CP.CVE_PRODUCTO_CRE,'+ coCRLF +
               '              SUBSTR(GC.CUENTA_CONTABLE,1,4) || ''-'' ||'+
               '              SUBSTR(GC.CUENTA_CONTABLE,5,4) || ''-'' ||'+
               '              SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE_INT'+ coCRLF +
               '         FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC'+ coCRLF + //GUIA_CONTABLE@SICA GC CAMBIO POR BAJA DE BASE SICA JFOF 02/08/2012
               '        WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE'+ coCRLF +
// ROIM 20/04/2006 SE AGREGA LA CLAVE DE PRODUCTO PARA QUE NO INCLUYA DES DOC
            '          AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%FAC'''+coCRLF +
            '          AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%AGR'''+coCRLF +
// /ROIM
               '          AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO'+ coCRLF +
               '          AND GC.EMPRESA = ''BCO2'''+ coCRLF +
               '          AND GC.CODIGO_TRANSACCION IN (306000, 306710) '+ coCRLF +
               '          AND GC.CAMPO_IMPORTE IN (''03'',''06'') '+ coCRLF +
               '          AND GC.CLAVE_MONEDA = ''PESOS'''+ coCRLF +
               '          AND (GC.CUENTA_CONTABLE LIKE ''13%'''+
               '           OR GC.CUENTA_CONTABLE LIKE ''26%'')) CtaInt,'+ coCRLF +
               '      (SELECT ''KA'' AS CVE_CONCEPTO,'+
               '              CP.CVE_PRODUCTO_CRE,'+ coCRLF +
               '              SUBSTR(GC.CUENTA_CONTABLE,1,4) || ''-'' ||'+
               '              SUBSTR(GC.CUENTA_CONTABLE,5,4) || ''-'' ||'+
               '              SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE'+ coCRLF +
               '         FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC'+ coCRLF + //GUIA_CONTABLE@SICA GC CAMBIO POR BAJA DE BASE SICA JFOF 02/08/2012992 Z_CRED_PASIVA GC
               '        WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE'+ coCRLF +
               '          AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%FAC'''+ coCRLF +
               '          AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%AGR'''+coCRLF +
               '          AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO'+ coCRLF +
               '          AND GC.EMPRESA = ''BCO2'''+ coCRLF +
               '          AND GC.CODIGO_TRANSACCION IN (300000) '+ coCRLF +
               '          AND GC.CLAVE_MONEDA = ''PESOS'''+ coCRLF +
               '          AND GC.CAMPO_IMPORTE = ''02'' '+ coCRLF +
               '          AND (GC.CUENTA_CONTABLE LIKE ''13%'')) CtaAgrK,'+ coCRLF +
               '      (SELECT ''KA'' AS CVE_CONCEPTO,'+ coCRLF +
               '              CCP.CVE_PRODUCTO_CR,'+     coCRLF +
               '              CTA_CONTABLE || ''-'' ||'+
               '              SUBSTR(SUB_CTA_CONTABLE,1,4) || ''-'' ||'+
               '              SUBSTR(SUB_CTA_CONTABLE,5,2) AS CUENTA_VIGENTE'+ coCRLF +
               '         FROM CR_CONT_PRODUCTO  CCP'+ coCRLF +
// ROIM 20/04/2006 SE CAMBIA LA CLAVE DE PRODUCTO PARA QUE NO INCLUYA DES DOC
//               '        WHERE CVE_PRODUCTO_CR LIKE ''%FAC'') CtaDDK'+ coCRLF +
               '        WHERE CVE_PRODUCTO_CR LIKE ''%XXX'') CtaDDK'+ coCRLF +
// /ROIM
               ' WHERE CtaInt.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE'+ coCRLF +
               '   AND CtaAgrK.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE'+ coCRLF +
               '   AND CtaDDK.CVE_PRODUCTO_CR (+)= cp.CVE_PRODUCTO_CRE'+ coCRLF +
               ')TABCTA, '+ coCRLF + coCRLF +

               C_QUERY_CTAS_ICRE +

               '(SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE = ''TIPCAR'')TIPCAR '+ coCRLF + //SASB 09/09/2005
               /////
//-----------------------------------





               'WHERE CR_CREDITO.SIT_CREDITO <> ''CA'''+ coCRLF +
               '  AND CR_CREDITO.ID_CREDITO = CR_HISTO_CRED.ID_CREDITO'+coCRLF;

     If (Trim(sFInicio)<>'') Then
       sSQL:= sSQL + ' AND CR_HISTO_CRED.F_CIERRE >= TO_DATE('''+
                FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')'+ coCRLF;

     If (Trim(sFInicio)<>'') Then
       sSQL:= sSQL + ' AND CR_HISTO_CRED.F_CIERRE <= TO_DATE('''+
                FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')'+  coCRLF;

       sSQL:= sSQL +
               ' AND CR_CREDITO.ID_CREDITO = CDH.ID_CREDITO (+) '+  coCRLF +
               ' AND CR_CREDITO.ID_PROM_ADM = PERSONA.ID_PERSONA '+ coCRLF +
               ' AND CR_CREDITO.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+ coCRLF +
               ' AND CR_CREDITO.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+ coCRLF +
               ' AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE '+ coCRLF +
               ' AND CR_PRODUCTO.SIT_PRODUCTO <> ''CA'' '+ coCRLF +
               ' AND CR_TIP_CRED_BC.CVE_TIPO_CRED_BC = CR_PRODUCTO.CVE_TIPO_CRED_BC '+  coCRLF +              //EASA4011         28022005
               ' AND CR_CONTRATO.ID_CONTRATO = CONTRATO.ID_CONTRATO '+ coCRLF +
               ' AND CONTRATO.CVE_MONEDA = MONEDA.CVE_MONEDA '+ coCRLF +
               ' AND CONTRATO.ID_TITULAR = P.ID_PERSONA '+ coCRLF +
               ' AND CONTRATO.ID_TITULAR = PF.ID_PERSONA (+) '+ coCRLF +
               ' AND CONTRATO.ID_TITULAR = PM.ID_PERSONA (+) '+ coCRLF +
               ' AND CONTRATO.ID_PERS_ASOCIAD = PASOC.ID_PERSONA (+) '+ coCRLF +
               ' AND CR_PRODUCTO.CVE_CLAS_CONTAB = CR_CAT_MINIMO.CVE_CAT_MINIMO(+)'+ coCRLF +
               ' AND CR_CREDITO.ID_CREDITO = FECHA_INT.ID_CREDITO '+ coCRLF +
               ' AND CR_CREDITO.ID_CREDITO = CR_CESION.ID_CESION(+)'+ coCRLF +
               ' AND CONTRATO.CVE_TIP_CONTRATO = CRE_PARAMETRO.CVE_TIP_CONTRATO'+ coCRLF +
               ' AND CR_CONTRATO.CVE_PRODUCTO_CRE = TABCTA.CVE_PRODUCTO_CRE(+)'+ coCRLF +

               ' AND TABCTAICRE.ID_EMPRESA (+)= CR_CONTRATO.ID_EMPRESA'+ coCRLF +
               ' AND TABCTAICRE.CVE_PRODUCTO_CRE (+)= CR_CONTRATO.CVE_PRODUCTO_CRE'+ coCRLF +
               ' AND TABCTAICRE.CVE_MONEDA (+)= CR_CONTRATO.CVE_MONEDA'+ coCRLF +

               ' AND CR_PRODUCTO.CVE_TIPO_CARTERA = TIPCAR.CVE_REFERENCIA'+ coCRLF + //SASB 09/09/2005
               ' AND (CR_CREDITO.F_AUTORIZA + CR_CREDITO.DIAS_PLAZO) > TO_DATE('''+
                FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')'+ coCRLF;

         If (Trim(sAcreditado)<>'') Then
            sSQL:= sSQL + ' AND CONTRATO.ID_TITULAR = '+ sAcreditado + coCRLF;
         If (Trim(sGpoProducto)<>'') Then
            sSQL:= sSQL + ' AND  CR_PRODUCTO.CVE_PRODUCTO_GPO ='''+sGpoProducto+''''+ coCRLF;
         If (Trim(sProducto)<>'') Then
            sSQL:= sSQL + ' AND  CR_CONTRATO.CVE_PRODUCTO_CRE ='''+sProducto+''''+ coCRLF;
         If (Trim(sPromAdmin)<>'') Then
            sSQL:= sSQL + ' AND  CR_CREDITO.ID_PROM_ADM ='+sPromAdmin+ coCRLF;
         If (Trim(sPromAsoc)<>'') Then
            sSQL:= sSQL + ' AND  CONTRATO.ID_PERS_ASOCIAD ='+sPromAsoc+ coCRLF;
         If (Trim(sTraspaso)='T') Then
{ROIM 29/11/2005 SE CAMBIA LA FECHA DE VENCIMIENTO DEL CREDITO AL HISTO}
            //sSQL:= sSQL + ' AND  CR_CREDITO.F_TRASPASO_VENC IS NOT NULL'+ coCRLF;
            sSQL:= sSQL + ' AND  CR_HISTO_CRED.F_TRASPASO_VENC IS NOT NULL'+ coCRLF;
{/ROIM}
         If (Trim(sTraspaso)='NT') Then
{ROIM 29/11/2005 SE CAMBIA LA FECHA DE VENCIMIENTO DEL CREDITO AL HISTO}
            //sSQL:= sSQL + ' AND  CR_CREDITO.F_TRASPASO_VENC IS NULL'+ coCRLF;
            sSQL:= sSQL + ' AND  CR_HISTO_CRED.F_TRASPASO_VENC IS NULL'+ coCRLF;
{/ROIM}
         If (Trim(sEmpresa)<>'') Then
            sSQL:= sSQL + ' AND CR_PRODUCTO.ID_EMPRESA='+ Trim(sEmpresa)+ coCRLF;
         If sCartera <> '' Then
            sSQL:= sSQL + ' AND TIPCAR.CVE_REFERENCIA = DECODE('''+ sCartera +''', ''V'', ''BANCAR'',''F'',''NOBANC'')'+ coCRLF;

         sSQL:= sSQL + ' )'+ coCRLF;
   End;
   sSQL:= sSQL + ' )A  WHERE 1=1'+ coCRLF;

      If sCartera = 'V' Then
         sSQL:= sSQL + ' AND A.CARTERA =''CARTERA BANCARIA'''+ coCRLF
      Else If sCartera = 'F' Then
         sSQL:= sSQL + ' AND A.CARTERA =''CARTERA NO BANCARIA'''+ coCRLF;

      {SALDO INSOLUTO}
      sSQL:= sSQL + ' AND A.SDO_INSOLUTO > 0'+ coCRLF ;


      {SOLO NAFIN,  AGRO,  FOVI}

      if OperadoNafin or OperadoFOVI or OperadoFIRA then
      begin
           sSQL:= sSQL + ' AND (';
           if OperadoNafin then
              sSQL:= sSQL + 'A.B_OPERADO_NAFIN = ''N'' '+ coCRLF;
           //end if

           if OperadoFOVI then
           begin
                if OperadoNafin then
                   sSQL:= sSQL + ' OR ';
                //END IF
                sSQL:= sSQL +  'A.CVE_SUB_TIP_BCO = 57 '+ coCRLF ;
           end;

           if OperadoFIRA then
           begin
                if OperadoNafin or OperadoFOVI then
                   sSQL:= sSQL + ' OR ';
                //END IF
                sSQL:= sSQL +  'PENDIENTE DE DEFINIR'+ coCRLF ;
           end;
           sSQL:= sSQL + ')'+ coCRLF;
      end;

      //--------------------------------------------------------
           if (Trim(sTipRecu2)='0')     Then sSQL := sSQL + '   AND A.STATUSRECU = '+ SQLStr(sStatus) + coCRLF;
           if (Trim(sTipRecu2)='1')     Then sSQL := sSQL + '   AND NOT A.STATUSRECU = '+ SQLStr(sStatus) + coCRLF;
     //--------------------------------------------------------


      sSQL:= sSQL + ' ORDER BY ';

      If OrdenProm Then Begin
         sSQL:= sSQL + ' A.P_ASOC, ';
      End;

{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
      If OrdenPromAdm Then Begin
         sSQL:= sSQL + ' A.PROMADM, ';
      End;
{/roim}

      If OrdenCliente Then Begin
         sSQL:= sSQL + ' A.NOMBRE, ';
      End;

      If OrdenCatMin Then
       sSQL:= sSQL +
           ' A.CARTERA, A.DESC_MONEDA, A.DESC_CAT_MIN,A.NOMBRE, A.ID_CREDITO)B'+ coCRLF
      Else
       sSQL:= sSQL +
           ' A.CARTERA, A.DESC_MONEDA, A.DESC_SUB_TIPO1, A.CVE_PRODUCTO_CRE, A.NOMBRE, A.ID_CREDITO)B'+ coCRLF;

   slSQL:= TStringList.Create;
   slSQL.Clear;
   slSQL.Add(sSQL);
   slSQL.SaveToFile('c:\SQL.txt');
   slSQL.Free;

   Result:= sSQL;
end;

procedure TQrProvDiaria.GpoProductoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If qyConsultaPARTE.AsString ='A' Then Begin
      If (qyConsultaTIPO_DISPOSICION.AsString = 'RN') and (qyConsultaCVE_SUB_TIP_BCO.AsFloat <> 47) Then
         lbCtaCap.Caption := '1324-' + copy(qyConsultaTIPO_CUENTA.AsString,4,2) + '01-00'
      Else
         lbCtaCap.Caption := qyConsultaTIPO_CUENTA.AsString + '-' + copy(qyConsultaCTA_CONTABLE.AsString,1,4) + '-' + copy(qyConsultaCTA_CONTABLE.AsString,5,2);

      If (qyConsultaTIPO_DISPOSICION.AsString = 'RN') and (qyConsultaCVE_SUB_TIP_BCO.AsFloat <> 47) Then
         lbCtaInt.Caption := '1319-2000-00'
      Else
         If (qyConsultaCVE_CALCULO.AsString = 'AN') Then
            lbCtaInt.Caption := '2601-' + copy(qyConsultaCTA_INTERES.AsString,5,2) + '-0000'
         Else
            lbCtaInt.Caption := copy(qyConsultaCTA_INTERES.AsString,1,4) + '-' + copy(qyConsultaCTA_INTERES.AsString,5,4) + '-' + copy(qyConsultaCTA_INTERES.AsString,9,2);
   End Else Begin
      lbCtaInt.Caption :=qyConsultaCTA_INTERES.AsString;
      lbCtaCap.Caption :=qyConsultaCTA_CONTABLE.AsString;
   End;
end;

procedure TQrProvDiaria.qrDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If Trim(sArchivo)<>'' Then Begin
      Writeln(F, //Grupos
                 qyConsulta.FieldByName('ID_PERS_ASOCIAD').AsString + #09 +
                 qyConsulta.FieldByName('P_ASOC').AsString+ #09 +
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
                 qyConsulta.FieldByName('ID_PROM_ADM').AsString + #09 +
                 qyConsulta.FieldByName('PROMADM').AsString+ #09 +
{/roim}
                 qyConsulta.FieldByName('ID_PERSONA').AsString + #09 +
                 qyConsulta.FieldByName('NOMBRE').AsString+ #09 +
                 qyConsulta.FieldByName('CARTERA').AsString+ #09 +
                 qyConsulta.FieldByName('CVE_MONEDA').AsString + #09 +
                 qyConsulta.FieldByName('DESC_MONEDA').AsString+ #09 +
                 qyConsulta.FieldByName('CVE_CAT_MIN').AsString + #09 +
                 qyConsulta.FieldByName('DESC_SUB_TIPO1').AsString  +    #09 +
                 qyConsulta.FieldByName('DESC_TIPO_CRED').AsString + #09 +
                 lbCtaCap.Caption + #09 +
                 lbCtaInt.Caption + #09 +
                 //Registros
                 qyConsulta.FieldByName('VENCIDA').AsString + #09 +
                //*******JRG LatBC se agrega estado
                qyConsulta.FieldByName('STATUSRECU').AsString + #09 +
                 //¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨
                 qyConsulta.FieldByName('ID_CREDITO').AsString + #09 +
                 qyConsulta.FieldByName('ID_PERSONA').AsString + #09 +
                 qyConsulta.FieldByName('NOMBRE').AsString + #09 +
                 FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('F_VALOR_CRED').AsDateTime) + #09 +
                 FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('FEC_VENC_CRED').AsDateTime) + #09 +
                 FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('FEC_INICIO_INTERES').AsDateTime) + #09 +
                 FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('F_VENCIMIENTO').AsDateTime)+ #09 +
                 qyConsulta.FieldByName('CVE_TASA_REFER').AsString + #09 +
                 FormatFloat('###,##0.0000',qyConsulta.FieldByName('TASA_APLICADA').AsFloat) + #09 +
                 FormatFloat('###,##0.0000',qyConsulta.FieldByName('SOBRETASA').AsFloat) + #09 +
                 qyConsulta.FieldByName('CVE_CALCULO').AsString + #09 +
                 FormatFloat('###,###,###,###,##0.00',qyConsulta.FieldByName('IMP_CREDITO').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,##0.00',qyConsulta.FieldByName('SDO_INSOLUTO').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,##0.00',qyConsulta.FieldByName('INT_DIA').AsFloat) + #09 +
                 qyConsulta.FieldByName('DIAS_FINAL').AsString + #09 +
                 FormatFloat('###,###,###,###,##0.00',qyConsulta.FieldByName('INT_ACUM').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,##0.00',qyConsulta.FieldByName('IVA_ACUMULADO').AsFloat) + #09 +
                // < EASA4011      25/05/2006
                 qyConsulta.FieldByName('B_OPERADO_NAFIN').AsString

                //EASA4011 > /
              );
   End;
end;

procedure TQrProvDiaria.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If Trim(sArchivo)<>'' Then Begin
      Writeln(F, #09#09#09#09#09#09#09#09#09#09#09#09+'TOTAL GENERAL'+#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                 FormatFloat('###,###,###,###,##0.00',QRExpr20.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr21.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr22.Value.dblResult) + #09#09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr23.Value.dblResult));
   End;
   If Trim(sArchivo)<>'' Then Begin
      sArchivo:= '';
      bGenArch:= True;
      CloseFile(F);
   End;
end;

procedure TQrProvDiaria.FootProductoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If Trim(sArchivo)<>'' Then Begin
      Writeln(F, #09#09#09#09#09#09#09#09#09#09#09#09+'Por Tipo de Producto'+#09#09+
                 IntToStr(QRExpr13.Value.intResult)+#09#09#09#09#09#09#09#09#09#09#09#09#09+
                 FormatFloat('###,###,###,###,##0.00',QRExpr1.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr2.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr3.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr4.Value.dblResult) + #09+#09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr24.Value.dblResult));     //SUMATORIA DE IVA

   End;
end;

procedure TQrProvDiaria.FootDivisaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  tipo : Extended;
begin
   If qyConsulta.FieldByName('CVE_MONEDA').AsInteger = C_DLLS Then
       lbTipoCambio.Caption := FormatFloat('###,##0.0000',qyConsultaTC_CONT_USD.AsFloat)
   Else If qyConsulta.FieldByName('CVE_MONEDA').AsInteger = 800 Then
       lbTipoCambio.Caption := FormatFloat('###,##0.0000',qyConsultaTC_CONT_UDI.AsFloat)
   Else
       lbTipoCambio.Caption := '1.000000';

    If Trim(sArchivo)<>'' Then Begin
      Writeln(F, #09#09#09#09#09#09#09#09#09#09#09#09+'Por Moneda'+#09#09+
                 IntToStr(QRExpr14.Value.intResult)+#09#09#09#09#09#09#09#09#09#09#09#09#09+
                 FormatFloat('###,###,###,###,##0.00',QRExpr5.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr6.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr7.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr8.Value.dblResult) + #09#09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr25.Value.dblResult));
      Writeln(F, #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                 lbTipoCambio.Caption +#09#09#09#09#09#09#09#09#09#09#09+
                 FormatFloat('###,###,###,###,##0.00',QRExpr9.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr10.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr11.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr12.Value.dblResult) + #09#09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr26.Value.dblResult));
   End;
end;

procedure TQrProvDiaria.FootTipoCarBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If Trim(sArchivo)<>'' Then Begin
      Writeln(F, #09#09#09#09#09#09#09#09#09#09#09#09+'Por Tipo de Cartera'+#09#09+
                 IntToStr(QRExpr15.Value.intResult)+#09#09#09#09#09#09#09#09#09#09#09#09#09+
                 FormatFloat('###,###,###,###,##0.00',QRExpr16.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr17.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr18.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr19.Value.dblResult)  + #09#09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr27.Value.dblResult));
   End;
end;

End.

