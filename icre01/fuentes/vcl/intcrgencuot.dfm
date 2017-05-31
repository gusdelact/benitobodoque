object WCrgencuota: TWCrgencuota
  Left = 330
  Top = 57
  Width = 732
  Height = 675
  Caption = 'Simulador de Cuotas de Crédito'
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
    Left = 568
    Top = 6
    Width = 54
    Height = 13
    Caption = 'Disposición'
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
    Top = 453
    Width = 91
    Height = 13
    Caption = 'Fecha Vencimiento'
  end
  object lbIMP_CREDITO: TLabel
    Left = 222
    Top = 453
    Width = 66
    Height = 13
    Caption = 'Importe Cuota'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 437
    Width = 705
    Height = 2
  end
  object Label1: TLabel
    Left = 8
    Top = 402
    Width = 133
    Height = 13
    Caption = 'Total de Periodos de Interés'
  end
  object lbTOT_PER_INT: TLabel
    Left = 206
    Top = 402
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
    Top = 402
    Width = 133
    Height = 13
    Caption = 'Total de Periodos de Capital'
  end
  object Label6: TLabel
    Left = 488
    Top = 402
    Width = 143
    Height = 13
    Caption = 'Total de Periodos de Comisión'
  end
  object lbTOT_PER_CAP: TLabel
    Left = 454
    Top = 402
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
    Top = 402
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
    Top = 419
    Width = 77
    Height = 13
    Caption = 'Imp. Disposición'
  end
  object Label2: TLabel
    Left = 249
    Top = 419
    Width = 112
    Height = 13
    Caption = 'Importe Total de Capital'
  end
  object lbTOT_IMP_CAP: TLabel
    Left = 454
    Top = 419
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
    Top = 419
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
    Top = 419
    Width = 76
    Height = 13
    Caption = 'Importe Faltante'
  end
  object lbIMP_FALTANTE: TLabel
    Left = 694
    Top = 419
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
  object GroupBox2: TGroupBox
    Left = 1
    Top = 107
    Width = 702
    Height = 46
    Caption = 'Datos de la disposición'
    TabOrder = 6
    object Label9: TLabel
      Left = 134
      Top = 21
      Width = 118
      Height = 13
      Caption = 'F Fin Periodo Gracia F.A.'
      Visible = False
    end
    object Rtfinan: TRadioGroup
      Left = 347
      Top = 8
      Width = 201
      Height = 33
      Caption = 'Tipo de Financiamiento Adicional'
      Columns = 2
      Enabled = False
      Items.Strings = (
        'Directo (DR)'
        'Prorrateo (PR)')
      TabOrder = 0
      OnClick = RtfinanClick
    end
    object cbAllFA: TCheckBox
      Left = 552
      Top = 21
      Width = 146
      Height = 17
      HelpContext = 2300
      Alignment = taLeftJustify
      Caption = 'Modificar todos los periodos'
      TabOrder = 1
      OnClick = cbAllFAClick
    end
    object edF_FIN_PERGRA_FA: TEdit
      Left = 258
      Top = 17
      Width = 80
      Height = 21
      HelpContext = 2301
      Color = clBtnFace
      Enabled = False
      TabOrder = 2
    end
  end
  object PnDatos: TPanel
    Left = 0
    Top = 610
    Width = 705
    Height = 18
    TabOrder = 15
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
    Top = 160
    Width = 704
    Height = 241
    OnCalcRow = SGClBusMovNoAutCalcRow
    ShowTab = True
    TabOrder = 7
    PopupMenu = PopupMenu1
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnDblClick = SGClBusMovNoAutDblClick
    OnMoveRow = SGClBusMovNoAutMoveRow
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
    Left = 137
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
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edCVE_PRODUCTO: TEdit
    Left = 226
    Top = 2
    Width = 87
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object edDESC_PRODUCTO: TEdit
    Left = 315
    Top = 2
    Width = 250
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
  end
  object GroupBox3: TGroupBox
    Left = 1
    Top = 23
    Width = 349
    Height = 84
    Caption = 'Amortizaciones'
    TabOrder = 4
    object Label4: TLabel
      Left = 4
      Top = 38
      Width = 87
      Height = 13
      Caption = 'Unidad de Tiempo'
    end
    object Label5: TLabel
      Left = 6
      Top = 62
      Width = 61
      Height = 13
      Caption = 'Día de Pago'
    end
    object Label13: TLabel
      Left = 187
      Top = 62
      Width = 66
      Height = 13
      Caption = 'F Primer Pago'
    end
    object Label19: TLabel
      Left = 189
      Top = 38
      Width = 62
      Height = 13
      Caption = 'No Unidades'
    end
    object lbCVE_AMORTIZACION: TLabel
      Left = 3
      Top = 15
      Width = 60
      Height = 13
      Caption = 'Amortización'
    end
    object edCVE_AMORTIZACION: TEdit
      Tag = 530
      Left = 95
      Top = 11
      Width = 26
      Height = 21
      HelpContext = 7101
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 0
    end
    object edDESC_TIPO_AMORT: TEdit
      Left = 120
      Top = 11
      Width = 226
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edF_INI_PAG_CAP: TEdit
      Tag = 18
      Left = 266
      Top = 58
      Width = 80
      Height = 21
      HelpContext = 7501
      Color = clBtnFace
      TabOrder = 2
    end
    object edNUM_UNIDADES_CP: TInterEdit
      Tag = 18
      Left = 266
      Top = 34
      Width = 80
      Height = 21
      HelpContext = 7301
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      DisplayMask = '####0'
      MaxLength = 5
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 1
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object cbUNIDAD_TIEMPO_CP: TEdit
      Tag = 530
      Left = 95
      Top = 33
      Width = 88
      Height = 21
      HelpContext = 7101
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 4
    end
    object cbDIA_PAGO_CAP: TInterEdit
      Tag = 18
      Left = 95
      Top = 58
      Width = 87
      Height = 21
      HelpContext = 7301
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      DisplayMask = '####0'
      MaxLength = 5
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 5
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object GroupBox1: TGroupBox
    Left = 348
    Top = 23
    Width = 356
    Height = 84
    Caption = 'Interés'
    TabOrder = 5
    object lbCVE_PAG_INTERES: TLabel
      Left = 4
      Top = 13
      Width = 86
      Height = 13
      Caption = 'Pago de Intereses'
    end
    object Label7: TLabel
      Left = 4
      Top = 36
      Width = 87
      Height = 13
      Caption = 'Unidad de Tiempo'
    end
    object Label20: TLabel
      Left = 184
      Top = 36
      Width = 62
      Height = 13
      Caption = 'No Unidades'
    end
    object Label8: TLabel
      Left = 7
      Top = 60
      Width = 61
      Height = 13
      Caption = 'Día de Pago'
    end
    object Label14: TLabel
      Left = 184
      Top = 60
      Width = 66
      Height = 13
      Caption = 'F Primer Pago'
    end
    object edCVE_PAG_INTERES: TEdit
      Tag = 530
      Left = 94
      Top = 9
      Width = 27
      Height = 21
      HelpContext = 8001
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 0
    end
    object edDESC_PAGO_INT: TEdit
      Left = 120
      Top = 9
      Width = 233
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edNUM_UNIDADES_IN: TInterEdit
      Tag = 18
      Left = 274
      Top = 32
      Width = 79
      Height = 21
      HelpContext = 8201
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      DisplayMask = '####0'
      MaxLength = 5
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 2
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edF_INI_PAG_INT: TEdit
      Tag = 18
      Left = 274
      Top = 56
      Width = 79
      Height = 21
      HelpContext = 8401
      Color = clBtnFace
      TabOrder = 3
    end
    object cbUNIDAD_TIEMPO_IN: TEdit
      Tag = 530
      Left = 94
      Top = 33
      Width = 88
      Height = 21
      HelpContext = 7101
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 4
    end
    object cbDIA_PAGO_INT: TInterEdit
      Tag = 18
      Left = 94
      Top = 58
      Width = 87
      Height = 21
      HelpContext = 7301
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      DisplayMask = '####0'
      MaxLength = 5
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 5
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object edF_INICIO: TEdit
    Left = 119
    Top = 449
    Width = 76
    Height = 21
    HelpContext = 4001
    Enabled = False
    TabOrder = 10
  end
  object dtpF_INICIO: TInterDateTimePicker
    Left = 199
    Top = 449
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
    TabOrder = 11
    TabStop = False
    Edit = edF_INICIO
    Formato = dfDate
  end
  object btAGREGA_CUOTA: TBitBtn
    Tag = 17
    Left = 496
    Top = 448
    Width = 204
    Height = 22
    Caption = 'Agregar Cuota'
    Enabled = False
    TabOrder = 14
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
    Top = 373
    Width = 205
    Height = 21
    Caption = 'Re Inicia Tabla de Amortización'
    TabOrder = 9
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
    Top = 373
    Width = 205
    Height = 21
    Caption = 'Valida Tabla de Amortización'
    TabOrder = 8
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
  object btCANCELA: TBitBtn
    Tag = 17
    Left = 393
    Top = 448
    Width = 96
    Height = 22
    Caption = '&Cancela'
    TabOrder = 13
    Visible = False
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
  object edIMP_CREDITO: TInterEdit
    Left = 296
    Top = 449
    Width = 89
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    TabOrder = 12
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 480
    Width = 697
    Height = 129
    Caption = 'Carga Masiva de Cuotas'
    TabOrder = 16
    object lbArchivoEntrada: TLabel
      Left = 16
      Top = 60
      Width = 148
      Height = 13
      Caption = 'Nombre del Archivo de Entrada'
    end
    object sbArchivoEntrada: TSpeedButton
      Left = 362
      Top = 75
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
      OnClick = sbArchivoEntradaClick
    end
    object Label32: TLabel
      Left = 652
      Top = 10
      Width = 37
      Height = 7
      Caption = 'V20140801'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object edArchivoEntrada: TEdit
      Tag = 50
      Left = 17
      Top = 76
      Width = 344
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = edArchivoEntradaExit
    end
    object bbImportar: TBitBtn
      Left = 400
      Top = 72
      Width = 113
      Height = 25
      Caption = 'Importar'
      TabOrder = 1
      OnClick = bbImportarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
    end
    object pAniBar: TPanel
      Left = 16
      Top = 104
      Width = 665
      Height = 17
      TabOrder = 2
    end
    object Rcarga: TRadioGroup
      Left = 320
      Top = 16
      Width = 305
      Height = 33
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Montos'
        'F, Programadas'
        'Ambas')
      TabOrder = 3
    end
    object Rconcepto: TRadioGroup
      Left = 16
      Top = 16
      Width = 297
      Height = 33
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Capital (Cuotas - F. Prog)'
        'Interes (F. Prog.)')
      TabOrder = 4
      OnClick = RconceptoClick
    end
    object bbCamFhProg: TBitBtn
      Tag = 17
      Left = 520
      Top = 72
      Width = 161
      Height = 25
      Caption = 'Actualizar F. Programadas'
      TabOrder = 5
      OnClick = bbCamFhProgClick
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
    Left = 358
    Top = 174
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
    object N1: TMenuItem
      Caption = '-'
    end
    object AgregarPeriododeInters1: TMenuItem
      Caption = 'Agregar Periodo de Interés'
      Enabled = False
      OnClick = AgregarPeriododeInters1Click
    end
    object BorrarPeriododeInters1: TMenuItem
      Caption = 'Borrar Periodo de Interés'
      Enabled = False
      OnClick = BorrarPeriododeInters1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object CargadeTablaPYME1: TMenuItem
      Caption = 'Carga de Tabla PYME'
      Enabled = False
      OnClick = CargadeTablaPYME1Click
    end
    object ModificarMontodeComision1: TMenuItem
      Caption = 'Modificar Monto de Comision'
      Enabled = False
      OnClick = ModificarMontodeComision1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'CSV (MSDOS) (*.csv)|*.csv|Todos los archivos|*.*'
    Left = 360
    Top = 240
  end
  object ExcelWorksheetI: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 584
    Top = 608
  end
  object ExcelApplicationI: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 616
    Top = 608
  end
  object ExcelWorkbookI: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 656
    Top = 608
  end
  object odArchivoEntrada: TOpenDialog
    DefaultExt = '.xlsx'
    Filter = '*.xlsx|*.xlsx|*.xls|*.xls'
    Left = 552
    Top = 608
  end
end
