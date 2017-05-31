object QRCarteraRie: TQRCarteraRie
  Left = -21
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = QCarteVig
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
  SnapToGrid = True
  Units = MM
  Zoom = 100
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
    Width = 980
    Height = 23
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clBlack
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      60.8541666666667
      2592.91666666667)
    BandType = rbColumnHeader
    object QRLabel1: TQRLabel
      Left = 40
      Top = 5
      Width = 83
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        105.833333333333
        13.2291666666667
        219.604166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'MERCADO OBJETIVO'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel2: TQRLabel
      Left = 236
      Top = 5
      Width = 33
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        624.416666666667
        13.2291666666667
        87.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ESTADO'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel3: TQRLabel
      Left = 352
      Top = 5
      Width = 69
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        931.333333333333
        13.2291666666667
        182.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'SEC ECONOMICO'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel4: TQRLabel
      Left = 656
      Top = 5
      Width = 32
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1735.66666666667
        13.2291666666667
        84.6666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CAP VIG'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel5: TQRLabel
      Left = 724
      Top = 5
      Width = 40
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1915.58333333333
        13.2291666666667
        105.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'SO INSOL.'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel6: TQRLabel
      Left = 817
      Top = 5
      Width = 35
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2161.64583333333
        13.2291666666667
        92.6041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CLIENTE'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel7: TQRLabel
      Left = 555
      Top = 5
      Width = 74
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1468.4375
        13.2291666666667
        195.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TASA REFERENCIA'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel8: TQRLabel
      Left = 168
      Top = 5
      Width = 36
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        444.5
        13.2291666666667
        95.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'MONEDA'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel9: TQRLabel
      Left = 952
      Top = 5
      Width = 24
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2518.83333333333
        13.2291666666667
        63.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CRED'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel10: TQRLabel
      Left = 1
      Top = 5
      Width = 9
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2.64583333333333
        13.2291666666667
        23.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ID'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel11: TQRLabel
      Left = 152
      Top = 5
      Width = 9
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        402.166666666667
        13.2291666666667
        23.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ID'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel12: TQRLabel
      Left = 331
      Top = 5
      Width = 9
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        875.770833333333
        13.2291666666667
        23.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ID'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel13: TQRLabel
      Left = 523
      Top = 5
      Width = 9
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1383.77083333333
        13.2291666666667
        23.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ID'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel14: TQRLabel
      Left = 789
      Top = 5
      Width = 9
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2087.5625
        13.2291666666667
        23.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ID'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel15: TQRLabel
      Left = 435
      Top = 5
      Width = 70
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1150.9375
        13.2291666666667
        185.208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'GPO ECONOMICO'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object QRBand3: TQRBand
    Left = 38
    Top = 145
    Width = 980
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
      2592.91666666667)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 168
      Top = 1
      Width = 65
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        444.5
        2.64583333333333
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText2: TQRDBText
      Left = 40
      Top = 1
      Width = 109
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        105.833333333333
        2.64583333333333
        288.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'MERCADO_OBJETIVO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText3: TQRDBText
      Left = 352
      Top = 1
      Width = 81
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        931.333333333333
        2.64583333333333
        214.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'SECTOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###.0000%'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText4: TQRDBText
      Left = 555
      Top = 1
      Width = 99
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1468.4375
        2.64583333333333
        261.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'TASA_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText5: TQRDBText
      Left = 656
      Top = 1
      Width = 63
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1735.66666666667
        2.64583333333333
        166.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'CAPITAL_VIGENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText6: TQRDBText
      Left = 724
      Top = 1
      Width = 63
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1915.58333333333
        2.64583333333333
        166.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'SALDO_INSOLUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText7: TQRDBText
      Left = 817
      Top = 1
      Width = 133
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        2161.64583333333
        2.64583333333333
        351.895833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'ACREDITADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText8: TQRDBText
      Left = 952
      Top = 1
      Width = 24
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        2518.83333333333
        2.64583333333333
        63.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText9: TQRDBText
      Left = 152
      Top = 1
      Width = 13
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        402.166666666667
        2.64583333333333
        34.3958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'CLAVE_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText10: TQRDBText
      Left = 1
      Top = 1
      Width = 36
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        2.64583333333333
        2.64583333333333
        95.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'CLAVE_MERCADO_OBJETIVO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText11: TQRDBText
      Left = 236
      Top = 1
      Width = 91
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        624.416666666667
        2.64583333333333
        240.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'DESC_POBLACION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###.0000%'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText12: TQRDBText
      Left = 331
      Top = 1
      Width = 18
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        875.770833333333
        2.64583333333333
        47.625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'CLAVE_SECTOR_ECO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText13: TQRDBText
      Left = 523
      Top = 1
      Width = 30
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1383.77083333333
        2.64583333333333
        79.375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'CLAVE_TASA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText14: TQRDBText
      Left = 789
      Top = 1
      Width = 25
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        2087.5625
        2.64583333333333
        66.1458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'ID_ACREDITADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText15: TQRDBText
      Left = 435
      Top = 1
      Width = 85
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1150.9375
        2.64583333333333
        224.895833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'GRUPO_ECO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###.0000%'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
  end
  object QCarteVig: TQuery
    DatabaseName = 'PCORP'
    SQL.Strings = (
      ' SELECT '
      '       DimCre.ID_OLTP_MERC_OBJ_DET AS CLAVE_MERCADO_OBJETIVO, '
      '       DimCre.MERC_OBJ_DET AS MERCADO_OBJETIVO, '
      '       DimCre.ID_OLTP_MONEDA AS CLAVE_MONEDA, '
      '       DimCre.MONEDA, '
      '       PER.CVE_TIPO_SECTOR AS CLAVE_SECTOR, '
      '       SEC.DESC_SECTOR AS SECTOR, '
      '       CICRE.CVE_TASA_REFER AS CLAVE_TASA, '
      '       TI_CICRE.DESC_TASA_INDIC AS TASA_CREDITO, '
      '       SEC_EC.CVE_SECTOR_ECO AS CLAVE_SECTOR_ECO, '
      '       SEC_EC.DESC_SECTOR_ECO AS SECTOR_ECO, '
      '       GE.DESC_GRUPO_ECO AS GRUPO_ECO, '
      '       FacCre.Imp_Sdo_K_Vig_VP CAPITAL_VIGENTE, '
      '      (FacCre.Imp_Sdo_K_Vig_VP + '
      '       FacCre.Imp_Sdo_K_Imp_VP + '
      '       FacCre.IMP_SDO_K_VEN + '
      '       FacCre.Imp_Int_Corte_VP + '
      '       FacCre.Imp_Sdo_IO_Imp_VP + '
      '       FacCre.IMP_INT_DEV_VDO - '
      '       FacCre.IMP_INT_COB_ANT_VP) SALDO_INSOLUTO, '
      '       DimCre.ID_OLTP_ACREDITADO AS ID_ACREDITADO, '
      '       DimCre.ACREDITADO, '
      '       DimCre.CREDITO, '
      '       pob.DESC_POBLACION '
      
        ' from (SELECT * FROM DM_CR_FAC_Credito@dwhc WHERE ID_ANIO_MES = ' +
        '306) FacCre, '
      '      (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre) DimCre,'
      '      (SELECT * FROM PERSONA)  PER,'
      '      (SELECT * FROM SECTOR) SEC, '
      '      (SELECT * FROM CR_CREDITO) CICRE, '
      '      (SELECT * FROM TASA_INDIC_FINAN) TI_CICRE, '
      '      (SELECT * FROM CONTRATO) CONT, '
      '      (SELECT * FROM domicilio) dom, '
      '      (SELECT * FROM poblacion) pob, '
      '      (select * from CR_ACREDITADO) CLI, '
      '      (SELECT * FROM CR_GRUPO_ECO) GE, '
      '      (select * FROM cr_sector_eco) SEC_EC '
      ' where FacCre.ID_CREDITO = DimCre.ID_CREDITO '
      ' AND   PER.ID_PERSONA = DimCre.ID_OLTP_ACREDITADO '
      ' AND   SEC.CVE_SECTOR = PER.CVE_TIPO_SECTOR '
      ' AND   CICRE.ID_CREDITO (+)= DimCre.CREDITO '
      ' AND   TI_CICRE.CVE_TASA_INDICAD (+)= CICRE.CVE_TASA_REFER '
      ' AND   CONT.ID_CONTRATO = CICRE.ID_CONTRATO '
      ' AND   DOM.ID_DOMICILIO = CONT.ID_DOMICILIO '
      ' AND   dom.cve_estado = pob.cve_poblacion '
      ' AND   CLI.ID_ACREDITADO = DimCre.ID_OLTP_ACREDITADO '
      ' AND   SEC_EC.CVE_SECTOR_ECO = CLI.CVE_SECTOR_ECO '
      ' AND   GE.CVE_GRUPO_ECO (+)= CLI.CVE_GRUPO_ECO')
    Left = 248
    Top = 16
    object QCarteVigCLAVE_MERCADO_OBJETIVO: TStringField
      FieldName = 'CLAVE_MERCADO_OBJETIVO'
      Size = 10
    end
    object QCarteVigMERCADO_OBJETIVO: TStringField
      FieldName = 'MERCADO_OBJETIVO'
      Size = 100
    end
    object QCarteVigCLAVE_MONEDA: TFloatField
      FieldName = 'CLAVE_MONEDA'
    end
    object QCarteVigMONEDA: TStringField
      FieldName = 'MONEDA'
      Size = 50
    end
    object QCarteVigCLAVE_SECTOR: TStringField
      FieldName = 'CLAVE_SECTOR'
      Size = 2
    end
    object QCarteVigSECTOR: TStringField
      FieldName = 'SECTOR'
      Size = 80
    end
    object QCarteVigCLAVE_TASA: TStringField
      FieldName = 'CLAVE_TASA'
      Size = 8
    end
    object QCarteVigTASA_CREDITO: TStringField
      FieldName = 'TASA_CREDITO'
      Size = 30
    end
    object QCarteVigCLAVE_SECTOR_ECO: TStringField
      FieldName = 'CLAVE_SECTOR_ECO'
      Size = 4
    end
    object QCarteVigSECTOR_ECO: TStringField
      FieldName = 'SECTOR_ECO'
      Size = 250
    end
    object QCarteVigCAPITAL_VIGENTE: TFloatField
      FieldName = 'CAPITAL_VIGENTE'
    end
    object QCarteVigSALDO_INSOLUTO: TFloatField
      FieldName = 'SALDO_INSOLUTO'
    end
    object QCarteVigID_ACREDITADO: TFloatField
      FieldName = 'ID_ACREDITADO'
    end
    object QCarteVigACREDITADO: TStringField
      FieldName = 'ACREDITADO'
      Size = 100
    end
    object QCarteVigCREDITO: TStringField
      FieldName = 'CREDITO'
      Size = 10
    end
    object QCarteVigDESC_POBLACION: TStringField
      FieldName = 'DESC_POBLACION'
      Size = 40
    end
    object QCarteVigGRUPO_ECO: TStringField
      FieldName = 'GRUPO_ECO'
      Size = 250
    end
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 561
    Top = 16
  end
end
