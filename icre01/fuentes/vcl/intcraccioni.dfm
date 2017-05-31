object WCrAccionista: TWCrAccionista
  Left = 64
  Top = 102
  Width = 907
  Height = 615
  Caption = 'Alta de Accionistas por Acreditado'
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
    Left = 14
    Top = 10
    Width = 51
    Height = 13
    Caption = 'Acreditado'
  end
  object lbID_ACCIONISTA: TLabel
    Left = 14
    Top = 36
    Width = 49
    Height = 13
    Caption = 'Accionista'
  end
  object lbCVE_TIPO_ACCION: TLabel
    Left = 14
    Top = 178
    Width = 103
    Height = 13
    Caption = 'Puesto desempeñado'
  end
  object lbPCT_PARTICIPA: TLabel
    Left = 14
    Top = 213
    Width = 114
    Height = 13
    Caption = 'Porcentaje participación'
  end
  object Label1: TLabel
    Left = 9
    Top = 519
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object Label2: TLabel
    Left = 435
    Top = 518
    Width = 93
    Height = 13
    Caption = 'Fecha Modificación'
  end
  object Label4: TLabel
    Left = 245
    Top = 519
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object Label3: TLabel
    Left = 690
    Top = 520
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object Label13: TLabel
    Left = 215
    Top = 215
    Width = 82
    Height = 13
    Caption = 'R.F.C. Accionista'
  end
  object Label14: TLabel
    Left = 462
    Top = 196
    Width = 88
    Height = 13
    Caption = 'HomoClave R.F.C:'
  end
  object Label15: TLabel
    Left = 382
    Top = 197
    Width = 63
    Height = 13
    Caption = 'Fecha R.F.C:'
  end
  object Label16: TLabel
    Left = 302
    Top = 196
    Width = 61
    Height = 13
    Caption = 'Siglas R.F.C:'
  end
  object Label17: TLabel
    Left = 624
    Top = 8
    Width = 88
    Height = 13
    Caption = 'Tipo de Accionista'
  end
  object lbDOMICILIO: TLabel
    Left = 14
    Top = 145
    Width = 42
    Height = 13
    Caption = 'Domicilio'
    OnDblClick = lbDOMICILIODblClick
  end
  object Label18: TLabel
    Left = 136
    Top = 90
    Width = 77
    Height = 13
    Caption = 'Apellido Paterno'
    Visible = False
  end
  object Label19: TLabel
    Left = 293
    Top = 91
    Width = 79
    Height = 13
    Caption = 'Apellido Materno'
    Visible = False
  end
  object Label20: TLabel
    Left = 448
    Top = 91
    Width = 46
    Height = 13
    Caption = 'Nombre 1'
    Visible = False
  end
  object Label21: TLabel
    Left = 605
    Top = 91
    Width = 46
    Height = 13
    Caption = 'Nombre 2'
    Visible = False
  end
  object Label22: TLabel
    Left = 572
    Top = 215
    Width = 81
    Height = 13
    Caption = 'CURP accionista'
    Visible = False
  end
  object TLabel
    Left = 12
    Top = 254
    Width = 3
    Height = 13
  end
  object Label23: TLabel
    Left = 14
    Top = 249
    Width = 93
    Height = 13
    Caption = 'Numero de telefono'
  end
  object Label24: TLabel
    Left = 277
    Top = 249
    Width = 46
    Height = 13
    Caption = 'Extension'
  end
  object Label25: TLabel
    Left = 431
    Top = 249
    Width = 17
    Height = 13
    Caption = 'Fax'
  end
  object Label27: TLabel
    Left = 823
    Top = 13
    Width = 52
    Height = 8
    Caption = 'v. 03.09.2012'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -7
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblID_PER_ACC: TLabel
    Left = 15
    Top = 64
    Width = 109
    Height = 13
    Caption = 'Id Persona (Accionista)'
    OnDblClick = lblID_PER_ACCDblClick
  end
  object edID_ACREDITADO: TEdit
    Tag = 562
    Left = 135
    Top = 6
    Width = 73
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    TabOrder = 4
    OnExit = edID_ACREDITADOExit
  end
  object edID_ACCIONISTA: TEdit
    Tag = 512
    Left = 135
    Top = 32
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    Enabled = False
    ReadOnly = True
    TabOrder = 8
    OnExit = edID_ACCIONISTAExit
  end
  object IedPCT_PARTICIPA: TInterEdit
    Tag = 18
    Left = 135
    Top = 209
    Width = 73
    Height = 21
    HelpContext = 5001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = IedPCT_PARTICIPAExit
    DisplayMask = '###,####0.0000'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 23
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object rgSIT_ACCIONISTA: TRadioGroup
    Tag = 18
    Left = 622
    Top = 240
    Width = 257
    Height = 35
    HelpContext = 6001
    Caption = 'Situación'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Inactivo')
    TabOrder = 31
    TabStop = True
    OnExit = rgSIT_ACCIONISTAExit
  end
  object edNOMBRE_ACREDITADO: TEdit
    Left = 234
    Top = 6
    Width = 359
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object edNOMBRE: TEdit
    Left = 209
    Top = 32
    Width = 384
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    Enabled = False
    ReadOnly = True
    TabOrder = 9
    OnExit = edNOMBREExit
  end
  object btACREDITADO: TBitBtn
    Tag = 50
    Left = 210
    Top = 6
    Width = 22
    Height = 20
    HelpContext = 1002
    TabOrder = 5
    OnClick = btACREDITADOClick
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
  object PnDatos: TPanel
    Left = 4
    Top = 556
    Width = 877
    Height = 21
    TabOrder = 34
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
      Left = 582
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
      Left = 582
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
      Left = 646
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
      Left = 646
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
  object GroupBox1: TGroupBox
    Left = 5
    Top = 277
    Width = 876
    Height = 236
    Caption = 'Listado de Accionistas del Acreditado '
    TabOrder = 32
    object Label7: TLabel
      Left = 14
      Top = 23
      Width = 59
      Height = 13
      Caption = '# Accionista'
    end
    object Label8: TLabel
      Left = 176
      Top = 23
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Bevel2: TBevel
      Left = 80
      Top = 23
      Width = 3
      Height = 18
    end
    object Label9: TLabel
      Left = 558
      Top = 23
      Width = 12
      Height = 13
      Caption = 'Sit'
    end
    object Bevel3: TBevel
      Left = 319
      Top = 23
      Width = 3
      Height = 18
    end
    object Bevel1: TBevel
      Left = 470
      Top = 23
      Width = 3
      Height = 18
    end
    object Bevel4: TBevel
      Left = 548
      Top = 23
      Width = 3
      Height = 18
    end
    object Label5: TLabel
      Left = 367
      Top = 23
      Width = 33
      Height = 13
      Caption = 'Puesto'
    end
    object Label6: TLabel
      Left = 474
      Top = 24
      Width = 72
      Height = 13
      Caption = '% Participación'
    end
    object Bevel5: TBevel
      Left = 580
      Top = 7
      Width = 3
      Height = 34
    end
    object Label10: TLabel
      Left = 586
      Top = 23
      Width = 28
      Height = 13
      Caption = 'Siglas'
    end
    object Bevel6: TBevel
      Left = 630
      Top = 23
      Width = 3
      Height = 18
    end
    object Bevel7: TBevel
      Left = 709
      Top = 23
      Width = 3
      Height = 18
    end
    object Label11: TLabel
      Left = 652
      Top = 23
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label12: TLabel
      Left = 723
      Top = 23
      Width = 55
      Height = 13
      Caption = 'HomoClave'
    end
    object Label26: TLabel
      Left = 665
      Top = 9
      Width = 42
      Height = 13
      Caption = 'R . F. C. '
    end
    object Bevel8: TBevel
      Left = 788
      Top = 7
      Width = 3
      Height = 34
    end
    object sgACCIONISTAS: TSGCtrl
      Left = 4
      Top = 41
      Width = 861
      Height = 190
      OnCalcRow = sgACCIONISTASCalcRow
      ShowTab = True
      TabOrder = 0
      TabWidth = 0
      ShowBtnPriorNext = True
      ShowBtnFirst = True
      ShowBtnLast = True
      OnMoveRow = sgACCIONISTASMoveRow
    end
  end
  object edF_ALTA: TEdit
    Left = 88
    Top = 515
    Width = 135
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object edF_MODIFICA: TEdit
    Left = 538
    Top = 514
    Width = 135
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object edCVE_USU_ALTA: TEdit
    Left = 316
    Top = 515
    Width = 100
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 779
    Top = 514
    Width = 100
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  object MsgPanel: TPanel
    Left = 4
    Top = 536
    Width = 877
    Height = 19
    TabOrder = 33
  end
  object edCVE_PUESTO: TEdit
    Tag = 512
    Left = 135
    Top = 174
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 20
    OnExit = edCVE_PUESTOExit
  end
  object btPUESTO: TBitBtn
    Tag = 18
    Left = 210
    Top = 174
    Width = 22
    Height = 20
    HelpContext = 4002
    TabOrder = 21
    OnClick = btPUESTOClick
    OnExit = edCVE_PUESTOExit
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
  object edDESC_PUESTO: TEdit
    Left = 234
    Top = 174
    Width = 359
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 22
  end
  object edSIGLAS_RFC: TInterEdit
    Tag = 18
    Left = 302
    Top = 211
    Width = 73
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    OnExit = edSIGLAS_RFCExit
    MaxLength = 3
    TabOrder = 24
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edF_RFC: TInterEdit
    Tag = 18
    Left = 382
    Top = 211
    Width = 73
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    OnExit = edF_RFCExit
    MaxLength = 5
    TabOrder = 25
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edHOMOCLAVE_RFC: TInterEdit
    Tag = 18
    Left = 462
    Top = 211
    Width = 84
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    OnExit = edHOMOCLAVE_RFCExit
    MaxLength = 2
    TabOrder = 26
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object cbTIPO_ACCIONISTA: TComboBox
    Tag = 18
    Left = 722
    Top = 5
    Width = 72
    Height = 21
    HelpContext = 1003
    ItemHeight = 13
    TabOrder = 7
    OnChange = cbTIPO_ACCIONISTAChange
    OnExit = cbTIPO_ACCIONISTAExit
  end
  object edAPELLIDO_PATERNO: TEdit
    Tag = 18
    Left = 135
    Top = 105
    Width = 146
    Height = 21
    HelpContext = 2001
    CharCase = ecUpperCase
    TabOrder = 13
    Visible = False
    OnExit = edAPELLIDO_PATERNOExit
  end
  object edAPELLIDO_MATERNO: TEdit
    Tag = 18
    Left = 290
    Top = 105
    Width = 146
    Height = 21
    HelpContext = 2002
    CharCase = ecUpperCase
    TabOrder = 14
    Visible = False
    OnExit = edAPELLIDO_MATERNOExit
  end
  object edNOMBRE1: TEdit
    Tag = 18
    Left = 445
    Top = 105
    Width = 152
    Height = 21
    HelpContext = 2003
    CharCase = ecUpperCase
    TabOrder = 15
    Visible = False
    OnExit = edNOMBRE1Exit
  end
  object edNOMBRE2: TEdit
    Tag = 18
    Left = 606
    Top = 105
    Width = 267
    Height = 21
    HelpContext = 2004
    CharCase = ecUpperCase
    TabOrder = 16
    Visible = False
    OnExit = edNOMBRE2Exit
  end
  object edID_DOMICILIO: TEdit
    Tag = 512
    Left = 135
    Top = 141
    Width = 70
    Height = 21
    Hint = 'Click derecho para Catálogo'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 17
    OnExit = edID_DOMICILIOExit
  end
  object btDOMICILIO: TBitBtn
    Tag = 18
    Left = 208
    Top = 141
    Width = 22
    Height = 20
    HelpContext = 3002
    TabOrder = 18
    OnClick = btDOMICILIOClick
    OnExit = btDOMICILIOExit
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
  object edCALLE_NUMERO: TEdit
    Left = 234
    Top = 141
    Width = 359
    Height = 21
    Hint = 'Click derecho para Catálogo'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 19
  end
  object edCURP_ACC: TEdit
    Tag = 18
    Left = 664
    Top = 209
    Width = 207
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 27
    Visible = False
    OnExit = edCURP_ACCExit
  end
  object edNUMERO_TELEFONO: TEdit
    Tag = 18
    Left = 134
    Top = 246
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 28
    OnExit = edNUMERO_TELEFONOExit
  end
  object edEXTENSION_TELEFONICA: TEdit
    Tag = 18
    Left = 330
    Top = 246
    Width = 80
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 29
    OnExit = edEXTENSION_TELEFONICAExit
  end
  object edFAX: TEdit
    Tag = 18
    Left = 457
    Top = 246
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 30
    OnExit = edFAXExit
  end
  object edID_PER_ACC: TEdit
    Tag = 512
    Left = 135
    Top = 61
    Width = 73
    Height = 21
    Hint = 'Click derecho para Catálogo'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 10
    OnExit = edID_PER_ACCExit
  end
  object edNOM_PER_ACC: TEdit
    Left = 234
    Top = 61
    Width = 359
    Height = 21
    Hint = 'Click derecho para Catálogo'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 12
  end
  object btID_PER_ACC: TBitBtn
    Tag = 18
    Left = 210
    Top = 61
    Width = 22
    Height = 20
    HelpContext = 3002
    TabOrder = 11
    OnClick = btID_PER_ACCClick
    OnExit = btID_PER_ACCExit
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
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesEliminar = InterForma1DespuesEliminar
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
    Left = 359
    Top = 2
  end
  object ilPUESTO: TInterLinkit
    Control = edCVE_PUESTO
    OnEjecuta = ilPUESTOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilPUESTOCapture
    Left = 256
    Top = 169
  end
  object ilACREDITADO: TInterLinkit
    Control = edID_ACREDITADO
    OnEjecuta = ilACREDITADOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilACREDITADOCapture
    Left = 288
  end
  object ilDOMICILIO: TInterLinkit
    Control = edID_DOMICILIO
    OnEjecuta = ilDOMICILIOEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    OnCapture = ilDOMICILIOCapture
    Left = 242
    Top = 138
  end
  object ilID_PER_ACC: TInterLinkit
    Control = edID_PER_ACC
    OnEjecuta = ilID_PER_ACCEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    OnCapture = ilID_PER_ACCCapture
    Left = 370
    Top = 50
  end
end
