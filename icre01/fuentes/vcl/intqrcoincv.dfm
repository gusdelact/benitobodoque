object QRCarteraVig: TQRCarteraVig
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = QCarteVig
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
    100
    2159
    100
    2794
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
    Width = 980
    Height = 84
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
      222.25
      2592.91666666667)
    BandType = rbPageHeader
    object QRInterEncabezado1: TQRInterEncabezado
      Left = 0
      Top = 0
      Width = 980
      Height = 84
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        222.25
        0
        0
        2592.91666666667)
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
  object QRBand2: TQRBand
    Left = 38
    Top = 122
    Width = 980
    Height = 23
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clBlack
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      60.8541666666667
      2592.91666666667)
    BandType = rbColumnHeader
    object QRLabel1: TQRLabel
      Left = 8
      Top = 5
      Width = 34
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        21.1666666666667
        13.2291666666667
        89.9583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'SECTOR'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel3: TQRLabel
      Left = 640
      Top = 5
      Width = 71
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1693.33333333333
        13.2291666666667
        187.854166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'SALDO INSOLUTO'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel6: TQRLabel
      Left = 872
      Top = 5
      Width = 51
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2307.16666666667
        13.2291666666667
        134.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'COMISIONES'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel7: TQRLabel
      Left = 768
      Top = 5
      Width = 63
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2032
        13.2291666666667
        166.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'SDO PROMEDIO'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel8: TQRLabel
      Left = 152
      Top = 5
      Width = 53
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        402.166666666667
        13.2291666666667
        140.229166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ACREDITADO'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel10: TQRLabel
      Left = 320
      Top = 5
      Width = 49
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        846.666666666667
        13.2291666666667
        129.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'P ASOCIADO'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel11: TQRLabel
      Left = 472
      Top = 5
      Width = 38
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1248.83333333333
        13.2291666666667
        100.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'P ADMON'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object QRBand3: TQRBand
    Left = 38
    Top = 164
    Width = 980
    Height = 11
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
      29.1041666666667
      2592.91666666667)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 152
      Top = 1
      Width = 147
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        402.166666666667
        2.64583333333333
        388.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'ACREDITADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText2: TQRDBText
      Left = 8
      Top = 1
      Width = 137
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        21.1666666666667
        2.64583333333333
        362.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'MERC_OBJ_DET'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText4: TQRDBText
      Left = 640
      Top = 1
      Width = 65
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1693.33333333333
        2.64583333333333
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'SALDO_INSOLUTO'
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
    object QRDBText5: TQRDBText
      Left = 768
      Top = 1
      Width = 66
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2032
        2.64583333333333
        174.625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'SALDO_PROMEDIO'
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
      Left = 872
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
        2307.16666666667
        2.64583333333333
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'COMISIONES'
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
    object QRDBText12: TQRDBText
      Left = 320
      Top = 1
      Width = 123
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        846.666666666667
        2.64583333333333
        325.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'PROMOTOR_ASOCIADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText13: TQRDBText
      Left = 472
      Top = 1
      Width = 131
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1248.83333333333
        2.64583333333333
        346.604166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'PROMOTOR_ADMIN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
  end
  object QRBand4: TQRBand
    Left = 38
    Top = 175
    Width = 980
    Height = 12
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
      31.75
      2592.91666666667)
    BandType = rbGroupFooter
    object QRExpr1: TQRExpr
      Left = 640
      Top = 3
      Width = 77
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1693.33333333333
        7.9375
        203.729166666667)
      Alignment = taLeftJustify
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QCarteVig.SALDO_INSOLUTO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr3: TQRExpr
      Left = 768
      Top = 3
      Width = 67
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2032
        7.9375
        177.270833333333)
      Alignment = taLeftJustify
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QCarteVig.SALDO_PROMEDIO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr6: TQRExpr
      Left = 872
      Top = 3
      Width = 67
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2307.16666666667
        7.9375
        177.270833333333)
      Alignment = taLeftJustify
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QCarteVig.COMISIONES)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRShape1: TQRShape
      Left = 409
      Top = 1
      Width = 558
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        1082.14583333333
        2.64583333333333
        1476.375)
      Shape = qrsRectangle
    end
    object QRDBText9: TQRDBText
      Left = 152
      Top = 3
      Width = 137
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        402.166666666667
        7.9375
        362.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'MERC_OBJ_DET'
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
  end
  object QRBand6: TQRBand
    Left = 38
    Top = 187
    Width = 980
    Height = 16
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
      42.3333333333333
      2592.91666666667)
    BandType = rbGroupFooter
    object QRShape2: TQRShape
      Left = 122
      Top = 2
      Width = 845
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        322.791666666667
        5.29166666666667
        2235.72916666667)
      Shape = qrsRectangle
    end
    object QRDBText11: TQRDBText
      Left = 152
      Top = 5
      Width = 137
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        402.166666666667
        13.2291666666667
        362.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'MONEDA'
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
    object QRExpr11: TQRExpr
      Left = 640
      Top = 5
      Width = 77
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1693.33333333333
        13.2291666666667
        203.729166666667)
      Alignment = taLeftJustify
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
      Expression = 'SUM(QCarteVig.SALDO_INSOLUTO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr12: TQRExpr
      Left = 768
      Top = 5
      Width = 67
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2032
        13.2291666666667
        177.270833333333)
      Alignment = taLeftJustify
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
      Expression = 'SUM(QCarteVig.SALDO_PROMEDIO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr15: TQRExpr
      Left = 872
      Top = 5
      Width = 67
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2307.16666666667
        13.2291666666667
        177.270833333333)
      Alignment = taLeftJustify
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
      Expression = 'SUM(QCarteVig.COMISIONES)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object QRGroup2: TQRGroup
    Left = 38
    Top = 145
    Width = 980
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
      2592.91666666667)
    Expression = 'QCarteVig.MONEDA'
    FooterBand = QRBand6
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText10: TQRDBText
      Left = 8
      Top = 1
      Width = 209
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        21.1666666666667
        2.64583333333333
        552.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
  end
  object QRGroup1: TQRGroup
    Left = 38
    Top = 163
    Width = 980
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
      2592.91666666667)
    Expression = 'QCarteVig.MERC_OBJ_DET'
    FooterBand = QRBand4
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRBand5: TQRBand
    Left = 38
    Top = 203
    Width = 980
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
      2592.91666666667)
    BandType = rbSummary
    object QRShape3: TQRShape
      Left = 122
      Top = 2
      Width = 845
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        322.791666666667
        5.29166666666667
        2235.72916666667)
      Shape = qrsRectangle
    end
    object QRExpr2: TQRExpr
      Left = 640
      Top = 3
      Width = 77
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1693.33333333333
        7.9375
        203.729166666667)
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
      Expression = 'SUM(QCarteVig.SALDO_INSOLUTO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr7: TQRExpr
      Left = 768
      Top = 3
      Width = 67
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2032
        7.9375
        177.270833333333)
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
      Expression = 'SUM(QCarteVig.SALDO_PROMEDIO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr10: TQRExpr
      Left = 872
      Top = 3
      Width = 67
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2307.16666666667
        7.9375
        177.270833333333)
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
      Expression = 'SUM(QCarteVig.COMISIONES)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel9: TQRLabel
      Left = 152
      Top = 3
      Width = 62
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        402.166666666667
        7.9375
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL GLOBAL'
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
  end
  object QCarteVig: TQuery
    DatabaseName = 'PCORP'
    SQL.Strings = (
      'SELECT '
      '       DimCre.MONEDA ,'
      '       DimCre.ACREDITADO,'
      '       DimCre.MERC_OBJ_DET,'
      '       DimCre.PROMOTOR_ASOCIADO,'
      '       DimCre.PROMOTOR_ADMIN,'
      '       SUM(Imp_Sdo_K_Vig +'
      '           Imp_Sdo_IO_Imp +'
      '           Imp_Sdo_K_Imp +'
      '           Imp_Int_Corte -'
      '           IMP_INT_COB_ANT)  AS SALDO_INSOLUTO,'
      '       SUM(Imp_SPM_K_VIG +'
      '           Imp_SPM_K_Imp) AS SALDO_PROMEDIO,'
      '       SUM(Imp_Comision) AS COMISIONES,'
      
        '       ROUND(SUM((TasFon.TASA_FONDEO * (Imp_SPM_K_VIG + Imp_SPM_' +
        'K_Imp) * (TO_NUMBER(TO_CHAR(LAST_DAY(TO_DATE('#39'01/05/2006'#39','#39'DD/MM' +
        '/YYYY'#39')),'#39'DD'#39'))) / 36000)),2) AS MARGEN,'
      
        '       ROUND(SUM(Imp_Comision + (TasFon.TASA_FONDEO * (Imp_SPM_K' +
        '_VIG + Imp_SPM_K_Imp) * (TO_NUMBER(TO_CHAR(LAST_DAY(TO_DATE('#39'01/' +
        '05/2006'#39','#39'DD/MM/YYYY'#39')),'#39'DD'#39'))) / 36000)),2) AS UTILIDAD,'
      '       DECODE(SUM(Imp_SPM_K_VIG + Imp_SPM_K_Imp),0,0,'
      
        '       (((SUM(TasFon.TASA_FONDEO * (Imp_SPM_K_VIG + Imp_SPM_K_Im' +
        'p) * (TO_NUMBER(TO_CHAR(LAST_DAY(TO_DATE('#39'01/05/2006'#39','#39'DD/MM/YYY' +
        'Y'#39')),'#39'DD'#39'))) / 36000) / SUM(Imp_SPM_K_VIG + Imp_SPM_K_Imp)) * 36' +
        '0 ) / (TO_NUMBER(TO_CHAR(LAST_DAY(TO_DATE('#39'01/05/2006'#39','#39'DD/MM/YY' +
        'YY'#39')),'#39'DD'#39')))) * 100'
      '       ) MARGEN_P'
      
        'FROM  (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.' +
        'id_anio_mes = 266) FacCre,'
      
        '      (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE DimCre.' +
        'CVE_TIPO_CARTERA  = '#39'BANCAR'#39') DimCre,'
      '       DM_CR_DIM_Mes@dwhc DimMes,'
      '      (select * from CR_COINCRE_TAS_FON) TasFon'
      'WHERE  FacCre.Id_Credito        = DimCre.Id_Credito'
      'AND    DimMes.Id_Anio_Mes       = FacCre.Id_Anio_Mes'
      'AND    TasFon.ID_ANIO_MES       = FacCre.Id_Anio_Mes'
      'AND    TasFon.CVE_MERC_OBJ_DET  = DimCre.ID_OLTP_MERC_OBJ_DET'
      ''
      'GROUP BY DimCre.MONEDA, DimCre.ACREDITADO,'
      '         DimCre.MERC_OBJ_DET,            '
      '         DimCre.PROMOTOR_ASOCIADO,'
      '         DimCre.PROMOTOR_ADMIN'
      'ORDER BY DimCre.MONEDA, DimCre.MERC_OBJ_DET, DimCre.ACREDITADO'
      ''
      ''
      '')
    Left = 224
    Top = 8
    object QCarteVigMONEDA: TStringField
      FieldName = 'MONEDA'
      Size = 50
    end
    object QCarteVigACREDITADO: TStringField
      FieldName = 'ACREDITADO'
      Size = 100
    end
    object QCarteVigMERC_OBJ_DET: TStringField
      FieldName = 'MERC_OBJ_DET'
      Size = 100
    end
    object QCarteVigPROMOTOR_ASOCIADO: TStringField
      FieldName = 'PROMOTOR_ASOCIADO'
      Size = 100
    end
    object QCarteVigPROMOTOR_ADMIN: TStringField
      FieldName = 'PROMOTOR_ADMIN'
      Size = 100
    end
    object QCarteVigSALDO_INSOLUTO: TFloatField
      FieldName = 'SALDO_INSOLUTO'
    end
    object QCarteVigSALDO_PROMEDIO: TFloatField
      FieldName = 'SALDO_PROMEDIO'
    end
    object QCarteVigCOMISIONES: TFloatField
      FieldName = 'COMISIONES'
    end
    object QCarteVigMARGEN: TFloatField
      FieldName = 'MARGEN'
    end
    object QCarteVigUTILIDAD: TFloatField
      FieldName = 'UTILIDAD'
    end
    object QCarteVigMARGEN_P: TFloatField
      FieldName = 'MARGEN_P'
    end
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 368
    Top = 16
  end
end
