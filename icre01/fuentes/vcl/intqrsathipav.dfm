object QrSatHipAv: TQrSatHipAv
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = qMain
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -9
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
    87
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
  Units = MM
  Zoom = 100
  object QRDetalle: TQRBand
    Left = 48
    Top = 111
    Width = 720
    Height = 689
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRDetalleBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = True
    Size.Values = (
      1822.97916666667
      1905)
    BandType = rbDetail
    object QRShape2: TQRShape
      Left = 15
      Top = 17
      Width = 416
      Height = 118
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        312.208333333333
        39.6875
        44.9791666666667
        1100.66666666667)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRShape1: TQRShape
      Left = 8
      Top = 11
      Width = 416
      Height = 118
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        312.208333333333
        21.1666666666667
        29.1041666666667
        1100.66666666667)
      Shape = qrsRectangle
    end
    object QRDBText1: TQRDBText
      Left = 23
      Top = 36
      Width = 321
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        60.8541666666667
        95.25
        849.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qMain
      DataField = 'NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBText2: TQRDBText
      Left = 39
      Top = 54
      Width = 76
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        103.1875
        142.875
        201.083333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qMain
      DataField = 'CALLE_NUMERO'
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
      Left = 39
      Top = 68
      Width = 43
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        103.1875
        179.916666666667
        113.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qMain
      DataField = 'COLONIA'
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
      Left = 39
      Top = 80
      Width = 38
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        103.1875
        211.666666666667
        100.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qMain
      DataField = 'CIUDAD'
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
      Left = 38
      Top = 93
      Width = 38
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        100.541666666667
        246.0625
        100.541666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qMain
      DataField = 'ESTADO'
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
    object QRDBText6: TQRDBText
      Left = 38
      Top = 107
      Width = 22
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        100.541666666667
        283.104166666667
        58.2083333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qMain
      DataField = 'PAIS'
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
    object QRLabel1: TQRLabel
      Left = 318
      Top = 82
      Width = 20
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        841.375
        216.958333333333
        52.9166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'C.P.'
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
    object QRDBText7: TQRDBText
      Left = 343
      Top = 82
      Width = 79
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        907.520833333333
        216.958333333333
        209.020833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qMain
      DataField = 'CODIGO_POSTAL'
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
    object qrlbCVE_CORRESP: TQRLabel
      Left = 279
      Top = 112
      Width = 136
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        738.1875
        296.333333333333
        359.833333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CORRESPONDENCIA'
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
    object QRShape11: TQRShape
      Left = 1039
      Top = 80
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        171.979166666667
        2748.359375
        211.666666666667
        171.979166666667)
      Shape = qrsRectangle
    end
    object QRDBText21: TQRDBText
      Left = 318
      Top = 96
      Width = 103
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        841.375
        254
        272.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qMain
      DataField = 'RFC'
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
    object QRShape4: TQRShape
      Left = 160
      Top = 257
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        171.979166666667
        423.333333333333
        679.979166666667
        171.979166666667)
      Brush.Color = clBlack
      Shape = qrsRectangle
    end
    object QRShape3: TQRShape
      Left = 144
      Top = 251
      Width = 497
      Height = 337
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        891.645833333333
        381
        664.104166666667
        1314.97916666667)
      Shape = qrsRectangle
    end
    object QRMemo: TQRMemo
      Left = 160
      Top = 264
      Width = 465
      Height = 316
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        836.083333333333
        423.333333333333
        698.5
        1230.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        
          'De  acuerdo  a los  establecido  en  la  Ley del Impuesto  Sobre' +
          '  la '
        
          'Renta y en relación con el  crédito  hipotecario   que  mantiene' +
          ' con '
        
          'esta institución,  sírvase encontrar la  constancia  por  concep' +
          'to  de'
        
          'intereses reales  devengados y pagados durante el ejercicio fisc' +
          'al '
        
          '         ,  mismos que  podrá  deducir  en su   declaración   an' +
          'ual  del '
        'Impuesto  Sobre la Renta correspondiente  al  citado  ejercicio.'
        ''
        
          'Para  mayor  información  consulte  nuestra  página  de  interne' +
          't.  '
        ''
        'http://www.interacciones.com'
        ''
        'Atentamente,'
        ''
        ''
        'Banco Interacciones, S. A.'
        'Institución de Banca Múltiple'
        'Grupo Financiero Interacciones')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object qrlblEjercicio: TQRLabel
      Left = 161
      Top = 336
      Width = 33
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.2708333333333
        425.979166666667
        889
        87.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '20xx'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
  end
  object PageHeaderBand1: TQRBand
    Left = 48
    Top = 33
    Width = 720
    Height = 78
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = True
    Size.Values = (
      206.375
      1905)
    BandType = rbPageHeader
  end
  object qMain: TQuery
    DatabaseName = 'DCORP'
    Left = 20
    Top = 21
    object qMainID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qMainID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qMainID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object qMainID_DOMICILIO: TFloatField
      FieldName = 'ID_DOMICILIO'
    end
    object qMainCVE_CORRESP: TStringField
      FieldName = 'CVE_CORRESP'
      Size = 2
    end
    object qMainAPELLIDO_PATERNO: TStringField
      FieldName = 'APELLIDO_PATERNO'
    end
    object qMainAPELLIDO_MATERNO: TStringField
      FieldName = 'APELLIDO_MATERNO'
    end
    object qMainNOMBRE_PERSONA: TStringField
      FieldName = 'NOMBRE_PERSONA'
    end
    object qMainNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 62
    end
    object qMainRFC: TStringField
      FieldName = 'RFC'
      Size = 14
    end
    object qMainCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qMainF_LIQ_BNC: TDateTimeField
      FieldName = 'F_LIQ_BNC'
    end
    object qMainCALLE_NUMERO: TStringField
      FieldName = 'CALLE_NUMERO'
      Size = 60
    end
    object qMainCOLONIA: TStringField
      FieldName = 'COLONIA'
      Size = 40
    end
    object qMainCODIGO_POSTAL: TStringField
      FieldName = 'CODIGO_POSTAL'
      Size = 6
    end
    object qMainCIUDAD: TStringField
      FieldName = 'CIUDAD'
      Size = 40
    end
    object qMainESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 40
    end
    object qMainPAIS: TStringField
      FieldName = 'PAIS'
      Size = 40
    end
    object qMainCVE_PRODUCTO: TStringField
      FieldName = 'CVE_PRODUCTO'
      Size = 6
    end
  end
end
