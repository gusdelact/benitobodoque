object WCrEmailEmisor: TWCrEmailEmisor
  Left = 222
  Top = 141
  Width = 531
  Height = 358
  Caption = 'Relación Destinatarios (email) con el Emisor'
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
  object lblFecha_Alta: TLabel
    Left = 301
    Top = 250
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object lblUsuario_Alta: TLabel
    Left = 12
    Top = 250
    Width = 72
    Height = 13
    Caption = 'Usuario de Alta'
  end
  object grbxDestinatario: TGroupBox
    Left = 2
    Top = 117
    Width = 504
    Height = 84
    HelpContext = 2000
    Caption = 'Datos del Destinatario'
    TabOrder = 1
    object lbEMAIL: TLabel
      Left = 9
      Top = 51
      Width = 28
      Height = 13
      Caption = 'Email '
    end
    object lbNOMBRE: TLabel
      Left = 9
      Top = 25
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object edEMAIL: TEdit
      Tag = 50
      Left = 120
      Top = 48
      Width = 375
      Height = 21
      HelpContext = 2002
      CharCase = ecLowerCase
      TabOrder = 1
      OnExit = edEMAILExit
    end
    object edNOMBRE: TEdit
      Tag = 18
      Left = 120
      Top = 22
      Width = 375
      Height = 21
      HelpContext = 2001
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = edNOMBREExit
    end
  end
  object pnlSituacion: TPanel
    Left = 2
    Top = 199
    Width = 504
    Height = 41
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object lblSIT_MAIL_EMISOR: TLabel
      Left = 9
      Top = 15
      Width = 44
      Height = 13
      Caption = 'Situación'
    end
    object opSitActivo: TRadioButton
      Tag = 18
      Left = 120
      Top = 12
      Width = 78
      Height = 17
      Caption = 'Activo'
      TabOrder = 0
      OnClick = opSitCanceladoClick
    end
    object opSitCancelado: TRadioButton
      Tag = 18
      Left = 324
      Top = 12
      Width = 78
      Height = 17
      Caption = 'Cancelado'
      TabOrder = 1
      OnClick = opSitCanceladoClick
    end
  end
  object grbxEmisor: TGroupBox
    Left = 2
    Top = 5
    Width = 504
    Height = 108
    Caption = 'Datos del Emisor'
    TabOrder = 0
    object lbCVE_EMISOR_EXT: TLabel
      Left = 10
      Top = 81
      Width = 97
      Height = 13
      Caption = 'Identificador Externo'
    end
    object lbID_EMISOR: TLabel
      Left = 10
      Top = 55
      Width = 67
      Height = 13
      Caption = 'Emisor - Clave'
    end
    object Label1: TLabel
      Left = 9
      Top = 29
      Width = 106
      Height = 13
      Caption = 'Entidad Descontadora'
    end
    object edCVE_EMISOR_EXT: TEdit
      Tag = 20
      Left = 120
      Top = 78
      Width = 60
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 6
    end
    object edID_EMISOR: TEdit
      Tag = 562
      Left = 120
      Top = 51
      Width = 60
      Height = 21
      HelpContext = 1101
      CharCase = ecUpperCase
      TabOrder = 3
      OnExit = edID_EMISORExit
    end
    object btnID_PERSONA: TBitBtn
      Tag = 50
      Left = 183
      Top = 50
      Width = 24
      Height = 22
      HelpContext = 1102
      TabOrder = 4
      OnClick = btnID_PERSONAClick
      OnExit = edID_EMISORExit
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
    object edNom_Emisor: TEdit
      Tag = -1
      Left = 210
      Top = 51
      Width = 285
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 5
    end
    object edCVE_FND_ENT_DES: TEdit
      Tag = 562
      Left = 120
      Top = 25
      Width = 60
      Height = 21
      HelpContext = 1001
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = edCVE_FND_ENT_DESExit
    end
    object edDESC_ENT_DES: TEdit
      Tag = -1
      Left = 209
      Top = 25
      Width = 285
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 2
    end
    object brnCVE_FND_ENT_DES: TBitBtn
      Tag = 50
      Left = 182
      Top = 24
      Width = 24
      Height = 22
      HelpContext = 1002
      TabOrder = 1
      OnClick = brnCVE_FND_ENT_DESClick
      OnExit = edCVE_FND_ENT_DESExit
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
  end
  object dtpF_VENCIMIENTO: TInterDateTimePicker
    Tag = 18
    Left = 476
    Top = 246
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
    Edit = edF_ALTA
    Formato = dfDate
  end
  object edF_ALTA: TEdit
    Tag = 20
    Left = 385
    Top = 246
    Width = 90
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 4
  end
  object edCVE_USU_ALTA: TEdit
    Tag = 20
    Left = 127
    Top = 246
    Width = 121
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 3
  end
  object PnDatos: TPanel
    Left = 2
    Top = 293
    Width = 503
    Height = 21
    TabOrder = 6
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
      Left = 248
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
      Left = 248
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
      Left = 312
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
      Left = 312
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
    Left = 2
    Top = 272
    Width = 503
    Height = 20
    TabOrder = 7
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
    OnDespuesShow = InterForma1DespuesShow
    Left = 395
    Top = 14
  end
  object ilCVE_FND_ENT_DES: TInterLinkit
    Control = edCVE_FND_ENT_DES
    OnEjecuta = ilCVE_FND_ENT_DESEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCVE_FND_ENT_DESCapture
    Left = 232
    Top = 23
  end
  object ilEMISOR: TInterLinkit
    Control = edID_EMISOR
    OnEjecuta = ilEMISOREjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilEMISORCapture
    Left = 240
    Top = 58
  end
end
