object WCrCapital: TWCrCapital
  Left = 218
  Top = 103
  Width = 586
  Height = 425
  Caption = 'Periodo(s) de Capital'
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
  object lbID_CREDITO: TLabel
    Left = 8
    Top = 10
    Width = 54
    Height = 13
    Caption = 'Disposición'
  end
  object lbNUM_PERIODO: TLabel
    Left = 8
    Top = 36
    Width = 36
    Height = 13
    Caption = 'Periodo'
  end
  object lbPLAZO: TLabel
    Left = 198
    Top = 35
    Width = 52
    Height = 13
    Caption = 'Días Plazo'
  end
  object edID_CREDITO: TEdit
    Tag = 562
    Left = 107
    Top = 6
    Width = 86
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edNUM_PERIODO: TEdit
    Tag = 50
    Left = 107
    Top = 30
    Width = 49
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object chB_COB_AUT: TCheckBox
    Tag = 18
    Left = 395
    Top = 32
    Width = 145
    Height = 21
    Caption = 'Cobranza Automática'
    TabOrder = 5
  end
  object edPLAZO: TEdit
    Tag = 18
    Left = 259
    Top = 31
    Width = 49
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object grbxFechas: TGroupBox
    Tag = 18
    Left = 296
    Top = 172
    Width = 265
    Height = 105
    Caption = 'Fechas...'
    TabOrder = 8
    object lbF_VENCIMIENTO: TLabel
      Left = 24
      Top = 26
      Width = 58
      Height = 13
      Caption = 'Vencimiento'
    end
    object lbF_PROG_PAGO: TLabel
      Left = 24
      Top = 52
      Width = 100
      Height = 13
      Caption = 'Programada de Pago'
    end
    object lbF_PAGO: TLabel
      Left = 24
      Top = 79
      Width = 25
      Height = 13
      Caption = 'Pago'
    end
    object edF_VENCIMIENTO: TEdit
      Tag = 18
      Left = 141
      Top = 22
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object dtpF_VENCIMIENTO: TInterDateTimePicker
      Tag = 18
      Left = 232
      Top = 22
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 37770.450694537
      Time = 37770.450694537
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      Edit = edF_VENCIMIENTO
      Formato = dfDate
    end
    object edF_PROG_PAGO: TEdit
      Tag = 18
      Left = 141
      Top = 47
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object dtpF_PROG_PAGO: TInterDateTimePicker
      Tag = 18
      Left = 232
      Top = 47
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 37770.450694537
      Time = 37770.450694537
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      Edit = edF_PROG_PAGO
      Formato = dfDate
    end
    object dtpF_PAGO: TInterDateTimePicker
      Tag = 18
      Left = 232
      Top = 73
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 37770.450694537
      Time = 37770.450694537
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 5
      Edit = edF_PAGO
      Formato = dfDate
    end
    object edF_PAGO: TEdit
      Tag = 18
      Left = 141
      Top = 73
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
    end
  end
  object grbxImportes: TGroupBox
    Tag = 18
    Left = 8
    Top = 63
    Width = 273
    Height = 290
    Caption = 'Importes...'
    TabOrder = 6
    object lbIMP_BENEF_GOB: TLabel
      Left = 16
      Top = 108
      Width = 105
      Height = 13
      Caption = 'Beneficio de Gobierno'
    end
    object lbIMP_MORATORIO: TLabel
      Left = 16
      Top = 134
      Width = 49
      Height = 13
      Caption = 'Moratorias'
    end
    object lbIMP_PAGADO_MORA: TLabel
      Left = 16
      Top = 159
      Width = 84
      Height = 13
      Caption = 'Pagado Moratorio'
    end
    object lbIMP_COND_MORA: TLabel
      Left = 16
      Top = 186
      Width = 122
      Height = 13
      Caption = 'Condonado de Moratorios'
    end
    object lbIMP_CAPITAL: TLabel
      Left = 16
      Top = 26
      Width = 32
      Height = 13
      Caption = 'Capital'
    end
    object lbIMP_PAGADO: TLabel
      Left = 16
      Top = 48
      Width = 37
      Height = 13
      Caption = 'Pagado'
    end
    object lbIMP_BENEF_BCO: TLabel
      Left = 16
      Top = 82
      Width = 78
      Height = 13
      Caption = 'Beneficio Banco'
    end
    object Bevel1: TBevel
      Left = 8
      Top = 72
      Width = 257
      Height = 7
      Shape = bsTopLine
    end
    object lblIMP_IVA_COND_MOR: TLabel
      Left = 16
      Top = 267
      Width = 132
      Height = 13
      Caption = 'Condonado de IVA de Mora'
    end
    object lblIMP_PAG_IVA_MORA: TLabel
      Left = 16
      Top = 243
      Width = 114
      Height = 13
      Caption = 'Pagado de IVA de Mora'
    end
    object lblIMP_IVA_MORA: TLabel
      Left = 16
      Top = 219
      Width = 59
      Height = 13
      Caption = 'IVA de Mora'
    end
    object Bevel2: TBevel
      Left = 7
      Top = 206
      Width = 257
      Height = 7
      Shape = bsTopLine
    end
    object edIMP_CAPITAL: TInterEdit
      Tag = 18
      Left = 152
      Top = 16
      Width = 100
      Height = 23
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      MaxLength = 12
      TabOrder = 0
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_PAGADO: TInterEdit
      Tag = 18
      Left = 152
      Top = 42
      Width = 100
      Height = 22
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      MaxLength = 12
      TabOrder = 1
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_BENEF_BCO: TInterEdit
      Tag = 18
      Left = 152
      Top = 82
      Width = 100
      Height = 22
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      MaxLength = 12
      TabOrder = 2
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_BENEF_GOB: TInterEdit
      Tag = 18
      Left = 152
      Top = 106
      Width = 100
      Height = 22
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      MaxLength = 12
      TabOrder = 3
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_MORATORIO: TInterEdit
      Tag = 18
      Left = 152
      Top = 130
      Width = 100
      Height = 22
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      MaxLength = 12
      TabOrder = 4
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_PAGADO_MORA: TInterEdit
      Tag = 18
      Left = 152
      Top = 154
      Width = 100
      Height = 22
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      MaxLength = 12
      TabOrder = 5
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_COND_MORA: TInterEdit
      Tag = 18
      Left = 152
      Top = 178
      Width = 100
      Height = 22
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      MaxLength = 12
      TabOrder = 6
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_IVA_MORA: TInterEdit
      Tag = 18
      Left = 152
      Top = 213
      Width = 100
      Height = 22
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      MaxLength = 12
      TabOrder = 7
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_PAG_IVA_MORA: TInterEdit
      Tag = 18
      Left = 152
      Top = 237
      Width = 100
      Height = 22
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      MaxLength = 12
      TabOrder = 8
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_IVA_COND_MOR: TInterEdit
      Tag = 18
      Left = 152
      Top = 261
      Width = 100
      Height = 22
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      MaxLength = 12
      TabOrder = 9
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object grbxSituacion: TGroupBox
    Tag = 18
    Left = 296
    Top = 63
    Width = 265
    Height = 105
    Caption = 'Situación Capital'
    Color = clBtnFace
    ParentColor = False
    TabOrder = 7
    object opActiva: TRadioButton
      Tag = 18
      Left = 32
      Top = 32
      Width = 86
      Height = 17
      Caption = 'Activo'
      Checked = True
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
      TabStop = True
      OnClick = opActivaClick
    end
    object opCancelada: TRadioButton
      Tag = 18
      Left = 32
      Top = 48
      Width = 86
      Height = 17
      Caption = 'Cancelado'
      TabOrder = 1
      OnClick = opActivaClick
    end
    object opImpagada: TRadioButton
      Tag = 18
      Left = 32
      Top = 64
      Width = 86
      Height = 17
      Caption = 'Impagado'
      TabOrder = 2
      OnClick = opActivaClick
    end
    object opLiquidada: TRadioButton
      Tag = 18
      Left = 152
      Top = 32
      Width = 86
      Height = 17
      Caption = 'Liquidado'
      TabOrder = 3
      OnClick = opActivaClick
    end
    object opPorActivar: TRadioButton
      Tag = 18
      Left = 152
      Top = 48
      Width = 86
      Height = 17
      Caption = 'Por Activar'
      TabOrder = 4
      OnClick = opActivaClick
    end
  end
  object btnId_Credito: TBitBtn
    Tag = 50
    Left = 200
    Top = 6
    Width = 25
    Height = 22
    TabOrder = 1
    TabStop = False
    OnClick = btnId_CreditoClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      0800000000000002000000000000000000000001000000010000000000008080
      8000000080000080800000800000808000008000000080008000408080004040
      0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
      FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
      80008000FF004080FF0000001F00000000000000000000000000000000000000
      A000BA7F0000000008005B00C4005B00B800B87FFF00FFFFA8005B002600B77F
      F4005D00C00000000A000000010000000000000090005B00FE0000006300F7BF
      C00000000A00000001000000000000005700D8843F000000BC005B002300F7BF
      0000000047000200E500F9BF7900F7BFF8000000E0005B002E00F7BF5700D884
      00000000D80047330000000046000000360002002E0000001F0000003F002701
      000047333F0027013C00FA3B3F000400000000000000F91AB700000000000100
      00000A000000FA3B10000000000000002800D379FF0047333C00413C3F00FFFF
      47000000000047333F0008E8780000000300F91AB700E7820700000000000000
      01000A00C0003F010000080000001F175900B77F00005B0080005B000700B87F
      FF00FFFF8C005B00E200B77F00005B0098005B00C200B87FFF00FFFFA4005B00
      B000B77F00005B00B0005B003500B87FFF00FFFFBC005B006100410000005B00
      C8005B006E006D307700CE4835001A3D0000528700000000E0000700DC004100
      0000FFFFEC005B0018004100500020001000200001000000FF00E0FFFF000000
      5E00E0010000FF10040000040000CE4800000000000000008200150000000000
      00000000000007400100000000000100200010000000E74850000B0195000C01
      01000000B700F4FEFF0000005E00F0A60100B710040000040000964800000000
      000000009B001500D400FFFF030000003C005E0004000000A000010020000000
      0000AF4808000700000000001B00240054005E0000000000F200B87F00000000
      00000000C800BB7F00000000000000004200736361000000E7000000AF00683D
      A7004840D700F7BF37000000C4005B003F002000CC00000074000000F4005D00
      20000000F8005B005D00B77F0100000000000000000000002000000034001704
      00000002F4005D00A8005B004700B77F20000000000000200000000205000000
      000000004400071852002A009000301200002011000034875000E01000003012
      0000408750001701A8001405000000000200920400000000A200000000003012
      0000828700006A87000000000000010000000000C80000007600507F1700537F
      E00027112F00B0876E00170164002F0100000000C8000000B0000000A0000000
      200000002700000001000000E000000000002F01E0005E0020000000BA00507F
      1700537F200029798600A233A200A705FC00AC1157001AEC5E00030303030303
      03030E11110E110E111103030303030303030E01010E010E0101030303030303
      0311110E110E0E110E0E0303030303030301010E010E0E010E0E030303030303
      0311110E110E11110E110303030303030301010E010E01010E01030303030303
      03031111110E0E0E110E03030303030303030101010E0E0E0F0E030303030303
      030606060E1111111111030303030303030F0F0F0E0101010F0F030303030303
      03060111060E110E110E030303030303030F0101000E010E010E030303030303
      0606010E110611110E110303030303030F0F010E010F01010E01030303030306
      0601060F0F060E11110E03030303030F0F01000F0F010E01010E030303030606
      010E0F06060603111103030303030F0F010E0F0F0F0F03010103030303060606
      060F06060303030303030303030F0F0F0F0F0F0F030303030303030306060106
      0606060303030303030303030F0F010F0F0F0F03030303030303030606010E0F
      06060303030303030303030F0F010E0F0F0F03030303030303030306010E0F06
      06030303030303030303030F010E0F0F0F0303030303030303030306060F0606
      03030303030303030303030F0F0F0F0F03030303030303030303030306060603
      0303030303030303030303030F0F0F0303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303}
    NumGlyphs = 2
  end
  object edNombre: TEdit
    Tag = 20
    Left = 230
    Top = 7
    Width = 328
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 2
  end
  object PnDatos: TPanel
    Left = 0
    Top = 356
    Width = 562
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
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesCancelar = InterForma1DespuesCancelar
    OnAntesAceptar = InterForma1AntesAceptar
    OnBuscar = InterForma1Buscar
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
    OnDespuesShow = InterForma1DespuesShow
    Left = 474
    Top = 305
  end
  object ILId_Credito: TInterLinkit
    Control = edID_CREDITO
    OnEjecuta = ILId_CreditoEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    OnCapture = ILId_CreditoCapture
    Left = 265
    Top = 3
  end
end
