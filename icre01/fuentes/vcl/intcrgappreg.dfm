object WCrGaPpRegistro: TWCrGaPpRegistro
  Left = 285
  Top = 268
  Width = 574
  Height = 354
  Caption = 'Registro de Garantía Primeras Pérdidas'
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
  object lbID_SOLICITUD: TLabel
    Left = 2
    Top = 10
    Width = 95
    Height = 13
    Caption = 'Número de Solicitud'
  end
  object lbPCT_GARANTIA: TLabel
    Left = 2
    Top = 162
    Width = 94
    Height = 13
    Caption = 'Porcentaje Garantia'
  end
  object lbCVE_BCO_GTIA: TLabel
    Left = 2
    Top = 36
    Width = 76
    Height = 13
    Caption = 'Banco Garantía'
  end
  object lbTX_DESC_PORTAF: TLabel
    Left = 2
    Top = 60
    Width = 103
    Height = 13
    Caption = 'Descripción Portafolio'
  end
  object Label2: TLabel
    Left = 2
    Top = 138
    Width = 95
    Height = 13
    Caption = 'Monto Garantia (fijo)'
  end
  object edID_SOLICITUD: TEdit
    Left = 117
    Top = 6
    Width = 107
    Height = 21
    CharCase = ecUpperCase
    Color = clMenu
    ReadOnly = True
    TabOrder = 0
  end
  object edCVE_BCO_GTIA: TEdit
    Left = 117
    Top = 31
    Width = 107
    Height = 21
    CharCase = ecUpperCase
    Color = clMenu
    ReadOnly = True
    TabOrder = 1
  end
  object edTX_DESC_PORTAF: TEdit
    Tag = 18
    Left = 117
    Top = 56
    Width = 438
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 149
    TabOrder = 4
  end
  object rgSIT_REG_GARANTIA: TRadioGroup
    Tag = 18
    Left = 312
    Top = 82
    Width = 78
    Height = 50
    Caption = 'Situación'
    Items.Strings = (
      'Activa'
      'Inactiva')
    TabOrder = 6
  end
  object GroupBox4: TGroupBox
    Left = 3
    Top = 213
    Width = 554
    Height = 58
    Caption = 'Registro'
    TabOrder = 12
    object Label1: TLabel
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
      Left = 101
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
      Left = 437
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
      Left = 101
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
    object edCVE_USU_MODIFICA: TEdit
      Left = 437
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
  object MsgPanel: TPanel
    Left = 3
    Top = 270
    Width = 553
    Height = 21
    TabOrder = 13
  end
  object PnDatos: TPanel
    Left = 3
    Top = 291
    Width = 553
    Height = 21
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
  object btnLigarLinea: TBitBtn
    Tag = 17
    Left = 3
    Top = 184
    Width = 184
    Height = 21
    Caption = 'Ligar Línea'
    TabOrder = 9
    OnClick = btnLigarLineaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300033300000
      00003777FF377777777707070330FFFFFFF077777F37F3FF3FF707370330F00F
      00F077F77F37F773773707370330FFFFFFF077F77F37F3FFFF3707070330F000
      0FF077777337F777733730003330FFFFFFF037773337F3FF3FF733033330F00F
      0000337FFF37F773777733000330FFFF0FF033777FF7F3FF7F3733007030F08F
      0F03337777F7F7737F7330703700FFFF003337773777FFFF7733307333700000
      0333377FF37777777FFF33073070333000033377F777FF37777F333077000307
      7770333777777F7777773333003300003300333377337777FF77333333333307
      7770333333333377777733333333333000033333333333377773}
    NumGlyphs = 2
  end
  object btnBitCambios: TBitBtn
    Tag = 17
    Left = 324
    Top = 152
    Width = 232
    Height = 21
    Caption = 'Bitácora Cambio'
    TabOrder = 10
    OnClick = btnBitCambiosClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
      555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
      05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
      FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
      FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
      FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
      05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
      555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
      9055575757575757775505050505055505557575757575557555}
    NumGlyphs = 2
  end
  object btnHistoRegGPC: TBitBtn
    Tag = 17
    Left = 324
    Top = 184
    Width = 232
    Height = 21
    Caption = 'Histórico Valor Garantía Periodo de Carga'
    TabOrder = 11
    OnClick = btnHistoRegGPCClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
      000333FFF3777777777F3000330FFFFFFF033777FF7F3FF3FF7F07B7030F00F0
      0F0377777F7F7737737F0BBB030FFFFFFF0377777F7F3FFFF37F07B7030F0000
      FF037777737F7777337F3000330FFFFFFF033777337F3FF3FF7F3333330F00F0
      00033333337F7737777F3333330FFFF0FF033FFFFF7F3FF7F3730000030F08F0
      F03377777F7F7737F7330999030FFFF0033377777F7FFFF77333099903000000
      333377777F7777773333099903333333333377777F33FFFFFFF3000003300000
      00337777733777777733333333330CCC033333333333777773333333333330C0
      3333333333333777333333333333330333333333333333733333}
    NumGlyphs = 2
  end
  object btnCVE_BCO_GTIA: TBitBtn
    Tag = 18
    Left = 226
    Top = 31
    Width = 22
    Height = 20
    HelpContext = 8001
    TabOrder = 2
    OnClick = btnCVE_BCO_GTIAClick
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
  object edTX_DESC_BCO_GARANTIA: TEdit
    Left = 251
    Top = 31
    Width = 303
    Height = 21
    CharCase = ecUpperCase
    Color = clMenu
    ReadOnly = True
    TabOrder = 3
  end
  object edPCT_GARANTIA: TInterEdit
    Tag = 18
    Left = 117
    Top = 160
    Width = 74
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###0.00'
    MaxLength = 12
    TabOrder = 8
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object rgCVE_DET_MONTO: TRadioGroup
    Tag = 18
    Left = 3
    Top = 82
    Width = 297
    Height = 50
    Caption = 'Forma determinación Monto Portafolio'
    Items.Strings = (
      'Monto Garantía (fijo)'
      'Aplicar Porcentaje Garantía (sobre valor consolidado)')
    TabOrder = 5
    OnClick = rgCVE_DET_MONTOClick
  end
  object edMONTO_GARANTIA: TInterEdit
    Tag = 18
    Left = 117
    Top = 136
    Width = 130
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###0.00'
    MaxLength = 12
    TabOrder = 7
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
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
    Left = 527
    Top = 2
  end
end
