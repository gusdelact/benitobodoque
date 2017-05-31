object WCrGenVto: TWCrGenVto
  Left = 245
  Top = 56
  Width = 741
  Height = 619
  Caption = 'Generacion de Vencimientos de Documentos'
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
    Left = 584
    Top = 6
    Width = 32
    Height = 13
    Caption = 'Cesion'
  end
  object lbID_CONTRATO: TLabel
    Left = 7
    Top = 6
    Width = 112
    Height = 13
    Caption = 'Autorización / Producto'
  end
  object Label22: TLabel
    Left = 10
    Top = 541
    Width = 74
    Height = 13
    Caption = 'Fecha Vto. Per.'
  end
  object lbIMP_CREDITO: TLabel
    Left = 222
    Top = 541
    Width = 96
    Height = 13
    Caption = 'Importe Vencimiento'
  end
  object Bevel1: TBevel
    Left = 0
    Top = 469
    Width = 705
    Height = 2
  end
  object Label1: TLabel
    Left = 8
    Top = 498
    Width = 133
    Height = 13
    Caption = 'Total de Periodos de Interés'
  end
  object lbTOT_PER_INT: TLabel
    Left = 206
    Top = 498
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
  object Label3: TLabel
    Left = 248
    Top = 498
    Width = 133
    Height = 13
    Caption = 'Total de Periodos de Capital'
  end
  object Label6: TLabel
    Left = 488
    Top = 498
    Width = 143
    Height = 13
    Caption = 'Total de Periodos de Comisión'
  end
  object lbTOT_PER_CAP: TLabel
    Left = 454
    Top = 498
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
  object lbTOT_PER_COM: TLabel
    Left = 694
    Top = 498
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
  object Label11: TLabel
    Left = 9
    Top = 515
    Width = 77
    Height = 13
    Caption = 'Imp. Disposición'
  end
  object Label2: TLabel
    Left = 249
    Top = 515
    Width = 112
    Height = 13
    Caption = 'Importe Total de Capital'
  end
  object lbTOT_IMP_CAP: TLabel
    Left = 454
    Top = 515
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
  object lbIMP_DISP: TLabel
    Left = 206
    Top = 515
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
  object Label10: TLabel
    Left = 488
    Top = 515
    Width = 76
    Height = 13
    Caption = 'Importe Faltante'
  end
  object lbIMP_FALTANTE: TLabel
    Left = 694
    Top = 515
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
  object textIMPORTE_CESION: TLabel
    Left = 7
    Top = 30
    Width = 70
    Height = 13
    Caption = 'Importe Cesion'
  end
  object text_AJ_ULTIMO_PER: TLabel
    Left = 212
    Top = 30
    Width = 83
    Height = 13
    Caption = 'Ajuste Ultimo Per.'
  end
  object textFVencimiento: TLabel
    Left = 387
    Top = 30
    Width = 76
    Height = 13
    Caption = 'Fecha Vto. Ces.'
  end
  object PnDatos: TPanel
    Left = 0
    Top = 562
    Width = 705
    Height = 18
    TabOrder = 11
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
  object SGClBusMovNoAut: TSGCtrl
    Left = 0
    Top = 48
    Width = 704
    Height = 446
    OnCalcRow = SGClBusMovNoAutCalcRow
    ShowTab = True
    TabOrder = 4
    PopupMenu = PopupMenu1
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
  end
  object edID_CREDITO: TEdit
    Left = 628
    Top = 2
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object iedID_CONTRATO: TInterEdit
    Tag = 562
    Left = 121
    Top = 2
    Width = 87
    Height = 21
    HelpContext = 1001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trContrato
    MaxLength = 12
    Color = clBtnFace
    TabOrder = 0
    ReadOnly = True
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edCVE_PRODUCTO: TEdit
    Left = 208
    Top = 2
    Width = 89
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object edDESC_PRODUCTO: TEdit
    Left = 296
    Top = 2
    Width = 257
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
  end
  object edF_INICIO: TEdit
    Left = 119
    Top = 537
    Width = 76
    Height = 21
    HelpContext = 4001
    Enabled = False
    TabOrder = 7
  end
  object dtpF_INICIO: TInterDateTimePicker
    Left = 199
    Top = 537
    Width = 20
    Height = 21
    HelpContext = 4002
    CalAlignment = dtaLeft
    Date = 37777.7691627546
    Time = 37777.7691627546
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 8
    TabStop = False
    Edit = edF_INICIO
    Formato = dfDate
  end
  object btAGREGA_CUOTA: TBitBtn
    Tag = 17
    Left = 456
    Top = 536
    Width = 241
    Height = 22
    Caption = 'Aplicar Cambios'
    Enabled = False
    TabOrder = 10
    OnClick = btAGREGA_CUOTAClick
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
  object btREINICIA_TABLA: TBitBtn
    Left = 496
    Top = 469
    Width = 205
    Height = 21
    Caption = 'Re Inicia Tabla de Amortización'
    TabOrder = 6
    OnClick = btREINICIA_TABLAClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF5555555555555A055555
      55555555588FF55555555555AAA05555555555558888F55555555555AAA05555
      555555558888FF555555555AAAAA05555555555888888F55555555AAAAAA0555
      5555558888888FF5555558AA05AAA05555555888858888F555558A05555AA055
      55558885555888FF55555555555AAA05555555555558888F555555555555AA05
      555555555555888FF555555555555AA05555555555555888FF5555555555558A
      05555555555555888FF5555555555558A05555555555555888FF555555555555
      5AA0555555555555588855555555555555555555555555555555}
    NumGlyphs = 2
  end
  object btVALIDA_TABLA: TBitBtn
    Tag = 17
    Left = 285
    Top = 469
    Width = 205
    Height = 21
    Caption = 'Valida Tabla de Amortización'
    TabOrder = 5
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
  object edIMP_CREDITO: TInterEdit
    Left = 320
    Top = 537
    Width = 89
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    TabOrder = 9
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object BitBtn1: TBitBtn
    Left = 576
    Top = 24
    Width = 125
    Height = 21
    Caption = 'Genera Tabla'
    TabOrder = 12
    OnClick = BitBtn1Click
    Glyph.Data = {
      42010000424D4201000000000000760000002800000011000000110000000100
      040000000000CC00000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDD0000000DDDDDDDDDDDDDDDDD0000000D444444444444444D0000000D4FF
      FFFFFFFFFFF4D0000000D4F000F000F000F4D0000000D4FFFFFFFFFFFFF4D000
      0000D4F000F000F000F4D0000000D4FFFFFFFFFFFFF4D0000000D4F000F000F0
      00F4D0000000D4FFFFFFFFFFFFF4D0000000D4F000F000F000F4D0000000D4FF
      FFFFFFFFFFF4D0000000D444444444444444D0000000D4F444F444F444F4D000
      0000D444444444444444D0000000DDDDDDDDDDDDDDDDD0000000DDDDDDDDDDDD
      DDDDD0000000}
  end
  object edF_VENCIMIENTO: TEdit
    Tag = 18
    Left = 463
    Top = 24
    Width = 67
    Height = 21
    HelpContext = 4201
    TabOrder = 13
  end
  object dtpF_VENCIMIENTO: TInterDateTimePicker
    Tag = 18
    Left = 533
    Top = 24
    Width = 22
    Height = 21
    HelpContext = 4202
    CalAlignment = dtaLeft
    Date = 37777.7691627546
    Time = 37777.7691627546
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 14
    TabStop = False
    Edit = edF_VENCIMIENTO
    Formato = dfDate
  end
  object edIMPORTE_CESION: TInterEdit
    Tag = 18
    Left = 121
    Top = 24
    Width = 87
    Height = 21
    HelpContext = 7001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMPORTE_CESIONExit
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 15
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edAJU_ULTIMO_PER: TInterEdit
    Left = 296
    Top = 24
    Width = 90
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edAJU_ULTIMO_PERExit
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 16
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    msgSinRegistros = 'No existe un Registro para realizar la operación.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = '¿Desea Eliminar el Registro Actual?'
    CanEdit = False
    IsNewData = False
    ShowBtnAceptar = False
    ShowBtnEliminar = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowBtnBuscar = False
    ShowBtnAyuda = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    OnDespuesShow = InterForma1DespuesShow
    Left = 358
    Top = 142
  end
  object PopupMenu1: TPopupMenu
    Left = 320
    Top = 243
    object AgregarPeriodo1: TMenuItem
      Caption = 'Agregar Periodo de Capital'
      Enabled = False
      OnClick = AgregarPeriodo1Click
    end
    object BorrarPeriodo1: TMenuItem
      Caption = 'Borrar Periodo de Capital'
      Enabled = False
      OnClick = BorrarPeriodo1Click
    end
    object ModificarMonto1: TMenuItem
      Caption = 'Modificar Monto de Capital'
      Enabled = False
      OnClick = ModificarMonto1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'CSV (MSDOS) (*.csv)|*.csv|Todos los archivos|*.*'
    Left = 360
    Top = 248
  end
end
