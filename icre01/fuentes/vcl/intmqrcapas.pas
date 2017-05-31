unit IntMQrCaPas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, unSQL2,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead,InterApl,
  IntQRPreview, Dialogs, IntGenCre;                                                        

type
  TQrCaPas = class(TQuickRep)
    qyMrpasiv: TQuery;
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
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape1: TQRShape;
    QRLabel15: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRSHPTitular: TQRShape;
    QRLabel26: TQRLabel;
    QRDBText32: TQRDBText;
    QRShape2: TQRShape;
    QRLabel27: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBDescProducto: TQRDBText;
    qrDetalle: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    FootProducto: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr13: TQRExpr;
    QRFooterPrograma: TQRBand;
    QRLabel19: TQRLabel;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRExpr33: TQRExpr;
    QRExpr6: TQRExpr;
    QRFooterEntidad: TQRBand;
    QRLabel20: TQRLabel;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRExpr10: TQRExpr;
    QRExpr9: TQRExpr;
    QRFooterGpoProd: TQRBand;
    QRExpr14: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape3: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape4: TQRShape;
    QRExpr1: TQRExpr;
    QRDBText6: TQRDBText;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRDBText10: TQRDBText;
    QRShape6: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText11: TQRDBText;
    FootDivisa: TQRBand;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr34: TQRExpr;
    QRExpr35: TQRExpr;
    QRLabel21: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText20: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr8: TQRExpr;
    qyMrpasivID_CRED_ACTIVO: TFloatField;
    qyMrpasivCVE_MONEDA: TFloatField;
    qyMrpasivDESC_MONEDA: TStringField;
    qyMrpasivCVE_PRODUCTO_GPO: TStringField;
    qyMrpasivCVE_PRODUCTO_CRE: TStringField;
    qyMrpasivDESC_C_PRODUCTO: TStringField;
    qyMrpasivNOMBRE: TStringField;
    qyMrpasivID_CREDITO: TFloatField;
    qyMrpasivCVE_FND_ENT_DES: TStringField;
    qyMrpasivDESC_ENTIDAD_DESC: TStringField;
    qyMrpasivCVE_FND_PROGRAMA: TStringField;
    qyMrpasivCVE_ORIGEN_REC: TStringField;
    qyMrpasivF_INICIO: TDateTimeField;
    qyMrpasivDIAS_PLAZO: TFloatField;
    qyMrpasivF_VENCIMIENTO: TDateTimeField;
    qyMrpasivF_LIQUIDACION: TDateTimeField;
    qyMrpasivF_CANC_PAS: TDateTimeField;
    qyMrpasivF_PROC_CANCPAS: TDateTimeField;
    qyMrpasivSIT_CREDITO: TStringField;
    qyMrpasivMONTO_ACTIVO: TFloatField;
    qyMrpasivPCT_REDESCONTADO: TFloatField;
    qyMrpasivIMP_REDESCONTADO: TFloatField;
    qyMrpasivSDO_VIG_TOTAL: TFloatField;
    qyMrpasivSDO_FINAN_ADIC: TFloatField;
    qyMrpasivSDO_INSOLUTO: TStringField;
    qyMrpasivINT_ACUMULADO: TFloatField;
    qyMrpasivCVE_TIPO_TASA: TStringField;
    qyMrpasivDESC_TIPO_TASA: TStringField;
    qyMrpasivCVE_TASA_REFER: TStringField;
    qyMrpasivDESC_TASA_REFER: TStringField;
    qyMrpasivOPERADOR_STASA: TStringField;
    qyMrpasivSOBRETASA: TFloatField;
    qyMrpasivTASA_CREDITO: TFloatField;
    qyMrpasivCVE_CALCULO: TStringField;
    qyMrpasivDESC_CVE_CALC_IN: TStringField;
    qyMrpasivUNIDAD_TIEMPO_RE: TStringField;
    qyMrpasivDESC_UNIDAD_RE: TStringField;
    qyMrpasivNUM_UNIDADES_RE: TFloatField;
    qyMrpasivDIA_REVISION: TFloatField;
    qyMrpasivF_PROX_REVISION: TDateTimeField;
    qyMrpasivB_FINAN_ADIC: TStringField;
    qyMrpasivUNIDAD_TIEMPO_FN: TStringField;
    qyMrpasivDESC_UNIDAD_FN: TStringField;
    qyMrpasivNUM_UNIDADES_FN: TFloatField;
    qyMrpasivDIA_REVISION_FN: TFloatField;
    qyMrpasivCVE_PAG_INTERES: TStringField;
    qyMrpasivDESC_CVE_PAG_IN: TStringField;
    qyMrpasivUNIDAD_TIEMPO_IN: TStringField;
    qyMrpasivDESC_UNIDAD_IN: TStringField;
    qyMrpasivNUM_UNIDADES_IN: TFloatField;
    qyMrpasivF_INI_PAG_INT: TDateTimeField;
    qyMrpasivDIA_PAGO_INT: TFloatField;
    qyMrpasivCVE_AMORTIZACION: TStringField;
    qyMrpasivDESC_CVE_PAG_CP: TStringField;
    qyMrpasivUNIDAD_TIEMPO_CP: TStringField;
    qyMrpasivDESC_UNIDAD_CP: TStringField;
    qyMrpasivNUM_UNIDADES_CP: TFloatField;
    qyMrpasivF_INI_PAG_CAP: TDateTimeField;
    qyMrpasivDIA_PAGO_CAP: TFloatField;
    qyMrpasivTIPO_ANUAL: TStringField;
    qyMrpasivTIPO_MES: TStringField;
    qyMrpasivMODALIDAD_FND: TStringField;
    qyMrpasivIMP_CREDITO: TFloatField;
    qyMrpasivF_AUTORIZA: TDateTimeField;
    qyMrpasivB_TASA_EQUIV: TStringField;
    qyMrpasivF_RESCATE: TDateTimeField;
    qyMrpasivB_CFG_DIAS_TASA: TStringField;
    QRSdoInsol: TQRExpr;
    QRExpr32: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr22: TQRExpr;
    QRSitCre: TQRLabel;
    QRMontoActivo: TQRLabel;
    QRPctRedes: TQRLabel;
    QRImpRedesc: TQRLabel;

    Function QuitaComas(PPCadena : String):String;
    procedure QRFooterDiaBeforePrint(Sender: TQRCustomBand;    var PrintBand: Boolean);
    procedure qrDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private

     //para el footer de Moneda
    VL_M_Capital    : Double;
    VL_M_FINAN_ADIC : Double;
    VL_M_INTERES    : Double;
    VL_M_Importe    : Double;
    VL_SDO_INSOL    : String;
    VL_SDO_FINAD    : String;
    VL_SDO_TOT_VIG  : String;
    stotal          : String;


  public
    function FormaQuery( sF_CORTEIni, sCVE_PRODUCTO_CRE,
                         sCVE_MONEDA, sCVE_FND_ENT_DES, sCVE_FND_PROGRAMA, sGPO_PRODUCTO, sCVE_ORIGEN_REC, sdID_CESION,
                         sIdEmpresa, sIDSucursal : String) : String;

  end;

