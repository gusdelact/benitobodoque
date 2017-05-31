object QrMovCartVda: TQrMovCartVda
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qyMovCartVda
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
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
    100
    2159
    100
    2794
    100
    100
    0)
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = Auto
  PrintIfEmpty = True
  SnapToGrid = True
  Units = MM
  Zoom = 100
  object QRBand2: TQRBand
    Left = 38
    Top = 38
    Width = 980
    Height = 84
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
      222.25
      2592.91666666667)
    BandType = rbPageHeader
    object QRInterEncabezado1: TQRInterEncabezado
      Left = 0
      Top = 0
      Width = 15
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        222.25
        0
        0
        2592.91666666667)
      AlignToBand = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'ARIAL'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object qrgTipoMovto: TQRGroup
    Left = 38
    Top = 164
    Width = 980
    Height = 20
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrgTipoMovtoAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      52.9166666666667
      2592.91666666667)
    Expression = 'qyMovCartVda.MOVTOS'
    Master = Owner
    ReprintOnNewPage = False
    object QRShpTipoCuenta: TQRShape
      Left = 0
      Top = 1
      Width = 974
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        0
        2.64583333333333
        2577.04166666667)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRDBText1: TQRDBText
      Left = 8
      Top = 3
      Width = 387
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        21.1666666666667
        7.9375
        1023.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clBlack
      DataSet = qyMovCartVda
      DataField = 'MOVTOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object QRGroupMoneda: TQRGroup
    Left = 38
    Top = 184
    Width = 980
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRGroupMonedaAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.2708333333333
      2592.91666666667)
    Expression = 'qyMovCartVda.DESC_MONEDA'
    FooterBand = qrbSubMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRShape1: TQRShape
      Left = 0
      Top = 1
      Width = 974
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        0
        2.64583333333333
        2577.04166666667)
      Brush.Color = clGray
      Pen.Color = clGray
      Shape = qrsRectangle
    end
    object QRDBText2: TQRDBText
      Left = 23
      Top = 4
      Width = 41
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        60.8541666666667
        10.5833333333333
        108.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clGray
      DataSet = qyMovCartVda
      DataField = 'CVE_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText3: TQRDBText
      Left = 71
      Top = 4
      Width = 313
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        187.854166666667
        10.5833333333333
        828.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clGray
      DataSet = qyMovCartVda
      DataField = 'DESC_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object QRGroupAgrupacion: TQRGroup
    Left = 38
    Top = 203
    Width = 980
    Height = 20
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRGroupAgrupacionAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      52.9166666666667
      2592.91666666667)
    Expression = 'qyMovCartVda.AGRUPACION'
    FooterBand = qrbSubAgrupacion
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText4: TQRDBText
      Left = 38
      Top = 3
      Width = 313
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        100.541666666667
        7.9375
        828.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovCartVda
      DataField = 'AGRUPACION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object TitleBandEncabezados: TQRBand
    Left = 38
    Top = 122
    Width = 980
    Height = 42
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
      111.125
      2592.91666666667)
    BandType = rbColumnHeader
    object QRShape14: TQRShape
      Left = 494
      Top = 1
      Width = 58
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1307.04166666667
        2.64583333333333
        153.458333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape21: TQRShape
      Left = 774
      Top = 1
      Width = 92
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        2047.875
        2.64583333333333
        243.416666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape11: TQRShape
      Left = 683
      Top = 1
      Width = 92
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1807.10416666667
        2.64583333333333
        243.416666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape3: TQRShape
      Left = 639
      Top = 1
      Width = 45
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1690.6875
        2.64583333333333
        119.0625)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape5: TQRShape
      Left = 551
      Top = 1
      Width = 45
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1457.85416666667
        2.64583333333333
        119.0625)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 556
      Top = 10
      Width = 34
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1471.08333333333
        26.4583333333333
        89.9583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Inicio'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRShape7: TQRShape
      Left = 595
      Top = 1
      Width = 45
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1574.27083333333
        2.64583333333333
        119.0625)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel7: TQRLabel
      Left = 603
      Top = 10
      Width = 33
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1595.4375
        26.4583333333333
        87.3125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Vento'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel3: TQRLabel
      Left = 643
      Top = 4
      Width = 38
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1701.27083333333
        10.5833333333333
        100.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Traspaso Cartera VEncida'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRShape8: TQRShape
      Left = 865
      Top = 1
      Width = 110
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        2288.64583333333
        2.64583333333333
        291.041666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Left = 889
      Top = 13
      Width = 63
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2352.14583333333
        34.3958333333333
        166.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'T O T A L'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel12: TQRLabel
      Left = 693
      Top = 13
      Width = 73
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1833.5625
        34.3958333333333
        193.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'C A P I T A L'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel23: TQRLabel
      Left = 784
      Top = 13
      Width = 73
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2074.33333333333
        34.3958333333333
        193.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'I N T E R E S'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRSHPTCredito: TQRShape
      Left = 247
      Top = 1
      Width = 48
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        653.520833333333
        2.64583333333333
        127)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel17: TQRLabel
      Left = 254
      Top = 16
      Width = 36
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        672.041666666667
        42.3333333333333
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Crédito'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel5: TQRLabel
      Left = 498
      Top = 16
      Width = 47
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1317.625
        42.3333333333333
        124.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Producto'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRShape12: TQRShape
      Left = 294
      Top = 1
      Width = 202
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        777.875
        2.64583333333333
        534.458333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel4: TQRLabel
      Left = 384
      Top = 17
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1016
        44.9791666666667
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Acreditado'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRShape4: TQRShape
      Left = 1
      Top = 1
      Width = 248
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        2.64583333333333
        2.64583333333333
        656.166666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 106
      Top = 16
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        280.458333333333
        42.3333333333333
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Sector'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
  end
  object DetailBand1: TQRBand
    Left = 38
    Top = 223
    Width = 980
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = DetailBand1AfterPrint
    AlignToBottom = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      37.0416666666667
      2592.91666666667)
    BandType = rbDetail
    object QRDBText5: TQRDBText
      Left = 2
      Top = 1
      Width = 17
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        5.29166666666667
        2.64583333333333
        44.9791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovCartVda
      DataField = 'CVE_TIPO_SECTOR'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText6: TQRDBText
      Left = 23
      Top = 1
      Width = 226
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        60.8541666666667
        2.64583333333333
        597.958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovCartVda
      DataField = 'DESC_SECTOR'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText7: TQRDBText
      Left = 254
      Top = 1
      Width = 38
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        672.041666666667
        2.64583333333333
        100.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovCartVda
      DataField = 'ID_CREDITO'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText8: TQRDBText
      Left = 299
      Top = 1
      Width = 195
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        791.104166666667
        2.64583333333333
        515.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovCartVda
      DataField = 'ACREDITADO'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText9: TQRDBText
      Left = 496
      Top = 1
      Width = 55
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1312.33333333333
        2.64583333333333
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovCartVda
      DataField = 'CVE_PRODUCTO_CRE'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText10: TQRDBText
      Left = 555
      Top = 1
      Width = 40
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1468.4375
        2.64583333333333
        105.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovCartVda
      DataField = 'F_INICIO'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText11: TQRDBText
      Left = 598
      Top = 1
      Width = 40
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1582.20833333333
        2.64583333333333
        105.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovCartVda
      DataField = 'F_VENCIMIENTO'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText12: TQRDBText
      Left = 642
      Top = 1
      Width = 40
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1698.625
        2.64583333333333
        105.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovCartVda
      DataField = 'F_TRASPASO_VENC'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText13: TQRDBText
      Left = 684
      Top = 2
      Width = 90
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1809.75
        5.29166666666667
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovCartVda
      DataField = 'IMP_CP'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText14: TQRDBText
      Left = 775
      Top = 1
      Width = 90
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2050.52083333333
        2.64583333333333
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovCartVda
      DataField = 'IMP_IN'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRExpr5: TQRExpr
      Left = 867
      Top = 0
      Width = 108
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2293.9375
        0
        285.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'qyMovCartVda.IMP_CP + qyMovCartVda.IMP_IN'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object qrbSubAgrupacion: TQRBand
    Left = 38
    Top = 237
    Width = 980
    Height = 38
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrbSubAgrupacionAfterPrint
    AlignToBottom = False
    BeforePrint = qrbSubAgrupacionBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = QRGroupAgrupacion
    Size.Values = (
      100.541666666667
      2592.91666666667)
    BandType = rbGroupFooter
    object QRExpr1: TQRExpr
      Left = 669
      Top = 6
      Width = 107
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1770.0625
        15.875
        283.104166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovCartVda.IMP_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr2: TQRExpr
      Left = 759
      Top = 21
      Width = 107
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2008.1875
        55.5625
        283.104166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovCartVda.IMP_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel1: TQRLabel
      Left = 418
      Top = 4
      Width = 214
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1105.95833333333
        10.5833333333333
        566.208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'SUBTOTAL '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      OnPrint = QRLabel1Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRExpr6: TQRExpr
      Left = 866
      Top = 5
      Width = 108
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2291.29166666667
        13.2291666666667
        285.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovCartVda.IMP_CP + qyMovCartVda.IMP_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object qrbSubMoneda: TQRBand
    Left = 38
    Top = 275
    Width = 980
    Height = 44
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrbSubMonedaAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = QRGroupMoneda
    Size.Values = (
      116.416666666667
      2592.91666666667)
    BandType = rbGroupFooter
    object QRShape2: TQRShape
      Left = 1
      Top = 3
      Width = 974
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.8958333333333
        2.64583333333333
        7.9375
        2577.04166666667)
      Brush.Color = clGray
      Pen.Color = clGray
      Shape = qrsRectangle
    end
    object QRExpr3: TQRExpr
      Left = 669
      Top = 5
      Width = 107
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1770.0625
        13.2291666666667
        283.104166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clGray
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovCartVda.IMP_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr4: TQRExpr
      Left = 759
      Top = 21
      Width = 107
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2008.1875
        55.5625
        283.104166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clGray
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovCartVda.IMP_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel2: TQRLabel
      Left = 319
      Top = 6
      Width = 73
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        844.020833333333
        15.875
        193.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'TOTAL MONEDA'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText16: TQRDBText
      Left = 396
      Top = 6
      Width = 41
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1047.75
        15.875
        108.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clGray
      DataSet = qyMovCartVda
      DataField = 'CVE_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText17: TQRDBText
      Left = 444
      Top = 6
      Width = 188
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1174.75
        15.875
        497.416666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clGray
      DataSet = qyMovCartVda
      DataField = 'DESC_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRExpr7: TQRExpr
      Left = 863
      Top = 5
      Width = 107
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2283.35416666667
        13.2291666666667
        283.104166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clGray
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovCartVda.IMP_CP + qyMovCartVda.IMP_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object qyMovCartVda: TQuery
    SQL.Strings = (
      'SELECT '#39'INCREMENTOS'#39' MOVTOS,'
      
        '       CAST(CASE WHEN CRE.TIPO_DISPOSICION='#39'DI'#39' THEN '#39'INCUMPLIMI' +
        'ENTO'#39
      
        '             WHEN CRE.TIPO_DISPOSICION='#39'RS'#39' THEN '#39'REESTRUCTURA'#39' ' +
        ' '
      
        '                         WHEN CRE.TIPO_DISPOSICION='#39'RE'#39' THEN '#39'RE' +
        'NOVACION'#39'  '
      
        '                         ELSE CRE.TIPO_DISPOSICION END AS VARCHA' +
        'R2(20)) AGRUPACION,'
      '       CTO.CVE_MONEDA,  '
      '           MON.DESC_MONEDA,  '
      '       PER.CVE_TIPO_SECTOR, SE.DESC_SECTOR,  '
      '       CRE.ID_CREDITO,  '
      '           PER.NOMBRE ACREDITADO,'
      '           CRCTO.CVE_PRODUCTO_CRE, '
      '           CRE.F_INICIO,'
      '           CRE.F_VENCIMIENTO, '
      '       CHC.F_TRASPASO_VENC, '
      
        '           (SELECT IMP_CAP_VDO_EX + IMP_CAP_VDO_NE FROM CR_CON_A' +
        'DEUDO_SDO WHERE ID_CREDITO = CRE.ID_CREDITO AND F_CIERRE=CHC.F_T' +
        'RASPASO_VENC) IMP_CP, '
      
        '           (SELECT IMP_INT_VDO_EX FROM CR_CON_ADEUDO_SDO WHERE I' +
        'D_CREDITO = CRE.ID_CREDITO AND F_CIERRE=CHC.F_TRASPASO_VENC) IMP' +
        '_IN, '
      '       CRE.SIT_CREDITO, '
      '           CRE.F_LIQUIDACION, '
      '           CRE.ID_CRE_RENOVADO, '
      '           CRE.ID_CRE_RENUEVA, '
      '           CRE.TIPO_DISPOSICION, '
      '           CRE.CVE_TIPO_BAJA '
      'FROM CR_HISTO_CRED CHC, '
      '     CR_CREDITO CRE, '
      '     CONTRATO CTO, '
      '     CR_CONTRATO CRCTO,  '
      '     PERSONA PER, '
      '     SECTOR SE, '
      '     MONEDA MON '
      
        'WHERE CHC.F_CIERRE = TO_DATE('#39'31/03/2012'#39','#39'DD/MM/YYYY'#39')  AND CHC' +
        '.F_TRASPASO_VENC IS NOT NULL '
      
        '  AND CHC.F_TRASPASO_VENC BETWEEN TO_DATE('#39'01/03/2012'#39','#39'DD/MM/YY' +
        'YY'#39') AND TO_DATE('#39'31/03/2012'#39','#39'DD/MM/YYYY'#39')  AND CHC.ID_CREDITO ' +
        '= CRE.ID_CREDITO '
      '  AND CRE.ID_CONTRATO = CTO.ID_CONTRATO '
      '  AND CRE.ID_CONTRATO = CRCTO.ID_CONTRATO '
      '  AND CTO.ID_TITULAR = PER.ID_PERSONA '
      '  AND PER.CVE_TIPO_SECTOR = SE.CVE_SECTOR '
      '  AND CTO.CVE_MONEDA = MON.CVE_MONEDA '
      
        '--ORDER BY CRE.TIPO_DISPOSICION, CTO.CVE_MONEDA, PER.CVE_TIPO_SE' +
        'CTOR, CRE.ID_CREDITO '
      'UNION ALL '
      '-- SALIDA DE CARTERA VENCIDA POR PAGO SOSTENIDO '
      'SELECT '#39'DECREMENTOS'#39' MOVTOS, '
      '       CAST('#39'PAGO SOSTENIDO'#39' AS VARCHAR2(20)) AGRUPACION, '
      '       CTO.CVE_MONEDA, '
      '       MON.DESC_MONEDA, '
      '       PER.CVE_TIPO_SECTOR, SE.DESC_SECTOR, '
      '       CRE.ID_CREDITO, '
      '           PER.NOMBRE ACREDITADO, '
      '           CRCTO.CVE_PRODUCTO_CRE, '
      '           CRE.F_INICIO, '
      '           CRE.F_VENCIMIENTO, '
      '           F_VE.F_TRASPASO_VENC, '
      '           TRAN.IMP_CP, '
      '           TRAN.IMP_IN, '
      '       CRE.SIT_CREDITO, '
      '           CRE.F_LIQUIDACION, '
      '           CRE.ID_CRE_RENOVADO, '
      '           CRE.ID_CRE_RENUEVA, '
      '           CRE.TIPO_DISPOSICION, '
      '           CRE.CVE_TIPO_BAJA '
      'FROM CR_CREDITO CRE, '
      '     -- TRANSACCIONES CAREVI '
      '     (SELECT ID_CREDITO, F_OPERACION, F_VALOR, '
      
        '             SUM(CASE WHEN CVE_OPERACION = '#39'CAREVI'#39' THEN IMP_NET' +
        'O ELSE 0 END) IMP_CP, '
      
        '                  SUM(CASE WHEN CVE_OPERACION = '#39'INREVI'#39' THEN IM' +
        'P_NETO ELSE 0 END) IMP_IN '
      '        FROM CR_TRANSACCION '
      
        '       WHERE F_VALOR BETWEEN TO_DATE('#39'01/03/2012'#39','#39'DD/MM/YYYY'#39') ' +
        'AND TO_DATE('#39'31/03/2012'#39','#39'DD/MM/YYYY'#39')         AND CVE_OPERACION' +
        ' IN ('#39'CAREVI'#39', '#39'INREVI'#39') '
      '       GROUP BY ID_CREDITO, F_OPERACION, F_VALOR) TRAN, '
      '         -- HISTORICO CON FECHA DE TRASPASO A VENCIDO '
      
        '     (SELECT DISTINCT ID_CREDITO, F_TRASPASO_VENC FROM CR_HISTO_' +
        'CRED '
      
        '      WHERE F_CIERRE BETWEEN TO_DATE('#39'01/03/2012'#39','#39'DD/MM/YYYY'#39') ' +
        'AND TO_DATE('#39'31/03/2012'#39','#39'DD/MM/YYYY'#39')        AND F_TRASPASO_VEN' +
        'C IS NOT NULL) F_VE, '
      '     CONTRATO CTO, '
      '     CR_CONTRATO CRCTO, '
      '     PERSONA PER, '
      '     SECTOR SE, '
      '     MONEDA MON '
      'WHERE CRE.ID_CREDITO = TRAN.ID_CREDITO '
      '  AND CRE.ID_CREDITO = F_VE.ID_CREDITO '
      '  AND CRE.ID_CONTRATO = CTO.ID_CONTRATO '
      '  AND CRE.ID_CONTRATO = CRCTO.ID_CONTRATO '
      '  AND CTO.ID_TITULAR = PER.ID_PERSONA '
      '  AND PER.CVE_TIPO_SECTOR = SE.CVE_SECTOR '
      '  AND CTO.CVE_MONEDA = MON.CVE_MONEDA '
      'UNION ALL '
      'SELECT '#39'DECREMENTOS'#39' MOVTOS, '
      '       CAST(OPE.AGRUPACION AS VARCHAR2(20)) AS AGRUPACION, '
      '       CTO.CVE_MONEDA, '
      '           MON.DESC_MONEDA, '
      '       PER.CVE_TIPO_SECTOR, SE.DESC_SECTOR, '
      '       CRE.ID_CREDITO, '
      '       PER.NOMBRE ACREDITADO, '
      '           CRCTO.CVE_PRODUCTO_CRE, '
      '           CRE.F_INICIO, '
      '           CRE.F_VENCIMIENTO, '
      '           CRE.F_TRASPASO_VENC, '
      
        '           SUM(CASE WHEN OPE.CVE_ACCESORIO = '#39'CP'#39' THEN (CASE WHE' +
        'N CRCA.CVE_AFECTA_SDO='#39'I'#39' THEN TR.IMP_NETO ELSE TR.IMP_NETO*-1 E' +
        'ND) ELSE 0 END) IMP_CP, '
      
        '           SUM(CASE WHEN OPE.CVE_ACCESORIO = '#39'IN'#39' THEN (CASE WHE' +
        'N CRCA.CVE_AFECTA_SDO='#39'I'#39' THEN TR.IMP_NETO ELSE TR.IMP_NETO*-1 E' +
        'ND) ELSE 0 END) IMP_IN, '
      '       CRE.SIT_CREDITO, '
      '           CRE.F_LIQUIDACION, '
      '           CRE.ID_CRE_RENOVADO, '
      '           CRE.ID_CRE_RENUEVA, '
      '           CRE.TIPO_DISPOSICION, '
      '           CRE.CVE_TIPO_BAJA '
      'FROM CR_CREDITO CRE, '
      '     CR_TRANSACCION TR, '
      '         CR_DET_TRANSAC TRD, '
      
        '         (SELECT CVE_CLAVE CVE_OPERACION, DESC_CLAVE AGRUPACION,' +
        ' CVE_VALOR_ADIC CVE_ACCESORIO '
      '      FROM CR_CON_CAT_DATA '
      '      WHERE CVE_CON_GPO_CAT ='#39'CAT_CVEOPE_CVEN'#39') OPE, '
      '         CR_REL_CON_AFEC CRCA, '
      
        '         (SELECT * FROM CR_HISTO_CRED WHERE F_CIERRE BETWEEN TO_' +
        'DATE('#39'01/03/2012'#39','#39'DD/MM/YYYY'#39') AND TO_DATE('#39'31/03/2012'#39','#39'DD/MM/' +
        'YYYY'#39')           AND F_TRASPASO_VENC IS NOT NULL) CAR_VEN, '
      '         CONTRATO CTO, '
      '         CR_CONTRATO CRCTO, '
      '         PERSONA PER, '
      '         SECTOR SE, '
      '         MONEDA MON '
      'WHERE TR.ID_CREDITO = CRE.ID_CREDITO '
      '  AND CAR_VEN.ID_CREDITO = CRE.ID_CREDITO '
      
        '  AND TR.F_OPERACION BETWEEN TO_DATE('#39'01/03/2012'#39','#39'DD/MM/YYYY'#39') ' +
        'AND TO_DATE('#39'31/03/2012'#39','#39'DD/MM/YYYY'#39')  AND TR.ID_TRANSACCION = ' +
        'TRD.ID_TRANSACCION '
      '  AND TR.CVE_OPERACION = OPE.CVE_OPERACION '
      '  AND OPE.CVE_OPERACION = CRCA.CVE_OPERACION '
      '  AND TRD.CVE_CONCEPTO = '#39'IMPBRU'#39' '
      '  AND CRE.SIT_CREDITO <> '#39'CA'#39' '
      '  AND TR.SIT_TRANSACCION = '#39'AC'#39' '
      '  AND TR.ID_TRANS_CANCELA IS NULL '
      '  AND TR.CVE_OPERACION = CRCA.CVE_OPERACION '
      '  AND CRCA.CVE_AFECTACION in ('#39'CRCAPA'#39','#39'CIIMPA'#39') '
      '  AND CRE.ID_CONTRATO = CTO.ID_CONTRATO '
      '  AND CRE.ID_CONTRATO = CRCTO.ID_CONTRATO '
      '  AND CTO.ID_TITULAR = PER.ID_PERSONA '
      '  AND PER.CVE_TIPO_SECTOR = SE.CVE_SECTOR '
      '  AND CTO.CVE_MONEDA = MON.CVE_MONEDA '
      
        'GROUP BY OPE.AGRUPACION, CTO.CVE_MONEDA, MON.DESC_MONEDA, PER.CV' +
        'E_TIPO_SECTOR, SE.DESC_SECTOR, CRE.ID_CREDITO, '
      
        '      PER.NOMBRE, CRCTO.CVE_PRODUCTO_CRE, CRE.F_INICIO, CRE.F_VE' +
        'NCIMIENTO, CRE.F_TRASPASO_VENC, '
      
        '      CRE.F_LIQUIDACION, CRE.CVE_TIPO_BAJA, CRE.ID_CRE_RENOVADO,' +
        ' CRE.ID_CRE_RENUEVA, CRE.TIPO_DISPOSICION, CRE.SIT_CREDITO '
      'ORDER BY MOVTOS DESC, DESC_MONEDA, AGRUPACION, ID_CREDITO '
      ' '
      ' ')
    Left = 168
    Top = 18
    object qyMovCartVdaMOVTOS: TStringField
      FieldName = 'MOVTOS'
      FixedChar = True
      Size = 11
    end
    object qyMovCartVdaAGRUPACION: TStringField
      FieldName = 'AGRUPACION'
    end
    object qyMovCartVdaCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyMovCartVdaDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyMovCartVdaCVE_TIPO_SECTOR: TStringField
      FieldName = 'CVE_TIPO_SECTOR'
      Size = 2
    end
    object qyMovCartVdaDESC_SECTOR: TStringField
      FieldName = 'DESC_SECTOR'
      Size = 80
    end
    object qyMovCartVdaID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyMovCartVdaACREDITADO: TStringField
      FieldName = 'ACREDITADO'
      Size = 80
    end
    object qyMovCartVdaCVE_PRODUCTO_CRE: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 6
    end
    object qyMovCartVdaF_INICIO: TDateTimeField
      FieldName = 'F_INICIO'
    end
    object qyMovCartVdaF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qyMovCartVdaF_TRASPASO_VENC: TDateTimeField
      FieldName = 'F_TRASPASO_VENC'
    end
    object qyMovCartVdaIMP_CP: TFloatField
      FieldName = 'IMP_CP'
    end
    object qyMovCartVdaIMP_IN: TFloatField
      FieldName = 'IMP_IN'
    end
    object qyMovCartVdaSIT_CREDITO: TStringField
      FieldName = 'SIT_CREDITO'
      Size = 2
    end
    object qyMovCartVdaF_LIQUIDACION: TDateTimeField
      FieldName = 'F_LIQUIDACION'
    end
    object qyMovCartVdaID_CRE_RENOVADO: TFloatField
      FieldName = 'ID_CRE_RENOVADO'
    end
    object qyMovCartVdaID_CRE_RENUEVA: TFloatField
      FieldName = 'ID_CRE_RENUEVA'
    end
    object qyMovCartVdaTIPO_DISPOSICION: TStringField
      FieldName = 'TIPO_DISPOSICION'
      Size = 2
    end
    object qyMovCartVdaCVE_TIPO_BAJA: TStringField
      FieldName = 'CVE_TIPO_BAJA'
      Size = 2
    end
  end
end
