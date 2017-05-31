object QrEdoCta: TQrEdoCta
  Left = 0
  Top = -557
  Width = 979
  Height = 1267
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  AfterPrint = QuickRepAfterPrint
  AfterPreview = QuickRepAfterPreview
  BeforePrint = QuickRepBeforePrint
  DataSet = qyQuery
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
  object FootTOTAL_DET_ADEUDO: TQRBand
    Left = 58
    Top = 1081
    Width = 864
    Height = 38
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = FootTOTAL_DET_ADEUDOAfterPrint
    AlignToBottom = False
    BeforePrint = FootTOTAL_DET_ADEUDOBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      83.7847222222222
      1905)
    BandType = rbGroupFooter
    object QRShape10: TQRShape
      Left = 408
      Top = 4
      Width = 443
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        899.583333333333
        7.9375
        976.3125)
      Shape = qrsRectangle
    end
    object qrlTotal: TQRLabel
      Left = 420
      Top = 7
      Width = 125
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        926.041666666667
        15.4340277777778
        275.607638888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total de Adeudo Vencido al '
      Color = clWhite
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
    object qrSuma: TQRLabel
      Left = 698
      Top = 7
      Width = 132
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1538.99305555556
        15.4340277777778
        291.041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrSuma'
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
  object PageFooterBand1: TQRBand
    Left = 58
    Top = 1120
    Width = 864
    Height = 388
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = PageFooterBand1AfterPrint
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      855.486111111111
      1905)
    BandType = rbGroupFooter
    object QRShape25: TQRShape
      Left = 0
      Top = 35
      Width = 863
      Height = 321
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        707.760416666667
        0
        77.1701388888889
        1902.79513888889)
      Shape = qrsRectangle
    end
    object QRShape11: TQRShape
      Left = 0
      Top = 1
      Width = 863
      Height = 34
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.9652777777778
        0
        2.20486111111111
        1902.79513888889)
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Left = 16
      Top = 3
      Width = 830
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        35.2777777777778
        6.61458333333333
        1830.03472222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        'EL IMPORTE DE SU ADEUDO VENCIDO A LA FECHA DE CORTE DEL PRESENTE' +
        ' ESTADO DE CUENTA, NO INCLUYE LOS INTERESES MORATORIOS POR LO CU' +
        'AL DEBERA CONSIDERARSE AL MOMENTO DE EFECTUAR SU PAGO.'
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
    object QRLabel39: TQRLabel
      Left = 17
      Top = 23
      Width = 829
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        37.4826388888889
        50.7118055555556
        1827.82986111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        'SI SU FECHA DE VENCIMIENTO CORRESPONDE A UN DÍA INHABIL BANCARIO' +
        ', PUEDE REALIZAR SU PAGO EL SIGUIENTE DÍA HÁBIL BANCARIO.'
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
    object QRLabel78: TQRLabel
      Left = 17
      Top = 40
      Width = 47
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        37.4826388888889
        88.1944444444444
        103.628472222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sello Digital:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRLabel83: TQRLabel
      Left = 17
      Top = 65
      Width = 29
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        37.4826388888889
        143.315972222222
        63.9409722222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cadena:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRLabel80: TQRLabel
      Left = 17
      Top = 79
      Width = 824
      Height = 47
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.628472222222
        37.4826388888889
        174.184027777778
        1816.80555555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'hi'
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
    object QRLabel77: TQRLabel
      Left = 768
      Top = 41
      Width = 20
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        1693.33333333333
        90.3993055555556
        44.0972222222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'Folio'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRLabel76: TQRLabel
      Left = 792
      Top = 41
      Width = 23
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        1746.25
        90.3993055555556
        50.7118055555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'Prueba'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRLabel84: TQRLabel
      Left = 17
      Top = 199
      Width = 61
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        37.4826388888889
        438.767361111111
        134.496527777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Año Aprobación:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRLabel85: TQRLabel
      Left = 17
      Top = 213
      Width = 16
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        37.4826388888889
        469.635416666667
        35.2777777777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = '2010'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRLabel87: TQRLabel
      Left = 193
      Top = 213
      Width = 16
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        425.538194444444
        469.635416666667
        35.2777777777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = '1122'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRLabel86: TQRLabel
      Left = 193
      Top = 199
      Width = 56
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        425.538194444444
        438.767361111111
        123.472222222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'No Aprobación:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRLabel88: TQRLabel
      Left = 441
      Top = 199
      Width = 128
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        972.34375
        438.767361111111
        282.222222222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'No de Serie del Certificado del CSD: '
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRLabel89: TQRLabel
      Left = 441
      Top = 213
      Width = 73
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        972.34375
        469.635416666667
        160.954861111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = '12345678901234567890'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRLabel91: TQRLabel
      Left = 640
      Top = 213
      Width = 28
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        1411.11111111111
        469.635416666667
        61.7361111111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = '2/2/2010'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRLabel90: TQRLabel
      Left = 640
      Top = 199
      Width = 115
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        1411.11111111111
        438.767361111111
        253.559027777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Lugar. Fecha y Hora de Emisión:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRLabel79: TQRLabel
      Left = 17
      Top = 53
      Width = 23
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        37.4826388888889
        116.857638888889
        50.7118055555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'Prueba'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object QRLabel93: TQRLabel
      Left = 15
      Top = 358
      Width = 262
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        33.0729166666667
        789.340277777778
        577.673611111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Esta es una impresión de un comprobante fiscal digital'
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
    object QRLabel92: TQRLabel
      Left = 17
      Top = 230
      Width = 78
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        37.4826388888889
        507.118055555556
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Regimen Fiscal : '
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
    object QRLabel94: TQRLabel
      Left = 97
      Top = 230
      Width = 44
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        213.871527777778
        507.118055555556
        97.0138888888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'QRLabel94'
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
    object QRLabel95: TQRLabel
      Left = 17
      Top = 241
      Width = 78
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        37.4826388888889
        531.371527777778
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Metodo de Pago: '
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
    object QRLabel96: TQRLabel
      Left = 97
      Top = 241
      Width = 44
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        213.871527777778
        531.371527777778
        97.0138888888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'QRLabel96'
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
    object QRLabel99: TQRLabel
      Left = 17
      Top = 252
      Width = 78
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        37.4826388888889
        555.625
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Numero de Cuenta :'
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
    object QRLabel100: TQRLabel
      Left = 97
      Top = 252
      Width = 49
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        213.871527777778
        555.625
        108.038194444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'QRLabel100'
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
    object QRLabel101: TQRLabel
      Left = 17
      Top = 263
      Width = 78
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        37.4826388888889
        579.878472222222
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Unidad de Pago: '
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
    object QRLabel102: TQRLabel
      Left = 97
      Top = 263
      Width = 49
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        213.871527777778
        579.878472222222
        108.038194444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'QRLabel102'
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
    object QRLabel103: TQRLabel
      Left = 17
      Top = 274
      Width = 78
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        37.4826388888889
        604.131944444444
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tipo de Cambio: '
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
    object QRLabel104: TQRLabel
      Left = 97
      Top = 274
      Width = 49
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        213.871527777778
        604.131944444444
        108.038194444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'QRLabel104'
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
    object qrlSelloSat: TQRLabel
      Left = 17
      Top = 130
      Width = 52
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        37.4826388888889
        286.631944444444
        114.652777777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Sello del SAT:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object qrlSelloTimbre: TQRLabel
      Left = 17
      Top = 143
      Width = 827
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        37.4826388888889
        315.295138888889
        1823.42013888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'SELLO TIMBRE'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object qrlCadenaSat: TQRLabel
      Left = 17
      Top = 157
      Width = 320
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        37.4826388888889
        346.163194444444
        705.555555555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        'Cadena Original del Complemento de Certificación Digital del SAT' +
        ':'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object qrlCadenaTimbre: TQRLabel
      Left = 17
      Top = 170
      Width = 827
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        37.4826388888889
        374.826388888889
        1823.42013888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CADENA TIMBRE'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
    object qlrFechaTimbreLabel: TQRLabel
      Left = 17
      Top = 310
      Width = 149
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        37.4826388888889
        683.506944444444
        328.524305555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha y Hora de Certificación:'
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
    object qrlCertificadoPacLabel: TQRLabel
      Left = 17
      Top = 298
      Width = 146
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        37.4826388888889
        657.048611111111
        321.909722222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'No de Serie del Certificado del SAT :'
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
    object qrlFechaTimbre: TQRLabel
      Left = 166
      Top = 310
      Width = 177
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        366.006944444444
        683.506944444444
        390.260416666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlFechaTimbre'
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
    object qrlCertificadoPac: TQRLabel
      Left = 166
      Top = 298
      Width = 177
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        366.006944444444
        657.048611111111
        390.260416666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCertificadoPac'
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
    object qrlFolioFiscalLabel: TQRLabel
      Left = 17
      Top = 286
      Width = 78
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        37.4826388888889
        630.590277777778
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Folio Fiscal:'
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
    object qrlFolioFiscal: TQRLabel
      Left = 97
      Top = 286
      Width = 225
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        213.871527777778
        630.590277777778
        496.09375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlFolioFiscal'
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
    object QRIQr: TQRImage
      Left = 718
      Top = 237
      Width = 118
      Height = 112
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        246.944444444444
        1583.09027777778
        522.552083333333
        260.173611111111)
      Stretch = True
    end
  end
  object FootTOTAL_DET_MOVTOS: TQRBand
    Left = 58
    Top = 1119
    Width = 864
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
      2.20486111111111
      1905)
    BandType = rbGroupFooter
  end
  object FootTOTAL_DET_PROG: TQRBand
    Left = 58
    Top = 1054
    Width = 864
    Height = 27
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = FootTOTAL_DET_PROGBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      59.53125
      1905)
    BandType = rbGroupFooter
    object QRShape15: TQRShape
      Left = 408
      Top = 4
      Width = 443
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        899.583333333333
        7.9375
        976.3125)
      Shape = qrsRectangle
    end
    object QRLabel40: TQRLabel
      Left = 420
      Top = 7
      Width = 82
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        926.041666666667
        15.4340277777778
        180.798611111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total programado'
      Color = clWhite
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
    object QRLSumaProgramado: TQRLabel
      Left = 698
      Top = 7
      Width = 132
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1538.99305555556
        15.4340277777778
        291.041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrSuma'
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
  object QRGpoTitulo: TQRGroup
    Left = 58
    Top = 161
    Width = 864
    Height = 96
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRGpoTituloAfterPrint
    AlignToBottom = False
    BeforePrint = QRGpoTituloBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = True
    Size.Values = (
      211.666666666667
      1905)
    Expression = 'qyQuery.ID_CREDITO'
    FooterBand = PageFooterBand1
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel42: TQRLabel
      Left = 473
      Top = 39
      Width = 218
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.0972222222222
        1042.89930555556
        85.9895833333333
        480.659722222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Estado de Cuenta de Crédito'
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
  end
  object QrGpoAutoriazcion: TQRGroup
    Left = 58
    Top = 257
    Width = 864
    Height = 160
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QrGpoAutoriazcionAfterPrint
    AlignToBottom = False
    BeforePrint = QrGpoAutoriazcionBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      352.777777777778
      1905)
    Expression = 'qyQuery.ID_CREDITO'
    Master = Owner
    ReprintOnNewPage = False
    object s2DatosAcred: TQRShape
      Left = 18
      Top = 16
      Width = 442
      Height = 122
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        268.993055555556
        39.6875
        35.2777777777778
        974.548611111111)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object s1DatosAcred: TQRShape
      Left = 14
      Top = 11
      Width = 443
      Height = 124
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        273.402777777778
        30.8680555555556
        24.2534722222222
        976.753472222222)
      Shape = qrsRectangle
    end
    object QRShape1: TQRShape
      Left = 488
      Top = 16
      Width = 359
      Height = 122
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        268.993055555556
        1075.97222222222
        35.2777777777778
        791.545138888889)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRShape6: TQRShape
      Left = 484
      Top = 11
      Width = 360
      Height = 124
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        273.402777777778
        1067.15277777778
        24.2534722222222
        793.75)
      Shape = qrsRectangle
    end
    object QRDBText44: TQRDBText
      Left = 23
      Top = 38
      Width = 420
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        50.7118055555556
        83.7847222222222
        926.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
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
    object QRLabel3: TQRLabel
      Left = 23
      Top = 21
      Width = 52
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        50.7118055555556
        46.3020833333333
        114.652777777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Acreditado :'
      Color = clWhite
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
    object QRDBText45: TQRDBText
      Left = 23
      Top = 52
      Width = 420
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        50.7118055555556
        114.652777777778
        926.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
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
    object QRDBText46: TQRDBText
      Left = 23
      Top = 66
      Width = 420
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        50.7118055555556
        145.520833333333
        926.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
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
    object QRDBText47: TQRDBText
      Left = 23
      Top = 81
      Width = 210
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        50.7118055555556
        178.59375
        463.020833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'DELEGACION'
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
      Left = 233
      Top = 81
      Width = 210
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        513.732638888889
        178.59375
        463.020833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
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
    object QRDBText49: TQRDBText
      Left = 23
      Top = 95
      Width = 420
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        50.7118055555556
        209.461805555556
        926.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
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
    object QRDBText50: TQRDBText
      Left = 23
      Top = 109
      Width = 210
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        50.7118055555556
        240.329861111111
        463.020833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'PAIS'
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
    object QRDBText51: TQRDBText
      Left = 233
      Top = 109
      Width = 210
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        513.732638888889
        240.329861111111
        463.020833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'CVE_RFC'
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
    object QRDBText52: TQRDBText
      Left = 611
      Top = 76
      Width = 227
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1347.17013888889
        167.569444444444
        500.503472222222)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'ID_CONTRATO'
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
    object QRDBText53: TQRDBText
      Left = 492
      Top = 37
      Width = 346
      Height = 36
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        1084.79166666667
        81.5798611111111
        762.881944444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
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
    object QRDBText54: TQRDBText
      Left = 611
      Top = 93
      Width = 227
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1347.17013888889
        205.052083333333
        500.503472222222)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'CTO_DEP'
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
    object QRDBText55: TQRDBText
      Left = 611
      Top = 110
      Width = 227
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1347.17013888889
        242.534722222222
        500.503472222222)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
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
    object QRLabel44: TQRLabel
      Left = 492
      Top = 23
      Width = 80
      Height = 13
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1084.79166666667
        50.7118055555556
        176.388888888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tipo de Crédito :'
      Color = clWhite
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
    object QRLabel45: TQRLabel
      Left = 492
      Top = 76
      Width = 80
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1084.79166666667
        167.569444444444
        176.388888888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Contrato'
      Color = clWhite
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
    object QRLabel46: TQRLabel
      Left = 492
      Top = 93
      Width = 101
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1084.79166666667
        205.052083333333
        222.690972222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Contrato de Depósito'
      Color = clWhite
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
    object QRLabel47: TQRLabel
      Left = 492
      Top = 110
      Width = 101
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1084.79166666667
        242.534722222222
        222.690972222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Moneda'
      Color = clWhite
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
    object qrlFechas: TQRLabel
      Left = 798
      Top = -2
      Width = 43
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1759.47916666667
        -4.40972222222222
        94.8090277777778)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlFechas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = False
      FontSize = 6
    end
    object QRShape24: TQRShape
      Left = 20
      Top = 143
      Width = 830
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        44.0972222222222
        315.295138888889
        1830.03472222222)
      Pen.Width = 2
      Shape = qrsHorLine
    end
  end
  object GpoCredito: TQRGroup
    Left = 58
    Top = 417
    Width = 864
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
    Expression = 'qyQuery.ID_CREDITO'
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGroupDATOS: TQRGroup
    Left = 58
    Top = 417
    Width = 864
    Height = 445
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupDATOSBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      981.163194444444
      1905)
    Expression = 'qyQuery.ID_CREDITO'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape14: TQRShape
      Left = 14
      Top = 430
      Width = 836
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        15.4340277777778
        30.8680555555556
        948.090277777778
        1843.26388888889)
      Shape = qrsHorLine
    end
    object QRLabel70: TQRLabel
      Left = 246
      Top = 339
      Width = 132
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        542.395833333333
        747.447916666667
        291.041666666667)
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
      WordWrap = False
      FontSize = 7
    end
    object QRLabel71: TQRLabel
      Left = 246
      Top = 354
      Width = 91
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        542.395833333333
        780.520833333333
        200.642361111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Intereses de Periodo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRLabel72: TQRLabel
      Left = 246
      Top = 367
      Width = 132
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        542.395833333333
        809.184027777778
        291.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Capital Programado '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRDBText77: TQRDBText
      Left = 678
      Top = 354
      Width = 156
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1494.89583333333
        780.520833333333
        343.958333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IMP_INTERES_CTE'
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
    object QRLabel73: TQRLabel
      Left = 678
      Top = 339
      Width = 156
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1494.89583333333
        747.447916666667
        343.958333333333)
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
      WordWrap = False
      FontSize = 7
    end
    object QRDBText78: TQRDBText
      Left = 678
      Top = 367
      Width = 156
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1494.89583333333
        809.184027777778
        343.958333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IMP_CAPITAL_CTE'
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
    object QRLabel81: TQRLabel
      Left = 246
      Top = 394
      Width = 132
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        542.395833333333
        868.715277777778
        291.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Financiamiento Adicional'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRLabel82: TQRLabel
      Left = 246
      Top = 381
      Width = 99
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        542.395833333333
        840.052083333333
        218.28125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Comisión Programada'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRDBText81: TQRDBText
      Left = 678
      Top = 381
      Width = 156
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1494.89583333333
        840.052083333333
        343.958333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IMP_COMIS_CTE'
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
    object QRDBText82: TQRDBText
      Left = 678
      Top = 394
      Width = 156
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1494.89583333333
        868.715277777778
        343.958333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'SDO_FIN_ADIC_CTE'
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
    object QRShape3: TQRShape
      Left = 19
      Top = 22
      Width = 829
      Height = 117
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        257.96875
        41.8923611111111
        48.5069444444444
        1827.82986111111)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRShape7: TQRShape
      Left = 14
      Top = 17
      Width = 830
      Height = 118
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        260.173611111111
        30.8680555555556
        37.4826388888889
        1830.03472222222)
      Shape = qrsRectangle
    end
    object QRDBText56: TQRDBText
      Left = 656
      Top = 104
      Width = 180
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1446.38888888889
        229.305555555556
        396.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'INT_PAG'
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
    object QRDBText57: TQRDBText
      Left = 166
      Top = 91
      Width = 277
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        366.006944444444
        200.642361111111
        610.746527777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
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
    object QRDBText58: TQRDBText
      Left = 166
      Top = 104
      Width = 277
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        366.006944444444
        229.305555555556
        610.746527777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
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
    object QRDBText59: TQRDBText
      Left = 656
      Top = 26
      Width = 180
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1446.38888888889
        57.3263888888889
        396.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
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
    object QRDBText60: TQRDBText
      Left = 656
      Top = 65
      Width = 179
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1446.38888888889
        143.315972222222
        394.670138888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'TASA_CREDITO_CTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,##0.0000 %'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText61: TQRDBText
      Left = 656
      Top = 90
      Width = 180
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1446.38888888889
        198.4375
        396.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'CAP_PAG'
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
    object QRDBText62: TQRDBText
      Left = 656
      Top = 39
      Width = 180
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1446.38888888889
        85.9895833333333
        396.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
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
    object QRDBText63: TQRDBText
      Left = 166
      Top = 78
      Width = 277
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        366.006944444444
        171.979166666667
        610.746527777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
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
    object QRDBText64: TQRDBText
      Left = 166
      Top = 64
      Width = 277
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        366.006944444444
        141.111111111111
        610.746527777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'DESC_TASA_INDIC'
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
    object QRDBText65: TQRDBText
      Left = 166
      Top = 51
      Width = 173
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        366.006944444444
        112.447916666667
        381.440972222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
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
    object QRDBText66: TQRDBText
      Left = 166
      Top = 38
      Width = 173
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        366.006944444444
        83.7847222222222
        381.440972222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'ID_CREDITO'
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
      Left = 23
      Top = 38
      Width = 130
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        50.7118055555556
        83.7847222222222
        286.631944444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Número de Crédito: '
      Color = clWhite
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
    object QRLabel49: TQRLabel
      Left = 23
      Top = 20
      Width = 162
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        50.7118055555556
        44.0972222222222
        357.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Información General del Crédito'
      Color = clWhite
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
    object QRLabel50: TQRLabel
      Left = 23
      Top = 51
      Width = 130
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        50.7118055555556
        112.447916666667
        286.631944444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Monto Original del Crédito: '
      Color = clWhite
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
    object QRLabel51: TQRLabel
      Left = 23
      Top = 64
      Width = 130
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        50.7118055555556
        141.111111111111
        286.631944444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tasa pactada (Cliente): '
      Color = clWhite
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
    object QRLabel52: TQRLabel
      Left = 23
      Top = 104
      Width = 134
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        50.7118055555556
        229.305555555556
        295.451388888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Forma de Pago de Intereses: '
      Color = clWhite
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
    object QRLabel53: TQRLabel
      Left = 23
      Top = 91
      Width = 130
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        50.7118055555556
        200.642361111111
        286.631944444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Forma de Pago de Capital: '
      Color = clWhite
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
    object QRLabel54: TQRLabel
      Left = 23
      Top = 78
      Width = 130
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        50.7118055555556
        171.979166666667
        286.631944444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cálculo de Intereses: '
      Color = clWhite
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
    object QRLabel55: TQRLabel
      Left = 492
      Top = 26
      Width = 152
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1084.79166666667
        57.3263888888889
        335.138888888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha de Inicio del Crédito: '
      Color = clWhite
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
    object QRLabel56: TQRLabel
      Left = 492
      Top = 39
      Width = 160
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1084.79166666667
        85.9895833333333
        352.777777777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha de Vencimiento del Crédito: '
      Color = clWhite
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
    object QRLabel57: TQRLabel
      Left = 492
      Top = 52
      Width = 152
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1084.79166666667
        114.652777777778
        335.138888888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha de Corte: '
      Color = clWhite
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
    object QRLabel58: TQRLabel
      Left = 492
      Top = 65
      Width = 113
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1084.79166666667
        143.315972222222
        249.149305555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tasa Ordinaria al Corte: '
      Color = clWhite
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
    object QRLabel59: TQRLabel
      Left = 492
      Top = 90
      Width = 152
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1084.79166666667
        198.4375
        335.138888888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Periodo de Capital a Pagar: '
      Color = clWhite
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
    object QRLabel60: TQRLabel
      Left = 492
      Top = 104
      Width = 152
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1084.79166666667
        229.305555555556
        335.138888888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Periodo de Interés a Pagar: '
      Color = clWhite
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
    object QRDBText67: TQRDBText
      Left = 656
      Top = 52
      Width = 180
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1446.38888888889
        114.652777777778
        396.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'F_CORTE'
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
    object QRShape4: TQRShape
      Left = 19
      Top = 181
      Width = 829
      Height = 130
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        286.631944444444
        41.8923611111111
        399.079861111111
        1827.82986111111)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRShape9: TQRShape
      Left = 15
      Top = 176
      Width = 831
      Height = 132
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        291.041666666667
        33.0729166666667
        388.055555555556
        1832.23958333333)
      Shape = qrsRectangle
    end
    object QRShape13: TQRShape
      Left = 15
      Top = 233
      Width = 830
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        4.40972222222222
        33.0729166666667
        513.732638888889
        1830.03472222222)
      Shape = qrsHorLine
    end
    object QRLabel61: TQRLabel
      Left = 23
      Top = 180
      Width = 162
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        50.7118055555556
        396.875
        357.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Saldo del Crédito'
      Color = clWhite
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
    object QRLabel62: TQRLabel
      Left = 23
      Top = 202
      Width = 132
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        50.7118055555556
        445.381944444444
        291.041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Monto Original del Crédito'
      Color = clWhite
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
    object QRLabel63: TQRLabel
      Left = 224
      Top = 202
      Width = 157
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        493.888888888889
        445.381944444444
        346.163194444444)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Financiamiento Acumulado'
      Color = clWhite
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
    object QRLabel65: TQRLabel
      Left = 443
      Top = 202
      Width = 156
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        976.753472222222
        445.381944444444
        343.958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Amortizaciones Acumuladas'
      Color = clWhite
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
    object QRLabel66: TQRLabel
      Left = 648
      Top = 202
      Width = 91
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1428.75
        445.381944444444
        200.642361111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Corte al'
      Color = clWhite
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
    object QRDBText68: TQRDBText
      Left = 225
      Top = 217
      Width = 157
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        496.09375
        478.454861111111
        346.163194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'SDO_FIN_ADIC_ACU'
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
    object QRDBText69: TQRDBText
      Left = 443
      Top = 217
      Width = 156
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        976.753472222222
        478.454861111111
        343.958333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IMP_AMORTIZA_ACU'
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
    object QRDBText70: TQRDBText
      Left = 23
      Top = 217
      Width = 132
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        50.7118055555556
        478.454861111111
        291.041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
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
    object QRLabel67: TQRLabel
      Left = 23
      Top = 241
      Width = 132
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        50.7118055555556
        531.371527777778
        291.041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Saldo Inicial del Periodo'
      Color = clWhite
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
    object QRDBText71: TQRDBText
      Left = 23
      Top = 255
      Width = 132
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        50.7118055555556
        562.239583333333
        291.041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'SDO_INSOLUTO_ACU'
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
    object QRDBText73: TQRDBText
      Left = 728
      Top = 217
      Width = 100
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1605.13888888889
        478.454861111111
        220.486111111111)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'SDO_CORTE_ACU'
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
    object QRLabel7: TQRLabel
      Left = 404
      Top = 202
      Width = 14
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        890.763888888889
        445.381944444444
        30.8680555555556)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '-'
      Color = clWhite
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
    object QRLabel8: TQRLabel
      Left = 622
      Top = 202
      Width = 19
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1371.42361111111
        445.381944444444
        41.8923611111111)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '='
      Color = clWhite
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
    object QRLabel10: TQRLabel
      Left = 186
      Top = 202
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        410.104166666667
        445.381944444444
        39.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '+'
      Color = clWhite
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
    object QRShape8: TQRShape
      Left = 547
      Top = 408
      Width = 304
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        48.5069444444444
        1206.05902777778
        899.583333333333
        670.277777777778)
      Shape = qrsRectangle
    end
    object QRLabel74: TQRLabel
      Left = 554
      Top = 412
      Width = 112
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1221.49305555556
        908.402777777778
        246.944444444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
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
      WordWrap = False
      FontSize = 6
    end
    object QRExpr2: TQRExpr
      Left = 678
      Top = 412
      Width = 156
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1494.89583333333
        908.402777777778
        343.958333333333)
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
      ResetAfterPrint = False
      Transparent = False
      WordWrap = False
      Expression = 
        'qyQuery.IMP_INTERES_CTE + qyQuery.IMP_CAPITAL_CTE + qyQuery.IMP_' +
        'COMIS_CTE + qyQuery.SDO_FIN_ADIC_CTE'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRDBText1: TQRDBText
      Left = 767
      Top = 202
      Width = 61
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1691.12847222222
        445.381944444444
        134.496527777778)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'F_CORTE'
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
    object QRLabel4: TQRLabel
      Left = 648
      Top = 241
      Width = 91
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1428.75
        531.371527777778
        200.642361111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Saldo al Corte'
      Color = clWhite
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
    object QRDBText2: TQRDBText
      Left = 767
      Top = 241
      Width = 61
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1691.12847222222
        531.371527777778
        134.496527777778)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'F_CORTE'
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
    object QRLabel5: TQRLabel
      Left = 186
      Top = 241
      Width = 18
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        410.104166666667
        531.371527777778
        39.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '+'
      Color = clWhite
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
    object QRLabel6: TQRLabel
      Left = 224
      Top = 241
      Width = 157
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        493.888888888889
        531.371527777778
        346.163194444444)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Financiamiento del Periodo'
      Color = clWhite
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
    object QRLabel12: TQRLabel
      Left = 404
      Top = 241
      Width = 14
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        890.763888888889
        531.371527777778
        30.8680555555556)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '-'
      Color = clWhite
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
    object QRLabel18: TQRLabel
      Left = 443
      Top = 241
      Width = 156
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        976.753472222222
        531.371527777778
        343.958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Amortizacione del Periodo'
      Color = clWhite
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
    object QRLabel24: TQRLabel
      Left = 622
      Top = 241
      Width = 19
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1371.42361111111
        531.371527777778
        41.8923611111111)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '='
      Color = clWhite
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
    object QRLabel25: TQRLabel
      Left = 647
      Top = 270
      Width = 71
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1426.54513888889
        595.3125
        156.545138888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Saldo Vencido'
      Color = clWhite
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
    object QRLabel26: TQRLabel
      Left = 615
      Top = 289
      Width = 128
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1355.98958333333
        637.204861111111
        282.222222222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Adeudo Total del Crédito'
      Color = clWhite
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
    object QRDBText3: TQRDBText
      Left = 728
      Top = 270
      Width = 100
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1605.13888888889
        595.3125
        220.486111111111)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'SDO_CORTE_VDO'
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
    object QRShape12: TQRShape
      Left = 15
      Top = 195
      Width = 830
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        4.40972222222222
        33.0729166666667
        429.947916666667
        1830.03472222222)
      Shape = qrsHorLine
    end
    object QRLabel27: TQRLabel
      Left = 758
      Top = 200
      Width = 6
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1671.28472222222
        440.972222222222
        13.2291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '('
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel28: TQRLabel
      Left = 832
      Top = 200
      Width = 6
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1834.44444444444
        440.972222222222
        13.2291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = ')'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel29: TQRLabel
      Left = 758
      Top = 237
      Width = 6
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1671.28472222222
        522.552083333333
        13.2291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '('
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel30: TQRLabel
      Left = 832
      Top = 237
      Width = 6
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1834.44444444444
        522.552083333333
        13.2291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = ')'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText7: TQRDBText
      Left = 226
      Top = 255
      Width = 156
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        498.298611111111
        562.239583333333
        343.958333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IMP_FIN_ADIC_PER'
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
    object QRExpr1: TQRExpr
      Left = 443
      Top = 256
      Width = 156
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        976.753472222222
        564.444444444444
        343.958333333333)
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
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'qyQuery.IMP_AMORT_CTE'
      Mask = '###,###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr3: TQRExpr
      Left = 749
      Top = 289
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1651.44097222222
        637.204861111111
        174.184027777778)
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
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'qyQuery.SDO_CORTE_ACU + qyQuery.SDO_CORTE_VDO'
      Mask = '###,###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRDBText4: TQRDBText
      Left = 664
      Top = 255
      Width = 164
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1464.02777777778
        562.239583333333
        361.597222222222)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IMP_CORTE'
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
    object QRLabel31: TQRLabel
      Left = 647
      Top = 217
      Width = 73
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1426.54513888889
        478.454861111111
        160.954861111111)
      Alignment = taLeftJustify
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
      WordWrap = False
      FontSize = 6
    end
    object QRLabel32: TQRLabel
      Left = 492
      Top = 77
      Width = 125
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1084.79166666667
        169.774305555556
        275.607638888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tasa Moratoria al Corte: '
      Color = clWhite
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
    object QRExpr4: TQRExpr
      Left = 656
      Top = 77
      Width = 179
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1446.38888888889
        169.774305555556
        394.670138888889)
      Alignment = taLeftJustify
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
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'qyQuery.TASA_CREDITO_CTE  *  qyQuery.FACT_MORAS'
      Mask = '###,###,##0.0000 %'
      FontSize = 6
    end
    object QRBIVA: TQRLabel
      Left = 340
      Top = 354
      Width = 86
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        749.652777777778
        780.520833333333
        189.618055555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '--'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRBIVAComis: TQRLabel
      Left = 347
      Top = 381
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        765.086805555556
        840.052083333333
        174.184027777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '--'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object qrshpCat: TQRShape
      Left = 15
      Top = 142
      Width = 831
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        70.5555555555556
        33.0729166666667
        313.090277777778
        1832.23958333333)
      Shape = qrsRectangle
    end
    object tqrmCat: TQRMemo
      Left = 23
      Top = 145
      Width = 754
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        61.7361111111111
        50.7118055555556
        319.704861111111
        1662.46527777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        
          '* Costo anual total de créditos denominados en moneda nacional a' +
          ' tasa variable para fines informativos y de comparación exclusiv' +
          'amente. Este CAT  solo es comparable con el CAT de créditos deno' +
          'minados en moneda nacional y cuya tasa de referencia corresponde' +
          ' a la misma fecha.')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object qrlblEtiCat: TQRLabel
      Left = 492
      Top = 118
      Width = 152
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1084.79166666667
        260.173611111111
        335.138888888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CAT *:'
      Color = clWhite
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
    object qrlblTasaCat: TQRLabel
      Left = 656
      Top = 118
      Width = 152
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1446.38888888889
        260.173611111111
        335.138888888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '00.0 % Sin IVA.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRLabel68: TQRLabel
      Left = 247
      Top = 316
      Width = 211
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        544.600694444444
        696.736111111111
        465.225694444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'RESUMEN DE VENCIMIENTOS DEL '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 8
    end
  end
  object QRGroupDETALLE_MOVTOS: TQRGroup
    Left = 58
    Top = 862
    Width = 864
    Height = 42
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupDETALLE_MOVTOSBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      92.6041666666667
      1905)
    Expression = 'qyQuery.IDGRUPO'
    FooterBand = FootTOTAL_DET_MOVTOS
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel11: TQRLabel
      Left = 247
      Top = 3
      Width = 205
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        544.600694444444
        6.61458333333333
        451.996527777778)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'DETALLE DE MOVIMIENTOS DEL '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 8
    end
    object QRLabel13: TQRLabel
      Left = 10
      Top = 23
      Width = 111
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        22.0486111111111
        50.7118055555556
        244.739583333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Refinanciamiento'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 7
    end
    object QRLabel14: TQRLabel
      Left = 138
      Top = 22
      Width = 80
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        304.270833333333
        48.5069444444444
        176.388888888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Referencia'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 7
    end
    object QRLabel15: TQRLabel
      Left = 326
      Top = 22
      Width = 132
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        718.784722222222
        48.5069444444444
        291.041666666667)
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
      WordWrap = False
      FontSize = 7
    end
    object QRLabel16: TQRLabel
      Left = 722
      Top = 22
      Width = 132
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1591.90972222222
        48.5069444444444
        291.041666666667)
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
      WordWrap = False
      FontSize = 7
    end
    object QRLabel17: TQRLabel
      Left = 228
      Top = 22
      Width = 80
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        502.708333333333
        48.5069444444444
        176.388888888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Periodo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 7
    end
    object QRLabel97: TQRLabel
      Left = 4
      Top = 10
      Width = 123
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        8.81944444444444
        22.0486111111111
        271.197916666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha Vencimiento /'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 7
    end
  end
  object QRGroupDETALLE_ADEUDO: TQRGroup
    Left = 58
    Top = 904
    Width = 864
    Height = 50
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupDETALLE_ADEUDOBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      110.243055555556
      1905)
    Expression = 'qyQuery.IDGRUPO'
    FooterBand = FootTOTAL_DET_ADEUDO
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel9: TQRLabel
      Left = 333
      Top = 8
      Width = 193
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        734.21875
        17.6388888888889
        425.538194444444)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'DETALLE DE ADEUDO VENCIDO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 8
    end
    object QRLabel20: TQRLabel
      Left = 138
      Top = 25
      Width = 80
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        304.270833333333
        55.1215277777778
        176.388888888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Referencia'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 7
    end
    object QRLabel21: TQRLabel
      Left = 326
      Top = 25
      Width = 132
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        718.784722222222
        55.1215277777778
        291.041666666667)
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
      WordWrap = False
      FontSize = 7
    end
    object QRLabel22: TQRLabel
      Left = 722
      Top = 25
      Width = 132
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1591.90972222222
        55.1215277777778
        291.041666666667)
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
      WordWrap = False
      FontSize = 7
    end
    object QRLabel23: TQRLabel
      Left = 228
      Top = 25
      Width = 80
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        502.708333333333
        55.1215277777778
        176.388888888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Periodo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 7
    end
    object QRLabel19: TQRLabel
      Left = 10
      Top = 24
      Width = 111
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        22.0486111111111
        52.9166666666667
        244.739583333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha Vencimiento'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 7
    end
  end
  object QRGroupDETALLE_PROGRAMADO: TQRGroup
    Left = 58
    Top = 954
    Width = 864
    Height = 50
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupDETALLE_PROGRAMADOBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      110.243055555556
      1905)
    Expression = 'qyQuery.IDGRUPO'
    FooterBand = FootTOTAL_DET_PROG
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel33: TQRLabel
      Left = 15
      Top = 30
      Width = 111
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        33.0729166666667
        66.1458333333333
        244.739583333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Refinanciamiento'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 7
    end
    object QRLabel34: TQRLabel
      Left = 146
      Top = 25
      Width = 80
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        321.909722222222
        55.1215277777778
        176.388888888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Referencia'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 7
    end
    object QRLabel35: TQRLabel
      Left = 236
      Top = 25
      Width = 80
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        520.347222222222
        55.1215277777778
        176.388888888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Periodo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 7
    end
    object QRLabel36: TQRLabel
      Left = 334
      Top = 25
      Width = 132
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        736.423611111111
        55.1215277777778
        291.041666666667)
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
      WordWrap = False
      FontSize = 7
    end
    object QRLabel37: TQRLabel
      Left = 730
      Top = 25
      Width = 132
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1609.54861111111
        55.1215277777778
        291.041666666667)
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
      WordWrap = False
      FontSize = 7
    end
    object QRLabel38: TQRLabel
      Left = 132
      Top = 8
      Width = 578
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        291.041666666667
        17.6388888888889
        1274.40972222222)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        'PROXIMOS VENCIMIENTOS (Si su crédito es a tasa variable los inte' +
        'reses son estimados)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 8
    end
    object QRLabel98: TQRLabel
      Left = 8
      Top = 18
      Width = 123
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        17.6388888888889
        39.6875
        271.197916666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha Vencimiento /'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 7
    end
  end
  object gpo_DETPROGRAMADOS: TQRGroup
    Left = 58
    Top = 1004
    Width = 864
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
      4.40972222222222
      1905)
    Expression = 'qyQuery.NCOUNT'
    Master = Owner
    ReprintOnNewPage = False
  end
  object chil_DET_PROG: TQRChildBand
    Left = 58
    Top = 1006
    Width = 864
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = chil_DET_PROGBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      28.6631944444444
      1905)
    ParentBand = gpo_DETPROGRAMADOS
    object QRDBText12: TQRDBText
      Left = 26
      Top = 0
      Width = 80
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        57.3263888888889
        0
        176.388888888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'F_VALOR'
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
      Left = 130
      Top = 0
      Width = 80
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        286.631944444444
        0
        176.388888888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'CVE_REFERENCIA'
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
    object QRDBText14: TQRDBText
      Left = 240
      Top = 0
      Width = 52
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        529.166666666667
        0
        114.652777777778)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'ID_PERIODO'
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
    object QRDBText19: TQRDBText
      Left = 326
      Top = 0
      Width = 387
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        718.784722222222
        0
        853.28125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'DESC_C_OPERACION'
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
      Left = 722
      Top = 0
      Width = 132
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1591.90972222222
        0
        291.041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IMP_NETO'
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
  end
  object GPO_TIT_REF: TQRGroup
    Left = 58
    Top = 1019
    Width = 864
    Height = 20
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = GPO_TIT_REFAfterPrint
    AlignToBottom = False
    BeforePrint = GPO_TIT_REFBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      44.0972222222222
      1905)
    Expression = 'qyQuery.IDGRUPO'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape2: TQRShape
      Left = 0
      Top = 1
      Width = 863
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
        1902.79513888889)
      Shape = qrsRectangle
    end
    object QRLabel43: TQRLabel
      Left = 74
      Top = 4
      Width = 36
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        163.159722222222
        8.81944444444444
        79.375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'BANCO'
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
    object QRLabel64: TQRLabel
      Left = 199
      Top = 4
      Width = 170
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        438.767361111111
        8.81944444444444
        374.826388888889)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CUENTA/CONVENIO CIE'
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
    object QRLabel69: TQRLabel
      Left = 494
      Top = 4
      Width = 42
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1089.20138888889
        8.81944444444444
        92.6041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TITULAR'
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
    object QRShape5: TQRShape
      Left = 179
      Top = 2
      Width = 18
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.4826388888889
        394.670138888889
        4.40972222222222
        39.6875)
      Shape = qrsVertLine
    end
    object QRShape16: TQRShape
      Left = 365
      Top = 2
      Width = 18
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.4826388888889
        804.774305555556
        4.40972222222222
        39.6875)
      Shape = qrsVertLine
    end
    object QRShape17: TQRShape
      Left = 650
      Top = 2
      Width = 18
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.4826388888889
        1433.15972222222
        4.40972222222222
        39.6875)
      Shape = qrsVertLine
    end
    object QRLabel75: TQRLabel
      Left = 717
      Top = 4
      Width = 96
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1580.88541666667
        8.81944444444444
        211.666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'NO. REFERENCIADO'
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
  object GPO_REF: TQRGroup
    Left = 58
    Top = 1039
    Width = 864
    Height = 15
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
      33.0729166666667
      1905)
    Expression = 'qyQuery.ID_BANCO'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText6: TQRDBText
      Left = 0
      Top = 2
      Width = 185
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        0
        4.40972222222222
        407.899305555556)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'BANCO'
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
    object QRDBText8: TQRDBText
      Left = 196
      Top = 2
      Width = 173
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        432.152777777778
        4.40972222222222
        381.440972222222)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'CONVENIOCUENTA'
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
    object QRDBText9: TQRDBText
      Left = 382
      Top = 2
      Width = 273
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        842.256944444444
        4.40972222222222
        601.927083333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'TITULAR'
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
    object QRShape18: TQRShape
      Left = 1
      Top = 10
      Width = 863
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2.20486111111111
        22.0486111111111
        1902.79513888889)
      Shape = qrsHorLine
    end
    object QRShape19: TQRShape
      Left = 651
      Top = 0
      Width = 17
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1435.36458333333
        0
        37.4826388888889)
      Shape = qrsVertLine
    end
    object QRShape20: TQRShape
      Left = 179
      Top = 0
      Width = 18
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        394.670138888889
        0
        39.6875)
      Shape = qrsVertLine
    end
    object QRShape21: TQRShape
      Left = 365
      Top = -2
      Width = 18
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        804.774305555556
        -4.40972222222222
        39.6875)
      Shape = qrsVertLine
    end
    object QRDBText10: TQRDBText
      Left = 671
      Top = 2
      Width = 179
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        1479.46180555556
        4.40972222222222
        394.670138888889)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'REFERENCIA'
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
    object QRShape23: TQRShape
      Left = 854
      Top = 0
      Width = 17
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        1882.95138888889
        0
        37.4826388888889)
      Shape = qrsVertLine
    end
    object QRShape22: TQRShape
      Left = -8
      Top = -1
      Width = 17
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        -17.6388888888889
        -2.20486111111111
        37.4826388888889)
      Shape = qrsVertLine
    end
  end
  object QRBand1: TQRBand
    Left = 58
    Top = 154
    Width = 864
    Height = 7
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
      15.4340277777778
      1905)
    BandType = rbTitle
  end
  object Memo2: TQRMemo
    Left = 325
    Top = 28
    Width = 52
    Height = 19
    Enabled = False
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      41.8923611111111
      716.579861111111
      61.7361111111111
      114.652777777778)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object Memo1: TQRMemo
    Left = 331
    Top = 6
    Width = 41
    Height = 19
    Enabled = False
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      41.8923611111111
      729.809027777778
      13.2291666666667
      90.3993055555556)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRBAux: TQRBand
    Left = 58
    Top = 58
    Width = 864
    Height = 96
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
      211.666666666667
      1905)
    BandType = rbPageHeader
  end
  object QrSum: TQRBand
    Left = 58
    Top = 1508
    Width = 864
    Height = 16
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QrSumBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      35.2777777777778
      1905)
    BandType = rbSummary
    object QRLabel41: TQRLabel
      Left = 127
      Top = 4
      Width = 138
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        280.017361111111
        8.81944444444444
        304.270833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL DE AUTORIZACIONES:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = False
      FontSize = 6
    end
    object QRLabel1: TQRLabel
      Left = 474
      Top = 4
      Width = 127
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1045.10416666667
        8.81944444444444
        280.017361111111)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL DE DISPOSICIONES:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = False
      FontSize = 6
    end
    object lbTotAutoriz: TQRLabel
      Left = 266
      Top = 4
      Width = 55
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        586.493055555556
        8.81944444444444
        121.267361111111)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'TOTAL AUTORIZACIONES'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = False
      FontSize = 6
    end
    object lbTotDispos: TQRLabel
      Left = 602
      Top = 4
      Width = 55
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.6631944444444
        1327.32638888889
        8.81944444444444
        121.267361111111)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'TOTAL AUTORIZACIONES'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = False
      FontSize = 6
    end
  end
  object qyQuery: TQuery
    DatabaseName = 'dbCORP'
    SQL.Strings = (
      '')
    Left = 192
    Top = 24
    object qyQueryID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyQueryID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qyQueryID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object qyQueryNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qyQueryCALLE_NUMERO: TStringField
      FieldName = 'CALLE_NUMERO'
      Size = 60
    end
    object qyQueryCOLONIA: TStringField
      FieldName = 'COLONIA'
      Size = 40
    end
    object qyQueryCVE_CIUDAD: TStringField
      FieldName = 'CVE_CIUDAD'
      Size = 6
    end
    object qyQueryCODIGO_POSTAL: TStringField
      FieldName = 'CODIGO_POSTAL'
      Size = 6
    end
    object qyQueryCVE_ESTADO: TStringField
      FieldName = 'CVE_ESTADO'
      Size = 6
    end
    object qyQueryCVE_PAIS: TStringField
      FieldName = 'CVE_PAIS'
      Size = 6
    end
    object qyQueryDELEGACION: TStringField
      FieldName = 'DELEGACION'
      Size = 40
    end
    object qyQueryESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 40
    end
    object qyQueryPAIS: TStringField
      FieldName = 'PAIS'
      Size = 40
    end
    object qyQueryCVE_RFC: TStringField
      FieldName = 'CVE_RFC'
      Size = 14
    end
    object qyQueryF_ALTA: TDateTimeField
      FieldName = 'F_ALTA'
    end
    object qyQueryTIPO_CREDITO: TStringField
      FieldName = 'TIPO_CREDITO'
      Size = 80
    end
    object qyQueryDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyQueryIMP_CREDITO: TFloatField
      FieldName = 'IMP_CREDITO'
    end
    object qyQueryDESC_TASA_INDIC: TStringField
      FieldName = 'DESC_TASA_INDIC'
      Size = 30
    end
    object qyQueryDESC_CALCULO: TStringField
      FieldName = 'DESC_CALCULO'
      Size = 80
    end
    object qyQueryDESC_AMORTIZA: TStringField
      FieldName = 'DESC_AMORTIZA'
      Size = 250
    end
    object qyQueryDESC_PAG_INTERES: TStringField
      FieldName = 'DESC_PAG_INTERES'
      Size = 250
    end
    object qyQueryF_INICIO: TDateTimeField
      FieldName = 'F_INICIO'
    end
    object qyQueryF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qyQueryF_CORTE: TDateTimeField
      FieldName = 'F_CORTE'
    end
    object qyQueryFOLIO_CORTE: TFloatField
      FieldName = 'FOLIO_CORTE'
    end
    object qyQueryTASA_CREDITO_CTE: TFloatField
      FieldName = 'TASA_CREDITO_CTE'
    end
    object qyQueryCAP_PAG: TStringField
      FieldName = 'CAP_PAG'
      Size = 111
    end
    object qyQueryINT_PAG: TStringField
      FieldName = 'INT_PAG'
      Size = 111
    end
    object qyQuerySDO_INSOLUTO_ACU: TFloatField
      FieldName = 'SDO_INSOLUTO_ACU'
    end
    object qyQuerySDO_FIN_ADIC_ACU: TFloatField
      FieldName = 'SDO_FIN_ADIC_ACU'
    end
    object qyQueryIMP_AMORTIZA_ACU: TFloatField
      FieldName = 'IMP_AMORTIZA_ACU'
    end
    object qyQueryIMP_CORTE: TFloatField
      FieldName = 'IMP_CORTE'
    end
    object qyQuerySDO_CORTE_ACU: TFloatField
      FieldName = 'SDO_CORTE_ACU'
    end
    object qyQuerySDO_CORTE_VDO: TFloatField
      FieldName = 'SDO_CORTE_VDO'
    end
    object qyQueryIMP_INTERES_CTE: TFloatField
      FieldName = 'IMP_INTERES_CTE'
    end
    object qyQueryIMP_CAPITAL_CTE: TFloatField
      FieldName = 'IMP_CAPITAL_CTE'
    end
    object qyQueryIMP_COMIS_CTE: TFloatField
      FieldName = 'IMP_COMIS_CTE'
    end
    object qyQuerySDO_FIN_ADIC_CTE: TFloatField
      FieldName = 'SDO_FIN_ADIC_CTE'
    end
    object qyQueryIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qyQueryF_VALOR: TDateTimeField
      FieldName = 'F_VALOR'
    end
    object qyQueryID_PERIODO: TFloatField
      FieldName = 'ID_PERIODO'
    end
    object qyQueryDESC_C_OPERACION: TStringField
      FieldName = 'DESC_C_OPERACION'
      Size = 6
    end
    object qyQueryIMP_NETO: TFloatField
      FieldName = 'IMP_NETO'
    end
    object qyQuerySUMA: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SUMA'
      Calculated = True
    end
    object qyQueryCTO_DEP: TMemoField
      FieldName = 'CTO_DEP'
      BlobType = ftMemo
    end
    object qyQueryCVE_REFERENCIA: TStringField
      FieldName = 'CVE_REFERENCIA'
    end
    object qyQuerySDO_CORTE: TFloatField
      FieldName = 'SDO_CORTE'
    end
    object qyQueryIMP_AMORT_CTE: TFloatField
      FieldName = 'IMP_AMORT_CTE'
    end
    object qyQueryIMP_FIN_ADIC_PER: TFloatField
      FieldName = 'IMP_FIN_ADIC_PER'
    end
    object qyQueryFACT_MORAS: TFloatField
      FieldName = 'FACT_MORAS'
    end
    object qyQueryGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 1
    end
    object qyQueryTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 80
    end
    object qyQueryBANCO: TStringField
      FieldName = 'BANCO'
      Size = 80
    end
    object qyQueryCONVENIOCUENTA: TStringField
      FieldName = 'CONVENIOCUENTA'
      Size = 30
    end
    object qyQuerySUCURSAL: TStringField
      FieldName = 'SUCURSAL'
      Size = 80
    end
    object qyQueryID_BANCO: TFloatField
      FieldName = 'ID_BANCO'
    end
    object qyQueryREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object qyQueryNCOUNT: TFloatField
      FieldName = 'NCOUNT'
    end
  end
  object spCadena: TStoredProc
    DatabaseName = 'DBDcorp'
    SessionName = 'Default'
    StoredProcName = 'PKGCAPTACIONCFDI.STP_SELLADOFE_CRE1'
    Left = 24
    Top = 260
  end
  object qrCadena: TQuery
    DatabaseName = 'dbCORP'
    Left = 24
    Top = 30
  end
  object InterDigDoc1: TInterDigDoc
    Support = 'star@mail.internet.com.mx'
    HostName = 'localhost'
    UserName = 'guest'
    Password = 'anonymous@mail.com.net'
    Viewfile = False
    SendTo = '/'
    DelAfterSend = False
    PgOrientation = ort_portrait
    CompFileExt = zip
    Left = 24
    Top = 291
  end
  object NMFTP1: TNMFTP
    Port = 21
    ReportLevel = 0
    Vendor = 2411
    ParseList = False
    ProxyPort = 0
    Passive = False
    FirewallType = FTUser
    FWAuthenticate = False
    Left = 132
    Top = 274
  end
  object NMSMTP1: TNMSMTP
    Host = '132.1.4.130'
    Port = 25
    ReportLevel = 0
    EncodeType = uuMime
    ClearParams = True
    SubType = mtPlain
    Charset = 'us-ascii'
    Left = 24
    Top = 170
  end
end
