object wMSolFact: TwMSolFact
  Left = 108
  Top = 36
  Width = 668
  Height = 538
  Caption = 'Facturación de SIEBAN'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 0
    Top = 9
    Width = 66
    Height = 13
    Caption = 'Id. Acreditado'
  end
  object Label10: TLabel
    Left = 0
    Top = 30
    Width = 58
    Height = 13
    Caption = 'Autorización'
  end
  object Label11: TLabel
    Left = 0
    Top = 50
    Width = 54
    Height = 13
    Caption = 'Disposición'
  end
  object Shape3: TShape
    Left = 2
    Top = 226
    Width = 27
    Height = 33
    Brush.Color = clInfoBk
    Enabled = False
  end
  object Label8: TLabel
    Left = 3
    Top = 237
    Width = 24
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Fact'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
    WordWrap = True
  end
  object Shape1: TShape
    Left = 53
    Top = 226
    Width = 73
    Height = 33
    Brush.Color = clInfoBk
    Enabled = False
  end
  object Label9: TLabel
    Left = 58
    Top = 230
    Width = 63
    Height = 26
    Alignment = taCenter
    AutoSize = False
    Caption = 'Número FIRA'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
    WordWrap = True
  end
  object Shape2: TShape
    Left = 198
    Top = 226
    Width = 74
    Height = 33
    Brush.Color = clInfoBk
    Enabled = False
  end
  object Shape4: TShape
    Left = 271
    Top = 226
    Width = 74
    Height = 33
    Brush.Color = clInfoBk
    Enabled = False
  end
  object Label13: TLabel
    Left = 275
    Top = 230
    Width = 66
    Height = 26
    Alignment = taCenter
    AutoSize = False
    Caption = 'Importe SIEBAN'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
    WordWrap = True
  end
  object Shape5: TShape
    Left = 411
    Top = 226
    Width = 68
    Height = 33
    Brush.Color = clInfoBk
    Enabled = False
  end
  object Label14: TLabel
    Left = 415
    Top = 230
    Width = 60
    Height = 26
    Alignment = taCenter
    AutoSize = False
    Caption = 'Folio de Factura'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
    WordWrap = True
  end
  object Shape6: TShape
    Left = 344
    Top = 226
    Width = 68
    Height = 33
    Brush.Color = clInfoBk
    Enabled = False
  end
  object Label15: TLabel
    Left = 348
    Top = 230
    Width = 60
    Height = 26
    Alignment = taCenter
    AutoSize = False
    Caption = 'Fecha de Recepción'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
    WordWrap = True
  end
  object Shape8: TShape
    Left = 28
    Top = 226
    Width = 26
    Height = 33
    Brush.Color = clInfoBk
    Enabled = False
  end
  object Label17: TLabel
    Left = 30
    Top = 237
    Width = 21
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Dev'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
    WordWrap = True
  end
  object Label12: TLabel
    Left = 202
    Top = 230
    Width = 66
    Height = 26
    Alignment = taCenter
    AutoSize = False
    Caption = 'Porcentaje SIEBAN'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
    WordWrap = True
  end
  object Shape7: TShape
    Left = 125
    Top = 226
    Width = 74
    Height = 33
    Brush.Color = clInfoBk
    Enabled = False
  end
  object Label16: TLabel
    Left = 129
    Top = 230
    Width = 66
    Height = 26
    Alignment = taCenter
    AutoSize = False
    Caption = 'Momento a Compartir'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
    WordWrap = True
  end
  object Shape9: TShape
    Left = 545
    Top = 226
    Width = 68
    Height = 33
    Brush.Color = clInfoBk
    Enabled = False
  end
  object Label18: TLabel
    Left = 549
    Top = 230
    Width = 60
    Height = 27
    Alignment = taCenter
    AutoSize = False
    Caption = 'Fecha Devolución'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
    WordWrap = True
  end
  object Shape10: TShape
    Left = 612
    Top = 226
    Width = 46
    Height = 33
    Brush.Color = clInfoBk
    Enabled = False
  end
  object Label19: TLabel
    Left = 613
    Top = 237
    Width = 37
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Sit.'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
    WordWrap = True
  end
  object Shape11: TShape
    Left = 478
    Top = 226
    Width = 68
    Height = 33
    Brush.Color = clInfoBk
    Enabled = False
  end
  object Label20: TLabel
    Left = 481
    Top = 230
    Width = 60
    Height = 26
    Alignment = taCenter
    AutoSize = False
    Caption = 'Número de Factura'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
    WordWrap = True
  end
  object rgSITUACION: TRadioGroup
    Left = 0
    Top = 193
    Width = 569
    Height = 32
    HelpContext = 7000
    Caption = 'Situación de SIEBAN'
    Columns = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 3
    Items.Strings = (
      'Sin Facturar '
      'Facturados No Devueltos'
      'Facturados Devueltos'
      'Todos')
    ParentFont = False
    TabOrder = 13
    OnClick = rgSITUACIONClick
  end
  object edID_ACREDITADO: TEdit
    Tag = 512
    Left = 94
    Top = 5
    Width = 73
    Height = 21
    HelpContext = 1000
    MaxLength = 8
    TabOrder = 1
  end
  object btID_ACREDITADO: TBitBtn
    Tag = 17
    Left = 172
    Top = 5
    Width = 21
    Height = 21
    HelpContext = 1001
    TabOrder = 2
    OnClick = btID_ACREDITADOClick
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
  object edNOM_ACREDITADO: TEdit
    Left = 200
    Top = 5
    Width = 369
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 3
  end
  object cbxID_ACREDITADO: TCheckBox
    Left = 609
    Top = 7
    Width = 13
    Height = 17
    HelpContext = 1002
    Enabled = False
    TabOrder = 19
    OnClick = cbxID_ACREDITADOClick
  end
  object edID_CREDITO: TEdit
    Tag = 512
    Left = 94
    Top = 47
    Width = 73
    Height = 21
    HelpContext = 3000
    MaxLength = 10
    TabOrder = 7
  end
  object btID_CREDITO: TBitBtn
    Tag = 17
    Left = 172
    Top = 47
    Width = 21
    Height = 21
    HelpContext = 3001
    TabOrder = 8
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
  object edNOM_CREDITO: TEdit
    Left = 200
    Top = 47
    Width = 369
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 9
  end
  object cbxID_CREDITO: TCheckBox
    Left = 609
    Top = 49
    Width = 13
    Height = 17
    HelpContext = 3002
    Enabled = False
    TabOrder = 20
    OnClick = cbxID_CREDITOClick
  end
  object cbxID_CONTRATO: TCheckBox
    Left = 609
    Top = 28
    Width = 13
    Height = 17
    HelpContext = 2002
    Enabled = False
    TabOrder = 21
    OnClick = cbxID_CONTRATOClick
  end
  object edNOM_CONTRATO: TEdit
    Left = 200
    Top = 26
    Width = 369
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 6
  end
  object btID_CONTRATO: TBitBtn
    Tag = 17
    Left = 172
    Top = 26
    Width = 21
    Height = 21
    HelpContext = 2001
    TabOrder = 5
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
  object edID_CONTRATO: TEdit
    Tag = 512
    Left = 94
    Top = 26
    Width = 73
    Height = 21
    HelpContext = 2000
    MaxLength = 10
    TabOrder = 4
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 72
    Width = 569
    Height = 40
    HelpContext = 4000
    Caption = 'Fecha de Facturación'
    TabOrder = 10
    object Label2: TLabel
      Left = 8
      Top = 19
      Width = 56
      Height = 13
      Caption = 'Fecha Incio'
    end
    object Label3: TLabel
      Left = 328
      Top = 19
      Width = 55
      Height = 13
      Caption = 'Fecha Final'
    end
    object edF_RECEPCION_INI: TEdit
      Left = 96
      Top = 15
      Width = 73
      Height = 21
      HelpContext = 4001
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 0
      OnChange = edF_RECEPCION_INIChange
    end
    object dtpF_RECEPCION_INI: TInterDateTimePicker
      Left = 172
      Top = 15
      Width = 21
      Height = 21
      HelpContext = 5002
      CalAlignment = dtaLeft
      Date = 37805.5239350116
      Time = 37805.5239350116
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      TabStop = False
      Edit = edF_RECEPCION_INI
      Formato = dfDate
    end
    object edF_RECEPCION_FIN: TEdit
      Left = 424
      Top = 15
      Width = 73
      Height = 21
      HelpContext = 4002
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 2
      OnChange = edF_RECEPCION_FINChange
    end
    object dtpF_RECEPCION_FIN: TInterDateTimePicker
      Left = 500
      Top = 15
      Width = 21
      Height = 21
      HelpContext = 5002
      CalAlignment = dtaLeft
      Date = 37805.5239350116
      Time = 37805.5239350116
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      TabStop = False
      Edit = edF_RECEPCION_FIN
      Formato = dfDate
    end
  end
  object cbxF_RECEPCION: TCheckBox
    Left = 609
    Top = 84
    Width = 13
    Height = 17
    HelpContext = 4003
    Enabled = False
    TabOrder = 22
    OnClick = cbxF_RECEPCIONClick
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 112
    Width = 569
    Height = 40
    HelpContext = 5000
    Caption = 'Fecha de entrega de estímulo SIEBAN'
    TabOrder = 11
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 56
      Height = 13
      Caption = 'Fecha Incio'
    end
    object Label4: TLabel
      Left = 328
      Top = 18
      Width = 55
      Height = 13
      Caption = 'Fecha Final'
    end
    object edF_FACTURACION_INI: TEdit
      Left = 96
      Top = 14
      Width = 73
      Height = 21
      HelpContext = 5001
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 0
      OnChange = edF_FACTURACION_INIChange
    end
    object dtpF_FACTURACION_INI: TInterDateTimePicker
      Left = 172
      Top = 14
      Width = 21
      Height = 21
      HelpContext = 5002
      CalAlignment = dtaLeft
      Date = 37805.5239350116
      Time = 37805.5239350116
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      TabStop = False
      Edit = edF_FACTURACION_INI
      Formato = dfDate
    end
    object edF_FACTURACION_FIN: TEdit
      Left = 424
      Top = 14
      Width = 73
      Height = 21
      HelpContext = 5002
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 2
      OnChange = edF_FACTURACION_FINChange
    end
    object dtpF_FACTURACION_FIN: TInterDateTimePicker
      Left = 500
      Top = 14
      Width = 21
      Height = 21
      HelpContext = 5002
      CalAlignment = dtaLeft
      Date = 37805.5239350116
      Time = 37805.5239350116
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      TabStop = False
      Edit = edF_FACTURACION_FIN
      Formato = dfDate
    end
  end
  object cbxF_FACTURACION: TCheckBox
    Left = 609
    Top = 124
    Width = 13
    Height = 17
    HelpContext = 5003
    Enabled = False
    TabOrder = 23
    OnClick = cbxF_FACTURACIONClick
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 152
    Width = 569
    Height = 41
    HelpContext = 6000
    Caption = 'Fecha de devolución a compartir'
    TabOrder = 12
    object Label5: TLabel
      Left = 8
      Top = 19
      Width = 56
      Height = 13
      Caption = 'Fecha Incio'
    end
    object Label6: TLabel
      Left = 328
      Top = 19
      Width = 55
      Height = 13
      Caption = 'Fecha Final'
    end
    object edF_LIQ_CLIENTE_INI: TEdit
      Left = 96
      Top = 15
      Width = 73
      Height = 21
      HelpContext = 6001
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 0
      OnChange = edF_LIQ_CLIENTE_INIChange
    end
    object dtpF_LIQ_CLIENTE_INI: TInterDateTimePicker
      Left = 172
      Top = 15
      Width = 21
      Height = 21
      HelpContext = 5002
      CalAlignment = dtaLeft
      Date = 37805.5239350116
      Time = 37805.5239350116
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      TabStop = False
      Edit = edF_LIQ_CLIENTE_INI
      Formato = dfDate
    end
    object edF_LIQ_CLIENTE_FIN: TEdit
      Left = 424
      Top = 15
      Width = 73
      Height = 21
      HelpContext = 6002
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 2
      OnChange = edF_LIQ_CLIENTE_FINChange
    end
    object dtpF_LIQ_CLIENTE_FIN: TInterDateTimePicker
      Left = 500
      Top = 15
      Width = 21
      Height = 21
      HelpContext = 5002
      CalAlignment = dtaLeft
      Date = 37805.5239350116
      Time = 37805.5239350116
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      TabStop = False
      Edit = edF_LIQ_CLIENTE_FIN
      Formato = dfDate
    end
  end
  object cbxF_LIQ_CLIENTE: TCheckBox
    Left = 609
    Top = 164
    Width = 13
    Height = 17
    HelpContext = 6003
    Enabled = False
    TabOrder = 24
    OnClick = cbxF_LIQ_CLIENTEClick
  end
  object PnDatos: TPanel
    Left = 0
    Top = 485
    Width = 658
    Height = 21
    TabOrder = 25
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
  object btBusca: TBitBtn
    Left = 572
    Top = 200
    Width = 86
    Height = 25
    HelpContext = 7001
    Caption = 'Búsqueda'
    TabOrder = 14
    OnClick = btBuscaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
  end
  object Merrores: TMemo
    Left = 0
    Top = 437
    Width = 479
    Height = 46
    HelpContext = 9001
    Color = clInfoBk
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 16
  end
  object rgModoFact: TRadioGroup
    Tag = 17
    Left = -1
    Top = 404
    Width = 659
    Height = 31
    HelpContext = 9000
    Caption = 'Modo de Facturación de SIEBAN'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Acumulado'
      'Separado')
    TabOrder = 0
    TabStop = True
  end
  object btFACTURAR: TBitBtn
    Left = 481
    Top = 438
    Width = 177
    Height = 21
    HelpContext = 9002
    Caption = '&Facturar'
    TabOrder = 17
    OnClick = btFACTURARClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
      FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
      00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
      F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
      00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
      F033777777777337F73309999990FFF0033377777777FFF77333099999000000
      3333777777777777333333399033333333333337773333333333333903333333
      3333333773333333333333303333333333333337333333333333}
    NumGlyphs = 2
  end
  object btDEVOLVER: TBitBtn
    Left = 481
    Top = 462
    Width = 177
    Height = 21
    HelpContext = 9003
    Caption = '&Devolver'
    TabOrder = 18
    OnClick = btDEVOLVERClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
      00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
      00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
      F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
      FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
      0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
      0033333337FFFFFF773333333000000003333333377777777333}
    NumGlyphs = 2
  end
  object sgcDATA: TSGCtrl
    Left = 0
    Top = 259
    Width = 658
    Height = 145
    HelpContext = 8000
    OnCalcRow = sgcDATACalcRow
    ShowTab = True
    TabOrder = 15
    PopupMenu = pmSIEBAN
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnDblClick = sgcDATADblClick
  end
  object InterForma1: TInterForma
    IsMain = True
    OnBuscar = InterForma1Buscar
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
    OnDespuesShow = InterForma1DespuesShow
    Left = 384
    Top = 16
  end
  object ilID_ACREDITADO: TInterLinkit
    Control = edID_ACREDITADO
    OnEjecuta = ilID_ACREDITADOEjecuta
    TipoReader = trEntero
    CharCase = ecNormal
    OnCapture = ilID_ACREDITADOCapture
    Left = 320
  end
  object ilID_CONTRATO: TInterLinkit
    Control = edID_CONTRATO
    OnEjecuta = ilID_CONTRATOEjecuta
    TipoReader = trContrato
    CharCase = ecNormal
    OnCapture = ilID_CONTRATOCapture
    Left = 224
    Top = 22
  end
  object ilID_CREDITO: TInterLinkit
    Control = edID_CREDITO
    OnEjecuta = ilID_CREDITOEjecuta
    TipoReader = trEntero
    CharCase = ecNormal
    OnCapture = ilID_CREDITOCapture
    Left = 264
    Top = 43
  end
  object pmSIEBAN: TPopupMenu
    Left = 409
    Top = 275
    object DisposicinSIEBAN1: TMenuItem
      Caption = 'Disposición-SIEBAN'
      OnClick = DisposicinSIEBAN1Click
    end
  end
end
