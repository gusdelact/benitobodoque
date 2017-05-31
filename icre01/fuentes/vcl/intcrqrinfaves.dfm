object QrCrInfAves: TQrCrInfAves
  Left = 0
  Top = 0
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
  OnStartPage = QuickRepStartPage
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
      2592.91666666667)
    BandType = rbColumnHeader
    object QRLabel1: TQRLabel
      Left = 0
      Top = 64
      Width = 97
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        0
        169.333333333333
        256.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Region'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 98
      Top = 64
      Width = 94
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        259.291666666667
        169.333333333333
        248.708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Acreditados'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 193
      Top = 45
      Width = 593
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        510.645833333333
        119.0625
        1568.97916666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Calificados'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 292
      Top = 64
      Width = 98
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        772.583333333333
        169.333333333333
        259.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Ave 1'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 193
      Top = 64
      Width = 98
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        510.645833333333
        169.333333333333
        259.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Normal'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 787
      Top = 64
      Width = 98
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        2082.27083333333
        169.333333333333
        259.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '     Total        Calificado'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 886
      Top = 64
      Width = 98
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        2344.20833333333
        169.333333333333
        259.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'No Sujetos a Revision'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 490
      Top = 64
      Width = 98
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1296.45833333333
        169.333333333333
        259.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Ave 3'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel12: TQRLabel
      Left = 391
      Top = 64
      Width = 98
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1034.52083333333
        169.333333333333
        259.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Ave 2'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 589
      Top = 64
      Width = 98
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1558.39583333333
        169.333333333333
        259.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Ave 4'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 688
      Top = 64
      Width = 98
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1820.33333333333
        169.333333333333
        259.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Ave 5'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLCarta: TQRLabel
      Left = 8
      Top = 8
      Width = 465
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
        1230.3125)
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
      Left = 480
      Top = 8
      Width = 489
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1270
        21.1666666666667
        1293.8125)
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
    Width = 980
    Height = 72
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      190.5
      2592.91666666667)
    BandType = rbDetail
    object qrTxtRegion: TQRDBText
      Left = 2
      Top = 3
      Width = 97
      Height = 55
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        145.520833333333
        5.29166666666667
        7.9375
        256.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Region'
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
    object qrTxtImp_Normal: TQRDBText
      Left = 193
      Top = 3
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        510.645833333333
        7.9375
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Importe_Normal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object lbImporte: TQRLabel
      Left = 101
      Top = 3
      Width = 91
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        267.229166666667
        7.9375
        240.770833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Importe                '
      Color = clWhite
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
    object lbAcreditados: TQRLabel
      Left = 102
      Top = 22
      Width = 90
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        269.875
        58.2083333333333
        238.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Acreditados        '
      Color = clWhite
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
    object lbLineas: TQRLabel
      Left = 102
      Top = 41
      Width = 90
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        269.875
        108.479166666667
        238.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Lineas                 '
      Color = clWhite
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
    object qrTxtAcr_Normal: TQRDBText
      Left = 193
      Top = 22
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        510.645833333333
        58.2083333333333
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Acreds_Normal'
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
    object qrTxtLin_Normal: TQRDBText
      Left = 193
      Top = 41
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        510.645833333333
        108.479166666667
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Lineas_Normal'
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
    object qrTxtImp_Ave1: TQRDBText
      Left = 292
      Top = 3
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        772.583333333333
        7.9375
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Importe_Ave1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object qrTxtAcr_Ave1: TQRDBText
      Left = 292
      Top = 22
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        772.583333333333
        58.2083333333333
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Acreds_Ave1'
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
    object qrTxtLin_Ave1: TQRDBText
      Left = 292
      Top = 41
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        772.583333333333
        108.479166666667
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Lineas_Ave1'
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
    object qrTxtImp_Ave2: TQRDBText
      Left = 391
      Top = 3
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1034.52083333333
        7.9375
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Importe_Ave2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object qrTxtAcr_Ave2: TQRDBText
      Left = 391
      Top = 22
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1034.52083333333
        58.2083333333333
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Acreds_Ave2'
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
    object qrTxtLin_Ave2: TQRDBText
      Left = 391
      Top = 41
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1034.52083333333
        108.479166666667
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Lineas_Ave2'
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
    object qrTxtImp_Ave3: TQRDBText
      Left = 490
      Top = 3
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1296.45833333333
        7.9375
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Importe_Ave3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object qrTxtAcr_Ave3: TQRDBText
      Left = 490
      Top = 22
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1296.45833333333
        58.2083333333333
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Acreds_Ave3'
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
    object qrTxtLin_Ave3: TQRDBText
      Left = 490
      Top = 41
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1296.45833333333
        108.479166666667
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Lineas_Ave3'
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
    object qrTxtImp_Ave4: TQRDBText
      Left = 589
      Top = 3
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1558.39583333333
        7.9375
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Importe_Ave4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object qrTxtAcr_Ave4: TQRDBText
      Left = 589
      Top = 22
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1558.39583333333
        58.2083333333333
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Acreds_Ave4'
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
    object qrTxtLin_Ave4: TQRDBText
      Left = 589
      Top = 41
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1558.39583333333
        108.479166666667
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Lineas_Ave4'
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
    object qrTxtImp_Ave5: TQRDBText
      Left = 688
      Top = 3
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1820.33333333333
        7.9375
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Importe_Ave5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object qrTxtAcr_Ave5: TQRDBText
      Left = 688
      Top = 22
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1820.33333333333
        58.2083333333333
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Acreds_Ave5'
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
    object qrTxtLin_Ave5: TQRDBText
      Left = 688
      Top = 41
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1820.33333333333
        108.479166666667
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Lineas_Ave5'
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
    object qrTxtImp_Total: TQRDBText
      Left = 787
      Top = 3
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2082.27083333333
        7.9375
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Total_Cal_Importe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object qrTxtAcr_Total: TQRDBText
      Left = 787
      Top = 22
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2082.27083333333
        58.2083333333333
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Total_Cal_Acreds'
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
    object qrTxtLin_Total: TQRDBText
      Left = 787
      Top = 41
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2082.27083333333
        108.479166666667
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Total_Cal_Lineas'
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
    object qrTxtImp_NoRev: TQRDBText
      Left = 886
      Top = 3
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2344.20833333333
        7.9375
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Importe_No_Rev'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object qrTxtAcr_NoRev: TQRDBText
      Left = 886
      Top = 22
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2344.20833333333
        58.2083333333333
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Acred_No_Rev'
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
    object qrTxtLin_NoRev: TQRDBText
      Left = 886
      Top = 41
      Width = 98
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2344.20833333333
        108.479166666667
        259.291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'Lineas_No_Rev'
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
  object SummaryBand1: TQRBand
    Left = 38
    Top = 297
    Width = 980
    Height = 40
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
      105.833333333333
      2592.91666666667)
    BandType = rbSummary
    object QRLeyendaMoneda: TQRLabel
      Left = 440
      Top = 10
      Width = 512
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1164.16666666667
        26.4583333333333
        1354.66666666667)
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
  object ChildBand1: TQRChildBand
    Left = 38
    Top = 337
    Width = 980
    Height = 494
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
      1307.04166666667
      2592.91666666667)
    ParentBand = SummaryBand1
    object QRChart1: TQRChart
      Left = 8
      Top = 3
      Width = 769
      Height = 225
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        595.3125
        21.1666666666667
        7.9375
        2034.64583333333)
      object QRDBChart1: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Seguimiento (AVES) Importes '
          '')
        object Series1: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          PercentFormat = '##0,## %'
          SeriesColor = clRed
          Title = 'Importes Normal '
          ValueFormat = '#,##0,###'
          XLabelsSource = 'Region'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Importe_Normal'
        end
        object Series2: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          SeriesColor = clGreen
          Title = 'Importes Ave 1'
          XLabelsSource = 'Region'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Importe_Ave1'
        end
        object Series3: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          SeriesColor = clYellow
          Title = 'Importes Ave 2'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Importe_Ave2'
        end
        object Series4: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          SeriesColor = clBlue
          Title = 'Importes Ave 3'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Importe_Ave3'
        end
        object Series5: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          SeriesColor = clGray
          Title = 'Importes Ave 4 '
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Importe_Ave4'
        end
        object Series6: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          SeriesColor = clFuchsia
          Title = 'Importes Ave 5'
          XLabelsSource = 'Region'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Importe_Ave5'
        end
        object Series7: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          PercentFormat = '##0,## %'
          SeriesColor = clTeal
          Title = 'Importes N/S a  Revisión '
          ValueFormat = '#,##0,###'
          XLabelsSource = 'Region'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Importe_No_Rev'
        end
      end
    end
    object QRChart2: TQRChart
      Left = 208
      Top = 219
      Width = 769
      Height = 225
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        595.3125
        550.333333333333
        579.4375
        2034.64583333333)
      object QRDBChart2: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Seguimiento (AVES) Acreditados'
          '')
        object SerieAcresNormal: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          PercentFormat = '##0,## %'
          SeriesColor = clRed
          Title = 'Acreditados Normal '
          ValueFormat = '#,##0,###'
          XLabelsSource = 'Region'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Acreds_Normal'
        end
        object SerieAcresAve1: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          SeriesColor = clGreen
          Title = 'Acreditados  Ave 1'
          XLabelsSource = 'Region'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Acreds_Ave1'
        end
        object SerieAcresAve2: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          SeriesColor = clYellow
          Title = 'Acreditados Ave 2'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Acreds_Ave2'
        end
        object SerieAcresAve3: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          SeriesColor = clBlue
          Title = 'Acreditados Ave 3'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Acreds_Ave3'
        end
        object SerieAcresAve4: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          SeriesColor = clGray
          Title = 'Acreditados Ave 4 '
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Acreds_Ave4'
        end
        object SerieAcresAve5: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          SeriesColor = clFuchsia
          Title = 'Acreditados Ave 5'
          XLabelsSource = 'Region'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Acreds_Ave5'
        end
        object SerieAcresNoRev: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          PercentFormat = '##0,## %'
          SeriesColor = clTeal
          Title = 'Acreditados N/S Revisión'
          ValueFormat = '#,##0,###'
          XLabelsSource = 'Region'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Acred_No_Rev'
        end
      end
    end
    object QRChart3: TQRChart
      Left = 8
      Top = 459
      Width = 769
      Height = 225
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        595.3125
        21.1666666666667
        1214.4375
        2034.64583333333)
      object QRDBChart3: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Seguimiento (AVES) Lineas '
          ''
          '')
        object SerieLineaNormal: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          PercentFormat = '##0,## %'
          SeriesColor = clRed
          Title = 'Lineas Normal '
          ValueFormat = '#,##0,###'
          XLabelsSource = 'Region'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Lineas_Normal'
        end
        object SerieLineaAve1: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          SeriesColor = clGreen
          Title = 'Lineas Ave 1'
          XLabelsSource = 'Region'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Lineas_Ave1'
        end
        object SerieLineaAve2: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          SeriesColor = clYellow
          Title = 'Lineas Ave 2'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Lineas_Ave2'
        end
        object SerieLineaAve3: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          SeriesColor = clBlue
          Title = 'Lineas Ave 3'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Lineas_Ave3'
        end
        object SerieLineaAve4: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          SeriesColor = clGray
          Title = 'Lineas Ave 4 '
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Lineas_Ave4'
        end
        object SerieLineaAve5: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          SeriesColor = clFuchsia
          Title = 'Lineas Ave 5'
          XLabelsSource = 'Region'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Lineas_Ave5'
        end
        object SerieLineasNoRev: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          DataSource = qDatos
          PercentFormat = '##0,## %'
          SeriesColor = clTeal
          Title = 'Lineas N/S a Revisión'
          ValueFormat = '#,##0,###'
          XLabelsSource = 'Region'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Lineas_No_Rev'
        end
      end
    end
  end
  object qDatos: TQuery
    AfterScroll = qDatosAfterScroll
    Left = 470
    Top = 62
    object qDatosRegion: TStringField
      FieldName = 'Region'
    end
    object qDatosAcred_No_Rev: TFloatField
      FieldName = 'Acred_No_Rev'
    end
    object qDatosLineas_No_Rev: TFloatField
      FieldName = 'Lineas_No_Rev'
    end
    object qDatosImporte_No_Rev: TFloatField
      FieldName = 'Importe_No_Rev'
    end
    object qDatosAcreds_Normal: TFloatField
      FieldName = 'Acreds_Normal'
    end
    object qDatosLineas_Normal: TFloatField
      FieldName = 'Lineas_Normal'
    end
    object qDatosImporte_Normal: TFloatField
      FieldName = 'Importe_Normal'
    end
    object qDatosAcreds_Ave1: TFloatField
      FieldName = 'Acreds_Ave1'
    end
    object qDatosLineas_Ave1: TFloatField
      FieldName = 'Lineas_Ave1'
    end
    object qDatosImporte_Ave1: TFloatField
      FieldName = 'Importe_Ave1'
    end
    object qDatosAcreds_Ave2: TFloatField
      FieldName = 'Acreds_Ave2'
    end
    object qDatosLineas_Ave2: TFloatField
      FieldName = 'Lineas_Ave2'
    end
    object qDatosImporte_Ave2: TFloatField
      FieldName = 'Importe_Ave2'
    end
    object qDatosAcreds_Ave3: TFloatField
      FieldName = 'Acreds_Ave3'
    end
    object qDatosLineas_Ave3: TFloatField
      FieldName = 'Lineas_Ave3'
    end
    object qDatosImporte_Ave3: TFloatField
      FieldName = 'Importe_Ave3'
    end
    object qDatosAcreds_Ave4: TFloatField
      FieldName = 'Acreds_Ave4'
    end
    object qDatosLineas_Ave4: TFloatField
      FieldName = 'Lineas_Ave4'
    end
    object qDatosImporte_Ave4: TFloatField
      FieldName = 'Importe_Ave4'
    end
    object qDatosAcreds_Ave5: TFloatField
      FieldName = 'Acreds_Ave5'
    end
    object qDatosLineas_Ave5: TFloatField
      FieldName = 'Lineas_Ave5'
    end
    object qDatosImporte_Ave5: TFloatField
      FieldName = 'Importe_Ave5'
    end
    object qDatosTotal_Cal_Acreds: TFloatField
      FieldName = 'Total_Cal_Acreds'
    end
    object qDatosTotal_Cal_Lineas: TFloatField
      FieldName = 'Total_Cal_Lineas'
    end
    object qDatosTotal_Cal_Importe: TFloatField
      FieldName = 'Total_Cal_Importe'
    end
  end
  object QLeyendaEntidades: TQuery
    SQL.Strings = (
      
        'Select '#39'Incluye información: '#39' || InitCap (Replace (Replace (Nvl' +
        ' (:peTipo_Entidad, PkgCRGPViews.Todas_Entidades), '#39'ORG-DESC'#39', '#39'Ó' +
        'rganos descentralizados'#39'), '#39'|'#39', '#39', '#39')) Leyenda_Entidades'
      '  From Dual             ')
    Left = 273
    Top = 18
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
  end
end
