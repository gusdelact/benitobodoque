object QrIntAplC: TQrIntAplC
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qyIntAplC
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
  ReportTitle = 'Reporte de Integración y Aplicación'
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
  object ColumnHeaderBand1: TQRBand
    Left = 24
    Top = 132
    Width = 1008
    Height = 36
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
      95.25
      2667)
    BandType = rbColumnHeader
    object QRShape18: TQRShape
      Left = 0
      Top = 0
      Width = 52
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
        137.583333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrshF_OPERA: TQRShape
      Left = 442
      Top = 0
      Width = 95
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        1169.45833333333
        0
        251.354166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrshTIPOCALC: TQRShape
      Left = 51
      Top = 0
      Width = 298
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        134.9375
        0
        788.458333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrshCVETASA: TQRShape
      Left = 348
      Top = 0
      Width = 95
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        920.75
        0
        251.354166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Left = 181
      Top = 1
      Width = 51
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        478.895833333333
        2.64583333333333
        134.9375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
    object QRLabel9: TQRLabel
      Left = 372
      Top = 1
      Width = 48
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        984.25
        2.64583333333333
        127)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Comisión Cobrada'
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
    object QRLabel10: TQRLabel
      Left = 459
      Top = 1
      Width = 63
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        82.0208333333333
        1214.4375
        2.64583333333333
        166.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Estimación Preventiva por Riesgos Actual'
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
      Left = 536
      Top = 0
      Width = 95
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        1418.16666666667
        0
        251.354166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape2: TQRShape
      Left = 630
      Top = 0
      Width = 95
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        1666.875
        0
        251.354166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape3: TQRShape
      Left = 724
      Top = 0
      Width = 95
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        1915.58333333333
        0
        251.354166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape4: TQRShape
      Left = 818
      Top = 0
      Width = 95
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        2164.29166666667
        0
        251.354166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape5: TQRShape
      Left = 912
      Top = 0
      Width = 95
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        2413
        0
        251.354166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 554
      Top = 1
      Width = 61
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        1465.79166666667
        2.64583333333333
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Premio Posible a Otorgar Actual'
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
      Left = 648
      Top = 1
      Width = 63
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        82.0208333333333
        1714.5
        2.64583333333333
        166.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Exceso de EPRC sobre PPO'
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
      Left = 733
      Top = 1
      Width = 78
      Height = 29
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        76.7291666666667
        1939.39583333333
        2.64583333333333
        206.375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'P. Posible a Otorgar Provisionado topado a PPO'
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
    object QRLabel6: TQRLabel
      Left = 830
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
        2196.04166666667
        2.64583333333333
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Total Reservado y Provisionado topado a PPO'
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
      Left = 935
      Top = 1
      Width = 54
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        2473.85416666667
        2.64583333333333
        142.875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Diferencia contra PPO'
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
      Left = 11
      Top = 1
      Width = 29
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        29.1041666666667
        2.64583333333333
        76.7291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Crédito'
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
  object qrbDETALLE: TQRBand
    Left = 24
    Top = 168
    Width = 1008
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
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
      31.75
      2667)
    BandType = rbDetail
    object QRDBText16: TQRDBText
      Left = -7
      Top = -1
      Width = 46
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        -18.5208333333333
        -2.64583333333333
        121.708333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyIntAplC
      DataField = 'ID_CREDITO'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText18: TQRDBText
      Left = 350
      Top = -1
      Width = 89
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        926.041666666667
        -2.64583333333333
        235.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyIntAplC
      DataField = 'COMISION_COBRADA'
      Mask = '###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText2: TQRDBText
      Left = 447
      Top = -1
      Width = 89
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1182.6875
        -2.64583333333333
        235.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyIntAplC
      DataField = 'IMP_ESTIMACION'
      Mask = '###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText4: TQRDBText
      Left = 540
      Top = -1
      Width = 89
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1428.75
        -2.64583333333333
        235.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyIntAplC
      DataField = 'IMP_PREMIO'
      Mask = '###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText7: TQRDBText
      Left = 634
      Top = -1
      Width = 89
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1677.45833333333
        -2.64583333333333
        235.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyIntAplC
      DataField = 'EXCESO'
      Mask = '###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText8: TQRDBText
      Left = 728
      Top = -1
      Width = 89
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1926.16666666667
        -2.64583333333333
        235.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyIntAplC
      DataField = 'PPOTOPADO'
      Mask = '###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText9: TQRDBText
      Left = 823
      Top = -1
      Width = 89
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2177.52083333333
        -2.64583333333333
        235.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyIntAplC
      DataField = 'TOTRESERVADO'
      Mask = '###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText10: TQRDBText
      Left = 916
      Top = -1
      Width = 89
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2423.58333333333
        -2.64583333333333
        235.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyIntAplC
      DataField = 'DIFERENCIA'
      Mask = '###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText1: TQRDBText
      Left = 53
      Top = 0
      Width = 294
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        140.229166666667
        0
        777.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyIntAplC
      DataField = 'ACREDITADO'
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
  end
  object SummaryBand1: TQRBand
    Left = 24
    Top = 180
    Width = 1008
    Height = 19
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
      50.2708333333333
      2667)
    BandType = rbSummary
    object QRLabel13: TQRLabel
      Left = 248
      Top = 6
      Width = 73
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        656.166666666667
        15.875
        193.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total de Registros:'
      Color = clWhite
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
    object QRExpr6: TQRExpr
      Left = 322
      Top = 6
      Width = 24
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        851.958333333333
        15.875
        63.5)
      Alignment = taLeftJustify
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
      Expression = 'COUNT'
      FontSize = 6
    end
    object QRExpr15: TQRExpr
      Left = 350
      Top = 6
      Width = 90
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        926.041666666667
        15.875
        238.125)
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
      Expression = 'SUM(qyIntAplC.COMISION_COBRADA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr10: TQRExpr
      Left = 447
      Top = 6
      Width = 90
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1182.6875
        15.875
        238.125)
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
      Expression = 'SUM(qyIntAplC.IMP_ESTIMACION)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr11: TQRExpr
      Left = 540
      Top = 6
      Width = 90
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1428.75
        15.875
        238.125)
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
      Expression = 'SUM(qyIntAplC.IMP_PREMIO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr12: TQRExpr
      Left = 634
      Top = 6
      Width = 90
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1677.45833333333
        15.875
        238.125)
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
      Expression = 'SUM(qyIntAplC.EXCESO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr13: TQRExpr
      Left = 728
      Top = 6
      Width = 90
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1926.16666666667
        15.875
        238.125)
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
      Expression = 'SUM(qyIntAplC.PPOTOPADO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr14: TQRExpr
      Left = 823
      Top = 6
      Width = 90
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2177.52083333333
        15.875
        238.125)
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
      Expression = 'SUM(qyIntAplC.TOTRESERVADO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr16: TQRExpr
      Left = 916
      Top = 6
      Width = 90
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2423.58333333333
        15.875
        238.125)
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
      Expression = 'SUM(qyIntAplC.DIFERENCIA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRShape8: TQRShape
      Left = 338
      Top = 3
      Width = 669
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        894.291666666667
        7.9375
        1770.0625)
      Pen.Color = clSilver
      Shape = qrsHorLine
    end
  end
  object qyIntAplC: TQuery
    DatabaseName = 'BCORP'
    SQL.Strings = (
      'SELECT ppo.id_credito, ppo.id_contrato, ppo.f_cierre,'
      '      coms.comis_cob comision_cobrada,'
      '       ppo.imp_estimacion,'
      
        '       ppo.imp_premio, ppo.exceso, ppo.ppotopado, ppo.totreserva' +
        'do,'
      
        '       ppo.imp_premio - ppo.totreservado diferencia, ABS(ppo.exc' +
        'eso) faltante,'
      
        '       ppo.cve_producto_gpo, ppo.desc_c_prod_gpo, ppo.id_titular' +
        ','
      '       ppo.acreditado, ppo.sit_credito, cppp.sit_ppo_premio'
      
        '  FROM (SELECT f_cierre, id_credito, imp_estimacion, imp_premio,' +
        ' exceso,'
      '               ppotopado,'
      '               CASE'
      '                  WHEN imp_estimacion > imp_premio'
      '                     THEN imp_premio'
      '                  ELSE imp_estimacion + ppotopado'
      '               END totreservado,'
      
        '               id_contrato, sit_credito, cve_producto_gpo, desc_' +
        'c_prod_gpo,'
      
        '               cve_producto_cre, desc_c_producto, id_titular, ac' +
        'reditado'
      
        '          FROM (SELECT crh.f_cierre, crh.id_credito, crh.imp_est' +
        'imacion,'
      '                       crh.imp_premio,'
      '                       CASE'
      
        '                          WHEN crh.imp_estimacion < crh.imp_prem' +
        'io'
      '                             THEN 0'
      
        '                          ELSE crh.imp_estimacion - crh.imp_prem' +
        'io'
      '                       END exceso,'
      '                       CASE'
      
        '                          WHEN crh.imp_estimacion > crh.imp_prem' +
        'io'
      '                             THEN 0'
      
        '                          ELSE crh.imp_premio - crh.imp_estimaci' +
        'on'
      '                       END ppotopado,'
      
        '                       cr.id_contrato, cr.sit_credito, crp.cve_p' +
        'roducto_gpo,'
      
        '                       cpg.desc_c_prod_gpo, crc.cve_producto_cre' +
        ','
      '                       crp.desc_c_producto, cont.id_titular,'
      
        '                       cast(pkgcrconsolidado.fun_nom_tit_cred(co' +
        'nt.id_titular)as varchar2(100)) acreditado'
      '                  FROM cr_ppo_histo crh,'
      '                       cr_credito cr,'
      '                       cr_contrato crc,'
      '                       cr_producto crp,'
      '                       cr_producto_gpo cpg,'
      '                       contrato cont'
      '                 WHERE 1 = 1'
      
        '                   AND crh.f_cierre = TO_DATE ('#39'31/01/2012'#39', '#39'DD' +
        '/MM/YYYY'#39')'
      '                   AND cr.id_credito = crh.id_credito'
      '                   AND cr.id_contrato = crc.id_contrato'
      '                   AND crc.id_contrato = cont.id_contrato'
      
        '                   AND crc.cve_producto_cre = crp.cve_producto_c' +
        're'
      
        '                   AND crp.cve_producto_gpo = cpg.cve_producto_g' +
        'po)) ppo,'
      '       cr_ppo_premio cppp,'
      '   (SELECT   id_credito, SUM (comision_cobrada) comis_cob'
      
        #9'    FROM (SELECT   id_credito, NVL (SUM (imp_pagado), 0) comisi' +
        'on_cobrada'
      #9'              FROM cr_comision'
      #9'             WHERE f_pago >= (SELECT f_comis_arran'
      #9'                                FROM cr_ppo_param'
      #9'                               WHERE cve_ppo_param = '#39'CREDPP'#39')'
      '             and f_pago <= TO_DATE ('#39'30/11/2012'#39', '#39'DD/MM/YYYY'#39')'
      #9'          GROUP BY id_credito'
      #9'          UNION'
      #9'          SELECT   id_credito, NVL (SUM (imp_comis_arran), 0) '
      #9'              FROM cr_ppo_premio'
      #9'          GROUP BY id_credito)'
      '    GROUP BY id_credito) coms'
      ' WHERE 1 = 1 '
      '   AND cppp.id_credito = ppo.id_credito'
      '   AND coms.id_credito = ppo.id_credito')
    Left = 102
    Top = 13
    object qyIntAplCID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyIntAplCID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qyIntAplCF_CIERRE: TDateTimeField
      FieldName = 'F_CIERRE'
    end
    object qyIntAplCCOMISION_COBRADA: TFloatField
      FieldName = 'COMISION_COBRADA'
    end
    object qyIntAplCIMP_ESTIMACION: TFloatField
      FieldName = 'IMP_ESTIMACION'
    end
    object qyIntAplCIMP_PREMIO: TFloatField
      FieldName = 'IMP_PREMIO'
    end
    object qyIntAplCEXCESO: TFloatField
      FieldName = 'EXCESO'
    end
    object qyIntAplCPPOTOPADO: TFloatField
      FieldName = 'PPOTOPADO'
    end
    object qyIntAplCTOTRESERVADO: TFloatField
      FieldName = 'TOTRESERVADO'
    end
    object qyIntAplCDIFERENCIA: TFloatField
      FieldName = 'DIFERENCIA'
    end
    object qyIntAplCFALTANTE: TFloatField
      FieldName = 'FALTANTE'
    end
    object qyIntAplCCVE_PRODUCTO_GPO: TStringField
      FieldName = 'CVE_PRODUCTO_GPO'
      Size = 6
    end
    object qyIntAplCDESC_C_PROD_GPO: TStringField
      FieldName = 'DESC_C_PROD_GPO'
      Size = 30
    end
    object qyIntAplCID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object qyIntAplCACREDITADO: TStringField
      FieldName = 'ACREDITADO'
      Size = 100
    end
    object qyIntAplCSIT_CREDITO: TStringField
      FieldName = 'SIT_CREDITO'
      Size = 2
    end
    object qyIntAplCSIT_PPO_PREMIO: TStringField
      FieldName = 'SIT_PPO_PREMIO'
      Size = 2
    end
  end
end
