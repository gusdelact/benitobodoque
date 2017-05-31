object WCrComisEv: TWCrComisEv
  Left = 216
  Top = 64
  Width = 598
  Height = 309
  Caption = 'Comisiones por Evento'
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
    Left = 8
    Top = 6
    Width = 54
    Height = 13
    Caption = 'Disposición'
  end
  object lbCVE_COMISION: TLabel
    Left = 8
    Top = 28
    Width = 87
    Height = 13
    Caption = 'Clave de Comisión'
  end
  object lbCVE_DIA_APLICA: TLabel
    Left = 8
    Top = 50
    Width = 65
    Height = 13
    Caption = 'Imp. Comisión'
  end
  object Label23: TLabel
    Left = 35
    Top = 95
    Width = 60
    Height = 13
    Caption = '  Comisión    '
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label25: TLabel
    Left = 184
    Top = 95
    Width = 84
    Height = 13
    Caption = '      Porcentaje     '
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label30: TLabel
    Left = 269
    Top = 95
    Width = 86
    Height = 13
    Caption = '        Importe         '
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label1: TLabel
    Left = 528
    Top = 95
    Width = 36
    Height = 13
    Caption = '    Sit.   '
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label26: TLabel
    Left = 402
    Top = 50
    Width = 73
    Height = 13
    Caption = 'F. Vencimiento '
  end
  object Label2: TLabel
    Left = 3
    Top = 95
    Width = 31
    Height = 13
    Caption = '  Per.  '
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 210
    Top = 50
    Width = 62
    Height = 13
    Caption = 'IVA Comisión'
  end
  object Label4: TLabel
    Left = 356
    Top = 95
    Width = 83
    Height = 13
    Caption = '          I.V.A          '
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label5: TLabel
    Left = 440
    Top = 95
    Width = 87
    Height = 13
    Caption = '          Total           '
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 74
    Width = 64
    Height = 13
    Caption = 'Pct. Comisión'
  end
  object Label7: TLabel
    Left = 97
    Top = 95
    Width = 85
    Height = 13
    Caption = '  F. Vencimiento   '
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object edID_CREDITO: TEdit
    Tag = 512
    Left = 111
    Top = 2
    Width = 73
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 4
    TabOrder = 0
    OnExit = edID_CREDITOExit
  end
  object btCREDITO: TBitBtn
    Left = 184
    Top = 2
    Width = 22
    Height = 20
    HelpContext = 1002
    TabOrder = 1
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
  object edDESC_CREDITO: TEdit
    Left = 208
    Top = 2
    Width = 380
    Height = 21
    Color = clBtnFace
    TabOrder = 11
  end
  object edCVE_COMISION: TEdit
    Tag = 512
    Left = 111
    Top = 24
    Width = 73
    Height = 21
    HelpContext = 2001
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 2
    OnExit = btCOMISIONExit
  end
  object btCOMISION: TBitBtn
    Left = 184
    Top = 24
    Width = 22
    Height = 20
    HelpContext = 2002
    TabOrder = 3
    OnClick = btCOMISIONClick
    OnExit = btCOMISIONExit
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
  object edDESC_COMISION: TEdit
    Left = 208
    Top = 24
    Width = 380
    Height = 21
    Color = clBtnFace
    TabOrder = 12
  end
  object sgDATOS: TStringAlignGrid
    Left = 3
    Top = 107
    Width = 582
    Height = 94
    ColCount = 8
    DefaultRowHeight = 15
    FixedColor = clWhite
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    PopupMenu = pmCOMEVENT
    TabOrder = 13
    ColWidths = (
      30
      60
      86
      85
      85
      85
      86
      30)
    PropCell = ()
    PropCol = (
      0
      1
      0
      0
      1
      1
      2
      0
      2
      1
      2
      0
      3
      1
      0
      0
      4
      1
      0
      0
      5
      1
      0
      0
      6
      1
      0
      0
      7
      1
      2
      0)
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = ()
  end
  object edF_VENCIMIENTO: TEdit
    Left = 491
    Top = 46
    Width = 76
    Height = 21
    HelpContext = 5001
    TabOrder = 6
  end
  object dtpF_VENCIMIENTO: TInterDateTimePicker
    Left = 568
    Top = 46
    Width = 20
    Height = 21
    HelpContext = 5002
    CalAlignment = dtaLeft
    Date = 37777.7691627546
    Time = 37777.7691627546
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 7
    TabStop = False
    Edit = edF_VENCIMIENTO
    Formato = dfDate
  end
  object PnDatos: TPanel
    Left = 2
    Top = 254
    Width = 583
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
  object MErrores: TMemo
    Left = 2
    Top = 203
    Width = 583
    Height = 51
    TabStop = False
    Color = clInfoBk
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 15
  end
  object BitBtn2: TBitBtn
    Left = 400
    Top = 70
    Width = 187
    Height = 22
    Caption = 'Genera Comisión'
    TabOrder = 10
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
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
  object edIMP_COMISION: TInterEdit
    Left = 111
    Top = 47
    Width = 95
    Height = 21
    HelpContext = 3001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_COMISIONExit
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 4
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edIMP_IVA: TInterEdit
    Left = 304
    Top = 47
    Width = 89
    Height = 21
    HelpContext = 4001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,##0.00'
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
  object edPCT_COMIS: TInterEdit
    Left = 111
    Top = 71
    Width = 95
    Height = 21
    HelpContext = 6001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '##0.0000'
    MaxLength = 8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 8
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object chB_APLICA_COM: TCheckBox
    Left = 210
    Top = 75
    Width = 183
    Height = 17
    HelpContext = 5301
    Alignment = taLeftJustify
    Caption = 'Afecta Imp. Disp. en la Colocación'
    TabOrder = 9
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
    Left = 450
    Top = 65530
  end
  object ilCREDITO: TInterLinkit
    Control = edID_CREDITO
    OnEjecuta = ilCREDITOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 216
  end
  object ilCOMISION: TInterLinkit
    Control = edCVE_COMISION
    OnEjecuta = ilCOMISIONEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 224
    Top = 24
  end
  object pmCOMEVENT: TPopupMenu
    Left = 352
    Top = 151
    object Disposicin1: TMenuItem
      Caption = 'Elimina Periodo'
      OnClick = Disposicin1Click
    end
  end
end
