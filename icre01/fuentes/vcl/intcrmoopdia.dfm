object WCrMoOpDia: TWCrMoOpDia
  Left = 296
  Top = 83
  Width = 649
  Height = 533
  Caption = 'Monitoreo de Operaciones del Día'
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
  object Label6: TLabel
    Left = 5
    Top = 79
    Width = 100
    Height = 13
    AutoSize = False
    Caption = 'Producto de Crédito'
    WordWrap = True
  end
  object lbCVE_MONEDA: TLabel
    Left = 5
    Top = 57
    Width = 39
    Height = 13
    Caption = 'Moneda'
  end
  object lbPlazoDisp: TLabel
    Left = 1
    Top = 137
    Width = 92
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Plazo de Disp.'
    Color = clInfoBk
    ParentColor = False
  end
  object lbNumDisp: TLabel
    Left = 94
    Top = 137
    Width = 90
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'No. Disposición'
    Color = clInfoBk
    ParentColor = False
  end
  object lbNumAutor: TLabel
    Left = 185
    Top = 137
    Width = 90
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'No. Autorización'
    Color = clInfoBk
    ParentColor = False
  end
  object lbTasaTot: TLabel
    Left = 276
    Top = 137
    Width = 90
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Tasa Total'
    Color = clInfoBk
    ParentColor = False
  end
  object lbImporte: TLabel
    Left = 367
    Top = 137
    Width = 90
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Importe'
    Color = clInfoBk
    ParentColor = False
  end
  object lbDiasxVenc: TLabel
    Left = 458
    Top = 137
    Width = 90
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Días x Vencer'
    Color = clInfoBk
    ParentColor = False
  end
  object lbFVenc: TLabel
    Left = 549
    Top = 137
    Width = 91
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'F. Vencimiento'
    Color = clInfoBk
    ParentColor = False
  end
  object MErrores: TMemo
    Left = 0
    Top = 434
    Width = 641
    Height = 43
    TabStop = False
    Color = clInfoBk
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 14
  end
  object PnDatos: TPanel
    Left = 0
    Top = 478
    Width = 641
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
      Left = 336
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
      Left = 336
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
      Left = 400
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
      Left = 400
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
  object rgTpoMovto: TRadioGroup
    Left = 5
    Top = 97
    Width = 324
    Height = 36
    Caption = 'Tipo de Movimiento'
    Columns = 2
    Items.Strings = (
      'Por Disposición'
      'Por Recuperación')
    TabOrder = 10
    OnClick = rgTpoMovtoClick
  end
  object sgcData: TSGCtrl
    Left = 0
    Top = 156
    Width = 641
    Height = 277
    OnCalcRow = sgcDataCalcRow
    ShowTab = True
    TabOrder = 13
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
  end
  object cbxProducto: TCheckBox
    Left = 610
    Top = 77
    Width = 14
    Height = 17
    TabStop = False
    Enabled = False
    TabOrder = 9
    OnClick = cbxProductoClick
  end
  object edCVE_PRODUCTO_CRE: TEdit
    Tag = 512
    Left = 137
    Top = 75
    Width = 75
    Height = 21
    HelpContext = 1200
    CharCase = ecUpperCase
    TabOrder = 6
  end
  object btPRODUCTO_CRE: TBitBtn
    Left = 214
    Top = 75
    Width = 22
    Height = 21
    HelpContext = 1201
    TabOrder = 7
    OnClick = btPRODUCTO_CREClick
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
  object edDESC_PRODUCTO_CRE: TEdit
    Left = 237
    Top = 75
    Width = 356
    Height = 21
    HelpContext = 3003
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
  end
  object edCVE_MONEDA: TEdit
    Tag = 512
    Left = 137
    Top = 53
    Width = 75
    Height = 21
    HelpContext = 1000
    CharCase = ecUpperCase
    MaxLength = 3
    TabOrder = 2
  end
  object btCVE_MONEDA: TBitBtn
    Tag = 17
    Left = 214
    Top = 53
    Width = 22
    Height = 21
    HelpContext = 1001
    TabOrder = 3
    OnClick = btCVE_MONEDAClick
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
  object edDESC_MONEDA: TEdit
    Left = 237
    Top = 53
    Width = 356
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object cbxMoneda: TCheckBox
    Left = 610
    Top = 55
    Width = 14
    Height = 17
    TabStop = False
    Enabled = False
    TabOrder = 5
    OnClick = cbxMonedaClick
  end
  object btBUSCA: TBitBtn
    Left = 488
    Top = 108
    Width = 153
    Height = 25
    HelpContext = 9001
    Caption = 'Buscar'
    TabOrder = 12
    OnClick = btBUSCAClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 313
    Height = 49
    Caption = 'INICIO'
    TabOrder = 0
    object Label17: TLabel
      Left = 14
      Top = 20
      Width = 23
      Height = 14
      Caption = 'Hora'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 106
      Top = 19
      Width = 31
      Height = 14
      Caption = 'Minuto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 206
      Top = 19
      Width = 43
      Height = 14
      Caption = 'Segundo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object edHoraIni: TEdit
      Left = 48
      Top = 16
      Width = 41
      Height = 21
      MaxLength = 2
      TabOrder = 0
      OnKeyPress = edHoraIniKeyPress
    end
    object edMinIni: TEdit
      Left = 148
      Top = 16
      Width = 41
      Height = 21
      MaxLength = 2
      TabOrder = 1
      OnKeyPress = edHoraIniKeyPress
    end
    object edSegIni: TEdit
      Left = 256
      Top = 16
      Width = 41
      Height = 21
      MaxLength = 2
      TabOrder = 2
      OnKeyPress = edHoraIniKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 328
    Top = 0
    Width = 313
    Height = 49
    Caption = 'FIN'
    TabOrder = 1
    object Label3: TLabel
      Left = 14
      Top = 20
      Width = 23
      Height = 14
      Caption = 'Hora'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 106
      Top = 19
      Width = 31
      Height = 14
      Caption = 'Minuto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 206
      Top = 19
      Width = 43
      Height = 14
      Caption = 'Segundo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object edHoraFin: TEdit
      Left = 48
      Top = 16
      Width = 41
      Height = 21
      MaxLength = 2
      TabOrder = 0
      OnKeyPress = edHoraIniKeyPress
    end
    object edMinFin: TEdit
      Left = 148
      Top = 16
      Width = 41
      Height = 21
      MaxLength = 2
      TabOrder = 1
      OnKeyPress = edHoraIniKeyPress
    end
    object edSegFin: TEdit
      Left = 256
      Top = 16
      Width = 41
      Height = 21
      MaxLength = 2
      TabOrder = 2
      OnKeyPress = edHoraIniKeyPress
    end
  end
  object cbxDetalle: TCheckBox
    Left = 352
    Top = 112
    Width = 113
    Height = 17
    Caption = 'Presenta Detalle'
    TabOrder = 11
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
    OnDespuesShow = InterForma1DespuesShow
    Left = 66
    Top = 218
  end
  object ilPRODUCTO_CRE: TInterLinkit
    Control = edCVE_PRODUCTO_CRE
    OnEjecuta = ilPRODUCTO_CREEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilPRODUCTO_CRECapture
    Left = 321
    Top = 71
  end
  object ilMONEDA: TInterLinkit
    Control = edCVE_MONEDA
    OnEjecuta = ilMONEDAEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    OnCapture = ilMONEDACapture
    Left = 353
    Top = 49
  end
end
