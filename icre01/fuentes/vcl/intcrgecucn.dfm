object WCrGenCuotaCn: TWCrGenCuotaCn
  Left = 303
  Top = 193
  Width = 715
  Height = 451
  Caption = 'Configuración de cuotas de comisión por plan de pago'
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
  object Label22: TLabel
    Left = 8
    Top = 341
    Width = 91
    Height = 13
    Caption = 'Fecha Vencimiento'
  end
  object lbIMP_CREDITO: TLabel
    Left = 246
    Top = 341
    Width = 80
    Height = 13
    Caption = 'Importe Comisión'
  end
  object Label6: TLabel
    Left = 8
    Top = 365
    Width = 143
    Height = 13
    Caption = 'Total de Periodos de Comisión'
  end
  object lbTOT_PER_COM: TLabel
    Left = 214
    Top = 365
    Width = 8
    Height = 13
    Alignment = taRightJustify
    Caption = '0'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lbFiltro: TLabel
    Left = 8
    Top = 9
    Width = 50
    Height = 14
    Caption = 'Accesorio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbCVE_COMISION: TLabel
    Left = 8
    Top = 32
    Width = 42
    Height = 13
    Caption = 'Comision'
  end
  object Label4: TLabel
    Left = 246
    Top = 365
    Width = 62
    Height = 13
    Caption = 'IVA Comisión'
  end
  object PnDatos: TPanel
    Left = 0
    Top = 394
    Width = 705
    Height = 18
    TabOrder = 12
    object lbEmpresa: TLabel
      Left = 11
      Top = 1
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
      Top = 8
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
      Left = 360
      Top = 1
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
      Left = 360
      Top = 8
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
      Top = 8
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
      Left = 424
      Top = 8
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
      Left = 424
      Top = 1
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
      Top = 1
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
  object edF_VENCIMIENTO: TEdit
    Left = 125
    Top = 337
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 4
    OnExit = edF_VENCIMIENTOExit
  end
  object dtF_VENCIMIENTO: TInterDateTimePicker
    Left = 202
    Top = 337
    Width = 20
    Height = 21
    CalAlignment = dtaLeft
    Date = 37777.7691627546
    Time = 37777.7691627546
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 5
    TabStop = False
    OnExit = dtF_VENCIMIENTOExit
    Edit = edF_VENCIMIENTO
    Formato = dfDate
  end
  object btACEPTA: TBitBtn
    Left = 496
    Top = 336
    Width = 96
    Height = 22
    Caption = 'Aceptar'
    Enabled = False
    TabOrder = 8
    OnClick = btACEPTAClick
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
  object btCANCELA: TBitBtn
    Left = 605
    Top = 336
    Width = 96
    Height = 22
    Caption = '&Cancela'
    Enabled = False
    TabOrder = 9
    OnClick = btCANCELAClick
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
  object edIMP_COMISION: TInterEdit
    Left = 336
    Top = 337
    Width = 89
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_COMISIONExit
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    TabOrder = 6
    Enabled = False
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object SGClBusMovNoAut: TSGCtrl
    Left = 0
    Top = 53
    Width = 704
    Height = 281
    ShowTab = True
    TabOrder = 11
    PopupMenu = PopupMenu1
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
  end
  object btVALIDA_TABLA: TBitBtn
    Left = 496
    Top = 361
    Width = 205
    Height = 21
    Caption = 'Autoriza plan de pagos'
    TabOrder = 10
    OnClick = btVALIDA_TABLAClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
      FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
      00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
      F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
      00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
      F033777777777337F73309999990FFF0033377777777FFF77333099999000000
      3333777777777777333333399033333333333337773333333333333903333333
      3333333773333333333333303333333333333337333333333333}
    NumGlyphs = 2
    Spacing = 6
  end
  object edDESC_ACCESORIO: TEdit
    Left = 181
    Top = 6
    Width = 523
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 1
  end
  object edID_ACCESORIO: TEdit
    Left = 87
    Top = 6
    Width = 89
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 0
  end
  object edCVE_COMISION: TEdit
    Left = 87
    Top = 28
    Width = 89
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 2
  end
  object edDESC_COMISION: TEdit
    Left = 181
    Top = 28
    Width = 523
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
  end
  object edIMP_IVA: TInterEdit
    Left = 336
    Top = 361
    Width = 89
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    Color = clBtnFace
    TabOrder = 7
    Enabled = False
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
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
    Left = 474
    Top = 90
  end
  object PopupMenu1: TPopupMenu
    Left = 232
    Top = 139
    object AgregarPeriodo1: TMenuItem
      Caption = 'Agregar Periodo'
      OnClick = AgregarPeriodo1Click
    end
    object BorrarPeriodo1: TMenuItem
      Caption = 'Borrar Periodo'
      OnClick = BorrarPeriodo1Click
    end
    object ModificarMonto1: TMenuItem
      Caption = 'Modificar Período'
      OnClick = ModificarMonto1Click
    end
  end
end
