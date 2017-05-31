object QrRsgMdo: TQrRsgMdo
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
  DataSet = qryRsgMdo
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
    Height = 55
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
      145.520833333333
      2540)
    BandType = rbColumnHeader
    object qrShpAdeudoTotal: TQRShape
      Left = 0
      Top = 17
      Width = 51
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.8958333333333
        0
        44.9791666666667
        134.9375)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrshpCalificadoras: TQRShape
      Left = 93
      Top = 17
      Width = 99
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        246.0625
        44.9791666666667
        261.9375)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblAdeudoTotal: TQRLabel
      Left = 2
      Top = 24
      Width = 48
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        5.29166666666667
        63.5
        127)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Número de Autorización'
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
      Left = 97
      Top = 19
      Width = 93
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        256.645833333333
        50.2708333333333
        246.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fechas de Crédito'
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
      Left = 50
      Top = 17
      Width = 44
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.8958333333333
        132.291666666667
        44.9791666666667
        116.416666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblSdoPromedio: TQRLabel
      Left = 52
      Top = 24
      Width = 40
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        137.583333333333
        63.5
        105.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Número de Crédito'
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
      Left = 93
      Top = 31
      Width = 50
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        246.0625
        82.0208333333333
        132.291666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrShpNomCalificadora2: TQRShape
      Left = 142
      Top = 31
      Width = 50
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        375.708333333333
        82.0208333333333
        132.291666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlbNOM_CALIFICADORA1: TQRLabel
      Left = 95
      Top = 33
      Width = 46
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        251.354166666667
        87.3125
        121.708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Inicio'
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
      Left = 144
      Top = 33
      Width = 47
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        381
        87.3125
        124.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Vencimiento'
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
      Left = 191
      Top = 17
      Width = 63
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.8958333333333
        505.354166666667
        44.9791666666667
        166.6875)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel4: TQRLabel
      Left = 192
      Top = 24
      Width = 61
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        508
        63.5
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Saldo Final'
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
    object QRShape5: TQRShape
      Left = 253
      Top = 17
      Width = 63
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.8958333333333
        669.395833333333
        44.9791666666667
        166.6875)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel5: TQRLabel
      Left = 254
      Top = 24
      Width = 61
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        672.041666666667
        63.5
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Intereses Acumulados'
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
    object QRShape6: TQRShape
      Left = 315
      Top = 17
      Width = 63
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.8958333333333
        833.4375
        44.9791666666667
        166.6875)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 317
      Top = 24
      Width = 60
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        838.729166666667
        63.5
        158.75)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Saldo Promedio'
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
      Left = 377
      Top = 17
      Width = 40
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.8958333333333
        997.479166666667
        44.9791666666667
        105.833333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel7: TQRLabel
      Left = 381
      Top = 24
      Width = 33
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        1008.0625
        63.5
        87.3125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '%. Gtia. Liquida'
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
      Left = 416
      Top = 17
      Width = 40
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.8958333333333
        1100.66666666667
        44.9791666666667
        105.833333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Left = 420
      Top = 24
      Width = 33
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        1111.25
        63.5
        87.3125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '%. Gtia. FEGA Efva.'
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
    object QRShape9: TQRShape
      Left = 455
      Top = 17
      Width = 40
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.8958333333333
        1203.85416666667
        44.9791666666667
        105.833333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 459
      Top = 24
      Width = 33
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        1214.4375
        63.5
        87.3125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '%. de Otras Gtias.'
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
    object QRShape10: TQRShape
      Left = 494
      Top = 17
      Width = 59
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.8958333333333
        1307.04166666667
        44.9791666666667
        156.104166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel10: TQRLabel
      Left = 495
      Top = 24
      Width = 57
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        1309.6875
        63.5
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Líquida'
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
    object QRShape11: TQRShape
      Left = 552
      Top = 17
      Width = 59
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.8958333333333
        1460.5
        44.9791666666667
        156.104166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel11: TQRLabel
      Left = 553
      Top = 24
      Width = 57
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        1463.14583333333
        63.5
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'FEGA'
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
      Left = 610
      Top = 17
      Width = 59
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.8958333333333
        1613.95833333333
        44.9791666666667
        156.104166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel12: TQRLabel
      Left = 611
      Top = 24
      Width = 57
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        1616.60416666667
        63.5
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Otras'
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
    object QRShape13: TQRShape
      Left = 494
      Top = 1
      Width = 175
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1307.04166666667
        2.64583333333333
        463.020833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel13: TQRLabel
      Left = 498
      Top = 4
      Width = 168
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1317.625
        10.5833333333333
        444.5)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Parte Proporcional del Saldo Promedio'
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
    object QRShape17: TQRShape
      Left = 668
      Top = 1
      Width = 175
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1767.41666666667
        2.64583333333333
        463.020833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel17: TQRLabel
      Left = 671
      Top = 4
      Width = 168
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1775.35416666667
        10.5833333333333
        444.5)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Saldo Promedio Ponderado'
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
    object QRShape14: TQRShape
      Left = 668
      Top = 17
      Width = 59
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.8958333333333
        1767.41666666667
        44.9791666666667
        156.104166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel14: TQRLabel
      Left = 669
      Top = 24
      Width = 57
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        1770.0625
        63.5
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Líquida'
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
    object QRShape15: TQRShape
      Left = 726
      Top = 17
      Width = 59
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.8958333333333
        1920.875
        44.9791666666667
        156.104166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel15: TQRLabel
      Left = 727
      Top = 24
      Width = 57
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        1923.52083333333
        63.5
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'FEGA'
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
    object QRShape16: TQRShape
      Left = 784
      Top = 17
      Width = 59
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.8958333333333
        2074.33333333333
        44.9791666666667
        156.104166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel16: TQRLabel
      Left = 785
      Top = 24
      Width = 57
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        2076.97916666667
        63.5
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Otras'
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
    object QRShape21: TQRShape
      Left = 842
      Top = 17
      Width = 59
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.8958333333333
        2227.79166666667
        44.9791666666667
        156.104166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel21: TQRLabel
      Left = 843
      Top = 24
      Width = 57
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        2230.4375
        63.5
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Factor de Capitalización'
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
    object QRShape22: TQRShape
      Left = 900
      Top = 17
      Width = 59
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.8958333333333
        2381.25
        44.9791666666667
        156.104166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel22: TQRLabel
      Left = 901
      Top = 24
      Width = 57
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        2383.89583333333
        63.5
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Uso de Capital'
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
    Top = 191
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
    Expression = 'qryRsgMdo.CVE_MONEDA'
    FooterBand = qrGrpFootCVE_MONEDA
    Master = Owner
    ReprintOnNewPage = False
    object QRShape1: TQRShape
      Left = 1
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
        2.64583333333333
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
      DataSet = qryRsgMdo
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
      DataSet = qryRsgMdo
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
    Top = 248
    Width = 960
    Height = 16
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
      42.3333333333333
      2540)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 53
      Top = 2
      Width = 40
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        140.229166666667
        5.29166666666667
        105.833333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryRsgMdo
      DataField = 'ID_CREDITO'
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
    object QRDBText5: TQRDBText
      Left = 0
      Top = 2
      Width = 51
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        0
        5.29166666666667
        134.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryRsgMdo
      DataField = 'ID_CONTRATO'
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
    object QRDBText6: TQRDBText
      Left = 96
      Top = 2
      Width = 45
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        254
        5.29166666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryRsgMdo
      DataField = 'F_INICIO'
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
    object QRDBText7: TQRDBText
      Left = 143
      Top = 2
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        378.354166666667
        5.29166666666667
        127)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryRsgMdo
      DataField = 'F_VENCIMIENTO'
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
    object qrdbSDO_PROM_MES_ACT: TQRDBText
      Left = 192
      Top = 2
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        508
        5.29166666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryRsgMdo
      DataField = 'SDO_VIG_TOTAL'
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
    object QRDBText8: TQRDBText
      Left = 316
      Top = 2
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        836.083333333333
        5.29166666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryRsgMdo
      DataField = 'SDO_PROMEDIO'
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
    object QRDBText9: TQRDBText
      Left = 495
      Top = 2
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1309.6875
        5.29166666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryRsgMdo
      DataField = 'SDO_PROM_LIQ'
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
    object QRDBText10: TQRDBText
      Left = 553
      Top = 2
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1463.14583333333
        5.29166666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryRsgMdo
      DataField = 'SDO_PROM_FEGA'
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
    object QRDBText11: TQRDBText
      Left = 611
      Top = 2
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1616.60416666667
        5.29166666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryRsgMdo
      DataField = 'SDO_PROM_OTR'
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
    object QRDBText12: TQRDBText
      Left = 381
      Top = 2
      Width = 34
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1008.0625
        5.29166666666667
        89.9583333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryRsgMdo
      DataField = 'PCT_GTIA_LIQ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00%;1;_'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText13: TQRDBText
      Left = 420
      Top = 2
      Width = 34
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1111.25
        5.29166666666667
        89.9583333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryRsgMdo
      DataField = 'PCT_GTIA_FEGA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00%;1;_'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText14: TQRDBText
      Left = 461
      Top = 2
      Width = 34
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1219.72916666667
        5.29166666666667
        89.9583333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryRsgMdo
      DataField = 'PCT_GTIA_OTR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00%;1;_'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText16: TQRDBText
      Left = 669
      Top = 2
      Width = 57
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1770.0625
        5.29166666666667
        150.8125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryRsgMdo
      DataField = 'SDO_REQ_PROM_LIQ'
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
    object QRDBText17: TQRDBText
      Left = 727
      Top = 2
      Width = 57
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1923.52083333333
        5.29166666666667
        150.8125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryRsgMdo
      DataField = 'SDO_REQ_PROM_FEGA'
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
    object QRDBText18: TQRDBText
      Left = 785
      Top = 2
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2076.97916666667
        5.29166666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryRsgMdo
      DataField = 'SDO_REQ_PROM_OTR'
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
    object QRExprUsoCapital: TQRExpr
      Left = 896
      Top = 2
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2370.66666666667
        5.29166666666667
        153.458333333333)
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
      Transparent = False
      WordWrap = True
      Expression = 
        '(qryRsgMdo.SDO_REQ_PROM_LIQ + qryRsgMdo.SDO_REQ_PROM_FEGA + qryR' +
        'sgMdo.SDO_REQ_PROM_OTR ) * 0.08'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRDBText19: TQRDBText
      Left = 254
      Top = 2
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        672.041666666667
        5.29166666666667
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryRsgMdo
      DataField = 'IMP_INTERES_ACUM'
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
    object QRExpFactCapitalizacion: TQRExpr
      Left = 848
      Top = 2
      Width = 45
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2243.66666666667
        5.29166666666667
        119.0625)
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
      Transparent = False
      WordWrap = True
      Expression = 
        'IF(qryRsgMdo.SDO_PROMEDIO <= 0, 0,   (  (qryRsgMdo.SDO_REQ_PROM_' +
        'LIQ +     qryRsgMdo.SDO_REQ_PROM_FEGA +     qryRsgMdo.SDO_REQ_PR' +
        'OM_OTR)*0.08) / qryRsgMdo.SDO_PROMEDIO * 100)  '
      Mask = '###,###,###,###,###,##0.00%;1;_'
      FontSize = 6
    end
  end
  object qrGrpFootCVE_SIT_CARTERA: TQRBand
    Left = 48
    Top = 264
    Width = 960
    Height = 18
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
      47.625
      2540)
    BandType = rbGroupFooter
    object QRShape18: TQRShape
      Left = 77
      Top = 1
      Width = 879
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        203.729166666667
        2.64583333333333
        2325.6875)
      Shape = qrsRectangle
    end
    object QRExpr9: TQRExpr
      Left = 316
      Top = 3
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        836.083333333333
        7.9375
        153.458333333333)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_PROMEDIO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr10: TQRExpr
      Left = 495
      Top = 3
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1309.6875
        7.9375
        153.458333333333)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_PROM_LIQ)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr11: TQRExpr
      Left = 553
      Top = 3
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1463.14583333333
        7.9375
        153.458333333333)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_PROM_FEGA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr12: TQRExpr
      Left = 611
      Top = 3
      Width = 58
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
        153.458333333333)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_PROM_OTR)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr15: TQRExpr
      Left = 192
      Top = 3
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        508
        7.9375
        153.458333333333)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_VIG_TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr16: TQRExpr
      Left = 785
      Top = 3
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2076.97916666667
        7.9375
        153.458333333333)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_REQ_PROM_OTR)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr17: TQRExpr
      Left = 727
      Top = 3
      Width = 57
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1923.52083333333
        7.9375
        150.8125)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_REQ_PROM_FEGA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr18: TQRExpr
      Left = 669
      Top = 3
      Width = 57
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1770.0625
        7.9375
        150.8125)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_REQ_PROM_LIQ)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr26: TQRExpr
      Left = 896
      Top = 3
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2370.66666666667
        7.9375
        153.458333333333)
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
      Transparent = False
      WordWrap = True
      Expression = 
        'SUM((qryRsgMdo.SDO_REQ_PROM_LIQ + qryRsgMdo.SDO_REQ_PROM_FEGA + ' +
        'qryRsgMdo.SDO_REQ_PROM_OTR)*0.08)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr29: TQRExpr
      Left = 254
      Top = 3
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        672.041666666667
        7.9375
        153.458333333333)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.IMP_INTERES_ACUM)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr33: TQRExpr
      Left = 848
      Top = 3
      Width = 45
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2243.66666666667
        7.9375
        119.0625)
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
      Transparent = False
      WordWrap = True
      Expression = 
        'IF(SUM(qryRsgMdo.SDO_PROMEDIO) <= 0, 0,(SUM((qryRsgMdo.SDO_REQ_P' +
        'ROM_LIQ + qryRsgMdo.SDO_REQ_PROM_FEGA + qryRsgMdo.SDO_REQ_PROM_O' +
        'TR)*0.08) / SUM(qryRsgMdo.SDO_PROMEDIO))*100)'
      Mask = '###,###,###,###,###,##0.00%;1;_'
      FontSize = 6
    end
    object QRLabel19: TQRLabel
      Left = 81
      Top = 3
      Width = 108
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        214.3125
        7.9375
        285.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'TOTAL SIT. DE LA CARTERA'
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
  end
  object qrGrpID_ACREDITADO: TQRGroup
    Left = 48
    Top = 210
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
    Expression = 'qryRsgMdo.ID_ACREDITADO'
    FooterBand = qrGrpFootID_ACREDITADO
    Master = Owner
    ReprintOnNewPage = False
    object QRShape2: TQRShape
      Left = 38
      Top = 2
      Width = 918
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        100.541666666667
        5.29166666666667
        2428.875)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 186
      Top = 4
      Width = 34
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        492.125
        10.5833333333333
        89.9583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'Nombre:'
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
    object QRDBText4: TQRDBText
      Left = 223
      Top = 4
      Width = 76
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        590.020833333333
        10.5833333333333
        201.083333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clSilver
      DataSet = qryRsgMdo
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
    object QRLabel2: TQRLabel
      Left = 50
      Top = 4
      Width = 63
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        132.291666666667
        10.5833333333333
        166.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'Núm. Acreditado'
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
    object QRDBText3: TQRDBText
      Left = 116
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
        306.916666666667
        10.5833333333333
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clSilver
      DataSet = qryRsgMdo
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
  end
  object qrGrpCVE_SIT_CARTERA: TQRGroup
    Left = 48
    Top = 229
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
    Expression = 'qryRsgMdo.CVE_SIT_CARTERA'
    FooterBand = qrGrpFootCVE_SIT_CARTERA
    Master = Owner
    ReprintOnNewPage = False
    object QRShape3: TQRShape
      Left = 77
      Top = 2
      Width = 879
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        203.729166666667
        5.29166666666667
        2325.6875)
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 96
      Top = 4
      Width = 84
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        254
        10.5833333333333
        222.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'Situación de la Cartera'
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
    object QRDBText2: TQRDBText
      Left = 183
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
        484.1875
        10.5833333333333
        214.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qryRsgMdo
      DataField = 'DESC_SIT_CARTERA'
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
  object qrGrpFootID_ACREDITADO: TQRBand
    Left = 48
    Top = 282
    Width = 960
    Height = 35
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
      92.6041666666667
      2540)
    BandType = rbGroupFooter
    object QRShape19: TQRShape
      Left = 38
      Top = 1
      Width = 918
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        100.541666666667
        2.64583333333333
        2428.875)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRExpr1: TQRExpr
      Left = 316
      Top = 19
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        836.083333333333
        50.2708333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_PROMEDIO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr2: TQRExpr
      Left = 495
      Top = 19
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1309.6875
        50.2708333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_PROM_LIQ)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr3: TQRExpr
      Left = 553
      Top = 19
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1463.14583333333
        50.2708333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_PROM_FEGA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr4: TQRExpr
      Left = 611
      Top = 19
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1616.60416666667
        50.2708333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_PROM_OTR)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr13: TQRExpr
      Left = 191
      Top = 19
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        505.354166666667
        50.2708333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_VIG_TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr19: TQRExpr
      Left = 669
      Top = 19
      Width = 57
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1770.0625
        50.2708333333333
        150.8125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_REQ_PROM_LIQ)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr20: TQRExpr
      Left = 727
      Top = 19
      Width = 57
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1923.52083333333
        50.2708333333333
        150.8125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_REQ_PROM_FEGA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr21: TQRExpr
      Left = 785
      Top = 19
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2076.97916666667
        50.2708333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_REQ_PROM_OTR)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr27: TQRExpr
      Left = 896
      Top = 19
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2370.66666666667
        50.2708333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 
        'SUM((qryRsgMdo.SDO_REQ_PROM_LIQ + qryRsgMdo.SDO_REQ_PROM_FEGA + ' +
        'qryRsgMdo.SDO_REQ_PROM_OTR)*0.08)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr31: TQRExpr
      Left = 254
      Top = 19
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        672.041666666667
        50.2708333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.IMP_INTERES_ACUM)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr34: TQRExpr
      Left = 848
      Top = 19
      Width = 45
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2243.66666666667
        50.2708333333333
        119.0625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 
        'IF(SUM(qryRsgMdo.SDO_PROMEDIO) <= 0, 0,(SUM((qryRsgMdo.SDO_REQ_P' +
        'ROM_LIQ + qryRsgMdo.SDO_REQ_PROM_FEGA + qryRsgMdo.SDO_REQ_PROM_O' +
        'TR)*0.08) / SUM(qryRsgMdo.SDO_PROMEDIO))*100)'
      Mask = '###,###,###,###,###,##0.00%;1;_'
      FontSize = 6
    end
    object QRLabel18: TQRLabel
      Left = 50
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
        132.291666666667
        10.5833333333333
        214.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'TOTAL ACREDITADO'
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
    object QRDBText15: TQRDBText
      Left = 134
      Top = 4
      Width = 76
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        354.541666666667
        10.5833333333333
        201.083333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clSilver
      DataSet = qryRsgMdo
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
  object qrGrpFootCVE_MONEDA: TQRBand
    Left = 48
    Top = 317
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
    BandType = rbGroupFooter
    object QRShape20: TQRShape
      Left = 1
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
        2.64583333333333
        5.29166666666667
        2529.41666666667)
      Shape = qrsRectangle
    end
    object QRLabel20: TQRLabel
      Left = 4
      Top = 4
      Width = 64
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
        169.333333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'TOTAL MONEDA'
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
    object QRExpr5: TQRExpr
      Left = 316
      Top = 4
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        836.083333333333
        10.5833333333333
        153.458333333333)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_PROMEDIO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr6: TQRExpr
      Left = 495
      Top = 4
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1309.6875
        10.5833333333333
        153.458333333333)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_PROM_LIQ)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr7: TQRExpr
      Left = 553
      Top = 4
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1463.14583333333
        10.5833333333333
        153.458333333333)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_PROM_FEGA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr8: TQRExpr
      Left = 611
      Top = 4
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1616.60416666667
        10.5833333333333
        153.458333333333)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_PROM_OTR)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr14: TQRExpr
      Left = 192
      Top = 4
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        508
        10.5833333333333
        153.458333333333)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_VIG_TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr22: TQRExpr
      Left = 669
      Top = 3
      Width = 57
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1770.0625
        7.9375
        150.8125)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_REQ_PROM_LIQ)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr23: TQRExpr
      Left = 727
      Top = 4
      Width = 57
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1923.52083333333
        10.5833333333333
        150.8125)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_REQ_PROM_FEGA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr24: TQRExpr
      Left = 785
      Top = 4
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2076.97916666667
        10.5833333333333
        153.458333333333)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.SDO_REQ_PROM_OTR)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr28: TQRExpr
      Left = 896
      Top = 4
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2370.66666666667
        10.5833333333333
        153.458333333333)
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
      Transparent = False
      WordWrap = True
      Expression = 
        'SUM((qryRsgMdo.SDO_REQ_PROM_LIQ + qryRsgMdo.SDO_REQ_PROM_FEGA + ' +
        'qryRsgMdo.SDO_REQ_PROM_OTR)*0.08)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr30: TQRExpr
      Left = 254
      Top = 4
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        672.041666666667
        10.5833333333333
        153.458333333333)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryRsgMdo.IMP_INTERES_ACUM)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr35: TQRExpr
      Left = 848
      Top = 4
      Width = 45
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2243.66666666667
        10.5833333333333
        119.0625)
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
      Transparent = False
      WordWrap = True
      Expression = 
        'IF(SUM(qryRsgMdo.SDO_PROMEDIO) <= 0, 0,(SUM((qryRsgMdo.SDO_REQ_P' +
        'ROM_LIQ + qryRsgMdo.SDO_REQ_PROM_FEGA + qryRsgMdo.SDO_REQ_PROM_O' +
        'TR)*0.08) / SUM(qryRsgMdo.SDO_PROMEDIO))*100)'
      Mask = '###,###,###,###,###,##0.00%;1;_'
      FontSize = 6
    end
  end
  object qryRsgMdo: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'SELECT R.*,'
      '        (R.SDO_PROM_LIQ  * PCT_RIESGO_LIQ)  AS SDO_REQ_PROM_LIQ,'
      
        '        (R.SDO_PROM_FEGA * PCT_RIESGO_FEGA) AS SDO_REQ_PROM_FEGA' +
        ','
      '        (R.SDO_PROM_OTR  * PCT_RIESGO_OTR)  AS SDO_REQ_PROM_OTR'
      ' FROM ( SELECT'
      '             SALDOS.*,'
      
        '             ROUND(SALDOS.SDO_PROMEDIO * SALDOS.PCT_GTIA_LIQ / 1' +
        '00, 2)  AS SDO_PROM_LIQ,'
      
        '             ROUND(SALDOS.SDO_PROMEDIO * SALDOS.PCT_GTIA_FEGA / ' +
        '100, 2) AS SDO_PROM_FEGA,'
      
        '             ROUND(SALDOS.SDO_PROMEDIO * SALDOS.PCT_GTIA_OTR / 1' +
        '00, 2)  AS SDO_PROM_OTR'
      '        FROM  ('
      '              SELECT PCT_AGRONE.*,'
      '                     RIESGO1.*,'
      '                     RIESGO2.*,'
      
        '                     PKGCRCREDITOO1.GET_RIESGO_MDO_PCT_FIRA('#39'PCT' +
        'LIQ'#39', PCT_GTIA_LIQ_ORIG, PCT_GTIA_FEGA_ORIG) AS PCT_GTIA_LIQ,'
      
        '                     PKGCRCREDITOO1.GET_RIESGO_MDO_PCT_FIRA('#39'PCT' +
        'FEG'#39', PCT_GTIA_LIQ_ORIG, PCT_GTIA_FEGA_ORIG) AS PCT_GTIA_FEGA,'
      
        '                     PKGCRCREDITOO1.GET_RIESGO_MDO_PCT_FIRA('#39'PCT' +
        'OTR'#39', PCT_GTIA_LIQ_ORIG, PCT_GTIA_FEGA_ORIG) AS PCT_GTIA_OTR,'
      
        '                     (PKGCRCREDITOO1.GET_PCT_RIESGO_LIQ(PCT_AGRO' +
        'NE.ID_CREDITO, TO_DATE('#39'31/10/2005'#39','#39'DD/MM/YYYY'#39')) / 100) AS PCT' +
        '_RIESGO_LIQ'
      '              FROM ('
      '                     SELECT'
      '                          CART_AGRON.ID_EMPRESA,'
      '                          CART_AGRON.CVE_MONEDA,'
      '                          M.DESC_MONEDA,'
      
        '                          DECODE(CART_AGRON.ANIO_VENC, '#39'0'#39', '#39'VI'#39 +
        ', '#39'VE'#39') AS CVE_SIT_CARTERA,'
      '                          P.ID_PERSONA AS ID_ACREDITADO,'
      
        '                          SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2' +
        '(NULL, NULL, P.ID_PERSONA),1,255) AS NOM_ACREDITADO,'
      '                          CART_AGRON.ID_CONTRATO,'
      '                          CART_AGRON.ID_CREDITO,'
      '                          CART_AGRON.F_INICIO,'
      '                          CART_AGRON.F_VENCIMIENTO,'
      '                          CART_AGRON.F_TRASPASO_VENC,'
      '                          CART_AGRON.SDO_VIG_TOTAL,'
      '                          CFDC.IMP_INTERES_ACUM,'
      
        '                          DECODE(CART_AGRON.ANIO_VENC, '#39'0'#39', '#39'Vig' +
        'ente, Impagada'#39', '#39'Vencida'#39') AS DESC_SIT_CARTERA,'
      
        '                          PKGCRGYM.GET_SDO_PROMEDIO_COINCRE(CART' +
        '_AGRON.ID_CREDITO, TO_DATE('#39'31/10/2005'#39','#39'DD/MM/YYYY'#39')) AS SDO_PR' +
        'OMEDIO,'
      
        '                          CART_AGRON.PCT_GTIA_LIQ AS PCT_GTIA_LI' +
        'Q_ORIG,'
      
        '                          PKGCRCREDITOO1.OBTEQUIVALENCIA(2, CART' +
        '_AGRON.CVE_MONEDA,'
      
        '                                                            CART' +
        '_AGRON.CVE_OPERATIVA,'
      
        '                                                            CART' +
        '_AGRON.PCT_GTIA_LIQ ) AS PCT_GTIA_FEGA_ORIG'
      '                     FROM PERSONA P,'
      '                          MONEDA M,'
      
        '                          ( SELECT ID_CREDITO, SUM(NVL(IMP_ACCES' +
        'ORIO,0)) AS IMP_INTERES_ACUM'
      '                            FROM CR_FND_DHIS_CRED'
      
        '                            WHERE F_CIERRE = TO_DATE('#39'31/10/2005' +
        #39','#39'DD/MM/YYYY'#39')'
      '                              AND CVE_ACCESORIO = '#39'RI'#39
      '                            GROUP BY ID_CREDITO'
      '                          ) CFDC,'
      '                          ( SELECT AGRONE.*, CHC.SDO_VIG_TOTAL,'
      
        '                                   PKGCRCREDITOO1.GET_OBT_PCT_GT' +
        'IA_LIQ(AGRONE.ID_CREDITO) AS PCT_GTIA_LIQ'
      '                            FROM CR_HISTO_CRED CHC,'
      
        '                                 ( SELECT CTO.ID_TITULAR, CTO.ID' +
        '_EMPRESA, CTO.CVE_MONEDA,'
      
        '                                          CC.ID_CREDITO, CO.ID_C' +
        'ONTRATO,'
      
        '                                          CC.F_INICIO, CC.F_VENC' +
        'IMIENTO,'
      '                                          CC.F_TRASPASO_VENC,'
      
        '                                          NVL(TO_CHAR(CC.F_TRASP' +
        'ASO_VENC,'#39'YYYY'#39'),'#39'0'#39') AS ANIO_VENC,'
      '                                          CVE_OPERATIVA'
      
        '                                   FROM ( SELECT * FROM CR_PRODU' +
        'CTO'
      
        '                                          WHERE CVE_PRODUCTO_GPO' +
        ' = '#39'AGRONE'#39' ) CP,'
      '                                          CR_CONTRATO CO,'
      '                                          CR_CREDITO CC,'
      '                                          CONTRATO CTO'
      
        '                                   WHERE CO.CVE_PRODUCTO_CRE = C' +
        'P.CVE_PRODUCTO_CRE'
      
        '                                     AND CC.ID_CONTRATO = CO.ID_' +
        'CONTRATO'
      
        '                                     AND CTO.ID_CONTRATO = CO.ID' +
        '_CONTRATO'
      '                                 ) AGRONE'
      
        '                            WHERE CHC.F_CIERRE = TO_DATE('#39'31/10/' +
        '2005'#39','#39'DD/MM/YYYY'#39')'
      
        '                              AND CHC.ID_CREDITO = AGRONE.ID_CRE' +
        'DITO'
      '                          ) CART_AGRON'
      '                    WHERE P.ID_PERSONA = CART_AGRON.ID_TITULAR'
      '                      AND P.CVE_TIPO_SECTOR NOT IN ('#39'14'#39')'
      '                      AND M.CVE_MONEDA = CART_AGRON.CVE_MONEDA'
      
        '                      AND CFDC.ID_CREDITO = CART_AGRON.ID_CREDIT' +
        'O'
      '                   ) PCT_AGRONE,'
      
        '                   ( SELECT (CRM.PCT_RIESGO / 100) AS PCT_RIESGO' +
        '_FEGA'
      
        '                     FROM ( SELECT CVE_PRODUCTO_GPO, CVE_CRIT_RI' +
        'ESGO,'
      
        '                                   MAX(F_INI_VIGENCIA) AS MAX_F_' +
        'INI_VIGENCIA'
      '                            FROM ADMIPROD.CR_RIESGO_MDO'
      '                            WHERE CVE_PRODUCTO_GPO = '#39'AGRONE'#39
      '                              AND CVE_CRIT_RIESGO = '#39'RSGFEG'#39
      
        '                              AND F_INI_VIGENCIA <= TO_DATE('#39'31/' +
        '10/2005'#39','#39'DD/MM/YYYY'#39')'
      '                              AND SIT_RIESGO_MDO <> '#39'CA'#39
      
        '                            GROUP BY CVE_PRODUCTO_GPO, CVE_CRIT_' +
        'RIESGO'
      '                          ) TEMP,'
      '                          ADMIPROD.CR_RIESGO_MDO CRM'
      
        '                     WHERE CRM.CVE_PRODUCTO_GPO  = TEMP.CVE_PROD' +
        'UCTO_GPO'
      
        '                       AND CRM.CVE_CRIT_RIESGO   = TEMP.CVE_CRIT' +
        '_RIESGO'
      
        '                       AND CRM.F_INI_VIGENCIA = MAX_F_INI_VIGENC' +
        'IA'
      '                   ) RIESGO1,'
      
        '                   ( SELECT (CRM.PCT_RIESGO / 100) AS PCT_RIESGO' +
        '_OTR'
      
        '                     FROM ( SELECT CVE_PRODUCTO_GPO, CVE_CRIT_RI' +
        'ESGO,'
      
        '                                   MAX(F_INI_VIGENCIA) AS MAX_F_' +
        'INI_VIGENCIA'
      '                            FROM ADMIPROD.CR_RIESGO_MDO'
      '                            WHERE CVE_PRODUCTO_GPO = '#39'AGRONE'#39
      '                              AND CVE_CRIT_RIESGO = '#39'RSGOTR'#39
      
        '                              AND F_INI_VIGENCIA <= TO_DATE('#39'31/' +
        '10/2005'#39','#39'DD/MM/YYYY'#39')'
      '                              AND SIT_RIESGO_MDO <> '#39'CA'#39
      
        '                            GROUP BY CVE_PRODUCTO_GPO, CVE_CRIT_' +
        'RIESGO'
      '                          ) TEMP,'
      '                          ADMIPROD.CR_RIESGO_MDO CRM'
      
        '                     WHERE CRM.CVE_PRODUCTO_GPO  = TEMP.CVE_PROD' +
        'UCTO_GPO'
      
        '                       AND CRM.CVE_CRIT_RIESGO   = TEMP.CVE_CRIT' +
        '_RIESGO'
      
        '                       AND CRM.F_INI_VIGENCIA = MAX_F_INI_VIGENC' +
        'IA'
      '                   ) RIESGO2'
      '              ) SALDOS'
      '          ) R'
      '  /* Filtros */ '
      '  WHERE R.ID_EMPRESA = DECODE(2,0,R.ID_EMPRESA,2) '
      '        AND R.ID_ACREDITADO = DECODE(0,0,R.ID_ACREDITADO,0) '
      '        AND R.CVE_MONEDA = DECODE(0,0,R.CVE_MONEDA,0) '
      '        AND R.ID_CONTRATO = DECODE(0,0,R.ID_CONTRATO,0) '
      '        AND R.ID_CREDITO = DECODE(0,0,R.ID_CREDITO,0) '
      
        '    ORDER BY CVE_MONEDA, CVE_SIT_CARTERA DESC, NOM_ACREDITADO, I' +
        'D_CONTRATO, ID_CREDITO')
    Left = 25
    Top = 6
    object qryRsgMdoID_EMPRESA: TFloatField
      FieldName = 'ID_EMPRESA'
    end
    object qryRsgMdoCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qryRsgMdoDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qryRsgMdoCVE_SIT_CARTERA: TStringField
      FieldName = 'CVE_SIT_CARTERA'
      Size = 2
    end
    object qryRsgMdoID_ACREDITADO: TFloatField
      FieldName = 'ID_ACREDITADO'
    end
    object qryRsgMdoNOM_ACREDITADO: TStringField
      FieldName = 'NOM_ACREDITADO'
      Size = 255
    end
    object qryRsgMdoID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qryRsgMdoID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qryRsgMdoF_INICIO: TDateTimeField
      FieldName = 'F_INICIO'
    end
    object qryRsgMdoF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qryRsgMdoF_TRASPASO_VENC: TDateTimeField
      FieldName = 'F_TRASPASO_VENC'
    end
    object qryRsgMdoSDO_VIG_TOTAL: TFloatField
      FieldName = 'SDO_VIG_TOTAL'
    end
    object qryRsgMdoIMP_INTERES_ACUM: TFloatField
      FieldName = 'IMP_INTERES_ACUM'
    end
    object qryRsgMdoDESC_SIT_CARTERA: TStringField
      FieldName = 'DESC_SIT_CARTERA'
      Size = 17
    end
    object qryRsgMdoSDO_PROMEDIO: TFloatField
      FieldName = 'SDO_PROMEDIO'
    end
    object qryRsgMdoPCT_GTIA_LIQ_ORIG: TFloatField
      FieldName = 'PCT_GTIA_LIQ_ORIG'
    end
    object qryRsgMdoPCT_GTIA_FEGA_ORIG: TFloatField
      FieldName = 'PCT_GTIA_FEGA_ORIG'
    end
    object qryRsgMdoPCT_RIESGO_FEGA: TFloatField
      FieldName = 'PCT_RIESGO_FEGA'
    end
    object qryRsgMdoPCT_RIESGO_OTR: TFloatField
      FieldName = 'PCT_RIESGO_OTR'
    end
    object qryRsgMdoPCT_GTIA_LIQ: TFloatField
      FieldName = 'PCT_GTIA_LIQ'
    end
    object qryRsgMdoPCT_GTIA_FEGA: TFloatField
      FieldName = 'PCT_GTIA_FEGA'
    end
    object qryRsgMdoPCT_GTIA_OTR: TFloatField
      FieldName = 'PCT_GTIA_OTR'
    end
    object qryRsgMdoPCT_RIESGO_LIQ: TFloatField
      FieldName = 'PCT_RIESGO_LIQ'
    end
    object qryRsgMdoSDO_PROM_LIQ: TFloatField
      FieldName = 'SDO_PROM_LIQ'
    end
    object qryRsgMdoSDO_PROM_FEGA: TFloatField
      FieldName = 'SDO_PROM_FEGA'
    end
    object qryRsgMdoSDO_PROM_OTR: TFloatField
      FieldName = 'SDO_PROM_OTR'
    end
    object qryRsgMdoSDO_REQ_PROM_LIQ: TFloatField
      FieldName = 'SDO_REQ_PROM_LIQ'
    end
    object qryRsgMdoSDO_REQ_PROM_FEGA: TFloatField
      FieldName = 'SDO_REQ_PROM_FEGA'
    end
    object qryRsgMdoSDO_REQ_PROM_OTR: TFloatField
      FieldName = 'SDO_REQ_PROM_OTR'
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.SQL'
    Filter = 'SQL File|*.SQL'
    Left = 66
    Top = 7
  end
end
