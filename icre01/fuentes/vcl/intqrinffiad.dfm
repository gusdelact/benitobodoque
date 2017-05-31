object QrInfFiAd: TQrInfFiAd
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qyInfFinAdic
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
    Height = 33
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
      87.3125
      2540)
    BandType = rbColumnHeader
    object QRShape10: TQRShape
      Left = 248
      Top = -1
      Width = 46
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        656.166666666667
        -2.64583333333333
        121.708333333333)
      Shape = qrsRectangle
    end
    object QRShape9: TQRShape
      Left = 202
      Top = -1
      Width = 47
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        534.458333333333
        -2.64583333333333
        124.354166666667)
      Shape = qrsRectangle
    end
    object QRShape12: TQRShape
      Left = 326
      Top = 10
      Width = 37
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        862.541666666667
        26.4583333333333
        97.8958333333333)
      Shape = qrsRectangle
    end
    object QRShape1: TQRShape
      Left = 1
      Top = -1
      Width = 56
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        2.64583333333333
        -2.64583333333333
        148.166666666667)
      Shape = qrsRectangle
    end
    object QRShape2: TQRShape
      Left = 56
      Top = -1
      Width = 49
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        148.166666666667
        -2.64583333333333
        129.645833333333)
      Shape = qrsRectangle
    end
    object QRShape4: TQRShape
      Left = 104
      Top = -1
      Width = 50
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        275.166666666667
        -2.64583333333333
        132.291666666667)
      Shape = qrsRectangle
    end
    object QRLabel17: TQRLabel
      Left = 108
      Top = 0
      Width = 43
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        82.0208333333333
        285.75
        0
        113.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Inicio'
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
    object QRShape5: TQRShape
      Left = 153
      Top = -1
      Width = 50
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        404.8125
        -2.64583333333333
        132.291666666667)
      Shape = qrsRectangle
    end
    object QRLabel18: TQRLabel
      Left = 154
      Top = 0
      Width = 47
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        82.0208333333333
        407.458333333333
        0
        124.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Vencimiento'
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
    object QRShape6: TQRShape
      Left = 293
      Top = 10
      Width = 34
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        775.229166666667
        26.4583333333333
        89.9583333333333)
      Shape = qrsRectangle
    end
    object QRLabel20: TQRLabel
      Left = 294
      Top = 12
      Width = 30
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        777.875
        31.75
        79.375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'No. Periodo'
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
    object QRShape7: TQRShape
      Left = 362
      Top = 11
      Width = 55
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        957.791666666667
        29.1041666666667
        145.520833333333)
      Shape = qrsRectangle
    end
    object QRLabel22: TQRLabel
      Left = 364
      Top = 12
      Width = 51
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        963.083333333333
        31.75
        134.9375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Inicio'
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
    object QRShape8: TQRShape
      Left = 416
      Top = 11
      Width = 55
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1100.66666666667
        29.1041666666667
        145.520833333333)
      Shape = qrsRectangle
    end
    object QRLabel24: TQRLabel
      Left = 419
      Top = 12
      Width = 49
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        1108.60416666667
        31.75
        129.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Vencimiento'
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
    object QRShape14: TQRShape
      Left = 618
      Top = -1
      Width = 75
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1635.125
        -2.64583333333333
        198.4375)
      Shape = qrsRectangle
    end
    object QRShape15: TQRShape
      Left = 544
      Top = -1
      Width = 75
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1439.33333333333
        -2.64583333333333
        198.4375)
      Shape = qrsRectangle
    end
    object QRShape19: TQRShape
      Left = 788
      Top = -1
      Width = 55
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        2084.91666666667
        -2.64583333333333
        145.520833333333)
      Shape = qrsRectangle
    end
    object QRShape20: TQRShape
      Left = 740
      Top = -1
      Width = 49
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1957.91666666667
        -2.64583333333333
        129.645833333333)
      Shape = qrsRectangle
    end
    object QRShape21: TQRShape
      Left = 692
      Top = -1
      Width = 49
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1830.91666666667
        -2.64583333333333
        129.645833333333)
      Shape = qrsRectangle
    end
    object QRLabel36: TQRLabel
      Left = 546
      Top = 1
      Width = 70
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        1444.625
        2.64583333333333
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Financiamiento Adicional'
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
    object QRLabel37: TQRLabel
      Left = 620
      Top = 1
      Width = 70
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        1640.41666666667
        2.64583333333333
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Saldo Nuevo'
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
    object QRLabel38: TQRLabel
      Left = 695
      Top = 1
      Width = 43
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        1838.85416666667
        2.64583333333333
        113.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'No. Trans.'
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
    object QRLabel39: TQRLabel
      Left = 744
      Top = 1
      Width = 40
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        1968.5
        2.64583333333333
        105.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
    object QRLabel40: TQRLabel
      Left = 793
      Top = 1
      Width = 45
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        2098.14583333333
        2.64583333333333
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Operación'
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
    object QRShape22: TQRShape
      Left = 293
      Top = -1
      Width = 179
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        775.229166666667
        -2.64583333333333
        473.604166666667)
      Shape = qrsRectangle
    end
    object QRLabel43: TQRLabel
      Left = 296
      Top = 0
      Width = 167
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        783.166666666667
        0
        441.854166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Periódo de Interés'
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
    object QRLabel4: TQRLabel
      Left = 58
      Top = 0
      Width = 45
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        82.0208333333333
        153.458333333333
        0
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Disposición'
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
    object QRLabel7: TQRLabel
      Left = 4
      Top = 0
      Width = 50
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        82.0208333333333
        10.5833333333333
        0
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Autorización'
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
    object QRShape3: TQRShape
      Left = 470
      Top = -1
      Width = 75
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1243.54166666667
        -2.64583333333333
        198.4375)
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 472
      Top = 1
      Width = 70
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        1248.83333333333
        2.64583333333333
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Saldo Anterior'
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
    object QRLabel5: TQRLabel
      Left = 204
      Top = 0
      Width = 42
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        82.0208333333333
        539.75
        0
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Id. Crédito Externo'
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
    object QRShape11: TQRShape
      Left = 842
      Top = -1
      Width = 55
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        2227.79166666667
        -2.64583333333333
        145.520833333333)
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 849
      Top = 0
      Width = 45
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        2246.3125
        0
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Valor'
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
    object QRShape13: TQRShape
      Left = 896
      Top = -1
      Width = 64
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        2370.66666666667
        -2.64583333333333
        169.333333333333)
      Shape = qrsRectangle
    end
    object QRLabel10: TQRLabel
      Left = 905
      Top = 0
      Width = 45
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        2394.47916666667
        0
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Situación'
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
    object QRLabel9: TQRLabel
      Left = 330
      Top = 12
      Width = 29
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        873.125
        31.75
        76.7291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tipo FinAdic'
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
    object QRLabel8: TQRLabel
      Left = 250
      Top = 0
      Width = 43
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        82.0208333333333
        661.458333333333
        0
        113.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Id. Control Externo'
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
  object QRBand1: TQRBand
    Left = 48
    Top = 211
    Width = 960
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand1BeforePrint
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
    BandType = rbDetail
    object QRDBText3: TQRDBText
      Left = 57
      Top = 0
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        150.8125
        0
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'ID_CREDITO'
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
    object QRDBText4: TQRDBText
      Left = 105
      Top = 0
      Width = 44
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        277.8125
        0
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'F_INICIO'
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
    object QRDBText7: TQRDBText
      Left = 791
      Top = 0
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2092.85416666667
        0
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'FH_ALTA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = 'dd/mm/yyyy'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
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
    object QRDBText6: TQRDBText
      Left = 744
      Top = 0
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1968.5
        0
        111.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'CVE_USU_ALTA'
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
    object QRDBText17: TQRDBText
      Left = 367
      Top = 0
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        971.020833333333
        0
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'F_INI_INT'
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
    object QRDBText18: TQRDBText
      Left = 296
      Top = 0
      Width = 28
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        783.166666666667
        0
        74.0833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'ID_PERIODO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#####0'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText19: TQRDBText
      Left = 156
      Top = 0
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        412.75
        0
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'F_VTO_CRED'
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
    object QRDBText24: TQRDBText
      Left = 551
      Top = 0
      Width = 73
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1457.85416666667
        0
        193.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'IMP_FINAN_ADIC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText25: TQRDBText
      Left = 476
      Top = 0
      Width = 73
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1259.41666666667
        0
        193.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'SALDO_ANTERIOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText27: TQRDBText
      Left = 627
      Top = 0
      Width = 71
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1658.9375
        0
        187.854166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'SALDO_NUEVO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText28: TQRDBText
      Left = 701
      Top = 0
      Width = 38
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1854.72916666667
        0
        100.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'ID_TRANSACCION'
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
    object QRDBText22: TQRDBText
      Left = 418
      Top = 0
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1105.95833333333
        0
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'F_VTO_INT'
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
    object QRDBText1: TQRDBText
      Left = 4
      Top = 0
      Width = 39
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        10.5833333333333
        0
        103.1875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'ID_CONTRATO'
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
    object QRDBText2: TQRDBText
      Left = 250
      Top = 0
      Width = 43
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        661.458333333333
        0
        113.770833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'ID_CONTROL_EXTERNO'
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
    object QRDBText5: TQRDBText
      Left = 204
      Top = 0
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        539.75
        0
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'ID_CRED_EXTERNO'
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
    object QRDBText8: TQRDBText
      Left = 845
      Top = 1
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2235.72916666667
        2.64583333333333
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'FH_CANCELA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = 'dd/mm/yyyy'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText12: TQRDBText
      Left = 898
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
        2375.95833333333
        2.64583333333333
        166.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'SITUACION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = 'dd/mm/yyyy'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText13: TQRDBText
      Left = 326
      Top = 0
      Width = 37
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        862.541666666667
        0
        97.8958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'CVE_FINAN_ADIC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#####0'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
  end
  object QRFooterMoneda: TQRBand
    Left = 48
    Top = 252
    Width = 960
    Height = 29
    Frame.Color = clBlack
    Frame.DrawTop = True
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
      76.7291666666667
      2540)
    BandType = rbGroupFooter
    object QRExpr62: TQRExpr
      Left = 475
      Top = 10
      Width = 73
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1256.77083333333
        26.4583333333333
        193.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfFinAdic.SALDO_ANTERIOR)'
      Mask = '###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr63: TQRExpr
      Left = 551
      Top = 10
      Width = 73
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1457.85416666667
        26.4583333333333
        193.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfFinAdic.IMP_FINAN_ADIC)'
      Mask = '###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr64: TQRExpr
      Left = 625
      Top = 10
      Width = 73
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1653.64583333333
        26.4583333333333
        193.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfFinAdic.SALDO_NUEVO)'
      Mask = '###,###,###,##0.00'
      FontSize = 7
    end
    object QRLabel19: TQRLabel
      Left = 9
      Top = 10
      Width = 114
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        23.8125
        26.4583333333333
        301.625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Moneda'
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
  end
  object QRFooterProducto: TQRBand
    Left = 48
    Top = 237
    Width = 960
    Height = 15
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
      39.6875
      2540)
    BandType = rbGroupFooter
    object QRExpr34: TQRExpr
      Left = 475
      Top = 1
      Width = 73
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1256.77083333333
        2.64583333333333
        193.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfFinAdic.SALDO_ANTERIOR)'
      Mask = '###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr35: TQRExpr
      Left = 551
      Top = 1
      Width = 73
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1457.85416666667
        2.64583333333333
        193.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfFinAdic.IMP_FINAN_ADIC)'
      Mask = '###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr36: TQRExpr
      Left = 626
      Top = 1
      Width = 73
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1656.29166666667
        2.64583333333333
        193.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfFinAdic.SALDO_NUEVO)'
      Mask = '###,###,###,##0.00'
      FontSize = 7
    end
    object QRLabel12: TQRLabel
      Left = 15
      Top = 1
      Width = 100
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        39.6875
        2.64583333333333
        264.583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Producto'
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
  end
  object QRGroupMoneda: TQRGroup
    Left = 48
    Top = 165
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
    Expression = 'qyInfFinAdic.CVE_MONEDA'
    FooterBand = QRFooterMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRShape24: TQRShape
      Left = 0
      Top = 0
      Width = 625
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        0
        0
        1653.64583333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRDBText9: TQRDBText
      Left = 44
      Top = 1
      Width = 35
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        116.416666666667
        2.64583333333333
        92.6041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'CVE_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRLabel46: TQRLabel
      Left = 2
      Top = 1
      Width = 36
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        5.29166666666667
        2.64583333333333
        95.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda'
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
    object QRDBText15: TQRDBText
      Left = 82
      Top = 1
      Width = 72
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        216.958333333333
        2.64583333333333
        190.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'DESC_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
  end
  object QRGroupTipoProducto: TQRGroup
    Left = 48
    Top = 180
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
    Expression = 'qyInfFinAdic.CVE_PRODUCTO_CRE'
    FooterBand = QRFooterProducto
    Master = Owner
    ReprintOnNewPage = False
    object QRShape28: TQRShape
      Left = 17
      Top = 0
      Width = 656
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        44.9791666666667
        0
        1735.66666666667)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Left = 25
      Top = 1
      Width = 43
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        66.1458333333333
        2.64583333333333
        113.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Producto'
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
    object dbProducto: TQRDBText
      Left = 72
      Top = 1
      Width = 54
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        190.5
        2.64583333333333
        142.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'CVE_PRODUCTO_CRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText16: TQRDBText
      Left = 128
      Top = 1
      Width = 97
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        338.666666666667
        2.64583333333333
        256.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'DESC_C_PRODUCTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText11: TQRDBText
      Left = 776
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
        2053.16666666667
        2.64583333333333
        214.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'CUENTA_K'
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
    object QRDBText31: TQRDBText
      Left = 864
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
        2286
        2.64583333333333
        214.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'CUENTA_I'
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
  object QRTitular: TQRGroup
    Left = 48
    Top = 196
    Width = 960
    Height = 15
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
      39.6875
      2540)
    Expression = 'qyInfFinAdic.ID_TITULAR'
    FooterBand = QRFootTitular
    Master = Owner
    ReprintOnNewPage = False
    object QRShape31: TQRShape
      Left = 32
      Top = 0
      Width = 661
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        84.6666666666667
        0
        1748.89583333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 36
      Top = 1
      Width = 30
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        95.25
        2.64583333333333
        79.375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Titular'
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
    object QRDBText30: TQRDBText
      Left = 80
      Top = 1
      Width = 46
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        211.666666666667
        2.64583333333333
        121.708333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'ID_TITULAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText10: TQRDBText
      Left = 128
      Top = 1
      Width = 248
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        338.666666666667
        2.64583333333333
        656.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfFinAdic
      DataField = 'NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
  end
  object QRFootTitular: TQRBand
    Left = 48
    Top = 224
    Width = 960
    Height = 13
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
      34.3958333333333
      2540)
    BandType = rbGroupFooter
    object QRExpr94: TQRExpr
      Left = 475
      Top = 1
      Width = 73
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1256.77083333333
        2.64583333333333
        193.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfFinAdic.SALDO_ANTERIOR)'
      Mask = '###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr95: TQRExpr
      Left = 551
      Top = 1
      Width = 73
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1457.85416666667
        2.64583333333333
        193.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfFinAdic.IMP_FINAN_ADIC)'
      Mask = '###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr96: TQRExpr
      Left = 626
      Top = 1
      Width = 73
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1656.29166666667
        2.64583333333333
        193.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyInfFinAdic.SALDO_NUEVO)'
      Mask = '###,###,###,##0.00'
      FontSize = 7
    end
    object QRLabel26: TQRLabel
      Left = 21
      Top = 1
      Width = 94
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        55.5625
        2.64583333333333
        248.708333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Titular'
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
  end
  object qyInfFinAdic: TQuery
    AutoCalcFields = False
    DatabaseName = 'RCORP'
    SessionName = 'Default'
    SQL.Strings = (
      ' SELECT CC.ID_CREDITO, TRA.SIT_AFECTACION,'
      
        '        DECODE (SIT_AFECTACION,'#39'AC'#39',NVL(CHCA.SDO_VIG_TOTAL,CC.SD' +
        'O_VIG_TOTAL),'#39'CA'#39',NVL(CHCA.SDO_VIG_TOTAL,CC.SDO_VIG_TOTAL) + TRA' +
        '.IMP_NETO) AS SALDO_ANTERIOR,  '
      '        TRA.IMP_NETO IMP_FINAN_ADIC,'
      
        #9'    DECODE (SIT_AFECTACION,'#39'AC'#39',NVL(CHCA.SDO_VIG_TOTAL,CC.SDO_V' +
        'IG_TOTAL)+ TRA.IMP_NETO,'#39'CA'#39',NVL(CHCA.SDO_VIG_TOTAL,CC.SDO_VIG_T' +
        'OTAL)) AS SALDO_NUEVO,  '
      
        '        TRA.F_OPERACION FH_ALTA, TRA.F_VALOR, CC.ID_CONTRATO, CC' +
        '.F_INICIO, CC.F_VENCIMIENTO F_VTO_CRED, CC.ID_CRED_EXTERNO, CC.I' +
        'D_CONTROL_EXT, '
      
        '        CTO.CVE_MONEDA, CTO.ID_TITULAR, CRCTO.CVE_PRODUCTO_CRE, ' +
        'M.DESC_MONEDA, CP.DESC_L_PRODUCTO, P.NOMBRE, TRA.ID_TRANSACCION,' +
        ' '
      
        '        TRA.ID_PERIODO, TRA.CVE_USU_ALTA, TRA.SIT_TRANSACCION, T' +
        'RA.CVE_OPERACION, TRA.FH_CANCELA, CI.F_VENCIMIENTO F_VTO_INT, '
      
        '        (CI.F_VENCIMIENTO - CI.PLAZO + 1) F_INI_INT, TRA.CVE_TIP' +
        'O_MOVTO, CO.DESC_C_OPERACION CONCEPTO, TRA.TIPO_CAMBIO, '
      '        TRA.ID_TRANS_CANCELA, TRA.SITUACION, '
      
        '        DECODE(TRA.CVE_TIPO_MOVTO,'#39'AN'#39',TABCTA.CUENTA_VIGENTE_K,'#39 +
        'AV'#39',TABCTA.CUENTA_VIGENTE_K,'#39'MD'#39',TABCTA.CUENTA_VIGENTE_K,'
      
        '               '#39'MV'#39',TABCTA.CUENTA_VIGENTE_K, '#39'IM'#39',TABIMPCTA.CUEN' +
        'TA_IMPAGADO_KAP) CUENTA_K, '
      
        #9#9'DECODE(TRA.CVE_TIPO_MOVTO,'#39'AN'#39',TABCTA.CUENTA_VIGENTE_INT,'#39'AV'#39',' +
        'TABCTA.CUENTA_VIGENTE_INT,'#39'MD'#39',TABCTA.CUENTA_VIGENTE_INT, '
      
        '               '#39'MV'#39',TABCTA.CUENTA_VIGENTE_INT,'#39'IM'#39',TABIMPCTA.CUE' +
        'NTA_IMPAGADO_INT) CUENTA_I,'
      '        (CASE'
      '              WHEN CI.CVE_FINAN_ADIC = '#39'DR'#39' Then '#39'Directo'#39
      '              WHEN CI.CVE_FINAN_ADIC = '#39'PR'#39' Then '#39'Prorrateo'#39
      '        END) CVE_FINAN_ADIC'
      ' FROM '
      ' (SELECT * FROM CR_CREDITO  WHERE SIT_CREDITO <> '#39'CA'#39') CC,'
      
        ' (( SELECT  '#39'AC'#39' AS SIT_AFECTACION, CT.ID_TRANSACCION, CT.ID_CRE' +
        'DITO, CT.ID_PERIODO, CT.IMP_NETO, CT.CVE_USU_ALTA, '
      
        '          CT.F_OPERACION, CT.F_VALOR, CT.SIT_TRANSACCION, CT.CVE' +
        '_OPERACION, CT.FH_CANCELA, CT.CVE_TIPO_MOVTO, CT.TIPO_CAMBIO, '
      #9#9'  CT.ID_TRANS_CANCELA,'
      
        #9#9'  DECODE(CT.CVE_TIPO_MOVTO,'#39'AN'#39','#39'ANTICIPADO'#39','#39'AV'#39','#39'ANTICIPADO'#39 +
        ', '#39'MD'#39','#39'PROGRAMADO'#39','#39'MV'#39','#39'PROGRAMADO'#39', '#39'IM'#39','#39'IMPAGADO'#39','#39'IMPAGADO' +
        #39') SITUACION '
      '  FROM   CR_TRANSACCION CT '
      '  WHERE  CVE_OPERACION IN ( SELECT CVE_PAG_IN_FN '
      '                            FROM CR_PARAMETRO '
      #9#9#9#9#9#9#9'WHERE CVE_PARAMETRO = '#39'CRE'#39') '
      
        #9#9'  AND CT.F_OPERACION BETWEEN TO_DATE('#39'01/12/2009'#39','#39'DD/MM/YYYY'#39 +
        ') '
      #9#9'  AND TO_DATE('#39'08/02/2010'#39','#39'DD/MM/YYYY'#39') '
      #9#9'  AND SIT_TRANSACCION = '#39'AC'#39
      #9#9'  AND CT.ID_TRANS_CANCELA IS NULL --LINEA AGREGADA HERJA '
      ' )  '
      'UNION '
      
        '( SELECT  '#39'CA'#39' AS SIT_AFECTACION, CT.ID_TRANSACCION, CT.ID_CREDI' +
        'TO, CT.ID_PERIODO, CT.IMP_NETO, CT.CVE_USU_ALTA,    '
      
        '          CT.F_OPERACION, CT.F_VALOR, CT.SIT_TRANSACCION, CT.CVE' +
        '_OPERACION, CT.FH_CANCELA, CT.CVE_TIPO_MOVTO, CT.TIPO_CAMBIO, '
      #9#9'  CT.ID_TRANS_CANCELA,   '
      
        #9#9'  DECODE(CT.CVE_TIPO_MOVTO,'#39'AN'#39','#39'ANTICIPADO'#39','#39'AV'#39','#39'ANTICIPADO'#39 +
        ', '#39'MD'#39','#39'PROGRAMADO'#39','#39'MV'#39','#39'PROGRAMADO'#39', '#39'IM'#39','#39'IMPAGADO'#39','#39'IMPAGADO' +
        #39') SITUACION  '
      '  FROM   CR_TRANSACCION CT  '
      '  WHERE ( CT.SIT_TRANSACCION = '#39'CA'#39'  '
      '          AND CT.CVE_OPERACION IN ( SELECT CVE_PAG_IN_FN '
      #9#9'                            FROM CR_PARAMETRO '
      #9#9#9#9#9#9#9#9#9'WHERE CVE_PARAMETRO = '#39'CRE'#39') '
      
        '    '#9'  AND CT.F_OPERACION BETWEEN TO_DATE('#39'01/12/2009'#39','#39'DD/MM/YY' +
        'YY'#39') '
      '          AND TO_DATE('#39'08/02/2010'#39','#39'DD/MM/YYYY'#39') '
      #9#9')          '
      '  OR    ( CT.SIT_TRANSACCION = '#39'AC'#39'     '
      '          AND CT.CVE_OPERACION IN ( SELECT CO.CVE_OPER_CANCELA '
      
        #9#9'                            FROM CR_PARAMETRO CP, CR_OPERACION' +
        ' CO     '
      #9#9#9#9#9#9#9#9#9'WHERE CP.CVE_PARAMETRO = '#39'CRE'#39' '
      #9#9#9#9#9#9#9#9#9'AND CP.CVE_PAG_IN_FN = CO.CVE_OPERACION ) '
      
        #9#9'  AND CT.F_OPERACION BETWEEN TO_DATE('#39'01/12/2009'#39','#39'DD/MM/YYYY'#39 +
        ') '
      #9#9'  AND TO_DATE('#39'08/02/2010'#39','#39'DD/MM/YYYY'#39') '
      #9#9' )'
      ')) TRA, '
      
        'CR_INTERES CI, CR_HISTO_CRED CHCA, CR_CONTRATO CRCTO, CR_PRODUCT' +
        'O CP, CONTRATO CTO, '
      'MONEDA M, PERSONA P,  CR_OPERACION CO,'
      
        '(SELECT CP.CVE_PRODUCTO_CRE,  CUENTA_IMPAGADO_INT, CUENTA_IMPAGA' +
        'DO_KAP '
      ' FROM (SELECT * '
      '       FROM CR_PRODUCTO '
      #9'   WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE '
      
        #9'                              FROM CR_CONT_SIS_PROD  WHERE CVE_' +
        'CONT_SISTEMA = '#39'CTSICA'#39')'
      #9'  ) CP,'
      
        '      (SELECT '#39'IN'#39' AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, gc.*, G' +
        'C.CUENTA_CONTABLE, SUBSTR(GC.CUENTA_CONTABLE,1,4) || '#39'-'#39' || SUBS' +
        'TR(GC.CUENTA_CONTABLE,5,4) || '#39'-'#39' || SUBSTR(GC.CUENTA_CONTABLE,9' +
        ',2) AS CUENTA_IMPAGADO_INT        '
      #9'   FROM (SELECT * '
      #9'         FROM CR_PRODUCTO '
      #9#9#9' WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE '
      #9#9#9'                            FROM CR_CONT_SIS_PROD  '
      #9#9#9#9#9#9#9#9#9#9'WHERE CVE_CONT_SISTEMA = '#39'CTSICA'#39')'
      #9#9#9') CP, '
      #9#9#9'CR_CONT_PRODUCTO CCP, GUIA_CONTABLE@SICA GC        '
      #9#9#9'WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE        '
      #9#9#9'AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO        '
      #9#9#9'AND GC.EMPRESA = '#39'BCO2'#39'        '
      #9#9#9'AND GC.CODIGO_TRANSACCION IN (304710)        '
      #9#9#9'AND GC.CLAVE_MONEDA = '#39'PESOS'#39'        '
      #9#9#9'AND GC.CAMPO_IMPORTE = '#39'11'#39'        '
      #9#9#9'AND (GC.CUENTA_CONTABLE LIKE '#39'13%'#39')        '
      #9#9#9'AND GC.CARGO_ABONO = '#39'D'#39'      '
      #9'  ) CtaInt,      '
      
        '      (SELECT '#39'KA'#39' AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, SUBSTR(' +
        'GC.CUENTA_CONTABLE,1,4) || '#39'-'#39' || SUBSTR(GC.CUENTA_CONTABLE,5,4)' +
        ' || '#39'-'#39' || SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_IMPAGADO_KAP'
      #9'   FROM (SELECT * FROM CR_PRODUCTO '
      
        #9'         WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FRO' +
        'M CR_CONT_SIS_PROD  '
      
        #9#9#9'                            WHERE CVE_CONT_SISTEMA = '#39'CTSICA'#39 +
        ')'
      #9#9#9') CP,'
      #9#9#9'CR_CONT_PRODUCTO CCP, GUIA_CONTABLE@SICA GC        '
      #9#9#9'WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE        '
      #9#9#9'AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO        '
      #9#9#9'AND GC.EMPRESA = '#39'BCO2'#39'        '
      #9#9#9'AND GC.CODIGO_TRANSACCION IN (304710)        '
      #9#9#9'AND GC.CLAVE_MONEDA = '#39'PESOS'#39'        '
      #9#9#9'AND GC.CAMPO_IMPORTE = '#39'10'#39'        '
      #9#9#9'AND (GC.CUENTA_CONTABLE LIKE '#39'13%'#39')        '
      #9#9#9'AND GC.CARGO_ABONO = '#39'D'#39'       '
      #9'  ) CtaKap '
      ' WHERE CtaInt.CVE_PRODUCTO_CRE (+)= CP.CVE_PRODUCTO_CRE '
      
        ' AND CtaKap.CVE_PRODUCTO_CRE (+)= CP.CVE_PRODUCTO_CRE )TABIMPCTA' +
        ', -- C_QUERY_CTAS_IMP'
      
        '(SELECT CP.CVE_PRODUCTO_CRE, CUENTA_VENCIDA_INT, CUENTA_VEN_KAP_' +
        'EX, CUENTA_VEN_KAP_NO_EX '
      ' FROM (SELECT * FROM CR_PRODUCTO '
      
        '       WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM C' +
        'R_CONT_SIS_PROD  '
      
        #9'                              WHERE CVE_CONT_SISTEMA = '#39'CTSICA'#39 +
        ')'
      #9'  ) CP, '
      
        '      (SELECT '#39'IN'#39' AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, GC.*, G' +
        'C.CUENTA_CONTABLE, SUBSTR(GC.CUENTA_CONTABLE,1,4) || '#39'-'#39' || SUBS' +
        'TR(GC.CUENTA_CONTABLE,5,4) || '#39'-'#39' || SUBSTR(GC.CUENTA_CONTABLE,9' +
        ',2) AS CUENTA_VENCIDA_INT        '
      #9'   FROM (SELECT * FROM CR_PRODUCTO '
      
        #9'         WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FRO' +
        'M CR_CONT_SIS_PROD  '
      
        #9#9#9'                            WHERE CVE_CONT_SISTEMA = '#39'CTSICA'#39 +
        ')'
      #9#9#9')CP, '
      #9'        CR_CONT_PRODUCTO CCP, GUIA_CONTABLE@SICA GC  '
      '     '#9'   WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE        '
      #9'       AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO        '
      #9'       AND GC.EMPRESA = '#39'BCO2'#39'        '
      #9'       AND GC.CODIGO_TRANSACCION IN (304720)        '
      #9'       AND GC.CLAVE_MONEDA = '#39'PESOS'#39'   '
      #9'       AND GC.CAMPO_IMPORTE = '#39'03'#39'        '
      #9'       AND (GC.CUENTA_CONTABLE LIKE '#39'13%'#39')      '
      #9'       AND GC.CARGO_ABONO = '#39'D'#39'       '
      #9'   ) CtaInt,     '
      
        #9'   (SELECT '#39'KA'#39' AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, SUBSTR(GC' +
        '.CUENTA_CONTABLE,1,4) || '#39'-'#39' || SUBSTR(GC.CUENTA_CONTABLE,5,4) |' +
        '| '#39'-'#39' ||  SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VEN_KAP_EX   ' +
        '    '
      #9'    FROM (SELECT * FROM CR_PRODUCTO '
      
        #9#9'      WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM ' +
        'CR_CONT_SIS_PROD  '
      
        #9#9#9'                             WHERE CVE_CONT_SISTEMA = '#39'CTSICA' +
        #39')'
      #9#9#9' ) CP, '
      #9'         CR_CONT_PRODUCTO CCP, GUIA_CONTABLE@SICA GC '
      #9#9'     WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE        '
      #9#9'     AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO        '
      #9#9'     AND GC.EMPRESA = '#39'BCO2'#39'        '
      #9#9'     AND GC.CODIGO_TRANSACCION IN (304720)        '
      #9#9'     AND GC.CLAVE_MONEDA = '#39'PESOS'#39'        '
      #9#9'     AND GC.CAMPO_IMPORTE = '#39'02'#39'        '
      #9#9'     AND (GC.CUENTA_CONTABLE LIKE '#39'13%'#39')        '
      #9#9'     AND GC.CARGO_ABONO = '#39'D'#39'       '
      #9'   ) CtaKapExigible,       '
      
        #9'   (SELECT '#39'KA'#39' AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, SUBSTR(GC' +
        '.CUENTA_CONTABLE,1,4) || '#39'-'#39' || SUBSTR(GC.CUENTA_CONTABLE,5,4) |' +
        '| '#39'-'#39' || SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VEN_KAP_NO_EX ' +
        '       '
      ' '#9'    FROM (SELECT * FROM CR_PRODUCTO '
      
        #9#9'      WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM ' +
        'CR_CONT_SIS_PROD  '
      
        #9#9#9'                             WHERE CVE_CONT_SISTEMA = '#39'CTSICA' +
        #39')'
      #9#9#9' ) CP, '
      #9'         CR_CONT_PRODUCTO CCP, GUIA_CONTABLE@SICA GC'
      #9#9'     WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE        '
      #9#9'     AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO        '
      #9#9'     AND GC.EMPRESA = '#39'BCO2'#39'        '
      #9#9'     AND GC.CODIGO_TRANSACCION IN (304730)        '
      #9#9'     AND GC.CLAVE_MONEDA = '#39'PESOS'#39'        '
      #9#9'     AND GC.CAMPO_IMPORTE = '#39'02'#39'        '
      #9#9'     AND (GC.CUENTA_CONTABLE LIKE '#39'13%'#39')        '
      #9#9'     AND GC.CARGO_ABONO = '#39'D'#39'        '
      #9'   ) CtaKapNoExig'
      ' WHERE CtaInt.CVE_PRODUCTO_CRE (+)= CP.CVE_PRODUCTO_CRE '
      ' AND CtaKapExigible.CVE_PRODUCTO_CRE (+)= CP.CVE_PRODUCTO_CRE '
      
        ' AND CtaKapNoExig.CVE_PRODUCTO_CRE (+)= CP.CVE_PRODUCTO_CRE ) TA' +
        'BVENCTA, --C_QUERY_CTAS_VEN'#9' '
      
        '( SELECT CP.CVE_PRODUCTO_CRE, CUENTA_VIGENTE_INT, NVL(CtaAgrK.CU' +
        'ENTA_VIGENTE,CtaDDK.CUENTA_VIGENTE ) CUENTA_VIGENTE_K   '
      '  FROM (SELECT * FROM CR_PRODUCTO '
      
        '        WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM ' +
        'CR_CONT_SIS_PROD  '
      #9#9'                           WHERE CVE_CONT_SISTEMA = '#39'CTSICA'#39')'
      #9'   ) CP,'
      
        #9'   (SELECT '#39'IN'#39' AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, SUBSTR(GC' +
        '.CUENTA_CONTABLE,1,4) || '#39'-'#39' || SUBSTR(GC.CUENTA_CONTABLE,5,4) |' +
        '| '#39'-'#39' || SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE_INT '
      #9'    FROM (SELECT * FROM CR_PRODUCTO '
      
        #9#9'      WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM ' +
        'CR_CONT_SIS_PROD  '
      
        #9#9#9'                             WHERE CVE_CONT_SISTEMA = '#39'CTSICA' +
        #39')'
      #9#9#9' ) CP,'
      #9'         CR_CONT_PRODUCTO CCP, GUIA_CONTABLE@SICA GC '
      #9#9'     WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE          '
      #9#9'     AND CCP.CVE_PRODUCTO_CR NOT LIKE '#39'%FAC'#39'          '
      #9#9'     AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO          '
      #9#9'     AND GC.EMPRESA = '#39'BCO2'#39'          '
      #9#9'     AND GC.CODIGO_TRANSACCION IN (306000, 306710)           '
      #9#9'     AND GC.CAMPO_IMPORTE IN ('#39'03'#39','#39'06'#39')           '
      #9#9'     AND GC.CLAVE_MONEDA = '#39'PESOS'#39'          '
      
        #9#9'     AND (GC.CUENTA_CONTABLE LIKE '#39'13%'#39' OR GC.CUENTA_CONTABLE ' +
        'LIKE '#39'26%'#39')'
      #9'  ) CtaInt,        '
      
        #9'  (SELECT '#39'KA'#39' AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, SUBSTR(GC.' +
        'CUENTA_CONTABLE,1,4) || '#39'-'#39' || SUBSTR(GC.CUENTA_CONTABLE,5,4) ||' +
        ' '#39'-'#39' || SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE        ' +
        '  '
      #9'   FROM (SELECT * FROM CR_PRODUCTO '
      
        #9'         WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FRO' +
        'M CR_CONT_SIS_PROD '
      
        #9#9#9'                            WHERE CVE_CONT_SISTEMA = '#39'CTSICA'#39 +
        ')'
      #9#9'    ) CP, '
      #9#9#9'CR_CONT_PRODUCTO CCP, GUIA_CONTABLE@SICA GC          '
      #9#9#9'WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE          '
      #9#9#9'AND CCP.CVE_PRODUCTO_CR NOT LIKE '#39'%FAC'#39'          '
      #9#9#9'AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO          '
      #9#9#9'AND GC.EMPRESA = '#39'BCO2'#39'          '
      #9#9#9'AND GC.CODIGO_TRANSACCION IN (300000)           '
      #9#9#9'AND GC.CLAVE_MONEDA = '#39'PESOS'#39'          '
      #9#9#9'AND GC.CAMPO_IMPORTE = '#39'02'#39'           '
      #9#9#9'AND (GC.CUENTA_CONTABLE LIKE '#39'13%'#39')'
      #9'  ) CtaAgrK,  '
      
        #9'  (SELECT '#39'KA'#39' AS CVE_CONCEPTO, CCP.CVE_PRODUCTO_CR, CTA_CONTAB' +
        'LE || '#39'-'#39' || SUBSTR(SUB_CTA_CONTABLE,1,4) || '#39'-'#39' || SUBSTR(SUB_C' +
        'TA_CONTABLE,5,2) AS CUENTA_VIGENTE  '
      #9'   FROM CR_CONT_PRODUCTO  CCP          '
      #9'   WHERE CVE_PRODUCTO_CR LIKE '#39'%XXX'#39') CtaDDK '
      ' WHERE CtaInt.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '
      ' AND CtaAgrK.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '
      
        ' AND CtaDDK.CVE_PRODUCTO_CR (+)= cp.CVE_PRODUCTO_CRE )TABCTA --C' +
        '_QUERY_CTAS'
      'WHERE TRA.ID_CREDITO = CC.ID_CREDITO '
      'AND   CHCA.ID_CREDITO  (+)= TRA.ID_CREDITO '
      'AND   CHCA.F_CIERRE    (+)= (TRA.F_VALOR - 1) '
      'AND   CI.ID_CREDITO = CC.ID_CREDITO '
      'AND   CI.NUM_PERIODO = TRA.ID_PERIODO '
      'AND   CRCTO.ID_CONTRATO = CC.ID_CONTRATO '
      'AND   CRCTO.FOL_CONTRATO = CC.FOL_CONTRATO '
      'AND   CP.CVE_PRODUCTO_CRE = CRCTO.CVE_PRODUCTO_CRE '
      'AND   CTO.ID_CONTRATO = CC.ID_CONTRATO '
      'AND   M.CVE_MONEDA = CTO.CVE_MONEDA '
      'AND   P.ID_PERSONA = CTO.ID_TITULAR '
      'AND   CO.CVE_OPERACION = TRA.CVE_OPERACION'
      'AND   TABIMPCTA.CVE_PRODUCTO_CRE (+)= CP.CVE_PRODUCTO_CRE '
      'AND   TABVENCTA.CVE_PRODUCTO_CRE (+)= CP.CVE_PRODUCTO_CRE '
      'AND   TABCTA.CVE_PRODUCTO_CRE    (+)= CP.CVE_PRODUCTO_CRE '
      'AND  TRA.SIT_AFECTACION  = '#39'AC'#39
      'AND  CC.ID_CREDITO = 265631'
      'AND  CTO.ID_EMPRESA = 2'
      
        'ORDER BY CVE_MONEDA,DESC_C_PRODUCTO,NOMBRE,ID_CREDITO,ID_TRANSAC' +
        'CION'
      ' '
      ' ')
    Left = 209
    Top = 21
    object qyInfFinAdicCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyInfFinAdicDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyInfFinAdicCVE_PRODUCTO_CRE: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 6
    end
    object qyInfFinAdicID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object qyInfFinAdicNOMBRE: TStringField
      FieldName = 'NOMBRE'
    end
    object qyInfFinAdicID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qyInfFinAdicID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyInfFinAdicF_INICIO: TDateTimeField
      FieldName = 'F_INICIO'
    end
    object qyInfFinAdicF_VTO_CRED: TDateTimeField
      FieldName = 'F_VTO_CRED'
    end
    object qyInfFinAdicID_CRED_EXTERNO: TStringField
      FieldName = 'ID_CRED_EXTERNO'
    end
    object qyInfFinAdicID_CONTROL_EXT: TStringField
      FieldName = 'ID_CONTROL_EXT'
      Size = 30
    end
    object qyInfFinAdicID_PERIODO: TFloatField
      FieldName = 'ID_PERIODO'
    end
    object qyInfFinAdicF_INI_INT: TDateTimeField
      FieldName = 'F_INI_INT'
    end
    object qyInfFinAdicF_VTO_INT: TDateTimeField
      FieldName = 'F_VTO_INT'
    end
    object qyInfFinAdicSALDO_ANTERIOR: TFloatField
      FieldName = 'SALDO_ANTERIOR'
    end
    object qyInfFinAdicIMP_FINAN_ADIC: TFloatField
      FieldName = 'IMP_FINAN_ADIC'
    end
    object qyInfFinAdicSALDO_NUEVO: TFloatField
      FieldName = 'SALDO_NUEVO'
    end
    object qyInfFinAdicID_TRANSACCION: TFloatField
      FieldName = 'ID_TRANSACCION'
    end
    object qyInfFinAdicCVE_USU_ALTA: TStringField
      FieldName = 'CVE_USU_ALTA'
      Size = 8
    end
    object qyInfFinAdicFH_ALTA: TDateTimeField
      FieldName = 'FH_ALTA'
    end
    object qyInfFinAdicFH_CANCELA: TDateTimeField
      FieldName = 'FH_CANCELA'
    end
    object qyInfFinAdicSITUACION: TStringField
      FieldName = 'SITUACION'
      Size = 10
    end
    object qyInfFinAdicF_VALOR: TDateTimeField
      FieldName = 'F_VALOR'
    end
    object qyInfFinAdicDESC_L_PRODUCTO: TStringField
      FieldName = 'DESC_L_PRODUCTO'
      Size = 80
    end
    object qyInfFinAdicCUENTA_K: TStringField
      FieldName = 'CUENTA_K'
    end
    object qyInfFinAdicCUENTA_I: TStringField
      FieldName = 'CUENTA_I'
    end
    object qyInfFinAdicCVE_FINAN_ADIC: TStringField
      FieldName = 'CVE_FINAN_ADIC'
      Size = 2
    end
  end
end
