object WCrQREmail: TWCrQREmail
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = QEmail
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
    99.06
    2794
    99.06
    2159
    99.06
    99.06
    0)
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = Auto
  PrintIfEmpty = True
  SnapToGrid = True
  Units = Inches
  Zoom = 100
  object PageHeaderBand1: TQRBand
    Left = 37
    Top = 37
    Width = 741
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
      1960.5625)
    BandType = rbPageHeader
    object QRInterEncabezado1: TQRInterEncabezado
      Left = 0
      Top = 0
      Width = 741
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
        1960.5625)
      Titulo1 = 'REPORTE MAIL ENVIADOS'
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
  object QRGAcred: TQRGroup
    Left = 37
    Top = 153
    Width = 741
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
      1960.5625)
    Expression = 'QCtaAcred.ID_ACREDITADO'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape10: TQRShape
      Left = 5
      Top = 1
      Width = 365
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        13.2291666666667
        2.64583333333333
        965.729166666667)
      Shape = qrsRectangle
    end
    object QRLabel23: TQRLabel
      Left = 8
      Top = 2
      Width = 28
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        21.1666666666667
        5.29166666666667
        74.0833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'FECHA:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = 9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = -7
    end
    object QRDBText3: TQRDBText
      Left = 48
      Top = 2
      Width = 31
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        127
        5.29166666666667
        82.0208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QEmail
      DataField = 'F_ENVIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = -7
    end
  end
  object QRGroup1: TQRGroup
    Left = 37
    Top = 167
    Width = 741
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
      1960.5625)
    Expression = 'QCtaAcred.ID_CREDITO'
    Master = Owner
    ReprintOnNewPage = False
    object QRShape2: TQRShape
      Left = 24
      Top = 1
      Width = 625
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        63.5
        2.64583333333333
        1653.64583333333)
      Shape = qrsRectangle
    end
    object QRLabel4: TQRLabel
      Left = 31
      Top = 2
      Width = 54
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        82.0208333333333
        5.29166666666667
        142.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'DISPOSICIÓN : '
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = 9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = -7
    end
    object QRDBText4: TQRDBText
      Left = 104
      Top = 2
      Width = 44
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        275.166666666667
        5.29166666666667
        116.416666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QEmail
      DataField = 'ID_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = -7
    end
    object QRDBText12: TQRDBText
      Left = 200
      Top = 2
      Width = 31
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        529.166666666667
        5.29166666666667
        82.0208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QEmail
      DataField = 'NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = -7
    end
  end
  object DetailBand1: TQRBand
    Left = 37
    Top = 182
    Width = 741
    Height = 42
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = DetailBand1AfterPrint
    AlignToBottom = False
    BeforePrint = DetailBand1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = True
    Size.Values = (
      111.125
      1960.5625)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 32
      Top = 5
      Width = 40
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        84.6666666666667
        13.2291666666667
        105.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Color = clWhite
      DataSet = QEmail
      DataField = 'NUM_FOLIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = -7
    end
    object QRExpr4: TQRExpr
      Left = 678
      Top = 5
      Width = 53
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        1793.875
        13.2291666666667
        140.229166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 9
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'IF(QEmail.SIT_ENVIO_EMAIL = '#39'EN'#39','#39'ENVIADO'#39','#39'CON ERROR'#39')'
      FontSize = -7
    end
    object QRExpr3: TQRExpr
      Left = 651
      Top = 5
      Width = 25
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        1722.4375
        13.2291666666667
        66.1458333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 9
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = #39'('#39' +  QEmail.SIT_ENVIO_EMAIL +'#39')'#39
      FontSize = -7
    end
    object QRMDestinatarios: TQRMemo
      Left = 344
      Top = 5
      Width = 300
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        910.166666666667
        13.2291666666667
        793.75)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = -7
    end
    object QRDBText2: TQRDBText
      Left = 80
      Top = 5
      Width = 257
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        211.666666666667
        13.2291666666667
        679.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = QEmail
      DataField = 'TITULO_FINAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = -7
    end
    object QRMTextoFinal: TQRMemo
      Left = 48
      Top = 18
      Width = 673
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        127
        47.625
        1780.64583333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = -7
    end
  end
  object QRBand1: TQRBand
    Left = 37
    Top = 121
    Width = 741
    Height = 32
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
      84.6666666666667
      1960.5625)
    BandType = rbColumnHeader
    object QRLabel1: TQRLabel
      Left = 32
      Top = 3
      Width = 24
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        84.6666666666667
        7.9375
        63.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'FOLIO:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = 9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = -7
    end
    object QRLabel5: TQRLabel
      Left = 48
      Top = 19
      Width = 35
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        127
        50.2708333333333
        92.6041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'MENSAJE'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = 9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = -7
    end
    object QRLabel2: TQRLabel
      Left = 80
      Top = 3
      Width = 22
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        211.666666666667
        7.9375
        58.2083333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TEXTO'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = 9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = -7
    end
    object QRLabel3: TQRLabel
      Left = 344
      Top = 3
      Width = 56
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        910.166666666667
        7.9375
        148.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'DESTINATARIOS'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = 9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = -7
    end
    object QRLabel9: TQRLabel
      Left = 688
      Top = 3
      Width = 38
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        1820.33333333333
        7.9375
        100.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'SITUACIÓN'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = 9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = -7
    end
    object QRShape1: TQRShape
      Left = 16
      Top = 30
      Width = 727
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.29166666666667
        42.3333333333333
        79.375
        1923.52083333333)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
  end
  object QEmail: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'SELECT E.NUM_FOLIO,'
      '               E.ID_CREDITO,'
      '               P.NOMBRE,'
      '               F_ENVIO,'
      '               E.TITULO_FINAL,'
      '               E.TEXTO_FINAL,'
      '               E.DESTINATARIO,'
      '               E.SIT_ENVIO_EMAIL'
      'FROM   CR_EMAIL_ENVIO E,'
      '       PERSONA P,'
      '       CR_CREDITO CR,'
      '       CR_CONTRATO CC,'
      '       CONTRATO C'
      'WHERE C.ID_CONTRATO = CC.ID_CONTRATO'
      'AND CC.ID_CONTRATO = CR.ID_CONTRATO'
      'AND CC.FOL_CONTRATO = CR.FOL_CONTRATO'
      'AND CR.ID_CREDITO = E.ID_CREDITO'
      'AND P.ID_PERSONA = C.ID_TITULAR')
    Left = 3
    Top = 14
    object QEmailNUM_FOLIO: TFloatField
      FieldName = 'NUM_FOLIO'
    end
    object QEmailID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object QEmailNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object QEmailF_ENVIO: TDateTimeField
      FieldName = 'F_ENVIO'
    end
    object QEmailSIT_ENVIO_EMAIL: TStringField
      FieldName = 'SIT_ENVIO_EMAIL'
      Size = 2
    end
    object QEmailDESTINATARIO: TMemoField
      FieldName = 'DESTINATARIO'
      BlobType = ftMemo
      Size = 1000
    end
    object QEmailTEXTO_FINAL: TMemoField
      FieldName = 'TEXTO_FINAL'
      BlobType = ftMemo
      Size = 4000
    end
    object QEmailTITULO_FINAL: TStringField
      FieldName = 'TITULO_FINAL'
      Size = 255
    end
  end
end
