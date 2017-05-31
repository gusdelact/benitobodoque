object QrConsImpa: TQrConsImpa
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qyConsImpa
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
  object QRBand1: TQRBand
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
    Height = 25
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
      66.1458333333333
      2592.91666666667)
    BandType = rbColumnHeader
    object QRShape32: TQRShape
      Left = 923
      Top = 0
      Width = 29
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        2442.10416666667
        0
        76.7291666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape26: TQRShape
      Left = 839
      Top = 0
      Width = 60
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        2219.85416666667
        0
        158.75)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape27: TQRShape
      Left = 272
      Top = 0
      Width = 45
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        719.666666666667
        0
        119.0625)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape14: TQRShape
      Left = 241
      Top = 0
      Width = 32
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        637.645833333333
        0
        84.6666666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape25: TQRShape
      Left = 422
      Top = 0
      Width = 53
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1116.54166666667
        0
        140.229166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape24: TQRShape
      Left = 368
      Top = 0
      Width = 55
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        973.666666666667
        0
        145.520833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape22: TQRShape
      Left = 781
      Top = 0
      Width = 59
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        2066.39583333333
        0
        156.104166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape1: TQRShape
      Left = 0
      Top = 0
      Width = 116
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        0
        0
        306.916666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape2: TQRShape
      Left = 115
      Top = 0
      Width = 89
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        304.270833333333
        0
        235.479166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape3: TQRShape
      Left = 203
      Top = 0
      Width = 39
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        537.104166666667
        0
        103.1875)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape4: TQRShape
      Left = 530
      Top = 0
      Width = 53
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1402.29166666667
        0
        140.229166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape5: TQRShape
      Left = 582
      Top = 0
      Width = 53
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1539.875
        0
        140.229166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape6: TQRShape
      Left = 634
      Top = 0
      Width = 42
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1677.45833333333
        0
        111.125)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape7: TQRShape
      Left = 723
      Top = 0
      Width = 59
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1912.9375
        0
        156.104166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape8: TQRShape
      Left = 898
      Top = 0
      Width = 26
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        2375.95833333333
        0
        68.7916666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabelNOMBRE: TQRLabel
      Left = 19
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
        50.2708333333333
        2.64583333333333
        193.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Acreditado / Emisor'
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
    object QRLabelNOM_PROVEEDOR: TQRLabel
      Left = 142
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
        375.708333333333
        2.64583333333333
        111.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Proveedor '
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
    object QRLabelID_CREDITO: TQRLabel
      Left = 242
      Top = 1
      Width = 30
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        640.291666666667
        2.64583333333333
        79.375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Credito    '
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
    object QRLabelIMP_FEGA: TQRLabel
      Left = 726
      Top = 1
      Width = 53
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        1920.875
        2.64583333333333
        140.229166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Garantía Aplicada'
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
    object QRLabelIMP_BINTER: TQRLabel
      Left = 783
      Top = 1
      Width = 53
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        2071.6875
        2.64583333333333
        140.229166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe   Binter'
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
    object QRLabelDIASIMVE: TQRLabel
      Left = 901
      Top = 1
      Width = 22
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2383.89583333333
        2.64583333333333
        58.2083333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Dias Imp.'
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
    object QRLabelF_PROG_PAGO: TQRLabel
      Left = 275
      Top = 1
      Width = 37
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        727.604166666667
        2.64583333333333
        97.8958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha Vento.'
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
    object QRShape23: TQRShape
      Left = 315
      Top = 0
      Width = 54
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        833.4375
        0
        142.875)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 204
      Top = 1
      Width = 37
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        539.75
        2.64583333333333
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
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
    object QRLabel8: TQRLabel
      Left = 842
      Top = 1
      Width = 51
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        2227.79166666667
        2.64583333333333
        134.9375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '      Importe      Total'
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
    object QRLabel9: TQRLabel
      Left = 534
      Top = 1
      Width = 45
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1412.875
        2.64583333333333
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Interés'
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
    object QRLabel10: TQRLabel
      Left = 369
      Top = 1
      Width = 50
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        976.3125
        2.64583333333333
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Saldo Insoluto'
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
    object QRLabel11: TQRLabel
      Left = 317
      Top = 1
      Width = 50
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        838.729166666667
        2.64583333333333
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe del Crédito'
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
    object QRLabelIMPORTE: TQRLabel
      Left = 583
      Top = 1
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1542.52083333333
        2.64583333333333
        132.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Comisiones'
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
    object QRShape28: TQRShape
      Left = 675
      Top = 0
      Width = 49
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1785.9375
        0
        129.645833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel12: TQRLabel
      Left = 676
      Top = 1
      Width = 47
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1788.58333333333
        2.64583333333333
        124.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Moratorios'
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
    object QRLabel13: TQRLabel
      Left = 637
      Top = 1
      Width = 35
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1685.39583333333
        2.64583333333333
        92.6041666666667)
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
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel14: TQRLabel
      Left = 428
      Top = 1
      Width = 40
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1132.41666666667
        2.64583333333333
        105.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Capital'
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
    object QRShape31: TQRShape
      Left = 474
      Top = 0
      Width = 57
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1254.125
        0
        150.8125)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel7: TQRLabel
      Left = 479
      Top = 2
      Width = 47
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1267.35416666667
        5.29166666666667
        124.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Finan. Adicional'
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
    object QRLabel15: TQRLabel
      Left = 925
      Top = 1
      Width = 25
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2447.39583333333
        2.64583333333333
        66.1458333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'En RECU'
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
    object QRShape37: TQRShape
      Left = 950
      Top = 0
      Width = 29
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        2513.54166666667
        0
        76.7291666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel16: TQRLabel
      Left = 953
      Top = 1
      Width = 25
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        2521.47916666667
        2.64583333333333
        66.1458333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha RECU'
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
  object QRBandDetalle: TQRBand
    Left = 38
    Top = 224
    Width = 980
    Height = 10
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBandDetalleBeforePrint
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      26.4583333333333
      2592.91666666667)
    BandType = rbDetail
    object QRDBNOM_PROVEEDOR: TQRDBText
      Left = 117
      Top = -2
      Width = 84
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        309.5625
        -5.29166666666667
        222.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'NOM_PROVEEDOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 5
    end
    object QRDBID_CREDITO: TQRDBText
      Left = 240
      Top = -1
      Width = 33
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        635
        -2.64583333333333
        87.3125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'ID_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBIMP_FEGA: TQRDBText
      Left = 723
      Top = -1
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1912.9375
        -2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'IMP_FEGA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBIMP_BINTER: TQRDBText
      Left = 633
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
        1674.8125
        -2.64583333333333
        111.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'IMP_IVA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBDIASIMVE: TQRDBText
      Left = 903
      Top = -1
      Width = 19
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2389.1875
        -2.64583333333333
        50.2708333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'DIASIMVE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText1: TQRDBText
      Left = 275
      Top = -1
      Width = 37
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        727.604166666667
        -2.64583333333333
        97.8958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'F_VENCIMIENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = 'DD/MM/YYYY'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDB_CVE_PRODUCTO_CRE: TQRDBText
      Left = 205
      Top = -1
      Width = 32
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        542.395833333333
        -2.64583333333333
        84.6666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'CVE_PRODUCTO_CRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText3: TQRDBText
      Left = 530
      Top = -1
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1402.29166666667
        -2.64583333333333
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'IMP_INTERES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText4: TQRDBText
      Left = 584
      Top = -1
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1545.16666666667
        -2.64583333333333
        127)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'IMP_COMISIONES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText5: TQRDBText
      Left = 368
      Top = -1
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        973.666666666667
        -2.64583333333333
        132.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'SDO_VIG_TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText6: TQRDBText
      Left = 315
      Top = -1
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        833.4375
        -2.64583333333333
        132.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'IMP_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText7: TQRDBText
      Left = 782
      Top = -1
      Width = 58
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2069.04166666667
        -2.64583333333333
        153.458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'IMP_BINTER'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText8: TQRDBText
      Left = 676
      Top = -1
      Width = 46
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1788.58333333333
        -2.64583333333333
        121.708333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'MORATORIOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRExpr1: TQRExpr
      Left = 420
      Top = 0
      Width = 53
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        1111.25
        0
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'qyConsImpa.IMP_CAPITAL'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr2: TQRExpr
      Left = 842
      Top = 0
      Width = 60
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        2227.79166666667
        0
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 
        'qyConsImpa.IMP_CAPITAL + qyConsImpa.IMP_FA + qyConsImpa.IMP_INTE' +
        'RES + qyConsImpa.IMP_COMISIONES + qyConsImpa.IMP_IVA + qyConsImp' +
        'a.MORATORIOS'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr4: TQRExpr
      Left = 474
      Top = 0
      Width = 55
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        1254.125
        0
        145.520833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'qyConsImpa.IMP_FA'
      Mask = '###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr72: TQRExpr
      Left = 0
      Top = -2
      Width = 113
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        0
        -5.29166666666667
        298.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'qyConsImpa.NOMBRE'
      FontSize = 5
    end
    object QRDBText2: TQRDBText
      Left = 923
      Top = -1
      Width = 19
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2442.10416666667
        -2.64583333333333
        50.2708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'STATUS_RECU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText11: TQRDBText
      Left = 943
      Top = -1
      Width = 37
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2495.02083333333
        -2.64583333333333
        97.8958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'F_ALTA_RECU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = 'DD/MM/YYYY'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
  end
  object QRGroupDireccion: TQRGroup
    Left = 38
    Top = 147
    Width = 980
    Height = 17
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupDireccionBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      44.9791666666667
      2592.91666666667)
    Expression = 'qyConsImpa.NOM_DRCN'
    FooterBand = QRFooterDireccion
    Master = Owner
    ReprintOnNewPage = False
    object QRLabelNOM_DRCN: TQRLabel
      Left = 18
      Top = 1
      Width = 58
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        47.625
        2.64583333333333
        153.458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Dirección :'
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
    object QRDBNOM_DRCN: TQRDBText
      Left = 80
      Top = 1
      Width = 393
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        211.666666666667
        2.64583333333333
        1039.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'NOM_DRCN'
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
    object QRLabelNOM_DRTR: TQRLabel
      Left = 488
      Top = 1
      Width = 54
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1291.16666666667
        2.64583333333333
        142.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Director : '
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
    object QRDBNOM_DRTR: TQRDBText
      Left = 550
      Top = 1
      Width = 393
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1455.20833333333
        2.64583333333333
        1039.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'NOM_DRTR'
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
  object QRGroupRegion: TQRGroup
    Left = 38
    Top = 164
    Width = 980
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupRegionBeforePrint
    Color = clWhite
    Enabled = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      39.6875
      2592.91666666667)
    Expression = 'qyConsImpa.NOM_DRCN'
    FooterBand = QRFooterRegion
    Master = Owner
    ReprintOnNewPage = False
    object QRShape11: TQRShape
      Left = 33
      Top = 1
      Width = 768
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        87.3125
        2.64583333333333
        2032)
      Shape = qrsRectangle
    end
    object QRLabelREGION: TQRLabel
      Left = 39
      Top = 2
      Width = 35
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        103.1875
        5.29166666666667
        92.6041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Región  :'
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
    object QRDBESTADO: TQRDBText
      Left = 87
      Top = 2
      Width = 100
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        230.1875
        5.29166666666667
        264.583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
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
    object QRDBDESC_POBLACION: TQRDBText
      Left = 199
      Top = 2
      Width = 555
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        526.520833333333
        5.29166666666667
        1468.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'DESC_POBLACION'
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
  object QRGroupMoneda: TQRGroup
    Left = 38
    Top = 179
    Width = 980
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupMonedaBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      39.6875
      2592.91666666667)
    Expression = 'qyConsImpa.CVE_MONEDA'
    FooterBand = QRFooterMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRShape12: TQRShape
      Left = 64
      Top = -12
      Width = 380
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.1458333333333
        169.333333333333
        -31.75
        1005.41666666667)
      Shape = qrsHorLine
    end
    object QRLabelMoneda: TQRLabel
      Left = 68
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
        179.916666666667
        5.29166666666667
        95.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda :'
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
    object QRDBCVE_MONEDA: TQRDBText
      Left = 106
      Top = 2
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        280.458333333333
        5.29166666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'CVE_MONEDA'
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
    object QRDBDESC_MONEDA: TQRDBText
      Left = 158
      Top = 2
      Width = 275
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        418.041666666667
        5.29166666666667
        727.604166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'DESC_MONEDA'
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
  object QRGroupPromAsoc: TQRGroup
    Left = 38
    Top = 194
    Width = 980
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupPromAsocBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      39.6875
      2592.91666666667)
    Expression = 'qyConsImpa.ID_PERS_ASOCIAD'
    FooterBand = QRFooterPromAsoc
    Master = Owner
    ReprintOnNewPage = False
    object QRShape20: TQRShape
      Left = 96
      Top = 1
      Width = 768
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        254
        2.64583333333333
        2032)
      Shape = qrsRectangle
    end
    object QRLabelPromAsoc: TQRLabel
      Left = 104
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
        275.166666666667
        5.29166666666667
        214.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Promotor Asociado :'
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
    object QRDBID_PERS_ASOCIAD: TQRDBText
      Left = 187
      Top = 2
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        494.770833333333
        5.29166666666667
        127)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
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
    object QRDBNOM_PROMOTOR_ASO: TQRDBText
      Left = 238
      Top = 2
      Width = 555
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        629.708333333333
        5.29166666666667
        1468.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
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
  end
  object QRGroupPromAdm: TQRGroup
    Left = 38
    Top = 209
    Width = 980
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupPromAdmBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      39.6875
      2592.91666666667)
    Expression = 'qyConsImpa.ID_PROM_ADM'
    FooterBand = QRFooterPromAdm
    Master = Owner
    ReprintOnNewPage = False
    object QRShape21: TQRShape
      Left = 144
      Top = 1
      Width = 768
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        381
        2.64583333333333
        2032)
      Shape = qrsRectangle
    end
    object QRLabelPromAdm: TQRLabel
      Left = 152
      Top = 2
      Width = 97
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        402.166666666667
        5.29166666666667
        256.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Promotor Administrador :'
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
    object QRDBID_PROM_ADM: TQRDBText
      Left = 251
      Top = 2
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        664.104166666667
        5.29166666666667
        127)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
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
    object QRDBNOM_PROMOTOR_ADM: TQRDBText
      Left = 302
      Top = 2
      Width = 563
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        799.041666666667
        5.29166666666667
        1489.60416666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
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
  end
  object QRGNombre: TQRGroup
    Left = 38
    Top = 224
    Width = 980
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
      2592.91666666667)
    Expression = ' qyConsImpa.NOMBRE  +  qyConsImpa.NOM_PROVEEDOR'
    FooterBand = QRBNombre
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRFooterPromAdm: TQRBand
    Left = 38
    Top = 244
    Width = 980
    Height = 17
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
      44.9791666666667
      2592.91666666667)
    BandType = rbGroupFooter
    object QRLabel2: TQRLabel
      Left = 154
      Top = 2
      Width = 124
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        407.458333333333
        5.29166666666667
        328.083333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total Promotor Admimistrador   :'
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
    object QRShape15: TQRShape
      Left = 296
      Top = 0
      Width = 637
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        13.2291666666667
        783.166666666667
        0
        1685.39583333333)
      Pen.Width = 2
      Shape = qrsHorLine
    end
    object QRExpr6: TQRExpr
      Left = 303
      Top = 3
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        801.6875
        7.9375
        156.104166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CREDITO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr7: TQRExpr
      Left = 364
      Top = 3
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        963.083333333333
        7.9375
        140.229166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr8: TQRExpr
      Left = 418
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
        1105.95833333333
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
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr9: TQRExpr
      Left = 475
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
        1256.77083333333
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
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_FA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr10: TQRExpr
      Left = 531
      Top = 3
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1404.9375
        7.9375
        140.229166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_INTERES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr11: TQRExpr
      Left = 585
      Top = 3
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1547.8125
        7.9375
        127)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_COMISIONES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr12: TQRExpr
      Left = 634
      Top = 3
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1677.45833333333
        7.9375
        111.125)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_IVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr13: TQRExpr
      Left = 677
      Top = 3
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1791.22916666667
        7.9375
        127)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr14: TQRExpr
      Left = 726
      Top = 3
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1920.875
        7.9375
        156.104166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_FEGA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr15: TQRExpr
      Left = 786
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2079.625
        7.9375
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_BINTER)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr16: TQRExpr
      Left = 847
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2241.02083333333
        7.9375
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 
        'SUM(qyConsImpa.IMP_CAPITAL + qyConsImpa.IMP_FA + qyConsImpa.IMP_' +
        'INTERES + qyConsImpa.IMP_COMISIONES + qyConsImpa.IMP_IVA + qyCon' +
        'sImpa.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRFooterPromAsoc: TQRBand
    Left = 38
    Top = 261
    Width = 980
    Height = 17
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
      44.9791666666667
      2592.91666666667)
    BandType = rbGroupFooter
    object QRLabel3: TQRLabel
      Left = 103
      Top = 2
      Width = 99
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        272.520833333333
        5.29166666666667
        261.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total Promotor Asociado :'
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
    object QRShape16: TQRShape
      Left = 296
      Top = 0
      Width = 637
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        13.2291666666667
        783.166666666667
        0
        1685.39583333333)
      Pen.Width = 2
      Shape = qrsHorLine
    end
    object QRExpr17: TQRExpr
      Left = 303
      Top = 3
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        801.6875
        7.9375
        156.104166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CREDITO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr18: TQRExpr
      Left = 364
      Top = 3
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        963.083333333333
        7.9375
        140.229166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr19: TQRExpr
      Left = 418
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
        1105.95833333333
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
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr20: TQRExpr
      Left = 475
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
        1256.77083333333
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
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_FA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr21: TQRExpr
      Left = 531
      Top = 3
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1404.9375
        7.9375
        140.229166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_INTERES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr22: TQRExpr
      Left = 585
      Top = 3
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1547.8125
        7.9375
        127)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_COMISIONES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr23: TQRExpr
      Left = 634
      Top = 3
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1677.45833333333
        7.9375
        111.125)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_IVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr24: TQRExpr
      Left = 677
      Top = 3
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1791.22916666667
        7.9375
        127)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr25: TQRExpr
      Left = 726
      Top = 3
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1920.875
        7.9375
        156.104166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_FEGA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr26: TQRExpr
      Left = 786
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2079.625
        7.9375
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_BINTER)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr27: TQRExpr
      Left = 847
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2241.02083333333
        7.9375
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 
        'SUM(qyConsImpa.IMP_CAPITAL + qyConsImpa.IMP_FA + qyConsImpa.IMP_' +
        'INTERES + qyConsImpa.IMP_COMISIONES + qyConsImpa.IMP_IVA + qyCon' +
        'sImpa.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRFooterMoneda: TQRBand
    Left = 38
    Top = 278
    Width = 980
    Height = 17
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
      44.9791666666667
      2592.91666666667)
    BandType = rbGroupFooter
    object QRShape13: TQRShape
      Left = 296
      Top = 0
      Width = 637
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        13.2291666666667
        783.166666666667
        0
        1685.39583333333)
      Pen.Width = 2
      Shape = qrsHorLine
    end
    object QRLabel1: TQRLabel
      Left = 74
      Top = 2
      Width = 57
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        195.791666666667
        5.29166666666667
        150.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total Moneda :'
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
    object TotGarMON: TQRExpr
      Left = 726
      Top = 3
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1920.875
        7.9375
        156.104166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_FEGA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object TotBINMon: TQRExpr
      Left = 786
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2079.625
        7.9375
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_BINTER)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object TotCapMON: TQRExpr
      Left = 418
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
        1105.95833333333
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
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object TotIntMON: TQRExpr
      Left = 531
      Top = 3
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1404.9375
        7.9375
        140.229166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_INTERES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object TotComMON: TQRExpr
      Left = 585
      Top = 3
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1547.8125
        7.9375
        127)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_COMISIONES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object TotIVAMON: TQRExpr
      Left = 634
      Top = 3
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1677.45833333333
        7.9375
        111.125)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_IVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object TotMORMON: TQRExpr
      Left = 677
      Top = 3
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1791.22916666667
        7.9375
        127)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object TotSIMON: TQRExpr
      Left = 364
      Top = 3
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        963.083333333333
        7.9375
        140.229166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object TotCreMon: TQRExpr
      Left = 303
      Top = 3
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        801.6875
        7.9375
        156.104166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CREDITO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr3: TQRExpr
      Left = 847
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2241.02083333333
        7.9375
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 
        'SUM(qyConsImpa.IMP_CAPITAL + qyConsImpa.IMP_FA + qyConsImpa.IMP_' +
        'INTERES + qyConsImpa.IMP_COMISIONES + qyConsImpa.IMP_IVA + qyCon' +
        'sImpa.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr5: TQRExpr
      Left = 475
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
        1256.77083333333
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
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_FA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRFooterRegion: TQRBand
    Left = 38
    Top = 295
    Width = 980
    Height = 17
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Enabled = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      44.9791666666667
      2592.91666666667)
    BandType = rbGroupFooter
    object QRLabel4: TQRLabel
      Left = 32
      Top = 2
      Width = 54
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        84.6666666666667
        5.29166666666667
        142.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total Región :'
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
    object QRShape17: TQRShape
      Left = 296
      Top = 0
      Width = 637
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        15.875
        783.166666666667
        0
        1685.39583333333)
      Pen.Width = 2
      Shape = qrsHorLine
    end
    object QRExpr28: TQRExpr
      Left = 303
      Top = 3
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        801.6875
        7.9375
        156.104166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CREDITO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr29: TQRExpr
      Left = 364
      Top = 3
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        963.083333333333
        7.9375
        140.229166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr30: TQRExpr
      Left = 418
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
        1105.95833333333
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
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr31: TQRExpr
      Left = 475
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
        1256.77083333333
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
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_FA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr32: TQRExpr
      Left = 531
      Top = 3
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1404.9375
        7.9375
        140.229166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_INTERES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr33: TQRExpr
      Left = 585
      Top = 3
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1547.8125
        7.9375
        127)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_COMISIONES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr34: TQRExpr
      Left = 634
      Top = 3
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1677.45833333333
        7.9375
        111.125)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_IVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr35: TQRExpr
      Left = 677
      Top = 3
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1791.22916666667
        7.9375
        127)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr36: TQRExpr
      Left = 726
      Top = 3
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1920.875
        7.9375
        156.104166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_FEGA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr37: TQRExpr
      Left = 786
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2079.625
        7.9375
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_BINTER)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr38: TQRExpr
      Left = 847
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2241.02083333333
        7.9375
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 
        'SUM(qyConsImpa.IMP_CAPITAL + qyConsImpa.IMP_FA + qyConsImpa.IMP_' +
        'INTERES + qyConsImpa.IMP_COMISIONES + qyConsImpa.IMP_IVA + qyCon' +
        'sImpa.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRFooterDireccion: TQRBand
    Left = 38
    Top = 312
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
    BandType = rbGroupFooter
    object QRLabel5: TQRLabel
      Left = 16
      Top = 3
      Width = 88
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        42.3333333333333
        7.9375
        232.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total Dirección :'
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
    object QRShape18: TQRShape
      Left = 304
      Top = 0
      Width = 629
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        13.2291666666667
        804.333333333333
        0
        1664.22916666667)
      Pen.Width = 2
      Shape = qrsHorLine
    end
    object QRExpr39: TQRExpr
      Left = 303
      Top = 3
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        801.6875
        7.9375
        156.104166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CREDITO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr40: TQRExpr
      Left = 364
      Top = 3
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        963.083333333333
        7.9375
        140.229166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr41: TQRExpr
      Left = 418
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
        1105.95833333333
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
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr42: TQRExpr
      Left = 475
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
        1256.77083333333
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
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_FA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr43: TQRExpr
      Left = 531
      Top = 3
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1404.9375
        7.9375
        140.229166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_INTERES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr44: TQRExpr
      Left = 585
      Top = 3
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1547.8125
        7.9375
        127)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_COMISIONES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr45: TQRExpr
      Left = 634
      Top = 3
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1677.45833333333
        7.9375
        111.125)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_IVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr46: TQRExpr
      Left = 677
      Top = 3
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1791.22916666667
        7.9375
        127)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr47: TQRExpr
      Left = 726
      Top = 3
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1920.875
        7.9375
        156.104166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_FEGA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr48: TQRExpr
      Left = 786
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2079.625
        7.9375
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_BINTER)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr49: TQRExpr
      Left = 847
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2241.02083333333
        7.9375
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 
        'SUM(qyConsImpa.IMP_CAPITAL + qyConsImpa.IMP_FA + qyConsImpa.IMP_' +
        'INTERES + qyConsImpa.IMP_COMISIONES + qyConsImpa.IMP_IVA + qyCon' +
        'sImpa.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRFooterCont: TQRBand
    Left = 38
    Top = 331
    Width = 980
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFooterContBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.2708333333333
      2592.91666666667)
    BandType = rbSummary
    object QRShape19: TQRShape
      Left = 296
      Top = 1
      Width = 649
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        783.166666666667
        2.64583333333333
        1717.14583333333)
      Shape = qrsRectangle
    end
    object QRLabel45: TQRLabel
      Left = 11
      Top = 3
      Width = 74
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        29.1041666666667
        7.9375
        195.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Gran Total '
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
    object QRExpr50: TQRExpr
      Left = 303
      Top = 3
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        801.6875
        7.9375
        156.104166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CREDITO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr51: TQRExpr
      Left = 364
      Top = 3
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        963.083333333333
        7.9375
        140.229166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr52: TQRExpr
      Left = 418
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
        1105.95833333333
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
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr53: TQRExpr
      Left = 475
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
        1256.77083333333
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
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_FA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr54: TQRExpr
      Left = 531
      Top = 3
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1404.9375
        7.9375
        140.229166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_INTERES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr55: TQRExpr
      Left = 585
      Top = 3
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1547.8125
        7.9375
        127)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_COMISIONES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr56: TQRExpr
      Left = 634
      Top = 3
      Width = 42
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1677.45833333333
        7.9375
        111.125)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_IVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr57: TQRExpr
      Left = 677
      Top = 3
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1791.22916666667
        7.9375
        127)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr58: TQRExpr
      Left = 726
      Top = 3
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1920.875
        7.9375
        156.104166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_FEGA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr59: TQRExpr
      Left = 786
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2079.625
        7.9375
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_BINTER)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr60: TQRExpr
      Left = 847
      Top = 3
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2241.02083333333
        7.9375
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 
        'SUM(qyConsImpa.IMP_CAPITAL + qyConsImpa.IMP_FA + qyConsImpa.IMP_' +
        'INTERES + qyConsImpa.IMP_COMISIONES + qyConsImpa.IMP_IVA + qyCon' +
        'sImpa.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRBNombre: TQRBand
    Left = 38
    Top = 234
    Width = 980
    Height = 10
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
      26.4583333333333
      2592.91666666667)
    BandType = rbGroupFooter
    object QRExpr61: TQRExpr
      Left = 303
      Top = 2
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        801.6875
        5.29166666666667
        156.104166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CREDITO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr62: TQRExpr
      Left = 364
      Top = 2
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        963.083333333333
        5.29166666666667
        140.229166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr63: TQRExpr
      Left = 418
      Top = 2
      Width = 56
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1105.95833333333
        5.29166666666667
        148.166666666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_CAPITAL)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr64: TQRExpr
      Left = 475
      Top = 2
      Width = 55
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1256.77083333333
        5.29166666666667
        145.520833333333)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_FA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr65: TQRExpr
      Left = 531
      Top = 2
      Width = 53
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1404.9375
        5.29166666666667
        140.229166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_INTERES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr66: TQRExpr
      Left = 585
      Top = 2
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1547.8125
        5.29166666666667
        127)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_COMISIONES)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr67: TQRExpr
      Left = 634
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
        1677.45833333333
        5.29166666666667
        111.125)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_IVA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr68: TQRExpr
      Left = 677
      Top = 2
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1791.22916666667
        5.29166666666667
        127)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr69: TQRExpr
      Left = 726
      Top = 2
      Width = 59
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1920.875
        5.29166666666667
        156.104166666667)
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_FEGA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr70: TQRExpr
      Left = 786
      Top = 2
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2079.625
        5.29166666666667
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsImpa.IMP_BINTER)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr71: TQRExpr
      Left = 847
      Top = 2
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2241.02083333333
        5.29166666666667
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
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 
        'SUM(qyConsImpa.IMP_CAPITAL + qyConsImpa.IMP_FA + qyConsImpa.IMP_' +
        'INTERES + qyConsImpa.IMP_COMISIONES + qyConsImpa.IMP_IVA + qyCon' +
        'sImpa.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRDBText9: TQRDBText
      Left = 160
      Top = 2
      Width = 129
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        423.333333333333
        5.29166666666667
        341.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'NOM_PROVEEDOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 5
    end
    object QRExpr73: TQRExpr
      Left = 0
      Top = 2
      Width = 167
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        0
        5.29166666666667
        441.854166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'qyConsImpa.NOMBRE'
      FontSize = 5
    end
    object QRDBText10: TQRDBText
      Left = 923
      Top = -1
      Width = 19
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2442.10416666667
        -2.64583333333333
        50.2708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'STATUS_RECU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText12: TQRDBText
      Left = 943
      Top = -1
      Width = 37
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2495.02083333333
        -2.64583333333333
        97.8958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsImpa
      DataField = 'F_ALTA_RECU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = 'DD/MM/YYYY'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
  end
  object qyConsImpa: TQuery
    DatabaseName = 'NCORP'
    SessionName = 'Default'
    SQL.Strings = (
      ' SELECT'
      
        '        NVL(DIR.DESC_DIRECCION,'#39'NO ASIGNADA'#39') AS NOM_DRCN ,NVL(P' +
        'DIR.NOMBRE,'#39'NO ASIGNADO'#39') AS NOM_DRTR, '
      '        DOM.CVE_ESTADO  AS ESTADO, POB.DESC_POBLACION, '
      
        '        NVL(DIR.CVE_DIRECCION,'#39'NOASIG'#39') AS CVE_DIRECCION, NVL(DI' +
        'R.ID_DIRECTOR,0) AS ID_DIRECTOR, CTO.ID_TITULAR, '
      '        F_REF.F_REFERENCIA   - ACCE.F_VENCIMIENTO  diasImVe,'
      
        '            ACCE.ID_CREDITO, ACCE.F_VENCIMIENTO, acce.F_PROG_PAG' +
        'O,    '
      
        '     '#9' SUM(DECODE(ACCE.ORD_ACC,'#39'A'#39',ACCE.IMPORTE,0)) IMP_CAPITAL,' +
        ' '
      
        '            SUM(DECODE(ACCE.ORD_ACC,'#39'B'#39',ACCE.IMPORTE,0)) IMP_FA,' +
        '      '
      
        '            SUM(DECODE(ACCE.ORD_ACC,'#39'C'#39',ACCE.IMPORTE,0)) IMP_INT' +
        'ERES, '
      
        '            SUM(DECODE(ACCE.ORD_ACC,'#39'D'#39',ACCE.IMPORTE,0)) IMP_COM' +
        'ISIONES, '
      
        '            SUM(acce.imp_iva) imp_iva,                          ' +
        '       '
      
        '            SUM(acce.Imp_Binter) IMP_BINTER,                    ' +
        '       '
      
        '            SUM(acce.IMP_FEGA) IMP_FEGA,                        ' +
        '       '
      
        '            SUM(acce.Imp_Total) IMP_TOTAL,                      ' +
        '       '
      
        '            SUM( acce.MORATORIOS) MORATORIOS,                   ' +
        '       '
      
        '        CTO.CVE_MONEDA          ,       M.DESC_MONEDA           ' +
        '        , '
      
        '        CC.ID_PROM_ADM          ,       PPR.NOMBRE NOM_PROMOTOR_' +
        'ADM     , '
      
        '        CTO.ID_PERS_ASOCIAD     ,       PPRC.NOMBRE NOM_PROMOTOR' +
        '_ASO    , '
      
        '        CPR.CVE_PRODUCTO_CRE    ,       CPR.DESC_L_PRODUCTO     ' +
        '        , '
      
        '        CPR.CVE_TIPO_CRED_BC    ,       CTC.DESC_TIPO_CRED      ' +
        '        , '
      
        '        CC.ID_CREDITO           ,       CC.ID_CONTRATO          ' +
        '        , '
      
        '        DECODE(PCE.CVE_PER_JURIDICA,'#39'PM'#39',PCE.NOMBRE,PTIT.APELLID' +
        'O_PATERNO||'#39' '#39'||PTIT.APELLIDO_MATERNO||'#39' '#39'||PTIT.NOMBRE_PERSONA)' +
        ' NOMBRE, '
      
        '        SUBDIV.ID_EMISOR        ,       NVL(SUBDIV.CVE_EMISOR_NA' +
        'FIN,0) CVE_EMISOR_NAFIN,'
      
        '        SUBDIV.ID_PROVEEDOR     ,       PP.NOMBRE NOM_PROVEEDOR ' +
        '        , '
      
        '        SUBDIV.NOMBRE_EMISOR    ,       PCE.CVE_TIPO_SECTOR     ' +
        '        , '
      
        '        CP.ID_PROV_EXTERNO ID_PROV_NAFINSA                      ' +
        '        ,'
      
        '        CC.SDO_INSOLUTO         ,       CC.SDO_VIG_TOTAL        ' +
        '        , '
      
        '        CC.IMP_DISPUESTO AS IMP_CREDITO   ,       CC.CVE_CALCULO' +
        '                  , '
      
        '        0 NO_REFER              ,       CTO.ID_TITULAR          ' +
        '        , '
      '     NVL(CD.IMP_NOMINAL,0) AS IMP_NOMINAL  '
      '           ,NVL(RECU.STATUS_RECU,'#39' '#39') AS STATUS_RECU '
      '           ,RECU.F_ALTA_RECU AS F_ALTA_RECU '
      ' FROM '
      
        '      ( SELECT '#39'A'#39' ORD_ACC ,CCA.ID_CREDITO,'#39'CAPITAL'#39' ACCESORIO,C' +
        'CA.NUM_PERIODO,CCA.PLAZO,(CCA.F_VENCIMIENTO - CCA.PLAZO) F_INICI' +
        'O, '
      '               CCA.F_VENCIMIENTO,CCA.F_PROG_PAGO,CCA.F_PAGO,'
      
        '               Pkgcrcomun.FUNOBTENTASA('#39'CP'#39',CCA.ID_CREDITO,CCA.N' +
        'UM_PERIODO,CCA.F_VENCIMIENTO-1)TASA_APLICADA,'
      
        '               (CCA.IMP_CAPITAL - CCA.IMP_PAGADO_HIST + NVL(CA_H' +
        'IST_PGDMCP.IMP_HIST_PGDMCP,0)) IMPORTE,'
      '                0 IMP_IVA,CCA.SIT_CAPITAL, '
      
        '               (CCA.IMP_CAPITAL - CCA.IMP_PAGADO_HIST - CCA.IMP_' +
        'CONCEPTO + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0)) IMP_BINTER,'
      '               CCA.IMP_CONCEPTO IMP_FEGA, '
      
        '              (CCA.IMP_CAPITAL + CCA.MORATORIOS - CCA.IMP_PAGADO' +
        '_HIST + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0)) IMP_TOTAL,'
      '               CCA.MORATORIOS'
      '        FROM  ( SELECT CCA.*, '
      
        '                       Pkgcrcomun.FUNOBTENIMPGTIA( 3, '#39'CP'#39', '#39'IMP' +
        'BRU'#39', CCA.ID_CREDITO, CCA.NUM_PERIODO, NULL, TO_DATE('#39'10/10/2010' +
        #39','#39'DD/MM/YYYY'#39'), '#39'V'#39' ) IMP_CONCEPTO, '
      
        '                       NVL( Pkgcrperiodo.FUNOBTENMORA( 1,'#39'V'#39',CCA' +
        '.ID_CREDITO,CCA.NUM_PERIODO,NULL,NULL,TO_DATE('#39'10/10/2010'#39','#39'DD/M' +
        'M/YYYY'#39') ,NULL), 0 ) AS MORATORIOS, '
      
        '                       NVL(  Pkgcrcomun.STPOBTIMPPAGADO( '#39'CP'#39', '#39 +
        'IMPBRU'#39',CCA.ID_CREDITO, CCA.NUM_PERIODO,NULL,TO_DATE('#39'10/10/2010' +
        #39','#39'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST '
      '                FROM ( SELECT * FROM CR_CAPITAL CCA '
      '                       WHERE 1 = 1'
      
        '                         AND Pkgcractualiza.STPOBTEMPRESA(CCA.ID' +
        '_CREDITO) = 2'
      
        '                         AND  CCA.F_VENCIMIENTO <=TO_DATE('#39'10/10' +
        '/2010'#39','#39'DD/MM/YYYY'#39')'
      
        '                         AND  ((CCA.F_PROG_PAGO < CCA.F_PAGO AND' +
        ' CCA.SIT_CAPITAL <> '#39'CA'#39
      
        '                         AND   CCA.F_PAGO > TO_DATE('#39'10/10/2010'#39 +
        ','#39'DD/MM/YYYY'#39'))'
      '                          OR   (CCA.SIT_CAPITAL = '#39'IM'#39' ))'
      '                      ) CCA'
      '              ) CCA,'
      '               ('
      #9#9#9'    SELECT CT.ID_CREDITO, CT.ID_PERIODO,'
      
        '                       NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_' +
        'PGDMCP'
      '                  FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'
      '                 WHERE 1=1'
      '                   AND CT.SIT_TRANSACCION = '#39'AC'#39
      '                   AND CT.ID_TRANS_CANCELA IS NULL'
      '                   AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION'
      '                   AND CT.CVE_OPERACION IN ('#39'PGDMCP'#39')'
      #9#9#9#9'   AND CDT.CVE_CONCEPTO IN ('#39'IMPBRU'#39')'
      '                 GROUP BY CT.ID_CREDITO, CT.ID_PERIODO'
      #9#9#9'   ) CA_HIST_PGDMCP,'
      '              CR_CREDITO CR, CR_CONTRATO CCTO, CR_PRODUCTO CPR'
      '        WHERE 1 = 1'
      '        AND CPR.ID_EMPRESA =2'
      '        AND CR.ID_CREDITO = CCA.ID_CREDITO'
      '        AND CR.ID_CONTRATO = CCTO.ID_CONTRATO'
      '        AND CR.FOL_CONTRATO = CCTO.FOL_CONTRATO'
      '        AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE'
      '        AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCA.ID_CREDITO'
      '        AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCA.NUM_PERIODO'
      '      UNION '
      
        '        SELECT '#39'C'#39' ORD_ACC ,CCI.ID_CREDITO,'#39'INTERES'#39' ACCESORIO,C' +
        'CI.NUM_PERIODO,CCI.PLAZO,(CCI.F_VENCIMIENTO - CCI.PLAZO) F_INICI' +
        'O, '
      
        '               CCI.F_VENCIMIENTO,CCI.F_PROG_PAGO,CCI.F_PAGO,CCI.' +
        'TASA_APLICADA,'
      
        '               (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST) IMPO' +
        'RTE, '
      
        '               CCI.IMP_IVA_PROY  - CCI.IMP_IVA_PAG_HIST AS IMP_I' +
        'VA, CCI.SIT_INTERES, '
      
        '               (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST - NVL' +
        '(CCI.IMP_CONCEPTO,0)) IMP_BINTER, '
      '               NVL(CCI.IMP_CONCEPTO,0) IMP_FEGA, '
      
        '              (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST + CCI.' +
        'IMP_IVA_PROY + CCI.MORATORIOS - CCI.IMP_IVA_PAG_HIST) IMP_TOTAL,' +
        ' '
      '               CCI. MORATORIOS '
      '        FROM ( SELECT CCI.*, '
      
        '                      Pkgcrcomun.FUNOBTENIMPGTIA( 3, '#39'IN'#39', '#39'IMPB' +
        'RU'#39', CCI.ID_CREDITO, CCI.NUM_PERIODO, NULL, TO_DATE('#39'10/10/2010'#39 +
        ','#39'DD/MM/YYYY'#39'), '#39'V'#39' ) IMP_CONCEPTO, '
      
        '                      NVL( Pkgcrperiodo.FUNOBTENMORA( 4,'#39'V'#39',CCI.' +
        'ID_CREDITO,CCI.NUM_PERIODO,NULL,NULL,TO_DATE('#39'10/10/2010'#39','#39'DD/MM' +
        '/YYYY'#39') ,NULL), 0 ) AS MORATORIOS, '
      
        '                      NVL( Pkgcrcomun.STPOBTIMPPAGADO( '#39'IN'#39', '#39'IM' +
        'PBRU'#39',CCI.ID_CREDITO,  CCI.NUM_PERIODO,NULL, TO_DATE('#39'10/10/2010' +
        #39','#39'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST,'
      
        '                      NVL( Pkgcrcomun.STPOBTIMPPAGADO( '#39'IN'#39', '#39'IM' +
        'PIVA'#39', CCI.ID_CREDITO,  CCI.NUM_PERIODO, NULL,  TO_DATE('#39'10/10/2' +
        '010'#39','#39'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_IVA_PAG_HIST '
      '               FROM ( SELECT * FROM CR_INTERES CCI '
      '                      WHERE 1 = 1'
      
        '                         AND Pkgcractualiza.STPOBTEMPRESA(CCI.ID' +
        '_CREDITO) = 2'
      
        '                         AND CCI.F_VENCIMIENTO <=TO_DATE('#39'10/10/' +
        '2010'#39','#39'DD/MM/YYYY'#39')'
      
        '                         AND ((CCI.F_PROG_PAGO < CCI.F_PAGO AND ' +
        ' CCI.SIT_INTERES <> '#39'CA'#39
      
        '                         AND CCI.F_PAGO > TO_DATE('#39'10/10/2010'#39','#39 +
        'DD/MM/YYYY'#39'))'
      '                          OR (CCI.SIT_INTERES = '#39'IM'#39' ))'
      '                      ) CCI '
      
        '               ) CCI, CR_CREDITO CR, CR_CONTRATO CCTO, CR_PRODUC' +
        'TO CPR'
      '        WHERE 1 = 1'
      '        AND CPR.ID_EMPRESA =2'
      '        AND CR.ID_CREDITO = CCI.ID_CREDITO'
      '        AND CR.ID_CONTRATO = CCTO.ID_CONTRATO'
      '        AND CR.FOL_CONTRATO = CCTO.FOL_CONTRATO'
      '        AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE'
      '      UNION '
      
        '        SELECT '#39'B'#39' ORD_ACC ,CFA.ID_CREDITO,'#39'REFINANCIAMIENTO'#39' AC' +
        'CESORIO,CFA.NUM_PERIODO,CFA.PLAZO,(CFA.F_VENCIMIENTO - CFA.PLAZO' +
        ') F_INICIO, '
      
        '               CFA.F_VENCIMIENTO,CFA.F_PROG_PAGO,CFA.F_PAGO,0 TA' +
        'SA_APLICADA,'
      
        '               (CFA.IMP_FINAN_ADIC - CFA.IMP_PAGADO_HIST) IMPORT' +
        'E,  '
      '                0 IMP_IVA,CFA.SIT_FINAN_ADIC, '
      
        '               (CFA.IMP_FINAN_ADIC - CFA.IMP_PAGADO_HIST - NVL(C' +
        'FA.IMP_CONCEPTO,0)) IMP_BINTER, '
      '                NVL(CFA.IMP_CONCEPTO,0) IMP_FEGA, '
      
        '               (CFA.IMP_FINAN_ADIC + CFA.MORATORIOS - CFA.IMP_PA' +
        'GADO_HIST ) IMP_TOTAL,  '
      '               CFA.MORATORIOS'
      '        FROM ( SELECT CFA.*, '
      
        '                      Pkgcrcomun.FUNOBTENIMPGTIA( 3, '#39'FN'#39', '#39'IMPB' +
        'RU'#39', CFA.ID_CREDITO, CFA.NUM_PERIODO, NULL, TO_DATE('#39'10/10/2010'#39 +
        ','#39'DD/MM/YYYY'#39'), '#39'V'#39' ) IMP_CONCEPTO, '
      
        '                      NVL( Pkgcrperiodo.FUNOBTENMORA(3,'#39'V'#39' ,CFA.' +
        'ID_CREDITO, CFA.NUM_PERIODO , NULL, NULL,TO_DATE('#39'10/10/2010'#39','#39'D' +
        'D/MM/YYYY'#39') ,NULL), 0 ) AS MORATORIOS,'
      
        '                      NVL( Pkgcrcomun.STPOBTIMPPAGADO( '#39'FN'#39', '#39'IM' +
        'PBRU'#39',CFA.ID_CREDITO,CFA.NUM_PERIODO,NULL,TO_DATE('#39'10/10/2010'#39','#39 +
        'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST '
      '               FROM ( SELECT * FROM CR_FINAN_ADIC  CFA '
      '                      WHERE 1 = 1'
      
        '                         AND Pkgcractualiza.STPOBTEMPRESA(CFA.ID' +
        '_CREDITO) = 2'
      
        '                         AND CFA.F_VENCIMIENTO <=TO_DATE('#39'10/10/' +
        '2010'#39','#39'DD/MM/YYYY'#39')'
      '                         AND ((CFA.F_PROG_PAGO < CFA.F_PAGO '
      '                               AND CFA.SIT_FINAN_ADIC <> '#39'CA'#39
      
        '                               AND CFA.F_PAGO > TO_DATE('#39'10/10/2' +
        '010'#39','#39'DD/MM/YYYY'#39'))'
      '                              OR (CFA.SIT_FINAN_ADIC = '#39'IM'#39' ))'
      '                      ) CFA '
      
        '               ) CFA, CR_CREDITO CR, CR_CONTRATO CCTO, CR_PRODUC' +
        'TO CPR'
      '        WHERE 1 = 1'
      '        AND CPR.ID_EMPRESA =2'
      '        AND CR.ID_CREDITO = CFA.ID_CREDITO'
      '        AND CR.ID_CONTRATO = CCTO.ID_CONTRATO'
      '        AND CR.FOL_CONTRATO = CCTO.FOL_CONTRATO'
      '        AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE'
      '      UNION '
      
        '        SELECT '#39'D'#39' ORD_ACC ,CCC.ID_CREDITO,CCC.DESC_COMISION,CCC' +
        '.NUM_PERIODO,0 PLAZO,CCC.F_VENCIMIENTO F_INICIO, '
      
        '               CCC.F_VENCIMIENTO,CCC.F_PROG_PAGO,CCC.F_PAGO,CCC.' +
        'TASA_APLICADA,'
      '               (CCC.IMP_COMISION - CCC.IMP_PAGADO_HIST) IMPORTE,'
      
        '               CCC.IMP_IVA-CCC.IMP_IVA_PAG_HIST,CCC.SIT_COMISION' +
        ', '
      
        '               (CCC.IMP_COMISION - CCC.IMP_PAGADO_HIST - NVL(CCC' +
        '.IMP_CONCEPTO,0)) IMP_BINTER, '
      '               NVL(CCC.IMP_CONCEPTO,0) IMP_FEGA, '
      
        '               (CCC.IMP_COMISION  + CCC.IMP_IVA + CCC.MORATORIOS' +
        ' - CCC.IMP_PAGADO_HIST -CCC.IMP_IVA_PAG_HIST) IMP_TOTAL, '
      '               CCC.MORATORIOS'
      '        FROM ( SELECT CCC.*, '
      
        '                      Pkgcrcomun.FUNOBTENIMPGTIA( 3, '#39'CN'#39', '#39'IMPB' +
        'RU'#39', CCC.ID_CREDITO, CCC.NUM_PERIODO, CCC.CVE_COMISION, TO_DATE(' +
        #39'10/10/2010'#39','#39'DD/MM/YYYY'#39'), '#39'V'#39' ) IMP_CONCEPTO, '
      '                      CCCO.DESC_COMISION,'
      
        '                      NVL( Pkgcrperiodo.FUNOBTENMORA( 2 ,'#39'V'#39' ,CC' +
        'C.ID_CREDITO ,CCC.NUM_PERIODO , CCC.CVE_COMISION , NULL,TO_DATE(' +
        #39'10/10/2010'#39','#39'DD/MM/YYYY'#39') , NULL), 0 ) AS MORATORIOS, '
      
        '                      NVL( Pkgcrcomun.STPOBTIMPPAGADO( '#39'CN'#39', '#39'IM' +
        'PBRU'#39', CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,TO_DAT' +
        'E('#39'10/10/2010'#39','#39'DD/MM/YYYY'#39'), '#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST, '
      
        '                      NVL( Pkgcrcomun.STPOBTIMPPAGADO( '#39'CN'#39', '#39'IM' +
        'PIVA'#39', CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,TO_DAT' +
        'E('#39'10/10/2010'#39','#39'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_IVA_PAG_HIST '
      '               FROM ( SELECT * FROM CR_COMISION CCC '
      '                      WHERE 1 = 1'
      
        '                         AND Pkgcractualiza.STPOBTEMPRESA(CCC.ID' +
        '_CREDITO) = 2'
      
        '                         AND CCC.F_VENCIMIENTO <=TO_DATE('#39'10/10/' +
        '2010'#39','#39'DD/MM/YYYY'#39')'
      '                         AND ((CCC.F_PROG_PAGO < CCC.F_PAGO  '
      '                                AND CCC.SIT_COMISION <> '#39'CA'#39
      
        '                                AND CCC.F_PAGO > TO_DATE('#39'10/10/' +
        '2010'#39','#39'DD/MM/YYYY'#39'))'
      '                                OR (CCC.SIT_COMISION = '#39'IM'#39' ))'
      
        '                      ) CCC, CR_CAT_COMISION CCCO WHERE  CCCO.CV' +
        'E_COMISION = CCC.CVE_COMISION  '
      
        '               ) CCC, CR_CREDITO CR, CR_CONTRATO CCTO, CR_PRODUC' +
        'TO CPR'
      '        WHERE 1 = 1'
      '        AND CPR.ID_EMPRESA =2'
      '        AND CR.ID_CREDITO = CCC.ID_CREDITO     '
      '        AND CR.ID_CONTRATO = CCTO.ID_CONTRATO  '
      '        AND CR.FOL_CONTRATO = CCTO.FOL_CONTRATO'
      '        AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE'
      '      )            ACCE                         '
      
        '      LEFT JOIN  CR_DOCUMENTO    CD    ON  CD.ID_CESION         ' +
        '= ACCE.ID_CREDITO         '
      
        '                                       AND CD.NUM_PERIODO_DOC   ' +
        '= ACCE.NUM_PERIODO        '
      
        '           JOIN  CR_CREDITO      CC    ON  CC.ID_CREDITO        ' +
        '= ACCE.ID_CREDITO         '
      
        '           JOIN  ( SELECT CCTO.*, CPRO.ID_EMPRESA FROM CR_PRODUC' +
        'TO CPRO, CR_CONTRATO CCTO WHERE CPRO.CVE_PRODUCTO_CRE = CCTO.CVE' +
        '_PRODUCTO_CRE ) '
      
        '                                 CCTO  ON  CCTO.ID_CONTRATO     ' +
        '= CC.ID_CONTRATO          '
      
        '                                       AND CCTO.FOL_CONTRATO    ' +
        '= CC.FOL_CONTRATO         '
      
        '           JOIN  ( SELECT * FROM CONTRATO WHERE ID_CONTRATO IN (' +
        'SELECT ID_CONTRATO FROM CR_CREDITO) ) '
      
        '                                 CTO   ON  CTO.ID_CONTRATO      ' +
        '= CC.ID_CONTRATO          '
      '      LEFT JOIN (SELECT  ID_ACREDITADO, F_ALTA_RECU,         '
      
        #9'                    (CASE  WHEN COUNT(ID_ACREDITADO) = 0 THEN '#39 +
        '  '#39'         '
      
        '                               WHEN COUNT(ID_ACREDITADO) > 0 THE' +
        'N '#39'SI'#39'         '
      '                               ELSE '#39'CE'#39'         '
      '                         END) AS STATUS_RECU         '
      '                   FROM CR_ACRE_RE         '
      
        #9'  '#9'          WHERE TO_DATE('#39'10/10/2010'#39','#39'DD/MM/YYYY'#39') >= F_ALTA' +
        '_RECU         '
      '                    AND F_BAJA_RECU IS NULL         '
      '               GROUP BY ID_ACREDITADO, F_ALTA_RECU         '
      
        '                ) RECU ON RECU.ID_ACREDITADO = CTO.ID_TITULAR   ' +
        '      '
      
        '        '#9'JOIN  MONEDA          M     ON  M.CVE_MONEDA         = ' +
        'CTO.CVE_MONEDA          '
      
        '        '#9'JOIN  PERSONA         PPR   ON  PPR.ID_PERSONA       = ' +
        'CC.ID_PROM_ADM          '
      
        '        '#9'JOIN  PERSONA         PPRC  ON  PPRC.ID_PERSONA      = ' +
        'CTO.ID_PERS_ASOCIAD     '
      
        '        '#9'JOIN  CR_PRODUCTO     CPR   ON  CPR.CVE_PRODUCTO_CRE = ' +
        'CCTO.CVE_PRODUCTO_CRE   '
      '      LEFT JOIN '
      
        '           (   SELECT SUB.CVE_SUB_DIVISION CVE_EMISOR_NAFIN, SUB' +
        '.NOMBRE_SUB_DIV NOMBRE_EMISOR,     '
      
        '                   ID_ACREDITADO ID_EMISOR, PROCAM.ID_CREDITO  I' +
        'D_CESION,                          '
      
        '                   0 ID_PROVEEDOR, '#39'F'#39' B_OPERADO_NAFIN, '#39'AP'#39' TIP' +
        'O_ACRED, NULL CVE_FND_ENT_DES  '
      
        '               FROM CR_SUBDIV_PROCAM SUB, CR_PROCAMPO PROCAM    ' +
        '                                   '
      
        '               WHERE PROCAM.CVE_SUB_DIVISION = SUB.CVE_SUB_DIVIS' +
        'ION                       '
      
        '           UNION                                                ' +
        '                          '
      
        '               SELECT CS.CVE_EMISOR_NAFIN, CE.NOMBRE_EMISOR ID_E' +
        'MISOR, CE.ID_ACREDITADO , CS.ID_CESION,'
      
        '                   CS.ID_PROVEEDOR, CS.B_OPERADO_NAFIN, '#39'AC'#39' TIP' +
        'O_ACRED, CE.CVE_FND_ENT_DES          '
      
        '               FROM CR_EMISOR CE, CR_CESION CS                  ' +
        '                          '
      
        '               WHERE CS.ID_EMISOR = CE.ID_ACREDITADO            ' +
        '                          '
      
        '               AND CS.CVE_FND_ENT_DES = CE.CVE_FND_ENT_DES      ' +
        '                          '
      
        '               AND CS.CVE_EMISOR_NAFIN = CE.CVE_EMISOR_EXT      ' +
        '                          '
      
        '           )                    SUBDIV ON  SUBDIV.ID_CESION     ' +
        '= CC.ID_CREDITO           '
      
        '      LEFT JOIN PERSONA          PP    ON  PP.ID_PERSONA        ' +
        '= SUBDIV.ID_PROVEEDOR     '
      
        '      LEFT JOIN CR_PROVEEDOR     CP    ON  CP.ID_ACREDITADO     ' +
        '= SUBDIV.ID_PROVEEDOR     '
      
        '                                       AND CP.CVE_FND_ENT_DES   ' +
        '= SUBDIV.CVE_FND_ENT_DES  '
      
        '      LEFT JOIN CR_CESION        CS    ON  CS.ID_CESION         ' +
        '= CC.ID_CREDITO           '
      
        '      LEFT JOIN PERSONA_FISICA   PTIT  ON  CTO.ID_TITULAR       ' +
        '= PTIT.ID_PERSONA         '
      
        '      LEFT JOIN PERSONA          PCE   ON  CTO.ID_TITULAR       ' +
        '= PCE.ID_PERSONA          '
      
        '      LEFT JOIN DOMICILIO        DOM   ON  CTO.ID_DOMICILIO     ' +
        '= DOM.ID_DOMICILIO        '
      
        '      LEFT JOIN POBLACION        POB   ON  DOM.CVE_PAIS         ' +
        '= POB.CVE_POBLAC_UBIC     '
      
        '                                       AND DOM.CVE_ESTADO       ' +
        '= POB.CVE_POBLACION       '
      
        '      LEFT JOIN CR_IMP_DIR_PROD  DPROD ON  CPR.CVE_PRODUCTO_CRE ' +
        '= DPROD.CVE_PRODUCTO_CRE  '
      
        '      LEFT JOIN CR_IMP_DIRECCION DIR   ON  DPROD.CVE_DIRECCION  ' +
        '= DIR.CVE_DIRECCION       '
      
        '      LEFT JOIN PERSONA          PDIR  ON  DIR.ID_DIRECTOR      ' +
        '= PDIR.ID_PERSONA         '
      
        '      LEFT JOIN CR_TIP_CRED_BC   CTC   ON  CTC.CVE_TIPO_CRED_BC ' +
        '= CPR.CVE_TIPO_CRED_BC ,  '
      
        '      ( SELECT  TO_DATE('#39'10/10/2010'#39','#39'DD/MM/YYYY'#39') AS F_REFERENC' +
        'IA FROM DUAL) F_REF   '
      '      WHERE 1 = 1  '
      '      AND CPR.ID_EMPRESA =2'
      '      AND CTO.ID_TITULAR =61810'
      
        ' GROUP BY                                                       ' +
        '              '
      
        ' NVL(DIR.DESC_DIRECCION,'#39'NO ASIGNADA'#39')  ,NVL(PDIR.NOMBRE,'#39'NO ASI' +
        'GNADO'#39') , '
      
        ' DOM.CVE_ESTADO  , POB.DESC_POBLACION,                          ' +
        '              '
      
        ' NVL(DIR.CVE_DIRECCION,'#39'NOASIG'#39') , NVL(DIR.ID_DIRECTOR,0) , CTO.' +
        'ID_TITULAR, '
      ' F_REF.F_REFERENCIA   - ACCE.F_VENCIMIENTO       ,              '
      
        ' ACCE.ID_CREDITO, ACCE.F_VENCIMIENTO, acce.F_PROG_PAGO,         ' +
        '              '
      
        ' CTO.CVE_MONEDA          ,       M.DESC_MONEDA                  ' +
        ' ,            '
      
        ' CC.ID_PROM_ADM          ,       PPR.NOMBRE     ,               ' +
        '              '
      
        ' CTO.ID_PERS_ASOCIAD     ,       PPRC.NOMBRE ,                  ' +
        '              '
      
        ' CPR.CVE_PRODUCTO_CRE    ,       CPR.DESC_L_PRODUCTO            ' +
        ' ,            '
      
        ' CPR.CVE_TIPO_CRED_BC    ,       CTC.DESC_TIPO_CRED             ' +
        ' ,            '
      
        ' CC.ID_CREDITO           ,       CC.ID_CONTRATO                 ' +
        ' ,            '
      
        ' DECODE(PCE.CVE_PER_JURIDICA,'#39'PM'#39',PCE.NOMBRE,PTIT.APELLIDO_PATER' +
        'NO||'#39' '#39'||PTIT.APELLIDO_MATERNO||'#39' '#39'||PTIT.NOMBRE_PERSONA) , '
      
        ' SUBDIV.ID_EMISOR        ,       NVL(SUBDIV.CVE_EMISOR_NAFIN,0) ' +
        ',             '
      
        ' SUBDIV.ID_PROVEEDOR     ,       PP.NOMBRE     ,                ' +
        '              '
      
        ' SUBDIV.NOMBRE_EMISOR    ,       PCE.CVE_TIPO_SECTOR            ' +
        ' ,            '
      
        ' CP.ID_PROV_EXTERNO ,                                           ' +
        '              '
      
        ' CC.SDO_INSOLUTO         ,       CC.SDO_VIG_TOTAL               ' +
        ' ,            '
      
        ' CC.IMP_DISPUESTO        ,       CC.CVE_CALCULO                 ' +
        ' ,            '
      
        ' 0               ,       CTO.ID_TITULAR                  ,      ' +
        '              '
      
        ' NVL(CD.IMP_NOMINAL,0)                                   ,      ' +
        '             '
      ' NVL(RECU.STATUS_RECU,'#39' '#39'),'
      ' RECU.F_ALTA_RECU  ORDER BY NOM_DRCN, '
      
        '  CTO.CVE_MONEDA , CTO.ID_PERS_ASOCIAD,   CC.ID_PROM_ADM , NOMBR' +
        'E, DESC_L_PRODUCTO,   CC.ID_CREDITO '
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 165
    Top = 9
    object qyConsImpaDIASIMVE: TFloatField
      FieldName = 'DIASIMVE'
    end
    object qyConsImpaID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyConsImpaF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qyConsImpaIMP_CAPITAL: TFloatField
      FieldName = 'IMP_CAPITAL'
    end
    object qyConsImpaIMP_IVA: TFloatField
      FieldName = 'IMP_IVA'
    end
    object qyConsImpaIMP_TOTAL: TFloatField
      FieldName = 'IMP_TOTAL'
    end
    object qyConsImpaCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyConsImpaDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyConsImpaID_PROM_ADM: TFloatField
      FieldName = 'ID_PROM_ADM'
    end
    object qyConsImpaNOM_PROMOTOR_ADM: TStringField
      FieldName = 'NOM_PROMOTOR_ADM'
      Size = 80
    end
    object qyConsImpaID_PERS_ASOCIAD: TFloatField
      FieldName = 'ID_PERS_ASOCIAD'
    end
    object qyConsImpaNOM_PROMOTOR_ASO: TStringField
      FieldName = 'NOM_PROMOTOR_ASO'
      Size = 80
    end
    object qyConsImpaCVE_PRODUCTO_CRE: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 6
    end
    object qyConsImpaDESC_L_PRODUCTO: TStringField
      FieldName = 'DESC_L_PRODUCTO'
      Size = 80
    end
    object qyConsImpaID_CREDITO_1: TFloatField
      FieldName = 'ID_CREDITO_1'
    end
    object qyConsImpaID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qyConsImpaNOMBRE: TStringField
      FieldName = 'NOMBRE'
    end
    object qyConsImpaID_EMISOR: TFloatField
      FieldName = 'ID_EMISOR'
    end
    object qyConsImpaCVE_EMISOR_NAFIN: TStringField
      FieldName = 'CVE_EMISOR_NAFIN'
      Size = 6
    end
    object qyConsImpaID_PROVEEDOR: TFloatField
      FieldName = 'ID_PROVEEDOR'
    end
    object qyConsImpaNOMBRE_EMISOR: TStringField
      FieldName = 'NOMBRE_EMISOR'
      Size = 100
    end
    object qyConsImpaCVE_TIPO_SECTOR: TStringField
      FieldName = 'CVE_TIPO_SECTOR'
      Size = 2
    end
    object qyConsImpaNOM_PROVEEDOR: TStringField
      DisplayWidth = 30
      FieldName = 'NOM_PROVEEDOR'
      Size = 80
    end
    object qyConsImpaID_PROV_NAFINSA: TFloatField
      FieldName = 'ID_PROV_NAFINSA'
    end
    object qyConsImpaSDO_INSOLUTO: TFloatField
      FieldName = 'SDO_INSOLUTO'
    end
    object qyConsImpaCVE_CALCULO: TStringField
      FieldName = 'CVE_CALCULO'
      Size = 2
    end
    object qyConsImpaNO_REFER: TFloatField
      FieldName = 'NO_REFER'
    end
    object qyConsImpaID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object qyConsImpaMORATORIOS: TFloatField
      FieldName = 'MORATORIOS'
    end
    object qyConsImpaIMP_NOMINAL: TFloatField
      FieldName = 'IMP_NOMINAL'
    end
    object qyConsImpaSDO_VIG_TOTAL: TFloatField
      FieldName = 'SDO_VIG_TOTAL'
    end
    object qyConsImpaIMP_CREDITO: TFloatField
      FieldName = 'IMP_CREDITO'
    end
    object qyConsImpaIMP_BINTER: TFloatField
      FieldName = 'IMP_BINTER'
    end
    object qyConsImpaIMP_FEGA: TFloatField
      FieldName = 'IMP_FEGA'
    end
    object qyConsImpaCVE_TIPO_CRED_BC: TFloatField
      FieldName = 'CVE_TIPO_CRED_BC'
    end
    object qyConsImpaDESC_TIPO_CRED: TStringField
      FieldName = 'DESC_TIPO_CRED'
      Size = 100
    end
    object qyConsImpaNOM_DRCN: TStringField
      FieldName = 'NOM_DRCN'
      FixedChar = True
      Size = 11
    end
    object qyConsImpaNOM_DRTR: TStringField
      FieldName = 'NOM_DRTR'
      FixedChar = True
      Size = 10
    end
    object qyConsImpaESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 6
    end
    object qyConsImpaDESC_POBLACION: TStringField
      FieldName = 'DESC_POBLACION'
      FixedChar = True
      Size = 14
    end
    object qyConsImpaIMP_FA: TFloatField
      FieldName = 'IMP_FA'
    end
    object qyConsImpaIMP_INTERES: TFloatField
      FieldName = 'IMP_INTERES'
    end
    object qyConsImpaIMP_COMISIONES: TFloatField
      FieldName = 'IMP_COMISIONES'
    end
    object qyConsImpaF_PROG_PAGO: TDateField
      FieldName = 'F_PROG_PAGO'
    end
    object qyConsImpaSTATUSRECU: TStringField
      FieldName = 'STATUS_RECU'
      Size = 15
    end
    object qyConsImpaF_ALTA_RECU: TDateTimeField
      FieldName = 'F_ALTA_RECU'
    end
  end
end
