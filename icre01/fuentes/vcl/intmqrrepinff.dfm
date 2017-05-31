object QrRepInff: TQrRepInff
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qyRepInff
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
  ReportTitle = 'Rep. Infra/AñoMes'
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
    Top = 267
    Width = 1008
    Height = 14
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
      37.0416666666667
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
      DataSet = qyRepInff
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
      DataSet = qyRepInff
      DataField = 'PAGO_CP'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText2: TQRDBText
      Left = 207
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
        547.6875
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInff
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
      DataSet = qyRepInff
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
      DataSet = qyRepInff
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
      DataSet = qyRepInff
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
        'SUM(qyRepInff.PAGO_CP+qyRepInff.PAGO_CP_AN+qyRepInff.PAGO_IN+qyR' +
        'epInff.PAGO_IN_AN+qyRepInff.PAGO_IN_FN+qyRepInff.PAGO_FN+qyRepIn' +
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
      DataSet = qyRepInff
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
      DataSet = qyRepInff
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
      DataSet = qyRepInff
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
      DataSet = qyRepInff
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
    object QRDBText9: TQRDBText
      Left = 352
      Top = 1
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
        2.64583333333333
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInff
      DataField = 'IMPINTEX'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
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
    object QRShape16: TQRShape
      Left = 47
      Top = -1
      Width = 40
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        124.354166666667
        -2.64583333333333
        105.833333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape17: TQRShape
      Left = 0
      Top = -1
      Width = 48
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
        127)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel20: TQRLabel
      Left = 4
      Top = 1
      Width = 40
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        10.5833333333333
        2.64583333333333
        105.833333333333)
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
    object QRLabel19: TQRLabel
      Left = 53
      Top = 1
      Width = 28
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        140.229166666667
        2.64583333333333
        74.0833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tasa TIIE'
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
    object QRShape15: TQRShape
      Left = 86
      Top = -1
      Width = 45
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        227.541666666667
        -2.64583333333333
        119.0625)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel18: TQRLabel
      Left = 90
      Top = 1
      Width = 36
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        238.125
        2.64583333333333
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tasa TIIE + SobreT'
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
    object QRShape1: TQRShape
      Left = 203
      Top = -1
      Width = 74
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        537.104166666667
        -2.64583333333333
        195.791666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel17: TQRLabel
      Left = 207
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
        547.6875
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
      Left = 276
      Top = -1
      Width = 74
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        730.25
        -2.64583333333333
        195.791666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel16: TQRLabel
      Left = 287
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
        759.354166666667
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
      Left = 422
      Top = -1
      Width = 74
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1116.54166666667
        -2.64583333333333
        195.791666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel15: TQRLabel
      Left = 436
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
        1153.58333333333
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
      Left = 568
      Top = -1
      Width = 74
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1502.83333333333
        -2.64583333333333
        195.791666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 575
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
        1521.35416666667
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
      Left = 641
      Top = -1
      Width = 74
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1695.97916666667
        -2.64583333333333
        195.791666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel21: TQRLabel
      Left = 647
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
        1711.85416666667
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
    object QRShape4: TQRShape
      Left = 130
      Top = -1
      Width = 74
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        343.958333333333
        -2.64583333333333
        195.791666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel14: TQRLabel
      Left = 134
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
        354.541666666667
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
    object QRShape5: TQRShape
      Left = 495
      Top = -1
      Width = 74
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1309.6875
        -2.64583333333333
        195.791666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel22: TQRLabel
      Left = 500
      Top = 1
      Width = 65
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1322.91666666667
        2.64583333333333
        171.979166666667)
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
      Left = 714
      Top = -1
      Width = 74
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1889.125
        -2.64583333333333
        195.791666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Left = 722
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
        1910.29166666667
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
      Left = 787
      Top = -1
      Width = 74
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        2082.27083333333
        -2.64583333333333
        195.791666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel11: TQRLabel
      Left = 795
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
        2103.4375
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
      Left = 860
      Top = -1
      Width = 74
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        2275.41666666667
        -2.64583333333333
        195.791666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Left = 868
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
        2296.58333333333
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
      Left = 349
      Top = -1
      Width = 74
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        923.395833333333
        -2.64583333333333
        195.791666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel31: TQRLabel
      Left = 359
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
        949.854166666667
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
      Left = 933
      Top = -1
      Width = 75
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        2468.5625
        -2.64583333333333
        198.4375)
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
  end
  object QRFooterDisp: TQRBand
    Left = 24
    Top = 281
    Width = 1008
    Height = 25
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRFooterDispAfterPrint
    AlignToBottom = False
    BeforePrint = QRFooterDispBeforePrint
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
    object QRExpr2: TQRExpr
      Left = 207
      Top = 5
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        547.6875
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_CP_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRShape2: TQRShape
      Left = 131
      Top = 1
      Width = 733
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        346.604166666667
        2.64583333333333
        1939.39583333333)
      Pen.Style = psDot
      Shape = qrsHorLine
    end
    object QRLabel5: TQRLabel
      Left = 34
      Top = 4
      Width = 94
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        89.9583333333333
        10.5833333333333
        248.708333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total x Disposición :'
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
    object QRExpr1: TQRExpr
      Left = 278
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.IN_GENERADO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr3: TQRExpr
      Left = 427
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr4: TQRExpr
      Left = 503
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_IN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr5: TQRExpr
      Left = 792
      Top = 5
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
        13.2291666666667
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
        'SUM(qyRepInff.PAGO_CP+qyRepInff.PAGO_CP_AN+qyRepInff.PAGO_IN+qyR' +
        'epInff.PAGO_IN_AN+qyRepInff.PAGO_IN_FN+qyRepInff.PAGO_FN+qyRepIn' +
        'ff.PAGO_FN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr6: TQRExpr
      Left = 575
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_IN_FN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr7: TQRExpr
      Left = 647
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_FN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr8: TQRExpr
      Left = 723
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_FN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr9: TQRExpr
      Left = 133
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr10: TQRExpr
      Left = 352
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.IMPINTEX)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRFooterAcred: TQRBand
    Left = 24
    Top = 331
    Width = 1008
    Height = 25
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
      66.1458333333333
      2667)
    BandType = rbGroupFooter
    object QRExpr30: TQRExpr
      Left = 207
      Top = 5
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        547.6875
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_CP_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRShape14: TQRShape
      Left = 131
      Top = 1
      Width = 733
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        346.604166666667
        2.64583333333333
        1939.39583333333)
      Pen.Style = psDot
      Shape = qrsHorLine
    end
    object QRLabel28: TQRLabel
      Left = 39
      Top = 4
      Width = 88
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        103.1875
        10.5833333333333
        232.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total x Acreditado :'
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
    object QRExpr31: TQRExpr
      Left = 278
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.IN_GENERADO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr32: TQRExpr
      Left = 427
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr33: TQRExpr
      Left = 503
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_IN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr34: TQRExpr
      Left = 792
      Top = 5
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
        13.2291666666667
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
        'SUM(qyRepInff.PAGO_CP+qyRepInff.PAGO_CP_AN+qyRepInff.PAGO_IN+qyR' +
        'epInff.PAGO_IN_AN+qyRepInff.PAGO_IN_FN+qyRepInff.PAGO_FN+qyRepIn' +
        'ff.PAGO_FN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr35: TQRExpr
      Left = 575
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_IN_FN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr36: TQRExpr
      Left = 647
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_FN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr37: TQRExpr
      Left = 723
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_FN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr38: TQRExpr
      Left = 133
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr40: TQRExpr
      Left = 352
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.IMPINTEX)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRFooterLinea: TQRBand
    Left = 24
    Top = 306
    Width = 1008
    Height = 25
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRFooterLineaAfterPrint
    AlignToBottom = False
    BeforePrint = QRFooterLineaBeforePrint
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
    object QRExpr21: TQRExpr
      Left = 207
      Top = 5
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        547.6875
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_CP_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRShape11: TQRShape
      Left = 131
      Top = 1
      Width = 733
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        346.604166666667
        2.64583333333333
        1939.39583333333)
      Pen.Style = psDot
      Shape = qrsHorLine
    end
    object QRLabel25: TQRLabel
      Left = 63
      Top = 4
      Width = 65
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        166.6875
        10.5833333333333
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total x Línea :'
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
    object QRExpr22: TQRExpr
      Left = 278
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.IN_GENERADO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr23: TQRExpr
      Left = 427
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr24: TQRExpr
      Left = 503
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_IN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr25: TQRExpr
      Left = 792
      Top = 5
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
        13.2291666666667
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
        'SUM(qyRepInff.PAGO_CP+qyRepInff.PAGO_CP_AN+qyRepInff.PAGO_IN+qyR' +
        'epInff.PAGO_IN_AN+qyRepInff.PAGO_IN_FN+qyRepInff.PAGO_FN+qyRepIn' +
        'ff.PAGO_FN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr26: TQRExpr
      Left = 575
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_IN_FN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr27: TQRExpr
      Left = 647
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_FN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr28: TQRExpr
      Left = 723
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_FN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr29: TQRExpr
      Left = 133
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr39: TQRExpr
      Left = 352
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.IMPINTEX)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRFooterMon: TQRBand
    Left = 24
    Top = 356
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
      Left = 207
      Top = 5
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        547.6875
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_CP_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRShape10: TQRShape
      Left = 131
      Top = 1
      Width = 733
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        346.604166666667
        2.64583333333333
        1939.39583333333)
      Pen.Style = psDot
      Shape = qrsHorLine
    end
    object QRLabel29: TQRLabel
      Left = -3
      Top = 4
      Width = 128
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        -7.9375
        10.5833333333333
        338.666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total x '
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
      Left = 278
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.IN_GENERADO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr13: TQRExpr
      Left = 427
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr14: TQRExpr
      Left = 503
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_IN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr16: TQRExpr
      Left = 792
      Top = 5
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
        13.2291666666667
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
        'SUM(qyRepInff.PAGO_CP+qyRepInff.PAGO_CP_AN+qyRepInff.PAGO_IN+qyR' +
        'epInff.PAGO_IN_AN+qyRepInff.PAGO_IN_FN+qyRepInff.PAGO_FN+qyRepIn' +
        'ff.PAGO_FN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr17: TQRExpr
      Left = 575
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_IN_FN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr18: TQRExpr
      Left = 647
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_FN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr19: TQRExpr
      Left = 723
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_FN_AN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr20: TQRExpr
      Left = 133
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.PAGO_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr41: TQRExpr
      Left = 352
      Top = 5
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
        13.2291666666667
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
      Expression = 'SUM(qyRepInff.IMPINTEX)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRGroupMon: TQRGroup
    Left = 24
    Top = 164
    Width = 1008
    Height = 19
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
      50.2708333333333
      2667)
    Expression = 'qyRepInff.cve_moneda'
    FooterBand = QRFooterMon
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText5: TQRDBText
      Left = 61
      Top = 1
      Width = 30
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        161.395833333333
        2.64583333333333
        79.375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInff
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
      Left = 94
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
        248.708333333333
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
    Top = 183
    Width = 1008
    Height = 17
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
      44.9791666666667
      2667)
    Expression = 'qyRepInff.ID_TITULAR'
    FooterBand = QRFooterAcred
    Master = Owner
    ReprintOnNewPage = False
    object QRShape18: TQRShape
      Left = 0
      Top = 0
      Width = 1007
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        0
        0
        2664.35416666667)
      Brush.Color = 14737632
      Shape = qrsRectangle
    end
    object QRDBText18: TQRDBText
      Left = 73
      Top = 2
      Width = 58
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        193.145833333333
        5.29166666666667
        153.458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInff
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
    object QRLabel26: TQRLabel
      Left = 10
      Top = 2
      Width = 52
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        26.4583333333333
        5.29166666666667
        137.583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Acreditado:'
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
      Left = 133
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
        351.895833333333
        5.29166666666667
        158.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInff
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
  end
  object QRGroupLinea: TQRGroup
    Left = 24
    Top = 200
    Width = 1008
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
      2667)
    Expression = 'qyRepInff.ID_CONTRATO'
    FooterBand = QRFooterLinea
    Master = Owner
    ReprintOnNewPage = False
    object QRShape19: TQRShape
      Left = 0
      Top = 0
      Width = 253
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        0
        0
        669.395833333333)
      Brush.Color = 14737632
      Shape = qrsRectangle
    end
    object QRLabel27: TQRLabel
      Left = 10
      Top = 2
      Width = 29
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        26.4583333333333
        5.29166666666667
        76.7291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Línea:'
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
    object QRDBText21: TQRDBText
      Left = 66
      Top = 2
      Width = 77
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        174.625
        5.29166666666667
        203.729166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInff
      DataField = 'ID_CONTRATO'
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
  object QRGroupCred: TQRGroup
    Left = 24
    Top = 216
    Width = 1008
    Height = 51
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupCredBeforePrint
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      134.9375
      2667)
    Expression = 'qyRepInff.ID_CREDITO'
    FooterBand = QRFooterDisp
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText20: TQRDBText
      Left = 76
      Top = 1
      Width = 61
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        201.083333333333
        2.64583333333333
        161.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInff
      DataField = 'ID_CREDITO'
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
    object QRLabel23: TQRLabel
      Left = 10
      Top = 1
      Width = 58
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        26.4583333333333
        2.64583333333333
        153.458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Disposición:'
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
    object QRLabel9: TQRLabel
      Left = 10
      Top = 13
      Width = 29
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        26.4583333333333
        34.3958333333333
        76.7291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Línea:'
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
    object QRDBText8: TQRDBText
      Left = 76
      Top = 13
      Width = 61
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        201.083333333333
        34.3958333333333
        161.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInff
      DataField = 'ID_CONTRATO'
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
    object QRLabel1: TQRLabel
      Left = 162
      Top = 1
      Width = 39
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        428.625
        2.64583333333333
        103.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'F. Inicio'
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
    object QRDBText10: TQRDBText
      Left = 222
      Top = 1
      Width = 70
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        587.375
        2.64583333333333
        185.208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInff
      DataField = 'F_INICIO'
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
    object QRLabel4: TQRLabel
      Left = 162
      Top = 13
      Width = 38
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        428.625
        34.3958333333333
        100.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'F. Venc.'
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
    object QRDBText11: TQRDBText
      Left = 222
      Top = 13
      Width = 70
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        587.375
        34.3958333333333
        185.208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInff
      DataField = 'F_VENCIMIENTO'
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
    object QRLabel6: TQRLabel
      Left = 10
      Top = 25
      Width = 61
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        26.4583333333333
        66.1458333333333
        161.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Saldo Inicial:'
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
    object QRDBText12: TQRDBText
      Left = 76
      Top = 25
      Width = 80
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        201.083333333333
        66.1458333333333
        211.666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInff
      DataField = 'IMP_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRLabel7: TQRLabel
      Left = 162
      Top = 25
      Width = 52
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        428.625
        66.1458333333333
        137.583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sobretasa: '
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
    object QRDBText13: TQRDBText
      Left = 222
      Top = 25
      Width = 70
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        587.375
        66.1458333333333
        185.208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInff
      DataField = 'SOBRETASA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '##0.0000'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText14: TQRDBText
      Left = 76
      Top = 38
      Width = 25
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        201.083333333333
        100.541666666667
        66.1458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRepInff
      DataField = 'SIT_CREDITO'
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
    object QRLabel13: TQRLabel
      Left = 10
      Top = 38
      Width = 46
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        26.4583333333333
        100.541666666667
        121.708333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Situación:'
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
  object qyRepInff: TQuery
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
      
        '           CAST(PKGCRCOMUN.FUN_EXIGIBLE(fech.id_credito, fech.an' +
        'iomes, TO_DATE('#39'16/10/2013'#39','#39'DD/MM/YYYY'#39'), PAGO_IN_AN) AS VARCHA' +
        'R2(5)) INT_EX,'
      '           NVL(intex.imp_interes,0) AS IMPINTEX'
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
      '                      AND crc.sit_credito  = '#39'AC'#39
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
      '                          ) trans,'
      
        '             (SELECT crc.ID_CREDITO, TO_CHAR (CRI.F_VENCIMIENTO,' +
        ' '#39'YYYY/MM'#39') AS ANIOMES, CRI.IMP_INTERES'
      '               FROM cr_credito crc,'
      '                    cr_contrato cto,'
      '                    cr_producto crp,'
      '                    contrato cnt,'
      '                    cr_interes cri'
      '               WHERE 1 = 1'
      '                 AND cto.id_contrato = crc.id_contrato'
      '                 AND crc.id_credito = cri.id_credito'
      '                 AND crp.cve_producto_cre = cto.cve_producto_cre'
      '                 AND cnt.id_contrato = crc.id_contrato'
      '                 AND cri.sit_interes not in ('#39'PA'#39', '#39'CA'#39')'
      
        '                 AND cri.f_vencimiento <= TO_DATE('#39'31/07/2013'#39','#39 +
        'DD/MM/YYYY'#39')'
      '                 AND crc.sit_credito  = '#39'AC'#39
      '                 AND crc.id_credito = 333317'
      '                 ) intex'
      '        WHERE 1 = 1'
      '          AND trans.aniomes (+) = fech.aniomes'
      '          AND trans.id_credito (+) = fech.id_credito'
      '          AND intex.id_credito(+)  = fech.id_credito '
      '          AND intex.aniomes(+)     = fech.aniomes'
      
        '     ORDER BY fech.cve_moneda, fech.id_titular, fech.id_contrato' +
        ', fech.id_credito, fech.aniomes'
      ' ')
    Left = 54
    Top = 13
    object qyRepInffANIOMES: TStringField
      FieldName = 'ANIOMES'
      Size = 7
    end
    object qyRepInffID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyRepInffCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyRepInffID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qyRepInffID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object qyRepInffACREDITADO: TStringField
      FieldName = 'ACREDITADO'
      Size = 100
    end
    object qyRepInffF_INICIO: TDateTimeField
      FieldName = 'F_INICIO'
    end
    object qyRepInffF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qyRepInffIMP_CREDITO: TFloatField
      FieldName = 'IMP_CREDITO'
    end
    object qyRepInffSOBRETASA: TFloatField
      FieldName = 'SOBRETASA'
    end
    object qyRepInffTASA_APLICADA: TFloatField
      FieldName = 'TASA_APLICADA'
    end
    object qyRepInffPAGO_CP: TFloatField
      FieldName = 'PAGO_CP'
    end
    object qyRepInffPAGO_CP_AN: TFloatField
      FieldName = 'PAGO_CP_AN'
    end
    object qyRepInffIN_GENERADO: TFloatField
      FieldName = 'IN_GENERADO'
    end
    object qyRepInffPAGO_IN: TFloatField
      FieldName = 'PAGO_IN'
    end
    object qyRepInffPAGO_IN_AN: TFloatField
      FieldName = 'PAGO_IN_AN'
    end
    object qyRepInffPAGO_IN_FN: TFloatField
      FieldName = 'PAGO_IN_FN'
    end
    object qyRepInffPAGO_FN: TFloatField
      FieldName = 'PAGO_FN'
    end
    object qyRepInffPAGO_FN_AN: TFloatField
      FieldName = 'PAGO_FN_AN'
    end
    object qyRepInffSIT_CREDITO: TStringField
      FieldName = 'SIT_CREDITO'
      Size = 2
    end
    object qyRepInffINT_EX: TStringField
      FieldName = 'INT_EX'
      Size = 2
    end
    object qyRepInffIMPINTEX: TFloatField
      FieldName = 'IMPINTEX'
    end
  end
end
