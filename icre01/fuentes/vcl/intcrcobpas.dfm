object WCrCobPas: TWCrCobPas
  Left = 97
  Top = 148
  Width = 760
  Height = 524
  Caption = 'Liquidación de Disposiciones Pasivas'
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
  object sbLogCobranza: TSpeedButton
    Left = 544
    Top = 421
    Width = 5
    Height = 5
    OnClick = sbLogCobranzaClick
  end
  object bvSeparador: TBevel
    Left = 0
    Top = 76
    Width = 720
    Height = 5
    Shape = bsFrame
    Style = bsRaised
  end
  object lbCveInstitucion: TLabel
    Left = 5
    Top = 28
    Width = 48
    Height = 13
    Caption = 'Institución'
  end
  object lbCvePrograma: TLabel
    Left = 5
    Top = 49
    Width = 93
    Height = 13
    Caption = 'Programa de Apoyo'
  end
  object lbIdCredito: TLabel
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
  object lbDocto: TLabel
    Left = 300
    Top = 152
    Width = 47
    Height = 16
    Caption = 'lbDocto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object sagDATOS: TStringAlignGrid
    Left = 0
    Top = 246
    Width = 721
    Height = 169
    ColCount = 90
    DefaultRowHeight = 17
    FixedCols = 0
    FixedRows = 0
    ScrollBars = ssVertical
    TabOrder = 7
    OnDrawCell = sagDATOSDrawCell
    OnMouseDown = sagDATOSMouseDown
    OnSelectCell = sagDATOSSelectCell
    ColWidths = (
      16
      43
      105
      62
      62
      85
      85
      85
      85
      80
      14
      12
      11
      13
      12
      12
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
  object cbB_COB_ORD_PER: TCheckBox
    Tag = 17
    Left = 478
    Top = 434
    Width = 15
    Height = 17
    TabStop = False
    Color = clBtnFace
    Enabled = False
    ParentColor = False
    TabOrder = 4
    Visible = False
  end
  object btnCobra: TButton
    Left = 546
    Top = 436
    Width = 175
    Height = 20
    Caption = 'cobra'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnCobraClick
  end
  object PnDatos: TPanel
    Left = 0
    Top = 458
    Width = 545
    Height = 21
    TabOrder = 6
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
  object cbSeleccion: TCheckBox
    Tag = 17
    Left = 570
    Top = 416
    Width = 151
    Height = 15
    Alignment = taLeftJustify
    Caption = 'cobrar todos'
    TabOrder = 3
    Visible = False
    OnClick = cbSeleccionClick
  end
  object MErrores: TMemo
    Left = 0
    Top = 416
    Width = 545
    Height = 40
    TabStop = False
    Color = clInfoBk
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
    OnDblClick = MErroresDblClick
  end
  object pnColumnas: TPanel
    Left = 0
    Top = 229
    Width = 720
    Height = 18
    BevelOuter = bvNone
    Color = clBlack
    Enabled = False
    TabOrder = 1
    object edTitDocto: TEdit
      Left = 63
      Top = 1
      Width = 105
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
      Text = '        Documento'
    end
    object edTitFVentto: TEdit
      Left = 169
      Top = 1
      Width = 62
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
      Text = '    F. Ventto'
    end
    object edTitSEL: TEdit
      Left = 1
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
      TabOrder = 2
      Text = 'SEL'
    end
    object edTitDisp: TEdit
      Left = 19
      Top = 1
      Width = 43
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
      Text = '  Disp.'
    end
    object edTitInt: TEdit
      Left = 467
      Top = 1
      Width = 85
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
      Text = '         Interés'
    end
    object edTitTotal: TEdit
      Left = 639
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
      TabOrder = 5
      Text = '        Total'
    end
    object edTitImpCap: TEdit
      Left = 295
      Top = 1
      Width = 85
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
      Text = '        Capital'
    end
    object edTitComis: TEdit
      Left = 553
      Top = 1
      Width = 85
      Height = 16
      TabStop = False
      BorderStyle = bsNone
      Color = 12450043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      Text = '      Conceptos'
    end
    object edTitFOper: TEdit
      Left = 232
      Top = 1
      Width = 62
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
      TabOrder = 8
      Text = '   F. Oper.'
    end
    object edTitFinAdic: TEdit
      Left = 381
      Top = 1
      Width = 85
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
      TabOrder = 9
      Text = '       Fin. Adic.'
    end
  end
  object rgImporte: TGroupBox
    Left = 508
    Top = 89
    Width = 213
    Height = 140
    Caption = 'Importe'
    TabOrder = 8
    TabStop = True
    object lbCobra: TLabel
      Left = 155
      Top = 0
      Width = 33
      Height = 14
      Caption = 'Cobrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbTotal: TLabel
      Left = 16
      Top = 115
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
    object lbNumPerCom: TLabel
      Left = 69
      Top = 20
      Width = 18
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '2'
    end
    object lbNumPerInt: TLabel
      Left = 69
      Top = 44
      Width = 18
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '3'
    end
    object lbNumPerCap: TLabel
      Left = 69
      Top = 92
      Width = 18
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '1'
    end
    object lbNumPerFin: TLabel
      Left = 69
      Top = 68
      Width = 18
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '1'
    end
    object edCAPITAL: TInterEdit
      Left = 95
      Top = 88
      Width = 95
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,###,##0.00'
      MaxLength = 50
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 10
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edINTERES: TInterEdit
      Left = 95
      Top = 40
      Width = 95
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,###,##0.00'
      MaxLength = 50
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 4
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edCONCEPTOS: TInterEdit
      Left = 95
      Top = 16
      Width = 95
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,###,##0.00'
      MaxLength = 50
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 1
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object btCAPITAL: TBitBtn
      Left = 6
      Top = 88
      Width = 60
      Height = 21
      Hint = 'Muestra catálogo de capital'
      Caption = 'Capital'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = btCAPITALClick
    end
    object btINTERES: TBitBtn
      Left = 6
      Top = 40
      Width = 60
      Height = 21
      Hint = 'Muestra catálogo de interés'
      Caption = 'Interés'
      TabOrder = 3
      OnClick = btINTERESClick
    end
    object btCONCEPTOS: TBitBtn
      Left = 6
      Top = 16
      Width = 60
      Height = 21
      Hint = 'Muestra catálogo de conceptos'
      Caption = 'Conceptos'
      TabOrder = 0
      OnClick = btCONCEPTOSClick
    end
    object edTOTAL: TInterEdit
      Left = 95
      Top = 112
      Width = 95
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,###,##0.00'
      MaxLength = 50
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 13
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object cbCONCEPTOS: TCheckBox
      Tag = 17
      Left = 195
      Top = 18
      Width = 13
      Height = 17
      TabOrder = 2
      OnClick = cbSeleccionClick
    end
    object cbINTERES: TCheckBox
      Tag = 17
      Left = 195
      Top = 42
      Width = 15
      Height = 17
      TabOrder = 5
      OnClick = cbSeleccionClick
    end
    object cbCAPITAL: TCheckBox
      Tag = 17
      Left = 195
      Top = 88
      Width = 15
      Height = 19
      TabOrder = 11
      OnClick = cbSeleccionClick
    end
    object cbTotal: TCheckBox
      Tag = 17
      Left = 195
      Top = 114
      Width = 13
      Height = 17
      TabOrder = 12
      OnClick = cbSeleccionClick
    end
    object btFinAdic: TBitBtn
      Left = 6
      Top = 64
      Width = 60
      Height = 21
      Hint = 'Muestra catálogo de interés'
      Caption = 'F Adicional'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = btFinAdicClick
    end
    object edFinAdic: TInterEdit
      Left = 95
      Top = 64
      Width = 95
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,###,##0.00'
      MaxLength = 50
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TabOrder = 7
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object cbFinAdic: TCheckBox
      Tag = 17
      Left = 195
      Top = 66
      Width = 15
      Height = 17
      TabOrder = 8
      OnClick = cbSeleccionClick
    end
  end
  object btBUSCA: TBitBtn
    Left = 686
    Top = 3
    Width = 35
    Height = 25
    HelpContext = 9001
    TabOrder = 9
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
  object pnlMsgs: TPanel
    Left = 546
    Top = 458
    Width = 175
    Height = 21
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object edCVE_FND_ENT_DES: TEdit
    Tag = 562
    Left = 105
    Top = 24
    Width = 75
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    TabOrder = 11
  end
  object edNOM_FND_ENT_DES: TEdit
    Left = 205
    Top = 24
    Width = 480
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 12
  end
  object edNOM_FND_PROGRAMA: TEdit
    Left = 205
    Top = 45
    Width = 480
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 13
  end
  object edCVE_FND_PROGRAMA: TEdit
    Tag = 562
    Left = 105
    Top = 45
    Width = 75
    Height = 21
    HelpContext = 1101
    CharCase = ecUpperCase
    TabOrder = 14
  end
  object edID_CREDITO_PAS: TEdit
    Tag = 512
    Left = 105
    Top = 3
    Width = 75
    Height = 21
    Hint = 'Es el número con el que se identifica como única la operación'
    HelpContext = 1005
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object btID_CREDITO_PAS: TBitBtn
    Tag = 17
    Left = 182
    Top = 4
    Width = 22
    Height = 20
    HelpContext = 1006
    TabOrder = 15
    OnClick = btID_CREDITO_PASClick
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
    Left = 205
    Top = 3
    Width = 480
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 16
  end
  object gbInfGral: TGroupBox
    Left = 5
    Top = 83
    Width = 290
    Height = 142
    Caption = 'Información general'
    TabOrder = 17
    TabStop = True
    object lbIdContrato: TLabel
      Left = 4
      Top = 15
      Width = 58
      Height = 13
      Caption = 'Autorización'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnDblClick = btID_CONTRATOClick
    end
    object lbCveMoneda: TLabel
      Left = 150
      Top = 15
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
    object lbSdoVigTotal: TLabel
      Left = 6
      Top = 65
      Width = 50
      Height = 14
      Caption = 'S. Insoluto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbFInicio: TLabel
      Left = 148
      Top = 42
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
    object lbPlazo: TLabel
      Left = 148
      Top = 65
      Width = 26
      Height = 14
      Caption = 'Plazo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbCveProducto: TLabel
      Left = 4
      Top = 114
      Width = 43
      Height = 13
      Caption = 'Producto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnDblClick = btProductoClick
    end
    object ldSdoInicial: TLabel
      Left = 4
      Top = 41
      Width = 39
      Height = 14
      Caption = 'S. Inicial'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbFVencto: TLabel
      Left = 148
      Top = 89
      Width = 42
      Height = 14
      Caption = 'F. Ventto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbPctRedescto: TLabel
      Left = 6
      Top = 89
      Width = 59
      Height = 14
      Caption = '% Redescto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object edID_CONTRATO_PAS: TEdit
      Left = 65
      Top = 15
      Width = 75
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '330008494'
      OnDblClick = btID_CONTRATOClick
    end
    object edDESC_MONEDA_PAS: TEdit
      Left = 210
      Top = 15
      Width = 75
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'PESO MEXICANO'
    end
    object edSDO_VIG_TOTAL_PAS: TEdit
      Left = 65
      Top = 62
      Width = 75
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '123,456,789.00'
      OnChange = edIMPORTE_TEXTChange
      OnDblClick = btDISPOCISIONClick
    end
    object edF_INICIO_PAS: TEdit
      Left = 210
      Top = 38
      Width = 75
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = '01/01/2005'
      OnDblClick = btDISPOCISIONClick
    end
    object edDIAS_PLAZO_PAS: TEdit
      Left = 210
      Top = 62
      Width = 75
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Text = '31/01/2005'
      OnDblClick = btDISPOCISIONClick
    end
    object edDESC_C_PRODUCTO_PAS: TEdit
      Left = 65
      Top = 114
      Width = 220
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      Text = 'AGR AVIO/COM C/G C/CAPITALIZ'
      OnDblClick = btProductoClick
    end
    object edIMP_REDESCONTADO_PAS: TEdit
      Left = 65
      Top = 38
      Width = 75
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '123,456,789.00'
      OnChange = edIMPORTE_TEXTChange
      OnDblClick = btDISPOCISIONClick
    end
    object edF_VENCIMIENTO_PAS: TEdit
      Left = 210
      Top = 86
      Width = 75
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Text = '31/01/2005'
      OnDblClick = btDISPOCISIONClick
    end
    object edPCT_REDESCONTADO_PAS: TEdit
      Left = 65
      Top = 86
      Width = 75
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '123,456,789.00'
      OnChange = edIMPORTE_TEXTChange
      OnDblClick = btDISPOCISIONClick
    end
  end
  object gbParametros: TGroupBox
    Left = 300
    Top = 83
    Width = 205
    Height = 54
    Caption = 'Parámetros'
    Enabled = False
    TabOrder = 18
    TabStop = True
    object lbF_VALOR: TLabel
      Left = 4
      Top = 24
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
    object SpeedButton1: TSpeedButton
      Left = 159
      Top = 21
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
    object edFECHA: TEdit
      Tag = 17
      Left = 76
      Top = 20
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
      OnEnter = edFECHAEnter
      OnExit = edFECHAExit
      OnKeyPress = edFECHAKeyPress
    end
    object dtFECHA: TInterDateTimePicker
      Tag = 17
      Left = 139
      Top = 20
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
      OnEnter = edFECHAEnter
      OnExit = dtFECHAExit
      Edit = edFECHA
      Formato = dfDate
    end
  end
  object ilCVE_FND_ENT_DES: TInterLinkit
    Control = edCVE_FND_ENT_DES
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 581
    Top = 20
  end
  object ilCVE_FND_PROGRAMA: TInterLinkit
    Control = edCVE_FND_PROGRAMA
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 581
    Top = 44
  end
  object ilID_CREDITO_PAS: TInterLinkit
    Control = edID_CREDITO_PAS
    OnEjecuta = ilID_CREDITO_PASEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    Left = 576
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
    Left = 122
    Top = 362
  end
  object ImageList: TImageList
    BlendColor = clWhite
    BkColor = clWhite
    Masked = False
    Left = 88
    Top = 350
    Bitmap = {
      494C010103000400040010001000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00000000000000
      0000FFFFFF00000000000000000000000000FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636B7300636B7300636B7300636B
      7300636B7300636B7300636B7300636B7300636B7300636B7300E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700636B7300636B7300636B7300636B
      7300636B7300636B7300636B7300636B7300636B7300636B7300E7EFF700E7EF
      F700E7EFF700E7EFF700E7EFF700E7EFF700FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000FFFF000000000000FFFF0000
      00000000FFFF000000000000FFFF000000000000FFFF000000000000FFFF0000
      7FC07FC0FFFF00007FC077C0FFFF00007FC063C0FFFF00007FC041C0FFFF0000
      7FC048C0FFFF00007FC05C40FDFF00007FC07E40F8FF00007FC07F40F07F0000
      7FC07FC0E03F000000000000C01F000000000000000000000000000000000000
      000000000000}
  end
end
