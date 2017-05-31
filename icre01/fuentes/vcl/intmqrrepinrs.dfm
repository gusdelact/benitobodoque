object QrRepInRs: TQrRepInRs
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qyRepInRs
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
    63.5
    63.5
    0)
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = First
  PrintIfEmpty = True
  ReportTitle = 'Rep. Infra/Resúmen'
  SnapToGrid = True
  Units = Inches
  Zoom = 100
  object PageHeaderBand1: TQRBand
    Left = 24
    Top = 48
    Width = 1008
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
      2667)
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
        2667)
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
  object qrbDETALLE: TQRBand
    Left = 24
    Top = 198
    Width = 1008
    Height = 0
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrbDETALLEAfterPrint
    AlignToBottom = False
    BeforePrint = qrbDETALLEBeforePrint
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
      0
      2667)
    BandType = rbDetail
    object QRDBText23: TQRDBText
      Left = 5
      Top = 2
      Width = 35
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        13.2291666666667
        5.29166666666667
        92.6041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInRs
      DataField = 'ANIOMES'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText1: TQRDBText
      Left = 133
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        351.895833333333
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInRs
      DataField = 'PAGO_CP'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText2: TQRDBText
      Left = 210
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        555.625
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInRs
      DataField = 'PAGO_CP_AN'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText3: TQRDBText
      Left = 278
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        735.541666666667
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInRs
      DataField = 'IN_GENERADO'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText4: TQRDBText
      Left = 427
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1129.77083333333
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInRs
      DataField = 'PAGO_IN'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText6: TQRDBText
      Left = 90
      Top = 2
      Width = 38
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        238.125
        5.29166666666667
        100.541666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInRs
      DataField = 'TASA_APLICADA'
      Mask = '##0.0000'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRExpr15: TQRExpr
      Left = 792
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2095.5
        5.29166666666667
        185.208333333333)
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
      Expression = 
        'SUM(qyRepInRs.PAGO_CP+qyRepInRs.PAGO_CP_AN+qyRepInRs.PAGO_IN+qyR' +
        'epInff.PAGO_IN_AN+qyRepInRs.PAGO_IN_FN+qyRepInRs.PAGO_FN+qyRepIn' +
        'ff.PAGO_FN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRDBText15: TQRDBText
      Left = 503
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1330.85416666667
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInRs
      DataField = 'PAGO_IN_AN'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText16: TQRDBText
      Left = 575
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1521.35416666667
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInRs
      DataField = 'PAGO_IN_FN'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText17: TQRDBText
      Left = 647
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1711.85416666667
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInRs
      DataField = 'PAGO_FN'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText7: TQRDBText
      Left = 723
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1912.9375
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInRs
      DataField = 'PAGO_FN_AN'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel24: TQRLabel
      Left = 865
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2288.64583333333
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel24'
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
    object QRLabel30: TQRLabel
      Left = 46
      Top = 2
      Width = 38
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        121.708333333333
        5.29166666666667
        100.541666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel24'
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
    object QRLabel33: TQRLabel
      Left = 937
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2479.14583333333
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel24'
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
    object QRLabel34: TQRLabel
      Left = 352
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        931.333333333333
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel24'
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
  end
  object ColumnHeaderBand1: TQRBand
    Left = 24
    Top = 132
    Width = 1008
    Height = 32
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clSilver
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      84.6666666666667
      2667)
    BandType = rbColumnHeader
    object QRShape2: TQRShape
      Left = 102
      Top = -1
      Width = 76
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        269.875
        -2.64583333333333
        201.083333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape1: TQRShape
      Left = 177
      Top = -1
      Width = 76
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        468.3125
        -2.64583333333333
        201.083333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel17: TQRLabel
      Left = 182
      Top = 1
      Width = 66
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        481.541666666667
        2.64583333333333
        174.625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Pagos de Capital Anticipados'
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
      Left = 252
      Top = -1
      Width = 76
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        666.75
        -2.64583333333333
        201.083333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel16: TQRLabel
      Left = 264
      Top = 1
      Width = 54
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        698.5
        2.64583333333333
        142.875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Intereses Generados'
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
    object QRShape12: TQRShape
      Left = 402
      Top = -1
      Width = 76
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1063.625
        -2.64583333333333
        201.083333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel15: TQRLabel
      Left = 418
      Top = 1
      Width = 47
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1105.95833333333
        2.64583333333333
        124.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Pagos de Interés'
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
      Left = 552
      Top = -1
      Width = 76
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1460.5
        -2.64583333333333
        201.083333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 560
      Top = 1
      Width = 61
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        1481.66666666667
        2.64583333333333
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Pago de Interés por Financiamiento'
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
    object QRShape9: TQRShape
      Left = 627
      Top = -1
      Width = 80
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1658.9375
        -2.64583333333333
        211.666666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel21: TQRLabel
      Left = 636
      Top = 1
      Width = 62
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1682.75
        2.64583333333333
        164.041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Pago de Financiamiento'
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
      Left = 477
      Top = -1
      Width = 76
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1262.0625
        -2.64583333333333
        201.083333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel22: TQRLabel
      Left = 485
      Top = 1
      Width = 62
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1283.22916666667
        2.64583333333333
        164.041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Pago de Interés Anticipado'
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
      Left = 706
      Top = -1
      Width = 76
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1867.95833333333
        -2.64583333333333
        201.083333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Left = 714
      Top = 1
      Width = 59
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1889.125
        2.64583333333333
        156.104166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Pago de Finan. Anticipado'
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
      Left = 781
      Top = -1
      Width = 76
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        2066.39583333333
        -2.64583333333333
        201.083333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel11: TQRLabel
      Left = 792
      Top = 1
      Width = 58
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        2095.5
        2.64583333333333
        153.458333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Total Cobrado por Mes'
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
      Left = 856
      Top = -1
      Width = 76
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        2264.83333333333
        -2.64583333333333
        201.083333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Left = 866
      Top = 1
      Width = 58
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2291.29166666667
        2.64583333333333
        153.458333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Saldo Insoluto NE'
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
    object QRShape20: TQRShape
      Left = 327
      Top = -1
      Width = 76
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        865.1875
        -2.64583333333333
        201.083333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel31: TQRLabel
      Left = 339
      Top = 1
      Width = 54
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        896.9375
        2.64583333333333
        142.875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Interés Exigible'
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
    object QRShape21: TQRShape
      Left = 931
      Top = -1
      Width = 76
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        2463.27083333333
        -2.64583333333333
        201.083333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel32: TQRLabel
      Left = 941
      Top = 1
      Width = 58
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2489.72916666667
        2.64583333333333
        153.458333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Saldo Insoluto EX'
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
    object QRLabel14: TQRLabel
      Left = 108
      Top = 1
      Width = 66
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        285.75
        2.64583333333333
        174.625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Pagos de Capital'
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
    object QRShape4: TQRShape
      Left = 0
      Top = -1
      Width = 103
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        0
        -2.64583333333333
        272.520833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel26: TQRLabel
      Left = 28
      Top = 2
      Width = 49
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        74.0833333333333
        5.29166666666667
        129.645833333333)
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
  end
  object QRFooterAcred: TQRBand
    Left = 24
    Top = 198
    Width = 1008
    Height = 16
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRFooterAcredAfterPrint
    AlignToBottom = False
    BeforePrint = QRFooterAcredBeforePrint
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
      2667)
    BandType = rbGroupFooter
    object QRExpr30: TQRExpr
      Left = 181
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        478.895833333333
        5.29166666666667
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.PAGO_CP_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr31: TQRExpr
      Left = 254
      Top = 2
      Width = 70
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
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.IN_GENERADO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr32: TQRExpr
      Left = 406
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1074.20833333333
        5.29166666666667
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.PAGO_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr33: TQRExpr
      Left = 481
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1272.64583333333
        5.29166666666667
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.PAGO_IN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr34: TQRExpr
      Left = 786
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2079.625
        5.29166666666667
        185.208333333333)
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
      Expression = 
        'SUM(qyRepInRs.PAGO_CP+qyRepInRs.PAGO_CP_AN+qyRepInRs.PAGO_IN+qyR' +
        'epInRs.PAGO_IN_AN+qyRepInRs.PAGO_IN_FN+qyRepInRs.PAGO_FN+qyRepIn' +
        'Rs.PAGO_FN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr35: TQRExpr
      Left = 555
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1468.4375
        5.29166666666667
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.PAGO_IN_FN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr36: TQRExpr
      Left = 635
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1680.10416666667
        5.29166666666667
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.PAGO_FN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr37: TQRExpr
      Left = 711
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1881.1875
        5.29166666666667
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.PAGO_FN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr38: TQRExpr
      Left = 104
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        275.166666666667
        5.29166666666667
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.PAGO_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel4: TQRLabel
      Left = 861
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2278.0625
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel24'
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
    object QRLabel5: TQRLabel
      Left = 935
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2473.85416666667
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel24'
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
    object QRExpr2: TQRExpr
      Left = 330
      Top = 3
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        873.125
        7.9375
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.IMPINTEX)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRFooterMon: TQRBand
    Left = 24
    Top = 214
    Width = 1008
    Height = 25
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRFooterMonAfterPrint
    AlignToBottom = False
    BeforePrint = QRFooterMonBeforePrint
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
      2667)
    BandType = rbGroupFooter
    object QRExpr11: TQRExpr
      Left = 181
      Top = 7
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        478.895833333333
        18.5208333333333
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.PAGO_CP_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel29: TQRLabel
      Left = 27
      Top = 6
      Width = 74
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        71.4375
        15.875
        195.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total x Moneda:'
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
    object QRExpr12: TQRExpr
      Left = 254
      Top = 7
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        672.041666666667
        18.5208333333333
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.IN_GENERADO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr13: TQRExpr
      Left = 406
      Top = 7
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1074.20833333333
        18.5208333333333
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.PAGO_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr14: TQRExpr
      Left = 481
      Top = 7
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1272.64583333333
        18.5208333333333
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.PAGO_IN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr17: TQRExpr
      Left = 555
      Top = 7
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1468.4375
        18.5208333333333
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.PAGO_IN_FN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr18: TQRExpr
      Left = 635
      Top = 7
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1680.10416666667
        18.5208333333333
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.PAGO_FN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr19: TQRExpr
      Left = 711
      Top = 7
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1881.1875
        18.5208333333333
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.PAGO_FN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr20: TQRExpr
      Left = 104
      Top = 7
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        275.166666666667
        18.5208333333333
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.PAGO_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRShape10: TQRShape
      Left = 103
      Top = 3
      Width = 755
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        272.520833333333
        7.9375
        1997.60416666667)
      Pen.Style = psDot
      Shape = qrsHorLine
    end
    object QRExpr1: TQRExpr
      Left = 786
      Top = 7
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2079.625
        18.5208333333333
        185.208333333333)
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
        'SUM(qyRepInRs.PAGO_CP+qyRepInRs.PAGO_CP_AN+qyRepInRs.PAGO_IN+qyR' +
        'epInRs.PAGO_IN_AN+qyRepInRs.PAGO_IN_FN+qyRepInRs.PAGO_FN+qyRepIn' +
        'Rs.PAGO_FN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr3: TQRExpr
      Left = 330
      Top = 7
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        873.125
        18.5208333333333
        185.208333333333)
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
      Expression = 'SUM(qyRepInRs.IMPINTEX)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRGroupMon: TQRGroup
    Left = 24
    Top = 164
    Width = 1008
    Height = 20
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupMonBeforePrint
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      52.9166666666667
      2667)
    Expression = 'qyRepInRs.cve_moneda'
    FooterBand = QRFooterMon
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText5: TQRDBText
      Left = 62
      Top = 1
      Width = 36
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        164.041666666667
        2.64583333333333
        95.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInRs
      DataField = 'CVE_MONEDA'
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
    object QRLabel10: TQRLabel
      Left = 10
      Top = 1
      Width = 48
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        26.4583333333333
        2.64583333333333
        127)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda:'
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
    object QRLabel12: TQRLabel
      Left = 100
      Top = 1
      Width = 109
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        264.583333333333
        2.64583333333333
        288.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel12'
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
  object QRGroupAcred: TQRGroup
    Left = 24
    Top = 184
    Width = 1008
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = 14737632
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
      2667)
    Expression = 'qyRepInRs.ID_TITULAR'
    FooterBand = QRFooterAcred
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText18: TQRDBText
      Left = 4
      Top = 2
      Width = 41
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        10.5833333333333
        5.29166666666667
        108.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInRs
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
    object QRDBText19: TQRDBText
      Left = 50
      Top = 2
      Width = 60
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        132.291666666667
        5.29166666666667
        158.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInRs
      DataField = 'ACREDITADO'
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
    object QRLabel1: TQRLabel
      Left = 40
      Top = 2
      Width = 4
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        105.833333333333
        5.29166666666667
        10.5833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '-'
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
  object qyRepInRs: TQuery
    DatabaseName = 'BCORP'
    SQL.Strings = (
      
        '    SELECT fech.aniomes, fech.id_credito, fech.cve_moneda, fech.' +
        'id_contrato, fech.id_titular,'
      
        '           fech.acreditado, fech.f_inicio, fech.f_vencimiento, f' +
        'ech.imp_credito,'
      '           fech.sobretasa,'
      '           (select tasa_aplicada from cre_prov_diaria'
      '             where id_credito = fech.id_credito'
      
        '               and TO_CHAR (f_provision, '#39'YYYY/MM'#39') = fech.aniom' +
        'es'
      
        '               and f_provision = (select max(f_provision) -1 fro' +
        'm cre_prov_diaria where id_credito = fech.id_credito and TO_CHAR' +
        ' (f_provision, '#39'YYYY/MM'#39') = fech.aniomes)'
      '           ) tasa_aplicada,'
      '           trans.pago_cp, trans.pago_cp_an,'
      
        '           in_generado, trans.pago_in, trans.pago_in_an, trans.p' +
        'ago_in_fn,'
      '           trans.pago_fn, trans.pago_fn_an, fech.sit_credito,'
      
        '        CAST(PKGCRCOMUN.FUN_EXIGIBLE(fech.id_credito, fech.aniom' +
        'es, TO_DATE('#39'16/10/2013'#39','#39'DD/MM/YYYY'#39'), PAGO_IN_AN) AS VARCHAR2(' +
        '5)) INT_EX'
      '      FROM ('
      
        '                SELECT cr.id_credito, cr.cve_moneda, TO_CHAR (cr' +
        'h.f_cierre, '#39'YYYY/MM'#39') AS aniomes,'
      
        '                   SUM (crh.imp_interes_dia) + SUM (crh.imp_inte' +
        'res_fv) + SUM (crh.imp_ajuste_in) AS in_generado,'
      '                   cr.id_contrato, cr.id_titular,'
      
        '                   CAST(pkgcrconsolidado.fun_nom_tit_cred (cr.id' +
        '_titular) AS VARCHAR2 (100)) acreditado,'
      '                   cr.f_inicio, cr.f_vencimiento, cr.sobretasa,'
      '                   cr.imp_credito, cr.sit_credito'
      
        '             FROM (SELECT id_credito, f_cierre + 1 f_cierre, imp' +
        '_interes_dia,'
      '                          imp_interes_fv, imp_ajuste_in'
      '                     FROM cr_histo_interes'
      '                   union'
      
        '                   SELECT id_credito, f_provision + 1 f_cierre, ' +
        'imp_interes_dia, 0 imp_interes_fv,'
      '                          0 imp_ajuste_in'
      '                     FROM cre_prov_diaria'
      
        '                    WHERE f_provision < TO_DATE ('#39'01/01/2011'#39', '#39 +
        'dd/mm/yyyy'#39')'
      '                   union'
      
        #9#9#9'SELECT id_credito, f_operacion as f_cierre, 0 imp_interes_dia' +
        ', 0 imp_interes_fv, imp_concepto as imp_ajuste_in'
      
        '                       FROM cr_det_transac cd, cr_transaccion cr' +
        't'
      '                  WHERE 1 = 1'
      
        '                        AND crt.id_transaccion = cd.id_transacci' +
        'on'
      '                        AND crt.cve_operacion = '#39'AJFVIN'#39
      
        '                        AND crt.f_operacion < TO_DATE ('#39'01/01/20' +
        '11'#39', '#39'dd/mm/yyyy'#39')'
      '                        AND cd.cve_concepto = '#39'IMPBRU'#39
      '                  ) crh,'
      
        '                  (SELECT CRC.*, cnt.id_titular, cnt.id_empresa,' +
        ' cnt.cve_moneda'
      
        '                     FROM cr_credito crc, cr_contrato cto, cr_pr' +
        'oducto crp, contrato cnt'
      '                    WHERE 1 = 1'
      '                      AND cto.id_contrato = crc.id_contrato'
      
        '                      AND crp.cve_producto_cre = cto.cve_product' +
        'o_cre'
      '                      AND cnt.id_contrato = crc.id_contrato'
      '                      AND crc.sit_credito  = '#39'AC'#39'  '
      '                      AND crc.id_credito = 333317'
      '                     ) cr'
      '             WHERE 1 = 1'
      '               AND cr.id_credito = crh.id_credito'
      '               AND crh.f_cierre <='
      '                               CASE'
      '                                  WHEN cr.f_liquidacion IS NULL'
      
        '                                     THEN TO_DATE('#39'31/07/2013'#39','#39 +
        'DD/MM/YYYY'#39')'
      '                                  ELSE (CASE'
      
        '                                           WHEN cr.f_liquidacion' +
        ' IS NOT NULL'
      
        '                                           AND cr.f_liquidacion ' +
        '> TO_DATE('#39'31/07/2013'#39','#39'DD/MM/YYYY'#39')'
      
        '                                              THEN  TO_DATE('#39'31/' +
        '07/2013'#39','#39'DD/MM/YYYY'#39') - 1'
      '                                           ELSE cr.f_liquidacion'
      '                                        END'
      '                                       )'
      '                               END'
      '          GROUP BY cr.id_credito, cr.cve_moneda,'
      '                   TO_CHAR (crh.f_cierre, '#39'YYYY/MM'#39'),'
      '                                   cr.id_contrato,'
      
        '                   cr.id_titular,cr.f_inicio, cr.f_vencimiento, ' +
        'cr.sobretasa, cr.imp_credito, cr.sit_credito'
      '                            ) fech,'
      '           (SELECT  ct.id_credito, cr.cve_moneda,'
      
        '                    TO_CHAR (ct.f_operacion, '#39'YYYY/MM'#39') AS aniom' +
        'es,'
      #9#9'   SUM(CASE'
      '                        WHEN OPE.CVE_ACCESORIO = '#39'CP'#39
      '                         AND OPE.CVE_OPERACION NOT IN ('#39'PGDMCP'#39')'
      
        '                         AND CT.CVE_TIPO_MOVTO <> '#39'AN'#39' THEN (CAS' +
        'E'
      
        '                                                                ' +
        '    WHEN OPE.CVE_AFECTA_SDO = '#39'I'#39
      
        '                                                                ' +
        '  THEN DE.IMP_CONCEPTO'
      
        '                                                                ' +
        '  ELSE DE.IMP_CONCEPTO*-1'
      
        '                                                               E' +
        'ND)'
      '                           WHEN OPE.CVE_ACCESORIO = '#39'CP'#39
      '                            AND OPE.CVE_OPERACION IN ('#39'PGDMCP'#39')'
      
        '                            AND CT.CVE_TIPO_MOVTO <> '#39'AN'#39' THEN (' +
        'CASE'
      
        '                                                                ' +
        '     WHEN OPE.CVE_AFECTA_SDO = '#39'D'#39' THEN DE.IMP_CONCEPTO'
      
        '                                                                ' +
        '     ELSE DE.IMP_CONCEPTO*-1'
      
        '                                                                ' +
        '      END)'
      '                    ELSE 0'
      '                  END) PAGO_CP,'
      '                    SUM(CASE'
      '                              WHEN OPE.CVE_ACCESORIO = '#39'CP'#39
      
        '                               AND OPE.CVE_OPERACION NOT IN ('#39'PG' +
        'DMCP'#39')'
      
        '                               AND CT.CVE_TIPO_MOVTO = '#39'AN'#39' THEN' +
        ' (CASE'
      #9#9'       '#9#9#9#9'                     WHEN OPE.CVE_AFECTA_SDO = '#39'I'#39
      #9#9'       '#9#9#9#9#9#9'     THEN DE.IMP_CONCEPTO'
      #9#9'       '#9#9#9#9#9#9'     ELSE DE.IMP_CONCEPTO*-1'
      #9#9'         '#9#9#9#9#9#9'END)'
      #9#9'         '#9'    WHEN OPE.CVE_ACCESORIO = '#39'CP'#39
      #9#9'         '#9'     AND OPE.CVE_OPERACION IN ('#39'PGDMCP'#39')'
      #9#9'         '#9'     AND CT.CVE_TIPO_MOVTO = '#39'AN'#39' THEN (CASE'
      
        #9#9'         '#9#9#9#9'                      WHEN OPE.CVE_AFECTA_SDO = '#39 +
        'D'#39' THEN DE.IMP_CONCEPTO'
      #9#9'         '#9#9#9#9#9#9'      ELSE DE.IMP_CONCEPTO*-1'
      #9#9'         '#9#9#9#9#9#9'       END)'
      '                     '#9'     ELSE 0'
      #9#9'         END) PAGO_CP_AN,'
      
        '                    SUM(CASE WHEN OPE.CVE_ACCESORIO = '#39'IN'#39' AND C' +
        'T.CVE_TIPO_MOVTO <> '#39'AN'#39' AND OPE.CVE_OPERACION NOT IN ('#39'PAINFA'#39',' +
        #39'RPAINF'#39') THEN (CASE WHEN OPE.CVE_AFECTA_SDO = '#39'I'#39' THEN DE.IMP_C' +
        'ONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) PAGO_IN,'
      
        '                    SUM(CASE WHEN OPE.CVE_ACCESORIO = '#39'IN'#39' AND C' +
        'T.CVE_TIPO_MOVTO = '#39'AN'#39'  AND OPE.CVE_OPERACION NOT IN ('#39'PAINFA'#39',' +
        #39'RPAINF'#39') THEN (CASE WHEN OPE.CVE_AFECTA_SDO = '#39'I'#39' THEN DE.IMP_C' +
        'ONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) PAGO_IN_AN,'
      
        '                    SUM(CASE WHEN OPE.CVE_ACCESORIO = '#39'IN'#39' AND O' +
        'PE.CVE_OPERACION IN ('#39'PAINFA'#39','#39'RPAINF'#39') THEN (CASE WHEN OPE.CVE_' +
        'AFECTA_SDO = '#39'I'#39' THEN DE.IMP_CONCEPTO ELSE DE.IMP_CONCEPTO*-1 EN' +
        'D) ELSE 0 END) PAGO_IN_FN,'
      
        '                    SUM(CASE WHEN OPE.CVE_ACCESORIO = '#39'FN'#39' AND C' +
        'T.CVE_TIPO_MOVTO <> '#39'AN'#39' THEN (CASE WHEN OPE.CVE_AFECTA_SDO = '#39'I' +
        #39' THEN DE.IMP_CONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) ' +
        'PAGO_FN,'
      
        '                    SUM(CASE WHEN OPE.CVE_ACCESORIO = '#39'FN'#39' AND C' +
        'T.CVE_TIPO_MOVTO = '#39'AN'#39'  THEN (CASE WHEN OPE.CVE_AFECTA_SDO = '#39'I' +
        #39' THEN DE.IMP_CONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) ' +
        'PAGO_FN_AN'
      '               FROM cr_transaccion ct,'
      '                    cr_det_transac de,'
      '                    (SELECT cp.cve_operacion, crca.cve_concepto,'
      
        '                            crca.cve_tipo_movto, cp.cve_accesori' +
        'o,'
      '                            crca.cve_afecta_sdo'
      
        '                       FROM cr_rel_con_afec crca, cr_operacion c' +
        'p'
      '                   WHERE ('
      
        #9#9#9'       (crca.cve_afectacion IN ('#39'CAIMPA'#39', '#39'FNIMPA'#39', '#39'CIIMPA'#39')' +
        ' )'
      #9#9#9'      or'
      
        #9#9#9'       ((crca.cve_operacion IN ('#39'PGDMCP'#39') AND (crca.cve_afect' +
        'acion IN ('#39'CAIMCA'#39')) ))'
      #9#9#9'      )'
      '                        AND crca.cve_concepto = '#39'IMPBRU'#39
      
        '                        AND crca.cve_operacion = cp.cve_operacio' +
        'n) ope,'
      
        '                    (SELECT CRC.*, cnt.id_titular, cnt.id_empres' +
        'a, cnt.cve_moneda'
      
        '                     FROM cr_credito crc, cr_contrato cto, cr_pr' +
        'oducto crp, contrato cnt'
      '                     WHERE 1 = 1'
      '                       AND cto.id_contrato = crc.id_contrato'
      
        '                       AND crp.cve_producto_cre = cto.cve_produc' +
        'to_cre'
      '                       AND cnt.id_contrato = crc.id_contrato'
      '                      AND crc.sit_credito  = '#39'AC'#39'  '
      '                      AND crc.id_credito = 333317'
      '                     ) cr'
      '               WHERE 1 = 1'
      '                 AND ct.id_credito = cr.id_credito'
      '                 AND ct.id_transaccion = de.id_transaccion'
      '                 AND ope.cve_operacion = ct.cve_operacion'
      '                 AND ope.cve_concepto = de.cve_concepto'
      '                 AND ope.cve_tipo_movto = ct.cve_tipo_movto'
      '                 AND de.cve_concepto = '#39'IMPBRU'#39
      '                 AND ct.sit_transaccion = '#39'AC'#39
      '                 AND ct.f_operacion <='
      '                                     CASE'
      
        '                                        WHEN cr.f_liquidacion IS' +
        ' NULL'
      
        '                                           THEN TO_DATE('#39'31/07/2' +
        '013'#39','#39'DD/MM/YYYY'#39')'
      '                                        ELSE (CASE'
      
        '                                                 WHEN cr.f_liqui' +
        'dacion IS NOT NULL'
      
        '                                                 AND cr.f_liquid' +
        'acion > TO_DATE('#39'31/07/2013'#39','#39'DD/MM/YYYY'#39')'
      
        '                                                    THEN TO_DATE' +
        '('#39'31/07/2013'#39','#39'DD/MM/YYYY'#39')'
      
        '                                                 ELSE cr.f_liqui' +
        'dacion'
      '                                              END'
      '                                             )'
      '                                 END'
      
        '              GROUP BY ct.id_credito, cr.cve_moneda, TO_CHAR (ct' +
        '.f_operacion, '#39'YYYY/MM'#39')'
      '                          ) trans'
      '        WHERE 1 = 1'
      '          AND trans.aniomes (+) = fech.aniomes'
      '          AND trans.id_credito (+) = fech.id_credito'
      
        '     ORDER BY fech.cve_moneda, fech.id_titular, fech.id_contrato' +
        ', fech.id_credito, fech.aniomes')
    Left = 62
    Top = 13
    object qyRepInRsANIOMES: TStringField
      FieldName = 'ANIOMES'
      Size = 7
    end
    object qyRepInRsID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyRepInRsCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyRepInRsID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qyRepInRsID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object qyRepInRsACREDITADO: TStringField
      FieldName = 'ACREDITADO'
      Size = 100
    end
    object qyRepInRsF_INICIO: TDateTimeField
      FieldName = 'F_INICIO'
    end
    object qyRepInRsF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qyRepInRsIMP_CREDITO: TFloatField
      FieldName = 'IMP_CREDITO'
    end
    object qyRepInRsSOBRETASA: TFloatField
      FieldName = 'SOBRETASA'
    end
    object qyRepInRsTASA_APLICADA: TFloatField
      FieldName = 'TASA_APLICADA'
    end
    object qyRepInRsPAGO_CP: TFloatField
      FieldName = 'PAGO_CP'
    end
    object qyRepInRsPAGO_CP_AN: TFloatField
      FieldName = 'PAGO_CP_AN'
    end
    object qyRepInRsIN_GENERADO: TFloatField
      FieldName = 'IN_GENERADO'
    end
    object qyRepInRsPAGO_IN: TFloatField
      FieldName = 'PAGO_IN'
    end
    object qyRepInRsPAGO_IN_AN: TFloatField
      FieldName = 'PAGO_IN_AN'
    end
    object qyRepInRsPAGO_IN_FN: TFloatField
      FieldName = 'PAGO_IN_FN'
    end
    object qyRepInRsPAGO_FN: TFloatField
      FieldName = 'PAGO_FN'
    end
    object qyRepInRsPAGO_FN_AN: TFloatField
      FieldName = 'PAGO_FN_AN'
    end
    object qyRepInRsSIT_CREDITO: TStringField
      FieldName = 'SIT_CREDITO'
      Size = 2
    end
    object qyRepInRsINT_EX: TStringField
      FieldName = 'INT_EX'
      Size = 2
    end
    object qyRepInRsIMPINTEX: TFloatField
      FieldName = 'IMPINTEX'
    end
  end
end
