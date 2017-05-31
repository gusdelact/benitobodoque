object WCrInfAdicTasa: TWCrInfAdicTasa
  Left = 369
  Top = 153
  Width = 580
  Height = 452
  Caption = 'Datos Adicionales a Tasas'
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
  object Bevel6: TBevel
    Left = 1
    Top = 288
    Width = 552
    Height = 29
    Shape = bsFrame
    Style = bsRaised
  end
  object Bevel7: TBevel
    Left = 0
    Top = 325
    Width = 553
    Height = 52
    Shape = bsFrame
    Style = bsRaised
  end
  object Bevel3: TBevel
    Left = 2
    Top = 139
    Width = 551
    Height = 70
  end
  object Bevel2: TBevel
    Left = 348
    Top = 47
    Width = 205
    Height = 82
  end
  object lbID_CREDITO: TLabel
    Left = 8
    Top = 9
    Width = 66
    Height = 13
    Caption = 'Id Disposición'
  end
  object lbTASA_MIXIMA: TLabel
    Left = 368
    Top = 70
    Width = 63
    Height = 13
    Caption = 'Tasa Maxima'
  end
  object lbTASA_MINIMA: TLabel
    Left = 368
    Top = 101
    Width = 60
    Height = 13
    Caption = 'Tasa Minima'
  end
  object Bevel1: TBevel
    Left = 2
    Top = 48
    Width = 343
    Height = 81
  end
  object Label3: TLabel
    Left = 8
    Top = 332
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object Label4: TLabel
    Left = 8
    Top = 354
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object Label5: TLabel
    Left = 291
    Top = 332
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object Label6: TLabel
    Left = 291
    Top = 354
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object lbCVE_TIPO_RED: TLabel
    Left = 8
    Top = 70
    Width = 74
    Height = 13
    Caption = 'Tipo Redondeo'
  end
  object Bevel4: TBevel
    Left = 8
    Top = 56
    Width = 333
    Height = 5
    Shape = bsTopLine
  end
  object Bevel5: TBevel
    Left = 352
    Top = 56
    Width = 197
    Height = 5
    Shape = bsTopLine
  end
  object lbDENOMINADOR: TLabel
    Left = 9
    Top = 296
    Width = 266
    Height = 13
    Caption = 'Dígitos para el redondeo de la tasa de crédito (default 4)'
  end
  object Label32: TLabel
    Left = 511
    Top = 318
    Width = 37
    Height = 7
    Caption = 'V20160408'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -7
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object chB_TIPO_MES: TCheckBox
    Tag = 18
    Left = 8
    Top = 140
    Width = 537
    Height = 21
    HelpContext = 7001
    Alignment = taLeftJustify
    Caption = 'Aplica Tipo Año / Mes'
    TabOrder = 7
    OnClick = chB_TIPO_MESClick
    OnExit = chB_TIPO_MESExit
  end
  object rgCVE_TIPO_ANUAL: TRadioGroup
    Tag = 18
    Left = 8
    Top = 168
    Width = 268
    Height = 37
    HelpContext = 8001
    Caption = 'Tipo Año'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Comercial'
      'Calendario')
    TabOrder = 8
    TabStop = True
    OnExit = rgCVE_TIPO_ANUALExit
  end
  object edID_CREDITO: TEdit
    Left = 88
    Top = 5
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 13
  end
  object chB_REDONDEO: TCheckBox
    Tag = 18
    Left = 8
    Top = 26
    Width = 329
    Height = 21
    HelpContext = 1001
    Alignment = taLeftJustify
    Caption = 'Aplica Redondeo'
    TabOrder = 0
    OnClick = chB_REDONDEOClick
    OnExit = chB_REDONDEOExit
  end
  object chB_TASA_MAX_MIN: TCheckBox
    Tag = 18
    Left = 352
    Top = 26
    Width = 193
    Height = 21
    HelpContext = 4001
    Alignment = taLeftJustify
    Caption = 'Aplica Tasas Maximas y/o Mínimas'
    TabOrder = 4
    OnClick = chB_TASA_MAX_MINClick
    OnExit = chB_TASA_MAX_MINExit
  end
  object IedTASA_MAXIMA: TInterEdit
    Tag = 18
    Left = 440
    Top = 66
    Width = 100
    Height = 21
    HelpContext = 5001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = IedTASA_MAXIMAExit
    DisplayMask = '###0.0000'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 5
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object IedTASA_MINIMA: TInterEdit
    Tag = 18
    Left = 440
    Top = 97
    Width = 100
    Height = 21
    HelpContext = 6001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = IedTASA_MINIMAExit
    DisplayMask = '###0.0000'
    MaxLength = 12
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
  object rgCVE_TIPO_MES: TRadioGroup
    Tag = 18
    Left = 280
    Top = 168
    Width = 268
    Height = 37
    HelpContext = 9001
    Caption = 'Tipo Mes'
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      'Comercial'
      'Calendario')
    TabOrder = 9
    TabStop = True
    OnExit = rgCVE_TIPO_MESExit
  end
  object edID_CONTRATO: TEdit
    Left = 161
    Top = 5
    Width = 79
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 14
  end
  object edDESC_PRODUCTO: TEdit
    Left = 296
    Top = 5
    Width = 257
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 15
  end
  object edF_MODIFICA: TEdit
    Left = 124
    Top = 350
    Width = 150
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 16
  end
  object edF_ALTA: TEdit
    Left = 124
    Top = 328
    Width = 150
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 17
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 424
    Top = 350
    Width = 125
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 18
  end
  object edCVE_USU_ALTA: TEdit
    Left = 424
    Top = 328
    Width = 125
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 19
  end
  object edCVE_TIPO_RED: TEdit
    Tag = 530
    Left = 88
    Top = 66
    Width = 73
    Height = 21
    HelpContext = 2001
    CharCase = ecUpperCase
    TabOrder = 1
    OnExit = edCVE_TIPO_REDExit
  end
  object rgNIVEL_REDONDEO: TRadioGroup
    Tag = 18
    Left = 8
    Top = 90
    Width = 329
    Height = 32
    HelpContext = 3001
    Caption = 'Nivel Redondeo'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Superior'
      'Inferiror'
      'Más Cercano')
    TabOrder = 3
    TabStop = True
    OnExit = rgNIVEL_REDONDEOExit
  end
  object PnDatos: TPanel
    Left = 0
    Top = 389
    Width = 553
    Height = 21
    TabOrder = 20
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
      Left = 264
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
      Left = 264
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
      Left = 51
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
      Left = 51
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
  object btTIPO_REDONDEO: TBitBtn
    Tag = 50
    Left = 161
    Top = 66
    Width = 22
    Height = 20
    HelpContext = 2002
    Enabled = False
    TabOrder = 2
    OnClick = btTIPO_REDONDEOClick
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
  object edDESC_TIPO_REDONDEO: TEdit
    Left = 184
    Top = 66
    Width = 157
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 21
  end
  object edCVE_PRODUCTO: TEdit
    Left = 240
    Top = 5
    Width = 56
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 8
    TabOrder = 22
  end
  object GroupBox3: TGroupBox
    Left = 7
    Top = 155
    Width = 542
    Height = 7
    TabOrder = 23
  end
  object MsgPanel: TPanel
    Left = 0
    Top = 372
    Width = 553
    Height = 17
    TabOrder = 24
  end
  object rgCVE_TASA_GTIA: TGroupBox
    Left = 2
    Top = 216
    Width = 551
    Height = 73
    HelpContext = 9010
    Caption = 'Tasa de Referencia Gtía'
    TabOrder = 10
    object lbOPERADOR_STASA: TLabel
      Left = 8
      Top = 52
      Width = 81
      Height = 13
      Caption = 'Ope. STasa Gtía'
    end
    object lbCVE_TASA_GTIA: TLabel
      Left = 8
      Top = 28
      Width = 83
      Height = 13
      Caption = 'Tasa de Ref Gtía'
    end
    object Label9: TLabel
      Left = 136
      Top = 52
      Width = 48
      Height = 13
      Caption = 'STasa (%)'
    end
    object edOPE_STASA_GTIA: TEdit
      Tag = 530
      Left = 96
      Top = 44
      Width = 38
      Height = 21
      HelpContext = 9004
      CharCase = ecUpperCase
      MaxLength = 1
      TabOrder = 3
      OnExit = edOPE_STASA_GTIAExit
    end
    object edSOBRETASA_GTIA: TInterEdit
      Tag = 530
      Left = 192
      Top = 44
      Width = 81
      Height = 21
      HelpContext = 9005
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edSOBRETASA_GTIAExit
      DisplayMask = '###0.0000'
      MaxLength = 12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 4
      UseReType = True
      UseSep = True
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edDESC_TASA_REFER: TEdit
      Left = 192
      Top = 20
      Width = 350
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object btTASA_REFER: TBitBtn
      Tag = 18
      Left = 169
      Top = 21
      Width = 22
      Height = 20
      HelpContext = 9003
      TabOrder = 1
      OnClick = btTASA_REFERClick
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
    object edCVE_TASA_GTIA: TEdit
      Tag = 530
      Left = 96
      Top = 20
      Width = 72
      Height = 21
      HelpContext = 9002
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = edCVE_TASA_GTIAExit
    end
  end
  object IedDigitosTasa: TInterEdit
    Tag = 18
    Left = 288
    Top = 292
    Width = 25
    Height = 21
    HelpContext = 9050
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    OnExit = IedDigitosTasaExit
    MaxLength = 6
    TabOrder = 11
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object chB_ANIO_BIS: TCheckBox
    Tag = 18
    Left = 360
    Top = 292
    Width = 185
    Height = 21
    HelpContext = 9060
    Alignment = taLeftJustify
    Caption = 'Aplica año bisiesto'
    TabOrder = 12
    OnExit = chB_ANIO_BISExit
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
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
    Left = 354
    Top = 2
  end
  object ilTIPO_REDONDEO: TInterLinkit
    Control = edCVE_TIPO_RED
    OnEjecuta = ilTIPO_REDONDEOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 192
    Top = 59
  end
  object ilCVE_TASA_GTIA: TInterLinkit
    Control = edCVE_TASA_GTIA
    OnEjecuta = ilCVE_TASA_GTIAEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 259
    Top = 230
  end
end
