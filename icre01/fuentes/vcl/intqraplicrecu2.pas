
unit IntQrAplicRecu2;

interface        

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead,IntQRPreview,InterApl,
  Db, DBTables,IntGenCre,unSQL2;

type
  TQrAplicRecu2 = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    qyAplicRecu: TQuery;
    QRBand1: TQRBand;
    QRDB_IMP_IVA: TQRDBText;
    QRDBText22: TQRDBText;
    QRShape14: TQRShape;
    QRDBText15: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel23: TQRLabel;
    QRShape15: TQRShape;                       
    dbProducto: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText23: TQRDBText;
    QRShape17: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText10: TQRDBText;
    QRFooterCesion: TQRBand;
    QRLabel11: TQRLabel;
    QRFooterCliente: TQRBand;
    QRLabel27: TQRLabel;
    QRShape16: TQRShape;
    QRLabel4: TQRLabel;
    dbMoneda: TQRDBText;
    QRDBText7: TQRDBText;
    QRBFTIPO: TQRBand;
    QRExpr1: TQRExpr;
    QRGroupMoneda : TQRGroup;
    QRGroupProducto : TQRGroup;
    QRGroup1 : TQRGroup;
    QRGroupCesion : TQRGroup;
    QRGTIPO_CARTERA : TQRGroup;
    qyAplicRecuCVE_MONEDA: TFloatField;
    qyAplicRecuCVE_PRODUCTO_GPO: TStringField;
    qyAplicRecuCVE_PRODUCTO: TStringField;
    qyAplicRecuID_TITULAR: TFloatField;
    qyAplicRecuNOMB_CONTRATO: TStringField;
    qyAplicRecuID_CONTRATO: TFloatField;
    qyAplicRecuID_CREDITO: TFloatField;
    qyAplicRecuID_SOLICITUD: TFloatField;
    qyAplicRecuTIPO: TStringField;
    qyAplicRecuCAP_IMPBRU: TFloatField;
    qyAplicRecuCAP_IMPIVA: TFloatField;
    qyAplicRecuCAP_IMPMOR: TFloatField;
    qyAplicRecuCAP_IVAMOR: TFloatField;
    qyAplicRecuINT_IMPBRU: TFloatField;
    qyAplicRecuINT_IMPIVA: TFloatField;
    qyAplicRecuINT_IMPMOR: TFloatField;
    qyAplicRecuINT_IVAMOR: TFloatField;
    qyAplicRecuFIN_IMPBRU: TFloatField;
    qyAplicRecuFIN_IMPIVA: TFloatField;
    qyAplicRecuFIN_IMPMOR: TFloatField;
    qyAplicRecuFIN_IVAMOR: TFloatField;
    qyAplicRecuOTROS_IMPBRU: TFloatField;
    qyAplicRecuOTROS_IMPIVA: TFloatField;
    qyAplicRecuOTROS_IMPMOR: TFloatField;
    qyAplicRecuOTROS_IVAMOR: TFloatField;
    qyAplicRecuDESC_PRODUCTO: TStringField;
    qyAplicRecuDESC_MONEDA: TStringField;
    QRLabel14: TQRLabel;
    QRBand2: TQRBand;
    QRShape4: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape5: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape12: TQRShape;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRLabel46: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape2: TQRShape;
    QRShape30: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape6: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText19: TQRDBText;
    QRShape29: TQRShape;
    QRLabel24: TQRLabel;
    QRInterEncabezado1: TQRInterEncabezado;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;

    QRL_CAP_IMPBRU_CRE: TQRLabel;
    QRL_CAP_IMPMOR_CRE: TQRLabel;
    QRL_CAP_IVAMOR_CRE: TQRLabel;
    QRL_INT_IMPBRU_CRE: TQRLabel;
    QRL_INT_IMPIVA_CRE: TQRLabel;
    QRL_FIN_IMPBRU_CRE: TQRLabel;
    QRL_FIN_IMPIVA_CRE: TQRLabel;
    QRL_FIN_IMPMOR_CRE: TQRLabel;
    QRL_FIN_IVAMOR_CRE: TQRLabel;
    QRL_OTROS_IMPBRU_CRE: TQRLabel;
    QRL_OTROS_IMPIVA_CRE: TQRLabel;
    QRL_OTROS_IMPMOR_CRE: TQRLabel;
    QRL_OTROS_IVAMOR_CRE: TQRLabel;

    QRL_CAP_IMPBRU_CTE: TQRLabel;
    QRL_CAP_IMPMOR_CTE: TQRLabel;
    QRL_CAP_IVAMOR_CTE: TQRLabel;
    QRL_INT_IMPBRU_CTE: TQRLabel;
    QRL_INT_IMPIVA_CTE: TQRLabel;
    QRL_FIN_IMPBRU_CTE: TQRLabel;
    QRL_FIN_IMPIVA_CTE: TQRLabel;
    QRL_FIN_IMPMOR_CTE: TQRLabel;
    QRL_FIN_IVAMOR_CTE: TQRLabel;
    QRL_OTROS_IMPBRU_CTE: TQRLabel;
    QRL_OTROS_IMPIVA_CTE: TQRLabel;
    QRL_OTROS_IMPMOR_CTE: TQRLabel;
    QRL_OTROS_IVAMOR_CTE: TQRLabel;
    TotalMovto: TQRLabel;
    qyAplicRecuIMP_APLICADO: TFloatField;
    qyAplicRecuIMP_RECUPERADO: TFloatField;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    qyAplicRecuF_SOLICITUD: TStringField;
    QRLabel7: TQRLabel;
    QRDBText21: TQRDBText;
    qyAplicRecuIMP_RESCATADO: TFloatField;
    QRL_NETO_CRE: TQRLabel;
    QRL_NETO_CTE: TQRLabel;
    QRShape31: TQRShape;
    QRShape3: TQRShape;
    QRShape10: TQRShape;
    QRShape18: TQRShape;
    qyAplicRecuTIPO_DESC: TStringField;

    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRFooterCesionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterClienteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBFTIPOBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBFTIPOAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroupCesionAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private

  public
     VLF_Vencimiento : String;
     Apli : TInterApli;

     Function FormaQuery(  sF_Vencimiento,sProducto,sMoneda,
                           sAcreditado,
                           sCesion,sGpoProd : String;
                           iGarantia: Integer) : String;

     Function generaConsultaAplicacionesRecuparaciones( IDCredito, IDMoneda, IDAcreditado, cve_producto,
                                                   cve_producto_gpo:string;
                                                   TipoGarantia:integer;
                                                   Tipo, FechaFinal:String
                                                 ) : String;

  end;

var
total_por_Movto : double;
  QrAplicRecu2: TQrAplicRecu2;
  sArchivo:String;
  F: TextFile;
  B_1ARCH:BOOLEAN;
  vlmaxlin, vlinclin:word;
  vlF_Vencimiento, vlLeyenda:string;

  vlCAP_IMPBRU_CRE, vlCAP_IMPMOR_CRE, vlCAP_IVAMOR_CRE,
  vlINT_IMPBRU_CRE, vlINT_IMPIVA_CRE, vlINT_IMPMOR_CRE, vlINT_IVAMOR_CRE,
  vlFIN_IMPBRU_CRE, vlFIN_IMPIVA_CRE, vlFIN_IMPMOR_CRE, vlFIN_IVAMOR_CRE,
  vlOTROS_IMPBRU_CRE, vlOTROS_IMPIVA_CRE, vlOTROS_IMPMOR_CRE, vlOTROS_IVAMOR_CRE,
  vlNETO_CRE : Currency;

  vlCAP_IMPBRU_CTE, vlCAP_IMPMOR_CTE, vlCAP_IVAMOR_CTE,
  vlINT_IMPBRU_CTE, vlINT_IMPIVA_CTE, vlINT_IMPMOR_CTE, vlINT_IVAMOR_CTE,
  vlFIN_IMPBRU_CTE, vlFIN_IMPIVA_CTE, vlFIN_IMPMOR_CTE, vlFIN_IVAMOR_CTE,
  vlOTROS_IMPBRU_CTE, vlOTROS_IMPIVA_CTE, vlOTROS_IMPMOR_CTE, vlOTROS_IVAMOR_CTE,
  vlNETO_CTE : Currency;