var
  QrCaPas: TQrCaPas;
  bGenArch: Boolean;
  sArchivo:String;
  Tiporep : String;
  titrep : String;
  Esquema : String;
  vgFechaHoy : TDateTime;
  F: TextFile;
  Apli : TInterApli;

  vlFechaCons : string;


  procedure RepCartPas( sF_CORTEIni, sCVE_PRODUCTO_CRE,
                        sCVE_MONEDA, sCVE_FND_ENT_DES, sCVE_FND_PROGRAMA, sGPO_PRODUCTO, sCVE_ORIGEN_REC, sdID_CESION,
                        sIdEmpresa, sIDSucursal,
                        SNbrArch : String;
                        tiprep   : String;
                        esqm     : String;
                        pPreview : Boolean;
                        pApli    : TInterApli);


implementation

{$R *.DFM}

procedure RepCartPas(   sF_CORTEIni, sCVE_PRODUCTO_CRE,
                        sCVE_MONEDA, sCVE_FND_ENT_DES, sCVE_FND_PROGRAMA, sGPO_PRODUCTO, sCVE_ORIGEN_REC, sdID_CESION,
                        sIdEmpresa, sIDSucursal,
                        SNbrArch : String;
                        tiprep   : String;
                        esqm     : String;                        
                        pPreview : Boolean;
                        pApli    : TInterApli);

var
    QrCaPas   : TQrCaPas;
    VLTitulo  : String;
    Preview   : TIntQRPreview;
