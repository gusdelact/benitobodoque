object WCrGaSolLiq: TWCrGaSolLiq
  Left = 273
  Top = 33
  Width = 629
  Height = 550
  Caption = 'Solicitud de Garantía Liquida'
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
  object lbID_SOLICITUD: TLabel
    Left = 436
    Top = 10
    Width = 95
    Height = 13
    Caption = 'Número de Solicitud'
  end
  object lbID_CREDITO: TLabel
    Left = 30
    Top = 10
    Width = 82
    Height = 13
    Caption = 'Núm. Disposición'
  end
  object lbNUM_PERIODO: TLabel
    Left = 121
    Top = 10
    Width = 36
    Height = 13
    Caption = 'Periodo'
  end
  object Label1: TLabel
    Left = 172
    Top = 10
    Width = 51
    Height = 13
    Caption = 'Acreditado'
  end
  object Label2: TLabel
    Left = 2
    Top = 417
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object Label4: TLabel
    Left = 2
    Top = 440
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object Label5: TLabel
    Left = 236
    Top = 439
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object Label7: TLabel
    Left = 236
    Top = 417
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object Label8: TLabel
    Left = 179
    Top = 52
    Width = 88
    Height = 13
    Caption = 'Número de Control'
  end
  object Label10: TLabel
    Left = 419
    Top = 51
    Width = 39
    Height = 13
    Caption = 'Id. FIRA'
  end
  object lblComentarios: TLabel
    Left = 3
    Top = 375
    Width = 58
    Height = 13
    Caption = 'Comentarios'
  end
  object rgSIT_GAR_SOL_LIQ: TRadioGroup
    Left = 2
    Top = 338
    Width = 603
    Height = 30
    Caption = 'Situación'
    Columns = 3
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Liquidado'
      'Cancelado')
    TabOrder = 10
  end
  object grbxImportes: TGroupBox
    Left = 2
    Top = 146
    Width = 604
    Height = 192
    HelpContext = 1201
    TabOrder = 9
    TabStop = True
    object lblIMP_SOLICITAR: TLabel
      Left = 8
      Top = 175
      Width = 84
      Height = 13
      Caption = 'Importe a Solicitar'
    end
    object lbledIMP_ADEUDO_CAP: TLabel
      Left = 8
      Top = 127
      Width = 131
      Height = 13
      Caption = 'Importe de Adeudo (Capital)'
    end
    object Label9: TLabel
      Left = 505
      Top = 8
      Width = 87
      Height = 13
      Alignment = taCenter
      Caption = 'Importe Disponible'
      Color = clInfoBk
      ParentColor = False
    end
    object lblF_APLICACION: TLabel
      Left = 378
      Top = 150
      Width = 97
      Height = 13
      Caption = 'Fecha de Aplicación'
    end
    object lblIMP_APLICADO: TLabel
      Left = 378
      Top = 173
      Width = 79
      Height = 13
      Caption = 'Importe Aplicado'
    end
    object lblPCT_APLICADO: TLabel
      Left = 7
      Top = 153
      Width = 124
      Height = 13
      Caption = '% Garantía Líquida a usar'
    end
    object lblNOM_TITULAR: TLabel
      Left = 142
      Top = 8
      Width = 359
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Nombre del Titular'
      Color = clInfoBk
      ParentColor = False
      WordWrap = True
    end
    object Label14: TLabel
      Left = 72
      Top = 8
      Width = 67
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Contrato'
      Color = clInfoBk
      ParentColor = False
      WordWrap = True
    end
    object lblIMP_GTIA_DISPON: TLabel
      Left = 378
      Top = 126
      Width = 76
      Height = 13
      Caption = 'Total Disponible'
    end
    object Label3: TLabel
      Left = 0
      Top = 8
      Width = 70
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Tipo Contrato'
      Color = clInfoBk
      ParentColor = False
      WordWrap = True
    end
    object lblF_SOLICITUD: TLabel
      Left = 9
      Top = 197
      Width = 88
      Height = 13
      Caption = 'Fecha de Solicitud'
      Visible = False
    end
    object edIMP_ADEUDO_CAP: TInterEdit
      Left = 156
      Top = 123
      Width = 90
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 2
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_SOLICITAR: TInterEdit
      Tag = 18
      Left = 155
      Top = 166
      Width = 91
      Height = 21
      HelpContext = 1201
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edIMP_SOLICITARExit
      DisplayMask = '###,###,###,###,##0.00'
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
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_APLICADO: TInterEdit
      Left = 504
      Top = 167
      Width = 90
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
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
    object edF_APLICACION: TEdit
      Left = 504
      Top = 145
      Width = 74
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object InterDateTimePicker2: TInterDateTimePicker
      Left = 575
      Top = 145
      Width = 19
      Height = 22
      CalAlignment = dtaLeft
      Date = 37805.5239350116
      Time = 37805.5239350116
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 8
      TabStop = False
      Formato = dfDate
    end
    object edPCT_APLICADO: TInterEdit
      Left = 156
      Top = 145
      Width = 90
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '##0.0000'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 3
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_GTIA_DISPON: TInterEdit
      Left = 504
      Top = 122
      Width = 90
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 1
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object strAlgnGrdCto: TStringAlignGrid
      Left = -2
      Top = 23
      Width = 606
      Height = 95
      ColCount = 4
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      ScrollBars = ssVertical
      TabOrder = 0
      ColWidths = (
        68
        69
        361
        83)
      RowHeights = (
        16)
      PropCell = ()
      PropCol = (
        1
        1
        0
        0
        3
        1
        0
        0)
      PropRow = ()
      PropFixedCol = (
        1
        1
        0
        0
        3
        1
        0
        0)
      PropFixedRow = ()
    end
    object edF_SOLICITUD: TEdit
      Tag = 18
      Left = 154
      Top = 192
      Width = 74
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 5
      Visible = False
      OnExit = edF_SOLICITUDExit
    end
    object InterDateTimePicker1: TInterDateTimePicker
      Tag = 18
      Left = 229
      Top = 192
      Width = 19
      Height = 22
      CalAlignment = dtaLeft
      Date = 37805.5239350116
      Time = 37805.5239350116
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 6
      Visible = False
      OnExit = edF_SOLICITUDExit
      Edit = edF_SOLICITUD
      Formato = dfDate
    end
  end
  object rgCVE_TIPO_LIQ: TRadioGroup
    Tag = 18
    Left = 1
    Top = 112
    Width = 603
    Height = 36
    HelpContext = 1101
    Caption = 'Tipo de Liquidación a Solicitar'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Por Periodo (Vigente o Impagado)'
      'Por Disposición (Vigente o Impagado)')
    TabOrder = 8
    TabStop = True
    OnClick = rgCVE_TIPO_LIQClick
    OnExit = rgCVE_TIPO_LIQExit
  end
  object edID_SOLICITUD: TEdit
    Left = 537
    Top = 3
    Width = 67
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object edID_CREDITO: TEdit
    Left = 27
    Top = 25
    Width = 92
    Height = 21
    HelpContext = 1002
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
    OnExit = btnBuscaExit
  end
  object edNUM_PERIODO: TEdit
    Left = 121
    Top = 25
    Width = 49
    Height = 21
    HelpContext = 1003
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
    OnExit = btnBuscaExit
  end
  object edNOM_ACREDITADO: TEdit
    Left = 171
    Top = 25
    Width = 433
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object btnBusca: TBitBtn
    Tag = 50
    Left = 1
    Top = 24
    Width = 25
    Height = 22
    HelpContext = 1001
    TabOrder = 1
    OnClick = btnBuscaClick
    OnExit = btnBuscaExit
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
  object edF_ALTA: TEdit
    Left = 82
    Top = 413
    Width = 84
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 12
  end
  object edF_MODIFICA: TEdit
    Left = 82
    Top = 435
    Width = 84
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 13
  end
  object edCVE_USU_ALTA: TEdit
    Left = 320
    Top = 414
    Width = 87
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 14
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 320
    Top = 435
    Width = 87
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 15
  end
  object MsgPanel: TPanel
    Left = 4
    Top = 462
    Width = 600
    Height = 21
    TabOrder = 17
  end
  object PnDatos: TPanel
    Left = 4
    Top = 483
    Width = 600
    Height = 21
    TabOrder = 18
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
      Left = 296
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
      Left = 296
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
      Left = 360
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
      Left = 360
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
  object edID_CONTROL_EXT: TEdit
    Left = 271
    Top = 46
    Width = 142
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object edID_CRED_EXTERNO: TEdit
    Left = 467
    Top = 46
    Width = 137
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object memTX_COMENTARIO: TMemo
    Tag = 18
    Left = 79
    Top = 372
    Width = 525
    Height = 36
    HelpContext = 1301
    MaxLength = 255
    ScrollBars = ssVertical
    TabOrder = 11
    OnExit = memTX_COMENTARIOExit
  end
  object btnCancela: TBitBtn
    Tag = 17
    Left = 446
    Top = 413
    Width = 157
    Height = 23
    Caption = 'Cancelación de Solicitud'
    TabOrder = 16
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
  object gbxOperativa: TGroupBox
    Left = 1
    Top = 67
    Width = 603
    Height = 46
    Caption = 'Datos de Operativa'
    TabOrder = 7
    object lblCVE_OPERATIVA: TLabel
      Left = 6
      Top = 19
      Width = 85
      Height = 13
      Caption = 'Tipo de Operativa'
    end
    object lblPCT_GTIA_FEGA_NO: TLabel
      Left = 207
      Top = 19
      Width = 80
      Height = 13
      Caption = '% FEGA Nominal'
    end
    object lblPCT_GTIA_FEGA_EF: TLabel
      Left = 425
      Top = 19
      Width = 81
      Height = 13
      Caption = '% FEGA Efectiva'
    end
    object edPCT_GTIA_FEGA_NO: TInterEdit
      Left = 291
      Top = 15
      Width = 72
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '##0.0000'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 1
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edCVE_OPERATIVA: TEdit
      Left = 97
      Top = 14
      Width = 58
      Height = 21
      HelpContext = 1001
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edPCT_GTIA_FEGA_EF: TInterEdit
      Left = 510
      Top = 15
      Width = 72
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '##0.0000'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 2
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object btnImprimir: TBitBtn
    Left = 447
    Top = 435
    Width = 157
    Height = 22
    Caption = 'Imprimir Solicitud'
    Enabled = False
    TabOrder = 19
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
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesCancelar = InterForma1DespuesCancelar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesNuevo = InterForma1AntesNuevo
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
    ShowBtnModificar = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 541
    Top = 469
  end
end
