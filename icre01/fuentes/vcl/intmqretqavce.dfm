object QrEtqAvCe: TQrEtqAvCe
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  Frame.Width = 0
  DataSet = qyEtqAvCe
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  Functions.Strings = (
    'PAGENUMBER'
    'COLUMNNUMBER'
    'REPORTTITLE'
    'QRSTRINGSBAND1')
  Functions.DATA = (
    '0'
    '0'
    #39#39
    #39#39)
  Options = [FirstPageHeader, LastPageFooter]
  Page.Columns = 1
  Page.Orientation = poPortrait
  Page.PaperSize = Letter
  Page.Values = (
    0
    2794
    0
    2159
    50.8
    50.8
    0)
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = Manual
  PrintIfEmpty = True
  SnapToGrid = True
  Units = Inches
  Zoom = 100
  object QRGroup1: TQRGroup
    Left = 19
    Top = 49
    Width = 778
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
      2058.45833333333)
    Expression = 'qyAvCesion.ID_CESION'
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRBand2: TQRBand
    Left = 19
    Top = 49
    Width = 778
    Height = 96
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
      254
      2058.45833333333)
    BandType = rbDetail
    object QRNombre: TQRLabel
      Left = 8
      Top = 6
      Width = 217
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        21.1666666666667
        15.875
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRNombre'
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
    object QRNombre1: TQRLabel
      Left = 278
      Top = 6
      Width = 217
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        735.541666666667
        15.875
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRNombre'
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
    object QRNombre2: TQRLabel
      Left = 544
      Top = 6
      Width = 217
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1439.33333333333
        15.875
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRNombre'
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
    object qrATN: TQRLabel
      Left = 8
      Top = 18
      Width = 217
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        21.1666666666667
        47.625
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrATN'
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
    object qrCALLE: TQRLabel
      Left = 8
      Top = 30
      Width = 217
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        21.1666666666667
        79.375
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrCALLE'
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
    object qrTEL: TQRLabel
      Left = 8
      Top = 69
      Width = 217
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        21.1666666666667
        182.5625
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrTEL'
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
    object qrDIR: TQRLabel
      Left = 8
      Top = 56
      Width = 217
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        21.1666666666667
        148.166666666667
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrDIR'
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
    object qrATN1: TQRLabel
      Left = 278
      Top = 18
      Width = 217
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        735.541666666667
        47.625
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrATN'
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
    object qrCALLE1: TQRLabel
      Left = 278
      Top = 31
      Width = 217
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        735.541666666667
        82.0208333333333
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrCALLE'
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
    object qrDIR1: TQRLabel
      Left = 278
      Top = 57
      Width = 217
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        735.541666666667
        150.8125
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrDIR'
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
    object qrTEL1: TQRLabel
      Left = 278
      Top = 70
      Width = 217
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        735.541666666667
        185.208333333333
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrTEL'
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
    object qrATN2: TQRLabel
      Left = 544
      Top = 18
      Width = 217
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1439.33333333333
        47.625
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrATN'
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
    object qrCALLE2: TQRLabel
      Left = 544
      Top = 31
      Width = 217
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1439.33333333333
        82.0208333333333
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrCALLE'
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
    object qrDIR2: TQRLabel
      Left = 544
      Top = 57
      Width = 217
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1439.33333333333
        150.8125
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrDIR'
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
    object qrTEL2: TQRLabel
      Left = 544
      Top = 70
      Width = 217
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1439.33333333333
        185.208333333333
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrTEL'
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
    object qrCOLONIA: TQRLabel
      Left = 8
      Top = 43
      Width = 217
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        21.1666666666667
        113.770833333333
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrCOLONIA'
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
    object qrCOLONIA1: TQRLabel
      Left = 278
      Top = 44
      Width = 217
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        735.541666666667
        116.416666666667
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrCOLONIA'
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
    object qrCOLONIA2: TQRLabel
      Left = 544
      Top = 44
      Width = 217
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1439.33333333333
        116.416666666667
        574.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrCOLONIA'
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
  end
  object QRBand1: TQRBand
    Left = 19
    Top = 0
    Width = 778
    Height = 49
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
      129.645833333333
      2058.45833333333)
    BandType = rbPageHeader
  end
  object qyEtqAvCe: TQuery
    DatabaseName = 'DCORP'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT'
      'CCE.ID_CESION, '
      
        'DECODE(PCE.CVE_PER_JURIDICA,'#39'PM'#39',PCE.NOMBRE,PE.APELLIDO_PATERNO|' +
        '|'#39' '#39'||PE.APELLIDO_MATERNO||'#39' '#39'||PE.NOMBRE_PERSONA) NOM_EMISOR, '
      'PP.NOMBRE NOM_PROVEEDOR, '
      '(RFC.SIGLAS_RFC||RFC.F_RFC||RFC.HOMOCLAVE_RFC) RFC_E, '
      '(RFC_P.SIGLAS_RFC||RFC_P.F_RFC||RFC_P.HOMOCLAVE_RFC) RFC_P, '
      'DME.CALLE_NUMERO DIRECCION_E, '
      'DME.COLONIA COLONIA_E,'
      'PBDE.DESC_POBLACION DELEGACION_E, '
      'DME.CODIGO_POSTAL CODIGO_POSTAL_E, '
      'PBCE.DESC_POBLACION CIUDAD_E, '
      'DMP.CALLE_NUMERO DIRECCION_P, '
      'DMP.COLONIA COLONIA_P,'
      'PBDP.DESC_POBLACION DELEGACION_P, '
      'DMP.CODIGO_POSTAL CODIGO_POSTAL_P, '
      'PBCP.DESC_POBLACION CIUDAD_P, '
      'CPR.DESC_L_PRODUCTO, '
      #39'1000'#39' CTA_EMI,'
      #39'1000'#39' CTA_PROV, '
      'M.DESC_MONEDA, '
      '1000 IMP_CAPITAL, '
      '0 IMP_INTERES, '
      '0 IMP_IVA, '
      '0 IMP_TOTAL_INT, '
      #39'ABONO'#39' AVISO, '
      'CCE.F_ALTA, '
      'CCE.F_AUTORIZA,'
      '0 CERO,0 CONCEPTO,0 IVA,0 IMPORTE_TOT '
      'FROM '
      'CR_CESION     CCE, '
      'PERSONA_FISICA  PE, '
      'PERSONA       PCE, '
      'PERSONA       PP, '
      'RFC, '
      'RFC RFC_P, '
      'CR_CREDITO    CC, '
      'CONTRATO      CTO, '
      'DOMICILIO     DME, '
      'POBLACION     PBDE, '
      'POBLACION     PBCE, '
      'DOMICILIO     DMP, '
      'POBLACION     PBDP, '
      'POBLACION     PBCP, '
      'CR_CONTRATO   CCTO, '
      'CR_PRODUCTO   CPR, '
      'CR_EMISOR     CE, '
      'CR_PROVEEDOR  CPV, '
      'MONEDA        M'
      '')
    Left = 292
    object qyEtqAvCeDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyEtqAvCeNOMBRE_P: TStringField
      FieldName = 'NOMBRE_P'
      Size = 80
    end
    object qyEtqAvCeCALLE_P: TStringField
      FieldName = 'CALLE_P'
      Size = 80
    end
    object qyEtqAvCeDIR_P: TStringField
      FieldName = 'DIR_P'
      Size = 150
    end
    object qyEtqAvCeTEL_P: TStringField
      FieldName = 'TEL_P'
      Size = 150
    end
    object qyEtqAvCeATN: TStringField
      FieldName = 'ATN'
      Size = 80
    end
    object qyEtqAvCeCOL_P: TStringField
      FieldName = 'COL_P'
      Size = 80
    end
  end
end
