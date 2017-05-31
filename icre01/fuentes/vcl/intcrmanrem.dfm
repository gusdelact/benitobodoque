object WCrManRem: TWCrManRem
  Left = 297
  Top = 115
  Width = 675
  Height = 501
  Caption = 'Manejo de Remanentes'
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
  object lbID_EMISOR: TLabel
    Left = 2
    Top = 18
    Width = 31
    Height = 13
    Caption = 'Emisor'
  end
  object lbID_PROVEEDOR: TLabel
    Left = 2
    Top = 61
    Width = 108
    Height = 13
    Caption = 'Proveedor / Id Externo'
  end
  object lbID_CESION: TLabel
    Left = 2
    Top = 83
    Width = 32
    Height = 13
    Caption = 'Cesión'
  end
  object lbF_PAG_INICIAL: TLabel
    Left = 2
    Top = 113
    Width = 67
    Height = 13
    Caption = 'F. Pago Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbF_PAG_FINAL: TLabel
    Left = 409
    Top = 113
    Width = 62
    Height = 13
    Caption = 'F. Pago Final'
  end
  object lbIMP_MINIMO: TLabel
    Left = 2
    Top = 158
    Width = 73
    Height = 13
    Caption = 'Importe Mínimo'
  end
  object lbIMP_MAXIMO: TLabel
    Left = 409
    Top = 158
    Width = 74
    Height = 13
    Caption = 'Importe Máximo'
  end
  object lbSIT_MAN_REM: TLabel
    Left = 9
    Top = 304
    Width = 44
    Height = 13
    Caption = 'Situación'
    Visible = False
  end
  object Label19: TLabel
    Left = 560
    Top = -1
    Width = 79
    Height = 13
    Alignment = taCenter
    Caption = 'Aplica búsqueda'
  end
  object Label2: TLabel
    Left = 2
    Top = 38
    Width = 48
    Height = 14
    Caption = 'Id Nafinsa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 2
    Top = 137
    Width = 66
    Height = 13
    Caption = 'F. Valor Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 409
    Top = 137
    Width = 61
    Height = 13
    Caption = 'F. Valor Final'
  end
  object dtpF_PAG_INICIAL: TInterDateTimePicker
    Tag = 17
    Left = 182
    Top = 109
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 37825.7332781018
    Time = 37825.7332781018
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 16
    OnClick = dtpF_PAG_INICIALClick
    OnEnter = dtpF_PAG_INICIALEnter
    OnExit = dtpF_PAG_INICIALExit
    Edit = edF_PAG_INICIAL
    Formato = dfDate
  end
  object edF_PAG_INICIAL: TEdit
    Tag = 17
    Left = 106
    Top = 109
    Width = 75
    Height = 21
    CharCase = ecUpperCase
    Color = clMenu
    ReadOnly = True
    TabOrder = 15
    OnExit = dtpF_PAG_INICIALExit
  end
  object dtpF_PAG_FINAL: TInterDateTimePicker
    Tag = 17
    Left = 598
    Top = 109
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 37825.7332781018
    Time = 37825.7332781018
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 18
    OnClick = dtpF_PAG_FINALClick
    OnEnter = dtpF_PAG_FINALEnter
    OnExit = dtpF_PAG_FINALExit
    Edit = edF_PAG_FINAL
    Formato = dfDate
  end
  object edF_PAG_FINAL: TEdit
    Tag = 17
    Left = 521
    Top = 109
    Width = 75
    Height = 21
    CharCase = ecUpperCase
    Color = clMenu
    ReadOnly = True
    TabOrder = 17
    OnExit = dtpF_PAG_FINALExit
  end
  object rgSIT_MAN_REM: TRadioGroup
    Left = 0
    Top = 173
    Width = 500
    Height = 30
    Caption = 'Situación'
    Columns = 4
    Items.Strings = (
      'No Autorizados'
      'Autorizados'
      'Liberados'
      'Todos (Menos CA)')
    TabOrder = 28
    TabStop = True
  end
  object chB_APLICA_EMISOR: TCheckBox
    Tag = 18
    Left = 625
    Top = 14
    Width = 16
    Height = 21
    HelpContext = 1003
    Color = clBtnFace
    ParentColor = False
    TabOrder = 3
    OnClick = chB_APLICA_EMISORClick
  end
  object chB_APLICA_PROV: TCheckBox
    Tag = 18
    Left = 625
    Top = 57
    Width = 16
    Height = 21
    Color = clBtnFace
    ParentColor = False
    TabOrder = 10
    OnClick = chB_APLICA_PROVClick
  end
  object chB_APLICA_CESION: TCheckBox
    Tag = 18
    Left = 625
    Top = 79
    Width = 16
    Height = 21
    Color = clBtnFace
    ParentColor = False
    TabOrder = 14
    OnClick = chB_APLICA_CESIONClick
  end
  object chB_APLICA_FECHA: TCheckBox
    Tag = 17
    Left = 625
    Top = 109
    Width = 16
    Height = 21
    Color = clBtnFace
    ParentColor = False
    TabOrder = 19
    OnClick = chB_APLICA_FECHAClick
  end
  object chB_APLICA_IMPORTES: TCheckBox
    Tag = 17
    Left = 625
    Top = 157
    Width = 16
    Height = 21
    Color = clBtnFace
    ParentColor = False
    TabOrder = 27
    OnClick = chB_APLICA_IMPORTESClick
  end
  object edNOMBRE_CESION: TEdit
    Left = 204
    Top = 79
    Width = 413
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 13
  end
  object edNOMBRE_PROV: TEdit
    Left = 268
    Top = 57
    Width = 349
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 9
  end
  object edNOMB_EMISOR: TEdit
    Left = 204
    Top = 13
    Width = 413
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object BBBusca: TBitBtn
    Left = 505
    Top = 205
    Width = 137
    Height = 27
    HelpContext = 9001
    Caption = 'Inicia Búsqueda'
    TabOrder = 31
    OnClick = BBBuscaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
  end
  object sgcDATOS: TSGCtrl
    Left = 0
    Top = 247
    Width = 645
    Height = 150
    OnCalcRow = sgcDATOSCalcRow
    ShowTab = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    BevelOuter = bvNone
    TabOrder = 40
    PopupMenu = pmMODIFICA
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnDblClick = sgcDATOSDblClick
    object btAUTORIZA: TBitBtn
      Left = 206
      Top = 127
      Width = 135
      Height = 20
      BiDiMode = bdLeftToRight
      Caption = 'Autoriza remanentes'
      ParentBiDiMode = False
      TabOrder = 2
      OnClick = btAUTORIZAClick
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
    object btCANCELA: TBitBtn
      Left = 509
      Top = 127
      Width = 135
      Height = 20
      BiDiMode = bdLeftToRight
      Caption = 'Reversar remanentes'
      ParentBiDiMode = False
      TabOrder = 4
      OnClick = btCANCELAClick
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
    object btLIBERA: TBitBtn
      Left = 362
      Top = 127
      Width = 135
      Height = 20
      BiDiMode = bdLeftToRight
      Caption = 'Libera remanentes'
      ParentBiDiMode = False
      TabOrder = 3
      OnClick = btLIBERAClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
        333333333F777773FF333333008888800333333377333F3773F3333077870787
        7033333733337F33373F3308888707888803337F33337F33337F330777880887
        7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
        7703337F33377733337FB3088888888888033373FFFFFFFFFF733B3000000000
        0033333777777777773333BBBB3333080333333333F3337F7F33BBBB707BB308
        03333333373F337F7F3333BB08033308033333337F7F337F7F333B3B08033308
        033333337F73FF737F33B33B778000877333333373F777337333333B30888880
        33333333373FFFF73333333B3300000333333333337777733333}
      NumGlyphs = 2
    end
    object chAGRUP_TODOS: TCheckBox
      Tag = 17
      Left = 105
      Top = 128
      Width = 95
      Height = 17
      Caption = 'Agrupar Todos'
      TabOrder = 5
      OnClick = chAGRUP_TODOSClick
    end
  end
  object edTIT_DOCUMENTO: TEdit
    Left = 2
    Top = 234
    Width = 162
    Height = 13
    TabStop = False
    BorderStyle = bsNone
    Color = 12450043
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 32
    Text = '              No. DOCUMENTO'
  end
  object edTIT_TIPO: TEdit
    Left = 165
    Top = 234
    Width = 69
    Height = 13
    TabStop = False
    BorderStyle = bsNone
    Color = 12450043
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 33
    Text = ' TIPO'
  end
  object edTIT_IMPORTE: TEdit
    Left = 453
    Top = 234
    Width = 114
    Height = 13
    TabStop = False
    BorderStyle = bsNone
    Color = 12450043
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 37
    Text = '           IMPORTE'
  end
  object edTIT_SIT: TEdit
    Left = 568
    Top = 234
    Width = 30
    Height = 13
    TabStop = False
    BorderStyle = bsNone
    Color = 12450043
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 38
    Text = '  SIT'
  end
  object edTIT_AUT: TEdit
    Left = 599
    Top = 234
    Width = 44
    Height = 13
    TabStop = False
    BorderStyle = bsNone
    Color = 12450043
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 39
    Text = '    AUT'
  end
  object MErrores: TMemo
    Left = 0
    Top = 396
    Width = 645
    Height = 36
    TabStop = False
    Color = clInfoBk
    ScrollBars = ssVertical
    TabOrder = 41
  end
  object edTIT_FVALOR: TEdit
    Left = 309
    Top = 234
    Width = 71
    Height = 13
    TabStop = False
    BorderStyle = bsNone
    Color = 12450043
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 35
    Text = '     F VALOR'
  end
  object PnDatos: TPanel
    Left = -1
    Top = 433
    Width = 645
    Height = 22
    TabOrder = 42
    object lbEmpresa: TLabel
      Left = 11
      Top = 4
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
      Top = 11
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
      Top = 4
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
      Top = 11
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
      Top = 11
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
      Top = 11
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
      Top = 4
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
      Top = 4
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
  object edNOMBRE_EMISOR: TEdit
    Left = 180
    Top = 35
    Width = 437
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object edCVE_EMISOR_NAFINSA: TEdit
    Left = 106
    Top = 35
    Width = 73
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object edPROV_NAFINSA: TEdit
    Left = 204
    Top = 57
    Width = 63
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
  end
  object btEMISOR: TBitBtn
    Tag = 17
    Left = 181
    Top = 14
    Width = 22
    Height = 20
    HelpContext = 1002
    TabOrder = 1
    OnClick = btEMISORClick
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
  object btPROVEEDOR: TBitBtn
    Tag = 17
    Left = 181
    Top = 57
    Width = 22
    Height = 20
    TabOrder = 7
    OnClick = btPROVEEDORClick
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
  object btCESION: TBitBtn
    Tag = 17
    Left = 181
    Top = 79
    Width = 22
    Height = 20
    TabOrder = 12
    OnClick = btCESIONClick
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
  object edIMP_MINIMO: TInterEdit
    Tag = 17
    Left = 106
    Top = 156
    Width = 97
    Height = 21
    HelpContext = 1001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnEnter = edIMP_MINIMOEnter
    DisplayMask = '###,###,###,###0.00'
    MaxLength = 12
    Color = clMenu
    TabOrder = 25
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edIMP_MAXIMO: TInterEdit
    Tag = 17
    Left = 521
    Top = 156
    Width = 97
    Height = 21
    HelpContext = 1002
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnEnter = edIMP_MAXIMOEnter
    DisplayMask = '###,###,###,###0.00'
    MaxLength = 12
    Color = clMenu
    TabOrder = 26
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object rgTIPO: TRadioGroup
    Left = 0
    Top = 203
    Width = 500
    Height = 30
    Caption = 'Tipo'
    Columns = 4
    Items.Strings = (
      'Remanente'
      'Interés'
      'Comisión'
      'Todos')
    TabOrder = 29
    TabStop = True
    OnClick = rgTIPOClick
  end
  object edID_EMISOR: TEdit
    Tag = 512
    Left = 106
    Top = 14
    Width = 73
    Height = 21
    AutoSize = False
    CharCase = ecUpperCase
    Color = clWhite
    MaxLength = 4
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
  end
  object edID_PROVEEDOR: TEdit
    Tag = 512
    Left = 106
    Top = 57
    Width = 73
    Height = 21
    AutoSize = False
    CharCase = ecUpperCase
    Color = clWhite
    MaxLength = 4
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 6
  end
  object edID_CESION: TEdit
    Tag = 512
    Left = 106
    Top = 79
    Width = 73
    Height = 21
    AutoSize = False
    CharCase = ecUpperCase
    Color = clWhite
    MaxLength = 4
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 11
  end
  object edTIT_FPAGO: TEdit
    Left = 235
    Top = 234
    Width = 73
    Height = 13
    TabStop = False
    BorderStyle = bsNone
    Color = 12450043
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 34
    Text = '      F PAGO'
  end
  object edF_VAL_INICIAL: TEdit
    Tag = 17
    Left = 106
    Top = 133
    Width = 75
    Height = 21
    CharCase = ecUpperCase
    Color = clMenu
    ReadOnly = True
    TabOrder = 20
    OnExit = edF_VAL_INICIALExit
  end
  object dtpF_VAL_INICIAL: TInterDateTimePicker
    Tag = 17
    Left = 182
    Top = 133
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 37825.7332781018
    Time = 37825.7332781018
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 21
    OnChange = dtpF_VAL_INICIALChange
    OnEnter = dtpF_VAL_INICIALEnter
    OnExit = dtpF_VAL_INICIALExit
    Edit = edF_VAL_INICIAL
    Formato = dfDate
  end
  object edF_VAL_FINAL: TEdit
    Tag = 17
    Left = 521
    Top = 133
    Width = 75
    Height = 21
    CharCase = ecUpperCase
    Color = clMenu
    ReadOnly = True
    TabOrder = 22
    OnExit = edF_VAL_FINALExit
  end
  object dtpF_VAL_FINAL: TInterDateTimePicker
    Tag = 17
    Left = 598
    Top = 133
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 37825.7332781018
    Time = 37825.7332781018
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 23
    OnChange = dtpF_VAL_FINALChange
    OnEnter = dtpF_VAL_FINALEnter
    OnExit = dtpF_VAL_FINALExit
    Edit = edF_VAL_FINAL
    Formato = dfDate
  end
  object chB_APLICA_F_VAL: TCheckBox
    Tag = 17
    Left = 625
    Top = 133
    Width = 16
    Height = 21
    Color = clBtnFace
    ParentColor = False
    TabOrder = 24
    OnClick = chB_APLICA_F_VALClick
  end
  object edF_DEVOL: TEdit
    Left = 381
    Top = 234
    Width = 71
    Height = 13
    TabStop = False
    BorderStyle = bsNone
    Color = 12450043
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 36
    Text = '     F DEVOL'
  end
  object chB_MOVTO_EFECTIVO: TCheckBox
    Left = 504
    Top = 184
    Width = 135
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Afecta Movtos. Efectivo'
    Color = clBtnFace
    ParentColor = False
    TabOrder = 30
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
    Left = 396
    Top = 10
  end
  object ilCESION: TInterLinkit
    Control = edID_CESION
    OnEjecuta = ilCESIONEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 216
    Top = 83
  end
  object ilPROVEEDOR: TInterLinkit
    Control = edID_PROVEEDOR
    OnEjecuta = ilPROVEEDOREjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 216
    Top = 51
  end
  object ilEMISOR: TInterLinkit
    Control = edID_EMISOR
    OnEjecuta = ilEMISOREjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 216
    Top = 8
  end
  object pmMODIFICA: TPopupMenu
    Left = 296
    Top = 280
    object Modificar1: TMenuItem
      Caption = '&Modifica Doctos. Impagados'
      OnClick = Modificar1Click
    end
  end
end
