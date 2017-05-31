object WCrGaSolFega: TWCrGaSolFega
  Left = 329
  Top = 53
  Width = 620
  Height = 604
  Caption = 'Solicitud de Garantía FEGA'
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
  object lblID_SOLICITUD: TLabel
    Left = 437
    Top = 7
    Width = 95
    Height = 13
    Caption = 'Número de Solicitud'
  end
  object lblID_CREDITO: TLabel
    Left = 184
    Top = 7
    Width = 54
    Height = 13
    Caption = 'Disposición'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object lblNUM_PERIODO: TLabel
    Left = 244
    Top = 7
    Width = 36
    Height = 13
    Caption = 'Periodo'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label11: TLabel
    Left = 288
    Top = 7
    Width = 51
    Height = 13
    Caption = 'Acreditado'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object lblF_ALTA: TLabel
    Left = 8
    Top = 453
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object lblF_MODIFICA: TLabel
    Left = 8
    Top = 473
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object lblCVE_USU_MODIFICA: TLabel
    Left = 369
    Top = 473
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object lblCVE_USU_ALTA: TLabel
    Left = 370
    Top = 453
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object Label9: TLabel
    Left = 6
    Top = 112
    Width = 66
    Height = 27
    AutoSize = False
    Caption = 'Concepto'#13#10'de Inversión'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object lblCVE_SEGURO: TLabel
    Left = 6
    Top = 94
    Width = 73
    Height = 13
    Caption = 'Tipo de Seguro'
  end
  object Label29: TLabel
    Left = 399
    Top = 120
    Width = 45
    Height = 13
    Caption = 'Unidades'
  end
  object lblCVE_CAUSA: TLabel
    Left = 6
    Top = 71
    Width = 76
    Height = 13
    Caption = 'Causa de  Pago'
  end
  object Label1: TLabel
    Left = 6
    Top = 25
    Width = 82
    Height = 13
    Caption = 'Solicitud Gtia Liq.'
  end
  object Label3: TLabel
    Left = 181
    Top = 53
    Width = 73
    Height = 13
    Caption = 'Número Control'
  end
  object Label10: TLabel
    Left = 406
    Top = 53
    Width = 39
    Height = 13
    Caption = 'Id. FIRA'
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 139
    Width = 317
    Height = 188
    Caption = 'Recuperaciones:'
    TabOrder = 18
    object lbCAMPO1: TLabel
      Left = 7
      Top = 26
      Width = 208
      Height = 13
      Caption = 'Venta de Productos......................................'
    end
    object Label5: TLabel
      Left = 7
      Top = 52
      Width = 207
      Height = 13
      Caption = 'Indemnización de seguros............................'
    end
    object Label7: TLabel
      Left = 7
      Top = 78
      Width = 206
      Height = 13
      Caption = 'Fondos de Auto.aseguramiento (FINCAS)....'
    end
    object Label8: TLabel
      Left = 7
      Top = 103
      Width = 206
      Height = 13
      Caption = 'Avales..........................................................'
    end
    object Label12: TLabel
      Left = 7
      Top = 129
      Width = 208
      Height = 13
      Caption = 'Garantías gravadas......................................'
    end
    object lblIMP_OTROS: TLabel
      Left = 7
      Top = 155
      Width = 208
      Height = 13
      Caption = 
        'Otros...........................................................' +
        '..'
    end
    object edIMP_PRODUCTOS: TInterEdit
      Tag = 18
      Left = 220
      Top = 21
      Width = 90
      Height = 21
      HelpContext = 1501
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edIMP_PRODUCTOSEnter
      OnExit = edIMP_PRODUCTOSExit
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      TabOrder = 0
      UseReType = True
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_SEGUROS: TInterEdit
      Tag = 18
      Left = 220
      Top = 47
      Width = 90
      Height = 21
      HelpContext = 1502
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edIMP_PRODUCTOSEnter
      OnExit = edIMP_PRODUCTOSExit
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      TabOrder = 1
      UseReType = True
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_FINCAS: TInterEdit
      Tag = 18
      Left = 220
      Top = 73
      Width = 90
      Height = 21
      HelpContext = 1503
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edIMP_PRODUCTOSEnter
      OnExit = edIMP_PRODUCTOSExit
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      TabOrder = 2
      UseReType = True
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_AVALES: TInterEdit
      Left = 220
      Top = 98
      Width = 90
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edIMP_PRODUCTOSExit
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      TabOrder = 3
      ReadOnly = True
      UseReType = True
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_GTIA_GRAVAD: TInterEdit
      Tag = 18
      Left = 220
      Top = 124
      Width = 90
      Height = 20
      HelpContext = 1504
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edIMP_PRODUCTOSEnter
      OnExit = edIMP_PRODUCTOSExit
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      TabOrder = 4
      UseReType = True
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_OTROS: TInterEdit
      Tag = 18
      Left = 220
      Top = 150
      Width = 90
      Height = 21
      HelpContext = 1505
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnEnter = edIMP_PRODUCTOSEnter
      OnExit = edIMP_PRODUCTOSExit
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      TabOrder = 5
      UseReType = True
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object edID_CREDITO: TEdit
    Left = 183
    Top = 25
    Width = 59
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object btnID_SOLIC_LIQ: TBitBtn
    Tag = 50
    Left = 157
    Top = 23
    Width = 25
    Height = 22
    HelpContext = 1002
    TabOrder = 2
    OnClick = btnID_SOLIC_LIQClick
    OnExit = edID_SOLIC_LIQExit
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
    Left = 287
    Top = 25
    Width = 300
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object edID_SOLICITUD: TEdit
    Tag = 512
    Left = 535
    Top = 2
    Width = 52
    Height = 21
    TabStop = False
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edNUM_PERIODO: TEdit
    Left = 242
    Top = 25
    Width = 41
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object rgCVE_SITUACION_FI: TRadioGroup
    Tag = 18
    Left = 324
    Top = 139
    Width = 265
    Height = 86
    HelpContext = 1601
    Caption = 'Situación Solicitud de Garantía FEGA'
    Columns = 2
    Items.Strings = (
      'Por venta de producto'
      'Por dación en pago'
      'Proceso judicial'
      'Por venta de activos'
      'Proceso extrajudicial'
      'Pago Incobrable')
    TabOrder = 19
    TabStop = True
    OnExit = rgCVE_SITUACION_FIExit
  end
  object edDESC_SEGURO: TEdit
    Left = 183
    Top = 93
    Width = 404
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 13
  end
  object edDESC_CON_INV: TEdit
    Left = 183
    Top = 115
    Width = 210
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 16
  end
  object GroupBox2: TGroupBox
    Left = 324
    Top = 258
    Width = 265
    Height = 69
    Caption = 'Programa de recuperación'
    TabOrder = 21
    object Label15: TLabel
      Left = 10
      Top = 22
      Width = 30
      Height = 13
      Alignment = taCenter
      Caption = 'Fecha'
    end
    object Label16: TLabel
      Left = 3
      Top = 46
      Width = 52
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Importe'
    end
    object edF1_RECUPERA: TEdit
      Tag = 18
      Left = 53
      Top = 18
      Width = 72
      Height = 21
      HelpContext = 1801
      ReadOnly = True
      TabOrder = 0
      OnExit = edF1_RECUPERAExit
    end
    object edF2_RECUPERA: TEdit
      Tag = 18
      Left = 156
      Top = 19
      Width = 73
      Height = 21
      HelpContext = 1803
      ReadOnly = True
      TabOrder = 3
      OnExit = edF1_RECUPERAExit
    end
    object dtpF2_RECUPERA: TInterDateTimePicker
      Tag = 18
      Left = 229
      Top = 19
      Width = 20
      Height = 23
      HelpContext = 1804
      CalAlignment = dtaLeft
      Date = 37554.5731407176
      Time = 37554.5731407176
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 4
      OnExit = edF1_RECUPERAExit
      Edit = edF2_RECUPERA
      Formato = dfDate
    end
    object dtpF1_RECUPERA: TInterDateTimePicker
      Tag = 18
      Left = 125
      Top = 18
      Width = 20
      Height = 23
      HelpContext = 1802
      CalAlignment = dtaLeft
      Date = 37554.5731407176
      Time = 37554.5731407176
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      OnExit = edF1_RECUPERAExit
      Edit = edF1_RECUPERA
      Formato = dfDate
    end
    object edIMP1_RECUPERA: TInterEdit
      Tag = 18
      Left = 53
      Top = 42
      Width = 90
      Height = 21
      HelpContext = 1805
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edF1_RECUPERAExit
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      TabOrder = 2
      UseReType = True
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP2_RECUPERA: TInterEdit
      Tag = 18
      Left = 156
      Top = 42
      Width = 90
      Height = 21
      HelpContext = 1806
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edF1_RECUPERAExit
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      TabOrder = 5
      UseReType = True
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object rgSIT_GAR_SOL_FEG: TRadioGroup
    Left = 4
    Top = 410
    Width = 586
    Height = 37
    Caption = 'Situación Solicitud de Garantía FIRA'
    Columns = 6
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Items.Strings = (
      'Activa'
      'Liquidada'
      'Recuperada'
      'Cancelada'
      'Devuelta a FIRA'
      'Otorgada FIRA')
    ParentFont = False
    TabOrder = 24
  end
  object edF_ALTA: TEdit
    Left = 124
    Top = 448
    Width = 103
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 25
  end
  object edF_MODIFICA: TEdit
    Left = 124
    Top = 470
    Width = 103
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 26
  end
  object edCVE_USU_ALTA: TEdit
    Left = 492
    Top = 449
    Width = 97
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 27
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 492
    Top = 471
    Width = 97
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 28
  end
  object GroupBox3: TGroupBox
    Left = 4
    Top = 371
    Width = 585
    Height = 41
    Caption = 'FIRA'
    TabOrder = 23
    object Label17: TLabel
      Left = 222
      Top = 17
      Width = 73
      Height = 13
      Caption = 'Fecha de Pago'
    end
    object Label18: TLabel
      Left = 11
      Top = 18
      Width = 105
      Height = 13
      Caption = 'Fecha Máx. a Solicitar'
    end
    object lblIMP_APLICADO: TLabel
      Left = 404
      Top = 18
      Width = 79
      Height = 13
      Caption = 'Importe Aplicado'
    end
    object edF_MAX_SOLICITAR: TEdit
      Left = 127
      Top = 14
      Width = 67
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object dtF_INICIAL: TInterDateTimePicker
      Left = 191
      Top = 14
      Width = 20
      Height = 22
      CalAlignment = dtaLeft
      Date = 37554.5731407176
      Time = 37554.5731407176
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      TabStop = False
      Edit = edF_MAX_SOLICITAR
      Formato = dfDate
    end
    object Edit20: TEdit
      Left = 303
      Top = 14
      Width = 67
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object InterDateTimePicker3: TInterDateTimePicker
      Left = 367
      Top = 14
      Width = 20
      Height = 22
      CalAlignment = dtaLeft
      Date = 37554.5731407176
      Time = 37554.5731407176
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      TabStop = False
      Edit = Edit20
      Formato = dfDate
    end
    object edIMP_APLICADO_FEGA: TInterEdit
      Left = 485
      Top = 14
      Width = 89
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trContrato
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      TabOrder = 4
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object btnFmt8FIRA: TBitBtn
    Tag = 17
    Left = 1
    Top = 494
    Width = 204
    Height = 22
    Caption = 'Imprimir Formato &8 de FIRA'
    Enabled = False
    TabOrder = 29
    OnClick = btnFmt8FIRAClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
      55555575555555775F55509999999901055557F55555557F75F5001111111101
      105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
      01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
      8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
      0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
      0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
      05555555575FF777755555555500055555555555557775555555}
    NumGlyphs = 2
  end
  object btnFmt9FIRA: TBitBtn
    Tag = 17
    Left = 204
    Top = 494
    Width = 204
    Height = 22
    Caption = 'Imprimir Formato &9 de FIRA'
    Enabled = False
    TabOrder = 30
    OnClick = btnFmt9FIRAClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
      55555575555555775F55509999999901055557F55555557F75F5001111111101
      105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
      01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
      8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
      0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
      0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
      05555555575FF777755555555500055555555555557775555555}
    NumGlyphs = 2
  end
  object btnCancela: TBitBtn
    Tag = 17
    Left = 407
    Top = 494
    Width = 184
    Height = 22
    Caption = 'Cancelación de Solicitud'
    Enabled = False
    TabOrder = 31
    OnClick = btnCancelaClick
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
  object MsgPanel: TPanel
    Left = 3
    Top = 517
    Width = 589
    Height = 21
    TabOrder = 32
  end
  object PnDatos: TPanel
    Left = 2
    Top = 538
    Width = 589
    Height = 21
    TabOrder = 33
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
      Left = 328
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
      Left = 328
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
      Left = 392
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
      Left = 392
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
  object edDESC_CAUS_PAG: TEdit
    Left = 183
    Top = 71
    Width = 404
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
  end
  object edCVE_SEGURO: TEdit
    Tag = 530
    Left = 90
    Top = 92
    Width = 68
    Height = 21
    HelpContext = 1201
    CharCase = ecUpperCase
    TabOrder = 11
    OnExit = edCVE_SEGUROExit
  end
  object GroupBox4: TGroupBox
    Left = 4
    Top = 327
    Width = 586
    Height = 45
    Caption = 'Importes'
    TabOrder = 22
    object Label20: TLabel
      Left = 164
      Top = 20
      Width = 78
      Height = 13
      Caption = 'Recuperaciones'
    end
    object Label21: TLabel
      Left = 2
      Top = 20
      Width = 47
      Height = 13
      Caption = 'Sdo. Vdo.'
    end
    object Label23: TLabel
      Left = 353
      Top = 21
      Width = 118
      Height = 13
      Caption = 'Importe FEGA a  Solicitar'
    end
    object edIMP_SDO_VENCIDO: TInterEdit
      Left = 51
      Top = 15
      Width = 84
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      TabOrder = 0
      Enabled = False
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_RECUPERACIONES: TInterEdit
      Left = 245
      Top = 14
      Width = 90
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      TabOrder = 1
      Enabled = False
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_SOLICITAR: TInterEdit
      Left = 484
      Top = 13
      Width = 84
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      TabOrder = 2
      Enabled = False
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object edCVE_CONT_INV: TEdit
    Tag = 530
    Left = 90
    Top = 115
    Width = 66
    Height = 21
    HelpContext = 1301
    CharCase = ecUpperCase
    TabOrder = 14
    OnExit = edCVE_CONT_INVExit
  end
  object edCVE_CAUS_PAG: TEdit
    Tag = 530
    Left = 90
    Top = 70
    Width = 68
    Height = 21
    HelpContext = 1101
    CharCase = ecUpperCase
    TabOrder = 8
    OnExit = edCVE_CAUS_PAGExit
  end
  object btnCVE_CAUS_PAG: TBitBtn
    Tag = 18
    Left = 157
    Top = 69
    Width = 25
    Height = 22
    HelpContext = 1102
    TabOrder = 9
    OnClick = btnCVE_CAUS_PAGClick
    OnExit = edCVE_CAUS_PAGExit
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
  object btnCVE_SEGURO: TBitBtn
    Tag = 18
    Left = 157
    Top = 95
    Width = 25
    Height = 22
    HelpContext = 1202
    TabOrder = 12
    OnClick = btnCVE_SEGUROClick
    OnExit = edCVE_SEGUROExit
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
  object btnCVE_CONT_INV: TBitBtn
    Tag = 18
    Left = 157
    Top = 117
    Width = 25
    Height = 22
    HelpContext = 1302
    TabOrder = 15
    OnClick = btnCVE_CONT_INVClick
    OnExit = edCVE_CONT_INVExit
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
  object edTXT_UN: TEdit
    Tag = 18
    Left = 453
    Top = 116
    Width = 134
    Height = 21
    HelpContext = 1401
    TabOrder = 17
    OnExit = edTXT_UNExit
  end
  object edID_SOLIC_LIQ: TEdit
    Tag = 562
    Left = 90
    Top = 23
    Width = 67
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    TabOrder = 1
    OnExit = edID_SOLIC_LIQExit
  end
  object GroupBox5: TGroupBox
    Left = 324
    Top = 224
    Width = 267
    Height = 33
    TabOrder = 20
    object Label2: TLabel
      Left = 4
      Top = 12
      Width = 217
      Height = 13
      Caption = 'Días a proyectar para el cálculo de moratorios'
    end
    object edDIAS_MORAS_PROY: TInterEdit
      Tag = 18
      Left = 227
      Top = 9
      Width = 36
      Height = 21
      HelpContext = 1701
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      OnExit = edDIAS_MORAS_PROYExit
      MaxLength = 4
      TabOrder = 0
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object edID_CONTROL_EXT: TEdit
    Left = 258
    Top = 49
    Width = 142
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object edID_CRED_EXTERNO: TEdit
    Left = 454
    Top = 48
    Width = 133
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
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
    Left = 562
    Top = 488
  end
  object ilCVE_CAUSA_PAG: TInterLinkit
    Control = edCVE_CAUS_PAG
    OnEjecuta = ilCVE_CAUS_PAGEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCVE_CAUS_PAGCapture
    Left = 260
    Top = 66
  end
  object ilCVE_SEGURO: TInterLinkit
    Control = edCVE_SEGURO
    OnEjecuta = ilCVE_SEGUROEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 291
    Top = 88
  end
  object ilCVE_CONT_INV: TInterLinkit
    Control = edCVE_CONT_INV
    OnEjecuta = ilCVE_CONT_INVEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 322
    Top = 108
  end
  object ilID_SOLIC_LIQ: TInterLinkit
    Control = edID_SOLIC_LIQ
    OnEjecuta = ilID_SOLIC_LIQEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    Left = 221
    Top = 22
  end
end