type
   AplicRecuArray  = array[1..4] of String;

CONST
   FEGA_APLICACIONES:      AplicRecuArray   = ('PGCPGF','PGINGF','PGFNGF','PGCNGF');
   FEGA_RECUPERACIONES:    AplicRecuArray   = ('RCCPGF','RCINGF','RCFNGF','RCCNGF');
   PYME_APLICACIONES:      AplicRecuArray   = ('PGCPGP','PGINGP','PGFNGP','PGCNGP');
   PYME_RECUPERACIONES:    AplicRecuArray   = ('RCCPGP','RCINGP','RCFNGP','RCCNGP');
   //
   FEGA_RESCATES:          AplicRecuArray   = ('RTCPGF','RTINGF','RTFNGF','RTCNGF');
   PYME_RESCATES:          AplicRecuArray   = ('RTCPGP','RTINGP','RTFNGP','RTCNGP');
   FEGA_RESCXREES:         AplicRecuArray   = ('RSCPGF','RSINGF','RSFNGF','RSCNGF');
   PYME_RESCXREES:         AplicRecuArray   = ('RSCPGP','RSINGP','RSFNGP','RSCNGP');
   FEGA_INCOB:             AplicRecuArray   = ('INCPGF','ININGF','INFNGF','INCNGF');
   PYME_INCOB:             AplicRecuArray   = ('INCPGP','ININGP','INFNGP','INCNGP');
   //
   NOMBRES_CONCEPTOPS:     array[1..4] of String   = ('IMPBRU','IMPIVA','IMPMOR','IVAMOR');
   //
   NOMBRES_CAMPOS:         array[1..4] of String   = ('CAP_','INT_','FIN_','OTROS_');


Procedure RepAplicRecu (sF_Vencimiento,
                        sProducto,sMoneda,
                        sAcreditado,
                        sCesion,sGpoProd,sNbrArch:String;
                        iGarantia: Integer;
                        pAPli     : TInterApli;
                        pPreview  : Boolean
                       );

Implementation


{$R *.DFM}

Procedure Inicializa_Variables(PE_Tlimpia:byte);
begin
   if (PE_Tlimpia=2)or(PE_Tlimpia=5) then
   begin
      vlCAP_IMPBRU_CRE:=0; vlCAP_IMPMOR_CRE:=0; vlCAP_IVAMOR_CRE:=0;
      vlINT_IMPBRU_CRE:=0; vlINT_IMPIVA_CRE:=0; vlINT_IMPMOR_CRE:=0; vlINT_IVAMOR_CRE:=0;
      vlFIN_IMPBRU_CRE:=0; vlFIN_IMPIVA_CRE:=0; vlFIN_IMPMOR_CRE:=0; vlFIN_IVAMOR_CRE:=0;
      vlOTROS_IMPBRU_CRE:=0; vlOTROS_IMPIVA_CRE:=0; vlOTROS_IMPMOR_CRE:=0; vlOTROS_IVAMOR_CRE:=0;
      vlNETO_CRE:=0;
   end;

   if (PE_Tlimpia=3)or(PE_Tlimpia=5) then
   begin
      vlCAP_IMPBRU_CTE:=0; vlCAP_IMPMOR_CTE:=0; vlCAP_IVAMOR_CTE:=0;
      vlINT_IMPBRU_CTE:=0; vlINT_IMPIVA_CTE:=0; vlINT_IMPMOR_CTE:=0; vlINT_IVAMOR_CTE:=0;
      vlFIN_IMPBRU_CTE:=0; vlFIN_IMPIVA_CTE:=0; vlFIN_IMPMOR_CTE:=0; vlFIN_IVAMOR_CTE:=0;
      vlOTROS_IMPBRU_CTE:=0; vlOTROS_IMPIVA_CTE:=0; vlOTROS_IMPMOR_CTE:=0; vlOTROS_IVAMOR_CTE:=0;
      vlNETO_CTE:=0;
   end;
end;


Function generaConsultaOpeCon(TipoGarantia:integer;
                              TipoAplicRecu:integer;
                              FechaFinal:String
                             ):String;
VAR
   CONCEPTOS, CONCEPTOS2, CONCEPTOS3  :       AplicRecuArray;
   i,j             :       integer;
   SQLopecon       :       String;
   Auxopecon       :       String;
   vlb_rescate     :       boolean;
   vlconcepaux     :       string;

begin
   //Consulta general para la invocación al PL/SQL getConsultaOpeCon
{   SQLopecon :=  ' ,getConsultaOpeCon(cc.id_credito,P_CVE_OPERACION,P_CVE_CONCEPTO, '+
                 ' TO_DATE(P_FECHA_FINAL,'+QuotedStr('dd/mm/yyyy')+'),GARANTIA.NUM_PERIODO,GARANTIA.ID_SOLICITUD) AS P_CAMPO ' + #13 ;
 }
   SQLopecon :=
 ', ( '+
 'SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO ' +
 '  FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX ' +
 ' WHERE 1=1 ' +
 '   AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION ' +
 '   AND CDT.CVE_OPERACION = CT.CVE_OPERACION ' +
 '   AND CT.ID_TRANSACCION = CTX.ID_TRANSACCION ' +
 '   AND CT.ID_TRANS_CANCELA IS NULL ' +
 '   AND CT.SIT_TRANSACCION = ''AC'' ' +
 '   AND CT.ID_CREDITO = CC.ID_CREDITO ' +
 '   AND CT.CVE_OPERACION IN ( P_CVE_OPERACION ) ' +
 '   AND CDT.CVE_CONCEPTO = P_CVE_CONCEPTO ' +
 '   AND CT.F_VALOR <= TO_DATE(P_FECHA_FINAL,''DD/MM/YYYY'') '+
 '   AND ( (CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD) OR  (CTX.ID_SOLICITUD = 0) )' +
 ' ) AS P_CAMPO ' + #13;

   CASE (TipoGarantia) of
            0 : CASE (TipoAplicRecu) of
                    0 : CONCEPTOS := FEGA_APLICACIONES;
                    1 : CONCEPTOS := FEGA_RECUPERACIONES;
                    2 : begin
                           CONCEPTOS  := FEGA_RESCATES;
                           CONCEPTOS2 := FEGA_RESCXREES;
                           CONCEPTOS3 := FEGA_INCOB;
                        end;
                END;
            1:
                CASE (TipoAplicRecu) of
                    0 : CONCEPTOS := PYME_APLICACIONES;
                    1 : CONCEPTOS := PYME_RECUPERACIONES;
                    2 : begin
                           CONCEPTOS  := PYME_RESCATES;
                           CONCEPTOS2 := PYME_RESCXREES;
                           CONCEPTOS3 := PYME_INCOB;
                        end;
                END;
   end;

   Result := '';

   CASE (TipoAplicRecu) of
        0, 1 : vlb_rescate := false;
        2    : vlb_rescate := true;
   END;

   FOR i:=1 to 4 do
   begin
      FOR j := 1 to 4 do
      begin
         IF CONCEPTOS[i] = '' THEN
            Auxopecon :=  ',0 AS P_CAMPO '
         else
         begin
            if not vlb_rescate then vlconcepaux:=QuotedStr(CONCEPTOS[i]);
            if vlb_rescate     then vlconcepaux:=QuotedStr(CONCEPTOS[i]) + ',' + QuotedStr(CONCEPTOS2[i]) + ',' + QuotedStr(CONCEPTOS3[i]);

            Auxopecon := StringReplace(SQLopecon,'P_CVE_OPERACION',vlconcepaux,[rfReplaceAll, rfIgnoreCase]);
            Auxopecon := StringReplace(Auxopecon,'P_CVE_CONCEPTO',QuotedStr(NOMBRES_CONCEPTOPS[j]),[rfReplaceAll, rfIgnoreCase]);
         end;
         Auxopecon := StringReplace(Auxopecon,'P_FECHA_FINAL',QuotedStr(FechaFinal),[rfReplaceAll, rfIgnoreCase]);
         Auxopecon := StringReplace(Auxopecon,'P_CAMPO',NOMBRES_CAMPOS[i] +  NOMBRES_CONCEPTOPS[J],[rfReplaceAll, rfIgnoreCase]);
         Result := Result + AuxOpeCon;
      end;
   end;
