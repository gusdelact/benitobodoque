object QrMovEntFe: TQrMovEntFe
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
  DataSet = qyMovEntFe
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
    Top = 132
    Width = 960
    Height = 17
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
      44.9791666666667
      2540)
    BandType = rbColumnHeader
    object QRShape1: TQRShape
      Left = 814
      Top = 0
      Width = 90
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2153.70833333333
        0
        238.125)
      Shape = qrsRectangle
    end
    object QRSHPTCredito: TQRShape
      Left = 376
      Top = 0
      Width = 60
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        994.833333333333
        0
        158.75)
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 392
      Top = 1
      Width = 29
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        1037.16666666667
        2.64583333333333
        76.7291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Disposición'
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
    object QRSHPTMonto: TQRShape
      Left = 547
      Top = 0
      Width = 90
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1447.27083333333
        0
        238.125)
      Shape = qrsRectangle
    end
    object QRLabel18: TQRLabel
      Left = 551
      Top = 1
      Width = 77
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        1457.85416666667
        2.64583333333333
        203.729166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Saldo Inicial'
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
    object QRSHPTSaldoIsoluto: TQRShape
      Left = 636
      Top = 0
      Width = 90
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1682.75
        0
        238.125)
      Shape = qrsRectangle
    end
    object QRLabel20: TQRLabel
      Left = 641
      Top = 1
      Width = 80
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        1695.97916666667
        2.64583333333333
        211.666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Disposiciones en el Mes'
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
    object QRSHPTF_Inicio: TQRShape
      Left = 903
      Top = 0
      Width = 57
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        2389.1875
        0
        150.8125)
      Shape = qrsRectangle
    end
    object QRSHPTProveedor: TQRShape
      Left = 0
      Top = 0
      Width = 377
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        0
        0
        997.479166666667)
      Shape = qrsRectangle
    end
    object QRLabel33: TQRLabel
      Left = 8
      Top = 1
      Width = 361
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        21.1666666666667
        2.64583333333333
        955.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Acreditado'
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
    object QRLabel39: TQRLabel
      Left = 909
      Top = 1
      Width = 47
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        2405.0625
        2.64583333333333
        124.354166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Es paramétrico?'
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
      Left = 725
      Top = 0
      Width = 90
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1918.22916666667
        0
        238.125)
      Shape = qrsRectangle
    end
    object QRLabel4: TQRLabel
      Left = 731
      Top = 1
      Width = 75
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        1934.10416666667
        2.64583333333333
        198.4375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Pagos en el mes'
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
      Left = 824
      Top = 1
      Width = 73
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        2180.16666666667
        2.64583333333333
        193.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Saldo Final'
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
      Left = 435
      Top = 0
      Width = 113
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1150.9375
        0
        298.979166666667)
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 439
      Top = 1
      Width = 98
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.0416666666667
        1161.52083333333
        2.64583333333333
        259.291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Cuenta Contable'
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
    Left = 48
    Top = 181
    Width = 960
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
      2540)
    BandType = rbDetail
    object QRDBText3: TQRDBText
      Left = 376
      Top = 1
      Width = 62
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        994.833333333333
        2.64583333333333
        164.041666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovEntFe
      DataField = 'ID_CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText4: TQRDBText
      Left = 4
      Top = 1
      Width = 45
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        10.5833333333333
        2.64583333333333
        119.0625)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovEntFe
      DataField = 'ID_TITULAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText18: TQRDBText
      Left = 912
      Top = 1
      Width = 49
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2413
        2.64583333333333
        129.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovEntFe
      DataField = 'B_PARAMETRICO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText10: TQRDBText
      Left = 817
      Top = 1
      Width = 85
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2161.64583333333
        2.64583333333333
        224.895833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovEntFe
      DataField = 'SDO_FINAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText24: TQRDBText
      Left = 56
      Top = 1
      Width = 313
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        148.166666666667
        2.64583333333333
        828.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovEntFe
      DataField = 'NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText5: TQRDBText
      Left = 729
      Top = 1
      Width = 85
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1928.8125
        2.64583333333333
        224.895833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovEntFe
      DataField = 'PAG_MES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText8: TQRDBText
      Left = 641
      Top = 1
      Width = 85
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1695.97916666667
        2.64583333333333
        224.895833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovEntFe
      DataField = 'IMP_DISP_MES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
    object QRDBText11: TQRDBText
      Left = 553
      Top = 1
      Width = 85
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1463.14583333333
        2.64583333333333
        224.895833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovEntFe
      DataField = 'SDO_INICIAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 5
    end
  end
  object QRBand2: TQRBand
    Left = 48
    Top = 48
    Width = 960
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
        222.25
        0
        0
        2540)
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
  object qrgrpFooterMoneda: TQRBand
    Left = 48
    Top = 219
    Width = 960
    Height = 12
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
      31.75
      2540)
    BandType = rbGroupFooter
    object QRLabel7: TQRLabel
      Left = 5
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        13.2291666666667
        5.29166666666667
        148.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total por Moneda'
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
    object QRExpr9: TQRExpr
      Left = 817
      Top = 0
      Width = 85
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2161.64583333333
        0
        224.895833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovEntFe.SDO_FINAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr10: TQRExpr
      Left = 729
      Top = 0
      Width = 85
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1928.8125
        0
        224.895833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovEntFe.PAG_MES)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr11: TQRExpr
      Left = 641
      Top = 0
      Width = 85
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1695.97916666667
        0
        224.895833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovEntFe.IMP_DISP_MES)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr12: TQRExpr
      Left = 553
      Top = 0
      Width = 85
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1463.14583333333
        0
        224.895833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovEntFe.SDO_INICIAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object QRGroupContador: TQRGroup
    Left = 48
    Top = 149
    Width = 960
    Height = 4
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
      10.5833333333333
      2540)
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGroupMoneda: TQRGroup
    Left = 48
    Top = 153
    Width = 960
    Height = 13
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
      34.3958333333333
      2540)
    Expression = 'qyRelBlqDs.CVE_MONEDA'
    FooterBand = qrgrpFooterMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRSHPMoneda: TQRShape
      Left = 7
      Top = 1
      Width = 609
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        18.5208333333333
        2.64583333333333
        1611.3125)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel46: TQRLabel
      Left = 13
      Top = 2
      Width = 26
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        34.3958333333333
        5.29166666666667
        68.7916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda'
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
    object QRDBText9: TQRDBText
      Left = 47
      Top = 2
      Width = 38
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        124.354166666667
        5.29166666666667
        100.541666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovEntFe
      DataField = 'CVE_MONEDA'
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
    object QRDBText7: TQRDBText
      Left = 89
      Top = 2
      Width = 55
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        235.479166666667
        5.29166666666667
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovEntFe
      DataField = 'DESC_MONEDA'
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
  object SummaryBand1: TQRBand
    Left = 48
    Top = 231
    Width = 960
    Height = 1
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
      2.64583333333333
      2540)
    BandType = rbSummary
  end
  object QRGroup1: TQRGroup
    Left = 48
    Top = 166
    Width = 960
    Height = 13
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
      34.3958333333333
      2540)
    Expression = 'qyRelBlqDs.CVE_MONEDA'
    FooterBand = qrgrpFooterProducto
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel2: TQRLabel
      Left = 29
      Top = 2
      Width = 31
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        76.7291666666667
        5.29166666666667
        82.0208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Producto'
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
    object QRDBText2: TQRDBText
      Left = 63
      Top = 2
      Width = 38
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        166.6875
        5.29166666666667
        100.541666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovEntFe
      DataField = 'CVE_PRODUCTO_CRE'
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
    object QRDBText6: TQRDBText
      Left = 105
      Top = 2
      Width = 71
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        277.8125
        5.29166666666667
        187.854166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyMovEntFe
      DataField = 'DESC_L_PRODUCTO'
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
  object qrgrpFooterProducto: TQRBand
    Left = 48
    Top = 205
    Width = 960
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
      2540)
    BandType = rbGroupFooter
    object QRLabel6: TQRLabel
      Left = 21
      Top = 2
      Width = 61
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        55.5625
        5.29166666666667
        161.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total por Producto'
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
    object QRExpr5: TQRExpr
      Left = 817
      Top = 1
      Width = 85
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2161.64583333333
        2.64583333333333
        224.895833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovEntFe.SDO_FINAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr6: TQRExpr
      Left = 729
      Top = 1
      Width = 85
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1928.8125
        2.64583333333333
        224.895833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovEntFe.PAG_MES)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr7: TQRExpr
      Left = 641
      Top = 1
      Width = 85
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1695.97916666667
        2.64583333333333
        224.895833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovEntFe.IMP_DISP_MES)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr8: TQRExpr
      Left = 553
      Top = 1
      Width = 85
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1463.14583333333
        2.64583333333333
        224.895833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovEntFe.SDO_INICIAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object QRGroup2: TQRGroup
    Left = 48
    Top = 179
    Width = 960
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
      2540)
    Expression = 'qyMovEntFe.ID_TITULAR'
    FooterBand = qrgrpFooterAcreditado
    Master = Owner
    ReprintOnNewPage = False
  end
  object qrgrpFooterAcreditado: TQRBand
    Left = 48
    Top = 193
    Width = 960
    Height = 12
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
      31.75
      2540)
    BandType = rbGroupFooter
    object QRLabel5: TQRLabel
      Left = 29
      Top = 2
      Width = 67
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        76.7291666666667
        5.29166666666667
        177.270833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total por Acreditado'
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
    object QRExpr2: TQRExpr
      Left = 553
      Top = 0
      Width = 85
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1463.14583333333
        0
        224.895833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovEntFe.SDO_INICIAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr1: TQRExpr
      Left = 641
      Top = 0
      Width = 85
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1695.97916666667
        0
        224.895833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovEntFe.IMP_DISP_MES)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr3: TQRExpr
      Left = 729
      Top = 0
      Width = 85
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        1928.8125
        0
        224.895833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovEntFe.PAG_MES)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
    object QRExpr4: TQRExpr
      Left = 817
      Top = 0
      Width = 85
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        2161.64583333333
        0
        224.895833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyMovEntFe.SDO_FINAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 5
    end
  end
  object qyMovEntFe: TQuery
    Left = 82
    Top = 12
    object qyMovEntFeDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyMovEntFeNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qyMovEntFeID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qyMovEntFeCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyMovEntFeID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object qyMovEntFeCVE_PRODUCTO_CRE: TStringField
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 8
    end
    object qyMovEntFeDESC_L_PRODUCTO: TStringField
      FieldName = 'DESC_L_PRODUCTO'
      Size = 80
    end
    object qyMovEntFeSDO_INICIAL: TFloatField
      FieldName = 'SDO_INICIAL'
    end
    object qyMovEntFeIMP_DISP_MES: TFloatField
      FieldName = 'IMP_DISP_MES'
    end
    object qyMovEntFePAG_MES: TFloatField
      FieldName = 'PAG_MES'
    end
    object qyMovEntFeSDO_FINAL: TFloatField
      FieldName = 'SDO_FINAL'
    end
    object qyMovEntFeB_PARAMETRICO: TStringField
      FieldName = 'B_PARAMETRICO'
      Size = 2
    end
  end
end
