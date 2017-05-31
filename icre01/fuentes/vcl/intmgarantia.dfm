object wMGarantia: TwMGarantia
  Left = 202
  Top = 19
  Width = 541
  Height = 466
  Caption = 'Catálogo de Tipo de Garantía'
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
    Top = 8
    Width = 27
    Height = 13
    Caption = 'Clave'
    WordWrap = True
  end
  object Label4: TLabel
    Left = 0
    Top = 50
    Width = 56
    Height = 13
    Caption = 'Descripción'
    WordWrap = True
  end
  object Label1: TLabel
    Left = 0
    Top = 29
    Width = 59
    Height = 13
    Caption = 'Clasificación'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 373
    Top = 50
    Width = 57
    Height = 13
    Caption = '% Cobertura'
    WordWrap = True
  end
  object Label11: TLabel
    Left = 0
    Top = 249
    Width = 105
    Height = 26
    Caption = 'Proporción                 Garantía - Disposición'
    WordWrap = True
  end
  object Label12: TLabel
    Left = 232
    Top = 253
    Width = 196
    Height = 13
    Caption = 'Clasificación para Entidades Reguladoras'
    WordWrap = True
  end
  object Label13: TLabel
    Left = 0
    Top = 278
    Width = 110
    Height = 26
    Caption = 'Subclasificación para Entidades Reguladoras'
    WordWrap = True
  end
  object PnlMsg: TPanel
    Left = 0
    Top = 396
    Width = 531
    Height = 21
    TabOrder = 16
  end
  object PnDatos: TPanel
    Left = 0
    Top = 417
    Width = 531
    Height = 21
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
  object edCVE_GARANTIA: TEdit
    Tag = 50
    Left = 119
    Top = 4
    Width = 80
    Height = 21
    Hint = 'Clave de Garantía'
    HelpContext = 1000
    CharCase = ecUpperCase
    MaxLength = 6
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnExit = edCVE_GARANTIAExit
  end
  object edDESC_GARANTIA: TEdit
    Tag = 18
    Left = 119
    Top = 46
    Width = 245
    Height = 21
    Hint = 'Descripción de Garantía'
    HelpContext = 2100
    CharCase = ecUpperCase
    MaxLength = 80
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnExit = edDESC_GARANTIAExit
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 339
    Width = 531
    Height = 58
    Caption = 'Registro'
    TabOrder = 15
    object lbF_ALTA: TLabel
      Left = 25
      Top = 37
      Width = 51
      Height = 13
      Caption = 'Fecha Alta'
    end
    object lbF_MODIF: TLabel
      Left = 287
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
      Left = 287
      Top = 16
      Width = 79
      Height = 13
      Caption = 'Usuario Modifica'
    end
    object edF_ALTA: TEdit
      Left = 119
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
      Left = 408
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
      Left = 119
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
      Left = 408
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
  object edCVE_TIPO_GAR: TEdit
    Tag = 530
    Left = 119
    Top = 25
    Width = 80
    Height = 21
    Hint = 'Tipo de Garantía'
    HelpContext = 2000
    CharCase = ecUpperCase
    MaxLength = 6
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnExit = edCVE_TIPO_GARExit
  end
  object btCVE_TIPO_GAR: TBitBtn
    Tag = 18
    Left = 200
    Top = 25
    Width = 21
    Height = 21
    HelpContext = 2001
    TabOrder = 2
    OnClick = btCVE_TIPO_GARClick
    OnExit = edCVE_TIPO_GARExit
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
  object edNOM_CVE_TIPO_GAR: TEdit
    Left = 224
    Top = 25
    Width = 307
    Height = 21
    Hint = 'Descripción del tipo de garantía'
    TabStop = False
    Color = clBtnFace
    TabOrder = 3
  end
  object edPCT_COBERTURA: TInterEdit
    Tag = 18
    Left = 441
    Top = 46
    Width = 90
    Height = 21
    Hint = 'Porcentaje de Cobertura de la garantía'
    HelpContext = 2200
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_COBERTURAExit
    DisplayMask = '###,###,##0.0000'
    MaxLength = 8
    TabOrder = 5
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object rgCVE_TIPO_SEGURO: TRadioGroup
    Tag = 18
    Left = 0
    Top = 68
    Width = 531
    Height = 35
    Hint = 'Tipo de aplicación de seguro para la garantía'
    HelpContext = 2300
    Caption = 'Tipo de Seguro'
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'Obligatorio'
      'Opcional'
      'Exceptuado'
      'No Aplica')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnExit = rgCVE_TIPO_SEGUROExit
  end
  object rgSIT_GARANTIA: TRadioGroup
    Tag = 18
    Left = 0
    Top = 306
    Width = 531
    Height = 33
    Hint = 'Situación de la garantía'
    HelpContext = 6000
    Caption = 'Situación'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Activa'
      'Inactiva')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnExit = rgSIT_GARANTIAExit
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 103
    Width = 531
    Height = 61
    HelpContext = 3000
    Caption = 'Avalúo'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 7
    object Label5: TLabel
      Left = 8
      Top = 37
      Width = 83
      Height = 13
      Caption = 'Unidad de tiempo'
    end
    object Label6: TLabel
      Left = 403
      Top = 37
      Width = 75
      Height = 13
      Caption = 'No.de unidades'
    end
    object cbxB_REQ_AVALUO: TCheckBox
      Tag = 18
      Left = 9
      Top = 16
      Width = 160
      Height = 17
      Hint = 'Aplica avalúo para la garantía'
      HelpContext = 3001
      Caption = 'Requiere avalúo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = cbxB_REQ_AVALUOClick
      OnExit = cbxB_REQ_AVALUOExit
    end
    object cbxB_REV_AVALUO: TCheckBox
      Tag = 18
      Left = 240
      Top = 16
      Width = 160
      Height = 17
      Hint = 'Requiere realizar una revisión periódica del avalúo'
      HelpContext = 3200
      Caption = 'Revisión periódica de avalúo'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = cbxB_REV_AVALUOClick
      OnExit = cbxB_REV_AVALUOExit
    end
    object edUNIDAD_TIEMPO_AV: TEdit
      Tag = 530
      Left = 119
      Top = 33
      Width = 80
      Height = 21
      Hint = 'Unidad de tiempo para revisión de avalúo'
      HelpContext = 3300
      CharCase = ecUpperCase
      MaxLength = 8
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnExit = edUNIDAD_TIEMPO_AVExit
    end
    object edNUM_UNIDADES_AV: TInterEdit
      Tag = 18
      Left = 482
      Top = 33
      Width = 40
      Height = 21
      HelpContext = 3400
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      OnExit = edNUM_UNIDADES_AVExit
      OnKeyPress = edNUM_UNIDADES_AVKeyPress
      MaxLength = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 5
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object btUNIDAD_TIEMPO_AV: TBitBtn
      Tag = 18
      Left = 200
      Top = 33
      Width = 21
      Height = 21
      HelpContext = 3301
      TabOrder = 3
      OnClick = btUNIDAD_TIEMPO_AVClick
      OnExit = edUNIDAD_TIEMPO_AVExit
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
    object edNOM_UNIDAD_TIEMPO_AV: TEdit
      Left = 224
      Top = 33
      Width = 175
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 165
    Width = 531
    Height = 61
    HelpContext = 4000
    Caption = 'Revisión de Garantía'
    TabOrder = 8
    object Label8: TLabel
      Left = 8
      Top = 36
      Width = 83
      Height = 13
      Caption = 'Unidad de tiempo'
    end
    object Label9: TLabel
      Left = 400
      Top = 36
      Width = 75
      Height = 13
      Caption = 'No.de unidades'
    end
    object cbxB_REQ_VALUACION: TCheckBox
      Tag = 18
      Left = 9
      Top = 16
      Width = 160
      Height = 17
      Hint = 'Aplica valuación la garantía'
      HelpContext = 4100
      Caption = 'Requiere valuación'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = cbxB_REQ_VALUACIONClick
      OnExit = cbxB_REQ_VALUACIONExit
    end
    object cbxB_REVISION_GAR: TCheckBox
      Tag = 18
      Left = 240
      Top = 16
      Width = 177
      Height = 17
      Hint = 'Requiere realizar una revisión periódica de la garantía'
      HelpContext = 4200
      Caption = 'Revisión periódica de garantía'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = cbxB_REVISION_GARClick
      OnExit = cbxB_REVISION_GARExit
    end
    object edUNIDAD_TIEMPO_RE: TEdit
      Tag = 530
      Left = 119
      Top = 32
      Width = 80
      Height = 21
      Hint = 'Unidad de tiempo para revisión de la garantía'
      HelpContext = 4300
      CharCase = ecUpperCase
      MaxLength = 8
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnExit = edUNIDAD_TIEMPO_REExit
    end
    object edNUM_UNIDADES_RE: TInterEdit
      Tag = 18
      Left = 482
      Top = 32
      Width = 40
      Height = 21
      HelpContext = 4400
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      OnExit = edNUM_UNIDADES_REExit
      OnKeyPress = edNUM_UNIDADES_REKeyPress
      MaxLength = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 5
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object btUNIDAD_TIEMPO_RE: TBitBtn
      Tag = 18
      Left = 200
      Top = 32
      Width = 21
      Height = 21
      HelpContext = 4301
      TabOrder = 3
      OnClick = btUNIDAD_TIEMPO_REClick
      OnExit = edUNIDAD_TIEMPO_REExit
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
    object edNOM_UNIDAD_TIEMPO_RE: TEdit
      Left = 224
      Top = 33
      Width = 175
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
  end
  object edFACT_PROPOR_GAR: TInterEdit
    Tag = 18
    Left = 119
    Top = 249
    Width = 100
    Height = 21
    Hint = 'Proporción de la garantía con respecto al crédito'
    HelpContext = 5200
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edFACT_PROPOR_GARExit
    DisplayMask = '#0.00'
    MaxLength = 4
    TabOrder = 11
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object cbxB_REQ_INSCR_RPP: TCheckBox
    Tag = 18
    Left = 119
    Top = 227
    Width = 214
    Height = 17
    Hint = 'Inscripción al Registro Público de la Propiedad'
    HelpContext = 5000
    Caption = 'Ins. al Registro Público de la Propiedad'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnExit = cbxB_REQ_INSCR_RPPExit
  end
  object cbxB_REQ_INSCR_RPC: TCheckBox
    Tag = 18
    Left = 340
    Top = 227
    Width = 191
    Height = 17
    Hint = 'Inscripción al Registro Público de Comercio'
    HelpContext = 5100
    Caption = 'Ins. al Registro Público de Comercio'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnExit = cbxB_REQ_INSCR_RPCExit
  end
  object edCVE_SITI_GAR: TEdit
    Tag = 18
    Left = 431
    Top = 249
    Width = 100
    Height = 21
    Hint = 'Clasificación de garantías para entidades reguladoras'
    HelpContext = 5300
    CharCase = ecUpperCase
    MaxLength = 10
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnExit = edCVE_SITI_GARExit
  end
  object edCVE_SUB_SITI: TEdit
    Tag = 18
    Left = 119
    Top = 278
    Width = 100
    Height = 21
    Hint = 'Clasificación de garantías para entidades reguladoras'
    HelpContext = 5400
    CharCase = ecUpperCase
    MaxLength = 10
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnExit = edCVE_SUB_SITIExit
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesCancelar = InterForma1DespuesCancelar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesEliminar = InterForma1AntesEliminar
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
    Left = 413
  end
  object ilCVE_TIPO_GAR: TInterLinkit
    Control = edCVE_TIPO_GAR
    OnEjecuta = ilCVE_TIPO_GAREjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCVE_TIPO_GARCapture
    Left = 243
    Top = 21
  end
  object ilUNIDAD_TIEMPO_AV: TInterLinkit
    Control = edUNIDAD_TIEMPO_AV
    OnEjecuta = ilUNIDAD_TIEMPO_AVEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilUNIDAD_TIEMPO_AVCapture
    Left = 235
    Top = 133
  end
  object ilUNIDAD_TIEMPO_RE: TInterLinkit
    Control = edUNIDAD_TIEMPO_RE
    OnEjecuta = ilUNIDAD_TIEMPO_REEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilUNIDAD_TIEMPO_RECapture
    Left = 243
    Top = 197
  end
end
