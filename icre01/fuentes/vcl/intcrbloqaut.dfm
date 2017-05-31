object WCrbloqaut: TWCrbloqaut
  Left = 342
  Top = 149
  Width = 637
  Height = 445
  Caption = 'Captura Manual de Bloqueo y Desbloqueos de saldos'
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
  object lbID_ACREDITADO: TLabel
    Left = 7
    Top = 84
    Width = 93
    Height = 13
    Caption = 'Acreditado / Sector'
  end
  object lbID_CONTRATO: TLabel
    Left = 6
    Top = 128
    Width = 91
    Height = 13
    Caption = 'Autorización / Prod'
  end
  object Label2: TLabel
    Left = 432
    Top = 60
    Width = 69
    Height = 13
    Caption = 'No. Operación'
  end
  object lbTX_NOTA: TLabel
    Left = 6
    Top = 211
    Width = 58
    Height = 13
    Caption = 'Comentarios'
  end
  object edCVE_SECTOR: TEdit
    Left = 215
    Top = 81
    Width = 56
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object edID_ACREDITADO: TEdit
    Tag = 562
    Left = 110
    Top = 80
    Width = 73
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 8
    PopupMenu = PopupMenuAcreditado
    TabOrder = 1
    OnExit = edID_ACREDITADOExit
  end
  object btID_ACREDITADO: TBitBtn
    Tag = 50
    Left = 190
    Top = 81
    Width = 22
    Height = 20
    HelpContext = 1002
    TabOrder = 2
    OnClick = btID_ACREDITADOClick
    OnExit = edID_ACREDITADOExit
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
    Left = 272
    Top = 81
    Width = 339
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object cbB_USA_CONTRATO: TCheckBox
    Tag = 50
    Left = 2
    Top = 102
    Width = 199
    Height = 21
    HelpContext = 1101
    Alignment = taLeftJustify
    Caption = 'Nivel de bloqueo por autorización'
    TabOrder = 5
    OnClick = cbB_USA_CONTRATOClick
  end
  object edCVE_PRODUCTO_CRE: TEdit
    Left = 215
    Top = 125
    Width = 55
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
  end
  object edID_CONTRATO: TEdit
    Tag = 530
    Left = 110
    Top = 123
    Width = 73
    Height = 21
    HelpContext = 1102
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    Enabled = False
    MaxLength = 8
    PopupMenu = PopupMenuAutorizacion
    TabOrder = 6
    OnExit = edID_CONTRATOExit
  end
  object btID_CONTRATO: TBitBtn
    Tag = 50
    Left = 190
    Top = 124
    Width = 22
    Height = 21
    HelpContext = 1103
    Enabled = False
    TabOrder = 7
    TabStop = False
    OnClick = btID_CONTRATOClick
    OnExit = edID_CONTRATOExit
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
  object edDESC_C_PRODUCTO: TEdit
    Left = 270
    Top = 125
    Width = 340
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
  end
  object icpCONTRATO: TInterCtoPanel
    Tag = 50
    Left = 1
    Top = 4
    Width = 612
    Height = 45
    Hint = 'Información del Contrato'
    Lenguaje = 0
    ShowLenguaje = False
    ShowEnviarEMail = False
  end
  object edID_TRN_BLQ_RECEP: TEdit
    Left = 537
    Top = 56
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 8
    ReadOnly = True
    TabOrder = 0
  end
  object rgCVE_TIPO_MOVTO: TRadioGroup
    Tag = 50
    Left = 5
    Top = 145
    Width = 212
    Height = 60
    HelpContext = 1201
    Caption = 'Tipo de Movimiento'
    Columns = 2
    Items.Strings = (
      'Bloqueo'
      'Desbloqueo')
    TabOrder = 11
    TabStop = True
    OnClick = rgCVE_TIPO_MOVTOClick
    OnExit = rgCVE_TIPO_MOVTOExit
  end
  object gbSaldos: TGroupBox
    Left = 425
    Top = 145
    Width = 185
    Height = 119
    Caption = 'Saldos de la(s) autorización(es)'
    TabOrder = 14
    object Label6: TLabel
      Left = 11
      Top = 27
      Width = 50
      Height = 13
      Caption = 'Autorizado'
    end
    object Dispuesto: TLabel
      Left = 11
      Top = 49
      Width = 47
      Height = 13
      Caption = 'Dispuesto'
    end
    object Label8: TLabel
      Left = 11
      Top = 71
      Width = 51
      Height = 13
      Caption = 'Bloqueado'
    end
    object Label9: TLabel
      Left = 11
      Top = 93
      Width = 60
      Height = 13
      Caption = 'Disponible'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 70
      Top = 37
      Width = 3
      Height = 13
      Caption = '-'
    end
    object Label11: TLabel
      Left = 69
      Top = 80
      Width = 6
      Height = 13
      Caption = '='
    end
    object Label1: TLabel
      Left = 70
      Top = 58
      Width = 3
      Height = 13
      Caption = '-'
    end
    object edIMP_AUTORIZADO: TInterEdit
      Left = 79
      Top = 22
      Width = 100
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
      TabOrder = 0
      ReadOnly = True
      UseReType = True
      UseSep = False
      UseDisplay = True
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_DISPUESTO: TInterEdit
      Left = 79
      Top = 44
      Width = 100
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
      TabOrder = 1
      ReadOnly = True
      UseReType = True
      UseSep = False
      UseDisplay = True
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_BLOQUEADO: TInterEdit
      Left = 79
      Top = 66
      Width = 100
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
      TabOrder = 2
      ReadOnly = True
      UseReType = True
      UseSep = False
      UseDisplay = True
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_DISPONIBLE: TInterEdit
      Left = 79
      Top = 88
      Width = 100
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
      UseReType = True
      UseSep = False
      UseDisplay = True
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object gbDatosCtrl: TGroupBox
    Left = 4
    Top = 264
    Width = 607
    Height = 85
    Caption = 'Datos de Control'
    TabOrder = 15
    object lbCVE_USUARIO_CANC: TLabel
      Left = 202
      Top = 27
      Width = 78
      Height = 13
      Caption = 'Usuario Cancela'
    end
    object lbF_CANCELA: TLabel
      Left = 201
      Top = 51
      Width = 72
      Height = 13
      Caption = 'Fecha Cancela'
    end
    object lbF_ALTA: TLabel
      Left = 11
      Top = 52
      Width = 51
      Height = 13
      Caption = 'Fecha Alta'
    end
    object lbCVE_USU_ALTA: TLabel
      Left = 12
      Top = 27
      Width = 57
      Height = 13
      Caption = 'Usuario Alta'
    end
    object edF_ALTA: TEdit
      Left = 92
      Top = 48
      Width = 100
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edCVE_USU_ALTA: TEdit
      Left = 92
      Top = 23
      Width = 100
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edCVE_USUARIO_CANC: TEdit
      Left = 292
      Top = 23
      Width = 100
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object edF_CANCELA: TEdit
      Left = 292
      Top = 48
      Width = 100
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object rgSIT_BLQ_RECEP: TRadioGroup
      Left = 400
      Top = 18
      Width = 196
      Height = 54
      Caption = 'Situación'
      Columns = 2
      Enabled = False
      Items.Strings = (
        'Inactiva'
        'Activa')
      TabOrder = 4
    end
  end
  object MsgPanel: TPanel
    Left = 4
    Top = 353
    Width = 607
    Height = 19
    TabOrder = 16
  end
  object PnDatos: TPanel
    Left = 4
    Top = 372
    Width = 607
    Height = 19
    TabOrder = 17
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
      Left = 320
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
      Left = 320
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
      Left = 384
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
      Left = 384
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
  object memTX_NOTA: TMemo
    Tag = 50
    Left = 68
    Top = 207
    Width = 354
    Height = 55
    HelpContext = 1401
    MaxLength = 200
    TabOrder = 13
    OnExit = memTX_NOTAExit
    OnKeyPress = memTX_NOTAKeyPress
  end
  object rgCVE_PCT_IMP: TPanel
    Left = 218
    Top = 150
    Width = 205
    Height = 55
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 12
    object opPCT_MOVIMIENTO: TRadioButton
      Tag = 18
      Left = 4
      Top = 6
      Width = 96
      Height = 17
      HelpContext = 1301
      Caption = '% a aplicar'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = opPCT_MOVIMIENTOClick
      OnExit = opPCT_MOVIMIENTOExit
    end
    object opIMP_MOVIMIENTO: TRadioButton
      Tag = 18
      Left = 4
      Top = 32
      Width = 96
      Height = 17
      HelpContext = 1303
      Caption = 'Monto a aplicar'
      TabOrder = 2
      OnClick = opPCT_MOVIMIENTOClick
      OnExit = opIMP_MOVIMIENTOExit
    end
    object edIMP_MOVIMIENTO: TInterEdit
      Tag = 50
      Left = 101
      Top = 29
      Width = 100
      Height = 21
      HelpContext = 1304
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edIMP_MOVIMIENTOExit
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 3
      UseReType = True
      UseSep = False
      UseDisplay = True
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edPCT_MOVIMIENTO: TInterEdit
      Tag = 50
      Left = 101
      Top = 5
      Width = 100
      Height = 21
      HelpContext = 1302
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edPCT_MOVIMIENTOExit
      DisplayMask = '#,###,##0.0000'
      MaxLength = 18
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 1
      UseReType = True
      UseSep = False
      UseDisplay = True
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
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
    Left = 544
    Top = 365
  end
  object ilID_ACREDITADO: TInterLinkit
    Control = edID_ACREDITADO
    OnEjecuta = ilID_ACREDITADOEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    OnCapture = ilID_CONTRATOCapture
    Left = 206
    Top = 65
  end
  object ilID_CONTRATO: TInterLinkit
    Control = edID_CONTRATO
    OnEjecuta = ilID_CONTRATOEjecuta
    TipoReader = trContrato
    CharCase = ecUpperCase
    OnCapture = ilID_CONTRATOCapture
    Left = 208
    Top = 117
  end
  object PopupMenuAcreditado: TPopupMenu
    Left = 234
    Top = 65
    object Acreditado1: TMenuItem
      Caption = '&Acreditado'
      OnClick = Acreditado1Click
    end
  end
  object PopupMenuAutorizacion: TPopupMenu
    Left = 236
    Top = 109
    object Autorizacin1: TMenuItem
      Caption = 'Autorización'
      OnClick = Autorizacin1Click
    end
  end
end
