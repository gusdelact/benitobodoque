object QRCrCartDiv: TQRCrCartDiv
  Left = 0
  Top = -231
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = QDatos
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
  object TitleBand1: TQRBand
    Left = 38
    Top = 38
    Width = 740
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
      1957.91666666667)
    BandType = rbTitle
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
        1957.91666666667)
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
    Width = 740
    Height = 103
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
      272.520833333333
      1957.91666666667)
    BandType = rbColumnHeader
    object QRLabel1: TQRLabel
      Left = 0
      Top = 83
      Width = 176
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        0
        219.604166666667
        465.666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Plazo'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 0
      Top = 66
      Width = 176
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        0
        174.625
        465.666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 180
      Top = 66
      Width = 107
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        476.25
        174.625
        283.104166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Máximo'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 180
      Top = 84
      Width = 107
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        476.25
        222.25
        283.104166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 292
      Top = 48
      Width = 314
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        772.583333333333
        127
        830.791666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Real'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 406
      Top = 67
      Width = 111
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1074.20833333333
        177.270833333333
        293.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Dólares'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 292
      Top = 67
      Width = 112
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        772.583333333333
        177.270833333333
        296.333333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Moneda Nal.'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 614
      Top = 67
      Width = 121
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1624.54166666667
        177.270833333333
        320.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 614
      Top = 84
      Width = 121
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1624.54166666667
        222.25
        320.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cumplimiento'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 519
      Top = 67
      Width = 87
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1373.1875
        177.270833333333
        230.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel12: TQRLabel
      Left = 292
      Top = 85
      Width = 314
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        772.583333333333
        224.895833333333
        830.791666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLCarta: TQRLabel
      Left = 8
      Top = 8
      Width = 345
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        21.1666666666667
        21.1666666666667
        912.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLCarta'
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
    object QRLIntereses: TQRLabel
      Left = 360
      Top = 8
      Width = 369
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        952.5
        21.1666666666667
        976.3125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLIntereses'
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
  end
  object DetailBand1: TQRBand
    Left = 38
    Top = 225
    Width = 740
    Height = 31
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
      82.0208333333333
      1957.91666666667)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 0
      Top = 8
      Width = 176
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.9791666666667
        0
        21.1666666666667
        465.666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'IdPlazo'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 181
      Top = 8
      Width = 106
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.9791666666667
        478.895833333333
        21.1666666666667
        280.458333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Maximo'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 292
      Top = 8
      Width = 111
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.9791666666667
        772.583333333333
        21.1666666666667
        293.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Pct_Saldo_Pesos'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText5: TQRDBText
      Left = 406
      Top = 8
      Width = 111
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.9791666666667
        1074.20833333333
        21.1666666666667
        293.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Pct_Saldo_Dls'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText6: TQRDBText
      Left = 616
      Top = 8
      Width = 121
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.9791666666667
        1629.83333333333
        21.1666666666667
        320.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Cumplimiento'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText3: TQRDBText
      Left = 519
      Top = 8
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.9791666666667
        1373.1875
        21.1666666666667
        232.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Total'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object SummaryBand1: TQRBand
    Left = 38
    Top = 256
    Width = 740
    Height = 24
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
      63.5
      1957.91666666667)
    BandType = rbSummary
    object QRLabel11: TQRLabel
      Left = 185
      Top = 0
      Width = 102
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        489.479166666667
        0
        269.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRExpr1: TQRExpr
      Left = 293
      Top = 0
      Width = 111
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        775.229166666667
        0
        293.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'Sum(QDatos.Pct_Saldo_Pesos)'
      Mask = '###.00'
      FontSize = 10
    end
    object QRExpr2: TQRExpr
      Left = 407
      Top = 0
      Width = 111
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1076.85416666667
        0
        293.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'Sum(QDatos.Pct_Saldo_Dls)'
      Mask = '###.00'
      FontSize = 10
    end
    object QRExpr3: TQRExpr
      Left = 522
      Top = 0
      Width = 87
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
        230.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'Sum(QDatos.Total)'
      Mask = '###.00'
      FontSize = 10
    end
  end
  object QRChildBand1: TQRChildBand
    Left = 38
    Top = 280
    Width = 740
    Height = 59
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
      156.104166666667
      1957.91666666667)
    ParentBand = SummaryBand1
    object QRLabel13: TQRLabel
      Left = 292
      Top = 21
      Width = 112
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        772.583333333333
        55.5625
        296.333333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Moneda Nal.'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel14: TQRLabel
      Left = 406
      Top = 21
      Width = 111
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1074.20833333333
        55.5625
        293.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Dólares'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel15: TQRLabel
      Left = 519
      Top = 21
      Width = 87
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1373.1875
        55.5625
        230.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel16: TQRLabel
      Left = 292
      Top = 39
      Width = 314
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        772.583333333333
        103.1875
        830.791666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRChildBand2: TQRChildBand
    Left = 38
    Top = 339
    Width = 740
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
      1957.91666666667)
    ParentBand = QRChildBand1
    object QRDBText7: TQRDBText
      Left = 181
      Top = 8
      Width = 106
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.9791666666667
        478.895833333333
        21.1666666666667
        280.458333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos2
      DataField = 'Saldo'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText8: TQRDBText
      Left = 292
      Top = 8
      Width = 111
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.9791666666667
        772.583333333333
        21.1666666666667
        293.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos2
      DataField = 'Pct_Saldo_Imp_Nal'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText9: TQRDBText
      Left = 406
      Top = 8
      Width = 111
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.9791666666667
        1074.20833333333
        21.1666666666667
        293.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos2
      DataField = 'Pct_Saldo_Imp_Dls'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText10: TQRDBText
      Left = 519
      Top = 8
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.9791666666667
        1373.1875
        21.1666666666667
        232.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos2
      DataField = 'Pct_Total'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRChart1: TQRChart
    Left = 40
    Top = 528
    Width = 731
    Height = 341
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      902.229166666667
      105.833333333333
      1397
      1934.10416666667)
    object QRDBChart1: TQRDBChart
      Left = -1
      Top = -1
      Width = 1
      Height = 1
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Title.Text.Strings = (
        'Cartera por Divisas ')
      LeftAxis.AxisValuesFormat = '#,##0,###'
      object Series1: TBarSeries
        Marks.ArrowLength = 20
        Marks.Visible = False
        DataSource = QDatos
        PercentFormat = '##0,## %'
        SeriesColor = clRed
        Title = 'Pct Saldo Moneda Nal.'
        ValueFormat = '#,##0,###'
        XLabelsSource = 'IdPlazo'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        YValues.ValueSource = 'Pct_Saldo_pesos'
      end
      object Series2: TBarSeries
        Marks.ArrowLength = 20
        Marks.Visible = False
        DataSource = QDatos
        SeriesColor = clGreen
        Title = 'Pct Saldo Dólares'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        YValues.ValueSource = 'Pct_Saldo_Dls'
      end
      object Series3: TBarSeries
        Marks.ArrowLength = 20
        Marks.Visible = False
        DataSource = QDatos
        SeriesColor = clYellow
        Title = 'Máximo '
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        YValues.ValueSource = 'Maximo'
      end
    end
  end
  object QDatos: TQuery
    SQL.Strings = (
      'Select C1.IdPlazo,'
      '       C1.Maximo    Maximo,'
      '       C1.B_Total,'
      '       C1.B_Valida,'
      '       C1.Saldo_Pesos,'
      '       C1.Saldo_Dolares,'
      
        '       Round (C1.Saldo_Pesos   / C2.Saldo_Total_Pesos * 100, 2) ' +
        '  Pct_Saldo_Pesos,'
      
        '       Round (C1.Saldo_Dolares / C2.Saldo_Total_Dls   * 100, 2) ' +
        '  Pct_Saldo_Dls, '
      
        '       Round ((C1.Saldo_Pesos   + C1.Saldo_Dolares) / ( C2.Saldo' +
        '_Total_Pesos +C2.Saldo_Total_Dls  )* 100, 2)  Total, '
      '       Case When  C1.B_Total =  1 Then Null'
      '            When Round ((C1.Saldo_Pesos   + C1.Saldo_Dolares) / '
      
        '                         ( C2.Saldo_Total_Pesos +C2.Saldo_Total_' +
        'Dls  )* 100, 2)  < C1.Maximo Then '#39'SI'#39' Else '#39'NO'#39' End Cumplimient' +
        'o,'
      '       C2.Saldo_Total_Pesos,'
      '       C2.Saldo_Total_dls'
      '  From ('
      '        Select IdPlazo,'
      '              Maximo,'
      '              Sum (Saldo_Pesos)  Saldo_Pesos,'
      '              Sum (Saldo_Dls)    Saldo_Dolares,'
      '              Grouping (IdPlazo)  B_Total ,'
      '              Grouping (Maximo)   B_Valida,'
      
        '              Case When Grouping (IdPlazo) = 1 Then Sum (Saldo_P' +
        'esos) End  Saldo_Total_Pesos,   '
      
        '              Case When Grouping (IdPlazo) = 1 Then Sum (Saldo_d' +
        'ls)   End  Saldo_Total_Dls'
      '         From ('
      '               Select IdPlazo,'
      '                      Maximo,'
      '                      Moneda,'
      
        '                      Case When Moneda = '#39'Pesos'#39'     Then Nvl (S' +
        'um (Saldo), 0) Else 0 end Saldo_Pesos,'
      
        '                      Case When Moneda = '#39'Dolares'#39'   Then Nvl (S' +
        'um (Saldo * PKGCRCONSOLIDADO1.FNC_OBT_TIPO_CAMBIO_REGUL '
      
        '                                                             (84' +
        '0, '#39'D000'#39', Extract (Year From :peFecha),'
      
        '                                                                ' +
        '                     Extract (Month From :peFecha))),0)'
      
        '                                                                ' +
        '             Else 0 end Saldo_Dls        '
      '                From ('
      '                      Select Plazo,'
      
        '                             Case When Plazo <= 180             ' +
        ' Then '#39'Hasta 180 días'#39
      
        '                                  When Plazo Between 181 And 365' +
        ' Then '#39'Entre 180 y 365 días'#39
      
        '                                  When Plazo Between 366 And 720' +
        ' Then '#39'Entre 365 y 720 días'#39
      
        '                                  When Plazo > 720              ' +
        ' Then '#39'Más de 720 días'#39'       End IdPlazo,'
      
        '                             Case When Plazo <= 180             ' +
        '      Then 5'
      
        '                                  When Plazo Between 181 And 365' +
        ' Then 10 '
      
        '                                  When Plazo Between 366 And 720' +
        ' Then 15  '
      
        '                                  When Plazo > 720              ' +
        ' Then 20                      End Maximo,'
      
        '                             Case When Cve_Moneda = 484         ' +
        ' Then '#39'Pesos'#39
      
        '                                  When Cve_Moneda = 840         ' +
        ' Then '#39'Dolares'#39'               End Moneda,'
      
        '                             Imp_Cap_Vig + Imp_Cap_Imp + Imp_Int' +
        '_Vig + Imp_Int_Imp            Saldo'
      
        '                        From Table (Pkgcrgpviews.VW_CR_GP_Saldos' +
        '_Edos_Mun(:peFecha,:peTipo_Entidad))'
      
        '                       Where Fol_Contrato = 1 And F_Vencimiento ' +
        'Is Not Null'
      '                     )    '
      '               Group By (IdPlazo, Maximo, Moneda)'
      '              )'
      '        Group By RollUp(IdPlazo, Maximo) )C1'
      '  Left Outer  Join '
      '       (Select IdPlazo,'
      '               Maximo,'
      '               Sum (Saldo_Pesos)  Saldo_Pesos,'
      '               Sum (Saldo_Dls)    Saldo_Dolares,'
      '               Grouping (IdPlazo)  B_Total ,'
      '               Grouping (Maximo)   B_Valida,'
      
        '               Case When Grouping (IdPlazo) = 1 Then Decode (Sum' +
        ' (Saldo_Pesos),0,1, Sum (Saldo_Pesos)) End  Saldo_Total_Pesos,  ' +
        ' '
      
        '               Case When Grouping (IdPlazo) = 1 Then Decode (Sum' +
        ' (Saldo_dls)  ,0,1, Sum (Saldo_dls )) End  Saldo_Total_Dls'
      '          From ('
      '                Select IdPlazo,'
      '                       Maximo,'
      '                       Moneda,'
      
        '                       Case When Moneda = '#39'Pesos'#39'   Then Nvl (Su' +
        'm (Saldo),0) Else 0 end Saldo_Pesos,'
      
        '                       Case When Moneda = '#39'Dolares'#39' Then Nvl (Su' +
        'm (Saldo * PKGCRCONSOLIDADO1.FNC_OBT_TIPO_CAMBIO_REGUL '
      
        '                                                             (84' +
        '0, '#39'D000'#39', Extract (Year From :peFecha),'
      
        '                                                                ' +
        '                     Extract (Month From :peFecha))),0)'
      
        '                                                                ' +
        '            Else 0 end Saldo_Dls        '
      '                 From ('
      '                       Select Plazo,'
      
        '                              Case When Plazo <= 180            ' +
        '  Then '#39'Hasta 180 días'#39
      
        '                                   When Plazo Between 181 And 36' +
        '5 Then '#39'Entre 180 y 365 días'#39
      
        '                                   When Plazo Between 366 And 72' +
        '0 Then '#39'Entre 365 y 720 días'#39
      
        '                                   When Plazo > 720             ' +
        '  Then '#39'Más de 720 días'#39'      End IdPlazo,'
      
        '                              Case When Plazo <= 180            ' +
        '  Then 5'
      
        '                                   When Plazo Between 181 And 36' +
        '5 Then 10'
      
        '                                   When Plazo Between 366 And 72' +
        '0 Then 15'
      
        '                                   When Plazo > 720             ' +
        '  Then 20                     End Maximo,'
      
        '                              Case When Cve_Moneda = 484 Then '#39'P' +
        'esos'#39
      
        '                                   When Cve_Moneda = 840 Then '#39'D' +
        'olares'#39'                       End Moneda,'
      
        '                              Imp_Cap_Vig + Imp_Cap_Imp + Imp_In' +
        't_Vig + Imp_Int_Imp  Saldo'
      
        '                         From Table (Pkgcrgpviews.VW_CR_GP_Saldo' +
        's_Edos_Mun(:peFecha, :peTipo_Entidad))'
      
        '                        Where Fol_Contrato = 1 And F_Vencimiento' +
        ' Is Not Null'
      '                      )    '
      '                Group By (IdPlazo, Maximo, Moneda)'
      '               )'
      '             Group By RollUp(IdPlazo, Maximo)'
      '        ) C2 On  C2.B_Total = 1 '
      '   Where  C1.B_Valida = 0      '
      '   Order By C1.Maximo')
    Left = 237
    Top = 6
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
    object QDatosPct_Saldo_pesos: TFloatField
      FieldName = 'Pct_Saldo_pesos'
    end
    object QDatosPct_Saldo_Dls: TFloatField
      FieldName = 'Pct_Saldo_Dls'
    end
    object QDatosMaximo: TFloatField
      FieldName = 'Maximo'
    end
    object QDatosIdPlazo: TStringField
      FieldName = 'IdPlazo'
    end
    object QDatosTotal: TFloatField
      FieldName = 'Total'
    end
    object QDatosCumplimiento: TStringField
      FieldName = 'Cumplimiento'
    end
  end
  object QDatos2: TQuery
    SQL.Strings = (
      
        '  Select '#39'Impagado'#39'                                             ' +
        '                                                                ' +
        'Saldo, '
      '          Saldo_Imp_Nal,'
      
        '          Saldo_Imp_Nal / Decode (Saldo_Imp_Nal, 0, 1, Saldo_Imp' +
        '_Nal) * 100                                                     ' +
        'Pct_Saldo_Imp_Nal,'
      '          Saldo_Imp_Dls,'
      
        '          Saldo_Imp_Dls / Decode (Saldo_Imp_Dls, 0, 1, Saldo_Imp' +
        '_Dls) * 100                                                     ' +
        'Pct_Saldo_Imp_Dls,'
      
        '          Saldo_Imp_Nal +  Saldo_Imp_Dls                        ' +
        '                                                                ' +
        'Total,'
      
        '          (Saldo_Imp_Nal + Saldo_Imp_Dls) / Decode((Saldo_Imp_Na' +
        'l + Saldo_Imp_Dls), 0, 1,(Saldo_Imp_Nal + Saldo_Imp_Dls)) * 100 ' +
        'Pct_Total'
      '     From (      '
      '           Select '#39'Impagado'#39'  Saldo, '
      
        '                  Nvl (Max (Case When Moneda =    484 Then    Sa' +
        'ldo_Imp End), 0)                                Saldo_Imp_Nal,'
      
        '                  Nvl (Max (Case When Moneda =    840 Then    Nv' +
        'l(Saldo_Imp, 0) * '
      
        '                                                              Pk' +
        'gCrConsolidado1.Fnc_Obt_Tipo_Cambio_Regul('
      
        '                                                                ' +
        '                840, '
      
        '                                                                ' +
        '                '#39'D000'#39', '
      
        '                                                                ' +
        '                Extract (Year From :peFecha), '
      
        '                                                                ' +
        '                Extract (Month From :peFecha))  '
      
        '                                                                ' +
        '                End),0)                         Saldo_Imp_Dls'
      '             From ('
      
        '                   Select Nvl(Sum (Imp_Cap_Imp + Imp_Int_Imp),0)' +
        '  Saldo_Imp,    '
      
        '                          Cve_Moneda                       Moned' +
        'a                                                  '
      
        '                     From Table (Pkgcrgpviews.VW_CR_GP_Saldos_Ed' +
        'os_Mun(:peFecha, :peTipo_Entidad))'
      
        '                    Where Fol_Contrato = 1 And F_Vencimiento Is ' +
        'Not Null'
      '                    Group By RollUp (Cve_Moneda)'
      '                  )'
      '          )'
      '')
    Left = 294
    Top = 124
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
    object QDatos2Saldo: TStringField
      FieldName = 'Saldo'
    end
    object QDatos2Pct_Saldo_Imp_Nal: TFloatField
      FieldName = 'Pct_Saldo_Imp_Nal'
    end
    object QDatos2Pct_Saldo_Imp_Dls: TFloatField
      FieldName = 'Pct_Saldo_Imp_Dls'
    end
    object QDatos2Pct_Total: TFloatField
      FieldName = 'Pct_Total'
    end
  end
  object QLeyendaEntidades: TQuery
    SQL.Strings = (
      
        'Select '#39'Incluye información: '#39' || InitCap (Replace (Replace (Nvl' +
        ' (:peTipo_Entidad, PkgCRGPViews.Todas_Entidades), '#39'ORG-DESC'#39', '#39'Ó' +
        'rganos descentralizados'#39'), '#39'|'#39', '#39', '#39')) Leyenda_Entidades'
      '  From Dual             ')
    Left = 254
    Top = 82
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
  end
end
