object WCrRepFov: TWCrRepFov
  Left = 318
  Top = 306
  Width = 567
  Height = 281
  Caption = 'Reporte de Eventos Fovis'
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
  object Label2: TLabel
    Left = 11
    Top = 61
    Width = 97
    Height = 13
    Caption = 'Disposición / Cesión'
    WordWrap = True
  end
  object Label6: TLabel
    Left = 3
    Top = 190
    Width = 77
    Height = 13
    Caption = 'Generar Archivo'
  end
  object sbExcel: TSpeedButton
    Left = 102
    Top = 185
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
      00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
      00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
      00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
      0003737FFFFFFFFF7F7330099999999900333777777777777733}
    NumGlyphs = 2
    OnClick = sbExcelClick
  end
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 39
    Height = 13
    Caption = 'Crédito :'
  end
  object edBuscar1: TSpeedButton
    Left = 120
    Top = 22
    Width = 25
    Height = 25
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      0800000000000002000000000000000000000001000000010000000000008080
      8000000080000080800000800000808000008000000080008000408080004040
      0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
      FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
      80008000FF004080FF000200C4000200CC00000000000000000071658400CC00
      DE00000008000200C00000001100000004000000000000000000000000000000
      00000000A000BA7F000000001C005B00D8005B00B800B87FFF00FFFFBC005B00
      2600B77FF4005D00C00000000A0000000100000000000000A4005B0012000000
      6300F7BFC00000000A00000001000000000000005700EC843F000000D0005B00
      2300F7BF0000000047000200E500F9BF7900F7BF0C000000F4005B002E00F7BF
      5700EC8400000000EC00473300000000460000004A0002002E0000001F000000
      3F002701000047333F0027015000FA3B3F000400000000000000F91AB7000000
      0000010000000A000000FA3B10000000000000003C00D379FF0047335000413C
      3F00FFFF47000000000047333F0008E88C0000000300F91AB700E78207000000
      0000000001000A00C0003F010000080000001F175900B77F14005B0094005B00
      0700B87FFF00FFFFA0005B00E200B77F14005B00AC005B00C200B87FFF00FFFF
      B8005B00B000B77F14005B00C4005B003500B87FFF00FFFFD0005B0061004100
      14005B00DC005B006E004100FF00FFFFE8005B00C100410014005B00F4005B00
      DC004100FF00FFFF00005B001800410014005B00F4005B0025004100FF00FFFF
      00005B009C0041001100000001000000000000009800BA7F0100000000000000
      0000000000000000EC0012010100000000000000000000006000188000000000
      0000000005000000000000000000000000000000000000004C000000C0000000
      000000004C005D00000000000500000003000000A0005D0004000000B4005B00
      400000000000000044005D00260008001B00230078005D0000000000F200B87F
      0000000000000000C800BB7F0000000000000000420073636100782E62007000
      6C005B004700B77FC00000001100000004000000000000000000000000000000
      00000000A000BA7F010000009C005B0058005B000000B87FFF00FFFF3C005B00
      2600B77F88005D00E80000008400581100007811000024875000101100005811
      0000308750001701980014050000000002009204000000006600000000005811
      0000728700005A87000000000000010000000000C80000006600507F1700537F
      10007F112F00A0876E00170164002F0100000000C8000000A000000090000000
      780000007F000000010000001000000000002F01F8005D0010000000AA00507F
      1700537F10002979160066376600A705EC00AC11570036EC4A00030303030303
      030303030303110E1111030303030303030303030303010E0101030303030303
      03030303030E0E110E0E03030303030303030303030E0E010E0E030303030303
      03030303110E11110E1103030303030303030303010E01010E01030303030303
      03030311110E0E0E110E03030303030303030301010E0E0E010E030303030303
      030606060E1111111103030303030303030F0F0F0E0101010103030303030303
      03060111060E110E0303030303030303030F0F01000E010E0303030303030303
      0606010E1106110303030303030303030F0F0F0E010F01030303030303030306
      0601060F0F060303030303030303030F0F0F000F0F0F03030303030303030606
      010E0F06060603030303030303030F0F0F0E0F0F0F0F03030303030303060606
      060F06060303030303030303030F0F0F0F0F0F0F030303030303030306060106
      0606060303030303030303030F0F0F0F0F0F0F03030303030303030606010E0F
      06060303030303030303030F0F0F0E0F0F0F03030303030303030306010E0F06
      06030303030303030303030F0F0E0F0F0F0303030303030303030306060F0606
      03030303030303030303030F0F0F0F0F03030303030303030303030306060603
      0303030303030303030303030F0F0F0303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303}
    NumGlyphs = 2
  end
  object Label4: TLabel
    Left = 152
    Top = 32
    Width = 38
    Height = 13
    Caption = 'Cliente :'
  end
  object edID_CESION: TEdit
    Tag = 512
    Left = 110
    Top = 57
    Width = 76
    Height = 21
    HelpContext = 1500
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 0
  end
  object btID_CESION: TBitBtn
    Tag = 17
    Left = 187
    Top = 57
    Width = 21
    Height = 21
    HelpContext = 1501
    TabOrder = 1
    OnClick = btID_CESIONClick
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
  object edCESION: TEdit
    Left = 216
    Top = 57
    Width = 289
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object chbxCESION: TCheckBox
    Left = 518
    Top = 60
    Width = 14
    Height = 15
    TabStop = False
    Enabled = False
    TabOrder = 3
  end
  object edNbrArch: TEdit
    Left = 132
    Top = 186
    Width = 373
    Height = 21
    Color = clBtnFace
    TabOrder = 4
    OnChange = edNbrArchChange
  end
  object cbxArchivo: TCheckBox
    Left = 518
    Top = 190
    Width = 14
    Height = 15
    TabStop = False
    Enabled = False
    TabOrder = 5
  end
  object PnDatos: TPanel
    Left = 0
    Top = 218
    Width = 539
    Height = 21
    TabOrder = 6
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 7
    Width = 545
    Height = 40
    HelpContext = 1000
    Caption = 'Rango de Fecha'
    TabOrder = 7
    object lbLiqF_INICIO: TLabel
      Left = 11
      Top = 18
      Width = 58
      Height = 13
      Caption = 'Fecha Inicio'
    end
    object Label3: TLabel
      Left = 324
      Top = 18
      Width = 47
      Height = 13
      Caption = 'Fecha Fin'
    end
    object edF_Inicio: TEdit
      Left = 112
      Top = 13
      Width = 76
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object dtpF_Inicio: TInterDateTimePicker
      Left = 189
      Top = 13
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 37770.450694537
      Time = 37770.450694537
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      TabStop = False
      Edit = edF_Inicio
      Formato = dfDate
    end
    object edF_FIN: TEdit
      Left = 400
      Top = 13
      Width = 76
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object dtpF_Fin: TInterDateTimePicker
      Left = 476
      Top = 13
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 37770.450694537
      Time = 37770.450694537
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      TabStop = False
      Edit = edF_FIN
      Formato = dfDate
    end
    object chbxFechas: TCheckBox
      Left = 518
      Top = 14
      Width = 14
      Height = 17
      TabStop = False
      TabOrder = 4
      OnClick = chbxFechasClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 136
    Width = 545
    Height = 41
    HelpContext = 2400
    Caption = 'Tipo de Evento(s)'
    TabOrder = 8
    object chbxColocacion: TCheckBox
      Left = 8
      Top = 15
      Width = 80
      Height = 17
      HelpContext = 2500
      Alignment = taLeftJustify
      Caption = 'Colocación'
      TabOrder = 0
    end
    object chbxTraspasos: TCheckBox
      Left = 451
      Top = 15
      Width = 80
      Height = 17
      HelpContext = 2600
      Alignment = taLeftJustify
      Caption = 'Traspasos'
      TabOrder = 1
    end
    object chbxCobranza: TCheckBox
      Left = 112
      Top = 15
      Width = 80
      Height = 17
      HelpContext = 2300
      Alignment = taLeftJustify
      Caption = 'Cobranza'
      TabOrder = 2
    end
    object chbxProvision: TCheckBox
      Left = 347
      Top = 15
      Width = 80
      Height = 17
      HelpContext = 2300
      Alignment = taLeftJustify
      Caption = 'Provisión'
      TabOrder = 3
    end
    object chbxCapitalizacion: TCheckBox
      Left = 224
      Top = 15
      Width = 90
      Height = 17
      HelpContext = 2300
      Alignment = taLeftJustify
      Caption = 'Capitalización'
      TabOrder = 4
    end
  end
  object RadioGroupTran: TRadioGroup
    Left = 0
    Top = 88
    Width = 297
    Height = 41
    Caption = 'Transacciones'
    TabOrder = 9
  end
  object RBTranAC: TRadioButton
    Left = 8
    Top = 104
    Width = 65
    Height = 17
    Caption = 'Activas'
    TabOrder = 10
  end
  object RBTranCA: TRadioButton
    Left = 104
    Top = 104
    Width = 81
    Height = 17
    Caption = 'Canceladas'
    TabOrder = 11
  end
  object RBTranIN: TRadioButton
    Left = 216
    Top = 104
    Width = 73
    Height = 17
    Caption = 'Indistintas'
    TabOrder = 12
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
    FormaTipo = ftImprimir
    FormaEstilo = feVertical
    CanEdit = False
    IsNewData = False
    ShowBtnNuevo = False
    ShowBtnModificar = False
    ShowBtnAceptar = False
    ShowBtnCancelar = False
    ShowBtnEliminar = False
    Version = 20
    HideButtons = False
    OnBtnPreviewClick = InterForma1BtnPreviewClick
    OnBtnImprimirClick = InterForma1BtnImprimirClick
    ShowBtnBuscar = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 258
    Top = 2
  end
  object ilCesion: TInterLinkit
    Control = edID_CESION
    OnEjecuta = ilCesionEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCesionCapture
    Left = 267
    Top = 53
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'prn'
    Filter = '*.prn|*.prn'
    Left = 194
    Top = 183
  end
end
