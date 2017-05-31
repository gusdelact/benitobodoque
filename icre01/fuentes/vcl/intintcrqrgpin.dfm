object QIntCrGpIn: TQIntCrGpIn
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
  object DetailBand1: TQRBand
    Left = 38
    Top = 209
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
    BandType = rbDetail
    object QRDBTipo: TQRDBText
      Left = 8
      Top = 0
      Width = 113
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        21.1666666666667
        0
        298.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clBlack
      DataSet = QDatos
      DataField = 'Tipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBText2: TQRDBText
      Left = 124
      Top = 0
      Width = 213
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        328.083333333333
        0
        563.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Descripcion'
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
    object QRDBText1: TQRDBText
      Left = 338
      Top = 0
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.9791666666667
        894.291666666667
        0
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Pct_Minimo'
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
    object QRDBText3: TQRDBText
      Left = 405
      Top = 0
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.9791666666667
        1071.5625
        0
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
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBText4: TQRDBText
      Left = 573
      Top = 0
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.9791666666667
        1516.0625
        0
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Pct_Real'
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
    object QRDBText5: TQRDBText
      Left = 640
      Top = 0
      Width = 89
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.9791666666667
        1693.33333333333
        0
        235.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Cumplimiento'
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
    object QRDBText6: TQRDBText
      Left = 473
      Top = 0
      Width = 98
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.9791666666667
        1251.47916666667
        0
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Imp_Real'
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
  end
  object QRBand1: TQRBand
    Left = 38
    Top = 122
    Width = 740
    Height = 79
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
      209.020833333333
      1957.91666666667)
    BandType = rbTitle
    object QRLabel1: TQRLabel
      Left = 338
      Top = 40
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        894.291666666667
        105.833333333333
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Mínimo'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel2: TQRLabel
      Left = 338
      Top = 57
      Width = 132
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        894.291666666667
        150.8125
        349.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel3: TQRLabel
      Left = 405
      Top = 40
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1071.5625
        105.833333333333
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Máximo'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel5: TQRLabel
      Left = 573
      Top = 57
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1516.0625
        150.8125
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel6: TQRLabel
      Left = 640
      Top = 57
      Width = 89
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1693.33333333333
        150.8125
        235.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cumplimiento'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel7: TQRLabel
      Left = 640
      Top = 40
      Width = 89
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1693.33333333333
        105.833333333333
        235.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
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
    object QRLabel12: TQRLabel
      Left = 473
      Top = 40
      Width = 165
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1251.47916666667
        105.833333333333
        436.5625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Real'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel13: TQRLabel
      Left = 473
      Top = 57
      Width = 98
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1251.47916666667
        150.8125
        259.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '$'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
  end
  object QRBand2: TQRBand
    Left = 38
    Top = 233
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
    BandType = rbGroupFooter
    object QRLabel8: TQRLabel
      Left = 124
      Top = 0
      Width = 213
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        328.083333333333
        0
        563.5625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRExpr3: TQRExpr
      Left = 573
      Top = 0
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1516.0625
        0
        171.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'Sum(QDatos.Pct_Real)'
      Mask = '###,###,###,###,###.00'
      FontSize = 9
    end
    object QRLabel9: TQRLabel
      Left = 640
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
        1693.33333333333
        0
        235.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel10: TQRLabel
      Left = 338
      Top = 0
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        894.291666666667
        0
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel11: TQRLabel
      Left = 405
      Top = 0
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1071.5625
        0
        171.979166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRExpr1: TQRExpr
      Left = 473
      Top = 0
      Width = 98
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1251.47916666667
        0
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'Sum(QDatos.Imp_Real)'
      Mask = '###,###,###,###,###.00'
      FontSize = 9
    end
  end
  object QRGroup1: TQRGroup
    Left = 38
    Top = 201
    Width = 740
    Height = 8
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
      21.1666666666667
      1957.91666666667)
    Expression = 'ID_TIPO'
    FooterBand = QRBand2
    Master = Owner
    ReprintOnNewPage = False
  end
  object SummaryBand1: TQRBand
    Left = 38
    Top = 257
    Width = 740
    Height = 434
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
      1148.29166666667
      1957.91666666667)
    BandType = rbSummary
    object QRChart1: TQRChart
      Left = 0
      Top = 20
      Width = 345
      Height = 369
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        976.3125
        0
        52.9166666666667
        912.8125)
      object QRDBChart1: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Infraestructura y Construcción'
          'Por subsector')
        Legend.Visible = False
        object Series1: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Pct. Mínimo'
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
          Title = 'Pct. Máximo'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object Series3: TLineSeries
          Marks.ArrowLength = 8
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clYellow
          Title = 'Pct. Real'
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
    object QRChart2: TQRChart
      Left = 344
      Top = 20
      Width = 398
      Height = 369
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        976.3125
        910.166666666667
        52.9166666666667
        1053.04166666667)
      object QRDBChart2: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Infraestructura y Construcción'
          'Por fuente de pago')
        object Series4: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Pct. Mínimo'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object Series5: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Pct. Máximo'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
        object Series6: TLineSeries
          Marks.ArrowLength = 8
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clYellow
          Title = 'Pct. Real'
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
      'Select ID_Tipo,'
      
        '       Case When Renglon = 1 Then Tipo Else Null End            ' +
        '  Tipo,'
      '       Clave,'
      '       Descripcion,'
      
        '       Nvl (Pct_Minimo,   0)                                    ' +
        '  Pct_Minimo,'
      
        '       Nvl (Pct_Maximo,   0)                                    ' +
        '  Pct_Maximo,'
      
        '       Nvl (Pct_Real,     0)                                    ' +
        '  Pct_Real,'
      
        '       Nvl (Cumplimiento, '#39'X'#39')                                  ' +
        '  Cumplimiento'
      '  From (Select Tipo, '
      '               ID_Tipo, '
      '               Clave,'
      
        '               Row_Number () Over (Partition By ID_Tipo Order By' +
        ' Clave)    Renglon, '
      '               Descripcion, '
      '               Pct_Minimo, '
      '               Pct_Maximo, '
      '               Pct_Real, '
      '               Cumplimiento'
      '          From ('
      
        '                Select 1                                        ' +
        '                                                         ID_Tipo' +
        ','
      
        '                       '#39'Por Subsector'#39'                          ' +
        '                                                         Tipo,'
      
        '                       Imp.ID_Sub_Mercado                       ' +
        '                                                         Clave,'
      
        '                       Imp.Desc_Sub_Mercado                     ' +
        '                                                         Descrip' +
        'cion,'
      '                       Imp.Saldo,'
      
        '                       Nvl (Pct.Pct_Minimo, 0)                  ' +
        '                                                         Pct_Min' +
        'imo,'
      
        '                       Nvl (Pct.Pct_Maximo, 0)                  ' +
        '                                                         Pct_Max' +
        'imo,'
      
        '                       Imp.Pct                                  ' +
        '                                                         Pct_Rea' +
        'l,'
      
        '                       Case When Imp.Pct < Nvl (Pct.Pct_Minimo, ' +
        '0)                                   Then '#39'NO'#39
      
        '                            When Imp.Pct Between Nvl (Pct.Pct_Mi' +
        'nimo, 0) And Nvl (Pct.Pct_Maximo, 0) Then '#39'SI'#39
      
        '                            When Imp.Pct > Nvl (Pct.Pct_Maximo, ' +
        '0)                                   Then '#39'EXCEDE'#39
      
        '                       End                                      ' +
        '                                                         Cumplim' +
        'iento'
      '                  From (Select ID_Sub_Mercado,'
      '                               Desc_Sub_Mercado,'
      '                               Saldo,'
      
        '                               Case When Nvl (Sum (Saldo) Over (' +
        '), 0) = 0 Then 0'
      
        '                                    Else Round (Saldo / Sum (Sal' +
        'do) Over () * 100)'
      
        '                               End                              ' +
        '                                                         Pct'
      
        '                          From (Select Case When MD.ID_Sub_Merc ' +
        '= 8 Then 7 '
      '                                            Else MD.ID_Sub_Merc'
      
        '                                       End                      ' +
        '                                                                ' +
        '           ID_Sub_Mercado,'
      
        '                                       Case When MD.ID_Sub_Merc ' +
        'In (7, 8) Then '#39'VIVIENDA/OTROS'#39
      
        '                                            Else MD.Desc_Sub_Mer' +
        'c'
      
        '                                       End                      ' +
        '                                                                ' +
        '           Desc_Sub_Mercado, '
      
        '                                       Nvl (Sum (Sdo.Sdo_Insolut' +
        'o), 0) + Nvl (Sum (Sdo.Imp_Cap_Vig), 0) + Nvl (Sum (Sdo.Imp_Cap_' +
        'Imp), 0)   Saldo'
      
        '                                  From CR_Mercado_Obj_Det       ' +
        '                                                           MD   ' +
        '             '
      
        '                                  Left Outer Join Table (PkgCrGP' +
        'Views.VW_CR_GP_Saldos_Edos_Mun (:peFecha, :peTipo_Entidad)) Sdo ' +
        'On MD.Cve_Mercado = Sdo.Cve_Mercado And'
      
        '                                                                ' +
        '                                                                ' +
        '   MD.ID_Sub_Merc = Sdo.ID_Sub_Merc '
      '                                 Where MD.Cve_Mercado = '#39'INFR'#39
      
        '                                 Group By Case When MD.ID_Sub_Me' +
        'rc = 8 Then 7 '
      '                                            Else MD.ID_Sub_Merc'
      '                                          End, '
      
        '                                          Case When MD.ID_Sub_Me' +
        'rc In (7, 8) Then '#39'VIVIENDA/OTROS'#39
      
        '                                            Else MD.Desc_Sub_Mer' +
        'c'
      '                                          End '
      '                               )'
      '                         Order By ID_Sub_Mercado       '
      '                       ) Imp'
      
        '                  Join (Select 1 ID_Sub_Merc,   16 Pct_Minimo,  ' +
        ' 22 Pct_Maximo From Dual Union  '
      
        '                        Select 2 ID_Sub_Merc,   16 Pct_Minimo,  ' +
        ' 22 Pct_Maximo From Dual Union  '
      
        '                        Select 3 ID_Sub_Merc,    2 Pct_Minimo,  ' +
        '  7 Pct_Maximo From Dual Union  '
      
        '                        Select 4 ID_Sub_Merc,   28 Pct_Minimo,  ' +
        ' 34 Pct_Maximo From Dual Union  '
      
        '                        Select 5 ID_Sub_Merc, Null Pct_Minimo, N' +
        'ull Pct_Maximo From Dual Union  '
      
        '                        Select 6 ID_Sub_Merc, Null Pct_Minimo, N' +
        'ull Pct_Maximo From Dual Union  '
      
        '                        Select 7 ID_Sub_Merc,   23 Pct_Minimo,  ' +
        ' 29 Pct_Maximo From Dual'
      
        '                       ) Pct On Imp.ID_Sub_Mercado = Pct.ID_Sub_' +
        'Merc'
      '                Union       '
      
        '                Select 2                                        ' +
        '                                                         ID_Tipo' +
        ','
      
        '                       '#39'Por fuente de pago'#39'                     ' +
        '                                                         Tipo,'
      '                       Clave,'
      '                       Descripcion,'
      '                       Saldo,'
      '                       Pct_Minimo,'
      '                       Pct_Maximo,'
      
        '                       Pct                                      ' +
        '                                                         Pct_Rea' +
        'l,'
      
        '                       Case When Pct < Nvl (Pct_Minimo, 0)      ' +
        '                         Then '#39'NO'#39
      
        '                            When Pct Between Nvl (Pct_Minimo, 0)' +
        ' And Nvl (Pct_Maximo, 0) Then '#39'SI'#39
      
        '                            When Pct > Nvl (Pct_Maximo, 0)      ' +
        '                         Then '#39'EXCEDE'#39
      
        '                       End                                      ' +
        '                                                         Cumplim' +
        'iento'
      '                  From ('
      
        '                        Select Orden                            ' +
        '    Clave,'
      
        '                               Desc_Fuente_Pago                 ' +
        '    Descripcion,'
      '                               Saldo,'
      
        '                               Nvl (Pct_Minimo, 0)              ' +
        '    Pct_Minimo,'
      
        '                               Nvl (Pct_Maximo, 0)              ' +
        '    Pct_Maximo,'
      
        '                               Case When Nvl (Sum (Saldo) Over (' +
        '), 0) = 0 Then 0'
      
        '                                    Else Round (Saldo / Sum (Sal' +
        'do) Over () * 100)'
      
        '                               End                              ' +
        '                      Pct'
      '                          From ('
      '                                Select FP.Cve_Fuente_Pago, '
      '                                       FP.Orden, '
      '                                       FP.Desc_Fuente_Pago,'
      '                                       FP.Pct_Minimo,'
      '                                       FP.Pct_Maximo, '
      
        '                                       Nvl (Sum (Sdo.Sdo_Insolut' +
        'o), 0) + Nvl (Sum (Sdo.Imp_Cap_Vig), 0) + Nvl (Sum (Sdo.Imp_Cap_' +
        'Imp), 0)   Saldo'
      '                                  From ('
      
        '                                        Select '#39'01'#39' Cve_Fuente_P' +
        'ago,  3 Orden, '#39'PPS'#39'                Desc_Fuente_Pago,   30 Pct_M' +
        'inimo,   36 Pct_Maximo From Dual Union  --02'
      
        '                                        Select '#39'04'#39' Cve_Fuente_P' +
        'ago,  5 Orden, '#39'NO APLICA'#39'          Desc_Fuente_Pago, Null Pct_M' +
        'inimo, Null Pct_Maximo From Dual Union  --No'
      
        '                                        Select '#39'05'#39' Cve_Fuente_P' +
        'ago,  4 Orden, '#39'OTROS'#39'              Desc_Fuente_Pago,    0 Pct_M' +
        'inimo,    6 Pct_Maximo From Dual Union  --04'
      
        '                                        Select '#39'02'#39' Cve_Fuente_P' +
        'ago,  1 Orden, '#39'CESIÓN DE DERECHOS'#39' Desc_Fuente_Pago,   26 Pct_M' +
        'inimo,   32 Pct_Maximo From Dual Union  --05'
      
        '                                        Select '#39'03'#39' Cve_Fuente_P' +
        'ago,  2 Orden, '#39'FLUJO PROYECTO'#39'     Desc_Fuente_Pago,   20 Pct_M' +
        'inimo,   26 Pct_Maximo From Dual        --06'
      '                                       ) FP'
      
        '                                  Left Outer Join Table (PkgCrGP' +
        'Views.VW_CR_GP_Saldos_Edos_Mun (:peFecha, :peTipo_Entidad)) Sdo ' +
        'On FP.Cve_Fuente_Pago = Sdo.Cve_Fuente_Pago And'
      
        '                                                                ' +
        '                                                                ' +
        '   Sdo.Cve_Mercado    = '#39'INFR'#39
      
        '                                 Group By FP.Cve_Fuente_Pago, FP' +
        '.Orden, FP.Desc_Fuente_Pago, FP.Pct_Minimo, FP.Pct_Maximo       ' +
        '                                                                ' +
        '                                    '
      '                               )         '
      '                       )       '
      '               )'
      '         Order By ID_Tipo, Clave        '
      '       )')
    Left = 160
    Top = 96
    ParamData = <
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
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
    object QDatosID_Tipo: TFloatField
      FieldName = 'ID_Tipo'
      Visible = False
    end
    object QDatosTipo: TStringField
      DisplayLabel = 'Organizado por'
      DisplayWidth = 20
      FieldName = 'Tipo'
      Size = 200
    end
    object QDatosClave: TFloatField
      FieldName = 'Clave'
      Visible = False
    end
    object QDatosDescripcion: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 30
      FieldName = 'Descripcion'
      Size = 200
    end
    object QDatosPct_Minimo: TFloatField
      DisplayLabel = '% Mínimo'
      FieldName = 'Pct_Minimo'
    end
    object QDatosPct_Maximo: TFloatField
      DisplayLabel = '% Máximo'
      FieldName = 'Pct_Maximo'
    end
    object QDatosPct_Real: TFloatField
      DisplayLabel = '% Real'
      FieldName = 'Pct_Real'
    end
    object QDatosCumplimiento: TStringField
      DisplayWidth = 12
      FieldName = 'Cumplimiento'
      Size = 10
    end
  end
end
