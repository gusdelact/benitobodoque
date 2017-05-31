object RepDNom: TRepDNom
  Left = 0
  Top = 0
  Width = 979
  Height = 1267
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  BeforePrint = QuickRepBeforePrint
  DataSet = qNomina
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
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
    101.6
    2794
    101.6
    2159
    50.8
    50.8
    0)
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = First
  PrintIfEmpty = False
  SnapToGrid = True
  Units = Inches
  Zoom = 120
  object QRBand1: TQRBand
    Left = 23
    Top = 46
    Width = 933
    Height = 101
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
      222.690972222222
      2057.13541666667)
    BandType = rbPageHeader
    object QRInterEncabezado1: TQRInterEncabezado
      Left = 0
      Top = 0
      Width = 933
      Height = 101
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        222.690972222222
        0
        0
        2057.13541666667)
      NomReporte = 'RepNom'
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
  object QRBand2: TQRBand
    Left = 23
    Top = 203
    Width = 933
    Height = 110
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand2BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      242.534722222222
      2057.13541666667)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 72
      Top = 1
      Width = 68
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        158.75
        2.20486111111111
        149.930555555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
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
    object QRDBText3: TQRDBText
      Left = 72
      Top = 46
      Width = 58
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        158.75
        101.423611111111
        127.881944444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'NUM_EMPLEADO'
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
      Left = 504
      Top = 1
      Width = 97
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1111.25
        2.20486111111111
        213.871527777778)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
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
    object QRDBText5: TQRDBText
      Left = 512
      Top = 31
      Width = 89
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1128.88888888889
        68.3506944444444
        196.232638888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'IMP_CAPITAL'
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
      Left = 512
      Top = 61
      Width = 89
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1128.88888888889
        134.496527777778
        196.232638888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'IMP_COMISION'
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
    object QRDBText7: TQRDBText
      Left = 512
      Top = 46
      Width = 89
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1128.88888888889
        101.423611111111
        196.232638888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'IMP_INTERES'
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
      Left = 512
      Top = 83
      Width = 89
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1128.88888888889
        183.003472222222
        196.232638888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText10: TQRDBText
      Left = 72
      Top = 31
      Width = 67
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        158.75
        68.3506944444444
        147.725694444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'CVE_PRODUCTO'
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
      Left = 0
      Top = 46
      Width = 50
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        0
        101.423611111111
        110.243055555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Empleado'
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
      Left = 0
      Top = 1
      Width = 37
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        0
        2.20486111111111
        81.5798611111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Crédito'
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
      Left = 0
      Top = 76
      Width = 46
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        0
        167.569444444444
        101.423611111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Empresa'
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
      Left = 0
      Top = 91
      Width = 49
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        0
        200.642361111111
        108.038194444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Chequera'
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
      Left = 424
      Top = 1
      Width = 77
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        934.861111111111
        2.20486111111111
        169.774305555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'F. Vencimiento'
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
      Left = 424
      Top = 16
      Width = 38
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        934.861111111111
        35.2777777777778
        83.7847222222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Periodo'
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
      Left = 424
      Top = 31
      Width = 36
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        934.861111111111
        68.3506944444444
        79.375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Capital'
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
      Left = 424
      Top = 46
      Width = 67
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        934.861111111111
        101.423611111111
        147.725694444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Interes + IVA'
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
      Left = 424
      Top = 61
      Width = 91
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        934.861111111111
        134.496527777778
        200.642361111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Comisiones + IVA'
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
    object QRLabel26: TQRLabel
      Left = 424
      Top = 83
      Width = 35
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        934.861111111111
        183.003472222222
        77.1701388888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL'
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
    object QRDBText15: TQRDBText
      Left = 400
      Top = 61
      Width = 25
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        881.944444444445
        134.496527777778
        55.1215277777778)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'SIT_COMISION'
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
      Left = 400
      Top = 46
      Width = 25
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        881.944444444445
        101.423611111111
        55.1215277777778)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'SIT_INTERES'
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
      Left = 400
      Top = 31
      Width = 25
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        881.944444444445
        68.3506944444444
        55.1215277777778)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'SIT_CAPITAL'
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
      Left = 512
      Top = 16
      Width = 89
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1128.88888888889
        35.2777777777778
        196.232638888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'NUM_PERIODO'
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
    object QRDBText24: TQRDBText
      Left = 72
      Top = 76
      Width = 353
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        158.75
        167.569444444444
        778.315972222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'EMPRESA'
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
    object QRDBText25: TQRDBText
      Left = 72
      Top = 91
      Width = 58
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        158.75
        200.642361111111
        127.881944444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'CHEQUERA'
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
      Left = 616
      Top = 16
      Width = 38
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1358.19444444444
        35.2777777777778
        83.7847222222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Periodo'
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
    object QRDBText19: TQRDBText
      Left = 712
      Top = 16
      Width = 89
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1569.86111111111
        35.2777777777778
        196.232638888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'NUM_PERIODO'
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
      Left = 0
      Top = 16
      Width = 54
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.4826388888889
        0
        35.2777777777778
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sit Crédito'
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
    object QRDBText26: TQRDBText
      Left = 72
      Top = 16
      Width = 67
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        158.75
        35.2777777777778
        147.725694444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'SIT_CREDITO'
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
      Left = 0
      Top = 61
      Width = 67
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        0
        134.496527777778
        147.725694444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sit Empleado'
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
    object QRDBText27: TQRDBText
      Left = 72
      Top = 61
      Width = 67
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        158.75
        134.496527777778
        147.725694444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'SIT_EMPLEADO'
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
    object QRLabel2: TQRLabel
      Left = 0
      Top = 31
      Width = 46
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        0
        68.3506944444444
        101.423611111111)
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
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel4: TQRLabel
      Left = 616
      Top = 1
      Width = 77
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1358.19444444444
        2.20486111111111
        169.774305555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'F. Vencimiento'
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
    object QRDBText2: TQRDBText
      Left = 712
      Top = 1
      Width = 89
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1569.86111111111
        2.20486111111111
        196.232638888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
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
    object QRLabel5: TQRLabel
      Left = 616
      Top = 31
      Width = 36
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1358.19444444444
        68.3506944444444
        79.375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Capital'
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
    object QRDBText11: TQRDBText
      Left = 712
      Top = 31
      Width = 89
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1569.86111111111
        68.3506944444444
        196.232638888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'IMP_CAP_PAG'
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
    object QRLabel7: TQRLabel
      Left = 616
      Top = 46
      Width = 67
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1358.19444444444
        101.423611111111
        147.725694444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Interes + IVA'
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
    object QRDBText12: TQRDBText
      Left = 712
      Top = 46
      Width = 89
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1569.86111111111
        101.423611111111
        196.232638888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'IMP_INT_PAG_T'
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
    object QRLabel8: TQRLabel
      Left = 616
      Top = 61
      Width = 91
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1358.19444444444
        134.496527777778
        200.642361111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Comisiones + IVA'
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
    object QRDBText13: TQRDBText
      Left = 712
      Top = 61
      Width = 89
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1569.86111111111
        134.496527777778
        196.232638888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'IMP_COM_PAG_T'
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
    object QRLabel13: TQRLabel
      Left = 616
      Top = 83
      Width = 35
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1358.19444444444
        183.003472222222
        77.1701388888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL'
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
    object QRDBText14: TQRDBText
      Left = 712
      Top = 83
      Width = 89
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1569.86111111111
        183.003472222222
        196.232638888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'IMP_PAG_T'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText20: TQRDBText
      Left = 824
      Top = 31
      Width = 89
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1816.80555555556
        68.3506944444444
        196.232638888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'DIF_CAP'
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
      Left = 824
      Top = 46
      Width = 89
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1816.80555555556
        101.423611111111
        196.232638888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'DIF_INT'
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
    object QRDBText22: TQRDBText
      Left = 824
      Top = 61
      Width = 89
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1816.80555555556
        134.496527777778
        196.232638888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'DIF_COM'
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
    object QRDBText23: TQRDBText
      Left = 824
      Top = 83
      Width = 89
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1816.80555555556
        183.003472222222
        196.232638888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'DIF_TOT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Mask = '###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object bHEmpresa: TQRGroup
    Left = 23
    Top = 185
    Width = 933
    Height = 14
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
      30.8680555555556
      2057.13541666667)
    Expression = 'qNomina.NOMBRE'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText9: TQRDBText
      Left = 10
      Top = 0
      Width = 431
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        22.0486111111111
        0
        950.295138888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qNomina
      DataField = 'NOMBRE'
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
  object ChildBand1: TQRChildBand
    Left = 23
    Top = 147
    Width = 933
    Height = 38
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
      83.7847222222222
      2057.13541666667)
    ParentBand = QRBand1
    object QRShape1: TQRShape
      Left = 0
      Top = 2
      Width = 929
      Height = 36
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375
        0
        4.40972222222222
        2048.31597222222)
      Brush.Color = clGray
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 8
      Top = 11
      Width = 66
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        17.6388888888889
        24.2534722222222
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Empleado'
      Color = clGray
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
    object QRLabel6: TQRLabel
      Left = 664
      Top = 11
      Width = 64
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1464.02777777778
        24.2534722222222
        141.111111111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cobranza'
      Color = clGray
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
    object QRLabel17: TQRLabel
      Left = 466
      Top = 11
      Width = 85
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1027.46527777778
        24.2534722222222
        187.413194444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Vencimiento'
      Color = clGray
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
    object QRLabel9: TQRLabel
      Left = 834
      Top = 11
      Width = 67
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1838.85416666667
        24.2534722222222
        147.725694444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Diferencia'
      Color = clGray
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
  object QRGroup1: TQRGroup
    Left = 23
    Top = 199
    Width = 933
    Height = 4
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroup1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      8.81944444444444
      2057.13541666667)
    Expression = 'qNomina.NBR_PERSONA'
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRBand5: TQRBand
    Left = 23
    Top = 313
    Width = 933
    Height = 112
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand5BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      246.944444444444
      2057.13541666667)
    BandType = rbSummary
    object QRShape2: TQRShape
      Left = 408
      Top = 4
      Width = 521
      Height = 101
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        222.690972222222
        899.583333333333
        8.81944444444444
        1148.73263888889)
      Brush.Color = clScrollBar
      Pen.Width = 2
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 422
      Top = 13
      Width = 47
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        930.451388888889
        28.6631944444444
        103.628472222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Capital :'
      Color = clScrollBar
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel10: TQRLabel
      Left = 422
      Top = 34
      Width = 62
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        930.451388888889
        74.9652777777778
        136.701388888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Intereses :'
      Color = clScrollBar
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel11: TQRLabel
      Left = 422
      Top = 55
      Width = 58
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        930.451388888889
        121.267361111111
        127.881944444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Seguros :'
      Color = clScrollBar
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel12: TQRLabel
      Left = 422
      Top = 76
      Width = 41
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        930.451388888889
        167.569444444444
        90.3993055555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total :'
      Color = clScrollBar
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
    object lbCapitalV: TQRLabel
      Left = 493
      Top = 13
      Width = 108
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1086.99652777778
        28.6631944444444
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Capital :'
      Color = clScrollBar
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object lbInteresV: TQRLabel
      Left = 493
      Top = 34
      Width = 108
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1086.99652777778
        74.9652777777778
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Intereses :'
      Color = clScrollBar
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object lbSegurosV: TQRLabel
      Left = 493
      Top = 55
      Width = 108
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1086.99652777778
        121.267361111111
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Seguros :'
      Color = clScrollBar
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object lbTotalV: TQRLabel
      Left = 493
      Top = 76
      Width = 108
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1086.99652777778
        167.569444444444
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total :'
      Color = clScrollBar
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
    object QRLabel16: TQRLabel
      Left = 614
      Top = 13
      Width = 47
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1353.78472222222
        28.6631944444444
        103.628472222222)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Capital :'
      Color = clScrollBar
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel29: TQRLabel
      Left = 614
      Top = 34
      Width = 62
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1353.78472222222
        74.9652777777778
        136.701388888889)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Intereses :'
      Color = clScrollBar
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel30: TQRLabel
      Left = 614
      Top = 55
      Width = 58
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1353.78472222222
        121.267361111111
        127.881944444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Seguros :'
      Color = clScrollBar
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel31: TQRLabel
      Left = 614
      Top = 76
      Width = 41
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1353.78472222222
        167.569444444444
        90.3993055555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total :'
      Color = clScrollBar
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
    object lbCapitalP: TQRLabel
      Left = 693
      Top = 13
      Width = 108
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1527.96875
        28.6631944444444
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Capital :'
      Color = clScrollBar
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object lbInteresP: TQRLabel
      Left = 693
      Top = 34
      Width = 108
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1527.96875
        74.9652777777778
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Intereses :'
      Color = clScrollBar
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object lbSegurosP: TQRLabel
      Left = 693
      Top = 55
      Width = 108
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1527.96875
        121.267361111111
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Seguros :'
      Color = clScrollBar
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object lbTotalP: TQRLabel
      Left = 693
      Top = 76
      Width = 108
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1527.96875
        167.569444444444
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total :'
      Color = clScrollBar
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
    object lbCapitalD: TQRLabel
      Left = 805
      Top = 13
      Width = 108
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1774.91319444444
        28.6631944444444
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Capital :'
      Color = clScrollBar
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object lbInteresD: TQRLabel
      Left = 805
      Top = 34
      Width = 108
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1774.91319444444
        74.9652777777778
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Intereses :'
      Color = clScrollBar
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object lbSegurosD: TQRLabel
      Left = 805
      Top = 55
      Width = 108
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1774.91319444444
        121.267361111111
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Seguros :'
      Color = clScrollBar
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object lbTotalD: TQRLabel
      Left = 805
      Top = 76
      Width = 108
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        1774.91319444444
        167.569444444444
        238.125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total :'
      Color = clScrollBar
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
  object qNomina: TQuery
    DatabaseName = 'NCORP'
    SQL.Strings = (
      '  SELECT '
      #9'  RESULT.ID_CREDITO,'
      '     RESULT.SIT_CREDITO, '
      '     RESULT.id_persona, '
      #9'  RESULT.CVE_PRODUCTO,'
      '     RESULT.NUM_EMPLEADO'#9','
      '     RESULT.SIT_EMPLEADO, '
      
        '     (PF.APELLIDO_PATERNO || '#39' '#39' || PF.APELLIDO_MATERNO || '#39' '#39' |' +
        '| PF.NOMBRE_PERSONA) AS NBR_PERSONA,'
      
        '     (PF.APELLIDO_PATERNO || '#39' '#39' || PF.APELLIDO_MATERNO || '#39' '#39' |' +
        '| PF.NOMBRE_PERSONA) AS NOMBRE,'
      '     RESULT.IMP_CAPITAL'#9','
      '     RESULT.IMP_INTERES'#9','
      '     RESULT.IMP_COMISION'#9','
      '     RESULT.IMP_TOTAL AS total,'
      '     RESULT.NUM_PERIODO, '
      #9'  RESULT.f_vencimiento,'
      '     RESULT.F_PAGO, '
      #9'  RESULT.IMP_CAP_PAG,'
      ' '#9'  RESULT.IMP_INT_PAG,'
      #9'  RESULT.IMP_IVA_INT_PAG,'
      #9'  RESULT.IMP_COM_PAG,'
      #9'  RESULT.IMP_IVA_COM_PAG,'
      #9'  RESULT.IMP_INT_PAG_T,'
      #9'  RESULT.IMP_COM_PAG_T,'
      #9'  RESULT.IMP_PAG_T,'
      #9'  RESULT.IMP_CAPITAL - RESULT.IMP_CAP_PAG AS DIF_CAP,'
      #9'  RESULT.IMP_INTERES - RESULT.IMP_INT_PAG_T AS DIF_INT,'
      #9'  RESULT.IMP_COMISION - RESULT.IMP_COM_PAG_T AS DIF_COM,'
      '     RESULT.IMP_TOTAL - RESULT.IMP_PAG_T AS DIF_TOT,'
      #9'  RESULT.SIT_CAPITAL,'
      #9'  RESULT.SIT_INTERES,'
      #9'  RESULT.SIT_COMISION,'
      
        '     SUBSTR(Pkgcrperiodo.STPObtChqCte(NULL,NULL,RESULT.ID_CREDIT' +
        'O,'#39'AC'#39','#39'AD'#39','#39'CR'#39'),1,20) CHEQUERA,'
      '     '#39'ASC GESTION SA DE CV'#39' EMPRESA'
      'FROM'
      ' ('
      '  SELECT CC.id_credito,CC.SIT_CREDITO,'
      #9#9'  TO_CHAR(CO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO,'
      #9#9'  E.ID_EMPRESA,'
      '         E.NUM_EMPLEADO,'
      '         E.SIT_EMPLEADO, '
      '         E.ID_PERSONA,'
      '         SUM(CA_CRED.IMP_CAPITAL)            AS IMP_CAPITAL,'
      
        '         SUM(CI_CRED.IMP_INTERES_PROY+CI_CRED.IMP_IVA_PROYEC) AS' +
        ' IMP_INTERES,'
      
        '         SUM(NVL(CDC_CRED.IMP_COMISION,0)+NVL(CDC_CRED.IMP_IVA,0' +
        '))   AS IMP_COMISION,'
      '         SUM(CA_CRED.IMP_CAPITAL +'
      '             CI_CRED.IMP_INTERES_PROY +'
      '             CI_CRED.IMP_IVA_PROYEC +'
      '             NVL(CDC_CRED.IMP_COMISION, 0) +'
      '             NVL(CDC_CRED.IMP_IVA,0)) AS IMP_TOTAL,'
      #9#9#9'CA_CRED.f_vencimiento,'
      '            CA_CRED.F_PAGO,'
      '           CA_CRED.NUM_PERIODO,'
      #9'        CA_CRED.IMP_CAP_PAG,'
      #9'        CI_CRED.IMP_INT_PAG,'
      #9'        CI_CRED.IMP_IVA_INT_PAG,'
      #9'        CDC_CRED.IMP_COM_PAG,'
      #9'        CDC_CRED.IMP_IVA_COM_PAG,'
      
        #9#9#9' SUM(CI_CRED.IMP_INT_PAG + CI_CRED.IMP_INT_PAG) AS IMP_INT_PA' +
        'G_T,'
      
        '         SUM(NVL(CDC_CRED.IMP_COM_PAG,0)+NVL(CDC_CRED.IMP_IVA_CO' +
        'M_PAG,0)) AS IMP_COM_PAG_T,'
      '         SUM(CA_CRED.IMP_CAP_PAG+ '
      #9'         '#9' CI_CRED.IMP_INT_PAG+ '
      #9'        '#9' CI_CRED.IMP_IVA_INT_PAG+ '
      #9'        '#9' NVL(CDC_CRED.IMP_COM_PAG, 0) + '
      #9'        '#9' NVL(CDC_CRED.IMP_IVA_COM_PAG,0)) AS IMP_PAG_T,'
      '        CA_CRED.SIT_CAPITAL,'
      '  '#9'    CI_CRED.SIT_INTERES,'
      '  '#9'    CDC_CRED.SIT_COMISION'
      '  FROM --CAPITAL DE INTERCREDITOS'
      
        #9'       ( SELECT CA.ID_CREDITO, CA.NUM_PERIODO, CA.F_PAGO, CA.IM' +
        'P_CAPITAL, ca.f_vencimiento, NVL(CT.IMP_OPERACION,0) AS IMP_CAP_' +
        'PAG, CA.SIT_CAPITAL'
      '            FROM CRE_CAPITAL CA,'
      
        #9#9'      (SELECT NVL(SUM(IMP_OPERACION),0) IMP_OPERACION, ID_CRED' +
        'ITO, NUM_PERIODO FROM CRE_TRANSACCION WHERE 1=1'
      
        '                  AND CVE_OPERACION IN ('#39'CCAPIT'#39', '#39'CAMCAP'#39', '#39'CPC' +
        'APP'#39','#39'CPCAPV'#39')'
      
        '                  AND F_PROCESO = TO_DATE('#39'14/10/2010'#39','#39'DD/MM/YY' +
        'YY'#39')'
      '                   AND SIT_TRANSACCION= '#39'AC'#39
      #9#9#9' GROUP BY IMP_OPERACION, ID_CREDITO, NUM_PERIODO'
      #9#9#9') CT'
      
        '         WHERE CA.F_VENCIMIENTO = TO_DATE('#39'14/10/2010'#39','#39'DD/MM/YY' +
        'YY'#39')'
      
        '           AND CA.SIT_CAPITAL NOT IN ('#39'TA'#39','#39'TC'#39','#39'TI'#39','#39'TL'#39','#39'TP'#39','#39 +
        'TR'#39','#39'TS'#39', '#39'CA'#39')'
      '           AND CT.ID_CREDITO (+)= CA.ID_CREDITO'
      '           AND CT.NUM_PERIODO (+)= CA.NUM_PERIODO'
      '       ) CA_CRED,'
      '       --INTERES DE INTERCREDITOS'
      
        '       ( SELECT CI.ID_CREDITO, CI.IMP_INTERES_PROY, CI.IMP_IVA_P' +
        'ROYEC, NVL(CT.IMP_OPERACION,0) AS IMP_INT_PAG, NVL(CT2.IMP_OPERA' +
        'CION,0) AS IMP_IVA_INT_PAG, CI.SIT_INTERES'
      '         FROM CRE_INTERES CI,'
      
        #9#9#9'      (SELECT NVL(SUM(IMP_OPERACION),0) IMP_OPERACION, ID_CRE' +
        'DITO, NUM_PERIODO FROM CRE_TRANSACCION WHERE 1=1'
      
        '                  AND CVE_OPERACION IN ('#39'CAMINT'#39', '#39'CPINTP'#39', '#39'CPI' +
        'NTV'#39', '#39'AMOINT'#39')'
      
        '                  AND F_PROCESO = TO_DATE('#39'14/10/2010'#39','#39'DD/MM/YY' +
        'YY'#39')'
      '                  AND SIT_TRANSACCION= '#39'AC'#39
      #9#9#9#9#9'GROUP BY IMP_OPERACION, ID_CREDITO, NUM_PERIODO'
      #9#9#9#9#9'  ) CT,'
      
        #9#9#9'      (SELECT NVL(SUM(IMP_OPERACION),0) IMP_OPERACION, ID_CRE' +
        'DITO, NUM_PERIODO FROM CRE_TRANSACCION WHERE 1=1'
      
        '                  AND CVE_OPERACION IN ('#39'CAMIVA'#39', '#39'CPIVAP'#39', '#39'CPI' +
        'VAV'#39')'
      
        '                  AND F_PROCESO = TO_DATE('#39'14/10/2010'#39','#39'DD/MM/YY' +
        'YY'#39')'
      '                   AND SIT_TRANSACCION= '#39'AC'#39
      #9#9#9#9#9'GROUP BY IMP_OPERACION, ID_CREDITO, NUM_PERIODO'
      #9#9#9#9#9'  ) CT2'
      
        '         WHERE CI.F_VENCIMIENTO = TO_DATE('#39'14/10/2010'#39','#39'DD/MM/YY' +
        'YY'#39')'
      
        '           AND CI.SIT_INTERES NOT IN ('#39'TA'#39','#39'TC'#39','#39'TI'#39','#39'TL'#39','#39'TP'#39','#39 +
        'TR'#39','#39'TS'#39', '#39'CA'#39')'
      '           AND CT.ID_CREDITO (+)= CI.ID_CREDITO'
      '           AND CT.NUM_PERIODO (+)= CI.NUM_PERIODO'
      '           AND CT2.ID_CREDITO (+)= CI.ID_CREDITO'
      '           AND CT2.NUM_PERIODO (+)= CI.NUM_PERIODO'
      '       ) CI_CRED,'
      '       -- COMISIONES DE INTERCREDITOS'
      
        '       ( SELECT CDC.ID_CREDITO, CDC.IMP_COMISION, CDC.IMP_IVA, N' +
        'VL(CT.IMP_OPERACION,0) AS IMP_COM_PAG, 0 AS IMP_IVA_COM_PAG, CDC' +
        '.SIT_COMISION'
      '         FROM CRE_DET_COMISION CDC,'
      
        '              (SELECT NVL(SUM(IMP_OPERACION),0) IMP_OPERACION, I' +
        'D_CREDITO, NUM_PERIODO FROM CRE_TRANSACCION WHERE 1=1'
      
        '                  AND CVE_OPERACION IN ('#39'CPSVEM'#39','#39'CPSVEI'#39', '#39'CPSV' +
        'EP'#39', '#39'CPSVEI'#39')'
      
        '                  AND F_PROCESO = TO_DATE('#39'14/10/2010'#39','#39'DD/MM/YY' +
        'YY'#39')'
      '                   AND SIT_TRANSACCION= '#39'AC'#39
      #9#9#9#9#9'GROUP BY IMP_OPERACION, ID_CREDITO, NUM_PERIODO'
      #9#9#9#9#9'  ) CT'
      
        '         WHERE CDC.F_VENCIMIENTO = TO_DATE('#39'14/10/2010'#39','#39'DD/MM/Y' +
        'YYY'#39')'
      
        '           AND CDC.SIT_COMISION NOT IN ('#39'TA'#39','#39'TC'#39','#39'TI'#39','#39'TL'#39','#39'TP'#39 +
        ','#39'TR'#39','#39'TS'#39', '#39'CA'#39')'
      '           AND CT.ID_CREDITO (+)= CDC.ID_CREDITO'
      '           AND CT.NUM_PERIODO (+)= CDC.NUM_PERIODO'
      '       ) CDC_CRED,'
      '        CRE_CREDITO CC,'
      '        CRE_CONTRATO CO,'
      '        CONTRATO CTO,'
      
        '        ( SELECT E.ID_EMPRESA, E.ID_PERSONA, E.NUM_EMPLEADO, E.S' +
        'IT_EMPLEADO '
      '          FROM EMPLEADO E'
      '          WHERE E.ID_EMPRESA = 1'
      '        ) E'
      '  WHERE 1=1'
      '    AND CC.SIT_CREDITO = '#39'AC'#39
      '    AND CA_CRED.ID_CREDITO (+)= CC.ID_CREDITO'
      '    AND CI_CRED.ID_CREDITO (+)= CC.ID_CREDITO'
      '    AND CDC_CRED.ID_CREDITO (+)= CC.ID_CREDITO'
      '    AND CO.ID_CONTRATO = CC.ID_CONTRATO'
      '    AND CO.CVE_SUB_TIP_BCO  IN ('
      
        '                                 SELECT TO_NUMBER(CVE_CLAVE) AS ' +
        'CVE_SUB_TIP_BCO'
      '                                 FROM CR_CON_CAT_DATA'
      
        '                                 WHERE CVE_CON_GPO_CAT = '#39'CAT_PR' +
        'OD_ABCD_C'#39
      '                               )'
      '    AND CTO.ID_CONTRATO = CC.ID_CONTRATO'
      '    AND E.ID_PERSONA(+) = CTO.ID_TITULAR'
      
        '  GROUP BY cc.id_credito,CC.SIT_CREDITO,E.ID_EMPRESA, E.NUM_EMPL' +
        'EADO, E.ID_PERSONA, E.SIT_EMPLEADO,CA_CRED.f_vencimiento, CO.CVE' +
        '_SUB_TIP_BCO,'
      
        #9'        CA_CRED.IMP_CAP_PAG, CI_CRED.IMP_INT_PAG, CI_CRED.IMP_I' +
        'VA_INT_PAG, CDC_CRED.IMP_COM_PAG, CDC_CRED.IMP_IVA_COM_PAG,'
      
        '        CA_CRED.SIT_CAPITAL, CI_CRED.SIT_INTERES, CDC_CRED.SIT_C' +
        'OMISION, CA_CRED.F_PAGO,CA_CRED.NUM_PERIODO '
      'UNION'
      '  SELECT cc.id_credito,CC.SIT_CREDITO,'
      #9#9'  TO_CHAR(CO.CVE_PRODUCTO_CRE) AS CVE_PRODUCTO,'
      #9#9'  E.ID_EMPRESA,'
      '         E.NUM_EMPLEADO,'
      '         E.SIT_EMPLEADO, '
      '         E.ID_PERSONA,'
      '         SUM(CA_ICRE.IMP_CAPITAL)            AS IMP_CAPITAL,'
      
        '         SUM(CI_ICRE.IMP_INTERES_PROY+CI_ICRE.IMP_IVA_PROY)  AS ' +
        'IMP_INTERES,'
      
        '         SUM(NVL(CDC_ICRE.IMP_COMISION,0)+NVL(CDC_ICRE.IMP_IVA,0' +
        '))   AS IMP_COMISION,'
      '         SUM(CA_ICRE.IMP_CAPITAL +'
      '             CI_ICRE.IMP_INTERES_PROY +'
      '             CI_ICRE.IMP_IVA_PROY +'
      '             NVL(CDC_ICRE.IMP_COMISION, 0) +'
      '             NVL(CDC_ICRE.IMP_IVA,0)) AS IMP_TOTAL,'
      #9#9#9'CA_ICRE.f_vencimiento,'
      '           CA_ICRE.F_PAGO,'
      '           CA_ICRE.NUM_PERIODO,'
      #9'        CA_ICRE.IMP_CAP_PAG,'
      #9'        CI_ICRE.IMP_INT_PAG,'
      #9'        CI_ICRE.IMP_IVA_INT_PAG,'
      #9'        CDC_ICRE.IMP_COM_PAG,'
      #9'        CDC_ICRE.IMP_IVA_COM_PAG,'
      
        '            SUM(CI_ICRE.IMP_INT_PAG + CI_ICRE.IMP_IVA_INT_PAG) A' +
        'S IMP_INT_PAG_T,'
      
        '            SUM(NVL(CDC_ICRE.IMP_COM_PAG,0)+NVL(CDC_ICRE.IMP_IVA' +
        '_COM_PAG,0))   AS IMP_COM_PAG_T,'
      '            SUM(CA_ICRE.IMP_CAP_PAG+ '
      #9'         '#9' CI_ICRE.IMP_INT_PAG+ '
      #9'        '#9' CI_ICRE.IMP_IVA_INT_PAG+ '
      #9'        '#9' NVL(CDC_ICRE.IMP_COM_PAG, 0) +'
      ' '#9'        '#9' NVL(CDC_ICRE.IMP_IVA_COM_PAG,0)) AS IMP_PAG_T,'
      '        CA_ICRE.SIT_CAPITAL,'
      '  '#9'    CI_ICRE.SIT_INTERES,'
      '  '#9'    CDC_ICRE.SIT_COMISION'
      '  FROM --CAPITAL EN ICRE'
      
        #9'       ( SELECT CA.ID_CREDITO, CA.IMP_CAPITAL, CA.NUM_PERIODO, ' +
        'CA.F_PAGO, ca.f_vencimiento, NVL(CT.IMP_CONCEPTO,0) IMP_CAP_PAG,' +
        ' CA.SIT_CAPITAL'
      '         FROM ( SELECT CC.ID_CREDITO'
      '                FROM ('
      '                       SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE'
      '                       FROM CR_CON_CAT_DATA'
      '                       WHERE CVE_CON_GPO_CAT = '#39'CAT_PROD_ABCD'#39
      '                     ) CPROD_ICRE,'
      '                     CR_CREDITO CC,'
      '                     CR_CONTRATO CO'
      
        '                WHERE CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRODU' +
        'CTO_CRE'
      '                  AND CC.ID_CONTRATO = CO.ID_CONTRATO'
      '                  AND CC.SIT_CREDITO = '#39'AC'#39
      '              ) CC,'
      '              CR_CAPITAL CA,'
      
        '              ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO' +
        ', CT.ID_CREDITO, CT.ID_PERIODO'
      '                  FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'
      '                 WHERE 1=1'
      '                   AND  CDT.ID_TRANSACCION = CT.ID_TRANSACCION'
      '                   AND CDT.CVE_OPERACION = CT.CVE_OPERACION'
      '                   AND CT.CVE_OPERACION IN ('#39'PAGOCP'#39')'
      '                   AND CDT.CVE_CONCEPTO IN ('#39'IMPBRU'#39')'
      
        '                   AND CT.F_VALOR = TO_DATE('#39'14/10/2010'#39','#39'DD/MM/' +
        'YYYY'#39')'
      '        '#9#9'AND SIT_TRANSACCION= '#39'AC'#39
      #9#9#9'AND ID_TRANS_CANCELA IS NULL '
      '              GROUP BY IMP_CONCEPTO, ID_CREDITO, ID_PERIODO'
      '              ) CT'
      '         WHERE CA.ID_CREDITO = CC.ID_CREDITO'
      
        '           AND CA.F_VENCIMIENTO = TO_DATE('#39'14/10/2010'#39','#39'DD/MM/YY' +
        'YY'#39')'
      '           AND CA.SIT_CAPITAL NOT IN ('#39'CA'#39')'
      '           AND CT.ID_CREDITO (+)= CA.ID_CREDITO'
      #9#9#9'   AND CT.ID_PERIODO = CA.NUM_PERIODO'
      '       ) CA_ICRE,'
      #9#9'   --INTERES EN ICRE'
      
        '       ( SELECT CI.ID_CREDITO, CI.IMP_INTERES_PROY, CI.IMP_IVA_P' +
        'ROY, NVL(CT.IMP_CONCEPTO,0) AS IMP_INT_PAG, NVL(CT2.IMP_CONCEPTO' +
        ',0) AS IMP_IVA_INT_PAG, CI.SIT_INTERES'
      '         FROM ( SELECT CC.ID_CREDITO'
      '                FROM ('
      '                       SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE'
      '                       FROM CR_CON_CAT_DATA'
      '                       WHERE CVE_CON_GPO_CAT = '#39'CAT_PROD_ABCD'#39
      '                     ) CPROD_ICRE,'
      '                     CR_CREDITO CC,'
      '                     CR_CONTRATO CO'
      
        '                WHERE CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRODU' +
        'CTO_CRE'
      '                  AND CC.ID_CONTRATO = CO.ID_CONTRATO'
      '                  AND CC.SIT_CREDITO = '#39'AC'#39
      '              )  CC,'
      '              CR_INTERES CI,'
      
        '              ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO' +
        ', CT.ID_CREDITO, CT.ID_PERIODO'
      '                  FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'
      '                 WHERE 1=1'
      '                   AND  CDT.ID_TRANSACCION = CT.ID_TRANSACCION'
      '                   AND CDT.CVE_OPERACION = CT.CVE_OPERACION'
      '                   AND CT.CVE_OPERACION IN ('#39'PAGOIN'#39')'
      '                   AND CDT.CVE_CONCEPTO IN ('#39'IMPBRU'#39')'
      
        '                   AND CT.F_VALOR = TO_DATE('#39'14/10/2010'#39','#39'DD/MM/' +
        'YYYY'#39')'
      '    '#9#9'AND SIT_TRANSACCION= '#39'AC'#39
      #9#9#9'AND ID_TRANS_CANCELA IS NULL '
      '              GROUP BY IMP_CONCEPTO, ID_CREDITO, ID_PERIODO'
      '              ) CT,'
      
        '              ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO' +
        ', CT.ID_CREDITO, CT.ID_PERIODO'
      '                  FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'
      '                 WHERE 1=1'
      '                   AND  CDT.ID_TRANSACCION = CT.ID_TRANSACCION'
      '                   AND CDT.CVE_OPERACION = CT.CVE_OPERACION'
      '                   AND CT.CVE_OPERACION IN ('#39'PAGOIN'#39')'
      '                   AND CDT.CVE_CONCEPTO IN ('#39'IMPIVA'#39')'
      
        '                   AND CT.F_VALOR = TO_DATE('#39'14/10/2010'#39','#39'DD/MM/' +
        'YYYY'#39')'
      '        '#9#9'AND SIT_TRANSACCION= '#39'AC'#39
      #9#9#9'AND ID_TRANS_CANCELA IS NULL '
      '              GROUP BY IMP_CONCEPTO, ID_CREDITO, ID_PERIODO'
      '              ) CT2'
      '         WHERE CI.ID_CREDITO = CC.ID_CREDITO'
      
        '           AND CI.F_VENCIMIENTO = TO_DATE('#39'14/10/2010'#39','#39'DD/MM/YY' +
        'YY'#39')'
      '           AND CI.SIT_INTERES NOT IN ('#39'CA'#39')'
      '           AND CT.ID_CREDITO (+)= CI.ID_CREDITO'
      #9#9'AND CT.ID_PERIODO (+)= CI.NUM_PERIODO'
      '           AND CT2.ID_CREDITO (+)= CI.ID_CREDITO'
      #9#9'AND CT2.ID_PERIODO (+)= CI.NUM_PERIODO'
      '       ) CI_ICRE,'
      #9#9'   --COMISION EN ICRE'
      
        '       ( SELECT CDC.ID_CREDITO, CDC.SIT_COMISION, SUM(CDC.IMP_CO' +
        'MISION) AS IMP_COMISION, SUM(CDC.IMP_IVA) AS  IMP_IVA, SUM(CT.IM' +
        'P_CONCEPTO) AS IMP_COM_PAG, SUM(CT2.IMP_CONCEPTO) AS IMP_IVA_COM' +
        '_PAG'
      '         FROM ( SELECT CC.ID_CREDITO'
      '                FROM ('
      '                       SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE'
      '                       FROM CR_CON_CAT_DATA'
      '                       WHERE CVE_CON_GPO_CAT = '#39'CAT_PROD_ABCD'#39
      '                     ) CPROD_ICRE,'
      '                     CR_CREDITO CC,'
      '                     CR_CONTRATO CO'
      
        '                WHERE CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRODU' +
        'CTO_CRE'
      '                  AND CC.ID_CONTRATO = CO.ID_CONTRATO'
      '                  AND CC.SIT_CREDITO = '#39'AC'#39
      '              )  CC,'
      '              CR_COMISION CDC,'
      
        '              ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO' +
        ', CT.ID_CREDITO, CT.ID_PERIODO'
      '                  FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'
      '                 WHERE 1=1'
      '                   AND  CDT.ID_TRANSACCION = CT.ID_TRANSACCION'
      '                   AND CDT.CVE_OPERACION = CT.CVE_OPERACION'
      '                   AND CT.CVE_OPERACION IN ('#39'PAGOCN'#39')'
      '                   AND CDT.CVE_CONCEPTO IN ('#39'IMPBRU'#39')'
      
        '                   AND CT.F_VALOR = TO_DATE('#39'14/10/2010'#39','#39'DD/MM/' +
        'YYYY'#39')'
      '        '#9#9'AND SIT_TRANSACCION= '#39'AC'#39
      #9#9#9'AND ID_TRANS_CANCELA IS NULL '
      '              GROUP BY IMP_CONCEPTO, ID_CREDITO, ID_PERIODO'
      '              ) CT,'
      
        '              ( SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) IMP_CONCEPTO' +
        ', CT.ID_CREDITO, CT.ID_PERIODO'
      '                  FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'
      '                 WHERE 1=1'
      '                   AND  CDT.ID_TRANSACCION = CT.ID_TRANSACCION'
      '                   AND CDT.CVE_OPERACION = CT.CVE_OPERACION'
      '                   AND CT.CVE_OPERACION IN ('#39'PAGOCN'#39')'
      '                   AND CDT.CVE_CONCEPTO IN ('#39'IMPIVA'#39')'
      
        '                   AND CT.F_VALOR = TO_DATE('#39'14/10/2010'#39','#39'DD/MM/' +
        'YYYY'#39')'
      '        '#9#9'AND SIT_TRANSACCION= '#39'AC'#39
      #9#9#9'AND ID_TRANS_CANCELA IS NULL '
      '              GROUP BY IMP_CONCEPTO, ID_CREDITO, ID_PERIODO'
      '              ) CT2'
      '         WHERE CDC.ID_CREDITO = CC.ID_CREDITO'
      
        '           AND CDC.F_VENCIMIENTO = TO_DATE('#39'14/10/2010'#39','#39'DD/MM/Y' +
        'YYY'#39')'
      '           AND CDC.SIT_COMISION NOT IN ('#39'CA'#39')'
      '           AND CT.ID_CREDITO (+)= CDC.ID_CREDITO'
      #9#9'AND CT.ID_PERIODO (+)= CDC.NUM_PERIODO'
      '           AND CT2.ID_CREDITO (+)= CDC.ID_CREDITO'
      #9#9'AND CT2.ID_PERIODO (+)= CDC.NUM_PERIODO'
      '         GROUP BY CDC.ID_CREDITO, CDC.SIT_COMISION'
      '       ) CDC_ICRE,'
      '        CR_CREDITO CC,'
      '        CR_CONTRATO CO,'
      '        CONTRATO CTO,'
      
        '        ( SELECT E.ID_EMPRESA, ID_PERSONA, E.NUM_EMPLEADO, E.SIT' +
        '_EMPLEADO'
      '          FROM EMPLEADO E'
      '           WHERE E.ID_EMPRESA = 1'
      '        ) E,'
      '        ('
      '          SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE'
      '          FROM CR_CON_CAT_DATA'
      '          WHERE CVE_CON_GPO_CAT = '#39'CAT_PROD_ABCD'#39
      '        ) CPROD_ICRE'
      '  WHERE 1=1'
      '    AND CC.SIT_CREDITO = '#39'AC'#39
      '    AND CA_ICRE.ID_CREDITO (+)= CC.ID_CREDITO'
      '    AND CI_ICRE.ID_CREDITO (+)= CC.ID_CREDITO'
      '    AND CDC_ICRE.ID_CREDITO (+)= CC.ID_CREDITO'
      '    AND CO.ID_CONTRATO = CC.ID_CONTRATO'
      '    AND CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRODUCTO_CRE'
      '    AND CTO.ID_CONTRATO = CC.ID_CONTRATO'
      '    AND E.ID_PERSONA(+) = CTO.ID_TITULAR'
      
        '  GROUP BY cc.id_credito,CC.SIT_CREDITO, E.ID_EMPRESA, E.NUM_EMP' +
        'LEADO, E.ID_PERSONA, E.SIT_EMPLEADO,CA_ICRE.f_vencimiento, CO.CV' +
        'E_PRODUCTO_CRE,'
      
        #9'        CA_ICRE.IMP_CAP_PAG, CI_ICRE.IMP_INT_PAG, CI_ICRE.IMP_I' +
        'VA_INT_PAG, CDC_ICRE.IMP_COM_PAG, CDC_ICRE.IMP_IVA_COM_PAG,'
      
        '        CA_ICRE.SIT_CAPITAL, CI_ICRE.SIT_INTERES, CDC_ICRE.SIT_C' +
        'OMISION,CA_ICRE.F_PAGO,CA_ICRE.NUM_PERIODO'
      ')  RESULT,'
      'PERSONA_FISICA PF'
      'WHERE PF.ID_PERSONA = RESULT.ID_PERSONA'
      '  ORDER BY NOMBRE ')
    Left = 72
    Top = 16
    object qNominaID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qNominaNUM_EMPLEADO: TFloatField
      FieldName = 'NUM_EMPLEADO'
    end
    object qNominaNBR_PERSONA: TStringField
      FieldName = 'NBR_PERSONA'
      Size = 62
    end
    object qNominaIMP_CAPITAL: TFloatField
      FieldName = 'IMP_CAPITAL'
    end
    object qNominaTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object qNominaNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qNominaF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qNominaIMP_INTERES: TFloatField
      FieldName = 'IMP_INTERES'
    end
    object qNominaIMP_COMISION: TFloatField
      FieldName = 'IMP_COMISION'
    end
    object qNominaCVE_PRODUCTO: TStringField
      FieldName = 'CVE_PRODUCTO'
      Size = 40
    end
    object qNominaIMP_CAP_PAG: TFloatField
      FieldName = 'IMP_CAP_PAG'
    end
    object qNominaIMP_INT_PAG: TFloatField
      FieldName = 'IMP_INT_PAG'
    end
    object qNominaIMP_IVA_INT_PAG: TFloatField
      FieldName = 'IMP_IVA_INT_PAG'
    end
    object qNominaIMP_COM_PAG: TFloatField
      FieldName = 'IMP_COM_PAG'
    end
    object qNominaIMP_IVA_COM_PAG: TFloatField
      FieldName = 'IMP_IVA_COM_PAG'
    end
    object qNominaSIT_CAPITAL: TStringField
      FieldName = 'SIT_CAPITAL'
      Size = 2
    end
    object qNominaSIT_INTERES: TStringField
      FieldName = 'SIT_INTERES'
      Size = 2
    end
    object qNominaSIT_COMISION: TStringField
      FieldName = 'SIT_COMISION'
      Size = 2
    end
    object qNominaF_PAGO: TDateTimeField
      FieldName = 'F_PAGO'
    end
    object qNominaIMP_INT_PAG_T: TFloatField
      FieldName = 'IMP_INT_PAG_T'
    end
    object qNominaIMP_COM_PAG_T: TFloatField
      FieldName = 'IMP_COM_PAG_T'
    end
    object qNominaIMP_PAG_T: TFloatField
      FieldName = 'IMP_PAG_T'
    end
    object qNominaDIF_CAP: TFloatField
      FieldName = 'DIF_CAP'
    end
    object qNominaDIF_INT: TFloatField
      FieldName = 'DIF_INT'
    end
    object qNominaDIF_COM: TFloatField
      FieldName = 'DIF_COM'
    end
    object qNominaDIF_TOT: TFloatField
      FieldName = 'DIF_TOT'
    end
    object qNominaSIT_CREDITO: TStringField
      FieldName = 'SIT_CREDITO'
      Size = 2
    end
    object qNominaSIT_EMPLEADO: TStringField
      FieldName = 'SIT_EMPLEADO'
      Size = 2
    end
    object qNominaID_PERSONA: TFloatField
      FieldName = 'ID_PERSONA'
    end
    object qNominaNUM_PERIODO: TFloatField
      FieldName = 'NUM_PERIODO'
    end
    object qNominaCHEQUERA: TStringField
      FieldName = 'CHEQUERA'
    end
    object qNominaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      FixedChar = True
    end
  end
end
