object qrCartTot: TqrCartTot
  Left = 0
  Top = 0
  Width = 1267
  Height = 979
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qry
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
  Zoom = 120
  object PageHeaderBand1: TQRBand
    Left = 45
    Top = 45
    Width = 1176
    Height = 101
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
      222.690972222222
      2592.91666666667)
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
        222.690972222222
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
  object header4: TQRBand
    Left = 45
    Top = 146
    Width = 1176
    Height = 80
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      176.388888888889
      2592.91666666667)
    BandType = rbColumnHeader
    object h59: TQRLabel
      Left = 1086
      Top = 64
      Width = 80
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        2394.47916666667
        141.111111111111
        176.388888888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total Reservas'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h58: TQRLabel
      Left = 994
      Top = 64
      Width = 46
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        2191.63194444444
        141.111111111111
        101.423611111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Res/Exp'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h57: TQRLabel
      Left = 900
      Top = 64
      Width = 49
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1984.375
        141.111111111111
        108.038194444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Res./cub'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h56: TQRLabel
      Left = 804
      Top = 64
      Width = 64
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1772.70833333333
        141.111111111111
        141.111111111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '% expuesto'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h55: TQRLabel
      Left = 694
      Top = 64
      Width = 60
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1530.17361111111
        141.111111111111
        132.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '% cubierto'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h54: TQRLabel
      Left = 587
      Top = 64
      Width = 62
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1294.25347222222
        141.111111111111
        136.701388888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Monto Exp.'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h53: TQRLabel
      Left = 476
      Top = 64
      Width = 65
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1049.51388888889
        141.111111111111
        143.315972222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Monto Cub.'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h52: TQRLabel
      Left = 368
      Top = 64
      Width = 80
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        811.388888888889
        141.111111111111
        176.388888888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Calif. Cubierta'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h51: TQRLabel
      Left = 151
      Top = 64
      Width = 74
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        332.934027777778
        141.111111111111
        163.159722222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Calif. Deudor'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h11: TQRLabel
      Left = 77
      Top = 0
      Width = 55
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        169.774305555556
        0
        121.267361111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Num. Cte.'
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
    object h12: TQRLabel
      Left = 152
      Top = 0
      Width = 103
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        335.138888888889
        0
        227.100694444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Nombre de Cliente'
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
    object h13: TQRLabel
      Left = 476
      Top = 0
      Width = 55
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1049.51388888889
        0
        121.267361111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Gpo. Eco.'
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
    object h14: TQRLabel
      Left = 587
      Top = 0
      Width = 48
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1294.25347222222
        0
        105.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cve. Act.'
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
    object h15: TQRLabel
      Left = 694
      Top = 0
      Width = 49
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1530.17361111111
        0
        108.038194444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tp. Pers.'
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
    object h16: TQRLabel
      Left = 762
      Top = 0
      Width = 55
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1680.10416666667
        0
        121.267361111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Localidad'
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
    object h17: TQRLabel
      Left = 913
      Top = 0
      Width = 66
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        2013.03819444444
        0
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Prom. Asoc.'
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
    object h18: TQRLabel
      Left = 1025
      Top = 0
      Width = 64
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        2259.98263888889
        0
        141.111111111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Prom. Adm.'
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
    object h21: TQRLabel
      Left = 151
      Top = 16
      Width = 42
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        332.934027777778
        35.2777777777778
        92.6041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Crédito'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h31: TQRLabel
      Left = 150
      Top = 32
      Width = 64
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        330.729166666667
        70.5555555555556
        141.111111111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cve. Amort.'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h22: TQRLabel
      Left = 230
      Top = 16
      Width = 52
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        507.118055555556
        35.2777777777778
        114.652777777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Producto'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h32: TQRLabel
      Left = 259
      Top = 32
      Width = 50
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        571.059027777778
        70.5555555555556
        110.243055555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Pago Int.'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h33: TQRLabel
      Left = 368
      Top = 32
      Width = 98
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        811.388888888889
        70.5555555555556
        216.076388888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cuenta de Capital'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h34: TQRLabel
      Left = 476
      Top = 32
      Width = 50
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1049.51388888889
        70.5555555555556
        110.243055555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tasa Ref.'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h23: TQRLabel
      Left = 476
      Top = 16
      Width = 53
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1049.51388888889
        35.2777777777778
        116.857638888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Recursos'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h35: TQRLabel
      Left = 587
      Top = 32
      Width = 55
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1294.25347222222
        70.5555555555556
        121.267361111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Sobretasa'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h24: TQRLabel
      Left = 587
      Top = 16
      Width = 86
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1294.25347222222
        35.2777777777778
        189.618055555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Garant. Fondos'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h36: TQRLabel
      Left = 694
      Top = 32
      Width = 66
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1530.17361111111
        70.5555555555556
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tasa Interés'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h25: TQRLabel
      Left = 694
      Top = 16
      Width = 43
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1530.17361111111
        35.2777777777778
        94.8090277777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Moneda'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h37: TQRLabel
      Left = 804
      Top = 32
      Width = 89
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1772.70833333333
        70.5555555555556
        196.232638888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cta de Intereses'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h26: TQRLabel
      Left = 804
      Top = 16
      Width = 70
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1772.70833333333
        35.2777777777778
        154.340277777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cat. Minimo'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h28: TQRLabel
      Left = 1025
      Top = 16
      Width = 66
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        2259.98263888889
        35.2777777777778
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'F. Otorgam.'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h38: TQRLabel
      Left = 900
      Top = 32
      Width = 62
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1984.375
        70.5555555555556
        136.701388888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Contrato'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h27: TQRLabel
      Left = 900
      Top = 16
      Width = 62
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1984.375
        35.2777777777778
        136.701388888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tp. Crédito'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h29: TQRLabel
      Left = 1104
      Top = 16
      Width = 62
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        2434.16666666667
        35.2777777777778
        136.701388888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'F. Vento.'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h41: TQRLabel
      Left = 151
      Top = 48
      Width = 79
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        332.934027777778
        105.833333333333
        174.184027777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Monto Credito'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h42: TQRLabel
      Left = 259
      Top = 48
      Width = 65
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        571.059027777778
        105.833333333333
        143.315972222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Capital Vig.'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h43: TQRLabel
      Left = 368
      Top = 48
      Width = 80
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        811.388888888889
        105.833333333333
        176.388888888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Capital Impag.'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h44: TQRLabel
      Left = 476
      Top = 48
      Width = 73
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1049.51388888889
        105.833333333333
        160.954861111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Capital Venc.'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h45: TQRLabel
      Left = 587
      Top = 48
      Width = 74
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1294.25347222222
        105.833333333333
        163.159722222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Imp. Refinan.'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h46: TQRLabel
      Left = 694
      Top = 48
      Width = 44
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1530.17361111111
        105.833333333333
        97.0138888888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Int. Vig.'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h47: TQRLabel
      Left = 804
      Top = 48
      Width = 77
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1772.70833333333
        105.833333333333
        169.774305555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Int. Impagado'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object h48: TQRLabel
      Left = 900
      Top = 48
      Width = 97
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1984.375
        105.833333333333
        213.871527777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total del Crédito'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRLabel4: TQRLabel
      Left = 259
      Top = 64
      Width = 80
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        571.059027777778
        141.111111111111
        176.388888888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Calif. Cubierta'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
  end
  object qGroupCte: TQRGroup
    Left = 45
    Top = 226
    Width = 1176
    Height = 22
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qGroupCteBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      48.5069444444444
      2592.91666666667)
    Expression = 'qry.ID_OLTP_ACREDITADO'
    FooterBand = grFooterCte
    Master = Owner
    ReprintOnNewPage = False
    object QRShape7: TQRShape
      Left = -1
      Top = 1
      Width = 1176
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        -2.20486111111111
        2.20486111111111
        2592.91666666667)
      Shape = qrsRectangle
    end
    object QRDBText39: TQRDBText
      Left = 154
      Top = 2
      Width = 314
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.4826388888889
        339.548611111111
        4.40972222222222
        692.326388888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText40: TQRDBText
      Left = 77
      Top = 2
      Width = 59
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        169.333333333333
        5.29166666666667
        129.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'ID_OLTP_ACREDITADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText38: TQRDBText
      Left = 476
      Top = 2
      Width = 54
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.4826388888889
        1049.51388888889
        4.40972222222222
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'CVE_GRUPO_ECO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText37: TQRDBText
      Left = 588
      Top = 2
      Width = 54
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.4826388888889
        1296.45833333333
        4.40972222222222
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'CVE_ACTIV_ECO_SITI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText36: TQRDBText
      Left = 694
      Top = 2
      Width = 54
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.4826388888889
        1530.17361111111
        4.40972222222222
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'T_PERS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText35: TQRDBText
      Left = 761
      Top = 2
      Width = 150
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.4826388888889
        1677.89930555556
        4.40972222222222
        330.729166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'LOCALIDAD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText34: TQRDBText
      Left = 913
      Top = 2
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.4826388888889
        2013.03819444444
        4.40972222222222
        154.340277777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'ID_OLTP_PROM_ASOC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText33: TQRDBText
      Left = 1025
      Top = 2
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.4826388888889
        2259.98263888889
        4.40972222222222
        154.340277777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'ID_OLTP_PROM_ADMIN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel1: TQRLabel
      Left = 4
      Top = 2
      Width = 58
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        7.9375
        5.29166666666667
        127)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cliente:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object grFooterCto: TQRBand
    Left = 45
    Top = 332
    Width = 1176
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = grFooterCtoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      41.8923611111111
      2592.91666666667)
    BandType = rbGroupFooter
    object QRShape6: TQRShape
      Left = 14
      Top = 0
      Width = 1162
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        30.8680555555556
        0
        2562.04861111111)
      Shape = qrsRectangle
    end
    object QRLabel55: TQRLabel
      Left = 26
      Top = 1
      Width = 125
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        57.3263888888889
        2.20486111111111
        275.607638888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Totales por Contrato:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object qloIMP_CREDITO: TQRLabel
      Left = 154
      Top = 2
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        339.548611111111
        4.40972222222222
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qlIMP_CREDITO'
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
    object qloIMP_SDO_K_VIG_VP: TQRLabel
      Left = 259
      Top = 2
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        571.059027777778
        4.40972222222222
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qlIMP_SDO_K_VIG_VP'
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
    object qloIMP_SDO_K_IMP_VP: TQRLabel
      Left = 368
      Top = 2
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        811.388888888889
        4.40972222222222
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qlIMP_SDO_K_IMP_VP'
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
    object qloIMP_SDO_K_VEN_VP: TQRLabel
      Left = 476
      Top = 2
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1049.51388888889
        4.40972222222222
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qlIMP_SDO_K_VEN_VP'
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
    object qloIMPORTEREF: TQRLabel
      Left = 587
      Top = 2
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1294.25347222222
        4.40972222222222
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qlIMPORTEREF'
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
    object qloIMP_INT_CORTE_VP: TQRLabel
      Left = 694
      Top = 2
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1530.17361111111
        4.40972222222222
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qlIMP_INT_CORTE_VP'
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
    object qloIMP_SDO_IO_IMP_VP: TQRLabel
      Left = 804
      Top = 2
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1772.70833333333
        4.40972222222222
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qlIMP_SDO_IO_IMP_VP'
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
    object qloTOTCREDITO: TQRLabel
      Left = 900
      Top = 2
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1984.375
        4.40972222222222
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qloTOTCREDITO'
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
  object qGroupCto: TQRGroup
    Left = 45
    Top = 248
    Width = 1176
    Height = 18
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qGroupCtoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      39.6875
      2592.91666666667)
    Expression = 'qry.ID_CONTRATO'
    FooterBand = grFooterCto
    Master = Owner
    ReprintOnNewPage = False
    object QRShape4: TQRShape
      Left = 16
      Top = 1
      Width = 1160
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        35.2777777777778
        2.20486111111111
        2557.63888888889)
      Shape = qrsRectangle
    end
    object QRDBText32: TQRDBText
      Left = 104
      Top = 2
      Width = 70
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        229.305555555556
        4.40972222222222
        154.340277777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'ID_CONTRATO'
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
    object QRLabel33: TQRLabel
      Left = 24
      Top = 2
      Width = 66
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        52.9166666666667
        4.40972222222222
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Contrato:'
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
  object grFooterCte: TQRBand
    Left = 45
    Top = 351
    Width = 1176
    Height = 23
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = grFooterCteBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.7118055555556
      2592.91666666667)
    BandType = rbGroupFooter
    object QRShape8: TQRShape
      Left = 0
      Top = 1
      Width = 1176
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        0
        2.20486111111111
        2592.91666666667)
      Shape = qrsRectangle
    end
    object QRLabel54: TQRLabel
      Left = 4
      Top = 2
      Width = 118
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        7.9375
        5.29166666666667
        259.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Totales por Cliente:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object qlIMP_CREDITO: TQRLabel
      Left = 155
      Top = 3
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        341.753472222222
        6.61458333333333
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qlIMP_CREDITO'
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
    object qlIMP_SDO_K_VIG_VP: TQRLabel
      Left = 259
      Top = 3
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        571.059027777778
        6.61458333333333
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qlIMP_SDO_K_VIG_VP'
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
    object qlIMP_SDO_K_IMP_VP: TQRLabel
      Left = 368
      Top = 3
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        811.388888888889
        6.61458333333333
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qlIMP_SDO_K_IMP_VP'
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
    object qlIMP_SDO_K_VEN_VP: TQRLabel
      Left = 476
      Top = 3
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1049.51388888889
        6.61458333333333
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qlIMP_SDO_K_VEN_VP'
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
    object qlIMPORTEREF: TQRLabel
      Left = 587
      Top = 3
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1294.25347222222
        6.61458333333333
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qlIMPORTEREF'
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
    object qlIMP_INT_CORTE_VP: TQRLabel
      Left = 694
      Top = 3
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1530.17361111111
        6.61458333333333
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qlIMP_INT_CORTE_VP'
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
    object qlIMP_SDO_IO_IMP_VP: TQRLabel
      Left = 804
      Top = 3
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1772.70833333333
        6.61458333333333
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qlIMP_SDO_IO_IMP_VP'
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
    object qlTOTCREDITO: TQRLabel
      Left = 900
      Top = 3
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1984.375
        6.61458333333333
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qlTOTCREDITO'
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
  object DetailBand1: TQRBand
    Left = 45
    Top = 266
    Width = 1176
    Height = 66
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = DetailBand1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      145.520833333333
      2592.91666666667)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 994
      Top = 47
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        2191.63194444444
        103.628472222222
        198.4375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'IMP_RESERVA_EXP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText31: TQRDBText
      Left = 152
      Top = 0
      Width = 70
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        336.020833333333
        0
        153.458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'ID_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText21: TQRDBText
      Left = 232
      Top = -1
      Width = 226
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        511.527777777778
        -2.20486111111111
        498.298611111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'PRODUCTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText22: TQRDBText
      Left = 476
      Top = -1
      Width = 54
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1049.51388888889
        -2.20486111111111
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'ORI_REC_GBL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText23: TQRDBText
      Left = 587
      Top = -1
      Width = 54
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1294.25347222222
        -2.20486111111111
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'CVE_OPERATIVA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText24: TQRDBText
      Left = 694
      Top = -1
      Width = 54
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1530.17361111111
        -2.20486111111111
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'ID_OLTP_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText25: TQRDBText
      Left = 804
      Top = -1
      Width = 54
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1772.70833333333
        -2.20486111111111
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'CVE_CAT_MINIMO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText26: TQRDBText
      Left = 900
      Top = -1
      Width = 54
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1984.375
        -2.20486111111111
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'T_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText27: TQRDBText
      Left = 1025
      Top = -1
      Width = 70
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        2259.98263888889
        -2.20486111111111
        154.340277777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'F_INICIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText28: TQRDBText
      Left = 1104
      Top = -1
      Width = 70
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        2434.16666666667
        -2.20486111111111
        154.340277777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'F_VENCIMIENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText20: TQRDBText
      Left = 368
      Top = 14
      Width = 100
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        811.388888888889
        30.8680555555556
        220.486111111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'CUENTA_CONTABLE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText17: TQRDBText
      Left = 476
      Top = 14
      Width = 90
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1049.51388888889
        30.8680555555556
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'CVE_TASA_REFER'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText14: TQRDBText
      Left = 587
      Top = 14
      Width = 54
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1294.25347222222
        30.8680555555556
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'SOBRETASA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText11: TQRDBText
      Left = 694
      Top = 14
      Width = 54
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1530.17361111111
        30.8680555555556
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'TASA_APLICADA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText8: TQRDBText
      Left = 804
      Top = 14
      Width = 49
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1772.70833333333
        30.8680555555556
        108.038194444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'CUENTA_INTERES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText29: TQRDBText
      Left = 152
      Top = 14
      Width = 70
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        336.020833333333
        31.75
        153.458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'CVE_AMORTIZACION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText30: TQRDBText
      Left = 259
      Top = 14
      Width = 70
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        571.059027777778
        30.8680555555556
        154.340277777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'CVE_PAG_INTERES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText19: TQRDBText
      Left = 152
      Top = 31
      Width = 90
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        336.020833333333
        68.7916666666667
        198.4375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'IMP_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText18: TQRDBText
      Left = 153
      Top = 47
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        337.34375
        103.628472222222
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'CVE_CAL_ACRED'
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
    object QRDBText15: TQRDBText
      Left = 259
      Top = 47
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        571.059027777778
        103.628472222222
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'CVE_CALIFIC_CUB'
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
    object QRDBText16: TQRDBText
      Left = 259
      Top = 31
      Width = 90
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        571.059027777778
        68.3506944444444
        198.4375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'IMP_SDO_K_VIG_VP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText12: TQRDBText
      Left = 476
      Top = 47
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1049.51388888889
        103.628472222222
        198.4375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'IMP_CUBIERTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText13: TQRDBText
      Left = 368
      Top = 31
      Width = 90
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        811.388888888889
        68.3506944444444
        198.4375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'IMP_SDO_K_IMP_VP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText9: TQRDBText
      Left = 587
      Top = 47
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1294.25347222222
        103.628472222222
        198.4375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'IMP_EXPUESTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText10: TQRDBText
      Left = 476
      Top = 31
      Width = 90
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1049.51388888889
        68.3506944444444
        198.4375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'IMP_SDO_K_VEN_VP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText6: TQRDBText
      Left = 694
      Top = 47
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1530.17361111111
        103.628472222222
        198.4375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'PCT_CUBIERTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText7: TQRDBText
      Left = 587
      Top = 31
      Width = 90
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1294.25347222222
        68.3506944444444
        198.4375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'IMPORTEREF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText4: TQRDBText
      Left = 804
      Top = 47
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1772.70833333333
        103.628472222222
        198.4375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'PCT_EXPUESTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText5: TQRDBText
      Left = 694
      Top = 31
      Width = 90
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1530.17361111111
        68.3506944444444
        198.4375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'IMP_INT_CORTE_VP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText2: TQRDBText
      Left = 900
      Top = 47
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1984.375
        103.628472222222
        198.4375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'IMP_RESERVA_CUB'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText3: TQRDBText
      Left = 804
      Top = 31
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1772.70833333333
        68.3506944444444
        198.4375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'IMP_SDO_IO_IMP_VP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText41: TQRDBText
      Left = 1086
      Top = 47
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        2394.47916666667
        103.628472222222
        198.4375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'TOT_RESERVA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel43: TQRLabel
      Left = 34
      Top = 47
      Width = 53
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.4826388888889
        74.9652777777778
        103.628472222222
        116.857638888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Calificación'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel2: TQRLabel
      Left = 34
      Top = 31
      Width = 31
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.4826388888889
        74.9652777777778
        68.3506944444444
        68.3506944444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Saldos'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel3: TQRLabel
      Left = 34
      Top = 1
      Width = 76
      Height = 29
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        74.0833333333333
        2.64583333333333
        166.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Datos del Crédito'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText42: TQRDBText
      Left = 900
      Top = 31
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1984.375
        68.3506944444444
        198.4375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'TOTCREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRShape5: TQRShape
      Left = 32
      Top = 62
      Width = 1141
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        71.4375
        137.583333333333
        2516.1875)
      Shape = qrsHorLine
    end
    object qdContrato: TQRDBText
      Left = 900
      Top = 14
      Width = 91
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1984.375
        30.8680555555556
        200.642361111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'ID_CONTRATO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText43: TQRDBText
      Left = 368
      Top = 47
      Width = 90
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        811.388888888889
        103.628472222222
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'CVE_CALIFIC_EXP'
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
    object QRShape2: TQRShape
      Left = 108
      Top = 46
      Width = 1068
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        4.40972222222222
        238.125
        101.423611111111
        2354.79166666667)
      Shape = qrsHorLine
    end
    object QRShape1: TQRShape
      Left = 108
      Top = 30
      Width = 1068
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.29166666666667
        238.125
        66.1458333333333
        2354.79166666667)
      Shape = qrsHorLine
    end
  end
  object QRBand2: TQRBand
    Left = 45
    Top = 374
    Width = 1176
    Height = 56
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand2BeforePrint
    Color = clSilver
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      123.472222222222
      2592.91666666667)
    BandType = rbSummary
    object QRShape3: TQRShape
      Left = 0
      Top = 27
      Width = 1176
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        61.7361111111111
        0
        59.53125
        2592.91666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel46: TQRLabel
      Left = 2
      Top = 4
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.4826388888889
        4.40972222222222
        8.81944444444444
        154.340277777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Montos Totales:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRExpr7: TQRExpr
      Left = 801
      Top = 4
      Width = 105
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1766.09375
        8.81944444444444
        231.510416666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qry.IMP_SDO_IO_IMP_VP)'
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      FontSize = 7
    end
    object QRExpr6: TQRExpr
      Left = 691
      Top = 4
      Width = 105
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1523.55902777778
        8.81944444444444
        231.510416666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qry.IMP_INT_CORTE_VP)'
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      FontSize = 7
    end
    object QRExpr5: TQRExpr
      Left = 581
      Top = 4
      Width = 105
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1281.02430555556
        8.81944444444444
        231.510416666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qry.IMPORTEREF)'
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      FontSize = 7
    end
    object QRExpr4: TQRExpr
      Left = 471
      Top = 4
      Width = 105
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1038.48958333333
        8.81944444444444
        231.510416666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qry.IMP_SDO_K_VEN_VP)'
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      FontSize = 7
    end
    object QRExpr3: TQRExpr
      Left = 361
      Top = 4
      Width = 105
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        795.954861111111
        8.81944444444444
        231.510416666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qry.IMP_SDO_K_IMP_VP)'
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      FontSize = 7
    end
    object QRExpr2: TQRExpr
      Left = 251
      Top = 4
      Width = 105
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        553.420138888889
        8.81944444444444
        231.510416666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qry.IMP_SDO_K_VIG_VP)'
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      FontSize = 7
    end
    object QRExpr1: TQRExpr
      Left = 141
      Top = 4
      Width = 105
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        310.885416666667
        8.81944444444444
        231.510416666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qry.IMP_CREDITO)'
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      FontSize = 7
    end
    object QRExpr8: TQRExpr
      Left = 911
      Top = 4
      Width = 105
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        2008.62847222222
        8.81944444444444
        231.510416666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 
        'SUM(qry.IMP_SDO_K_VIG_VP)+SUM(qry.IMP_SDO_K_IMP_VP)+SUM(qry.IMP_' +
        'SDO_K_VEN_VP)+SUM(qry.IMPORTEREF)+SUM(qry.IMP_INT_CORTE_VP)+SUM(' +
        'qry.IMP_SDO_IO_IMP_VP)'
      Mask = '$  ###,###,##0.00;-###,###,##0.00'
      FontSize = 7
    end
    object qrlSaldo: TQRLabel
      Left = 900
      Top = 32
      Width = 90
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        1984.375
        70.5555555555556
        198.4375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cuenta Contable:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object qrlCuenta: TQRLabel
      Left = 199
      Top = 32
      Width = 68
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        438.767361111111
        70.5555555555556
        149.930555555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cuenta Contable:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object qrlCliente: TQRLabel
      Left = 87
      Top = 32
      Width = 68
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        191.822916666667
        70.5555555555556
        149.930555555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cuenta Contable:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRLabel5: TQRLabel
      Left = 5
      Top = 32
      Width = 74
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        11.0243055555556
        70.5555555555556
        163.159722222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cuenta Contable:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
  end
  object qry: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      '( '
      
        'SELECT A.ID_OLTP_ACREDITADO, A.ACREDITADO, A.ID_OLTP_PROM_ASOC,A' +
        '.ID_OLTP_PROM_ADMIN, A.CREDITO, A.producto, A.ORI_REC_GBL, A.ORI' +
        'GEN_INFO, A.IMP_INT_CORTE as tasa_aplicada,'
      
        '       A.ID_OLTP_MONEDA,A.CVE_CAT_MINIMO, '#39'xxxxxxx'#39' as t_credito' +
        ', A.IMP_SDO_K_VIG_VP, A.IMP_SDO_K_IMP_VP, A.IMP_SDO_K_VEN_VP, A.' +
        'IMP_INT_CORTE_VP, A.IMP_SDO_IO_IMP_VP, '
      
        '       C.ID_PERSONA, C.ID_CREDITO, C.T_PERS, C.grupo, C.CVE_ACTI' +
        'V_ECO_SITI, C.LOCALIDAD, C.ID_CONTRATO, C.CVE_PER_JURIDICA, C.F_' +
        'INICIO, '
      
        '       C.F_VENCIMIENTO, C.CVE_OPERATIVA, C.CVE_AMORTIZACION, C.C' +
        'VE_PAG_INTERES, C.IMP_CREDITO, C.CVE_TASA_REFER, C.SOBRETASA, C.' +
        'CVE_GRUPO_ECO, '
      
        '       D.cve_cal_acred, E.CVE_CALIFIC_CUB, E.IMP_CUBIERTO, E.IMP' +
        '_EXPUESTO, E.IMP_RESERVA_CUB, '
      '       E.IMP_RESERVA_EXP, E.PCT_CUBIERTO, E.PCT_EXPUESTO, '
      
        '       decode(CVE_PER_JURIDICA,'#39'PM'#39',ACREDITADO,NOMBREF) AS NOMBR' +
        'E, '
      
        '       NVL(TABCTA.CUENTA_VIGENTE_K,TABCTAICRE.CVE_CTA_CONT_CAREV' +
        'I) AS CUENTA_CONTABLE, '
      
        '       NVL(TABCTA.CUENTA_VIGENTE_INT,TABCTAICRE.CVE_CTA_CONT_INR' +
        'EVI) AS CUENTA_INTERES , 0 AS IMPORTEREF, (E.IMP_RESERVA_CUB + E' +
        '.IMP_RESERVA_EXP) TOT_RESERVA'
      ',0.0 AS TOTCREDITO, '#39'XXX'#39' AS CVE_CALIFIC_EXP'
      'FROM '
      '    /***** BUSCA EN DWH *****/'
      
        '    ( select ID_OLTP_ACREDITADO, ACREDITADO, ID_OLTP_PROM_ASOC,I' +
        'D_OLTP_PROM_ADMIN, '
      
        '             CREDITO, ID_OLTP_PRODUCTO||'#39#39'||PRODUCTO producto, O' +
        'RI_REC_GBL, ORIGEN_INFO,'
      
        '             ID_OLTP_MONEDA,CVE_CAT_MINIMO, ID_OLTP_TIPO_CREDITO' +
        '||'#39#39'||TIPO_CREDITO t_credito,'
      
        '             IMP_SDO_K_VIG_VP, IMP_SDO_K_IMP_VP, IMP_SDO_K_VEN_V' +
        'P, IMP_INT_CORTE_VP, IMP_SDO_IO_IMP_VP , IMP_INT_CORTE'
      '      from DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '
      '      where aa.ID_ANIO_MES = 306 '
      '      and   aa.ID_CREDITO = bb.ID_CREDITO '
      '      and   ORIGEN_INFO='#39'ICRE'#39')  A, '
      '    /***** BUSCA DATOS GENERALES EN CORPORATIVO *****/'
      '    ( select '
      
        '       P.ID_PERSONA, C.ID_CREDITO, decode(p.CVE_PER_JURIDICA,'#39'PM' +
        #39','#39'MORAL'#39',DECODE(B_ACTIV_EMPRESA,'#39'V'#39','#39'FISICA ACT EMP'#39','#39'FISICA'#39'))' +
        ' T_PERS, '
      
        '       decode(p.CVE_PER_JURIDICA,'#39'PM'#39','#39#39',TRIM(APELLIDO_PATERNO)|' +
        '|'#39#39'||TRIM(APELLIDO_MATERNO)||'#39#39'||NOMBRE_PERSONA) NOMBREF, '
      
        '       '#39'grupo'#39'as grupo,p.CVE_ACTIV_ECO_SITI, PB.DESC_POBLACION A' +
        'S LOCALIDAD, C.ID_CONTRATO, p.CVE_PER_JURIDICA, '
      
        '       C.F_INICIO,C.F_VENCIMIENTO, C.CVE_OPERATIVA, C.CVE_AMORTI' +
        'ZACION, C.CVE_PAG_INTERES, C.IMP_CREDITO, C.CVE_TASA_REFER, C.SO' +
        'BRETASA, '
      
        '       cve_producto_cre, CCT.cve_moneda, id_empresa, CVE_GRUPO_E' +
        'CO  '
      
        '      from CR_CREDITO C, CONTRATO CT, cr_contrato CCT, persona p' +
        ', persona_fisica pf, persona_moral pm, '
      '           DOMICILIO D, POBLACION PB, CR_ACREDITADO CA '
      '      where C.ID_CONTRATO =CT.ID_CONTRATO '
      '      AND CCT.id_contrato = CT.id_contrato '
      '      AND CT.ID_TITULAR = P.ID_PERSONA '
      
        '      AND (pm.ID_PERSONA(+)= p.ID_PERSONA AND pf.ID_PERSONA(+)=p' +
        '.ID_PERSONA) '
      '      AND D.ID_DOMICILIO = P.ID_DOMICILIO '
      '      AND PB.CVE_POBLACION= D.CVE_ESTADO '
      '      AND CA.ID_ACREDITADO = P.ID_PERSONA ) C, '
      '     /***** BUSCA CALIFICACIÓN DEL DEUDOR EN SICC *****/ '
      
        '    ( SELECT ID_ACREDITADO, cve_cal_acred   FROM cr_sicc_cal_acr' +
        'e csa '
      
        '      WHERE CSA.ANIO_MES=  200606 AND CSA.SIT_SICC_CAL_ACR = '#39'AC' +
        #39') D, '
      '    /***** BUSCA DATOS DEL CREDITO EN SIC *****/ '
      
        '    ( SELECT id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPU' +
        'ESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUES' +
        'TO '
      
        '      FROM CR_SICC_CAL_CRED CSC  WHERE CSC.ANIO_MES=  200606 AND' +
        ' CSC.SIT_SICC_CAL_CRE = '#39'AC'#39') E, '
      '    /***** CUENTA DE CAPITAL Y CUENTA DE INTERESES *****/ '
      
        #9'( SELECT PROD.ID_EMPRESA, PROD.CVE_PRODUCTO_CRE, PROD.CVE_MONED' +
        'A, '
      
        '             SUBSTR(INREVI.CVE_CTA_CONT,1,30) CVE_CTA_CONT_INREV' +
        'I, SUBSTR(CAREVI.CVE_CTA_CONT,1,30) CVE_CTA_CONT_CAREVI '
      ' '#9'  FROM '
      #9#9' (SELECT CP.*, CRPM.CVE_MONEDA '
      '          FROM CR_PRODUCTO CP, '
      
        '              (SELECT CVE_MONEDA, CVE_PRODUCTO_CRE, COUNT(*) FRO' +
        'M CR_REL_PROD_MON CRPM GROUP BY CVE_MONEDA, CVE_PRODUCTO_CRE ORD' +
        'ER BY CVE_MONEDA, CVE_PRODUCTO_CRE) CRPM '
      
        '               WHERE CP.CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO' +
        '_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = '#39'CTICRE'#39') '
      
        '               AND   CRPM.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE' +
        ') PROD, '
      
        '              (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_' +
        'MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_' +
        'PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran '
      
        '               WHERE CVE_OPER_CRED = '#39'INREVI'#39'AND   CVE_COMISION ' +
        '= '#39'NA'#39'AND   CVE_CONCEPTO = '#39'IMPBRU'#39'AND   CVE_TIPO_MOVTO = '#39'MD'#39'AN' +
        'D   TIPO_AFECTACION = '#39'D'#39') INREVI, '
      
        '              (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_' +
        'MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_' +
        'PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran '
      
        '               WHERE CVE_OPER_CRED = '#39'CAREVI'#39'AND   CVE_COMISION ' +
        '= '#39'NA'#39'AND   CVE_CONCEPTO = '#39'IMPBRU'#39'AND   CVE_TIPO_MOVTO = '#39'MD'#39'AN' +
        'D   TIPO_AFECTACION = '#39'D'#39') CAREVI '
      '          WHERE INREVI.ID_EMPRESA    (+)= PROD.ID_EMPRESA '
      '          AND   INREVI.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE '
      '          AND   INREVI.CVE_MONEDA    (+)= PROD.CVE_MONEDA  '
      '          AND   CAREVI.ID_EMPRESA    (+)= PROD.ID_EMPRESA  '
      
        '          AND   CAREVI.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE ' +
        ' '
      
        '          AND   CAREVI.CVE_MONEDA    (+)= PROD.CVE_MONEDA   )TAB' +
        'CTAICRE,  '
      
        '         (SELECT CP.CVE_PRODUCTO_CRE, CUENTA_VIGENTE_INT, NVL(Ct' +
        'aAgrK.CUENTA_VIGENTE,CtaDDK.CUENTA_VIGENTE ) CUENTA_VIGENTE_K '
      '          FROM cr_producto CP, '
      
        '              (SELECT '#39'IN'#39'AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, ' +
        'SUBSTR(GC.CUENTA_CONTABLE,1,4) || '#39'-'#39'||  '
      
        '                      SUBSTR(GC.CUENTA_CONTABLE,5,4) || '#39'-'#39'|| SU' +
        'BSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE_INT '
      
        '               FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, GUIA_C' +
        'ONTABLE@SICA GC '
      '               WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '
      '               AND CCP.CVE_PRODUCTO_CR NOT LIKE '#39'%FAC'#39
      '               AND CCP.CVE_PRODUCTO_CR NOT LIKE '#39'%AGR'#39
      '               AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '
      '               AND GC.EMPRESA = '#39'BCO2'#39
      '               AND GC.CODIGO_TRANSACCION IN (306000, 306710) '
      '               AND GC.CAMPO_IMPORTE IN ('#39'03'#39','#39'06'#39') '
      '               AND GC.CLAVE_MONEDA = '#39'PESOS'#39
      
        '               AND (GC.CUENTA_CONTABLE LIKE '#39'13%'#39'OR GC.CUENTA_CO' +
        'NTABLE LIKE '#39'26%'#39')) CtaInt, '
      '              (SELECT '#39'KA'#39'AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, '
      
        '                      SUBSTR(GC.CUENTA_CONTABLE,1,4)|| '#39'-'#39'|| SUB' +
        'STR(GC.CUENTA_CONTABLE,5,4)||'#39'-'#39'|| SUBSTR(GC.CUENTA_CONTABLE,9,2' +
        ')AS CUENTA_VIGENTE '
      
        '               FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, GUIA_C' +
        'ONTABLE@SICA GC '
      '               WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '
      '               AND CCP.CVE_PRODUCTO_CR NOT LIKE '#39'%FAC'#39
      '               AND CCP.CVE_PRODUCTO_CR NOT LIKE '#39'%AGR'#39
      '               AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '
      '               AND GC.EMPRESA = '#39'BCO2'#39
      '               AND GC.CODIGO_TRANSACCION IN (300000)    '
      '               AND GC.CLAVE_MONEDA = '#39'PESOS'#39' '
      '               AND GC.CAMPO_IMPORTE = '#39'02'#39'  '
      '               AND (GC.CUENTA_CONTABLE LIKE '#39'13%'#39')) CtaAgrK,   '
      
        '             (SELECT '#39'KA'#39'AS CVE_CONCEPTO, CCP.CVE_PRODUCTO_CR,CT' +
        'A_CONTABLE||'#39'-'#39'||SUBSTR(SUB_CTA_CONTABLE,1,4)||'#39'-'#39'||SUBSTR(SUB_C' +
        'TA_CONTABLE,5,2) AS CUENTA_VIGENTE '
      '              FROM CR_CONT_PRODUCTO  CCP '
      '              WHERE CVE_PRODUCTO_CR LIKE '#39'%XXX'#39') CtaDDK '
      
        '          WHERE CtaInt.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE' +
        ' '
      '          AND CtaAgrK.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '
      
        '          AND CtaDDK.CVE_PRODUCTO_CR (+)= cp.CVE_PRODUCTO_CRE  )' +
        'TABCTA '
      'WHERE A.CREDITO=C.ID_CREDITO '
      'AND   D.ID_ACREDITADO(+)=A.ID_OLTP_ACREDITADO '
      'AND   E.id_credito(+)=C.ID_CREDITO  '
      'AND   C.CVE_PRODUCTO_CRE = TABCTA.CVE_PRODUCTO_CRE(+) '
      'AND   TABCTAICRE.ID_EMPRESA (+)= C.ID_EMPRESA '
      'AND   TABCTAICRE.CVE_PRODUCTO_CRE (+)= C.CVE_PRODUCTO_CRE '
      'AND   TABCTAICRE.CVE_MONEDA (+)= C.CVE_MONEDA '
      ') '
      'union all'
      '( '
      
        'SELECT A.ID_OLTP_ACREDITADO, A.ACREDITADO, A.ID_OLTP_PROM_ASOC,A' +
        '.ID_OLTP_PROM_ADMIN, A.CREDITO, A.producto, A.ORI_REC_GBL, A.ORI' +
        'GEN_INFO,  A.IMP_INT_CORTe,'
      
        '       A.ID_OLTP_MONEDA,A.CVE_CAT_MINIMO, '#39'xxxxxxx'#39' as  t_credit' +
        'o, A.IMP_SDO_K_VIG_VP, A.IMP_SDO_K_IMP_VP, A.IMP_SDO_K_VEN_VP, A' +
        '.IMP_INT_CORTE_VP, A.IMP_SDO_IO_IMP_VP, '
      
        '       C.ID_PERSONA, C.ID_CREDITO, C.T_PERS, C.grupo, C.CVE_ACTI' +
        'V_ECO_SITI, C.LOCALIDAD, C.ID_CONTRATO, C.CVE_PER_JURIDICA, C.F_' +
        'INICIO, '
      
        '       C.F_VENCIMIENTO, C.CVE_OPERATIVA, C.CVE_AMORTIZACION, C.C' +
        'VE_PAG_INTERES, C.IMP_CREDITO, C.CVE_TASA_REFER, C.SOBRETASA, C.' +
        'CVE_GRUPO_ECO, '
      
        '       D.cve_cal_acred, E.CVE_CALIFIC_CUB, E.IMP_CUBIERTO, E.IMP' +
        '_EXPUESTO, E.IMP_RESERVA_CUB, '
      '       E.IMP_RESERVA_EXP, E.PCT_CUBIERTO, E.PCT_EXPUESTO, '
      
        '       decode(CVE_PER_JURIDICA,'#39'PM'#39',ACREDITADO,NOMBREF) AS NOMBR' +
        'E, '
      '       DECODE (TIPO_DISPOSICION,'#39'RN'#39', '
      
        '         DECODE(CVE_SUB_TIP_BCO-47,0,TIPO_CUENTA||'#39'-'#39'||SUBSTR(CT' +
        'A_CONTABLE,1,4)||'#39'-'#39'||SUBSTR(CTA_CONTABLE,5,2), '
      
        '                                         '#39'1324-'#39'||substr(TIPO_CU' +
        'ENTA,4,2)||'#39'01-00'#39'), '
      
        '           TIPO_CUENTA||'#39'-'#39'||SUBSTR(CTA_CONTABLE,1,4)||'#39'-'#39'||SUBS' +
        'TR(CTA_CONTABLE,5,2) )  CUENTA_CONTABLE, '
      '       DECODE (TIPO_DISPOSICION, '#39'RN'#39', '
      '         DECODE(CVE_SUB_TIP_BCO-47,0, '
      
        '            DECODE(CVE_CALCULO,'#39'AN'#39','#39'2601-'#39'||SUBSTR(CTA_INTERES,' +
        '5,2)||'#39'-0000'#39', '
      
        '                   SUBSTR(CTA_INTERES,1,4)||'#39'-'#39'||SUBSTR(CTA_INTE' +
        'RES,5,4)||'#39'-'#39'||SUBSTR(CTA_INTERES,9,2)), '
      '             '#39'1319-2000-00'#39'),  '
      
        '             DECODE(CVE_CALCULO,'#39'AN'#39','#39'2601-'#39'||SUBSTR(CTA_INTERES' +
        ',5,2)||'#39'-0000'#39', '
      
        '             SUBSTR(CTA_INTERES,1,4)||'#39'-'#39'||SUBSTR(CTA_INTERES,5,' +
        '4)||'#39'-'#39'||SUBSTR(CTA_INTERES,9,2)) )  CUENTA_INTERES '
      
        '                  ,  0 AS IMPORTEREF, (E.IMP_RESERVA_CUB + E.IMP' +
        '_RESERVA_EXP) TOT_RESERVA'
      ',0.0 AS TOTCREDITO, '#39'XXX'#39' AS CVE_CALIFIC_EXP'
      'FROM'
      '    /***** BUSCA EN DWH *****/ '
      
        '    ( select ID_OLTP_ACREDITADO, ACREDITADO, ID_OLTP_PROM_ASOC,I' +
        'D_OLTP_PROM_ADMIN, '
      
        '             CREDITO, ID_OLTP_PRODUCTO||'#39#39'||PRODUCTO producto, O' +
        'RI_REC_GBL, ORIGEN_INFO, '
      
        '             ID_OLTP_MONEDA,CVE_CAT_MINIMO, ID_OLTP_TIPO_CREDITO' +
        '||'#39#39'||TIPO_CREDITO t_credito, '
      
        '             IMP_SDO_K_VIG_VP, IMP_SDO_K_IMP_VP, IMP_SDO_K_VEN_V' +
        'P, IMP_INT_CORTE_VP, IMP_SDO_IO_IMP_VP, IMP_INT_CORTE'
      '      from DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '
      '      where aa.ID_ANIO_MES = 306 '
      '      and   aa.ID_CREDITO = bb.ID_CREDITO '
      '      and   ORIGEN_INFO='#39'INTERCREDITOS'#39')  A, '
      '    /***** BUSCA DATOS GENERALES EN CORPORATIVO *****/'
      '    ( select '
      
        '       P.ID_PERSONA, C.ID_CREDITO, decode(p.CVE_PER_JURIDICA,'#39'PM' +
        #39','#39'MORAL'#39',DECODE(B_ACTIV_EMPRESA,'#39'V'#39','#39'FISICA ACT EMP'#39','#39'FISICA'#39'))' +
        ' T_PERS, '
      
        '       decode(p.CVE_PER_JURIDICA,'#39'PM'#39','#39#39',TRIM(APELLIDO_PATERNO)|' +
        '|'#39#39'||TRIM(APELLIDO_MATERNO)||'#39#39'||NOMBRE_PERSONA) NOMBREF, '
      
        '       '#39'grupo'#39'as grupo,p.CVE_ACTIV_ECO_SITI, PB.DESC_POBLACION A' +
        'S LOCALIDAD, C.ID_CONTRATO, p.CVE_PER_JURIDICA, '
      
        '       C.F_AUT_OPERACION AS F_INICIO, C.F_TRASPASO_VENC AS F_VEN' +
        'CIMIENTO, '#39'N/A'#39'AS CVE_OPERATIVA,  '
      
        '       DECODE(C.B_CAPITAL_PER,'#39'V'#39','#39'POR PERIODO'#39','#39'AL VENCIMIENTO'#39 +
        ')AS CVE_AMORTIZACION, '
      
        '       DECODE(B_INTERES_PER,'#39'V'#39','#39'POR PERIODOS'#39',DECODE(CVE_CALCUL' +
        'O,'#39'AN'#39','#39'AL INICIO'#39','#39'AL VENCIMIENTO'#39'))AS CVE_PAG_INTERES, '
      
        '       C.IMP_CREDITO, C.CVE_TASA_REFER, C.SOBRETASA,CTA_INTERES,' +
        'CVE_CALCULO,CST.CVE_SUB_TIP_BCO,TIPO_DISPOSICION, '
      
        '       CTA_CONTABLE,CTC.TIPO_CUENTA, CA.CVE_GRUPO AS CVE_GRUPO_E' +
        'CO '
      
        '      from CRE_CREDITO C, CONTRATO CT, CRE_contrato CCT, persona' +
        ' p, persona_fisica pf, persona_moral pm, '
      
        '           DOMICILIO D, POBLACION PB, CRE_SUB_TIP_BCO CST, CRE_S' +
        'UB_TIP_CNBV cnbv, CRE_TIPO_CREDITO CTC, CRE_CLIENTE CA   '
      '      where C.ID_CONTRATO =CT.ID_CONTRATO '
      '      AND CCT.id_contrato = CT.id_contrato '
      '      AND CT.ID_TITULAR = P.ID_PERSONA '
      
        '      AND (pm.ID_PERSONA(+)= p.ID_PERSONA AND pf.ID_PERSONA(+)=p' +
        '.ID_PERSONA) '
      '      AND D.ID_DOMICILIO = P.ID_DOMICILIO '
      '      AND PB.CVE_POBLACION= D.CVE_ESTADO '
      '      AND CCT.CVE_SUB_TIP_BCO  =  CST.CVE_SUB_TIP_BCO '
      '      AND CST.CVE_SUB_TIP_CNBV= CNBV.CVE_SUB_TIP_CNBV  '
      '      AND CNBV.CVE_TIPO_CREDITO = CTC.CVE_TIPO_CREDITO '
      '      AND CA.ID_PERSONA = P.ID_PERSONA  ) C, '
      '    /***** BUSCA CALIFICACIÓN DEL DEUDOR EN SICC *****/'
      
        '    ( SELECT ID_ACREDITADO, cve_cal_acred   FROM cr_sicc_cal_acr' +
        'e csa '
      
        '      WHERE CSA.ANIO_MES=  200606 AND CSA.SIT_SICC_CAL_ACR = '#39'AC' +
        #39') D, '
      '    /***** BUSCA DATOS DEL CREDITO EN SIC *****/ '
      
        '    ( SELECT id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPU' +
        'ESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUES' +
        'TO '
      
        '      FROM CR_SICC_CAL_CRED CSC  WHERE CSC.ANIO_MES=  200606 AND' +
        ' CSC.SIT_SICC_CAL_CRE = '#39'AC'#39') E '
      '    /***** CUENTA DE CAPITAL Y CUENTA DE INTERESES *****/'
      'WHERE A.CREDITO=C.ID_CREDITO '
      'AND   D.ID_ACREDITADO(+)=A.ID_OLTP_ACREDITADO '
      'AND   E.id_credito(+)=C.ID_CREDITO  '
      ')'
      ''
      '')
    Left = 24
    Top = 40
    object qryID_OLTP_ACREDITADO: TFloatField
      FieldName = 'ID_OLTP_ACREDITADO'
    end
    object qryID_OLTP_PROM_ASOC: TFloatField
      FieldName = 'ID_OLTP_PROM_ASOC'
    end
    object qryID_OLTP_PROM_ADMIN: TFloatField
      FieldName = 'ID_OLTP_PROM_ADMIN'
    end
    object qryPRODUCTO: TStringField
      FieldName = 'PRODUCTO'
      Size = 110
    end
    object qryORI_REC_GBL: TStringField
      FieldName = 'ORI_REC_GBL'
      Size = 100
    end
    object qryID_OLTP_MONEDA: TFloatField
      FieldName = 'ID_OLTP_MONEDA'
    end
    object qryCVE_CAT_MINIMO: TStringField
      FieldName = 'CVE_CAT_MINIMO'
    end
    object qryIMP_SDO_K_VIG_VP: TFloatField
      FieldName = 'IMP_SDO_K_VIG_VP'
    end
    object qryIMP_SDO_K_IMP_VP: TFloatField
      FieldName = 'IMP_SDO_K_IMP_VP'
    end
    object qryIMP_SDO_K_VEN_VP: TFloatField
      FieldName = 'IMP_SDO_K_VEN_VP'
    end
    object qryIMP_INT_CORTE_VP: TFloatField
      FieldName = 'IMP_INT_CORTE_VP'
    end
    object qryIMP_SDO_IO_IMP_VP: TFloatField
      FieldName = 'IMP_SDO_IO_IMP_VP'
    end
    object qryID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qryT_PERS: TStringField
      FieldName = 'T_PERS'
      Size = 14
    end
    object qryCVE_ACTIV_ECO_SITI: TStringField
      FieldName = 'CVE_ACTIV_ECO_SITI'
      Size = 7
    end
    object qryLOCALIDAD: TStringField
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object qryID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qryF_INICIO: TDateTimeField
      FieldName = 'F_INICIO'
    end
    object qryF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qryCVE_OPERATIVA: TStringField
      FieldName = 'CVE_OPERATIVA'
      Size = 6
    end
    object qryCVE_AMORTIZACION: TStringField
      FieldName = 'CVE_AMORTIZACION'
      Size = 14
    end
    object qryCVE_PAG_INTERES: TStringField
      FieldName = 'CVE_PAG_INTERES'
      Size = 14
    end
    object qryIMP_CREDITO: TFloatField
      FieldName = 'IMP_CREDITO'
    end
    object qryCVE_TASA_REFER: TStringField
      FieldName = 'CVE_TASA_REFER'
      Size = 8
    end
    object qrySOBRETASA: TFloatField
      FieldName = 'SOBRETASA'
    end
    object qryCVE_GRUPO_ECO: TStringField
      FieldName = 'CVE_GRUPO_ECO'
      Size = 6
    end
    object qryCVE_CAL_ACRED: TStringField
      FieldName = 'CVE_CAL_ACRED'
      Size = 2
    end
    object qryCVE_CALIFIC_CUB: TStringField
      FieldName = 'CVE_CALIFIC_CUB'
      Size = 2
    end
    object qryIMP_CUBIERTO: TFloatField
      FieldName = 'IMP_CUBIERTO'
    end
    object qryIMP_EXPUESTO: TFloatField
      FieldName = 'IMP_EXPUESTO'
    end
    object qryIMP_RESERVA_CUB: TFloatField
      FieldName = 'IMP_RESERVA_CUB'
    end
    object qryIMP_RESERVA_EXP: TFloatField
      FieldName = 'IMP_RESERVA_EXP'
    end
    object qryPCT_CUBIERTO: TFloatField
      FieldName = 'PCT_CUBIERTO'
    end
    object qryPCT_EXPUESTO: TFloatField
      FieldName = 'PCT_EXPUESTO'
    end
    object qryNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 100
    end
    object qryCUENTA_CONTABLE: TStringField
      FieldName = 'CUENTA_CONTABLE'
      Size = 48
    end
    object qryCUENTA_INTERES: TStringField
      FieldName = 'CUENTA_INTERES'
      Size = 30
    end
    object qryIMPORTEREF: TFloatField
      FieldName = 'IMPORTEREF'
    end
    object qryTOT_RESERVA: TFloatField
      FieldName = 'TOT_RESERVA'
    end
    object qryTOTCREDITO: TFloatField
      FieldName = 'TOTCREDITO'
    end
    object qryTASA_APLICADA: TFloatField
      FieldName = 'TASA_APLICADA'
    end
    object qryT_CREDITO: TStringField
      FieldName = 'T_CREDITO'
      FixedChar = True
      Size = 7
    end
    object qryCVE_CALIFIC_EXP: TStringField
      FieldName = 'CVE_CALIFIC_EXP'
      FixedChar = True
      Size = 3
    end
    object qryNUM_DIAS_VDO: TFloatField
      FieldName = 'NUM_DIAS_VDO'
    end
  end
  object qBusca: TQuery
    Left = 64
    Top = 8
  end
end
