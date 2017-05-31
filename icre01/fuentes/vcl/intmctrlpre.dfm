object wMCtrlPre: TwMCtrlPre
  Left = 274
  Top = 158
  Width = 560
  Height = 480
  Caption = 'Reporte de Control de Posible Premio a Otorgar'
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
  object lbAplica: TLabel
    Left = 484
    Top = 17
    Width = 57
    Height = 27
    Alignment = taCenter
    AutoSize = False
    Caption = 'Búsqueda'
    WordWrap = True
  end
  object Label1: TLabel
    Left = 3
    Top = 142
    Width = 93
    Height = 13
    Caption = 'Acreditado / Emisor'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 3
    Top = 196
    Width = 97
    Height = 13
    Caption = 'Disposición / Cesión'
    WordWrap = True
  end
  object sbExcel: TSpeedButton
    Left = 102
    Top = 383
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
    Left = 3
    Top = 388
    Width = 77
    Height = 13
    Caption = 'Generar Archivo'
  end
  object Label9: TLabel
    Left = 3
    Top = 75
    Width = 69
    Height = 13
    Caption = 'Gpo. Producto'
  end
  object Label4: TLabel
    Left = 60
    Top = 17
    Width = 30
    Height = 13
    Caption = 'Fecha'
  end
  object Label5: TLabel
    Left = 3
    Top = 168
    Width = 28
    Height = 13
    Caption = 'Línea'
    WordWrap = True
  end
  object rgSitPrem: TRadioGroup
    Left = 0
    Top = 315
    Width = 537
    Height = 30
    HelpContext = 7000
    Caption = 'Situación del Premio'
    Columns = 4
    ItemIndex = 3
    Items.Strings = (
      'Activo'
      'Cancelado'
      'Liquidado'
      'Todos')
    TabOrder = 17
  end
  object PnDatos: TPanel
    Left = 0
    Top = 410
    Width = 539
    Height = 21
    TabOrder = 21
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
  object edACREDITADO: TEdit
    Tag = 512
    Left = 103
    Top = 138
    Width = 76
    Height = 21
    HelpContext = 2000
    TabOrder = 3
    OnExit = edACREDITADOExit
  end
  object btACREDITADO: TBitBtn
    Tag = 17
    Left = 180
    Top = 138
    Width = 21
    Height = 21
    HelpContext = 2100
    TabOrder = 4
    OnClick = btACREDITADOClick
    OnExit = btACREDITADOExit
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
    Left = 208
    Top = 138
    Width = 274
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object chbxAcreditado: TCheckBox
    Left = 505
    Top = 140
    Width = 14
    Height = 17
    TabStop = False
    Enabled = False
    TabOrder = 6
    OnClick = chbxAcreditadoClick
  end
  object chbxCESION: TCheckBox
    Left = 505
    Top = 195
    Width = 14
    Height = 15
    TabStop = False
    Enabled = False
    TabOrder = 20
    OnClick = chbxCESIONClick
  end
  object edCESION: TEdit
    Left = 208
    Top = 192
    Width = 274
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 19
  end
  object btID_CESION: TBitBtn
    Tag = 17
    Left = 180
    Top = 192
    Width = 21
    Height = 21
    HelpContext = 4100
    TabOrder = 12
    OnClick = btID_CESIONClick
    OnExit = btID_CESIONExit
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
  object edID_CESION: TEdit
    Tag = 512
    Left = 103
    Top = 192
    Width = 76
    Height = 21
    HelpContext = 4000
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 11
    OnChange = edID_CESIONChange
    OnExit = edID_CESIONExit
  end
  object edNbrArch: TEdit
    Left = 132
    Top = 384
    Width = 350
    Height = 21
    Color = clBtnFace
    TabOrder = 18
    OnChange = edNbrArchChange
  end
  object cbxArchivo: TCheckBox
    Left = 505
    Top = 387
    Width = 14
    Height = 15
    TabStop = False
    Enabled = False
    TabOrder = 22
    OnClick = cbxArchivoClick
  end
  object cbxCVE_PRODUCTO_GPO: TCheckBox
    Left = 505
    Top = 75
    Width = 14
    Height = 17
    TabStop = False
    Enabled = False
    TabOrder = 2
    OnClick = cbxCVE_PRODUCTO_GPOClick
  end
  object GBRango: TGroupBox
    Left = 149
    Top = 217
    Width = 389
    Height = 44
    HelpContext = 6000
    Caption = 'Rango de Fecha de Inicio de Crédito'
    TabOrder = 15
    object lbLiqF_INICIO: TLabel
      Left = 20
      Top = 22
      Width = 37
      Height = 13
      Caption = 'F. Inicio'
    end
    object Label3: TLabel
      Left = 183
      Top = 22
      Width = 34
      Height = 13
      Caption = 'F. Final'
    end
    object edF_INICIO: TEdit
      Left = 74
      Top = 18
      Width = 76
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edF_INICIOChange
    end
    object dtpF_INICIO: TInterDateTimePicker
      Left = 151
      Top = 18
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
      TabStop = False
      Edit = edF_INICIO
      Formato = dfDate
    end
    object edF_FINAL: TEdit
      Left = 237
      Top = 18
      Width = 76
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnChange = edF_INICIOChange
    end
    object dtpF_FINAL: TInterDateTimePicker
      Left = 314
      Top = 18
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
      TabStop = False
      Edit = edF_FINAL
      Formato = dfDate
    end
    object ChBxFechas: TCheckBox
      Left = 356
      Top = 20
      Width = 14
      Height = 17
      Enabled = False
      TabOrder = 4
      OnClick = ChBxFechasClick
    end
  end
  object dtpFECHA: TInterDateTimePicker
    Left = 183
    Top = 11
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 40966.4495066667
    Time = 40966.4495066667
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
    Edit = edFECHA
    Formato = dfDate
  end
  object edFECHA: TEdit
    Left = 103
    Top = 11
    Width = 76
    Height = 21
    HelpContext = 100
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edID_CONTRATO: TEdit
    Tag = 512
    Left = 103
    Top = 164
    Width = 76
    Height = 21
    HelpContext = 3000
    TabOrder = 7
    OnExit = edID_CONTRATOExit
  end
  object btnCONTRATO: TBitBtn
    Tag = 17
    Left = 180
    Top = 164
    Width = 21
    Height = 21
    HelpContext = 3100
    TabOrder = 8
    OnClick = btnCONTRATOClick
    OnExit = btnCONTRATOExit
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
  object edDESC_C_PRODUCTO: TEdit
    Left = 207
    Top = 164
    Width = 274
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 9
  end
  object chbxContrato: TCheckBox
    Left = 505
    Top = 166
    Width = 14
    Height = 17
    TabStop = False
    Enabled = False
    TabOrder = 10
    OnClick = chbxContratoClick
  end
  object ChBxDetalle: TCheckBox
    Left = 7
    Top = 232
    Width = 97
    Height = 17
    HelpContext = 5000
    Caption = 'Mostrar Detalle'
    Checked = True
    State = cbChecked
    TabOrder = 13
  end
  object cbCveGpoProd: TCheckListBox
    Left = 0
    Top = 93
    Width = 94
    Height = 36
    ItemHeight = 13
    TabOrder = 23
    Visible = False
  end
  object cbGpoProducto: TCheckListBox
    Left = 104
    Top = 41
    Width = 380
    Height = 87
    ItemHeight = 13
    TabOrder = 24
    OnClick = cbGpoProductoClick
  end
  object RGSitCred: TRadioGroup
    Left = 0
    Top = 348
    Width = 537
    Height = 30
    HelpContext = 7000
    Caption = 'Situación del Credito'
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Activo'
      'Liquidado'
      'Ambos')
    TabOrder = 25
  end
  object GroupBox1: TGroupBox
    Left = 147
    Top = 265
    Width = 389
    Height = 44
    HelpContext = 6500
    Caption = 'Rango de Fecha de Inicio de Premio'
    TabOrder = 16
    object Label7: TLabel
      Left = 20
      Top = 22
      Width = 37
      Height = 13
      Caption = 'F. Inicio'
    end
    object Label8: TLabel
      Left = 183
      Top = 22
      Width = 34
      Height = 13
      Caption = 'F. Final'
    end
    object edF_INICIO_PREM: TEdit
      Left = 74
      Top = 18
      Width = 76
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edF_INICIO_PREMChange
    end
    object dtpF_INICIO_PREM: TInterDateTimePicker
      Left = 151
      Top = 18
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
      TabStop = False
      Edit = edF_INICIO_PREM
      Formato = dfDate
    end
    object edF_FINAL_PREM: TEdit
      Left = 237
      Top = 18
      Width = 76
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnChange = edF_INICIO_PREMChange
    end
    object dtpF_FINAL_PREM: TInterDateTimePicker
      Left = 314
      Top = 18
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
      TabStop = False
      Edit = edF_FINAL_PREM
      Formato = dfDate
    end
    object ChBxFechas_PREM: TCheckBox
      Left = 356
      Top = 20
      Width = 13
      Height = 17
      Enabled = False
      TabOrder = 4
      OnClick = ChBxFechas_PREMClick
    end
  end
  object ChBxTransCancel: TCheckBox
    Left = 8
    Top = 272
    Width = 129
    Height = 17
    HelpContext = 5500
    Caption = 'Mostrar Trans Cancela'
    Checked = True
    State = cbChecked
    TabOrder = 14
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
    Left = 390
    Top = 5
  end
  object ilACREDITADO: TInterLinkit
    Control = edACREDITADO
    OnEjecuta = ilACREDITADOEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    OnCapture = ilACREDITADOCapture
    Left = 278
    Top = 134
  end
  object ilCesion: TInterLinkit
    Control = edID_CESION
    OnEjecuta = ilCesionEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCesionCapture
    Left = 347
    Top = 189
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'prn'
    Filter = '*.prn|*.prn'
    Left = 218
    Top = 380
  end
  object ilCONTRATO: TInterLinkit
    Control = edID_CONTRATO
    OnEjecuta = ilCONTRATOEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    OnCapture = ilCONTRATOCapture
    Left = 309
    Top = 160
  end
end
