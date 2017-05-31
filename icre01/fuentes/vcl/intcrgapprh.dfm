object WCrGaPpRegHisto: TWCrGaPpRegHisto
  Left = 301
  Top = 131
  Width = 577
  Height = 481
  Caption = 'Histórico Registro Garantía Periodo de Carga'
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
    Left = 6
    Top = 10
    Width = 75
    Height = 13
    Caption = 'No. de Solicitud'
  end
  object lbPERIODO: TLabel
    Left = 6
    Top = 36
    Width = 36
    Height = 13
    Caption = 'Periodo'
  end
  object lbTX_DESC_PORTAF: TLabel
    Left = 6
    Top = 89
    Width = 103
    Height = 13
    Caption = 'Descripción Portafolio'
  end
  object lbMONTO_GARANTIA: TLabel
    Left = 6
    Top = 172
    Width = 95
    Height = 13
    Caption = 'Monto Garantia (fijo)'
  end
  object lbPCT_GARANTIA: TLabel
    Left = 6
    Top = 196
    Width = 94
    Height = 13
    Caption = 'Porcentaje Garantia'
  end
  object lbF_ULT_CARGA_R04: TLabel
    Left = 6
    Top = 239
    Width = 116
    Height = 13
    Caption = 'Fecha Última Carga R04'
  end
  object lbCVE_BCO_GTIA: TLabel
    Left = 6
    Top = 60
    Width = 76
    Height = 13
    Caption = 'Banco Garantía'
  end
  object GroupBox1: TGroupBox
    Left = 338
    Top = 111
    Width = 221
    Height = 144
    Caption = 'Datos calculados última carga R04'
    TabOrder = 13
    object Label2: TLabel
      Left = 7
      Top = 16
      Width = 188
      Height = 13
      Caption = '(si aplicó opción "Porcentaje Garantía")'
    end
    object lbIMP_RESP_TOT: TLabel
      Left = 8
      Top = 40
      Width = 177
      Height = 13
      Caption = 'Responsabilidad Total (Suma Líneas)'
    end
    object lbIMP_VAL_GTIA: TLabel
      Left = 9
      Top = 91
      Width = 205
      Height = 13
      Caption = 'Valor Garantía (después aplicar porcentaje)'
    end
    object edIMP_RESP_TOT: TEdit
      Left = 8
      Top = 58
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      Color = clMenu
      ReadOnly = True
      TabOrder = 0
    end
    object edIMP_VAL_GTIA: TEdit
      Left = 9
      Top = 108
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
  end
  object edID_SOLICITUD: TEdit
    Left = 120
    Top = 5
    Width = 107
    Height = 21
    CharCase = ecUpperCase
    Color = clMenu
    ReadOnly = True
    TabOrder = 0
  end
  object edTX_DESC_PORTAF: TEdit
    Tag = 18
    Left = 120
    Top = 81
    Width = 438
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 7
  end
  object edF_ULT_CARGA_R04: TEdit
    Left = 144
    Top = 234
    Width = 110
    Height = 21
    CharCase = ecUpperCase
    Color = clMenu
    ReadOnly = True
    TabOrder = 11
  end
  object GroupBox4: TGroupBox
    Left = 3
    Top = 343
    Width = 554
    Height = 58
    Caption = 'Registro'
    TabOrder = 16
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
    Top = 400
    Width = 553
    Height = 21
    TabOrder = 17
  end
  object PnDatos: TPanel
    Left = 3
    Top = 421
    Width = 553
    Height = 21
    TabOrder = 18
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
  object btnLigarLineaHist: TBitBtn
    Tag = 17
    Left = 3
    Top = 314
    Width = 240
    Height = 21
    Caption = 'Histórico Líneas Garantía Periodo de Carga'
    TabOrder = 14
    OnClick = btnLigarLineaHistClick
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
  object btnBitCambiosHist: TBitBtn
    Tag = 17
    Left = 324
    Top = 314
    Width = 232
    Height = 21
    Caption = 'Bitácora Cambios Histórico'
    TabOrder = 15
    OnClick = btnBitCambiosHistClick
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
  object rgSIT_REG_GARANTIA: TRadioGroup
    Tag = 18
    Left = 5
    Top = 262
    Width = 142
    Height = 37
    Caption = 'Situación'
    Columns = 2
    Items.Strings = (
      'Activa'
      'Inactiva')
    TabOrder = 12
  end
  object rgCVE_DET_MONTO: TRadioGroup
    Tag = 18
    Left = 5
    Top = 111
    Width = 297
    Height = 50
    Caption = 'Forma determinación Monto Portafolio'
    Items.Strings = (
      'Monto Garantía (fijo)'
      'Aplicar Porcentaje Garantía (sobre valor consolidado)')
    TabOrder = 8
    OnClick = rgCVE_DET_MONTOClick
  end
  object edCVE_BCO_GTIA: TEdit
    Left = 120
    Top = 56
    Width = 107
    Height = 21
    CharCase = ecUpperCase
    Color = clMenu
    ReadOnly = True
    TabOrder = 4
  end
  object btnCVE_BCO_GTIA: TBitBtn
    Tag = 18
    Left = 229
    Top = 56
    Width = 22
    Height = 20
    HelpContext = 8001
    TabOrder = 5
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
    Left = 254
    Top = 56
    Width = 303
    Height = 21
    CharCase = ecUpperCase
    Color = clMenu
    ReadOnly = True
    TabOrder = 6
  end
  object edMONTO_GARANTIA: TInterEdit
    Tag = 18
    Left = 120
    Top = 169
    Width = 133
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###0.00'
    MaxLength = 12
    TabOrder = 9
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edPCT_GARANTIA: TInterEdit
    Tag = 18
    Left = 120
    Top = 193
    Width = 74
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###0.00'
    MaxLength = 12
    TabOrder = 10
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object btnID_SOLICITUD: TBitBtn
    Tag = 562
    Left = 229
    Top = 5
    Width = 22
    Height = 20
    HelpContext = 8001
    TabOrder = 1
    OnClick = btnID_SOLICITUDClick
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
  object edTX_DESC_PORTAF_PADRE: TEdit
    Left = 253
    Top = 5
    Width = 303
    Height = 21
    CharCase = ecUpperCase
    Color = clMenu
    ReadOnly = True
    TabOrder = 2
  end
  object edPERIODO: TMaskEdit
    Tag = 562
    Left = 120
    Top = 30
    Width = 74
    Height = 21
    EditMask = '000000'
    MaxLength = 6
    TabOrder = 3
    Text = '      '
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
    Left = 522
    Top = 2
  end
end
