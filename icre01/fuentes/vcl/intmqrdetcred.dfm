object QrDetCred: TQrDetCred
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
  BeforePrint = QuickRepBeforePrint
  DataSet = qyConsulta
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  Functions.Strings = (
    'PAGENUMBER'
    'COLUMNNUMBER'
    'REPORTTITLE'
    'QRSTRINGSBAND1')
  Functions.DATA = (
    '0'
    '0'
    #39#39
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
  object QRBand5: TQRBand
    Left = 48
    Top = 132
    Width = 720
    Height = 135
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRBand5BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      357.1875
      1905)
    BandType = rbTitle
    object QRLabel14: TQRLabel
      Left = 11
      Top = 22
      Width = 36
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        29.1041666666667
        58.2083333333333
        95.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Crédito : '
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
    object QRLabel24: TQRLabel
      Left = 147
      Top = 91
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        388.9375
        240.770833333333
        153.458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Renovado en : '
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
    object QRLabel25: TQRLabel
      Left = 11
      Top = 105
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        29.1041666666667
        277.8125
        169.333333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Periodo Interes : '
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
    object QRLabel31: TQRLabel
      Left = 11
      Top = 49
      Width = 28
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        29.1041666666667
        129.645833333333
        74.0833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Plazo : '
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
    object QRLabel32: TQRLabel
      Left = 301
      Top = 36
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        796.395833333333
        95.25
        158.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha Captura: '
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
    object QRLabel36: TQRLabel
      Left = 301
      Top = 63
      Width = 47
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        796.395833333333
        166.6875
        124.354166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tasa Base :  '
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
    object QRLabel38: TQRLabel
      Left = 301
      Top = 91
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        796.395833333333
        240.770833333333
        185.208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo de Calculo :   '
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
      Left = 11
      Top = 77
      Width = 68
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        29.1041666666667
        203.729166666667
        179.916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Pago de capital :   '
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
    object QRLabel41: TQRLabel
      Left = 301
      Top = 77
      Width = 77
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        796.395833333333
        203.729166666667
        203.729166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Pago de Intereses :   '
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
    object QRDBD4: TQRDBText
      Left = 81
      Top = 22
      Width = 49
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        214.3125
        58.2083333333333
        129.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'ID_CREDITO'
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
    object QRDB5: TQRDBText
      Left = 147
      Top = 22
      Width = 49
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        388.9375
        58.2083333333333
        129.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
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
    object QRDB8: TQRDBText
      Left = 571
      Top = 22
      Width = 35
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1510.77083333333
        58.2083333333333
        92.6041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
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
    object QRDBText25: TQRDBText
      Left = 81
      Top = 49
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        214.3125
        129.645833333333
        127)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'DIAS_PLAZO'
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
    object QRDB10: TQRDBText
      Left = 386
      Top = 36
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1021.29166666667
        95.25
        158.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'F_ALTA'
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
    object QRDBText32: TQRDBText
      Left = 386
      Top = 63
      Width = 43
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1021.29166666667
        166.6875
        113.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'CVE_TASA_REFER'
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
      Left = 485
      Top = 63
      Width = 24
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1283.22916666667
        166.6875
        63.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'OPERADOR_STASA'
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
    object QRDBText35: TQRDBText
      Left = 511
      Top = 63
      Width = 57
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1352.02083333333
        166.6875
        150.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'SOBRETASA'
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
    object QRDBText37: TQRDBText
      Left = 571
      Top = 63
      Width = 131
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1510.77083333333
        166.6875
        346.604166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'TASA_APLICADA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###0.000000'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText38: TQRDBText
      Left = 386
      Top = 91
      Width = 43
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        1021.953125
        241.432291666667
        112.447916666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'CVE_CALCULO'
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
    object QRDBText39: TQRDBText
      Left = 434
      Top = 92
      Width = 92
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1148.29166666667
        243.416666666667
        243.416666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'DESC_CALCULO'
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
    object QRDBText40: TQRDBText
      Left = 81
      Top = 76
      Width = 43
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        214.973958333333
        201.744791666667
        112.447916666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'CVE_AMORTIZACION'
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
    object QRDBText41: TQRDBText
      Left = 147
      Top = 77
      Width = 147
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        388.9375
        203.729166666667
        388.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'DESC_AMORTIZA'
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
    object QRDBText42: TQRDBText
      Left = 386
      Top = 77
      Width = 15
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1021.29166666667
        203.729166666667
        39.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'CVE_PAG_INTERES'
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
    object QRDBText43: TQRDBText
      Left = 402
      Top = 78
      Width = 167
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1063.625
        206.375
        441.854166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'DESC_PAG_INTERES'
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
    object QRDBText47: TQRDBText
      Left = 215
      Top = 92
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        568.854166666667
        243.416666666667
        111.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'ID_CRE_RENUEVA'
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
    object QRDB6: TQRDBText
      Left = 198
      Top = 22
      Width = 326
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        523.875
        58.2083333333333
        862.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'DESC_L_PRODUCTO'
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
    object QRLabel9: TQRLabel
      Left = 529
      Top = 104
      Width = 57
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1399.64583333333
        275.166666666667
        150.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Factor Moras : '
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
    object QRDBText57: TQRDBText
      Left = 628
      Top = 104
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1661.58333333333
        275.166666666667
        132.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'FACT_MORAS'
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
    object QRDB9: TQRDBText
      Left = 628
      Top = 22
      Width = 89
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1661.58333333333
        58.2083333333333
        235.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
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
    object QRShape5: TQRShape
      Left = 0
      Top = 0
      Width = 720
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        0
        0
        1905)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel16: TQRLabel
      Left = 12
      Top = 2
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        31.75
        5.29166666666667
        127)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Acreditado : '
      Color = clSilver
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
    object QRDB1: TQRDBText
      Left = 83
      Top = 2
      Width = 39
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        219.604166666667
        5.29166666666667
        103.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clSilver
      DataSet = qyEncabezado
      DataField = 'ID_TITULAR'
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
    object QRDB2: TQRDBText
      Left = 125
      Top = 2
      Width = 213
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        330.729166666667
        5.29166666666667
        563.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clSilver
      DataSet = qyEncabezado
      DataField = 'ACREDITADO'
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
    object QRDB7: TQRDBText
      Left = 81
      Top = 36
      Width = 55
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        214.3125
        95.25
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'IMP_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel6: TQRLabel
      Left = 11
      Top = 36
      Width = 33
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        29.1041666666667
        95.25
        87.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Monto : '
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
      Left = 572
      Top = 2
      Width = 43
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1513.41666666667
        5.29166666666667
        113.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Situación : '
      Color = clSilver
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
    object QRDB3: TQRDBText
      Left = 635
      Top = 2
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1680.10416666667
        5.29166666666667
        140.229166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clSilver
      DataSet = qyEncabezado
      DataField = 'SIT_CREDITO'
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
    object QRLabel17: TQRLabel
      Left = 529
      Top = 35
      Width = 63
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1399.64583333333
        92.6041666666667
        166.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha Autoriza : '
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
    object QRDB11: TQRDBText
      Left = 628
      Top = 35
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1661.58333333333
        92.6041666666667
        132.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'F_AUTORIZA'
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
    object QRDBText10: TQRDBText
      Left = 386
      Top = 49
      Width = 34
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1021.29166666667
        129.645833333333
        89.9583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'F_INICIO'
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
    object QRLabel52: TQRLabel
      Left = 301
      Top = 49
      Width = 52
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        796.395833333333
        129.645833333333
        137.583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha Inicio : '
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
    object QRLabel18: TQRLabel
      Left = 529
      Top = 49
      Width = 89
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1399.64583333333
        129.645833333333
        235.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha de Vencimiento : '
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
    object QRDBText12: TQRDBText
      Left = 628
      Top = 49
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1661.58333333333
        129.645833333333
        158.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'F_VENCIMIENTO'
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
    object QRDBText13: TQRDBText
      Left = 81
      Top = 63
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        214.3125
        166.6875
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'SDO_INSOLUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel19: TQRLabel
      Left = 11
      Top = 63
      Width = 62
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        29.1041666666667
        166.6875
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Saldo insoluto : '
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
      Left = 11
      Top = 91
      Width = 49
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        29.1041666666667
        240.770833333333
        129.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Renueva al : '
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
    object QRDBText14: TQRDBText
      Left = 81
      Top = 91
      Width = 51
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        214.973958333333
        241.432291666667
        135.598958333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'ID_CRE_RENOVADO'
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
    object QRLabel7: TQRLabel
      Left = 147
      Top = 105
      Width = 65
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        388.9375
        277.8125
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Periodo Capital : '
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
    object QRLabel20: TQRLabel
      Left = 301
      Top = 121
      Width = 73
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        796.395833333333
        320.145833333333
        193.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha Ult. Capital : '
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
      Left = 529
      Top = 121
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1399.64583333333
        320.145833333333
        190.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha Ult. Interes : '
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
      Left = 81
      Top = 105
      Width = 45
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        214.973958333333
        277.8125
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'PERIODOINT'
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
    object QRDBText2: TQRDBText
      Left = 215
      Top = 105
      Width = 43
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        568.854166666667
        277.8125
        112.447916666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'PERIODOCAP'
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
    object QRDBText3: TQRDBText
      Left = 386
      Top = 121
      Width = 68
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1021.29166666667
        320.145833333333
        179.916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'FECHVENCAP'
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
      Left = 628
      Top = 121
      Width = 68
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1661.58333333333
        320.145833333333
        179.916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'FECHVENINT'
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
    object QRLabel66: TQRLabel
      Left = 147
      Top = 63
      Width = 56
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        388.9375
        166.6875
        148.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Adeudo total : '
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
    object QRDBText28: TQRDBText
      Left = 215
      Top = 63
      Width = 74
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        568.854166666667
        166.6875
        195.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'SDO_VIG_TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object lbTASA_INTERES: TQRLabel
      Left = 433
      Top = 63
      Width = 49
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1145.64583333333
        166.6875
        129.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '|                    | '
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
    object QRDBText79: TQRDBText
      Left = 241
      Top = 36
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        637.645833333333
        95.25
        127)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'CHEQUERA'
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
    object QRLabel68: TQRLabel
      Left = 147
      Top = 36
      Width = 87
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        388.9375
        95.25
        230.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Contrato de Deposito: '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel70: TQRLabel
      Left = 531
      Top = 22
      Width = 34
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1404.9375
        58.2083333333333
        89.9583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel86: TQRLabel
      Left = 11
      Top = 121
      Width = 66
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        29.1041666666667
        320.145833333333
        174.625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo de Crédito : '
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
    object QRDBText20: TQRDBText
      Left = 81
      Top = 121
      Width = 136
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        214.3125
        320.145833333333
        359.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'TIPO_CREDITO'
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
    object QRLabel101: TQRLabel
      Left = 301
      Top = 104
      Width = 87
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        796.395833333333
        275.166666666667
        230.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo de Calculo Moras:'
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
    object QRDBText69: TQRDBText
      Left = 393
      Top = 104
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1039.8125
        275.166666666667
        111.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'CVE_CALCULO_M'
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
    object QRLabel105: TQRLabel
      Left = 529
      Top = 88
      Width = 115
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1399.64583333333
        232.833333333333
        304.270833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha de Traspaso a Vencido : '
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
    object QRDBText83: TQRDBText
      Left = 652
      Top = 89
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1725.08333333333
        235.479166666667
        158.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'F_TRASPASO_VENC'
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
    object QRDBText84: TQRDBText
      Left = 225
      Top = 49
      Width = 25
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        595.3125
        129.645833333333
        66.1458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyEncabezado
      DataField = 'EVIDENCIA'
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
    object QRLabel106: TQRLabel
      Left = 147
      Top = 49
      Width = 77
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        388.9375
        129.645833333333
        203.729166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Capacidad de Pago :'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object QRGroup1: TQRGroup
    Left = 48
    Top = 267
    Width = 720
    Height = 29
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroup1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      76.7291666666667
      1905)
    Expression = 'qyConsulta.IDGRUPO'
    FooterBand = QRFoot1
    Master = Owner
    ReprintOnNewPage = False
    object QRShape18: TQRShape
      Left = 1
      Top = 12
      Width = 717
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2.64583333333333
        31.75
        1897.0625)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel51: TQRLabel
      Left = 3
      Top = 0
      Width = 27
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        7.9375
        0
        71.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Capital'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel74: TQRLabel
      Left = 3
      Top = 14
      Width = 35
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        7.9375
        37.0416666666667
        92.6041666666667)
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
    object QRLabel75: TQRLabel
      Left = 51
      Top = 14
      Width = 45
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        134.9375
        37.0416666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha Vto'
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
    object QRLabel76: TQRLabel
      Left = 97
      Top = 14
      Width = 45
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        256.645833333333
        37.0416666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha Prog.'
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
    object QRLabel77: TQRLabel
      Left = 146
      Top = 14
      Width = 45
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        386.291666666667
        37.0416666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha Pago'
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
    object QRLabel78: TQRLabel
      Left = 282
      Top = 14
      Width = 38
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        746.125
        37.0416666666667
        100.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tasa'
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
    object QRLabel79: TQRLabel
      Left = 321
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        849.3125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Amortización'
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
    object QRLabel80: TQRLabel
      Left = 393
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1039.8125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Saldo Insoluto'
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
    object QRLabel81: TQRLabel
      Left = 465
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1230.3125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Pagado'
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
    object QRLabel82: TQRLabel
      Left = 609
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1611.3125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Vencido'
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
    object QRLabel83: TQRLabel
      Left = 680
      Top = 14
      Width = 36
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1799.16666666667
        37.0416666666667
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Situación'
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
    object QRLabel87: TQRLabel
      Left = 537
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1420.8125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Vigente'
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
  object QRFoot1: TQRBand
    Left = 48
    Top = 722
    Width = 720
    Height = 18
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRFoot1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      47.625
      1905)
    BandType = rbGroupFooter
    object QRShape4: TQRShape
      Left = 256
      Top = 1
      Width = 428
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Style = psInsideFrame
      Size.Values = (
        42.3333333333333
        677.333333333333
        2.64583333333333
        1132.41666666667)
      Shape = qrsRectangle
    end
    object QRLabel46: TQRLabel
      Left = 282
      Top = 4
      Width = 20
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        746.125
        10.5833333333333
        52.9166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total'
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
    object QRExpr1: TQRExpr
      Left = 321
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        849.3125
        13.2291666666667
        185.208333333333)
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
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr2: TQRExpr
      Left = 465
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1230.3125
        13.2291666666667
        185.208333333333)
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
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_PAGADO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr3: TQRExpr
      Left = 609
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1611.3125
        13.2291666666667
        185.208333333333)
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
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMPVENCIDO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRImpVigenteTot: TQRLabel
      Left = 537
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1420.8125
        13.2291666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRImpVigenteTot'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
  end
  object QRBand1: TQRBand
    Left = 48
    Top = 267
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
    LinkBand = QRGroup1
    Size.Values = (
      0
      1905)
    BandType = rbColumnHeader
  end
  object QRGroup2: TQRGroup
    Left = 48
    Top = 296
    Width = 720
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroup2BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      37.0416666666667
      1905)
    Expression = ' qyConsulta.PERCAPITAL'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText5: TQRDBText
      Left = 3
      Top = 4
      Width = 35
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        7.9375
        10.5833333333333
        92.6041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'PERCAPITAL'
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
      Left = 51
      Top = 4
      Width = 45
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        134.9375
        10.5833333333333
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'FHVTOCAP'
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
      Left = 97
      Top = 4
      Width = 45
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        256.645833333333
        10.5833333333333
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_PROG_PAGO'
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
      Left = 146
      Top = 4
      Width = 45
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        386.291666666667
        10.5833333333333
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_PAGO'
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
    object QRDBText18: TQRDBText
      Left = 282
      Top = 4
      Width = 38
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        746.125
        10.5833333333333
        100.541666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'TASA_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,##0.000000'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText19: TQRDBText
      Left = 321
      Top = 4
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        849.3125
        10.5833333333333
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_CAPITAL'
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
    object QRDBText21: TQRDBText
      Left = 465
      Top = 4
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1230.3125
        10.5833333333333
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_PAGADO'
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
    object QRDBText23: TQRDBText
      Left = 609
      Top = 4
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1611.3125
        10.5833333333333
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMPVENCIDO'
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
    object QRDBText24: TQRDBText
      Left = 680
      Top = 4
      Width = 36
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1799.16666666667
        10.5833333333333
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'SIT_CAPITAL'
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
    object QRSdoInsCap: TQRLabel
      Left = 393
      Top = 4
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1039.8125
        10.5833333333333
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRSdoInsCap'
      Color = clWhite
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
    object QRImpVigente: TQRLabel
      Left = 537
      Top = 4
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1420.8125
        10.5833333333333
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRImpVigente'
      Color = clWhite
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
  end
  object QRGroup3: TQRGroup
    Left = 48
    Top = 310
    Width = 720
    Height = 29
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroup3BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      76.7291666666667
      1905)
    Expression = 'qyConsulta.IDGRUPO'
    FooterBand = QRFoot2
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel1: TQRLabel
      Left = 3
      Top = 0
      Width = 194
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        7.9375
        0
        513.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Amortizaciones no programadas y refinanciamientos'
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
    object QRShape8: TQRShape
      Left = 1
      Top = 12
      Width = 717
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2.64583333333333
        31.75
        1897.0625)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 88
      Top = 14
      Width = 131
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        232.833333333333
        37.0416666666667
        346.604166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha Pago / Refinanciamiento'
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
      Left = 229
      Top = 14
      Width = 236
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        605.895833333333
        37.0416666666667
        624.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Desc. Operación'
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
      Left = 537
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1420.8125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe'
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
  object QRGroup4: TQRGroup
    Left = 48
    Top = 339
    Width = 720
    Height = 2
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      5.29166666666667
      1905)
    Expression = 'qyConsulta.F_OPERACION'
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRFoot2: TQRBand
    Left = 48
    Top = 705
    Width = 720
    Height = 17
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      44.9791666666667
      1905)
    BandType = rbGroupFooter
    object QRShape1: TQRShape
      Left = 320
      Top = 0
      Width = 364
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Style = psInsideFrame
      Size.Values = (
        44.9791666666667
        846.666666666667
        0
        963.083333333333)
      Shape = qrsRectangle
    end
    object QRLabel65: TQRLabel
      Left = 347
      Top = 3
      Width = 20
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        918.104166666667
        7.9375
        52.9166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total'
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
    object QRExpr6: TQRExpr
      Left = 537
      Top = 4
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1420.8125
        10.5833333333333
        185.208333333333)
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
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_CONCEPTO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object QRFoot3: TQRBand
    Left = 48
    Top = 665
    Width = 720
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRFoot3BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.2708333333333
      1905)
    BandType = rbGroupFooter
    object QRShape3: TQRShape
      Left = 256
      Top = 0
      Width = 449
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Style = psInsideFrame
      Size.Values = (
        47.625
        677.333333333333
        0
        1187.97916666667)
      Shape = qrsRectangle
    end
    object QRLabel69: TQRLabel
      Left = 282
      Top = 4
      Width = 20
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        746.125
        10.5833333333333
        52.9166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total'
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
    object QRExpr7: TQRExpr
      Left = 321
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        849.3125
        13.2291666666667
        185.208333333333)
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
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_INTERES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr8: TQRExpr
      Left = 393
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1039.8125
        13.2291666666667
        185.208333333333)
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
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_IVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr9: TQRExpr
      Left = 465
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1230.3125
        13.2291666666667
        185.208333333333)
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
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_PAGADO_1)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr4: TQRExpr
      Left = 609
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1611.3125
        13.2291666666667
        185.208333333333)
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
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMPVENCIDO_1)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRImpInterTot: TQRLabel
      Left = 537
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1420.8125
        13.2291666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRImpInterTot'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
  end
  object QRFoot4: TQRBand
    Left = 48
    Top = 629
    Width = 720
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRFoot4BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.2708333333333
      1905)
    BandType = rbGroupFooter
    object QRShape6: TQRShape
      Left = 256
      Top = 0
      Width = 449
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Style = psInsideFrame
      Size.Values = (
        47.625
        677.333333333333
        0
        1187.97916666667)
      Shape = qrsRectangle
    end
    object QRLabel73: TQRLabel
      Left = 282
      Top = 4
      Width = 20
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        746.125
        10.5833333333333
        52.9166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total'
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
    object QRExpr10: TQRExpr
      Left = 321
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        849.3125
        13.2291666666667
        185.208333333333)
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
      ResetAfterPrint = False
      Transparent = True
      WordWrap = False
      Expression = 'SUM(qyConsulta.IMP_COMISION)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr11: TQRExpr
      Left = 393
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1039.8125
        13.2291666666667
        185.208333333333)
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
      ResetAfterPrint = False
      Transparent = False
      WordWrap = False
      Expression = 'SUM(qyConsulta.IMP_IVA_1)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr12: TQRExpr
      Left = 465
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1230.3125
        13.2291666666667
        185.208333333333)
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
      ResetAfterPrint = False
      Transparent = True
      WordWrap = False
      Expression = 'SUM(qyConsulta.IMP_PAGADO_2)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr5: TQRExpr
      Left = 609
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1611.3125
        13.2291666666667
        185.208333333333)
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
      ResetAfterPrint = False
      Transparent = True
      WordWrap = False
      Expression = 'SUM(qyConsulta.IMPVENCIDO_2)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRImpComisTot: TQRLabel
      Left = 537
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1420.8125
        13.2291666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRImpComisTot'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
  end
  object QRBand2: TQRBand
    Left = 48
    Top = 749
    Width = 720
    Height = 106
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
      280.458333333333
      1905)
    BandType = rbPageFooter
    object QRShape13: TQRShape
      Left = 0
      Top = 3
      Width = 720
      Height = 95
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        251.354166666667
        0
        7.9375
        1905)
      Shape = qrsRectangle
    end
    object QRShape14: TQRShape
      Left = 1
      Top = 15
      Width = 718
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        2.64583333333333
        39.6875
        1899.70833333333)
      Shape = qrsHorLine
    end
    object QRLabel56: TQRLabel
      Left = 571
      Top = 35
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1510.77083333333
        92.6041666666667
        150.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Nombre y Cargo'
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
    object QRShape15: TQRShape
      Left = 13
      Top = 67
      Width = 196
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        34.3958333333333
        177.270833333333
        518.583333333333)
      Shape = qrsHorLine
    end
    object QRShape17: TQRShape
      Left = 246
      Top = 67
      Width = 219
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        650.875
        177.270833333333
        579.4375)
      Shape = qrsHorLine
    end
    object QRShape19: TQRShape
      Left = 495
      Top = 67
      Width = 210
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        1309.6875
        177.270833333333
        555.625)
      Shape = qrsHorLine
    end
    object QRShape20: TQRShape
      Left = 220
      Top = 3
      Width = 7
      Height = 95
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        251.354166666667
        582.083333333333
        7.9375
        18.5208333333333)
      Shape = qrsVertLine
    end
    object QRLabel57: TQRLabel
      Left = 87
      Top = 77
      Width = 32
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        230.1875
        203.729166666667
        84.6666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Promotor'
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
    object QRShape2: TQRShape
      Left = 473
      Top = 3
      Width = 10
      Height = 95
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        251.354166666667
        1251.47916666667
        7.9375
        26.4583333333333)
      Shape = qrsVertLine
    end
    object QRLabel54: TQRLabel
      Left = 89
      Top = 6
      Width = 28
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        235.479166666667
        15.875
        74.0833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Vo. Bo.'
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
    object QRLabel11: TQRLabel
      Left = 329
      Top = 6
      Width = 28
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        870.479166666667
        15.875
        74.0833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Vo. Bo.'
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
    object QRLabel15: TQRLabel
      Left = 585
      Top = 6
      Width = 28
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1547.8125
        15.875
        74.0833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Vo. Bo.'
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
    object QRLabel22: TQRLabel
      Left = 75
      Top = 35
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        198.4375
        92.6041666666667
        150.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Nombre y Cargo'
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
    object QRLabel23: TQRLabel
      Left = 315
      Top = 35
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        833.4375
        92.6041666666667
        150.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Nombre y Cargo'
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
    object QRLabel26: TQRLabel
      Left = 330
      Top = 77
      Width = 26
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        873.125
        203.729166666667
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
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel27: TQRLabel
      Left = 571
      Top = 77
      Width = 57
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1510.77083333333
        203.729166666667
        150.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Mesa de Control'
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
  end
  object QRBand3: TQRBand
    Left = 48
    Top = 610
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
    Size.Values = (
      0
      1905)
    BandType = rbDetail
  end
  object QRGroup10: TQRGroup
    Left = 48
    Top = 341
    Width = 720
    Height = 10
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroup10BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      26.4583333333333
      1905)
    Expression = 'qyConsulta.ID_TRANSACCION'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText36: TQRDBText
      Left = 126
      Top = 2
      Width = 45
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        333.375
        5.29166666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_OPERACION'
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
    object QRDBText48: TQRDBText
      Left = 228
      Top = 2
      Width = 57
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        603.25
        5.29166666666667
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'CVE_OPERACION'
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
    object QRDBText49: TQRDBText
      Left = 288
      Top = 2
      Width = 177
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        762
        5.29166666666667
        468.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_L_OPERACION'
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
    object QRDBText50: TQRDBText
      Left = 537
      Top = 2
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1420.8125
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_CONCEPTO'
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
  object SummaryBand1: TQRBand
    Left = 48
    Top = 740
    Width = 720
    Height = 9
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AfterPrint = SummaryBand1AfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      23.8125
      1905)
    BandType = rbSummary
  end
  object QRGroupFinan1: TQRGroup
    Left = 48
    Top = 351
    Width = 720
    Height = 29
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroupFinan1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      76.7291666666667
      1905)
    Expression = 'qyConsulta.IDGRUPO'
    FooterBand = QRFootFinan
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel59: TQRLabel
      Left = 3
      Top = 0
      Width = 104
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        7.9375
        0
        275.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Refinanciamiento de Interés'
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
    object QRShape10: TQRShape
      Left = 1
      Top = 12
      Width = 718
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2.64583333333333
        31.75
        1899.70833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel60: TQRLabel
      Left = 3
      Top = 14
      Width = 35
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        7.9375
        37.0416666666667
        92.6041666666667)
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
    object QRLabel61: TQRLabel
      Left = 142
      Top = 14
      Width = 45
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        375.708333333333
        37.0416666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha Vto'
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
    object QRLabel63: TQRLabel
      Left = 271
      Top = 14
      Width = 45
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        717.020833333333
        37.0416666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha Pago'
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
    object QRLabel67: TQRLabel
      Left = 393
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1039.8125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Financiamiento'
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
    object QRLabel71: TQRLabel
      Left = 465
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1230.3125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Pagado'
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
    object QRLabel72: TQRLabel
      Left = 680
      Top = 14
      Width = 36
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1799.16666666667
        37.0416666666667
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Situación'
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
    object QRLabel64: TQRLabel
      Left = 609
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1611.3125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Vencido'
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
    object QRLabel88: TQRLabel
      Left = 537
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1420.8125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Vigente'
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
  object QRGroupFinan2: TQRGroup
    Left = 48
    Top = 380
    Width = 720
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroupFinan2BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      29.1041666666667
      1905)
    Expression = 'qyConsulta.FA_NUMPER'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText17: TQRDBText
      Left = 3
      Top = 2
      Width = 35
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        7.9375
        5.29166666666667
        92.6041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'FA_NUMPER'
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
      Left = 142
      Top = 2
      Width = 45
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        375.708333333333
        5.29166666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'FA_FVENCIM'
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
    object QRDBText27: TQRDBText
      Left = 271
      Top = 2
      Width = 45
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        717.020833333333
        5.29166666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'FA_FPAGO'
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
    object QRDBText30: TQRDBText
      Left = 393
      Top = 2
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1039.8125
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'FA_IMPFINAN'
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
    object QRDBText45: TQRDBText
      Left = 465
      Top = 2
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1230.3125
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'FA_IMPPAGADO'
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
    object QRDBText46: TQRDBText
      Left = 680
      Top = 2
      Width = 36
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1799.16666666667
        5.29166666666667
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'FA_SITFINAN'
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
    object QRDBText26: TQRDBText
      Left = 609
      Top = 2
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1611.3125
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'FA_IMPVENCIDO'
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
    object QRImpRefVig: TQRLabel
      Left = 537
      Top = 2
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1420.8125
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRImpRefVig'
      Color = clWhite
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
  end
  object QRFootFinan: TQRBand
    Left = 48
    Top = 684
    Width = 720
    Height = 21
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRFootFinanBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      55.5625
      1905)
    BandType = rbGroupFooter
    object QRShape16: TQRShape
      Left = 256
      Top = 2
      Width = 449
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Style = psInsideFrame
      Size.Values = (
        42.3333333333333
        677.333333333333
        5.29166666666667
        1187.97916666667)
      Shape = qrsRectangle
    end
    object QRLabel62: TQRLabel
      Left = 282
      Top = 4
      Width = 20
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        746.125
        10.5833333333333
        52.9166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total'
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
    object QRExpr13: TQRExpr
      Left = 393
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1039.8125
        13.2291666666667
        185.208333333333)
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
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsulta.FA_IMPFINAN)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr15: TQRExpr
      Left = 465
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1230.3125
        13.2291666666667
        185.208333333333)
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
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsulta.FA_IMPPAGADO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr14: TQRExpr
      Left = 609
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1611.3125
        13.2291666666667
        185.208333333333)
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
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsulta.FA_IMPVENCIDO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRImpRefVigTot: TQRLabel
      Left = 537
      Top = 5
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1420.8125
        13.2291666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRImpRefVigTot'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
  end
  object QRGroup11: TQRGroup
    Left = 48
    Top = 391
    Width = 720
    Height = 29
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroup11BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      76.7291666666667
      1905)
    Expression = 'qyConsulta.IDGRUPO'
    FooterBand = QRFoot3
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel28: TQRLabel
      Left = 3
      Top = 0
      Width = 34
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        7.9375
        0
        89.9583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Intereses'
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
    object QRShape7: TQRShape
      Left = 1
      Top = 12
      Width = 718
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2.64583333333333
        31.75
        1899.70833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel29: TQRLabel
      Left = 3
      Top = 14
      Width = 35
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        7.9375
        37.0416666666667
        92.6041666666667)
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
    object QRLabel30: TQRLabel
      Left = 49
      Top = 14
      Width = 45
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        129.645833333333
        37.0416666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha Vto'
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
    object QRLabel33: TQRLabel
      Left = 95
      Top = 14
      Width = 45
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        251.354166666667
        37.0416666666667
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha Prog.'
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
    object QRLabel34: TQRLabel
      Left = 143
      Top = 14
      Width = 45
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        378.354166666667
        37.0416666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha Pago'
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
    object QRLabel35: TQRLabel
      Left = 257
      Top = 14
      Width = 27
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        679.979166666667
        37.0416666666667
        71.4375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Dias'
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
    object QRLabel37: TQRLabel
      Left = 284
      Top = 14
      Width = 36
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        751.416666666667
        37.0416666666667
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tasa'
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
      Left = 321
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        849.3125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Intereses'
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
    object QRLabel44: TQRLabel
      Left = 393
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1039.8125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Iva'
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
    object QRLabel45: TQRLabel
      Left = 609
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1611.3125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Vencido'
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
    object QRLabel50: TQRLabel
      Left = 465
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1230.3125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Pagado'
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
    object QRLabel84: TQRLabel
      Left = 680
      Top = 14
      Width = 36
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1799.16666666667
        37.0416666666667
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Situación'
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
    object QRLabel89: TQRLabel
      Left = 537
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1420.8125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Vigente'
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
    object QRLabel96: TQRLabel
      Left = 190
      Top = 14
      Width = 29
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        502.708333333333
        37.0416666666667
        76.7291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'FinAdic'
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
    object QRLabel97: TQRLabel
      Left = 221
      Top = 14
      Width = 34
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        584.729166666667
        37.0416666666667
        89.9583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'T.FinAdic'
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
  object QRGroup5: TQRGroup
    Left = 48
    Top = 420
    Width = 720
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroup5BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      31.75
      1905)
    Expression = 'qyConsulta.NUM_PERIODO'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText51: TQRDBText
      Left = 3
      Top = 2
      Width = 35
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        7.9375
        5.29166666666667
        92.6041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'NUM_PERIODO'
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
    object QRDBText53: TQRDBText
      Left = 49
      Top = 2
      Width = 45
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        129.645833333333
        5.29166666666667
        119.0625)
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
    object QRDBText54: TQRDBText
      Left = 95
      Top = 2
      Width = 45
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        251.354166666667
        5.29166666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_PROG_PAGO_1'
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
    object QRDBText55: TQRDBText
      Left = 143
      Top = 2
      Width = 45
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        378.354166666667
        5.29166666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_PAGO_1'
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
    object QRDBText58: TQRDBText
      Left = 257
      Top = 2
      Width = 25
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        679.979166666667
        5.29166666666667
        66.1458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'PLAZO_1'
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
    object QRDBText59: TQRDBText
      Left = 284
      Top = 2
      Width = 36
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        751.416666666667
        5.29166666666667
        95.25)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'TASA_APLICADA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,##0.000000'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText60: TQRDBText
      Left = 321
      Top = 2
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        849.3125
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_INTERES'
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
    object QRDBText70: TQRDBText
      Left = 393
      Top = 2
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1039.8125
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_IVA'
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
    object QRDBText71: TQRDBText
      Left = 609
      Top = 2
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1611.3125
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMPVENCIDO_1'
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
    object QRDBText72: TQRDBText
      Left = 465
      Top = 2
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1230.3125
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_PAGADO_1'
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
    object QRDBText73: TQRDBText
      Left = 680
      Top = 2
      Width = 36
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1799.16666666667
        5.29166666666667
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'SIT_INTERES'
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
    object QRImpInter: TQRLabel
      Left = 537
      Top = 2
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1420.8125
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRImpInter'
      Color = clWhite
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
    object QRDBText67: TQRDBText
      Left = 190
      Top = 2
      Width = 29
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        502.708333333333
        5.29166666666667
        76.7291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'B_FINAN_ADIC'
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
    object QRDBText68: TQRDBText
      Left = 221
      Top = 2
      Width = 34
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        584.729166666667
        5.29166666666667
        89.9583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'CVE_FINAN_ADIC'
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
  object QRGroup6: TQRGroup
    Left = 48
    Top = 432
    Width = 720
    Height = 29
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroup6BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      76.7291666666667
      1905)
    Expression = 'qyConsulta.IDGRUPO'
    FooterBand = QRFoot4
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel2: TQRLabel
      Left = 3
      Top = 0
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        7.9375
        0
        111.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Conceptos'
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
    object QRShape9: TQRShape
      Left = 1
      Top = 12
      Width = 717
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2.64583333333333
        31.75
        1897.0625)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel10: TQRLabel
      Left = 3
      Top = 14
      Width = 35
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        7.9375
        37.0416666666667
        92.6041666666667)
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
    object QRLabel13: TQRLabel
      Left = 40
      Top = 14
      Width = 132
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        105.833333333333
        37.0416666666667
        349.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Comisión'
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
    object QRLabel40: TQRLabel
      Left = 172
      Top = 15
      Width = 38
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        455.083333333333
        39.6875
        100.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'F.  Vto.'
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
    object QRLabel42: TQRLabel
      Left = 210
      Top = 15
      Width = 38
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        555.625
        39.6875
        100.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'F. Prog'
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
    object QRLabel47: TQRLabel
      Left = 287
      Top = 14
      Width = 33
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        759.354166666667
        37.0416666666667
        87.3125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tasa'
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
      Left = 321
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        849.3125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Concepto'
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
      Left = 393
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1039.8125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Iva'
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
      Left = 609
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1611.3125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Vencido'
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
    object QRLabel55: TQRLabel
      Left = 465
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1230.3125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Pagado'
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
    object QRLabel58: TQRLabel
      Left = 680
      Top = 14
      Width = 36
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1799.16666666667
        37.0416666666667
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Situación'
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
    object QRLabel85: TQRLabel
      Left = 537
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1420.8125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Vigente'
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
    object QRLabel90: TQRLabel
      Left = 248
      Top = 15
      Width = 38
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        656.166666666667
        39.6875
        100.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'F. Pago'
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
  object QRGroup7: TQRGroup
    Left = 48
    Top = 461
    Width = 720
    Height = 2
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      5.29166666666667
      1905)
    Expression = 'qyConsulta.NUM_PERIODO_1'
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGroup9: TQRGroup
    Left = 48
    Top = 463
    Width = 720
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroup9BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      29.1041666666667
      1905)
    Expression = 'qyConsulta.CVE_COMISION'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText7: TQRDBText
      Left = 3
      Top = 2
      Width = 35
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        7.9375
        5.29166666666667
        92.6041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'NUM_PERIODO_1'
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
    object QRDBText8: TQRDBText
      Left = 40
      Top = 2
      Width = 27
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        105.833333333333
        5.29166666666667
        71.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'CVE_COMISION'
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
      Left = 172
      Top = 2
      Width = 38
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        455.083333333333
        5.29166666666667
        100.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_VENCIMIENTO_1'
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
      Left = 210
      Top = 2
      Width = 38
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        555.625
        5.29166666666667
        100.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_PROG_PAGO_2'
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
    object QRDBText52: TQRDBText
      Left = 287
      Top = 3
      Width = 33
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        759.354166666667
        7.9375
        87.3125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'PCT_COMISION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,##0.000000'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText56: TQRDBText
      Left = 321
      Top = 2
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        849.3125
        5.29166666666667
        185.208333333333)
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
    object QRDBText61: TQRDBText
      Left = 393
      Top = 2
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1039.8125
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_IVA_1'
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
    object QRDBText62: TQRDBText
      Left = 609
      Top = 2
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1611.3125
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMPVENCIDO_2'
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
    object QRDBText63: TQRDBText
      Left = 67
      Top = 2
      Width = 105
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        177.270833333333
        5.29166666666667
        277.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_COMISION'
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
    object QRDBText64: TQRDBText
      Left = 465
      Top = 2
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1230.3125
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_PAGADO_2'
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
    object QRDBText65: TQRDBText
      Left = 680
      Top = 2
      Width = 36
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1799.16666666667
        5.29166666666667
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'SIT_COMISION'
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
    object QRImpComis: TQRLabel
      Left = 537
      Top = 2
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1420.8125
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRImpComis'
      Color = clWhite
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
    object QRDBText29: TQRDBText
      Left = 248
      Top = 2
      Width = 38
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        656.166666666667
        5.29166666666667
        100.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_PAGO_2'
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
  object QRGroup8: TQRGroup
    Left = 48
    Top = 474
    Width = 720
    Height = 29
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroup6BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      76.7291666666667
      1905)
    Expression = 'qyConsulta.IDGRUPO'
    FooterBand = QRFoot8
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel91: TQRLabel
      Left = 3
      Top = 0
      Width = 183
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        7.9375
        0
        484.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Condonaciones, Quitas, Quebrantos y/o Castigos'
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
      Left = 1
      Top = 12
      Width = 717
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2.64583333333333
        31.75
        1897.0625)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel92: TQRLabel
      Left = 155
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        410.104166666667
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha Moviento'
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
    object QRLabel93: TQRLabel
      Left = 229
      Top = 14
      Width = 236
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        605.895833333333
        37.0416666666667
        624.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Desc. Operación'
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
    object QRLabel94: TQRLabel
      Left = 537
      Top = 14
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1420.8125
        37.0416666666667
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe'
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
  object QRGroup13: TQRGroup
    Left = 48
    Top = 503
    Width = 720
    Height = 2
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      5.29166666666667
      1905)
    Expression = 'qyConsulta.F_OPERACION_C'
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGroup12: TQRGroup
    Left = 48
    Top = 505
    Width = 720
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroupFinan2BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      29.1041666666667
      1905)
    Expression = 'qyConsulta.DESC_L_OPERACION_C'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText44: TQRDBText
      Left = 167
      Top = 2
      Width = 45
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        441.854166666667
        5.29166666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_OPERACION_C'
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
    object QRDBText31: TQRDBText
      Left = 228
      Top = 2
      Width = 57
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        603.25
        5.29166666666667
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'CVE_OPERACION_C'
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
    object QRDBText33: TQRDBText
      Left = 288
      Top = 2
      Width = 177
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        762
        5.29166666666667
        468.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_L_OPERACION_C'
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
    object QRDBText66: TQRDBText
      Left = 537
      Top = 2
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1420.8125
        5.29166666666667
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_CONCEPTO_C'
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
  object QRFoot8: TQRBand
    Left = 48
    Top = 648
    Width = 720
    Height = 17
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      44.9791666666667
      1905)
    BandType = rbGroupFooter
    object QRShape12: TQRShape
      Left = 320
      Top = 0
      Width = 364
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Style = psInsideFrame
      Size.Values = (
        44.9791666666667
        846.666666666667
        0
        963.083333333333)
      Shape = qrsRectangle
    end
    object QRLabel95: TQRLabel
      Left = 347
      Top = 3
      Width = 20
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        918.104166666667
        7.9375
        52.9166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total'
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
    object QRExpr16: TQRExpr
      Left = 537
      Top = 4
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1420.8125
        10.5833333333333
        185.208333333333)
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
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_CONCEPTO_C)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object QRGpoTramos: TQRGroup
    Left = 48
    Top = 516
    Width = 720
    Height = 29
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroup6BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      76.7291666666667
      1905)
    Expression = 'qyConsulta.IDGRUPO'
    FooterBand = QRFoot4
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel98: TQRLabel
      Left = 3
      Top = 0
      Width = 24
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        7.9375
        0
        63.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tasas '
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
    object QRShape21: TQRShape
      Left = 1
      Top = 12
      Width = 717
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2.64583333333333
        31.75
        1897.0625)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel99: TQRLabel
      Left = 40
      Top = 14
      Width = 67
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        105.833333333333
        37.0416666666667
        177.270833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha Revision'
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
    object QRLabel100: TQRLabel
      Left = 114
      Top = 14
      Width = 79
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        301.625
        37.0416666666667
        209.020833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tasa de referencia'
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
  object QRGroup14: TQRGroup
    Left = 48
    Top = 545
    Width = 720
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroup5BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      31.75
      1905)
    Expression = 'qyConsulta.F_REVISION'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText74: TQRDBText
      Left = 47
      Top = 2
      Width = 45
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        124.354166666667
        5.29166666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_REVISION'
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
    object QRDBText78: TQRDBText
      Left = 133
      Top = 2
      Width = 36
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        351.895833333333
        5.29166666666667
        95.25)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'TASA_TRAMO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,##0.0000'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
  end
  object QRGroupEncGarantias: TQRGroup
    Left = 48
    Top = 557
    Width = 720
    Height = 29
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroupEncGarantiasBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      76.7291666666667
      1905)
    Expression = 'qyConsulta.IDGRUPO'
    FooterBand = QRFooterGarantias
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel102: TQRLabel
      Left = 3
      Top = 0
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
        0
        95.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Garantías'
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
    object QRShape22: TQRShape
      Left = 1
      Top = 12
      Width = 717
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2.64583333333333
        31.75
        1897.0625)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlbl_gar_FOLIO: TQRLabel
      Left = 8
      Top = 14
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        21.1666666666667
        37.0416666666667
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Folio'
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
    object qrlbl_gar_REFERENCIA: TQRLabel
      Left = 56
      Top = 14
      Width = 44
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        148.166666666667
        37.0416666666667
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Referencia'
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
    object qrlbl_gar_PROPORCION: TQRLabel
      Left = 160
      Top = 14
      Width = 49
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        423.333333333333
        37.0416666666667
        129.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Proporción'
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
    object qrlbl_gar_TIPOGARANTIA: TQRLabel
      Left = 215
      Top = 14
      Width = 57
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        568.854166666667
        37.0416666666667
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tipo Garantia'
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
    object qrlbl_gar_IMPORTE: TQRLabel
      Left = 280
      Top = 14
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        740.833333333333
        37.0416666666667
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe'
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
    object qrlbl_gar_DESCRIPCION: TQRLabel
      Left = 335
      Top = 14
      Width = 57
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        886.354166666667
        37.0416666666667
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Descripción'
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
  object QRGroupDetGarantias: TQRGroup
    Left = 48
    Top = 586
    Width = 720
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroupDetGarantiasBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      63.5
      1905)
    Expression = 'qyConsulta.ID_TRANSACCION'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText75: TQRDBText
      Left = 16
      Top = 3
      Width = 31
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        42.3333333333333
        7.9375
        82.0208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'ID_TRANSACCION'
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
    object QRDBText82: TQRDBText
      Left = 61
      Top = 2
      Width = 36
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        161.395833333333
        5.29166666666667
        95.25)
      Alignment = taCenter
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
    object QRDBText76: TQRDBText
      Left = 155
      Top = 2
      Width = 25
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        410.104166666667
        5.29166666666667
        66.1458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'TASA_APLICADA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,##0'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRLabel103: TQRLabel
      Left = 182
      Top = 2
      Width = 14
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        481.541666666667
        5.29166666666667
        37.0416666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = ' A 1'
      Color = clWhite
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
    object QRDBText77: TQRDBText
      Left = 219
      Top = 2
      Width = 50
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        579.4375
        5.29166666666667
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_COMISION'
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
    object QRDBText80: TQRDBText
      Left = 274
      Top = 2
      Width = 53
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        724.958333333333
        5.29166666666667
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'TASA_TRAMO'
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
    object QRDBText81: TQRDBText
      Left = 336
      Top = 2
      Width = 369
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        889
        5.29166666666667
        976.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_L_OPERACION'
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
  object QRFooterGarantias: TQRBand
    Left = 48
    Top = 610
    Width = 720
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRFooterGarantiasBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = QRGroupDetGarantias
    Size.Values = (
      50.2708333333333
      1905)
    BandType = rbGroupFooter
    object QRShape23: TQRShape
      Left = 216
      Top = 0
      Width = 468
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Style = psInsideFrame
      Size.Values = (
        44.9791666666667
        571.5
        0
        1238.25)
      Shape = qrsRectangle
    end
    object QRLabel104: TQRLabel
      Left = 226
      Top = 4
      Width = 20
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        597.958333333333
        10.5833333333333
        52.9166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total'
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
    object QRExpr17: TQRExpr
      Left = 257
      Top = 4
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        679.979166666667
        10.5833333333333
        185.208333333333)
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
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsulta.TASA_TRAMO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object qyConsulta: TQuery
    DatabaseName = 'RCORP'
    SQL.Strings = (
      ''
      '( SELECT 1 AS IDGRUPO,'
      '        0 ID_TRANSACCION,'
      '        CRCRED.ID_CREDITO,'
      '        CRCAP.NUM_PERIODO AS PERCAPITAL,'
      '        CRCAP.PLAZO ,'
      '        CRCAP.F_VENCIMIENTO AS FHVTOCAP,'
      '        CRCAP.F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        CRCRED.TASA_CREDITO,'
      '        CRCAP.IMP_CUOTA IMP_CAPITAL,'
      '        0 IMP_PAGADO,'
      '        DECODE(IMP_CUOTA,'#39'IM'#39',CRCAP.IMP_CUOTA,0) AS IMPVENCIDO,'
      '        CRCRED.SDO_VIG_TOTAL SDO_INSOLUTO,'
      '        CRCAP.SIT_CAPITAL,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_OPERACION,'
      '        '#39#39' AS CVE_OPERACION,'
      '        '#39#39' AS DESC_L_OPERACION,'
      '        0 AS IMP_CONCEPTO,'
      '        0 AS NUM_PERIODO,'
      '        0 AS PLAZO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_VENCIMIENTO ,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        0 AS TASA_APLICADA,'
      '        0 AS IMP_INTERES,'
      '        0 AS IMP_IVA,'
      '        0 AS IMP_PAGADO,'
      '        0 AS IMPVENCIDO,'
      '        '#39#39' AS SIT_INTERES,'
      '        '#39#39' AS B_FINAN_ADIC,'
      '        '#39#39' AS CVE_FINAN_ADIC,'
      '        0 AS NUM_PERIODO,'
      '        '#39#39' AS CVE_COMISION,'
      '        '#39#39' AS DESC_COMISION,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_VENCIMIENTO ,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        0 AS PCT_COMISION,'
      '        0 AS IMP_COMISION,'
      '        0 AS IMP_IVA,'
      '        0 AS IMP_PAGADO,'
      '        0  AS IMPVENCIDO,'
      '        '#39#39' AS SIT_COMISION,'
      '        0 AS FA_NUMPER,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS FA_FVENCIM,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS FA_FPAGO,'
      '        0 AS FA_IMPFINAN,'
      '        0 AS FA_IMPPAGADO,'
      '        0 AS FA_IMPVENCIDO,'
      '        '#39#39' AS FA_SITFINAN'
      '   FROM CR_CREDITO CRCRED,'
      
        '        ( SELECT    ID_REF_SOL_CUOTA,                    NUM_PER' +
        'IODO     ,'
      
        '                    PLAZO           ,                    F_VENCI' +
        'MIENTO   ,'
      
        '                    F_PROG_PAGO     ,                    IMP_CUO' +
        'TA       ,'
      '                    SIT_CAPITAL'
      '           FROM CR_SOL_CUOTA'
      '           WHERE CVE_ACCESORIO = '#39'CP'#39') CRCAP'
      '  WHERE CRCRED.ID_CREDITO = CRCAP.ID_REF_SOL_CUOTA'
      '    AND CRCRED.ID_CREDITO =  :pIdCredito'
      '    AND CRCRED.SIT_CREDITO = '#39'NA'#39
      'UNION'
      'SELECT 1 AS IDGRUPO,'
      '        0 ID_TRANSACCION,'
      '        CRCRED.ID_CREDITO,'
      '        CRCAP.NUM_PERIODO AS PERCAPITAL,'
      '        CRCAP.PLAZO ,'
      '        CRCAP.F_VENCIMIENTO AS FHVTOCAP,'
      '        CRCAP.F_PROG_PAGO,'
      '        CRCAP.F_PAGO,'
      '        CRCRED.TASA_CREDITO,'
      '        CRCAP.IMP_CAPITAL,'
      '        CRCAP.IMP_PAGADO,'
      
        '        DECODE(SIT_CAPITAL,'#39'IM'#39',(CRCAP.IMP_CAPITAL - CRCAP.IMP_P' +
        'AGADO),0) AS IMPVENCIDO,'
      '        CRCRED.SDO_VIG_TOTAL SDO_INSOLUTO,'
      '        CRCAP.SIT_CAPITAL,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_OPERACION,'
      '        '#39#39' AS CVE_OPERACION,'
      '        '#39#39' AS DESC_L_OPERACION,'
      '        0 AS IMP_CONCEPTO,'
      '        0 AS NUM_PERIODO,'
      '        0 AS PLAZO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS  F_VENCIMIENTO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        0 AS TASA_APLICADA,'
      '        0 AS IMP_INTERES,'
      '        0 AS IMP_IVA,'
      '        0 AS IMP_PAGADO,'
      '        0 AS IMPVENCIDO,'
      '        '#39#39' AS SIT_INTERES,'
      '        '#39#39' AS B_FINAN_ADIC,'
      '        '#39#39' AS CVE_FINAN_ADIC,'
      '        0 AS NUM_PERIODO,'
      '        '#39#39' AS CVE_COMISION,'
      '        '#39#39' AS DESC_COMISION,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_VENCIMIENTO ,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        0 AS PCT_COMISION,'
      '        0 AS IMP_COMISION,'
      '        0 AS IMP_IVA,'
      '        0 AS IMP_PAGADO,'
      '        0  AS IMPVENCIDO,'
      '        '#39#39' AS SIT_COMISION,'
      '        0 AS FA_NUMPER,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS FA_FVENCIM,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS FA_FPAGO,'
      '        0 AS FA_IMPFINAN,'
      '        0 AS FA_IMPPAGADO,'
      '        0 AS FA_IMPVENCIDO,'
      '        '#39#39' AS FA_SITFINAN'
      '   FROM CR_CREDITO CRCRED, CR_CAPITAL CRCAP'
      '  WHERE CRCRED.ID_CREDITO = CRCAP.ID_CREDITO'
      '    AND CRCRED.ID_CREDITO =  :pIdCredito'
      '    )'
      'UNION'
      '(SELECT 2 AS IDGRUPO,'
      '        AMORTI.ID_TRANSACCION,'
      '        AMORTI.ID_CREDITO,'
      '        0 AS PERCAPITAL,'
      '        0 AS PLAZO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS FHVTOCAP,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        0 AS TASA_CREDITO,'
      '        0 AS IMP_CAPITAL,'
      '        0 AS IMP_PAGADO,'
      '        0 AS IMPVENCIDO,'
      '        0 AS SDO_INSOLUTO,'
      '        '#39#39' AS SIT_CAPITAL,'
      '        AMORTI.F_OPERACION,'
      '        AMORTI.CVE_OPERACION,'
      '        AMORTI.DESC_L_OPERACION,'
      '        AMORTI.IMP_CONCEPTO,'
      '        0 AS NUM_PERIODO,'
      '        0 AS PLAZO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS  F_VENCIMIENTO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        0 AS TASA_APLICADA,'
      '        0 AS IMP_INTERES,'
      '        0 AS IMP_IVA,'
      '        0 AS IMP_PAGADO,'
      '        0 AS IMPVENCIDO,'
      '        '#39#39' AS SIT_INTERES,'
      '        '#39#39' AS B_FINAN_ADIC,'
      '        '#39#39' AS CVE_FINAN_ADIC,'
      '        0 AS NUM_PERIODO,'
      '        '#39#39' AS CVE_COMISION,'
      '        '#39#39' AS DESC_COMISION,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_VENCIMIENTO ,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        0 AS PCT_COMISION,'
      '        0 AS IMP_COMISION,'
      '        0 AS IMP_IVA,'
      '        0 AS IMP_PAGADO,'
      '        0  AS IMPVENCIDO,'
      '        '#39#39' AS SIT_COMISION,'
      '        0 AS FA_NUMPER,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS FA_FVENCIM,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS FA_FPAGO,'
      '        0 AS FA_IMPFINAN,'
      '        0 AS FA_IMPPAGADO,'
      '        0 AS FA_IMPVENCIDO,'
      '        '#39#39' AS FA_SITFINAN'
      '   FROM'
      
        '        (SELECT CRCRED.ID_CREDITO, CT.F_OPERACION, CT.CVE_OPERAC' +
        'ION,'
      
        '                CO.DESC_L_OPERACION, CDT.IMP_CONCEPTO,CT.ID_TRAN' +
        'SACCION'
      
        '         FROM CR_CREDITO CRCRED,CR_TRANSACCION CT,CR_DET_TRANSAC' +
        ' CDT,CR_OPERACION CO,'
      '                (SELECT DISTINCT(CVE_OPERACION)'
      '                 FROM CR_REL_CON_AFEC'
      '                 WHERE CVE_CONCEPTO = '#39'IMPBRU'#39
      '                 AND CVE_AFECTACION IN ('#39'FNIMPA'#39')'
      '                 AND CVE_AFECTA_SDO = '#39'I'#39
      '                 GROUP BY CVE_OPERACION) CRCA'
      '         WHERE CT.CVE_OPERACION = CRCA.CVE_OPERACION'
      '         AND CT.SIT_TRANSACCION = '#39'AC'#39
      '         AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION'
      '         AND CT.CVE_OPERACION = CDT.CVE_OPERACION'
      '         AND CDT.CVE_CONCEPTO = '#39'IMPBRU'#39
      '         AND CT.CVE_OPERACION = CO.CVE_OPERACION'
      '         AND CT.ID_CREDITO = CRCRED.ID_CREDITO'
      '         AND CRCRED.ID_CREDITO =  :pIdCredito'
      '        UNION ALL'
      
        '         SELECT CRCRED.ID_CREDITO,CT.F_OPERACION, CT.CVE_OPERACI' +
        'ON,'
      
        '                CO.DESC_L_OPERACION, CDT.IMP_CONCEPTO, CT.ID_TRA' +
        'NSACCION'
      
        '         FROM CR_CREDITO CRCRED,CR_TRANSACCION CT,CR_DET_TRANSAC' +
        ' CDT,CR_OPERACION CO,'
      '             (SELECT DISTINCT(CVE_OPERACION)'
      '           FROM CR_REL_CON_AFEC'
      '          WHERE CVE_CONCEPTO = '#39'IMPBRU'#39
      '            AND CVE_AFECTACION IN ('#39'CAIMPA'#39','#39'CIIMPA'#39')'
      '            AND CVE_AFECTA_SDO = '#39'I'#39
      '          GROUP BY CVE_OPERACION) CRCA'
      '  WHERE CT.CVE_OPERACION = CRCA.CVE_OPERACION'
      '    AND CT.CVE_TIPO_MOVTO = '#39'AN'#39
      '    AND CT.SIT_TRANSACCION = '#39'AC'#39
      '    AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION'
      '    AND CT.CVE_OPERACION = CDT.CVE_OPERACION'
      '    AND CDT.CVE_CONCEPTO = '#39'IMPBRU'#39
      '    AND CT.CVE_OPERACION = CO.CVE_OPERACION'
      '    AND CT.ID_CREDITO = CRCRED.ID_CREDITO'
      '    AND CRCRED.ID_CREDITO =  :pIdCredito'
      ' ) AMORTI'
      ')'
      'UNION'
      '(SELECT 3 IDGRUPO,'
      '        0 ID_TRANSACCION,'
      '        FA.ID_CREDITO,'
      '        0 AS PERCAPITAL,'
      '        0 AS PLAZO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS FHVTOCAP,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        0 AS TASA_CREDITO,'
      '        0 AS IMP_CAPITAL,'
      '        0 AS IMP_PAGADO,'
      '        0 AS IMPVENCIDO,'
      '        0 AS SDO_INSOLUTO,'
      '        '#39#39' AS SIT_CAPITAL,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_OPERACION,'
      '        '#39#39' AS CVE_OPERACION,'
      '        '#39#39' AS DESC_L_OPERACION,'
      '        0 AS IMP_CONCEPTO,'
      '        0 AS NUM_PERIODO,'
      
        '        0 AS PLAZO, TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS  F_VEN' +
        'CIMIENTO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        0 AS TASA_APLICADA,'
      '        0 AS IMP_INTERES,'
      '        0 AS IMP_IVA,'
      '        0 AS IMP_PAGADO,'
      '        0 AS IMPVENCIDO,'
      '        '#39#39' AS SIT_INTERES,'
      '        '#39#39' AS B_FINAN_ADIC,'
      '        '#39#39' AS CVE_FINAN_ADIC,'
      '        0 AS NUM_PERIODO,'
      '        '#39#39' AS CVE_COMISION,'
      '        '#39#39' AS DESC_COMISION,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_VENCIMIENTO ,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        0 AS PCT_COMISION,'
      '        0 AS IMP_COMISION,'
      '        0 AS IMP_IVA,'
      '        0 AS IMP_PAGADO,'
      '        0 AS IMPVENCIDO,'
      '        '#39#39' AS SIT_COMISION,'
      '        FA.NUM_PERIODO AS FA_NUMPER,'
      '        FA.F_VENCIMIENTO AS FA_FVENCIM,'
      '        FA.F_PAGO AS FA_FPAGO,'
      '        FA.IMP_FINAN_ADIC AS FA_IMPFINAN,'
      '        FA.IMP_PAGADO AS FA_IMPPAGADO,'
      
        '        DECODE(FA.SIT_FINAN_ADIC,'#39'IM'#39',(FA.IMP_FINAN_ADIC - FA.IM' +
        'P_PAGADO),0) AS FA_IMPVENCIDO,'
      '        FA.SIT_FINAN_ADIC AS FA_SITFINAN'
      '   FROM CR_FINAN_ADIC FA'
      '  WHERE FA.ID_CREDITO =  :pIdCredito'
      ')'
      'UNION'
      '(SELECT 4 IDGRUPO ,'
      '        0 ID_TRANSACCION,'
      '        CRCRED.ID_CREDITO,'
      '        0 AS PERCAPITAL,'
      '        0 AS PLAZO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS FHVTOCAP,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        0 AS TASA_CREDITO,'
      '        0 AS IMP_CAPITAL,'
      '        0 AS IMP_PAGADO,'
      '        0 AS IMPVENCIDO,'
      '        0 AS SDO_INSOLUTO,'
      '        '#39#39' AS SIT_CAPITAL,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_OPERACION,'
      '        '#39#39' AS CVE_OPERACION,'
      '        '#39#39' AS DESC_L_OPERACION,'
      '        0 AS IMP_CONCEPTO,'
      '        INTER.NUM_PERIODO,'
      '        INTER.PLAZO,'
      '        INTER.F_VENCIMIENTO,'
      '        INTER.F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        TASA_CREDITO AS TASA_APLICADA,'
      '        INTER.IMP_CUOTA,'
      '        0 IMP_IVA,'
      '        0 IMP_PAGADO,'
      
        '        DECODE(SIT_CAPITAL,'#39'IM'#39',INTER.IMP_CUOTA,0) AS IMPVENCIDO' +
        ','
      '        INTER.SIT_CAPITAL,'
      '        INTER.B_FINAN_ADIC,'
      '        INTER.CVE_FINAN_ADIC,'
      '        0 AS NUM_PERIODO,'
      '        '#39#39' AS CVE_COMISION,'
      '        '#39#39' AS DESC_COMISION,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_VENCIMIENTO ,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        0 AS PCT_COMISION,'
      '        0 AS IMP_COMISION,'
      '        0 AS IMP_IVA,'
      '        0 AS IMP_PAGADO,'
      '        0 AS IMPVENCIDO,'
      '        '#39#39' AS SIT_COMISION,'
      '        0 AS FA_NUMPER,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS FA_FVENCIM,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS FA_FPAGO,'
      '        0 AS FA_IMPFINAN,'
      '        0 AS FA_IMPPAGADO,'
      '        0 AS FA_IMPVENCIDO,'
      '        '#39#39' AS FA_SITFINAN'
      '   FROM CR_CREDITO CRCRED,'
      
        '        ( SELECT    ID_REF_SOL_CUOTA,                    NUM_PER' +
        'IODO     ,'
      
        '                    PLAZO           ,                    F_VENCI' +
        'MIENTO   ,'
      
        '                    F_PROG_PAGO     ,                    IMP_CUO' +
        'TA       ,'
      
        '                    SIT_CAPITAL     ,                    B_FINAN' +
        '_ADIC,'
      '                    CVE_FINAN_ADIC'
      '           FROM CR_SOL_CUOTA'
      '           WHERE CVE_ACCESORIO = '#39'IN'#39') INTER'
      '   WHERE CRCRED.ID_CREDITO = INTER.ID_REF_SOL_CUOTA'
      '    AND CRCRED.ID_CREDITO =  :pIdCredito'
      '    AND CRCRED.SIT_CREDITO = '#39'NA'#39'  '
      'UNION'
      'SELECT 4 IDGRUPO ,'
      '        0 ID_TRANSACCION,'
      '        CRCRED.ID_CREDITO,'
      '        0 AS PERCAPITAL,'
      '        0 AS PLAZO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS FHVTOCAP,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        0 AS TASA_CREDITO,'
      '        0 AS IMP_CAPITAL,'
      '        0 AS IMP_PAGADO,'
      '        0 AS IMPVENCIDO,'
      '        0 AS SDO_INSOLUTO,'
      '        '#39#39' AS SIT_CAPITAL,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_OPERACION,'
      '        '#39#39' AS CVE_OPERACION,'
      '        '#39#39' AS DESC_L_OPERACION,'
      '        0 AS IMP_CONCEPTO,'
      '        INTER.NUM_PERIODO,'
      '        INTER.PLAZO,'
      '        INTER.F_VENCIMIENTO,'
      '        INTER.F_PROG_PAGO,'
      '        INTER.F_PAGO,'
      '        INTER.TASA_APLICADA,'
      '        INTER.IMP_INTERES,'
      '        INTER.IMP_IVA,'
      '        INTER.IMP_PAGADO,'
      
        '        DECODE(SIT_INTERES,'#39'IM'#39',(INTER.IMP_INTERES - INTER.IMP_P' +
        'AGADO),0) AS IMPVENCIDO,'
      '        INTER.SIT_INTERES,'
      '        INTER.B_FINAN_ADIC,'
      '        INTER.CVE_FINAN_ADIC,'
      '        0 AS NUM_PERIODO,'
      '        '#39#39' AS CVE_COMISION,'
      '        '#39#39' AS DESC_COMISION,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_VENCIMIENTO ,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        0 AS PCT_COMISION,'
      '        0 AS IMP_COMISION,'
      '        0 AS IMP_IVA,'
      '        0 AS IMP_PAGADO,'
      '        0 AS IMPVENCIDO,'
      '        '#39#39' AS SIT_COMISION,'
      '        0 AS FA_NUMPER,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS FA_FVENCIM,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS FA_FPAGO,'
      '        0 AS FA_IMPFINAN,'
      '        0 AS FA_IMPPAGADO,'
      '        0 AS FA_IMPVENCIDO,'
      '        '#39#39' AS FA_SITFINAN'
      '   FROM CR_INTERES INTER, CR_CREDITO CRCRED'
      '  WHERE INTER.ID_CREDITO = CRCRED.ID_CREDITO'
      '    AND CRCRED.ID_CREDITO =  :pIdCredito'
      ')'
      'UNION'
      '(SELECT 5 IDGRUPO,'
      '        0 ID_TRANSACCION,'
      '        CRCRED.ID_CREDITO,'
      '        0 AS PERCAPITAL,'
      '        0 AS PLAZO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS FHVTOCAP,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        0 AS TASA_CREDITO,'
      '        0 AS IMP_CAPITAL,'
      '        0 AS IMP_PAGADO,'
      '        0 AS IMPVENCIDO,'
      '        0 AS SDO_INSOLUTO,'
      '        '#39#39' AS SIT_CAPITAL,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_OPERACION,'
      '        '#39#39' AS CVE_OPERACION,'
      '        '#39#39' AS DESC_L_OPERACION,'
      '        0 AS IMP_CONCEPTO,'
      '        0 AS NUM_PERIODO,'
      
        '        0 AS PLAZO, TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS  F_VEN' +
        'CIMIENTO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PROG_PAGO,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS F_PAGO,'
      '        0 AS TASA_APLICADA,'
      '        0 AS IMP_INTERES,'
      '        0 AS IMP_IVA,'
      '        0 AS IMP_PAGADO,'
      '        0 AS IMPVENCIDO,'
      '        '#39#39' AS SIT_INTERES,'
      '        '#39#39' AS B_FINAN_ADIC,'
      '        '#39#39' AS CVE_FINAN_ADIC,'
      '        COM.NUM_PERIODO,'
      '        COM.CVE_COMISION,'
      '        CATCOM.DESC_COMISION,'
      '        COM.F_VENCIMIENTO ,'
      '        COM.F_PROG_PAGO,'
      '        COM.F_PAGO,'
      
        '        DECODE(COM.CVE_COMISION,'#39'CODI'#39',CRCRED.PCT_COMISION,COM.P' +
        'CT_COMISION)PCT_COMISION,'
      '        COM.IMP_COMISION,'
      '        COM.IMP_IVA,'
      '        COM.IMP_PAGADO + COM.IMP_IVA_PAGADO  IMP_PAGADO,'
      
        '        DECODE(SIT_COMISION,'#39'IM'#39',(COM.IMP_COMISION - COM.IMP_PAG' +
        'ADO),0) AS IMPVENCIDO,'
      '        COM.SIT_COMISION,'
      '        0 AS FA_NUMPER,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS FA_FVENCIM,'
      '        TO_DATE('#39'01/01/2000'#39','#39'DD/MM/YYYY'#39') AS FA_FPAGO,'
      '        0 AS FA_IMPFINAN,'
      '        0 AS FA_IMPPAGADO,'
      '        0 AS FA_IMPVENCIDO,'
      '        '#39#39' AS FA_SITFINAN'
      
        '   FROM CR_COMISION COM, CR_CREDITO CRCRED, CR_CAT_COMISION CATC' +
        'OM'
      '  WHERE COM.ID_CREDITO = CRCRED.ID_CREDITO'
      '    AND CATCOM.CVE_COMISION = COM.CVE_COMISION'
      '    AND CRCRED.ID_CREDITO =  :pIdCredito'
      ')'
      'ORDER BY IDGRUPO'
      ''
      ' '
      ''
      ' '
      ''
      ' ')
    Left = 248
    Top = 94
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIdCredito'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'pIdCredito'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'pIdCredito'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'pIdCredito'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'pIdCredito'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'pIdCredito'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'pIdCredito'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'pIdCredito'
        ParamType = ptInput
      end>
    object qyConsultaIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qyConsultaID_TRANSACCION: TFloatField
      FieldName = 'ID_TRANSACCION'
    end
    object qyConsultaID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyConsultaPERCAPITAL: TFloatField
      FieldName = 'PERCAPITAL'
    end
    object qyConsultaPLAZO: TFloatField
      FieldName = 'PLAZO'
    end
    object qyConsultaFHVTOCAP: TDateTimeField
      FieldName = 'FHVTOCAP'
    end
    object qyConsultaF_PROG_PAGO: TDateTimeField
      FieldName = 'F_PROG_PAGO'
    end
    object qyConsultaF_PAGO: TDateTimeField
      FieldName = 'F_PAGO'
    end
    object qyConsultaTASA_CREDITO: TFloatField
      FieldName = 'TASA_CREDITO'
    end
    object qyConsultaIMP_CAPITAL: TFloatField
      FieldName = 'IMP_CAPITAL'
    end
    object qyConsultaIMP_PAGADO: TFloatField
      FieldName = 'IMP_PAGADO'
    end
    object qyConsultaIMPVENCIDO: TFloatField
      FieldName = 'IMPVENCIDO'
    end
    object qyConsultaSDO_INSOLUTO: TFloatField
      FieldName = 'SDO_INSOLUTO'
    end
    object qyConsultaSIT_CAPITAL: TStringField
      FieldName = 'SIT_CAPITAL'
      Size = 2
    end
    object qyConsultaF_OPERACION: TDateTimeField
      FieldName = 'F_OPERACION'
    end
    object qyConsultaCVE_OPERACION: TStringField
      FieldName = 'CVE_OPERACION'
      Size = 6
    end
    object qyConsultaDESC_L_OPERACION: TStringField
      FieldName = 'DESC_L_OPERACION'
      Size = 50
    end
    object qyConsultaIMP_CONCEPTO: TFloatField
      FieldName = 'IMP_CONCEPTO'
    end
    object qyConsultaNUM_PERIODO: TFloatField
      FieldName = 'NUM_PERIODO'
    end
    object qyConsultaPLAZO_1: TFloatField
      FieldName = 'PLAZO_1'
    end
    object qyConsultaF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qyConsultaF_PROG_PAGO_1: TDateTimeField
      FieldName = 'F_PROG_PAGO_1'
    end
    object qyConsultaF_PAGO_1: TDateTimeField
      FieldName = 'F_PAGO_1'
    end
    object qyConsultaTASA_APLICADA: TFloatField
      FieldName = 'TASA_APLICADA'
    end
    object qyConsultaIMP_INTERES: TFloatField
      FieldName = 'IMP_INTERES'
    end
    object qyConsultaIMP_IVA: TFloatField
      FieldName = 'IMP_IVA'
    end
    object qyConsultaIMP_PAGADO_1: TFloatField
      FieldName = 'IMP_PAGADO_1'
    end
    object qyConsultaIMPVENCIDO_1: TFloatField
      FieldName = 'IMPVENCIDO_1'
    end
    object qyConsultaSIT_INTERES: TStringField
      FieldName = 'SIT_INTERES'
      Size = 2
    end
    object qyConsultaNUM_PERIODO_1: TFloatField
      FieldName = 'NUM_PERIODO_1'
    end
    object qyConsultaCVE_COMISION: TStringField
      FieldName = 'CVE_COMISION'
      Size = 6
    end
    object qyConsultaDESC_COMISION: TStringField
      FieldName = 'DESC_COMISION'
      Size = 80
    end
    object qyConsultaF_VENCIMIENTO_1: TDateTimeField
      FieldName = 'F_VENCIMIENTO_1'
    end
    object qyConsultaF_PROG_PAGO_2: TDateTimeField
      FieldName = 'F_PROG_PAGO_2'
    end
    object qyConsultaF_PAGO_2: TDateTimeField
      FieldName = 'F_PAGO_2'
    end
    object qyConsultaPCT_COMISION: TFloatField
      FieldName = 'PCT_COMISION'
    end
    object qyConsultaIMP_COMISION: TFloatField
      FieldName = 'IMP_COMISION'
    end
    object qyConsultaIMP_IVA_1: TFloatField
      FieldName = 'IMP_IVA_1'
    end
    object qyConsultaIMP_PAGADO_2: TFloatField
      FieldName = 'IMP_PAGADO_2'
    end
    object qyConsultaIMPVENCIDO_2: TFloatField
      FieldName = 'IMPVENCIDO_2'
    end
    object qyConsultaSIT_COMISION: TStringField
      FieldName = 'SIT_COMISION'
      Size = 2
    end
    object qyConsultaFA_NUMPER: TFloatField
      FieldName = 'FA_NUMPER'
    end
    object qyConsultaFA_FVENCIM: TDateTimeField
      FieldName = 'FA_FVENCIM'
    end
    object qyConsultaFA_FPAGO: TDateTimeField
      FieldName = 'FA_FPAGO'
    end
    object qyConsultaFA_IMPFINAN: TFloatField
      FieldName = 'FA_IMPFINAN'
    end
    object qyConsultaFA_IMPPAGADO: TFloatField
      FieldName = 'FA_IMPPAGADO'
    end
    object qyConsultaFA_SITFINAN: TStringField
      FieldName = 'FA_SITFINAN'
      Size = 0
    end
    object qyConsultaFA_IMPVENCIDO: TFloatField
      FieldName = 'FA_IMPVENCIDO'
    end
    object qyConsultaSUMA: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SUMA'
      Calculated = True
    end
    object qyConsultaF_OPERACION_C: TDateTimeField
      FieldName = 'F_OPERACION_C'
    end
    object qyConsultaCVE_OPERACION_C: TStringField
      FieldName = 'CVE_OPERACION_C'
      Size = 6
    end
    object qyConsultaDESC_L_OPERACION_C: TStringField
      FieldName = 'DESC_L_OPERACION_C'
      Size = 50
    end
    object qyConsultaIMP_CONCEPTO_C: TFloatField
      FieldName = 'IMP_CONCEPTO_C'
    end
    object qyConsultaID_TRANSACCION_C: TFloatField
      FieldName = 'ID_TRANSACCION_C'
    end
    object qyConsultaB_FINAN_ADIC: TStringField
      FieldName = 'B_FINAN_ADIC'
      Size = 1
    end
    object qyConsultaCVE_FINAN_ADIC: TStringField
      FieldName = 'CVE_FINAN_ADIC'
      Size = 2
    end
    object qyConsultaTASA_TRAMO: TFloatField
      FieldName = 'TASA_TRAMO'
    end
    object qyConsultaF_REVISION: TDateTimeField
      FieldName = 'F_REVISION'
    end
  end
  object qyEncabezado: TQuery
    DatabaseName = 'RCORP'
    Left = 327
    Top = 92
    object qyEncabezadoID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyEncabezadoSIT_CREDITO: TStringField
      FieldName = 'SIT_CREDITO'
      Size = 2
    end
    object qyEncabezadoIMP_CREDITO: TFloatField
      FieldName = 'IMP_CREDITO'
    end
    object qyEncabezadoF_ALTA: TDateTimeField
      FieldName = 'F_ALTA'
    end
    object qyEncabezadoF_AUTORIZA: TDateTimeField
      FieldName = 'F_AUTORIZA'
    end
    object qyEncabezadoF_INICIO: TDateTimeField
      FieldName = 'F_INICIO'
    end
    object qyEncabezadoF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qyEncabezadoDIAS_PLAZO: TFloatField
      FieldName = 'DIAS_PLAZO'
    end
    object qyEncabezadoSDO_INSOLUTO: TFloatField
      FieldName = 'SDO_INSOLUTO'
    end
    object qyEncabezadoCVE_TASA_REFER: TStringField
      FieldName = 'CVE_TASA_REFER'
      Size = 8
    end
    object qyEncabezadoTASA_BASE: TFloatField
      FieldName = 'TASA_BASE'
    end
    object qyEncabezadoOPERADOR_STASA: TStringField
      FieldName = 'OPERADOR_STASA'
      Size = 1
    end
    object qyEncabezadoSOBRETASA: TFloatField
      FieldName = 'SOBRETASA'
    end
    object qyEncabezadoTASA_CREDITO: TFloatField
      FieldName = 'TASA_CREDITO'
    end
    object qyEncabezadoCVE_AMORTIZACION: TStringField
      FieldName = 'CVE_AMORTIZACION'
      Size = 2
    end
    object qyEncabezadoCVE_PAG_INTERES: TStringField
      FieldName = 'CVE_PAG_INTERES'
      Size = 2
    end
    object qyEncabezadoFACT_MORAS: TFloatField
      FieldName = 'FACT_MORAS'
    end
    object qyEncabezadoID_CRE_RENOVADO: TFloatField
      FieldName = 'ID_CRE_RENOVADO'
    end
    object qyEncabezadoID_CRE_RENUEVA: TFloatField
      FieldName = 'ID_CRE_RENUEVA'
    end
    object qyEncabezadoCVE_CALCULO: TStringField
      FieldName = 'CVE_CALCULO'
      Size = 2
    end
    object qyEncabezadoID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object qyEncabezadoACREDITADO: TStringField
      FieldName = 'ACREDITADO'
      Size = 80
    end
    object qyEncabezadoCVE_PRODUCTO_CRE: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 6
    end
    object qyEncabezadoDESC_L_PRODUCTO: TStringField
      FieldName = 'DESC_L_PRODUCTO'
      Size = 80
    end
    object qyEncabezadoCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyEncabezadoDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyEncabezadoDESC_AMORTIZA: TStringField
      FieldName = 'DESC_AMORTIZA'
      Size = 250
    end
    object qyEncabezadoDESC_CALCULO: TStringField
      FieldName = 'DESC_CALCULO'
      Size = 80
    end
    object qyEncabezadoPERIODOINT: TFloatField
      FieldName = 'PERIODOINT'
    end
    object qyEncabezadoFECHVENINT: TDateTimeField
      FieldName = 'FECHVENINT'
    end
    object qyEncabezadoPERIODOCAP: TFloatField
      FieldName = 'PERIODOCAP'
    end
    object qyEncabezadoFECHVENCAP: TDateTimeField
      FieldName = 'FECHVENCAP'
    end
    object qyEncabezadoDESC_PAG_INTERES: TStringField
      FieldName = 'DESC_PAG_INTERES'
    end
    object qyEncabezadoSDO_VIG_TOTAL: TFloatField
      FieldName = 'SDO_VIG_TOTAL'
    end
    object qyEncabezadoPRUEBA: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PRUEBA'
      Calculated = True
    end
    object qyEncabezadoTASA_APLICADA: TFloatField
      FieldName = 'TASA_APLICADA'
    end
    object qyEncabezadoCHEQUERA: TStringField
      FieldName = 'CHEQUERA'
      Size = 15
    end
    object qyEncabezadoTIPO_CREDITO: TStringField
      FieldName = 'TIPO_CREDITO'
    end
    object qyEncabezadoCVE_CALCULO_M: TStringField
      FieldName = 'CVE_CALCULO_M'
      Size = 2
    end
    object qyEncabezadoID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qyEncabezadoF_TRASPASO_VENC: TDateTimeField
      FieldName = 'F_TRASPASO_VENC'
    end
    object qyEncabezadoEVIDENCIA: TStringField
      FieldName = 'EVIDENCIA'
      FixedChar = True
      Size = 21
    end
  end
  object Query1: TQuery
    DatabaseName = 'DCORP'
    Left = 319
    Top = 4
    object FloatField1: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object StringField1: TStringField
      FieldName = 'SIT_CREDITO'
      Size = 2
    end
    object FloatField2: TFloatField
      FieldName = 'IMP_CREDITO'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'F_ALTA'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'F_AUTORIZA'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'F_INICIO'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object FloatField3: TFloatField
      FieldName = 'DIAS_PLAZO'
    end
    object FloatField4: TFloatField
      FieldName = 'SDO_INSOLUTO'
    end
    object StringField2: TStringField
      FieldName = 'CVE_TASA_REFER'
      Size = 8
    end
    object FloatField5: TFloatField
      FieldName = 'TASA_BASE'
    end
    object StringField3: TStringField
      FieldName = 'OPERADOR_STASA'
      Size = 1
    end
    object FloatField6: TFloatField
      FieldName = 'SOBRETASA'
    end
    object FloatField7: TFloatField
      FieldName = 'TASA_CREDITO'
    end
    object StringField4: TStringField
      FieldName = 'CVE_AMORTIZACION'
      Size = 2
    end
    object StringField5: TStringField
      FieldName = 'CVE_PAG_INTERES'
      Size = 2
    end
    object FloatField8: TFloatField
      FieldName = 'FACT_MORAS'
    end
    object FloatField9: TFloatField
      FieldName = 'ID_CRE_RENOVADO'
    end
    object FloatField10: TFloatField
      FieldName = 'ID_CRE_RENUEVA'
    end
    object StringField6: TStringField
      FieldName = 'CVE_CALCULO'
      Size = 2
    end
    object FloatField11: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object StringField7: TStringField
      FieldName = 'ACREDITADO'
      Size = 80
    end
    object StringField8: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 6
    end
    object StringField9: TStringField
      FieldName = 'DESC_L_PRODUCTO'
      Size = 80
    end
    object FloatField12: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object StringField10: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object StringField11: TStringField
      FieldName = 'DESC_AMORTIZA'
      Size = 250
    end
    object StringField12: TStringField
      FieldName = 'DESC_CALCULO'
      Size = 80
    end
    object FloatField13: TFloatField
      FieldName = 'PERIODOINT'
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'FECHVENINT'
    end
    object FloatField14: TFloatField
      FieldName = 'PERIODOCAP'
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'FECHVENCAP'
    end
    object StringField13: TStringField
      FieldName = 'DESC_PAG_INTERES'
    end
    object FloatField15: TFloatField
      FieldName = 'SDO_VIG_TOTAL'
    end
    object FloatField16: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PRUEBA'
      Calculated = True
    end
    object FloatField17: TFloatField
      FieldName = 'TASA_APLICADA'
    end
    object StringField14: TStringField
      FieldName = 'CHEQUERA'
      Size = 15
    end
    object StringField15: TStringField
      FieldName = 'TIPO_CREDITO'
    end
    object StringField16: TStringField
      FieldName = 'CVE_CALCULO_M'
      Size = 2
    end
  end
end
