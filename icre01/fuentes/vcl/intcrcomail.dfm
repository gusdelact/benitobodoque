object WCrCoMail: TWCrCoMail
  Left = 41
  Top = 69
  Width = 696
  Height = 510
  Caption = 'Consulta de Mail Enviados'
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
  object Label10: TLabel
    Left = 8
    Top = 41
    Width = 55
    Height = 14
    Caption = 'Disposici�n'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 19
    Width = 41
    Height = 14
    Caption = 'No. Folio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label17: TLabel
    Left = 8
    Top = 69
    Width = 59
    Height = 14
    Caption = 'Fecha Inicial'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 409
    Top = 69
    Width = 55
    Height = 14
    Caption = 'Fecha Final'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label19: TLabel
    Left = 608
    Top = -1
    Width = 79
    Height = 13
    Alignment = taCenter
    Caption = 'Aplica b�squeda'
  end
  object edDISPOSICION: TEdit
    Tag = 529
    Left = 88
    Top = 38
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object btDISPOSICION: TBitBtn
    Tag = 17
    Left = 164
    Top = 37
    Width = 25
    Height = 22
    TabOrder = 1
    OnClick = btDISPOSICIONClick
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
  object edTIT_DISPOSICION: TEdit
    Tag = 512
    Left = 190
    Top = 38
    Width = 467
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 2
  end
  object btFOLIO: TBitBtn
    Tag = 17
    Left = 164
    Top = 15
    Width = 25
    Height = 22
    TabOrder = 3
    OnClick = btFOLIOClick
    OnExit = edNUM_FOLIOExit
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
  object edNUM_FOLIO: TEdit
    Tag = 529
    Left = 88
    Top = 16
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
    OnExit = edNUM_FOLIOExit
  end
  object edF_INICIAL: TEdit
    Left = 88
    Top = 66
    Width = 81
    Height = 21
    Color = clMenu
    TabOrder = 5
    Text = '22/07/2003'
    OnExit = dtF_INICIALExit
  end
  object dtF_INICIAL: TInterDateTimePicker
    Left = 172
    Top = 66
    Width = 20
    Height = 21
    CalAlignment = dtaLeft
    Date = 37554.5731407176
    Time = 37554.5731407176
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 6
    OnExit = dtF_INICIALExit
    Edit = edF_INICIAL
    Formato = dfDate
  end
  object edF_FINAL: TEdit
    Left = 466
    Top = 66
    Width = 71
    Height = 21
    Color = clMenu
    TabOrder = 7
    Text = '22/07/2003'
    OnExit = edF_FINALExit
  end
  object dtF_FINAL: TInterDateTimePicker
    Left = 541
    Top = 66
    Width = 20
    Height = 21
    CalAlignment = dtaLeft
    Date = 37554
    Time = 37554
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 8
    OnExit = edF_FINALExit
    Edit = edF_FINAL
    Formato = dfDate
  end
  object btBUSCA: TBitBtn
    Left = 564
    Top = 65
    Width = 117
    Height = 23
    Caption = 'Inicia Busqueda'
    TabOrder = 9
    OnClick = btBUSCAClick
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
  object Edit7: TEdit
    Left = 634
    Top = 128
    Width = 29
    Height = 16
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 10
    Text = '  SIT'
  end
  object Edit3: TEdit
    Left = 393
    Top = 128
    Width = 240
    Height = 16
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 11
    Text = '                                DESTINATARIOS'
  end
  object edTIT_MODO_PAGO: TEdit
    Left = 202
    Top = 128
    Width = 190
    Height = 16
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 12
    Text = '                        TITULO'
  end
  object edTIT_FECHA: TEdit
    Left = 138
    Top = 128
    Width = 63
    Height = 16
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 13
    Text = ' DISPOSIC.'
  end
  object sgcDATOS: TSGCtrl
    Left = 3
    Top = 144
    Width = 681
    Height = 222
    ShowTab = True
    TabOrder = 14
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnMoveRow = sgcDATOSMoveRow
    object btREPORTE: TBitBtn
      Left = 579
      Top = 198
      Width = 101
      Height = 19
      Caption = 'Reporte'
      TabOrder = 2
      OnClick = btREPORTEClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object PnDatos: TPanel
    Left = 0
    Top = 455
    Width = 681
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
  object rgSITUACION: TRadioGroup
    Tag = 17
    Left = 8
    Top = 89
    Width = 649
    Height = 31
    Caption = 'Situaci�n'
    Columns = 2
    Items.Strings = (
      'Entregado'
      'Con Error')
    TabOrder = 16
  end
  object edTITULO: TEdit
    Left = 190
    Top = 16
    Width = 467
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 17
  end
  object chB_APLICA_FOLIO: TCheckBox
    Tag = 18
    Left = 663
    Top = 15
    Width = 16
    Height = 21
    Color = clBtnFace
    ParentColor = False
    TabOrder = 18
    OnClick = chB_APLICA_FOLIOClick
  end
  object chB_APLICA_DISP: TCheckBox
    Tag = 18
    Left = 663
    Top = 39
    Width = 16
    Height = 21
    Color = clBtnFace
    ParentColor = False
    TabOrder = 19
    OnClick = chB_APLICA_DISPClick
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 368
    Width = 681
    Height = 89
    Caption = 'Mensaje'
    TabOrder = 20
    object mTEXTO_FINAL: TMemo
      Left = 2
      Top = 15
      Width = 677
      Height = 72
      Align = alTop
      MaxLength = 2500
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object cbB_SITUACION: TCheckBox
    Tag = 17
    Left = 663
    Top = 94
    Width = 16
    Height = 21
    Color = clBtnFace
    ParentColor = False
    TabOrder = 21
  end
  object Edit1: TEdit
    Left = 5
    Top = 128
    Width = 132
    Height = 16
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 22
    Text = '                FECHA'
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    msgSinRegistros = 'No existe un Registro para realizar la operaci�n.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = '�Desea Eliminar el Registro Actual?'
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
    Left = 250
    Top = 16
  end
  object ilFOLIO: TInterLinkit
    Control = edNUM_FOLIO
    OnEjecuta = ilFOLIOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 200
    Top = 16
  end
  object ilDISPOSICION: TInterLinkit
    Control = edDISPOSICION
    OnEjecuta = ilDISPOSICIONEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 304
    Top = 35
  end
end
