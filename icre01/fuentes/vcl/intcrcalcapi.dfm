object WCrCalCapitaliz: TWCrCalCapitaliz
  Left = 261
  Top = 208
  Width = 635
  Height = 280
  Caption = 'Parámetros de Capitalización'
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
  object lbF_ALTA: TLabel
    Left = 7
    Top = 154
    Width = 95
    Height = 13
    AutoSize = False
    Caption = 'Fecha de Alta'
  end
  object lbF_MODIFICA: TLabel
    Left = 7
    Top = 177
    Width = 95
    Height = 13
    AutoSize = False
    Caption = 'Fecha Modifica'
  end
  object LBCVE_USU_ALTA: TLabel
    Left = 218
    Top = 154
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object lbCVE_USU_MODIFICA: TLabel
    Left = 217
    Top = 178
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object lbCVE_REGLA: TLabel
    Left = 9
    Top = 8
    Width = 179
    Height = 13
    Caption = 'Númeral de la Regla de Capitalización'
  end
  object chB_REG_DEUDA: TCheckBox
    Tag = 50
    Left = 375
    Top = 4
    Width = 170
    Height = 21
    HelpContext = 1001
    Caption = 'Registrados en Deuda Pública'
    TabOrder = 1
    OnExit = chB_REG_DEUDAExit
  end
  object edF_MODIFICA: TEdit
    Left = 88
    Top = 174
    Width = 103
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object edF_ALTA: TEdit
    Left = 88
    Top = 150
    Width = 103
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 307
    Top = 174
    Width = 106
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
  end
  object edCVE_USU_ALTA: TEdit
    Left = 307
    Top = 150
    Width = 106
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
  end
  object rgSIT_CAL_CAPITALIT: TRadioGroup
    Tag = 18
    Left = 419
    Top = 142
    Width = 206
    Height = 56
    HelpContext = 1300
    Caption = 'Sit. Capitalización'
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Cancelado')
    TabOrder = 4
    TabStop = True
    OnExit = rgSIT_CAL_CAPITALITExit
  end
  object MsgPanel: TPanel
    Left = -2
    Top = 202
    Width = 627
    Height = 21
    TabOrder = 9
  end
  object PnDatos: TPanel
    Left = -2
    Top = 224
    Width = 627
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
  object GroupBox1: TGroupBox
    Left = 7
    Top = 85
    Width = 618
    Height = 56
    Caption = 'Porcentajes y Factorajes'
    TabOrder = 3
    object lbPCT_PONDERA: TLabel
      Left = 7
      Top = 18
      Width = 132
      Height = 31
      AutoSize = False
      Caption = 'Porcentaje de Ponderación por Riesgo de Crédito'
      WordWrap = True
    end
    object lbPCT_CAPITALIZA: TLabel
      Left = 444
      Top = 18
      Width = 76
      Height = 28
      AutoSize = False
      Caption = 'Factor de Capitalización'
      WordWrap = True
    end
    object lbPCT_REQUERIDO: TLabel
      Left = 251
      Top = 18
      Width = 75
      Height = 31
      AutoSize = False
      Caption = 'Porcentaje de Requerimiento'
      WordWrap = True
    end
    object lbPCT_CAPITALIZA1: TLabel
      Left = 603
      Top = 27
      Width = 8
      Height = 13
      Caption = '%'
    end
    object edPCT_PONDERA: TInterEdit
      Tag = 18
      Left = 143
      Top = 22
      Width = 96
      Height = 21
      HelpContext = 1201
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edPCT_PONDERAExit
      DisplayMask = '##,###,##0.0000'
      MaxLength = 18
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
    object edPCT_CAPITALIZA: TInterEdit
      Left = 518
      Top = 22
      Width = 80
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '##,###,##0.00'
      MaxLength = 18
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 2
      Enabled = False
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edPCT_REQUERIDO: TInterEdit
      Tag = 18
      Left = 328
      Top = 22
      Width = 96
      Height = 21
      HelpContext = 1202
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edPCT_PONDERAExit
      DisplayMask = '##,###,##0.0000'
      MaxLength = 18
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
  end
  object GroupBox2: TGroupBox
    Left = 6
    Top = 24
    Width = 617
    Height = 56
    Caption = 'Rangos'
    TabOrder = 2
    object lbNUM_MIN_CALIFIC: TLabel
      Left = 8
      Top = 20
      Width = 127
      Height = 26
      AutoSize = False
      Caption = 'Mínimo de Calificaciones por Agencias '
      WordWrap = True
    end
    object lbNUM_MIN_NIVEL: TLabel
      Left = 218
      Top = 20
      Width = 95
      Height = 29
      AutoSize = False
      Caption = 'Rango de Categorías Menor'
      WordWrap = True
    end
    object lbNUM_MAX_NIVEL: TLabel
      Left = 444
      Top = 20
      Width = 95
      Height = 32
      AutoSize = False
      Caption = 'Rango de Categorías Mayor'
      WordWrap = True
    end
    object edNUM_MIN_CALIFIC: TInterEdit
      Tag = 50
      Left = 145
      Top = 23
      Width = 40
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      OnExit = edNUM_MIN_CALIFICExit
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
    object edNUM_MAX_NIVEL: TInterEdit
      Tag = 50
      Left = 558
      Top = 23
      Width = 40
      Height = 21
      HelpContext = 1102
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      OnExit = edNUM_MIN_CALIFICExit
      DisplayMask = '#0'
      MaxLength = 6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 2
      UseReType = False
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edNUM_MIN_NIVEL: TInterEdit
      Tag = 50
      Left = 328
      Top = 23
      Width = 40
      Height = 21
      HelpContext = 1101
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      OnExit = edNUM_MIN_CALIFICExit
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
  end
  object edCVE_REGLA: TEdit
    Tag = 50
    Left = 201
    Top = 3
    Width = 104
    Height = 21
    HelpContext = 1000
    MaxLength = 6
    TabOrder = 0
    OnExit = edCVE_REGLAExit
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
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 592
    Top = 137
  end
end
