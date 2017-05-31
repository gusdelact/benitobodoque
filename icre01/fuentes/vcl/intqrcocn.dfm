object QrCompCOINCREDetalleN: TQrCompCOINCREDetalleN
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
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
  ReportTitle = 'Reporte Comparativo de Saldos'
  SnapToGrid = True
  Units = MM
  Zoom = 100
  object qrDetalle: TQRBand
    Left = 38
    Top = 247
    Width = 980
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
      2592.91666666667)
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
  object QRBand2: TQRBand
    Left = 38
    Top = 122
    Width = 980
    Height = 32
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
      84.6666666666667
      2592.91666666667)
    BandType = rbColumnHeader
    object QRShpTitle: TQRShape
      Left = 2
      Top = 3
      Width = 977
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        5.29166666666667
        7.9375
        2584.97916666667)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 16
      Top = 6
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
        15.875
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
      Left = 392
      Top = 6
      Width = 119
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1037.16666666667
        15.875
        314.854166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'SALDO CONSOLIDADO'
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
      Top = 6
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
        15.875
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
      Top = 6
      Width = 73
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1735.66666666667
        15.875
        193.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
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
    object QRLabel9: TQRLabel
      Left = 760
      Top = 6
      Width = 89
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2010.83333333333
        15.875
        235.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TIPO DE CAMBIO'
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
    object QRLabel10: TQRLabel
      Left = 872
      Top = 6
      Width = 103
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2307.16666666667
        15.875
        272.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'USD VALORIZADOS'
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
    Width = 980
    Height = 18
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
      47.625
      2592.91666666667)
    BandType = rbGroupFooter
    object QRLabel5: TQRLabel
      Left = 336
      Top = 4
      Width = 29
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        889
        10.5833333333333
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
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRExpr1: TQRExpr
      Left = 401
      Top = 4
      Width = 95
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
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
      Font.Style = []
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
      Top = 7
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
        18.5208333333333
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
      Top = 7
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
        18.5208333333333
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
      Top = 0
      Width = 957
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.9375
        42.3333333333333
        0
        2532.0625)
      Pen.Width = 2
      Shape = qrsHorLine
    end
    object QRDCveCtaTot: TQRDBText
      Left = 28
      Top = 4
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
        10.5833333333333
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
    object QRDBNomDetTot: TQRDBText
      Left = 112
      Top = 4
      Width = 201
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        296.333333333333
        10.5833333333333
        531.8125)
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
    object QRExpr10: TQRExpr
      Left = 523
      Top = 4
      Width = 103
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
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
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qCompCOIN.SDO_FIN_PER)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr19: TQRExpr
      Left = 637
      Top = 4
      Width = 89
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
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
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qCompCOIN.SDO_COINCRE) - SUM(qCompCOIN.SDO_FIN_PER)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 7
    end
    object QRDifValorizada: TQRLabel
      Left = 936
      Top = 4
      Width = 29
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2476.5
        10.5833333333333
        76.7291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL'
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
    object QRTCVal: TQRLabel
      Left = 816
      Top = 4
      Width = 29
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2159
        10.5833333333333
        76.7291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL'
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
  object qrPiedeGrupoSector: TQRBand
    Left = 38
    Top = 258
    Width = 980
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrPiedeGrupoSectorAfterPrint
    AlignToBottom = False
    BeforePrint = qrPiedeGrupoSectorBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = qrPiedeGrupoMetrica
    Size.Values = (
      37.0416666666667
      2592.91666666667)
    BandType = rbGroupFooter
    object QRExpr8: TQRExpr
      Left = 401
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
        1060.97916666667
        2.64583333333333
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
      Top = 1
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
        2.64583333333333
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
    object QRLabel15: TQRLabel
      Left = 243
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
        642.9375
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
    object QRTSec: TQRLabel
      Left = 323
      Top = 1
      Width = 33
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        854.604166666667
        2.64583333333333
        87.3125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRTSec'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
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
    Top = 307
    Width = 980
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrPiedeGrupoCuentaAfterPrint
    AlignToBottom = False
    BeforePrint = qrPiedeGrupoCuentaBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.2708333333333
      2592.91666666667)
    BandType = rbGroupFooter
    object QRShpGpoMoneda: TQRShape
      Left = 18
      Top = 1
      Width = 959
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        47.625
        2.64583333333333
        2537.35416666667)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRLabel14: TQRLabel
      Left = 215
      Top = 3
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
        7.9375
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
      Top = 3
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
        7.9375
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
      Top = 3
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
        7.9375
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
      Top = 3
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
        7.9375
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
    object QRLabel18: TQRLabel
      Left = 816
      Top = 3
      Width = 29
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2159
        7.9375
        76.7291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel19: TQRLabel
      Left = 936
      Top = 3
      Width = 29
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2476.5
        7.9375
        76.7291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object qrPiedeGrupoSegmento: TQRBand
    Left = 38
    Top = 290
    Width = 980
    Height = 17
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrPiedeGrupoSegmentoAfterPrint
    AlignToBottom = False
    BeforePrint = qrPiedeGrupoSegmentoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      44.9791666666667
      2592.91666666667)
    BandType = rbGroupFooter
    object QRShape2: TQRShape
      Left = 40
      Top = 1
      Width = 937
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        105.833333333333
        2.64583333333333
        2479.14583333333)
      Brush.Color = clGray
      Pen.Color = clGray
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 215
      Top = 2
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
        5.29166666666667
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
      Top = 2
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
        5.29166666666667
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
      Top = 2
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
        5.29166666666667
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
      Top = 2
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
        5.29166666666667
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
      Top = 2
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
        5.29166666666667
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
      Top = 2
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
        5.29166666666667
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
    object QRLabel11: TQRLabel
      Left = 816
      Top = 2
      Width = 29
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2159
        5.29166666666667
        76.7291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel12: TQRLabel
      Left = 936
      Top = 2
      Width = 29
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2476.5
        5.29166666666667
        76.7291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object qrPiedeGrupoMoneda: TQRBand
    Left = 38
    Top = 326
    Width = 980
    Height = 20
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrPiedeGrupoMonedaAfterPrint
    AlignToBottom = False
    BeforePrint = qrPiedeGrupoMonedaBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      52.9166666666667
      2592.91666666667)
    BandType = rbGroupFooter
    object QRShape3: TQRShape
      Left = 7
      Top = 2
      Width = 970
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
        2566.45833333333)
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
    object QRLabel20: TQRLabel
      Left = 816
      Top = 4
      Width = 29
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2159
        10.5833333333333
        76.7291666666667)
      Alignment = taRightJustify
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
    object QRLabel21: TQRLabel
      Left = 936
      Top = 4
      Width = 29
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2476.5
        10.5833333333333
        76.7291666666667)
      Alignment = taRightJustify
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
  end
  object QRTipoRest: TQRGroup
    Left = 38
    Top = 154
    Width = 980
    Height = 20
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRTipoRestAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      52.9166666666667
      2592.91666666667)
    Expression = 'qCompCOIN.CVE_TIPO_CTA'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText3: TQRDBText
      Left = 339
      Top = 1
      Width = 310
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        896.9375
        2.64583333333333
        820.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qCompCOIN
      DataField = 'CVE_TIPO_CTA'
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
    object QRShape4: TQRShape
      Left = 688
      Top = 8
      Width = 289
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        13.2291666666667
        1820.33333333333
        21.1666666666667
        764.645833333333)
      Shape = qrsRectangle
    end
    object QRShape5: TQRShape
      Left = 8
      Top = 8
      Width = 289
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        13.2291666666667
        21.1666666666667
        21.1666666666667
        764.645833333333)
      Shape = qrsRectangle
    end
  end
  object qrGrupoMoneda: TQRGroup
    Left = 38
    Top = 174
    Width = 980
    Height = 20
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
      52.9166666666667
      2592.91666666667)
    Expression = 'qCompCOIN.MONEDA'
    FooterBand = qrPiedeGrupoMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRShpMoneda: TQRShape
      Left = 10
      Top = 1
      Width = 479
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        26.4583333333333
        2.64583333333333
        1267.35416666667)
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Left = 13
      Top = 2
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
        5.29166666666667
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
      Left = 83
      Top = 2
      Width = 398
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        219.604166666667
        5.29166666666667
        1053.04166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
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
    Top = 194
    Width = 980
    Height = 18
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
      47.625
      2592.91666666667)
    Expression = 'qCompCOIN.TIPO_CUENTA'
    FooterBand = qrPiedeGrupoCuenta
    Master = Owner
    ReprintOnNewPage = False
    object QRShpTipoCuenta: TQRShape
      Left = 18
      Top = 2
      Width = 495
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        47.625
        5.29166666666667
        1309.6875)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRDBText4: TQRDBText
      Left = 23
      Top = 2
      Width = 91
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        60.8541666666667
        5.29166666666667
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
    Top = 212
    Width = 980
    Height = 16
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
      42.3333333333333
      2592.91666666667)
    Expression = 'qCompCOIN.SEGMENTO'
    FooterBand = qrPiedeGrupoSegmento
    Master = Owner
    ReprintOnNewPage = False
    object QRShpSegmento: TQRShape
      Left = 40
      Top = 2
      Width = 501
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        105.833333333333
        5.29166666666667
        1325.5625)
      Brush.Color = clGray
      Pen.Color = clGray
      Shape = qrsRectangle
    end
    object qrdbTxtSegmento: TQRDBText
      Left = 47
      Top = 2
      Width = 55
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        124.354166666667
        5.29166666666667
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
  end
  object qrGrupoMetrica: TQRGroup
    Left = 38
    Top = 228
    Width = 980
    Height = 5
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
      13.2291666666667
      2592.91666666667)
    Expression = 'qCompCOIN.ID_METRICA'
    FooterBand = qrPiedeGrupoMetrica
    Master = Owner
    ReprintOnNewPage = False
    object QRShpSector: TQRShape
      Left = 16
      Top = 1
      Width = 957
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.9375
        42.3333333333333
        2.64583333333333
        2532.0625)
      Pen.Width = 2
      Shape = qrsHorLine
    end
  end
  object qrGrupoSector: TQRGroup
    Left = 38
    Top = 233
    Width = 980
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrGrupoSectorAfterPrint
    AlignToBottom = False
    BeforePrint = qrGrupoSectorBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = qrDetalle
    Size.Values = (
      37.0416666666667
      2592.91666666667)
    Expression = 'qCompCOIN.CVE_SECTOR'
    FooterBand = qrPiedeGrupoSector
    Master = Owner
    ReprintOnNewPage = False
    object qrdbCVE_SECTOR: TQRDBText
      Left = 64
      Top = 0
      Width = 28
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
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
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
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
  object QRBand1: TQRBand
    Left = 38
    Top = 38
    Width = 980
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
      2592.91666666667)
    BandType = rbPageHeader
    object QRInterEncabezado1: TQRInterEncabezado
      Left = 0
      Top = 0
      Width = 980
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
        2592.91666666667)
      Titulo1 = 'CONCILIADOR OPERATIVO - CONTABLE'
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
  object qCompCOIN: TQuery
    DatabaseName = 'BCORP'
    SQL.Strings = (
      
        'SELECT CONS.CVE_MONEDA AS MONEDA,'#39'COINCRE'#39' AS ORIGEN,'#39'1 CARTERA ' +
        'DE CREDITO'#39' AS TIPO_CUENTA,'#39'1.1 VIGENTE'#39' AS SEGMENTO,'
      
        '        0 AS SDO_FIN_PER,(SUM(CONS.IMP_CAP_VIG)) as SDO_COINCRE,' +
        'CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '
      
        '        CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CO' +
        'NS.DESC_SECTOR, METRICA.ID_METRICA, '#39'SIN RESTRICCION'#39' AS CVE_TIP' +
        'O_CTA'
      ' FROM  ('
      
        '       SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO,' +
        ' '
      
        '               CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MON' +
        'EDA) CVE_MONEDA,'
      
        '               NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.I' +
        'MP_CAP_VIG,'
      
        '               NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) A' +
        'S CVE_PRODUCTO_CRE ,'
      
        '               NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DE' +
        'SC_C_PRODUCTO,'
      
        '               NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL' +
        '(P.NOMBRE,P2.NOMBRE) AS NOMBRE,'
      
        '               NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL' +
        '(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR'
      
        '       FROM  (SELECT ID_CREDITO, IMP_CAP_VIG FROM CR_CON_ADEUDO_' +
        'SDO WHERE TRUNC(F_CIERRE) =  TO_DATE('#39'31/01/2013'#39','#39'DD/MM/YYYY'#39'))' +
        ' CR_SDO,'
      
        '               MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO ' +
        'CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE,'
      
        '               CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO ' +
        'C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2'
      
        '       WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AN' +
        'D    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO'
      
        '       AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AN' +
        'D    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO'
      
        '       AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AN' +
        'D    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA'
      
        '       AND    P2.ID_PERSONA'#9#9'   (+)= C2.ID_TITULAR         AND  ' +
        '  S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR'
      
        '       AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AN' +
        'D    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO'
      
        '       AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AN' +
        'D    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO'
      
        '       AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA'#9'      AND  ' +
        '  P.ID_PERSONA'#9#9'  (+)= C.ID_TITULAR'
      '       AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS,'
      
        '       ( SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCC' +
        'G.CTA_CONTABLE,1,10) AS ID_METRICA'
      '         FROM   CR_CONT_GPO_PRO GP,'
      '                CR_CONT_CVES_GUIA CCCG'
      '         WHERE  GP.CVE_GPO = CCCG.CVE_GPO'
      '         AND    CCCG.CVE_TIPO_CTA = '#39'SR'#39
      #9'      AND    CCCG.CVE_CUENTA = '#39'SIPAVE'#39
      '       ) METRICA'
      ' WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE'
      '   AND CONS.CVE_MONEDA    <> '#39'UDIS'#39
      '   AND CONS.IMP_CAP_VIG   <> 0 '
      
        ' GROUP BY CONS.CVE_MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PR' +
        'ODUCTO, CONS.CVE_SECTOR, CONS.DESC_SECTOR, METRICA.ID_METRICA')
    Left = 211
    Top = 30
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
    object qCompCOINID_METRICA: TStringField
      FieldName = 'ID_METRICA'
    end
    object qCompCOINCVE_TIPO_CTA: TStringField
      FieldName = 'CVE_TIPO_CTA'
      Size = 30
    end
  end
end
