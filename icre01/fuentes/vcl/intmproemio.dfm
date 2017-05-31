object wMProemio: TwMProemio
  Left = 358
  Top = 112
  Width = 513
  Height = 535
  Caption = 'Proemio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PopupMenu = pmDomicilio
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 346
    Top = 8
    Width = 60
    Height = 13
    Caption = 'No. Solicitud'
    WordWrap = True
  end
  object PnDatos: TPanel
    Left = 0
    Top = 476
    Width = 505
    Height = 21
    TabOrder = 4
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
    Top = 400
    Width = 505
    Height = 56
    Caption = 'Registro'
    TabOrder = 3
    object lbF_ALTA: TLabel
      Left = 26
      Top = 36
      Width = 51
      Height = 13
      Caption = 'Fecha Alta'
    end
    object lbF_MODIF: TLabel
      Left = 273
      Top = 36
      Width = 73
      Height = 13
      Caption = 'Fecha Modifica'
    end
    object lbUSUA_ALTA: TLabel
      Left = 26
      Top = 15
      Width = 57
      Height = 13
      Caption = 'Usuario Alta'
    end
    object lbUSUA_MODIF: TLabel
      Left = 273
      Top = 15
      Width = 79
      Height = 13
      Caption = 'Usuario Modifica'
    end
    object edF_ALTA: TEdit
      Left = 100
      Top = 32
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edF_MODIFICA: TEdit
      Left = 384
      Top = 32
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edCVE_USU_ALTA: TEdit
      Left = 100
      Top = 11
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
      Left = 384
      Top = 11
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
  object rgSIT_SOLICITUD: TRadioGroup
    Tag = 18
    Left = 0
    Top = 368
    Width = 505
    Height = 31
    HelpContext = 9000
    Caption = 'Situación'
    Columns = 2
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Inactivo')
    TabOrder = 2
    OnExit = rgSIT_SOLICITUDExit
  end
  object edID_SOLICITUD: TEdit
    Tag = 512
    Left = 425
    Top = 4
    Width = 80
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 505
    Height = 336
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Tag = 18
      HelpContext = 10
      Caption = 'Acreditada'
      PopupMenu = pmDomicilio
      object Label13: TLabel
        Left = 3
        Top = 72
        Width = 49
        Height = 13
        Caption = 'F.Solicitud'
      end
      object Label5: TLabel
        Left = 3
        Top = 9
        Width = 39
        Height = 13
        Caption = 'Persona'
        WordWrap = True
      end
      object Label2: TLabel
        Left = 3
        Top = 30
        Width = 63
        Height = 13
        Caption = 'Objeto Social'
      end
      object Label6: TLabel
        Left = 3
        Top = 51
        Width = 42
        Height = 13
        Caption = 'Domicilio'
        WordWrap = True
      end
      object Label42: TLabel
        Left = 3
        Top = 92
        Width = 79
        Height = 13
        Caption = 'Tipo de Contrato'
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 114
        Width = 497
        Height = 108
        Caption = 'Datos de la Escritura Constitutiva'
        TabOrder = 12
        object Label1: TLabel
          Left = 3
          Top = 20
          Width = 37
          Height = 13
          Caption = 'Número'
        end
        object Label4: TLabel
          Left = 295
          Top = 83
          Width = 30
          Height = 13
          Caption = 'Fecha'
          Visible = False
        end
        object Label7: TLabel
          Left = 3
          Top = 41
          Width = 92
          Height = 13
          Caption = 'Notario Público No.'
        end
        object Label9: TLabel
          Left = 3
          Top = 83
          Width = 26
          Height = 13
          Caption = 'Plaza'
        end
        object Label8: TLabel
          Left = 3
          Top = 62
          Width = 52
          Height = 13
          Caption = 'Licenciado'
          WordWrap = True
        end
        object edACR_ESC_NUMERO: TEdit
          Tag = 18
          Left = 94
          Top = 16
          Width = 395
          Height = 21
          HelpContext = 1050
          CharCase = ecUpperCase
          MaxLength = 2000
          TabOrder = 0
          OnExit = edACR_ESC_NUMEROExit
          OnKeyPress = edACR_ESC_NUMEROKeyPress
        end
        object dtpACR_ESC_FECHA: TInterDateTimePicker
          Tag = 18
          Left = 468
          Top = 79
          Width = 21
          Height = 21
          CalAlignment = dtaLeft
          Date = 37770.450694537
          Time = 37770.450694537
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 5
          TabStop = False
          Visible = False
          Edit = edACR_ESC_FECHA
          Formato = dfDate
        end
        object edACR_ESC_FECHA: TEdit
          Tag = 18
          Left = 388
          Top = 79
          Width = 80
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 4
          Visible = False
          OnExit = edACR_ESC_FECHAExit
          OnKeyPress = edACR_ESC_FECHAKeyPress
        end
        object edACR_ESC_NOT_PUB: TEdit
          Tag = 18
          Left = 94
          Top = 37
          Width = 197
          Height = 21
          HelpContext = 1060
          CharCase = ecUpperCase
          MaxLength = 50
          TabOrder = 1
          OnExit = edACR_ESC_NOT_PUBExit
          OnKeyPress = edACR_ESC_NOT_PUBKeyPress
        end
        object edACR_ESC_NOM_LIC: TEdit
          Tag = 18
          Left = 94
          Top = 58
          Width = 395
          Height = 21
          HelpContext = 1070
          CharCase = ecUpperCase
          MaxLength = 100
          TabOrder = 2
          OnExit = edACR_ESC_NOM_LICExit
          OnKeyPress = edACR_ESC_NOM_LICKeyPress
        end
        object edACR_ESC_PLAZA: TEdit
          Tag = 18
          Left = 94
          Top = 79
          Width = 197
          Height = 21
          HelpContext = 1080
          CharCase = ecUpperCase
          MaxLength = 50
          TabOrder = 3
          OnExit = edACR_ESC_PLAZAExit
          OnKeyPress = edACR_ESC_PLAZAKeyPress
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 228
        Width = 497
        Height = 75
        Caption = 'Datos de Inscripción en el Registro Público de Comercio'
        TabOrder = 13
        object Label10: TLabel
          Left = 4
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Número'
        end
        object Label11: TLabel
          Left = 295
          Top = 45
          Width = 30
          Height = 13
          Caption = 'Fecha'
          Visible = False
        end
        object Label15: TLabel
          Left = 4
          Top = 45
          Width = 26
          Height = 13
          Caption = 'Plaza'
        end
        object edACR_REG_NUMERO: TEdit
          Tag = 18
          Left = 94
          Top = 20
          Width = 395
          Height = 21
          HelpContext = 1100
          CharCase = ecUpperCase
          MaxLength = 2000
          TabOrder = 0
          OnExit = edACR_REG_NUMEROExit
          OnKeyPress = edACR_REG_NUMEROKeyPress
        end
        object dtpACR_REG_FECHA: TInterDateTimePicker
          Tag = 18
          Left = 468
          Top = 41
          Width = 21
          Height = 21
          CalAlignment = dtaLeft
          Date = 37770.450694537
          Time = 37770.450694537
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 3
          TabStop = False
          Visible = False
          Edit = edACR_REG_FECHA
          Formato = dfDate
        end
        object edACR_REG_FECHA: TEdit
          Tag = 18
          Left = 388
          Top = 41
          Width = 80
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 2
          Visible = False
          OnExit = edACR_REG_FECHAExit
          OnKeyPress = edACR_REG_FECHAKeyPress
        end
        object edACR_REG_PLAZA: TEdit
          Tag = 18
          Left = 94
          Top = 41
          Width = 197
          Height = 21
          HelpContext = 1110
          CharCase = ecUpperCase
          MaxLength = 50
          TabOrder = 1
          OnExit = edACR_REG_PLAZAExit
          OnKeyPress = edACR_REG_PLAZAKeyPress
        end
      end
      object dtpF_SOLICITUD: TInterDateTimePicker
        Tag = 18
        Left = 177
        Top = 68
        Width = 21
        Height = 21
        CalAlignment = dtaLeft
        Date = 37770.450694537
        Time = 37770.450694537
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 8
        TabStop = False
        Edit = edF_SOLICITUD
        Formato = dfDate
      end
      object edF_SOLICITUD: TEdit
        Tag = 18
        Left = 94
        Top = 68
        Width = 80
        Height = 21
        HelpContext = 1030
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 7
        OnExit = edF_SOLICITUDExit
      end
      object edNOM_ID_PERSONA: TEdit
        Left = 202
        Top = 5
        Width = 295
        Height = 21
        TabStop = False
        Color = clBtnFace
        TabOrder = 2
      end
      object btID_PERSONA: TBitBtn
        Tag = 50
        Left = 177
        Top = 5
        Width = 21
        Height = 21
        HelpContext = 1001
        TabOrder = 1
        OnClick = btID_PERSONAClick
        OnExit = edID_PERSONAExit
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
      object edID_PERSONA: TEdit
        Tag = 562
        Left = 94
        Top = 5
        Width = 80
        Height = 21
        HelpContext = 1000
        CharCase = ecUpperCase
        MaxLength = 8
        TabOrder = 0
        OnExit = edID_PERSONAExit
      end
      object edOBJETO_SOCIAL: TEdit
        Tag = 18
        Left = 94
        Top = 26
        Width = 403
        Height = 21
        HelpContext = 1010
        CharCase = ecUpperCase
        MaxLength = 2000
        TabOrder = 3
        OnExit = edOBJETO_SOCIALExit
        OnKeyPress = edOBJETO_SOCIALKeyPress
      end
      object edID_DOMICILIO: TEdit
        Tag = 530
        Left = 94
        Top = 47
        Width = 80
        Height = 21
        HelpContext = 1020
        CharCase = ecUpperCase
        MaxLength = 6
        PopupMenu = pmDomicilio
        TabOrder = 4
        OnExit = edID_DOMICILIOExit
      end
      object btID_DOMICILIO: TBitBtn
        Tag = 18
        Left = 177
        Top = 47
        Width = 21
        Height = 21
        HelpContext = 1021
        PopupMenu = pmDomicilio
        TabOrder = 5
        OnClick = btID_DOMICILIOClick
        OnExit = edID_DOMICILIOExit
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
      object edNOM_ID_DOMICILIO: TEdit
        Left = 202
        Top = 47
        Width = 295
        Height = 21
        TabStop = False
        Color = clBtnFace
        PopupMenu = pmDomicilio
        TabOrder = 6
      end
      object edCVE_CTO_CRE: TEdit
        Tag = 530
        Left = 94
        Top = 89
        Width = 80
        Height = 21
        HelpContext = 1040
        CharCase = ecUpperCase
        MaxLength = 6
        TabOrder = 9
        OnExit = edCVE_CTO_CREExit
      end
      object btCVE_CTO_CRE: TBitBtn
        Tag = 18
        Left = 177
        Top = 89
        Width = 21
        Height = 21
        HelpContext = 1041
        TabOrder = 10
        OnClick = btCVE_CTO_CREClick
        OnExit = edCVE_CTO_CREExit
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
      object edNOM_CVE_CTO_CRE: TEdit
        Left = 202
        Top = 89
        Width = 295
        Height = 21
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 11
      end
    end
    object TabSheet2: TTabSheet
      Tag = 18
      HelpContext = 20
      Caption = 'Representantes Acreditada'
      ImageIndex = 1
      object Label12: TLabel
        Left = 4
        Top = 16
        Width = 48
        Height = 13
        Caption = 'Nombre(s)'
      end
      object edNOM_REPRESEN_ACR: TMemo
        Tag = 18
        Left = 94
        Top = 16
        Width = 403
        Height = 79
        HelpContext = 1200
        MaxLength = 2000
        ScrollBars = ssVertical
        TabOrder = 0
        OnExit = edNOM_REPRESEN_ACRExit
        OnKeyPress = edNOM_REPRESEN_ACRKeyPress
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 95
        Width = 497
        Height = 106
        Caption = 'Datos de la Escritura en donde consta el Poder'
        TabOrder = 1
        object Label14: TLabel
          Left = 3
          Top = 20
          Width = 37
          Height = 13
          Caption = 'Número'
        end
        object Label16: TLabel
          Left = 295
          Top = 83
          Width = 30
          Height = 13
          Caption = 'Fecha'
          Visible = False
        end
        object Label17: TLabel
          Left = 3
          Top = 41
          Width = 92
          Height = 13
          Caption = 'Notario Público No.'
        end
        object Label19: TLabel
          Left = 3
          Top = 83
          Width = 26
          Height = 13
          Caption = 'Plaza'
        end
        object Label18: TLabel
          Left = 3
          Top = 62
          Width = 52
          Height = 13
          Caption = 'Licenciado'
        end
        object edREP_A_ESC_NUMERO: TEdit
          Tag = 18
          Left = 94
          Top = 16
          Width = 395
          Height = 21
          HelpContext = 1210
          CharCase = ecUpperCase
          MaxLength = 2000
          TabOrder = 0
          OnExit = edREP_A_ESC_NUMEROExit
          OnKeyPress = edREP_A_ESC_NUMEROKeyPress
        end
        object dtpedREP_A_ESC_FECHA: TInterDateTimePicker
          Tag = 18
          Left = 468
          Top = 79
          Width = 21
          Height = 21
          CalAlignment = dtaLeft
          Date = 37770.450694537
          Time = 37770.450694537
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 5
          TabStop = False
          Visible = False
          Edit = edREP_A_ESC_FECHA
          Formato = dfDate
        end
        object edREP_A_ESC_FECHA: TEdit
          Tag = 18
          Left = 388
          Top = 79
          Width = 80
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 4
          Visible = False
          OnExit = edREP_A_ESC_FECHAExit
        end
        object edREP_A_ESC_NOT_PU: TEdit
          Tag = 18
          Left = 94
          Top = 37
          Width = 197
          Height = 21
          HelpContext = 1220
          CharCase = ecUpperCase
          MaxLength = 50
          TabOrder = 1
          OnExit = edREP_A_ESC_NOT_PUExit
          OnKeyPress = edREP_A_ESC_NOT_PUKeyPress
        end
        object edREP_A_ESC_PLAZA: TEdit
          Tag = 18
          Left = 94
          Top = 79
          Width = 197
          Height = 21
          HelpContext = 1240
          CharCase = ecUpperCase
          MaxLength = 50
          TabOrder = 3
          OnExit = edREP_A_ESC_PLAZAExit
          OnKeyPress = edREP_A_ESC_PLAZAKeyPress
        end
        object edREP_A_ESC_NOM_LIC: TEdit
          Tag = 18
          Left = 94
          Top = 58
          Width = 395
          Height = 21
          HelpContext = 1230
          CharCase = ecUpperCase
          MaxLength = 100
          TabOrder = 2
          OnExit = edREP_A_ESC_NOM_LICExit
          OnKeyPress = edREP_A_ESC_NOM_LICKeyPress
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 208
        Width = 497
        Height = 70
        Caption = 'Datos de Inscripción en el Registro Público de Comercio'
        TabOrder = 2
        object Label20: TLabel
          Left = 4
          Top = 24
          Width = 68
          Height = 13
          Caption = 'Folio Mercantil'
        end
        object Label21: TLabel
          Left = 295
          Top = 45
          Width = 30
          Height = 13
          Caption = 'Fecha'
          Visible = False
        end
        object Label22: TLabel
          Left = 4
          Top = 45
          Width = 26
          Height = 13
          Caption = 'Plaza'
        end
        object edREP_A_REG_NUMERO: TEdit
          Tag = 18
          Left = 94
          Top = 20
          Width = 395
          Height = 21
          HelpContext = 1260
          CharCase = ecUpperCase
          MaxLength = 2000
          TabOrder = 0
          OnExit = edREP_A_REG_NUMEROExit
          OnKeyPress = edREP_A_REG_NUMEROKeyPress
        end
        object dtpedREP_A_REG_FECHA: TInterDateTimePicker
          Tag = 18
          Left = 468
          Top = 41
          Width = 21
          Height = 21
          CalAlignment = dtaLeft
          Date = 37770.450694537
          Time = 37770.450694537
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 3
          TabStop = False
          Visible = False
          Edit = edREP_A_REG_FECHA
          Formato = dfDate
        end
        object edREP_A_REG_FECHA: TEdit
          Tag = 18
          Left = 388
          Top = 41
          Width = 80
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 2
          Visible = False
          OnExit = edREP_A_REG_FECHAExit
        end
        object edREP_A_REG_PLAZA: TEdit
          Tag = 18
          Left = 94
          Top = 41
          Width = 197
          Height = 21
          HelpContext = 1270
          CharCase = ecUpperCase
          MaxLength = 50
          TabOrder = 1
          OnExit = edREP_A_REG_PLAZAExit
          OnKeyPress = edREP_A_REG_PLAZAKeyPress
        end
      end
    end
    object TabSheet3: TTabSheet
      Tag = 18
      HelpContext = 30
      Caption = 'Representantes Banco'
      ImageIndex = 2
      object Label23: TLabel
        Left = 4
        Top = 16
        Width = 48
        Height = 13
        Caption = 'Nombre(s)'
      end
      object edNOM_REPRESEN_BIN: TMemo
        Tag = 18
        Left = 94
        Top = 16
        Width = 403
        Height = 79
        HelpContext = 1300
        MaxLength = 2000
        ScrollBars = ssVertical
        TabOrder = 0
        OnExit = edNOM_REPRESEN_BINExit
        OnKeyPress = edNOM_REPRESEN_BINKeyPress
      end
      object GroupBox6: TGroupBox
        Left = 0
        Top = 95
        Width = 497
        Height = 106
        Caption = 'Datos de la Escritura en donde consta el Poder'
        TabOrder = 1
        object Label24: TLabel
          Left = 3
          Top = 20
          Width = 37
          Height = 13
          Caption = 'Número'
        end
        object Label25: TLabel
          Left = 295
          Top = 83
          Width = 30
          Height = 13
          Caption = 'Fecha'
          Visible = False
        end
        object Label26: TLabel
          Left = 3
          Top = 41
          Width = 92
          Height = 13
          Caption = 'Notario Público No.'
        end
        object Label27: TLabel
          Left = 3
          Top = 62
          Width = 52
          Height = 13
          Caption = 'Licenciado'
        end
        object Label28: TLabel
          Left = 3
          Top = 83
          Width = 26
          Height = 13
          Caption = 'Plaza'
        end
        object edREP_B_ESC_NUMERO: TEdit
          Tag = 18
          Left = 94
          Top = 16
          Width = 395
          Height = 21
          HelpContext = 1310
          CharCase = ecUpperCase
          MaxLength = 2000
          TabOrder = 0
          OnExit = edREP_B_ESC_NUMEROExit
          OnKeyPress = edREP_B_ESC_NUMEROKeyPress
        end
        object dtpREP_B_ESC_FECHA: TInterDateTimePicker
          Tag = 18
          Left = 468
          Top = 79
          Width = 21
          Height = 21
          CalAlignment = dtaLeft
          Date = 37770.450694537
          Time = 37770.450694537
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 5
          TabStop = False
          Visible = False
          Edit = edREP_B_ESC_FECHA
          Formato = dfDate
        end
        object edREP_B_ESC_FECHA: TEdit
          Tag = 18
          Left = 388
          Top = 79
          Width = 80
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 4
          Visible = False
          OnExit = edREP_B_ESC_FECHAExit
        end
        object edREP_B_ESC_NOT_PU: TEdit
          Tag = 18
          Left = 94
          Top = 37
          Width = 197
          Height = 21
          HelpContext = 1320
          CharCase = ecUpperCase
          MaxLength = 50
          TabOrder = 1
          OnExit = edREP_B_ESC_NOT_PUExit
          OnKeyPress = edREP_B_ESC_NOT_PUKeyPress
        end
        object edREP_B_ESC_NOM_LI: TEdit
          Tag = 18
          Left = 94
          Top = 58
          Width = 395
          Height = 21
          HelpContext = 1330
          CharCase = ecUpperCase
          MaxLength = 100
          TabOrder = 2
          OnExit = edREP_B_ESC_NOM_LIExit
          OnKeyPress = edREP_B_ESC_NOM_LIKeyPress
        end
        object edREP_B_ESC_PLAZA: TEdit
          Tag = 18
          Left = 94
          Top = 79
          Width = 197
          Height = 21
          HelpContext = 1340
          CharCase = ecUpperCase
          MaxLength = 50
          ReadOnly = True
          TabOrder = 3
          OnExit = edREP_B_ESC_PLAZAExit
          OnKeyPress = edREP_B_ESC_PLAZAKeyPress
        end
      end
      object GroupBox7: TGroupBox
        Left = 0
        Top = 208
        Width = 497
        Height = 70
        Caption = 'Datos de Inscripción en el Registro Público de Comercio'
        TabOrder = 2
        object Label29: TLabel
          Left = 4
          Top = 24
          Width = 68
          Height = 13
          Caption = 'Folio Mercantil'
        end
        object Label30: TLabel
          Left = 295
          Top = 45
          Width = 30
          Height = 13
          Caption = 'Fecha'
          Visible = False
        end
        object Label31: TLabel
          Left = 4
          Top = 45
          Width = 26
          Height = 13
          Caption = 'Plaza'
        end
        object edREP_B_REG_NUMERO: TEdit
          Tag = 18
          Left = 94
          Top = 20
          Width = 395
          Height = 21
          HelpContext = 1360
          CharCase = ecUpperCase
          MaxLength = 2000
          TabOrder = 0
          OnExit = edREP_B_REG_NUMEROExit
          OnKeyPress = edREP_B_REG_NUMEROKeyPress
        end
        object dtpREP_B_REG_FECHA: TInterDateTimePicker
          Tag = 18
          Left = 468
          Top = 41
          Width = 21
          Height = 21
          CalAlignment = dtaLeft
          Date = 37770.450694537
          Time = 37770.450694537
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 3
          TabStop = False
          Visible = False
          Edit = edREP_B_REG_FECHA
          Formato = dfDate
        end
        object edREP_B_REG_FECHA: TEdit
          Tag = 18
          Left = 388
          Top = 41
          Width = 80
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 2
          Visible = False
          OnExit = edREP_B_REG_FECHAExit
        end
        object edREP_B_REG_PLAZA: TEdit
          Tag = 18
          Left = 94
          Top = 41
          Width = 197
          Height = 21
          HelpContext = 1370
          CharCase = ecUpperCase
          MaxLength = 50
          TabOrder = 1
          OnExit = edREP_B_REG_PLAZAExit
          OnKeyPress = edREP_B_REG_PLAZAKeyPress
        end
      end
    end
    object TabSheet4: TTabSheet
      Tag = 18
      HelpContext = 40
      Caption = 'Operación'
      ImageIndex = 3
      object Label32: TLabel
        Left = 0
        Top = 15
        Width = 83
        Height = 13
        Caption = 'Monto del Crédito'
      end
      object Label33: TLabel
        Left = 0
        Top = 36
        Width = 89
        Height = 13
        Caption = 'Destino del Crédito'
      end
      object Label34: TLabel
        Left = 0
        Top = 51
        Width = 82
        Height = 26
        Caption = 'Forma en que se Dispondrá'
        WordWrap = True
      end
      object Label35: TLabel
        Left = 0
        Top = 78
        Width = 42
        Height = 13
        Caption = 'Comisión'
      end
      object Label36: TLabel
        Left = 0
        Top = 99
        Width = 67
        Height = 13
        Caption = 'F.Vencimiento'
      end
      object Label37: TLabel
        Left = 0
        Top = 120
        Width = 72
        Height = 13
        Caption = 'Forma de Pago'
      end
      object Label38: TLabel
        Left = 0
        Top = 137
        Width = 135
        Height = 26
        Caption = 'Forma de pago de Intereses Ordinarios'
        WordWrap = True
      end
      object Label39: TLabel
        Left = 0
        Top = 184
        Width = 121
        Height = 13
        Caption = 'Tasa de Interés Moratorio'
        WordWrap = True
      end
      object Label40: TLabel
        Left = 0
        Top = 206
        Width = 62
        Height = 26
        Caption = 'Garantía del Crédito'
        WordWrap = True
      end
      object Label41: TLabel
        Left = 0
        Top = 163
        Width = 119
        Height = 13
        Caption = 'Tasa de Interés Ordinaria'
        WordWrap = True
      end
      object edOPE_MONTO: TInterEdit
        Tag = 18
        Left = 94
        Top = 11
        Width = 101
        Height = 21
        HelpContext = 1400
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = edOPE_MONTOExit
        OnKeyPress = edACR_ESC_FECHAKeyPress
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 0
        CharCase = ecUpperCase
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edOPE_DESTINO_CRED: TEdit
        Tag = 18
        Left = 94
        Top = 32
        Width = 398
        Height = 21
        HelpContext = 1410
        CharCase = ecUpperCase
        MaxLength = 2000
        TabOrder = 1
        OnExit = edOPE_DESTINO_CREDExit
        OnKeyPress = edOPE_DESTINO_CREDKeyPress
      end
      object edOPE_DISPOSICION: TEdit
        Tag = 18
        Left = 94
        Top = 53
        Width = 398
        Height = 21
        HelpContext = 1420
        CharCase = ecUpperCase
        MaxLength = 2000
        TabOrder = 2
        OnExit = edOPE_DISPOSICIONExit
        OnKeyPress = edOPE_DISPOSICIONKeyPress
      end
      object edOPE_COMISION: TEdit
        Tag = 18
        Left = 94
        Top = 74
        Width = 398
        Height = 21
        HelpContext = 1430
        CharCase = ecUpperCase
        MaxLength = 2000
        TabOrder = 3
        OnExit = edOPE_COMISIONExit
        OnKeyPress = edOPE_COMISIONKeyPress
      end
      object edOPE_F_VENC: TEdit
        Tag = 18
        Left = 94
        Top = 95
        Width = 398
        Height = 21
        HelpContext = 1440
        CharCase = ecUpperCase
        MaxLength = 2000
        TabOrder = 4
        OnExit = edOPE_F_VENCExit
        OnKeyPress = edOPE_F_VENCKeyPress
      end
      object dtpOPE_F_VENC: TInterDateTimePicker
        Tag = 18
        Left = 438
        Top = 95
        Width = 21
        Height = 21
        CalAlignment = dtaLeft
        Date = 37770.450694537
        Time = 37770.450694537
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 5
        TabStop = False
        Visible = False
        Edit = edOPE_F_VENC
        Formato = dfDate
      end
      object edOPE_PAGO_CREDITO: TEdit
        Tag = 18
        Left = 94
        Top = 116
        Width = 398
        Height = 21
        HelpContext = 1450
        CharCase = ecUpperCase
        MaxLength = 2000
        TabOrder = 6
        OnExit = edOPE_PAGO_CREDITOExit
        OnKeyPress = edOPE_PAGO_CREDITOKeyPress
      end
      object edOPE_PAGO_INTER: TEdit
        Tag = 18
        Left = 176
        Top = 137
        Width = 316
        Height = 21
        HelpContext = 1460
        CharCase = ecUpperCase
        MaxLength = 2000
        TabOrder = 7
        OnExit = edOPE_PAGO_INTERExit
        OnKeyPress = edOPE_PAGO_INTERKeyPress
      end
      object edOPE_TASA_INT_MOR: TEdit
        Tag = 18
        Left = 176
        Top = 180
        Width = 316
        Height = 21
        HelpContext = 1480
        CharCase = ecUpperCase
        MaxLength = 2000
        TabOrder = 9
        OnExit = edOPE_TASA_INT_MORExit
        OnKeyPress = edOPE_TASA_INT_MORKeyPress
      end
      object edOPE_GARANTIA_CRE: TMemo
        Tag = 18
        Left = 94
        Top = 206
        Width = 398
        Height = 85
        HelpContext = 1490
        MaxLength = 2000
        ScrollBars = ssVertical
        TabOrder = 10
        OnExit = edOPE_GARANTIA_CREExit
        OnKeyPress = edOPE_GARANTIA_CREKeyPress
      end
      object edOPE_TASA_INT_ORD: TEdit
        Tag = 18
        Left = 176
        Top = 159
        Width = 316
        Height = 21
        HelpContext = 1470
        CharCase = ecUpperCase
        MaxLength = 2000
        TabOrder = 8
        OnExit = edOPE_TASA_INT_ORDExit
        OnKeyPress = edOPE_TASA_INT_ORDKeyPress
      end
    end
  end
  object PnlMsg: TPanel
    Left = 0
    Top = 455
    Width = 505
    Height = 21
    TabOrder = 5
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesEliminar = InterForma1DespuesEliminar
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
    Left = 290
    Top = 8
  end
  object ilID_PERSONA: TInterLinkit
    Control = edID_PERSONA
    OnEjecuta = ilID_PERSONAEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    OnCapture = ilID_PERSONACapture
    Left = 316
    Top = 56
  end
  object ilID_DOMICILIO: TInterLinkit
    Control = edID_DOMICILIO
    OnEjecuta = ilID_DOMICILIOEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    OnCapture = ilID_DOMICILIOCapture
    Left = 324
    Top = 96
  end
  object ilCVE_CTO_CRE: TInterLinkit
    Control = edCVE_CTO_CRE
    OnEjecuta = ilCVE_CTO_CREEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCVE_CTO_CRECapture
    Left = 229
    Top = 141
  end
  object pmDomicilio: TPopupMenu
    Left = 244
    Top = 93
    object AltadeDomicilio1: TMenuItem
      Caption = '&Alta de Domicilio'
      OnClick = AltadeDomicilio1Click
    end
  end
end
