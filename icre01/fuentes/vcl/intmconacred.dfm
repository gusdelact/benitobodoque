object wMConAcred: TwMConAcred
  Left = 177
  Top = 186
  Width = 788
  Height = 316
  Caption = 'Garantías por Acreditado'
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
    Width = 48
    Height = 18
    Brush.Color = clInfoBk
  end
  object Shape5: TShape
    Left = 292
    Top = 58
    Width = 74
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label1: TLabel
    Left = 4
    Top = 61
    Width = 42
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'No.Gtía.'
    Color = clInfoBk
    ParentColor = False
  end
  object Label7: TLabel
    Left = 295
    Top = 61
    Width = 69
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Valor Garantía'
    Color = clInfoBk
    ParentColor = False
  end
  object Shape6: TShape
    Left = 98
    Top = 58
    Width = 122
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label9: TLabel
    Left = 102
    Top = 61
    Width = 114
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Garantía'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 0
    Top = 8
    Width = 66
    Height = 13
    Caption = 'Id. Acreditado'
  end
  object Shape2: TShape
    Left = 365
    Top = 58
    Width = 74
    Height = 18
    Brush.Color = clInfoBk
  end
  object Shape3: TShape
    Left = 438
    Top = 58
    Width = 62
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label2: TLabel
    Left = 369
    Top = 61
    Width = 66
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Disponible'
    Color = clInfoBk
    ParentColor = False
  end
  object Label4: TLabel
    Left = 441
    Top = 61
    Width = 56
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'F.Ven.Dis'
    Color = clInfoBk
    ParentColor = False
  end
  object Shape12: TShape
    Left = 499
    Top = 58
    Width = 62
    Height = 18
    Brush.Color = clInfoBk
  end
  object Shape13: TShape
    Left = 645
    Top = 78
    Width = 93
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label22: TLabel
    Left = 503
    Top = 61
    Width = 54
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Disposición'
    Color = clInfoBk
    ParentColor = False
  end
  object Label23: TLabel
    Left = 649
    Top = 80
    Width = 86
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Disponible'
    Color = clInfoBk
    ParentColor = False
  end
  object Shape4: TShape
    Left = 48
    Top = 58
    Width = 51
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label6: TLabel
    Left = 52
    Top = 61
    Width = 43
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Clave'
    Color = clInfoBk
    ParentColor = False
  end
  object Shape7: TShape
    Left = 219
    Top = 58
    Width = 74
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label8: TLabel
    Left = 223
    Top = 61
    Width = 66
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'No. FIRA'
    Color = clInfoBk
    ParentColor = False
  end
  object Shape1: TShape
    Left = 560
    Top = 58
    Width = 74
    Height = 18
    Brush.Color = clInfoBk
  end
  object Shape8: TShape
    Left = 633
    Top = 58
    Width = 74
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label3: TLabel
    Left = 564
    Top = 61
    Width = 66
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Crédito'
    Color = clInfoBk
    ParentColor = False
  end
  object Label10: TLabel
    Left = 636
    Top = 61
    Width = 68
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Valor Aplicado'
    Color = clInfoBk
    ParentColor = False
  end
  object Shape9: TShape
    Left = 706
    Top = 58
    Width = 54
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label11: TLabel
    Left = 710
    Top = 61
    Width = 46
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Sit.'
    Color = clInfoBk
    ParentColor = False
  end
  object sgcDATA: TSGCtrl
    Left = -2
    Top = 76
    Width = 763
    Height = 167
    ShowTab = True
    TabOrder = 3
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnDblClick = sgcDATADblClick
  end
  object PnDatos: TPanel
    Left = 0
    Top = 244
    Width = 765
    Height = 21
    TabOrder = 4
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
      Left = 323
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
      Left = 323
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
      Left = 387
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
      Left = 387
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
  object edID_ACREDITADO: TEdit
    Tag = 516
    Left = 88
    Top = 4
    Width = 100
    Height = 21
    TabOrder = 0
  end
  object edNOM_ACREDITADO: TEdit
    Tag = 5
    Left = 222
    Top = 4
    Width = 401
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object btACREDITADO: TBitBtn
    Tag = 17
    Left = 195
    Top = 4
    Width = 21
    Height = 21
    HelpContext = 1101
    TabOrder = 1
    OnClick = btACREDITADOClick
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
  object BitBtn1: TBitBtn
    Left = 636
    Top = 4
    Width = 125
    Height = 21
    Caption = 'Iniciar Búsqueda'
    TabOrder = 5
    OnClick = BitBtn1Click
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
  object rgSitDis: TRadioGroup
    Left = 0
    Top = 26
    Width = 378
    Height = 31
    Caption = 'Situación de Disposición'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Activa'
      'Inactiva')
    TabOrder = 6
    OnClick = rgSitDisClick
  end
  object rgSitGar: TRadioGroup
    Left = 383
    Top = 26
    Width = 378
    Height = 31
    Caption = 'Situación de Garantía'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Activa'
      'Inactiva')
    TabOrder = 7
    OnClick = rgSitGarClick
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
    Left = 538
  end
  object ilACREDITADO: TInterLinkit
    Control = edID_ACREDITADO
    OnEjecuta = ilACREDITADOEjecuta
    TipoReader = trEntero
    CharCase = ecNormal
    OnCapture = ilACREDITADOCapture
    Left = 493
  end
end
