object QIntCrQrCrtScPu: TQIntCrQrCrtScPu
  Left = 0
  Top = 0
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
    'REPORTTITLE'
    'QRLOOPBAND1')
  Functions.DATA = (
    '0'
    '0'
    #39#39
    '0')
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
  Units = Inches
  Zoom = 100
  object PageHeaderBand1: TQRBand
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
  object QRGroup1: TQRGroup
    Left = 38
    Top = 193
    Width = 740
    Height = 5
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
      13.2291666666667
      1957.91666666667)
    Expression = 'SECTOR'
    FooterBand = QRGroupFooter1
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRDetail1: TQRBand
    Left = 38
    Top = 198
    Width = 740
    Height = 23
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
      60.8541666666667
      1957.91666666667)
    BandType = rbDetail
    object QRDBText8: TQRDBText
      Left = 168
      Top = 3
      Width = 289
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        444.5
        7.9375
        764.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Desc_Subsector'
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
    object QRDBText9: TQRDBText
      Left = 464
      Top = 3
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1227.66666666667
        7.9375
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Pct_Maximo'
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
    object QRDBText10: TQRDBText
      Left = 536
      Top = 3
      Width = 72
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1418.16666666667
        7.9375
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Imp_Real'
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
    object QRDBText11: TQRDBText
      Left = 609
      Top = 3
      Width = 42
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1611.3125
        7.9375
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Pct_Real'
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
    object QRDBText12: TQRDBText
      Left = 657
      Top = 3
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1738.3125
        7.9375
        211.666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Cumplimiento'
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
    object QRDBText1: TQRDBText
      Left = 0
      Top = 3
      Width = 89
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        0
        7.9375
        235.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Desc_Sector'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText2: TQRDBText
      Left = 96
      Top = 3
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        254
        7.9375
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Pct_Max_Sector'
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
  object QRGroupFooter1: TQRBand
    Left = 38
    Top = 221
    Width = 740
    Height = 20
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
      52.9166666666667
      1957.91666666667)
    BandType = rbGroupFooter
    object QRLabel9: TQRLabel
      Left = 168
      Top = 0
      Width = 361
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        444.5
        0
        955.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = 2631720
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRExpr1: TQRExpr
      Left = 536
      Top = 0
      Width = 72
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1418.16666666667
        0
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Color = 2631720
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'Sum(Imp_Real)'
      Mask = '###,###,###,###,###.00'
      FontSize = 10
    end
    object QRExpr2: TQRExpr
      Left = 609
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
        1611.3125
        0
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Color = 2631720
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'Sum(Pct_Real)'
      Mask = '###,###,###,###,###.00'
      FontSize = 10
    end
    object QRLabel15: TQRLabel
      Left = 657
      Top = 0
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1738.3125
        0
        211.666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = 2631720
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRBand1: TQRBand
    Left = 38
    Top = 241
    Width = 740
    Height = 73
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
      193.145833333333
      1957.91666666667)
    BandType = rbSummary
    object QRExpr4: TQRExpr
      Left = 536
      Top = 0
      Width = 72
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1418.16666666667
        0
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Color = 2631720
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'Sum(Imp_Real)'
      Mask = '###,###,###,###,###.00'
      FontSize = 10
    end
    object QRLeyendaMoneda: TQRLabel
      Left = 0
      Top = 24
      Width = 737
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        0
        63.5
        1949.97916666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLeyendaMoneda'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel16: TQRLabel
      Left = 609
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
        1611.3125
        0
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '100.00'
      Color = 2631720
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object ColumnHeaderBand1: TQRBand
    Left = 38
    Top = 122
    Width = 740
    Height = 71
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
      187.854166666667
      1957.91666666667)
    BandType = rbColumnHeader
    object QRLabel12: TQRLabel
      Left = 0
      Top = 32
      Width = 89
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        0
        84.6666666666667
        235.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = 2631720
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel1: TQRLabel
      Left = 0
      Top = 48
      Width = 89
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        0
        127
        235.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Sector'
      Color = 2631720
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 96
      Top = 32
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        254
        84.6666666666667
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Máximo'
      Color = 2631720
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 96
      Top = 48
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        254
        127
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = 2631720
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel13: TQRLabel
      Left = 168
      Top = 32
      Width = 289
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        444.5
        84.6666666666667
        764.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = 2631720
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 168
      Top = 48
      Width = 289
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        444.5
        127
        764.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Subsector'
      Color = 2631720
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 464
      Top = 32
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1227.66666666667
        84.6666666666667
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Máximo'
      Color = 2631720
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel11: TQRLabel
      Left = 464
      Top = 48
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1227.66666666667
        127
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = 2631720
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 536
      Top = 32
      Width = 115
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1418.16666666667
        84.6666666666667
        304.270833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Real'
      Color = 2631720
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 536
      Top = 48
      Width = 72
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1418.16666666667
        127
        190.5)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '$'
      Color = 2631720
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 609
      Top = 48
      Width = 42
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1611.3125
        127
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = 2631720
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel14: TQRLabel
      Left = 657
      Top = 32
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1738.3125
        84.6666666666667
        211.666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = 2631720
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 657
      Top = 48
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1738.3125
        127
        211.666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cumplimiento'
      Color = 2631720
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLCartas: TQRLabel
      Left = 1
      Top = 1
      Width = 360
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2.64583333333333
        2.64583333333333
        952.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLCartas'
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
      Left = 368
      Top = 1
      Width = 370
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        973.666666666667
        2.64583333333333
        978.958333333333)
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
  object QDatos: TQuery
    SQL.Strings = (
      'Select Sector,'
      
        '       Case When Renglon = 1 Then Desc_Sector    Else Null End  ' +
        '        Desc_Sector,'
      
        '       Case When Renglon = 1 Then Pct_Max_Sector Else Null End  ' +
        '        Pct_Max_Sector,'
      '       Subsector,'
      '       Desc_Subsector,'
      '       Pct_Maximo,'
      '       Imp_Real,'
      '       Pct_Real,'
      '       Cumplimiento'
      '  From ('
      '        Select Sector, '
      '               Desc_Sector,'
      '               Subsector,'
      '               Desc_Subsector,'
      '               Pct_Max_Sector,'
      
        '               Row_Number ()    Over (Partition By Sector Order ' +
        'By Subsector)     Renglon,     '
      '               Pct_Maximo,'
      '               Imp_Real,'
      '               Pct_Real,'
      '               Cumplimiento'
      '          From ('
      
        '                Select 1                                        ' +
        '                Sector,'
      
        '                       '#39'Primario'#39'                               ' +
        '                Desc_Sector,'
      
        '                       1                                        ' +
        '                Subsector,'
      
        '                       7.5                                      ' +
        '                Pct_Max_Sector, '
      
        '                       '#39'Agricultura, ganadería, silvicultura y p' +
        'esca'#39'           Desc_Subsector,'
      
        '                       7.5                                      ' +
        '                Pct_Maximo,'
      
        '                       Null                                     ' +
        '                Imp_Real,'
      
        '                       Null                                     ' +
        '                Pct_Real,'
      
        '                       Null                                     ' +
        '                Cumplimiento'
      '                  From Dual'
      '                Union'
      
        '                Select 2                                        ' +
        '                Sector,'
      
        '                       '#39'Secundario'#39'                             ' +
        '                Desc_Sector,'
      
        '                       1                                        ' +
        '                Subsector, '
      
        '                       50                                       ' +
        '                Pct_Max_Sector, '
      
        '                       '#39'Construcción'#39'                           ' +
        '                Desc_Subsector,'
      
        '                       20                                       ' +
        '                Pct_Maximo,'
      
        '                       Null                                     ' +
        '                Imp_Real,'
      
        '                       Null                                     ' +
        '                Pct_Real,'
      
        '                       Null                                     ' +
        '                Cumplimiento'
      '                  From Dual'
      '                Union'
      
        '                Select 2                                        ' +
        '                Sector,'
      
        '                       '#39'Secundario'#39'                             ' +
        '                Desc_Sector,'
      
        '                       2                                        ' +
        '                Subsector, '
      
        '                       50                                       ' +
        '                Pct_Max_Sector, '
      
        '                       '#39'Generación de energía eléctrica y consum' +
        'o de agua'#39'      Desc_Subsector,'
      
        '                       10                                       ' +
        '                Pct_Maximo,'
      
        '                       Null                                     ' +
        '                Imp_Real,'
      
        '                       Null                                     ' +
        '                Pct_Real,'
      
        '                       Null                                     ' +
        '                Cumplimiento'
      '                  From Dual'
      '                Union'
      
        '                Select 2                                        ' +
        '                Sector,'
      
        '                       '#39'Secundario'#39'                             ' +
        '                Desc_Sector,'
      
        '                       3                                        ' +
        '                Subsector, '
      
        '                       50                                       ' +
        '                Pct_Max_Sector, '
      
        '                       '#39'Minería'#39'                                ' +
        '                Desc_Subsector,'
      
        '                       5                                        ' +
        '                Pct_Maximo,'
      
        '                       Null                                     ' +
        '                Imp_Real,'
      
        '                       Null                                     ' +
        '                Pct_Real,'
      
        '                       Null                                     ' +
        '                Cumplimiento'
      '                  From Dual'
      '                Union'
      
        '                Select 2                                        ' +
        '                Sector,'
      
        '                       '#39'Secundario'#39'                             ' +
        '                Desc_Sector,'
      
        '                       4                                        ' +
        '                Subsector, '
      
        '                       50                                       ' +
        '                Pct_Max_Sector, '
      
        '                       '#39'Industrias Manufactureras'#39'              ' +
        '                Desc_Subsector,'
      
        '                       20                                       ' +
        '                Pct_Maximo,'
      
        '                       Null                                     ' +
        '                Imp_Real,'
      
        '                       Null                                     ' +
        '                Pct_Real,'
      
        '                       Null                                     ' +
        '                Cumplimiento'
      '                  From Dual'
      '                Union'
      
        '                Select 3                                        ' +
        '                Sector,'
      
        '                       '#39'Terciario'#39'                              ' +
        '                Desc_Sector,'
      
        '                       1                                        ' +
        '                Subsector, '
      
        '                       100                                      ' +
        '                Pct_Max_Sector, '
      
        '                       '#39'Sector público, federal, estatal y munic' +
        'ipal'#39'           Desc_Subsector,'
      
        '                       80                                       ' +
        '                Pct_Maximo,'
      
        '                       Null                                     ' +
        '                Imp_Real,'
      
        '                       Null                                     ' +
        '                Pct_Real,'
      
        '                       Null                                     ' +
        '                Cumplimiento'
      '                  From Dual'
      '                Union'
      
        '                Select 3                                        ' +
        '                Sector,'
      
        '                       '#39'Terciario'#39'                              ' +
        '                Desc_Sector,'
      
        '                       2                                        ' +
        '                Subsector, '
      
        '                       100                                      ' +
        '                Pct_Max_Sector, '
      
        '                       '#39'Servicios financieros'#39'                  ' +
        '                Desc_Subsector,'
      
        '                       30                                       ' +
        '                Pct_Maximo,'
      
        '                       Null                                     ' +
        '                Imp_Real,'
      
        '                       Null                                     ' +
        '                Pct_Real,'
      
        '                       Null                                     ' +
        '                Cumplimiento'
      '                  From Dual'
      '                Union'
      
        '                Select 3                                        ' +
        '                Sector,'
      
        '                       '#39'Terciario'#39'                              ' +
        '                Desc_Sector,'
      
        '                       3                                        ' +
        '                Subsector, '
      
        '                       100                                      ' +
        '                Pct_Max_Sector, '
      
        '                       '#39'Comercio'#39'                               ' +
        '                Desc_Subsector,'
      
        '                       10                                       ' +
        '                Pct_Maximo,'
      
        '                       Null                                     ' +
        '                Imp_Real,'
      
        '                       Null                                     ' +
        '                Pct_Real,'
      
        '                       Null                                     ' +
        '                Cumplimiento'
      '                  From Dual'
      '                Union'
      
        '                Select 3                                        ' +
        '                Sector,'
      
        '                       '#39'Terciario'#39'                              ' +
        '                Desc_Sector,'
      
        '                       4                                        ' +
        '                Subsector, '
      
        '                       100                                      ' +
        '                Pct_Max_Sector, '
      
        '                       '#39'Servicios inmobiliarios'#39'                ' +
        '                Desc_Subsector,'
      
        '                       5                                        ' +
        '                Pct_Maximo,'
      
        '                       Null                                     ' +
        '                Imp_Real,'
      
        '                       Null                                     ' +
        '                Pct_Real,'
      
        '                       Null                                     ' +
        '                Cumplimiento'
      '                  From Dual'
      '                Union'
      
        '                Select 3                                        ' +
        '                Sector,'
      
        '                       '#39'Terciario'#39'                              ' +
        '                Desc_Sector,'
      
        '                       5                                        ' +
        '                Subsector, '
      
        '                       100                                      ' +
        '                Pct_Max_Sector, '
      
        '                       '#39'Otros Servicios'#39'                        ' +
        '                Desc_Subsector,'
      
        '                       5                                        ' +
        '                Pct_Maximo,'
      
        '                       Null                                     ' +
        '                Imp_Real,'
      
        '                       Null                                     ' +
        '                Pct_Real,'
      
        '                       Null                                     ' +
        '                Cumplimiento'
      '                  From Dual'
      '                Union'
      
        '                Select 3                                        ' +
        '                Sector,'
      
        '                       '#39'Terciario'#39'                              ' +
        '                Desc_Sector,'
      
        '                       6                                        ' +
        '                Subsector, '
      
        '                       100                                      ' +
        '                Pct_Max_Sector, '
      
        '                       '#39'Otros'#39'                                  ' +
        '                Desc_Subsector,'
      
        '                       10                                       ' +
        '                Pct_Maximo,'
      
        '                       Null                                     ' +
        '                Imp_Real,'
      
        '                       Null                                     ' +
        '                Pct_Real,'
      
        '                       Null                                     ' +
        '                Cumplimiento'
      '                  From Dual'
      '               )'
      '          Order By Sector, Subsector'
      '       )')
    Left = 80
    Top = 48
  end
end
