object WCrProducto: TWCrProducto
  Left = 257
  Top = 116
  Width = 678
  Height = 547
  Align = alTop
  Caption = 'Configuración del Producto de la Dispos.'
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
  object lbCVE_PRODUCTO_CRE: TLabel
    Left = 8
    Top = 32
    Width = 88
    Height = 13
    Caption = 'Clave de Producto'
  end
  object lbDESC_L_PRODUCTO: TLabel
    Left = 8
    Top = 56
    Width = 86
    Height = 13
    Caption = 'Descripción Larga'
  end
  object lbDESC_C_PRODUCTO: TLabel
    Left = 240
    Top = 32
    Width = 84
    Height = 13
    Caption = 'Descripción Corta'
  end
  object lbCVE_USU_MODIFICA: TLabel
    Left = 238
    Top = 415
    Width = 65
    Height = 13
    Caption = 'Usu. Modifica'
  end
  object lbCVE_USU_ALTA: TLabel
    Left = 238
    Top = 390
    Width = 43
    Height = 13
    Caption = 'Usu. Alta'
  end
  object lbF_ALTA: TLabel
    Left = 2
    Top = 387
    Width = 30
    Height = 13
    Caption = 'F. Alta'
  end
  object lbF_MODIFICA: TLabel
    Left = 2
    Top = 412
    Width = 52
    Height = 13
    Caption = 'F. Modifica'
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 41
    Height = 13
    Caption = 'Empresa'
  end
  object PnDatos: TPanel
    Left = -1
    Top = 486
    Width = 658
    Height = 21
    TabOrder = 13
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
  object MsgPanel: TPanel
    Left = -1
    Top = 463
    Width = 658
    Height = 20
    TabOrder = 12
  end
  object pgAltaDatos: TPageControl
    Left = 0
    Top = 75
    Width = 657
    Height = 302
    ActivePage = TabSheet1
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 5
    TabStop = False
    object TabSheet1: TTabSheet
      Caption = 'Configuración del Producto'
      object GroupBox7: TGroupBox
        Left = 1
        Top = -1
        Width = 646
        Height = 274
        TabOrder = 0
        object Label2: TLabel
          Left = 8
          Top = 23
          Width = 75
          Height = 13
          Caption = 'Grupo Producto'
        end
        object lbCVE_CLAS_CONTAB: TLabel
          Left = 8
          Top = 51
          Width = 80
          Height = 13
          Caption = 'Catálogo Mínimo'
        end
        object lbCVE_CLAS_LEGAL: TLabel
          Left = 8
          Top = 77
          Width = 88
          Height = 13
          Caption = 'Clasificación Legal'
        end
        object Label3: TLabel
          Left = 8
          Top = 104
          Width = 111
          Height = 13
          Caption = 'Tipo Cuenta Buró Créd.'
        end
        object Label4: TLabel
          Left = 8
          Top = 171
          Width = 73
          Height = 13
          Caption = 'Tipo de Cartera'
        end
        object lbCVE_PR_CONTABLE: TLabel
          Left = 296
          Top = 171
          Width = 70
          Height = 13
          Caption = 'Prod. Contable'
        end
        object lbCVE_IND_ADI_CONT: TLabel
          Left = 472
          Top = 171
          Width = 99
          Height = 13
          Caption = 'Indicador Adic. Cont.'
        end
        object Label5: TLabel
          Left = 296
          Top = 192
          Width = 205
          Height = 13
          Caption = 'Día en que se Genera el Estado de Cuenta'
        end
        object edCVE_PRODUCTO_GPO: TEdit
          Tag = 530
          Left = 128
          Top = 17
          Width = 73
          Height = 21
          HelpContext = 1040
          CharCase = ecUpperCase
          MaxLength = 20
          TabOrder = 0
          OnExit = edCVE_PRODUCTO_GPOExit
        end
        object btCVE_PRODUCTO_GPO: TBitBtn
          Tag = 18
          Left = 207
          Top = 18
          Width = 22
          Height = 20
          HelpContext = 1041
          TabOrder = 1
          OnClick = btCVE_PRODUCTO_GPOClick
          OnExit = edCVE_PRODUCTO_GPOExit
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
        object edDESC_L_PROD_GPO: TEdit
          Left = 228
          Top = 17
          Width = 410
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 2
        end
        object edCVE_CLAS_CONTAB: TEdit
          Tag = 530
          Left = 128
          Top = 44
          Width = 73
          Height = 21
          HelpContext = 1050
          CharCase = ecUpperCase
          MaxLength = 20
          TabOrder = 3
          OnExit = edCVE_CLAS_CONTABExit
        end
        object btCVE_CLAS_CONTAB: TBitBtn
          Tag = 18
          Left = 207
          Top = 44
          Width = 22
          Height = 20
          HelpContext = 1051
          TabOrder = 4
          OnClick = btCVE_CLAS_CONTABClick
          OnExit = edCVE_CLAS_CONTABExit
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
        object edDESC_CLAS_CONTAB: TEdit
          Left = 228
          Top = 44
          Width = 410
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 5
        end
        object edCVE_CLAS_LEGAL: TEdit
          Tag = 530
          Left = 128
          Top = 73
          Width = 73
          Height = 21
          HelpContext = 1060
          CharCase = ecUpperCase
          MaxLength = 2
          TabOrder = 6
          OnExit = edCVE_CLAS_LEGALExit
        end
        object btCVE_CLAS_LEGAL: TBitBtn
          Tag = 18
          Left = 207
          Top = 73
          Width = 22
          Height = 20
          HelpContext = 1061
          TabOrder = 7
          OnClick = btCVE_CLAS_LEGALClick
          OnExit = edCVE_CLAS_LEGALExit
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
        object edDESC_CLAS_LEGAL: TEdit
          Left = 228
          Top = 73
          Width = 410
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 8
        end
        object edCVE_TIPO_CRED_BC: TEdit
          Tag = 530
          Left = 128
          Top = 100
          Width = 73
          Height = 21
          HelpContext = 1070
          CharCase = ecUpperCase
          MaxLength = 20
          TabOrder = 9
          OnExit = edCVE_TIPO_CRED_BCExit
        end
        object btCVE_TIPO_CRED_BC: TBitBtn
          Tag = 18
          Left = 207
          Top = 100
          Width = 22
          Height = 20
          HelpContext = 1071
          TabOrder = 10
          OnClick = btCVE_TIPO_CRED_BCClick
          OnExit = edCVE_TIPO_CRED_BCExit
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
        object edDESC_TIPO_CRED: TEdit
          Left = 228
          Top = 100
          Width = 410
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 11
        end
        object rgCVE_REVOLVENCIA: TRadioGroup
          Tag = 18
          Left = 7
          Top = 126
          Width = 630
          Height = 33
          HelpContext = 1080
          Caption = 'Revolvencia'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'Revolvente'
            'No Revolvente'
            'Ambos')
          TabOrder = 12
          TabStop = True
          OnExit = rgCVE_REVOLVENCIAExit
        end
        object cbxCVE_TIPO_CARTERA: TComboBox
          Tag = 18
          Left = 128
          Top = 166
          Width = 153
          Height = 22
          HelpContext = 1081
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 13
          OnExit = cbxCVE_TIPO_CARTERAExit
        end
        object edCVE_PR_CONTABLE: TEdit
          Tag = 530
          Left = 384
          Top = 167
          Width = 73
          Height = 21
          HelpContext = 1082
          CharCase = ecUpperCase
          MaxLength = 6
          TabOrder = 14
          OnExit = edCVE_PR_CONTABLEExit
        end
        object edCVE_IND_ADI_CONT: TEdit
          Tag = 530
          Left = 592
          Top = 167
          Width = 45
          Height = 21
          HelpContext = 1083
          CharCase = ecUpperCase
          MaxLength = 6
          TabOrder = 15
          OnExit = edCVE_IND_ADI_CONTExit
        end
        object cbB_GENERA_EDOCTA: TCheckBox
          Tag = 18
          Left = 7
          Top = 192
          Width = 272
          Height = 17
          HelpContext = 1084
          Alignment = taLeftJustify
          Caption = 'Genera Estado de Cuenta en el Cierre'
          TabOrder = 16
          OnClick = cbB_GENERA_EDOCTAClick
          OnExit = cbB_GENERA_EDOCTAExit
        end
        object iedDIA_GEN_EDO_CTA: TInterEdit
          Tag = 18
          Left = 592
          Top = 188
          Width = 45
          Height = 21
          HelpContext = 1085
          Prefijo = '1'
          Contrato = -1
          TipoReader = trEntero
          OnExit = iedDIA_GEN_EDO_CTAExit
          DisplayMask = '####0'
          MaxLength = 5
          TabOrder = 17
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object chB_GENERA_CONTA: TCheckBox
          Tag = 18
          Left = 7
          Top = 207
          Width = 272
          Height = 17
          HelpContext = 1086
          Alignment = taLeftJustify
          Caption = 'Genera Contabilidad'
          TabOrder = 18
          OnExit = chB_GENERA_CONTAExit
        end
        object chB_GEN_CONT_CC: TCheckBox
          Tag = 18
          Left = 296
          Top = 207
          Width = 341
          Height = 17
          HelpContext = 1087
          Alignment = taLeftJustify
          Caption = 'Genera Contabilidad con Centro de Costos'
          TabOrder = 19
          OnExit = chB_GEN_CONT_CCExit
        end
        object chB_GEN_CONT_PROV: TCheckBox
          Tag = 18
          Left = 7
          Top = 222
          Width = 272
          Height = 17
          HelpContext = 1088
          Alignment = taLeftJustify
          Caption = 'Genera Provisión de Intereses'
          TabOrder = 20
          OnExit = chB_GEN_CONT_PROVExit
        end
        object chB_REP_REG_CNBV: TCheckBox
          Tag = 18
          Left = 296
          Top = 222
          Width = 341
          Height = 17
          HelpContext = 1089
          Alignment = taLeftJustify
          Caption = 'Genera Reportes Regulatorios'
          TabOrder = 21
          OnExit = chB_REP_REG_CNBVExit
        end
        object cbB_DISP_EN_LINEA: TCheckBox
          Tag = 18
          Left = 7
          Top = 237
          Width = 272
          Height = 17
          HelpContext = 1090
          Alignment = taLeftJustify
          Caption = 'Permite Operaciones en Línea'
          TabOrder = 22
          OnExit = cbB_DISP_EN_LINEAExit
        end
        object chB_SOBREGIRO: TCheckBox
          Tag = 18
          Left = 296
          Top = 238
          Width = 341
          Height = 17
          HelpContext = 1091
          Alignment = taLeftJustify
          Caption = 'Permite Sobregiro en Chequeras'
          TabOrder = 23
          OnExit = chB_SOBREGIROExit
        end
        object chB_REESTRUCTURA: TCheckBox
          Tag = 18
          Left = 7
          Top = 252
          Width = 272
          Height = 17
          HelpContext = 1092
          Alignment = taLeftJustify
          Caption = 'Producto de Reestructura'
          TabOrder = 24
          OnExit = chB_REESTRUCTURAExit
        end
        object chB_LINEA_CREDITO: TCheckBox
          Tag = 18
          Left = 296
          Top = 252
          Width = 341
          Height = 17
          HelpContext = 1093
          Alignment = taLeftJustify
          Caption = 'Línea de Crédito'
          TabOrder = 25
          OnExit = chB_LINEA_CREDITOExit
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Configuración de Autorización'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 1
        Top = 0
        Width = 648
        Height = 153
        TabOrder = 0
        object chB_GARANTIA: TCheckBox
          Tag = 18
          Left = 8
          Top = 130
          Width = 200
          Height = 17
          HelpContext = 2060
          Alignment = taLeftJustify
          Caption = 'Requiere Garantía'
          TabOrder = 5
          OnExit = chB_GARANTIAExit
        end
        object chB_MOD_TASA_REFER: TCheckBox
          Tag = 18
          Left = 224
          Top = 34
          Width = 200
          Height = 17
          HelpContext = 2080
          Alignment = taLeftJustify
          Caption = 'Mod. Tasa Ref. Aut.'
          TabOrder = 7
          OnExit = chB_MOD_TASA_REFERExit
        end
        object chB_MOD_OPER_STASA: TCheckBox
          Tag = 18
          Left = 224
          Top = 74
          Width = 200
          Height = 17
          HelpContext = 3000
          Alignment = taLeftJustify
          Caption = 'Mod. Ope. SobreTasa Aut.'
          TabOrder = 9
          OnExit = chB_MOD_OPER_STASAExit
        end
        object chB_MOD_SOBRETASA: TCheckBox
          Tag = 18
          Left = 224
          Top = 53
          Width = 200
          Height = 17
          HelpContext = 2090
          Alignment = taLeftJustify
          Caption = 'Mod. SobreTasa Aut.'
          TabOrder = 8
          OnExit = chB_MOD_SOBRETASAExit
        end
        object chB_INDICA_TASA_AU: TCheckBox
          Tag = 18
          Left = 224
          Top = 15
          Width = 200
          Height = 17
          HelpContext = 2070
          Alignment = taLeftJustify
          Caption = 'Indica Tasa en Aut.'
          TabOrder = 6
          OnExit = chB_INDICA_TASA_AUExit
        end
        object chB_DIAS_ADIC_PAGO: TCheckBox
          Tag = 18
          Left = 7
          Top = 15
          Width = 200
          Height = 17
          HelpContext = 2010
          Alignment = taLeftJustify
          Caption = 'Aplica Días Adicionales Pago'
          TabOrder = 0
          OnExit = chB_DIAS_ADIC_PAGOExit
        end
        object chB_PER_MORAL: TCheckBox
          Tag = 18
          Left = 7
          Top = 34
          Width = 200
          Height = 17
          HelpContext = 2020
          Alignment = taLeftJustify
          Caption = 'Aplica Persona Moral'
          TabOrder = 1
          OnExit = chB_PER_MORALExit
        end
        object chB_PER_FISICA: TCheckBox
          Tag = 18
          Left = 7
          Top = 53
          Width = 200
          Height = 17
          HelpContext = 2030
          Alignment = taLeftJustify
          Caption = 'Aplica Persona Física'
          TabOrder = 2
          OnExit = chB_PER_FISICAExit
        end
        object chB_APLICA_IVA: TCheckBox
          Tag = 18
          Left = 224
          Top = 94
          Width = 200
          Height = 17
          HelpContext = 3010
          Alignment = taLeftJustify
          Caption = 'Aplica IVA Intereses'
          TabOrder = 10
          OnExit = chB_APLICA_IVAExit
        end
        object chB_FINANC_ADIC: TCheckBox
          Tag = 18
          Left = 7
          Top = 74
          Width = 200
          Height = 17
          HelpContext = 2040
          Alignment = taLeftJustify
          Caption = 'Aplica Finan. Adicional'
          TabOrder = 3
          OnClick = chB_FINANC_ADICClick
          OnExit = chB_FINANC_ADICExit
        end
        object chB_APL_CONVE_MOD: TCheckBox
          Tag = 18
          Left = 440
          Top = 134
          Width = 200
          Height = 17
          HelpContext = 4000
          Alignment = taLeftJustify
          Caption = 'Convenio Modificatorio'
          TabOrder = 19
          OnExit = chB_APL_CONVE_MODExit
        end
        object chB_APL_EVEN_ACEL: TCheckBox
          Tag = 18
          Left = 224
          Top = 114
          Width = 200
          Height = 17
          HelpContext = 3020
          Alignment = taLeftJustify
          Caption = 'Evento Aceleración'
          TabOrder = 11
          OnExit = chB_APL_EVEN_ACELExit
        end
        object chB_APL_RENOVACION: TCheckBox
          Tag = 18
          Left = 440
          Top = 34
          Width = 200
          Height = 17
          HelpContext = 3050
          Alignment = taLeftJustify
          Caption = 'Aplica Renovación'
          TabOrder = 14
          OnExit = chB_APL_RENOVACIONExit
        end
        object chB_APL_REESTRUCT: TCheckBox
          Tag = 18
          Left = 440
          Top = 94
          Width = 200
          Height = 17
          HelpContext = 3080
          Alignment = taLeftJustify
          Caption = 'Aplica Reestructuración'
          TabOrder = 17
          OnExit = chB_APL_REESTRUCTExit
        end
        object chB_APL_PRORROGA: TCheckBox
          Tag = 18
          Left = 440
          Top = 15
          Width = 200
          Height = 17
          HelpContext = 3040
          Alignment = taLeftJustify
          Caption = 'Aplica Prorrogas'
          TabOrder = 13
          OnExit = chB_APL_PRORROGAExit
        end
        object chB_EXCESO_EVE: TCheckBox
          Tag = 18
          Left = 224
          Top = 134
          Width = 200
          Height = 17
          HelpContext = 3030
          Alignment = taLeftJustify
          Caption = 'Incremento / Decremento Temporada'
          TabOrder = 12
          OnExit = chB_EXCESO_EVEExit
        end
        object rgCVE_FINANC_ADIC: TRadioGroup
          Tag = 18
          Left = 7
          Top = 94
          Width = 202
          Height = 30
          HelpContext = 2050
          Caption = 'Tipo de Financiamiento Adicional'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Directo'
            'Prorrateo')
          TabOrder = 4
          OnExit = rgCVE_FINANC_ADICExit
        end
        object chB_APL_PAG25REN: TCheckBox
          Tag = 18
          Left = 440
          Top = 53
          Width = 200
          Height = 17
          HelpContext = 3060
          Alignment = taLeftJustify
          Caption = 'Aplica Pago 25% para Renovación'
          TabOrder = 15
          OnExit = chB_APL_PAG25RENExit
        end
        object chB_PLAZO_RE: TCheckBox
          Tag = 18
          Left = 440
          Top = 74
          Width = 200
          Height = 17
          HelpContext = 3070
          Alignment = taLeftJustify
          Caption = 'Validacion de Plazo para Renovacion'
          TabOrder = 16
          OnExit = chB_PLAZO_REExit
        end
        object chB_PLAZO_RS: TCheckBox
          Tag = 18
          Left = 440
          Top = 114
          Width = 200
          Height = 17
          HelpContext = 3090
          Alignment = taLeftJustify
          Caption = 'Validacion de Plazo para Reestructura'
          TabOrder = 18
          OnExit = chB_PLAZO_RSExit
        end
      end
      object GroupBox1: TGroupBox
        Left = 1
        Top = 152
        Width = 647
        Height = 117
        Caption = 'Rango de Plazo y Monto de Autorización'
        TabOrder = 1
        object lbIMP_MIN_AUT_CRE: TLabel
          Left = 10
          Top = 80
          Width = 68
          Height = 13
          Caption = 'Monto Mínimo'
        end
        object lbIMP_MAX_AUT_CRE: TLabel
          Left = 343
          Top = 80
          Width = 69
          Height = 13
          Caption = 'Monto Máximo'
        end
        object lbPLAZO_MAX_CREDITO: TLabel
          Left = 343
          Top = 27
          Width = 95
          Height = 13
          Caption = 'Plazo Máximo (días)'
        end
        object lbPLAZO_MIN_CREDITO: TLabel
          Left = 10
          Top = 27
          Width = 94
          Height = 13
          Caption = 'Plazo Mínimo (días)'
        end
        object Bevel2: TBevel
          Left = 1
          Top = 60
          Width = 642
          Height = 2
        end
        object Label7: TLabel
          Left = 10
          Top = 53
          Width = 106
          Height = 13
          Caption = 'Monto de Autorización'
        end
        object IedIMP_MIN_AUT_CRE: TInterEdit
          Tag = 18
          Left = 174
          Top = 76
          Width = 100
          Height = 21
          HelpContext = 3090
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = IedIMP_MIN_AUT_CREExit
          MaxLength = 18
          TabOrder = 5
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object IedIMP_MAX_AUT_CRE: TInterEdit
          Tag = 18
          Left = 505
          Top = 76
          Width = 100
          Height = 21
          HelpContext = 4000
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = IedIMP_MAX_AUT_CREExit
          MaxLength = 18
          TabOrder = 6
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object cbB_RANGO_IMP_CRE: TCheckBox
          Tag = 18
          Left = 620
          Top = 78
          Width = 17
          Height = 17
          HelpContext = 4010
          Caption = '.'
          TabOrder = 7
          OnClick = cbB_RANGO_IMP_CREClick
          OnExit = cbB_RANGO_IMP_CREExit
        end
        object cbB_RANGO_PLA_CRE: TCheckBox
          Tag = 18
          Left = 620
          Top = 25
          Width = 17
          Height = 17
          HelpContext = 3080
          Caption = '.'
          TabOrder = 4
          OnClick = cbB_RANGO_PLA_CREClick
          OnExit = cbB_RANGO_PLA_CREExit
        end
        object btPLAZOMAXCRED: TBitBtn
          Tag = 18
          Left = 586
          Top = 23
          Width = 22
          Height = 20
          HelpContext = 3071
          TabOrder = 3
          TabStop = False
          OnClick = btPLAZOMAXCREDClick
          OnExit = IedPLAZO_MAX_CREDITOExit
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
        end
        object IedPLAZO_MAX_CREDITO: TInterEdit
          Tag = 18
          Left = 505
          Top = 23
          Width = 80
          Height = 21
          HelpContext = 3070
          Prefijo = '1'
          Contrato = -1
          TipoReader = trEntero
          OnExit = IedPLAZO_MAX_CREDITOExit
          DisplayMask = '####0'
          MaxLength = 5
          TabOrder = 2
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object btPLAZOMINCRED: TBitBtn
          Tag = 18
          Left = 255
          Top = 23
          Width = 22
          Height = 20
          HelpContext = 3061
          TabOrder = 1
          TabStop = False
          OnClick = btPLAZOMINCREDClick
          OnExit = IedPLAZO_MIN_CREDITOExit
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
        end
        object IedPLAZO_MIN_CREDITO: TInterEdit
          Tag = 18
          Left = 173
          Top = 23
          Width = 80
          Height = 21
          HelpContext = 3060
          Prefijo = '1'
          Contrato = -1
          TipoReader = trEntero
          OnExit = IedPLAZO_MIN_CREDITOExit
          DisplayMask = '####0'
          MaxLength = 5
          TabOrder = 0
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Configuración de Operación'
      ImageIndex = 2
      object lbCVE_GEN_TIP_PAG: TLabel
        Left = 5
        Top = 209
        Width = 98
        Height = 13
        Caption = 'Tipo de Pago a Usar'
      end
      object GroupBox6: TGroupBox
        Left = 2
        Top = -2
        Width = 476
        Height = 97
        TabOrder = 0
        object Bevel3: TBevel
          Left = 306
          Top = 6
          Width = 2
          Height = 89
        end
        object chB_MOD_TASA_REF_D: TCheckBox
          Tag = 18
          Left = 7
          Top = 8
          Width = 155
          Height = 17
          HelpContext = 4020
          Alignment = taLeftJustify
          Caption = 'Mod. Tasa Ref. Disposición'
          TabOrder = 0
          OnExit = chB_MOD_TASA_REF_DExit
        end
        object chB_MOD_STASA_D: TCheckBox
          Tag = 18
          Left = 7
          Top = 24
          Width = 155
          Height = 17
          HelpContext = 4021
          Alignment = taLeftJustify
          Caption = 'Mod. SobreTasa Disposición'
          TabOrder = 1
          OnExit = chB_MOD_STASA_DExit
        end
        object chB_MOD_OP_STASA_D: TCheckBox
          Tag = 18
          Left = 7
          Top = 40
          Width = 155
          Height = 17
          HelpContext = 4022
          Alignment = taLeftJustify
          Caption = 'Mod. Ope. SobreTasa Disp.'
          TabOrder = 2
          OnExit = chB_MOD_OP_STASA_DExit
        end
        object chB_CONSULTA_CAP: TCheckBox
          Tag = 18
          Left = 166
          Top = 8
          Width = 137
          Height = 17
          HelpContext = 4025
          Alignment = taLeftJustify
          Caption = 'Consulta Capital'
          TabOrder = 5
          OnExit = chB_CONSULTA_CAPExit
        end
        object chB_CONSULTA_INT: TCheckBox
          Tag = 18
          Left = 166
          Top = 24
          Width = 137
          Height = 17
          HelpContext = 4026
          Alignment = taLeftJustify
          Caption = 'Consulta Interés'
          TabOrder = 6
          OnExit = chB_CONSULTA_INTExit
        end
        object chB_CONSULTA_COM: TCheckBox
          Tag = 18
          Left = 166
          Top = 40
          Width = 137
          Height = 17
          HelpContext = 4027
          Alignment = taLeftJustify
          Caption = 'Consulta Comisión'
          TabOrder = 7
          OnExit = chB_CONSULTA_COMExit
        end
        object chB_CONSULTA_DOC: TCheckBox
          Tag = 18
          Left = 166
          Top = 56
          Width = 137
          Height = 17
          HelpContext = 4028
          Alignment = taLeftJustify
          Caption = 'Consulta Documentos'
          TabOrder = 8
          OnExit = chB_CONSULTA_DOCExit
        end
        object chB_CONSULTA_FIN: TCheckBox
          Tag = 18
          Left = 166
          Top = 72
          Width = 137
          Height = 17
          HelpContext = 4029
          Alignment = taLeftJustify
          Caption = 'Consulta Financiamiento'
          TabOrder = 9
          OnExit = chB_CONSULTA_FINExit
        end
        object chB_APL_MOR_INT: TCheckBox
          Tag = 18
          Left = 7
          Top = 72
          Width = 155
          Height = 17
          HelpContext = 4024
          Alignment = taLeftJustify
          Caption = 'Apl. Moras en Interés'
          TabOrder = 4
          OnExit = chB_APL_MOR_INTExit
        end
        object cbB_CALI_ACRE_DISP: TCheckBox
          Tag = 18
          Left = 7
          Top = 57
          Width = 155
          Height = 17
          HelpContext = 4023
          Alignment = taLeftJustify
          Caption = 'Asigna Calif. Acred. a Disp.'
          TabOrder = 3
          OnExit = cbB_CALI_ACRE_DISPExit
        end
        object rgCVE_CALCULO_INT: TRadioGroup
          Tag = 18
          Left = 306
          Top = 48
          Width = 87
          Height = 49
          HelpContext = 5020
          Caption = 'Calculo Interés'
          ItemIndex = 0
          Items.Strings = (
            'Por Día'
            'Líneal')
          TabOrder = 11
          OnExit = rgCVE_CALCULO_INTExit
        end
        object rgCVE_AJUSTE_F_VTO: TRadioGroup
          Tag = 18
          Left = 306
          Top = 0
          Width = 175
          Height = 48
          HelpContext = 4030
          Caption = 'Fecha Vencimiento Día Hábil'
          Columns = 3
          ItemIndex = 2
          Items.Strings = (
            'An Ha'
            'Po Ha'
            'M.D.')
          TabOrder = 10
          TabStop = True
          OnExit = rgCVE_AJUSTE_F_VTOExit
        end
        object rgCVE_CAL_CAPITAL: TRadioGroup
          Tag = 18
          Left = 392
          Top = 48
          Width = 89
          Height = 49
          HelpContext = 5025
          Caption = 'Cálculo Cap.'
          ItemIndex = 0
          Items.Strings = (
            'Tradicional'
            'VPN')
          TabOrder = 12
          OnClick = rgCVE_CAL_CAPITALClick
          OnExit = rgCVE_CAL_CAPITALExit
        end
      end
      object GroupBox5: TGroupBox
        Left = 2
        Top = 94
        Width = 647
        Height = 106
        Caption = 'Plazo de Operación'
        TabOrder = 2
        object lbPLAZO_MIN_DISP: TLabel
          Left = 10
          Top = 16
          Width = 94
          Height = 13
          Caption = 'Plazo Mínimo (días)'
        end
        object lbPLAZO_MAX_DISP: TLabel
          Left = 377
          Top = 16
          Width = 95
          Height = 13
          Caption = 'Plazo Máximo (días)'
        end
        object lbIMP_MIN_AUT_DIS: TLabel
          Left = 10
          Top = 84
          Width = 68
          Height = 13
          Caption = 'Monto Mínimo'
        end
        object lbIMP_MAX_AUT_DIS: TLabel
          Left = 218
          Top = 84
          Width = 69
          Height = 13
          Caption = 'Monto Máximo'
        end
        object Bevel1: TBevel
          Left = 1
          Top = 76
          Width = 644
          Height = 2
        end
        object Label6: TLabel
          Left = 10
          Top = 69
          Width = 97
          Height = 13
          Caption = 'Monto de Operación'
        end
        object lbNUM_DMIN_REQ_PER: TLabel
          Left = 11
          Top = 37
          Width = 139
          Height = 13
          Caption = 'Días Mín. Req. por el Period.'
        end
        object lbNUM_DIAS_AGR_PER: TLabel
          Left = 377
          Top = 37
          Width = 123
          Height = 13
          Caption = 'Días a Agregar a la F Vto.'
        end
        object Label8: TLabel
          Left = 434
          Top = 84
          Width = 102
          Height = 13
          Caption = 'Monto Mínimo x Doc.'
        end
        object IedPLAZO_MIN_DISP: TInterEdit
          Tag = 18
          Left = 155
          Top = 12
          Width = 80
          Height = 21
          HelpContext = 5040
          Prefijo = '1'
          Contrato = -1
          TipoReader = trEntero
          OnExit = IedPLAZO_MIN_DISPExit
          DisplayMask = '####0'
          MaxLength = 5
          TabOrder = 0
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object btPLAZOMINDISP: TBitBtn
          Tag = 18
          Left = 236
          Top = 12
          Width = 22
          Height = 20
          HelpContext = 5041
          TabOrder = 1
          TabStop = False
          OnClick = btPLAZOMINDISPClick
          OnExit = IedPLAZO_MIN_DISPExit
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
        end
        object IedPLAZO_MAX_DISP: TInterEdit
          Tag = 18
          Left = 507
          Top = 12
          Width = 74
          Height = 21
          HelpContext = 5050
          Prefijo = '1'
          Contrato = -1
          TipoReader = trEntero
          OnExit = IedPLAZO_MAX_DISPExit
          DisplayMask = '####0'
          MaxLength = 5
          TabOrder = 2
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object btPLAZOMAXDISP: TBitBtn
          Tag = 18
          Left = 583
          Top = 12
          Width = 22
          Height = 20
          HelpContext = 5051
          TabOrder = 3
          TabStop = False
          OnClick = btPLAZOMAXDISPClick
          OnExit = IedPLAZO_MAX_DISPExit
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
        end
        object cbB_RANGO_PLA_DISP: TCheckBox
          Tag = 18
          Left = 628
          Top = 14
          Width = 17
          Height = 17
          HelpContext = 5060
          Caption = '.'
          TabOrder = 4
          OnClick = cbB_RANGO_PLA_DISPClick
          OnExit = cbB_RANGO_PLA_DISPExit
        end
        object chB_PLAZO_CREDITO: TCheckBox
          Tag = 18
          Left = 8
          Top = 54
          Width = 633
          Height = 17
          HelpContext = 5090
          Alignment = taLeftJustify
          Caption = 
            'Permite registrar disposiciones cuya fecha de vencimiento sobrep' +
            'ase la vigencia de la autorización.'
          TabOrder = 7
          OnExit = chB_PLAZO_CREDITOExit
        end
        object IedIMP_MIN_AUT_DIS: TInterEdit
          Tag = 18
          Left = 107
          Top = 80
          Width = 100
          Height = 21
          HelpContext = 6010
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = IedIMP_MIN_AUT_DISExit
          MaxLength = 18
          TabOrder = 8
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object IedIMP_MAX_AUT_DIS: TInterEdit
          Tag = 18
          Left = 307
          Top = 80
          Width = 100
          Height = 21
          HelpContext = 6020
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = IedIMP_MAX_AUT_DISExit
          MaxLength = 18
          TabOrder = 9
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object cbB_RANGO_IMP_DISP: TCheckBox
          Tag = 18
          Left = 412
          Top = 82
          Width = 17
          Height = 17
          HelpContext = 6030
          Caption = '.'
          TabOrder = 10
          OnClick = cbB_RANGO_IMP_DISPClick
          OnExit = cbB_RANGO_IMP_DISPExit
        end
        object edNUM_DMIN_REQ_PER: TInterEdit
          Tag = 18
          Left = 155
          Top = 33
          Width = 80
          Height = 21
          HelpContext = 5070
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edNUM_DMIN_REQ_PERExit
          DisplayMask = '###,###,###0'
          MaxLength = 12
          TabOrder = 5
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edNUM_DIAS_AGR_PER: TInterEdit
          Tag = 18
          Left = 507
          Top = 33
          Width = 74
          Height = 21
          HelpContext = 5080
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edNUM_DIAS_AGR_PERExit
          DisplayMask = '###,###,###0'
          MaxLength = 12
          TabOrder = 6
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object IedIMP_MIN_DOCTO: TInterEdit
          Tag = 18
          Left = 540
          Top = 80
          Width = 100
          Height = 21
          HelpContext = 6040
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = IedIMP_MIN_DOCTOExit
          MaxLength = 18
          TabOrder = 11
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
      end
      object rgCVE_IMP_CALC_INT: TRadioGroup
        Tag = 18
        Left = 480
        Top = -2
        Width = 169
        Height = 48
        HelpContext = 5010
        Caption = 'Cálculo Importe Interés'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Capital'
          'Vigente'
          'Crédito')
        TabOrder = 9
        OnExit = rgCVE_IMP_CALC_INTExit
      end
      object rgCVE_CALC_IVA_INT: TRadioGroup
        Tag = 18
        Left = 480
        Top = 46
        Width = 168
        Height = 49
        HelpContext = 5030
        Caption = 'Cálc. Imp. IVA Interés'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Por UDIS'
          'Por Pct.'
          'N/A')
        TabOrder = 1
        OnExit = rgCVE_CALC_IVA_INTExit
      end
      object GroupBox4: TGroupBox
        Left = 3
        Top = 227
        Width = 478
        Height = 34
        TabOrder = 6
        object lbUNIDAD_REDONDEO: TLabel
          Left = 11
          Top = 13
          Width = 133
          Height = 13
          Caption = 'No. Sig. a Aprox. Redondeo'
        end
        object lbCVE_AFEC_REDONDEO: TLabel
          Left = 222
          Top = 13
          Width = 51
          Height = 13
          Caption = 'Afectación'
        end
        object edUNIDAD_REDONDEO: TInterEdit
          Tag = 18
          Left = 154
          Top = 9
          Width = 47
          Height = 21
          HelpContext = 6060
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edUNIDAD_REDONDEOExit
          DisplayMask = '###,###,###0'
          MaxLength = 12
          TabOrder = 0
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object cbxCVE_AFEC_REDONDEO: TComboBox
          Tag = 18
          Left = 292
          Top = 9
          Width = 175
          Height = 21
          HelpContext = 6070
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          OnExit = cbxCVE_AFEC_REDONDEOExit
          Items.Strings = (
            'A Favor Banco'
            'A Favor Cliente'
            'No Aplica')
        end
      end
      object chB_REDONDEO: TCheckBox
        Tag = 18
        Left = 516
        Top = 210
        Width = 127
        Height = 13
        HelpContext = 6050
        Alignment = taLeftJustify
        Caption = 'Aplica Redondeo'
        TabOrder = 5
        OnClick = chB_REDONDEOClick
        OnExit = chB_REDONDEOExit
      end
      object edCVE_GEN_TIP_PAG: TEdit
        Tag = 530
        Left = 157
        Top = 205
        Width = 76
        Height = 21
        HelpContext = 6040
        CharCase = ecUpperCase
        MaxLength = 20
        TabOrder = 3
        OnExit = edCVE_GEN_TIP_PAGExit
      end
      object btCVE_GEN_TIP_PAG: TBitBtn
        Tag = 18
        Left = 235
        Top = 207
        Width = 22
        Height = 20
        HelpContext = 6041
        TabOrder = 4
        OnClick = btCVE_GEN_TIP_PAGClick
        OnExit = btCVE_GEN_TIP_PAGExit
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
      object edDESC_GEN_TIP_PAG: TEdit
        Left = 258
        Top = 206
        Width = 252
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 8
      end
      object chB_AJU_IMP_U_P: TCheckBox
        Tag = 18
        Left = 490
        Top = 238
        Width = 153
        Height = 17
        HelpContext = 6080
        Alignment = taLeftJustify
        Caption = 'Ajusté en Último Periodo'
        TabOrder = 7
        OnExit = chB_AJU_IMP_U_PExit
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Configuración de Cobranza'
      ImageIndex = 3
      object GroupBox3: TGroupBox
        Left = 1
        Top = 8
        Width = 649
        Height = 253
        Caption = 'Cobranza'
        TabOrder = 0
        object lbCVE_TASA_REFER: TLabel
          Left = 156
          Top = 198
          Width = 97
          Height = 13
          Caption = 'Tasa de Referencia '
        end
        object lbOPERADOR_STASA: TLabel
          Left = 194
          Top = 224
          Width = 57
          Height = 13
          Caption = 'Ope. STasa'
        end
        object Label9: TLabel
          Left = 292
          Top = 224
          Width = 48
          Height = 13
          Caption = 'STasa (%)'
        end
        object cbB_COB_PARCIAL: TCheckBox
          Tag = 18
          Left = 12
          Top = 121
          Width = 627
          Height = 13
          HelpContext = 7030
          Alignment = taLeftJustify
          Caption = 
            'Permite aplicar pagos parciales a Conceptos, Intereses y Capital' +
            ' . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .' +
            ' . .  . . . . . . . . . . . . . . . . . .'
          TabOrder = 3
          OnExit = cbB_COB_PARCIALExit
        end
        object cbB_COB_TOT_PER: TCheckBox
          Tag = 18
          Left = 12
          Top = 87
          Width = 627
          Height = 17
          HelpContext = 7020
          Alignment = taLeftJustify
          Caption = 
            'Aplicar la cobranza solo si se cubre la totalidad del periodo (C' +
            'oncepto, Interés y Capital) . . . . . . . . . . . . . . . . . . ' +
            '. . . . . . . . . . . . . . . .'
          TabOrder = 2
          OnExit = cbB_COB_TOT_PERExit
        end
        object cbB_COB_ORD_ACC: TCheckBox
          Tag = 18
          Left = 12
          Top = 54
          Width = 627
          Height = 13
          HelpContext = 7010
          Alignment = taLeftJustify
          Caption = 
            'Aplicar rigurosamente la cobranza en el orden de Prelación (Conc' +
            'epto, Interés y Capital) . . . . . . . . . . . . . . . . . . . .' +
            ' . . . . . . . . . . . . . '
          TabOrder = 1
          OnExit = cbB_COB_ORD_ACCExit
        end
        object cbB_COB_ORD_PER: TCheckBox
          Tag = 18
          Left = 12
          Top = 20
          Width = 627
          Height = 17
          HelpContext = 7000
          Alignment = taLeftJustify
          Caption = 
            'Aplicar rigurosamente la cobranza en el orden de Programación de' +
            ' Pago de los periodos . . . . . . . . . . . . . . . . . . . . . ' +
            '. . . . . . . . . . . .'
          TabOrder = 0
          OnExit = cbB_COB_ORD_PERExit
        end
        object cbB_ENVIA_FE: TCheckBox
          Tag = 18
          Left = 12
          Top = 154
          Width = 627
          Height = 13
          HelpContext = 7040
          Alignment = taLeftJustify
          Caption = 
            'Envia Factura Electronica.......................................' +
            '.................. . . . . . . . . . . . . . . . . . . . . . . .' +
            ' . . . . . . . . . . .  . . . . . . . . . . . . . . . . . .'
          TabOrder = 4
          OnExit = cbB_ENVIA_FEExit
        end
        object rgCVE_CALCULO_M: TRadioGroup
          Tag = 18
          Left = 14
          Top = 190
          Width = 138
          Height = 50
          HelpContext = 7050
          Caption = 'Tipo de Calculo de Moras'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'PA'
            'T. FIJA')
          TabOrder = 5
          TabStop = True
          OnClick = rgCVE_CALCULO_MClick
          OnExit = rgCVE_CALCULO_MExit
        end
        object edCVE_TASA_REFER_M: TEdit
          Tag = 530
          Left = 253
          Top = 194
          Width = 72
          Height = 21
          HelpContext = 7060
          CharCase = ecUpperCase
          TabOrder = 6
          OnExit = edCVE_TASA_REFER_MExit
        end
        object cbOPERADOR_STASA_M: TEdit
          Tag = 530
          Left = 253
          Top = 216
          Width = 38
          Height = 21
          HelpContext = 7070
          CharCase = ecUpperCase
          MaxLength = 1
          TabOrder = 8
          OnExit = cbOPERADOR_STASA_MExit
          OnKeyPress = cbOPERADOR_STASA_MKeyPress
        end
        object edSOBRETASA_M: TInterEdit
          Tag = 18
          Left = 351
          Top = 216
          Width = 49
          Height = 21
          HelpContext = 7080
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edSOBRETASA_MExit
          DisplayMask = '###0.0000'
          MaxLength = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 9
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = True
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object btTASA_REFER_M: TBitBtn
          Tag = 18
          Left = 326
          Top = 193
          Width = 22
          Height = 20
          HelpContext = 7061
          TabOrder = 7
          OnClick = btTASA_REFER_MClick
          OnExit = btTASA_REFER_MExit
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
        object edDESC_TASA_REFER_M: TEdit
          Left = 351
          Top = 192
          Width = 208
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 10
        end
      end
    end
  end
  object edDESC_L_PRODUCTO: TEdit
    Tag = 18
    Left = 127
    Top = 52
    Width = 529
    Height = 21
    HelpContext = 1030
    CharCase = ecUpperCase
    MaxLength = 80
    TabOrder = 4
    OnExit = edDESC_L_PRODUCTOExit
  end
  object edCVE_PRODUCTO_CRE: TEdit
    Tag = 50
    Left = 127
    Top = 28
    Width = 105
    Height = 21
    HelpContext = 1010
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 2
    OnExit = edCVE_PRODUCTO_CREExit
  end
  object edDESC_C_PRODUCTO: TEdit
    Tag = 18
    Left = 343
    Top = 28
    Width = 314
    Height = 21
    HelpContext = 1020
    CharCase = ecUpperCase
    MaxLength = 30
    TabOrder = 3
    OnExit = edDESC_C_PRODUCTOExit
  end
  object btCONFIG_MONEDAS: TBitBtn
    Tag = 17
    Left = 418
    Top = 412
    Width = 239
    Height = 22
    Caption = 'Registro de Moneda / Tasa'
    TabOrder = 7
    OnClick = btCONFIG_MONEDASClick
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
  object rgSIT_PRODUCTO: TRadioGroup
    Tag = 18
    Left = 418
    Top = 381
    Width = 240
    Height = 30
    HelpContext = 8000
    Caption = 'Situación del Producto'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Inactivo')
    TabOrder = 6
    OnExit = rgSIT_PRODUCTOExit
  end
  object edCVE_USU_ALTA: TEdit
    Left = 308
    Top = 386
    Width = 100
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 9
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 308
    Top = 411
    Width = 100
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 11
  end
  object edF_ALTA: TEdit
    Left = 63
    Top = 386
    Width = 140
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
  end
  object edF_MODIFICA: TEdit
    Left = 63
    Top = 411
    Width = 140
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
  end
  object edID_EMPRESA: TEdit
    Tag = 562
    Left = 127
    Top = 3
    Width = 73
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 20
    TabOrder = 0
    OnExit = btEMPRESAExit
  end
  object btEMPRESA: TBitBtn
    Tag = 50
    Left = 207
    Top = 4
    Width = 22
    Height = 20
    HelpContext = 1002
    TabOrder = 1
    OnClick = btEMPRESAClick
    OnExit = btEMPRESAExit
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
  object edNOM_EMPRESA: TEdit
    Left = 236
    Top = 4
    Width = 421
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 14
  end
  object bbtnBitProd: TBitBtn
    Left = 418
    Top = 437
    Width = 239
    Height = 22
    Caption = 'Bitácora'
    TabOrder = 15
    OnClick = bbtnBitProdClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      033333777777777773333330777777703333333773F333773333333330888033
      33333FFFF7FFF7FFFFFF0000000000000003777777777777777F0FFFFFFFFFF9
      FF037F3333333337337F0F78888888887F037F33FFFFFFFFF37F0F7000000000
      8F037F3777777777F37F0F70AAAAAAA08F037F37F3333337F37F0F70ADDDDDA0
      8F037F37F3333337F37F0F70A99A99A08F037F37F3333337F37F0F70A99A99A0
      8F037F37F3333337F37F0F70AAAAAAA08F037F37FFFFFFF7F37F0F7000000000
      8F037F3777777777337F0F77777777777F037F3333333333337F0FFFFFFFFFFF
      FF037FFFFFFFFFFFFF7F00000000000000037777777777777773}
    NumGlyphs = 2
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
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
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 393
    Top = 21
  end
  object ilCLAS_LEGAL: TInterLinkit
    OnEjecuta = ilCLAS_LEGALEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCLAS_LEGALCapture
    Left = 520
    Top = 27
  end
  object ilCAT_MINIMO: TInterLinkit
    OnEjecuta = ilCAT_MINIMOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCAT_MINIMOCapture
    Left = 488
    Top = 27
  end
  object ilEMPRESA: TInterLinkit
    Control = edID_EMPRESA
    OnEjecuta = ilEMPRESAEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilEMPRESACapture
    Left = 158
    Top = 16
  end
  object ilPRODUCTO_GPO: TInterLinkit
    Control = edCVE_PRODUCTO_GPO
    OnEjecuta = ilPRODUCTO_GPOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilPRODUCTO_GPOCapture
    Left = 456
    Top = 27
  end
  object ilCVE_TIPO_CRED_BC: TInterLinkit
    OnEjecuta = ilCVE_TIPO_CRED_BCEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCVE_TIPO_CRED_BCCapture
    Left = 552
    Top = 25
  end
  object ilCVE_GEN_TIP_PAG: TInterLinkit
    Control = edCVE_GEN_TIP_PAG
    OnEjecuta = ilCVE_GEN_TIP_PAGEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCVE_GEN_TIP_PAGCapture
    Left = 584
    Top = 28
  end
  object ilTASA_REFER_M: TInterLinkit
    Control = edCVE_TASA_REFER_M
    OnEjecuta = ilTASA_REFER_MEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilTASA_REFER_MCapture
    Left = 328
    Top = 18
  end
end
