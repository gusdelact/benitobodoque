object WMCteDoc: TWMCteDoc
  Left = 182
  Top = 42
  Width = 550
  Height = 433
  Caption = 'Alta de Documento por Acreditado...'
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
  object Label3: TLabel
    Left = 373
    Top = 5
    Width = 75
    Height = 13
    Caption = 'No. Documento'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 0
    Top = 27
    Width = 66
    Height = 13
    Caption = 'Id. Acreditado'
  end
  object Label5: TLabel
    Left = 0
    Top = 48
    Width = 55
    Height = 13
    Caption = 'Documento'
    WordWrap = True
  end
  object Label1: TLabel
    Left = 0
    Top = 186
    Width = 58
    Height = 13
    Caption = 'Comentarios'
  end
  object Label8: TLabel
    Left = 335
    Top = 69
    Width = 61
    Height = 13
    Caption = 'F. Expiración'
  end
  object Label4: TLabel
    Left = 0
    Top = 69
    Width = 22
    Height = 13
    Caption = 'Folio'
    WordWrap = True
  end
  object PnlMsg: TPanel
    Left = 0
    Top = 363
    Width = 541
    Height = 21
    TabOrder = 14
  end
  object PnDatos: TPanel
    Left = 0
    Top = 384
    Width = 541
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
      Left = 262
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
      Left = 262
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
      Left = 326
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
      Left = 326
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
    Left = 0
    Top = 307
    Width = 541
    Height = 57
    Caption = 'Registro'
    TabOrder = 13
    object lbF_ALTA: TLabel
      Left = 9
      Top = 37
      Width = 51
      Height = 13
      Caption = 'Fecha Alta'
    end
    object lbF_MODIF: TLabel
      Left = 289
      Top = 37
      Width = 73
      Height = 13
      Caption = 'Fecha Modifica'
    end
    object lbUSUA_ALTA: TLabel
      Left = 9
      Top = 16
      Width = 57
      Height = 13
      Caption = 'Usuario Alta'
    end
    object lbUSUA_MODIF: TLabel
      Left = 289
      Top = 16
      Width = 79
      Height = 13
      Caption = 'Usuario Modifica'
    end
    object edF_ALTA: TEdit
      Left = 100
      Top = 33
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edF_MODIFICA: TEdit
      Left = 426
      Top = 33
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edCVE_USUA_ALTA: TEdit
      Tag = 512
      Left = 100
      Top = 12
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edCVE_USUA_MODIF: TEdit
      Tag = 512
      Left = 426
      Top = 12
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
  end
  object rgSIT_RECEP_TRA: TRadioGroup
    Left = 0
    Top = 273
    Width = 541
    Height = 32
    Caption = 'Situación'
    Columns = 4
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Renovado'
      'Vencido'
      'Devuelto')
    TabOrder = 12
    OnExit = rgSIT_RECEP_TRAExit
  end
  object edID_DOCUMENTO: TEdit
    Left = 455
    Top = 1
    Width = 80
    Height = 21
    TabStop = False
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    ReadOnly = True
    TabOrder = 16
  end
  object edACREDITADO: TEdit
    Tag = 562
    Left = 100
    Top = 23
    Width = 80
    Height = 21
    HelpContext = 1000
    CharCase = ecUpperCase
    TabOrder = 0
    OnExit = edACREDITADOExit
  end
  object btACREDITADO: TBitBtn
    Tag = 50
    Left = 181
    Top = 23
    Width = 21
    Height = 21
    HelpContext = 1001
    TabOrder = 1
    OnClick = btACREDITADOClick
    OnExit = edACREDITADOExit
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
  object edNOMBRE_ACRED: TEdit
    Left = 207
    Top = 23
    Width = 328
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object edCVE_DOCUMENTO: TEdit
    Tag = 562
    Left = 100
    Top = 44
    Width = 80
    Height = 21
    HelpContext = 2000
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 3
    OnExit = edCVE_DOCUMENTOExit
  end
  object btDOCUMENTO: TBitBtn
    Tag = 50
    Left = 181
    Top = 44
    Width = 21
    Height = 21
    HelpContext = 2001
    TabOrder = 4
    OnClick = btDOCUMENTOClick
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
  object edDOCUMENTO: TEdit
    Left = 207
    Top = 44
    Width = 328
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 5
  end
  object edTX_COMENTARIO: TMemo
    Tag = 18
    Left = 100
    Top = 186
    Width = 440
    Height = 47
    HelpContext = 6000
    MaxLength = 100
    TabOrder = 10
    OnExit = edTX_COMENTARIOExit
  end
  object GroupBox1: TGroupBox
    Tag = 18
    Left = 0
    Top = 86
    Width = 541
    Height = 100
    HelpContext = 4000
    Caption = 'Registro Documento'
    TabOrder = 9
    object lbLiqF_INICIO: TLabel
      Left = 221
      Top = 17
      Width = 87
      Height = 13
      Caption = 'F. Entrega Original'
    end
    object Label6: TLabel
      Left = 221
      Top = 37
      Width = 84
      Height = 13
      Caption = 'F. Entrega Copias'
    end
    object Label7: TLabel
      Left = 438
      Top = 38
      Width = 47
      Height = 13
      Caption = 'N° Copias'
    end
    object Label9: TLabel
      Left = 4
      Top = 52
      Width = 72
      Height = 26
      Alignment = taCenter
      Caption = 'Área resguarda original'
      WordWrap = True
    end
    object Label10: TLabel
      Left = 335
      Top = 59
      Width = 68
      Height = 13
      Caption = 'N° Expediente'
      WordWrap = True
    end
    object Label13: TLabel
      Left = 4
      Top = 80
      Width = 66
      Height = 13
      Caption = 'F. Devolución'
    end
    object cbxB_ORIGIN_ENTREG: TCheckBox
      Tag = 18
      Left = 100
      Top = 15
      Width = 97
      Height = 17
      HelpContext = 5000
      Caption = 'Entrega Original'
      TabOrder = 0
      OnClick = cbxB_ORIGIN_ENTREGClick
      OnExit = cbxB_ORIGIN_ENTREGExit
    end
    object edF_ENTREGA_OR: TEdit
      Tag = 18
      Left = 320
      Top = 13
      Width = 90
      Height = 21
      Hint = 'dd/mm/yyyy'
      HelpContext = 5100
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnExit = edF_ENTREGA_ORExit
    end
    object dtpF_ENTREGA_OR: TInterDateTimePicker
      Tag = 18
      Left = 411
      Top = 13
      Width = 21
      Height = 21
      Hint = 'dd/mm/yyyy'
      HelpContext = 5102
      CalAlignment = dtaLeft
      Date = 37770.450694537
      Time = 37770.450694537
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TabStop = False
      OnExit = edF_ENTREGA_ORExit
      Edit = edF_ENTREGA_OR
      Formato = dfDate
    end
    object cbxB_COPIAS_ENTREG: TCheckBox
      Tag = 18
      Left = 100
      Top = 36
      Width = 97
      Height = 17
      HelpContext = 5200
      Caption = 'Entrega Copias'
      TabOrder = 3
      OnClick = cbxB_COPIAS_ENTREGClick
      OnExit = cbxB_COPIAS_ENTREGExit
    end
    object edF_ENTREGA_COP: TEdit
      Tag = 18
      Left = 320
      Top = 34
      Width = 90
      Height = 21
      Hint = 'dd/mm/yyyy'
      HelpContext = 5300
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnExit = edF_ENTREGA_COPExit
    end
    object dtpB_COPIAS_ENTREG: TInterDateTimePicker
      Tag = 18
      Left = 411
      Top = 34
      Width = 21
      Height = 21
      Hint = 'dd/mm/yyyy'
      HelpContext = 5301
      CalAlignment = dtaLeft
      Date = 37770.450694537
      Time = 37770.450694537
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      TabStop = False
      OnExit = edF_ENTREGA_COPExit
      Edit = edF_ENTREGA_COP
      Formato = dfDate
    end
    object edNUMERO_COPIAS: TEdit
      Tag = 18
      Left = 491
      Top = 34
      Width = 30
      Height = 21
      HelpContext = 5400
      CharCase = ecUpperCase
      TabOrder = 6
      Text = '1'
      OnChange = edNUMERO_COPIASChange
      OnExit = edNUMERO_COPIASExit
      OnKeyPress = edNUMERO_COPIASKeyPress
    end
    object UpDown1: TUpDown
      Tag = 18
      Left = 521
      Top = 34
      Width = 15
      Height = 21
      Associate = edNUMERO_COPIAS
      Min = 1
      Position = 1
      TabOrder = 7
      Wrap = False
    end
    object edAREA_RESG_ORI: TEdit
      Tag = 18
      Left = 100
      Top = 55
      Width = 218
      Height = 21
      HelpContext = 5500
      CharCase = ecUpperCase
      TabOrder = 8
      OnExit = edAREA_RESG_ORIExit
      OnKeyPress = edAREA_RESG_ORIKeyPress
    end
    object edNUM_EXPEDIENTE: TEdit
      Tag = 18
      Left = 442
      Top = 55
      Width = 93
      Height = 21
      HelpContext = 5600
      CharCase = ecUpperCase
      TabOrder = 9
      OnExit = edNUM_EXPEDIENTEExit
      OnKeyPress = edNUM_EXPEDIENTEKeyPress
    end
    object edF_DEVUELTO_CTE: TEdit
      Tag = 18
      Left = 100
      Top = 76
      Width = 90
      Height = 21
      Hint = 'dd/mm/yyyy'
      HelpContext = 5700
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnExit = edF_DEVUELTO_CTEExit
    end
    object dtpF_DEVOLUCION: TInterDateTimePicker
      Tag = 18
      Left = 191
      Top = 76
      Width = 21
      Height = 21
      Hint = 'dd/mm/yyyy'
      HelpContext = 5701
      CalAlignment = dtaLeft
      Date = 37770.450694537
      Time = 37770.450694537
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      TabStop = False
      OnExit = edF_DEVUELTO_CTEExit
      Edit = edF_DEVUELTO_CTE
      Formato = dfDate
    end
  end
  object dtpF_EXPIRA: TInterDateTimePicker
    Tag = 18
    Left = 514
    Top = 65
    Width = 21
    Height = 21
    Hint = 'dd/mm/yyyy'
    HelpContext = 3101
    CalAlignment = dtaLeft
    Date = 37770.450694537
    Time = 37770.450694537
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnExit = edF_EXPIRAExit
    Edit = edF_EXPIRA
    Formato = dfDate
  end
  object edF_EXPIRA: TEdit
    Tag = 18
    Left = 423
    Top = 65
    Width = 90
    Height = 21
    Hint = 'dd/mm/yyyy'
    HelpContext = 3100
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnExit = edF_EXPIRAExit
  end
  object edFOL_DOCUMENTO: TEdit
    Tag = 50
    Left = 100
    Top = 65
    Width = 213
    Height = 21
    HelpContext = 3000
    CharCase = ecUpperCase
    MaxLength = 50
    TabOrder = 6
    OnExit = edFOL_DOCUMENTOExit
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 233
    Width = 541
    Height = 41
    Caption = 'Renovación'
    TabOrder = 11
    object Label12: TLabel
      Left = 197
      Top = 16
      Width = 114
      Height = 13
      Caption = 'Renovado por el Docto.'
    end
    object Label11: TLabel
      Left = 6
      Top = 16
      Width = 88
      Height = 13
      Caption = 'Renueva a Docto.'
    end
    object edID_DOC_RENOVADOR: TEdit
      Left = 320
      Top = 12
      Width = 90
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
      OnExit = edID_DOC_RENOVADORExit
      OnKeyPress = edID_DOC_RENOVADORKeyPress
    end
    object edID_DOC_RENUEVA: TEdit
      Left = 100
      Top = 12
      Width = 90
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
      OnExit = edID_DOC_RENUEVAExit
      OnKeyPress = edID_DOC_RENUEVAKeyPress
    end
    object btRenovar: TButton
      Tag = 17
      Left = 442
      Top = 11
      Width = 93
      Height = 25
      HelpContext = 7000
      Caption = 'Renovación'
      TabOrder = 2
      OnClick = btRenovarClick
      OnExit = btRenovarExit
    end
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
    FormaEstilo = feVertical
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
    Left = 475
    Top = 4
  end
  object ilACREDITADO: TInterLinkit
    Control = edACREDITADO
    OnEjecuta = ilACREDITADOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilACREDITADOCapture
    Left = 266
    Top = 19
  end
  object ilDocumento: TInterLinkit
    Control = edCVE_DOCUMENTO
    OnEjecuta = ilDocumentoEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilDocumentoCapture
    Left = 301
    Top = 40
  end
end
