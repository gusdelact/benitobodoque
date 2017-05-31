object QrProvDiaria: TQrProvDiaria
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
      NomReporte = 'RepFideCtoMod'
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
    Top = 231
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
    object QRDBText5: TQRDBText
      Left = 43
      Top = 1
      Width = 39
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        113.770833333333
        2.64583333333333
        103.1875)
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
      Left = 85
      Top = 1
      Width = 220
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        224.895833333333
        2.64583333333333
        582.083333333333)
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
    object QRDBText19: TQRDBText
      Left = 6
      Top = 1
      Width = 10
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
        26.4583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'VENCIDA'
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
    object QRDBText21: TQRDBText
      Left = 314
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
        830.791666666667
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
      Left = 356
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
        941.916666666667
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
      Left = 398
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
        1053.04166666667
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
      Left = 440
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
        1164.16666666667
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
      Left = 482
      Top = 1
      Width = 39
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1275.29166666667
        2.64583333333333
        103.1875)
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
      Left = 825
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
        2182.8125
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
      Left = 599
      Top = 1
      Width = 33
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1584.85416666667
        2.64583333333333
        87.3125)
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
      Left = 555
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
        1468.4375
        2.64583333333333
        97.8958333333333)
      Alignment = taRightJustify
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
      Left = 521
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
        1378.47916666667
        2.64583333333333
        89.9583333333333)
      Alignment = taRightJustify
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
      Mask = '###.#00000'
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
      Width = 45
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
        119.0625)
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
      Left = 850
      Top = 1
      Width = 50
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        2248.95833333333
        2.64583333333333
        132.291666666667)
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
    object QRDBText25: TQRDBText
      Left = 21
      Top = 1
      Width = 17
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        55.5625
        2.64583333333333
        44.9791666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'STATUSRECU'
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
    object QRDBText31: TQRDBText
      Left = 904
      Top = 1
      Width = 39
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        2391.83333333333
        2.64583333333333
        103.1875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IVA_ACUMULADO'
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
    Top = 306
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
    object QRLabel16: TQRLabel
      Left = 3
      Top = 2
      Width = 18
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        7.9375
        5.29166666666667
        47.625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Cart. Vda'
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
    object QRLabel53: TQRLabel
      Left = 85
      Top = 2
      Width = 217
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        224.895833333333
        5.29166666666667
        574.145833333333)
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
      Left = 780
      Top = 2
      Width = 48
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        2063.75
        5.29166666666667
        127)
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
      Left = 863
      Top = 2
      Width = 27
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2283.35416666667
        5.29166666666667
        71.4375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Int Acum'
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
      Left = 707
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
        1870.60416666667
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
      Left = 314
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
        830.791666666667
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
      Left = 46
      Top = 2
      Width = 32
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        121.708333333333
        5.29166666666667
        84.6666666666667)
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
      Left = 356
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
        941.916666666667
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
      Left = 314
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
        830.791666666667
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
      Left = 398
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
        1053.04166666667
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
      Left = 440
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
        1164.16666666667
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
      Left = 398
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
        1053.04166666667
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
      Left = 520
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
        1375.83333333333
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
      Left = 559
      Top = 2
      Width = 33
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        1479.02083333333
        5.29166666666667
        87.3125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Sobre tasa'
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
      Left = 599
      Top = 2
      Width = 33
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1584.85416666667
        5.29166666666667
        87.3125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tipo de Cálculo'
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
      Left = 830
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
        2196.04166666667
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
    object QRLabel18: TQRLabel
      Left = 942
      Top = 2
      Width = 15
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2492.375
        5.29166666666667
        39.6875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'NF'
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
      Left = 22
      Top = 2
      Width = 16
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        58.2083333333333
        5.29166666666667
        42.3333333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'En'
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
    object QRLabel27: TQRLabel
      Left = 22
      Top = 10
      Width = 22
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        58.2083333333333
        26.4583333333333
        58.2083333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Recu'
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
      Left = 912
      Top = 2
      Width = 27
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2413
        5.29166666666667
        71.4375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Iva Acum'
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
    Top = 253
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
      Left = 314
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
        830.791666666667
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
      Top = 0
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
        0
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
      Top = 1
      Width = 54
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
        142.875)
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
      Left = 850
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
        2248.95833333333
        2.64583333333333
        132.291666666667)
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
      Width = 54
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
        142.875)
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
      Left = 850
      Top = 12
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2248.95833333333
        31.75
        132.291666666667)
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
    object QRExpr25: TQRExpr
      Left = 904
      Top = 1
      Width = 39
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2391.83333333333
        2.64583333333333
        103.1875)
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
      Expression = 'SUM(qyConsulta.IVA_ACUMULADO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr26: TQRExpr
      Left = 904
      Top = 12
      Width = 39
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2391.83333333333
        31.75
        103.1875)
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
      Expression = 'SUM(qyConsulta.TOT_IVAACUM_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object FootProducto: TQRBand
    Left = 48
    Top = 242
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
      Left = 314
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
        830.791666666667
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
      Font.Style = [fsBold]
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
      Font.Style = [fsBold]
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
      Width = 45
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
        119.0625)
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
      Expression = 'SUM(qyConsulta.INT_DIA)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr4: TQRExpr
      Left = 850
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
        2248.95833333333
        2.64583333333333
        132.291666666667)
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
    object QRExpr24: TQRExpr
      Left = 904
      Top = 1
      Width = 39
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2391.83333333333
        2.64583333333333
        103.1875)
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
      Expression = 'SUM(qyConsulta.IVA_ACUM)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object FootTipoCar: TQRBand
    Left = 48
    Top = 276
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
      Left = 314
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
        830.791666666667
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
      Font.Style = [fsBold]
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
      Font.Style = [fsBold]
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
      Width = 54
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
        142.875)
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
      Expression = 'SUM(qyConsulta.TOT_INTDIA_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr19: TQRExpr
      Left = 850
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
        2248.95833333333
        2.64583333333333
        132.291666666667)
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
    object QRExpr27: TQRExpr
      Left = 904
      Top = 1
      Width = 39
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2391.83333333333
        2.64583333333333
        103.1875)
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
      Expression = 'SUM(qyConsulta.TOT_IVAACUM_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object SummaryBand1: TQRBand
    Left = 48
    Top = 287
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
      Font.Style = [fsBold]
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
      Font.Style = [fsBold]
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
      Width = 54
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
        142.875)
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
      Expression = 'SUM(qyConsulta.TOT_INTDIA_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr23: TQRExpr
      Left = 850
      Top = 7
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2248.95833333333
        18.5208333333333
        132.291666666667)
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
      Expression = 'SUM(qyConsulta.TOT_INTACUM_DIV)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr28: TQRExpr
      Left = 904
      Top = 7
      Width = 39
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2391.83333333333
        18.5208333333333
        103.1875)
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
      Expression = 'SUM(qyConsulta.TOT_IVAACUM_DIV)'
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
  object GpoPromAdmon: TQRGroup
    Left = 48
    Top = 169
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
    Expression = 'qyConsulta.PROMADM'
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel26: TQRLabel
      Left = 3
      Top = -1
      Width = 62
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
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Promotor Admon:'
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
    object QRDBText14: TQRDBText
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
    object QRDBText20: TQRDBText
      Left = 114
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
        301.625
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
  end
  object GpoCliente: TQRGroup
    Left = 48
    Top = 182
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
    Top = 194
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
    Top = 205
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
    object QRLabel1: TQRLabel
      Left = 34
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
        89.9583333333333
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
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText2: TQRDBText
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
      DataField = 'CVE_MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText1: TQRDBText
      Left = 114
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
        301.625
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
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
  end
  object GpoProducto: TQRGroup
    Left = 48
    Top = 217
    Width = 960
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = GpoProductoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      37.0416666666667
      2540)
    Expression = 'qyConsulta.DESC_CAT_MIN'
    FooterBand = FootProducto
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel8: TQRLabel
      Left = 34
      Top = 1
      Width = 43
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        89.9583333333333
        2.64583333333333
        113.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Producto'
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
    object QRDBText16: TQRDBText
      Left = 81
      Top = 1
      Width = 71
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        214.3125
        2.64583333333333
        187.854166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'DESC_CAT_MIN'
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
    object lbCtaInt: TQRLabel
      Left = 854
      Top = 2
      Width = 37
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2259.54166666667
        5.29166666666667
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'lbCtaInt'
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
    object lbCtaCap: TQRLabel
      Left = 633
      Top = 2
      Width = 43
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1674.8125
        5.29166666666667
        113.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'lbCtaCap'
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
  object qyConsulta: TQuery
    DatabaseName = 'NCORP'
    SQL.Strings = (
      'SELECT'
      '0 AS PARTE ,'
      '0 AS CARTERA ,'
      '0 AS VENCIDA ,'
      '0 AS CVE_PER_JURIDICA ,'
      '0 AS NOMBRE ,'
      '0 AS F_TRASPASO_VEN ,'
      '0 AS DIAS_PROV ,'
      '0 AS CVE_CAT_MIN ,'
      '0 AS DESC_CAT_MIN ,'
      '0 AS CVE_MONEDA ,'
      '0 AS CVE_SUB_CARTERA ,'
      '0 AS DIAS_FINAL ,'
      '0 AS INT_ACUM_OPC1 ,'
      '0 AS FEC_VENC_CRED ,'
      '0 AS FEC_INICIO_INTERES ,'
      '0 AS DESC_MONEDA ,'
      '0 AS TC_CONT_USD ,'
      '0 AS TC_CONT_UDI ,'
      '0 AS CVE_SUB_TIP_BCO ,'
      '0 AS DESC_SUB_TIPO ,'
      '0 AS DESC_SUB_TIPO1 ,'
      '0 AS ID_CREDITO ,'
      '0 AS ID_CESION ,'
      '0 AS CVE_CALCULO ,'
      '0 AS CVE_TASA_REFER ,'
      '0 AS DIAS_PLAZO ,'
      '0 AS F_VALOR_CRED ,'
      '0 AS IMP_CREDITO ,'
      '0 AS SOBRETASA ,'
      '0 AS TIPO_DISPOSICION ,'
      '0 AS B_PROG_FOPYME ,'
      '0 AS B_OPERADO_NAFIN ,'
      '0 AS CTA_CONTABLE ,'
      '0 AS CTA_INTERES ,'
      '0 AS F_PROVISION ,'
      '0 AS IMP_INTERES_AYER ,'
      '0 AS IMP_INTERES_DIA ,'
      '0 AS IMP_INTERES_PER ,'
      '0 AS IVA_ACUM ,'
      '0 AS SDO_INSOLUTO ,'
      '0 AS TASA_APLICADA ,'
      '0 AS TIPO_CUENTA ,'
      '0 AS DESC_TIPO_CRED ,'
      '0 AS F_VENCIMIENTO ,'
      '0 AS PLAZO ,'
      '0 AS ID_PERSONA ,'
      '0 AS ID_PROM_ADM ,'
      '0 AS PROMADM ,'
      '0 AS ID_PERS_ASOCIAD ,'
      '0 AS P_ASOC ,'
      '0 AS CVE_PRODUCTO_CRE ,'
      '0 AS DESC_C_PRODUCTO ,'
      '0 AS ID_EMPRESA ,'
      '0 AS STATUSRECU ,'
      '0 AS INT_ACUM ,'
      '0 AS INT_DIA ,'
      '0 AS INT_ACUM_ETQ ,'
      '0 AS IVA_ACUMULADO ,'
      '0 AS TOT_IMPCRED_DIV ,'
      '0 AS TOT_SDOIN_DIV ,'
      '0 AS TOT_INTDIA_DIV ,'
      '0 AS TOT_INTACUM_DIV ,'
      '0 AS TOT_INTACUMETQ_DIV ,'
      '0 AS TOT_IVAACUM_DIV FROM DUAL')
    Left = 155
    Top = 41
    object qyConsultaPARTE: TStringField
      FieldName = 'PARTE'
      FixedChar = True
      Size = 1
    end
    object qyConsultaCARTERA: TStringField
      FieldName = 'CARTERA'
      FixedChar = True
      Size = 19
    end
    object qyConsultaVENCIDA: TStringField
      FieldName = 'VENCIDA'
      FixedChar = True
      Size = 1
    end
    object qyConsultaCVE_PER_JURIDICA: TStringField
      FieldName = 'CVE_PER_JURIDICA'
      Size = 2
    end
    object qyConsultaNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 142
    end
    object qyConsultaF_TRASPASO_VEN: TDateTimeField
      FieldName = 'F_TRASPASO_VEN'
    end
    object qyConsultaDIAS_PROV: TFloatField
      FieldName = 'DIAS_PROV'
    end
    object qyConsultaCVE_CAT_MIN: TStringField
      FieldName = 'CVE_CAT_MIN'
      Size = 10
    end
    object qyConsultaDESC_CAT_MIN: TStringField
      FieldName = 'DESC_CAT_MIN'
      Size = 60
    end
    object qyConsultaCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyConsultaCVE_SUB_CARTERA: TStringField
      FieldName = 'CVE_SUB_CARTERA'
      Size = 6
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
    object qyConsultaCVE_SUB_TIP_BCO: TFloatField
      FieldName = 'CVE_SUB_TIP_BCO'
    end
    object qyConsultaDESC_SUB_TIPO: TStringField
      FieldName = 'DESC_SUB_TIPO'
      Size = 250
    end
    object qyConsultaDESC_SUB_TIPO1: TStringField
      FieldName = 'DESC_SUB_TIPO1'
      Size = 200
    end
    object qyConsultaID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyConsultaID_CESION: TFloatField
      FieldName = 'ID_CESION'
    end
    object qyConsultaCVE_CALCULO: TStringField
      FieldName = 'CVE_CALCULO'
      Size = 2
    end
    object qyConsultaCVE_TASA_REFER: TStringField
      FieldName = 'CVE_TASA_REFER'
      Size = 8
    end
    object qyConsultaDIAS_PLAZO: TFloatField
      FieldName = 'DIAS_PLAZO'
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
    object qyConsultaTIPO_DISPOSICION: TStringField
      FieldName = 'TIPO_DISPOSICION'
      Size = 2
    end
    object qyConsultaB_PROG_FOPYME: TStringField
      FieldName = 'B_PROG_FOPYME'
      Size = 1
    end
    object qyConsultaB_OPERADO_NAFIN: TStringField
      FieldName = 'B_OPERADO_NAFIN'
      Size = 1
    end
    object qyConsultaCTA_CONTABLE: TStringField
      FieldName = 'CTA_CONTABLE'
      Size = 6
    end
    object qyConsultaCTA_INTERES: TStringField
      FieldName = 'CTA_INTERES'
      Size = 10
    end
    object qyConsultaF_PROVISION: TDateTimeField
      FieldName = 'F_PROVISION'
    end
    object qyConsultaIMP_INTERES_AYER: TFloatField
      FieldName = 'IMP_INTERES_AYER'
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
    object qyConsultaTIPO_CUENTA: TFloatField
      FieldName = 'TIPO_CUENTA'
    end
    object qyConsultaDESC_TIPO_CRED: TStringField
      FieldName = 'DESC_TIPO_CRED'
      Size = 100
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
      FixedChar = True
      Size = 1
    end
    object qyConsultaID_PERS_ASOCIAD: TFloatField
      FieldName = 'ID_PERS_ASOCIAD'
    end
    object qyConsultaP_ASOC: TStringField
      FieldName = 'P_ASOC'
      FixedChar = True
      Size = 1
    end
    object qyConsultaCVE_PRODUCTO_CRE: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      FixedChar = True
      Size = 1
    end
    object qyConsultaDESC_C_PRODUCTO: TStringField
      FieldName = 'DESC_C_PRODUCTO'
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
    object qyConsultaSTATUSRECU: TStringField
      FieldName = 'STATUSRECU'
      Size = 15
    end
    object qyConsultaIVA_ACUM: TFloatField
      FieldName = 'IVA_ACUM'
    end
    object qyConsultaID_EMPRESA: TFloatField
      FieldName = 'ID_EMPRESA'
    end
    object qyConsultaIVA_ACUMULADO: TFloatField
      FieldName = 'IVA_ACUMULADO'
    end
    object qyConsultaTOT_IVAACUM_DIV: TFloatField
      FieldName = 'TOT_IVAACUM_DIV'
    end
  end
  object InterDigDoc1: TInterDigDoc
    Support = 'star@mail.internet.com.mx'
    HostName = 'localhost'
    UserName = 'guest'
    Password = 'anonymous@mail.com.net'
    Viewfile = False
    SendTo = '/'
    DelAfterSend = False
    PgOrientation = ort_portrait
    CompFileExt = zip
    Left = 240
    Top = 48
  end
end
