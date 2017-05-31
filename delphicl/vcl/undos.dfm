object dmDos: TdmDos
  OldCreateOrder = True
  Left = 141
  Top = 155
  Height = 479
  Width = 797
  object wwdsPosicion: TwwDataSource
    DataSet = wwtPosicion
    Left = 32
    Top = 104
  end
  object wwtPosicion: TwwTable
    DatabaseName = 'dbSuc'
    TableName = 'CJ_POSICION'
    LookupFields.Strings = (
      'lkDescInst;dbSuc;CJ_INSTRUMENTO;DESC_INST_CAJA;;CVE_INST_CAJA;Y'
      
        'lkMinPos;dbSuc;CJ_INST_X_CAJA;MIN_POS_SALDO;;ID_SUCURSAL;ID_CAJA' +
        ';CVE_INST_CAJA;Y'
      
        'lkMaxPos;dbSuc;CJ_INST_X_CAJA;MAX_POS_SALDO;;ID_SUCURSAL;ID_CAJA' +
        ';CVE_INST_CAJA;Y')
    LookupLinks.Strings = (
      'CVE_INST_CAJA;CVE_INST_CAJA'
      
        'ID_SUCURSAL;ID_SUCURSAL;ID_CAJA;ID_CAJA;CVE_INST_CAJA;CVE_INST_C' +
        'AJA'
      
        'ID_SUCURSAL;ID_SUCURSAL;ID_CAJA;ID_CAJA;CVE_INST_CAJA;CVE_INST_C' +
        'AJA')
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 104
    Top = 104
    object wwtPosicionlkDescInst: TStringField
      DisplayLabel = 'Instrumento'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'lkDescInst'
      Size = 35
      Calculated = True
    end
    object wwtPosicionF_POSICION: TDateTimeField
      DisplayLabel = 'Fecha de ~Posición'
      DisplayWidth = 10
      FieldName = 'F_POSICION'
      EditMask = '!99/99/00;1;_'
    end
    object wwtPosicionID_CAJA: TFloatField
      DisplayLabel = 'Caja'
      DisplayWidth = 8
      FieldName = 'ID_CAJA'
    end
    object wwtPosicionSDO_VIRT: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 14
      FieldName = 'SDO_VIRT'
      currency = True
    end
    object wwtPosicionIMP_DEPO_VIRT: TFloatField
      DisplayLabel = 'Importe~Depositado'
      DisplayWidth = 15
      FieldName = 'IMP_DEPO_VIRT'
      currency = True
    end
    object wwtPosicionNUM_DEPO_VIRT: TFloatField
      DisplayLabel = 'Número de~Depósitos'
      DisplayWidth = 10
      FieldName = 'NUM_DEPO_VIRT'
    end
    object wwtPosicionIMP_ENTR_VIRT: TFloatField
      DisplayLabel = 'Importe de~Entrada'
      DisplayWidth = 14
      FieldName = 'IMP_ENTR_VIRT'
      currency = True
    end
    object wwtPosicionNUM_ENTR_VIRT: TFloatField
      DisplayLabel = 'Número de~Entradas'
      DisplayWidth = 9
      FieldName = 'NUM_ENTR_VIRT'
    end
    object wwtPosicionIMP_RETI_VIRT: TFloatField
      DisplayLabel = 'Importe ~Retirado'
      DisplayWidth = 14
      FieldName = 'IMP_RETI_VIRT'
      currency = True
    end
    object wwtPosicionNUM_RETI_VIRT: TFloatField
      DisplayLabel = 'Número de~Retiros'
      DisplayWidth = 11
      FieldName = 'NUM_RETI_VIRT'
    end
    object wwtPosicionIMP_SALI_VIRT: TFloatField
      DisplayLabel = 'Importe de~Salida'
      DisplayWidth = 13
      FieldName = 'IMP_SALI_VIRT'
      currency = True
    end
    object wwtPosicionNUM_SALI_VIRT: TFloatField
      DisplayLabel = 'Número de~Salidas'
      DisplayWidth = 10
      FieldName = 'NUM_SALI_VIRT'
    end
    object wwtPosicionSDO_INICIO: TFloatField
      DisplayLabel = 'Saldo al~Inicio'
      DisplayWidth = 13
      FieldName = 'SDO_INICIO'
      currency = True
    end
    object wwtPosicionlkMinPos: TCurrencyField
      DisplayLabel = 'Mínima Posición~Definida '
      DisplayWidth = 16
      FieldKind = fkCalculated
      FieldName = 'lkMinPos'
      Calculated = True
    end
    object wwtPosicionlkMaxPos: TCurrencyField
      DisplayLabel = 'Máxima Posición~Definida'
      DisplayWidth = 16
      FieldKind = fkCalculated
      FieldName = 'lkMaxPos'
      Calculated = True
    end
    object wwtPosicionID_SUCURSAL: TFloatField
      DisplayLabel = 'Sucursal'
      DisplayWidth = 8
      FieldName = 'ID_SUCURSAL'
    end
    object wwtPosicionCVE_INST_CAJA: TStringField
      DisplayWidth = 6
      FieldName = 'CVE_INST_CAJA'
      Visible = False
      Size = 6
    end
    object wwtPosicionIMP_DEPO_REAL: TFloatField
      DisplayWidth = 14
      FieldName = 'IMP_DEPO_REAL'
      Visible = False
      currency = True
    end
    object wwtPosicionIMP_ENTR_REAL: TFloatField
      DisplayWidth = 14
      FieldName = 'IMP_ENTR_REAL'
      Visible = False
      currency = True
    end
    object wwtPosicionIMP_RETI_REAL: TFloatField
      DisplayWidth = 14
      FieldName = 'IMP_RETI_REAL'
      Visible = False
      currency = True
    end
    object wwtPosicionIMP_SALI_REAL: TFloatField
      DisplayWidth = 13
      FieldName = 'IMP_SALI_REAL'
      Visible = False
      currency = True
    end
    object wwtPosicionNUM_DEPO_REAL: TFloatField
      DisplayWidth = 15
      FieldName = 'NUM_DEPO_REAL'
      Visible = False
    end
    object wwtPosicionNUM_ENTR_REAL: TFloatField
      DisplayWidth = 15
      FieldName = 'NUM_ENTR_REAL'
      Visible = False
    end
    object wwtPosicionNUM_RETI_REAL: TFloatField
      DisplayWidth = 14
      FieldName = 'NUM_RETI_REAL'
      Visible = False
    end
    object wwtPosicionNUM_SALI_REAL: TFloatField
      DisplayWidth = 14
      FieldName = 'NUM_SALI_REAL'
      Visible = False
    end
    object wwtPosicionSDO_REAL: TFloatField
      DisplayWidth = 10
      FieldName = 'SDO_REAL'
      Visible = False
      currency = True
    end
  end
  object wwdsCaja: TwwDataSource
    DataSet = wwtCaja
    Left = 176
    Top = 8
  end
  object wwtCaja: TwwTable
    DatabaseName = 'dbSuc'
    TableName = 'CJ_CAJA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 256
    Top = 8
    object wwtCajaID_CAJA: TFloatField
      DisplayLabel = 'Caja'
      DisplayWidth = 5
      FieldName = 'ID_CAJA'
    end
    object wwtCajaCVE_TIPO_CAJA: TStringField
      DisplayLabel = 'Tipo de~Caja '
      DisplayWidth = 7
      FieldName = 'CVE_TIPO_CAJA'
      Size = 2
    end
    object wwtCajaCVE_USUARIO: TStringField
      DisplayLabel = 'Usuario'
      DisplayWidth = 12
      FieldName = 'CVE_USUARIO'
      Size = 8
    end
    object wwtCajaFH_SITUACION: TDateTimeField
      DisplayLabel = 'Fecha y Hora~de Situación'
      DisplayWidth = 12
      FieldName = 'FH_SITUACION'
      EditMask = '!90/90/00;1;_'
    end
    object wwtCajaID_EMPRESA: TFloatField
      DisplayLabel = 'Empresa'
      DisplayWidth = 9
      FieldName = 'ID_EMPRESA'
    end
    object wwtCajaID_SUCURSAL: TFloatField
      DisplayLabel = 'Sucursal'
      DisplayWidth = 9
      FieldName = 'ID_SUCURSAL'
    end
    object wwtCajaNUM_APERTURAS: TFloatField
      DisplayLabel = 'Número de~Aperturas'
      DisplayWidth = 10
      FieldName = 'NUM_APERTURAS'
    end
    object wwtCajaSIT_CAJA: TStringField
      DisplayLabel = 'Situación de~la caja'
      DisplayWidth = 10
      FieldName = 'SIT_CAJA'
      Size = 2
    end
  end
  object wwdsSucursal: TwwDataSource
    DataSet = wwtSucursal
    Left = 176
    Top = 56
  end
  object wwtSucursal: TwwTable
    DatabaseName = 'dbSuc'
    TableName = 'CJ_SUCURSAL'
    LookupFields.Strings = (
      'lkNombreSucursal;dbSuc;UNIDAD_NEGOCIO;DESC_ENTIDAD;;ID_ENTIDAD;Y')
    LookupLinks.Strings = (
      'ID_ENTIDAD;ID_ENTIDAD')
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 256
    Top = 56
    object wwtSucursallkNombreSucursal: TStringField
      DisplayLabel = 'Sucursal'
      DisplayWidth = 27
      FieldKind = fkCalculated
      FieldName = 'lkNombreSucursal'
      Size = 30
      Calculated = True
    end
    object wwtSucursalF_LIQUIDACION: TDateTimeField
      DisplayLabel = 'Fecha de~Liquidación'
      DisplayWidth = 10
      FieldName = 'F_LIQUIDACION'
      EditMask = '!99/99/00;1;_'
    end
    object wwtSucursalF_OPERACION: TDateTimeField
      DisplayLabel = 'Fecha de~Operación'
      DisplayWidth = 10
      FieldName = 'F_OPERACION'
      EditMask = '!99/99/00;1;_'
    end
    object wwtSucursalID_CENCO: TFloatField
      DisplayLabel = 'Centro~Compensador'
      DisplayWidth = 11
      FieldName = 'ID_CENCO'
    end
    object wwtSucursalID_CTO_CHCA: TFloatField
      DisplayLabel = 'Contrato de~Cheque de Caja'
      DisplayWidth = 13
      FieldName = 'ID_CTO_CHCA'
    end
    object wwtSucursalID_ENTIDAD: TFloatField
      DisplayLabel = 'Entidad'
      DisplayWidth = 7
      FieldName = 'ID_ENTIDAD'
    end
    object wwtSucursalID_SUCURSAL: TFloatField
      DisplayLabel = 'Sucursal'
      DisplayWidth = 7
      FieldName = 'ID_SUCURSAL'
    end
    object wwtSucursalNUM_CAJAS: TFloatField
      DisplayLabel = 'Número~de Cajas'
      DisplayWidth = 9
      FieldName = 'NUM_CAJAS'
    end
    object wwtSucursalSIT_SUCURSAL: TStringField
      DisplayLabel = 'Situación de~la Sucursal'
      DisplayWidth = 10
      FieldName = 'SIT_SUCURSAL'
      Size = 2
    end
  end
  object wwdsInstrumento: TwwDataSource
    DataSet = wwtInstrumento
    Left = 176
    Top = 104
  end
  object wwtInstrumento: TwwTable
    DatabaseName = 'dbSuc'
    TableName = 'CJ_INSTRUMENTO'
    LookupFields.Strings = (
      'lkDescMoneda;dbSuc;MONEDA;DESC_MONEDA;;CVE_MONEDA;Y')
    LookupLinks.Strings = (
      'CVE_MONEDA;CVE_MONEDA')
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 256
    Top = 104
    object wwtInstrumentoDESC_INST_CAJA: TStringField
      DisplayLabel = 'Instrumento'
      DisplayWidth = 30
      FieldName = 'DESC_INST_CAJA'
      Size = 40
    end
    object wwtInstrumentoSIT_INST_CAJA: TStringField
      DisplayLabel = 'Situación del~Instrumento'
      DisplayWidth = 12
      FieldName = 'SIT_INST_CAJA'
      Size = 2
    end
    object wwtInstrumentolkDescMoneda: TStringField
      DisplayLabel = 'Descripción~Moneda'
      DisplayWidth = 17
      FieldKind = fkCalculated
      FieldName = 'lkDescMoneda'
      Calculated = True
    end
    object wwtInstrumentoCVE_MONEDA: TFloatField
      DisplayLabel = 'Código de~Moneda'
      DisplayWidth = 9
      FieldName = 'CVE_MONEDA'
    end
    object wwtInstrumentoCVE_INST_CAJA: TStringField
      DisplayLabel = 'Código de~Instrumento'
      DisplayWidth = 13
      FieldName = 'CVE_INST_CAJA'
      Size = 6
    end
  end
  object wwdsInstXCaja: TwwDataSource
    DataSet = wwtInstXCaja
    Left = 176
    Top = 152
  end
  object wwtInstXCaja: TwwTable
    DatabaseName = 'dbSuc'
    TableName = 'CJ_INST_X_CAJA'
    LookupFields.Strings = (
      
        'lkInstrumento;dbSuc;CJ_INSTRUMENTO;DESC_INST_CAJA;;CVE_INST_CAJA' +
        ';Y')
    LookupLinks.Strings = (
      'CVE_INST_CAJA;CVE_INST_CAJA')
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 256
    Top = 152
    object wwtInstXCajaID_SUCURSAL: TFloatField
      DisplayLabel = 'Sucursal'
      DisplayWidth = 7
      FieldName = 'ID_SUCURSAL'
    end
    object wwtInstXCajaID_CAJA: TFloatField
      DisplayLabel = 'Caja'
      DisplayWidth = 5
      FieldName = 'ID_CAJA'
    end
    object wwtInstXCajalkInstrumento: TStringField
      DisplayLabel = 'Nombre del~Instrumento'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'lkInstrumento'
      Calculated = True
    end
    object wwtInstXCajaFH_SITUACION: TDateTimeField
      DisplayLabel = 'Fecha/Hora~Situación'
      DisplayWidth = 11
      FieldName = 'FH_SITUACION'
      EditMask = '!99/99/00;1;_'
    end
    object wwtInstXCajaMIN_POS_SALDO: TFloatField
      DisplayLabel = 'Mínima Posición~del Instrumento'
      DisplayWidth = 14
      FieldName = 'MIN_POS_SALDO'
      currency = True
    end
    object wwtInstXCajaMAX_POS_SALDO: TFloatField
      DisplayLabel = 'Máxima Posición~del Instrumento'
      DisplayWidth = 14
      FieldName = 'MAX_POS_SALDO'
      currency = True
    end
    object wwtInstXCajaMAX_X_OPER: TFloatField
      DisplayLabel = 'Importe Máximo~por Operación'
      DisplayWidth = 14
      FieldName = 'MAX_X_OPER'
      currency = True
    end
    object wwtInstXCajaSIT_INST_X_CAJA: TStringField
      DisplayLabel = 'Situación del~Instrumento'
      DisplayWidth = 11
      FieldName = 'SIT_INST_X_CAJA'
      Size = 2
    end
    object wwtInstXCajaCVE_INST_CAJA: TStringField
      DisplayLabel = 'Instrumento~por Caja'
      DisplayWidth = 10
      FieldName = 'CVE_INST_CAJA'
      Size = 6
    end
  end
  object wwdsOperacion: TwwDataSource
    DataSet = wwtOperacion
    Left = 176
    Top = 200
  end
  object wwtOperacion: TwwTable
    DatabaseName = 'dbSuc'
    TableName = 'CJ_OPERACION'
    LookupFields.Strings = (
      'lkDescInst;dbSuc;CJ_INSTRUMENTO;DESC_INST_CAJA;;CVE_INST_CAJA;Y')
    LookupLinks.Strings = (
      'CVE_INST_CAJA;CVE_INST_CAJA')
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 256
    Top = 200
    object wwtOperacionCVE_OPER_CAJA: TStringField
      DisplayLabel = 'Código de~Operación'
      DisplayWidth = 8
      FieldName = 'CVE_OPER_CAJA'
      Size = 6
    end
    object wwtOperacionDESC_C_ID_PRIM: TStringField
      DisplayLabel = 'Descripción~Corta'
      DisplayWidth = 20
      FieldName = 'DESC_C_ID_PRIM'
    end
    object wwtOperacionB_AFEC_DV: TStringField
      DisplayLabel = 'Afecta~DV'
      DisplayWidth = 8
      FieldName = 'B_AFEC_DV'
      Size = 1
    end
    object wwtOperacionB_APL_CAJA: TStringField
      DisplayLabel = 'Aplicación~de Caja'
      DisplayWidth = 8
      FieldName = 'B_APL_CAJA'
      Size = 1
    end
    object wwtOperacionB_REC_CAJA: TStringField
      DisplayLabel = 'Recepción~de Caja'
      DisplayWidth = 9
      FieldName = 'B_REC_CAJA'
      Size = 1
    end
    object wwtOperacionB_GEN_GRUPO: TStringField
      DisplayLabel = 'Genera~Grupo'
      DisplayWidth = 10
      FieldName = 'B_GEN_GRUPO'
      Size = 1
    end
    object wwtOperacionB_REQ_AUTORIZACI: TStringField
      DisplayLabel = 'Requiere~Autoriza.'
      DisplayWidth = 10
      FieldName = 'B_REQ_AUTORIZACI'
      Size = 1
    end
    object wwtOperacionB_REQ_INSTRUMENT: TStringField
      DisplayLabel = 'Req.~Inst.'
      DisplayWidth = 9
      FieldName = 'B_REQ_INSTRUMENT'
      Size = 1
    end
    object wwtOperacionB_VALIDA_REFER: TStringField
      DisplayLabel = 'Valida~Referencia'
      DisplayWidth = 9
      FieldName = 'B_VALIDA_REFER'
      Size = 1
    end
    object wwtOperacionB_VALIDA_SALDO: TStringField
      DisplayLabel = 'Valida~Saldo'
      DisplayWidth = 9
      FieldName = 'B_VALIDA_SALDO'
      Size = 1
    end
    object wwtOperacionCVE_AF_IMPDEP: TStringField
      DisplayLabel = 'Afecta~Imp. Dep.'
      DisplayWidth = 9
      FieldName = 'CVE_AF_IMPDEP'
      Size = 2
    end
    object wwtOperacionCVE_AF_IMPENT: TStringField
      DisplayLabel = 'Afecta~Imp. Ent.'
      DisplayWidth = 10
      FieldName = 'CVE_AF_IMPENT'
      Size = 2
    end
    object wwtOperacionCVE_AF_IMPRET: TStringField
      DisplayLabel = 'Afecta~Imp. Ret.'
      DisplayWidth = 10
      FieldName = 'CVE_AF_IMPRET'
      Size = 2
    end
    object wwtOperacionCVE_AF_IMPSAL: TStringField
      DisplayLabel = 'Afecta~Imp. Sal.'
      DisplayWidth = 10
      FieldName = 'CVE_AF_IMPSAL'
      Size = 2
    end
    object wwtOperacionCVE_AF_NUMDEP: TStringField
      DisplayLabel = 'Afecta~Núm. Dep.'
      DisplayWidth = 10
      FieldName = 'CVE_AF_NUMDEP'
      Size = 2
    end
    object wwtOperacionCVE_AF_NUMENT: TStringField
      DisplayLabel = 'Afecta~Núm. Ent.'
      DisplayWidth = 9
      FieldName = 'CVE_AF_NUMENT'
      Size = 2
    end
    object wwtOperacionCVE_AF_NUMRET: TStringField
      DisplayLabel = 'Afecta~Núm. Ret.'
      DisplayWidth = 10
      FieldName = 'CVE_AF_NUMRET'
      Size = 2
    end
    object wwtOperacionCVE_AF_NUMSAL: TStringField
      DisplayLabel = 'Afecta~Núm. Sal.'
      DisplayWidth = 10
      FieldName = 'CVE_AF_NUMSAL'
      Size = 2
    end
    object wwtOperacionCVE_INST_CAJA: TStringField
      DisplayLabel = 'Código de~Instrumento'
      DisplayWidth = 10
      FieldName = 'CVE_INST_CAJA'
      Size = 6
    end
    object wwtOperacionlkDescInst: TStringField
      DisplayLabel = 'Nombre del~Instrumento'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'lkDescInst'
      Calculated = True
    end
    object wwtOperacionCVE_OPER_DV: TStringField
      DisplayLabel = 'Cód. Oper.~Dep. Vis.'
      DisplayWidth = 10
      FieldName = 'CVE_OPER_DV'
      Size = 6
    end
    object wwtOperacionCVE_TIPO_CAJA: TStringField
      DisplayLabel = 'Tipo de~Caja'
      DisplayWidth = 10
      FieldName = 'CVE_TIPO_CAJA'
      Size = 2
    end
    object wwtOperacionDESC_L_ID_PRIM: TStringField
      DisplayLabel = 'Descripción Larga~de Operación '
      DisplayWidth = 50
      FieldName = 'DESC_L_ID_PRIM'
      Size = 50
    end
    object wwtOperacionF_ALTA: TDateTimeField
      DisplayLabel = 'Fecha de~Alta'
      DisplayWidth = 9
      FieldName = 'F_ALTA'
      EditMask = '!99/99/00;1;_'
    end
    object wwtOperacionF_BAJA: TDateTimeField
      DisplayLabel = 'Fecha de~Baja'
      DisplayWidth = 8
      FieldName = 'F_BAJA'
      EditMask = '!99/99/00;1;_'
    end
    object wwtOperacionF_BLOQUEO: TDateTimeField
      DisplayLabel = 'Fecha de~Baja'
      DisplayWidth = 9
      FieldName = 'F_BLOQUEO'
      EditMask = '!99/99/00;1;_'
    end
    object wwtOperacionID_CTO_REFER: TFloatField
      DisplayLabel = 'Contrato de~Referencia'
      DisplayWidth = 13
      FieldName = 'ID_CTO_REFER'
    end
    object wwtOperacionMASK_REFER: TStringField
      DisplayLabel = 'Referencia'
      DisplayWidth = 48
      FieldName = 'MASK_REFER'
      Size = 48
    end
    object wwtOperacionSIT_CVE_OPER: TStringField
      DisplayLabel = 'Situación de~Operación'
      DisplayWidth = 11
      FieldName = 'SIT_CVE_OPER'
      Size = 2
    end
  end
  object wwtMoneda: TwwTable
    DatabaseName = 'dbSuc'
    TableName = 'MONEDA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 104
    Top = 8
    object wwtMonedaCVE_MONEDA: TFloatField
      DisplayLabel = 'Moneda'
      DisplayWidth = 10
      FieldName = 'CVE_MONEDA'
    end
    object wwtMonedaDESC_MONEDA: TStringField
      DisplayLabel = 'Nombre Moneda'
      DisplayWidth = 20
      FieldName = 'DESC_MONEDA'
    end
  end
  object wwdsMoneda: TwwDataSource
    DataSet = wwtMoneda
    Left = 32
    Top = 8
  end
  object wwtUnidadNeg: TwwTable
    DatabaseName = 'dbSuc'
    TableName = 'UNIDAD_NEGOCIO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 104
    Top = 152
    object wwtUnidadNegID_ENTIDAD: TFloatField
      FieldName = 'ID_ENTIDAD'
    end
    object wwtUnidadNegID_EMPRESA: TFloatField
      FieldName = 'ID_EMPRESA'
    end
    object wwtUnidadNegCVE_TIPO_ENTIDAD: TStringField
      FieldName = 'CVE_TIPO_ENTIDAD'
      Size = 4
    end
    object wwtUnidadNegDESC_ENTIDAD: TStringField
      FieldName = 'DESC_ENTIDAD'
      Size = 50
    end
  end
  object wwtSuc: TwwTable
    DatabaseName = 'dbSuc'
    TableName = 'CJ_SUCURSAL'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 320
    Top = 56
    object wwtSucID_SUCURSAL: TFloatField
      FieldName = 'ID_SUCURSAL'
    end
  end
  object wwtCaj: TwwTable
    DatabaseName = 'dbSuc'
    TableName = 'ADMIPROD.CJ_CAJA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 320
    Top = 8
    object wwtCajID_SUCURSAL: TFloatField
      DisplayLabel = 'Sucursal'
      DisplayWidth = 10
      FieldName = 'ID_SUCURSAL'
      Required = True
    end
    object wwtCajID_CAJA: TFloatField
      DisplayLabel = 'Caja'
      DisplayWidth = 7
      FieldName = 'ID_CAJA'
      Required = True
    end
  end
  object wwtInst: TwwTable
    DatabaseName = 'dbSuc'
    TableName = 'ADMIPROD.CJ_INSTRUMENTO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 320
    Top = 104
    object wwtInstCVE_INST_CAJA: TStringField
      DisplayLabel = 'Código de~Instrumento'
      DisplayWidth = 13
      FieldName = 'CVE_INST_CAJA'
      Required = True
      Size = 6
    end
    object wwtInstDESC_INST_CAJA: TStringField
      DisplayLabel = 'Instrumento'
      DisplayWidth = 30
      FieldName = 'DESC_INST_CAJA'
      Required = True
      Size = 40
    end
  end
  object wwtIXC: TwwTable
    DatabaseName = 'dbSuc'
    TableName = 'ADMIPROD.CJ_INST_X_CAJA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 320
    Top = 152
    object wwtIXCCVE_INST_CAJA: TStringField
      FieldName = 'CVE_INST_CAJA'
      Required = True
      Size = 6
    end
  end
  object wwdsBitacora: TwwDataSource
    DataSet = wwtBitacora
    Left = 32
    Top = 56
  end
  object wwtBitacora: TwwTable
    DatabaseName = 'dbSuc'
    TableName = 'CJ_BITACORA'
    LookupFields.Strings = (
      'DescOper;dbSuc;CJ_OPERACION;DESC_C_ID_PRIM;;CVE_OPER_CAJA;Y'
      'DescInst;dbSuc;CJ_INSTRUMENTO;DESC_INST_CAJA;;CVE_INST_CAJA;Y'
      'DescResp;dbSuc;CODIGO_RESPUESTA;DESC_CODIGO;;ID_COD_RESP;Y')
    LookupLinks.Strings = (
      'CVE_OPER_CAJA;CVE_OPER_CAJA'
      'CVE_INST_CAJA;CVE_INST_CAJA'
      'ID_COD_RESP;ID_COD_RESP')
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 104
    Top = 57
    object wwtBitacoraID_TRANS_GPO: TFloatField
      DisplayLabel = 'Gpo.'
      DisplayWidth = 9
      FieldName = 'ID_TRANS_GPO'
    end
    object wwtBitacoraID_TRANS_CAJA: TFloatField
      DisplayLabel = 'Trn.'
      DisplayWidth = 9
      FieldName = 'ID_TRANS_CAJA'
    end
    object wwtBitacoraDescOper: TStringField
      DisplayLabel = 'Operación'
      DisplayWidth = 23
      FieldKind = fkCalculated
      FieldName = 'DescOper'
      Calculated = True
    end
    object wwtBitacoraCVE_USUARIO: TStringField
      DisplayLabel = 'Usuario'
      DisplayWidth = 10
      FieldName = 'CVE_USUARIO'
      Size = 8
    end
    object wwtBitacoraDescInst: TStringField
      DisplayLabel = 'Instrumento'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'DescInst'
      Size = 30
      Calculated = True
    end
    object wwtBitacoraIMP_MOVTO: TFloatField
      DisplayLabel = 'Importe del~Movimiento'
      DisplayWidth = 12
      FieldName = 'IMP_MOVTO'
      currency = True
    end
    object wwtBitacoraID_CONTRATO: TFloatField
      DisplayLabel = 'Contrato'
      DisplayWidth = 10
      FieldName = 'ID_CONTRATO'
    end
    object wwtBitacoraNUM_CHEQUE: TFloatField
      DisplayLabel = 'Núm. de ~Cheque'
      DisplayWidth = 9
      FieldName = 'NUM_CHEQUE'
    end
    object wwtBitacoraTX_REFERENCIA: TStringField
      DisplayLabel = 'Referencia'
      DisplayWidth = 26
      FieldName = 'TX_REFERENCIA'
      Size = 200
    end
    object wwtBitacoraDescResp: TStringField
      DisplayLabel = 'Respuesta'
      DisplayWidth = 26
      FieldKind = fkCalculated
      FieldName = 'DescResp'
      Size = 30
      Calculated = True
    end
    object wwtBitacoraSIT_MOVTO_CAJA: TStringField
      DisplayLabel = 'Sit.'
      DisplayWidth = 4
      FieldName = 'SIT_MOVTO_CAJA'
      Size = 2
    end
    object wwtBitacoraFH_REGISTRO: TDateTimeField
      DisplayLabel = 'Fecha de~Registro'
      DisplayWidth = 16
      FieldName = 'FH_REGISTRO'
    end
    object wwtBitacoraF_LIQUIDACION: TDateTimeField
      DisplayLabel = 'Fecha de~Liquidación'
      DisplayWidth = 11
      FieldName = 'F_LIQUIDACION'
    end
    object wwtBitacoraF_OPERACION: TDateTimeField
      DisplayLabel = 'Fecha de~Operación'
      DisplayWidth = 11
      FieldName = 'F_OPERACION'
      Required = True
    end
    object wwtBitacoraID_SUCURSAL: TFloatField
      DisplayLabel = 'Suc.'
      DisplayWidth = 5
      FieldName = 'ID_SUCURSAL'
    end
    object wwtBitacoraID_CAJA: TFloatField
      DisplayLabel = 'Caja'
      DisplayWidth = 5
      FieldName = 'ID_CAJA'
    end
    object wwtBitacoraCVE_USU_AUTORIZA: TStringField
      DisplayLabel = 'Usuario~Autoriza'
      DisplayWidth = 8
      FieldName = 'CVE_USU_AUTORIZA'
      Size = 8
    end
    object wwtBitacoraCVE_USU_ANULA: TStringField
      DisplayLabel = 'Usuario~Anula'
      DisplayWidth = 8
      FieldName = 'CVE_USU_ANULA'
      Size = 8
    end
    object wwtBitacoraID_COD_RESP: TFloatField
      DisplayLabel = 'Resp.'
      DisplayWidth = 5
      FieldName = 'ID_COD_RESP'
    end
    object wwtBitacoraCVE_OPER_CAJA: TStringField
      DisplayLabel = 'Operación'
      DisplayWidth = 8
      FieldName = 'CVE_OPER_CAJA'
      Size = 6
    end
    object wwtBitacoraCVE_INST_CAJA: TStringField
      DisplayLabel = 'Instrumento'
      DisplayWidth = 10
      FieldName = 'CVE_INST_CAJA'
      Visible = False
      Size = 6
    end
    object wwtBitacoraTX_AUDIT: TMemoField
      FieldName = 'TX_AUDIT'
      Visible = False
      BlobType = ftMemo
      Size = 500
    end
    object wwtBitacoraB_CLIENTEBI: TStringField
      FieldName = 'B_CLIENTEBI'
      Size = 1
    end
  end
  object spCierreSuc: TStoredProc
    DatabaseName = 'dbSuc'
    StoredProcName = 'STPCIECJ'
    Left = 376
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'V_ID_SUCURSAL'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'V_FINDIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'V_DESC'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'RESP'
        ParamType = ptOutput
      end>
  end
  object stpIncPa: TStoredProc
    DatabaseName = 'dbSuc'
    StoredProcName = 'STPPARCJ'
    Left = 376
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ID_PARAMETRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_FOLIO_TRN'
        ParamType = ptOutput
        Value = 33970
      end
      item
        DataType = ftInteger
        Name = 'P_GRUPO_TRN'
        ParamType = ptOutput
        Value = 27362
      end>
  end
  object wwTOper: TwwTable
    DatabaseName = 'dbSuc'
    TableName = 'CJ_OPERACION'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 320
    Top = 200
    object wwTOperCVE_OPER_CAJA: TStringField
      FieldName = 'CVE_OPER_CAJA'
      Required = True
      Size = 6
    end
    object wwTOperDESC_L_ID_PRIM: TStringField
      FieldName = 'DESC_L_ID_PRIM'
      Required = True
      Size = 50
    end
    object wwTOperDESC_C_ID_PRIM: TStringField
      FieldName = 'DESC_C_ID_PRIM'
      Required = True
    end
  end
  object wwQUsuario: TwwQuery
    DatabaseName = 'dbSuc'
    SQL.Strings = (
      'SELECT USUARIO."CVE_USUARIO" , '
      ' USUARIO."ID_PERSONA" , '
      ' USUARIO."PASSWORD" ,'
      ' PERSONA."NOMBRE"'
      'FROM "USUARIO" USUARIO , "PERSONA" PERSONA'
      'WHERE (USUARIO.CVE_USUARIO LIKE :USER)  AND'
      '( USUARIO.ID_PERSONA = PERSONA.ID_PERSONA ) ')
    ValidateWithMask = True
    Left = 376
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'USER'
        ParamType = ptUnknown
      end>
    object wwQUsuarioNOMBRE: TStringField
      DisplayWidth = 80
      FieldName = 'NOMBRE'
      Origin = 'PERSONA.NOMBRE'
      Size = 80
    end
    object wwQUsuarioCVE_USUARIO: TStringField
      DisplayWidth = 8
      FieldName = 'CVE_USUARIO'
      Origin = 'USUARIO.CVE_USUARIO'
      Size = 8
    end
    object wwQUsuarioID_PERSONA: TFloatField
      DisplayWidth = 10
      FieldName = 'ID_PERSONA'
      Origin = 'USUARIO.ID_PERSONA'
    end
    object wwQUsuarioPASSWORD: TStringField
      FieldName = 'PASSWORD'
      Origin = 'USUARIO.CVE_USUARIO'
      Size = 8
    end
  end
  object QContr: TQuery
    DatabaseName = 'dbSuc'
    SQL.Strings = (
      'SELECT CONTRATO."ID_CONTRATO" , '
      ' PERSONA."NOMBRE" , '
      ' MONEDA."DESC_MONEDA"'
      'FROM "CONTRATO" CONTRATO , "MONEDA" MONEDA , '
      ' "PERSONA" PERSONA'
      'WHERE (CONTRATO.ID_CONTRATO = :CONTR)   AND'
      '( CONTRATO.CVE_MONEDA = MONEDA.CVE_MONEDA )'
      '  AND'
      ' ( CONTRATO.ID_TITULAR = PERSONA.ID_PERSONA )')
    Left = 376
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CONTR'
        ParamType = ptUnknown
      end>
    object QContrID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
      Origin = 'CONTRATO.ID_CONTRATO'
    end
    object QContrNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Origin = 'PERSONA.NOMBRE'
      Size = 80
    end
    object QContrDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
      Origin = 'MONEDA.DESC_MONEDA'
    end
  end
  object StpCanDR: TwwStoredProc
    DatabaseName = 'dbSuc'
    StoredProcName = 'STPCANDR'
    ValidateWithMask = True
    Left = 320
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_ID_TRANS_GPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'RESP'
        ParamType = ptOutput
      end>
  end
  object wwQCheque: TwwQuery
    DatabaseName = 'dbSuc'
    SQL.Strings = (
      'SELECT DV_SOLIC_CHQA."ID_CONTRATO" , '
      ' DV_CHEQUE."NUM_CHEQUE" , '
      ' DV_CHEQUE."SIT_CHEQUE_LQ"'
      'FROM "DV_SOLIC_CHQA" DV_SOLIC_CHQA , "DV_CHEQUE" DV_CHEQUE'
      'WHERE ( DV_SOLIC_CHQA.ID_SOLICITUD = DV_CHEQUE.ID_SOLICITUD )'
      '  AND'
      ' ('
      ' ( ( DV_SOLIC_CHQA."ID_CONTRATO" = :CONTRATO ) AND'
      '  ( DV_CHEQUE."NUM_CHEQUE" = :CHEQUE ) )'
      ' )')
    ValidateWithMask = True
    Left = 256
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CHEQUE'
        ParamType = ptUnknown
      end>
    object wwQChequeID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
      Origin = 'DV_SOLIC_CHQA.ID_CONTRATO'
    end
    object wwQChequeNUM_CHEQUE: TFloatField
      FieldName = 'NUM_CHEQUE'
      Origin = 'DV_CHEQUE.NUM_CHEQUE'
    end
    object wwQChequeSIT_CHEQUE_LQ: TStringField
      FieldName = 'SIT_CHEQUE_LQ'
      Origin = 'DV_CHEQUE.SIT_CHEQUE_LQ'
      Size = 2
    end
  end
  object wwQDVTrans: TwwQuery
    DatabaseName = 'dbSuc'
    SQL.Strings = (
      'SELECT DV_TRANSACCION."ID_TRANSACCION" , '
      ' DV_TRANSACCION."CVE_MEDIO" , '
      ' DV_TRANSACCION."ID_TRANS_ORIGEN",'
      ' DV_TRANSACCION."F_LIQUIDACION"'
      'FROM "DV_TRANSACCION" DV_TRANSACCION'
      'WHERE ( ( DV_TRANSACCION."CVE_MEDIO" = '#39'SUCURS'#39' ) AND'
      '  ( DV_TRANSACCION."ID_TRANS_ORIGEN" = :PARAMETRO ) )')
    ValidateWithMask = True
    Left = 104
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PARAMETRO'
        ParamType = ptUnknown
      end>
    object wwQDVTransID_TRANSACCION: TFloatField
      FieldName = 'ID_TRANSACCION'
      Origin = 'DV_TRANSACCION.ID_TRANSACCION'
    end
    object wwQDVTransCVE_MEDIO: TStringField
      FieldName = 'CVE_MEDIO'
      Origin = 'DV_TRANSACCION.CVE_MEDIO'
      Size = 6
    end
    object wwQDVTransID_TRANS_ORIGEN: TFloatField
      FieldName = 'ID_TRANS_ORIGEN'
      Origin = 'DV_TRANSACCION.ID_TRANS_ORIGEN'
    end
    object wwQDVTransF_LIQUIDACION: TDateTimeField
      FieldName = 'F_LIQUIDACION'
      Origin = 'DV_TRANSACCION.F_LIQUIDACION'
    end
  end
  object wwdsQDVTrans: TwwDataSource
    DataSet = wwQDVTrans
    Left = 32
    Top = 200
  end
  object spSdoCtr: TStoredProc
    DatabaseName = 'dbSuc'
    StoredProcName = 'STPTOCN2'
    Left = 376
    Top = 8
  end
  object spCanPago: TStoredProc
    DatabaseName = 'dbSuc'
    StoredProcName = 'PKGCAJA.STPCANPAGTELE'
    Left = 376
    Top = 304
  end
  object spINSBIT: TStoredProc
    DatabaseName = 'dbSuc'
    StoredProcName = 'PKGCAJA.STPINSERTTRANSAC'
    Left = 312
    Top = 304
  end
  object qTransac2: TQuery
    DatabaseName = 'dBSUC'
    SQL.Strings = (
      'SELECT '
      
        ' O.DESC_L_ID_PRIM, T.ID_TRANS_PAGO,d.TX_REFERENCIA, t.CONTRATO_B' +
        'ANDA,T.NUM_CHEQUE, T.IMP_MOVTO, '
      ' D.ID_CONTRATO, P.NOMBRE, B.FH_REGISTRO, '
      ' C.CVE_SUCURSAL ||'#39' '#39'|| d.id_GPO_TRANS AS CERTIFICACION, '
      
        ' pob.DESC_POBLACION||'#39' '#39'||ciu.desc_poblacION AS PLAZA, A.NUM_DOC' +
        'TOS, A.IMP_MOVTO, Z.DESC_BANCO'
      'FROM  '
      
        'CJ_BITACORA B, CJ_TRN_RECEP_DET T, DV_RECEP_TRANSAC R, CJ_TRN_RE' +
        'CEP A, '
      
        'DV_RECEP_TRANSAC e, DV_TRANSACCION d, DV_OPERACION O, CJ_CAJA J,' +
        ' CJ_SUCURSAL C, '
      
        'UNIDAD_NEGOCIO u, POBLACION pob, POBLACION ciu, USUARIO U, PERSO' +
        'NA P , BANCO z'
      'WHERE B.ID_TRANS_CAJA= :TRANS'
      'AND T.ID_TRANS_CAJA=B.ID_TRANS_CAJA'
      'AND R.ID_TRANS_ORIGEN=T.ID_TRANS_PAGO'
      'AND A.ID_TRANS_CAJA=T.ID_TRANS_CAJA'
      'AND E.CVE_MEDIO='#39'SUCURS'#39' AND E.ID_TRANS_ORIGEN=R.ID_TRANS_ORIGEN'
      'AND D.ID_TRANSACCION=E.ID_TRANS_DV'
      'AND D.CVE_OPERACION=O.CVE_OPERACION'
      'AND J.ID_SUCURSAL    =B.ID_SUCURSAL'
      'AND J.ID_CAJA        =B.ID_CAJA'
      'AND C.ID_SUCURSAL    =B.ID_SUCURSAL'
      'AND U.ID_ENTIDAD     =C.ID_ENTIDAD'
      'AND pob.cve_poblacion=u.cve_poblacion'
      'AND ciu.cve_poblacion=pob.CVE_POBLAC_UBIC'
      'AND U.CVE_USUARIO    =J.CVE_USUARIO'
      'AND P.ID_PERSONA     =U.ID_PERSONA'
      'AND Z.ID_BANCO =T.ID_BANCO'
      'ORDER BY d.id_transaccion'
      ''
      '')
    Left = 256
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TRANS'
        ParamType = ptUnknown
      end>
    object qTransac2DESC_L_ID_PRIM: TStringField
      FieldName = 'DESC_L_ID_PRIM'
      Origin = 'DCORP.DV_OPERACION.DESC_L_ID_PRIM'
      Size = 50
    end
    object qTransac2ID_TRANS_PAGO: TFloatField
      FieldName = 'ID_TRANS_PAGO'
      Origin = 'DCORP.CJ_TRN_RECEP_DET.ID_TRANS_PAGO'
    end
    object qTransac2TX_REFERENCIA: TStringField
      FieldName = 'TX_REFERENCIA'
      Origin = 'DCORP.DV_RECEP_TRANSAC.TX_REFERENCIA'
      Size = 200
    end
    object qTransac2CONTRATO_BANDA: TStringField
      FieldName = 'CONTRATO_BANDA'
      Origin = 'DCORP.CJ_TRN_RECEP_DET.CONTRATO_BANDA'
      Size = 11
    end
    object qTransac2NUM_CHEQUE: TFloatField
      FieldName = 'NUM_CHEQUE'
      Origin = 'DCORP.CJ_TRN_RECEP_DET.NUM_CHEQUE'
    end
    object qTransac2IMP_MOVTO: TFloatField
      FieldName = 'IMP_MOVTO'
      Origin = 'DCORP.CJ_TRN_RECEP_DET.IMP_MOVTO'
    end
    object qTransac2ID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
      Origin = 'DCORP.CJ_TRN_RECEP_DET.ID_CONTRATO'
    end
    object qTransac2NOMBRE: TStringField
      FieldName = 'NOMBRE'
      Origin = 'DCORP.PERSONA.NOMBRE'
      Size = 80
    end
    object qTransac2FH_REGISTRO: TDateTimeField
      FieldName = 'FH_REGISTRO'
      Origin = 'DCORP.CJ_BITACORA.FH_REGISTRO'
    end
    object qTransac2CERTIFICACION: TStringField
      FieldName = 'CERTIFICACION'
      Origin = 'DCORP.CJ_SUCURSAL.CVE_SUCURSAL'
      Size = 45
    end
    object qTransac2PLAZA: TStringField
      FieldName = 'PLAZA'
      Origin = 'DCORP.POBLACION.DESC_POBLACION'
      Size = 81
    end
    object qTransac2NUM_DOCTOS: TFloatField
      FieldName = 'NUM_DOCTOS'
      Origin = 'DCORP.CJ_TRN_RECEP.NUM_DOCTOS'
    end
    object qTransac2IMP_MOVTO_1: TFloatField
      FieldName = 'IMP_MOVTO_1'
      Origin = 'DCORP.CJ_TRN_RECEP.IMP_MOVTO'
    end
    object qTransac2DESC_BANCO: TStringField
      FieldName = 'DESC_BANCO'
      Origin = 'DCORP.BANCO.DESC_BANCO'
      Size = 50
    end
  end
  object wwIntl: TwwIntl
    Navigator.ConfirmDeleteMessage = 'Delete record?'
    Navigator.Hints.FirstHint = 'Move to first record'
    Navigator.Hints.PriorHint = 'Move to prior record'
    Navigator.Hints.NextHint = 'Move to next record'
    Navigator.Hints.LastHint = 'Move to last record'
    Navigator.Hints.InsertHint = 'Insert new record'
    Navigator.Hints.DeleteHint = 'Delete current record'
    Navigator.Hints.EditHint = 'Edit current record'
    Navigator.Hints.PostHint = 'Post changes of current record'
    Navigator.Hints.CancelHint = 'Cancel changes made to current record'
    Navigator.Hints.RefreshHint = 'Refresh the contents of the dataset'
    Navigator.Hints.PriorPageHint = 'Move backward %d records'
    Navigator.Hints.NextPageHint = 'Move forward %d records'
    Navigator.Hints.SaveBookmarkHint = 'Bookmark current record'
    Navigator.Hints.RestoreBookmarkHint = 'Go back to saved bookmark'
    Navigator.Hints.RecordViewDialogHint = 'View current record'
    Navigator.Hints.LocateDialogHint = 'Locate a specific record'
    Navigator.Hints.FilterDialogHint = 'Filter the dataset'
    Navigator.Hints.SearchDialogHint = 'Search the dataset'
    SearchDialog.SearchCharLabel = '&Search Characters'
    SearchDialog.SearchCharShortLabel = '&Search Char'
    SearchDialog.SearchByLabel = 'Search &By'
    SearchDialog.StatusRecLabel = 'Rec #'
    SearchDialog.StatusOfLabel = 'of'
    SearchDialog.SearchCharHint = 'Enter characters for incremental search'
    SearchDialog.SearchByHint = 'Incremental searching and sorting order'
    LocateDialog.FieldValueLabel = '&Valor del campo'
    LocateDialog.SearchTypeLabel = 'Tipo de &Búsqueda'
    LocateDialog.CaseSensitiveLabel = '&Sensibilidad May/Min'
    LocateDialog.MatchExactLabel = 'Búsqueda &Exacta'
    LocateDialog.MatchStartLabel = 'Búsqueda &parcial con inicio'
    LocateDialog.MatchAnyLabel = 'Búsqueda parcial &donde sea'
    LocateDialog.FieldsLabel = 'C&ampos'
    LocateDialog.BtnFirst = '&Primero'
    LocateDialog.BtnNext = '&Siguiente'
    LocateDialog.BtnCancel = '&Cancela'
    LocateDialog.FieldValueHint = 'Introduzca valor al campo de búsqueda'
    LocateDialog.CaseSensitiveHint = 'La Búsqueda es sensitiva a mayúsculas y minúsculas'
    LocateDialog.MatchExactHint = 'Búsqueda es exitosa solo si existe un valor exactamente igual'
    LocateDialog.MatchStartHint = 'Búsqueda es exitosa si el inicio de los campos coincide'
    LocateDialog.MatchAnyHint = 'Búsqueda es exitosa si cualquier parte del campo coincide'
    LocateDialog.BtnFirstHint = 'Encuentra primero'
    LocateDialog.BtnNextHint = 'Siquiente del Registro Actual'
    LocateDialog.FieldNameHint = 'Select the field to search on'
    MonthCalendar.PopupYearLabel = 'Edit Year'
    MonthCalendar.EnterYearPrompt = 'Enter Valid Year'
    FilterDialog.BtnViewSummary = 'View Su&mmary'
    FilterDialog.BtnViewSummaryHint = 'View summary of current search criteria'
    FilterDialog.BtnNewSearch = '&New Search'
    FilterDialog.BtnNewSearchHint = 'Start a new search'
    FilterDialog.FieldOrderLabel = 'Field Order'
    FilterDialog.FieldOrderHint = 'Sort field list alphabetically or in their natural logical order'
    FilterDialog.AlphabeticLabel = 'Alpha&betic'
    FilterDialog.LogicalLabel = '&Logical'
    FilterDialog.AllFieldsLabel = '&All'
    FilterDialog.SearchedFieldsLabel = '&Searched'
    FilterDialog.StartingRangeLabel = '&Starting Range'
    FilterDialog.EndingRangeLabel = 'En&ding Range'
    FilterDialog.StartingRangeHint = 'Enter starting range for field'
    FilterDialog.EndingRangeHint = 'Enter ending range for field'
    FilterDialog.BtnClearMin = '&Clear'
    FilterDialog.BtnClearMax = 'Cl&ear'
    FilterDialog.BtnClearFilterValue = '&Clear'
    FilterDialog.BtnClearMinHint = 'Clear starting range for field'
    FilterDialog.BtnClearMaxHint = 'Clear ending range for field'
    FilterDialog.BtnClearFilterValueHint = 'Clear the current field'#39's search value'
    FilterDialog.ByValueLabel = 'By &Value'
    FilterDialog.ByRangeLabel = 'By &Range'
    FilterDialog.FieldValueLabel = 'Field &Value'
    FilterDialog.FieldValueHint = 'Enter field'#39's search value'
    FilterDialog.SearchTypeLabel = 'Search Type'
    FilterDialog.SearchTypeHint = 'Specify how the Field Value should be compared'
    FilterDialog.MatchExactLabel = '&Exact Match'
    FilterDialog.MatchStartLabel = '&Partial Match at Beginning'
    FilterDialog.MatchAnyLabel = 'Partial Match Any&where'
    FilterDialog.CaseSensitiveLabel = 'Case Sensi&tive'
    FilterDialog.CaseSensitiveHint = 'Searching is case-sensitive'
    FilterDialog.NonMatchingLabel = 'N&on-matching records'
    FilterDialog.NonMatchingHint = 'Show records that do not match the field value criteria'
    FilterDialog.SummaryFieldLabel = 'Field'
    FilterDialog.SummarySearchLabel = 'Search Type'
    FilterDialog.SummaryValueLabel = 'Value'
    FilterDialog.FieldsLabel = '&Fields'
    FilterDialog.ValueRangeTabHint = 'Search fields by value or by range'
    FilterDialog.AllSearchedTabHint = 'Show all fields or only currently searched fields'
    FilterDialog.ViewSummaryNotText = 'NOT'
    RichEdit.FontNameComboHint = 'Font | Changes the font of the selection'
    RichEdit.FontSizeComboHint = 'Font Size | Changes the font size of the selection'
    RichEdit.NewButtonHint = 'New | Creates a new document'
    RichEdit.LoadButtonHint = 'Load | Load from file'
    RichEdit.SaveAsButtonHint = 'Save As | Save to file'
    RichEdit.PrintButtonHint = 'Print | Prints the active document'
    RichEdit.FindButtonHint = 'Find | Finds the specified text'
    RichEdit.CutButtonHint = 'Cut | Cuts the selection and puts it on the Clipboard'
    RichEdit.CopyButtonHint = 'Copy | Copies the selection and puts it on the Clipboard'
    RichEdit.UndoButtonHint = 'Undo | Reverses the last action'
    RichEdit.PasteButtonHint = 'Paste | Inserts Clipboard contents'
    RichEdit.BoldButtonHint = 'Bold | Makes the selection bold (toggle)'
    RichEdit.UnderlineButtonHint = 
      'Underline | Formats the selection with a continuous underline (t' +
      'oggle)'
    RichEdit.ItalicButtonHint = 'Italic | Makes the selection italic (toggle)'
    RichEdit.LeftButtonHint = 'Align Left | Left-justifies paragraph (toggle)'
    RichEdit.CenterButtonHint = 'Center | Center-justifies paragraph (toggle)'
    RichEdit.RightButtonHint = 'Align Right | Right-justifies paragraph (toggle)'
    RichEdit.BulletButtonHint = 'Bullets | Inserts a bullet on this line (toggle)'
    RichEdit.HighlightButtonHint = 'Highlight Text | Makes the selection highlighted'
    RichEdit.SaveExitHint = 'Save And Exit | Saves changes and exits editor'
    RichEdit.PageSetupHint = 'Page Setup | Changes page layout settings'
    RichEdit.ExitHint = 'Exit'
    RichEdit.ClearHint = 'Erases the Selection'
    RichEdit.SelectAllHint = 'Selects all of the text'
    RichEdit.FindNextHint = 'Repeats the last find'
    RichEdit.ReplaceHint = 'Replaces specific text with different text'
    RichEdit.InsertObjectHint = 'Inserts new embedded object'
    RichEdit.SpellCheckHint = 'Check spelling'
    RichEdit.ToolbarHint = 'Shows or hides the toolbar'
    RichEdit.FormatBarHint = 'Shows or hides the format bar'
    RichEdit.ViewStatusBarHint = 'Shows or hides the status bar'
    RichEdit.OptionsHint = 'Sets options'
    RichEdit.FontHint = 'Selects font for current selection'
    RichEdit.ParagraphHint = 'Formats current or selected paragraph(s)'
    RichEdit.TabsHint = 'Sets tabs'
    RichEdit.CAPLockCaption = 'CAP'
    RichEdit.NUMLockCaption = 'NUM'
    RichEdit.MenuLabels.FileCaption = '&File'
    RichEdit.MenuLabels.LoadCaption = '&Load'
    RichEdit.MenuLabels.SaveAsCaption = 'Save &As'
    RichEdit.MenuLabels.SaveExitCaption = '&Save and Exit'
    RichEdit.MenuLabels.PrintCaption = '&Print'
    RichEdit.MenuLabels.PageSetupCaption = 'Page Set&up'
    RichEdit.MenuLabels.ExitCaption = 'E&xit'
    RichEdit.MenuLabels.EditCaption = '&Edit'
    RichEdit.MenuLabels.UndoCaption = '&Undo'
    RichEdit.MenuLabels.CutCaption = 'Cu&t'
    RichEdit.MenuLabels.CopyCaption = '&Copy'
    RichEdit.MenuLabels.PasteCaption = '&Paste'
    RichEdit.MenuLabels.ClearCaption = 'Cle&ar'
    RichEdit.MenuLabels.SelectallCaption = 'Select A&ll'
    RichEdit.MenuLabels.FindCaption = '&Find'
    RichEdit.MenuLabels.FindNextCaption = 'Find &Next'
    RichEdit.MenuLabels.ReplaceCaption = 'R&eplace'
    RichEdit.MenuLabels.InsertObjectCaption = '&Object...'
    RichEdit.MenuLabels.SpellCheckCaption = 'Check Spelling'
    RichEdit.MenuLabels.ViewCaption = '&View'
    RichEdit.MenuLabels.ToolbarCaption = '&Toolbar'
    RichEdit.MenuLabels.FormatBarCaption = '&Format Bar'
    RichEdit.MenuLabels.ViewStatusBarCaption = '&Status Bar'
    RichEdit.MenuLabels.OptionsCaption = '&Options'
    RichEdit.MenuLabels.FormatCaption = 'F&ormat'
    RichEdit.MenuLabels.FontCaption = '&Font'
    RichEdit.MenuLabels.BulletStyleCaption = '&Bullet Style'
    RichEdit.MenuLabels.ParagraphCaption = '&Paragraph'
    RichEdit.MenuLabels.TabsCaption = '&Tabs'
    RichEdit.MenuLabels.HelpCaption = 'Help'
    RichEdit.PopupMenuLabels.EditCaption = '&Edit'
    RichEdit.PopupMenuLabels.ViewCaption = '&View'
    RichEdit.PopupMenuLabels.CutCaption = 'Cu&t'
    RichEdit.PopupMenuLabels.CopyCaption = '&Copy'
    RichEdit.PopupMenuLabels.PasteCaption = '&Paste'
    RichEdit.PopupMenuLabels.FontCaption = '&Font'
    RichEdit.PopupMenuLabels.BulletStyleCaption = '&Bullet Style'
    RichEdit.PopupMenuLabels.BoldCaption = 'B&old'
    RichEdit.PopupMenuLabels.ItalicCaption = '&Italic'
    RichEdit.PopupMenuLabels.UnderlineCaption = '&Underline'
    RichEdit.PopupMenuLabels.ParagraphCaption = 'P&aragraph'
    RichEdit.PopupMenuLabels.TabsCaption = '&Tabs'
    RichEdit.PopupMenuLabels.FindCaption = 'Fin&d'
    RichEdit.PopupMenuLabels.ReplaceCaption = '&Replace'
    RichEdit.PopupMenuLabels.InsertObjectCaption = 'Insert &Object...'
    RichEdit.PopupMenuLabels.SpellCheckCaption = 'Check Spelling'
    RichEdit.ParagraphDialog.ParagraphDlgCaption = 'Paragraph'
    RichEdit.ParagraphDialog.IndentationGroupBoxCaption = 'Indentation'
    RichEdit.ParagraphDialog.LeftEditHint = 'Left Indentation'
    RichEdit.ParagraphDialog.RightEditHint = 'Right Indentation'
    RichEdit.ParagraphDialog.FirstLineEditHint = 'First Line of Paragraph Indentation'
    RichEdit.ParagraphDialog.AlignmentHint = 'Changes Alignment of Paragraph'
    RichEdit.ParagraphDialog.LeftEditCaption = 'Left:'
    RichEdit.ParagraphDialog.RightEditCaption = 'Right:'
    RichEdit.ParagraphDialog.FirstLineEditCaption = 'First line:'
    RichEdit.ParagraphDialog.SpacingGroupCaption = 'Spacing'
    RichEdit.ParagraphDialog.BeforeParagraphCaption = '&Before'
    RichEdit.ParagraphDialog.AfterParagraphCaption = 'Aft&er'
    RichEdit.ParagraphDialog.WithinParagraphCaption = 'Li&ne Spacing'
    RichEdit.ParagraphDialog.WithinParagraphAtCaption = '&At'
    RichEdit.ParagraphDialog.AlignmentCaption = 'Alignment'
    RichEdit.ParagraphDialog.AlignLeft = 'Left'
    RichEdit.ParagraphDialog.AlignRight = 'Right'
    RichEdit.ParagraphDialog.AlignCenter = 'Center'
    RichEdit.TabDialog.TabDlgCaption = 'Tab'
    RichEdit.TabDialog.TabGroupBoxCaption = '&Tab Stop Position'
    RichEdit.TabDialog.SetTabButtonCaption = 'Set'
    RichEdit.TabDialog.ClearTabButtonCaption = 'Clear'
    RichEdit.TabDialog.ClearAllButtonCaption = 'Clear All'
    RichEdit.TabDialog.TabPositionEditHint = 'Tab Position Edit Box'
    RichEdit.TabDialog.ListBoxHint = 'List of tabs and their positions'
    RichEdit.TabDialog.SetButtonHint = 'Set a new tab position'
    RichEdit.TabDialog.ClearButtonHint = 'Clear the selected tab position'
    RichEdit.TabDialog.ClearAllButtonHint = 'Clear all the tabs'
    UserMessages.wwDBGridDiscardChanges = 'Deshacer cambios a este registro?'
    UserMessages.PictureValidateError = 'Caracteres Inválidos. Campo : '
    UserMessages.LocateNoMatches = 'Registro no encontrado'
    UserMessages.LocateNoMoreMatches = 'No hay más registros'
    UserMessages.MemoChangesWarning = 'Los cambios han sido hechos! Esta seguro que quiere cancelar?'
    UserMessages.RichEditExitWarning = 'Changes have been made!  Do you wish to save your changes?'
    UserMessages.RichEditClearWarning = 'Clear entire text?'
    UserMessages.RichEditSpellCheckComplete = 'The spell check is complete.'
    UserMessages.RichEditMSWordNotFound = 'Unable to start Microsoft Word'#39's Spell Checker.'
    UserMessages.FilterDlgNoCriteria = 'No ha seleccionado ningún criterio de búsqueda'
    UserMessages.RecordViewExitWarning = 'Changes have been made!  Do you wish to save your changes?'
    OKCancelBitmapped = True
    BtnOKCaption = '&OK'
    BtnCancelCaption = 'Cancel'
    CheckBoxInGridStyle = cbStyleAuto
    VersionInfoPower = '5.0 Pre B'
    FilterMemoSize = 65536
    IniFileName = 'delphi32.ini'
    DialogFontStyle = []
    Connected = True
    Left = 32
    Top = 248
  end
  object QTransac: TQuery
    DatabaseName = 'dBsuc'
    SQL.Strings = (
      'SELECT '
      ' O.DESC_C_ID_PRIM, '
      ' R.ID_TRANS_CAJA, '
      ' R.ID_COD_RESP, '
      ' R.FH_REGISTRO, '
      ' R.ID_CONTRATO, '
      ' R.IMP_MOVTO, '
      ' R.NUM_CHEQUE, '
      ' R.TX_REFERENCIA, '
      ' R.ID_TRANS_GPO,'
      ' C.CVE_SUCURSAL ||'#39' '#39'|| d.id_transaccion AS CERTIFICACION, '
      ' pob.DESC_POBLACION||'#39' '#39'||ciu.desc_poblacION AS PLAZA,'
      ' P.NOMBRE'
      'FROM CJ_OPERACION O, '
      '     DV_TRANSACCION d,'
      '     CJ_BITACORA R, '
      '     CJ_CAJA J, '
      '     CJ_SUCURSAL C, '
      '     UNIDAD_NEGOCIO u, '
      '     POBLACION pob, '
      '     POBLACION ciu, '
      '     USUARIO U, '
      '     PERSONA P '
      'WHERE R.ID_TRANS_GPO =:GRUPO'
      'AND D.ID_CONTRATO    =R.ID_CONTRATO'
      'AND D.ID_TRANS_ORIGEN=R.ID_TRANS_CAJA'
      'AND R.CVE_OPER_CAJA  =O.CVE_OPER_CAJA '
      'AND J.ID_SUCURSAL    =R.ID_SUCURSAL'
      'AND J.ID_CAJA        =R.ID_CAJA'
      'AND C.ID_SUCURSAL    =R.ID_SUCURSAL'
      'AND U.ID_ENTIDAD     =C.ID_ENTIDAD'
      'AND pob.cve_poblacion=u.cve_poblacion'
      'AND ciu.cve_poblacion=pob.CVE_POBLAC_UBIC'
      'AND U.CVE_USUARIO    =J.CVE_USUARIO'
      'AND P.ID_PERSONA     =U.ID_PERSONA'
      '')
    Left = 376
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'GRUPO'
        ParamType = ptUnknown
      end>
    object QTransacDESC_C_ID_PRIM: TStringField
      FieldName = 'DESC_C_ID_PRIM'
      Origin = 'CJ_OPERACION.DESC_C_ID_PRIM'
    end
    object QTransacID_TRANS_CAJA: TFloatField
      FieldName = 'ID_TRANS_CAJA'
      Origin = 'CJ_BITACORA.ID_TRANS_CAJA'
    end
    object QTransacID_COD_RESP: TFloatField
      FieldName = 'ID_COD_RESP'
      Origin = 'CJ_BITACORA.ID_COD_RESP'
    end
    object QTransacFH_REGISTRO: TDateTimeField
      FieldName = 'FH_REGISTRO'
      Origin = 'CJ_BITACORA.FH_REGISTRO'
    end
    object QTransacID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
      Origin = 'CJ_BITACORA.ID_CONTRATO'
    end
    object QTransacIMP_MOVTO: TFloatField
      FieldName = 'IMP_MOVTO'
      Origin = 'CJ_BITACORA.IMP_MOVTO'
    end
    object QTransacNUM_CHEQUE: TFloatField
      FieldName = 'NUM_CHEQUE'
      Origin = 'CJ_BITACORA.NUM_CHEQUE'
    end
    object QTransacTX_REFERENCIA: TStringField
      FieldName = 'TX_REFERENCIA'
      Origin = 'CJ_BITACORA.TX_REFERENCIA'
      Size = 200
    end
    object QTransacID_TRANS_GPO: TFloatField
      FieldName = 'ID_TRANS_GPO'
      Origin = 'CJ_BITACORA.ID_TRANS_GPO'
    end
    object QTransacCERTIFICACION: TStringField
      FieldName = 'CERTIFICACION'
      Size = 43
    end
    object QTransacPLAZA: TStringField
      FieldName = 'PLAZA'
      Size = 81
    end
    object QTransacNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
  end
end
