object WCrprodbca: TWCrprodbca
  Left = 377
  Top = 132
  Width = 596
  Height = 473
  Caption = 'Catálogo Producto de Banca'
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
  object PageControl1: TPageControl
    Left = 4
    Top = 5
    Width = 583
    Height = 417
    ActivePage = TabSheet1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Datos Básicos'
      object lbCVE_GRUPO_ECO: TLabel
        Left = 18
        Top = 40
        Width = 76
        Height = 13
        Caption = 'Clave Producto:'
      end
      object Label1: TLabel
        Left = 18
        Top = 76
        Width = 87
        Height = 13
        Caption = 'Descripción Corta:'
      end
      object Label2: TLabel
        Left = 18
        Top = 112
        Width = 89
        Height = 13
        Caption = 'Descripción Larga:'
      end
      object Label3: TLabel
        Left = 18
        Top = 148
        Width = 83
        Height = 13
        Caption = 'Área de Negocio:'
      end
      object Label22: TLabel
        Left = 19
        Top = 183
        Width = 78
        Height = 13
        Caption = 'Grupo Producto:'
      end
      object edCveProd: TInterEdit
        Tag = 18
        Left = 114
        Top = 36
        Width = 103
        Height = 21
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 5
        TabOrder = 0
        CharCase = ecUpperCase
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edDescCorta: TInterEdit
        Tag = 18
        Left = 114
        Top = 72
        Width = 425
        Height = 21
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 29
        TabOrder = 1
        CharCase = ecUpperCase
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edDescLarga: TInterEdit
        Tag = 18
        Left = 114
        Top = 108
        Width = 425
        Height = 21
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 79
        TabOrder = 2
        CharCase = ecUpperCase
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edCveAneg: TInterEdit
        Tag = 530
        Left = 114
        Top = 144
        Width = 79
        Height = 21
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 1
        TabOrder = 3
        CharCase = ecUpperCase
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object btPRODUCTO: TBitBtn
        Tag = 18
        Left = 194
        Top = 144
        Width = 21
        Height = 21
        TabOrder = 4
        OnClick = btPRODUCTOClick
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
      object edDESC_PRODUCTO1: TEdit
        Left = 216
        Top = 144
        Width = 324
        Height = 21
        TabStop = False
        Color = clBtnFace
        TabOrder = 5
      end
      object GroupBox1: TGroupBox
        Left = 12
        Top = 272
        Width = 530
        Height = 97
        TabOrder = 10
        object lbF_ALTA: TLabel
          Left = 12
          Top = 22
          Width = 33
          Height = 13
          Caption = 'F. Alta:'
        end
        object lbCVE_USU_ALTA: TLabel
          Left = 289
          Top = 22
          Width = 46
          Height = 13
          Caption = 'Usu. Alta:'
        end
        object lbF_MODIFICA: TLabel
          Left = 12
          Top = 62
          Width = 55
          Height = 13
          Caption = 'F. Modifica:'
        end
        object lbCVE_USU_MODIFICA: TLabel
          Left = 289
          Top = 62
          Width = 68
          Height = 13
          Caption = 'Usu. Modifica:'
        end
        object edF_ALTA: TInterEdit
          Left = 94
          Top = 18
          Width = 90
          Height = 21
          HelpContext = 1100
          Prefijo = '1'
          Contrato = -1
          TipoReader = trTexto
          MaxLength = 6
          Color = clBtnFace
          TabOrder = 0
          CharCase = ecUpperCase
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edCVE_USU_MODIFICA: TInterEdit
          Left = 384
          Top = 58
          Width = 90
          Height = 21
          HelpContext = 1100
          Prefijo = '1'
          Contrato = -1
          TipoReader = trTexto
          MaxLength = 6
          Color = clBtnFace
          TabOrder = 3
          CharCase = ecUpperCase
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edF_MODIFICA: TInterEdit
          Left = 94
          Top = 58
          Width = 90
          Height = 21
          HelpContext = 1100
          Prefijo = '1'
          Contrato = -1
          TipoReader = trTexto
          MaxLength = 6
          Color = clBtnFace
          TabOrder = 2
          CharCase = ecUpperCase
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edCVE_USU_ALTA: TInterEdit
          Left = 384
          Top = 18
          Width = 90
          Height = 21
          HelpContext = 1100
          Prefijo = '1'
          Contrato = -1
          TipoReader = trTexto
          MaxLength = 6
          Color = clBtnFace
          TabOrder = 1
          CharCase = ecUpperCase
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
      end
      object rgSITUACION: TRadioGroup
        Tag = 18
        Left = 12
        Top = 220
        Width = 530
        Height = 43
        HelpContext = 1400
        Caption = 'Situación'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Activo'
          'Inactivo')
        TabOrder = 9
      end
      object edGpoProdBca: TInterEdit
        Tag = 530
        Left = 114
        Top = 179
        Width = 79
        Height = 21
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 1
        TabOrder = 6
        CharCase = ecUpperCase
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object BitBtn1: TBitBtn
        Tag = 18
        Left = 194
        Top = 179
        Width = 21
        Height = 21
        TabOrder = 7
        OnClick = BitBtn1Click
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
      object edDESC_GPOPRODBCA: TEdit
        Left = 216
        Top = 179
        Width = 324
        Height = 21
        TabStop = False
        Color = clBtnFace
        TabOrder = 8
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Ficha Técnica 1'
      ImageIndex = 1
      object Label4: TLabel
        Left = 8
        Top = 33
        Width = 68
        Height = 13
        Caption = 'Clasifica Legal'
      end
      object Label5: TLabel
        Left = 8
        Top = 69
        Width = 70
        Height = 13
        Caption = 'Registro Conta'
      end
      object Label7: TLabel
        Left = 8
        Top = 141
        Width = 42
        Height = 13
        Caption = 'Comision'
      end
      object Label8: TLabel
        Left = 8
        Top = 177
        Width = 59
        Height = 13
        Caption = 'Tasa Int Ord'
      end
      object Label9: TLabel
        Left = 8
        Top = 247
        Width = 26
        Height = 13
        Caption = 'Plazo'
      end
      object Label10: TLabel
        Left = 8
        Top = 283
        Width = 36
        Height = 13
        Caption = 'Destino'
      end
      object Label11: TLabel
        Left = 8
        Top = 320
        Width = 40
        Height = 13
        Caption = 'Garantia'
      end
      object Label15: TLabel
        Left = 8
        Top = 105
        Width = 35
        Height = 13
        Caption = 'Importe'
      end
      object Label21: TLabel
        Left = 8
        Top = 212
        Width = 69
        Height = 13
        Caption = 'Tasa Int. Mora'
      end
      object edClasLegal: TInterEdit
        Tag = 18
        Left = 88
        Top = 25
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 500
        TabOrder = 0
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edRegCont: TInterEdit
        Tag = 18
        Left = 88
        Top = 61
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 500
        TabOrder = 1
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edImporte: TInterEdit
        Tag = 18
        Left = 88
        Top = 97
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 500
        TabOrder = 2
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edComis: TInterEdit
        Tag = 18
        Left = 88
        Top = 133
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 500
        TabOrder = 3
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edTasIntOrd: TInterEdit
        Tag = 18
        Left = 88
        Top = 169
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 500
        TabOrder = 4
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edPlazo: TInterEdit
        Tag = 18
        Left = 88
        Top = 239
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 500
        TabOrder = 6
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edDestino: TInterEdit
        Tag = 18
        Left = 88
        Top = 275
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 500
        TabOrder = 7
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edGarantia: TInterEdit
        Tag = 18
        Left = 88
        Top = 312
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 500
        TabOrder = 8
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object Button1: TButton
        Left = 191
        Top = 354
        Width = 224
        Height = 20
        Caption = 'Ficha Técnica 2 --->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        OnClick = Button1Click
      end
      object edTasaIntMor: TInterEdit
        Tag = 18
        Left = 88
        Top = 204
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 500
        TabOrder = 5
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Ficha Técnica 2'
      ImageIndex = 2
      object Label6: TLabel
        Left = 8
        Top = 33
        Width = 61
        Height = 13
        Caption = 'Fuente Pago'
      end
      object Label12: TLabel
        Left = 8
        Top = 69
        Width = 56
        Height = 13
        Caption = 'Forma_Disp'
      end
      object Label13: TLabel
        Left = 8
        Top = 105
        Width = 63
        Height = 13
        Caption = 'Pago_Capital'
      end
      object Label14: TLabel
        Left = 8
        Top = 141
        Width = 43
        Height = 13
        Caption = 'Pago Int.'
      end
      object Label16: TLabel
        Left = 8
        Top = 177
        Width = 69
        Height = 13
        Caption = 'Pago Anticipa.'
      end
      object Label17: TLabel
        Left = 8
        Top = 213
        Width = 68
        Height = 13
        Caption = 'Condic. Intrum'
      end
      object Label18: TLabel
        Left = 8
        Top = 249
        Width = 64
        Height = 13
        Caption = 'Caracteristica'
      end
      object Label19: TLabel
        Left = 8
        Top = 286
        Width = 57
        Height = 13
        Caption = 'Lineamiento'
      end
      object Label20: TLabel
        Left = 8
        Top = 323
        Width = 49
        Height = 13
        Caption = 'Transitorio'
      end
      object edFuenPag: TInterEdit
        Tag = 18
        Left = 88
        Top = 25
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 500
        TabOrder = 0
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edFormaDisp: TInterEdit
        Tag = 18
        Left = 88
        Top = 61
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 500
        TabOrder = 1
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edPagCapit: TInterEdit
        Tag = 18
        Left = 88
        Top = 97
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 500
        TabOrder = 2
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edPagInt: TInterEdit
        Tag = 18
        Left = 88
        Top = 133
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 500
        TabOrder = 3
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edPagAnticip: TInterEdit
        Tag = 18
        Left = 88
        Top = 169
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 500
        TabOrder = 4
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edCondIntum: TInterEdit
        Tag = 18
        Left = 88
        Top = 205
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 1000
        TabOrder = 5
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edCaract: TInterEdit
        Tag = 18
        Left = 88
        Top = 241
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 2000
        TabOrder = 6
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edLineamiento: TInterEdit
        Tag = 18
        Left = 88
        Top = 278
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 2000
        TabOrder = 7
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edTransit: TInterEdit
        Tag = 18
        Left = 88
        Top = 315
        Width = 467
        Height = 29
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 2000
        TabOrder = 8
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
    end
  end
  object Button2: TButton
    Left = 322
    Top = 5
    Width = 89
    Height = 19
    Caption = 'Relación ICRE'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 410
    Top = 5
    Width = 89
    Height = 19
    Caption = 'ROE Objetivo'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 498
    Top = 5
    Width = 89
    Height = 19
    Caption = 'Tipo de Crédito'
    TabOrder = 3
    OnClick = Button4Click
  end
  object PnDatos: TPanel
    Left = 4
    Top = 423
    Width = 583
    Height = 21
    TabOrder = 4
    object lbEmpresa: TLabel
      Left = 11
      Top = 4
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
      Top = 11
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
      Top = 4
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
      Top = 11
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
      Left = 56
      Top = 11
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
      Left = 298
      Top = 11
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
      Left = 298
      Top = 4
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
      Left = 56
      Top = 4
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
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 538
    Top = 26
  end
  object ilAREANEG: TInterLinkit
    Control = edCveAneg
    OnEjecuta = ilAREANEGEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    OnCapture = ilAREANEGCapture
    Left = 278
    Top = 166
  end
  object ilGpoProdBca: TInterLinkit
    Control = edGpoProdBca
    OnEjecuta = ilGpoProdBcaEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    OnCapture = ilGpoProdBcaCapture
    Left = 254
    Top = 206
  end
end
