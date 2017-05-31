object WCrAmBitacora: TWCrAmBitacora
  Left = 302
  Top = 47
  Width = 719
  Height = 686
  Caption = 'Agronegocios Bitacora'
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
  object lbF_EVENTO: TLabel
    Left = 8
    Top = 26
    Width = 67
    Height = 13
    Caption = 'Fecha Evento'
  end
  object lbF_PROX_EVENTO: TLabel
    Left = 366
    Top = 322
    Width = 199
    Height = 13
    Caption = 'Fecha programada para el próximo evento'
  end
  object lbID_DESPACHO: TLabel
    Left = 8
    Top = 149
    Width = 49
    Height = 13
    Caption = 'Despacho'
  end
  object lbNOMBRE_SPVISOR: TLabel
    Left = 8
    Top = 175
    Width = 144
    Height = 13
    Caption = 'Nombre de quien visita o llama'
  end
  object lbTXT_COMENTARIO: TLabel
    Left = 8
    Top = 210
    Width = 72
    Height = 13
    Caption = 'COMENTARIO'
  end
  object lbF_LIM_ACLARA: TLabel
    Left = 413
    Top = 298
    Width = 152
    Height = 13
    Caption = 'Fecha límite de aclaración FIRA'
  end
  object lbID_PROMOTOR: TLabel
    Left = 8
    Top = 118
    Width = 42
    Height = 13
    Caption = 'Promotor'
  end
  object Label2: TLabel
    Left = 8
    Top = 57
    Width = 54
    Height = 13
    Caption = 'Disposición'
    WordWrap = True
  end
  object Label1: TLabel
    Left = 8
    Top = 88
    Width = 51
    Height = 13
    Caption = 'Acreditado'
  end
  object Label3: TLabel
    Left = 436
    Top = 274
    Width = 129
    Height = 13
    Caption = 'Fecha de entrega a Crédito'
  end
  object Label4: TLabel
    Left = 214
    Top = 342
    Width = 111
    Height = 13
    Caption = 'Clasificación del crédito'
  end
  object edNOMBRE_SPVISOR: TEdit
    Tag = 18
    Left = 252
    Top = 171
    Width = 397
    Height = 21
    HelpContext = 1500
    MaxLength = 60
    TabOrder = 6
    OnExit = edNOMBRE_SPVISORExit
  end
  object edID_CREDITO: TEdit
    Tag = 562
    Left = 120
    Top = 53
    Width = 76
    Height = 21
    HelpContext = 1300
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 4
    OnExit = edID_CREDITOExit
  end
  object btID_CREDITO: TBitBtn
    Tag = 50
    Left = 199
    Top = 53
    Width = 21
    Height = 21
    HelpContext = 1302
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
  object edTXT_COMENTARIO: TMemo
    Tag = 18
    Left = 120
    Top = 200
    Width = 529
    Height = 52
    HelpContext = 1600
    MaxLength = 2000
    ScrollBars = ssVertical
    TabOrder = 7
    OnExit = edTXT_COMENTARIOExit
  end
  object edTIPO_EVENTO: TRadioGroup
    Tag = 18
    Left = 496
    Top = 12
    Width = 201
    Height = 41
    HelpContext = 1200
    Caption = 'Tipo'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Visita'
      'Llamada'
      'Cita')
    TabOrder = 3
    OnExit = edTIPO_EVENTOExit
  end
  object edTIPO_SUPERVISOR: TRadioGroup
    Tag = 18
    Left = 272
    Top = 12
    Width = 217
    Height = 53
    HelpContext = 1100
    Caption = 'Ente'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'BINTER'
      'FIRA'
      'Despacho'
      'Acreditado')
    TabOrder = 2
    OnClick = edTIPO_SUPERVISORClick
    OnExit = edTIPO_SUPERVISORExit
  end
  object edNOM_PROMOTOR: TEdit
    Left = 200
    Top = 114
    Width = 449
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 19
  end
  object edDESPACHO: TEdit
    Left = 200
    Top = 145
    Width = 449
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 20
  end
  object edB_RES_DICTAMEN: TRadioGroup
    Tag = 18
    Left = 8
    Top = 270
    Width = 193
    Height = 41
    HelpContext = 1700
    Caption = 'Dictamen'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'n/a'
      'Positivo'
      'Negativo')
    TabOrder = 8
    OnExit = edB_RES_DICTAMENExit
  end
  object sgBitacora: TSGCtrl
    Left = 8
    Top = 448
    Width = 689
    Height = 177
    ShowTab = True
    TabOrder = 21
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnDblClick = sgBitacoraDblClick
  end
  object edID_PROMOTOR: TEdit
    Left = 120
    Top = 114
    Width = 77
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 22
  end
  object edNOM_ACREDITADO: TEdit
    Left = 200
    Top = 84
    Width = 449
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 23
  end
  object MsgPanel: TPanel
    Left = 9
    Top = 422
    Width = 688
    Height = 19
    TabOrder = 24
  end
  object edID_ACREDITADO: TEdit
    Left = 120
    Top = 84
    Width = 77
    Height = 21
    Hint = 'Click derecho para ver Persona'
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    PopupMenu = pmAcreditado
    ReadOnly = True
    ShowHint = True
    TabOrder = 25
  end
  object edID_DESPACHO: TEdit
    Left = 120
    Top = 146
    Width = 77
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 26
  end
  object edF_EVENTO: TEdit
    Tag = 50
    Left = 120
    Top = 22
    Width = 111
    Height = 21
    HelpContext = 1000
    CharCase = ecUpperCase
    TabOrder = 0
    OnExit = edF_EVENTOExit
  end
  object dtpF_EVENTO: TInterDateTimePicker
    Tag = 50
    Left = 235
    Top = 22
    Width = 21
    Height = 21
    HelpContext = 1002
    CalAlignment = dtaLeft
    Date = 40254.444936875
    Time = 40254.444936875
    DateFormat = dfLong
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
    Edit = edF_EVENTO
    Formato = dfDateTime
  end
  object edF_ENT_CRED: TEdit
    Tag = 18
    Left = 576
    Top = 270
    Width = 81
    Height = 21
    HelpContext = 1800
    CharCase = ecUpperCase
    TabOrder = 9
    OnExit = edF_ENT_CREDExit
  end
  object dtpF_ENT_CRED: TInterDateTimePicker
    Tag = 18
    Left = 658
    Top = 270
    Width = 21
    Height = 21
    HelpContext = 1802
    CalAlignment = dtaLeft
    Date = 40254.444936875
    Time = 40254.444936875
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 10
    Edit = edF_ENT_CRED
    Formato = dfDate
  end
  object edF_LIM_ACLARA: TEdit
    Left = 576
    Top = 294
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    Enabled = False
    ReadOnly = True
    TabOrder = 11
    OnExit = edF_LIM_ACLARAExit
  end
  object dtpF_LIM_ACLARA: TInterDateTimePicker
    Tag = 18
    Left = 658
    Top = 294
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 40046.7527815162
    Time = 40046.7527815162
    Color = clBtnFace
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 12
    Edit = edF_LIM_ACLARA
    Formato = dfDate
  end
  object edF_PROX_EVENTO: TEdit
    Tag = 18
    Left = 576
    Top = 318
    Width = 81
    Height = 21
    HelpContext = 2000
    CharCase = ecUpperCase
    TabOrder = 13
    OnExit = edF_PROX_EVENTOExit
  end
  object dtpF_PROX_EVENTO: TInterDateTimePicker
    Tag = 18
    Left = 658
    Top = 318
    Width = 21
    Height = 21
    HelpContext = 2002
    CalAlignment = dtaLeft
    Date = 40254.444936875
    Time = 40254.444936875
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 14
    Edit = edF_PROX_EVENTO
    Formato = dfDate
  end
  object bImportarCita: TButton
    Left = 8
    Top = 392
    Width = 193
    Height = 25
    Caption = 'Importar datos desde archivo'
    TabOrder = 18
    OnClick = bImportarCitaClick
  end
  object edB_REESTR_VIA: TRadioGroup
    Tag = 18
    Left = 8
    Top = 342
    Width = 193
    Height = 41
    HelpContext = 2100
    Caption = 'Reestructura susceptible'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'n/a'
      'Si'
      'No')
    TabOrder = 15
    OnExit = edB_REESTR_VIAExit
  end
  object PnDatos: TPanel
    Left = 0
    Top = 626
    Width = 697
    Height = 21
    TabOrder = 27
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
    object Label5: TLabel
      Left = 570
      Top = 10
      Width = 95
      Height = 8
      Caption = 'Liberación: 11/06/2010'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object edCVE_CLAS_CRED: TEdit
    Tag = 530
    Left = 216
    Top = 362
    Width = 49
    Height = 21
    HelpContext = 2200
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 16
    OnChange = edCVE_CLAS_CREDChange
    OnExit = edCVE_CLAS_CREDExit
  end
  object btCVE_CLAS_CRED: TBitBtn
    Tag = 18
    Left = 274
    Top = 362
    Width = 21
    Height = 21
    HelpContext = 2202
    TabOrder = 17
    OnClick = btCVE_CLAS_CREDClick
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
  object edDESC_CLAS_CRED: TEdit
    Left = 304
    Top = 360
    Width = 377
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 28
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesNuevo = InterForma1AntesNuevo
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
    Left = 626
    Top = 58
  end
  object ilCVE_CLAS_CRED: TInterLinkit
    Control = edCVE_CLAS_CRED
    OnEjecuta = ilCVE_CLAS_CREDEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 304
    Top = 361
  end
  object pmAcreditado: TPopupMenu
    Left = 308
    Top = 54
    object ConsultaSectorPersona1: TMenuItem
      Caption = 'Acceso a &Persona'
    end
  end
  object odArchivoEntrada: TOpenDialog
    DefaultExt = 'xlsx'
    Filter = '*.xlsx|*.xlsx|*.xls|*.xls'
    Left = 624
    Top = 184
  end
  object ExcelWorksheetI: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 624
    Top = 88
  end
  object ExcelApplicationI: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 624
    Top = 120
  end
  object ExcelWorkbookI: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 624
    Top = 152
  end
  object ExcelWorksheetO: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 656
    Top = 88
  end
  object ExcelWorkbookO: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 656
    Top = 152
  end
  object ExcelApplicationO: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 656
    Top = 120
  end
  object ilID_CREDITO: TInterLinkit
    Control = edID_CREDITO
    OnEjecuta = ilID_CREDITOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 240
    Top = 49
  end
end
