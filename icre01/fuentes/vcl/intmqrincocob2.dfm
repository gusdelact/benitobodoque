object QrInCoCob2: TQrInCoCob2
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qyInfCobConta
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
    Height = 36
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
      95.25
      2540)
    BandType = rbColumnHeader
    object QRShape1: TQRShape
      Left = 0
      Top = 0
      Width = 50
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        0
        0
        132.291666666667)
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 1
      Top = 2
      Width = 40
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
        105.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Crédito'
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
      Left = 40
      Top = 0
      Width = 105
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        105.833333333333
        0
        277.8125)
      Shape = qrsRectangle
    end
    object QRLabel13: TQRLabel
      Left = 48
      Top = 2
      Width = 89
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        127
        5.29166666666667
        235.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Cliente'
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
      Left = 200
      Top = 9
      Width = 57
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        529.166666666667
        23.8125
        150.8125)
      Shape = qrsRectangle
    end
    object QRLabel15: TQRLabel
      Left = 209
      Top = 9
      Width = 43
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        552.979166666667
        23.8125
        113.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Anticipado / Programado'
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
      Left = 256
      Top = 9
      Width = 57
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        677.333333333333
        23.8125
        150.8125)
      Shape = qrsRectangle
    end
    object QRLabel18: TQRLabel
      Left = 261
      Top = 10
      Width = 47
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        690.5625
        26.4583333333333
        124.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Impagado'
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
      Left = 410
      Top = 9
      Width = 55
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        1084.79166666667
        23.8125
        145.520833333333)
      Shape = qrsRectangle
    end
    object QRLabel20: TQRLabel
      Left = 416
      Top = 10
      Width = 46
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1100.66666666667
        26.4583333333333
        121.708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Programados / Anticipados'
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
      Left = 514
      Top = 9
      Width = 53
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        1359.95833333333
        23.8125
        140.229166666667)
      Shape = qrsRectangle
    end
    object QRLabel22: TQRLabel
      Left = 519
      Top = 10
      Width = 44
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1373.1875
        26.4583333333333
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Vencido'
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
      Left = 464
      Top = 9
      Width = 51
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        1227.66666666667
        23.8125
        134.9375)
      Shape = qrsRectangle
    end
    object QRLabel24: TQRLabel
      Left = 465
      Top = 10
      Width = 46
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1230.3125
        26.4583333333333
        121.708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Impagado'
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
    object QRShape12: TQRShape
      Left = 705
      Top = 9
      Width = 43
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        1865.3125
        23.8125
        113.770833333333)
      Shape = qrsRectangle
    end
    object QRShape14: TQRShape
      Left = 664
      Top = 0
      Width = 42
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        1756.83333333333
        0
        111.125)
      Shape = qrsRectangle
    end
    object QRShape15: TQRShape
      Left = 622
      Top = 0
      Width = 43
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        1645.70833333333
        0
        113.770833333333)
      Shape = qrsRectangle
    end
    object QRShape16: TQRShape
      Left = 790
      Top = 9
      Width = 43
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        2090.20833333333
        23.8125
        113.770833333333)
      Shape = qrsRectangle
    end
    object QRShape17: TQRShape
      Left = 747
      Top = 9
      Width = 46
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        1976.4375
        23.8125
        121.708333333333)
      Shape = qrsRectangle
    end
    object QRShSituacion: TQRShape
      Left = 927
      Top = 0
      Width = 32
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        2452.6875
        0
        84.6666666666667)
      Shape = qrsRectangle
    end
    object QRShape19: TQRShape
      Left = 867
      Top = 0
      Width = 30
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        2293.9375
        0
        79.375)
      Shape = qrsRectangle
    end
    object QRShape20: TQRShape
      Left = 832
      Top = 0
      Width = 36
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        2201.33333333333
        0
        95.25)
      Shape = qrsRectangle
    end
    object QRShape21: TQRShape
      Left = 566
      Top = 9
      Width = 57
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        1497.54166666667
        23.8125
        150.8125)
      Shape = qrsRectangle
    end
    object QRLabel33: TQRLabel
      Left = 706
      Top = 10
      Width = 41
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        1867.95833333333
        26.4583333333333
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Intereses Ordinarios'
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
    object QRLabel34: TQRLabel
      Left = 748
      Top = 10
      Width = 41
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        1979.08333333333
        26.4583333333333
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '   Conceptos'
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
    object QRLabel35: TQRLabel
      Left = 790
      Top = 10
      Width = 41
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        2090.20833333333
        26.4583333333333
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Intereses Moratorios'
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
    object QRLabel36: TQRLabel
      Left = 623
      Top = 2
      Width = 39
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        1648.35416666667
        5.29166666666667
        103.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '                Pago de Conceptos'
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
    object QRLabel37: TQRLabel
      Left = 665
      Top = 2
      Width = 40
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        1759.47916666667
        5.29166666666667
        105.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '         Moratorios'
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
    object QRLabel38: TQRLabel
      Left = 569
      Top = 9
      Width = 51
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1505.47916666667
        23.8125
        134.9375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Pend. de Afec. a Result. Cta.'
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
    object QRLabel39: TQRLabel
      Left = 833
      Top = 2
      Width = 34
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        2203.97916666667
        5.29166666666667
        89.9583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '                 Beneficio'
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
    object QRLabel40: TQRLabel
      Left = 868
      Top = 10
      Width = 29
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        2296.58333333333
        26.4583333333333
        76.7291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Alta'
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
    object QRLbSituacion: TQRLabel
      Left = 943
      Top = 10
      Width = 14
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2495.02083333333
        26.4583333333333
        37.0416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Sit'
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
    object QRShape23: TQRShape
      Left = 200
      Top = 0
      Width = 211
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        529.166666666667
        0
        558.270833333333)
      Shape = qrsRectangle
    end
    object QRLabel42: TQRLabel
      Left = 208
      Top = 1
      Width = 192
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        550.333333333333
        2.64583333333333
        508)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Pago de Capital / Financiamiento Adicional'
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
    object QRShape22: TQRShape
      Left = 410
      Top = 0
      Width = 213
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        1084.79166666667
        0
        563.5625)
      Shape = qrsRectangle
    end
    object QRLabel43: TQRLabel
      Left = 416
      Top = 1
      Width = 185
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1100.66666666667
        2.64583333333333
        489.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Pago de Intereses'
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
    object QRShape26: TQRShape
      Left = 705
      Top = 0
      Width = 128
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        1865.3125
        0
        338.666666666667)
      Shape = qrsRectangle
    end
    object QRLabel45: TQRLabel
      Left = 709
      Top = 1
      Width = 121
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1875.89583333333
        2.64583333333333
        320.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Pago de IVA'
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
    object QRLabel8: TQRLabel
      Left = 928
      Top = 3
      Width = 30
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.1458333333333
        2455.33333333333
        7.9375
        79.375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '       Fecha Cancela'
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
      Left = 312
      Top = 18
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        825.5
        47.625
        132.291666666667)
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 320
      Top = 19
      Width = 39
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        846.666666666667
        50.2708333333333
        103.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Exigible'
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
      Left = 361
      Top = 18
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        955.145833333333
        47.625
        132.291666666667)
      Shape = qrsRectangle
    end
    object QRLabel21: TQRLabel
      Left = 368
      Top = 19
      Width = 41
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        973.666666666667
        50.2708333333333
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'No Exigible'
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
      Left = 144
      Top = 0
      Width = 57
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        381
        0
        150.8125)
      Shape = qrsRectangle
    end
    object QRLabel31: TQRLabel
      Left = 152
      Top = 2
      Width = 42
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        402.166666666667
        5.29166666666667
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Per. / DOC.'
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
      Left = 312
      Top = 10
      Width = 99
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        825.5
        26.4583333333333
        261.9375)
      Shape = qrsRectangle
    end
    object QRLabel32: TQRLabel
      Left = 317
      Top = 10
      Width = 92
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        838.729166666667
        26.4583333333333
        243.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Vencido'
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
    object QRShape18: TQRShape
      Left = 896
      Top = 0
      Width = 32
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        2370.66666666667
        0
        84.6666666666667)
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 897
      Top = 10
      Width = 29
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        2373.3125
        26.4583333333333
        76.7291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Valor'
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
  object qrbCONCEPTOS: TQRBand
    Left = 48
    Top = 223
    Width = 960
    Height = 9
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrbCONCEPTOSBeforePrint
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
      23.8125
      2540)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 6
      Top = 0
      Width = 139
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        15.875
        0
        367.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'CONCEPTO'
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
    object QRDBText2: TQRDBText
      Left = 144
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
        381
        0
        150.8125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'PER_DOC'
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
    object QRDBTxtCAP_ANT_PROG: TQRDBText
      Left = 200
      Top = 0
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        529.166666666667
        0
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'CAP_ANT_PROG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBTxtCAP_VEN_EXIG: TQRDBText
      Left = 309
      Top = 0
      Width = 48
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        817.5625
        0
        127)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'CAP_VEN_EXIG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBTxtCAP_IMP: TQRDBText
      Left = 255
      Top = 0
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        674.6875
        0
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'CAP_IMP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText7: TQRDBText
      Left = 866
      Top = 0
      Width = 31
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2291.29166666667
        0
        82.0208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'FH_ALTA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = 'dd/mm/yyyy'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBTSituacion: TQRDBText
      Left = 964
      Top = 0
      Width = 13
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2550.58333333333
        0
        34.3958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'SIT_TRANSACCION'
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
    object QRDBTxtINT_IMP: TQRDBText
      Left = 460
      Top = 0
      Width = 45
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1217.08333333333
        0
        119.0625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'INT_IMP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBTxtINT_ANT_PROG: TQRDBText
      Left = 407
      Top = 0
      Width = 51
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1076.85416666667
        0
        134.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'INT_ANT_PROG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBTxtPAGO_CONCEPTOS: TQRDBText
      Left = 620
      Top = 0
      Width = 39
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1640.41666666667
        0
        103.1875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'PAGO_CONCEPTOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBTxtINT_PEN_AFEC_RES: TQRDBText
      Left = 566
      Top = 0
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1497.54166666667
        0
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'INT_PEN_AFEC_RES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBTxtINT_VENC: TQRDBText
      Left = 506
      Top = 0
      Width = 60
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1338.79166666667
        0
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'INT_VENC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBTxtIMPMOR: TQRDBText
      Left = 660
      Top = 0
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1746.25
        0
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'IMPMOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBTxtIVA_CO: TQRDBText
      Left = 746
      Top = 0
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1973.79166666667
        0
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'IVA_CO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBTxtIVA_INT: TQRDBText
      Left = 703
      Top = 0
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1860.02083333333
        0
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'IVA_INT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBTxtBENBCO: TQRDBText
      Left = 832
      Top = 0
      Width = 33
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2201.33333333333
        0
        87.3125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'BENBCO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBTxtIVA_MOR: TQRDBText
      Left = 789
      Top = 0
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2087.5625
        0
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'IVA_MOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBTxtCAP_VEN_NOEX: TQRDBText
      Left = 358
      Top = 0
      Width = 48
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        947.208333333333
        0
        127)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'CAP_VEN_NOEX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText18: TQRDBText
      Left = 898
      Top = 0
      Width = 31
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2375.95833333333
        0
        82.0208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'F_VALOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = 'dd/mm/yyyy'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText33: TQRDBText
      Left = 928
      Top = 0
      Width = 31
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2455.33333333333
        0
        82.0208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'FH_CANCELA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = 'dd/mm/yyyy'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
  end
  object QRFooterMoneda: TQRBand
    Left = 48
    Top = 259
    Width = 960
    Height = 25
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFooterMonedaBeforePrint
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
      66.1458333333333
      2540)
    BandType = rbGroupFooter
    object QRExpr52: TQRExpr
      Left = 358
      Top = 5
      Width = 48
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        947.208333333333
        13.2291666666667
        127)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.CAP_VEN_NOEX)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr53: TQRExpr
      Left = 200
      Top = 5
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        529.166666666667
        13.2291666666667
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.CAP_ANT_PROG)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr54: TQRExpr
      Left = 255
      Top = 5
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        674.6875
        13.2291666666667
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.CAP_IMP)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr55: TQRExpr
      Left = 309
      Top = 5
      Width = 48
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        817.5625
        13.2291666666667
        127)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.CAP_VEN_EXIG)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr56: TQRExpr
      Left = 407
      Top = 5
      Width = 51
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1076.85416666667
        13.2291666666667
        134.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.INT_ANT_PROG)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr57: TQRExpr
      Left = 460
      Top = 5
      Width = 45
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1217.08333333333
        13.2291666666667
        119.0625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.INT_IMP)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr58: TQRExpr
      Left = 506
      Top = 5
      Width = 60
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1338.79166666667
        13.2291666666667
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.INT_VENC)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr59: TQRExpr
      Left = 566
      Top = 5
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1497.54166666667
        13.2291666666667
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.INT_PEN_AFEC_RES)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr60: TQRExpr
      Left = 620
      Top = 5
      Width = 39
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1640.41666666667
        13.2291666666667
        103.1875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.PAGO_CONCEPTOS)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr61: TQRExpr
      Left = 660
      Top = 5
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1746.25
        13.2291666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.IMPMOR)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr62: TQRExpr
      Left = 703
      Top = 5
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1860.02083333333
        13.2291666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.IVA_INT)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr63: TQRExpr
      Left = 746
      Top = 5
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1973.79166666667
        13.2291666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.IVA_CO)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr64: TQRExpr
      Left = 789
      Top = 5
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2087.5625
        13.2291666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.IVA_MOR)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr65: TQRExpr
      Left = 832
      Top = 5
      Width = 33
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2201.33333333333
        13.2291666666667
        87.3125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.BENBCO)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRLabel19: TQRLabel
      Left = 1
      Top = 5
      Width = 74
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2.64583333333333
        13.2291666666667
        195.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Moneda'
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
    object QRLabel55: TQRLabel
      Left = 885
      Top = 5
      Width = 21
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        2341.5625
        13.2291666666667
        55.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL'
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
    object QRExpr103: TQRExpr
      Left = 906
      Top = 5
      Width = 54
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2397.125
        13.2291666666667
        142.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 
        'SUM(qyInfCobConta.CAP_ANT_PROG) + SUM(qyInfCobConta.CAP_IMP)+SUM' +
        '(qyInfCobConta.CAP_VEN_EXIG)+SUM(qyInfCobConta.CAP_VEN_NOEX)+SUM' +
        '(qyInfCobConta.INT_ANT_PROG)+SUM(qyInfCobConta.INT_IMP)+SUM(qyIn' +
        'fCobConta.INT_VENC)+SUM(qyInfCobConta.INT_PEN_AFEC_RES)+SUM(qyIn' +
        'fCobConta.PAGO_CONCEPTOS)+SUM(qyInfCobConta.IMPMOR)+SUM(qyInfCob' +
        'Conta.IVA_INT)+SUM(qyInfCobConta.IVA_CO)+SUM(qyInfCobConta.IVA_M' +
        'OR)+SUM(qyInfCobConta.BENBCO)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
  end
  object QRFooterCesion: TQRBand
    Left = 48
    Top = 232
    Width = 960
    Height = 9
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFooterCesionBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      23.8125
      2540)
    BandType = rbGroupFooter
    object QRExpr1: TQRExpr
      Left = 358
      Top = 1
      Width = 48
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        947.208333333333
        2.64583333333333
        127)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.CAP_VEN_NOEX)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr2: TQRExpr
      Left = 200
      Top = 1
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        529.166666666667
        2.64583333333333
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.CAP_ANT_PROG)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr3: TQRExpr
      Left = 255
      Top = 1
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        674.6875
        2.64583333333333
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.CAP_IMP)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr16: TQRExpr
      Left = 309
      Top = 1
      Width = 48
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        817.5625
        2.64583333333333
        127)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.CAP_VEN_EXIG)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr17: TQRExpr
      Left = 407
      Top = 1
      Width = 51
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1076.85416666667
        2.64583333333333
        134.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.INT_ANT_PROG)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr18: TQRExpr
      Left = 460
      Top = 1
      Width = 45
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1217.08333333333
        2.64583333333333
        119.0625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.INT_IMP)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr19: TQRExpr
      Left = 506
      Top = 1
      Width = 60
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1338.79166666667
        2.64583333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.INT_VENC)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr20: TQRExpr
      Left = 566
      Top = 1
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1497.54166666667
        2.64583333333333
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.INT_PEN_AFEC_RES)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr21: TQRExpr
      Left = 620
      Top = 1
      Width = 39
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1640.41666666667
        2.64583333333333
        103.1875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.PAGO_CONCEPTOS)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr22: TQRExpr
      Left = 660
      Top = 1
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1746.25
        2.64583333333333
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.IMPMOR)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr23: TQRExpr
      Left = 703
      Top = 1
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1860.02083333333
        2.64583333333333
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.IVA_INT)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr24: TQRExpr
      Left = 746
      Top = 1
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1973.79166666667
        2.64583333333333
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.IVA_CO)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr25: TQRExpr
      Left = 789
      Top = 1
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2087.5625
        2.64583333333333
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.IVA_MOR)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr26: TQRExpr
      Left = 832
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
        2201.33333333333
        2.64583333333333
        87.3125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.BENBCO)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRLabel11: TQRLabel
      Left = 26
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
        68.7916666666667
        2.64583333333333
        187.854166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Crédito'
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
    object QRExpr98: TQRExpr
      Left = 906
      Top = 1
      Width = 54
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2397.125
        2.64583333333333
        142.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 
        'SUM(qyInfCobConta.CAP_ANT_PROG) + SUM(qyInfCobConta.CAP_IMP)+SUM' +
        '(qyInfCobConta.CAP_VEN_EXIG)+SUM(qyInfCobConta.CAP_VEN_NOEX)+SUM' +
        '(qyInfCobConta.INT_ANT_PROG)+SUM(qyInfCobConta.INT_IMP)+SUM(qyIn' +
        'fCobConta.INT_VENC)+SUM(qyInfCobConta.INT_PEN_AFEC_RES)+SUM(qyIn' +
        'fCobConta.PAGO_CONCEPTOS)+SUM(qyInfCobConta.IMPMOR)+SUM(qyInfCob' +
        'Conta.IVA_INT)+SUM(qyInfCobConta.IVA_CO)+SUM(qyInfCobConta.IVA_M' +
        'OR)+SUM(qyInfCobConta.BENBCO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRLabel47: TQRLabel
      Left = 885
      Top = 0
      Width = 21
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2341.5625
        0
        55.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL'
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
  object QRFooterProducto: TQRBand
    Left = 48
    Top = 241
    Width = 960
    Height = 9
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFooterProductoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      23.8125
      2540)
    BandType = rbGroupFooter
    object QRExpr13: TQRExpr
      Left = 358
      Top = 1
      Width = 48
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        947.208333333333
        2.64583333333333
        127)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.CAP_VEN_NOEX)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr14: TQRExpr
      Left = 200
      Top = 1
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        529.166666666667
        2.64583333333333
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.CAP_ANT_PROG)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr15: TQRExpr
      Left = 255
      Top = 1
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        674.6875
        2.64583333333333
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.CAP_IMP)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr27: TQRExpr
      Left = 309
      Top = 1
      Width = 48
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        817.5625
        2.64583333333333
        127)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.CAP_VEN_EXIG)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr28: TQRExpr
      Left = 407
      Top = 1
      Width = 51
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1076.85416666667
        2.64583333333333
        134.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.INT_ANT_PROG)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr29: TQRExpr
      Left = 460
      Top = 1
      Width = 45
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1217.08333333333
        2.64583333333333
        119.0625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.INT_IMP)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr30: TQRExpr
      Left = 506
      Top = 1
      Width = 60
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1338.79166666667
        2.64583333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.INT_VENC)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr31: TQRExpr
      Left = 566
      Top = 1
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1497.54166666667
        2.64583333333333
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.INT_PEN_AFEC_RES)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr32: TQRExpr
      Left = 620
      Top = 1
      Width = 39
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1640.41666666667
        2.64583333333333
        103.1875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.PAGO_CONCEPTOS)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr33: TQRExpr
      Left = 660
      Top = 1
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1746.25
        2.64583333333333
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.IMPMOR)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr34: TQRExpr
      Left = 703
      Top = 1
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1860.02083333333
        2.64583333333333
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.IVA_INT)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr35: TQRExpr
      Left = 746
      Top = 1
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1973.79166666667
        2.64583333333333
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.IVA_CO)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr36: TQRExpr
      Left = 789
      Top = 1
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2087.5625
        2.64583333333333
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.IVA_MOR)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr37: TQRExpr
      Left = 832
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
        2201.33333333333
        2.64583333333333
        87.3125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.BENBCO)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRLabel12: TQRLabel
      Left = 15
      Top = 1
      Width = 82
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        39.6875
        2.64583333333333
        216.958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Producto'
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
    object QRLabel51: TQRLabel
      Left = 885
      Top = 0
      Width = 21
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2341.5625
        0
        55.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL'
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
    object QRExpr100: TQRExpr
      Left = 906
      Top = 1
      Width = 54
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2397.125
        2.64583333333333
        142.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 
        'SUM(qyInfCobConta.CAP_ANT_PROG) + SUM(qyInfCobConta.CAP_IMP)+SUM' +
        '(qyInfCobConta.CAP_VEN_EXIG)+SUM(qyInfCobConta.CAP_VEN_NOEX)+SUM' +
        '(qyInfCobConta.INT_ANT_PROG)+SUM(qyInfCobConta.INT_IMP)+SUM(qyIn' +
        'fCobConta.INT_VENC)+SUM(qyInfCobConta.INT_PEN_AFEC_RES)+SUM(qyIn' +
        'fCobConta.PAGO_CONCEPTOS)+SUM(qyInfCobConta.IMPMOR)+SUM(qyInfCob' +
        'Conta.IVA_INT)+SUM(qyInfCobConta.IVA_CO)+SUM(qyInfCobConta.IVA_M' +
        'OR)+SUM(qyInfCobConta.BENBCO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object QRGroupMoneda: TQRGroup
    Left = 48
    Top = 168
    Width = 960
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
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
      29.1041666666667
      2540)
    Expression = 'qyInfCobConta.CVE_MONEDA'
    FooterBand = QRFooterMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRShape24: TQRShape
      Left = 0
      Top = 0
      Width = 625
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        0
        0
        1653.64583333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRDBText9: TQRDBText
      Left = 36
      Top = 1
      Width = 35
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        95.25
        2.64583333333333
        92.6041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'CVE_MONEDA'
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
    object QRLabel46: TQRLabel
      Left = 2
      Top = 1
      Width = 31
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
        82.0208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda'
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
    object QRDBText15: TQRDBText
      Left = 74
      Top = 1
      Width = 62
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        195.791666666667
        2.64583333333333
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'DESC_MONEDA'
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
  object QRGroupGpoProducto: TQRGroup
    Left = 48
    Top = 179
    Width = 960
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
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
      39.6875
      2540)
    Expression = 'qyInfCobConta.CVE_PRODUCTO_GPO'
    FooterBand = QRFooterGpoProducto
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel1: TQRLabel
      Left = 9
      Top = 3
      Width = 75
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        23.8125
        7.9375
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Grupo Producto'
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
    object QRDBText3: TQRDBText
      Left = 80
      Top = 3
      Width = 54
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        211.666666666667
        7.9375
        142.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'CVE_PRODUCTO_GPO'
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
    object QRDBText4: TQRDBText
      Left = 136
      Top = 3
      Width = 465
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        359.833333333333
        7.9375
        1230.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'DESC_L_PROD_GPO'
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
  end
  object QRGroupProducto: TQRGroup
    Left = 48
    Top = 194
    Width = 960
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
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
      34.3958333333333
      2540)
    Expression = 'qyInfCobConta.CVE_PRODUCTO_CRE'
    FooterBand = QRFooterProducto
    Master = Owner
    ReprintOnNewPage = False
    object QRShape4: TQRShape
      Left = 19
      Top = 0
      Width = 910
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        50.2708333333333
        0
        2407.70833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRDBText8: TQRDBText
      Left = 520
      Top = 1
      Width = 81
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1375.83333333333
        2.64583333333333
        214.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'CVE_TIPO_SECTOR'
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
    object QRDBText16: TQRDBText
      Left = 120
      Top = 1
      Width = 393
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        317.5
        2.64583333333333
        1039.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'DESC_L_PRODUCTO'
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object dbProducto: TQRDBText
      Left = 64
      Top = 1
      Width = 54
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        169.333333333333
        2.64583333333333
        142.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'CVE_PRODUCTO_CRE'
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
    object QRLabel2: TQRLabel
      Left = 25
      Top = 1
      Width = 36
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        66.1458333333333
        2.64583333333333
        95.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Producto'
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
    object QRDBText5: TQRDBText
      Left = 808
      Top = 1
      Width = 81
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2137.83333333333
        2.64583333333333
        214.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'CUENTA_VIGENTE_INT'
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
    object QRDBText17: TQRDBText
      Left = 672
      Top = 1
      Width = 81
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1778
        2.64583333333333
        214.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'CUENTA_VIGENTE_K'
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
  object SummaryBand1: TQRBand
    Left = 48
    Top = 284
    Width = 960
    Height = 5
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
      13.2291666666667
      2540)
    BandType = rbSummary
  end
  object QRGroupDisp: TQRGroup
    Left = 48
    Top = 207
    Width = 960
    Height = 16
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
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
      42.3333333333333
      2540)
    Expression = 'qyInfCobConta.ID_CREDITO'
    FooterBand = QRFooterCesion
    Master = Owner
    ReprintOnNewPage = False
    object dbMoneda: TQRDBText
      Left = 4
      Top = 1
      Width = 37
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        10.5833333333333
        2.64583333333333
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'ID_CREDITO'
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText14: TQRDBText
      Left = 48
      Top = 1
      Width = 179
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        127
        2.64583333333333
        473.604166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'NOMBRE'
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLProveedor: TQRLabel
      Left = 230
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        608.541666666667
        2.64583333333333
        158.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cta de Cheques'
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
    object QRDBText10: TQRDBText
      Left = 290
      Top = 1
      Width = 63
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        767.291666666667
        2.64583333333333
        166.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'CHEQUERA'
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel4: TQRLabel
      Left = 355
      Top = 1
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        939.270833333333
        2.64583333333333
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Catálogo Mínimo'
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
    object QRDBText6: TQRDBText
      Left = 421
      Top = 1
      Width = 44
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1113.89583333333
        2.64583333333333
        116.416666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'CVE_CAT_MINIMO'
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel5: TQRLabel
      Left = 631
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1669.52083333333
        2.64583333333333
        158.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo de Cambio'
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
    object QRDBText12: TQRDBText
      Left = 692
      Top = 1
      Width = 37
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1830.91666666667
        2.64583333333333
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'TIPO_CAMBIO'
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel7: TQRLabel
      Left = 732
      Top = 1
      Width = 30
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1936.75
        2.64583333333333
        79.375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Usuario'
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
    object QRDBText13: TQRDBText
      Left = 764
      Top = 1
      Width = 37
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2021.41666666667
        2.64583333333333
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'CVE_USU_ALTA'
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText11: TQRDBText
      Left = 463
      Top = 1
      Width = 162
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1225.02083333333
        2.64583333333333
        428.625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'DESC_CAT_MINIMO'
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText19: TQRDBText
      Left = 852
      Top = 1
      Width = 109
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2254.25
        2.64583333333333
        288.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'DESC_ENT_DES'
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText20: TQRDBText
      Left = 808
      Top = 1
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2137.83333333333
        2.64583333333333
        108.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'LEYENDA_ENT_DES'
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
  end
  object QRFooterGpoProducto: TQRBand
    Left = 48
    Top = 250
    Width = 960
    Height = 9
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFooterProductoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      23.8125
      2540)
    BandType = rbGroupFooter
    object QRExpr4: TQRExpr
      Left = 358
      Top = 1
      Width = 48
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        947.208333333333
        2.64583333333333
        127)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.CAP_VEN_NOEX)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr5: TQRExpr
      Left = 200
      Top = 1
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        529.166666666667
        2.64583333333333
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.CAP_ANT_PROG)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr6: TQRExpr
      Left = 255
      Top = 1
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        674.6875
        2.64583333333333
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.CAP_IMP)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr7: TQRExpr
      Left = 309
      Top = 1
      Width = 48
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        817.5625
        2.64583333333333
        127)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.CAP_VEN_EXIG)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr8: TQRExpr
      Left = 407
      Top = 1
      Width = 51
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1076.85416666667
        2.64583333333333
        134.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.INT_ANT_PROG)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr9: TQRExpr
      Left = 460
      Top = 1
      Width = 45
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1217.08333333333
        2.64583333333333
        119.0625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.INT_IMP)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr10: TQRExpr
      Left = 506
      Top = 1
      Width = 60
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1338.79166666667
        2.64583333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.INT_VENC)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr11: TQRExpr
      Left = 566
      Top = 1
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1497.54166666667
        2.64583333333333
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.INT_PEN_AFEC_RES)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr12: TQRExpr
      Left = 620
      Top = 1
      Width = 39
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1640.41666666667
        2.64583333333333
        103.1875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.PAGO_CONCEPTOS)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr38: TQRExpr
      Left = 660
      Top = 1
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1746.25
        2.64583333333333
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.IMPMOR)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr39: TQRExpr
      Left = 703
      Top = 1
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1860.02083333333
        2.64583333333333
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.IVA_INT)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr40: TQRExpr
      Left = 746
      Top = 1
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1973.79166666667
        2.64583333333333
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.IVA_CO)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr41: TQRExpr
      Left = 789
      Top = 1
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2087.5625
        2.64583333333333
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.IVA_MOR)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr42: TQRExpr
      Left = 832
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
        2201.33333333333
        2.64583333333333
        87.3125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfCobConta.BENBCO)'
      Mask = '###,###,###,##0.00'
      FontSize = 5
    end
    object QRLabel14: TQRLabel
      Left = 7
      Top = 1
      Width = 90
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        18.5208333333333
        2.64583333333333
        238.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Grupo Producto'
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
      Left = 885
      Top = 0
      Width = 21
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2341.5625
        0
        55.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL'
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
    object QRExpr43: TQRExpr
      Left = 906
      Top = 1
      Width = 54
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2397.125
        2.64583333333333
        142.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 
        'SUM(qyInfCobConta.CAP_ANT_PROG) + SUM(qyInfCobConta.CAP_IMP)+SUM' +
        '(qyInfCobConta.CAP_VEN_EXIG)+SUM(qyInfCobConta.CAP_VEN_NOEX)+SUM' +
        '(qyInfCobConta.INT_ANT_PROG)+SUM(qyInfCobConta.INT_IMP)+SUM(qyIn' +
        'fCobConta.INT_VENC)+SUM(qyInfCobConta.INT_PEN_AFEC_RES)+SUM(qyIn' +
        'fCobConta.PAGO_CONCEPTOS)+SUM(qyInfCobConta.IMPMOR)+SUM(qyInfCob' +
        'Conta.IVA_INT)+SUM(qyInfCobConta.IVA_CO)+SUM(qyInfCobConta.IVA_M' +
        'OR)+SUM(qyInfCobConta.BENBCO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object qyInfCobConta: TQuery
    AutoCalcFields = False
    OnCalcFields = qyInfCobContaCalcFields
    DatabaseName = 'BCORP'
    SQL.Strings = (
      ' SELECT ID_CREDITO         , NOMBRE              ,'
      '        ID_PERIODO         , ID_DOCUMENTO        , '
      '        SIT_TRANSACCION    , CONCEPTO            , '
      '        CVE_MONEDA         , DESC_MONEDA         , '
      '        CVE_PRODUCTO_CRE   , DESC_L_PRODUCTO     , '
      '        CVE_TIPO_SECTOR    , CHEQUERA            , '
      '        CVE_CAT_MINIMO     , DESC_CAT_MINIMO     , '
      '        TIPO_CAMBIO        , CVE_USU_ALTA        , '
      '        ID_TRANSACCION     , CVE_ACCESORIO       ,'
      
        '        SUBSTR(TO_CHAR(CVE_TIPO_MOVTO),1,2) AS CVE_TIPO_MOVTO   ' +
        ' , SUBSTR(TO_CHAR(CVE_OPERACION),1,6) AS CVE_OPERACION       , '
      
        '        SUM(DECODE(CVE_CONCEPTO,'#39'IMPBRU'#39',IMP_CONCEPTO,0)) IMPBRU' +
        ','
      
        '        SUM(DECODE(CVE_CONCEPTO,'#39'IMPIVA'#39',IMP_CONCEPTO,0)) IMPIVA' +
        ', '
      
        '        SUM(DECODE(CVE_CONCEPTO,'#39'IMPMOR'#39',IMP_CONCEPTO,0)) IMPMOR' +
        ', '
      
        '        SUM(DECODE(CVE_CONCEPTO,'#39'IVAMOR'#39',IMP_CONCEPTO,0)) IVAMOR' +
        ', '
      
        '        SUM(DECODE(CVE_CONCEPTO,'#39'IMPBRU'#39',IMP_CONCEPTO,0)) COIMP ' +
        ', '
      
        '        SUM(DECODE(CVE_CONCEPTO,'#39'IMPIVA'#39',IMP_CONCEPTO,0)) COIVA ' +
        ', '
      
        '        SUM(DECODE(CVE_CONCEPTO,'#39'BENBCO'#39',IMP_CONCEPTO,0)) BENBCO' +
        ', '
      
        '        SUM(DECODE(CVE_CONCEPTO,'#39'BENGOB'#39',IMP_CONCEPTO,0)) BENGOB' +
        ', '
      '        F_OPERACION FH_ALTA, FH_CANCELA           , '
      '        DESC_COMISION      , ID_CESION            , '
      '        SALDO              , F_OPERACION          , '
      '        F_TRASPASO_VENC    , CVE_PRODUCTO_GPO     ,'
      '        DESC_L_PROD_GPO    , 0 CUENTA_VIGENTE_INT   , '
      '        0 CUENTA_VIGENTE_K   '
      ' FROM '
      '   ( SELECT '
      '           CC.ID_CREDITO           ,       M.CVE_MONEDA    ,'
      
        '           M.DESC_MONEDA           ,       PT.CVE_TIPO_SECTOR   ' +
        '   ,'
      
        '           CP.CVE_PRODUCTO_CRE     ,       CP.DESC_L_PRODUCTO   ' +
        '   ,'
      
        '           CTO.ID_TITULAR          ,       PT.NOMBRE            ' +
        '   ,'
      
        '           CC.ID_PROM_ADM          ,       TRA.F_OPERACION      ' +
        '   ,'
      
        '           TRA.ID_PERIODO          ,       SUBSTR(TRA.ID_CTO_LIQ' +
        ',1,20) CHEQUERA    ,'
      
        '           TRA.TIPO_CAMBIO         ,       TRA.ID_TRANSACCION   ' +
        '   ,'
      
        '           TRA.CVE_USU_ALTA        ,       TRA.FH_CANCELA       ' +
        '   ,'
      
        '           TRA.SIT_TRANSACCION     ,       TRA.CVE_ACCESORIO    ' +
        '   ,'
      
        '           TRA.CVE_TIPO_MOVTO      ,       TRA.CVE_OPERACION    ' +
        '   ,'
      '           TRA.CVE_OPERACION_ORI,     '
      
        '           DECODE(TRA.CVE_TIPO_MOVTO,'#39'AN'#39',TRA.DESC_C_OPERACION||' +
        #39' '#39'||TRA.CVE_COMISION||'#39' Anticipado'#39','
      
        '                                     '#39'AV'#39',TRA.DESC_C_OPERACION||' +
        #39' '#39'||TRA.CVE_COMISION||'#39' Anticipado'#39','
      
        '                                     '#39'MD'#39',TRA.DESC_C_OPERACION||' +
        #39' '#39'||TRA.CVE_COMISION||'#39' Programado'#39','
      
        '                                     '#39'MV'#39',TRA.DESC_C_OPERACION||' +
        #39' '#39'||TRA.CVE_COMISION||'#39' Programado'#39','
      
        '                                     '#39'CO'#39',TRA.DESC_C_OPERACION||' +
        #39' '#39'||TRA.CVE_COMISION||'#39' En Cuentas de Orden'#39','
      
        '                                     DECODE(CC.F_TRASPASO_VENC,N' +
        'ULL,TRA.DESC_C_OPERACION||'#39' '#39'||TRA.CVE_COMISION||'#39' Impagado'#39'  ,'
      
        '                                                                ' +
        '    TRA.DESC_C_OPERACION||'#39' '#39'||TRA.CVE_COMISION||'#39' Vencido '#39')) C' +
        'ONCEPTO,'
      
        '           TRA.CVE_CONCEPTO        ,       TRA.IMP_CONCEPTO     ' +
        '   ,'
      
        '           TRA.CVE_COMISION        ,       COM.DESC_COMISION    ' +
        '   ,'
      
        '           TRA.ID_CONTRATO         ,       PKGDPVISTASERV.SPTObt' +
        'Saldo(TRA.ID_CTO_LIQ,'#39'D000'#39') SALDO,'
      
        '           TRA.ID_DOCUMENTO        ,       TRA.ID_TRANS_CANCELA ' +
        '   ,'
      
        '           TRA.ID_CESION           ,       CC.F_TRASPASO_VENC   ' +
        '   ,'
      
        '           CM.CVE_CAT_MINIMO       ,       CM.DESC_CAT_MINIMO   ' +
        '   ,'
      
        '           TRA.SIT_AFECTACION      ,       CP.ID_EMPRESA        ' +
        '   ,'
      
        '           CP.CVE_PRODUCTO_GPO     ,       CPG.DESC_L_PROD_GPO  ' +
        '   '
      '     FROM (SELECT * FROM CR_CREDITO) CC      ,'
      '          (SELECT * FROM CR_CESION) CS       ,'
      '          ( --ACTIVOS '
      
        '            SELECT '#39'AC'#39' SIT_AFECTACION     ,       CT.ID_CREDITO' +
        ','
      
        '                   CT.F_OPERACION            ,       CT.ID_PERIO' +
        'DO,'
      
        '                   CT.ID_CTO_LIQ             ,       CT.TIPO_CAM' +
        'BIO,'
      
        '                   CT.ID_TRANSACCION         ,       CT.CVE_USU_' +
        'ALTA,'
      
        '                   CT.FH_CANCELA             ,       CT.SIT_TRAN' +
        'SACCION,'
      '                   CT.CVE_OPERACION,'
      #9#9'        (CASE'
      #9#9'             WHEN CO.CVE_ACCESORIO = '#39'IN'#39' '
      
        #9#9'                  THEN PKGCRCONTA.STPOBTCVE_TIPO_MOV(CT.ID_CRE' +
        'DITO, CT.CVE_OPERACION, CT.ID_PERIODO, '
      
        #9#9#9'     '#9'                                     CDT.CVE_CONCEPTO, ' +
        'CT.CVE_TIPO_MOVTO, CT.F_OPERACION) '
      #9#9#9#9'  ELSE CT.CVE_TIPO_MOVTO  '
      #9#9#9'     END  '
      #9#9#9' ) CVE_TIPO_MOVTO,  '
      
        '                   CT.CVE_COMISION           ,       CT.ID_CONTR' +
        'ATO,'
      
        '                   CT.ID_DOCUMENTO           ,       CT.ID_TRANS' +
        '_CANCELA,'
      '                   CT.ID_CESION              ,'
      
        '                   CDT.CVE_CONCEPTO          ,       CDT.IMP_CON' +
        'CEPTO  ,'
      
        '                   CO.CVE_ACCESORIO          ,       CO.DESC_C_O' +
        'PERACION      '
      '                  ,CO.CVE_OPERACION CVE_OPERACION_ORI'
      
        '            FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_OPERA' +
        'CION CO'
      
        '            WHERE   CT.F_OPERACION BETWEEN TO_DATE('#39'01/03/2013'#39',' +
        #39'DD/MM/YYYY'#39')                AND     TO_DATE('#39'01/03/2013'#39','#39'DD/MM' +
        '/YYYY'#39')'
      '              AND ( CT.SIT_TRANSACCION = '#39'AC'#39')'
      '              AND CO.CVE_AFEC_SALDO    = '#39'I'#39
      '              AND CO.CVE_ACCESORIO NOT IN ('#39'CR'#39')'
      '              AND   CDT.ID_TRANSACCION = CT.ID_TRANSACCION'
      '              AND   CO.CVE_OPERACION = CT.CVE_OPERACION'
      '           UNION'
      '            --CANCELADOS'
      
        '            SELECT '#39'CA'#39' SIT_AFECTACION     ,       CT.ID_CREDITO' +
        ','
      
        '                   CT.F_OPERACION            ,       CT.ID_PERIO' +
        'DO,'
      
        '                   CT.ID_CTO_LIQ             ,       CT.TIPO_CAM' +
        'BIO,'
      
        '                   CT.ID_TRANSACCION         ,       CT.CVE_USU_' +
        'ALTA,'
      
        '                   NVL(TRUNC(CT.FH_CANCELA),F_OPERACION) FH_CANC' +
        'ELA,'
      '                   CT.SIT_TRANSACCION,'
      #9#9'        (CASE'
      #9#9'             WHEN CO.CVE_ACCESORIO = '#39'IN'#39' '
      
        #9#9'                  THEN PKGCRCONTA.STPOBTCVE_TIPO_MOV(CT.ID_CRE' +
        'DITO, CT.CVE_OPERACION, CT.ID_PERIODO, '
      
        #9#9#9'     '#9'                                     CDT.CVE_CONCEPTO, ' +
        'CT.CVE_TIPO_MOVTO, CT.F_OPERACION) '
      #9#9#9#9'  ELSE CT.CVE_TIPO_MOVTO  '
      #9#9#9'     END  '
      #9#9#9' ) CVE_TIPO_MOVTO,  '
      
        '                   CT.CVE_OPERACION          ,       CT.CVE_COMI' +
        'SION,'
      
        '                   CT.ID_CONTRATO            ,       CT.ID_DOCUM' +
        'ENTO,'
      
        '                   CT.ID_TRANS_CANCELA       ,       CT.ID_CESIO' +
        'N,'
      
        '                   CDT.CVE_CONCEPTO          ,       CDT.IMP_CON' +
        'CEPTO,'
      
        '                   CO.CVE_ACCESORIO          ,       CO.DESC_C_O' +
        'PERACION'
      '                  ,CO.CVE_OPERACION CVE_OPERACION_ORI     '
      
        '            FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_OPERA' +
        'CION CO'
      
        '            WHERE   CT.F_OPERACION BETWEEN TO_DATE('#39'01/03/2013'#39',' +
        #39'DD/MM/YYYY'#39')                AND     TO_DATE('#39'01/03/2013'#39','#39'DD/MM' +
        '/YYYY'#39')'
      '              AND CT.SIT_TRANSACCION = '#39'CA'#39
      '              AND CO.CVE_AFEC_SALDO    = '#39'I'#39
      '              AND CO.CVE_ACCESORIO NOT IN ('#39'CR'#39')'
      '              AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION'
      '              AND CO.CVE_OPERACION = CT.CVE_OPERACION'
      '          UNION'
      
        '            SELECT '#39'CA'#39' SIT_AFECTACION     ,       CT.ID_CREDITO' +
        ','
      
        '                   CT.F_OPERACION            ,       CT.ID_PERIO' +
        'DO,'
      
        '                   CT.ID_CTO_LIQ             ,       CT.TIPO_CAM' +
        'BIO,'
      
        '                   CT.ID_TRANSACCION         ,       CT.CVE_USU_' +
        'ALTA,'
      
        '                   NVL(TRUNC(CT.FH_CANCELA),CTC.F_OPERACION) FH_' +
        'CANCELA,'
      '                   CT.SIT_TRANSACCION,'
      #9#9'        (CASE'
      #9#9'             WHEN CO.CVE_ACCESORIO = '#39'IN'#39' '
      
        #9#9'                  THEN PKGCRCONTA.STPOBTCVE_TIPO_MOV(CT.ID_CRE' +
        'DITO, CT.CVE_OPERACION, CT.ID_PERIODO, '
      
        #9#9#9'     '#9'                                     CDT.CVE_CONCEPTO, ' +
        'CT.CVE_TIPO_MOVTO, CT.F_OPERACION) '
      #9#9#9#9'  ELSE CT.CVE_TIPO_MOVTO  '
      #9#9#9'     END  '
      #9#9#9' ) CVE_TIPO_MOVTO,  '
      
        '                   CT.CVE_OPERACION          ,       CT.CVE_COMI' +
        'SION,'
      
        '                   CT.ID_CONTRATO            ,       CT.ID_DOCUM' +
        'ENTO,'
      
        '                   CT.ID_TRANS_CANCELA       ,       CT.ID_CESIO' +
        'N,'
      
        '                   CDT.CVE_CONCEPTO          ,       CDT.IMP_CON' +
        'CEPTO,'
      
        '                   CO.CVE_ACCESORIO          ,       CO.DESC_C_O' +
        'PERACION'
      '                  ,CO.CVE_OPERACION CVE_OPERACION_ORI     '
      
        '            FROM CR_TRANSACCION CT, CR_TRANSACCION CTC, CR_DET_T' +
        'RANSAC CDT, CR_OPERACION CO'
      
        '            WHERE   CT.F_OPERACION BETWEEN TO_DATE('#39'01/03/2013'#39',' +
        #39'DD/MM/YYYY'#39')                AND     TO_DATE('#39'01/03/2013'#39','#39'DD/MM' +
        '/YYYY'#39')'
      '              AND CT.SIT_TRANSACCION = '#39'AC'#39
      '              AND CO.CVE_AFEC_SALDO    = '#39'I'#39
      '              AND CO.CVE_ACCESORIO NOT IN ('#39'CR'#39')'
      '              AND CO.CVE_OPERACION= CTC.CVE_OPERACION '
      '              AND CTC.ID_TRANSACCION = CT.ID_TRANS_CANCELA'
      '              AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION'
      '              AND CO.CVE_OPER_CANCELA  = CT.CVE_OPERACION'
      '          ) TRA,'
      '          ( SELECT CCTO.*, CPRO.ID_EMPRESA'
      '            FROM   CR_PRODUCTO CPRO, CR_CONTRATO CCTO'
      '            WHERE  CPRO.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE'
      '          ) CRCTO,              CR_PRODUCTO        CP  ,'
      '          CR_PRODUCTO_GPO CPG , CONTRATO           CTO ,'
      '          MONEDA          M   , PERSONA            PT  ,'
      '          PERSONA         PP  , CR_CAT_COMISION    COM ,'
      '          CR_CAT_MINIMO   CM'
      '     WHERE CS.ID_CESION(+)                = CC.ID_CREDITO'
      '       AND TRA.ID_CREDITO                 = CC.ID_CREDITO'
      '       AND CRCTO.ID_CONTRATO              = CC.ID_CONTRATO'
      '       AND CRCTO.FOL_CONTRATO             = CC.FOL_CONTRATO'
      
        '       AND CP.CVE_PRODUCTO_CRE            = CRCTO.CVE_PRODUCTO_c' +
        'RE'
      
        '       AND CPG.CVE_PRODUCTO_GPO           = CP.CVE_PRODUCTO_GPO ' +
        '  '
      '       AND CTO.ID_CONTRATO                = CRCTO.ID_CONTRATO'
      '       AND M.CVE_MONEDA                   = CTO.CVE_MONEDA'
      '       AND PT.ID_PERSONA                  = CTO.ID_TITULAR'
      '       AND PP.ID_PERSONA                  = CC.ID_PROM_ADM'
      '       AND COM.CVE_COMISION(+)            = TRA.CVE_COMISION'
      '       AND CM.CVE_CAT_MINIMO              = CP.CVE_CLAS_CONTAB'
      '           )  TEMP1,'
      
        '      (SELECT CVE_PRODUCTO CVE_PRODUCTO_CCO,CVE_MONEDA CVE_MONED' +
        'A_CCO,CVE_OPERACION CVE_OPERACION_CCO'
      '       FROM CR_CVE_OPERACION'
      '       WHERE CVE_PARAMETRO  NOT '
      'IN ('#39'RCGFCP'#39','#39'RCGFIN'#39','#39'RCGFCN'#39','#39'RCGFFN'#39'))   CCO WHERE 1=1'
      '   AND   CCO.CVE_PRODUCTO_CCO  = TEMP1.CVE_PRODUCTO_CRE'
      '   AND   CCO.CVE_MONEDA_CCO    = TEMP1.CVE_MONEDA'
      
        '   AND   CCO.CVE_OPERACION_CCO = TEMP1.CVE_OPERACION_ORI AND SIT' +
        '_AFECTACION  =  '#39'AC'#39' AND  ID_EMPRESA =2'
      
        ' GROUP BY ID_PERIODO      ,   TIPO_CAMBIO     ,   ID_TRANSACCION' +
        '  ,   CVE_USU_ALTA     ,'
      ' FH_CANCELA      ,   SIT_TRANSACCION ,   CVE_ACCESORIO    ,'
      
        ' CVE_TIPO_MOVTO  ,   CVE_OPERACION   ,   CONCEPTO        ,   CVE' +
        '_MONEDA       ,'
      
        ' DESC_MONEDA     ,   CVE_PRODUCTO_CRE,   DESC_L_PRODUCTO ,   ID_' +
        'CREDITO       ,'
      
        ' ID_CONTRATO     ,   NOMBRE          ,   CHEQUERA        ,   SAL' +
        'DO            ,'
      
        ' DESC_COMISION   ,   ID_DOCUMENTO    ,   ID_CESION       ,   ID_' +
        'TITULAR       ,'
      
        ' F_OPERACION     ,   CVE_TIPO_SECTOR ,   CVE_CAT_MINIMO  ,   DES' +
        'C_CAT_MINIMO  ,'
      ' F_TRASPASO_VENC ,   CVE_PRODUCTO_GPO,   DESC_L_PROD_GPO'
      ' ORDER BY CVE_MONEDA,DESC_L_PRODUCTO, NOMBRE, ID_CREDITO'
      ''
      ' '
      ' ')
    Left = 214
    Top = 37
    object qyInfCobContaPER_DOC: TStringField
      FieldKind = fkCalculated
      FieldName = 'PER_DOC'
      Calculated = True
    end
    object qyInfCobContaCAP_ANT_PROG: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CAP_ANT_PROG'
      Calculated = True
    end
    object qyInfCobContaCAP_VEN_NOEX: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CAP_VEN_NOEX'
      Calculated = True
    end
    object qyInfCobContaCAP_IMP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CAP_IMP'
      Calculated = True
    end
    object qyInfCobContaCAP_VEN_EXIG: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CAP_VEN_EXIG'
      Calculated = True
    end
    object qyInfCobContaIVA_MOR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IVA_MOR'
      Calculated = True
    end
    object qyInfCobContaINT_ANT_PROG: TFloatField
      FieldKind = fkCalculated
      FieldName = 'INT_ANT_PROG'
      Calculated = True
    end
    object qyInfCobContaINT_PEN_AFEC_RES: TFloatField
      FieldKind = fkCalculated
      FieldName = 'INT_PEN_AFEC_RES'
      Calculated = True
    end
    object qyInfCobContaINT_IMP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'INT_IMP'
      Calculated = True
    end
    object qyInfCobContaINT_VENC: TFloatField
      FieldKind = fkCalculated
      FieldName = 'INT_VENC'
      Calculated = True
    end
    object qyInfCobContaIVA_INT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IVA_INT'
      Calculated = True
    end
    object qyInfCobContaPAGO_CONCEPTOS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PAGO_CONCEPTOS'
      Calculated = True
    end
    object qyInfCobContaIVA_CO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IVA_CO'
      Calculated = True
    end
    object qyInfCobContaID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyInfCobContaNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qyInfCobContaID_PERIODO: TFloatField
      FieldName = 'ID_PERIODO'
    end
    object qyInfCobContaID_DOCUMENTO: TStringField
      FieldName = 'ID_DOCUMENTO'
    end
    object qyInfCobContaSIT_TRANSACCION: TStringField
      FieldName = 'SIT_TRANSACCION'
      Size = 2
    end
    object qyInfCobContaCONCEPTO: TStringField
      FieldName = 'CONCEPTO'
      Size = 68
    end
    object qyInfCobContaCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyInfCobContaDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyInfCobContaCVE_PRODUCTO_CRE: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 6
    end
    object qyInfCobContaDESC_L_PRODUCTO: TStringField
      FieldName = 'DESC_L_PRODUCTO'
      Size = 80
    end
    object qyInfCobContaCVE_TIPO_SECTOR: TStringField
      FieldName = 'CVE_TIPO_SECTOR'
      Size = 2
    end
    object qyInfCobContaCHEQUERA: TStringField
      FieldName = 'CHEQUERA'
    end
    object qyInfCobContaCVE_CAT_MINIMO: TStringField
      FieldName = 'CVE_CAT_MINIMO'
    end
    object qyInfCobContaDESC_CAT_MINIMO: TStringField
      FieldName = 'DESC_CAT_MINIMO'
      Size = 250
    end
    object qyInfCobContaTIPO_CAMBIO: TFloatField
      FieldName = 'TIPO_CAMBIO'
    end
    object qyInfCobContaCVE_USU_ALTA: TStringField
      FieldName = 'CVE_USU_ALTA'
      Size = 8
    end
    object qyInfCobContaID_TRANSACCION: TFloatField
      FieldName = 'ID_TRANSACCION'
    end
    object qyInfCobContaCVE_ACCESORIO: TStringField
      FieldName = 'CVE_ACCESORIO'
      Size = 2
    end
    object qyInfCobContaIMPBRU: TFloatField
      FieldName = 'IMPBRU'
    end
    object qyInfCobContaIMPIVA: TFloatField
      FieldName = 'IMPIVA'
    end
    object qyInfCobContaIMPMOR: TFloatField
      FieldName = 'IMPMOR'
    end
    object qyInfCobContaIVAMOR: TFloatField
      FieldName = 'IVAMOR'
    end
    object qyInfCobContaCOIMP: TFloatField
      FieldName = 'COIMP'
    end
    object qyInfCobContaCOIVA: TFloatField
      FieldName = 'COIVA'
    end
    object qyInfCobContaBENBCO: TFloatField
      FieldName = 'BENBCO'
    end
    object qyInfCobContaBENGOB: TFloatField
      FieldName = 'BENGOB'
    end
    object qyInfCobContaFH_ALTA: TDateTimeField
      FieldName = 'FH_ALTA'
    end
    object qyInfCobContaFH_CANCELA: TDateTimeField
      FieldName = 'FH_CANCELA'
    end
    object qyInfCobContaF_VALOR: TDateTimeField
      FieldName = 'F_VALOR'
    end
    object qyInfCobContaDESC_COMISION: TStringField
      FieldName = 'DESC_COMISION'
      Size = 80
    end
    object qyInfCobContaID_CESION: TFloatField
      FieldName = 'ID_CESION'
    end
    object qyInfCobContaSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object qyInfCobContaF_OPERACION: TDateTimeField
      FieldName = 'F_OPERACION'
    end
    object qyInfCobContaF_TRASPASO_VENC: TDateTimeField
      FieldName = 'F_TRASPASO_VENC'
    end
    object qyInfCobContaCVE_PRODUCTO_GPO: TStringField
      FieldName = 'CVE_PRODUCTO_GPO'
      Size = 6
    end
    object qyInfCobContaDESC_L_PROD_GPO: TStringField
      FieldName = 'DESC_L_PROD_GPO'
      Size = 80
    end
    object qyInfCobContaCUENTA_VIGENTE_INT: TStringField
      FieldName = 'CUENTA_VIGENTE_INT'
      Size = 30
    end
    object qyInfCobContaCUENTA_VIGENTE_K: TStringField
      FieldName = 'CUENTA_VIGENTE_K'
      Size = 30
    end
    object qyInfCobContaTOT_IVA_INT_PROG: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_IVA_INT_PROG'
      Calculated = True
    end
    object qyInfCobContaTOT_IVA_INT_IMP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_IVA_INT_IMP'
      Calculated = True
    end
    object qyInfCobContaTOT_IVA_INT_ANT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_IVA_INT_ANT'
      Calculated = True
    end
    object qyInfCobContaTOT_IVA_CO_ANT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_IVA_CO_ANT'
      Calculated = True
    end
    object qyInfCobContaTOT_IVA_CO_PROG: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_IVA_CO_PROG'
      Calculated = True
    end
    object qyInfCobContaTOT_IVA_CO_IMP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOT_IVA_CO_IMP'
      Calculated = True
    end
    object qyInfCobContaCLAVE_CON: TStringField
      FieldKind = fkCalculated
      FieldName = 'CLAVE_CON'
      FixedChar = True
      Size = 1
      Calculated = True
    end
    object qyInfCobContaCVE_ENT_DES: TStringField
      FieldName = 'CVE_ENT_DES'
    end
    object qyInfCobContaDESC_ENT_DES: TStringField
      FieldName = 'DESC_ENT_DES'
    end
    object qyInfCobContaLEYENDA_ENT_DES: TStringField
      FieldName = 'LEYENDA_ENT_DES'
    end
    object qyInfCobContaCVE_TIPO_MOVTO: TStringField
      FieldName = 'CVE_TIPO_MOVTO'
      Size = 2
    end
    object qyInfCobContaCVE_OPERACION: TStringField
      FieldName = 'CVE_OPERACION'
      Size = 6
    end
  end
  object InterDigDoc1: TInterDigDoc
    Support = 'star@mail.internet.com.mx'
    HostName = 'localhost'
    UserName = 'guest'
    Password = 'anonymous@mail.com.net'
    Viewfile = False
    SendTo = '/'
    DelAfterSend = False
    PgOrientation = ort_portrait
    CompFileExt = zip
    Left = 40
    Top = 24
  end
end