begin
    VLTitulo := '';
    vlFechaCons:= sF_CORTEIni;
    QrCaPas:= TQrCaPas.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrCaPas);
    Apli := pApli;
      Try
        vgFechaHoy  :=  pAPli.DameFechaEmpresa;
        bGenArch    :=  False;
        sArchivo    :=  sNbrArch;
        Tiporep     :=  tiprep;
        Esquema     :=  esqm;

        if Tiporep = 'AC' then
           Titrep := 'Activos';

        if Tiporep = 'LQ' then
           Titrep := 'Liquidados';

        if Tiporep = 'CA' then
           Titrep := 'Cancelados';

        if Tiporep = '' then
           Titrep := 'General';

        QrCaPas.QRInterEncabezado1.Apli := pApli;

        QrCaPas.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrCaPas.QRInterEncabezado1.NomReporte:= 'IntMQrCaPas';
        QrCaPas.QRInterEncabezado1.Titulo1:= 'Reporte de Cartera Pasiva ''' + Titrep + ''' al día: ' + sF_CORTEIni;


        If (Trim(sCVE_PRODUCTO_CRE)<>'') Then
            VLTitulo := VLTitulo + ' Por Producto de Crédito';

        If (Trim(sCVE_MONEDA)<>'') Then
            VLTitulo := VLTitulo + ' Por Moneda';

        If (Trim(sCVE_FND_ENT_DES)<>'') Then
            VLTitulo := VLTitulo + ' Por Entidad';

        If (Trim(sCVE_FND_PROGRAMA)<>'') Then
            VLTitulo := VLTitulo + ' Por Prog. de Apoyo';

        If (Trim(sCVE_FND_PROGRAMA)<>'') Then
            VLTitulo := VLTitulo + ' Por Gpo. Producto';

        If (Trim(sCVE_FND_PROGRAMA)<>'') Then
            VLTitulo := VLTitulo + ' Por Origen de Recursos';

        QrCaPas.QRInterEncabezado1.Titulo2 := VLTitulo;
        QrCaPas.qyMrpasiv.DatabaseName := pApli.DataBaseName;
        QrCaPas.qyMrpasiv.SessionName  := pApli.SessionName;

        QrCaPas.qyMrpasiv.Active:=False;

        QrCaPas.qyMrpasiv.SQL.Text:= QrCaPas.FormaQuery( sF_CORTEIni, sCVE_PRODUCTO_CRE, sCVE_MONEDA,
                                                         sCVE_FND_ENT_DES, sCVE_FND_PROGRAMA,sGPO_PRODUCTO, sCVE_ORIGEN_REC, sdID_CESION, sIdEmpresa, sIDSucursal);

        QrCaPas.qyMrpasiv.SQL.SaveToFile('c:\RepCartPas.txt');
        QrCaPas.qyMrpasiv.Active:=True;


        If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrCaPas.QRInterEncabezado1.Titulo1+ #09 );
         Writeln(F, QrCaPas.QRInterEncabezado1.Titulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F,
                   'CREDITO' + #09 +
                   'CLAVE MONEDA' + #09 +
                   'DESC. MONEDA' + #09 +
                   'GRUPO PRODCUTO' + #09 +
                   'PROD CREDITO' + #09 +
                   'DESC. PRODUCTO' + #09 +
                   'NOMBRE' + #09 +
                   'CVE ENTIDAD' + #09 +
                   'DESC ENTIDAD' + #09 +
                   'PROG. DE APOYO' + #09 +
                   'ORIGEN RECURSOS' + #09 +
                   'FH INICIO' + #09 +
                   'DIAS PLAZO' + #09 +
                   'FH VENCIMIENTO' + #09 +
                   'FH LIQUIDACION' + #09 +
                   'FH CANC PAS' + #09 +
                   'FH PROC CANCPAS' + #09 +
                   'SITUACION' + #09 +
                   'IMP ACTIVO' + #09 +
                   'PCT REDESCONTADO' + #09 +
                   'IMP REDESCONTADO' + #09 +
                   'SDO INSOLUTO' + #09 +
                   'SDO FINAN ADIC' + #09 +
                   'SDO VIG TOTAL' + #09 +
                   'INT ACUMULADO' + #09 +
                   'TIPO TASA' + #09 +
//                   'DESC TIPO TASA' + #09 +
                   'TASA REFER' + #09 +
//                   'DESC TASA REFER' + #09 +
                   'OPERADOR STASA' + #09 +
                   'SOBRETASA' + #09 +
                   'TASA CREDITO' + #09 +
                   'CALCULO INT' + #09 +
//                   'DESC CVE CALC INT' + #09 +
                   'UNIDAD_TIEMPO_RE' + #09 +
                   'DESC UNIDAD RE' + #09 +
                   'NUM UNIDADES RE' + #09 +
                   'DIA REVISION' + #09 +
                   'FH PROX REVISION' + #09 +
                   'FINAN ADIC' + #09 +
                   'UNIDAD TIEMPO FN' + #09 +
                   'DESC UNIDAD FN' + #09 +
                   'NUM UNIDADES FN' + #09 +
                   'DIA REVISION FN' + #09 +
                   'CVE PAG INTERES' + #09 +
                   'DESC CVE PAG IN' + #09 +
                   'UNIDAD TIEMPO IN' + #09 +
                   'DESC UNIDAD IN' + #09 +
                   'NUM UNIDADES IN' + #09 +
                   'FH INI PAG INT' + #09 +
                   'DIA PAGO INT' + #09 +
                   'AMORTIZACION' + #09 +
                   'DESC CVE PAG CP' + #09 +
                   'UNIDAD TIEMPO CP' + #09 +
                   'DESC UNIDAD CP' + #09 +
                   'NUM UNIDADES CP' + #09 +
                   'FH INI PAGO CAP' + #09 +
                   'DIA PAGO CAP' + #09 +
                   'TIPO ANUAL' + #09 +
                   'TIPO MES' + #09 +
                   'MODALIDAD FND' + #09 +
                   'IMP CREDITO' + #09 +
                   'FH AUTORIZA' + #09 +
                   'TASA EQUIV' + #09 +
                   'FH RESCATE' + #09 +
                   'CFG DIAS TASA');


      End;
        If pPreview Then
            QrCaPas.Preview
        Else
            QrCaPas.Print;
     Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrCaPas.free;
      If Assigned(Preview) Then Preview.Free;
    End;
end;

function TQrCaPas.QuitaComas(PPCadena: String): String;
var
   vlIndex, vlTotal : Integer;
   vlCar,vlRenglon: String;
begin
   vlTotal:= Length (Trim(PPCadena));
   vlRenglon:='';

   for vlIndex := 1 to vlTotal do
   begin
      vlCar:= Copy(PPCadena, vlIndex, 1);
      if  vlCar <> ',' then vlRenglon:=vlRenglon+vlCar;
   end;
   QuitaComas:=vlRenglon;
end;

function TQrCaPas.FormaQuery( sF_CORTEIni, sCVE_PRODUCTO_CRE, sCVE_MONEDA, sCVE_FND_ENT_DES,
                              sCVE_FND_PROGRAMA, sGPO_PRODUCTO, sCVE_ORIGEN_REC, sdID_CESION, sIdEmpresa, sIDSucursal :String):String;
Var
    sSQL : String;

begin

      sSQL:= 'SELECT crc.id_credito AS ID_CRED_ACTIVO,' + coCRLF +
             '       cto.CVE_MONEDA,' + coCRLF +
             '       DECODE(cto.CVE_MONEDA,''484'',''PESOS'',''840'',''DOLARES'') as DESC_MONEDA,' + coCRLF +
             '       crp.cve_producto_gpo,' + coCRLF +
             '       cct.cve_producto_cre,' + coCRLF +
             '       crp.desc_c_producto,' + coCRLF +
             '       SUBSTR(PKGCRCONSOLIDADO.FUN_NOM_TIT_CRED(CTO.ID_TITULAR),1,80) AS NOMBRE,' + coCRLF +
             '       fnd.ID_CREDITO, fnd.CVE_FND_ENT_DES,' + coCRLF +
             '       (SELECT DESC_ENT_DES  FROM CR_FND_ENT_DES  WHERE CVE_FND_ENT_DES = fnd.CVE_FND_ENT_DES) AS DESC_ENTIDAD_DESC,' + coCRLF +
             '       fnd.CVE_FND_PROGRAMA, fnd.CVE_ORIGEN_REC,' + coCRLF +
             '       fnd.F_INICIO, fnd.DIAS_PLAZO, fnd.F_VENCIMIENTO, fnd.F_LIQUIDACION,' + coCRLF +
             '       fnd.F_CANC_PAS, fnd.F_PROC_CANCPAS, fnd.SIT_CREDITO,' + coCRLF +
             '       fnd.SDO_VIG_DISP_ACT as MONTO_ACTIVO,' + coCRLF +
             '       fnd.PCT_REDESCONTADO, fnd.IMP_REDESCONTADO,' + coCRLF +
//HERJA SEPTIEMBRE 2012
//             '       PKGCRREDESCTO.FNC_CALCSDOINS_FND(fnd.ID_CREDITO, fnd.CVE_FND_ENT_DES, fnd.CVE_FND_PROGRAMA,'+ SQLFecha(StrToDate(sF_CORTEIni))+') AS SDO_VIG_TOTAL,' + coCRLF +
             '       FHC.SDO_VIG_TOTAL, ' + coCRLF +
//FIN HERJA SEPTIEMBRE 2012
             '	   (' + coCRLF +
             '       SELECT SUM(CT.IMP_NETO) AS SDO_FINAN_ADIC' + coCRLF +
             '         FROM CR_TRANSACCION CT,' + coCRLF +
             '              CR_XTRANSACCION CXT,' + coCRLF +
             '              CR_FND_FIN_ADIC CFA' + coCRLF +
             '        WHERE 1=1' + coCRLF +
             '          AND CT.SIT_TRANSACCION = ''AC''' + coCRLF +
             '          AND CT.ID_TRANS_CANCELA IS NULL' + coCRLF +
             '          AND CT.CVE_OPERACION IN (''APFNFD'')' + coCRLF +
             '          AND CT.F_VALOR <= '+SQLFecha(StrToDate(sF_CORTEIni)) + coCRLF +
             '          AND CT.ID_TRANSACCION = CXT.ID_TRANSACCION' + coCRLF +
             '          AND CT.ID_CREDITO = CFA.ID_CREDITO' + coCRLF +
             '          AND CT.ID_PERIODO = CFA.NUM_PERIODO' + coCRLF +
             '          AND CXT.CVE_FND_ENT_DES = CFA.CVE_FND_ENT_DES' + coCRLF +
             '          AND CXT.CVE_FND_PROGRAMA = CFA.CVE_FND_PROGRAMA' + coCRLF +
             '          AND CFA.ID_CREDITO = fnd.ID_CREDITO' + coCRLF +
             '          AND CFA.CVE_FND_ENT_DES = fnd.cve_fnd_ent_des' + coCRLF +
             '          AND CFA.CVE_FND_PROGRAMA = fnd.cve_fnd_programa' + coCRLF +
             '          AND CFA.f_vencimiento > '+ SQLFecha(StrToDate(sF_CORTEIni)) + coCRLF +
             '          AND (CFA.f_vencimiento - CFA.plazo) <= '+SQLFecha(StrToDate(sF_CORTEIni)) + coCRLF +
             '      ) AS SDO_FINAN_ADIC,' + coCRLF +
	     '         ''0'' AS SDO_INSOLUTO,' + coCRLF +
