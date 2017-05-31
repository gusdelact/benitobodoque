unit IntMQrFndProv;
// Comentarios     : Correccion al Error
interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre, UnSQL2, Dialogs, QRExport;
type
  TQrFndProv = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyConsulta: TQuery;
    qrDetalle: TQRBand;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
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
    GpoPromAdm: TQRGroup;
    GpoCliente: TQRGroup;
    GpoTipoCar: TQRGroup;
    QRDBText15: TQRDBText;
    GpoDivisa: TQRGroup;
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
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
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
    QRLabel2: TQRLabel;
    lbTipoCambio: TQRLabel;
    QRDBText4: TQRDBText;
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
    GpoProducto: TQRGroup;
    QRLabel8: TQRLabel;
    QRDBDescProducto: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText19: TQRDBText;
    QRGroupEntidad: TQRGroup;
    QRGroupPrograma: TQRGroup;
    QRFooterEntidad: TQRBand;
    QRFooterPrograma: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRLabel18: TQRLabel;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRExpr32: TQRExpr;
    QRExpr33: TQRExpr;
    QRLabel26: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText34: TQRDBText;
    QRSHPTitular: TQRShape;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    qyConsultaCARTERA: TStringField;
    qyConsultaCVE_PER_JURIDICA: TStringField;
    qyConsultaNOMBRE: TStringField;
    qyConsultaDIAS_PROV: TFloatField;
    qyConsultaCVE_CAT_MIN: TStringField;
    qyConsultaDESC_CAT_MIN: TStringField;
    qyConsultaCVE_MONEDA: TFloatField;
    qyConsultaDIAS_FINAL: TFloatField;
    qyConsultaINT_ACUM_OPC1: TFloatField;
    qyConsultaFEC_VENC_CRED: TDateTimeField;
    qyConsultaFEC_INICIO_INTERES: TDateTimeField;
    qyConsultaDESC_MONEDA: TStringField;
    qyConsultaTC_CONT_USD: TFloatField;
    qyConsultaTC_CONT_UDI: TFloatField;
    qyConsultaID_CREDITO: TFloatField;
    qyConsultaCVE_CALCULO: TStringField;
    qyConsultaCVE_TIPO_TASA: TStringField;
    qyConsultaCVE_TASA_REFER: TStringField;
    qyConsultaF_VALOR_CRED: TDateTimeField;
    qyConsultaIMP_CREDITO: TFloatField;
    qyConsultaSOBRETASA: TFloatField;
    qyConsultaF_PROVISION: TDateTimeField;
    qyConsultaIMP_INTERES_DIA: TFloatField;
    qyConsultaIMP_INTERES_PER: TFloatField;
    qyConsultaSDO_INSOLUTO: TFloatField;
    qyConsultaTASA_APLICADA: TFloatField;
    qyConsultaF_VENCIMIENTO: TDateTimeField;
    qyConsultaPLAZO: TFloatField;
    qyConsultaID_PERSONA: TFloatField;
    qyConsultaID_PROM_ADM: TFloatField;
    qyConsultaPROMADM: TStringField;
    qyConsultaID_PERS_ASOCIAD: TFloatField;
    qyConsultaP_ASOC: TStringField;
    qyConsultaCVE_PRODUCTO_CRE: TStringField;
    qyConsultaDESC_C_PRODUCTO: TStringField;
    qyConsultaDESC_ENT_DES: TStringField;
    qyConsultaDESC_PROGRAMA: TStringField;
    qyConsultaCVE_FND_ENT_DES: TStringField;
    qyConsultaCVE_FND_PROGRAMA: TStringField;
    qyConsultaID_EMPRESA: TFloatField;
    qyConsultaCUENTA_VIGENTE_K: TStringField;
    qyConsultaCUENTA_VIGENTE_INT: TStringField;
    qyConsultaINT_ACUM: TFloatField;
    qyConsultaINT_DIA: TFloatField;
    qyConsultaINT_ACUM_ETQ: TFloatField;
    qyConsultaTOT_IMPCRED_DIV: TFloatField;
    qyConsultaTOT_SDOIN_DIV: TFloatField;
    qyConsultaTOT_INTDIA_DIV: TFloatField;
    qyConsultaTOT_INTACUM_DIV: TFloatField;
    qyConsultaTOT_INTACUMETQ_DIV: TFloatField;
    QRDBText16: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    qrgPromAdmin: TQRGroup;
    qrgfPromAdmin: TQRBand;
    QRDBText20: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRExpr34: TQRExpr;
    QRDBText31: TQRDBText;
    QRExpr36: TQRExpr;
    QRExpr38: TQRExpr;
    QRExpr40: TQRExpr;
    QRExpr42: TQRExpr;
    QRShape4: TQRShape;
    procedure qrDetalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure FootProductoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure FootDivisaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure FootTipoCarBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrgfPromAdminBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
      sSubTipoRep : String;
  public
