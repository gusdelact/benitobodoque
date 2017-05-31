object QrCrCalCali: TQrCrCalCali
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qyRecCalif
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
  object QRBandTitulos: TQRBand
    Left = 48
    Top = 130
    Width = 720
    Height = 80
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
    BandType = rbTitle
    object QRS3: TQRShape
      Left = 152
      Top = 7
      Width = 373
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.1458333333333
        402.166666666667
        18.5208333333333
        986.895833333333)
      Shape = qrsRectangle
    end
    object QRS1: TQRShape
      Left = 40
      Top = 7
      Width = 113
      Height = 62
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        164.041666666667
        105.833333333333
        18.5208333333333
        298.979166666667)
      Shape = qrsRectangle
    end
    object QRS4: TQRShape
      Left = 523
      Top = 7
      Width = 149
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.1458333333333
        1383.77083333333
        18.5208333333333
        394.229166666667)
      Shape = qrsRectangle
    end
    object QRS2: TQRShape
      Left = 152
      Top = 31
      Width = 75
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        101.423611111111
        401.284722222222
        81.5798611111111
        198.4375)
      Shape = qrsRectangle
    end
    object QRS5: TQRShape
      Left = 226
      Top = 31
      Width = 75
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        101.423611111111
        597.517361111111
        81.5798611111111
        198.4375)
      Shape = qrsRectangle
    end
    object QRS6: TQRShape
      Left = 300
      Top = 31
      Width = 76
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        793.75
        82.0208333333333
        201.083333333333)
      Shape = qrsRectangle
    end
    object QRS8: TQRShape
      Left = 449
      Top = 31
      Width = 75
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1187.97916666667
        82.0208333333333
        198.4375)
      Shape = qrsRectangle
    end
    object QRS9: TQRShape
      Left = 523
      Top = 31
      Width = 75
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1383.77083333333
        82.0208333333333
        198.4375)
      Shape = qrsRectangle
    end
    object QRS10: TQRShape
      Left = 597
      Top = 31
      Width = 75
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1579.5625
        82.0208333333333
        198.4375)
      Shape = qrsRectangle
    end
    object QRS7: TQRShape
      Left = 375
      Top = 31
      Width = 75
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        992.1875
        82.0208333333333
        198.4375)
      Shape = qrsRectangle
    end
  end
  object PageHeaderBand1: TQRBand
    Left = 48
    Top = 48
    Width = 720
    Height = 82
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
      216.958333333333
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
        216.958333333333
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
  object QRLbMetodo: TQRLabel
    Left = 101
    Top = 169
    Width = 82
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      50.2708333333333
      267.229166666667
      447.145833333333
      216.958333333333)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'Método Estándar'
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
  object QRLbHR: TQRLabel
    Left = 429
    Top = 171
    Width = 63
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      50.2708333333333
      1135.0625
      452.4375
      166.6875)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'HR RATINGS'
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
  object QRLbSP: TQRLabel
    Left = 226
    Top = 171
    Width = 21
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      50.2708333333333
      597.958333333333
      452.4375
      55.5625)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'S&P'
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
  object QRLbMOODYS: TQRLabel
    Left = 289
    Top = 171
    Width = 47
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      50.2708333333333
      764.645833333333
      452.4375
      124.354166666667)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'MOODYS'
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
  object QRLbFITCH: TQRLabel
    Left = 371
    Top = 171
    Width = 29
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      50.2708333333333
      981.604166666667
      452.4375
      76.7291666666667)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'FITCH'
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
  object QRLbVERUM: TQRLabel
    Left = 514
    Top = 171
    Width = 37
    Height = 16
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      42.3333333333333
      1359.95833333333
      452.4375
      97.8958333333333)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'VERUM'
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
  object QRLbConR: TQRLabel
    Left = 579
    Top = 165
    Width = 63
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      50.2708333333333
      1531.9375
      436.5625
      166.6875)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'Con registro '
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
  object QRLbSHCP1: TQRLabel
    Left = 584
    Top = 181
    Width = 52
    Height = 16
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      42.3333333333333
      1545.16666666667
      478.895833333333
      137.583333333333)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'ante SHCP'
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
  object QRLbEscala: TQRLabel
    Left = 339
    Top = 140
    Width = 99
    Height = 16
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      42.3333333333333
      896.9375
      370.416666666667
      261.9375)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'Escala Local México'
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
  object QRLbGrupo: TQRLabel
    Left = 626
    Top = 140
    Width = 42
    Height = 16
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      42.3333333333333
      1656.29166666667
      370.416666666667
      111.125)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'Grupo V'
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
  object QRLbSinR: TQRLabel
    Left = 653
    Top = 165
    Width = 59
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      50.2708333333333
      1727.72916666667
      436.5625
      156.104166666667)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'Sin registro '
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
  object QRLbSHCP2: TQRLabel
    Left = 656
    Top = 181
    Width = 52
    Height = 16
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      42.3333333333333
      1735.66666666667
      478.895833333333
      137.583333333333)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'ante SHCP'
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
  object QRLbGrados: TQRLabel
    Left = 99
    Top = 151
    Width = 88
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      50.2708333333333
      261.9375
      399.520833333333
      232.833333333333)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'Grados de Riesgo'
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
  object QRGroupLista: TQRGroup
    Left = 48
    Top = 210
    Width = 720
    Height = 16
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = QRDetalle
    Size.Values = (
      42.3333333333333
      1905)
    Expression = 'qyRecCalif.NUM_NIVEL'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBNUM_NIVEL: TQRDBText
      Left = 66
      Top = 1
      Width = 58
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        174.625
        2.64583333333333
        153.458333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyRecCalif
      DataField = 'NUM_NIVEL'
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
    object QRL1: TQRShape
      Left = 39
      Top = -1
      Width = 633
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1.65364583333333
        104.1796875
        -1.65364583333333
        1673.48958333333)
      Shape = qrsHorLine
    end
    object QRL2: TQRShape
      Left = 39
      Top = 0
      Width = 1
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        45.3571428571429
        102.053571428571
        0
        1.88988095238095)
      Shape = qrsVertLine
    end
    object QRL3: TQRShape
      Left = 671
      Top = 0
      Width = 1
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.6484375
        1776.015625
        0
        1.65364583333333)
      Shape = qrsVertLine
    end
    object QRL14: TQRShape
      Left = 152
      Top = 0
      Width = 1
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.6484375
        401.8359375
        0
        1.65364583333333)
      Shape = qrsVertLine
    end
    object QRL15: TQRShape
      Left = 226
      Top = 0
      Width = 1
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        597.958333333333
        0
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRL16: TQRShape
      Left = 299
      Top = 0
      Width = 1
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        791.104166666667
        0
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRL18: TQRShape
      Left = 449
      Top = 0
      Width = 1
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1187.97916666667
        0
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRL17: TQRShape
      Left = 374
      Top = 0
      Width = 1
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        989.541666666667
        0
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRL19: TQRShape
      Left = 522
      Top = 0
      Width = 1
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1381.125
        0
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRL20: TQRShape
      Left = 597
      Top = 0
      Width = 1
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1579.5625
        0
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRLabel1: TQRLabel
      Left = 621
      Top = 1
      Width = 32
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1643.0625
        2.64583333333333
        84.6666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '150 %'
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
  end
  object QRDetalle: TQRBand
    Left = 48
    Top = 226
    Width = 720
    Height = 16
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
      42.3333333333333
      1905)
    BandType = rbDetail
    object QRDBSP: TQRDBText
      Left = 180
      Top = 0
      Width = 14
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        476.25
        0
        37.0416666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyRecCalif
      DataField = 'SP'
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
    object QRDBMOODYS: TQRDBText
      Left = 249
      Top = 0
      Width = 47
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        658.8125
        0
        124.354166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyRecCalif
      DataField = 'MOODYS'
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
    object QRL5: TQRShape
      Left = 39
      Top = -1
      Width = 1
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        43.4672619047619
        102.053571428571
        -1.88988095238095
        1.88988095238095)
      Shape = qrsVertLine
    end
    object QRL4: TQRShape
      Left = 671
      Top = -1
      Width = 1
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        1776.015625
        -1.65364583333333
        1.65364583333333)
      Shape = qrsVertLine
    end
    object QRL6: TQRShape
      Left = 152
      Top = -1
      Width = 1
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        401.8359375
        -1.65364583333333
        1.65364583333333)
      Shape = qrsVertLine
    end
    object QRL7: TQRShape
      Left = 226
      Top = -1
      Width = 1
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        596.966145833333
        -1.65364583333333
        1.65364583333333)
      Shape = qrsVertLine
    end
    object QRL8: TQRShape
      Left = 300
      Top = -1
      Width = 1
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        793.75
        -1.65364583333333
        1.65364583333333)
      Shape = qrsVertLine
    end
    object QRL9: TQRShape
      Left = 374
      Top = -1
      Width = 1
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        989.541666666667
        -2.64583333333333
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRL10: TQRShape
      Left = 449
      Top = -1
      Width = 1
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1187.97916666667
        -2.64583333333333
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRL11: TQRShape
      Left = 522
      Top = -1
      Width = 1
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1381.125
        -2.64583333333333
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRL12: TQRShape
      Left = 597
      Top = -1
      Width = 1
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1579.5625
        -2.64583333333333
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRDBFITCH: TQRDBText
      Left = 326
      Top = 0
      Width = 29
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        862.541666666667
        0
        76.7291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyRecCalif
      DataField = 'FITCH'
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
    object QRDBHR: TQRDBText
      Left = 402
      Top = 0
      Width = 15
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1063.625
        0
        39.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyRecCalif
      DataField = 'HR'
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
    object QRDBVERUM: TQRDBText
      Left = 474
      Top = 0
      Width = 37
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1254.125
        0
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyRecCalif
      DataField = 'VERUM'
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
    object QRDBCVE_PONDERACION: TQRDBText
      Left = 545
      Top = 0
      Width = 101
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1441.97916666667
        0
        267.229166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyRecCalif
      DataField = 'CVE_PONDERACION'
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
  end
  object QRBPrueba: TQRBand
    Left = 48
    Top = 242
    Width = 720
    Height = 28
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = True
    ForceNewPage = True
    LinkBand = QRDetalle
    Size.Values = (
      74.0833333333333
      1905)
    BandType = rbSummary
    object QRS11: TQRShape
      Left = 39
      Top = -1
      Width = 634
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.6484375
        102.526041666667
        -1.65364583333333
        1678.45052083333)
      Shape = qrsRectangle
    end
    object QRL13: TQRShape
      Left = 522
      Top = -1
      Width = 1
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.9947916666667
        1382.44791666667
        -1.65364583333333
        1.65364583333333)
      Shape = qrsVertLine
    end
    object QRl21: TQRShape
      Left = 597
      Top = -1
      Width = 1
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1579.5625
        -2.64583333333333
        2.64583333333333)
      Shape = qrsVertLine
    end
    object QRLFINAL: TQRLabel
      Left = 197
      Top = 0
      Width = 162
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        521.229166666667
        0
        428.625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'No Calificado o 1 sola calificación'
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
    object QRL150Porc: TQRLabel
      Left = 546
      Top = 0
      Width = 32
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1444.625
        0
        84.6666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '150 %'
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
    object QRL150Porc2: TQRLabel
      Left = 621
      Top = 0
      Width = 32
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1643.0625
        0
        84.6666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '150 %'
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
  end
  object qyRecCalif: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      
        'SELECT b.num_nivel, b.cve_ordenacion, a.sp, b.MOODYS, b.cve_pond' +
        'eracion from '
      
        #9'(select num_nivel, cve_ordenacion, cve_calificacion as SP, '#39#39' M' +
        'OODYS, cve_ponderacion'
      #9'from CR_CAL_CALIFICA where 2 = 2'
      #9'and cve_tipo_escala = 2'
      #9'and CVE_TIPO_RIESGO = '#39'RIESLC'#39
      #9'and id_calificadora in (332172)'
      #9') A,'
      
        #9'(select num_nivel, cve_ordenacion,'#39#39' SP, cve_calificacion as MO' +
        'ODYS, cve_ponderacion'
      #9'from CR_CAL_CALIFICA where 2 = 2'
      #9'and cve_tipo_escala = 2'
      #9'and CVE_TIPO_RIESGO = '#39'RIESLC'#39
      #9'and id_calificadora in (116953)'
      #9') B'
      'where a.cve_ordenacion(+)=b.cve_ordenacion'
      'and a.num_nivel(+)=b.num_nivel'
      'order by num_nivel, cve_ordenacion')
    Left = 280
    Top = 16
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 336
    Top = 16
  end
  object QRExcelFilter2: TQRExcelFilter
    Left = 336
    Top = 16
  end
  object QRExcelFilter3: TQRExcelFilter
    Left = 336
    Top = 16
  end
end
