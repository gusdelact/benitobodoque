object WCrQRCtaAcred: TWCrQRCtaAcred
  Left = 0
  Top = 0
  Width = 1267
  Height = 979
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = QCtaAcred
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
    99.06
    2159
    99.06
    2794
    99.06
    99.06
    0)
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = Auto
  PrintIfEmpty = True
  SnapToGrid = True
  Units = Inches
  Zoom = 120
  object DetailBand1: TQRBand
    Left = 45
    Top = 185
    Width = 1177
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
      26.4583333333333
      2595.12152777778)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 348
      Top = 1
      Width = 181
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        767.291666666667
        2.20486111111111
        399.079861111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCtaAcred
      DataField = 'BANCO'
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
    object QRDBText2: TQRDBText
      Left = 157
      Top = 1
      Width = 41
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        346.163194444444
        2.20486111111111
        90.3993055555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCtaAcred
      DataField = 'CVE_EMISOR_NAFIN'
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
    object QRDBText6: TQRDBText
      Left = 762
      Top = 1
      Width = 140
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1680.10416666667
        2.20486111111111
        308.680555555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCtaAcred
      DataField = 'CUENTA_BANCO'
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
    object QRDBText4: TQRDBText
      Left = 100
      Top = 0
      Width = 53
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        220.486111111111
        0
        116.857638888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QCtaAcred
      DataField = 'ID_CREDITO'
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
    object QRDBText5: TQRDBText
      Left = 319
      Top = 1
      Width = 19
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        703.350694444444
        2.20486111111111
        41.8923611111111)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCtaAcred
      DataField = 'PREDETERMINADA'
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
    object QRDBText7: TQRDBText
      Left = 568
      Top = 1
      Width = 145
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1252.36111111111
        2.20486111111111
        319.704861111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCtaAcred
      DataField = 'SUCURSAL'
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
    object QRDBText8: TQRDBText
      Left = 719
      Top = 1
      Width = 33
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1585.29513888889
        2.20486111111111
        72.7604166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCtaAcred
      DataField = 'ID_PLAZA'
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
    object QRDBText9: TQRDBText
      Left = 1064
      Top = 1
      Width = 40
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2345.97222222222
        2.20486111111111
        88.1944444444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QCtaAcred
      DataField = 'BANXICO'
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
    object QRDBText10: TQRDBText
      Left = 1150
      Top = 1
      Width = 22
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2535.59027777778
        2.20486111111111
        48.5069444444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCtaAcred
      DataField = 'SIT_CHEQUERA'
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
    object QRDBText11: TQRDBText
      Left = 200
      Top = 1
      Width = 113
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        440.972222222222
        2.20486111111111
        249.149305555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCtaAcred
      DataField = 'TIPO_CHEQUERA'
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
    object QRDBText12: TQRDBText
      Left = 1121
      Top = 1
      Width = 24
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2471.64930555556
        2.20486111111111
        52.9166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCtaAcred
      DataField = 'B_DEPURADO'
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
    object QRDBText13: TQRDBText
      Left = 532
      Top = 1
      Width = 30
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1172.98611111111
        2.20486111111111
        66.1458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCtaAcred
      DataField = 'TIPO_CUENTA'
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
    object QRDBText14: TQRDBText
      Left = 4
      Top = 0
      Width = 85
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        8.81944444444444
        0
        187.413194444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCtaAcred
      DataField = 'MONEDA'
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
    object QRDBText15: TQRDBText
      Left = 906
      Top = 1
      Width = 157
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1997.60416666667
        2.20486111111111
        346.163194444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCtaAcred
      DataField = 'TITULAR'
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
  object QRGAcred: TQRGroup
    Left = 45
    Top = 175
    Width = 1177
    Height = 10
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      22.0486111111111
      2595.12152777778)
    Expression = 'QCtaAcred.ID_ACREDITADO'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText3: TQRDBText
      Left = 8
      Top = -1
      Width = 66
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        17.6388888888889
        -2.20486111111111
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QCtaAcred
      DataField = 'ACREDITADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic, fsUnderline]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object ColumnHeaderBand1: TQRBand
    Left = 45
    Top = 146
    Width = 1177
    Height = 29
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
      63.9409722222222
      2595.12152777778)
    BandType = rbColumnHeader
    object QRShape7: TQRShape
      Left = 200
      Top = 0
      Width = 113
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        440.972222222222
        0
        249.149305555556)
      Shape = qrsRectangle
    end
    object QRShape2: TQRShape
      Left = 96
      Top = 0
      Width = 57
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        211.666666666667
        0
        125.677083333333)
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 101
      Top = 2
      Width = 48
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        222.690972222222
        4.40972222222222
        105.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Disposición'
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
    object QRShape8: TQRShape
      Left = 152
      Top = 0
      Width = 49
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        335.138888888889
        0
        108.038194444444)
      Shape = qrsRectangle
    end
    object QRShape3: TQRShape
      Left = 345
      Top = 0
      Width = 186
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        760.677083333333
        0
        410.104166666667)
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 348
      Top = 2
      Width = 179
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        767.291666666667
        4.40972222222222
        394.670138888889)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Banco'
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
    object QRShape1: TQRShape
      Left = 754
      Top = 0
      Width = 149
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        1662.46527777778
        0
        328.524305555556)
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Left = 757
      Top = 2
      Width = 145
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        1669.07986111111
        4.40972222222222
        319.704861111111)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Chequera'
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
    object QRShape4: TQRShape
      Left = 566
      Top = 0
      Width = 147
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        1247.95138888889
        0
        324.114583333333)
      Shape = qrsRectangle
    end
    object QRLabel10: TQRLabel
      Left = 571
      Top = 2
      Width = 134
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        1258.97569444444
        4.40972222222222
        295.451388888889)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Sucursal Banco'
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
      Left = 712
      Top = 0
      Width = 43
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        1569.86111111111
        0
        94.8090277777778)
      Shape = qrsRectangle
    end
    object QRLabel11: TQRLabel
      Left = 718
      Top = 2
      Width = 32
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        1583.09027777778
        4.40972222222222
        70.5555555555556)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Plaza Banco'
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
    object QRLabel5: TQRLabel
      Left = 158
      Top = 2
      Width = 37
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        348.368055555556
        4.40972222222222
        81.5798611111111)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Id. Nafinsa'
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
    object QRShape6: TQRShape
      Left = 1060
      Top = 0
      Width = 49
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        2337.15277777778
        0
        108.038194444444)
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Left = 1064
      Top = 2
      Width = 39
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        2345.97222222222
        4.40972222222222
        85.9895833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Plaza Banxico'
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
    object QRLabel4: TQRLabel
      Left = 208
      Top = 2
      Width = 97
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        458.611111111111
        4.40972222222222
        213.871527777778)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tipo de Chequera'
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
    object QRShape9: TQRShape
      Left = 1108
      Top = 0
      Width = 35
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        2442.98611111111
        0
        77.1701388888889)
      Shape = qrsRectangle
    end
    object QRShape10: TQRShape
      Left = 1142
      Top = 0
      Width = 33
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        2517.95138888889
        0
        72.7604166666667)
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 1112
      Top = 2
      Width = 28
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        2451.80555555556
        4.40972222222222
        61.7361111111111)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Depu- rada'
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
    object QRLabel7: TQRLabel
      Left = 1146
      Top = 2
      Width = 25
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        2526.77083333333
        4.40972222222222
        55.1215277777778)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Sit.'
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
    object QRShape11: TQRShape
      Left = 312
      Top = 0
      Width = 34
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        687.916666666667
        0
        74.9652777777778)
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 314
      Top = 2
      Width = 28
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        692.326388888889
        4.40972222222222
        61.7361111111111)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Pred.'
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
    object QRShape12: TQRShape
      Left = 530
      Top = 0
      Width = 37
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        1168.57638888889
        0
        81.5798611111111)
      Shape = qrsRectangle
    end
    object QRLabel12: TQRLabel
      Left = 533
      Top = 2
      Width = 32
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        1175.19097222222
        4.40972222222222
        70.5555555555556)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tipo Cuenta'
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
    object QRShape13: TQRShape
      Left = 1
      Top = 0
      Width = 96
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        2.20486111111111
        0
        211.666666666667)
      Shape = qrsRectangle
    end
    object QRLabel13: TQRLabel
      Left = 3
      Top = 0
      Width = 94
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        6.61458333333333
        0
        207.256944444444)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Moneda'
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
    object QRShape14: TQRShape
      Left = 902
      Top = 0
      Width = 159
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        1988.78472222222
        0
        350.572916666667)
      Shape = qrsRectangle
    end
    object QRLabel14: TQRLabel
      Left = 910
      Top = 2
      Width = 145
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        2006.42361111111
        4.40972222222222
        319.704861111111)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Titular Cuenta'
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
  end
  object QRBand1: TQRBand
    Left = 45
    Top = 45
    Width = 1177
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
      2595.12152777778)
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
        222.690972222222
        0
        0
        2595.12152777778)
      NomReporte = 'IntCrQRCtaAcr'
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
  object QCtaAcred: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'SELECT CCC.ID_BANCO_CHQRA,'
      '       CCC.ID_ACREDITADO,'
      '       CCC.ID_CREDITO,'
      '       CCC.CVE_EMISOR_NAFIN,'
      '       CCC.SIT_CHEQUERA,'
      '       DECODE(CCC.CVE_TIPO_CHEQ,'#39'AD'#39','#39'ADMIN.'#39','#39'DE LIQ.'#39') ||'
      
        '       DECODE(CCC.CVE_TIP_OPE_CHQ,'#39'AM'#39','#39' DE CARGO Y ABONO'#39','#39'CR'#39',' +
        #39'DE CARGO'#39','#39'DE ABONO'#39') TIPO_CHEQUERA,'
      '       CCC.CUENTA_BANCO,'
      '       DECODE(CCC.B_PREDETERMINADA,'#39'V'#39','#39'PRED'#39') PREDETERMINADA,'
      
        '       DECODE(CCC.SIT_CHEQUERA,'#39'AC'#39','#39'ACTIVA'#39','#39'CANCELADA'#39') SITUAC' +
        'ION,'
      '       PB.NOMBRE BANCO,'
      '       PA.NOMBRE ACREDITADO,'
      '       CCTE.CVE_SUC_BANCO || '#39' '#39'|| NOM_SUC_BANCO SUCURSAL,'
      '       CCTE.ID_PLAZA,'
      '       CCTE.B_DEPURADO,'
      '       CCTE.TIPO_CUENTA,'
      '       CCTE.ID_PZA_BANXICO BANXICO'
      'FROM CR_CRED_CHEQ CCC,'
      '     PERSONA PB,'
      '     PERSONA PA,'
      '     CHEQUERA_CTE CCTE')
    Left = 390
    Top = 14
    object QCtaAcredID_BANCO_CHQRA: TFloatField
      FieldName = 'ID_BANCO_CHQRA'
    end
    object QCtaAcredID_ACREDITADO: TFloatField
      FieldName = 'ID_ACREDITADO'
    end
    object QCtaAcredID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object QCtaAcredCVE_EMISOR_NAFIN: TStringField
      FieldName = 'CVE_EMISOR_NAFIN'
      Size = 6
    end
    object QCtaAcredSIT_CHEQUERA: TStringField
      FieldName = 'SIT_CHEQUERA'
      Size = 2
    end
    object QCtaAcredTIPO_CHEQUERA: TStringField
      FieldName = 'TIPO_CHEQUERA'
      Size = 24
    end
    object QCtaAcredCUENTA_BANCO: TStringField
      FieldName = 'CUENTA_BANCO'
    end
    object QCtaAcredPREDETERMINADA: TStringField
      FieldName = 'PREDETERMINADA'
      Size = 4
    end
    object QCtaAcredSITUACION: TStringField
      FieldName = 'SITUACION'
      Size = 9
    end
    object QCtaAcredBANCO: TStringField
      FieldName = 'BANCO'
      Size = 80
    end
    object QCtaAcredACREDITADO: TStringField
      FieldName = 'ACREDITADO'
      Size = 80
    end
    object QCtaAcredSUCURSAL: TStringField
      FieldName = 'SUCURSAL'
      Size = 45
    end
    object QCtaAcredID_PLAZA: TStringField
      FieldName = 'ID_PLAZA'
      Size = 3
    end
    object QCtaAcredB_DEPURADO: TStringField
      FieldName = 'B_DEPURADO'
      Size = 1
    end
    object QCtaAcredTIPO_CUENTA: TStringField
      FieldName = 'TIPO_CUENTA'
      Size = 6
    end
    object QCtaAcredMONEDA: TStringField
      FieldName = 'MONEDA'
      Size = 23
    end
    object QCtaAcredBANXICO: TStringField
      FieldName = 'BANXICO'
    end
    object QCtaAcredTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 150
    end
  end
end
