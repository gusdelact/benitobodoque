object WCrRelPag: TWCrRelPag
  Left = 320
  Top = 128
  Width = 622
  Height = 537
  Caption = 'Relación de Pagaré - Disposición'
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
  object Label1: TLabel
    Left = 9
    Top = 7
    Width = 74
    Height = 13
    Caption = 'No. Disposición'
  end
  object Label2: TLabel
    Left = 9
    Top = 56
    Width = 54
    Height = 13
    Caption = 'No. Pagaré'
  end
  object lbF_ALTA: TLabel
    Left = 16
    Top = 274
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object lbF_MODIFICA: TLabel
    Left = 16
    Top = 295
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object LBCVE_USU_ALTA: TLabel
    Left = 312
    Top = 274
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object lbCVE_USU_MODIFICA: TLabel
    Left = 312
    Top = 296
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object lblIMP_CREDITO: TLabel
    Left = 442
    Top = 8
    Width = 56
    Height = 13
    Caption = 'Imp. Crédito'
  end
  object lblCVE_ORIGEN: TLabel
    Left = 9
    Top = 31
    Width = 71
    Height = 13
    Caption = 'Sistema Origen'
  end
  object lblCVE_MDO_OBJETIVO: TLabel
    Left = 183
    Top = 31
    Width = 84
    Height = 13
    Caption = 'Mercado Objetivo'
  end
  object PnDatos: TPanel
    Left = 5
    Top = 468
    Width = 592
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
      Left = 300
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
      Left = 300
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
  object edID_CREDITO: TEdit
    Tag = 562
    Left = 87
    Top = 4
    Width = 64
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 0
  end
  object btnID_CREDITO: TBitBtn
    Tag = 50
    Left = 153
    Top = 5
    Width = 22
    Height = 20
    HelpContext = 1002
    TabOrder = 1
    OnClick = btnID_CREDITOClick
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
  object edNOM_CREDITO: TEdit
    Left = 177
    Top = 4
    Width = 262
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object edID_PAGARE: TEdit
    Left = 177
    Top = 51
    Width = 77
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 6
    ReadOnly = True
    TabOrder = 8
  end
  object edNOM_PAGARE: TEdit
    Left = 255
    Top = 51
    Width = 339
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 9
  end
  object btnID_PAGARE: TBitBtn
    Tag = 50
    Left = 153
    Top = 50
    Width = 22
    Height = 20
    HelpContext = 1002
    TabOrder = 7
    OnClick = btnID_PAGAREClick
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
  object rgSIT_REL_PAG_DISP: TRadioGroup
    Left = 7
    Top = 236
    Width = 468
    Height = 32
    HelpContext = 5001
    Caption = 'Situación relación Pagaré - Disposición'
    Columns = 2
    Enabled = False
    Items.Strings = (
      'Activo'
      'Cancelado')
    TabOrder = 11
    TabStop = True
  end
  object edF_MODIFICA: TEdit
    Left = 135
    Top = 292
    Width = 103
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 14
  end
  object edF_ALTA: TEdit
    Left = 135
    Top = 270
    Width = 103
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 13
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 489
    Top = 292
    Width = 106
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 16
  end
  object edCVE_USU_ALTA: TEdit
    Left = 489
    Top = 270
    Width = 106
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 15
  end
  object rgbxPagare: TGroupBox
    Left = 7
    Top = 118
    Width = 590
    Height = 119
    Caption = 'Datos del Pagaré'
    TabOrder = 10
    object lblFH_REGISTRO: TLabel
      Left = 5
      Top = 22
      Width = 64
      Height = 16
      AutoSize = False
      Caption = 'F.  Registro'
      WordWrap = True
    end
    object lblF_APERTURA: TLabel
      Left = 170
      Top = 22
      Width = 76
      Height = 18
      AutoSize = False
      Caption = 'F. Apertura Inv.'
      WordWrap = True
    end
    object lblF_VENCIMIENTO: TLabel
      Left = 347
      Top = 22
      Width = 72
      Height = 16
      AutoSize = False
      Caption = 'F. Vencimiento'
      WordWrap = True
    end
    object lblDIAS_PLAZO: TLabel
      Left = 519
      Top = 22
      Width = 32
      Height = 16
      AutoSize = False
      Caption = 'Plazo'
      WordWrap = True
    end
    object lblIMP_CAPITAL: TLabel
      Left = 5
      Top = 47
      Width = 41
      Height = 16
      AutoSize = False
      Caption = 'Capital'
      WordWrap = True
    end
    object lblIMP_INT_VTO: TLabel
      Left = 170
      Top = 39
      Width = 73
      Height = 27
      AutoSize = False
      Caption = 'Interés al Vencimiento'
      WordWrap = True
    end
    object lblTASA_NETA: TLabel
      Left = 347
      Top = 45
      Width = 58
      Height = 16
      AutoSize = False
      Caption = 'Tasa Neta'
      WordWrap = True
    end
    object lblPCT_ISR: TLabel
      Left = 5
      Top = 71
      Width = 41
      Height = 16
      AutoSize = False
      Caption = 'ISR'
      WordWrap = True
    end
    object lblIMP_NETO_VTO: TLabel
      Left = 170
      Top = 72
      Width = 72
      Height = 16
      AutoSize = False
      Caption = 'Neto al Vto.'
      WordWrap = True
    end
    object lblCVE_SIT_PAGARE: TLabel
      Left = 347
      Top = 72
      Width = 72
      Height = 16
      AutoSize = False
      Caption = 'Sit. Pagaré'
      WordWrap = True
    end
    object lblCVE_IMP_RENOV: TLabel
      Left = 5
      Top = 95
      Width = 92
      Height = 16
      AutoSize = False
      Caption = 'Clave a Renovar'
      WordWrap = True
    end
    object lblIMP_RENOVAR: TLabel
      Left = 347
      Top = 95
      Width = 70
      Height = 16
      AutoSize = False
      Caption = 'Imp. Renovar'
      WordWrap = True
    end
    object cbxCVE_IMP_RENOV: TComboBox
      Left = 100
      Top = 91
      Width = 227
      Height = 21
      TabStop = False
      Color = clBtnFace
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 13
    end
    object edFH_REGISTRO: TEdit
      Left = 65
      Top = 18
      Width = 80
      Height = 21
      HelpContext = 5101
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object dtpFH_REGISTRO: TInterDateTimePicker
      Left = 143
      Top = 18
      Width = 21
      Height = 21
      HelpContext = 5102
      CalAlignment = dtaLeft
      Date = 37781.35659625
      Time = 37781.35659625
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      TabStop = False
      Edit = edFH_REGISTRO
      Formato = dfDate
    end
    object edF_APERTURA: TEdit
      Left = 246
      Top = 20
      Width = 77
      Height = 21
      HelpContext = 5101
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object dtpF_APERTURA: TInterDateTimePicker
      Left = 320
      Top = 20
      Width = 21
      Height = 21
      HelpContext = 5102
      CalAlignment = dtaLeft
      Date = 37781.35659625
      Time = 37781.35659625
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      TabStop = False
      Edit = edF_APERTURA
      Formato = dfDate
    end
    object edF_VENCIMIENTO: TEdit
      Left = 420
      Top = 20
      Width = 77
      Height = 21
      HelpContext = 5101
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object dtpF_VENCIMIENTO: TInterDateTimePicker
      Left = 494
      Top = 20
      Width = 21
      Height = 21
      HelpContext = 5102
      CalAlignment = dtaLeft
      Date = 37781.35659625
      Time = 37781.35659625
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 5
      TabStop = False
      Edit = edF_VENCIMIENTO
      Formato = dfDate
    end
    object edIMP_CAPITAL: TInterEdit
      Left = 66
      Top = 44
      Width = 96
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 7
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_INT_VTO: TInterEdit
      Left = 246
      Top = 44
      Width = 96
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 8
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edTASA_NETA: TInterEdit
      Left = 420
      Top = 44
      Width = 96
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.000000'
      MaxLength = 18
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 9
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edPCT_ISR: TInterEdit
      Left = 66
      Top = 68
      Width = 96
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      Color = clBtnFace
      TabOrder = 10
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_NETO_VTO: TInterEdit
      Left = 246
      Top = 68
      Width = 97
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      Color = clBtnFace
      TabOrder = 11
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edDIAS_PLAZO: TInterEdit
      Left = 551
      Top = 20
      Width = 30
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0'
      MaxLength = 18
      Color = clBtnFace
      TabOrder = 6
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object cbxCVE_SIT_PAGARE: TComboBox
      Left = 420
      Top = 67
      Width = 163
      Height = 21
      TabStop = False
      Color = clBtnFace
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 12
    end
    object edIMP_RENOVAR: TInterEdit
      Left = 420
      Top = 91
      Width = 82
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      Color = clBtnFace
      TabOrder = 14
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object icpCONTRATO: TInterCtoPanel
    Left = 7
    Top = 75
    Width = 591
    Height = 45
    Hint = 'Información del Contrato'
    Lenguaje = 0
    ShowLenguaje = False
    ShowEnviarEMail = False
  end
  object btnCancela: TBitBtn
    Tag = 17
    Left = 475
    Top = 242
    Width = 121
    Height = 26
    Caption = 'Cancela'
    Enabled = False
    TabOrder = 12
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
  object grpbxPagare: TGroupBox
    Left = 6
    Top = 313
    Width = 590
    Height = 155
    TabOrder = 17
    object sgcDATOS: TStringAlignGrid
      Left = 5
      Top = 25
      Width = 579
      Height = 125
      ColCount = 13
      DefaultRowHeight = 16
      FixedColor = clInfoBk
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
      TabOrder = 0
      OnSelectCell = sgcDATOSSelectCell
      ColWidths = (
        0
        58
        70
        188
        90
        90
        80
        80
        80
        80
        80
        64
        64)
      Cells = (
        1
        0
        'Contrato'
        2
        0
        'No. Pagaré'
        3
        0
        'Nombre del Titular'
        4
        0
        'Imp. Neto al Corte'
        5
        0
        'Imp. Neto al Vto.'
        6
        0
        'F. Apertura'
        7
        0
        'F. Vencimiento'
        8
        0
        'Imp. Capítal'
        9
        0
        'Imp. Interés.'
        10
        0
        'Imp. Renovar'
        11
        0
        'Tasa'
        12
        0
        'Sit. Pagaré')
      PropCell = ()
      PropCol = (
        1
        1
        1
        0
        2
        1
        1
        0
        3
        1
        1
        0
        4
        1
        0
        0
        5
        1
        0
        0
        6
        1
        2
        0
        7
        1
        2
        0
        10
        1
        0
        0
        11
        1
        0
        0
        12
        1
        2
        0)
      PropRow = ()
      PropFixedCol = ()
      PropFixedRow = (
        0
        1
        2
        0)
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 76
    Width = 67
    Height = 17
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 'Cto. Pagaré'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 20
  end
  object edIMP_CREDITO: TInterEdit
    Left = 499
    Top = 4
    Width = 94
    Height = 21
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 18
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 3
    ReadOnly = True
    UseReType = False
    UseSep = False
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edDESC_ORIGEN: TEdit
    Left = 87
    Top = 28
    Width = 90
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object edCVE_PRESUPUESTO: TEdit
    Left = 272
    Top = 27
    Width = 65
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object edDESC_PRESUPUESTO: TEdit
    Left = 338
    Top = 27
    Width = 255
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesCancelar = InterForma1DespuesCancelar
    OnDespuesAceptar = InterForma1DespuesAceptar
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
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    OnDespuesShow = InterForma1DespuesShow
    Left = 565
    Top = 291
  end
  object ilID_CREDITO: TInterLinkit
    Tag = 50
    Control = edID_CREDITO
    OnEjecuta = ilID_CREDITOEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    OnCapture = ilID_CREDITOCapture
    Left = 253
    Top = 65535
  end
end
