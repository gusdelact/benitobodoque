object QREdoCC: TQREdoCC
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
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
    200
    2794
    250
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
  object GrpContrato: TQRGroup
    Left = 38
    Top = 94
    Width = 740
    Height = 31
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = GrpContratoAfterPrint
    AlignToBottom = False
    BeforePrint = GrpContratoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = True
    Size.Values = (
      82.0208333333333
      1957.91666666667)
    Expression = 'ID_CONTRATO'
    FooterBand = GrpPieContrato
    Master = Owner
    ReprintOnNewPage = False
    object reEncabezado: TQRRichText
      Left = 2
      Top = 0
      Width = 736
      Height = 29
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        76.7291666666667
        5.29166666666667
        0
        1947.33333333333)
      Alignment = taLeftJustify
      AutoStretch = True
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
    end
  end
  object QRGroup2: TQRGroup
    Left = 38
    Top = 220
    Width = 740
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
      1957.91666666667)
    Expression = 'ESTATUS'
    Master = Owner
    ReprintOnNewPage = False
  end
  object BandaDetalle: TQRBand
    Left = 38
    Top = 706
    Width = 740
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = BandaDetalleAfterPrint
    AlignToBottom = False
    BeforePrint = BandaDetalleBeforePrint
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = GrpDetalle
    ParentFont = False
    Size.Values = (
      37.0416666666667
      1957.91666666667)
    BandType = rbDetail
    object dt_dato1: TQRDBText
      Left = 6
      Top = 0
      Width = 58
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        15.875
        0
        153.458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
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
    object dt_dato2: TQRDBText
      Left = 66
      Top = 0
      Width = 57
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        174.625
        0
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'F_INICIO'
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
    object dt_Dato3: TQRDBText
      Left = 128
      Top = 0
      Width = 57
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        338.666666666667
        0
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'F_VENCIMIENTO'
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
    object dt_dato4: TQRDBText
      Left = 200
      Top = 0
      Width = 31
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        529.166666666667
        0
        82.0208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'PLAZO'
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
    object dt_dato5: TQRDBText
      Left = 240
      Top = 0
      Width = 53
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        635
        0
        140.229166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'TASA_BASE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#0.0000'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object dt_dato8: TQRDBText
      Left = 419
      Top = 0
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1108.60416666667
        0
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IMPORTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object dt_dato9: TQRDBText
      Left = 501
      Top = 0
      Width = 53
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1325.5625
        0
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'F_PAGO'
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
    object dt_dato11: TQRDBText
      Left = 615
      Top = 0
      Width = 55
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1627.1875
        0
        145.520833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IMP_MORA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object dt_dato12: TQRDBText
      Left = 680
      Top = 0
      Width = 55
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1799.16666666667
        0
        145.520833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IMP_IVA_MORA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object dt_Dato10: TQRDBText
      Left = 556
      Top = 0
      Width = 55
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1471.08333333333
        0
        145.520833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IVA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object dt_dato6: TQRDBText
      Left = 300
      Top = 0
      Width = 56
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        793.75
        0
        148.166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'SOBRETASA'
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
    object dt_dato7: TQRDBText
      Left = 360
      Top = 0
      Width = 56
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        952.5
        0
        148.166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'TASA_FINAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#0.0000'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object GrpDetalle: TQRGroup
    Left = 38
    Top = 220
    Width = 740
    Height = 57
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = GrpDetalleBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      150.8125
      1957.91666666667)
    Expression = 'CONCEPTO'
    FooterBand = GrpPieDetalle
    Master = Owner
    ReprintOnNewPage = False
    object lb_titulo1: TQRLabel
      Left = 6
      Top = 27
      Width = 43
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        15.875
        71.4375
        113.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CREDITO'
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
    object qrlPeriodo: TQRLabel
      Left = 102
      Top = 25
      Width = 44
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        269.875
        66.1458333333333
        116.416666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'PERIODO'
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
    object lbTitulo2: TQRLabel
      Left = 68
      Top = 34
      Width = 45
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        179.916666666667
        89.9583333333333
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'INCIO'
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
    object lbTitulo3: TQRLabel
      Left = 122
      Top = 34
      Width = 65
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        322.791666666667
        89.9583333333333
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VENCIMIENTO'
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
    object lbTitulo4: TQRLabel
      Left = 200
      Top = 25
      Width = 29
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        529.166666666667
        66.1458333333333
        76.7291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'NO. DIAS'
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
    object lbTitulo5: TQRLabel
      Left = 236
      Top = 25
      Width = 49
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        624.416666666667
        66.1458333333333
        129.645833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'TASA FIJA'
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
    object lbTitulo6: TQRLabel
      Left = 297
      Top = 25
      Width = 61
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        785.8125
        66.1458333333333
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'PUNTOS PORCENT.'
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
    object lbTitulo7: TQRLabel
      Left = 360
      Top = 25
      Width = 60
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.1458333333333
        952.5
        66.1458333333333
        158.75)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'TASA FIJA + 8'
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
    object lbTitulo8: TQRLabel
      Left = 429
      Top = 25
      Width = 68
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1135.0625
        66.1458333333333
        179.916666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'IMPORTE'
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
    object lbTitulo9: TQRLabel
      Left = 498
      Top = 25
      Width = 59
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.1458333333333
        1317.625
        66.1458333333333
        156.104166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'FECHA DE PAGO'
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
    object qrTituloSegmento: TQRLabel
      Left = 8
      Top = 4
      Width = 729
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        21.1666666666667
        10.5833333333333
        1928.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrTituloSegmento'
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
    object lbTitulo10: TQRLabel
      Left = 559
      Top = 25
      Width = 46
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1479.02083333333
        66.1458333333333
        121.708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'IVA  '
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
    object lbtitulo11: TQRLabel
      Left = 609
      Top = 25
      Width = 70
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.1458333333333
        1611.3125
        66.1458333333333
        185.208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'IMPORTE MORAS'
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
    object lbTitulo12: TQRLabel
      Left = 680
      Top = 25
      Width = 57
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1799.16666666667
        66.1458333333333
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'IVA MORAS'
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
    object QRShape6: TQRShape
      Left = 10
      Top = 52
      Width = 720
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.9375
        26.4583333333333
        137.583333333333
        1905)
      Shape = qrsHorLine
    end
    object QRShape4: TQRShape
      Left = 10
      Top = 18
      Width = 720
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        26.4583333333333
        47.625
        1905)
      Shape = qrsHorLine
    end
  end
  object GrpPieDetalle: TQRBand
    Left = 38
    Top = 761
    Width = 740
    Height = 18
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = GrpPieDetalleBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      47.625
      1957.91666666667)
    BandType = rbGroupFooter
    object totMORAS: TQRExpr
      Left = 615
      Top = 6
      Width = 55
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1627.1875
        15.875
        145.520833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      Master = Owner
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(IMP_MORA)'
      Mask = '###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr3: TQRExpr
      Left = 556
      Top = 6
      Width = 55
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1471.08333333333
        15.875
        145.520833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      Master = Owner
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(IVA)'
      Mask = '###,###,###,##0.00'
      FontSize = 7
    end
    object QRExpr4: TQRExpr
      Left = 680
      Top = 6
      Width = 55
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1799.16666666667
        15.875
        145.520833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      Master = Owner
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(IMP_IVA_MORA)'
      Mask = '###,###,###,##0.00'
      FontSize = 7
    end
    object Linea1: TQRShape
      Left = 415
      Top = 1
      Width = 322
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1098.02083333333
        2.64583333333333
        851.958333333333)
      Shape = qrsHorLine
    end
    object totIMPORTE: TQRExpr
      Left = 424
      Top = 6
      Width = 75
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1121.83333333333
        15.875
        198.4375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      Master = Owner
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(IMPORTE)'
      Mask = '###,###,###,##0.00'
      FontSize = 7
    end
  end
  object GrpPieContrato: TQRBand
    Left = 38
    Top = 873
    Width = 740
    Height = 30
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
      79.375
      1957.91666666667)
    BandType = rbGroupFooter
    object repieDocumento: TQRRichText
      Left = 2
      Top = 0
      Width = 734
      Height = 29
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        76.7291666666667
        5.29166666666667
        0
        1942.04166666667)
      Alignment = taLeftJustify
      AutoStretch = True
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
    end
  end
  object ChildBand1: TQRChildBand
    Left = 38
    Top = 277
    Width = 740
    Height = 37
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      97.8958333333333
      1957.91666666667)
    ParentBand = GrpDetalle
    object QRLabel6: TQRLabel
      Left = 270
      Top = 21
      Width = 58
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        714.375
        55.5625
        153.458333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CREDITO'
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
    object QRLabel7: TQRLabel
      Left = 333
      Top = 21
      Width = 57
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        881.0625
        55.5625
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'FECHA'
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
    object QRLabel8: TQRLabel
      Left = 393
      Top = 21
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1039.8125
        55.5625
        209.020833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'IMPORTE'
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
    object QRShape1: TQRShape
      Left = 261
      Top = 36
      Width = 215
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.9375
        690.5625
        95.25
        568.854166666667)
      Shape = qrsHorLine
    end
    object QRLabel9: TQRLabel
      Left = 8
      Top = 3
      Width = 729
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        21.1666666666667
        7.9375
        1928.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CAPITAL DISPUESTO '
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
    object QRShape12: TQRShape
      Left = 261
      Top = 19
      Width = 215
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.9375
        690.5625
        50.2708333333333
        568.854166666667)
      Shape = qrsHorLine
    end
  end
  object ChildBand2: TQRChildBand
    Left = 38
    Top = 314
    Width = 740
    Height = 54
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand2BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      142.875
      1957.91666666667)
    ParentBand = ChildBand1
    object QRLabel10: TQRLabel
      Left = 8
      Top = 3
      Width = 729
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        21.1666666666667
        7.9375
        1928.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'RESUMEN DE PAGOS'
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
    object QRLabel12: TQRLabel
      Left = 42
      Top = 24
      Width = 73
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        111.125
        63.5
        193.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'IMPORTE PAGADO'
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
      Left = 122
      Top = 24
      Width = 73
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        322.791666666667
        63.5
        193.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'FECHA'
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
      Left = 202
      Top = 24
      Width = 73
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        534.458333333333
        63.5
        193.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CAPITAL'
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
    object QRLabel21: TQRLabel
      Left = 282
      Top = 24
      Width = 87
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        746.125
        63.5
        230.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'FINANCIAMIENTO ADICIONAL'
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
    object QRLabel22: TQRLabel
      Left = 374
      Top = 24
      Width = 73
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        989.541666666667
        63.5
        193.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'INTERESES ORDINARIOS'
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
    object QRLabel23: TQRLabel
      Left = 470
      Top = 24
      Width = 73
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1243.54166666667
        63.5
        193.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CONCEPTOS'
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
    object QRLabel24: TQRLabel
      Left = 558
      Top = 24
      Width = 73
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1476.375
        63.5
        193.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'MORATORIOS'
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
    object QRLabel25: TQRLabel
      Left = 646
      Top = 24
      Width = 73
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1709.20833333333
        63.5
        193.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'IVAS'
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
    object QRShape5: TQRShape
      Left = 10
      Top = 20
      Width = 720
      Height = 4
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        10.5833333333333
        26.4583333333333
        52.9166666666667
        1905)
      Shape = qrsHorLine
    end
    object QRShape11: TQRShape
      Left = 10
      Top = 47
      Width = 720
      Height = 4
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        10.5833333333333
        26.4583333333333
        124.354166666667
        1905)
      Shape = qrsHorLine
    end
  end
  object ChildBand3: TQRChildBand
    Left = 38
    Top = 720
    Width = 740
    Height = 10
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = ChildBand3AfterPrint
    AlignToBottom = False
    BeforePrint = ChildBand3BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = ChildBand1
    Size.Values = (
      26.4583333333333
      1957.91666666667)
    ParentBand = BandaDetalle
    object QRDBText1: TQRDBText
      Left = 270
      Top = 0
      Width = 58
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        714.375
        0
        153.458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
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
    object QRDBText2: TQRDBText
      Left = 333
      Top = 0
      Width = 57
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        881.0625
        0
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'F_INICIO'
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
    object QRDBText3: TQRDBText
      Left = 393
      Top = 0
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1039.8125
        0
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IMPORTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object ChildBand4: TQRChildBand
    Left = 38
    Top = 368
    Width = 740
    Height = 294
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand4BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      777.875
      1957.91666666667)
    ParentBand = ChildBand2
    object QRLabel11: TQRLabel
      Left = 5
      Top = 245
      Width = 729
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        13.2291666666667
        648.229166666667
        1928.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'LO ANTERIOR SE DESPRENDE TOMANDO COMO BASE LO SIGUIENTE'
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
    object QRShape13: TQRShape
      Left = 3
      Top = 257
      Width = 734
      Height = 4
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        10.5833333333333
        7.9375
        679.979166666667
        1942.04166666667)
      Shape = qrsHorLine
    end
    object QRLabel45: TQRLabel
      Left = 2
      Top = 273
      Width = 37
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        5.29166666666667
        722.3125
        97.8958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CREDITO'
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
    object QRLabel46: TQRLabel
      Left = 37
      Top = 273
      Width = 57
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        97.8958333333333
        722.3125
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'INCIO'
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
    object QRLabel47: TQRLabel
      Left = 98
      Top = 273
      Width = 56
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        259.291666666667
        722.3125
        148.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'VENCIMIENTO'
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
    object QRLabel48: TQRLabel
      Left = 65
      Top = 261
      Width = 37
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        171.979166666667
        690.5625
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'PERIODO'
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
    object QRLabel49: TQRLabel
      Left = 157
      Top = 262
      Width = 30
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        415.395833333333
        693.208333333333
        79.375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'TASA FIJA'
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
    object QRLabel50: TQRLabel
      Left = 188
      Top = 264
      Width = 38
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        497.416666666667
        698.5
        100.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'PUNTOS PORC.'
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
    object QRLabel51: TQRLabel
      Left = 224
      Top = 263
      Width = 36
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        592.666666666667
        695.854166666667
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'TASA TIIE + 8'
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
    object QRLabel52: TQRLabel
      Left = 302
      Top = 264
      Width = 55
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        799.041666666667
        698.5
        145.520833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CAPITAL'
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
    object QRLabel53: TQRLabel
      Left = 357
      Top = 264
      Width = 71
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        944.5625
        698.5
        187.854166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'FINANCIAMIENTO ADICIONAL'
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
    object QRLabel54: TQRLabel
      Left = 425
      Top = 264
      Width = 63
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        1124.47916666667
        698.5
        166.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'INTERESES ORDINARIOS'
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
    object QRLabel55: TQRLabel
      Left = 490
      Top = 264
      Width = 63
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        1296.45833333333
        698.5
        166.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CONCEPTOS'
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
    object QRLabel56: TQRLabel
      Left = 683
      Top = 264
      Width = 53
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        1807.10416666667
        698.5
        140.229166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'TOTAL ADEUDO'
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
    object QRLabel14: TQRLabel
      Left = 172
      Top = 19
      Width = 82
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        455.083333333333
        50.2708333333333
        216.958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CAPITAL VIGENTE'
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
      Left = 172
      Top = 32
      Width = 85
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        455.083333333333
        84.6666666666667
        224.895833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CAPITAL VENCIDO'
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
      Left = 172
      Top = 44
      Width = 89
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        455.083333333333
        116.416666666667
        235.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'MORAS AL CAPITAL'
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
      Left = 172
      Top = 69
      Width = 208
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        455.083333333333
        182.5625
        550.333333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'REFINANCIAMIENTO DE INTERESES VIGENTE'
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
      Left = 172
      Top = 81
      Width = 217
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        455.083333333333
        214.3125
        574.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'REFINANCIAMIENTO DE INTERESES VENCIDOS'
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
    object QRLabel29: TQRLabel
      Left = 172
      Top = 93
      Width = 165
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        455.083333333333
        246.0625
        436.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'MORAS SOBRE REFINANCIAMIENTO'
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
    object QRLabel33: TQRLabel
      Left = 172
      Top = 119
      Width = 165
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        455.083333333333
        314.854166666667
        436.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'INTERESES ORDINARIOS VIGENTES'
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
    object QRLabel32: TQRLabel
      Left = 172
      Top = 145
      Width = 156
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        455.083333333333
        383.645833333333
        412.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'INTERES ORDINARIOS VENCIDOS'
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
    object QRLabel35: TQRLabel
      Left = 20
      Top = 66
      Width = 108
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        52.9166666666667
        174.625
        285.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CONCEPTOS VIGENTES'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel34: TQRLabel
      Left = 172
      Top = 172
      Width = 111
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        455.083333333333
        455.083333333333
        293.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CONCEPTOS VENCIDOS'
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
    object QRLabel30: TQRLabel
      Left = 172
      Top = 197
      Width = 130
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        455.083333333333
        521.229166666667
        343.958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'MORAS SOBRE CONCEPTOS'
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
    object qrlCAPvig: TQRLabel
      Left = 448
      Top = 19
      Width = 99
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1185.33333333333
        50.2708333333333
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPvig'
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
    object qrlCapVdo: TQRLabel
      Left = 448
      Top = 32
      Width = 99
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1185.33333333333
        84.6666666666667
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
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
    object qrlCapMor: TQRLabel
      Left = 448
      Top = 44
      Width = 99
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1185.33333333333
        116.416666666667
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
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
    object qrlFAVIG: TQRLabel
      Left = 448
      Top = 69
      Width = 99
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1185.33333333333
        182.5625
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
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
    object qrlFAVdo: TQRLabel
      Left = 448
      Top = 81
      Width = 99
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1185.33333333333
        214.3125
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
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
    object qrlFAMor: TQRLabel
      Left = 448
      Top = 93
      Width = 99
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1185.33333333333
        246.0625
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
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
    object qrlINTVig: TQRLabel
      Left = 448
      Top = 119
      Width = 99
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1185.33333333333
        314.854166666667
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
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
    object qrlINTVdo: TQRLabel
      Left = 448
      Top = 145
      Width = 99
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        1185.33333333333
        383.645833333333
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
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
    object qrlCONVig: TQRLabel
      Left = 24
      Top = 82
      Width = 99
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        63.5
        216.958333333333
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrlCONVdo: TQRLabel
      Left = 448
      Top = 172
      Width = 99
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1185.33333333333
        455.083333333333
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
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
    object qrlCONMor: TQRLabel
      Left = 448
      Top = 197
      Width = 99
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        1185.33333333333
        521.229166666667
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
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
    object QRShape14: TQRShape
      Left = 3
      Top = 288
      Width = 734
      Height = 4
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        10.5833333333333
        7.9375
        762
        1942.04166666667)
      Shape = qrsHorLine
    end
    object QRLabel13: TQRLabel
      Left = 0
      Top = 1
      Width = 737
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        0
        2.64583333333333
        1949.97916666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'RESUMEN DE ADEUDO'
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
    object QRLabel57: TQRLabel
      Left = 260
      Top = 263
      Width = 40
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        687.916666666667
        695.854166666667
        105.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'TASA MORAT. ORDIN. POR'
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
    object QRLabel40: TQRLabel
      Left = 621
      Top = 264
      Width = 63
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        1643.0625
        698.5
        166.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'IVA'
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
    object QRLabel58: TQRLabel
      Left = 556
      Top = 264
      Width = 63
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        1471.08333333333
        698.5
        166.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'MORATORIOS'
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
    object QRLabel31: TQRLabel
      Left = 172
      Top = 226
      Width = 107
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        455.083333333333
        597.958333333333
        283.104166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL DEL ADEUDO'
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
    object qrTotalAdeudo: TQRLabel
      Left = 448
      Top = 226
      Width = 99
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1185.33333333333
        597.958333333333
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
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
    object QRShape16: TQRShape
      Left = 72
      Top = 225
      Width = 577
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        190.5
        595.3125
        1526.64583333333)
      Shape = qrsRectangle
    end
    object QRLabel59: TQRLabel
      Left = 172
      Top = 184
      Width = 135
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        455.083333333333
        486.833333333333
        357.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CONCEPTOS VENCIDOS (IVA)'
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
    object qrlCONVdoIVA: TQRLabel
      Left = 448
      Top = 184
      Width = 99
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1185.33333333333
        486.833333333333
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
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
    object qrlCONVigIVA: TQRLabel
      Left = 24
      Top = 119
      Width = 99
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        63.5
        314.854166666667
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel61: TQRLabel
      Left = 12
      Top = 103
      Width = 132
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        31.75
        272.520833333333
        349.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CONCEPTOS VIGENTES (IVA)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel60: TQRLabel
      Left = 172
      Top = 132
      Width = 192
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        455.083333333333
        349.25
        508)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'INTERESES ORDINARIOS VIGENTES  (IVA)'
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
    object qrlINTVigIva: TQRLabel
      Left = 448
      Top = 132
      Width = 99
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1185.33333333333
        349.25
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
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
    object QRLabel63: TQRLabel
      Left = 172
      Top = 157
      Width = 180
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        455.083333333333
        415.395833333333
        476.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'INTERES ORDINARIOS VENCIDOS (IVA)'
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
    object qrlINTVdoIva: TQRLabel
      Left = 448
      Top = 157
      Width = 99
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        1185.33333333333
        415.395833333333
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
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
    object QRLabel62: TQRLabel
      Left = 172
      Top = 56
      Width = 113
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        455.083333333333
        148.166666666667
        298.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'MORAS AL CAPITAL (IVA)'
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
    object QRLabel64: TQRLabel
      Left = 172
      Top = 105
      Width = 192
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        455.083333333333
        277.8125
        508)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'MORAS SOBRE REFINANCIAMIENTO  (IVA)'
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
    object qrlFAMorIVA: TQRLabel
      Left = 448
      Top = 105
      Width = 99
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1185.33333333333
        277.8125
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
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
    object qrlCapMorIVA: TQRLabel
      Left = 448
      Top = 56
      Width = 99
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1185.33333333333
        148.166666666667
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
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
    object QRLabel65: TQRLabel
      Left = 172
      Top = 210
      Width = 154
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        455.083333333333
        555.625
        407.458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'MORAS SOBRE CONCEPTOS (IVA)'
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
    object qrlCONMorIVA: TQRLabel
      Left = 448
      Top = 210
      Width = 99
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        1185.33333333333
        555.625
        261.9375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCAPITALVIGENTE'
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
  end
  object ChildBand5: TQRChildBand
    Left = 38
    Top = 730
    Width = 740
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = ChildBand5AfterPrint
    AlignToBottom = False
    BeforePrint = ChildBand5BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = ChildBand3
    Size.Values = (
      29.1041666666667
      1957.91666666667)
    ParentBand = ChildBand3
    object QRDBText4: TQRDBText
      Left = 42
      Top = 0
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        111.125
        0
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IMP_DEPOSITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText6: TQRDBText
      Left = 128
      Top = 0
      Width = 57
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        338.666666666667
        0
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'F_OPERACION'
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
      Left = 198
      Top = 0
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        523.875
        0
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'CAPITAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText8: TQRDBText
      Left = 286
      Top = 0
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        756.708333333333
        0
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'FINADIC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText9: TQRDBText
      Left = 374
      Top = 0
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        989.541666666667
        0
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'INTERES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText10: TQRDBText
      Left = 470
      Top = 0
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1243.54166666667
        0
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'CONCEPTOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText11: TQRDBText
      Left = 558
      Top = 0
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1476.375
        0
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'MORATORIOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText12: TQRDBText
      Left = 646
      Top = 0
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1709.20833333333
        0
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IVAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object ChildBand6: TQRChildBand
    Left = 38
    Top = 779
    Width = 740
    Height = 18
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand6BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = ChildBand3
    Size.Values = (
      47.625
      1957.91666666667)
    ParentBand = GrpPieDetalle
    object QRShape2: TQRShape
      Left = 261
      Top = 0
      Width = 215
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        690.5625
        0
        568.854166666667)
      Shape = qrsHorLine
    end
    object qrlCapDispuesto: TQRLabel
      Left = 393
      Top = 6
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1039.8125
        15.875
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCapDispuesto'
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
  end
  object ChildBand7: TQRChildBand
    Left = 38
    Top = 797
    Width = 740
    Height = 18
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand7BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = ChildBand5
    Size.Values = (
      47.625
      1957.91666666667)
    ParentBand = ChildBand6
    object qrlTotCapital: TQRLabel
      Left = 198
      Top = 3
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        523.875
        7.9375
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlTotCapital'
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
    object QRShape3: TQRShape
      Left = 213
      Top = -3
      Width = 516
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        563.5625
        -7.9375
        1365.25)
      Shape = qrsHorLine
    end
    object qrlTotFinadic: TQRLabel
      Left = 286
      Top = 3
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        756.708333333333
        7.9375
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlTotFinadic'
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
    object qrlTotIntereses: TQRLabel
      Left = 374
      Top = 3
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        989.541666666667
        7.9375
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlTotIntereses'
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
    object qrlTotConceptos: TQRLabel
      Left = 470
      Top = 3
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1243.54166666667
        7.9375
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlTotConceptos'
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
    object qrlTotMoratorios: TQRLabel
      Left = 558
      Top = 3
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1476.375
        7.9375
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlTotMoratorios'
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
    object qrlTotIVAS: TQRLabel
      Left = 646
      Top = 3
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1709.20833333333
        7.9375
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlTotIVAS'
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
  end
  object ChildBand8: TQRChildBand
    Left = 38
    Top = 741
    Width = 740
    Height = 10
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand8BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = ChildBand5
    Size.Values = (
      26.4583333333333
      1957.91666666667)
    ParentBand = ChildBand5
    object QRDBText13: TQRDBText
      Left = 50
      Top = 0
      Width = 58
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        132.291666666667
        0
        153.458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
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
    object QRDBText14: TQRDBText
      Left = 112
      Top = 0
      Width = 57
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        296.333333333333
        0
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'F_INICIO'
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
    object QRDBText15: TQRDBText
      Left = 167
      Top = 0
      Width = 57
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        441.854166666667
        0
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'F_VENCIMIENTO'
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
      Left = 250
      Top = 0
      Width = 31
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        661.458333333333
        0
        82.0208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'PLAZO'
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
      Left = 290
      Top = 0
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        767.291666666667
        0
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IMPORTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText19: TQRDBText
      Left = 376
      Top = 0
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        994.833333333333
        0
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IVA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText20: TQRDBText
      Left = 466
      Top = 0
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1232.95833333333
        0
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IMP_MORA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText21: TQRDBText
      Left = 550
      Top = 0
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1455.20833333333
        0
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IMP_IVA_MORA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText18: TQRDBText
      Left = 636
      Top = 0
      Width = 63
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1682.75
        0
        166.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'F_PAGO'
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
  object ChildBand9: TQRChildBand
    Left = 38
    Top = 662
    Width = 740
    Height = 44
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand9BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      116.416666666667
      1957.91666666667)
    ParentBand = ChildBand4
    object qrlCONCEPTOS: TQRLabel
      Left = 8
      Top = 3
      Width = 729
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        21.1666666666667
        7.9375
        1928.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CONCEPTOS'
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
    object QRLabel26: TQRLabel
      Left = 56
      Top = 21
      Width = 43
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        148.166666666667
        55.5625
        113.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CREDITO'
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
    object QRLabel28: TQRLabel
      Left = 124
      Top = 32
      Width = 45
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        328.083333333333
        84.6666666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'INICIO'
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
    object QRLabel27: TQRLabel
      Left = 147
      Top = 19
      Width = 44
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        388.9375
        50.2708333333333
        116.416666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'PERIODO'
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
    object QRLabel37: TQRLabel
      Left = 173
      Top = 32
      Width = 65
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        457.729166666667
        84.6666666666667
        171.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'VENCIMIENTO'
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
    object QRLabel38: TQRLabel
      Left = 256
      Top = 19
      Width = 29
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.0833333333333
        677.333333333333
        50.2708333333333
        76.7291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'NO. DIAS'
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
    object QRLabel39: TQRLabel
      Left = 296
      Top = 19
      Width = 79
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        783.166666666667
        50.2708333333333
        209.020833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'IMPORTE'
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
    object QRLabel41: TQRLabel
      Left = 386
      Top = 19
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1021.29166666667
        50.2708333333333
        209.020833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'IVA  '
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
    object QRLabel42: TQRLabel
      Left = 476
      Top = 19
      Width = 79
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        1259.41666666667
        50.2708333333333
        209.020833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'IMPORTE MORAS'
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
    object QRLabel43: TQRLabel
      Left = 587
      Top = 19
      Width = 47
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        1553.10416666667
        50.2708333333333
        124.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'IVA MORAS'
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
    object QRShape8: TQRShape
      Left = 51
      Top = 14
      Width = 641
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        15.875
        134.9375
        37.0416666666667
        1695.97916666667)
      Shape = qrsHorLine
    end
    object QRShape9: TQRShape
      Left = 51
      Top = 42
      Width = 641
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.64583333333333
        134.9375
        111.125
        1695.97916666667)
      Shape = qrsHorLine
    end
    object QRLabel44: TQRLabel
      Left = 636
      Top = 19
      Width = 59
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        1682.75
        50.2708333333333
        156.104166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'FECHA DE PAGO'
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
  end
  object ChildBand10: TQRChildBand
    Left = 38
    Top = 815
    Width = 740
    Height = 18
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand10BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      47.625
      1957.91666666667)
    ParentBand = ChildBand7
    object QRShape10: TQRShape
      Left = 261
      Top = 0
      Width = 476
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        690.5625
        0
        1259.41666666667)
      Shape = qrsHorLine
    end
    object qrlTotConcepto: TQRLabel
      Left = 290
      Top = 5
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        767.291666666667
        13.2291666666667
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlTotConcepto'
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
    object qrlTotMoraCon: TQRLabel
      Left = 466
      Top = 5
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1232.95833333333
        13.2291666666667
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlTotMoraCon'
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
    object qrlTotMorIvaCon: TQRLabel
      Left = 550
      Top = 5
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1455.20833333333
        13.2291666666667
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlTotMorIvaCon'
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
    object qrlTotIvaCo: TQRLabel
      Left = 376
      Top = 5
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        994.833333333333
        13.2291666666667
        209.020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlTotIvaCo'
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
  end
  object ChildBand11: TQRChildBand
    Left = 38
    Top = 125
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
    ParentBand = GrpContrato
    object QRLabel1: TQRLabel
      Left = 11
      Top = 11
      Width = 169
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        29.1041666666667
        29.1041666666667
        447.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha en que se firmó el contrato: '
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
    object qrlFechaFirma: TQRLabel
      Left = 224
      Top = 11
      Width = 69
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        592.666666666667
        29.1041666666667
        182.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlFechaFirma'
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
    object QRLabel2: TQRLabel
      Left = 12
      Top = 27
      Width = 144
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        31.75
        71.4375
        381)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Importe del Crédito Concedido'
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
    object QRLabel3: TQRLabel
      Left = 12
      Top = 43
      Width = 147
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        31.75
        113.770833333333
        388.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Intereses Ordinarios Pactados'
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
    object qrlIntOrdPact: TQRLabel
      Left = 224
      Top = 43
      Width = 63
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        592.666666666667
        113.770833333333
        166.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlIntOrdPact'
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
    object QRLabel4: TQRLabel
      Left = 12
      Top = 59
      Width = 148
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        31.75
        156.104166666667
        391.583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Intereses Moratorios Pactados'
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
    object qrlFactorMoras: TQRLabel
      Left = 224
      Top = 59
      Width = 74
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        592.666666666667
        156.104166666667
        195.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlFactorMoras'
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
    object QRLabel5: TQRLabel
      Left = 12
      Top = 75
      Width = 169
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        31.75
        198.4375
        447.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha de Vencimiento del Contrato'
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
    object qrlFechaVenc: TQRLabel
      Left = 224
      Top = 75
      Width = 69
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        592.666666666667
        198.4375
        182.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlFechaVenc'
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
    object qrlImportConcedido: TQRLabel
      Left = 224
      Top = 27
      Width = 93
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        592.666666666667
        71.4375
        246.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlImportConcedido'
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
  object PageFooterBand1: TQRBand
    Left = 38
    Top = 984
    Width = 740
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
      1957.91666666667)
    BandType = rbPageFooter
    object QRSysData1: TQRSysData
      Left = 651
      Top = 2
      Width = 47
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1722.4375
        5.29166666666667
        124.354166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      Color = clWhite
      Data = qrsPageNumber
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Text = 'Hoja '
      Transparent = False
      FontSize = 6
    end
    object QRLabel36: TQRLabel
      Left = 704
      Top = 2
      Width = 23
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1862.66666666667
        5.29166666666667
        60.8541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'de 000'
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
  object ChildBand12: TQRChildBand
    Left = 38
    Top = 751
    Width = 740
    Height = 10
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = ChildBand12AfterPrint
    AlignToBottom = False
    BeforePrint = ChildBand12BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = ChildBand8
    Size.Values = (
      26.4583333333333
      1957.91666666667)
    ParentBand = ChildBand8
    object QRDBText22: TQRDBText
      Left = 2
      Top = 0
      Width = 49
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        5.29166666666667
        0
        129.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'ID_CREDITO'
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
    object QRDBText23: TQRDBText
      Left = 50
      Top = 0
      Width = 57
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        132.291666666667
        0
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'F_INI_PER'
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
    object QRDBText24: TQRDBText
      Left = 110
      Top = 0
      Width = 57
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        291.041666666667
        0
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'F_VEN_PER'
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
    object QRDBText25: TQRDBText
      Left = 167
      Top = 0
      Width = 30
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        441.854166666667
        0
        79.375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'TASA_BASE_AD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#0.0000'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText26: TQRDBText
      Left = 298
      Top = 0
      Width = 60
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        788.458333333333
        0
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'CAPITAL_AD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText27: TQRDBText
      Left = 361
      Top = 0
      Width = 60
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        955.145833333333
        0
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'FINADIC_AD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText28: TQRDBText
      Left = 424
      Top = 0
      Width = 60
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1121.83333333333
        0
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'INTERES_AD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText29: TQRDBText
      Left = 488
      Top = 0
      Width = 60
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1291.16666666667
        0
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'CONCEPTOS_AD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRExpr2: TQRExpr
      Left = 677
      Top = 0
      Width = 60
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1791.22916666667
        0
        158.75)
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
      Master = Owner
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 
        'qyQuery.CAPITAL_AD+qyQuery.FINADIC_AD+qyQuery.INTERES_AD+qyQuery' +
        '.CONCEPTOS_AD+qyQuery.MORATORIOS_AD+qyQuery.IVAS_AD'
      Mask = '###,###,###,##0.00'
      FontSize = 6
    end
    object QRDBText30: TQRDBText
      Left = 551
      Top = 0
      Width = 60
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1457.85416666667
        0
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'MORATORIOS_AD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText31: TQRDBText
      Left = 199
      Top = 0
      Width = 31
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        526.520833333333
        0
        82.0208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'SOBRETASA_AD'
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
    object QRDBText32: TQRDBText
      Left = 232
      Top = 0
      Width = 31
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        613.833333333333
        0
        82.0208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'TASA_FINAL_AD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#0.0000'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText33: TQRDBText
      Left = 266
      Top = 0
      Width = 31
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        703.791666666667
        0
        82.0208333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'TASA_MORA_AD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#0.0000'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText34: TQRDBText
      Left = 614
      Top = 0
      Width = 60
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1624.54166666667
        0
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyQuery
      DataField = 'IVAS_AD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object ChildBand13: TQRChildBand
    Left = 38
    Top = 833
    Width = 740
    Height = 40
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand13BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      105.833333333333
      1957.91666666667)
    ParentBand = ChildBand10
    object qrlTotCapAd: TQRLabel
      Left = 298
      Top = 5
      Width = 60
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        788.458333333333
        13.2291666666667
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlTotCapAd'
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
    object qrlTotFinadicAD: TQRLabel
      Left = 361
      Top = 5
      Width = 60
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        955.145833333333
        13.2291666666667
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlTotFinadicAD'
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
    object qrlTotInteresAD: TQRLabel
      Left = 424
      Top = 5
      Width = 60
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1121.83333333333
        13.2291666666667
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlTotInteresAD'
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
    object qrlTotConceptosAd: TQRLabel
      Left = 488
      Top = 5
      Width = 60
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1291.16666666667
        13.2291666666667
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlTotConceptosAd'
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
    object qrtTotADEUDO: TQRLabel
      Left = 677
      Top = 5
      Width = 60
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1791.22916666667
        13.2291666666667
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrtTotADEUDO'
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
    object qrlTotMoratoriosAd: TQRLabel
      Left = 551
      Top = 5
      Width = 60
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1457.85416666667
        13.2291666666667
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlTotMoratoriosAd'
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
    object QRShape15: TQRShape
      Left = 261
      Top = 1
      Width = 476
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        690.5625
        2.64583333333333
        1259.41666666667)
      Shape = qrsHorLine
    end
    object qrlTotIvaAd: TQRLabel
      Left = 614
      Top = 6
      Width = 60
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1624.54166666667
        15.875
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlTotIvaAd'
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
    object qrlTotConLetra: TQRLabel
      Left = 8
      Top = 25
      Width = 727
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        21.1666666666667
        66.1458333333333
        1923.52083333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total con letra'
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
  object ChildBand14: TQRChildBand
    Left = 38
    Top = 903
    Width = 740
    Height = 81
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
      214.3125
      1957.91666666667)
    ParentBand = GrpPieContrato
    object Realizo: TQRLabel
      Left = 18
      Top = 56
      Width = 200
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        47.625
        148.166666666667
        529.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'NOMBRE DE QUIEN FIRMA'
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
    object QRShape7: TQRShape
      Left = 17
      Top = 45
      Width = 201
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        44.9791666666667
        119.0625
        531.8125)
      Shape = qrsHorLine
    end
    object Cedula: TQRLabel
      Left = 17
      Top = 67
      Width = 200
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        44.9791666666667
        177.270833333333
        529.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CEDULA PROFESIONAL No. XXXXXX'
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
  end
  object qyQuery: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      '  SELECT XXX.*'
      '  FROM   '
      '  (   '
      
        '  SELECT Decode(Substr(IDENTIFICADOR,3,2),'#39'PA'#39',1,Decode(Substr(I' +
        'dentificador,3,2) ,'#39'VD'#39',2,3)) ESTATUS,   '
      
        '  Decode(Substr(IDENTIFICADOR,1,2),'#39'FA'#39',1, Decode(Substr(Identif' +
        'icador,1,2) ,'#39'IN'#39',2,Decode(Substr(Identificador,1,2) ,'#39'CA'#39',3,4))' +
        ') CONCEPTO,   '
      '  null F_AUT_COMITE,   '
      '  0 IMP_AUTORIZADO,  '
      '  NULL F_VEN_CONT,   '
      '  NULL CVE_TASA_REFER,   '
      '  NULL OPERADOR_STASA,   '
      '  0 SOBRETASACONT,   '
      '  0 fact_MORAS,   '
      '  NULL NOMBRE,   '
      '  CTOD.* , '
      '    0 IMP_DEPOSITO, '
      '    NULL  F_OPERACION, '
      '    0 CAPITAL,'
      '    0 FINADIC,'
      '    0 INTERES,'
      '    0 CONCEPTOS,'
      '    0 MORATORIOS,'
      '    0 IVAS,'
      '    0 OTROS, '
      
        '  NULL ANIO, NULL F_INI_PER, NULL F_VEN_PER, 0 CAPITAL_AD, 0 FIN' +
        'ADIC_AD ,0 INTERES_AD, 0 CONCEPTOS_AD, 0 MORATORIOS_AD, 0 IVAS_A' +
        'D, '
      
        '  0 tasa_base_ad, 0 sobretasa_ad, 0 tasa_final_ad,  0 TASA_MORA_' +
        'AD '
      '  FROM     '
      '  (   '
      '  SELECT ID_CONTRATO,ID_CREDITO,IDENTIFICADOR,   '
      
        '  F_INICIO, PLAZO, F_VENCIMIENTO,TASA_BASE,SOBRETASA, TASA_FINAL' +
        ',   '
      '  F_PAGO, IMPORTE, IVA,   '
      '  CASE WHEN IDENTIFICADOR ='#39'CAPA'#39'   '
      '            THEN  CASE   '
      
        '  '#9#9'        WHEN F_VENCIMIENTO <  TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/Y' +
        'YYY'#39' ) '
      '  '#9#9'         THEN 0   '
      '  '#9#9#9#9'END    '
      '  '#9#9'  ELSE IMP_MORA_IMP-IMP_PAG_MORAS     '
      '   END AS IMP_MORA,   '
      '  CASE WHEN IDENTIFICADOR ='#39'CAPA'#39'   '
      '            THEN  CASE   '
      
        ' '#9#9'        WHEN F_VENCIMIENTO <  TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YY' +
        'YY'#39' ) '
      '  '#9#9'         THEN 0   '
      '  '#9#9#9#9'END    '
      '  '#9#9'  ELSE IMP_IVA_MORA-IVA_PAG_MORAS   '
      '   END AS IMP_IVA_MORA,     '
      
        '  NUM_PERIODO,IMP_MORATORIO, IMP_MORA_IMP,IMP_PAG_MORAS, IMP_IVA' +
        '_MORA_IMP   '
      '  FROM (   '
      '  select CCA.*,   '
      '  '#9#9'CASE  WHEN IMP_PAGADO>0    '
      '  '#9#9' THEN '#39'CAPA'#39'    '
      '  '#9#9' ELSE '#39'X'#39'    '
      '  '#9#9'END AS IDENTIFICADOR,   '
      '  '#9#9'IMP_PAGADO AS IMPORTE   '
      '  '#9#9'from (   '
      
        '  '#9#9#9#9'SELECT CCRE.ID_CONTRATO,CCAP.ID_CREDITO,NUM_PERIODO,CCAP.F' +
        '_VENCIMIENTO-PLAZO AS F_INICIO, CCAP.F_VENCIMIENTO, PLAZO,   '
      
        '  '#9#9#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'CP'#39',CCAP.ID_CREDITO, NUM_PERIODO,' +
        ' CCAP.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '
      '  '#9#9#9#9'SOBRETASA AS SOBRETASA,   '
      
        '  '#9#9#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'CP'#39',CCAP.ID_CREDITO, NUM_PERIODO,' +
        ' CCAP.F_VENCIMIENTO-1 )  AS TASA_FINAL,    '
      '  '#9#9#9#9'Imp_Capital,   '
      
        '  '#9#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IMPBRU'#39',CCAP.ID_CREDITO,N' +
        'UM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )  ,'#39'V'#39') ' +
        'AS Imp_Pagado,   '
      '  '#9#9#9#9' F_PAGO,    '
      '  '#9#9#9#9' 0 AS IVA,    '
      '  '#9#9#9#9' IMP_MORATORIO,    '
      '  '#9#9#9#9' IMP_IVA_MORA,     '
      
        '  '#9#9#9#9' PKGCRPERIODO.FUNOBTENMORA(1,'#39'V'#39',CCAP.ID_CREDITO, NUM_PERI' +
        'ODO,null,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )  ,NULL) I' +
        'MP_MORA_IMP,   '
      
        '  '#9#9#9#9' PKGCRPERIODO.FUNOBTENMORA(1,NULL,CCAP.ID_CREDITO, NUM_PER' +
        'IODO,null,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )  ,null) ' +
        'IMP_IVA_MORA_IMP,   '
      
        '  '#9#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IMPMOR'#39',CCAP.ID_CREDITO,' +
        'NUM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39 +
        ') AS Imp_Pag_Moras,   '
      
        '  '#9#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IVAMOR'#39',CCAP.ID_CREDITO,' +
        'NUM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )  ,'#39'V'#39')' +
        ' AS IVA_Pag_Moras   '
      
        '  '#9#9#9#9'FROM CR_CAPITAL CCAP, CR_CREDITO CCRE, CONTRATO C, PERSONA' +
        ' P    '
      '  '#9#9#9#9'WHERE SIT_CAPITAL <> '#39'CA'#39'   '
      '  '#9#9#9#9'AND CCAP.ID_CREDITO=CCRE.ID_CREDITO   '
      '  '#9#9#9#9'AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '
      '  '#9#9#9#9'AND C.ID_TITULAR=P.ID_PERSONA   '
      '  '#9#9#9'         AND CCRE.ID_CREDITO=172483     '
      '  '#9#9#9#9') CCA   '
      '  UNION'#9#9'   '
      '  select CCAV.*,   '
      
        '  '#9'    CASE WHEN (F_VENCIMIENTO<   TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/' +
        'YYYY'#39' )   ) and ( Imp_CAPITAL>Imp_pagado )    '
      '          THEN '#39'CAVD'#39'    '
      '  '#9'    ELSE '#39'X'#39'   '
      '  '#9#9'END AS IDENTIFICADOR,   '
      
        '  '#9#9'Imp_CAPITAL-IMP_PAGADO + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,' +
        '0) AS IMPORTE'
      '  '#9#9'from (   '
      
        '  '#9#9#9#9'SELECT CCRE.ID_CONTRATO,CCAP.ID_CREDITO,NUM_PERIODO,CCAP.F' +
        '_VENCIMIENTO-PLAZO AS F_INICIO, CCAP.F_VENCIMIENTO, PLAZO,'
      
        '  '#9#9#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'CP'#39',CCAP.ID_CREDITO, NUM_PERIODO,' +
        ' CCAP.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '
      '  '#9#9#9#9'SOBRETASA AS SOBRETASA,   '
      
        '  '#9#9#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'CP'#39',CCAP.ID_CREDITO, NUM_PERIODO,' +
        ' CCAP.F_VENCIMIENTO-1 )  AS TASA_FINAL,    '
      '  '#9#9#9#9'Imp_Capital,   '
      
        '  '#9#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IMPBRU'#39',CCAP.ID_CREDITO,N' +
        'UM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39')' +
        ' AS Imp_Pagado,   '
      '  '#9#9#9#9' F_PAGO,    '
      '  '#9#9#9#9' 0 AS IVA,    '
      '  '#9#9#9#9' IMP_MORATORIO,    '
      '  '#9#9#9#9' IMP_IVA_MORA,     '
      
        '  '#9#9#9#9' PKGCRPERIODO.FUNOBTENMORA(1,'#39'V'#39',CCAP.ID_CREDITO, NUM_PERI' +
        'ODO,null,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,NULL) ' +
        'IMP_MORA_IMP,   '
      
        '  '#9#9#9#9' PKGCRPERIODO.FUNOBTENMORA(1,NULL,CCAP.ID_CREDITO, NUM_PER' +
        'IODO,null,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,null)' +
        ' IMP_IVA_MORA_IMP,   '
      
        '  '#9#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IMPMOR'#39',CCAP.ID_CREDITO,' +
        'NUM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39 +
        ') AS Imp_Pag_Moras,   '
      
        '  '#9#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IVAMOR'#39',CCAP.ID_CREDITO,' +
        'NUM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39 +
        ') AS IVA_Pag_Moras   '
      
        '  '#9#9#9#9'FROM CR_CAPITAL CCAP, CR_CREDITO CCRE, CONTRATO C, PERSONA' +
        ' P    '
      '  '#9#9#9#9'WHERE SIT_CAPITAL <> '#39'CA'#39'   '
      '  '#9#9#9#9'AND CCAP.ID_CREDITO=CCRE.ID_CREDITO'
      '  '#9#9#9#9'AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '
      '  '#9#9#9#9'AND C.ID_TITULAR=P.ID_PERSONA'
      '  '#9#9#9'         AND CCRE.ID_CREDITO=172483'
      '  '#9#9#9#9') CCAV'
      '                             ,('
      
        '                              SELECT CT.ID_CREDITO, CT.ID_PERIOD' +
        'O,'
      
        '                         NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIS' +
        'T_PGDMCP'
      '                    FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'
      '                   WHERE 1=1'
      '                     AND CT.SIT_TRANSACCION = '#39'AC'#39
      '                     AND CT.ID_TRANS_CANCELA IS NULL'
      '                     AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION'
      '                     AND CT.CVE_OPERACION IN ('#39'PGDMCP'#39')'
      
        '                                 AND CDT.CVE_CONCEPTO IN ('#39'IMPBR' +
        'U'#39')'
      '                   GROUP BY CT.ID_CREDITO, CT.ID_PERIODO'
      '                              ) CA_HIST_PGDMCP'
      '                     WHERE 1=1'
      '              AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCAV.ID_CREDITO'
      
        '              AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCAV.NUM_PERIOD' +
        'O'
      '  UNION'#9#9'   '
      '  select CCAG.*,   '
      
        '  '#9'    CASE WHEN (F_VENCIMIENTO>=   TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM' +
        '/YYYY'#39' )  ) and ( Imp_CAPITAL>Imp_pagado )    '
      '          THEN '#39'CAVI'#39'    '
      '  '#9'    ELSE '#39'X'#39'   '
      '  '#9#9'END AS IDENTIFICADOR,   '
      
        '  '#9#9'Imp_CAPITAL-IMP_PAGADO + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,' +
        '0) AS IMPORTE'
      '  '#9#9'from ('
      
        '  '#9#9#9#9'SELECT CCRE.ID_CONTRATO,CCAP.ID_CREDITO,NUM_PERIODO,CCAP.F' +
        '_VENCIMIENTO-PLAZO AS F_INICIO, CCAP.F_VENCIMIENTO, PLAZO,   '
      
        '   '#9#9#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'CP'#39',CCAP.ID_CREDITO, NUM_PERIODO' +
        ', CCAP.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '
      '  '#9#9#9#9'SOBRETASA AS SOBRETASA,   '
      
        '  '#9#9#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'CP'#39',CCAP.ID_CREDITO, NUM_PERIODO,' +
        ' CCAP.F_VENCIMIENTO-1 )  AS TASA_FINAL,    '
      '  '#9#9#9#9'Imp_Capital,   '
      
        '  '#9#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IMPBRU'#39',CCAP.ID_CREDITO,N' +
        'UM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39')' +
        ' AS Imp_Pagado,'
      '  '#9#9#9#9' F_PAGO,    '
      '  '#9#9#9#9' 0 AS IVA,    '
      '  '#9#9#9#9' IMP_MORATORIO,    '
      '  '#9#9#9#9' IMP_IVA_MORA,     '
      
        '  '#9#9#9#9' PKGCRPERIODO.FUNOBTENMORA(1,'#39'V'#39',CCAP.ID_CREDITO, NUM_PERI' +
        'ODO,null,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,NULL) ' +
        'IMP_MORA_IMP,   '
      
        '  '#9#9#9#9' PKGCRPERIODO.FUNOBTENMORA(1,NULL,CCAP.ID_CREDITO, NUM_PER' +
        'IODO,null,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,null)' +
        ' IMP_IVA_MORA_IMP,   '
      
        '  '#9#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IMPMOR'#39',CCAP.ID_CREDITO,' +
        'NUM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )  ,'#39'V'#39')' +
        ' AS Imp_Pag_Moras,   '
      
        '  '#9#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IVAMOR'#39',CCAP.ID_CREDITO,' +
        'NUM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )  ,'#39'V'#39')' +
        ' AS IVA_Pag_Moras   '
      
        '  '#9#9#9#9'FROM CR_CAPITAL CCAP, CR_CREDITO CCRE, CONTRATO C, PERSONA' +
        ' P    '
      '  '#9#9#9#9'WHERE SIT_CAPITAL <> '#39'CA'#39'   '
      '  '#9#9#9#9'AND CCAP.ID_CREDITO=CCRE.ID_CREDITO   '
      '  '#9#9#9#9'AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '
      '  '#9#9#9#9'AND C.ID_TITULAR=P.ID_PERSONA   '
      '  '#9#9#9'         AND CCRE.ID_CREDITO=172483     '
      '  '#9#9#9#9')  CCAG'
      '                           ,('
      '                            SELECT CT.ID_CREDITO, CT.ID_PERIODO,'
      
        '                       NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_' +
        'PGDMCP'
      '                  FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'
      '                 WHERE 1=1'
      '                   AND CT.SIT_TRANSACCION = '#39'AC'#39
      '                   AND CT.ID_TRANS_CANCELA IS NULL'
      '                   AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION'
      '                   AND CT.CVE_OPERACION IN ('#39'PGDMCP'#39')'
      
        '                               AND CDT.CVE_CONCEPTO IN ('#39'IMPBRU'#39 +
        ')'
      '                 GROUP BY CT.ID_CREDITO, CT.ID_PERIODO'
      '                            ) CA_HIST_PGDMCP'
      '                   WHERE 1=1'
      '            AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCAG.ID_CREDITO'
      '            AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCAG.NUM_PERIODO'
      '  '#9') CCCA   '
      '  WHERE IDENTIFICADOR <> '#39'X'#39'   '
      '  UNION   '
      
        '  SELECT ID_CONTRATO,ID_CREDITO, IDENTIFICADOR,F_INICIO, PLAZO, ' +
        'F_VENCIMIENTO,TASA_BASE,SOBRETASA, TASA_FINAL,   '
      '  F_PAGO, IMPORTE, IVA,   '
      '  CASE WHEN IDENTIFICADOR ='#39'FAPA'#39'   '
      '            THEN  CASE   '
      
        '  '#9#9'        WHEN F_VENCIMIENTO <  TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/Y' +
        'YYY'#39' ) '
      '  '#9#9'         THEN 0   '
      '  '#9#9#9#9'END    '
      '  '#9#9'  ELSE IMP_MORA_IMP-IMP_PAG_MORAS     '
      '   END AS IMP_MORA,   '
      '  CASE WHEN IDENTIFICADOR ='#39'FAPA'#39'   '
      '            THEN  CASE   '
      
        '  '#9#9'        WHEN F_VENCIMIENTO <  TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/Y' +
        'YYY'#39' ) '
      '  '#9#9'         THEN 0   '
      '  '#9#9#9#9'END    '
      '  '#9#9'  ELSE IMP_IVA_MORA-IVA_PAG_MORAS   '
      '   END AS IMP_IVA_MORA,     '
      
        '  NUM_PERIODO,IMP_MORATORIO, IMP_MORA_IMP,IMP_PAG_MORAS, IMP_IVA' +
        '_MORA_IMP   '
      '  FROM (   '
      '  select CFA.*,   '
      '  '#9#9'CASE  WHEN IMP_PAGADO>0    '
      ' '#9#9' THEN '#39'FAPA'#39'    '
      '  '#9#9' ELSE '#39'X'#39'    '
      '  '#9#9'END AS IDENTIFICADOR,   '
      '  '#9#9'IMP_PAGADO AS IMPORTE   '
      '  '#9#9'from (   '
      
        '  '#9#9'SELECT CCRE.ID_CONTRATO,CFAD.ID_CREDITO, NUM_PERIODO,CFAD.F_' +
        'VENCIMIENTO-PLAZO AS F_INICIO, CFAD.F_VENCIMIENTO, PLAZO,   '
      
        '  '#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'FN'#39',CFAD.ID_CREDITO, NUM_PERIODO, C' +
        'FAD.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '
      '  '#9#9'SOBRETASA AS SOBRETASA,   '
      
        '  '#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'FN'#39',CFAD.ID_CREDITO, NUM_PERIODO, C' +
        'FAD.F_VENCIMIENTO-1 )  AS TASA_FINAL,    '
      '  '#9#9'Imp_FINAN_aDIC,   '
      
        '  '#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IMPBRU'#39',CFAD.ID_CREDITO,NUM' +
        '_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39') A' +
        'S Imp_Pagado,   '
      '  '#9#9' F_PAGO,    '
      '  '#9#9' 0 AS IVA,    '
      '       '#9' IMP_MORATORIO,    '
      '  '#9#9' IMP_IVA_MORA,      '
      
        '  '#9#9' PKGCRPERIODO.FUNOBTENMORA(3,'#39'V'#39',CFAD.ID_CREDITO, NUM_PERIOD' +
        'O,NULL,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,null) IM' +
        'P_MORA_IMP,   '
      
        '  '#9#9' PKGCRPERIODO.FUNOBTENMORA(3,'#39'F'#39',CFAD.ID_CREDITO, NUM_PERIOD' +
        'O,null,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,null) IM' +
        'P_IVA_MORA_IMP,   '
      
        '  '#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IMPMOR'#39',CFAD.ID_CREDITO,NU' +
        'M_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39') ' +
        'AS Imp_Pag_Moras,   '
      
        '  '#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IVAMOR'#39',CFAD.ID_CREDITO,NU' +
        'M_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39') ' +
        'AS IVA_Pag_Moras   '
      
        '  '#9#9'FROM CR_FINAN_ADIC CFAD, CR_CREDITO CCRE, CONTRATO C, PERSON' +
        'A P    '
      '  '#9#9'WHERE SIT_FINAN_ADIC <> '#39'CA'#39'   '
      '  '#9#9'AND CFAD.ID_CREDITO=CCRE.ID_CREDITO   '
      '  '#9#9'AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '
      '  '#9#9'AND C.ID_TITULAR=P.ID_PERSONA   '
      '  '#9'         AND CCRE.ID_CREDITO=172483     '
      '  '#9#9') CFA   '
      '  UNION'#9#9'   '
      '  select CFAV.*,   '
      
        '  '#9'    CASE WHEN (F_VENCIMIENTO<   TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/' +
        'YYYY'#39' )   ) and ( Imp_FINAN_aDIC>Imp_pagado )    '
      '          THEN '#39'FAVD'#39'    '
      '  '#9'    ELSE '#39'X'#39'   '
      '  '#9#9'END AS IDENTIFICADOR,   '
      '  '#9#9'Imp_FINAN_aDIC-IMP_PAGADO AS IMPORTE   '
      '  '#9#9'from (   '
      
        '  '#9#9'SELECT CCRE.ID_CONTRATO,CFAD.ID_CREDITO, NUM_PERIODO,CFAD.F_' +
        'VENCIMIENTO-PLAZO AS F_INICIO, CFAD.F_VENCIMIENTO, PLAZO,   '
      
        '  '#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'FN'#39',CFAD.ID_CREDITO, NUM_PERIODO, C' +
        'FAD.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '
      '  '#9#9'SOBRETASA AS SOBRETASA,   '
      
        '  '#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'FN'#39',CFAD.ID_CREDITO, NUM_PERIODO, C' +
        'FAD.F_VENCIMIENTO-1 )  AS TASA_FINAL,    '
      '  '#9#9'Imp_FINAN_aDIC,   '
      
        '  '#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IMPBRU'#39',CFAD.ID_CREDITO,NUM' +
        '_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39') A' +
        'S Imp_Pagado,   '
      '  '#9#9' F_PAGO,    '
      '  '#9#9' 0 AS IVA,    '
      '       '#9' IMP_MORATORIO,    '
      '  '#9#9' IMP_IVA_MORA,      '
      
        '  '#9#9' PKGCRPERIODO.FUNOBTENMORA(3,'#39'V'#39',CFAD.ID_CREDITO, NUM_PERIOD' +
        'O,NULL,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,null) IM' +
        'P_MORA_IMP,   '
      
        '  '#9#9' PKGCRPERIODO.FUNOBTENMORA(3,'#39'F'#39',CFAD.ID_CREDITO, NUM_PERIOD' +
        'O,null,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,null) IM' +
        'P_IVA_MORA_IMP,   '
      
        '  '#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IMPMOR'#39',CFAD.ID_CREDITO,NU' +
        'M_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39') ' +
        'AS Imp_Pag_Moras,   '
      
        '  '#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IVAMOR'#39',CFAD.ID_CREDITO,NU' +
        'M_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39') ' +
        'AS IVA_Pag_Moras   '
      
        '  '#9#9'FROM CR_FINAN_ADIC CFAD, CR_CREDITO CCRE, CONTRATO C, PERSON' +
        'A P    '
      '  '#9#9'WHERE SIT_FINAN_ADIC <> '#39'CA'#39'   '
      '  '#9#9'AND CFAD.ID_CREDITO=CCRE.ID_CREDITO   '
      '  '#9#9'AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '
      '  '#9#9'AND C.ID_TITULAR=P.ID_PERSONA   '
      '  '#9'         AND CCRE.ID_CREDITO=172483     '
      '  '#9#9') CFAV'#9'   '
      '  UNION'#9#9'   '
      '  select CFAG.*,   '
      
        '  '#9'    CASE WHEN (F_VENCIMIENTO>=   TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM' +
        '/YYYY'#39' )   ) and ( Imp_FINAN_aDIC>Imp_pagado )    '
      '            THEN '#39'FAVI'#39'    '
      '   '#9'    ELSE '#39'X'#39'   '
      '     '#9#9'END AS IDENTIFICADOR,   '
      '   '#9#9'Imp_FINAN_aDIC-IMP_PAGADO AS IMPORTE   '
      '  '#9#9'from (   '
      
        '  '#9#9'SELECT CCRE.ID_CONTRATO,CFAD.ID_CREDITO, NUM_PERIODO,CFAD.F_' +
        'VENCIMIENTO-PLAZO AS F_INICIO, CFAD.F_VENCIMIENTO, PLAZO,   '
      
        '  '#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'FN'#39',CFAD.ID_CREDITO, NUM_PERIODO, C' +
        'FAD.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '
      '  '#9#9'SOBRETASA AS SOBRETASA,   '
      
        '  '#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'FN'#39',CFAD.ID_CREDITO, NUM_PERIODO, C' +
        'FAD.F_VENCIMIENTO-1 )  AS TASA_FINAL,    '
      '  '#9#9'Imp_FINAN_aDIC,   '
      
        '  '#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IMPBRU'#39',CFAD.ID_CREDITO,NUM' +
        '_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39') A' +
        'S Imp_Pagado,   '
      '  '#9#9' F_PAGO,    '
      '  '#9#9' 0 AS IVA,    '
      '       '#9' IMP_MORATORIO,    '
      '  '#9#9' IMP_IVA_MORA,      '
      
        '  '#9#9' PKGCRPERIODO.FUNOBTENMORA(3,'#39'V'#39',CFAD.ID_CREDITO, NUM_PERIOD' +
        'O,NULL,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,null) IM' +
        'P_MORA_IMP,   '
      
        '  '#9#9' PKGCRPERIODO.FUNOBTENMORA(3,'#39'F'#39',CFAD.ID_CREDITO, NUM_PERIOD' +
        'O,null,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,null) IM' +
        'P_IVA_MORA_IMP,   '
      
        '  '#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IMPMOR'#39',CFAD.ID_CREDITO,NU' +
        'M_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39') ' +
        'AS Imp_Pag_Moras,   '
      
        '  '#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IVAMOR'#39',CFAD.ID_CREDITO,NU' +
        'M_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39') ' +
        'AS IVA_Pag_Moras   '
      
        '  '#9#9'FROM CR_FINAN_ADIC CFAD, CR_CREDITO CCRE, CONTRATO C, PERSON' +
        'A P   '
      '  '#9#9'WHERE SIT_FINAN_ADIC <> '#39'CA'#39'   '
      '  '#9#9'AND CFAD.ID_CREDITO=CCRE.ID_CREDITO   '
      '  '#9#9'AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '
      '  '#9#9'AND C.ID_TITULAR=P.ID_PERSONA   '
      '                 AND CCRE.ID_CREDITO=172483     '
      '  '#9#9') CFAG'#9#9#9#9#9'   '
      '  '#9#9') CCFA   '
      '  WHERE IDENTIFICADOR <> '#39'X'#39'   '
      '  UNION   '
      
        '  SELECT ID_CONTRATO, ID_CREDITO,IDENTIFICADOR,F_INICIO, PLAZO, ' +
        'F_VENCIMIENTO,TASA_BASE,SOBRETASA, TASA_FINAL,   '
      '  F_PAGO, IMPORTE, IVA,   '
      '  CASE WHEN IDENTIFICADOR ='#39'COPA'#39'   '
      '        THEN  CASE   '
      
        '  '#9#9'       WHEN F_VENCIMIENTO <  TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YY' +
        'YY'#39' ) '
      '  '#9#9'       THEN 0   '
      '  '#9#9'    END    '
      '  '#9'  ELSE IMP_MORA_IMP-IMP_PAG_MORAS     '
      '  END AS IMP_MORA,   '
      '  CASE WHEN IDENTIFICADOR ='#39'COPA'#39'   '
      '            THEN  CASE   '
      
        '  '#9#9'        WHEN F_VENCIMIENTO <  TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/Y' +
        'YYY'#39' ) '
      '  '#9#9'         THEN 0   '
      '  '#9#9#9#9'END    '
      '  '#9#9'  ELSE IMP_IVA_MORA-IVA_PAG_MORAS   '
      '   END AS IMP_IVA_MORA,    '
      
        '  NUM_PERIODO,IMP_MORATORIO, IMP_MORA_IMP,IMP_PAG_MORAS, IMP_IVA' +
        '_MORA_IMP   '
      '  FROM (   '
      '  select CCNP.*,   '
      '  '#9#9'CASE  WHEN IMP_PAGADO>0    '
      '  '#9#9' THEN '#39'COPA'#39'    '
      '  '#9#9' ELSE '#39'X'#39'    '
      '  '#9#9'END AS IDENTIFICADOR,   '
      '  '#9#9'IMP_PAGADO AS IMPORTE   '
      '  '#9#9'from (   '
      
        '  '#9#9#9'SELECT CCRE.ID_CONTRATO,CCOM.ID_CREDITO, NUM_PERIODO,CCOM.F' +
        '_VENCIMIENTO-PLAZO AS F_INICIO, CCOM.F_VENCIMIENTO, PLAZO,   '
      '  '#9#9#9'0 TASA_BASE,   '
      '  '#9#9#9'SOBRETASA AS SOBRETASA,   '
      '  '#9#9#9'0 AS TASA_FINAL,    '
      '  '#9#9#9'Imp_Comision,   '
      
        '  '#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IMPBRU'#39',CCOM.ID_CREDITO,NU' +
        'M_PERIODO,CVE_COMISION,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' ) ' +
        '  ,'#39'V'#39') AS Imp_Pagado,   '
      '  '#9#9#9' F_PAGO,    '
      '  '#9#9#9' IMP_IVA AS IVA,   '
      '  '#9#9#9' IMP_MORATORIO,   '
      '  '#9#9#9' IMP_IVA_MORA,    '
      
        '  '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(2,'#39'V'#39',CCOM.ID_CREDITO, NUM_PERIO' +
        'DO,CVE_COMISION,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ' +
        ',null) IMP_MORA_IMP,   '
      
        '  '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(2,'#39'F'#39',CCOM.ID_CREDITO, NUM_PERIO' +
        'DO,CVE_COMISION,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ' +
        ',null) IMP_IVA_MORA_IMP,   '
      
        '  '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IMPMOR'#39',CCOM.ID_CREDITO,N' +
        'UM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39')' +
        ' AS Imp_Pag_Moras,   '
      
        '  '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IVAMOR'#39',CCOM.ID_CREDITO,N' +
        'UM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39')' +
        ' AS IVA_Pag_Moras   '
      
        '  '#9#9#9'FROM CR_COMISION CCOM, CR_CREDITO CCRE, CONTRATO C, PERSONA' +
        ' P   '
      '  '#9#9#9'WHERE SIT_COMISION <> '#39'CA'#39'   '
      '  '#9#9#9'and CCOM.ID_CREDITO=CCRE.ID_CREDITO   '
      '  '#9#9#9'AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '
      '  '#9#9#9'AND C.ID_TITULAR=P.ID_PERSONA   '
      '  '#9#9'         AND CCRE.ID_CREDITO=172483     '
      '  '#9#9#9') CCNP   '
      '  UNION'#9#9'   '
      '  select CCNV.*,   '
      
        '  '#9'    CASE WHEN (F_VENCIMIENTO<   TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/' +
        'YYYY'#39' )   ) and ( Imp_COMISION>Imp_pagado )    '
      '          THEN '#39'COVD'#39'    '
      '  '#9'    ELSE '#39'X'#39'   '
      '  '#9#9'END AS IDENTIFICADOR,   '
      '  '#9#9'Imp_COMISION-IMP_PAGADO AS IMPORTE   '
      '  '#9#9'from (   '
      
        '  '#9#9#9'SELECT CCRE.ID_CONTRATO,CCOM.ID_CREDITO, NUM_PERIODO,CCOM.F' +
        '_VENCIMIENTO-PLAZO AS F_INICIO, CCOM.F_VENCIMIENTO, PLAZO,   '
      '  '#9#9#9'0 TASA_BASE,   '
      '  '#9#9#9'SOBRETASA AS SOBRETASA,   '
      '  '#9#9#9'0 AS TASA_FINAL,    '
      '  '#9#9#9'Imp_Comision,   '
      
        '  '#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IMPBRU'#39',CCOM.ID_CREDITO,NU' +
        'M_PERIODO,CVE_COMISION,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' ) ' +
        '  ,'#39'V'#39') AS Imp_Pagado,   '
      '   '#9#9#9' F_PAGO,    '
      '  '#9#9#9' IMP_IVA AS IVA,   '
      '  '#9#9#9' IMP_MORATORIO,   '
      '  '#9#9#9' IMP_IVA_MORA,    '
      
        '  '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(2,'#39'V'#39',CCOM.ID_CREDITO, NUM_PERIO' +
        'DO,CVE_COMISION,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ' +
        ',null) IMP_MORA_IMP,   '
      
        '  '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(2,'#39'F'#39',CCOM.ID_CREDITO, NUM_PERIO' +
        'DO,CVE_COMISION,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ' +
        ',null) IMP_IVA_MORA_IMP,   '
      
        '  '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IMPMOR'#39',CCOM.ID_CREDITO,N' +
        'UM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39')' +
        ' AS Imp_Pag_Moras,   '
      
        '  '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IVAMOR'#39',CCOM.ID_CREDITO,N' +
        'UM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39')' +
        ' AS IVA_Pag_Moras   '
      
        '   '#9#9#9'FROM CR_COMISION CCOM, CR_CREDITO CCRE , CONTRATO C, PERSO' +
        'NA P   '
      '  '#9#9#9'WHERE SIT_COMISION <> '#39'CA'#39'   '
      '  '#9#9#9'and CCOM.ID_CREDITO=CCRE.ID_CREDITO   '
      '  '#9#9#9'AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '
      '  '#9#9#9'AND C.ID_TITULAR=P.ID_PERSONA   '
      '  '#9#9#9'  AND CCRE.ID_CREDITO=172483     '
      '  '#9#9#9') CCNV   '
      '  UNION'#9#9'   '
      '  select CCNG.*,   '
      
        '  '#9'    CASE WHEN (F_VENCIMIENTO>=   TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM' +
        '/YYYY'#39' )   ) and ( Imp_COMISION>Imp_pagado )    '
      '          THEN '#39'COVI'#39'    '
      '  '#9'    ELSE '#39'X'#39'   '
      '  '#9#9'END AS IDENTIFICADOR,   '
      '  '#9#9'Imp_COMISION-IMP_PAGADO AS IMPORTE   '
      '  '#9#9'from (   '
      
        '  '#9#9#9'SELECT CCRE.ID_CONTRATO,CCOM.ID_CREDITO, NUM_PERIODO,CCOM.F' +
        '_VENCIMIENTO-PLAZO AS F_INICIO, CCOM.F_VENCIMIENTO, PLAZO,   '
      '  '#9#9#9'0 TASA_BASE,   '
      '  '#9#9#9'SOBRETASA AS SOBRETASA,   '
      '  '#9#9#9'0 AS TASA_FINAL,    '
      '  '#9#9#9'Imp_Comision,   '
      
        '  '#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IMPBRU'#39',CCOM.ID_CREDITO,NU' +
        'M_PERIODO,CVE_COMISION,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' ) ' +
        '  ,'#39'V'#39') AS Imp_Pagado,   '
      '  '#9#9#9' F_PAGO,    '
      '  '#9#9#9' IMP_IVA AS IVA,   '
      '  '#9#9#9' IMP_MORATORIO,   '
      '  '#9#9#9' IMP_IVA_MORA,    '
      
        '  '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(2,'#39'V'#39',CCOM.ID_CREDITO, NUM_PERIO' +
        'DO,CVE_COMISION,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ' +
        ',null) IMP_MORA_IMP,   '
      
        '  '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(2,'#39'F'#39',CCOM.ID_CREDITO, NUM_PERIO' +
        'DO,CVE_COMISION,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ' +
        ',null) IMP_IVA_MORA_IMP,   '
      
        '  '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IMPMOR'#39',CCOM.ID_CREDITO,N' +
        'UM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39')' +
        ' AS Imp_Pag_Moras,   '
      
        '  '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IVAMOR'#39',CCOM.ID_CREDITO,N' +
        'UM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39')' +
        ' AS IVA_Pag_Moras   '
      
        '  '#9#9#9'FROM CR_COMISION CCOM, CR_CREDITO CCRE , PERSONA P, CONTRAT' +
        'O C   '
      '  '#9#9#9'WHERE SIT_COMISION <> '#39'CA'#39'   '
      '  '#9#9#9'and CCOM.ID_CREDITO=CCRE.ID_CREDITO   '
      '  '#9#9#9'AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '
      '  '#9#9#9'AND C.ID_TITULAR=P.ID_PERSONA   '
      '  '#9#9#9'  AND CCRE.ID_CREDITO=172483     '
      '  '#9#9#9') CCNG   '
      '  '#9#9') CCNG   '
      '  '#9#9'WHERE IDENTIFICADOR <> '#39'X'#39'   '
      '  UNION   '
      
        '  SELECT ID_CONTRATO,ID_CREDITO,IDENTIFICADOR,F_INICIO, PLAZO, F' +
        '_VENCIMIENTO,TASA_BASE,SOBRETASA, TASA_FINAL,   '
      '  F_PAGO, IMPORTE, IVA,   '
      '  CASE WHEN IDENTIFICADOR ='#39'INPA'#39'    '
      '        THEN  CASE    '
      
        '   '#9#9'       WHEN F_VENCIMIENTO <  TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/Y' +
        'YYY'#39' ) '
      '  '#9#9'       THEN 0   '
      '  '#9#9'    END    '
      '  '#9'  ELSE IMP_MORA_IMP-IMP_PAG_MORAS     '
      '  END AS IMP_MORA,   '
      '  CASE WHEN IDENTIFICADOR ='#39'INPA'#39'   '
      '            THEN  CASE   '
      
        '  '#9#9'        WHEN F_VENCIMIENTO <  TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/Y' +
        'YYY'#39' ) '
      '  '#9#9'         THEN 0    '
      '  '#9#9#9#9'END    '
      '  '#9#9'  ELSE IMP_IVA_MORA-IVA_PAG_MORAS   '
      '   END AS IMP_IVA_MORA,    '
      
        '  NUM_PERIODO,IMP_MORATORIO, IMP_MORA_IMP,IMP_PAG_MORAS, IMP_IVA' +
        '_MORA_IMP   '
      '  FROM (   '
      '  select CINT.*,   '
      '  '#9#9'CASE  WHEN IMP_PAGADO>0    '
      '  '#9#9' THEN '#39'INPA'#39'    '
      '   '#9#9' ELSE '#39'X'#39'    '
      '  '#9#9'END AS IDENTIFICADOR,   '
      '  '#9#9'IMP_PAGADO AS IMPORTE   '
      '  '#9#9'from (   '
      
        '    '#9#9'    SELECT CCRE.ID_CONTRATO,CINT.ID_CREDITO, NUM_PERIODO,C' +
        'INT.F_VENCIMIENTO-PLAZO AS F_INICIO, CINT.F_VENCIMIENTO, PLAZO, ' +
        '  '
      
        '  '#9#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'IN'#39',CINT.ID_CREDITO, NUM_PERIODO, ' +
        'CINT.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '
      '  '#9#9#9'SOBRETASA AS SOBRETASA,   '
      
        '  '#9#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'IN'#39',CINT.ID_CREDITO, NUM_PERIODO, ' +
        'CINT.F_VENCIMIENTO-1 )  AS TASA_FINAL,    '
      '  '#9#9#9'Imp_Interes,   '
      
        '  '#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IMPBRU'#39',CINT.ID_CREDITO,NU' +
        'M_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39') ' +
        'AS Imp_Pagado,   '
      '  '#9#9#9' F_PAGO,    '
      '  '#9#9#9' IMP_IVA AS IVA,    '
      '  '#9#9#9' IMP_MORATORIO,   '
      '  '#9#9#9' IMP_IVA_MORA,   '
      
        '  '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(4,'#39'V'#39',CINT.ID_CREDITO, NUM_PERIO' +
        'DO,NULL,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   +1,NULL)' +
        ' IMP_MORA_IMP,   '
      
        '  '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(4,'#39'F'#39',CINT.ID_CREDITO, NUM_PERIO' +
        'DO,NULL,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   +1,NULL)' +
        ' IMP_IVA_MORA_IMP,   '
      
        '  '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IMPMOR'#39',CINT.ID_CREDITO,N' +
        'UM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39')' +
        ' AS Imp_Pag_Moras,   '
      
        '  '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IVAMOR'#39',CINT.ID_CREDITO,N' +
        'UM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39')' +
        ' AS IVA_Pag_Moras   '
      
        '  '#9#9#9'FROM CR_INTERES CINT, CR_CREDITO CCRE, CONTRATO C, PERSONA ' +
        'P    '
      '  '#9#9#9'WHERE SIT_INTERES <> '#39'CA'#39'   '
      '  '#9#9#9'AND CINT.ID_CREDITO=CCRE.ID_CREDITO   '
      '  '#9#9#9'AND IMP_INTERES<> 0   '
      '  '#9#9#9'AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '
      '  '#9#9#9'AND C.ID_TITULAR=P.ID_PERSONA   '
      '  '#9#9#9'  AND CCRE.ID_CREDITO=172483     '
      '  '#9#9#9') CINT   '
      '  UNION'#9#9'   '
      '  select CINTV.*,   '
      
        '  '#9'    CASE WHEN (F_VENCIMIENTO<   TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/' +
        'YYYY'#39' )   ) and ( Imp_INTERES>Imp_pagado )    '
      '            THEN '#39'INVD'#39'    '
      '   '#9'    ELSE '#39'X'#39'   '
      '   '#9#9'END AS IDENTIFICADOR,   '
      '  '#9#9'Imp_INTERES-IMP_PAGADO AS IMPORTE   '
      '  '#9#9'from (   '
      
        '    '#9#9'    SELECT CCRE.ID_CONTRATO,CINT.ID_CREDITO, NUM_PERIODO,C' +
        'INT.F_VENCIMIENTO-PLAZO AS F_INICIO, CINT.F_VENCIMIENTO, PLAZO, ' +
        '  '
      
        '  '#9#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'IN'#39',CINT.ID_CREDITO, NUM_PERIODO, ' +
        'CINT.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '
      '  '#9#9#9'SOBRETASA AS SOBRETASA,   '
      
        '  '#9#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'IN'#39',CINT.ID_CREDITO, NUM_PERIODO, ' +
        'CINT.F_VENCIMIENTO-1 )  AS TASA_FINAL,    '
      '  '#9#9#9'Imp_Interes,   '
      
        '  '#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IMPBRU'#39',CINT.ID_CREDITO,NU' +
        'M_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39') ' +
        'AS Imp_Pagado,   '
      '  '#9#9#9' F_PAGO,    '
      '  '#9#9#9' IMP_IVA AS IVA,    '
      '  '#9#9#9' IMP_MORATORIO,   '
      '  '#9#9#9' IMP_IVA_MORA,   '
      
        '  '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(4,'#39'V'#39',CINT.ID_CREDITO, NUM_PERIO' +
        'DO,NULL,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   +1,NULL)' +
        ' IMP_MORA_IMP,   '
      
        '  '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(4,'#39'F'#39',CINT.ID_CREDITO, NUM_PERIO' +
        'DO,NULL,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   +1,NULL)' +
        ' IMP_IVA_MORA_IMP,   '
      
        '  '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IMPMOR'#39',CINT.ID_CREDITO,N' +
        'UM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39')' +
        ' AS Imp_Pag_Moras,   '
      
        '  '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IVAMOR'#39',CINT.ID_CREDITO,N' +
        'UM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39')' +
        ' AS IVA_Pag_Moras   '
      
        '  '#9#9#9'FROM CR_INTERES CINT, CR_CREDITO CCRE , CONTRATO C, PERSONA' +
        ' P   '
      '  '#9#9#9'WHERE SIT_INTERES <> '#39'CA'#39'   '
      '  '#9#9#9'AND CINT.ID_CREDITO=CCRE.ID_CREDITO   '
      '  '#9#9#9'AND IMP_INTERES<> 0   '
      '  '#9#9#9'AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '
      '  '#9#9#9'AND C.ID_TITULAR=P.ID_PERSONA   '
      '  '#9#9#9'  AND CCRE.ID_CREDITO=172483     '
      '  '#9#9'    ) CINTV'#9'   '
      '  UNION'#9#9'   '
      '  select CINTG.*,   '
      
        '  '#9'    CASE WHEN (F_VENCIMIENTO>=   TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM' +
        '/YYYY'#39' )   ) and ( Imp_INTERES>Imp_pagado )    '
      '            THEN '#39'INVI'#39'    '
      '   '#9'    ELSE '#39'X'#39'   '
      '   '#9#9'END AS IDENTIFICADOR,   '
      '  '#9#9'Imp_INTERES-IMP_PAGADO AS IMPORTE   '
      '  '#9#9'from (   '
      
        '    '#9#9'    SELECT CCRE.ID_CONTRATO,CINT.ID_CREDITO, NUM_PERIODO,C' +
        'INT.F_VENCIMIENTO-PLAZO AS F_INICIO, CINT.F_VENCIMIENTO, PLAZO, ' +
        '  '
      
        '   '#9#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'IN'#39',CINT.ID_CREDITO, NUM_PERIODO,' +
        ' CINT.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '
      '  '#9#9#9'SOBRETASA AS SOBRETASA,   '
      
        ' '#9#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'IN'#39',CINT.ID_CREDITO, NUM_PERIODO, C' +
        'INT.F_VENCIMIENTO-1 )  AS TASA_FINAL,    '
      '  '#9#9#9'Imp_Interes,   '
      
        '  '#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IMPBRU'#39',CINT.ID_CREDITO,NU' +
        'M_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39') ' +
        'AS Imp_Pagado,   '
      '  '#9#9#9' F_PAGO,    '
      '   '#9#9#9' IMP_IVA AS IVA,    '
      '  '#9#9#9' IMP_MORATORIO,   '
      '  '#9#9#9' IMP_IVA_MORA,   '
      
        '  '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(4,'#39'V'#39',CINT.ID_CREDITO, NUM_PERIO' +
        'DO,NULL,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   +1,NULL)' +
        ' IMP_MORA_IMP,   '
      
        '  '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(4,'#39'F'#39',CINT.ID_CREDITO, NUM_PERIO' +
        'DO,NULL,null,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   +1,NULL)' +
        ' IMP_IVA_MORA_IMP,   '
      
        '  '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IMPMOR'#39',CINT.ID_CREDITO,N' +
        'UM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39')' +
        ' AS Imp_Pag_Moras,   '
      
        '  '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IVAMOR'#39',CINT.ID_CREDITO,N' +
        'UM_PERIODO,NULL,    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V'#39')' +
        ' AS IVA_Pag_Moras   '
      
        '  '#9#9#9'FROM CR_INTERES CINT, CR_CREDITO CCRE , CONTRATO C, PERSONA' +
        ' P   '
      '  '#9#9#9'WHERE SIT_INTERES <> '#39'CA'#39'   '
      '  '#9#9#9'AND CINT.ID_CREDITO=CCRE.ID_CREDITO   '
      '  '#9#9#9'AND IMP_INTERES<> 0   '
      '  '#9#9#9'AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '
      '  '#9#9#9'AND C.ID_TITULAR=P.ID_PERSONA   '
      '  '#9#9'         AND CCRE.ID_CREDITO=172483     '
      '  '#9#9'    ) CINTG'#9#9#9#9#9'   '
      '  '#9#9') CCFA   '
      '  WHeRE IDENTIFICADOR <> '#39'X'#39'   '
      '  ) CTOD  '
      '   UNION   '
      '  SELECT 0 ESTATUS,   '
      '  0 CONCEPTO,   '
      '  F_AUT_COMITE,   '
      '  CCONT.IMP_AUTORIZADO,  '
      '  CCONT.F_VENCIMIENTO F_VEN_CONT,  '
      '  CCONT.CVE_TASA_REFER,   '
      '  CCONT.OPERADOR_STASA,  '
      '  CCONT.SOBRETASA SOBRETASACONT,   '
      '  CCRE.FACT_MORAS,   '
      '  NOMBRE,  '
      '  CCRE.ID_CONTRATO,   '
      '  ID_CREDITO,   '
      '  NULL IDENTIFICADOR,   '
      
        '  CCRE.F_INICIO F_INICIO, 0 PLAZO,  CCRE.F_VENCIMIENTO F_VENCIMI' +
        'ENTO,0 TASA_BASE,0 SOBRETASA, 0 TASA_FINAL,   '
      
        '  NULL F_PAGO,  CCRE.IMP_DISPUESTO IMPORTE, 0 IVA, 0 IMP_MORA,  ' +
        ' '
      '  0 IMP_IVA_MORA,   '
      
        '  0  NUM_PERIODO,0 IMP_MORATORIO, 0 IMP_MORA_IMP, 0 IMP_PAG_MORA' +
        'S, 0 IMP_IVA_MORA_IMP,   '
      '    0 IMP_DEPOSITO, '
      '    NULL  F_OPERACION, '
      '    0 CAPITAL, '
      '    0 FINADIC, '
      '    0 INTERES, '
      '    0 CONCEPTOS, '
      '    0 MORATORIOS, '
      '    0 IVAS, '
      '    0 OTROS, '
      
        '  NULL ANIO, NULL F_INI_PER, NULL F_VEN_PER, 0 CAPITAL_AD, 0 FIN' +
        'ADIC_AD ,0 INTERES_AD, 0 CONCEPTOS_AD, 0 MORATORIOS_AD, 0 IVAS_A' +
        'D, '
      
        '  0 tasa_base_ad, 0 sobretasa_ad, 0 tasa_final_ad,  0 TASA_MORA_' +
        'AD '
      
        '  FROM CR_CREDITO CCRE, CR_CONTRATO CCONT, CONTRATO C, PERSONA P' +
        '   '
      '  WHERE CCRE.ID_CONTRATO=CCONT.ID_CONTRATO   '
      '  AND CCONT.ID_CONTRATO=C.ID_CONTRATO   '
      '  AND C.ID_TITULAR=P.ID_PERSONA   '
      '  AND SIT_CREDITO<> '#39'CA'#39'   '
      '   AND CCRE.ID_CREDITO=172483    '
      '    UNION   '
      
        '  SELECT  5 ESTATUS, 5 CONCEPTO, NULL F_AUT_COMITE,  NULL IMP_AU' +
        'TORIZADO, NULL F_VEN_CONT, NULL CVE_TASA_REFER,   '
      
        '  NULL OPERADOR_STASA, NULL SOBRETASACONT, NULL FACT_MORAS, NULL' +
        ' NOMBRE,   '
      '  ID_CONTRATO,   '
      '  ID_CREDITO,   '
      
        '  NULL IDENTIFICADOR, F_OPERACION F_INICIO, 0 PLAZO, NULL F_VENC' +
        'IMIENTO, 0 TASA_BASE, 0 SOBRETASA,   '
      
        '  0 TASA_FINAL, NULL F_PAGO, 0 IMPORTE,0 IVA,0 IMP_MORA, 0 IMP_I' +
        'VA_MORA,0 NUM_PERIODO, 0 IMP_MORATORIO,     '
      '  0 IMP_MORA_IMP, 0 IMP_PAG_MORAS,0 IMP_IVA_MORA_IMP,   '
      
        '  IMP_DEPOSITO,F_OPERACION,CAPITAL, FINADIC, INTERES, CONCEPTOS,' +
        ' MORATORIOS, IVAS, OTROS,   '
      
        '  NULL ANIO, NULL F_INI_PER, NULL F_VEN_PER, 0 CAPITAL_AD, 0 FIN' +
        'ADIC_AD ,0 INTERES_AD, 0 CONCEPTOS_AD, 0 MORATORIOS_AD, 0 IVAS_A' +
        'D, '
      
        '  0 tasa_base_ad, 0 sobretasa_ad, 0 tasa_final_ad ,  0 TASA_MORA' +
        '_AD'
      '  FROM (   '
      
        '  SELECT CTRA.ID_CONTRATO, CTRA.ID_CREDITO,SUM(IMP_CONCEPTO) IMP' +
        '_DEPOSITO, CTRA.F_OPERACION,  '
      
        '  SUM( CASE WHEN CACC.CVE_ACCESORIO='#39'CP'#39' AND CVE_CONCEPTO='#39'IMPBR' +
        'U'#39' THEN IMP_CONCEPTO END ) CAPITAL,   '
      
        '  SUM( CASE WHEN CACC.CVE_ACCESORIO='#39'FN'#39' AND CVE_CONCEPTO='#39'IMPBR' +
        'U'#39' THEN IMP_CONCEPTO END ) FINADIC,   '
      
        '  SUM( CASE WHEN CACC.CVE_ACCESORIO='#39'IN'#39' AND CVE_CONCEPTO='#39'IMPBR' +
        'U'#39' THEN IMP_CONCEPTO END ) INTERES,   '
      
        '  SUM( CASE WHEN CACC.CVE_ACCESORIO='#39'CN'#39' AND CVE_CONCEPTO='#39'IMPBR' +
        'U'#39' THEN IMP_CONCEPTO END ) CONCEPTOS,   '
      
        '  SUM( CASE WHEN CVE_CONCEPTO='#39'IMPMOR'#39' THEN IMP_CONCEPTO END ) M' +
        'ORATORIOS,   '
      
        '  SUM( CASE WHEN CVE_CONCEPTO='#39'IMPIVA'#39' THEN IMP_CONCEPTO END ) I' +
        'VAS,   '
      
        '  SUM(CASE WHEN CACC.CVE_ACCESORIO NOT IN ('#39'CP'#39','#39'FN'#39','#39'IN'#39','#39'CN'#39') ' +
        'THEN IMP_CONCEPTO end ) otros   '
      
        '  from cr_transaccion CTRA, CR_DET_TRANSAC CDTRA, CR_OPERACION C' +
        'OPE, CR_ACCESORIO CACC, CR_CREDITO CCRE   '
      '  where id_trans_cancela  is null and sit_transaccion <> '#39'CA'#39'   '
      '  AND CTRA.ID_CREDITO=CCRE.ID_CREDITO '
      '   AND CCRE.ID_CREDITO=172483    '
      '  AND CTRA.ID_TRANSACCION=CDTRA.ID_TRANSACCION  '
      '  AND CTRA.CVE_OPERACION=COPE.CVE_OPERACION  '
      '  AND COPE.CVE_ACCESORIO=CACC.CVE_ACCESORIO  '
      '  AND COPE.B_EDO_CTA='#39'V'#39'  '
      
        '  AND F_OPERACION <= TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   grou' +
        'p by CTRA.ID_CONTRATO,CTRA.ID_CREDITO,CTRA.f_operacion '
      '  ORDER BY CTRA.ID_CONTRATO,CTRA.ID_CREDITO,CTRA.F_OPERACION '
      '  ) yyy '
      ' UNION '
      ' SELECT U_6.*  '
      ' FROM (SELECT 6 ESTATUS, 6 CONCEPTO,   '
      '   null F_AUT_COMITE,    '
      '   0 IMP_AUTORIZADO,   '
      '   NULL F_VEN_CONT,    '
      '   NULL CVE_TASA_REFER,    '
      '   NULL OPERADOR_STASA,    '
      '   0 SOBRETASACONT,    '
      '   0 FACT_MORAS,    '
      '   NULL NOMBRE, '
      '   ID_CONTRATO,    '
      '   ID_CREDITO,    '
      '   NULL IDENTIFICADOR,    '
      
        '   NULL F_INICIO, 0 PLAZO,  NULL F_VENCIMIENTO, 0 TASA_BASE,0 SO' +
        'BRETASA, 0 TASA_FINAL,      '
      '   NULL F_PAGO,  NULL IMPORTE, 0 IVA, 0 IMP_MORA,    '
      '   0 IMP_IVA_MORA,    '
      
        '   0  NUM_PERIODO,0 IMP_MORATORIO, 0 IMP_MORA_IMP, 0 IMP_PAG_MOR' +
        'AS, 0 IMP_IVA_MORA_IMP, '
      '   0 IMP_DEPOSITO, '
      '   NULL F_OPERACION,    '
      '     0 CAPITAL,  '
      '     0 FINADIC,  '
      '     0 INTERES,  '
      '     0 CONCEPTOS,  '
      '     0 MORATORIOS,  '
      '     0 IVAS,  '
      '     0 OTROS,   '
      
        ' TO_CHAR(F_INICIO,'#39'YYYY'#39') ANIO, min(F_INICIO) f_ini_per, max(f_V' +
        'encimiento) f_ven_per, SUM(DECODE(CONCEPTO,3,IMPORTE,0)) AS CAPI' +
        'TAL_AD, SUM(DECODE(CONCEPTO,1,IMPORTE,0)) AS FINADIC_AD, '
      
        ' SUM(DECODE(CONCEPTO,2,IMPORTE,0)) AS INTERESES_AD, SUM(DECODE(C' +
        'ONCEPTO,4,IMPORTE,0)) AS CONCEPTOS_AD, SUM(IMP_MORA) MORATORIOS_' +
        'AD, '
      
        ' SUM(IVA+IMP_IVA_MORA) IVAS_AD, tasa_base_ad, sobretasa_ad, tasa' +
        '_final_ad, TASA_MORA_aD  '
      ' FROM ( '
      
        '   SELECT Decode(Substr(IDENTIFICADOR,3,2),'#39'PA'#39',1,Decode(Substr(' +
        'Identificador,3,2) ,'#39'VD'#39',2,3)) ESTATUS,    '
      
        '   Decode(Substr(IDENTIFICADOR,1,2),'#39'FA'#39',1, Decode(Substr(Identi' +
        'ficador,1,2) ,'#39'IN'#39',2,Decode(Substr(Identificador,1,2) ,'#39'CA'#39',3,4)' +
        ')) CONCEPTO,    '
      '   null F_AUT_COMITE,    '
      '   0 IMP_AUTORIZADO,   '
      '   NULL F_VEN_CONT,    '
      '   NULL CVE_TASA_REFER,    '
      '   NULL OPERADOR_STASA,    '
      '   0 SOBRETASACONT,    '
      '   0 FACT_MORAS,    '
      '   NULL NOMBRE,    '
      '   CTOD.*, '
      '   0 CAPITAL, '
      '   0 FINADIC, '
      '   0 INTERES, '
      '   0 CONCEPTOS, '
      '   0 MORATORIOS, '
      '   0 IVAS, '
      '   0 OTROS,   '
      
        '    NULL ANIO, NULL F_INI_PER, NULL F_VEN_PER, 0 CAPITAL_AD, 0 F' +
        'INADIC_AD ,0 INTERES_AD, 0 CONCEPTOS_AD, 0 MORATORIOS_AD, 0 IVAS' +
        '_AD '
      '   FROM      '
      '   (    '
      '   SELECT ID_CONTRATO,ID_CREDITO,IDENTIFICADOR,    '
      
        '   F_INICIO, PLAZO, F_VENCIMIENTO,TASA_BASE,SOBRETASA, TASA_FINA' +
        'L,    '
      '   F_PAGO, IMPORTE, IVA,    '
      '   CASE WHEN IDENTIFICADOR ='#39'CAPA'#39'    '
      '             THEN  CASE    '
      
        '   '#9#9'        WHEN F_VENCIMIENTO <   TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM' +
        '/YYYY'#39' )   '
      '   '#9#9'         THEN 0    '
      '   '#9#9#9#9'END     '
      '   '#9#9'  ELSE IMP_MORA_IMP-IMP_PAG_MORAS      '
      '    END AS IMP_MORA,    '
      '   CASE WHEN IDENTIFICADOR ='#39'CAPA'#39'    '
      '             THEN  CASE    '
      
        '  '#9#9'        WHEN F_VENCIMIENTO <   TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/' +
        'YYYY'#39' )   '
      '   '#9#9'         THEN 0    '
      '   '#9#9#9#9'END     '
      '   '#9#9'  ELSE IMP_IVA_MORA-IVA_PAG_MORAS    '
      '    END AS IMP_IVA_MORA,      '
      
        '   NUM_PERIODO,IMP_MORATORIO, IMP_MORA_IMP,IMP_PAG_MORAS, IMP_IV' +
        'A_MORA_IMP    '
      '   FROM (    '
      '   select CCA.*,    '
      '   '#9#9'CASE  WHEN IMP_PAGADO>0     '
      '   '#9#9' THEN '#39'CAPA'#39'     '
      '   '#9#9' ELSE '#39'X'#39'     '
      '   '#9#9'END AS IDENTIFICADOR,    '
      '   '#9#9'IMP_PAGADO AS IMPORTE    '
      '   '#9#9'from (    '
      
        '   '#9#9#9#9'SELECT CCRE.ID_CONTRATO,CCAP.ID_CREDITO,NUM_PERIODO,CCAP.' +
        'F_VENCIMIENTO-PLAZO AS F_INICIO, CCAP.F_VENCIMIENTO, PLAZO,    '
      '   '#9#9#9#9'0 TASA_BASE,    '
      '   '#9#9#9#9'0 AS SOBRETASA,    '
      '   '#9#9#9#9'0 AS TASA_FINAL,     '
      '   '#9#9#9#9'Imp_Capital,    '
      
        '   '#9#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IMPBRU'#39',CCAP.ID_CREDITO,' +
        'NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39'V' +
        #39') AS Imp_Pagado,    '
      '   '#9#9#9#9' F_PAGO,     '
      '   '#9#9#9#9' 0 AS IVA,     '
      '   '#9#9#9#9' IMP_MORATORIO,     '
      '   '#9#9#9#9' IMP_IVA_MORA,      '
      
        '   '#9#9#9#9' PKGCRPERIODO.FUNOBTENMORA(1,'#39'V'#39',CCAP.ID_CREDITO, NUM_PER' +
        'IODO,null,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,NULL' +
        ') IMP_MORA_IMP,    '
      
        '   '#9#9#9#9' PKGCRPERIODO.FUNOBTENMORA(1,NULL,CCAP.ID_CREDITO, NUM_PE' +
        'RIODO,null,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,nul' +
        'l) IMP_IVA_MORA_IMP,    '
      
        '   '#9#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IMPMOR'#39',CCAP.ID_CREDITO' +
        ',NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,' +
        #39'V'#39') AS Imp_Pag_Moras,    '
      
        '   '#9#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IVAMOR'#39',CCAP.ID_CREDITO' +
        ',NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39 +
        'V'#39') AS IVA_Pag_Moras    '
      '   '#9#9#9#9'FROM CR_CAPITAL CCAP, CR_CREDITO CCRE     '
      '   '#9#9#9#9'WHERE SIT_CAPITAL <> '#39'CA'#39'    '
      '   '#9#9#9#9'AND CCAP.ID_CREDITO=CCRE.ID_CREDITO    '
      '   '#9#9#9'     AND CCRE.ID_CREDITO=172483 '
      '   '#9#9#9#9') CCA    '
      '   UNION'#9#9'    '
      '   select CCAV.*,    '
      
        '   '#9'    CASE WHEN (F_VENCIMIENTO<    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/M' +
        'M/YYYY'#39' )    ) and ( Imp_CAPITAL>Imp_pagado )     '
      '           THEN '#39'CAVD'#39
      '   '#9'    ELSE '#39'X'#39'    '
      '   '#9#9'END AS IDENTIFICADOR,    '
      
        '   '#9#9'Imp_CAPITAL-IMP_PAGADO+ NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,' +
        '0) AS IMPORTE'
      '   '#9#9'from (    '
      
        '   '#9#9#9#9'SELECT CCRE.ID_CONTRATO,CCAP.ID_CREDITO,NUM_PERIODO,CCAP.' +
        'F_VENCIMIENTO-PLAZO AS F_INICIO, CCAP.F_VENCIMIENTO, PLAZO,'
      '   '#9#9#9#9'0 as TASA_BASE,    '
      '   '#9#9#9#9'0 AS SOBRETASA,    '
      '   '#9#9#9#9'0  AS TASA_FINAL,     '
      '   '#9#9#9#9'Imp_Capital,    '
      
        '   '#9#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IMPBRU'#39',CCAP.ID_CREDITO,' +
        'NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39 +
        'V'#39') AS Imp_Pagado,'
      '   '#9#9#9#9' F_PAGO,     '
      '   '#9#9#9#9' 0 AS IVA,     '
      '   '#9#9#9#9' IMP_MORATORIO,     '
      '   '#9#9#9#9' IMP_IVA_MORA,      '
      
        '   '#9#9#9#9' PKGCRPERIODO.FUNOBTENMORA(1,'#39'V'#39',CCAP.ID_CREDITO, NUM_PER' +
        'IODO,null,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,NUL' +
        'L) IMP_MORA_IMP,    '
      
        '   '#9#9#9#9' PKGCRPERIODO.FUNOBTENMORA(1,NULL,CCAP.ID_CREDITO, NUM_PE' +
        'RIODO,null,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,nu' +
        'll) IMP_IVA_MORA_IMP,    '
      
        '   '#9#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IMPMOR'#39',CCAP.ID_CREDITO' +
        ',NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,' +
        #39'V'#39') AS Imp_Pag_Moras,    '
      
        '   '#9#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IVAMOR'#39',CCAP.ID_CREDITO' +
        ',NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,' +
        #39'V'#39') AS IVA_Pag_Moras    '
      '   '#9#9#9#9'FROM CR_CAPITAL CCAP, CR_CREDITO CCRE     '
      '   '#9#9#9#9'WHERE SIT_CAPITAL <> '#39'CA'#39'    '
      '   '#9#9#9#9'AND CCAP.ID_CREDITO=CCRE.ID_CREDITO    '
      '   '#9#9#9'          AND CCRE.ID_CREDITO=172483'
      '   '#9#9#9#9') CCAV'
      '                               ,('
      
        '                                SELECT CT.ID_CREDITO, CT.ID_PERI' +
        'ODO,'
      
        '                           NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_H' +
        'IST_PGDMCP'
      '                      FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'
      '                     WHERE 1=1'
      '                       AND CT.SIT_TRANSACCION = '#39'AC'#39
      '                       AND CT.ID_TRANS_CANCELA IS NULL'
      
        '                       AND CT.ID_TRANSACCION = CDT.ID_TRANSACCIO' +
        'N'
      '                       AND CT.CVE_OPERACION IN ('#39'PGDMCP'#39')'
      
        '                                   AND CDT.CVE_CONCEPTO IN ('#39'IMP' +
        'BRU'#39')'
      '                     GROUP BY CT.ID_CREDITO, CT.ID_PERIODO'
      '                                ) CA_HIST_PGDMCP'
      '                       WHERE 1=1'
      
        '                AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCAV.ID_CREDI' +
        'TO'
      
        '                AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCAV.NUM_PERI' +
        'ODO'
      '   UNION'#9#9'    '
      '   select CCAG.*,    '
      
        '   '#9'    CASE WHEN (F_VENCIMIENTO>=    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/' +
        'MM/YYYY'#39' )   ) and ( Imp_CAPITAL>Imp_pagado )     '
      '           THEN '#39'CAVI'#39'     '
      '   '#9'    ELSE '#39'X'#39'    '
      '   '#9#9'END AS IDENTIFICADOR,    '
      
        '   '#9#9'Imp_CAPITAL-IMP_PAGADO + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP' +
        ',0) AS IMPORTE'
      '   '#9#9'from (    '
      
        '   '#9#9#9#9'SELECT CCRE.ID_CONTRATO,CCAP.ID_CREDITO,NUM_PERIODO,CCAP.' +
        'F_VENCIMIENTO-PLAZO AS F_INICIO, CCAP.F_VENCIMIENTO, PLAZO,'
      '    '#9#9#9#9'0 TASA_BASE,    '
      '   '#9#9#9#9'0 AS SOBRETASA,    '
      '   '#9#9#9#9'0 AS TASA_FINAL,     '
      '   '#9#9#9#9'Imp_Capital,    '
      
        '   '#9#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IMPBRU'#39',CCAP.ID_CREDITO,' +
        'NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39 +
        'V'#39') AS Imp_Pagado,    '
      '   '#9#9#9#9' F_PAGO,     '
      '   '#9#9#9#9' 0 AS IVA,     '
      '   '#9#9#9#9' IMP_MORATORIO,     '
      '   '#9#9#9#9' IMP_IVA_MORA,      '
      
        '   '#9#9#9#9' PKGCRPERIODO.FUNOBTENMORA(1,'#39'V'#39',CCAP.ID_CREDITO, NUM_PER' +
        'IODO,null,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,NUL' +
        'L) IMP_MORA_IMP,    '
      
        '   '#9#9#9#9' PKGCRPERIODO.FUNOBTENMORA(1,NULL,CCAP.ID_CREDITO, NUM_PE' +
        'RIODO,null,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,nu' +
        'll) IMP_IVA_MORA_IMP,    '
      
        '   '#9#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IMPMOR'#39',CCAP.ID_CREDITO' +
        ',NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39 +
        'V'#39') AS Imp_Pag_Moras,    '
      
        '   '#9#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CP'#39','#39'IVAMOR'#39',CCAP.ID_CREDITO' +
        ',NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )   ,'#39 +
        'V'#39') AS IVA_Pag_Moras    '
      '   '#9#9#9#9'FROM CR_CAPITAL CCAP, CR_CREDITO CCRE     '
      '   '#9#9#9#9'WHERE SIT_CAPITAL <> '#39'CA'#39'    '
      '   '#9#9#9#9'AND CCAP.ID_CREDITO=CCRE.ID_CREDITO    '
      '   '#9#9#9'          AND CCRE.ID_CREDITO=172483 '
      '   '#9#9#9#9')  CCAG'
      '                             ,( '
      
        '                              SELECT CT.ID_CREDITO, CT.ID_PERIOD' +
        'O,'
      
        '                         NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIS' +
        'T_PGDMCP'
      '                    FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'
      '                   WHERE 1=1'
      '                     AND CT.SIT_TRANSACCION = '#39'AC'#39
      '                     AND CT.ID_TRANS_CANCELA IS NULL'
      '                     AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION'
      '                     AND CT.CVE_OPERACION IN ('#39'PGDMCP'#39')'
      
        '                                 AND CDT.CVE_CONCEPTO IN ('#39'IMPBR' +
        'U'#39')'
      '                   GROUP BY CT.ID_CREDITO, CT.ID_PERIODO'
      '                              ) CA_HIST_PGDMCP'
      '                     WHERE 1=1'
      '              AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCAG.ID_CREDITO'
      
        '              AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCAG.NUM_PERIOD' +
        'O'
      '   '#9') CCCA    '
      '   WHERE IDENTIFICADOR <> '#39'X'#39'    '
      '   UNION    '
      
        '   SELECT ID_CONTRATO,ID_CREDITO, IDENTIFICADOR,F_INICIO, PLAZO,' +
        ' F_VENCIMIENTO,TASA_BASE,SOBRETASA, TASA_FINAL,    '
      '   F_PAGO, IMPORTE, IVA,    '
      '   CASE WHEN IDENTIFICADOR ='#39'FAPA'#39'    '
      '             THEN  CASE    '
      
        '   '#9#9'        WHEN F_VENCIMIENTO <   TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM' +
        '/YYYY'#39' )   '
      '   '#9#9'         THEN 0    '
      '   '#9#9#9#9'END     '
      '   '#9#9'  ELSE IMP_MORA_IMP-IMP_PAG_MORAS      '
      '    END AS IMP_MORA,    '
      '   CASE WHEN IDENTIFICADOR ='#39'FAPA'#39'    '
      '             THEN  CASE    '
      
        '   '#9#9'        WHEN F_VENCIMIENTO <   TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM' +
        '/YYYY'#39' )   '
      '   '#9#9'         THEN 0    '
      '   '#9#9#9#9'END     '
      '   '#9#9'  ELSE IMP_IVA_MORA-IVA_PAG_MORAS    '
      '    END AS IMP_IVA_MORA,      '
      
        '   NUM_PERIODO,IMP_MORATORIO, IMP_MORA_IMP,IMP_PAG_MORAS, IMP_IV' +
        'A_MORA_IMP    '
      '   FROM (    '
      '   select CFA.*,    '
      '   '#9#9'CASE  WHEN IMP_PAGADO>0     '
      '  '#9#9' THEN '#39'FAPA'#39'     '
      '   '#9#9' ELSE '#39'X'#39'     '
      '   '#9#9'END AS IDENTIFICADOR,    '
      '   '#9#9'IMP_PAGADO AS IMPORTE    '
      '   '#9#9'from (    '
      
        '   '#9#9'SELECT CCRE.ID_CONTRATO,CFAD.ID_CREDITO, NUM_PERIODO,CFAD.F' +
        '_VENCIMIENTO-PLAZO AS F_INICIO, CFAD.F_VENCIMIENTO, PLAZO,    '
      '   '#9#9'0 TASA_BASE,    '
      '   '#9#9'0 AS SOBRETASA,    '
      '   '#9#9'0 AS TASA_FINAL,     '
      '   '#9#9'Imp_FINAN_aDIC,    '
      
        '   '#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IMPBRU'#39',CFAD.ID_CREDITO,NU' +
        'M_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39'V'#39 +
        ') AS Imp_Pagado,    '
      '   '#9#9' F_PAGO,     '
      '   '#9#9' 0 AS IVA,     '
      '        '#9' IMP_MORATORIO,     '
      '   '#9#9' IMP_IVA_MORA,       '
      
        '   '#9#9' PKGCRPERIODO.FUNOBTENMORA(3,'#39'V'#39',CFAD.ID_CREDITO, NUM_PERIO' +
        'DO,NULL,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,null)' +
        ' IMP_MORA_IMP,    '
      
        '   '#9#9' PKGCRPERIODO.FUNOBTENMORA(3,'#39'F'#39',CFAD.ID_CREDITO, NUM_PERIO' +
        'DO,null,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,null)' +
        ' IMP_IVA_MORA_IMP,    '
      
        '   '#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IMPMOR'#39',CFAD.ID_CREDITO,N' +
        'UM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39'V' +
        #39') AS Imp_Pag_Moras,    '
      
        '   '#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IVAMOR'#39',CFAD.ID_CREDITO,N' +
        'UM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39'V' +
        #39') AS IVA_Pag_Moras    '
      '   '#9#9'FROM CR_FINAN_ADIC CFAD, CR_CREDITO CCRE     '
      '   '#9#9'WHERE SIT_FINAN_ADIC <> '#39'CA'#39'    '
      '   '#9#9'AND CFAD.ID_CREDITO=CCRE.ID_CREDITO    '
      '   '#9'          AND CCRE.ID_CREDITO=172483 '
      '   '#9#9') CFA    '
      '   UNION'#9#9'    '
      '   select CFAV.*,    '
      
        '   '#9'    CASE WHEN (F_VENCIMIENTO<    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/M' +
        'M/YYYY'#39' )    ) and ( Imp_FINAN_aDIC>Imp_pagado )     '
      '           THEN '#39'FAVD'#39'     '
      '   '#9'    ELSE '#39'X'#39'    '
      '   '#9#9'END AS IDENTIFICADOR,    '
      '   '#9#9'Imp_FINAN_aDIC-IMP_PAGADO AS IMPORTE    '
      '   '#9#9'from (    '
      
        '   '#9#9'SELECT CCRE.ID_CONTRATO,CFAD.ID_CREDITO, NUM_PERIODO,CFAD.F' +
        '_VENCIMIENTO-PLAZO AS F_INICIO, CFAD.F_VENCIMIENTO, PLAZO,    '
      '   '#9#9'0 TASA_BASE,    '
      '   '#9#9'0 AS SOBRETASA,    '
      '   '#9#9'0 AS TASA_FINAL,     '
      '   '#9#9'Imp_FINAN_aDIC,    '
      
        '   '#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IMPBRU'#39',CFAD.ID_CREDITO,NU' +
        'M_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39'V'#39 +
        ') AS Imp_Pagado,    '
      '   '#9#9' F_PAGO,     '
      '   '#9#9' 0 AS IVA,     '
      '        '#9' IMP_MORATORIO,     '
      '    '#9#9' IMP_IVA_MORA,       '
      
        '   '#9#9' PKGCRPERIODO.FUNOBTENMORA(3,'#39'V'#39',CFAD.ID_CREDITO, NUM_PERIO' +
        'DO,NULL,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,null)' +
        ' IMP_MORA_IMP,    '
      
        '   '#9#9' PKGCRPERIODO.FUNOBTENMORA(3,'#39'F'#39',CFAD.ID_CREDITO, NUM_PERIO' +
        'DO,null,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,null)' +
        ' IMP_IVA_MORA_IMP,    '
      
        '   '#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IMPMOR'#39',CFAD.ID_CREDITO,N' +
        'UM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39'V' +
        #39') AS Imp_Pag_Moras,    '
      
        '   '#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IVAMOR'#39',CFAD.ID_CREDITO,N' +
        'UM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39'V' +
        #39') AS IVA_Pag_Moras    '
      '   '#9#9'FROM CR_FINAN_ADIC CFAD, CR_CREDITO CCRE     '
      '   '#9#9'WHERE SIT_FINAN_ADIC <> '#39'CA'#39'    '
      '   '#9#9'AND CFAD.ID_CREDITO=CCRE.ID_CREDITO    '
      '   '#9'          AND CCRE.ID_CREDITO=172483 '
      '   '#9#9') CFAV'#9'    '
      '   UNION'#9#9'    '
      '   select CFAG.*,    '
      
        '   '#9'    CASE WHEN (F_VENCIMIENTO>=    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/' +
        'MM/YYYY'#39' )    ) and ( Imp_FINAN_aDIC>Imp_pagado )     '
      '             THEN '#39'FAVI'#39'     '
      '    '#9'    ELSE '#39'X'#39'    '
      '      '#9#9'END AS IDENTIFICADOR,    '
      '    '#9#9'Imp_FINAN_aDIC-IMP_PAGADO AS IMPORTE    '
      '   '#9#9'from (    '
      
        '   '#9#9'SELECT CCRE.ID_CONTRATO,CFAD.ID_CREDITO, NUM_PERIODO,CFAD.F' +
        '_VENCIMIENTO-PLAZO AS F_INICIO, CFAD.F_VENCIMIENTO, PLAZO,    '
      '   '#9#9'0 TASA_BASE,    '
      '   '#9#9'0 AS SOBRETASA,    '
      '   '#9#9'0 AS TASA_FINAL,     '
      '   '#9#9'Imp_FINAN_aDIC,    '
      
        '   '#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IMPBRU'#39',CFAD.ID_CREDITO,NU' +
        'M_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39'V'#39 +
        ') AS Imp_Pagado,    '
      '   '#9#9' F_PAGO,     '
      '   '#9#9' 0 AS IVA,     '
      '        '#9' IMP_MORATORIO,     '
      '   '#9#9' IMP_IVA_MORA,       '
      
        '   '#9#9' PKGCRPERIODO.FUNOBTENMORA(3,'#39'V'#39',CFAD.ID_CREDITO, NUM_PERIO' +
        'DO,NULL,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,null)' +
        ' IMP_MORA_IMP,    '
      
        '   '#9#9' PKGCRPERIODO.FUNOBTENMORA(3,'#39'F'#39',CFAD.ID_CREDITO, NUM_PERIO' +
        'DO,null,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,null)' +
        ' IMP_IVA_MORA_IMP,    '
      
        '   '#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IMPMOR'#39',CFAD.ID_CREDITO,N' +
        'UM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39'V' +
        #39') AS Imp_Pag_Moras,    '
      
        '   '#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'FN'#39','#39'IVAMOR'#39',CFAD.ID_CREDITO,N' +
        'UM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39'V' +
        #39') AS IVA_Pag_Moras    '
      '   '#9#9'FROM CR_FINAN_ADIC CFAD, CR_CREDITO CCRE    '
      '   '#9#9'WHERE SIT_FINAN_ADIC <> '#39'CA'#39'    '
      '   '#9#9'AND CFAD.ID_CREDITO=CCRE.ID_CREDITO    '
      '                   AND CCRE.ID_CREDITO=172483 '
      '   '#9#9') CFAG'#9#9#9#9#9'    '
      '   '#9#9') CCFA    '
      '   WHERE IDENTIFICADOR <> '#39'X'#39'    '
      '   UNION    '
      
        '   SELECT ID_CONTRATO, ID_CREDITO,IDENTIFICADOR,F_INICIO, PLAZO,' +
        ' F_VENCIMIENTO,TASA_BASE,SOBRETASA, TASA_FINAL,    '
      '   F_PAGO, IMPORTE, IVA,    '
      '   CASE WHEN IDENTIFICADOR ='#39'COPA'#39'    '
      '         THEN  CASE    '
      
        '     WHEN F_VENCIMIENTO <   TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )' +
        '   '
      '     THEN 0    '
      '  END     '
      '   '#9'  ELSE IMP_MORA_IMP-IMP_PAG_MORAS      '
      '   END AS IMP_MORA,    '
      '   CASE WHEN IDENTIFICADOR ='#39'COPA'#39'    '
      '             THEN  CASE    '
      
        '      WHEN F_VENCIMIENTO <   TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' ' +
        ')   '
      '       THEN 0    '
      '   '#9#9#9#9'END     '
      '   '#9#9'  ELSE IMP_IVA_MORA-IVA_PAG_MORAS    '
      '    END AS IMP_IVA_MORA,     '
      
        '   NUM_PERIODO,IMP_MORATORIO, IMP_MORA_IMP,IMP_PAG_MORAS, IMP_IV' +
        'A_MORA_IMP    '
      '   FROM (    '
      '   select CCNP.*,    '
      '   '#9#9'CASE  WHEN IMP_PAGADO>0     '
      '   '#9#9' THEN '#39'COPA'#39'     '
      '   '#9#9' ELSE '#39'X'#39'     '
      '   '#9#9'END AS IDENTIFICADOR,    '
      '   '#9#9'IMP_PAGADO AS IMPORTE    '
      '   '#9#9'from (    '
      
        '   '#9#9#9'SELECT CCRE.ID_CONTRATO,CCOM.ID_CREDITO, NUM_PERIODO,CCOM.' +
        'F_VENCIMIENTO-PLAZO AS F_INICIO, CCOM.F_VENCIMIENTO, PLAZO,    '
      '   '#9#9#9'0 TASA_BASE,    '
      '   '#9#9#9'0 AS SOBRETASA,    '
      '   '#9#9#9'0 AS TASA_FINAL,     '
      '   '#9#9#9'Imp_Comision,    '
      
        '   '#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IMPBRU'#39',CCOM.ID_CREDITO,N' +
        'UM_PERIODO,CVE_COMISION,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' ' +
        ')    ,'#39'V'#39') AS Imp_Pagado,    '
      '   '#9#9#9' F_PAGO,     '
      '   '#9#9#9' IMP_IVA AS IVA,    '
      '   '#9#9#9' IMP_MORATORIO,    '
      '   '#9#9#9' IMP_IVA_MORA,     '
      
        '   '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(2,'#39'V'#39',CCOM.ID_CREDITO, NUM_PERI' +
        'ODO,CVE_COMISION,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' ) ' +
        '   ,null) IMP_MORA_IMP,    '
      
        '   '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(2,'#39'F'#39',CCOM.ID_CREDITO, NUM_PERI' +
        'ODO,CVE_COMISION,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' ) ' +
        '   ,null) IMP_IVA_MORA_IMP,    '
      
        '   '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IMPMOR'#39',CCOM.ID_CREDITO,' +
        'NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39 +
        'V'#39') AS Imp_Pag_Moras,    '
      
        '   '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IVAMOR'#39',CCOM.ID_CREDITO,' +
        'NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39 +
        'V'#39') AS IVA_Pag_Moras    '
      '   '#9#9#9'FROM CR_COMISION CCOM, CR_CREDITO CCRE    '
      '   '#9#9#9'WHERE SIT_COMISION <> '#39'CA'#39'    '
      '   '#9#9#9'and CCOM.ID_CREDITO=CCRE.ID_CREDITO    '
      '        AND CCRE.ID_CREDITO=172483 '
      '   '#9#9#9') CCNP    '
      '   UNION'#9#9'    '
      '   select CCNV.*,    '
      
        '   '#9'    CASE WHEN (F_VENCIMIENTO<    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/M' +
        'M/YYYY'#39' )    ) and ( Imp_COMISION>Imp_pagado )     '
      '           THEN '#39'COVD'#39'     '
      '   '#9'    ELSE '#39'X'#39'    '
      '   '#9#9'END AS IDENTIFICADOR,    '
      '   '#9#9'Imp_COMISION-IMP_PAGADO AS IMPORTE    '
      '   '#9#9'from (    '
      
        '   '#9#9#9'SELECT CCRE.ID_CONTRATO,CCOM.ID_CREDITO, NUM_PERIODO,CCOM.' +
        'F_VENCIMIENTO-PLAZO AS F_INICIO, CCOM.F_VENCIMIENTO, PLAZO,    '
      '   '#9#9#9'0 TASA_BASE,    '
      '   '#9#9#9'0 AS SOBRETASA,    '
      '   '#9#9#9'0 AS TASA_FINAL,     '
      '   '#9#9#9'Imp_Comision,    '
      
        '   '#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IMPBRU'#39',CCOM.ID_CREDITO,N' +
        'UM_PERIODO,CVE_COMISION,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' ' +
        ')    ,'#39'V'#39') AS Imp_Pagado,    '
      '    '#9#9#9' F_PAGO,     '
      '   '#9#9#9' IMP_IVA AS IVA,    '
      '   '#9#9#9' IMP_MORATORIO,    '
      '   '#9#9#9' IMP_IVA_MORA,     '
      
        '   '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(2,'#39'V'#39',CCOM.ID_CREDITO, NUM_PERI' +
        'ODO,CVE_COMISION,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' ) ' +
        '   ,null) IMP_MORA_IMP,    '
      
        '   '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(2,'#39'F'#39',CCOM.ID_CREDITO, NUM_PERI' +
        'ODO,CVE_COMISION,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' ) ' +
        '   ,null) IMP_IVA_MORA_IMP,    '
      
        '   '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IMPMOR'#39',CCOM.ID_CREDITO,' +
        'NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39 +
        'V'#39') AS Imp_Pag_Moras,    '
      
        '   '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IVAMOR'#39',CCOM.ID_CREDITO,' +
        'NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39 +
        'V'#39') AS IVA_Pag_Moras    '
      '    '#9#9#9'FROM CR_COMISION CCOM, CR_CREDITO CCRE     '
      '   '#9#9#9'WHERE SIT_COMISION <> '#39'CA'#39'    '
      '   '#9#9#9'and CCOM.ID_CREDITO=CCRE.ID_CREDITO    '
      '   '#9#9#9'   AND CCRE.ID_CREDITO=172483 '
      '   '#9#9#9') CCNV    '
      '   UNION'#9#9'    '
      '   select CCNG.*,    '
      
        '   '#9'    CASE WHEN (F_VENCIMIENTO>=    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/' +
        'MM/YYYY'#39' )    ) and ( Imp_COMISION>Imp_pagado )     '
      '           THEN '#39'COVI'#39'     '
      '   '#9'    ELSE '#39'X'#39'    '
      '   '#9#9'END AS IDENTIFICADOR,    '
      '   '#9#9'Imp_COMISION-IMP_PAGADO AS IMPORTE    '
      '   '#9#9'from (    '
      
        '   '#9#9#9'SELECT CCRE.ID_CONTRATO,CCOM.ID_CREDITO, NUM_PERIODO,CCOM.' +
        'F_VENCIMIENTO-PLAZO AS F_INICIO, CCOM.F_VENCIMIENTO, PLAZO,    '
      '   '#9#9#9'0 TASA_BASE,    '
      '   '#9#9#9'0 AS SOBRETASA,    '
      '   '#9#9#9'0 AS TASA_FINAL,     '
      '   '#9#9#9'Imp_Comision,    '
      
        '   '#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IMPBRU'#39',CCOM.ID_CREDITO,N' +
        'UM_PERIODO,CVE_COMISION,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' ' +
        ')    ,'#39'V'#39') AS Imp_Pagado,    '
      '   '#9#9#9' F_PAGO,     '
      '   '#9#9#9' IMP_IVA AS IVA,    '
      '   '#9#9#9' IMP_MORATORIO,    '
      '   '#9#9#9' IMP_IVA_MORA,     '
      
        '   '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(2,'#39'V'#39',CCOM.ID_CREDITO, NUM_PERI' +
        'ODO,CVE_COMISION,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' ) ' +
        '   ,null) IMP_MORA_IMP,    '
      
        '   '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(2,'#39'F'#39',CCOM.ID_CREDITO, NUM_PERI' +
        'ODO,CVE_COMISION,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' ) ' +
        '   ,null) IMP_IVA_MORA_IMP,    '
      
        '   '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IMPMOR'#39',CCOM.ID_CREDITO,' +
        'NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39 +
        'V'#39') AS Imp_Pag_Moras,    '
      
        '   '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'CN'#39','#39'IVAMOR'#39',CCOM.ID_CREDITO,' +
        'NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39 +
        'V'#39') AS IVA_Pag_Moras    '
      '   '#9#9#9'FROM CR_COMISION CCOM, CR_CREDITO CCRE    '
      '   '#9#9#9'WHERE SIT_COMISION <> '#39'CA'#39'    '
      '   '#9#9#9'and CCOM.ID_CREDITO=CCRE.ID_CREDITO    '
      '   '#9#9#9'   AND CCRE.ID_CREDITO=172483 '
      '   '#9#9#9') CCNG    '
      '   '#9#9') CCNG    '
      '   '#9#9'WHERE IDENTIFICADOR <> '#39'X'#39'    '
      '   UNION    '
      
        '   SELECT ID_CONTRATO,ID_CREDITO,IDENTIFICADOR,F_INICIO, PLAZO, ' +
        'F_VENCIMIENTO,TASA_BASE,SOBRETASA, TASA_FINAL,    '
      '   F_PAGO, IMPORTE, IVA,    '
      '   CASE WHEN IDENTIFICADOR ='#39'INPA'#39'     '
      '         THEN  CASE     '
      
        '      WHEN F_VENCIMIENTO <   TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' ' +
        ')   '
      '     THEN 0    '
      '  END     '
      '   '#9'  ELSE IMP_MORA_IMP-IMP_PAG_MORAS      '
      '   END AS IMP_MORA,    '
      '   CASE WHEN IDENTIFICADOR ='#39'INPA'#39'    '
      '             THEN  CASE    '
      
        '      WHEN F_VENCIMIENTO <   TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' ' +
        ')   '
      '       THEN 0     '
      '   '#9#9#9#9'END     '
      '   '#9#9'  ELSE IMP_IVA_MORA-IVA_PAG_MORAS    '
      '    END AS IMP_IVA_MORA,     '
      
        '   NUM_PERIODO,IMP_MORATORIO, IMP_MORA_IMP,IMP_PAG_MORAS, IMP_IV' +
        'A_MORA_IMP    '
      '    FROM (    '
      '    select CINT.*,    '
      '   '#9#9'CASE  WHEN IMP_PAGADO>0     '
      '   '#9#9' THEN '#39'INPA'#39'     '
      '     '#9#9' ELSE '#39'X'#39'     '
      '   '#9#9'END AS IDENTIFICADOR,    '
      '   '#9#9'IMP_PAGADO AS IMPORTE    '
      '   '#9#9'from (    '
      
        '    SELECT CCRE.ID_CONTRATO,CINT.ID_CREDITO, NUM_PERIODO,CINT.F_' +
        'VENCIMIENTO-PLAZO AS F_INICIO, CINT.F_VENCIMIENTO, PLAZO,    '
      '   '#9#9#9'0 TASA_BASE,    '
      '   '#9#9#9'0 SOBRETASA,    '
      '   '#9#9#9'0 TASA_FINAL,     '
      '   '#9#9#9'Imp_Interes,    '
      
        '   '#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IMPBRU'#39',CINT.ID_CREDITO,N' +
        'UM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39'V' +
        #39') AS Imp_Pagado,    '
      '   '#9#9#9' F_PAGO,     '
      '   '#9#9#9' IMP_IVA AS IVA,     '
      '   '#9#9#9' IMP_MORATORIO,    '
      '   '#9#9#9' IMP_IVA_MORA,    '
      
        '   '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(4,'#39'V'#39',CINT.ID_CREDITO, NUM_PERI' +
        'ODO,NULL,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    +1,NU' +
        'LL) IMP_MORA_IMP,    '
      
        '   '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(4,'#39'F'#39',CINT.ID_CREDITO, NUM_PERI' +
        'ODO,NULL,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    +1,NU' +
        'LL) IMP_IVA_MORA_IMP,    '
      
        '   '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IMPMOR'#39',CINT.ID_CREDITO,' +
        'NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39 +
        'V'#39') AS Imp_Pag_Moras,    '
      
        '   '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IVAMOR'#39',CINT.ID_CREDITO,' +
        'NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39 +
        'V'#39') AS IVA_Pag_Moras    '
      '   '#9#9#9'FROM CR_INTERES CINT, CR_CREDITO CCRE     '
      '   '#9#9#9'WHERE SIT_INTERES <> '#39'CA'#39'    '
      '   '#9#9#9'AND CINT.ID_CREDITO=CCRE.ID_CREDITO    '
      '   '#9#9#9'AND IMP_INTERES<> 0    '
      '   '#9#9#9'   AND CCRE.ID_CREDITO=172483 '
      '   '#9#9#9') CINT    '
      '   UNION'#9#9'    '
      '   select CINTV.*,    '
      
        '   '#9'    CASE WHEN (F_VENCIMIENTO<    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/M' +
        'M/YYYY'#39' )    ) and ( Imp_INTERES>Imp_pagado )     '
      '             THEN '#39'INVD'#39'     '
      '    '#9'    ELSE '#39'X'#39'    '
      '    '#9#9'END AS IDENTIFICADOR,    '
      '   '#9#9'Imp_INTERES-IMP_PAGADO AS IMPORTE    '
      '   '#9#9'from (    '
      
        '    SELECT CCRE.ID_CONTRATO,CINT.ID_CREDITO, NUM_PERIODO,CINT.F_' +
        'VENCIMIENTO-PLAZO AS F_INICIO, CINT.F_VENCIMIENTO, PLAZO,    '
      '   '#9#9#9'0 TASA_BASE,    '
      '   '#9#9#9'0 AS SOBRETASA,    '
      '   '#9#9#9'0 AS TASA_FINAL,     '
      '   '#9#9#9'Imp_Interes,    '
      
        '   '#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IMPBRU'#39',CINT.ID_CREDITO,N' +
        'UM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39'V' +
        #39') AS Imp_Pagado,    '
      '   '#9#9#9' F_PAGO,     '
      '   '#9#9#9' IMP_IVA AS IVA,     '
      '   '#9#9#9' IMP_MORATORIO,    '
      '   '#9#9#9' IMP_IVA_MORA,    '
      
        '   '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(4,'#39'V'#39',CINT.ID_CREDITO, NUM_PERI' +
        'ODO,NULL,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    +1,NU' +
        'LL) IMP_MORA_IMP,    '
      
        '   '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(4,'#39'F'#39',CINT.ID_CREDITO, NUM_PERI' +
        'ODO,NULL,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    +1,NU' +
        'LL) IMP_IVA_MORA_IMP,    '
      
        '   '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IMPMOR'#39',CINT.ID_CREDITO,' +
        'NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39 +
        'V'#39') AS Imp_Pag_Moras,    '
      
        '   '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IVAMOR'#39',CINT.ID_CREDITO,' +
        'NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39 +
        'V'#39') AS IVA_Pag_Moras    '
      '   '#9#9#9'FROM CR_INTERES CINT, CR_CREDITO CCRE     '
      '   '#9#9#9'WHERE SIT_INTERES <> '#39'CA'#39'    '
      '   '#9#9#9'AND CINT.ID_CREDITO=CCRE.ID_CREDITO    '
      '   '#9#9#9'AND IMP_INTERES<> 0    '
      '   '#9#9#9'   AND CCRE.ID_CREDITO=172483 '
      '  ) CINTV'#9'    '
      '   UNION'#9#9'    '
      '   select CINTG.*,    '
      
        '   '#9'    CASE WHEN (F_VENCIMIENTO>=    TO_DATE('#39'01/12/2009'#39' ,'#39'DD/' +
        'MM/YYYY'#39' )    ) and ( Imp_INTERES>Imp_pagado )     '
      '             THEN '#39'INVI'#39'     '
      '     '#9'    ELSE '#39'X'#39'    '
      '    '#9#9'END AS IDENTIFICADOR,    '
      '   '#9#9'Imp_INTERES-IMP_PAGADO AS IMPORTE    '
      '   '#9#9'from (    '
      
        '    SELECT CCRE.ID_CONTRATO,CINT.ID_CREDITO, NUM_PERIODO,CINT.F_' +
        'VENCIMIENTO-PLAZO AS F_INICIO, CINT.F_VENCIMIENTO, PLAZO,    '
      '    '#9#9#9'0 TASA_BASE,    '
      '   '#9#9#9'0 AS SOBRETASA,    '
      '  '#9#9#9'0 AS TASA_FINAL,     '
      '   '#9#9#9'Imp_Interes,    '
      
        '   '#9#9#9'PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IMPBRU'#39',CINT.ID_CREDITO,N' +
        'UM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39'V' +
        #39') AS Imp_Pagado,    '
      '   '#9#9#9' F_PAGO,     '
      '    '#9#9#9' IMP_IVA AS IVA,     '
      '   '#9#9#9' IMP_MORATORIO,    '
      '   '#9#9#9' IMP_IVA_MORA,    '
      
        '   '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(4,'#39'V'#39',CINT.ID_CREDITO, NUM_PERI' +
        'ODO,NULL,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    +1,NU' +
        'LL) IMP_MORA_IMP,    '
      
        '   '#9#9#9' PKGCRPERIODO.FUNOBTENMORA(4,'#39'F'#39',CINT.ID_CREDITO, NUM_PERI' +
        'ODO,NULL,null,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    +1,NU' +
        'LL) IMP_IVA_MORA_IMP,    '
      
        '   '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IMPMOR'#39',CINT.ID_CREDITO,' +
        'NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39 +
        'V'#39') AS Imp_Pag_Moras,    '
      
        '   '#9#9#9' PKGCRCOMUN.STPOBTIMPPAGADO('#39'IN'#39','#39'IVAMOR'#39',CINT.ID_CREDITO,' +
        'NUM_PERIODO,NULL,     TO_DATE('#39'01/12/2009'#39' ,'#39'DD/MM/YYYY'#39' )    ,'#39 +
        'V'#39') AS IVA_Pag_Moras    '
      '   '#9#9#9'FROM CR_INTERES CINT, CR_CREDITO CCRE     '
      '   '#9#9#9'WHERE SIT_INTERES <> '#39'CA'#39'    '
      '   '#9#9#9'AND CINT.ID_CREDITO=CCRE.ID_CREDITO    '
      '   '#9#9#9'AND IMP_INTERES<> 0    '
      '        AND CCRE.ID_CREDITO=172483 '
      '  ) CINTG'#9#9#9#9#9'    '
      '   '#9#9') CCFA    '
      '   WHeRE IDENTIFICADOR <> '#39'X'#39'    '
      '   ) CTOD   '
      ' ) ZZZ,  '
      
        ' ( SELECT   '#9'distinct PKGCRCOMUN.FUNOBTENTASA('#39'CP'#39',CCAP.ID_CREDI' +
        'TO, NUM_PERIODO, CCAP.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE_Ad' +
        ',    '
      '   '#9#9#9#9'SOBRETASA AS SOBRETASA_Ad,    '
      
        '   '#9#9#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'CP'#39',CCAP.ID_CREDITO, NUM_PERIODO' +
        ', CCAP.F_VENCIMIENTO-1 )  AS TASA_FINAL_Ad,'
      
        #9#9#9#9'PKGCRCOMUN.FUNOBTENTASA('#39'CP'#39',CCAP.ID_CREDITO, NUM_PERIODO, C' +
        'CAP.F_VENCIMIENTO-1 )*FACT_MORAS  TASA_MORA_AD      '
      '   '#9#9#9#9'FROM CR_CAPITAL CCAP, CR_CREDITO CCRE     '
      '   '#9#9#9#9'WHERE SIT_CAPITAL <> '#39'CA'#39'    '
      '   '#9#9#9#9'AND CCAP.ID_CREDITO=CCRE.ID_CREDITO    '
      '   '#9#9#9'    AND CCRE.ID_cREDITO=172483    '
      ' ) '
      ' WHERE ESTATUS IN (2,3) '
      
        ' GROUP BY ID_CONTRATO, ID_CREDITO, TO_CHAR(F_INICIO,'#39'YYYY'#39'),tasa' +
        '_base_ad, sobretasa_ad, tasa_final_ad ,  TASA_MORA_AD'
      ' ORDER BY ID_CONTRATO, ID_CREDITO, TO_CHAR(F_INICIO,'#39'YYYY'#39') '
      ' ) U_6 '
      '  ) XXX   '
      
        ' ORDER BY ID_CONTRATO,ESTATUS, CONCEPTO, ID_CREDITO, NUM_PERIODO' +
        '  '
      ' ')
    Left = 53
    Top = 65535
    object qyQueryESTATUS: TFloatField
      FieldName = 'ESTATUS'
    end
    object qyQueryCONCEPTO: TFloatField
      FieldName = 'CONCEPTO'
    end
    object qyQueryF_AUT_COMITE: TDateTimeField
      FieldName = 'F_AUT_COMITE'
    end
    object qyQueryIMP_AUTORIZADO: TFloatField
      FieldName = 'IMP_AUTORIZADO'
      currency = True
    end
    object qyQueryF_VEN_CONT: TDateTimeField
      FieldName = 'F_VEN_CONT'
    end
    object qyQueryCVE_TASA_REFER: TStringField
      FieldName = 'CVE_TASA_REFER'
      Size = 8
    end
    object qyQueryOPERADOR_STASA: TStringField
      FieldName = 'OPERADOR_STASA'
      Size = 1
    end
    object qyQuerySOBRETASACONT: TFloatField
      FieldName = 'SOBRETASACONT'
    end
    object qyQueryFACT_MORAS: TFloatField
      FieldName = 'FACT_MORAS'
    end
    object qyQueryNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qyQueryID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qyQueryID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyQueryIDENTIFICADOR: TStringField
      FieldName = 'IDENTIFICADOR'
      Size = 4
    end
    object qyQueryF_INICIO: TDateTimeField
      FieldName = 'F_INICIO'
    end
    object qyQueryPLAZO: TFloatField
      FieldName = 'PLAZO'
    end
    object qyQueryF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qyQueryTASA_BASE: TFloatField
      FieldName = 'TASA_BASE'
    end
    object qyQuerySOBRETASA: TFloatField
      FieldName = 'SOBRETASA'
    end
    object qyQueryTASA_FINAL: TFloatField
      FieldName = 'TASA_FINAL'
    end
    object qyQueryF_PAGO: TDateTimeField
      FieldName = 'F_PAGO'
    end
    object qyQueryIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object qyQueryIVA: TFloatField
      FieldName = 'IVA'
    end
    object qyQueryIMP_MORA: TFloatField
      FieldName = 'IMP_MORA'
    end
    object qyQueryIMP_IVA_MORA: TFloatField
      FieldName = 'IMP_IVA_MORA'
    end
    object qyQueryNUM_PERIODO: TFloatField
      FieldName = 'NUM_PERIODO'
    end
    object qyQueryIMP_MORATORIO: TFloatField
      FieldName = 'IMP_MORATORIO'
    end
    object qyQueryIMP_MORA_IMP: TFloatField
      FieldName = 'IMP_MORA_IMP'
    end
    object qyQueryIMP_PAG_MORAS: TFloatField
      FieldName = 'IMP_PAG_MORAS'
    end
    object qyQueryIMP_IVA_MORA_IMP: TFloatField
      FieldName = 'IMP_IVA_MORA_IMP'
    end
    object qyQueryCAPITAL: TFloatField
      FieldName = 'CAPITAL'
    end
    object qyQueryFINADIC: TFloatField
      FieldName = 'FINADIC'
    end
    object qyQueryINTERES: TFloatField
      FieldName = 'INTERES'
    end
    object qyQueryCONCEPTOS: TFloatField
      FieldName = 'CONCEPTOS'
    end
    object qyQueryMORATORIOS: TFloatField
      FieldName = 'MORATORIOS'
    end
    object qyQueryIVAS: TFloatField
      FieldName = 'IVAS'
    end
    object qyQueryOTROS: TFloatField
      FieldName = 'OTROS'
    end
    object qyQueryIMP_DEPOSITO: TFloatField
      FieldName = 'IMP_DEPOSITO'
    end
    object qyQueryF_OPERACION: TDateTimeField
      FieldName = 'F_OPERACION'
    end
    object qyQueryANIO: TStringField
      FieldName = 'ANIO'
      Size = 4
    end
    object qyQueryCAPITAL_AD: TFloatField
      FieldName = 'CAPITAL_AD'
    end
    object qyQueryFINADIC_AD: TFloatField
      FieldName = 'FINADIC_AD'
    end
    object qyQueryINTERES_AD: TFloatField
      FieldName = 'INTERES_AD'
    end
    object qyQueryCONCEPTOS_AD: TFloatField
      FieldName = 'CONCEPTOS_AD'
    end
    object qyQueryMORATORIOS_AD: TFloatField
      FieldName = 'MORATORIOS_AD'
    end
    object qyQueryIVAS_AD: TFloatField
      FieldName = 'IVAS_AD'
    end
    object qyQueryTASA_BASE_AD: TFloatField
      FieldName = 'TASA_BASE_AD'
    end
    object qyQuerySOBRETASA_AD: TFloatField
      FieldName = 'SOBRETASA_AD'
    end
    object qyQueryTASA_FINAL_AD: TFloatField
      FieldName = 'TASA_FINAL_AD'
    end
    object qyQueryTASA_MORA_AD: TFloatField
      FieldName = 'TASA_MORA_AD'
    end
    object qyQueryF_INI_PER: TDateTimeField
      FieldName = 'F_INI_PER'
    end
    object qyQueryF_VEN_PER: TDateTimeField
      FieldName = 'F_VEN_PER'
    end
    object qyQueryMONEDA_AD: TFloatField
      FieldName = 'MONEDA_AD'
    end
  end
  object qryConsulta1: TQuery
    DatabaseName = 'DCORP'
    Left = 5
    Top = 65535
  end
end
