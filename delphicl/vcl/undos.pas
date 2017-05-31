{
 Sistema: Sistema de ventanilla bancaria
 Fecha de Inicio: 17-Ene-97
 Función forma: Data Module del sistema de ventanilla bancaria
 Desarrollo por: César Alejandro Rebollar Trejo
 Modifico:
 Fecha de Modificación:
 Comentarios:
 Variables globales:
}
//ROUY4095 10abr07   Se indentifica Usuario en Ventanilla y se validan Operaciones en Efectivo por 3000 USD

unit UnDos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB, Wwtable, Wwdatsrc, Wwintl, Wwquery, wwstorep;

type
  TdmDos = class(TDataModule)
    wwdsPosicion: TwwDataSource;
    wwtPosicion: TwwTable;
    wwtPosicionCVE_INST_CAJA: TStringField;
    wwtPosicionID_SUCURSAL: TFloatField;
    wwtPosicionID_CAJA: TFloatField;
    wwtPosicionF_POSICION: TDateTimeField;
    wwtPosicionIMP_DEPO_REAL: TFloatField;
    wwtPosicionIMP_DEPO_VIRT: TFloatField;
    wwtPosicionIMP_ENTR_REAL: TFloatField;
    wwtPosicionIMP_ENTR_VIRT: TFloatField;
    wwtPosicionIMP_RETI_REAL: TFloatField;
    wwtPosicionIMP_RETI_VIRT: TFloatField;
    wwtPosicionIMP_SALI_REAL: TFloatField;
    wwtPosicionIMP_SALI_VIRT: TFloatField;
    wwtPosicionNUM_DEPO_REAL: TFloatField;
    wwtPosicionNUM_DEPO_VIRT: TFloatField;
    wwtPosicionNUM_ENTR_REAL: TFloatField;
    wwtPosicionNUM_ENTR_VIRT: TFloatField;
    wwtPosicionNUM_RETI_REAL: TFloatField;
    wwtPosicionNUM_RETI_VIRT: TFloatField;
    wwtPosicionNUM_SALI_REAL: TFloatField;
    wwtPosicionNUM_SALI_VIRT: TFloatField;
    wwtPosicionSDO_INICIO: TFloatField;
    wwtPosicionSDO_REAL: TFloatField;
    wwtPosicionSDO_VIRT: TFloatField;
    wwtPosicionlkDescInst: TStringField;
    wwdsCaja: TwwDataSource;
    wwtCaja: TwwTable;
    wwtCajaID_SUCURSAL: TFloatField;
    wwtCajaID_CAJA: TFloatField;
    wwtCajaCVE_TIPO_CAJA: TStringField;
    wwtCajaCVE_USUARIO: TStringField;
    wwtCajaFH_SITUACION: TDateTimeField;
    wwtCajaID_EMPRESA: TFloatField;
    wwtCajaNUM_APERTURAS: TFloatField;
    wwtCajaSIT_CAJA: TStringField;
    wwtPosicionlkMaxPos: TCurrencyField;
    wwtPosicionlkMinPos: TCurrencyField;
    wwdsSucursal: TwwDataSource;
    wwtSucursal: TwwTable;
    wwtSucursalID_SUCURSAL: TFloatField;
    wwtSucursalF_LIQUIDACION: TDateTimeField;
    wwtSucursalF_OPERACION: TDateTimeField;
    wwtSucursalID_CENCO: TFloatField;
    wwtSucursalID_CTO_CHCA: TFloatField;
    wwtSucursalID_ENTIDAD: TFloatField;
    wwtSucursalNUM_CAJAS: TFloatField;
    wwtSucursalSIT_SUCURSAL: TStringField;
    wwtSucursallkNombreSucursal: TStringField;
    wwdsInstrumento: TwwDataSource;
    wwtInstrumento: TwwTable;
    wwdsInstXCaja: TwwDataSource;
    wwtInstXCaja: TwwTable;
    wwtInstXCajaID_SUCURSAL: TFloatField;
    wwtInstXCajaID_CAJA: TFloatField;
    wwtInstXCajaCVE_INST_CAJA: TStringField;
    wwtInstXCajaFH_SITUACION: TDateTimeField;
    wwtInstXCajaMAX_POS_SALDO: TFloatField;
    wwtInstXCajaMAX_X_OPER: TFloatField;
    wwtInstXCajaMIN_POS_SALDO: TFloatField;
    wwtInstXCajaSIT_INST_X_CAJA: TStringField;
    wwtInstrumentoCVE_INST_CAJA: TStringField;
    wwtInstrumentoCVE_MONEDA: TFloatField;
    wwtInstrumentoDESC_INST_CAJA: TStringField;
    wwtInstrumentoSIT_INST_CAJA: TStringField;
    wwtInstXCajalkInstrumento: TStringField;
    wwdsOperacion: TwwDataSource;
    wwtOperacion: TwwTable;
    wwtOperacionCVE_OPER_CAJA: TStringField;
    wwtOperacionB_AFEC_DV: TStringField;
    wwtOperacionB_APL_CAJA: TStringField;
    wwtOperacionB_GEN_GRUPO: TStringField;
    wwtOperacionB_REC_CAJA: TStringField;
    wwtOperacionB_REQ_AUTORIZACI: TStringField;
    wwtOperacionB_REQ_INSTRUMENT: TStringField;
    wwtOperacionB_VALIDA_REFER: TStringField;
    wwtOperacionB_VALIDA_SALDO: TStringField;
    wwtOperacionCVE_AF_IMPDEP: TStringField;
    wwtOperacionCVE_AF_IMPENT: TStringField;
    wwtOperacionCVE_AF_IMPRET: TStringField;
    wwtOperacionCVE_AF_IMPSAL: TStringField;
    wwtOperacionCVE_AF_NUMDEP: TStringField;
    wwtOperacionCVE_AF_NUMENT: TStringField;
    wwtOperacionCVE_AF_NUMRET: TStringField;
    wwtOperacionCVE_AF_NUMSAL: TStringField;
    wwtOperacionCVE_INST_CAJA: TStringField;
    wwtOperacionCVE_OPER_DV: TStringField;
    wwtOperacionCVE_TIPO_CAJA: TStringField;
    wwtOperacionDESC_C_ID_PRIM: TStringField;
    wwtOperacionDESC_L_ID_PRIM: TStringField;
    wwtOperacionF_ALTA: TDateTimeField;
    wwtOperacionF_BAJA: TDateTimeField;
    wwtOperacionF_BLOQUEO: TDateTimeField;
    wwtOperacionID_CTO_REFER: TFloatField;
    wwtOperacionMASK_REFER: TStringField;
    wwtOperacionSIT_CVE_OPER: TStringField;
    wwtInstrumentolkDescMoneda: TStringField;
    wwtOperacionlkDescInst: TStringField;
    wwtMoneda: TwwTable;
    wwtMonedaCVE_MONEDA: TFloatField;
    wwtMonedaDESC_MONEDA: TStringField;
    wwdsMoneda: TwwDataSource;
    wwtUnidadNeg: TwwTable;
    wwtUnidadNegID_ENTIDAD: TFloatField;
    wwtUnidadNegID_EMPRESA: TFloatField;
    wwtUnidadNegCVE_TIPO_ENTIDAD: TStringField;
    wwtUnidadNegDESC_ENTIDAD: TStringField;
    wwtSuc: TwwTable;
    wwtSucID_SUCURSAL: TFloatField;
    wwtCaj: TwwTable;
    wwtInst: TwwTable;
    wwtIXC: TwwTable;
    wwtCajID_CAJA: TFloatField;
    wwtInstCVE_INST_CAJA: TStringField;
    wwtInstDESC_INST_CAJA: TStringField;
    wwtIXCCVE_INST_CAJA: TStringField;
    wwtCajID_SUCURSAL: TFloatField;
    wwdsBitacora: TwwDataSource;
    wwtBitacora: TwwTable; //ROUY4095 10abr07 Add columna B_CLIENTEBI
    wwtBitacoraID_TRANS_CAJA: TFloatField;
    wwtBitacoraCVE_INST_CAJA: TStringField;
    wwtBitacoraCVE_OPER_CAJA: TStringField;
    wwtBitacoraCVE_USUARIO: TStringField;
    wwtBitacoraCVE_USU_ANULA: TStringField;
    wwtBitacoraCVE_USU_AUTORIZA: TStringField;
    wwtBitacoraFH_REGISTRO: TDateTimeField;
    wwtBitacoraF_LIQUIDACION: TDateTimeField;
    wwtBitacoraID_CAJA: TFloatField;
    wwtBitacoraID_COD_RESP: TFloatField;
    wwtBitacoraID_CONTRATO: TFloatField;
    wwtBitacoraID_SUCURSAL: TFloatField;
    wwtBitacoraID_TRANS_GPO: TFloatField;
    wwtBitacoraIMP_MOVTO: TFloatField;
    wwtBitacoraNUM_CHEQUE: TFloatField;
    wwtBitacoraSIT_MOVTO_CAJA: TStringField;
    spCierreSuc: TStoredProc;
    wwtBitacoraDescOper: TStringField;
    wwtBitacoraDescInst: TStringField;
    stpIncPa: TStoredProc;
    wwtBitacoraTX_REFERENCIA: TStringField;
    wwtBitacoraTX_AUDIT: TMemoField;
    wwtBitacoraDescResp: TStringField;
    wwTOper: TwwTable;
    wwTOperCVE_OPER_CAJA: TStringField;
    wwTOperDESC_L_ID_PRIM: TStringField;
    wwTOperDESC_C_ID_PRIM: TStringField;
    wwtBitacoraF_OPERACION: TDateTimeField;
    wwQUsuario: TwwQuery;
    wwQUsuarioNOMBRE: TStringField;
    wwQUsuarioCVE_USUARIO: TStringField;
    wwQUsuarioID_PERSONA: TFloatField;
    wwQUsuarioPASSWORD: TStringField;
    QContr: TQuery;
    QContrID_CONTRATO: TFloatField;
    QContrNOMBRE: TStringField;
    QContrDESC_MONEDA: TStringField;
    StpCanDR: TwwStoredProc;
    wwQCheque: TwwQuery;
    wwQChequeID_CONTRATO: TFloatField;
    wwQChequeNUM_CHEQUE: TFloatField;
    wwQChequeSIT_CHEQUE_LQ: TStringField;
    wwQDVTrans: TwwQuery;
    wwdsQDVTrans: TwwDataSource;
    wwQDVTransID_TRANSACCION: TFloatField;
    wwQDVTransCVE_MEDIO: TStringField;
    wwQDVTransID_TRANS_ORIGEN: TFloatField;
    wwQDVTransF_LIQUIDACION: TDateTimeField;
    spSdoCtr: TStoredProc;
    spCanPago: TStoredProc; //ROUY4095 10abr07
    wwtBitacoraB_CLIENTEBI: TStringField;
    spINSBIT: TStoredProc;
    qTransac2: TQuery;
    qTransac2DESC_L_ID_PRIM: TStringField;
    qTransac2ID_TRANS_PAGO: TFloatField;
    qTransac2TX_REFERENCIA: TStringField;
    qTransac2CONTRATO_BANDA: TStringField;
    qTransac2NUM_CHEQUE: TFloatField;
    qTransac2IMP_MOVTO: TFloatField;
    qTransac2ID_CONTRATO: TFloatField;
    qTransac2NOMBRE: TStringField;
    qTransac2FH_REGISTRO: TDateTimeField;
    qTransac2CERTIFICACION: TStringField;
    qTransac2PLAZA: TStringField;
    qTransac2NUM_DOCTOS: TFloatField;
    qTransac2IMP_MOVTO_1: TFloatField;
    qTransac2DESC_BANCO: TStringField;
    wwIntl: TwwIntl;
    QTransac: TQuery;
    QTransacDESC_C_ID_PRIM: TStringField;
    QTransacID_TRANS_CAJA: TFloatField;
    QTransacID_COD_RESP: TFloatField;
    QTransacFH_REGISTRO: TDateTimeField;
    QTransacID_CONTRATO: TFloatField;
    QTransacIMP_MOVTO: TFloatField;
    QTransacNUM_CHEQUE: TFloatField;
    QTransacTX_REFERENCIA: TStringField;
    QTransacID_TRANS_GPO: TFloatField;
    QTransacCERTIFICACION: TStringField;
    QTransacPLAZA: TStringField;
    QTransacNOMBRE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDos: TdmDos;

implementation

{$R *.DFM}

end.

