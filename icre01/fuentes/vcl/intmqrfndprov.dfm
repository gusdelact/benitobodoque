object QrFndProv: TQrFndProv
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
  DataSet = qyConsulta
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
    127
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
  PrintIfEmpty = False
  SnapToGrid = True
  Units = Inches
  Zoom = 100
  object PageHeaderBand1: TQRBand
    Left = 48
    Top = 48
    Width = 960
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
      NomReporte = 'IntMQrFndProv'
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
  object qrDetalle: TQRBand
    Left = 48
    Top = 254
    Width = 960
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrDetalleBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      29.1041666666667
      2540)
    BandType = rbDetail
    object QRDBText16: TQRDBText
      Left = 605
      Top = 1
      Width = 20
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1600.72916666667
        2.64583333333333
        52.9166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'CVE_TIPO_TASA'
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
    object QRDBText5: TQRDBText
      Left = 6
      Top = 1
      Width = 44
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        15.875
        2.64583333333333
        116.416666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'ID_CREDITO'
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
    object QRDBText6: TQRDBText
      Left = 57
      Top = 1
      Width = 235
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        150.8125
        2.64583333333333
        621.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRDBText21: TQRDBText
      Left = 294
      Top = 1
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        777.875
        2.64583333333333
        108.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_VALOR_CRED'
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
    object QRDBText22: TQRDBText
      Left = 336
      Top = 1
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        889
        2.64583333333333
        108.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'FEC_VENC_CRED'
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
    object QRDBText3: TQRDBText
      Left = 378
      Top = 1
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1000.125
        2.64583333333333
        108.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'FEC_INICIO_INTERES'
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
    object QRDBText17: TQRDBText
      Left = 420
      Top = 1
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1111.25
        2.64583333333333
        108.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_VENCIMIENTO'
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
    object QRDBText23: TQRDBText
      Left = 465
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
        1230.3125
        2.64583333333333
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'CVE_TASA_REFER'
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
    object QRDBText24: TQRDBText
      Left = 852
      Top = 1
      Width = 23
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2254.25
        2.64583333333333
        60.8541666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DIAS_FINAL'
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
    object QRDBText26: TQRDBText
      Left = 580
      Top = 1
      Width = 20
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1534.58333333333
        2.64583333333333
        52.9166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'CVE_CALCULO'
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
    object QRDBText27: TQRDBText
      Left = 548
      Top = 1
      Width = 25
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1449.91666666667
        2.64583333333333
        66.1458333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'SOBRETASA'
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
    object QRDBText28: TQRDBText
      Left = 511
      Top = 1
      Width = 34
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1352.02083333333
        2.64583333333333
        89.9583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'TASA_APLICADA'
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
    object QRDBText29: TQRDBText
      Left = 949
      Top = 1
      Width = 8
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2510.89583333333
        2.64583333333333
        21.1666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'B_OPERADO_NAFIN'
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
    object QRDBText4: TQRDBText
      Left = 633
      Top = 1
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1674.8125
        2.64583333333333
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText9: TQRDBText
      Left = 706
      Top = 1
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1867.95833333333
        2.64583333333333
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'SDO_INSOLUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText10: TQRDBText
      Left = 779
      Top = 1
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2061.10416666667
        2.64583333333333
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'INT_DIA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText13: TQRDBText
      Left = 876
      Top = 1
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2317.75
        2.64583333333333
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'INT_ACUM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
  end
  object QRFootF_PROVISION: TQRBand
    Left = 48
    Top = 374
    Width = 960
    Height = 1
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
      2.64583333333333
      2540)
    BandType = rbGroupFooter
  end
  object QRBand4: TQRBand
    Left = 48
    Top = 132
    Width = 960
    Height = 23
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clScrollBar
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      60.8541666666667
      2540)
    BandType = rbColumnHeader
    object QRLabel53: TQRLabel
      Left = 53
      Top = 2
      Width = 240
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        140.229166666667
        5.29166666666667
        635)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cliente'
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
    object QRLabel6: TQRLabel
      Left = 779
      Top = 2
      Width = 72
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2061.10416666667
        5.29166666666667
        190.5)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Interés del Día'
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
      Left = 876
      Top = 2
      Width = 72
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2317.75
        5.29166666666667
        190.5)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Intereses Acumulados'
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
      Left = 706
      Top = 2
      Width = 72
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1867.95833333333
        5.29166666666667
        190.5)
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
    object QRLabel3: TQRLabel
      Left = 294
      Top = 12
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        777.875
        31.75
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Inicio'
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
    object QRLabel7: TQRLabel
      Left = 12
      Top = 2
      Width = 40
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        31.75
        5.29166666666667
        105.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Crédito'
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
    object QRLabel12: TQRLabel
      Left = 336
      Top = 12
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        889
        31.75
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fin'
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
      Left = 294
      Top = 2
      Width = 83
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        777.875
        5.29166666666667
        219.604166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha de Crédito'
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
    object QRLabel19: TQRLabel
      Left = 378
      Top = 12
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1000.125
        31.75
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Inicio'
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
    object QRLabel20: TQRLabel
      Left = 420
      Top = 12
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1111.25
        31.75
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fin'
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
    object QRLabel21: TQRLabel
      Left = 378
      Top = 2
      Width = 83
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1000.125
        5.29166666666667
        219.604166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha de Intereses'
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
    object QRLabel22: TQRLabel
      Left = 465
      Top = 2
      Width = 34
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1230.3125
        5.29166666666667
        89.9583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tasa'
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
    object QRLabel23: TQRLabel
      Left = 535
      Top = 2
      Width = 38
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1415.52083333333
        5.29166666666667
        100.541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Sobretasa'
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
    object QRLabel4: TQRLabel
      Left = 633
      Top = 2
      Width = 72
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1674.8125
        5.29166666666667
        190.5)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Monto Crédito'
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
    object QRLabel25: TQRLabel
      Left = 852
      Top = 2
      Width = 23
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        2254.25
        5.29166666666667
        60.8541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Días Acum.'
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
    object QRLabel24: TQRLabel
      Left = 575
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
        1521.35416666667
        5.29166666666667
        145.520833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tipo de'
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
    object QRLabel28: TQRLabel
      Left = 575
      Top = 12
      Width = 35
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1521.35416666667
        31.75
        92.6041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Cálculo'
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
    object QRLabel29: TQRLabel
      Left = 609
      Top = 12
      Width = 20
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1611.3125
        31.75
        52.9166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tasa'
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
  object QRBand5: TQRBand
    Left = 48
    Top = 155
    Width = 960
    Height = 3
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
      7.9375
      2540)
    BandType = rbColumnHeader
  end
  object FootDivisa: TQRBand
    Left = 48
    Top = 306
    Width = 960
    Height = 23
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = FootDivisaBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      60.8541666666667
      2540)
    BandType = rbGroupFooter
    object QRLabel5: TQRLabel
      Left = 280
      Top = 2
      Width = 46
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        740.833333333333
        5.29166666666667
        121.708333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Por Moneda'
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
    object QRExpr14: TQRExpr
      Left = 398
      Top = 2
      Width = 35
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        1053.04166666667
        5.29166666666667
        92.6041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'COUNT'
      FontSize = 6
    end
    object QRDBText30: TQRDBText
      Left = 440
      Top = 2
      Width = 105
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1164.16666666667
        5.29166666666667
        277.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
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
    object lbTipoCambio: TQRLabel
      Left = 538
      Top = 12
      Width = 54
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1423.45833333333
        31.75
        142.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'lbTipoCambio'
      Color = clScrollBar
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
    object QRExpr5: TQRExpr
      Left = 633
      Top = 2
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1674.8125
        5.29166666666667
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_CREDITO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr6: TQRExpr
      Left = 706
      Top = 2
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1867.95833333333
        5.29166666666667
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.SDO_INSOLUTO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr7: TQRExpr
      Left = 779
      Top = 2
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2061.10416666667
        5.29166666666667
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.INT_DIA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr8: TQRExpr
      Left = 876
      Top = 2
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2317.75
        5.29166666666667
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.INT_ACUM)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr9: TQRExpr
      Left = 633
      Top = 12
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1674.8125
        31.75
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.TOT_IMPCRED_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr10: TQRExpr
      Left = 706
      Top = 12
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1867.95833333333
        31.75
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.TOT_SDOIN_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr11: TQRExpr
      Left = 779
      Top = 12
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2061.10416666667
        31.75
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.TOT_INTDIA_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr12: TQRExpr
      Left = 876
      Top = 12
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2317.75
        31.75
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.TOT_INTACUM_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object FootProducto: TQRBand
    Left = 48
    Top = 265
    Width = 960
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = FootProductoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      29.1041666666667
      2540)
    BandType = rbGroupFooter
    object QRLabel11: TQRLabel
      Left = 280
      Top = 1
      Width = 81
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        740.833333333333
        2.64583333333333
        214.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Por Tipo de Producto'
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
    object QRExpr13: TQRExpr
      Left = 398
      Top = -1
      Width = 35
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        1053.04166666667
        -2.64583333333333
        92.6041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'COUNT'
      FontSize = 6
    end
    object QRExpr1: TQRExpr
      Left = 633
      Top = 1
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1674.8125
        2.64583333333333
        190.5)
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
      Expression = 'SUM(qyConsulta.IMP_CREDITO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr2: TQRExpr
      Left = 706
      Top = 1
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1867.95833333333
        2.64583333333333
        190.5)
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
      Expression = 'SUM(qyConsulta.SDO_INSOLUTO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr3: TQRExpr
      Left = 779
      Top = 1
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2061.10416666667
        2.64583333333333
        190.5)
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
      Expression = 'SUM(qyConsulta.INT_DIA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr4: TQRExpr
      Left = 876
      Top = 1
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2317.75
        2.64583333333333
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsulta.INT_ACUM)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object GpoPromAdm: TQRGroup
    Left = 48
    Top = 158
    Width = 960
    Height = 11
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
      29.1041666666667
      2540)
    Expression = 'qyConsulta.P_ASOC'
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel15: TQRLabel
      Left = 3
      Top = -1
      Width = 64
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        7.9375
        -2.64583333333333
        169.333333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Promotor Asociado'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText7: TQRDBText
      Left = 73
      Top = 1
      Width = 40
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        193.145833333333
        2.64583333333333
        105.833333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
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
    object QRDBText8: TQRDBText
      Left = 114
      Top = 1
      Width = 32
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        301.625
        2.64583333333333
        84.6666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'P_ASOC'
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
  object qrgPromAdmin: TQRGroup
    Left = 48
    Top = 169
    Width = 960
    Height = 11
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
      29.1041666666667
      2540)
    Expression = 'ID_PROM_ADM'
    FooterBand = qrgfPromAdmin
    Master = Owner
    ReprintOnNewPage = False
    object QRShape4: TQRShape
      Left = 0
      Top = 0
      Width = 560
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        0
        0
        1481.66666666667)
      Shape = qrsRectangle
    end
    object QRDBText20: TQRDBText
      Left = 130
      Top = 1
      Width = 43
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        343.958333333333
        2.64583333333333
        113.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'PROMADM'
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
    object QRDBText25: TQRDBText
      Left = 81
      Top = 1
      Width = 40
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        214.3125
        2.64583333333333
        105.833333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
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
    object QRLabel30: TQRLabel
      Left = 3
      Top = -1
      Width = 80
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        7.9375
        -2.64583333333333
        211.666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Promotor Administrador'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
  end
  object GpoCliente: TQRGroup
    Left = 48
    Top = 180
    Width = 960
    Height = 12
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
      31.75
      2540)
    Expression = 'qyConsulta.ID_PERSONA'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText11: TQRDBText
      Left = 114
      Top = 2
      Width = 37
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        301.625
        5.29166666666667
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'NOMBRE'
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
    object QRLabel17: TQRLabel
      Left = 3
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
        7.9375
        5.29166666666667
        156.104166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cliente Especial'
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
    object QRDBText12: TQRDBText
      Left = 73
      Top = 2
      Width = 40
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        193.145833333333
        5.29166666666667
        105.833333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'ID_PERSONA'
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
  object GpoTipoCar: TQRGroup
    Left = 48
    Top = 192
    Width = 960
    Height = 11
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
      29.1041666666667
      2540)
    Expression = 'qyConsulta.CARTERA'
    FooterBand = FootTipoCar
    Master = Owner
    ReprintOnNewPage = False
    object QRShape3: TQRShape
      Left = 2
      Top = 1
      Width = 570
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        5.29166666666667
        2.64583333333333
        1508.125)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRDBText15: TQRDBText
      Left = 3
      Top = 2
      Width = 39
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        7.9375
        5.29166666666667
        103.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'CARTERA'
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
  object GpoDivisa: TQRGroup
    Left = 48
    Top = 203
    Width = 960
    Height = 12
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
      31.75
      2540)
    Expression = 'qyConsulta.CVE_MONEDA'
    FooterBand = FootDivisa
    Master = Owner
    ReprintOnNewPage = False
    object QRShape1: TQRShape
      Left = 9
      Top = 1
      Width = 580
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        23.8125
        2.64583333333333
        1534.58333333333)
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 10
      Top = 1
      Width = 31
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        26.4583333333333
        2.64583333333333
        82.0208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda'
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
    object QRDBText2: TQRDBText
      Left = 49
      Top = 1
      Width = 40
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        129.645833333333
        2.64583333333333
        105.833333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
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
    object QRDBText1: TQRDBText
      Left = 98
      Top = 1
      Width = 62
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        259.291666666667
        2.64583333333333
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
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
  object FootTipoCar: TQRBand
    Left = 48
    Top = 329
    Width = 960
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = FootTipoCarBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      29.1041666666667
      2540)
    BandType = rbGroupFooter
    object QRLabel14: TQRLabel
      Left = 280
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
        740.833333333333
        2.64583333333333
        193.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Por Tipo de Cartera'
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
    object QRExpr15: TQRExpr
      Left = 398
      Top = -1
      Width = 35
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        1053.04166666667
        -2.64583333333333
        92.6041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'COUNT'
      FontSize = 6
    end
    object QRExpr16: TQRExpr
      Left = 633
      Top = 1
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1674.8125
        2.64583333333333
        190.5)
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
      Expression = 'SUM(qyConsulta.TOT_IMPCRED_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr17: TQRExpr
      Left = 706
      Top = 1
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1867.95833333333
        2.64583333333333
        190.5)
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
      Expression = 'SUM(qyConsulta.TOT_SDOIN_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr18: TQRExpr
      Left = 779
      Top = 1
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2061.10416666667
        2.64583333333333
        190.5)
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
      Expression = 'SUM(qyConsulta.TOT_INTDIA_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr19: TQRExpr
      Left = 876
      Top = 1
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2317.75
        2.64583333333333
        190.5)
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
      Expression = 'SUM(qyConsulta.TOT_INTACUM_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRDBText18: TQRDBText
      Left = 331
      Top = 10
      Width = 34
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        875.770833333333
        26.4583333333333
        89.9583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'CARTERA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
  end
  object SummaryBand1: TQRBand
    Left = 48
    Top = 355
    Width = 960
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = SummaryBand1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.2708333333333
      2540)
    BandType = rbSummary
    object QRLabel2: TQRLabel
      Left = 314
      Top = 7
      Width = 67
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        830.791666666667
        18.5208333333333
        177.270833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL GENERAL'
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
    object QRExpr20: TQRExpr
      Left = 633
      Top = 7
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1674.8125
        18.5208333333333
        190.5)
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
      Expression = 'SUM(qyConsulta.TOT_IMPCRED_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr21: TQRExpr
      Left = 706
      Top = 7
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1867.95833333333
        18.5208333333333
        190.5)
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
      Expression = 'SUM(qyConsulta.TOT_SDOIN_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr22: TQRExpr
      Left = 779
      Top = 7
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2061.10416666667
        18.5208333333333
        190.5)
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
      Expression = 'SUM(qyConsulta.TOT_INTDIA_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr23: TQRExpr
      Left = 876
      Top = 7
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2317.75
        18.5208333333333
        190.5)
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
      Expression = 'SUM(qyConsulta.TOT_INTACUM_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRGroupEntidad: TQRGroup
    Left = 48
    Top = 215
    Width = 960
    Height = 13
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
      34.3958333333333
      2540)
    Expression = 'qyConsulta.CVE_FND_ENT_DES'
    FooterBand = QRFooterEntidad
    Master = Owner
    ReprintOnNewPage = False
    object QRSHPTitular: TQRShape
      Left = 17
      Top = 1
      Width = 583
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        44.9791666666667
        2.64583333333333
        1542.52083333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel26: TQRLabel
      Left = 18
      Top = 2
      Width = 94
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        47.625
        5.29166666666667
        248.708333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Institución descontadora'
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
    object QRDBText32: TQRDBText
      Left = 135
      Top = 2
      Width = 63
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        357.1875
        5.29166666666667
        166.6875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_ENT_DES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
  end
  object QRGroupPrograma: TQRGroup
    Left = 48
    Top = 228
    Width = 960
    Height = 13
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
      34.3958333333333
      2540)
    Expression = 'qyConsulta.CVE_FND_PROGRAMA'
    FooterBand = QRFooterPrograma
    Master = Owner
    ReprintOnNewPage = False
    object QRShape2: TQRShape
      Left = 25
      Top = 1
      Width = 590
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        66.1458333333333
        2.64583333333333
        1561.04166666667)
      Shape = qrsRectangle
    end
    object QRLabel27: TQRLabel
      Left = 26
      Top = 1
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        68.7916666666667
        2.64583333333333
        190.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Programa de apoyo'
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
    object QRDBText34: TQRDBText
      Left = 135
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
        357.1875
        2.64583333333333
        193.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_PROGRAMA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
  end
  object GpoProducto: TQRGroup
    Left = 48
    Top = 241
    Width = 960
    Height = 13
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
      34.3958333333333
      2540)
    Expression = 'qyConsulta.CVE_PRODUCTO_CRE'
    FooterBand = FootProducto
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel8: TQRLabel
      Left = 34
      Top = 1
      Width = 36
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        89.9583333333333
        2.64583333333333
        95.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
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
    object QRDBDescProducto: TQRDBText
      Left = 81
      Top = 1
      Width = 83
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        214.3125
        2.64583333333333
        219.604166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_C_PRODUCTO'
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
    object QRDBText14: TQRDBText
      Left = 633
      Top = 0
      Width = 81
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1674.8125
        0
        214.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'CUENTA_VIGENTE_K'
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
    object QRDBText19: TQRDBText
      Left = 779
      Top = 0
      Width = 89
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2061.10416666667
        0
        235.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'CUENTA_VIGENTE_INT'
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
  object QRFooterEntidad: TQRBand
    Left = 48
    Top = 291
    Width = 960
    Height = 15
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
      39.6875
      2540)
    BandType = rbGroupFooter
    object QRLabel16: TQRLabel
      Left = 280
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
        740.833333333333
        5.29166666666667
        148.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Por Institución'
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
    object QRExpr24: TQRExpr
      Left = 398
      Top = 1
      Width = 35
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        1053.04166666667
        2.64583333333333
        92.6041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'COUNT'
      FontSize = 6
    end
    object QRExpr25: TQRExpr
      Left = 633
      Top = 2
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1674.8125
        5.29166666666667
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_CREDITO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr26: TQRExpr
      Left = 706
      Top = 2
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1867.95833333333
        5.29166666666667
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.SDO_INSOLUTO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr27: TQRExpr
      Left = 779
      Top = 2
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2061.10416666667
        5.29166666666667
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.INT_DIA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr28: TQRExpr
      Left = 876
      Top = 2
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2317.75
        5.29166666666667
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.INT_ACUM)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRFooterPrograma: TQRBand
    Left = 48
    Top = 276
    Width = 960
    Height = 15
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
      39.6875
      2540)
    BandType = rbGroupFooter
    object QRLabel18: TQRLabel
      Left = 280
      Top = 2
      Width = 88
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        740.833333333333
        5.29166666666667
        232.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Por Programa de Apoyo'
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
    object QRExpr29: TQRExpr
      Left = 398
      Top = 1
      Width = 35
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        1053.04166666667
        2.64583333333333
        92.6041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'COUNT'
      FontSize = 6
    end
    object QRExpr30: TQRExpr
      Left = 633
      Top = 2
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1674.8125
        5.29166666666667
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.IMP_CREDITO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr31: TQRExpr
      Left = 706
      Top = 2
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1867.95833333333
        5.29166666666667
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.SDO_INSOLUTO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr32: TQRExpr
      Left = 779
      Top = 2
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2061.10416666667
        5.29166666666667
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.INT_DIA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr33: TQRExpr
      Left = 876
      Top = 2
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2317.75
        5.29166666666667
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.INT_ACUM)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object qrgfPromAdmin: TQRBand
    Left = 48
    Top = 340
    Width = 960
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrgfPromAdminBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      39.6875
      2540)
    BandType = rbGroupFooter
    object QRLabel31: TQRLabel
      Left = 280
      Top = 2
      Width = 107
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        740.833333333333
        5.29166666666667
        283.104166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Por Promotor Administrador'
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
    object QRExpr34: TQRExpr
      Left = 398
      Top = 2
      Width = 35
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        1053.04166666667
        5.29166666666667
        92.6041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'COUNT'
      FontSize = 6
    end
    object QRDBText31: TQRDBText
      Left = 440
      Top = 2
      Width = 150
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1164.16666666667
        5.29166666666667
        396.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'PROMADM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRExpr36: TQRExpr
      Left = 633
      Top = 2
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1674.8125
        5.29166666666667
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.TOT_IMPCRED_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr38: TQRExpr
      Left = 706
      Top = 2
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1867.95833333333
        5.29166666666667
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.TOT_SDOIN_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr40: TQRExpr
      Left = 779
      Top = 2
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2061.10416666667
        5.29166666666667
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.TOT_INTDIA_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr42: TQRExpr
      Left = 876
      Top = 2
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2317.75
        5.29166666666667
        190.5)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clScrollBar
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsulta.TOT_INTACUM_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object qyConsulta: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      
        'SELECT B.*,       DECODE(CVE_MONEDA,800,TC_CONT_UDI*IMP_CREDITO,' +
        '840,TC_CONT_USD*IMP_CREDITO,IMP_CREDITO)TOT_IMPCRED_DIV,'
      
        '       DECODE(CVE_MONEDA,800,TC_CONT_UDI*SDO_INSOLUTO,840,TC_CON' +
        'T_USD*SDO_INSOLUTO,SDO_INSOLUTO)TOT_SDOIN_DIV,'
      
        '       DECODE(CVE_MONEDA,800,TC_CONT_UDI*INT_DIA,840,TC_CONT_USD' +
        '*INT_DIA,INT_DIA)TOT_INTDIA_DIV,'
      
        '       DECODE(CVE_MONEDA,800,TC_CONT_UDI*INT_ACUM,840,TC_CONT_US' +
        'D*INT_ACUM,INT_ACUM)TOT_INTACUM_DIV,'
      
        '       DECODE(CVE_MONEDA,800,TC_CONT_UDI*INT_ACUM_ETQ,840,TC_CON' +
        'T_USD*INT_ACUM_ETQ,INT_ACUM_ETQ)TOT_INTACUMETQ_DIV'
      '  FROM ('
      'SELECT A.*, '
      '       INT_ACUM_OPC1   INT_ACUM,'
      '       IMP_INTERES_DIA INT_DIA,'
      '       INT_ACUM_OPC1   INT_ACUM_ETQ'
      '  FROM (SELECT'
      '       '#39'CARTERA BANCARIA'#39' CARTERA, '
      '       P.CVE_PER_JURIDICA,'
      '       DECODE(P.CVE_PER_JURIDICA, '#39'PF'#39','
      
        '       PF.APELLIDO_PATERNO || '#39' '#39' || PF.APELLIDO_MATERNO || '#39' '#39' ' +
        '|| PF.NOMBRE_PERSONA,'
      '       PM.NOM_RAZON_SOCIAL ) AS NOMBRE,'
      
        '       (TO_DATE('#39'10/02/2005'#39','#39'DD/MM/YYYY'#39')-FECHA_INT.F_INICIO) d' +
        'ias_prov,'
      '       CR_CAT_MINIMO.CVE_CAT_MINIMO CVE_CAT_MIN,'
      '       CR_CAT_MINIMO.DESC_CAT_MINIMO DESC_CAT_MIN,'
      '       CONTRATO.CVE_MONEDA,'
      
        '       ((TO_DATE('#39'10/02/2005'#39','#39'DD/MM/YYYY'#39')-FECHA_INT.F_INICIO) ' +
        '+1) DIAS_FINAL,'
      '       NVL(CDH.IMP_INTERES,0) AS INT_ACUM_OPC1,'
      '       CR_FND_CREDITO.F_VENCIMIENTO FEC_VENC_CRED,'
      '       FECHA_INT.F_INICIO FEC_INICIO_INTERES,'
      '       MONEDA.DESC_MONEDA,'
      '       CRE_PARAMETRO.TC_CONT_USD,'
      '       CRE_PARAMETRO.TC_CONT_UDI,'
      '       CR_FND_CREDITO.ID_CREDITO,'
      '       CR_FND_CREDITO.CVE_CALCULO,'
      '       CR_FND_CREDITO.CVE_TIPO_TASA,'
      
        '       CR_FND_CREDITO.CVE_TASA_REFER || CR_FND_CREDITO.OPERADOR_' +
        'STASA  CVE_TASA_REFER,'
      '       CR_FND_CREDITO.F_INICIO'#9'F_VALOR_CRED,'
      '       CR_FND_HIST_CRED.IMP_CREDITO,'
      '       CR_FND_CREDITO.SOBRETASA,'
      'TO_DATE('#39'10/02/2005'#39','#39'DD/MM/YYYY'#39') F_PROVISION,'
      '       CR_FND_HIST_CRED.IMP_INTERES_DIA,'
      '       NVL(CDH.IMP_INTERES,0) AS IMP_INTERES_PER,'
      '       CR_FND_HIST_CRED.SDO_VIG_TOTAL SDO_INSOLUTO,'
      '       CR_FND_HIST_CRED.TASA_APLICADA,'
      '       FECHA_INT.F_VENCIMIENTO,'
      '       (FECHA_INT.F_VENCIMIENTO - FECHA_INT.F_INICIO)PLAZO,'
      '       P.ID_PERSONA,'
      '       CR_CREDITO.ID_PROM_ADM,'
      '       PERSONA.NOMBRE PROMADM,'
      '       CONTRATO.ID_PERS_ASOCIAD,'
      '       PASOC.NOMBRE P_ASOC,'
      '       CR_PRODUCTO.CVE_PRODUCTO_CRE,'
      '       CR_PRODUCTO.DESC_C_PRODUCTO, '
      '       CR_FND_ENT_DES.DESC_ENT_DES, '
      '       CR_FND_PROGRAMA.DESC_PROGRAMA, '
      '       CR_FND_PROGRAMA.CVE_FND_ENT_DES, '
      '       CR_FND_PROGRAMA.CVE_FND_PROGRAMA, '
      '       CR_PRODUCTO.ID_EMPRESA, '
      
        '       SUBSTR( PKGCRREDESCTO.FUNOBTCTAREDESC ( '#39'RK'#39',  CR_PRODUCT' +
        'O.CVE_PRODUCTO_GPO, '
      
        '         CCPD.TIPO_CUENTAO, CONTRATO.CVE_MONEDA ), 1, 20 ) CUENT' +
        'A_VIGENTE_K, '
      
        '       SUBSTR( PKGCRREDESCTO.FUNOBTCTAREDESC ( '#39'RI'#39',  CR_PRODUCT' +
        'O.CVE_PRODUCTO_GPO, '
      
        '         CCPD.TIPO_CUENTAO, CONTRATO.CVE_MONEDA ), 1, 20 ) CUENT' +
        'A_VIGENTE_INT '
      'FROM   CR_FND_ENT_DES,  CR_FND_PROGRAMA, '
      '       CR_FND_CREDITO, CR_CREDITO,'
      '       CR_FND_HIST_CRED,'
      '       ( SELECT ID_CREDITO, SUM(IMP_ACCESORIO) AS IMP_INTERES'
      '         FROM CR_FND_DHIS_CRED '
      
        '         WHERE 1 = 1  AND F_CIERRE = TO_DATE('#39'10/02/2005'#39','#39'DD/MM' +
        '/YYYY'#39')           AND CVE_ACCESORIO = '#39'RI'#39
      '         GROUP BY ID_CREDITO ) CDH, '
      '         PERSONA, CR_CONTRATO, CR_PRODUCTO, CONTRATO, MONEDA,'
      
        '         PERSONA P, PERSONA_FISICA PF, PERSONA_MORAL PM, PERSONA' +
        ' PASOC, CR_CAT_MINIMO,'
      
        '         (SELECT ID_CREDITO, MIN(F_INICIO)F_INICIO, MAX(F_VENCIM' +
        'IENTO)F_VENCIMIENTO'
      '          FROM  (SELECT ID_CREDITO, NUM_PERIODO,'
      
        '                        (F_VENCIMIENTO-PLAZO) F_INICIO, F_VENCIM' +
        'IENTO'
      '                 FROM   CR_FND_INTERES '
      
        '                 WHERE  (F_VENCIMIENTO-PLAZO) <= TO_DATE('#39'10/02/' +
        '2005'#39','#39'DD/MM/YYYY'#39')'
      
        '                   AND  F_VENCIMIENTO >= TO_DATE('#39'10/02/2005'#39','#39'D' +
        'D/MM/YYYY'#39')) TABLA'
      '                 GROUP BY TABLA.ID_CREDITO '
      '                 )FECHA_INT, '
      '         CR_CESION, '
      '         CR_CONT_PRODUCTO CCPD, '
      '         CRE_PARAMETRO '
      'WHERE  CR_FND_CREDITO.ID_CREDITO = CR_CREDITO.ID_CREDITO '
      '  AND  CR_FND_CREDITO.SIT_CREDITO <> '#39'CA'#39
      '  AND  CR_FND_CREDITO.ID_CREDITO = CR_FND_HIST_CRED.ID_CREDITO'
      
        '  AND  CR_FND_CREDITO.CVE_FND_ENT_DES = CR_FND_HIST_CRED.CVE_FND' +
        '_ENT_DES '
      
        '  AND  CR_FND_CREDITO.CVE_FND_PROGRAMA = CR_FND_HIST_CRED.CVE_FN' +
        'D_PROGRAMA '
      
        '  AND  CR_FND_PROGRAMA.CVE_FND_ENT_DES  = CR_FND_CREDITO.CVE_FND' +
        '_ENT_DES '
      
        '  AND  CR_FND_PROGRAMA.CVE_FND_PROGRAMA = CR_FND_CREDITO.CVE_FND' +
        '_PROGRAMA '
      
        '  AND  CR_FND_ENT_DES.CVE_FND_ENT_DES   = CR_FND_PROGRAMA.CVE_FN' +
        'D_ENT_DES '
      
        ' AND CR_FND_HIST_CRED.F_CIERRE = TO_DATE('#39'10/02/2005'#39','#39'DD/MM/YYY' +
        'Y'#39') AND CR_FND_CREDITO.ID_CREDITO = CDH.ID_CREDITO (+) '
      ' AND CR_CREDITO.ID_PROM_ADM = PERSONA.ID_PERSONA '
      ' AND CR_CREDITO.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '
      ' AND CR_CREDITO.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '
      
        ' AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE' +
        ' '
      ' AND CR_PRODUCTO.SIT_PRODUCTO <> '#39'CA'#39' '
      ' AND CR_CONTRATO.ID_CONTRATO = CONTRATO.ID_CONTRATO '
      ' AND CONTRATO.CVE_MONEDA = MONEDA.CVE_MONEDA '
      ' AND CONTRATO.ID_TITULAR = P.ID_PERSONA '
      ' AND CONTRATO.ID_TITULAR = PF.ID_PERSONA (+) '
      ' AND CONTRATO.ID_TITULAR = PM.ID_PERSONA (+) '
      ' AND CONTRATO.ID_PERS_ASOCIAD = PASOC.ID_PERSONA (+) '
      
        ' AND CR_PRODUCTO.CVE_CLAS_CONTAB = CR_CAT_MINIMO.CVE_CAT_MINIMO(' +
        '+)'
      ' AND CR_FND_CREDITO.ID_CREDITO = FECHA_INT.ID_CREDITO '
      ' AND CR_FND_CREDITO.ID_CREDITO = CR_CESION.ID_CESION(+)'
      ' AND CONTRATO.CVE_TIP_CONTRATO = CRE_PARAMETRO.CVE_TIP_CONTRATO'
      
        ' AND (CR_FND_CREDITO.F_INICIO + CR_FND_CREDITO.DIAS_PLAZO) > TO_' +
        'DATE('#39'10/02/2005'#39','#39'DD/MM/YYYY'#39')'
      ' AND CCPD.CVE_PRODUCTO_CR(+) = CR_PRODUCTO.CVE_PRODUCTO_GPO '
      ' AND CR_PRODUCTO.ID_EMPRESA=2'
      
        ' )A  WHERE 1=1 ORDER BY  A.CARTERA, A.DESC_MONEDA, A.CVE_FND_ENT' +
        '_DES, A.CVE_FND_PROGRAMA, A.CVE_PRODUCTO_CRE, A.NOMBRE, A.ID_CRE' +
        'DITO)B')
    Left = 155
    Top = 17
    object qyConsultaCARTERA: TStringField
      FieldName = 'CARTERA'
      FixedChar = True
      Size = 16
    end
    object qyConsultaCVE_PER_JURIDICA: TStringField
      FieldName = 'CVE_PER_JURIDICA'
      Size = 2
    end
    object qyConsultaNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qyConsultaDIAS_PROV: TFloatField
      FieldName = 'DIAS_PROV'
    end
    object qyConsultaCVE_CAT_MIN: TStringField
      FieldName = 'CVE_CAT_MIN'
    end
    object qyConsultaDESC_CAT_MIN: TStringField
      FieldName = 'DESC_CAT_MIN'
      Size = 250
    end
    object qyConsultaCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyConsultaDIAS_FINAL: TFloatField
      FieldName = 'DIAS_FINAL'
    end
    object qyConsultaINT_ACUM_OPC1: TFloatField
      FieldName = 'INT_ACUM_OPC1'
    end
    object qyConsultaFEC_VENC_CRED: TDateTimeField
      FieldName = 'FEC_VENC_CRED'
    end
    object qyConsultaFEC_INICIO_INTERES: TDateTimeField
      FieldName = 'FEC_INICIO_INTERES'
    end
    object qyConsultaDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyConsultaTC_CONT_USD: TFloatField
      FieldName = 'TC_CONT_USD'
    end
    object qyConsultaTC_CONT_UDI: TFloatField
      FieldName = 'TC_CONT_UDI'
    end
    object qyConsultaID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyConsultaCVE_CALCULO: TStringField
      FieldName = 'CVE_CALCULO'
      Size = 2
    end
    object qyConsultaCVE_TIPO_TASA: TStringField
      FieldName = 'CVE_TIPO_TASA'
      Size = 2
    end
    object qyConsultaCVE_TASA_REFER: TStringField
      FieldName = 'CVE_TASA_REFER'
      Size = 9
    end
    object qyConsultaF_VALOR_CRED: TDateTimeField
      FieldName = 'F_VALOR_CRED'
    end
    object qyConsultaIMP_CREDITO: TFloatField
      FieldName = 'IMP_CREDITO'
    end
    object qyConsultaSOBRETASA: TFloatField
      FieldName = 'SOBRETASA'
    end
    object qyConsultaF_PROVISION: TDateTimeField
      FieldName = 'F_PROVISION'
    end
    object qyConsultaIMP_INTERES_DIA: TFloatField
      FieldName = 'IMP_INTERES_DIA'
    end
    object qyConsultaIMP_INTERES_PER: TFloatField
      FieldName = 'IMP_INTERES_PER'
    end
    object qyConsultaSDO_INSOLUTO: TFloatField
      FieldName = 'SDO_INSOLUTO'
    end
    object qyConsultaTASA_APLICADA: TFloatField
      FieldName = 'TASA_APLICADA'
    end
    object qyConsultaF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qyConsultaPLAZO: TFloatField
      FieldName = 'PLAZO'
    end
    object qyConsultaID_PERSONA: TFloatField
      FieldName = 'ID_PERSONA'
    end
    object qyConsultaID_PROM_ADM: TFloatField
      FieldName = 'ID_PROM_ADM'
    end
    object qyConsultaPROMADM: TStringField
      FieldName = 'PROMADM'
      Size = 80
    end
    object qyConsultaID_PERS_ASOCIAD: TFloatField
      FieldName = 'ID_PERS_ASOCIAD'
    end
    object qyConsultaP_ASOC: TStringField
      FieldName = 'P_ASOC'
      Size = 80
    end
    object qyConsultaCVE_PRODUCTO_CRE: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 6
    end
    object qyConsultaDESC_C_PRODUCTO: TStringField
      FieldName = 'DESC_C_PRODUCTO'
      Size = 30
    end
    object qyConsultaDESC_ENT_DES: TStringField
      FieldName = 'DESC_ENT_DES'
      Size = 100
    end
    object qyConsultaDESC_PROGRAMA: TStringField
      FieldName = 'DESC_PROGRAMA'
      Size = 100
    end
    object qyConsultaCVE_FND_ENT_DES: TStringField
      FieldName = 'CVE_FND_ENT_DES'
      Size = 10
    end
    object qyConsultaCVE_FND_PROGRAMA: TStringField
      FieldName = 'CVE_FND_PROGRAMA'
      Size = 10
    end
    object qyConsultaID_EMPRESA: TFloatField
      FieldName = 'ID_EMPRESA'
    end
    object qyConsultaCUENTA_VIGENTE_K: TStringField
      FieldName = 'CUENTA_VIGENTE_K'
    end
    object qyConsultaCUENTA_VIGENTE_INT: TStringField
      FieldName = 'CUENTA_VIGENTE_INT'
    end
    object qyConsultaINT_ACUM: TFloatField
      FieldName = 'INT_ACUM'
    end
    object qyConsultaINT_DIA: TFloatField
      FieldName = 'INT_DIA'
    end
    object qyConsultaINT_ACUM_ETQ: TFloatField
      FieldName = 'INT_ACUM_ETQ'
    end
    object qyConsultaTOT_IMPCRED_DIV: TFloatField
      FieldName = 'TOT_IMPCRED_DIV'
    end
    object qyConsultaTOT_SDOIN_DIV: TFloatField
      FieldName = 'TOT_SDOIN_DIV'
    end
    object qyConsultaTOT_INTDIA_DIV: TFloatField
      FieldName = 'TOT_INTDIA_DIV'
    end
    object qyConsultaTOT_INTACUM_DIV: TFloatField
      FieldName = 'TOT_INTACUM_DIV'
    end
    object qyConsultaTOT_INTACUMETQ_DIV: TFloatField
      FieldName = 'TOT_INTACUMETQ_DIV'
    end
  end
end
