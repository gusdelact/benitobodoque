object QrPrVeA: TQrPrVeA
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qyPrVeA
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
  Page.Orientation = poPortrait
  Page.PaperSize = Letter
  Page.Values = (
    100
    2794
    100
    2159
    100
    100
    0)
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = Auto
  PrintIfEmpty = True
  SnapToGrid = True
  Units = MM
  Zoom = 100
  object QRBand1: TQRBand
    Left = 38
    Top = 38
    Width = 740
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
      1957.91666666667)
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
        1957.91666666667)
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
    Top = 122
    Width = 740
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
      1957.91666666667)
    BandType = rbColumnHeader
    object QRShape3: TQRShape
      Left = 664
      Top = 1
      Width = 75
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1756.83333333333
        2.64583333333333
        198.4375)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape31: TQRShape
      Left = 392
      Top = 1
      Width = 89
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1037.16666666667
        2.64583333333333
        235.479166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape7: TQRShape
      Left = 308
      Top = 1
      Width = 89
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        814.916666666667
        2.64583333333333
        235.479166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape14: TQRShape
      Left = 574
      Top = 1
      Width = 91
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1518.70833333333
        2.64583333333333
        240.770833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape1: TQRShape
      Left = 1
      Top = 1
      Width = 193
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        2.64583333333333
        2.64583333333333
        510.645833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape2: TQRShape
      Left = 193
      Top = 1
      Width = 119
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        510.645833333333
        2.64583333333333
        314.854166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape6: TQRShape
      Left = 480
      Top = 1
      Width = 97
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1270
        2.64583333333333
        256.645833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabelNOMBRE: TQRLabel
      Left = 72
      Top = 1
      Width = 73
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        190.5
        2.64583333333333
        193.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Acreditado / Emisor'
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
    object QRLabelID_CREDITO: TQRLabel
      Left = 240
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
        635
        2.64583333333333
        79.375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Credito    '
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
      Left = 504
      Top = 1
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1333.5
        2.64583333333333
        127)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Interés'
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
      Left = 336
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
        889
        2.64583333333333
        105.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Capital'
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
      Left = 416
      Top = 1
      Width = 52
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1100.66666666667
        2.64583333333333
        137.583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Finan. Adic'
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
      Left = 672
      Top = 1
      Width = 59
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1778
        2.64583333333333
        156.104166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'F_ Vencimiento'
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
    object QRLabel1: TQRLabel
      Left = 592
      Top = 1
      Width = 59
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1566.33333333333
        2.64583333333333
        156.104166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe Total'
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
  object QRBandDetalle: TQRBand
    Left = 38
    Top = 218
    Width = 740
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBandDetalleBeforePrint
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      31.75
      1957.91666666667)
    BandType = rbDetail
    object QRDBNOMBRE: TQRDBText
      Left = 2
      Top = 2
      Width = 183
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        5.29166666666667
        5.29166666666667
        484.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyPrVeA
      DataField = 'NOMBRE'
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
    object QRDBNOM_PROVEEDOR: TQRDBText
      Left = 241
      Top = 2
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        637.645833333333
        5.29166666666667
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyPrVeA
      DataField = 'ID_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 5
    end
    object QRDBText3: TQRDBText
      Left = 506
      Top = 2
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1338.79166666667
        5.29166666666667
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyPrVeA
      DataField = 'INTERES'
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
    object QRDBText4: TQRDBText
      Left = 328
      Top = 2
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        867.833333333333
        5.29166666666667
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyPrVeA
      DataField = 'CAPITAL'
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
    object QRDBText5: TQRDBText
      Left = 416
      Top = 2
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1100.66666666667
        5.29166666666667
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyPrVeA
      DataField = 'FINAN_ADIC'
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
    object QRDBText6: TQRDBText
      Left = 680
      Top = 2
      Width = 54
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1799.16666666667
        5.29166666666667
        142.875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyPrVeA
      DataField = 'F_VENCIMIENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = 'DD/MM/YYYY'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRExpr14: TQRExpr
      Left = 592
      Top = 2
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1566.33333333333
        5.29166666666667
        156.104166666667)
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
      Expression = 'SUM(qyPrVeA.CAPITAL+qyPrVeA.INTERES+qyPrVeA.FINAN_ADIC)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRBNombre: TQRBand
    Left = 38
    Top = 230
    Width = 740
    Height = 0
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
      0
      1957.91666666667)
    BandType = rbGroupFooter
    object QRExpr61: TQRExpr
      Left = 320
      Top = 2
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        846.666666666667
        5.29166666666667
        156.104166666667)
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
      Expression = 'SUM(qyPrVeA.IMP_CREDITO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr62: TQRExpr
      Left = 381
      Top = 2
      Width = 53
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
        140.229166666667)
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
      Expression = 'SUM(qyPrVeA.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr63: TQRExpr
      Left = 436
      Top = 2
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1153.58333333333
        5.29166666666667
        156.104166666667)
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
      Expression = 'SUM(qyPrVeA.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr64: TQRExpr
      Left = 496
      Top = 2
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1312.33333333333
        5.29166666666667
        156.104166666667)
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
      Expression = 'SUM(qyPrVeA.IMP_FA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr65: TQRExpr
      Left = 556
      Top = 2
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1471.08333333333
        5.29166666666667
        140.229166666667)
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
      Expression = 'SUM(qyPrVeA.IMP_INTERES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr66: TQRExpr
      Left = 610
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
        1613.95833333333
        5.29166666666667
        127)
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
      Expression = 'SUM(qyPrVeA.IMP_COMISIONES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr67: TQRExpr
      Left = 659
      Top = 2
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1743.60416666667
        5.29166666666667
        111.125)
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
      Expression = 'SUM(qyPrVeA.IMP_IVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr68: TQRExpr
      Left = 702
      Top = 2
      Width = 49
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1857.375
        5.29166666666667
        129.645833333333)
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
      Expression = 'SUM(qyPrVeA.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr69: TQRExpr
      Left = 752
      Top = 2
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1989.66666666667
        5.29166666666667
        156.104166666667)
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
      Expression = 'SUM(qyPrVeA.IMP_FEGA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr70: TQRExpr
      Left = 812
      Top = 2
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2148.41666666667
        5.29166666666667
        158.75)
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
      Expression = 'SUM(qyPrVeA.IMP_BINTER)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr71: TQRExpr
      Left = 873
      Top = 2
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2309.8125
        5.29166666666667
        158.75)
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
      Expression = 
        'SUM(qyPrVeA.IMP_CAPITAL + qyPrVeA.IMP_FA + qyPrVeA.IMP_INTERES +' +
        ' qyPrVeA.IMP_COMISIONES + qyPrVeA.IMP_IVA + qyConsImpa.MORATORIO' +
        'S)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRDBText2: TQRDBText
      Left = 2
      Top = 2
      Width = 151
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        5.29166666666667
        5.29166666666667
        399.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyPrVeA
      DataField = 'NOMBRE'
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
    object QRDBText9: TQRDBText
      Left = 160
      Top = 2
      Width = 153
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        423.333333333333
        5.29166666666667
        404.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyPrVeA
      DataField = 'NOM_PROVEEDOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 5
    end
  end
  object QRGroupMoneda: TQRGroup
    Left = 38
    Top = 148
    Width = 740
    Height = 17
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
      44.9791666666667
      1957.91666666667)
    Expression = 'qyPrVeA.CVE_MONEDA'
    FooterBand = QRFooterMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRShape5: TQRShape
      Left = 1
      Top = 3
      Width = 192
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        2.64583333333333
        7.9375
        508)
      Brush.Color = clYellow
      Shape = qrsRectangle
    end
    object QRLabel5: TQRLabel
      Left = 10
      Top = 4
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        26.4583333333333
        10.5833333333333
        132.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Moneda :'
      Color = clYellow
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
    object QRDBText1: TQRDBText
      Left = 56
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
        148.166666666667
        10.5833333333333
        121.708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clYellow
      DataSet = qyPrVeA
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
    object QRDBDESC_MONEDA: TQRDBText
      Left = 106
      Top = 4
      Width = 84
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        280.458333333333
        10.5833333333333
        222.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clYellow
      DataSet = qyPrVeA
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
  object QRGroupF_Vencim: TQRGroup
    Left = 38
    Top = 165
    Width = 740
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
      1957.91666666667)
    Expression = 'qyPrVeA.F_VENCIMIENTO'
    FooterBand = QRFooterDia
    Master = Owner
    ReprintOnNewPage = False
    object QRShape4: TQRShape
      Left = 1
      Top = 2
      Width = 192
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2.64583333333333
        5.29166666666667
        508)
      Brush.Color = clNone
      Shape = qrsRectangle
    end
    object QRDBText7: TQRDBText
      Left = 85
      Top = 2
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        224.895833333333
        5.29166666666667
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clNone
      DataSet = qyPrVeA
      DataField = 'F_VENCIMIENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = 'DD/MM/YYYY'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRLabel6: TQRLabel
      Left = 10
      Top = 2
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        26.4583333333333
        5.29166666666667
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'F_Vencimiento'
      Color = clNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
  end
  object QRGroupPromAsoc: TQRGroup
    Left = 38
    Top = 183
    Width = 740
    Height = 17
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupPromAsocBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      44.9791666666667
      1957.91666666667)
    Expression = 'qyPrVeA.ID_PERS_ASOCIAD'
    Master = Owner
    ReprintOnNewPage = False
    object QRLabelPromAsoc: TQRLabel
      Left = 49
      Top = 3
      Width = 81
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        129.645833333333
        7.9375
        214.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Promotor Asociado :'
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
    object QRDBID_PERS_ASOCIAD: TQRDBText
      Left = 133
      Top = 3
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        351.895833333333
        7.9375
        127)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyPrVeA
      DataField = 'ID_PERS_ASOCIAD'
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
    object QRDBNOM_PROMOTOR_ASO: TQRDBText
      Left = 185
      Top = 3
      Width = 200
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        489.479166666667
        7.9375
        529.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyPrVeA
      DataField = 'NOM_PROMOTOR_ASO'
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
  object QRGroupPromAdm: TQRGroup
    Left = 38
    Top = 200
    Width = 740
    Height = 18
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupPromAdmBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      47.625
      1957.91666666667)
    Expression = 'qyPrVeA.ID_PROM_ADM'
    Master = Owner
    ReprintOnNewPage = False
    object QRLabelPromAdm: TQRLabel
      Left = 116
      Top = 2
      Width = 54
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
        142.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Prom. Admin :'
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
    object QRDBID_PROM_ADM: TQRDBText
      Left = 173
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
        457.729166666667
        5.29166666666667
        127)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyPrVeA
      DataField = 'ID_PROM_ADM'
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
    object QRDBNOM_PROMOTOR_ADM: TQRDBText
      Left = 225
      Top = 2
      Width = 200
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        595.3125
        5.29166666666667
        529.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyPrVeA
      DataField = 'NOM_PROMOTOR_ADM'
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
  object QRGNombre: TQRGroup
    Left = 38
    Top = 218
    Width = 740
    Height = 0
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
      0
      1957.91666666667)
    Expression = ' qyPrVeA.NOMBRE  +  qyPrVeA.NOM_PROVEEDOR'
    FooterBand = QRBNombre
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRFooterDia: TQRBand
    Left = 38
    Top = 230
    Width = 740
    Height = 22
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFooterDiaBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      58.2083333333333
      1957.91666666667)
    BandType = rbGroupFooter
    object QRLabel45: TQRLabel
      Left = 226
      Top = 4
      Width = 53
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        597.958333333333
        10.5833333333333
        140.229166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total x Dia'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRExpr3: TQRExpr
      Left = 328
      Top = 7
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        867.833333333333
        18.5208333333333
        140.229166666667)
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
      Expression = 'SUM(qyPrVeA.CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr7: TQRExpr
      Left = 416
      Top = 7
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1100.66666666667
        18.5208333333333
        140.229166666667)
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
      Expression = 'SUM(qyPrVeA.FINAN_ADIC)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr54: TQRExpr
      Left = 506
      Top = 7
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1338.79166666667
        18.5208333333333
        140.229166666667)
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
      Expression = 'SUM(qyPrVeA.INTERES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr1: TQRExpr
      Left = 599
      Top = 7
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1584.85416666667
        18.5208333333333
        140.229166666667)
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
      Expression = 'SUM(qyPrVeA.CAPITAL+qyPrVeA.FINAN_ADIC+qyPrVeA.INTERES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRFooterMoneda: TQRBand
    Left = 38
    Top = 252
    Width = 740
    Height = 31
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFooterDiaBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      82.0208333333333
      1957.91666666667)
    BandType = rbGroupFooter
    object QRLabel2: TQRLabel
      Left = 193
      Top = 6
      Width = 87
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        510.645833333333
        15.875
        230.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total x Moneda'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRExpr2: TQRExpr
      Left = 328
      Top = 9
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        867.833333333333
        23.8125
        140.229166666667)
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
      Expression = 'SUM(qyPrVeA.CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr4: TQRExpr
      Left = 416
      Top = 9
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1100.66666666667
        23.8125
        140.229166666667)
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
      Expression = 'SUM(qyPrVeA.FINAN_ADIC)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr5: TQRExpr
      Left = 506
      Top = 9
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1338.79166666667
        23.8125
        140.229166666667)
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
      Expression = 'SUM(qyPrVeA.INTERES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr6: TQRExpr
      Left = 599
      Top = 9
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1584.85416666667
        23.8125
        140.229166666667)
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
      Expression = 'SUM(qyPrVeA.CAPITAL+qyPrVeA.FINAN_ADIC+qyPrVeA.INTERES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object qyPrVeA: TQuery
    DatabaseName = 'NCORP'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT FECHAS.F_VENCIMIENTO,'
      '       CCR.ID_CREDITO, CCR.ID_CONTRATO, CCT.CVE_PRODUCTO_CRE,'
      '       CTO.CVE_MONEDA,'
      
        '       (SELECT DESC_MONEDA FROM MONEDA WHERE CVE_MONEDA = CTO.CV' +
        'E_MONEDA) AS DESC_MONEDA, '
      '       CTO.ID_PERS_ASOCIAD,'
      
        '       (SELECT NOMBRE FROM PERSONA WHERE ID_PERSONA = CTO.ID_PER' +
        'S_ASOCIAD) AS NOM_PROMOTOR_ASO,'
      '       CCR.ID_PROM_ADM,'
      
        '       (SELECT NOMBRE FROM PERSONA WHERE ID_PERSONA = CCR.ID_PRO' +
        'M_ADM) AS NOM_PROMOTOR_ADM,'
      '       CTO.ID_TITULAR,          '
      
        '       (SELECT NOMBRE FROM PERSONA WHERE ID_PERSONA = CTO.ID_TIT' +
        'ULAR) AS NOMBRE,'
      #9'   CRP.CVE_PRODUCTO_GPO,'#9'   '
      '       ADEUDO.CAPITAL,'
      '       ADEUDO.INTERES,'
      '       ADEUDO.FINAN_ADIC'
      '  FROM CR_CREDITO CCR,'
      '       CR_CONTRATO CCT,'
      '       CONTRATO CTO,'
      #9'   CR_PRODUCTO CRP,'
      #9'   (SELECT DISTINCT(F_VENCIMIENTO), ID_CREDITO FROM CR_CAPITAL'
      '         WHERE SIT_CAPITAL IN ('#39'AC'#39','#39'PA'#39')  '
      '        UNION'
      
        '        SELECT DISTINCT(F_VENCIMIENTO), ID_CREDITO FROM CR_INTER' +
        'ES'
      '         WHERE SIT_INTERES IN ('#39'AC'#39') '
      '        UNION'
      
        '        SELECT DISTINCT(F_VENCIMIENTO), ID_CREDITO FROM CR_FINAN' +
        '_ADIC'
      '         WHERE SIT_FINAN_ADIC IN ('#39'AC'#39','#39'PA'#39') ) FECHAS, '
      '        '
      
        '       (SELECT ID_CREDITO, F_VENCIMIENTO , SUM(ADEUDO_CP) AS CAP' +
        'ITAL, SUM(ADEUDO_IN ) AS INTERES, SUM(ADEUDO_FN) AS FINAN_ADIC  ' +
        ' '
      '          FROM ('
      '                SELECT ID_CREDITO, F_VENCIMIENTO, NUM_PERIODO,'
      
        '                   SUM(IMP_CAPITAL - PKGCRCOMUN.STPOBTIMPPAG ('#39'C' +
        'P'#39','#39'IMPBRU'#39',CR_CAPITAL.ID_CREDITO,NUM_PERIODO,NULL,F_PROG_PAGO,'#39 +
        'V'#39','#39'F'#39') + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) ) AS ADEUDO_CP ,'
      '                      0 AS ADEUDO_IN , 0 AS  ADEUDO_FN'
      '                  FROM CR_CAPITAL'
      #9#9'     ,('
      #9#9'       SELECT CT.ID_CREDITO, CT.ID_PERIODO,'
      #9#9'              NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP'
      #9#9'         FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'
      #9#9'        WHERE 1=1'
      #9#9'          AND CT.SIT_TRANSACCION = '#39'AC'#39
      #9#9'          AND CT.ID_TRANS_CANCELA IS NULL'
      #9#9'          AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION'
      #9#9'          AND CT.CVE_OPERACION IN ('#39'PGDMCP'#39')'
      #9#9'          AND CDT.CVE_CONCEPTO IN ('#39'IMPBRU'#39')'
      #9#9'        GROUP BY CT.ID_CREDITO, CT.ID_PERIODO'
      #9#9'      ) CA_HIST_PGDMCP'
      '                 WHERE SIT_CAPITAL IN ('#39'AC'#39','#39'PA'#39')'
      
        '        '#9'   AND CA_HIST_PGDMCP.ID_CREDITO (+)= CR_CAPITAL.ID_CRE' +
        'DITO'
      #9#9'   AND CA_HIST_PGDMCP.ID_PERIODO (+)= CR_CAPITAL.NUM_PERIODO'
      
        '                 GROUP BY CR_CAPITAL.ID_CREDITO, F_VENCIMIENTO, ' +
        'NUM_PERIODO'
      '             UNION'
      
        '                SELECT ID_CREDITO, F_VENCIMIENTO , NUM_PERIODO, ' +
        '0 AS ADEUDO_CP,'
      
        '                   SUM(IMP_INTERES - PKGCRCOMUN.STPOBTIMPPAG ('#39'I' +
        'N'#39','#39'IMPBRU'#39',ID_CREDITO,NUM_PERIODO,NULL,F_PROG_PAGO,'#39'V'#39','#39'F'#39')) AS' +
        ' ADEUDO_IN , 0 AS  ADEUDO_FN'
      '                  FROM CR_INTERES    '
      '                 WHERE SIT_INTERES IN ('#39'AC'#39') '
      '                 GROUP BY ID_CREDITO, F_VENCIMIENTO, NUM_PERIODO'
      '             UNION'
      
        '                SELECT ID_CREDITO, F_VENCIMIENTO, NUM_PERIODO,0 ' +
        'AS ADEUDO_CP, 0 AS ADEUDO_IN,'
      
        '                   SUM(IMP_FINAN_ADIC - PKGCRCOMUN.STPOBTIMPPAG ' +
        '('#39'FN'#39','#39'IMPBRU'#39',ID_CREDITO,NUM_PERIODO,NULL,F_PROG_PAGO,'#39'V'#39','#39'F'#39'))' +
        ' AS ADEUDO_FN'
      '                  FROM CR_FINAN_ADIC'
      '                 WHERE SIT_FINAN_ADIC IN ('#39'AC'#39','#39'PA'#39')'
      
        '                 GROUP BY ID_CREDITO, F_VENCIMIENTO, NUM_PERIODO' +
        ')'
      '         GROUP BY ID_CREDITO, F_VENCIMIENTO ) ADEUDO'
      ' ')
    Left = 165
    Top = 9
  end
end
