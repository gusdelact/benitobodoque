object QrCartBnc: TQrCartBnc
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
  DataSet = qryCartBnc
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
  Units = Native
  Zoom = 100
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
    object QRLabel2: TQRLabel
      Left = 260
      Top = 63
      Width = 156
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        687.916666666667
        166.6875
        412.75)
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
    object QRShape2: TQRShape
      Left = 73
      Top = 97
      Width = 657
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.29166666666667
        193.145833333333
        256.645833333333
        1738.3125)
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 260
      Top = 80
      Width = 77
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        687.916666666667
        211.666666666667
        203.729166666667)
      Alignment = taLeftJustify
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
    object QRLabel5: TQRLabel
      Left = 339
      Top = 80
      Width = 77
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        896.9375
        211.666666666667
        203.729166666667)
      Alignment = taLeftJustify
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
    object QRLFecha: TQRLabel
      Left = 425
      Top = 63
      Width = 239
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1124.47916666667
        166.6875
        632.354166666667)
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
    object QRLabel4: TQRLabel
      Left = 587
      Top = 80
      Width = 77
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1553.10416666667
        211.666666666667
        203.729166666667)
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
      Left = 425
      Top = 80
      Width = 160
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1124.47916666667
        211.666666666667
        423.333333333333)
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
    object QRLabel7: TQRLabel
      Left = 260
      Top = 63
      Width = 156
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        687.916666666667
        166.6875
        412.75)
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
    object QRLabel8: TQRLabel
      Left = 339
      Top = 80
      Width = 77
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        896.9375
        211.666666666667
        203.729166666667)
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
    object QRLabel9: TQRLabel
      Left = 260
      Top = 80
      Width = 77
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        687.916666666667
        211.666666666667
        203.729166666667)
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
    object QRLabel10: TQRLabel
      Left = 668
      Top = 80
      Width = 61
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1767.41666666667
        211.666666666667
        161.395833333333)
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
    object QRLabel11: TQRLabel
      Left = 668
      Top = 63
      Width = 61
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1767.41666666667
        166.6875
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cumple'
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
    object QRLCartas: TQRLabel
      Left = 8
      Top = 8
      Width = 377
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
        997.479166666667)
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
      Left = 392
      Top = 8
      Width = 337
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1037.16666666667
        21.1666666666667
        891.645833333333)
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
    Height = 22
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
      58.2083333333333
      1957.91666666667)
    BandType = rbDetail
    object qrTxtDesc_Grupo: TQRDBText
      Left = 72
      Top = 2
      Width = 185
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        190.5
        5.29166666666667
        489.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCartBnc
      DataField = 'DESC_MERCADO'
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
    object qrTxtImporte: TQRDBText
      Left = 260
      Top = 2
      Width = 77
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        687.916666666667
        5.29166666666667
        203.729166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCartBnc
      DataField = 'PCT_MINIMO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrTxtCumple: TQRDBText
      Left = 668
      Top = 2
      Width = 61
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1767.41666666667
        5.29166666666667
        161.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCartBnc
      DataField = 'B_CUMPLIMIENTO'
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
    object QRDBText2: TQRDBText
      Left = 338
      Top = 2
      Width = 77
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        894.291666666667
        5.29166666666667
        203.729166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCartBnc
      DataField = 'PCT_MAXIMO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText3: TQRDBText
      Left = 426
      Top = 2
      Width = 159
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1127.125
        5.29166666666667
        420.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCartBnc
      DataField = 'IMP_REAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText4: TQRDBText
      Left = 586
      Top = 2
      Width = 77
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1550.45833333333
        5.29166666666667
        203.729166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryCartBnc
      DataField = 'PCT_REAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
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
  end
  object SummaryBand2: TQRBand
    Left = 38
    Top = 247
    Width = 740
    Height = 411
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
      1087.4375
      1957.91666666667)
    BandType = rbSummary
    object QRExpr7: TQRExpr
      Left = 426
      Top = 4
      Width = 159
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1127.125
        10.5833333333333
        420.6875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCartBnc.IMP_REAL)'
      Mask = '###,###,###,###,###.00'
      FontSize = 8
    end
    object QRExpr8: TQRExpr
      Left = 586
      Top = 4
      Width = 77
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1550.45833333333
        10.5833333333333
        203.729166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qryCartBnc.PCT_REAL)'
      Mask = '###,###,###,###,###.00'
      FontSize = 8
    end
    object QRChart1: TQRChart
      Left = 8
      Top = 52
      Width = 721
      Height = 339
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        896.9375
        21.1666666666667
        137.583333333333
        1907.64583333333)
      object QRDBChart1: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Cartera por Banca')
        BottomAxis.LabelStyle = talValue
        LeftAxis.LabelStyle = talValue
        Legend.TextStyle = ltsPlain
        TopAxis.LabelStyle = talValue
        View3DWalls = False
        object Series1: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
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
          YValues.ValueSource = 'PCT_MINIMO'
        end
        object Series3: TLineSeries
          Marks.ArrowLength = 20
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
          YValues.ValueSource = 'PCT_REAL'
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
          YValues.ValueSource = 'PCT_MAXIMO'
        end
      end
    end
    object QRLabel12: TQRLabel
      Left = 73
      Top = 4
      Width = 184
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        193.145833333333
        10.5833333333333
        486.833333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total  '
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
    object QRLeyendaMoneda: TQRLabel
      Left = 72
      Top = 24
      Width = 657
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        190.5
        63.5
        1738.3125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
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
  object qryCartBnc: TQuery
    AfterScroll = qryCartBncAfterScroll
    DatabaseName = 'BCORP'
    SQL.Strings = (
      'Select Cve_Mercado, '
      '       Desc_Mercado,'
      '       Pct_Minimo,'
      '       Pct_Maximo,'
      
        '       Round (Imp_Real / :peFactor)                             ' +
        '                                  Imp_Real,'
      '       Pct_Real,'
      
        '       Case When Pct_Real < Nvl (Pct_Minimo, 0)                 ' +
        '                  Then '#39'NO'#39
      
        '            When Pct_Real Between Nvl (Pct_Minimo, 0) And Nvl (P' +
        'ct_Maximo, 0)     Then '#39'SI'#39
      
        '            When Pct_Real > Nvl (Pct_Maximo, 0)                 ' +
        '                  Then '#39'EXCEDE'#39
      
        '       End                                                      ' +
        '                                  B_Cumplimiento'
      '  From (Select Orden,'
      '               Cve_Mercado,'
      '               Desc_Mercado,'
      '               Pct_Minimo,'
      '               Pct_Maximo,'
      '               Imp_Real,'
      '               Case When Sum (Imp_Real) Over () = 0 Then 0 '
      
        '                    Else Round (Imp_Real / Sum (Imp_Real) Over (' +
        ') * 100)'
      
        '               End                                              ' +
        '               Pct_Real'
      '          From (Select Pct.Orden,'
      '                       Mdo.Cve_Mercado, '
      '                       Mdo.Desc_Mercado, '
      '                       Pct.Pct_Minimo,'
      '                       Pct.Pct_Maximo,'
      
        '                       Nvl (Sum (Sdo.Sdo_Insoluto), 0) + Nvl (Su' +
        'm (Sdo.Imp_Cap_Vig), 0) + Nvl (Sum (Sdo.Imp_Cap_Imp), 0)   Imp_R' +
        'eal'
      '                  From CR_Mercado_Obj Mdo'
      '                  Join (        '
      
        '                        Select 1 Orden, '#39'GOB'#39'  Cve_Mercado,   75' +
        ' Pct_Minimo,   85 Pct_Maximo From Dual Union  '
      
        '                        Select 2 Orden, '#39'INFR'#39' Cve_Mercado,   17' +
        ' Pct_Minimo,   25 Pct_Maximo From Dual Union'
      
        '                        Select 3 Orden, '#39'DESC'#39' Cve_Mercado,  7.5' +
        ' Pct_Minimo,   15 Pct_Maximo From Dual Union'
      
        '                        Select 4 Orden, '#39'AGR'#39'  Cve_Mercado,   16' +
        ' Pct_Minimo,   22 Pct_Maximo From Dual Union'
      
        '                        Select 5 Orden, '#39'OTR'#39'  Cve_Mercado,    2' +
        ' Pct_Minimo,    4 Pct_Maximo From Dual Union  '
      
        '                        Select 6 Orden, '#39'HIP'#39'  Cve_Mercado, Null' +
        ' Pct_Minimo, Null Pct_Maximo From Dual Union  '
      
        '                        Select 7 Orden, '#39'CON'#39'  Cve_Mercado, Null' +
        ' Pct_Minimo, Null Pct_Maximo From Dual Union  '
      
        '                        Select 8 Orden, '#39'BEN'#39'  Cve_Mercado, Null' +
        ' Pct_Minimo, Null Pct_Maximo From Dual'
      
        '                       )              Pct On Pct.Cve_Mercado = M' +
        'do.Cve_Mercado'
      
        '                  Left Outer Join Table (PkgCrGPViews.VW_CR_GP_S' +
        'aldos_Edos_Mun (:peFecha, :peTipo_Entidad)) Sdo On Mdo.Cve_Merca' +
        'do = Sdo.Cve_Mercado'
      
        '                 Group By Pct.Orden, Mdo.Cve_Mercado, Mdo.Desc_M' +
        'ercado, Pct.Pct_Minimo, Pct_Maximo'
      '               )'
      '         Order By Orden             '
      '       )'
      '')
    Left = 416
    Top = 145
    ParamData = <
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
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
    object qryCartBncCVE_MERCADO: TStringField
      FieldName = 'CVE_MERCADO'
      Size = 12
    end
    object qryCartBncDESC_MERCADO: TStringField
      FieldName = 'DESC_MERCADO'
      Size = 100
    end
    object qryCartBncPCT_MINIMO: TFloatField
      FieldName = 'PCT_MINIMO'
    end
    object qryCartBncPCT_MAXIMO: TFloatField
      FieldName = 'PCT_MAXIMO'
    end
    object qryCartBncIMP_REAL: TFloatField
      FieldName = 'IMP_REAL'
    end
    object qryCartBncPCT_REAL: TFloatField
      FieldName = 'PCT_REAL'
    end
    object qryCartBncB_CUMPLIMIENTO: TStringField
      FieldName = 'B_CUMPLIMIENTO'
      FixedChar = True
      Size = 2
    end
  end
  object QLeyendaEntidades: TQuery
    SQL.Strings = (
      
        'Select '#39'Incluye información: '#39' || InitCap (Replace (Replace (Nvl' +
        ' (:peTipo_Entidad, PkgCRGPViews.Todas_Entidades), '#39'ORG-DESC'#39', '#39'Ó' +
        'rganos descentralizados'#39'), '#39'|'#39', '#39', '#39')) Leyenda_Entidades'
      '  From Dual             ')
    Left = 446
    Top = 146
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
  end
end
