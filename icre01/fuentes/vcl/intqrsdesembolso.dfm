object QrSDesemb: TQrSDesemb
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  Frame.Width = 2
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
  Page.Orientation = poPortrait
  Page.PaperSize = Letter
  Page.Values = (
    127
    2794
    127
    2159
    127
    127
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
  object PageHeaderBand1: TQRBand
    Left = 48
    Top = 48
    Width = 720
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
      1905)
    BandType = rbPageHeader
    object QRShape1: TQRShape
      Left = 0
      Top = 2
      Width = 720
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.29166666666667
        0
        5.29166666666667
        1905)
      Shape = qrsHorLine
    end
    object QRShape2: TQRShape
      Left = 0
      Top = 6
      Width = 720
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.9375
        0
        15.875
        1905)
      Brush.Color = 4194368
      Shape = qrsRectangle
    end
    object QRShape3: TQRShape
      Left = 0
      Top = 10
      Width = 720
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.29166666666667
        0
        26.4583333333333
        1905)
      Shape = qrsHorLine
    end
  end
  object QRGroup1: TQRGroup
    Left = 48
    Top = 142
    Width = 720
    Height = 629
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = QRGroup1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      1664.22916666667
      1905)
    Expression = 'qyConsulta.ID_CREDITO'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape22: TQRShape
      Left = 4
      Top = 2
      Width = 141
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        10.5833333333333
        5.29166666666667
        373.0625)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape23: TQRShape
      Left = 4
      Top = 25
      Width = 141
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        10.5833333333333
        66.1458333333333
        373.0625)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape24: TQRShape
      Left = 4
      Top = 48
      Width = 141
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        10.5833333333333
        127
        373.0625)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape25: TQRShape
      Left = 420
      Top = 2
      Width = 150
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1111.25
        5.29166666666667
        396.875)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape26: TQRShape
      Left = 420
      Top = 25
      Width = 150
      Height = 148
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        391.583333333333
        1111.25
        66.1458333333333
        396.875)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape27: TQRShape
      Left = 4
      Top = 84
      Width = 413
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        10.5833333333333
        222.25
        1092.72916666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel19: TQRLabel
      Left = 8
      Top = 3
      Width = 107
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        21.1666666666667
        7.9375
        283.104166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'INTERMEDIARIO:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel20: TQRLabel
      Left = 8
      Top = 26
      Width = 89
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        21.1666666666667
        68.7916666666667
        235.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ACREDITADO:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel21: TQRLabel
      Left = 8
      Top = 49
      Width = 132
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        84.6666666666667
        21.1666666666667
        129.645833333333
        349.25)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CLAVE DEL FINANCIAMIENTO:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel22: TQRLabel
      Left = 8
      Top = 85
      Width = 406
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        21.1666666666667
        224.895833333333
        1074.20833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CAUSAS DE INCUMPLIMIENTO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel23: TQRLabel
      Left = 427
      Top = 3
      Width = 136
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        1129.77083333333
        7.9375
        359.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'VENCIMIENTO FINAL:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel24: TQRLabel
      Left = 427
      Top = 43
      Width = 136
      Height = 95
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        251.354166666667
        1129.77083333333
        113.770833333333
        359.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        'FECHAS DE INCUMPLIMIENTO EN EL               PAGO DEL FINANCIAMI' +
        'ENTO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRShape28: TQRShape
      Left = 4
      Top = 177
      Width = 710
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        10.5833333333333
        468.3125
        1878.54166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape29: TQRShape
      Left = 360
      Top = 202
      Width = 354
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        952.5
        534.458333333333
        936.625)
      Shape = qrsRectangle
    end
    object QRShape30: TQRShape
      Left = 360
      Top = 226
      Width = 354
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        952.5
        597.958333333333
        936.625)
      Shape = qrsRectangle
    end
    object QRShape31: TQRShape
      Left = 360
      Top = 250
      Width = 354
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        952.5
        661.458333333333
        936.625)
      Shape = qrsRectangle
    end
    object QRShape32: TQRShape
      Left = 360
      Top = 274
      Width = 354
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        952.5
        724.958333333333
        936.625)
      Shape = qrsRectangle
    end
    object QRShape33: TQRShape
      Left = 360
      Top = 298
      Width = 354
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        952.5
        788.458333333333
        936.625)
      Shape = qrsRectangle
    end
    object QRShape34: TQRShape
      Left = 4
      Top = 298
      Width = 354
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        10.5833333333333
        788.458333333333
        936.625)
      Shape = qrsRectangle
    end
    object QRShape35: TQRShape
      Left = 4
      Top = 274
      Width = 354
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        10.5833333333333
        724.958333333333
        936.625)
      Shape = qrsRectangle
    end
    object QRShape36: TQRShape
      Left = 4
      Top = 250
      Width = 354
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        10.5833333333333
        661.458333333333
        936.625)
      Shape = qrsRectangle
    end
    object QRShape37: TQRShape
      Left = 4
      Top = 226
      Width = 354
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        10.5833333333333
        597.958333333333
        936.625)
      Shape = qrsRectangle
    end
    object QRShape38: TQRShape
      Left = 4
      Top = 202
      Width = 354
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        10.5833333333333
        534.458333333333
        936.625)
      Shape = qrsRectangle
    end
    object QRLabel25: TQRLabel
      Left = 365
      Top = 203
      Width = 11
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        965.729166666667
        537.104166666667
        29.1041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '$'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel26: TQRLabel
      Left = 365
      Top = 227
      Width = 11
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        965.729166666667
        600.604166666667
        29.1041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '$'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel27: TQRLabel
      Left = 365
      Top = 251
      Width = 11
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        965.729166666667
        664.104166666667
        29.1041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '$'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel28: TQRLabel
      Left = 364
      Top = 275
      Width = 13
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        963.083333333333
        727.604166666667
        34.3958333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '%'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel29: TQRLabel
      Left = 365
      Top = 299
      Width = 11
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        965.729166666667
        791.104166666667
        29.1041666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '$'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel30: TQRLabel
      Left = 8
      Top = 299
      Width = 342
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        21.1666666666667
        791.104166666667
        904.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'PAGO SOLICITADO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel31: TQRLabel
      Left = 8
      Top = 275
      Width = 342
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        21.1666666666667
        727.604166666667
        904.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'PORCENTAJE DE PARTICIPACIÓN'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel32: TQRLabel
      Left = 8
      Top = 251
      Width = 342
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        21.1666666666667
        664.104166666667
        904.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'TOTAL'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel33: TQRLabel
      Left = 8
      Top = 227
      Width = 342
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        21.1666666666667
        600.604166666667
        904.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'INTERESES VENCIDOS */'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel34: TQRLabel
      Left = 8
      Top = 203
      Width = 342
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        21.1666666666667
        537.104166666667
        904.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CAPITAL VENCIDO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel35: TQRLabel
      Left = 129
      Top = 178
      Width = 463
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        341.3125
        470.958333333333
        1225.02083333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CÁLCULO DEL PAGO SOLICITADO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRShape5: TQRShape
      Left = 4
      Top = 322
      Width = 710
      Height = 122
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        322.791666666667
        10.5833333333333
        851.958333333333
        1878.54166666667)
      Shape = qrsRectangle
    end
    object qrMemo: TQRMemo
      Left = 8
      Top = 324
      Width = 702
      Height = 117
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        309.5625
        21.1666666666667
        857.25
        1857.375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        
          '*/ Anexar detalle con el cálculo de los intereses.  Para los cré' +
          'ditos que hayan sido otorgados con recursos de NAFIN, se reconoc' +
          'erá la tasa de interés de fondeo de NAFIN al Intermediario y par' +
          'a los créditos que hayan sido otorgados con recursos propios del' +
          ' Intermediario, la tasa de interés TIIE para créditos en moneda ' +
          'nacional (PESOS) y la LIBOR más 2 (dos) puntos porcentuales para' +
          ' créditos en dólares de los Estados Unidos de América (DÓLARES),' +
          ' hasta por un plazo máximo de 180  (ciento ochenta) días natural' +
          'es.  Se entenderá por TIIE la Tasa de Interés Interbancaria de E' +
          'quilibrio a plazo de 28 días, publicada diariamente por el Banco' +
          ' de México en el Diario Oficial de la Federación.  La TIIE que s' +
          'e aplicará será la publicada el día de la operación de que se tr' +
          'ate, la cual será revisable mensualmente el último día hábil del' +
          ' mes que corresponda; en caso de que no se dé a conocer la TIIE ' +
          'en ese día, para determinar la tasa aplicable se procederá a uti' +
          'lizar la TIIE del día hábil inmediato anterior.  En el evento de' +
          ' que el Banco de México dejara de publicar la TIIE, se aplicará ' +
          'la tasa que por sus características el propio Banco de México dé' +
          ' a conocer en sustitución de la TIIE.  En caso de que el Banco d' +
          'e México no determine dicha tasa, se aplicará aquella que acuerd' +
          'en las partes, siempre y cuando refleje el costo del dinero.  Se' +
          ' entenderá por LIBOR la Tasa London Inter Bank Offered Rate prev' +
          'aleciente en el sistema Reuters a las 11:00 AM (hora de Londres,' +
          ' Inglaterra) para los plazos de 1, 3, 6 y 12 meses, referente a ' +
          'depósitos en DÓLARES.')
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 7
    end
    object QRShape6: TQRShape
      Left = 4
      Top = 448
      Width = 710
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        10.5833333333333
        1185.33333333333
        1878.54166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Left = 8
      Top = 449
      Width = 342
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        21.1666666666667
        1187.97916666667
        904.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Se anexa la siguiente información:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRShape7: TQRShape
      Left = 4
      Top = 472
      Width = 595
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        10.5833333333333
        1248.83333333333
        1574.27083333333)
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 8
      Top = 473
      Width = 576
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        21.1666666666667
        1251.47916666667
        1524)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 
        'Copia  simple del contrato de crédito celebrado entre el interme' +
        'diario financiero y el cliente, cuando proceda.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRShape8: TQRShape
      Left = 601
      Top = 472
      Width = 113
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.6041666666667
        1590.14583333333
        1248.83333333333
        298.979166666667)
      Shape = qrsRectangle
    end
    object QRShape9: TQRShape
      Left = 601
      Top = 511
      Width = 113
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1590.14583333333
        1352.02083333333
        298.979166666667)
      Shape = qrsRectangle
    end
    object QRShape10: TQRShape
      Left = 4
      Top = 511
      Width = 595
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        10.5833333333333
        1352.02083333333
        1574.27083333333)
      Shape = qrsRectangle
    end
    object QRShape11: TQRShape
      Left = 601
      Top = 535
      Width = 113
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1590.14583333333
        1415.52083333333
        298.979166666667)
      Shape = qrsRectangle
    end
    object QRShape12: TQRShape
      Left = 4
      Top = 535
      Width = 595
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        10.5833333333333
        1415.52083333333
        1574.27083333333)
      Shape = qrsRectangle
    end
    object QRShape13: TQRShape
      Left = 601
      Top = 559
      Width = 113
      Height = 68
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        179.916666666667
        1590.14583333333
        1479.02083333333
        298.979166666667)
      Shape = qrsRectangle
    end
    object QRShape14: TQRShape
      Left = 4
      Top = 559
      Width = 595
      Height = 68
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        179.916666666667
        10.5833333333333
        1479.02083333333
        1574.27083333333)
      Shape = qrsRectangle
    end
    object QRLabel4: TQRLabel
      Left = 8
      Top = 512
      Width = 576
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        21.1666666666667
        1354.66666666667
        1524)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 
        'Estado de cuenta original del financiamiento certificado por el ' +
        'Contador del Intermediario financiero'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 8
      Top = 536
      Width = 576
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        21.1666666666667
        1418.16666666667
        1524)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Documentos que comprueben haber realizado las gestiones de cobro'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object qrMemo2: TQRMemo
      Left = 8
      Top = 560
      Width = 576
      Height = 66
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        174.625
        21.1666666666667
        1481.66666666667
        1524)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Lines.Strings = (
        
          'Carta que indique ubicación del expediente respecto del cual se ' +
          'solicita el desembolso, el producto del intermediario al amparo ' +
          'del cual se autorizó el financiamiento y, en su caso, el nombre,' +
          ' teléfono y ubicación del funcionario del intermediario que aten' +
          'derá la visita de supervisión.')
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText1: TQRDBText
      Left = 647
      Top = 481
      Width = 21
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1711.85416666667
        1272.64583333333
        55.5625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'COPIA'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText3: TQRDBText
      Left = 647
      Top = 513
      Width = 21
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1711.85416666667
        1357.3125
        55.5625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'ESO_CTA'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 647
      Top = 537
      Width = 21
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1711.85416666667
        1420.8125
        55.5625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'DOCTOS'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText5: TQRDBText
      Left = 647
      Top = 576
      Width = 21
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1711.85416666667
        1524
        55.5625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'CARTA'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape20: TQRShape
      Left = 147
      Top = 2
      Width = 270
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        388.9375
        5.29166666666667
        714.375)
      Shape = qrsRectangle
    end
    object QRShape21: TQRShape
      Left = 147
      Top = 25
      Width = 270
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        388.9375
        66.1458333333333
        714.375)
      Shape = qrsRectangle
    end
    object QRShape39: TQRShape
      Left = 147
      Top = 48
      Width = 270
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        388.9375
        127
        714.375)
      Shape = qrsRectangle
    end
    object QRShape40: TQRShape
      Left = 4
      Top = 108
      Width = 412
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        171.979166666667
        10.5833333333333
        285.75
        1090.08333333333)
      Shape = qrsRectangle
    end
    object QRShape41: TQRShape
      Left = 573
      Top = 2
      Width = 141
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1516.0625
        5.29166666666667
        373.0625)
      Shape = qrsRectangle
    end
    object QRShape42: TQRShape
      Left = 573
      Top = 25
      Width = 141
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1516.0625
        66.1458333333333
        373.0625)
      Shape = qrsRectangle
    end
    object QRShape43: TQRShape
      Left = 573
      Top = 48
      Width = 141
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1516.0625
        127
        373.0625)
      Shape = qrsRectangle
    end
    object QRShape44: TQRShape
      Left = 573
      Top = 107
      Width = 141
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1516.0625
        283.104166666667
        373.0625)
      Shape = qrsRectangle
    end
    object QRShape45: TQRShape
      Left = 573
      Top = 84
      Width = 141
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1516.0625
        222.25
        373.0625)
      Shape = qrsRectangle
    end
    object QRShape46: TQRShape
      Left = 573
      Top = 153
      Width = 141
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1516.0625
        404.8125
        373.0625)
      Shape = qrsRectangle
    end
    object QRShape47: TQRShape
      Left = 573
      Top = 130
      Width = 141
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1516.0625
        343.958333333333
        373.0625)
      Shape = qrsRectangle
    end
    object QRDBText6: TQRDBText
      Left = 151
      Top = 3
      Width = 264
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        399.520833333333
        7.9375
        698.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'INTERMEDIARIO'
      Transparent = True
      WordWrap = False
      FontSize = 10
    end
    object QRDBText7: TQRDBText
      Left = 151
      Top = 26
      Width = 264
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        399.520833333333
        68.7916666666667
        698.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'NOM_ACRED'
      Transparent = True
      WordWrap = False
      FontSize = 10
    end
    object QRDBText8: TQRDBText
      Left = 151
      Top = 49
      Width = 264
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        82.0208333333333
        399.520833333333
        129.645833333333
        698.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'FINANCIAMIENTO'
      Transparent = True
      WordWrap = False
      FontSize = 10
    end
    object QRDBText9: TQRDBText
      Left = 576
      Top = 3
      Width = 135
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        1524
        7.9375
        357.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_VENCIMIENTO'
      Transparent = True
      WordWrap = False
      FontSize = 10
    end
    object QRDBText10: TQRDBText
      Left = 576
      Top = 26
      Width = 135
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        1524
        68.7916666666667
        357.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_VENC_01'
      Transparent = True
      WordWrap = False
      FontSize = 10
    end
    object QRDBText11: TQRDBText
      Left = 576
      Top = 55
      Width = 135
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        1524
        145.520833333333
        357.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_VENC_02'
      Transparent = True
      WordWrap = False
      FontSize = 10
    end
    object QRDBText12: TQRDBText
      Left = 576
      Top = 85
      Width = 135
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        1524
        224.895833333333
        357.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_VENC_03'
      Transparent = True
      WordWrap = False
      FontSize = 10
    end
    object QRDBText13: TQRDBText
      Left = 576
      Top = 108
      Width = 135
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        1524
        285.75
        357.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_VENC_04'
      Transparent = True
      WordWrap = False
      FontSize = 10
    end
    object QRDBText14: TQRDBText
      Left = 576
      Top = 131
      Width = 135
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        1524
        346.604166666667
        357.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_VENC_05'
      Transparent = True
      WordWrap = False
      FontSize = 10
    end
    object QRDBText15: TQRDBText
      Left = 576
      Top = 154
      Width = 135
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        1524
        407.458333333333
        357.1875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'F_VENC_06'
      Transparent = True
      WordWrap = False
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 8
      Top = 109
      Width = 406
      Height = 63
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        166.6875
        21.1666666666667
        288.395833333333
        1074.20833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'TX_CAUSA_INC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = False
      FontSize = 10
    end
    object QRDBText16: TQRDBText
      Left = 380
      Top = 204
      Width = 150
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1005.41666666667
        539.75
        396.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_ADEUDO_CAP'
      Mask = '###,###,###,###,##0.00'
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText17: TQRDBText
      Left = 380
      Top = 228
      Width = 150
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1005.41666666667
        603.25
        396.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_ADEUDO_INT'
      Mask = '###,###,###,###,##0.00'
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText18: TQRDBText
      Left = 380
      Top = 276
      Width = 150
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1005.41666666667
        730.25
        396.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'PCT_PART'
      Mask = '###,##0.0000'
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText19: TQRDBText
      Left = 380
      Top = 300
      Width = 150
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1005.41666666667
        793.75
        396.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'IMP_SOLICITAR'
      Mask = '###,###,###,###,##0.00'
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRExpr1: TQRExpr
      Left = 380
      Top = 252
      Width = 150
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1005.41666666667
        666.75
        396.875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'IMP_ADEUDO_CAP + IMP_ADEUDO_INT'
      Mask = '###,###,###,###,##0.00'
      FontSize = 10
    end
  end
  object QRGroup2: TQRGroup
    Left = 48
    Top = 771
    Width = 720
    Height = 163
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      431.270833333333
      1905)
    Expression = 'qyConsulta.ID_CREDITO'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape15: TQRShape
      Left = 4
      Top = 4
      Width = 709
      Height = 155
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        410.104166666667
        10.5833333333333
        10.5833333333333
        1875.89583333333)
      Shape = qrsRectangle
    end
    object QRShape16: TQRShape
      Left = 232
      Top = 118
      Width = 257
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        613.833333333333
        312.208333333333
        679.979166666667)
      Shape = qrsHorLine
    end
    object QRLabel1: TQRLabel
      Left = 232
      Top = 124
      Width = 257
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        613.833333333333
        328.083333333333
        679.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'INTERMEDIARIO FINANCIERO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 232
      Top = 137
      Width = 257
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        613.833333333333
        362.479166666667
        679.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Nombre y firma autorizada'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText21: TQRDBText
      Left = 232
      Top = 105
      Width = 257
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        613.833333333333
        277.8125
        679.979166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsulta
      DataField = 'NOMBRE'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object ColumnHeaderBand1: TQRBand
    Left = 48
    Top = 70
    Width = 720
    Height = 72
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      190.5
      1905)
    BandType = rbColumnHeader
    object QRShape17: TQRShape
      Left = 4
      Top = 20
      Width = 710
      Height = 49
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        129.645833333333
        10.5833333333333
        52.9166666666667
        1878.54166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 8
      Top = 21
      Width = 699
      Height = 47
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        124.354166666667
        21.1666666666667
        55.5625
        1849.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        'Solicitamos a Nacional Financiera, S.N.C., como Fiduciaria del F' +
        'ideicomiso No. 1148.0, Fondo para la Participación de Riesgos, e' +
        'l desembolso de la participación en el financiamiento cuyos dato' +
        's se detallan a continuación:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 262
      Top = 2
      Width = 195
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625
        693.208333333333
        5.29166666666667
        515.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '-SOLICITUD DE DESEMBOLSO-'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
  end
  object PageFooterBand1: TQRBand
    Left = 48
    Top = 934
    Width = 720
    Height = 24
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
      63.5
      1905)
    BandType = rbPageFooter
    object QRShape4: TQRShape
      Left = 0
      Top = 11
      Width = 720
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.29166666666667
        0
        29.1041666666667
        1905)
      Shape = qrsHorLine
    end
    object QRShape18: TQRShape
      Left = 0
      Top = 15
      Width = 720
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.9375
        0
        39.6875
        1905)
      Brush.Color = 4194368
      Shape = qrsRectangle
    end
    object QRShape19: TQRShape
      Left = 0
      Top = 19
      Width = 720
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.29166666666667
        0
        50.2708333333333
        1905)
      Shape = qrsHorLine
    end
  end
  object qyConsulta: TQuery
    DatabaseName = 'DCORP'
    Left = 128
    Top = 45
  end
end
