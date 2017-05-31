object QRDetApliVA: TQRDetApliVA
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qyDetApliva
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
    99.06
    2794
    99.06
    2159
    127
    127
    0)
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = Auto
  PrintIfEmpty = True
  SnapToGrid = True
  Units = Inches
  Zoom = 100
  object PageHeaderBand1: TQRBand
    Left = 48
    Top = 37
    Width = 720
    Height = 100
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
      264.583333333333
      1905)
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
        264.583333333333
        0
        0
        1905)
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
    Top = 137
    Width = 720
    Height = 25
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
      66.1458333333333
      1905)
    BandType = rbColumnHeader
    object QRShape1: TQRShape
      Left = 0
      Top = 1
      Width = 80
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        0
        2.64583333333333
        211.666666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape2: TQRShape
      Left = 79
      Top = 1
      Width = 55
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        209.020833333333
        2.64583333333333
        145.520833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape3: TQRShape
      Left = 133
      Top = 1
      Width = 55
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        351.895833333333
        2.64583333333333
        145.520833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape4: TQRShape
      Left = 187
      Top = 1
      Width = 43
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        494.770833333333
        2.64583333333333
        113.770833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape5: TQRShape
      Left = 375
      Top = 1
      Width = 94
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        992.1875
        2.64583333333333
        248.708333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape6: TQRShape
      Left = 468
      Top = 1
      Width = 90
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1238.25
        2.64583333333333
        238.125)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape7: TQRShape
      Left = 557
      Top = 1
      Width = 90
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1473.72916666667
        2.64583333333333
        238.125)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape8: TQRShape
      Left = 646
      Top = 1
      Width = 73
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1709.20833333333
        2.64583333333333
        193.145833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabelPERIODO: TQRLabel
      Left = 4
      Top = 5
      Width = 73
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        10.5833333333333
        13.2291666666667
        193.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Periodo a Reportar '
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
      Left = 90
      Top = 5
      Width = 30
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        238.125
        13.2291666666667
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
    object QRLabelPRODUCTO: TQRLabel
      Left = 143
      Top = 5
      Width = 38
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        378.354166666667
        13.2291666666667
        100.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
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
    object QRLabelNUM_PERIODO: TQRLabel
      Left = 191
      Top = 5
      Width = 36
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        505.354166666667
        13.2291666666667
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Periodo'
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
    object QRLabel_IVA_DEV: TQRLabel
      Left = 397
      Top = 5
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1050.39583333333
        13.2291666666667
        156.104166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'IVA Devengado'
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
    object QRLabel_IVA_PAG: TQRLabel
      Left = 490
      Top = 5
      Width = 51
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1296.45833333333
        13.2291666666667
        134.9375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'IVA Pagado'
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
    object QRLabel8: TQRLabel
      Left = 574
      Top = 5
      Width = 56
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1518.70833333333
        13.2291666666667
        148.166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'IVA por Pagar'
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
    object QRLabelSIT_IVA: TQRLabel
      Left = 656
      Top = 5
      Width = 57
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1735.66666666667
        13.2291666666667
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Situación IVA'
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
      Left = 229
      Top = 1
      Width = 63
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        605.895833333333
        2.64583333333333
        166.6875)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape12: TQRShape
      Left = 291
      Top = 1
      Width = 85
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        769.9375
        2.64583333333333
        224.895833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 235
      Top = 5
      Width = 52
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        621.770833333333
        13.2291666666667
        137.583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha Cierre'
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
      Left = 295
      Top = 5
      Width = 75
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        780.520833333333
        13.2291666666667
        198.4375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Interés Devengado'
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
  object QRBand2: TQRBand
    Left = 48
    Top = 162
    Width = 720
    Height = 3
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Enabled = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      7.9375
      1905)
    BandType = rbColumnHeader
  end
  object QRGroupCont: TQRGroup
    Left = 48
    Top = 165
    Width = 720
    Height = 3
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Enabled = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      7.9375
      1905)
    FooterBand = QRFooterCont
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGroupMoneda: TQRGroup
    Left = 48
    Top = 168
    Width = 720
    Height = 15
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
      39.6875
      1905)
    Expression = 'qyDetApliva.CVE_MONEDA'
    FooterBand = QRFooterMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRShapeMoneda: TQRShape
      Left = 0
      Top = 1
      Width = 409
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        0
        2.64583333333333
        1082.14583333333)
      Shape = qrsRectangle
    end
    object QRLabelMoneda: TQRLabel
      Left = 4
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
        10.5833333333333
        2.64583333333333
        95.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda :'
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
    object QRDBCVE_MONEDA: TQRDBText
      Left = 42
      Top = 2
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        111.125
        5.29166666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDetApliva
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
      Left = 94
      Top = 2
      Width = 275
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        248.708333333333
        5.29166666666667
        727.604166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDetApliva
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
  object QRGroupAcreditado: TQRGroup
    Left = 48
    Top = 183
    Width = 720
    Height = 15
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
      39.6875
      1905)
    Expression = 'qyDetApliva.ID_PERSONA'
    FooterBand = QRFooterAcreditado
    Master = Owner
    ReprintOnNewPage = False
    object QRDB_NOMBRE: TQRDBText
      Left = 183
      Top = 2
      Width = 242
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        484.1875
        5.29166666666667
        640.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDetApliva
      DataField = 'NOMBRE'
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
    object QRDB_ID_PERSONA: TQRDBText
      Left = 142
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
        375.708333333333
        5.29166666666667
        100.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDetApliva
      DataField = 'ID_PERSONA'
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
    object QRLabelACREDITADO: TQRLabel
      Left = 81
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
        214.3125
        5.29166666666667
        121.708333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Acreditado :'
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
    object QRLabelRFC: TQRLabel
      Left = 433
      Top = 2
      Width = 23
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1145.64583333333
        5.29166666666667
        60.8541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'RFC :'
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
    object QRDB_CVERFC: TQRDBText
      Left = 460
      Top = 2
      Width = 93
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1217.08333333333
        5.29166666666667
        246.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDetApliva
      DataField = 'CVERFC'
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
    Left = 48
    Top = 206
    Width = 720
    Height = 10
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
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
      26.4583333333333
      1905)
    BandType = rbDetail
    object QRDB_MESPER: TQRDBText
      Left = 10
      Top = -1
      Width = 18
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        26.4583333333333
        -2.64583333333333
        47.625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDetApliva
      DataField = 'MESPER'
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
    object QRDB_ID_CREDITO: TQRDBText
      Left = 86
      Top = -1
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        227.541666666667
        -2.64583333333333
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDetApliva
      DataField = 'ID_CREDITO'
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
    object QRDB_IVA_X_PAG: TQRDBText
      Left = 575
      Top = -1
      Width = 60
      Height = 11
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1521.35416666667
        -2.64583333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDetApliva
      DataField = 'IVA_X_PAG'
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
    object QRDB_ID_PERIODO: TQRDBText
      Left = 193
      Top = -1
      Width = 30
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        510.645833333333
        -2.64583333333333
        79.375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDetApliva
      DataField = 'ID_PERIODO'
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
    object QRDB_CVE_PROD: TQRDBText
      Left = 139
      Top = -1
      Width = 44
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        367.770833333333
        -2.64583333333333
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDetApliva
      DataField = 'CVE_PROD'
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
    object QRDB_IVA_PAGADO: TQRDBText
      Left = 474
      Top = -1
      Width = 10
      Height = 11
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1254.125
        -2.64583333333333
        26.4583333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDetApliva
      DataField = 'IVA_PAGADO'
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
    object QRDB_IVA_DEVENGADO: TQRDBText
      Left = 360
      Top = -1
      Width = 34
      Height = 11
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        952.5
        -2.64583333333333
        89.9583333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDetApliva
      DataField = 'IVA_DEVENGADO'
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
    object QRDB_ANIOPER: TQRDBText
      Left = 38
      Top = -1
      Width = 34
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        100.541666666667
        -2.64583333333333
        89.9583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDetApliva
      DataField = 'ANIOPER'
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
    object QRLabel2: TQRLabel
      Left = 30
      Top = -1
      Width = 4
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        79.375
        -2.64583333333333
        10.5833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '-'
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
    object QRExpr8: TQRExpr
      Left = 397
      Top = -1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1050.39583333333
        -2.64583333333333
        158.75)
      Alignment = taRightJustify
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
      Transparent = True
      WordWrap = True
      Expression = 
        'IF(qyDetApliva.CVE_OPERACION = '#39'IVDEPE'#39' ,qyDetApliva.IVA_DEVENGA' +
        'DO,'#39' '#39')'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr9: TQRExpr
      Left = 487
      Top = -1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1288.52083333333
        -2.64583333333333
        158.75)
      Alignment = taRightJustify
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
      Transparent = True
      WordWrap = True
      Expression = 'IF( qyDetApliva.IVA_PAGADO<> 0,qyDetApliva.IVA_PAGADO,'#39' '#39')'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr10: TQRExpr
      Left = 232
      Top = -1
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        613.833333333333
        -2.64583333333333
        132.291666666667)
      Alignment = taCenter
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
      Transparent = True
      WordWrap = True
      Expression = 
        'IF( qyDetApliva.CVE_OPERACION = '#39'IVDEPE'#39', qyDetApliva.FK_FECHASD' +
        'O,'#39' '#39')'
      FontSize = 5
    end
    object QRExpr11: TQRExpr
      Left = 297
      Top = -1
      Width = 56
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        785.8125
        -2.64583333333333
        148.166666666667)
      Alignment = taRightJustify
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
      Transparent = True
      WordWrap = True
      Expression = 
        'IF( qyDetApliva.CVE_OPERACION = '#39'IVDEPE'#39' , qyDetApliva.INTERES,'#39 +
        ' '#39')'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object QRFooterAcreditado: TQRBand
    Left = 48
    Top = 246
    Width = 720
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
      1905)
    BandType = rbGroupFooter
    object QRLabelTotalXacreditado: TQRLabel
      Left = 75
      Top = 2
      Width = 80
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        198.4375
        5.29166666666667
        211.666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total por Acreditado:'
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
    object QRShape15: TQRShape
      Left = 370
      Top = 0
      Width = 280
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        13.2291666666667
        978.958333333333
        0
        740.833333333333)
      Pen.Width = 2
      Shape = qrsHorLine
    end
    object Tot_IVADEV_TA: TQRExpr
      Left = 397
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1050.39583333333
        7.9375
        158.75)
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
      Expression = 'SUM(qyDetApliva.IVA_DEVENGADO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object Tot_IVAPAG_TA: TQRExpr
      Left = 487
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1288.52083333333
        7.9375
        158.75)
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
      Expression = 'SUM(qyDetApliva.IVA_PAGADO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object Tot_IVA_X_PAG_TA: TQRExpr
      Left = 575
      Top = 3
      Width = 60
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1521.35416666667
        7.9375
        158.75)
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
      Expression = 'SUM(qyDetApliva.IVA_X_PAG)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRFooterMoneda: TQRBand
    Left = 48
    Top = 263
    Width = 720
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
      1905)
    BandType = rbGroupFooter
    object QRShape13: TQRShape
      Left = 370
      Top = 0
      Width = 280
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        13.2291666666667
        978.958333333333
        0
        740.833333333333)
      Pen.Width = 2
      Shape = qrsHorLine
    end
    object QRLabel1: TQRLabel
      Left = 2
      Top = 2
      Width = 72
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
        190.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total por Moneda :'
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
    object Tot_IVADEV_TM: TQRExpr
      Left = 397
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1050.39583333333
        7.9375
        158.75)
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
      Expression = 'SUM(qyDetApliva.IVA_DEVENGADO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object Tot_IVAPAG_TM: TQRExpr
      Left = 487
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1288.52083333333
        7.9375
        158.75)
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
      Expression = 'SUM(qyDetApliva.IVA_PAGADO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object Tot_IVA_X_PAG_TM: TQRExpr
      Left = 575
      Top = 3
      Width = 60
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1521.35416666667
        7.9375
        158.75)
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
      Expression = 'SUM(qyDetApliva.IVA_X_PAG)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRFooterCont: TQRBand
    Left = 48
    Top = 281
    Width = 720
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Enabled = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.2708333333333
      1905)
    BandType = rbGroupFooter
    object QRLabel45: TQRLabel
      Left = 11
      Top = 3
      Width = 74
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        29.1041666666667
        7.9375
        195.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Gran Total '
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
    object QRShape19: TQRShape
      Left = 370
      Top = 0
      Width = 280
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        13.2291666666667
        978.958333333333
        0
        740.833333333333)
      Pen.Width = 2
      Shape = qrsHorLine
    end
    object Tot_IVA_X_PAG_GT: TQRExpr
      Left = 575
      Top = 3
      Width = 60
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1521.35416666667
        7.9375
        158.75)
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
      Expression = 'SUM(qyDetApliva.IVA_X_PAG)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object Tot_IVAPAG_GT: TQRExpr
      Left = 487
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1288.52083333333
        7.9375
        158.75)
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
      Expression = 'SUM(qyDetApliva.IVA_PAGADO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object Tot_IVADEV_GT: TQRExpr
      Left = 397
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1050.39583333333
        7.9375
        158.75)
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
      Expression = 'SUM(qyDetApliva.IVA_DEVENGADO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object SummaryBand1: TQRBand
    Left = 48
    Top = 300
    Width = 720
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Enabled = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      39.6875
      1905)
    BandType = rbSummary
  end
  object QRGroupCredito: TQRGroup
    Left = 48
    Top = 198
    Width = 720
    Height = 4
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
      10.5833333333333
      1905)
    Expression = 'qyDetApliva.ID_CREDITO'
    FooterBand = QRFooterCredito
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel3: TQRLabel
      Left = 169
      Top = 2
      Width = 34
      Height = 11
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        447.145833333333
        5.29166666666667
        89.9583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Credito :'
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
    object QRDBText1: TQRDBText
      Left = 207
      Top = 3
      Width = 37
      Height = 11
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        547.6875
        7.9375
        97.8958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyDetApliva
      DataField = 'ID_CREDITO'
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
  end
  object QRGroupPeriodo: TQRGroup
    Left = 48
    Top = 202
    Width = 720
    Height = 4
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
      10.5833333333333
      1905)
    Expression = 'qyDetApliva.ID_PERIODO'
    FooterBand = QRFooterPeriodo
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRFooterPeriodo: TQRBand
    Left = 48
    Top = 216
    Width = 720
    Height = 15
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
      39.6875
      1905)
    BandType = rbGroupFooter
    object QRShape9: TQRShape
      Left = 370
      Top = 0
      Width = 280
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        13.2291666666667
        978.958333333333
        0
        740.833333333333)
      Shape = qrsHorLine
    end
    object QRExpr1: TQRExpr
      Left = 397
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1050.39583333333
        7.9375
        158.75)
      Alignment = taRightJustify
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyDetApliva.IVA_DEVENGADO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr2: TQRExpr
      Left = 487
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1288.52083333333
        7.9375
        158.75)
      Alignment = taRightJustify
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyDetApliva.IVA_PAGADO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr3: TQRExpr
      Left = 575
      Top = 3
      Width = 60
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1521.35416666667
        7.9375
        158.75)
      Alignment = taRightJustify
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
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyDetApliva.IVA_X_PAG)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRLabel5: TQRLabel
      Left = 225
      Top = 2
      Width = 61
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
        161.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total por Periodo:'
      Color = clWhite
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
    object QRExpr7: TQRExpr
      Left = 679
      Top = 3
      Width = 21
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1796.52083333333
        7.9375
        55.5625)
      Alignment = taRightJustify
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
      Transparent = True
      WordWrap = True
      Expression = 'IF(SUM(qyDetApliva.IVA_X_PAG) > 0,'#39'AC'#39','#39'LQ'#39')'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object QRFooterCredito: TQRBand
    Left = 48
    Top = 231
    Width = 720
    Height = 15
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
      39.6875
      1905)
    BandType = rbGroupFooter
    object QRShape10: TQRShape
      Left = 370
      Top = 0
      Width = 280
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        13.2291666666667
        978.958333333333
        0
        740.833333333333)
      Pen.Width = 2
      Shape = qrsHorLine
    end
    object QRExpr4: TQRExpr
      Left = 397
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1050.39583333333
        7.9375
        158.75)
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
      Expression = 'SUM(qyDetApliva.IVA_DEVENGADO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr5: TQRExpr
      Left = 487
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1288.52083333333
        7.9375
        158.75)
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
      Expression = 'SUM(qyDetApliva.IVA_PAGADO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr6: TQRExpr
      Left = 575
      Top = 3
      Width = 60
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1521.35416666667
        7.9375
        158.75)
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
      Expression = 'SUM(qyDetApliva.IVA_X_PAG)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel4: TQRLabel
      Left = 156
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
        412.75
        5.29166666666667
        179.916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total por Credito:'
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
  object qyDetApliva: TQuery
    DatabaseName = 'RCORP'
    SessionName = 'Default'
    SQL.Strings = (
      ''
      ''
      ''
      'SELECT '
      ' CON.CVE_MONEDA, MON.DESC_MONEDA, '
      
        ' PER.ID_PERSONA, PER.NOMBRE, (RFCE.SIGLAS_RFC || RFCE.F_RFC || R' +
        'FCE.HOMOCLAVE_RFC) AS CVERFC,'
      
        ' DECODE(TO_CHAR(PIVO.F_OPERACION,'#39'MON'#39'),'#39'JAN'#39','#39'ENE'#39','#39'APR'#39','#39'ABR'#39',' +
        ' '
      
        ' '#39'AUG'#39','#39'AGO'#39','#39'DEC'#39','#39'DIC'#39', TO_CHAR(PIVO.F_OPERACION,'#39'MON'#39') ) AS M' +
        'ESPER , '
      ' TO_CHAR(PIVO.F_OPERACION,'#39'YYYY'#39')  AS ANIOPER , '
      ' CCO.CVE_PRODUCTO_CRE AS CVE_PROD, CCR.ID_CONTRATO, '
      ' PIVO.ID_CREDITO, '
      
        ' PIVO.ID_PERIODO, PIVO.F_OPERACION, NVL(DEV.IVA_DEVENGADO,0) AS ' +
        'IVA_DEVENGADO, '
      
        ' NVL(PAG.IVA_PAGADO,0) AS IVA_PAGADO, NVL(DEV.IVA_DEVENGADO,0) -' +
        ' NVL(PAG.IVA_PAGADO,0) AS IVA_X_PAG, '
      ' SITU.SIT_IVA  '
      
        '  , (CI.F_VENCIMIENTO - 1) AS FIN_PERIODO, PIVO.CVE_OPERACION , ' +
        'LEAST( (CI.F_VENCIMIENTO - 1), PIVO.F_OPERACION) AS FK_FECHASDO,' +
        ' DECODE(PIVO.CVE_OPERACION ,'#39'IVDEPE'#39' ,SDO.IMP_INT_VIG,0 ) AS INT' +
        'ERES'
      ' FROM '
      ' (  SELECT ID_CREDITO,  ID_PERIODO , '
      '    F_OPERACION  '
      #9', CVE_OPERACION'
      #9' FROM CR_TRANSACCION  '
      '  '#9' WHERE CVE_OPERACION IN ('#39'IVDEPE'#39', '#39'PAGIDP'#39')  '
      
        ' '#9' AND F_OPERACION BETWEEN TO_DATE('#39'01/01/2010'#39','#39'DD/MM/YYYY'#39') AN' +
        'D TO_DATE('#39'30/06/2010'#39','#39'DD/MM/YYYY'#39')  '
      '    AND SIT_TRANSACCION = '#39'AC'#39'  '
      ' '#9' GROUP BY  ID_CREDITO,  ID_PERIODO , F_OPERACION  '
      #9' , CVE_OPERACION  '
      ' '#9' ORDER BY 1,2,3  '
      '   ) PIVO  '
      ' LEFT JOIN  '
      
        ' (  SELECT ID_CREDITO, ID_PERIODO, DECODE(SUM(DECODE(CVE_OPERACI' +
        'ON,'#39'PAGIDP'#39', IMP_NETO*(-1),IMP_NETO)),0,'#39'LQ'#39','#39'AC'#39') AS SIT_IVA '
      '  '#9' FROM CR_TRANSACCION  '
      '  '#9' WHERE CVE_OPERACION IN ('#39'IVDEPE'#39', '#39'PAGIDP'#39')  '
      
        ' '#9' AND F_OPERACION BETWEEN TO_DATE('#39'01/01/2010'#39','#39'DD/MM/YYYY'#39') AN' +
        'D TO_DATE('#39'30/06/2010'#39','#39'DD/MM/YYYY'#39')  '
      '    AND SIT_TRANSACCION = '#39'AC'#39'  '
      ' '#9' GROUP BY  ID_CREDITO,  ID_PERIODO  '
      #9'ORDER BY 1,2 '
      
        ' ) SITU  ON PIVO.ID_CREDITO    = SITU.ID_CREDITO    AND PIVO.ID_' +
        'PERIODO  = SITU.ID_PERIODO '
      '  LEFT JOIN  '
      ' (  SELECT ID_CREDITO, ID_PERIODO, '
      
        '    F_OPERACION, SUM(IMP_NETO) AS IVA_DEVENGADO FROM CR_TRANSACC' +
        'ION '
      '    WHERE 1=1 '
      '    AND CVE_OPERACION = '#39'IVDEPE'#39' '
      
        '    AND F_OPERACION BETWEEN TO_DATE('#39'01/01/2010'#39','#39'DD/MM/YYYY'#39') A' +
        'ND TO_DATE('#39'30/06/2010'#39','#39'DD/MM/YYYY'#39') '
      '    AND SIT_TRANSACCION = '#39'AC'#39' '
      '    GROUP BY   ID_CREDITO, ID_PERIODO, '
      '    F_OPERACION   '
      '    ORDER BY 1,2,3  '
      ' ) DEV '
      
        '   ON PIVO.ID_CREDITO    = DEV.ID_CREDITO    AND PIVO.ID_PERIODO' +
        '  = DEV.ID_PERIODO   '
      '  AND PIVO.F_OPERACION = DEV.F_OPERACION  '
      ' LEFT JOIN '
      ' (  SELECT ID_CREDITO, ID_PERIODO, '
      
        '    F_OPERACION, SUM(IMP_NETO) AS IVA_PAGADO FROM CR_TRANSACCION' +
        ' '
      '    WHERE 1=1 '
      '    AND CVE_OPERACION = '#39'PAGIDP'#39'  '
      
        '    AND F_OPERACION BETWEEN TO_DATE('#39'01/01/2010'#39','#39'DD/MM/YYYY'#39') A' +
        'ND TO_DATE('#39'30/06/2010'#39','#39'DD/MM/YYYY'#39') '
      '    AND SIT_TRANSACCION = '#39'AC'#39' '
      '    GROUP BY   ID_CREDITO, ID_PERIODO, '
      '    F_OPERACION '
      '    ORDER BY 1,2,3  '
      ' ) PAG '
      
        '  ON PIVO.ID_CREDITO    = PAG.ID_CREDITO    AND  PIVO.ID_PERIODO' +
        '  = PAG.ID_PERIODO  '
      ' AND  PIVO.F_OPERACION = PAG.F_OPERACION '
      ' LEFT JOIN CR_CREDITO CCR ON  PIVO.ID_CREDITO = CCR.ID_CREDITO '
      ' LEFT JOIN CR_CONTRATO CCO ON CCR.ID_CONTRATO = CCO.ID_CONTRATO '
      ' LEFT JOIN CONTRATO CON  ON CCR.ID_CONTRATO = CON.ID_CONTRATO '
      ' LEFT JOIN MONEDA  MON  ON CON.CVE_MONEDA = MON.CVE_MONEDA '
      
        ' LEFT JOIN PERSONA PER ON CON.ID_TITULAR = PER.ID_PERSONA AND PE' +
        'R.CVE_PER_JURIDICA = '#39'PF'#39' '
      ' LEFT JOIN RFC RFCE ON PER.ID_PERSONA = RFCE.ID_PERSONA'
      
        ' LEFT JOIN CR_INTERES CI ON PIVO.ID_CREDITO    = CI.ID_CREDITO A' +
        'ND PIVO.ID_PERIODO    = CI.NUM_PERIODO    '
      
        ' LEFT JOIN CR_CON_ADEUDO_SDO SDO ON  PIVO.ID_CREDITO  = SDO.ID_C' +
        'REDITO AND SDO.F_CIERRE = LEAST( (CI.F_VENCIMIENTO - 1), PIVO.F_' +
        'OPERACION)'
      ' WHERE 1= 1 '
      ' AND PIVO.ID_CREDITO = 282753 '
      ' UNION '
      '  SELECT '
      ' CON.CVE_MONEDA, MON.DESC_MONEDA, '
      
        ' PER.ID_PERSONA, PER.NOMBRE, (RFCE.SIGLAS_RFC || RFCE.F_RFC || R' +
        'FCE.HOMOCLAVE_RFC) AS CVERFC, '
      
        ' DECODE(TO_CHAR(PIVO.F_OPERACION,'#39'MON'#39'),'#39'JAN'#39','#39'ENE'#39','#39'APR'#39','#39'ABR'#39',' +
        ' '
      
        ' '#39'AUG'#39','#39'AGO'#39','#39'DEC'#39','#39'DIC'#39',TO_CHAR(PIVO.F_OPERACION,'#39'MON'#39') ) AS ME' +
        'SPER , '
      ' TO_CHAR(PIVO.F_OPERACION,'#39'YYYY'#39')  AS ANIOPER , '
      ' TO_CHAR(CCO.CVE_SUB_TIP_BCO) AS CVE_PROD, CCR.ID_CONTRATO, '
      ' PIVO.ID_CREDITO, '
      
        ' PIVO.ID_PERIODO, PIVO.F_OPERACION, NVL(DEV.IVA_DEVENGADO,0) AS ' +
        'IVA_DEVENGADO, '
      
        ' NVL(PAG.IVA_PAGADO,0) AS IVA_PAGADO, NVL(DEV.IVA_DEVENGADO,0) -' +
        ' NVL(PAG.IVA_PAGADO,0) AS IVA_X_PAG, '
      ' SITU.SIT_IVA   '
      
        '   , (CI.F_VENCIMIENTO - 1) AS FIN_PERIODO, PIVO.CVE_OPERACION ,' +
        ' LEAST((CI.F_VENCIMIENTO-1), PIVO.F_OPERACION) AS FK_FECHASDO, D' +
        'ECODE(PIVO.CVE_OPERACION ,'#39'IVDEPE'#39' ,SDO.IMP_INT_VIG,0 ) AS INTER' +
        'ES'
      ' FROM '
      ' ( SELECT ID_CREDITO,  NUM_PERIODO AS ID_PERIODO, '
      '   F_LIQUIDACION AS F_OPERACION  '
      '   , CVE_OPERACION'
      '    FROM CRE_TRANSACCION  '
      '  '#9'WHERE CVE_OPERACION IN ('#39'IVDEPE'#39', '#39'PAGIDP'#39')  '
      
        '  '#9'AND F_LIQUIDACION BETWEEN TO_DATE('#39'01/01/2010'#39','#39'DD/MM/YYYY'#39') ' +
        'AND TO_DATE('#39'30/06/2010'#39','#39'DD/MM/YYYY'#39')  '
      '      AND SIT_TRANSACCION = '#39'AC'#39' '
      '  '#9'GROUP BY  ID_CREDITO,  NUM_PERIODO ,   F_LIQUIDACION   '
      #9', CVE_OPERACION'
      '  ) PIVO  '
      ' LEFT JOIN '
      
        ' ( SELECT ID_CREDITO, NUM_PERIODO AS ID_PERIODO, DECODE(SUM(DECO' +
        'DE(CVE_OPERACION,'#39'PAGIDP'#39', IMP_OPERACION*(-1),IMP_OPERACION)),0,' +
        #39'LQ'#39','#39'AC'#39') AS SIT_IVA '
      '   FROM CRE_TRANSACCION '
      '  '#9'WHERE CVE_OPERACION IN ('#39'IVDEPE'#39', '#39'PAGIDP'#39')  '
      
        '  '#9'AND F_LIQUIDACION BETWEEN TO_DATE('#39'01/01/2010'#39','#39'DD/MM/YYYY'#39') ' +
        'AND TO_DATE('#39'30/06/2010'#39','#39'DD/MM/YYYY'#39')  '
      '   AND SIT_TRANSACCION = '#39'AC'#39' '
      '  '#9'GROUP BY  ID_CREDITO,  NUM_PERIODO '
      '  '#9'ORDER BY 1,2 '
      
        ' ) SITU  ON PIVO.ID_CREDITO    = SITU.ID_CREDITO    AND PIVO.ID_' +
        'PERIODO  = SITU.ID_PERIODO '
      ' LEFT JOIN '
      '  (  SELECT   ID_CREDITO, NUM_PERIODO AS ID_PERIODO, '
      
        '     F_LIQUIDACION AS F_OPERACION, SUM(IMP_OPERACION) AS IVA_DEV' +
        'ENGADO '
      '     FROM CRE_TRANSACCION '
      '     WHERE 1=1 '
      '     AND CVE_OPERACION = '#39'IVDEPE'#39' '
      
        '     AND F_LIQUIDACION BETWEEN TO_DATE('#39'01/01/2010'#39','#39'DD/MM/YYYY'#39 +
        ') AND TO_DATE('#39'30/06/2010'#39','#39'DD/MM/YYYY'#39') '
      '     AND SIT_TRANSACCION = '#39'AC'#39' '
      ' '#9'GROUP BY   ID_CREDITO, NUM_PERIODO, '
      '   F_LIQUIDACION '
      ' '#9') DEV '
      
        '    ON PIVO.ID_CREDITO    = DEV.ID_CREDITO    AND PIVO.ID_PERIOD' +
        'O  = DEV.ID_PERIODO  '
      '   AND PIVO.F_OPERACION = DEV.F_OPERACION '
      ' LEFT JOIN '
      ' (  SELECT   ID_CREDITO, NUM_PERIODO  AS ID_PERIODO , '
      
        '    F_LIQUIDACION AS F_OPERACION, SUM(IMP_OPERACION) AS IVA_PAGA' +
        'DO '
      '    FROM CRE_TRANSACCION '
      '    WHERE 1=1 '
      '    AND CVE_OPERACION = '#39'PAGIDP'#39' '
      
        '    AND F_LIQUIDACION BETWEEN TO_DATE('#39'01/01/2010'#39','#39'DD/MM/YYYY'#39')' +
        ' AND TO_DATE('#39'30/06/2010'#39','#39'DD/MM/YYYY'#39') '
      '    AND SIT_TRANSACCION = '#39'AC'#39' '
      '    GROUP BY ID_CREDITO, NUM_PERIODO , '
      '    F_LIQUIDACION '
      '    ) PAG '
      
        ' ON  PIVO.ID_CREDITO    = PAG.ID_CREDITO    AND PIVO.ID_PERIODO ' +
        ' = PAG.ID_PERIODO  '
      ' AND PIVO.F_OPERACION = PAG.F_OPERACION '
      
        '   LEFT JOIN  CRE_CREDITO CCR ON   PIVO.ID_CREDITO = CCR.ID_CRED' +
        'ITO '
      
        '   LEFT JOIN  CRE_CONTRATO CCO ON  CCR.ID_CONTRATO = CCO.ID_CONT' +
        'RATO '
      
        '   LEFT JOIN  CONTRATO CON  ON  CCR.ID_CONTRATO = CON.ID_CONTRAT' +
        'O '
      '   LEFT JOIN  MONEDA  MON  ON  CON.CVE_MONEDA = MON.CVE_MONEDA '
      
        '   LEFT JOIN  PERSONA PER ON CON.ID_TITULAR = PER.ID_PERSONA AND' +
        ' PER.CVE_PER_JURIDICA = '#39'PF'#39' '
      '   LEFT JOIN RFC RFCE ON PER.ID_PERSONA = RFCE.ID_PERSONA '
      
        ' LEFT JOIN CRE_INTERES CI ON PIVO.ID_CREDITO    = CI.ID_CREDITO ' +
        'AND PIVO.ID_PERIODO    = CI.NUM_PERIODO    '
      
        ' LEFT JOIN CR_CON_ADEUDO_SDO SDO ON  PIVO.ID_CREDITO  = SDO.ID_C' +
        'REDITO AND SDO.F_CIERRE = LEAST( (CI.F_VENCIMIENTO - 1), PIVO.F_' +
        'OPERACION)'
      '   WHERE 1=1 '
      ' AND PIVO.ID_CREDITO = 282753 '
      ' ORDER BY 1,3,10,11,12 '
      ''
      ' '
      ' ')
    Left = 141
    Top = 9
    object qyDetAplivaCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyDetAplivaDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyDetAplivaID_PERSONA: TFloatField
      FieldName = 'ID_PERSONA'
    end
    object qyDetAplivaNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qyDetAplivaCVERFC: TStringField
      FieldName = 'CVERFC'
      Size = 14
    end
    object qyDetAplivaMESPER: TStringField
      FieldName = 'MESPER'
      Size = 9
    end
    object qyDetAplivaANIOPER: TStringField
      FieldName = 'ANIOPER'
      Size = 4
    end
    object qyDetAplivaCVE_PROD: TStringField
      FieldName = 'CVE_PROD'
      Size = 40
    end
    object qyDetAplivaID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qyDetAplivaID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyDetAplivaID_PERIODO: TFloatField
      FieldName = 'ID_PERIODO'
    end
    object qyDetAplivaF_OPERACION: TDateTimeField
      FieldName = 'F_OPERACION'
    end
    object qyDetAplivaIVA_DEVENGADO: TFloatField
      FieldName = 'IVA_DEVENGADO'
    end
    object qyDetAplivaIVA_PAGADO: TFloatField
      FieldName = 'IVA_PAGADO'
    end
    object qyDetAplivaIVA_X_PAG: TFloatField
      FieldName = 'IVA_X_PAG'
    end
    object qyDetAplivaSIT_IVA: TStringField
      FieldName = 'SIT_IVA'
      Size = 2
    end
    object qyDetAplivaFIN_PERIODO: TDateTimeField
      FieldName = 'FIN_PERIODO'
    end
    object qyDetAplivaCVE_OPERACION: TStringField
      FieldName = 'CVE_OPERACION'
      Size = 6
    end
    object qyDetAplivaFK_FECHASDO: TDateTimeField
      FieldName = 'FK_FECHASDO'
    end
    object qyDetAplivaINTERES: TFloatField
      FieldName = 'INTERES'
    end
  end
end
