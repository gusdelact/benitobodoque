object WMNRiesgo: TWMNRiesgo
  Left = 243
  Top = 182
  Width = 486
  Height = 227
  Caption = 'Catálogo de Niveles de Riesgo'
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
  object lbDESC_EXCEPCION: TLabel
    Left = 0
    Top = 49
    Width = 56
    Height = 13
    Caption = 'Descripción'
  end
  object lbID_PROMOTOR: TLabel
    Left = 0
    Top = 7
    Width = 47
    Height = 13
    AutoSize = False
    Caption = 'Empresa'
    WordWrap = True
  end
  object Label1: TLabel
    Left = 0
    Top = 28
    Width = 69
    Height = 13
    Caption = 'Clave de Nivel'
    WordWrap = True
  end
  object edDESC_NVL_RIESGO: TEdit
    Tag = 18
    Left = 100
    Top = 45
    Width = 373
    Height = 21
    HelpContext = 4000
    CharCase = ecUpperCase
    MaxLength = 20
    TabOrder = 4
    OnExit = edDESC_NVL_RIESGOExit
  end
  object PnlMsg: TPanel
    Left = 0
    Top = 157
    Width = 478
    Height = 21
    TabOrder = 7
  end
  object PnDatos: TPanel
    Left = 0
    Top = 178
    Width = 478
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
  object edID_EMPRESA: TEdit
    Tag = 562
    Left = 100
    Top = 3
    Width = 80
    Height = 21
    HelpContext = 2000
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 0
    OnExit = edID_EMPRESAExit
  end
  object btEMPRESA: TBitBtn
    Tag = 50
    Left = 181
    Top = 3
    Width = 21
    Height = 21
    HelpContext = 2001
    TabOrder = 1
    OnClick = btEMPRESAClick
    OnExit = edID_EMPRESAExit
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
    Left = 206
    Top = 3
    Width = 267
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 2
  end
  object edCVE_NVL_RIESGO: TEdit
    Tag = 50
    Left = 100
    Top = 24
    Width = 80
    Height = 21
    HelpContext = 3000
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 3
    OnExit = edCVE_NVL_RIESGOExit
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 97
    Width = 478
    Height = 60
    Caption = 'Registro'
    TabOrder = 6
    object lbF_ALTA: TLabel
      Left = 8
      Top = 39
      Width = 51
      Height = 13
      Caption = 'Fecha Alta'
    end
    object lbF_MODIF: TLabel
      Left = 276
      Top = 39
      Width = 73
      Height = 13
      Caption = 'Fecha Modifica'
    end
    object lbUSUA_ALTA: TLabel
      Left = 8
      Top = 16
      Width = 57
      Height = 13
      Caption = 'Usuario Alta'
    end
    object lbUSUA_MODIF: TLabel
      Left = 276
      Top = 15
      Width = 79
      Height = 13
      Caption = 'Usuario Modifica'
    end
    object edF_ALTA: TEdit
      Left = 100
      Top = 35
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edF_MODIFICA: TEdit
      Left = 362
      Top = 35
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edCVE_USUA_ALTA: TEdit
      Left = 100
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
    object edCVE_USUA_MODIF: TEdit
      Left = 362
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
  object rgSIT_NVL_RIESGO: TRadioGroup
    Tag = 18
    Left = 0
    Top = 67
    Width = 478
    Height = 30
    HelpContext = 5000
    Caption = 'Situación'
    Columns = 2
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Cancelado')
    TabOrder = 5
    TabStop = True
    OnExit = rgSIT_NVL_RIESGOExit
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
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
    Left = 275
    Top = 5
  end
  object ilEMPRESA: TInterLinkit
    Control = edID_EMPRESA
    OnEjecuta = ilEMPRESAEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilEMPRESACapture
    Left = 311
    Top = 5
  end
end
