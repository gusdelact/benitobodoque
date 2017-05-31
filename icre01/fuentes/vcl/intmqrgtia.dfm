object FRpIntGtia: TFRpIntGtia
  Left = 95
  Top = 155
  Width = 1053
  Height = 516
  Caption = 'FRpIntGtia'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep: TQuickRep
    Left = 1
    Top = 3
    Width = 1056
    Height = 816
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = QuickRepBeforePrint
    DataSet = qCredIntGtia
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
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
    object PageHeaderBand1: TQRBand
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
      BandType = rbPageHeader
      object qrieCredIntGtia: TQRInterEncabezado
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
        Titulo1 = 'Créditos Internos con Garantía'
        NomReporte = 'RpCredIntGtia'
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
      Height = 53
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
        140.229166666667
        2592.91666666667)
      BandType = rbColumnHeader
      object QRShape1: TQRShape
        Left = -70
        Top = 13
        Width = 1031
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333
          -185.208333333333
          34.3958333333333
          2727.85416666667)
        Shape = qrsTopAndBottom
      end
      object QRLabel1: TQRLabel
        Left = 15
        Top = 39
        Width = 26
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          39.6875
          103.1875
          68.7916666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Credito'
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
      object QRLabel2: TQRLabel
        Left = 47
        Top = 39
        Width = 30
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          124.354166666667
          103.1875
          79.375)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Contrato'
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
      object QRLabel3: TQRLabel
        Left = 99
        Top = 39
        Width = 37
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          261.9375
          103.1875
          97.8958333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Acreditado'
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
      object QRLabel4: TQRLabel
        Left = 171
        Top = 39
        Width = 29
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          452.4375
          103.1875
          76.7291666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'de Inicio'
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
      object QRLabel5: TQRLabel
        Left = 214
        Top = 39
        Width = 42
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          566.208333333333
          103.1875
          111.125)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Vencimiento'
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
      object QRLabel6: TQRLabel
        Left = 268
        Top = 39
        Width = 28
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          709.083333333333
          103.1875
          74.0833333333333)
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
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel7: TQRLabel
        Left = 426
        Top = 39
        Width = 27
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          1127.125
          103.1875
          71.4375)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Insoluto'
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
      object QRLabel13: TQRLabel
        Left = 852
        Top = 40
        Width = 128
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          2254.25
          105.833333333333
          338.666666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Valuación'
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
      object QRLabel18: TQRLabel
        Left = 171
        Top = 29
        Width = 29
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          452.4375
          76.7291666666667
          76.7291666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Fecha'
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
      object QRLabel19: TQRLabel
        Left = 214
        Top = 29
        Width = 42
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          566.208333333333
          76.7291666666667
          111.125)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Fecha de'
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
      object QRLabel20: TQRLabel
        Left = 268
        Top = 29
        Width = 28
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          709.083333333333
          76.7291666666667
          74.0833333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Tasa de'
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
      object QRLabel21: TQRLabel
        Left = 426
        Top = 29
        Width = 27
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          1127.125
          76.7291666666667
          71.4375)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Saldo'
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
      object QRShape2: TQRShape
        Left = 592
        Top = 13
        Width = 3
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.1875
          1566.33333333333
          34.3958333333333
          7.9375)
        Shape = qrsVertLine
      end
      object QRLabel17: TQRLabel
        Left = 366
        Top = 39
        Width = 43
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          968.375
          103.1875
          113.770833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'de la Línea'
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
      object QRLabel22: TQRLabel
        Left = 366
        Top = 29
        Width = 43
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          968.375
          76.7291666666667
          113.770833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Monto'
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
      object QRLabel29: TQRLabel
        Left = 4
        Top = 0
        Width = 48
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          10.5833333333333
          0
          127)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Filtrado Por:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object qrlblFilter: TQRLabel
        Left = 56
        Top = 0
        Width = 3
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          148.166666666667
          0
          7.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' '
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
      object QRLabel16: TQRLabel
        Left = 464
        Top = 29
        Width = 43
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          1227.66666666667
          76.7291666666667
          113.770833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Proporción'
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
      object QRLabel33: TQRLabel
        Left = 549
        Top = 29
        Width = 43
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          1452.5625
          76.7291666666667
          113.770833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Saldo a'
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
      object QRLabel34: TQRLabel
        Left = 549
        Top = 39
        Width = 43
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          1452.5625
          103.1875
          113.770833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Garantizar'
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
      object QRLabel28: TQRLabel
        Left = 464
        Top = 39
        Width = 43
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          1227.66666666667
          103.1875
          113.770833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'del Crédito'
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
      object QRLabel35: TQRLabel
        Left = 325
        Top = 29
        Width = 28
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          859.895833333333
          76.7291666666667
          74.0833333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Importe'
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
      object QRLabel36: TQRLabel
        Left = 319
        Top = 39
        Width = 38
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          844.020833333333
          103.1875
          100.541666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'del Crédito'
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
      object QRLabel37: TQRLabel
        Left = -1
        Top = 39
        Width = 12
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          -2.64583333333333
          103.1875
          31.75)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sit.'
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
      object QRLabel42: TQRLabel
        Left = 638
        Top = 39
        Width = 33
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          1688.04166666667
          103.1875
          87.3125)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Plazo Inv.'
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
        Left = 676
        Top = 39
        Width = 43
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          1788.58333333333
          103.1875
          113.770833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fecha Venc.'
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
        Left = 595
        Top = 39
        Width = 40
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          1574.27083333333
          103.1875
          105.833333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No. Control'
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
        Left = 595
        Top = 16
        Width = 123
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          1574.27083333333
          42.3333333333333
          325.4375)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Datos del Pagaré'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape6: TQRShape
        Left = 720
        Top = 13
        Width = 3
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.1875
          1905
          34.3958333333333
          7.9375)
        Shape = qrsVertLine
      end
      object QRLabel10: TQRLabel
        Left = 850
        Top = 14
        Width = 129
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2248.95833333333
          37.0416666666667
          341.3125)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Al Vencimiento'
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
        Left = 723
        Top = 14
        Width = 127
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1912.9375
          37.0416666666667
          336.020833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Al Corte'
        Color = clGray
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
      object QRLabel12: TQRLabel
        Left = 727
        Top = 40
        Width = 120
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          1923.52083333333
          105.833333333333
          317.5)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Valuación'
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
      object QRShape10: TQRShape
        Left = 849
        Top = 13
        Width = 1
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.1875
          2246.3125
          34.3958333333333
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRLabel25: TQRLabel
        Left = 507
        Top = 29
        Width = 43
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          1341.4375
          76.7291666666667
          113.770833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Tipo'
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
      object QRLabel26: TQRLabel
        Left = 507
        Top = 39
        Width = 43
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          1341.4375
          103.1875
          113.770833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Cambio'
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
    object QRBand1: TQRBand
      Left = 38
      Top = 272
      Width = 980
      Height = 47
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRBand1AfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        124.354166666667
        2592.91666666667)
      BandType = rbGroupFooter
      object qrExprSumImpVal3: TQRExpr
        Left = 859
        Top = 30
        Width = 11
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.75
          2272.77083333333
          79.375
          29.1041666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        OnPrint = qrExprSumImpVal3Print
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'IF((SDO_GRTIA -SUM(IMP_VALUACION)<0), '#39#39', '#39'('#39' )'
        FontSize = 7
      end
      object qrExprSumImpVal5: TQRExpr
        Left = 929
        Top = 30
        Width = 8
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.75
          2457.97916666667
          79.375
          21.1666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        OnPrint = qrExprSumImpVal5Print
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'IF((SDO_GRTIA -SUM(IMP_VALUACION)<0), '#39#39', '#39') ('#39' )'
        FontSize = 7
      end
      object qrExprSumImpVal4: TQRExpr
        Left = 872
        Top = 30
        Width = 55
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.75
          2307.16666666667
          79.375
          145.520833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        OnPrint = qrExprSumImpVal4Print
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 
          'IF((SDO_GRTIA - SUM(IMP_VALUACION)<0),((SDO_GRTIA - SUM(IMP_VALU' +
          'ACION))*(-1)),(SDO_GRTIA - SUM(IMP_VALUACION)))'
        Mask = '###,###,###,###,##0.00'
        FontSize = 7
      end
      object qrExprSumImpVal1: TQRExpr
        Left = 870
        Top = 3
        Width = 78
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          2301.875
          7.9375
          206.375)
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
        OnPrint = qrExprSumImpVal1Print
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        WordWrap = True
        Expression = 'SUM(IMP_VALUACION)'
        Mask = '###,###,###,###,##0.00'
        FontSize = 6
      end
      object QRExpr1: TQRExpr
        Left = 986
        Top = 3
        Width = 106
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          2608.79166666667
          7.9375
          280.458333333333)
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
        Transparent = False
        WordWrap = True
        Expression = 'SUM(NUEVA_VALUACION)'
        Mask = '###,###,###,###,##0.00'
        FontSize = 6
      end
      object QRShape4: TQRShape
        Left = 872
        Top = -2
        Width = 76
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.5208333333333
          2307.16666666667
          -5.29166666666667
          201.083333333333)
        Shape = qrsHorLine
      end
      object QRShape5: TQRShape
        Left = 1028
        Top = -2
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.5208333333333
          2719.91666666667
          -5.29166666666667
          171.979166666667)
        Shape = qrsHorLine
      end
      object qrExprSumImpVal6: TQRLabel
        Left = 936
        Top = 30
        Width = 12
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.75
          2476.5
          79.375
          31.75)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '%'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = qrExprSumImpVal6Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRShape7: TQRShape
        Left = 0
        Top = 45
        Width = 977
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.64583333333333
          0
          119.0625
          2584.97916666667)
        Shape = qrsRectangle
      end
      object qrExprSumImpVal7: TQRLabel
        Left = 947
        Top = 30
        Width = 27
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          2505.60416666667
          79.375
          71.4375)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrExprSumImpVal7'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = qrExprSumImpVal7Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object qrExprSumImpValCorte1: TQRExpr
        Left = 746
        Top = 3
        Width = 77
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          1973.79166666667
          7.9375
          203.729166666667)
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
        OnPrint = qrExprSumImpValCorte1Print
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        WordWrap = True
        Expression = 'SUM(IMP_VALUACION_CORTE)'
        Mask = '###,###,###,###,##0.00'
        FontSize = 6
      end
      object QRShape19: TQRShape
        Left = 849
        Top = -1
        Width = 1
        Height = 54
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          142.875
          2246.3125
          -2.64583333333333
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRShape20: TQRShape
        Left = 720
        Top = -1
        Width = 3
        Height = 54
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          142.875
          1905
          -2.64583333333333
          7.9375)
        Shape = qrsVertLine
      end
      object QRShape21: TQRShape
        Left = 747
        Top = -2
        Width = 76
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.5208333333333
          1976.4375
          -5.29166666666667
          201.083333333333)
        Shape = qrsHorLine
      end
      object QRShape26: TQRShape
        Left = 592
        Top = 0
        Width = 3
        Height = 54
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          142.875
          1566.33333333333
          0
          7.9375)
        Shape = qrsVertLine
      end
      object qrExprSumImpVal2: TQRExpr
        Left = 860
        Top = 16
        Width = 75
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.75
          2275.41666666667
          42.3333333333333
          198.4375)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        OnPrint = qrExprSumImpVal2Print
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 
          'IF((SDO_GRTIA - SUM(IMP_VALUACION)=0),'#39'GARANTIZADO'#39',IF((SDO_GRTI' +
          'A - SUM(IMP_VALUACION)<0),'#39'SOBRANTE POR'#39','#39'FALTANTE POR'#39'))'
        FontSize = 7
      end
      object qrExprSumImpValCorte3: TQRExpr
        Left = 728
        Top = 30
        Width = 11
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.75
          1926.16666666667
          79.375
          29.1041666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        OnPrint = qrExprSumImpValCorte3Print
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'IF((SDO_GRTIA -SUM(IMP_VALUACION_CORTE)<0), '#39#39', '#39'('#39' )'
        FontSize = 7
      end
      object qrExprSumImpValCorte5: TQRExpr
        Left = 798
        Top = 30
        Width = 8
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.75
          2111.375
          79.375
          21.1666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        OnPrint = qrExprSumImpValCorte5Print
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'IF((SDO_GRTIA -SUM(IMP_VALUACION_CORTE)<0), '#39#39', '#39') ('#39' )'
        FontSize = 7
      end
      object qrExprSumImpValCorte4: TQRExpr
        Left = 741
        Top = 30
        Width = 55
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.75
          1960.5625
          79.375
          145.520833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        OnPrint = qrExprSumImpValCorte4Print
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 
          'IF((SDO_GRTIA - SUM(IMP_VALUACION)<0),((SDO_GRTIA - SUM(IMP_VALU' +
          'ACION_CORTE))*(-1)),(SDO_GRTIA - SUM(IMP_VALUACION_CORTE)))'
        Mask = '###,###,###,###,##0.00'
        FontSize = 7
      end
      object qrExprSumImpValCorte6: TQRLabel
        Left = 805
        Top = 30
        Width = 12
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.75
          2129.89583333333
          79.375
          31.75)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '%'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = qrExprSumImpValCorte6Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object qrExprSumImpValCorte7: TQRLabel
        Left = 816
        Top = 30
        Width = 28
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          2159
          79.375
          74.0833333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlblPercent'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = qrExprSumImpVal7Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object qrExprSumImpValCorte2: TQRExpr
        Left = 729
        Top = 16
        Width = 75
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.75
          1928.8125
          42.3333333333333
          198.4375)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        OnPrint = qrExprSumImpValCorte2Print
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 
          'IF((SDO_GRTIA - SUM(IMP_VALUACION_CORTE)=0),'#39'GARANTIZADO'#39',IF((SD' +
          'O_GRTIA - SUM(IMP_VALUACION_CORTE)<0),'#39'SOBRANTE POR'#39','#39'FALTANTE P' +
          'OR'#39'))'
        FontSize = 7
      end
    end
    object QRFooterPromotor: TQRBand
      Left = 38
      Top = 356
      Width = 980
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRFooterPromotorAfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.2291666666667
        2592.91666666667)
      BandType = rbGroupFooter
      object QRShape3: TQRShape
        Left = 12
        Top = -3
        Width = 959
        Height = 6
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          15.875
          31.75
          -7.9375
          2537.35416666667)
        Shape = qrsHorLine
      end
    end
    object QRBandDetail: TQRBand
      Left = 38
      Top = 263
      Width = 980
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRBandDetailAfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        23.8125
        2592.91666666667)
      BandType = rbDetail
      object QRDBText12: TQRDBText
        Left = 64
        Top = 0
        Width = 42
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          169.333333333333
          0
          111.125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'OTORGANTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRDBText17: TQRDBText
        Left = 111
        Top = 0
        Width = 80
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          293.6875
          0
          211.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'NOMBRE_OTORGANTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object qrdbImp_Valuacion: TQRDBText
        Left = 871
        Top = 0
        Width = 75
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          2304.52083333333
          0
          198.4375)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'IMP_VALUACION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '###,###,###,###,##0.00'
        OnPrint = qrdbImp_ValuacionPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRDBText28: TQRDBText
        Left = 988
        Top = 0
        Width = 71
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          2614.08333333333
          0
          187.854166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'NUEVA_VALUACION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '###,###,###,###,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object qrdbPROMOTOR: TQRDBText
        Left = 344
        Top = 0
        Width = 41
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          910.166666666667
          0
          108.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'PROMOTOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRDBText14: TQRDBText
        Left = 597
        Top = 0
        Width = 34
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          1579.5625
          0
          89.9583333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'ID_PAGARE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRDBText15: TQRDBText
        Left = 640
        Top = 0
        Width = 28
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          1693.33333333333
          0
          74.0833333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'DIAS_PLAZO_PAG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRDBText16: TQRDBText
        Left = 674
        Top = 0
        Width = 44
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          1783.29166666667
          0
          116.416666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'F_VENCIMIENTO_PAG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        Mask = 'DD-MMM-YYYY'
        OnPrint = QRDBText16Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRDBText18: TQRDBText
        Left = 745
        Top = 1
        Width = 77
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          1971.14583333333
          2.64583333333333
          203.729166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'IMP_VALUACION_CORTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '###,###,###,###,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRShape17: TQRShape
        Left = 849
        Top = 0
        Width = 1
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          2246.3125
          0
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRShape18: TQRShape
        Left = 720
        Top = 0
        Width = 3
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          1905
          0
          7.9375)
        Shape = qrsVertLine
      end
      object QRShape25: TQRShape
        Left = 592
        Top = 0
        Width = 3
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.1875
          1566.33333333333
          0
          7.9375)
        Shape = qrsVertLine
      end
    end
    object QRSummary: TQRBand
      Left = 38
      Top = 366
      Width = 980
      Height = 69
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRSummaryAfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        182.5625
        2592.91666666667)
      BandType = rbSummary
      object QrRectangle: TQRShape
        Left = 7
        Top = 6
        Width = 965
        Height = 56
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          148.166666666667
          18.5208333333333
          15.875
          2553.22916666667)
        Pen.Width = 2
        Shape = qrsRectangle
      end
      object QRLabel30: TQRLabel
        Left = 262
        Top = 12
        Width = 39
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          693.208333333333
          31.75
          103.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Totales :'
        Color = clWhite
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
      object qrlblImp_Credito: TQRLabel
        Left = 331
        Top = 12
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          875.770833333333
          31.75
          209.020833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblImp_Credito'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = qrlblImp_CreditoPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object qrlblTotalSdo_Gtia: TQRLabel
        Left = 531
        Top = 12
        Width = 86
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1404.9375
          31.75
          227.541666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblTotalSdo_Gtia'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = qrlblTotalSdo_GtiaPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object qrlblTotalImp_Valuacion: TQRLabel
        Left = 800
        Top = 11
        Width = 112
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2116.66666666667
          29.1041666666667
          296.333333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblTotalImp_Valuacion'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = qrlblTotalImp_ValuacionPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object qrlblTotal: TQRLabel
        Left = 867
        Top = 27
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2293.9375
          71.4375
          119.0625)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = qrlblTotalPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object qrlblTotalSobrante: TQRLabel
        Left = 709
        Top = 28
        Width = 86
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1875.89583333333
          74.0833333333333
          227.541666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblTotalSobrante'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = qrlblTotalSobrantePrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel41: TQRLabel
        Left = 14
        Top = 11
        Width = 39
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          37.0416666666667
          29.1041666666667
          103.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Totales :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = QRLabel41Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object qrlblTotalSdo_Insoluto: TQRLabel
        Left = 427
        Top = 12
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1129.77083333333
          31.75
          256.645833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlblTotalSdo_Insoluto'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = qrlblTotalSdo_InsolutoPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object qrlblTipoCambio: TQRLabel
        Left = 14
        Top = 44
        Width = 41
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          37.0416666666667
          116.416666666667
          108.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '**********'
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
    object qrFooterAcreditado: TQRBand
      Left = 38
      Top = 319
      Width = 980
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrFooterAcreditadoAfterPrint
      AlignToBottom = False
      BeforePrint = qrFooterAcreditadoBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        97.8958333333333
        2592.91666666667)
      BandType = rbGroupFooter
      object QRShape8: TQRShape
        Left = 7
        Top = 1
        Width = 964
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.7291666666667
          18.5208333333333
          2.64583333333333
          2550.58333333333)
        Pen.Width = 2
        Shape = qrsRectangle
      end
      object QRLabel38: TQRLabel
        Left = 12
        Top = 3
        Width = 66
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          31.75
          7.9375
          174.625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total de Acreditado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRLabel38Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object qrlblAcredIMP_CREDITO: TQRLabel
        Left = 390
        Top = 14
        Width = 19
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          1031.875
          37.0416666666667
          50.2708333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0.00'
        Color = clWhite
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
      object qrlblAcredSDO_GTIA: TQRLabel
        Left = 598
        Top = 13
        Width = 19
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          1582.20833333333
          34.3958333333333
          50.2708333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0.00'
        Color = clWhite
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
      object qrlblImp_Valuacion: TQRLabel
        Left = 892
        Top = 3
        Width = 19
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2360.08333333333
          7.9375
          50.2708333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = qrlblImp_ValuacionPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object qrlblTotalGroup: TQRLabel
        Left = 892
        Top = 16
        Width = 19
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.75
          2360.08333333333
          42.3333333333333
          50.2708333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0.00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = qrlblTotalGroupPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel40: TQRLabel
        Left = 774
        Top = 13
        Width = 8
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2047.875
          34.3958333333333
          21.1666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'G'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = QRLabel40Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object qrlblGpoPercent: TQRLabel
        Left = 962
        Top = 15
        Width = 6
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          2545.29166666667
          39.6875
          15.875)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = qrlblGpoPercentPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object qrlblAcredSDO_INSOLUTO: TQRLabel
        Left = 505
        Top = 14
        Width = 19
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          1336.14583333333
          37.0416666666667
          50.2708333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0.00'
        Color = clWhite
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
    end
    object QRGrpCVE_PRESUPUESTO: TQRGroup
      Left = 38
      Top = 175
      Width = 980
      Height = 26
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
        68.7916666666667
        2592.91666666667)
      Expression = 'DESC_PRESUPUESTO'
      FooterBand = QRGrpFootCVE_PRESUPUESTO
      Master = QuickRep
      ReprintOnNewPage = False
      object QRShape27: TQRShape
        Left = 0
        Top = 3
        Width = 980
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          0
          7.9375
          2592.91666666667)
        Brush.Color = clBlack
        Shape = qrsRectangle
      end
      object qrdbDESC_PRESUPUESTO: TQRDBText
        Left = 113
        Top = 5
        Width = 487
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          298.979166666667
          13.2291666666667
          1288.52083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clBlack
        DataSet = qCredIntGtia
        DataField = 'DESC_PRESUPUESTO'
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
      object qrlbCVE_PRESUPUESTO: TQRLabel
        Left = 6
        Top = 5
        Width = 100
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          15.875
          13.2291666666667
          264.583333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Mercado Objetivo:'
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
    end
    object QRGroup1: TQRGroup
      Left = 38
      Top = 201
      Width = 980
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRGroup1AfterPrint
      AlignToBottom = False
      Color = 15000804
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        29.1041666666667
        2592.91666666667)
      Expression = 'NOMBRE_PROMOTOR'
      FooterBand = QRFooterPromotor
      Master = QuickRep
      ReprintOnNewPage = False
      object qrlblPromotor: TQRLabel
        Left = 16
        Top = 0
        Width = 34
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          42.3333333333333
          0
          89.9583333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Promotor:'
        Color = 15000804
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
      object qrdbNOMBRE_PROMOTOR: TQRDBText
        Left = 82
        Top = 0
        Width = 87
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          216.958333333333
          0
          230.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = 15000804
        DataSet = qCredIntGtia
        DataField = 'NOMBRE_PROMOTOR'
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
      object QRShape9: TQRShape
        Left = -72
        Top = 0
        Width = 1
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          -190.5
          0
          2.64583333333333)
        Shape = qrsTopAndBottom
      end
      object QRShape12: TQRShape
        Left = 849
        Top = 0
        Width = 1
        Height = 10
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          26.4583333333333
          2246.3125
          0
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRShape11: TQRShape
        Left = 720
        Top = 0
        Width = 3
        Height = 10
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          26.4583333333333
          1905
          0
          7.9375)
        Shape = qrsVertLine
      end
      object QRShape22: TQRShape
        Left = 592
        Top = 0
        Width = 3
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.1875
          1566.33333333333
          0
          7.9375)
        Shape = qrsVertLine
      end
    end
    object QRGrpNOMBRE_ACREDITADO: TQRGroup
      Left = 38
      Top = 212
      Width = 980
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRGrpNOMBRE_ACREDITADOAfterPrint
      AlignToBottom = False
      BeforePrint = QRGrpNOMBRE_ACREDITADOBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        37.0416666666667
        2592.91666666667)
      Expression = 'NOMBRE_ACREDITADO'
      FooterBand = qrFooterAcreditado
      Master = QuickRep
      ReprintOnNewPage = False
      object QRShape14: TQRShape
        Left = 849
        Top = 0
        Width = 1
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          2246.3125
          0
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRShape13: TQRShape
        Left = 720
        Top = 0
        Width = 3
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          1905
          0
          7.9375)
        Shape = qrsVertLine
      end
      object QRShape23: TQRShape
        Left = 592
        Top = 0
        Width = 3
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.1875
          1566.33333333333
          0
          7.9375)
        Shape = qrsVertLine
      end
    end
    object QRGrpAcreditado: TQRGroup
      Left = 38
      Top = 226
      Width = 980
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRGrpAcreditadoAfterPrint
      AlignToBottom = False
      BeforePrint = QRGrpAcreditadoBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        97.8958333333333
        2592.91666666667)
      Expression = 'ID_CREDITO'
      FooterBand = QRBand1
      Master = QuickRep
      ReprintOnNewPage = False
      object QRDBText1: TQRDBText
        Left = 16
        Top = 21
        Width = 56
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          42.3333333333333
          55.5625
          148.166666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'ID_CREDITO'
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
        Left = 27
        Top = 0
        Width = 40
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          71.4375
          0
          105.833333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'ID_CONTRATO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText3: TQRDBText
        Left = 69
        Top = 0
        Width = 93
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          182.5625
          0
          246.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'NOMBRE_ACREDITADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText5: TQRDBText
        Left = 155
        Top = 10
        Width = 47
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          410.104166666667
          26.4583333333333
          124.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'F_INICIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        Mask = 'DD-MMM-YYYY'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRDBText6: TQRDBText
        Left = 207
        Top = 10
        Width = 58
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          547.6875
          26.4583333333333
          153.458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'F_VENCIMIENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        Mask = 'DD-MMM-YYYY'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRDBText7: TQRDBText
        Left = 255
        Top = 10
        Width = 57
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          674.6875
          26.4583333333333
          150.8125)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'TASA_INTERES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRDBText8: TQRDBText
        Left = 412
        Top = 10
        Width = 56
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          1090.08333333333
          26.4583333333333
          148.166666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'SDO_INSOLUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '###,###,###,###,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRDBText19: TQRDBText
        Left = 360
        Top = 10
        Width = 51
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          952.5
          26.4583333333333
          134.9375)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'IMP_DISPUESTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '###,###,###,###,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object qrlblContrato: TQRLabel
        Left = 75
        Top = 24
        Width = 30
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          198.4375
          63.5
          79.375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Contrato'
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
      object qrlblOTORGANTE: TQRLabel
        Left = 110
        Top = 24
        Width = 83
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          291.041666666667
          63.5
          219.604166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Otorgante de la Caución'
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
      object QRDBText9: TQRDBText
        Left = 474
        Top = 10
        Width = 33
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          1254.125
          26.4583333333333
          87.3125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'FACT_PROPOR_GAR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '###,###,###,###,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRDBText10: TQRDBText
        Left = 546
        Top = 10
        Width = 45
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          1444.625
          26.4583333333333
          119.0625)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'SDO_GRTIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '###,###,###,###,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object qrImp_Credito: TQRDBText
        Left = 307
        Top = 10
        Width = 51
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          812.270833333333
          26.4583333333333
          134.9375)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'IMP_CREDITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '###,###,###,###,##0.00'
        OnPrint = qrImp_CreditoPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRDBText11: TQRDBText
        Left = -58
        Top = 21
        Width = 70
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          -153.458333333333
          55.5625
          185.208333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'SIT_CREDITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = QRDBText11Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblPromotor1: TQRLabel
        Left = 347
        Top = 24
        Width = 32
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          918.104166666667
          63.5
          84.6666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Promotor'
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
        Left = 849
        Top = 0
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          2246.3125
          0
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRShape16: TQRShape
        Left = 720
        Top = 0
        Width = 3
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          1905
          0
          7.9375)
        Shape = qrsVertLine
      end
      object QRShape24: TQRShape
        Left = 592
        Top = 0
        Width = 3
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.1875
          1566.33333333333
          0
          7.9375)
        Shape = qrsVertLine
      end
      object QRDBText21: TQRDBText
        Left = 1
        Top = 0
        Width = 24
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          2.64583333333333
          0
          63.5)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'CVE_ORIGEN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object qrdbCVE_MONEDA: TQRDBText
        Left = 415
        Top = 0
        Width = 28
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          1098.02083333333
          0
          74.0833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'CVE_MONEDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object qrdbDESC_MONEDA: TQRDBText
        Left = 446
        Top = 0
        Width = 62
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.1041666666667
          1180.04166666667
          0
          164.041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'DESC_MONEDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText24: TQRDBText
        Left = 510
        Top = 10
        Width = 33
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          1349.375
          26.4583333333333
          87.3125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qCredIntGtia
        DataField = 'TIPO_CAMBIO_CTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '###,###,###,###,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRLabel8: TQRLabel
        Left = 30
        Top = 12
        Width = 85
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.75
          79.375
          31.75
          224.895833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DIAS DE IMPAGO : '
        Color = clWhite
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
      object qrlblDiasImpago: TQRLabel
        Left = 116
        Top = 12
        Width = 25
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.75
          306.916666666667
          31.75
          66.1458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'XXXX'
        Color = clWhite
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
    end
    object QRGrpFootCVE_PRESUPUESTO: TQRBand
      Left = 38
      Top = 361
      Width = 980
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
        2592.91666666667)
      BandType = rbGroupFooter
    end
  end
  object qCredIntGtia: TQuery
    Left = 8
  end
  object dsCredIntGtia: TDataSource
    DataSet = qCredIntGtia
    Left = 41
  end
  object qGarantias: TQuery
    DatabaseName = 'DCORP'
    DataSource = dsCredIntGtia
    SQL.Strings = (
      'SELECT ID_REFERENCIA AS ID_CREDITO,'
      '       ID_CONTRATO,'
      
        '       SUBSTR(PkgFunProcCorp.ClientePromotor(ID_CONTRATO,'#39'NOMBRE' +
        '_CLIENTE'#39'),1,80) AS NOMBRE_OTORGANTE,'
      '       RTRIM(EMISORA) || '#39'  '#39' || SERIE AS EMISORA_SERIE,'
      
        '       SUBSTR(PkgFunProcCorp.Bursatilidad(EMISORA,SERIE,TIPO_VAL' +
        'OR,'#39'DESCRIPCION'#39'),1,16) AS BURSATILIDAD,'
      '       NUM_TITULOS_VIRT,'
      '       PREC_VALUACION,'
      
        '       ROUND( NUM_TITULOS_VIRT * PREC_VALUACION , 2 ) AS IMP_VAL' +
        'UACION,'
      '       EMISORA,'
      '       SERIE,'
      '       TIPO_VALOR'
      'FROM ('
      '      SELECT TEMP.ID_REFERENCIA, '
      '             TEMP.ID_CONTRATO, '
      '             TEMP.EMISORA, '
      '             TEMP.SERIE, '
      '             TEMP.TIPO_VALOR,'
      '             SUM(IMP_NETO_VTO) AS PREC_VALUACION'
      '      FROM ('
      '             SELECT'
      '                   CRPD.ID_CREDITO AS ID_REFERENCIA,'
      '                   CRPD.ID_CONTRATO,'
      '                   '#39'PRLV'#39' AS EMISORA,'
      '                   NULL AS SERIE,'
      '                   NULL AS TIPO_VALOR,'
      '                   0 AS NUM_TITULOS_VIRT,'
      '                   IP.IMP_NETO_VTO'
      '             FROM ADMIPROD.CR_REL_PAG_DISP CRPD,'
      '                  INV_PAGARE IP'
      '             WHERE CRPD.ID_CREDITO = :ID_CREDITO'
      '               AND CRPD.SIT_REL_PAG_DISP <> '#39'CA'#39
      '               AND IP.ID_CONTRATO = CRPD.ID_CONTRATO'
      '               AND IP.ID_PAGARE = CRPD.ID_PAGARE'
      '           ) TEMP  '
      
        '      GROUP BY TEMP.ID_REFERENCIA, TEMP.ID_CONTRATO, TEMP.EMISOR' +
        'A, TEMP.SERIE, TEMP.TIPO_VALOR'
      '     ) TEMP, GAR_PROP_EMIS GPE'
      'WHERE GPE.ID_CTO_EXTERNO = TEMP.ID_CREDITO '
      '      AND GPE.ID_CONTRATO = TEMP.ID_CONTRATO'
      '      AND GPE.EMISORA = TEMP.EMISORA'
      '      AND GPE.SERIE = TEMP.SERIE'
      '      AND GPE.TIPO_VALOR = TEMP.TIPO_VALOR')
    Left = 75
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_CREDITO'
        ParamType = ptInput
      end>
  end
  object QryTemp: TQuery
    Left = 104
  end
  object QryRESUMEN: TQuery
    Left = 133
  end
  object qryDiasVencido: TQuery
    Left = 175
    Top = 1
  end
end
