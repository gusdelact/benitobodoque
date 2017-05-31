object WCrFinAdic: TWCrFinAdic
  Left = 235
  Top = 134
  Width = 799
  Height = 510
  Caption = 'Financiamiento adicional'
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
  object Label10: TLabel
    Left = 680
    Top = -2
    Width = 80
    Height = 13
    Caption = 'Aplica Búsqueda'
  end
  object Label2: TLabel
    Left = 112
    Top = 18
    Width = 43
    Height = 14
    Caption = 'Producto'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbFiltro: TLabel
    Left = 112
    Top = 42
    Width = 55
    Height = 14
    Caption = 'Disposición'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 112
    Top = 63
    Width = 57
    Height = 14
    Caption = 'Vigentes al:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object sbLogCobranza: TSpeedButton
    Left = 639
    Top = 405
    Width = 5
    Height = 5
    OnClick = sbLogCobranzaClick
  end
  object btBUSCA: TBitBtn
    Left = 625
    Top = 58
    Width = 135
    Height = 23
    HelpContext = 9001
    Caption = 'Inicia Búsqueda'
    TabOrder = 9
    OnClick = btBUSCAClick
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
  object PnDatos: TPanel
    Left = 0
    Top = 442
    Width = 760
    Height = 21
    TabOrder = 14
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
  object btProcesa: TBitBtn
    Left = 644
    Top = 414
    Width = 115
    Height = 20
    Caption = 'Procesa'
    TabOrder = 15
    OnClick = btProcesaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
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
  object MErrores: TMemo
    Left = 0
    Top = 397
    Width = 640
    Height = 41
    TabStop = False
    Color = clInfoBk
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 16
  end
  object rgTipoFiltro: TRadioGroup
    Left = 0
    Top = 0
    Width = 105
    Height = 81
    Caption = 'Busqueda por:'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemIndex = 1
    Items.Strings = (
      'Acreditado'
      'Disposición'
      'ID-Fira'
      'No Control FIRA')
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    OnClick = rgTipoFiltroClick
  end
  object edCVE_PRODUCTO_CRE: TEdit
    Tag = 512
    Left = 187
    Top = 10
    Width = 80
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object btCVE_PRODUCTO: TBitBtn
    Tag = 17
    Left = 272
    Top = 11
    Width = 22
    Height = 20
    TabOrder = 2
    OnClick = btCVE_PRODUCTOClick
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
  object edDESC_PRODUCTO: TEdit
    Tag = -1
    Left = 300
    Top = 10
    Width = 435
    Height = 21
    TabStop = False
    Color = clMenu
    TabOrder = 3
  end
  object cbPRODUCTO: TCheckBox
    Left = 745
    Top = 11
    Width = 15
    Height = 17
    TabStop = False
    TabOrder = 4
    OnClick = cbPRODUCTOClick
  end
  object edValorFiltro: TEdit
    Tag = 512
    Left = 187
    Top = 34
    Width = 80
    Height = 21
    TabOrder = 5
  end
  object btnFiltro: TBitBtn
    Tag = 17
    Left = 272
    Top = 35
    Width = 22
    Height = 20
    TabOrder = 6
    OnClick = btnFiltroClick
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
  object edDESC_FILTRO: TEdit
    Tag = -1
    Left = 300
    Top = 34
    Width = 435
    Height = 21
    TabStop = False
    Color = clMenu
    TabOrder = 7
  end
  object cbFiltro: TCheckBox
    Left = 745
    Top = 35
    Width = 15
    Height = 17
    TabStop = False
    TabOrder = 8
    OnClick = cbFiltroClick
  end
  object gbParametros: TGroupBox
    Left = 304
    Top = 136
    Width = 217
    Height = 89
    Caption = 'Parámetros'
    TabOrder = 12
    TabStop = True
    object lbFOpera: TLabel
      Left = 24
      Top = 20
      Width = 30
      Height = 14
      Caption = 'Fecha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object btFECHA: TSpeedButton
      Left = 159
      Top = 17
      Width = 25
      Height = 21
      Hint = 'Aplica fecha a todos los créditos'
      Flat = True
      Glyph.Data = {
        8A050000424D8A05000000000000360400002800000013000000110000000100
        0800000000005401000000000000000000000001000000010000000000007B00
        0000FF000000007B000000FF0000FFFF00007B5A0800BD8C100000007B00007B
        7B00EFCE7B000000FF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
        0505050505050505050505050500050505050505050505030D05050505050505
        050005050505050505050303030D050505050505050005050505050505000303
        03030D05050505050500050505050505000000000000000D0505050505000505
        0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D05000505000000000000000000000000
        0000000D05000505000D0D0D0D0D0D0D0D0D0D0D0D0D000D05000505000D0000
        000D0000000D0000000D000D05000505000D0D0D0D0D0D0D0D0D0D0D0D0D000D
        05000505000D0000000D0000000D0000000D000D05000505000D0D0D0D0D0D0D
        0D0D0D0D0D0D000D050005050001010101010101010101010101000D05000505
        0001010101010101010101010101000D05000505000000000000000000000000
        0000000D05000505050505050505050505050505050505050500050505050505
        0505050505050505050505050500}
      ParentShowHint = False
      ShowHint = True
      OnClick = btFECHAClick
    end
    object lbB_TASA_PASIVA: TLabel
      Left = 24
      Top = 43
      Width = 137
      Height = 26
      Caption = 'Capitaliza el crédito pasivo a tasa pasiva  ( prorrogas )'
      WordWrap = True
    end
    object edFECHA_VALOR: TEdit
      Tag = 17
      Left = 68
      Top = 16
      Width = 62
      Height = 22
      CharCase = ecUpperCase
      Color = clMenu
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnExit = edFECHA_VALORExit
    end
    object dtFECHA: TInterDateTimePicker
      Tag = 17
      Left = 131
      Top = 16
      Width = 19
      Height = 22
      CalAlignment = dtaLeft
      Date = 37825.7332781018
      Time = 37825.7332781018
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      OnExit = dtFECHAExit
      Edit = edFECHA_VALOR
      Formato = dfDate
    end
    object cbB_TASA_PASIVA: TCheckBox
      Left = 167
      Top = 48
      Width = 17
      Height = 17
      TabOrder = 2
      OnClick = cbB_TASA_PASIVAClick
    end
  end
  object gbImporte: TGroupBox
    Left = 528
    Top = 136
    Width = 231
    Height = 89
    Caption = 'Importe'
    TabOrder = 13
    TabStop = True
    object Label8: TLabel
      Left = 180
      Top = 0
      Width = 34
      Height = 14
      Caption = 'Aplicar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 14
      Top = 59
      Width = 22
      Height = 14
      Caption = 'Total'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object edTOTAL: TInterEdit
      Left = 92
      Top = 56
      Width = 100
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      MaxLength = 50
      Color = clMenu
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 0
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object btINTERES: TBitBtn
      Left = 14
      Top = 16
      Width = 60
      Height = 21
      Hint = 'Muestra catálogo de interés'
      Caption = 'Interés'
      TabOrder = 1
      OnClick = btINTERESClick
    end
    object edINTERES: TInterEdit
      Left = 92
      Top = 16
      Width = 100
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edINTERESExit
      DisplayMask = '###,###,###,###,###,##0.00'
      MaxLength = 50
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 2
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object cbINTERES: TCheckBox
      Tag = 17
      Left = 196
      Top = 18
      Width = 15
      Height = 17
      TabOrder = 3
      OnClick = cbINTERESClick
    end
  end
  object gbGeneral: TGroupBox
    Left = 0
    Top = 88
    Width = 297
    Height = 137
    Caption = 'Información general'
    TabOrder = 10
    TabStop = True
    object Label11: TLabel
      Left = 173
      Top = 19
      Width = 38
      Height = 14
      Caption = 'Moneda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 173
      Top = 43
      Width = 35
      Height = 14
      Caption = 'ID FIRA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 13
      Top = 91
      Width = 50
      Height = 14
      Caption = 'S. Insoluto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 173
      Top = 115
      Width = 33
      Height = 14
      Caption = 'F. Final'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 13
      Top = 67
      Width = 58
      Height = 14
      Caption = 'Monto Inicial'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 173
      Top = 91
      Width = 35
      Height = 14
      Caption = 'F. Inicio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 173
      Top = 60
      Width = 41
      Height = 28
      AutoSize = False
      Caption = 'No. Ctrl  FIRA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object edCredito: TInterEdit
      Left = 74
      Top = 40
      Width = 73
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 10
      Color = clMenu
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 4
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIdContrato: TInterEdit
      Left = 74
      Top = 16
      Width = 73
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trContrato
      MaxLength = 10
      Color = clMenu
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 1
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object BitBtn2: TBitBtn
      Left = 5
      Top = 16
      Width = 68
      Height = 21
      Hint = 'Muestra catálogo de la línea'
      Caption = 'Autorización'
      TabOrder = 0
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 5
      Top = 40
      Width = 68
      Height = 21
      Hint = 'Muestra catálogo de la disposición'
      Caption = 'Disposición'
      TabOrder = 3
      OnClick = BitBtn3Click
    end
    object edMoneda: TEdit
      Left = 218
      Top = 16
      Width = 73
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = 'PESO MEXICANO'
    end
    object edIDFira: TInterEdit
      Left = 218
      Top = 40
      Width = 73
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      MaxLength = 6
      Color = clMenu
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 5
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edSdoInsoluto: TInterEdit
      Left = 74
      Top = 88
      Width = 73
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      MaxLength = 50
      Color = clMenu
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 6
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edFFin: TInterEdit
      Left = 218
      Top = 112
      Width = 73
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 10
      Color = clMenu
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 7
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edMonto: TInterEdit
      Left = 74
      Top = 64
      Width = 73
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      MaxLength = 50
      Color = clMenu
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 8
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edFInicio: TInterEdit
      Left = 218
      Top = 88
      Width = 73
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 10
      Color = clMenu
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 9
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object BitBtn4: TBitBtn
      Left = 5
      Top = 112
      Width = 68
      Height = 21
      Hint = 'Muestra catálogo de la disposición'
      Caption = 'Producto    '
      TabOrder = 10
      OnClick = BitBtn4Click
    end
    object edProducto: TInterEdit
      Left = 74
      Top = 112
      Width = 73
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 10
      Color = clMenu
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 11
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edNoCtrlFIRA: TInterEdit
      Left = 218
      Top = 64
      Width = 73
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      MaxLength = 6
      Color = clMenu
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 12
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object gbAcreditado: TGroupBox
    Left = 304
    Top = 88
    Width = 455
    Height = 41
    Caption = 'Acreditado'
    TabOrder = 11
    object lbAcreditado: TLabel
      Left = 5
      Top = 18
      Width = 441
      Height = 13
      Caption = 'AGRICULTORES UNIDOS DEL VALLE DEL MEZQUITAL SPR DE RL DE C.V.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
  object edFechaVig: TEdit
    Tag = 17
    Left = 187
    Top = 59
    Width = 62
    Height = 22
    CharCase = ecUpperCase
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 17
    OnChange = edFechaVigChange
  end
  object dtFechaVig: TInterDateTimePicker
    Tag = 17
    Left = 250
    Top = 59
    Width = 19
    Height = 22
    CalAlignment = dtaLeft
    Date = 37825.7332781018
    Time = 37825.7332781018
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 18
    Edit = edFechaVig
    Formato = dfDate
  end
  object cbAplicaVig: TCheckBox
    Left = 272
    Top = 62
    Width = 80
    Height = 17
    TabStop = False
    Caption = 'Aplica Filtro'
    TabOrder = 19
    OnClick = cbAplicaVigClick
  end
  object sagDATOS: TStringAlignGrid
    Left = 0
    Top = 232
    Width = 758
    Height = 161
    ColCount = 7
    DefaultRowHeight = 17
    FixedCols = 0
    ScrollBars = ssVertical
    TabOrder = 20
    OnDrawCell = sagDATOSDrawCell
    OnMouseDown = sagDATOSMouseDown
    OnSelectCell = sagDATOSSelectCell
    ColWidths = (
      21
      61
      47
      66
      67
      96
      371)
    Cells = (
      0
      0
      'Sel'
      1
      0
      'Disposición'
      2
      0
      'Periodo'
      3
      0
      'F. Vencim.'
      4
      0
      'F. Operación'
      5
      0
      'Total'
      6
      0
      'Acreditado')
    PropCell = (
      5
      0
      1
      2
      0
      6
      0
      1
      2
      0)
    PropCol = (
      5
      1
      0
      0
      6
      1
      1
      0)
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = ()
  end
  object cbSeleccion: TCheckBox
    Tag = 17
    Left = 655
    Top = 393
    Width = 103
    Height = 15
    Alignment = taLeftJustify
    Caption = 'Seleccionar todos'
    TabOrder = 21
    Visible = False
    OnClick = cbSeleccionClick
  end
  object CBtodos: TCheckBox
    Left = 448
    Top = 62
    Width = 169
    Height = 17
    TabStop = False
    Caption = 'Ver Todos los Financiamientos'
    TabOrder = 22
    OnClick = CBtodosClick
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
    Left = 432
    Top = 8
  end
  object ilCveProdCre: TInterLinkit
    Control = edCVE_PRODUCTO_CRE
    OnEjecuta = ilCveProdCreEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 336
    Top = 8
  end
  object ikValorFiltro: TInterLinkit
    Control = edValorFiltro
    OnEjecuta = ikValorFiltroEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    Left = 336
    Top = 32
  end
  object ImageList: TImageList
    BlendColor = clWhite
    BkColor = clWhite
    Masked = False
    Left = 520
    Top = 302
    Bitmap = {
      494C010102000400040010001000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00000000000000
      0000FFFFFF00000000000000000000000000FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300636B7300636B7300636B
      7300636B7300636B7300636B7300636B7300636B7300636B7300E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300636B7300636B7300636B
      7300636B7300636B7300636B7300636B7300636B7300636B7300E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      7FC07FC0000000007FC077C0000000007FC063C0000000007FC041C000000000
      7FC048C0000000007FC05C40000000007FC07E40000000007FC07F4000000000
      7FC07FC000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
