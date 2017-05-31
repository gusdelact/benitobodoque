object WCrFideicMaestr: TWCrFideicMaestr
  Left = 258
  Top = 112
  Width = 708
  Height = 521
  Caption = 'Alta FIDEICOMISO Maestro'
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
  object lbID_FID_MAESTRO: TLabel
    Left = 513
    Top = 8
    Width = 96
    Height = 13
    Caption = 'Fideicomiso Maestro'
  end
  object lbNUM_FOL_ADHESION: TLabel
    Left = 4
    Top = 6
    Width = 126
    Height = 13
    Caption = 'Nombre del FIDEICOMISO'
  end
  object lbF_ALTA: TLabel
    Left = 6
    Top = 402
    Width = 95
    Height = 13
    AutoSize = False
    Caption = 'Fecha de Alta'
  end
  object lbF_MODIFICA: TLabel
    Left = 6
    Top = 422
    Width = 95
    Height = 13
    AutoSize = False
    Caption = 'Fecha Modifica'
  end
  object LBCVE_USU_ALTA: TLabel
    Left = 212
    Top = 402
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object lbCVE_USU_MODIFICA: TLabel
    Left = 211
    Top = 423
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object lbID_INTERMEDIARIO: TLabel
    Left = 4
    Top = 73
    Width = 70
    Height = 25
    AutoSize = False
    Caption = 'Banco a Depositar '
    WordWrap = True
  end
  object lbIMP_FND_RESERVA: TLabel
    Left = 208
    Top = 52
    Width = 93
    Height = 14
    AutoSize = False
    Caption = 'Fondo de Reserva'
    WordWrap = True
  end
  object lbIMP_DIF_EXTEMP: TLabel
    Left = 431
    Top = 50
    Width = 137
    Height = 26
    AutoSize = False
    Caption = 'Diferencias por Presentación Extemporánea '
    WordWrap = True
  end
  object lbIMP_HONORARIOS: TLabel
    Left = 4
    Top = 52
    Width = 70
    Height = 14
    AutoSize = False
    Caption = 'Honorarios'
    WordWrap = True
  end
  object lbNOM_FIDEICOMITEN: TLabel
    Left = 4
    Top = 30
    Width = 68
    Height = 13
    Caption = 'Fideicomitente'
  end
  object lbNUM_LUGAR: TLabel
    Left = 513
    Top = 30
    Width = 83
    Height = 13
    Caption = 'Lugar que Ocupa'
  end
  object lbCUENTA_BANCO: TLabel
    Left = 4
    Top = 105
    Width = 70
    Height = 17
    AutoSize = False
    Caption = 'No. de Cuenta'
    WordWrap = True
  end
  object MsgPanel: TPanel
    Left = 2
    Top = 443
    Width = 697
    Height = 21
    TabOrder = 18
  end
  object PnDatos: TPanel
    Left = 2
    Top = 465
    Width = 697
    Height = 21
    TabOrder = 19
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
      Left = 392
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
      Left = 392
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
      Left = 456
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
      Left = 456
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
  object btID_INTERMEDIARIO: TBitBtn
    Tag = 18
    Left = 202
    Top = 77
    Width = 24
    Height = 22
    HelpContext = 1601
    TabOrder = 7
    OnClick = btID_INTERMEDIARIOClick
    OnExit = edID_INTERMEDIARIOExit
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
  object edID_INTERMEDIARIO: TEdit
    Tag = 530
    Left = 79
    Top = 77
    Width = 123
    Height = 21
    HelpContext = 1600
    CharCase = ecUpperCase
    TabOrder = 6
    OnExit = edID_INTERMEDIARIOExit
  end
  object edNOM_INET: TEdit
    Left = 223
    Top = 77
    Width = 473
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 21
  end
  object edID_FID_MAESTRO: TEdit
    Left = 615
    Top = 4
    Width = 80
    Height = 21
    TabStop = False
    BiDiMode = bdLeftToRight
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 20
  end
  object edNUM_FOL_ADHESION: TEdit
    Tag = 50
    Left = 136
    Top = 3
    Width = 370
    Height = 21
    HelpContext = 1000
    MaxLength = 80
    TabOrder = 0
    OnExit = edNUM_FOL_ADHESIONExit
  end
  object rgSIT_FID_MAESTRO: TRadioGroup
    Left = 416
    Top = 393
    Width = 176
    Height = 48
    HelpContext = 1300
    Caption = 'Sit. Fideicomiso Maestro'
    Columns = 2
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Cancelado')
    TabOrder = 17
    TabStop = True
  end
  object edF_MODIFICA: TEdit
    Left = 87
    Top = 419
    Width = 103
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 14
  end
  object edF_ALTA: TEdit
    Left = 87
    Top = 398
    Width = 103
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 13
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 301
    Top = 419
    Width = 106
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 16
  end
  object edCVE_USU_ALTA: TEdit
    Left = 301
    Top = 398
    Width = 106
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 15
  end
  object grbxReglas: TGroupBox
    Left = 2
    Top = 298
    Width = 696
    Height = 93
    Caption = 'Reglas a utilizar'
    TabOrder = 11
    object lbReglas: TLabel
      Left = 8
      Top = 74
      Width = 609
      Height = 14
      AutoSize = False
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object btnAgregarRegla: TBitBtn
      Tag = 21
      Left = 620
      Top = 15
      Width = 69
      Height = 28
      Caption = 'Agregar'
      TabOrder = 1
      OnClick = btnAgregarReglaClick
    end
    object btnEliminarRegla: TBitBtn
      Tag = 21
      Left = 620
      Top = 42
      Width = 69
      Height = 28
      Caption = 'Eliminar'
      TabOrder = 2
      OnClick = btnEliminarReglaClick
    end
    object StrGrdReglas: TStringGrid
      Tag = 21
      Left = 8
      Top = 15
      Width = 609
      Height = 56
      ColCount = 8
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ScrollBars = ssVertical
      TabOrder = 0
      OnDblClick = StrGrdReglasDblClick
      ColWidths = (
        3
        64
        189
        65
        64
        64
        64
        64)
    end
  end
  object edIMP_FND_RESERVA: TInterEdit
    Tag = 18
    Left = 305
    Top = 50
    Width = 123
    Height = 21
    HelpContext = 14000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_FND_RESERVAExit
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 4
    UseReType = True
    UseSep = False
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edIMP_DIF_EXTEMP: TInterEdit
    Tag = 18
    Left = 576
    Top = 49
    Width = 119
    Height = 21
    HelpContext = 1500
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_DIF_EXTEMPExit
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 5
    UseReType = True
    UseSep = False
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object btnCancela: TBitBtn
    Tag = 21
    Left = 596
    Top = 398
    Width = 100
    Height = 43
    Caption = 'Cancelación'
    TabOrder = 12
    OnClick = btnCancelaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333333333333333333FFF33FF333FFF339993370733
      999333777FF37FF377733339993000399933333777F777F77733333399970799
      93333333777F7377733333333999399933333333377737773333333333990993
      3333333333737F73333333333331013333333333333777FF3333333333910193
      333333333337773FF3333333399000993333333337377737FF33333399900099
      93333333773777377FF333399930003999333337773777F777FF339993370733
      9993337773337333777333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object edIMP_HONORARIOS: TInterEdit
    Tag = 18
    Left = 79
    Top = 52
    Width = 123
    Height = 21
    HelpContext = 1300
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_HONORARIOSExit
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 3
    UseReType = True
    UseSep = False
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edNOM_FIDEICOMITEN: TEdit
    Tag = 18
    Left = 79
    Top = 27
    Width = 427
    Height = 21
    HelpContext = 1100
    CharCase = ecUpperCase
    MaxLength = 250
    TabOrder = 1
    OnExit = edNOM_FIDEICOMITENExit
  end
  object grbxDelegados: TGroupBox
    Left = 2
    Top = 209
    Width = 696
    Height = 91
    Caption = 'Delegados Fiduciarios'
    TabOrder = 10
    object lbDelegados: TLabel
      Left = 7
      Top = 71
      Width = 611
      Height = 14
      AutoSize = False
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object btnAgregarDelegado: TBitBtn
      Tag = 21
      Left = 620
      Top = 14
      Width = 69
      Height = 28
      Caption = 'Agregar'
      TabOrder = 1
      OnClick = btnAgregarDelegadoClick
    end
    object btEliminarDelegado: TBitBtn
      Tag = 21
      Left = 620
      Top = 41
      Width = 69
      Height = 28
      Caption = 'Eliminar'
      TabOrder = 2
      OnClick = btEliminarDelegadoClick
    end
    object StrGrdDelegados: TStringGrid
      Tag = 21
      Left = 7
      Top = 14
      Width = 610
      Height = 56
      ColCount = 3
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ScrollBars = ssVertical
      TabOrder = 0
      OnDblClick = StrGrdDelegadosDblClick
      ColWidths = (
        3
        64
        514)
    end
  end
  object grbxFideicomisarios: TGroupBox
    Left = 2
    Top = 121
    Width = 696
    Height = 89
    Caption = 'Fideicomisarios'
    TabOrder = 9
    object lbFideicomisarios: TLabel
      Left = 8
      Top = 70
      Width = 610
      Height = 14
      AutoSize = False
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object btnAgregarFideicomisario: TBitBtn
      Tag = 21
      Left = 620
      Top = 14
      Width = 69
      Height = 28
      Caption = 'Agregar'
      TabOrder = 1
      OnClick = btnAgregarFideicomisarioClick
    end
    object btnEliminarFideicomisario: TBitBtn
      Tag = 21
      Left = 620
      Top = 41
      Width = 69
      Height = 28
      Caption = 'Eliminar'
      TabOrder = 2
      OnClick = btnEliminarFideicomisarioClick
    end
    object StrGrdFideicomisarios: TStringGrid
      Tag = 21
      Left = 8
      Top = 13
      Width = 610
      Height = 56
      ColCount = 3
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ScrollBars = ssVertical
      TabOrder = 0
      OnDblClick = StrGrdFideicomisariosDblClick
      ColWidths = (
        3
        64
        517)
    end
  end
  object edNUM_LUGAR: TInterEdit
    Tag = 18
    Left = 616
    Top = 26
    Width = 79
    Height = 21
    HelpContext = 1200
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edNUM_LUGARExit
    DisplayMask = '#,##0'
    MaxLength = 3
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
  object edCUENTA_BANCO: TEdit
    Tag = 18
    Left = 79
    Top = 101
    Width = 350
    Height = 21
    HelpContext = 1701
    CharCase = ecUpperCase
    MaxLength = 20
    TabOrder = 8
    OnExit = edCUENTA_BANCOExit
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesNuevo = InterForma1AntesNuevo
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
    Left = 667
    Top = 448
  end
  object ilID_INTERMEDIARIO: TInterLinkit
    Control = edID_INTERMEDIARIO
    OnEjecuta = ilID_INTERMEDIARIOEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    OnCapture = ilID_INTERMEDIARIOCapture
    Left = 235
    Top = 72
  end
end
