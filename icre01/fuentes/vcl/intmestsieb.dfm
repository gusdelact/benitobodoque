object wMEstSieb: TwMEstSieb
  Left = 194
  Top = 130
  Width = 573
  Height = 323
  Caption = 'Captura de Estímulo SIEBAN por Autorización'
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
  object lbID_CONTRATO: TLabel
    Left = 0
    Top = 56
    Width = 112
    Height = 13
    Caption = 'Autorización / Producto'
  end
  object Label1: TLabel
    Left = 0
    Top = 74
    Width = 113
    Height = 25
    AutoSize = False
    Caption = 'Porcentaje de SIEBAN Estimado'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 0
    Top = 98
    Width = 113
    Height = 26
    AutoSize = False
    Caption = 'Porcentaje máximo a compartir'
    WordWrap = True
  end
  object Label27: TLabel
    Left = 0
    Top = 129
    Width = 58
    Height = 13
    Caption = 'Comentarios'
  end
  object Label3: TLabel
    Left = 204
    Top = 105
    Width = 91
    Height = 13
    Caption = 'Porcentaje INICIAL'
  end
  object Label4: TLabel
    Left = 393
    Top = 105
    Width = 84
    Height = 13
    Caption = 'Porcentaje FINAL'
  end
  object lbUSUA_MODIF: TLabel
    Left = 305
    Top = 211
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object lbUSUA_ALTA: TLabel
    Left = 24
    Top = 211
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object lbF_MODIF: TLabel
    Left = 305
    Top = 232
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object lbF_ALTA: TLabel
    Left = 24
    Top = 232
    Width = 51
    Height = 13
    Caption = 'Fecha Alta'
  end
  object PnlMsg: TPanel
    Left = 0
    Top = 253
    Width = 561
    Height = 21
    TabOrder = 14
  end
  object PnDatos: TPanel
    Left = 0
    Top = 274
    Width = 561
    Height = 21
    TabOrder = 15
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
  object icpCONTRATO: TInterCtoPanel
    Tag = 50
    Left = 0
    Top = 0
    Width = 505
    Height = 45
    Hint = 'Información del Contrato'
    Lenguaje = 0
    ShowLenguaje = False
    ShowEnviarEMail = False
  end
  object edID_CONTRATO: TInterEdit
    Tag = 562
    Left = 120
    Top = 52
    Width = 80
    Height = 21
    HelpContext = 1000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trContrato
    OnExit = edID_CONTRATOExit
    MaxLength = 10
    Color = clInfoBk
    TabOrder = 0
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object btID_CONTRATO: TBitBtn
    Tag = 50
    Left = 200
    Top = 52
    Width = 21
    Height = 21
    HelpContext = 1001
    TabOrder = 1
    OnClick = btID_CONTRATOClick
    OnExit = edID_CONTRATOExit
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
  object edCVE_PRODUCTO: TEdit
    Left = 226
    Top = 52
    Width = 60
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object edDESC_PRODUCTO: TEdit
    Left = 288
    Top = 52
    Width = 275
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
  end
  object rgSIT_REL_CTO_SIE: TRadioGroup
    Left = 0
    Top = 166
    Width = 561
    Height = 36
    HelpContext = 7000
    Caption = 'Situación de Estímulo SIEBAN'
    Columns = 2
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Inactivo')
    TabOrder = 9
    OnExit = rgSIT_REL_CTO_SIEExit
  end
  object edPCT_COMPARTIR_TOT: TInterEdit
    Tag = 18
    Left = 120
    Top = 101
    Width = 80
    Height = 21
    HelpContext = 3000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_COMPARTIR_TOTExit
    OnChange = edPCT_COMPARTIR_TOTChange
    DisplayMask = '###,##0.0000'
    MaxLength = 8
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
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
  object edTXT_COMENTARIO: TMemo
    Tag = 18
    Left = 120
    Top = 129
    Width = 441
    Height = 36
    HelpContext = 6000
    Color = clWhite
    MaxLength = 255
    TabOrder = 8
    OnExit = edTXT_COMENTARIOExit
  end
  object edPCT_COMPARTIR_IN: TInterEdit
    Tag = 18
    Left = 305
    Top = 101
    Width = 80
    Height = 21
    HelpContext = 4000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_COMPARTIR_INExit
    DisplayMask = '###,##0.0000'
    MaxLength = 8
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
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
  object edPCT_COMPARTIR_FI: TInterEdit
    Tag = 18
    Left = 485
    Top = 101
    Width = 80
    Height = 21
    HelpContext = 5000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_COMPARTIR_FIExit
    DisplayMask = '###,##0.0000'
    MaxLength = 8
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 7
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edCVE_USUA_MODIF: TEdit
    Left = 451
    Top = 207
    Width = 110
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 11
  end
  object edCVE_USUA_ALTA: TEdit
    Left = 120
    Top = 207
    Width = 110
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
  end
  object edF_MODIFICA: TEdit
    Left = 451
    Top = 228
    Width = 110
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 13
  end
  object edF_ALTA: TEdit
    Left = 120
    Top = 228
    Width = 110
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 12
  end
  object edPCT_ESTIMADO: TInterEdit
    Tag = 18
    Left = 120
    Top = 76
    Width = 80
    Height = 21
    HelpContext = 2000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_ESTIMADOExit
    DisplayMask = '###,##0.0000'
    MaxLength = 8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 4
    UseReType = True
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object gbFOLIO: TGroupBox
    Left = 512
    Top = -1
    Width = 49
    Height = 46
    HelpContext = 1101
    Caption = 'Folio '
    TabOrder = 17
    object lbID_SOLICITUD: TLabel
      Tag = 50
      Left = 3
      Top = 18
      Width = 42
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
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
    OnBtnModificarClick = InterForma1BtnModificarClick
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    OnDespuesShow = InterForma1DespuesShow
    Left = 419
    Top = 5
  end
  object ilID_CONTRATO: TInterLinkit
    Control = edID_CONTRATO
    OnEjecuta = ilID_CONTRATOEjecuta
    TipoReader = trContrato
    CharCase = ecUpperCase
    OnCapture = ilID_CONTRATOCapture
    Left = 342
    Top = 49
  end
end
