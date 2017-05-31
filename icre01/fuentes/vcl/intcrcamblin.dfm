object WCrcamblin: TWCrcamblin
  Left = 255
  Top = 149
  Width = 580
  Height = 545
  Caption = 'Cambio de Línea'
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
  object Label2: TLabel
    Left = 7
    Top = 12
    Width = 97
    Height = 13
    Caption = 'Disposición / Cesión'
    WordWrap = True
  end
  object Label14: TLabel
    Left = 8
    Top = 249
    Width = 187
    Height = 13
    Caption = 'Seleccione nueva Línea para el crédito'
  end
  object Label29: TLabel
    Left = 8
    Top = 36
    Width = 77
    Height = 13
    Caption = 'Imp. Disposición'
  end
  object Label30: TLabel
    Left = 226
    Top = 39
    Width = 37
    Height = 13
    Caption = 'F. Inicio'
  end
  object Label31: TLabel
    Left = 377
    Top = 39
    Width = 70
    Height = 13
    Caption = 'F. Vencimiento'
  end
  object PnDatos: TPanel
    Left = 0
    Top = 495
    Width = 553
    Height = 21
    TabOrder = 8
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
      Left = 334
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
      Left = 334
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
      Left = 398
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
      Left = 398
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
  object btID_CESION: TBitBtn
    Tag = 17
    Left = 187
    Top = 9
    Width = 21
    Height = 21
    HelpContext = 1601
    TabOrder = 1
    OnClick = btID_CESIONClick
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
  object edNombreAcreditado: TEdit
    Left = 211
    Top = 9
    Width = 343
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 56
    Width = 532
    Height = 185
    Caption = 'Línea Asociada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object Label8: TLabel
      Left = 7
      Top = 25
      Width = 28
      Height = 13
      Caption = 'Línea'
    end
    object lbF_AUT_COMITE: TLabel
      Left = 6
      Top = 47
      Width = 37
      Height = 13
      Caption = 'F. Inicio'
    end
    object lbF_VENCIMIENTO: TLabel
      Left = 157
      Top = 47
      Width = 70
      Height = 13
      Caption = 'F. Vencimiento'
    end
    object Label5: TLabel
      Left = 333
      Top = 48
      Width = 39
      Height = 13
      Caption = 'Moneda'
    end
    object iedID_CONTRATO: TInterEdit
      Left = 52
      Top = 20
      Width = 100
      Height = 21
      HelpContext = 1300
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trContrato
      MaxLength = 10
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
    object edCVE_PRODUCTO: TEdit
      Left = 154
      Top = 20
      Width = 76
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edDESC_PRODUCTO: TEdit
      Left = 233
      Top = 20
      Width = 293
      Height = 21
      TabStop = False
      Color = clBtnFace
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
    end
    object edF_AUT_COMITE: TEdit
      Left = 52
      Top = 43
      Width = 87
      Height = 21
      HelpContext = 5101
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edF_VENCIMIENTO: TEdit
      Left = 233
      Top = 43
      Width = 87
      Height = 21
      HelpContext = 5301
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object GroupBox2: TGroupBox
      Left = 7
      Top = 65
      Width = 185
      Height = 116
      Caption = 'Monto por Disponer de la Línea'
      TabOrder = 6
      object lbIMP_AUTORIZADO: TLabel
        Left = 3
        Top = 27
        Width = 50
        Height = 13
        Caption = 'Autorizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 66
        Top = 38
        Width = 5
        Height = 13
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbIMP_DISPUESTO: TLabel
        Left = 3
        Top = 47
        Width = 47
        Height = 13
        Caption = 'Dispuesto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 66
        Top = 54
        Width = 5
        Height = 13
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbBloqueado: TLabel
        Left = 3
        Top = 67
        Width = 51
        Height = 13
        Caption = 'Bloqueado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 66
        Top = 79
        Width = 8
        Height = 13
        Caption = '='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel8: TBevel
        Left = 76
        Top = 83
        Width = 100
        Height = 5
        Shape = bsBottomLine
        Style = bsRaised
      end
      object Label12: TLabel
        Left = 3
        Top = 94
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
      object edIMP_AUTORIZADO: TInterEdit
        Left = 76
        Top = 23
        Width = 100
        Height = 21
        Hint = 'No aplica para Refinanciamiento'
        HelpContext = 5501
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
        Left = 76
        Top = 43
        Width = 100
        Height = 21
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        TabOrder = 1
        ReadOnly = True
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edIMP_BLOQUEADO: TInterEdit
        Left = 76
        Top = 63
        Width = 100
        Height = 21
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        TabOrder = 2
        ReadOnly = True
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object iedDISPONIBLE_AUT: TInterEdit
        Left = 76
        Top = 90
        Width = 100
        Height = 21
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        TabOrder = 3
        ReadOnly = True
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
    end
    object GroupBox3: TGroupBox
      Left = 192
      Top = 65
      Width = 209
      Height = 116
      Caption = 'Monto por Disponer del Acreditado'
      TabOrder = 7
      object lbIMP_TRANSITO: TLabel
        Left = 1
        Top = 73
        Width = 96
        Height = 13
        Caption = 'Fin. Adicional Global'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 3
        Top = 97
        Width = 73
        Height = 13
        Caption = 'Riesgo Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox4: TGroupBox
        Left = 1
        Top = 11
        Width = 196
        Height = 60
        TabOrder = 0
        object Label17: TLabel
          Left = 2
          Top = 11
          Width = 49
          Height = 13
          Caption = 'Disponible'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 2
          Top = 31
          Width = 81
          Height = 13
          Caption = 'Disponible Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 3
          Top = 48
          Width = 149
          Height = 9
          Caption = '(No aplica para Refinanciamiento)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object iedDISPONIBLE_ACRED: TInterEdit
          Left = 92
          Top = 7
          Width = 100
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,###,##0.00'
          MaxLength = 18
          Color = clBtnFace
          TabOrder = 0
          ReadOnly = True
          UseReType = False
          UseSep = False
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edDISPONIBLE_GRUPO_ECO: TInterEdit
          Left = 92
          Top = 27
          Width = 100
          Height = 19
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,###,##0.00'
          MaxLength = 18
          Color = clBtnFace
          TabOrder = 1
          ReadOnly = True
          UseReType = False
          UseSep = False
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
      end
      object edIMP_FINANC_ADIC: TInterEdit
        Left = 97
        Top = 71
        Width = 100
        Height = 21
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        TabOrder = 1
        ReadOnly = True
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object iedRIESGO_TOTAL: TInterEdit
        Left = 97
        Top = 92
        Width = 100
        Height = 20
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        TabOrder = 2
        ReadOnly = True
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
    end
    object edCve_Moneda: TEdit
      Left = 377
      Top = 44
      Width = 48
      Height = 21
      HelpContext = 5301
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 272
    Width = 561
    Height = 220
    Caption = 'Nueva Línea'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    object Label6: TLabel
      Left = 7
      Top = 25
      Width = 28
      Height = 13
      Caption = 'Línea'
    end
    object Label9: TLabel
      Left = 6
      Top = 47
      Width = 37
      Height = 13
      Caption = 'F. Inicio'
    end
    object Label10: TLabel
      Left = 157
      Top = 47
      Width = 70
      Height = 13
      Caption = 'F. Vencimiento'
    end
    object Label11: TLabel
      Left = 333
      Top = 48
      Width = 39
      Height = 13
      Caption = 'Moneda'
    end
    object iedID_CONTRATO_Dest: TInterEdit
      Tag = 512
      Left = 52
      Top = 20
      Width = 77
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trContrato
      OnExit = iedID_CONTRATO_DestExit
      MaxLength = 10
      TabOrder = 0
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edCVE_PRODUCTO_Dest: TEdit
      Left = 154
      Top = 20
      Width = 76
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edDESC_PRODUCTO_Dest: TEdit
      Left = 233
      Top = 20
      Width = 293
      Height = 21
      TabStop = False
      Color = clBtnFace
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
    end
    object edF_AUT_COMITE_Dest: TEdit
      Tag = 512
      Left = 52
      Top = 41
      Width = 87
      Height = 21
      HelpContext = 5101
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edF_VENCIMIENTO_Dest: TEdit
      Left = 233
      Top = 43
      Width = 87
      Height = 21
      HelpContext = 5301
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object GroupBox6: TGroupBox
      Left = 7
      Top = 65
      Width = 185
      Height = 116
      Caption = 'Monto por Disponer de la Línea'
      TabOrder = 6
      object Label15: TLabel
        Left = 3
        Top = 27
        Width = 50
        Height = 13
        Caption = 'Autorizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 66
        Top = 38
        Width = 5
        Height = 13
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 3
        Top = 47
        Width = 47
        Height = 13
        Caption = 'Dispuesto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 66
        Top = 54
        Width = 5
        Height = 13
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 3
        Top = 67
        Width = 51
        Height = 13
        Caption = 'Bloqueado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 66
        Top = 79
        Width = 8
        Height = 13
        Caption = '='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 76
        Top = 83
        Width = 100
        Height = 5
        Shape = bsBottomLine
        Style = bsRaised
      end
      object Label23: TLabel
        Left = 3
        Top = 94
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
      object edIMP_AUTORIZADO_Dest: TInterEdit
        Left = 76
        Top = 23
        Width = 100
        Height = 21
        Hint = 'No aplica para Refinanciamiento'
        HelpContext = 5501
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
      object edIMP_DISPUESTO_Dest: TInterEdit
        Left = 76
        Top = 43
        Width = 100
        Height = 21
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        TabOrder = 1
        ReadOnly = True
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edIMP_BLOQUEADO_Dest: TInterEdit
        Left = 76
        Top = 63
        Width = 100
        Height = 21
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        TabOrder = 2
        ReadOnly = True
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object iedDISPONIBLE_AUT_Dest: TInterEdit
        Left = 76
        Top = 90
        Width = 100
        Height = 21
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        TabOrder = 3
        ReadOnly = True
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
    end
    object GroupBox7: TGroupBox
      Left = 192
      Top = 65
      Width = 209
      Height = 116
      Caption = 'Monto por Disponer del Acreditado'
      TabOrder = 7
      object Label24: TLabel
        Left = 1
        Top = 73
        Width = 96
        Height = 13
        Caption = 'Fin. Adicional Global'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 3
        Top = 97
        Width = 73
        Height = 13
        Caption = 'Riesgo Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox8: TGroupBox
        Left = 1
        Top = 11
        Width = 196
        Height = 60
        TabOrder = 0
        object Label26: TLabel
          Left = 2
          Top = 11
          Width = 49
          Height = 13
          Caption = 'Disponible'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 2
          Top = 31
          Width = 81
          Height = 13
          Caption = 'Disponible Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 3
          Top = 48
          Width = 149
          Height = 9
          Caption = '(No aplica para Refinanciamiento)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object iedDISPONIBLE_ACRED_Dest: TInterEdit
          Left = 92
          Top = 7
          Width = 100
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,###,##0.00'
          MaxLength = 18
          Color = clBtnFace
          TabOrder = 0
          ReadOnly = True
          UseReType = False
          UseSep = False
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edDISPONIBLE_GRUPO_ECO_Dest: TInterEdit
          Left = 92
          Top = 27
          Width = 100
          Height = 19
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,###,##0.00'
          MaxLength = 18
          Color = clBtnFace
          TabOrder = 1
          ReadOnly = True
          UseReType = False
          UseSep = False
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
      end
      object edIMP_FINANC_ADIC_Dest: TInterEdit
        Left = 97
        Top = 71
        Width = 100
        Height = 21
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        TabOrder = 1
        ReadOnly = True
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object iedRIESGO_TOTAL_Dest: TInterEdit
        Left = 97
        Top = 92
        Width = 100
        Height = 20
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        TabOrder = 2
        ReadOnly = True
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
    end
    object edCve_Moneda_Dest: TEdit
      Left = 377
      Top = 44
      Width = 48
      Height = 21
      HelpContext = 5301
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object btnLinea_Dest: TBitBtn
      Tag = 17
      Left = 132
      Top = 20
      Width = 21
      Height = 20
      HelpContext = 1601
      TabOrder = 9
      OnClick = btnLinea_DestClick
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
    object pnMensaje: TPanel
      Left = 3
      Top = 184
      Width = 554
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
  end
  object edID_CESION: TEdit
    Tag = 512
    Left = 108
    Top = 9
    Width = 76
    Height = 21
    HelpContext = 1000
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 0
    OnExit = edID_CESIONExit
  end
  object edIMP_CREDITO: TInterEdit
    Left = 108
    Top = 32
    Width = 100
    Height = 21
    Hint = 'No aplica para Refinanciamiento'
    HelpContext = 5501
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
  object edFINICIO: TEdit
    Left = 272
    Top = 35
    Width = 87
    Height = 21
    HelpContext = 5101
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object edFVENCIMIENTO: TEdit
    Left = 453
    Top = 35
    Width = 87
    Height = 21
    HelpContext = 5301
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object InterForma1: TInterForma
    IsMain = True
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
    OnBtnAceptar = InterForma1BtnAceptar
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 426
    Top = 2
  end
  object ilCesion: TInterLinkit
    Control = edID_CESION
    OnEjecuta = ilCesionEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 251
    Top = 9
  end
  object ilLinea_Dest: TInterLinkit
    Control = iedID_CONTRATO_Dest
    OnEjecuta = ilLinea_DestEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    Left = 192
    Top = 288
  end
end
