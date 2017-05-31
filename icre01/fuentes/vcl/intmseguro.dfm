object wMSeguro: TwMSeguro
  Left = 225
  Top = 38
  Width = 567
  Height = 574
  Caption = 'Administración de Seguros'
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
    Left = 0
    Top = 154
    Width = 83
    Height = 13
    Caption = 'Número de Póliza'
    WordWrap = True
  end
  object Label4: TLabel
    Left = 0
    Top = 133
    Width = 75
    Height = 13
    Caption = 'Bien Asegurado'
    WordWrap = True
  end
  object Label1: TLabel
    Left = 0
    Top = 112
    Width = 99
    Height = 13
    Caption = 'Endoso preferente a:'
  end
  object Label5: TLabel
    Left = 0
    Top = 49
    Width = 67
    Height = 13
    Caption = 'Tipo de Póliza'
  end
  object Label7: TLabel
    Left = 0
    Top = 70
    Width = 60
    Height = 13
    Caption = 'Aseguradora'
  end
  object Label8: TLabel
    Left = 0
    Top = 171
    Width = 85
    Height = 13
    Caption = 'Tipo de Cobertura'
  end
  object Label9: TLabel
    Left = 0
    Top = 216
    Width = 85
    Height = 13
    Caption = 'F. de Vencimiento'
  end
  object Label10: TLabel
    Left = 312
    Top = 154
    Width = 81
    Height = 13
    Caption = 'Suma Asegurada'
  end
  object Label11: TLabel
    Left = 0
    Top = 254
    Width = 71
    Height = 26
    Caption = 'Comentarios/ Observaciones'
    WordWrap = True
  end
  object Label12: TLabel
    Left = 312
    Top = 216
    Width = 85
    Height = 13
    Caption = 'F. de Renovación'
  end
  object Label13: TLabel
    Left = 0
    Top = 237
    Width = 72
    Height = 13
    Caption = 'Forma de Pago'
  end
  object Label14: TLabel
    Left = 312
    Top = 237
    Width = 69
    Height = 13
    Caption = 'F. Último Pago'
  end
  object Label15: TLabel
    Left = 396
    Top = 6
    Width = 25
    Height = 13
    Caption = 'Folio '
  end
  object Label2: TLabel
    Left = 0
    Top = 28
    Width = 67
    Height = 13
    Caption = 'Id. Referencia'
  end
  object shp4: TShape
    Left = 1
    Top = 387
    Width = 69
    Height = 18
    Brush.Color = clInfoBk
  end
  object Shape1: TShape
    Left = 69
    Top = 387
    Width = 68
    Height = 18
    Brush.Color = clInfoBk
  end
  object Shape2: TShape
    Left = 203
    Top = 387
    Width = 152
    Height = 18
    Brush.Color = clInfoBk
  end
  object Shape3: TShape
    Left = 354
    Top = 387
    Width = 68
    Height = 18
    Brush.Color = clInfoBk
  end
  object Shape5: TShape
    Left = 421
    Top = 387
    Width = 68
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label6: TLabel
    Left = 4
    Top = 390
    Width = 62
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Folio'
    Color = clInfoBk
    ParentColor = False
  end
  object Label16: TLabel
    Left = 74
    Top = 390
    Width = 54
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Referencia'
    Color = clInfoBk
    ParentColor = False
  end
  object Label17: TLabel
    Left = 206
    Top = 390
    Width = 144
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Póliza'
    Color = clInfoBk
    ParentColor = False
  end
  object Label18: TLabel
    Left = 363
    Top = 390
    Width = 50
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'No. Póliza'
    Color = clInfoBk
    ParentColor = False
  end
  object Label19: TLabel
    Left = 424
    Top = 390
    Width = 62
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Importe'
    Color = clInfoBk
    ParentColor = False
  end
  object Shape6: TShape
    Left = 136
    Top = 387
    Width = 68
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label20: TLabel
    Left = 138
    Top = 390
    Width = 61
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Cve. Póliza'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
  end
  object Shape10: TShape
    Left = 488
    Top = 387
    Width = 68
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label21: TLabel
    Left = 499
    Top = 390
    Width = 46
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Situación'
    Color = clInfoBk
    ParentColor = False
  end
  object Label22: TLabel
    Left = 0
    Top = 91
    Width = 39
    Height = 13
    Caption = 'Moneda'
  end
  object PnlMsg: TPanel
    Left = 0
    Top = 504
    Width = 557
    Height = 21
    TabOrder = 27
  end
  object PnDatos: TPanel
    Left = 0
    Top = 525
    Width = 557
    Height = 21
    TabOrder = 28
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
      Left = 282
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
      Left = 282
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
      Left = 346
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
      Left = 346
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
  object edNUM_POLIZA: TEdit
    Tag = 18
    Left = 104
    Top = 150
    Width = 177
    Height = 21
    Hint = 'Clave de identificación de tipo de Póliza'
    HelpContext = 4200
    CharCase = ecUpperCase
    MaxLength = 20
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnExit = edNUM_POLIZAExit
  end
  object edBIEN_ASEGURADO: TEdit
    Tag = 18
    Left = 104
    Top = 129
    Width = 453
    Height = 21
    Hint = 'Descripción del bien a asegurar'
    HelpContext = 4100
    CharCase = ecUpperCase
    MaxLength = 80
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnExit = edBIEN_ASEGURADOExit
  end
  object edID_REFERENCIA: TEdit
    Left = 104
    Top = 24
    Width = 80
    Height = 21
    Hint = 'Identificador del Acreditado'
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 8
    TabOrder = 1
  end
  object edTX_ENDOSO_PREF: TEdit
    Tag = 18
    Left = 104
    Top = 108
    Width = 453
    Height = 21
    Hint = 'Endoso preferente'
    HelpContext = 4000
    CharCase = ecUpperCase
    MaxLength = 80
    TabOrder = 11
    OnExit = edTX_ENDOSO_PREFExit
  end
  object edCVE_TIPO_POLIZA: TEdit
    Tag = 530
    Left = 104
    Top = 45
    Width = 80
    Height = 21
    Hint = 'Identificador del Acreditado'
    HelpContext = 1000
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 2
    OnExit = edCVE_TIPO_POLIZAExit
  end
  object btCVE_TIPO_POLIZA: TBitBtn
    Tag = 18
    Left = 188
    Top = 45
    Width = 21
    Height = 21
    HelpContext = 1001
    TabOrder = 3
    OnClick = btCVE_TIPO_POLIZAClick
    OnExit = edCVE_TIPO_POLIZAExit
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
  object edNOM_CVE_TIPO_POLIZA: TEdit
    Left = 216
    Top = 45
    Width = 341
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object edID_ASEGURADORA: TEdit
    Tag = 530
    Left = 104
    Top = 66
    Width = 80
    Height = 21
    Hint = 'Identificador del Acreditado'
    HelpContext = 2000
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 5
    OnExit = edID_ASEGURADORAExit
  end
  object btID_ASEGURADORA: TBitBtn
    Tag = 18
    Left = 188
    Top = 66
    Width = 21
    Height = 21
    HelpContext = 2001
    TabOrder = 6
    OnClick = btID_ASEGURADORAClick
    OnExit = edID_ASEGURADORAExit
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
  object edNOM_ID_ASEGURADORA: TEdit
    Left = 216
    Top = 66
    Width = 341
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
  end
  object edTX_TIPO_COBER: TMemo
    Tag = 18
    Left = 104
    Top = 171
    Width = 453
    Height = 41
    HelpContext = 4400
    MaxLength = 2000
    TabOrder = 15
    OnExit = edTX_TIPO_COBERExit
  end
  object edF_VENCIMIENTO: TEdit
    Tag = 18
    Left = 104
    Top = 212
    Width = 85
    Height = 21
    HelpContext = 4500
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 16
    OnExit = edF_VENCIMIENTOExit
  end
  object dtpF_VENCIMIENTO: TInterDateTimePicker
    Tag = 18
    Left = 189
    Top = 212
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 38177.4184873495
    Time = 38177.4184873495
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 17
    TabStop = False
    Edit = edF_VENCIMIENTO
    Formato = dfDate
  end
  object edIMP_SUM_ASEG: TInterEdit
    Tag = 18
    Left = 451
    Top = 150
    Width = 106
    Height = 21
    HelpContext = 4300
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_SUM_ASEGExit
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 16
    TabOrder = 14
    CharCase = ecUpperCase
    UseReType = True
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edTX_COMENTARIO: TMemo
    Tag = 18
    Left = 104
    Top = 254
    Width = 453
    Height = 42
    HelpContext = 4900
    MaxLength = 80
    TabOrder = 23
    OnExit = edTX_COMENTARIOExit
  end
  object edF_RENOVACION: TEdit
    Tag = 18
    Left = 452
    Top = 212
    Width = 85
    Height = 21
    HelpContext = 4600
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 18
    OnExit = edF_RENOVACIONExit
  end
  object dtpF_RENOVACION: TInterDateTimePicker
    Tag = 18
    Left = 536
    Top = 212
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 38177.4184873495
    Time = 38177.4184873495
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 19
    TabStop = False
    Edit = edF_RENOVACION
    Formato = dfDate
  end
  object edCVE_FORM_PAGO: TEdit
    Tag = 18
    Left = 104
    Top = 233
    Width = 177
    Height = 21
    HelpContext = 4700
    CharCase = ecUpperCase
    MaxLength = 80
    TabOrder = 20
    OnExit = edCVE_FORM_PAGOExit
  end
  object edF_ULT_PAGO: TEdit
    Tag = 18
    Left = 452
    Top = 233
    Width = 85
    Height = 21
    HelpContext = 4800
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 21
    OnExit = edF_ULT_PAGOExit
  end
  object dtpF_ULT_PAGO: TInterDateTimePicker
    Tag = 18
    Left = 536
    Top = 233
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 38177.4184873495
    Time = 38177.4184873495
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 22
    TabStop = False
    Edit = edF_ULT_PAGO
    Formato = dfDate
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 328
    Width = 557
    Height = 58
    Caption = 'Registro'
    TabOrder = 25
    object lbF_ALTA: TLabel
      Left = 25
      Top = 37
      Width = 51
      Height = 13
      Caption = 'Fecha Alta'
    end
    object lbF_MODIF: TLabel
      Left = 296
      Top = 37
      Width = 73
      Height = 13
      Caption = 'Fecha Modifica'
    end
    object lbUSUA_ALTA: TLabel
      Left = 25
      Top = 16
      Width = 57
      Height = 13
      Caption = 'Usuario Alta'
    end
    object lbUSUA_MODIF: TLabel
      Left = 296
      Top = 16
      Width = 79
      Height = 13
      Caption = 'Usuario Modifica'
    end
    object edF_ALTA: TEdit
      Left = 104
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
      Left = 434
      Top = 33
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edCVE_USU_ALTA: TEdit
      Left = 104
      Top = 12
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      MaxLength = 8
      ReadOnly = True
      TabOrder = 0
    end
    object edCVE_USU_MODIF: TEdit
      Left = 434
      Top = 12
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      MaxLength = 8
      ReadOnly = True
      TabOrder = 2
    end
  end
  object rgSIT_SEGURO: TRadioGroup
    Tag = 18
    Left = 0
    Top = 296
    Width = 557
    Height = 33
    Hint = 'Situación de la garantía'
    HelpContext = 5000
    Caption = 'Situación'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Activa'
      'Inactiva')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 24
    OnExit = rgSIT_SEGUROExit
  end
  object edID_FOL_SEGURO: TInterEdit
    Left = 451
    Top = 2
    Width = 106
    Height = 21
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trContrato
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
  object sgcDATA: TSGCtrl
    Tag = 17
    Left = 0
    Top = 405
    Width = 557
    Height = 98
    HelpContext = 6000
    ShowTab = True
    TabStop = True
    TabOrder = 26
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnDblClick = sgcDATADblClick
  end
  object edNOM_MONEDA: TEdit
    Left = 216
    Top = 87
    Width = 341
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
  end
  object btCVE_MONEDA: TBitBtn
    Tag = 18
    Left = 188
    Top = 87
    Width = 21
    Height = 21
    HelpContext = 3001
    TabOrder = 9
    OnClick = btCVE_MONEDAClick
    OnExit = edCVE_MONEDAExit
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
  object edCVE_MONEDA: TEdit
    Tag = 530
    Left = 104
    Top = 87
    Width = 80
    Height = 21
    Hint = 'Identificador del Moneda'
    HelpContext = 3000
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 8
    OnExit = edCVE_MONEDAExit
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesEliminar = InterForma1DespuesEliminar
    OnDespuesCancelar = InterForma1DespuesCancelar
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
    Left = 291
    Top = 9
  end
  object ilCVE_TIPO_POLIZA: TInterLinkit
    Control = edCVE_TIPO_POLIZA
    OnEjecuta = ilCVE_TIPO_POLIZAEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCVE_TIPO_POLIZACapture
    Left = 285
    Top = 41
  end
  object ilID_ASEGURADORA: TInterLinkit
    Control = edID_ASEGURADORA
    OnEjecuta = ilID_ASEGURADORAEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    OnCapture = ilID_ASEGURADORACapture
    Left = 253
    Top = 62
  end
  object ilCVE_MONEDA: TInterLinkit
    Control = edCVE_MONEDA
    OnEjecuta = ilCVE_MONEDAEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    OnCapture = ilCVE_MONEDACapture
    Left = 229
    Top = 86
  end
end