//HERJA SEPTIEMBRE 2012
{
             '      (select SUM(FHC.IMP_INTERES_DIA)' + coCRLF +
 	     '	       from cr_fnd_interes cint,' + coCRLF +
 	     '	            CR_FND_HIST_CRED FHC' + coCRLF +
   	     '	      WHERE 1=1' + coCRLF +
	     '	        AND cint.f_vencimiento > '+ SQLFecha(StrToDate(sF_CORTEIni)) + coCRLF +
	     '	        AND (cint.f_vencimiento - cint.plazo) <= '+ SQLFecha(StrToDate(sF_CORTEIni)) + coCRLF +
 	     '	        AND FHC.ID_CREDITO = cint.ID_CREDITO' + coCRLF +
	     '	        AND FHC.CVE_FND_ENT_DES = cint.CVE_FND_ENT_DES' + coCRLF +
	     '	        AND FHC.CVE_FND_PROGRAMA = cint.CVE_FND_PROGRAMA' + coCRLF +
             '	        AND (cint.f_vencimiento - cint.plazo)  <= FHC.F_CIERRE' + coCRLF +
             '	        AND FHC.F_CIERRE < '+ SQLFecha(StrToDate(sF_CORTEIni))+' +1' + coCRLF +
             '	        AND fnd.ID_CREDITO = cint.ID_CREDITO' + coCRLF +
             '	        AND fnd.cve_fnd_ent_des = cint.cve_fnd_ent_des' + coCRLF +
             '          AND fnd.cve_fnd_programa = cint.cve_fnd_programa' + coCRLF +
             '	     ) AS INT_ACUMULADO,' + coCRLF +
        }
             '       (' + coCRLF +
             '    SELECT NVL(SUM(IMP_ACCESORIO),0)' + coCRLF +
             '        FROM CR_FND_DHIS_CRED' + coCRLF +
             '        WHERE 1 = 1' + coCRLF +
             '                AND F_CIERRE = '+ SQLFecha(StrToDate(sF_CORTEIni))+coCRLF +
             '                AND CVE_ACCESORIO = ''RI'' ' + coCRLF +
             '                AND ID_CREDITO = fnd.ID_CREDITO ' + coCRLF +
             '                AND cve_fnd_ent_des = fnd.cve_fnd_ent_des ' + coCRLF +
             '                AND cve_fnd_programa = fnd.cve_fnd_programa ' + coCRLF +
             '       )	INT_ACUMULADO, ' + coCRLF +
