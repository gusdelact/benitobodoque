object QrEdMpios: TQrEdMpios
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
  DataSet = qryEdMpios
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
  Units = Native
  Zoom = 100
  object ColumnHeaderBand1: TQRBand
    Left = 38
    Top = 122
    Width = 740
    Height = 103
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
      272.520833333333
      1957.91666666667)
    BandType = rbColumnHeader
    object QRLabel2: TQRLabel
      Left = 260
      Top = 63
      Width = 156
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        687.916666666667
        166.6875
        412.75)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRShape2: TQRShape
      Left = 73
      Top = 97
      Width = 657
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.29166666666667
        193.145833333333
        256.645833333333
        1738.3125)
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 260
      Top = 80
      Width = 77
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        687.916666666667
        211.666666666667
        203.729166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Mínimo'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel5: TQRLabel
      Left = 339
      Top = 80
      Width = 77
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        896.9375
        211.666666666667
        203.729166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Máximo'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel3: TQRLabel
      Left = 425
      Top = 63
      Width = 239
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1124.47916666667
        166.6875
        632.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Real'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel4: TQRLabel
      Left = 587
      Top = 80
      Width = 77
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1553.10416666667
        211.666666666667
        203.729166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel6: TQRLabel
      Left = 425
      Top = 80
      Width = 160
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1124.47916666667
        211.666666666667
        423.333333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '$'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel7: TQRLabel
      Left = 260
      Top = 63
      Width = 156
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        687.916666666667
        166.6875
        412.75)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel8: TQRLabel
      Left = 339
      Top = 80
      Width = 77
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        896.9375
        211.666666666667
        203.729166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Máximo'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel9: TQRLabel
      Left = 260
      Top = 80
      Width = 77
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        687.916666666667
        211.666666666667
        203.729166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Mínimo'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel10: TQRLabel
      Left = 668
      Top = 80
      Width = 61
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1767.41666666667
        211.666666666667
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel11: TQRLabel
      Left = 668
      Top = 63
      Width = 61
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1767.41666666667
        166.6875
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cumple'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLCartas: TQRLabel
      Left = 8
      Top = 0
      Width = 369
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        21.1666666666667
        0
        976.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLCartas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLIntereses: TQRLabel
      Left = 384
      Top = 0
      Width = 345
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1016
        0
        912.8125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLIntereses'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object DetailBand1: TQRBand
    Left = 38
    Top = 246
    Width = 740
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
      1957.91666666667)
    BandType = rbDetail
    object qrTxtDesc_Grupo: TQRDBText
      Left = 72
      Top = 2
      Width = 185
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        190.5
        5.29166666666667
        489.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryEdMpios
      DataField = 'Desc_Titulo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrTxtImporte: TQRDBText
      Left = 260
      Top = 2
      Width = 77
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        687.916666666667
        5.29166666666667
        203.729166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryEdMpios
      DataField = 'PCT_MINIMO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrTxtCumple: TQRDBText
      Left = 668
      Top = 2
      Width = 61
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1767.41666666667
        5.29166666666667
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryEdMpios
      DataField = 'B_CUMPLIMIENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText2: TQRDBText
      Left = 338
      Top = 2
      Width = 77
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        894.291666666667
        5.29166666666667
        203.729166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryEdMpios
      DataField = 'PCT_MAXIMO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText3: TQRDBText
      Left = 426
      Top = 2
      Width = 159
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1127.125
        5.29166666666667
        420.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryEdMpios
      DataField = 'IMP_REAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText4: TQRDBText
      Left = 586
      Top = 2
      Width = 77
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1550.45833333333
        5.29166666666667
        203.729166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryEdMpios
      DataField = 'PCT_REAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object TitleBand1: TQRBand
    Left = 38
    Top = 38
    Width = 740
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
  object QRGroup1: TQRGroup
    Left = 38
    Top = 225
    Width = 740
    Height = 21
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
      55.5625
      1957.91666666667)
    Expression = 'Desc_Tipo'
    FooterBand = SummaryBand1
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText1: TQRDBText
      Left = 8
      Top = 2
      Width = 217
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        21.1666666666667
        5.29166666666667
        574.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryEdMpios
      DataField = 'Desc_Tipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object SummaryBand1: TQRBand
    Left = 38
    Top = 265
    Width = 740
    Height = 27
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
      71.4375
      1957.91666666667)
    BandType = rbGroupFooter
    object QRExpr7: TQRExpr
      Left = 426
      Top = 3
      Width = 159
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1127.125
        7.9375
        420.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(IMP_REAL)'
      Mask = '###,###,###,###,###.00'
      FontSize = 8
    end
    object QRExpr8: TQRExpr
      Left = 586
      Top = 3
      Width = 77
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1550.45833333333
        7.9375
        203.729166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(PCT_REAL)'
      Mask = '###,###,###,###,###.00'
      FontSize = 8
    end
    object QRLabel14: TQRLabel
      Left = 72
      Top = 3
      Width = 185
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        190.5
        7.9375
        489.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total   '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel15: TQRLabel
      Left = 668
      Top = 4
      Width = 61
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1767.41666666667
        10.5833333333333
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel16: TQRLabel
      Left = 260
      Top = 3
      Width = 77
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        687.916666666667
        7.9375
        203.729166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel17: TQRLabel
      Left = 338
      Top = 3
      Width = 77
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        894.291666666667
        7.9375
        203.729166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
  end
  object SummaryBand2: TQRBand
    Left = 38
    Top = 292
    Width = 740
    Height = 397
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
      1050.39583333333
      1957.91666666667)
    BandType = rbSummary
    object QRChart1: TQRChart
      Left = 8
      Top = 48
      Width = 721
      Height = 311
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        822.854166666667
        21.1666666666667
        127
        1907.64583333333)
      object QRDBChart1: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Cartera a Estados y Municipios')
        BottomAxis.LabelStyle = talValue
        LeftAxis.LabelStyle = talValue
        Legend.TextStyle = ltsPlain
        TopAxis.LabelStyle = talValue
        View3DWalls = False
        object Series1: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Pct. Mínimo'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'PCT_MINIMO'
        end
        object Series3: TLineSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clYellow
          Title = 'Pct. Real'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'PCT_REAL'
        end
        object Series2: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Pct. Máximo'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'PCT_MAXIMO'
        end
      end
    end
    object QRShape1: TQRShape
      Left = 58
      Top = 348
      Width = 197
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.29166666666667
        153.458333333333
        920.75
        521.229166666667)
      Shape = qrsRectangle
    end
    object QRLabel12: TQRLabel
      Left = 55
      Top = 352
      Width = 201
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        145.520833333333
        931.333333333333
        531.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Por Deudor'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRShape3: TQRShape
      Left = 264
      Top = 348
      Width = 329
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.29166666666667
        698.5
        920.75
        870.479166666667)
      Shape = qrsRectangle
    end
    object QRLabel13: TQRLabel
      Left = 264
      Top = 352
      Width = 329
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        698.5
        931.333333333333
        870.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Por fuente de pago'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLeyendaMoneda: TQRLabel
      Left = 72
      Top = 8
      Width = 657
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        190.5
        21.1666666666667
        1738.3125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object qryEdMpios: TQuery
    AfterScroll = qryEdMpiosAfterScroll
    DatabaseName = 'BCORP'
    SQL.Strings = (
      'Select Tipo                                     ID_Tipo,'
      '       RowNum                                   Renglon,'
      '       Desc_Tipo                                Tipo,'
      '       Desc_Titulo                              Titulo,'
      '       Pct_Minimo + Pct_Maximo + Pct_Real       TituloX,'
      '       Pct_Minimo,'
      '       Pct_Maximo,'
      '       Imp_Real,'
      '       Pct_Real,'
      '       B_Cumplimiento'
      
        '  From (Select Tipo, Desc_Tipo, Grupo, /*Clave, */Desc_Titulo, P' +
        'ct_Minimo, Pct_Maximo, Imp_Real, Pct_Real, B_Cumplimiento'
      
        '          From (Select 0                                        ' +
        '                                                   Tipo,'
      
        '                       '#39'Por deudor'#39'                             ' +
        '                                                   Desc_Tipo,'
      
        '                       Orden                                    ' +
        '                                                   Grupo,'
      
        '                       Tipo_Entidad                             ' +
        '                                                   Clave,'
      
        '                       Descripcion                              ' +
        '                                                   Desc_Titulo,'
      '                       Pct_Minimo,'
      '                       Pct_Maximo,'
      '                       Imp_Real,'
      '                       Pct_Real,'
      
        '                       Case When Pct_Real < Nvl (Pct_Minimo, 0) ' +
        '                              Then '#39'NO'#39
      
        '                            When Pct_Real Between Nvl (Pct_Minim' +
        'o, 0) And Nvl (Pct_Maximo, 0) Then '#39'SI'#39
      
        '                            When Pct_Real > Nvl (Pct_Maximo, 0) ' +
        '                              Then '#39'EXCEDE'#39
      
        '                       End                                      ' +
        '                                                   B_Cumplimient' +
        'o'
      '                  From (Select Orden, '
      '                               Tipo_Entidad,'
      '                               Descripcion,'
      '                               Pct_Minimo,'
      '                               Pct_Maximo,'
      
        '                               Round (Imp_Real / :peFactor)     ' +
        '                           Imp_Real,'
      
        '                               Case When Nvl (Sum (Imp_Real) Ove' +
        'r (), 0) = 0 Then 0'
      
        '                                    Else Round (Imp_Real / Sum (' +
        'Imp_Real) Over () * 100)'
      
        '                               End                              ' +
        '                           Pct_Real'
      '                          From (Select Ent.Orden,'
      '                                       Sdo.Tipo_Entidad,'
      '                                       Ent.Descripcion,'
      '                                       Ent.Pct_Minimo,'
      '                                       Ent.Pct_Maximo,'
      
        '                                       Sum ((Nvl (Sdo.Sdo_Insolu' +
        'to, 0) + Nvl (Sdo.Imp_Cap_Vig, 0) + Nvl (Sdo.Imp_Cap_Imp, 0)) * '
      
        '                                            PkgCrConsolidado1.Fn' +
        'c_Obt_Tipo_Cambio_Regul (Sdo.Cve_Moneda, '
      
        '                                                                ' +
        '                         '#39'D000'#39', '
      
        '                                                                ' +
        '                         To_Char (:peFecha, '#39'YYYY'#39'), '
      
        '                                                                ' +
        '                         To_Char (:peFecha, '#39'MM'#39')'
      
        '                                                                ' +
        '                        )'
      
        '                                           )                    ' +
        '                                                                ' +
        '        Imp_Real'
      
        '                                  From Table (PkgCrGPViews.VW_CR' +
        '_GP_Saldos_Edos_Mun (:peFecha, '#39'ESTATAL|MUNICIPAL|ORG-DESC'#39')) Sd' +
        'o'
      
        '                                  Join (Select 1 Orden, '#39'ESTATAL' +
        #39'   Tipo_Entidad, '#39'ESTADOS'#39'    Descripcion,                 80 P' +
        'ct_Minimo,   90 Pct_Maximo From Dual Union'
      
        '                                        Select 2 Orden, '#39'MUNICIP' +
        'AL'#39' Tipo_Entidad, '#39'MUNICIPIOS'#39' Descripcion,                 12 P' +
        'ct_Minimo,   15 Pct_Maximo From Dual Union'
      
        '                                        Select 3 Orden, '#39'ORG-DES' +
        'C'#39'  Tipo_Entidad, '#39'ORGANOS DESCENTRALIZADOS'#39' Descripcion, Null P' +
        'ct_Minimo, Null Pct_Maximo From Dual'
      
        '                                       ) Ent On Sdo.Tipo_Entidad' +
        ' = Ent.Tipo_Entidad'
      
        '                                 Group By Ent.Orden, Sdo.Tipo_En' +
        'tidad, Ent.Pct_Minimo, Ent.Pct_Maximo, Ent.Descripcion'
      '                                 Order By Ent.Orden'
      '                               )       '
      '                       )     '
      '                 Union       '
      
        '                Select 1                                        ' +
        '                                                         Tipo,'
      
        '                       '#39'Por fuente de pago'#39'                     ' +
        '                                                         Desc_Ti' +
        'po,'
      
        '                       Pct.Orden                                ' +
        '                                                         Grupo,'
      '                       Pct.Clave,'
      
        '                       Pct.Descripcion                          ' +
        '                                                         Desc_Ti' +
        'tulo,'
      '                       Pct.Pct_Minimo,'
      '                       Pct.Pct_Maximo,'
      
        '                       Nvl (Imp.Imp_Real, 0)                    ' +
        '                                                         Imp_Rea' +
        'l,'
      
        '                       Nvl (Imp.Pct_Real, 0)                    ' +
        '                                                         Pct_Rea' +
        'l,'
      
        '                       Case When Nvl (Pct_Real, 0) < Nvl (Pct_Mi' +
        'nimo, 0)                               Then '#39'NO'#39
      
        '                            When Nvl (Pct_Real, 0) Between Nvl (' +
        'Pct_Minimo, 0) And Nvl (Pct_Maximo, 0) Then '#39'SI'#39
      
        '                            When Nvl (Pct_Real, 0) > Nvl (Pct_Ma' +
        'ximo, 0)                               Then '#39'EXCEDE'#39
      
        '                       End                                      ' +
        '                                                         B_Cumpl' +
        'imiento'
      
        '                  From (Select 1 Orden, '#39'FID'#39' Clave, '#39'FIDEICOMIS' +
        'O'#39'      Descripcion,   52 Pct_Minimo,   76 Pct_Maximo From Dual ' +
        'Union'
      
        '                        Select 2 Orden, '#39'MAN'#39' Clave, '#39'MANDATO'#39'  ' +
        '        Descripcion, Null Pct_Minimo, Null Pct_Maximo From Dual ' +
        'Union'
      
        '                        Select 3 Orden, '#39'SNE'#39' Clave, '#39'RECURSOS P' +
        'ROPIOS'#39' Descripcion,   25 Pct_Minimo,   40 Pct_Maximo From Dual ' +
        'Union'
      
        '                        Select 4 Orden, '#39'FAC'#39' Clave, '#39'FACTORAJE'#39 +
        '        Descripcion,    0 Pct_Minimo,    3 Pct_Maximo From Dual ' +
        'Union'
      
        '                        Select 5 Orden, '#39'NA'#39'  Clave, '#39'NO APLICA'#39 +
        '        Descripcion, Null Pct_Minimo, Null Pct_Maximo From Dual '
      '                       ) Pct '
      '                  Left Outer Join (Select Clave, '
      
        '                                          Round (Imp_Real / :peF' +
        'actor)                                Imp_Real,'
      
        '                                          Case When Nvl (Sum (Im' +
        'p_Real) Over (), 0) = 0 Then 0'
      
        '                                               Else Round (Imp_R' +
        'eal / Sum (Imp_Real) Over () * 100)'
      
        '                                          End                   ' +
        '                                      Pct_Real'
      
        '                                     From (Select Clave, Sum (Im' +
        'p_Real) Imp_Real'
      
        '                                             From (Select Case W' +
        'hen Cve_Mercado In ('#39'FAC'#39', '#39'FACT'#39')                         Then ' +
        #39'FAC'#39'              '
      
        '                                                               W' +
        'hen Producto    In ('#39'Producto1'#39', '#39'Producto2'#39', '#39'Producto3'#39') Then ' +
        #39'FID'#39
      
        '                                                               W' +
        'hen Producto    In ('#39'Producto4'#39', '#39'Producto5'#39', '#39'Producto6'#39') Then ' +
        #39'MAN'#39
      
        '                                                               W' +
        'hen Producto    In ('#39'Producto7'#39', '#39'Producto8'#39', '#39'Producto9'#39') Then ' +
        #39'SNE'#39
      
        '                                                               E' +
        'lse                                                             ' +
        #39'NA'#39
      
        '                                                          End   ' +
        '                                                                ' +
        '        Clave,'
      
        '                                                          (Nvl (' +
        'Sdo_Insoluto, 0) + Nvl (Imp_Cap_Vig, 0) + Nvl (Imp_Cap_Imp, 0)) ' +
        '*'
      
        '                                                          PkgCrC' +
        'onsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '                                       '#39'D000'#39', '
      
        '                                                                ' +
        '                                       To_Char (:peFecha, '#39'YYYY'#39 +
        '), '
      
        '                                                                ' +
        '                                       To_Char (:peFecha, '#39'MM'#39')'
      
        '                                                                ' +
        '                                      )                         ' +
        '        Imp_Real'
      
        '                                                     From Table ' +
        '(PkgCrGPViews.VW_CR_GP_Consolidado_Edos_Mun (:peFecha, '#39'ESTATAL|' +
        'MUNICIPAL|ORG-DESC'#39')) '
      '                                                  )'
      '                                            Group By Clave'
      '                                          )'
      '                                  ) Imp On Pct.Clave = Imp.Clave'
      '             ) '
      '         Order By Tipo, Grupo'
      '       )')
    Left = 392
    Top = 177
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end>
    object qryEdMpiosTIPO: TStringField
      FieldName = 'TIPO'
      Size = 18
    end
    object qryEdMpiosTITULO: TStringField
      FieldName = 'TITULO'
      Size = 22
    end
    object qryEdMpiosPCT_MINIMO: TFloatField
      FieldName = 'PCT_MINIMO'
    end
    object qryEdMpiosPCT_MAXIMO: TFloatField
      FieldName = 'PCT_MAXIMO'
    end
    object qryEdMpiosIMP_REAL: TFloatField
      FieldName = 'IMP_REAL'
    end
    object qryEdMpiosPCT_REAL: TFloatField
      FieldName = 'PCT_REAL'
    end
    object qryEdMpiosB_CUMPLIMIENTO: TStringField
      FieldName = 'B_CUMPLIMIENTO'
      Size = 2
    end
    object qryEdMpiosRENGLON: TFloatField
      FieldName = 'RENGLON'
    end
    object qryEdMpiosTITULOX: TFloatField
      FieldName = 'TITULOX'
    end
  end
end
