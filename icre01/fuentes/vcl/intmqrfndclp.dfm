object QrFndCLP: TQrFndCLP
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
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
  PrintIfEmpty = False
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
      NomReporte = 'IntMQrFndCLP'
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
  object QRFootF_PROVISION: TQRBand
    Left = 48
    Top = 283
    Width = 960
    Height = 1
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
      2.64583333333333
      2540)
    BandType = rbGroupFooter
  end
  object QRBand4: TQRBand
    Left = 48
    Top = 132
    Width = 960
    Height = 1
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clScrollBar
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      2.64583333333333
      2540)
    BandType = rbColumnHeader
    object QRLabel10: TQRLabel
      Left = 882
      Top = 2
      Width = 65
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2333.625
        5.29166666666667
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Saldo Final'
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
      Left = 216
      Top = 2
      Width = 40
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        571.5
        5.29166666666667
        105.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Divisa'
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
    object QRLabel13: TQRLabel
      Left = 306
      Top = 2
      Width = 67
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        809.625
        5.29166666666667
        177.270833333333)
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
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel21: TQRLabel
      Left = 476
      Top = 2
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1259.41666666667
        5.29166666666667
        158.75)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Plazo Fondeo'
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
      Left = 684
      Top = 2
      Width = 66
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1809.75
        5.29166666666667
        174.625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Saldo Inicial'
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
      Left = 760
      Top = 2
      Width = 87
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2010.83333333333
        5.29166666666667
        230.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Amortización a Capital'
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
    object QRLabel19: TQRLabel
      Left = 486
      Top = 12
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1285.875
        31.75
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '(Meses)'
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
    object QRLabel5: TQRLabel
      Left = 385
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
        1018.64583333333
        5.29166666666667
        179.916666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Término'
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
    object QRLabel12: TQRLabel
      Left = 553
      Top = 2
      Width = 83
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1463.14583333333
        5.29166666666667
        219.604166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Próx. Venc.'
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
    object QRLabel14: TQRLabel
      Left = 571
      Top = 12
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1510.77083333333
        31.75
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '(Meses)'
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
    Top = 133
    Width = 960
    Height = 3
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
      7.9375
      2540)
    BandType = rbColumnHeader
  end
  object QRFooterEntidad: TQRBand
    Left = 48
    Top = 255
    Width = 960
    Height = 28
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRFooterEntidadAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      74.0833333333333
      2540)
    BandType = rbGroupFooter
    object QRLMontoDispuesto: TQRLabel
      Left = 669
      Top = 2
      Width = 66
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1770.0625
        5.29166666666667
        174.625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Monto Dispuesto'
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
    object QRLMontoDisponible: TQRLabel
      Left = 669
      Top = 16
      Width = 68
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1770.0625
        42.3333333333333
        179.916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Monto Disponible'
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
    object QREXPAMOR_CAP_FA_VALTotal: TQRExpr
      Left = 771
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
        2039.9375
        5.29166666666667
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.AMOR_CAP_FA_VAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QREXPMONTODISPONIBLETotal: TQRExpr
      Left = 771
      Top = 16
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2039.9375
        42.3333333333333
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'qyConsulta.MONTO_LIN - SUM(qyConsulta.AMOR_CAP_FA_VAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object qrDetalle: TQRBand
    Left = 48
    Top = 227
    Width = 960
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = qrDetalleAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      31.75
      2540)
    BandType = rbDetail
    object QRDBTDESC_MONEDA: TQRDBText
      Left = 221
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
        584.729166666667
        2.64583333333333
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_MONEDA'
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
    object QRDBTF_INI_PER_REP: TQRDBText
      Left = 318
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        841.375
        2.64583333333333
        158.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_INI_PER_REP'
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
    object QRDBTF_FIN_PER_REP: TQRDBText
      Left = 396
      Top = 1
      Width = 63
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1047.75
        2.64583333333333
        166.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_FIN_PER_REP'
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
    object QRDBTPLAZO_FND: TQRDBText
      Left = 479
      Top = 1
      Width = 47
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1267.35416666667
        2.64583333333333
        124.354166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'PLAZO_FND'
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
    object QRDBTPROX_VENC: TQRDBText
      Left = 557
      Top = 1
      Width = 49
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1473.72916666667
        2.64583333333333
        129.645833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'PROX_VENC'
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
    object QRDBTSALDO_INI: TQRDBText
      Left = 698
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
        1846.79166666667
        2.64583333333333
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'SALDO_INI'
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
    object QRDBTAMOR_CAP_FA: TQRDBText
      Left = 784
      Top = 1
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2074.33333333333
        2.64583333333333
        156.104166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'AMOR_CAP_FA'
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
    object QRDBTSALDO_FIN: TQRDBText
      Left = 892
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
        2360.08333333333
        2.64583333333333
        116.416666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'SALDO_FIN'
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
  object QRFooterTipoPlazoMon: TQRBand
    Left = 48
    Top = 239
    Width = 960
    Height = 16
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRFooterTipoPlazoMonAfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      42.3333333333333
      2540)
    BandType = rbGroupFooter
    object QRShape1: TQRShape
      Left = 2
      Top = 2
      Width = 956
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        5.29166666666667
        5.29166666666667
        2529.41666666667)
      Brush.Color = clActiveBorder
      Shape = qrsRectangle
    end
    object QRLTOTALAMORTIZACION: TQRLabel
      Left = 388
      Top = 3
      Width = 90
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1026.58333333333
        7.9375
        238.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL AMORTIZACIÓN'
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
    object QREXPAMOR_CAP_FA_VALFoot: TQRExpr
      Left = 771
      Top = 3
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2039.9375
        7.9375
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.AMOR_CAP_FA_VAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRDBTDESC_C_ID_SECFoot: TQRDBText
      Left = 570
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
        1508.125
        7.9375
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_C_ID_SEC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QREXPTIPO_PLAZOFoot: TQRExpr
      Left = 489
      Top = 3
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1293.8125
        7.9375
        190.5)
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
      Expression = 
        'IF(qyConsulta.TIPO_PLAZO = 1,'#39'CORTO PLAZO'#39',IF(qyConsulta.TIPO_PL' +
        'AZO = 2,'#39'LARGO PLAZO'#39','#39#39'))'
      FontSize = 6
    end
    object QRDBTDESC_ENT_DESFoot: TQRDBText
      Left = 639
      Top = 3
      Width = 63
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1690.6875
        7.9375
        166.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_ENT_DES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
  end
  object QRGroupEntidad: TQRGroup
    Left = 48
    Top = 136
    Width = 960
    Height = 66
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRGroupEntidadAfterPrint
    AlignToBottom = False
    BeforePrint = QRGroupEntidadBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      174.625
      2540)
    Expression = 'qyConsulta.DESC_ENT_DES'
    FooterBand = QRFooterEntidad
    Master = Owner
    ReprintOnNewPage = False
    object QRSHPTitular: TQRShape
      Left = 2
      Top = 2
      Width = 956
      Height = 63
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        166.6875
        5.29166666666667
        5.29166666666667
        2529.41666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLInstitucionDescontadora: TQRLabel
      Left = 4
      Top = 4
      Width = 98
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        10.5833333333333
        10.5833333333333
        259.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Institución Descontadora:'
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
    object QRDBTCVE_FND_ENT_DES: TQRDBText
      Left = 104
      Top = 4
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        275.166666666667
        10.5833333333333
        108.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'CVE_FND_ENT_DES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRDBTDESC_ENT_DES: TQRDBText
      Left = 148
      Top = 4
      Width = 63
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        391.583333333333
        10.5833333333333
        166.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_ENT_DES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRLFechadeCorte: TQRLabel
      Left = 4
      Top = 16
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        10.5833333333333
        42.3333333333333
        158.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha de Corte:'
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
    object QRDBTF_CORTE: TQRDBText
      Left = 104
      Top = 16
      Width = 38
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        275.166666666667
        42.3333333333333
        100.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_CORTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRLLinea: TQRLabel
      Left = 4
      Top = 28
      Width = 24
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        10.5833333333333
        74.0833333333333
        63.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Línea:'
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
    object QRDBTCVE_TIPO_LINEA: TQRDBText
      Left = 104
      Top = 28
      Width = 66
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        275.166666666667
        74.0833333333333
        174.625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'CVE_TIPO_LINEA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRLMonto: TQRLabel
      Left = 4
      Top = 40
      Width = 29
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        10.5833333333333
        105.833333333333
        76.7291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Monto:'
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
    object QRDBTMONTO_LIN: TQRDBText
      Left = 104
      Top = 40
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        275.166666666667
        105.833333333333
        127)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'MONTO_LIN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRLGarantiasOtorg: TQRLabel
      Left = 4
      Top = 52
      Width = 80
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        10.5833333333333
        137.583333333333
        211.666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Garantías Otorgadas:'
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
    object QRDBTDESC_GARANTIA: TQRDBText
      Left = 104
      Top = 52
      Width = 67
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        275.166666666667
        137.583333333333
        177.270833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_GARANTIA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
  end
  object QRGroupTipoPlazoMon: TQRGroup
    Left = 48
    Top = 202
    Width = 960
    Height = 25
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRGroupTipoPlazoMonAfterPrint
    AlignToBottom = False
    BeforePrint = QRGroupTipoPlazoMonBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      66.1458333333333
      2540)
    Expression = 'qyConsulta.GPO_REP'
    FooterBand = QRFooterTipoPlazoMon
    Master = Owner
    ReprintOnNewPage = False
    object QREXPTIPO_PLAZO: TQRExpr
      Left = 11
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
        29.1041666666667
        2.64583333333333
        190.5)
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
      Expression = 
        'IF(qyConsulta.TIPO_PLAZO = 1,'#39'CORTO PLAZO'#39',IF(qyConsulta.TIPO_PL' +
        'AZO = 2,'#39'LARGO PLAZO'#39','#39#39'))'
      FontSize = 6
    end
    object QRDBTDESC_C_ID_SEC: TQRDBText
      Left = 93
      Top = 1
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        246.0625
        2.64583333333333
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_C_ID_SEC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRLDivisa: TQRLabel
      Left = 216
      Top = 2
      Width = 40
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        571.5
        5.29166666666667
        105.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Divisa'
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
    object QRLFechaInicio: TQRLabel
      Left = 306
      Top = 2
      Width = 67
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        809.625
        5.29166666666667
        177.270833333333)
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
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLFechaTermino: TQRLabel
      Left = 385
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
        1018.64583333333
        5.29166666666667
        179.916666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Término'
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
    object QRLPlazoFondeo: TQRLabel
      Left = 476
      Top = 2
      Width = 60
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1259.41666666667
        5.29166666666667
        158.75)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Plazo Fondeo (Meses)'
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
    object QRLProxVenc: TQRLabel
      Left = 553
      Top = 2
      Width = 60
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1463.14583333333
        5.29166666666667
        158.75)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Próx. Venc. (Meses)'
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
    object QRLSaldoInicial: TQRLabel
      Left = 684
      Top = 2
      Width = 66
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1809.75
        5.29166666666667
        174.625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Saldo Inicial'
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
    object QRLAmortizacionaCapital: TQRLabel
      Left = 760
      Top = 2
      Width = 87
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2010.83333333333
        5.29166666666667
        230.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Amortización a Capital'
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
    object QRLSaldoFinal: TQRLabel
      Left = 882
      Top = 2
      Width = 65
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2333.625
        5.29166666666667
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Saldo Final'
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
  object qyConsulta: TQuery
    DatabaseName = 'BCORP'
    SQL.Strings = (
      'SELECT'
      ' (CED.DESC_ENT_DES ||'
      '  TO_CHAR(TBLED_AMOR.TIPO_PLAZO) ||'
      '  TO_CHAR(TBLED_AMOR.CVE_MONEDA)) AS GPO_REP,'
      'TO_DATE('#39'31/01/2014'#39', '#39'DD/MM/YYYY'#39') AS F_CORTE,'
      'CED.DESC_ENT_DES,'
      
        'DECODE(CED.CVE_TIPO_LINEA,'#39'IR'#39','#39'IRREVOCABLE'#39','#39'RE'#39', '#39'REVOCABLE'#39', ' +
        #39'NA'#39') AS CVE_TIPO_LINEA,'
      'CED.IMP_LIMITE AS MONTO_LIN,'
      'CED.DESC_GARANTIA,'
      'TBLED_AMOR.CVE_FND_ENT_DES,'
      'TBLED_AMOR.TIPO_PLAZO,'
      'TBLED_AMOR.CVE_MONEDA,'
      'MND.DESC_MONEDA,'
      'MND.DESC_C_ID_SEC,'
      'TBLED_AMOR.F_INI_PER_REP,'
      'TBLED_AMOR.F_FIN_PER_REP,'
      'MAX(TBLED_AMOR.PLAZO_FND) AS PLAZO_FND,'
      'MAX(TBLED_AMOR.PROX_VENC) AS PROX_VENC,'
      'MAX(TBLED_AMOR.IMP_REDESCONTADO) AS IMP_REDESCONTADO,'
      'SUM(TBLED_AMOR.SALDO_INI) AS SALDO_INI,'
      'SUM(TBLED_AMOR.AMOR_CAP_FA) AS AMOR_CAP_FA,'
      'SUM(TBLED_AMOR.SALDO_FIN) AS SALDO_FIN, '
      
        'DECODE(TBLED_AMOR.CVE_MONEDA, '#39'484'#39', SUM(TBLED_AMOR.AMOR_CAP_FA)' +
        ', '
      
        '                                     (PKGCRCONTA.STPOBT_TIPO_CAM' +
        'BIO_SAP(2, TO_DATE('#39'31/01/2014'#39', '#39'DD/MM/YYYY'#39'), '
      
        #9#9#9#9#9#9#9#9#9'  840) * SUM(TBLED_AMOR.AMOR_CAP_FA))) AS AMOR_CAP_FA_V' +
        'AL'
      'FROM'
      '('
      '   SELECT'
      '   TBLSRED.TIPO_PLAZO,'#9
      '   TBLSRED.ID_CREDITO,'#9
      '   TBLSRED.CVE_FND_ENT_DES,'#9
      '   TBLSRED.CVE_FND_PROGRAMA,'#9
      '   TBLSRED.CVE_MONEDA,'#9
      '   TBLSRED.NUM_PERIODO,'#9
      
        '   TO_DATE('#39'01'#39'||TO_CHAR(TBLSRED.F_VENCIMIENTO, '#39'MMYYYY'#39'),'#39'DD/MM' +
        '/YYYY'#39') AS F_INI_PER_REP, '
      '   LAST_DAY(TBLSRED.F_VENCIMIENTO) AS F_FIN_PER_REP,'
      '   TBLSRED.FECH_INICIO,'
      '   TBLSRED.F_VENCIMIENTO, '
      '   TBLSRED.PLAZO_FND,'#9
      '   TBLSRED.PROX_VENC,'#9
      '   TBLSRED.IMP_REDESCONTADO,'#9
      '   TBLSRED.AMOR_CAP_ACUM_ANT,'
      '   TBLSRED.AMOR_FA_ACUM_ANT,   '#9
      '   TBLSRED.AMOR_CAP,'#9
      '   TBLSRED.AMOR_FA,'#9
      
        '   (TBLSRED.IMP_REDESCONTADO - TBLSRED.AMOR_CAP_ACUM_ANT - TBLSR' +
        'ED.AMOR_FA_ACUM_ANT) AS SALDO_INI,'#9
      '   (TBLSRED.AMOR_CAP + TBLSRED.AMOR_FA) AS AMOR_CAP_FA,'
      
        '   (TBLSRED.IMP_REDESCONTADO - TBLSRED.AMOR_CAP_ACUM_ANT - TBLSR' +
        'ED.AMOR_FA_ACUM_ANT - TBLSRED.AMOR_CAP - TBLSRED.AMOR_FA) AS SAL' +
        'DO_FIN'
      '   FROM'
      '   ('
      '      ---CALCULAR PLAZO---'
      '      ---1 CORTO =  fecha corte más 1 año---'
      '      ---2 LARGO =  mayor a (fecha corte más 1 año)---'
      '      SELECT'#9'  '
      
        '      (CASE WHEN (    CFK.F_VENCIMIENTO BETWEEN TO_DATE('#39'31/01/2' +
        '014'#39', '#39'DD/MM/YYYY'#39') '
      
        '                  AND ADD_MONTHS(TO_DATE('#39'31/01/2014'#39', '#39'DD/MM/YY' +
        'YY'#39'), 12)) '
      '            THEN 1 ELSE 2 END) AS TIPO_PLAZO,'
      '      CFC.ID_CREDITO,'
      '      CFC.CVE_FND_ENT_DES,'
      '      CFC.CVE_FND_PROGRAMA,'
      '      CRCTO.CVE_MONEDA,'
      '      CFC.ID_PRESTAMO_PAS,'
      '      CFK.NUM_PERIODO,'
      '      (CFK.F_VENCIMIENTO - CFK.PLAZO) AS FECH_INICIO,'
      '      CFK.F_VENCIMIENTO,'
      '      ROUND((CFK.PLAZO / 30)) AS PLAZO_FND,'
      
        '      ROUND(((CFK.F_VENCIMIENTO - TO_DATE('#39'31/01/2014'#39', '#39'DD/MM/Y' +
        'YYY'#39') ) / 30)) AS PROX_VENC,   '
      '      CFC.IMP_REDESCONTADO,'
      '      (CFK.IMP_CAPITAL - CFK.IMP_PAGADO) AS AMOR_CAP,'
      
        '      NVL((CFFA.IMP_FINAN_ADIC - CFFA.IMP_PAGADO), 0) AS AMOR_FA' +
        ','
      '      NVL((SELECT SUM('
      
        '    '#9'   CASE WHEN (CFK2.F_VENCIMIENTO <= TO_DATE('#39'31/01/2014'#39', '#39 +
        'DD/MM/YYYY'#39')) '
      
        '    '#9'        THEN CFK2.IMP_PAGADO ELSE (CFK2.IMP_CAPITAL - CFK2.' +
        'IMP_PAGADO) END '
      '    '#9'   ) AS ACUMCANT'
      '            FROM CR_FND_CAPITAL CFK2'
      '            WHERE'
      '                 CFK2.ID_CREDITO       = CFK.ID_CREDITO'
      '             AND CFK2.CVE_FND_ENT_DES  = CFK.CVE_FND_ENT_DES'
      '             AND CFK2.CVE_FND_PROGRAMA = CFK.CVE_FND_PROGRAMA'
      '             AND CFK2.SIT_CAPITAL      NOT IN ('#39'CA'#39', '#39'IM'#39')'
      '             AND CFK2.NUM_PERIODO      < CFK.NUM_PERIODO'
      '      ), 0) AS AMOR_CAP_ACUM_ANT,         '
      '      NVL((SELECT SUM( '
      
        '    '#9'   CASE WHEN (CFFA2.F_VENCIMIENTO <= TO_DATE('#39'31/01/2014'#39', ' +
        #39'DD/MM/YYYY'#39')) '
      
        '    '#9'        THEN CFFA2.IMP_PAGADO ELSE (CFFA2.IMP_FINAN_ADIC - ' +
        'CFFA2.IMP_PAGADO) END '
      '    '#9'   ) AS ACUMFAANT'
      '       FROM CR_FND_FIN_ADIC CFFA2'
      '       WHERE'
      '            CFFA2.ID_CREDITO       = CFFA.ID_CREDITO'
      '        AND CFFA2.CVE_FND_ENT_DES  = CFFA.CVE_FND_ENT_DES'
      '        AND CFFA2.CVE_FND_PROGRAMA = CFFA.CVE_FND_PROGRAMA'
      '        AND CFFA2.SIT_FINAN_ADIC   NOT IN ('#39'CA'#39', '#39'IM'#39')'
      '        AND CFFA2.NUM_PERIODO      < CFFA.NUM_PERIODO'
      '      ), 0) AS AMOR_FA_ACUM_ANT         '
      '      FROM'
      '      CR_FND_CAPITAL CFK,'
      '      CR_FND_FIN_ADIC CFFA,'
      '      (SELECT'
      '       ID_CREDITO,'
      '       CVE_FND_ENT_DES,'
      '       CVE_FND_PROGRAMA,'
      '       ID_PRESTAMO_PAS,'
      '       IMP_REDESCONTADO'
      '       FROM'
      '       CR_FND_CREDITO'
      '       WHERE'
      '            SIT_CREDITO = '#39'AC'#39
      '      ) CFC,'
      '      CR_CREDITO CRCRED,'
      '      CR_CONTRATO CRCTO'
      '      WHERE'
      '            CFK.ID_CREDITO            = CFC.ID_CREDITO'
      '        AND CFK.CVE_FND_ENT_DES       = CFC.CVE_FND_ENT_DES'
      '        AND CFK.CVE_FND_PROGRAMA      = CFC.CVE_FND_PROGRAMA'
      '        AND CFK.SIT_CAPITAL           NOT IN ('#39'CA'#39', '#39'IM'#39')'
      
        '        AND CFK.F_VENCIMIENTO         > TO_DATE('#39'31/01/2014'#39', '#39'D' +
        'D/MM/YYYY'#39')'
      '        AND CRCRED.ID_CREDITO         = CFK.ID_CREDITO'
      '        AND CRCTO.ID_CONTRATO         = CRCRED.ID_CONTRATO  '#9#9
      '        AND CFFA.ID_CREDITO       (+) = CFK.ID_CREDITO'
      '        AND CFFA.CVE_FND_ENT_DES  (+) = CFK.CVE_FND_ENT_DES'
      '        AND CFFA.CVE_FND_PROGRAMA (+) = CFK.CVE_FND_PROGRAMA'
      '        AND CFFA.NUM_PERIODO      (+) = CFK.NUM_PERIODO'#9#9
      '   ) TBLSRED'
      '    ORDER BY '
      '    TBLSRED.ID_CREDITO,'
      #9'TBLSRED.NUM_PERIODO,'
      '    TBLSRED.CVE_FND_ENT_DES,'
      '    TBLSRED.CVE_FND_PROGRAMA,'
      '    TBLSRED.CVE_MONEDA,'
      '    TBLSRED.TIPO_PLAZO'
      ') TBLED_AMOR,'
      'CR_FND_ENT_DES CED,'
      'MONEDA MND'
      'WHERE'
      
        '      TBLED_AMOR.CVE_FND_ENT_DES (+) = CED.CVE_FND_ENT_DES --SE ' +
        'PRESENTAN TODAS AUNQUE NO TENGAN INFORMACIÓN--'
      '  AND MND.CVE_MONEDA             (+) = TBLED_AMOR.CVE_MONEDA   '
      'GROUP BY'
      'CED.DESC_ENT_DES,'
      'CED.CVE_TIPO_LINEA,'
      'CED.IMP_LIMITE,'
      'CED.DESC_GARANTIA,'
      'TBLED_AMOR.CVE_FND_ENT_DES,'
      'TBLED_AMOR.TIPO_PLAZO,'
      'TBLED_AMOR.CVE_MONEDA,'
      'MND.DESC_MONEDA,'
      'MND.DESC_C_ID_SEC,'
      'TBLED_AMOR.F_INI_PER_REP,'
      'TBLED_AMOR.F_FIN_PER_REP'
      'ORDER BY'
      'GPO_REP,'
      'CED.DESC_ENT_DES,'
      'CED.CVE_TIPO_LINEA,'
      'CED.IMP_LIMITE,'
      'CED.DESC_GARANTIA,'
      'TBLED_AMOR.CVE_FND_ENT_DES,'
      'TBLED_AMOR.TIPO_PLAZO,'
      'TBLED_AMOR.CVE_MONEDA,'
      'MND.DESC_MONEDA,'
      'MND.DESC_C_ID_SEC,'
      'TBLED_AMOR.F_INI_PER_REP,'
      'TBLED_AMOR.F_FIN_PER_REP')
    Left = 251
    Top = 17
    object qyConsultaGPO_REP: TStringField
      FieldName = 'GPO_REP'
      Size = 180
    end
    object qyConsultaF_CORTE: TDateTimeField
      FieldName = 'F_CORTE'
    end
    object qyConsultaDESC_ENT_DES: TStringField
      FieldName = 'DESC_ENT_DES'
      Size = 100
    end
    object qyConsultaCVE_TIPO_LINEA: TStringField
      FieldName = 'CVE_TIPO_LINEA'
      Size = 11
    end
    object qyConsultaMONTO_LIN: TFloatField
      FieldName = 'MONTO_LIN'
    end
    object qyConsultaDESC_GARANTIA: TStringField
      FieldName = 'DESC_GARANTIA'
      Size = 100
    end
    object qyConsultaCVE_FND_ENT_DES: TStringField
      FieldName = 'CVE_FND_ENT_DES'
      Size = 10
    end
    object qyConsultaTIPO_PLAZO: TFloatField
      FieldName = 'TIPO_PLAZO'
    end
    object qyConsultaCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyConsultaDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyConsultaF_INI_PER_REP: TDateTimeField
      FieldName = 'F_INI_PER_REP'
    end
    object qyConsultaF_FIN_PER_REP: TDateTimeField
      FieldName = 'F_FIN_PER_REP'
    end
    object qyConsultaPLAZO_FND: TFloatField
      FieldName = 'PLAZO_FND'
    end
    object qyConsultaPROX_VENC: TFloatField
      FieldName = 'PROX_VENC'
    end
    object qyConsultaIMP_REDESCONTADO: TFloatField
      FieldName = 'IMP_REDESCONTADO'
    end
    object qyConsultaSALDO_INI: TFloatField
      FieldName = 'SALDO_INI'
    end
    object qyConsultaAMOR_CAP_FA: TFloatField
      FieldName = 'AMOR_CAP_FA'
    end
    object qyConsultaSALDO_FIN: TFloatField
      FieldName = 'SALDO_FIN'
    end
    object qyConsultaAMOR_CAP_FA_VAL: TFloatField
      FieldName = 'AMOR_CAP_FA_VAL'
    end
    object qyConsultaDESC_C_ID_SEC: TStringField
      FieldName = 'DESC_C_ID_SEC'
      Size = 8
    end
  end
end