//FIN HERJA SEPTIEMBRE 2012


             '       fnd.CVE_TIPO_TASA,' + coCRLF +
             '       DECODE (fnd.CVE_TIPO_TASA,''FI'',''TASA FIJA'',''VA'',''TASA VARIABLE'') AS DESC_TIPO_TASA,' + coCRLF +
             '       fnd.CVE_TASA_REFER,' + coCRLF +
             '       (SELECT DESC_TASA_INDIC FROM TASA_INDIC_FINAN  WHERE CVE_TASA_INDICAD=fnd.CVE_TASA_REFER) AS DESC_TASA_REFER,' + coCRLF +
             '       fnd.OPERADOR_STASA, fnd.SOBRETASA, fnd.TASA_CREDITO,' + coCRLF +
             '       fnd.CVE_CALCULO,' + coCRLF +
             '       (SELECT DESC_CALCULO FROM CR_CALCULO_INT WHERE CVE_CALCULO_INT=fnd.CVE_CALCULO) AS DESC_CVE_CALC_IN,' + coCRLF +
             '       fnd.UNIDAD_TIEMPO_RE,' + coCRLF +
             '       (SELECT DESCRIPCION FROM CR_UNIDAD_TIEMPO WHERE CVE_UNIDAD_TIEMP=fnd.UNIDAD_TIEMPO_RE) AS DESC_UNIDAD_RE,' + coCRLF +
             '       fnd.NUM_UNIDADES_RE,' + coCRLF +
             '       fnd.DIA_REVISION,' + coCRLF +
             '       fnd.F_PROX_REVISION,' + coCRLF +
             '       fnd.B_FINAN_ADIC,' + coCRLF +
             '       fnd.UNIDAD_TIEMPO_FN,' + coCRLF +
             '       (SELECT DESCRIPCION FROM CR_UNIDAD_TIEMPO WHERE CVE_UNIDAD_TIEMP=fnd.UNIDAD_TIEMPO_FN) AS DESC_UNIDAD_FN,' + coCRLF +
             '       fnd.NUM_UNIDADES_FN,' + coCRLF +
             '       fnd.DIA_REVISION_FN,' + coCRLF +
             '       fnd.CVE_PAG_INTERES,' + coCRLF +
             '       (SELECT DESC_PAG_INTERES FROM CR_PAGO_INTERES WHERE CVE_PAG_INTERES=fnd.CVE_PAG_INTERES) AS DESC_CVE_PAG_IN,' + coCRLF +
             '       fnd.UNIDAD_TIEMPO_IN,' + coCRLF +
             '       (SELECT DESCRIPCION FROM CR_UNIDAD_TIEMPO WHERE CVE_UNIDAD_TIEMP=fnd.UNIDAD_TIEMPO_IN) AS DESC_UNIDAD_IN,' + coCRLF +
             '       fnd.NUM_UNIDADES_IN,' + coCRLF +
             '       fnd.F_INI_PAG_INT,' + coCRLF +
             '       fnd.DIA_PAGO_INT,' + coCRLF +
             '       fnd.CVE_AMORTIZACION,' + coCRLF +
             '       (SELECT DESC_AMORTIZA FROM CR_AMORTIZACION WHERE CVE_AMORTIZACION=fnd.CVE_AMORTIZACION) AS DESC_CVE_PAG_CP,' + coCRLF +
             '       fnd.UNIDAD_TIEMPO_CP,' + coCRLF +
             '       (SELECT DESCRIPCION FROM CR_UNIDAD_TIEMPO WHERE CVE_UNIDAD_TIEMP=fnd.UNIDAD_TIEMPO_CP) AS DESC_UNIDAD_CP,' + coCRLF +
             '       fnd.NUM_UNIDADES_CP,' + coCRLF +
             '       fnd.F_INI_PAG_CAP,' + coCRLF +
             '       fnd.DIA_PAGO_CAP,' + coCRLF +
             '       DECODE (fnd.CVE_TIPO_ANUAL, ''C0'', ''COMERCIAL'', ''CA'', ''CALENDARIO'') AS TIPO_ANUAL,' + coCRLF +
             '       DECODE (fnd.CVE_TIPO_MES, ''0'', ''COMERCIAL'', ''1'', ''CALENDARIO'') AS TIPO_MES,' + coCRLF +
             '       DECODE (fnd.CVE_MOD_FND, ''PR'', ''PRESTAMO'', ''DS'', ''DESCUENTO'', ''NA'') AS MODALIDAD_FND,' + coCRLF +
             '       fnd.IMP_CREDITO,' + coCRLF +
             '       fnd.F_AUTORIZA,' + coCRLF +
             '       fnd.B_TASA_EQUIV,' + coCRLF +
             '       fnd.F_RESCATE,' + coCRLF +
             '       fnd.B_CFG_DIAS_TASA' + coCRLF +
             '  FROM cr_fnd_credito fnd,' + coCRLF +
             '       cr_fnd_hist_cred fhc,' + coCRLF +
             '       cr_credito crc,' + coCRLF +
             '       contrato cto,' + coCRLF;

                  If (Trim(sCVE_PRODUCTO_CRE)<>'') OR (Trim(sGPO_PRODUCTO)<>'') Then
                  begin
                     If (Trim(sCVE_PRODUCTO_CRE)<>'') Then
                     begin
                        sSQL:= sSQL +
                        '       (SELECT ID_CONTRATO, FOL_CONTRATO, ID_PROM_ADMON, CVE_PRODUCTO_CRE, CVE_MONEDA FROM CR_CONTRATO '+  coCRLF +
                        '         WHERE CVE_PRODUCTO_CRE IN ('''+sCVE_PRODUCTO_CRE+''')'+  coCRLF +
                        '        ) cct, '+  coCRLF;
                     end;
                     If (Trim(sGPO_PRODUCTO)<>'') Then
                     begin
                        sSQL:= sSQL +
                        '       (SELECT ID_CONTRATO, FOL_CONTRATO, ID_PROM_ADMON, CVE_PRODUCTO_CRE FROM CR_CONTRATO '+  coCRLF +
                        '         WHERE CVE_PRODUCTO_CRE IN ( SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO WHERE CVE_PRODUCTO_GPO ='+ SQLStr(sGPO_PRODUCTO)+ ')'+ coCRLF +
                        '        ) cct, '+  coCRLF;
                     end;
                  end
                  else
                     sSQL := sSQL + '       cr_contrato cct, '+  coCRLF;

        sSQL := sSQL +               
//                  ' cr_contrato cct,' + coCRLF +
             '       cr_producto crp,' + coCRLF +
             '       moneda mon' + coCRLF +
            ' WHERE 1 = 1' + coCRLF +
              '   AND fnd.id_credito = crc.id_credito'+ coCRLF;
                   {LA SIGUIENTE CONDICION ES PARA CREDITOS CON
                   ESQUEMA DE FONDEO (PCT_REDESCONTADO >0)
                   O
                   ESQUEMA DE GARANTIAS (PCT_REDESCONTADO = 0) }
             if Esquema = 'FON' then
                sSQL := sSQL + '   AND fnd.pct_redescontado > 0 '+ coCRLF

             else if Esquema = 'GAR' then
                sSQL := sSQL + '   AND fnd.pct_redescontado = 0 '+ coCRLF;

             if Tiporep = 'AC' then
                sSQL := sSQL + '   AND fnd.SIT_CREDITO = ''AC'''+ coCRLF;

             if Tiporep = 'LQ' then
                sSQL := sSQL + '   AND (fnd.SIT_CREDITO = ''LQ'' AND fnd.F_LIQUIDACION >= '+ SQLFecha(StrToDate(sF_CORTEIni)) +')' + coCRLF;

             if Tiporep = 'CA' then
                sSQL := sSQL + '   AND (fnd.sit_credito = ''CA'') AND ('+SQLFecha(StrToDate(sF_CORTEIni))+' <= fnd.f_proc_cancpas)' + coCRLF;

             if Tiporep = '' then
                sSQL := sSQL +
                     '   AND (' + coCRLF +
                       //TOMA CREDITOS ACTIVOS O LIQUIDADOS POSTERIOR A LA FECHA SOLICITADA
                     //'        (  (fnd.SIT_CREDITO = ''AC'')' + coCRLF +
                     '        ( ' + coCRLF +
                     '          ( ' + coCRLF +
                     '               (fnd.SIT_CREDITO = ''AC'') ' + coCRLF +
                     '               AND ' + coCRLF +
                     '                ( ' + coCRLF +
                     '                  (FND.F_VENCIMIENTO - FND.DIAS_PLAZO ) <= '+SQLFecha(StrToDate(sF_CORTEIni)) +' ' + coCRLF +
                     '                  AND ' + coCRLF +
                     '                  (FND.F_VENCIMIENTO) > '+SQLFecha(StrToDate(sF_CORTEIni)) +' ' + coCRLF +
                     '                ) ' + coCRLF +
                     '          ) ' + coCRLF +
                     //
                     '        OR' + coCRLF +
