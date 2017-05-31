object WCrCdQtQbC: TWCrCdQtQbC
  Left = 113
  Top = 50
  Width = 629
  Height = 646
  ActiveControl = edValorFiltro
  Caption = 'Condonaciones, Quitas, Quebrantos y Castigos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbFiltro: TLabel
    Left = 5
    Top = 6
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
  object bvSeparador: TBevel
    Left = 5
    Top = 74
    Width = 596
    Height = 5
    Shape = bsFrame
    Style = bsRaised
  end
  object lbComentarios: TLabel
    Left = 8
    Top = 474
    Width = 60
    Height = 14
    Caption = 'Comentarios'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object edValorFiltro: TEdit
    Tag = 512
    Left = 65
    Top = 3
    Width = 70
    Height = 21
    Hint = 'Es el número con el que se identifica como única la operación'
    HelpContext = 1005
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnExit = edValorFiltroExit
  end
  object btBUSCA: TBitBtn
    Left = 566
    Top = 1
    Width = 35
    Height = 25
    HelpContext = 9001
    TabOrder = 4
    OnClick = btBUSCAClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
  end
  object btnFiltro: TBitBtn
    Tag = 17
    Left = 140
    Top = 4
    Width = 22
    Height = 20
    HelpContext = 1006
    TabOrder = 1
    OnClick = btnFiltroClick
    OnExit = edValorFiltroExit
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
  object rgAcreditado: TGroupBox
    Left = 165
    Top = -2
    Width = 372
    Height = 30
    TabOrder = 2
    object lbDESC_ACREDITADO: TLabel
      Left = 5
      Top = 10
      Width = 364
      Height = 13
      AutoSize = False
      Caption = '+-- NOMBRE DEL ACREDITADO --+'
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
  object cbFiltro: TCheckBox
    Left = 544
    Top = 5
    Width = 15
    Height = 17
    TabOrder = 3
    OnClick = cbFiltroClick
  end
  object gbInfGral: TGroupBox
    Left = 5
    Top = 82
    Width = 430
    Height = 105
    Caption = 'Información General'
    TabOrder = 5
    TabStop = True
    object lbID_CONTRATO: TLabel
      Left = 4
      Top = 19
      Width = 58
      Height = 13
      Caption = 'Autorización'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbADEUDO_TOTAL: TLabel
      Left = 220
      Top = 40
      Width = 64
      Height = 13
      Caption = 'Adeudo Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbDESC_MONEDA: TLabel
      Left = 220
      Top = 19
      Width = 39
      Height = 13
      Caption = 'Moneda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbSDO_INSOLUTO: TLabel
      Left = 4
      Top = 39
      Width = 67
      Height = 14
      Caption = 'Saldo Vigente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbF_INICIO: TLabel
      Left = 4
      Top = 61
      Width = 37
      Height = 13
      Caption = 'F. Inicio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbF_VENCIMIENTO: TLabel
      Left = 220
      Top = 60
      Width = 69
      Height = 14
      Caption = 'F. Vencimiento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbDESC_C_PRODUCTO: TLabel
      Left = 4
      Top = 83
      Width = 43
      Height = 13
      Caption = 'Producto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edID_CONTRATO: TEdit
      Left = 80
      Top = 15
      Width = 100
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '330008494'
    end
    object edADEUDO_TOTAL: TEdit
      Left = 320
      Top = 36
      Width = 100
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '999999'
      OnChange = edSDO_VIG_TOTALChange
    end
    object edDESC_MONEDA: TEdit
      Left = 320
      Top = 15
      Width = 100
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = 'PESO MEXICANO'
    end
    object edSDO_VIG_TOTAL: TEdit
      Left = 80
      Top = 36
      Width = 100
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '1,000,500.00'
      OnChange = edSDO_VIG_TOTALChange
    end
    object edF_INICIO: TEdit
      Left = 80
      Top = 57
      Width = 100
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '01/01/2005'
    end
    object edF_VENCIMIENTO: TEdit
      Left = 320
      Top = 57
      Width = 100
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = '31/01/2005'
    end
    object edDESC_L_PRODUCTO: TEdit
      Left = 80
      Top = 79
      Width = 340
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Text = 'AGR AVIO/COM C/G C/CAPITALIZ'
    end
  end
  object gbNvoImporte: TGroupBox
    Left = 5
    Top = 190
    Width = 596
    Height = 145
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    TabStop = True
    object lbIMP_CAPITALIZA: TLabel
      Left = 5
      Top = 73
      Width = 71
      Height = 13
      Caption = 'Financiamiento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbIMP_CAPITAL: TLabel
      Left = 5
      Top = 96
      Width = 32
      Height = 13
      Caption = 'Capital'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbIMP_INTERES: TLabel
      Left = 5
      Top = 50
      Width = 32
      Height = 13
      Caption = 'Interés'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbIMP_COMISION: TLabel
      Left = 5
      Top = 27
      Width = 51
      Height = 13
      Caption = 'Conceptos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbIMP_TOTAL: TLabel
      Left = 5
      Top = 123
      Width = 24
      Height = 13
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbIMP_BASE: TLabel
      Left = 130
      Top = 8
      Width = 62
      Height = 13
      Caption = 'Importe Base'
    end
    object lbPCT_IMP_APLICAR: TLabel
      Left = 352
      Top = 8
      Width = 52
      Height = 13
      Caption = '% a Aplicar'
    end
    object lbIMP_APLICAR: TLabel
      Left = 490
      Top = 8
      Width = 78
      Height = 13
      Caption = 'Importe x Aplicar'
    end
    object lbPCT_IMP_COMISION: TLabel
      Left = 437
      Top = 27
      Width = 8
      Height = 13
      Caption = '%'
    end
    object lbPCT_IMP_INTERES: TLabel
      Left = 437
      Top = 50
      Width = 8
      Height = 13
      Caption = '%'
    end
    object lbPCT_IMP_CAPITALIZA: TLabel
      Left = 437
      Top = 73
      Width = 8
      Height = 13
      Caption = '%'
    end
    object lbPCT_IMP_CAPITAL: TLabel
      Left = 437
      Top = 96
      Width = 8
      Height = 13
      Caption = '%'
    end
    object lbIMP_BASE_MORA: TLabel
      Left = 253
      Top = 8
      Width = 49
      Height = 13
      Caption = 'Moratorios'
    end
    object Bevel1: TBevel
      Left = 113
      Top = 113
      Width = 101
      Height = 3
      Shape = bsFrame
      Style = bsRaised
    end
    object Bevel2: TBevel
      Left = 223
      Top = 113
      Width = 101
      Height = 3
      Shape = bsFrame
      Style = bsRaised
    end
    object Bevel3: TBevel
      Left = 339
      Top = 113
      Width = 75
      Height = 3
      Shape = bsFrame
      Style = bsRaised
    end
    object Bevel4: TBevel
      Left = 475
      Top = 113
      Width = 112
      Height = 3
      Shape = bsFrame
      Style = bsRaised
    end
    object edIMP_COMISION: TInterEdit
      Tag = 50
      Left = 120
      Top = 23
      Width = 85
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edPCT_COMISIONEnter
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 0
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edPCT_COMISION: TInterEdit
      Left = 343
      Top = 23
      Width = 65
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edPCT_COMISIONEnter
      OnExit = edPCT_COMISIONExit
      OnKeyPress = edGenericKeyPress
      DisplayMask = '###,###,###,###,##0.0000'
      MaxLength = 12
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 2
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_PCT_COMISION: TInterEdit
      Left = 481
      Top = 23
      Width = 100
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edIMP_PCT_COMISIONEnter
      OnExit = edIMP_PCT_COMISIONExit
      OnKeyPress = edGenericKeyPress
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 3
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_INTERES: TInterEdit
      Tag = 50
      Left = 120
      Top = 46
      Width = 85
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edPCT_INTERESEnter
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 4
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edPCT_INTERES: TInterEdit
      Left = 343
      Top = 46
      Width = 65
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edPCT_INTERESEnter
      OnExit = edPCT_INTERESExit
      OnKeyPress = edGenericKeyPress
      DisplayMask = '###,###,###,###,##0.0000'
      MaxLength = 12
      Font.Charset = TURKISH_CHARSET
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
    object edIMP_PCT_INTERES: TInterEdit
      Left = 481
      Top = 46
      Width = 100
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edIMP_PCT_INTERESEnter
      OnExit = edIMP_PCT_INTERESExit
      OnKeyPress = edGenericKeyPress
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Font.Charset = TURKISH_CHARSET
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
    object edIMP_CAPITALIZA: TInterEdit
      Tag = 50
      Left = 120
      Top = 69
      Width = 85
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edPCT_CAPITALIZAEnter
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = TURKISH_CHARSET
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
    object edPCT_CAPITALIZA: TInterEdit
      Left = 343
      Top = 69
      Width = 65
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edPCT_CAPITALIZAEnter
      OnExit = edPCT_CAPITALIZAExit
      OnKeyPress = edGenericKeyPress
      DisplayMask = '###,###,###,###,##0.0000'
      MaxLength = 12
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 10
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_PCT_CAPITALIZA: TInterEdit
      Left = 481
      Top = 69
      Width = 100
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edIMP_PCT_CAPITALIZAEnter
      OnExit = edIMP_PCT_CAPITALIZAExit
      OnKeyPress = edGenericKeyPress
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 11
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_CAPITAL: TInterEdit
      Tag = 50
      Left = 120
      Top = 92
      Width = 85
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edPCT_CAPITALEnter
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 12
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edPCT_CAPITAL: TInterEdit
      Left = 343
      Top = 92
      Width = 65
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edPCT_CAPITALEnter
      OnExit = edPCT_CAPITALExit
      OnKeyPress = edGenericKeyPress
      DisplayMask = '###,###,###,###,##0.0000'
      MaxLength = 12
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 14
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_PCT_CAPITAL: TInterEdit
      Left = 481
      Top = 92
      Width = 100
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edIMP_PCT_CAPITALEnter
      OnExit = edIMP_PCT_CAPITALExit
      OnKeyPress = edGenericKeyPress
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 15
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_TOTAL: TInterEdit
      Tag = 50
      Left = 120
      Top = 119
      Width = 85
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 16
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_PCT_TOTAL: TInterEdit
      Left = 480
      Top = 119
      Width = 100
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 19
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edPCT_TOTAL: TInterEdit
      Left = 343
      Top = 119
      Width = 65
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edPCT_TOTALEnter
      OnExit = edPCT_TOTALExit
      OnKeyPress = edGenericKeyPress
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 18
      UseReType = False
      UseSep = True
      UseDisplay = True
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_M_COMISION: TInterEdit
      Tag = 50
      Left = 232
      Top = 23
      Width = 85
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edPCT_COMISIONEnter
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 1
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_M_INTERES: TInterEdit
      Tag = 50
      Left = 232
      Top = 46
      Width = 85
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edPCT_INTERESEnter
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = TURKISH_CHARSET
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
    object edIMP_M_CAPITALIZA: TInterEdit
      Tag = 50
      Left = 232
      Top = 69
      Width = 85
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edPCT_CAPITALIZAEnter
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 9
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_M_CAPITAL: TInterEdit
      Tag = 50
      Left = 232
      Top = 92
      Width = 85
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edPCT_CAPITALEnter
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = TURKISH_CHARSET
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
    object edIMP_M_TOTAL: TInterEdit
      Tag = 50
      Left = 232
      Top = 119
      Width = 85
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = TURKISH_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 17
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object rgTIPO_MOVIMIENTO: TRadioGroup
    Left = 5
    Top = 29
    Width = 430
    Height = 44
    Caption = 'Tipo de Movimiento'
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'Condona'
      'Quita'
      'Quebranto'
      'Castigo'
      'Dación en Pago'
      'Adjudicación')
    TabOrder = 7
    OnClick = rgTIPO_MOVIMIENTOClick
  end
  object MErrores: TMemo
    Left = 6
    Top = 539
    Width = 595
    Height = 41
    TabStop = False
    Color = clInfoBk
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 8
    OnDblClick = MErroresDblClick
  end
  object PnDatos: TPanel
    Left = 7
    Top = 581
    Width = 594
    Height = 21
    TabOrder = 9
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
      Left = 384
      Top = 10
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
      Left = 384
      Top = 1
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
      Left = 59
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
      Left = 440
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
      Left = 440
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
      Left = 59
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
  object btnCobra: TBitBtn
    Left = 431
    Top = 512
    Width = 170
    Height = 25
    Caption = 'Aplica Movimiento'
    TabOrder = 10
    OnClick = btnCobraClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
      44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
      00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
      33833F333383F33300003333AA463362A433333333383F333833F33300003333
      6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
      33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
      6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
      000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
      333383333333F3330000333333322AAA4333333333333833333F333300003333
      333322A4333333333333338333F333330000333333344A433333333333333338
      3F333333000033333336A24333333333333333833F333333000033333336AA43
      33333333333333833F3333330000333333336663333333333333333888333333
      0000}
    NumGlyphs = 2
  end
  object mTxNota: TMemo
    Left = 72
    Top = 475
    Width = 529
    Height = 33
    TabStop = False
    ScrollBars = ssVertical
    TabOrder = 11
  end
  object btCOBRANZA: TBitBtn
    Left = 72
    Top = 512
    Width = 171
    Height = 25
    Caption = 'Cobranza de Disposiciones'
    TabOrder = 12
    OnClick = btCOBRANZAClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
      0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
      00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
      00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
      F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
      F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
      FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
      0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
      00337777FFFF77FF7733EEEE0000000003337777777777777333}
    NumGlyphs = 2
  end
  object rgParametros: TGroupBox
    Left = 440
    Top = 106
    Width = 161
    Height = 81
    Caption = 'Paramétros'
    TabOrder = 13
    TabStop = True
    object lbF_VALOR: TLabel
      Left = 8
      Top = 22
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
    object idtF_VALOR: TInterDateTimePicker
      Tag = 17
      Left = 128
      Top = 20
      Width = 19
      Height = 19
      CalAlignment = dtaLeft
      Date = 37825.7332781018
      Time = 37825.7332781018
      Color = clBtnFace
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      OnEnter = edF_VALOREnter
      OnExit = edF_VALORExit
      Edit = edF_VALOR
      Formato = dfDate
    end
    object edF_VALOR: TEdit
      Left = 54
      Top = 23
      Width = 70
      Height = 13
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnEnter = edF_VALOREnter
      OnExit = edF_VALORExit
      OnKeyPress = edF_VALORKeyPress
    end
  end
  object btCANCELA: TBitBtn
    Left = 252
    Top = 512
    Width = 170
    Height = 25
    Caption = 'Cancela Movimiento'
    TabOrder = 14
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
  object rgTIPO_APLICACION: TRadioGroup
    Left = 440
    Top = 29
    Width = 161
    Height = 44
    Caption = 'Tipo de Aplicación'
    Columns = 2
    Items.Strings = (
      'Global'
      'Por Período')
    TabOrder = 15
    OnClick = rgTIPO_APLICACIONClick
  end
  object sagDATOS: TStringAlignGrid
    Left = 5
    Top = 357
    Width = 596
    Height = 97
    ColCount = 40
    DefaultRowHeight = 17
    FixedCols = 0
    FixedRows = 0
    ScrollBars = ssVertical
    TabOrder = 16
    OnSelectCell = sagDATOSSelectCell
    OnTopLeftChanged = sagDATOSTopLeftChanged
    ColWidths = (
      54
      70
      80
      80
      93
      97
      96
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64)
    PropCell = ()
    PropCol = ()
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = ()
  end
  object pnlDetalle: TPanel
    Left = 5
    Top = 340
    Width = 596
    Height = 18
    BevelOuter = bvNone
    Color = clBlack
    Enabled = False
    TabOrder = 17
    object edTitTotal: TEdit
      Left = 482
      Top = 1
      Width = 95
      Height = 16
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
      TabOrder = 0
      Text = '        Total'
    end
    object edTitImpCap: TEdit
      Left = 384
      Top = 1
      Width = 97
      Height = 16
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
      TabOrder = 1
      Text = '         Capital'
    end
    object edTitFinAdic: TEdit
      Left = 290
      Top = 1
      Width = 93
      Height = 16
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
      TabOrder = 2
      Text = '     Financiamiento'
    end
    object edTitInt: TEdit
      Left = 209
      Top = 1
      Width = 80
      Height = 16
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
      TabOrder = 3
      Text = '        Interés'
    end
    object edTitCon: TEdit
      Left = 128
      Top = 1
      Width = 80
      Height = 16
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
      TabOrder = 4
      Text = '      Conceptos'
    end
    object edTitFVentto: TEdit
      Left = 57
      Top = 1
      Width = 70
      Height = 16
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
      TabOrder = 5
      Text = '    F. Ventto'
    end
    object edTitDocto: TEdit
      Left = 1
      Top = 1
      Width = 55
      Height = 16
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
      TabOrder = 6
      Text = 'Per/Docto'
    end
    object edTitSBar: TEdit
      Left = 578
      Top = 1
      Width = 17
      Height = 16
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
      TabOrder = 7
      Text = '        Total'
    end
  end
  object cbB_TODOS_PERIODOS: TCheckBox
    Left = 440
    Top = 87
    Width = 161
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Considera todos los períodos'
    TabOrder = 18
    OnClick = cbB_TODOS_PERIODOSClick
  end
  object cbSelecciona: TCheckBox
    Left = 504
    Top = 458
    Width = 97
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Selecciona'
    TabOrder = 19
    OnClick = cbSeleccionaClick
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
    Left = 466
    Top = 2
  end
  object ikValorFiltro: TInterLinkit
    Control = edValorFiltro
    OnEjecuta = ikValorFiltroEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    Left = 216
    Top = 8
  end
end
