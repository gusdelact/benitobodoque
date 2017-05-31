object WMRecDoc: TWMRecDoc
  Left = 218
  Top = 139
  Width = 524
  Height = 320
  Caption = 'Recepción de Documentos'
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
  object lbID_PROMOTOR: TLabel
    Left = 0
    Top = 28
    Width = 47
    Height = 13
    AutoSize = False
    Caption = 'Empresa'
    WordWrap = True
  end
  object Label3: TLabel
    Left = 0
    Top = 49
    Width = 52
    Height = 13
    Caption = 'No.Trámite'
    WordWrap = True
  end
  object Label4: TLabel
    Left = 336
    Top = 7
    Width = 72
    Height = 13
    Caption = 'No. Recepción'
    WordWrap = True
  end
  object Label5: TLabel
    Left = 0
    Top = 70
    Width = 55
    Height = 13
    Caption = 'Documento'
    WordWrap = True
  end
  object Label1: TLabel
    Left = 168
    Top = 49
    Width = 81
    Height = 13
    Caption = 'Núm. Expediente'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 0
    Top = 108
    Width = 71
    Height = 13
    Caption = 'Observaciones'
  end
  object PnlMsg: TPanel
    Left = 0
    Top = 249
    Width = 513
    Height = 21
    TabOrder = 15
  end
  object PnDatos: TPanel
    Left = 0
    Top = 270
    Width = 513
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
    Left = 74
    Top = 24
    Width = 80
    Height = 21
    HelpContext = 1000
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 1
    OnExit = edID_EMPRESAExit
  end
  object btEMPRESA: TBitBtn
    Tag = 50
    Left = 155
    Top = 24
    Width = 21
    Height = 21
    HelpContext = 1001
    TabOrder = 2
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
    Left = 182
    Top = 24
    Width = 331
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 3
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 189
    Width = 513
    Height = 61
    Caption = 'Registro'
    TabOrder = 14
    object lbF_ALTA: TLabel
      Left = 8
      Top = 39
      Width = 51
      Height = 13
      Caption = 'Fecha Alta'
    end
    object lbF_MODIF: TLabel
      Left = 165
      Top = 39
      Width = 73
      Height = 13
      Caption = 'Fecha Modifica'
    end
    object lbUSUA_ALTA: TLabel
      Left = 8
      Top = 18
      Width = 57
      Height = 13
      Caption = 'Usuario Alta'
    end
    object lbUSUA_MODIF: TLabel
      Left = 165
      Top = 18
      Width = 79
      Height = 13
      Caption = 'Usuario Modifica'
    end
    object Label6: TLabel
      Left = 353
      Top = 39
      Width = 62
      Height = 13
      Caption = 'Fecha VoBo.'
    end
    object Label7: TLabel
      Left = 353
      Top = 18
      Width = 68
      Height = 13
      Caption = 'Usuario VoBo.'
      WordWrap = True
    end
    object edF_ALTA: TEdit
      Left = 75
      Top = 35
      Width = 80
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edF_MODIFICA: TEdit
      Left = 260
      Top = 35
      Width = 80
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edCVE_USUA_ALTA: TEdit
      Left = 75
      Top = 14
      Width = 80
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      MaxLength = 8
      ReadOnly = True
      TabOrder = 0
    end
    object edCVE_USUA_MODIF: TEdit
      Left = 260
      Top = 14
      Width = 80
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      MaxLength = 8
      ReadOnly = True
      TabOrder = 2
    end
    object edF_VISTO_BUENO: TEdit
      Left = 427
      Top = 35
      Width = 80
      Height = 21
      HelpContext = 7000
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object edCVE_USU_VOBO: TEdit
      Left = 427
      Top = 14
      Width = 80
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
  end
  object rgSIT_RECEP_DOC: TRadioGroup
    Tag = 18
    Left = 0
    Top = 158
    Width = 513
    Height = 31
    HelpContext = 7000
    Caption = 'Situación'
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Autorizado'
      'Cancelado'
      'Pendiente')
    TabOrder = 13
    OnExit = rgSIT_RECEP_DOCExit
  end
  object edID_TRAMITE: TEdit
    Left = 74
    Top = 45
    Width = 80
    Height = 21
    TabStop = False
    Color = clBtnFace
    MaxLength = 10
    ReadOnly = True
    TabOrder = 4
  end
  object edID_RECEP_DOC: TEdit
    Left = 425
    Top = 3
    Width = 88
    Height = 21
    TabStop = False
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    OnExit = edID_RECEP_DOCExit
    OnKeyPress = edID_RECEP_DOCKeyPress
  end
  object edCVE_DOCUMENTO: TEdit
    Tag = 562
    Left = 74
    Top = 66
    Width = 80
    Height = 21
    HelpContext = 3000
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 6
    OnExit = edCVE_DOCUMENTOExit
  end
  object btDOCUMENTO: TBitBtn
    Tag = 50
    Left = 155
    Top = 66
    Width = 21
    Height = 21
    HelpContext = 3001
    TabOrder = 7
    OnClick = btDOCUMENTOClick
    OnExit = edCVE_DOCUMENTOExit
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
  object edDOCUMENTO: TEdit
    Left = 182
    Top = 66
    Width = 331
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 8
  end
  object edNUM_EXPEDIENTE: TEdit
    Tag = 18
    Left = 257
    Top = 45
    Width = 83
    Height = 21
    HelpContext = 2000
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 5
    OnExit = edNUM_EXPEDIENTEExit
    OnKeyPress = edNUM_EXPEDIENTEKeyPress
  end
  object cbB_ORIGIN_ENTREG: TCheckBox
    Tag = 18
    Left = 74
    Top = 87
    Width = 97
    Height = 25
    HelpContext = 4000
    Caption = 'Entrega Original'
    TabOrder = 9
    OnExit = cbB_ORIGIN_ENTREGExit
  end
  object cbB_COPIAS_ENTREG: TCheckBox
    Tag = 18
    Left = 258
    Top = 91
    Width = 97
    Height = 17
    HelpContext = 5000
    Caption = 'Entrega Copias'
    TabOrder = 10
    OnExit = cbB_COPIAS_ENTREGExit
  end
  object edTXT_OBSERVACION: TMemo
    Tag = 18
    Left = 74
    Top = 108
    Width = 439
    Height = 49
    HelpContext = 6000
    MaxLength = 250
    ScrollBars = ssVertical
    TabOrder = 12
    OnExit = edTXT_OBSERVACIONExit
  end
  object cbxB_VISTO_BUENO: TCheckBox
    Left = 425
    Top = 91
    Width = 83
    Height = 17
    TabStop = False
    Caption = 'VoBo.'
    TabOrder = 11
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
    Left = 420
    Top = 23
  end
  object ilEMPRESA: TInterLinkit
    Control = edID_EMPRESA
    OnEjecuta = ilEMPRESAEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilEMPRESACapture
    Left = 293
    Top = 20
  end
  object ilDocumento: TInterLinkit
    Control = edCVE_DOCUMENTO
    OnEjecuta = ilDocumentoEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilDocumentoCapture
    Left = 293
    Top = 62
  end
end
