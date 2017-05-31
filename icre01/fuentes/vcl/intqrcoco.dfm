object QrCompCOINCRE: TQrCompCOINCRE
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
  Units = MM
  Zoom = 100
  object QRBand3: TQRBand
    Left = 38
    Top = 195
    Width = 740
    Height = 10
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand3BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      26.4583333333333
      1957.91666666667)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 8
      Top = 0
      Width = 68
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        21.1666666666667
        0
        179.916666666667)
      Alignment = taRightJustify
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
    object QRDBText2: TQRDBText
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
    object QRDBText3: TQRDBText
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
    object QRDBText6: TQRDBText
      Left = 80
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
        211.666666666667
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
    object QRShape4: TQRShape
      Left = 639
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
        1690.6875
        0
        267.229166666667)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRShape3: TQRShape
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
    object QRShape2: TQRShape
      Left = 385
      Top = 0
      Width = 125
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.1458333333333
        1018.64583333333
        0
        330.729166666667)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRShape1: TQRShape
      Left = 3
      Top = 0
      Width = 383
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.1458333333333
        7.9375
        0
        1013.35416666667)
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
      Left = 526
      Top = 5
      Width = 99
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1391.70833333333
        13.2291666666667
        261.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'SALDO CONTABLE'
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
  object QRFGrupoCuenProd: TQRBand
    Left = 38
    Top = 205
    Width = 740
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFGrupoCuenProdBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      39.6875
      1957.91666666667)
    BandType = rbGroupFooter
    object QRLabel5: TQRLabel
      Left = 312
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
        825.5
        7.9375
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
    object QRExpr2: TQRExpr
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
    object QRExpr3: TQRExpr
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
    object QRShape7: TQRShape
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
    object QRShape11: TQRShape
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
  end
  object QRFGrupoSegmento: TQRBand
    Left = 38
    Top = 220
    Width = 740
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
      1957.91666666667)
    BandType = rbGroupFooter
    object QRShape8: TQRShape
      Left = 152
      Top = 0
      Width = 585
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        402.166666666667
        0
        1547.8125)
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 311
      Top = 1
      Width = 86
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        822.854166666667
        2.64583333333333
        227.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL SEGMENTO:'
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
    object QRExpr4: TQRExpr
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
    object QRExpr5: TQRExpr
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
    object QRExpr6: TQRExpr
      Left = 637
      Top = 1
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
        2.64583333333333
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
    object QRLabel7: TQRLabel
      Left = 159
      Top = 1
      Width = 54
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        420.6875
        2.64583333333333
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
    object QRExpr7: TQRExpr
      Left = 224
      Top = 1
      Width = 72
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        592.666666666667
        2.64583333333333
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
  end
  object QRGroup3: TQRGroup
    Left = 38
    Top = 144
    Width = 740
    Height = 19
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
      50.2708333333333
      1957.91666666667)
    Expression = 'qCompCOIN.MONEDA'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape9: TQRShape
      Left = 8
      Top = 0
      Width = 729
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        21.1666666666667
        0
        1928.8125)
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Left = 11
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
        29.1041666666667
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
    object QRDBText7: TQRDBText
      Left = 89
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
        235.479166666667
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
  object QRGroup1: TQRGroup
    Left = 38
    Top = 163
    Width = 740
    Height = 19
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
      50.2708333333333
      1957.91666666667)
    Expression = 'qCompCOIN.TIPO_CUENTA'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape10: TQRShape
      Left = 18
      Top = 1
      Width = 473
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        47.625
        2.64583333333333
        1251.47916666667)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRShape5: TQRShape
      Left = 17
      Top = 0
      Width = 472
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        44.9791666666667
        0
        1248.83333333333)
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 28
      Top = 1
      Width = 94
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        74.0833333333333
        2.64583333333333
        248.708333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TIPO DE CUENTA: '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText4: TQRDBText
      Left = 137
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
        362.479166666667
        2.64583333333333
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qCompCOIN
      DataField = 'TIPO_CUENTA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object QRGrupoCuenProd: TQRGroup
    Left = 38
    Top = 182
    Width = 740
    Height = 13
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
      34.3958333333333
      1957.91666666667)
    Expression = 'qCompCOIN.SEGMENTO'
    FooterBand = QRFGrupoSegmento
    Master = Owner
    ReprintOnNewPage = False
    object QRShape6: TQRShape
      Left = 43
      Top = 0
      Width = 501
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        113.770833333333
        0
        1325.5625)
      Shape = qrsRectangle
    end
    object QRLabel10: TQRLabel
      Left = 49
      Top = 1
      Width = 58
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        129.645833333333
        2.64583333333333
        153.458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'SEGMENTO: '
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
    object QRDBText5: TQRDBText
      Left = 215
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
        568.854166666667
        2.64583333333333
        137.583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qCompCOIN
      DataField = 'SEGMENTO'
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
    object QRDBText8: TQRDBText
      Left = 123
      Top = 1
      Width = 64
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        325.4375
        2.64583333333333
        169.333333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qCompCOIN
      DataField = 'TIPO_CUENTA'
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
    object QRLabel11: TQRLabel
      Left = 113
      Top = 1
      Width = 4
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
        10.5833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '('
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
    object QRLabel12: TQRLabel
      Left = 193
      Top = 1
      Width = 4
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        510.645833333333
        2.64583333333333
        10.5833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = ')'
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
  object QRGroup2: TQRGroup
    Left = 38
    Top = 195
    Width = 740
    Height = 0
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroup2BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      0
      1957.91666666667)
    Expression = 'qCompCOIN.ID_METRICA'
    FooterBand = QRFGrupoCuenProd
    Master = Owner
    ReprintOnNewPage = False
  end
  object qCompCOIN: TQuery
    DatabaseName = 'PCORP'
    SQL.Strings = (
      'SELECT * FROM ('
      '--CONTA CAPITAL VIGENTE B1 (A 16 DIGITOS)'
      
        'select  '#39'PESO MEXICANO'#39' AS MONEDA,  '#39'CONTA'#39' AS ORIGEN, '#39'CAPITAL'#39 +
        ' AS TIPO_CUENTA, '#39'VIGENTE'#39' AS SEGMENTO, sum(SDO_FIN_PER) SDO_FIN' +
        '_PER, 0 SDO_COINCRE, SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_' +
        'CONTABLE, NULL AS NOMBRE_PROD, METRICA.ID_METRICA'
      'from    cg_periodo_cta@cont PCTA,'
      
        '       (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, I' +
        'D_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 4 and SIT_RELA' +
        'CION = '#39'B1'#39' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA'
      'where   id_empresa = 2'
      'and     CVE_EJER_CONT = 2006'
      'and     CVE_MONEDA = 484'
      
        'and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CON' +
        'TABLE'
      'and     length(PCTA.CVE_CTA_CONTABLE) = 16'
      'and     substr(PCTA.CVE_CTA_CONTABLE,14,3) = '#39'100'#39
      'and     NUM_PERIODOC = 2'
      'GROUP BY SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA'
      'union all'
      '--CONTA CAPITAL VIGENTE B2 (A 12 DIGITOS - COMPLEMENTO)'
      
        'select '#39'CONTA'#39' AS ORIGEN, '#39'CAPITAL'#39' AS TIPO_CUENTA, '#39'VIGENTE'#39' AS' +
        ' SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(P' +
        'CTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD' +
        ', METRICA.ID_METRICA'
      'from    cg_periodo_cta@cont PCTA,'
      
        '       (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, I' +
        'D_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 4 and SIT_RELA' +
        'CION = '#39'B2'#39' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA'
      'where   id_empresa = 2'
      'and     CVE_EJER_CONT = 2006'
      'and     CVE_MONEDA = 484'
      
        'and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CON' +
        'TABLE'
      'and     length(PCTA.CVE_CTA_CONTABLE) = 12'
      'and     NUM_PERIODOC = 2'
      'GROUP BY SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA'
      'UNION ALL'
      '--CONTA INTERES VIGENTE'
      
        'select '#39'CONTA'#39' AS ORIGEN, '#39'INTERES'#39' AS TIPO_CUENTA, '#39'VIGENTE'#39' AS' +
        ' SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(P' +
        'CTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PROD' +
        ', METRICA.ID_METRICA'
      'from    cg_periodo_cta@cont PCTA,'
      
        '       (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, I' +
        'D_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 30 and SIT_REL' +
        'ACION = '#39'B1'#39' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA'
      'where   id_empresa = 2'
      'and     CVE_EJER_CONT = 2006'
      'and     CVE_MONEDA = 484'
      
        'and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CON' +
        'TABLE'
      'and     length(PCTA.CVE_CTA_CONTABLE) = 16'
      'and     substr(PCTA.CVE_CTA_CONTABLE,14,3) = '#39'100'#39
      'and     NUM_PERIODOC = 2'
      'GROUP BY SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA'
      'UNION ALL'
      '--CONTA CAPITAL IMPAGADO'
      
        'Select '#39'CONTA'#39' AS ORIGEN, '#39'CAPITAL'#39' AS TIPO_CUENTA, '#39'IMPAGADO'#39' A' +
        'S SEGMENTO, sum(SDO_FIN_PER) SDO_FIN_PER, 0 SDO_COINCRE, SUBSTR(' +
        'PCTA.CVE_CTA_CONTABLE,1,10) CVE_CTA_CONTABLE, NULL AS NOMBRE_PRO' +
        'D, METRICA.ID_METRICA'
      'from    cg_periodo_cta@cont PCTA,'
      
        '       (SELECT DISTINCT(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE, I' +
        'D_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 16 and SIT_REL' +
        'ACION = '#39'B1'#39' GROUP BY CVE_CTA_CONTABLE, ID_METRICA) METRICA'
      'where   id_empresa = 2'
      'and     CVE_EJER_CONT = 2006'
      'and     CVE_MONEDA = 484'
      
        'and     SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10) = METRICA.CVE_CTA_CON' +
        'TABLE'
      'and     length(PCTA.CVE_CTA_CONTABLE) = 16'
      'and     substr(PCTA.CVE_CTA_CONTABLE,14,3) = '#39'100'#39
      'and     NUM_PERIODOC = 2'
      'GROUP BY SUBSTR(PCTA.CVE_CTA_CONTABLE,1,10), METRICA.ID_METRICA'
      'UNION ALL'
      '--COINCRE CAPITAL VIGENTE'
      
        'SELECT '#39'COINCRE'#39' AS ORIGEN, '#39'CAPITAL'#39' AS TIPO_CUENTA, '#39'VIGENTE'#39' ' +
        'AS SEGMENTO,'
      '0 AS SDO_FIN_PER, (SUM(Imp_Sdo_K_Vig)) as SDO_COINCRE,'
      'DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO  AS NOMBRE_PROD,'
      'METRICA.ID_METRICA'
      
        'FROM  (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.' +
        'id_anio_mes = 225) FacCre,'
      
        '      (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE NOT(Dim' +
        'Cre.ID_OLTP_PRODUCTO LIKE '#39'%N%'#39') AND DimCre.MONEDA = '#39'PESO MEXIC' +
        'ANO'#39') DimCre,'
      '       DM_CR_DIM_Mes@dwhc DimMes,'
      
        '      (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, ID' +
        '_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 4 GROUP BY ID_O' +
        'LTP_PRODUCTO, ID_METRICA) METRICA'
      'WHERE  FacCre.Id_Credito        = DimCre.Id_Credito '
      'AND    FacCre.Id_Anio_Mes       = DimMes.Id_Anio_Mes'
      'AND    METRICA.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO'
      
        'group by DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO, METRICA.ID_ME' +
        'TRICA'
      'UNION ALL'
      '--COINCRE INTERES VIGENTE'
      'SELECT'
      
        #39'COINCRE'#39' AS ORIGEN, '#39'INTERES'#39' AS TIPO_CUENTA, '#39'VIGENTE'#39' AS SEGM' +
        'ENTO,'
      '0 AS SDO_FIN_PER,(SUM(IMP_INT_CORTE)) as SDO_COINCRE,'
      'DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO  AS NOMBRE_PROD,'
      'METRICA.ID_METRICA'
      
        'FROM  (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.' +
        'id_anio_mes = 225) FacCre,'
      
        '      (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE NOT(Dim' +
        'Cre.ID_OLTP_PRODUCTO LIKE '#39'%N%'#39') AND DimCre.MONEDA = '#39'PESO MEXIC' +
        'ANO'#39') DimCre,'
      '       DM_CR_DIM_Mes@dwhc DimMes,'
      
        '      (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, ID' +
        '_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 30 and SIT_RELA' +
        'CION = '#39'B1'#39' GROUP BY ID_OLTP_PRODUCTO, ID_METRICA) METRICA'
      'WHERE  FacCre.Id_Credito        = DimCre.Id_Credito '
      'AND    FacCre.Id_Anio_Mes       = DimMes.Id_Anio_Mes'
      'AND    METRICA.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO'
      
        'group by DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO, METRICA.ID_ME' +
        'TRICA'
      'UNION ALL'
      '--COINCRE CAPITAL IMPAGADO'
      'SELECT'
      
        #39'COINCRE'#39' AS ORIGEN, '#39'CAPITAL'#39' AS TIPO_CUENTA, '#39'IMPAGADO'#39' AS SEG' +
        'MENTO,  '
      '0 AS SDO_FIN_PER,(SUM(Imp_Sdo_K_Imp)) as SDO_COINCRE,'
      'DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO  AS NOMBRE_PROD,'
      'METRICA.ID_METRICA'
      
        'FROM  (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.' +
        'id_anio_mes = 225) FacCre,'
      
        '      (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE NOT(Dim' +
        'Cre.ID_OLTP_PRODUCTO LIKE '#39'%N%'#39') AND DimCre.MONEDA = '#39'PESO MEXIC' +
        'ANO'#39') DimCre,'
      '       DM_CR_DIM_Mes@dwhc DimMes,'
      
        '      (SELECT DISTINCT(ID_OLTP_PRODUCTO) AS ID_OLTP_PRODUCTO, ID' +
        '_METRICA FROM CR_COINCRE_CONC where ID_REPORTE = 16 and SIT_RELA' +
        'CION = '#39'B1'#39' GROUP BY ID_OLTP_PRODUCTO, ID_METRICA) METRICA'
      'WHERE  FacCre.Id_Credito        = DimCre.Id_Credito '
      'AND    FacCre.Id_Anio_Mes       = DimMes.Id_Anio_Mes'
      'AND    METRICA.ID_OLTP_PRODUCTO (+)= DimCre.ID_OLTP_PRODUCTO'
      
        'group by DimCre.ID_OLTP_PRODUCTO, DimCre.PRODUCTO, METRICA.ID_ME' +
        'TRICA'
      ') ORDER BY'
      'TIPO_CUENTA,'
      'SEGMENTO,'
      'ID_METRICA,'
      'ORIGEN,'
      'CVE_CTA_CONTABLE')
    Left = 184
    Top = 16
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
      Size = 8
    end
    object qCompCOINSDO_FIN_PER: TFloatField
      FieldName = 'SDO_FIN_PER'
    end
    object qCompCOINSDO_COINCRE: TFloatField
      FieldName = 'SDO_COINCRE'
    end
    object qCompCOINCVE_CTA_CONTABLE: TStringField
      FieldName = 'CVE_CTA_CONTABLE'
      Size = 10
    end
    object qCompCOINNOMBRE_PROD: TStringField
      FieldName = 'NOMBRE_PROD'
      Size = 100
    end
    object qCompCOINID_METRICA: TFloatField
      FieldName = 'ID_METRICA'
    end
    object qCompCOINMONEDA: TStringField
      FieldName = 'MONEDA'
    end
  end
end
