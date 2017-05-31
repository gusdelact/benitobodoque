object WCrGaranCto: TWCrGaranCto
  Left = 282
  Top = 184
  Width = 634
  Height = 399
  Caption = 'Consolidado de Garantías por Línea'
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 626
    Height = 105
    Align = alTop
    TabOrder = 0
    object lbF_CIERRE: TLabel
      Left = 16
      Top = 10
      Width = 60
      Height = 13
      Caption = 'Fecha Cierre'
    end
    object lbID_CONTRATO: TLabel
      Left = 143
      Top = 10
      Width = 51
      Height = 13
      Caption = 'No. Línea '
    end
    object lbCVE_MONEDA: TLabel
      Left = 271
      Top = 10
      Width = 39
      Height = 13
      Caption = 'Moneda'
    end
    object lbID_CONTRATO_OTORG: TLabel
      Left = 143
      Top = 52
      Width = 93
      Height = 13
      Caption = 'No. Línea Garantía'
    end
    object lbCVE_MONEDA_OTORG: TLabel
      Left = 271
      Top = 50
      Width = 84
      Height = 13
      Caption = 'Moneda Garantía'
    end
    object dtpF_CIERRE: TInterDateTimePicker
      Tag = 18
      Left = 106
      Top = 26
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 40451.7913710764
      Time = 40451.7913710764
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
      Edit = edF_CIERRE
      Formato = dfDate
    end
    object edF_CIERRE: TEdit
      Tag = 18
      Left = 16
      Top = 26
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object edID_CONTRATO: TEdit
      Tag = 530
      Left = 143
      Top = 26
      Width = 97
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edCVE_MONEDA: TEdit
      Tag = 18
      Left = 271
      Top = 26
      Width = 57
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
    end
    object edCVE_MONEDA_OTORG: TEdit
      Tag = 18
      Left = 271
      Top = 66
      Width = 57
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
    end
    object btID_CONTRATO: TBitBtn
      Tag = 18
      Left = 245
      Top = 28
      Width = 21
      Height = 21
      TabOrder = 3
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
    object btCVE_MONEDA: TBitBtn
      Tag = 18
      Left = 333
      Top = 65
      Width = 21
      Height = 21
      TabOrder = 6
      OnClick = btCVE_MONEDAClick
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
    object edID_CONTRATO_OTORG: TInterEdit
      Tag = 18
      Left = 143
      Top = 67
      Width = 98
      Height = 21
      HelpContext = 3001
      Prefijo = '1'
      Contrato = -1
      TipoReader = trContrato
      DisplayMask = '###############'
      MaxLength = 10
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 7
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 105
    Width = 626
    Height = 188
    Align = alTop
    TabOrder = 1
    object lbDESC_GARANTIA: TLabel
      Left = 4
      Top = 54
      Width = 62
      Height = 13
      Caption = 'Descripción: '
    end
    object lbSEGURO: TLabel
      Left = 4
      Top = 79
      Width = 37
      Height = 13
      Caption = 'Seguro:'
    end
    object lbBURSATILIDAD: TLabel
      Left = 137
      Top = 79
      Width = 107
      Height = 13
      Caption = 'Bursatilidad / Liquidez:'
    end
    object lbIMP_GARANTIA: TLabel
      Left = 4
      Top = 106
      Width = 38
      Height = 13
      Caption = 'Importe:'
    end
    object lbIMP_GARANTIA_VP: TLabel
      Left = 5
      Top = 130
      Width = 75
      Height = 13
      Caption = 'Imp. Valorizado:'
    end
    object lbF_AVALUO: TLabel
      Left = 7
      Top = 154
      Width = 66
      Height = 13
      Caption = 'Fecha Avaluo'
    end
    object lbLUGAR_PREF_BAN: TLabel
      Left = 303
      Top = 79
      Width = 47
      Height = 13
      Caption = 'Prelación:'
    end
    object lbID_TIPO_GAR: TLabel
      Left = 4
      Top = 26
      Width = 50
      Height = 13
      Caption = 'Tipo Gar. :'
    end
    object edDESC_GARANTIA: TEdit
      Tag = 18
      Left = 89
      Top = 48
      Width = 535
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
    end
    object rgSIT_GARAN_CTO: TRadioGroup
      Tag = 18
      Left = 224
      Top = 114
      Width = 96
      Height = 55
      Caption = 'Situación'
      Items.Strings = (
        'ACTIVO'
        'INACTIVO')
      TabOrder = 11
    end
    object edF_AVALUO: TEdit
      Tag = 18
      Left = 89
      Top = 148
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 10
    end
    object dtpF_AVALUO: TInterDateTimePicker
      Tag = 18
      Left = 178
      Top = 148
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 40451.7913712616
      Time = 40451.7913712616
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
      Edit = edF_AVALUO
      Formato = dfDate
    end
    object edID_TIPO_GAR: TEdit
      Tag = 18
      Left = 89
      Top = 22
      Width = 41
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object btCVE_TIPO_GAR: TBitBtn
      Tag = 18
      Left = 135
      Top = 23
      Width = 21
      Height = 21
      HelpContext = 2001
      TabOrder = 3
      OnClick = btCVE_TIPO_GARClick
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
    object edNOM_CVE_TIPO_GAR: TEdit
      Left = 161
      Top = 22
      Width = 303
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 1
    end
    object edSEGURO: TInterEdit
      Tag = 18
      Left = 89
      Top = 74
      Width = 41
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      DisplayMask = '0'
      MaxLength = 1
      Color = clWhite
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
    object edBURSATILIDAD: TInterEdit
      Tag = 18
      Left = 247
      Top = 74
      Width = 49
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      DisplayMask = '0'
      MaxLength = 1
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 6
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edLUGAR_PREF_BAN: TInterEdit
      Tag = 18
      Left = 359
      Top = 74
      Width = 49
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      DisplayMask = '0'
      MaxLength = 1
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 7
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_GARANTIA: TInterEdit
      Tag = 18
      Left = 89
      Top = 99
      Width = 105
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 8
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_GARANTIA_VP: TInterEdit
      Tag = 18
      Left = 89
      Top = 123
      Width = 105
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 9
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      RetypeLabel = Label1
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object PnDatos: TPanel
    Left = 0
    Top = 345
    Width = 626
    Height = 18
    Align = alTop
    TabOrder = 2
    object lbEmpresa: TLabel
      Left = 11
      Top = 1
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
      Top = 8
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
      Left = 280
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
      Left = 280
      Top = 8
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
      Top = 8
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
      Left = 344
      Top = 8
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
      Left = 344
      Top = 1
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
      Top = 1
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
  object GroupBox3: TGroupBox
    Left = 0
    Top = 293
    Width = 626
    Height = 52
    Align = alTop
    TabOrder = 3
    object lbF_ALTA: TLabel
      Left = 121
      Top = 13
      Width = 51
      Height = 13
      Caption = 'Fecha Alta'
    end
    object Label1: TLabel
      Left = 230
      Top = 13
      Width = 57
      Height = 13
      Caption = 'Usuario Alta'
    end
    object Label2: TLabel
      Left = 334
      Top = 13
      Width = 73
      Height = 13
      Caption = 'Fecha Modifica'
    end
    object Label3: TLabel
      Left = 430
      Top = 13
      Width = 79
      Height = 13
      Caption = 'Usuario Modifica'
    end
    object edF_ALTA: TEdit
      Left = 101
      Top = 27
      Width = 90
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 0
    end
    object edCVE_USU_ALTA: TEdit
      Left = 218
      Top = 27
      Width = 90
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 1
    end
    object edFH_MODIFICA: TEdit
      Left = 322
      Top = 27
      Width = 90
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 2
    end
    object edCVE_USU_MODIFICA: TEdit
      Left = 426
      Top = 27
      Width = 90
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 3
    end
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
    Left = 546
    Top = 314
  end
  object ilID_CONTRATO: TInterLinkit
    Control = edID_CONTRATO
    OnEjecuta = ilID_CONTRATOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 56
    Top = 57
  end
end
