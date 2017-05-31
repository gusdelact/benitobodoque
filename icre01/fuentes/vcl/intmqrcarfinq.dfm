object QrCarFinq: TQrCarFinq
  Tag = 1
  Left = 0
  Top = -109
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qyConsulta
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  Functions.Strings = (
    'PAGENUMBER'
    'COLUMNNUMBER'
    'REPORTTITLE'
    'QRSTRINGSBAND_FIRMAS2'
    'QRSTRINGSBAND1')
  Functions.DATA = (
    '0'
    '0'
    #39#39
    #39#39
    #39#39)
  Options = [FirstPageHeader, LastPageFooter]
  Page.Columns = 1
  Page.Orientation = poPortrait
  Page.PaperSize = Letter
  Page.Values = (
    88.9
    2794
    304.8
    2159
    254
    254
    0)
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = First
  PrintIfEmpty = True
  SnapToGrid = True
  Units = Inches
  Zoom = 100
  object qrDetalle: TQRBand
    Left = 96
    Top = 448
    Width = 624
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
      1651)
    BandType = rbDetail
    object QRDBT_Intereses: TQRDBText
      Left = 492
      Top = 0
      Width = 121
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1301.75
        0
        320.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_INTERES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBT_ImpAdeudo: TQRDBText
      Left = 360
      Top = -1
      Width = 121
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        952.5
        -2.64583333333333
        320.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_ADEUDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBT_NumCredito: TQRDBText
      Left = 0
      Top = 0
      Width = 76
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        0
        0
        201.083333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'ID_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBT_FInicio: TQRDBText
      Left = 115
      Top = -1
      Width = 73
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        304.270833333333
        -2.64583333333333
        193.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_INICIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBT_ImpDispuesto: TQRDBText
      Left = 216
      Top = -1
      Width = 121
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        571.5
        -2.64583333333333
        320.145833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_DISPUESTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
  end
  object qrTitulos: TQRBand
    Left = 96
    Top = 410
    Width = 624
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
      100.541666666667
      1651)
    BandType = rbColumnHeader
    object QRL_Intereses: TQRLabel
      Left = 562
      Top = 0
      Width = 54
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1486.95833333333
        0
        142.875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe Interés'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRL_FInicio: TQRLabel
      Left = 104
      Top = 0
      Width = 97
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        275.166666666667
        0
        256.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha de Otorgamiento'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRL_NumCredito: TQRLabel
      Left = 1
      Top = 0
      Width = 73
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        2.64583333333333
        0
        193.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Número de Crédito'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRL_Saldo: TQRLabel
      Left = 395
      Top = 0
      Width = 108
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        1045.10416666667
        0
        285.75)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe Vigente (Capital)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRL_ImpDispuesto: TQRLabel
      Left = 266
      Top = 0
      Width = 58
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        703.791666666667
        0
        153.458333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe Original'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
  end
  object PageFooterBand1: TQRBand
    Left = 96
    Top = 464
    Width = 624
    Height = 381
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
      1008.0625
      1651)
    BandType = rbPageFooter
    object QRLabel2: TQRLabel
      Left = 256
      Top = 119
      Width = 120
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        677.333333333333
        314.854166666667
        317.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ATENTAMENTE'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRShape_Firma1: TQRShape
      Left = 1
      Top = 210
      Width = 281
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        2.64583333333333
        555.625
        743.479166666667)
      Shape = qrsHorLine
    end
    object QRShape_Firma1_2: TQRShape
      Left = 164
      Top = 210
      Width = 289
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        433.916666666667
        555.625
        764.645833333333)
      Shape = qrsHorLine
    end
    object QRShape_Firma2: TQRShape
      Left = 310
      Top = 210
      Width = 313
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        820.208333333333
        555.625
        828.145833333333)
      Shape = qrsHorLine
    end
    object QRL_Firma2: TQRLabel
      Left = 424
      Top = 218
      Width = 88
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        1121.83333333333
        576.791666666667
        232.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRL_Firma2'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRL_Puesto2: TQRLabel
      Left = 421
      Top = 238
      Width = 95
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        1113.89583333333
        629.708333333333
        251.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRL_Puesto2'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRL_Puesto1_2: TQRLabel
      Left = 264
      Top = 238
      Width = 95
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        698.5
        629.708333333333
        251.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRL_Puesto1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRL_Firma1_2: TQRLabel
      Left = 267
      Top = 218
      Width = 88
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        706.4375
        576.791666666667
        232.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRL_Firma1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRL_Firma1: TQRLabel
      Left = 100
      Top = 218
      Width = 88
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        264.583333333333
        576.791666666667
        232.833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRL_Firma1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRL_Puesto1: TQRLabel
      Left = 97
      Top = 238
      Width = 95
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        256.645833333333
        629.708333333333
        251.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRL_Puesto1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRMemo_PiePagina: TQRMemo
      Left = 95
      Top = 317
      Width = 98
      Height = 61
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        161.395833333333
        251.354166666667
        838.729166666667
        259.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRInterMemo_FinCarta: TQRInterMemo
      Left = 0
      Top = 8
      Width = 623
      Height = 97
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        256.645833333333
        0
        21.1666666666667
        1648.35416666667)
      Textos.Strings = (
        
          'Sobre el particular, nos permitimos informarle que dichos crédit' +
          'os a la fecha, han sido liquidados en su totalidad, por lo que n' +
          'o se adeuda a esta Institución de Crédito, cantidad alguna deriv' +
          'ada de los mismos.'
        ''
        ''
        
          'Se extiende la presente a petición del interesado para los fines' +
          ' que tenga a bien ordenar.')
      AlignToBand = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
  end
  object PageHeaderBand1: TQRBand
    Left = 96
    Top = 115
    Width = 624
    Height = 295
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
      780.520833333333
      1651)
    BandType = rbPageHeader
    object QRL_FechaEmision: TQRLabel
      Left = 0
      Top = 0
      Width = 203
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        0
        0
        537.104166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'México D.F. a 14 de Julio de 2011'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRDBText1: TQRDBText
      Left = 0
      Top = 43
      Width = 457
      Height = 34
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        89.9583333333333
        0
        113.770833333333
        1209.14583333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyAcreditado
      DataField = 'NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRDBText2: TQRDBText
      Left = 0
      Top = 80
      Width = 114
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        0
        211.666666666667
        301.625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyAcreditado
      DataField = 'CALLENUMERO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRDBText3: TQRDBText
      Left = 0
      Top = 100
      Width = 69
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        0
        264.583333333333
        182.5625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyAcreditado
      DataField = 'COLONIA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRDBText6: TQRDBText
      Left = 0
      Top = 120
      Width = 80
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        0
        317.5
        211.666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyAcreditado
      DataField = 'MPIO_PAIS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel4: TQRLabel
      Left = 0
      Top = 140
      Width = 28
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        0
        370.416666666667
        74.0833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'C.P.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRDBText8: TQRDBText
      Left = 32
      Top = 140
      Width = 124
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        84.6666666666667
        370.416666666667
        328.083333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyAcreditado
      DataField = 'CODIGO_POSTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabelAtencionA: TQRLabel
      Left = 291
      Top = 146
      Width = 42
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        769.9375
        386.291666666667
        111.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'AT'#39'N: '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRL_DirigidoA: TQRLabel
      Left = 335
      Top = 146
      Width = 290
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        886.354166666667
        386.291666666667
        767.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'A QUIEN CORRESPONDA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRL_Puesto: TQRLabel
      Left = 335
      Top = 166
      Width = 282
      Height = 46
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        121.708333333333
        886.354166666667
        439.208333333333
        746.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Puesto'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRInterMemo_Encabezado: TQRInterMemo
      Left = 0
      Top = 216
      Width = 623
      Height = 73
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        193.145833333333
        0
        571.5
        1648.35416666667)
      Textos.Strings = (
        
          'Hacemos referencia al financiamiento otorgado a     Nombre del a' +
          'creditado, por banco Interacciones, S.A. Institución de Banca Mú' +
          'ltiple, Grupo Financiero Interacciones, que a continuación se de' +
          'tallan:'
        'ssssssssssssssssss'
        ''
        'sssssssssssssssssssss')
      AlignToBand = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
  end
  object qyConsulta: TQuery
    SQL.Strings = (
      
        'SELECT '#39'280192'#39' AS ID_CREDITO, '#39'27/05/2010'#39' AS F_INICIO, '#39'1,675,' +
        '000.00'#39' AS IMP_DISPUESTO, '#39'1,326,000.00'#39' AS IMP_ADEUDO, '#39'21,821.' +
        '57'#39' AS IMP_INTERES  FROM DUAL ')
    Left = 155
    Top = 17
    object qyConsultaID_CREDITO: TStringField
      FieldName = 'ID_CREDITO'
      FixedChar = True
      Size = 6
    end
    object qyConsultaF_INICIO: TStringField
      FieldName = 'F_INICIO'
      FixedChar = True
      Size = 10
    end
    object qyConsultaIMP_DISPUESTO: TStringField
      FieldName = 'IMP_DISPUESTO'
      FixedChar = True
      Size = 12
    end
    object qyConsultaIMP_ADEUDO: TStringField
      FieldName = 'IMP_ADEUDO'
      FixedChar = True
      Size = 12
    end
    object qyConsultaIMP_INTERES: TStringField
      FieldName = 'IMP_INTERES'
      FixedChar = True
      Size = 9
    end
  end
  object qyAcreditado: TQuery
    SQL.Strings = (
      'SELECT PR.NOMBRE,'
      
        '       D.CALLE_NUMERO || '#39' '#39' || D.NUM_EXTERIOR || '#39' '#39' || D.NUM_I' +
        'NTERIOR AS CALLENUMERO,'
      '       D.COLONIA AS COLONIA,'
      
        '       (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION' +
        '=D.CVE_CIUDAD) AS MUNICIPIO,'
      
        '       (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION' +
        '=D.CVE_ESTADO) AS ESTADO,'
      
        '       (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION' +
        '=D.CVE_PAIS) AS PAIS,'
      
        '       (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION' +
        '=D.CVE_ESTADO) || '#39', '#39' ||'
      
        '          (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLAC' +
        'ION=D.CVE_PAIS) AS MPIO_PAIS,'
      '       D.CODIGO_POSTAL '
      'FROM PERSONA PR, DOMICILIO D'
      'WHERE PR.ID_DOMICILIO = D.ID_DOMICILIO'
      
        '  AND PR.ID_PERSONA = (SELECT ID_TITULAR FROM CONTRATO WHERE ID_' +
        'CONTRATO = 330020552) '
      ' ')
    Left = 216
    Top = 16
    object qyAcreditadoNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qyAcreditadoCALLENUMERO: TStringField
      FieldName = 'CALLENUMERO'
      Size = 152
    end
    object qyAcreditadoCOLONIA: TStringField
      FieldName = 'COLONIA'
      Size = 40
    end
    object qyAcreditadoMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Size = 40
    end
    object qyAcreditadoESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 40
    end
    object qyAcreditadoPAIS: TStringField
      FieldName = 'PAIS'
      Size = 40
    end
    object qyAcreditadoCODIGO_POSTAL: TStringField
      FieldName = 'CODIGO_POSTAL'
      Size = 6
    end
    object qyAcreditadoMPIO_PAIS: TStringField
      FieldName = 'MPIO_PAIS'
      Size = 82
    end
  end
end