//                     '        ( fnd.SIT_CREDITO = ''LQ'' AND fnd.F_LIQUIDACION >= '+ SQLFecha(StrToDate(sF_CORTEIni)) +') )' + coCRLF +
                     '        ( fnd.SIT_CREDITO = ''LQ'' AND fnd.F_VENCIMIENTO >= '+ SQLFecha(StrToDate(sF_CORTEIni)) +') )' + coCRLF +
                       //TOMA CREDITOS CANCELADOS
                     '        OR' + coCRLF +
//                     '        (  (fnd.sit_credito = ''CA'') AND ('+SQLFecha(StrToDate(sF_CORTEIni))+' <= fnd.f_proc_cancpas) )' + coCRLF +
                     '        (  (fnd.sit_credito = ''CA'') AND ('+SQLFecha(StrToDate(sF_CORTEIni))+' <= fnd.f_vencimiento) )' + coCRLF +
                     '        )' + coCRLF;
         sSQL := sSQL +
//              '   AND fnd.id_credito = cint.id_credito' + coCRLF +
//              '   AND fnd.cve_fnd_ent_des = cint.cve_fnd_ent_des' + coCRLF +
//              '   AND fnd.cve_fnd_programa = cint.cve_fnd_programa' + coCRLF +
//              '   AND cint.f_vencimiento < '+ SQLFecha(StrToDate(sF_CORTEIni))+ coCRLF +
//              '   AND (cint.f_vencimiento - cint.plazo) <= '+SQLFecha(StrToDate(sF_CORTEIni))+ coCRLF +
              '   AND crc.id_contrato = cct.id_contrato' + coCRLF +
              '   AND crc.fol_contrato = cct.fol_contrato' + coCRLF +
              '   AND cct.cve_producto_cre = crp.cve_producto_cre' + coCRLF +
              '   AND cct.id_contrato = cto.id_contrato' + coCRLF +
              '   AND crp.sit_producto <> ''CA''' + coCRLF +
              '   AND cto.cve_moneda = mon.cve_moneda' + coCRLF +
              '   AND crp.id_empresa ='+ sIdEmpresa + coCRLF+
              '   AND FHC.ID_CREDITO(+) = fnd.ID_CREDITO '+ coCRLF+
              '   AND FHC.CVE_FND_ENT_DES(+) = fnd.CVE_FND_ENT_DES'+ coCRLF+
              '   AND FHC.CVE_FND_PROGRAMA(+) = fnd.CVE_FND_PROGRAMA'+ coCRLF+
              '   AND FHC.F_CIERRE(+) = '+SQLFecha(StrToDate(sF_CORTEIni))+ coCRLF;

              If (Trim(sCVE_MONEDA)<>'') Then
             sSQL:= sSQL +
             '   AND cto.cve_moneda = '+ sCVE_MONEDA  +  coCRLF;

              If (Trim(sCVE_FND_ENT_DES)<>'') Then
             sSQL:= sSQL +
             '   AND fnd.cve_fnd_ent_des = '+ sCVE_FND_ENT_DES  +  coCRLF;

              If (Trim(sCVE_FND_PROGRAMA)<>'') Then
             sSQL:= sSQL +
             '   AND fnd.cve_fnd_programa = '+ sCVE_FND_PROGRAMA  +  coCRLF;

              If (Trim(sCVE_ORIGEN_REC)<>'') Then
             sSQL:= sSQL +
             '   AND fnd.CVE_ORIGEN_REC = '+ sCVE_ORIGEN_REC  +  coCRLF;

              If (Trim(sdID_CESION)<>'') Then
             sSQL:= sSQL +
             '   AND fnd.ID_CREDITO = '+ sdID_CESION  +  coCRLF;


            sSQL:= sSQL + 'order by fnd.id_credito, cto.cve_moneda desc, fnd.cve_fnd_ent_des, fnd.cve_fnd_programa, cct.cve_producto_cre';

    Result:= sSQL;
end;


procedure TQrCaPas.QRFooterDiaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If qyMrpasiv.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;


