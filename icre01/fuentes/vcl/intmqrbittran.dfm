object QrBitTran: TQrBitTran
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
  DataSet = qyBitTran
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
    Height = 31
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
      82.0208333333333
      2667)
    BandType = rbColumnHeader
    object QRShape17: TQRShape
      Left = 0
      Top = -1
      Width = 54
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
        142.875)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel20: TQRLabel
      Left = 4
      Top = 1
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
        2.64583333333333
        121.708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Transacción'
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
      Left = 53
      Top = -1
      Width = 55
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        140.229166666667
        -2.64583333333333
        145.520833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 61
      Top = 1
      Width = 39
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        161.395833333333
        2.64583333333333
        103.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Contrato'
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
      Left = 107
      Top = -1
      Width = 56
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        283.104166666667
        -2.64583333333333
        148.166666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Left = 118
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
        312.208333333333
        2.64583333333333
        92.6041666666667)
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
    object QRShape4: TQRShape
      Left = 162
      Top = -1
      Width = 50
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        428.625
        -2.64583333333333
        132.291666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 165
      Top = 0
      Width = 43
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        436.5625
        0
        113.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Cve. Operación'
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
      Left = 211
      Top = -1
      Width = 323
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        558.270833333333
        -2.64583333333333
        854.604166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel4: TQRLabel
      Left = 344
      Top = 0
      Width = 53
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        910.166666666667
        0
        140.229166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Descripción'
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
      Left = 533
      Top = -1
      Width = 78
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1410.22916666667
        -2.64583333333333
        206.375)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 547
      Top = 0
      Width = 53
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1447.27083333333
        0
        140.229166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Importe Neto'
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
      Left = 610
      Top = -1
      Width = 85
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1613.95833333333
        -2.64583333333333
        224.895833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel7: TQRLabel
      Left = 625
      Top = 1
      Width = 54
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1653.64583333333
        2.64583333333333
        142.875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha/Hora Alta'
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
      Left = 694
      Top = -1
      Width = 83
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1836.20833333333
        -2.64583333333333
        219.604166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Left = 717
      Top = -1
      Width = 45
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1897.0625
        -2.64583333333333
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Contrato Líquidación'
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
      Left = 913
      Top = -1
      Width = 41
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        2415.64583333333
        -2.64583333333333
        108.479166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 919
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
        2431.52083333333
        2.64583333333333
        79.375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Sit.'
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
      Left = 860
      Top = -1
      Width = 54
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
        142.875)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel12: TQRLabel
      Left = 870
      Top = -1
      Width = 36
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2301.875
        -2.64583333333333
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Usuario Cancela'
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
      Left = 776
      Top = -1
      Width = 85
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        2053.16666666667
        -2.64583333333333
        224.895833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel13: TQRLabel
      Left = 795
      Top = -1
      Width = 47
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2103.4375
        -2.64583333333333
        124.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha/Hora. Cancela'
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
    object QRShape2: TQRShape
      Left = 953
      Top = -1
      Width = 54
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        2521.47916666667
        -2.64583333333333
        142.875)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel11: TQRLabel
      Left = 963
      Top = 1
      Width = 37
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        2547.9375
        2.64583333333333
        97.8958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Sistema Origen'
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
  object QRFooterUsu: TQRBand
    Left = 24
    Top = 216
    Width = 1008
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFooterUsuBeforePrint
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
      50.2708333333333
      2667)
    BandType = rbGroupFooter
    object QRLabel5: TQRLabel
      Left = 7
      Top = 4
      Width = 166
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        18.5208333333333
        10.5833333333333
        439.208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total de Transacciones por Usuario:'
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
    object QRExpr5: TQRExpr
      Left = 174
      Top = 4
      Width = 25
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        460.375
        10.5833333333333
        66.1458333333333)
      Alignment = taLeftJustify
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
      Transparent = False
      WordWrap = True
      Expression = 'Count'
      FontSize = 7
    end
  end
  object qrbDETALLE: TQRBand
    Left = 24
    Top = 200
    Width = 1008
    Height = 16
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
      42.3333333333333
      2667)
    BandType = rbDetail
    object QRDBText23: TQRDBText
      Left = 9
      Top = 2
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        23.8125
        5.29166666666667
        108.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyBitTran
      DataField = 'ID_TRANSACCION'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText6: TQRDBText
      Left = 116
      Top = 2
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        306.916666666667
        5.29166666666667
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyBitTran
      DataField = 'ID_CREDITO'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText22: TQRDBText
      Left = 57
      Top = 2
      Width = 44
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        150.8125
        5.29166666666667
        116.416666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyBitTran
      DataField = 'ID_CONTRATO'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText1: TQRDBText
      Left = 165
      Top = 2
      Width = 44
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        436.5625
        5.29166666666667
        116.416666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyBitTran
      DataField = 'CVE_OPERACION'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText2: TQRDBText
      Left = 213
      Top = 2
      Width = 322
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        563.5625
        5.29166666666667
        851.958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyBitTran
      DataField = 'DESC_L_OPERACION'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText3: TQRDBText
      Left = 538
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
        1423.45833333333
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyBitTran
      DataField = 'IMP_NETO'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText4: TQRDBText
      Left = 614
      Top = 2
      Width = 39
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1624.54166666667
        5.29166666666667
        103.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyBitTran
      DataField = 'FH_ALTA'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText12: TQRDBText
      Left = 955
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
        2526.77083333333
        5.29166666666667
        127)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyBitTran
      DataField = 'SIST_ORIGEN'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel24: TQRLabel
      Left = 778
      Top = 2
      Width = 83
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2058.45833333333
        5.29166666666667
        219.604166666667)
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
    object QRLabel15: TQRLabel
      Left = 868
      Top = 2
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2296.58333333333
        5.29166666666667
        108.479166666667)
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
      Left = 653
      Top = 2
      Width = 43
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1727.72916666667
        5.29166666666667
        113.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyBitTran
      DataField = 'HORA_ALTA'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel17: TQRLabel
      Left = 701
      Top = 2
      Width = 74
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1854.72916666667
        5.29166666666667
        195.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel17'
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
    object QRLabel18: TQRLabel
      Left = 919
      Top = 2
      Width = 27
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2431.52083333333
        5.29166666666667
        71.4375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Sit'
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
  object QRGroupAcre: TQRGroup
    Left = 24
    Top = 163
    Width = 1008
    Height = 21
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupUsuBeforePrint
    Color = clInactiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      55.5625
      2667)
    Expression = 'qyBitTran.ID_TITULAR'
    FooterBand = QRFooterAcre
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText10: TQRDBText
      Left = 76
      Top = 3
      Width = 62
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        201.083333333333
        7.9375
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyBitTran
      DataField = 'ID_TITULAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel14: TQRLabel
      Left = 7
      Top = 3
      Width = 64
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        18.5208333333333
        7.9375
        169.333333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Acreditado:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText13: TQRDBText
      Left = 142
      Top = 3
      Width = 78
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        375.708333333333
        7.9375
        206.375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyBitTran
      DataField = 'NOM_TITULAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object QRGroupUsu: TQRGroup
    Left = 24
    Top = 184
    Width = 1008
    Height = 16
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupUsuBeforePrint
    Color = clAppWorkSpace
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
    Expression = 'qyBitTran.CVE_USU_ALTA'
    FooterBand = QRFooterUsu
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText5: TQRDBText
      Left = 50
      Top = 1
      Width = 57
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        132.291666666667
        2.64583333333333
        150.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyBitTran
      DataField = 'CVE_USU_ALTA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRLabel10: TQRLabel
      Left = 7
      Top = 1
      Width = 40
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        18.5208333333333
        2.64583333333333
        105.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Usuario:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText8: TQRDBText
      Left = 109
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
        288.395833333333
        2.64583333333333
        193.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyBitTran
      DataField = 'NOM_USU_ALTA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
  end
  object QRFooterAcre: TQRBand
    Left = 24
    Top = 235
    Width = 1008
    Height = 24
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
      63.5
      2667)
    BandType = rbGroupFooter
    object QRLabel16: TQRLabel
      Left = 7
      Top = 5
      Width = 178
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        18.5208333333333
        13.2291666666667
        470.958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total de Transacciones por Acreditado:'
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
      Left = 189
      Top = 5
      Width = 25
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        500.0625
        13.2291666666667
        66.1458333333333)
      Alignment = taLeftJustify
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
      Transparent = False
      WordWrap = True
      Expression = 'Count'
      FontSize = 7
    end
  end
  object qyBitTran: TQuery
    DatabaseName = 'BCORP'
    SQL.Strings = (
      ' select * from'
      '('
      ' SELECT CNT.ID_TITULAR,'
      
        '        CAST(pkgcrconsolidado.fun_nom_tit_cred (CNT.id_titular) ' +
        'AS VARCHAR2 (100)) NOM_TITULAR,'
      '        crt.cve_usu_alta,'
      
        '        (SELECT pf.apellido_paterno||'#39' '#39'||pf.apellido_materno||'#39 +
        ' '#39'||pf.nombre_persona as nombre'
      '           FROM persona_fisica pf, usuario usu'
      '          where pf.id_persona = usu.id_persona'
      
        '            and usu.CVE_USUARIO = crt.cve_usu_alta) nom_usu_alta' +
        ','
      
        '        crt.cve_operacion,  CAST(cro.desc_l_operacion AS VARCHAR' +
        '2(250 BYTE)) AS desc_l_operacion,'
      '        CAST(crT.TX_NOTA AS VARCHAR2(250 BYTE)) AS tx_nota,'
      
        '        crt.id_transaccion, crt.id_contrato, crt.id_credito, crt' +
        '.imp_neto,'
      
        '        cast(crt.id_cto_liq as Varchar2(20 byte)) as id_cto_liq,' +
        ' trunc(crt.fh_alta) as fh_alta, to_char(fh_alta,'#39'HH:MI:SS pm'#39')ho' +
        'ra_alta, crt.sit_transaccion,'
      '        crt.cve_usu_canc,'
      
        '        (SELECT pf.apellido_paterno||'#39' '#39'||pf.apellido_materno||'#39 +
        ' '#39'||pf.nombre_persona as nombre'
      '           FROM persona_fisica pf, usuario usu'
      '          where pf.id_persona = usu.id_persona'
      
        '            and usu.CVE_USUARIO = crt.cve_usu_canc) nom_usu_canc' +
        ','
      
        '            trunc(crt.fh_cancela) as fh_cancela, to_char(fh_canc' +
        'ela,'#39'HH:MI:SS pm'#39')hora_canc,'
      
        '        '#39' '#39' as cve_usu_autoriza, null as fh_autoriza, null as ho' +
        'ra_autoriza,'
      '        '#39'ICRE'#39' AS sist_origen'
      
        '   FROM cr_transaccion crt, cr_operacion cro, CR_CREDITO CR, CON' +
        'TRATO CNT'
      '  WHERE cro.cve_operacion = crt.cve_operacion'
      '    AND CR.ID_CREDITO = CRT.ID_CREDITO'
      '    AND CNT.ID_CONTRATO = CR.ID_CONTRATO'
      #9'and cr.id_credito = 367795'#9
      
        '    AND trunc(crt.fh_alta) between TO_DATE('#39'09/08/2013'#39','#39'DD/MM/Y' +
        'YYY'#39') and TO_DATE('#39'09/08/2013'#39','#39'DD/MM/YYYY'#39')'
      'union all'
      ' select cnt.id_titular,'
      
        '        CAST(pkgcrconsolidado.fun_nom_tit_cred (cnt.id_titular) ' +
        'AS VARCHAR2 (100)) nom_titular,'
      '        ctc.cve_usu_alta,'
      
        '        (SELECT pf.apellido_paterno ||'#39' '#39'|| pf.apellido_materno ' +
        '||'#39' '#39'|| pf.nombre_persona AS nombre'
      '           FROM persona_fisica pf, usuario usu'
      '          WHERE pf.id_persona = usu.id_persona'
      
        '            AND usu.cve_usuario = ctc.CVE_USU_ALTA ) as nom_usu_' +
        'alta,'
      '        '#39' '#39' as cve_operacion,'
      
        '        CAST('#39'SOBRETASA_ANT = '#39'|| SOBRETASA_ANT || '#39' / CVE_TAS_R' +
        'EF_ANT = '#39' || CVE_TAS_REF_ANT AS VARCHAR2(250 BYTE)) AS desc_l_o' +
        'peracion,'
      
        '        CAST('#39'SOBRETASA_NVA = '#39'|| SOBRETASA_NVA || '#39' / CVE_TAS_R' +
        'EF_NVA = '#39' || CVE_TAS_REF_NVA AS VARCHAR2(250 BYTE)) AS TX_NOTA,'
      
        '        ctc.fol_cambio as id_transaccion, crc.id_contrato, ctc.i' +
        'd_credito, 0 as imp_neto, '#39' '#39' as id_cto_liq,'
      
        '        TRUNC(FH_ALTA) AS FH_ALTA, to_char(FH_ALTA,'#39'HH:MI:SS pm'#39 +
        ') hora_alta, SIT_CAMBIO as sit_transaccion,'
      '        ctc.cve_usu_cancela as cve_usu_canc,'
      
        '        (SELECT pf.apellido_paterno||'#39' '#39'||pf.apellido_materno||'#39 +
        ' '#39'||pf.nombre_persona as nombre'
      '           FROM persona_fisica pf, usuario usu'
      '          where pf.id_persona = usu.id_persona'
      
        '            and usu.CVE_USUARIO = ctc.cve_usu_cancela) nom_usu_c' +
        'anc,'
      
        '        trunc(ctc.fh_cancela) as fh_cancela, to_char(ctc.fh_canc' +
        'ela,'#39'HH:MI:SS pm'#39') hora_canc,'
      
        '        ctc.cve_usu_autoriza, trunc(ctc.fh_autoriza) as fh_autor' +
        'iza, to_char(ctc.fh_autoriza,'#39'HH:MI:SS pm'#39') hora_autoriza,'
      '        '#39'CAMBTAS'#39' AS sist_origen'
      '   from cr_tasa_cambio CTC, cr_credito crc, contrato cnt'
      '  where 1=1'
      '    and crc.id_credito = ctc.id_credito'
      '    and cnt.id_contrato = crc.id_contrato'
      ')'
      
        '  order by id_titular, cve_usu_alta, nom_usu_alta, id_credito, f' +
        'h_alta')
    Left = 102
    Top = 13
    object qyBitTranID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object qyBitTranNOM_TITULAR: TStringField
      FieldName = 'NOM_TITULAR'
      Size = 100
    end
    object qyBitTranCVE_USU_ALTA: TStringField
      FieldName = 'CVE_USU_ALTA'
      Size = 8
    end
    object qyBitTranNOM_USU_ALTA: TStringField
      FieldName = 'NOM_USU_ALTA'
      Size = 62
    end
    object qyBitTranCVE_OPERACION: TStringField
      FieldName = 'CVE_OPERACION'
      Size = 6
    end
    object qyBitTranDESC_L_OPERACION: TStringField
      FieldName = 'DESC_L_OPERACION'
      Size = 150
    end
    object qyBitTranTX_NOTA: TStringField
      FieldName = 'TX_NOTA'
      Size = 150
    end
    object qyBitTranID_TRANSACCION: TFloatField
      FieldName = 'ID_TRANSACCION'
    end
    object qyBitTranID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qyBitTranID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyBitTranIMP_NETO: TFloatField
      FieldName = 'IMP_NETO'
    end
    object qyBitTranID_CTO_LIQ: TStringField
      FieldName = 'ID_CTO_LIQ'
    end
    object qyBitTranFH_ALTA: TDateTimeField
      FieldName = 'FH_ALTA'
    end
    object qyBitTranHORA_ALTA: TStringField
      FieldName = 'HORA_ALTA'
      Size = 11
    end
    object qyBitTranSIT_TRANSACCION: TStringField
      FieldName = 'SIT_TRANSACCION'
      Size = 2
    end
    object qyBitTranCVE_USU_CANC: TStringField
      FieldName = 'CVE_USU_CANC'
      Size = 8
    end
    object qyBitTranNOM_USU_CANC: TStringField
      FieldName = 'NOM_USU_CANC'
      Size = 62
    end
    object qyBitTranFH_CANCELA: TDateTimeField
      FieldName = 'FH_CANCELA'
    end
    object qyBitTranHORA_CANC: TStringField
      FieldName = 'HORA_CANC'
      Size = 11
    end
    object qyBitTranCVE_USU_AUTORIZA: TStringField
      FieldName = 'CVE_USU_AUTORIZA'
      Size = 8
    end
    object qyBitTranFH_AUTORIZA: TDateTimeField
      FieldName = 'FH_AUTORIZA'
    end
    object qyBitTranHORA_AUTORIZA: TStringField
      FieldName = 'HORA_AUTORIZA'
      Size = 11
    end
    object qyBitTranSIST_ORIGEN: TStringField
      FieldName = 'SIST_ORIGEN'
      Size = 7
    end
  end
end
