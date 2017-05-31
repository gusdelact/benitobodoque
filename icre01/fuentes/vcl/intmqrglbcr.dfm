object QrGlbCr: TQrGlbCr
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
  DataSet = QryRepGlobal
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
    Top = 132
    Width = 960
    Height = 31
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
      82.0208333333333
      2540)
    BandType = rbColumnHeader
    object QRShape5: TQRShape
      Left = 627
      Top = 1
      Width = 190
      Height = 29
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        76.7291666666667
        1658.9375
        2.64583333333333
        502.708333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape7: TQRShape
      Left = 490
      Top = 1
      Width = 139
      Height = 29
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        76.7291666666667
        1296.45833333333
        2.64583333333333
        367.770833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel25: TQRLabel
      Left = 516
      Top = 13
      Width = 56
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1365.25
        34.3958333333333
        148.166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Importe por garantizar'
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
    object QRShape1: TQRShape
      Left = 816
      Top = 12
      Width = 60
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        48.5069444444444
        2158.55902777778
        30.8680555555556
        158.75)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 821
      Top = 13
      Width = 51
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2172.22916666667
        34.3958333333333
        134.9375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Total garantías'
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
    object QRShape11: TQRShape
      Left = 875
      Top = 12
      Width = 60
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        2315.10416666667
        31.75
        158.75)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Left = 879
      Top = 13
      Width = 53
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2325.6875
        34.3958333333333
        140.229166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Sobrante y/o faltante'
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
      Left = 407
      Top = 1
      Width = 84
      Height = 29
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        76.7291666666667
        1076.85416666667
        2.64583333333333
        222.25)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape4: TQRShape
      Left = 35
      Top = 12
      Width = 45
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        92.6041666666667
        31.75
        119.0625)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape10: TQRShape
      Left = 79
      Top = 12
      Width = 50
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        209.020833333333
        31.75
        132.291666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape12: TQRShape
      Left = 128
      Top = 12
      Width = 47
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        338.666666666667
        31.75
        124.354166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape14: TQRShape
      Left = 173
      Top = 12
      Width = 61
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        457.729166666667
        31.75
        161.395833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape15: TQRShape
      Left = 233
      Top = 12
      Width = 59
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        616.479166666667
        31.75
        156.104166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 35
      Top = 17
      Width = 44
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        92.6041666666667
        44.9791666666667
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'No. Crédito'
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
    object QRLabel4: TQRLabel
      Left = 80
      Top = 13
      Width = 48
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        211.666666666667
        34.3958333333333
        127)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha de inicio'
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
    object QRLabel5: TQRLabel
      Left = 236
      Top = 16
      Width = 54
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        624.416666666667
        42.3333333333333
        142.875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Adeudo Vigente'
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
    object QRLabel13: TQRLabel
      Left = 174
      Top = 17
      Width = 60
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        460.375
        44.9791666666667
        158.75)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Monto original'
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
    object QRLabel15: TQRLabel
      Left = 129
      Top = 13
      Width = 45
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        341.3125
        34.3958333333333
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha de vencimiento'
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
    object QRLabel16: TQRLabel
      Left = 411
      Top = 20
      Width = 15
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1087.4375
        52.9166666666667
        39.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '%'
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
    object QRLabel17: TQRLabel
      Left = 423
      Top = 13
      Width = 60
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1119.1875
        34.3958333333333
        158.75)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Importe garantizado'
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
    object QRLabel19: TQRLabel
      Left = 412
      Top = 3
      Width = 75
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1090.08333333333
        7.9375
        198.4375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'GARANTIA FEGA'
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
    object QRLabel20: TQRLabel
      Left = 495
      Top = 3
      Width = 132
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1309.6875
        7.9375
        349.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'GARANTIA LIQUIDA'
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
    object QRLabel21: TQRLabel
      Left = 631
      Top = 3
      Width = 185
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1669.52083333333
        7.9375
        489.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'OTRAS GARANTIAS'
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
    object QRLabel18: TQRLabel
      Left = 495
      Top = 16
      Width = 16
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1309.6875
        42.3333333333333
        42.3333333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '%'
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
    object QRLabel23: TQRLabel
      Left = 630
      Top = 17
      Width = 126
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1666.875
        44.9791666666667
        333.375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Descripción'
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
    object QRLabel24: TQRLabel
      Left = 757
      Top = 17
      Width = 59
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2002.89583333333
        44.9791666666667
        156.104166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Importe'
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
      Left = 304
      Top = 12
      Width = 537
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        804.333333333333
        31.75
        1420.8125)
      Brush.Color = clSilver
      Shape = qrsHorLine
    end
    object QRShape3: TQRShape
      Left = 2
      Top = 12
      Width = 34
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        5.29166666666667
        31.75
        89.9583333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 6
      Top = 14
      Width = 27
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        15.875
        37.0416666666667
        71.4375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Sit. Crédito'
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
    object QRLabel10: TQRLabel
      Left = 574
      Top = 13
      Width = 54
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1518.70833333333
        34.3958333333333
        142.875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Importe REAL garantizado'
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
      Left = 291
      Top = 12
      Width = 59
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        769.9375
        31.75
        156.104166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel26: TQRLabel
      Left = 293
      Top = 16
      Width = 56
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        775.229166666667
        42.3333333333333
        148.166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Adeudo Vencido'
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
      Left = 349
      Top = 12
      Width = 59
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        923.395833333333
        31.75
        156.104166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel27: TQRLabel
      Left = 351
      Top = 16
      Width = 56
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        928.6875
        42.3333333333333
        148.166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Adeudo Total'
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
    object QRShape16: TQRShape
      Left = 934
      Top = 12
      Width = 25
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        2471.20833333333
        31.75
        66.1458333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel28: TQRLabel
      Left = 937
      Top = 13
      Width = 19
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2479.14583333333
        34.3958333333333
        50.2708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '%'
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
  object qrDetalle: TQRBand
    Left = 48
    Top = 192
    Width = 960
    Height = 9
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrDetalleBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      23.8125
      2540)
    BandType = rbDetail
    object qrdbtxtIMP_GTIA_OTR: TQRDBText
      Left = 758
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2005.54166666667
        2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'IMP_GTIA_OTR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,###.##'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText17: TQRDBText
      Left = 631
      Top = 1
      Width = 128
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1669.52083333333
        2.64583333333333
        338.666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'TX_COMENTARIO'
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
  object GpoCredito: TQRGroup
    Left = 48
    Top = 163
    Width = 960
    Height = 1
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
      2.64583333333333
      2540)
    Expression = 'qyQuery.ID_CREDITO'
    Master = Owner
    ReprintOnNewPage = False
  end
  object qrGpoMoneda: TQRGroup
    Left = 48
    Top = 164
    Width = 960
    Height = 10
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrGpoMonedaBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      26.4583333333333
      2540)
    Expression = 'QryRepGlobal.CVE_MONEDA'
    FooterBand = qrFootMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText2: TQRDBText
      Left = 78
      Top = 1
      Width = 55
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        206.375
        2.64583333333333
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'DESC_MONEDA'
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
    object QRDBText1: TQRDBText
      Left = 39
      Top = 1
      Width = 37
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        20.7886904761905
        103.943452380952
        1.88988095238095
        98.2738095238095)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'CVE_MONEDA'
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
    object QRLabel6: TQRLabel
      Left = 4
      Top = 1
      Width = 33
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
        87.3125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda : '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
  end
  object qrGpoAcreditado: TQRGroup
    Left = 48
    Top = 174
    Width = 960
    Height = 9
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrGpoAcreditadoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      23.8125
      2540)
    Expression = 'QryRepGlobal.ID_TITULAR'
    FooterBand = qrFootAcreditado
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel8: TQRLabel
      Left = 13
      Top = -1
      Width = 944
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        24.2534722222222
        35.2777777777778
        -2.20486111111111
        2498.10763888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Acreditado : '
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText5: TQRDBText
      Left = 54
      Top = 0
      Width = 65
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        142.875
        0
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'NOM_ACREDITADO'
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
  object qrFootAcreditado: TQRBand
    Left = 48
    Top = 218
    Width = 960
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrFootAcreditadoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      63.5
      2540)
    BandType = rbGroupFooter
    object QRLabel12: TQRLabel
      Left = 13
      Top = 1
      Width = 944
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        34.3958333333333
        2.64583333333333
        2497.66666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Totales por Acreditado : '
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object qrlblGrpAcre_IMP_CREDITO: TQRLabel
      Left = 173
      Top = 2
      Width = 57
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        457.729166666667
        5.29166666666667
        150.8125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpAcre_IMP_CREDITO'
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
    object qrlblGrpAcre_ADEUDOVIGENTE: TQRLabel
      Left = 232
      Top = 2
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        613.833333333333
        5.29166666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpAcre_ADEUDOVIGENTE'
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
    object qrlblGrpAcre_IMP_PCT_FEG: TQRLabel
      Left = 429
      Top = 2
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1135.0625
        5.29166666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpAcre_IMP_PCT_FEG'
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
    object qrlblGrpAcre_IMP_PCT_LIQ: TQRLabel
      Left = 512
      Top = 2
      Width = 59
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1354.66666666667
        5.29166666666667
        156.104166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpAcre_IMP_PCT_LIQ'
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
    object qrlblGrpAcre_IMP_GTIA_LIQ: TQRLabel
      Left = 571
      Top = 2
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1510.77083333333
        5.29166666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpAcre_IMP_GTIA_LIQ'
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
    object QRLabel7: TQRLabel
      Left = 676
      Top = 2
      Width = 80
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1788.58333333333
        5.29166666666667
        211.666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total de Otras Garantías'
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
    object QRLabel22: TQRLabel
      Left = 763
      Top = 12
      Width = 167
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2018.77083333333
        31.75
        441.854166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total de Disposiciones Mostradas por Acreditado: '
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
    object qrlblGrpAcre_TOTAL_DISP: TQRLabel
      Left = 938
      Top = 12
      Width = 18
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2481.79166666667
        31.75
        47.625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpAcre_TOTAL_DISP'
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
    object qrlblGrpAcre_IMP_GTIA_OTR: TQRLabel
      Left = 758
      Top = 2
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2005.54166666667
        5.29166666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpAcre_IMP_GTIA_OTR'
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
    object qrlblGrpAcre_ADEUDOVENCIDO: TQRLabel
      Left = 291
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        769.9375
        2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpAcre_ADEUDOVENCIDO'
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
    object qrlblGrpAcre_ADEUDOTOTAL: TQRLabel
      Left = 351
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        928.6875
        2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpAcre_ADEUDOTOTAL'
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
    object qrlblGrpAcre_IMP_GTIA_TOT: TQRLabel
      Left = 817
      Top = 2
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2161.64583333333
        5.29166666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpAcre_IMP_GTIA_TOT'
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
    object qrlblGrpAcre_IMP_GTIA_SOB: TQRLabel
      Left = 875
      Top = 2
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2315.10416666667
        5.29166666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpAcre_IMP_GTIA_SOB'
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
    object qrlblGrpAcre_IMP_GTIA_SOB_PCT: TQRLabel
      Left = 933
      Top = 2
      Width = 24
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2468.5625
        5.29166666666667
        63.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpAcre_IMP_GTIA_SOB_PCT'
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
  object qrFootMoneda: TQRBand
    Left = 48
    Top = 242
    Width = 960
    Height = 23
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrFootMonedaBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      60.8541666666667
      2540)
    BandType = rbGroupFooter
    object QRLabel14: TQRLabel
      Left = 6
      Top = 1
      Width = 71
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        15.875
        2.64583333333333
        187.854166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Totales por Moneda : '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object qrlblGrpMone_IMP_CREDITO: TQRLabel
      Left = 174
      Top = 1
      Width = 57
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        460.375
        2.64583333333333
        150.8125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpMone_IMP_CREDITO'
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
    object qrlblGrpMone_ADEUDOVIGENTE: TQRLabel
      Left = 233
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        616.479166666667
        2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpMone_ADEUDOVIGENTE'
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
    object qrlblGrpMone_IMP_PCT_FEG: TQRLabel
      Left = 429
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1135.0625
        2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpMone_IMP_PCT_FEG'
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
    object qrlblGrpMone_IMP_PCT_LIQ: TQRLabel
      Left = 514
      Top = 1
      Width = 59
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1359.95833333333
        2.64583333333333
        156.104166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpMone_IMP_PCT_LIQ'
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
    object qrlblGrpMone_IMP_GTIA_LIQ: TQRLabel
      Left = 573
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1516.0625
        2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpMone_IMP_GTIA_LIQ'
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
    object QRLabel31: TQRLabel
      Left = 771
      Top = 12
      Width = 156
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2039.9375
        31.75
        412.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total de Disposiciones Mostradas por Moneda: '
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
    object qrlblGrpMone_TOTAL_DISP: TQRLabel
      Left = 939
      Top = 12
      Width = 17
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2484.4375
        31.75
        44.9791666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpMone_TOTAL_DISP'
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
    object qrlblGrpMone_IMP_GTIA_OTR: TQRLabel
      Left = 759
      Top = 2
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2008.1875
        5.29166666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpMone_IMP_GTIA_OTR'
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
    object qrlblGrpMone_ADEUDOVENCIDO: TQRLabel
      Left = 291
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        769.9375
        2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpMone_ADEUDOVENCIDO'
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
    object qrlblGrpMone_ADEUDOTOTAL: TQRLabel
      Left = 351
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        928.6875
        2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpMone_ADEUDOTOTAL'
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
    object qrlblGrpMone_IMP_GTIA_TOT: TQRLabel
      Left = 817
      Top = 2
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2161.64583333333
        5.29166666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpMone_IMP_GTIA_TOT'
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
  object qrGpoCredito: TQRGroup
    Left = 48
    Top = 183
    Width = 960
    Height = 9
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrGpoCreditoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      23.8125
      2540)
    Expression = 'QryRepGlobal.ID_CREDITO'
    FooterBand = qrFootCredito
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText4: TQRDBText
      Left = 36
      Top = 1
      Width = 44
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        95.25
        2.64583333333333
        116.416666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'ID_CREDITO'
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
    object QRDBText6: TQRDBText
      Left = 83
      Top = 1
      Width = 42
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        219.604166666667
        2.64583333333333
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'F_INICIO'
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
    object QRDBText3: TQRDBText
      Left = 128
      Top = 1
      Width = 43
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        338.666666666667
        2.64583333333333
        113.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'F_VENCIMIENTO'
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
    object QRDBText11: TQRDBText
      Left = 173
      Top = 1
      Width = 57
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        457.729166666667
        2.64583333333333
        150.8125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'IMP_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText7: TQRDBText
      Left = 232
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        613.833333333333
        2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'ADEUDOVIGENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText8: TQRDBText
      Left = 409
      Top = 1
      Width = 18
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1082.14583333333
        2.64583333333333
        47.625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'PCT_GTIA_FEGA_EF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,###.####'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText9: TQRDBText
      Left = 429
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1135.0625
        2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'IMP_PCT_FEG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText12: TQRDBText
      Left = 16
      Top = 1
      Width = 19
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        42.3333333333333
        2.64583333333333
        50.2708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'SIT_CREDITO'
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
    object QRDBText10: TQRDBText
      Left = 492
      Top = 1
      Width = 22
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1301.75
        2.64583333333333
        58.2083333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'PCT_GTIA_LIQ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,###.####'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText13: TQRDBText
      Left = 512
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1354.66666666667
        2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'IMP_PCT_LIQ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText14: TQRDBText
      Left = 571
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1510.77083333333
        2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'IMP_GTIA_LIQ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText22: TQRDBText
      Left = 631
      Top = 1
      Width = 128
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1669.52083333333
        2.64583333333333
        338.666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'TX_COMENTARIO'
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
    object QRDBText23: TQRDBText
      Left = 759
      Top = 0
      Width = 57
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2008.1875
        0
        150.8125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'IMP_GTIA_OTR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,###.##'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText24: TQRDBText
      Left = 291
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        769.9375
        2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'ADEUDOVENCIDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText25: TQRDBText
      Left = 350
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        926.041666666667
        2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'ADEUDOTOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object qrdbIMP_GTIA_TOT: TQRDBText
      Left = 817
      Top = 0
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2161.64583333333
        0
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'IMP_GTIA_TOT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object qrdbIMP_GTIA_SOB: TQRDBText
      Left = 875
      Top = 0
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2315.10416666667
        0
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'IMP_GTIA_SOB'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object qrExprPCT: TQRExpr
      Left = 933
      Top = 0
      Width = 24
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        2468.5625
        0
        63.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 
        'IF(QryRepGlobal.ADEUDOTOTAL > 0,QryRepGlobal.IMP_GTIA_SOB / QryR' +
        'epGlobal.ADEUDOTOTAL*100,0)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object qrFootCredito: TQRBand
    Left = 48
    Top = 201
    Width = 960
    Height = 17
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrFootCreditoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      44.9791666666667
      2540)
    BandType = rbGroupFooter
    object QRShape6: TQRShape
      Left = 22
      Top = 2
      Width = 937
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        58.2083333333333
        5.29166666666667
        2479.14583333333)
      Shape = qrsRectangle
    end
    object QRLabel11: TQRLabel
      Left = 25
      Top = 4
      Width = 81
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        66.1458333333333
        10.5833333333333
        214.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Totales por Disposición : '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText16: TQRDBText
      Left = 104
      Top = 4
      Width = 35
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        275.166666666667
        10.5833333333333
        92.6041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'ID_CREDITO'
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
    object QRDBText15: TQRDBText
      Left = 173
      Top = 4
      Width = 57
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        457.729166666667
        10.5833333333333
        150.8125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'IMP_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText19: TQRDBText
      Left = 429
      Top = 3
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1135.0625
        7.9375
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'IMP_PCT_FEG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText20: TQRDBText
      Left = 512
      Top = 4
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1354.66666666667
        10.5833333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'IMP_PCT_LIQ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText21: TQRDBText
      Left = 571
      Top = 4
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1510.77083333333
        10.5833333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'IMP_GTIA_LIQ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object qrlblGrpCred_IMP_GTIA_OTR: TQRLabel
      Left = 758
      Top = 5
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2005.54166666667
        13.2291666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpCred_IMP_GTIA_OTR'
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
    object QRDBText18: TQRDBText
      Left = 232
      Top = 4
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        613.833333333333
        10.5833333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'ADEUDOVIGENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText26: TQRDBText
      Left = 291
      Top = 4
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        769.9375
        10.5833333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'ADEUDOVENCIDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText27: TQRDBText
      Left = 350
      Top = 4
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        926.041666666667
        10.5833333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryRepGlobal
      DataField = 'ADEUDOTOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object qrlblGrpCred_IMP_GTIA_TOT1: TQRLabel
      Left = 817
      Top = 5
      Width = 58
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        2161.64583333333
        13.2291666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpCred_IMP_GTIA_TOT1'
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
    object qrlblGrpCred_IMP_GTIA_SOB_PCT1: TQRLabel
      Left = 933
      Top = 5
      Width = 24
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2468.5625
        13.2291666666667
        63.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpCred_IMP_GTIA_SOB_PCT1'
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
    object qrlblGrpCred_IMP_GTIA_SOB1: TQRLabel
      Left = 875
      Top = 5
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2315.10416666667
        13.2291666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblGrpCred_IMP_GTIA_SOB1'
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
  object QryRepGlobal: TQuery
    DatabaseName = 'PCORP'
    SQL.Strings = (
      '  SELECT R.*,'
      
        '         ROUND(R.ADEUDOTOTAL * R.PCT_GTIA_LIQ / 100, 2)    AS IM' +
        'P_PCT_LIQ,'
      
        '         ROUND(R.ADEUDOTOTAL * R.PCT_GTIA_FEGA_EF / 100,2) AS IM' +
        'P_PCT_FEG,'
      '         ( ROUND(R.ADEUDOTOTAL * R.PCT_GTIA_FEGA_EF / 100,2) +'
      '           R.IMP_GTIA_LIQ + R.IMP_GTIA_OTR ) AS IMP_GTIA_TOT,'
      '        ( ROUND(R.ADEUDOTOTAL * R.PCT_GTIA_FEGA_EF / 100,2) +'
      
        '           R.IMP_GTIA_LIQ + R.IMP_GTIA_OTR ) - R.ADEUDOTOTAL AS ' +
        'IMP_GTIA_SOB'
      '  FROM ('
      '         SELECT GARANTIAS.*,'
      '                SALDOS.ADEUDOVENCIDO,'
      '                SALDOS.ADEUDOVIGENTE,'
      
        '                SALDOS.ADEUDOVENCIDO + SALDOS.ADEUDOVIGENTE AS A' +
        'DEUDOTOTAL'
      '         FROM '
      '                -- Inicio de Query para GARANTIAS'
      '               ( SELECT CTO.CVE_MONEDA,'
      '                          M.DESC_MONEDA,'
      '                          CC.ID_CREDITO,'
      '                          CC.SIT_CREDITO,'
      '                          CTO.ID_TITULAR,'
      
        '                          SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITU' +
        'LAR(NULL, NULL, CTO.ID_TITULAR),1,250) AS NOM_ACREDITADO,'
      '                          CC.F_INICIO,'
      '                          CC.F_VENCIMIENTO,'
      '                          CC.IMP_CREDITO,'
      
        '                          NVL(PCTS_DISP.PCT_GTIA_LIQ,0) AS PCT_G' +
        'TIA_LIQ,'
      
        '                          NVL(PKGCRCREDITOO1.OBTEQUIVALENCIA( 2,' +
        ' CTO.CVE_MONEDA, PCTS_DISP.CVE_OPERATIVA, PCTS_DISP.PCT_GTIA_LIQ'
      
        '                                                             ),0' +
        ') AS PCT_GTIA_FEGA_EF,'
      
        '                          NVL(GTIA_LIQ_DISP.IMP_VALUACION,0) AS ' +
        'IMP_GTIA_LIQ,'
      
        '                          SUBSTR(GTIA_OTR_DISP.TX_COMENTARIO,1,2' +
        '50) AS TX_COMENTARIO,'
      
        '                          NVL(GTIA_OTR_DISP.IMP_VALUACION,0) AS ' +
        'IMP_GTIA_OTR'
      '                      FROM'
      
        '                          ( SELECT ID_CONTRATO, ID_TITULAR, CVE_' +
        'MONEDA FROM CONTRATO'
      
        '                          ) CTO, -- *** Líneas de las disposicio' +
        'nes ***'
      
        '                          ( SELECT CC.ID_CREDITO, CC.ID_CONTRATO' +
        ', CC.SIT_CREDITO, CC.IMP_CREDITO, '
      
        '                                   CC.F_INICIO, CC.F_VENCIMIENTO' +
        ', CO.CVE_PRODUCTO_CRE'
      '                            FROM CR_CREDITO CC,'
      '                                 CR_CONTRATO CO,'
      
        '                                 ( SELECT CVE_PRODUCTO_CRE, COUN' +
        'T(*) FROM CR_GA_REL_PRO_GA'
      '                                   WHERE SIT_REL_PRO_GAR = '#39'AC'#39
      '                                   GROUP BY CVE_PRODUCTO_CRE'
      '                                   HAVING COUNT(*) > 0'
      
        '                                 ) CGRPG -- Productos que requie' +
        'ren de algún tipo de Garantía'
      
        '                            WHERE CO.CVE_PRODUCTO_CRE = CGRPG.CV' +
        'E_PRODUCTO_CRE'
      
        '                              AND CC.ID_CONTRATO = CO.ID_CONTRAT' +
        'O'
      '                              AND CC.SIT_CREDITO <> '#39'CA'#39
      
        '                          ) CC, -- Disposiciones Activas que req' +
        'uieren de Garantía'
      '                          ( SELECT  CC.ID_CREDITO,'
      '                                    CC.ID_CONTRATO,'
      '                                    CGFC.CVE_OPERATIVA,'
      '                                    CGFC.PCT_GTIA_LIQ'
      
        '                            FROM  ( SELECT ID_CONTRATO, CVE_OPER' +
        'ATIVA, PCT_GTIA_LIQ FROM CR_GA_FIRA_CTO'
      '                                    WHERE SIT_GA_FIRA = '#39'AC'#39
      
        '                                  ) CGFC, -- Vínculos Activos de' +
        ' Operativa-Línea'
      
        '                                  ( SELECT ID_CREDITO, ID_CONTRA' +
        'TO, CVE_OPERATIVA FROM CR_CREDITO'
      '                                    WHERE SIT_CREDITO <> '#39'CA'#39' '
      '                                  ) CC -- Disposiciones Activas'
      
        '                            WHERE CGFC.CVE_OPERATIVA = CC.CVE_OP' +
        'ERATIVA'
      
        '                              AND CGFC.ID_CONTRATO = CC.ID_CONTR' +
        'ATO'
      
        '                          ) PCTS_DISP, -- *** Disposiciones que ' +
        'tienen porcentajes de garantía FIRA establecidos ***'
      
        '                          ( SELECT GTIA_LIQ.ID_CREDITO, SUM(IMP_' +
        'VALUACION) AS IMP_VALUACION'
      
        '                            FROM (-- Obtiene todo lo que se encu' +
        'entra Garantizado en Pagarés'
      '                                   SELECT CRPD.ID_CREDITO,'
      
        '                                          IP.IMP_NETO_VTO AS IMP' +
        '_VALUACION'
      
        '                                   FROM ( SELECT ID_CREDITO, ID_' +
        'CONTRATO, ID_PAGARE FROM CR_REL_PAG_DISP'
      
        '                                          WHERE SIT_REL_PAG_DISP' +
        ' = '#39'AC'#39
      
        '                                        ) CRPD, -- Vínculos Acti' +
        'vos de Pagaré-Disposición'
      
        '                                        ( SELECT IP.ID_CONTRATO,' +
        ' IP.ID_PAGARE, IP.IMP_NETO_VTO'
      '                                          FROM INV_PAGARE IP,'
      
        '                                               ( SELECT ID_EMPRE' +
        'SA_PRLV, ID_SUCURSAL_PRLV FROM CR_PARAMETRO'
      
        '                                                 WHERE CVE_PARAM' +
        'ETRO = '#39'CRE'#39
      
        '                                               ) CP -- Parametro' +
        's de PRLV'
      
        '                                          WHERE IP.ID_EMPRESA = ' +
        'CP.ID_EMPRESA_PRLV'
      
        '                                            AND IP.ID_SUCURSAL =' +
        ' CP.ID_SUCURSAL_PRLV'
      
        '                                            AND IP.CVE_SIT_PAGAR' +
        'E = '#39'AC'#39
      '                                         ) IP'
      
        '                                  WHERE IP.ID_CONTRATO = CRPD.ID' +
        '_CONTRATO'
      
        '                                    AND IP.ID_PAGARE = CRPD.ID_P' +
        'AGARE'
      '                                  UNION ALL'
      
        '                                  -- Obtiene todo lo que se encu' +
        'entra Garantizado en Caución Bursátil'
      '                                  SELECT SDCR.ID_REFERENCIA,'
      
        '                                         ROUND( NVL(PKGFUNPROCCO' +
        'RP.PRECIOMERCADO(PKGCRACTUALIZA.STPD000,'
      
        '                                                    SDCR.EMISORA' +
        ', SDCR.SERIE, SDCR.TIPO_VALOR),0) * SDCR.NUM_TITULOS_VIRT, 2) AS' +
        ' IMP_VALUACION'
      
        '                                  FROM  ( SELECT ID_CONTRATO, ID' +
        '_REFERENCIA, NUM_TITULOS_VIRT,'
      
        '                                                  EMISORA, SERIE' +
        ', TIPO_VALOR'
      '                                           FROM SB_DET_CART_REF'
      
        '                                           WHERE CVE_DIA_LIQUIDA' +
        ' = '#39'D000'#39
      
        '                                             AND CVE_TIP_POSIC =' +
        ' '#39'GTCR'#39
      
        '                                             AND NUM_TITULOS_VIR' +
        'T > 0'
      '                                        ) SDCR,'
      
        '                                        ( SELECT GPE.ID_CONTRATO' +
        ', GPE.ID_CTO_EXTERNO, GPE.EMISORA,'
      
        '                                                 GPE.SERIE, GPE.' +
        'TIPO_VALOR'
      
        '                                          FROM GAR_PROP_EMIS GPE' +
        ','
      '                                               CR_CREDITO CC'
      
        '                                          WHERE GPE.ID_CTO_EXTER' +
        'NO = CC.ID_CREDITO'
      '                                        ) GPE'
      
        '                                 WHERE SDCR.ID_CONTRATO = GPE.ID' +
        '_CONTRATO'
      
        '                                   AND SDCR.ID_REFERENCIA = GPE.' +
        'ID_CTO_EXTERNO'
      
        '                                   AND SDCR.EMISORA = GPE.EMISOR' +
        'A'
      '                                   AND SDCR.SERIE = GPE.SERIE'
      
        '                                   AND SDCR.TIPO_VALOR = GPE.TIP' +
        'O_VALOR'
      '                                ) GTIA_LIQ'
      '                           GROUP BY GTIA_LIQ.ID_CREDITO'
      
        '                          ) GTIA_LIQ_DISP, -- *** Disposiciones ' +
        'con Gtia. Real Líquida ***'
      '                          ( SELECT CGDR.ID_DISPOSICION,'
      '                                   TX_COMENTARIO,'
      
        '                                   NVL(CGDR.IMP_GARANTIA,0) AS I' +
        'MP_VALUACION'
      
        '                            FROM ( SELECT CVE_GTIA_LIQ FROM CR_P' +
        'ARAM_AGRO'
      '                                   WHERE CVE_PARAMETRO = '#39'CRE'#39
      
        '                                 ) CPA, -- Parametros de configu' +
        'ración de ICRE'
      
        '                                 ( SELECT ID_SOLICITUD, CVE_GARA' +
        'NTIA, VALOR_PONDERADO, TX_COMENTARIO FROM CR_GA_REGISTRO'
      '                                   WHERE SIT_REG_GARANTIA = '#39'AC'#39
      '                                 ) CGR,'
      
        '                                 ( SELECT ID_REG_SOL_GAR, ID_DIS' +
        'POSICION, IMP_GARANTIA FROM CR_GA_DIS_GAR'
      '                                   WHERE SIT_REL_DIS_GAR = '#39'AC'#39
      '                                 ) CGDR'
      
        '                            WHERE CGR.CVE_GARANTIA <> CPA.CVE_GT' +
        'IA_LIQ'
      
        '                              AND CGR.ID_SOLICITUD = CGDR.ID_REG' +
        '_SOL_GAR'
      
        '                          ) GTIA_OTR_DISP, -- *** Disposiciones ' +
        'con Garantía ***'
      '                          MONEDA M'
      '                   WHERE CTO.ID_CONTRATO = CC.ID_CONTRATO'
      '                     AND M.CVE_MONEDA = CTO.CVE_MONEDA'
      '                     AND PCTS_DISP.ID_CREDITO (+)= CC.ID_CREDITO'
      
        '                     AND GTIA_LIQ_DISP.ID_CREDITO (+)= CC.ID_CRE' +
        'DITO'
      
        '                     AND GTIA_OTR_DISP.ID_DISPOSICION (+)= CC.ID' +
        '_CREDITO'
      '                 ) GARANTIAS,'
      '                 -- Inicio de Query para SALDOS'
      '                 ('
      '                 SELECT  CC.ID_CREDITO,'
      '                         -- SALDOS VIGENTES'
      '                         NVL(CC.SDO_INSOLUTO,0) AS SDO_INSOLUTO,'
      
        '                         (NVL(PERCAP.IMP_CAPITAL,0) - NVL(PERCAP' +
        '.IMP_PAGADO,0))       AS CAPITAL_VIG,'
      
        '                         (NVL(PERFIN.IMP_FINAN_ADIC,0) - NVL(PER' +
        'FIN.IMP_PAGADO,0))    AS SDO_FINAN_ADIC,'
      
        '                         (NVL(PERINT.IMP_INTERES,0)  -  NVL(PERI' +
        'NT.IMP_PAGADO,0))     AS IMP_INTERES,'
      
        '                         (NVL(PERINT.IMP_IVA,0)      -  NVL(PERI' +
        'NT.IMP_IVA_PAGADO,0)) AS IMP_IVA_INTERES,'
      
        '                         (NVL(PERCOM.IMP_COMISION,0) - NVL(PERCO' +
        'M.IMP_PAGADO,0))      AS IMP_COMISION, '
      
        '                         (NVL(PERCOM.IMP_IVACOM,0) - NVL(PERCOM.' +
        'IMP_IVA_PAGADO,0))    AS IMP_IVACOM,'
      '                          NVL(CC.SDO_VIG_TOTAL,0) +'
      
        '                         (NVL(PERINT.IMP_INTERES,0)  -  NVL(PERI' +
        'NT.IMP_PAGADO,0))     +'
      
        '                         (NVL(PERINT.IMP_IVA,0)      -  NVL(PERI' +
        'NT.IMP_IVA_PAGADO,0)) +'
      
        '                         (NVL(PERCOM.IMP_COMISION,0) - NVL(PERCO' +
        'M.IMP_PAGADO,0))      +'
      
        '                         (NVL(PERCOM.IMP_IVACOM,0) - NVL(PERCOM.' +
        'IMP_IVA_PAGADO,0))    '
      '                         AS ADEUDOVIGENTE,'
      '                         -- SALDOS VENCIDOS'
      
        '                         PERCAPV.IMP_CAPITAL_VDO, PERCAPV.IMP_MO' +
        'R_CAPITAL, PERCAPV.IMP_IVA_MOR_CAP,'
      
        '                         PERFINV.IMP_VDO_FINAN_A, PERFINV.IMP_MO' +
        'R_FINAN_A, PERFINV.IMP_IVA_MOR_FIN,'
      
        '                         PERINTV.IMP_INTERES_VDO, PERINTV.IMP_IV' +
        'A_INT_VDO,'
      
        '                         PERCOMV.IMP_COMISION_VDO, PERCOMV.IMP_I' +
        'VA_COM_VDO, PERCOMV.IMP_MOR_COMISION, PERCOMV.IMP_IVA_MOR_COM,'
      
        '                         (NVL(PERCAPV.IMP_CAPITAL_VDO,0) + NVL(P' +
        'ERCAPV.IMP_MOR_CAPITAL,0) + NVL(PERCAPV.IMP_IVA_MOR_CAP,0) +'
      
        '                          NVL(PERFINV.IMP_VDO_FINAN_A,0) + NVL(P' +
        'ERFINV.IMP_MOR_FINAN_A,0) + NVL(PERFINV.IMP_IVA_MOR_FIN,0) +'
      
        '                          NVL(PERINTV.IMP_INTERES_VDO,0) + NVL(P' +
        'ERINTV.IMP_IVA_INT_VDO,0) +'
      
        '                          NVL(PERCOMV.IMP_COMISION_VDO,0) + NVL(' +
        'PERCOMV.IMP_IVA_COM_VDO,0) + NVL(PERCOMV.IMP_MOR_COMISION,0) + N' +
        'VL(PERCOMV.IMP_IVA_MOR_COM,0)) AS ADEUDOVENCIDO'
      '                 FROM'
      
        '                        ( SELECT CC.ID_CONTRATO, CC.ID_CREDITO, ' +
        'CC.SDO_INSOLUTO, SDO_VIG_TOTAL'
      
        '                          FROM( SELECT ID_CONTRATO, ID_CREDITO, ' +
        'SDO_INSOLUTO, SDO_VIG_TOTAL FROM CR_CREDITO'
      '                                WHERE SIT_CREDITO <> '#39'CA'#39') CC,'
      
        '                               ( SELECT CO.ID_CONTRATO, CO.CVE_P' +
        'RODUCTO_CRE CO, COUNT(*)'
      
        '                                 FROM CR_GA_REL_PRO_GA CGRPG, CR' +
        '_CONTRATO CO'
      
        '                                 WHERE CGRPG.SIT_REL_PRO_GAR = '#39 +
        'AC'#39
      
        '                                   AND CO.CVE_PRODUCTO_CRE = CGR' +
        'PG.CVE_PRODUCTO_CRE'
      
        '                                 GROUP BY CO.ID_CONTRATO, CO.CVE' +
        '_PRODUCTO_CRE'
      '                                 HAVING COUNT(*) > 0'
      '                               ) CGRPG'
      
        '                          WHERE CC.ID_CONTRATO = CGRPG.ID_CONTRA' +
        'TO'
      '              --              AND CC.ID_CREDITO = 40520'
      '                        ) CC,'
      
        '                        -- ******* INICIO DE CÓDIGO ROIM748 ****' +
        '***'
      
        '                        --    ******* TOTAL VIGENTE AL DIA "D000' +
        '" *******'
      '                        --       Capital Vigente'
      
        '                        ( SELECT ID_CREDITO, MAX(NUM_PERIODO) AS' +
        ' PERIODOCAP, MAX(F_VENCIMIENTO) AS FECHVENCAP, SUM(IMP_CAPITAL) ' +
        'AS IMP_CAPITAL,'
      
        '                                 SUM(NVL(PKGCRCOMUN.STPOBTIMPPAG' +
        'ADO('#39'CP'#39','#39'IMPBRU'#39',ID_CREDITO,NUM_PERIODO,NULL, FECHA.D000,'#39'V'#39'),0' +
        ')) AS IMP_PAGADO'
      '                          FROM CR_CAPITAL,'
      
        '                              (SELECT PKGCRACTUALIZA.STPD000 AS ' +
        'D000 FROM DUAL) FECHA'
      
        '                          WHERE FECHA.D000 BETWEEN F_VENCIMIENTO' +
        ' - (PLAZO-1) AND F_VENCIMIENTO'
      '                          GROUP BY ID_CREDITO'
      '                         ) PERCAP,             '
      '                        --       Interés Vigente'
      
        '                         (SELECT ID_CREDITO,MAX(NUM_PERIODO) AS ' +
        'PERIODOINT,MAX(F_VENCIMIENTO) AS FECHVENINT,'
      
        '                                 SUM(IMP_INTERES) AS IMP_INTERES' +
        ', SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IMPBRU'#39',ID_CREDITO,NU' +
        'M_PERIODO,NULL,FECHA.D000,'#39'V'#39'),0)) AS IMP_PAGADO,'
      
        '                                 SUM(IMP_IVA) AS IMP_IVA, SUM(NV' +
        'L(PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IMPIVA'#39',ID_CREDITO,NUM_PERIOD' +
        'O,NULL,FECHA.D000,'#39'V'#39'),0)) AS IMP_IVA_PAGADO,'
      
        '                                 MAX(TASA_APLICADA) AS TASA_APLI' +
        'CADA'
      '                          FROM CR_INTERES,'
      
        '                              (SELECT PKGCRACTUALIZA.STPD000 AS ' +
        'D000 FROM DUAL) FECHA'
      
        '                          WHERE FECHA.D000 BETWEEN  F_VENCIMIENT' +
        'O - (PLAZO-1) AND F_VENCIMIENTO'
      '                          GROUP BY ID_CREDITO'
      '                          ) PERINT,'
      '                         --      Comisión Vigente'
      
        '                          (SELECT ID_CREDITO,MAX(NUM_PERIODO) AS' +
        ' PERIODOCOM,MAX(F_VENCIMIENTO) AS FECHVENCOM,'
      '                           SUM(IMP_COMISION) AS IMP_COMISION,'
      
        '                           SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO('#39'C' +
        'N'#39','#39'IMPBRU'#39',ID_CREDITO,NUM_PERIODO,NULL,FECHA.D000,'#39'V'#39'),0)) AS I' +
        'MP_PAGADO,'
      
        '                           SUM(IMP_IVA) AS IMP_IVACOM, SUM(NVL(P' +
        'KGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IMPIVA'#39',ID_CREDITO,NUM_PERIODO,N' +
        'ULL,FECHA.D000,'#39'V'#39'),0)) AS IMP_IVA_PAGADO'
      '                           FROM CR_COMISION,'
      
        '                                (SELECT PKGCRACTUALIZA.STPD000 A' +
        'S D000 FROM DUAL) FECHA'
      
        '                           WHERE FECHA.D000 BETWEEN  F_ALTA AND ' +
        'F_VENCIMIENTO'
      '                           GROUP BY ID_CREDITO'
      '                          ) PERCOM,'
      '                         --      Financiamiento Vigente'
      
        '                          (SELECT ID_CREDITO,MAX(NUM_PERIODO) AS' +
        ' PERIODOREF, MAX(F_VENCIMIENTO) AS FECHVENCAP,'
      
        '                           SUM(IMP_FINAN_ADIC) AS IMP_FINAN_ADIC' +
        ', SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IMPBRU'#39',ID_CREDITO,NU' +
        'M_PERIODO,NULL,FECHA.D000,'#39'V'#39'),0)) AS IMP_PAGADO'
      '                           FROM CR_FINAN_ADIC,'
      
        '                                (SELECT PKGCRACTUALIZA.STPD000 A' +
        'S D000 FROM DUAL) FECHA'
      
        '                           WHERE FECHA.D000 BETWEEN  F_VENCIMIEN' +
        'TO - (PLAZO-1) AND F_VENCIMIENTO'
      '                           GROUP BY ID_CREDITO'
      '                          ) PERFIN,'
      
        '                        --    ******* TOTAL VENCIDOS AL DIA "D00' +
        '0" *******'
      '                        --       Capital Vencido'
      '                        ( SELECT ID_CREDITO,'
      
        '                                 SUM(IMP_CAPITAL - NVL(PKGCRCOMU' +
        'N.STPOBTIMPPAGADO('#39'CP'#39','#39'IMPBRU'#39',ID_CREDITO,NUM_PERIODO,NULL,FECH' +
        'A.D000,'#39'V'#39'),0)) AS IMP_CAPITAL_VDO,'
      
        '                                 SUM(PKGCRPERIODO.FUNOBTENMORA(1' +
        ','#39'V'#39',ID_CREDITO ,NUM_PERIODO ,NULL,NULL,FECHA.D000,NULL)) AS IMP' +
        '_MOR_CAPITAL,'
      
        '                                 SUM(PKGCRPERIODO.FUNOBTENMORA(1' +
        ','#39'F'#39',ID_CREDITO ,NUM_PERIODO ,NULL,NULL,FECHA.D000,NULL)) AS IMP' +
        '_IVA_MOR_CAP                   '
      '                          FROM CR_CAPITAL,'
      
        '                               (SELECT PKGCRACTUALIZA.STPD000 AS' +
        ' D000 FROM DUAL) FECHA'
      '                          WHERE FECHA.D000 > F_VENCIMIENTO'
      '                            AND IMP_CAPITAL - IMP_PAGADO > 0'
      '                          GROUP BY ID_CREDITO'
      '                        ) PERCAPV,'
      '                        --       Interés Vencido'
      
        '                        ( SELECT ID_CREDITO, SUM(IMP_INTERES - N' +
        'VL(PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IMPBRU'#39',ID_CREDITO,NUM_PERIO' +
        'DO,NULL,FECHA.D000,'#39'V'#39'),0)) AS IMP_INTERES_VDO, '
      
        '                             SUM(IMP_IVA - NVL(PKGCRCOMUN.STPOBT' +
        'IMPPAGADO('#39'IN'#39','#39'IMPIVA'#39',ID_CREDITO,NUM_PERIODO,NULL,FECHA.D000,'#39 +
        'V'#39'),0)) AS IMP_IVA_INT_VDO'
      '                          FROM CR_INTERES,'
      
        '                               (SELECT PKGCRACTUALIZA.STPD000 AS' +
        ' D000 FROM DUAL) FECHA'
      '                          WHERE FECHA.D000 > F_VENCIMIENTO '
      '                            AND IMP_INTERES - IMP_PAGADO > 0 '
      '                          GROUP BY ID_CREDITO'
      '                        ) PERINTV,'
      '                        --       Comisión Vencido'
      
        '                        ( SELECT ID_CREDITO, SUM(IMP_COMISION - ' +
        'NVL(PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IMPBRU'#39',ID_CREDITO,NUM_PERI' +
        'ODO,NULL,FECHA.D000,'#39'V'#39'),0)) AS IMP_COMISION_VDO,'
      
        '                                 SUM(IMP_IVA - NVL(PKGCRCOMUN.ST' +
        'POBTIMPPAGADO('#39'CN'#39','#39'IMPIVA'#39',ID_CREDITO,NUM_PERIODO,NULL,FECHA.D0' +
        '00,'#39'V'#39'),0)) AS IMP_IVA_COM_VDO, '
      
        '                                 SUM(PKGCRPERIODO.FUNOBTENMORA(2' +
        ','#39'V'#39',ID_CREDITO ,NUM_PERIODO ,NULL,NULL,FECHA.D000,NULL)) AS IMP' +
        '_MOR_COMISION,'
      
        '                                 SUM(PKGCRPERIODO.FUNOBTENMORA(2' +
        ','#39'F'#39',ID_CREDITO ,NUM_PERIODO ,NULL,NULL,FECHA.D000,NULL)) AS IMP' +
        '_IVA_MOR_COM'
      '                          FROM CR_COMISION,'
      
        '                               (SELECT PKGCRACTUALIZA.STPD000 AS' +
        ' D000 FROM DUAL) FECHA'
      '                          WHERE FECHA.D000 > F_VENCIMIENTO '
      '                            AND IMP_COMISION - IMP_PAGADO > 0 '
      '                          GROUP BY ID_CREDITO'
      '                        ) PERCOMV,'
      '                        --       Financiamiento Vencido'
      
        '                        ( SELECT ID_CREDITO, SUM(IMP_FINAN_ADIC ' +
        '- NVL(PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IMPBRU'#39',ID_CREDITO,NUM_PE' +
        'RIODO,NULL,FECHA.D000,'#39'V'#39'),0)) AS IMP_VDO_FINAN_A, '
      
        '                              SUM(PKGCRPERIODO.FUNOBTENMORA(3,'#39'V' +
        #39',ID_CREDITO ,NUM_PERIODO ,NULL,NULL,FECHA.D000,NULL)) AS IMP_MO' +
        'R_FINAN_A,'
      
        '                              SUM(PKGCRPERIODO.FUNOBTENMORA(3,'#39'F' +
        #39',ID_CREDITO ,NUM_PERIODO ,NULL,NULL,FECHA.D000,NULL)) AS IMP_IV' +
        'A_MOR_FIN'
      '                          FROM CR_FINAN_ADIC,'
      
        '                               (SELECT PKGCRACTUALIZA.STPD000 AS' +
        ' D000 FROM DUAL) FECHA'
      '                          WHERE FECHA.D000 > F_VENCIMIENTO '
      '                            AND IMP_FINAN_ADIC - IMP_PAGADO > 0 '
      '                          GROUP BY ID_CREDITO'
      '                        ) PERFINV'
      '                WHERE PERCAP.ID_CREDITO (+)= CC.ID_CREDITO'
      '                  AND PERINT.ID_CREDITO (+)= CC.ID_CREDITO'
      '                  AND PERCOM.ID_CREDITO (+)= CC.ID_CREDITO'
      '                  AND PERFIN.ID_CREDITO (+)= CC.ID_CREDITO'
      '                  AND PERCAPV.ID_CREDITO (+)= CC.ID_CREDITO'
      '                  AND PERINTV.ID_CREDITO (+)= CC.ID_CREDITO'
      '                  AND PERCOMV.ID_CREDITO (+)= CC.ID_CREDITO'
      '                  AND PERFINV.ID_CREDITO (+)= CC.ID_CREDITO'
      '                ) SALDOS'
      '          WHERE SALDOS.ID_CREDITO = GARANTIAS.ID_CREDITO'
      '       ) R'
      ' ORDER BY R.NOM_ACREDITADO, R.ID_CREDITO')
    Left = 24
    Top = 17
    object QryRepGlobalCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object QryRepGlobalDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object QryRepGlobalID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object QryRepGlobalSIT_CREDITO: TStringField
      FieldName = 'SIT_CREDITO'
      Size = 2
    end
    object QryRepGlobalID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object QryRepGlobalNOM_ACREDITADO: TStringField
      FieldName = 'NOM_ACREDITADO'
      Size = 250
    end
    object QryRepGlobalF_INICIO: TDateTimeField
      FieldName = 'F_INICIO'
    end
    object QryRepGlobalF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object QryRepGlobalIMP_CREDITO: TFloatField
      FieldName = 'IMP_CREDITO'
    end
    object QryRepGlobalPCT_GTIA_LIQ: TFloatField
      FieldName = 'PCT_GTIA_LIQ'
    end
    object QryRepGlobalPCT_GTIA_FEGA_EF: TFloatField
      FieldName = 'PCT_GTIA_FEGA_EF'
    end
    object QryRepGlobalIMP_GTIA_LIQ: TFloatField
      FieldName = 'IMP_GTIA_LIQ'
    end
    object QryRepGlobalTX_COMENTARIO: TStringField
      FieldName = 'TX_COMENTARIO'
      Size = 150
    end
    object QryRepGlobalIMP_GTIA_OTR: TFloatField
      FieldName = 'IMP_GTIA_OTR'
    end
    object QryRepGlobalADEUDOVENCIDO: TFloatField
      FieldName = 'ADEUDOVENCIDO'
    end
    object QryRepGlobalADEUDOVIGENTE: TFloatField
      FieldName = 'ADEUDOVIGENTE'
    end
    object QryRepGlobalADEUDOTOTAL: TFloatField
      FieldName = 'ADEUDOTOTAL'
    end
    object QryRepGlobalIMP_PCT_LIQ: TFloatField
      FieldName = 'IMP_PCT_LIQ'
    end
    object QryRepGlobalIMP_PCT_FEG: TFloatField
      FieldName = 'IMP_PCT_FEG'
    end
    object QryRepGlobalIMP_GTIA_TOT: TFloatField
      FieldName = 'IMP_GTIA_TOT'
    end
    object QryRepGlobalIMP_GTIA_SOB: TFloatField
      FieldName = 'IMP_GTIA_SOB'
    end
  end
end