procedure TQrCaPas.qrDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var

  VF_VENCIM,
  VF_LIQUID,
  VF_CANC_PAS,
  VF_PC_CANCPAS : String;

  VLSIT, vlPCT_REDES, vlIMPCREDITO, vlIMPREDESC: String;
  vlQry : TQuery;
  vlSql : string;
begin
    VL_SDO_INSOL := '0.00';
    VL_SDO_FINAD := '0.00';
    VL_SDO_TOT_VIG := '0.00';

    VL_SDO_TOT_VIG := FormatFloat('###,###,###,###,###,##0.00',qyMrpasiv.FieldByName('SDO_VIG_TOTAL').AsFloat);
    VL_SDO_FINAD   := FormatFloat('###,###,###,###,###,##0.00',qyMrpasiv.FieldByName('SDO_FINAN_ADIC').AsFloat);


    VL_SDO_INSOL := floattostr(strtofloat(QuitaComas(VL_SDO_TOT_VIG))- strtofloat(QuitaComas(VL_SDO_FINAD)));

    If qyMrpasiv.FieldByName('F_VENCIMIENTO').asString <> '' Then
    begin
       VF_VENCIM:= FormatDateTime('dd/mm/yyyy', qyMrpasiv.FieldByName('F_VENCIMIENTO').AsDateTime);
    end
    else
       VF_VENCIM := '';


    If qyMrpasiv.FieldByName('F_LIQUIDACION').asString <> '' Then
    begin
       VF_LIQUID:= FormatDateTime('dd/mm/yyyy', qyMrpasiv.FieldByName('F_LIQUIDACION').AsDateTime);
    end
    else
       VF_LIQUID := '';


    If qyMrpasiv.FieldByName('F_CANC_PAS').asString <> '' Then
    begin
       VF_CANC_PAS:= FormatDateTime('dd/mm/yyyy', qyMrpasiv.FieldByName('F_CANC_PAS').AsDateTime);
    end
    else
       VF_CANC_PAS := '';


    If qyMrpasiv.FieldByName('F_PROC_CANCPAS').asString <> '' Then
    begin
       VF_PC_CANCPAS:= FormatDateTime('dd/mm/yyyy', qyMrpasiv.FieldByName('F_PROC_CANCPAS').AsDateTime);
    end
    else
       VF_PC_CANCPAS := '';

    VLSIT:=qyMrpasiv.FieldByName('SIT_CREDITO').asString;
    vlPCT_REDES:=qyMrpasiv.FieldByName('PCT_REDESCONTADO').AsString;
    vlIMPCREDITO:=FormatFloat('###,###,###,###,###,##0.00',qyMrpasiv.FieldByName('MONTO_ACTIVO').AsFloat);
    vlIMPREDESC:=FormatFloat('###,###,###,###,###,##0.00',qyMrpasiv.FieldByName('IMP_REDESCONTADO').AsFloat);

    if (qyMrpasiv.FieldByName('F_LIQUIDACION').asString <> '') then
    begin
       if (StrToDate(vlFechaCons) < StrToDate(qyMrpasiv.FieldByName('F_LIQUIDACION').asString) ) then
       begin
          VLSIT:='AC';
          VF_LIQUID := ' ';
       end;
    end;

    if (qyMrpasiv.FieldByName('F_CANC_PAS').asString <> '') then
    begin
       if (StrToDate(vlFechaCons) < StrToDate(qyMrpasiv.FieldByName('F_CANC_PAS').asString) ) then
       begin
          vlSQL:='SELECT * FROM CR_FND_CREDITO_BK WHERE ID_CREDITO = '+ qyMrpasiv.FieldByName('ID_CRED_ACTIVO').AsString +
                 ' AND CVE_FND_ENT_DES = '''+qyMrpasiv.FieldByName('CVE_FND_ENT_DES').AsString+''''+
                 ' AND CVE_FND_PROGRAMA = '''+qyMrpasiv.FieldByName('CVE_FND_PROGRAMA').AsString+'''';
          vlQry := GetSQLQuery(vlSQL,Apli.DataBaseName,Apli.SessionName,True);
          try
            If (vlQry <> nil) Then
            Begin
               vlPCT_REDES:=vlQry.FieldByName('PCT_REDESCONTADO').AsString;
               vlIMPCREDITO:=FormatFloat('###,###,###,###,###,##0.00',vlQry.FieldByName('IMP_CREDITO').AsFloat);
               vlIMPREDESC:=FormatFloat('###,###,###,###,###,##0.00',vlQry.FieldByName('IMP_REDESCONTADO').AsFloat);
               vlQry.Close;
            end;
            VF_CANC_PAS := ' ';
            VF_PC_CANCPAS := ' ';
            VLSIT:='AC';
          finally
             if vlQry <> nil then vlQry.free;
          end;
       end;
    end;

    QRSitCre.Caption:=VLSIT;
    QRMontoActivo.Caption:=vlIMPCREDITO;
    QRPctRedes.Caption:=vlPCT_REDES;
    QRImpRedesc.Caption:=vlIMPREDESC;


    If sArchivo <>'' Then
    Begin
         Writeln(F,
                  qyMrpasiv.FieldByName('ID_CRED_ACTIVO').AsString + #09 +
                  qyMrpasiv.FieldByName('CVE_MONEDA').AsString + #09 +
                  qyMrpasiv.FieldByName('DESC_MONEDA').AsString + #09 +
                  qyMrpasiv.FieldByName('CVE_PRODUCTO_GPO').AsString + #09 +
                  qyMrpasiv.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
                  qyMrpasiv.FieldByName('DESC_C_PRODUCTO').AsString + #09 +
                  qyMrpasiv.FieldByName('NOMBRE').AsString + #09 +
                  qyMrpasiv.FieldByName('CVE_FND_ENT_DES').AsString + #09 +
                  qyMrpasiv.FieldByName('DESC_ENTIDAD_DESC').AsString + #09 +
                  qyMrpasiv.FieldByName('CVE_FND_PROGRAMA').AsString + #09 +
                  qyMrpasiv.FieldByName('CVE_ORIGEN_REC').AsString + #09 +
                  FormatDateTime('DD/MM/YYYY',qyMrpasiv.FieldByName('F_INICIO').AsDateTime) + #09 +
                  qyMrpasiv.FieldByName('DIAS_PLAZO').AsString + #09 +
//                  FormatDateTime('DD/MM/YYYY',qyMrpasiv.FieldByName('F_VENCIMIENTO').AsDateTime) + #09 +
//                  FormatDateTime('DD/MM/YYYY',qyMrpasiv.FieldByName('F_LIQUIDACION').AsDateTime) + #09 +
//                  FormatDateTime('DD/MM/YYYY',qyMrpasiv.FieldByName('F_CANC_PAS').AsDateTime) + #09 +
//                  FormatDateTime('DD/MM/YYYY',qyMrpasiv.FieldByName('F_PROC_CANCPAS').AsDateTime) + #09 +
                  VF_VENCIM + #09 +
                  VF_LIQUID + #09 +
                  VF_CANC_PAS + #09 +
                  VF_PC_CANCPAS + #09 +
//                  qyMrpasiv.FieldByName('SIT_CREDITO').AsString + #09 +
                  VLSIT + #09 +
//                  FormatFloat('###,###,###,###,###,##0.00',qyMrpasiv.FieldByName('MONTO_ACTIVO').AsFloat) + #09+
                  vlIMPCREDITO+ #09+
//                  qyMrpasiv.FieldByName('PCT_REDESCONTADO').AsString + #09 +
                  vlPCT_REDES + #09 +
//                  FormatFloat('###,###,###,###,###,##0.00',qyMrpasiv.FieldByName('IMP_REDESCONTADO').AsFloat) + #09+
                  vlIMPREDESC+ #09+
                  VL_SDO_INSOL+ #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyMrpasiv.FieldByName('SDO_FINAN_ADIC').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyMrpasiv.FieldByName('SDO_VIG_TOTAL').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyMrpasiv.FieldByName('INT_ACUMULADO').AsFloat) + #09+
                  qyMrpasiv.FieldByName('DESC_TIPO_TASA').AsString + #09 +
                  qyMrpasiv.FieldByName('DESC_TASA_REFER').AsString + #09 +
                  qyMrpasiv.FieldByName('OPERADOR_STASA').AsString + #09 +
                  qyMrpasiv.FieldByName('SOBRETASA').AsString + #09 +
                  qyMrpasiv.FieldByName('TASA_CREDITO').AsString + #09 +
                  qyMrpasiv.FieldByName('DESC_CVE_CALC_IN').AsString + #09 +
                  qyMrpasiv.FieldByName('UNIDAD_TIEMPO_RE').AsString + #09 +
                  qyMrpasiv.FieldByName('DESC_UNIDAD_RE').AsString + #09 +
                  qyMrpasiv.FieldByName('NUM_UNIDADES_RE').AsString + #09 +
                  qyMrpasiv.FieldByName('DIA_REVISION').AsString + #09 +
                  FormatDateTime('DD/MM/YYYY',qyMrpasiv.FieldByName('F_PROX_REVISION').AsDateTime) + #09 +
                  qyMrpasiv.FieldByName('B_FINAN_ADIC').AsString + #09 +
                  qyMrpasiv.FieldByName('UNIDAD_TIEMPO_FN').AsString + #09 +
                  qyMrpasiv.FieldByName('DESC_UNIDAD_FN').AsString + #09 +
                  qyMrpasiv.FieldByName('NUM_UNIDADES_FN').AsString + #09 +
                  qyMrpasiv.FieldByName('DIA_REVISION_FN').AsString + #09 +
                  qyMrpasiv.FieldByName('CVE_PAG_INTERES').AsString + #09 +
                  qyMrpasiv.FieldByName('DESC_CVE_PAG_IN').AsString + #09 +
                  qyMrpasiv.FieldByName('UNIDAD_TIEMPO_IN').AsString + #09 +
                  qyMrpasiv.FieldByName('DESC_UNIDAD_IN').AsString + #09 +
                  qyMrpasiv.FieldByName('NUM_UNIDADES_IN').AsString + #09 +
                  FormatDateTime('DD/MM/YYYY',qyMrpasiv.FieldByName('F_INI_PAG_INT').AsDateTime) + #09 +
                  qyMrpasiv.FieldByName('DIA_PAGO_INT').AsString + #09 +
                  qyMrpasiv.FieldByName('CVE_AMORTIZACION').AsString + #09 +
                  qyMrpasiv.FieldByName('DESC_CVE_PAG_CP').AsString + #09 +
                  qyMrpasiv.FieldByName('UNIDAD_TIEMPO_CP').AsString + #09 +
                  qyMrpasiv.FieldByName('DESC_UNIDAD_CP').AsString + #09 +
                  qyMrpasiv.FieldByName('NUM_UNIDADES_CP').AsString + #09 +
                  FormatDateTime('DD/MM/YYYY',qyMrpasiv.FieldByName('F_INI_PAG_CAP').AsDateTime) + #09 +
                  qyMrpasiv.FieldByName('DIA_PAGO_CAP').AsString + #09 +
                  qyMrpasiv.FieldByName('TIPO_ANUAL').AsString + #09 +
                  qyMrpasiv.FieldByName('TIPO_MES').AsString + #09 +
                  qyMrpasiv.FieldByName('MODALIDAD_FND').AsString + #09 +
                  qyMrpasiv.FieldByName('IMP_CREDITO').AsString + #09 +
                  qyMrpasiv.FieldByName('F_AUTORIZA').AsString + #09 +
                  qyMrpasiv.FieldByName('B_TASA_EQUIV').AsString + #09 +
                  qyMrpasiv.FieldByName('F_RESCATE').AsString + #09 +
                  qyMrpasiv.FieldByName('B_CFG_DIAS_TASA').AsString);

    End;
end;

end.
