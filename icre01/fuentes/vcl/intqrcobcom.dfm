object QrCobCom: TQrCobCom
  Left = 0
  Top = 0
  Width = 845
  Height = 653
  Frame.Color = clBlack
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
  DataSet = qyCobCom
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
  Zoom = 80
  object PageHeaderBand1: TQRBand
    Left = 38
    Top = 38
    Width = 768
    Height = 67
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
      221.588541666667
      2540)
    BandType = rbPageHeader
    object QRInterEncabezado1: TQRInterEncabezado
      Left = 0
      Top = 0
      Width = 768
      Height = 67
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        221.588541666667
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
    Left = 38
    Top = 110
    Width = 768
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
      62.8385416666667
      2540)
    BandType = rbColumnHeader
    object qrsCRED: TQRShape
      Left = 109
      Top = 0
      Width = 42
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        359.833333333333
        0
        137.583333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlCRED: TQRLabel
      Left = 110
      Top = 2
      Width = 38
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        365.125
        5.29166666666667
        124.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Disposición'
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
    object qrsPER: TQRShape
      Left = 150
      Top = 0
      Width = 24
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        494.770833333333
        0
        79.375)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrsCONCEPTO: TQRShape
      Left = 173
      Top = 0
      Width = 145
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        56.2239583333333
        572.161458333333
        0
        479.557291666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlCONCEPTO: TQRLabel
      Left = 173
      Top = 2
      Width = 142
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        572.161458333333
        6.61458333333333
        469.635416666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Concepto'
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
      Left = 543
      Top = 0
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        56.2239583333333
        1795.859375
        0
        165.364583333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel22: TQRLabel
      Left = 549
      Top = 2
      Width = 35
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        1815.703125
        6.61458333333333
        115.755208333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Base de Cálculo'
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
      Left = 592
      Top = 0
      Width = 20
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        56.2239583333333
        1957.91666666667
        0
        66.1458333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel24: TQRLabel
      Left = 594
      Top = 2
      Width = 16
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        1964.53125
        6.61458333333333
        52.9166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '% Com.'
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
      Left = 611
      Top = 0
      Width = 40
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        56.2239583333333
        2020.75520833333
        0
        132.291666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel25: TQRLabel
      Left = 613
      Top = 2
      Width = 35
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        2027.36979166667
        6.61458333333333
        115.755208333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Importe Comisión'
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
    object qrsTOTAL: TQRShape
      Left = 689
      Top = 0
      Width = 40
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        56.2239583333333
        2278.72395833333
        0
        132.291666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlTOTAL: TQRLabel
      Left = 692
      Top = 2
      Width = 37
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        2288.64583333333
        6.61458333333333
        122.369791666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Total'
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
    object qrsSIT: TQRShape
      Left = 752
      Top = 0
      Width = 15
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        56.2239583333333
        2487.08333333333
        0
        49.609375)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlSIT: TQRLabel
      Left = 755
      Top = 2
      Width = 10
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        2497.00520833333
        6.61458333333333
        33.0729166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Sit.'
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
    object QRShape4: TQRShape
      Left = 650
      Top = 0
      Width = 40
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        56.2239583333333
        2149.73958333333
        0
        132.291666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 654
      Top = 2
      Width = 35
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        2162.96875
        6.61458333333333
        115.755208333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Importe IVA'
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
    object qrsFVTO: TQRShape
      Left = 1
      Top = 0
      Width = 37
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        2.64583333333333
        0
        121.708333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlFVTO: TQRLabel
      Left = 2
      Top = 2
      Width = 34
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        7.9375
        5.29166666666667
        113.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Vencimiento'
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
    object qrlPER: TQRLabel
      Left = 152
      Top = 2
      Width = 19
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        502.708333333333
        5.29166666666667
        63.5)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Per.'
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
    object qrsFACTURA: TQRShape
      Left = 728
      Top = 0
      Width = 25
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        56.2239583333333
        2407.70833333333
        0
        82.6822916666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlFACTURA: TQRLabel
      Left = 730
      Top = 2
      Width = 21
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        2414.32291666667
        6.61458333333333
        69.453125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Num. Factura'
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
    object QRShape14: TQRShape
      Left = 494
      Top = 0
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        56.2239583333333
        1633.80208333333
        0
        165.364583333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Left = 499
      Top = 2
      Width = 35
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        1650.33854166667
        6.61458333333333
        115.755208333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Saldo Insoluto'
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
    object qrsFPROGPAGO: TQRShape
      Left = 37
      Top = 0
      Width = 38
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        121.708333333333
        0
        124.354166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrsFPAGO: TQRShape
      Left = 74
      Top = 0
      Width = 36
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        243.416666666667
        0
        119.0625)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlFPROGPAGO: TQRLabel
      Left = 38
      Top = 2
      Width = 34
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        127
        5.29166666666667
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Prog. Pago'
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
    object qrlFPAGO: TQRLabel
      Left = 78
      Top = 2
      Width = 27
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        256.645833333333
        5.29166666666667
        89.9583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Pago'
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
      Left = 445
      Top = 0
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        56.2239583333333
        1471.74479166667
        0
        165.364583333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel17: TQRLabel
      Left = 451
      Top = 2
      Width = 35
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        1491.58854166667
        6.61458333333333
        115.755208333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Importe Disposición'
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
    object QRShape19: TQRShape
      Left = 424
      Top = 0
      Width = 22
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        56.2239583333333
        1402.29166666667
        0
        72.7604166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel18: TQRLabel
      Left = 426
      Top = 2
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        1408.90625
        6.61458333333333
        59.53125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Spd'
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
    object QRShape20: TQRShape
      Left = 385
      Top = 0
      Width = 40
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        56.2239583333333
        1273.30729166667
        0
        132.291666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel19: TQRLabel
      Left = 390
      Top = 2
      Width = 29
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        1289.84375
        6.61458333333333
        95.9114583333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tasa de Ref.'
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
    object QRShape21: TQRShape
      Left = 351
      Top = 0
      Width = 35
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        56.2239583333333
        1160.859375
        0
        115.755208333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel21: TQRLabel
      Left = 354
      Top = 2
      Width = 29
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        1170.78125
        6.61458333333333
        95.9114583333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'F. Vencimiento'
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
      Left = 317
      Top = 0
      Width = 35
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        56.2239583333333
        1048.41145833333
        0
        115.755208333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel23: TQRLabel
      Left = 320
      Top = 2
      Width = 29
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        1058.33333333333
        6.61458333333333
        95.9114583333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'F. Inicio'
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
  object QRChildBand1: TQRChildBand
    Left = 38
    Top = 105
    Width = 768
    Height = 5
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
      16.5364583333333
      2540)
    ParentBand = PageHeaderBand1
  end
  object qrDetalle: TQRBand
    Left = 38
    Top = 179
    Width = 768
    Height = 7
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
      23.1510416666667
      2540)
    BandType = rbDetail
    object QRDBText3: TQRDBText
      Left = 115
      Top = 0
      Width = 35
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        381
        0
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'ID_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText5: TQRDBText
      Left = 171
      Top = 0
      Width = 146
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        565.546875
        0
        482.864583333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'DESC_COMISION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText7: TQRDBText
      Left = 542
      Top = 0
      Width = 50
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1792.55208333333
        0
        165.364583333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'IMP_BASE_CALCULO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText8: TQRDBText
      Left = 595
      Top = 0
      Width = 18
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1967.83854166667
        0
        59.53125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'PCT_COMISION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.0000'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText10: TQRDBText
      Left = 614
      Top = 0
      Width = 35
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2030.67708333333
        0
        115.755208333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'IMP_COMISION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText16: TQRDBText
      Left = 649
      Top = 0
      Width = 37
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2146.43229166667
        0
        122.369791666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'IMP_IVA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText17: TQRDBText
      Left = 688
      Top = 0
      Width = 37
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2275.41666666667
        0
        122.369791666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText1: TQRDBText
      Left = 77
      Top = 0
      Width = 37
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        254
        0
        121.708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'F_PAGO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText18: TQRDBText
      Left = 755
      Top = 0
      Width = 11
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2497.00520833333
        0
        36.3802083333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'SIT_COMISION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText4: TQRDBText
      Left = 151
      Top = 1
      Width = 18
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        500.0625
        2.64583333333333
        58.2083333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'NUM_PERIODO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText6: TQRDBText
      Left = 726
      Top = 0
      Width = 27
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2401.09375
        0
        89.296875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'NUM_FACTURA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText13: TQRDBText
      Left = 2
      Top = 1
      Width = 37
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        5.29166666666667
        2.64583333333333
        121.708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'F_VENCIMIENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText14: TQRDBText
      Left = 39
      Top = 1
      Width = 37
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        129.645833333333
        2.64583333333333
        121.708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'F_PROG_PAGO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText15: TQRDBText
      Left = 491
      Top = 0
      Width = 50
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1623.88020833333
        0
        165.364583333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'SDO_INSOLUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText21: TQRDBText
      Left = 318
      Top = 1
      Width = 30
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1051.71875
        3.30729166666667
        99.21875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'F_INICIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText22: TQRDBText
      Left = 351
      Top = 1
      Width = 30
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1160.859375
        3.30729166666667
        99.21875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'F_VTO_CRED'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText23: TQRDBText
      Left = 382
      Top = 1
      Width = 37
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1263.38541666667
        3.30729166666667
        122.369791666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'CVE_TASA_REFER'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText24: TQRDBText
      Left = 423
      Top = 1
      Width = 14
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1398.984375
        3.30729166666667
        46.3020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'SOBRETASA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.0000'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText25: TQRDBText
      Left = 440
      Top = 1
      Width = 50
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1455.20833333333
        3.30729166666667
        165.364583333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'IMP_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
  end
  object FooAcred: TQRBand
    Left = 38
    Top = 186
    Width = 768
    Height = 10
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = FooAcredBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      33.0729166666667
      2540)
    BandType = rbGroupFooter
    object QRExpr2: TQRExpr
      Left = 542
      Top = 1
      Width = 50
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1792.55208333333
        3.30729166666667
        165.364583333333)
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
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyCobCom.IMP_BASE_CALCULO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr4: TQRExpr
      Left = 614
      Top = 0
      Width = 35
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2030.67708333333
        0
        115.755208333333)
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
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyCobCom.IMP_COMISION)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr5: TQRExpr
      Left = 688
      Top = 1
      Width = 38
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2275.41666666667
        3.30729166666667
        125.677083333333)
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
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyCobCom.TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr6: TQRExpr
      Left = 649
      Top = 1
      Width = 38
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2146.43229166667
        3.30729166666667
        125.677083333333)
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
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyCobCom.IMP_IVA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object qrlTOT_ACRED: TQRLabel
      Left = 40
      Top = 1
      Width = 54
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        132.291666666667
        3.30729166666667
        178.59375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Acreditado'
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
    object qrdbTITULAR: TQRDBText
      Left = 14
      Top = 1
      Width = 188
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        46.3020833333333
        3.30729166666667
        621.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'NOMBRE'
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
    object qrdbSPD: TQRDBText
      Left = 423
      Top = 1
      Width = 14
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1398.984375
        3.30729166666667
        46.3020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'SOBRETASA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.0000'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object qrdbCVE_TASA_REF: TQRDBText
      Left = 382
      Top = 1
      Width = 37
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1263.38541666667
        3.30729166666667
        122.369791666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'CVE_TASA_REFER'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object qrdbFINICIO: TQRDBText
      Left = 318
      Top = 1
      Width = 30
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1051.71875
        3.30729166666667
        99.21875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'F_INICIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object qrdbFVTO: TQRDBText
      Left = 351
      Top = 1
      Width = 30
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1160.859375
        3.30729166666667
        99.21875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'F_VTO_CRED'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object qrdbPCT_COMIS: TQRDBText
      Left = 595
      Top = 1
      Width = 18
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1967.83854166667
        3.30729166666667
        59.53125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'PCT_COMISION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '##0.0000'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object qrlImpCredAcr: TQRLabel
      Left = 440
      Top = 1
      Width = 49
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1455.20833333333
        3.30729166666667
        162.057291666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Acreditado'
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
    object qrlSdoInsAcr: TQRLabel
      Left = 491
      Top = 1
      Width = 50
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1623.88020833333
        3.30729166666667
        165.364583333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Acreditado'
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
  object QRGroupMoneda: TQRGroup
    Left = 38
    Top = 129
    Width = 768
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupMonedaBeforePrint
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
    Expression = 'qyCobCom.CVE_MONEDA'
    FooterBand = qrbTOTAL
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText26: TQRDBText
      Left = 2
      Top = 1
      Width = 43
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        6.61458333333333
        3.30729166666667
        142.213541666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'CVE_MONEDA'
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
    object QRDBText27: TQRDBText
      Left = 45
      Top = 1
      Width = 516
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        148.828125
        3.30729166666667
        1706.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'MONEDA'
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
  object QRGroupGpoProducto: TQRGroup
    Left = 38
    Top = 141
    Width = 768
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupGpoProductoBeforePrint
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
      42.9947916666667
      2540)
    Expression = 'qyCobCom.CVE_PRODUCTO_GPO'
    FooterBand = FooterGPOPROD
    Master = Owner
    ReprintOnNewPage = False
    object qrsGRUOP: TQRShape
      Left = 5
      Top = 1
      Width = 739
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        36.3802083333333
        16.5364583333333
        3.30729166666667
        2444.08854166667)
      Brush.Color = clBtnFace
      Shape = qrsRectangle
    end
    object QRLabel5: TQRLabel
      Left = 7
      Top = 2
      Width = 62
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        23.1510416666667
        6.61458333333333
        205.052083333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Grupo Producto:'
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
    object QRDBText2: TQRDBText
      Left = 74
      Top = 2
      Width = 43
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        244.739583333333
        6.61458333333333
        142.213541666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
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
    object QRDBText12: TQRDBText
      Left = 125
      Top = 2
      Width = 516
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        413.411458333333
        6.61458333333333
        1706.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'DESC_PROD_GPO'
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
  object FooterGPOPROD: TQRBand
    Left = 38
    Top = 207
    Width = 768
    Height = 21
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = FooterGPOPRODBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      69.453125
      2540)
    BandType = rbGroupFooter
    object QRLabel11: TQRLabel
      Left = 8
      Top = 5
      Width = 57
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        26.4583333333333
        16.5364583333333
        188.515625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Grupo'
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
      Left = 424
      Top = 4
      Width = 313
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        36.3802083333333
        1402.29166666667
        13.2291666666667
        1035.18229166667)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRExpr9: TQRExpr
      Left = 687
      Top = 6
      Width = 39
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2272.109375
        19.84375
        128.984375)
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
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyCobCom.TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr1: TQRExpr
      Left = 647
      Top = 6
      Width = 39
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2139.81770833333
        19.84375
        128.984375)
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
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyCobCom.IMP_IVA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr7: TQRExpr
      Left = 608
      Top = 6
      Width = 39
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2010.83333333333
        19.84375
        128.984375)
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
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyCobCom.IMP_COMISION)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr10: TQRExpr
      Left = 542
      Top = 6
      Width = 50
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1792.55208333333
        19.84375
        165.364583333333)
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
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyCobCom.IMP_BASE_CALCULO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object qrlImpCredGpo: TQRLabel
      Left = 440
      Top = 6
      Width = 49
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1455.20833333333
        19.84375
        162.057291666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Acreditado'
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
    object qrlSdoInsGpo: TQRLabel
      Left = 491
      Top = 6
      Width = 50
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1623.88020833333
        19.84375
        165.364583333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Acreditado'
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
  object qrbTOTAL: TQRBand
    Left = 38
    Top = 228
    Width = 768
    Height = 23
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrbTOTALBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      76.0677083333333
      2540)
    BandType = rbGroupFooter
    object QRLabel10: TQRLabel
      Left = 2
      Top = 3
      Width = 57
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        6.61458333333333
        9.921875
        188.515625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total Moneda'
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
    object QRExpr3: TQRExpr
      Left = 643
      Top = 3
      Width = 40
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        2126.58854166667
        9.921875
        132.291666666667)
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyCobCom.IMP_IVA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr8: TQRExpr
      Left = 602
      Top = 3
      Width = 40
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1990.98958333333
        9.921875
        132.291666666667)
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyCobCom.IMP_COMISION)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr11: TQRExpr
      Left = 686
      Top = 3
      Width = 40
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        2268.80208333333
        9.921875
        132.291666666667)
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyCobCom.TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr12: TQRExpr
      Left = 542
      Top = 3
      Width = 50
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1792.55208333333
        9.921875
        165.364583333333)
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyCobCom.IMP_BASE_CALCULO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRShape2: TQRShape
      Left = 423
      Top = 14
      Width = 313
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        3.30729166666667
        1398.984375
        46.3020833333333
        1035.18229166667)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRShape3: TQRShape
      Left = 423
      Top = 16
      Width = 313
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        3.30729166666667
        1398.984375
        52.9166666666667
        1035.18229166667)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object qrlImpCredMon: TQRLabel
      Left = 440
      Top = 3
      Width = 49
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1455.20833333333
        9.921875
        162.057291666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Acreditado'
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
    object qrlSdoInsMon: TQRLabel
      Left = 491
      Top = 3
      Width = 50
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1623.88020833333
        9.921875
        165.364583333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Acreditado'
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
  object qrgPRODUCTO: TQRGroup
    Left = 38
    Top = 154
    Width = 768
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrgPRODUCTOBeforePrint
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
      36.3802083333333
      2540)
    Expression = 'qyCobCom.CVE_PRODUCTO_CRE'
    FooterBand = FooPROD
    Master = Owner
    ReprintOnNewPage = False
    object qrsPROD: TQRShape
      Left = 13
      Top = 0
      Width = 731
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        42.9947916666667
        0
        2417.63020833333)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRLabel7: TQRLabel
      Left = 20
      Top = 1
      Width = 29
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        66.1458333333333
        3.30729166666667
        95.9114583333333)
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
    object QRDBText9: TQRDBText
      Left = 62
      Top = 1
      Width = 43
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        205.052083333333
        3.30729166666667
        142.213541666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
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
    object QRDBText11: TQRDBText
      Left = 109
      Top = 1
      Width = 66
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        360.494791666667
        3.30729166666667
        218.28125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'DESC_L_PRODUCTO'
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
  object FooPROD: TQRBand
    Left = 38
    Top = 196
    Width = 768
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = FooPRODBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      36.3802083333333
      2540)
    BandType = rbGroupFooter
    object QRLabel16: TQRLabel
      Left = 24
      Top = 1
      Width = 57
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        79.375
        3.30729166666667
        188.515625)
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
    object QRExpr16: TQRExpr
      Left = 647
      Top = 2
      Width = 39
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2139.81770833333
        6.61458333333333
        128.984375)
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
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyCobCom.IMP_IVA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr17: TQRExpr
      Left = 608
      Top = 2
      Width = 39
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2010.83333333333
        6.61458333333333
        128.984375)
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
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyCobCom.IMP_COMISION)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr18: TQRExpr
      Left = 687
      Top = 2
      Width = 39
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2272.109375
        6.61458333333333
        128.984375)
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
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyCobCom.TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr19: TQRExpr
      Left = 542
      Top = 2
      Width = 50
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1792.55208333333
        6.61458333333333
        165.364583333333)
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
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyCobCom.IMP_BASE_CALCULO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object qrlImpCredProd: TQRLabel
      Left = 440
      Top = 1
      Width = 49
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1455.20833333333
        3.30729166666667
        162.057291666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Acreditado'
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
    object qrlSdoInsProd: TQRLabel
      Left = 491
      Top = 1
      Width = 50
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1623.88020833333
        3.30729166666667
        165.364583333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Acreditado'
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
  object qrgACRED: TQRGroup
    Left = 38
    Top = 165
    Width = 768
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrgACREDBeforePrint
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
    Expression = 'qyCobCom.ID_TITULAR'
    FooterBand = FooAcred
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel15: TQRLabel
      Left = 39
      Top = 1
      Width = 39
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        128.984375
        3.30729166666667
        128.984375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Acreditado'
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
    object QRDBText19: TQRDBText
      Left = 82
      Top = 1
      Width = 43
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        271.197916666667
        3.30729166666667
        142.213541666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'ID_TITULAR'
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
    object QRDBText20: TQRDBText
      Left = 133
      Top = 1
      Width = 188
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        439.869791666667
        3.30729166666667
        621.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCobCom
      DataField = 'NOMBRE'
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
  object QRBand1: TQRBand
    Left = 38
    Top = 251
    Width = 768
    Height = 32
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      105.833333333333
      2540)
    BandType = rbSummary
  end
  object qrgCRED: TQRGroup
    Left = 38
    Top = 177
    Width = 768
    Height = 2
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrgCREDBeforePrint
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
      6.61458333333333
      2540)
    Expression = 'qyCobCom.ID_CREDITO'
    Master = Owner
    ReprintOnNewPage = False
  end
  object qyCobCom: TQuery
    DatabaseName = 'DCORP'
    Left = 189
    Top = 16
    object qyCobComID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
      Origin = 'DCORP.CONTRATO.ID_TITULAR'
    end
    object qyCobComNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Origin = 'DCORP.PERSONA.NOMBRE'
      Size = 80
    end
    object qyCobComID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
      Origin = 'DCORP.CR_CREDITO.ID_CREDITO'
    end
    object qyCobComIMP_COMISION: TFloatField
      FieldName = 'IMP_COMISION'
    end
    object qyCobComIMP_IVA: TFloatField
      FieldName = 'IMP_IVA'
    end
    object qyCobComTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object qyCobComSIT_COMISION: TStringField
      FieldName = 'SIT_COMISION'
      Size = 2
    end
    object qyCobComCVE_PRODUCTO_CRE: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 6
    end
    object qyCobComNUM_PERIODO: TFloatField
      FieldName = 'NUM_PERIODO'
    end
    object qyCobComDESC_COMISION: TStringField
      FieldName = 'DESC_COMISION'
      Size = 80
    end
    object qyCobComIMP_CREDITO: TFloatField
      FieldName = 'IMP_CREDITO'
    end
    object qyCobComIMP_BASE_CALCULO: TFloatField
      FieldName = 'IMP_BASE_CALCULO'
    end
    object qyCobComNUM_FACTURA: TFloatField
      FieldName = 'NUM_FACTURA'
    end
    object qyCobComPCT_COMISION: TFloatField
      FieldName = 'PCT_COMISION'
    end
    object qyCobComDESC_L_PRODUCTO: TStringField
      FieldName = 'DESC_L_PRODUCTO'
      Size = 80
    end
    object qyCobComF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qyCobComF_PROG_PAGO: TDateTimeField
      FieldName = 'F_PROG_PAGO'
    end
    object qyCobComF_PAGO: TDateTimeField
      FieldName = 'F_PAGO'
    end
    object qyCobComCVE_PRODUCTO_GPO: TStringField
      FieldName = 'CVE_PRODUCTO_GPO'
      Size = 6
    end
    object qyCobComDESC_PROD_GPO: TStringField
      FieldName = 'DESC_PROD_GPO'
      Size = 80
    end
    object qyCobComF_INICIO: TDateTimeField
      FieldName = 'F_INICIO'
    end
    object qyCobComF_VTO_CRED: TDateTimeField
      FieldName = 'F_VTO_CRED'
    end
    object qyCobComSOBRETASA: TFloatField
      FieldName = 'SOBRETASA'
    end
    object qyCobComSDO_INSOLUTO: TFloatField
      FieldName = 'SDO_INSOLUTO'
    end
    object qyCobComCVE_TASA_REFER: TStringField
      FieldName = 'CVE_TASA_REFER'
      Size = 6
    end
    object qyCobComCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyCobComMONEDA: TStringField
      FieldName = 'MONEDA'
      Size = 80
    end
  end
end
