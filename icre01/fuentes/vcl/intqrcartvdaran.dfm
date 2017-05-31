object QrCartVdaRan: TQrCartVdaRan
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
  DataSet = qyCartVdaRan
  Description.Strings = (
    'SELECT DATOS.*,'
    
      '       DECODE(CVE_TIP_OPERACION, '#39'BL'#39',NVL(IMP_VTO - IMP_A_BLOQUE' +
      'AR,0),'
    
      '              '#39'DB'#39',NVL(IMP_A_BLOQUEAR-IMP_VTO,0),0)AS IMP_DIFERE' +
      'NCIA'
    '  FROM ('
    
      #9#9'SELECT CB.CUENTA_BANCO, CB.TX_NOTA, CB.F_OPERACION F_MOV, CB.I' +
      'MP_A_BLOQUEAR,'
    #9#9'       CB.F_PROG_DESBLQ, '
    #9#9'       (SELECT F_AUTORIZACION FROM CR_BLQ_RECEP'
    #9#9'         WHERE ID_TRN_BLOQUEO = CB.ID_TRN_DESLBLQ'
    #9#9'       )AS F_AUTORIZA,'
    '             CB.ID_CREDITO, CB.NUM_PERIODO,'
    
      #9#9'       NVL(PKGCRSALDOS.ObtImporteVto(CB.ID_CREDITO,1),0) AS IM' +
      'P_VTO,'
    #9#9'       CB.CVE_USU_AUTORIZA, CTO.CVE_MONEDA, MON.DESC_MONEDA,'
    #9#9'       CB.CVE_TIP_OPERACION, CCH.ID_ACREDITADO, TIT.NOMBRE,'
    
      '             DECODE(CVE_TIP_OPERACION, '#39'BL'#39','#39'BLOQUEO'#39','#39'DB'#39','#39'DESB' +
      'LOQUEO'#39','#39#39')AS TIP_TRN,'
    '             RCCH.DIA_RECEP_APORT'
    #9#9'  FROM (SELECT * FROM CR_BLQ_RECEP'
    '                 WHERE SIT_BLQ_RECEP ='#39'AU'#39
    '             )CB, (SELECT * FROM CR_CREDITO CC'
    '                      WHERE CC.F_AUTORIZA <= {?pF_FINAL}'
    '                        AND (CC.F_LIQUIDACION >= {?pF_FINAL}'
    '                         OR CC.F_LIQUIDACION IS NULL)'
    '                   ) CC, CR_CONTRATO CCTO,'
    
      '             CONTRATO CTO, MONEDA MON , CR_CRED_CHEQ CCH, PERSON' +
      'A TIT,'
    '             CR_REL_CRED_CHEQ RCCH'
    #9#9' WHERE CB.F_OPERACION BETWEEN {?pF_INICIO} AND {?pF_FINAL}'
    '         AND CB.ID_CREDITO = CC.ID_CREDITO'
    #9#9'   AND CCTO.ID_CONTRATO = CC.ID_CONTRATO'
    #9#9'   AND CCTO.FOL_CONTRATO = CC.FOL_CONTRATO'
    #9#9'   AND CTO.ID_CONTRATO = CC.ID_CONTRATO'
    #9#9'   AND MON.CVE_MONEDA = CTO.CVE_MONEDA'
    #9#9'   AND CCH.ID_CREDITO = CB.ID_CREDITO'
    #9#9'   AND CCH.CUENTA_BANCO = CB.CUENTA_BANCO'
    #9#9'   AND TIT.ID_PERSONA = CCH.ID_ACREDITADO'
    '         AND RCCH.ID_CREDITO = CCH.ID_CREDITO'
    '         AND RCCH.ID_BANCO_CHQRA = CCH.ID_BANCO_CHQRA'
    '         AND RCCH.CUENTA_BANCO = CCH.CUENTA_BANCO'
    
      '         AND CTO.CVE_MONEDA = DECODE({?pCVE_MONEDA},0,CTO.CVE_MO' +
      'NEDA,{?pCVE_MONEDA})'
    
      '         AND CCH.ID_ACREDITADO = DECODE({?pID_ACREDITADO},0,CCH.' +
      'ID_ACREDITADO,{?pID_ACREDITADO})'
    
      '         AND CCH.CUENTA_BANCO = DECODE({?pCUENTA_BANCO}'#39','#39'0'#39',CCH' +
      '.CUENTA_BANCO,'#39'{?pCUENTA_BANCO}'#39')'
    
      '         AND CB.ID_CREDITO = DECODE({?pID_CREDITO},0,CB.ID_CREDI' +
      'TO,{?pID_CREDITO})'
    
      '         AND CCTO.CVE_PRODUCTO_CRE = DECODE('#39'{?pCVE_PRODUCTO_CRE' +
      '}'#39','#39'0'#39',CCTO.CVE_PRODUCTO_CRE,'#39'{?pCVE_PRODUCTO_CRE}'#39')'
    '         '
    
      '         AND CB.F_OPERACION = DECODE('#39'{?pF_OPERACION}'#39','#39#39',CB.F_O' +
      'PERACION,TO_DATE('#39'{?pF_OPERACION}'#39','#39'DD/MM/YYYY'#39'))'
    
      '         AND CTO.ID_EMPRESA = DECODE({?pID_EMPRESA},0,CTO.ID_EMP' +
      'RESA,{?pID_EMPRESA})'
    
      '         AND CB.CVE_TIP_OPERACION = DECODE('#39'{?pTIPO}'#39','#39'0'#39',CB.CVE' +
      '_TIP_OPERACION,'#39'{?pTIPO}'#39')'
    '       )DATOS'
    ' ORDER BY DESC_MONEDA, TIP_TRN, NOMBRE, F_MOV, CUENTA_BANCO'
    '')
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
  PrintIfEmpty = True
  SnapToGrid = True
  Units = Inches
  Zoom = 100
  object ColumnHeaderBand1: TQRBand
    Left = 48
    Top = 145
    Width = 960
    Height = 41
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
      108.479166666667
      2540)
    BandType = rbColumnHeader
    object QRSHPTCredito: TQRShape
      Left = 195
      Top = 1
      Width = 51
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        515.9375
        2.64583333333333
        134.9375)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel17: TQRLabel
      Left = 197
      Top = 16
      Width = 47
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        521.229166666667
        42.3333333333333
        124.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'No. Crédito'
      Color = clSilver
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
    object QRSHPTAutorizacion: TQRShape
      Left = 822
      Top = 1
      Width = 120
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        2174.875
        2.64583333333333
        317.5)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel33: TQRLabel
      Left = 857
      Top = 10
      Width = 51
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        2267.47916666667
        26.4583333333333
        134.9375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Mercado Objetivo'
      Color = clSilver
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
    object QRShape2: TQRShape
      Left = 759
      Top = 1
      Width = 64
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        2008.1875
        2.64583333333333
        169.333333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel44: TQRLabel
      Left = 763
      Top = 10
      Width = 56
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        2018.77083333333
        26.4583333333333
        148.166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Catálogo Mínimo'
      Color = clSilver
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
    object QRShape8: TQRShape
      Left = 476
      Top = 1
      Width = 146
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1259.41666666667
        2.64583333333333
        386.291666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Left = 487
      Top = 2
      Width = 119
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1288.52083333333
        5.29166666666667
        314.854166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Capital'
      Color = clSilver
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
    object QRShape11: TQRShape
      Left = 476
      Top = 13
      Width = 74
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        1259.41666666667
        34.3958333333333
        195.791666666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel12: TQRLabel
      Left = 488
      Top = 21
      Width = 51
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1291.16666666667
        55.5625
        134.9375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Exigible'
      Color = clSilver
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
    object QRShape15: TQRShape
      Left = 443
      Top = 1
      Width = 34
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1172.10416666667
        2.64583333333333
        89.9583333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel18: TQRLabel
      Left = 445
      Top = 9
      Width = 30
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        1177.39583333333
        23.8125
        79.375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Días Cartera'
      Color = clSilver
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
    object QRShape21: TQRShape
      Left = 549
      Top = 13
      Width = 73
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        1452.5625
        34.3958333333333
        193.145833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel23: TQRLabel
      Left = 566
      Top = 20
      Width = 45
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        1497.54166666667
        52.9166666666667
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'No Exigible'
      Color = clSilver
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
    object QRShape1: TQRShape
      Left = 395
      Top = 1
      Width = 49
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1045.10416666667
        2.64583333333333
        129.645833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 398
      Top = 4
      Width = 44
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.3125
        1053.04166666667
        10.5833333333333
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Traspaso Cartera Vencida'
      Color = clSilver
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
    object QRShape3: TQRShape
      Left = 621
      Top = 1
      Width = 63
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1643.0625
        2.64583333333333
        166.6875)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 634
      Top = 10
      Width = 44
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        1677.45833333333
        26.4583333333333
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Interés Exigible'
      Color = clSilver
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
    object QRShape4: TQRShape
      Left = 683
      Top = 1
      Width = 77
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1807.10416666667
        2.64583333333333
        203.729166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel4: TQRLabel
      Left = 702
      Top = 17
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1857.375
        44.9791666666667
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Total'
      Color = clSilver
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
    object QRShape12: TQRShape
      Left = 5
      Top = 1
      Width = 191
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        13.2291666666667
        2.64583333333333
        505.354166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRShape14: TQRShape
      Left = 245
      Top = 1
      Width = 55
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        648.229166666667
        2.64583333333333
        145.520833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Left = 84
      Top = 17
      Width = 41
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        222.25
        44.9791666666667
        108.479166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Acreditado'
      Color = clSilver
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
    object QRLabel5: TQRLabel
      Left = 249
      Top = 16
      Width = 47
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        658.8125
        42.3333333333333
        124.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Producto'
      Color = clSilver
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
    object QRShape5: TQRShape
      Left = 299
      Top = 1
      Width = 49
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        791.104166666667
        2.64583333333333
        129.645833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 302
      Top = 10
      Width = 44
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        799.041666666667
        26.4583333333333
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Inicio'
      Color = clSilver
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
    object QRShape7: TQRShape
      Left = 347
      Top = 1
      Width = 49
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        918.104166666667
        2.64583333333333
        129.645833333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel7: TQRLabel
      Left = 349
      Top = 16
      Width = 44
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        923.395833333333
        42.3333333333333
        116.416666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha Vto'
      Color = clSilver
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
  object QRBand2: TQRBand
    Left = 48
    Top = 48
    Width = 960
    Height = 97
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
      256.645833333333
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
        256.645833333333
        0
        0
        2540)
      Titulo2 = '(Cifras en moneda de origen)'
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
  object QRBand1: TQRBand
    Left = 48
    Top = 219
    Width = 960
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRBand1AfterPrint
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
      37.0416666666667
      2540)
    BandType = rbDetail
    object QRDBText22: TQRDBText
      Left = 686
      Top = 1
      Width = 70
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1815.04166666667
        2.64583333333333
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCartVdaRan
      DataField = 'TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText32: TQRDBText
      Left = 399
      Top = 1
      Width = 45
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1055.6875
        2.64583333333333
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCartVdaRan
      DataField = 'F_TRASPASO_VEN'
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
    object QRDBText33: TQRDBText
      Left = 479
      Top = 1
      Width = 70
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1267.35416666667
        2.64583333333333
        185.208333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCartVdaRan
      DataField = 'IMP_CAP_EXIG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText39: TQRDBText
      Left = 551
      Top = 1
      Width = 68
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1457.85416666667
        2.64583333333333
        179.916666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCartVdaRan
      DataField = 'IMP_CAP_NO_EXIG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText47: TQRDBText
      Left = 623
      Top = 1
      Width = 62
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1648.35416666667
        2.64583333333333
        164.041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCartVdaRan
      DataField = 'IMP_INT_EXIG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRDBText18: TQRDBText
      Left = 450
      Top = 1
      Width = 22
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1190.625
        2.64583333333333
        58.2083333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCartVdaRan
      DataField = 'NUM_DIAS_VDO'
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
    object QRDBText19: TQRDBText
      Left = 349
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
        923.395833333333
        2.64583333333333
        127)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCartVdaRan
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
      Left = 196
      Top = 1
      Width = 45
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        518.583333333333
        2.64583333333333
        119.0625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCartVdaRan
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
    object QRDBText4: TQRDBText
      Left = 7
      Top = 1
      Width = 187
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        18.5208333333333
        2.64583333333333
        494.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCartVdaRan
      DataField = 'NOMBRE'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText5: TQRDBText
      Left = 248
      Top = 1
      Width = 50
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        656.166666666667
        2.64583333333333
        132.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCartVdaRan
      DataField = 'CVE_PRODUCTO'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText6: TQRDBText
      Left = 301
      Top = 1
      Width = 42
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        796.395833333333
        2.64583333333333
        111.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCartVdaRan
      DataField = 'F_INICIO'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText7: TQRDBText
      Left = 760
      Top = 1
      Width = 64
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2010.83333333333
        2.64583333333333
        169.333333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCartVdaRan
      DataField = 'CVE_CAT_MINIMO'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText3: TQRDBText
      Left = 829
      Top = 0
      Width = 113
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        2193.39583333333
        0
        298.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyCartVdaRan
      DataField = 'DESC_PRESUPUESTO'
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object QRGrpFooterMoneda: TQRBand
    Left = 48
    Top = 256
    Width = 960
    Height = 18
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRGrpFooterMonedaAfterPrint
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
      47.625
      2540)
    BandType = rbGroupFooter
    object QRLabel28: TQRLabel
      Left = 8
      Top = 2
      Width = 54
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        21.1666666666667
        5.29166666666667
        142.875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total  Moneda'
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
    object QRExpr16: TQRExpr
      Left = 685
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1812.39583333333
        5.29166666666667
        185.208333333333)
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
      Expression = 'SUM(qyCartVdaRan.TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr17: TQRExpr
      Left = 622
      Top = 2
      Width = 62
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1645.70833333333
        5.29166666666667
        164.041666666667)
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
      Expression = 'SUM(qyCartVdaRan.IMP_INT_EXIG)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr18: TQRExpr
      Left = 550
      Top = 2
      Width = 68
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1455.20833333333
        5.29166666666667
        179.916666666667)
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
      Expression = 'SUM(qyCartVdaRan.IMP_CAP_NO_EXIG)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr19: TQRExpr
      Left = 478
      Top = 2
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1264.70833333333
        5.29166666666667
        185.208333333333)
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
      Expression = 'SUM(qyCartVdaRan.IMP_CAP_EXIG)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
  end
  object QRGrupoMoneda: TQRGroup
    Left = 48
    Top = 186
    Width = 960
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRGrupoMonedaAfterPrint
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
      39.6875
      2540)
    Expression = 'qyCartVdaRan.DESC_MONEDA'
    FooterBand = QRGrpFooterMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText2: TQRDBText
      Left = 119
      Top = 2
      Width = 62
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        314.854166666667
        5.29166666666667
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyCartVdaRan
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
    object QRDBText1: TQRDBText
      Left = 60
      Top = 2
      Width = 56
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        158.75
        5.29166666666667
        148.166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyCartVdaRan
      DataField = 'CVE_MONEDA'
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
    object qlMoneda: TQRLabel
      Left = 16
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
        42.3333333333333
        5.29166666666667
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
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
  end
  object QRGroup1: TQRGroup
    Left = 48
    Top = 201
    Width = 960
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
      2540)
    Expression = 'qyDiasCartVda.ID_CREDITO'
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGrupoRango: TQRGroup
    Left = 48
    Top = 201
    Width = 960
    Height = 18
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRGrupoRangoAfterPrint
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
      47.625
      2540)
    Expression = 'qyCartVdaRan.GRUPO'
    FooterBand = QRGrpFooterRango
    Master = Owner
    ReprintOnNewPage = False
    object QRLabelRangoDias: TQRLabel
      Left = 40
      Top = 2
      Width = 318
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        105.833333333333
        5.29166666666667
        841.375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Plazo 1 - 180 Días en Cartera Vencida'
      Color = clWhite
      OnPrint = QRLabelRangoDiasPrint
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object QRGrpFooterRango: TQRBand
    Left = 48
    Top = 233
    Width = 960
    Height = 23
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRGrpFooterRangoAfterPrint
    AlignToBottom = False
    BeforePrint = QRGrpFooterRangoBeforePrint
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
      60.8541666666667
      2540)
    BandType = rbGroupFooter
    object QRExpr1: TQRExpr
      Left = 479
      Top = 6
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1267.35416666667
        15.875
        185.208333333333)
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
      Expression = 'SUM(qyCartVdaRan.IMP_CAP_EXIG)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr2: TQRExpr
      Left = 551
      Top = 6
      Width = 68
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1457.85416666667
        15.875
        179.916666666667)
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
      Expression = 'SUM(qyCartVdaRan.IMP_CAP_NO_EXIG)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr3: TQRExpr
      Left = 623
      Top = 6
      Width = 62
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1648.35416666667
        15.875
        164.041666666667)
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
      Expression = 'SUM(qyCartVdaRan.IMP_INT_EXIG)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object QRExpr4: TQRExpr
      Left = 686
      Top = 6
      Width = 70
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        1815.04166666667
        15.875
        185.208333333333)
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
      Expression = 'SUM(qyCartVdaRan.TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 6
    end
    object qlSubRango: TQRLabel
      Left = 250
      Top = 6
      Width = 201
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        661.458333333333
        15.875
        531.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Subtotal :  Plazo 1 - 180 Días en Cartera Vencida '
      Color = clWhite
      OnPrint = qlSubRangoPrint
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object qyCartVdaRan: TQuery
    SQL.Strings = (
      
        '     SELECT CONT.CVE_MONEDA, MON.DESC_MONEDA, CONT.ID_TITULAR, A' +
        'CRED.NOMBRE,'
      '            CRE.ID_CREDITO, CRE.F_INICIO,'
      '            CRE.F_VENCIMIENTO, CRE.F_TRASPASO_VEN,'
      '            CRE.ID_CONTRATO, CRE.CVE_PRODUCTO, '
      '            CRE.DESC_PRODUCTO, CRE.CVE_CAT_MINIMO,'
      '            CRE.DESC_CAT_MINIMO, CRE.NUM_DIAS_VDO,'
      '            CRE.GRUPO,'
      #9'    CRE.IMP_CAP_EXIG - CRE.GARANTIA_CP AS IMP_CAP_EXIG,'
      '            CRE.IMP_CAP_NO_EXIG,'
      #9'    CRE.IMP_INT_EXIG - CRE.GARANTIA_IN AS IMP_INT_EXIG,'
      
        #9'    (CRE.IMP_CAP_EXIG - CRE.GARANTIA_CP) + CRE.IMP_CAP_NO_EXIG ' +
        '+ (CRE.IMP_INT_EXIG - CRE.GARANTIA_IN) AS TOTAL,'
      
        '            CRE.GARANTIA_CP, CRE.GARANTIA_IN, CRE.CVE_PRESUPUEST' +
        'O,'
      '            PRES.DESC_PRESUPUESTO'
      '       FROM ('
      '             -- INTERCREDITOS SIN HIPOTECARIOS'
      
        '             SELECT CPD.ID_CREDITO, CC.F_VALOR_CRED AS F_INICIO,' +
        ' CC.F_ULT_CAPITAL AS F_VENCIMIENTO,'
      '                    CPD.F_TRASPASO_VEN, '
      '                    CC.ID_CONTRATO, '
      
        '                    TO_CHAR(CTO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO' +
        ','
      '                    CSTB.DESC_SUB_TIPO AS DESC_PRODUCTO, '
      '                    CTO.CVE_CAT_MIN AS CVE_CAT_MINIMO, '
      '                    CCM.DESC_CAT_MIN AS DESC_CAT_MINIMO,'
      
        '                    TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39') - CPD.F_T' +
        'RASPASO_VEN NUM_DIAS_VDO,'
      
        '                    (CASE WHEN (TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY' +
        #39') - CPD.F_TRASPASO_VEN) BETWEEN 1 AND 180 THEN 1'
      
        '                          WHEN (TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY' +
        #39') - CPD.F_TRASPASO_VEN) BETWEEN 181 AND 365 THEN 2'
      
        '                          WHEN (TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY' +
        #39') - CPD.F_TRASPASO_VEN) BETWEEN 366 AND 730 THEN 3'
      
        '                          WHEN (TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY' +
        #39') - CPD.F_TRASPASO_VEN) > 730 THEN 4'
      #9#9#9#9#9'  END) GRUPO,'
      '                    --CAPITAL'
      
        '                    SUM(CASE WHEN ( PER.F_VTO_CP  ) <  TO_DATE('#39 +
        '29/02/2012'#39','#39'DD/MM/YYYY'#39') THEN PER.IMP_CAPITAL ELSE 0 END) AS IM' +
        'P_CAP_EXIG, '
      
        '                    SUM(CASE WHEN ( PER.F_VTO_CP  ) >= TO_DATE('#39 +
        '29/02/2012'#39','#39'DD/MM/YYYY'#39') THEN PER.IMP_CAPITAL ELSE 0 END) AS IM' +
        'P_CAP_NO_EXIG, '
      '                    --INERES '
      
        '                    SUM(CASE WHEN ( PER.F_VTO_CI  - 5 ) <= CPD.F' +
        '_TRASPASO_VEN THEN PER.IMP_INTERES ELSE 0 END) AS IMP_INT_EXIG,'
      '                    0 GARANTIA_CP,'
      '                    0 GARANTIA_IN,'
      '                    CC.CVE_PRESUPUESTO'
      '             FROM (SELECT DISTINCT ID_CREDITO, F_TRASPASO_VEN '
      '                     FROM ( SELECT ID_CREDITO, F_TRASPASO_VEN '
      '                              FROM CRE_PROV_DIARIA CHC'
      
        '                             WHERE CHC.F_PROVISION = TO_DATE('#39'29' +
        '/02/2012'#39','#39'DD/MM/YYYY'#39')'
      
        '                               AND    CHC.F_TRASPASO_VEN IS NOT ' +
        'NULL '
      '                            UNION '
      
        '                            SELECT ID_CREDITO, F_TRASPASO_VENC A' +
        'S F_TRASPASO_VEN '
      '                              FROM CRE_CREDITO  '
      '                             WHERE F_TRASPASO_VENC IS NOT NULL'
      '                           )'
      '                  ) CPD, '
      '                  CRE_CREDITO CC,'
      '                  CRE_CONTRATO CTO, '
      '                  CRE_SUB_TIP_BCO CSTB, '
      '                  CRE_CAT_MINIMO CCM,'
      '                  (SELECT *'
      '                     FROM ( SELECT CI.ID_CREDITO,'
      
        '                                   CP_IMP.NUM_PERIODO AS NUM_PER' +
        '_CP, '
      
        '                                   CP_IMP.F_VENCIMIENTO AS F_VTO' +
        '_CP, '
      '                                   CP_IMP.IMP_CAPITAL, '
      
        '                                   CI_IMP.NUM_PERIODO AS NUM_PER' +
        '_CI, '
      
        '                                   CI_IMP.F_VENCIMIENTO AS F_VTO' +
        '_CI, '
      
        '                                   CI_IMP.IMP_INTERES_PER AS IMP' +
        '_INTERES'
      '                            FROM CRE_INTERES CI,'
      
        '                                 (SELECT cre_capital.ID_CREDITO,' +
        ' '
      '                                         NUM_PERIODO,  '
      
        '                                         (CASE WHEN cre_credito.' +
        'tipo_disposicion = '#39'DI'#39' THEN cre_capital.F_VENCIMIENTO'
      
        '                                               WHEN (cre_credito' +
        '.TIPO_DISPOSICION<>'#39'DI'#39') AND (cre_credito.F_VALOR_CRED = cre_cre' +
        'dito.F_TRASPASO_VENC) THEN cre_credito.F_VALOR_CRED '
      
        '                                               WHEN (cre_credito' +
        '.TIPO_DISPOSICION<>'#39'DI'#39') AND (cre_credito.F_VALOR_CRED < cre_cre' +
        'dito.F_TRASPASO_VENC) THEN (CASE WHEN cre_capital.F_VENCIMIENTO ' +
        '> TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39') THEN cre_credito.F_TRASPASO' +
        '_VENC '
      
        '                                                                ' +
        '                                                                ' +
        '                                 ELSE cre_capital.F_VENCIMIENTO '
      
        '                                                                ' +
        '                                                                ' +
        '                                 END)'
      
        '                                          END) AS F_VENCIMIENTO,' +
        ' '
      
        '                                         IMP_CAPITAL - IMP_PAGAD' +
        'O AS IMP_CAPITAL'
      
        '                                  FROM cre_capital, cre_credito,' +
        ' '
      
        '                                       (SELECT DISTINCT ID_CREDI' +
        'TO, F_TRASPASO_VEN '
      
        '                                          FROM ( SELECT ID_CREDI' +
        'TO, F_TRASPASO_VEN '
      
        '                                                   FROM CRE_PROV' +
        '_DIARIA CHC'
      
        '                                                  WHERE CHC.F_PR' +
        'OVISION = TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39')'
      
        '                                                    AND    CHC.F' +
        '_TRASPASO_VEN IS NOT NULL '
      '                                                  UNION '
      
        '                                                 SELECT ID_CREDI' +
        'TO, F_TRASPASO_VENC AS F_TRASPASO_VEN '
      
        '                                                   FROM CRE_CRED' +
        'ITO  '
      
        '                                                  WHERE F_TRASPA' +
        'SO_VENC IS NOT NULL)'
      '                                        ) CHC'
      '                                  WHERE  1 = 1'
      
        '                                  AND    SIT_CAPITAL NOT IN ('#39'CA' +
        #39','#39'LQ'#39','#39'TL'#39','#39'TI'#39','#39'TP'#39','#39'TA'#39') '
      
        '                                  AND    CRE_CREDITO.SIT_CREDITO' +
        ' IN ('#39'AC'#39') '
      
        '                                  AND    cre_credito.id_credito ' +
        '= cre_capital.id_credito'
      
        '                                  AND    (f_pago is null or     ' +
        '  imp_capital > imp_pagado)'
      
        '                                  AND    CHC.ID_CREDITO = crE_ca' +
        'pital.ID_CREDITO'
      '                                  ) CP_IMP,'
      '                                 (SELECT CI.ID_CREDITO, '
      #9#9#9#9#9#9#9#9'         NUM_PERIODO, '
      #9#9#9#9#9#9#9#9#9#9' IMP_INTERES_PER - IMP_PAGADO AS IMP_INTERES_PER,'
      
        '                                         (CASE WHEN cc.tipo_disp' +
        'osicion = '#39'DI'#39' THEN ci.F_VENCIMIENTO'
      
        '                                               WHEN (cc.TIPO_DIS' +
        'POSICION <>'#39'DI'#39') AND (cc.F_VALOR_CRED = cc.F_TRASPASO_VENC) THEN' +
        ' cc.F_VALOR_CRED '
      
        '                                               WHEN (cc.TIPO_DIS' +
        'POSICION <>'#39'DI'#39') AND (cc.F_VALOR_CRED < cc.F_TRASPASO_VENC) THEN' +
        ' (CASE WHEN ci.F_VENCIMIENTO > TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39 +
        ') THEN cc.F_TRASPASO_VENC '
      
        '                                                                ' +
        '                                                                ' +
        '       ELSE ci.F_VENCIMIENTO '
      
        '                                                                ' +
        '                                                                ' +
        '  END)'
      '                                          END) AS F_VENCIMIENTO '
      
        '                                  FROM CRE_INTERES CI, cre_credi' +
        'to cc, '
      
        '                                       (SELECT DISTINCT ID_CREDI' +
        'TO, F_TRASPASO_VEN '
      #9#9#9#9#9#9#9#9#9'      FROM ( SELECT ID_CREDITO, F_TRASPASO_VEN '
      #9#9#9#9#9#9#9#9#9#9'           FROM CRE_PROV_DIARIA CHC'
      
        '                                                  WHERE CHC.F_PR' +
        'OVISION = TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39')'
      
        '                                                    AND CHC.F_TR' +
        'ASPASO_VEN IS NOT NULL '
      '                                                 UNION'
      
        #9#9#9#9#9#9#9#9#9#9'         SELECT ID_CREDITO, F_TRASPASO_VENC AS F_TRASP' +
        'ASO_VEN '
      #9#9#9#9#9#9#9#9#9#9#9#9'   FROM CRE_CREDITO  '
      
        '                                                  WHERE F_TRASPA' +
        'SO_VENC IS NOT NULL)) CHC'
      '                                  WHERE  1 = 1'
      '                                    AND   SIT_INTERES = '#39'IM'#39' '
      
        '                                    AND   CC.SIT_CREDITO IN ('#39'AC' +
        #39') '
      
        '                                    AND   cc.id_credito = ci.id_' +
        'credito'
      
        '                                    AND   CHC.ID_CREDITO = CI.ID' +
        '_CREDITO'
      '                                  ) CI_IMP'
      
        #9'                        WHERE CP_IMP.ID_CREDITO(+) = CI.ID_CRED' +
        'ITO'
      
        '                              AND CP_IMP.F_VENCIMIENTO(+) = CI.F' +
        '_VENCIMIENTO'
      
        #9'                          AND CI_IMP.ID_CREDITO(+) = CI.ID_CRED' +
        'ITO'
      
        '                              AND CI_IMP.NUM_PERIODO(+) = CI.NUM' +
        '_PERIODO'
      '                          )'
      '                   ) PER'
      '             WHERE CPD.ID_CREDITO      = CC.ID_CREDITO '
      '               AND CTO.ID_CONTRATO     = CC.ID_CONTRATO '
      
        '               AND CTO.CVE_SUB_TIP_BCO NOT IN(50,59,60,118,119,1' +
        '20,121,51)'
      '               AND CTO.CVE_SUB_TIP_BCO = CSTB.CVE_SUB_TIP_BCO '
      '               AND CTO.CVE_SUB_TIP_BCO <> '#39'57'#39
      '               AND CTO.CVE_CAT_MIN     = CCM.CVE_CAT_MIN'
      '               AND CC.ID_CREDITO       = PER.ID_CREDITO'
      
        #9#9#9' HAVING (SUM(CASE WHEN ( PER.F_VTO_CP  ) <  TO_DATE('#39'29/02/20' +
        '12'#39','#39'DD/MM/YYYY'#39') THEN PER.IMP_CAPITAL ELSE 0 END) <> 0 OR '
      
        '                    SUM(CASE WHEN ( PER.F_VTO_CP  ) >= TO_DATE('#39 +
        '29/02/2012'#39','#39'DD/MM/YYYY'#39') THEN PER.IMP_CAPITAL ELSE 0 END) <> 0 ' +
        ' OR'
      '                    --INERES '
      
        '                    SUM(CASE WHEN ( PER.F_VTO_CI  - 5 ) <= CPD.F' +
        '_TRASPASO_VEN THEN PER.IMP_INTERES ELSE 0 END) <> 0)  '
      
        #9#9#9' GROUP BY CPD.ID_CREDITO, CC.F_VALOR_CRED, CC.F_ULT_CAPITAL,'#9 +
        #9#9#9#9'  '
      #9#9#9'          CPD.F_TRASPASO_VEN, CC.ID_CONTRATO, '
      
        #9#9#9#9#9'  TO_CHAR(CTO.CVE_SUB_TIP_BCO), CSTB.DESC_SUB_TIPO, CTO.CVE' +
        '_CAT_MIN, CCM.DESC_CAT_MIN, CC.CVE_PRESUPUESTO'
      #9#9#9' --'
      #9#9#9' UNION'
      #9#9#9' --'
      '             -- INTERCREDITOS HIPOTECARIOS'#9#9#9' '
      
        #9#9#9' SELECT CPD.ID_CREDITO, CC.F_VALOR_CRED AS F_INICIO, CC.F_ULT' +
        '_CAPITAL AS F_VENCIMIENTO, '
      #9#9#9'        CPD.F_TRASPASO_VEN, '
      '                    CC.ID_CONTRATO, '
      #9#9#9#9#9'TO_CHAR(CTO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO, '
      #9#9#9#9#9'CSTB.DESC_SUB_TIPO AS DESC_PRODUCTO, '
      '                    CTO.CVE_CAT_MIN AS CVE_CAT_MINIMO, '
      #9#9#9#9#9'CCM.DESC_CAT_MIN AS DESC_CAT_MINIMO,  '
      
        #9#9#9#9#9'(TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39') - CPD.F_TRASPASO_VEN) A' +
        'S NUM_DIAS_VDO,'
      
        '                    (CASE WHEN (TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY' +
        #39') - CPD.F_TRASPASO_VEN) BETWEEN 1 AND 180 THEN 1'
      
        #9#9#9#9#9'      WHEN (TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39') - CPD.F_TRAS' +
        'PASO_VEN) BETWEEN 181 AND 365 THEN 2'
      
        #9#9#9#9#9#9'  WHEN (TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39') - CPD.F_TRASPAS' +
        'O_VEN) BETWEEN 366 AND 730 THEN 3'
      
        #9#9#9#9#9#9'  WHEN (TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39') - CPD.F_TRASPAS' +
        'O_VEN) > 730 THEN 4'
      #9#9#9#9#9'  END) GRUPO,'#9#9#9#9#9
      #9#9#9#9#9'CCAS.ICVE AS CP_EX,'
      #9#9#9#9#9'CCAS.ICVNE AS CP_NE,'
      #9#9#9#9#9'CCAS.IIVE AS IN_EX,'
      #9#9#9#9#9'0 GARANTIA_CP,'
      #9#9#9#9#9'0 GARANTIA_IN,'
      #9#9#9#9#9'CC.CVE_PRESUPUESTO'#9#9#9#9#9' '#9#9#9#9#9
      '             FROM (SELECT DISTINCT ID_CREDITO, F_TRASPASO_VEN '
      #9#9#9'       FROM ( SELECT ID_CREDITO, F_TRASPASO_VEN '
      #9#9#9#9'          FROM CRE_PROV_DIARIA CHC'
      
        '                          WHERE CHC.F_PROVISION = TO_DATE('#39'29/02' +
        '/2012'#39','#39'DD/MM/YYYY'#39')'
      
        '                            AND    CHC.F_TRASPASO_VEN IS NOT NUL' +
        'L '
      '                          UNION '
      
        '                          SELECT ID_CREDITO, F_TRASPASO_VENC AS ' +
        'F_TRASPASO_VEN '
      '                          FROM CRE_CREDITO  '
      '                          WHERE F_TRASPASO_VENC IS NOT NULL'
      '                         )'
      '                   ) CPD, '
      '                  CRE_CREDITO CC,'
      '                  CRE_CONTRATO CTO, '
      '                  CRE_SUB_TIP_BCO CSTB, '
      '                  CRE_CAT_MINIMO CCM, '
      '                  (SELECT CCAS.ID_CREDITO, '
      #9#9#9#9'          CCAS.F_CIERRE, '
      #9#9#9#9#9#9'  CCAS.IMP_CAP_VDO_EX AS ICVE, '
      #9#9#9#9#9#9'  CCAS.IMP_CAP_VDO_NE AS ICVNE,  '
      #9#9#9#9#9#9'  CCAS.IMP_INT_VDO_EX  AS IIVE '
      '                     FROM CR_CON_ADEUDO_SDO CCAS '
      
        #9#9#9#9#9'WHERE  CCAS.F_CIERRE = TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39')) ' +
        'CCAS'
      '             WHERE CPD.ID_CREDITO      = CC.ID_CREDITO '
      '               AND CTO.ID_CONTRATO     = CC.ID_CONTRATO '
      
        '               AND CTO.CVE_SUB_TIP_BCO NOT IN(50,59,60,118,119,1' +
        '20,121,51)'
      '               AND CTO.CVE_SUB_TIP_BCO = CSTB.CVE_SUB_TIP_BCO '
      '               AND CTO.CVE_SUB_TIP_BCO = '#39'57'#39
      '               AND CTO.CVE_CAT_MIN     = CCM.CVE_CAT_MIN'
      #9#9#9'   AND CCAS.ID_CREDITO     = CC.ID_CREDITO'
      #9#9#9' --'
      #9#9#9' UNION'
      #9#9#9' --'
      '             -- ICRE'#9#9#9' '
      #9#9#9' SELECT CHC.ID_CREDITO, CC.F_INICIO, CC.F_VENCIMIENTO,'
      #9#9#9'        CHC.F_TRASPASO_VENC AS F_TRASPASO_VEN,'
      '                    CC.ID_CONTRATO, '
      #9#9#9#9#9'CTO.CVE_PRODUCTO_CRE AS CVE_PRODUCTO, '
      #9#9#9#9#9'CP.DESC_C_PRODUCTO AS DESC_PRODUCTO,'
      '                    CP.CVE_CLAS_CONTAB AS CVE_CAT_MINIMO, '
      #9#9#9#9#9'CCM.DESC_CAT_MINIMO,'
      
        #9#9#9#9#9'TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39') - CHC.F_TRASPASO_VENC AS' +
        ' NUM_DIAS_VDO,'
      
        '                    (CASE WHEN (TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY' +
        #39') - CHC.F_TRASPASO_VENC) BETWEEN 1 AND 180 THEN 1'
      
        #9#9#9#9#9'      WHEN (TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39') - CHC.F_TRAS' +
        'PASO_VENC) BETWEEN 181 AND 365 THEN 2'
      
        #9#9#9#9#9#9'  WHEN (TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39') - CHC.F_TRASPAS' +
        'O_VENC) BETWEEN 366 AND 730 THEN 3'
      
        #9#9#9#9#9#9'  WHEN (TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39') - CHC.F_TRASPAS' +
        'O_VENC) > 730 THEN 4'
      #9#9#9#9#9'  END) GRUPO,'#9#9#9#9#9
      
        '                    Fn_Imp_EX_NE (CC.ID_CREDITO, '#39'CP'#39', '#39'EX'#39', TO_' +
        'DATE('#39'29/02/2012'#39' ,'#39'DD/MM/YYYY'#39'), CHC.F_TRASPASO_VENC) CP_EX,'
      
        '                    Fn_Imp_EX_NE (CC.ID_CREDITO, '#39'CP'#39', '#39'NE'#39', TO_' +
        'DATE('#39'29/02/2012'#39' ,'#39'DD/MM/YYYY'#39'), CHC.F_TRASPASO_VENC) CP_NE,'
      
        '                    Fn_Imp_EX_NE (CC.ID_CREDITO, '#39'IN'#39', '#39'EX'#39', TO_' +
        'DATE('#39'29/02/2012'#39' ,'#39'DD/MM/YYYY'#39'), CHC.F_TRASPASO_VENC) IN_EX,'
      
        '                    Fn_Importe_Garantias (CC.ID_CREDITO, '#39'TODO'#39',' +
        ' '#39'CP'#39', '#39'IMPBRU'#39', TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39'),'
      
        '                                          '#39'FV'#39', '#39#39', TO_DATE('#39'29/' +
        '02/2012'#39','#39'DD/MM/YYYY'#39'), '#39#39') +'
      
        '                    Fn_Importe_Garantias (CC.ID_CREDITO, '#39'TODO'#39',' +
        ' '#39'FN'#39', '#39'IMPBRU'#39', TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39'),'
      
        '                                          '#39'FV'#39', '#39#39', TO_DATE('#39'29/' +
        '02/2012'#39','#39'DD/MM/YYYY'#39'), '#39#39') AS GARANTIA_CP,'
      
        '                    Fn_Importe_Garantias (CC.ID_CREDITO, '#39'TODO'#39',' +
        ' '#39'IN'#39', '#39'IMPBRU'#39', TO_DATE('#39'29/02/2012'#39','#39'DD/MM/YYYY'#39'),'
      
        '                                          '#39'FV'#39', '#39#39', TO_DATE('#39'29/' +
        '02/2012'#39','#39'DD/MM/YYYY'#39'), '#39#39') AS GARANTIA_IN,'
      #9#9#9#9#9'CP.CVE_PRESUPUESTO '#9#9#9#9#9#9#9#9#9#9'  '
      '             FROM CR_HISTO_CRED CHC,'
      '                  CR_CREDITO CC,'
      '                  CR_CONTRATO CTO,'
      '                  CR_PRODUCTO CP,'
      '                  CR_CAT_MINIMO CCM'
      
        '             WHERE CHC.F_CIERRE          = TO_DATE('#39'29/02/2012'#39',' +
        #39'DD/MM/YYYY'#39')'
      '               AND CHC.F_TRASPASO_VENC IS NOT NULL'
      '               AND CHC.ID_CREDITO        = CC.ID_CREDITO'
      '               AND CTO.ID_CONTRATO       = CC.ID_CONTRATO'
      '               AND CP.CVE_PRODUCTO_CRE   = CTO.CVE_PRODUCTO_CRE'
      '               AND CP.CVE_TIPO_CARTERA   = '#39'BANCAR'#39
      '               AND CP.CVE_CLAS_CONTAB    = CCM.CVE_CAT_MINIMO'
      #9#9#9'   and cc.id_credito in (240176, 170950)'
      #9#9#9') CRE,'
      '            CONTRATO CONT,'
      #9#9#9'CRE_PRESUPUESTO PRES,'
      
        '            ( SELECT ID_PERSONA, APELLIDO_PATERNO||'#39' '#39'||APELLIDO' +
        '_MATERNO||'#39' '#39'||NOMBRE_PERSONA AS NOMBRE '
      '              FROM PERSONA_FISICA '
      '              UNION '
      '              SELECT ID_PERSONA, NOM_RAZON_SOCIAL AS NOMBRE '
      '              FROM PERSONA_MORAL ) ACRED, '
      '            MONEDA MON '#9#9#9
      '      WHERE CRE.ID_CONTRATO = CONT.ID_CONTRATO'
      #9'    AND CONT.ID_TITULAR = ACRED.ID_PERSONA'
      #9'    AND CONT.CVE_MONEDA = MON.CVE_MONEDA'
      #9#9'AND CRE.CVE_PRESUPUESTO = PRES.CVE_PRESUPUESTO (+)'
      
        #9'  ORDER BY MON.DESC_MONEDA, CRE.GRUPO, ACRED.NOMBRE, CRE.ID_CRE' +
        'DITO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 368
    Top = 10
    object qyCartVdaRanCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyCartVdaRanDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyCartVdaRanID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object qyCartVdaRanNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qyCartVdaRanID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyCartVdaRanF_INICIO: TDateTimeField
      FieldName = 'F_INICIO'
    end
    object qyCartVdaRanF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qyCartVdaRanF_TRASPASO_VEN: TDateTimeField
      FieldName = 'F_TRASPASO_VEN'
    end
    object qyCartVdaRanID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object qyCartVdaRanCVE_PRODUCTO: TStringField
      FieldName = 'CVE_PRODUCTO'
      Size = 40
    end
    object qyCartVdaRanDESC_PRODUCTO: TStringField
      FieldName = 'DESC_PRODUCTO'
      Size = 250
    end
    object qyCartVdaRanCVE_CAT_MINIMO: TStringField
      FieldName = 'CVE_CAT_MINIMO'
      Size = 10
    end
    object qyCartVdaRanDESC_CAT_MINIMO: TStringField
      FieldName = 'DESC_CAT_MINIMO'
      Size = 60
    end
    object qyCartVdaRanNUM_DIAS_VDO: TFloatField
      FieldName = 'NUM_DIAS_VDO'
    end
    object qyCartVdaRanGRUPO: TFloatField
      FieldName = 'GRUPO'
    end
    object qyCartVdaRanIMP_CAP_EXIG: TFloatField
      FieldName = 'IMP_CAP_EXIG'
    end
    object qyCartVdaRanIMP_CAP_NO_EXIG: TFloatField
      FieldName = 'IMP_CAP_NO_EXIG'
    end
    object qyCartVdaRanIMP_INT_EXIG: TFloatField
      FieldName = 'IMP_INT_EXIG'
    end
    object qyCartVdaRanTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object qyCartVdaRanGARANTIA_CP: TFloatField
      FieldName = 'GARANTIA_CP'
    end
    object qyCartVdaRanGARANTIA_IN: TFloatField
      FieldName = 'GARANTIA_IN'
    end
    object qyCartVdaRanCVE_PRESUPUESTO: TStringField
      FieldName = 'CVE_PRESUPUESTO'
      Size = 6
    end
    object qyCartVdaRanDESC_PRESUPUESTO: TStringField
      FieldName = 'DESC_PRESUPUESTO'
      Size = 40
    end
  end
end
