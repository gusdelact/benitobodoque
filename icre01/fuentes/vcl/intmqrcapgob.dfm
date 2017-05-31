object QrCapGob: TQrCapGob
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
  DataSet = qryCapGob
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
    Height = 84
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      222.25
      2540)
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
        2540)
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
  object ColumnHeaderBand1: TQRBand
    Left = 48
    Top = 136
    Width = 960
    Height = 60
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      158.75
      2540)
    BandType = rbColumnHeader
    object qrShpAdeudoTotal: TQRShape
      Left = 0
      Top = 1
      Width = 70
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        0
        2.64583333333333
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrshpCalificadoras: TQRShape
      Left = 138
      Top = 1
      Width = 331
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        365.125
        2.64583333333333
        875.770833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblAdeudoTotal: TQRLabel
      Left = 4
      Top = 15
      Width = 63
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        10.5833333333333
        39.6875
        166.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'TOTAL'
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
    object qrlblCalificadoras: TQRLabel
      Left = 143
      Top = 3
      Width = 322
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        378.354166666667
        7.9375
        851.958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'CALIFICADORAS'
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
    object qrShpSdoPromedio: TQRShape
      Left = 69
      Top = 1
      Width = 70
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        182.5625
        2.64583333333333
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblSdoPromedio: TQRLabel
      Left = 73
      Top = 15
      Width = 63
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        193.145833333333
        39.6875
        166.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'SALDO PROMEDIO'
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
    object qrShpNomCalificadora1: TQRShape
      Left = 138
      Top = 15
      Width = 56
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        113.770833333333
        365.125
        39.6875
        148.166666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrShpNomCalificadora2: TQRShape
      Left = 193
      Top = 15
      Width = 56
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        113.770833333333
        510.645833333333
        39.6875
        148.166666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrShpNomCalificadora3: TQRShape
      Left = 248
      Top = 15
      Width = 56
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        113.770833333333
        656.166666666667
        39.6875
        148.166666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrShpNomCalificadora4: TQRShape
      Left = 303
      Top = 15
      Width = 56
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        113.770833333333
        801.6875
        39.6875
        148.166666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrshpNomCalificadora5: TQRShape
      Left = 358
      Top = 15
      Width = 56
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        113.770833333333
        947.208333333333
        39.6875
        148.166666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrShpNomCalificadora6: TQRShape
      Left = 413
      Top = 15
      Width = 56
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        113.770833333333
        1092.72916666667
        39.6875
        148.166666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrShpPct1: TQRShape
      Left = 468
      Top = 1
      Width = 70
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1238.25
        2.64583333333333
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblPct1: TQRLabel
      Left = 473
      Top = 3
      Width = 61
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1251.47916666667
        7.9375
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '1.6'
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
    object qrShpPct2: TQRShape
      Left = 468
      Top = 15
      Width = 70
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1238.25
        39.6875
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblPct2: TQRLabel
      Left = 473
      Top = 17
      Width = 61
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1251.47916666667
        44.9791666666667
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'V.34.1'
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
    object qrShpPct3: TQRShape
      Left = 468
      Top = 29
      Width = 277
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1238.25
        76.7291666666667
        732.895833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblPct: TQRLabel
      Left = 473
      Top = 31
      Width = 268
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1251.47916666667
        82.0208333333333
        709.083333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'PORCENTAJES DE PONDERACIÓN'
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
    object qrShpPct4: TQRShape
      Left = 468
      Top = 43
      Width = 70
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1238.25
        113.770833333333
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblPct3: TQRLabel
      Left = 473
      Top = 45
      Width = 61
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1251.47916666667
        119.0625
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '20%'
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
    object qrShpPct5: TQRShape
      Left = 537
      Top = 1
      Width = 70
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1420.8125
        2.64583333333333
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblPct4: TQRLabel
      Left = 542
      Top = 3
      Width = 61
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1434.04166666667
        7.9375
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '4'
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
    object qrShpPct6: TQRShape
      Left = 537
      Top = 15
      Width = 70
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1420.8125
        39.6875
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblPct5: TQRLabel
      Left = 542
      Top = 17
      Width = 61
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1434.04166666667
        44.9791666666667
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'V.34.2'
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
    object qrShpPct7: TQRShape
      Left = 537
      Top = 43
      Width = 70
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1420.8125
        113.770833333333
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblPct6: TQRLabel
      Left = 542
      Top = 45
      Width = 61
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1434.04166666667
        119.0625
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '50%'
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
    object qrShpPct8: TQRShape
      Left = 606
      Top = 1
      Width = 70
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1603.375
        2.64583333333333
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblPct7: TQRLabel
      Left = 611
      Top = 3
      Width = 61
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1616.60416666667
        7.9375
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '9.2'
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
    object qrShpPct9: TQRShape
      Left = 606
      Top = 15
      Width = 70
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1603.375
        39.6875
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblPct8: TQRLabel
      Left = 611
      Top = 17
      Width = 61
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1616.60416666667
        44.9791666666667
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'V.34.3'
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
    object qrShpPct10: TQRShape
      Left = 606
      Top = 43
      Width = 70
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1603.375
        113.770833333333
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblPct9: TQRLabel
      Left = 610
      Top = 45
      Width = 61
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1613.95833333333
        119.0625
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '115%'
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
    object qrShpPct11: TQRShape
      Left = 675
      Top = 1
      Width = 70
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1785.9375
        2.64583333333333
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblPct10: TQRLabel
      Left = 680
      Top = 3
      Width = 61
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1799.16666666667
        7.9375
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '12'
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
    object qrShpPct12: TQRShape
      Left = 675
      Top = 15
      Width = 70
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1785.9375
        39.6875
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblPct11: TQRLabel
      Left = 680
      Top = 17
      Width = 61
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1799.16666666667
        44.9791666666667
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'V.34.4'
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
    object qrShpPct13: TQRShape
      Left = 675
      Top = 43
      Width = 70
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1785.9375
        113.770833333333
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblPct12: TQRLabel
      Left = 680
      Top = 45
      Width = 61
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1799.16666666667
        119.0625
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '150%'
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
    object qrShpTOTAL: TQRShape
      Left = 744
      Top = 1
      Width = 72
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        1968.5
        2.64583333333333
        190.5)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblTOTAL: TQRLabel
      Left = 748
      Top = 15
      Width = 65
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1979.08333333333
        39.6875
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'TOTAL'
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
    object qrShpTOTAL_ANT: TQRShape
      Left = 815
      Top = 1
      Width = 72
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        2156.35416666667
        2.64583333333333
        190.5)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblTOTAL_ANT: TQRLabel
      Left = 819
      Top = 15
      Width = 65
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        2166.9375
        39.6875
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'TOTAL MES ANTERIOR'
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
    object qrShpVARIACION: TQRShape
      Left = 886
      Top = 1
      Width = 72
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        2344.20833333333
        2.64583333333333
        190.5)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblVARIACION: TQRLabel
      Left = 890
      Top = 15
      Width = 65
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        2354.79166666667
        39.6875
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'VARIACIÓN'
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
    object qrdbNOM_CALIFICADORA6: TQRDBText
      Left = 416
      Top = 17
      Width = 49
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.1875
        1100.66666666667
        44.9791666666667
        129.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clSilver
      DataSet = qryCapGob
      DataField = 'NOM_CALIFICADORA6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrlbNOM_CALIFICADORA1: TQRLabel
      Left = 142
      Top = 17
      Width = 49
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.1875
        375.708333333333
        44.9791666666667
        129.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'qrlbNOM_CALIFICADORA1'
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
    object qrlbNOM_CALIFICADORA2: TQRLabel
      Left = 197
      Top = 17
      Width = 49
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.1875
        521.229166666667
        44.9791666666667
        129.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'qrlbNOM_CALIFICADORA2'
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
    object qrlbNOM_CALIFICADORA3: TQRLabel
      Left = 251
      Top = 17
      Width = 49
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.1875
        664.104166666667
        44.9791666666667
        129.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'qrlbNOM_CALIFICADORA3'
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
    object qrlbNOM_CALIFICADORA4: TQRLabel
      Left = 307
      Top = 17
      Width = 49
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.1875
        812.270833333333
        44.9791666666667
        129.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'qrlbNOM_CALIFICADORA4'
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
    object qrlbNOM_CALIFICADORA5: TQRLabel
      Left = 361
      Top = 17
      Width = 49
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.1875
        955.145833333333
        44.9791666666667
        129.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'qrlbNOM_CALIFICADORA5'
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
    object qrlbNOM_CALIFICADORA6: TQRLabel
      Left = 416
      Top = 17
      Width = 49
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.1875
        1100.66666666667
        44.9791666666667
        129.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'qrlbNOM_CALIFICADORA6'
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
  object TitleBand1: TQRBand
    Left = 48
    Top = 132
    Width = 960
    Height = 4
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
      10.5833333333333
      2540)
    BandType = rbTitle
  end
  object qrGrpCVE_MONEDA: TQRGroup
    Left = 48
    Top = 196
    Width = 960
    Height = 19
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
      50.2708333333333
      2540)
    Expression = 'qryCapGob.CVE_MONEDA'
    FooterBand = qrFootCVE_MONEDA
    Master = Owner
    ReprintOnNewPage = False
    object QRShape1: TQRShape
      Left = 3
      Top = 2
      Width = 956
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        7.9375
        5.29166666666667
        2529.41666666667)
      Shape = qrsRectangle
    end
    object qrdbCVE_MONEDA: TQRDBText
      Left = 51
      Top = 4
      Width = 56
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        134.9375
        10.5833333333333
        148.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'CVE_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrlbMONEDA: TQRLabel
      Left = 4
      Top = 4
      Width = 46
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        10.5833333333333
        10.5833333333333
        121.708333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'MONEDA'
      Color = clWhite
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
    object qrdbDESC_MONEDA: TQRDBText
      Left = 110
      Top = 4
      Width = 62
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        291.041666666667
        10.5833333333333
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'DESC_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object qrDetail: TQRBand
    Left = 48
    Top = 253
    Width = 960
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrDetailAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      34.3958333333333
      2540)
    BandType = rbDetail
    object qrdbADEUDO_TOTAL: TQRDBText
      Left = 2
      Top = 1
      Width = 64
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
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'ADEUDO_TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbSDO_PROM_MES_ACT: TQRDBText
      Left = 69
      Top = 1
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        182.5625
        2.64583333333333
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'SDO_PROM_MES_ACT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbCVE_CALIFICACION1: TQRDBText
      Left = 136
      Top = 1
      Width = 55
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        359.833333333333
        2.64583333333333
        145.520833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'CVE_CALIFICACION1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbCVE_CALIFICACION2: TQRDBText
      Left = 192
      Top = 1
      Width = 55
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        508
        2.64583333333333
        145.520833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'CVE_CALIFICACION2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbCVE_CALIFICACION3: TQRDBText
      Left = 248
      Top = 1
      Width = 55
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        656.166666666667
        2.64583333333333
        145.520833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'CVE_CALIFICACION3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbCVE_CALIFICACION4: TQRDBText
      Left = 304
      Top = 1
      Width = 55
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        804.333333333333
        2.64583333333333
        145.520833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'CVE_CALIFICACION4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbCVE_CALIFICACION5: TQRDBText
      Left = 360
      Top = 1
      Width = 55
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        952.5
        2.64583333333333
        145.520833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'CVE_CALIFICACION5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbCVE_CALIFICACION6: TQRDBText
      Left = 416
      Top = 1
      Width = 55
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1100.66666666667
        2.64583333333333
        145.520833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'CVE_CALIFICACION6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbPCT_20: TQRDBText
      Left = 473
      Top = 0
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1251.47916666667
        0
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'PCT_20'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      OnPrint = qrdbPCT_20Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbPCT_50: TQRDBText
      Left = 540
      Top = 1
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1428.75
        2.64583333333333
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'PCT_50'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      OnPrint = qrdbPCT_20Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbPCT_115: TQRDBText
      Left = 608
      Top = 1
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1608.66666666667
        2.64583333333333
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'PCT_115'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      OnPrint = qrdbPCT_20Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbPCT_150: TQRDBText
      Left = 676
      Top = 1
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1788.58333333333
        2.64583333333333
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'PCT_150'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      OnPrint = qrdbPCT_20Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbSDO_PROM_MES_ACT1: TQRDBText
      Left = 747
      Top = 1
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1976.4375
        2.64583333333333
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'SDO_PROM_MES_ACT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbSDO_PROM_MES_ANT: TQRDBText
      Left = 819
      Top = 1
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2166.9375
        2.64583333333333
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'SDO_PROM_MES_ANT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbVARIACION: TQRDBText
      Left = 889
      Top = 1
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2352.14583333333
        2.64583333333333
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'VARIACION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object qrFootB_APL_INSCR_DEUD: TQRBand
    Left = 48
    Top = 274
    Width = 960
    Height = 34
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
      89.9583333333333
      2540)
    BandType = rbGroupFooter
    object QRShape4: TQRShape
      Left = 24
      Top = 2
      Width = 934
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        63.5
        5.29166666666667
        2471.20833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrdbTX_B_APL_INSCR_DEUD1: TQRDBText
      Left = 77
      Top = 4
      Width = 96
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        203.729166666667
        10.5833333333333
        254)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clSilver
      DataSet = qryCapGob
      DataField = 'TX_B_APL_INSCR_DEUD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrlblTotal1: TQRLabel
      Left = 28
      Top = 4
      Width = 47
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        74.0833333333333
        10.5833333333333
        124.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Total por'
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
    object qrExpSumPCT_20: TQRExpr
      Left = 473
      Top = 18
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1251.47916666667
        47.625
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCapGob.PCT_20)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object qrExpSumPCT_50: TQRExpr
      Left = 540
      Top = 18
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1428.75
        47.625
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCapGob.PCT_50)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object qrExpSumPCT_115: TQRExpr
      Left = 608
      Top = 18
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1608.66666666667
        47.625
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCapGob.PCT_115)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object qrExpSumPCT_150: TQRExpr
      Left = 676
      Top = 18
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1788.58333333333
        47.625
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCapGob.PCT_150)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object qrExpSumSDO_PROM_MES_ACT1: TQRExpr
      Left = 747
      Top = 18
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1976.4375
        47.625
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCapGob.SDO_PROM_MES_ACT)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object qrExpSumSDO_PROM_MES_ANT: TQRExpr
      Left = 819
      Top = 18
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2166.9375
        47.625
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCapGob.SDO_PROM_MES_ANT)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object qrExpSumVARIACION: TQRExpr
      Left = 889
      Top = 18
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2352.14583333333
        47.625
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCapGob.VARIACION)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object qrlblADEUDO_TOTAL: TQRLabel
      Left = 28
      Top = 18
      Width = 51
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        74.0833333333333
        47.625
        134.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'Adeudo Total'
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
    object qrExpSumADEUDO_TOTAL: TQRExpr
      Left = 81
      Top = 18
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        214.3125
        47.625
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCapGob.ADEUDO_TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object qrGrpB_APL_INSCR_DEUD: TQRGroup
    Left = 48
    Top = 215
    Width = 960
    Height = 26
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
      68.7916666666667
      2540)
    Expression = 'qryCapGob.B_APL_INSCR_DEUD'
    FooterBand = qrFootB_APL_INSCR_DEUD
    Master = Owner
    ReprintOnNewPage = False
    object QRShape3: TQRShape
      Left = 24
      Top = 8
      Width = 934
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        63.5
        21.1666666666667
        2471.20833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrdbTX_B_APL_INSCR_DEUD: TQRDBText
      Left = 28
      Top = 10
      Width = 96
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        74.0833333333333
        26.4583333333333
        254)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clSilver
      DataSet = qryCapGob
      DataField = 'TX_B_APL_INSCR_DEUD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object qrGrpID_ACREDITADO: TQRGroup
    Left = 48
    Top = 241
    Width = 960
    Height = 12
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
      31.75
      2540)
    Expression = 'qryCapGob.ID_ACREDITADO'
    FooterBand = qrFootID_ACREDITADO
    Master = Owner
    ReprintOnNewPage = False
    object qrdbID_ACREDITADO: TQRDBText
      Left = 113
      Top = 1
      Width = 56
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        298.979166666667
        2.64583333333333
        148.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'ID_ACREDITADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrlblACREDITADO: TQRLabel
      Left = 50
      Top = 1
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        132.291666666667
        2.64583333333333
        156.104166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'ACREDITADO'
      Color = clWhite
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
    object qrdbNOM_ACREDITADO: TQRDBText
      Left = 172
      Top = 1
      Width = 76
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        455.083333333333
        2.64583333333333
        201.083333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'NOM_ACREDITADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object qrFootID_ACREDITADO: TQRBand
    Left = 48
    Top = 266
    Width = 960
    Height = 8
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
      21.1666666666667
      2540)
    BandType = rbGroupFooter
  end
  object qrFootCVE_MONEDA: TQRBand
    Left = 48
    Top = 308
    Width = 960
    Height = 34
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
      89.9583333333333
      2540)
    BandType = rbGroupFooter
    object QRShape2: TQRShape
      Left = 2
      Top = 2
      Width = 956
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        5.29166666666667
        5.29166666666667
        2529.41666666667)
      Shape = qrsRectangle
    end
    object qrdbCVE_MONEDA1: TQRDBText
      Left = 87
      Top = 4
      Width = 56
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        230.1875
        10.5833333333333
        148.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'CVE_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrlblTotalMoneda: TQRLabel
      Left = 4
      Top = 4
      Width = 81
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        10.5833333333333
        10.5833333333333
        214.3125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Total por MONEDA'
      Color = clWhite
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
    object qrdbDESC_MONEDA1: TQRDBText
      Left = 145
      Top = 4
      Width = 62
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        383.645833333333
        10.5833333333333
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qryCapGob
      DataField = 'DESC_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrExpSum1PCT_20: TQRExpr
      Left = 473
      Top = 18
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1251.47916666667
        47.625
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCapGob.PCT_20)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object qrExpSum1PCT_50: TQRExpr
      Left = 540
      Top = 18
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1428.75
        47.625
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCapGob.PCT_50)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object qrExpSum1PCT_115: TQRExpr
      Left = 608
      Top = 18
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1608.66666666667
        47.625
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCapGob.PCT_115)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object qrExpSum1PCT_150: TQRExpr
      Left = 676
      Top = 18
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1788.58333333333
        47.625
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCapGob.PCT_150)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object qrExpSum1SDO_PROM_MES_ACT1: TQRExpr
      Left = 747
      Top = 18
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1976.4375
        47.625
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCapGob.SDO_PROM_MES_ACT)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object qrExpSum1SDO_PROM_MES_ANT: TQRExpr
      Left = 819
      Top = 18
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2166.9375
        47.625
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCapGob.SDO_PROM_MES_ANT)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object qrExpSum1VARIACION: TQRExpr
      Left = 889
      Top = 18
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2352.14583333333
        47.625
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCapGob.VARIACION)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel6: TQRLabel
      Left = 4
      Top = 18
      Width = 51
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        10.5833333333333
        47.625
        134.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'Adeudo Total'
      Color = clWhite
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
    object qrExpSum1ADEUDO_TOTAL: TQRExpr
      Left = 59
      Top = 18
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        156.104166666667
        47.625
        169.333333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCapGob.ADEUDO_TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object qryCapGob: TQuery
    Left = 31
    Top = 6
    object qryCapGobID_ACREDITADO: TFloatField
      FieldName = 'ID_ACREDITADO'
    end
    object qryCapGobCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qryCapGobDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qryCapGobTX_B_APL_INSCR_DEUD: TStringField
      FieldName = 'TX_B_APL_INSCR_DEUD'
      Size = 200
    end
    object qryCapGobB_APL_INSCR_DEUD: TStringField
      FieldName = 'B_APL_INSCR_DEUD'
      Size = 30
    end
    object qryCapGobNOM_ACREDITADO: TStringField
      FieldName = 'NOM_ACREDITADO'
      Size = 255
    end
    object qryCapGobNOM_CALIFICADORA1: TStringField
      FieldName = 'NOM_CALIFICADORA1'
      Size = 255
    end
    object qryCapGobNOM_CALIFICADORA2: TStringField
      FieldName = 'NOM_CALIFICADORA2'
      Size = 255
    end
    object qryCapGobNOM_CALIFICADORA3: TStringField
      FieldName = 'NOM_CALIFICADORA3'
      Size = 255
    end
    object qryCapGobNOM_CALIFICADORA4: TStringField
      FieldName = 'NOM_CALIFICADORA4'
      Size = 255
    end
    object qryCapGobNOM_CALIFICADORA5: TStringField
      FieldName = 'NOM_CALIFICADORA5'
      Size = 255
    end
    object qryCapGobNOM_CALIFICADORA6: TStringField
      FieldName = 'NOM_CALIFICADORA6'
      Size = 255
    end
    object qryCapGobCVE_CALIFICACION1: TMemoField
      FieldName = 'CVE_CALIFICACION1'
      BlobType = ftMemo
      Size = 4000
    end
    object qryCapGobCVE_CALIFICACION2: TMemoField
      FieldName = 'CVE_CALIFICACION2'
      BlobType = ftMemo
      Size = 4000
    end
    object qryCapGobCVE_CALIFICACION3: TMemoField
      FieldName = 'CVE_CALIFICACION3'
      BlobType = ftMemo
      Size = 4000
    end
    object qryCapGobCVE_CALIFICACION4: TMemoField
      FieldName = 'CVE_CALIFICACION4'
      BlobType = ftMemo
      Size = 4000
    end
    object qryCapGobCVE_CALIFICACION5: TMemoField
      FieldName = 'CVE_CALIFICACION5'
      BlobType = ftMemo
      Size = 4000
    end
    object qryCapGobCVE_CALIFICACION6: TMemoField
      FieldName = 'CVE_CALIFICACION6'
      BlobType = ftMemo
      Size = 4000
    end
    object qryCapGobVARIACION: TFloatField
      FieldName = 'VARIACION'
    end
    object qryCapGobSDO_PROM_MES_ACT: TFloatField
      FieldName = 'SDO_PROM_MES_ACT'
    end
    object qryCapGobSDO_PROM_MES_ANT: TFloatField
      FieldName = 'SDO_PROM_MES_ANT'
    end
    object qryCapGobADEUDO_TOTAL: TFloatField
      FieldName = 'ADEUDO_TOTAL'
    end
    object qryCapGobPCT_20: TFloatField
      FieldName = 'PCT_20'
    end
    object qryCapGobPCT_50: TFloatField
      FieldName = 'PCT_50'
    end
    object qryCapGobPCT_115: TFloatField
      FieldName = 'PCT_115'
    end
    object qryCapGobPCT_150: TFloatField
      FieldName = 'PCT_150'
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.SQL'
    Filter = 'SQL File|*.SQL'
    Left = 86
    Top = 6
  end
end
