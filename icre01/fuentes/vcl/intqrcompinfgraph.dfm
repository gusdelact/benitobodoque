object QrCompInfGraph: TQrCompInfGraph
  Left = 0
  Top = -121
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
  object SummaryBand1: TQRBand
    Left = 38
    Top = 122
    Width = 980
    Height = 595
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
      1574.27083333333
      2592.91666666667)
    BandType = rbSummary
    object QRLeyendaMoneda: TQRLabel
      Left = 3
      Top = 567
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
        1500.1875
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
    object QRChart1: TQRChart
      Left = 0
      Top = 16
      Width = 977
      Height = 251
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        664.104166666667
        0
        42.3333333333333
        2584.97916666667)
      object QRDBChart1: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Infraestructura y construcción'
          'Por subsector')
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
        object Series3: TLineSeries
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
        object Series4: TBarSeries
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
        object Series5: TBarSeries
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
        object Series6: TLineSeries
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
    object QRChart2: TQRChart
      Left = 0
      Top = 277
      Width = 977
      Height = 251
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        664.104166666667
        0
        732.895833333333
        2584.97916666667)
      object QRDBChart2: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Infraestructura y construcción'
          'Por fuente de pago')
        object Series7: TBarSeries
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
        object Series8: TBarSeries
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
        object Series9: TLineSeries
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
        object Series10: TBarSeries
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
        object Series11: TBarSeries
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
        object Series12: TLineSeries
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
end