end;


Function TQrAplicRecu2.generaConsultaAplicacionesRecuparaciones( IDCredito, IDMoneda, IDAcreditado, cve_producto,
                                                   cve_producto_gpo:string;
                                                   TipoGarantia:integer;
                                                   Tipo, FechaFinal:String
                                                 ) : String;
var
   Auxopecon, Auxcon, AuxTotalApliRecu,
   TAplicaciones,   vAplicaciones,
   TRecuperaciones, vRecuperaciones,
   TRescates, vRescates,
   TApliRecu, vGarantia, vImp : String;
   TipoAplicRecu : Integer;

   vlQry : TQuery;
   vlSQLCad : String;

begin
   {AuxCon :=
            ' (SELECT DISTINCT CT.ID_CREDITO,CTX.ID_SOLICITUD, GA.IMP_APLICADO, GA.IMP_RECUPERADO,CT.ID_PERIODO as NUM_PERIODO '+ #13 +
            '    FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX, '+ #13 +
            ' ( CR_GA_SOL_NAFIN '+ #13 +
            '   UNION '+ #13 +
            '   CR_GA_SOL_FEGA ) GA '+ #13 +
            '   WHERE 1=1 '+ #13 +
            '     AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION '+ #13 +
            '     AND CTX.ID_TRANSACCION = CT.ID_TRANSACCION '+ #13 +
            '     AND CDT.CVE_OPERACION  = CT.CVE_OPERACION '+ #13 +
            '     AND CT.ID_CREDITO      = GA.ID_CREDITO '+ #13 +
            '     AND CTX.ID_SOLICITUD   = GA.ID_SOLICITUD '+ #13 +
            '     AND CT.ID_TRANS_CANCELA IS NULL '+ #13 +
            '     AND CT.SIT_TRANSACCION  = '+QuotedStr('AC')+' '+ #13 +
//            '     AND CT.CVE_OPERACION in ('+QuotedStr('PGCPGP')+','+QuotedStr('PGINGP')+') '+ #13 +
            '     AND CDT.CVE_CONCEPTO in ('+QuotedStr('IMPBRU')+','+QuotedStr('IMPIVA')+','+QuotedStr('IMPMOR')+','+QuotedStr('IVAMOR')+')'+ #13 +
            '     AND CT.F_VALOR <= TO_DATE(P_FECHA_FINAL,'+QuotedStr('DD/MM/YYYY')+')'+ #13 +
            ' )';
       }
   AuxTotalApliRecu :=
            'SELECT ID_CREDITO,SUM(P_APLIRECU) as P_APLIRECU '+ #13 +
            '  FROM (SELECT DISTINCT CT.ID_CREDITO,(CDT.IMP_CONCEPTO) AS P_APLIRECU ,CT.ID_TRANSACCION '+ #13 +
            '          FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX, P_GARANTIA GA '+ #13 +
            '         WHERE 1=1 '+ #13 +
            '           AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION '+ #13 +
            '           AND CTX.ID_TRANSACCION = CT.ID_TRANSACCION '+ #13 +
            '           AND CDT.CVE_OPERACION  = CT.CVE_OPERACION '+ #13 +
            '           AND CT.ID_CREDITO      = GA.ID_CREDITO '+ #13 +
            '           AND ( (CTX.ID_SOLICITUD   = GA.ID_SOLICITUD) OR (CTX.ID_SOLICITUD   = 0) )'+ #13 +   //HAY PAGOS DE COMISION DE PYME QUE NO TIENEN EL ID_SOLICITUD EN CR_XTRANSACCION
            '           AND CT.ID_TRANS_CANCELA IS NULL '+ #13 +
            '           AND CT.SIT_TRANSACCION =' +QuotedStr('AC') + #13 +
            '           AND CT.CVE_OPERACION in (P_OPERACIONES) '+ #13 +
            '           AND CDT.CVE_CONCEPTO in ('+QuotedStr('IMPBRU')+','+QuotedStr('IMPIVA')+','+QuotedStr('IMPMOR')+','+QuotedStr('IVAMOR')+ ')'+#13 +
            '           AND CT.F_VALOR <= TO_DATE(P_FECHA_FINAL,'+QuotedStr('DD/MM/YYYY')+')) GROUP BY ID_CREDITO  ';

   if TipoGarantia = 0 then
        vGarantia := 'CR_GA_SOL_FEGA'
   else
        vGarantia := 'CR_GA_SOL_NAFIN';

   AuxTotalApliRecu := StringReplace(AuxTotalApliRecu,'P_FECHA_FINAL',QuotedStr(FechaFinal),[rfReplaceAll, rfIgnoreCase]);
   AuxTotalApliRecu := StringReplace(AuxTotalApliRecu,'P_GARANTIA',vGarantia,[rfReplaceAll, rfIgnoreCase]);

   if TipoGarantia = 0 then
   Begin
      vAplicaciones   := QuotedStr('PGCPGF')+','+ QuotedStr('PGINGF')+','+QuotedStr('PGCNGF')+','+QuotedStr('PGFNGF');
      vRecuperaciones := QuotedStr('RCCPGF')+','+ QuotedStr('RCINGF')+','+QuotedStr('RCCNGF')+','+QuotedStr('RCFNGF');
      vRescates       := ' ''RTCPGF'',''RTINGF'',''RTFNGF'',''RTCNGF'','+
                         ' ''RSCPGF'',''RSINGF'',''RSFNGF'',''RSCNGF'', '+
                         ' ''INCPGF'',''ININGF'',''INFNGF'',''INCNGF'' ';
   end
   else
   begin
      vAplicaciones   := QuotedStr('PGCPGP')+','+ QuotedStr('PGINGP')+','+QuotedStr('PGFNGP')+','+ QuotedStr('PGCNGP');
      vRecuperaciones := QuotedStr('RCCPGP')+','+ QuotedStr('RCINGP')+','+QuotedStr('RCFNGP')+','+ QuotedStr('RCCNGP');
      vRescates       := ' ''RTCPGP'',''RTINGP'',''RTFNGP'',''RTCNGP'',' +
                         ' ''RSCPGP'',''RSINGP'',''RSFNGP'',''RSCNGP'', ' +
                         ' ''INCPGP'',''ININGP'',''INFNGP'',''INCNGP'' ' ;
   end;

   TAplicaciones := StringReplace(AuxTotalApliRecu,'P_OPERACIONES',vAplicaciones, [rfReplaceAll, rfIgnoreCase]);
   TAplicaciones := StringReplace(TAplicaciones,'P_APLIRECU','IMP_APLICADO', [rfReplaceAll, rfIgnoreCase]);

   TRecuperaciones := StringReplace(AuxTotalApliRecu,'P_OPERACIONES',vRecuperaciones, [rfReplaceAll, rfIgnoreCase]);
   TRecuperaciones := StringReplace(TRecuperaciones,'P_APLIRECU','IMP_RECUPERADO', [rfReplaceAll, rfIgnoreCase]);

   TRescates := StringReplace(AuxTotalApliRecu,'P_OPERACIONES',vRescates, [rfReplaceAll, rfIgnoreCase]);
   TRescates := StringReplace(TRescates,'P_APLIRECU','IMP_RESCATADO', [rfReplaceAll, rfIgnoreCase]);
   

   TApliRecu := ' SELECT ID_CREDITO,IMP_APLICADO, IMP_RECUPERADO, IMP_RESCATADO FROM CR_CREDITO ' + #13 +
                ' LEFT JOIN(' + TAplicaciones   +') USING (ID_CREDITO) ' + #13 +
                ' LEFT JOIN(' + TRecuperaciones +') USING (ID_CREDITO) ' + #13 +
                ' LEFT JOIN(' + TRescates       +') USING (ID_CREDITO) ' + #13 ;


