object WCrCaptComiBloq: TWCrCaptComiBloq
  Left = 268
  Top = 82
  Width = 733
  Height = 514
  Caption = 'Captura de Conceptos a Bloquear'
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
  object Shape1: TShape
    Left = 7
    Top = 81
    Width = 672
    Height = 30
    Brush.Color = clBlack
  end
  object lbID_CREDITO: TLabel
    Left = 7
    Top = 15
    Width = 74
    Height = 13
    Caption = 'No. Disposición'
  end
  object lblID_CONTRATO_DV: TLabel
    Left = 7
    Top = 37
    Width = 46
    Height = 13
    Caption = 'Chequera'
  end
  object Label3: TLabel
    Left = 467
    Top = 320
    Width = 89
    Height = 13
    Caption = 'Importe a Bloquear'
  end
  object Label1: TLabel
    Left = 461
    Top = 59
    Width = 118
    Height = 13
    Caption = 'Importe de la Disposición'
  end
  object Label4: TLabel
    Left = 8
    Top = 82
    Width = 112
    Height = 28
    Alignment = taCenter
    AutoSize = False
    Caption = '   Clave de     Concepto'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object Label5: TLabel
    Left = 121
    Top = 82
    Width = 316
    Height = 28
    Alignment = taCenter
    AutoSize = False
    Caption = 'Concepto'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object Label6: TLabel
    Left = 438
    Top = 82
    Width = 128
    Height = 28
    Alignment = taCenter
    AutoSize = False
    Caption = '  Porcentaje a  Bloquear'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object Label7: TLabel
    Left = 567
    Top = 82
    Width = 111
    Height = 28
    Alignment = taCenter
    AutoSize = False
    Caption = 'Monto a Comprometer'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object Label8: TLabel
    Left = 13
    Top = 323
    Width = 108
    Height = 13
    Caption = 'Conceptos de Bloqueo'
  end
  object StringGrid: TStringGrid
    Left = 6
    Top = 110
    Width = 698
    Height = 205
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 7
    OnDrawCell = StringGridDrawCell
    OnKeyPress = StringGridKeyPress
    OnSetEditText = StringGridSetEditText
    ColWidths = (
      112
      316
      128
      110
      64)
  end
  object edID_CREDITO: TEdit
    Tag = 512
    Left = 86
    Top = 10
    Width = 84
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 0
  end
  object edNOM_ACREDITADO: TEdit
    Left = 191
    Top = 11
    Width = 515
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object edID_CONTRATO_DV: TEdit
    Tag = 512
    Left = 86
    Top = 33
    Width = 84
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 3
  end
  object edNOM_TITULAR_DV: TEdit
    Left = 191
    Top = 33
    Width = 515
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object PnDatos: TPanel
    Left = 1
    Top = 445
    Width = 708
    Height = 22
    TabOrder = 15
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
      Left = 332
      Top = 1
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
      Left = 332
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
      Left = 396
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
      Left = 396
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
  object edSUM_IMP_BLOQUEAR: TInterEdit
    Left = 566
    Top = 317
    Width = 112
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 13
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object btnInsert: TButton
    Left = 137
    Top = 318
    Width = 95
    Height = 26
    Caption = '&Insertar'
    TabOrder = 10
    OnClick = btnInsertClick
  end
  object btnEliminar: TButton
    Left = 231
    Top = 318
    Width = 95
    Height = 26
    Caption = '&Eliminar'
    TabOrder = 11
    OnClick = btnEliminarClick
  end
  object edIMP_CREDITO: TInterEdit
    Left = 582
    Top = 55
    Width = 122
    Height = 20
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 6
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object cbxPCT_BLOQUEAR: TComboBox
    Left = 548
    Top = 111
    Width = 20
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 9
    OnChange = cbxPCT_BLOQUEARChange
    Items.Strings = (
      'NA')
  end
  object btnCVE_BLQ_CPTO: TBitBtn
    Tag = 512
    Left = 104
    Top = 112
    Width = 17
    Height = 18
    TabOrder = 8
    TabStop = False
    OnClick = btnCVE_BLQ_CPTOClick
    Glyph.Data = {
      CA020000424DCA0200000000000036000000280000000E0000000F0000000100
      18000000000094020000C40E0000C40E00000000000000000000C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FFFFFF00FFFF00FFFFFFFFFF00FFFFFFFF
      FF00FFFF0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400FFFF00FFFFFFFF
      FF00FFFFFFFFFFFFFFFF00FFFFFFFFFF0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D400FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF00FFFFFFFFFF0000C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400FFFF00FFFF00FFFFFFFFFFFF
      FFFFFFFFFF00FFFF0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480000080
      0000800000FFFFFF00FFFF00FFFF00FFFF00FFFF0000C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D480000080808000FFFF800000FFFFFF00FFFFFFFFFF00FFFF
      0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4800000800000808080FFFFFF00FFFF
      80000000FFFF00FFFFFFFFFF0000C8D0D4C8D0D4C8D0D4C8D0D4800000800000
      808080800000C0C0C0C0C0C0800000FFFFFF00FFFF00FFFF0000C8D0D4C8D0D4
      C8D0D4800000800000808080FFFFFFC0C0C0800000800000800000C8D0D400FF
      FF00FFFF0000C8D0D4C8D0D4800000800000800000800000C0C0C08000008000
      00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D48000008000008080808000
      00800000800000800000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400008000
      00800000808080FFFFFFC0C0C0800000800000C8D0D4C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D40000800000808080FFFFFFC0C0C0800000800000C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000800000800000C0C0C080
      0000800000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      0000C8D0D4800000800000800000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D40000}
  end
  object btnAplicar: TButton
    Left = 325
    Top = 318
    Width = 95
    Height = 26
    Caption = '&Aplicar '
    TabOrder = 12
    OnClick = btnAplicarClick
  end
  object memMessages: TMemo
    Left = 5
    Top = 349
    Width = 700
    Height = 89
    Color = clInfoBk
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 14
  end
  object btID_CREDITO: TBitBtn
    Tag = 512
    Left = 170
    Top = 11
    Width = 22
    Height = 20
    HelpContext = 1002
    TabOrder = 1
    OnClick = btID_CREDITOClick
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
  object btID_CONTRATO: TBitBtn
    Tag = 512
    Left = 170
    Top = 34
    Width = 22
    Height = 20
    HelpContext = 1002
    TabOrder = 4
    OnClick = btID_CONTRATOClick
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
  object InterForma1: TInterForma
    IsMain = True
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
    Left = 672
    Top = 279
  end
  object ilID_CREDITO: TInterLinkit
    Control = edID_CREDITO
    OnEjecuta = ilID_CREDITOEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    OnCapture = ilID_CREDITOCapture
    Left = 233
    Top = 1
  end
  object ilID_CONTRATO_DV: TInterLinkit
    Control = edID_CONTRATO_DV
    OnEjecuta = ilID_CONTRATO_DVEjecuta
    TipoReader = trContrato
    CharCase = ecUpperCase
    OnCapture = ilID_CREDITOCapture
    Left = 232
    Top = 30
  end
end
