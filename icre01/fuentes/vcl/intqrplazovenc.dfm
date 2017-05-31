object QrPlzVenc: TQrPlzVenc
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
  DataSet = QResumen
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
    Height = 95
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
      251.354166666667
      1957.91666666667)
    BandType = rbColumnHeader
    object QRShape2: TQRShape
      Left = 7
      Top = 76
      Width = 725
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.29166666666667
        18.5208333333333
        201.083333333333
        1918.22916666667)
      Shape = qrsRectangle
    end
    object QRLabel14: TQRLabel
      Left = 6
      Top = 41
      Width = 251
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        15.875
        108.479166666667
        664.104166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Banca'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel1: TQRLabel
      Left = 261
      Top = 41
      Width = 91
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        690.5625
        108.479166666667
        240.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Impagado ($)'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel3: TQRLabel
      Left = 261
      Top = 57
      Width = 91
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        690.5625
        150.8125
        240.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel4: TQRLabel
      Left = 6
      Top = 58
      Width = 251
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        15.875
        153.458333333333
        664.104166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel5: TQRLabel
      Left = 356
      Top = 41
      Width = 91
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        941.916666666667
        108.479166666667
        240.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Hasta'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel6: TQRLabel
      Left = 356
      Top = 57
      Width = 91
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        941.916666666667
        150.8125
        240.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '12 meses ($)'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel8: TQRLabel
      Left = 451
      Top = 41
      Width = 91
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        1193.27083333333
        108.479166666667
        240.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'De 13 meses'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel9: TQRLabel
      Left = 451
      Top = 57
      Width = 91
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        1193.27083333333
        150.8125
        240.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'hasta 36 meses ($)'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel10: TQRLabel
      Left = 546
      Top = 41
      Width = 91
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        1444.625
        108.479166666667
        240.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'De 37 meses'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel11: TQRLabel
      Left = 546
      Top = 57
      Width = 91
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        1444.625
        150.8125
        240.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'hasta 60 meses ($)'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel13: TQRLabel
      Left = 641
      Top = 41
      Width = 91
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        1695.97916666667
        108.479166666667
        240.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Mayores de'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel15: TQRLabel
      Left = 641
      Top = 57
      Width = 91
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        1695.97916666667
        150.8125
        240.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '60 meses ($)'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLIntereses: TQRLabel
      Left = 8
      Top = 8
      Width = 401
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        21.1666666666667
        21.1666666666667
        1060.97916666667)
      Alignment = taLeftJustify
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
    Top = 217
    Width = 740
    Height = 22
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
      58.2083333333333
      1957.91666666667)
    BandType = rbDetail
    object qrTxtDesc_Grupo: TQRDBText
      Left = 7
      Top = 2
      Width = 251
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        18.5208333333333
        5.29166666666667
        664.104166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QResumen
      DataField = 'Desc_Mercado'
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
    object QRDBText2: TQRDBText
      Left = 261
      Top = 2
      Width = 91
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        690.5625
        5.29166666666667
        240.770833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QResumen
      DataField = 'Impagado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText3: TQRDBText
      Left = 356
      Top = 2
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        941.916666666667
        5.29166666666667
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QResumen
      DataField = 'Hasta_12_Meses'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText4: TQRDBText
      Left = 451
      Top = 2
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1193.27083333333
        5.29166666666667
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QResumen
      DataField = 'De_13_A_36_Meses'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText5: TQRDBText
      Left = 546
      Top = 2
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1444.625
        5.29166666666667
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QResumen
      DataField = 'De_37_A_60_Meses'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText6: TQRDBText
      Left = 641
      Top = 2
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1695.97916666667
        5.29166666666667
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QResumen
      DataField = 'Mas_De_60_Meses'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
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
  object SummaryBand2: TQRBand
    Left = 38
    Top = 239
    Width = 740
    Height = 58
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
      153.458333333333
      1957.91666666667)
    BandType = rbSummary
    object QRLabel12: TQRLabel
      Left = 6
      Top = 4
      Width = 251
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        15.875
        10.5833333333333
        664.104166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total  '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRExpr1: TQRExpr
      Left = 261
      Top = 4
      Width = 90
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        690.5625
        10.5833333333333
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QResumen.Impagado)'
      Mask = '###,###,###,###,###.00'
      FontSize = 7
    end
    object QRExpr2: TQRExpr
      Left = 356
      Top = 4
      Width = 90
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        941.916666666667
        10.5833333333333
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QResumen.Hasta_12_Meses)'
      Mask = '###,###,###,###,###.00'
      FontSize = 7
    end
    object QRExpr3: TQRExpr
      Left = 451
      Top = 4
      Width = 90
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1193.27083333333
        10.5833333333333
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QResumen.De_13_A_36_Meses)'
      Mask = '###,###,###,###,###.00'
      FontSize = 7
    end
    object QRExpr4: TQRExpr
      Left = 546
      Top = 4
      Width = 90
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1444.625
        10.5833333333333
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QResumen.De_37_A_60_Meses)'
      Mask = '###,###,###,###,###.00'
      FontSize = 7
    end
    object QRExpr5: TQRExpr
      Left = 642
      Top = 4
      Width = 90
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1698.625
        10.5833333333333
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QResumen.Mas_De_60_Meses)'
      Mask = '###,###,###,###,###.00'
      FontSize = 7
    end
    object QRLeyendaMoneda: TQRLabel
      Left = 6
      Top = 24
      Width = 726
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        15.875
        63.5
        1920.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLeyendaMoneda'
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
  object QResumen: TQuery
    SQL.Strings = (
      'Select Case When Grouping (Mdo.Cve_Mercado)  = 1 Then '#39'TOTAL'#39
      '            When Mdo.Cve_Mercado Is Null         And'
      '                 Grouping (Mdo.Cve_Mercado)  = 0 And'
      
        '                 Grouping (Mdo.Desc_Mercado) = 0 Then '#39'(SIN MERC' +
        'ADO OBJETIVO)'#39' '
      '            Else Mdo.Desc_Mercado'
      
        '       End                                                      ' +
        '             Desc_Mercado,                                      ' +
        ' '
      
        '       Round (Nvl (Sum (Sdo.Impagado),         0) / :peFactor * ' +
        '100, 2)      Impagado,  '
      
        '       Round (Nvl (Sum (Sdo.Hasta_12_Meses),   0) / :peFactor * ' +
        '100, 2)      Hasta_12_Meses,  '
      
        '       Round (Nvl (Sum (Sdo.De_13_A_36_Meses), 0) / :peFactor * ' +
        '100, 2)      De_13_A_36_Meses,  '
      
        '       Round (Nvl (Sum (Sdo.De_37_A_60_Meses), 0) / :peFactor * ' +
        '100, 2)      De_37_A_60_Meses,  '
      
        '       Round (Nvl (Sum (Sdo.Mas_De_60_Meses),  0) / :peFactor * ' +
        '100, 2)      Mas_De_60_Meses,'
      
        '       Grouping (Mdo.Cve_Mercado)                               ' +
        '             G1'
      '  From CR_Mercado_Obj Mdo'
      '  Full Outer Join (Select Cve_Mercado,'
      
        '                          Nvl (Sum (Impagado),         0)  Impag' +
        'ado,'
      
        '                          Nvl (Sum (Hasta_12_Meses),   0)  Hasta' +
        '_12_Meses,'
      
        '                          Nvl (Sum (De_13_A_36_Meses), 0)  De_13' +
        '_A_36_Meses,'
      
        '                          Nvl (Sum (De_37_A_60_Meses), 0)  De_37' +
        '_A_60_Meses,'
      
        '                          Nvl (Sum (Mas_De_60_Meses),  0)  Mas_D' +
        'e_60_Meses'
      '                     From (Select Cve_Mercado, '
      '                                  Cve_Moneda,'
      
        '                                  Sum (Case When Situacion = '#39'IM' +
        #39'                                      Then Imp_Total Else 0 End' +
        ') * PkgCrConsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda, '#39'D0' +
        '00'#39', To_Char (:peFecha, '#39'YYYY'#39'), To_Char (:peFecha, '#39'MM'#39')) Impag' +
        'ado,'
      
        '                                  Sum (Case When Situacion In ('#39 +
        'AC'#39', '#39'PA'#39') And Meses <= 12             Then Imp_Total Else 0 End' +
        ') * PkgCrConsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda, '#39'D0' +
        '00'#39', To_Char (:peFecha, '#39'YYYY'#39'), To_Char (:peFecha, '#39'MM'#39')) Hasta' +
        '_12_Meses,'
      
        '                                  Sum (Case When Situacion In ('#39 +
        'AC'#39', '#39'PA'#39') And Meses Between 13 And 36 Then Imp_Total Else 0 End' +
        ') * PkgCrConsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda, '#39'D0' +
        '00'#39', To_Char (:peFecha, '#39'YYYY'#39'), To_Char (:peFecha, '#39'MM'#39')) De_13' +
        '_A_36_Meses,'
      
        '                                  Sum (Case When Situacion In ('#39 +
        'AC'#39', '#39'PA'#39') And Meses Between 37 And 60 Then Imp_Total Else 0 End' +
        ') * PkgCrConsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda, '#39'D0' +
        '00'#39', To_Char (:peFecha, '#39'YYYY'#39'), To_Char (:peFecha, '#39'MM'#39')) De_37' +
        '_A_60_Meses,'
      
        '                                  Sum (Case When Situacion In ('#39 +
        'AC'#39', '#39'PA'#39') And Meses > 60              Then Imp_Total Else 0 End' +
        ') * PkgCrConsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda, '#39'D0' +
        '00'#39', To_Char (:peFecha, '#39'YYYY'#39'), To_Char (:peFecha, '#39'MM'#39')) Mas_D' +
        'e_60_Meses  '
      
        '                             From Table (PkgCRGPViews.VW_CR_GP_S' +
        'aldos_Plazo_Vto (:peFecha, :peTipo_Entidad))'
      '                            Group By Cve_Mercado, Cve_Moneda'
      '                          )'
      '                    Group By Cve_Mercado       '
      
        '                  )   Sdo On Mdo.Cve_Mercado = Sdo.Cve_Mercado  ' +
        ' '
      ' Group By Rollup (Mdo.Cve_Mercado, Mdo.Desc_Mercado)'
      ' Having /*Grouping (Mdo.Cve_Mercado)  = 1 Or*/'
      '        Grouping (Mdo.Desc_Mercado) = 0 '
      ' Order By G1, Mdo.Desc_Mercado')
    Left = 240
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
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
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
    object QResumenDesc_Mercado: TStringField
      DisplayLabel = 'Banca'
      DisplayWidth = 50
      FieldName = 'Desc_Mercado'
      Size = 100
    end
    object QResumenImpagado: TFloatField
      DisplayLabel = 'Impagada'
      DisplayWidth = 19
      FieldName = 'Impagado'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QResumenHasta_12_Meses: TFloatField
      DisplayLabel = 'Hasta 12 Meses'
      DisplayWidth = 19
      FieldName = 'Hasta_12_Meses'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QResumenDe_13_A_36_Meses: TFloatField
      DisplayLabel = 'De 13 hasta 36 Meses'
      DisplayWidth = 19
      FieldName = 'De_13_A_36_Meses'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QResumenDe_37_A_60_Meses: TFloatField
      DisplayLabel = 'De 37 hasta 60 Meses'
      DisplayWidth = 19
      FieldName = 'De_37_A_60_Meses'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QResumenMas_De_60_Meses: TFloatField
      DisplayLabel = 'Mayores a 60 Meses'
      DisplayWidth = 19
      FieldName = 'Mas_De_60_Meses'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QResumenG1: TFloatField
      FieldName = 'G1'
      Visible = False
    end
  end
end
