object WCrPerfilUs: TWCrPerfilUs
  Left = 325
  Top = 24
  Width = 588
  Height = 325
  Caption = 'Identificación de Perfil  de Usuario'
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
  object lbCVE_GPO_ACCESO: TLabel
    Left = 8
    Top = 8
    Width = 113
    Height = 13
    Caption = 'Clave de Grupo Acceso'
  end
  object lbDESC_TIPO_USUAR: TLabel
    Left = 8
    Top = 76
    Width = 82
    Height = 13
    Caption = 'Descripción Perfil'
  end
  object edCVE_GPO_ACCESO: TEdit
    Tag = 562
    Left = 136
    Top = 1
    Width = 113
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    TabOrder = 0
    OnExit = edCVE_GPO_ACCESOExit
  end
  object edDESC_TIPO_USUAR: TEdit
    Tag = 18
    Left = 134
    Top = 71
    Width = 443
    Height = 21
    HelpContext = 3001
    CharCase = ecUpperCase
    TabOrder = 4
    OnExit = edDESC_TIPO_USUARExit
  end
  object chB_BLOQUEADO: TCheckBox
    Tag = 18
    Left = 472
    Top = 248
    Width = 105
    Height = 21
    HelpContext = 7001
    Caption = 'Perfil Bloqueado'
    TabOrder = 8
    OnExit = chB_BLOQUEADOExit
  end
  object btnCVE_GPO_ACCESO: TBitBtn
    Tag = 50
    Left = 256
    Top = 0
    Width = 25
    Height = 22
    HelpContext = 1002
    TabOrder = 1
    TabStop = False
    OnClick = btnCVE_GPO_ACCESOClick
    OnExit = edCVE_GPO_ACCESOExit
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
  object PnDatos: TPanel
    Left = 3
    Top = 269
    Width = 574
    Height = 21
    TabOrder = 9
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
  object edNOM_GPO_ACCESO: TEdit
    Left = 294
    Top = 1
    Width = 283
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 2
    Top = 94
    Width = 575
    Height = 37
    Caption = 'Remanentes (Devoluciones)'
    TabOrder = 5
    object chB_AUT_REMANENTE: TCheckBox
      Tag = 18
      Left = 8
      Top = 14
      Width = 217
      Height = 21
      HelpContext = 4001
      Caption = 'Autoriza Remanentes (Devoluciones)'
      TabOrder = 0
      OnExit = chB_AUT_REMANENTEExit
    end
    object chB_LIB_REMANENTE: TCheckBox
      Tag = 18
      Left = 288
      Top = 14
      Width = 209
      Height = 21
      HelpContext = 4501
      Caption = 'Libera Remanentes (Devoluciones)'
      TabOrder = 1
      OnExit = chB_LIB_REMANENTEExit
    end
  end
  object cbB_VAL_HORA_SEG: TCheckBox
    Tag = 18
    Left = 11
    Top = 136
    Width = 289
    Height = 19
    HelpContext = 5001
    Caption = 'Valida horario de Seguimiento de Cobranza'
    TabOrder = 6
    OnExit = cbB_VAL_HORA_SEGExit
  end
  object rgCVE_TIPO_USUARIO: TRadioGroup
    Tag = 50
    Left = 2
    Top = 28
    Width = 575
    Height = 37
    HelpContext = 2001
    Caption = 'Tipo de Usuario dentro del Sistema de  Créditos'
    Columns = 3
    Items.Strings = (
      'Administrador'
      'Asistente'
      'Consulta')
    TabOrder = 3
    OnExit = rgCVE_TIPO_USUARIOExit
  end
  object GroupBox2: TGroupBox
    Left = 3
    Top = 157
    Width = 574
    Height = 88
    Caption = 'Descuento de Documentos'
    TabOrder = 7
    object Label1: TLabel
      Left = 8
      Top = 64
      Width = 252
      Height = 13
      Caption = 'Importe Máximo Autorización Automática de Cesiones'
    end
    object cbB_AUT_CESION: TCheckBox
      Tag = 18
      Left = 8
      Top = 16
      Width = 177
      Height = 17
      HelpContext = 6001
      Caption = 'Autoriza Cesiones'
      TabOrder = 0
      OnExit = cbB_AUT_CESIONExit
    end
    object cbB_VAL_IMP_CES: TCheckBox
      Tag = 18
      Left = 288
      Top = 16
      Width = 281
      Height = 17
      HelpContext = 6101
      Caption = 'Valida Importe Máximo de Autorización de Cesiones'
      TabOrder = 1
      OnExit = cbB_VAL_IMP_CESExit
    end
    object iedIMP_MAX_AUT_CES: TInterEdit
      Tag = 18
      Left = 288
      Top = 59
      Width = 97
      Height = 22
      HelpContext = 6201
      Prefijo = '1'
      Contrato = -1
      TipoReader = trContrato
      OnExit = iedIMP_MAX_AUT_CESExit
      DisplayMask = '###,###,###,###0.00'
      MaxLength = 12
      TabOrder = 3
      UseReType = True
      UseSep = True
      UseDisplay = True
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object chB_CANCELA_CES_AU: TCheckBox
      Tag = 18
      Left = 8
      Top = 40
      Width = 177
      Height = 17
      HelpContext = 6001
      Caption = 'Cancela Cesiones'
      TabOrder = 2
      OnExit = chB_CANCELA_CES_AUExit
    end
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
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
    Left = 530
    Top = 3
  end
  object ILCVE_GPO_ACCESO: TInterLinkit
    Control = edCVE_GPO_ACCESO
    OnEjecuta = ILCVE_GPO_ACCESOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ILCVE_GPO_ACCESOCapture
    Left = 320
    Top = 1
  end
end
