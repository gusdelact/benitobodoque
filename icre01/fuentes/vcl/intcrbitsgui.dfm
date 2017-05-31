object WCrBitSeguimient: TWCrBitSeguimient
  Left = 150
  Top = 87
  Width = 541
  Height = 401
  Caption = 'Bitácora de Seguimiento'
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
  object lbF_COBRANZA: TLabel
    Left = 8
    Top = 10
    Width = 78
    Height = 13
    Caption = 'Fecha Cobranza'
  end
  object lbID_SEGUIMIENTO: TLabel
    Left = 336
    Top = 10
    Width = 70
    Height = 13
    Caption = 'Id Seguimiento'
  end
  object lbID_CREDITO: TLabel
    Left = 8
    Top = 41
    Width = 33
    Height = 13
    Caption = 'Crédito'
  end
  object lbCVE_SEGUIMIENTO: TLabel
    Left = 8
    Top = 67
    Width = 80
    Height = 13
    Caption = 'Cve Seguimiento'
  end
  object lbID_GRUPO_PAGO: TLabel
    Left = 8
    Top = 93
    Width = 57
    Height = 13
    Caption = 'Grupo Pago'
  end
  object lbIMP_TOTAL: TLabel
    Left = 8
    Top = 119
    Width = 62
    Height = 13
    Caption = 'Importe Total'
  end
  object lbID_FOLIO_TESO: TLabel
    Left = 8
    Top = 147
    Width = 49
    Height = 13
    Caption = 'Folio Teso'
  end
  object lbID_FOLIO_DV: TLabel
    Left = 336
    Top = 147
    Width = 94
    Height = 13
    Caption = 'Folio Dep. a la Vista'
  end
  object lbREF_EXTERNA: TLabel
    Left = 8
    Top = 174
    Width = 59
    Height = 13
    Caption = 'Ref. Externa'
  end
  object lbTX_DESC_INSTRUC: TLabel
    Left = 8
    Top = 201
    Width = 56
    Height = 13
    Caption = 'Descripción'
  end
  object lbID_COD_RESP: TLabel
    Left = 8
    Top = 229
    Width = 64
    Height = 13
    Caption = 'Código Resp.'
  end
  object dtpF_COBRANZA: TInterDateTimePicker
    Tag = 50
    Left = 186
    Top = 10
    Width = 21
    Height = 21
    HelpContext = 1002
    CalAlignment = dtaLeft
    Date = 37832.6958196528
    Time = 37832.6958196528
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
    OnExit = edF_COBRANZAExit
    Edit = edF_COBRANZA
    Formato = dfDate
  end
  object edF_COBRANZA: TEdit
    Tag = 50
    Left = 96
    Top = 10
    Width = 89
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    TabOrder = 0
    OnExit = edF_COBRANZAExit
  end
  object edID_SEGUIMIENTO: TEdit
    Left = 440
    Top = 10
    Width = 89
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 10
    ReadOnly = True
    TabOrder = 2
    OnExit = edID_SEGUIMIENTOExit
  end
  object edID_CREDITO: TEdit
    Tag = 530
    Left = 96
    Top = 37
    Width = 89
    Height = 21
    HelpContext = 3001
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 3
    OnExit = edID_CREDITOExit
  end
  object rgCVE_TIPO_PAGO: TRadioGroup
    Tag = 18
    Left = 192
    Top = 88
    Width = 337
    Height = 47
    HelpContext = 5201
    Caption = 'Tipo Pago'
    Columns = 3
    Items.Strings = (
      'Programado '
      'Anticipado'
      'Impagado')
    TabOrder = 10
    OnExit = rgCVE_TIPO_PAGOExit
  end
  object edCVE_SEGUIMIENTO: TEdit
    Tag = 530
    Left = 96
    Top = 63
    Width = 89
    Height = 21
    HelpContext = 4001
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 6
    OnExit = edCVE_SEGUIMIENTOExit
  end
  object edID_GRUPO_PAGO: TEdit
    Left = 96
    Top = 89
    Width = 89
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clMenu
    MaxLength = 10
    ReadOnly = True
    TabOrder = 9
    OnExit = edID_GRUPO_PAGOExit
  end
  object IedIMP_TOTAL: TInterEdit
    Tag = 18
    Left = 96
    Top = 115
    Width = 89
    Height = 21
    HelpContext = 5101
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = IedIMP_TOTALExit
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 12
    TabOrder = 11
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edID_FOLIO_TESO: TEdit
    Left = 96
    Top = 143
    Width = 89
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 10
    ReadOnly = True
    TabOrder = 12
    OnExit = edID_FOLIO_TESOExit
  end
  object edID_FOLIO_DV: TEdit
    Left = 440
    Top = 143
    Width = 89
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 10
    ReadOnly = True
    TabOrder = 13
  end
  object edREF_EXTERNA: TEdit
    Tag = 18
    Left = 96
    Top = 170
    Width = 433
    Height = 21
    HelpContext = 7001
    CharCase = ecUpperCase
    MaxLength = 20
    TabOrder = 14
    OnExit = edREF_EXTERNAExit
  end
  object edTX_DESC_INSTRUC: TEdit
    Tag = 18
    Left = 96
    Top = 197
    Width = 433
    Height = 21
    HelpContext = 7501
    CharCase = ecUpperCase
    MaxLength = 250
    TabOrder = 15
    OnExit = edTX_DESC_INSTRUCExit
  end
  object edID_COD_RESP: TEdit
    Tag = 18
    Left = 96
    Top = 225
    Width = 89
    Height = 21
    HelpContext = 8001
    CharCase = ecUpperCase
    MaxLength = 4
    TabOrder = 16
    OnExit = edID_COD_RESPExit
  end
  object rgSIT_SEGUIMIENTO: TRadioGroup
    Tag = 18
    Left = 192
    Top = 219
    Width = 337
    Height = 34
    HelpContext = 9001
    Caption = 'Situación Seguimiento'
    Columns = 3
    Items.Strings = (
      'Identificado'
      'No Identificado'
      'Cancelado')
    TabOrder = 17
    OnExit = rgSIT_SEGUIMIENTOExit
  end
  object btCREDITO: TBitBtn
    Tag = 18
    Left = 188
    Top = 36
    Width = 25
    Height = 22
    HelpContext = 3002
    TabOrder = 4
    OnClick = btCREDITOClick
    OnExit = edID_CREDITOExit
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
  object edNOM_ACREDITADO: TEdit
    Left = 216
    Top = 37
    Width = 315
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object btCVE_SEGUIMIENTO: TBitBtn
    Tag = 18
    Left = 188
    Top = 62
    Width = 25
    Height = 22
    HelpContext = 4002
    TabOrder = 7
    OnClick = btCVE_SEGUIMIENTOClick
    OnExit = edCVE_SEGUIMIENTOExit
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
  object edDESC_SEGUIMIENTO: TEdit
    Left = 216
    Top = 63
    Width = 315
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
  end
  object MsgPanel: TPanel
    Left = 0
    Top = 320
    Width = 532
    Height = 25
    TabOrder = 18
  end
  object PnDatos: TPanel
    Left = 0
    Top = 345
    Width = 532
    Height = 21
    TabOrder = 19
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
  object GroupBox4: TGroupBox
    Left = 2
    Top = 256
    Width = 527
    Height = 59
    Caption = 'Registro'
    TabOrder = 20
    object lbF_ALTA: TLabel
      Left = 8
      Top = 38
      Width = 66
      Height = 13
      Caption = 'Fecha de Alta'
    end
    object lbF_MODIF: TLabel
      Left = 182
      Top = 37
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
      Left = 182
      Top = 15
      Width = 79
      Height = 13
      Caption = 'Usuario Modifica'
    end
    object lbUSUA_AUTOR: TLabel
      Left = 368
      Top = 15
      Width = 77
      Height = 13
      Caption = 'Usuario Autoriza'
    end
    object lbF_AUTOR: TLabel
      Left = 368
      Top = 37
      Width = 71
      Height = 13
      Caption = 'Fecha Autoriza'
    end
    object edF_ALTA: TEdit
      Left = 82
      Top = 34
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edF_MODIF: TEdit
      Left = 272
      Top = 33
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edCVE_USUA_ALTA: TEdit
      Left = 82
      Top = 12
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edCVE_USUA_MODIF: TEdit
      Left = 272
      Top = 11
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object edCVE_USUA_AUTOR: TEdit
      Left = 450
      Top = 11
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edF_AUTOR: TEdit
      Left = 450
      Top = 33
      Width = 71
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
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
    Left = 306
    Top = 2
  end
  object ilCREDITO: TInterLinkit
    Control = edID_CREDITO
    OnEjecuta = ilCREDITOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCREDITOCapture
    Left = 224
    Top = 32
  end
  object ilSEGUIMIENTO: TInterLinkit
    Control = edCVE_SEGUIMIENTO
    OnEjecuta = ilSEGUIMIENTOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilSEGUIMIENTOCapture
    Left = 224
    Top = 64
  end
end
