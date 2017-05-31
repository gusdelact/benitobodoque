object WCrConRegCci: TWCrConRegCci
  Left = 299
  Top = 26
  Width = 708
  Height = 670
  Caption = 'Características de la Carta de Crédito'
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
  object Bevel3: TBevel
    Left = 7
    Top = 495
    Width = 660
    Height = 64
  end
  object lbFH_ALTA: TLabel
    Left = 261
    Top = 563
    Width = 93
    Height = 13
    Caption = 'Fecha Modificación'
  end
  object lbCVE_USU_MODIFICA: TLabel
    Left = 488
    Top = 563
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object lbTIPO_CAMBIO_DLLS: TLabel
    Left = 178
    Top = 519
    Width = 36
    Height = 13
    Caption = 'DLLS:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbTIPO_CAMBIO_UDIS: TLabel
    Left = 178
    Top = 538
    Width = 35
    Height = 13
    Caption = 'UDIS:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTC_MES_ANT: TLabel
    Left = 226
    Top = 498
    Width = 124
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'T.C. Mes Anterior'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lblTC_MES_ACT: TLabel
    Left = 370
    Top = 498
    Width = 124
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'T.C. a la Fecha'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object PnDatos: TPanel
    Left = 4
    Top = 605
    Width = 666
    Height = 21
    TabOrder = 2
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
      Left = 300
      Top = 0
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
      Left = 316
      Top = 10
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
      Left = 364
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
      Left = 364
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
    object Label3: TLabel
      Left = 632
      Top = 3
      Width = 30
      Height = 12
      Caption = 'V.2011'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
  end
  object PageControl1: TPageControl
    Left = 6
    Top = 8
    Width = 683
    Height = 486
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Carta de Crédito'
      object bvlPrincipal: TBevel
        Left = 441
        Top = 236
        Width = 226
        Height = 181
      end
      object bvlAutirizacion: TBevel
        Left = 3
        Top = 46
        Width = 670
        Height = 187
        Shape = bsFrame
        Style = bsRaised
      end
      object lbIMP_CREDITO: TLabel
        Left = 445
        Top = 240
        Width = 55
        Height = 13
        Caption = 'Importe CCI'
      end
      object lbCVE_IDENTIF_CNBV: TLabel
        Left = 288
        Top = 13
        Width = 90
        Height = 13
        Caption = 'Identificador CNBV'
      end
      object lbID_CREDITO: TLabel
        Left = 10
        Top = 13
        Width = 142
        Height = 13
        Alignment = taRightJustify
        Caption = 'Número Carta de Crédito (CCI)'
      end
      object lbF_LIQUIDACION: TLabel
        Left = 231
        Top = 377
        Width = 87
        Height = 13
        Caption = 'Fecha Liquidación'
      end
      object lbF_DISPOSICION: TLabel
        Left = 7
        Top = 331
        Width = 87
        Height = 13
        Caption = 'Fecha Disposición'
      end
      object lbF_AUTORIZA: TLabel
        Left = 6
        Top = 291
        Width = 90
        Height = 13
        Caption = 'Fecha Captura CCI'
      end
      object lbF_CCI_VTO: TLabel
        Left = 230
        Top = 330
        Width = 72
        Height = 13
        Caption = 'Fecha Vto. CCI'
      end
      object lbSDO_ACTUAL_V: TLabel
        Left = 445
        Top = 334
        Width = 27
        Height = 13
        Caption = 'Saldo'
      end
      object lbIMP_ADICIONAL: TLabel
        Left = 445
        Top = 284
        Width = 81
        Height = 13
        Caption = 'Importe Adicional'
      end
      object Label20: TLabel
        Left = 523
        Top = 320
        Width = 129
        Height = 13
        Caption = '-------------------------------------------'
      end
      object lbPCT_ADICIONAL_V: TLabel
        Left = 445
        Top = 263
        Width = 54
        Height = 13
        Caption = '% Adicional'
      end
      object lbIMP_DISMINUIDO: TLabel
        Left = 445
        Top = 306
        Width = 79
        Height = 13
        Caption = 'Importe Aplicado'
      end
      object edCVE_MONEDA1: TLabel
        Left = 11
        Top = 151
        Width = 39
        Height = 13
        Caption = 'Moneda'
      end
      object lbCVE_PRODUCTO_CRE: TLabel
        Left = 11
        Top = 128
        Width = 43
        Height = 13
        Caption = 'Producto'
      end
      object lbID_CONTRATO: TLabel
        Left = 10
        Top = 81
        Width = 78
        Height = 13
        Caption = 'No. Autorización'
      end
      object lbF_AUT_COMITE: TLabel
        Left = 217
        Top = 175
        Width = 71
        Height = 13
        Caption = 'Fecha Autoriza'
      end
      object lbF_VENCIMIENTO: TLabel
        Left = 428
        Top = 176
        Width = 91
        Height = 13
        Caption = 'Fecha Vencimiento'
      end
      object lbIMP_AUTORIZADO: TLabel
        Left = 11
        Top = 174
        Width = 73
        Height = 13
        Caption = 'Imp. Autorizado'
      end
      object lbB_CCI_REFINANC: TLabel
        Left = 11
        Top = 208
        Width = 114
        Height = 13
        Caption = 'Aplica Refinanciamiento'
      end
      object lbID_ACREDITADO: TLabel
        Left = 12
        Top = 106
        Width = 51
        Height = 13
        Caption = 'Acreditado'
      end
      object lbDIAS_PLAZO_V: TLabel
        Left = 231
        Top = 291
        Width = 50
        Height = 13
        Caption = 'Diás Plazo'
      end
      object lbSDO_ACTUAL_MN_V: TLabel
        Left = 445
        Top = 355
        Width = 90
        Height = 26
        AutoSize = False
        Caption = 'Saldo M.N. a la Fecha'
        WordWrap = True
      end
      object lbSDO_ACTUAL_MN_ANT_V: TLabel
        Left = 444
        Top = 388
        Width = 92
        Height = 25
        AutoSize = False
        Caption = 'Saldo M.N. al Mes Anterior'
        WordWrap = True
      end
      object Label1: TLabel
        Left = 6
        Top = 245
        Width = 70
        Height = 13
        Caption = 'Imp. Dispuesto'
      end
      object Label2: TLabel
        Left = 230
        Top = 245
        Width = 83
        Height = 13
        Caption = 'Imp. por Disponer'
      end
      object edCVE_IDENTIF_CNBV: TEdit
        Left = 387
        Top = 10
        Width = 286
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clBtnFace
        MaxLength = 30
        ReadOnly = True
        TabOrder = 13
      end
      object edIMP_CREDITO: TInterEdit
        Tag = 530
        Left = 532
        Top = 239
        Width = 115
        Height = 20
        HelpContext = 1400
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = edIMP_CREDITOExit
        OnChange = edIMP_CREDITOChange
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 2
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object rgSIT_CON_REG_CCI: TRadioGroup
        Tag = 530
        Left = 6
        Top = 362
        Width = 221
        Height = 39
        HelpContext = 1900
        Caption = 'Situación de la Carta'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Activo'
          'Liquidado'
          'Cancelado')
        TabOrder = 10
        TabStop = True
        OnClick = rgSIT_CON_REG_CCIClick
        OnExit = rgSIT_CON_REG_CCIExit
      end
      object edF_LIQUIDACION: TEdit
        Left = 322
        Top = 373
        Width = 90
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clBtnFace
        Enabled = False
        ReadOnly = True
        TabOrder = 11
        OnExit = edF_LIQUIDACIONExit
      end
      object dtpF_LIQUIDACION: TInterDateTimePicker
        Tag = 18
        Left = 413
        Top = 373
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
        TabStop = False
        OnExit = edF_LIQUIDACIONExit
        Edit = edF_LIQUIDACION
        Formato = dfDate
      end
      object edID_CREDITO: TEdit
        Left = 159
        Top = 10
        Width = 115
        Height = 21
        TabStop = False
        Color = clBtnFace
        MaxLength = 10
        ReadOnly = True
        TabOrder = 32
        OnExit = edID_CREDITOExit
      end
      object edF_DISPOSICION: TEdit
        Tag = 530
        Left = 108
        Top = 328
        Width = 92
        Height = 21
        HelpContext = 1600
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 5
        OnExit = edF_DISPOSICIONExit
      end
      object dtpF_DISPOSICION: TInterDateTimePicker
        Tag = 530
        Left = 201
        Top = 326
        Width = 21
        Height = 21
        HelpContext = 1601
        CalAlignment = dtaLeft
        Date = 40046.7527815162
        Time = 40046.7527815162
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 6
        OnExit = edF_DISPOSICIONExit
        Edit = edF_DISPOSICION
        Formato = dfDate
      end
      object edF_AUTORIZA: TEdit
        Tag = 530
        Left = 108
        Top = 286
        Width = 92
        Height = 21
        HelpContext = 1500
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 3
        OnExit = edF_AUTORIZAExit
      end
      object dtpF_AUTORIZA: TInterDateTimePicker
        Tag = 530
        Left = 201
        Top = 286
        Width = 21
        Height = 22
        HelpContext = 1501
        CalAlignment = dtaLeft
        Date = 40046.7527815162
        Time = 40046.7527815162
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 4
        OnExit = edF_AUTORIZAExit
        Edit = edF_AUTORIZA
        Formato = dfDate
      end
      object edF_CCI_VTO: TEdit
        Tag = 530
        Left = 320
        Top = 326
        Width = 92
        Height = 21
        HelpContext = 1800
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 8
        OnExit = edF_CCI_VTOExit
      end
      object dtpF_CCI_VTO: TInterDateTimePicker
        Tag = 530
        Left = 413
        Top = 326
        Width = 21
        Height = 21
        HelpContext = 1801
        CalAlignment = dtaLeft
        Date = 40046.7527815162
        Time = 40046.7527815162
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 9
        OnExit = edF_CCI_VTOExit
        Edit = edF_CCI_VTO
        Formato = dfDate
      end
      object edSDO_ACTUAL_V: TInterEdit
        Left = 531
        Top = 331
        Width = 115
        Height = 20
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnChange = edSDO_ACTUAL_VChange
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 0
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 17
        ReadOnly = True
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edIMP_ADICIONAL_V: TInterEdit
        Left = 532
        Top = 281
        Width = 115
        Height = 20
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnChange = edIMP_ADICIONAL_VChange
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 0
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 15
        ReadOnly = True
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edPCT_ADICIONAL_V: TInterEdit
        Left = 532
        Top = 260
        Width = 115
        Height = 20
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.0000'
        MaxLength = 0
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 14
        ReadOnly = True
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edIMP_APLICADO_V: TInterEdit
        Left = 533
        Top = 302
        Width = 115
        Height = 20
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnChange = edIMP_APLICADO_VChange
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 0
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 16
        ReadOnly = True
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object Panel2: TPanel
        Left = 15
        Top = 54
        Width = 120
        Height = 17
        BevelOuter = bvNone
        Caption = 'Datos de la Autorización'
        TabOrder = 19
      end
      object edID_ACREDITADO: TEdit
        Left = 109
        Top = 102
        Width = 92
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clBtnFace
        MaxLength = 10
        ReadOnly = True
        TabOrder = 20
      end
      object dtpF_AUT_COMITE: TInterDateTimePicker
        Left = 389
        Top = 172
        Width = 21
        Height = 21
        CalAlignment = dtaLeft
        Date = 40046.7527815162
        Time = 40046.7527815162
        DateFormat = dfShort
        DateMode = dmComboBox
        Enabled = False
        Kind = dtkDate
        ParseInput = False
        TabOrder = 21
        TabStop = False
        Edit = edF_AUT_COMITE
        Formato = dfDate
      end
      object edF_AUT_COMITE: TEdit
        Left = 295
        Top = 172
        Width = 92
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 22
      end
      object dtpF_VENCIMIENTO: TInterDateTimePicker
        Left = 620
        Top = 172
        Width = 21
        Height = 21
        CalAlignment = dtaLeft
        Date = 40046.7527815162
        Time = 40046.7527815162
        DateFormat = dfShort
        DateMode = dmComboBox
        Enabled = False
        Kind = dtkDate
        ParseInput = False
        TabOrder = 23
        TabStop = False
        Edit = edF_VENCIMIENTO
        Formato = dfDate
      end
      object edF_VENCIMIENTO: TEdit
        Left = 528
        Top = 172
        Width = 92
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 24
      end
      object edNOM_ACREDITADO: TEdit
        Left = 200
        Top = 102
        Width = 437
        Height = 21
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 25
      end
      object edID_CONTRATO: TInterEdit
        Tag = 562
        Left = 109
        Top = 76
        Width = 92
        Height = 22
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trContrato
        OnExit = edID_CONTRATOExit
        MaxLength = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 0
        UseReType = False
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object btID_CONTRATO: TBitBtn
        Tag = 50
        Left = 202
        Top = 78
        Width = 21
        Height = 21
        HelpContext = 1101
        TabOrder = 1
        OnClick = btID_CONTRATOClick
        OnExit = edID_CONTRATOExit
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
      object edNOM_CONTRATO: TEdit
        Left = 222
        Top = 78
        Width = 414
        Height = 21
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 26
      end
      object edCVE_MONEDA: TEdit
        Left = 109
        Top = 148
        Width = 92
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clBtnFace
        MaxLength = 10
        ReadOnly = True
        TabOrder = 27
      end
      object edDESC_MONEDA: TEdit
        Left = 200
        Top = 148
        Width = 437
        Height = 21
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 28
      end
      object edIMP_AUTORIZADO: TInterEdit
        Left = 109
        Top = 171
        Width = 92
        Height = 20
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 12
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 29
        ReadOnly = True
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edCVE_PRODUCTO_CRE: TEdit
        Left = 109
        Top = 125
        Width = 92
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 30
      end
      object edDESC_L_PRODUCTO: TEdit
        Left = 200
        Top = 125
        Width = 437
        Height = 21
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 31
      end
      object edDIAS_PLAZO_V: TInterEdit
        Tag = 530
        Left = 320
        Top = 286
        Width = 115
        Height = 22
        HelpContext = 1700
        Prefijo = '1'
        Contrato = -1
        TipoReader = trEntero
        OnExit = edDIAS_PLAZO_VExit
        MaxLength = 6
        TabOrder = 7
        UseReType = False
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edSDO_ACTUAL_MN_V: TInterEdit
        Left = 532
        Top = 360
        Width = 115
        Height = 20
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnChange = edSDO_ACTUAL_VChange
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 0
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 18
        ReadOnly = True
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edSDO_ACTUAL_MN_ANT_V: TInterEdit
        Left = 532
        Top = 390
        Width = 115
        Height = 20
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnChange = edSDO_ACTUAL_VChange
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 0
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 33
        ReadOnly = True
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edIMP_DISPUESTO: TInterEdit
        Left = 107
        Top = 243
        Width = 115
        Height = 20
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 0
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 34
        ReadOnly = True
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edDISP_LINEA: TInterEdit
        Left = 320
        Top = 243
        Width = 115
        Height = 20
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 0
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 35
        ReadOnly = True
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object opB_CCI_REFINANC: TRadioGroup
        Tag = 530
        Left = 128
        Top = 192
        Width = 105
        Height = 33
        HelpContext = 1200
        Columns = 2
        Items.Strings = (
          'SI'
          'NO')
        TabOrder = 36
        OnExit = opB_CCI_REFINANCExit
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Datos Adicionales'
      ImageIndex = 1
      object Bevel5: TBevel
        Left = 2
        Top = 70
        Width = 650
        Height = 164
        Shape = bsFrame
        Style = bsRaised
      end
      object Label7: TLabel
        Left = 7
        Top = 24
        Width = 55
        Height = 13
        Caption = 'Beneficiario'
      end
      object lbCVE_FND_ENT_DES: TLabel
        Left = 3
        Top = 289
        Width = 87
        Height = 13
        Caption = 'Entidad que Avala'
      end
      object lbB_AVAL_OTRA_ENT: TLabel
        Left = 3
        Top = 258
        Width = 98
        Height = 13
        Caption = 'Aval de Otra Entidad'
      end
      object lbCVE_GARANTIA: TLabel
        Left = 7
        Top = 92
        Width = 72
        Height = 13
        Caption = 'Clave Garantía'
      end
      object lbDESC_GTIA_ADIC: TLabel
        Left = 8
        Top = 139
        Width = 102
        Height = 13
        Caption = 'Descripción Adicional'
      end
      object lbIMP_GARANTIA: TLabel
        Left = 7
        Top = 116
        Width = 35
        Height = 13
        Caption = 'Importe'
      end
      object lbNUM_GTIA_PROPOR: TLabel
        Left = 198
        Top = 114
        Width = 66
        Height = 13
        Caption = 'Proporción 1 :'
      end
      object lblIMP_TOT_GTIA_REQ: TLabel
        Left = 348
        Top = 114
        Width = 76
        Height = 13
        Caption = 'Gtía. Requerida'
      end
      object lblIMP_DIF_GTIA_REQ: TLabel
        Left = 519
        Top = 113
        Width = 43
        Height = 13
        Caption = 'Dif. Gtía.'
      end
      object btnCVE_FND_ENT_DES: TBitBtn
        Tag = 530
        Left = 195
        Top = 286
        Width = 21
        Height = 21
        HelpContext = 3001
        TabOrder = 9
        OnClick = btnCVE_FND_ENT_DESClick
        OnExit = edCVE_FND_ENT_DESExit
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
      object edDESC_ENT_DES: TEdit
        Left = 214
        Top = 285
        Width = 435
        Height = 21
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 10
      end
      object GroupBox3: TGroupBox
        Left = 1
        Top = 340
        Width = 650
        Height = 65
        Caption = 'Datos de Cobranza'
        TabOrder = 11
        object Label10: TLabel
          Left = 23
          Top = 30
          Width = 128
          Height = 13
          Caption = 'Porcentaje Adicional Cobro'
        end
        object Label11: TLabel
          Left = 336
          Top = 29
          Width = 112
          Height = 13
          Caption = 'Importe Adicional Cobro'
        end
        object edPCT_ADICIONAL: TInterEdit
          Tag = 530
          Left = 164
          Top = 26
          Width = 115
          Height = 20
          HelpContext = 3100
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edPCT_ADICIONALExit
          DisplayMask = '###,###,###,###,##0.0000'
          MaxLength = 12
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
        object edIMP_ADICIONAL: TInterEdit
          Tag = 530
          Left = 476
          Top = 24
          Width = 115
          Height = 20
          HelpContext = 3200
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edIMP_ADICIONALExit
          DisplayMask = '###,###,###,###,##0.00'
          MaxLength = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 1
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = True
          ColorPos = clBtnText
          ColorNeg = clRed
        end
      end
      object edNOM_BENEFICIARIO: TEdit
        Tag = 530
        Left = 71
        Top = 21
        Width = 571
        Height = 21
        HelpContext = 2300
        CharCase = ecUpperCase
        MaxLength = 80
        TabOrder = 0
        OnExit = edNOM_BENEFICIARIOExit
      end
      object opB_AVAL_OTRA_ENT: TRadioButton
        Left = 130
        Top = 258
        Width = 39
        Height = 17
        HelpContext = 2800
        Caption = 'SI'
        TabOrder = 6
      end
      object opB_AVAL_OTRA_ENT1: TRadioButton
        Left = 179
        Top = 258
        Width = 41
        Height = 17
        HelpContext = 2900
        Caption = 'NO'
        Checked = True
        TabOrder = 7
        TabStop = True
      end
      object edCVE_FND_ENT_DES: TEdit
        Tag = 530
        Left = 101
        Top = 285
        Width = 94
        Height = 21
        HelpContext = 3000
        TabOrder = 8
        OnExit = edCVE_FND_ENT_DESExit
      end
      object btnCVE_GARANTIA: TBitBtn
        Tag = 530
        Left = 192
        Top = 86
        Width = 23
        Height = 21
        HelpContext = 2401
        TabOrder = 2
        OnClick = btnCVE_GARANTIAClick
        OnExit = edCVE_GARANTIAExit
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
      object edDESC_GARANTIA: TEdit
        Left = 213
        Top = 85
        Width = 429
        Height = 21
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 12
      end
      object memDESC_GTIA_ADIC: TMemo
        Tag = 530
        Left = 120
        Top = 133
        Width = 523
        Height = 84
        HelpContext = 2700
        MaxLength = 2000
        ScrollBars = ssBoth
        TabOrder = 5
        OnExit = memDESC_GTIA_ADICExit
      end
      object edIMP_GARANTIA: TInterEdit
        Tag = 530
        Left = 120
        Top = 108
        Width = 72
        Height = 22
        HelpContext = 2500
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = edIMP_GARANTIAExit
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 12
        TabOrder = 3
        UseReType = False
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edCVE_GARANTIA: TEdit
        Tag = 530
        Left = 120
        Top = 84
        Width = 74
        Height = 21
        HelpContext = 2400
        TabOrder = 1
        OnExit = edCVE_GARANTIAExit
      end
      object edNUM_GTIA_PROPOR: TInterEdit
        Tag = 530
        Left = 269
        Top = 108
        Width = 73
        Height = 22
        HelpContext = 2600
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = edNUM_GTIA_PROPORExit
        DisplayMask = '###,###,###,###,##0.0000'
        MaxLength = 12
        TabOrder = 4
        UseReType = False
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object Panel1: TPanel
        Left = 13
        Top = 62
        Width = 48
        Height = 17
        BevelOuter = bvNone
        Caption = 'Garantía'
        TabOrder = 13
      end
      object edIMP_TOT_GTIA_REQ: TInterEdit
        Left = 428
        Top = 108
        Width = 72
        Height = 22
        HelpContext = 2500
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 12
        Color = clBtnFace
        TabOrder = 14
        UseReType = False
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edIMP_DIF_GTIA_REQ: TInterEdit
        Left = 570
        Top = 108
        Width = 72
        Height = 22
        HelpContext = 2500
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 12
        Color = clBtnFace
        TabOrder = 15
        UseReType = False
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Tabla de Comisiones'
      ImageIndex = 3
      object Label14: TLabel
        Left = 168
        Top = 395
        Width = 35
        Height = 13
        Caption = 'Totales'
      end
      object Bevel2: TBevel
        Left = 8
        Top = 418
        Width = 639
        Height = 2
      end
      object StrAlgnGrdComisiones: TStringAlignGrid
        Left = 6
        Top = 6
        Width = 640
        Height = 381
        ColCount = 9
        DefaultRowHeight = 17
        FixedColor = clInfoBk
        RowCount = 2
        TabOrder = 0
        OnDblClick = StrAlgnGrdComisionesDblClick
        ColWidths = (
          1
          66
          68
          71
          93
          93
          91
          93
          30)
        RowHeights = (
          45
          17)
        Cells = (
          1
          0
          'Concepto'
          2
          0
          'Fecha de '#13#10'Vencimiento'
          3
          0
          'Fecha de '#13#10'Aplicación'
          4
          0
          'Importe Comisión'
          5
          0
          'Importe IVA'
          6
          0
          'Importe'#13#10'a Cobrar'
          7
          0
          'Importe'#13#10'Aplicado'
          8
          0
          'Sit.'#13#10)
        PropCell = (
          2
          0
          1
          2
          0
          3
          0
          1
          2
          0
          4
          0
          1
          2
          0
          7
          1
          1
          0
          0
          8
          1
          1
          2
          0)
        PropCol = (
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
          2
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
          1
          0
          8
          1
          2
          0)
        PropRow = (
          0
          1
          2
          0)
        PropFixedCol = ()
        PropFixedRow = (
          0
          1
          2
          0)
      end
      object edIMP_TOT_CNIMP_V: TInterEdit
        Tag = 18
        Left = 211
        Top = 391
        Width = 93
        Height = 20
        HelpContext = 1500
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 12
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 1
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object btnAdicionaComisiones: TButton
        Left = 418
        Top = 429
        Width = 229
        Height = 25
        Caption = '&Ingresar tabla de pagos Comisiones'
        TabOrder = 2
        OnClick = btnAdicionaComisionesClick
      end
      object edIMP_TOT_CNIVA_V: TInterEdit
        Tag = 18
        Left = 305
        Top = 391
        Width = 93
        Height = 20
        HelpContext = 1500
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 12
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 3
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edIMP_TOT_CNAPL_V: TInterEdit
        Tag = 18
        Left = 398
        Top = 391
        Width = 93
        Height = 20
        HelpContext = 1500
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 12
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 4
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edIMP_TOT_CNSDO_V: TInterEdit
        Tag = 18
        Left = 491
        Top = 391
        Width = 93
        Height = 20
        HelpContext = 1500
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 12
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 5
        Visible = False
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object btnEditaComisiones: TButton
        Left = 6
        Top = 428
        Width = 229
        Height = 25
        Caption = '&Editar Comisiones'
        TabOrder = 6
        OnClick = btnEditaComisionesClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Registro de Conceptos Aplicados'
      ImageIndex = 2
      object Label9: TLabel
        Left = 440
        Top = 368
        Width = 79
        Height = 13
        Caption = 'Importe Aplicado'
      end
      object Label13: TLabel
        Left = 440
        Top = 401
        Width = 60
        Height = 13
        Caption = 'Saldo Actual'
      end
      object Bevel1: TBevel
        Left = 428
        Top = 391
        Width = 219
        Height = 2
      end
      object Label22: TLabel
        Left = 440
        Top = 346
        Width = 81
        Height = 13
        Caption = 'Importe Adicional'
      end
      object Label24: TLabel
        Left = 440
        Top = 324
        Width = 55
        Height = 13
        Caption = 'Importe CCI'
      end
      object btnAdicionaConceptos: TButton
        Left = 418
        Top = 428
        Width = 230
        Height = 25
        Caption = '&Alta de Registro de Conceptos Aplicados'
        TabOrder = 0
        OnClick = btnAdicionaConceptosClick
      end
      object StrAlgnGrdConceptos: TStringAlignGrid
        Left = 5
        Top = 8
        Width = 643
        Height = 307
        ColCount = 6
        DefaultRowHeight = 17
        FixedColor = clInfoBk
        RowCount = 2
        TabOrder = 1
        OnDblClick = StrAlgnGrdConceptosDblClick
        ColWidths = (
          1
          0
          64
          215
          233
          103)
        RowHeights = (
          45
          17)
        Cells = (
          2
          0
          'Fecha de '#13#10'Operación'
          3
          0
          'Concepto'
          4
          0
          'Motivo Aplicación'
          5
          0
          'Importe Aplicado')
        PropCell = (
          2
          0
          1
          2
          0
          3
          0
          1
          2
          0
          4
          0
          1
          2
          0)
        PropCol = (
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
          1
          0
          4
          1
          1
          0
          5
          1
          0
          0)
        PropRow = (
          0
          1
          2
          0)
        PropFixedCol = ()
        PropFixedRow = (
          0
          1
          2
          0)
      end
      object edIMP_APLICADO_V1: TInterEdit
        Left = 533
        Top = 366
        Width = 115
        Height = 20
        HelpContext = 1500
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 12
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 2
        ReadOnly = True
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edSDO_ACTUAL_V1: TInterEdit
        Left = 534
        Top = 397
        Width = 113
        Height = 20
        HelpContext = 1500
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
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
      object edIMP_ADICIONAL_V1: TInterEdit
        Left = 533
        Top = 343
        Width = 115
        Height = 20
        HelpContext = 1500
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
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
      object edIMP_CREDITO_V: TInterEdit
        Left = 533
        Top = 320
        Width = 115
        Height = 20
        HelpContext = 1500
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        DisplayMask = '###,###,###,###,##0.00'
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
      object btnEditaConceptos: TButton
        Left = 6
        Top = 427
        Width = 230
        Height = 25
        Caption = '&Modificar Conceptos Aplicados'
        TabOrder = 6
        OnClick = btnEditaConceptosClick
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Datos de Crédito'
      ImageIndex = 4
      object lbCVE_CLAS_LEGAL: TLabel
        Left = 8
        Top = 20
        Width = 88
        Height = 13
        Caption = 'Clasificacion Legal'
      end
      object lbCVE_INF_RECUPERA: TLabel
        Left = 8
        Top = 40
        Width = 70
        Height = 26
        Caption = 'Recuperación Información'
        WordWrap = True
      end
      object edCVE_CLAS_LEGAL: TEdit
        Tag = 530
        Left = 108
        Top = 17
        Width = 92
        Height = 21
        HelpContext = 4000
        CharCase = ecUpperCase
        TabOrder = 0
        OnExit = edCVE_CLAS_LEGALExit
      end
      object btCVE_CLAS_LEGAL: TBitBtn
        Tag = 18
        Left = 201
        Top = 18
        Width = 20
        Height = 21
        HelpContext = 4001
        TabOrder = 1
        OnClick = btCVE_CLAS_LEGALClick
        OnExit = edCVE_CLAS_LEGALExit
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
      object edDESC_CLAS_LEGAL: TEdit
        Left = 218
        Top = 19
        Width = 428
        Height = 21
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 6
      end
      object btCVE_INF_RECUPERA: TBitBtn
        Tag = 18
        Left = 199
        Top = 43
        Width = 20
        Height = 21
        HelpContext = 4101
        TabOrder = 3
        OnClick = btCVE_INF_RECUPERAClick
        OnExit = edCVE_INF_RECUPERAExit
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
      object edDESC_INF_RECUPERA: TEdit
        Left = 218
        Top = 42
        Width = 428
        Height = 21
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 7
      end
      object edCVE_INF_RECUPERA: TEdit
        Tag = 530
        Left = 108
        Top = 42
        Width = 92
        Height = 21
        HelpContext = 4100
        TabOrder = 2
        OnExit = edCVE_INF_RECUPERAExit
      end
      object chB_OPER_CORREC_FOR: TCheckBox
        Tag = 530
        Left = 8
        Top = 84
        Width = 204
        Height = 17
        HelpContext = 4200
        Caption = 'Operación Correctamente Formalizada'
        TabOrder = 4
        OnExit = chB_OPER_CORREC_FORExit
      end
      object ChB_EXP_CRED_COMP: TCheckBox
        Tag = 530
        Left = 233
        Top = 83
        Width = 178
        Height = 17
        HelpContext = 4300
        Caption = 'Expediente de Crédito Completo'
        TabOrder = 5
        OnExit = chB_EXP_CRED_COMPExit
      end
    end
  end
  object MsgPanel: TPanel
    Left = 4
    Top = 585
    Width = 666
    Height = 19
    TabOrder = 1
  end
  object edFH_ALTA: TEdit
    Left = 362
    Top = 559
    Width = 81
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 574
    Top = 559
    Width = 93
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object edTIPO_CAMBIO_DLLS_ANT: TInterEdit
    Tag = 530
    Left = 226
    Top = 513
    Width = 124
    Height = 20
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,###,##0.0000'
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
  object edTIPO_CAMBIO_UDIS_ANT: TInterEdit
    Tag = 530
    Left = 226
    Top = 534
    Width = 124
    Height = 20
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,###,##0.0000'
    MaxLength = 12
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 6
    ReadOnly = True
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edTIPO_CAMBIO_DLLS: TInterEdit
    Tag = 530
    Left = 369
    Top = 513
    Width = 124
    Height = 20
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,###,##0.0000'
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
  object edTIPO_CAMBIO_UDIS: TInterEdit
    Tag = 530
    Left = 369
    Top = 534
    Width = 124
    Height = 20
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,###,##0.0000'
    MaxLength = 12
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 8
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
    Left = 644
    Top = 552
  end
  object ilID_CONTRATO: TInterLinkit
    Control = edID_CONTRATO
    OnEjecuta = ilID_CONTRATOEjecuta
    TipoReader = trContrato
    CharCase = ecNormal
    OnCapture = ilID_CONTRATOCapture
    Left = 243
    Top = 97
  end
  object ilDescInfRec: TInterLinkit
    OnEjecuta = ilDescInfRecEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    OnCapture = ilID_CONTRATOCapture
    Left = 235
    Top = 52
  end
  object ilDescClasLegal: TInterLinkit
    OnEjecuta = ilDescClasLegalEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilID_CONTRATOCapture
    Left = 276
    Top = 49
  end
  object ilCVE_GARANTIA: TInterLinkit
    OnEjecuta = ilCVE_GARANTIAEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    OnCapture = ilID_CONTRATOCapture
    Left = 357
    Top = 113
  end
  object ilCVE_FND_ENT_DES: TInterLinkit
    Control = edCVE_FND_ENT_DES
    OnEjecuta = ilCVE_FND_ENT_DESEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    OnCapture = ilID_CONTRATOCapture
    Left = 357
    Top = 87
  end
end
