object WMImpECC: TWMImpECC
  Left = 215
  Top = 119
  Width = 734
  Height = 464
  Caption = 'Impresión de Estados de Cuenta Certificados'
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
    Top = 120
    Width = 75
    Height = 18
    Brush.Color = clInfoBk
  end
  object Shape1: TShape
    Left = 149
    Top = 120
    Width = 289
    Height = 18
    Brush.Color = clInfoBk
  end
  object Shape6: TShape
    Left = 437
    Top = 120
    Width = 75
    Height = 18
    Brush.Color = clInfoBk
  end
  object Shape2: TShape
    Left = 511
    Top = 120
    Width = 73
    Height = 18
    Brush.Color = clInfoBk
  end
  object Shape3: TShape
    Left = 583
    Top = 120
    Width = 75
    Height = 18
    Brush.Color = clInfoBk
  end
  object Shape10: TShape
    Left = 657
    Top = 120
    Width = 63
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label2: TLabel
    Left = 12
    Top = 123
    Width = 52
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '# de Folio'
    Color = clInfoBk
    ParentColor = False
  end
  object Label3: TLabel
    Left = 256
    Top = 123
    Width = 72
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Acreditado'
    Color = clInfoBk
    ParentColor = False
  end
  object Label9: TLabel
    Left = 444
    Top = 123
    Width = 61
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '# de Crédito'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 520
    Top = 123
    Width = 54
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'F. Alta'
    Color = clInfoBk
    ParentColor = False
  end
  object Label5: TLabel
    Left = 593
    Top = 123
    Width = 55
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'F. Últ. Imp'
    Color = clInfoBk
    ParentColor = False
  end
  object Label11: TLabel
    Left = 666
    Top = 123
    Width = 44
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Imprimir'
    Color = clInfoBk
    ParentColor = False
  end
  object Shape4: TShape
    Left = 1
    Top = 103
    Width = 719
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label6: TLabel
    Left = 240
    Top = 106
    Width = 228
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Folios de Solicitud Encontrados'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Shape5: TShape
    Left = 75
    Top = 120
    Width = 75
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label7: TLabel
    Left = 81
    Top = 123
    Width = 62
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '# Acreditado'
    Color = clInfoBk
    ParentColor = False
  end
  object PnDatos: TPanel
    Left = 0
    Top = 416
    Width = 721
    Height = 21
    TabOrder = 1
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
  object GroupBox3: TGroupBox
    Left = 0
    Top = 4
    Width = 721
    Height = 96
    TabOrder = 0
    object lbID_ACREDITADO: TLabel
      Left = 35
      Top = 21
      Width = 51
      Height = 13
      Caption = 'Acreditado'
    end
    object Label1: TLabel
      Left = 35
      Top = 43
      Width = 54
      Height = 13
      Caption = 'Disposición'
    end
    object edID_ACREDITADO: TEdit
      Tag = 512
      Left = 111
      Top = 17
      Width = 80
      Height = 21
      HelpContext = 1000
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object btID_ACREDITADO: TBitBtn
      Tag = 17
      Left = 199
      Top = 17
      Width = 21
      Height = 21
      HelpContext = 1001
      TabOrder = 1
      OnClick = btID_ACREDITADOClick
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
      Left = 232
      Top = 17
      Width = 416
      Height = 21
      TabStop = False
      Color = clBtnFace
      TabOrder = 2
    end
    object edDESC_CREDITO: TEdit
      Left = 232
      Top = 39
      Width = 416
      Height = 21
      TabStop = False
      Color = clBtnFace
      TabOrder = 6
    end
    object btID_CREDITO: TBitBtn
      Tag = 17
      Left = 199
      Top = 39
      Width = 21
      Height = 21
      HelpContext = 1101
      TabOrder = 5
      OnClick = btID_CREDITOClick
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
    object edID_CREDITO: TEdit
      Tag = 512
      Left = 111
      Top = 39
      Width = 80
      Height = 21
      HelpContext = 1100
      CharCase = ecUpperCase
      TabOrder = 4
    end
    object cbxID_ACREDITADO: TCheckBox
      Left = 672
      Top = 19
      Width = 12
      Height = 17
      Enabled = False
      TabOrder = 3
      OnClick = cbxID_ACREDITADOClick
    end
    object cbxID_CREDITO: TCheckBox
      Left = 671
      Top = 41
      Width = 13
      Height = 17
      Enabled = False
      TabOrder = 7
      OnClick = cbxID_CREDITOClick
    end
    object BitBtn1: TBitBtn
      Tag = 17
      Left = 587
      Top = 65
      Width = 97
      Height = 25
      Caption = 'Buscar'
      TabOrder = 8
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF5555555555555A055555
        55555555588FF55555555555AAA05555555555558888F55555555555AAA05555
        555555558888FF555555555AAAAA05555555555888888F55555555AAAAAA0555
        5555558888888FF5555558AA05AAA05555555888858888F555558A05555AA055
        55558885555888FF55555555555AAA05555555555558888F555555555555AA05
        555555555555888FF555555555555AA05555555555555888FF5555555555558A
        05555555555555888FF5555555555558A05555555555555888FF555555555555
        5AA0555555555555588855555555555555555555555555555555}
      NumGlyphs = 2
    end
  end
  object sgcDATA: TSGCtrl
    Left = 0
    Top = 139
    Width = 721
    Height = 270
    ShowTab = True
    TabOrder = 2
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnDblClick = sgcDATADblClick
  end
  object ilID_CREDITO: TInterLinkit
    Control = edID_CREDITO
    OnEjecuta = ilID_CREDITOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 296
    Top = 42
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
    OnBtnPreviewClick = InterForma1BtnPreviewClick
    ShowBtnPreview = False
    OnBtnImprimirClick = InterForma1BtnImprimirClick
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 314
    Top = 4
  end
  object ilID_ACREDITADO: TInterLinkit
    Control = edID_ACREDITADO
    OnEjecuta = ilID_ACREDITADOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 288
    Top = 12
  end
end
