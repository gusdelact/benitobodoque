object QrBitCh: TQrBitCh
  Left = 0
  Top = -64
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = QyBitCh
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
    63.5
    2159
    127
    2794
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
  object QRBand4: TQRBand
    Left = 48
    Top = 132
    Width = 960
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
      2540)
    BandType = rbColumnHeader
    object QRShape6: TQRShape
      Tag = 1
      Left = 828
      Top = 0
      Width = 52
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2190.75
        0
        137.583333333333)
      Shape = qrsRectangle
    end
    object QRShape4: TQRShape
      Tag = 1
      Left = 764
      Top = 0
      Width = 52
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2021.41666666667
        0
        137.583333333333)
      Shape = qrsRectangle
    end
    object QRShape2: TQRShape
      Tag = 1
      Left = 596
      Top = 0
      Width = 44
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1576.91666666667
        0
        116.416666666667)
      Shape = qrsRectangle
    end
    object qrshpDiferencia: TQRShape
      Tag = 1
      Left = 489
      Top = 0
      Width = 44
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1293.8125
        0
        116.416666666667)
      Shape = qrsRectangle
    end
    object qrshpSaldoFinal: TQRShape
      Tag = 1
      Left = 423
      Top = 0
      Width = 58
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1119.1875
        0
        153.458333333333)
      Shape = qrsRectangle
    end
    object qrshpInteresesDevengados: TQRShape
      Tag = 1
      Left = 368
      Top = 0
      Width = 44
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        973.666666666667
        0
        116.416666666667)
      Shape = qrsRectangle
    end
    object qrshpAbonos: TQRShape
      Tag = 1
      Left = 312
      Top = 0
      Width = 44
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        825.5
        0
        116.416666666667)
      Shape = qrsRectangle
    end
    object qrshpCargos: TQRShape
      Tag = 1
      Left = 257
      Top = 0
      Width = 44
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        679.979166666667
        0
        116.416666666667)
      Shape = qrsRectangle
    end
    object qrshpSaldoInicial: TQRShape
      Tag = 1
      Left = 209
      Top = 0
      Width = 41
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        552.979166666667
        0
        108.479166666667)
      Shape = qrsRectangle
    end
    object qrshpNombre: TQRShape
      Tag = 1
      Left = 136
      Top = 0
      Width = 68
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        359.833333333333
        0
        179.916666666667)
      Shape = qrsRectangle
    end
    object qrshpContrato: TQRShape
      Left = 1
      Top = 0
      Width = 125
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2.64583333333333
        0
        330.729166666667)
      Shape = qrsRectangle
    end
    object qrlblContrato: TQRLabel
      Left = 2
      Top = 1
      Width = 120
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        5.29166666666667
        2.64583333333333
        317.5)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Hora Actualización'
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
    object qrlblNombre: TQRLabel
      Tag = 1
      Left = 137
      Top = 1
      Width = 65
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        362.479166666667
        2.64583333333333
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Cve. Usuario'
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
    object qrlblSaldoInicial: TQRLabel
      Tag = 1
      Left = 210
      Top = 1
      Width = 39
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        555.625
        2.64583333333333
        103.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Movto'
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
    object qrlblCargos: TQRLabel
      Tag = 1
      Left = 259
      Top = 1
      Width = 42
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        685.270833333333
        2.64583333333333
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'T  Acred'
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
    object qrlblAbonos: TQRLabel
      Tag = 1
      Left = 313
      Top = 1
      Width = 42
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        828.145833333333
        2.64583333333333
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Em Nafin'
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
    object qrlblInteresesDevengados: TQRLabel
      Tag = 1
      Left = 369
      Top = 1
      Width = 42
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        976.3125
        2.64583333333333
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'T Cheq'
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
    object qrlblSaldoFinal: TQRLabel
      Tag = 1
      Left = 424
      Top = 1
      Width = 56
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1121.83333333333
        2.64583333333333
        148.166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Crédito'
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
    object qrlblDiferencia: TQRLabel
      Tag = 1
      Left = 490
      Top = 1
      Width = 42
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1296.45833333333
        2.64583333333333
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Bco'
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
    object QRShape7: TQRShape
      Tag = 1
      Left = 544
      Top = 0
      Width = 44
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1439.33333333333
        0
        116.416666666667)
      Shape = qrsRectangle
    end
    object QRLabel11: TQRLabel
      Tag = 1
      Left = 545
      Top = 1
      Width = 42
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1441.97916666667
        2.64583333333333
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'T Oper'
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
    object QRShape1: TQRShape
      Tag = 1
      Left = 652
      Top = 0
      Width = 44
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1725.08333333333
        0
        116.416666666667)
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Tag = 1
      Left = 597
      Top = 1
      Width = 42
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1579.5625
        2.64583333333333
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Predet'
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
    object QRLabel3: TQRLabel
      Tag = 1
      Left = 653
      Top = 1
      Width = 42
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1727.72916666667
        2.64583333333333
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Sit'
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
    object QRShape3: TQRShape
      Tag = 1
      Left = 708
      Top = 0
      Width = 44
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1873.25
        0
        116.416666666667)
      Shape = qrsRectangle
    end
    object QRLabel4: TQRLabel
      Tag = 1
      Left = 709
      Top = 1
      Width = 42
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1875.89583333333
        2.64583333333333
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Moneda'
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
      Tag = 1
      Left = 765
      Top = 1
      Width = 50
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2024.0625
        2.64583333333333
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'B Rel Cre'
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
      Tag = 1
      Left = 829
      Top = 1
      Width = 50
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2193.39583333333
        2.64583333333333
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'B Cta 3os'
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
    object QRShape8: TQRShape
      Tag = 1
      Left = 887
      Top = 0
      Width = 58
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2346.85416666667
        0
        153.458333333333)
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Tag = 1
      Left = 888
      Top = 1
      Width = 56
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2349.5
        2.64583333333333
        148.166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Id Titular'
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
  object qrGrpNOMBRE: TQRGroup
    Left = 48
    Top = 151
    Width = 960
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
      2540)
    Expression = 'NOMBRE'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape5: TQRShape
      Left = 12
      Top = 0
      Width = 709
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        31.75
        0
        1875.89583333333)
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 14
      Top = 2
      Width = 49
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        37.0416666666667
        5.29166666666667
        129.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Acreditado'
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
      Left = 144
      Top = 2
      Width = 84
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        381
        5.29166666666667
        222.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'NOM_ACRED_REG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText15: TQRDBText
      Left = 80
      Top = 2
      Width = 57
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        211.666666666667
        5.29166666666667
        150.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'K_ACREDITADO'
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
  object QRBand1: TQRBand
    Left = 48
    Top = 196
    Width = 960
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
      2540)
    BandType = rbDetail
    object QRDBText3: TQRDBText
      Left = 2
      Top = 2
      Width = 120
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        5.29166666666667
        5.29166666666667
        317.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'FH_REGISTRO'
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
    object QRDBText4: TQRDBText
      Left = 137
      Top = 2
      Width = 68
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        362.479166666667
        5.29166666666667
        179.916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'CVE_USUARIO'
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
    object QRDBText5: TQRDBText
      Left = 209
      Top = 2
      Width = 41
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        552.979166666667
        5.29166666666667
        108.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'MOVTO'
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
    object QRDBText6: TQRDBText
      Left = 256
      Top = 2
      Width = 44
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        677.333333333333
        5.29166666666667
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'CVE_TIPO_ACRED'
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
    object QRDBText7: TQRDBText
      Left = 311
      Top = 2
      Width = 44
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        822.854166666667
        5.29166666666667
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'CVE_EMISOR_NAFIN'
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
    object QRDBText8: TQRDBText
      Left = 367
      Top = 2
      Width = 44
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        971.020833333333
        5.29166666666667
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'CVE_TIPO_CHEQ'
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
    object QRDBText9: TQRDBText
      Left = 422
      Top = 2
      Width = 58
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1116.54166666667
        5.29166666666667
        153.458333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'ID_CREDITO'
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
    object QRDBText10: TQRDBText
      Left = 490
      Top = 2
      Width = 44
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1296.45833333333
        5.29166666666667
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'ID_BANCO_CHQRA'
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
    object QRDBText11: TQRDBText
      Left = 545
      Top = 2
      Width = 44
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1441.97916666667
        5.29166666666667
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'CVE_TIP_OPE_CHQ'
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
    object QRDBText12: TQRDBText
      Left = 601
      Top = 2
      Width = 34
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1590.14583333333
        5.29166666666667
        89.9583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'B_PREDETERMINADA'
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
    object QRDBText13: TQRDBText
      Left = 653
      Top = 2
      Width = 44
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1727.72916666667
        5.29166666666667
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'SIT_CHEQUERA'
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
    object QRDBText14: TQRDBText
      Left = 709
      Top = 2
      Width = 44
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1875.89583333333
        5.29166666666667
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'CVE_MONEDA'
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
      Left = 770
      Top = 2
      Width = 40
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2037.29166666667
        5.29166666666667
        105.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'B_REL_CREDITO'
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
    object QRDBText17: TQRDBText
      Left = 837
      Top = 2
      Width = 40
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2214.5625
        5.29166666666667
        105.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'B_CTA_TERCEROS'
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
    object QRDBText18: TQRDBText
      Left = 888
      Top = 2
      Width = 54
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2349.5
        5.29166666666667
        142.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'ID_TITULAR'
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
  object PageFooterBand1: TQRBand
    Left = 48
    Top = 212
    Width = 960
    Height = 61
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
      161.395833333333
      2540)
    BandType = rbPageFooter
    object QRLabel9: TQRLabel
      Left = 56
      Top = 8
      Width = 39
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        148.166666666667
        21.1666666666667
        103.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'T Acred :'
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
    object QRLabel10: TQRLabel
      Left = 78
      Top = 19
      Width = 122
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        206.375
        50.2708333333333
        322.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'AC = Acreditado / Emisor'
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
    object QRLabel12: TQRLabel
      Left = 78
      Top = 31
      Width = 137
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        206.375
        82.0208333333333
        362.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'AP = Acreditado / Procampo'
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
    object QRLabel13: TQRLabel
      Left = 78
      Top = 43
      Width = 76
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        206.375
        113.770833333333
        201.083333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'PR = Proveedor'
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
    object QRLabel14: TQRLabel
      Left = 288
      Top = 8
      Width = 37
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        762
        21.1666666666667
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'T Cheq :'
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
    object QRLabel15: TQRLabel
      Left = 311
      Top = 20
      Width = 85
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        822.854166666667
        52.9166666666667
        224.895833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'AD = Administrativa'
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
    object QRLabel16: TQRLabel
      Left = 311
      Top = 32
      Width = 70
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        822.854166666667
        84.6666666666667
        185.208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'LQ = Liquidación'
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
    object QRLabel17: TQRLabel
      Left = 472
      Top = 8
      Width = 35
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1248.83333333333
        21.1666666666667
        92.6041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'T Oper :'
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
    object QRLabel18: TQRLabel
      Left = 494
      Top = 20
      Width = 51
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1307.04166666667
        52.9166666666667
        134.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CR = Cargo'
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
    object QRLabel19: TQRLabel
      Left = 494
      Top = 32
      Width = 50
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1307.04166666667
        84.6666666666667
        132.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'AB = Abono'
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
    object QRLabel20: TQRLabel
      Left = 494
      Top = 44
      Width = 54
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1307.04166666667
        116.416666666667
        142.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'AM = Ambos'
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
    object QRShape9: TQRShape
      Left = 8
      Top = 0
      Width = 945
      Height = 4
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        10.5833333333333
        21.1666666666667
        0
        2500.3125)
      Shape = qrsHorLine
    end
  end
  object PageHeaderBand1: TQRBand
    Left = 48
    Top = 48
    Width = 960
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
      2540)
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
        2540)
      NomReporte = 'IntMQrBitCh'
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
  object qrGrpChequera: TQRGroup
    Left = 48
    Top = 169
    Width = 960
    Height = 27
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
      71.4375
      2540)
    Expression = 'QyBitCh.K_CUENTABANCO'
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel1: TQRLabel
      Left = 12
      Top = 7
      Width = 55
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        31.75
        18.5208333333333
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Chequera'
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
    object QRDBText2: TQRDBText
      Left = 75
      Top = 7
      Width = 95
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        198.4375
        18.5208333333333
        251.354166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QyBitCh
      DataField = 'K_CUENTABANCO'
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
  end
  object QyBitCh: TQuery
    SQL.Strings = (
      
        'SELECT CVE_USUARIO, FH_REGISTRO, SUBSTR(DESC_MODIF, 2, INSTR(DES' +
        'C_MODIF,'#39']'#39',1,1)-2) MOVTO, ACRE.NOM_ACRED_REG,'
      '       (CASE WHEN INSTR(CAMPOSLLAVE, '#39'Id_Acreditado'#39')>0 THEN '
      
        #9'              SUBSTR(CAMPOSLLAVE, (INSTR(CAMPOSLLAVE,'#39'Id_Acredi' +
        'tado'#39')+14), (INSTR(CAMPOSLLAVE,'#39' '#39',INSTR(CAMPOSLLAVE,'#39'Id_Acredit' +
        'ado'#39'),1))-(INSTR(CAMPOSLLAVE,'#39'Id_Acreditado'#39')+14)) ELSE '#39#39' END) ' +
        'K_ACREDITADO,'
      '       (CASE WHEN INSTR(CAMPOSLLAVE, '#39'Cuenta_Banco'#39')>0 THEN '
      
        #9'              SUBSTR(CAMPOSLLAVE, (INSTR(CAMPOSLLAVE,'#39'Cuenta_Ba' +
        'nco'#39')+13), (INSTR(CAMPOSLLAVE,'#39' '#39',INSTR(CAMPOSLLAVE,'#39'Cuenta_Banc' +
        'o'#39'),1))-(INSTR(CAMPOSLLAVE,'#39'Cuenta_Banco'#39')+13)) ELSE '#39#39' END) K_C' +
        'UENTABANCO,'#9#9#9#9'  '
      '       (CASE WHEN INSTR(DESC_MODIF, '#39'Id_Acreditado'#39')>0 THEN '
      
        #9'              SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,'#39'Id_Acredita' +
        'do'#39')+14), (INSTR(DESC_MODIF,'#39']'#39',INSTR(DESC_MODIF,'#39'Id_Acreditado'#39 +
        '),1))-(INSTR(DESC_MODIF,'#39'Id_Acreditado'#39')+14)) ELSE '#39#39' END) ID_AC' +
        'REDITADO,'#9#9'  '
      '       (CASE WHEN INSTR(DESC_MODIF, '#39'Cve_Tipo_Acred'#39')>0 THEN '
      
        #9'              SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,'#39'Cve_Tipo_Ac' +
        'red'#39')+15), (INSTR(DESC_MODIF,'#39']'#39',INSTR(DESC_MODIF,'#39'Cve_Tipo_Acre' +
        'd'#39'),1))-(INSTR(DESC_MODIF,'#39'Cve_Tipo_Acred'#39')+15)) ELSE '#39#39' END) AS' +
        ' CVE_TIPO_ACRED,'
      '       (CASE WHEN INSTR(DESC_MODIF, '#39'Cve_Emisor_Nafin'#39')>0 THEN '
      
        #9'              SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,'#39'Cve_Emisor_' +
        'Nafin'#39')+17), (INSTR(DESC_MODIF,'#39']'#39',INSTR(DESC_MODIF,'#39'Cve_Emisor_' +
        'Nafin'#39'),1))-(INSTR(DESC_MODIF,'#39'Cve_Emisor_Nafin'#39')+17)) ELSE '#39#39' E' +
        'ND) AS CVE_EMISOR_NAFIN,'#9#9#9#9'  '#9#9'  '
      '       (CASE WHEN INSTR(DESC_MODIF, '#39'Cve_Tipo_Cheq'#39')>0 THEN '
      
        #9'              SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,'#39'Cve_Tipo_Ch' +
        'eq'#39')+14), (INSTR(DESC_MODIF,'#39']'#39',INSTR(DESC_MODIF,'#39'Cve_Tipo_Cheq'#39 +
        '),1))-(INSTR(DESC_MODIF,'#39'Cve_Tipo_Cheq'#39')+14)) ELSE '#39#39' END) AS CV' +
        'E_TIPO_CHEQ,'#9#9#9#9'  '#9#9'  '
      '       (CASE WHEN INSTR(DESC_MODIF, '#39'Id_Credito'#39')>0 THEN '
      
        #9'              SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,'#39'Id_Credito'#39 +
        ')+11), (INSTR(DESC_MODIF,'#39']'#39',INSTR(DESC_MODIF,'#39'Id_Credito'#39'),1))-' +
        '(INSTR(DESC_MODIF,'#39'Id_Credito'#39')+11)) ELSE '#39#39' END) AS ID_CREDITO,' +
        #9#9#9#9'  '#9#9'  '
      '       (CASE WHEN INSTR(DESC_MODIF, '#39'Id_Banco_Chqra'#39')>0 THEN '
      
        #9'              SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,'#39'Id_Banco_Ch' +
        'qra'#39')+15), (INSTR(DESC_MODIF,'#39']'#39',INSTR(DESC_MODIF,'#39'Id_Banco_Chqr' +
        'a'#39'),1))-(INSTR(DESC_MODIF,'#39'Id_Banco_Chqra'#39')+15)) ELSE '#39#39' END) AS' +
        ' ID_BANCO_CHQRA,'#9#9#9#9'  '#9#9'  '
      '       (CASE WHEN INSTR(DESC_MODIF, '#39'Cuenta_Banco'#39')>0 THEN '
      
        #9'              SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,'#39'Cuenta_Banc' +
        'o'#39')+13), (INSTR(DESC_MODIF,'#39']'#39',INSTR(DESC_MODIF,'#39'Cuenta_Banco'#39'),' +
        '1))-(INSTR(DESC_MODIF,'#39'Cuenta_Banco'#39')+13)) ELSE '#39#39' END) AS CUENT' +
        'A_BANCO,'#9#9#9#9'  '#9#9'  '
      '       (CASE WHEN INSTR(DESC_MODIF, '#39'Cve_Tip_Ope_Chq'#39')>0 THEN '
      
        #9'              SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,'#39'Cve_Tip_Ope' +
        '_Chq'#39')+17), (INSTR(DESC_MODIF,'#39']'#39',INSTR(DESC_MODIF,'#39'Cve_Tip_Ope_' +
        'Chq'#39'),1))-(INSTR(DESC_MODIF,'#39'Cve_Tip_Ope_Chq'#39')+17)) ELSE '#39#39' END)' +
        ' AS CVE_TIP_OPE_CHQ,'#9#9#9#9'  '#9#9'  '
      '       (CASE WHEN INSTR(DESC_MODIF, '#39'B_Predeterminada'#39')>0 THEN '
      
        #9'              SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,'#39'B_Predeterm' +
        'inada'#39')+18), (INSTR(DESC_MODIF,'#39']'#39',INSTR(DESC_MODIF,'#39'B_Predeterm' +
        'inada'#39'),1))-(INSTR(DESC_MODIF,'#39'B_Predeterminada'#39')+18)) ELSE '#39#39' E' +
        'ND) AS B_PREDETERMINADA,'
      '       (CASE WHEN INSTR(DESC_MODIF, '#39'Sit_Chequera'#39')>0 THEN '
      
        #9'              SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,'#39'Sit_Chequer' +
        'a'#39')+13), (INSTR(DESC_MODIF,'#39']'#39',INSTR(DESC_MODIF,'#39'Sit_Chequera'#39'),' +
        '1))-(INSTR(DESC_MODIF,'#39'Sit_Chequera'#39')+13)) ELSE '#39#39' END) AS SIT_C' +
        'HEQUERA,'#9#9#9#9'  '#9#9#9#9'  '#9#9'  '
      '       (CASE WHEN INSTR(DESC_MODIF, '#39'Cve_Moneda'#39')>0 THEN '
      
        #9'              SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,'#39'Cve_Moneda'#39 +
        ')+11), (INSTR(DESC_MODIF,'#39']'#39',INSTR(DESC_MODIF,'#39'Cve_Moneda'#39'),1))-' +
        '(INSTR(DESC_MODIF,'#39'Cve_Moneda'#39')+11)) ELSE '#39#39' END) AS CVE_MONEDA,' +
        #9#9#9#9'  '#9#9#9#9'  '#9#9'  '
      '       (CASE WHEN INSTR(DESC_MODIF, '#39'B_Rel_Credito'#39')>0 THEN '
      
        #9'              SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,'#39'B_Rel_Credi' +
        'to'#39')+14), (INSTR(DESC_MODIF,'#39']'#39',INSTR(DESC_MODIF,'#39'B_Rel_Credito'#39 +
        '),1))-(INSTR(DESC_MODIF,'#39'B_Rel_Credito'#39')+14)) ELSE '#39#39' END) AS B_' +
        'REL_CREDITO,'#9#9#9#9'  '#9#9#9#9'  '#9#9'  '
      '       (CASE WHEN INSTR(DESC_MODIF, '#39'B_Cta_Terceros'#39')>0 THEN '
      
        #9'              SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,'#39'B_Cta_Terce' +
        'ros'#39')+15), (INSTR(DESC_MODIF,'#39']'#39',INSTR(DESC_MODIF,'#39'B_Cta_Tercero' +
        's'#39'),1))-(INSTR(DESC_MODIF,'#39'B_Cta_Terceros'#39')+15)) ELSE '#39#39' END) AS' +
        ' B_CTA_TERCEROS,'#9#9#9#9'  '#9#9#9#9'  '#9#9'  '
      '       (CASE WHEN INSTR(DESC_MODIF, '#39'Id_Titular'#39')>0 THEN '
      
        #9'              SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,'#39'Id_Titular'#39 +
        ')+11), (INSTR(DESC_MODIF,'#39']'#39',INSTR(DESC_MODIF,'#39'Id_Titular'#39'),1))-' +
        '(INSTR(DESC_MODIF,'#39'Id_Titular'#39')+11)) ELSE '#39#39' END) AS ID_TITULAR,' +
        #9#9#9#9'  '#9#9#9#9'  '#9#9'  '
      '       (CASE WHEN INSTR(DESC_MODIF, '#39'Secuencia'#39')>0 THEN '
      
        #9'              SUBSTR(DESC_MODIF, (INSTR(DESC_MODIF,'#39'Secuencia'#39')' +
        '+10), (INSTR(DESC_MODIF,'#39']'#39',INSTR(DESC_MODIF,'#39'Secuencia'#39'),1))-(I' +
        'NSTR(DESC_MODIF,'#39'Secuencia'#39')+10)) ELSE '#39#39' END) AS SECUENCIA'#9#9#9#9' ' +
        ' '#9#9#9#9'  '#9#9'  '#9'    '
      'FROM CR_BITACORA_UPD BIT, CR_ACREDITADO ACRE'
      'WHERE 1 = 1'
      '  AND (CASE WHEN INSTR(CAMPOSLLAVE, '#39'Id_Acreditado'#39')>0 THEN'
      
        #9'        SUBSTR(CAMPOSLLAVE, (INSTR(CAMPOSLLAVE,'#39'Id_Acreditado'#39')' +
        '+14),'
      
        #9#9#9'       (INSTR(CAMPOSLLAVE,'#39' '#39',INSTR(CAMPOSLLAVE,'#39'Id_Acreditad' +
        'o'#39'),1))-(INSTR(CAMPOSLLAVE,'#39'Id_Acreditado'#39')+14))'
      #9#9#9'ELSE '#39#39' END) = ACRE.ID_ACREDITADO'
      '  AND NOM_TABLA = '#39'CR_CRED_CHEQ'#39
      '  AND CAMPOSLLAVE like '#39'%Id_Acreditado=406668%'#39' '
      '--  AND CAMPOSLLAVE like '#39'%Cve_Tipo_Acred=AC%'#39' '
      '--  AND CAMPOSLLAVE like '#39'%Cve_Emisor_Nafin=0%'#39' '
      '--  AND CAMPOSLLAVE like '#39'%Cve_Tipo_Cheq=AD%'#39' '
      '--  AND CAMPOSLLAVE like '#39'%Id_Credito=326762%'#39' '
      '--  AND CAMPOSLLAVE like '#39'%Id_Banco_Chqra=2%'#39' '
      '--  AND CAMPOSLLAVE like '#39'%Cuenta_Banco=302143631%'#39
      'ORDER BY K_ACREDITADO, K_CUENTABANCO, ID_BITACORA '
      ' ')
    Left = 32
    Top = 5
    object QyBitChCVE_USUARIO: TStringField
      FieldName = 'CVE_USUARIO'
      Size = 30
    end
    object QyBitChFH_REGISTRO: TDateTimeField
      FieldName = 'FH_REGISTRO'
    end
    object QyBitChMOVTO: TMemoField
      FieldName = 'MOVTO'
      BlobType = ftMemo
      Size = 1999
    end
    object QyBitChK_ACREDITADO: TStringField
      FieldName = 'K_ACREDITADO'
      Size = 250
    end
    object QyBitChK_CUENTABANCO: TStringField
      FieldName = 'K_CUENTABANCO'
      Size = 250
    end
    object QyBitChID_ACREDITADO: TMemoField
      FieldName = 'ID_ACREDITADO'
      BlobType = ftMemo
      Size = 2000
    end
    object QyBitChCVE_TIPO_ACRED: TMemoField
      FieldName = 'CVE_TIPO_ACRED'
      BlobType = ftMemo
      Size = 2000
    end
    object QyBitChCVE_EMISOR_NAFIN: TMemoField
      FieldName = 'CVE_EMISOR_NAFIN'
      BlobType = ftMemo
      Size = 2000
    end
    object QyBitChCVE_TIPO_CHEQ: TMemoField
      FieldName = 'CVE_TIPO_CHEQ'
      BlobType = ftMemo
      Size = 2000
    end
    object QyBitChID_CREDITO: TMemoField
      FieldName = 'ID_CREDITO'
      BlobType = ftMemo
      Size = 2000
    end
    object QyBitChID_BANCO_CHQRA: TMemoField
      FieldName = 'ID_BANCO_CHQRA'
      BlobType = ftMemo
      Size = 2000
    end
    object QyBitChCUENTA_BANCO: TMemoField
      FieldName = 'CUENTA_BANCO'
      BlobType = ftMemo
      Size = 2000
    end
    object QyBitChCVE_TIP_OPE_CHQ: TMemoField
      FieldName = 'CVE_TIP_OPE_CHQ'
      BlobType = ftMemo
      Size = 2000
    end
    object QyBitChB_PREDETERMINADA: TMemoField
      FieldName = 'B_PREDETERMINADA'
      BlobType = ftMemo
      Size = 2000
    end
    object QyBitChSIT_CHEQUERA: TMemoField
      FieldName = 'SIT_CHEQUERA'
      BlobType = ftMemo
      Size = 2000
    end
    object QyBitChCVE_MONEDA: TMemoField
      FieldName = 'CVE_MONEDA'
      BlobType = ftMemo
      Size = 2000
    end
    object QyBitChB_REL_CREDITO: TMemoField
      FieldName = 'B_REL_CREDITO'
      BlobType = ftMemo
      Size = 2000
    end
    object QyBitChB_CTA_TERCEROS: TMemoField
      FieldName = 'B_CTA_TERCEROS'
      BlobType = ftMemo
      Size = 2000
    end
    object QyBitChID_TITULAR: TMemoField
      FieldName = 'ID_TITULAR'
      BlobType = ftMemo
      Size = 2000
    end
    object QyBitChSECUENCIA: TMemoField
      FieldName = 'SECUENCIA'
      BlobType = ftMemo
      Size = 2000
    end
    object QyBitChNOM_ACRED_REG: TStringField
      FieldName = 'NOM_ACRED_REG'
      Size = 80
    end
  end
end
