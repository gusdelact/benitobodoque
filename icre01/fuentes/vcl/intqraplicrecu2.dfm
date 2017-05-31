object QrAplicRecu2: TQrAplicRecu2
  Left = 0
  Top = 0
  Width = 1267
  Height = 979
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  BeforePrint = QuickRepBeforePrint
  DataSet = qyAplicRecu
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
  Units = Native
  Zoom = 120
  object PageHeaderBand1: TQRBand
    Left = 45
    Top = 45
    Width = 1176
    Height = 101
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
      222.690972222222
      2592.91666666667)
    BandType = rbPageHeader
    object QRInterEncabezado1: TQRInterEncabezado
      Left = 0
      Top = 0
      Width = 1176
      Height = 101
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        222.690972222222
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
  object QRFooterCesion: TQRBand
    Left = 45
    Top = 311
    Width = 1176
    Height = 25
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
      55.1215277777778
      2592.91666666667)
    BandType = rbGroupFooter
    object QRL_CAP_IVAMOR_CRE: TQRLabel
      Left = 435
      Top = 9
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        959.114583333333
        19.84375
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_CAP_IMPMOR_CRE: TQRLabel
      Left = 377
      Top = 9
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        831.232638888889
        19.84375
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_CAP_IMPBRU_CRE: TQRLabel
      Left = 308
      Top = 9
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        679.097222222222
        19.84375
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRLabel11: TQRLabel
      Left = 28
      Top = 8
      Width = 149
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        61.7361111111111
        17.6388888888889
        328.524305555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total x Recuperar por Crédito'
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
    object QRL_INT_IMPBRU_CRE: TQRLabel
      Left = 517
      Top = 9
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1139.91319444444
        19.84375
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_INT_IMPIVA_CRE: TQRLabel
      Left = 574
      Top = 9
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1265.59027777778
        19.84375
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_FIN_IMPBRU_CRE: TQRLabel
      Left = 657
      Top = 9
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1448.59375
        19.84375
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_FIN_IMPIVA_CRE: TQRLabel
      Left = 713
      Top = 9
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1572.06597222222
        19.84375
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_FIN_IMPMOR_CRE: TQRLabel
      Left = 781
      Top = 9
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1721.99652777778
        19.84375
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_FIN_IVAMOR_CRE: TQRLabel
      Left = 838
      Top = 9
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1847.67361111111
        19.84375
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_OTROS_IMPBRU_CRE: TQRLabel
      Left = 909
      Top = 9
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        2004.21875
        19.84375
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_OTROS_IMPIVA_CRE: TQRLabel
      Left = 969
      Top = 9
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        2136.51041666667
        19.84375
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_OTROS_IMPMOR_CRE: TQRLabel
      Left = 1036
      Top = 9
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        2284.23611111111
        19.84375
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_OTROS_IVAMOR_CRE: TQRLabel
      Left = 1094
      Top = 9
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        2412.11805555556
        19.84375
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_NETO_CRE: TQRLabel
      Left = 228
      Top = 9
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        502.708333333333
        19.84375
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRShape3: TQRShape
      Left = 184
      Top = 3
      Width = 931
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        4.40972222222222
        405.694444444444
        6.61458333333333
        2052.72569444444)
      Shape = qrsRectangle
    end
  end
  object QRFooterCliente: TQRBand
    Left = 45
    Top = 336
    Width = 1176
    Height = 30
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFooterClienteBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      66.1458333333333
      2592.91666666667)
    BandType = rbGroupFooter
    object QRLabel27: TQRLabel
      Left = 11
      Top = 13
      Width = 134
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        24.2534722222222
        28.6631944444444
        295.451388888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total x Recuperar por Cliente'
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
    object QRL_CAP_IMPBRU_CTE: TQRLabel
      Left = 308
      Top = 13
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        679.097222222222
        28.6631944444444
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_CAP_IMPMOR_CTE: TQRLabel
      Left = 377
      Top = 13
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        831.232638888889
        28.6631944444444
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_CAP_IVAMOR_CTE: TQRLabel
      Left = 435
      Top = 13
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        959.114583333333
        28.6631944444444
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_INT_IMPBRU_CTE: TQRLabel
      Left = 517
      Top = 13
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1139.91319444444
        28.6631944444444
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_INT_IMPIVA_CTE: TQRLabel
      Left = 574
      Top = 13
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1265.59027777778
        28.6631944444444
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_FIN_IMPBRU_CTE: TQRLabel
      Left = 657
      Top = 13
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1448.59375
        28.6631944444444
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_FIN_IMPIVA_CTE: TQRLabel
      Left = 713
      Top = 13
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1572.06597222222
        28.6631944444444
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_FIN_IMPMOR_CTE: TQRLabel
      Left = 781
      Top = 13
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1721.99652777778
        28.6631944444444
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_FIN_IVAMOR_CTE: TQRLabel
      Left = 838
      Top = 13
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1847.67361111111
        28.6631944444444
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_OTROS_IMPBRU_CTE: TQRLabel
      Left = 909
      Top = 13
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        2004.21875
        28.6631944444444
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_OTROS_IMPIVA_CTE: TQRLabel
      Left = 969
      Top = 13
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        2136.51041666667
        28.6631944444444
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_OTROS_IMPMOR_CTE: TQRLabel
      Left = 1036
      Top = 13
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        2284.23611111111
        28.6631944444444
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_OTROS_IVAMOR_CTE: TQRLabel
      Left = 1094
      Top = 13
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        2412.11805555556
        28.6631944444444
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRL_NETO_CTE: TQRLabel
      Left = 228
      Top = 13
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        502.708333333333
        28.6631944444444
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRShape31: TQRShape
      Left = 184
      Top = 3
      Width = 931
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        4.40972222222222
        405.694444444444
        6.61458333333333
        2052.72569444444)
      Shape = qrsRectangle
    end
    object QRShape18: TQRShape
      Left = 184
      Top = 7
      Width = 931
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        4.40972222222222
        405.694444444444
        15.4340277777778
        2052.72569444444)
      Shape = qrsRectangle
    end
  end
  object QRBFTIPO: TQRBand
    Left = 45
    Top = 288
    Width = 1176
    Height = 23
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRBFTIPOAfterPrint
    AlignToBottom = False
    BeforePrint = QRBFTIPOBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.7118055555556
      2592.91666666667)
    BandType = rbGroupFooter
    object QRExpr1: TQRExpr
      Left = 274
      Top = 5
      Width = 53
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        604.131944444444
        11.0243055555556
        116.857638888889)
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyAplicRecu.CAP_IMPBRU)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr4: TQRExpr
      Left = 342
      Top = 5
      Width = 53
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        754.0625
        11.0243055555556
        116.857638888889)
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyAplicRecu.CAP_IMPMOR)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr5: TQRExpr
      Left = 400
      Top = 5
      Width = 53
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        881.944444444445
        11.0243055555556
        116.857638888889)
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyAplicRecu.CAP_IVAMOR)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr6: TQRExpr
      Left = 483
      Top = 5
      Width = 53
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1064.94791666667
        11.0243055555556
        116.857638888889)
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyAplicRecu.INT_IMPBRU)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr7: TQRExpr
      Left = 539
      Top = 5
      Width = 53
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1188.42013888889
        11.0243055555556
        116.857638888889)
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyAplicRecu.INT_IMPIVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr10: TQRExpr
      Left = 622
      Top = 5
      Width = 53
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1371.42361111111
        11.0243055555556
        116.857638888889)
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyAplicRecu.FIN_IMPBRU)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr11: TQRExpr
      Left = 678
      Top = 5
      Width = 53
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1494.89583333333
        11.0243055555556
        116.857638888889)
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyAplicRecu.FIN_IMPIVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr12: TQRExpr
      Left = 746
      Top = 5
      Width = 53
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1644.82638888889
        11.0243055555556
        116.857638888889)
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyAplicRecu.FIN_IMPMOR)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr13: TQRExpr
      Left = 803
      Top = 5
      Width = 53
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1770.50347222222
        11.0243055555556
        116.857638888889)
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyAplicRecu.FIN_IVAMOR)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr14: TQRExpr
      Left = 874
      Top = 5
      Width = 53
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1927.04861111111
        11.0243055555556
        116.857638888889)
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyAplicRecu.OTROS_IMPBRU)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr15: TQRExpr
      Left = 934
      Top = 5
      Width = 53
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        2059.34027777778
        11.0243055555556
        116.857638888889)
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyAplicRecu.OTROS_IMPIVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr18: TQRExpr
      Left = 1002
      Top = 5
      Width = 53
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        2209.27083333333
        11.0243055555556
        116.857638888889)
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyAplicRecu.OTROS_IMPMOR)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr19: TQRExpr
      Left = 1059
      Top = 5
      Width = 53
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        2334.94791666667
        11.0243055555556
        116.857638888889)
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyAplicRecu.OTROS_IVAMOR)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object TotalMovto: TQRLabel
      Left = 228
      Top = 5
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        502.708333333333
        11.0243055555556
        39.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0.00'
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
    object QRShape10: TQRShape
      Left = 260
      Top = 3
      Width = 855
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.20486111111111
        573.263888888889
        6.61458333333333
        1885.15625)
      Shape = qrsRectangle
    end
  end
  object QRGroupMoneda: TQRGroup
    Left = 45
    Top = 189
    Width = 1176
    Height = 23
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
      50.7118055555556
      2592.91666666667)
    Expression = 'qyAplicRecu.CVE_MONEDA'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape14: TQRShape
      Left = 1
      Top = 0
      Width = 595
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2.64583333333333
        0
        1312.33333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRDBText15: TQRDBText
      Left = 142
      Top = 1
      Width = 97
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        313.090277777778
        2.20486111111111
        213.871527777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'DESC_MONEDA'
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
    object QRDBText20: TQRDBText
      Left = 79
      Top = 1
      Width = 49
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        174.625
        2.64583333333333
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyAplicRecu
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
    object QRLabel23: TQRLabel
      Left = 10
      Top = 1
      Width = 54
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        22.0486111111111
        2.20486111111111
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda'
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
  object QRGroupProducto: TQRGroup
    Left = 45
    Top = 212
    Width = 1176
    Height = 20
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
      44.0972222222222
      2592.91666666667)
    Expression = 'qyAplicRecu.CVE_PRODUCTO_CRE'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape15: TQRShape
      Left = 16
      Top = 0
      Width = 1102
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        35.2777777777778
        0
        2429.75694444444)
      Shape = qrsRectangle
    end
    object dbProducto: TQRDBText
      Left = 83
      Top = 2
      Width = 56
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        182.5625
        5.29166666666667
        124.354166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'CVE_PRODUCTO'
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel2: TQRLabel
      Left = 36
      Top = 2
      Width = 43
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        79.375
        4.40972222222222
        94.8090277777778)
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
    object QRDBText23: TQRDBText
      Left = 145
      Top = 2
      Width = 88
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        319.704861111111
        4.40972222222222
        194.027777777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'DESC_PRODUCTO'
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
  end
  object QRGroup1: TQRGroup
    Left = 45
    Top = 232
    Width = 1176
    Height = 20
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
      44.0972222222222
      2592.91666666667)
    Expression = 'qyAplicRecu.NOMBRE'
    FooterBand = QRFooterCliente
    Master = Owner
    ReprintOnNewPage = False
    object QRShape17: TQRShape
      Left = 38
      Top = 0
      Width = 596
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        84.6666666666667
        0
        1314.97916666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 43
      Top = 0
      Width = 30
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        94.8090277777778
        0
        66.1458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Titular'
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
    object QRDBText24: TQRDBText
      Left = 83
      Top = 0
      Width = 59
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        182.5625
        0
        129.645833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'ID_TITULAR'
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
    object QRDBText10: TQRDBText
      Left = 145
      Top = 0
      Width = 430
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        320.145833333333
        0
        947.208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'NOMB_CONTRATO'
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
  object QRGroupCesion: TQRGroup
    Left = 45
    Top = 252
    Width = 1176
    Height = 17
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRGroupCesionAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      37.4826388888889
      2592.91666666667)
    Expression = 'qyAplicRecu.ID_CREDITO'
    FooterBand = QRFooterCesion
    Master = Owner
    ReprintOnNewPage = False
    object QRShape16: TQRShape
      Left = 60
      Top = -1
      Width = 1079
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.4826388888889
        132.291666666667
        -2.20486111111111
        2379.04513888889)
      Shape = qrsRectangle
    end
    object QRLabel4: TQRLabel
      Left = 64
      Top = 2
      Width = 35
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        141.111111111111
        4.40972222222222
        77.1701388888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
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
    object dbMoneda: TQRDBText
      Left = 101
      Top = 2
      Width = 48
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        222.690972222222
        4.40972222222222
        105.833333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'ID_CREDITO'
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
    object QRDBText7: TQRDBText
      Left = 216
      Top = 2
      Width = 72
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        476.25
        4.40972222222222
        158.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyAplicRecu
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
    object QRLabel14: TQRLabel
      Left = 155
      Top = 2
      Width = 58
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        341.753472222222
        4.40972222222222
        127.881944444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
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
    object QRDBText8: TQRDBText
      Left = 422
      Top = 2
      Width = 70
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        930.451388888889
        4.40972222222222
        154.340277777778)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'IMP_APLICADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText9: TQRDBText
      Left = 598
      Top = 2
      Width = 70
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1318.50694444444
        4.40972222222222
        154.340277777778)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'IMP_RECUPERADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel1: TQRLabel
      Left = 344
      Top = 2
      Width = 68
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        758.472222222222
        4.40972222222222
        149.930555555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total Aplicado:'
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
      Left = 512
      Top = 2
      Width = 84
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1128.88888888889
        4.40972222222222
        185.208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total Recuperado:'
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
      Left = 696
      Top = 2
      Width = 77
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1534.58333333333
        4.40972222222222
        169.774305555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total Rescatado:'
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
    object QRDBText21: TQRDBText
      Left = 774
      Top = 2
      Width = 70
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1706.5625
        4.40972222222222
        154.340277777778)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'IMP_RESCATADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
  end
  object QRGTIPO_CARTERA: TQRGroup
    Left = 45
    Top = 269
    Width = 1176
    Height = 2
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
      4.40972222222222
      2592.91666666667)
    Expression = 'qyAplicRecu.TIPO'
    FooterBand = QRBFTIPO
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRBand2: TQRBand
    Left = 45
    Top = 146
    Width = 1176
    Height = 43
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
      94.8090277777778
      2592.91666666667)
    BandType = rbColumnHeader
    object QRShape29: TQRShape
      Left = 80
      Top = -1
      Width = 51
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        94.8090277777778
        176.388888888889
        -2.20486111111111
        112.447916666667)
      Shape = qrsRectangle
    end
    object QRShape30: TQRShape
      Left = 176
      Top = -1
      Width = 75
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        94.8090277777778
        388.055555555556
        -2.20486111111111
        165.364583333333)
      Shape = qrsRectangle
    end
    object QRShape1: TQRShape
      Left = 130
      Top = -1
      Width = 47
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        94.8090277777778
        286.631944444444
        -2.20486111111111
        103.628472222222)
      Shape = qrsRectangle
    end
    object QRShape2: TQRShape
      Left = 12
      Top = -1
      Width = 69
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        94.8090277777778
        26.4583333333333
        -2.20486111111111
        152.135416666667)
      Shape = qrsRectangle
    end
    object QRShape28: TQRShape
      Left = 1054
      Top = 17
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.1215277777778
        2323.92361111111
        37.4826388888889
        143.315972222222)
      Shape = qrsRectangle
    end
    object QRShape27: TQRShape
      Left = 990
      Top = 17
      Width = 74
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.1215277777778
        2182.8125
        37.4826388888889
        163.159722222222)
      Shape = qrsRectangle
    end
    object QRShape26: TQRShape
      Left = 934
      Top = 17
      Width = 59
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.1215277777778
        2059.34027777778
        37.4826388888889
        130.086805555556)
      Shape = qrsRectangle
    end
    object QRShape25: TQRShape
      Left = 860
      Top = 17
      Width = 74
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.1215277777778
        1896.18055555556
        37.4826388888889
        163.159722222222)
      Shape = qrsRectangle
    end
    object QRShape21: TQRShape
      Left = 600
      Top = 17
      Width = 83
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1322.91666666667
        37.0416666666667
        182.5625)
      Shape = qrsRectangle
    end
    object QRShape22: TQRShape
      Left = 682
      Top = 17
      Width = 58
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1502.83333333333
        37.0416666666667
        127)
      Shape = qrsRectangle
    end
    object QRShape23: TQRShape
      Left = 737
      Top = 17
      Width = 68
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1624.54166666667
        37.0416666666667
        150.8125)
      Shape = qrsRectangle
    end
    object QRShape24: TQRShape
      Left = 804
      Top = 17
      Width = 59
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1772.70833333333
        37.0416666666667
        129.645833333333)
      Shape = qrsRectangle
    end
    object QRShape9: TQRShape
      Left = 540
      Top = 17
      Width = 62
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1190.625
        37.0416666666667
        137.583333333333)
      Shape = qrsRectangle
    end
    object QRShape13: TQRShape
      Left = 400
      Top = 17
      Width = 60
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        881.0625
        37.0416666666667
        132.291666666667)
      Shape = qrsRectangle
    end
    object QRShape11: TQRShape
      Left = 323
      Top = 17
      Width = 78
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        711.729166666667
        37.0416666666667
        171.979166666667)
      Shape = qrsRectangle
    end
    object QRShape12: TQRShape
      Left = 250
      Top = 17
      Width = 84
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        550.333333333333
        37.0416666666667
        185.208333333333)
      Shape = qrsRectangle
    end
    object QRShape8: TQRShape
      Left = 250
      Top = -1
      Width = 209
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        550.333333333333
        -2.64583333333333
        460.375)
      Shape = qrsRectangle
    end
    object QRShape7: TQRShape
      Left = 457
      Top = -1
      Width = 148
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1008.0625
        -2.64583333333333
        325.4375)
      Shape = qrsRectangle
    end
    object QRShape4: TQRShape
      Left = 860
      Top = -1
      Width = 259
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1896.18055555556
        -2.20486111111111
        571.059027777778)
      Shape = qrsRectangle
    end
    object QRLabel31: TQRLabel
      Left = 1005
      Top = 26
      Width = 43
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        2215.88541666667
        57.3263888888889
        94.8090277777778)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Imp. Mor.'
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
    object QRLabel33: TQRLabel
      Left = 873
      Top = 26
      Width = 49
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        1924.84375
        57.3263888888889
        108.038194444444)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Imp. Neto'
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
      Left = 601
      Top = -1
      Width = 262
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1325.5625
        -2.64583333333333
        576.791666666667)
      Shape = qrsRectangle
    end
    object QRLabel37: TQRLabel
      Left = 619
      Top = 26
      Width = 49
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1365.25
        58.2083333333333
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Imp. Neto'
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
      Left = 752
      Top = 26
      Width = 41
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1658.9375
        58.2083333333333
        89.9583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Imp. Mor.'
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
    object QRLabel41: TQRLabel
      Left = 266
      Top = 28
      Width = 43
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        587.375
        60.8541666666667
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Imp. Neto'
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
    object QRLabel42: TQRLabel
      Left = 346
      Top = 28
      Width = 49
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        762.881944444444
        61.7361111111111
        108.038194444444)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Imp. Mor.'
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
    object QRLabel43: TQRLabel
      Left = 408
      Top = 20
      Width = 43
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        899.583333333333
        44.9791666666667
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Imp. IVA Mor.'
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
    object QRLabel44: TQRLabel
      Left = 278
      Top = 0
      Width = 145
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        613.833333333333
        0
        320.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
    object QRLabel46: TQRLabel
      Left = 480
      Top = 0
      Width = 97
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1058.33333333333
        0
        214.3125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Interes'
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
    object QRLabel48: TQRLabel
      Left = 550
      Top = 26
      Width = 42
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1211.79166666667
        58.2083333333333
        92.6041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Imp. IVA'
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
    object QRLabel49: TQRLabel
      Left = 634
      Top = 0
      Width = 197
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1397
        0
        433.916666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Financiamiento adicional'
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
    object QRLabel50: TQRLabel
      Left = 898
      Top = 0
      Width = 198
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1979.08333333333
        0
        436.5625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Otros conceptos'
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
      Left = 180
      Top = 7
      Width = 70
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.1458333333333
        396.875
        15.4340277777778
        154.340277777778)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Total por Movto.'
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
      Left = 83
      Top = 10
      Width = 46
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.0972222222222
        183.003472222222
        22.0486111111111
        101.423611111111)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Solicitud'
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
    object QRLabel12: TQRLabel
      Left = 134
      Top = 10
      Width = 43
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        295.451388888889
        22.0486111111111
        94.8090277777778)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha de Solicitud'
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
      Left = 457
      Top = 17
      Width = 85
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1008.0625
        37.0416666666667
        187.854166666667)
      Shape = qrsRectangle
    end
    object QRLabel13: TQRLabel
      Left = 478
      Top = 28
      Width = 43
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1053.04166666667
        60.8541666666667
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Imp. Neto'
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
    object QRLabel18: TQRLabel
      Left = 689
      Top = 26
      Width = 42
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1518.70833333333
        58.2083333333333
        92.6041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Imp. IVA'
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
    object QRLabel20: TQRLabel
      Left = 943
      Top = 26
      Width = 42
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2079.625
        58.2083333333333
        92.6041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Imp. IVA'
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
    object QRLabel21: TQRLabel
      Left = 815
      Top = 20
      Width = 43
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1796.52083333333
        44.9791666666667
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Imp. IVA Mor.'
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
    object QRLabel22: TQRLabel
      Left = 1070
      Top = 20
      Width = 43
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.0972222222222
        2359.20138888889
        44.0972222222222
        94.8090277777778)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Imp. IVA Mor.'
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
    object QRLabel24: TQRLabel
      Left = 20
      Top = 10
      Width = 53
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.0972222222222
        44.0972222222222
        22.0486111111111
        116.857638888889)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Movto.'
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
    Left = 45
    Top = 271
    Width = 1176
    Height = 17
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
      37.4826388888889
      2592.91666666667)
    BandType = rbDetail
    object QRDB_IMP_IVA: TQRDBText
      Left = 256
      Top = 0
      Width = 63
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        564.444444444444
        0
        138.90625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'CAP_IMPBRU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText22: TQRDBText
      Left = 348
      Top = 0
      Width = 47
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        767.291666666667
        0
        103.1875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'CAP_IMPMOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText5: TQRDBText
      Left = 88
      Top = 0
      Width = 35
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        194.027777777778
        0
        77.1701388888889)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'ID_SOLICITUD'
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
      Left = 128
      Top = 0
      Width = 57
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        282.222222222222
        0
        125.677083333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'F_SOLICITUD'
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
      Left = 8
      Top = 0
      Width = 75
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        17.6388888888889
        0
        165.364583333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'TIPO_DESC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 5
    end
    object QRDBText3: TQRDBText
      Left = 406
      Top = 1
      Width = 47
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        895.173611111111
        2.20486111111111
        103.628472222222)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'CAP_IVAMOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText4: TQRDBText
      Left = 473
      Top = 1
      Width = 63
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1042.89930555556
        2.20486111111111
        138.90625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'INT_IMPBRU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText6: TQRDBText
      Left = 545
      Top = 1
      Width = 47
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1201.64930555556
        2.20486111111111
        103.628472222222)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'INT_IMPIVA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText11: TQRDBText
      Left = 612
      Top = 1
      Width = 63
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1349.375
        2.20486111111111
        138.90625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'FIN_IMPBRU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText12: TQRDBText
      Left = 684
      Top = 1
      Width = 47
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1508.125
        2.20486111111111
        103.628472222222)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'FIN_IMPIVA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText13: TQRDBText
      Left = 752
      Top = 1
      Width = 47
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1658.05555555556
        2.20486111111111
        103.628472222222)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'FIN_IMPMOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText14: TQRDBText
      Left = 809
      Top = 1
      Width = 47
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1783.73263888889
        2.20486111111111
        103.628472222222)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'FIN_IVAMOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText16: TQRDBText
      Left = 864
      Top = 1
      Width = 63
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1905
        2.20486111111111
        138.90625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'OTROS_IMPBRU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText17: TQRDBText
      Left = 940
      Top = 1
      Width = 47
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        2072.56944444444
        2.20486111111111
        103.628472222222)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'OTROS_IMPIVA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText18: TQRDBText
      Left = 1008
      Top = 1
      Width = 47
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        2222.5
        2.20486111111111
        103.628472222222)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'OTROS_IMPMOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText19: TQRDBText
      Left = 1065
      Top = 1
      Width = 47
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        2348.17708333333
        2.20486111111111
        103.628472222222)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAplicRecu
      DataField = 'OTROS_IVAMOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
  end
  object qyAplicRecu: TQuery
    DatabaseName = 'NCORP'
    SQL.Strings = (
      'SELECT * FROM( SELECT * '
      '   FROM ( '
      #9'   SELECT CO.CVE_MONEDA, '
      
        #9#9'  (SELECT DESC_MONEDA FROM MONEDA WHERE CVE_MONEDA = CO.CVE_MO' +
        'NEDA) AS DESC_MONEDA, '
      
        '                  CP.CVE_PRODUCTO_GPO, TO_CHAR(CO.CVE_PRODUCTO_C' +
        'RE) AS CVE_PRODUCTO, '
      
        #9#9'  (SELECT DESC_C_PRODUCTO FROM CR_PRODUCTO WHERE CVE_PRODUCTO_' +
        'CRE=CO.CVE_PRODUCTO_CRE) AS DESC_PRODUCTO, '
      
        '                  CTO.ID_TITULAR, CTO.NOMB_CONTRATO, CC.ID_CONTR' +
        'ATO, CC.ID_CREDITO, '
      '                  GARANTIA.NUM_PERIODO, '
      '        (CASE '
      
        '           WHEN '#39'APLICACIONES'#39' = '#39'APLICACIONES'#39' THEN GARANTIA.ID' +
        '_SOLICITUD '
      
        '           WHEN '#39'APLICACIONES'#39' = '#39'RECUPERACIONES'#39' THEN GARANTIA.' +
        'ID_SOLICITUD '
      '           WHEN '#39'APLICACIONES'#39' = '#39'RESCATES'#39' THEN 0 '
      '         END) ID_SOLICITUD, '
      '        (CASE '
      
        '           WHEN '#39'APLICACIONES'#39' = '#39'APLICACIONES'#39' THEN to_char(F_P' +
        'AGO, '#39'DD/MM/YYYY'#39') '
      
        '           WHEN '#39'APLICACIONES'#39' = '#39'RECUPERACIONES'#39' THEN to_char(F' +
        '_PAGO, '#39'DD/MM/YYYY'#39') '
      '           WHEN '#39'APLICACIONES'#39' = '#39'RESCATES'#39' THEN '#39#39' '
      '         END) F_SOLICITUD, '
      '                  '#39'APLICACIONES'#39' AS TIPO '
      '                  ,TOTALES.IMP_APLICADO '
      '                  ,TOTALES.IMP_RECUPERADO '
      '                  ,TOTALES.IMP_RESCATADO '
      
        '                   , ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_C' +
        'ONCEPTO   FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSA' +
        'CCION CTX  WHERE 1=1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCI' +
        'ON    AND CDT.CVE_OPERACION = CT.CVE_OPERACION    AND CT.ID_TRAN' +
        'SACCION = CTX.ID_TRANSACCION    AND CT.ID_TRANS_CANCELA IS NULL ' +
        '   AND CT.SIT_TRANSACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CR' +
        'EDITO    AND CT.CVE_OPERACION IN ( '#39'PGCPGF'#39' )    AND CDT.CVE_CON' +
        'CEPTO = '#39'IMPBRU'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/M' +
        'M/YYYY'#39')    AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS C' +
        'AP_IMPBRU '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'PGCPGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPIVA'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS CAP_IMPIVA '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'PGCPGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPMOR'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS CAP_IMPMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'PGCPGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IVAMOR'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS CAP_IVAMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'PGINGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPBRU'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS INT_IMPBRU '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'PGINGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPIVA'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS INT_IMPIVA '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'PGINGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPMOR'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS INT_IMPMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'PGINGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IVAMOR'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS INT_IVAMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'PGFNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPBRU'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS FIN_IMPBRU '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'PGFNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPIVA'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS FIN_IMPIVA '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'PGFNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPMOR'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS FIN_IMPMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'PGFNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IVAMOR'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS FIN_IVAMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'PGCNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPBRU'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS OTROS_IMPBRU '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'PGCNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPIVA'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS OTROS_IMPIVA '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'PGCNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPMOR'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS OTROS_IMPMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'PGCNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IVAMOR'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS OTROS_IVAMOR '
      
        ' '#9'     FROM CR_CREDITO CC, CR_CONTRATO CO, CONTRATO CTO, CR_PROD' +
        'UCTO CP '
      #9#9'  ,CR_GA_SOL_FEGA GARANTIA '
      
        '                  ,( SELECT ID_CREDITO,IMP_APLICADO, IMP_RECUPER' +
        'ADO, IMP_RESCATADO FROM CR_CREDITO '
      ' LEFT JOIN(SELECT ID_CREDITO,SUM(IMP_APLICADO) as IMP_APLICADO '
      
        '  FROM (SELECT DISTINCT CT.ID_CREDITO,(CDT.IMP_CONCEPTO) AS IMP_' +
        'APLICADO '
      
        '          FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSA' +
        'CCION CTX, CR_GA_SOL_FEGA GA '
      '         WHERE 1=1 '
      '           AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CTX.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CDT.CVE_OPERACION  = CT.CVE_OPERACION '
      '           AND CT.ID_CREDITO      = GA.ID_CREDITO '
      '           AND CTX.ID_SOLICITUD   = GA.ID_SOLICITUD '
      '           AND CT.ID_TRANS_CANCELA IS NULL '
      '           AND CT.SIT_TRANSACCION ='#39'AC'#39
      
        '           AND CT.CVE_OPERACION in ('#39'PGCPGF'#39','#39'PGINGF'#39','#39'PGCNGF'#39','#39 +
        'PGFNGF'#39') '
      
        '           AND CDT.CVE_CONCEPTO in ('#39'IMPBRU'#39','#39'IMPIVA'#39','#39'IMPMOR'#39','#39 +
        'IVAMOR'#39')'
      
        '           AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39'))' +
        ' GROUP BY ID_CREDITO  ) USING (ID_CREDITO) '
      
        ' LEFT JOIN(SELECT ID_CREDITO,SUM(IMP_RECUPERADO) as IMP_RECUPERA' +
        'DO '
      
        '  FROM (SELECT DISTINCT CT.ID_CREDITO,(CDT.IMP_CONCEPTO) AS IMP_' +
        'RECUPERADO '
      
        '          FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSA' +
        'CCION CTX, CR_GA_SOL_FEGA GA '
      '         WHERE 1=1 '
      '           AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CTX.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CDT.CVE_OPERACION  = CT.CVE_OPERACION '
      '           AND CT.ID_CREDITO      = GA.ID_CREDITO '
      '           AND CTX.ID_SOLICITUD   = GA.ID_SOLICITUD '
      '           AND CT.ID_TRANS_CANCELA IS NULL '
      '           AND CT.SIT_TRANSACCION ='#39'AC'#39
      
        '           AND CT.CVE_OPERACION in ('#39'RCCPGF'#39','#39'RCINGF'#39','#39'RCCNGF'#39','#39 +
        'RCFNGF'#39') '
      
        '           AND CDT.CVE_CONCEPTO in ('#39'IMPBRU'#39','#39'IMPIVA'#39','#39'IMPMOR'#39','#39 +
        'IVAMOR'#39')'
      
        '           AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39'))' +
        ' GROUP BY ID_CREDITO  ) USING (ID_CREDITO) '
      
        ' LEFT JOIN(SELECT ID_CREDITO,SUM(IMP_RESCATADO) as IMP_RESCATADO' +
        ' '
      
        '  FROM (SELECT DISTINCT CT.ID_CREDITO,(CDT.IMP_CONCEPTO) AS IMP_' +
        'RESCATADO '
      
        '          FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSA' +
        'CCION CTX, CR_GA_SOL_FEGA GA '
      '         WHERE 1=1 '
      '           AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CTX.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CDT.CVE_OPERACION  = CT.CVE_OPERACION '
      '           AND CT.ID_CREDITO      = GA.ID_CREDITO '
      '           AND CTX.ID_SOLICITUD   = GA.ID_SOLICITUD '
      '           AND CT.ID_TRANS_CANCELA IS NULL '
      '           AND CT.SIT_TRANSACCION ='#39'AC'#39
      
        '           AND CT.CVE_OPERACION in ( '#39'RTCPGF'#39','#39'RTINGF'#39','#39'RTFNGF'#39',' +
        #39'RTCNGF'#39', '#39'RSCPGF'#39','#39'RSINGF'#39','#39'RSFNGF'#39','#39'RSCNGF'#39' ) '
      
        '           AND CDT.CVE_CONCEPTO in ('#39'IMPBRU'#39','#39'IMPIVA'#39','#39'IMPMOR'#39','#39 +
        'IVAMOR'#39')'
      
        '           AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39'))' +
        ' GROUP BY ID_CREDITO  ) USING (ID_CREDITO) '
      ')  TOTALES '
      #9'    WHERE CC.SIT_CREDITO = '#39'AC'#39
      
        '                  AND EXISTS (SELECT ID_CREDITO FROM CR_GA_SOL_F' +
        'EGA WHERE ID_CREDITO = CC.ID_CREDITO) '
      #9#9'  AND CO.ID_CONTRATO = CC.ID_CONTRATO '
      #9#9'  AND CTO.ID_CONTRATO = CC.ID_CONTRATO '
      #9#9'  AND TOTALES.ID_CREDITO = CC.ID_CREDITO '
      #9#9'  AND GARANTIA.ID_CREDITO = CC.ID_CREDITO '
      '                  AND CO.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE '
      '   --********************CREDITO********************* '
      #9'          AND CC.ID_CREDITO ='#39'274598'#39' '
      '   --********************MONEDA********************** '
      '                  --P_ID_MONEDA '
      '   --********************ACREDITADO****************** '
      '                  --P_ID_ACREDITADO '
      '   --********************PRODUCTO******************** '
      '                  --P_PRODUCTO '
      '   --********************GRUPO_PRODUCTO************** '
      '                  --P_CVE_PRODUCTO_GPO '
      '   --************************************************ '
      '        ) '
      
        '   WHERE (CAP_IMPBRU > 0) OR (CAP_IMPIVA> 0) OR (CAP_IMPMOR > 0)' +
        ' OR  (CAP_IVAMOR > 0) OR '
      
        #9' (INT_IMPBRU > 0) OR (INT_IMPIVA> 0) OR (INT_IMPMOR > 0) OR  (I' +
        'NT_IVAMOR > 0) OR '
      
        #9' (FIN_IMPBRU > 0) OR (FIN_IMPIVA> 0) OR (FIN_IMPMOR > 0) OR  (F' +
        'IN_IVAMOR > 0) OR '
      
        #9' (OTROS_IMPBRU > 0) OR (OTROS_IMPIVA> 0) OR (OTROS_IMPMOR > 0) ' +
        'OR  (OTROS_IVAMOR > 0)  UNION  SELECT * '
      '   FROM ( '
      #9'   SELECT CO.CVE_MONEDA, '
      
        #9#9'  (SELECT DESC_MONEDA FROM MONEDA WHERE CVE_MONEDA = CO.CVE_MO' +
        'NEDA) AS DESC_MONEDA, '
      
        '                  CP.CVE_PRODUCTO_GPO, TO_CHAR(CO.CVE_PRODUCTO_C' +
        'RE) AS CVE_PRODUCTO, '
      
        #9#9'  (SELECT DESC_C_PRODUCTO FROM CR_PRODUCTO WHERE CVE_PRODUCTO_' +
        'CRE=CO.CVE_PRODUCTO_CRE) AS DESC_PRODUCTO, '
      
        '                  CTO.ID_TITULAR, CTO.NOMB_CONTRATO, CC.ID_CONTR' +
        'ATO, CC.ID_CREDITO, '
      '                  GARANTIA.NUM_PERIODO, '
      '        (CASE '
      
        '           WHEN '#39'RECUPERACIONES'#39' = '#39'APLICACIONES'#39' THEN GARANTIA.' +
        'ID_SOLICITUD '
      
        '           WHEN '#39'RECUPERACIONES'#39' = '#39'RECUPERACIONES'#39' THEN GARANTI' +
        'A.ID_SOLICITUD '
      '           WHEN '#39'RECUPERACIONES'#39' = '#39'RESCATES'#39' THEN 0 '
      '         END) ID_SOLICITUD, '
      '        (CASE '
      
        '           WHEN '#39'RECUPERACIONES'#39' = '#39'APLICACIONES'#39' THEN to_char(F' +
        '_PAGO, '#39'DD/MM/YYYY'#39') '
      
        '           WHEN '#39'RECUPERACIONES'#39' = '#39'RECUPERACIONES'#39' THEN to_char' +
        '(F_PAGO, '#39'DD/MM/YYYY'#39') '
      '           WHEN '#39'RECUPERACIONES'#39' = '#39'RESCATES'#39' THEN '#39#39' '
      '         END) F_SOLICITUD, '
      '                  '#39'RECUPERACIONES'#39' AS TIPO '
      '                  ,TOTALES.IMP_APLICADO '
      '                  ,TOTALES.IMP_RECUPERADO '
      '                  ,TOTALES.IMP_RESCATADO '
      
        '                   , ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_C' +
        'ONCEPTO   FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSA' +
        'CCION CTX  WHERE 1=1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCI' +
        'ON    AND CDT.CVE_OPERACION = CT.CVE_OPERACION    AND CT.ID_TRAN' +
        'SACCION = CTX.ID_TRANSACCION    AND CT.ID_TRANS_CANCELA IS NULL ' +
        '   AND CT.SIT_TRANSACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CR' +
        'EDITO    AND CT.CVE_OPERACION IN ( '#39'RCCPGF'#39' )    AND CDT.CVE_CON' +
        'CEPTO = '#39'IMPBRU'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/M' +
        'M/YYYY'#39')    AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS C' +
        'AP_IMPBRU '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RCCPGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPIVA'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS CAP_IMPIVA '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RCCPGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPMOR'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS CAP_IMPMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RCCPGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IVAMOR'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS CAP_IVAMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RCINGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPBRU'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS INT_IMPBRU '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RCINGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPIVA'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS INT_IMPIVA '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RCINGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPMOR'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS INT_IMPMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RCINGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IVAMOR'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS INT_IVAMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RCFNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPBRU'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS FIN_IMPBRU '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RCFNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPIVA'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS FIN_IMPIVA '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RCFNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPMOR'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS FIN_IMPMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RCFNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IVAMOR'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS FIN_IVAMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RCCNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPBRU'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS OTROS_IMPBRU '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RCCNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPIVA'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS OTROS_IMPIVA '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RCCNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IMPMOR'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS OTROS_IMPMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RCCNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'IVAMOR'#39'   ' +
        ' AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')    AND CTX' +
        '.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS OTROS_IVAMOR '
      
        ' '#9'     FROM CR_CREDITO CC, CR_CONTRATO CO, CONTRATO CTO, CR_PROD' +
        'UCTO CP '
      #9#9'  ,CR_GA_SOL_FEGA GARANTIA '
      
        '                  ,( SELECT ID_CREDITO,IMP_APLICADO, IMP_RECUPER' +
        'ADO, IMP_RESCATADO FROM CR_CREDITO '
      ' LEFT JOIN(SELECT ID_CREDITO,SUM(IMP_APLICADO) as IMP_APLICADO '
      
        '  FROM (SELECT DISTINCT CT.ID_CREDITO,(CDT.IMP_CONCEPTO) AS IMP_' +
        'APLICADO '
      
        '          FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSA' +
        'CCION CTX, CR_GA_SOL_FEGA GA '
      '         WHERE 1=1 '
      '           AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CTX.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CDT.CVE_OPERACION  = CT.CVE_OPERACION '
      '           AND CT.ID_CREDITO      = GA.ID_CREDITO '
      '           AND CTX.ID_SOLICITUD   = GA.ID_SOLICITUD '
      '           AND CT.ID_TRANS_CANCELA IS NULL '
      '           AND CT.SIT_TRANSACCION ='#39'AC'#39
      
        '           AND CT.CVE_OPERACION in ('#39'PGCPGF'#39','#39'PGINGF'#39','#39'PGCNGF'#39','#39 +
        'PGFNGF'#39') '
      
        '           AND CDT.CVE_CONCEPTO in ('#39'IMPBRU'#39','#39'IMPIVA'#39','#39'IMPMOR'#39','#39 +
        'IVAMOR'#39')'
      
        '           AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39'))' +
        ' GROUP BY ID_CREDITO  ) USING (ID_CREDITO) '
      
        ' LEFT JOIN(SELECT ID_CREDITO,SUM(IMP_RECUPERADO) as IMP_RECUPERA' +
        'DO '
      
        '  FROM (SELECT DISTINCT CT.ID_CREDITO,(CDT.IMP_CONCEPTO) AS IMP_' +
        'RECUPERADO '
      
        '          FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSA' +
        'CCION CTX, CR_GA_SOL_FEGA GA '
      '         WHERE 1=1 '
      '           AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CTX.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CDT.CVE_OPERACION  = CT.CVE_OPERACION '
      '           AND CT.ID_CREDITO      = GA.ID_CREDITO '
      '           AND CTX.ID_SOLICITUD   = GA.ID_SOLICITUD '
      '           AND CT.ID_TRANS_CANCELA IS NULL '
      '           AND CT.SIT_TRANSACCION ='#39'AC'#39
      
        '           AND CT.CVE_OPERACION in ('#39'RCCPGF'#39','#39'RCINGF'#39','#39'RCCNGF'#39','#39 +
        'RCFNGF'#39') '
      
        '           AND CDT.CVE_CONCEPTO in ('#39'IMPBRU'#39','#39'IMPIVA'#39','#39'IMPMOR'#39','#39 +
        'IVAMOR'#39')'
      
        '           AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39'))' +
        ' GROUP BY ID_CREDITO  ) USING (ID_CREDITO) '
      
        ' LEFT JOIN(SELECT ID_CREDITO,SUM(IMP_RESCATADO) as IMP_RESCATADO' +
        ' '
      
        '  FROM (SELECT DISTINCT CT.ID_CREDITO,(CDT.IMP_CONCEPTO) AS IMP_' +
        'RESCATADO '
      
        '          FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSA' +
        'CCION CTX, CR_GA_SOL_FEGA GA '
      '         WHERE 1=1 '
      '           AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CTX.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CDT.CVE_OPERACION  = CT.CVE_OPERACION '
      '           AND CT.ID_CREDITO      = GA.ID_CREDITO '
      '           AND CTX.ID_SOLICITUD   = GA.ID_SOLICITUD '
      '           AND CT.ID_TRANS_CANCELA IS NULL '
      '           AND CT.SIT_TRANSACCION ='#39'AC'#39
      
        '           AND CT.CVE_OPERACION in ( '#39'RTCPGF'#39','#39'RTINGF'#39','#39'RTFNGF'#39',' +
        #39'RTCNGF'#39', '#39'RSCPGF'#39','#39'RSINGF'#39','#39'RSFNGF'#39','#39'RSCNGF'#39' ) '
      
        '           AND CDT.CVE_CONCEPTO in ('#39'IMPBRU'#39','#39'IMPIVA'#39','#39'IMPMOR'#39','#39 +
        'IVAMOR'#39')'
      
        '           AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39'))' +
        ' GROUP BY ID_CREDITO  ) USING (ID_CREDITO) '
      ')  TOTALES '
      #9'    WHERE CC.SIT_CREDITO = '#39'AC'#39
      
        '                  AND EXISTS (SELECT ID_CREDITO FROM CR_GA_SOL_F' +
        'EGA WHERE ID_CREDITO = CC.ID_CREDITO) '
      #9#9'  AND CO.ID_CONTRATO = CC.ID_CONTRATO '
      #9#9'  AND CTO.ID_CONTRATO = CC.ID_CONTRATO '
      #9#9'  AND TOTALES.ID_CREDITO = CC.ID_CREDITO '
      #9#9'  AND GARANTIA.ID_CREDITO = CC.ID_CREDITO '
      '                  AND CO.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE '
      '   --********************CREDITO********************* '
      #9'          AND CC.ID_CREDITO ='#39'274598'#39' '
      '   --********************MONEDA********************** '
      '                  --P_ID_MONEDA '
      '   --********************ACREDITADO****************** '
      '                  --P_ID_ACREDITADO '
      '   --********************PRODUCTO******************** '
      '                  --P_PRODUCTO '
      '   --********************GRUPO_PRODUCTO************** '
      '                  --P_CVE_PRODUCTO_GPO '
      '   --************************************************ '
      '        ) '
      
        '   WHERE (CAP_IMPBRU > 0) OR (CAP_IMPIVA> 0) OR (CAP_IMPMOR > 0)' +
        ' OR  (CAP_IVAMOR > 0) OR '
      
        #9' (INT_IMPBRU > 0) OR (INT_IMPIVA> 0) OR (INT_IMPMOR > 0) OR  (I' +
        'NT_IVAMOR > 0) OR '
      
        #9' (FIN_IMPBRU > 0) OR (FIN_IMPIVA> 0) OR (FIN_IMPMOR > 0) OR  (F' +
        'IN_IVAMOR > 0) OR '
      
        #9' (OTROS_IMPBRU > 0) OR (OTROS_IMPIVA> 0) OR (OTROS_IMPMOR > 0) ' +
        'OR  (OTROS_IVAMOR > 0)  UNION  SELECT * '
      '   FROM ( '
      #9'   SELECT CO.CVE_MONEDA, '
      
        #9#9'  (SELECT DESC_MONEDA FROM MONEDA WHERE CVE_MONEDA = CO.CVE_MO' +
        'NEDA) AS DESC_MONEDA, '
      
        '                  CP.CVE_PRODUCTO_GPO, TO_CHAR(CO.CVE_PRODUCTO_C' +
        'RE) AS CVE_PRODUCTO, '
      
        #9#9'  (SELECT DESC_C_PRODUCTO FROM CR_PRODUCTO WHERE CVE_PRODUCTO_' +
        'CRE=CO.CVE_PRODUCTO_CRE) AS DESC_PRODUCTO, '
      
        '                  CTO.ID_TITULAR, CTO.NOMB_CONTRATO, CC.ID_CONTR' +
        'ATO, CC.ID_CREDITO, '
      '                  GARANTIA.NUM_PERIODO, '
      '        (CASE '
      
        '           WHEN '#39'RESCATES'#39' = '#39'APLICACIONES'#39' THEN GARANTIA.ID_SOL' +
        'ICITUD '
      
        '           WHEN '#39'RESCATES'#39' = '#39'RECUPERACIONES'#39' THEN GARANTIA.ID_S' +
        'OLICITUD '
      '           WHEN '#39'RESCATES'#39' = '#39'RESCATES'#39' THEN 0 '
      '         END) ID_SOLICITUD, '
      '        (CASE '
      
        '           WHEN '#39'RESCATES'#39' = '#39'APLICACIONES'#39' THEN to_char(F_PAGO,' +
        ' '#39'DD/MM/YYYY'#39') '
      
        '           WHEN '#39'RESCATES'#39' = '#39'RECUPERACIONES'#39' THEN to_char(F_PAG' +
        'O, '#39'DD/MM/YYYY'#39') '
      '           WHEN '#39'RESCATES'#39' = '#39'RESCATES'#39' THEN '#39#39' '
      '         END) F_SOLICITUD, '
      '                  '#39'RESCATES'#39' AS TIPO '
      '                  ,TOTALES.IMP_APLICADO '
      '                  ,TOTALES.IMP_RECUPERADO '
      '                  ,TOTALES.IMP_RESCATADO '
      
        '                   , ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_C' +
        'ONCEPTO   FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSA' +
        'CCION CTX  WHERE 1=1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCI' +
        'ON    AND CDT.CVE_OPERACION = CT.CVE_OPERACION    AND CT.ID_TRAN' +
        'SACCION = CTX.ID_TRANSACCION    AND CT.ID_TRANS_CANCELA IS NULL ' +
        '   AND CT.SIT_TRANSACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CR' +
        'EDITO    AND CT.CVE_OPERACION IN ( '#39'RTCPGF'#39','#39'RSCPGF'#39' )    AND CD' +
        'T.CVE_CONCEPTO = '#39'IMPBRU'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/20' +
        '10'#39','#39'DD/MM/YYYY'#39')    AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITU' +
        'D  ) AS CAP_IMPBRU '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RTCPGF'#39','#39'RSCPGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'I' +
        'MPIVA'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')  ' +
        '  AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS CAP_IMPIVA '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RTCPGF'#39','#39'RSCPGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'I' +
        'MPMOR'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')  ' +
        '  AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS CAP_IMPMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RTCPGF'#39','#39'RSCPGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'I' +
        'VAMOR'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')  ' +
        '  AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS CAP_IVAMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RTINGF'#39','#39'RSINGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'I' +
        'MPBRU'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')  ' +
        '  AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS INT_IMPBRU '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RTINGF'#39','#39'RSINGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'I' +
        'MPIVA'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')  ' +
        '  AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS INT_IMPIVA '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RTINGF'#39','#39'RSINGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'I' +
        'MPMOR'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')  ' +
        '  AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS INT_IMPMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RTINGF'#39','#39'RSINGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'I' +
        'VAMOR'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')  ' +
        '  AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS INT_IVAMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RTFNGF'#39','#39'RSFNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'I' +
        'MPBRU'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')  ' +
        '  AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS FIN_IMPBRU '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RTFNGF'#39','#39'RSFNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'I' +
        'MPIVA'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')  ' +
        '  AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS FIN_IMPIVA '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RTFNGF'#39','#39'RSFNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'I' +
        'MPMOR'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')  ' +
        '  AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS FIN_IMPMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RTFNGF'#39','#39'RSFNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'I' +
        'VAMOR'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')  ' +
        '  AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS FIN_IVAMOR '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RTCNGF'#39','#39'RSCNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'I' +
        'MPBRU'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')  ' +
        '  AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS OTROS_IMPBR' +
        'U '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RTCNGF'#39','#39'RSCNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'I' +
        'MPIVA'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')  ' +
        '  AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS OTROS_IMPIV' +
        'A '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RTCNGF'#39','#39'RSCNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'I' +
        'MPMOR'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')  ' +
        '  AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS OTROS_IMPMO' +
        'R '
      
        ', ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO   FROM CR_T' +
        'RANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CTX  WHERE 1=' +
        '1    AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION    AND CDT.CVE_O' +
        'PERACION = CT.CVE_OPERACION    AND CT.ID_TRANSACCION = CTX.ID_TR' +
        'ANSACCION    AND CT.ID_TRANS_CANCELA IS NULL    AND CT.SIT_TRANS' +
        'ACCION = '#39'AC'#39'    AND CT.ID_CREDITO = CC.ID_CREDITO    AND CT.CVE' +
        '_OPERACION IN ( '#39'RTCNGF'#39','#39'RSCNGF'#39' )    AND CDT.CVE_CONCEPTO = '#39'I' +
        'VAMOR'#39'    AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39')  ' +
        '  AND CTX.ID_SOLICITUD = GARANTIA.ID_SOLICITUD  ) AS OTROS_IVAMO' +
        'R '
      
        ' '#9'     FROM CR_CREDITO CC, CR_CONTRATO CO, CONTRATO CTO, CR_PROD' +
        'UCTO CP '
      #9#9'  ,CR_GA_SOL_FEGA GARANTIA '
      
        '                  ,( SELECT ID_CREDITO,IMP_APLICADO, IMP_RECUPER' +
        'ADO, IMP_RESCATADO FROM CR_CREDITO '
      ' LEFT JOIN(SELECT ID_CREDITO,SUM(IMP_APLICADO) as IMP_APLICADO '
      
        '  FROM (SELECT DISTINCT CT.ID_CREDITO,(CDT.IMP_CONCEPTO) AS IMP_' +
        'APLICADO '
      
        '          FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSA' +
        'CCION CTX, CR_GA_SOL_FEGA GA '
      '         WHERE 1=1 '
      '           AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CTX.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CDT.CVE_OPERACION  = CT.CVE_OPERACION '
      '           AND CT.ID_CREDITO      = GA.ID_CREDITO '
      '           AND CTX.ID_SOLICITUD   = GA.ID_SOLICITUD '
      '           AND CT.ID_TRANS_CANCELA IS NULL '
      '           AND CT.SIT_TRANSACCION ='#39'AC'#39
      
        '           AND CT.CVE_OPERACION in ('#39'PGCPGF'#39','#39'PGINGF'#39','#39'PGCNGF'#39','#39 +
        'PGFNGF'#39') '
      
        '           AND CDT.CVE_CONCEPTO in ('#39'IMPBRU'#39','#39'IMPIVA'#39','#39'IMPMOR'#39','#39 +
        'IVAMOR'#39')'
      
        '           AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39'))' +
        ' GROUP BY ID_CREDITO  ) USING (ID_CREDITO) '
      
        ' LEFT JOIN(SELECT ID_CREDITO,SUM(IMP_RECUPERADO) as IMP_RECUPERA' +
        'DO '
      
        '  FROM (SELECT DISTINCT CT.ID_CREDITO,(CDT.IMP_CONCEPTO) AS IMP_' +
        'RECUPERADO '
      
        '          FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSA' +
        'CCION CTX, CR_GA_SOL_FEGA GA '
      '         WHERE 1=1 '
      '           AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CTX.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CDT.CVE_OPERACION  = CT.CVE_OPERACION '
      '           AND CT.ID_CREDITO      = GA.ID_CREDITO '
      '           AND CTX.ID_SOLICITUD   = GA.ID_SOLICITUD '
      '           AND CT.ID_TRANS_CANCELA IS NULL '
      '           AND CT.SIT_TRANSACCION ='#39'AC'#39
      
        '           AND CT.CVE_OPERACION in ('#39'RCCPGF'#39','#39'RCINGF'#39','#39'RCCNGF'#39','#39 +
        'RCFNGF'#39') '
      
        '           AND CDT.CVE_CONCEPTO in ('#39'IMPBRU'#39','#39'IMPIVA'#39','#39'IMPMOR'#39','#39 +
        'IVAMOR'#39')'
      
        '           AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39'))' +
        ' GROUP BY ID_CREDITO  ) USING (ID_CREDITO) '
      
        ' LEFT JOIN(SELECT ID_CREDITO,SUM(IMP_RESCATADO) as IMP_RESCATADO' +
        ' '
      
        '  FROM (SELECT DISTINCT CT.ID_CREDITO,(CDT.IMP_CONCEPTO) AS IMP_' +
        'RESCATADO '
      
        '          FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSA' +
        'CCION CTX, CR_GA_SOL_FEGA GA '
      '         WHERE 1=1 '
      '           AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CTX.ID_TRANSACCION = CT.ID_TRANSACCION '
      '           AND CDT.CVE_OPERACION  = CT.CVE_OPERACION '
      '           AND CT.ID_CREDITO      = GA.ID_CREDITO '
      '           AND CTX.ID_SOLICITUD   = GA.ID_SOLICITUD '
      '           AND CT.ID_TRANS_CANCELA IS NULL '
      '           AND CT.SIT_TRANSACCION ='#39'AC'#39
      
        '           AND CT.CVE_OPERACION in ( '#39'RTCPGF'#39','#39'RTINGF'#39','#39'RTFNGF'#39',' +
        #39'RTCNGF'#39', '#39'RSCPGF'#39','#39'RSINGF'#39','#39'RSFNGF'#39','#39'RSCNGF'#39' ) '
      
        '           AND CDT.CVE_CONCEPTO in ('#39'IMPBRU'#39','#39'IMPIVA'#39','#39'IMPMOR'#39','#39 +
        'IVAMOR'#39')'
      
        '           AND CT.F_VALOR <= TO_DATE('#39'31/10/2010'#39','#39'DD/MM/YYYY'#39'))' +
        ' GROUP BY ID_CREDITO  ) USING (ID_CREDITO) '
      ')  TOTALES '
      #9'    WHERE CC.SIT_CREDITO = '#39'AC'#39
      
        '                  AND EXISTS (SELECT ID_CREDITO FROM CR_GA_SOL_F' +
        'EGA WHERE ID_CREDITO = CC.ID_CREDITO) '
      #9#9'  AND CO.ID_CONTRATO = CC.ID_CONTRATO '
      #9#9'  AND CTO.ID_CONTRATO = CC.ID_CONTRATO '
      #9#9'  AND TOTALES.ID_CREDITO = CC.ID_CREDITO '
      #9#9'  AND GARANTIA.ID_CREDITO = CC.ID_CREDITO '
      '                  AND CO.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE '
      '   --********************CREDITO********************* '
      #9'          AND CC.ID_CREDITO ='#39'274598'#39' '
      '   --********************MONEDA********************** '
      '                  --P_ID_MONEDA '
      '   --********************ACREDITADO****************** '
      '                  --P_ID_ACREDITADO '
      '   --********************PRODUCTO******************** '
      '                  --P_PRODUCTO '
      '   --********************GRUPO_PRODUCTO************** '
      '                  --P_CVE_PRODUCTO_GPO '
      '   --************************************************ '
      '        ) '
      
        '   WHERE (CAP_IMPBRU > 0) OR (CAP_IMPIVA> 0) OR (CAP_IMPMOR > 0)' +
        ' OR  (CAP_IVAMOR > 0) OR '
      
        #9' (INT_IMPBRU > 0) OR (INT_IMPIVA> 0) OR (INT_IMPMOR > 0) OR  (I' +
        'NT_IVAMOR > 0) OR '
      
        #9' (FIN_IMPBRU > 0) OR (FIN_IMPIVA> 0) OR (FIN_IMPMOR > 0) OR  (F' +
        'IN_IVAMOR > 0) OR '
      
        #9' (OTROS_IMPBRU > 0) OR (OTROS_IMPIVA> 0) OR (OTROS_IMPMOR > 0) ' +
        'OR  (OTROS_IVAMOR > 0) ) ORDER BY '
      ' CVE_MONEDA, '
      ' CVE_PRODUCTO_GPO, '
      ' CVE_PRODUCTO, '
      ' ID_TITULAR, '
      ' NOMB_CONTRATO, '
      ' ID_CONTRATO, '
      ' ID_CREDITO, '
      ' TIPO, '
      ' NUM_PERIODO, '
      ' ID_SOLICITUD '
      '')
    Left = 181
    Top = 23
    object qyAplicRecuCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyAplicRecuCVE_PRODUCTO_GPO: TStringField
      FieldName = 'CVE_PRODUCTO_GPO'
      Size = 6
    end
    object qyAplicRecuCVE_PRODUCTO: TStringField
      FieldName = 'CVE_PRODUCTO'
      Size = 6
    end
    object qyAplicRecuID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object qyAplicRecuNOMB_CONTRATO: TStringField
      FieldName = 'NOMB_CONTRATO'
      Size = 80
    end
    object qyAplicRecuID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qyAplicRecuID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyAplicRecuID_SOLICITUD: TFloatField
      FieldName = 'ID_SOLICITUD'
    end
    object qyAplicRecuTIPO: TStringField
      FieldName = 'TIPO'
      Size = 14
    end
    object qyAplicRecuCAP_IMPBRU: TFloatField
      FieldName = 'CAP_IMPBRU'
    end
    object qyAplicRecuCAP_IMPIVA: TFloatField
      FieldName = 'CAP_IMPIVA'
    end
    object qyAplicRecuCAP_IMPMOR: TFloatField
      FieldName = 'CAP_IMPMOR'
    end
    object qyAplicRecuCAP_IVAMOR: TFloatField
      FieldName = 'CAP_IVAMOR'
    end
    object qyAplicRecuINT_IMPBRU: TFloatField
      FieldName = 'INT_IMPBRU'
    end
    object qyAplicRecuINT_IMPIVA: TFloatField
      FieldName = 'INT_IMPIVA'
    end
    object qyAplicRecuINT_IMPMOR: TFloatField
      FieldName = 'INT_IMPMOR'
    end
    object qyAplicRecuINT_IVAMOR: TFloatField
      FieldName = 'INT_IVAMOR'
    end
    object qyAplicRecuFIN_IMPBRU: TFloatField
      FieldName = 'FIN_IMPBRU'
    end
    object qyAplicRecuFIN_IMPIVA: TFloatField
      FieldName = 'FIN_IMPIVA'
    end
    object qyAplicRecuFIN_IMPMOR: TFloatField
      FieldName = 'FIN_IMPMOR'
    end
    object qyAplicRecuFIN_IVAMOR: TFloatField
      FieldName = 'FIN_IVAMOR'
    end
    object qyAplicRecuOTROS_IMPBRU: TFloatField
      FieldName = 'OTROS_IMPBRU'
    end
    object qyAplicRecuOTROS_IMPIVA: TFloatField
      FieldName = 'OTROS_IMPIVA'
    end
    object qyAplicRecuOTROS_IMPMOR: TFloatField
      FieldName = 'OTROS_IMPMOR'
    end
    object qyAplicRecuOTROS_IVAMOR: TFloatField
      FieldName = 'OTROS_IVAMOR'
    end
    object qyAplicRecuDESC_PRODUCTO: TStringField
      FieldName = 'DESC_PRODUCTO'
      Size = 30
    end
    object qyAplicRecuDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyAplicRecuIMP_APLICADO: TFloatField
      FieldName = 'IMP_APLICADO'
    end
    object qyAplicRecuIMP_RECUPERADO: TFloatField
      FieldName = 'IMP_RECUPERADO'
    end
    object qyAplicRecuF_SOLICITUD: TStringField
      FieldName = 'F_SOLICITUD'
    end
    object qyAplicRecuIMP_RESCATADO: TFloatField
      FieldName = 'IMP_RESCATADO'
    end
    object qyAplicRecuTIPO_DESC: TStringField
      FieldName = 'TIPO_DESC'
    end
  end
end
