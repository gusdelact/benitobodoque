object WCrCalCalifica: TWCrCalCalifica
  Left = 349
  Top = 230
  Width = 648
  Height = 290
  Caption = 'Catálogo Calificaciones de Calificadoras'
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
  object lbID_CALIFICADORA: TLabel
    Left = 8
    Top = 24
    Width = 70
    Height = 13
    Caption = 'Id. Calificadora'
  end
  object lbCVE_TIPO_RIESGO: TLabel
    Left = 8
    Top = 50
    Width = 72
    Height = 13
    Caption = 'Tipo de Riesgo'
  end
  object lbCVE_CALIFICACION: TLabel
    Left = 8
    Top = 77
    Width = 54
    Height = 13
    Caption = 'Calificación'
  end
  object lbNUM_PUNTOS_DIST: TLabel
    Left = 208
    Top = 70
    Width = 98
    Height = 26
    Caption = 'Puntos de Distancia para la Calificación'
    WordWrap = True
  end
  object lbNUM_NIVEL: TLabel
    Left = 410
    Top = 69
    Width = 135
    Height = 27
    AutoSize = False
    Caption = 'Puntos de Distancia para Capitalización (Nivel)'
    WordWrap = True
  end
  object lbF_ALTA: TLabel
    Left = 8
    Top = 141
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object lbF_MODIFICA: TLabel
    Left = 8
    Top = 164
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object LBCVE_USU_ALTA: TLabel
    Left = 231
    Top = 141
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object lbCVE_USU_MODIFICA: TLabel
    Left = 231
    Top = 165
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object Label1: TLabel
    Left = 230
    Top = 5
    Width = 120
    Height = 13
    Caption = 'Nombre de la calificadora'
  end
  object lbCVE_TIPO_ESCALA: TLabel
    Left = 8
    Top = 108
    Width = 56
    Height = 13
    Caption = 'Tipo Escala'
  end
  object lbCVE_PONDERACION: TLabel
    Left = 208
    Top = 108
    Width = 60
    Height = 13
    Caption = 'Ponderación'
  end
  object lbCVE_ORDENACION: TLabel
    Left = 386
    Top = 108
    Width = 55
    Height = 13
    Caption = 'Ordenación'
  end
  object edID_CALIFICADORA: TEdit
    Tag = 562
    Left = 106
    Top = 22
    Width = 96
    Height = 21
    HelpContext = 1000
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 0
    OnExit = edID_CALIFICADORAExit
  end
  object edCVE_TIPO_RIESGO: TEdit
    Tag = 562
    Left = 106
    Top = 45
    Width = 97
    Height = 21
    HelpContext = 1101
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 2
    OnExit = edCVE_TIPO_RIESGOExit
  end
  object edCVE_CALIFICACION: TEdit
    Tag = 50
    Left = 106
    Top = 71
    Width = 80
    Height = 21
    HelpContext = 1201
    MaxLength = 20
    TabOrder = 4
    OnExit = edCVE_CALIFICACIONExit
  end
  object edF_MODIFICA: TEdit
    Left = 106
    Top = 161
    Width = 103
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 12
  end
  object edF_ALTA: TEdit
    Left = 106
    Top = 137
    Width = 103
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 11
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 345
    Top = 161
    Width = 106
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 14
  end
  object edCVE_USU_ALTA: TEdit
    Left = 345
    Top = 137
    Width = 106
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 13
  end
  object PnDatos: TPanel
    Left = 2
    Top = 207
    Width = 623
    Height = 21
    TabOrder = 16
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
      Left = 312
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
      Left = 312
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
      Left = 376
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
      Left = 376
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
    Left = 0
    Top = 185
    Width = 625
    Height = 21
    TabOrder = 15
  end
  object rgSIT_CAL_CALIFICA: TRadioGroup
    Tag = 18
    Left = 460
    Top = 130
    Width = 165
    Height = 56
    HelpContext = 1301
    Caption = 'Sit. Calificación de Calificadora'
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Cancelado')
    TabOrder = 10
    TabStop = True
    OnExit = rgSIT_CAL_CALIFICAExit
  end
  object btID_CALIFICADORA: TBitBtn
    Tag = 50
    Left = 202
    Top = 22
    Width = 24
    Height = 22
    HelpContext = 1001
    TabOrder = 1
    OnClick = btID_CALIFICADORAClick
    OnExit = edID_CALIFICADORAExit
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
  object edNOM_CALIFICADORA: TEdit
    Left = 225
    Top = 22
    Width = 398
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 17
  end
  object edNUM_PUNTOS_DIST: TInterEdit
    Tag = 18
    Left = 313
    Top = 71
    Width = 80
    Height = 21
    HelpContext = 1202
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    OnExit = edCVE_CALIFICACIONExit
    MaxLength = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 5
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object btCVE_TIPO_RIESGO: TBitBtn
    Tag = 50
    Left = 202
    Top = 45
    Width = 24
    Height = 22
    HelpContext = 1102
    TabOrder = 3
    OnClick = btCVE_TIPO_RIESGOClick
    OnExit = edCVE_TIPO_RIESGOExit
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
  object edDESC_TIPO_RIESGO: TEdit
    Left = 226
    Top = 45
    Width = 398
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 18
  end
  object edNUM_NIVEL: TInterEdit
    Tag = 18
    Left = 543
    Top = 71
    Width = 80
    Height = 21
    HelpContext = 1203
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    OnExit = edCVE_CALIFICACIONExit
    MaxLength = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 6
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edCVE_TIPO_ESCALA: TInterEdit
    Tag = 18
    Left = 106
    Top = 103
    Width = 80
    Height = 21
    HelpContext = 1204
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    MaxLength = 4
    TabOrder = 7
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edCVE_PONDERACION: TInterEdit
    Tag = 18
    Left = 280
    Top = 103
    Width = 80
    Height = 21
    HelpContext = 1205
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    MaxLength = 4
    TabOrder = 9
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edCVE_ORDENACION: TInterEdit
    Tag = 18
    Left = 456
    Top = 103
    Width = 80
    Height = 21
    HelpContext = 1206
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    MaxLength = 4
    TabOrder = 8
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object Ver: TButton
    Left = 8
    Top = 234
    Width = 110
    Height = 25
    Caption = 'Ver...'
    TabOrder = 19
    OnClick = VerClick
  end
  object Imprimir: TButton
    Left = 136
    Top = 234
    Width = 110
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 20
    OnClick = ImprimirClick
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesNuevo = InterForma1AntesNuevo
    msgSinRegistros = 'No existe un Registro para realizar la operación.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = 'żDesea Eliminar el Registro Actual?'
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 591
    Top = 197
  end
  object ilID_CALIFICADORA: TInterLinkit
    Control = edID_CALIFICADORA
    OnEjecuta = ilID_CALIFICADORAEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    OnCapture = ilID_CALIFICADORACapture
    Left = 436
    Top = 8
  end
  object ilCVE_TIPO_RIESGO: TInterLinkit
    Control = edCVE_TIPO_RIESGO
    OnEjecuta = ilCVE_TIPO_RIESGOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilID_CALIFICADORACapture
    Left = 319
    Top = 41
  end
end
