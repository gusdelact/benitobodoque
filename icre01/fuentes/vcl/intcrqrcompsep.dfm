object QrCrCompSeP: TQrCrCompSeP
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
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
  object TitleBand1: TQRBand
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
    BandType = rbTitle
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
  object QRGroup1: TQRGroup
    Left = 38
    Top = 122
    Width = 980
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
      2592.91666666667)
    Expression = 'GRUPO'
    Master = Owner
    ReprintOnNewPage = False
    object QR4TYAnt: TQRLabel
      Left = 171
      Top = 29
      Width = 134
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        452.4375
        76.7291666666667
        354.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QR4TYAnt'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel2: TQRLabel
      Left = 171
      Top = 47
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        452.4375
        124.354166666667
        232.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '$'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel3: TQRLabel
      Left = 260
      Top = 47
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        687.916666666667
        124.354166666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QR1TYAct: TQRLabel
      Left = 306
      Top = 29
      Width = 134
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        809.625
        76.7291666666667
        354.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QR1TYAct'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel4: TQRLabel
      Left = 306
      Top = 47
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        809.625
        124.354166666667
        232.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '$'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel5: TQRLabel
      Left = 395
      Top = 47
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1045.10416666667
        124.354166666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QR4TYAct: TQRLabel
      Left = 711
      Top = 29
      Width = 134
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1881.1875
        76.7291666666667
        354.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QR4TYAct'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel7: TQRLabel
      Left = 711
      Top = 47
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1881.1875
        124.354166666667
        232.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '$'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel8: TQRLabel
      Left = 800
      Top = 47
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2116.66666666667
        124.354166666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel9: TQRLabel
      Left = 846
      Top = 29
      Width = 134
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2238.375
        76.7291666666667
        354.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '(4-1) Diferencia'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel10: TQRLabel
      Left = 846
      Top = 47
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2238.375
        124.354166666667
        232.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '$'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel11: TQRLabel
      Left = 935
      Top = 47
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2473.85416666667
        124.354166666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel131: TQRLabel
      Left = 441
      Top = 29
      Width = 134
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1166.8125
        76.7291666666667
        354.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '(3) Saldo al'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRFecha: TQRLabel
      Left = 441
      Top = 47
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1166.8125
        124.354166666667
        232.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '$'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel14: TQRLabel
      Left = 576
      Top = 29
      Width = 134
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1524
        76.7291666666667
        354.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '(2-3) Diferencia'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel15: TQRLabel
      Left = 576
      Top = 47
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1524
        124.354166666667
        232.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '$'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel1: TQRLabel
      Left = 530
      Top = 47
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1402.29166666667
        124.354166666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel6: TQRLabel
      Left = 665
      Top = 47
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1759.47916666667
        124.354166666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLCarta: TQRLabel
      Left = 8
      Top = 8
      Width = 481
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
        1272.64583333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLCarta'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLIntereses: TQRLabel
      Left = 496
      Top = 8
      Width = 473
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1312.33333333333
        21.1666666666667
        1251.47916666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLIntereses'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object DetailBand1: TQRBand
    Left = 38
    Top = 193
    Width = 980
    Height = 19
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
      50.2708333333333
      2592.91666666667)
    BandType = rbDetail
    object qrTxtTitulos: TQRDBText
      Left = 0
      Top = 1
      Width = 170
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        0
        2.64583333333333
        449.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Titulos'
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
    object QRImp_T4YAnt: TQRDBText
      Left = 171
      Top = 1
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        452.4375
        2.64583333333333
        232.833333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Imp_T4YAnt'
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
    object QRPct_T4YAnt: TQRDBText
      Left = 261
      Top = 1
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        690.5625
        2.64583333333333
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Pct_T4YAnt'
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
    object QRImp_T1YAct: TQRDBText
      Left = 307
      Top = 1
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        812.270833333333
        2.64583333333333
        232.833333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Imp_T1YAct'
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
    object QRPct_T1YAct: TQRDBText
      Left = 396
      Top = 1
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1047.75
        2.64583333333333
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Pct_T1YAct'
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
    object QRImp_Saldo_al: TQRDBText
      Left = 442
      Top = 1
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1169.45833333333
        2.64583333333333
        232.833333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Imp_Saldo_al'
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
    object QRImp_T1_Diferencia: TQRDBText
      Left = 576
      Top = 1
      Width = 87
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1524
        2.64583333333333
        230.1875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Imp_T1_Diferencia'
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
    object QRImp_T4YAct: TQRDBText
      Left = 712
      Top = 1
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1883.83333333333
        2.64583333333333
        232.833333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Imp_T4YAct'
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
    object QRPct_T4YAct: TQRDBText
      Left = 801
      Top = 1
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2119.3125
        2.64583333333333
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Pct_T4YAct'
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
    object QRImp_T4_Diferencia: TQRDBText
      Left = 847
      Top = 1
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2241.02083333333
        2.64583333333333
        232.833333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Imp_T4_Diferencia'
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
    object QRPct_T4_Diferencia: TQRDBText
      Left = 936
      Top = 1
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2476.5
        2.64583333333333
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Pct_T4_Diferencia'
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
    object QRPct_Saldo_al: TQRDBText
      Left = 532
      Top = 1
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1407.58333333333
        2.64583333333333
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Pct_Saldo_al'
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
    object QRPct_T1_Diferencia: TQRDBText
      Left = 665
      Top = 1
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1759.47916666667
        2.64583333333333
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Pct_T1_Diferencia'
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
  object QRBand2: TQRBand
    Left = 38
    Top = 212
    Width = 980
    Height = 37
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = True
    Size.Values = (
      97.8958333333333
      2592.91666666667)
    BandType = rbSummary
    object QRLeyendaMoneda: TQRLabel
      Left = 3
      Top = 8
      Width = 977
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        7.9375
        21.1666666666667
        2584.97916666667)
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
  object QRChildBand1: TQRChildBand
    Left = 38
    Top = 249
    Width = 980
    Height = 592
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
      1566.33333333333
      2592.91666666667)
    ParentBand = QRBand2
    object QRChart2: TQRChart
      Left = 40
      Top = -29
      Width = 985
      Height = 201
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        531.8125
        105.833333333333
        -76.7291666666667
        2606.14583333333)
      object QRDBChart2: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Gobierno Federal')
        object Series1: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Presup T1YAct'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object Series2: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Real Fecha'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object LineSeries1: TLineSeries
          Marks.ArrowLength = 8
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clYellow
          Title = 'Diferencia (2-3)'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object Series3: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'Presup 4TYAct'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object Series4: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clGray
          Title = 'Presup 4TYAnt'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object LineSeries2: TLineSeries
          Marks.ArrowLength = 8
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clFuchsia
          Title = 'Diferencia (4-1)'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
      end
    end
    object QRChart1: TQRChart
      Left = -8
      Top = 169
      Width = 985
      Height = 201
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        531.8125
        -21.1666666666667
        447.145833333333
        2606.14583333333)
      object QRDBChart1: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Gobiernos Estatales ')
        object Series5: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Presup T1YAct'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object Series6: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Real Fecha'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object LineSeries3: TLineSeries
          Marks.ArrowLength = 8
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clYellow
          Title = 'Diferencia (2-3)'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object Series7: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'Presup 4TYAct'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object Series8: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clGray
          Title = 'Presup 4TYAnt'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object LineSeries4: TLineSeries
          Marks.ArrowLength = 8
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clFuchsia
          Title = 'Diferencia (4-1)'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
      end
    end
    object QRChart3: TQRChart
      Left = 40
      Top = 370
      Width = 985
      Height = 201
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        531.8125
        105.833333333333
        978.958333333333
        2606.14583333333)
      object QRDBChart3: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Gobiernos Municipales')
        object Series9: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Presup T1YAct'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object Series10: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Real Fecha'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object LineSeries5: TLineSeries
          Marks.ArrowLength = 8
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clYellow
          Title = 'Diferencia (2-3)'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object Series11: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'Presup 4TYAct'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object Series12: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clGray
          Title = 'Presup 4TYAnt'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object LineSeries6: TLineSeries
          Marks.ArrowLength = 8
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clFuchsia
          Title = 'Diferencia (4-1)'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
      end
    end
    object QRChart4: TQRChart
      Left = -8
      Top = 560
      Width = 985
      Height = 201
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        531.8125
        -21.1666666666667
        1481.66666666667
        2606.14583333333)
      object QRDBChart4: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Organismos Descentralizados')
        object Series13: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Presup T1YAct'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object Series14: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Real Fecha'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object LineSeries7: TLineSeries
          Marks.ArrowLength = 8
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clYellow
          Title = 'Diferencia (2-3)'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object Series15: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'Presup 4TYAct'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object Series16: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clGray
          Title = 'Presup 4TYAnt'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object LineSeries8: TLineSeries
          Marks.ArrowLength = 8
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clFuchsia
          Title = 'Diferencia (4-1)'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
      end
    end
  end
  object QDatos: TQuery
    AfterScroll = QDatosAfterScroll
    SQL.Strings = (
      'Select Titulos,'
      '       Orden_Estructura,'
      '       B_Registro,'
      
        '       Case When  Orden_Estructura In (1,5,16,27)               ' +
        '         Then Null '
      
        '            When  B_Registro In (2,3,4,6,7,8,9,11,10,11,12,13,14' +
        ',15,'
      
        '                                 17,18,19,20,21,22,23,24,25,26,2' +
        '8,30,31) Then Round( I.Saldo_T4  /:peFactor,2)'
      
        '            Else  0                                             ' +
        '                                 End Imp_T4YAnt, '
      
        '       Case When  Orden_Estructura In (1,5,16,27)               ' +
        '         Then Null  '
      
        '            When  B_Registro In (2,3,4,6,7,8,9,11,10,11,12,13,14' +
        ',15,'
      
        '                                 17,18,19,20,21,22,23,24,25,26,2' +
        '8,30,31) Then I.Pct_Saldo_T4'
      
        '            Else  0                                             ' +
        '                                 End Pct_T4YAnt,     '
      
        '       Case When  Orden_Estructura In (1,5,16,27)               ' +
        '         Then Null '
      
        '            Else  0                                             ' +
        '                                 End Imp_T1YAct, '
      
        '        Case When  Orden_Estructura In (1,5,16,27)              ' +
        '         Then Null '
      
        '            Else  0                                             ' +
        '                                 End Pct_T1YAct,'
      
        '       Case When  Orden_Estructura In (1,5,16,27)               ' +
        '         Then Null   '
      
        '            When  B_Registro In (2,3,4,6,7,8,9,11,10,11,12,13,14' +
        ',15,'
      
        '                                 17,18,19,20,21,22,23,24,25,26,2' +
        '8,30,31) Then Round (I.Saldo_Actual /:peFactor, 2) '
      
        '            Else  0                                             ' +
        '                                 End Imp_Saldo_al, '
      
        '       Case When  Orden_Estructura In (1,5,16,27)               ' +
        '         Then Null '
      
        '            When  B_Registro In (2,3,4,6,7,8,9,11,10,11,12,13,14' +
        ',15,'
      
        '                                 17,18,19,20,21,22,23,24,25,26,2' +
        '8,30,31) Then I.Pct_Saldo_Actual'
      
        '            Else  0                                             ' +
        '                                 End Pct_Saldo_al, '
      
        '       Case When  Orden_Estructura In (1,5,16,27)               ' +
        '         Then Null  '
      
        '            Else  0                                             ' +
        '                                 End Imp_T1_Diferencia,    '
      
        '       Case When  Orden_Estructura In (1,5,16,27)               ' +
        '         Then Null  '
      
        '            Else  0                                             ' +
        '                                 End Pct_T1_Diferencia, '
      
        '       Case When  Orden_Estructura In (1,5,16,27)               ' +
        '         Then Null  '
      
        '            Else  0                                             ' +
        '                                 End Imp_T4Yact,     '
      
        '       Case When  Orden_Estructura In (1,5,16,27)               ' +
        '         Then Null  '
      
        '            Else  0                                             ' +
        '                                 End Pct_T4YAct,'
      
        '       Case When  Orden_Estructura In (1,5,16,27)               ' +
        '         Then Null  '
      
        '            Else  0                                             ' +
        '                                 End Imp_T4_Diferencia,    '
      
        '       Case When  Orden_Estructura In (1,5,16,27)               ' +
        '         Then Null  '
      
        '            Else  0                                             ' +
        '                                 End Pct_T4_Diferencia'
      '  From ( '
      '        Select Titulos, '
      '               RowNum Orden_Estructura '
      '         From( '
      
        '              Select '#39'Gobierno Federal'#39'            Gobierno_Fede' +
        'ral, '
      '                     '#39'Cartera'#39'                     Cartera, '
      '                     '#39'Factoraje'#39'                   Factoraje, '
      '                     '#39'Total'#39'                       Total, '
      
        '                     '#39'Gobiernos Estatales'#39'         Gobierno_Esta' +
        'tal, '
      '                     '#39'Fid/R28 (1)'#39'                 Estatal_1, '
      '                     '#39'Fid/R33 (2)'#39'                 Estatal_2, '
      '                     '#39'Fid/Rp  (3)'#39'                 Estatal_3, '
      '                     '#39'Man/R28 (4)'#39'                 Estatal_4, '
      '                     '#39'Man/R33 (5)'#39'                 Estatal_5, '
      '                     '#39'Man/Rp  (6)'#39'                 Estatal_6, '
      '                     '#39'Sin Estructura/IF (7)'#39'       Estatal_7, '
      '                     '#39'Sin Estructura/IE (8)'#39'       Estatal_8, '
      '                     '#39'Sin Estructura/SI (9)'#39'       Estatal_9, '
      
        '                     '#39'Total'#39'                       Estatal_Total' +
        ', '
      
        '                     '#39'Gobiernos Municipales'#39'       Gobierno_Muni' +
        'cipal, '
      '                     '#39'Fid/R28 (1)'#39'                 Municipal_1, '
      '                     '#39'Fid/R33 (2)'#39'                 Municipal_2, '
      '                     '#39'Fid/Rp  (3)'#39'                 Municipal_3, '
      '                     '#39'Man/R28 (4)'#39'                 Municipal_4, '
      '                     '#39'Man/R33 (5)'#39'                 Municipal_5, '
      '                     '#39'Man/Rp  (6)'#39'                 Municipal_6, '
      '                     '#39'Sin Estructura/IF (7)'#39'       Municipal_7, '
      '                     '#39'Sin Estructura/IE (8)'#39'       Municipal_8, '
      '                     '#39'Sin Estructura/SI (9)'#39'       Municipal_9, '
      
        '                     '#39'Total'#39'                       Municipal_Tot' +
        'al, '
      
        '                     '#39'Organismos Descentralizados'#39' Org_Descentra' +
        'lizados, '
      '                     '#39'Federal'#39'                     Org_Desc_1, '
      '                     '#39'Estatal/Municipal'#39'           Org_Desc_2, '
      
        '                     '#39'Total'#39'                       Org_Desc_Tota' +
        'l, '
      '                     '#39'Gran Total'#39'                  Gran_Total '
      '                 From Dual '
      '                ) '
      '         UnPivot (Titulos For Columna In (Gobierno_Federal, '
      '                                          Cartera, '
      '                                          Factoraje, '
      '                                          Total, '
      '                                          Gobierno_Estatal, '
      '                                          Estatal_1, '
      '                                          Estatal_2, '
      '                                          Estatal_3, '
      '                                          Estatal_4, '
      '                                          Estatal_5, '
      '                                          Estatal_6, '
      '                                          Estatal_7, '
      '                                          Estatal_8, '
      '                                          Estatal_9, '
      '                                          Estatal_Total, '
      '                                          Gobierno_Municipal, '
      '                                          Municipal_1, '
      '                                          Municipal_2, '
      '                                          Municipal_3, '
      '                                          Municipal_4, '
      '                                          Municipal_5, '
      '                                          Municipal_6, '
      '                                          Municipal_7, '
      '                                          Municipal_8, '
      '                                          Municipal_9, '
      '                                          Municipal_Total, '
      '                                          Org_Descentralizados, '
      '                                          Org_Desc_1, '
      '                                          Org_Desc_2, '
      '                                          Org_Desc_Total, '
      '                                          Gran_Total))) E '
      'Left Outer  Join ( '
      '                  Select Tipo_Entidad, '
      '                         Orden, '
      '                         Producto, '
      
        '                         Case When Tipo_Entidad = '#39'FEDERAL'#39'   An' +
        'd Producto = '#39'Cartera'#39'   Then 2 '
      
        '                              When Tipo_Entidad = '#39'FEDERAL'#39'   An' +
        'd Producto = '#39'Factoraje'#39' Then 3 '
      
        '                              When Tipo_Entidad = '#39'Total'#39'     An' +
        'd Orden    = 1           Then 4 '
      
        '                              When Tipo_Entidad = '#39'ESTATAL'#39'   An' +
        'd Producto = '#39'Producto1'#39' Then 6 '
      
        '                              When Tipo_Entidad = '#39'ESTATAL'#39'   An' +
        'd Producto = '#39'Producto2'#39' Then 7 '
      
        '                              When Tipo_Entidad = '#39'ESTATAL'#39'   An' +
        'd Producto = '#39'Producto3'#39' Then 8 '
      
        '                              When Tipo_Entidad = '#39'ESTATAL'#39'   An' +
        'd Producto = '#39'Producto4'#39' Then 9 '
      
        '                              When Tipo_Entidad = '#39'ESTATAL'#39'   An' +
        'd Producto = '#39'Producto5'#39' Then 10 '
      
        '                              When Tipo_Entidad = '#39'ESTATAL'#39'   An' +
        'd Producto = '#39'Producto6'#39' Then 11 '
      
        '                              When Tipo_Entidad = '#39'ESTATAL'#39'   An' +
        'd Producto = '#39'Producto7'#39' Then 12 '
      
        '                              When Tipo_Entidad = '#39'ESTATAL'#39'   An' +
        'd Producto = '#39'Producto8'#39' Then 13 '
      
        '                              When Tipo_Entidad = '#39'ESTATAL'#39'   An' +
        'd Producto = '#39'Producto9'#39' Then 14 '
      
        '                              When Tipo_Entidad = '#39'Total'#39'     An' +
        'd Orden    = 2           Then 15 '
      
        '                              When Tipo_Entidad = '#39'MUNICIPAL'#39' An' +
        'd Producto = '#39'Producto1'#39' Then 17 '
      
        '                              When Tipo_Entidad = '#39'MUNICIPAL'#39' An' +
        'd Producto = '#39'Producto2'#39' Then 18 '
      
        '                              When Tipo_Entidad = '#39'MUNICIPAL'#39' An' +
        'd Producto = '#39'Producto3'#39' Then 19 '
      
        '                              When Tipo_Entidad = '#39'MUNICIPAL'#39' An' +
        'd Producto = '#39'Producto4'#39' Then 20 '
      
        '                              When Tipo_Entidad = '#39'MUNICIPAL'#39' An' +
        'd Producto = '#39'Producto5'#39' Then 21 '
      
        '                              When Tipo_Entidad = '#39'MUNICIPAL'#39' An' +
        'd Producto = '#39'Producto6'#39' Then 22 '
      
        '                              When Tipo_Entidad = '#39'MUNICIPAL'#39' An' +
        'd Producto = '#39'Producto7'#39' Then 23 '
      
        '                              When Tipo_Entidad = '#39'MUNICIPAL'#39' An' +
        'd Producto = '#39'Producto8'#39' Then 24 '
      
        '                              When Tipo_Entidad = '#39'MUNICIPAL'#39' An' +
        'd Producto = '#39'Producto9'#39' Then 25 '
      
        '                              When Tipo_Entidad = '#39'Total'#39'     An' +
        'd Orden    = 3           Then 26 '
      
        '                              When Tipo_Entidad = '#39'ORG_DESC'#39'  An' +
        'd Producto = '#39'Producto1'#39' Then 28 '
      
        '                              When Tipo_Entidad = '#39'Total'#39'     An' +
        'd Orden    = 4           Then 30 '
      
        '                              When Tipo_Entidad = '#39'Gran Total'#39'  ' +
        '                         Then 31 End B_Registro, '
      '                         Saldo_T4, '
      
        '                         Case When Sum(Saldo_T4) Over (Partition' +
        ' By Tipo_Entidad, Orden) = 0 Then 0 '
      
        '                              Else round (Saldo_T4 /  Sum(Saldo_' +
        'T4) Over (Partition By Tipo_Entidad, Orden) * 100, 2)  End Pct_S' +
        'aldo_T4, '
      '                         Saldo_Actual, '
      
        '                         Case When Sum(Saldo_Actual) Over (Parti' +
        'tion By Tipo_Entidad, Orden) = 0 Then 0 '
      
        '                              Else Round (Saldo_Actual /  Sum(Sa' +
        'ldo_Actual) Over (Partition By Tipo_Entidad, Orden) * 100, 2) En' +
        'd Pct_Saldo_Actual '
      '                   From ( '
      
        '                         Select Case When Grouping (Tipo_Entidad' +
        ') = 1 Then '#39'Gran Total'#39' '
      
        '                                     When Grouping (Orden)      ' +
        '  = 1 Then '#39'Total'#39' Else Tipo_Entidad End Tipo_Entidad, '
      
        '                                Case When Tipo_Entidad = '#39'FEDERA' +
        'L'#39'   Then 1 '
      
        '                                             When Tipo_Entidad =' +
        ' '#39'ESTATAL'#39'   Then 2 '
      
        '                                             When Tipo_Entidad =' +
        ' '#39'MUNICIPAL'#39' Then 3 '
      
        '                                             When Tipo_Entidad =' +
        ' '#39'ORG-DESC'#39'  Then 4 End Orden, '
      '                                Producto, '
      '                                Grouping (Tipo_Entidad), '
      '                                Grouping (Orden), '
      
        '                                Nvl (Sum (Saldo_T4),0)          ' +
        '              Saldo_T4, '
      
        '                                Nvl (Sum (Saldo_Actual),0)      ' +
        '              Saldo_Actual '
      '                           From ( '
      '                                 Select C.Tipo_Entidad, '
      
        '                                        Case When C.Tipo_Entidad' +
        ' = '#39'FEDERAL'#39'   Then 1 '
      
        '                                             When C.Tipo_Entidad' +
        ' = '#39'ESTATAL'#39'   Then 2 '
      
        '                                             When C.Tipo_Entidad' +
        ' = '#39'MUNICIPAL'#39' Then 3 '
      
        '                                             When C.Tipo_Entidad' +
        ' = '#39'ORG-DESC'#39'  Then 4 End Orden, '
      
        '                                        Case When C.Id_Acreditad' +
        'o =  439300 And C.Tipo_Entidad = '#39'FEDERAL'#39' Then '#39'Cartera'#39' '
      
        '                                             When C.Id_Acreditad' +
        'o <> 439300 And C.Tipo_Entidad = '#39'FEDERAL'#39' Then '#39'Factoraje'#39' Else' +
        ' C.Producto End Producto, '
      '                                        0 Saldo_T4, '
      
        '                                        (C.Imp_Cap_Vig + C.Imp_C' +
        'ap_Imp + C.Imp_Int_Vig + C.Imp_Int_Imp) * '
      
        '                                                PkgCrConsolidado' +
        '1.Fnc_Obt_Tipo_Cambio_Regul '
      
        '                                                (C.Cve_Moneda, '#39 +
        'D000'#39', Extract (Year From :peFecha),Extract (Month From :peFecha' +
        ')) Saldo_Actual '
      
        '                                  From  Table (PkgCrGPViews.VW_C' +
        'R_GP_Consolidado_Edos_Mun(:peFecha, :peTipo_Entidad)) C '
      '                                Union '
      '                                 Select C.Tipo_Entidad, '
      
        '                                        Case When C.Tipo_Entidad' +
        ' = '#39'FEDERAL'#39'   Then 1 '
      
        '                                             When C.Tipo_Entidad' +
        ' = '#39'ESTATAL'#39'   Then 2 '
      
        '                                             When C.Tipo_Entidad' +
        ' = '#39'MUNICIPAL'#39' Then 3 '
      
        '                                             When C.Tipo_Entidad' +
        ' = '#39'ORG-DESC'#39'  Then 4 End Orden, '
      
        '                                        Case When C.Id_Acreditad' +
        'o =  439300 And C.Tipo_Entidad = '#39'FEDERAL'#39' Then '#39'Cartera'#39' '
      
        '                                             When C.Id_Acreditad' +
        'o <> 439300 And C.Tipo_Entidad = '#39'FEDERAL'#39' Then '#39'Factoraje'#39' Else' +
        ' C.Producto End Producto, '
      
        '                                        (C.Imp_Cap_Vig + C.Imp_C' +
        'ap_Imp + C.Imp_Int_Vig + C.Imp_Int_Imp) * '
      
        '                                                PkgCrConsolidado' +
        '1.Fnc_Obt_Tipo_Cambio_Regul '
      
        '                                                (C.Cve_Moneda, '#39 +
        'D000'#39', Extract (Year From :peFecha),Extract (Month From :peFecha' +
        ')) Saldo_T4, '
      '                                        0 Saldo_Actual '
      
        '                                  From  Table (PkgCrGPViews.VW_C' +
        'R_GP_Consolidado_Edos_Mun( '
      
        '                                               Last_Day (Add_Mon' +
        'ths (To_Date ((3||'#39'/'#39'|| To_Char (:peFecha, '#39'yyyy'#39')), '#39'mm/yyyy'#39'),' +
        ' -3)), :peTipo_Entidad)) C '
      '                                 ) '
      '                          Where Producto Is Not Null '
      '                          Group By RollUp (Tipo_Entidad, '
      '                                            Orden, '
      '                                            Producto) '
      '                          Having Grouping (Tipo_Entidad) + '
      
        '                                 Grouping (Orden)  In (1,2) Or P' +
        'roducto Is Not Null '
      '             ) '
      '        Order By Orden, Producto '
      '   ) I On E.Orden_Estructura = I.B_Registro   '
      ' Order By Orden_Estructura  '
      '    '
      '')
    Left = 672
    Top = 41
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
    object QDatosTitulos: TStringField
      DisplayLabel = 'Entidades'
      DisplayWidth = 25
      FieldName = 'Titulos'
    end
    object QDatosImp_T4YAnt: TFloatField
      DisplayWidth = 15
      FieldName = 'Imp_T4YAnt'
    end
    object QDatosPct_T4YAnt: TFloatField
      Alignment = taCenter
      DisplayLabel = '%'
      DisplayWidth = 8
      FieldName = 'Pct_T4YAnt'
    end
    object QDatosImp_T1YAct: TFloatField
      DisplayWidth = 15
      FieldName = 'Imp_T1YAct'
    end
    object QDatosPct_T1YAct: TFloatField
      Alignment = taCenter
      DisplayLabel = '%'
      DisplayWidth = 8
      FieldName = 'Pct_T1YAct'
    end
    object QDatosImp_Saldo_al: TFloatField
      DisplayWidth = 17
      FieldName = 'Imp_Saldo_al'
    end
    object QDatosPct_Saldo_al: TFloatField
      Alignment = taCenter
      DisplayLabel = '%'
      DisplayWidth = 8
      FieldName = 'Pct_Saldo_al'
    end
    object QDatosImp_T1_Diferencia: TFloatField
      DisplayLabel = 'Diferencia'
      DisplayWidth = 15
      FieldName = 'Imp_T1_Diferencia'
    end
    object QDatosPct_T1_Diferencia: TFloatField
      Alignment = taCenter
      DisplayLabel = '%'
      DisplayWidth = 8
      FieldName = 'Pct_T1_Diferencia'
    end
    object QDatosImp_T4Yact: TFloatField
      DisplayWidth = 15
      FieldName = 'Imp_T4Yact'
    end
    object QDatosPct_T4YAct: TFloatField
      Alignment = taCenter
      DisplayLabel = '%'
      DisplayWidth = 8
      FieldName = 'Pct_T4YAct'
    end
    object QDatosImp_T4_Diferencia: TFloatField
      DisplayLabel = 'Diferencia'
      DisplayWidth = 15
      FieldName = 'Imp_T4_Diferencia'
    end
    object QDatosPct_T4_Diferencia: TFloatField
      Alignment = taCenter
      DisplayLabel = '%'
      DisplayWidth = 8
      FieldName = 'Pct_T4_Diferencia'
    end
    object QDatosB_Registro: TFloatField
      FieldName = 'B_Registro'
    end
    object QDatosOrden_Estructura: TFloatField
      FieldName = 'Orden_Estructura'
    end
  end
  object QLeyendaEntidades: TQuery
    SQL.Strings = (
      
        'Select '#39'Incluye información: '#39' || InitCap (Replace (Replace (Nvl' +
        ' (:peTipo_Entidad, PkgCRGPViews.Todas_Entidades), '#39'ORG-DESC'#39', '#39'Ó' +
        'rganos descentralizados'#39'), '#39'|'#39', '#39', '#39')) Leyenda_Entidades'
      '  From Dual             ')
    Left = 726
    Top = 34
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
  end
end
