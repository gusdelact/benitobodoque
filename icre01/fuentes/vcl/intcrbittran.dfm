object WCrbittrans: TWCrbittrans
  Left = 452
  Top = 165
  Width = 482
  Height = 382
  Caption = 'Bitácora de Transacciones'
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
  object sbExcel: TSpeedButton
    Left = 94
    Top = 292
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
      00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
      00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
      00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
      0003737FFFFFFFFF7F7330099999999900333777777777777733}
    NumGlyphs = 2
    OnClick = sbExcelClick
  end
  object Label6: TLabel
    Left = 5
    Top = 297
    Width = 77
    Height = 13
    Caption = 'Generar Archivo'
  end
  object lbAplica: TLabel
    Left = 420
    Top = 20
    Width = 53
    Height = 31
    Alignment = taCenter
    AutoSize = False
    Caption = 'Aplica Búsqueda'
    WordWrap = True
  end
  object Label7: TLabel
    Left = 410
    Top = 319
    Width = 63
    Height = 15
    Caption = 'Ver. 2014/02'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object PnDatos: TPanel
    Left = 0
    Top = 332
    Width = 474
    Height = 21
    TabOrder = 2
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
      Left = 380
      Top = 2
      Width = 29
      Height = 8
      Caption = 'FECHA:'
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
      Left = 53
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
      Left = 282
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
      Left = 409
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
      Left = 53
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
  object edNbrArch: TEdit
    Left = 124
    Top = 293
    Width = 302
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 3
    OnChange = edNbrArchChange
  end
  object cbxArchivo: TCheckBox
    Left = 441
    Top = 296
    Width = 14
    Height = 15
    TabStop = False
    Enabled = False
    TabOrder = 1
    OnClick = cbxArchivoClick
  end
  object GroupBox1: TGroupBox
    Left = 1
    Top = 1
    Width = 416
    Height = 43
    Caption = 'Rango de Fechas'
    TabOrder = 0
    object Label4: TLabel
      Left = 45
      Top = 19
      Width = 27
      Height = 13
      Caption = 'Inicial'
    end
    object Label8: TLabel
      Left = 263
      Top = 18
      Width = 22
      Height = 13
      Caption = 'Final'
    end
    object edF_Inicial: TEdit
      Tag = 512
      Left = 80
      Top = 15
      Width = 76
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 0
    end
    object dtpFECHAIni: TInterDateTimePicker
      Left = 158
      Top = 15
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 39960.450694537
      Time = 39960.450694537
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      TabStop = False
      Edit = edF_Inicial
      Formato = dfDate
    end
    object edF_Final: TEdit
      Tag = 512
      Left = 292
      Top = 14
      Width = 76
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 2
    end
    object dtpFECHAFin: TInterDateTimePicker
      Left = 370
      Top = 14
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 39960.450694537
      Time = 39960.450694537
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      TabStop = False
      Edit = edF_Final
      Formato = dfDate
    end
  end
  object GroupBox2: TGroupBox
    Left = 1
    Top = 49
    Width = 471
    Height = 151
    Caption = 'Filtros'
    TabOrder = 4
    object Label3: TLabel
      Left = 8
      Top = 26
      Width = 36
      Height = 13
      Caption = 'Usuario'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 8
      Top = 119
      Width = 35
      Height = 13
      Caption = 'Importe'
      WordWrap = True
    end
    object Label1: TLabel
      Left = 8
      Top = 87
      Width = 54
      Height = 13
      Caption = 'Disposición'
      WordWrap = True
    end
    object Label5: TLabel
      Left = 8
      Top = 56
      Width = 51
      Height = 13
      Caption = 'Acreditado'
      WordWrap = True
    end
    object chbxUsuario: TCheckBox
      Left = 440
      Top = 24
      Width = 14
      Height = 17
      TabStop = False
      Enabled = False
      TabOrder = 0
      OnClick = chbxUsuarioClick
    end
    object edCVE_USUARIO: TEdit
      Tag = 512
      Left = 79
      Top = 22
      Width = 76
      Height = 21
      HelpContext = 2000
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 1
    end
    object btUSUARIO: TBitBtn
      Left = 156
      Top = 22
      Width = 21
      Height = 21
      HelpContext = 2001
      TabOrder = 2
      OnClick = btUSUARIOClick
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
    object edNOM_USUARIO: TEdit
      Left = 179
      Top = 22
      Width = 246
      Height = 21
      TabStop = False
      Color = clBtnFace
      TabOrder = 3
    end
    object CBxOperador: TComboBox
      Left = 79
      Top = 115
      Width = 97
      Height = 21
      ItemHeight = 13
      MaxLength = 2
      TabOrder = 4
      OnChange = CBxOperadorChange
      Items.Strings = (
        'Igual a'
        'Menor a'
        'Mayor a')
    end
    object edImporte: TInterEdit
      Left = 179
      Top = 115
      Width = 117
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edImporteEnter
      OnExit = edImporteExit
      MaxLength = 12
      Color = clBtnFace
      TabOrder = 5
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object ChBImporte: TCheckBox
      Left = 440
      Top = 117
      Width = 14
      Height = 17
      TabStop = False
      Enabled = False
      TabOrder = 6
      OnClick = ChBImporteClick
    end
    object edID_CESION: TEdit
      Tag = 512
      Left = 79
      Top = 83
      Width = 76
      Height = 21
      HelpContext = 4000
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 7
    end
    object btID_CESION: TBitBtn
      Tag = 17
      Left = 156
      Top = 82
      Width = 21
      Height = 21
      HelpContext = 4100
      TabOrder = 8
      OnClick = btID_CESIONClick
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
    object edCESION: TEdit
      Left = 179
      Top = 82
      Width = 246
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 9
    end
    object chbxCESION: TCheckBox
      Left = 440
      Top = 85
      Width = 14
      Height = 15
      TabStop = False
      Enabled = False
      TabOrder = 10
      OnClick = chbxCESIONClick
    end
    object edACREDITADO: TEdit
      Tag = 512
      Left = 79
      Top = 52
      Width = 76
      Height = 21
      HelpContext = 2000
      TabOrder = 11
    end
    object btACREDITADO: TBitBtn
      Tag = 17
      Left = 156
      Top = 52
      Width = 21
      Height = 21
      HelpContext = 2100
      TabOrder = 12
      OnClick = btACREDITADOClick
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
    object edNOMBRE_ACRED: TEdit
      Left = 179
      Top = 52
      Width = 246
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 13
    end
    object chbxAcreditado: TCheckBox
      Left = 440
      Top = 54
      Width = 14
      Height = 17
      TabStop = False
      Enabled = False
      TabOrder = 14
      OnClick = chbxAcreditadoClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 1
    Top = 203
    Width = 471
    Height = 74
    Caption = 'Sistema Origen:'
    TabOrder = 5
    object ChBIcre: TCheckBox
      Left = 18
      Top = 15
      Width = 46
      Height = 25
      Caption = 'ICRE'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object ChBInter: TCheckBox
      Left = 201
      Top = 15
      Width = 82
      Height = 25
      Caption = 'Intercréditos'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 1
    end
    object ChBLiqcre: TCheckBox
      Left = 18
      Top = 40
      Width = 95
      Height = 25
      Caption = 'Liq. de Crédito.'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object ChBCambtas: TCheckBox
      Left = 362
      Top = 25
      Width = 100
      Height = 25
      Caption = 'Cambio de tasas.'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object ChBCoin: TCheckBox
      Left = 201
      Top = 40
      Width = 59
      Height = 25
      Caption = 'Coincre'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
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
    OnBtnPreviewClick = InterForma1BtnPreviewClick
    ShowBtnPreview = False
    OnBtnImprimirClick = InterForma1BtnImprimirClick
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 210
    Top = 2
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'prn'
    Filter = 'Archivos Microsoft Excel (*.XLS)|*.XLS'
    Left = 210
    Top = 288
  end
  object ilUSUARIO: TInterLinkit
    Control = edCVE_USUARIO
    OnEjecuta = ilUSUARIOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilUSUARIOCapture
    Left = 252
    Top = 65
  end
  object ilCesion: TInterLinkit
    Control = edID_CESION
    OnEjecuta = ilCesionEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCesionCapture
    Left = 298
    Top = 128
  end
  object ilACREDITADO: TInterLinkit
    Control = edACREDITADO
    OnEjecuta = ilACREDITADOEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    OnCapture = ilACREDITADOCapture
    Left = 270
    Top = 97
  end
end
