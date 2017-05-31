object WCrFideicoReglas: TWCrFideicoReglas
  Left = 331
  Top = 215
  Width = 550
  Height = 305
  Caption = 'Reglas para Emisión Solicitudes Fideicomisos'
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
  object lbCVE_FID_REGLA: TLabel
    Left = 7
    Top = 22
    Width = 73
    Height = 13
    Caption = 'Clave de Regla'
  end
  object lbDESC_FID_REGLA: TLabel
    Left = 160
    Top = 5
    Width = 56
    Height = 13
    Caption = 'Descripción'
  end
  object lbF_ALTA: TLabel
    Left = 7
    Top = 176
    Width = 95
    Height = 13
    AutoSize = False
    Caption = 'Fecha de Alta'
  end
  object lbF_MODIFICA: TLabel
    Left = 7
    Top = 199
    Width = 95
    Height = 13
    AutoSize = False
    Caption = 'Fecha Modifica'
  end
  object LBCVE_USU_ALTA: TLabel
    Left = 218
    Top = 176
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object lbCVE_USU_MODIFICA: TLabel
    Left = 217
    Top = 200
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object MsgPanel: TPanel
    Left = 1
    Top = 224
    Width = 539
    Height = 21
    TabOrder = 9
  end
  object PnDatos: TPanel
    Left = 2
    Top = 246
    Width = 538
    Height = 21
    TabOrder = 10
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
      Left = 312
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
      Left = 312
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
      Left = 376
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
      Left = 376
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
  object grF_VENCIMIENTO: TGroupBox
    Left = 4
    Top = 44
    Width = 536
    Height = 42
    Caption = 'Rango Fecha de Vencimiento'
    TabOrder = 2
    object Bevel1: TBevel
      Left = 264
      Top = 10
      Width = 257
      Height = 27
    end
    object lbDIA_VENC_INI: TLabel
      Left = 9
      Top = 19
      Width = 48
      Height = 13
      Caption = 'Día Inicial'
    end
    object lbDIA_VENC_FIN: TLabel
      Left = 273
      Top = 19
      Width = 43
      Height = 13
      Caption = 'Día Final'
    end
    object edDIA_VENC_INI: TInterEdit
      Tag = 18
      Left = 155
      Top = 15
      Width = 66
      Height = 21
      HelpContext = 1200
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      OnExit = edDIA_VENC_INIExit
      DisplayMask = '#0'
      MaxLength = 6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 0
      UseReType = False
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edDIA_VENC_FIN: TInterEdit
      Tag = 18
      Left = 329
      Top = 13
      Width = 66
      Height = 21
      HelpContext = 1201
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      OnExit = edDIA_VENC_FINExit
      DisplayMask = '#0'
      MaxLength = 6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 1
      UseReType = False
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object cbB_VENC_SIG_MES: TCheckBox
      Left = 410
      Top = 15
      Width = 97
      Height = 17
      Caption = 'Siguiente Mes'
      Enabled = False
      TabOrder = 2
    end
  end
  object grSolicitud: TGroupBox
    Left = 3
    Top = 88
    Width = 536
    Height = 77
    Caption = 'Solicitud de Pago'
    TabOrder = 3
    object Bevel2: TBevel
      Left = 264
      Top = 11
      Width = 257
      Height = 27
    end
    object lbDIA_SOL_INI: TLabel
      Left = 9
      Top = 18
      Width = 48
      Height = 13
      Caption = 'Día Inicial'
    end
    object lbDIA_SOL_FIN: TLabel
      Left = 277
      Top = 19
      Width = 43
      Height = 13
      Caption = 'Día Final'
    end
    object lbDIA_SOL_ANTIC: TLabel
      Left = 9
      Top = 38
      Width = 138
      Height = 26
      AutoSize = False
      Caption = 'Días de Anticipación Emisión Solicitud de Pago'
      WordWrap = True
    end
    object edDIA_SOL_INI: TInterEdit
      Tag = 18
      Left = 156
      Top = 13
      Width = 66
      Height = 21
      HelpContext = 1300
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      OnExit = edDIA_SOL_INIExit
      DisplayMask = '#0'
      MaxLength = 6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 0
      UseReType = False
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edDIA_SOL_FIN: TInterEdit
      Tag = 18
      Left = 331
      Top = 15
      Width = 67
      Height = 21
      HelpContext = 1301
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      OnExit = edDIA_SOL_FINExit
      DisplayMask = '#0'
      MaxLength = 6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 1
      UseReType = False
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edDIA_SOL_ANTIC: TInterEdit
      Tag = 18
      Left = 156
      Top = 40
      Width = 66
      Height = 21
      HelpContext = 1400
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      OnExit = edDIA_SOL_ANTICExit
      DisplayMask = '#0'
      MaxLength = 6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 3
      UseReType = False
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object cbB_SOL_SIG_MES: TCheckBox
      Left = 412
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Siguiente Mes'
      Enabled = False
      TabOrder = 2
    end
  end
  object edCVE_FID_REGLA: TEdit
    Tag = 50
    Left = 85
    Top = 17
    Width = 70
    Height = 21
    HelpContext = 1000
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 0
    OnExit = edCVE_FID_REGLAExit
  end
  object edDESC_FID_REGLA: TEdit
    Tag = 18
    Left = 157
    Top = 17
    Width = 381
    Height = 21
    HelpContext = 1100
    CharCase = ecUpperCase
    MaxLength = 60
    TabOrder = 1
    OnExit = edDESC_FID_REGLAExit
  end
  object edF_MODIFICA: TEdit
    Left = 88
    Top = 196
    Width = 103
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object edF_ALTA: TEdit
    Left = 88
    Top = 172
    Width = 103
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 307
    Top = 196
    Width = 106
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
  end
  object edCVE_USU_ALTA: TEdit
    Left = 307
    Top = 172
    Width = 106
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
  end
  object rgSIT_FID_REGLA: TRadioGroup
    Tag = 18
    Left = 434
    Top = 166
    Width = 107
    Height = 56
    HelpContext = 1500
    Caption = 'Sit. Regla'
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Cancelado')
    TabOrder = 4
    TabStop = True
    OnExit = rgSIT_FID_REGLAExit
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesEliminar = InterForma1AntesEliminar
    msgSinRegistros = 'No existe un Registro para realizar la operación.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = '¿Desea Eliminar el Registro Actual?'
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 509
    Top = 238
  end
end
