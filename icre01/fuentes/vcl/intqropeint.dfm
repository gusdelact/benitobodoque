object QROperativoIntereses: TQROperativoIntereses
  Left = 0
  Top = 0
  Width = 1344
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qOpeInteres
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
  Page.PaperSize = Legal
  Page.Values = (
    100
    2159
    100
    3556
    350
    220
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
  object QRBand1: TQRBand
    Left = 132
    Top = 38
    Width = 1129
    Height = 99
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
      261.9375
      2987.14583333333)
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
        261.9375
        0
        0
        2987.14583333333)
      Titulo1 = 'Reporte Operativo de Intereses'
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
  object DetailBand1: TQRBand
    Left = 132
    Top = 243
    Width = 1129
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = DetailBand1AfterPrint
    AlignToBottom = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = qrPiedeGrupoProducto
    ParentFont = False
    Size.Values = (
      34.3958333333333
      2987.14583333333)
    BandType = rbDetail
    object dbCveProd: TQRDBText
      Left = 2
      Top = 1
      Width = 30
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
        79.375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'CVE_PRODUCTO_CRE'
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
    object QRDBText1: TQRDBText
      Left = 34
      Top = 1
      Width = 111
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        89.9583333333333
        2.64583333333333
        293.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'DESC_PRESUPUESTO'
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
    object QRDBText3: TQRDBText
      Left = 148
      Top = 1
      Width = 30
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        391.583333333333
        2.64583333333333
        79.375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'ID_CREDITO'
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
    object QRDBText4: TQRDBText
      Left = 180
      Top = 1
      Width = 30
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        476.25
        2.64583333333333
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'ID_TITULAR'
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
    object QRDBText5: TQRDBText
      Left = 213
      Top = 1
      Width = 111
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        563.5625
        2.64583333333333
        293.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'CTE'
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
    object QRDBText6: TQRDBText
      Left = 362
      Top = 1
      Width = 34
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        957.791666666667
        2.64583333333333
        89.9583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'F_INICIO'
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
    object QRDBText7: TQRDBText
      Left = 402
      Top = 1
      Width = 40
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1063.625
        2.64583333333333
        105.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'F_VENCIMIENTO'
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
    object QRDBText8: TQRDBText
      Left = 445
      Top = 1
      Width = 40
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1177.39583333333
        2.64583333333333
        105.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'F_TRASPASO_VENC'
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
    object QRDBText9: TQRDBText
      Left = 487
      Top = 1
      Width = 44
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1288.52083333333
        2.64583333333333
        116.416666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'IMP_INTERES_DIA'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText10: TQRDBText
      Left = 578
      Top = 1
      Width = 44
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1529.29166666667
        2.64583333333333
        116.416666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'IMP_INTERES_RES'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText11: TQRDBText
      Left = 668
      Top = 1
      Width = 44
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1767.41666666667
        2.64583333333333
        116.416666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'IMP_INTERES_CO'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText14: TQRDBText
      Left = 714
      Top = 1
      Width = 44
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1889.125
        2.64583333333333
        116.416666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'IMP_MORAS'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText15: TQRDBText
      Left = 623
      Top = 1
      Width = 44
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1648.35416666667
        2.64583333333333
        116.416666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'IMP_COB_MOR'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText17: TQRDBText
      Left = 760
      Top = 1
      Width = 44
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2010.83333333333
        2.64583333333333
        116.416666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'IMP_MORA_CONDONA'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText18: TQRDBText
      Left = 806
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
        2132.54166666667
        2.64583333333333
        132.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'ACUM_INT_RES'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText19: TQRDBText
      Left = 858
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
        2270.125
        2.64583333333333
        132.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'ICXA_SDO'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText20: TQRDBText
      Left = 911
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
        2410.35416666667
        2.64583333333333
        132.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'ACUM_COB_MOR'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText22: TQRDBText
      Left = 965
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
        2553.22916666667
        2.64583333333333
        132.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'ACUM_INT_CO'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText23: TQRDBText
      Left = 1017
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
        2690.8125
        2.64583333333333
        132.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'ACUM_MORAS'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText24: TQRDBText
      Left = 1071
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
        2833.6875
        2.64583333333333
        132.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'ACUM_MORA_CONDONA'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText12: TQRDBText
      Left = 326
      Top = 1
      Width = 30
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        862.541666666667
        2.64583333333333
        79.375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'SITUACION'
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
    object QRDBText2: TQRDBText
      Left = 533
      Top = 1
      Width = 44
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1410.22916666667
        2.64583333333333
        116.416666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'IMP_ICXA'
      Mask = '###,###,###,###,###,##0.00'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object QRBand2: TQRBand
    Left = 132
    Top = 137
    Width = 1129
    Height = 60
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      158.75
      2987.14583333333)
    BandType = rbColumnHeader
    object QRShape3: TQRShape
      Left = 535
      Top = 24
      Width = 44
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1415.52083333333
        63.5
        116.416666666667)
      Shape = qrsRectangle
    end
    object QRShape31: TQRShape
      Left = 965
      Top = 3
      Width = 156
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2553.22916666667
        7.9375
        412.75)
      Brush.Color = clGray
      Shape = qrsRectangle
    end
    object QRShape14: TQRShape
      Left = 671
      Top = 24
      Width = 44
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1775.35416666667
        63.5
        116.416666666667)
      Shape = qrsRectangle
    end
    object QRShape13: TQRShape
      Left = 580
      Top = 24
      Width = 44
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1534.58333333333
        63.5
        116.416666666667)
      Shape = qrsRectangle
    end
    object QRLabel5: TQRLabel
      Left = 584
      Top = 26
      Width = 35
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        1545.16666666667
        68.7916666666667
        92.6041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Interés Ctas. Result'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRShape12: TQRShape
      Left = 489
      Top = 24
      Width = 44
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1293.8125
        63.5
        116.416666666667)
      Shape = qrsRectangle
    end
    object QRShape11: TQRShape
      Left = 447
      Top = 24
      Width = 40
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1182.6875
        63.5
        105.833333333333)
      Shape = qrsRectangle
    end
    object QRShape10: TQRShape
      Left = 404
      Top = 24
      Width = 40
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1068.91666666667
        63.5
        105.833333333333)
      Shape = qrsRectangle
    end
    object QRShape9: TQRShape
      Left = 361
      Top = 24
      Width = 40
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        955.145833333333
        63.5
        105.833333333333)
      Shape = qrsRectangle
    end
    object QRShape8: TQRShape
      Left = 215
      Top = 24
      Width = 111
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        568.854166666667
        63.5
        293.6875)
      Shape = qrsRectangle
    end
    object QRShape7: TQRShape
      Left = 182
      Top = 24
      Width = 30
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        481.541666666667
        63.5
        79.375)
      Shape = qrsRectangle
    end
    object QRShape6: TQRShape
      Left = 150
      Top = 24
      Width = 30
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        396.875
        63.5
        79.375)
      Shape = qrsRectangle
    end
    object QRShape4: TQRShape
      Left = 36
      Top = 24
      Width = 111
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        95.25
        63.5
        293.6875)
      Shape = qrsRectangle
    end
    object QRShape2: TQRShape
      Left = 3
      Top = 24
      Width = 30
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        7.9375
        63.5
        79.375)
      Shape = qrsRectangle
    end
    object qrCveProducto: TQRLabel
      Left = 5
      Top = 29
      Width = 26
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        13.2291666666667
        76.7291666666667
        68.7916666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cve Prod'
      Color = clWhite
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
    object qrCartera: TQRLabel
      Left = 76
      Top = 34
      Width = 27
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        201.083333333333
        89.9583333333333
        71.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cartera'
      Color = clWhite
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
    object qrIdCredito: TQRLabel
      Left = 152
      Top = 33
      Width = 26
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        402.166666666667
        87.3125
        68.7916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Crédito'
      Color = clWhite
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
    object qrIdAcreditado: TQRLabel
      Left = 184
      Top = 30
      Width = 26
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        486.833333333333
        79.375
        68.7916666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Id Acred'
      Color = clWhite
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
    object qrAcreditado: TQRLabel
      Left = 251
      Top = 34
      Width = 37
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        664.104166666667
        89.9583333333333
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Acreditado'
      Color = clWhite
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
    object QRLabel1: TQRLabel
      Left = 367
      Top = 29
      Width = 29
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        971.020833333333
        76.7291666666667
        76.7291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Inicio'
      Color = clWhite
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
    object QRLabel2: TQRLabel
      Left = 409
      Top = 30
      Width = 30
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1082.14583333333
        79.375
        79.375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha Vento'
      Color = clWhite
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
    object QRLabel3: TQRLabel
      Left = 451
      Top = 29
      Width = 32
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1193.27083333333
        76.7291666666667
        84.6666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Trasp. Vencido'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel4: TQRLabel
      Left = 493
      Top = 26
      Width = 36
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        1304.39583333333
        68.7916666666667
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Interés Devengado Día'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel6: TQRLabel
      Left = 675
      Top = 26
      Width = 36
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        1785.9375
        68.7916666666667
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Interés Ctas. Orden'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRShape16: TQRShape
      Left = 717
      Top = 24
      Width = 44
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1897.0625
        63.5
        116.416666666667)
      Shape = qrsRectangle
    end
    object QRShape17: TQRShape
      Left = 625
      Top = 24
      Width = 44
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1653.64583333333
        63.5
        116.416666666667)
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 721
      Top = 33
      Width = 37
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1907.64583333333
        87.3125
        97.8958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Moratorio'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel10: TQRLabel
      Left = 627
      Top = 29
      Width = 38
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1658.9375
        76.7291666666667
        100.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Moratorio Cobrado'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRShape19: TQRShape
      Left = 763
      Top = 24
      Width = 44
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        2018.77083333333
        63.5
        116.416666666667)
      Shape = qrsRectangle
    end
    object QRLabel12: TQRLabel
      Left = 765
      Top = 29
      Width = 39
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        2024.0625
        76.7291666666667
        103.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Moratorio Condonado'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRShape20: TQRShape
      Left = 809
      Top = 24
      Width = 50
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        2140.47916666667
        63.5
        132.291666666667)
      Shape = qrsRectangle
    end
    object QRLabel13: TQRLabel
      Left = 815
      Top = 32
      Width = 39
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        2156.35416666667
        84.6666666666667
        103.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Interéses'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRShape21: TQRShape
      Left = 861
      Top = 24
      Width = 50
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        2278.0625
        63.5
        132.291666666667)
      Shape = qrsRectangle
    end
    object QRLabel14: TQRLabel
      Left = 866
      Top = 35
      Width = 39
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2291.29166666667
        92.6041666666667
        103.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'ICXA'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRShape22: TQRShape
      Left = 914
      Top = 24
      Width = 50
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        2418.29166666667
        63.5
        132.291666666667)
      Shape = qrsRectangle
    end
    object QRLabel15: TQRLabel
      Left = 920
      Top = 27
      Width = 39
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        2434.16666666667
        71.4375
        103.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Moras Cobrados'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRShape24: TQRShape
      Left = 966
      Top = 24
      Width = 50
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        2555.875
        63.5
        132.291666666667)
      Shape = qrsRectangle
    end
    object QRLabel17: TQRLabel
      Left = 969
      Top = 29
      Width = 44
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        2563.8125
        76.7291666666667
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Interés Ctas. Orden'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRShape25: TQRShape
      Left = 1018
      Top = 24
      Width = 50
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        2693.45833333333
        63.5
        132.291666666667)
      Shape = qrsRectangle
    end
    object QRLabel18: TQRLabel
      Left = 1021
      Top = 33
      Width = 44
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2701.39583333333
        87.3125
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Moratorios'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRShape26: TQRShape
      Left = 1070
      Top = 24
      Width = 52
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        2831.04166666667
        63.5
        137.583333333333)
      Shape = qrsRectangle
    end
    object QRLabel19: TQRLabel
      Left = 1075
      Top = 33
      Width = 44
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2844.27083333333
        87.3125
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Condonados'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRShape28: TQRShape
      Left = 580
      Top = 3
      Width = 89
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1534.58333333333
        7.9375
        235.479166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel23: TQRLabel
      Left = 582
      Top = 7
      Width = 84
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1539.875
        18.5208333333333
        222.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'RESULTADOS DIA'
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
    object QRShape29: TQRShape
      Left = 671
      Top = 3
      Width = 136
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1775.35416666667
        7.9375
        359.833333333333)
      Brush.Color = clGray
      Shape = qrsRectangle
    end
    object QRLabel24: TQRLabel
      Left = 683
      Top = 7
      Width = 113
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1807.10416666667
        18.5208333333333
        298.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CUENTAS ORDEN DIA'
      Color = clGray
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
    object QRShape30: TQRShape
      Left = 809
      Top = 3
      Width = 155
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2140.47916666667
        7.9375
        410.104166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel25: TQRLabel
      Left = 818
      Top = 7
      Width = 136
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2164.29166666667
        18.5208333333333
        359.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'RESULTADOS ACUMULADO'
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
    object QRLabel26: TQRLabel
      Left = 977
      Top = 7
      Width = 130
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2584.97916666667
        18.5208333333333
        343.958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CTAS ORDEN ACUMULADO'
      Color = clGray
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
    object QRShape1: TQRShape
      Left = 328
      Top = 24
      Width = 30
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        867.833333333333
        63.5
        79.375)
      Shape = qrsRectangle
    end
    object QRLabel7: TQRLabel
      Left = 330
      Top = 33
      Width = 26
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        873.125
        87.3125
        68.7916666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Estatus'
      Color = clWhite
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
    object QRLabel8: TQRLabel
      Left = 540
      Top = 34
      Width = 35
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1428.75
        89.9583333333333
        92.6041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'ICXA'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object qrPiedeGrupoProducto: TQRBand
    Left = 132
    Top = 256
    Width = 1129
    Height = 26
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrPiedeGrupoProductoAfterPrint
    AlignToBottom = False
    BeforePrint = qrPiedeGrupoProductoBeforePrint
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      68.7916666666667
      2987.14583333333)
    BandType = rbGroupFooter
    object QRExpr1: TQRExpr
      Left = 470
      Top = 14
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1243.54166666667
        37.0416666666667
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.IMP_INTERES_DIA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object qdbPieGrupo: TQRDBText
      Left = 109
      Top = 4
      Width = 232
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        288.395833333333
        10.5833333333333
        613.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'DESC_C_PRODUCTO'
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
    object QRExpr3: TQRExpr
      Left = 560
      Top = 14
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1481.66666666667
        37.0416666666667
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.IMP_INTERES_RES)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr5: TQRExpr
      Left = 605
      Top = 3
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1600.72916666667
        7.9375
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.IMP_COB_MOR)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr7: TQRExpr
      Left = 650
      Top = 14
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1719.79166666667
        37.0416666666667
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.IMP_INTERES_CO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr8: TQRExpr
      Left = 696
      Top = 3
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1841.5
        7.9375
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.IMP_MORAS)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr9: TQRExpr
      Left = 742
      Top = 14
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1963.20833333333
        37.0416666666667
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.IMP_MORA_CONDONA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr10: TQRExpr
      Left = 794
      Top = 3
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2100.79166666667
        7.9375
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.ACUM_INT_RES)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr11: TQRExpr
      Left = 846
      Top = 14
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2238.375
        37.0416666666667
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.ICXA_SDO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr12: TQRExpr
      Left = 899
      Top = 3
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2378.60416666667
        7.9375
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.ACUM_COB_MOR)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr14: TQRExpr
      Left = 950
      Top = 14
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2513.54166666667
        37.0416666666667
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.ACUM_INT_CO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr15: TQRExpr
      Left = 1002
      Top = 3
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2651.125
        7.9375
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.ACUM_MORAS)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr16: TQRExpr
      Left = 1055
      Top = 14
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2791.35416666667
        37.0416666666667
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.ACUM_MORA_CONDONA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel20: TQRLabel
      Left = 60
      Top = 4
      Width = 44
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        158.75
        10.5833333333333
        116.416666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'TOTAL'
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
    object QRExpr4: TQRExpr
      Left = 515
      Top = 3
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1362.60416666667
        7.9375
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.IMP_ICXA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object qrGrupoMoneda: TQRGroup
    Left = 132
    Top = 197
    Width = 1129
    Height = 23
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrGrupoMonedaAfterPrint
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
      60.8541666666667
      2987.14583333333)
    Expression = 'qOpeInteres.DESC_MONEDA'
    FooterBand = qrPiedeGrupoMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRShpTipoCuenta: TQRShape
      Left = 3
      Top = 2
      Width = 524
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        7.9375
        5.29166666666667
        1386.41666666667)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object qlMoneda: TQRLabel
      Left = 8
      Top = 4
      Width = 54
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        21.1666666666667
        10.5833333333333
        142.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda : '
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
    object qdbDesMoneda: TQRDBText
      Left = 112
      Top = 4
      Width = 367
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        296.333333333333
        10.5833333333333
        971.020833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clBlack
      DataSet = qOpeInteres
      DataField = 'DESC_MONEDA'
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
    object qdbCveMoneda: TQRDBText
      Left = 64
      Top = 4
      Width = 39
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        169.333333333333
        10.5833333333333
        103.1875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clBlack
      DataSet = qOpeInteres
      DataField = 'CVE_MONEDA'
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
  object qrGrupoProductoS: TQRGroup
    Left = 132
    Top = 220
    Width = 1129
    Height = 23
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrGrupoProductoSAfterPrint
    AlignToBottom = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = DetailBand1
    ParentFont = False
    Size.Values = (
      60.8541666666667
      2987.14583333333)
    FooterBand = qrPiedeGrupoProducto
    Master = Owner
    ReprintOnNewPage = False
    object qlGrupo: TQRLabel
      Left = 60
      Top = 2
      Width = 60
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        158.75
        5.29166666666667
        158.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Producto : '
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
    object qdbEncabezadoGrupo: TQRDBText
      Left = 121
      Top = 2
      Width = 376
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        320.145833333333
        5.29166666666667
        994.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qOpeInteres
      DataField = 'DESC_C_PRODUCTO'
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
  object qrPiedeGrupoMoneda: TQRBand
    Left = 132
    Top = 282
    Width = 1129
    Height = 31
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrPiedeGrupoMonedaAfterPrint
    AlignToBottom = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      82.0208333333333
      2987.14583333333)
    BandType = rbGroupFooter
    object QRShape27: TQRShape
      Left = 3
      Top = 0
      Width = 1121
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        7.9375
        0
        2965.97916666667)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRExpr2: TQRExpr
      Left = 470
      Top = 14
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1243.54166666667
        37.0416666666667
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.IMP_INTERES_DIA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel22: TQRLabel
      Left = 8
      Top = 6
      Width = 78
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        21.1666666666667
        15.875
        206.375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total Moneda '
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
    object QRDBText28: TQRDBText
      Left = 132
      Top = 6
      Width = 194
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        349.25
        15.875
        513.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clBlack
      DataSet = qOpeInteres
      DataField = 'DESC_MONEDA'
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
    object QRDBText30: TQRDBText
      Left = 90
      Top = 6
      Width = 39
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        238.125
        15.875
        103.1875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clBlack
      DataSet = qOpeInteres
      DataField = 'CVE_MONEDA'
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
    object QRExpr17: TQRExpr
      Left = 560
      Top = 14
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1481.66666666667
        37.0416666666667
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.IMP_INTERES_RES)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr19: TQRExpr
      Left = 605
      Top = 3
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1600.72916666667
        7.9375
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.IMP_COB_MOR)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr21: TQRExpr
      Left = 650
      Top = 14
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1719.79166666667
        37.0416666666667
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.IMP_INTERES_CO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr22: TQRExpr
      Left = 696
      Top = 3
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1841.5
        7.9375
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.IMP_MORAS)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr23: TQRExpr
      Left = 742
      Top = 14
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1963.20833333333
        37.0416666666667
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.IMP_MORA_CONDONA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr24: TQRExpr
      Left = 794
      Top = 3
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2100.79166666667
        7.9375
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.ACUM_INT_RES)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr25: TQRExpr
      Left = 846
      Top = 14
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2238.375
        37.0416666666667
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.ICXA_SDO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr26: TQRExpr
      Left = 899
      Top = 3
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2378.60416666667
        7.9375
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.ACUM_COB_MOR)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr28: TQRExpr
      Left = 949
      Top = 14
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2510.89583333333
        37.0416666666667
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.ACUM_INT_CO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr29: TQRExpr
      Left = 1001
      Top = 2
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2648.47916666667
        5.29166666666667
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.ACUM_MORAS)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr30: TQRExpr
      Left = 1055
      Top = 14
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2791.35416666667
        37.0416666666667
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.ACUM_MORA_CONDONA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr18: TQRExpr
      Left = 515
      Top = 3
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1362.60416666667
        7.9375
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'sum(qOpeInteres.IMP_ICXA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object qOpeInteres: TQuery
    SQL.Strings = (
      'SELECT CRED.CVE_PRODUCTO_CRE,'
      '       CRED.DESC_C_PRODUCTO,'
      '       CRED.CVE_PRESUPUESTO,'
      '       PRES.DESC_PRESUPUESTO,'
      '       CRED.CVE_MONEDA,'
      '       MON.DESC_MONEDA,'
      '       CRED.ID_CREDITO,'
      '       CRED.ID_TITULAR,'
      '       PER.NOMBRE CTE,'
      '       CRED.F_INICIO,'
      '       CRED.F_VENCIMIENTO,'
      '       FTRAS.ULT_F_CIERRE,'
      '       FTRAS.F_TRASPASO_VENC,'
      
        '       CAST((CASE WHEN CRED.ORIGEN = '#39'ICRE'#39' THEN FN_ESTADO_CRED(' +
        'TO_DATE('#39'30/03/2012'#39','#39'DD/MM/YYYY'#39'),CRED.ID_CREDITO)'
      
        '                  ELSE (CASE WHEN FTRAS.F_TRASPASO_VENC IS NOT N' +
        'ULL THEN '#39'VDO'#39
      '                             ELSE '#39'VIG'#39' END)'
      '             END) AS VARCHAR2(20) ) SITUACION,'
      '       -- IMPORTES'
      '       P.IMP_INTERES_DIA,'
      
        '       (CASE WHEN FTRAS.F_TRASPASO_VENC IS NULL THEN P.IMP_INTER' +
        'ES_RES + P.IMP_INTERES_CO ELSE P.IMP_INTERES_RES END) IMP_INTERE' +
        'S_RES, '
      
        '       (CASE WHEN FTRAS.F_TRASPASO_VENC IS NULL THEN 0 ELSE P.IM' +
        'P_INTERES_CO END) IMP_INTERES_CO, '
      '       P.IMP_INT_COB, '
      '       P.IMP_MORAS, '
      
        '       (SELECT SUM(IMP_NETO) FROM CR_TRANSACCION WHERE ID_CREDIT' +
        'O = CRED.ID_CREDITO AND CVE_OPERACION = '#39'PAGOII'#39' AND SIT_TRANSAC' +
        'CION = '#39'AC'#39' AND ID_TRANS_CANCELA IS NULL) IMP_ICXA,  '
      '       P.IMP_COB_MOR,'
      '       P.IMP_INT_CASTIGO, '
      '       P.IMP_MORA_CONDONA,'
      '      -- ACUMULADOS'
      '       ACUM.ACUM_INT_DIA, '
      
        '       (CASE WHEN FTRAS.F_TRASPASO_VENC IS NULL THEN ACUM.ACUM_I' +
        'NT_RES + ACUM.ACUM_INT_CO ELSE ACUM.ACUM_INT_RES END) ACUM_INT_R' +
        'ES, '
      
        '       (CASE WHEN FTRAS.F_TRASPASO_VENC IS NULL THEN 0 ELSE ACUM' +
        '.ACUM_INT_CO END) ACUM_INT_CO, '
      '       ACUM.ACUM_INT_COB, '
      '       ACUM.ACUM_ICXA, '
      
        '       NVL((SELECT IMP_PRE_DEVENGAR FROM CRE_PROV_DIARIA WHERE I' +
        'D_CREDITO = CRED.ID_CREDITO AND F_PROVISION = TO_DATE('#39'30/03/201' +
        '2'#39','#39'DD/MM/YYYY'#39')),0)ICXA_SDO, '
      '       ACUM.ACUM_MORAS, '
      '       ACUM.ACUM_COB_MOR, '
      '       ACUM.ACUM_INT_CASTIGO, '
      '       ACUM.ACUM_MORA_CONDONA '#9'   '
      'FROM ('
      '      SELECT '#39'ICRE'#39' AS ORIGEN,'
      '             CRCTO.CVE_PRODUCTO_CRE, '
      '             PR.DESC_C_PRODUCTO,'
      '             PR.CVE_PRESUPUESTO,  '
      '             CRCTO.CVE_MONEDA,  '
      '             CRE.ID_CREDITO, '
      '             CTO.ID_TITULAR,  '
      '             CRE.F_INICIO, '
      '             CRE.F_VENCIMIENTO '
      '      FROM CR_CONTRATO CRCTO, '
      '           CONTRATO CTO,  '
      '           CR_CREDITO CRE, '
      '           CR_PRODUCTO PR '
      '      WHERE 1=1'
      '        AND CRE.ID_CONTRATO = CTO.ID_CONTRATO '
      '        AND CRE.ID_CONTRATO = CRCTO.ID_CONTRATO  '
      '        AND CRCTO.CVE_PRODUCTO_CRE = PR.CVE_PRODUCTO_CRE'
      '        AND SIT_CREDITO <> '#39'CA'#39' '
      '      --'
      '      UNION ALL'
      '      --'
      '      SELECT '#39'INTER'#39' AS ORIGEN,'
      '             TO_CHAR(CRCTO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO,'
      '             CSTB.DESC_SUB_TIPO,'
      '             CRE.CVE_PRESUPUESTO,'
      '             CTO.CVE_MONEDA,'
      '             CRE.ID_CREDITO,'
      '             CTO.ID_TITULAR,'
      '             CRE.F_VALOR_CRED,'
      '             CRE.F_ULT_CAPITAL'
      '      FROM CRE_CREDITO CRE,'
      '           CRE_CONTRATO CRCTO, '
      '           CRE_SUB_TIP_BCO CSTB,'
      '      '#9' CONTRATO CTO'
      '      WHERE 1= 1'
      '        AND CRE.SIT_CREDITO       NOT IN ('#39'CA'#39', '#39'TA'#39')'
      '        AND CRCTO.ID_CONTRATO     = CRE.ID_CONTRATO'
      '        AND CRCTO.ID_CONTRATO     = CTO.ID_CONTRATO    '
      '        AND CRCTO.CVE_SUB_TIP_BCO = CSTB.CVE_SUB_TIP_BCO'
      '     ) CRED,'
      '       -- FECHA TRASPASO PERIODO'
      '     (SELECT A.ID_CREDITO, A.ULT_F_CIERRE, B.F_TRASPASO_VENC'
      '        FROM ( SELECT ID_CREDITO, MAX(F_CIERRE) ULT_F_CIERRE'
      '                 FROM CR_HISTO_INTERES'
      
        '                WHERE F_CIERRE BETWEEN TO_DATE('#39'01/03/2012'#39','#39'DD/' +
        'MM/YYYY'#39') AND TO_DATE('#39'30/03/2012'#39','#39'DD/MM/YYYY'#39')'
      '                GROUP BY ID_CREDITO ) A,'
      '             ( SELECT ID_CREDITO, F_CIERRE, F_TRASPASO_VENC'
      '                 FROM CR_HISTO_INTERES'
      
        '                WHERE F_CIERRE BETWEEN TO_DATE('#39'01/03/2012'#39','#39'DD/' +
        'MM/YYYY'#39') AND TO_DATE('#39'30/03/2012'#39','#39'DD/MM/YYYY'#39') ) B'
      '       WHERE A.ID_CREDITO = B.ID_CREDITO'
      '         AND A.ULT_F_CIERRE = B.F_CIERRE'
      '     ) FTRAS,'
      '     -- PERIODO '
      '     (SELECT HI.ID_CREDITO, '
      '     -- IMPORTES '
      
        '             SUM(HI.IMP_INTERES_DIA + HI.IMP_AJUSTE_IN) IMP_INTE' +
        'RES_DIA, '
      
        '             SUM(CASE WHEN HI.F_TRASPASO_VENC IS NULL THEN HI.IM' +
        'P_INTERES_DIA + HI.IMP_AJUSTE_IN ELSE 0 END) IMP_INTERES_RES, '
      
        '             SUM(CASE WHEN HI.F_TRASPASO_VENC IS NOT NULL THEN H' +
        'I.IMP_INTERES_DIA + HI.IMP_AJUSTE_IN ELSE 0 END) IMP_INTERES_CO,' +
        ' '
      '             SUM(HI.IMP_INT_COB) IMP_INT_COB, '
      
        '             SUM((HI.IMP_MOR_CP + HI.IMP_MOR_AJ_CP) + (HI.IMP_MO' +
        'R_FN + HI.IMP_MOR_AJ_FN) + (HI.IMP_MOR_CN + HI.IMP_MOR_AJ_CN)) I' +
        'MP_MORAS, '
      '             SUM(HI.IMP_ICXA) IMP_ICXA, '
      
        '             SUM(HI.IMP_COB_MCP + HI.IMP_COB_MFN + HI.IMP_COB_MC' +
        'N) IMP_COB_MOR, '
      '             SUM(HI.IMP_INT_CAS) IMP_INT_CASTIGO, '
      '             SUM(HI.IMP_MOR_COND) IMP_MORA_CONDONA '
      '      FROM CR_HISTO_INTERES HI '
      
        '      WHERE HI.F_CIERRE BETWEEN TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY' +
        #39') AND TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39')'
      '      GROUP BY HI.ID_CREDITO'
      '     ) P, '
      '     -- ACUMULADOS '
      '     (SELECT HI.ID_CREDITO, '
      '      -- IMPORTES '
      
        '             SUM(HI.IMP_INTERES_DIA + HI.IMP_AJUSTE_IN) ACUM_INT' +
        '_DIA, '
      
        '             SUM(CASE WHEN HI.F_TRASPASO_VENC IS NULL THEN HI.IM' +
        'P_INTERES_DIA + HI.IMP_AJUSTE_IN ELSE 0 END) ACUM_INT_RES, '
      
        '             SUM(CASE WHEN HI.F_TRASPASO_VENC IS NOT NULL THEN H' +
        'I.IMP_INTERES_DIA + HI.IMP_AJUSTE_IN ELSE 0 END) ACUM_INT_CO, '
      '             SUM(HI.IMP_INT_COB) ACUM_INT_COB, '
      '             SUM(HI.IMP_ICXA) ACUM_ICXA, '
      
        '             SUM((HI.IMP_MOR_CP + HI.IMP_MOR_AJ_CP) + (HI.IMP_MO' +
        'R_FN + HI.IMP_MOR_AJ_FN) + (HI.IMP_MOR_CN + HI.IMP_MOR_AJ_CN)) A' +
        'CUM_MORAS, '
      
        '             SUM(HI.IMP_COB_MCP + HI.IMP_COB_MFN + HI.IMP_COB_MC' +
        'N) ACUM_COB_MOR, '
      '             SUM(HI.IMP_INT_CAS) ACUM_INT_CASTIGO, '
      '             SUM(HI.IMP_MOR_COND) ACUM_MORA_CONDONA '
      '      FROM CR_HISTO_INTERES HI '
      
        '      WHERE HI.F_CIERRE BETWEEN TO_DATE('#39'01/01/2012'#39','#39'DD/MM/YYYY' +
        #39') AND TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39')'
      '      GROUP BY HI.ID_CREDITO'
      '     ) ACUM, '
      #9' PERSONA PER,'
      #9' CRE_PRESUPUESTO PRES,'
      #9' MONEDA MON'#9' '
      'WHERE CRED.ID_TITULAR = PER.ID_PERSONA'
      '  AND CRED.ID_CREDITO = FTRAS.ID_CREDITO'
      '  AND CRED.CVE_MONEDA = MON.CVE_MONEDA'
      '  AND CRED.CVE_PRESUPUESTO = PRES.CVE_PRESUPUESTO'
      '  AND CRED.ID_CREDITO = P.ID_CREDITO'
      '  AND CRED.ID_CREDITO = ACUM.ID_CREDITO'
      '  AND CRED.ID_CREDITO = 207262'
      'ORDER BY MON.DESC_MONEDA, CRED.ID_CREDITO'
      ' '
      ' '
      ' ')
    Left = 56
    Top = 16
    object qOpeInteresCVE_PRODUCTO_CRE: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 40
    end
    object qOpeInteresDESC_C_PRODUCTO: TStringField
      FieldName = 'DESC_C_PRODUCTO'
      Size = 250
    end
    object qOpeInteresCVE_PRESUPUESTO: TStringField
      FieldName = 'CVE_PRESUPUESTO'
      Size = 6
    end
    object qOpeInteresDESC_PRESUPUESTO: TStringField
      FieldName = 'DESC_PRESUPUESTO'
      Size = 40
    end
    object qOpeInteresCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qOpeInteresDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qOpeInteresID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qOpeInteresID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object qOpeInteresCTE: TStringField
      FieldName = 'CTE'
      Size = 80
    end
    object qOpeInteresF_INICIO: TDateTimeField
      FieldName = 'F_INICIO'
    end
    object qOpeInteresF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qOpeInteresULT_F_CIERRE: TDateTimeField
      FieldName = 'ULT_F_CIERRE'
    end
    object qOpeInteresF_TRASPASO_VENC: TDateTimeField
      FieldName = 'F_TRASPASO_VENC'
    end
    object qOpeInteresSITUACION: TStringField
      FieldName = 'SITUACION'
    end
    object qOpeInteresIMP_INTERES_DIA: TFloatField
      FieldName = 'IMP_INTERES_DIA'
    end
    object qOpeInteresIMP_INTERES_RES: TFloatField
      FieldName = 'IMP_INTERES_RES'
    end
    object qOpeInteresIMP_INTERES_CO: TFloatField
      FieldName = 'IMP_INTERES_CO'
    end
    object qOpeInteresIMP_INT_COB: TFloatField
      FieldName = 'IMP_INT_COB'
    end
    object qOpeInteresIMP_MORAS: TFloatField
      FieldName = 'IMP_MORAS'
    end
    object qOpeInteresIMP_ICXA: TFloatField
      FieldName = 'IMP_ICXA'
    end
    object qOpeInteresIMP_COB_MOR: TFloatField
      FieldName = 'IMP_COB_MOR'
    end
    object qOpeInteresIMP_INT_CASTIGO: TFloatField
      FieldName = 'IMP_INT_CASTIGO'
    end
    object qOpeInteresIMP_MORA_CONDONA: TFloatField
      FieldName = 'IMP_MORA_CONDONA'
    end
    object qOpeInteresACUM_INT_DIA: TFloatField
      FieldName = 'ACUM_INT_DIA'
    end
    object qOpeInteresACUM_INT_RES: TFloatField
      FieldName = 'ACUM_INT_RES'
    end
    object qOpeInteresACUM_INT_CO: TFloatField
      FieldName = 'ACUM_INT_CO'
    end
    object qOpeInteresACUM_INT_COB: TFloatField
      FieldName = 'ACUM_INT_COB'
    end
    object qOpeInteresACUM_ICXA: TFloatField
      FieldName = 'ACUM_ICXA'
    end
    object qOpeInteresICXA_SDO: TFloatField
      FieldName = 'ICXA_SDO'
    end
    object qOpeInteresACUM_MORAS: TFloatField
      FieldName = 'ACUM_MORAS'
    end
    object qOpeInteresACUM_COB_MOR: TFloatField
      FieldName = 'ACUM_COB_MOR'
    end
    object qOpeInteresACUM_INT_CASTIGO: TFloatField
      FieldName = 'ACUM_INT_CASTIGO'
    end
    object qOpeInteresACUM_MORA_CONDONA: TFloatField
      FieldName = 'ACUM_MORA_CONDONA'
    end
  end
end
