object QrInColCob: TQrInColCob
  Left = -38
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  BeforePrint = QuickRepBeforePrint
  DataSet = qyInfCobConta
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
  object PageHeaderBand1: TQRBand
    Left = 38
    Top = 38
    Width = 980
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
      2592.91666666667)
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
  object QRBand1: TQRBand
    Left = 38
    Top = 254
    Width = 980
    Height = 0
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
      0
      2592.91666666667)
    BandType = rbDetail
    object QRDBText9: TQRDBText
      Left = -10
      Top = 0
      Width = 7
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        -26.4583333333333
        0
        18.5208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'IMP_CONCEPTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
  end
  object QRBand2: TQRBand
    Left = 38
    Top = 122
    Width = 980
    Height = 37
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
      97.8958333333333
      2592.91666666667)
    BandType = rbColumnHeader
    object QRLabel5: TQRLabel
      Left = 178
      Top = 1
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        470.958333333333
        2.64583333333333
        232.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'COLOCACIÓN'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 690
      Top = 1
      Width = 72
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1825.625
        2.64583333333333
        190.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'COBRANZA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 153
      Top = 18
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        404.8125
        47.625
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Colocación'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 497
      Top = 19
      Width = 41
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1314.97916666667
        50.2708333333333
        108.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Capital'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel11: TQRLabel
      Left = 329
      Top = 19
      Width = 62
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        870.479166666667
        50.2708333333333
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Ren/Reest'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape4: TQRShape
      Left = 451
      Top = 16
      Width = 525
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        1193.27083333333
        42.3333333333333
        1389.0625)
      Shape = qrsRectangle
    end
    object QRShape5: TQRShape
      Left = 3
      Top = 16
      Width = 441
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        7.9375
        42.3333333333333
        1166.8125)
      Shape = qrsRectangle
    end
    object QRLabel16: TQRLabel
      Left = 633
      Top = 19
      Width = 49
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1674.8125
        50.2708333333333
        129.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fin Adic'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 761
      Top = 19
      Width = 40
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2013.47916666667
        50.2708333333333
        105.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Interés'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 897
      Top = 19
      Width = 29
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2373.3125
        50.2708333333333
        76.7291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRAcred: TQRBand
    Left = 38
    Top = 267
    Width = 980
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRAcredBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      34.3958333333333
      2592.91666666667)
    BandType = rbGroupFooter
    object QRLabel13: TQRLabel
      Left = 61
      Top = 0
      Width = 77
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        161.395833333333
        0
        203.729166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total   Acreditado:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel39: TQRLabel
      Left = 265
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        701.145833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel40: TQRLabel
      Left = 430
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1137.70833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel41: TQRLabel
      Left = 583
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1542.52083333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel42: TQRLabel
      Left = 850
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2248.95833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel86: TQRLabel
      Left = 722
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1910.29166666667
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel88: TQRLabel
      Left = 970
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2566.45833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object QRMoneda: TQRBand
    Left = 38
    Top = 332
    Width = 980
    Height = 119
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRMonedaBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      314.854166666667
      2592.91666666667)
    BandType = rbGroupFooter
    object QRLabel19: TQRLabel
      Left = 4
      Top = 19
      Width = 37
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        10.5833333333333
        50.2708333333333
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape6: TQRShape
      Left = 4
      Top = 36
      Width = 973
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.29166666666667
        10.5833333333333
        95.25
        2574.39583333333)
      Shape = qrsRectangle
    end
    object QRLabel43: TQRLabel
      Left = 263
      Top = 20
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        695.854166666667
        52.9166666666667
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel44: TQRLabel
      Left = 428
      Top = 20
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1132.41666666667
        52.9166666666667
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel45: TQRLabel
      Left = 581
      Top = 20
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1537.22916666667
        52.9166666666667
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel46: TQRLabel
      Left = 849
      Top = 20
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2246.3125
        52.9166666666667
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRShape1: TQRShape
      Left = 2
      Top = 57
      Width = 977
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        5.29166666666667
        150.8125
        2584.97916666667)
      Shape = qrsRectangle
    end
    object QRLabel47: TQRLabel
      Left = 4
      Top = 39
      Width = 236
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        10.5833333333333
        103.1875
        624.416666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Resumen Con Entidad Descontadora:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel48: TQRLabel
      Left = 4
      Top = 78
      Width = 228
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        10.5833333333333
        206.375
        603.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Resumen Sin Entidad Descontadora'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape2: TQRShape
      Left = 2
      Top = 97
      Width = 977
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        5.29166666666667
        256.645833333333
        2584.97916666667)
      Shape = qrsRectangle
    end
    object QRLabel49: TQRLabel
      Left = 79
      Top = 59
      Width = 64
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        209.020833333333
        156.104166666667
        169.333333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Colocación:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel50: TQRLabel
      Left = 263
      Top = 59
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        695.854166666667
        156.104166666667
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel52: TQRLabel
      Left = 428
      Top = 59
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1132.41666666667
        156.104166666667
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel54: TQRLabel
      Left = 581
      Top = 59
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1537.22916666667
        156.104166666667
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel56: TQRLabel
      Left = 849
      Top = 59
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2246.3125
        156.104166666667
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel58: TQRLabel
      Left = 263
      Top = 99
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        695.854166666667
        261.9375
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel60: TQRLabel
      Left = 428
      Top = 99
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1132.41666666667
        261.9375
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel62: TQRLabel
      Left = 581
      Top = 99
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1537.22916666667
        261.9375
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel64: TQRLabel
      Left = 849
      Top = 99
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2246.3125
        261.9375
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel57: TQRLabel
      Left = 79
      Top = 99
      Width = 64
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        209.020833333333
        261.9375
        169.333333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Colocación:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel103: TQRLabel
      Left = 721
      Top = 20
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1907.64583333333
        52.9166666666667
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel105: TQRLabel
      Left = 969
      Top = 20
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2563.8125
        52.9166666666667
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel107: TQRLabel
      Left = 721
      Top = 59
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1907.64583333333
        156.104166666667
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel109: TQRLabel
      Left = 969
      Top = 59
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2563.8125
        156.104166666667
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel111: TQRLabel
      Left = 721
      Top = 99
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1907.64583333333
        261.9375
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel113: TQRLabel
      Left = 969
      Top = 99
      Width = 8
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2563.8125
        261.9375
        21.1666666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel3: TQRLabel
      Left = 4
      Top = 2
      Width = 64
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        10.5833333333333
        5.29166666666667
        169.333333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Resumen:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText5: TQRDBText
      Left = 146
      Top = 2
      Width = 90
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        386.291666666667
        5.29166666666667
        238.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'CVE_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText6: TQRDBText
      Left = 258
      Top = 2
      Width = 99
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        682.625
        5.29166666666667
        261.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'DESC_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRFondeo: TQRBand
    Left = 38
    Top = 254
    Width = 980
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFondeoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      34.3958333333333
      2592.91666666667)
    BandType = rbGroupFooter
    object QRLabel24: TQRLabel
      Left = 68
      Top = 0
      Width = 58
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        179.916666666667
        0
        153.458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total Fondeo:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel31: TQRLabel
      Left = 265
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        701.145833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel32: TQRLabel
      Left = 430
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1137.70833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel33: TQRLabel
      Left = 583
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1542.52083333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel34: TQRLabel
      Left = 850
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2248.95833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel17: TQRLabel
      Left = 722
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1910.29166666667
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel90: TQRLabel
      Left = 970
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2566.45833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object QRfbProducto: TQRBand
    Left = 38
    Top = 293
    Width = 980
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRfbProductoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      34.3958333333333
      2592.91666666667)
    BandType = rbGroupFooter
    object QRLabel67: TQRLabel
      Left = 44
      Top = 0
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        116.416666666667
        0
        209.020833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total      Producto:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel68: TQRLabel
      Left = 265
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        701.145833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel70: TQRLabel
      Left = 430
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1137.70833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel72: TQRLabel
      Left = 583
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1542.52083333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel74: TQRLabel
      Left = 850
      Top = 1
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2248.95833333333
        2.64583333333333
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel97: TQRLabel
      Left = 850
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2248.95833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel99: TQRLabel
      Left = 722
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1910.29166666667
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel101: TQRLabel
      Left = 970
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2566.45833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object QRfbMercObj2: TQRBand
    Left = 38
    Top = 280
    Width = 980
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRfbMercObj2BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      34.3958333333333
      2592.91666666667)
    BandType = rbGroupFooter
    object QRLabel75: TQRLabel
      Left = 53
      Top = 0
      Width = 67
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        140.229166666667
        0
        177.270833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total Merc Obj.:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel76: TQRLabel
      Left = 265
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        701.145833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel78: TQRLabel
      Left = 430
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1137.70833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel80: TQRLabel
      Left = 583
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1542.52083333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel82: TQRLabel
      Left = 850
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2248.95833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel94: TQRLabel
      Left = 722
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1910.29166666667
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel96: TQRLabel
      Left = 971
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2569.10416666667
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object QRGMoneda: TQRGroup
    Left = 38
    Top = 159
    Width = 980
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRGMonedaAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      63.5
      2592.91666666667)
    Expression = 'qyInfCobConta.CVE_MONEDA'
    FooterBand = QRMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText1: TQRDBText
      Left = 146
      Top = 3
      Width = 105
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        386.291666666667
        7.9375
        277.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'CVE_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRDBText2: TQRDBText
      Left = 258
      Top = 3
      Width = 117
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        682.625
        7.9375
        309.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'DESC_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel1: TQRLabel
      Left = 5
      Top = 3
      Width = 62
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        13.2291666666667
        7.9375
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
  end
  object QRGPAsoc: TQRGroup
    Left = 38
    Top = 183
    Width = 980
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
      2592.91666666667)
    Expression = 'qyInfCobConta.NOMBRE_PAS'
    FooterBand = QRFPAS
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel12: TQRLabel
      Left = 28
      Top = 0
      Width = 50
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        74.0833333333333
        0
        132.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Prom Asoc:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText10: TQRDBText
      Left = 147
      Top = 1
      Width = 84
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        388.9375
        2.64583333333333
        222.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'ID_PERSONA_PAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText11: TQRDBText
      Left = 259
      Top = 1
      Width = 64
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        685.270833333333
        2.64583333333333
        169.333333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'NOMBRE_PAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRShape8: TQRShape
      Left = 582
      Top = 5
      Width = 383
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        1539.875
        13.2291666666667
        1013.35416666667)
      Shape = qrsRectangle
    end
    object QRShape10: TQRShape
      Left = 582
      Top = 7
      Width = 383
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        1539.875
        18.5208333333333
        1013.35416666667)
      Shape = qrsRectangle
    end
  end
  object QRGPAdm: TQRGroup
    Left = 38
    Top = 196
    Width = 980
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
      2592.91666666667)
    Expression = 'qyInfCobConta.NOMBRE_PAD'
    FooterBand = QRFPAD
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel14: TQRLabel
      Left = 36
      Top = 0
      Width = 55
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        95.25
        0
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Prom Admin:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText16: TQRDBText
      Left = 147
      Top = 1
      Width = 85
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        388.9375
        2.64583333333333
        224.895833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'ID_PERSONA_PAD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText17: TQRDBText
      Left = 259
      Top = 1
      Width = 65
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        685.270833333333
        2.64583333333333
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'NOMBRE_PAD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRShape9: TQRShape
      Left = 582
      Top = 6
      Width = 383
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        1539.875
        15.875
        1013.35416666667)
      Shape = qrsRectangle
    end
  end
  object QRGProducto: TQRGroup
    Left = 38
    Top = 209
    Width = 980
    Height = 11
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
      29.1041666666667
      2592.91666666667)
    Expression = 'qyInfCobConta.CVE_PRODUCTO_CRE'
    FooterBand = QRfbProducto
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel66: TQRLabel
      Left = 44
      Top = 0
      Width = 41
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        116.416666666667
        0
        108.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Producto:'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText12: TQRDBText
      Left = 147
      Top = 0
      Width = 103
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        388.9375
        0
        272.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clBlack
      DataSet = qyInfCobConta
      DataField = 'CVE_PRODUCTO_CRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText13: TQRDBText
      Left = 258
      Top = 0
      Width = 95
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        682.625
        0
        251.354166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clBlack
      DataSet = qyInfCobConta
      DataField = 'DESC_L_PRODUCTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object QRMercObjSup: TQRGroup
    Left = 38
    Top = 220
    Width = 980
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clGray
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      29.1041666666667
      2592.91666666667)
    Expression = 'qyInfCobConta.DESC_PRESUPUESTO'
    FooterBand = QRfbMercObj2
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel83: TQRLabel
      Left = 53
      Top = 0
      Width = 62
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        140.229166666667
        0
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Merc Objetivo:'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText14: TQRDBText
      Left = 146
      Top = 0
      Width = 104
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        386.291666666667
        0
        275.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clGray
      DataSet = qyInfCobConta
      DataField = 'CVE_PRESUPUESTO_2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText15: TQRDBText
      Left = 257
      Top = 0
      Width = 101
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        679.979166666667
        0
        267.229166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clGray
      DataSet = qyInfCobConta
      DataField = 'DESC_PRESUPUESTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object QRGAcreditado: TQRGroup
    Left = 38
    Top = 231
    Width = 980
    Height = 11
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
      29.1041666666667
      2592.91666666667)
    Expression = 'qyInfCobConta.NOMBRE'
    FooterBand = QRAcred
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel2: TQRLabel
      Left = 61
      Top = 0
      Width = 48
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        161.395833333333
        0
        127)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Acreditado:'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText3: TQRDBText
      Left = 147
      Top = 0
      Width = 54
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        388.9375
        0
        142.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clSilver
      DataSet = qyInfCobConta
      DataField = 'ID_TITULAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText4: TQRDBText
      Left = 257
      Top = 0
      Width = 41
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        679.979166666667
        0
        108.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clSilver
      DataSet = qyInfCobConta
      DataField = 'NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object QRGFondeo: TQRGroup
    Left = 38
    Top = 242
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
    Expression = 'qyInfCobConta.CVE_FONDEO'
    FooterBand = QRFondeo
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel4: TQRLabel
      Left = 68
      Top = 0
      Width = 35
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        179.916666666667
        0
        92.6041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fondeo:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText7: TQRDBText
      Left = 147
      Top = 0
      Width = 65
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        388.9375
        0
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'CVE_FONDEO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText8: TQRDBText
      Left = 259
      Top = 0
      Width = 74
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        685.270833333333
        0
        195.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyInfCobConta
      DataField = 'DESC_ENT_DES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object QRFPAD: TQRBand
    Left = 38
    Top = 306
    Width = 980
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFPADBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      34.3958333333333
      2592.91666666667)
    BandType = rbGroupFooter
    object QRLabel15: TQRLabel
      Left = 36
      Top = 0
      Width = 93
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        95.25
        0
        246.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total      Prom Admin:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel18: TQRLabel
      Left = 265
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        701.145833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel20: TQRLabel
      Left = 430
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1137.70833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel21: TQRLabel
      Left = 583
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1542.52083333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel22: TQRLabel
      Left = 850
      Top = 1
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2248.95833333333
        2.64583333333333
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel25: TQRLabel
      Left = 850
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2248.95833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel26: TQRLabel
      Left = 722
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1910.29166666667
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel27: TQRLabel
      Left = 970
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2566.45833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object QRFPAS: TQRBand
    Left = 38
    Top = 319
    Width = 980
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFPASBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      34.3958333333333
      2592.91666666667)
    BandType = rbGroupFooter
    object QRLabel28: TQRLabel
      Left = 28
      Top = 0
      Width = 88
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        74.0833333333333
        0
        232.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total      Prom Asoc:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel29: TQRLabel
      Left = 265
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        701.145833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel30: TQRLabel
      Left = 430
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1137.70833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel51: TQRLabel
      Left = 583
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1542.52083333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel53: TQRLabel
      Left = 850
      Top = 1
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2248.95833333333
        2.64583333333333
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel55: TQRLabel
      Left = 850
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2248.95833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel59: TQRLabel
      Left = 722
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1910.29166666667
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel61: TQRLabel
      Left = 970
      Top = 0
      Width = 6
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2566.45833333333
        0
        15.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'X'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object qyInfCobConta: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      ' SELECT * FROM( '
      ' SELECT TEMP1.*, '
      '        CVE_ACCESORIO AS TIPO_OPER '
      ' FROM  (SELECT  M.CVE_MONEDA    , '
      '                M.DESC_MONEDA           , '
      '                CP.CVE_PRODUCTO_CRE     , '
      '                CP.DESC_L_PRODUCTO      , '
      '                CTO.ID_TITULAR          , '
      '                PT.NOMBRE               , '
      '                TRA.CVE_ACCESORIO       , '
      '                TRA.CVE_TIPO_MOVTO      , '
      '                TRA.CVE_OPERACION_ORI   , '
      '                TRA.CVE_CONCEPTO        , '
      '                TRA.IMP_CONCEPTO        , '
      '                CP.CVE_PRODUCTO_GPO     , '
      '                CPG.DESC_L_PROD_GPO     , '
      
        '                NVL(CRP.CVE_PRESUPUESTO,'#39'NO-CLA'#39') AS CVE_PRESUPU' +
        'ESTO    , '
      
        '                NVL(CRP.CVE_PRESUPUESTO,'#39'NO-CLA'#39') AS CVE_PRESUPU' +
        'ESTO_2    , '
      
        '                NVL(CRP.DESC_PRESUPUESTO,'#39'NO-CLASIFICADO'#39') AS DE' +
        'SC_PRESUPUESTO, '
      
        '                DECODE(CFND.ID_CREDITO,NULL,'#39'SIN FONDEO'#39',CFND.CV' +
        'E_FND_ENT_DES ) AS CVE_FONDEO, '
      
        '                DECODE(CFND.ID_CREDITO,NULL,'#39'SIN FONDEO'#39',CFED.DE' +
        'SC_ENT_DES ) AS DESC_ENT_DES, '
      '                PAD.ID_PERSONA AS ID_PERSONA_PAD, '
      '                PAD.NOMBRE AS NOMBRE_PAD, '
      '                PAS.ID_PERSONA AS ID_PERSONA_PAS, '
      '                PAS.NOMBRE AS NOMBRE_PAS '
      '          FROM  CR_CREDITO CC      , '
      '                CR_CESION CS       , '
      
        '               ( SELECT CT.ID_CREDITO             ,       CT.ID_' +
        'TRANSACCION, '
      
        '                        CT.CVE_TIPO_MOVTO         ,       CT.CVE' +
        '_OPERACION, '
      
        '                        CT.CVE_COMISION           ,       CT.ID_' +
        'CONTRATO, '
      
        '                        CDT.CVE_CONCEPTO          ,       CDT.IM' +
        'P_CONCEPTO  , '
      
        '                        CO.CVE_ACCESORIO          ,       CO.DES' +
        'C_C_OPERACION , '
      '                        CO.CVE_OPERACION CVE_OPERACION_ORI '
      
        '                 FROM    CR_TRANSACCION CT, CR_DET_TRANSAC CDT, ' +
        'CR_OPERACION CO, CONTRATO CTO '
      
        '                 WHERE   CT.F_OPERACION BETWEEN TO_DATE('#39'08/12/2' +
        '008'#39','#39'DD/MM/YYYY'#39') AND TO_DATE('#39'09/12/2008'#39','#39'DD/MM/YYYY'#39') '
      
        '                   AND   CT.SIT_TRANSACCION = '#39'AC'#39'              ' +
        '  AND   CT.ID_TRANS_CANCELA IS NULL '
      
        '                   AND   CTO.ID_CONTRATO = CT.ID_CONTRATO       ' +
        '    AND   CTO.ID_EMPRESA  = 2 '
      
        '                   AND   CO.CVE_OPERACION = CT.CVE_OPERACION    ' +
        '    AND   CO.CVE_AFEC_SALDO    = '#39'I'#39' '
      
        '                   AND   CO.CVE_ACCESORIO IN ('#39'CP'#39','#39'IN'#39','#39'FN'#39')   ' +
        '     AND   CDT.ID_TRANSACCION = CT.ID_TRANSACCION) TRA, '
      
        '               ( SELECT * FROM CR_FND_CREDITO WHERE PCT_REDESCON' +
        'TADO = 100)  CFND , '
      '                CR_FND_ENT_DES  CFED , '
      '                CR_CONTRATO     CRCTO, '
      '                CR_PRODUCTO     CP   , '
      '                CR_PRODUCTO_GPO CPG  , CONTRATO           CTO , '
      '                MONEDA          M    , PERSONA            PT  , '
      '                CR_CAT_COMISION    COM , '
      '                PERSONA         PAD  , PERSONA            PAS , '
      '                CRE_PRESUPUESTO CRP '
      '          WHERE TRA.ID_CREDITO                 = CC.ID_CREDITO '
      '            AND CS.ID_CESION(+)                = CC.ID_CREDITO '
      '            AND CFND.ID_CREDITO(+)             = CC.ID_CREDITO '
      
        '            AND CFED.CVE_FND_ENT_DES(+)        = CFND.CVE_FND_EN' +
        'T_DES '
      '            AND CRCTO.ID_CONTRATO              = CC.ID_CONTRATO '
      
        '            AND CRCTO.FOL_CONTRATO             = CC.FOL_CONTRATO' +
        ' '
      
        '            AND CP.CVE_PRODUCTO_CRE            = CRCTO.CVE_PRODU' +
        'CTO_CRE '
      
        '            AND CPG.CVE_PRODUCTO_GPO           = CP.CVE_PRODUCTO' +
        '_GPO '
      
        '            AND CTO.ID_CONTRATO                = CRCTO.ID_CONTRA' +
        'TO '
      '            AND M.CVE_MONEDA                   = CTO.CVE_MONEDA '
      '            AND PT.ID_PERSONA                  = CTO.ID_TITULAR '
      '            AND PAD.ID_PERSONA                 = CC.ID_PROM_ADM '
      
        '            AND PAS.ID_PERSONA                 = CTO.ID_PERS_ASO' +
        'CIAD '
      
        '            AND COM.CVE_COMISION(+)            = TRA.CVE_COMISIO' +
        'N '
      
        '            AND CRP.CVE_PRESUPUESTO(+)         = CP.CVE_PRESUPUE' +
        'STO)  TEMP1, '
      
        '       (SELECT CVE_PRODUCTO CVE_PRODUCTO_CCO,CVE_MONEDA CVE_MONE' +
        'DA_CCO,CVE_OPERACION CVE_OPERACION_CCO '
      '        FROM CR_CVE_OPERACION '
      
        '        WHERE CVE_PARAMETRO  NOT IN ('#39'PGCPGF'#39','#39'PGINGF'#39','#39'PGCNGF'#39',' +
        #39'PGFNGF'#39','#39'PGCPGP'#39','#39'PGINGP'#39','#39'PGCNGP'#39','#39'PGFNGP'#39'))   CCO '
      '  WHERE   1 = 1 '
      '    AND   CCO.CVE_PRODUCTO_CCO  = TEMP1.CVE_PRODUCTO_CRE '
      '    AND   CCO.CVE_MONEDA_CCO    = TEMP1.CVE_MONEDA '
      '    AND   CCO.CVE_OPERACION_CCO = TEMP1.CVE_OPERACION_ORI '
      ' UNION ALL '
      ' SELECT '
      '   MO.CVE_MONEDA, '
      '   MO.DESC_MONEDA, '
      '   TO_CHAR(SB.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO, '
      '   SB.DESC_SUB_TIPO, '
      '   PF.ID_PERSONA, '
      '   PF.NOMBRE, '
      '   NULL AS CVE_ACCESORIO, '
      '   NULL AS CVE_TIPO_MOVTO, '
      '   NULL AS CVE_OPERACION, '
      '   NULL AS CVE_CONCEPTO, '
      '   CT.IMP_OPERACION, '
      '   '#39'INTCRE'#39' AS CVE_PRODUCTO_GPO, '
      '   '#39'INTCRE'#39' AS DESC_L_PROD_GPO, '
      '   NVL(CRP.CVE_PRESUPUESTO,'#39'NO-CLA'#39') AS CVE_PRESUPUESTO, '
      '   NVL(CRP.CVE_PRESUPUESTO,'#39'NO-CLA'#39') AS CVE_PRESUPUESTO_2, '
      
        '   NVL(CRP.DESC_PRESUPUESTO,'#39'NO-CLASIFICADO'#39') AS DESC_PRESUPUEST' +
        'O, '
      '   '#39'SIN FONDEO'#39' AS CVE_FONDEO, '
      '   '#39'SIN FONDEO'#39' AS DESC_ENT_DES,'
      '   PAD.ID_PERSONA AS ID_PERSONA_PAD, '
      '   PAD.NOMBRE AS NOMBRE_PAD, '
      '   PAS.ID_PERSONA AS ID_PERSONA_PAS, '
      '   PAS.NOMBRE AS NOMBRE_PAS,    '
      
        '   DECODE(CT.CVE_OPERACION,'#39'CPCAPP'#39','#39'CP'#39','#39'CAMCAP'#39','#39'CP'#39','#39'CARECA'#39',' +
        #39'CP'#39','#39'CAUTRE'#39','#39'CP'#39','#39'CPADDC'#39','#39'CP'#39', '
      
        '                           '#39'CPCAPV'#39','#39'CP'#39','#39'CPCAPI'#39','#39'CP'#39','#39'CARECV'#39',' +
        #39'CP'#39', '
      
        '                           '#39'CPINTP'#39','#39'IN'#39','#39'CPINTE'#39','#39'IN'#39','#39'CAMINT'#39',' +
        #39'IN'#39','#39'CAREIN'#39','#39'IN'#39','#39'CCAPIT'#39','#39'IN'#39', '
      
        ' '#9#9#9#9#39'CPADDI'#39','#39'IN'#39','#39'CPINTV'#39','#39'IN'#39','#39'CAREIV'#39','#39'IN'#39','#39'CPENVI'#39','#39'IN'#39','#39'CM' +
        'ORAC'#39','#39'IN'#39', '
      
        ' '#9#9#9#9#39'CMORAS'#39','#39'IN'#39','#39'CMORAD'#39','#39'IN'#39','#39'CMORAI'#39','#39'IN'#39')   AS TIPO_DISPOS' +
        'ICION '
      ' FROM '
      '   PERSONA PF, '
      '   CONTRATO CON, '
      '   MONEDA MO, '
      '   CRE_CONTRATO CC, '
      '   CRE_SUB_TIP_BCO SB, '
      '   CRE_CREDITO C, '
      '   CRE_TRANSACCION CT, '
      '   CRE_OPERACION CO, '
      '   CRE_CAT_MINIMO CCM, '
      '   CRE_PRESUPUESTO CRP, '
      '   PERSONA         PAD, '
      '   PERSONA         PAS  '
      ' WHERE 1 = 1 '
      
        '   AND  F_LIQUIDACION BETWEEN TO_DATE('#39'08/12/2008'#39','#39'DD/MM/YYYY'#39')' +
        ' AND TO_DATE('#39'09/12/2008'#39','#39'DD/MM/YYYY'#39')  '
      '   AND  CT.CVE_OPERACION IN '
      '   ('#39'CPCAPP'#39','#39'CAMCAP'#39','#39'CARECA'#39','#39'CAUTRE'#39','#39'CPADDC'#39', '
      '    '#39'CPCAPV'#39','#39'CPCAPI'#39','#39'CARECV'#39', '
      '    '#39'CPINTP'#39','#39'CPINTE'#39','#39'CAMINT'#39','#39'CAREIN'#39','#39'CCAPIT'#39','#39'CPADDI'#39', '
      '    '#39'CPINTV'#39','#39'CAREIV'#39','#39'CPENVI'#39', '
      '    '#39'CMORAC'#39','#39'CMORAS'#39','#39'CMORAD'#39','#39'CMORAI'#39') '
      '   AND  CVE_SUB_CARTERA <> '#39'FIDAYF'#39' '
      '   AND  CT.SIT_TRANSACCION = '#39'AC'#39' '
      '   AND  PF.ID_PERSONA = CON.ID_TITULAR '
      '   AND  CON.CVE_MONEDA = MO.CVE_MONEDA '
      '   AND  CC.ID_CONTRATO = CON.ID_CONTRATO '
      '   AND  CC.CVE_SUB_TIP_BCO = SB.CVE_SUB_TIP_BCO '
      '   AND  C.ID_CONTRATO = CC.ID_CONTRATO '
      '   AND  C.ID_CREDITO = CT.ID_CREDITO '
      '   AND  CT.CVE_OPERACION = CO.CVE_OPERACION '
      '   AND  CO.B_INF_COBRANZA = '#39'V'#39' '
      '   AND  CCM.CVE_CAT_MIN(+) = CC.CVE_CAT_MIN '
      '   AND  PAD.ID_PERSONA                 = C.ID_PROM_ADM '
      '   AND  PAS.ID_PERSONA                 = CON.ID_PERS_ASOCIAD '
      '   AND  CRP.CVE_PRESUPUESTO(+)         = C.CVE_PRESUPUESTO '
      '  UNION ALL '
      '  SELECT '
      '      M.CVE_MONEDA, '
      '      M.DESC_MONEDA, '
      '      TO_CHAR(STB.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO, '
      '      STB.DESC_SUB_TIPO, '
      '      P.ID_PERSONA, '
      '      P.NOMBRE, '
      '      NULL AS CVE_ACCESORIO, '
      '      NULL AS CVE_TIPO_MOVTO, '
      '      NULL AS CVE_OPERACION, '
      '      NULL AS CVE_CONCEPTO, '
      '      C.IMP_CREDITO, '
      '      '#39'INTCRE'#39' AS CVE_PRODUCTO_GPO, '
      '      '#39'INTCRE'#39' AS DESC_L_PROD_GPO, '
      '      NVL(CRP.CVE_PRESUPUESTO,'#39'NO-CLA'#39') AS CVE_PRESUPUESTO, '
      '      NVL(CRP.CVE_PRESUPUESTO,'#39'NO-CLA'#39') AS CVE_PRESUPUESTO_2, '
      
        '      NVL(CRP.DESC_PRESUPUESTO,'#39'NO-CLASIFICADO'#39') AS DESC_PRESUPU' +
        'ESTO, '
      '      '#39'SIN FONDEO'#39' AS CVE_FONDEO, '
      '      '#39'SIN FONDEO'#39' AS DESC_ENT_DES,'
      '      PAD.ID_PERSONA AS ID_PERSONA_PAD, '
      '      PAD.NOMBRE AS NOMBRE_PAD, '
      '      PAS.ID_PERSONA AS ID_PERSONA_PAS, '
      '      PAS.NOMBRE AS NOMBRE_PAS,'#9'   '
      '      TIPO_DISPOSICION'
      '   FROM '
      '      PERSONA P, '
      '      CONTRATO CON, '
      '      CRE_CONTRATO CC, '
      '      MONEDA M, '
      '      CRE_SUB_TIP_BCO STB, '
      '      CRE_CREDITO C, '
      '      PERSONA         PAD  ,'
      '      PERSONA            PAS , '
      '      CRE_PRESUPUESTO CRP '
      '  WHERE   1 = 1 '
      '      AND P.ID_PERSONA = CON.ID_TITULAR '
      '      AND CON.ID_CONTRATO = CC.ID_CONTRATO '
      '      AND CON.CVE_MONEDA = M.CVE_MONEDA '
      '      AND CC.CVE_SUB_TIP_BCO = STB.CVE_SUB_TIP_BCO '
      '      AND CC.CVE_SUB_TIP_BCO NOT IN(52) '
      '      AND CC.ID_CONTRATO = C.ID_CONTRATO '
      
        '      AND C.F_AUT_OPERACION BETWEEN TO_DATE('#39'08/12/2008'#39','#39'DD/MM/' +
        'YYYY'#39') AND TO_DATE('#39'09/12/2008'#39','#39'DD/MM/YYYY'#39')  '
      '      AND C.SIT_CREDITO IN ('#39'AC'#39','#39'LQ'#39') '
      '      AND PAD.ID_PERSONA                 = C.ID_PROM_ADM '
      '      AND PAS.ID_PERSONA                 = CON.ID_PERS_ASOCIAD '
      '      AND CRP.CVE_PRESUPUESTO(+)         = C.CVE_PRESUPUESTO '
      '  UNION ALL '
      ' SELECT     CONTRATO.CVE_MONEDA     , '
      '            MONEDA.DESC_MONEDA      , '
      '            CP.CVE_PRODUCTO_CRE     , '
      '            CP.DESC_L_PRODUCTO      , '
      '            PTF.ID_PERSONA AS ID_TITULAR, '
      '            PTF.NOMBRE              , '
      '            CO.CVE_ACCESORIO        , '
      '            TRA.CVE_TIPO_MOVTO      , '
      '            TRA.CVE_OPERACION       , '
      '            TRAD.CVE_CONCEPTO       , '
      '            TRAD.IMP_CONCEPTO       , '
      '            CP.CVE_PRODUCTO_GPO     , '
      '            CPG.DESC_L_PROD_GPO     , '
      
        '            NVL(CRP.CVE_PRESUPUESTO,'#39'NO-CLA'#39') AS CVE_PRESUPUESTO' +
        '    , '
      
        '            NVL(CRP.CVE_PRESUPUESTO,'#39'NO-CLA'#39') AS CVE_PRESUPUESTO' +
        '_2    , '
      
        '            NVL(CRP.DESC_PRESUPUESTO,'#39'NO-CLASIFICADO'#39') AS DESC_P' +
        'RESUPUESTO, '
      
        '            DECODE(CFND.ID_CREDITO,NULL,'#39'SIN FONDEO'#39',CFND.CVE_FN' +
        'D_ENT_DES ) AS CVE_FONDEO, '
      
        '            DECODE(CFND.ID_CREDITO,NULL,'#39'SIN FONDEO'#39',CFED.DESC_E' +
        'NT_DES ) AS DESC_ENT_DES,'
      '           PAD.ID_PERSONA AS ID_PERSONA_PAD, '
      '            PAD.NOMBRE AS NOMBRE_PAD, '
      '            PAS.ID_PERSONA AS ID_PERSONA_PAS, '
      '            PAS.NOMBRE AS NOMBRE_PAS, '
      '            CC.TIPO_DISPOSICION AS TIPO_OPER '
      ' FROM       CR_TRANSACCION TRA      , '
      '            CR_DET_TRANSAC TRAD     , '
      '            CR_CREDITO CC      , '
      '            CONTRATO                , '
      '            PERSONA  PTF            , '
      '            PERSONA  PAD  ,'
      '            PERSONA  PAS , '
      '            MONEDA                  , '
      '            CR_CONTRATO             , '
      '            CR_PRODUCTO CP          , '
      '            CR_PRODUCTO_GPO CPG     , '
      
        '           ( SELECT * FROM CR_FND_CREDITO WHERE PCT_REDESCONTADO' +
        ' = 100)  CFND , '
      '            CR_FND_ENT_DES  CFED, '
      '            CRE_PRESUPUESTO CRP, '
      '            CR_OPERACION CO '
      '  WHERE 1 = 1 '
      
        '    AND TRA.F_OPERACION BETWEEN TO_DATE('#39'08/12/2008'#39','#39'DD/MM/YYYY' +
        #39') AND TO_DATE('#39'09/12/2008'#39','#39'DD/MM/YYYY'#39') '
      
        '    AND TRA.CVE_OPERACION IN ('#39'DISPCS'#39','#39'DISPCR'#39','#39'DISPRE'#39','#39'DISPRS' +
        #39','#39'DSCSDL'#39', '#39'DSCRDL'#39') '
      '    AND CC.ID_CREDITO                  = TRA.ID_CREDITO '
      '    AND CFND.ID_CREDITO(+)             = CC.ID_CREDITO '
      '    AND CFND.ID_CREDITO(+)             = CC.ID_CREDITO '
      '    AND CFED.CVE_FND_ENT_DES(+)        = CFND.CVE_FND_ENT_DES '
      '    AND CONTRATO.ID_CONTRATO           = TRA.ID_CONTRATO '
      '    AND PTF.ID_PERSONA                 = CONTRATO.ID_TITULAR '
      '    AND PAD.ID_PERSONA                 = CC.ID_PROM_ADM '
      
        '    AND PAS.ID_PERSONA                 = CONTRATO.ID_PERS_ASOCIA' +
        'D '
      '    AND MONEDA.CVE_MONEDA              = CONTRATO.CVE_MONEDA '
      '    AND CR_CONTRATO.ID_CONTRATO        = CC.ID_CONTRATO '
      '    AND CR_CONTRATO.FOL_CONTRATO       = CC.FOL_CONTRATO '
      
        '    AND CP.CVE_PRODUCTO_CRE            = CR_CONTRATO.CVE_PRODUCT' +
        'O_CRE '
      '    AND CPG.CVE_PRODUCTO_GPO (+)       = CP.CVE_PRODUCTO_GPO '
      
        '    AND TRUNC(CC.F_AUTORIZA)          >= TO_DATE('#39'08/12/2008'#39','#39'D' +
        'D/MM/YYYY'#39') '
      
        '    AND TRUNC(CC.F_AUTORIZA)          <= TO_DATE('#39'09/12/2008'#39','#39'D' +
        'D/MM/YYYY'#39') '
      '    AND CC.SIT_CREDITO IN ( '#39'LQ'#39','#39'AC'#39' ) '
      '    AND CP.ID_EMPRESA = 2 '
      '    AND CRP.CVE_PRESUPUESTO(+)         = CP.CVE_PRESUPUESTO '
      '    AND TRAD.ID_TRANSACCION            = TRA.ID_TRANSACCION '
      '    AND TRAD.CVE_OPERACION             = TRA.CVE_OPERACION '
      '    AND TRAD.CVE_CONCEPTO              = '#39'IMPBRU'#39' '
      '    AND CO.CVE_OPERACION               = TRA.CVE_OPERACION '
      ' ) '
      '    WHERE 1 = 1 '
      '    ORDER BY CVE_MONEDA, NOMBRE ,CVE_PRESUPUESTO,  CVE_FONDEO  ')
    Left = 214
    Top = 29
    object qyInfCobContaCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyInfCobContaDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyInfCobContaCVE_PRODUCTO_CRE: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 6
    end
    object qyInfCobContaDESC_L_PRODUCTO: TStringField
      FieldName = 'DESC_L_PRODUCTO'
      Size = 80
    end
    object qyInfCobContaID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object qyInfCobContaNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qyInfCobContaCVE_ACCESORIO: TStringField
      FieldName = 'CVE_ACCESORIO'
      Size = 2
    end
    object qyInfCobContaCVE_TIPO_MOVTO: TStringField
      FieldName = 'CVE_TIPO_MOVTO'
      Size = 2
    end
    object qyInfCobContaCVE_OPERACION_ORI: TStringField
      FieldName = 'CVE_OPERACION_ORI'
      Size = 6
    end
    object qyInfCobContaCVE_CONCEPTO: TStringField
      FieldName = 'CVE_CONCEPTO'
      Size = 6
    end
    object qyInfCobContaIMP_CONCEPTO: TFloatField
      FieldName = 'IMP_CONCEPTO'
    end
    object qyInfCobContaCVE_PRODUCTO_GPO: TStringField
      FieldName = 'CVE_PRODUCTO_GPO'
      Size = 6
    end
    object qyInfCobContaDESC_L_PROD_GPO: TStringField
      FieldName = 'DESC_L_PROD_GPO'
      Size = 80
    end
    object qyInfCobContaCVE_PRESUPUESTO: TStringField
      FieldName = 'CVE_PRESUPUESTO'
      Size = 6
    end
    object qyInfCobContaDESC_PRESUPUESTO: TStringField
      FieldName = 'DESC_PRESUPUESTO'
      Size = 40
    end
    object qyInfCobContaCVE_FONDEO: TStringField
      FieldName = 'CVE_FONDEO'
      Size = 10
    end
    object qyInfCobContaDESC_ENT_DES: TStringField
      FieldName = 'DESC_ENT_DES'
      Size = 100
    end
    object qyInfCobContaTIPO_OPER: TStringField
      FieldName = 'TIPO_OPER'
      Size = 2
    end
    object qyInfCobContaCVE_PRESUPUESTO_2: TStringField
      FieldName = 'CVE_PRESUPUESTO_2'
      Size = 6
    end
    object qyInfCobContaID_PERSONA_PAD: TFloatField
      FieldName = 'ID_PERSONA_PAD'
    end
    object qyInfCobContaNOMBRE_PAD: TStringField
      FieldName = 'NOMBRE_PAD'
      Size = 80
    end
    object qyInfCobContaID_PERSONA_PAS: TFloatField
      FieldName = 'ID_PERSONA_PAS'
    end
    object qyInfCobContaNOMBRE_PAS: TStringField
      FieldName = 'NOMBRE_PAS'
      Size = 80
    end
  end
end
