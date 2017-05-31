{
 Sistema: Sistema de ventanilla bancaria
 Fecha de Inicio: 03-Ene-97
 Función forma: Data Module del sistema de ventanilla bancaria
 Desarrollo por: César Alejandro Rebollar Trejo
 Modifico:
 Fecha de Modificación:
 Comentarios:
 Variables globales:
}

unit undmSuc1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, Wwtable, Wwdatsrc, Wwquery, InterApl;

type
  Tdm1 = class(TDataModule)
    dbSuc: TDatabase;
    tOper: TTable;
    tCaja: TTable;
    tInstCaj: TTable;
    tOperCVE_OPER_CAJA: TStringField;
    tOperB_AFEC_DV: TStringField;
    tOperB_APL_CAJA: TStringField;
    tOperB_GEN_GRUPO: TStringField;
    tOperB_REC_CAJA: TStringField;
    tOperB_REQ_AUTORIZACI: TStringField;
    tOperB_REQ_INSTRUMENT: TStringField;
    tOperB_VALIDA_REFER: TStringField;
    tOperB_VALIDA_SALDO: TStringField;
    tOperCVE_AF_IMPDEP: TStringField;
    tOperCVE_AF_IMPENT: TStringField;
    tOperCVE_AF_IMPRET: TStringField;
    tOperCVE_AF_IMPSAL: TStringField;
    tOperCVE_AF_NUMDEP: TStringField;
    tOperCVE_AF_NUMENT: TStringField;
    tOperCVE_AF_NUMRET: TStringField;
    tOperCVE_AF_NUMSAL: TStringField;
    tOperCVE_INST_CAJA: TStringField;
    tOperCVE_OPER_DV: TStringField;
    tOperCVE_TIPO_CAJA: TStringField;
    tOperDESC_C_ID_PRIM: TStringField;
    tOperDESC_L_ID_PRIM: TStringField;
    tOperF_ALTA: TDateTimeField;
    tOperF_BAJA: TDateTimeField;
    tOperF_BLOQUEO: TDateTimeField;
    tOperID_CTO_REFER: TFloatField;
    tOperMASK_REFER: TStringField;
    tOperSIT_CVE_OPER: TStringField;
    tCajaID_SUCURSAL: TFloatField;
    tCajaID_CAJA: TFloatField;
    tCajaCVE_TIPO_CAJA: TStringField;
    tCajaCVE_USUARIO: TStringField;
    tCajaFH_SITUACION: TDateTimeField;
    tCajaID_EMPRESA: TFloatField;
    tCajaNUM_APERTURAS: TFloatField;
    tCajaSIT_CAJA: TStringField;
    tInstCajID_SUCURSAL: TFloatField;
    tInstCajID_CAJA: TFloatField;
    tInstCajCVE_INST_CAJA: TStringField;
    tInstCajFH_SITUACION: TDateTimeField;
    tInstCajMAX_POS_SALDO: TFloatField;
    tInstCajMAX_X_OPER: TFloatField;
    tInstCajMIN_POS_SALDO: TFloatField;
    tInstCajSIT_INST_X_CAJA: TStringField;
    tUnNeg: TTable;
    tUnNegCVE_TIPO_ENTIDAD: TStringField;
    tUnNegDESC_ENTIDAD: TStringField;
    tUnNegID_EMPRESA: TFloatField;
    tUnNegID_ENTIDAD: TFloatField;
    spFechaHora: TStoredProc;
    dsSuc: TDataSource;
    dsCaja: TDataSource;
    dsInst: TDataSource;
    tInst: TTable;
    tInstCVE_INST_CAJA: TStringField;
    tInstCVE_MONEDA: TFloatField;
    tInstDESC_INST_CAJA: TStringField;
    tInstSIT_INST_CAJA: TStringField;
    dsOper: TDataSource;
    dsInstCaj: TDataSource;
    dsTrn: TDataSource;
    tTrn: TTable;
    dsTrnDet: TDataSource;
    tTrnDet: TTable;
    tDVContr: TTable;
    tCodResp: TTable;
    tCodRespID_COD_RESP: TFloatField;
    tCodRespDESC_CODIGO: TStringField;
    qDatoContr2: TQuery;
    dsqDatoContr2: TDataSource;
    qDatoContr2ID_CONTRATO: TFloatField;
    qDatoContr2NOMBRE: TStringField;
    qDatoContr2ID_EMPLEADO: TFloatField;
    qDatoContr2NOMBRE_1: TStringField;
    tBitaco: TTable;
    tBitacoID_TRANS_CAJA: TFloatField;
    tBitacoCVE_INST_CAJA: TStringField;
    tBitacoCVE_OPER_CAJA: TStringField;
    tBitacoCVE_USUARIO: TStringField;
    tBitacoCVE_USU_ANULA: TStringField;
    tBitacoCVE_USU_AUTORIZA: TStringField;
    tBitacoFH_REGISTRO: TDateTimeField;
    tBitacoF_LIQUIDACION: TDateTimeField;
    tBitacoF_OPERACION: TDateTimeField;
    tBitacoID_CAJA: TFloatField;
    tBitacoID_COD_RESP: TFloatField;
    tBitacoID_CONTRATO: TFloatField;
    tBitacoID_SUCURSAL: TFloatField;
    tBitacoID_TRANS_GPO: TFloatField;
    tBitacoIMP_MOVTO: TFloatField;
    tBitacoNUM_CHEQUE: TFloatField;
    tBitacoSIT_MOVTO_CAJA: TStringField;
    dsBitaco: TDataSource;
    tDVContrID_CONTRATO: TFloatField;
    tBitacoTX_REFERENCIA: TStringField;
    tTrnDetEdit: TTable;
    tTrnDetEditID_TRANS_CAJA: TFloatField;
    tTrnDetEditID_APUNTE: TFloatField;
    tTrnDetEditID_CONTRATO: TFloatField;
    tTrnDetEditID_BANCO: TStringField;
    tTrnDetEditIMP_MOVTO: TFloatField;
    tTrnDetEditNUM_CHEQUE: TFloatField;
    tTrnDetEditSIT_MOVTO_CAJA: TStringField;
    tTrnDetEditBANDA_MAGNETICA: TStringField;
    QSumaDet: TQuery;
    dsSuma_Det: TDataSource;
    QSumaDetID_TRANS_CAJA: TFloatField;
    QSumaDetID_APUNTE: TFloatField;
    QSumaDetID_CONTRATO: TFloatField;
    QSumaDetID_BANCO: TStringField;
    QSumaDetIMP_MOVTO: TFloatField;
    QSumaDetSIT_MOVTO_CAJA: TStringField;
    dsTrnDet2: TDataSource;
    wtBanco: TwwTable;
    dstBanco: TwwDataSource;
    tTrnSuma_Det: TTable;
    qTrnDet: TQuery;
    tTrn_Det_Actualiza: TTable;
    tTrn_Det_ActualizaID_TRANS_CAJA: TFloatField;
    tTrn_Det_ActualizaID_CONTRATO: TFloatField;
    tTrn_Det_ActualizaID_BANCO: TStringField;
    tTrn_Det_ActualizaIMP_MOVTO: TFloatField;
    tTrn_Det_ActualizaNUM_CHEQUE: TFloatField;
    tTrn_Det_ActualizaSIT_MOVTO_CAJA: TStringField;
    wtBancoID_BANCO: TStringField;
    wtBancoDESC_BANCO: TStringField;
    tTrnSuma_DetID_TRANS_CAJA: TFloatField;
    tTrnSuma_DetID_APUNTE: TFloatField;
    tTrnSuma_DetID_CONTRATO: TFloatField;
    tTrnSuma_DetID_BANCO: TStringField;
    tTrnSuma_DetIMP_MOVTO: TFloatField;
    tTrnSuma_DetNUM_CHEQUE: TFloatField;
    tTrnSuma_DetSIT_MOVTO_CAJA: TStringField;
    tTrnSuma_DetBANDA_MAGNETICA: TStringField;
    qTrnDetID_TRANS_CAJA: TFloatField;
    qTrnDetID_CONTRATO: TFloatField;
    qTrnDetSIT_MOVTO_CAJA: TStringField;
    qTrnDetIMP_MOVTO: TFloatField;
    dsSuma_Det2: TDataSource;
    tBitacoTX_AUDIT: TMemoField;
    tTrnSuma_Det2: TTable;
    tTrnSuma_Det2ID_TRANS_CAJA: TFloatField;
    tTrnSuma_Det2ID_APUNTE: TFloatField;
    tTrnSuma_Det2ID_CONTRATO: TFloatField;
    tTrnSuma_Det2ID_BANCO: TStringField;
    tTrnSuma_Det2IMP_MOVTO: TFloatField;
    tTrnSuma_Det2NUM_CHEQUE: TFloatField;
    tTrnSuma_Det2SIT_MOVTO_CAJA: TStringField;
    tTrnSuma_Det2BANDA_MAGNETICA: TStringField;
    tDVContrCVE_REGIMEN: TStringField;
    dsDVContr: TDataSource;
    tDVContrCOMB_FIRMAS: TStringField;
    tSuc: TTable;
    tSucID_SUCURSAL: TFloatField;
    tSucF_LIQUIDACION: TDateTimeField;
    tSucF_OPERACION: TDateTimeField;
    tSucID_CENCO: TFloatField;
    tSucID_CTO_CHCA: TFloatField;
    tSucID_ENTIDAD: TFloatField;
    tSucNUM_CAJAS: TFloatField;
    tSucSIT_SUCURSAL: TStringField;
    tTrnDetID_TRANS_CAJA: TFloatField;
    tTrnDetID_APUNTE: TFloatField;
    tTrnDetID_CONTRATO: TFloatField;
    tTrnDetID_BANCO: TStringField;
    tTrnDetIMP_MOVTO: TFloatField;
    tTrnDetNUM_CHEQUE: TFloatField;
    tTrnDetSIT_MOVTO_CAJA: TStringField;
    tTrnDetBANDA_MAGNETICA: TStringField;
    tTrnID_TRANS_CAJA: TFloatField;
    tTrnCVE_OPER_CAJA: TStringField;
    tTrnCVE_INST_CAJA: TStringField;
    tTrnCVE_USUARIO: TStringField;
    tTrnCVE_USU_ANULA: TStringField;
    tTrnCVE_USU_AUTORIZA: TStringField;
    tTrnFH_REGISTRO: TDateTimeField;
    tTrnF_LIQUIDACION: TDateTimeField;
    tTrnF_OPERACION: TDateTimeField;
    tTrnID_CAJA: TFloatField;
    tTrnID_CONTRATO: TFloatField;
    tTrnID_SUCURSAL: TFloatField;
    tTrnIMP_MOVTO: TFloatField;
    tTrnNUM_DOCTOS: TFloatField;
    tTrnSIT_MOVTO: TStringField;
    tTrnTX_AUDIT: TStringField;
    tTrnTX_REFERENCIA: TStringField;
    tCheque: TTable;
    tChequera: TTable;
    tdvRecep_Transac: TTable;
    tdvRecep_TransacCVE_MEDIO: TStringField;
    tdvRecep_TransacID_TRANS_ORIGEN: TFloatField;
    tdvRecep_TransacID_APUNTE: TFloatField;
    tdvRecep_TransacCVE_DOCTO: TStringField;
    tdvRecep_TransacCVE_OPERACION: TStringField;
    tdvRecep_TransacCVE_OPE_ORIGEN: TStringField;
    tdvRecep_TransacCVE_USUARIO: TStringField;
    tdvRecep_TransacFH_OPERACION: TDateTimeField;
    tdvRecep_TransacFH_REGISTRO: TDateTimeField;
    tdvRecep_TransacF_LIQUIDACION: TDateTimeField;
    tdvRecep_TransacID_COD_RESP: TFloatField;
    tdvRecep_TransacID_CONTRATO: TFloatField;
    tdvRecep_TransacID_GPO_TRANS: TFloatField;
    tdvRecep_TransacIMP_TRANS: TFloatField;
    tdvRecep_TransacNUM_CHEQUE: TFloatField;
    tdvRecep_TransacNUM_TRANS_DET: TFloatField;
    tdvRecep_TransacSIT_TRANS: TStringField;
    tdvRecep_TransacTX_COMENTARIO: TMemoField;
    tdvRecep_TransacTX_REFERENCIA: TStringField;
    tChequeraID_SOLICITUD: TFloatField;
    tChequeraID_BANCO: TStringField;
    tChequeraID_CECO: TStringField;
    tChequeraID_CONTRATO: TFloatField;
    tChequeraNUM_CHEQUES: TFloatField;
    tChequeraSIT_SOLIC: TStringField;
    tChequeraTIPO_CHEQUE: TStringField;
    tChequeID_SOLICITUD: TFloatField;
    tChequeNUM_CHEQUE: TFloatField;
    tChequeDIG_VER_CHEQUE: TFloatField;
    tChequeDIG_VER_INTCAM: TFloatField;
    tChequeID_SECURITY: TFloatField;
    tChequeIMP_CHEQUE_LQ: TFloatField;
    tChequeNOMBRE_BENEFICIA: TStringField;
    tChequeNOMBRE_ORDENANTE: TStringField;
    tChequeSIT_CHEQUE_LQ: TStringField;
    tDVContrIMP_LIN_SOBGIRO: TFloatField;
    tDVContrSIT_SOBGIRO: TStringField;
    tDVContrSDO_SOBGIRO_VIRT: TFloatField;
    tDVContrNUM_CHQ_VIRT: TFloatField;
    tChequeF_ALTA: TDateTimeField;
    tChequeIMP_COMISION: TFloatField;
    tChequeIMP_IVA: TFloatField;
    tChequeID_TRANS_ORIGEN: TFloatField;
    tChequeCVE_MEDIO: TStringField;
    spFolio_DV: TStoredProc;
    wwqReimp_Chq: TwwQuery;
    wwqReimp_ChqID_SOLICITUD: TFloatField;
    wwqReimp_ChqNUM_CHEQUE: TFloatField;
    wwqReimp_ChqDIG_VER_CHEQUE: TFloatField;
    wwqReimp_ChqDIG_VER_INTCAM: TFloatField;
    wwqReimp_ChqID_SECURITY: TFloatField;
    wwqReimp_ChqIMP_CHEQUE_LQ: TFloatField;
    wwqReimp_ChqNOMBRE_BENEFICIA: TStringField;
    wwqReimp_ChqNOMBRE_ORDENANTE: TStringField;
    wwqReimp_ChqSIT_CHEQUE_LQ: TStringField;
    wwqReimp_ChqIMP_COMISION: TFloatField;
    wwqReimp_ChqIMP_IVA: TFloatField;
    wwqReimp_ChqID_TRANS_ORIGEN: TFloatField;
    wwqReimp_ChqID_CONTRATO: TFloatField;
    wwqReimp_ChqTIPO_CHEQUE: TStringField;
    wwqReimp_ChqF_ALTA: TDateTimeField;
    wwqReimp_ChqTX_AUDIT: TMemoField;
    wwdsReimp_Chq: TwwDataSource;
    wwqReimp_ChqID_BANCO: TStringField;
    wwqReimp_ChqID_CECO: TStringField;
    ApCorp: TInterApli;
    procedure dbSucLogin(Database: TDatabase; LoginParams: TStrings);
    procedure dm1Create(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm1: Tdm1;

implementation

uses UnDos;

{$R *.DFM}

procedure Tdm1.dbSucLogin(Database: TDatabase; LoginParams: TStrings);
begin
  LoginParams.Values['User Name'] := ApCorp.getDbUser('CORP');
  if (Paramcount > 0) and (UpperCase(ParamStr(1)) = 'P') then
     LoginParams.Values['Password']  := ApCorp.getDbPass('CORP')
  else
     LoginParams.Values['Password']  := 'desarrollo';
  {end if}
end;

procedure Tdm1.dm1Create(Sender: TObject);
begin
    if (Paramcount > 0) and (UpperCase(ParamStr(1)) = 'P') then
       begin
       dbSuc.AliasName := ParamStr(1) + 'CORP';
       dbSuc.connected :=  False;
       dbSuc.Params.clear;
       dbSuc.Params.add('USER NAME=' + ApCorp.getDbUser('CORP') + '''');
       dbSuc.Params.add('PASSWORD=' + ApCorp.getDbPass('CORP') + '''');
       dbSuc.connected :=  True;
       end
    else
       begin
       dbSuc.AliasName := 'DCORP';
       dbSuc.connected :=  False;
       dbSuc.Params.clear;
       dbSuc.Params.add('USER NAME=' + ApCorp.getDbUser('CORP') + '''');
       dbSuc.Params.add('PASSWORD=' + ApCorp.getDbPass('CORP') + '''');
       dbSuc.connected :=  True;
       end;
    {end if}
end;


end.

