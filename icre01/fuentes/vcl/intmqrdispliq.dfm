object QrDispLiq: TQrDispLiq
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
  DataSet = qyDispLiq
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
      Width = 60
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
        158.75)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel20: TQRLabel
      Left = 12
      Top = 1
      Width = 38
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        31.75
        2.64583333333333
        100.541666666667)
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
    object QRShape1: TQRShape
      Left = 59
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
        156.104166666667
        -2.64583333333333
        145.520833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 67
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
        177.270833333333
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
      Left = 113
      Top = -1
      Width = 314
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        298.979166666667
        -2.64583333333333
        830.791666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Left = 247
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
        653.520833333333
        2.64583333333333
        92.6041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Nombre'
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
      Left = 426
      Top = -1
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1127.125
        -2.64583333333333
        171.979166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 437
      Top = 0
      Width = 43
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1156.22916666667
        0
        113.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'F. Autoriza'
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
      Left = 490
      Top = -1
      Width = 100
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1296.45833333333
        -2.64583333333333
        264.583333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel4: TQRLabel
      Left = 516
      Top = 0
      Width = 49
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1365.25
        0
        129.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Importe'
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
      Left = 589
      Top = -1
      Width = 58
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1558.39583333333
        -2.64583333333333
        153.458333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 595
      Top = 0
      Width = 45
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1574.27083333333
        0
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tipo Disposición'
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
      Left = 646
      Top = -1
      Width = 51
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1709.20833333333
        -2.64583333333333
        134.9375)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel7: TQRLabel
      Left = 652
      Top = 1
      Width = 39
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        1725.08333333333
        2.64583333333333
        103.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Cve. Tipo Alta'
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
      Left = 696
      Top = -1
      Width = 58
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1841.5
        -2.64583333333333
        153.458333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Left = 703
      Top = -1
      Width = 42
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1860.02083333333
        -2.64583333333333
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Sobretasa'
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
      Left = 867
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
        2293.9375
        -2.64583333333333
        201.083333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 888
      Top = 1
      Width = 36
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2349.5
        2.64583333333333
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Moneda'
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
      Left = 810
      Top = -1
      Width = 58
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        2143.125
        -2.64583333333333
        153.458333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel12: TQRLabel
      Left = 823
      Top = -1
      Width = 32
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2177.52083333333
        -2.64583333333333
        84.6666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Cve. Tasa'
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
      Left = 753
      Top = -1
      Width = 58
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1992.3125
        -2.64583333333333
        153.458333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel13: TQRLabel
      Left = 763
      Top = -1
      Width = 37
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2018.77083333333
        -2.64583333333333
        97.8958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tasa Aplicada'
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
      Left = 942
      Top = -1
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        2492.375
        -2.64583333333333
        171.979166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel11: TQRLabel
      Left = 951
      Top = 1
      Width = 46
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2516.1875
        2.64583333333333
        121.708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'F. Traspaso Venc.'
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
    Top = 163
    Width = 1008
    Height = 15
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
      39.6875
      2667)
    BandType = rbDetail
    object QRDBText23: TQRDBText
      Left = 17
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
        44.9791666666667
        5.29166666666667
        103.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDispLiq
      DataField = 'ID_CREDITO'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText6: TQRDBText
      Left = 116
      Top = 2
      Width = 311
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
        822.854166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDispLiq
      DataField = 'NOMBRE'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText22: TQRDBText
      Left = 65
      Top = 2
      Width = 46
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        171.979166666667
        5.29166666666667
        121.708333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDispLiq
      DataField = 'ID_CONTRATO'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText1: TQRDBText
      Left = 435
      Top = 2
      Width = 47
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1150.9375
        5.29166666666667
        124.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDispLiq
      DataField = 'F_AUTORIZA'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText2: TQRDBText
      Left = 497
      Top = 2
      Width = 90
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1314.97916666667
        5.29166666666667
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDispLiq
      DataField = 'IMP_CREDITO'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText3: TQRDBText
      Left = 601
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
        1590.14583333333
        5.29166666666667
        92.6041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDispLiq
      DataField = 'TIPO_DISPOSICION'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText4: TQRDBText
      Left = 654
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
        1730.375
        5.29166666666667
        100.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDispLiq
      DataField = 'CVE_TIPO_ALTA'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText7: TQRDBText
      Left = 709
      Top = 2
      Width = 40
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1875.89583333333
        5.29166666666667
        105.833333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDispLiq
      DataField = 'SOBRETASA'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText5: TQRDBText
      Left = 765
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
        2024.0625
        5.29166666666667
        113.770833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDispLiq
      DataField = 'TASA_APLICADA'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText8: TQRDBText
      Left = 819
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
        2166.9375
        5.29166666666667
        113.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDispLiq
      DataField = 'CVE_TASA'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText9: TQRDBText
      Left = 873
      Top = 2
      Width = 68
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
        179.916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDispLiq
      DataField = 'MONEDA'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText10: TQRDBText
      Left = 949
      Top = 2
      Width = 47
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2510.89583333333
        5.29166666666667
        124.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDispLiq
      DataField = 'F_TRASPASO_VENC'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object qyDispLiq: TQuery
    DatabaseName = 'BCORP'
    SQL.Strings = (
      
        'SELECT cc.id_credito, cc.id_contrato, p.nombre, cc.f_autoriza, c' +
        'c.imp_credito,'
      
        '       cc.tipo_disposicion, cc.cve_tipo_alta, cc.sobretasa, chc.' +
        'tasa_aplicada,'
      
        '       cc.cve_tasa_refer AS cve_tasa, (select desc_moneda from m' +
        'oneda where cve_moneda = cto.cve_moneda) as moneda,'
      #9'   chc.f_traspaso_venc'
      '  FROM cr_credito cc, contrato cto, persona p, cr_histo_cred chc'
      
        ' WHERE f_autoriza BETWEEN TO_DATE ('#39'01/05/2013'#39', '#39'dd/mm/yyyy'#39') A' +
        'ND TO_DATE ('#39'31/05/2013'#39', '#39'dd/mm/yyyy'#39')'
      '   AND cto.id_contrato = cc.id_contrato'
      '   AND cto.id_titular = p.id_persona'
      '   AND chc.id_credito = cc.id_credito'
      '   AND chc.f_cierre = cc.f_autoriza'
      '   AND cc.id_credito = 364583'
      ''
      'UNION ALL'
      ''
      
        'SELECT cc.id_credito, cc.id_contrato, p.nombre, cc.f_liquidacion' +
        ','
      
        '       chc.sdo_vig_total, '#39'LQ'#39' AS tipo_disposicion, cc.cve_tipo_' +
        'baja,'
      '       cc.sobretasa, chc.tasa_aplicada, '
      
        #9'   cc.cve_tasa_refer AS cve_tasa, (select desc_moneda from mone' +
        'da where cve_moneda = cto.cve_moneda) as moneda, '
      #9'   chc.f_traspaso_venc'
      '  FROM cr_credito cc, contrato cto, persona p, cr_histo_cred chc'
      
        ' WHERE f_liquidacion BETWEEN TO_DATE ('#39'01/05/2013'#39', '#39'dd/mm/yyyy'#39 +
        ') AND TO_DATE ('#39'31/05/2013'#39', '#39'dd/mm/yyyy'#39')'
      '   AND cto.id_contrato = cc.id_contrato'
      '   AND cto.id_titular = p.id_persona'
      '   AND chc.id_credito = cc.id_credito'
      '   AND chc.f_cierre = cc.f_autoriza'
      '   AND cc.id_credito = 364583   ')
    Left = 102
    Top = 13
    object qyDispLiqID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyDispLiqID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qyDispLiqNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qyDispLiqF_AUTORIZA: TDateTimeField
      FieldName = 'F_AUTORIZA'
    end
    object qyDispLiqIMP_CREDITO: TFloatField
      FieldName = 'IMP_CREDITO'
    end
    object qyDispLiqTIPO_DISPOSICION: TStringField
      FieldName = 'TIPO_DISPOSICION'
      Size = 2
    end
    object qyDispLiqCVE_TIPO_ALTA: TStringField
      FieldName = 'CVE_TIPO_ALTA'
      Size = 2
    end
    object qyDispLiqSOBRETASA: TFloatField
      FieldName = 'SOBRETASA'
    end
    object qyDispLiqTASA_APLICADA: TFloatField
      FieldName = 'TASA_APLICADA'
    end
    object qyDispLiqCVE_TASA: TStringField
      FieldName = 'CVE_TASA'
      Size = 8
    end
    object qyDispLiqMONEDA: TStringField
      FieldName = 'MONEDA'
    end
    object qyDispLiqF_TRASPASO_VENC: TDateTimeField
      FieldName = 'F_TRASPASO_VENC'
    end
  end
end
