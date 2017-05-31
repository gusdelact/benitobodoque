object QrSatConstancia2: TQrSatConstancia2
  Left = 0
  Top = -99
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  AfterPrint = QuickRepAfterPrint
  DataSet = Query
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial Narrow'
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
  object QRBandColumnHeader: TQRBand
    Left = 38
    Top = 967
    Width = 740
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
      1957.91666666667)
    BandType = rbSummary
  end
  object QRDetalle: TQRBand
    Left = 38
    Top = 157
    Width = 740
    Height = 810
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRDetalleBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = True
    Size.Values = (
      2143.125
      1957.91666666667)
    BandType = rbDetail
    object QRShape14: TQRShape
      Left = 723
      Top = 372
      Width = 6
      Height = 174
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        460.375
        1912.9375
        984.25
        15.875)
      Shape = qrsVertLine
    end
    object QRMemCOPIA: TQRMemo
      Left = 222
      Top = 174
      Width = 296
      Height = 484
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1280.58333333333
        587.375
        460.375
        783.166666666667)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = True
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInactiveBorder
      Font.Height = -80
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        '           A'
        '         I'
        '      P'
        '   O'
        'C')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 60
    end
    object QRShape18: TQRShape
      Left = 26
      Top = 592
      Width = 325
      Height = 112
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        296.333333333333
        68.7916666666667
        1566.33333333333
        859.895833333333)
      Brush.Style = bsClear
      Shape = qrsRectangle
    end
    object QRShape16: TQRShape
      Left = 379
      Top = 592
      Width = 346
      Height = 113
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        298.979166666667
        1002.77083333333
        1566.33333333333
        915.458333333333)
      Brush.Style = bsClear
      Shape = qrsRectangle
    end
    object QRShape25: TQRShape
      Left = 643
      Top = 79
      Height = 36
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        95.25
        1701.27083333333
        209.020833333333
        171.979166666667)
      Shape = qrsRectangle
    end
    object QRShape22: TQRShape
      Left = 567
      Top = 79
      Height = 36
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        95.25
        1500.1875
        209.020833333333
        171.979166666667)
      Shape = qrsRectangle
    end
    object QRShape21: TQRShape
      Left = 492
      Top = 79
      Height = 36
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        95.25
        1301.75
        209.020833333333
        171.979166666667)
      Shape = qrsRectangle
    end
    object QRDBText2: TQRDBText
      Left = 651
      Top = 87
      Width = 49
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1722.4375
        230.1875
        129.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = Query
      DataField = 'EJERCICIO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 282
      Top = 141
      Width = 191
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        746.125
        373.0625
        505.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'DATOS DEL DEUDOR HIPOTECARIO'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 39
      Top = 158
      Width = 231
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        103.1875
        418.041666666667
        611.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'REGISTRO FEDERAL DE CONTRIBUYENTES'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 39
      Top = 236
      Width = 57
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        103.1875
        624.416666666667
        150.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'DOMICILIO'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 39
      Top = 291
      Width = 213
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        103.1875
        769.9375
        563.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'DOMICILIO DEL INMUEBLE HIPOTECADO'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRShape6: TQRShape
      Left = 376
      Top = 156
      Width = 4
      Height = 206
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        545.041666666667
        994.833333333333
        412.75
        10.5833333333333)
      Shape = qrsVertLine
    end
    object QRDBText1: TQRDBText
      Left = 381
      Top = 200
      Width = 342
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1008.0625
        529.166666666667
        904.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = Query
      DataField = 'NOMBRE_TIT'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText3: TQRDBText
      Left = 382
      Top = 158
      Width = 61
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1010.70833333333
        418.041666666667
        161.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'RFC_CURP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 381
      Top = 220
      Width = 341
      Height = 62
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        164.041666666667
        1008.0625
        582.083333333333
        902.229166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = Query
      DataField = 'DOMICILIO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText5: TQRDBText
      Left = 132
      Top = 116
      Width = 61
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        349.25
        306.916666666667
        161.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'ID_CREDITO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 9
    end
    object QRDBText7: TQRDBText
      Left = 500
      Top = 475
      Width = 121
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1322.91666666667
        1256.77083333333
        320.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'SALDO_INICIAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,###,##0'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText8: TQRDBText
      Left = 500
      Top = 500
      Width = 121
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1322.91666666667
        1322.91666666667
        320.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'PROP_DEDUCIBLE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,###,##0'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText9: TQRDBText
      Left = 500
      Top = 417
      Width = 121
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1322.91666666667
        1103.3125
        320.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'IMP_INT_NOM_DEV'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,###,##0'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText10: TQRDBText
      Left = 500
      Top = 436
      Width = 121
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1322.91666666667
        1153.58333333333
        320.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'IMP_INT_PAGADOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,###,##0'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText11: TQRDBText
      Left = 500
      Top = 455
      Width = 121
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1322.91666666667
        1203.85416666667
        320.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'IMP_INT_REAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,###,##0'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText12: TQRDBText
      Left = 63
      Top = 632
      Width = 59
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        166.6875
        1672.16666666667
        156.104166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'RFC_EMPRE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText15: TQRDBText
      Left = 386
      Top = 605
      Width = 83
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1021.29166666667
        1600.72916666667
        219.604166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'REPRESENTANTE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText16: TQRDBText
      Left = 419
      Top = 632
      Width = 45
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1108.60416666667
        1672.16666666667
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'RFC_REP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRMemo7: TQRMemo
      Left = 39
      Top = 198
      Width = 257
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        103.1875
        523.875
        679.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Lines.Strings = (
        'APELLIDO PATERNO, MATERNO Y NOMBRE (S)')
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRMemo8: TQRMemo
      Left = 27
      Top = 738
      Width = 669
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        71.4375
        1952.625
        1770.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Lines.Strings = (
        
          'Esta constancia se emite con apego al articulo 151 fracción IV d' +
          'e la Ley del Impuesto Sobre la Renta vigente.')
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 9
    end
    object QRLabel18: TQRLabel
      Left = 224
      Top = 67
      Width = 208
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        592.666666666667
        177.270833333333
        550.333333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'PERIODO QUE AMPARA LA CONSTANCIA'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 9
    end
    object QRLabel19: TQRLabel
      Left = 493
      Top = 60
      Width = 55
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1304.39583333333
        158.75
        145.520833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'MES INICIAL'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel20: TQRLabel
      Left = 568
      Top = 60
      Width = 50
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1502.83333333333
        158.75
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'MES FINAL'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel21: TQRLabel
      Left = 646
      Top = 60
      Width = 50
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1709.20833333333
        158.75
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'EJERCICIO'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel1: TQRLabel
      Left = 39
      Top = 178
      Width = 233
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        103.1875
        470.958333333333
        616.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CLAVE ÚNICA DE REGISTRO DE POBLACIÓN'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRShape53: TQRShape
      Left = 723
      Top = 136
      Width = 2
      Height = 226
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        597.958333333333
        1912.9375
        359.833333333333
        5.29166666666667)
      Shape = qrsVertLine
    end
    object QRShape54: TQRShape
      Left = 26
      Top = 136
      Width = 3
      Height = 226
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        597.958333333333
        68.7916666666667
        359.833333333333
        7.9375)
      Shape = qrsVertLine
    end
    object QRLabel5: TQRLabel
      Left = 293
      Top = 381
      Width = 175
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        775.229166666667
        1008.0625
        463.020833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'DATOS SOBRE LOS INTERESES '
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 299
      Top = 396
      Width = 163
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        791.104166666667
        1047.75
        431.270833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '(Cantidades en moneda nacional) '
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel16: TQRLabel
      Left = 39
      Top = 417
      Width = 206
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        103.1875
        1103.3125
        545.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'INTERESES NOMINALES DEVENGADOS'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel22: TQRLabel
      Left = 39
      Top = 436
      Width = 271
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        103.1875
        1153.58333333333
        717.020833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'INTERESES NOMINALES DEVENGADOS Y PAGADOS'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel24: TQRLabel
      Left = 39
      Top = 500
      Width = 139
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        103.1875
        1322.91666666667
        367.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'PROPORCIÓN DEDUCIBLE'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel23: TQRLabel
      Left = 39
      Top = 455
      Width = 162
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        103.1875
        1203.85416666667
        428.625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'INTERESES REALES PAGADOS'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 40
      Top = 527
      Width = 237
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        105.833333333333
        1394.35416666667
        627.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'INTERESES REALES PAGADOS DEDUCIBLES.'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText17: TQRDBText
      Left = 500
      Top = 527
      Width = 121
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1322.91666666667
        1394.35416666667
        320.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'IMP_INT_REAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,###,##0'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel9: TQRLabel
      Left = 63
      Top = 575
      Width = 267
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        166.6875
        1521.35416666667
        706.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'DATOS DE LA INSTITUCION  QUE EMITE LA CONSTANCIA'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrlblMES_INICIAL: TQRLabel
      Left = 494
      Top = 87
      Width = 60
      Height = 29
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        76.7291666666667
        1307.04166666667
        230.1875
        158.75)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'MES INICIAL'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      OnPrint = qrlblMES_INICIALPrint
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object qrlblMES_FINAL: TQRLabel
      Left = 580
      Top = 87
      Width = 37
      Height = 29
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        76.7291666666667
        1534.58333333333
        230.1875
        97.8958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'MES FINAL'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      OnPrint = qrlblMES_FINALPrint
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 52
      Top = 116
      Width = 77
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        137.583333333333
        306.916666666667
        203.729166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'N° DE CREDITO'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 9
    end
    object QRMemo2: TQRMemo
      Left = -362
      Top = 4
      Width = 740
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.9375
        0
        10.5833333333333
        1957.91666666667)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      Lines.Strings = (
        
          'CONSTANCIA ANUAL DE INTERESES DEVENGADOS Y PAGADOS DE CRÉDITOS H' +
          'IPOTECARIOS '
        'DESTINADOS A CASA HABITACIÓN.')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRShape3: TQRShape
      Left = 27
      Top = 176
      Width = 697
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        71.4375
        465.666666666667
        1844.14583333333)
      Shape = qrsHorLine
    end
    object QRShape4: TQRShape
      Left = 27
      Top = 196
      Width = 697
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        71.4375
        518.583333333333
        1844.14583333333)
      Shape = qrsHorLine
    end
    object QRShape50: TQRShape
      Left = 27
      Top = 136
      Width = 697
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        71.4375
        359.833333333333
        1844.14583333333)
      Shape = qrsHorLine
    end
    object QRShape52: TQRShape
      Left = 27
      Top = 156
      Width = 697
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        71.4375
        412.75
        1844.14583333333)
      Shape = qrsHorLine
    end
    object QRShape2: TQRShape
      Left = 27
      Top = 217
      Width = 697
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        71.4375
        574.145833333333
        1844.14583333333)
      Shape = qrsHorLine
    end
    object QRShape17: TQRShape
      Left = 27
      Top = 285
      Width = 697
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        71.4375
        754.0625
        1844.14583333333)
      Shape = qrsHorLine
    end
    object QRShape20: TQRShape
      Left = 27
      Top = 359
      Width = 697
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        71.4375
        949.854166666667
        1844.14583333333)
      Shape = qrsHorLine
    end
    object QRDBText14: TQRDBText
      Left = 381
      Top = 291
      Width = 341
      Height = 63
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        166.6875
        1008.0625
        769.9375
        902.229166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = Query
      DataField = 'DOMICILIO_INMU'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRShape1: TQRShape
      Left = 26
      Top = 372
      Width = 3
      Height = 174
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        460.375
        68.7916666666667
        984.25
        7.9375)
      Shape = qrsVertLine
    end
    object QRShape5: TQRShape
      Left = 27
      Top = 454
      Width = 700
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        71.4375
        1201.20833333333
        1852.08333333333)
      Shape = qrsHorLine
    end
    object QRShape7: TQRShape
      Left = 27
      Top = 474
      Width = 700
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        71.4375
        1254.125
        1852.08333333333)
      Shape = qrsHorLine
    end
    object QRShape8: TQRShape
      Left = 27
      Top = 414
      Width = 700
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        71.4375
        1095.375
        1852.08333333333)
      Shape = qrsHorLine
    end
    object QRShape9: TQRShape
      Left = 27
      Top = 434
      Width = 700
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        71.4375
        1148.29166666667
        1852.08333333333)
      Shape = qrsHorLine
    end
    object QRShape10: TQRShape
      Left = 27
      Top = 493
      Width = 700
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        71.4375
        1304.39583333333
        1852.08333333333)
      Shape = qrsHorLine
    end
    object QRShape12: TQRShape
      Left = 27
      Top = 372
      Width = 700
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        71.4375
        984.25
        1852.08333333333)
      Shape = qrsHorLine
    end
    object QRShape13: TQRShape
      Left = 378
      Top = 414
      Width = 3
      Height = 133
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        351.895833333333
        1000.125
        1095.375
        7.9375)
      Shape = qrsVertLine
    end
    object QRShape11: TQRShape
      Left = 27
      Top = 520
      Width = 700
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        71.4375
        1375.83333333333
        1852.08333333333)
      Shape = qrsHorLine
    end
    object QRShape15: TQRShape
      Left = 27
      Top = 545
      Width = 697
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        71.4375
        1441.97916666667
        1844.14583333333)
      Shape = qrsHorLine
    end
    object QRLabel11: TQRLabel
      Left = 467
      Top = 575
      Width = 177
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1235.60416666667
        1521.35416666667
        468.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'DATOS DEL REPRESENTANTE LEGAL '
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRMemo3: TQRMemo
      Left = 26
      Top = 766
      Width = 699
      Height = 34
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        89.9583333333333
        68.7916666666667
        2026.70833333333
        1849.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Lines.Strings = (
        
          '"Los   datos  contenidos  en   esta  constancia    serán  coteja' +
          'dos  con   la   información  que  obra   en   poder  de  la   Au' +
          'toridad  Fiscal,  cuando'
        
          'se utilice como deducción personal en la declaración anual de la' +
          's personas físicas".')
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel12: TQRLabel
      Left = 31
      Top = 632
      Width = 33
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        82.0208333333333
        1672.16666666667
        87.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'R.F.C.:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel13: TQRLabel
      Left = 386
      Top = 632
      Width = 33
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1021.29166666667
        1672.16666666667
        87.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'R.F.C.:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrlblNOM_RETENEDOR: TQRLabel
      Left = 31
      Top = 596
      Width = 315
      Height = 34
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        89.9583333333333
        82.0208333333333
        1576.91666666667
        833.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlblNOM_RETENEDOR'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape19: TQRShape
      Left = 544
      Top = 679
      Width = 168
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        1439.33333333333
        1796.52083333333
        444.5)
      Shape = qrsHorLine
    end
    object QRLabel14: TQRLabel
      Left = 545
      Top = 680
      Width = 169
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1441.97916666667
        1799.16666666667
        447.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'FIRMA'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRMemo4: TQRMemo
      Left = 31
      Top = 659
      Width = 317
      Height = 36
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        95.25
        82.0208333333333
        1743.60416666667
        838.729166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Lines.Strings = (
        'REFORMA # 383 PISO 15 COL. CUAUHTEMOC C.P. 06500'
        'DEL. CUAUHTEMOC  MÉXICO, D.F.')
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrlblCurpRepresentante: TQRLabel
      Left = 386
      Top = 661
      Width = 97
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1021.29166666667
        1748.89583333333
        256.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlblCurpRepresentante'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel15: TQRLabel
      Left = 39
      Top = 474
      Width = 4
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        103.1875
        1254.125
        10.5833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '|'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      OnPrint = QRLabel15Print
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
  end
  object QRBand1: TQRBand
    Left = 38
    Top = 38
    Width = 740
    Height = 119
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
      314.854166666667
      1957.91666666667)
    BandType = rbColumnHeader
  end
  object Query: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'SELECT SCL.*, '
      
        '       (SCL.IMP_INT_PAG_ORD  + SCL.IMP_INT_MOR_PAG)  AS IMP_INT_' +
        'PAGADOS,'
      
        '       GREATEST( SCL.SDO_CIE_ANIO_ANT, SCL.SDO_FEC_CONTR ) SALDO' +
        '_INICIAL,'
      '       NOMEMP.NOMBRE EMPRESA,'
      
        '       --RFCEMP.SIGLAS_RFC   || '#39'-'#39' || RFCEMP.F_RFC   || '#39'-'#39' || ' +
        'RFCEMP.HOMOCLAVE_RFC  RFC_EMPRE,'
      
        '       RFCEMP.SIGLAS_RFC   || RFCEMP.F_RFC   || RFCEMP.HOMOCLAVE' +
        '_RFC  RFC_EMPRE,'
      
        '       DOMEMP.CALLE_NUMERO || '#39' '#39' || DOMEMP.COLONIA || '#39' '#39' ||  D' +
        'OMEMP.CODIGO_POSTAL DOM_EMPRE,'
      '       DECODE( P.CVE_PER_JURIDICA , '#39'PF'#39',      '
      
        '                 NOMREPF.APELLIDO_PATERNO || '#39' '#39' || NOMREPF.APEL' +
        'LIDO_MATERNO || '#39' '#39' || NOMREPF.NOMBRE_PERSONA,'
      '                 NOMREPM.NOM_RAZON_SOCIAL ) AS REPRESENTANTE,'
      
        '       RFCREP.SIGLAS_RFC   || RFCREP.F_RFC   || RFCREP.HOMOCLAVE' +
        '_RFC  RFC_REP'
      
        '       --RFCREP.SIGLAS_RFC   || '#39'-'#39' || RFCREP.F_RFC   || '#39'-'#39' || ' +
        'RFCREP.HOMOCLAVE_RFC  RFC_REP'
      'FROM   SAT_CRE_LAYOUT SCL,'
      '       EMPRESA   EMPRE,'
      '       PERSONA   NOMEMP,'
      '       DOMICILIO DOMEMP,'
      '       RFC       RFCEMP,'
      '       PERSONA   P,'
      '       PERSONA_FISICA NOMREPF,'
      '       PERSONA_MORAL  NOMREPM,'
      '       RFC       RFCREP'
      'WHERE  SCL.ID_EMPRESA = :ID_EMPRESA'
      '  AND  SCL.EJERCICIO  = :EJERCICIO'
      '  AND  EMPRE.ID_EMPRESA    = SCL.ID_EMPRESA'
      '  AND  NOMEMP.ID_PERSONA   = EMPRE.ID_EMPRESA'
      '  AND  DOMEMP.ID_DOMICILIO = NOMEMP.ID_DOMICILIO'
      '  AND  RFCEMP.ID_PERSONA   = NOMEMP.ID_PERSONA'
      '  AND  P.ID_PERSONA   = :ID_REPRESENTANTE'
      '  AND  RFCREP.ID_PERSONA   = P.ID_PERSONA'
      '  AND  NOMREPF.ID_PERSONA (+)= P.ID_PERSONA'
      '  AND  NOMREPM.ID_PERSONA (+)= P.ID_PERSONA'
      '')
    Left = 11
    Top = 6
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EJERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_REPRESENTANTE'
        ParamType = ptUnknown
      end>
    object QueryID_EMPRESA: TFloatField
      FieldName = 'ID_EMPRESA'
    end
    object QueryEJERCICIO: TFloatField
      FieldName = 'EJERCICIO'
    end
    object QueryID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object QueryID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object QuerySDO_PROMEDIO: TFloatField
      FieldName = 'SDO_PROMEDIO'
    end
    object QueryTIPO_REGISTRO: TFloatField
      FieldName = 'TIPO_REGISTRO'
    end
    object QueryCONSECUTIVO: TFloatField
      FieldName = 'CONSECUTIVO'
    end
    object QueryCVE_IDENTIFICADOR: TFloatField
      FieldName = 'CVE_IDENTIFICADOR'
    end
    object QueryRFC_CURP: TStringField
      FieldName = 'RFC_CURP'
      Size = 18
    end
    object QueryNOMBRE_TIT: TStringField
      FieldName = 'NOMBRE_TIT'
      Size = 150
    end
    object QueryDOMICILIO: TStringField
      FieldName = 'DOMICILIO'
      Size = 160
    end
    object QueryNUM_REFERENCIA: TStringField
      FieldName = 'NUM_REFERENCIA'
      Size = 40
    end
    object QueryNUM_REG_FIDE: TStringField
      FieldName = 'NUM_REG_FIDE'
      Size = 40
    end
    object QueryCVE_DEST_CREDITO: TFloatField
      FieldName = 'CVE_DEST_CREDITO'
    end
    object QueryIMP_INT_NOM_DEV: TFloatField
      FieldName = 'IMP_INT_NOM_DEV'
    end
    object QueryIMP_INT_PAG_ORD: TFloatField
      FieldName = 'IMP_INT_PAG_ORD'
    end
    object QueryIMP_INT_MOR_DEV: TFloatField
      FieldName = 'IMP_INT_MOR_DEV'
    end
    object QueryIMP_INT_MOR_PAG: TFloatField
      FieldName = 'IMP_INT_MOR_PAG'
    end
    object QueryIMP_INT_REAL: TFloatField
      FieldName = 'IMP_INT_REAL'
    end
    object QuerySDO_CIE_ANIO_ANT: TFloatField
      FieldName = 'SDO_CIE_ANIO_ANT'
    end
    object QuerySDO_FEC_CONTR: TFloatField
      FieldName = 'SDO_FEC_CONTR'
    end
    object QueryF_CONTRATACION: TFloatField
      FieldName = 'F_CONTRATACION'
    end
    object QueryPROP_DEDUCIBLE: TFloatField
      FieldName = 'PROP_DEDUCIBLE'
    end
    object QueryPCT_COP_SOC_CONY: TFloatField
      FieldName = 'PCT_COP_SOC_CONY'
    end
    object QueryNUM_COPROPIET: TFloatField
      FieldName = 'NUM_COPROPIET'
    end
    object QueryRFC_CURP_COPRO: TStringField
      FieldName = 'RFC_CURP_COPRO'
      Size = 18
    end
    object QueryNOMBRE_COPRO: TStringField
      FieldName = 'NOMBRE_COPRO'
      Size = 150
    end
    object QueryRFC_CURP_CONYU: TStringField
      FieldName = 'RFC_CURP_CONYU'
      Size = 18
    end
    object QueryNOMBRE_CONYU: TStringField
      FieldName = 'NOMBRE_CONYU'
      Size = 150
    end
    object QueryDOMICILIO_INMU: TStringField
      FieldName = 'DOMICILIO_INMU'
      Size = 160
    end
    object QuerySALDO_INICIAL: TFloatField
      FieldName = 'SALDO_INICIAL'
    end
    object QueryEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 80
    end
    object QueryRFC_EMPRE: TStringField
      FieldName = 'RFC_EMPRE'
      Size = 16
    end
    object QueryDOM_EMPRE: TStringField
      FieldName = 'DOM_EMPRE'
      Size = 108
    end
    object QueryREPRESENTANTE: TStringField
      FieldName = 'REPRESENTANTE'
      Size = 80
    end
    object QueryRFC_REP: TStringField
      FieldName = 'RFC_REP'
      Size = 16
    end
    object QueryIMP_INT_PAGADOS: TFloatField
      FieldName = 'IMP_INT_PAGADOS'
    end
    object QueryPCT_PARTICIPACION: TFloatField
      FieldName = 'PCT_PARTICIPACION'
    end
    object QueryF_IMPRESION: TDateField
      FieldName = 'F_IMPRESION'
    end
    object QueryNUM_IMPRESION: TFloatField
      FieldName = 'NUM_IMPRESION'
    end
    object QueryF_AUT_OPERACION: TDateTimeField
      FieldName = 'F_AUT_OPERACION'
    end
    object QueryF_LIQ_BNC: TDateTimeField
      FieldName = 'F_LIQ_BNC'
    end
    object QueryMES_F_AUT_OPE: TFloatField
      FieldName = 'MES_F_AUT_OPE'
    end
    object QueryMES_F_LIQ_BNC: TFloatField
      FieldName = 'MES_F_LIQ_BNC'
    end
    object QueryF_INI_EJER: TDateTimeField
      FieldName = 'F_INI_EJER'
    end
    object QueryF_FIN_EJER: TDateTimeField
      FieldName = 'F_FIN_EJER'
    end
  end
end