//CONSULTAS PARA OBTENER LA LEYENDA DEL MOVIMIENTO

   vlLeyenda:='-';

   //RESCATES
   vlSQLCad :='SELECT COUNT(*) AS NCOUNT FROM CR_TRANSACCION ' +
              ' WHERE ID_CREDITO = ' +IDCredito+
              '   AND CVE_OPERACION IN (''RTCPGF'', ''RTINGF'', ''RTFNGF'', ''RTCNGF'', ''RTCPGP'', ''RTINGP'', ''RTFNGP'', ''RTCNGP'' ) '+
              '   AND SIT_TRANSACCION=''AC'' '+
              '   AND ID_TRANS_CANCELA IS NULL ';

    vlQry := GetSQLQuery(vlSQLCad, Apli.DataBaseName, Apli.SessionName, True );

    try
      if vlQry <> nil then
      begin
         if vlQry.FieldByName('NCOUNT').asInteger > 0 then
            vlLeyenda:='RESCATES';
      end;
    finally
        if vlQry <> nil then vlQry.free;
    end;

   //DEVOLUCIONES
   vlSQLCad :='SELECT COUNT(*) AS NCOUNT FROM CR_TRANSACCION ' +
              ' WHERE ID_CREDITO = ' +IDCredito+
              '   AND CVE_OPERACION IN (''RSCPGF'', ''RSINGF'', ''RSFNGF'', ''RSCNGF'', ''RSCPGP'', ''RSINGP'', ''RSFNGP'', ''RSCNGP'' ) '+
              '   AND SIT_TRANSACCION=''AC'' '+
              '   AND ID_TRANS_CANCELA IS NULL ';

    vlQry := GetSQLQuery(vlSQLCad, Apli.DataBaseName, Apli.SessionName, True );

    try
      if vlQry <> nil then
      begin
         if vlQry.FieldByName('NCOUNT').asInteger > 0 then
            vlLeyenda:='DEVOL. X RS';
      end;
    finally
        if vlQry <> nil then vlQry.free;
    end;

   //INCOBRABILIDAD
   vlSQLCad :='SELECT COUNT(*) AS NCOUNT FROM CR_TRANSACCION ' +
              ' WHERE ID_CREDITO = ' +IDCredito+
              '   AND CVE_OPERACION IN (''INCPGF'', ''ININGF'', ''INFNGF'', ''INCNGF'', ''INCPGP'', ''ININGP'', ''INFNGP'', ''INCNGP'' ) '+
              '   AND SIT_TRANSACCION=''AC'' '+
              '   AND ID_TRANS_CANCELA IS NULL ';

    vlQry := GetSQLQuery(vlSQLCad, Apli.DataBaseName, Apli.SessionName, True );

    try
      if vlQry <> nil then
      begin
         if vlQry.FieldByName('NCOUNT').asInteger > 0 then
            vlLeyenda:='INCOBRABILIDAD';
      end;
    finally
        if vlQry <> nil then vlQry.free;
    end;


   //1. QUERY PRINCIPAL POR MOVIMIENTO             
   Auxopecon :=
               ' SELECT * ' + #13 +
               '   FROM ( ' + #13 +
               '	   SELECT CO.CVE_MONEDA, ' + #13 +
               '		  (SELECT DESC_MONEDA FROM MONEDA WHERE CVE_MONEDA = CO.CVE_MONEDA) AS DESC_MONEDA, ' + #13 +
               '                  CP.CVE_PRODUCTO_GPO, TO_CHAR(CO.CVE_PRODUCTO_CRE) AS CVE_PRODUCTO, ' + #13 +
               '		  (SELECT DESC_C_PRODUCTO FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CRE=CO.CVE_PRODUCTO_CRE) AS DESC_PRODUCTO, ' + #13 +
               '                  CTO.ID_TITULAR, CTO.NOMB_CONTRATO, CC.ID_CONTRATO, CC.ID_CREDITO, ' + #13 +
//               '                  GARANTIA.NUM_PERIODO, ' + #13 +
//               '                  GARANTIA.ID_SOLICITUD, ' + #13 +
               '        (CASE ' + #13 +
               '           WHEN '+QuotedStr(Tipo)+' = ''APLICACIONES'' THEN GARANTIA.ID_SOLICITUD ' + #13 +
               '           WHEN '+QuotedStr(Tipo)+' = ''RECUPERACIONES'' THEN GARANTIA.ID_SOLICITUD ' + #13 +
               '           WHEN '+QuotedStr(Tipo)+' = ''RESCATES'' THEN 0 ' + #13 +
               '         END) ID_SOLICITUD, ' + #13 +
