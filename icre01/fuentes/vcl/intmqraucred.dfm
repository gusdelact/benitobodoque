object QrAuCred: TQrAuCred
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qyRelAutCred
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
  object DetailBand1: TQRBand
    Left = 48
    Top = 188
    Width = 960
    Height = 8
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
      21.1666666666667
      2540)
    BandType = rbDetail
    object QRDBText8: TQRDBText
      Left = 3
      Top = 0
      Width = 43
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        7.9375
        0
        113.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'ID_CONTRATO'
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
    object QRDBText1: TQRDBText
      Left = 51
      Top = 0
      Width = 152
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        134.9375
        0
        402.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRelAutCred
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
    object QRDBText2: TQRDBText
      Left = 208
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
        550.333333333333
        0
        142.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'TIPO_AUTORIZACION'
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
    object QRDBText22: TQRDBText
      Left = 556
      Top = 0
      Width = 31
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1471.08333333333
        0
        82.0208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'DIAS_PLAZO'
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
    object QRDBText23: TQRDBText
      Left = 592
      Top = 0
      Width = 42
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1566.33333333333
        0
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRelAutCred
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
      Left = 509
      Top = 0
      Width = 42
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1346.72916666667
        0
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'F_AUT_COMITE'
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
      Left = 450
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
        1190.625
        0
        142.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'REV'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '$ ###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText27: TQRDBText
      Left = 925
      Top = 0
      Width = 31
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2447.39583333333
        0
        82.0208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'SIT_LINEA'
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
    object QRDBText5: TQRDBText
      Left = 267
      Top = 0
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        706.4375
        0
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'IMP_AUTORIZADO'
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
    object QRDBText6: TQRDBText
      Left = 328
      Top = 0
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        867.833333333333
        0
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'IMP_DISPUESTO'
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
    object QRDBText25: TQRDBText
      Left = 389
      Top = 0
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1029.22916666667
        0
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'IMP_POR_DISP'
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
    object QRDBText10: TQRDBText
      Left = 733
      Top = 0
      Width = 59
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1939.39583333333
        0
        156.104166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'IMP_INC_DEC'
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
    object QRDBText12: TQRDBText
      Left = 797
      Top = 0
      Width = 59
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2108.72916666667
        0
        156.104166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'IMP_TOT_AUT'
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
      Left = 861
      Top = 0
      Width = 59
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2278.0625
        0
        156.104166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'IMP_TOT_DIS'
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
      Left = 686
      Top = 0
      Width = 42
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1815.04166666667
        0
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'F_VENCTO_INCDEC'
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
    object QRDBText15: TQRDBText
      Left = 639
      Top = 0
      Width = 42
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1690.6875
        0
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'F_INI_INCDEC'
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
  object PFooterProducto: TQRBand
    Left = 48
    Top = 214
    Width = 960
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = PFooterProductoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      39.6875
      2540)
    BandType = rbGroupFooter
    object QRExpr30: TQRExpr
      Left = 80
      Top = 0
      Width = 26
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        211.666666666667
        0
        68.7916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
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
      Expression = 'COUNT'
      FontSize = 5
    end
    object QRLabel12: TQRLabel
      Left = 4
      Top = 0
      Width = 51
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        10.5833333333333
        0
        134.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Autorizaciones'
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
    object QRLabel23: TQRLabel
      Left = 115
      Top = 0
      Width = 58
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        304.270833333333
        0
        153.458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total de Producto'
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
    object lbTIPO_CAMBIO: TQRLabel
      Left = 232
      Top = 0
      Width = 25
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        613.833333333333
        0
        66.1458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tipo Cambio'
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
    object qrlTCambio: TQRLabel
      Left = 176
      Top = 0
      Width = 55
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        465.666666666667
        0
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tipo de Cambio:'
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
    object QRExpr12: TQRExpr
      Left = 267
      Top = 0
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        706.4375
        0
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_AUTORIZADO_MN)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr10: TQRExpr
      Left = 328
      Top = 0
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        867.833333333333
        0
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_DISPUESTO_MN)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr11: TQRExpr
      Left = 389
      Top = 0
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1029.22916666667
        0
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_POR_DISP_MN)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr15: TQRExpr
      Left = 800
      Top = 0
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2116.66666666667
        0
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_TOT_AUT_MN)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr16: TQRExpr
      Left = 861
      Top = 0
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2278.0625
        0
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_TOT_DIS_MN)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr14: TQRExpr
      Left = 739
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
        1955.27083333333
        2.64583333333333
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_INC_DEC_MN)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object QRGroupProducto: TQRGroup
    Left = 48
    Top = 158
    Width = 960
    Height = 10
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = True
    Size.Values = (
      26.4583333333333
      2540)
    Expression = 'qyRelAutCred.CVE_PRODUCTO_CRE'
    FooterBand = PFooterProducto
    Master = Owner
    ReprintOnNewPage = False
    object QRShape6: TQRShape
      Left = 0
      Top = 0
      Width = 521
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        0
        0
        1378.47916666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRDBText17: TQRDBText
      Left = 101
      Top = 1
      Width = 82
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        267.229166666667
        2.64583333333333
        216.958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'DESC_L_PRODUCTO'
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
    object QRDBText3: TQRDBText
      Left = 44
      Top = 1
      Width = 52
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        116.416666666667
        2.64583333333333
        137.583333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'CVE_PRODUCTO_CRE'
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
    object QRLabel5: TQRLabel
      Left = 3
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
        7.9375
        2.64583333333333
        95.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
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
  end
  object ColumnHeaderBand1: TQRBand
    Left = 48
    Top = 132
    Width = 960
    Height = 26
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
      68.7916666666667
      2540)
    BandType = rbColumnHeader
    object QRShape1: TQRShape
      Left = 0
      Top = 0
      Width = 49
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        0
        0
        129.645833333333)
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 3
      Top = 1
      Width = 43
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        7.9375
        2.64583333333333
        113.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Autorización'
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
    object QRShape2: TQRShape
      Left = 48
      Top = 0
      Width = 158
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        127
        0
        418.041666666667)
      Shape = qrsRectangle
    end
    object QRLabel13: TQRLabel
      Left = 51
      Top = 1
      Width = 151
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        134.9375
        2.64583333333333
        399.520833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Acreditado'
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
      Left = 205
      Top = 0
      Width = 60
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        542.395833333333
        0
        158.75)
      Shape = qrsRectangle
    end
    object QRLabel15: TQRLabel
      Left = 208
      Top = 1
      Width = 54
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        550.333333333333
        2.64583333333333
        142.875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tipo de Autorización'
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
    object QRShape4: TQRShape
      Left = 447
      Top = 0
      Width = 60
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1182.6875
        0
        158.75)
      Shape = qrsRectangle
    end
    object QRLabel17: TQRLabel
      Left = 450
      Top = 1
      Width = 54
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        1190.625
        2.64583333333333
        142.875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Revolvente'
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
    object QRShape5: TQRShape
      Left = 506
      Top = 0
      Width = 48
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1338.79166666667
        0
        127)
      Shape = qrsRectangle
    end
    object QRLabel18: TQRLabel
      Left = 508
      Top = 1
      Width = 44
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        1344.08333333333
        2.64583333333333
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha de Autorización de Comité'
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
    object QRShape8: TQRShape
      Left = 553
      Top = 0
      Width = 37
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1463.14583333333
        0
        97.8958333333333)
      Shape = qrsRectangle
    end
    object QRLabel24: TQRLabel
      Left = 556
      Top = 1
      Width = 31
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        1471.08333333333
        2.64583333333333
        82.0208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Plazo'
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
    object QRShape9: TQRShape
      Left = 589
      Top = 0
      Width = 48
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1558.39583333333
        0
        127)
      Shape = qrsRectangle
    end
    object QRLabel25: TQRLabel
      Left = 592
      Top = 1
      Width = 42
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        1566.33333333333
        2.64583333333333
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha de Vencimiento'
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
    object QRShape12: TQRShape
      Left = 264
      Top = 0
      Width = 62
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        698.5
        0
        164.041666666667)
      Shape = qrsRectangle
    end
    object QRLabel29: TQRLabel
      Left = 267
      Top = 1
      Width = 56
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        706.4375
        2.64583333333333
        148.166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Importe Autorizado'
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
    object QRShape13: TQRShape
      Left = 325
      Top = 0
      Width = 62
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        859.895833333333
        0
        164.041666666667)
      Shape = qrsRectangle
    end
    object QRLabel30: TQRLabel
      Left = 328
      Top = 1
      Width = 56
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        867.833333333333
        2.64583333333333
        148.166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Importe Dispuesto'
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
    object QRShape14: TQRShape
      Left = 386
      Top = 0
      Width = 62
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1021.29166666667
        0
        164.041666666667)
      Shape = qrsRectangle
    end
    object QRLabel31: TQRLabel
      Left = 389
      Top = 1
      Width = 56
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        1029.22916666667
        2.64583333333333
        148.166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Importe por Disponer'
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
    object QRShape19: TQRShape
      Left = 922
      Top = 0
      Width = 37
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        2439.45833333333
        0
        97.8958333333333)
      Shape = qrsRectangle
    end
    object QRLabel36: TQRLabel
      Left = 925
      Top = 1
      Width = 31
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        2447.39583333333
        2.64583333333333
        82.0208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Situación'
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
    object QRShape11: TQRShape
      Left = 636
      Top = 0
      Width = 48
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1682.75
        0
        127)
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Left = 638
      Top = 1
      Width = 44
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        1688.04166666667
        2.64583333333333
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Inicio Incremento'
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
    object QRShape15: TQRShape
      Left = 683
      Top = 0
      Width = 48
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1807.10416666667
        0
        127)
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 685
      Top = 1
      Width = 44
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        1812.39583333333
        2.64583333333333
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Vencto. Incremento'
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
    object QRShape16: TQRShape
      Left = 794
      Top = 0
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        2100.79166666667
        0
        171.979166666667)
      Shape = qrsRectangle
    end
    object QRLabel4: TQRLabel
      Left = 797
      Top = 1
      Width = 59
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        2108.72916666667
        2.64583333333333
        156.104166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Total Autorizado a Disponer'
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
    object QRShape17: TQRShape
      Left = 858
      Top = 0
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        2270.125
        0
        171.979166666667)
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 863
      Top = 1
      Width = 55
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        2283.35416666667
        2.64583333333333
        145.520833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Total Disponible por Inc. / Dec.'
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
    object QRShape18: TQRShape
      Left = 730
      Top = 0
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1931.45833333333
        0
        171.979166666667)
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Left = 735
      Top = 1
      Width = 55
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        1944.6875
        2.64583333333333
        145.520833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Importe del Incremento / Decremento'
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
    Top = 168
    Width = 960
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
      2540)
    Expression = 'qyRelAutCred.CVE_MONEDA'
    FooterBand = QRBandMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRShape7: TQRShape
      Left = 16
      Top = 0
      Width = 561
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        42.3333333333333
        0
        1484.3125)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRDBText7: TQRDBText
      Left = 104
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
        275.166666666667
        2.64583333333333
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyRelAutCred
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
    object QRDBText4: TQRDBText
      Left = 58
      Top = 1
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        153.458333333333
        2.64583333333333
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRelAutCred
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
    object QRLabel1: TQRLabel
      Left = 24
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
        63.5
        2.64583333333333
        82.0208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
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
  end
  object QRGroupPromotor: TQRGroup
    Left = 48
    Top = 178
    Width = 960
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
      2540)
    Expression = 'qyRelAutCred.ID_PERS_ASOCIAD'
    FooterBand = QRBandPromotor
    Master = Owner
    ReprintOnNewPage = False
    object QRShape10: TQRShape
      Left = 32
      Top = 0
      Width = 688
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        84.6666666666667
        0
        1820.33333333333)
      Shape = qrsRectangle
    end
    object QRLabel26: TQRLabel
      Left = 40
      Top = 0
      Width = 73
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        105.833333333333
        0
        193.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'Promotor Asociado'
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
    object QRDBText31: TQRDBText
      Left = 171
      Top = 0
      Width = 71
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        452.4375
        0
        187.854166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'NOM_PROMOTOR'
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
    object QRDBText9: TQRDBText
      Left = 117
      Top = 0
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        309.5625
        0
        132.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyRelAutCred
      DataField = 'ID_PERS_ASOCIAD'
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
  object QRBandPromotor: TQRBand
    Left = 48
    Top = 196
    Width = 960
    Height = 9
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
      23.8125
      2540)
    BandType = rbGroupFooter
    object QRLabel11: TQRLabel
      Left = 40
      Top = 1
      Width = 51
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        105.833333333333
        2.64583333333333
        134.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Autorizaciones'
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
    object QRExpr1: TQRExpr
      Left = 115
      Top = 1
      Width = 26
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        304.270833333333
        2.64583333333333
        68.7916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
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
      Expression = 'COUNT'
      FontSize = 5
    end
    object QRExpr6: TQRExpr
      Left = 267
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
        706.4375
        2.64583333333333
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_AUTORIZADO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr4: TQRExpr
      Left = 328
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
        867.833333333333
        2.64583333333333
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_DISPUESTO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr5: TQRExpr
      Left = 389
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
        1029.22916666667
        2.64583333333333
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_POR_DISP)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRLabel14: TQRLabel
      Left = 154
      Top = 1
      Width = 59
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        407.458333333333
        2.64583333333333
        156.104166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total de Promotor'
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
    object QRExpr2: TQRExpr
      Left = 739
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
        1955.27083333333
        2.64583333333333
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_INC_DEC)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr3: TQRExpr
      Left = 800
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
        2116.66666666667
        2.64583333333333
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_TOT_AUT)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr7: TQRExpr
      Left = 861
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
        2278.0625
        2.64583333333333
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_TOT_DIS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object QRBandMoneda: TQRBand
    Left = 48
    Top = 205
    Width = 960
    Height = 9
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
      23.8125
      2540)
    BandType = rbGroupFooter
    object QRExpr21: TQRExpr
      Left = 389
      Top = 0
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1029.22916666667
        0
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_POR_DISP)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr22: TQRExpr
      Left = 328
      Top = 0
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        867.833333333333
        0
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_DISPUESTO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr23: TQRExpr
      Left = 267
      Top = 0
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        706.4375
        0
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_AUTORIZADO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr24: TQRExpr
      Left = 100
      Top = 0
      Width = 26
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        264.583333333333
        0
        68.7916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
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
      Expression = 'COUNT'
      FontSize = 5
    end
    object QRLabel7: TQRLabel
      Left = 25
      Top = 0
      Width = 51
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        66.1458333333333
        0
        134.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Autorizaciones'
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
    object QRLabel21: TQRLabel
      Left = 149
      Top = 0
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        394.229166666667
        0
        140.229166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total de Moneda'
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
      Left = 739
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
        1955.27083333333
        2.64583333333333
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_INC_DEC)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr9: TQRExpr
      Left = 800
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
        2116.66666666667
        2.64583333333333
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_TOT_AUT)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr13: TQRExpr
      Left = 861
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
        2278.0625
        2.64583333333333
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
      Expression = 'SUM(qyRelAutCred.IMP_TOT_DIS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object qyRelAutCred: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'SELECT            '
      
        '    CCTO.ID_CONTRATO,                                           ' +
        '        '
      #9#9'P.NOMBRE,            '
      
        #9#9'CCTO.IMP_AUTORIZADO,                                          ' +
        '      '
      
        #9#9'( CCTO.IMP_AUTORIZADO * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  TO_DA' +
        'TE('#39'31/07/2006'#39','#39'DD/MM/YYYY'#39') , CTO.CVE_MONEDA, '#39'V'#39'), 1 ))) IMP_' +
        'AUTORIZADO_MN,                '
      
        #9#9'CCTO.IMP_DISPUESTO,                                           ' +
        '      '
      
        #9#9'( CCTO.IMP_DISPUESTO * ( NVL( PKGCORPO.OBTTIPOCAMBIO (   TO_DA' +
        'TE('#39'31/07/2006'#39','#39'DD/MM/YYYY'#39') , CTO.CVE_MONEDA, '#39'V'#39'), 1 ))) IMP_' +
        'DISPUESTO_MN,                 '
      
        #9#9'( CCTO.IMP_AUTORIZADO - CCTO.IMP_DISPUESTO) IMP_POR_DISP,     ' +
        '      '
      
        #9#9'( CCTO.IMP_AUTORIZADO * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  TO_DA' +
        'TE('#39'31/07/2006'#39','#39'DD/MM/YYYY'#39') , CTO.CVE_MONEDA, '#39'V'#39'), 1 ))) - '
      
        #9#9'( CCTO.IMP_DISPUESTO * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  TO_DAT' +
        'E('#39'31/07/2006'#39','#39'DD/MM/YYYY'#39') , CTO.CVE_MONEDA, '#39'V'#39'), 1 ))) IMP_P' +
        'OR_DISP_MN,                  '
      
        #9#9'DECODE(CCTO.B_EVENTUAL,'#39'V'#39','#39'EVENTUAL'#39','#39'NO EVENTUAL'#39') TIPO_AUTO' +
        'RIZACION,            '
      
        #9#9'DECODE(CCTO.B_REVOLVENTE,'#39'V'#39','#39'REVOLVENTE'#39','#39'NO REVOLVENTE'#39') REV' +
        ',            '
      #9#9'CCTO.F_AUT_COMITE,                 '
      #9#9'CCTO.DIAS_PLAZO,                   '
      #9#9'CCTO.F_VENCIMIENTO,                '
      #9#9'CCTO.F_AUT_COMITE AS F_INI_INCDEC,                 '
      #9#9'CCTO.F_VENCIMIENTO AS F_VENCTO_INCDEC,             '
      #9#9'CCTO.IMP_AUTORIZADO AS IMP_INC_DEC,                '
      
        #9#9'( CCTO.IMP_AUTORIZADO * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  TO_DA' +
        'TE('#39'31/07/2006'#39','#39'DD/MM/YYYY'#39') , CTO.CVE_MONEDA, '#39'V'#39'), 1 ))) IMP_' +
        'INC_DEC_MN,                '
      
        #9#9'(CCTO.IMP_AUTORIZADO + CCTO.IMP_AUTORIZADO) AS IMP_TOT_AUT,   ' +
        '             '
      
        #9#9'( CCTO.IMP_AUTORIZADO * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  TO_DA' +
        'TE('#39'31/07/2006'#39','#39'DD/MM/YYYY'#39') , CTO.CVE_MONEDA, '#39'V'#39'), 1 ))) + '
      
        #9#9'( CCTO.IMP_AUTORIZADO * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  TO_DA' +
        'TE('#39'31/07/2006'#39','#39'DD/MM/YYYY'#39') , CTO.CVE_MONEDA, '#39'V'#39'), 1 ))) AS I' +
        'MP_TOT_AUT_MN,                  '
      
        #9#9'CCTO.IMP_AUTORIZADO + CCTO.IMP_AUTORIZADO - CCTO.IMP_DISPUESTO' +
        ' AS    IMP_TOT_DIS,                '
      
        #9#9'( CCTO.IMP_AUTORIZADO * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  TO_DA' +
        'TE('#39'31/07/2006'#39','#39'DD/MM/YYYY'#39') , CTO.CVE_MONEDA, '#39'V'#39'), 1 ))) + '
      
        #9#9'( CCTO.IMP_AUTORIZADO * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  TO_DA' +
        'TE('#39'31/07/2006'#39','#39'DD/MM/YYYY'#39') , CTO.CVE_MONEDA, '#39'V'#39'), 1 ))) - '
      
        #9#9'( CCTO.IMP_DISPUESTO * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  TO_DAT' +
        'E('#39'31/07/2006'#39','#39'DD/MM/YYYY'#39') , CTO.CVE_MONEDA, '#39'V'#39'), 1 ))) AS  I' +
        'MP_TOT_DIS_MN,                  '
      
        #9#9'DECODE(SIGN((CCTO.IMP_AUTORIZADO + CCTO.IMP_AUTORIZADO) - CCTO' +
        '.IMP_DISPUESTO),-1,'#39'SG'#39',CCTO.SIT_LINEA) AS SIT_LINEA,           ' +
        '       '
      #9#9'CPR.DESC_L_PRODUCTO,               '
      #9#9'M.DESC_MONEDA,                     '
      #9#9'PPR.NOMBRE NOM_PROMOTOR,           '
      #9#9'CTO.CVE_MONEDA,                    '
      #9#9'CPR.CVE_PRODUCTO_CRE,              '
      #9#9'CTO.ID_PERS_ASOCIAD      '
      'FROM            '
      '    (SELECT * FROM CONTRATO) CTO,           '
      #9#9'(SELECT * FROM PERSONA) P,            '
      #9#9'CR_CONTRATO CCTO,            '
      #9#9'CR_PRODUCTO CPR,            '
      #9#9'(SELECT * FROM PERSONA) PPR,            '
      #9#9'MONEDA          M    '
      'WHERE 1=1  AND P.ID_PERSONA         = CTO.ID_TITULAR    '
      '    AND CCTO.ID_CONTRATO     = CTO.ID_CONTRATO   '
      #9#9'AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE  '
      #9#9'AND PPR.ID_PERSONA       = CTO.ID_PERS_ASOCIAD  '
      #9#9'AND M.CVE_MONEDA         = CTO.CVE_MONEDA '
      #9#9'AND   CPR.ID_EMPRESA =2 '
      
        'ORDER BY CPR.DESC_L_PRODUCTO,M.DESC_MONEDA,NOM_PROMOTOR,CCTO.ID_' +
        'CONTRATO,NOMBRE '
      ''
      '')
    Left = 235
    Top = 13
    object qyRelAutCredCVE_PRODUCTO_CRE: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 6
    end
    object qyRelAutCredDESC_L_PRODUCTO: TStringField
      FieldName = 'DESC_L_PRODUCTO'
      Size = 80
    end
    object qyRelAutCredCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyRelAutCredDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
      Size = 50
    end
    object qyRelAutCredID_PERS_ASOCIAD: TFloatField
      FieldName = 'ID_PERS_ASOCIAD'
    end
    object qyRelAutCredNOM_PROMOTOR: TStringField
      FieldName = 'NOM_PROMOTOR'
      Size = 100
    end
    object qyRelAutCredID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qyRelAutCredNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 100
    end
    object qyRelAutCredTIPO_AUTORIZACION: TStringField
      FieldName = 'TIPO_AUTORIZACION'
      Size = 15
    end
    object qyRelAutCredIMP_AUTORIZADO: TFloatField
      FieldName = 'IMP_AUTORIZADO'
    end
    object qyRelAutCredIMP_AUTORIZADO_MN: TFloatField
      FieldName = 'IMP_AUTORIZADO_MN'
    end
    object qyRelAutCredIMP_DISPUESTO: TFloatField
      FieldName = 'IMP_DISPUESTO'
    end
    object qyRelAutCredIMP_DISPUESTO_MN: TFloatField
      FieldName = 'IMP_DISPUESTO_MN'
    end
    object qyRelAutCredIMP_POR_DISP: TFloatField
      FieldName = 'IMP_POR_DISP'
    end
    object qyRelAutCredIMP_POR_DISP_MN: TFloatField
      FieldName = 'IMP_POR_DISP_MN'
    end
    object qyRelAutCredREV: TStringField
      FieldName = 'REV'
      Size = 10
    end
    object qyRelAutCredDIAS_PLAZO: TFloatField
      FieldName = 'DIAS_PLAZO'
    end
    object qyRelAutCredSIT_LINEA: TStringField
      FieldName = 'SIT_LINEA'
      Size = 5
    end
    object qyRelAutCredF_AUT_COMITE: TDateTimeField
      FieldName = 'F_AUT_COMITE'
    end
    object qyRelAutCredF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qyRelAutCredF_INI_INCDEC: TDateTimeField
      FieldName = 'F_INI_INCDEC'
    end
    object qyRelAutCredF_VENCTO_INCDEC: TDateTimeField
      FieldName = 'F_VENCTO_INCDEC'
    end
    object qyRelAutCredIMP_INC_DEC: TFloatField
      FieldName = 'IMP_INC_DEC'
    end
    object qyRelAutCredIMP_INC_DEC_MN: TFloatField
      FieldName = 'IMP_INC_DEC_MN'
    end
    object qyRelAutCredIMP_TOT_AUT: TFloatField
      FieldName = 'IMP_TOT_AUT'
    end
    object qyRelAutCredIMP_TOT_AUT_MN: TFloatField
      FieldName = 'IMP_TOT_AUT_MN'
    end
    object qyRelAutCredIMP_TOT_DIS: TFloatField
      FieldName = 'IMP_TOT_DIS'
    end
    object qyRelAutCredIMP_TOT_DIS_MN: TFloatField
      FieldName = 'IMP_TOT_DIS_MN'
    end
  end
end
