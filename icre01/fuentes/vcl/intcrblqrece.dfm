object WCrBlqRecep: TWCrBlqRecep
  Left = 262
  Top = 31
  Width = 662
  Height = 329
  Caption = 'Captura Manual de Bloqueos'
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
  object lbID_TRN_BLOQUEO: TLabel
    Left = 489
    Top = 6
    Width = 69
    Height = 13
    Caption = 'No. Operación'
  end
  object lbID_CREDITO: TLabel
    Left = 3
    Top = 6
    Width = 54
    Height = 13
    Caption = 'Disposición'
  end
  object lbF_OPERACION: TLabel
    Left = 459
    Top = 81
    Width = 61
    Height = 13
    Caption = 'F. Operación'
  end
  object lbIMP_A_BLOQUEAR: TLabel
    Left = 219
    Top = 81
    Width = 72
    Height = 13
    Caption = 'Imp A Bloquear'
  end
  object lbF_PROG_DESBLQ: TLabel
    Left = 459
    Top = 112
    Width = 76
    Height = 13
    Caption = 'F. Prog. Desblq.'
  end
  object lbSITUACION: TLabel
    Left = 219
    Top = 136
    Width = 58
    Height = 13
    Caption = 'Situación:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbSIT_BLQ_RECEP: TLabel
    Tag = 18
    Left = 321
    Top = 136
    Width = 4
    Height = 13
    Caption = '|'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbCUENTA_BANCO: TLabel
    Left = 5
    Top = 29
    Width = 76
    Height = 13
    Caption = 'Cuenta / Banco'
  end
  object Label3: TLabel
    Left = 3
    Top = 52
    Width = 66
    Height = 13
    Caption = 'Titular Cuenta'
  end
  object Label4: TLabel
    Left = 3
    Top = 156
    Width = 59
    Height = 13
    Caption = 'Comentario: '
  end
  object Label5: TLabel
    Left = 219
    Top = 112
    Width = 90
    Height = 13
    Caption = 'Periodo a Bloquear'
  end
  object edID_TRN_BLOQUEO: TEdit
    Left = 563
    Top = 2
    Width = 88
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
  end
  object edID_CREDITO: TEdit
    Tag = 530
    Left = 107
    Top = 2
    Width = 73
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    TabOrder = 0
    OnExit = edID_CREDITOExit
  end
  object dtpF_OPERACION: TInterDateTimePicker
    Tag = 18
    Left = 631
    Top = 77
    Width = 21
    Height = 21
    HelpContext = 6001
    CalAlignment = dtaLeft
    Date = 38499.3309836806
    Time = 38499.3309836806
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 6
    TabStop = False
    OnExit = edF_OPERACIONExit
    Edit = edF_OPERACION
    Formato = dfDate
  end
  object edF_OPERACION: TEdit
    Tag = 18
    Left = 539
    Top = 77
    Width = 90
    Height = 21
    HelpContext = 6000
    CharCase = ecUpperCase
    TabOrder = 5
    OnExit = edF_OPERACIONExit
  end
  object dtpF_PROG_DESBLQ: TInterDateTimePicker
    Tag = 18
    Left = 631
    Top = 108
    Width = 21
    Height = 21
    HelpContext = 7001
    CalAlignment = dtaLeft
    Date = 38499.3309838657
    Time = 38499.3309838657
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 8
    TabStop = False
    OnExit = edF_PROG_DESBLQExit
    Edit = edF_PROG_DESBLQ
    Formato = dfDate
  end
  object edF_PROG_DESBLQ: TEdit
    Tag = 18
    Left = 539
    Top = 108
    Width = 90
    Height = 21
    HelpContext = 7000
    CharCase = ecUpperCase
    TabOrder = 7
    OnExit = edF_PROG_DESBLQExit
  end
  object MsgPanel: TPanel
    Left = 2
    Top = 255
    Width = 650
    Height = 20
    TabOrder = 11
  end
  object PnDatos: TPanel
    Left = 2
    Top = 275
    Width = 650
    Height = 18
    TabOrder = 12
    object lbEmpresa: TLabel
      Left = 11
      Top = 1
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
      Top = 8
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
      Left = 280
      Top = 1
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
      Left = 280
      Top = 8
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
      Top = 8
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
      Left = 344
      Top = 8
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
      Left = 344
      Top = 1
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
      Top = 1
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
  object btCREDITO: TBitBtn
    Tag = 18
    Left = 182
    Top = 2
    Width = 22
    Height = 20
    HelpContext = 1002
    TabOrder = 1
    OnClick = btCREDITOClick
    OnExit = edID_CREDITOExit
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
  object edDESC_CREDITO: TEdit
    Left = 208
    Top = 2
    Width = 276
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 13
  end
  object edCUENTA_BANCO: TEdit
    Left = 128
    Top = 25
    Width = 162
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 14
  end
  object btCtaBanco: TBitBtn
    Tag = 18
    Left = 107
    Top = 25
    Width = 22
    Height = 20
    HelpContext = 2001
    TabOrder = 2
    OnClick = btCtaBancoClick
    OnExit = btCtaBancoExit
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
  object edBANCO: TEdit
    Left = 291
    Top = 25
    Width = 360
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 15
  end
  object edNOMBRE_TITULAR: TEdit
    Left = 107
    Top = 48
    Width = 544
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 16
  end
  object GroupBox1: TGroupBox
    Left = 3
    Top = 72
    Width = 206
    Height = 81
    Caption = 'Saldos Cuenta'
    TabOrder = 17
    object lbIMP_MIN_DEPOSITO: TLabel
      Left = 9
      Top = 16
      Width = 74
      Height = 13
      Caption = 'Sdo. Disponible'
    end
    object Label1: TLabel
      Left = 9
      Top = 37
      Width = 76
      Height = 13
      Caption = 'Sdo. Bloqueado'
    end
    object Label2: TLabel
      Left = 9
      Top = 60
      Width = 49
      Height = 13
      Caption = 'Sdo. Total'
    end
    object Bevel1: TBevel
      Left = 99
      Top = 54
      Width = 100
      Height = 2
    end
    object edSDO_DISPONIBLE: TInterEdit
      Left = 104
      Top = 12
      Width = 91
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
      TabOrder = 0
      ReadOnly = True
      UseReType = True
      UseSep = True
      UseDisplay = True
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edSDO_COMPROMETIDO: TInterEdit
      Left = 104
      Top = 33
      Width = 91
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
      UseReType = True
      UseSep = True
      UseDisplay = True
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edSDO_TOTAL: TInterEdit
      Left = 104
      Top = 56
      Width = 91
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
      UseReType = True
      UseSep = True
      UseDisplay = True
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object GroupBox2: TGroupBox
    Left = 3
    Top = 187
    Width = 649
    Height = 65
    Caption = 'Datos de control'
    TabOrder = 18
    object lbCVE_USU_ALTA: TLabel
      Left = 8
      Top = 20
      Width = 43
      Height = 13
      Caption = 'Usu. Alta'
    end
    object lbFH_CAPTURA: TLabel
      Left = 200
      Top = 20
      Width = 30
      Height = 13
      Caption = 'F. Alta'
    end
    object lbH_MODIFICA: TLabel
      Left = 504
      Top = 20
      Width = 49
      Height = 13
      Caption = 'F Modifica'
    end
    object lbCVE_USUARIO_MOD: TLabel
      Left = 352
      Top = 20
      Width = 52
      Height = 13
      Caption = 'Usua. Mod'
    end
    object lbCVE_USU_AUTORIZA: TLabel
      Left = 8
      Top = 42
      Width = 66
      Height = 13
      Caption = 'Usu. Autoriza.'
    end
    object lbH_AUTORIZACION: TLabel
      Left = 200
      Top = 42
      Width = 53
      Height = 13
      Caption = 'F. Autoriza.'
    end
    object lbH_CANCELA: TLabel
      Left = 504
      Top = 42
      Width = 48
      Height = 13
      Caption = 'F Cancela'
    end
    object lbCVE_USUARIO_CANC: TLabel
      Left = 352
      Top = 42
      Width = 53
      Height = 13
      Caption = 'Usu. Canc.'
    end
    object edCVE_USU_ALTA: TEdit
      Left = 120
      Top = 16
      Width = 73
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edF_ALTA: TEdit
      Left = 264
      Top = 16
      Width = 73
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edF_MODIFICA: TEdit
      Left = 568
      Top = 16
      Width = 73
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object edCVE_USUARIO_MOD: TEdit
      Left = 424
      Top = 16
      Width = 73
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edCVE_USU_AUTORIZA: TEdit
      Left = 120
      Top = 38
      Width = 73
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edF_AUTORIZACION: TEdit
      Left = 264
      Top = 38
      Width = 73
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object edF_CANCELA: TEdit
      Left = 568
      Top = 38
      Width = 73
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
    end
    object edCVE_USUARIO_CANC: TEdit
      Left = 424
      Top = 38
      Width = 73
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
  end
  object edIMP_A_BLOQUEAR: TInterEdit
    Tag = 18
    Left = 321
    Top = 77
    Width = 108
    Height = 21
    HelpContext = 4000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_A_BLOQUEARExit
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 3
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object mTX_NOTA: TMemo
    Tag = 18
    Left = 107
    Top = 156
    Width = 542
    Height = 30
    HelpContext = 8000
    MaxLength = 255
    ScrollBars = ssVertical
    TabOrder = 9
    OnExit = mTX_NOTAExit
  end
  object edNUM_PERIODO: TInterEdit
    Tag = 18
    Left = 321
    Top = 108
    Width = 108
    Height = 21
    HelpContext = 5000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    OnExit = edNUM_PERIODOExit
    DisplayMask = '###'
    MaxLength = 6
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
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesCancelar = InterForma1DespuesCancelar
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
    Left = 5
    Top = 10
  end
  object ilCREDITO: TInterLinkit
    Control = edID_CREDITO
    OnEjecuta = ilCREDITOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 240
  end
end
