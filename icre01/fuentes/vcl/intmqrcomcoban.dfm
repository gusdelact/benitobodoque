object QrComCobAn: TQrComCobAn
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
  object GpoMon: TQRGroup
    Left = 48
    Top = 169
    Width = 720
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
      1905)
    Expression = 'qyConsulta.CVE_MONEDA'
    FooterBand = FooMon
    Master = Owner
    ReprintOnNewPage = False
    object QRShape12: TQRShape
      Left = 0
      Top = 0
      Width = 530
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        0
        0
        1402.29166666667)
      Shape = qrsRectangle
    end
    object QRDBText7: TQRDBText
      Left = 45
      Top = 0
      Width = 22
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        119.0625
        0
        58.2083333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'CVE_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText15: TQRDBText
      Left = 73
      Top = 0
      Width = 408
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        193.145833333333
        0
        1079.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRLabel3: TQRLabel
      Left = 3
      Top = 0
      Width = 39
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        7.9375
        0
        103.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
  end
  object GpoProd: TQRGroup
    Left = 48
    Top = 183
    Width = 720
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
      1905)
    Expression = 'qyConsulta.CVE_PRODUCTO_CRE'
    FooterBand = FooProd
    Master = Owner
    ReprintOnNewPage = False
    object QRShape11: TQRShape
      Left = 8
      Top = 0
      Width = 560
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        21.1666666666667
        0
        1481.66666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRDBText1: TQRDBText
      Left = 60
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
        158.75
        2.64583333333333
        124.354166666667)
      Alignment = taRightJustify
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
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText3: TQRDBText
      Left = 110
      Top = 1
      Width = 403
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        291.041666666667
        2.64583333333333
        1066.27083333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_L_PRODUCTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRLabel5: TQRLabel
      Left = 11
      Top = 0
      Width = 46
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        29.1041666666667
        0
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
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
  end
  object GpoCom: TQRGroup
    Left = 48
    Top = 197
    Width = 720
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
      1905)
    Expression = 'qyConsulta.CVE_COMISION'
    FooterBand = FooCom
    Master = Owner
    ReprintOnNewPage = False
    object QRShape13: TQRShape
      Left = 16
      Top = 0
      Width = 590
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        42.3333333333333
        0
        1561.04166666667)
      Shape = qrsRectangle
    end
    object QRLabel7: TQRLabel
      Left = 17
      Top = 0
      Width = 47
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        44.9791666666667
        0
        124.354166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Comisión:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText2: TQRDBText
      Left = 66
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
        174.625
        2.64583333333333
        124.354166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'CVE_COMISION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText4: TQRDBText
      Left = 116
      Top = 1
      Width = 445
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        306.916666666667
        2.64583333333333
        1177.39583333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_COMISION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
  end
  object GpoCli: TQRGroup
    Left = 48
    Top = 211
    Width = 720
    Height = 2
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
      5.29166666666667
      1905)
    Expression = 'qyConsulta.ID_PERSONA'
    FooterBand = FooCli
    Master = Owner
    ReprintOnNewPage = False
  end
  object FooProd: TQRBand
    Left = 48
    Top = 243
    Width = 720
    Height = 10
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
      1905)
    BandType = rbGroupFooter
    object QRExpr5: TQRExpr
      Left = 590
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1561.04166666667
        2.64583333333333
        153.458333333333)
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
      Expression = 'SUM(qyConsulta.IMP_COMISION_PER)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRLabel38: TQRLabel
      Left = 11
      Top = 1
      Width = 61
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        29.1041666666667
        2.64583333333333
        161.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total por Producto'
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
    object QRExpr4: TQRExpr
      Left = 468
      Top = 1
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1238.25
        2.64583333333333
        140.229166666667)
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
      Expression = 'SUM(qyConsulta.IMP_COMISION_DIA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr6: TQRExpr
      Left = 407
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1076.85416666667
        2.64583333333333
        153.458333333333)
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
      Expression = 'SUM(qyConsulta.IMP_COMISION)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr13: TQRExpr
      Left = 655
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1733.02083333333
        2.64583333333333
        153.458333333333)
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
      Expression = 'SUM(qyConsulta.IMP_X_DEVENGAR)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr3: TQRExpr
      Left = 526
      Top = 1
      Width = 55
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1391.70833333333
        2.64583333333333
        145.520833333333)
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
      Expression = 'SUM(qyConsulta.IMP_ACUM_MENS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object QRBand4: TQRBand
    Left = 48
    Top = 132
    Width = 720
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
      1905)
    BandType = rbColumnHeader
    object QRShape10: TQRShape
      Left = 650
      Top = 1
      Width = 70
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1719.79166666667
        2.64583333333333
        185.208333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape9: TQRShape
      Left = 586
      Top = 1
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1550.45833333333
        2.64583333333333
        171.979166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape8: TQRShape
      Left = 468
      Top = 1
      Width = 57
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1238.25
        2.64583333333333
        150.8125)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape7: TQRShape
      Left = 406
      Top = 1
      Width = 63
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1074.20833333333
        2.64583333333333
        166.6875)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape6: TQRShape
      Left = 366
      Top = 1
      Width = 41
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        968.375
        2.64583333333333
        108.479166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape5: TQRShape
      Left = 315
      Top = 1
      Width = 52
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        833.4375
        2.64583333333333
        137.583333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape3: TQRShape
      Left = 264
      Top = 1
      Width = 52
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        698.5
        2.64583333333333
        137.583333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape2: TQRShape
      Left = 204
      Top = 1
      Width = 61
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        539.75
        2.64583333333333
        161.395833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape1: TQRShape
      Left = 48
      Top = 1
      Width = 157
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        127
        2.64583333333333
        415.395833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape4: TQRShape
      Left = 0
      Top = 1
      Width = 49
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        0
        2.64583333333333
        129.645833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel16: TQRLabel
      Left = 5
      Top = 5
      Width = 40
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        13.2291666666667
        13.2291666666667
        105.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Núm. de Cliente'
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
    object QRLabel6: TQRLabel
      Left = 49
      Top = 11
      Width = 155
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        129.645833333333
        29.1041666666667
        410.104166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Nombre del Cliente '
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
    object QRLabel23: TQRLabel
      Left = 208
      Top = 1
      Width = 55
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        82.0208333333333
        550.333333333333
        2.64583333333333
        145.520833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Número de Autorización / Disposición '
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
    object QRLabel39: TQRLabel
      Left = 267
      Top = 5
      Width = 45
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        706.4375
        13.2291666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha de Apertura '
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
    object QRLabel43: TQRLabel
      Left = 317
      Top = 5
      Width = 48
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        838.729166666667
        13.2291666666667
        127)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha de Vencimiento'
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
    object QRLabel48: TQRLabel
      Left = 369
      Top = 5
      Width = 34
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        976.3125
        13.2291666666667
        89.9583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Días por Vencer'
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
    object QRLabel49: TQRLabel
      Left = 476
      Top = 5
      Width = 41
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1259.41666666667
        13.2291666666667
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Comisión del Día'
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
    object QRLabel53: TQRLabel
      Left = 591
      Top = 2
      Width = 55
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        1563.6875
        5.29166666666667
        145.520833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe Devengado Acumulado'
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
    object QRLabel2: TQRLabel
      Left = 656
      Top = 5
      Width = 59
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1735.66666666667
        13.2291666666667
        156.104166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe por Devengar'
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
    object QRLabel4: TQRLabel
      Left = 417
      Top = 5
      Width = 42
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1103.3125
        13.2291666666667
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe Original'
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
    object QRShape14: TQRShape
      Left = 524
      Top = 1
      Width = 63
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1386.41666666667
        2.64583333333333
        166.6875)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel10: TQRLabel
      Left = 532
      Top = 2
      Width = 48
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        1407.58333333333
        5.29166666666667
        127)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe Devengado Periodo'
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
  object QRBand5: TQRBand
    Left = 48
    Top = 169
    Width = 720
    Height = 0
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = GpoMon
    Size.Values = (
      0
      1905)
    BandType = rbColumnHeader
  end
  object FooMon: TQRBand
    Left = 48
    Top = 253
    Width = 720
    Height = 10
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
      1905)
    BandType = rbGroupFooter
    object QRLabel1: TQRLabel
      Left = 3
      Top = 1
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        7.9375
        2.64583333333333
        148.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total por Moneda'
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
    object QRExpr8: TQRExpr
      Left = 407
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1076.85416666667
        2.64583333333333
        153.458333333333)
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
      Expression = 'SUM(qyConsulta.IMP_COMISION)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr9: TQRExpr
      Left = 468
      Top = 1
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1238.25
        2.64583333333333
        140.229166666667)
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
      Expression = 'SUM(qyConsulta.IMP_COMISION_DIA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr10: TQRExpr
      Left = 590
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1561.04166666667
        2.64583333333333
        153.458333333333)
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
      Expression = 'SUM(qyConsulta.IMP_COMISION_PER)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr12: TQRExpr
      Left = 655
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1733.02083333333
        2.64583333333333
        153.458333333333)
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
      Expression = 'SUM(qyConsulta.IMP_X_DEVENGAR)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr7: TQRExpr
      Left = 526
      Top = 1
      Width = 55
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1391.70833333333
        2.64583333333333
        145.520833333333)
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
      Expression = 'SUM(qyConsulta.IMP_ACUM_MENS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object FooCom: TQRBand
    Left = 48
    Top = 233
    Width = 720
    Height = 10
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
      1905)
    BandType = rbGroupFooter
    object QRExpr15: TQRExpr
      Left = 590
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1561.04166666667
        2.64583333333333
        153.458333333333)
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
      Expression = 'SUM(qyConsulta.IMP_COMISION_PER)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRLabel8: TQRLabel
      Left = 19
      Top = 1
      Width = 62
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        50.2708333333333
        2.64583333333333
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total por Comisión'
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
    object QRExpr16: TQRExpr
      Left = 468
      Top = 1
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1238.25
        2.64583333333333
        140.229166666667)
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
      Expression = 'SUM(qyConsulta.IMP_COMISION_DIA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr17: TQRExpr
      Left = 407
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1076.85416666667
        2.64583333333333
        153.458333333333)
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
      Expression = 'SUM(qyConsulta.IMP_COMISION)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr19: TQRExpr
      Left = 655
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1733.02083333333
        2.64583333333333
        153.458333333333)
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
      Expression = 'SUM(qyConsulta.IMP_X_DEVENGAR)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr2: TQRExpr
      Left = 526
      Top = 1
      Width = 55
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1391.70833333333
        2.64583333333333
        145.520833333333)
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
      Expression = 'SUM(qyConsulta.IMP_ACUM_MENS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object FooCli: TQRBand
    Left = 48
    Top = 223
    Width = 720
    Height = 10
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
      1905)
    BandType = rbGroupFooter
    object QRExpr21: TQRExpr
      Left = 590
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1561.04166666667
        2.64583333333333
        153.458333333333)
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
      Expression = 'SUM(qyConsulta.IMP_COMISION_PER)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRLabel9: TQRLabel
      Left = 30
      Top = 1
      Width = 54
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        79.375
        2.64583333333333
        142.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total por Cliente'
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
    object QRExpr22: TQRExpr
      Left = 468
      Top = 1
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1238.25
        2.64583333333333
        140.229166666667)
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
      Expression = 'SUM(qyConsulta.IMP_COMISION_DIA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr23: TQRExpr
      Left = 407
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1076.85416666667
        2.64583333333333
        153.458333333333)
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
      Expression = 'SUM(qyConsulta.IMP_COMISION)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr25: TQRExpr
      Left = 655
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1733.02083333333
        2.64583333333333
        153.458333333333)
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
      Expression = 'SUM(qyConsulta.IMP_X_DEVENGAR)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr1: TQRExpr
      Left = 526
      Top = 1
      Width = 55
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1391.70833333333
        2.64583333333333
        145.520833333333)
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
      Expression = 'SUM(qyConsulta.IMP_ACUM_MENS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object QRBand2: TQRBand
    Left = 48
    Top = 213
    Width = 720
    Height = 10
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand2BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      26.4583333333333
      1905)
    BandType = rbDetail
    object QRDBText5: TQRDBText
      Left = 2
      Top = 1
      Width = 39
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        5.29166666666667
        2.64583333333333
        103.1875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'ID_PERSONA'
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
    object QRDBText6: TQRDBText
      Left = 208
      Top = 1
      Width = 48
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        550.333333333333
        2.64583333333333
        127)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
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
    object QRDBText9: TQRDBText
      Left = 268
      Top = 1
      Width = 48
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        709.083333333333
        2.64583333333333
        127)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_INICIO'
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
    object QRDBText10: TQRDBText
      Left = 321
      Top = 1
      Width = 48
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        849.3125
        2.64583333333333
        127)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_VENCIMIENTO'
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
    object QRDBText11: TQRDBText
      Left = 369
      Top = 1
      Width = 34
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        976.3125
        2.64583333333333
        89.9583333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DIAS_X_VENCER'
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
    object QRDBText12: TQRDBText
      Left = 407
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1076.85416666667
        2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_COMISION'
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
    object QRDBText13: TQRDBText
      Left = 468
      Top = 1
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1238.25
        2.64583333333333
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_COMISION_DIA'
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
    object QRDBText14: TQRDBText
      Left = 590
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1561.04166666667
        2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_COMISION_PER'
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
    object QRDBText8: TQRDBText
      Left = 53
      Top = 1
      Width = 145
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        140.229166666667
        2.64583333333333
        383.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'NOMBRE'
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
    object QRDBText16: TQRDBText
      Left = 655
      Top = 1
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1733.02083333333
        2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_X_DEVENGAR'
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
    object QRDBText17: TQRDBText
      Left = 526
      Top = 1
      Width = 55
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1391.70833333333
        2.64583333333333
        145.520833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_ACUM_MENS'
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
  end
  object qyConsulta: TQuery
    DatabaseName = 'BCORP'
    SQL.Strings = (
      'SELECT MON.CVE_MONEDA, '
      '       MON.DESC_MONEDA, '
      '       PROD.CVE_PRODUCTO_CRE, '
      '       PROD.DESC_L_PRODUCTO, '
      '       CCAT.CVE_COMISION, '
      '       CCAT.DESC_COMISION, '
      '       P.ID_PERSONA, '
      '       P.NOMBRE, '
      '       PROV.ID_CREDITO, '
      '       TO_CHAR(PROV.F_INICIO,'#39'DD/MM/YYYY'#39') AS F_INICIO, '
      
        '       TO_CHAR(PROV.F_VENCIMIENTO,'#39'DD/MM/YYYY'#39') AS F_VENCIMIENTO' +
        ', '
      
        '       PROV.F_VENCIMIENTO - TO_DATE( '#39'30/09/2010'#39', '#39'DD/MM/YYYY'#39' ' +
        ') - 1 AS DIAS_X_VENCER, '
      '       PROV.IMP_COMISION, '
      '       PROV.IMP_COMISION_DIA, '
      '       PROV.IMP_COMISION_PER, '
      '       PROV.IMP_ACUM_MENS,'
      
        '       (PROV.IMP_COMISION - PROV.IMP_COMISION_PER) AS IMP_X_DEVE' +
        'NGAR '
      'FROM   ( '
      '        SELECT '#39'CR'#39' CVE_ACCESORIO, '
      '               PROV.ID_CREDITO, '
      '               PROV.F_CIERRE, '
      '               PROV.CVE_COMISION, '
      '               PROV.IMP_COMISION, '
      '               PROV.IMP_COMISION_DIA, '
      '               PROV.IMP_COMISION_PER, '
      '               (SELECT SUM(IMP_COMISION_DIA)'
      '                   FROM CR_COM_PROVISION'
      '                  WHERE ID_CREDITO = PROV.ID_CREDITO'
      
        '                    AND F_CIERRE BETWEEN (SELECT TRUNC(ADD_MONTH' +
        'S(TO_DATE('#39'30/09/2010'#39','#39'dd/mm/yyyy'#39'), 0), '#39'MM'#39') AS FIRST_DAY FRO' +
        'M DUAL)'
      
        '                    AND TO_DATE('#39'30/09/2010'#39','#39'dd/mm/yyyy'#39')) AS I' +
        'MP_ACUM_MENS,'
      '               C.F_INICIO, '
      '               C.F_VENCIMIENTO, '
      '               C.ID_CONTRATO, '
      '               L.CVE_PRODUCTO_CRE '
      '        FROM   CR_COM_PROVISION PROV, '
      '               CR_CREDITO C, '
      '               CR_CONTRATO L '
      '        WHERE  PROV.ID_CREDITO  = C.ID_CREDITO '
      
        '          AND  PROV.F_CIERRE    = TO_DATE( '#39'30/09/2010'#39', '#39'DD/MM/' +
        'YYYY'#39' ) '
      '          AND  L.ID_CONTRATO    = C.ID_CONTRATO '
      '          AND  L.FOL_CONTRATO   = C.FOL_CONTRATO '
      '        UNION '
      '        SELECT PROV.CVE_ACCESORIO, '
      '               PROV.ID_ACCESORIO, '
      '               PROV.F_CIERRE, '
      '               PROV.CVE_COMISION, '
      '               PROV.IMP_COMISION, '
      '               PROV.IMP_COMISION_DIA, '
      '               PROV.IMP_COMISION_PER, '
      '              (SELECT SUM(IMP_COMISION_DIA)'
      '                 FROM CR_COM_PROV_ACC'
      '                WHERE ID_ACCESORIO = PROV.ID_ACCESORIO'
      
        '                  AND F_CIERRE BETWEEN (SELECT TRUNC(ADD_MONTHS(' +
        'TO_DATE('#39'30/09/2010'#39','#39'dd/mm/yyyy'#39'), 0), '#39'MM'#39') AS FIRST_DAY FROM ' +
        'DUAL)'
      
        '                  AND TO_DATE('#39'30/09/2010'#39','#39'dd/mm/yyyy'#39')) AS IMP' +
        '_ACUM_MENS,'
      '               L.F_AUT_COMITE  F_INICIO, '
      '               L.F_VENCIMIENTO F_VENCIMIENTO, '
      '               L.ID_CONTRATO, '
      '               L.CVE_PRODUCTO_CRE '
      '        FROM   CR_COM_PROV_ACC PROV, '
      '               CR_CONTRATO L '
      '        WHERE  ( ( PROV.ID_ACCESORIO  = L.ID_CONTRATO  ) AND '
      '                 ( PROV.FOL_ACCESORIO = L.FOL_CONTRATO ) AND '
      '                 ( PROV.CVE_ACCESORIO = '#39'LN'#39'         ) '
      '               ) '
      
        '          AND  PROV.F_CIERRE          = TO_DATE( '#39'30/09/2010'#39', '#39 +
        'DD/MM/YYYY'#39' ) '
      '       ) PROV, '
      '       CONTRATO CTTO, '
      '       PERSONA P, '
      '       MONEDA MON, '
      '       CR_PRODUCTO PROD, '
      '       CR_CAT_COMISION CCAT, '
      '       EMPRESA EMP '
      'WHERE  CTTO.ID_CONTRATO     = PROV.ID_CONTRATO '
      '  AND  P.ID_PERSONA          = CTTO.ID_TITULAR '
      '  AND  MON.CVE_MONEDA        = CTTO.CVE_MONEDA '
      '  AND  PROD.CVE_PRODUCTO_CRE = PROV.CVE_PRODUCTO_CRE '
      '  AND  PROV.CVE_COMISION     = CCAT.CVE_COMISION '
      
        '  AND  PROV.F_CIERRE         = TO_DATE( '#39'30/09/2010'#39', '#39'DD/MM/YYY' +
        'Y'#39' ) '
      '  AND  PROD.ID_EMPRESA       = EMP.ID_EMPRESA '
      ' AND EMP.ID_EMPRESA = 2'
      ''
      'UNION ALL'
      'SELECT MON.CVE_MONEDA, '
      '       MON.DESC_MONEDA, '
      '       PROD.CVE_PRODUCTO_CRE, '
      '       PROD.DESC_SUB_TIPO, '
      '       CCAT.CVE_COMISION, '
      '       CCAT.DESC_COMISION, '
      '       P.ID_PERSONA, '
      '       P.NOMBRE, '
      '       PROV.ID_CREDITO, '
      '       TO_CHAR(PROV.F_INICIO,'#39'DD/MM/YYYY'#39') AS F_INICIO, '
      
        '       TO_CHAR(PROV.F_VENCIMIENTO,'#39'DD/MM/YYYY'#39') AS F_VENCIMIENTO' +
        ', '
      
        '       PROV.F_VENCIMIENTO - TO_DATE( '#39'30/09/2010'#39', '#39'DD/MM/YYYY'#39' ' +
        ') - 1 AS DIAS_X_VENCER, '
      '       PROV.IMP_COMISION, '
      '       PROV.IMP_COMISION_DIA, '
      '       PROV.IMP_COMISION_PER, '
      '       PROV.IMP_ACUM_MENS,'
      
        '       (PROV.IMP_COMISION - PROV.IMP_COMISION_PER) AS IMP_X_DEVE' +
        'NGAR '
      'FROM  ( '
      '       SELECT '#39'CR'#39' CVE_ACCESORIO, '
      '              PROV.ID_CREDITO, '
      '              PROV.F_CIERRE, '
      '              PROV.CVE_COMISION, '
      '              PROV.IMP_COMISION, '
      '              PROV.IMP_COMISION_DIA, '
      '              PROV.IMP_COMISION_PER, '
      '              (SELECT SUM(IMP_COMISION_DIA)'
      
        '                 FROM CRE_COM_PROVISION WHERE ID_CREDITO = PROV.' +
        'ID_CREDITO'
      
        '                  AND F_CIERRE BETWEEN (SELECT TRUNC(ADD_MONTHS(' +
        'TO_DATE( '#39'30/09/2010'#39','#39'dd/mm/yyyy'#39'), 0), '#39'MM'#39') AS FIRST_DAY FROM' +
        ' DUAL)'
      
        '                  AND TO_DATE( '#39'30/09/2010'#39','#39'dd/mm/yyyy'#39')) AS IM' +
        'P_ACUM_MENS,'
      '              C.F_VALOR_CRED F_INICIO, '
      '              C.F_VALOR_CRED + C.DIAS_PLAZO F_VENCIMIENTO, '
      '              C.ID_CONTRATO, '
      '              L.CVE_SUB_TIP_BCO CVE_PRODUCTO_CRE '
      '       FROM   CRE_COM_PROVISION PROV, '
      '              CRE_CREDITO C, '
      '              CRE_CONTRATO L '
      '       WHERE  PROV.ID_CREDITO  = C.ID_CREDITO '
      
        '             AND  PROV.F_CIERRE    = TO_DATE( '#39'30/09/2010'#39', '#39'DD/' +
        'MM/YYYY'#39' ) '
      '             AND  L.ID_CONTRATO    = C.ID_CONTRATO '
      '      ) PROV, '
      '      CONTRATO CTTO, '
      '      PERSONA P, '
      '      MONEDA MON, '
      '      (SELECT TO_CHAR(CVE_SUB_TIP_BCO) CVE_PRODUCTO_CRE, '
      '              DESC_SUB_TIPO '
      '       FROM   CRE_SUB_TIP_BCO '
      '      )PROD, '
      '      CRE_COMISION CCAT, '
      '      EMPRESA EMP '
      'WHERE CTTO.ID_CONTRATO      = PROV.ID_CONTRATO '
      ' AND  P.ID_PERSONA          = CTTO.ID_TITULAR '
      ' AND  MON.CVE_MONEDA        = CTTO.CVE_MONEDA '
      ' AND  PROD.CVE_PRODUCTO_CRE = PROV.CVE_PRODUCTO_CRE '
      ' AND  PROV.CVE_COMISION     = CCAT.CVE_COMISION '
      
        ' AND  PROV.F_CIERRE         = TO_DATE( '#39'30/09/2010'#39', '#39'DD/MM/YYYY' +
        #39' )  AND EMP.ID_EMPRESA = 2'
      'ORDER BY CVE_MONEDA, CVE_PRODUCTO_CRE, CVE_COMISION, '
      '         ID_PERSONA, ID_CREDITO '
      ''
      '')
    Top = 47
    object qyConsultaCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyConsultaDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyConsultaCVE_PRODUCTO_CRE: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 40
    end
    object qyConsultaDESC_L_PRODUCTO: TStringField
      FieldName = 'DESC_L_PRODUCTO'
      Size = 250
    end
    object qyConsultaCVE_COMISION: TStringField
      FieldName = 'CVE_COMISION'
      Size = 6
    end
    object qyConsultaDESC_COMISION: TStringField
      FieldName = 'DESC_COMISION'
      Size = 80
    end
    object qyConsultaID_PERSONA: TFloatField
      FieldName = 'ID_PERSONA'
    end
    object qyConsultaNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 150
    end
    object qyConsultaID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyConsultaF_INICIO: TStringField
      FieldName = 'F_INICIO'
      Size = 10
    end
    object qyConsultaF_VENCIMIENTO: TStringField
      FieldName = 'F_VENCIMIENTO'
      Size = 10
    end
    object qyConsultaDIAS_X_VENCER: TFloatField
      FieldName = 'DIAS_X_VENCER'
    end
    object qyConsultaIMP_COMISION: TFloatField
      FieldName = 'IMP_COMISION'
    end
    object qyConsultaIMP_COMISION_DIA: TFloatField
      FieldName = 'IMP_COMISION_DIA'
    end
    object qyConsultaIMP_COMISION_PER: TFloatField
      FieldName = 'IMP_COMISION_PER'
    end
    object qyConsultaIMP_ACUM_MENS: TFloatField
      FieldName = 'IMP_ACUM_MENS'
    end
    object qyConsultaIMP_X_DEVENGAR: TFloatField
      FieldName = 'IMP_X_DEVENGAR'
    end
  end
end