//     {
     vgFechaMesAnt  : TDate;
     vgTCambioMesAnt: Double;
     vgTCambioUDIS  : Double;
//     }
     Apli : TInterApli;
     Function GeneraSQL(sFInicio, sFFin, sGpoProducto,
                              sProducto, sPromAdmin, sPromAsoc,
                              sCartera, sTraspaso, sAcreditado,
                              sEmpresa, sSucursal,sOrigen,
                              sEntidad, sPrograma: String;
                              OrdenProm, OrdenCliente, Resumen,
                              OrdenCatMin, OrdPromAdm : Boolean;
                                    vlTCUDIS, vlTCDLLS: String) : String;
  end;


var
  QrFndProv: TQrFndProv;
  bGenArch: Boolean;
  sArchivo:String;
  F: TextFile;

Procedure ReporteFndProvisionDiaria(  sF_Inicio, sF_Fin, sGpoProducto,
                                      sProducto, sPromAdmin, sPromAsoc,
                                      sCartera, sTraspaso, sNbrArch,sSubTipo,
                                      sAcreditado, sEmpresa, sSucursal,
                                      sOrigen, sEntidad, sPrograma:String;
                                      OrdenProm, OrdenCliente, Resumen,
                                      OrdenCatMin, OrdPromAdm : Boolean;
                                      pAPli       : TInterApli;
                                      pPreview    : Boolean);
Implementation
{$R *.DFM}

Procedure ReporteFndProvisionDiaria(  sF_Inicio, sF_Fin, sGpoProducto,
                                           sProducto, sPromAdmin, sPromAsoc,
                                           sCartera, sTraspaso, sNbrArch, sSubTipo,
                                           sAcreditado, sEmpresa, sSucursal,
                                           sOrigen, sEntidad, sPrograma:String;
                                           OrdenProm, OrdenCliente, Resumen,
                                           OrdenCatMin, OrdPromAdm : Boolean;
                                           pAPli     : TInterApli;
                                           pPreview  : Boolean);
Var
   QrFndProv   : TQrFndProv;
   Preview     : TIntQRPreview;
Begin
   QrFndProv   := TQrFndProv.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrFndProv);
   QrFndProv.Apli := pAPli;
   Try
      bGenArch:= False;
      sArchivo:= sNbrArch;
      QrFndProv.sSubTipoRep:= sSubTipo;
      QrFndProv.QRInterEncabezado1.Apli:=pApli;
      QrFndProv.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      //QrFndProv.QRInterEncabezado1.NomReporte:='IntMQrFndProv';
      QrFndProv.QRInterEncabezado1.Titulo1:='Cartera Vigente y Provisiones Pasiva al día : '+ sF_Inicio;
      //{
      QrFndProv.vgFechaMesAnt := ObtFechaMesAnt( C_FMAN, pApli );
      QrFndProv.vgTCambioMesAnt := ObtTipoCambio( StrToDateTime(sF_Inicio),
                                                  IntToStr ( C_DLLS ) ,
                                                  pAPli.DataBaseName, pAPli.SessionName);
      QrFndProv.vgTCambioUDIS := ObtTipoCambio( pAPli.DameFechaEmpresaDia('D000'),
                                                IntToStr ( 800 ) ,
                                                pAPli.DataBaseName, pAPli.SessionName);
