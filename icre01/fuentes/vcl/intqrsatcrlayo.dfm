object QRSatCreIntDev: TQRSatCreIntDev
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  AfterPrint = QuickRepAfterPrint
  DataSet = Query
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
  object QRDetalle: TQRBand
    Left = 38
    Top = 94
    Width = 740
    Height = 896
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRDetalleBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = True
    Size.Values = (
      2370.66666666667
      1957.91666666667)
    BandType = rbDetail
    object QRMemCOPIA: TQRMemo
      Left = -140
      Top = 213
      Width = 296
      Height = 485
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1283.22916666667
        587.375
        563.5625
        783.166666666667)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = True
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInactiveBorder
      Font.Height = -80
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        '           A'
        '         I'
        '      P'
        '   O'
        'C')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 60
    end
    object QRMemo1: TQRMemo
      Left = 6
      Top = 424
      Width = 490
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        15.875
        1121.83333333333
        1296.45833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        
          'A. SALDO INSOLUTO DEL CRÉDITO AL 31 DE DICIEMBRE DEL 2002, O A L' +
          'A FECHA'
        '    DE FIRMA SI ESTA SE LLEVO A CABO EN EL EJERCICIO DEL 2003')
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel7: TQRLabel
      Left = -76
      Top = 402
      Width = 167
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        756.708333333333
        1063.625
        441.854166666667)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'IMPUESTO SOBRE LA RENTA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 9
    end
    object QRLabel1: TQRLabel
      Left = 4
      Top = 170
      Width = 83
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        10.5833333333333
        449.791666666667
        219.604166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Ejercicio fiscal:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBText2: TQRDBText
      Left = 94
      Top = 170
      Width = 75
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        248.708333333333
        449.791666666667
        198.4375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = Query
      DataField = 'EJERCICIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel2: TQRLabel
      Left = 165
      Top = 198
      Width = 410
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        436.5625
        523.875
        1084.79166666667)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'DATOS DEL CONTRIBUYENTE A QUIEN SE LE EXPIDE LA CONSTANCIA .'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 9
    end
    object QRShape2: TQRShape
      Left = 0
      Top = 248
      Width = 730
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        0
        656.166666666667
        1931.45833333333)
      Shape = qrsHorLine
    end
    object QRLabel3: TQRLabel
      Left = 6
      Top = 250
      Width = 211
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        15.875
        661.458333333333
        558.270833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'REGISTRO FEDERAL DE CONTRIBUYENTES'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape3: TQRShape
      Left = 0
      Top = 268
      Width = 730
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        0
        709.083333333333
        1931.45833333333)
      Shape = qrsHorLine
    end
    object QRLabel4: TQRLabel
      Left = 6
      Top = 270
      Width = 51
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        15.875
        714.375
        134.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'DOMICILIO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape4: TQRShape
      Left = 0
      Top = 313
      Width = 730
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        0
        828.145833333333
        1931.45833333333)
      Shape = qrsHorLine
    end
    object QRLabel5: TQRLabel
      Left = 6
      Top = 315
      Width = 160
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        15.875
        833.4375
        423.333333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CRÉDITO HIPOTECARIO NÚMERO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel6: TQRLabel
      Left = 6
      Top = 332
      Width = 193
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        15.875
        878.416666666667
        510.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'DOMICILIO DEL INMUEBLE HIPOTECADO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape5: TQRShape
      Left = 0
      Top = 331
      Width = 730
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        0
        875.770833333333
        1931.45833333333)
      Shape = qrsHorLine
    end
    object QRShape6: TQRShape
      Left = 250
      Top = 213
      Width = 3
      Height = 164
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        433.916666666667
        661.458333333333
        563.5625
        7.9375)
      Shape = qrsVertLine
    end
    object QRShape8: TQRShape
      Left = 1
      Top = 421
      Width = 730
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        2.64583333333333
        1113.89583333333
        1931.45833333333)
      Shape = qrsHorLine
    end
    object QRShape9: TQRShape
      Left = 1
      Top = 453
      Width = 730
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        2.64583333333333
        1198.5625
        1931.45833333333)
      Shape = qrsHorLine
    end
    object QRShape10: TQRShape
      Left = 498
      Top = 421
      Width = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        171.979166666667
        1317.625
        1113.89583333333
        7.9375)
      Shape = qrsVertLine
    end
    object QRMemo3: TQRMemo
      Left = 6
      Top = 456
      Width = 490
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        15.875
        1206.5
        1296.45833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        'B. PORCION DEL CRÉDITO APLICABLE SOBRE LOS INTERESES '
        '    REALES DEVENGADOS Y PAGADOS')
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape12: TQRShape
      Left = 498
      Top = 500
      Width = 1
      Height = 55
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        145.520833333333
        1317.625
        1322.91666666667
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRMemo4: TQRMemo
      Left = 6
      Top = 503
      Width = 298
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        15.875
        1330.85416666667
        788.458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        '1) MONTO TOTAL DE INTERESES NOMINALES DEVENGADOS')
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape13: TQRShape
      Left = 0
      Top = 518
      Width = 730
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        0
        1370.54166666667
        1931.45833333333)
      Shape = qrsHorLine
    end
    object QRMemo5: TQRMemo
      Left = 6
      Top = 520
      Width = 364
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        15.875
        1375.83333333333
        963.083333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        '2) MONTO TOTAL DE INTERESES NOMINALES DEVENGADOS Y PAGADOS')
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape14: TQRShape
      Left = 1
      Top = 536
      Width = 730
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        2.64583333333333
        1418.16666666667
        1931.45833333333)
      Shape = qrsHorLine
    end
    object QRMemo6: TQRMemo
      Left = 6
      Top = 538
      Width = 345
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        15.875
        1423.45833333333
        912.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        '3) MONTO TOTAL DE INTERESES REALES DEVENGADOS Y PAGADOS')
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel8: TQRLabel
      Left = -71
      Top = 636
      Width = 158
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        769.9375
        1682.75
        418.041666666667)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'DATOS DEL RETENEDOR'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRShape16: TQRShape
      Left = 1
      Top = 676
      Width = 730
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        2.64583333333333
        1788.58333333333
        1931.45833333333)
      Shape = qrsHorLine
    end
    object QRLabel9: TQRLabel
      Left = 6
      Top = 660
      Width = 211
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        15.875
        1746.25
        558.270833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'REGISTRO FEDERAL DE CONTRIBUYENTES'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel10: TQRLabel
      Left = 6
      Top = 679
      Width = 219
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        15.875
        1796.52083333333
        579.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'NOMBRE, DENOMINACIÓN O RAZÓN SOCIAL'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape17: TQRShape
      Left = 1
      Top = 696
      Width = 730
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        2.64583333333333
        1841.5
        1931.45833333333)
      Shape = qrsHorLine
    end
    object QRLabel11: TQRLabel
      Left = 6
      Top = 699
      Width = 90
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        15.875
        1849.4375
        238.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'DOMICILIO FISCAL'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape18: TQRShape
      Left = 250
      Top = 657
      Width = 3
      Height = 60
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        158.75
        661.458333333333
        1738.3125
        7.9375)
      Shape = qrsVertLine
    end
    object QRLabel12: TQRLabel
      Left = 251
      Top = 731
      Width = 237
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        664.104166666667
        1934.10416666667
        627.0625)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'DATOS DEL REPRESENTANTE LEGAL'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRShape20: TQRShape
      Left = 1
      Top = 772
      Width = 566
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        2.64583333333333
        2042.58333333333
        1497.54166666667)
      Shape = qrsHorLine
    end
    object QRLabel13: TQRLabel
      Left = 6
      Top = 755
      Width = 229
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        15.875
        1997.60416666667
        605.895833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'APELLIDO PATERNO, MATERNO Y NOMBRE(S)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel14: TQRLabel
      Left = 6
      Top = 775
      Width = 211
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        15.875
        2050.52083333333
        558.270833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'REGISTRO FEDERAL DE CONTRIBUYENTES'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape21: TQRShape
      Left = 1
      Top = 792
      Width = 566
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        2.64583333333333
        2095.5
        1497.54166666667)
      Shape = qrsHorLine
    end
    object QRLabel15: TQRLabel
      Left = 6
      Top = 796
      Width = 218
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        15.875
        2106.08333333333
        576.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CLAVE ÚNICA DE REGISTRO DE POBLACIÓN'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape22: TQRShape
      Left = 250
      Top = 753
      Width = 3
      Height = 60
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        158.75
        661.458333333333
        1992.3125
        7.9375)
      Shape = qrsVertLine
    end
    object QRLabel16: TQRLabel
      Left = 3
      Top = 835
      Width = 597
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        7.9375
        2209.27083333333
        1579.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        'Esta constancia se emite con apego al artículo 176 fracción IV d' +
        'e la Ley del Impuesto Sobre la Renta vigente.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 9
    end
    object QRDBText1: TQRDBText
      Left = 257
      Top = 217
      Width = 460
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        679.979166666667
        574.145833333333
        1217.08333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = Query
      DataField = 'NOMBRE_TIT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText3: TQRDBText
      Left = 256
      Top = 250
      Width = 54
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        677.333333333333
        661.458333333333
        142.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'RFC_CURP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText4: TQRDBText
      Left = 257
      Top = 270
      Width = 460
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        105.833333333333
        679.979166666667
        714.375
        1217.08333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = Query
      DataField = 'DOMICILIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText5: TQRDBText
      Left = 256
      Top = 315
      Width = 59
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        677.333333333333
        833.4375
        156.104166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'ID_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText6: TQRDBText
      Left = 257
      Top = 334
      Width = 460
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        105.833333333333
        679.979166666667
        883.708333333333
        1217.08333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = Query
      DataField = 'DOMICILIO_INMU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText7: TQRDBText
      Left = 510
      Top = 424
      Width = 150
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1349.375
        1121.83333333333
        396.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'SALDO_INICIAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,###,##0'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText8: TQRDBText
      Left = 510
      Top = 456
      Width = 150
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1349.375
        1206.5
        396.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'PROP_DEDUCIBLE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,###,##0'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText9: TQRDBText
      Left = 510
      Top = 502
      Width = 150
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1349.375
        1328.20833333333
        396.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'IMP_INT_NOM_DEV'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,###,##0'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText10: TQRDBText
      Left = 510
      Top = 520
      Width = 150
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1349.375
        1375.83333333333
        396.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'IMP_INT_PAGADOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,###,##0'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText11: TQRDBText
      Left = 510
      Top = 538
      Width = 150
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1349.375
        1423.45833333333
        396.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'IMP_INT_REAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,###,##0'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText12: TQRDBText
      Left = 265
      Top = 660
      Width = 60
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        701.145833333333
        1746.25
        158.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'RFC_EMPRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText14: TQRDBText
      Left = 265
      Top = 699
      Width = 63
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        701.145833333333
        1849.4375
        166.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'DOM_EMPRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText15: TQRDBText
      Left = 265
      Top = 755
      Width = 86
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        701.145833333333
        1997.60416666667
        227.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'REPRESENTANTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText16: TQRDBText
      Left = 265
      Top = 775
      Width = 46
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        701.145833333333
        2050.52083333333
        121.708333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'RFC_REP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape23: TQRShape
      Left = 0
      Top = 500
      Width = 730
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        0
        1322.91666666667
        1931.45833333333)
      Shape = qrsHorLine
    end
    object QRShape11: TQRShape
      Left = 0
      Top = 555
      Width = 730
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        0
        1468.4375
        1931.45833333333)
      Shape = qrsHorLine
    end
    object QRShape24: TQRShape
      Left = 730
      Top = 500
      Width = 1
      Height = 55
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        145.520833333333
        1931.45833333333
        1322.91666666667
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRShape7: TQRShape
      Left = 0
      Top = 485
      Width = 730
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        0
        1283.22916666667
        1931.45833333333)
      Shape = qrsHorLine
    end
    object QRShape26: TQRShape
      Left = 730
      Top = 419
      Width = 3
      Height = 69
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        182.5625
        1931.45833333333
        1108.60416666667
        7.9375)
      Shape = qrsVertLine
    end
    object QRShape27: TQRShape
      Left = 0
      Top = 419
      Width = 3
      Height = 69
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        182.5625
        0
        1108.60416666667
        7.9375)
      Shape = qrsVertLine
    end
    object QRShape28: TQRShape
      Left = 0
      Top = 214
      Width = 730
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        0
        566.208333333333
        1931.45833333333)
      Shape = qrsHorLine
    end
    object QRShape1: TQRShape
      Left = -1
      Top = 376
      Width = 730
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        -2.64583333333333
        994.833333333333
        1931.45833333333)
      Shape = qrsHorLine
    end
    object QRShape29: TQRShape
      Left = 0
      Top = 213
      Width = 3
      Height = 164
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        433.916666666667
        0
        563.5625
        7.9375)
      Shape = qrsVertLine
    end
    object QRShape30: TQRShape
      Left = 728
      Top = 213
      Width = 3
      Height = 164
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        433.916666666667
        1926.16666666667
        563.5625
        7.9375)
      Shape = qrsVertLine
    end
    object QRMemo7: TQRMemo
      Left = 6
      Top = 217
      Width = 243
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        15.875
        574.145833333333
        642.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        'APELLIDO PATERNO, MATERNO Y NOMBRE (S)'
        'DENOMINACIÓN O RAZÓN SOCIAL')
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRMemo8: TQRMemo
      Left = 2
      Top = 569
      Width = 730
      Height = 61
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        161.395833333333
        5.29166666666667
        1505.47916666667
        1931.45833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        
          'Nota: La variación  entre  el  monto  de los intereses  nominale' +
          's  devengados  y  pagados(2),  y  el  monto  de  los  intereses ' +
          'reales '
        
          'devengados  y  pagados(3),  corresponden  al ajuste  por inflaci' +
          'ón del período por el cual se pagaron los intereses.'
        
          'Sobre  el  inciso 3)  se  aplicó el  porcentaje  indicado  en el' +
          '  inciso  B  porción  del  crédito  sobre  los intereses reales ' +
          'devengados '
        'y pagados.')
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 9
    end
    object QRShape31: TQRShape
      Left = 1
      Top = 658
      Width = 730
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        2.64583333333333
        1740.95833333333
        1931.45833333333)
      Shape = qrsHorLine
    end
    object QRShape15: TQRShape
      Left = 1
      Top = 716
      Width = 730
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        2.64583333333333
        1894.41666666667
        1931.45833333333)
      Shape = qrsHorLine
    end
    object QRShape32: TQRShape
      Left = 0
      Top = 657
      Width = 3
      Height = 60
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        158.75
        0
        1738.3125
        7.9375)
      Shape = qrsVertLine
    end
    object QRShape33: TQRShape
      Left = 730
      Top = 657
      Width = 3
      Height = 60
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        158.75
        1931.45833333333
        1738.3125
        7.9375)
      Shape = qrsVertLine
    end
    object QRShape19: TQRShape
      Left = 1
      Top = 753
      Width = 566
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        2.64583333333333
        1992.3125
        1497.54166666667)
      Shape = qrsHorLine
    end
    object QRShape34: TQRShape
      Left = 1
      Top = 813
      Width = 566
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        2.64583333333333
        2151.0625
        1497.54166666667)
      Shape = qrsHorLine
    end
    object QRShape35: TQRShape
      Left = 0
      Top = 753
      Width = 3
      Height = 60
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        158.75
        0
        1992.3125
        7.9375)
      Shape = qrsVertLine
    end
    object QRShape36: TQRShape
      Left = 566
      Top = 753
      Width = 3
      Height = 60
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        158.75
        1497.54166666667
        1992.3125
        7.9375)
      Shape = qrsVertLine
    end
    object QRMemo10: TQRMemo
      Left = 2
      Top = 857
      Width = 730
      Height = 41
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        108.479166666667
        5.29166666666667
        2267.47916666667
        1931.45833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        
          'Los datos contenidos en esta constancia serán cotejados con la i' +
          'nformación que obra en poder de la Autoridad'
        
          'Fiscal, cuando se utilice como deducción personal en la declarac' +
          'ión anual de las personas físicas.')
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 11
    end
    object QRShape37: TQRShape
      Left = 0
      Top = 500
      Width = 1
      Height = 55
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        145.520833333333
        0
        1322.91666666667
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRShape25: TQRShape
      Left = 586
      Top = 793
      Width = 133
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        1550.45833333333
        2098.14583333333
        351.895833333333)
      Shape = qrsHorLine
    end
    object QRLabel17: TQRLabel
      Left = 586
      Top = 795
      Width = 132
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1550.45833333333
        2103.4375
        349.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Firma'
      Color = clWhite
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
    object qrlblNOM_RETENEDOR: TQRLabel
      Left = 266
      Top = 679
      Width = 110
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        703.791666666667
        1796.52083333333
        291.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlblNOM_RETENEDOR'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRMemo2: TQRMemo
      Left = 3
      Top = 92
      Width = 725
      Height = 65
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        171.979166666667
        7.9375
        243.416666666667
        1918.22916666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        
          'Para   dar  cumplimiento   a las disposiciones   fiscales vigent' +
          'es para el ejercicio 2003, referente a la expedición de constanc' +
          'ias por '
        
          'parte de  las instituciones de  crédito  que  otorguen  a las pe' +
          'rsonas  físicas residentes en el país créditos  hipotecarios  de' +
          'stinados'
        
          'para  la adquisición,  ampliación  y  remodelación de casa habit' +
          'ación, se expide la  presente  constancia  de  intereses nominal' +
          'es y '
        'reales devengados y pagados por el ejercicio que se indica.')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo9: TQRMemo
      Left = 3
      Top = 31
      Width = 734
      Height = 48
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        127
        7.9375
        82.0208333333333
        1942.04166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Lines.Strings = (
        'CONSTANCIA DE INTERESES REALES DEVENGADOS Y'
        'PAGADOS EN CRÉDITOS HIPOTECARIOS.')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
  end
  object QRBandColumnHeader: TQRBand
    Left = 38
    Top = 38
    Width = 740
    Height = 56
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
      148.166666666667
      1957.91666666667)
    BandType = rbColumnHeader
  end
  object Query: TQuery
    SQL.Strings = (
      'SELECT SCL.*, '
      
        '       (SCL.IMP_INT_PAG_ORD  + SCL.IMP_INT_MOR_PAG)  AS IMP_INT_' +
        'PAGADOS,'
      
        '       GREATEST( SCL.SDO_CIE_ANIO_ANT, SCL.SDO_FEC_CONTR ) SALDO' +
        '_INICIAL,'
      '       NOMEMP.NOMBRE EMPRESA,'
      
        '       --RFCEMP.SIGLAS_RFC   || '#39'-'#39' || RFCEMP.F_RFC   || '#39'-'#39' || ' +
        'RFCEMP.HOMOCLAVE_RFC  RFC_EMPRE,'
      
        '       RFCEMP.SIGLAS_RFC   || RFCEMP.F_RFC   || RFCEMP.HOMOCLAVE' +
        '_RFC  RFC_EMPRE,'
      
        '       DOMEMP.CALLE_NUMERO || '#39' '#39' || DOMEMP.COLONIA || '#39' '#39' ||  D' +
        'OMEMP.CODIGO_POSTAL DOM_EMPRE,'
      '       DECODE( P.CVE_PER_JURIDICA , '#39'PF'#39',      '
      
        '                 NOMREPF.APELLIDO_PATERNO || '#39' '#39' || NOMREPF.APEL' +
        'LIDO_MATERNO || '#39' '#39' || NOMREPF.NOMBRE_PERSONA,'
      '                 NOMREPM.NOM_RAZON_SOCIAL ) AS REPRESENTANTE,'
      
        '       RFCREP.SIGLAS_RFC   || RFCREP.F_RFC   || RFCREP.HOMOCLAVE' +
        '_RFC  RFC_REP'
      
        '       --RFCREP.SIGLAS_RFC   || '#39'-'#39' || RFCREP.F_RFC   || '#39'-'#39' || ' +
        'RFCREP.HOMOCLAVE_RFC  RFC_REP'
      'FROM   SAT_CRE_LAYOUT SCL,'
      '       EMPRESA   EMPRE,'
      '       PERSONA   NOMEMP,'
      '       DOMICILIO DOMEMP,'
      '       RFC       RFCEMP,'
      '       PERSONA   P,'
      '       PERSONA_FISICA NOMREPF,'
      '       PERSONA_MORAL  NOMREPM,'
      '       RFC       RFCREP'
      'WHERE  SCL.ID_EMPRESA = :ID_EMPRESA'
      '  AND  SCL.EJERCICIO  = :EJERCICIO'
      '  AND  EMPRE.ID_EMPRESA    = SCL.ID_EMPRESA'
      '  AND  NOMEMP.ID_PERSONA   = EMPRE.ID_EMPRESA'
      '  AND  DOMEMP.ID_DOMICILIO = NOMEMP.ID_DOMICILIO'
      '  AND  RFCEMP.ID_PERSONA   = NOMEMP.ID_PERSONA'
      '  AND  P.ID_PERSONA   = :ID_REPRESENTANTE'
      '  AND  RFCREP.ID_PERSONA   = P.ID_PERSONA'
      '  AND  NOMREPF.ID_PERSONA (+)= P.ID_PERSONA'
      '  AND  NOMREPM.ID_PERSONA (+)= P.ID_PERSONA'
      '')
    Left = 4
    Top = 5
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EJERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_REPRESENTANTE'
        ParamType = ptUnknown
      end>
    object QueryID_EMPRESA: TFloatField
      FieldName = 'ID_EMPRESA'
    end
    object QueryEJERCICIO: TFloatField
      FieldName = 'EJERCICIO'
    end
    object QueryID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object QueryID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object QuerySDO_PROMEDIO: TFloatField
      FieldName = 'SDO_PROMEDIO'
    end
    object QueryTIPO_REGISTRO: TFloatField
      FieldName = 'TIPO_REGISTRO'
    end
    object QueryCONSECUTIVO: TFloatField
      FieldName = 'CONSECUTIVO'
    end
    object QueryCVE_IDENTIFICADOR: TFloatField
      FieldName = 'CVE_IDENTIFICADOR'
    end
    object QueryRFC_CURP: TStringField
      FieldName = 'RFC_CURP'
      Size = 18
    end
    object QueryNOMBRE_TIT: TStringField
      FieldName = 'NOMBRE_TIT'
      Size = 150
    end
    object QueryDOMICILIO: TStringField
      FieldName = 'DOMICILIO'
      Size = 160
    end
    object QueryNUM_REFERENCIA: TStringField
      FieldName = 'NUM_REFERENCIA'
      Size = 40
    end
    object QueryNUM_REG_FIDE: TStringField
      FieldName = 'NUM_REG_FIDE'
      Size = 40
    end
    object QueryCVE_DEST_CREDITO: TFloatField
      FieldName = 'CVE_DEST_CREDITO'
    end
    object QueryIMP_INT_NOM_DEV: TFloatField
      FieldName = 'IMP_INT_NOM_DEV'
    end
    object QueryIMP_INT_PAG_ORD: TFloatField
      FieldName = 'IMP_INT_PAG_ORD'
    end
    object QueryIMP_INT_MOR_DEV: TFloatField
      FieldName = 'IMP_INT_MOR_DEV'
    end
    object QueryIMP_INT_MOR_PAG: TFloatField
      FieldName = 'IMP_INT_MOR_PAG'
    end
    object QueryIMP_INT_REAL: TFloatField
      FieldName = 'IMP_INT_REAL'
    end
    object QuerySDO_CIE_ANIO_ANT: TFloatField
      FieldName = 'SDO_CIE_ANIO_ANT'
    end
    object QuerySDO_FEC_CONTR: TFloatField
      FieldName = 'SDO_FEC_CONTR'
    end
    object QueryF_CONTRATACION: TFloatField
      FieldName = 'F_CONTRATACION'
    end
    object QueryPROP_DEDUCIBLE: TFloatField
      FieldName = 'PROP_DEDUCIBLE'
    end
    object QueryPCT_COP_SOC_CONY: TFloatField
      FieldName = 'PCT_COP_SOC_CONY'
    end
    object QueryNUM_COPROPIET: TFloatField
      FieldName = 'NUM_COPROPIET'
    end
    object QueryRFC_CURP_COPRO: TStringField
      FieldName = 'RFC_CURP_COPRO'
      Size = 18
    end
    object QueryNOMBRE_COPRO: TStringField
      FieldName = 'NOMBRE_COPRO'
      Size = 150
    end
    object QueryRFC_CURP_CONYU: TStringField
      FieldName = 'RFC_CURP_CONYU'
      Size = 18
    end
    object QueryNOMBRE_CONYU: TStringField
      FieldName = 'NOMBRE_CONYU'
      Size = 150
    end
    object QueryDOMICILIO_INMU: TStringField
      FieldName = 'DOMICILIO_INMU'
      Size = 160
    end
    object QuerySALDO_INICIAL: TFloatField
      FieldName = 'SALDO_INICIAL'
    end
    object QueryEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 80
    end
    object QueryRFC_EMPRE: TStringField
      FieldName = 'RFC_EMPRE'
      Size = 16
    end
    object QueryDOM_EMPRE: TStringField
      FieldName = 'DOM_EMPRE'
      Size = 108
    end
    object QueryREPRESENTANTE: TStringField
      FieldName = 'REPRESENTANTE'
      Size = 80
    end
    object QueryRFC_REP: TStringField
      FieldName = 'RFC_REP'
      Size = 16
    end
    object QueryIMP_INT_PAGADOS: TFloatField
      FieldName = 'IMP_INT_PAGADOS'
    end
    object QueryPCT_PARTICIPACION: TFloatField
      FieldName = 'PCT_PARTICIPACION'
    end
    object QueryF_IMPRESION: TDateField
      FieldName = 'F_IMPRESION'
    end
    object QueryNUM_IMPRESION: TFloatField
      FieldName = 'NUM_IMPRESION'
    end
    object QueryF_AUT_OPERACION: TDateTimeField
      FieldName = 'F_AUT_OPERACION'
    end
    object QueryF_LIQ_BNC: TDateTimeField
      FieldName = 'F_LIQ_BNC'
    end
    object QueryMES_F_AUT_OPE: TFloatField
      FieldName = 'MES_F_AUT_OPE'
    end
    object QueryMES_F_LIQ_BNC: TFloatField
      FieldName = 'MES_F_LIQ_BNC'
    end
    object QueryF_INI_EJER: TDateTimeField
      FieldName = 'F_INI_EJER'
    end
    object QueryF_FIN_EJER: TDateTimeField
      FieldName = 'F_FIN_EJER'
    end
  end
end
