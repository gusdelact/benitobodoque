object WCrCatSol: TWCrCatSol
  Left = 266
  Top = 57
  Width = 617
  Height = 594
  Caption = 'ICRE Calculadora Costo Anual Total'
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
  object lbF_SOLICITUD: TLabel
    Left = 396
    Top = 468
    Width = 73
    Height = 13
    Caption = 'Fecha Solicitud'
  end
  object lbID_SOL_CAT: TLabel
    Left = 216
    Top = 446
    Width = 74
    Height = 13
    Caption = 'Número Sol Cat'
  end
  object lbCVE_PRODUCTO_CRE: TLabel
    Left = 0
    Top = 29
    Width = 94
    Height = 13
    Caption = 'Producto de Crédito'
  end
  object lbIMP_SOLICITUD: TLabel
    Left = 0
    Top = 52
    Width = 60
    Height = 13
    Caption = 'Imp Solicitud'
  end
  object lbF_INICIO: TLabel
    Left = 0
    Top = 153
    Width = 58
    Height = 13
    Caption = 'Fecha Inicio'
  end
  object lbF_FIN: TLabel
    Left = 218
    Top = 153
    Width = 47
    Height = 13
    Caption = 'Fecha Fin'
  end
  object lbDIAS_PLAZO: TLabel
    Left = 416
    Top = 153
    Width = 50
    Height = 13
    Caption = 'Dias Plazo'
  end
  object lbNOMBRE: TLabel
    Left = 0
    Top = 6
    Width = 72
    Height = 13
    Caption = 'Nombre Cliente'
  end
  object lbCVE_MONEDA: TLabel
    Left = 224
    Top = 52
    Width = 84
    Height = 13
    Caption = 'Clave de Moneda'
  end
  object lbUNIDAD_TIEMPO_CP: TLabel
    Left = 417
    Top = 183
    Width = 58
    Height = 13
    Caption = 'Periodicidad'
  end
  object lbUNIDAD_TIEMPO_IN: TLabel
    Left = 528
    Top = 532
    Width = 18
    Height = 13
    Caption = 'UTI'
  end
  object lbCVE_TASA_REFER: TLabel
    Left = 0
    Top = 107
    Width = 79
    Height = 13
    Caption = 'Tasa Referencia'
  end
  object lbOPER_SOBRETASA: TLabel
    Left = 0
    Top = 130
    Width = 95
    Height = 13
    Caption = 'Operador Sobretasa'
  end
  object lbSOBRETASA: TLabel
    Left = 218
    Top = 130
    Width = 48
    Height = 13
    Caption = 'Sobretasa'
  end
  object lbTASA_ANUALIZADA: TLabel
    Left = 416
    Top = 130
    Width = 79
    Height = 13
    Caption = 'Tasa Anualizada'
  end
  object lbCVE_TIPO_TASA: TLabel
    Left = 472
    Top = 529
    Width = 21
    Height = 13
    Caption = 'CTT'
  end
  object lbTASA_REFERENCIA: TLabel
    Left = 416
    Top = 107
    Width = 79
    Height = 13
    Caption = 'Tasa Referencia'
  end
  object lbPCT_CAT: TLabel
    Left = 0
    Top = 446
    Width = 35
    Height = 13
    Caption = 'Pct Cat'
  end
  object lbSIT_SOL_CAT: TLabel
    Left = 396
    Top = 446
    Width = 81
    Height = 13
    Caption = 'Situación Sol Cat'
  end
  object lbF_ALTA: TLabel
    Left = 216
    Top = 468
    Width = 51
    Height = 13
    Caption = 'Fecha Alta'
  end
  object lbCVE_USU_ALTA: TLabel
    Left = 0
    Top = 468
    Width = 85
    Height = 13
    Caption = 'Clave de Usu Alta'
  end
  object lbF_MODIFICA: TLabel
    Left = 216
    Top = 490
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object lbCVE_USU_MODIF: TLabel
    Left = 0
    Top = 490
    Width = 112
    Height = 13
    Caption = 'Clave Usu Modificación'
  end
  object lbSISTEMA: TLabel
    Left = 396
    Top = 490
    Width = 37
    Height = 13
    Caption = 'Sistema'
  end
  object edF_SOLICITUD: TEdit
    Left = 484
    Top = 464
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 17
  end
  object edID_SOL_CAT: TEdit
    Left = 296
    Top = 442
    Width = 49
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 18
  end
  object edCVE_PRODUCTO_CRE: TEdit
    Left = 143
    Top = 25
    Width = 66
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 19
  end
  object dtpF_INICIO: TInterDateTimePicker
    Tag = 18
    Left = 194
    Top = 149
    Width = 21
    Height = 21
    HelpContext = 1502
    CalAlignment = dtaLeft
    Date = 39100.4050735532
    Time = 39100.4050735532
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 10
    OnExit = edF_INICIOExit
    Edit = edF_INICIO
    Formato = dfDate
  end
  object edF_INICIO: TEdit
    Tag = 18
    Left = 120
    Top = 149
    Width = 73
    Height = 21
    HelpContext = 1501
    CharCase = ecUpperCase
    TabOrder = 9
    OnExit = edF_INICIOExit
  end
  object dtpF_FIN: TInterDateTimePicker
    Tag = 18
    Left = 386
    Top = 149
    Width = 21
    Height = 21
    HelpContext = 1504
    CalAlignment = dtaLeft
    Date = 39100.4050735532
    Time = 39100.4050735532
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 12
    OnExit = edF_FINExit
    Edit = edF_FIN
    Formato = dfDate
  end
  object edF_FIN: TEdit
    Tag = 18
    Left = 312
    Top = 149
    Width = 74
    Height = 21
    HelpContext = 1503
    CharCase = ecUpperCase
    TabOrder = 11
    OnExit = edF_FINExit
  end
  object edDIAS_PLAZO: TEdit
    Left = 504
    Top = 149
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 20
    OnChange = edDIAS_PLAZOChange
  end
  object edNOMBRE: TEdit
    Tag = 18
    Left = 120
    Top = 2
    Width = 457
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    TabOrder = 0
    OnExit = edNOMBREExit
  end
  object edCVE_MONEDA: TEdit
    Left = 312
    Top = 48
    Width = 65
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 36
  end
  object edUNIDAD_TIEMPO_IN: TEdit
    Left = 552
    Top = 528
    Width = 17
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 21
  end
  object edCVE_TASA_REFER: TEdit
    Tag = 530
    Left = 120
    Top = 103
    Width = 65
    Height = 21
    HelpContext = 1301
    CharCase = ecUpperCase
    TabOrder = 4
    OnExit = edCVE_TASA_REFERExit
  end
  object edOPER_SOBRETASA: TEdit
    Tag = 18
    Left = 120
    Top = 126
    Width = 33
    Height = 21
    HelpContext = 1401
    CharCase = ecUpperCase
    MaxLength = 1
    TabOrder = 7
    OnExit = edOPER_SOBRETASAExit
    OnKeyPress = edOPER_SOBRETASAKeyPress
  end
  object edSOBRETASA: TEdit
    Tag = 18
    Left = 312
    Top = 126
    Width = 73
    Height = 21
    HelpContext = 1402
    CharCase = ecUpperCase
    TabOrder = 8
    OnExit = edSOBRETASAExit
  end
  object edTASA_ANUALIZADA: TEdit
    Left = 504
    Top = 126
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 22
  end
  object edTASA_REFERENCIA: TEdit
    Tag = 18
    Left = 504
    Top = 103
    Width = 73
    Height = 21
    HelpContext = 1303
    CharCase = ecUpperCase
    ReadOnly = True
    TabOrder = 6
  end
  object edPCT_CAT: TEdit
    Left = 120
    Top = 442
    Width = 81
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 23
  end
  object chB_IMPRESA: TCheckBox
    Left = 520
    Top = 442
    Width = 57
    Height = 21
    TabStop = False
    Alignment = taLeftJustify
    Caption = 'Impresa'
    Enabled = False
    TabOrder = 24
  end
  object edSIT_SOL_CAT: TEdit
    Left = 484
    Top = 442
    Width = 32
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 25
  end
  object edF_ALTA: TEdit
    Left = 296
    Top = 464
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 26
  end
  object edCVE_USU_ALTA: TEdit
    Left = 120
    Top = 464
    Width = 81
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 27
  end
  object edF_MODIFICA: TEdit
    Left = 296
    Top = 486
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 28
  end
  object edCVE_USU_MODIF: TEdit
    Left = 120
    Top = 486
    Width = 81
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 29
  end
  object chB_IVA: TCheckBox
    Left = 397
    Top = 49
    Width = 67
    Height = 21
    TabStop = False
    Caption = 'Aplica Iva'
    Enabled = False
    TabOrder = 30
  end
  object edSISTEMA: TEdit
    Left = 484
    Top = 486
    Width = 94
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 31
  end
  object MsgPanel: TPanel
    Left = 0
    Top = 508
    Width = 481
    Height = 20
    TabOrder = 32
  end
  object PnDatos: TPanel
    Left = 0
    Top = 528
    Width = 579
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
      Left = 293
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
      Left = 293
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
      Left = 357
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
      Left = 357
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
  object btPRODUCTO: TBitBtn
    Tag = 18
    Left = 120
    Top = 25
    Width = 21
    Height = 20
    HelpContext = 1101
    TabOrder = 1
    OnClick = btPRODUCTOClick
    OnExit = btPRODUCTOExit
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
  object btTASA_REFER: TBitBtn
    Tag = 18
    Left = 188
    Top = 103
    Width = 22
    Height = 20
    HelpContext = 1302
    TabOrder = 5
    OnClick = btTASA_REFERClick
    OnExit = edCVE_TASA_REFERExit
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
  object edDescProducto: TEdit
    Left = 216
    Top = 25
    Width = 361
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 34
  end
  object edDESC_TASA_REFER: TEdit
    Left = 216
    Top = 103
    Width = 196
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 35
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 208
    Width = 577
    Height = 227
    Caption = 'Comisiones y Otros Conceptos'
    TabOrder = 16
    object lbCVE_COMISION: TLabel
      Left = 8
      Top = 20
      Width = 99
      Height = 13
      Caption = 'Comisión / Concepto'
    end
    object Label6: TLabel
      Left = 222
      Top = 44
      Width = 72
      Height = 13
      Caption = 'Por % Comisión'
    end
    object Label11: TLabel
      Left = 222
      Top = 68
      Width = 54
      Height = 13
      Caption = 'Por Importe'
    end
    object Label1: TLabel
      Left = 9
      Top = 44
      Width = 81
      Height = 13
      Caption = 'Tipo de Comisión'
    end
    object Label2: TLabel
      Left = 10
      Top = 68
      Width = 81
      Height = 13
      Caption = 'Periodo Comisión'
    end
    object Label3: TLabel
      Left = 417
      Top = 44
      Width = 62
      Height = 13
      Caption = 'Monto por % '
    end
    object Label4: TLabel
      Left = 14
      Top = 88
      Width = 534
      Height = 13
      Caption = 
        'Nota: Los Importes en pantalla no Incluyen el IVA,  debido a que' +
        ' no se considera para realizar el calculo del CAT.'
    end
    object SGCtrlComis: TSGCtrl
      Left = 8
      Top = 104
      Width = 561
      Height = 119
      ShowTab = True
      TabOrder = 6
      TabWidth = 0
      ShowBtnPriorNext = True
      ShowBtnFirst = True
      ShowBtnLast = True
    end
    object edCVE_COMISION: TEdit
      Tag = 530
      Left = 120
      Top = 16
      Width = 73
      Height = 21
      HelpContext = 1901
      CharCase = ecUpperCase
      MaxLength = 6
      TabOrder = 0
      OnEnter = edCVE_COMISIONEnter
      OnExit = edCVE_COMISIONExit
    end
    object btCOMISION: TBitBtn
      Tag = 18
      Left = 196
      Top = 16
      Width = 22
      Height = 20
      HelpContext = 1902
      TabOrder = 1
      OnClick = btCOMISIONClick
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
      Left = 220
      Top = 16
      Width = 351
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object ePctComision: TInterEdit
      Tag = 18
      Left = 312
      Top = 40
      Width = 73
      Height = 21
      HelpContext = 1913
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = ePctComisionExit
      DisplayMask = '###0.0000'
      MaxLength = 12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 2
      UseReType = True
      UseSep = True
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object ieMonto: TInterEdit
      Tag = 18
      Left = 312
      Top = 64
      Width = 73
      Height = 20
      HelpContext = 1924
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = ieMontoExit
      DisplayMask = '0.00'
      MaxLength = 12
      TabOrder = 3
      UseReType = True
      UseSep = True
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object bbAgrega: TBitBtn
      Tag = 18
      Left = 416
      Top = 64
      Width = 73
      Height = 21
      HelpContext = 1935
      Caption = 'Agregar'
      TabOrder = 4
      OnClick = bbAgregaClick
      OnExit = bbAgregaExit
    end
    object sbBorra: TBitBtn
      Tag = 18
      Left = 496
      Top = 64
      Width = 73
      Height = 21
      HelpContext = 1936
      Caption = 'Elimina'
      TabOrder = 5
      OnClick = sbBorraClick
      OnExit = sbBorraExit
    end
    object edTipoComision: TEdit
      Left = 120
      Top = 40
      Width = 73
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
    end
    object edPerComision: TEdit
      Left = 120
      Top = 64
      Width = 73
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 9
    end
    object edMontoPorcComis: TEdit
      Left = 504
      Top = 40
      Width = 66
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 10
    end
  end
  object edIMP_SOLICITUD: TInterEdit
    Tag = 18
    Left = 120
    Top = 48
    Width = 89
    Height = 20
    HelpContext = 1201
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_SOLICITUDExit
    MaxLength = 12
    TabOrder = 2
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edCVE_AMORTIZACION: TRadioGroup
    Tag = 18
    Left = 0
    Top = 172
    Width = 201
    Height = 34
    HelpContext = 1601
    Caption = 'Tipo de Amortización de Capital'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Periodica'
      'Al Vencimiento')
    TabOrder = 13
    TabStop = True
    OnClick = edCVE_AMORTIZACIONClick
    OnExit = edCVE_AMORTIZACIONExit
  end
  object edCVE_PAGO_INTERES: TRadioGroup
    Tag = 18
    Left = 206
    Top = 172
    Width = 201
    Height = 34
    HelpContext = 1602
    Caption = 'Pago de Intereses'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Periodica'
      'Al Vencimiento')
    TabOrder = 14
    TabStop = True
    OnClick = edCVE_PAGO_INTERESClick
    OnExit = edCVE_PAGO_INTERESExit
  end
  object edUNIDAD_TIEMPO_CP: TComboBox
    Tag = 18
    Left = 485
    Top = 182
    Width = 93
    Height = 21
    HelpContext = 1701
    ItemHeight = 13
    TabOrder = 15
    Text = 'Mensual'
    OnChange = edUNIDAD_TIEMPO_CPChange
    OnExit = edUNIDAD_TIEMPO_CPExit
    Items.Strings = (
      'Semanal'
      'Quincenal'
      'Mensual'
      'Bimestral'
      'Trimestral'
      'Cuatrimetral'
      'Semestral'
      'Anual')
  end
  object bbCAT: TBitBtn
    Tag = 18
    Left = 48
    Top = 442
    Width = 67
    Height = 20
    HelpContext = 2001
    Caption = 'CAT'
    TabOrder = 37
    Visible = False
    OnClick = bbCATClick
    OnExit = bbCATExit
  end
  object bbImprime: TBitBtn
    Left = 481
    Top = 508
    Width = 97
    Height = 20
    Caption = 'Imprimir CAT'
    TabOrder = 38
    OnClick = bbImprimeClick
  end
  object Memo1: TMemo
    Left = 584
    Top = 5
    Width = 1
    Height = 108
    TabStop = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 39
    Visible = False
  end
  object Memo2: TMemo
    Left = 584
    Top = 117
    Width = 1
    Height = 100
    TabStop = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 40
    Visible = False
  end
  object Memo3: TMemo
    Left = 584
    Top = 221
    Width = 1
    Height = 100
    TabStop = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 41
    Visible = False
  end
  object Memo4: TMemo
    Left = 584
    Top = 418
    Width = 1
    Height = 124
    TabStop = False
    ScrollBars = ssVertical
    TabOrder = 42
    Visible = False
  end
  object Memo5: TMemo
    Left = 584
    Top = 325
    Width = 1
    Height = 88
    TabStop = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 43
    Visible = False
  end
  object cbBCapitaliza: TCheckBox
    Left = 504
    Top = 49
    Width = 67
    Height = 21
    TabStop = False
    Caption = 'Capitaliza'
    Enabled = False
    TabOrder = 44
  end
  object rgCVE_TIPO_TASA: TRadioGroup
    Tag = 18
    Left = 2
    Top = 68
    Width = 575
    Height = 33
    HelpContext = 1251
    Caption = 'Tipo Tasa'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Tasa Variable'
      'Tasa Fija')
    TabOrder = 3
    TabStop = True
    OnClick = rgCVE_TIPO_TASAClick
    OnExit = rgCVE_TIPO_TASAExit
  end
  object btnCatNuevo: TButton
    Tag = 18
    Left = 40
    Top = 442
    Width = 75
    Height = 20
    HelpContext = 2001
    Caption = 'Calcula CA&T'
    TabOrder = 45
    OnClick = btnCatNuevoClick
    OnExit = btnCatNuevoExit
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesCancelar = InterForma1DespuesCancelar
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
    Left = 281
    Top = 2
  end
  object ilTASA_REFER: TInterLinkit
    Control = edCVE_TASA_REFER
    OnEjecuta = ilTASA_REFEREjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 147
    Top = 95
  end
  object ilCOMISION: TInterLinkit
    Control = edCVE_COMISION
    OnEjecuta = ilCOMISIONEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 176
    Top = 233
  end
end
