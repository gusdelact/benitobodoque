object QRProVema: TQRProVema
  Left = 0
  Top = 0
  Width = 1055
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  BeforePrint = QuickRepBeforePrint
  DataSet = qyProgVen
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
  object PageHeaderBand1: TQRBand
    Left = 38
    Top = 38
    Width = 980
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
  object ColumnHeaderBand1: TQRBand
    Left = 38
    Top = 122
    Width = 980
    Height = 18
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
      47.625
      2592.91666666667)
    BandType = rbColumnHeader
    object QRShape26: TQRShape
      Left = 717
      Top = 0
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1897.0625
        0
        171.979166666667)
      Shape = qrsRectangle
    end
    object QRShape22: TQRShape
      Left = 781
      Top = 0
      Width = 68
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2066.39583333333
        0
        179.916666666667)
      Shape = qrsRectangle
    end
    object QRShape21: TQRShape
      Left = 279
      Top = 0
      Width = 40
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        738.1875
        0
        105.833333333333)
      Shape = qrsRectangle
    end
    object QRShape1: TQRShape
      Left = -1
      Top = 0
      Width = 42
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        -2.64583333333333
        0
        111.125)
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 3
      Top = 1
      Width = 36
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        7.9375
        2.64583333333333
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Concepto'
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
      Left = 40
      Top = 0
      Width = 99
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        105.833333333333
        0
        261.9375)
      Shape = qrsRectangle
    end
    object QRLabel13: TQRLabel
      Left = 42
      Top = 1
      Width = 94
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        111.125
        2.64583333333333
        248.708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Periodo / Documento'
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
      Left = 138
      Top = 0
      Width = 30
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        365.125
        0
        79.375)
      Shape = qrsRectangle
    end
    object QRShape4: TQRShape
      Left = 167
      Top = 0
      Width = 35
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        441.854166666667
        0
        92.6041666666667)
      Shape = qrsRectangle
    end
    object QRShape5: TQRShape
      Left = 201
      Top = 0
      Width = 39
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        531.8125
        0
        103.1875)
      Shape = qrsRectangle
    end
    object QRLabel18: TQRLabel
      Left = 205
      Top = 1
      Width = 33
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        542.395833333333
        2.64583333333333
        87.3125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha de Vnto.'
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
    object QRShape6: TQRShape
      Left = 239
      Top = 0
      Width = 41
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        632.354166666667
        0
        108.479166666667)
      Shape = qrsRectangle
    end
    object QRLabel20: TQRLabel
      Left = 242
      Top = 1
      Width = 35
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        640.291666666667
        2.64583333333333
        92.6041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Progra.'
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
    object QRShape7: TQRShape
      Left = 356
      Top = 0
      Width = 64
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        941.916666666667
        0
        169.333333333333)
      Shape = qrsRectangle
    end
    object QRLabel22: TQRLabel
      Left = 358
      Top = 1
      Width = 59
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        947.208333333333
        2.64583333333333
        156.104166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tasa Periodo'
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
      Left = 502
      Top = 0
      Width = 85
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1328.20833333333
        0
        224.895833333333)
      Shape = qrsRectangle
    end
    object QRLabel24: TQRLabel
      Left = 505
      Top = 1
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1336.14583333333
        2.64583333333333
        209.020833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Importe / BINTER'
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
      Left = 586
      Top = 0
      Width = 68
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1550.45833333333
        0
        179.916666666667)
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 589
      Top = 1
      Width = 63
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1558.39583333333
        2.64583333333333
        166.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'IVA'
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
    object QRShape10: TQRShape
      Left = 653
      Top = 0
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1727.72916666667
        0
        171.979166666667)
      Shape = qrsRectangle
    end
    object QRShape11: TQRShape
      Left = 848
      Top = 0
      Width = 85
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2243.66666666667
        0
        224.895833333333)
      Shape = qrsRectangle
    end
    object QRShape13: TQRShape
      Left = 932
      Top = 0
      Width = 27
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2465.91666666667
        0
        71.4375)
      Shape = qrsRectangle
    end
    object QRLabel21: TQRLabel
      Left = 656
      Top = 1
      Width = 59
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1735.66666666667
        2.64583333333333
        156.104166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Garantía FEGA'
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
    object QRLabel31: TQRLabel
      Left = 851
      Top = 1
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2251.60416666667
        2.64583333333333
        209.020833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Total'
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
    object QRLabel32: TQRLabel
      Left = 934
      Top = 1
      Width = 23
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2471.20833333333
        2.64583333333333
        60.8541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'SIT'
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
      Left = 318
      Top = 0
      Width = 40
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        841.375
        0
        105.833333333333)
      Shape = qrsRectangle
    end
    object QRLabel28: TQRLabel
      Left = 321
      Top = 1
      Width = 31
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        849.3125
        2.64583333333333
        82.0208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Pago'
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
    object QRLabel30: TQRLabel
      Left = 171
      Top = 1
      Width = 27
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        452.4375
        2.64583333333333
        71.4375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Inicio'
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
    object QRLabel33: TQRLabel
      Left = 720
      Top = 1
      Width = 59
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1905
        2.64583333333333
        156.104166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Garantía FEGA + BINTER'
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
    object QRLabel43: TQRLabel
      Left = 784
      Top = 1
      Width = 59
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2074.33333333333
        2.64583333333333
        156.104166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Moratorios'
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
    object QRLabel15: TQRLabel
      Left = 140
      Top = 1
      Width = 26
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        370.416666666667
        2.64583333333333
        68.7916666666667)
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
  end
  object QRBand1: TQRBand
    Left = 38
    Top = 256
    Width = 980
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand1BeforePrint
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
      29.1041666666667
      2592.91666666667)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 2
      Top = 0
      Width = 38
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        5.29166666666667
        0
        100.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'ACCESORIO'
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
      Left = 37
      Top = -1
      Width = 106
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        97.8958333333333
        -2.64583333333333
        280.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'NUM_PERIODO_PER'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRDBText4: TQRDBText
      Left = 206
      Top = 0
      Width = 38
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        545.041666666667
        0
        100.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'F_VENCIMIENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = 'DD/MM/YY'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText5: TQRDBText
      Left = 246
      Top = 0
      Width = 37
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        650.875
        0
        97.8958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'F_PROG_PAGO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = 'DD/MM/YY'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText8: TQRDBText
      Left = 935
      Top = 0
      Width = 22
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2473.85416666667
        0
        58.2083333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'SIT_PERIODO'
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
    object QRDB_IMP_IVA: TQRDBText
      Left = 594
      Top = 0
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1571.625
        0
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'IMP_IVA'
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
    object QRDBText19: TQRDBText
      Left = 362
      Top = 0
      Width = 45
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        957.791666666667
        0
        119.0625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'TASA_APLICADA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,##0.0000'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText22: TQRDBText
      Left = 658
      Top = 0
      Width = 55
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1740.95833333333
        0
        145.520833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'IMP_FEGA'
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
    object QRDBText6: TQRDBText
      Left = 168
      Top = 0
      Width = 38
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        444.5
        0
        100.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'F_INICIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = 'DD/MM/YY'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText25: TQRDBText
      Left = 323
      Top = 0
      Width = 37
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        854.604166666667
        0
        97.8958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'F_PAGO'
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
    object QRDBText27: TQRDBText
      Left = 792
      Top = 0
      Width = 56
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2095.5
        0
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'MORATORIOS'
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
    object QRDBText3: TQRDBText
      Left = 145
      Top = 0
      Width = 22
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        383.645833333333
        0
        58.2083333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'PLAZO'
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
    object QRLImporte: TQRLabel
      Left = 542
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
        1434.04166666667
        0
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLImporte'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLFegaBinter: TQRLabel
      Left = 729
      Top = 0
      Width = 55
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1928.8125
        0
        145.520833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLFegaBinter'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLTotal: TQRLabel
      Left = 894
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
        2365.375
        0
        89.9583333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLTotal'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object QRFooterCesion: TQRBand
    Left = 38
    Top = 279
    Width = 980
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFooterCesionBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      37.0416666666667
      2592.91666666667)
    BandType = rbGroupFooter
    object QRLabel17: TQRLabel
      Left = 886
      Top = 2
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2344.20833333333
        5.29166666666667
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLImporte'
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
      Left = 742
      Top = 2
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1963.20833333333
        5.29166666666667
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLImporte'
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
      Left = 542
      Top = 2
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1434.04166666667
        5.29166666666667
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLImporte'
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
    object QRExpr24: TQRExpr
      Left = 594
      Top = 3
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1571.625
        7.9375
        153.458333333333)
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
      Expression = 'SUM(qyProgVen.IMP_IVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr25: TQRExpr
      Left = 658
      Top = 3
      Width = 55
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1740.95833333333
        7.9375
        145.520833333333)
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
      Expression = 'SUM(qyProgVen.IMP_FEGA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel11: TQRLabel
      Left = 50
      Top = 3
      Width = 74
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        132.291666666667
        7.9375
        195.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Crédito'
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
      Left = 792
      Top = 3
      Width = 56
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2095.5
        7.9375
        148.166666666667)
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
      Expression = 'SUM(qyProgVen.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRShape20: TQRShape
      Left = 521
      Top = 0
      Width = 441
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.29166666666667
        1378.47916666667
        0
        1166.8125)
      Shape = qrsRectangle
    end
  end
  object QRFooterCliente: TQRBand
    Left = 38
    Top = 293
    Width = 980
    Height = 9
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFooterClienteBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      23.8125
      2592.91666666667)
    BandType = rbGroupFooter
    object QRLabel27: TQRLabel
      Left = 36
      Top = 0
      Width = 74
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        95.25
        0
        195.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Cliente'
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
    object QRExpr2: TQRExpr
      Left = 658
      Top = 0
      Width = 55
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1740.95833333333
        0
        145.520833333333)
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
      Expression = 'SUM(qyProgVen.IMP_FEGA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr3: TQRExpr
      Left = 594
      Top = 0
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1571.625
        0
        153.458333333333)
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
      Expression = 'SUM(qyProgVen.IMP_IVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr17: TQRExpr
      Left = 792
      Top = -1
      Width = 56
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2095.5
        -2.64583333333333
        148.166666666667)
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
      Expression = 'SUM(qyProgVen.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel5: TQRLabel
      Left = 542
      Top = -1
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1434.04166666667
        -2.64583333333333
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLImporte'
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
    object QRLabel10: TQRLabel
      Left = 742
      Top = -1
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1963.20833333333
        -2.64583333333333
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLImporte'
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
    object QRLabel19: TQRLabel
      Left = 886
      Top = -1
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2344.20833333333
        -2.64583333333333
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLImporte'
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
  end
  object QRFooterPromotor: TQRBand
    Left = 38
    Top = 302
    Width = 980
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFooterPromotorBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      29.1041666666667
      2592.91666666667)
    BandType = rbGroupFooter
    object QRExpr49: TQRExpr
      Left = 596
      Top = 0
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1576.91666666667
        0
        140.229166666667)
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
      Expression = 'SUM(qyProgVen.IMP_IVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr50: TQRExpr
      Left = 655
      Top = 0
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1733.02083333333
        0
        153.458333333333)
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
      Expression = 'SUM(qyProgVen.IMP_FEGA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel16: TQRLabel
      Left = 24
      Top = 0
      Width = 134
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        63.5
        0
        354.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Promotor  Admon'
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
    object QRExpr21: TQRExpr
      Left = 784
      Top = -1
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2074.33333333333
        -2.64583333333333
        169.333333333333)
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
      Expression = 'SUM(qyProgVen.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel7: TQRLabel
      Left = 542
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
        1434.04166666667
        0
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLImporte'
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
    object QRLabel12: TQRLabel
      Left = 742
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
        1963.20833333333
        0
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLImporte'
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
    object QRLabel25: TQRLabel
      Left = 886
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
        2344.20833333333
        0
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLImporte'
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
  end
  object QRBFTIPO_CARTERA: TQRBand
    Left = 38
    Top = 267
    Width = 980
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBFTIPO_CARTERABeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      31.75
      2592.91666666667)
    BandType = rbGroupFooter
    object QRLabel34: TQRLabel
      Left = 886
      Top = 1
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2344.20833333333
        2.64583333333333
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLImporte'
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
    object QRLabel29: TQRLabel
      Left = 742
      Top = 1
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1963.20833333333
        2.64583333333333
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLImporte'
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
    object QRLabel26: TQRLabel
      Left = 542
      Top = 1
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1434.04166666667
        2.64583333333333
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLImporte'
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
    object QRExpr1: TQRExpr
      Left = 594
      Top = 1
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1571.625
        2.64583333333333
        153.458333333333)
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
      Expression = 'SUM(qyProgVen.IMP_IVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr4: TQRExpr
      Left = 658
      Top = 1
      Width = 55
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1740.95833333333
        2.64583333333333
        145.520833333333)
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
      Expression = 'SUM(qyProgVen.IMP_FEGA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr5: TQRExpr
      Left = 792
      Top = 1
      Width = 56
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2095.5
        2.64583333333333
        148.166666666667)
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
      Expression = 'SUM(qyProgVen.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRShape18: TQRShape
      Left = 520
      Top = 1
      Width = 441
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        1375.83333333333
        2.64583333333333
        1166.8125)
      Shape = qrsRectangle
    end
  end
  object QRGroupMoneda: TQRGroup
    Left = 38
    Top = 140
    Width = 980
    Height = 19
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
      50.2708333333333
      2592.91666666667)
    Expression = 'qyProgVen.CVE_MONEDA'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape14: TQRShape
      Left = 1
      Top = 0
      Width = 496
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2.64583333333333
        0
        1312.33333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRDBText15: TQRDBText
      Left = 118
      Top = 1
      Width = 81
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        312.208333333333
        2.64583333333333
        214.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'DESC_MONEDA'
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
    object QRDBText20: TQRDBText
      Left = 66
      Top = 1
      Width = 41
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        174.625
        2.64583333333333
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'CVE_MONEDA'
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
    object QRLabel23: TQRLabel
      Left = 8
      Top = 1
      Width = 45
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        21.1666666666667
        2.64583333333333
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda'
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
  object QRGroup2: TQRGroup
    Left = 38
    Top = 159
    Width = 980
    Height = 12
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
      31.75
      2592.91666666667)
    Expression = 'qyProgVen.ID_PERS_ASOCIAD'
    FooterBand = QRBPromAsoc
    Master = Owner
    ReprintOnNewPage = False
    object QRShape23: TQRShape
      Left = 8
      Top = 0
      Width = 486
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        21.1666666666667
        0
        1285.875)
      Shape = qrsRectangle
    end
    object QRDBText9: TQRDBText
      Left = 153
      Top = 1
      Width = 91
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        404.8125
        2.64583333333333
        240.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'NOM_PROMOTOR_ASO'
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
    object QRDBText11: TQRDBText
      Left = 89
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
        235.479166666667
        2.64583333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'ID_PERS_ASOCIAD'
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
      Left = 11
      Top = 1
      Width = 73
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
        193.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
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
  end
  object QRGroupPromotor1: TQRGroup
    Left = 38
    Top = 171
    Width = 980
    Height = 12
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
      31.75
      2592.91666666667)
    Expression = 'qyProgVen.ID_PROM_ADM'
    FooterBand = QRFooterPromotor
    Master = Owner
    ReprintOnNewPage = False
    object QRShape12: TQRShape
      Left = 21
      Top = 0
      Width = 486
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        55.5625
        0
        1285.875)
      Shape = qrsRectangle
    end
    object dbNombre_Promotor: TQRDBText
      Left = 166
      Top = 1
      Width = 93
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        439.208333333333
        2.64583333333333
        246.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'NOM_PROMOTOR_ADM'
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
    object dbNom_Promotor: TQRDBText
      Left = 102
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
        269.875
        2.64583333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'ID_PROM_ADM'
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
    object qrlPromotor: TQRLabel
      Left = 24
      Top = 1
      Width = 92
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
        243.416666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Promotor Administrador'
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
  object QRGroupProducto: TQRGroup
    Left = 38
    Top = 183
    Width = 980
    Height = 17
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
      44.9791666666667
      2592.91666666667)
    Expression = 'qyProgVen.CVE_PRODUCTO_CRE'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape15: TQRShape
      Left = 28
      Top = 0
      Width = 922
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        74.0833333333333
        0
        2439.45833333333)
      Shape = qrsRectangle
    end
    object dbProducto: TQRDBText
      Left = 69
      Top = 2
      Width = 47
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        182.5625
        5.29166666666667
        124.354166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'CVE_PRODUCTO_CRE'
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel2: TQRLabel
      Left = 30
      Top = 2
      Width = 36
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        79.375
        5.29166666666667
        95.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
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
    object QRDBText23: TQRDBText
      Left = 121
      Top = 2
      Width = 81
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        320.145833333333
        5.29166666666667
        214.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'DESC_L_PRODUCTO'
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
  end
  object QRGroup1: TQRGroup
    Left = 38
    Top = 200
    Width = 980
    Height = 40
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
      105.833333333333
      2592.91666666667)
    Expression = 'qyProgVen.NOMBRE'
    FooterBand = QRFooterCliente
    Master = Owner
    ReprintOnNewPage = False
    object QRShape17: TQRShape
      Left = 32
      Top = 0
      Width = 497
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        84.6666666666667
        0
        1314.97916666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 36
      Top = 0
      Width = 25
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        95.25
        0
        66.1458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Titular'
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
    object QRDBText24: TQRDBText
      Left = 69
      Top = 0
      Width = 49
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        182.5625
        0
        129.645833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
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
    object QRDBText10: TQRDBText
      Left = 121
      Top = 0
      Width = 358
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        320.145833333333
        0
        947.208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'NOMBRE'
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
      Left = 550
      Top = 0
      Width = 63
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1455.20833333333
        0
        166.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Chequera Admin'
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
    object QRDBText13: TQRDBText
      Left = 618
      Top = 0
      Width = 76
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1635.125
        0
        201.083333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'CUENTA_BANCO'
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
    object QRLabel45: TQRLabel
      Left = 702
      Top = 0
      Width = 22
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1857.375
        0
        58.2083333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Saldo'
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
      Left = 736
      Top = 0
      Width = 83
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1947.33333333333
        0
        219.604166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'SALDO_AL'
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
    object QRLabel46: TQRLabel
      Left = 390
      Top = 13
      Width = 35
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1031.875
        34.3958333333333
        92.6041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Colonia: '
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
    object QRDBText16: TQRDBText
      Left = 423
      Top = 13
      Width = 156
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1119.1875
        34.3958333333333
        412.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'COLONIA'
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
    object QRLabel47: TQRLabel
      Left = 36
      Top = 13
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        95.25
        34.3958333333333
        108.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Direccion: '
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
    object QRDBText17: TQRDBText
      Left = 82
      Top = 13
      Width = 303
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        216.958333333333
        34.3958333333333
        801.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'DIRECCION'
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
    object QRLabel48: TQRLabel
      Left = 582
      Top = 13
      Width = 76
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1539.875
        34.3958333333333
        201.083333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Ciudad/Delegacion: '
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
    object QRDBText21: TQRDBText
      Left = 655
      Top = 13
      Width = 98
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1733.02083333333
        34.3958333333333
        259.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'CIUDAD'
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
    object QRLabel49: TQRLabel
      Left = 758
      Top = 13
      Width = 32
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2005.54166666667
        34.3958333333333
        84.6666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Estado: '
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
    object QRDBText26: TQRDBText
      Left = 791
      Top = 13
      Width = 90
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2092.85416666667
        34.3958333333333
        238.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'ESTADO'
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
    object QRDBText30: TQRDBText
      Left = 82
      Top = 26
      Width = 98
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        216.958333333333
        68.7916666666667
        259.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'TEL_CASA'
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
    object QRLabel50: TQRLabel
      Left = 36
      Top = 26
      Width = 37
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        95.25
        68.7916666666667
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tel. casa: '
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
    object QRLabel51: TQRLabel
      Left = 196
      Top = 26
      Width = 46
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        518.583333333333
        68.7916666666667
        121.708333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tel. oficina: '
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
      Left = 242
      Top = 26
      Width = 98
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        640.291666666667
        68.7916666666667
        259.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'TEL_OFNA'
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
      Left = 356
      Top = 26
      Width = 19
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        941.916666666667
        68.7916666666667
        50.2708333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fax: '
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
    object QRDBText32: TQRDBText
      Left = 378
      Top = 26
      Width = 98
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1000.125
        68.7916666666667
        259.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'FAX'
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
    object QRLabel53: TQRLabel
      Left = 484
      Top = 26
      Width = 26
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1280.58333333333
        68.7916666666667
        68.7916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Email: '
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
    object QRDBText33: TQRDBText
      Left = 506
      Top = 26
      Width = 143
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1338.79166666667
        68.7916666666667
        378.354166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'E_MAIL'
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
    object QRLabel54: TQRLabel
      Left = 886
      Top = 13
      Width = 21
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2344.20833333333
        34.3958333333333
        55.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'C.P.: '
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
    object QRDBText34: TQRDBText
      Left = 911
      Top = 13
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2410.35416666667
        34.3958333333333
        111.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'CP'
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
  object QRGroupCesion: TQRGroup
    Left = 38
    Top = 240
    Width = 980
    Height = 14
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
      37.0416666666667
      2592.91666666667)
    Expression = 'qyProgVen.ID_CREDITO'
    FooterBand = QRFooterCesion
    Master = Owner
    ReprintOnNewPage = False
    object QRShape16: TQRShape
      Left = 50
      Top = -1
      Width = 907
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        132.291666666667
        -2.64583333333333
        2399.77083333333)
      Shape = qrsRectangle
    end
    object QRLabel4: TQRLabel
      Left = 53
      Top = 0
      Width = 29
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        140.229166666667
        0
        76.7291666666667)
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
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object dbMoneda: TQRDBText
      Left = 84
      Top = -1
      Width = 40
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        222.25
        -2.64583333333333
        105.833333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
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
    object QRDBText7: TQRDBText
      Left = 180
      Top = 0
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        476.25
        0
        158.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
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
    object QRLabel14: TQRLabel
      Left = 129
      Top = 0
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        341.3125
        0
        127)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Autorización'
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
      Left = 262
      Top = 0
      Width = 45
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        693.208333333333
        0
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Imp Crédito'
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
    object QRDBText29: TQRDBText
      Left = 331
      Top = 0
      Width = 83
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        875.770833333333
        0
        219.604166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
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
    object QRLabel37: TQRLabel
      Left = 434
      Top = 0
      Width = 49
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1148.29166666667
        0
        129.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sdo Insoluto'
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
      Left = 500
      Top = 0
      Width = 83
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1322.91666666667
        0
        219.604166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
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
    object QRLabel38: TQRLabel
      Left = 600
      Top = 0
      Width = 46
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1587.5
        0
        121.708333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sdo Vigente'
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
      Left = 664
      Top = 0
      Width = 83
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1756.83333333333
        0
        219.604166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
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
  end
  object QRGTIPO_CARTERA: TQRGroup
    Left = 38
    Top = 254
    Width = 980
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
      5.29166666666667
      2592.91666666667)
    Expression = 'qyProgVen.TIPO_CARTERA'
    FooterBand = QRBFTIPO_CARTERA
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRBPromAsoc: TQRBand
    Left = 38
    Top = 313
    Width = 980
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBPromAsocBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      29.1041666666667
      2592.91666666667)
    BandType = rbGroupFooter
    object QRExpr6: TQRExpr
      Left = 596
      Top = 0
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1576.91666666667
        0
        140.229166666667)
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
      Expression = 'SUM(qyProgVen.IMP_IVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr7: TQRExpr
      Left = 655
      Top = 0
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1733.02083333333
        0
        153.458333333333)
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
      Expression = 'SUM(qyProgVen.IMP_FEGA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel39: TQRLabel
      Left = 15
      Top = 0
      Width = 134
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        39.6875
        0
        354.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Promotor  Asoc'
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
    object QRExpr8: TQRExpr
      Left = 784
      Top = -1
      Width = 64
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2074.33333333333
        -2.64583333333333
        169.333333333333)
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
      Expression = 'SUM(qyProgVen.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel40: TQRLabel
      Left = 542
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
        1434.04166666667
        0
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLImporte'
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
    object QRLabel41: TQRLabel
      Left = 742
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
        1963.20833333333
        0
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLImporte'
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
    object QRLabel42: TQRLabel
      Left = 886
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
        2344.20833333333
        0
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLImporte'
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
  end
  object qyProgVen: TQuery
    DatabaseName = 'RCORP'
    SQL.Strings = (
      'SELECT GENERAL.*,'
      '       PPR.ID_PERSONA AS ID_PROM_ADM, '
      '       PPR.NOMBRE AS NOM_PROMOTOR_ADM, '
      '       CTO.ID_PERS_ASOCIAD,       '
      '       PPRC.NOMBRE NOM_PROMOTOR_ASO, '
      '       CC.ID_CONTRATO, '
      '       CC.SDO_INSOLUTO,'
      '       CC.SDO_VIG_TOTAL,'
      '       CC.IMP_CREDITO,'
      '       M.CVE_MONEDA,'
      '       M.DESC_MONEDA,'
      '       CCTO.CVE_PRODUCTO_CRE,'
      
        '       (SELECT DESC_L_PRODUCTO FROM CR_PRODUCTO WHERE CVE_PRODUC' +
        'TO_CRE=CCTO.CVE_PRODUCTO_CRE) DESC_L_PRODUCTO,'
      
        '       SUBSTR(PKGCRPERIODO.STPObtChqCte(PCE.ID_PERSONA,0,GENERAL' +
        '.ID_CREDITO,'#39'AC'#39','#39'AD'#39','#39'CR'#39'),1,20) CUENTA_BANCO,'
      
        '       PKGDPVISTASERV.SPTObtSaldo(PKGCRPERIODO.STPObtChqCte(PCE.' +
        'ID_PERSONA,0,GENERAL.ID_CREDITO,'#39'AC'#39','#39'AD'#39','#39'CR'#39'),'#39'D000'#39') SALDO_AL' +
        ','
      
        '       SUBSTR(PKGCRPERIODO.STPObtChqCte(PCE.ID_PERSONA,0,CC.ID_C' +
        'REDITO,'#39'AC'#39','#39'AD'#39','#39'CR'#39'),1,20) CUENTA_BANCO,'
      
        '       PKGDPVISTASERV.SPTObtSaldo(PKGCRPERIODO.STPObtChqCte(PCE.' +
        'ID_PERSONA,0,CC.ID_CREDITO,'#39'AC'#39','#39'AD'#39','#39'CR'#39'),'#39'D000'#39') SALDO_AL,'
      '       PCE.ID_PERSONA AS ID_TITULAR,'
      '       PCE.NOMBRE,'
      
        '       D.CALLE_NUMERO||'#39'  Ext. '#39'||D.NUM_EXTERIOR||'#39'  Int. '#39'||D.N' +
        'UM_INTERIOR AS DIRECCION,'
      '       D.COLONIA AS COLONIA,'
      
        '       (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION' +
        '=D.CVE_CIUDAD) AS CIUDAD,'
      
        '       (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION' +
        '=D.CVE_ESTADO) AS ESTADO,'
      
        '       (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION' +
        '=D.CVE_PAIS) AS PAIS,'
      '       D.CODIGO_POSTAL AS CP,'
      '       PCE.TELEF_CASA AS TEL_CASA,'
      '       PCE.TELEF_FAX AS FAX,'
      '       PCE.TELEF_OFICINA AS TEL_OFNA,'
      '       PCE.E_MAIL AS E_MAIL'
      'FROM'
      '       ('
      
        #9'    SELECT ID_CREDITO, '#39'AA'#39' AS TIPO_CARTERA, '#39'A'#39' AS SUB_ORDEN, ' +
        #39'CAPITAL'#39' ACCESORIO,NUM_PERIODO,(F_VENCIMIENTO - PLAZO) F_INICIO' +
        ', '
      
        '               F_VENCIMIENTO,F_PROG_PAGO,F_PAGO, NUM_PERIODO AS ' +
        'NUM_PERIODO_PER, PLAZO,'
      
        #9#9#9'   PKGCRCOMUN.FUNOBTENTASA('#39'CP'#39',ID_CREDITO,NUM_PERIODO,F_VENC' +
        'IMIENTO-1) TASA_APLICADA,'
      
        '               (IMP_CAPITAL - IMP_PAGADO_HIST + PAGOSANT) IMPORT' +
        'E,0 IMP_IVA,SIT_CAPITAL AS SIT_PERIODO,'
      
        '               (IMP_CAPITAL - IMP_PAGADO_HIST - IMP_CONCEPTO + P' +
        'AGOSANT) IMP_BINTER,'
      '               IMP_CONCEPTO IMP_FEGA,'
      
        '               (IMP_CAPITAL + MORATORIOS  - IMP_PAGADO_HIST + PA' +
        'GOSANT ) IMP_TOTAL, MORATORIOS'
      '          FROM  '
      #9#9'      (SELECT CCA.*, '
      
        '                      PKGCRCOMUN.FUNOBTENIMPGTIA( 3, '#39'CP'#39', '#39'IMPB' +
        'RU'#39', CCA.ID_CREDITO,'
      
        '                                                  CCA.NUM_PERIOD' +
        'O, NULL, TO_DATE('#39'31/01/2009'#39','#39'DD/MM/YYYY'#39'), '#39'V'#39' ) IMP_CONCEPTO,' +
        ' '
      
        '                      NVL( PKGCRPERIODO.FUNOBTENMORA( 1,'#39'V'#39',CCA.' +
        'ID_CREDITO,CCA.NUM_PERIODO,NULL,NULL,'
      
        '                                                      TO_DATE('#39'3' +
        '1/01/2009'#39','#39'DD/MM/YYYY'#39'),NULL), 0 ) AS MORATORIOS,'
      
        '                      NVL( PKGCRCOMUN.STPOBTIMPPAGADO( '#39'CP'#39', '#39'IM' +
        'PBRU'#39',CCA.ID_CREDITO, CCA.NUM_PERIODO,NULL,'
      
        '                                                      TO_DATE('#39'3' +
        '1/01/2009'#39','#39'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST'
      
        '                      ,NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) PAG' +
        'OSANT'
      
        '                 FROM (SELECT CCA.* FROM CR_CAPITAL CCA, CR_CAPI' +
        'TAL CCAF '
      '                       WHERE 1 = 1'
      '                       AND   CCAF.ID_CREDITO = CCA.ID_CREDITO '
      
        '                       AND  CCAF.F_VENCIMIENTO =TO_DATE('#39'31/01/2' +
        '009'#39','#39'DD/MM/YYYY'#39')'
      
        '                       AND  CCA.F_VENCIMIENTO <TO_DATE('#39'31/01/20' +
        '09'#39','#39'DD/MM/YYYY'#39')'
      
        '                       AND  ((CCA.F_PROG_PAGO < CCA.F_PAGO AND C' +
        'CA.SIT_CAPITAL NOT IN ('#39'CA'#39','#39'LQ'#39') AND CCA.F_PAGO > TO_DATE('#39'31/0' +
        '1/2009'#39','#39'DD/MM/YYYY'#39'))'
      '                             OR   (CCA.SIT_CAPITAL = '#39'IM'#39' ))'
      '                      ) CCA'
      '                     ,('
      '                       SELECT CT.ID_CREDITO, CT.ID_PERIODO,'
      
        '                              NVL(SUM(CDT.IMP_CONCEPTO),0) AS IM' +
        'P_HIST_PGDMCP'
      
        '                         FROM CR_TRANSACCION CT, CR_DET_TRANSAC ' +
        'CDT'
      '                        WHERE 1=1'
      '                          AND CT.SIT_TRANSACCION = '#39'AC'#39
      '                          AND CT.ID_TRANS_CANCELA IS NULL'
      
        '                          AND CT.ID_TRANSACCION = CDT.ID_TRANSAC' +
        'CION'
      '                          AND CT.CVE_OPERACION IN ('#39'PGDMCP'#39')'
      '                          AND CDT.CVE_CONCEPTO IN ('#39'IMPBRU'#39')'
      '                        GROUP BY CT.ID_CREDITO, CT.ID_PERIODO'
      '                      ) CA_HIST_PGDMCP'
      '                WHERE 1=1'
      
        '                  AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCA.ID_CRED' +
        'ITO'
      
        '                  AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCA.NUM_PER' +
        'IODO'
      #9'          ) VECA'
      '       UNION ALL'
      
        '       SELECT ID_CREDITO,'#39'AA'#39' AS TIPO_CARTERA, '#39'C'#39' AS SUB_ORDEN,' +
        '  '#39'INTERES'#39' ACCESORIO,NUM_PERIODO,(F_VENCIMIENTO - PLAZO) F_INIC' +
        'IO,'
      
        '              F_VENCIMIENTO,F_PROG_PAGO,F_PAGO, NUM_PERIODO AS N' +
        'UM_PERIODO_PER, PLAZO, TASA_APLICADA,'
      
        '              (IMP_INTERES_PROY - IMP_PAGADO_HIST ) IMPORTE,0 IM' +
        'P_IVA,SIT_INTERES AS SIT_PERIODO,'
      
        '              (IMP_INTERES_PROY - IMP_PAGADO_HIST - IMP_CONCEPTO' +
        ') IMP_BINTER, '
      '              IMP_CONCEPTO IMP_FEGA, '
      
        '              (IMP_INTERES_PROY + MORATORIOS  - IMP_PAGADO_HIST ' +
        ') IMP_TOTAL, MORATORIOS'
      '         FROM  '
      #9#9'      (SELECT CCI.*, '
      
        '                     PKGCRCOMUN.FUNOBTENIMPGTIA( 3, '#39'IN'#39', '#39'IMPBR' +
        'U'#39', CCI.ID_CREDITO, '
      
        '                                                 CCI.NUM_PERIODO' +
        ', NULL, TO_DATE('#39'31/01/2009'#39','#39'DD/MM/YYYY'#39'), '#39'V'#39' ) IMP_CONCEPTO, '
      
        '                     NVL( PKGCRPERIODO.FUNOBTENMORA( 4,'#39'V'#39',CCI.I' +
        'D_CREDITO,CCI.NUM_PERIODO,NULL,NULL,'
      
        '                                                     TO_DATE('#39'31' +
        '/01/2009'#39','#39'DD/MM/YYYY'#39'),NULL), 0 ) AS MORATORIOS, '
      
        '                     NVL( PKGCRCOMUN.STPOBTIMPPAGADO( '#39'IN'#39', '#39'IMP' +
        'BRU'#39',CCI.ID_CREDITO, CCI.NUM_PERIODO,NULL,'
      
        '                                                     TO_DATE('#39'31' +
        '/01/2009'#39','#39'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST '
      
        '                 FROM (SELECT CCI.* FROM CR_INTERES CCI, CR_INTE' +
        'RES CCIF '
      '                       WHERE 1 = 1'
      '                       AND   CCIF.ID_CREDITO = CCI.ID_CREDITO '
      
        '                       AND  CCIF.F_VENCIMIENTO =TO_DATE('#39'31/01/2' +
        '009'#39','#39'DD/MM/YYYY'#39')'
      
        '                       AND  CCIF.B_FINAN_ADIC NOT IN ('#39'V'#39') AND  ' +
        'CCI.F_VENCIMIENTO <TO_DATE('#39'31/01/2009'#39','#39'DD/MM/YYYY'#39')'
      
        '                       AND  ((CCI.F_PROG_PAGO < CCI.F_PAGO AND C' +
        'CI.SIT_INTERES NOT IN ('#39'CA'#39','#39'LQ'#39') AND   CCI.F_PAGO > TO_DATE('#39'31' +
        '/01/2009'#39','#39'DD/MM/YYYY'#39'))'
      '                             OR   (CCI.SIT_INTERES = '#39'IM'#39' ))'
      '                      ) CCI ,'
      #9#9'     (SELECT CCA.* FROM CR_CAPITAL CCA, CR_CAPITAL CCAF'
      '                       WHERE 1 = 1'
      '                       AND   CCAF.ID_CREDITO = CCA.ID_CREDITO'
      
        '                       AND  CCAF.F_VENCIMIENTO =TO_DATE('#39'31/12/2' +
        '009'#39','#39'DD/MM/YYYY'#39')'
      
        '                       AND  CCA.F_VENCIMIENTO <TO_DATE('#39'31/12/20' +
        '09'#39','#39'DD/MM/YYYY'#39')'
      
        '                       AND  ((CCA.F_PROG_PAGO < CCA.F_PAGO AND C' +
        'CA.SIT_CAPITAL NOT IN ('#39'CA'#39','#39'LQ'#39') AND CCA.F_PAGO > TO_DATE('#39'31/1' +
        '2/2009'#39','#39'DD/MM/YYYY'#39'))'
      '                             OR   (CCA.SIT_CAPITAL = '#39'IM'#39' ))'
      #9#9'             ) CCA2'
      #9#9#9#9' WHERE CCI.F_VENCIMIENTO = CCA2.F_VENCIMIENTO'
      #9#9#9#9' AND   CCI.ID_CREDITO    = CCA2.ID_CREDITO'
      #9#9'      ) VEIN'
      '       UNION ALL  '
      
        '       SELECT ID_CREDITO,'#39'AA'#39' AS TIPO_CARTERA, '#39'B'#39' AS SUB_ORDEN,' +
        '  '#39'FINAN'#39' ACCESORIO,NUM_PERIODO,(F_VENCIMIENTO - PLAZO) F_INICIO' +
        ','
      
        '              F_VENCIMIENTO,F_PROG_PAGO,F_PAGO, NUM_PERIODO AS N' +
        'UM_PERIODO_PER, PLAZO, PKGCRCOMUN.FUNOBTENTASA('#39'FN'#39',ID_CREDITO,N' +
        'UM_PERIODO,F_VENCIMIENTO-1)TASA_APLICADA,'
      
        '              (IMP_FINAN_ADIC - IMP_PAGADO_HIST ) IMPORTE,0 IMP_' +
        'IVA,SIT_FINAN_ADIC AS SIT_PERIODO, '
      
        '              (IMP_FINAN_ADIC - IMP_PAGADO_HIST - IMP_CONCEPTO) ' +
        'IMP_BINTER, '
      '              IMP_CONCEPTO IMP_FEGA, '
      
        '              (IMP_FINAN_ADIC + MORATORIOS  - IMP_PAGADO_HIST ) ' +
        'IMP_TOTAL, MORATORIOS'
      '         FROM  '
      #9#9'      (SELECT CCF.*, '
      
        '                      PKGCRCOMUN.FUNOBTENIMPGTIA( 3, '#39'FN'#39', '#39'IMPB' +
        'RU'#39', CCF.ID_CREDITO, '
      
        '                                                  CCF.NUM_PERIOD' +
        'O, NULL, TO_DATE('#39'31/01/2009'#39','#39'DD/MM/YYYY'#39'), '#39'V'#39' ) IMP_CONCEPTO,' +
        ' '
      
        '                      NVL( PKGCRPERIODO.FUNOBTENMORA( 3,'#39'V'#39',CCF.' +
        'ID_CREDITO,CCF.NUM_PERIODO,NULL,NULL,'
      
        '                                                      TO_DATE('#39'3' +
        '1/01/2009'#39','#39'DD/MM/YYYY'#39'),NULL), 0 ) AS MORATORIOS, '
      
        '                      NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( '#39'FN'#39', '#39'I' +
        'MPBRU'#39',CCF.ID_CREDITO, CCF.NUM_PERIODO,NULL,'
      
        '                                                       TO_DATE('#39 +
        '31/01/2009'#39','#39'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST '
      
        '                 FROM (SELECT CCF.* FROM CR_FINAN_ADIC CCF, CR_F' +
        'INAN_ADIC CCFF '
      '                       WHERE 1 = 1'
      '                       AND   CCFF.ID_CREDITO = CCF.ID_CREDITO '
      
        '                       AND  CCFF.F_VENCIMIENTO =TO_DATE('#39'31/01/2' +
        '009'#39','#39'DD/MM/YYYY'#39')'
      
        '                       AND  CCF.F_VENCIMIENTO <TO_DATE('#39'31/01/20' +
        '09'#39','#39'DD/MM/YYYY'#39')'
      
        '                       AND  ((CCF.F_PROG_PAGO < CCF.F_PAGO AND C' +
        'CF.SIT_FINAN_ADIC NOT IN ('#39'CA'#39','#39'LQ'#39') AND   CCF.F_PAGO > TO_DATE(' +
        #39'31/01/2009'#39','#39'DD/MM/YYYY'#39'))'
      '                             OR (CCF.SIT_FINAN_ADIC = '#39'IM'#39' ))'
      '                      ) CCF '
      #9#9#9' ) VEFN'
      '       UNION ALL '
      
        '       SELECT ID_CREDITO,'#39'AA'#39' AS TIPO_CARTERA, '#39'D'#39' AS SUB_ORDEN,' +
        '  DESC_COMISION,NUM_PERIODO,(F_VENCIMIENTO - PLAZO) F_INICIO, '
      
        '              F_VENCIMIENTO,F_PROG_PAGO,F_PAGO, NUM_PERIODO AS N' +
        'UM_PERIODO_PER, PLAZO, TASA_APLICADA,'
      '              (IMP_COMISION - IMP_PAGADO_HIST) IMPORTE,'
      
        '              IMP_IVA-IMP_IVA_PAG_HIST AS IMP_IVA,SIT_COMISION A' +
        'S SIT_PERIODO, '
      
        '              (IMP_COMISION - IMP_PAGADO_HIST - NVL(IMP_CONCEPTO' +
        ',0)) IMP_BINTER, '
      '              NVL(IMP_CONCEPTO,0) IMP_FEGA, '
      
        '              (IMP_COMISION  + IMP_IVA + MORATORIOS - IMP_PAGADO' +
        '_HIST -IMP_IVA_PAG_HIST) IMP_TOTAL, MORATORIOS'
      '         FROM '
      #9#9'      (SELECT CCC.*, '
      
        '                      PKGCRCOMUN.FUNOBTENIMPGTIA( 3, '#39'CN'#39', '#39'IMPB' +
        'RU'#39', CCC.ID_CREDITO,                 '
      
        #9#9#9#9#9'                              CCC.NUM_PERIODO, CCC.CVE_COMI' +
        'SION, TO_DATE('#39'31/01/2009'#39','#39'DD/MM/YYYY'#39'), '#39'V'#39' ) IMP_CONCEPTO, '
      '                      CCCO.DESC_COMISION,'
      
        '                      NVL( PKGCRPERIODO.FUNOBTENMORA( 2 ,'#39'V'#39' ,CC' +
        'C.ID_CREDITO ,CCC.NUM_PERIODO , CCC.CVE_COMISION , NULL,'
      
        #9#9#9#9#9'                                  TO_DATE('#39'31/01/2009'#39','#39'DD/' +
        'MM/YYYY'#39'),                NULL), 0 ) AS MORATORIOS, '
      
        '                      NVL( PKGCRCOMUN.STPOBTIMPPAGADO( '#39'CN'#39', '#39'IM' +
        'PBRU'#39', CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,'
      
        '                        '#9#9#9#9#9'          TO_DATE('#39'31/01/2009'#39','#39'DD/' +
        'MM/YYYY'#39'), '#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST, '
      
        '                      NVL( PKGCRCOMUN.STPOBTIMPPAGADO( '#39'CN'#39', '#39'IM' +
        'PIVA'#39', CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,'
      
        #9#9#9#9#9'                                  TO_DATE('#39'31/01/2009'#39','#39'DD/' +
        'MM/YYYY'#39'), '#39'V'#39' ), 0 ) AS IMP_IVA_PAG_HIST '
      
        '                 FROM (SELECT CCC.* FROM CR_COMISION CCC, CR_COM' +
        'ISION CCCF '
      '                       WHERE 1 = 1'
      '                       AND   CCCF.ID_CREDITO = CCC.ID_CREDITO '
      
        '                       AND  CCCF.F_VENCIMIENTO =TO_DATE('#39'31/01/2' +
        '009'#39','#39'DD/MM/YYYY'#39')'
      
        '                       AND CCC.F_VENCIMIENTO <TO_DATE('#39'31/01/200' +
        '9'#39','#39'DD/MM/YYYY'#39')'
      
        '                       AND  ((CCC.F_PROG_PAGO < CCC.F_PAGO AND C' +
        'CC.SIT_COMISION NOT IN ('#39'CA'#39','#39'LQ'#39') AND   CCC.F_PAGO > TO_DATE('#39'3' +
        '1/01/2009'#39','#39'DD/MM/YYYY'#39'))'
      '                             OR   (CCC.SIT_COMISION = '#39'IM'#39' ))'
      '                      ) CCC, CR_CAT_COMISION CCCO  '
      '                 WHERE  CCCO.CVE_COMISION = CCC.CVE_COMISION  '
      #9#9#9' ) VECN'
      '       UNION ALL '
      
        '       SELECT ID_CREDITO,'#39'BB'#39' AS TIPO_CARTERA, '#39'A'#39' AS SUB_ORDEN,' +
        '  '#39'CAPITAL'#39' ACCESORIO,NUM_PERIODO,(F_VENCIMIENTO - PLAZO) F_INIC' +
        'IO, '
      
        '              F_VENCIMIENTO,F_PROG_PAGO,F_PAGO, NUM_PERIODO AS N' +
        'UM_PERIODO_PER, PLAZO,'
      
        '              PKGCRCOMUN.FUNOBTENTASA('#39'CP'#39',ID_CREDITO,NUM_PERIOD' +
        'O,F_VENCIMIENTO-1)TASA_APLICADA,'
      
        '              (IMP_CAPITAL - IMP_PAGADO_HIST + PAGOSANT ) IMPORT' +
        'E,0 IMP_IVA,SIT_CAPITAL AS SIT_PERIODO,'
      
        '              (IMP_CAPITAL - IMP_PAGADO_HIST - IMP_CONCEPTO + PA' +
        'GOSANT ) IMP_BINTER,'
      '              IMP_CONCEPTO IMP_FEGA, '
      
        '              (IMP_CAPITAL + MORATORIOS  - IMP_PAGADO_HIST + PAG' +
        'OSANT ) IMP_TOTAL, MORATORIOS'
      '         FROM  '
      #9#9'      (SELECT CCA.*, '
      
        '                      PKGCRCOMUN.FUNOBTENIMPGTIA( 3, '#39'CP'#39', '#39'IMPB' +
        'RU'#39', CCA.ID_CREDITO, '
      
        '                                                  CCA.NUM_PERIOD' +
        'O, NULL, TO_DATE('#39'31/01/2009'#39','#39'DD/MM/YYYY'#39'), '#39'V'#39' ) IMP_CONCEPTO,' +
        ' '
      '                      0 AS MORATORIOS, '
      
        '                      NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( '#39'CP'#39', '#39'I' +
        'MPBRU'#39',CCA.ID_CREDITO, CCA.NUM_PERIODO,NULL,'
      
        '                                                        TO_DATE(' +
        #39'31/01/2009'#39','#39'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST'
      
        '                      ,NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) PAG' +
        'OSANT'
      '                 FROM (SELECT * FROM CR_CAPITAL CCA '
      '                       WHERE 1 = 1'
      '                       AND CCA.SIT_CAPITAL NOT IN ('#39'CA'#39','#39'LQ'#39')'
      
        '                       AND  CCA.F_VENCIMIENTO =TO_DATE('#39'31/01/20' +
        '09'#39','#39'DD/MM/YYYY'#39')'
      '                      ) CCA'
      #9'             ,('
      #9#9'       SELECT CT.ID_CREDITO, CT.ID_PERIODO,'
      #9#9'              NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP'
      #9#9'         FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'
      #9#9'        WHERE 1=1'
      #9#9'          AND CT.SIT_TRANSACCION = '#39'AC'#39
      #9#9'          AND CT.ID_TRANS_CANCELA IS NULL'
      #9#9'          AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION'
      #9#9'          AND CT.CVE_OPERACION IN ('#39'PGDMCP'#39')'
      #9#9'          AND CDT.CVE_CONCEPTO IN ('#39'IMPBRU'#39')'
      #9#9'        GROUP BY CT.ID_CREDITO, CT.ID_PERIODO'
      #9#9'      ) CA_HIST_PGDMCP'
      '                 WHERE 1=1'
      '           '#9'   AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCA.ID_CREDITO'
      #9'           AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCA.NUM_PERIODO'
      #9#9#9'  ) PRCA'
      '       UNION ALL '
      
        '       SELECT ID_CREDITO,'#39'BB'#39' AS TIPO_CARTERA, '#39'B'#39' AS SUB_ORDEN,' +
        '  '#39'FINAN'#39' ACCESORIO,NUM_PERIODO,(F_VENCIMIENTO - PLAZO) F_INICIO' +
        ', '
      '              F_VENCIMIENTO,F_PROG_PAGO,F_PAGO,'
      '              NUM_PERIODO AS NUM_PERIODO_PER, PLAZO,'
      
        '              PKGCRCOMUN.FUNOBTENTASA('#39'FN'#39',ID_CREDITO,NUM_PERIOD' +
        'O,F_VENCIMIENTO-1)TASA_APLICADA,'
      
        '              (IMP_FINAN_ADIC - IMP_PAGADO_HIST ) IMPORTE,0 IMP_' +
        'IVA,SIT_FINAN_ADIC AS SIT_PERIODO, '
      
        '              (IMP_FINAN_ADIC - IMP_PAGADO_HIST - IMP_CONCEPTO) ' +
        'IMP_BINTER, '
      '              IMP_CONCEPTO IMP_FEGA,'
      
        '              (IMP_FINAN_ADIC + MORATORIOS  - IMP_PAGADO_HIST ) ' +
        'IMP_TOTAL, MORATORIOS'
      '         FROM  '
      #9#9'      (SELECT CCF.*, '
      
        '                      PKGCRCOMUN.FUNOBTENIMPGTIA( 3, '#39'FN'#39', '#39'IMPB' +
        'RU'#39', CCF.ID_CREDITO, '
      
        '                                                  CCF.NUM_PERIOD' +
        'O, NULL, TO_DATE('#39'31/01/2009'#39','#39'DD/MM/YYYY'#39'), '#39'V'#39' ) IMP_CONCEPTO,' +
        ' '
      '                      0 AS MORATORIOS, '
      
        '                      NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( '#39'FN'#39', '#39'I' +
        'MPBRU'#39',CCF.ID_CREDITO, CCF.NUM_PERIODO,NULL,'
      
        '                                                        TO_DATE(' +
        #39'31/01/2009'#39','#39'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST '
      '                 FROM (SELECT * FROM CR_FINAN_ADIC CCF '
      '                       WHERE 1 = 1 '
      '                       AND CCF.SIT_FINAN_ADIC NOT IN ('#39'CA'#39','#39'LQ'#39')'
      
        '                       AND  CCF.F_VENCIMIENTO =TO_DATE('#39'31/01/20' +
        '09'#39','#39'DD/MM/YYYY'#39')'
      '                      ) CCF '
      #9#9#9'  ) PRFN'
      '       UNION ALL '
      
        '       SELECT PRIN.ID_CREDITO,'#39'BB'#39' AS TIPO_CARTERA, '#39'C'#39' AS SUB_O' +
        'RDEN,  '#39'INTERES'#39' ACCESORIO,NUM_PERIODO,(F_VENCIMIENTO - PLAZO) F' +
        '_INICIO, '
      '              F_VENCIMIENTO,F_PROG_PAGO,F_PAGO,'
      '              NUM_PERIODO AS NUM_PERIODO_PER, PLAZO,'
      
        '              DECODE(TASA_APLICADA,NULL,TASA_CREDITO,0,TASA_CRED' +
        'ITO,TASA_APLICADA) AS TASA_APLICADA,'
      '             --0  AS TASA_APLICADA,'#9#9#9' '
      
        '              (0 - IMP_PAGADO_HIST ) IMPORTE, IMP_IVA, SIT_INTER' +
        'ES AS SIT_PERIODO, '
      '              (0 - IMP_PAGADO_HIST - IMP_CONCEPTO) IMP_BINTER, '
      '              IMP_CONCEPTO IMP_FEGA, '
      
        '              (0 + MORATORIOS  - IMP_PAGADO_HIST ) IMP_TOTAL, MO' +
        'RATORIOS'
      '         FROM  '
      #9#9'      (SELECT CCI.*, '
      
        '                      PKGCRCOMUN.FUNOBTENIMPGTIA( 3, '#39'IN'#39', '#39'IMPB' +
        'RU'#39', CCI.ID_CREDITO, '
      
        '                                                  CCI.NUM_PERIOD' +
        'O, NULL, TO_DATE('#39'31/01/2009'#39','#39'DD/MM/YYYY'#39'), '#39'V'#39' ) IMP_CONCEPTO,' +
        ' '
      '                      0 AS MORATORIOS, '
      
        '                      NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( '#39'IN'#39', '#39'I' +
        'MPBRU'#39',CCI.ID_CREDITO, CCI.NUM_PERIODO,NULL,'
      
        '                                                        TO_DATE(' +
        #39'31/01/2009'#39','#39'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST '
      '                 FROM (SELECT * FROM CR_INTERES CCI '
      '                       WHERE 1 = 1'
      '                       AND CCI.SIT_INTERES NOT IN ('#39'CA'#39','#39'LQ'#39')'
      
        '                       AND   CCI.B_FINAN_ADIC NOT IN ('#39'V'#39') AND  ' +
        'CCI.F_VENCIMIENTO =TO_DATE('#39'31/01/2009'#39','#39'DD/MM/YYYY'#39')'
      '                      ) CCI'
      '  '#9'             ,'
      #9#9'     (SELECT * FROM CR_CAPITAL CCA'
      '                      WHERE 1 = 1'
      '                      AND CCA.SIT_CAPITAL NOT IN ('#39'CA'#39','#39'LQ'#39')'
      
        '                      AND  CCA.F_VENCIMIENTO =TO_DATE('#39'31/12/200' +
        '9'#39','#39'DD/MM/YYYY'#39')'
      '                     ) CCA2'
      '       '#9#9'     WHERE CCI.F_VENCIMIENTO = CCA2.F_VENCIMIENTO'
      #9#9'     AND   CCI.ID_CREDITO    = CCA2.ID_CREDITO'
      #9#9#9'  ) PRIN,'
      #9#9#9'  (SELECT ID_CREDITO, TASA_CREDITO '
      #9#9#9'     FROM CR_CREDITO) CCRE '
      #9#9' WHERE PRIN.ID_CREDITO = CCRE.ID_CREDITO'
      '       UNION ALL '
      
        '       SELECT ID_CREDITO,'#39'BB'#39' AS TIPO_CARTERA, '#39'D'#39' AS SUB_ORDEN,' +
        '  DESC_COMISION AS ACCESORIO,NUM_PERIODO,(F_VENCIMIENTO - PLAZO)' +
        ' F_INICIO, '
      
        '              F_VENCIMIENTO,F_PROG_PAGO,F_PAGO, NUM_PERIODO AS N' +
        'UM_PERIODO_PER, PLAZO, TASA_APLICADA,'
      '              (IMP_COMISION - IMP_PAGADO_HIST) IMPORTE,'
      
        '              IMP_IVA-IMP_IVA_PAG_HIST AS IMP_IVA,SIT_COMISION A' +
        'S SIT_PERIODO, '
      
        '              (IMP_COMISION - IMP_PAGADO_HIST - NVL(IMP_CONCEPTO' +
        ',0)) IMP_BINTER, '
      '              NVL(IMP_CONCEPTO,0) IMP_FEGA, '
      
        '              (IMP_COMISION  + IMP_IVA + MORATORIOS - IMP_PAGADO' +
        '_HIST -IMP_IVA_PAG_HIST) IMP_TOTAL, '
      '              MORATORIOS'
      '         FROM '
      #9#9'      (SELECT CCC.*, '
      
        '                      PKGCRCOMUN.FUNOBTENIMPGTIA( 3, '#39'CN'#39', '#39'IMPB' +
        'RU'#39', CCC.ID_CREDITO,      '
      
        #9#9#9#9#9'                              CCC.NUM_PERIODO, CCC.CVE_COMI' +
        'SION, TO_DATE('#39'31/01/2009'#39','#39'DD/MM/YYYY'#39'), '#39'V'#39' ) IMP_CONCEPTO, '
      '                      CCCO.DESC_COMISION,'
      '                      0 AS MORATORIOS, '
      
        '                      NVL( PKGCRCOMUN.STPOBTIMPPAGADO( '#39'CN'#39', '#39'IM' +
        'PBRU'#39', CCC.ID_CREDITO, CCC.NUM_PERIODO, CCC.CVE_COMISION,'
      
        #9#9#9#9#9'                                   TO_DATE('#39'31/01/2009'#39','#39'DD' +
        '/MM/YYYY'#39'), '#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST, '
      
        '                      NVL( PKGCRCOMUN.STPOBTIMPPAGADO( '#39'CN'#39', '#39'IM' +
        'PIVA'#39', CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,'
      
        #9#9#9#9#9'                                   TO_DATE('#39'31/01/2009'#39','#39'DD' +
        '/MM/YYYY'#39'), '#39'V'#39' ), 0 ) AS IMP_IVA_PAG_HIST '
      '                 FROM (SELECT CCC.* FROM CR_COMISION CCC '
      '                       WHERE 1 = 1'
      '                       AND   CCC.SIT_COMISION NOT IN ('#39'CA'#39','#39'LQ'#39')'
      
        '                       AND CCC.F_VENCIMIENTO =TO_DATE('#39'31/01/200' +
        '9'#39','#39'DD/MM/YYYY'#39')'
      '                      ) CCC,'
      #9#9#9#9#9'  CR_CAT_COMISION CCCO'
      '                WHERE  CCCO.CVE_COMISION = CCC.CVE_COMISION  '
      #9#9'      ) PRCN  '
      '       ) GENERAL,  '
      '      CR_CREDITO CC,'
      '      CR_CONTRATO       CCTO,'
      '      CONTRATO          CTO,'
      '      MONEDA            M,'
      '      PERSONA           PPR,'
      '      PERSONA           PPRC,'
      '      PERSONA           PCE,'
      '      DOMICILIO         D'
      'WHERE 1 = 1'
      'AND CC.ID_CONTRATO         = CCTO.ID_CONTRATO'
      'AND CC.FOL_CONTRATO        = CCTO.FOL_CONTRATO'
      'AND CC.SIT_CREDITO         NOT IN ('#39'LQ'#39','#39'CA'#39')'
      'AND CC.ID_CREDITO          = 175635'
      'AND CTO.ID_CONTRATO        = CCTO.ID_CONTRATO'
      'AND CTO.ID_EMPRESA         = 2'
      'AND CC.ID_CONTRATO         = CTO.ID_CONTRATO '
      'AND GENERAL.ID_CREDITO     = CC.ID_CREDITO         '
      'AND   M.CVE_MONEDA          = CTO.CVE_MONEDA '
      'AND   PPR.ID_PERSONA        = CC.ID_PROM_ADM '
      'AND   PPRC.ID_PERSONA       = CTO.ID_PERS_ASOCIAD  '
      'AND   PCE.ID_PERSONA     (+)= CTO.ID_TITULAR '
      'AND   D.ID_DOMICILIO        = PCE.ID_DOM_FISCAL'
      
        'ORDER BY DESC_MONEDA, CTO.ID_PERS_ASOCIAD, PPR.ID_PERSONA, CCTO.' +
        'CVE_PRODUCTO_CRE, PCE.NOMBRE, CC.ID_CREDITO,'
      
        '         GENERAL.TIPO_CARTERA,  GENERAL.SUB_ORDEN, GENERAL.ACCES' +
        'ORIO, GENERAL.NUM_PERIODO'
      ' '
      ' '
      ' '
      ' ')
    Left = 157
    Top = 23
    object qyProgVenID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyProgVenACCESORIO: TStringField
      FieldName = 'ACCESORIO'
      Size = 80
    end
    object qyProgVenNUM_PERIODO: TFloatField
      FieldName = 'NUM_PERIODO'
    end
    object qyProgVenF_INICIO: TDateTimeField
      FieldName = 'F_INICIO'
    end
    object qyProgVenF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qyProgVenF_PROG_PAGO: TDateTimeField
      FieldName = 'F_PROG_PAGO'
    end
    object qyProgVenF_PAGO: TDateTimeField
      FieldName = 'F_PAGO'
    end
    object qyProgVenNUM_PERIODO_PER: TFloatField
      FieldName = 'NUM_PERIODO_PER'
    end
    object qyProgVenPLAZO: TFloatField
      FieldName = 'PLAZO'
    end
    object qyProgVenTASA_APLICADA: TFloatField
      FieldName = 'TASA_APLICADA'
    end
    object qyProgVenIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object qyProgVenIMP_IVA: TFloatField
      FieldName = 'IMP_IVA'
    end
    object qyProgVenSIT_PERIODO: TStringField
      FieldName = 'SIT_PERIODO'
      Size = 2
    end
    object qyProgVenIMP_BINTER: TFloatField
      FieldName = 'IMP_BINTER'
    end
    object qyProgVenIMP_FEGA: TFloatField
      FieldName = 'IMP_FEGA'
    end
    object qyProgVenIMP_TOTAL: TFloatField
      FieldName = 'IMP_TOTAL'
    end
    object qyProgVenMORATORIOS: TFloatField
      FieldName = 'MORATORIOS'
    end
    object qyProgVenID_PROM_ADM: TFloatField
      FieldName = 'ID_PROM_ADM'
    end
    object qyProgVenNOM_PROMOTOR_ADM: TStringField
      FieldName = 'NOM_PROMOTOR_ADM'
      Size = 80
    end
    object qyProgVenCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyProgVenDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyProgVenCVE_PRODUCTO_CRE: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 6
    end
    object qyProgVenDESC_L_PRODUCTO: TStringField
      FieldName = 'DESC_L_PRODUCTO'
      Size = 80
    end
    object qyProgVenID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object qyProgVenNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qyProgVenTIPO_CARTERA: TStringField
      FieldName = 'TIPO_CARTERA'
      FixedChar = True
      Size = 1
    end
    object qyProgVenID_PERS_ASOCIAD: TFloatField
      FieldName = 'ID_PERS_ASOCIAD'
    end
    object qyProgVenNOM_PROMOTOR_ASO: TStringField
      FieldName = 'NOM_PROMOTOR_ASO'
      Size = 80
    end
    object qyProgVenID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qyProgVenSDO_INSOLUTO: TFloatField
      FieldName = 'SDO_INSOLUTO'
    end
    object qyProgVenSDO_VIG_TOTAL: TFloatField
      FieldName = 'SDO_VIG_TOTAL'
    end
    object qyProgVenIMP_CREDITO: TFloatField
      FieldName = 'IMP_CREDITO'
    end
    object qyProgVenCUENTA_BANCO: TStringField
      FieldName = 'CUENTA_BANCO'
    end
    object qyProgVenSALDO_AL: TFloatField
      FieldName = 'SALDO_AL'
    end
    object qyProgVenDIRECCION: TStringField
      FieldName = 'DIRECCION'
      Size = 164
    end
    object qyProgVenCOLONIA: TStringField
      FieldName = 'COLONIA'
      Size = 40
    end
    object qyProgVenCIUDAD: TStringField
      FieldName = 'CIUDAD'
      Size = 40
    end
    object qyProgVenESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 40
    end
    object qyProgVenPAIS: TStringField
      FieldName = 'PAIS'
      Size = 40
    end
    object qyProgVenCP: TStringField
      FieldName = 'CP'
      Size = 6
    end
    object qyProgVenTEL_CASA: TStringField
      FieldName = 'TEL_CASA'
      Size = 12
    end
    object qyProgVenFAX: TStringField
      FieldName = 'FAX'
      Size = 12
    end
    object qyProgVenTEL_OFNA: TStringField
      FieldName = 'TEL_OFNA'
      Size = 12
    end
    object qyProgVenE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 60
    end
  end
end
