object WCrMovPPP: TWCrMovPPP
  Left = 267
  Top = 162
  Width = 558
  Height = 570
  Caption = 'Catalogo de Movimientos para Posible Premio a Otorgar'
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
  object Shape1: TShape
    Left = 250
    Top = 167
    Width = 289
    Height = 18
    Brush.Color = clInfoBk
  end
  object Shape4: TShape
    Left = 125
    Top = 167
    Width = 126
    Height = 18
    Brush.Color = clInfoBk
  end
  object Shape3: TShape
    Left = 10
    Top = 167
    Width = 116
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label1: TLabel
    Left = 3
    Top = 10
    Width = 84
    Height = 13
    Caption = 'Clave Movimiento'
  end
  object lbUSUA_ALTA: TLabel
    Left = 175
    Top = 96
    Width = 43
    Height = 13
    Caption = 'Usu. Alta'
  end
  object lbUSUA_MODIF: TLabel
    Left = 155
    Top = 123
    Width = 65
    Height = 13
    Caption = 'Usu. Modifica'
  end
  object lbF_ALTA: TLabel
    Left = 25
    Top = 98
    Width = 45
    Height = 13
    Caption = 'F. de Alta'
  end
  object lbF_MODIF: TLabel
    Left = 18
    Top = 122
    Width = 52
    Height = 13
    Caption = 'F. Modifica'
  end
  object Label2: TLabel
    Left = 3
    Top = 50
    Width = 112
    Height = 13
    Caption = 'Operación Relacionada'
  end
  object Shape5: TShape
    Left = 10
    Top = 150
    Width = 529
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label9: TLabel
    Left = 114
    Top = 154
    Width = 312
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Asignaciones de relación Movimiento PPP/Operación'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label8: TLabel
    Left = 16
    Top = 170
    Width = 98
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Cve. Movimiento'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
  end
  object Label10: TLabel
    Left = 138
    Top = 170
    Width = 97
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Cve. Operación'
    Color = clInfoBk
    ParentColor = False
  end
  object Label3: TLabel
    Left = 343
    Top = 169
    Width = 103
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Descripción Op.'
    Color = clInfoBk
    ParentColor = False
  end
  object Label6: TLabel
    Left = 8
    Top = 360
    Width = 92
    Height = 13
    Caption = 'Importar de Archivo'
  end
  object sbExcel: TSpeedButton
    Left = 107
    Top = 355
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
  object edDESC_MOV_PPP: TEdit
    Tag = 18
    Left = 164
    Top = 6
    Width = 378
    Height = 21
    HelpContext = 2001
    TabOrder = 1
    OnExit = edDESC_MOV_PPPExit
    OnKeyPress = edDESC_MOV_PPPKeyPress
  end
  object PnDatos: TPanel
    Left = 2
    Top = 509
    Width = 545
    Height = 21
    TabOrder = 14
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
  object edCVE_MOV_PPP: TEdit
    Tag = 50
    Left = 95
    Top = 6
    Width = 63
    Height = 21
    HelpContext = 1001
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 0
    OnExit = edCVE_MOV_PPPExit
    OnKeyPress = edDESC_MOV_PPPKeyPress
  end
  object rgSIT_MOV_PPP: TRadioGroup
    Tag = 18
    Left = 346
    Top = 113
    Width = 185
    Height = 34
    HelpContext = 6000
    Caption = 'Situación del movimiento '
    Columns = 2
    Items.Strings = (
      'ACtivo'
      'INactivo')
    TabOrder = 6
    TabStop = True
    OnExit = rgSIT_MOV_PPPExit
  end
  object edCVE_USUA_ALTA: TEdit
    Left = 227
    Top = 88
    Width = 70
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
    OnExit = edCVE_USUA_ALTAExit
  end
  object edF_ALTA: TEdit
    Left = 77
    Top = 90
    Width = 70
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 9
    OnExit = edF_ALTAExit
  end
  object edF_MODIF: TEdit
    Left = 77
    Top = 114
    Width = 69
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 11
    OnExit = edF_MODIFExit
  end
  object edCVE_USUA_MODIF: TEdit
    Left = 226
    Top = 115
    Width = 70
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 12
    OnExit = edCVE_USUA_MODIFExit
  end
  object sgcDatos: TSGCtrl
    Left = 7
    Top = 185
    Width = 534
    Height = 153
    HelpContext = -1
    ShowTab = True
    TabOrder = 13
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnMoveRow = sgcDatosMoveRow
  end
  object edCVE_OPERACION: TEdit
    Tag = 530
    Left = 120
    Top = 46
    Width = 66
    Height = 21
    HelpContext = 4000
    TabOrder = 2
    OnExit = edCVE_OPERACIONExit
  end
  object bbCveOperacion: TBitBtn
    Tag = 18
    Left = 188
    Top = 46
    Width = 21
    Height = 21
    HelpContext = 4100
    TabOrder = 3
    OnClick = bbCveOperacionClick
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
  object edDESC_C_OPERACION: TEdit
    Left = 216
    Top = 46
    Width = 154
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 8
    OnExit = edDESC_C_OPERACIONExit
  end
  object chbxB_GENERA_FACTURA: TCheckBox
    Tag = 18
    Left = 400
    Top = 50
    Width = 129
    Height = 17
    HelpContext = 5000
    Caption = 'Genera factura'
    TabOrder = 4
    OnExit = chbxB_GENERA_FACTURAExit
  end
  object rgCVE_AFECTA_PREMIO: TRadioGroup
    Tag = 18
    Left = 346
    Top = 78
    Width = 185
    Height = 34
    HelpContext = 5000
    Caption = 'Afectación de Premio'
    Columns = 2
    Items.Strings = (
      'Incrementa'
      'Decrementa')
    TabOrder = 5
    TabStop = True
    OnExit = rgCVE_AFECTA_PREMIOExit
  end
  object edNbrArch: TEdit
    Left = 137
    Top = 356
    Width = 308
    Height = 21
    Color = clBtnFace
    TabOrder = 15
  end
  object BtnImportar: TButton
    Left = 463
    Top = 354
    Width = 74
    Height = 25
    Caption = 'Importar'
    Enabled = False
    TabOrder = 7
    OnClick = BtnImportarClick
  end
  object Memo1: TMemo
    Left = 14
    Top = 392
    Width = 521
    Height = 113
    Lines.Strings = (
      
        '/*********************************************  Observaciones  *' +
        '***************************************************/'
      ''
      
        'Para el proceso de importación masiva PPO, la disposición de las' +
        ' columnas en el documento Excel del '
      'caso deben ser como sigue:'
      ''
      
        '    - El primer renglón, correspondiente a los títulos de column' +
        'a,'
      '      será ignorado.'
      '    - La columna 1 ('#39'A'#39') debe ser el CRÉDITO. '
      
        '    - La columna 2 ('#39'B'#39') debe ser la FECHA DE SALDO del PPO. El ' +
        'formato de la misma debe ser '
      '      DD/MM/AAAA.'
      
        '    - La columna 3 ('#39'C'#39') debe ser el IMPORTE PPO del crédito del' +
        ' caso.'
      
        '    - Columnas mas allá de las nombradas hasta aquí serán ignora' +
        'das.'
      
        '    - La importación se detendrá una vez que sea detectada una c' +
        'elda vacía en la columna '
      '      correpondiente a crédito ('#39'A'#39').')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 16
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesEliminar = InterForma1DespuesEliminar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesModificar = InterForma1AntesModificar
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
    OnDespuesShow = InterForma1DespuesShow
    Left = 458
    Top = 2
  end
  object ilCVE_OPERACION: TInterLinkit
    Control = edCVE_OPERACION
    TipoReader = trTexto
    CharCase = ecNormal
    Left = 135
    Top = 74
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'xls'
    InitialDir = 'C:\'
    Title = 'Seleccione archivo Excel origen'
    Left = 224
    Top = 337
  end
end
