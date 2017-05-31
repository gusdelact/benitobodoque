object WCrAcreditado: TWCrAcreditado
  Left = 408
  Top = 38
  Width = 619
  Height = 662
  Caption = 'Acreditado'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbID_ACREDITADO: TLabel
    Left = 12
    Top = 4
    Width = 93
    Height = 13
    Caption = 'Acreditado / Sector'
  end
  object Label1: TLabel
    Left = 10
    Top = 465
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object Label2: TLabel
    Left = 10
    Top = 490
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object Label3: TLabel
    Left = 259
    Top = 490
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object Label4: TLabel
    Left = 259
    Top = 465
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object Label39: TLabel
    Left = 12
    Top = 26
    Width = 21
    Height = 13
    Caption = 'RFC'
  end
  object lbAve: TLabel
    Left = 239
    Top = 29
    Width = 19
    Height = 13
    Caption = 'Ave'
  end
  object Label45: TLabel
    Left = 556
    Top = 512
    Width = 37
    Height = 7
    Caption = 'V20151218'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -7
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object edID_ACREDITADO: TEdit
    Tag = 562
    Left = 117
    Top = 0
    Width = 73
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 8
    PopupMenu = pmPERSONA
    TabOrder = 1
    OnExit = edID_ACREDITADOExit
  end
  object rgSIT_ACREDITADO: TRadioGroup
    Tag = 18
    Left = 420
    Top = 478
    Width = 179
    Height = 32
    HelpContext = 3000
    Caption = 'Situación del Acreditado'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Inactivo')
    TabOrder = 5
    TabStop = True
    OnExit = rgSIT_ACREDITADOExit
  end
  object btACREDITADO: TBitBtn
    Tag = 50
    Left = 192
    Top = 0
    Width = 22
    Height = 20
    HelpContext = 1002
    PopupMenu = pmPERSONA
    TabOrder = 2
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
  object edDESC_ACREDITADO: TEdit
    Left = 256
    Top = 0
    Width = 343
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    PopupMenu = pmPERSONA
    ReadOnly = True
    ShowHint = True
    TabOrder = 4
  end
  object btDATOSADD: TBitBtn
    Tag = 17
    Left = 200
    Top = 519
    Width = 200
    Height = 20
    Caption = 'Registro de Accionistas'
    TabOrder = 9
    TabStop = False
    OnClick = btDATOSADDClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
      305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
      005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
      B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
      B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
      B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
      B0557777FF577777F7F500000E055550805577777F7555575755500000555555
      05555777775555557F5555000555555505555577755555557555}
    NumGlyphs = 2
  end
  object PnDatos: TPanel
    Left = 0
    Top = 581
    Width = 599
    Height = 19
    TabOrder = 14
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
    Left = 200
    Top = 560
    Width = 399
    Height = 20
    TabOrder = 13
  end
  object IEUsuarioModifica: TEdit
    Left = 340
    Top = 486
    Width = 77
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 12
  end
  object IEUsuarioAlta: TEdit
    Left = 340
    Top = 461
    Width = 77
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
  end
  object IEfechaAlta: TEdit
    Left = 116
    Top = 461
    Width = 134
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object IEfechaModifica: TEdit
    Left = 116
    Top = 486
    Width = 134
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
  end
  object btCONFIG_MONEDAS: TBitBtn
    Tag = 17
    Left = 0
    Top = 519
    Width = 200
    Height = 20
    Caption = 'Configurar Monedas'
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
  object btCTRL_DOCTOS: TBitBtn
    Tag = 17
    Left = 399
    Top = 519
    Width = 200
    Height = 20
    Caption = 'Control de Documentos'
    TabOrder = 11
    TabStop = False
    OnClick = btCTRL_DOCTOSClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
      FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
      00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
      F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
      00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
      F033777777777337F73309999990FFF0033377777777FFF77333099999000000
      3333777777777777333333399033333333333337773333333333333903333333
      3333333773333333333333303333333333333337333333333333}
    NumGlyphs = 2
  end
  object pgAltaDatos: TPageControl
    Left = 0
    Top = 48
    Width = 600
    Height = 409
    ActivePage = TabSheet1
    PopupMenu = pmCarga
    TabOrder = 0
    OnChange = pgAltaDatosChange
    OnChanging = pgAltaDatosChanging
    object TabSheet1: TTabSheet
      Caption = 'Configuración del Acreditado'
      object grbxCalificacion: TGroupBox
        Left = 0
        Top = 252
        Width = 592
        Height = 69
        HelpContext = 1800
        Caption = 'Control de área de Créditos'
        TabOrder = 2
        TabStop = True
        OnExit = grbxCalificacionExit
        object lbCVE_CALIFACION: TLabel
          Left = 10
          Top = 22
          Width = 61
          Height = 13
          Caption = 'Calif. Deudor'
        end
        object Label23: TLabel
          Left = 10
          Top = 48
          Width = 71
          Height = 13
          Caption = '% Ponderación'
        end
        object edCVE_CALIFACION: TEdit
          Tag = 530
          Left = 116
          Top = 18
          Width = 73
          Height = 21
          HelpContext = 1801
          CharCase = ecUpperCase
          MaxLength = 4
          TabOrder = 0
          OnExit = edCVE_CALIFACIONExit
        end
        object btCalifica: TBitBtn
          Tag = 18
          Left = 192
          Top = 18
          Width = 22
          Height = 20
          HelpContext = 1802
          TabOrder = 1
          OnClick = btCalificaClick
          OnExit = edCVE_CALIFACIONExit
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
        object edDESC_CALIFICA: TEdit
          Left = 216
          Top = 18
          Width = 369
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 2
        end
        object chB_AVALA_GOB_EDO: TCheckBox
          Tag = 18
          Left = 418
          Top = 43
          Width = 166
          Height = 21
          HelpContext = 1900
          Alignment = taLeftJustify
          Caption = 'Avalado por Gob. del Edo.'
          TabOrder = 4
          OnExit = chB_AVALA_GOB_EDOExit
        end
        object edPONDERACION: TEdit
          Left = 116
          Top = 44
          Width = 73
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 3
        end
      end
      object gbImporteAutor: TGroupBox
        Left = 0
        Top = 2
        Width = 592
        Height = 197
        Caption = 'Configuración de Acreditado'
        TabOrder = 0
        object lbIMP_MINIMO_AUTOR: TLabel
          Left = 10
          Top = 19
          Width = 95
          Height = 13
          Caption = 'Imp Mín. Autorizado'
        end
        object lbIMP_MAX_AUTOR: TLabel
          Left = 277
          Top = 19
          Width = 99
          Height = 13
          Caption = 'Imp. Máx. Autorizado'
        end
        object Label6: TLabel
          Left = 10
          Top = 46
          Width = 61
          Height = 13
          Caption = 'Día de Pago'
        end
        object Label7: TLabel
          Left = 10
          Top = 74
          Width = 108
          Height = 13
          Caption = 'Días Adicionales Pago'
        end
        object Label32: TLabel
          Left = 474
          Top = 62
          Width = 3
          Height = 13
        end
        object lbF_VENCIMIENTO: TLabel
          Left = 277
          Top = 125
          Width = 111
          Height = 13
          Caption = 'Fecha Vto. Incre-Decre'
        end
        object Bevel4: TBevel
          Left = 393
          Top = 66
          Width = 135
          Height = 2
          Style = bsRaised
        end
        object Label31: TLabel
          Left = 277
          Top = 74
          Width = 77
          Height = 13
          Caption = 'Total Autorizado'
        end
        object Label9: TLabel
          Left = 525
          Top = 19
          Width = 29
          Height = 13
          Caption = 'Pesos'
        end
        object Label30: TLabel
          Left = 525
          Top = 46
          Width = 29
          Height = 13
          Caption = 'Pesos'
        end
        object Label33: TLabel
          Left = 525
          Top = 74
          Width = 29
          Height = 13
          Caption = 'Pesos'
        end
        object Label34: TLabel
          Left = 231
          Top = 19
          Width = 29
          Height = 13
          Caption = 'Pesos'
        end
        object lbIMP_TOT_DISPONIB: TLabel
          Left = 277
          Top = 151
          Width = 76
          Height = 13
          Caption = 'Total Disponible'
        end
        object lbPesos: TLabel
          Left = 526
          Top = 152
          Width = 29
          Height = 13
          Caption = 'Pesos'
        end
        object Bevel5: TBevel
          Left = 520
          Top = 147
          Width = 67
          Height = 22
          Style = bsRaised
        end
        object Label35: TLabel
          Left = 277
          Top = 100
          Width = 74
          Height = 13
          Caption = 'Imp. Bloqueado'
        end
        object Label36: TLabel
          Left = 525
          Top = 100
          Width = 29
          Height = 13
          Caption = 'Pesos'
        end
        object edIMP_MINIMO_AUTOR: TInterEdit
          Tag = 18
          Left = 128
          Top = 15
          Width = 100
          Height = 21
          HelpContext = 1100
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edIMP_MINIMO_AUTORExit
          DisplayMask = '###,###,###,##0.00'
          MaxLength = 16
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
        object edIMP_MAX_AUTOR: TInterEdit
          Tag = 18
          Left = 401
          Top = 15
          Width = 120
          Height = 21
          HelpContext = 1101
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edIMP_MAX_AUTORExit
          DisplayMask = '###,###,###,##0.00'
          MaxLength = 16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 1
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = True
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object cbDIAS_PAGO: TComboBox
          Tag = 18
          Left = 128
          Top = 42
          Width = 100
          Height = 21
          HelpContext = 1200
          ImeMode = imDisable
          ItemHeight = 13
          TabOrder = 2
          Text = 'NO APLICA'
          OnExit = cbDIAS_PAGOExit
        end
        object cbB_ACT_EMP: TCheckBox
          Tag = 18
          Left = 10
          Top = 95
          Width = 218
          Height = 21
          HelpContext = 1400
          Alignment = taLeftJustify
          Caption = 'P. Física Actividad Empresarial'
          TabOrder = 3
          OnExit = cbB_ACT_EMPExit
        end
        object edIMP_EXCESO_EVE: TInterEdit
          Tag = 18
          Left = 401
          Top = 40
          Width = 120
          Height = 21
          HelpContext = 1501
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edIMP_EXCESO_EVEExit
          DisplayMask = '###,###,###,##0.00'
          MaxLength = 16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 5
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = True
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object btExceso: TBitBtn
          Tag = 17
          Left = 512
          Top = 122
          Width = 76
          Height = 20
          Caption = 'Inc-Dec'
          TabOrder = 10
          TabStop = False
          OnClick = btExcesoClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
            333333333F777773FF333333008888800333333377333F3773F3333077870787
            7033333733337F33373F3308888707888803337F33337F33337F330777880887
            7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
            7703337F33377733337FB3088888888888033373FFFFFFFFFF733B3000000000
            0033333777777777773333BBBB3333080333333333F3337F7F33BBBB707BB308
            03333333373F337F7F3333BB08033308033333337F7F337F7F333B3B08033308
            033333337F73FF737F33B33B778000877333333373F777337333333B30888880
            33333333373FFFF73333333B3300000333333333337777733333}
          NumGlyphs = 2
        end
        object edIMP_TOT_AUT: TInterEdit
          Left = 402
          Top = 70
          Width = 120
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,##0.00'
          MaxLength = 18
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 6
          ReadOnly = True
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edF_VTO_EXCESO: TEdit
          Tag = 18
          Left = 402
          Top = 122
          Width = 87
          Height = 21
          HelpContext = 1600
          CharCase = ecUpperCase
          TabOrder = 8
          OnExit = edF_VTO_EXCESOExit
        end
        object dtpF_VTO_EXCESO: TInterDateTimePicker
          Tag = 18
          Left = 491
          Top = 122
          Width = 21
          Height = 22
          CalAlignment = dtaLeft
          Date = 37781.35659625
          Time = 37781.35659625
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 9
          TabStop = False
          OnExit = edF_VTO_EXCESOExit
          Edit = edF_VTO_EXCESO
          Formato = dfDate
        end
        object edIMP_TOT_DISPONIB: TInterEdit
          Left = 402
          Top = 147
          Width = 120
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,##0.00'
          MaxLength = 16
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 11
          ReadOnly = True
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edIMP_TOT_BLOQUEADO: TInterEdit
          Left = 402
          Top = 96
          Width = 120
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,##0.00'
          MaxLength = 16
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 7
          ReadOnly = True
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object cbCVE_AFEC_INC_DEC: TComboBox
          Tag = 18
          Left = 275
          Top = 40
          Width = 124
          Height = 21
          HelpContext = 1500
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
          OnChange = cbCVE_AFEC_INC_DECChange
          OnExit = cbCVE_AFEC_INC_DECExit
        end
        object edDIAS_ADICIONALES: TInterEdit
          Tag = 18
          Left = 128
          Top = 70
          Width = 100
          Height = 21
          HelpContext = 1300
          Prefijo = '1'
          Contrato = -1
          TipoReader = trEntero
          OnExit = edDIAS_ADICIONALESExit
          DisplayMask = '###,##0'
          MaxLength = 6
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 12
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
      end
      object rgCVE_TIP_DISPOS: TRadioGroup
        Tag = 18
        Left = 0
        Top = 208
        Width = 591
        Height = 33
        HelpContext = 1700
        Caption = 'Tipo de Disposición de Autorización'
        Columns = 2
        Items.Strings = (
          'Monto Asignado'
          'Indistinta')
        TabOrder = 1
        TabStop = True
        OnClick = rgCVE_TIP_DISPOSClick
        OnExit = rgCVE_TIP_DISPOSExit
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Clasificación del Acreditado'
      ImageIndex = 1
      object gbArt73: TGroupBox
        Left = 1
        Top = -1
        Width = 591
        Height = 382
        TabOrder = 0
        object bvlRiesgo: TBevel
          Left = 216
          Top = 313
          Width = 362
          Height = 39
        end
        object lbTIPO_ACRED_REL: TLabel
          Left = 6
          Top = 32
          Width = 75
          Height = 13
          Caption = 'Tipo Acreditado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbCVE_GRUPO_ECO: TLabel
          Left = 6
          Top = 55
          Width = 85
          Height = 13
          Caption = 'Grupo Económico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbCVE_SECTOR_ECO: TLabel
          Left = 6
          Top = 78
          Width = 87
          Height = 13
          Caption = 'Sector Económico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbCVE_TAM_ACRED: TLabel
          Left = 6
          Top = 101
          Width = 93
          Height = 13
          Caption = 'Tamaño Acreditado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 438
          Top = 49
          Width = 46
          Height = 13
          Caption = 'Imp. Máx.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 436
          Top = 60
          Width = 49
          Height = 13
          Caption = 'Operación'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 6
          Top = 124
          Width = 34
          Height = 13
          Caption = 'Región'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 6
          Top = 147
          Width = 42
          Height = 13
          Caption = 'Senicreb'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 6
          Top = 170
          Width = 81
          Height = 13
          Caption = 'Tipo de Relación'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object lbCVE_PER_JUR_REG: TLabel
          Left = 6
          Top = 193
          Width = 95
          Height = 13
          Caption = 'Pers. Juridica CNBV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbNUM_EMPLEADOS: TLabel
          Left = 6
          Top = 315
          Width = 72
          Height = 13
          Caption = 'No. Empleados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 6
          Top = 216
          Width = 69
          Height = 13
          Caption = 'Nombre CNBV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LRFC_CNBV: TLabel
          Left = 6
          Top = 337
          Width = 53
          Height = 13
          Caption = 'RFC CNBV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblCVE_RIESGO_PAIS: TLabel
          Left = 233
          Top = 328
          Width = 22
          Height = 13
          Caption = 'País'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbCVE_RIESGO_FINAN: TLabel
          Left = 343
          Top = 328
          Width = 49
          Height = 13
          Caption = 'Financiero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbCVE_RIESGO_INDUS: TLabel
          Left = 471
          Top = 304
          Width = 40
          Height = 13
          Caption = 'Industria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label37: TLabel
          Left = 220
          Top = 305
          Width = 108
          Height = 13
          Caption = 'Calificación de Riesgo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label38: TLabel
          Left = 7
          Top = 239
          Width = 60
          Height = 13
          Caption = 'Metodología'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 8
          Top = 286
          Width = 52
          Height = 13
          Caption = 'Clave Buró'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 7
          Top = 364
          Width = 43
          Height = 13
          Caption = 'ID CNBV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label44: TLabel
          Left = 7
          Top = 262
          Width = 73
          Height = 13
          Caption = 'Tipo de Cartera'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btTIPOACREDITADO: TBitBtn
          Tag = 18
          Left = 187
          Top = 28
          Width = 22
          Height = 20
          HelpContext = 2101
          TabOrder = 3
          OnClick = btTIPOACREDITADOClick
          OnExit = edTIPO_ACRED_RELExit
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
        object edTIPO_ACREDITADO: TEdit
          Tag = 512
          Left = 212
          Top = 28
          Width = 375
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 4
        end
        object chB_ACREDITADO_REL: TCheckBox
          Tag = 18
          Left = 6
          Top = 9
          Width = 257
          Height = 17
          HelpContext = 2000
          Caption = 'Artículo 73 de la Ley de instituciones de Crédito'
          TabOrder = 0
          OnClick = chB_ACREDITADO_RELClick
          OnEnter = chB_ACREDITADO_RELEnter
          OnExit = chB_ACREDITADO_RELExit
        end
        object edTIPO_ACRED_REL: TEdit
          Tag = 530
          Left = 112
          Top = 28
          Width = 73
          Height = 21
          HelpContext = 2100
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          TabOrder = 2
          OnExit = edTIPO_ACRED_RELExit
        end
        object edCVE_GRUPO_ECO: TEdit
          Tag = 530
          Left = 112
          Top = 51
          Width = 73
          Height = 21
          HelpContext = 2200
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 6
          ParentFont = False
          TabOrder = 5
          OnExit = edCVE_GRUPO_ECOExit
        end
        object btGRUPOECO: TBitBtn
          Tag = 18
          Left = 187
          Top = 51
          Width = 22
          Height = 20
          HelpContext = 2201
          TabOrder = 6
          OnClick = btGRUPOECOClick
          OnExit = edCVE_GRUPO_ECOExit
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
        object edGRUPOECO: TEdit
          Tag = 512
          Left = 212
          Top = 51
          Width = 220
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 7
        end
        object edCVE_SECTOR_ECO: TEdit
          Tag = 530
          Left = 112
          Top = 74
          Width = 73
          Height = 21
          HelpContext = 2300
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          TabOrder = 9
          OnExit = edCVE_SECTOR_ECOExit
        end
        object btSECTORECO: TBitBtn
          Tag = 18
          Left = 187
          Top = 74
          Width = 22
          Height = 20
          HelpContext = 2301
          TabOrder = 10
          OnClick = btSECTORECOClick
          OnExit = edCVE_SECTOR_ECOExit
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
        object edDESCRIPSEC: TEdit
          Tag = 512
          Left = 212
          Top = 74
          Width = 375
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 11
        end
        object edCVE_TAM_ACRED: TEdit
          Tag = 530
          Left = 112
          Top = 97
          Width = 73
          Height = 21
          HelpContext = 2400
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          TabOrder = 12
          OnExit = edCVE_TAM_ACREDExit
        end
        object btTAMACRED: TBitBtn
          Tag = 18
          Left = 187
          Top = 97
          Width = 22
          Height = 20
          HelpContext = 2401
          TabOrder = 13
          OnClick = btTAMACREDClick
          OnExit = edCVE_TAM_ACREDExit
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
        object edDESCTAMACRED: TEdit
          Left = 212
          Top = 97
          Width = 375
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 14
        end
        object edIMP_MAX_OPERA: TInterEdit
          Left = 490
          Top = 51
          Width = 97
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,##0.00'
          MaxLength = 18
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 8
          ReadOnly = True
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edCVE_LOCAL_CNBV: TEdit
          Tag = 530
          Left = 112
          Top = 120
          Width = 73
          Height = 21
          HelpContext = 2500
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 12
          ParentFont = False
          TabOrder = 15
          OnExit = edCVE_LOCAL_CNBVExit
        end
        object btnCVE_LOCAL_CNBV: TBitBtn
          Tag = 18
          Left = 188
          Top = 120
          Width = 20
          Height = 20
          HelpContext = 2501
          TabOrder = 16
          OnClick = btnCVE_LOCAL_CNBVClick
          OnExit = btnCVE_LOCAL_CNBVExit
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
        object edDESC_LOCAL_CNBV: TEdit
          Left = 212
          Top = 120
          Width = 375
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 17
        end
        object edCVE_SENICREB: TEdit
          Tag = 530
          Left = 112
          Top = 143
          Width = 73
          Height = 21
          HelpContext = 2600
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 8
          ParentFont = False
          TabOrder = 18
          OnExit = edCVE_SENICREBExit
        end
        object btSENICREB: TBitBtn
          Tag = 18
          Left = 188
          Top = 143
          Width = 20
          Height = 20
          HelpContext = 2601
          TabOrder = 19
          OnClick = btSENICREBClick
          OnExit = edCVE_SENICREBExit
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
        object edSENICREB: TEdit
          Left = 212
          Top = 143
          Width = 375
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 20
        end
        object edDESC_C_TIPO_REL: TEdit
          Left = 212
          Top = 166
          Width = 375
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 23
          Visible = False
        end
        object btCVE_TIPO_RELAC: TBitBtn
          Tag = 18
          Left = 187
          Top = 168
          Width = 21
          Height = 19
          HelpContext = 2701
          TabOrder = 22
          Visible = False
          OnClick = btCVE_TIPO_RELACClick
          OnExit = edCVE_TIPO_RELACExit
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
        object edCVE_TIPO_RELAC: TEdit
          Tag = 530
          Left = 112
          Top = 166
          Width = 73
          Height = 21
          HelpContext = 2700
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 21
          Visible = False
          OnExit = edCVE_TIPO_RELACExit
        end
        object edCVE_PER_JUR_REG: TEdit
          Tag = 530
          Left = 112
          Top = 189
          Width = 73
          Height = 21
          HelpContext = 2800
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 24
          OnExit = edCVE_PER_JUR_REGExit
        end
        object btCVE_PER_JUR_REG: TBitBtn
          Tag = 18
          Left = 187
          Top = 189
          Width = 21
          Height = 21
          HelpContext = 2801
          TabOrder = 25
          OnClick = btCVE_PER_JUR_REGClick
          OnExit = edCVE_PER_JUR_REGExit
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
        object edDESC_CVE_PER_JUR_REG: TEdit
          Left = 212
          Top = 189
          Width = 375
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 26
        end
        object edNOM_ACRED_REG: TEdit
          Tag = 18
          Left = 112
          Top = 212
          Width = 284
          Height = 21
          HelpContext = 2900
          TabStop = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 27
          OnExit = edNOM_ACRED_REGExit
        end
        object btNOM_ACRED_REG: TBitBtn
          Tag = 18
          Left = 401
          Top = 212
          Width = 186
          Height = 21
          HelpContext = 2901
          Caption = 'Formato Nombre Propuesto'
          TabOrder = 28
          OnClick = btNOM_ACRED_REGClick
          OnExit = btNOM_ACRED_REGExit
        end
        object edNUM_EMPLEADOS: TInterEdit
          Tag = 530
          Left = 112
          Top = 309
          Width = 98
          Height = 21
          HelpContext = 3100
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edNUM_EMPLEADOSExit
          DisplayMask = '#######0'
          MaxLength = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 38
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edRFC_CNBV: TEdit
          Tag = 530
          Left = 112
          Top = 332
          Width = 98
          Height = 21
          HelpContext = 3200
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 13
          ParentFont = False
          TabOrder = 39
          OnExit = edRFC_CNBVExit
        end
        object edCVE_RIESGO_PAIS: TEdit
          Tag = 530
          Left = 267
          Top = 324
          Width = 51
          Height = 21
          HelpContext = 3300
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          TabOrder = 40
          OnExit = edCVE_RIESGO_PAISExit
        end
        object edCVE_RIESGO_FINAN: TEdit
          Tag = 530
          Left = 397
          Top = 324
          Width = 51
          Height = 21
          HelpContext = 3400
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          TabOrder = 41
          OnExit = edCVE_RIESGO_FINANExit
        end
        object edCVE_RIESGO_INDUS: TEdit
          Tag = 530
          Left = 515
          Top = 324
          Width = 51
          Height = 21
          HelpContext = 3500
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          TabOrder = 42
          OnExit = edCVE_RIESGO_INDUSExit
        end
        object edCVE_METODOLOGIA: TEdit
          Tag = 530
          Left = 112
          Top = 235
          Width = 73
          Height = 21
          HelpContext = 3000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 29
          OnExit = edCVE_METODOLOGIAExit
        end
        object btCVE_METODOLOGIA: TBitBtn
          Tag = 18
          Left = 187
          Top = 235
          Width = 21
          Height = 21
          HelpContext = 3001
          TabOrder = 30
          OnClick = btCVE_METODOLOGIAClick
          OnExit = edCVE_METODOLOGIAExit
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
        object edDESC_METODOLOGIA: TEdit
          Left = 208
          Top = 235
          Width = 380
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 31
        end
        object chkB_ENTIDAD_FIN: TCheckBox
          Tag = 18
          Left = 275
          Top = 9
          Width = 126
          Height = 17
          HelpContext = 3600
          Caption = 'Es Entidad Financiera'
          TabOrder = 1
          OnExit = chkB_ENTIDAD_FINExit
        end
        object edClave_Buro: TEdit
          Tag = 530
          Left = 112
          Top = 283
          Width = 73
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 35
        end
        object btCve_Buro: TBitBtn
          Tag = 18
          Left = 187
          Top = 283
          Width = 21
          Height = 21
          HelpContext = 3001
          TabOrder = 36
          OnClick = btCve_BuroClick
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
        object edDesc_Buro: TEdit
          Left = 208
          Top = 283
          Width = 379
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 37
        end
        object edCVE_ACREDIT_CNBV: TEdit
          Tag = 530
          Left = 112
          Top = 358
          Width = 73
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 43
        end
        object BitBtn2: TBitBtn
          Tag = 18
          Left = 187
          Top = 357
          Width = 21
          Height = 21
          HelpContext = 3001
          TabOrder = 44
          OnClick = BitBtn2Click
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
        object edDESC_ACREDIT_CNBV: TEdit
          Left = 209
          Top = 358
          Width = 378
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 45
        end
        object edCVE_CARTERA_R04: TEdit
          Tag = 530
          Left = 112
          Top = 258
          Width = 73
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 32
        end
        object btCVE_CARTERA_R04: TBitBtn
          Tag = 18
          Left = 187
          Top = 258
          Width = 21
          Height = 21
          HelpContext = 3001
          TabOrder = 33
          OnClick = btCVE_CARTERA_R04Click
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
        object edDESC_CARTERA_R04: TEdit
          Left = 208
          Top = 258
          Width = 379
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 34
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Control de Saldos de Disposiciones'
      ImageIndex = 2
      object gbPlazo: TGroupBox
        Left = 0
        Top = 0
        Width = 591
        Height = 336
        TabOrder = 0
        object Bevel1: TBevel
          Left = 104
          Top = 136
          Width = 131
          Height = 2
          Style = bsRaised
        end
        object Bevel3: TBevel
          Left = 427
          Top = 136
          Width = 131
          Height = 2
          Style = bsRaised
        end
        object Bevel2: TBevel
          Left = 259
          Top = 136
          Width = 131
          Height = 2
          Style = bsRaised
        end
        object Label21: TLabel
          Left = 14
          Top = 117
          Width = 85
          Height = 13
          Caption = 'Importe Impagado'
        end
        object Label20: TLabel
          Left = 14
          Top = 71
          Width = 74
          Height = 13
          Caption = 'Importe Vigente'
        end
        object Label22: TLabel
          Left = 14
          Top = 94
          Width = 77
          Height = 13
          Caption = 'Importe Vencido'
        end
        object Label16: TLabel
          Left = 151
          Top = 40
          Width = 40
          Height = 13
          Caption = 'Capital'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 14
          Top = 142
          Width = 76
          Height = 13
          Caption = 'Importe Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 278
          Top = 40
          Width = 99
          Height = 13
          Caption = 'Refinanciamiento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 459
          Top = 40
          Width = 73
          Height = 13
          Caption = 'Capital Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 248
          Top = 71
          Width = 6
          Height = 13
          Caption = '+'
        end
        object Label12: TLabel
          Left = 405
          Top = 71
          Width = 6
          Height = 13
          Caption = '='
        end
        object Label13: TLabel
          Left = 405
          Top = 94
          Width = 6
          Height = 13
          Caption = '='
        end
        object Label14: TLabel
          Left = 248
          Top = 94
          Width = 6
          Height = 13
          Caption = '+'
        end
        object Label15: TLabel
          Left = 405
          Top = 117
          Width = 6
          Height = 13
          Caption = '='
        end
        object Label17: TLabel
          Left = 248
          Top = 117
          Width = 6
          Height = 13
          Caption = '+'
        end
        object Label18: TLabel
          Left = 405
          Top = 142
          Width = 6
          Height = 13
          Caption = '='
        end
        object Label26: TLabel
          Left = 248
          Top = 142
          Width = 6
          Height = 13
          Caption = '+'
        end
        object edIMP_CAP_ACTUAL: TInterEdit
          Left = 111
          Top = 138
          Width = 120
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,##0.00'
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
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edIMP_CAP_IMP: TInterEdit
          Left = 111
          Top = 113
          Width = 120
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,##0.00'
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
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edIMP_CAP_VIG: TInterEdit
          Left = 111
          Top = 67
          Width = 120
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,##0.00'
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
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edIMP_CAP_VEN: TInterEdit
          Left = 111
          Top = 90
          Width = 120
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,##0.00'
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
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edIMP_TOT_ACTUAL: TInterEdit
          Left = 435
          Top = 138
          Width = 120
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,##0.00'
          MaxLength = 18
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 4
          ReadOnly = True
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edIMP_REF_ACTUAL: TInterEdit
          Left = 267
          Top = 138
          Width = 120
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,##0.00'
          MaxLength = 18
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 5
          ReadOnly = True
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edIMP_REF_VIG: TInterEdit
          Left = 267
          Top = 67
          Width = 120
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,##0.00'
          MaxLength = 18
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 6
          ReadOnly = True
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edIMP_REF_VEN: TInterEdit
          Left = 267
          Top = 90
          Width = 120
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,##0.00'
          MaxLength = 18
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 7
          ReadOnly = True
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edIMP_REF_IMP: TInterEdit
          Left = 267
          Top = 113
          Width = 120
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,##0.00'
          MaxLength = 18
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 8
          ReadOnly = True
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edIMP_TOT_VIG: TInterEdit
          Left = 435
          Top = 67
          Width = 120
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,##0.00'
          MaxLength = 18
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 9
          ReadOnly = True
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edIMP_TOT_VEN: TInterEdit
          Left = 435
          Top = 90
          Width = 120
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,##0.00'
          MaxLength = 18
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 10
          ReadOnly = True
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edIMP_TOT_IMP: TInterEdit
          Left = 435
          Top = 113
          Width = 120
          Height = 21
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          DisplayMask = '###,###,###,##0.00'
          MaxLength = 18
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 11
          ReadOnly = True
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
      end
    end
    object tsEstadosyMunc: TTabSheet
      Caption = 'Estados y Municipios'
      ImageIndex = 3
      object gbInfoAcreditado: TGroupBox
        Left = 3
        Top = 1
        Width = 584
        Height = 337
        Caption = 'Información del Acreditado'
        TabOrder = 0
        object lbAviso: TLabel
          Left = 168
          Top = 13
          Width = 234
          Height = 13
          Caption = 'No hay ningun  acreditado seleccionado '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 260
          Top = 230
          Width = 10
          Height = 13
          Caption = 'PI'
        end
        object btCargaMasiva: TBitBtn
          Left = 449
          Top = 237
          Width = 105
          Height = 25
          Caption = 'Carga Masiva'
          TabOrder = 0
          OnClick = btCargaMasivaClick
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            20000000000000040000C40E0000C40E00000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F8B21F72EF9A1165CA5F0066E2B1
            6284000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F8B71FB9E3900CB9CA5A00B9E4AD
            5FB9000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000FEBB25B9E08C0CB9C65900B9E6B0
            60B9000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000FEBD24D9E0890BD9C55900D9E6B1
            5ED9000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000FFC225FFE08C0CFFC55400FFE7B6
            62FF000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000FFCE27FFE1890AFFC55A00FFECC5
            6DFF000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000FFD822FFE58F0CFFC86000FFF2D7
            81FF00000000000000000000000000000000000000000000000000000000BB5D
            1F39A02802FF9A1C00FF971300F3952829FFFFCB22FFE4910EFFCB6D00FFB650
            32FFB11E00FFB84F01F7BC5C05FFB92E00FFF8911D4F0000000000000000B149
            2781FFFF58FFFFFF16FFFFD817FFFFDA4FFFFEB416FFDF8D13FFC86904FFE287
            25FFEC9511FFF5AB17FFF9C21BFFF9792AFFFF9F1F0800000000000000000000
            0000B2440761FFFF4CFFFFFF1EFFFFC214FFF5A415FFDF8B14FFC6680CFFDC88
            0DFFE49511FFEA9E13FFEEA425FF000000000000000000000000000000000000
            000000000000A1240C3FFFFF45FFFFD815FFF5A416FFDE8913FFC5650CFFD983
            0DFFE48D10FFE79B2AFF00000000000000000000000000000000000000000000
            00000000000000000000AB3D1246FFF943FFFFBD0EFFE18C13FFC46308FFDF83
            0FFFE49931FF0000000000000000000000000000000000000000000000000000
            0000000000000000000000000000B9501449FFDD3CFFEF9D0AFFCA6508FFDF92
            2DFF000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000C167164FF7B733FFD57A1BFF0000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000CD73139BD8720C140000
            0000000000000000000000000000000000000000000000000000}
        end
        object btSalvaCambiosAnexo18: TBitBtn
          Left = 450
          Top = 267
          Width = 105
          Height = 25
          Caption = 'Salvar Cambios'
          Enabled = False
          TabOrder = 1
          OnClick = btSalvaCambiosAnexo18Click
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            20000000000000040000C40E0000C40E00000000000000000000000000000000
            00000000000000000000000000000000000000000000FFFFFF14FEFEFE27FEFE
            FE34FEFEFE37FEFEFE2EFEFEFE1FFEFEFE0D0000000000000000000000000000
            0000000000000000000B000000F0000000EC494A4AE46E706EEF656465EF6F6F
            6FF16B6B6BF1777979F0383535F2000000F5000000FF0A08085F000000000000
            0000000000006C6C683D000000FF000000FF858485FF3D3937FF150C09FF9899
            99FF949595FFA8A8A8FF514B4AFF000000FF150C09FF00000077000000000000
            000000000000D1D1D14F040000FF100603FF9E9E9FFF48413FFF1B120EFFB1B3
            B3FFACADAEFFBBBEBEFF64605EFF110804FF2C2320FF120D0B6F000000710000
            00FF0E0B09E6605F5EF41C110EFF180F0BFFB9B9B9FF65605DFF342C28FFD2D4
            D5FFD0D1D2FFE0E4E6FF7A7775FF170D09FF2F2724FF14100D6E100B0AC81208
            05FF292220FF8B8989FF221813FF18100BFF5E5755FF5F5958FF504D4BFF716C
            6CFF6E6A68FF787573FF433D3AFF150D08FF362E29FF1712106E171211C02219
            16FF3B3432FF969595FF251B17FF534945FF4C403DFF4B403CFF524542FF4A3F
            3AFF483B37FF443934FF524743FF574C48FF3D322EFF1914106E1A1514BD2B21
            1EFF47403EFFA6A6A8FF322521FFF8ECE2FFFFFBF4FFF9EFE6FFF8EDE5FFF7ED
            E4FFF7EDE4FFF9EEE6FFFFFEF6FFEBE0D8FF403533FF17120D6E1C1816BD2F26
            22FF2A221FFF514B49FF382D29FFF0E7DFFFF6EDE7FFEAE2DCFFE9E1DAFFE9E1
            DAFFE9E1DAFFEAE2DCFFFAF2ECFFE4DCD4FF453A36FF1410106E191511BD4B3F
            3AFF70635FFF483E3AFF3A2F2AFFF2ECE5FFF9F3EEFFECE6E1FFECE6E0FFECE6
            E0FFECE5E0FFEDE6E1FFFDF8F2FFE8E1DAFF4A3E3AFF1B12126E0E0908BD8C7F
            78FFFFFFFFFFC1B8B1FF302521FFF8F2EEFFFFFDFCFFF3EFEEFFF3EEEDFFF3EF
            EDFFF3EFEDFFF4F0EEFFFFFFFFFFEEEAE5FF504540FF1B16146F100A09BD8C7F
            7AFFFFFFFFFFB6ACA7FF2F221DFFFEFBF8FFFFFFFFFFFEFDFDFFFDFDFCFFFEFE
            FEFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCF8FF574945FF150F0A74120C0ABD9084
            7EFFFFFFFFFFB9B4AFFF2E231EFFF4F2F0FFFFFFFFFFFAF9F9FFFAFAF9FFFFFE
            FEFFFFFFFFFFFFFFFFFFFFFFFFFFEEECEBFF4E413AFF1B14127A150D0DBF9589
            85FFFFFFFFFFFAF6F3FFE7E2E0FFF0E9E7FFEAE5E2FFE7E2E0FFE9E4E2FFFFFB
            F9FF9F9691FF281D17FF5500000300000000AAAAAA030000000018120FC59C93
            8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFDFFFFFFFFFFFFFF
            FFFFAFA5A2FF261814FF00000000000000000000000000000000231B1AC3968D
            88FFFFFFFFFFF8F8F7FFF3F2F2FFF3F2F2FFF3F2F1FFF3F2F1FFF6F5F4FFFFFF
            FFFFB0AAA5FF4F433FFF1F000008000000000000000000000000}
        end
        object btCancelarAnexo18: TBitBtn
          Left = 451
          Top = 300
          Width = 105
          Height = 25
          Caption = 'Cancelar'
          Enabled = False
          TabOrder = 2
          OnClick = btCancelarAnexo18Click
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            20000000000000040000C40E0000C40E00000000000000000000000000000000
            00000000000000000000070757E41C1C66D91C1C6CD91C1C6FD91D1D70D91C1C
            6ED91C1C68D9060656E200000000000000000000000000000000000000000000
            000000000000060655E52929B1FD2828FAFF2929FFFF2B2BFFFF2B2BFFFF2A2A
            FEFF2929FAFF2929A9F9050555E3000000000000000000000000000000000000
            0000040454E52222A9FD1D1DF0FF1818EFFF2222F5FF2323F8FF2424F9FF2121
            F8FF1616F4FF1D1DF5FF2222A3F8040454E30000000000000000000000000404
            53E51D1D95FD0F0FCEFF3636D6FF7171E4FF1717DEFF1717E1FF1616E2FF1A1A
            E2FF7474E6FF2F2FDBFF0F0FD5FF1C1C93F8030353E300000000030352E51515
            7CFC0C0CA8FF3232B9FFB4B4CEFFD0CFBFFF8282D7FF0707C7FF0B0BC9FF8B8B
            D8FFD0D0BDFFAEADD1FF2A2ABFFF0D0DADFF171679F8030352E30A0A51E20606
            92FF00008EFF4343A0FFC9C9C3FFC7C6C3FFD3D3CBFF7F7FCDFF8787CFFFD3D3
            C9FFC7C7C4FFC5C5C1FF3A3A9FFF000091FF080895FF090950DB05054EDF0101
            6AFF000071FF000075FF444490FFD1D0D0FFD6D6D4FFDEDDD8FFDDDDD7FFD7D6
            D4FFCCCCCDFF3B3A91FF00007CFF000076FF010171FF05054ED904044CDF0606
            44FF050551FF060668FF000079FF4A4AA2FFE0E0E0FFE3E3E2FFE4E4E2FFDCDC
            DEFF4242A2FF00008CFF060685FF05056DFF06065EFF04044ED906064EDF1D1D
            5AFF1B1B6EFF171787FF14149EFF9393D5FFF4F4F2FFF6F6F4FFF6F6F4FFF3F3
            F1FF8B8BD8FF1414B2FF1919A5FF1B1B92FF1C1C84FF050551D9080853DF2626
            8BFF222295FF2626A9FFA4A4DEFFFFFFFFFFFFFFFFFFFCFCFDFFFDFDFDFFFFFF
            FFFFFFFFFFFF9B9BE3FF2727BEFF2626B0FF2626ACFF070754D90D0D59E23535
            BDFF2727BFFF7070CFFFFFFFFFFFFFFFFFFFEFEFF1FF5959C8FF6363CAFFF4F4
            F4FFFFFFFFFFFFFFFFFF6C6CD0FF3333C8FF3E3EC9FF0B0B56DC0A0A51C18C8C
            D6FF4545E6FF3D3DD5FFA2A2D3FFE8E8EAFF6868D0FF4141F5FF4141F2FF7171
            CFFFEAEAEAFF9C9CD2FF4848D6FF5555E5FF8E8ED3FE090950BB000000000E0E
            57C49B9BE9FF5C5CFFFF5050E6FF5B5BCDFF5A5AFAFF6667FFFF6868FFFF5D5D
            F9FF5F5FCCFF5858E8FF6A6AFFFF9C9CE4FE0C0C55BF00000000000000000000
            000013135CC4AAAAF4FF7676FFFF7473FFFF7E7AFFFF817CFFFF807EFFFF7F7F
            FFFF7A7AFFFF8080FFFFA9A9F0FE11115ABF0000000000000000000000000000
            000000000000171761C4B9B9F7FFC5C0FFFFC8C0FFFFCBC2FFFFCAC2FFFFC5C2
            FFFFC4C4FFFFB8B8F4FE15155EBF000000000000000000000000000000000000
            000000000000000000001B1B64C12D2D79DF2E2D7BDF302E7BDF302E7BDF2D2D
            7ADF2D2D79DF191962BD00000000000000000000000000000000}
        end
        object GroupBox1: TGroupBox
          Left = 11
          Top = 214
          Width = 224
          Height = 111
          Caption = 'Severidad de la Perdida por Contrato'
          TabOrder = 3
          object sagSevPerdida: TStringAlignGrid
            Left = 3
            Top = 15
            Width = 218
            Height = 95
            ColCount = 3
            DefaultRowHeight = 18
            TabOrder = 0
            Alignment = alRight
            Editable = False
            AutoAdjustLastCol = True
            ColWidths = (
              1
              96
              97)
            Cells = (
              1
              0
              'Contrato'
              2
              0
              'SP')
            PropCell = ()
            PropCol = (
              1
              1
              2
              0
              2
              1
              2
              0)
            PropRow = ()
            PropFixedCol = ()
            PropFixedRow = (
              0
              1
              2
              0)
          end
        end
        object edProbInc: TEdit
          Left = 280
          Top = 224
          Width = 39
          Height = 21
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          ReadOnly = True
          TabOrder = 4
        end
        object sagAnexo18: TStringAlignGrid
          Left = 10
          Top = 15
          Width = 545
          Height = 198
          ColCount = 2
          DefaultRowHeight = 18
          FixedCols = 0
          RowCount = 49
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
          ParentShowHint = False
          ScrollBars = ssVertical
          ShowHint = True
          TabOrder = 5
          OnSelectCell = MetVar_GridSelectCell
          Alignment = alRight
          OnShowHintCell = MetVar_GridShowHintCell
          OnAfterEdit = MetVar_GridAfterEdit
          OnValidateEdit = MetVar_GridValidateEdit
          ColWidths = (
            300
            220)
          Cells = (
            0
            0
            'Variables'
            1
            0
            'Valores')
          PropCell = (
            0
            0
            1
            2
            2
            2
            0
            0
            1
            3
            1
            0
            0
            2
            2
            2
            0
            0
            3
            2
            2
            0
            0
            28
            2
            1
            0)
          PropCol = (
            0
            1
            1
            2
            2
            0
            1
            1
            2
            0)
          PropRow = ()
          PropFixedCol = (
            0
            1
            1
            2
            2
            0)
          PropFixedRow = (
            0
            1
            2
            0)
        end
      end
    end
    object tsAnexo19: TTabSheet
      Caption = 'Metodología de Anexo 19'
      ImageIndex = 4
      object gbInfoProyecto: TGroupBox
        Left = 3
        Top = 1
        Width = 584
        Height = 176
        Caption = ' Información del Proyecto '
        TabOrder = 0
        object lblIdentificador_Proy: TLabel
          Left = 8
          Top = 24
          Width = 61
          Height = 13
          Caption = 'Identificador:'
        end
        object lblNombre_Proy: TLabel
          Left = 8
          Top = 48
          Width = 40
          Height = 13
          Caption = 'Nombre:'
        end
        object lblDescripcion_Proy: TLabel
          Left = 8
          Top = 72
          Width = 59
          Height = 13
          Caption = 'Descripción:'
        end
        object Label42: TLabel
          Left = 8
          Top = 104
          Width = 31
          Height = 13
          Caption = 'Etapa:'
        end
        object lblImp_Sobrecosto_Proy: TLabel
          Left = 8
          Top = 136
          Width = 99
          Height = 13
          Caption = 'Importe Sobre Costo:'
        end
        object lblImp_Cub3ros_Proy: TLabel
          Left = 136
          Top = 136
          Width = 103
          Height = 13
          Caption = 'Importe Cubierto 3ros:'
        end
        object lblUtilidDefic_Proy: TLabel
          Left = 264
          Top = 136
          Width = 73
          Height = 13
          Caption = 'Utilidad/Deficit:'
        end
        object bbBuscar_Proy: TBitBtn
          Left = 504
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Buscar'
          Enabled = False
          TabOrder = 0
          OnClick = bbBuscar_ProyClick
        end
        object bbAlta_Proy: TBitBtn
          Left = 504
          Top = 48
          Width = 75
          Height = 25
          Caption = 'Alta'
          Enabled = False
          TabOrder = 1
          OnClick = bbAlta_ProyClick
        end
        object bbModificar_Proy: TBitBtn
          Left = 504
          Top = 80
          Width = 75
          Height = 25
          Caption = 'Modificar'
          Enabled = False
          TabOrder = 2
          OnClick = bbModificar_ProyClick
        end
        object bbGuardar_Proy: TBitBtn
          Left = 504
          Top = 112
          Width = 75
          Height = 25
          Caption = 'Guardar'
          Enabled = False
          TabOrder = 3
          OnClick = bbGuardar_ProyClick
        end
        object bbCancelar_Proy: TBitBtn
          Left = 504
          Top = 144
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          Enabled = False
          TabOrder = 4
          OnClick = bbCancelar_ProyClick
        end
        object edIdentificador_Proy: TEdit
          Left = 120
          Top = 24
          Width = 121
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 5
        end
        object edNombre_Proy: TEdit
          Left = 120
          Top = 48
          Width = 297
          Height = 21
          Enabled = False
          TabOrder = 6
        end
        object edDescripcion_Proy: TEdit
          Left = 120
          Top = 72
          Width = 369
          Height = 21
          Enabled = False
          TabOrder = 7
        end
        object rdgEtapa_Proy: TRadioGroup
          Left = 120
          Top = 96
          Width = 257
          Height = 33
          Columns = 2
          Enabled = False
          Items.Strings = (
            'En construcción'
            'En uso')
          TabOrder = 8
        end
        object edImp_Sobrecosto_Proy: TEdit
          Left = 8
          Top = 152
          Width = 121
          Height = 21
          Enabled = False
          TabOrder = 9
        end
        object edImp_Cub3ros_Proy: TEdit
          Left = 136
          Top = 152
          Width = 121
          Height = 21
          Enabled = False
          TabOrder = 10
        end
        object edUtilidDefic_Proy: TEdit
          Left = 264
          Top = 152
          Width = 121
          Height = 21
          Enabled = False
          TabOrder = 11
        end
      end
      object gbContProy: TGroupBox
        Left = 3
        Top = 182
        Width = 582
        Height = 155
        Caption = ' Contratos y Proyectos '
        TabOrder = 1
        object sagContProy: TStringAlignGrid
          Left = 3
          Top = 15
          Width = 478
          Height = 130
          DefaultRowHeight = 18
          FixedCols = 0
          RowCount = 2
          TabOrder = 0
          Alignment = alRight
          ColWidths = (
            70
            55
            176
            50
            102)
          Cells = (
            0
            0
            'Contrato'
            1
            0
            'Proyecto'
            2
            0
            'Nombre'
            3
            0
            'Cve. Met'
            4
            0
            'Metodología')
          PropCell = (
            0
            0
            1
            2
            0
            1
            0
            1
            2
            0
            2
            0
            1
            2
            0
            3
            0
            1
            2
            0
            4
            0
            1
            2
            0)
          PropCol = (
            0
            1
            2
            0
            1
            1
            2
            0
            2
            1
            1
            0
            3
            1
            2
            0
            4
            1
            1
            0)
          PropRow = ()
          PropFixedCol = ()
          PropFixedRow = ()
        end
        object bbProyectos_ContProy: TBitBtn
          Left = 496
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Proyecto'
          Enabled = False
          TabOrder = 1
          OnClick = bbProyectos_ContProyClick
        end
        object bbGuardar_ContProy: TBitBtn
          Left = 496
          Top = 79
          Width = 75
          Height = 25
          Caption = 'Guardar'
          Enabled = False
          TabOrder = 3
          OnClick = bbGuardar_ContProyClick
        end
        object bbCancelar_ContProy: TBitBtn
          Left = 496
          Top = 110
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          Enabled = False
          TabOrder = 4
          OnClick = bbCancelar_ContProyClick
        end
        object bbMetodologia_ContProy: TBitBtn
          Left = 496
          Top = 48
          Width = 75
          Height = 25
          Caption = 'Metodología'
          Enabled = False
          TabOrder = 2
          OnClick = bbMetodologia_ContProyClick
        end
      end
    end
  end
  object btCALIF_CALIFICA: TBitBtn
    Tag = 17
    Left = 0
    Top = 539
    Width = 200
    Height = 20
    Caption = 'Calificación Calificadoras'
    TabOrder = 15
    TabStop = False
    OnClick = btCALIF_CALIFICAClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      003337777777777777F330FFFFFFFFFFF03337F33F333F3337F330FF0FFF0FFF
      F03337F37F337F3337F330FF0FFF0FFFF03337F37FFF7FFF37F330F00000000F
      F03337F77777777337F330FFF0FFF0FFF03337F337F337F337F330FFF0FFF0FF
      F03337F337FFF7FFF7F330FF00000000F03337F37777777737F330FFFF0FFF0F
      F03337F3337F337F37F330FFFF0FFF0FF03337F33373337337F330FFFFFFFFFF
      F03337F33333333FF7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
      F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
      333337FFFFFFFF77333330000000000333333777777777733333}
    NumGlyphs = 2
  end
  object edSECTOR_CORP: TEdit
    Left = 216
    Top = 0
    Width = 39
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    PopupMenu = pmPERSONA
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
  end
  object chB_AUTORIZADO: TCheckBox
    Tag = 18
    Left = 419
    Top = 459
    Width = 166
    Height = 21
    HelpContext = 1950
    Alignment = taLeftJustify
    Caption = 'Autorizado por Créditos'
    TabOrder = 16
    OnClick = chB_AUTORIZADOClick
    OnExit = chB_AUTORIZADOExit
  end
  object btComisiones: TBitBtn
    Tag = 17
    Left = 200
    Top = 539
    Width = 200
    Height = 20
    Caption = 'Registro de comisiones'
    TabOrder = 17
    TabStop = False
    OnClick = btComisionesClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
      000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
      FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
      00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
      00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
      FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
      0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
      05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
      55557F7777777555555500000005555555557777777555555555}
    NumGlyphs = 2
  end
  object ed_SiglasRFC: TEdit
    Left = 117
    Top = 23
    Width = 36
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    PopupMenu = pmPERSONA
    ReadOnly = True
    ShowHint = True
    TabOrder = 18
  end
  object edF_RFC: TEdit
    Left = 156
    Top = 23
    Width = 44
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    PopupMenu = pmPERSONA
    ReadOnly = True
    ShowHint = True
    TabOrder = 20
  end
  object ed_HomoRFC: TEdit
    Left = 203
    Top = 23
    Width = 28
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    PopupMenu = pmPERSONA
    ReadOnly = True
    ShowHint = True
    TabOrder = 21
  end
  object btRECUP_ACREDITA: TBitBtn
    Tag = 17
    Left = 399
    Top = 539
    Width = 200
    Height = 20
    Caption = 'Recuperación'
    TabOrder = 19
    TabStop = False
    OnClick = btRECUP_ACREDITAClick
    Glyph.Data = {
      42010000424D4201000000000000760000002800000013000000110000000100
      040000000000CC00000000000000000000001000000010000000000000007B00
      0000FF0000006B520000A5840000FFDE520000007B000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00444444444444
      4444444000004400034444444444444000004011103400034444444000004028
      1030111034444440000040221030281034444440000044000340221034444440
      0000444444440003444444400000444400003344444444400000444066040033
      4444444000004440760844003443344000004440776008840330044000004440
      3000048840001440000044408400048884401440000044440844448888401440
      0000444440888888884014400000444444000000000014400000444444444444
      444444400000}
  end
  object btCve_ave: TBitBtn
    Tag = 18
    Left = 320
    Top = 24
    Width = 22
    Height = 20
    HelpContext = 1002
    PopupMenu = pmPERSONA
    TabOrder = 22
    OnClick = btCve_aveClick
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
  object edCve_Ave: TEdit
    Tag = 530
    Left = 265
    Top = 24
    Width = 50
    Height = 21
    TabOrder = 23
    OnExit = edCve_AveExit
  end
  object edDesc_Cve_Ave: TEdit
    Left = 352
    Top = 24
    Width = 74
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    PopupMenu = pmPERSONA
    ReadOnly = True
    ShowHint = True
    TabOrder = 24
  end
  object ControlBar1: TControlBar
    Left = -2
    Top = 559
    Width = 201
    Height = 22
    BevelEdges = [beLeft, beTop]
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelKind = bkSoft
    TabOrder = 25
    object ToolBar1: TToolBar
      Left = 11
      Top = 2
      Width = 185
      Height = 19
      Align = alNone
      AutoSize = True
      ButtonHeight = 19
      ButtonWidth = 185
      Caption = 'ToolBar1'
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      List = True
      ShowCaptions = True
      TabOrder = 0
      Transparent = True
      Wrapable = False
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Caption = '      Datos Complementarios - R04     '
        Grouped = True
        MenuItem = Autorizacin1
      end
    end
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesCancelar = InterForma1DespuesCancelar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnErrorAceptar = InterForma1ErrorAceptar
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
    Left = 534
    Top = 65533
  end
  object ilPERSONA: TInterLinkit
    Control = edID_ACREDITADO
    OnEjecuta = ilPERSONAEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 412
    Top = 65534
  end
  object ilCALIFICA: TInterLinkit
    Control = edCVE_CALIFACION
    OnEjecuta = ilCALIFICAEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 428
    Top = 171
  end
  object pmPERSONA: TPopupMenu
    Left = 492
    Top = 7
    object ConsultaSectorPersona1: TMenuItem
      Caption = '&Acceso a Personas Corporativas'
      OnClick = ConsultaSectorPersona1Click
    end
  end
  object ilTIPOACRED: TInterLinkit
    Control = edTIPO_ACRED_REL
    OnEjecuta = ilTIPOACREDEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 420
    Top = 102
  end
  object ilGrupoEco: TInterLinkit
    Control = edCVE_GRUPO_ECO
    OnEjecuta = ilGrupoEcoEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 386
    Top = 101
  end
  object ilSectorEco: TInterLinkit
    Control = edCVE_SECTOR_ECO
    OnEjecuta = ilSectorEcoEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 356
    Top = 102
  end
  object ilTamAcred: TInterLinkit
    Control = edCVE_TAM_ACRED
    OnEjecuta = ilTamAcredEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 421
    Top = 138
  end
  object ilCVE_LOCAL_CNBV: TInterLinkit
    Control = edCVE_LOCAL_CNBV
    OnEjecuta = ilCVE_LOCAL_CNBVEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 385
    Top = 137
  end
  object ilSENICREB: TInterLinkit
    Control = edCVE_SENICREB
    OnEjecuta = ilSENICREBEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 389
    Top = 172
  end
  object ilCVE_TIPO_RELAC: TInterLinkit
    Control = edCVE_TIPO_RELAC
    OnEjecuta = ilCVE_TIPO_RELACEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    Left = 356
    Top = 135
  end
  object ilCVE_PER_JUR_REG: TInterLinkit
    Control = edCVE_PER_JUR_REG
    OnEjecuta = ilCVE_PER_JUR_REGEjecuta
    TipoReader = trEntero
    CharCase = ecNormal
    Left = 352
    Top = 170
  end
  object ilCVE_METODOLOGIA: TInterLinkit
    Control = edCVE_PER_JUR_REG
    OnEjecuta = ilCVE_METODOLOGIAEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    Left = 428
    Top = 208
  end
  object qEstados: TQuery
    SQL.Strings = (
      'Select Cve_Ave'
      '  From Cr_Per_Anexo18 CPA '
      
        '  Join Cr_Acreditado  CRA On CPA.Id_Acreditado = CRA.Id_Acredita' +
        'do'
      ' Where CPA.Id_Acreditado = :Id_Acreditado'
      '')
    Left = 428
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_Acreditado'
        ParamType = ptUnknown
      end>
  end
  object dsEstados: TDataSource
    DataSet = qEstados
    Left = 388
    Top = 240
  end
  object spLimpia_Tabla: TStoredProc
    Left = 348
    Top = 208
  end
  object spAgrega_Detalle: TStoredProc
    Left = 388
    Top = 208
  end
  object spInsert_Detalle: TStoredProc
    Left = 348
    Top = 240
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    Left = 364
    Top = 336
  end
  object ImageList: TImageList
    Left = 396
    Top = 336
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000516002D21530DCD00000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000066FF6600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000036
      4D21296314F120620DEB00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000095F0D001F8022008DFEA9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000074B7F222766
      21EC428A40FF21650FEB1F5D00DA1F5E00DA1F5F00DB1F5F00DB1F5F00DB1F5F
      00DB1F5D00DA1F5D00DA1E5C01A0000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000045806004DCA570077EE8100207321005FFF7F0000000000000000000000
      000000000000000000000000000000000000000000000D4B7C2529631CEC4589
      41FF378B39FF37A43BFD2FB535F229C033F223CC31F21ECD2DF219C725F211B6
      1DF20D9B15F00E7C13F51E610CF0000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000153
      040036BF3F0060FE6F0069FF780058F065001272150038E25400000000000000
      00000000000000000000000000000000000000000000225E1CD547893AFF378E
      3AFF32AC36FF2EC436FF2DD638FF28E137FF23E934FF1AE72BFF10DB20FF06C6
      12FF00A105FF006F02FF186108F8000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000014F010023B1
      30004FE95E0078EF840079F2840058F567004AE756000C6C10001FBF1F000000
      000000000000000000000000000000000000000000001365A3351A691AEB0DA3
      10FF28C936FF45D856FB57E767EA6CF37BEA74F482EA67F472EA52EE56E840CE
      4FF029BF39FF018F06FF186709F8000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000064E080023A0300053D7
      5F0088E491008EE596009FEAA50071E77C004AE759003FD64C0008620B00008D
      1C0000000000000000000000000000000000000000000D68C338087BD85D2484
      27F049EB4FFF2F8B20EA1F5F01BA206101BA206001BB206001BB205D00B62266
      06C748D957FF08AB10FF187109F8000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000045207005DB366006FD179009DDF
      A30098DF9F00228227001F7D250099E5A00069DB740039D8490031C23D000356
      050000710000000000000000000000000000000000000F6CBF710981F7804EAA
      E78B3B9B39F43E902AEA00000000000000000000000000000000112AA2BE267D
      32845BF25EB20EB91AC21A7208DF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B7F1700448E4900B5DDBA00A9DA
      AE002E8F340008AA150000AA2A0017841E00A5E2AA0060D06A0028C9370022B0
      2F00034C0400003F0000000000000000000000000000106BBAAB027EEDCB3C9D
      FEBE1143908132861AC000FF00010000000000000000000000002A4BB1E32B50
      A8F359E9786A14C61A561C6B05BC000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000990C00338F3A003F92
      430000A00B00000000000000000000AA1500117E1800B3E3B70055C4600015B7
      250013A32000024A04000038000000000000000000001066B3DE0077E1FF1F8D
      F9FF1F8DF9FF000079A801047BAD00027BAD00027CAC00017AAB1C41ACE23499
      FFFF0E3E97EC10B1262E19B2190A000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000A10D0004A3
      13000000000000000000000000000000000000A217000D771300B4DCB70051B2
      5A00069E14000B95170010531200004F0F00000000001561ACE10672D7FF0E7B
      E0FF2188F2ED3F9CFEE261AFFEE46FB8FEE466B4FDE44DA3F7E4278FF7F90177
      ECFF1671CDFF06356EDD1297251B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000008B00000F771700B6D7
      B900529F5A003A9941004993510001440100000000003671B1E24796ECFF3899
      EDFF32AAFDFF47B7FFFF60C0FFFF60BFFFFF4AB5FFFF28A4FFFF0B8AF3FF1A86
      E0FF2788D8FF1B6AC4FF0B3266C9000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000A200000F78
      1700BAD7BD00569E5D00004C010000000000000000005279A1D279AEE6FB6CAD
      E3F467B2EAF461B6EFF461B8F1F559B4F1F54BA9EDF5469EE2F54999DFFD4295
      E0FF428FE0FF183B85E91071202F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000A2
      0000117617000F5D100000000000000000000000000002077465010576920102
      78B2010479B2010479B201057AB301057BB401057AB3000278B2233791E594C1
      FDFF3A5D99E90C79182A00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000333D8DE3646E
      AAF106481E2A0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002A3065B91712
      2536000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFF1FF00000000FDFFE3FF00000000
      F8FFC00100000000F07F800100000000E03F800100000000C01F800100000000
      800F800100000000000783C100000000000381C1000000008601800100000000
      CF00800100000000FF80800100000000FFC1800100000000FFE3800300000000
      FFF7FFC700000000FFFFFFCF0000000000000000000000000000000000000000
      000000000000}
  end
  object OpenDialog1: TOpenDialog
    Left = 432
    Top = 336
  end
  object pmCarga: TPopupMenu
    Left = 428
    Top = 368
    object CargadearchivoExcel1: TMenuItem
      Caption = 'Carga de archivo Excel'
    end
  end
  object qValidaEstadosMun: TQuery
    Left = 428
    Top = 240
  end
  object qSevPerdida: TQuery
    SQL.Strings = (
      'Select * '
      '  From (  '
      '        Select Cre.Id_Credito, '
      '               Cto.Id_Contrato, '
      
        '               P.Id_Persona                        As Acreditado' +
        ', '
      '               Be.Desc_Estado, '
      
        '               P.Nombre                            As Desc_Clave' +
        ', '
      '               Nvl (Csc.S_Perdida * 100, 0) || '#39'%'#39' As Sp, '
      '               Nvl (Csc.P_Incumpl * 100, 0) || '#39'%'#39' As Pi, '
      '               Trunc (Csc.Anio_Mes) F_Proceso, '
      
        '               Row_Number() Over (Partition By Cre.Id_Credito Or' +
        'der By Cp.Id_Usr_Cod_Post Desc) Renglon '
      '          From Persona          P'
      
        '          Join Contrato         Cto On P.Id_Persona     = Cto.Id' +
        '_Titular'
      
        '          Join Cr_Credito       Cre On (Cto.Id_Contrato = Cre.Id' +
        '_Contrato And'
      '                                        Cre.Sit_Credito = '#39'AC'#39
      '                                       )'
      
        '          Join Cr_Tipos_Garan   Crg On (Crg.Id_Contrato = Cto.Id' +
        '_Contrato) '
      
        '          Join Domicilio        D   On D.Id_Domicilio   = Nvl (P' +
        '.Id_Dom_Fiscal, P.Id_Domicilio) '
      
        '          Join Codigo_Postal    Cp  On Cp.Codigo_Postal = D.Codi' +
        'go_Postal '
      
        '          Join Bc_Estado        Be  On Be.Cve_Estado    = Cp.Id_' +
        'Estado_Pml '
      
        '          Join (Select S_Perdida, P_Incumpl, Anio_Mes, Id_Credit' +
        'o'
      '                  From Cr_Sicc_Califica'
      '                 Where Vigente = 1'
      
        '                   And Trunc (Anio_Mes) = (Select Max (Anio_Mes)' +
        ' '
      
        '                                             From Cr_Sicc_Vobo_P' +
        'er'
      
        '                                            Where Cve_Situacion ' +
        '= '#39'AC'#39' '
      '                                             And Cve_Vobo = 1  '
      '                                           )'
      '                ) Csc On Cre.Id_Credito  = Csc.Id_Credito'
      '         Where P.Id_Persona = :Id_Acreditado'
      '         Order By P.Id_Persona, Cre.Id_Credito  '
      '        )'
      ' Where Renglon = 1 '
      ' Order By Desc_Estado, Desc_Clave'
      '')
    Left = 348
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_Acreditado'
        ParamType = ptUnknown
      end>
  end
  object qAve: TQuery
    SQL.Strings = (
      'Select *'
      '  From  Cr_Tipo_Ave'
      ''
      '    '
      ' ')
    Left = 391
    Top = 281
  end
  object MainMenu1: TMainMenu
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Left = 16
    Top = 464
    object Autorizacin1: TMenuItem
      Caption = '      Datos Complementarios - R04     '
      object mnuSPPIXAcreditados: TMenuItem
        Caption = '&SP-PI por Acreditados'
        OnClick = mnuSPPIXAcreditadosClick
      end
      object mnuConfiguracionModelos: TMenuItem
        Caption = 'Configuración de Metodología'
        OnClick = mnuConfiguracionModelosClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuRegistrodeGarantas: TMenuItem
        Caption = 'Registro de Garantías'
        OnClick = mnuRegistrodeGarantasClick
      end
    end
  end
end
