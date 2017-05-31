object QrRecPrem: TQrRecPrem
  Left = -630
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qyRecPremio
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
    Height = 82
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
      216.958333333333
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
        216.958333333333
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
    Top = 130
    Width = 960
    Height = 24
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
      63.5
      2540)
    BandType = rbColumnHeader
    object QRShape1: TQRShape
      Left = 490
      Top = 0
      Width = 77
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        1296.45833333333
        0
        203.729166666667)
      Shape = qrsRectangle
    end
    object QRShCredito: TQRShape
      Left = 0
      Top = 0
      Width = 54
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        0
        0
        142.875)
      Shape = qrsRectangle
    end
    object QRShCliente: TQRShape
      Left = 53
      Top = 0
      Width = 263
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        140.229166666667
        0
        695.854166666667)
      Shape = qrsRectangle
    end
    object QRLbCliente: TQRLabel
      Left = 54
      Top = 1
      Width = 261
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        142.875
        2.64583333333333
        690.5625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Cliente'
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
    object QRShFVto: TQRShape
      Left = 315
      Top = 0
      Width = 58
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        833.4375
        0
        153.458333333333)
      Shape = qrsRectangle
    end
    object QRLbFVto: TQRLabel
      Left = 316
      Top = 1
      Width = 57
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        836.083333333333
        2.64583333333333
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Vencimiento'
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
    object QRShDiasXVencer: TQRShape
      Left = 372
      Top = 0
      Width = 39
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        984.25
        0
        103.1875)
      Shape = qrsRectangle
    end
    object QRLbDiasXVencer: TQRLabel
      Left = 373
      Top = 1
      Width = 38
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        986.895833333333
        2.64583333333333
        100.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Días por Vencer'
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
    object QRShPremOriginal: TQRShape
      Left = 410
      Top = 0
      Width = 80
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        1084.79166666667
        0
        211.666666666667)
      Shape = qrsRectangle
    end
    object QRLbPremOriginal: TQRLabel
      Left = 411
      Top = 1
      Width = 79
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1087.4375
        2.64583333333333
        209.020833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Interés  Original'
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
    object QRShPremDevAnt: TQRShape
      Left = 641
      Top = 0
      Width = 80
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        1695.97916666667
        0
        211.666666666667)
      Shape = qrsRectangle
    end
    object QRLbPremDevAnt: TQRLabel
      Left = 642
      Top = 1
      Width = 79
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1698.625
        2.64583333333333
        209.020833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Interés por Devengar Anterior'
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
    object QRShPremDia: TQRShape
      Left = 721
      Top = 0
      Width = 80
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        1907.64583333333
        0
        211.666666666667)
      Shape = qrsRectangle
    end
    object QRLbPremiodia: TQRLabel
      Left = 722
      Top = 1
      Width = 79
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1910.29166666667
        2.64583333333333
        209.020833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Interés del día'
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
    object QRShPremDEvengado: TQRShape
      Left = 800
      Top = 0
      Width = 80
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        2116.66666666667
        0
        211.666666666667)
      Shape = qrsRectangle
    end
    object QRLbPremioDevengado: TQRLabel
      Left = 801
      Top = 1
      Width = 79
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2119.3125
        2.64583333333333
        209.020833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Interés Devengado'
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
    object QRShPremDevengar: TQRShape
      Left = 879
      Top = 0
      Width = 80
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        2325.6875
        0
        211.666666666667)
      Shape = qrsRectangle
    end
    object QRLbPRemioDevengar: TQRLabel
      Left = 880
      Top = 1
      Width = 78
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2328.33333333333
        2.64583333333333
        206.375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Interés por Devengar'
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
    object QRLbCredito: TQRLabel
      Left = 1
      Top = 1
      Width = 52
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2.64583333333333
        2.64583333333333
        137.583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Crédito'
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
    object QRLabel1: TQRLabel
      Left = 491
      Top = 1
      Width = 75
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1299.10416666667
        2.64583333333333
        198.4375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Interés Devuelto Acumulado'
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
    object QRShape3: TQRShape
      Left = 565
      Top = 0
      Width = 77
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        1494.89583333333
        0
        203.729166666667)
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Left = 565
      Top = 1
      Width = 76
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1494.89583333333
        2.64583333333333
        201.083333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Interés Devuelto del Día'
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
  object QRGroupMoneda: TQRGroup
    Left = 48
    Top = 154
    Width = 960
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
      2540)
    Expression = 'qyRecPremio.CVE_MONEDA'
    FooterBand = PageFooterBMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRShMoneda: TQRShape
      Left = 0
      Top = -1
      Width = 403
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        0
        -2.64583333333333
        1066.27083333333)
      Shape = qrsRectangle
    end
    object QRDBTCveMoneda: TQRDBText
      Left = 36
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
        95.25
        2.64583333333333
        92.6041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRecPremio
      DataField = 'CVE_MONEDA'
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
    object qrlbMoneda: TQRLabel
      Left = 2
      Top = 1
      Width = 31
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        5.29166666666667
        2.64583333333333
        82.0208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
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
    object QRDBTDEsc_Moneda: TQRDBText
      Left = 74
      Top = 1
      Width = 62
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        195.791666666667
        2.64583333333333
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyRecPremio
      DataField = 'DESC_MONEDA'
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
  object QRGroupProducto: TQRGroup
    Left = 48
    Top = 166
    Width = 960
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
      2540)
    Expression = 'qyRecPremio.CVE_PRODUCTO_CRE'
    FooterBand = PageFooterBProducto
    Master = Owner
    ReprintOnNewPage = False
    object QRShProducto: TQRShape
      Left = 40
      Top = 0
      Width = 918
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        105.833333333333
        0
        2428.875)
      Shape = qrsRectangle
    end
    object QRLProducto: TQRLabel
      Left = 48
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
        127
        2.64583333333333
        95.25)
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
    object dbProducto: TQRDBText
      Left = 87
      Top = 1
      Width = 54
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        230.1875
        2.64583333333333
        142.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRecPremio
      DataField = 'CVE_PRODUCTO_CRE'
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
    object dbDesc_Producto: TQRDBText
      Left = 143
      Top = 1
      Width = 83
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        378.354166666667
        2.64583333333333
        219.604166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyRecPremio
      DataField = 'DESC_C_PRODUCTO'
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
    object QRDBText34: TQRDBText
      Left = 875
      Top = 2
      Width = 81
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2315.10416666667
        5.29166666666667
        214.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRecPremio
      DataField = 'CUENTA_VIGENTE_INT'
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
  object QRBDetails: TQRBand
    Left = 48
    Top = 181
    Width = 960
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
      2540)
    BandType = rbDetail
    object dbID_CREDITO: TQRDBText
      Left = 2
      Top = 0
      Width = 49
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        5.29166666666667
        0
        129.645833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRecPremio
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
    object dbCLIENTE: TQRExpr
      Left = 56
      Top = 0
      Width = 253
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        148.166666666667
        0
        669.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 
        'IF(CVE_PER_JURIDICA = '#39'PM'#39',qyRecPremio.NOMBRE,qyRecPremio.NOMBRE' +
        '_PF)'
      FontSize = 5
    end
    object dbF_VTO: TQRDBText
      Left = 311
      Top = 0
      Width = 54
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        822.854166666667
        0
        142.875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRecPremio
      DataField = 'F_VENCIMIENTO'
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
    object dbPREMIO_ORIGINAL: TQRDBText
      Left = 415
      Top = 0
      Width = 74
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1098.02083333333
        0
        195.791666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRecPremio
      DataField = 'IMP_PREMIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object dbPREMIO_DIA: TQRDBText
      Left = 726
      Top = 0
      Width = 74
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1920.875
        0
        195.791666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRecPremio
      DataField = 'IMP_INTERES_DIA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object dbPremDevengar: TQRDBText
      Left = 885
      Top = 0
      Width = 74
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2341.5625
        0
        195.791666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRecPremio
      DataField = 'IMP_X_DEVENGAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object dbDIAS_X_VENCER: TQRDBText
      Left = 367
      Top = 0
      Width = 40
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        971.020833333333
        0
        105.833333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRecPremio
      DataField = 'DIAS_X_VENCER'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###0'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRDBText1: TQRDBText
      Left = 647
      Top = 0
      Width = 74
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1711.85416666667
        0
        195.791666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRecPremio
      DataField = 'IMP_X_DEV_ANT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText2: TQRDBText
      Left = 806
      Top = 0
      Width = 74
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2132.54166666667
        0
        195.791666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRecPremio
      DataField = 'IMP_PREM_DEV'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText3: TQRDBText
      Left = 494
      Top = 0
      Width = 74
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1307.04166666667
        0
        195.791666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRecPremio
      DataField = 'IMP_INT_DEV'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText4: TQRDBText
      Left = 570
      Top = 0
      Width = 74
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1508.125
        0
        195.791666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRecPremio
      DataField = 'IMP_INT_DEV_DIA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object PageFooterBMoneda: TQRBand
    Left = 48
    Top = 209
    Width = 960
    Height = 24
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
      63.5
      2540)
    BandType = rbGroupFooter
    object QRShLinea: TQRShape
      Left = 400
      Top = 1
      Width = 565
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        1058.33333333333
        2.64583333333333
        1494.89583333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRExPremDevengarMon: TQRExpr
      Left = 881
      Top = 5
      Width = 78
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2330.97916666667
        13.2291666666667
        206.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyRecPremio.IMP_X_DEVENGAR)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExPremDevMon: TQRExpr
      Left = 802
      Top = 5
      Width = 78
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2121.95833333333
        13.2291666666667
        206.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyRecPremio.IMP_PREM_DEV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExSumPremDiaMon: TQRExpr
      Left = 722
      Top = 5
      Width = 78
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1910.29166666667
        13.2291666666667
        206.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyRecPremio.IMP_INTERES_DIA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExSumPremDevAntMon: TQRExpr
      Left = 643
      Top = 5
      Width = 78
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1701.27083333333
        13.2291666666667
        206.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyRecPremio.IMP_X_DEV_ANT)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExSumPremioMon: TQRExpr
      Left = 411
      Top = 5
      Width = 78
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1087.4375
        13.2291666666667
        206.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyRecPremio.IMP_PREMIO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLbPorMoneda: TQRLabel
      Left = 26
      Top = 5
      Width = 40
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        68.7916666666667
        13.2291666666667
        105.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Por Moneda'
      Color = clSilver
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
    object QExpCountMoneda: TQRExpr
      Left = 75
      Top = 5
      Width = 86
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        198.4375
        13.2291666666667
        227.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Color = clSilver
      Master = Owner
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'COUNT'
      Mask = '#####0'
      FontSize = 5
    end
    object QRExpr3: TQRExpr
      Left = 490
      Top = 5
      Width = 78
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
        206.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyRecPremio.IMP_INT_DEV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr5: TQRExpr
      Left = 567
      Top = 5
      Width = 76
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1500.1875
        13.2291666666667
        201.083333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyRecPremio.IMP_INT_DEV_DIA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object PageFooterBProducto: TQRBand
    Left = 48
    Top = 192
    Width = 960
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
      2540)
    BandType = rbGroupFooter
    object QRLbPorProducto: TQRLabel
      Left = 42
      Top = 5
      Width = 43
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        111.125
        13.2291666666667
        113.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Por Persona'
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
    object QRExPremDevProd: TQRExpr
      Left = 802
      Top = 4
      Width = 78
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2121.95833333333
        10.5833333333333
        206.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRecPremio.IMP_PREM_DEV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExSumPremDiaProd: TQRExpr
      Left = 722
      Top = 4
      Width = 78
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1910.29166666667
        10.5833333333333
        206.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRecPremio.IMP_INTERES_DIA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExSumPremDevAntProd: TQRExpr
      Left = 643
      Top = 4
      Width = 78
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1701.27083333333
        10.5833333333333
        206.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRecPremio.IMP_X_DEV_ANT)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExSumPremioProd: TQRExpr
      Left = 411
      Top = 4
      Width = 78
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1087.4375
        10.5833333333333
        206.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRecPremio.IMP_PREMIO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExPremDevengarProd: TQRExpr
      Left = 881
      Top = 4
      Width = 78
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2330.97916666667
        10.5833333333333
        206.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRecPremio.IMP_X_DEVENGAR)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr2: TQRExpr
      Left = 91
      Top = 5
      Width = 86
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        240.770833333333
        13.2291666666667
        227.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      Master = Owner
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'COUNT'
      Mask = '#####0'
      FontSize = 5
    end
    object QRExpr1: TQRExpr
      Left = 490
      Top = 4
      Width = 78
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1296.45833333333
        10.5833333333333
        206.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRecPremio.IMP_INT_DEV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRShape2: TQRShape
      Left = 400
      Top = 2
      Width = 558
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        1058.33333333333
        5.29166666666667
        1476.375)
      Shape = qrsRectangle
    end
    object QRExpr4: TQRExpr
      Left = 567
      Top = 4
      Width = 76
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1500.1875
        10.5833333333333
        201.083333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRecPremio.IMP_INT_DEV_DIA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object qyRecPremio: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'SELECT P.CVE_PER_JURIDICA,'
      '       P.NOMBRE,'
      
        '       PF.APELLIDO_PATERNO|| '#39' '#39'||PF.APELLIDO_MATERNO||'#39' '#39'||PF.N' +
        'OMBRE_PERSONA NOMBRE_PF,'
      '       M.CVE_MONEDA,'
      '       M.DESC_MONEDA,'
      '       CP.CVE_PRODUCTO_CRE,'
      '       CP.DESC_C_PRODUCTO,'
      '       CR.ID_CREDITO,'
      '       CR.CVE_CALCULO,'
      
        '       CR.F_AUTORIZA + PKGCRPERIODO.ObtPlazoMax(CR.ID_CREDITO) F' +
        '_VENCIMIENTO,'
      '       PKGCRPERIODO.ObtPlazoMax(CR.ID_CREDITO) AS PLAZO,'
      '       CR.F_AUTORIZA,'
      '       0 IMP_INT_DEV,'
      
        '       NVL((CR.F_AUTORIZA + PKGCRPERIODO.ObtPlazoMax(CR.ID_CREDI' +
        'TO))-CHC.F_CIERRE,0)-1 DIAS_X_VENCER,'
      '       CR.TIPO_DISPOSICION,'
      
        '       NVL(PKGCRPERIODO.StpObtImpPremio(CS.ID_CESION),0) IMP_PRE' +
        'MIO,'
      
        '       PKGCRPERIODO.StpObtImpXDevAnterior(CHC.ID_CREDITO,CHC.F_C' +
        'IERRE) IMP_X_DEV_ANT,'
      '       CHC.IMP_INTERES_DIA,'
      
        '       (NVL(PKGCRPERIODO.StpObtImpPremio(CS.ID_CESION),0) - PKGC' +
        'RPERIODO.StpObtImpXDevengar(CHC.ID_CREDITO,CHC.F_CIERRE)) IMP_PR' +
        'EM_DEV,'
      
        '       NVL(PKGCRPERIODO.StpObtImpXDevengar(CHC.ID_CREDITO,CHC.F_' +
        'CIERRE),0)  IMP_X_DEVENGAR'
      'FROM   PERSONA P,'
      '       CONTRATO CTO,'
      '       PERSONA_FISICA PF,'
      '       MONEDA M,'
      '       CR_CONTRATO CCTO,'
      '       CR_PRODUCTO CP,'
      '       CR_CREDITO CR,'
      '       CR_CESION CS,'
      '       CR_HISTO_CRED CHC,'
      '       ( SELECT SUM(CDHC.IMP_INTERES) IMP_PRE_INTERES'
      '         FROM CR_DET_HIST_CR CDHC,'
      '              CR_HISTO_CRED CHC'
      '         WHERE  CDHC.ID_CREDITO = CHC.ID_CREDITO'
      '         AND      CDHC.F_CIERRE = CHC.F_CIERRE         )CHDC'
      'WHERE  P.ID_PERSONA = CTO.ID_TITULAR'
      'AND         P.ID_PERSONA = PF.ID_PERSONA (+)'
      'AND         CTO.CVE_MONEDA   = M.CVE_MONEDA'
      'AND         CTO.ID_CONTRATO  = CCTO.ID_CONTRATO'
      'AND         CP.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE'
      'AND         CCTO.ID_CONTRATO  = CR.ID_CONTRATO'
      'AND         CCTO.FOL_CONTRATO = CR.FOL_CONTRATO'
      'AND         CR.ID_CREDITO = CS.ID_CESION'
      'AND         CR.ID_CREDITO = CHC.ID_CREDITO'
      'AND         CHC.IMP_INTERES_DIA > 0'
      
        'ORDER BY M.CVE_MONEDA,CP.CVE_PRODUCTO_CRE,P.NOMBRE,CHC.ID_CREDIT' +
        'O')
    Left = 280
    Top = 16
    object qyRecPremioCVE_PER_JURIDICA: TStringField
      FieldName = 'CVE_PER_JURIDICA'
      Size = 2
    end
    object qyRecPremioNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qyRecPremioNOMBRE_PF: TStringField
      FieldName = 'NOMBRE_PF'
      Size = 62
    end
    object qyRecPremioCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyRecPremioCUENTA_VIGENTE_INT: TStringField
      FieldName = 'CUENTA_VIGENTE_INT'
    end
    object qyRecPremioDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyRecPremioCVE_PRODUCTO_CRE: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 6
    end
    object qyRecPremioDESC_C_PRODUCTO: TStringField
      FieldName = 'DESC_C_PRODUCTO'
      Size = 30
    end
    object qyRecPremioID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyRecPremioCVE_CALCULO: TStringField
      FieldName = 'CVE_CALCULO'
      Size = 2
    end
    object qyRecPremioF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qyRecPremioPLAZO: TFloatField
      FieldName = 'PLAZO'
    end
    object qyRecPremioF_AUTORIZA: TDateTimeField
      FieldName = 'F_AUTORIZA'
    end
    object qyRecPremioDIAS_X_VENCER: TFloatField
      FieldName = 'DIAS_X_VENCER'
    end
    object qyRecPremioTIPO_DISPOSICION: TStringField
      FieldName = 'TIPO_DISPOSICION'
      Size = 2
    end
    object qyRecPremioIMP_PREMIO: TFloatField
      FieldName = 'IMP_PREMIO'
    end
    object qyRecPremioIMP_X_DEV_ANT: TFloatField
      FieldName = 'IMP_X_DEV_ANT'
    end
    object qyRecPremioIMP_INTERES_DIA: TFloatField
      FieldName = 'IMP_INTERES_DIA'
    end
    object qyRecPremioIMP_PREM_DEV: TFloatField
      FieldName = 'IMP_PREM_DEV'
    end
    object qyRecPremioIMP_X_DEVENGAR: TFloatField
      FieldName = 'IMP_X_DEVENGAR'
    end
    object qyRecPremioIMP_INT_DEV: TFloatField
      FieldName = 'IMP_INT_DEV'
    end
    object qyRecPremioIMP_INT_DEV_DIA: TFloatField
      FieldName = 'IMP_INT_DEV_DIA'
    end
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 336
    Top = 16
  end
  object InterDigDoc1: TInterDigDoc
    Support = 'star@mail.internet.com.mx'
    HostName = 'localhost'
    UserName = 'guest'
    Password = 'anonymous@mail.com.net'
    Viewfile = False
    SendTo = '/'
    DelAfterSend = False
    PgOrientation = ort_portrait
    CompFileExt = zip
    Left = 72
    Top = 16
  end
end
