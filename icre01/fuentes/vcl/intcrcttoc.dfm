object WCrcttoc: TWCrcttoc
  Left = 396
  Top = 126
  Width = 587
  Height = 345
  Caption = 'Catálogo de Contrato'
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
  object lbTITULAR: TLabel
    Left = 8
    Top = 11
    Width = 29
    Height = 13
    Caption = 'Titular'
  end
  object lbCONTRATO: TLabel
    Left = 8
    Top = 36
    Width = 108
    Height = 13
    Caption = 'Nombre del Acreditado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbDOMICILIO: TLabel
    Left = 8
    Top = 61
    Width = 42
    Height = 13
    Caption = 'Domicilio'
  end
  object lbPROMOTOR: TLabel
    Left = 10
    Top = 86
    Width = 89
    Height = 13
    Caption = 'Promotor Asociado'
  end
  object lbGRUPO: TLabel
    Left = 11
    Top = 134
    Width = 29
    Height = 13
    Caption = 'Grupo'
  end
  object lbTIPOCTA: TLabel
    Left = 8
    Top = 183
    Width = 73
    Height = 13
    Caption = 'Tipo de Cuenta'
  end
  object lbCORRESPONDENCIA: TLabel
    Left = 296
    Top = 183
    Width = 80
    Height = 13
    Caption = 'Correspondencia'
  end
  object lbUNNEGOCIO: TLabel
    Left = 10
    Top = 156
    Width = 97
    Height = 14
    AutoSize = False
    Caption = 'Unidad de Negocio'
    WordWrap = True
  end
  object Label1: TLabel
    Left = 10
    Top = 110
    Width = 108
    Height = 13
    Caption = 'Promotor Administrador'
  end
  object edID_TITULAR: TEdit
    Left = 120
    Top = 7
    Width = 65
    Height = 21
    Hint = 'Click derecho para Catálogo'
    TabStop = False
    AutoSize = False
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 4
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
  end
  object edNOMBRE_TITULAR: TEdit
    Left = 192
    Top = 7
    Width = 385
    Height = 21
    Hint = 'Click derecho para Catálogo'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
  end
  object edNOMBRE_CONTRATO: TEdit
    Tag = 18
    Left = 120
    Top = 32
    Width = 457
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 80
    TabOrder = 2
    OnExit = edNOMBRE_CONTRATOExit
  end
  object edID_DOMICILIO: TEdit
    Tag = 530
    Left = 120
    Top = 57
    Width = 65
    Height = 21
    Hint = 'Click derecho para Catálogo'
    HelpContext = 2001
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
    OnExit = edID_DOMICILIOExit
  end
  object edCALLE_NUMERO: TEdit
    Left = 216
    Top = 57
    Width = 361
    Height = 21
    Hint = 'Click derecho para Catálogo'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 5
  end
  object edNOMBRE_PROMOTOR: TEdit
    Left = 216
    Top = 82
    Width = 361
    Height = 21
    Hint = 'Click derecho para Catálogo'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 8
  end
  object edID_PROMOTOR: TEdit
    Left = 120
    Top = 82
    Width = 65
    Height = 21
    Hint = 'Click derecho para Catálogo'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object cbTIPO_CUENTA: TComboBox
    Tag = 18
    Left = 120
    Top = 179
    Width = 153
    Height = 21
    HelpContext = 4001
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 12
    OnExit = cbTIPO_CUENTAExit
  end
  object cbCORRESPONDENCIA: TComboBox
    Tag = 18
    Left = 408
    Top = 179
    Width = 169
    Height = 21
    HelpContext = 5001
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 13
    OnExit = cbCORRESPONDENCIAExit
  end
  object edDESC_UNNEGOCIO: TEdit
    Left = 191
    Top = 153
    Width = 386
    Height = 21
    Hint = 'Click derecho para Catálogo'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object edUNIDAD_NEGOCIO: TEdit
    Left = 120
    Top = 153
    Width = 65
    Height = 21
    Hint = 'Click derecho para Catálogo'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnExit = edUNIDAD_NEGOCIOExit
  end
  object edNOMBRE_GRUPO: TEdit
    Left = 120
    Top = 130
    Width = 457
    Height = 21
    Hint = 'Click derecho para Catálogo'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 9
  end
  object rgREGISTRO: TGroupBox
    Left = 2
    Top = 204
    Width = 574
    Height = 59
    Caption = 'Registro'
    TabOrder = 14
    object Label10: TLabel
      Left = 8
      Top = 38
      Width = 66
      Height = 13
      Caption = 'Fecha de Alta'
    end
    object Label19: TLabel
      Left = 192
      Top = 37
      Width = 73
      Height = 13
      Caption = 'Fecha Modifica'
    end
    object Label20: TLabel
      Left = 8
      Top = 16
      Width = 57
      Height = 13
      Caption = 'Usuario Alta'
    end
    object Label21: TLabel
      Left = 192
      Top = 15
      Width = 79
      Height = 13
      Caption = 'Usuario Modifica'
    end
    object Label28: TLabel
      Left = 389
      Top = 15
      Width = 78
      Height = 13
      Caption = 'Usuario Cancela'
    end
    object Label17: TLabel
      Left = 389
      Top = 37
      Width = 92
      Height = 13
      Caption = 'Fecha Cancelación'
    end
    object edF_ALTA: TEdit
      Left = 82
      Top = 34
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      TabOrder = 3
    end
    object edF_MODIF: TEdit
      Left = 282
      Top = 33
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      TabOrder = 4
    end
    object edUSU_ALTA: TEdit
      Left = 82
      Top = 12
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      TabOrder = 0
    end
    object edUSU_MODIF: TEdit
      Left = 282
      Top = 11
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      TabOrder = 1
    end
    object edUSU_CANCELA: TEdit
      Left = 495
      Top = 11
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      TabOrder = 2
    end
    object edF_CANCELA: TEdit
      Left = 495
      Top = 33
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      TabOrder = 5
    end
  end
  object MsgPanel: TPanel
    Left = 2
    Top = 264
    Width = 574
    Height = 25
    TabOrder = 15
  end
  object PnDatos: TPanel
    Left = 2
    Top = 289
    Width = 574
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
  object btDOMICILIO: TBitBtn
    Tag = 18
    Left = 190
    Top = 57
    Width = 22
    Height = 20
    HelpContext = 2002
    TabOrder = 4
    OnClick = btDOMICILIOClick
    OnExit = edID_DOMICILIOExit
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
  object btPROMOTOR: TBitBtn
    Tag = 18
    Left = 190
    Top = 82
    Width = 22
    Height = 20
    HelpContext = 3002
    TabOrder = 7
    OnClick = btPROMOTORClick
    OnExit = edID_PROMOTORExit
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
  object edID_PROM_ADM: TEdit
    Left = 120
    Top = 106
    Width = 65
    Height = 21
    Hint = 'Click derecho para Catálogo'
    TabStop = False
    AutoSize = False
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 4
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 17
  end
  object edNAME_PROM_ADM: TEdit
    Left = 192
    Top = 106
    Width = 385
    Height = 21
    Hint = 'Click derecho para Catálogo'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 18
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
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
    Left = 402
    Top = 10
  end
  object ilDOMICILIO: TInterLinkit
    Control = edID_DOMICILIO
    OnEjecuta = ilDOMICILIOEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    OnCapture = ilDOMICILIOCapture
    Left = 224
    Top = 54
  end
end
