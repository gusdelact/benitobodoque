object QrPlazoVencDesg: TQrPlazoVencDesg
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = QDesglosado
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
    Top = 122
    Width = 740
    Height = 95
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
      251.354166666667
      1957.91666666667)
    Expression = 'DESC_MERCADO'
    FooterBand = QRGroupFooter1
    Master = Owner
    ReprintOnNewPage = False
    object QRLTrim_Ant: TQRLabel
      Left = 264
      Top = 54
      Width = 115
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        698.5
        142.875
        304.270833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Trim Ant'
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
      Left = 264
      Top = 72
      Width = 72
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        698.5
        190.5
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
      Left = 337
      Top = 72
      Width = 42
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        891.645833333333
        190.5
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
    object QRDBText2: TQRDBText
      Left = 0
      Top = 8
      Width = 265
      Height = 41
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        108.479166666667
        0
        21.1666666666667
        701.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = 2631720
      DataSet = QDesglosado
      DataField = 'Desc_Mercado'
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
      Left = 384
      Top = 54
      Width = 115
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1016
        142.875
        304.270833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Mes actual'
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
    object QRLabel9: TQRLabel
      Left = 384
      Top = 72
      Width = 72
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1016
        190.5
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
    object QRLabel10: TQRLabel
      Left = 457
      Top = 72
      Width = 42
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1209.14583333333
        190.5
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
    object QRLabel1: TQRLabel
      Left = 504
      Top = 54
      Width = 115
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1333.5
        142.875
        304.270833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Diferencia'
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
    object QRLabel12: TQRLabel
      Left = 504
      Top = 72
      Width = 72
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1333.5
        190.5
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
    object QRLabel14: TQRLabel
      Left = 577
      Top = 72
      Width = 42
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1526.64583333333
        190.5
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
    object QRLTrim_Ant_Anio_Sig: TQRLabel
      Left = 624
      Top = 54
      Width = 115
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1651
        142.875
        304.270833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Trim Ant Año Sig'
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
    object QRLabel16: TQRLabel
      Left = 624
      Top = 72
      Width = 72
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1651
        190.5
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
    object QRLabel17: TQRLabel
      Left = 697
      Top = 72
      Width = 42
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1844.14583333333
        190.5
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
  end
  object QRDetail1: TQRBand
    Left = 38
    Top = 217
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
    object QRDBText10: TQRDBText
      Left = 264
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
        698.5
        7.9375
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDesglosado
      DataField = 'Imp_Trim_Ant'
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
      Left = 337
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
        891.645833333333
        7.9375
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDesglosado
      DataField = 'Pct_Trim_Ant'
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
      Left = 168
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
        444.5
        7.9375
        235.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDesglosado
      DataField = 'Desc_Rango'
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
    object QRDBText3: TQRDBText
      Left = 384
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
        1016
        7.9375
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDesglosado
      DataField = 'Imp_Mes_Act'
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
    object QRDBText4: TQRDBText
      Left = 457
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
        1209.14583333333
        7.9375
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDesglosado
      DataField = 'Pct_Mes_Act'
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
    object QRDBText5: TQRDBText
      Left = 504
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
        1333.5
        7.9375
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDesglosado
      DataField = 'Imp_Diferencia'
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
    object QRDBText6: TQRDBText
      Left = 577
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
        1526.64583333333
        7.9375
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDesglosado
      DataField = 'Pct_Diferencia'
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
      Left = 624
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
        1651
        7.9375
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDesglosado
      DataField = 'Imp_Trim_Ant_Anio_Sig'
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
    object QRDBText8: TQRDBText
      Left = 697
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
        1844.14583333333
        7.9375
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDesglosado
      DataField = 'Pct_Trim_Ant_Anio_Sig'
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
    Top = 240
    Width = 740
    Height = 33
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
      87.3125
      1957.91666666667)
    BandType = rbGroupFooter
    object QRExpr1: TQRExpr
      Left = 264
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
        698.5
        0
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Color = 2631720
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'Sum(QDesglosado.Imp_Trim_Ant)'
      Mask = '###,###,###,###,###.00'
      FontSize = 8
    end
    object QRLabel2: TQRLabel
      Left = 337
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
        891.645833333333
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
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel4: TQRLabel
      Left = 168
      Top = 0
      Width = 89
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
        235.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
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
    object QRExpr2: TQRExpr
      Left = 384
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
        1016
        0
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Color = 2631720
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'Sum(QDesglosado.Imp_Mes_Act)'
      Mask = '###,###,###,###,###.00'
      FontSize = 8
    end
    object QRLabel11: TQRLabel
      Left = 457
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
        1209.14583333333
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
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRExpr5: TQRExpr
      Left = 504
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
        1333.5
        0
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Color = 2631720
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'Sum(QDesglosado.Imp_Diferencia)'
      Mask = '###,###,###,###,###.00'
      FontSize = 8
    end
    object QRLabel18: TQRLabel
      Left = 577
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
        1526.64583333333
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
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRExpr6: TQRExpr
      Left = 624
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
        1651
        0
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Color = 2631720
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'Sum(QDesglosado.Imp_Trim_Ant_Anio_Sig)'
      Mask = '###,###,###,###,###.00'
      FontSize = 8
    end
    object QRLabel19: TQRLabel
      Left = 697
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
        1844.14583333333
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
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object QRBand1: TQRBand
    Left = 38
    Top = 273
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
    BandType = rbSummary
    object QRExpr4: TQRExpr
      Left = 264
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
        698.5
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
      Expression = 'Sum(QDesglosado.Imp_Trim_Ant)'
      Mask = '###,###,###,###,###.00'
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 337
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
        891.645833333333
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
    object QRLabel8: TQRLabel
      Left = 168
      Top = 0
      Width = 89
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
        235.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total cartera'
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
    object QRExpr3: TQRExpr
      Left = 384
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
        1016
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
      Expression = 'Sum(QDesglosado.Imp_Mes_Act)'
      Mask = '###,###,###,###,###.00'
      FontSize = 10
    end
    object QRLabel13: TQRLabel
      Left = 457
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
        1209.14583333333
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
    object QRExpr7: TQRExpr
      Left = 504
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
        1333.5
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
      Expression = 'Sum(QDesglosado.Imp_Diferencia)'
      Mask = '###,###,###,###,###.00'
      FontSize = 10
    end
    object QRLabel20: TQRLabel
      Left = 577
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
        1526.64583333333
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
    object QRExpr8: TQRExpr
      Left = 624
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
        1651
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
      Expression = 'Sum(QDesglosado.Imp_Trim_Ant_Anio_Sig)'
      Mask = '###,###,###,###,###.00'
      FontSize = 10
    end
    object QRLabel21: TQRLabel
      Left = 697
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
        1844.14583333333
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
    object QRLeyendaMoneda: TQRLabel
      Left = 0
      Top = 24
      Width = 741
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
        1960.5625)
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
  end
  object QFechas: TQuery
    SQL.Strings = (
      
        '--Utilizando una fecha pasada como parámetro, determina el últim' +
        'o día del trimestre anterior,'
      '--y el último día del trimestre anterior para el siguiente año '
      'Select Fecha, '
      '       Fin_Trim_Ant, '
      
        '       Add_Months (Fin_Trim_Ant, 12)                            ' +
        '                                  Fin_Trim_Ant_SA,'
      
        '       (To_Char (Fin_Trim_Ant, '#39'MM'#39') / 3) || '#39'T'#39' ||  To_Char (Fi' +
        'n_Trim_Ant, '#39'YYYY'#39')               Trim_Ant, '
      
        '       (To_Char (Fin_Trim_Ant, '#39'MM'#39') / 3) || '#39'T'#39' || (To_Char (Fi' +
        'n_Trim_Ant, '#39'YYYY'#39') + 1)          Trim_AntSA '
      '  From ('
      '        Select Fecha, '
      
        '               To_Date ('#39'01'#39' || Primer_Mes_Trim || To_Char (Fech' +
        'a, '#39'YYYY'#39'), '#39'DDMMYYYY'#39') - 1 Fin_Trim_Ant'
      '          From (       '
      
        '                Select :peFecha Fecha, LPad (Trunc ((To_Char (:p' +
        'eFecha, '#39'MM'#39') - 1) / 3) * 3 + 1, 2, '#39'0'#39') Primer_Mes_Trim'
      '                  From Dual'
      '               )'
      '       )')
    Left = 295
    Top = 48
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
      end>
  end
  object QDesglosado: TQuery
    SQL.Strings = (
      'Select Desc_Mercado,'
      '       Desc_Rango,'
      
        '       Trim_Ant                                                 ' +
        '                                     Imp_Trim_Ant,'
      
        '       Round (Case When Sum (Trim_Ant) Over (Partition By Desc_M' +
        'ercado) = 0 Then 0'
      
        '                   Else Trim_Ant / Sum (Trim_Ant) Over (Partitio' +
        'n By Desc_Mercado) '
      
        '              End * 100, 2)                                     ' +
        '                                      Pct_Trim_Ant,'
      
        '       Mes_Act                                                  ' +
        '                                      Imp_Mes_Act,'
      
        '       Round (Case When Sum (Mes_Act) Over (Partition By Desc_Me' +
        'rcado) = 0 Then 0'
      
        '                   Else Mes_Act / Sum (Mes_Act) Over (Partition ' +
        'By Desc_Mercado) '
      
        '              End * 100, 2)                                     ' +
        '                                      Pct_Mes_Act,'
      
        '       Diferencia                                               ' +
        '                                      Imp_Diferencia,'
      
        '       Round (Case When Sum (Diferencia) Over (Partition By Desc' +
        '_Mercado) = 0 Then 0'
      
        '                   Else Diferencia / Sum (Diferencia) Over (Part' +
        'ition By Desc_Mercado) '
      
        '              End * 100, 2)                                     ' +
        '                                      Pct_Diferencia,'
      
        '       Trim_Ant_Anio_Sig                                        ' +
        '                                      Imp_Trim_Ant_Anio_Sig,'
      
        '       Round (Case When Sum (Trim_Ant_Anio_Sig) Over (Partition ' +
        'By Desc_Mercado) = 0 Then 0'
      
        '                   Else Trim_Ant_Anio_Sig / Sum (Trim_Ant_Anio_S' +
        'ig) Over (Partition By Desc_Mercado) '
      
        '              End * 100, 2)                                     ' +
        '                                      Pct_Trim_Ant_Anio_Sig,'
      
        '       G2                                                       ' +
        '                                      G1                        ' +
        '                                                                ' +
        '    '
      '  From (Select Dat.Cve_Mercado,'
      '               Dat.Rango, '
      
        '               Case When Dat.Desc_Mercado Is Not Null           ' +
        '                  Then Dat.Desc_Mercado'
      
        '                    When Dat.Desc_Mercado Is Null And Dat.Cve_Me' +
        'rcado Is Not Null Then '#39'TOTAL '#39' || Mdo.Desc_Mercado'
      
        '                    When Dat.Desc_Mercado Is Null And Dat.Cve_Me' +
        'rcado Is Null Then'
      
        '                    Case When G4 = 0 Then '#39'(SIN MERCADO OBJETIVO' +
        ')'#39
      
        '                         When G1 = 0 Then '#39'TOTAL (SIN MERCADO OB' +
        'JETIVO)'#39
      '                         When G1 = 1 Then '#39'TOTAL CARTERA'#39
      '                    End'
      
        '               End                                              ' +
        '                                                        Desc_Mer' +
        'cado, '
      '               Dat.Desc_Rango, '
      
        '               Round (Dat.Trim_Ant          / :peFactor, 2)     ' +
        '                                                        Trim_Ant' +
        ','
      
        '               Round (Dat.Mes_Act           / :peFactor, 2)     ' +
        '                                                        Mes_Act,'
      
        '               Round (Dat.Diferencia        / :peFactor, 2)     ' +
        '                                                        Diferenc' +
        'ia,'
      
        '               Round (Dat.Trim_Ant_Anio_Sig / :peFactor, 2)     ' +
        '                                                        Trim_Ant' +
        '_Anio_Sig,'
      '               Dat.G1,'
      
        '               Dat.G2                                           ' +
        '                                                        '
      '          From (Select Sdo.Cve_Mercado,'
      '                       Mdo.Desc_Mercado,'
      '                       Sdo.Rango,'
      '                       Rgo.Desc_Rango,'
      
        '                       Grouping (Sdo.Cve_Mercado)               ' +
        '                    G1, '
      
        '                       Grouping (Sdo.Rango)                     ' +
        '                    G2, '
      
        '                       Grouping (Mdo.Desc_Mercado)              ' +
        '                    G3, '
      
        '                       Grouping (Rgo.Desc_Rango)                ' +
        '                    G4,'
      
        '                       Nvl (Sum (Sdo.Trim_Ant), 0)              ' +
        '                    Trim_Ant,'
      
        '                       Nvl (Sum (Sdo.Mes_Act), 0)               ' +
        '                    Mes_Act,'
      
        '                       Nvl (Sum (Sdo.Trim_Ant), 0) - Nvl (Sum (S' +
        'do.Mes_Act), 0)     Diferencia,'
      
        '                       Nvl (Sum (Sdo.Trim_Ant_Anio_Sig), 0)     ' +
        '                    Trim_Ant_Anio_Sig'
      '                  From (Select Cve_Mercado,'
      '                               Rango,'
      
        '                               Null                             ' +
        '   Trim_Ant,'
      
        '                               Imp_Total                        ' +
        '   Mes_Act,'
      
        '                               Null                             ' +
        '   Trim_Ant_Anio_Sig'
      '                          From (Select Cve_Mercado, '
      '                                       Rango,'
      
        '                                       Sum (Imp_Total)  Imp_Tota' +
        'l'
      '                                  From (Select Cve_Mercado,'
      '                                               Rango,'
      
        '                                               Sum (Imp_Total) *' +
        ' PkgCrConsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda, '#39'D000'#39 +
        ', To_Char (:peFecha, '#39'YYYY'#39'), To_Char (:peFecha, '#39'MM'#39')) Imp_Tota' +
        'l'
      
        '                                          From (Select Cve_Merca' +
        'do, '
      
        '                                                       Cve_Moned' +
        'a,'
      
        '                                                       Imp_Total' +
        ','
      
        '                                                       Case When' +
        ' Situacion = '#39'IM'#39'                                      Then 1 --' +
        #39'Impagado'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses <= 12             Then 2 --' +
        #39'Hasta 12 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses Between 13 And 36 Then 3 --' +
        #39'De 13 A 36 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses Between 37 And 60 Then 4 --' +
        #39'De 37 A 60 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses > 60              Then 5 --' +
        #39'Mas De 60 Meses'#39
      
        '                                                       End      ' +
        '                                                                ' +
        '                  Rango              '
      
        '                                                  From Table (Pk' +
        'gCRGPViews.VW_CR_GP_Saldos_Plazo_Vto (:peFecha, :peTipo_Entidad)' +
        ')'
      '                                               )'
      
        '                                         Group By Cve_Mercado, C' +
        've_Moneda, Rango'
      '                                       )'
      '                                 Group By Cve_Mercado, Rango'
      '                               ) '
      '                         Where Rango Is Not Null'
      '                        Union'
      '                        Select Cve_Mercado,'
      '                               Rango,'
      
        '                               Imp_Total                        ' +
        '   Trim_Ant,'
      
        '                               Null                             ' +
        '   Mes_Act,'
      
        '                               Null                             ' +
        '   Trim_Ant_Anio_Sig'
      '                          From (Select Cve_Mercado, '
      '                                       Rango,'
      
        '                                       Sum (Imp_Total)  Imp_Tota' +
        'l'
      '                                  From (Select Cve_Mercado,'
      '                                               Rango,'
      
        '                                               Sum (Imp_Total) *' +
        ' PkgCrConsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda, '#39'D000'#39 +
        ', To_Char (:peFechaTA, '#39'YYYY'#39'), To_Char (:peFechaTA, '#39'MM'#39')) Imp_' +
        'Total'
      
        '                                          From (Select Cve_Merca' +
        'do, '
      
        '                                                       Cve_Moned' +
        'a,'
      
        '                                                       Imp_Total' +
        ','
      
        '                                                       Case When' +
        ' Situacion = '#39'IM'#39'                                      Then 1 --' +
        #39'Impagado'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses <= 12             Then 2 --' +
        #39'Hasta 12 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses Between 13 And 36 Then 3 --' +
        #39'De 13 A 36 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses Between 37 And 60 Then 4 --' +
        #39'De 37 A 60 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses > 60              Then 5 --' +
        #39'Mas De 60 Meses'#39
      
        '                                                       End      ' +
        '                                                                ' +
        '                  Rango              '
      
        '                                                  From Table (Pk' +
        'gCRGPViews.VW_CR_GP_Saldos_Plazo_Vto (:peFechaTA, :peTipo_Entida' +
        'd))'
      '                                               )'
      
        '                                         Group By Cve_Mercado, C' +
        've_Moneda, Rango'
      '                                       )'
      '                                 Group By Cve_Mercado, Rango'
      '                               )'
      '                         Where Rango Is Not Null'
      '                        Union'
      '                        Select Cve_Mercado,'
      '                               Rango,'
      
        '                               Null                             ' +
        '   Trim_Ant,'
      
        '                               Null                             ' +
        '   Mes_Act,'
      
        '                               Imp_Total                        ' +
        '   Trim_Ant_Anio_Sig'
      '                          From (Select Cve_Mercado, '
      '                                       Rango,'
      
        '                                       Sum (Imp_Total)  Imp_Tota' +
        'l'
      '                                  From (Select Cve_Mercado,'
      '                                               Rango,'
      
        '                                               Sum (Imp_Total) *' +
        ' PkgCrConsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda, '#39'D000'#39 +
        ', To_Char (:peFechaTASA, '#39'YYYY'#39'), To_Char (:peFechaTASA, '#39'MM'#39')) ' +
        'Imp_Total'
      
        '                                          From (Select Cve_Merca' +
        'do, '
      
        '                                                       Cve_Moned' +
        'a,'
      
        '                                                       Imp_Total' +
        ','
      
        '                                                       Case When' +
        ' Situacion = '#39'IM'#39'                                      Then 1 --' +
        #39'Impagado'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses <= 12             Then 2 --' +
        #39'Hasta 12 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses Between 13 And 36 Then 3 --' +
        #39'De 13 A 36 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses Between 37 And 60 Then 4 --' +
        #39'De 37 A 60 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses > 60              Then 5 --' +
        #39'Mas De 60 Meses'#39
      
        '                                                       End      ' +
        '                                                                ' +
        '                  Rango              '
      
        '                                                  From Table (Pk' +
        'gCRGPViews.VW_CR_GP_Saldos_Plazo_Vto (:peFechaTASA, :peTipo_Enti' +
        'dad))'
      '                                               )'
      
        '                                         Group By Cve_Mercado, C' +
        've_Moneda, Rango'
      '                                       )'
      '                                 Group By Cve_Mercado, Rango'
      '                               ) '
      '                         Where Rango Is Not Null'
      '                       ) Sdo'
      
        '                  Join (Select 1 Rango, '#39'Impagado'#39'         Desc_' +
        'Rango From Dual Union'
      
        '                        Select 2 Rango, '#39'Hasta 12 Meses'#39'   Desc_' +
        'Rango From Dual Union '
      
        '                        Select 3 Rango, '#39'De 13 A 36 Meses'#39' Desc_' +
        'Rango From Dual Union '
      
        '                        Select 4 Rango, '#39'De 37 A 60 Meses'#39' Desc_' +
        'Rango From Dual Union '
      
        '                        Select 5 Rango, '#39'Mas De 60 Meses'#39'  Desc_' +
        'Rango From Dual  '
      '                       ) Rgo On Sdo.Rango = Rgo.Rango     '
      
        '                  Full Outer Join CR_Mercado_Obj Mdo On Sdo.Cve_' +
        'Mercado = Mdo.Cve_Mercado'
      
        '                 Group By Rollup (Sdo.Cve_Mercado, Sdo.Rango, Md' +
        'o.Desc_Mercado, Rgo.Desc_Rango)'
      '                 Having Grouping (Sdo.Cve_Mercado) + '
      '                        Grouping (Sdo.Rango) + '
      '                        Grouping (Mdo.Desc_Mercado) + '
      '                        Grouping (Rgo.Desc_Rango) In (0, 3, 4) '
      '                 Order By Sdo.Cve_Mercado Nulls Last, Sdo.Rango'
      '               ) Dat'
      
        '          Left Outer Join CR_Mercado_Obj Mdo On Dat.Cve_Mercado ' +
        '= Mdo.Cve_Mercado       '
      
        '         Where (Dat.Desc_Mercado Is Null Or Dat.Cve_Mercado Is N' +
        'ot Null)    --Descarta los mercado objetivo que no tienen inform' +
        'ación'
      '       ) Dat       '
      ' Where Dat.G2 = 0'
      'Order By Dat.Cve_Mercado Nulls Last, Dat.G1, Dat.G2, Dat.Rango')
    Left = 232
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
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
      end
      item
        DataType = ftUnknown
        Name = 'peFechaTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFechaTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFechaTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFechaTASA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFechaTASA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFechaTASA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
    object QDesglosadoDesc_Mercado: TStringField
      DisplayLabel = 'Banca'
      DisplayWidth = 49
      FieldName = 'Desc_Mercado'
      Size = 100
    end
    object QDesglosadoDesc_Rango: TStringField
      DisplayLabel = 'Rango'
      DisplayWidth = 16
      FieldName = 'Desc_Rango'
    end
    object QDesglosadoImp_Trim_Ant: TFloatField
      DisplayWidth = 20
      FieldName = 'Imp_Trim_Ant'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDesglosadoPct_Trim_Ant: TFloatField
      DisplayLabel = '    %'
      DisplayWidth = 6
      FieldName = 'Pct_Trim_Ant'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDesglosadoImp_Mes_Act: TFloatField
      DisplayLabel = '        Mes actual ($)'
      DisplayWidth = 20
      FieldName = 'Imp_Mes_Act'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDesglosadoPct_Mes_Act: TFloatField
      DisplayLabel = '    %'
      DisplayWidth = 6
      FieldName = 'Pct_Mes_Act'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDesglosadoImp_Diferencia: TFloatField
      DisplayLabel = '        Diferencia ($)'
      DisplayWidth = 20
      FieldName = 'Imp_Diferencia'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDesglosadoPct_Diferencia: TFloatField
      DisplayLabel = '    %'
      DisplayWidth = 6
      FieldName = 'Pct_Diferencia'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDesglosadoImp_Trim_Ant_Anio_Sig: TFloatField
      DisplayWidth = 20
      FieldName = 'Imp_Trim_Ant_Anio_Sig'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDesglosadoPct_Trim_Ant_Anio_Sig: TFloatField
      DisplayLabel = '    %'
      DisplayWidth = 6
      FieldName = 'Pct_Trim_Ant_Anio_Sig'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDesglosadoG1: TFloatField
      FieldName = 'G1'
      Visible = False
    end
  end
end
