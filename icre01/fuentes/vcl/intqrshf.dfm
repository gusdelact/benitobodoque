object QrSHF: TQrSHF
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qyConsulta
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
    127
    2794
    127
    2159
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
    Width = 720
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
      1905)
    BandType = rbPageHeader
    object QRInterEncabezado1: TQRInterEncabezado
      Left = 0
      Top = 0
      Width = 720
      Height = 84
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        222.25
        0
        0
        1905)
      NomReporte = 'RepFideCtoMod'
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
  object qrTITLE2: TQRBand
    Left = 48
    Top = 132
    Width = 720
    Height = 30
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clSilver
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      79.375
      1905)
    BandType = rbTitle
    object qrlblID_CREDITO: TQRLabel
      Left = 97
      Top = 4
      Width = 74
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        256.645833333333
        10.5833333333333
        195.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'No. Disposición'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrlblIMP_CREDITO: TQRLabel
      Left = 180
      Top = 4
      Width = 58
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        476.25
        10.5833333333333
        153.458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Imp. Crédito'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrlblCVE_OPERATIVA: TQRLabel
      Left = 323
      Top = 1
      Width = 67
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        854.604166666667
        2.64583333333333
        177.270833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cve. Operativa'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrlblID_CONTRATO: TQRLabel
      Left = 10
      Top = 4
      Width = 76
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        26.4583333333333
        10.5833333333333
        201.083333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'No. Autorización'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel2: TQRLabel
      Left = 249
      Top = 3
      Width = 68
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        658.8125
        7.9375
        179.916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Saldo Insoluto'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrlblPCT_GTIA_FEGA_EF: TQRLabel
      Left = 545
      Top = 2
      Width = 64
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1441.97916666667
        5.29166666666667
        169.333333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Porcentaje Garantizado'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrlblIMP_GARANTIZADO: TQRLabel
      Left = 634
      Top = 3
      Width = 64
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1677.45833333333
        7.9375
        169.333333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe Garantizado'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrlblOPERATIVA: TQRLabel
      Left = 394
      Top = 1
      Width = 134
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1042.45833333333
        2.64583333333333
        354.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Operativa'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object qrDETAIL: TQRBand
    Left = 48
    Top = 224
    Width = 720
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrDETAILAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      29.1041666666667
      1905)
    BandType = rbDetail
    object qrdbID_CONTRATO: TQRDBText
      Left = 12
      Top = 1
      Width = 73
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
        193.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'ID_CONTRATO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbID_CREDITO: TQRDBText
      Left = 92
      Top = 1
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        243.416666666667
        2.64583333333333
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'ID_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbIMP_CREDITO: TQRDBText
      Left = 170
      Top = 1
      Width = 69
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        449.791666666667
        2.64583333333333
        182.5625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbSDO_VIG_TOTAL: TQRDBText
      Left = 250
      Top = 1
      Width = 69
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        661.458333333333
        2.64583333333333
        182.5625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'SDO_VIG_TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbCVE_OPERATIVA: TQRDBText
      Left = 327
      Top = 0
      Width = 69
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        865.1875
        0
        182.5625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'CVE_OPERATIVA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbDESC_OPERATIVA: TQRDBText
      Left = 406
      Top = 1
      Width = 121
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1074.20833333333
        2.64583333333333
        320.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_OPERATIVA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbPCT_GTIA_FEGA_EF: TQRDBText
      Left = 541
      Top = 1
      Width = 69
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1431.39583333333
        2.64583333333333
        182.5625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'PCT_GTIA_FEGA_EF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrdbIMP_GARANTIZADO: TQRDBText
      Left = 630
      Top = 1
      Width = 69
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1666.875
        2.64583333333333
        182.5625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_GARANTIZADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object qrgpoCVE_MONEDA: TQRGroup
    Left = 48
    Top = 162
    Width = 720
    Height = 16
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
      42.3333333333333
      1905)
    Expression = 'qyConsulta.CVE_MONEDA'
    FooterBand = qrgpofootCVE_MONEDA
    Master = Owner
    ReprintOnNewPage = False
    object qrshpMoneda: TQRShape
      Left = 6
      Top = 0
      Width = 690
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        15.875
        0
        1825.625)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object qrlblCVE_MONEDA: TQRLabel
      Left = 7
      Top = 0
      Width = 39
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        18.5208333333333
        0
        103.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda:'
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
    object qrdbCVE_MONEDA: TQRDBText
      Left = 53
      Top = 1
      Width = 49
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        140.229166666667
        2.64583333333333
        129.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clBlack
      DataSet = qyConsulta
      DataField = 'CVE_MONEDA'
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
    object QRDBText1: TQRDBText
      Left = 107
      Top = 1
      Width = 71
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        283.104166666667
        2.64583333333333
        187.854166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clBlack
      DataSet = qyConsulta
      DataField = 'DESC_MONEDA'
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
  end
  object qrGpoCVE_PRODUCTO_GPO: TQRGroup
    Left = 48
    Top = 178
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
    Expression = 'qyConsulta.CVE_PRODUCTO_GPO'
    FooterBand = qrgpofootCVE_PRODUCTO_GPO
    Master = Owner
    ReprintOnNewPage = False
    object qrshpCVE_PRODUCTO_GPO: TQRShape
      Left = 16
      Top = 1
      Width = 680
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        42.3333333333333
        2.64583333333333
        1799.16666666667)
      Brush.Color = clGray
      Shape = qrsRectangle
    end
    object QRlblCVE_PRODUCTO_GPO: TQRLabel
      Left = 17
      Top = 1
      Width = 92
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        44.9791666666667
        2.64583333333333
        243.416666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Grupo de Producto:'
      Color = clGray
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
    object qrdbDESC_L_PROD_GPO: TQRDBText
      Left = 169
      Top = 1
      Width = 95
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        447.145833333333
        2.64583333333333
        251.354166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clGray
      DataSet = qyConsulta
      DataField = 'DESC_L_PROD_GPO'
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
    object qrdbCVE_PRODUCTO_GPO: TQRDBText
      Left = 113
      Top = 1
      Width = 48
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        298.979166666667
        2.64583333333333
        127)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clGray
      DataSet = qyConsulta
      DataField = 'CVE_PRODUCTO_GPO'
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
  end
  object qrgpoCVE_PRODUCTO_CRE: TQRGroup
    Left = 48
    Top = 193
    Width = 720
    Height = 16
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
      42.3333333333333
      1905)
    Expression = 'qyConsulta.CVE_PRODUCTO_CRE'
    FooterBand = qrgpofootCVE_PRODUCTO_CRE
    Master = Owner
    ReprintOnNewPage = False
    object qrshpCVE_PRODUCTO_CRE: TQRShape
      Left = 31
      Top = 1
      Width = 666
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        82.0208333333333
        2.64583333333333
        1762.125)
      Shape = qrsRectangle
    end
    object qrlblCVE_PRODUCTO_CRE: TQRLabel
      Left = 32
      Top = 2
      Width = 46
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        84.6666666666667
        5.29166666666667
        121.708333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Producto:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrdbDESC_L_PRODUCTO: TQRDBText
      Left = 142
      Top = 2
      Width = 96
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        375.708333333333
        5.29166666666667
        254)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_L_PRODUCTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrdbCVE_PRODUCTO_CRE: TQRDBText
      Left = 82
      Top = 2
      Width = 52
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        216.958333333333
        5.29166666666667
        137.583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'CVE_PRODUCTO_CRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object qrgpoID_ACREDITADO: TQRGroup
    Left = 48
    Top = 209
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
    Expression = 'qyConsulta.ID_ACREDITADO'
    FooterBand = qrgpofootID_ACREDITADO
    Master = Owner
    ReprintOnNewPage = False
    object qrshpID_ACREDITADO: TQRShape
      Left = 41
      Top = 1
      Width = 656
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        108.479166666667
        2.64583333333333
        1735.66666666667)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object qrlblID_ACREDITADO: TQRLabel
      Left = 39
      Top = 1
      Width = 52
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        103.1875
        2.64583333333333
        137.583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Acreditado:'
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
    object qrdbNOMBRE: TQRDBText
      Left = 156
      Top = 1
      Width = 42
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        412.75
        2.64583333333333
        111.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clBlack
      DataSet = qyConsulta
      DataField = 'NOMBRE'
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
    object qrdbID_PERSONA: TQRDBText
      Left = 97
      Top = 1
      Width = 51
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        256.645833333333
        2.64583333333333
        134.9375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clBlack
      DataSet = qyConsulta
      DataField = 'ID_PERSONA'
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
  end
  object qrgpofootCVE_MONEDA: TQRBand
    Left = 48
    Top = 283
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
    object qrshpMoneda2: TQRShape
      Left = 8
      Top = -1
      Width = 691
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        21.1666666666667
        -2.64583333333333
        1828.27083333333)
      Brush.Color = clBlack
      Pen.Color = clWhite
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 7
      Top = 0
      Width = 26
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        18.5208333333333
        0
        68.7916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total:'
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
    object qrdbDESC_MONEDA2: TQRDBText
      Left = 37
      Top = 0
      Width = 136
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        97.8958333333333
        0
        359.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clBlack
      DataSet = qyConsulta
      DataField = 'DESC_MONEDA'
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
    object qrexprIMP_CREDITO4: TQRExpr
      Left = 173
      Top = 1
      Width = 68
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        457.729166666667
        2.64583333333333
        179.916666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_CREDITO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object qrExpSDO_VIG_TOTAL4: TQRExpr
      Left = 253
      Top = 1
      Width = 68
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        669.395833333333
        2.64583333333333
        179.916666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.SDO_VIG_TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object qrexprIMP_GARANTIZADO4: TQRExpr
      Left = 629
      Top = 1
      Width = 68
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1664.22916666667
        2.64583333333333
        179.916666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_GARANTIZADO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
  end
  object qrgpofootCVE_PRODUCTO_GPO: TQRBand
    Left = 48
    Top = 268
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
    object qrshpCVE_PRODUCTO_GPO2: TQRShape
      Left = 16
      Top = 1
      Width = 682
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        42.3333333333333
        2.64583333333333
        1804.45833333333)
      Brush.Color = clGray
      Shape = qrsRectangle
    end
    object QRlblCVE_PRODUCTO_GPO2: TQRLabel
      Left = 15
      Top = 1
      Width = 26
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        39.6875
        2.64583333333333
        68.7916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total:'
      Color = clGray
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
    object qrdbDESC_L_PROD_GPO2: TQRDBText
      Left = 44
      Top = 1
      Width = 127
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        116.416666666667
        2.64583333333333
        336.020833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clGray
      DataSet = qyConsulta
      DataField = 'DESC_L_PROD_GPO'
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
    object qrexprIMP_CREDITO3: TQRExpr
      Left = 173
      Top = 1
      Width = 68
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        457.729166666667
        2.64583333333333
        179.916666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clGray
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_CREDITO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object qrExpSDO_VIG_TOTAL3: TQRExpr
      Left = 253
      Top = 1
      Width = 68
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        669.395833333333
        2.64583333333333
        179.916666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clGray
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.SDO_VIG_TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object qrexprIMP_GARANTIZADO3: TQRExpr
      Left = 629
      Top = 1
      Width = 68
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1664.22916666667
        2.64583333333333
        179.916666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clGray
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_GARANTIZADO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
  end
  object qrgpofootCVE_PRODUCTO_CRE: TQRBand
    Left = 48
    Top = 251
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
    object qrshpCVE_PRODUCTO_CRE2: TQRShape
      Left = 30
      Top = 0
      Width = 668
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        79.375
        0
        1767.41666666667)
      Shape = qrsRectangle
    end
    object qrlblCVE_PRODUCTO_CRE2: TQRLabel
      Left = 28
      Top = 1
      Width = 26
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        74.0833333333333
        2.64583333333333
        68.7916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrdbDESC_L_PRODUCTO2: TQRDBText
      Left = 57
      Top = 1
      Width = 114
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        150.8125
        2.64583333333333
        301.625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_L_PRODUCTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrexprIMP_CREDITO2: TQRExpr
      Left = 173
      Top = 1
      Width = 68
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        457.729166666667
        2.64583333333333
        179.916666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_CREDITO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object qrExpSDO_VIG_TOTAL2: TQRExpr
      Left = 253
      Top = 1
      Width = 68
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        669.395833333333
        2.64583333333333
        179.916666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.SDO_VIG_TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object qrexprIMP_GARANTIZADO2: TQRExpr
      Left = 629
      Top = 1
      Width = 68
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1664.22916666667
        2.64583333333333
        179.916666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_GARANTIZADO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
  end
  object qrgpofootID_ACREDITADO: TQRBand
    Left = 48
    Top = 235
    Width = 720
    Height = 16
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
      42.3333333333333
      1905)
    BandType = rbGroupFooter
    object qrshpID_ACREDITADO2: TQRShape
      Left = 41
      Top = 2
      Width = 640
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        108.479166666667
        5.29166666666667
        1693.33333333333)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object qrlblID_ACREDITADO2: TQRLabel
      Left = 40
      Top = 1
      Width = 26
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        105.833333333333
        2.64583333333333
        68.7916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total:'
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
    object qrdbNOMBRE2: TQRDBText
      Left = 68
      Top = 2
      Width = 105
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        179.916666666667
        5.29166666666667
        277.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clBlack
      DataSet = qyConsulta
      DataField = 'NOMBRE'
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
    object qrexprIMP_CREDITO1: TQRExpr
      Left = 173
      Top = 2
      Width = 68
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        457.729166666667
        5.29166666666667
        179.916666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_CREDITO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object qrExpSDO_VIG_TOTAL1: TQRExpr
      Left = 253
      Top = 2
      Width = 68
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        669.395833333333
        5.29166666666667
        179.916666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.SDO_VIG_TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object qrexprIMP_GARANTIZADO1: TQRExpr
      Left = 629
      Top = 2
      Width = 68
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1664.22916666667
        5.29166666666667
        179.916666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_GARANTIZADO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
  end
  object qyConsulta: TQuery
    SQL.Strings = (
      '  SELECT'
      '       CP.CVE_PRODUCTO_CRE,'
      '       CP.DESC_L_PRODUCTO,'
      '       CP.CVE_PRODUCTO_GPO,'
      '       CPG.DESC_L_PROD_GPO,'
      '       M.CVE_MONEDA,'
      '       M.DESC_MONEDA,'
      '       P.ID_PERSONA,'
      '       P.NOMBRE,'
      '       CC.ID_CREDITO,'
      '       CC.IMP_CREDITO,'
      '       CC.SDO_VIG_TOTAL,'
      '       OPERATIVA2.*,'
      '       CC.SIT_CREDITO,'
      
        '       ROUND(OPERATIVA2.PCT_GTIA_FEGA_EF * CC.SDO_VIG_TOTAL / 10' +
        '0, 2) AS IMP_GARANTIZADO'
      '  FROM (  -- Obtiene No. autorizaciones con operativas vigentes'
      '          SELECT CGFC.ID_CONTRATO,'
      '                 CGFC.CVE_OPERATIVA,'
      '                 OPERATIVA.DESC_OPERATIVA,'
      '                 OPERATIVA.PCT_GTIA_FEGA_EF'
      '          FROM CR_GA_FIRA_CTO CGFC,'
      '               ( SELECT CFO.CVE_OPERATIVA,  '
      '                        CFO.DESC_OPERATIVA,'
      '                        CFE.PCT_GTIA_LIQ,'
      '                        CFE.PCT_GTIA_FEGA_EF,'
      '                        CFE.PCT_GTIA_FEGA_NO'
      '                 FROM  ( SELECT CVE_OPERATIVA, DESC_OPERATIVA'
      '                         FROM CR_FIRA_OPERA'
      '                         WHERE CVE_OPERATIVA LIKE '#39'GPO%'#39
      '                       ) CFO,'
      '                       CR_FIRA_EQUIV CFE'
      '                 WHERE CFE.CVE_OPERATIVA = CFO.CVE_OPERATIVA'
      '               ) OPERATIVA'
      '         WHERE CGFC.CVE_OPERATIVA = OPERATIVA.CVE_OPERATIVA'
      '           AND CGFC.SIT_GA_FIRA = '#39'AC'#39
      '     )  OPERATIVA2,'
      '     (  -- Si la fecha solicitada es del día de hoy, entonces...'
      
        '        SELECT CC.ID_CREDITO, CC.SIT_CREDITO, CC.ID_CONTRATO, CC' +
        '.IMP_CREDITO, CC.SDO_VIG_TOTAL '
      '        FROM CR_CREDITO CC'
      
        '        WHERE TO_DATE('#39'14/04/2008'#39','#39'DD/MM/YYYY'#39') = TO_DATE('#39'14/0' +
        '4/2008'#39','#39'DD/MM/YYYY'#39') -- pF_OPERACION'
      '      UNION ALL'
      
        '        -- Por el contrario, si se solicita una fecha menor al d' +
        'ía de hoy, lo toma del HISTORICO'
      
        '        SELECT CCAS.ID_CREDITO, CC.SIT_CREDITO, CC.ID_CONTRATO, ' +
        'CC.IMP_CREDITO, CCAS.IMP_CAP_VIG'
      '        FROM CR_CON_ADEUDO_SDO CCAS,'
      '             CR_CREDITO CC'
      
        '        WHERE TO_DATE('#39'14/04/2008'#39','#39'DD/MM/YYYY'#39') < TO_DATE('#39'14/0' +
        '4/2008'#39','#39'DD/MM/YYYY'#39') -- pF_OPERACION'
      
        '          AND CCAS.F_CIERRE = TO_DATE('#39'14/04/2008'#39','#39'DD/MM/YYYY'#39')' +
        ' -- pF_OPERACION'
      '          AND CC.ID_CREDITO = CCAS.ID_CREDITO'
      '     ) CC,'
      '     MONEDA M,'
      '     CONTRATO CTO,'
      '     CR_CONTRATO CO,'
      '     CR_PRODUCTO CP,'
      '     CR_PRODUCTO_GPO CPG,'
      '     PERSONA P'
      '  WHERE CTO.ID_CONTRATO = OPERATIVA2.ID_CONTRATO'
      '    AND CC.ID_CONTRATO = OPERATIVA2.ID_CONTRATO'
      '    AND CO.ID_CONTRATO = OPERATIVA2.ID_CONTRATO'
      '    AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE'
      '    AND CPG.CVE_PRODUCTO_GPO = CP.CVE_PRODUCTO_GPO'
      '    AND P.ID_PERSONA = CTO.ID_TITULAR'
      '    AND M.CVE_MONEDA = CTO.CVE_MONEDA'
      '  ORDER BY P.NOMBRE, CTO.ID_CONTRATO, CC.ID_CREDITO')
    Left = 16
    Top = 33
    object qyConsultaCVE_PRODUCTO_CRE: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 6
    end
    object qyConsultaDESC_L_PRODUCTO: TStringField
      FieldName = 'DESC_L_PRODUCTO'
      Size = 80
    end
    object qyConsultaCVE_PRODUCTO_GPO: TStringField
      FieldName = 'CVE_PRODUCTO_GPO'
      Size = 6
    end
    object qyConsultaDESC_L_PROD_GPO: TStringField
      FieldName = 'DESC_L_PROD_GPO'
      Size = 80
    end
    object qyConsultaCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyConsultaDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyConsultaID_PERSONA: TFloatField
      FieldName = 'ID_PERSONA'
    end
    object qyConsultaNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qyConsultaID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyConsultaIMP_CREDITO: TFloatField
      FieldName = 'IMP_CREDITO'
    end
    object qyConsultaSDO_VIG_TOTAL: TFloatField
      FieldName = 'SDO_VIG_TOTAL'
    end
    object qyConsultaID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qyConsultaCVE_OPERATIVA: TStringField
      FieldName = 'CVE_OPERATIVA'
      Size = 6
    end
    object qyConsultaDESC_OPERATIVA: TStringField
      FieldName = 'DESC_OPERATIVA'
      Size = 30
    end
    object qyConsultaPCT_GTIA_FEGA_EF: TFloatField
      FieldName = 'PCT_GTIA_FEGA_EF'
    end
    object qyConsultaSIT_CREDITO: TStringField
      FieldName = 'SIT_CREDITO'
      Size = 2
    end
    object qyConsultaIMP_GARANTIZADO: TFloatField
      FieldName = 'IMP_GARANTIZADO'
    end
  end
end
