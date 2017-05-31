object WCrEmisorProv: TWCrEmisorProv
  Left = 373
  Top = 69
  Width = 764
  Height = 631
  Caption = 'Relación Emisor - Proveedor'
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
    Left = 8
    Top = 33
    Width = 31
    Height = 13
    Caption = 'Emisor'
  end
  object lbID_PROVEEDOR: TLabel
    Left = 8
    Top = 57
    Width = 120
    Height = 13
    Caption = 'Proveedor / Iden Externo'
  end
  object lbID_PROMOTOR: TLabel
    Left = 8
    Top = 81
    Width = 108
    Height = 13
    Caption = 'Promotor Administrador'
  end
  object lbF_ALTA: TLabel
    Left = 48
    Top = 499
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object lbF_MODIFICA: TLabel
    Left = 48
    Top = 523
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object LBCVE_USU_ALTA: TLabel
    Left = 400
    Top = 499
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object lbCVE_USU_MODIFICA: TLabel
    Left = 400
    Top = 524
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object Label1: TLabel
    Left = 8
    Top = 105
    Width = 125
    Height = 13
    Caption = 'Riesgo Máximo Autorizado'
  end
  object Label2: TLabel
    Left = 400
    Top = 105
    Width = 89
    Height = 13
    Caption = 'Riesgo Acumulado'
  end
  object Label3: TLabel
    Left = 8
    Top = 9
    Width = 106
    Height = 13
    Caption = 'Entidad Descontadora'
  end
  object Label13: TLabel
    Left = 6
    Top = 128
    Width = 48
    Height = 13
    Caption = 'Sobretasa'
  end
  object edID_EMISOR: TEdit
    Tag = 562
    Left = 137
    Top = 29
    Width = 73
    Height = 21
    HelpContext = 1101
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 3
    OnExit = btEMISORExit
  end
  object edID_PROVEEDOR: TEdit
    Tag = 562
    Left = 137
    Top = 53
    Width = 73
    Height = 21
    HelpContext = 1201
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 6
    OnExit = edID_PROVEEDORExit
  end
  object edID_PROMOTOR: TEdit
    Left = 137
    Top = 77
    Width = 73
    Height = 21
    HelpContext = 1301
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 8
    ReadOnly = True
    TabOrder = 10
    OnExit = edID_PROMOTORExit
  end
  object rgSIT_EMISOR_PROV: TRadioGroup
    Tag = 18
    Left = 8
    Top = 164
    Width = 537
    Height = 33
    HelpContext = 1500
    Caption = 'Situación relación Emisor - Proveedor'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Inactivo')
    TabOrder = 15
    TabStop = True
    OnExit = rgSIT_EMISOR_PROVExit
  end
  object btEMISOR: TBitBtn
    Tag = 50
    Left = 212
    Top = 29
    Width = 22
    Height = 20
    HelpContext = 1102
    TabOrder = 4
    OnClick = btEMISORClick
    OnExit = btEMISORExit
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
    Tag = 50
    Left = 212
    Top = 53
    Width = 22
    Height = 20
    HelpContext = 1202
    TabOrder = 7
    OnClick = btPROVEEDORClick
    OnExit = edID_PROVEEDORExit
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
  object btPROMOTOR: TBitBtn
    Tag = 18
    Left = 212
    Top = 77
    Width = 22
    Height = 20
    HelpContext = 1302
    TabOrder = 11
    OnClick = btPROMOTORClick
    OnExit = edID_PROMOTORExit
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
  object edNOM_PROMOTOR: TEdit
    Left = 241
    Top = 77
    Width = 488
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 12
  end
  object edNOM_PROVEEDOR: TEdit
    Left = 312
    Top = 53
    Width = 417
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 9
  end
  object edNOM_EMISOR: TEdit
    Left = 241
    Top = 29
    Width = 488
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object edF_MODIFICA: TEdit
    Left = 167
    Top = 520
    Width = 103
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 19
  end
  object edF_ALTA: TEdit
    Left = 167
    Top = 495
    Width = 103
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 17
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 577
    Top = 520
    Width = 106
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 20
  end
  object edCVE_USU_ALTA: TEdit
    Left = 577
    Top = 495
    Width = 106
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 18
  end
  object MsgPanel: TPanel
    Left = 1
    Top = 553
    Width = 728
    Height = 21
    TabOrder = 21
  end
  object PnDatos: TPanel
    Left = 1
    Top = 574
    Width = 728
    Height = 21
    TabOrder = 22
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
  object edID_PROV_EXTERNO: TEdit
    Left = 241
    Top = 53
    Width = 71
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 8
    ReadOnly = True
    TabOrder = 8
    OnExit = edID_PROVEEDORExit
  end
  object edRIESGO_MAXIMO: TInterEdit
    Tag = 18
    Left = 137
    Top = 101
    Width = 93
    Height = 21
    HelpContext = 1400
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edRIESGO_MAXIMOExit
    DisplayMask = '###,##0.00'
    MaxLength = 12
    TabOrder = 13
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edRIESGO_ACUMULADO: TInterEdit
    Left = 497
    Top = 101
    Width = 104
    Height = 21
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,##0.00'
    MaxLength = 12
    Color = clBtnFace
    TabOrder = 14
    ReadOnly = True
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object BitBtn4: TBitBtn
    Tag = 17
    Left = 563
    Top = 170
    Width = 158
    Height = 25
    Caption = 'Agrupar proveedores'
    TabOrder = 16
    TabStop = False
    OnClick = BitBtn4Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
      FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
      990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
      990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
      FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
      00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
      00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
      00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
      03FF33337FFF77777333333300000333333F3333777773333333}
    NumGlyphs = 2
  end
  object edCVE_FND_ENT_DES: TEdit
    Tag = 562
    Left = 137
    Top = 5
    Width = 73
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 0
    OnExit = edCVE_FND_ENT_DESExit
  end
  object btnCVE_FND_ENT_DES: TBitBtn
    Tag = 50
    Left = 212
    Top = 5
    Width = 22
    Height = 20
    HelpContext = 1002
    TabOrder = 1
    OnClick = btnCVE_FND_ENT_DESClick
    OnExit = edCVE_FND_ENT_DESExit
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
  object edDESC_ENT_DES: TEdit
    Left = 241
    Top = 5
    Width = 488
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object GBAutorizacion: TGroupBox
    Left = 8
    Top = 208
    Width = 721
    Height = 137
    Caption = 'Informacion de la Linea'
    TabOrder = 23
    object Shape6: TShape
      Left = 13
      Top = 24
      Width = 82
      Height = 25
      Brush.Color = 12320767
    end
    object Shape7: TShape
      Left = 94
      Top = 24
      Width = 112
      Height = 25
      Brush.Color = 12320767
    end
    object Shape8: TShape
      Left = 205
      Top = 24
      Width = 112
      Height = 25
      Brush.Color = 12320767
    end
    object Shape9: TShape
      Left = 316
      Top = 24
      Width = 113
      Height = 25
      Brush.Color = 12320767
    end
    object Shape10: TShape
      Left = 427
      Top = 24
      Width = 93
      Height = 25
      Brush.Color = 12320767
    end
    object Label14: TLabel
      Left = 16
      Top = 31
      Width = 81
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Linea'
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
    object Label10: TLabel
      Left = 96
      Top = 31
      Width = 105
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Fecha de Vento.'
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
    object Label15: TLabel
      Left = 208
      Top = 31
      Width = 105
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Disponible'
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
    object Label12: TLabel
      Left = 320
      Top = 31
      Width = 105
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Riesgo Total'
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
    object Label4: TLabel
      Left = 424
      Top = 31
      Width = 97
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Situacion'
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
    object Shape11: TShape
      Left = 519
      Top = 24
      Width = 110
      Height = 25
      Brush.Color = 12320767
    end
    object Label9: TLabel
      Left = 520
      Top = 31
      Width = 105
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Moneda'
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
    object strgrdCont: TStringGrid
      Left = 13
      Top = 48
      Width = 622
      Height = 73
      BiDiMode = bdRightToLeft
      ColCount = 1
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      ParentBiDiMode = False
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      OnDrawCell = strgrdContDrawCell
    end
  end
  object GBchequera: TGroupBox
    Left = 8
    Top = 352
    Width = 721
    Height = 137
    Caption = 'Informacion de Chequera'
    TabOrder = 24
    object Shape2: TShape
      Left = 13
      Top = 24
      Width = 122
      Height = 25
      Brush.Color = 12320767
    end
    object Label5: TLabel
      Left = 16
      Top = 31
      Width = 121
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Chequera'
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
    object Shape1: TShape
      Left = 134
      Top = 24
      Width = 255
      Height = 25
      Brush.Color = 12320767
    end
    object Shape3: TShape
      Left = 388
      Top = 24
      Width = 110
      Height = 25
      Brush.Color = 12320767
    end
    object Shape4: TShape
      Left = 566
      Top = 24
      Width = 70
      Height = 25
      Brush.Color = 12320767
    end
    object Label6: TLabel
      Left = 144
      Top = 31
      Width = 249
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Persona'
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
    object Label7: TLabel
      Left = 568
      Top = 31
      Width = 65
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Situacion'
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
    object Label8: TLabel
      Left = 392
      Top = 31
      Width = 105
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Tipo Chequera'
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
    object Shape5: TShape
      Left = 497
      Top = 24
      Width = 70
      Height = 25
      Brush.Color = 12320767
    end
    object Label11: TLabel
      Left = 496
      Top = 31
      Width = 73
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Bloqueada'
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
    object Shape12: TShape
      Left = 635
      Top = 24
      Width = 70
      Height = 25
      Brush.Color = 12320767
    end
    object Label16: TLabel
      Left = 640
      Top = 31
      Width = 65
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Sit. Ctto.'
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
    object strgrdCheq: TStringGrid
      Left = 13
      Top = 48
      Width = 693
      Height = 73
      BiDiMode = bdRightToLeft
      ColCount = 1
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      ParentBiDiMode = False
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      OnDrawCell = strgrdCheqDrawCell
    end
  end
  object edSOBRETASA: TInterEdit
    Tag = 18
    Left = 137
    Top = 124
    Width = 93
    Height = 21
    HelpContext = 1401
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edSOBRETASAExit
    DisplayMask = '###,##0.00'
    MaxLength = 12
    TabOrder = 25
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
    FormaEstilo = feHorizontal
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
    Left = 538
    Top = 24
  end
  object ilPROVEEDOR: TInterLinkit
    Control = edID_PROVEEDOR
    OnEjecuta = ilPROVEEDOREjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilPROVEEDORCapture
    Left = 248
    Top = 47
  end
  object ilPROMOTOR: TInterLinkit
    OnEjecuta = ilPROMOTOREjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilPROMOTORCapture
    Left = 248
    Top = 79
  end
  object ilEMISOR: TInterLinkit
    Control = edID_EMISOR
    OnEjecuta = ilEMISOREjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilEMISORCapture
    Left = 248
    Top = 23
  end
  object ilCVE_FND_ENT_DES: TInterLinkit
    Control = edCVE_FND_ENT_DES
    OnEjecuta = ilCVE_FND_ENT_DESEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCVE_FND_ENT_DESCapture
    Left = 248
    Top = 65535
  end
  object spBLOQUEO: TStoredProc
    StoredProcName = 'PKGADMCTA.FUN_REVISAEXCEP'
    Left = 120
    Top = 520
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFECHA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PSRESULT'
        ParamType = ptResult
      end>
  end
end
