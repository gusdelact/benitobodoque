object QrRepCrRel: TQrRepCrRel
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  BeforePrint = QuickRepBeforePrint
  DataSet = qyQuery
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  Functions.Strings = (
    'PAGENUMBER'
    'COLUMNNUMBER'
    'REPORTTITLE')
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Options = [FirstPageHeader, LastPageFooter]
  Page.Columns = 1
  Page.Orientation = poLandscape
  Page.PaperSize = Letter
  Page.Values = (
    127
    2159
    127
    2794
    127
    127
    0)
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = First
  PrintIfEmpty = True
  SnapToGrid = True
  Units = Inches
  Zoom = 100
  object PageHeaderBand1: TQRBand
    Left = 48
    Top = 48
    Width = 960
    Height = 49
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      129.645833333333
      2540)
    BandType = rbPageHeader
    object QRLabel19: TQRLabel
      Left = 5
      Top = 16
      Width = 956
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        13.2291666666667
        41.577380952381
        2528.66071428571)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'CREDITO RELACIONADO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object qrlFEHA: TQRLabel
      Left = 5
      Top = 28
      Width = 956
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        13.2291666666667
        73.7053571428571
        2528.66071428571)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'CREDITO RELACIONADO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel23: TQRLabel
      Left = 5
      Top = 41
      Width = 956
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        13.2291666666667
        109.613095238095
        2528.66071428571)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'CIFRAS EN MILES DE PESOS (VALORIZADO)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRLabel26: TQRLabel
      Left = 5
      Top = 1
      Width = 956
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.577380952381
        13.2291666666667
        3.7797619047619
        2528.66071428571)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'BANCO INTERACCIONES, S.A.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object ColumnHeaderBand1: TQRBand
    Left = 48
    Top = 97
    Width = 960
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ColumnHeaderBand1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      63.5
      2540)
    BandType = rbTitle
    object QRShape1: TQRShape
      Left = 0
      Top = 0
      Width = 217
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        0
        0
        574.145833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 13
      Top = 7
      Width = 125
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        35.2777777777778
        17.6388888888889
        330.729166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'ACREDITADO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRShape2: TQRShape
      Left = 856
      Top = 0
      Width = 103
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        2264.39236111111
        0
        273.402777777778)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel14: TQRLabel
      Left = 885
      Top = 2
      Width = 47
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        2341.5625
        4.40972222222222
        123.472222222222)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'FECHA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRShape3: TQRShape
      Left = 908
      Top = 11
      Width = 51
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        2403.29861111111
        28.6631944444444
        134.496527777778)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel7: TQRLabel
      Left = 910
      Top = 13
      Width = 49
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        2407.70833333333
        33.0729166666667
        128.984375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'VENCIMIENTO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRShape5: TQRShape
      Left = 856
      Top = 11
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        2265.49479166667
        29.765625
        140.559895833333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel25: TQRLabel
      Left = 860
      Top = 13
      Width = 47
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        2275.41666666667
        35.2777777777778
        123.472222222222)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'INICIO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRShape6: TQRShape
      Left = 768
      Top = 0
      Width = 89
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        2032.33072916667
        0
        234.817708333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel24: TQRLabel
      Left = 779
      Top = 2
      Width = 68
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        2061.54513888889
        4.40972222222222
        178.59375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'SALDO INSOLUTO CAPITAL MAS INT'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRShape7: TQRShape
      Left = 682
      Top = 0
      Width = 87
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        1805.78125
        0
        231.510416666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel22: TQRLabel
      Left = 692
      Top = 2
      Width = 68
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        1832.23958333333
        4.40972222222222
        178.59375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'CREDITO AUTORIZADO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRShape8: TQRShape
      Left = 626
      Top = 0
      Width = 57
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        1655.85069444444
        0
        152.135416666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel20: TQRLabel
      Left = 632
      Top = 2
      Width = 47
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        1671.28472222222
        4.40972222222222
        123.472222222222)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'TIPO CRÉDITO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRShape9: TQRShape
      Left = 416
      Top = 0
      Width = 211
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        1101.328125
        0
        558.932291666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel18: TQRLabel
      Left = 487
      Top = 2
      Width = 74
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        1287.63888888889
        4.40972222222222
        196.232638888889)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'TIPO DE RELACIÓN ART. 73'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRShape13: TQRShape
      Left = 216
      Top = 0
      Width = 201
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        571.5
        0
        531.8125)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel13: TQRLabel
      Left = 253
      Top = 2
      Width = 127
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        669.395833333333
        5.29166666666667
        336.020833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'RELACIÓN CON EL GRUPO FINANCIERO INTERACCIONES'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
  end
  object BandEconomico: TQRBand
    Left = 48
    Top = 155
    Width = 960
    Height = 8
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = BandEconomicoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      21.1666666666667
      2540)
    BandType = rbGroupFooter
    object QRLabel17: TQRLabel
      Left = 629
      Top = 1
      Width = 39
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1664.22916666667
        2.64583333333333
        103.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL GRUPO '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText6: TQRDBText
      Left = 681
      Top = 1
      Width = 87
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1801.37152777778
        2.20486111111111
        229.305555555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'DESC_GRUPO_ECO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 4
    end
    object QRShape14: TQRShape
      Left = 773
      Top = 0
      Width = 84
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2045.55989583333
        0
        221.588541666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel15: TQRLabel
      Left = 775
      Top = 1
      Width = 80
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2050.52083333333
        2.20486111111111
        211.666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel15'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
  end
  object SummaryBand1: TQRBand
    Left = 48
    Top = 163
    Width = 960
    Height = 128
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = SummaryBand1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      338.666666666667
      2540)
    BandType = rbSummary
    object QRShape4: TQRShape
      Left = 0
      Top = 3
      Width = 960
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        24.8046875
        0
        8.26822916666667
        2540)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 0
      Top = 3
      Width = 188
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        0
        7.9375
        497.416666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL COMPUTABLE PARA EFECTOS DEL ART. 73 L.I.C.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRShape10: TQRShape
      Left = 0
      Top = 14
      Width = 959
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.481770833333
        0
        36.3802083333333
        2536.69270833333)
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Left = 0
      Top = 14
      Width = 961
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        0
        38.0338541666667
        2543.30729166667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 
        'ARTICULO 73 DE LA LEY DE INSTITUCIONES DE CRÉDITO "LA SUMA DE LO' +
        'S CRÉDITOS RELACIONADOS'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object qrlCap: TQRLabel
      Left = 283
      Top = 33
      Width = 198
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        749.1015625
        87.6432291666667
        522.552083333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CAPITAL BÁSICO AL '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object qrPct: TQRLabel
      Left = 284
      Top = 42
      Width = 197
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        750.755208333333
        110.794270833333
        520.8984375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CAPITAL BÁSICO AL '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object qrlCapitalBasico: TQRLabel
      Left = 481
      Top = 33
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1273.30729166667
        87.6432291666667
        153.7890625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CAPITAL BÁSICO AL '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object qrlPctBasico: TQRLabel
      Left = 481
      Top = 42
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1273.30729166667
        110.794270833333
        153.7890625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CAPITAL BÁSICO AL '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRLabel5: TQRLabel
      Left = 0
      Top = 50
      Width = 960
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        0
        132.291666666667
        2540)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'PROPORCIÓN DE CRÉDITO RELACIONADO VS 75% DEL CAPITAL BÁSICO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRShape11: TQRShape
      Left = 450
      Top = 59
      Width = 60
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        1190.625
        155.442708333333
        158.75)
      Shape = qrsRectangle
    end
    object qrlProporcion: TQRLabel
      Left = 450
      Top = 60
      Width = 60
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1190.625
        158.75
        158.75)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlProporcion'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRLabel6: TQRLabel
      Left = 5
      Top = 76
      Width = 956
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        13.2291666666667
        201.083333333333
        2529.41666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Certificación'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRLabel8: TQRLabel
      Left = 0
      Top = 102
      Width = 960
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        0
        269.544270833333
        2540)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Manuel Velasco Velásquez'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRLabel10: TQRLabel
      Left = 0
      Top = 110
      Width = 960
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        0
        291.041666666667
        2540)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 
        'Secretario del Consejo de Administración de BANCO INTERACCIONES,' +
        ' S.A.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRLabel11: TQRLabel
      Left = 0
      Top = 119
      Width = 960
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        0
        314.192708333333
        2540)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'INSTITUCIÓN DE BANCA MÚLTIPLE, GRUPO FINANCIERO INTERACCIONES'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRShape12: TQRShape
      Left = 381
      Top = 101
      Width = 200
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        3.30729166666667
        1007.0703125
        267.890625
        529.166666666667)
      Shape = qrsHorLine
    end
    object QRLabel4: TQRLabel
      Left = 775
      Top = 4
      Width = 80
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2050.52083333333
        9.921875
        211.666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel4'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRLabel12: TQRLabel
      Left = 0
      Top = 24
      Width = 961
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        0
        62.8385416666667
        2543.30729166667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 
        'NO PODRÁ EXCEDERSE DEL 75% DEL CAPITAL DE LA INSTITUCIÓN AL ÚLTI' +
        'MO TRIMESTRE NATURAL".'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
  end
  object QRBand1: TQRBand
    Left = 48
    Top = 147
    Width = 960
    Height = 8
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRBand1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      21.1666666666667
      2540)
    BandType = rbGroupFooter
    object QRLabel3: TQRLabel
      Left = 629
      Top = 0
      Width = 54
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1664.22916666667
        0
        142.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL ACREDITADO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRLabel16: TQRLabel
      Left = 775
      Top = 0
      Width = 80
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2050.52083333333
        0
        211.666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel16'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
  end
  object QRGroupEconomico: TQRGroup
    Left = 48
    Top = 121
    Width = 960
    Height = 8
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroupEconomicoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      21.1666666666667
      2540)
    Expression = 'qyQuery.CVE_GRUPO_ECO'
    FooterBand = BandEconomico
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText17: TQRDBText
      Left = 50
      Top = 0
      Width = 69
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        132.291666666667
        0
        182.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'DESC_GRUPO_ECO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 5
    end
    object QRDBText32: TQRDBText
      Left = 4
      Top = 1
      Width = 34
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        10.5833333333333
        2.64583333333333
        89.9583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'CVE_GRUPO_ECO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
  end
  object QRAcreditado: TQRGroup
    Left = 48
    Top = 129
    Width = 960
    Height = 1
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRAcreditadoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      2.64583333333333
      2540)
    Expression = 'qyQuery.ID_ACREDITADO'
    FooterBand = QRBand1
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGroup3: TQRGroup
    Left = 48
    Top = 130
    Width = 960
    Height = 1
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      2.64583333333333
      2540)
    Expression = 'qyQuery.CVE_MONEDA'
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGroup4: TQRGroup
    Left = 48
    Top = 131
    Width = 960
    Height = 1
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      2.64583333333333
      2540)
    Expression = 'qyQuery.TIPO_CREDITO'
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGroup1: TQRGroup
    Left = 48
    Top = 132
    Width = 960
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroup1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      39.6875
      2540)
    Expression = 'qyQuery.ID_CONTRATO'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText8: TQRDBText
      Left = 627
      Top = 0
      Width = 53
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1658.9375
        0
        140.229166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'TIPO_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText11: TQRDBText
      Left = 687
      Top = 5
      Width = 82
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1816.80555555556
        13.2291666666667
        216.076388888889)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IMP_AUTORIZADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,##0'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText12: TQRDBText
      Left = 775
      Top = 5
      Width = 80
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2050.52083333333
        13.2291666666667
        211.666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'SDO_INSOLUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,##0'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRExpr1: TQRExpr
      Left = 687
      Top = -2
      Width = 82
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1817.6875
        -5.29166666666667
        216.958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 
        'IF(qyQuery.CVE_MONEDA = 484,'#39'M.N.'#39',IF(qyQuery.CVE_MONEDA = 840,'#39 +
        'DLLS'#39','#39' '#39'))'
      FontSize = 4
    end
    object QRDBText7: TQRDBText
      Left = 417
      Top = 2
      Width = 204
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1102.43055555556
        4.40972222222222
        540.190972222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyQuery
      DataField = 'DESC_TIPO_ACRED'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText9: TQRDBText
      Left = 217
      Top = 2
      Width = 196
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        573.263888888889
        4.40972222222222
        518.142361111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyQuery
      DataField = 'TX_REL_GPO_GFI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object qrlAcreditado: TQRLabel
      Left = 2
      Top = 2
      Width = 207
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        4.40972222222222
        4.40972222222222
        546.805555555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'qrlAcreditado'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRExpr2: TQRExpr
      Left = 910
      Top = -2
      Width = 47
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2407.70833333333
        -4.40972222222222
        123.472222222222)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'IF(qyQuery.B_APLICA_INVERS = '#39'V'#39','#39'CTA. CONTABLE '#39','#39' '#39')'
      FontSize = 4
    end
    object QRDBText1: TQRDBText
      Left = 910
      Top = 5
      Width = 47
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2407.70833333333
        13.2291666666667
        123.472222222222)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'ID_CONTRATO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRLabel21: TQRLabel
      Left = 2
      Top = 8
      Width = 207
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        5.29166666666667
        21.1666666666667
        547.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'RELACIÓN CON LA EMPRESA : '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object qrlFECHA_PAGO: TQRLabel
      Left = 914
      Top = -1
      Width = 46
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        2418.29166666667
        -2.64583333333333
        121.708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'FECHA DE PAGO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object qrlF_VENCIMIENTO: TQRLabel
      Left = 915
      Top = 5
      Width = 43
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2420.9375
        13.2291666666667
        114.652777777778)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'F_VENCIMIENTO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object qrlF_INICIO: TQRLabel
      Left = 860
      Top = 5
      Width = 47
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2275.41666666667
        13.2291666666667
        123.472222222222)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'F_INICIO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object qrlINVERS: TQRLabel
      Left = 641
      Top = 6
      Width = 28
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1695.97916666667
        15.875
        74.0833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '(*)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRLabel28: TQRLabel
      Left = 697
      Top = -2
      Width = 62
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1844.14583333333
        -5.29166666666667
        164.041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'VALUACION'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
  end
  object qyQuery: TQuery
    SQL.Strings = (
      
        ' SELECT  CD.ID_DOCUMENTO,  CC.ID_CREDITO,  CD.ID_CESION,  CD.F_E' +
        'MISION,  CD.F_COMPRA,  CD.TASA_AFORO,  CD.TASA_COMISION, 0 IMP_C' +
        'OM_EMIS,'
      
        ' CD.TASA_DESCUENTO,  CD.IMP_NOMINAL,  CD.SIT_DOCUMENTO,  CTD.DES' +
        'C_DOCUMENTO,  CCA.F_VENCIMIENTO,  CCA.F_PROG_PAGO,  CCA.F_PAGO,'
      
        ' CCA.PLAZO,  CCA.IMP_PAGADO,  CCA.IMP_CAPITAL IMP_AFORADO,  0 IM' +
        'P_INTERES,  0 IMP_COMPRA,'
      
        ' 0 IMP_COMISION,  CC.ID_PROM_ADM,  CC.ID_CONTRATO,  PPR.NOMBRE N' +
        'OM_PROMOTOR,  CTO.CVE_MONEDA,  M.DESC_MONEDA,'
      
        ' CCE.ID_EMISOR,  DECODE(CCE.CVE_TIPO_INTERES,'#39'IN'#39','#39'INICIO'#39') CVE_' +
        'TIPO_INTERES,  CCE.CVE_EMISOR_NAFIN,  CCE.ID_PROVEEDOR,'
      
        ' CCE.PCT_COMISION,  0 IMP_COMIS_PROV,  DECODE(CCE.B_OPERADO_NAFI' +
        'N,'#39'F'#39','#39'R P'#39') B_OPERADO_NAFIN,'
      
        ' PE.NOMBRE_PERSONA NOM_EMISOR,  CE.NOMBRE_EMISOR,  PCE.CVE_TIPO_' +
        'SECTOR,  '#39'ABC'#39' CHEQUERA_EMI, PP.NOMBRE NOM_PROVEEDOR,'
      
        ' '#39'ABC'#39' CHEQUERA_PROV,  '#39'XXX'#39' CHEQUERA_PROV_L,  CP.ID_PROV_NAFINS' +
        'A,  CR.IMP_REMANENTE,'
      ' 0  IMP_X_PAGAR'
      
        ' FROM  CR_DOCUMENTO  CD,  CR_TIPO_DOCTO CTD,  CR_CAPITAL    CCA,' +
        '  CR_INTERES    CCI,  CR_COMISION   CCC,  CR_CREDITO    CC,'
      
        ' PERSONA       PPR,  CONTRATO      CTO,  MONEDA        M,  CR_CE' +
        'SION     CCE,  CR_CESION_COMIS CCCO,  PERSONA_FISICA PE,'
      
        ' PERSONA       PCE, CR_EMISOR     CE,  PERSONA       PP,  CR_PRO' +
        'VEEDOR  CP,  CR_REMANENTE  CR'
      
        ' WHERE CTD.CVE_DOCUMENTO = CD.CVE_DOCUMENTO  AND   CCA.ID_CREDIT' +
        'O = CD.ID_CESION  AND   CCA.NUM_PERIODO = CD.NUM_PERIODO_DOC'
      
        ' AND   CCI.ID_CREDITO = CD.ID_CESION  AND   CCI.NUM_PERIODO = CD' +
        '.NUM_PERIODO_DOC  AND   CCC.ID_CREDITO = CD.ID_CESION'
      
        ' AND   CCC.NUM_PERIODO = CD.NUM_PERIODO_DOC  AND   CC.ID_CREDITO' +
        ' = CD.ID_CESION  AND   PPR.ID_PERSONA = CC.ID_PROM_ADM'
      
        ' AND   CTO.ID_CONTRATO = CC.ID_CONTRATO  AND   M.CVE_MONEDA = CT' +
        'O.CVE_MONEDA  AND   CCE.ID_CESION = CD.ID_CESION  AND'
      
        ' CCCO.ID_CESION = CCE.ID_CESION  AND   CCCO.CVE_COMISION = '#39'CODI' +
        'PR'#39' AND   PE.ID_PERSONA= CCE.ID_EMISOR  AND'
      
        ' PCE.ID_PERSONA = CCE.ID_EMISOR  AND   CE.ID_ACREDITADO = CCE.ID' +
        '_EMISOR  AND   CE.CVE_EMISOR_NAFIN = CCE.CVE_EMISOR_NAFIN'
      
        ' AND   PP.ID_PERSONA = CCE.ID_PROVEEDOR  AND   CP.ID_ACREDITADO ' +
        '= CCE.ID_PROVEEDOR  AND   CR.ID_CESION = CD.ID_CESION'
      
        ' AND   CR.ID_DOCUMENTO = CD.ID_DOCUMENTO  AND   CR.CVE_TIPO_REMA' +
        'N = '#39'RE'#39
      '')
    Left = 235
    Top = 5
  end
end
