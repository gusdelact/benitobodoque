object WCrTransaccion: TWCrTransaccion
  Left = 0
  Top = 1
  Width = 510
  Height = 443
  Caption = 'Consulta de Transacciones'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbID_TRANSACCION: TLabel
    Left = 8
    Top = 10
    Width = 79
    Height = 13
    Caption = 'No. Transaccion'
  end
  object lbID_GRUPO_TRANSAC: TLabel
    Left = 280
    Top = 10
    Width = 91
    Height = 13
    Caption = 'Grupo Transacción'
  end
  object lbCVE_OPERACION: TLabel
    Left = 8
    Top = 32
    Width = 79
    Height = 13
    Caption = 'Clave Operación'
  end
  object lbID_CONTRATO: TLabel
    Left = 8
    Top = 54
    Width = 40
    Height = 13
    Caption = 'Contrato'
  end
  object lbID_CREDITO: TLabel
    Left = 8
    Top = 76
    Width = 54
    Height = 13
    Caption = 'Disposición'
  end
  object lbID_PERIODO: TLabel
    Left = 8
    Top = 164
    Width = 36
    Height = 13
    Caption = 'Periodo'
  end
  object lbID_CESION: TLabel
    Left = 8
    Top = 209
    Width = 32
    Height = 13
    Caption = 'Cesión'
  end
  object lbID_DOCUMENTO: TLabel
    Left = 8
    Top = 186
    Width = 55
    Height = 13
    Caption = 'Documento'
  end
  object lbCVE_COMISION: TLabel
    Left = 8
    Top = 120
    Width = 42
    Height = 13
    Caption = 'Comisión'
  end
  object lbIMP_NETO: TLabel
    Left = 8
    Top = 274
    Width = 61
    Height = 13
    Caption = 'Importe Neto'
  end
  object lbID_CTO_LIQ: TLabel
    Left = 8
    Top = 98
    Width = 46
    Height = 13
    Caption = 'Chequera'
  end
  object lbID_COD_RESP: TLabel
    Left = 8
    Top = 254
    Width = 61
    Height = 13
    Caption = 'Codigo Resp'
  end
  object lbTX_NOTA: TLabel
    Left = 8
    Top = 296
    Width = 23
    Height = 13
    Caption = 'Nota'
  end
  object lbTIPO_CAMBIO: TLabel
    Left = 280
    Top = 274
    Width = 59
    Height = 13
    Caption = 'Tipo Cambio'
  end
  object lbCVE_TIPO_MOVTO: TLabel
    Left = 8
    Top = 231
    Width = 78
    Height = 13
    Caption = 'Tipo Movimiento'
  end
  object lbCVE_APLIC_SALDO: TLabel
    Left = 8
    Top = 142
    Width = 89
    Height = 13
    Caption = 'Clave Aplica Saldo'
  end
  object lbCVE_USU_ALTA: TLabel
    Left = 264
    Top = 340
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object lbFH_ALTA: TLabel
    Left = 8
    Top = 340
    Width = 51
    Height = 13
    Caption = 'Fecha Alta'
  end
  object lbCVE_USU_CANC: TLabel
    Left = 264
    Top = 362
    Width = 78
    Height = 13
    Caption = 'Usuario Cancela'
  end
  object lbFH_CANCELA: TLabel
    Left = 8
    Top = 362
    Width = 72
    Height = 13
    Caption = 'Fecha Cancela'
  end
  object lbSIT_TRANSACCION: TLabel
    Left = 8
    Top = 318
    Width = 47
    Height = 13
    Caption = 'Situación '
  end
  object edID_TRANSACCION: TEdit
    Tag = 50
    Left = 104
    Top = 6
    Width = 161
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edID_GRUPO_TRANSAC: TEdit
    Tag = 18
    Left = 392
    Top = 6
    Width = 105
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edCVE_OPERACION: TEdit
    Tag = 18
    Left = 104
    Top = 28
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object edID_CONTRATO: TEdit
    Tag = 18
    Left = 104
    Top = 50
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object edID_CREDITO: TEdit
    Tag = 18
    Left = 104
    Top = 72
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object edID_PERIODO: TEdit
    Tag = 18
    Left = 104
    Top = 160
    Width = 120
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 8
  end
  object edID_CESION: TEdit
    Tag = 18
    Left = 104
    Top = 204
    Width = 120
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 10
  end
  object edID_DOCUMENTO: TEdit
    Tag = 18
    Left = 104
    Top = 182
    Width = 120
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 9
  end
  object edCVE_COMISION: TEdit
    Tag = 18
    Left = 104
    Top = 116
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 6
  end
  object edIMP_NETO: TEdit
    Tag = 18
    Left = 104
    Top = 270
    Width = 120
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 13
  end
  object edID_CTO_LIQ: TEdit
    Tag = 18
    Left = 104
    Top = 94
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
  end
  object edID_COD_RESP: TEdit
    Tag = 18
    Left = 104
    Top = 248
    Width = 120
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 12
  end
  object edTX_NOTA: TEdit
    Tag = 18
    Left = 104
    Top = 292
    Width = 393
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 15
  end
  object edTIPO_CAMBIO: TEdit
    Tag = 18
    Left = 376
    Top = 270
    Width = 120
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 14
  end
  object edCVE_TIPO_MOVTO: TEdit
    Tag = 18
    Left = 104
    Top = 226
    Width = 120
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 11
  end
  object edCVE_APLIC_SALDO: TEdit
    Tag = 18
    Left = 104
    Top = 138
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 7
  end
  object edCVE_USU_ALTA: TEdit
    Tag = 18
    Left = 357
    Top = 336
    Width = 140
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 18
  end
  object edFH_ALTA: TEdit
    Tag = 18
    Left = 104
    Top = 336
    Width = 140
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 17
  end
  object edCVE_USU_CANC: TEdit
    Tag = 18
    Left = 357
    Top = 358
    Width = 140
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 20
  end
  object edFH_CANCELA: TEdit
    Tag = 18
    Left = 104
    Top = 358
    Width = 140
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 19
  end
  object edDESC_OPERACION: TEdit
    Left = 184
    Top = 28
    Width = 315
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 22
  end
  object edDESC_CREDITO: TEdit
    Left = 184
    Top = 72
    Width = 315
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 24
  end
  object gbFechas: TGroupBox
    Left = 232
    Top = 160
    Width = 265
    Height = 105
    Caption = 'Fechas'
    TabOrder = 21
    object lbF_VALOR: TLabel
      Left = 24
      Top = 28
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object lbF_PROG_PAGO: TLabel
      Left = 24
      Top = 52
      Width = 99
      Height = 13
      Caption = 'Programada de pago'
    end
    object lbF_OPERACION: TLabel
      Left = 24
      Top = 76
      Width = 49
      Height = 13
      Caption = 'Operación'
    end
    object edF_VALOR: TEdit
      Tag = 18
      Left = 143
      Top = 24
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object edF_PROG_PAGO: TEdit
      Tag = 18
      Left = 143
      Top = 48
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object edF_OPERACION: TEdit
      Tag = 18
      Left = 143
      Top = 72
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
  end
  object edDESC_COMISION: TEdit
    Left = 184
    Top = 116
    Width = 315
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 26
  end
  object edDESC_CONTRATO: TEdit
    Left = 184
    Top = 50
    Width = 315
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 23
  end
  object edDESC_APLIC_SALDO: TEdit
    Left = 184
    Top = 138
    Width = 315
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 27
  end
  object edDESC_CTO_LIQ: TEdit
    Left = 184
    Top = 94
    Width = 315
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 25
  end
  object PnDatos: TPanel
    Left = 1
    Top = 382
    Width = 496
    Height = 21
    TabOrder = 28
    object lbEmpresa: TLabel
      Left = 11
      Top = 2
      Width = 42
      Height = 8
      Caption = 'EMPRESA :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbUsuario: TLabel
      Left = 11
      Top = 9
      Width = 44
      Height = 8
      Caption = 'USUARIO : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbFecha: TLabel
      Left = 248
      Top = 2
      Width = 50
      Height = 8
      Caption = 'FECHA HOY :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbPerfil: TLabel
      Left = 248
      Top = 9
      Width = 33
      Height = 8
      Caption = 'PERFIL :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDUsuario: TLabel
      Left = 75
      Top = 9
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDPerfil: TLabel
      Left = 312
      Top = 9
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDFecha: TLabel
      Left = 312
      Top = 2
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDEmpresa: TLabel
      Left = 75
      Top = 2
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object edSIT_TRANSACCION: TComboBox
    Tag = 18
    Left = 104
    Top = 314
    Width = 140
    Height = 21
    Style = csSimple
    ItemHeight = 13
    TabOrder = 16
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnBuscar = InterForma1Buscar
    msgSinRegistros = 'No existe un Registro para realizar la operación.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = '¿Desea Eliminar el Registro Actual?'
    FormaTipo = ftConsulta
    CanEdit = False
    IsNewData = False
    ShowBtnNuevo = False
    ShowBtnModificar = False
    ShowBtnAceptar = False
    ShowBtnCancelar = False
    ShowBtnEliminar = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowBtnBuscar = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 434
    Top = 2
  end
end
