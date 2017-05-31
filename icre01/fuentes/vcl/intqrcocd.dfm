object QrCompCOINCREDetalle: TQrCompCOINCREDetalle
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qCompCOIN
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial Black'
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
  object qrDetalle: TQRBand
    Left = 38
    Top = 246
    Width = 740
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrDetalleAfterPrint
    AlignToBottom = False
    BeforePrint = qrDetalleBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = qrPiedeGrupoSector
    Size.Values = (
      29.1041666666667
      1957.91666666667)
    BandType = rbDetail
    object qrdbSDO_COINCRE: TQRDBText
      Left = 426
      Top = 0
      Width = 70
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1127.125
        0
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qCompCOIN
      DataField = 'SDO_COINCRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrdbSDO_FIN_PER: TQRDBText
      Left = 560
      Top = 0
      Width = 66
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1481.66666666667
        0
        174.625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qCompCOIN
      DataField = 'SDO_FIN_PER'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrdbCVE_CTA_CONTABLE: TQRDBText
      Left = 28
      Top = 0
      Width = 80
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
        211.666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qCompCOIN
      DataField = 'CVE_CTA_CONTABLE'
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
    object qrdbNOMBRE_PROD: TQRDBText
      Left = 112
      Top = 0
      Width = 305
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        296.333333333333
        0
        806.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qCompCOIN
      DataField = 'NOMBRE_PROD'
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
  object QRBand1: TQRBand
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
      Titulo1 = 'Comparativo COINCRE - CONTA'
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
  object QRBand2: TQRBand
    Left = 38
    Top = 122
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
    BandType = rbColumnHeader
    object QRShpTitle: TQRShape
      Left = 2
      Top = 0
      Width = 507
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.1458333333333
        5.29166666666667
        0
        1341.4375)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRShpSaldoContable: TQRShape
      Left = 509
      Top = 0
      Width = 131
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.1458333333333
        1346.72916666667
        0
        346.604166666667)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRShpDiferencias: TQRShape
      Left = 638
      Top = 0
      Width = 101
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.1458333333333
        1688.04166666667
        0
        267.229166666667)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 16
      Top = 5
      Width = 253
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        42.3333333333333
        13.2291666666667
        669.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'PRODUCTO - SUB TIPO    //    CUENTA CONTABLE'
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
    object QRLabel2: TQRLabel
      Left = 403
      Top = 5
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1066.27083333333
        13.2291666666667
        232.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'SALDO COINCRE'
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
    object QRLabel3: TQRLabel
      Left = 517
      Top = 5
      Width = 124
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1367.89583333333
        13.2291666666667
        328.083333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'SALDO CONTABLE SAP'
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
      Left = 656
      Top = 5
      Width = 69
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1735.66666666667
        13.2291666666667
        182.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'DIFERENCIAS'
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
  end
  object qrPiedeGrupoMetrica: TQRBand
    Left = 38
    Top = 272
    Width = 740
    Height = 22
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrPiedeGrupoMetricaAfterPrint
    AlignToBottom = False
    BeforePrint = qrPiedeGrupoMetricaBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      58.2083333333333
      1957.91666666667)
    BandType = rbGroupFooter
    object QRLabel5: TQRLabel
      Left = 312
      Top = 6
      Width = 29
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        825.5
        15.875
        76.7291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL'
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
    object QRExpr1: TQRExpr
      Left = 401
      Top = 6
      Width = 95
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1060.97916666667
        15.875
        251.354166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qCompCOIN.SDO_COINCRE)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr2: TQRExpr
      Left = 523
      Top = 6
      Width = 103
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1383.77083333333
        15.875
        272.520833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qCompCOIN.SDO_FIN_PER)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr3: TQRExpr
      Left = 637
      Top = 6
      Width = 89
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1685.39583333333
        15.875
        235.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qCompCOIN.SDO_COINCRE) - SUM(qCompCOIN.SDO_FIN_PER)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object QRShpGrupoCta: TQRShape
      Left = 16
      Top = 1
      Width = 717
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        15.875
        42.3333333333333
        2.64583333333333
        1897.0625)
      Pen.Width = 2
      Shape = qrsHorLine
    end
  end
  object qrPiedeGrupoSector: TQRBand
    Left = 38
    Top = 257
    Width = 740
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrPiedeGrupoSectorAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = qrPiedeGrupoMetrica
    Size.Values = (
      39.6875
      1957.91666666667)
    BandType = rbGroupFooter
    object QRExpr8: TQRExpr
      Left = 401
      Top = 3
      Width = 95
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1060.97916666667
        7.9375
        251.354166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qCompCOIN.SDO_COINCRE)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr9: TQRExpr
      Left = 523
      Top = 3
      Width = 103
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1383.77083333333
        7.9375
        272.520833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qCompCOIN.SDO_FIN_PER)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr10: TQRExpr
      Left = 637
      Top = 3
      Width = 89
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1685.39583333333
        7.9375
        235.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qCompCOIN.SDO_COINCRE) - SUM(qCompCOIN.SDO_FIN_PER)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object QRShpSubtotal: TQRShape
      Left = 357
      Top = 1
      Width = 377
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        944.5625
        2.64583333333333
        997.479166666667)
      Shape = qrsRectangle
    end
    object QRShpSubtotal1: TQRShape
      Left = 357
      Top = 3
      Width = 377
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        944.5625
        7.9375
        997.479166666667)
      Shape = qrsRectangle
    end
    object QRLabel15: TQRLabel
      Left = 237
      Top = 1
      Width = 79
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        627.0625
        2.64583333333333
        209.020833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Sector:'
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
    object QRDBText11: TQRDBText
      Left = 320
      Top = 0
      Width = 21
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        846.666666666667
        0
        55.5625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qCompCOIN
      DataField = 'CVE_SECTOR'
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
  object qrGrupoMoneda: TQRGroup
    Left = 38
    Top = 144
    Width = 740
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrGrupoMonedaAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.2708333333333
      1957.91666666667)
    Expression = 'qCompCOIN.MONEDA'
    FooterBand = qrPiedeGrupoMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRShpMoneda: TQRShape
      Left = 10
      Top = 0
      Width = 727
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        26.4583333333333
        0
        1923.52083333333)
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Left = 13
      Top = 1
      Width = 61
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        34.3958333333333
        2.64583333333333
        161.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'MONEDA:'
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
    object qrdbMONEDA: TQRDBText
      Left = 91
      Top = 1
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        240.770833333333
        2.64583333333333
        150.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qCompCOIN
      DataField = 'MONEDA'
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
  object qrGrupoTipoCuenta: TQRGroup
    Left = 38
    Top = 163
    Width = 740
    Height = 25
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrGrupoTipoCuentaAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      66.1458333333333
      1957.91666666667)
    Expression = 'qCompCOIN.TIPO_CUENTA'
    FooterBand = qrPiedeGrupoCuenta
    Master = Owner
    ReprintOnNewPage = False
    object QRShpTipoCuenta: TQRShape
      Left = 18
      Top = 6
      Width = 473
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        47.625
        15.875
        1251.47916666667)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 28
      Top = 6
      Width = 116
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        74.0833333333333
        15.875
        306.916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TIPO DE CUENTA: '
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clCaptionText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText4: TQRDBText
      Left = 143
      Top = 6
      Width = 91
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        378.354166666667
        15.875
        240.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clBlack
      DataSet = qCompCOIN
      DataField = 'TIPO_CUENTA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clCaptionText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object qrGrupoSegmento: TQRGroup
    Left = 38
    Top = 188
    Width = 740
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrGrupoSegmentoAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.2708333333333
      1957.91666666667)
    Expression = 'qCompCOIN.SEGMENTO'
    FooterBand = qrPiedeGrupoSegmento
    Master = Owner
    ReprintOnNewPage = False
    object QRShape1: TQRShape
      Left = 40
      Top = 2
      Width = 503
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        105.833333333333
        5.29166666666667
        1330.85416666667)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRShpSegmento: TQRShape
      Left = 40
      Top = 3
      Width = 501
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        105.833333333333
        7.9375
        1325.5625)
      Brush.Color = clGray
      Pen.Color = clGray
      Shape = qrsRectangle
    end
    object qrlblSegmento: TQRLabel
      Left = 46
      Top = 3
      Width = 62
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        121.708333333333
        7.9375
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'SEGMENTO: '
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object qrdbTxtSegmento: TQRDBText
      Left = 207
      Top = 3
      Width = 55
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        547.6875
        7.9375
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clGray
      DataSet = qCompCOIN
      DataField = 'SEGMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object qrdbTIPO_CUENTA: TQRDBText
      Left = 116
      Top = 3
      Width = 73
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        306.916666666667
        7.9375
        193.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clGray
      DataSet = qCompCOIN
      DataField = 'TIPO_CUENTA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRLabel11: TQRLabel
      Left = 110
      Top = 3
      Width = 6
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        291.041666666667
        7.9375
        15.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '('
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel12: TQRLabel
      Left = 190
      Top = 3
      Width = 6
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        502.708333333333
        7.9375
        15.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = ')'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object qrGrupoMetrica: TQRGroup
    Left = 38
    Top = 207
    Width = 740
    Height = 25
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrGrupoMetricaBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = qrGrupoSector
    Size.Values = (
      66.1458333333333
      1957.91666666667)
    Expression = 'qCompCOIN.ID_METRICA'
    FooterBand = qrPiedeGrupoMetrica
    Master = Owner
    ReprintOnNewPage = False
    object QRShpSector: TQRShape
      Left = 16
      Top = 17
      Width = 717
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        42.3333333333333
        44.9791666666667
        1897.0625)
      Pen.Width = 2
      Shape = qrsHorLine
    end
  end
  object qrGrupoSector: TQRGroup
    Left = 38
    Top = 232
    Width = 740
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrGrupoSectorAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = qrDetalle
    Size.Values = (
      37.0416666666667
      1957.91666666667)
    Expression = 'qCompCOIN.CVE_SECTOR'
    FooterBand = qrPiedeGrupoSector
    Master = Owner
    ReprintOnNewPage = False
    object qrdbCVE_SECTOR: TQRDBText
      Left = 64
      Top = 0
      Width = 28
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        169.333333333333
        0
        74.0833333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qCompCOIN
      DataField = 'CVE_SECTOR'
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
    object qrdbDESC_SECTOR: TQRDBText
      Left = 106
      Top = 1
      Width = 305
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        280.458333333333
        2.64583333333333
        806.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qCompCOIN
      DataField = 'DESC_SECTOR'
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
    object qrlblSector: TQRLabel
      Left = 18
      Top = 1
      Width = 47
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        47.625
        2.64583333333333
        124.354166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'SECTOR:'
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
  end
  object qrPiedeGrupoCuenta: TQRBand
    Left = 38
    Top = 313
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
    BandType = rbGroupFooter
    object QRShpGpoMoneda: TQRShape
      Left = 22
      Top = 2
      Width = 716
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        58.2083333333333
        5.29166666666667
        1894.41666666667)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRLabel14: TQRLabel
      Left = 215
      Top = 4
      Width = 72
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        568.854166666667
        10.5833333333333
        190.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL CUENTA:'
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
    object QRExpr11: TQRExpr
      Left = 401
      Top = 4
      Width = 95
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1060.97916666667
        10.5833333333333
        251.354166666667)
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
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qCompCOIN.SDO_COINCRE)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr12: TQRExpr
      Left = 523
      Top = 4
      Width = 103
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1383.77083333333
        10.5833333333333
        272.520833333333)
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
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qCompCOIN.SDO_FIN_PER)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr13: TQRExpr
      Left = 637
      Top = 4
      Width = 89
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1685.39583333333
        10.5833333333333
        235.479166666667)
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
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qCompCOIN.SDO_COINCRE) - SUM(qCompCOIN.SDO_FIN_PER)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object QRLabel16: TQRLabel
      Left = 50
      Top = 4
      Width = 54
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        132.291666666667
        10.5833333333333
        142.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'VARIACIÓN:'
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
    object QRExpr14: TQRExpr
      Left = 130
      Top = 4
      Width = 72
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        343.958333333333
        10.5833333333333
        190.5)
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
      Master = Owner
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 
        'IF( SUM(qCompCOIN.SDO_FIN_PER) <> 0, (SUM(qCompCOIN.SDO_COINCRE)' +
        ' * 100 / SUM(qCompCOIN.SDO_FIN_PER)) - 100,0)'
      Mask = '0.000000%'
      FontSize = 7
    end
    object QRDBText1: TQRDBText
      Left = 312
      Top = 4
      Width = 86
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        825.5
        10.5833333333333
        227.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clBlack
      DataSet = qCompCOIN
      DataField = 'TIPO_CUENTA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
  end
  object qrPiedeGrupoSegmento: TQRBand
    Left = 38
    Top = 294
    Width = 740
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrPiedeGrupoSegmentoAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.2708333333333
      1957.91666666667)
    BandType = rbGroupFooter
    object QRShape2: TQRShape
      Left = 40
      Top = 2
      Width = 698
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        105.833333333333
        5.29166666666667
        1846.79166666667)
      Brush.Color = clGray
      Pen.Color = clGray
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 215
      Top = 4
      Width = 86
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        568.854166666667
        10.5833333333333
        227.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL SEGMENTO:'
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
    object QRExpr4: TQRExpr
      Left = 401
      Top = 4
      Width = 95
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1060.97916666667
        10.5833333333333
        251.354166666667)
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
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qCompCOIN.SDO_COINCRE)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr5: TQRExpr
      Left = 523
      Top = 4
      Width = 103
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1383.77083333333
        10.5833333333333
        272.520833333333)
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
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qCompCOIN.SDO_FIN_PER)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr6: TQRExpr
      Left = 637
      Top = 4
      Width = 89
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1685.39583333333
        10.5833333333333
        235.479166666667)
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
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qCompCOIN.SDO_COINCRE) - SUM(qCompCOIN.SDO_FIN_PER)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object QRLabel7: TQRLabel
      Left = 50
      Top = 4
      Width = 54
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        132.291666666667
        10.5833333333333
        142.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'VARIACIÓN:'
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
    object QRExpr7: TQRExpr
      Left = 130
      Top = 4
      Width = 72
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        343.958333333333
        10.5833333333333
        190.5)
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
      Master = Owner
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 
        'IF( SUM(qCompCOIN.SDO_FIN_PER) <> 0, (SUM(qCompCOIN.SDO_COINCRE)' +
        ' * 100 / SUM(qCompCOIN.SDO_FIN_PER)) - 100,0)'
      Mask = '0.000000%'
      FontSize = 7
    end
  end
  object qrPiedeGrupoMoneda: TQRBand
    Left = 38
    Top = 335
    Width = 740
    Height = 21
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
      55.5625
      1957.91666666667)
    BandType = rbGroupFooter
    object QRShape3: TQRShape
      Left = 7
      Top = 2
      Width = 731
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        18.5208333333333
        5.29166666666667
        1934.10416666667)
      Shape = qrsRectangle
    end
    object QRLabel13: TQRLabel
      Left = 215
      Top = 4
      Width = 74
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        568.854166666667
        10.5833333333333
        195.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL MONEDA:'
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
    object QRExpr15: TQRExpr
      Left = 401
      Top = 4
      Width = 95
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1060.97916666667
        10.5833333333333
        251.354166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qCompCOIN.SDO_COINCRE)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr16: TQRExpr
      Left = 523
      Top = 4
      Width = 103
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1383.77083333333
        10.5833333333333
        272.520833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qCompCOIN.SDO_FIN_PER)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr17: TQRExpr
      Left = 637
      Top = 4
      Width = 89
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1685.39583333333
        10.5833333333333
        235.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qCompCOIN.SDO_COINCRE) - SUM(qCompCOIN.SDO_FIN_PER)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object QRLabel17: TQRLabel
      Left = 50
      Top = 4
      Width = 54
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        132.291666666667
        10.5833333333333
        142.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'VARIACIÓN:'
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
    object QRExpr18: TQRExpr
      Left = 130
      Top = 4
      Width = 72
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        343.958333333333
        10.5833333333333
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      Master = Owner
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 
        'IF( SUM(qCompCOIN.SDO_FIN_PER) <> 0, (SUM(qCompCOIN.SDO_COINCRE)' +
        ' * 100 / SUM(qCompCOIN.SDO_FIN_PER)) - 100,0)'
      Mask = '0.000000%'
      FontSize = 7
    end
    object QRDBText2: TQRDBText
      Left = 312
      Top = 4
      Width = 86
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        825.5
        10.5833333333333
        227.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qCompCOIN
      DataField = 'MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
  end
  object qCompCOIN: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      
        'SELECT  CONS.CVE_MONEDA AS MONEDA,'#39'COINCRE'#39' AS ORIGEN,'#39'CAPITAL'#39' ' +
        'AS TIPO_CUENTA,'#39'VIGENTE'#39' AS SEGMENTO,'
      
        '0 AS SDO_FIN_PER,(SUM(CONS.IMP_CAP_VIG)) as SDO_COINCRE,CONS.CVE' +
        '_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '
      
        'CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_' +
        'SECTOR,cons.ID_CREDITO, METRICA.ID_METRICA'
      'FROM  ('
      'SELECT   '
      'NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO,'
      
        'CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA' +
        ','
      'NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_CAP_VIG,'
      
        'NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_' +
        'CRE ,'
      'NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO,'
      
        'NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NO' +
        'MBRE) AS NOMBRE,'
      
        'NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,' +
        'S2.DESC_SECTOR) AS DESC_SECTOR'#9#9#9#9'          '
      
        'FROM  (SELECT ID_CREDITO, IMP_CAP_VIG FROM CR_CON_ADEUDO_SDO WHE' +
        'RE TRUNC(F_CIERRE) =  TO_DATE('#39'31/07/2007'#39','#39'DD/MM/YYYY'#39') ) CR_SD' +
        'O,'
      
        'MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO' +
        ' CP,CRE_CREDITO  CCE,      '
      
        'CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,P' +
        'ERSONA P, PERSONA P2,SECTOR S,SECTOR S2'
      
        'WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CC' +
        'O.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'
      
        'AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2' +
        '.ID_CONTRATO       (+)= CC.ID_CONTRATO        '
      
        'AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO' +
        '.CVE_MONEDA        (+)= CCO.CVE_MONEDA        '
      
        'AND    P2.ID_PERSONA'#9#9'   (+)= C2.ID_TITULAR         AND    S2.CV' +
        'E_SECTOR        (+)=P2.CVE_TIPO_SECTOR'
      
        'AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CC' +
        'OE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'
      
        'AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.' +
        'ID_CONTRATO        (+)= CCE.ID_CONTRATO'
      
        'AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA'#9'      AND    P.ID_' +
        'PERSONA'#9#9'  (+)= C.ID_TITULAR            '
      'AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'#9#9#9#9
      
        '(SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, CVE_SECT' +
        'OR, ID_METRICA,CVE_MONEDA '
      'FROM CR_COINCRE_CONCD where ID_REPORTE = 4 '
      
        'GROUP BY ID_OLTP_PRODUCTO,CVE_SECTOR ,ID_METRICA,CVE_MONEDA) MET' +
        'RICA'#9#9#9'   '
      'WHERE   METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'
      'AND     METRICA.CVE_SECTOR'#9#9'  (+)= CONS.CVE_SECTOR'
      'AND '#9' METRICA.CVE_MONEDA'#9#9#9'  (+)= CONS.MONEDA'
      'AND     CONS.CVE_MONEDA '#9#9#9'<> '#39'UDIS'#39
      
        'GROUP BY CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRO' +
        'DUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR,cons.id_credito, METRICA' +
        '.ID_METRICA'
      ' ')
    Left = 43
    Top = 14
    object qCompCOINMONEDA: TStringField
      FieldName = 'MONEDA'
    end
    object qCompCOINORIGEN: TStringField
      FieldName = 'ORIGEN'
      Size = 7
    end
    object qCompCOINTIPO_CUENTA: TStringField
      FieldName = 'TIPO_CUENTA'
      FixedChar = True
      Size = 7
    end
    object qCompCOINSEGMENTO: TStringField
      FieldName = 'SEGMENTO'
      FixedChar = True
      Size = 7
    end
    object qCompCOINSDO_FIN_PER: TFloatField
      FieldName = 'SDO_FIN_PER'
    end
    object qCompCOINSDO_COINCRE: TFloatField
      FieldName = 'SDO_COINCRE'
    end
    object qCompCOINCVE_CTA_CONTABLE: TStringField
      FieldName = 'CVE_CTA_CONTABLE'
      Size = 40
    end
    object qCompCOINNOMBRE_PROD: TStringField
      FieldName = 'NOMBRE_PROD'
      Size = 250
    end
    object qCompCOINCVE_SECTOR: TStringField
      FieldName = 'CVE_SECTOR'
      Size = 4
    end
    object qCompCOINDESC_SECTOR: TStringField
      FieldName = 'DESC_SECTOR'
      Size = 80
    end
    object qCompCOINID_METRICA: TFloatField
      FieldName = 'ID_METRICA'
    end
  end
end
