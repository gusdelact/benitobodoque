object WCrAutExAc: TWCrAutExAc
  Left = 303
  Top = 179
  Width = 617
  Height = 452
  Caption = 'Autorizaciones a Incrementar / Decrementar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbID_CREDITO: TLabel
    Left = 2
    Top = 3
    Width = 51
    Height = 13
    Alignment = taCenter
    Caption = 'Acreditado'
  end
  object Label23: TLabel
    Left = 19
    Top = 89
    Width = 59
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Autorizac.'
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
    Left = 411
    Top = 89
    Width = 85
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Disponible'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label7: TLabel
    Left = 1
    Top = 89
    Width = 18
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Apl.'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 79
    Top = 89
    Width = 157
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Producto'
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
    Left = 237
    Top = 89
    Width = 86
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Autorizado'
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
    Left = 324
    Top = 89
    Width = 85
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Dispuesto'
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
    Left = 497
    Top = 89
    Width = 108
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Moneda'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lbID_CONTRATO: TLabel
    Left = 113
    Top = 4
    Width = 58
    Height = 13
    Alignment = taCenter
    Caption = 'Autorización'
  end
  object lbF_INI_EXCESO: TLabel
    Left = 3
    Top = 67
    Width = 58
    Height = 13
    Caption = 'Fecha Inicio'
  end
  object lbF_VTO_EXCESO: TLabel
    Left = 396
    Top = 68
    Width = 91
    Height = 13
    Caption = 'Fecha Vencimiento'
  end
  object Label9: TLabel
    Left = 396
    Top = 46
    Width = 93
    Height = 13
    Caption = 'Tipo de Movimiento'
  end
  object Label10: TLabel
    Left = 3
    Top = 44
    Width = 35
    Height = 13
    Caption = 'Importe'
  end
  object lblPesos: TLabel
    Left = 186
    Top = 45
    Width = 29
    Height = 13
    Caption = 'Pesos'
  end
  object lbNOMBRE: TLabel
    Left = 213
    Top = 4
    Width = 108
    Height = 13
    Alignment = taCenter
    Caption = 'Nombre del Acreditado'
  end
  object edID_ACREDITADO: TEdit
    Tag = 562
    Left = 3
    Top = 18
    Width = 108
    Height = 21
    TabStop = False
    BiDiMode = bdLeftToRight
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 4
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 6
  end
  object PnDatos: TPanel
    Left = -1
    Top = 396
    Width = 607
    Height = 21
    TabOrder = 11
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
  object edNOMBRE: TEdit
    Left = 212
    Top = 18
    Width = 392
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
  end
  object sgcDATOS: TSGCtrl
    Tag = 17
    Left = -1
    Top = 103
    Width = 607
    Height = 219
    HelpContext = 1400
    ShowTab = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    TabStop = True
    TabOrder = 9
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnDblClick = sgcDATOSDblClick
    object btAPLICA_INCRE: TBitBtn
      Tag = 17
      Left = 397
      Top = 195
      Width = 208
      Height = 20
      HelpContext = 1
      Caption = 'Realizar || Indicado(s)'
      TabOrder = 2
      TabStop = False
      OnClick = btAPLICA_INCREClick
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
  end
  object MErrores: TMemo
    Left = 0
    Top = 320
    Width = 606
    Height = 56
    TabStop = False
    Color = clInfoBk
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 10
  end
  object edID_CONTRATO: TEdit
    Tag = 562
    Left = 112
    Top = 18
    Width = 99
    Height = 21
    TabStop = False
    BiDiMode = bdLeftToRight
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 4
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 7
  end
  object edIMP_EXCESO_EVE: TInterEdit
    Tag = 17
    Left = 70
    Top = 41
    Width = 109
    Height = 21
    HelpContext = 1000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 0
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object cbCVE_AFEC_INC_DEC: TComboBox
    Tag = 17
    Left = 496
    Top = 41
    Width = 109
    Height = 21
    HelpContext = 1100
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = cbCVE_AFEC_INC_DECChange
    Items.Strings = (
      'Incremento'
      'Decremento')
  end
  object dtpF_INI_EXCESO: TEdit
    Tag = 17
    Left = 70
    Top = 63
    Width = 90
    Height = 21
    HelpContext = 1200
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object btF_INI_EXCESO: TInterDateTimePicker
    Tag = 17
    Left = 161
    Top = 64
    Width = 21
    Height = 21
    HelpContext = 1201
    CalAlignment = dtaLeft
    Date = 37781.35659625
    Time = 37781.35659625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
    TabStop = False
    Edit = dtpF_INI_EXCESO
    Formato = dfDate
  end
  object dtpF_VTO_EXCESO: TEdit
    Tag = 17
    Left = 496
    Top = 64
    Width = 89
    Height = 21
    HelpContext = 1300
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object btF_VTO_EXCESO: TInterDateTimePicker
    Tag = 17
    Left = 585
    Top = 65
    Width = 21
    Height = 21
    HelpContext = 1301
    CalAlignment = dtaLeft
    Date = 37781.35659625
    Time = 37781.35659625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 5
    TabStop = False
    Edit = dtpF_VTO_EXCESO
    Formato = dfDate
  end
  object MsgPanel: TPanel
    Left = -17
    Top = 375
    Width = 623
    Height = 21
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
    Left = 535
    Top = 346
  end
end
