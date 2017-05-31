object QrResumCR: TQrResumCR
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
  DataSet = qyResum
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
      2540)
    BandType = rbColumnHeader
    object QRSHPTCredito: TQRShape
      Left = 96
      Top = 0
      Width = 34
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        254
        0
        89.9583333333333)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 99
      Top = 16
      Width = 28
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        261.9375
        42.3333333333333
        74.0833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Credito'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRShape8: TQRShape
      Left = 129
      Top = 0
      Width = 37
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        341.3125
        0
        97.8958333333333)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Left = 131
      Top = 2
      Width = 34
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        346.604166666667
        5.29166666666667
        89.9583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Ciclos'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRShape3: TQRShape
      Left = 129
      Top = 16
      Width = 10
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        341.3125
        42.3333333333333
        26.4583333333333)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 131
      Top = 21
      Width = 6
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        346.604166666667
        55.5625
        15.875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'T'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRShape10: TQRShape
      Left = 138
      Top = 16
      Width = 10
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        365.125
        42.3333333333333
        26.4583333333333)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRLabel11: TQRLabel
      Left = 140
      Top = 21
      Width = 6
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        370.416666666667
        55.5625
        15.875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'P'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRShape20: TQRShape
      Left = 156
      Top = 16
      Width = 10
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        412.75
        42.3333333333333
        26.4583333333333)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRLabel25: TQRLabel
      Left = 158
      Top = 21
      Width = 6
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        418.041666666667
        55.5625
        15.875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'V'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRShape25: TQRShape
      Left = 147
      Top = 16
      Width = 10
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.2083333333333
        388.9375
        42.3333333333333
        26.4583333333333)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRLabel17: TQRLabel
      Left = 149
      Top = 21
      Width = 6
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        394.229166666667
        55.5625
        15.875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'R'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRShape1: TQRShape
      Left = 165
      Top = 0
      Width = 35
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        436.5625
        0
        92.6041666666667)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRLabel4: TQRLabel
      Left = 171
      Top = 12
      Width = 23
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        452.4375
        31.75
        60.8541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Pago Total'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRShape2: TQRShape
      Left = 199
      Top = 0
      Width = 32
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        526.520833333333
        0
        84.6666666666667)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRLabel5: TQRLabel
      Left = 201
      Top = 16
      Width = 27
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        531.8125
        42.3333333333333
        71.4375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Capital'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRShape5: TQRShape
      Left = 230
      Top = 0
      Width = 32
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        608.541666666667
        0
        84.6666666666667)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRShape6: TQRShape
      Left = 292
      Top = 0
      Width = 32
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        772.583333333333
        0
        84.6666666666667)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRShape7: TQRShape
      Left = 354
      Top = 0
      Width = 32
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        936.625
        0
        84.6666666666667)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRShape9: TQRShape
      Left = 385
      Top = 0
      Width = 32
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1018.64583333333
        0
        84.6666666666667)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 232
      Top = 16
      Width = 28
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        613.833333333333
        42.3333333333333
        74.0833333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Interés'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRLabel7: TQRLabel
      Left = 295
      Top = 16
      Width = 26
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        780.520833333333
        42.3333333333333
        68.7916666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Comisión'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRLabel10: TQRLabel
      Left = 354
      Top = 16
      Width = 32
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        936.625
        42.3333333333333
        84.6666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Moratorios'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRLabel12: TQRLabel
      Left = 386
      Top = 13
      Width = 30
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1021.29166666667
        34.3958333333333
        79.375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Frecuencia de Pago'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRShape4: TQRShape
      Left = 261
      Top = 0
      Width = 32
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        690.5625
        0
        84.6666666666667)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRLabel24: TQRLabel
      Left = 265
      Top = 12
      Width = 25
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        701.145833333333
        31.75
        66.1458333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Iva Interés'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRShape11: TQRShape
      Left = 323
      Top = 0
      Width = 32
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        854.604166666667
        0
        84.6666666666667)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRLabel26: TQRLabel
      Left = 324
      Top = 12
      Width = 30
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        857.25
        31.75
        79.375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Iva Comisión'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRSHPTChequera: TQRShape
      Left = 0
      Top = 0
      Width = 97
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        0
        0
        256.645833333333)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRLabel30: TQRLabel
      Left = 4
      Top = 16
      Width = 90
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        10.5833333333333
        42.3333333333333
        238.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Cliente'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRShape12: TQRShape
      Left = 416
      Top = 0
      Width = 91
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1100.66666666667
        0
        240.770833333333)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRShape13: TQRShape
      Left = 506
      Top = 0
      Width = 37
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1338.79166666667
        0
        97.8958333333333)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRShape14: TQRShape
      Left = 606
      Top = 0
      Width = 71
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1603.375
        0
        187.854166666667)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRShape15: TQRShape
      Left = 542
      Top = 0
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1434.04166666667
        0
        171.979166666667)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRShape16: TQRShape
      Left = 711
      Top = 0
      Width = 58
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1881.1875
        0
        153.458333333333)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRShape17: TQRShape
      Left = 676
      Top = 0
      Width = 36
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        1788.58333333333
        0
        95.25)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Left = 426
      Top = 16
      Width = 73
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        1127.125
        42.3333333333333
        193.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Dirección del Cliente'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRLabel3: TQRLabel
      Left = 510
      Top = 16
      Width = 29
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        1349.375
        42.3333333333333
        76.7291666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tel. Cliente'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRLabel13: TQRLabel
      Left = 545
      Top = 16
      Width = 57
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        1441.97916666667
        42.3333333333333
        150.8125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Nombre del Aval'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRLabel14: TQRLabel
      Left = 613
      Top = 16
      Width = 55
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        1621.89583333333
        42.3333333333333
        145.520833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Dirección del Aval'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRLabel15: TQRLabel
      Left = 680
      Top = 16
      Width = 23
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        1799.16666666667
        42.3333333333333
        60.8541666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tel. Aval'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRLabel16: TQRLabel
      Left = 713
      Top = 16
      Width = 55
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        1886.47916666667
        42.3333333333333
        145.520833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Nombre Empresa'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRShape19: TQRShape
      Left = 768
      Top = 0
      Width = 91
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        2032
        0
        240.770833333333)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRShape21: TQRShape
      Left = 858
      Top = 0
      Width = 49
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        2270.125
        0
        129.645833333333)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRLabel20: TQRLabel
      Left = 778
      Top = 16
      Width = 75
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        2058.45833333333
        42.3333333333333
        198.4375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Dirección Trabajo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRLabel21: TQRLabel
      Left = 863
      Top = 16
      Width = 42
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        2283.35416666667
        42.3333333333333
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tel. Trabajo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRShape22: TQRShape
      Left = 906
      Top = 0
      Width = 53
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        100.541666666667
        2397.125
        0
        140.229166666667)
      Brush.Color = clWindow
      Shape = qrsRectangle
    end
    object QRLabel22: TQRLabel
      Left = 911
      Top = 13
      Width = 42
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        2410.35416666667
        34.3958333333333
        111.125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Persona a quien Reporta'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
  end
  object QRBand1: TQRBand
    Left = 48
    Top = 186
    Width = 960
    Height = 11
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
      29.1041666666667
      2540)
    BandType = rbDetail
    object QRDBText16: TQRDBText
      Left = 229
      Top = 0
      Width = 30
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        605.895833333333
        0
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyResum
      DataField = 'INTERES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText1: TQRDBText
      Left = 2
      Top = 0
      Width = 95
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        5.29166666666667
        0
        251.354166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyResum
      DataField = 'NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText2: TQRDBText
      Left = 259
      Top = 0
      Width = 30
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        685.270833333333
        0
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyResum
      DataField = 'IVA_INTERES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText3: TQRDBText
      Left = 289
      Top = 0
      Width = 30
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        764.645833333333
        0
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyResum
      DataField = 'COMISION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText5: TQRDBText
      Left = 319
      Top = 0
      Width = 30
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        844.020833333333
        0
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyResum
      DataField = 'IVA_COMISION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText6: TQRDBText
      Left = 349
      Top = 0
      Width = 29
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        923.395833333333
        0
        76.7291666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyResum
      DataField = 'MORAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText7: TQRDBText
      Left = 97
      Top = 0
      Width = 32
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        256.645833333333
        0
        84.6666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyResum
      DataField = 'CREDITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText10: TQRDBText
      Left = 139
      Top = 0
      Width = 10
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        367.770833333333
        0
        26.4583333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyResum
      DataField = 'PROG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText11: TQRDBText
      Left = 149
      Top = 0
      Width = 10
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        394.229166666667
        0
        26.4583333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyResum
      DataField = 'PAG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText12: TQRDBText
      Left = 159
      Top = 0
      Width = 10
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        420.6875
        0
        26.4583333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyResum
      DataField = 'VDOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText13: TQRDBText
      Left = 379
      Top = 0
      Width = 30
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1002.77083333333
        0
        79.375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyResum
      DataField = 'FREC_PAGO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object qrlTOTAL_CICLO: TQRLabel
      Left = 129
      Top = 0
      Width = 10
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        341.3125
        0
        26.4583333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tot'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText9: TQRDBText
      Left = 409
      Top = 0
      Width = 8
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1082.14583333333
        0
        21.1666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyResum
      DataField = 'NUM_PAGOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText27: TQRDBText
      Left = 199
      Top = 0
      Width = 30
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        526.520833333333
        0
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyResum
      DataField = 'CAPITAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object ADEUDO: TQRLabel
      Left = 169
      Top = 0
      Width = 30
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        447.145833333333
        0
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'ADEUDO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText17: TQRDBText
      Left = 505
      Top = 0
      Width = 36
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1336.14583333333
        0
        95.25)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyResum
      DataField = 'TEL_CASA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText14: TQRDBText
      Left = 678
      Top = 0
      Width = 32
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1793.875
        0
        84.6666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyResum
      DataField = 'TEL_AVAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText18: TQRDBText
      Left = 607
      Top = 0
      Width = 70
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1606.02083333333
        0
        185.208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyResum
      DataField = 'DOM_AVAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText15: TQRDBText
      Left = 712
      Top = 0
      Width = 56
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1883.83333333333
        0
        148.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyResum
      DataField = 'JOB'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText4: TQRDBText
      Left = 417
      Top = 0
      Width = 89
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1103.3125
        0
        235.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyResum
      DataField = 'DIR_CTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText19: TQRDBText
      Left = 769
      Top = 0
      Width = 90
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        2034.64583333333
        0
        238.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyResum
      DataField = 'DOM_JOB'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText20: TQRDBText
      Left = 860
      Top = 0
      Width = 45
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        2275.41666666667
        0
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyResum
      DataField = 'TEL_JOB'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText8: TQRDBText
      Left = 543
      Top = 0
      Width = 62
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1436.6875
        0
        164.041666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyResum
      DataField = 'AVAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText21: TQRDBText
      Left = 907
      Top = 0
      Width = 52
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        2399.77083333333
        0
        137.583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyResum
      DataField = 'SUPERV'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
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
  object QRGroupContador: TQRGroup
    Left = 48
    Top = 170
    Width = 960
    Height = 3
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
      7.9375
      2540)
    Expression = 'qyResum.ID_EMPRESA'
    FooterBand = qrfempresa
    Master = Owner
    ReprintOnNewPage = False
  end
  object qrfModulo: TQRBand
    Left = 48
    Top = 197
    Width = 960
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrfModuloBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      34.3958333333333
      2540)
    BandType = rbGroupFooter
    object QRExpr1: TQRExpr
      Left = 199
      Top = -1
      Width = 30
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        526.520833333333
        -2.64583333333333
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyResum.CAPITAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr2: TQRExpr
      Left = 229
      Top = -1
      Width = 30
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        605.895833333333
        -2.64583333333333
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyResum.INTERES)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr3: TQRExpr
      Left = 289
      Top = -1
      Width = 30
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        764.645833333333
        -2.64583333333333
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyResum.COMISION)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr4: TQRExpr
      Left = 259
      Top = -1
      Width = 30
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        685.270833333333
        -2.64583333333333
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyResum.IVA_INTERES)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr5: TQRExpr
      Left = 319
      Top = -1
      Width = 30
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        844.020833333333
        -2.64583333333333
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyResum.IVA_COMISION)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr6: TQRExpr
      Left = 349
      Top = -1
      Width = 30
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        923.395833333333
        -2.64583333333333
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyResum.MORAS)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object ADEUDO_MOD: TQRLabel
      Left = 169
      Top = 0
      Width = 30
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        447.145833333333
        0
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'ADEUDO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRLabel18: TQRLabel
      Left = 12
      Top = 2
      Width = 40
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        31.75
        5.29166666666667
        105.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total por Módulo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
  end
  object qrfempresa: TQRBand
    Left = 48
    Top = 210
    Width = 960
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrfempresaBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      34.3958333333333
      2540)
    BandType = rbGroupFooter
    object QRLabel19: TQRLabel
      Left = 4
      Top = 3
      Width = 26
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        10.5833333333333
        7.9375
        68.7916666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Gran Total'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object ADEUDO_TOT: TQRLabel
      Left = 169
      Top = 3
      Width = 30
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        447.145833333333
        7.9375
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'ADEUDO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRExpr7: TQRExpr
      Left = 199
      Top = 3
      Width = 30
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        526.520833333333
        7.9375
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyResum.CAPITAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr8: TQRExpr
      Left = 229
      Top = 3
      Width = 30
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        605.895833333333
        7.9375
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyResum.INTERES)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr10: TQRExpr
      Left = 259
      Top = 3
      Width = 30
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        685.270833333333
        7.9375
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyResum.IVA_INTERES)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr9: TQRExpr
      Left = 289
      Top = 3
      Width = 30
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        764.645833333333
        7.9375
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyResum.COMISION)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr11: TQRExpr
      Left = 319
      Top = 3
      Width = 30
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        844.020833333333
        7.9375
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyResum.IVA_COMISION)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr12: TQRExpr
      Left = 349
      Top = 3
      Width = 30
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.1666666666667
        923.395833333333
        7.9375
        79.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyResum.MORAS)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
  end
  object qrMODULO: TQRGroup
    Left = 48
    Top = 173
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
    Expression = 'qyResum.MODULO'
    FooterBand = qrfModulo
    Master = Owner
    ReprintOnNewPage = False
    object QRShape18: TQRShape
      Left = 1
      Top = 1
      Width = 933
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        2.64583333333333
        2.64583333333333
        2468.5625)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRDBText28: TQRDBText
      Left = 27
      Top = 2
      Width = 262
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        71.4375
        5.29166666666667
        693.208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyResum
      DataField = 'MODULO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRLabel28: TQRLabel
      Left = 4
      Top = 2
      Width = 18
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        10.5833333333333
        5.29166666666667
        47.625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Módulo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
  end
  object qyResum: TQuery
    SQL.Strings = (
      'SELECT UNI.DESC_ENTIDAD MODULO,'
      '       CR.ID_CREDITO CREDITO, '
      '       P.NOMBRE     AS "NOM. CLIENTE",'
      #9'   ( SELECT COUNT(*) FROM CR_CAPITAL'
      
        '         WHERE ID_CREDITO = CR.ID_CREDITO AND SIT_CAPITAL IN ( '#39 +
        'AC'#39', '#39'PA'#39' ) ) PROGRAMADOS,'
      #9'   ( SELECT COUNT(*) FROM CR_CAPITAL'
      
        '         WHERE ID_CREDITO = CR.ID_CREDITO AND SIT_CAPITAL = '#39'LQ'#39 +
        ' ) REALIZADOS,'
      #9'   ( SELECT COUNT(*) FROM CR_CAPITAL'
      
        '         WHERE ID_CREDITO = CR.ID_CREDITO AND SIT_CAPITAL = '#39'IM'#39 +
        ' ) VENCIDOS,'
      '       FREC_PAGO    AS "FREC. PAGO",'
      '       NUM_PAGOS    AS "PLAZO",'
      '       ( SELECT SUM( IMP_CAPITAL - IMP_PAGADO )'
      '         FROM CR_CAPITAL'
      '         WHERE ID_CREDITO = CR.ID_CREDITO'
      '           AND SIT_CAPITAL NOT IN ( '#39'LQ'#39', '#39'CA'#39' )) CAPITAL,'
      ''
      '       ( SELECT SUM( IMP_INTERES - IMP_PAGADO )'
      '         FROM CR_INTERES'
      '         WHERE ID_CREDITO = CR.ID_CREDITO'
      '           AND SIT_INTERES  NOT IN ( '#39'LQ'#39', '#39'CA'#39' )) INTERES,'
      ''
      '       ( SELECT SUM( IMP_IVA - IMP_IVA_PAGADO ) '
      '         FROM CR_INTERES'
      '         WHERE ID_CREDITO = CR.ID_CREDITO'
      '           AND SIT_INTERES  NOT IN ( '#39'LQ'#39', '#39'CA'#39' )) IVA_INTERES,'
      ''
      '       ( SELECT SUM( IMP_COMISION - IMP_PAGADO )'
      '         FROM CR_COMISION'
      '         WHERE ID_CREDITO = CR.ID_CREDITO'
      '           AND SIT_COMISION NOT IN ( '#39'LQ'#39', '#39'CA'#39' )) COMISION,'
      ''
      '       ( SELECT SUM( IMP_IVA -IMP_IVA_PAGADO ) '
      '         FROM CR_COMISION'
      '         WHERE ID_CREDITO = CR.ID_CREDITO'
      '           AND SIT_COMISION NOT IN ( '#39'LQ'#39', '#39'CA'#39' )) IVA_COMISION,'
      '       ( SELECT SUM(IMPORTE)'
      '         FROM ('
      
        '             SELECT ID_CREDITO, SUM( IMP_MORATORIO - IMP_PAGADO_' +
        'MORA + IMP_IVA_MORA -IMP_PAG_IVA_MORA ) IMPORTE'
      
        '             FROM CR_CAPITAL WHERE SIT_CAPITAL NOT IN ( '#39'LQ'#39', '#39'C' +
        'A'#39' ) '
      '             GROUP BY ID_CREDITO'
      '            UNION'
      
        '    '#9#9'SELECT ID_CREDITO, SUM(IMP_MORATORIO - IMP_PAGADO_MORA + I' +
        'MP_IVA_MORA -IMP_PAG_IVA_MORA ) IMPORTE'
      
        '             FROM CR_INTERES WHERE SIT_INTERES NOT IN ( '#39'LQ'#39', '#39'C' +
        'A'#39' )'
      '             GROUP BY ID_CREDITO'
      '            UNION'
      
        '     '#9#9' SELECT ID_CREDITO, SUM(IMP_MORATORIO - IMP_PAGADO_MORA +' +
        ' IMP_IVA_MORA -IMP_PAG_IVA_MORA ) IMPORTE'
      
        '             FROM CR_COMISION WHERE SIT_COMISION NOT IN ( '#39'LQ'#39', ' +
        #39'CA'#39' ) '
      '             GROUP BY ID_CREDITO'
      '               )'
      '         WHERE ID_CREDITO = CR.ID_CREDITO'
      '       ) MORAS,'
      
        #9'   dom.CALLE_NUMERO||'#39', Col. '#39'||dom.COLONIA||'#39', Del. '#39'||cd.DESC' +
        '_POBLACION||'#39', '#39'||'
      '       edo.DESC_POBLACION||'#39'. C.P. '#39'||dom.CODIGO_POSTAL DIR_CTE,'
      '       P.TELEF_CASA AS "TEL. CASA",'
      ''
      '       CBS.TEL_AVAL     AS NOM_AVAL,'
      '       CBS.DOMICILIO    AS DOM_AVAL,'
      '       CBS.AVAL         AS TEL_AVAL,'
      '       CBS.JOB,'
      '       CBS.DOM_JOB,'
      '       CBS.TEL_JOB,'
      #9'   CBS.INM_SUP_NOMBRE SUPERV,'
      '       CBS.NOM_1 REF_1,'
      '       CBS.TEL_1 TEL_REF1,'
      '       CBS.NOM_2 REF_2,'
      '       CBS.TEL_2 TEL_REF2'
      ''
      'FROM CR_CREDITO CR,'
      '     CONTRATO CTO,'
      '     UNIDAD_NEGOCIO UNI,'
      '     PERSONA P, DOMICILIO DOM,'
      
        '     ( SELECT CBA.NOMBRE_PERSONA||'#39' '#39'||CBA.APELLIDO_PATERNO||'#39' '#39 +
        '||CBA.APELLIDO_MATERNO AVAL,'
      
        '              CBA.TELEF_CASA TEL_AVAL, CBS.ID_CREDITO, CBS.NUM_P' +
        'AGOS,'
      
        '              DECODE(CBS.CVE_UNIDAD_TIEMP,'#39'SE'#39','#39'SEMANAL'#39', '#39'QUINC' +
        'ENAL'#39') FREC_PAGO,'
      
        #9#9#9'  CBA.CALLE||'#39' '#39'||CBA.NUM_EXT||'#39' Int. '#39'||CBA.NUM_INT||'#39', CP.'#39 +
        '||CBA.CODIGO_POSTAL|| '#39', '#39'||'
      
        '              MUN.DESC_MUNICIPIO||'#39', Edo. '#39'||EDO.DESC_ESTADO DOM' +
        'ICILIO,'
      
        '              CBS.NOMBRE_EMPRESA JOB, CBS.TELEF_EMPRESA||'#39' '#39'|| C' +
        'BS.EXT_TEL_EMP TEL_JOB, CBS.INM_SUP_NOMBRE,'
      
        #9#9#9'  CBA.CALLE_EMP||'#39' '#39'||CBA.NUM_EXT_EMP||'#39' Int. '#39'||CBA.NUM_INT_' +
        'EMP||'#39', CP.'#39'||CBA.COD_POSTAL_EMP|| '#39', '#39'||'
      
        '              MEMP.DESC_MUNICIPIO||'#39', Edo. '#39'||EEMP.DESC_ESTADO D' +
        'OM_JOB,'
      #9#9#9'  REFER.NOM_1, REFER.TEL_1, REFER.NOM_2, REFER.TEL_2'
      '       FROM CR_BB_SOLICITUD CBS,'
      '            CR_BB_SOL_AVAL CBA,'
      '            BC_MUNICIPIO MUN,'
      '            BC_ESTADO EDO,'
      '            BC_MUNICIPIO MEMP,'
      '            BC_ESTADO EEMP,'
      
        '            (SELECT R1.ID_SOLICITUD, R1.NOMBRE NOM_1, R1.TELEFON' +
        'O TEL_1, R2.NOMBRE NOM_2, R2.TELEFONO TEL_2'
      '             FROM(SELECT ID_SOLICITUD, CVE_TIPO_REFER,'
      
        '                         NOMBRE_PERSONA||'#39' '#39'||APELLIDO_PATERNO||' +
        #39' '#39'||APELLIDO_MATERNO NOMBRE, TELEFONO'
      '                  FROM CR_BB_SOL_REFER'
      '                  WHERE CVE_TIPO_REFER = '#39'RF_1'#39')R1,'
      '                 (SELECT ID_SOLICITUD, CVE_TIPO_REFER,'
      
        '                         NOMBRE_PERSONA||'#39' '#39'||APELLIDO_PATERNO||' +
        #39' '#39'||APELLIDO_MATERNO NOMBRE, TELEFONO'
      '                  FROM CR_BB_SOL_REFER'
      '                  WHERE CVE_TIPO_REFER = '#39'RF_2'#39')R2'
      '             WHERE R1.ID_SOLICITUD = R2.ID_SOLICITUD'
      '            )REFER'
      '       WHERE CBA.ID_SOLICITUD(+) = CBS.ID_SOLICITUD'
      '         AND CBA.CVE_MUNICIPIO = MUN.CVE_MUNICIPIO'
      '         AND CBA.CVE_ESTADO = MUN.CVE_ESTADO'
      '         AND CBA.CVE_ESTADO = EDO.CVE_ESTADO'
      '         AND CBS.CVE_MUNIC_EMP = MEMP.CVE_MUNICIPIO'
      '         AND CBA.CVE_ESTADO_EMP = MEMP.CVE_ESTADO'
      '         AND CBA.CVE_ESTADO_EMP = EEMP.CVE_ESTADO'
      '         AND REFER.ID_SOLICITUD(+) = CBS.ID_SOLICITUD'
      '      ) CBS,'
      #9'  poblacion edo, poblacion cd'
      'WHERE CR.SIT_CREDITO  = '#39'AC'#39
      '  AND CTO.ID_EMPRESA  = 305027'
      '  AND CTO.ID_CONTRATO = CR.ID_CONTRATO'
      '  AND UNI.ID_ENTIDAD  = CTO.ID_ENTIDAD'
      '  AND P.ID_PERSONA    = CTO.ID_TITULAR'
      '  AND CR.ID_CREDITO   = CBS.ID_CREDITO(+)'
      '  AND P.ID_DOMICILIO  = DOM.ID_DOMICILIO'
      '  and edo.CVE_POBLACION = dom.cve_estado'
      '  and cd.CVE_POBLACION = dom.cve_ciudad')
    Left = 370
    Top = 12
    object qyResumMODULO: TStringField
      FieldName = 'MODULO'
      Size = 80
    end
    object qyResumCREDITO: TFloatField
      FieldName = 'CREDITO'
    end
    object qyResumNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 100
    end
    object qyResumPROG: TFloatField
      FieldName = 'PROG'
    end
    object qyResumPAG: TFloatField
      FieldName = 'PAG'
    end
    object qyResumVDOS: TFloatField
      FieldName = 'VDOS'
    end
    object qyResumCAPITAL: TFloatField
      FieldName = 'CAPITAL'
    end
    object qyResumINTERES: TFloatField
      FieldName = 'INTERES'
    end
    object qyResumIVA_INTERES: TFloatField
      FieldName = 'IVA_INTERES'
    end
    object qyResumCOMISION: TFloatField
      FieldName = 'COMISION'
    end
    object qyResumIVA_COMISION: TFloatField
      FieldName = 'IVA_COMISION'
    end
    object qyResumMORAS: TFloatField
      FieldName = 'MORAS'
    end
    object qyResumDIR_CTE: TStringField
      FieldName = 'DIR_CTE'
      Size = 250
    end
    object qyResumTEL_CASA: TStringField
      FieldName = 'TEL_CASA'
    end
    object qyResumAVAL: TStringField
      FieldName = 'AVAL'
      Size = 100
    end
    object qyResumTEL_AVAL: TStringField
      FieldName = 'TEL_AVAL'
    end
    object qyResumDOM_AVAL: TStringField
      FieldName = 'DOM_AVAL'
      Size = 250
    end
    object qyResumJOB: TStringField
      FieldName = 'JOB'
      Size = 100
    end
    object qyResumDOM_JOB: TStringField
      FieldName = 'DOM_JOB'
      Size = 250
    end
    object qyResumTEL_JOB: TStringField
      FieldName = 'TEL_JOB'
    end
    object qyResumSUPERV: TStringField
      FieldName = 'SUPERV'
      Size = 100
    end
    object qyResumREF_1: TStringField
      FieldName = 'REF_1'
      Size = 100
    end
    object qyResumTEL_REF1: TStringField
      FieldName = 'TEL_REF1'
    end
    object qyResumREF_2: TStringField
      FieldName = 'REF_2'
      Size = 100
    end
    object qyResumTEL_REF2: TStringField
      FieldName = 'TEL_REF2'
    end
    object qyResumNUM_PAGOS: TFloatField
      FieldName = 'NUM_PAGOS'
    end
    object qyResumFREC_PAGO: TStringField
      FieldName = 'FREC_PAGO'
    end
    object qyResumID_EMPRESA: TFloatField
      FieldName = 'ID_EMPRESA'
    end
  end
end
