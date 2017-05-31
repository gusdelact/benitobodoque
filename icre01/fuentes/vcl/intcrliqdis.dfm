object WCrLiquidaDisp: TWCrLiquidaDisp
  Left = 300
  Top = 119
  Width = 534
  Height = 397
  Caption = 'Medios de Liquidación para Disposiciones'
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
  object lbCVE_LIQUIDACION: TLabel
    Left = 8
    Top = 10
    Width = 106
    Height = 13
    Caption = 'Medios de Liquidación'
  end
  object Label8: TLabel
    Left = 16
    Top = 195
    Width = 41
    Height = 13
    Caption = 'Prioridad'
  end
  object edCVE_LIQUIDACION: TEdit
    Tag = 50
    Left = 120
    Top = 6
    Width = 73
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 2
    TabOrder = 0
    OnExit = edCVE_LIQUIDACIONExit
  end
  object edDESC_LIQUIDACION: TEdit
    Tag = 18
    Left = 196
    Top = 6
    Width = 326
    Height = 21
    HelpContext = 2001
    CharCase = ecUpperCase
    MaxLength = 250
    TabOrder = 1
    OnExit = edDESC_LIQUIDACIONExit
  end
  object PnDatos: TPanel
    Left = 8
    Top = 341
    Width = 513
    Height = 21
    TabOrder = 9
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
  object GroupBox4: TGroupBox
    Left = 8
    Top = 257
    Width = 514
    Height = 60
    Caption = 'Registro'
    TabOrder = 8
    object lbF_ALTA: TLabel
      Left = 285
      Top = 15
      Width = 30
      Height = 13
      Caption = 'F. Alta'
    end
    object lbF_MODIF: TLabel
      Left = 285
      Top = 39
      Width = 69
      Height = 13
      Caption = 'Hora. Modifica'
    end
    object lbUSUA_ALTA: TLabel
      Left = 21
      Top = 16
      Width = 43
      Height = 13
      Caption = 'Usu. Alta'
    end
    object lbUSUA_MODIF: TLabel
      Left = 21
      Top = 39
      Width = 65
      Height = 13
      Caption = 'Usu. Modifica'
    end
    object edFH_CAPTURA: TEdit
      Left = 366
      Top = 11
      Width = 130
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edH_MODIFICA: TEdit
      Left = 366
      Top = 35
      Width = 130
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edCVE_USUA_ALTA: TEdit
      Left = 106
      Top = 12
      Width = 110
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edCVE_USUA_MODIF: TEdit
      Left = 106
      Top = 35
      Width = 110
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
  end
  object rgSIT_LIQUIDA: TRadioGroup
    Tag = 18
    Left = 8
    Top = 222
    Width = 513
    Height = 33
    HelpContext = 8001
    Caption = 'Situación'
    Columns = 2
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Cancelado')
    TabOrder = 7
    TabStop = True
    OnExit = rgSIT_LIQUIDAExit
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 88
    Width = 514
    Height = 49
    Caption = 'Horario de Pago'
    TabOrder = 3
    object Label4: TLabel
      Left = 8
      Top = 23
      Width = 25
      Height = 13
      Caption = 'Inicio'
    end
    object Label6: TLabel
      Left = 320
      Top = 23
      Width = 22
      Height = 13
      Caption = 'Final'
    end
    object edH_INICIO: TInterEdit
      Tag = 18
      Left = 114
      Top = 19
      Width = 100
      Height = 21
      HelpContext = 4001
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      OnExit = edH_INICIOExit
      DisplayMask = '#####0'
      MaxLength = 6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 0
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edH_FINAL: TInterEdit
      Tag = 18
      Left = 402
      Top = 19
      Width = 100
      Height = 21
      HelpContext = 4501
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      OnExit = edH_FINALExit
      DisplayMask = '#####0'
      MaxLength = 6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 1
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object edID_PRIORIDAD: TInterEdit
    Tag = 18
    Left = 122
    Top = 199
    Width = 100
    Height = 21
    HelpContext = 6001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    OnExit = edID_PRIORIDADExit
    DisplayMask = '#0'
    MaxLength = 6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 5
    UseReType = False
    UseSep = False
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object cbB_APLICA_CLABE: TCheckBox
    Tag = 18
    Left = 330
    Top = 201
    Width = 191
    Height = 17
    HelpContext = 7001
    Alignment = taLeftJustify
    Caption = 'Aplica CLABE'
    TabOrder = 6
    OnExit = cbB_APLICA_CLABEExit
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 144
    Width = 514
    Height = 49
    Caption = 'Rango de Importes'
    TabOrder = 4
    object Label5: TLabel
      Left = 8
      Top = 19
      Width = 32
      Height = 13
      Caption = 'Inferior'
    end
    object Label7: TLabel
      Left = 320
      Top = 19
      Width = 39
      Height = 13
      Caption = 'Superior'
    end
    object edIMP_INFERIOR: TInterEdit
      Tag = 18
      Left = 114
      Top = 15
      Width = 100
      Height = 21
      HelpContext = 5001
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edIMP_INFERIORExit
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 0
      UseReType = True
      UseSep = True
      UseDisplay = True
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_SUPERIOR: TInterEdit
      Tag = 18
      Left = 402
      Top = 15
      Width = 100
      Height = 21
      HelpContext = 5501
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edIMP_SUPERIORExit
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 1
      UseReType = True
      UseSep = True
      UseDisplay = True
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object rgCVE_TIPO_MOVTO: TRadioGroup
    Tag = 18
    Left = 9
    Top = 27
    Width = 513
    Height = 59
    HelpContext = 3001
    BiDiMode = bdLeftToRight
    Caption = 'Tipo Movimiento'
    Columns = 3
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'SPEUA'
      'TEF'
      'Cheque'
      'Linea Bancaria'
      'Liquidación Manual'
      'Trasp. Cheqra. Bco. Inter.')
    ParentBiDiMode = False
    TabOrder = 2
    TabStop = True
    OnExit = rgCVE_TIPO_MOVTOExit
  end
  object MsgPanel: TPanel
    Left = 8
    Top = 319
    Width = 513
    Height = 21
    TabOrder = 10
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnAntesAceptar = InterForma1AntesAceptar
    msgSinRegistros = 'No existe un Registro para realizar la operación.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = '¿Desea Eliminar el Registro Actual?'
    FormaEstilo = feVertical
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 466
    Top = 2
  end
end
