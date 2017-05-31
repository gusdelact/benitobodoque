object wMDispSieb: TwMDispSieb
  Left = 94
  Top = 108
  Width = 679
  Height = 361
  Caption = 'Captura de Estímulo SIEBAN por Disposición'
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
  object Label23: TLabel
    Left = 478
    Top = 75
    Width = 77
    Height = 13
    Caption = 'Imp. Disposición'
  end
  object Label1: TLabel
    Left = 0
    Top = 88
    Width = 111
    Height = 26
    Caption = 'Porcentaje de SIEBAN Estimado '
    WordWrap = True
  end
  object Label2: TLabel
    Left = 0
    Top = 117
    Width = 107
    Height = 13
    Caption = 'Porcentaje a Compartir'
  end
  object Label3: TLabel
    Left = 235
    Top = 117
    Width = 97
    Height = 13
    Caption = 'Porcentaje al INICIO'
  end
  object Label4: TLabel
    Left = 460
    Top = 117
    Width = 95
    Height = 13
    Caption = 'Porcentaje al FINAL'
  end
  object Label12: TLabel
    Left = 0
    Top = 54
    Width = 54
    Height = 13
    Caption = 'Disposición'
  end
  object lbUSUA_MODIF: TLabel
    Left = 235
    Top = 246
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object lbUSUA_ALTA: TLabel
    Left = 25
    Top = 243
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object lbF_MODIF: TLabel
    Left = 235
    Top = 267
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object lbF_ALTA: TLabel
    Left = 25
    Top = 264
    Width = 51
    Height = 13
    Caption = 'Fecha Alta'
  end
  object Label5: TLabel
    Left = 0
    Top = 75
    Width = 53
    Height = 13
    Caption = 'No. Control'
  end
  object Label8: TLabel
    Left = 300
    Top = 75
    Width = 32
    Height = 13
    Caption = 'Id. Fira'
  end
  object PnlMsg: TPanel
    Left = 0
    Top = 288
    Width = 670
    Height = 21
    TabOrder = 18
  end
  object PnDatos: TPanel
    Left = 0
    Top = 309
    Width = 670
    Height = 21
    TabOrder = 19
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
      Left = 306
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
      Left = 306
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
      Left = 370
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
      Left = 370
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
  object icpCONTRATO: TInterCtoPanel
    Tag = 50
    Left = 0
    Top = 0
    Width = 609
    Height = 45
    Hint = 'Información del Contrato'
    Lenguaje = 0
    ShowLenguaje = False
    ShowEnviarEMail = False
  end
  object edIMP_DISPOSICION: TInterEdit
    Left = 565
    Top = 71
    Width = 105
    Height = 21
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 6
    ReadOnly = True
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 136
    Width = 670
    Height = 68
    HelpContext = 2000
    Caption = 'REAL'
    TabOrder = 11
    object Label7: TLabel
      Left = 3
      Top = 47
      Width = 91
      Height = 13
      Caption = 'Importe a Compartir'
    end
    object Label10: TLabel
      Left = 235
      Top = 47
      Width = 81
      Height = 13
      Caption = 'Importe al INICIO'
    end
    object Label11: TLabel
      Left = 460
      Top = 47
      Width = 79
      Height = 13
      Caption = 'Importe al FINAL'
    end
    object Label6: TLabel
      Left = 3
      Top = 16
      Width = 89
      Height = 26
      Caption = 'Importe SIEBAN    (con I.V.A.)'
      WordWrap = True
    end
    object Label9: TLabel
      Left = 235
      Top = 16
      Width = 108
      Height = 26
      Caption = 'Porcentaje de SIEBAN APLICADO'
      WordWrap = True
    end
    object Label16: TLabel
      Left = 460
      Top = 20
      Width = 85
      Height = 13
      Caption = 'Fecha Recepción'
    end
    object edIMP_COMPARTIR: TInterEdit
      Left = 120
      Top = 43
      Width = 105
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 3
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_INICIO: TInterEdit
      Left = 347
      Top = 43
      Width = 105
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 4
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_FINAL: TInterEdit
      Left = 560
      Top = 43
      Width = 105
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,###,##0.00'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 5
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_SIEBAN: TInterEdit
      Tag = 18
      Left = 120
      Top = 16
      Width = 105
      Height = 21
      HelpContext = 2001
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edIMP_SIEBANExit
      DisplayMask = '###,###,###,###,###,##0.00'
      MaxLength = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 0
      UseReType = True
      UseSep = True
      UseDisplay = False
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edPCT_REAL: TInterEdit
      Left = 347
      Top = 16
      Width = 105
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,##0.0000'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 1
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edF_RECEPCION: TEdit
      Left = 560
      Top = 16
      Width = 85
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object dtpF_RECEPCION: TInterDateTimePicker
      Tag = 18
      Left = 645
      Top = 15
      Width = 20
      Height = 22
      CalAlignment = dtaLeft
      Date = 37554.5731407176
      Time = 37554.5731407176
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 6
      TabStop = False
      Edit = edF_RECEPCION
      Formato = dfDate
    end
  end
  object edPCT_COMPARTIR: TInterEdit
    Tag = 18
    Left = 120
    Top = 113
    Width = 105
    Height = 21
    HelpContext = 1100
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_COMPARTIRExit
    DisplayMask = '###,##0.0000'
    MaxLength = 8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 8
    UseReType = False
    UseSep = True
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edPCT_ESTIMADO: TInterEdit
    Left = 120
    Top = 92
    Width = 105
    Height = 21
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,##0.0000'
    MaxLength = 12
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 7
    ReadOnly = True
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edPCT_INICIO: TInterEdit
    Tag = 18
    Left = 347
    Top = 113
    Width = 105
    Height = 21
    HelpContext = 1110
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_INICIOExit
    DisplayMask = '###,##0.0000'
    MaxLength = 8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 9
    UseReType = False
    UseSep = True
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edPCT_FINAL: TInterEdit
    Tag = 18
    Left = 565
    Top = 113
    Width = 105
    Height = 21
    HelpContext = 1111
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_FINALExit
    DisplayMask = '###,##0.0000'
    MaxLength = 8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 10
    UseReType = False
    UseSep = True
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object btCREDITO: TBitBtn
    Tag = 50
    Left = 225
    Top = 50
    Width = 21
    Height = 21
    HelpContext = 1001
    TabOrder = 2
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
  object edNOM_CREDITO: TEdit
    Left = 248
    Top = 50
    Width = 422
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
    Text = 'CLIENTE S.A. DE C.V.'
  end
  object rgSIT_REL_DISP_SIE: TRadioGroup
    Left = 0
    Top = 205
    Width = 670
    Height = 34
    Caption = 'Situación de SIEBAN'
    Columns = 5
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Facturado'
      'Devuelto al inicio'
      'Devuelto Total'
      'Cancelado')
    TabOrder = 12
    OnExit = rgSIT_REL_DISP_SIEExit
  end
  object btCANCELA_ESTIMULO: TBitBtn
    Tag = 17
    Left = 464
    Top = 241
    Width = 206
    Height = 22
    Caption = 'Cancelación de Estímulo SIEBAN'
    TabOrder = 17
    OnClick = btCANCELA_ESTIMULOClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333333333333333333FFF33FF333FFF339993370733
      999333777FF37FF377733339993000399933333777F777F77733333399970799
      93333333777F7377733333333999399933333333377737773333333333990993
      3333333333737F73333333333331013333333333333777FF3333333333910193
      333333333337773FF3333333399000993333333337377737FF33333399900099
      93333333773777377FF333399930003999333337773777F777FF339993370733
      9993337773337333777333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object edCVE_USUA_MODIF: TEdit
    Left = 347
    Top = 242
    Width = 105
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 14
  end
  object edCVE_USUA_ALTA: TEdit
    Left = 120
    Top = 242
    Width = 105
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 13
  end
  object edF_MODIFICA: TEdit
    Left = 347
    Top = 263
    Width = 105
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 16
  end
  object edF_ALTA: TEdit
    Left = 120
    Top = 263
    Width = 105
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 15
  end
  object edF_FACTURACION: TEdit
    Left = 509
    Top = 263
    Width = 41
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 21
    Visible = False
  end
  object edID_FACTURA: TEdit
    Left = 557
    Top = 263
    Width = 41
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 22
    Visible = False
  end
  object edID_CREDITO: TEdit
    Tag = 562
    Left = 120
    Top = 50
    Width = 105
    Height = 21
    HelpContext = 1000
    Color = clInfoBk
    TabOrder = 1
    OnExit = edID_CREDITOExit
  end
  object gbFOLIO: TGroupBox
    Left = 616
    Top = -1
    Width = 55
    Height = 46
    HelpContext = 1101
    Caption = 'Folio '
    TabOrder = 0
    object lbID_SOLICITUD: TLabel
      Tag = 50
      Left = 4
      Top = 18
      Width = 47
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
  end
  object edNUM_CONTROL: TEdit
    Left = 120
    Top = 71
    Width = 161
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object edID_FIRA: TInterEdit
    Left = 347
    Top = 71
    Width = 105
    Height = 21
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    MaxLength = 10
    Color = clBtnFace
    TabOrder = 5
    ReadOnly = True
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
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
    FormaEstilo = feVertical
    CanEdit = False
    IsNewData = False
    OnBtnModificarClick = InterForma1BtnModificarClick
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    OnDespuesShow = InterForma1DespuesShow
    Left = 419
    Top = 5
  end
  object ilID_CREDITO: TInterLinkit
    Control = edID_CREDITO
    OnEjecuta = ilID_CREDITOEjecuta
    TipoReader = trEntero
    CharCase = ecNormal
    OnCapture = ilID_CREDITOCapture
    Left = 260
    Top = 41
  end
end
