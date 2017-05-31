object qrCartaDepRef: TqrCartaDepRef
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qry
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
    200
    2794
    250
    2159
    317
    317
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
  object QRGroup1: TQRGroup
    Left = 120
    Top = 94
    Width = 576
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
      1524)
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRBand1: TQRBand
    Left = 120
    Top = 94
    Width = 576
    Height = 870
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      2301.875
      1524)
    BandType = rbDetail
    object QRMemo24: TQRMemo
      Left = 171
      Top = 653
      Width = 205
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        452.4375
        1727.72916666667
        542.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        ''
        '   RAP: 5697')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo23: TQRMemo
      Left = 171
      Top = 612
      Width = 205
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        452.4375
        1619.25
        542.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        ''
        '   NO. DE EMPRESA: 23358')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo22: TQRMemo
      Left = 171
      Top = 571
      Width = 205
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        452.4375
        1510.77083333333
        542.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        ''
        '   CUENTA: 65500555437 SUC: 032')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo21: TQRMemo
      Left = 171
      Top = 532
      Width = 205
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        452.4375
        1407.58333333333
        542.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        ''
        '   CONVENIO CIE: 514704')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo13: TQRMemo
      Left = 171
      Top = 492
      Width = 205
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        452.4375
        1301.75
        542.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        ''
        '   CUENTA 6077810 SUC. 233')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo12: TQRMemo
      Left = 3
      Top = 492
      Width = 170
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        7.9375
        1301.75
        449.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        ''
        '   BANAMEX')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo7: TQRMemo
      Left = 3
      Top = 355
      Width = 170
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        7.9375
        939.270833333333
        449.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        ''
        '   INTERACCIONES')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo9: TQRMemo
      Left = 375
      Top = 355
      Width = 195
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        992.1875
        939.270833333333
        515.9375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        ''
        'SIN REFERENCIA')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo6: TQRMemo
      Left = 375
      Top = 314
      Width = 195
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        992.1875
        830.791666666667
        515.9375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Lines.Strings = (
        'REFERENCIA')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBText1: TQRDBText
      Left = 3
      Top = 2
      Width = 59
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        7.9375
        5.29166666666667
        156.104166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qry
      DataField = 'NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRMemo1: TQRMemo
      Left = 2
      Top = 24
      Width = 572
      Height = 177
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        468.3125
        5.29166666666667
        63.5
        1513.41666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        ''
        ''
        
          'Aprovechamos esta ocasión  para enviarle un afectuoso saludo y  ' +
          'recordarle que usted  puede  realizar pagos  a  su(s)  crédito(s' +
          ') que tiene celebrado(s) con  Banco Interacciones,   mediante la' +
          ' modalidad de “Depósito Referenciado“ y “SPEI” , en Banamex, BBV' +
          'A-Bancomer, Santander Serfin, Banorte y HSBC.'
        ''
        
          'Utilizar el “ Depósito Referenciado “ y “ SPEI ” le ofrece la pl' +
          'ena  seguridad y  comodidad de  que  sus depósitos serán acredit' +
          'ados y aplicados oportunamente a sus créditos.'
        ''
        
          'Los  datos  que  deberá  anotar  en  las  fichas  de  depósito o' +
          ' en algún medio electrónico vía Banamex, BBVA-Bancomer, Santande' +
          'r Serfin, Banorte y HSBC al momento de efectuar sus pagos son :'
        ''
        '')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo2: TQRMemo
      Left = 3
      Top = 195
      Width = 570
      Height = 94
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        248.708333333333
        7.9375
        515.9375
        1508.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      Lines.Strings = (
        '1. Número de  referencia. '
        ''
        ''
        ''
        
          '2. Número de cuenta de cheques o convenio entre Banco Interaccio' +
          'nes y las siguientes Instituciones Bancarias:')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo3: TQRMemo
      Left = 3
      Top = 289
      Width = 570
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        7.9375
        764.645833333333
        1508.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Lines.Strings = (
        'A)  PAGO POR SPEI')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel1: TQRLabel
      Left = 3
      Top = 32
      Width = 98
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        7.9375
        84.6666666666667
        259.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Estimado cliente:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo5: TQRMemo
      Left = 171
      Top = 314
      Width = 205
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        452.4375
        830.791666666667
        542.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Lines.Strings = (
        ''
        'CUENTA')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo4: TQRMemo
      Left = 3
      Top = 314
      Width = 170
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        7.9375
        830.791666666667
        449.791666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Lines.Strings = (
        ''
        'BANCO')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo10: TQRMemo
      Left = 3
      Top = 413
      Width = 562
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        82.0208333333333
        7.9375
        1092.72916666667
        1486.95833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Lines.Strings = (
        ''
        'B)  PAGO REFERENCIADO'
        '')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo11: TQRMemo
      Left = 3
      Top = 452
      Width = 170
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        7.9375
        1195.91666666667
        449.791666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Lines.Strings = (
        ''
        'BANCO')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo16: TQRMemo
      Left = 375
      Top = 452
      Width = 195
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        992.1875
        1195.91666666667
        515.9375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Lines.Strings = (
        'REFERENCIA')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel3: TQRLabel
      Left = 411
      Top = 467
      Width = 125
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1087.4375
        1235.60416666667
        330.729166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '(CUENTA DE CHEQUES + DIGITO VERIFICADOR)'
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
    object QRMemo17: TQRMemo
      Left = 3
      Top = 532
      Width = 170
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        7.9375
        1407.58333333333
        449.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        ''
        '   BANCOMER')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo18: TQRMemo
      Left = 3
      Top = 571
      Width = 170
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        7.9375
        1510.77083333333
        449.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        ''
        '   SANTANDER SERFIN')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo19: TQRMemo
      Left = 3
      Top = 612
      Width = 170
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        7.9375
        1619.25
        449.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        ''
        '   BANORTE')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo20: TQRMemo
      Left = 3
      Top = 653
      Width = 170
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        7.9375
        1727.72916666667
        449.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        ''
        '   HSBC')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo29: TQRMemo
      Left = 3
      Top = 696
      Width = 570
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        7.9375
        1841.5
        1508.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      Lines.Strings = (
        
          'Nota: Únicamente podrá efectuar depósitos en las cuentas de cheq' +
          'ues  que se detallan, el titular de las mismas es Banco interacc' +
          'iones, S.A. de C.V.'
        '')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo30: TQRMemo
      Left = 3
      Top = 733
      Width = 570
      Height = 91
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        240.770833333333
        7.9375
        1939.39583333333
        1508.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        
          'Cabe mencionar que el horario límite para que usted realice dich' +
          'os depósitos será hasta  las 15:00 hrs. con el fin de acreditarl' +
          'os el mismo día, de no ser así, serán acreditados al día hábil s' +
          'iguiente.'
        ''
        ''
        
          'Si  usted  tiene  dudas  acerca  de cómo realizar estas operacio' +
          'nes, comuníquese directamente con su promotor y con mucho gusto ' +
          'le atenderemos.'
        '')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMC: TQRMemo
      Left = 171
      Top = 355
      Width = 205
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        452.4375
        939.270833333333
        542.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        ''
        '   CLABE:')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRM1: TQRMemo
      Left = 375
      Top = 492
      Width = 195
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        992.1875
        1301.75
        515.9375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
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
    object QRM2: TQRMemo
      Left = 375
      Top = 532
      Width = 195
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        992.1875
        1407.58333333333
        515.9375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
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
    object QRM3: TQRMemo
      Left = 375
      Top = 571
      Width = 195
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        992.1875
        1510.77083333333
        515.9375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
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
    object QRM4: TQRMemo
      Left = 375
      Top = 612
      Width = 195
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        992.1875
        1619.25
        515.9375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
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
    object QRM5: TQRMemo
      Left = 375
      Top = 653
      Width = 195
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        992.1875
        1727.72916666667
        515.9375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
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
    object QRLabel2: TQRLabel
      Left = 411
      Top = 329
      Width = 125
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        1087.4375
        870.479166666667
        330.729166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '(CUENTA DE CHEQUES + DIGITO VERIFICADOR)'
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
    object QRMemo14: TQRMemo
      Left = 172
      Top = 452
      Width = 205
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        111.125
        455.083333333333
        1195.91666666667
        542.395833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Lines.Strings = (
        ''
        'CUENTA')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRShape1: TQRShape
      Left = 3
      Top = 610
      Width = 569
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.9375
        7.9375
        1613.95833333333
        1505.47916666667)
      Shape = qrsHorLine
    end
    object QRShape2: TQRShape
      Left = 3
      Top = 570
      Width = 569
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.9375
        7.9375
        1508.125
        1505.47916666667)
      Shape = qrsHorLine
    end
    object QRShape3: TQRShape
      Left = 3
      Top = 530
      Width = 569
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.9375
        7.9375
        1402.29166666667
        1505.47916666667)
      Shape = qrsHorLine
    end
    object QRShape4: TQRShape
      Left = 3
      Top = 492
      Width = 569
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.9375
        7.9375
        1301.75
        1505.47916666667)
      Shape = qrsHorLine
    end
    object QRShape5: TQRShape
      Left = 3
      Top = 450
      Width = 569
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.9375
        7.9375
        1190.625
        1505.47916666667)
      Shape = qrsHorLine
    end
    object QRShape6: TQRShape
      Left = 3
      Top = 394
      Width = 569
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.9375
        7.9375
        1042.45833333333
        1505.47916666667)
      Shape = qrsHorLine
    end
    object QRShape7: TQRShape
      Left = 3
      Top = 354
      Width = 569
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.9375
        7.9375
        936.625
        1505.47916666667)
      Shape = qrsHorLine
    end
    object QRShape8: TQRShape
      Left = 3
      Top = 312
      Width = 568
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.9375
        7.9375
        825.5
        1502.83333333333)
      Shape = qrsHorLine
    end
    object QRShape9: TQRShape
      Left = 3
      Top = 692
      Width = 569
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.9375
        7.9375
        1830.91666666667
        1505.47916666667)
      Shape = qrsHorLine
    end
    object QRShape10: TQRShape
      Left = 3
      Top = 652
      Width = 569
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.9375
        7.9375
        1725.08333333333
        1505.47916666667)
      Shape = qrsHorLine
    end
    object QRShape11: TQRShape
      Left = 170
      Top = 314
      Width = 2
      Height = 82
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        216.958333333333
        449.791666666667
        830.791666666667
        5.29166666666667)
      Shape = qrsVertLine
    end
    object QRShape12: TQRShape
      Left = 2
      Top = 314
      Width = 2
      Height = 82
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        216.958333333333
        5.29166666666667
        830.791666666667
        5.29166666666667)
      Shape = qrsVertLine
    end
    object QRShape13: TQRShape
      Left = 374
      Top = 314
      Width = 2
      Height = 82
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        216.958333333333
        989.541666666667
        830.791666666667
        5.29166666666667)
      Shape = qrsVertLine
    end
    object QRShape14: TQRShape
      Left = 170
      Top = 452
      Width = 2
      Height = 242
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        640.291666666667
        449.791666666667
        1195.91666666667
        5.29166666666667)
      Shape = qrsVertLine
    end
    object QRShape15: TQRShape
      Left = 570
      Top = 452
      Width = 2
      Height = 242
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        640.291666666667
        1508.125
        1195.91666666667
        5.29166666666667)
      Shape = qrsVertLine
    end
    object QRShape16: TQRShape
      Left = 374
      Top = 452
      Width = 2
      Height = 242
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        640.291666666667
        989.541666666667
        1195.91666666667
        5.29166666666667)
      Shape = qrsVertLine
    end
    object QRShape17: TQRShape
      Left = 2
      Top = 452
      Width = 2
      Height = 242
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        640.291666666667
        5.29166666666667
        1195.91666666667
        5.29166666666667)
      Shape = qrsVertLine
    end
    object QRShape18: TQRShape
      Left = 570
      Top = 314
      Width = 2
      Height = 82
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        216.958333333333
        1508.125
        830.791666666667
        5.29166666666667)
      Shape = qrsVertLine
    end
    object QRMemo8: TQRMemo
      Left = 2
      Top = 214
      Width = 575
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        5.29166666666667
        566.208333333333
        1521.35416666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        
          'En el caso de pago vía SPEI, usted no deberá anotar referencia a' +
          'lguna.'
        
          'En el caso de Pagos Referenciados, usted deberá anotar la refere' +
          'ncia que se indica en el inciso “B”.')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRMemo15: TQRMemo
      Left = 3
      Top = 832
      Width = 570
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        82.0208333333333
        7.9375
        2201.33333333333
        1508.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Lines.Strings = (
        'Atentamente'
        'Dirección de Operación Bancaria')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
  end
  object qry: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'SELECT '#39'X'#39' AS NOMBRE, '#39'X'#39' AS ID_CONTRATO,'
      '1 AS REF1, 2 AS REF2'
      'FROM DUAL')
    Left = 15
    Top = 16
    object qryNOMBRE: TStringField
      FieldName = 'NOMBRE'
      FixedChar = True
      Size = 1
    end
    object qryID_CONTRATO: TStringField
      FieldName = 'ID_CONTRATO'
      FixedChar = True
      Size = 1
    end
    object qryREF1: TFloatField
      FieldName = 'REF1'
    end
    object qryREF2: TFloatField
      FieldName = 'REF2'
    end
  end
  object SPDIGIT: TStoredProc
    StoredProcName = 'PKGDIGVRF.STPDIGVERIFICADOR'
    Top = 67
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PEREFNUMERICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PEREFALFNUMERICA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEIDMETODO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PSDIGVERIFICADORN'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'PSDIGVERIFICADORV'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'PSREFDIGVRFNUM'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'PSREFDIGVRFVCH'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'PSRESULTADO'
        ParamType = ptOutput
      end>
  end
end