//               '		   P_F_SOLICITUD AS F_SOLICITUD, ' + #13 +
               '        (CASE ' + #13 +
               '           WHEN '+QuotedStr(Tipo)+' = ''APLICACIONES'' THEN to_char(P_F_SOLICITUD, ''DD/MM/YYYY'') ' + #13 +
               '           WHEN '+QuotedStr(Tipo)+' = ''RECUPERACIONES'' THEN '''' ' + #13 +
               '           WHEN '+QuotedStr(Tipo)+' = ''RESCATES'' THEN '''' ' + #13 +
               '         END) F_SOLICITUD, ' + #13 +

               '        (CASE ' + #13 +
               '           WHEN '+QuotedStr(Tipo)+' = ''APLICACIONES'' THEN ''APLICACIONES'' ' + #13 +
               '           WHEN '+QuotedStr(Tipo)+' = ''RECUPERACIONES'' THEN ''RECUPERACIONES'' ' + #13 +
               '           WHEN '+QuotedStr(Tipo)+' = ''RESCATES'' THEN '''+vlLeyenda+''' ' + #13 +
               '         END) TIPO_DESC, ' + #13 +
               '        '+QuotedStr(Tipo)+' AS TIPO ' + #13 +
               '                  ,TOTALES.IMP_APLICADO ' + #13 +
               '                  ,TOTALES.IMP_RECUPERADO ' + #13 +
               '                  ,TOTALES.IMP_RESCATADO ' + #13 +
               '                   P_CONCEPTOS '  +
               '	     FROM CR_CREDITO CC, CR_CONTRATO CO, CONTRATO CTO, CR_PRODUCTO CP ' + #13 +
               '		  ,P_GARANTIA GARANTIA ' + #13 +
               '                  ,(P_TOTALES)  TOTALES ' + #13 +
               '	    WHERE CC.SIT_CREDITO = '+QuotedStr('AC') + #13 +
               '                  AND EXISTS (SELECT ID_CREDITO FROM P_GARANTIA WHERE ID_CREDITO = CC.ID_CREDITO) ' + #13 +
               '		  AND CO.ID_CONTRATO = CC.ID_CONTRATO ' + #13 +
               '		  AND CTO.ID_CONTRATO = CC.ID_CONTRATO ' + #13 +
               '		  AND TOTALES.ID_CREDITO = CC.ID_CREDITO ' + #13 +
               '		  AND GARANTIA.ID_CREDITO = CC.ID_CREDITO ' + #13 +
               '                  AND CO.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE ' + #13 +
               '   --********************CREDITO********************* ' + #13 +
               '	          --P_ID_CREDITO ' + #13 +
               '   --********************MONEDA********************** ' + #13 +
               '                  --P_ID_MONEDA ' + #13 +
               '   --********************ACREDITADO****************** ' + #13 +
               '                  --P_ID_ACREDITADO ' + #13 +
               '   --********************PRODUCTO******************** ' + #13 +
               '                  --P_PRODUCTO ' + #13 +
               '   --********************GRUPO_PRODUCTO************** ' + #13 +
               '                  --P_CVE_PRODUCTO_GPO ' + #13 +
               '   --************************************************ ' + #13 +
               '        ) ' + #13 +
               '   WHERE (CAP_IMPBRU > 0) OR (CAP_IMPIVA> 0) OR (CAP_IMPMOR > 0) OR  (CAP_IVAMOR > 0) OR ' + #13 +
               '	 (INT_IMPBRU > 0) OR (INT_IMPIVA> 0) OR (INT_IMPMOR > 0) OR  (INT_IVAMOR > 0) OR ' + #13 +
               '	 (FIN_IMPBRU > 0) OR (FIN_IMPIVA> 0) OR (FIN_IMPMOR > 0) OR  (FIN_IVAMOR > 0) OR ' + #13 +
               '	 (OTROS_IMPBRU > 0) OR (OTROS_IMPIVA> 0) OR (OTROS_IMPMOR > 0) OR  (OTROS_IVAMOR > 0) ';

   if Tipo = 'APLICACIONES'   then TipoAplicRecu := 0;
   if Tipo = 'RECUPERACIONES' then TipoAplicRecu := 1;
   if Tipo = 'RESCATES'       then TipoAplicRecu := 2;

   Auxopecon := StringReplace(Auxopecon,'P_CONCEPTOS',generaConsultaOpeCon(TipoGarantia, TipoAplicRecu, FechaFinal), [rfReplaceAll, rfIgnoreCase]);

   Auxopecon := StringReplace(Auxopecon,'P_TOTALES',TApliRecu, [rfReplaceAll, rfIgnoreCase]);


   if IDCredito <> '' then
        Auxopecon := StringReplace(Auxopecon,'--P_ID_CREDITO','AND CC.ID_CREDITO ='+QuotedStr(IDCredito),[rfReplaceAll, rfIgnoreCase]);
   if IDmoneda <> '' then
        Auxopecon := StringReplace(Auxopecon,'--P_ID_MONEDA','AND CO.CVE_MONEDA = '+QuotedStr(IDMoneda),[rfReplaceAll, rfIgnoreCase]);
   if TipoGarantia = 0 then
   begin
      Auxopecon := StringReplace(Auxopecon,'P_GARANTIA','CR_GA_SOL_FEGA',[rfReplaceAll, rfIgnoreCase]);

      //        Auxopecon := StringReplace(Auxopecon,'P_F_SOLICITUD',QuotedStr('N.A.'),[rfReplaceAll, rfIgnoreCase]);
      //HERJA - LAS GARANTIAS FEGAS SI TIENEN FECHA DE SOLICITUD - NOTA: HAY QUE VALIDAR EL NOMBRE DEL CAMPO
      Auxopecon := StringReplace(Auxopecon,'P_F_SOLICITUD','F_PAGO',[rfReplaceAll, rfIgnoreCase]);
   end
   else
   Begin
      Auxopecon := StringReplace(Auxopecon,'P_GARANTIA','CR_GA_SOL_NAFIN',[rfReplaceAll, rfIgnoreCase]);
    //   Auxopecon := StringReplace(Auxopecon,'P_GARANTIA',AuxCon,[rfReplaceAll, rfIgnoreCase]);
      Auxopecon := StringReplace(Auxopecon,'P_FECHA_FINAL',QuotedStr(FechaFinal),[rfReplaceAll, rfIgnoreCase]);
      Auxopecon := StringReplace(Auxopecon,'P_F_SOLICITUD','GARANTIA.F_ALTA',[rfReplaceAll, rfIgnoreCase]);
   End;

   if IDAcreditado <> '' then
        Auxopecon := StringReplace(Auxopecon,'--P_ID_ACREDITADO','AND CTO.ID_TITULAR = '+QuotedStr(idAcreditado),[rfReplaceAll, rfIgnoreCase]);

   if cve_producto_gpo <> '' then
   begin
      //Auxopecon := StringReplace(Auxopecon,'--P_PRODUCTO_GPO_CAMPO',',CP.CVE_PRODUCTO_GPO',[rfReplaceAll, rfIgnoreCase]);
      Auxopecon := StringReplace(Auxopecon,'--P_CVE_PRODUCTO_GPO','AND CP.CVE_PRODUCTO_GPO = '+QuotedStr(cve_producto_gpo),[rfReplaceAll, rfIgnoreCase]);
      //Auxopecon := StringReplace(Auxopecon,'--P_CR_PRODUCTO',',CR_PRODUCTO CP',[rfReplaceAll, rfIgnoreCase]);
   end;
   if CVE_producto <> '' then
      Auxopecon := StringReplace(Auxopecon,'--P_PRODUCTO','AND CO.CVE_PRODUCTO_CRE = '+QuotedStr(cve_producto),[rfReplaceAll, rfIgnoreCase]);

   Result := Auxopecon;
end;


Procedure RepAplicRecu  ( sF_Vencimiento,
                       sProducto,sMoneda,
                       sAcreditado,
                       sCesion,sGpoProd,sNbrArch:String;
                       iGarantia: Integer;
                       pAPli     : TInterApli;
                       pPreview  : Boolean
                       );

Var
    QrAplicRecu: TQrAplicRecu2;
    VLTitulo : String;
    Preview     : TIntQRPreview;
    vltgarantia : string;

Begin
    vlF_Vencimiento:=sF_Vencimiento;
    VLTitulo := '';
    QrAplicRecu:=TQrAplicRecu2.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrAplicRecu);
    Try
        QrAplicRecu.QRInterEncabezado1.Apli:=pApli;
        QrAplicRecu.Apli := pAPli;

        QrAplicRecu.VLF_Vencimiento := sF_Vencimiento;

        sArchivo:= sNbrArch;

        if iGarantia = 0 then vltgarantia:='FEGA';
        if iGarantia = 1 then vltgarantia:='PYME';

        QrAplicRecu.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrAplicRecu.QRInterEncabezado1.NomReporte:='IntQrAplicRecu2';
        QrAplicRecu.QRInterEncabezado1.Titulo1:='Reporte de Movimientos de Garantías '+vltgarantia+' al '+ sF_Vencimiento;

        Inicializa_Variables(5);

        If (Trim(sProducto)<>'') Then
            VLTitulo := VLTitulo + ' Por Producto';
        If (Trim(sMoneda)<>'') Then
            VLTitulo := VLTitulo + ' Por Moneda';
        If (Trim(sAcreditado)<>'') Then
            VLTitulo := VLTitulo + ' Por Acreditado';
        If (Trim(sCesion)<>'') Then
            VLTitulo := VLTitulo + ' Por Disposición';

        QrAplicRecu.QRInterEncabezado1.Titulo2 := VLTitulo;

        QrAplicRecu.qyAplicRecu.DatabaseName := pApli.DataBaseName;
        QrAplicRecu.qyAplicRecu.SessionName := pApli.SessionName;

        QrAplicRecu.qyAplicRecu.Active:=False;
        QrAplicRecu.qyAplicRecu.SQL.Text:= QrAplicRecu.FormaQuery(sF_Vencimiento,sProducto,sMoneda,
                                                            sAcreditado,
                                                            sCesion,sGpoProd,
                                                            iGarantia);
        QrAplicRecu.qyAplicRecu.SQL.SaveToFile('c:\IntQrAplicRecu2.txt');


        if vlLeyenda='RESCATES'       THEN QrAplicRecu.QRLabel5.Caption:='Total Rescatado: ' ;
        if vlLeyenda='DEVOL. X RS'    THEN QrAplicRecu.QRLabel5.Caption:='Total Devuelto: ' ;
        if vlLeyenda='INCOBRABILIDAD' THEN QrAplicRecu.QRLabel5.Caption:='Total x Incob.: ' ;

        QrAplicRecu.qyAplicRecu.Active:=True;

        //HERJA
        vlmaxlin:=0;
        vlinclin:=0;
        vlmaxlin:=QrAplicRecu.qyAplicRecu.RecordCount;

         If Trim(sArchivo)<>'' Then
         Begin
            B_1ARCH:=FALSE;
            AssignFile(F, sArchivo);
            Rewrite(F);
            Writeln(F, QrAplicRecu.QRInterEncabezado1.Titulo1+ #09 );
            Writeln(F,  #09 );
            Writeln(F,
'TIPO'+ #09 +
'CVE_MONEDA'+ #09 +
'DESC_MONEDA'+ #09 +
'CVE_PRODUCTO_GPO'+ #09 +
'CVE_PRODUCTO'+ #09 +
'DESC_PRODUCTO'+ #09 +
'ID_TITULAR'+ #09 +
'NOMB_CONTRATO'+ #09 +
'ID_CONTRATO'+ #09 +
'ID_CREDITO'+ #09 +
//'NUM_PERIODO'+ #09 +
'ID_SOLICITUD'+ #09 +
'F_SOLICITUD'+ #09 +
'CAP_IMPBRU'+ #09 +
'CAP_IMPIVA'+ #09 +
'CAP_IMPMOR'+ #09 +
'CAP_IVAMOR'+ #09 +
'INT_IMPBRU'+ #09 +
'INT_IMPIVA'+ #09 +
'INT_IMPMOR'+ #09 +
'INT_IVAMOR'+ #09 +
'FIN_IMPBRU'+ #09 +
'FIN_IMPIVA'+ #09 +
'FIN_IMPMOR'+ #09 +
'FIN_IVAMOR'+ #09 +
'OTROS_IMPBRU'+ #09 +
'OTROS_IMPIVA'+ #09 +
'OTROS_IMPMOR'+ #09 +
'OTROS_IVAMOR'
              );
      End;

        If pPreview Then
            QrAplicRecu.Preview
        Else
            QrAplicRecu.Print;

    Finally

      If Trim(sArchivo)<>'' Then Begin
         CloseFile(F);
      End;
    
      QrAplicRecu.free;
      If Assigned(Preview) Then Preview.Free;
    End;
end;


Function TQrAplicRecu2.FormaQuery(sF_Vencimiento,sProducto,sMoneda,
                           sAcreditado,
                           sCesion,sGpoProd : String;
                           iGarantia: Integer) : String;

begin

  result := 'SELECT * FROM(' +
        generaConsultaAplicacionesRecuparaciones(
        sCesion,
        sMoneda,
        sAcreditado,
        sProducto,
        sGpoProd,
        iGarantia,
        'APLICACIONES',
        sF_Vencimiento
        ) +
        ' UNION '+
        generaConsultaAplicacionesRecuparaciones(
        sCesion,
        sMoneda,
        sAcreditado,
        sProducto,
        sGpoProd,
        iGarantia,
        'RECUPERACIONES',
        sF_Vencimiento
        ) +
        ' UNION '+
        generaConsultaAplicacionesRecuparaciones(
        sCesion,
        sMoneda,
        sAcreditado,
        sProducto,
        sGpoProd,
        iGarantia,
        'RESCATES',
        sF_Vencimiento
        ) +
') ORDER BY ' + #13 +
           ' CVE_MONEDA, ' + #13 +
           ' CVE_PRODUCTO_GPO, ' + #13 +
           ' CVE_PRODUCTO, ' + #13 +
           ' ID_TITULAR, ' + #13 +
           ' NOMB_CONTRATO, ' + #13 +
           ' ID_CONTRATO, ' + #13 +
           ' ID_CREDITO, ' + #13 +
           ' TIPO, ' + #13 +
//           ' NUM_PERIODO, ' + #13 +
           ' ID_SOLICITUD ';
end;

procedure TQrAplicRecu2.QRBand1BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
     if (qyAplicRecuTIPO.AsString = 'APLICACIONES') then
     begin
        vlCAP_IMPBRU_CRE:= vlCAP_IMPBRU_CRE + qyAplicRecu.FieldByName('CAP_IMPBRU').AsFloat;
        vlCAP_IMPMOR_CRE:= vlCAP_IMPMOR_CRE + qyAplicRecu.FieldByName('CAP_IMPMOR').AsFloat;
        vlCAP_IVAMOR_CRE:= vlCAP_IVAMOR_CRE + qyAplicRecu.FieldByName('CAP_IVAMOR').AsFloat;
        vlINT_IMPBRU_CRE:= vlINT_IMPBRU_CRE + qyAplicRecu.FieldByName('INT_IMPBRU').AsFloat;
        vlINT_IMPIVA_CRE:= vlINT_IMPIVA_CRE + qyAplicRecu.FieldByName('INT_IMPIVA').AsFloat;
        vlINT_IMPMOR_CRE:= vlINT_IMPMOR_CRE + qyAplicRecu.FieldByName('INT_IMPMOR').AsFloat;
        vlINT_IVAMOR_CRE:= vlINT_IVAMOR_CRE + qyAplicRecu.FieldByName('INT_IVAMOR').AsFloat;
        vlFIN_IMPBRU_CRE:= vlFIN_IMPBRU_CRE + qyAplicRecu.FieldByName('FIN_IMPBRU').AsFloat;
        vlFIN_IMPIVA_CRE:= vlFIN_IMPIVA_CRE + qyAplicRecu.FieldByName('FIN_IMPIVA').AsFloat;
        vlFIN_IMPMOR_CRE:= vlFIN_IMPMOR_CRE + qyAplicRecu.FieldByName('FIN_IMPMOR').AsFloat;
        vlFIN_IVAMOR_CRE:= vlFIN_IVAMOR_CRE + qyAplicRecu.FieldByName('FIN_IVAMOR').AsFloat;
        vlOTROS_IMPBRU_CRE:= vlOTROS_IMPBRU_CRE + qyAplicRecu.FieldByName('OTROS_IMPBRU').AsFloat;
        vlOTROS_IMPIVA_CRE:= vlOTROS_IMPIVA_CRE + qyAplicRecu.FieldByName('OTROS_IMPIVA').AsFloat;
        vlOTROS_IMPMOR_CRE:= vlOTROS_IMPMOR_CRE + qyAplicRecu.FieldByName('OTROS_IMPMOR').AsFloat;
        vlOTROS_IVAMOR_CRE:= vlOTROS_IVAMOR_CRE + qyAplicRecu.FieldByName('OTROS_IVAMOR').AsFloat;

        vlCAP_IMPBRU_CTE:= vlCAP_IMPBRU_CTE + qyAplicRecu.FieldByName('CAP_IMPBRU').AsFloat;
        vlCAP_IMPMOR_CTE:= vlCAP_IMPMOR_CTE + qyAplicRecu.FieldByName('CAP_IMPMOR').AsFloat;
        vlCAP_IVAMOR_CTE:= vlCAP_IVAMOR_CTE + qyAplicRecu.FieldByName('CAP_IVAMOR').AsFloat;
        vlINT_IMPBRU_CTE:= vlINT_IMPBRU_CTE + qyAplicRecu.FieldByName('INT_IMPBRU').AsFloat;
        vlINT_IMPIVA_CTE:= vlINT_IMPIVA_CTE + qyAplicRecu.FieldByName('INT_IMPIVA').AsFloat;
        vlINT_IMPMOR_CTE:= vlINT_IMPMOR_CTE + qyAplicRecu.FieldByName('INT_IMPMOR').AsFloat;
        vlINT_IVAMOR_CTE:= vlINT_IVAMOR_CTE + qyAplicRecu.FieldByName('INT_IVAMOR').AsFloat;
        vlFIN_IMPBRU_CTE:= vlFIN_IMPBRU_CTE + qyAplicRecu.FieldByName('FIN_IMPBRU').AsFloat;
        vlFIN_IMPIVA_CTE:= vlFIN_IMPIVA_CTE + qyAplicRecu.FieldByName('FIN_IMPIVA').AsFloat;
        vlFIN_IMPMOR_CTE:= vlFIN_IMPMOR_CTE + qyAplicRecu.FieldByName('FIN_IMPMOR').AsFloat;
        vlFIN_IVAMOR_CTE:= vlFIN_IVAMOR_CTE + qyAplicRecu.FieldByName('FIN_IVAMOR').AsFloat;
        vlOTROS_IMPBRU_CTE:= vlOTROS_IMPBRU_CTE + qyAplicRecu.FieldByName('OTROS_IMPBRU').AsFloat;
        vlOTROS_IMPIVA_CTE:= vlOTROS_IMPIVA_CTE + qyAplicRecu.FieldByName('OTROS_IMPIVA').AsFloat;
        vlOTROS_IMPMOR_CTE:= vlOTROS_IMPMOR_CTE + qyAplicRecu.FieldByName('OTROS_IMPMOR').AsFloat;
        vlOTROS_IVAMOR_CTE:= vlOTROS_IVAMOR_CTE + qyAplicRecu.FieldByName('OTROS_IVAMOR').AsFloat;
     end
     else
     if (qyAplicRecuTIPO.AsString = 'RECUPERACIONES')OR(qyAplicRecuTIPO.AsString = 'RESCATES') then
     begin
        vlCAP_IMPBRU_CRE:= vlCAP_IMPBRU_CRE - qyAplicRecu.FieldByName('CAP_IMPBRU').AsFloat;
        vlCAP_IMPMOR_CRE:= vlCAP_IMPMOR_CRE - qyAplicRecu.FieldByName('CAP_IMPMOR').AsFloat;
        vlCAP_IVAMOR_CRE:= vlCAP_IVAMOR_CRE - qyAplicRecu.FieldByName('CAP_IVAMOR').AsFloat;
        vlINT_IMPBRU_CRE:= vlINT_IMPBRU_CRE - qyAplicRecu.FieldByName('INT_IMPBRU').AsFloat;
        vlINT_IMPIVA_CRE:= vlINT_IMPIVA_CRE - qyAplicRecu.FieldByName('INT_IMPIVA').AsFloat;
        vlINT_IMPMOR_CRE:= vlINT_IMPMOR_CRE - qyAplicRecu.FieldByName('INT_IMPMOR').AsFloat;
        vlINT_IVAMOR_CRE:= vlINT_IVAMOR_CRE - qyAplicRecu.FieldByName('INT_IVAMOR').AsFloat;
        vlFIN_IMPBRU_CRE:= vlFIN_IMPBRU_CRE - qyAplicRecu.FieldByName('FIN_IMPBRU').AsFloat;
        vlFIN_IMPIVA_CRE:= vlFIN_IMPIVA_CRE - qyAplicRecu.FieldByName('FIN_IMPIVA').AsFloat;
        vlFIN_IMPMOR_CRE:= vlFIN_IMPMOR_CRE - qyAplicRecu.FieldByName('FIN_IMPMOR').AsFloat;
        vlFIN_IVAMOR_CRE:= vlFIN_IVAMOR_CRE - qyAplicRecu.FieldByName('FIN_IVAMOR').AsFloat;
        vlOTROS_IMPBRU_CRE:= vlOTROS_IMPBRU_CRE - qyAplicRecu.FieldByName('OTROS_IMPBRU').AsFloat;
        vlOTROS_IMPIVA_CRE:= vlOTROS_IMPIVA_CRE - qyAplicRecu.FieldByName('OTROS_IMPIVA').AsFloat;
        vlOTROS_IMPMOR_CRE:= vlOTROS_IMPMOR_CRE - qyAplicRecu.FieldByName('OTROS_IMPMOR').AsFloat;
        vlOTROS_IVAMOR_CRE:= vlOTROS_IVAMOR_CRE - qyAplicRecu.FieldByName('OTROS_IVAMOR').AsFloat;

        vlCAP_IMPBRU_CTE:= vlCAP_IMPBRU_CTE - qyAplicRecu.FieldByName('CAP_IMPBRU').AsFloat;
        vlCAP_IMPMOR_CTE:= vlCAP_IMPMOR_CTE - qyAplicRecu.FieldByName('CAP_IMPMOR').AsFloat;
        vlCAP_IVAMOR_CTE:= vlCAP_IVAMOR_CTE - qyAplicRecu.FieldByName('CAP_IVAMOR').AsFloat;
        vlINT_IMPBRU_CTE:= vlINT_IMPBRU_CTE - qyAplicRecu.FieldByName('INT_IMPBRU').AsFloat;
        vlINT_IMPIVA_CTE:= vlINT_IMPIVA_CTE - qyAplicRecu.FieldByName('INT_IMPIVA').AsFloat;
        vlINT_IMPMOR_CTE:= vlINT_IMPMOR_CTE - qyAplicRecu.FieldByName('INT_IMPMOR').AsFloat;
        vlINT_IVAMOR_CTE:= vlINT_IVAMOR_CTE - qyAplicRecu.FieldByName('INT_IVAMOR').AsFloat;
        vlFIN_IMPBRU_CTE:= vlFIN_IMPBRU_CTE - qyAplicRecu.FieldByName('FIN_IMPBRU').AsFloat;
        vlFIN_IMPIVA_CTE:= vlFIN_IMPIVA_CTE - qyAplicRecu.FieldByName('FIN_IMPIVA').AsFloat;
        vlFIN_IMPMOR_CTE:= vlFIN_IMPMOR_CTE - qyAplicRecu.FieldByName('FIN_IMPMOR').AsFloat;
        vlFIN_IVAMOR_CTE:= vlFIN_IVAMOR_CTE - qyAplicRecu.FieldByName('FIN_IVAMOR').AsFloat;
        vlOTROS_IMPBRU_CTE:= vlOTROS_IMPBRU_CTE - qyAplicRecu.FieldByName('OTROS_IMPBRU').AsFloat;
        vlOTROS_IMPIVA_CTE:= vlOTROS_IMPIVA_CTE - qyAplicRecu.FieldByName('OTROS_IMPIVA').AsFloat;
        vlOTROS_IMPMOR_CTE:= vlOTROS_IMPMOR_CTE - qyAplicRecu.FieldByName('OTROS_IMPMOR').AsFloat;
        vlOTROS_IVAMOR_CTE:= vlOTROS_IVAMOR_CTE - qyAplicRecu.FieldByName('OTROS_IVAMOR').AsFloat;
     end;

     if (Trim(qyAplicRecuTIPO.AsString) <> '') then
     begin
        total_por_Movto := total_por_Movto + qyAplicRecu.FieldValues['CAP_IMPBRU']+
        qyAplicRecu.FieldValues['CAP_IMPIVA']+
        qyAplicRecu.FieldValues['CAP_IMPMOR']+
        qyAplicRecu.FieldValues['CAP_IVAMOR']+
        qyAplicRecu.FieldValues['INT_IMPBRU']+
        qyAplicRecu.FieldValues['INT_IMPIVA']+
        qyAplicRecu.FieldValues['INT_IMPMOR']+
        qyAplicRecu.FieldValues['INT_IVAMOR']+
        qyAplicRecu.FieldValues['FIN_IMPBRU']+
        qyAplicRecu.FieldValues['FIN_IMPIVA']+
        qyAplicRecu.FieldValues['FIN_IMPMOR']+
        qyAplicRecu.FieldValues['FIN_IVAMOR']+
        qyAplicRecu.FieldValues['OTROS_IMPBRU']+
        qyAplicRecu.FieldValues['OTROS_IMPIVA']+
        qyAplicRecu.FieldValues['OTROS_IMPMOR']+
        qyAplicRecu.FieldValues['OTROS_IVAMOR'];
     end;


     If (sArchivo <>'')AND(B_1ARCH=FALSE) Then Begin
         Writeln(F,
              qyAplicRecu.FieldByName('TIPO_DESC').AsString + #09 +
              qyAplicRecu.FieldByName('CVE_MONEDA').AsString + #09 +
              qyAplicRecu.FieldByName('DESC_MONEDA').AsString + #09 +
              qyAplicRecu.FieldByName('CVE_PRODUCTO_GPO').AsString + #09 +
              qyAplicRecu.FieldByName('DESC_PRODUCTO').AsString + #09 +
              qyAplicRecu.FieldByName('ID_TITULAR').AsString + #09 +
              qyAplicRecu.FieldByName('NOMB_CONTRATO').AsString + #09 +
              qyAplicRecu.FieldByName('ID_CONTRATO').AsString + #09 +
              qyAplicRecu.FieldByName('ID_CREDITO').AsString + #09 +
//              qyAplicRecu.FieldByName('NUM_PERIODO').AsString + #09 +
              qyAplicRecu.FieldByName('ID_SOLICITUD').AsString + #09 +
              qyAplicRecu.FieldByName('F_SOLICITUD').AsString + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyAplicRecu.FieldByName('CAP_IMPBRU').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyAplicRecu.FieldByName('CAP_IMPIVA').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyAplicRecu.FieldByName('CAP_IMPMOR').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyAplicRecu.FieldByName('CAP_IVAMOR').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyAplicRecu.FieldByName('INT_IMPBRU').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyAplicRecu.FieldByName('INT_IMPIVA').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyAplicRecu.FieldByName('INT_IMPMOR').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyAplicRecu.FieldByName('INT_IVAMOR').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyAplicRecu.FieldByName('FIN_IMPBRU').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyAplicRecu.FieldByName('FIN_IMPIVA').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyAplicRecu.FieldByName('FIN_IMPMOR').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyAplicRecu.FieldByName('FIN_IVAMOR').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyAplicRecu.FieldByName('OTROS_IMPBRU').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyAplicRecu.FieldByName('OTROS_IMPIVA').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyAplicRecu.FieldByName('OTROS_IMPMOR').AsFloat) + #09 +
              FormatFloat('###,###,###,###,###,##0.00',qyAplicRecu.FieldByName('OTROS_IVAMOR').AsFloat)
              );
              vlinclin:=vlinclin+1
        end;
   IF vlinclin=vlmaxlin THEN B_1ARCH:=TRUE;
end;

procedure TQrAplicRecu2.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   Inicializa_Variables(5);
end;

procedure TQrAplicRecu2.QRFooterCesionBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRL_CAP_IMPBRU_CRE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCAP_IMPBRU_CRE);
   QRL_CAP_IMPMOR_CRE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCAP_IMPMOR_CRE);
   QRL_CAP_IVAMOR_CRE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCAP_IVAMOR_CRE);

   QRL_INT_IMPBRU_CRE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINT_IMPBRU_CRE);
   QRL_INT_IMPIVA_CRE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINT_IMPIVA_CRE);
//   QRL_INT_IMPMOR_CRE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINT_IMPMOR_CRE);
//   QRL_INT_IVAMOR_CRE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINT_IVAMOR_CRE);

   QRL_FIN_IMPBRU_CRE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlFIN_IMPBRU_CRE);
   QRL_FIN_IMPIVA_CRE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlFIN_IMPIVA_CRE);
   QRL_FIN_IMPMOR_CRE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlFIN_IMPMOR_CRE);
   QRL_FIN_IVAMOR_CRE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlFIN_IVAMOR_CRE);

   QRL_OTROS_IMPBRU_CRE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlOTROS_IMPBRU_CRE);
   QRL_OTROS_IMPIVA_CRE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlOTROS_IMPIVA_CRE);
   QRL_OTROS_IMPMOR_CRE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlOTROS_IMPMOR_CRE);
   QRL_OTROS_IVAMOR_CRE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlOTROS_IVAMOR_CRE);

   vlNETO_CRE:= vlCAP_IMPBRU_CRE + vlCAP_IMPMOR_CRE + vlCAP_IVAMOR_CRE + vlINT_IMPBRU_CRE + vlINT_IMPIVA_CRE +
                vlFIN_IMPBRU_CRE + vlFIN_IMPIVA_CRE + vlFIN_IMPMOR_CRE + vlFIN_IVAMOR_CRE +
                vlOTROS_IMPBRU_CRE + vlOTROS_IMPIVA_CRE + vlOTROS_IMPMOR_CRE + vlOTROS_IVAMOR_CRE;

   QRL_NETO_CRE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlNETO_CRE);

   Inicializa_Variables(2);
end;

procedure TQrAplicRecu2.QRFooterClienteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRL_CAP_IMPBRU_CTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCAP_IMPBRU_CTE);
   QRL_CAP_IMPMOR_CTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCAP_IMPMOR_CTE);
   QRL_CAP_IVAMOR_CTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlCAP_IVAMOR_CTE);

   QRL_INT_IMPBRU_CTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINT_IMPBRU_CTE);
   QRL_INT_IMPIVA_CTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINT_IMPIVA_CTE);
//   QRL_INT_IMPMOR_CTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINT_IMPMOR_CTE);
//   QRL_INT_IVAMOR_CTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlINT_IVAMOR_CTE);

   QRL_FIN_IMPBRU_CTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlFIN_IMPBRU_CTE);
   QRL_FIN_IMPIVA_CTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlFIN_IMPIVA_CTE);
   QRL_FIN_IMPMOR_CTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlFIN_IMPMOR_CTE);
   QRL_FIN_IVAMOR_CTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlFIN_IVAMOR_CTE);

   QRL_OTROS_IMPBRU_CTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlOTROS_IMPBRU_CTE);
   QRL_OTROS_IMPIVA_CTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlOTROS_IMPIVA_CTE);
   QRL_OTROS_IMPMOR_CTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlOTROS_IMPMOR_CTE);
   QRL_OTROS_IVAMOR_CTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlOTROS_IVAMOR_CTE);

   vlNETO_CTE:= vlCAP_IMPBRU_CTE + vlCAP_IMPMOR_CTE + vlCAP_IVAMOR_CTE + vlINT_IMPBRU_CTE + vlINT_IMPIVA_CTE +
                vlFIN_IMPBRU_CTE + vlFIN_IMPIVA_CTE + vlFIN_IMPMOR_CTE + vlFIN_IVAMOR_CTE +
                vlOTROS_IMPBRU_CTE + vlOTROS_IMPIVA_CTE + vlOTROS_IMPMOR_CTE + vlOTROS_IVAMOR_CTE;

   QRL_NETO_CTE.Caption:= FormatFloat('###,###,###,###,###,##0.00',vlNETO_CTE);

   Inicializa_Variables(3);
end;

procedure TQrAplicRecu2.QRBFTIPOBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   Inicializa_Variables(1);
   totalMovto.Caption :=  FormatFloat('###,###,###,###,###,##0.00',total_por_movto);
end;

procedure TQrAplicRecu2.QRBFTIPOAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   total_por_Movto := 0;
end;

procedure TQrAplicRecu2.QRGroupCesionAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   total_por_Movto := 0
end;

end.
