object WCrCciComis: TWCrCciComis
  Left = 324
  Top = 252
  Width = 782
  Height = 296
  Caption = 'Registro de Comisiones para CCI'
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
  object lbFH_ALTA: TLabel
    Left = 412
    Top = 180
    Width = 44
    Height = 26
    Caption = 'Fecha y Hora Alta'
    WordWrap = True
  end
  object lbID_CREDITO: TLabel
    Left = 10
    Top = 12
    Width = 142
    Height = 13
    Caption = 'Número Carta de Crédito (CCI)'
  end
  object lbCVE_COMISION: TLabel
    Left = 10
    Top = 43
    Width = 87
    Height = 13
    Caption = 'Clave de Comision'
  end
  object lbF_VENCIMIENTO: TLabel
    Left = 570
    Top = 128
    Width = 91
    Height = 13
    Caption = 'Fecha Vencimiento'
  end
  object lbF_APLICACION: TLabel
    Left = 570
    Top = 151
    Width = 73
    Height = 13
    Caption = 'Fecha de Pago'
  end
  object lbIMP_COMISION: TLabel
    Left = 10
    Top = 128
    Width = 62
    Height = 13
    Caption = 'Imp Comision'
  end
  object lbIMP_IVA: TLabel
    Left = 218
    Top = 128
    Width = 35
    Height = 13
    Caption = 'Imp Iva'
  end
  object lbIMP_COMIS_PAG: TLabel
    Left = 10
    Top = 152
    Width = 88
    Height = 13
    Caption = 'Imp Comis Pagado'
  end
  object lbIMP_IVA_PAG: TLabel
    Left = 218
    Top = 151
    Width = 75
    Height = 13
    Caption = 'Imp Iva Pagado'
  end
  object lbCVE_USU_MODIFICA: TLabel
    Left = 578
    Top = 179
    Width = 69
    Height = 26
    Caption = 'Clave Usuario Modifica'
    WordWrap = True
  end
  object lbPCT_COMISION: TLabel
    Left = 10
    Top = 92
    Width = 80
    Height = 26
    Caption = 'Porcentaje de la Comisión'
    WordWrap = True
  end
  object lbCVE_UNIDAD_TIEMP: TLabel
    Left = 10
    Top = 69
    Width = 58
    Height = 13
    Caption = 'Periodicidad'
  end
  object lbIMP_TOTAL_V: TLabel
    Left = 402
    Top = 130
    Width = 24
    Height = 13
    Caption = 'Total'
  end
  object lbIMP_TOTAL_PAG_V: TLabel
    Left = 403
    Top = 152
    Width = 64
    Height = 13
    Caption = 'Total Pagado'
  end
  object lbNUM_FACTURA: TLabel
    Left = 620
    Top = 5
    Width = 40
    Height = 26
    Caption = 'Número Factura'
    WordWrap = True
  end
  object edFH_ALTA: TEdit
    Left = 467
    Top = 182
    Width = 101
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 17
  end
  object edID_CREDITO: TEdit
    Left = 162
    Top = 8
    Width = 160
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 19
  end
  object edCVE_COMISION: TEdit
    Tag = 530
    Left = 107
    Top = 40
    Width = 101
    Height = 21
    HelpContext = 1100
    CharCase = ecUpperCase
    TabOrder = 1
    OnExit = edCVE_COMISIONExit
  end
  object dtpF_VENCIMIENTO: TInterDateTimePicker
    Tag = 530
    Left = 748
    Top = 126
    Width = 21
    Height = 21
    HelpContext = 1702
    CalAlignment = dtaLeft
    Date = 40122.3947419329
    Time = 40122.3947419329
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 11
    Edit = edF_VENCIMIENTO
    Formato = dfDate
  end
  object edF_VENCIMIENTO: TEdit
    Tag = 530
    Left = 665
    Top = 125
    Width = 81
    Height = 21
    HelpContext = 1701
    CharCase = ecUpperCase
    TabOrder = 10
    OnExit = edF_VENCIMIENTOExit
  end
  object dtpF_APLICACION: TInterDateTimePicker
    Tag = 530
    Left = 748
    Top = 149
    Width = 21
    Height = 21
    HelpContext = 1603
    CalAlignment = dtaLeft
    Date = 40122.3947419329
    Time = 40122.3947419329
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 15
    OnExit = edIMP_COMIS_PAGExit
    Edit = edF_APLICACION
    Formato = dfDate
  end
  object edF_APLICACION: TEdit
    Tag = 530
    Left = 665
    Top = 148
    Width = 81
    Height = 21
    HelpContext = 1802
    CharCase = ecUpperCase
    TabOrder = 14
    OnExit = edIMP_COMIS_PAGExit
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 666
    Top = 180
    Width = 101
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 18
  end
  object edIMP_COMISION: TInterEdit
    Tag = 530
    Left = 107
    Top = 125
    Width = 100
    Height = 20
    HelpContext = 1500
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_COMISIONExit
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 7
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edIMP_IVA: TInterEdit
    Tag = 530
    Left = 296
    Top = 124
    Width = 81
    Height = 20
    HelpContext = 1600
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_IVAExit
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 8
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object rgSIT_COMISION: TRadioGroup
    Tag = 530
    Left = 6
    Top = 172
    Width = 394
    Height = 35
    HelpContext = 1700
    Caption = 'Situación'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Por Pagar'
      'Liquidado'
      'Cancelado')
    TabOrder = 16
    TabStop = True
    OnExit = rgSIT_COMISIONExit
  end
  object MsgPanel: TPanel
    Left = 4
    Top = 215
    Width = 765
    Height = 19
    TabOrder = 20
  end
  object PnDatos: TPanel
    Left = 4
    Top = 235
    Width = 765
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
      Left = 300
      Top = 0
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
      Left = 316
      Top = 10
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
      Left = 364
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
      Left = 364
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
  object btCVE_COMISION: TBitBtn
    Tag = 530
    Left = 205
    Top = 40
    Width = 21
    Height = 21
    HelpContext = 1101
    TabOrder = 2
    OnClick = btCVE_COMISIONClick
    OnExit = edCVE_COMISIONExit
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
  object edDESC_COMISION: TEdit
    Left = 225
    Top = 39
    Width = 544
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 22
  end
  object edIMP_COMIS_PAG: TInterEdit
    Tag = 530
    Left = 106
    Top = 147
    Width = 100
    Height = 20
    HelpContext = 1800
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_COMIS_PAGExit
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 12
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edIMP_IVA_PAG: TInterEdit
    Tag = 530
    Left = 296
    Top = 146
    Width = 100
    Height = 20
    HelpContext = 1801
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_COMIS_PAGExit
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 13
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object rgCVE_TIPO_COBRO: TRadioGroup
    Tag = 530
    Left = 215
    Top = 87
    Width = 553
    Height = 32
    HelpContext = 1400
    Caption = 'Forma de Cobro de la Comision'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Anticipado'
      'Al Vencimiento')
    TabOrder = 6
    TabStop = True
    OnClick = rgCVE_TIPO_COBROClick
    OnExit = rgCVE_TIPO_COBROExit
  end
  object edCVE_UNIDAD_TIEMP: TEdit
    Tag = 530
    Left = 107
    Top = 63
    Width = 100
    Height = 21
    HelpContext = 1200
    CharCase = ecUpperCase
    TabOrder = 3
    OnExit = edCVE_UNIDAD_TIEMPExit
  end
  object btCVE_UNIDAD_TIEMP: TBitBtn
    Tag = 530
    Left = 205
    Top = 63
    Width = 21
    Height = 21
    HelpContext = 1201
    TabOrder = 4
    OnClick = btCVE_UNIDAD_TIEMPClick
    OnExit = edCVE_UNIDAD_TIEMPExit
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
  object edDESC_UNIDAD_TIEMP: TEdit
    Left = 225
    Top = 62
    Width = 544
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 23
  end
  object edPCT_COMISION: TInterEdit
    Tag = 530
    Left = 107
    Top = 95
    Width = 100
    Height = 20
    HelpContext = 1300
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_COMISIONExit
    DisplayMask = '###,###,###,###,##0.0000'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 5
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object btnIVA: TButton
    Left = 377
    Top = 126
    Width = 20
    Height = 20
    HelpContext = 1601
    Caption = 'IVA'
    TabOrder = 9
    OnClick = btnIVAClick
    OnExit = btnIVAExit
  end
  object edIMP_TOTAL_V: TInterEdit
    Left = 470
    Top = 124
    Width = 98
    Height = 20
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_IVAExit
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 12
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 24
    ReadOnly = True
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edIMP_TOTAL_PAG_V: TInterEdit
    Left = 470
    Top = 147
    Width = 98
    Height = 20
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_IVAExit
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 12
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 25
    ReadOnly = True
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edNUM_FACTURA: TEdit
    Tag = 18
    Left = 665
    Top = 7
    Width = 102
    Height = 21
    HelpContext = 1000
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 0
    OnExit = edNUM_FACTURAExit
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
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
    Left = 705
    Top = 216
  end
  object ilCVE_COMISION: TInterLinkit
    Control = edCVE_COMISION
    OnEjecuta = ilCVE_COMISIONEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCVE_COMISIONCapture
    Left = 232
    Top = 34
  end
  object ilCVE_UNIDAD_TIEMP: TInterLinkit
    Control = edCVE_UNIDAD_TIEMP
    OnEjecuta = ilCVE_UNIDAD_TIEMPEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCVE_COMISIONCapture
    Left = 266
    Top = 61
  end
end
