object QrCalifAcr: TQrCalifAcr
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qryQrCalifAcr
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
    127
    127
    0)
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = First
  PrintIfEmpty = True
  SnapToGrid = True
  Units = Inches
  Zoom = 100
  object PageHeaderBand1: TQRBand
    Left = 48
    Top = 48
    Width = 960
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
      2540)
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
        2540)
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
    Left = 48
    Top = 132
    Width = 960
    Height = 59
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      156.104166666667
      2540)
    BandType = rbColumnHeader
    object QRShape4: TQRShape
      Left = 819
      Top = 0
      Width = 139
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2166.9375
        0
        367.770833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrShpAdeudoTotal: TQRShape
      Left = 0
      Top = 1
      Width = 70
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        0
        2.64583333333333
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblID_ACREDITADO: TQRLabel
      Left = 4
      Top = 15
      Width = 63
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        10.5833333333333
        39.6875
        166.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Id. Acreditado'
      Color = clSilver
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
    object qrshpCalificadoras: TQRShape
      Left = 420
      Top = 1
      Width = 331
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1111.25
        2.64583333333333
        875.770833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblCalificadoras: TQRLabel
      Left = 425
      Top = 3
      Width = 322
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1124.47916666667
        7.9375
        851.958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Calificadoras'
      Color = clSilver
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
    object qrShpNomCalificadora1: TQRShape
      Left = 420
      Top = 15
      Width = 56
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        113.770833333333
        1111.25
        39.6875
        148.166666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrShpNomCalificadora2: TQRShape
      Left = 475
      Top = 15
      Width = 56
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        113.770833333333
        1256.77083333333
        39.6875
        148.166666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrShpNomCalificadora3: TQRShape
      Left = 530
      Top = 15
      Width = 56
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        113.770833333333
        1402.29166666667
        39.6875
        148.166666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrShpNomCalificadora4: TQRShape
      Left = 585
      Top = 15
      Width = 56
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        113.770833333333
        1547.8125
        39.6875
        148.166666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrshpNomCalificadora5: TQRShape
      Left = 640
      Top = 15
      Width = 56
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        113.770833333333
        1693.33333333333
        39.6875
        148.166666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrShpNomCalificadora6: TQRShape
      Left = 695
      Top = 15
      Width = 56
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        113.770833333333
        1838.85416666667
        39.6875
        148.166666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrdbNOM_CALIFICADORA1: TQRDBText
      Left = 424
      Top = 17
      Width = 49
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.1875
        1121.83333333333
        44.9791666666667
        129.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clSilver
      DataSet = qryQrCalifAcr
      DataField = 'NOM_CALIFICADORA1'
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
    object qrdbNOM_CALIFICADORA2: TQRDBText
      Left = 479
      Top = 17
      Width = 49
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.1875
        1267.35416666667
        44.9791666666667
        129.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clSilver
      DataSet = qryQrCalifAcr
      DataField = 'NOM_CALIFICADORA2'
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
    object qrdbNOM_CALIFICADORA3: TQRDBText
      Left = 535
      Top = 17
      Width = 49
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.1875
        1415.52083333333
        44.9791666666667
        129.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clSilver
      DataSet = qryQrCalifAcr
      DataField = 'NOM_CALIFICADORA3'
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
    object qrdbNOM_CALIFICADORA4: TQRDBText
      Left = 589
      Top = 17
      Width = 49
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.1875
        1558.39583333333
        44.9791666666667
        129.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clSilver
      DataSet = qryQrCalifAcr
      DataField = 'NOM_CALIFICADORA4'
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
    object qrdbNOM_CALIFICADORA5: TQRDBText
      Left = 644
      Top = 17
      Width = 49
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.1875
        1703.91666666667
        44.9791666666667
        129.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clSilver
      DataSet = qryQrCalifAcr
      DataField = 'NOM_CALIFICADORA5'
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
    object qrdbNOM_CALIFICADORA6: TQRDBText
      Left = 698
      Top = 17
      Width = 49
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.1875
        1846.79166666667
        44.9791666666667
        129.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clSilver
      DataSet = qryQrCalifAcr
      DataField = 'NOM_CALIFICADORA6'
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
    object QRShape1: TQRShape
      Left = 69
      Top = 1
      Width = 352
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        182.5625
        2.64583333333333
        931.333333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblNOM_ACREDITADO: TQRLabel
      Left = 73
      Top = 15
      Width = 345
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        193.145833333333
        39.6875
        912.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Nombre del Acreditado'
      Color = clSilver
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
      Left = 750
      Top = 1
      Width = 70
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        1984.375
        2.64583333333333
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape3: TQRShape
      Left = 819
      Top = 14
      Width = 70
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        116.416666666667
        2166.9375
        37.0416666666667
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 823
      Top = 28
      Width = 63
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        2177.52083333333
        74.0833333333333
        166.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Calificación'
      Color = clSilver
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
      Left = 824
      Top = 2
      Width = 130
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2180.16666666667
        5.29166666666667
        343.958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'CALIFICADORAS'
      Color = clSilver
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
      Left = 888
      Top = 14
      Width = 70
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        116.416666666667
        2349.5
        37.0416666666667
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel5: TQRLabel
      Left = 892
      Top = 28
      Width = 63
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        2360.08333333333
        74.0833333333333
        166.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Capitalización'
      Color = clSilver
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
  object qrDetail: TQRBand
    Left = 48
    Top = 211
    Width = 960
    Height = 14
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
      37.0416666666667
      2540)
    BandType = rbDetail
    object qrdbID_ACREDITADO: TQRDBText
      Left = 4
      Top = 1
      Width = 64
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
        169.333333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrCalifAcr
      DataField = 'ID_ACREDITADO'
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
    object qrdbNOM_ACREDITADO: TQRDBText
      Left = 73
      Top = 1
      Width = 347
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        193.145833333333
        2.64583333333333
        918.104166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrCalifAcr
      DataField = 'NOM_ACREDITADO'
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
    object qrdbCVE_CALIFICACION1: TQRDBText
      Left = 424
      Top = 1
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1121.83333333333
        2.64583333333333
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrCalifAcr
      DataField = 'CVE_CALIFICACION1'
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
    object qrdbCVE_CALIFICACION2: TQRDBText
      Left = 478
      Top = 1
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1264.70833333333
        2.64583333333333
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrCalifAcr
      DataField = 'CVE_CALIFICACION2'
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
    object qrdbCVE_CALIFICACION3: TQRDBText
      Left = 532
      Top = 1
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1407.58333333333
        2.64583333333333
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrCalifAcr
      DataField = 'CVE_CALIFICACION3'
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
    object qrdbCVE_CALIFICACION4: TQRDBText
      Left = 588
      Top = 1
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1555.75
        2.64583333333333
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrCalifAcr
      DataField = 'CVE_CALIFICACION4'
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
    object qrdbCVE_CALIFICACION5: TQRDBText
      Left = 644
      Top = 1
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1703.91666666667
        2.64583333333333
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrCalifAcr
      DataField = 'CVE_CALIFICACION5'
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
    object qrdbCVE_CALIFICACION6: TQRDBText
      Left = 697
      Top = 1
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1844.14583333333
        2.64583333333333
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrCalifAcr
      DataField = 'CVE_CALIFICACION6'
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
    object qrdbNUM_PUNTOS_DIST: TQRDBText
      Left = 823
      Top = 1
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2177.52083333333
        2.64583333333333
        169.333333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrCalifAcr
      DataField = 'NUM_PUNTOS_DIST'
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
    object qrdbNUM_NIVEL: TQRDBText
      Left = 892
      Top = 1
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2360.08333333333
        2.64583333333333
        169.333333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrCalifAcr
      DataField = 'NUM_NIVEL'
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
  object qrGrpF_CALIFICACION: TQRGroup
    Left = 48
    Top = 191
    Width = 960
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
      52.9166666666667
      2540)
    Expression = 'qryQrCalifAcr.F_CALIFICACION'
    FooterBand = qrFootF_CALIFICACION
    Master = Owner
    ReprintOnNewPage = False
    object qrshpF_CALIFICACION: TQRShape
      Left = 3
      Top = 2
      Width = 956
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        7.9375
        5.29166666666667
        2529.41666666667)
      Shape = qrsRectangle
    end
    object qrlblF_CALIFICACION: TQRLabel
      Left = 5
      Top = 4
      Width = 83
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        13.2291666666667
        10.5833333333333
        219.604166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha de Calificación:'
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
    object qrdbF_CALIFICACION: TQRDBText
      Left = 89
      Top = 4
      Width = 56
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        235.479166666667
        10.5833333333333
        148.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrCalifAcr
      DataField = 'F_CALIFICACION'
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
  object qrFootF_CALIFICACION: TQRBand
    Left = 48
    Top = 225
    Width = 960
    Height = 5
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
      13.2291666666667
      2540)
    BandType = rbGroupFooter
  end
  object qryQrCalifAcr: TQuery
    SQL.Strings = (
      ''
      '   SELECT R.*,'
      
        '          (SELECT NUM_PUNTOS_DIST FROM CR_CAL_CALIFICA WHERE ID_' +
        'CALIFICADORA = 0'
      
        '           AND CVE_CALIFICACION = R.CVE_CALIFICACION_SICC AND SI' +
        'T_CAL_CALIFICA <> '#39'CA'#39')AS NUM_PUNTOS_DIST,'
      
        '          (SELECT NUM_NIVEL FROM CR_CAL_CALIFICA WHERE ID_CALIFI' +
        'CADORA = 0'
      
        '           AND CVE_CALIFICACION = R.CVE_CALIFICACION_SICC AND SI' +
        'T_CAL_CALIFICA <> '#39'CA'#39')AS NUM_NIVEL'
      ''
      '   FROM ( SELECT TEMP.F_CALIFICACION,'
      '                  GYM.ID_ACREDITADO,'
      '                  GYM.NOM_ACREDITADO,'
      '        CCAL.NOM_CALIFICADORA1,'
      '        NVL2(CCAL.ID_CALIFICADORA1,'
      
        '        PKGCRSICC.GET_ULTIMA_CALIF_ACRED(GYM.ID_ACREDITADO, CCAL' +
        '.ID_CALIFICADORA1, '#39'RIESGO'#39','
      
        '                  TEMP.F_CALIFICACION),NULL) AS CVE_CALIFICACION' +
        '1,'
      '        CCAL.NOM_CALIFICADORA2,'
      '        NVL2(CCAL.ID_CALIFICADORA2,'
      
        '        PKGCRSICC.GET_ULTIMA_CALIF_ACRED(GYM.ID_ACREDITADO, CCAL' +
        '.ID_CALIFICADORA2, '#39'RIESGO'#39','
      
        '                  TEMP.F_CALIFICACION),NULL) AS CVE_CALIFICACION' +
        '2,'
      '        CCAL.NOM_CALIFICADORA3,'
      '        NVL2(CCAL.ID_CALIFICADORA3,'
      
        '        PKGCRSICC.GET_ULTIMA_CALIF_ACRED(GYM.ID_ACREDITADO, CCAL' +
        '.ID_CALIFICADORA3, '#39'RIESGO'#39','
      
        '                  TEMP.F_CALIFICACION),NULL) AS CVE_CALIFICACION' +
        '3,'
      '        CCAL.NOM_CALIFICADORA4,'
      '        NVL2(CCAL.ID_CALIFICADORA4,'
      
        '        PKGCRSICC.GET_ULTIMA_CALIF_ACRED(GYM.ID_ACREDITADO, CCAL' +
        '.ID_CALIFICADORA4, '#39'RIESGO'#39','
      
        '                  TEMP.F_CALIFICACION),NULL) AS CVE_CALIFICACION' +
        '4,'
      '        CCAL.NOM_CALIFICADORA5,'
      '        NVL2(CCAL.ID_CALIFICADORA5,'
      
        '        PKGCRSICC.GET_ULTIMA_CALIF_ACRED(GYM.ID_ACREDITADO, CCAL' +
        '.ID_CALIFICADORA5, '#39'RIESGO'#39','
      
        '                  TEMP.F_CALIFICACION),NULL) AS CVE_CALIFICACION' +
        '5,'
      '        CCAL.NOM_CALIFICADORA6,'
      '        NVL2(CCAL.ID_CALIFICADORA6,'
      
        '        PKGCRSICC.GET_ULTIMA_CALIF_ACRED(GYM.ID_ACREDITADO, CCAL' +
        '.ID_CALIFICADORA6, '#39'RIESGO'#39','
      
        '                  TEMP.F_CALIFICACION),NULL) AS CVE_CALIFICACION' +
        '6,'
      
        '        PKGCRSICC.GET_ULTIMA_CALIF_ACRED(GYM.ID_ACREDITADO, NULL' +
        ', NULL, TEMP.F_CALIFICACION) AS CVE_CALIFICACION_SICC'
      '          FROM ( SELECT F_CALIFICACION'
      '                 FROM ( SELECT F_CALIFICACION'
      '                          FROM ADMIPROD.CR_CAL_ACRED'
      '                         WHERE SIT_CAL_ACRED <> '#39'CA'#39
      
        '                           AND F_CALIFICACION BETWEEN to_date('#39'0' +
        '1/05/2005'#39','#39'dd/mm/yyyy'#39')'
      
        '                               AND to_date('#39'01/10/2005'#39','#39'dd/mm/y' +
        'yyy'#39')'
      '                       UNION'
      '                        SELECT F_CALIFICACION'
      '                          FROM ADMIPROD.CR_CAL_AR_CABEC'
      '                         WHERE SIT_CAL_AR_CABE <> '#39'CA'#39
      
        '                           AND F_CALIFICACION BETWEEN to_date('#39'0' +
        '1/05/2005'#39','#39'dd/mm/yyyy'#39')'
      
        '                               AND to_date('#39'01/10/2005'#39','#39'dd/mm/y' +
        'yyy'#39')'
      '                      )'
      '                 GROUP BY F_CALIFICACION'
      '               ) TEMP,'
      '               ( SELECT CA.ID_ACREDITADO,'
      
        '                        SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(N' +
        'ULL, NULL, CA.ID_ACREDITADO),1,255) AS NOM_ACREDITADO'
      '                   FROM (SELECT CA.ID_ACREDITADO'
      #9#9#9#9#9#9'   FROM CR_CONTRATO CCTO, CONTRATO CTO,'
      
        '                                (SELECT ID_ACREDITADO FROM CR_AC' +
        'REDITADO WHERE SIT_ACREDITADO='#39'AC'#39')CA'
      
        '                          WHERE CTO.ID_CONTRATO = CCTO.ID_CONTRA' +
        'TO'
      
        '                            AND CA.ID_ACREDITADO = CTO.ID_TITULA' +
        'R'
      
        '          '#9#9#9#9#9'AND CA.ID_ACREDITADO = DECODE(0,0,CA.ID_ACREDITAD' +
        'O,0)'
      
        '                            AND CTO.ID_EMPRESA = DECODE(0,0,CTO.' +
        'ID_EMPRESA,0)'
      '                          GROUP BY CA.ID_ACREDITADO'
      '                        ) CA'
      '               ) GYM,'
      
        '               (SELECT MAX(DECODE(ROWNUM,1, ID_CALIFICADORA, NUL' +
        'L)) AS ID_CALIFICADORA1,'
      
        '                MAX(DECODE(ROWNUM,1, NOM_CALIFICADORA, NULL)) AS' +
        ' NOM_CALIFICADORA1,'
      
        '                MAX(DECODE(ROWNUM,2, ID_CALIFICADORA, NULL)) AS ' +
        'ID_CALIFICADORA2,'
      
        '                MAX(DECODE(ROWNUM,2, NOM_CALIFICADORA, NULL)) AS' +
        ' NOM_CALIFICADORA2,'
      
        '                MAX(DECODE(ROWNUM,3, ID_CALIFICADORA, NULL)) AS ' +
        'ID_CALIFICADORA3,'
      
        '                MAX(DECODE(ROWNUM,3, NOM_CALIFICADORA, NULL)) AS' +
        ' NOM_CALIFICADORA3,'
      
        '                MAX(DECODE(ROWNUM,4, ID_CALIFICADORA, NULL)) AS ' +
        'ID_CALIFICADORA4,'
      
        '                MAX(DECODE(ROWNUM,4, NOM_CALIFICADORA, NULL)) AS' +
        ' NOM_CALIFICADORA4,'
      
        '                MAX(DECODE(ROWNUM,5, ID_CALIFICADORA, NULL)) AS ' +
        'ID_CALIFICADORA5,'
      
        '                MAX(DECODE(ROWNUM,5, NOM_CALIFICADORA, NULL)) AS' +
        ' NOM_CALIFICADORA5,'
      
        '                MAX(DECODE(ROWNUM,6, ID_CALIFICADORA, NULL)) AS ' +
        'ID_CALIFICADORA6,'
      
        '                MAX(DECODE(ROWNUM,6, NOM_CALIFICADORA, NULL)) AS' +
        ' NOM_CALIFICADORA6'
      ''
      '                FROM( SELECT ID_CALIFICADORA,'
      
        '                        SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(N' +
        'ULL, NULL, ID_CALIFICADORA),1,255) AS NOM_CALIFICADORA'
      '                   FROM CR_CALIFICADORA'
      '                  WHERE SIT_CALIFICADORA <> '#39'CA'#39
      
        '                    AND ID_CALIFICADORA = DECODE(0,0,ID_CALIFICA' +
        'DORA,0)'
      '                  ORDER BY NOM_CALIFICADORA)'
      '               ) CCAL'
      '        ) R '
      ''
      '   WHERE ( (R.CVE_CALIFICACION1 IS null) OR'
      '           (R.CVE_CALIFICACION2 IS  null) OR'
      '           (R.CVE_CALIFICACION3 IS  null) OR'
      '           (R.CVE_CALIFICACION4 IS  null) OR'
      '           (R.CVE_CALIFICACION5 IS  null) OR'
      '           (R.CVE_CALIFICACION6 IS  null) )'
      ''
      '--   ORDER BY R.F_CALIFICACION DESC , {?pORDEN}')
    Left = 24
    Top = 8
    object qryQrCalifAcrF_CALIFICACION: TDateTimeField
      FieldName = 'F_CALIFICACION'
    end
    object qryQrCalifAcrID_ACREDITADO: TFloatField
      FieldName = 'ID_ACREDITADO'
    end
    object qryQrCalifAcrNOM_ACREDITADO: TStringField
      FieldName = 'NOM_ACREDITADO'
      Size = 255
    end
    object qryQrCalifAcrNOM_CALIFICADORA1: TStringField
      FieldName = 'NOM_CALIFICADORA1'
      Size = 255
    end
    object qryQrCalifAcrCVE_CALIFICACION1: TMemoField
      FieldName = 'CVE_CALIFICACION1'
      BlobType = ftMemo
      Size = 4000
    end
    object qryQrCalifAcrNOM_CALIFICADORA2: TStringField
      FieldName = 'NOM_CALIFICADORA2'
      Size = 255
    end
    object qryQrCalifAcrCVE_CALIFICACION2: TMemoField
      FieldName = 'CVE_CALIFICACION2'
      BlobType = ftMemo
      Size = 4000
    end
    object qryQrCalifAcrNOM_CALIFICADORA3: TStringField
      FieldName = 'NOM_CALIFICADORA3'
      Size = 255
    end
    object qryQrCalifAcrCVE_CALIFICACION3: TMemoField
      FieldName = 'CVE_CALIFICACION3'
      BlobType = ftMemo
      Size = 4000
    end
    object qryQrCalifAcrNOM_CALIFICADORA4: TStringField
      FieldName = 'NOM_CALIFICADORA4'
      Size = 255
    end
    object qryQrCalifAcrCVE_CALIFICACION4: TMemoField
      FieldName = 'CVE_CALIFICACION4'
      BlobType = ftMemo
      Size = 4000
    end
    object qryQrCalifAcrNOM_CALIFICADORA5: TStringField
      FieldName = 'NOM_CALIFICADORA5'
      Size = 255
    end
    object qryQrCalifAcrCVE_CALIFICACION5: TMemoField
      FieldName = 'CVE_CALIFICACION5'
      BlobType = ftMemo
      Size = 4000
    end
    object qryQrCalifAcrNOM_CALIFICADORA6: TStringField
      FieldName = 'NOM_CALIFICADORA6'
      Size = 255
    end
    object qryQrCalifAcrCVE_CALIFICACION6: TMemoField
      FieldName = 'CVE_CALIFICACION6'
      BlobType = ftMemo
      Size = 4000
    end
    object qryQrCalifAcrCVE_CALIFICACION_SICC: TMemoField
      FieldName = 'CVE_CALIFICACION_SICC'
      BlobType = ftMemo
      Size = 4000
    end
    object qryQrCalifAcrNUM_PUNTOS_DIST: TFloatField
      FieldName = 'NUM_PUNTOS_DIST'
    end
    object qryQrCalifAcrNUM_NIVEL: TFloatField
      FieldName = 'NUM_NIVEL'
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.SQL'
    Filter = 'SQL File|*.SQL'
    Left = 60
    Top = 9
  end
end
