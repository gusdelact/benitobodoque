object WCrsecoco: TWCrsecoco
  Left = 424
  Top = 228
  Width = 521
  Height = 314
  Caption = 'Favor de identificar los recursos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 3
    Top = 94
    Width = 509
    Height = 2
  end
  object Label1: TLabel
    Left = 9
    Top = 70
    Width = 100
    Height = 13
    Caption = 'Fecha de Recepción'
  end
  object lblInstructions: TLabel
    Left = 9
    Top = 6
    Width = 493
    Height = 15
    AutoSize = False
    Caption = 
      'Para poder identificar los recursos de la chequera concentradora' +
      ' favor de indicar la fecha de recepción'
    WordWrap = True
  end
  object lblFECHA: TLabel
    Left = 114
    Top = 119
    Width = 64
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'FECHA'
    Color = clInfoBk
    ParentColor = False
  end
  object lblCONCEPTO: TLabel
    Left = 181
    Top = 119
    Width = 225
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'CONCEPTO'
    Color = clInfoBk
    ParentColor = False
  end
  object lblIMPORTE1: TLabel
    Left = 408
    Top = 119
    Width = 83
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'IMPORTE'
    Color = clInfoBk
    ParentColor = False
  end
  object lblIndique: TLabel
    Left = 4
    Top = 99
    Width = 103
    Height = 13
    Caption = 'Indique el recurso'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object lblSEL: TLabel
    Left = 5
    Top = 119
    Width = 19
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'SEL'
    Color = clInfoBk
    ParentColor = False
  end
  object lblREFERENCIA: TLabel
    Left = 27
    Top = 119
    Width = 83
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'REFERENCIA'
    Color = clInfoBk
    ParentColor = False
  end
  object lblDESC_SEGUIMIENTO: TLabel
    Left = 29
    Top = 23
    Width = 257
    Height = 13
    AutoSize = False
    Caption = '||'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object lblInstructions1: TLabel
    Left = 307
    Top = 23
    Width = 73
    Height = 13
    Caption = 'con importe de '
  end
  object lblIMPORTE: TLabel
    Left = 382
    Top = 23
    Width = 116
    Height = 13
    AutoSize = False
    Caption = '0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object lblInstructions2: TLabel
    Left = 3
    Top = 233
    Width = 127
    Height = 15
    AutoSize = False
    Caption = 'Chequera destino :'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 10
    Top = 23
    Width = 14
    Height = 13
    Caption = 'del'
  end
  object Label3: TLabel
    Left = 9
    Top = 45
    Width = 128
    Height = 15
    AutoSize = False
    Caption = 'Chequera concentradora :'
    WordWrap = True
  end
  object edF_PAG_INICIAL: TEdit
    Tag = 17
    Left = 135
    Top = 65
    Width = 75
    Height = 21
    CharCase = ecUpperCase
    Color = clMenu
    ReadOnly = True
    TabOrder = 3
    OnKeyPress = edF_PAG_INICIALKeyPress
  end
  object dtpF_PAG_INICIAL: TInterDateTimePicker
    Tag = 17
    Left = 211
    Top = 66
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 37825.7332781018
    Time = 37825.7332781018
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 4
    OnKeyPress = edF_PAG_INICIALKeyPress
    Edit = edF_PAG_INICIAL
    Formato = dfDate
  end
  object btnAceptar: TBitBtn
    Left = 358
    Top = 254
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    TabOrder = 9
    OnClick = btnAceptarClick
  end
  object btnCancelar: TBitBtn
    Left = 435
    Top = 254
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 10
    OnClick = btnCancelarClick
  end
  object sgcDATOS: TSGCtrl
    Left = 2
    Top = 135
    Width = 510
    Height = 91
    ShowTab = True
    TabOrder = 6
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnDblClick = sgcDATOSDblClick
  end
  object btnBusqueda: TBitBtn
    Left = 233
    Top = 65
    Width = 268
    Height = 21
    Caption = 'Inicia Busqueda'
    TabOrder = 5
    OnClick = btnBusquedaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
  end
  object edChequera: TEdit
    Tag = 512
    Left = 129
    Top = 229
    Width = 74
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 7
  end
  object btnCVE_SEGUIMIENTO: TBitBtn
    Left = 211
    Top = 42
    Width = 22
    Height = 20
    HelpContext = 1002
    TabOrder = 1
    OnClick = btnCVE_SEGUIMIENTOClick
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
  object edTITNombre: TEdit
    Left = 231
    Top = 40
    Width = 271
    Height = 21
    Color = clBtnFace
    TabOrder = 2
  end
  object edNomChequera: TEdit
    Left = 205
    Top = 229
    Width = 303
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 8
  end
  object edID_CONTRATO: TEdit
    Tag = 512
    Left = 135
    Top = 40
    Width = 74
    Height = 21
    TabOrder = 0
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
    Left = 474
    Top = 95
  end
  object ilChequera: TInterLinkit
    Control = edChequera
    OnEjecuta = ilChequeraEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    OnCapture = ilChequeraCapture
    Left = 247
    Top = 141
  end
end
