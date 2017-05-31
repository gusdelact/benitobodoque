object QrRepSolNafin: TQrRepSolNafin
  Left = 0
  Top = 0
  Width = 979
  Height = 1267
  Frame.Color = clBlack
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
  BeforePrint = QuickRepBeforePrint
  DataSet = qySolicitud
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
  Zoom = 120
  object PageHeaderBand1: TQRBand
    Left = 58
    Top = 58
    Width = 864
    Height = 101
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
      222.690972222222
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
        222.690972222222
        0
        0
        1905)
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
  object qrGrupo0: TQRGroup
    Left = 58
    Top = 159
    Width = 864
    Height = 3
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrGrupo0BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      6.61458333333333
      1905)
    Expression = 'qySolicitud.GRUPO'
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGroupCredito: TQRGroup
    Left = 58
    Top = 162
    Width = 864
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrGrupo0BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      30.8680555555556
      1905)
    Expression = 'qySolicitud.ID_CREDITO'
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGroupSolicitud: TQRGroup
    Left = 58
    Top = 176
    Width = 864
    Height = 333
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrGrupo0BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      734.21875
      1905)
    Expression = 'qySolicitud.ID_SOLICITUD'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape2: TQRShape
      Left = 0
      Top = 0
      Width = 864
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        0
        0
        1905)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRDBText2: TQRDBText
      Left = 217
      Top = 0
      Width = 80
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        478.454861111111
        0
        176.388888888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'ID_SOLICITUD'
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
    object QRLabel2: TQRLabel
      Left = 157
      Top = 0
      Width = 58
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        346.163194444444
        0
        127.881944444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Solicitud :'
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
    object QRDBText1: TQRDBText
      Left = 64
      Top = 0
      Width = 71
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        141.111111111111
        0
        156.545138888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'ID_CREDITO'
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
    object QRLabel1: TQRLabel
      Left = 12
      Top = 0
      Width = 49
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        0
        108.038194444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Crédito :'
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
    object QRShape6: TQRShape
      Left = 0
      Top = 19
      Width = 864
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        0
        41.8923611111111
        1905)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape7: TQRShape
      Left = 0
      Top = 32
      Width = 864
      Height = 128
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        282.222222222222
        0
        70.5555555555556
        1905)
      Shape = qrsRectangle
    end
    object QRShape8: TQRShape
      Left = 0
      Top = 167
      Width = 864
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        0
        368.211805555556
        1905)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape9: TQRShape
      Left = 0
      Top = 180
      Width = 864
      Height = 98
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        216.076388888889
        0
        396.875
        1905)
      Shape = qrsRectangle
    end
    object QRLabel39: TQRLabel
      Left = 12
      Top = 34
      Width = 52
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        74.9652777777778
        114.652777777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Nombre :'
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
    object QRDBText38: TQRDBText
      Left = 149
      Top = 34
      Width = 476
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        328.524305555556
        74.9652777777778
        1049.51388888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'NOMBRE'
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
    object QRLabel40: TQRLabel
      Left = 644
      Top = 34
      Width = 43
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1419.93055555556
        74.9652777777778
        94.8090277777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'R.F.C. :'
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
    object QRDBText39: TQRDBText
      Left = 700
      Top = 34
      Width = 151
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1543.40277777778
        74.9652777777778
        332.934027777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'RFC'
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
    object QRDBText40: TQRDBText
      Left = 72
      Top = 34
      Width = 71
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        158.75
        74.9652777777778
        156.545138888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'ID_TITULAR'
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
    object QRLabel41: TQRLabel
      Left = 12
      Top = 48
      Width = 91
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        105.833333333333
        200.642361111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Calle y Número :'
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
    object QRDBText41: TQRDBText
      Left = 109
      Top = 48
      Width = 516
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        240.329861111111
        105.833333333333
        1137.70833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'CALLE_NUMERO'
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
    object QRDBText42: TQRDBText
      Left = 70
      Top = 62
      Width = 555
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        154.340277777778
        136.701388888889
        1223.69791666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'COLONIA'
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
    object QRLabel42: TQRLabel
      Left = 12
      Top = 62
      Width = 52
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        136.701388888889
        114.652777777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Colonia :'
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
    object QRLabel43: TQRLabel
      Left = 644
      Top = 62
      Width = 31
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1419.93055555556
        136.701388888889
        68.3506944444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'C.P. :'
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
    object QRDBText43: TQRDBText
      Left = 700
      Top = 62
      Width = 79
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1543.40277777778
        136.701388888889
        174.184027777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'CODIGO_POSTAL'
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
    object QRLabel44: TQRLabel
      Left = 12
      Top = 76
      Width = 48
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        167.569444444444
        105.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Ciudad :'
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
    object QRDBText44: TQRDBText
      Left = 66
      Top = 76
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        145.520833333333
        167.569444444444
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'CIUDAD'
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
    object QRDBText45: TQRDBText
      Left = 354
      Top = 76
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        780.520833333333
        167.569444444444
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'MUNICIPIO'
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
    object QRLabel45: TQRLabel
      Left = 284
      Top = 76
      Width = 62
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        626.180555555556
        167.569444444444
        136.701388888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Municipio :'
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
    object QRLabel46: TQRLabel
      Left = 572
      Top = 76
      Width = 46
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1261.18055555556
        167.569444444444
        101.423611111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Estado :'
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
    object QRDBText46: TQRDBText
      Left = 649
      Top = 76
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1430.95486111111
        167.569444444444
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'ESTADO'
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
    object QRLabel47: TQRLabel
      Left = 12
      Top = 96
      Width = 115
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        211.666666666667
        253.559027777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Giro de la Actividad :'
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
    object QRDBText47: TQRDBText
      Left = 166
      Top = 96
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        366.006944444444
        211.666666666667
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'GIRO'
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
    object QRDBText48: TQRDBText
      Left = 166
      Top = 110
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        366.006944444444
        242.534722222222
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'TIPSEC'
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
    object QRLabel48: TQRLabel
      Left = 12
      Top = 110
      Width = 107
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        242.534722222222
        235.920138888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sector Económico :'
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
    object QRLabel49: TQRLabel
      Left = 572
      Top = 96
      Width = 151
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1261.18055555556
        211.666666666667
        332.934027777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Promedio de Ventas Anual :'
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
    object QRLabel50: TQRLabel
      Left = 572
      Top = 110
      Width = 109
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1261.18055555556
        242.534722222222
        240.329861111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Personal Ocupado :'
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
    object QRDBText49: TQRDBText
      Left = 725
      Top = 96
      Width = 126
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1598.52430555556
        211.666666666667
        277.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'IMP_PROM_VENTAS'
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
    object QRDBText50: TQRDBText
      Left = 725
      Top = 110
      Width = 126
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1598.52430555556
        242.534722222222
        277.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'NUM_PERSONAL'
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
    object QRLabel51: TQRLabel
      Left = 12
      Top = 124
      Width = 324
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        273.402777777778
        714.375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Porcentaje de la Producción destinada al Mercado Interno :'
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
    object QRDBText51: TQRDBText
      Left = 354
      Top = 124
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        780.520833333333
        273.402777777778
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'PCT_PROD_MER_INT'
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
    object QRLabel52: TQRLabel
      Left = 12
      Top = 138
      Width = 326
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        304.270833333333
        718.784722222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Porcentaje de la Producción destinada al Mercado Externo :'
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
    object QRDBText52: TQRDBText
      Left = 354
      Top = 138
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        780.520833333333
        304.270833333333
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'PCT_PROD_MER_EXT'
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
    object QRLabel53: TQRLabel
      Left = 572
      Top = 138
      Width = 149
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1261.18055555556
        304.270833333333
        328.524305555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Solicita Fondeo de NAFIN :'
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
    object QRLabel54: TQRLabel
      Left = 572
      Top = 124
      Width = 133
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1261.18055555556
        273.402777777778
        293.246527777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Antigüedad Cte (Meses) :'
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
    object QRDBText53: TQRDBText
      Left = 725
      Top = 124
      Width = 126
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1598.52430555556
        273.402777777778
        277.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'MES_ANTIGUEDAD'
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
    object QRDBText54: TQRDBText
      Left = 725
      Top = 138
      Width = 126
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1598.52430555556
        304.270833333333
        277.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'FONDEO_NAFIN'
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
    object QRLabel55: TQRLabel
      Left = 12
      Top = 167
      Width = 131
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        368.211805555556
        288.836805555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Datos de la Disposición'
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
    object QRLabel56: TQRLabel
      Left = 12
      Top = 184
      Width = 151
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        405.694444444444
        332.934027777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '% Participación de Riesgo :'
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
    object QRDBText55: TQRDBText
      Left = 166
      Top = 184
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        366.006944444444
        405.694444444444
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'PCT_PART_RIESGO'
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
    object QRLabel57: TQRLabel
      Left = 12
      Top = 198
      Width = 101
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        436.5625
        222.690972222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Imp. Disposición :'
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
    object QRDBText56: TQRDBText
      Left = 166
      Top = 198
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        366.006944444444
        436.5625
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'IMP_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRLabel58: TQRLabel
      Left = 12
      Top = 226
      Width = 126
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        498.298611111111
        277.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha de Disposición :'
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
    object QRDBText57: TQRDBText
      Left = 166
      Top = 226
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        366.006944444444
        498.298611111111
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'F_DISPOSICION'
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
    object QRDBText58: TQRDBText
      Left = 166
      Top = 212
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        366.006944444444
        467.430555555556
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'IMP_FINANCIAMTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRLabel59: TQRLabel
      Left = 12
      Top = 212
      Width = 146
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        467.430555555556
        321.909722222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Monto de Financiamiento :'
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
    object QRLabel60: TQRLabel
      Left = 12
      Top = 254
      Width = 90
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        560.034722222222
        198.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'F.Participación :'
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
    object QRDBText59: TQRDBText
      Left = 166
      Top = 254
      Width = 92
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        366.006944444444
        560.034722222222
        202.847222222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'F_PARTICIPACION'
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
    object QRDBText60: TQRDBText
      Left = 166
      Top = 240
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        366.006944444444
        529.166666666667
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'NUM_MES_PLAZO'
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
    object QRLabel61: TQRLabel
      Left = 12
      Top = 240
      Width = 91
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        529.166666666667
        200.642361111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Plazo en Meses :'
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
    object QRLabel62: TQRLabel
      Left = 412
      Top = 184
      Width = 137
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        908.402777777778
        405.694444444444
        302.065972222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo de Financiamiento :'
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
    object QRDBText61: TQRDBText
      Left = 566
      Top = 184
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1247.95138888889
        405.694444444444
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'CVE_TIP_CRED'
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
    object QRDBText62: TQRDBText
      Left = 566
      Top = 198
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1247.95138888889
        436.5625
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'CVE_TIP_AMORTIZA'
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
    object QRLabel63: TQRLabel
      Left = 412
      Top = 198
      Width = 133
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        908.402777777778
        436.5625
        293.246527777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Forma de Amortización :'
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
    object QRLabel64: TQRLabel
      Left = 412
      Top = 212
      Width = 60
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        908.402777777778
        467.430555555556
        132.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo Tasa :'
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
    object QRDBText63: TQRDBText
      Left = 566
      Top = 212
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1247.95138888889
        467.430555555556
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'CVE_TIP_TASA'
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
    object QRDBText64: TQRDBText
      Left = 566
      Top = 226
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1247.95138888889
        498.298611111111
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'CVE_TIP_AUTORIZA'
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
    object QRLabel65: TQRLabel
      Left = 412
      Top = 226
      Width = 120
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        908.402777777778
        498.298611111111
        264.583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo de Autorización :'
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
    object QRLabel66: TQRLabel
      Left = 412
      Top = 240
      Width = 50
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        908.402777777778
        529.166666666667
        110.243055555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda :'
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
    object QRLabel67: TQRLabel
      Left = 276
      Top = 254
      Width = 109
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        608.541666666667
        560.034722222222
        240.329861111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Calificación Inicial :'
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
    object QRDBText65: TQRDBText
      Left = 386
      Top = 254
      Width = 74
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        851.076388888889
        560.034722222222
        163.159722222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'CVE_CALIF_CRE'
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
    object QRDBText66: TQRDBText
      Left = 566
      Top = 240
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1247.95138888889
        529.166666666667
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'MONEDA'
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
    object QRDBText67: TQRDBText
      Left = 547
      Top = 254
      Width = 74
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1206.05902777778
        560.034722222222
        163.159722222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
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
    object QRLabel68: TQRLabel
      Left = 484
      Top = 254
      Width = 62
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1067.15277777778
        560.034722222222
        136.701388888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sobretasa :'
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
    object QRDBText68: TQRDBText
      Left = 741
      Top = 254
      Width = 74
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1633.80208333333
        560.034722222222
        163.159722222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'NUM_MES_GRACIA'
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
    object QRLabel69: TQRLabel
      Left = 644
      Top = 254
      Width = 96
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1419.93055555556
        560.034722222222
        211.666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Meses de Gracia :'
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
    object QRLabel70: TQRLabel
      Left = 12
      Top = 296
      Width = 144
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        652.638888888889
        317.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Intermediario Financiero :'
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
    object QRDBText69: TQRDBText
      Left = 166
      Top = 296
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        366.006944444444
        652.638888888889
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'CVE_INTER_FINAN'
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
    object QRDBText70: TQRDBText
      Left = 166
      Top = 310
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        366.006944444444
        683.506944444444
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'CVE_PROGRAMA'
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
    object QRLabel71: TQRLabel
      Left = 12
      Top = 310
      Width = 89
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        683.506944444444
        196.232638888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo Programa :'
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
    object QRLabel72: TQRLabel
      Left = 412
      Top = 296
      Width = 125
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        908.402777777778
        652.638888888889
        275.607638888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fun.Inter. Financiero :'
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
    object QRLabel73: TQRLabel
      Left = 412
      Top = 310
      Width = 142
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        908.402777777778
        683.506944444444
        313.090277777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Situación de la Solicitud :'
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
    object QRDBText71: TQRDBText
      Left = 566
      Top = 310
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1247.95138888889
        683.506944444444
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'SIT_SOL_GTIA'
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
    object QRDBText72: TQRDBText
      Left = 566
      Top = 296
      Width = 202
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1247.95138888889
        652.638888888889
        445.381944444445)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'CVE_FUNC_INTER'
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
    object QRLabel74: TQRLabel
      Left = 12
      Top = 19
      Width = 94
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        41.8923611111111
        207.256944444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Datos Acreditado'
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
  object qrGrupoGar: TQRGroup
    Left = 58
    Top = 509
    Width = 864
    Height = 3
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrGrupo0BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      6.61458333333333
      1905)
    Expression = 'qySolicitud.GRUPO'
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGroupCveGar: TQRGroup
    Left = 58
    Top = 512
    Width = 864
    Height = 31
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrGrupo0BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      68.3506944444444
      1905)
    Expression = 'qySolicitud.GRUPO'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape1: TQRShape
      Left = 0
      Top = 0
      Width = 864
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        0
        0
        1905)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape3: TQRShape
      Left = 0
      Top = 13
      Width = 864
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        0
        28.6631944444444
        1905)
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 12
      Top = 0
      Width = 53
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        0
        116.857638888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Garantías'
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
    object QRLabel4: TQRLabel
      Left = 12
      Top = 15
      Width = 78
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        33.0729166666667
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Núm. Garantía'
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
    object QRLabel5: TQRLabel
      Left = 98
      Top = 15
      Width = 182
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        216.076388888889
        33.0729166666667
        401.284722222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Garantía'
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
    object QRLabel6: TQRLabel
      Left = 283
      Top = 15
      Width = 181
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        623.975694444445
        33.0729166666667
        399.079861111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Clasificación'
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
    object QRLabel7: TQRLabel
      Left = 468
      Top = 15
      Width = 99
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1031.875
        33.0729166666667
        218.28125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe'
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
    object QRLabel8: TQRLabel
      Left = 576
      Top = 15
      Width = 77
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1270
        33.0729166666667
        169.774305555556)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Clave NAFIN'
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
    object QRLabel9: TQRLabel
      Left = 656
      Top = 15
      Width = 204
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1446.38888888889
        33.0729166666667
        449.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Descripción'
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
  object QRGroupCveGar2: TQRGroup
    Left = 58
    Top = 543
    Width = 864
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrGrupo0BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      24.2534722222222
      1905)
    Expression = 'qySolicitud.CVE_GARANTIA'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText3: TQRDBText
      Left = 13
      Top = -1
      Width = 77
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        28.6631944444444
        -2.20486111111111
        169.774305555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'NUM_GAR'
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
      Left = 99
      Top = -1
      Width = 181
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        218.28125
        -2.20486111111111
        399.079861111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'DESC_GARANTIA'
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
    object QRDBText5: TQRDBText
      Left = 283
      Top = -1
      Width = 181
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        623.975694444445
        -2.20486111111111
        399.079861111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'CLASIFICACION'
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
    object QRDBText6: TQRDBText
      Left = 468
      Top = -1
      Width = 99
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1031.875
        -2.20486111111111
        218.28125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'IMP_GARANTIA'
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
    object QRDBText7: TQRDBText
      Left = 576
      Top = -1
      Width = 77
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1270
        -2.20486111111111
        169.774305555556)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'CVE_GARANTIA'
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
    object QRDBText8: TQRDBText
      Left = 656
      Top = -1
      Width = 204
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1446.38888888889
        -2.20486111111111
        449.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'DESC_GARANT'
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
  object qrGrupoProposito: TQRGroup
    Left = 58
    Top = 554
    Width = 864
    Height = 3
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrGrupo0BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      6.61458333333333
      1905)
    Expression = 'qySolicitud.GRUPO'
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGroupCveProp: TQRGroup
    Left = 58
    Top = 557
    Width = 864
    Height = 31
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrGrupo0BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      68.3506944444444
      1905)
    Expression = 'qySolicitud.GRUPO'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape4: TQRShape
      Left = 0
      Top = 0
      Width = 864
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        0
        0
        1905)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel10: TQRLabel
      Left = 12
      Top = 0
      Width = 60
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        0
        132.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Propósitos'
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
    object QRShape5: TQRShape
      Left = 0
      Top = 14
      Width = 864
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        0
        30.8680555555556
        1905)
      Shape = qrsRectangle
    end
    object QRLabel11: TQRLabel
      Left = 12
      Top = 15
      Width = 77
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        33.0729166666667
        169.774305555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Clave'
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
    object QRLabel12: TQRLabel
      Left = 95
      Top = 15
      Width = 216
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        209.461805555556
        33.0729166666667
        476.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Descripción'
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
  object QRGroupCveProp2: TQRGroup
    Left = 58
    Top = 588
    Width = 864
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrGrupo0BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      24.2534722222222
      1905)
    Expression = 'qySolicitud.CVE_PROPOSITO'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText10: TQRDBText
      Left = 99
      Top = -1
      Width = 181
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        218.28125
        -2.20486111111111
        399.079861111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'DESC_PROP'
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
      Left = 13
      Top = -1
      Width = 77
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        28.6631944444444
        -2.20486111111111
        169.774305555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'CVE_PROPOSITO'
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
  object QRGroupDestino: TQRGroup
    Left = 58
    Top = 599
    Width = 864
    Height = 3
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrGrupo0BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      6.61458333333333
      1905)
    Expression = 'qySolicitud.GRUPO'
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGroupCveDestino: TQRGroup
    Left = 58
    Top = 602
    Width = 864
    Height = 31
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrGrupo0BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      68.3506944444444
      1905)
    Expression = 'qySolicitud.GRUPO'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape10: TQRShape
      Left = 0
      Top = 0
      Width = 864
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        0
        0
        1905)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape11: TQRShape
      Left = 0
      Top = 13
      Width = 864
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        0
        28.6631944444444
        1905)
      Shape = qrsRectangle
    end
    object QRLabel17: TQRLabel
      Left = 12
      Top = 0
      Width = 49
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        0
        108.038194444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Destinos'
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
    object QRLabel18: TQRLabel
      Left = 12
      Top = 15
      Width = 77
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        26.4583333333333
        33.0729166666667
        169.774305555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Clave'
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
    object QRLabel19: TQRLabel
      Left = 95
      Top = 15
      Width = 216
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        209.461805555556
        33.0729166666667
        476.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Descripción'
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
    object QRLabel20: TQRLabel
      Left = 316
      Top = 15
      Width = 175
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        696.736111111111
        33.0729166666667
        385.850694444444)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Porcentaje Parcial'
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
    object QRLabel21: TQRLabel
      Left = 496
      Top = 15
      Width = 175
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1093.61111111111
        33.0729166666667
        385.850694444444)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Porcentaje Origen Nacional'
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
    object QRLabel23: TQRLabel
      Left = 676
      Top = 15
      Width = 175
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1490.48611111111
        33.0729166666667
        385.850694444444)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Porcentaje Origen Internacional'
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
  object QRGroupCveDestino2: TQRGroup
    Left = 58
    Top = 633
    Width = 864
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrGrupo0BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      24.2534722222222
      1905)
    Expression = 'qySolicitud.CVE_DESTINO'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText15: TQRDBText
      Left = 13
      Top = -1
      Width = 77
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        28.6631944444444
        -2.20486111111111
        169.774305555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'CVE_DESTINO'
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
    object QRDBText16: TQRDBText
      Left = 95
      Top = -1
      Width = 216
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        209.461805555556
        -2.20486111111111
        476.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'DESC_DESTINO'
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
    object QRDBText17: TQRDBText
      Left = 316
      Top = -1
      Width = 136
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        696.736111111111
        -2.20486111111111
        299.861111111111)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'PCT_PARCIAL'
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
    object QRDBText18: TQRDBText
      Left = 496
      Top = -1
      Width = 136
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1093.61111111111
        -2.20486111111111
        299.861111111111)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'PCT_ORIGEN_NAL'
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
    object QRDBText20: TQRDBText
      Left = 676
      Top = -1
      Width = 136
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1490.48611111111
        -2.20486111111111
        299.861111111111)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qySolicitud
      DataField = 'PCT_IMPORTACION'
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
  object qySolicitud: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'SELECT * FROM '
      '('
      
        'SELECT 0 AS GRUPO, NVL(CRSOL.ID_CREDITO,0) AS ID_CREDITO, CRSOL.' +
        'ID_SOLICITUD, '
      
        '       DATOS.ID_TITULAR, DATOS.NOMBRE, DATOS.RFC, DATOS.CALLE_NU' +
        'MERO,'
      
        '       DATOS.COLONIA, DATOS.CODIGO_POSTAL, DATOS.CIUDAD, DATOS.M' +
        'UNICIPIO,'
      
        '       DATOS.ESTADO, DATOS.DESC_SECTOR_ECO AS GIRO, CC.ID_CREDIT' +
        'O AS CVE_FINAN,'
      
        '       DATOS.TIPSEC, DECODE(NVL(CFC.ID_CREDITO,0),0,'#39'N'#39','#39'S'#39')AS F' +
        'ONDEO_NAFIN,'
      '       '#39'S'#39' AS RIESGO_NAFIN, CRSOL.PCT_PART_RIESGO,'
      
        #9'   NVL(CRSOL.NUM_PERSONAL,0) AS NUM_PERSONAL, CRSOL.IMP_PROM_VE' +
        'NTAS,'
      '       CRSOL.PCT_PROD_MER_INT, CRSOL.PCT_PROD_MER_EXT,'
      
        '       TIPAMORT.VALOR AS CVE_TIP_AMORTIZA, CRSOL.IMP_FINANCIAMTO' +
        ','
      
        '       TRIM(TO_CHAR(CC.F_AUTORIZA,'#39'DD/MM/YYYY'#39')) AS F_DISPOSICIO' +
        'N,'
      
        '       TRIM(TO_CHAR(CRSOL.F_PARTICIPACION,'#39'DD/MM/YYYY'#39')) AS F_PA' +
        'RTICIPACION,'
      '       CC.IMP_CREDITO, MONEDA.CVE_CLAVE AS MONEDA,'
      '       CRSOL.NUM_MES_PLAZO, CRSOL.NUM_MES_GRACIA,'
      
        '       CC.SOBRETASA, FUNINTER.VALOR AS CVE_FUNC_INTER, INTFINAN.' +
        'VALOR  AS CVE_INTER_FINAN,'
      
        '       TIPAUT.VALOR AS CVE_TIP_AUTORIZA, PROG.VALOR AS CVE_PROGR' +
        'AMA, TIPTASA.VALOR AS CVE_TIP_TASA,'
      
        '       CCTO.DIAS_PLAZO, CRSOL.CVE_CALIF_CRE, CRSOL.MES_ANTIGUEDA' +
        'D,'
      '       '#39' '#39' AS CVE_PROPOSITO, TIPFINAN.VALOR AS CVE_TIP_CRED,'
      '       '#39' '#39' AS CVE_GARANTIA, 0 IMP_GARANTIA,'
      
        '       0 AS NUM_GAR, '#39' '#39' AS DESC_GARANTIA, '#39' '#39' AS CLASIFICACION,' +
        ' '
      '       '#39' '#39' AS DESC_GARANT, '
      #9'   '#39' '#39' AS CVE_DESTINO, TRIM(TO_CHAR(0,'#39'000'#39')) AS PCT_PARCIAL,'
      '       TRIM(TO_CHAR(0,'#39'000'#39')) AS PCT_ORIGEN_NAL,'
      
        '       TRIM(TO_CHAR(0,'#39'000'#39')) AS PCT_IMPORTACION, '#39' '#39' AS DESC_PR' +
        'OP, '#39' '#39' AS DESC_DESTINO, '
      
        '       DECODE(CRSOL.SIT_SOL_GTIA,'#39'AC'#39','#39'ACTIVO'#39','#39'EN'#39','#39'ENVIADO'#39','#39' ' +
        #39') AS SIT_SOL_GTIA '
      '  FROM CR_CREDITO CC,'
      '       (SELECT CCTO.ID_CONTRATO, CTO.ID_TITULAR, TIT.NOMBRE,'
      
        '               RFC.SIGLAS_RFC||RFC.F_RFC||RFC.HOMOCLAVE_RFC AS R' +
        'FC,'
      '               DOM.CALLE_NUMERO, DOM.COLONIA, DOM.CODIGO_POSTAL,'
      '               DOM.CVE_CIUDAD, CDAD.DESC_POBLACION AS CIUDAD,'
      '               DOM.CVE_CIUDAD AS CVE_MUNICIPIO,'
      #9'           (SELECT CVE_MPIO_CLAVE FROM CR_MAP_MUNICIPIO'
      '                 WHERE CVE_ESTADO = DOM.CVE_ESTADO'
      
        '                   AND CVE_MPIO_CORP = DOM.CVE_CIUDAD)AS MUNICIP' +
        'IO,'
      
        '               DOM.CVE_ESTADO, ESTADO.CVE_CLAVE AS ESTADO, ACR.C' +
        'VE_SECTOR_ECO,'
      
        '               SE.DESC_SECTOR_ECO, SE.CVE_TIPO_SECTOR, SECTOR.CV' +
        'E_CLAVE AS TIPSEC'
      
        '          FROM CR_CONTRATO CCTO, CONTRATO CTO, PERSONA TIT, RFC,' +
        ' DOMICILIO DOM,'
      
        '               CR_ACREDITADO ACR, CR_SECTOR_ECO SE, CRE_SENICREB' +
        ' CSE,POBLACION CDAD,'
      
        '               (SELECT * FROM CR_MAPEO_CLAVE WHERE CVE_GRUPO_CLA' +
        'VE='#39'CVEEDO'#39')ESTADO,'
      
        '               (SELECT * FROM CR_MAPEO_CLAVE WHERE CVE_GRUPO_CLA' +
        'VE='#39'CVESEC'#39')SECTOR'
      '         WHERE CTO.ID_CONTRATO = CCTO.ID_CONTRATO'
      '           AND TIT.ID_PERSONA = CTO.ID_TITULAR'
      '           AND CTO.ID_TITULAR = RFC.ID_PERSONA'
      '           AND DOM.ID_DOMICILIO = TIT.ID_DOMICILIO'
      '           AND ACR.ID_ACREDITADO = CTO.ID_TITULAR'
      '           AND SE.CVE_SECTOR_ECO = ACR.CVE_SECTOR_ECO'
      '           AND CSE.CVE_SENICREB = ACR.CVE_SENICREB'
      '           AND ESTADO.CVE_CORP = DOM.CVE_ESTADO'
      '           AND CDAD.CVE_POBLACION = DOM.CVE_CIUDAD'
      '           AND SECTOR.CVE_CORP = SE.CVE_TIPO_SECTOR'
      '       )DATOS,'
      
        '       CR_FND_CREDITO CFC, CR_CONTRATO CCTO, CR_CB_SOL_GTIA CRSO' +
        'L,'
      
        '       (SELECT * FROM CR_MAPEO_CLAVE WHERE CVE_GRUPO_CLAVE='#39'CVEM' +
        'ON'#39')MONEDA,'
      
        '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE='#39'TIP_' +
        'CR'#39')TIPFINAN,'
      
        '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE='#39'FORA' +
        'UT'#39')TIPAMORT,'
      
        '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE='#39'TPTA' +
        'SA'#39')TIPTASA,'
      
        '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE='#39'TIPA' +
        'UT'#39')TIPAUT, '
      
        '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE='#39'INTE' +
        'RM'#39')INTFINAN, '
      
        '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE='#39'TIPP' +
        'RO'#39')PROG, '
      
        '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE='#39'FUNI' +
        'NT'#39')FUNINTER '
      ' WHERE DATOS.ID_CONTRATO = CC.ID_CONTRATO'
      '   AND CFC.ID_CREDITO (+)= CC.ID_CREDITO'
      '   AND CCTO.ID_CONTRATO = CC.ID_CONTRATO'
      '   AND CCTO.FOL_CONTRATO = CC.FOL_CONTRATO'
      '   AND CRSOL.ID_CREDITO = CC.ID_CREDITO'
      '   AND CRSOL.ID_CREDITO =138006'
      '   AND CRSOL.ID_SOLICITUD=1'
      '   AND MONEDA.CVE_CORP (+)= CCTO.CVE_MONEDA'
      '   AND TIPFINAN.CVE_REFERENCIA (+)= CRSOL.CVE_TIP_CRED'
      '   AND TIPAMORT.CVE_REFERENCIA (+)= CRSOL.CVE_TIP_AMORTIZA'
      '   AND TIPTASA.CVE_REFERENCIA (+)= CRSOL.CVE_TIP_TASA'
      '   AND TIPAUT.CVE_REFERENCIA (+)= CRSOL.CVE_TIP_AUTORIZA'
      '   AND INTFINAN.CVE_REFERENCIA (+)= CRSOL.CVE_INTER_FINAN'
      '   AND PROG.CVE_REFERENCIA (+)= CRSOL.CVE_PROGRAMA'
      '   AND FUNINTER.CVE_REFERENCIA (+)= CRSOL.CVE_FUNC_INTER'
      'UNION ALL'
      'SELECT 1 , NVL(GARANT.ID_DISPOSICION,0) ,'
      '      1 , '
      '       0 , '#39' '#39' , '#39' '#39' , '#39' '#39' ,'
      '       '#39' '#39' , '#39' '#39' , '#39' '#39' , '#39' '#39' ,'
      '       '#39' '#39' , '#39' '#39' , GARANT.ID_DISPOSICION ,'
      '       '#39' '#39' , '#39'S'#39' ,'#39'S'#39' , 0 , 0 , 0 , 0 , 0 ,'#39' '#39' , 0 ,'
      '       TRIM(TO_CHAR(SYSDATE,'#39'DD/MM/YYYY'#39')) ,'
      '       TRIM(TO_CHAR(SYSDATE,'#39'DD/MM/YYYY'#39')) ,'
      '       0 , '#39' '#39' ,0 , 0 ,0 , '#39' '#39' , '#39' '#39' ,'
      '       '#39' '#39' , '#39' '#39' , '#39' '#39' ,0 , '#39' '#39' , 0 ,'
      '       '#39' '#39' , '#39' '#39' ,'
      '       GARANT.CVE_CLAVE AS CVE_GARANTIA, GARANT.IMP_GARANTIA,'
      
        '       GARANT.ID_SOLICITUD AS NUM_GAR, GARANT.DESC_GARANTIA, GAR' +
        'ANT.CLASIFICACION, '
      '       GARANT.VALOR AS DESC_GARANT, '
      #9'   '#39' '#39' , TRIM(TO_CHAR(0,'#39'000'#39')) ,'
      '       TRIM(TO_CHAR(0,'#39'000'#39')) ,'
      '       TRIM(TO_CHAR(0,'#39'000'#39')) , '#39' '#39' , '#39' '#39','#39' '#39' '
      '  FROM '
      '       --GARANTÍAS'
      
        '       (SELECT CR_GA_DIS_GAR.ID_DISPOSICION, CR_GA_REGISTRO.ID_A' +
        'CREDITADO,'
      
        '               CR_GA_REGISTRO.ID_SOLICITUD, CR_GA_GARANTIA.DESC_' +
        'GARANTIA,'
      '               DECODE(NVL(CR_GA_NAVE_IND.ID_SOLICITUD,0),0,'
      '               DECODE(NVL(CR_GA_BI_MUEB.ID_SOLICITUD,0),0,'
      '               DECODE(NVL(CR_GA_PRENDARIAS.ID_SOLICITUD,0),0,'
      '               DECODE(NVL(CR_GA_PERSONALES.ID_SOLICITUD,0),0,'
      '               DECODE(NVL(CR_GA_CESION.ID_SOLICITUD,0),0,'
      '               DECODE(NVL(CR_GA_PAR_APOR.ID_SOLICITUD,0),0,'
      '               DECODE(NVL(CR_GA_SIN_CLAS.ID_SOLICITUD,0),0,'
      '               DECODE(NVL(CR_GA_BI_INMUEB.ID_SOLICITUD,0),0,'
      '               DECODE(NVL(CR_GA_DOC_COB.ID_SOLICITUD,0),0,'#39' '#39','
      '               '#39'DOCUMENTOS POR COBRAR'#39'),'#39'BIEN INMUEBLE'#39'),'
      
        '               '#39'SIN CLASIFICACION'#39'),'#39'PARTICIPACIONES/APORTACIONE' +
        'S FEDERALES'#39'),'
      '               '#39'CESION'#39'),'#39'PERSONALES'#39'),'#39'PENDARIAS'#39'),'
      
        '               '#39'BIEN MUEBLE'#39'),'#39'NAVE/UNIDAD INDUSTRIAL'#39')CLASIFICA' +
        'CION,'
      '               NVL(CR_GA_DIS_GAR.IMP_GARANTIA,0)IMP_GARANTIA,'
      
        '               CR_GA_DIS_GAR.ID_REL_DIS_GAR, GAR.CVE_CLAVE, GPO.' +
        'VALOR'
      '          FROM CR_GA_REGISTRO, CR_GA_BI_INMUEB, CR_GA_BI_MUEB,'
      '               CR_GA_PRENDARIAS, CR_GA_PERSONALES, CR_GA_CESION,'
      '               CR_GA_PAR_APOR, CR_GA_SIN_CLAS, CR_GA_GARANTIA,'
      '               CR_GA_DIS_GAR, CR_GA_DOC_COB, CR_GA_NAVE_IND,'
      
        '               (SELECT * FROM CR_MAPEO_CLAVE WHERE CVE_GRUPO_CLA' +
        'VE='#39'CVGTIA'#39')GAR,'
      '               CR_GRUPO_CLAVE GPO'
      
        '         WHERE CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_BI_INMUEB.ID_' +
        'SOLICITUD(+)'
      
        '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_BI_MUEB.ID_SO' +
        'LICITUD(+)'
      
        '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PRENDARIAS.ID' +
        '_SOLICITUD(+)'
      
        '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PERSONALES.ID' +
        '_SOLICITUD(+)'
      
        '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_CESION.ID_SOL' +
        'ICITUD(+)'
      
        '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PAR_APOR.ID_S' +
        'OLICITUD(+)'
      
        '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_SIN_CLAS.ID_S' +
        'OLICITUD(+)'
      
        '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_DOC_COB.ID_SO' +
        'LICITUD(+)'
      
        '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_NAVE_IND.ID_S' +
        'OLICITUD(+)'
      
        '           AND CR_GA_REGISTRO.CVE_GARANTIA = CR_GA_GARANTIA.CVE_' +
        'GARANTIA'
      '           AND CR_GA_REGISTRO.SIT_REG_GARANTIA='#39'AC'#39
      
        '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_DIS_GAR.ID_RE' +
        'G_SOL_GAR'
      '           AND GAR.CVE_CORP (+)= CR_GA_REGISTRO.CVE_GARANTIA'
      '           AND GPO.CVE_REFERENCIA (+)= GAR.CVE_CLAVE'
      '           AND GPO.CVE_GRUPO_CLAVE (+)= GAR.CVE_GRUPO_CLAVE'
      '           AND CR_GA_DIS_GAR.ID_DISPOSICION =138006'
      
        '         ORDER BY CR_GA_DIS_GAR.ID_REL_DIS_GAR, CR_GA_DIS_GAR.ID' +
        '_DISPOSICION'
      '       )GARANT'
      'UNION ALL'
      
        'SELECT 2 AS GRUPO,PP.ID_CREDITO,PP.ID_SOLICITUD, 0, '#39' '#39', '#39' '#39', '#39' ' +
        #39', '#39' '#39', '#39' '#39', '#39' '#39', '#39' '#39','
      '       '#39' '#39', '#39' '#39', PP.ID_CREDITO, '#39' '#39', '#39'S'#39', '#39'S'#39' , 0,'
      #9'     0, 0, 0, 0, '#39' '#39', 0, TRIM(TO_CHAR(SYSDATE,'#39'YYYYMMDD'#39')) ,'
      '       TRIM(TO_CHAR(SYSDATE,'#39'YYYYMMDD'#39')), '
      '       0,  '#39' '#39', 0, 0 , 0,  '#39' '#39',  '#39' '#39', '#39' '#39', '#39' '#39', '#39' '#39','
      '       0, '#39' '#39', 0, PP.CVE_PROPOSITO, '#39' '#39', '#39' '#39', 0,'
      '       0 AS NUM_GAR, '#39' '#39', '#39' '#39','#39' '#39', '
      
        #9'     '#39' '#39', TRIM(TO_CHAR(0,'#39'000'#39')),TRIM(TO_CHAR(0,'#39'000'#39')),TRIM(TO' +
        '_CHAR(0,'#39'000'#39')),'
      '       PROP.VALOR AS DESC_PROP, '#39' '#39' AS DESC_DESTINO,'#39' '#39' '
      '  FROM CR_CB_PRO_PROY PP, '
      
        '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE='#39'CVPR' +
        'OP'#39')PROP '
      ' WHERE PROP.CVE_REFERENCIA = PP.CVE_PROPOSITO '
      '   AND PP.ID_CREDITO =138006'
      '   AND PP.ID_SOLICITUD=1'
      'UNION ALL'
      
        'SELECT 3 AS GRUPO, DES.ID_CREDITO, DES.ID_SOLICITUD, 0, '#39' '#39', '#39' '#39 +
        ', '#39' '#39', '#39' '#39', '#39' '#39', '#39' '#39', '#39' '#39','
      '       '#39' '#39', '#39' '#39', DES.ID_CREDITO, '#39' '#39', '#39'S'#39', '#39'S'#39' , 0,'
      #9'     0, 0, 0, 0, '#39' '#39', 0, TRIM(TO_CHAR(SYSDATE,'#39'YYYYMMDD'#39')) ,'
      '       TRIM(TO_CHAR(SYSDATE,'#39'YYYYMMDD'#39')), '
      '       0,  '#39' '#39', 0, 0 , 0,  '#39' '#39',  '#39' '#39', '#39' '#39', '#39' '#39', '#39' '#39','
      '       0, '#39' '#39', 0, '#39' '#39', '#39' '#39', '#39' '#39', 0,'
      '       0, '#39' '#39', '#39' '#39','#39' '#39', '
      
        #9'     DES.CVE_DESTINO, TRIM(TO_CHAR(DES.PCT_PARCIAL,'#39'000'#39')) AS P' +
        'CT_PARCIAL,'
      
        '       TRIM(TO_CHAR(DES.PCT_ORIGEN_NAL,'#39'000'#39')) AS PCT_ORIGEN_NAL' +
        ','
      
        '       TRIM(TO_CHAR(DES.PCT_IMPORTACION,'#39'000'#39')) AS PCT_IMPORTACI' +
        'ON, '
      '       '#39' '#39' AS DESC_PROP, DEST.VALOR AS DESC_DESTINO, '#39' '#39' '
      '  FROM CR_CB_DESTINO DES, '
      
        '       (SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE='#39'CVPR' +
        'OP'#39')DEST '
      ' WHERE DEST.CVE_REFERENCIA = DES.CVE_DESTINO '
      '   AND DES.ID_CREDITO =138006'
      '   AND DES.ID_SOLICITUD=1'
      ')'
      
        'ORDER BY CVE_FINAN, GRUPO, ID_SOLICITUD,  CVE_PROPOSITO, CVE_DES' +
        'TINO')
    Left = 157
    Top = 47
  end
end
