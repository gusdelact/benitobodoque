object WSolFEGAcorrecio: TWSolFEGAcorrecio
  Left = 280
  Top = 219
  Width = 635
  Height = 374
  Caption = 'Solicitud Garantía FEGA (Gtia. Liq Cero)'
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
  object lbID_CREDITO: TLabel
    Left = 5
    Top = 34
    Width = 74
    Height = 13
    Caption = 'No. Disposición'
  end
  object lbIMP_SOLICITAR: TLabel
    Left = 5
    Top = 237
    Width = 84
    Height = 13
    Caption = 'Importe a Solicitar'
  end
  object lbID_SOLICITUD: TLabel
    Left = 438
    Top = 8
    Width = 74
    Height = 13
    Caption = 'Folio Sol. FEGA'
  end
  object Label4: TLabel
    Left = 7
    Top = 54
    Width = 65
    Height = 26
    Alignment = taCenter
    AutoSize = False
    Caption = 'No. Periodo de Capital'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label1: TLabel
    Left = 74
    Top = 54
    Width = 64
    Height = 26
    Alignment = taCenter
    AutoSize = False
    Caption = 'Fecha Vencimiento'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 140
    Top = 54
    Width = 64
    Height = 26
    Alignment = taCenter
    AutoSize = False
    Caption = 'Situación del Periodo'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label3: TLabel
    Left = 206
    Top = 54
    Width = 72
    Height = 26
    Alignment = taCenter
    AutoSize = False
    Caption = 'No. Soliciitud'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label5: TLabel
    Left = 280
    Top = 54
    Width = 76
    Height = 26
    Alignment = taCenter
    AutoSize = False
    Caption = 'Imp. Solicitar'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label6: TLabel
    Left = 358
    Top = 54
    Width = 76
    Height = 26
    Alignment = taCenter
    AutoSize = False
    Caption = 'Imp. Aplicado'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label7: TLabel
    Left = 509
    Top = 54
    Width = 93
    Height = 26
    Alignment = taCenter
    AutoSize = False
    Caption = 'Situación Solicitud FEGA'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label8: TLabel
    Left = 435
    Top = 54
    Width = 72
    Height = 26
    Alignment = taCenter
    AutoSize = False
    Caption = 'Fecha Solicitud'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object lbF_SOLICITUD: TLabel
    Left = 4
    Top = 9
    Width = 88
    Height = 13
    Caption = 'Fecha de Solicitud'
  end
  object PnDatos: TPanel
    Left = -1
    Top = 306
    Width = 608
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
      Left = 296
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
      Left = 296
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
      Left = 360
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
      Left = 360
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
  object edID_CREDITO: TEdit
    Tag = 512
    Left = 96
    Top = 29
    Width = 76
    Height = 21
    HelpContext = 1000
    CharCase = ecUpperCase
    TabOrder = 2
    OnExit = edID_CREDITOExit
  end
  object btID_CREDITO: TBitBtn
    Tag = 512
    Left = 173
    Top = 30
    Width = 21
    Height = 21
    HelpContext = 1001
    TabOrder = 3
    OnClick = btID_CREDITOClick
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
    Left = 193
    Top = 30
    Width = 411
    Height = 21
    HelpContext = 3003
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
  end
  object edIMP_SOLICITAR: TInterEdit
    Tag = 512
    Left = 96
    Top = 233
    Width = 108
    Height = 21
    HelpContext = 1200
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_SOLICITARExit
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 5
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edID_SOLICITUD: TInterEdit
    Left = 514
    Top = 5
    Width = 91
    Height = 21
    HelpContext = 1201
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,###,###'
    MaxLength = 12
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 9
    ReadOnly = True
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object cbB_OBLIGA_SOL: TCheckBox
    Tag = 512
    Left = 226
    Top = 236
    Width = 376
    Height = 17
    HelpContext = 1300
    Caption = 
      'Realiza Solicitud FEGA sin Previa Aplicación de Solicitud Garant' +
      'ía Liquida.'
    Enabled = False
    TabOrder = 6
    OnExit = cbB_OBLIGA_SOLExit
  end
  object btnGenera: TButton
    Tag = 512
    Left = 387
    Top = 257
    Width = 217
    Height = 25
    HelpContext = 1400
    Caption = '< Generar Solicitud FEGA >'
    Enabled = False
    TabOrder = 7
    OnClick = btnGeneraClick
    OnExit = btnGeneraExit
  end
  object MsgPanel: TPanel
    Left = -1
    Top = 283
    Width = 608
    Height = 21
    TabOrder = 11
  end
  object sgcDATA: TSGCtrl
    Tag = 512
    Left = 3
    Top = 81
    Width = 601
    Height = 152
    HelpContext = 1100
    ShowTab = True
    TabOrder = 4
    OnExit = sgcDATAExit
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
  end
  object edF_SOLICITUD: TEdit
    Left = 96
    Top = 4
    Width = 80
    Height = 21
    HelpContext = 5000
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 0
  end
  object btF_SOLICITUD: TInterDateTimePicker
    Left = 174
    Top = 4
    Width = 21
    Height = 22
    CalAlignment = dtaLeft
    Date = 38196.3921868981
    Time = 38196.3921868981
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
    TabStop = False
    Edit = edF_SOLICITUD
    Formato = dfDate
  end
  object InterForma1: TInterForma
    IsMain = True
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
    Left = 575
    Top = 295
  end
  object ilID_CREDITO: TInterLinkit
    Control = edID_CREDITO
    OnEjecuta = ilID_CREDITOEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    OnCapture = ilID_CREDITOCapture
    Left = 270
    Top = 18
  end
end
