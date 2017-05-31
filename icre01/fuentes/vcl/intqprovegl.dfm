object QRProVegl: TQRProVegl
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  BeforePrint = QuickRepBeforePrint
  DataSet = qyProgVen
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
    50
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
    Width = 999
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
      2643.1875)
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
        2643.1875)
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
    Width = 999
    Height = 21
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
      55.5625
      2643.1875)
    BandType = rbColumnHeader
    object QRShape10: TQRShape
      Left = 429
      Top = 0
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1135.0625
        0
        211.666666666667)
      Shape = qrsRectangle
    end
    object QRShape9: TQRShape
      Left = 350
      Top = 0
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        926.041666666667
        0
        211.666666666667)
      Shape = qrsRectangle
    end
    object QRShape26: TQRShape
      Left = 515
      Top = 0
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1362.60416666667
        0
        211.666666666667)
      Shape = qrsRectangle
    end
    object QRShape22: TQRShape
      Left = 594
      Top = 0
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1571.625
        0
        211.666666666667)
      Shape = qrsRectangle
    end
    object QRShape1: TQRShape
      Left = 210
      Top = 0
      Width = 51
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        555.625
        0
        134.9375)
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 216
      Top = 1
      Width = 39
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        571.5
        2.64583333333333
        103.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Accesorio'
      Color = clWhite
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
    object QRShape8: TQRShape
      Left = 271
      Top = 0
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        717.020833333333
        0
        211.666666666667)
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 360
      Top = 1
      Width = 60
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        952.5
        2.64583333333333
        158.75)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'IVA Vig.'
      Color = clWhite
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
    object QRShape11: TQRShape
      Left = 673
      Top = 0
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1780.64583333333
        0
        211.666666666667)
      Shape = qrsRectangle
    end
    object QRLabel24: TQRLabel
      Left = 277
      Top = 1
      Width = 69
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        732.895833333333
        2.64583333333333
        182.5625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Importe Vigente'
      Color = clWhite
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
    object QRLabel1: TQRLabel
      Left = 440
      Top = 1
      Width = 60
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1164.16666666667
        2.64583333333333
        158.75)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Total Vig.'
      Color = clWhite
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
    object QRLabel5: TQRLabel
      Left = 521
      Top = 1
      Width = 67
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1378.47916666667
        2.64583333333333
        177.270833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Importe Vencido'
      Color = clWhite
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
    object QRLabel7: TQRLabel
      Left = 604
      Top = 1
      Width = 56
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1598.08333333333
        2.64583333333333
        148.166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'IVA Venc.'
      Color = clWhite
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
    object QRLabel8: TQRLabel
      Left = 689
      Top = 1
      Width = 48
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1822.97916666667
        2.64583333333333
        127)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Moras'
      Color = clWhite
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
    object QRShape2: TQRShape
      Left = 752
      Top = 0
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1989.66666666667
        0
        211.666666666667)
      Shape = qrsRectangle
    end
    object QRLabel12: TQRLabel
      Left = 764
      Top = 1
      Width = 56
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2021.41666666667
        2.64583333333333
        148.166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'IVA Moras'
      Color = clWhite
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
    object QRShape3: TQRShape
      Left = 831
      Top = 0
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2198.6875
        0
        211.666666666667)
      Shape = qrsRectangle
    end
    object QRLabel13: TQRLabel
      Left = 843
      Top = 1
      Width = 56
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2230.4375
        2.64583333333333
        148.166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Total Venc.'
      Color = clWhite
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
    object QRShape6: TQRShape
      Left = 921
      Top = 0
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2436.8125
        0
        185.208333333333)
      Shape = qrsRectangle
    end
    object QRLabel15: TQRLabel
      Left = 927
      Top = 1
      Width = 56
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2452.6875
        2.64583333333333
        148.166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Total Vig + Venc'
      Color = clWhite
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
  object QRBand1: TQRBand
    Left = 38
    Top = 237
    Width = 999
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand1BeforePrint
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      34.3958333333333
      2643.1875)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 220
      Top = 1
      Width = 38
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        582.083333333333
        2.64583333333333
        100.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'ACCESORIO'
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
    object QRDB_IMP_IVA: TQRDBText
      Left = 361
      Top = 0
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        955.145833333333
        0
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'IMP_IVA_VIG'
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
    object QRDBText2: TQRDBText
      Left = 281
      Top = 0
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        743.479166666667
        0
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'IMPORTE_VIG'
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
    object QRDBText5: TQRDBText
      Left = 529
      Top = 0
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1399.64583333333
        0
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'IMP_TOTAL_VDO'
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
    object QRDBText8: TQRDBText
      Left = 607
      Top = 0
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1606.02083333333
        0
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'IMP_IVA_VDO'
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
    object QRDBText18: TQRDBText
      Left = 684
      Top = 0
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1809.75
        0
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'MORATORIOS'
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
    object QRDBText22: TQRDBText
      Left = 764
      Top = 0
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2021.41666666667
        0
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'IVA_MORAS'
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
    object QRExpr1: TQRExpr
      Left = 441
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1166.8125
        2.64583333333333
        158.75)
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
      Expression = 'qyProgVen.IMPORTE_VIG+qyProgVen.IMP_IVA_VIG'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr2: TQRExpr
      Left = 845
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2235.72916666667
        2.64583333333333
        158.75)
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
      Expression = 
        'qyProgVen.IMP_TOTAL_VDO+qyProgVen.IMP_IVA_VDO+qyProgVen.MORATORI' +
        'OS+qyProgVen.IVA_MORAS'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr21: TQRExpr
      Left = 927
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2452.6875
        2.64583333333333
        158.75)
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
      Expression = 
        'qyProgVen.IMPORTE_VIG+qyProgVen.IMP_IVA_VIG+qyProgVen.IMP_TOTAL_' +
        'VDO+qyProgVen.IMP_IVA_VDO+qyProgVen.MORATORIOS+qyProgVen.IVA_MOR' +
        'AS'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRShape13: TQRShape
      Left = 302
      Top = 10
      Width = 690
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.29166666666667
        799.041666666667
        26.4583333333333
        1825.625)
      Shape = qrsRectangle
    end
  end
  object QRFooterCliente: TQRBand
    Left = 38
    Top = 263
    Width = 999
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFooterClienteBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      34.3958333333333
      2643.1875)
    BandType = rbGroupFooter
    object QRLabel27: TQRLabel
      Left = 36
      Top = 0
      Width = 74
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        95.25
        0
        195.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Cliente'
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
    object QRExpr3: TQRExpr
      Left = 361
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        955.145833333333
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMP_IVA_VIG)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr11: TQRExpr
      Left = 281
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        743.479166666667
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMPORTE_VIG)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr7: TQRExpr
      Left = 441
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1166.8125
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMPORTE_VIG+qyProgVen.IMP_IVA_VIG)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr17: TQRExpr
      Left = 529
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1399.64583333333
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMP_TOTAL_VDO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr22: TQRExpr
      Left = 607
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1606.02083333333
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMP_IVA_VDO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr28: TQRExpr
      Left = 684
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1809.75
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr33: TQRExpr
      Left = 764
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2021.41666666667
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IVA_MORAS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr38: TQRExpr
      Left = 845
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2235.72916666667
        2.64583333333333
        158.75)
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
      Expression = 
        'SUM(qyProgVen.IMP_TOTAL_VDO+qyProgVen.IMP_IVA_VDO+qyProgVen.MORA' +
        'TORIOS+qyProgVen.IVA_MORAS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr9: TQRExpr
      Left = 927
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2452.6875
        2.64583333333333
        158.75)
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
      Expression = 
        'SUM(qyProgVen.IMPORTE_VIG+qyProgVen.IMP_IVA_VIG+qyProgVen.IMP_TO' +
        'TAL_VDO+qyProgVen.IMP_IVA_VDO+qyProgVen.MORATORIOS+qyProgVen.IVA' +
        '_MORAS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRFooterPromotor: TQRBand
    Left = 38
    Top = 276
    Width = 999
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFooterPromotorBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      34.3958333333333
      2643.1875)
    BandType = rbGroupFooter
    object QRExpr49: TQRExpr
      Left = 361
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        955.145833333333
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMP_IVA_VIG)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel16: TQRLabel
      Left = 24
      Top = 0
      Width = 109
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        63.5
        0
        288.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Promotor  Admon'
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
    object QRExpr12: TQRExpr
      Left = 281
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        743.479166666667
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMPORTE_VIG)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr14: TQRExpr
      Left = 441
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1166.8125
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMPORTE_VIG+qyProgVen.IMP_IVA_VIG)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr20: TQRExpr
      Left = 529
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1399.64583333333
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMP_TOTAL_VDO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr26: TQRExpr
      Left = 607
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1606.02083333333
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMP_IVA_VDO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr31: TQRExpr
      Left = 684
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1809.75
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr36: TQRExpr
      Left = 764
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2021.41666666667
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IVA_MORAS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr41: TQRExpr
      Left = 845
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2235.72916666667
        2.64583333333333
        158.75)
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
      Expression = 
        'SUM(qyProgVen.IMP_TOTAL_VDO+qyProgVen.IMP_IVA_VDO+qyProgVen.MORA' +
        'TORIOS+qyProgVen.IVA_MORAS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr15: TQRExpr
      Left = 927
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2452.6875
        2.64583333333333
        158.75)
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
      Expression = 
        'SUM(qyProgVen.IMPORTE_VIG+qyProgVen.IMP_IVA_VIG+qyProgVen.IMP_TO' +
        'TAL_VDO+qyProgVen.IMP_IVA_VDO+qyProgVen.MORATORIOS+qyProgVen.IVA' +
        '_MORAS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRFooterCesion: TQRBand
    Left = 38
    Top = 250
    Width = 999
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFooterCesionBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      34.3958333333333
      2643.1875)
    BandType = rbGroupFooter
    object QRExpr24: TQRExpr
      Left = 361
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        955.145833333333
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMP_IVA_VIG)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel11: TQRLabel
      Left = 50
      Top = 0
      Width = 74
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        132.291666666667
        0
        195.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Crédito'
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
    object QRExpr10: TQRExpr
      Left = 281
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        743.479166666667
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMPORTE_VIG)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr5: TQRExpr
      Left = 441
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1166.8125
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMPORTE_VIG+qyProgVen.IMP_IVA_VIG)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr19: TQRExpr
      Left = 529
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1399.64583333333
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMP_TOTAL_VDO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr25: TQRExpr
      Left = 607
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1606.02083333333
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMP_IVA_VDO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr30: TQRExpr
      Left = 684
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1809.75
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr35: TQRExpr
      Left = 764
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2021.41666666667
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IVA_MORAS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr40: TQRExpr
      Left = 845
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2235.72916666667
        2.64583333333333
        158.75)
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
      Expression = 
        'SUM(qyProgVen.IMP_TOTAL_VDO+qyProgVen.IMP_IVA_VDO+qyProgVen.MORA' +
        'TORIOS+qyProgVen.IVA_MORAS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr4: TQRExpr
      Left = 927
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2452.6875
        2.64583333333333
        158.75)
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
      Expression = 
        'SUM(qyProgVen.IMPORTE_VIG+qyProgVen.IMP_IVA_VIG+qyProgVen.IMP_TO' +
        'TAL_VDO+qyProgVen.IMP_IVA_VDO+qyProgVen.MORATORIOS+qyProgVen.IVA' +
        '_MORAS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object FooterMoneda: TQRBand
    Left = 38
    Top = 289
    Width = 999
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = FooterMonedaBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      34.3958333333333
      2643.1875)
    BandType = rbGroupFooter
    object QRExpr6: TQRExpr
      Left = 361
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        955.145833333333
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMP_IVA_VIG)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr8: TQRExpr
      Left = 281
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        743.479166666667
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMPORTE_VIG)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr13: TQRExpr
      Left = 441
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1166.8125
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMPORTE_VIG+qyProgVen.IMP_IVA_VIG)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr16: TQRExpr
      Left = 529
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1399.64583333333
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMP_TOTAL_VDO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr18: TQRExpr
      Left = 607
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1606.02083333333
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IMP_IVA_VDO)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr23: TQRExpr
      Left = 684
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1809.75
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.MORATORIOS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr27: TQRExpr
      Left = 764
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2021.41666666667
        2.64583333333333
        158.75)
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
      Expression = 'SUM(qyProgVen.IVA_MORAS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr29: TQRExpr
      Left = 845
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2235.72916666667
        2.64583333333333
        158.75)
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
      Expression = 
        'SUM(qyProgVen.IMP_TOTAL_VDO+qyProgVen.IMP_IVA_VDO+qyProgVen.MORA' +
        'TORIOS+qyProgVen.IVA_MORAS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr32: TQRExpr
      Left = 927
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2452.6875
        2.64583333333333
        158.75)
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
      Expression = 
        'SUM(qyProgVen.IMPORTE_VIG+qyProgVen.IMP_IVA_VIG+qyProgVen.IMP_TO' +
        'TAL_VDO+qyProgVen.IMP_IVA_VDO+qyProgVen.MORATORIOS+qyProgVen.IVA' +
        '_MORAS)'
      Mask = '###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRLabel17: TQRLabel
      Left = 15
      Top = 0
      Width = 109
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        39.6875
        0
        288.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total por Moneda'
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
  object SummaryBand1: TQRBand
    Left = 38
    Top = 302
    Width = 999
    Height = 20
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
      52.9166666666667
      2643.1875)
    BandType = rbSummary
    object QRLabel22: TQRLabel
      Left = 196
      Top = 3
      Width = 61
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        518.583333333333
        7.9375
        161.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'TOTAL GRAL.'
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
    object QRLabel20: TQRLabel
      Left = 24
      Top = 8
      Width = 69
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        63.5
        21.1666666666667
        182.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total de Créditos:'
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
      Left = 94
      Top = 8
      Width = 39
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        248.708333333333
        21.1666666666667
        103.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel21'
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
    object QRLTot_ImpVig: TQRLabel
      Left = 281
      Top = 4
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        743.479166666667
        10.5833333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_ImpVig'
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
    object QRLTot_IvaVig: TQRLabel
      Left = 361
      Top = 4
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        955.145833333333
        10.5833333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_IvaVig'
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
    object QRLTot_TotVig: TQRLabel
      Left = 441
      Top = 4
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1166.8125
        10.5833333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_TotVig'
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
    object QRLTot_ImpVen: TQRLabel
      Left = 529
      Top = 4
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1399.64583333333
        10.5833333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_ImpVen'
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
    object QRLTot_IvaVen: TQRLabel
      Left = 607
      Top = 4
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1606.02083333333
        10.5833333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_IvaVen'
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
    object QRLTot_Moras: TQRLabel
      Left = 684
      Top = 4
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1809.75
        10.5833333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_Moras'
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
    object QRLTot_IvaMor: TQRLabel
      Left = 764
      Top = 4
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2021.41666666667
        10.5833333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_IvaMor'
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
    object QRLTot_TotVen: TQRLabel
      Left = 845
      Top = 4
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2235.72916666667
        10.5833333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_TotVen'
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
    object QRLTot_VigVen: TQRLabel
      Left = 927
      Top = 4
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2452.6875
        10.5833333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_VigVen'
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
  end
  object QRGroupMoneda: TQRGroup
    Left = 38
    Top = 143
    Width = 999
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupMonedaBeforePrint
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      50.2708333333333
      2643.1875)
    Expression = 'qyProgVen.CVE_MONEDA'
    FooterBand = FooterMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRShape14: TQRShape
      Left = 1
      Top = 0
      Width = 478
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2.64583333333333
        0
        1264.70833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRDBText15: TQRDBText
      Left = 118
      Top = 1
      Width = 81
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        312.208333333333
        2.64583333333333
        214.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'DESC_MONEDA'
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
    object QRDBText20: TQRDBText
      Left = 66
      Top = 1
      Width = 41
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        174.625
        2.64583333333333
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'CVE_MONEDA'
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
    object QRLabel23: TQRLabel
      Left = 8
      Top = 1
      Width = 45
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        21.1666666666667
        2.64583333333333
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda'
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
    object QRLabel26: TQRLabel
      Left = 256
      Top = 1
      Width = 76
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        677.333333333333
        2.64583333333333
        201.083333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo de Cambio:'
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
    object QRLabel28: TQRLabel
      Left = 334
      Top = 1
      Width = 47
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        883.708333333333
        2.64583333333333
        124.354166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel28'
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
  object QRGroupPromotor1: TQRGroup
    Left = 38
    Top = 162
    Width = 999
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      31.75
      2643.1875)
    Expression = 'qyProgVen.ID_PROM_ADM'
    FooterBand = QRFooterPromotor
    Master = Owner
    ReprintOnNewPage = False
    object QRShape12: TQRShape
      Left = 8
      Top = 0
      Width = 482
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        21.1666666666667
        0
        1275.29166666667)
      Shape = qrsRectangle
    end
    object dbNombre_Promotor: TQRDBText
      Left = 153
      Top = 1
      Width = 93
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        404.8125
        2.64583333333333
        246.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
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
    object dbNom_Promotor: TQRDBText
      Left = 89
      Top = 1
      Width = 60
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        235.479166666667
        2.64583333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
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
    object qrlPromotor: TQRLabel
      Left = 11
      Top = 1
      Width = 92
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        29.1041666666667
        2.64583333333333
        243.416666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Promotor Administrador'
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
  object QRGroupProducto: TQRGroup
    Left = 38
    Top = 174
    Width = 999
    Height = 17
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      44.9791666666667
      2643.1875)
    Expression = 'qyProgVen.CVE_PRODUCTO_CRE'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape15: TQRShape
      Left = 16
      Top = 0
      Width = 489
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        42.3333333333333
        0
        1293.8125)
      Shape = qrsRectangle
    end
    object dbProducto: TQRDBText
      Left = 58
      Top = 2
      Width = 47
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        153.458333333333
        5.29166666666667
        124.354166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'CVE_PRODUCTO_CRE'
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel2: TQRLabel
      Left = 19
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
        50.2708333333333
        5.29166666666667
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
    object QRDBText23: TQRDBText
      Left = 110
      Top = 2
      Width = 139
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        291.041666666667
        5.29166666666667
        367.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'DESC_L_PRODUCTO'
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
  end
  object QRGroup1: TQRGroup
    Left = 38
    Top = 191
    Width = 999
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
      37.0416666666667
      2643.1875)
    Expression = 'qyProgVen.NOMBRE'
    FooterBand = QRFooterCliente
    Master = Owner
    ReprintOnNewPage = False
    object QRShape17: TQRShape
      Left = 22
      Top = 0
      Width = 497
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        58.2083333333333
        0
        1314.97916666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 24
      Top = 0
      Width = 25
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        63.5
        0
        66.1458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Titular'
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
    object QRDBText24: TQRDBText
      Left = 51
      Top = 0
      Width = 49
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        134.9375
        0
        129.645833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'ID_TITULAR'
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
    object QRDBText10: TQRDBText
      Left = 103
      Top = 0
      Width = 358
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        272.520833333333
        0
        947.208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'NOMBRE'
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
  object QRGroupProveedor: TQRGroup
    Left = 38
    Top = 205
    Width = 999
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGroupProveedorBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      37.0416666666667
      2643.1875)
    Expression = 'qyProgVen.ID_PROVEEDOR'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape7: TQRShape
      Left = 15
      Top = 1
      Width = 446
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        39.6875
        2.64583333333333
        1180.04166666667)
      Shape = qrsRectangle
    end
    object QRLabel25: TQRLabel
      Left = 17
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
        44.9791666666667
        5.29166666666667
        105.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Proveedor'
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
    object QRDBText11: TQRDBText
      Left = 57
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
        150.8125
        5.29166666666667
        140.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'PROVEEDOR'
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
    object QRDBText3: TQRDBText
      Left = 117
      Top = 2
      Width = 185
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        309.5625
        5.29166666666667
        489.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'NOM_PROVEEDOR'
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
  object QRGTIPO_CARTERA: TQRGroup
    Left = 38
    Top = 219
    Width = 999
    Height = 2
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
      5.29166666666667
      2643.1875)
    Expression = 'qyProgVen.TIPO_CARTERA'
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGroupCesion1: TQRGroup
    Left = 38
    Top = 221
    Width = 999
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
      2643.1875)
    Expression = 'qyProgVen.ID_CREDITO'
    FooterBand = QRFooterCesion
    Master = Owner
    ReprintOnNewPage = False
    object QRShape18: TQRShape
      Left = 6
      Top = 0
      Width = 986
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        15.875
        0
        2608.79166666667)
      Shape = qrsRectangle
    end
    object QRLabel32: TQRLabel
      Left = 10
      Top = 1
      Width = 38
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        26.4583333333333
        2.64583333333333
        100.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Crédito:'
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
    object QRDBText4: TQRDBText
      Left = 42
      Top = 2
      Width = 39
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        111.125
        5.29166666666667
        103.1875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'ID_CREDITO'
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
    object QRDBText6: TQRDBText
      Left = 155
      Top = 2
      Width = 55
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        410.104166666667
        5.29166666666667
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'ID_CONTRATO'
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
    object QRLabel33: TQRLabel
      Left = 94
      Top = 1
      Width = 60
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        248.708333333333
        2.64583333333333
        158.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Autorización:'
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
    object QRLabel34: TQRLabel
      Left = 218
      Top = 1
      Width = 55
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        576.791666666667
        2.64583333333333
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Imp Crédito'
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
      Left = 268
      Top = 2
      Width = 55
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        709.083333333333
        5.29166666666667
        145.520833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
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
    object QRLabel36: TQRLabel
      Left = 491
      Top = 1
      Width = 27
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1299.10416666667
        2.64583333333333
        71.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Saldo'
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
    object QRDBText17: TQRDBText
      Left = 519
      Top = 2
      Width = 46
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1373.1875
        5.29166666666667
        121.708333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'SALDO_AL'
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
    object QRLabel39: TQRLabel
      Left = 580
      Top = 1
      Width = 69
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1534.58333333333
        2.64583333333333
        182.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Comprometido'
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
    object QRDBText19: TQRDBText
      Left = 639
      Top = 2
      Width = 50
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1690.6875
        5.29166666666667
        132.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'SDO_COMP'
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
    object QRLabel40: TQRLabel
      Left = 340
      Top = 1
      Width = 76
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        899.583333333333
        2.64583333333333
        201.083333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Chequera Admin'
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
    object QRDBText21: TQRDBText
      Left = 418
      Top = 2
      Width = 61
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1105.95833333333
        5.29166666666667
        161.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'CUENTA_BANCO'
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
    object QRLabel41: TQRLabel
      Left = 714
      Top = 1
      Width = 21
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1889.125
        2.64583333333333
        55.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tasa'
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
    object QRDBText25: TQRDBText
      Left = 732
      Top = 2
      Width = 31
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1936.75
        5.29166666666667
        82.0208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'TASA_CREDITO'
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
    object QRDBText27: TQRDBText
      Left = 819
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
        2166.9375
        5.29166666666667
        121.708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'F_INICIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = 'DD/MM/YY'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText30: TQRDBText
      Left = 930
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
        2460.625
        5.29166666666667
        121.708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyProgVen
      DataField = 'F_VENCIMIENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = 'DD/MM/YY'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel43: TQRLabel
      Left = 783
      Top = 2
      Width = 39
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2071.6875
        5.29166666666667
        103.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'F. Inicio'
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
    object QRLabel44: TQRLabel
      Left = 882
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
        2333.625
        5.29166666666667
        129.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'F. Vencim.'
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
  object qyProgVen: TQuery
    DatabaseName = 'BCORP'
    SQL.Strings = (
      ' SELECT GENERAL.*,'
      
        '  (select NVL(ID_PROVEEDOR,0) from cr_cesion WHERE ID_CESION = C' +
        'C.ID_CREDITO) as PROVEEDOR,'
      
        '  (select nombre from persona where id_persona = (select NVL(ID_' +
        'PROVEEDOR,0) from cr_cesion WHERE ID_CESION = CC.ID_CREDITO)) as' +
        ' NOM_PROVEEDOR,'
      
        '  (select NVL(B_OPERADO_NAFIN,'#39'F'#39') from cr_cesion WHERE ID_CESIO' +
        'N = CC.ID_CREDITO) as B_OPERADO_NAFIN, '
      '  PPR.ID_PERSONA AS ID_PROM_ADM, '
      '  PPR.NOMBRE AS NOM_PROMOTOR_ADM, '
      '  CTO.ID_PERS_ASOCIAD, '
      '  PPRC.NOMBRE NOM_PROMOTOR_ASO, '
      '  CC.F_INICIO, '
      '  CC.F_VENCIMIENTO, '
      '  CC.F_AUTORIZA, '
      '  CC.ID_CONTRATO, '
      '  CC.TIPO_DISPOSICION,'
      '  CC.B_APLICA_IVA,'
      '  CC.CVE_TASA_REFER,'
      '  CC.B_FINANC_ADIC,'
      '  CC.SDO_INSOLUTO, '
      '  CC.SDO_VIG_TOTAL, '
      
        '  (SELECT SDO_COMP_VIRT FROM DV_CONTRATO WHERE ID_CONTRATO IN (P' +
        'KGCRPERIODO.STPObtChqCte(NULL,NULL,CC.ID_CREDITO,'#39'AC'#39','#39'AD'#39','#39'CR'#39')' +
        ')) as SDO_COMP,'
      
        '  (SELECT SDO_BLOQ_VIRT FROM DV_CONTRATO WHERE ID_CONTRATO IN (P' +
        'KGCRPERIODO.STPObtChqCte(NULL,NULL,CC.ID_CREDITO,'#39'AC'#39','#39'AD'#39','#39'CR'#39')' +
        ')) as SDO_COMP_BLOQ,'
      '  CC.IMP_CREDITO, '
      
        '  (SELECT NVL(TASA_APLICADA,CC.TASA_CREDITO) FROM CRE_PROV_DIARI' +
        'A WHERE ID_CREDITO = CC.ID_CREDITO AND F_PROVISION = (TO_DATE('#39'3' +
        '1/10/2011'#39','#39'DD/MM/YYYY'#39')-1)) AS TASA_CREDITO,'
      '  M.CVE_MONEDA, '
      '  M.DESC_MONEDA, '
      '  CCTO.CVE_PRODUCTO_CRE, '
      
        '  (SELECT DESC_L_PRODUCTO FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CR' +
        'E = CCTO.CVE_PRODUCTO_CRE) DESC_L_PRODUCTO, '
      
        '  SUBSTR(PKGCRPERIODO.STPObtChqCte(PCE.ID_PERSONA,0,GENERAL.ID_C' +
        'REDITO,'#39'AC'#39','#39'AD'#39','#39'CR'#39'),1,20) CUENTA_BANCO,'
      
        '  PKGDPVISTASERV.SPTObtSaldo(PKGCRPERIODO.STPObtChqCte(PCE.ID_PE' +
        'RSONA,0,GENERAL.ID_CREDITO,'#39'AC'#39','#39'AD'#39','#39'CR'#39'),'#39'D000'#39') SALDO_AL, '
      
        '  SUBSTR(PKGCRPERIODO.STPObtChqCte(PCE.ID_PERSONA,0,CC.ID_CREDIT' +
        'O,'#39'AC'#39','#39'AD'#39','#39'CR'#39'),1,20) CUENTA_BANCO, '
      
        '  PKGDPVISTASERV.SPTObtSaldo(PKGCRPERIODO.STPObtChqCte(PCE.ID_PE' +
        'RSONA,0,CC.ID_CREDITO,'#39'AC'#39','#39'AD'#39','#39'CR'#39'),'#39'D000'#39') SALDO_AL, '
      '  PCE.ID_PERSONA AS ID_TITULAR, '
      '  PCE.NOMBRE, '
      
        '  D.CALLE_NUMERO||'#39'  Ext. '#39'||D.NUM_EXTERIOR||'#39'  Int. '#39'||D.NUM_IN' +
        'TERIOR AS DIRECCION, '
      '  D.COLONIA AS COLONIA, '
      
        '  (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION=D.CV' +
        'E_CIUDAD) AS CIUDAD, '
      
        '  (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION=D.CV' +
        'E_ESTADO) AS ESTADO, '
      
        '  (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION=D.CV' +
        'E_PAIS) AS PAIS, '
      '  D.CODIGO_POSTAL AS CP, '
      '  PCE.TELEF_CASA AS TEL_CASA, '
      '  PCE.TELEF_FAX AS FAX, '
      '  PCE.TELEF_OFICINA AS TEL_OFNA '
      ' FROM ( '
      'SELECT ID_CREDITO, '
      '       '#39'CAPITAL'#39' AS ACCESORIO, '
      '       SUM(MORATORIOS) AS MORATORIOS, '
      '       SUM(IVA_MORAS) AS IVA_MORAS, '
      '       SUM(IMP_TOTAL_VDO) AS IMP_TOTAL_VDO, '
      '       SUM(IMP_IVA_VDO) AS IMP_IVA_VDO,'
      '       SUM(IMP_IVA_VIG) AS IMP_IVA_VIG, '
      '       SUM(IMPORTE_VIG) AS IMPORTE_VIG, '
      '       MAX(NUM_DIAS_VENCIDO) AS NUM_DIAS_VENCIDO '
      '  FROM ( '
      '        SELECT ID_CREDITO, '
      '               SUM(MORATORIOS) MORATORIOS, '
      '               SUM(IMP_IVA_MORAS)   IVA_MORAS, '
      
        '               SUM(IMP_CAPITAL  - IMP_PAGADO_HIST + PAGOSANT ) I' +
        'MP_TOTAL_VDO,'
      '               0 AS IMP_IVA_VDO, '
      '               0 AS IMP_IVA_VIG, '
      '               0 AS IMPORTE_VIG, '
      '               MAX(NUM_DIAS_VENCIDO) AS NUM_DIAS_VENCIDO'
      '          FROM (SELECT CCA.ID_CREDITO, CCA.IMP_CAPITAL, '
      
        '                       NVL( (CCA.IMP_MORATORIO - CCA.IMP_PAGADO_' +
        'MORA - CCA.IMP_COND_MORA), 0) AS MORATORIOS, '
      
        '                       NVL( (CCA.IMP_IVA_MORA - CCA.IMP_PAG_IVA_' +
        'MORA - CCA.IMP_IVA_COND_MOR) ,0) AS IMP_IVA_MORAS, '
      
        '                       NVL( PKGCRCOMUN.STPOBTIMPPAGADO( '#39'CP'#39', '#39'I' +
        'MPBRU'#39',CCA.ID_CREDITO, CCA.NUM_PERIODO,NULL,TO_DATE('#39'31/10/2011'#39 +
        ','#39'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST, '
      '                       CCA.NUM_DIAS_VENCIDO'
      
        '                       ,NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) PA' +
        'GOSANT'
      '                  FROM ( '
      '                        SELECT CCA.* FROM CR_CAPITAL CCA '
      '                         WHERE 1 = 1 '
      
        '                           AND CCA.F_VENCIMIENTO < TO_DATE('#39'31/1' +
        '0/2011'#39','#39'DD/MM/YYYY'#39')'
      
        '                           AND ((CCA.F_PROG_PAGO < CCA.F_PAGO AN' +
        'D CCA.SIT_CAPITAL NOT IN ('#39'CA'#39','#39'LQ'#39') AND CCA.F_PAGO > TO_DATE('#39'3' +
        '1/10/2011'#39','#39'DD/MM/YYYY'#39'))'
      '                            OR (CCA.SIT_CAPITAL = '#39'IM'#39' )) '
      '                 ) CCA'
      '               ,('
      '                 SELECT CT.ID_CREDITO, CT.ID_PERIODO,'
      
        '                        NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST' +
        '_PGDMCP'
      '                   FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT'
      '                  WHERE 1=1'
      '                    AND CT.SIT_TRANSACCION = '#39'AC'#39
      '                    AND CT.ID_TRANS_CANCELA IS NULL'
      '                    AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION'
      '                    AND CT.CVE_OPERACION IN ('#39'PGDMCP'#39')'
      '                    AND CDT.CVE_CONCEPTO IN ('#39'IMPBRU'#39')'
      '                  GROUP BY CT.ID_CREDITO, CT.ID_PERIODO'
      '               ) CA_HIST_PGDMCP'
      '          WHERE 1=1'
      '            AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCA.ID_CREDITO'
      '            AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCA.NUM_PERIODO'
      '          ) VECA '
      '   GROUP BY ID_CREDITO '
      '   UNION ALL '
      '        SELECT ID_CREDITO,  '
      '               0 AS MORATORIOS, '
      '               0 AS IMP_IVA_MORAS, '
      '               0 AS IMP_TOTAL_VDO, '
      '               0 AS IMP_IVA_VDO, '
      '               0 AS IMP_IVA_VIG, '
      
        '               SUM(IMP_CAPITAL - IMP_PAGADO_HIST + PAGOSANT ) IM' +
        'PORTE_VIG,'
      '               0 AS NUM_DIAS_VENCIDO '
      '          FROM ( '
      '                SELECT CCA.ID_CREDITO, CCA.IMP_CAPITAL, '
      '                       0 AS MORATORIOS, '
      
        '                       NVL( PKGCRCOMUN.STPOBTIMPPAGADO( '#39'CP'#39', '#39'I' +
        'MPBRU'#39', CCA.ID_CREDITO, CCA.NUM_PERIODO,NULL,TO_DATE('#39'31/10/2011' +
        #39','#39'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST'
      
        '                       ,NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) PA' +
        'GOSANT'
      '                  FROM CR_CAPITAL CCA'
      '                     ,('
      '                       SELECT CT.ID_CREDITO, CT.ID_PERIODO,'
      
        '                              NVL(SUM(CDT.IMP_CONCEPTO),0) AS IM' +
        'P_HIST_PGDMCP'
      
        '                         FROM CR_TRANSACCION CT, CR_DET_TRANSAC ' +
        'CDT'
      '                        WHERE 1=1'
      '                          AND CT.SIT_TRANSACCION = '#39'AC'#39
      '                          AND CT.ID_TRANS_CANCELA IS NULL'
      
        '                          AND CT.ID_TRANSACCION = CDT.ID_TRANSAC' +
        'CION'
      '                          AND CT.CVE_OPERACION IN ('#39'PGDMCP'#39')'
      '                          AND CDT.CVE_CONCEPTO IN ('#39'IMPBRU'#39')'
      '                        GROUP BY CT.ID_CREDITO, CT.ID_PERIODO'
      '                      ) CA_HIST_PGDMCP'
      '                 WHERE 1 = 1'
      '                   AND CCA.SIT_CAPITAL NOT IN ('#39'CA'#39','#39'LQ'#39','#39'IM'#39')'
      '  '#9'  '#9'   AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCA.ID_CREDITO'
      #9#9'   AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCA.NUM_PERIODO'
      '               ) PRCA '
      '        GROUP BY ID_CREDITO '
      ') CAPITAL '
      'GROUP BY ID_CREDITO '
      ' UNION '
      'SELECT ID_CREDITO, '
      '       '#39'FINAN'#39' AS ACCESORIO, '
      '       SUM(MORATORIOS) AS MORATORIOS,'
      '       SUM(IVA_MORAS) AS IVA_MORAS, '
      '       SUM(IMP_TOTAL_VDO) AS IMP_TOTAL_VDO, '
      '       SUM(IMP_IVA_VDO) AS IMP_IVA_VDO, '
      '       SUM(IMP_IVA_VIG) AS IMP_IVA_VIG, '
      '       SUM(IMPORTE_VIG) AS IMPORTE_VIG, '
      '       MAX(NUM_DIAS_VENCIDO) AS NUM_DIAS_VENCIDO '
      '  FROM ( '
      '        SELECT ID_CREDITO, '
      '               SUM(MORATORIOS) MORATORIOS, '
      '               SUM(IMP_IVA_MORAS)   IVA_MORAS, '
      
        '               SUM(IMP_FINAN_ADIC  - IMP_PAGADO_HIST ) IMP_TOTAL' +
        '_VDO, '
      '               0 AS IMP_IVA_VDO, '
      '               0 AS IMP_IVA_VIG, '
      '               0 AS IMPORTE_VIG, '
      '               MAX(NUM_DIAS_VENCIDO) AS NUM_DIAS_VENCIDO '
      '          FROM (SELECT CCF.ID_CREDITO, CCF.IMP_FINAN_ADIC, '
      
        '                       NVL( (CCF.IMP_MORATORIO - CCF.IMP_PAGADO_' +
        'MORA - CCF.IMP_COND_MORA), 0) AS MORATORIOS, '
      
        '                       NVL( (CCF.IMP_IVA_MORA - CCF.IMP_PAG_IVA_' +
        'MORA - CCF.IMP_IVA_COND_MOR) ,0) AS IMP_IVA_MORAS, '
      
        '                       NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( '#39'FN'#39', '#39 +
        'IMPBRU'#39',CCF.ID_CREDITO, CCF.NUM_PERIODO,NULL,TO_DATE('#39'31/10/2011' +
        #39','#39'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST, '
      '                       CCF.NUM_DIAS_VENCIDO '
      '                  FROM ( '
      '                        SELECT CCF.* FROM CR_FINAN_ADIC CCF '
      '                         WHERE 1 = 1 '
      
        '                           AND CCF.F_VENCIMIENTO < TO_DATE('#39'31/1' +
        '0/2011'#39','#39'DD/MM/YYYY'#39')'
      '                           AND ((CCF.F_PROG_PAGO < CCF.F_PAGO '
      
        '                           AND CCF.SIT_FINAN_ADIC NOT IN ('#39'CA'#39','#39 +
        'LQ'#39') '
      
        '                           AND CCF.F_PAGO > TO_DATE('#39'31/10/2011'#39 +
        ','#39'DD/MM/YYYY'#39'))'
      '                            OR (CCF.SIT_FINAN_ADIC = '#39'IM'#39' )) '
      '                        ) CCF '
      '                ) VEFA '
      '       GROUP BY ID_CREDITO '
      '    UNION ALL'
      '        SELECT ID_CREDITO, '
      '               0 AS MORATORIOS, '
      '               0 AS IMP_IVA_MORAS, '
      '               0 AS IMP_TOTAL_VDO, '
      '               0 AS IMP_IVA_VDO, '
      '               0 AS IMP_IVA_VIG, '
      
        '               SUM(IMP_FINAN_ADIC - IMP_PAGADO_HIST ) IMPORTE_VI' +
        'G, '
      '               0 AS NUM_DIAS_VENCIDO '
      '          FROM ( '
      '                SELECT CCF.ID_CREDITO, CCF.IMP_FINAN_ADIC, '
      '                0 AS MORATORIOS, '
      
        '                NVL( PKGCRCOMUN.STPOBTIMPPAGADO( '#39'FN'#39', '#39'IMPBRU'#39',' +
        ' CCF.ID_CREDITO, CCF.NUM_PERIODO,NULL,TO_DATE('#39'31/10/2011'#39','#39'DD/M' +
        'M/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST '
      '                FROM CR_FINAN_ADIC CCF '
      '               WHERE 1 = 1 '
      '                 AND CCF.SIT_FINAN_ADIC NOT IN ('#39'CA'#39','#39'LQ'#39','#39'IM'#39') '
      '             ) PRFA '
      '    GROUP BY ID_CREDITO '
      '    ) FINANADIC '
      '    GROUP BY ID_CREDITO '
      ' UNION '
      'SELECT ID_CREDITO, '
      '       '#39'INTERES'#39' AS ACCESORIO, '
      '       SUM(MORATORIOS) AS MORATORIOS, '
      '       SUM(IVA_MORAS) AS IVA_MORAS, '
      '       SUM(IMP_TOTAL_VDO) AS IMP_TOTAL_VDO, '
      '       SUM(IMP_IVA_VDO) AS IMP_IVA_VDO, '
      '       SUM(IMP_IVA_VIG) AS IMP_IVA_VIG, '
      '       SUM(IMPORTE_VIG) AS IMPORTE_VIG, '
      '       MAX(NUM_DIAS_VENCIDO) AS NUM_DIAS_VENCIDO '
      '  FROM ( '
      '        SELECT ID_CREDITO, '
      '               0 AS MORATORIOS, '
      '               SUM(IMP_IVA_MORAS)   IVA_MORAS, '
      
        '               SUM(IMP_INTERES  - IMP_PAGADO_HIST ) IMP_TOTAL_VD' +
        'O, '
      '               SUM(IMP_IVA) AS IMP_IVA_VDO, '
      '               0 AS IMP_IVA_VIG, '
      '               0 AS IMPORTE_VIG, '
      '               MAX(NUM_DIAS_VENCIDO) AS NUM_DIAS_VENCIDO '
      '           FROM (SELECT CCI.ID_CREDITO, CCI.IMP_INTERES, '
      '                        0 AS MORATORIOS, '
      
        '                        NVL( (CCI.IMP_IVA_MORA - CCI.IMP_PAG_IVA' +
        '_MORA - CCI.IMP_IVA_COND_MOR) ,0) AS IMP_IVA_MORAS, '
      
        '                        NVL( (CCI.IMP_IVA - CCI.IMP_IVA_PAGADO) ' +
        ',0) AS IMP_IVA, '
      
        '                        NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( '#39'IN'#39', ' +
        #39'IMPBRU'#39',CCI.ID_CREDITO, CCI.NUM_PERIODO,NULL,TO_DATE('#39'31/10/201' +
        '1'#39','#39'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST, '
      '                        CCI.NUM_DIAS_VENCIDO '
      '                   FROM ( '
      '                         SELECT CCI.* FROM CR_INTERES CCI '
      '                          WHERE 1 = 1 '
      
        '                            AND CCI.F_VENCIMIENTO < TO_DATE('#39'31/' +
        '10/2011'#39','#39'DD/MM/YYYY'#39')'
      '                            AND ((CCI.F_PROG_PAGO < CCI.F_PAGO '
      
        '                            AND CCI.SIT_INTERES NOT IN ('#39'CA'#39','#39'LQ' +
        #39') '
      
        '                            AND CCI.F_PAGO > TO_DATE('#39'31/10/2011' +
        #39','#39'DD/MM/YYYY'#39'))'
      '                             OR (CCI.SIT_INTERES = '#39'IM'#39' )) '
      '                        ) CCI '
      '                ) VEIN '
      '    GROUP BY ID_CREDITO '
      '    UNION ALL '
      '      SELECT ID_CREDITO, '
      '             0 AS MORATORIOS, '
      '             0 AS IMP_IVA_MORAS, '
      '             0 AS IMP_TOTAL_VDO, '
      '             0 AS IMP_IVA_VDO, '
      '             SUM(IMP_IVA) AS IMP_IVA_VIG, '
      '             SUM(IMP_INTERES - IMP_PAGADO_HIST ) IMPORTE_VIG, '
      '             0 AS NUM_DIAS_VENCIDO '
      '      FROM  (SELECT CCI.ID_CREDITO, CCI.IMP_INTERES, '
      '                    0 AS MORATORIOS, '
      
        '                    NVL( (CCI.IMP_IVA - CCI.IMP_IVA_PAGADO) ,0) ' +
        'AS IMP_IVA, '
      
        '                    NVL( PKGCRCOMUN.STPOBTIMPPAGADO( '#39'IN'#39', '#39'IMPB' +
        'RU'#39', CCI.ID_CREDITO, CCI.NUM_PERIODO,NULL,TO_DATE('#39'31/10/2011'#39','#39 +
        'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST '
      '               FROM CR_INTERES CCI '
      '              WHERE 1 = 1 '
      '                AND CCI.SIT_INTERES NOT IN ('#39'CA'#39','#39'LQ'#39','#39'IM'#39') '
      '            ) PRIN '
      '    GROUP BY ID_CREDITO '
      '    ) INTERES '
      '  GROUP BY ID_CREDITO '
      ' UNION '
      'SELECT ID_CREDITO, '
      '       '#39'CONCEPTOS'#39' AS ACCESORIO,--DESC_COMISION AS ACCESORIO, '
      '       SUM(MORATORIOS) AS MORATORIOS, '
      '       SUM(IVA_MORAS) AS IVA_MORAS, '
      '       SUM(IMP_TOTAL_VDO) AS IMP_TOTAL_VDO, '
      '       SUM(IMP_IVA_VDO) AS IMP_IVA_VDO, '
      '       SUM(IMP_IVA_VIG) AS IMP_IVA_VIG, '
      '       SUM(IMPORTE_VIG) AS IMPORTE_VIG, '
      '       MAX(NUM_DIAS_VENCIDO) AS NUM_DIAS_VENCIDO '
      '  FROM ( '
      '        SELECT ID_CREDITO, '
      '               SUM(MORATORIOS) MORATORIOS, '
      '               SUM(IMP_IVA_MORAS)   IVA_MORAS, '
      
        '               SUM(IMP_COMISION  - IMP_PAGADO_HIST ) IMP_TOTAL_V' +
        'DO, '
      '               SUM(IMP_IVA) AS IMP_IVA_VDO, '
      '               0 AS IMP_IVA_VIG, '
      '               0 AS IMPORTE_VIG, '
      '               MAX(NUM_DIAS_VENCIDO) AS NUM_DIAS_VENCIDO '
      '          FROM ( '
      '                SELECT CCC.ID_CREDITO, CCC.IMP_COMISION, '
      
        '                       NVL( (CCC.IMP_MORATORIO - CCC.IMP_PAGADO_' +
        'MORA - CCC.IMP_COND_MORA), 0) AS MORATORIOS, '
      
        '                       NVL( (CCC.IMP_IVA_MORA - CCC.IMP_PAG_IVA_' +
        'MORA - CCC.IMP_IVA_COND_MOR) ,0) AS IMP_IVA_MORAS, '
      
        '                       NVL( (CCC.IMP_IVA - CCC.IMP_IVA_PAGADO) ,' +
        '0) AS IMP_IVA, '
      
        '                       NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( '#39'CN'#39', '#39 +
        'IMPBRU'#39',CCC.ID_CREDITO, CCC.NUM_PERIODO,NULL,TO_DATE('#39'31/10/2011' +
        #39','#39'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST, '
      '                       CCC.NUM_DIAS_VENCIDO '
      '                  FROM ( '
      '                        SELECT CCC.* FROM CR_COMISION CCC '
      '                         WHERE 1 = 1 '
      
        '                           AND CCC.F_VENCIMIENTO < TO_DATE('#39'31/1' +
        '0/2011'#39','#39'DD/MM/YYYY'#39')'
      '                           AND ((CCC.F_PROG_PAGO < CCC.F_PAGO '
      
        '                           AND CCC.SIT_COMISION NOT IN ('#39'CA'#39','#39'LQ' +
        #39') '
      
        '                           AND CCC.F_PAGO > TO_DATE('#39'31/10/2011'#39 +
        ','#39'DD/MM/YYYY'#39'))'
      '                            OR (CCC.SIT_COMISION = '#39'IM'#39' )) '
      '                        ) CCC '
      '                 ) VECC '
      '    GROUP BY ID_CREDITO '
      '    UNION ALL '
      '      SELECT ID_CREDITO, '
      '             0 AS MORATORIOS, '
      '             0 AS IMP_IVA_MORAS, '
      '             0 AS IMP_TOTAL_VDO, '
      '             0 AS IMP_IVA_VDO, '
      '             SUM(IMP_IVA) AS IMP_IVA_VIG, '
      '             SUM(IMP_COMISION - IMP_PAGADO_HIST ) IMPORTE_VIG, '
      '             0 AS NUM_DIAS_VENCIDO '
      '        FROM ( '
      '              SELECT CCC.ID_CREDITO, CCC.IMP_COMISION, '
      '                     0 AS MORATORIOS, '
      
        '                     NVL( (CCC.IMP_IVA - CCC.IMP_IVA_PAGADO) ,0)' +
        ' AS IMP_IVA, '
      
        '                     NVL( PKGCRCOMUN.STPOBTIMPPAGADO( '#39'CN'#39', '#39'IMP' +
        'BRU'#39', CCC.ID_CREDITO, CCC.NUM_PERIODO,NULL,TO_DATE('#39'31/10/2011'#39',' +
        #39'DD/MM/YYYY'#39'),'#39'V'#39' ), 0 ) AS IMP_PAGADO_HIST '
      '                FROM CR_COMISION CCC '
      '               WHERE 1 = 1 '
      '                 AND CCC.SIT_COMISION NOT IN ('#39'CA'#39','#39'LQ'#39','#39'IM'#39') '
      '             ) PRCC '
      '    GROUP BY ID_CREDITO '
      '   ) COMIS '
      '    GROUP BY ID_CREDITO '
      ' ) GENERAL,     CR_CREDITO CC,'
      ' CR_CONTRATO CCTO, '
      
        ' CONTRATO CTO, MONEDA M, PERSONA PPR, PERSONA PPRC, PERSONA PCE,' +
        ' DOMICILIO D '
      ' WHERE 1 = 1 '
      ' AND CC.ID_CONTRATO      = CCTO.ID_CONTRATO '
      ' AND CC.FOL_CONTRATO     = CCTO.FOL_CONTRATO '
      ' AND CC.SIT_CREDITO      NOT IN ('#39'LQ'#39','#39'CA'#39') '
      ' AND CTO.ID_CONTRATO     = CCTO.ID_CONTRATO '
      ' AND CTO.ID_EMPRESA      = 2 '
      ' AND CC.ID_CONTRATO      = CTO.ID_CONTRATO '
      ' AND GENERAL.ID_CREDITO  = CC.ID_CREDITO '
      ' AND M.CVE_MONEDA        = CTO.CVE_MONEDA '
      ' AND PPR.ID_PERSONA      = CC.ID_PROM_ADM '
      ' AND PPRC.ID_PERSONA     = CTO.ID_PERS_ASOCIAD '
      ' AND PCE.ID_PERSONA   (+)= CTO.ID_TITULAR '
      ' AND D.ID_DOMICILIO      = PCE.ID_DOM_FISCAL'
      ' AND CC.ID_CREDITO '#9#9' = 179523 '
      
        ' ORDER BY DESC_MONEDA, CTO.ID_PERS_ASOCIAD, PPR.ID_PERSONA, CCTO' +
        '.CVE_PRODUCTO_CRE, PCE.NOMBRE, CC.ID_CREDITO, GENERAL.ACCESORIO'
      ' ')
    Left = 53
    Top = 39
    object qyProgVenID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyProgVenACCESORIO: TStringField
      FieldName = 'ACCESORIO'
      Size = 7
    end
    object qyProgVenMORATORIOS: TFloatField
      FieldName = 'MORATORIOS'
    end
    object qyProgVenIVA_MORAS: TFloatField
      FieldName = 'IVA_MORAS'
    end
    object qyProgVenIMP_TOTAL_VDO: TFloatField
      FieldName = 'IMP_TOTAL_VDO'
    end
    object qyProgVenIMP_IVA_VDO: TFloatField
      FieldName = 'IMP_IVA_VDO'
    end
    object qyProgVenIMP_IVA_VIG: TFloatField
      FieldName = 'IMP_IVA_VIG'
    end
    object qyProgVenIMPORTE_VIG: TFloatField
      FieldName = 'IMPORTE_VIG'
    end
    object qyProgVenNUM_DIAS_VENCIDO: TFloatField
      FieldName = 'NUM_DIAS_VENCIDO'
    end
    object qyProgVenPROVEEDOR: TFloatField
      FieldName = 'PROVEEDOR'
    end
    object qyProgVenNOM_PROVEEDOR: TStringField
      FieldName = 'NOM_PROVEEDOR'
      Size = 80
    end
    object qyProgVenB_OPERADO_NAFIN: TStringField
      FieldName = 'B_OPERADO_NAFIN'
      Size = 1
    end
    object qyProgVenID_PROM_ADM: TFloatField
      FieldName = 'ID_PROM_ADM'
    end
    object qyProgVenNOM_PROMOTOR_ADM: TStringField
      FieldName = 'NOM_PROMOTOR_ADM'
      Size = 80
    end
    object qyProgVenID_PERS_ASOCIAD: TFloatField
      FieldName = 'ID_PERS_ASOCIAD'
    end
    object qyProgVenNOM_PROMOTOR_ASO: TStringField
      FieldName = 'NOM_PROMOTOR_ASO'
      Size = 80
    end
    object qyProgVenF_INICIO: TDateTimeField
      FieldName = 'F_INICIO'
    end
    object qyProgVenF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qyProgVenF_AUTORIZA: TDateTimeField
      FieldName = 'F_AUTORIZA'
    end
    object qyProgVenID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qyProgVenTIPO_DISPOSICION: TStringField
      FieldName = 'TIPO_DISPOSICION'
      Size = 2
    end
    object qyProgVenB_APLICA_IVA: TStringField
      FieldName = 'B_APLICA_IVA'
      Size = 1
    end
    object qyProgVenCVE_TASA_REFER: TStringField
      FieldName = 'CVE_TASA_REFER'
      Size = 8
    end
    object qyProgVenB_FINANC_ADIC: TStringField
      FieldName = 'B_FINANC_ADIC'
      Size = 1
    end
    object qyProgVenSDO_INSOLUTO: TFloatField
      FieldName = 'SDO_INSOLUTO'
    end
    object qyProgVenSDO_VIG_TOTAL: TFloatField
      FieldName = 'SDO_VIG_TOTAL'
    end
    object qyProgVenSDO_COMP: TFloatField
      FieldName = 'SDO_COMP'
    end
    object qyProgVenSDO_COMP_BLOQ: TFloatField
      FieldName = 'SDO_COMP_BLOQ'
    end
    object qyProgVenIMP_CREDITO: TFloatField
      FieldName = 'IMP_CREDITO'
    end
    object qyProgVenTASA_CREDITO: TFloatField
      FieldName = 'TASA_CREDITO'
    end
    object qyProgVenCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyProgVenDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyProgVenCVE_PRODUCTO_CRE: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 6
    end
    object qyProgVenDESC_L_PRODUCTO: TStringField
      FieldName = 'DESC_L_PRODUCTO'
      Size = 80
    end
    object qyProgVenCUENTA_BANCO: TStringField
      FieldName = 'CUENTA_BANCO'
    end
    object qyProgVenSALDO_AL: TFloatField
      FieldName = 'SALDO_AL'
    end
    object qyProgVenCUENTA_BANCO_1: TStringField
      FieldName = 'CUENTA_BANCO_1'
    end
    object qyProgVenSALDO_AL_1: TFloatField
      FieldName = 'SALDO_AL_1'
    end
    object qyProgVenID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object qyProgVenNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qyProgVenDIRECCION: TStringField
      FieldName = 'DIRECCION'
      Size = 164
    end
    object qyProgVenCOLONIA: TStringField
      FieldName = 'COLONIA'
      Size = 40
    end
    object qyProgVenCIUDAD: TStringField
      FieldName = 'CIUDAD'
      Size = 40
    end
    object qyProgVenESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 40
    end
    object qyProgVenPAIS: TStringField
      FieldName = 'PAIS'
      Size = 40
    end
    object qyProgVenCP: TStringField
      FieldName = 'CP'
      Size = 6
    end
    object qyProgVenTEL_CASA: TStringField
      FieldName = 'TEL_CASA'
      Size = 12
    end
    object qyProgVenFAX: TStringField
      FieldName = 'FAX'
      Size = 12
    end
    object qyProgVenTEL_OFNA: TStringField
      FieldName = 'TEL_OFNA'
      Size = 12
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
    Left = 85
    Top = 39
  end
  object NMFTP1: TNMFTP
    Port = 21
    ReportLevel = 0
    Vendor = 2411
    ParseList = False
    ProxyPort = 0
    Passive = False
    FirewallType = FTUser
    FWAuthenticate = False
    Left = 120
    Top = 39
  end
end