//      QrFndProv.DataSet := QrFndProv.qyConsulta;
      //                                          }

      QrFndProv.qyConsulta.DatabaseName := pApli.DataBaseName;
      QrFndProv.qyConsulta.SessionName := pApli.SessionName;

      QrFndProv.qyConsulta.Active:=False;
      QrFndProv.qyConsulta.SQL.Clear;
      QrFndProv.qyConsulta.SQL.Add(
      QrFndProv.GeneraSQL( sF_Inicio, sF_Fin, sGpoProducto,
                                    sProducto, sPromAdmin, sPromAsoc,
                                    sCartera, sTraspaso, sAcreditado,
                                    sEmpresa, sSucursal,sOrigen, sEntidad,
                                    sPrograma, OrdenProm, OrdenCliente,
                                    Resumen, OrdenCatMin, OrdPromAdm,
                                    FloatToStr(QrFndProv.vgTCambioUDIS), FloatToStr(QrFndProv.vgTCambioMesAnt) ));
      QrFndProv.qyConsulta.SQL.SaveToFile('C:\QRY_FND_PROV.CHK.SQL');   // LOLS 02 05 2005
      QrFndProv.qyConsulta.Active:=True;
      If OrdenCatMin Then Begin
         QrFndProv.GpoProducto.Expression := 'qyConsulta.CVE_CAT_MIN';
         QrFndProv.QRDBDescProducto.DataField:= 'DESC_CAT_MIN';
      End Else Begin
         QrFndProv.GpoProducto.Expression := 'qyConsulta.CVE_PRODUCTO_CRE';
         QrFndProv.QRDBDescProducto.DataField:= 'DESC_C_PRODUCTO';
      End;
      If not OrdenProm Then Begin
         QrFndProv.GpoPromAdm.Enabled := False;
         QrFndProv.GpoPromAdm.Expression := '';
      End;
      If not OrdPromAdm Then Begin
         QrFndProv.qrgPromAdmin.Enabled    := False;
         QrFndProv.qrgPromAdmin.Expression := '';
      End;
      If not OrdenCliente Then Begin
         QrFndProv.GpoCliente.Enabled := False;
         QrFndProv.GpoCliente.Expression := '';
      End;

      If Resumen Then Begin
         QrFndProv.qrDetalle.Enabled := False;
         QrFndProv.GpoCliente.Enabled := False;
         QrFndProv.GpoCliente.Expression := '';
         QrFndProv.GpoPromAdm.Enabled := False;
         QrFndProv.GpoPromAdm.Expression := '';
         //
         QrFndProv.qrgPromAdmin.Enabled    := False;
         QrFndProv.qrgPromAdmin.Expression := '';
      End;

      If (QrFndProv.qyConsulta.RecordCount > 0) Then Begin
         If Trim(sArchivo)<>'' Then Begin
            AssignFile(F, sArchivo);
            Rewrite(F);
            Writeln(F, QrFndProv.QRInterEncabezado1.Titulo1 + #09 );
            Writeln(F, QrFndProv.QRInterEncabezado1.Titulo2 + #09 );
            Writeln(F, #09 );
            Writeln(F,
                      // Grupo
                      'Promotor Asociado' + #09#09 +
                      'Cliente Especial' + #09#09 +
                      'Cartera'+ #09 +
                      'Moneda' + #09#09 +
                      'Producto' + #09 +
                      'Cta. Cap.' + #09 +
                      'Cta. Int' + #09 +
                      //Registros
                      //'Cartera Vencida' +  #09+
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
                      'Intereses Acumulados');
            Writeln(F,'');
         End;

         If pPreview Then
            QrFndProv.Preview
         Else
            QrFndProv.Print;
      End Else
        ShowMessage(CERROR_NOEXISTEN);
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrFndProv.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

{ TQrFndProv }
function TQrFndProv.GeneraSQL(sFInicio, sFFin, sGpoProducto,
                                    sProducto, sPromAdmin, sPromAsoc,
                                    sCartera, sTraspaso, sAcreditado,
                                    sEmpresa, sSucursal,sOrigen,
                                    sEntidad, sPrograma: String;
                                    OrdenProm,   OrdenCliente, Resumen,
                                    OrdenCatMin, OrdPromAdm : Boolean;
                                    vlTCUDIS, vlTCDLLS: String): String;
Var
   sSQL:String;
Begin

   sSQL:=
         'SELECT B.*,'+
{
         '       DECODE(CVE_MONEDA,800,TC_CONT_UDI*IMP_CREDITO,840,TC_CONT_USD*IMP_CREDITO,IMP_CREDITO)TOT_IMPCRED_DIV,'+ coCRLF +
         '       DECODE(CVE_MONEDA,800,TC_CONT_UDI*SDO_INSOLUTO,840,TC_CONT_USD*SDO_INSOLUTO,SDO_INSOLUTO)TOT_SDOIN_DIV,'+ coCRLF +
         '       DECODE(CVE_MONEDA,800,TC_CONT_UDI*INT_DIA,840,TC_CONT_USD*INT_DIA,INT_DIA)TOT_INTDIA_DIV,'+ coCRLF +
         '       DECODE(CVE_MONEDA,800,TC_CONT_UDI*INT_ACUM,840,TC_CONT_USD*INT_ACUM,INT_ACUM)TOT_INTACUM_DIV,'+ coCRLF +
         '       DECODE(CVE_MONEDA,800,TC_CONT_UDI*INT_ACUM_ETQ,840,TC_CONT_USD*INT_ACUM_ETQ,INT_ACUM_ETQ)TOT_INTACUMETQ_DIV'+ coCRLF +
}
         '       DECODE(CVE_MONEDA,800,' + vlTCUDIS + '*IMP_CREDITO,840,'+ vlTCDLLS+'*IMP_CREDITO,IMP_CREDITO)TOT_IMPCRED_DIV,'+ coCRLF +
         '       DECODE(CVE_MONEDA,800,' + vlTCUDIS + '*SDO_INSOLUTO,840,'+ vlTCDLLS+'*SDO_INSOLUTO,SDO_INSOLUTO)TOT_SDOIN_DIV,'+ coCRLF +
         '       DECODE(CVE_MONEDA,800,' + vlTCUDIS + '*INT_DIA,840,'+ vlTCDLLS+'*INT_DIA,INT_DIA)TOT_INTDIA_DIV,'+ coCRLF +
         '       DECODE(CVE_MONEDA,800,' + vlTCUDIS + '*INT_ACUM,840,'+ vlTCDLLS+'*INT_ACUM,INT_ACUM)TOT_INTACUM_DIV,'+ coCRLF +
         '       DECODE(CVE_MONEDA,800,' + vlTCUDIS + '*INT_ACUM_ETQ,840,'+ vlTCDLLS+'*INT_ACUM_ETQ,INT_ACUM_ETQ)TOT_INTACUMETQ_DIV'+ coCRLF +

         '  FROM ('+ coCRLF +
         'SELECT A.*, '+ coCRLF +
         '       INT_ACUM_OPC1   INT_ACUM,'+ coCRLF +
         '       IMP_INTERES_DIA INT_DIA,'+ coCRLF +
         '       INT_ACUM_OPC1   INT_ACUM_ETQ'+ coCRLF +
         '  FROM (';


   If (sSubTipoRep = 'CO')Or(sSubTipoRep = 'GL') Then Begin
      sSQL:= sSQL +
               'SELECT'+ coCRLF +
               '       ''CARTERA BANCARIA'' CARTERA, '+ coCRLF +
               '       P.CVE_PER_JURIDICA,'+ coCRLF +
               '       DECODE(P.CVE_PER_JURIDICA, ''PF'','+ coCRLF +
               '       PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO || '' '' || PF.NOMBRE_PERSONA,'+ coCRLF +
               '       PM.NOM_RAZON_SOCIAL ) AS NOMBRE,'+ coCRLF +
               '       (' + SQLFecha(StrToDate(sFInicio)) +  '-FECHA_INT.F_INICIO) dias_prov,'+ coCRLF +
               '       CR_CAT_MINIMO.CVE_CAT_MINIMO CVE_CAT_MIN,'+ coCRLF +
               '       CR_CAT_MINIMO.DESC_CAT_MINIMO DESC_CAT_MIN,'+ coCRLF +
               '       CONTRATO.CVE_MONEDA,'+ coCRLF +
               '       (('+SQLFecha(StrToDate(sFInicio)) +'-FECHA_INT.F_INICIO) +1) DIAS_FINAL,'+ coCRLF +
               '       NVL(CDH.IMP_INTERES,0) AS INT_ACUM_OPC1,'+ coCRLF +
               '       CR_FND_CREDITO.F_VENCIMIENTO FEC_VENC_CRED,'+ coCRLF +
               '       FECHA_INT.F_INICIO FEC_INICIO_INTERES,'+ coCRLF +
               '       MONEDA.DESC_MONEDA,'+ coCRLF +
               '       CRE_PARAMETRO.TC_CONT_USD,'+ coCRLF +
               '       CRE_PARAMETRO.TC_CONT_UDI,'+ coCRLF +
               '       CR_FND_CREDITO.ID_CREDITO,'+ coCRLF +
               '       CR_FND_CREDITO.CVE_CALCULO,'+ coCRLF +
               '       CR_FND_CREDITO.CVE_TIPO_TASA,'+ coCRLF +
               '       CR_FND_CREDITO.CVE_TASA_REFER || CR_FND_CREDITO.OPERADOR_STASA  CVE_TASA_REFER,'+ coCRLF +
               '       CR_FND_CREDITO.F_INICIO	F_VALOR_CRED,'+ coCRLF +
               '       CR_FND_HIST_CRED.IMP_CREDITO,'+ coCRLF +
               '       CR_FND_CREDITO.SOBRETASA,'+ coCRLF +
                         SQLFecha(StrToDate(sFInicio)) + ' F_PROVISION,'+ coCRLF +
               '       CR_FND_HIST_CRED.IMP_INTERES_DIA,'+ coCRLF +
               '       NVL(CDH.IMP_INTERES,0) AS IMP_INTERES_PER,'+ coCRLF +
               '       CR_FND_HIST_CRED.SDO_VIG_TOTAL SDO_INSOLUTO,'+ coCRLF +
               '       CR_FND_HIST_CRED.TASA_APLICADA,'+ coCRLF +
               '       FECHA_INT.F_VENCIMIENTO,'+ coCRLF +
               '       (FECHA_INT.F_VENCIMIENTO - FECHA_INT.F_INICIO)PLAZO,'+ coCRLF +
               '       P.ID_PERSONA,'+ coCRLF +
               '       CR_CREDITO.ID_PROM_ADM,'+ coCRLF +
               '       PERSONA.NOMBRE PROMADM,'+ coCRLF +
               '       CONTRATO.ID_PERS_ASOCIAD,'+ coCRLF +
               '       PASOC.NOMBRE P_ASOC,'+ coCRLF +
               '       CR_PRODUCTO.CVE_PRODUCTO_CRE,'+ coCRLF +
               '       CR_PRODUCTO.DESC_C_PRODUCTO, '+ coCRLF +
               '       CR_FND_ENT_DES.DESC_ENT_DES, '+ coCRLF +
               '       CR_FND_PROGRAMA.DESC_PROGRAMA, '+ coCRLF +
               '       CR_FND_PROGRAMA.CVE_FND_ENT_DES, '+ coCRLF +
               '       CR_FND_PROGRAMA.CVE_FND_PROGRAMA, '+ coCRLF +
               '       CR_PRODUCTO.ID_EMPRESA, '+ coCRLF +
               '       SUBSTR( PKGCRREDESCTO.FUNOBTCTAREDESC ( ''RK'',  CR_PRODUCTO.CVE_PRODUCTO_GPO, ' + coCRLF +
               '         CCPD.TIPO_CUENTAO, CONTRATO.CVE_MONEDA ), 1, 20 ) CUENTA_VIGENTE_K, ' + coCRLF +
               '       SUBSTR( PKGCRREDESCTO.FUNOBTCTAREDESC ( ''RI'',  CR_PRODUCTO.CVE_PRODUCTO_GPO, ' + coCRLF +
               '         CCPD.TIPO_CUENTAO, CONTRATO.CVE_MONEDA ), 1, 20 ) CUENTA_VIGENTE_INT ' + coCRLF +
               'FROM   CR_FND_ENT_DES,  CR_FND_PROGRAMA, '+ coCRLF +
               '       CR_FND_CREDITO, CR_CREDITO,'+ coCRLF +
               '       CR_FND_HIST_CRED,'+ coCRLF +
               '       ( SELECT ID_CREDITO, CVE_FND_ENT_DES, CVE_FND_PROGRAMA, SUM(IMP_ACCESORIO) AS IMP_INTERES'+ coCRLF +
               '         FROM CR_FND_DHIS_CRED '+ coCRLF +
               '         WHERE 1 = 1 ';
      If (Trim(sFInicio)<>'') Then
               sSQL:= sSQL + ' AND F_CIERRE = ' + SQLFecha(StrToDate(sFInicio));
      sSQL:= sSQL +
               '           AND CVE_ACCESORIO = ''RI'''+ coCRLF +
               '         GROUP BY ID_CREDITO, CVE_FND_ENT_DES, CVE_FND_PROGRAMA ) CDH, '+ coCRLF +
               '         PERSONA, CR_CONTRATO, CR_PRODUCTO, CONTRATO, MONEDA,'+ coCRLF +
               '         PERSONA P, PERSONA_FISICA PF, PERSONA_MORAL PM, PERSONA PASOC, CR_CAT_MINIMO,'+ coCRLF +
               '         (SELECT ID_CREDITO, MIN(F_INICIO)F_INICIO, MAX(F_VENCIMIENTO)F_VENCIMIENTO'+ coCRLF +
               '          FROM  (SELECT ID_CREDITO, NUM_PERIODO,'+ coCRLF +
               '                        (F_VENCIMIENTO-PLAZO) F_INICIO, F_VENCIMIENTO'+ coCRLF +
               '                 FROM   CR_FND_INTERES '+ coCRLF +
               '                 WHERE  (F_VENCIMIENTO-PLAZO) <= ' + SQLFecha(StrToDate(sFInicio))     + coCRLF +
               //'                   AND  F_VENCIMIENTO >= '  + SQLFecha(StrToDate(sFInicio)) + ') TABLA' + coCRLF +   // LOLS 02 05 2005
               '                   AND  F_VENCIMIENTO > '  + SQLFecha(StrToDate(sFInicio)) + ') TABLA' + coCRLF +
               '                 GROUP BY TABLA.ID_CREDITO ' + coCRLF +
               '                 )FECHA_INT, ' + coCRLF +
               '         CR_CESION, ' + coCRLF +
               '         CR_CONT_PRODUCTO CCPD, ' + coCRLF +
               '         CRE_PARAMETRO '+ coCRLF +
               'WHERE  CR_FND_CREDITO.ID_CREDITO = CR_CREDITO.ID_CREDITO '+ coCRLF +
//               '  AND  CR_FND_CREDITO.SIT_CREDITO <> ''CA'''+ coCRLF +
                //OBTIENE HISTORICO JFOF
               '  AND ('+ coCRLF +
               '         (CR_FND_CREDITO.SIT_CREDITO <> ''CA'')'+ coCRLF +
               '                  OR'+ coCRLF +
               '         (' + SQLFecha(StrToDate(sFInicio))+' < CR_FND_CREDITO.F_PROC_CANCPAS)'+ coCRLF +
               '           )'+ coCRLF +
                // JFOF
               '  AND  CR_FND_HIST_CRED.SDO_VIG_TOTAL > 0 '+ coCRLF +
               '  AND  CR_FND_CREDITO.ID_CREDITO = CR_FND_HIST_CRED.ID_CREDITO'+ coCRLF +
               '  AND  CR_FND_CREDITO.CVE_FND_ENT_DES = CR_FND_HIST_CRED.CVE_FND_ENT_DES '+ coCRLF +
               '  AND  CR_FND_CREDITO.CVE_FND_PROGRAMA = CR_FND_HIST_CRED.CVE_FND_PROGRAMA '+ coCRLF +
               '  AND  CR_FND_CREDITO.PCT_REDESCONTADO > 0 '+ coCRLF + //PORECENTAJE REDESCUENTO JFOF
               '  AND  CR_FND_PROGRAMA.CVE_FND_ENT_DES  = CR_FND_CREDITO.CVE_FND_ENT_DES '+ coCRLF +
               '  AND  CR_FND_PROGRAMA.CVE_FND_PROGRAMA = CR_FND_CREDITO.CVE_FND_PROGRAMA '+ coCRLF +
               '  AND  CR_FND_ENT_DES.CVE_FND_ENT_DES   = CR_FND_PROGRAMA.CVE_FND_ENT_DES '+ coCRLF;

     If (Trim(sFInicio)<>'') Then
       sSQL:= sSQL + ' AND CR_FND_HIST_CRED.F_CIERRE = ' + SQLFecha(StrToDate(sFInicio));


       sSQL:= sSQL +
               ' AND CR_FND_CREDITO.ID_CREDITO = CDH.ID_CREDITO (+) '+ coCRLF +
               ' AND CR_FND_CREDITO.CVE_FND_ENT_DES = CDH.CVE_FND_ENT_DES (+) '+ coCRLF +
               ' AND CR_FND_CREDITO.CVE_FND_PROGRAMA = CDH.CVE_FND_PROGRAMA(+) '+ coCRLF +
               ' AND CR_CREDITO.ID_PROM_ADM = PERSONA.ID_PERSONA '+ coCRLF +
               ' AND CR_CREDITO.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+ coCRLF +
               ' AND CR_CREDITO.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+ coCRLF +
               ' AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE '+ coCRLF +
               ' AND CR_PRODUCTO.SIT_PRODUCTO <> ''CA'' '+ coCRLF +
               ' AND CR_CONTRATO.ID_CONTRATO = CONTRATO.ID_CONTRATO '+ coCRLF +
               ' AND CONTRATO.CVE_MONEDA = MONEDA.CVE_MONEDA '+ coCRLF +
               ' AND CONTRATO.ID_TITULAR = P.ID_PERSONA '+ coCRLF +
               ' AND CONTRATO.ID_TITULAR = PF.ID_PERSONA (+) '+ coCRLF +
               ' AND CONTRATO.ID_TITULAR = PM.ID_PERSONA (+) '+ coCRLF +
               ' AND CONTRATO.ID_PERS_ASOCIAD = PASOC.ID_PERSONA (+) '+ coCRLF +
               ' AND CR_PRODUCTO.CVE_CLAS_CONTAB = CR_CAT_MINIMO.CVE_CAT_MINIMO(+)'+ coCRLF +
               ' AND CR_FND_CREDITO.ID_CREDITO = FECHA_INT.ID_CREDITO '+ coCRLF +
               ' AND CR_FND_CREDITO.ID_CREDITO = CR_CESION.ID_CESION(+)'+ coCRLF +
               ' AND CONTRATO.CVE_TIP_CONTRATO = CRE_PARAMETRO.CVE_TIP_CONTRATO'+ coCRLF +
               ' AND (CR_FND_CREDITO.F_INICIO + CR_FND_CREDITO.DIAS_PLAZO) > ' + SQLFecha(StrToDate(sFInicio)) + coCRLF +
               ' AND CCPD.CVE_PRODUCTO_CR(+) = CR_PRODUCTO.CVE_PRODUCTO_GPO '+ coCRLF;



         If (Trim(sAcreditado)<>'') Then
            sSQL:= sSQL + ' AND CONTRATO.ID_TITULAR = '+ sAcreditado ;
         If (Trim(sGpoProducto)<>'') Then
            sSQL:= sSQL + ' AND  CR_PRODUCTO.CVE_PRODUCTO_GPO ='''+sGpoProducto+'''';
         If (Trim(sProducto)<>'') Then
            sSQL:= sSQL + ' AND  CR_CONTRATO.CVE_PRODUCTO_CRE ='''+sProducto+'''';
         If (Trim(sPromAdmin)<>'') Then
            sSQL:= sSQL + ' AND  CR_CREDITO.ID_PROM_ADM ='+sPromAdmin;
         If (Trim(sPromAsoc)<>'') Then
            sSQL:= sSQL + ' AND  CONTRATO.ID_PERS_ASOCIAD ='+sPromAsoc;
         If (Trim(sTraspaso)='T') Then
            sSQL:= sSQL + ' AND  CR_CREDITO.F_TRASPASO_VENC IS NOT NULL';
         If (Trim(sTraspaso)='NT') Then
            sSQL:= sSQL + ' AND  CR_CREDITO.F_TRASPASO_VENC IS NULL';
         If (Trim(sEmpresa)<>'') Then
            sSQL:= sSQL + ' AND CR_PRODUCTO.ID_EMPRESA='+ Trim(sEmpresa);
         If (Trim(sOrigen)<>'') Then
            sSQL:= sSQL + ' AND CR_FND_CREDITO.CVE_ORIGEN_REC='+ Trim(sOrigen);
         If (Trim(sEntidad)<>'') Then
            sSQL:= sSQL + ' AND CR_FND_CREDITO.CVE_FND_ENT_DES='+ Trim(sEntidad);
         If (Trim(sPrograma)<>'') Then
            sSQL:= sSQL + ' AND CR_FND_CREDITO.CVE_FND_PROGRAMA='+ Trim(sPrograma);
   End;
   sSQL:= sSQL + coCRLF + ' )A  WHERE 1=1';

   If sCartera = 'V' Then
      sSQL:= sSQL + ' AND A.CARTERA =''CARTERA BANCARIA'''
   Else If sCartera = 'F' Then
      sSQL:= sSQL + ' AND A.CARTERA =''CARTERA NO BANCARIA''';

   sSQL:= sSQL + ' ORDER BY ';

   If OrdenProm Then Begin
      sSQL:= sSQL + ' A.P_ASOC, ';
   End;

   If OrdPromAdm Then Begin
      sSQL:= sSQL + ' A.PROMADM, ';
   End;


   If OrdenCliente Then Begin
      sSQL:= sSQL + ' A.NOMBRE, ';
   End;

   If OrdenCatMin Then
      sSQL:= sSQL +
        ' A.CARTERA, A.DESC_MONEDA, A.CVE_FND_ENT_DES, A.CVE_FND_PROGRAMA, A.DESC_CAT_MIN,A.NOMBRE, A.ID_CREDITO)B'
   Else
      sSQL:= sSQL +
         ' A.CARTERA, A.DESC_MONEDA, A.CVE_FND_ENT_DES, A.CVE_FND_PROGRAMA, A.CVE_PRODUCTO_CRE, A.NOMBRE, A.ID_CREDITO)B';
   Result:= sSQL;
end;


procedure TQrFndProv.qrDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If Trim(sArchivo)<>'' Then Begin
      Writeln(F, //Grupos
                 qyConsulta.FieldByName('ID_PERS_ASOCIAD').AsString + #09 +
                 qyConsulta.FieldByName('P_ASOC').AsString+ #09 +
                 qyConsulta.FieldByName('ID_PERSONA').AsString + #09 +
                 qyConsulta.FieldByName('NOMBRE').AsString+ #09 +
                 qyConsulta.FieldByName('CARTERA').AsString+ #09 +
                 qyConsulta.FieldByName('CVE_MONEDA').AsString + #09 +
                 qyConsulta.FieldByName('DESC_MONEDA').AsString+ #09 +
                 qyConsulta.FieldByName('DESC_CAT_MIN').AsString + #09 +
                 qyConsulta.FieldByName('CUENTA_VIGENTE_K').AsString + #09 +
                 qyConsulta.FieldByName('CUENTA_VIGENTE_INT').AsString + #09 +
                 //Registros
                 // qyConsulta.FieldByName('VENCIDA').AsString + #09 +
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
                 FormatFloat('###,###,###,###,##0.00',qyConsulta.FieldByName('INT_ACUM').AsFloat));
   End;
end;

procedure TQrFndProv.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If Trim(sArchivo)<>'' Then Begin
      Writeln(F, #09#09#09#09#09#09#09#09#09#09#09#09+'TOTAL GENERAL'+#09#09#09#09#09#09#09#09#09+//#09
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

procedure TQrFndProv.FootProductoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If Trim(sArchivo)<>'' Then Begin
      Writeln(F, #09#09#09#09#09#09#09#09#09#09#09#09+'Por Tipo de Producto'+#09#09+
                 IntToStr(QRExpr13.Value.intResult)+#09#09#09#09#09#09#09+ // #09
                 FormatFloat('###,###,###,###,##0.00',QRExpr1.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr2.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr3.Value.dblResult) + #09+#09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr4.Value.dblResult));
   End;
end;

procedure TQrFndProv.FootDivisaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If qyConsulta.FieldByName('CVE_MONEDA').AsInteger = C_DLLS Then
//       lbTipoCambio.Caption := FormatFloat('###,##0.0000',qyConsultaTC_CONT_USD.AsFloat)
       lbTipoCambio.Caption := FormatFloat('###,##0.0000',vgTCambioMesAnt)
   Else If qyConsulta.FieldByName('CVE_MONEDA').AsInteger = 800 Then
//       lbTipoCambio.Caption := FormatFloat('###,##0.0000',qyConsultaTC_CONT_UDI.AsFloat)
       lbTipoCambio.Caption := FormatFloat('###,##0.0000',vgTCambioUDIS)
   Else
       lbTipoCambio.Caption := '1.000000';

    If Trim(sArchivo)<>'' Then Begin
      Writeln(F, #09#09#09#09#09#09#09#09#09#09#09#09+'Por Moneda'+#09#09+
                 IntToStr(QRExpr14.Value.intResult)+#09#09#09#09#09#09#09+ // #09
                 FormatFloat('###,###,###,###,##0.00',QRExpr5.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr6.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr7.Value.dblResult) + #09#09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr8.Value.dblResult));
      Writeln(F, #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                 lbTipoCambio.Caption +#09#09#09#09#09+ // #09
                 FormatFloat('###,###,###,###,##0.00',QRExpr9.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr10.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr11.Value.dblResult) + #09#09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr12.Value.dblResult));
   End;
end;

procedure TQrFndProv.FootTipoCarBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If Trim(sArchivo)<>'' Then Begin
      Writeln(F, #09#09#09#09#09#09#09#09#09#09#09#09+'Por Tipo de Cartera'+#09#09+
                 IntToStr(QRExpr15.Value.intResult)+#09#09#09#09#09#09#09+ // #09
                 FormatFloat('###,###,###,###,##0.00',QRExpr16.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr17.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr18.Value.dblResult) + #09#09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr19.Value.dblResult));
   End;
end;

procedure TQrFndProv.qrgfPromAdminBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   //
   {
   If qyConsulta.FieldByName('CVE_MONEDA').AsInteger = C_DLLS Then
       lbTCPromAdm.Caption := FormatFloat('###,##0.0000',qyConsultaTC_CONT_USD.AsFloat)
   Else If qyConsulta.FieldByName('CVE_MONEDA').AsInteger = 800 Then
       lbTCPromAdm.Caption := FormatFloat('###,##0.0000',qyConsultaTC_CONT_UDI.AsFloat)
   Else
       lbTCPromAdm.Caption := '1.000000';
    }

    If Trim(sArchivo)<>'' Then Begin
      {
      Writeln(F, #09#09#09#09#09#09#09#09#09#09#09#09+'Por Moneda'+#09#09+
                 IntToStr(QRExpr34.Value.intResult)+#09#09#09#09#09#09#09+ // #09
                 FormatFloat('###,###,###,###,##0.00',QRExpr35.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr37.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr39.Value.dblResult) + #09#09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr41.Value.dblResult));
                 }
      Writeln(F, #09#09#09#09#09#09#09#09#09#09#09#09+'Por Promotor Administrador'+#09#09+
                 IntToStr(QRExpr34.Value.intResult)+ #09#09#09#09#09#09#09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr36.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr38.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr40.Value.dblResult) + #09#09 +
                 FormatFloat('###,###,###,###,##0.00',QRExpr42.Value.dblResult));
   End;
   //
end;

End.

