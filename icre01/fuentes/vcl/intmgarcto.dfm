object wMGarCto: TwMGarCto
  Left = 342
  Top = 198
  Width = 508
  Height = 348
  Caption = 'Garantías por Autorización'
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
  object shp4: TShape
    Left = 1
    Top = 58
    Width = 74
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label1: TLabel
    Left = 4
    Top = 61
    Width = 68
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Autorización'
    Color = clInfoBk
    ParentColor = False
  end
  object Shape6: TShape
    Left = 197
    Top = 58
    Width = 171
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label9: TLabel
    Left = 201
    Top = 61
    Width = 163
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Descripción Producto'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 0
    Top = 8
    Width = 74
    Height = 13
    Caption = 'No.de Garantía'
  end
  object Shape4: TShape
    Left = 74
    Top = 58
    Width = 51
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label6: TLabel
    Left = 78
    Top = 61
    Width = 43
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Folio'
    Color = clInfoBk
    ParentColor = False
  end
  object Shape7: TShape
    Left = 367
    Top = 58
    Width = 74
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label8: TLabel
    Left = 371
    Top = 61
    Width = 66
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'F.Vencimiento'
    Color = clInfoBk
    ParentColor = False
  end
  object Shape9: TShape
    Left = 440
    Top = 58
    Width = 54
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label11: TLabel
    Left = 444
    Top = 61
    Width = 46
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Sit. Cto.'
    Color = clInfoBk
    ParentColor = False
  end
  object Label12: TLabel
    Left = 0
    Top = 273
    Width = 72
    Height = 13
    Caption = 'Usuario de Alta'
  end
  object Label13: TLabel
    Left = 291
    Top = 273
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object Shape1: TShape
    Left = 124
    Top = 58
    Width = 74
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label2: TLabel
    Left = 127
    Top = 61
    Width = 68
    Height = 12
    Alignment = taCenter
    AutoSize = False
    Caption = 'Clave'
    Color = clInfoBk
    ParentColor = False
  end
  object Label3: TLabel
    Left = 0
    Top = 252
    Width = 58
    Height = 13
    Caption = 'Autorización'
  end
  object sgcDATA: TSGCtrl
    Left = 0
    Top = 76
    Width = 495
    Height = 167
    ShowTab = True
    TabOrder = 5
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnMoveRow = sgcDATAMoveRow
    object btEliminar: TBitBtn
      Left = 368
      Top = 143
      Width = 126
      Height = 20
      Caption = 'Eliminar Autorización'
      TabOrder = 2
      OnClick = btEliminarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btContrato: TBitBtn
      Left = 242
      Top = 143
      Width = 124
      Height = 20
      Caption = 'Agrega Autorización'
      TabOrder = 3
      OnClick = btContratoClick
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
  end
  object PnDatos: TPanel
    Left = -2
    Top = 291
    Width = 497
    Height = 21
    TabOrder = 7
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
      Left = 283
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
      Left = 283
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
      Left = 347
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
      Left = 347
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
  object edID_SOLICITUD: TEdit
    Tag = 512
    Left = 76
    Top = 4
    Width = 80
    Height = 21
    TabOrder = 0
  end
  object edDESC_ID_SOLICITUD: TEdit
    Tag = 5
    Left = 189
    Top = 4
    Width = 306
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object btID_SOLICITUD: TBitBtn
    Tag = 17
    Left = 163
    Top = 4
    Width = 21
    Height = 21
    HelpContext = 1101
    TabOrder = 1
    OnClick = btID_SOLICITUDClick
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
  object edCVE_GARANTIA: TEdit
    Left = 76
    Top = 25
    Width = 80
    Height = 21
    Hint = 'Tipo de Garantía'
    HelpContext = 1100
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 6
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
  end
  object edNOM_CVE_GARANTIA: TEdit
    Left = 162
    Top = 25
    Width = 333
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 4
  end
  object edID_CONTRATO: TInterEdit
    Left = 80
    Top = 248
    Width = 121
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trContrato
    MaxLength = 10
    Color = clBtnFace
    TabOrder = 6
    ReadOnly = True
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edF_ALTA: TEdit
    Left = 368
    Top = 269
    Width = 121
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
  end
  object edCVE_USU_ALTA: TEdit
    Left = 80
    Top = 269
    Width = 121
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 9
  end
  object InterForma1: TInterForma
    IsMain = True
    OnBuscar = InterForma1Buscar
    msgSinRegistros = 'No existe un Registro para realizar la operación.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = '¿Desea Eliminar el Registro Actual?'
    FormaEstilo = feHorizontal
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
    Left = 282
    Top = 65528
  end
  object ilID_SOLICITUD: TInterLinkit
    Control = edID_SOLICITUD
    OnEjecuta = ilID_SOLICITUDEjecuta
    TipoReader = trEntero
    CharCase = ecNormal
    OnCapture = ilID_SOLICITUDCapture
    Left = 181
  end
end
