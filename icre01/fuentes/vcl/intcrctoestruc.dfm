object WCrCtoEstruc: TWCrCtoEstruc
  Left = 304
  Top = 125
  Width = 698
  Height = 580
  Caption = 'Calificación de Contratos Estructurados'
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
  object lbID_CONTRATO: TLabel
    Left = 13
    Top = 10
    Width = 40
    Height = 13
    Caption = 'Contrato'
  end
  object lbID_ACCIONISTA: TLabel
    Left = 13
    Top = 36
    Width = 55
    Height = 13
    Caption = 'Calificadora'
  end
  object Label1: TLabel
    Left = 13
    Top = 459
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object Label2: TLabel
    Left = 13
    Top = 482
    Width = 93
    Height = 13
    Caption = 'Fecha Modificación'
  end
  object Label4: TLabel
    Left = 372
    Top = 459
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object Label3: TLabel
    Left = 372
    Top = 482
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object Label17: TLabel
    Left = 19
    Top = 118
    Width = 53
    Height = 13
    Caption = 'Comentario'
  end
  object lbCVE_TIPO_ACCION: TLabel
    Left = 13
    Top = 61
    Width = 54
    Height = 13
    Caption = 'Calificacion'
  end
  object Label13: TLabel
    Left = 13
    Top = 85
    Width = 56
    Height = 13
    Caption = 'Fecha Calif.'
  end
  object rgSIT_CALIFICA: TRadioGroup
    Tag = 18
    Left = 240
    Top = 77
    Width = 377
    Height = 35
    HelpContext = 1040
    Caption = 'Situación'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Inactivo')
    TabOrder = 6
    TabStop = True
    OnExit = rgSIT_CALIFICAExit
  end
  object btACREDITADO: TBitBtn
    Tag = 50
    Left = 154
    Top = 30
    Width = 22
    Height = 20
    HelpContext = 1010
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
  object PnDatos: TPanel
    Left = 13
    Top = 522
    Width = 588
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
  object GroupBox1: TGroupBox
    Left = 13
    Top = 224
    Width = 660
    Height = 225
    Caption = 'Listado de Calificaciones'
    TabOrder = 7
    object Label7: TLabel
      Left = 14
      Top = 16
      Width = 67
      Height = 13
      Caption = 'Id Calificadora'
    end
    object Label8: TLabel
      Left = 155
      Top = 16
      Width = 95
      Height = 13
      Caption = 'Nombre Calificadora'
    end
    object Bevel2: TBevel
      Left = 86
      Top = 13
      Width = 3
      Height = 18
    end
    object Label9: TLabel
      Left = 604
      Top = 16
      Width = 12
      Height = 13
      Caption = 'Sit'
    end
    object Bevel3: TBevel
      Left = 325
      Top = 13
      Width = 3
      Height = 18
    end
    object Bevel1: TBevel
      Left = 446
      Top = 13
      Width = 3
      Height = 18
    end
    object Label5: TLabel
      Left = 359
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Calificación'
    end
    object Label6: TLabel
      Left = 480
      Top = 16
      Width = 87
      Height = 13
      Caption = 'Fecha Calificación'
    end
    object Bevel5: TBevel
      Left = 594
      Top = 13
      Width = 3
      Height = 18
    end
    object sgCalificaciones: TSGCtrl
      Left = 10
      Top = 32
      Width = 637
      Height = 190
      OnCalcRow = sgCalificacionesCalcRow
      ShowTab = True
      TabOrder = 0
      TabWidth = 0
      ShowBtnPriorNext = True
      ShowBtnFirst = True
      ShowBtnLast = True
      OnMoveRow = sgCalificacionesMoveRow
    end
  end
  object edF_ALTA: TEdit
    Tag = 512
    Left = 143
    Top = 455
    Width = 135
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 9
  end
  object edF_MODIFICA: TEdit
    Left = 143
    Top = 478
    Width = 135
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 11
  end
  object edCVE_USU_ALTA: TEdit
    Tag = 512
    Left = 500
    Top = 455
    Width = 100
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
  end
  object edCVE_USU_MODIFICA: TEdit
    Tag = 512
    Left = 500
    Top = 478
    Width = 100
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 12
  end
  object MsgPanel: TPanel
    Left = 13
    Top = 503
    Width = 588
    Height = 19
    TabOrder = 13
  end
  object btCalificacion: TBitBtn
    Tag = 18
    Left = 154
    Top = 57
    Width = 22
    Height = 20
    HelpContext = 1020
    TabOrder = 3
    OnClick = btCalificacionClick
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
  object edID_CONTRATO: TEdit
    Tag = 562
    Left = 75
    Top = 6
    Width = 73
    Height = 21
    HelpContext = 1001
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 15
    OnExit = edID_CONTRATOExit
  end
  object edID_CALIFICADORA: TEdit
    Tag = 562
    Left = 75
    Top = 30
    Width = 73
    Height = 21
    HelpContext = 1010
    CharCase = ecUpperCase
    TabOrder = 0
    OnExit = edID_CALIFICADORAExit
  end
  object edCVE_CALIFICACION: TEdit
    Tag = 530
    Left = 75
    Top = 54
    Width = 73
    Height = 21
    HelpContext = 1020
    TabOrder = 2
    OnExit = edCVE_CALIFICACIONExit
  end
  object edTXT_COMENTARIO: TMemo
    Tag = 18
    Left = 18
    Top = 136
    Width = 649
    Height = 81
    HelpContext = 1050
    Lines.Strings = (
      'edTXT_COMENTARIO')
    MaxLength = 2000
    ScrollBars = ssVertical
    TabOrder = 8
    OnExit = edTXT_COMENTARIOExit
  end
  object dtpFH_CALIFICACION: TInterDateTimePicker
    Tag = 18
    Left = 205
    Top = 83
    Width = 21
    Height = 21
    HelpContext = 1030
    CalAlignment = dtaLeft
    Date = 38498
    Time = 38498
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 5
    OnExit = edF_CALIFICACIONExit
    Edit = edF_CALIFICACION
    Formato = dfDate
  end
  object edF_CALIFICACION: TEdit
    Tag = 18
    Left = 75
    Top = 82
    Width = 131
    Height = 21
    HelpContext = 1030
    CharCase = ecUpperCase
    TabOrder = 4
    OnExit = edF_CALIFICACIONExit
  end
  object edNomCalif: TEdit
    Left = 187
    Top = 30
    Width = 406
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 16
  end
  object edID_CONTRATO2: TEdit
    Tag = 562
    Left = 187
    Top = 6
    Width = 73
    Height = 21
    HelpContext = 1001
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 17
    Visible = False
    OnExit = edID_CONTRATOExit
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesEliminar = InterForma1DespuesEliminar
    OnDespuesCancelar = InterForma1DespuesCancelar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnBuscar = InterForma1Buscar
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
    Left = 551
    Top = 66
  end
  object ilCVE_CALIFICACION: TInterLinkit
    Control = edCVE_CALIFICACION
    OnEjecuta = ilCVE_CALIFICACIONEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    OnCapture = ilCVE_CALIFICACIONCapture
    Left = 600
    Top = 44
  end
  object ilCALIFICADORA: TInterLinkit
    Control = edID_CALIFICADORA
    OnEjecuta = ilCALIFICADORAEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCALIFICADORACapture
    Left = 520
    Top = 32
  end
end
