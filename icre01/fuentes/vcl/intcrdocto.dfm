object WCrDocto: TWCrDocto
  Left = 551
  Top = 177
  Width = 554
  Height = 518
  Caption = 'Alta Documento'
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
  object lbSITUACION: TLabel
    Left = 404
    Top = 389
    Width = 32
    Height = 13
    Caption = 'Sit. : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbSIT_DOCUMENTO: TLabel
    Tag = 18
    Left = 436
    Top = 389
    Width = 5
    Height = 13
    Caption = '|'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbCVE_EMISOR_NAFIN: TLabel
    Left = 9
    Top = 48
    Width = 49
    Height = 13
    Caption = 'Proveedor'
  end
  object MsgPanel: TPanel
    Left = 0
    Top = 443
    Width = 545
    Height = 25
    TabOrder = 14
  end
  object PnDatos: TPanel
    Left = 0
    Top = 468
    Width = 545
    Height = 21
    TabOrder = 15
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
  object GroupBox4: TGroupBox
    Left = -1
    Top = 384
    Width = 402
    Height = 60
    Caption = 'Registro'
    TabOrder = 11
    object lbF_ALTA: TLabel
      Left = 5
      Top = 39
      Width = 30
      Height = 13
      Caption = 'F. Alta'
    end
    object lbF_MODIF: TLabel
      Left = 124
      Top = 39
      Width = 52
      Height = 13
      Caption = 'F. Modifica'
    end
    object lbUSUA_ALTA: TLabel
      Left = 5
      Top = 16
      Width = 43
      Height = 13
      Caption = 'Usu. Alta'
    end
    object lbUSUA_MODIF: TLabel
      Left = 124
      Top = 15
      Width = 65
      Height = 13
      Caption = 'Usu. Modifica'
    end
    object lbUSUA_AUTOR: TLabel
      Left = 262
      Top = 15
      Width = 63
      Height = 13
      Caption = 'Usu. Autoriza'
    end
    object lbF_AUTOR: TLabel
      Left = 262
      Top = 39
      Width = 50
      Height = 13
      Caption = 'F. Autoriza'
    end
    object edF_ALTA: TEdit
      Left = 50
      Top = 35
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edF_MODIF: TEdit
      Left = 190
      Top = 35
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edCVE_USUA_ALTA: TEdit
      Left = 50
      Top = 12
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edCVE_USUA_MODIF: TEdit
      Left = 190
      Top = 11
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object edCVE_USUA_AUTOR: TEdit
      Left = 326
      Top = 11
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edF_AUTOR: TEdit
      Left = 326
      Top = 35
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
  end
  object GroupBox1: TGroupBox
    Left = -1
    Top = 63
    Width = 546
    Height = 79
    Caption = 'Configuración del Documento'
    TabOrder = 3
    object lbID_CESION: TLabel
      Left = 8
      Top = 33
      Width = 32
      Height = 13
      Caption = 'Cesión'
    end
    object lbID_DOCUMENTO: TLabel
      Left = 8
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Documento'
    end
    object lbNUM_PERIODO_DOC: TLabel
      Left = 364
      Top = 16
      Width = 93
      Height = 13
      Caption = 'No. Doc por Cesión'
    end
    object lbCVE_DOCUMENTO: TLabel
      Left = 8
      Top = 54
      Width = 79
      Height = 13
      Caption = 'Tipo Documento'
    end
    object btCVE_DOCTO: TBitBtn
      Tag = 18
      Left = 182
      Top = 53
      Width = 22
      Height = 20
      HelpContext = 3002
      TabOrder = 6
      OnClick = btCVE_DOCTOClick
      OnExit = edCVE_DOCUMENTOExit
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
    object edDESC_TIPO_DOCTO: TEdit
      Left = 207
      Top = 54
      Width = 333
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object edID_CESION: TEdit
      Tag = 562
      Left = 104
      Top = 33
      Width = 73
      Height = 21
      HelpContext = 2001
      CharCase = ecUpperCase
      TabOrder = 2
      OnExit = edIDCESIONExit
    end
    object edID_DOCUMENTO: TEdit
      Tag = 50
      Left = 104
      Top = 12
      Width = 257
      Height = 21
      HelpContext = 1001
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 0
      OnEnter = edID_DOCUMENTOEnter
      OnExit = edID_DOCUMENTOExit
    end
    object edNUM_PERIODO_DOC: TEdit
      Left = 462
      Top = 12
      Width = 78
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edCVE_DOCUMENTO: TEdit
      Tag = 530
      Left = 104
      Top = 54
      Width = 73
      Height = 21
      HelpContext = 3001
      CharCase = ecUpperCase
      TabOrder = 5
      OnExit = edCVE_DOCUMENTOExit
    end
    object btCESION: TBitBtn
      Tag = 50
      Left = 182
      Top = 32
      Width = 22
      Height = 20
      HelpContext = 2002
      TabOrder = 3
      OnClick = btCESIONClick
      OnExit = edIDCESIONExit
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
    object edTITULAR: TEdit
      Left = 207
      Top = 33
      Width = 333
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
  end
  object icpCONTRATO: TInterCtoPanel
    Left = 6
    Top = 0
    Width = 539
    Height = 45
    Hint = 'Información del Contrato'
    Lenguaje = 0
    ShowLenguaje = False
    ShowEnviarEMail = False
  end
  object edCVE_PROV: TEdit
    Left = 106
    Top = 45
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 6
    ReadOnly = True
    TabOrder = 0
  end
  object edNOMBRE_PROV: TEdit
    Left = 262
    Top = 45
    Width = 282
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 100
    ReadOnly = True
    TabOrder = 2
  end
  object edID_NAFINSA: TEdit
    Left = 184
    Top = 45
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 6
    ReadOnly = True
    TabOrder = 1
  end
  object GroupBox3: TGroupBox
    Left = -1
    Top = 176
    Width = 195
    Height = 161
    Caption = 'Fechas'
    TabOrder = 6
    object Bevel3: TBevel
      Left = 3
      Top = 94
      Width = 190
      Height = 2
    end
    object Label10: TLabel
      Left = 6
      Top = 103
      Width = 84
      Height = 13
      Caption = 'Plazo Documento'
    end
    object btCALCULA_DIAS: TSpeedButton
      Left = 170
      Top = 98
      Width = 19
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
      OnClick = btCALCULA_DIASClick
    end
    object Label11: TLabel
      Left = 6
      Top = 72
      Width = 85
      Height = 13
      Caption = 'F de Vencimiento '
    end
    object Bevel4: TBevel
      Left = 1
      Top = 127
      Width = 193
      Height = 4
    end
    object Label3: TLabel
      Left = 5
      Top = 139
      Width = 66
      Height = 13
      Caption = 'F Programada'
    end
    object lbF_EMISION: TLabel
      Left = 6
      Top = 18
      Width = 69
      Height = 13
      Caption = 'Fecha Emisión'
    end
    object lbF_COMPRA: TLabel
      Left = 6
      Top = 44
      Width = 69
      Height = 13
      Caption = 'Fecha Compra'
    end
    object edF_VENCIMIENTO: TEdit
      Tag = 18
      Left = 96
      Top = 68
      Width = 73
      Height = 21
      HelpContext = 5201
      TabOrder = 4
      OnExit = edF_VENCIMIENTOExit
    end
    object InterDateTimePicker3: TInterDateTimePicker
      Tag = 18
      Left = 169
      Top = 68
      Width = 21
      Height = 21
      HelpContext = 5202
      CalAlignment = dtaLeft
      Date = 37777.7691627546
      Time = 37777.7691627546
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 5
      TabStop = False
      OnExit = edF_VENCIMIENTOExit
      Edit = edF_VENCIMIENTO
      Formato = dfDate
    end
    object edF_PROGRAMADA: TEdit
      Left = 96
      Top = 135
      Width = 73
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object edF_EMISION: TEdit
      Tag = 18
      Left = 96
      Top = 14
      Width = 73
      Height = 21
      HelpContext = 5001
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = edF_EMISIONExit
    end
    object dtpF_EMISION: TInterDateTimePicker
      Tag = 18
      Left = 169
      Top = 14
      Width = 21
      Height = 21
      HelpContext = 5002
      CalAlignment = dtaLeft
      Date = 37805.5239350116
      Time = 37805.5239350116
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      TabStop = False
      OnExit = edF_EMISIONExit
      Edit = edF_EMISION
      Formato = dfDate
    end
    object edF_COMPRA: TEdit
      Tag = 18
      Left = 96
      Top = 40
      Width = 73
      Height = 21
      HelpContext = 5101
      CharCase = ecUpperCase
      TabOrder = 2
      OnExit = edF_COMPRAExit
    end
    object dtpF_COMPRA: TInterDateTimePicker
      Tag = 18
      Left = 169
      Top = 40
      Width = 21
      Height = 21
      HelpContext = 5102
      CalAlignment = dtaLeft
      Date = 37805.5239350116
      Time = 37805.5239350116
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      TabStop = False
      OnExit = edF_COMPRAExit
      Edit = edF_COMPRA
      Formato = dfDate
    end
    object edPLAZO_DOCTO: TInterEdit
      Tag = 18
      Left = 96
      Top = 99
      Width = 73
      Height = 21
      HelpContext = 5301
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      OnExit = edPLAZO_DOCTOExit
      DisplayMask = '###0'
      MaxLength = 6
      Font.Charset = DEFAULT_CHARSET
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
  end
  object rgCVE_TIPO_INTERES: TRadioGroup
    Left = 0
    Top = 142
    Width = 361
    Height = 33
    HelpContext = 4001
    Caption = 'Tipo de Interés'
    Columns = 2
    Enabled = False
    Items.Strings = (
      'Al Inicio'
      'Al Vencimiento')
    TabOrder = 4
  end
  object GroupBox2: TGroupBox
    Left = 197
    Top = 176
    Width = 164
    Height = 162
    Caption = 'Tasas'
    TabOrder = 7
    object Bevel1: TBevel
      Left = 1
      Top = 62
      Width = 161
      Height = 2
    end
    object Bevel2: TBevel
      Left = 1
      Top = 93
      Width = 162
      Height = 4
    end
    object lbTASA_FONDEO: TLabel
      Left = 4
      Top = 18
      Width = 51
      Height = 13
      Caption = 'Tasa Base'
    end
    object lbSOBRETASA: TLabel
      Left = 4
      Top = 43
      Width = 48
      Height = 13
      Caption = 'Sobretasa'
    end
    object lbTASA_DESCUENTO: TLabel
      Left = 4
      Top = 71
      Width = 69
      Height = 13
      Caption = 'Tasa Int/Desc'
    end
    object lbTASA_AFORO: TLabel
      Left = 4
      Top = 107
      Width = 36
      Height = 13
      Caption = '% Aforo'
    end
    object lbTASA_COMISION: TLabel
      Left = 5
      Top = 138
      Width = 76
      Height = 13
      Caption = '% Comis. Emisor'
    end
    object Bevel5: TBevel
      Left = 1
      Top = 127
      Width = 162
      Height = 4
    end
    object edTASA_FONDEO: TInterEdit
      Left = 86
      Top = 14
      Width = 75
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,##0.0000'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 0
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edSOBRETASA: TInterEdit
      Tag = 18
      Left = 86
      Top = 39
      Width = 73
      Height = 21
      HelpContext = 6010
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edSOBRETASAExit
      DisplayMask = '###,##0.0000'
      MaxLength = 12
      Font.Charset = DEFAULT_CHARSET
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
    object edTASA_DESCUENTO: TInterEdit
      Tag = 18
      Left = 86
      Top = 67
      Width = 73
      Height = 21
      HelpContext = 6020
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edTASA_DESCUENTOExit
      DisplayMask = '###,##0.0000'
      MaxLength = 12
      TabOrder = 2
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edTASA_AFORO: TInterEdit
      Left = 86
      Top = 103
      Width = 73
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      TabOrder = 3
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edTASA_COMISION: TInterEdit
      Left = 86
      Top = 134
      Width = 73
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
  object GroupBox5: TGroupBox
    Left = 363
    Top = 176
    Width = 182
    Height = 97
    Caption = 'Documento'
    TabOrder = 8
    object Label1: TLabel
      Left = 5
      Top = 76
      Width = 55
      Height = 13
      Caption = 'Remanente'
    end
    object lbIMP_NOMINAL: TLabel
      Left = 5
      Top = 13
      Width = 76
      Height = 13
      Caption = 'Importe Nominal'
    end
    object lbIMP_COMPRA: TLabel
      Left = 5
      Top = 55
      Width = 74
      Height = 13
      Caption = 'Importe Compra'
    end
    object Label2: TLabel
      Left = 5
      Top = 29
      Width = 68
      Height = 26
      Caption = 'Imp. Aforado / VPN'
      WordWrap = True
    end
    object edREMANENTE: TInterEdit
      Left = 85
      Top = 73
      Width = 93
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      TabOrder = 3
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_COMPRA: TInterEdit
      Left = 85
      Top = 52
      Width = 93
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      TabOrder = 2
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_NOMINAL: TInterEdit
      Tag = 18
      Left = 85
      Top = 10
      Width = 93
      Height = 21
      HelpContext = 7001
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edIMP_NOMINALExit
      DisplayMask = '###,###,###,##0.00'
      MaxLength = 12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 0
      UseReType = True
      UseSep = True
      UseDisplay = True
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_AFORADO: TInterEdit
      Left = 85
      Top = 31
      Width = 93
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      TabOrder = 1
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object GroupBox6: TGroupBox
    Left = 363
    Top = 273
    Width = 182
    Height = 65
    Caption = 'Total Documentos por Cesión'
    TabOrder = 9
    object Label7: TLabel
      Left = 5
      Top = 20
      Width = 64
      Height = 13
      Caption = 'Total Aforado'
    end
    object Label8: TLabel
      Left = 5
      Top = 43
      Width = 63
      Height = 13
      Caption = 'Total Compra'
    end
    object edTOTAL_COMPRA: TInterEdit
      Left = 82
      Top = 38
      Width = 93
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      TabOrder = 0
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edTOTAL_NOMINAL: TInterEdit
      Left = 82
      Top = 15
      Width = 93
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      TabOrder = 1
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object btCANCELA_DOCTO: TBitBtn
    Tag = 17
    Left = 404
    Top = 402
    Width = 141
    Height = 21
    Caption = 'Cancelación Docto.'
    TabOrder = 12
    OnClick = btCANCELA_DOCTOClick
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
  object btCANCELA_BLOQUE: TBitBtn
    Tag = 17
    Left = 404
    Top = 422
    Width = 141
    Height = 21
    Caption = 'Búsqueda en Bloque'
    TabOrder = 13
    OnClick = btCANCELA_BLOQUEClick
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
  object cbB_ALAMBRADA: TCheckBox
    Tag = 18
    Left = 370
    Top = 153
    Width = 171
    Height = 17
    HelpContext = 4501
    Alignment = taLeftJustify
    Caption = 'Aplica Tasa Alambrada'
    TabOrder = 5
    OnExit = cbB_ALAMBRADAExit
  end
  object GroupBox7: TGroupBox
    Left = -1
    Top = 341
    Width = 546
    Height = 43
    Caption = 'Emisor'
    TabOrder = 10
    object Label4: TLabel
      Left = 8
      Top = 18
      Width = 68
      Height = 13
      Caption = 'Fecha Ingreso'
    end
    object Label5: TLabel
      Left = 203
      Top = 18
      Width = 51
      Height = 13
      Caption = 'Días Pago'
    end
    object Label6: TLabel
      Left = 347
      Top = 18
      Width = 95
      Height = 13
      Caption = 'F. Vencimiento Real'
    end
    object edDias_pago: TEdit
      Left = 261
      Top = 14
      Width = 75
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object edF_INGRESO: TEdit
      Tag = 530
      Left = 96
      Top = 14
      Width = 73
      Height = 21
      HelpContext = 7101
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = edF_INGRESOExit
    end
    object edF_VencR: TEdit
      Tag = 530
      Left = 447
      Top = 14
      Width = 91
      Height = 21
      HelpContext = 7201
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object InterDateTimePicker1: TInterDateTimePicker
      Tag = 18
      Left = 169
      Top = 14
      Width = 21
      Height = 21
      HelpContext = 7102
      CalAlignment = dtaLeft
      Date = 37777.7691627546
      Time = 37777.7691627546
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      TabStop = False
      OnExit = edF_INGRESOExit
      Edit = edF_INGRESO
      Formato = dfDate
    end
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
    ShowBtnEliminar = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    OnDespuesShow = InterForma1DespuesShow
    Left = 386
    Top = 14
  end
  object ilCESION: TInterLinkit
    Control = edID_CESION
    OnEjecuta = ilCESIONEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCESIONCapture
    Left = 216
    Top = 82
  end
  object ilCVE_DOCTO: TInterLinkit
    Control = edCVE_DOCUMENTO
    OnEjecuta = ilCVE_DOCTOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCVE_DOCTOCapture
    Left = 216
    Top = 111
  end
end
