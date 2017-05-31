object WCrSeguroF: TWCrSeguroF
  Left = 370
  Top = 22
  Width = 688
  Height = 721
  BiDiMode = bdLeftToRight
  Caption = 'Seguro'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  ParentBiDiMode = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 665
    Height = 457
    TabOrder = 0
    OnDblClick = Panel1DblClick
    object lblContFira: TLabel
      Left = 424
      Top = 22
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Status'
    end
    object lblNumPoliza: TLabel
      Left = 8
      Top = 122
      Width = 55
      Height = 26
      Caption = 'Número de Póliza'
      WordWrap = True
    end
    object lblFinVigencia: TLabel
      Left = 502
      Top = 164
      Width = 8
      Height = 13
      Alignment = taRightJustify
      Caption = 'al'
      WordWrap = True
    end
    object lblDisposicion: TLabel
      Left = 8
      Top = 22
      Width = 54
      Height = 13
      Caption = 'Disposición'
      WordWrap = True
    end
    object lblAcreditado: TLabel
      Left = 8
      Top = 45
      Width = 51
      Height = 13
      Caption = 'Acreditado'
    end
    object lblPromotor: TLabel
      Left = 8
      Top = 69
      Width = 42
      Height = 13
      Caption = 'Promotor'
    end
    object lblCobertura: TLabel
      Left = 445
      Top = 123
      Width = 46
      Height = 13
      Caption = 'Cobertura'
      WordWrap = True
    end
    object lblPrima: TLabel
      Left = 8
      Top = 164
      Width = 26
      Height = 13
      Caption = 'Prima'
    end
    object lblIniVigencia: TLabel
      Left = 264
      Top = 164
      Width = 14
      Height = 13
      Alignment = taRightJustify
      Caption = 'del'
      WordWrap = True
    end
    object lblF_Cobro: TLabel
      Left = 432
      Top = 202
      Width = 75
      Height = 13
      Caption = 'Fecha de cobro'
    end
    object lblF_Reporte: TLabel
      Left = 272
      Top = 313
      Width = 33
      Height = 26
      Alignment = taRightJustify
      Caption = 'Fecha reporte'
      WordWrap = True
    end
    object lblF_Siniestro: TLabel
      Left = 35
      Top = 309
      Width = 38
      Height = 26
      Alignment = taRightJustify
      Caption = 'Fecha siniestro'
      WordWrap = True
    end
    object Label1: TLabel
      Left = 8
      Top = 94
      Width = 53
      Height = 16
      Caption = 'PÓLIZA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 283
      Width = 82
      Height = 16
      Caption = 'SINIESTRO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object lblF_Indem: TLabel
      Left = 5
      Top = 343
      Width = 68
      Height = 26
      Alignment = taRightJustify
      Caption = 'Fecha de Indemnización'
      WordWrap = True
    end
    object lblImpIndemn: TLabel
      Left = 245
      Top = 343
      Width = 60
      Height = 26
      Alignment = taRightJustify
      Caption = 'Importe Indemnizado'
      WordWrap = True
    end
    object lblNumCheque: TLabel
      Left = 447
      Top = 343
      Width = 58
      Height = 26
      Alignment = taRightJustify
      Caption = 'Número  de Cheque'
      WordWrap = True
    end
    object lblF_Pago: TLabel
      Left = 160
      Top = 198
      Width = 123
      Height = 26
      Alignment = taRightJustify
      Caption = 'Fecha de pago Binter por cuenta del acreditado'
      WordWrap = True
    end
    object lblVigencia: TLabel
      Left = 208
      Top = 164
      Width = 41
      Height = 13
      Caption = 'Vigencia'
    end
    object Label3: TLabel
      Left = 23
      Top = 386
      Width = 106
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo de indemnización'
    end
    object Label4: TLabel
      Left = 230
      Top = 399
      Width = 78
      Height = 26
      Alignment = taRightJustify
      Caption = 'Número de indemnizaciones'
      WordWrap = True
    end
    object Label5: TLabel
      Left = 463
      Top = 386
      Width = 106
      Height = 13
      Alignment = taRightJustify
      Caption = 'Status indemninzación'
    end
    object Label6: TLabel
      Left = 8
      Top = 252
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object btID_CREDITO: TBitBtn
      Tag = 50
      Left = 159
      Top = 18
      Width = 21
      Height = 21
      HelpContext = 1001
      TabOrder = 1
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
    object edID_CREDITO: TEdit
      Tag = 562
      Left = 74
      Top = 18
      Width = 81
      Height = 21
      HelpContext = 1000
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 0
      OnExit = edID_CREDITOExit
    end
    object edNomAcreditado: TEdit
      Left = 155
      Top = 41
      Width = 466
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 27
    end
    object edSecuencia: TEdit
      Left = 183
      Top = 18
      Width = 25
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      Enabled = False
      MaxLength = 8
      ReadOnly = True
      TabOrder = 25
    end
    object idtpF_FinVigencia: TInterDateTimePicker
      Tag = 18
      Left = 610
      Top = 160
      Width = 21
      Height = 21
      HelpContext = 1601
      CalAlignment = dtaLeft
      Date = 40254.444936875
      Time = 40254.444936875
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 9
      Edit = edF_FinVigencia
      Formato = dfDate
    end
    object edUnidad: TRadioGroup
      Tag = 18
      Left = 206
      Top = 100
      Width = 179
      Height = 57
      HelpContext = 1200
      Caption = 'Unidad'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Cabezas'
        'Hectáreas'
        'Vida'
        'Maquinaria')
      TabOrder = 3
      TabStop = True
      OnExit = edUnidadExit
    end
    object edNum_Poliza: TEdit
      Tag = 530
      Left = 74
      Top = 124
      Width = 110
      Height = 21
      HelpContext = 1100
      CharCase = ecUpperCase
      MaxLength = 24
      TabOrder = 2
      OnExit = edNum_PolizaExit
    end
    object edF_IniVigencia: TEdit
      Tag = 530
      Left = 288
      Top = 160
      Width = 90
      Height = 21
      HelpContext = 1500
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 6
      OnExit = edF_IniVigenciaExit
    end
    object edId_Acreditado: TEdit
      Left = 75
      Top = 41
      Width = 78
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 26
    end
    object edId_Promotor: TEdit
      Left = 75
      Top = 65
      Width = 78
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 28
    end
    object edNomPromotor: TEdit
      Left = 155
      Top = 65
      Width = 466
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 29
    end
    object edF_FinVigencia: TEdit
      Tag = 530
      Left = 520
      Top = 160
      Width = 90
      Height = 21
      HelpContext = 1600
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 8
      OnExit = edF_FinVigenciaExit
    end
    object idtpF_IniVigencia: TInterDateTimePicker
      Tag = 18
      Left = 378
      Top = 160
      Width = 21
      Height = 21
      HelpContext = 1501
      CalAlignment = dtaLeft
      Date = 40254.444936875
      Time = 40254.444936875
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 7
      Edit = edF_IniVigencia
      Formato = dfDate
    end
    object edF_Pago: TEdit
      Tag = 530
      Left = 288
      Top = 198
      Width = 90
      Height = 21
      HelpContext = 1700
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 10
      OnExit = edF_PagoExit
    end
    object edF_Cobro: TEdit
      Tag = 530
      Left = 520
      Top = 198
      Width = 90
      Height = 21
      HelpContext = 1800
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 12
      OnExit = edF_CobroExit
    end
    object idtpF_Cobro: TInterDateTimePicker
      Tag = 18
      Left = 610
      Top = 198
      Width = 21
      Height = 21
      HelpContext = 1801
      CalAlignment = dtaLeft
      Date = 40254.444936875
      Time = 40254.444936875
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 13
      Edit = edF_Cobro
      Formato = dfDate
    end
    object edF_Reporte: TEdit
      Tag = 530
      Left = 313
      Top = 313
      Width = 90
      Height = 21
      HelpContext = 2000
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 16
      OnExit = edF_ReporteExit
    end
    object idtpF_Reporte: TInterDateTimePicker
      Tag = 18
      Left = 403
      Top = 313
      Width = 21
      Height = 21
      HelpContext = 2001
      CalAlignment = dtaLeft
      Date = 40254.444936875
      Time = 40254.444936875
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 17
      Edit = edF_Reporte
      Formato = dfDate
    end
    object edF_Siniestro: TEdit
      Tag = 530
      Left = 101
      Top = 313
      Width = 90
      Height = 21
      HelpContext = 1900
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 14
      OnExit = edF_SiniestroExit
    end
    object idtpF_Siniestro: TInterDateTimePicker
      Tag = 18
      Left = 191
      Top = 313
      Width = 21
      Height = 21
      HelpContext = 1901
      CalAlignment = dtaLeft
      Date = 40254.444936875
      Time = 40254.444936875
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 15
      Edit = edF_Siniestro
      Formato = dfDate
    end
    object edCheque: TEdit
      Tag = 530
      Left = 521
      Top = 346
      Width = 110
      Height = 21
      HelpContext = 2300
      CharCase = ecUpperCase
      TabOrder = 21
      OnExit = edChequeExit
    end
    object idtpF_Pago: TInterDateTimePicker
      Tag = 18
      Left = 378
      Top = 198
      Width = 21
      Height = 21
      HelpContext = 1701
      CalAlignment = dtaLeft
      Date = 40254.444936875
      Time = 40254.444936875
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 11
      Edit = edF_Pago
      Formato = dfDate
    end
    object MsgPanel: TPanel
      Left = 1
      Top = 437
      Width = 663
      Height = 19
      Align = alBottom
      TabOrder = 30
    end
    object edF_Indemn: TEdit
      Tag = 530
      Left = 101
      Top = 346
      Width = 90
      Height = 21
      HelpContext = 2100
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 18
      OnExit = edF_IndemnExit
    end
    object idtpF_Indemn: TInterDateTimePicker
      Tag = 18
      Left = 189
      Top = 346
      Width = 21
      Height = 21
      HelpContext = 2101
      CalAlignment = dtaLeft
      Date = 40254.444936875
      Time = 40254.444936875
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 19
      Edit = edF_Indemn
      Formato = dfDate
    end
    object edPrima: TInterEdit
      Tag = 530
      Left = 74
      Top = 160
      Width = 110
      Height = 21
      HelpContext = 1400
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edPrimaExit
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      TabOrder = 5
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object ed_ImpIndemnizado: TInterEdit
      Tag = 530
      Left = 313
      Top = 346
      Width = 110
      Height = 21
      HelpContext = 2200
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = ed_ImpIndemnizadoExit
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      TabOrder = 20
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edCobertura: TInterEdit
      Tag = 530
      Left = 514
      Top = 122
      Width = 110
      Height = 21
      HelpContext = 1300
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      OnExit = edCoberturaExit
      DisplayMask = '###,###,###,###,##0'
      MaxLength = 10
      TabOrder = 4
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edNUM_INDEMN: TEdit
      Tag = 530
      Left = 318
      Top = 404
      Width = 110
      Height = 21
      HelpContext = 2500
      CharCase = ecUpperCase
      TabOrder = 23
      OnExit = edNUM_INDEMNExit
    end
    object edOBSERVACIONES: TMemo
      Tag = 18
      Left = 104
      Top = 232
      Width = 529
      Height = 44
      HelpContext = 1600
      MaxLength = 2000
      ScrollBars = ssVertical
      TabOrder = 31
    end
    object edSTATUS: TEdit
      Left = 464
      Top = 17
      Width = 157
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 32
    end
    object edTIPO_INDEMN: TComboBox
      Tag = 18
      Left = 24
      Top = 404
      Width = 185
      Height = 21
      HelpContext = 2400
      ItemHeight = 13
      TabOrder = 22
      OnExit = edTIPO_INDEMNExit
      Items.Strings = (
        'Vientre'
        'Semental'
        'Vientre/Semental'
        'Otro')
    end
    object edEST_INDEMN: TComboBox
      Tag = 18
      Left = 462
      Top = 404
      Width = 177
      Height = 21
      HelpContext = 2600
      ItemHeight = 13
      TabOrder = 24
      OnExit = edEST_INDEMNExit
      Items.Strings = (
        'En chequera cliente'
        'Aplicado al crédito'
        'Reembolsado'
        'Otro')
    end
  end
  object PnDatos: TPanel
    Left = 0
    Top = 661
    Width = 665
    Height = 21
    TabOrder = 1
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
    object Label8: TLabel
      Left = 565
      Top = 10
      Width = 95
      Height = 8
      Caption = 'Liberación: 23/07/2010'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PageControl1: TPageControl
    Left = 1
    Top = 480
    Width = 664
    Height = 169
    ActivePage = TabSheet3
    TabOrder = 2
    object TabSheet3: TTabSheet
      Caption = 'Pólizas'
      ImageIndex = 1
      object sgPolizas: TSGCtrl
        Left = 8
        Top = 5
        Width = 641
        Height = 132
        ShowTab = True
        TabOrder = 0
        TabWidth = 0
        ShowBtnPriorNext = True
        ShowBtnFirst = True
        ShowBtnLast = True
        OnDblClick = sgPolizasDblClick
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Siniestros'
      ImageIndex = 1
      object sgSiniestros: TSGCtrl
        Left = 8
        Top = 5
        Width = 641
        Height = 132
        ShowTab = True
        TabOrder = 0
        TabWidth = 0
        ShowBtnPriorNext = True
        ShowBtnFirst = True
        ShowBtnLast = True
        OnDblClick = sgSiniestrosDblClick
      end
    end
  end
  object Msg2Panel: TPanel
    Left = 0
    Top = 458
    Width = 665
    Height = 19
    TabOrder = 3
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
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
    Left = 650
    Top = 26
  end
  object ilID_CREDITO: TInterLinkit
    Control = edID_CREDITO
    OnEjecuta = ilID_CREDITOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 227
    Top = 21
  end
end
