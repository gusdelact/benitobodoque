object QrConsAdeudo: TQrConsAdeudo
  Left = 0
  Top = 0
  Width = 845
  Height = 653
  Frame.Color = clBlack
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
  BeforePrint = QuickRepBeforePrint
  DataSet = qyConsAdeudo
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
  Zoom = 80
  object ColumnHeaderBand1: TQRBand
    Left = 38
    Top = 105
    Width = 768
    Height = 19
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
      62.8385416666667
      2540)
    BandType = rbColumnHeader
    object QRSHPTCredito: TQRShape
      Left = 28
      Top = 0
      Width = 20
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        92.6041666666667
        0
        67.7994791666667)
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 30
      Top = 1
      Width = 15
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        99.21875
        4.40972222222222
        50.7118055555556)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Disp.'
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
    object QRSHPTCliente: TQRShape
      Left = 48
      Top = 0
      Width = 72
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        158.75
        0
        239.778645833333)
      Shape = qrsRectangle
    end
    object QRLabel17: TQRLabel
      Left = 49
      Top = 1
      Width = 72
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        36.3802083333333
        162.057291666667
        3.30729166666667
        236.471354166667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Producto'
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
    object QRSHPTMonto: TQRShape
      Left = 264
      Top = 0
      Width = 35
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        871.471354166667
        0
        115.755208333333)
      Shape = qrsRectangle
    end
    object QRLabel18: TQRLabel
      Left = 265
      Top = 1
      Width = 32
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        36.3802083333333
        876.432291666667
        3.30729166666667
        104.1796875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Imp. Autorizado'
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
    object QRSHPTF_Inicio: TQRShape
      Left = 707
      Top = 0
      Width = 17
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        2339.35763888889
        0
        55.1215277777778)
      Shape = qrsRectangle
    end
    object QRSHPTPlazo: TQRShape
      Left = 728
      Top = 0
      Width = 39
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        2407.70833333333
        0
        128.984375)
      Shape = qrsRectangle
    end
    object QRLabel24: TQRLabel
      Left = 739
      Top = 1
      Width = 26
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        24.2534722222222
        2442.98611111111
        4.40972222222222
        85.9895833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Catálogo mínimo'
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
      Width = 28
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        0
        0
        94.2578125)
      Shape = qrsRectangle
    end
    object QRLabel13: TQRLabel
      Left = 1
      Top = 1
      Width = 26
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        36.3802083333333
        3.30729166666667
        3.30729166666667
        85.9895833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Contrato'
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
    object QRSHPTProveedor: TQRShape
      Left = 140
      Top = 0
      Width = 28
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        463.020833333333
        0
        94.2578125)
      Shape = qrsRectangle
    end
    object QRLabel33: TQRLabel
      Left = 142
      Top = 1
      Width = 26
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        36.3802083333333
        469.635416666667
        3.30729166666667
        85.9895833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'F. Aut.'
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
    object QRLabel39: TQRLabel
      Left = 707
      Top = 1
      Width = 17
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        2339.35763888889
        4.40972222222222
        55.1215277777778)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '% Redes contado.'
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
      Left = 168
      Top = 0
      Width = 26
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        555.625
        0
        84.3359375)
      Shape = qrsRectangle
    end
    object QRLabel44: TQRLabel
      Left = 171
      Top = 1
      Width = 21
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        36.3802083333333
        565.546875
        3.30729166666667
        71.1067708333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'F. Vto.'
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
      Left = 646
      Top = 0
      Width = 35
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        2136.51041666667
        0
        116.857638888889)
      Shape = qrsRectangle
    end
    object QRLabel4: TQRLabel
      Left = 650
      Top = 1
      Width = 13
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2149.73958333333
        4.40972222222222
        44.0972222222222)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Entidad Descon tadora'
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
      Left = 193
      Top = 0
      Width = 17
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        638.307291666667
        0
        56.2239583333333)
      Shape = qrsRectangle
    end
    object QRLabel3: TQRLabel
      Left = 195
      Top = 1
      Width = 14
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        36.3802083333333
        644.921875
        3.30729166666667
        44.6484375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tasa Refer.'
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
      Left = 210
      Top = 0
      Width = 17
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        692.877604166667
        0
        56.2239583333333)
      Shape = qrsRectangle
    end
    object QRLabel5: TQRLabel
      Left = 211
      Top = 1
      Width = 13
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        698.5
        2.64583333333333
        42.3333333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Valor Tasa'
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
    object QRShape6: TQRShape
      Left = 225
      Top = 0
      Width = 20
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        745.794270833333
        0
        67.7994791666667)
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 227
      Top = 1
      Width = 17
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        751.416666666667
        2.64583333333333
        55.5625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Op. STasa'
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
    object QRShape7: TQRShape
      Left = 246
      Top = 0
      Width = 18
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        811.940104166667
        0
        61.1848958333333)
      Shape = qrsRectangle
    end
    object QRLabel7: TQRLabel
      Left = 248
      Top = 1
      Width = 15
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        36.3802083333333
        818.5546875
        3.30729166666667
        49.609375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tasa Total'
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
      Left = 298
      Top = 0
      Width = 128
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        985.572916666667
        0
        424.986979166667)
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Left = 300
      Top = 1
      Width = 124
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        992.1875
        2.20486111111111
        410.104166666667)
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
    object QRShape9: TQRShape
      Left = 120
      Top = 0
      Width = 20
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        396.875
        0
        67.7994791666667)
      Shape = qrsRectangle
    end
    object QRLabel10: TQRLabel
      Left = 122
      Top = 0
      Width = 15
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        36.3802083333333
        403.489583333333
        0
        51.2630208333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Cta. Orig.'
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
      Left = 618
      Top = 0
      Width = 30
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        2043.90625
        0
        99.21875)
      Shape = qrsRectangle
    end
    object QRLabel1: TQRLabel
      Left = 619
      Top = 7
      Width = 27
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2048.31597222222
        22.0486111111111
        88.1944444444445)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Total Adeudo'
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
      Left = 298
      Top = 6
      Width = 64
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        985.572916666667
        18.1901041666667
        213.3203125)
      Shape = qrsRectangle
    end
    object QRLabel11: TQRLabel
      Left = 300
      Top = 6
      Width = 59
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        992.1875
        19.84375
        194.027777777778)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Vigente'
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
      Left = 298
      Top = 11
      Width = 32
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        985.572916666667
        36.3802083333333
        107.486979166667)
      Shape = qrsRectangle
    end
    object QRLabel12: TQRLabel
      Left = 299
      Top = 12
      Width = 29
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        989.541666666667
        39.6875
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Vigente'
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
      Left = 330
      Top = 11
      Width = 32
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        1091.40625
        36.3802083333333
        107.486979166667)
      Shape = qrsRectangle
    end
    object QRLabel14: TQRLabel
      Left = 331
      Top = 12
      Width = 29
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1095.81597222222
        39.6875
        97.0138888888889)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Impagado'
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
    object QRShape13: TQRShape
      Left = 362
      Top = 11
      Width = 32
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        1197.23958333333
        36.3802083333333
        107.486979166667)
      Shape = qrsRectangle
    end
    object QRShape14: TQRShape
      Left = 394
      Top = 11
      Width = 32
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        1303.07291666667
        36.3802083333333
        107.486979166667)
      Shape = qrsRectangle
    end
    object QRLabel15: TQRLabel
      Left = 395
      Top = 12
      Width = 29
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1307.48263888889
        39.6875
        97.0138888888889)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'No Exigible'
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
      Left = 363
      Top = 12
      Width = 29
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1201.64930555556
        39.6875
        97.0138888888889)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Exigible'
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
    object QRShape15: TQRShape
      Left = 362
      Top = 6
      Width = 64
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1197.23958333333
        18.1901041666667
        213.3203125)
      Shape = qrsRectangle
    end
    object QRLabel19: TQRLabel
      Left = 367
      Top = 6
      Width = 59
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1212.67361111111
        19.84375
        194.027777777778)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Vencido'
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
    object QRShape17: TQRShape
      Left = 426
      Top = 6
      Width = 64
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1408.90625
        18.1901041666667
        213.3203125)
      Shape = qrsRectangle
    end
    object QRShape18: TQRShape
      Left = 490
      Top = 6
      Width = 64
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1620.57291666667
        18.1901041666667
        213.3203125)
      Shape = qrsRectangle
    end
    object QRShape19: TQRShape
      Left = 458
      Top = 11
      Width = 32
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        1514.73958333333
        36.3802083333333
        107.486979166667)
      Shape = qrsRectangle
    end
    object QRShape20: TQRShape
      Left = 426
      Top = 11
      Width = 32
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        1408.90625
        36.3802083333333
        107.486979166667)
      Shape = qrsRectangle
    end
    object QRShape22: TQRShape
      Left = 522
      Top = 11
      Width = 32
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        1726.40625
        36.3802083333333
        107.486979166667)
      Shape = qrsRectangle
    end
    object QRShape23: TQRShape
      Left = 426
      Top = 0
      Width = 128
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.1087962962963
        1408.1712962963
        0
        424.803240740741)
      Shape = qrsRectangle
    end
    object QRLabel20: TQRLabel
      Left = 428
      Top = 0
      Width = 124
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1415.52083333333
        0
        410.104166666667)
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
    object QRLabel21: TQRLabel
      Left = 428
      Top = 6
      Width = 58
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1415.52083333333
        19.84375
        191.822916666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Vigente'
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
    object QRLabel22: TQRLabel
      Left = 495
      Top = 6
      Width = 58
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1638.21180555556
        19.84375
        191.822916666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Vencido'
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
    object QRLabel25: TQRLabel
      Left = 427
      Top = 12
      Width = 29
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1412.875
        39.6875
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Vigente'
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
    object QRLabel26: TQRLabel
      Left = 459
      Top = 12
      Width = 29
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1518.70833333333
        39.6875
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Impagado'
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
    object QRLabel27: TQRLabel
      Left = 523
      Top = 12
      Width = 29
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1730.375
        39.6875
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Ctas. Orden'
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
    object QRShape24: TQRShape
      Left = 490
      Top = 11
      Width = 32
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        1620.57291666667
        36.3802083333333
        107.486979166667)
      Shape = qrsRectangle
    end
    object QRLabel29: TQRLabel
      Left = 491
      Top = 12
      Width = 29
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1624.54166666667
        39.6875
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Exigible'
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
    object QRShape21: TQRShape
      Left = 554
      Top = 0
      Width = 64
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.1119791666667
        1832.23958333333
        0
        213.3203125)
      Shape = qrsRectangle
    end
    object QRShape25: TQRShape
      Left = 554
      Top = 8
      Width = 32
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1832.23958333333
        26.4583333333333
        107.486979166667)
      Shape = qrsRectangle
    end
    object QRShape26: TQRShape
      Left = 586
      Top = 8
      Width = 32
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        33.0729166666667
        1938.07291666667
        26.4583333333333
        107.486979166667)
      Shape = qrsRectangle
    end
    object QRLabel32: TQRLabel
      Left = 556
      Top = 2
      Width = 58
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1838.85416666667
        5.29166666666667
        193.145833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Otros Conceptos'
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
    object QRLabel30: TQRLabel
      Left = 555
      Top = 10
      Width = 29
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1836.20833333333
        34.3958333333333
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Int. Moratorios'
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
    object QRLabel31: TQRLabel
      Left = 587
      Top = 10
      Width = 29
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1942.04166666667
        34.3958333333333
        95.25)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Otros'
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
    object QRShape27: TQRShape
      Left = 680
      Top = 0
      Width = 28
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        2248.95833333333
        0
        92.6041666666667)
      Shape = qrsRectangle
    end
    object QRLabel34: TQRLabel
      Left = 683
      Top = 3
      Width = 21
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.8923611111111
        2259.98263888889
        8.81944444444444
        68.3506944444444)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Saldo de Fondeo'
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
    object QRShape28: TQRShape
      Left = 723
      Top = 0
      Width = 14
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        59.53125
        2392.27430555556
        0
        46.3020833333333)
      Shape = qrsRectangle
    end
    object QRLabel35: TQRLabel
      Left = 725
      Top = 1
      Width = 11
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.7118055555556
        2396.68402777778
        4.40972222222222
        37.4826388888889)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tasa Pasiva'
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
    object QRLabel43: TQRLabel
      Left = 667
      Top = 1
      Width = 13
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2204.86111111111
        4.40972222222222
        44.0972222222222)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Prog.'
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
    Left = 38
    Top = 157
    Width = 768
    Height = 6
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
      19.84375
      2540)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 0
      Top = 1
      Width = 26
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        0
        4.40972222222222
        85.2546296296296)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'CONTRATO'
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
    object QRDBText3: TQRDBText
      Left = 27
      Top = 1
      Width = 20
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        89.6643518518519
        2.93981481481481
        66.1458333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'CREDITO'
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
      Left = 63
      Top = 1
      Width = 39
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        209.461805555556
        2.20486111111111
        127.881944444444)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'PRODUCTO'
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
    object QRDBText5: TQRDBText
      Left = 194
      Top = 1
      Width = 17
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.3173076923077
        643.141025641026
        3.05288461538462
        55.9695512820513)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'CVE_TASA'
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
    object QRDBText17: TQRDBText
      Left = 677
      Top = 1
      Width = 31
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2240.13888888889
        2.20486111111111
        103.628472222222)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'SDO_VIG_TOTAL'
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
    object QRDBText18: TQRDBText
      Left = 234
      Top = 1
      Width = 13
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.3173076923077
        775.432692307692
        3.05288461538462
        42.7403846153846)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'SOBRETASA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###0.0000'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText10: TQRDBText
      Left = 228
      Top = 1
      Width = 6
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.3173076923077
        754.0625
        3.05288461538462
        21.3701923076923)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'OPERADOR_STASA'
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
    object QRDBText12: TQRDBText
      Left = 48
      Top = 1
      Width = 16
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        157.280092592593
        2.93981481481481
        51.4467592592593)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'CVE_PRODUCTO_CRE'
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
    object QRDBText24: TQRDBText
      Left = 145
      Top = 1
      Width = 23
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.3173076923077
        479.302884615385
        3.05288461538462
        76.3221153846154)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'F_AUTORIZA'
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
    object QRDBText30: TQRDBText
      Left = 171
      Top = 1
      Width = 23
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.3173076923077
        565.801282051282
        3.05288461538462
        76.3221153846154)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'F_VENCIMIENTO'
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
    object QRDBText11: TQRDBText
      Left = 246
      Top = 1
      Width = 20
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.3173076923077
        815.120192307692
        3.05288461538462
        66.1458333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'TASA_TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '####0.000000'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText13: TQRDBText
      Left = 267
      Top = 1
      Width = 32
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.1901041666667
        883.046875
        3.30729166666667
        107.486979166667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'IMP_AUTORIZADO'
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
    object QRDBText14: TQRDBText
      Left = 299
      Top = 1
      Width = 32
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.1901041666667
        988.880208333333
        3.30729166666667
        107.486979166667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'VIGENTE_CP'
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
    object QRDBText15: TQRDBText
      Left = 331
      Top = 1
      Width = 32
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.1901041666667
        1094.71354166667
        3.30729166666667
        107.486979166667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'IMPAGADO_CP'
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
    object QRDBText16: TQRDBText
      Left = 363
      Top = 1
      Width = 32
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.1901041666667
        1200.546875
        3.30729166666667
        107.486979166667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'EXIGIBLE_CP'
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
    object QRDBText20: TQRDBText
      Left = 395
      Top = 1
      Width = 32
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.1901041666667
        1306.38020833333
        3.30729166666667
        107.486979166667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'NOEXIGIBLE_CP'
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
    object QRDBText21: TQRDBText
      Left = 523
      Top = 1
      Width = 32
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.1901041666667
        1729.71354166667
        3.30729166666667
        107.486979166667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'CTA_ORD_IN'
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
    object QRDBText22: TQRDBText
      Left = 491
      Top = 1
      Width = 32
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.1901041666667
        1623.88020833333
        3.30729166666667
        107.486979166667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'EXIGIBLE_IN'
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
    object QRDBText23: TQRDBText
      Left = 459
      Top = 1
      Width = 32
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.1901041666667
        1518.046875
        3.30729166666667
        107.486979166667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'IMPAGADO_IN'
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
    object QRDBText25: TQRDBText
      Left = 427
      Top = 1
      Width = 32
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.1901041666667
        1412.21354166667
        3.30729166666667
        107.486979166667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'VIGENTE_IN'
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
    object QRDBText26: TQRDBText
      Left = 555
      Top = 1
      Width = 32
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.1901041666667
        1835.546875
        3.30729166666667
        107.486979166667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'MORATORIOS'
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
    object QRDBText27: TQRDBText
      Left = 587
      Top = 1
      Width = 32
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.1901041666667
        1941.38020833333
        3.30729166666667
        107.486979166667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'IMP_OTROS'
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
    object QRDBText28: TQRDBText
      Left = 619
      Top = 1
      Width = 30
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2046.11111111111
        4.40972222222222
        99.21875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'TOT_ADEUDO'
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
    object QRDBText29: TQRDBText
      Left = 650
      Top = 1
      Width = 16
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2149.73958333333
        4.40972222222222
        52.9166666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'CVE_FND_ENT_DES'
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
    object QRDBText31: TQRDBText
      Left = 710
      Top = 1
      Width = 14
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2348.17708333333
        2.20486111111111
        46.3020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'TASA_FND_TOT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '####0.0000'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText32: TQRDBText
      Left = 741
      Top = 1
      Width = 25
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2451.80555555556
        2.20486111111111
        81.5798611111111)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'DESC_CAT_MINIMO'
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
    object QRDBText6: TQRDBText
      Left = 725
      Top = 1
      Width = 14
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2396.68402777778
        2.20486111111111
        46.3020833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'TASA_FND_TOT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '####0.0000'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 4
    end
    object QRDBText33: TQRDBText
      Left = 107
      Top = 1
      Width = 38
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        352.777777777778
        2.20486111111111
        125.677083333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'CTA_ORIGEN'
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
    object qrlValorTasaRefer: TQRLabel
      Left = 211
      Top = 1
      Width = 16
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        697.838541666667
        3.30729166666667
        52.9166666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '00.0000'
      Color = clWhite
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
      Left = 667
      Top = 1
      Width = 10
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2204.86111111111
        4.40972222222222
        33.0729166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'CVE_FND_PROGRAMA'
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
  object QRFooterAcreditado: TQRBand
    Left = 38
    Top = 163
    Width = 768
    Height = 9
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFooterAcreditadoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      29.765625
      2540)
    BandType = rbGroupFooter
    object QRLabel23: TQRLabel
      Left = 25
      Top = 1
      Width = 43
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        82.6822916666667
        3.30729166666667
        142.213541666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total Acreditado'
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
    object QRExpr1: TQRExpr
      Left = 299
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        987.777777777778
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.VIGENTE_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr2: TQRExpr
      Left = 331
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1093.61111111111
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.IMPAGADO_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr3: TQRExpr
      Left = 363
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1199.44444444444
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.EXIGIBLE_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr4: TQRExpr
      Left = 395
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1305.27777777778
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.NOEXIGIBLE_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr5: TQRExpr
      Left = 523
      Top = 2
      Width = 33
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1730.375
        5.29166666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.CTA_ORD_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr6: TQRExpr
      Left = 491
      Top = 2
      Width = 33
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1624.54166666667
        5.29166666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.EXIGIBLE_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr7: TQRExpr
      Left = 459
      Top = 2
      Width = 33
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1518.70833333333
        5.29166666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.IMPAGADO_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr8: TQRExpr
      Left = 427
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1411.11111111111
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.VIGENTE_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr9: TQRExpr
      Left = 555
      Top = 2
      Width = 33
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1836.20833333333
        5.29166666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.MORATORIOS)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr10: TQRExpr
      Left = 587
      Top = 2
      Width = 33
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1942.04166666667
        5.29166666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.IMP_OTROS)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr11: TQRExpr
      Left = 619
      Top = 1
      Width = 30
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2048.31597222222
        4.40972222222222
        99.21875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.TOT_ADEUDO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr12: TQRExpr
      Left = 677
      Top = 2
      Width = 31
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2240.13888888889
        6.61458333333333
        103.628472222222)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.SDO_VIG_TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRLabel42: TQRLabel
      Left = 265
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        877.534722222222
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Vigente'
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
  object QRBand2: TQRBand
    Left = 38
    Top = 38
    Width = 768
    Height = 67
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
      221.588541666667
      2540)
    BandType = rbPageHeader
    object QRInterEncabezado1: TQRInterEncabezado
      Left = 0
      Top = 0
      Width = 768
      Height = 67
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        221.588541666667
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
    object lbDolares: TQRLabel
      Left = 143
      Top = 42
      Width = 38
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        30.8680555555556
        471.840277777778
        138.90625
        125.677083333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Dólares TC.'
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
    object lbUDIS: TQRLabel
      Left = 143
      Top = 54
      Width = 38
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        472.942708333333
        178.59375
        125.677083333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'UDIS TC.'
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
    object qrlUDIS_TC: TQRLabel
      Left = 182
      Top = 54
      Width = 38
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        601.927083333333
        178.59375
        125.677083333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'UDIS TC.'
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
    object qrlDOLAR_TC: TQRLabel
      Left = 182
      Top = 42
      Width = 38
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.765625
        601.927083333333
        138.90625
        125.677083333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Dólares TC.'
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
  object qrgrpFooterMoneda: TQRBand
    Left = 38
    Top = 182
    Width = 768
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrgrpFooterMonedaBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      39.6875
      2540)
    BandType = rbGroupFooter
    object QRLabel28: TQRLabel
      Left = 7
      Top = 1
      Width = 34
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        23.1510416666667
        3.30729166666667
        112.447916666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total Moneda'
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
    object QRExpr27: TQRExpr
      Left = 677
      Top = 2
      Width = 31
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2240.13888888889
        6.61458333333333
        103.628472222222)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.SDO_VIG_TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr28: TQRExpr
      Left = 619
      Top = 1
      Width = 30
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2048.31597222222
        4.40972222222222
        99.21875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.TOT_ADEUDO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr29: TQRExpr
      Left = 587
      Top = 2
      Width = 33
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1942.04166666667
        5.29166666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.IMP_OTROS)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr30: TQRExpr
      Left = 555
      Top = 2
      Width = 33
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1836.20833333333
        5.29166666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.MORATORIOS)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr32: TQRExpr
      Left = 491
      Top = 2
      Width = 33
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1624.54166666667
        5.29166666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.EXIGIBLE_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr33: TQRExpr
      Left = 459
      Top = 2
      Width = 33
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1518.70833333333
        5.29166666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.IMPAGADO_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr34: TQRExpr
      Left = 427
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1411.11111111111
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.VIGENTE_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr35: TQRExpr
      Left = 395
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1305.27777777778
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.NOEXIGIBLE_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr36: TQRExpr
      Left = 363
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1199.44444444444
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.EXIGIBLE_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr37: TQRExpr
      Left = 331
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1093.61111111111
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.IMPAGADO_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr38: TQRExpr
      Left = 299
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        987.777777777778
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.VIGENTE_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr31: TQRExpr
      Left = 523
      Top = 2
      Width = 33
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1730.375
        5.29166666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.CTA_ORD_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRLabel38: TQRLabel
      Left = 265
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        877.534722222222
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Vigente'
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
  object qrgrpFooterGpoEconomico: TQRBand
    Left = 38
    Top = 172
    Width = 768
    Height = 10
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrgrpFooterGpoEconomicoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      33.0729166666667
      2540)
    BandType = rbGroupFooter
    object QRLabel36: TQRLabel
      Left = 15
      Top = 1
      Width = 70
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        49.609375
        3.30729166666667
        231.510416666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total de Grupo Económico'
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
    object QRExpr13: TQRExpr
      Left = 677
      Top = 2
      Width = 31
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2240.13888888889
        6.61458333333333
        103.628472222222)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.SDO_VIG_TOTAL)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr14: TQRExpr
      Left = 619
      Top = 1
      Width = 30
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2048.31597222222
        4.40972222222222
        99.21875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.TOT_ADEUDO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr15: TQRExpr
      Left = 587
      Top = 2
      Width = 33
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1942.04166666667
        5.29166666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.IMP_OTROS)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr16: TQRExpr
      Left = 555
      Top = 2
      Width = 33
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1836.20833333333
        5.29166666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.MORATORIOS)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr18: TQRExpr
      Left = 491
      Top = 2
      Width = 33
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1624.54166666667
        5.29166666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.EXIGIBLE_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr19: TQRExpr
      Left = 459
      Top = 2
      Width = 33
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1518.70833333333
        5.29166666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.IMPAGADO_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr20: TQRExpr
      Left = 427
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1411.11111111111
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.VIGENTE_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr21: TQRExpr
      Left = 395
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1305.27777777778
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.NOEXIGIBLE_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr22: TQRExpr
      Left = 363
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1199.44444444444
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.EXIGIBLE_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr23: TQRExpr
      Left = 331
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1093.61111111111
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.IMPAGADO_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr24: TQRExpr
      Left = 299
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        987.777777777778
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.VIGENTE_CP)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpr17: TQRExpr
      Left = 523
      Top = 2
      Width = 33
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1730.375
        5.29166666666667
        108.479166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.CTA_ORD_IN)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRLabel40: TQRLabel
      Left = 265
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        877.534722222222
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Vigente'
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
  object QRGroupContador: TQRGroup
    Left = 38
    Top = 124
    Width = 768
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
      9.921875
      2540)
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGroupMoneda: TQRGroup
    Left = 38
    Top = 127
    Width = 768
    Height = 10
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
      33.0729166666667
      2540)
    Expression = 'qyConsAdeudo.CVE_MONEDA'
    FooterBand = qrgrpFooterMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRSHPMoneda: TQRShape
      Left = 6
      Top = 1
      Width = 487
      Height = 9
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
      Left = 9
      Top = 1
      Width = 21
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        29.765625
        3.30729166666667
        69.453125)
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
      Left = 38
      Top = 2
      Width = 30
      Height = 6
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
      DataSet = qyConsAdeudo
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
      Left = 71
      Top = 2
      Width = 44
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        234.817708333333
        6.61458333333333
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
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
  object QRGroupTipoOper: TQRGroup
    Left = 38
    Top = 137
    Width = 768
    Height = 10
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
      33.0729166666667
      2540)
    Expression = 'qyConsAdeudo.CVE_GRUPO'
    FooterBand = qrgrpFooterGpoEconomico
    Master = Owner
    ReprintOnNewPage = False
    object QRSHPSector: TQRShape
      Left = 10
      Top = 1
      Width = 487
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.75
        34.3958333333333
        2.64583333333333
        1611.3125)
      Shape = qrsRectangle
    end
    object QRLabel52: TQRLabel
      Left = 15
      Top = 1
      Width = 50
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        49.609375
        3.30729166666667
        165.364583333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Grupo Económico:'
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
    object QRDBText38: TQRDBText
      Left = 79
      Top = 2
      Width = 36
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        261.276041666667
        6.61458333333333
        119.0625)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'CVE_GRUPO'
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
      Left = 121
      Top = 2
      Width = 32
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        400.182291666667
        6.61458333333333
        105.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'DESC_GPO'
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
  object QROrigen: TQRGroup
    Left = 38
    Top = 147
    Width = 768
    Height = 10
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
      33.0729166666667
      2540)
    Expression = 'qyConsAdeudo.TITULAR'
    FooterBand = QRFooterAcreditado
    Master = Owner
    ReprintOnNewPage = False
    object QRSHPOrigen: TQRShape
      Left = 22
      Top = 1
      Width = 487
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.1041666666667
        71.4375
        2.64583333333333
        1611.3125)
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Left = 28
      Top = 1
      Width = 34
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        92.6041666666667
        3.30729166666667
        112.447916666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Acreditado: '
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
    object QRDBText8: TQRDBText
      Left = 59
      Top = 1
      Width = 25
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        195.130208333333
        3.30729166666667
        82.6822916666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'NOMBRE'
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
    object QRDBText34: TQRDBText
      Left = 391
      Top = 2
      Width = 22
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1293.15104166667
        6.61458333333333
        72.7604166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'STATUS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 5
    end
  end
  object SummaryBand1: TQRBand
    Left = 38
    Top = 194
    Width = 768
    Height = 17
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = SummaryBand1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      56.2239583333333
      2540)
    BandType = rbSummary
    object QRLabel37: TQRLabel
      Left = 1
      Top = 1
      Width = 35
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.1510416666667
        3.30729166666667
        3.30729166666667
        115.755208333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total General'
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
    object Tot_CP_Vig: TQRLabel
      Left = 299
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        987.777777777778
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Vigente'
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
    object Tot_CP_Imp: TQRLabel
      Left = 331
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1093.61111111111
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Impagado'
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
    object Tot_CP_Exi: TQRLabel
      Left = 363
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1199.44444444444
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Exigible'
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
    object Tot_CP_NEx: TQRLabel
      Left = 395
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1305.27777777778
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'No Exigible'
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
    object Tot_IN_Vig: TQRLabel
      Left = 427
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1411.11111111111
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Vigente'
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
    object Tot_IN_Imp: TQRLabel
      Left = 459
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1519.14930555556
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Impagado'
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
    object Tot_IN_Exig: TQRLabel
      Left = 491
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1624.98263888889
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Exigible'
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
    object Tot_IN_CtaOrd: TQRLabel
      Left = 523
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1730.81597222222
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Ctas. Orden'
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
    object Tot_Moras: TQRLabel
      Left = 555
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1836.64930555556
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Int. Moratorios'
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
    object Tot_Otros: TQRLabel
      Left = 587
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1942.48263888889
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Otros'
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
    object Total_adeudo: TQRLabel
      Left = 619
      Top = 1
      Width = 30
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2048.31597222222
        4.40972222222222
        99.21875)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Total Adeudo'
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
    object Tot_Sdo_Fdeo: TQRLabel
      Left = 673
      Top = 1
      Width = 35
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        2226.90972222222
        4.40972222222222
        116.857638888889)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tot_Sdo_Fdeo'
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
    object QRLabel41: TQRLabel
      Left = 265
      Top = 1
      Width = 33
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        877.534722222222
        4.40972222222222
        108.038194444444)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Vigente'
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
  object qyConsAdeudo: TQuery
    DatabaseName = 'RCORP'
    SQL.Strings = (
      ' SELECT * '
      ' FROM ( '
      '        SELECT CTO.ID_EMPRESA                    AS EMPRESA, '
      
        '               CRP.CVE_GPO_INGRESO               AS PRODUCTO_GPO' +
        ', '
      '               CCTO.ID_CONTRATO                  AS CONTRATO, '
      '               CRE.ID_CREDITO                    AS CREDITO, '
      '               SUBSTR(CSB.CVE_SUB_TIP_BCO,1,6)   AS PRODUCTO, '
      '               SUBSTR(CSB.DESC_SUB_TIPO,1,80)    AS DESC_PROD, '
      
        '               DECODE(CRE.TIPO_DISPOSICION, '#39'RN'#39', CTA_RENOVACION' +
        ', CTC.TIPO_CUENTA||'#39'-'#39'||SUBSTR(CSC.CTA_CONTABLE,1,4)||'#39'-'#39'|| '
      '               SUBSTR(CSC.CTA_CONTABLE,5,7))     AS CTA_ORIGEN, '
      '               CRE.F_AUT_OPERACION               AS F_AUTORIZA, '
      
        '               CRE.F_VALOR_CRED + CRE.DIAS_PLAZO AS F_VENCIMIENT' +
        'O, '
      '               CRE.CVE_TASA_REFER                AS CVE_TASA, '
      
        '               CRE.OPERADOR_STASA                AS OPERADOR_STA' +
        'SA, '
      '               CRE.SOBRETASA                     AS SOBRETASA, '
      
        '               CCTO.IMP_AUTORIZADO               AS IMP_AUTORIZA' +
        'DO, '
      
        '               CRE.SDO_INSOLUTO                  AS SDO_VIG_TOTA' +
        'L, '
      
        '               '#39' '#39'                             AS CVE_FND_ENT_DE' +
        'S, '
      
        '               '#39' '#39'                             AS CVE_FND_PROGRA' +
        'MA,'
      
        '               0                                 AS PCT_REDESCON' +
        'TADO, '
      
        '               '#39' '#39'                             AS OPE_STASA_FND,' +
        ' '
      
        '               0                                 AS SOBRETASA_FN' +
        'D, '
      '               CCM.CVE_CAT_MIN                   AS CAT_MINIMO, '
      
        '               CCM.DESC_CAT_MIN                  AS DESC_CAT_MIN' +
        'IMO, '
      '               CTO.CVE_MONEDA                    AS CVE_MONEDA, '
      
        '               MON.DESC_MONEDA                   AS DESC_MONEDA,' +
        ' '
      '               NVL(CAC.CVE_GRUPO,'#39'---'#39')        AS CVE_GRUPO, '
      
        '               NVL(CGE.DESC_GRUPO,'#39'SIN GRUPO ECONOMICO'#39') AS DESC' +
        '_GPO, '
      '               CTO.ID_TITULAR                    AS TITULAR, '
      
        '               SUBSTR(PKGCRCONSOLIDADO.FUN_NOM_TIT_CRED(CTO.ID_T' +
        'ITULAR),1,80) AS NOMBRE, '
      
        '               CSB.CVE_SUB_TIP_BCO               AS SUB_TIP_BCO,' +
        ' '
      '               CRE.TIPO_DISPOSICION              AS TIPO_DISP, '
      '               CTC.TIPO_CUENTA                   AS TIPO_CTA, '
      
        '               CTO.ID_PERS_ASOCIAD               AS ID_PROM_ASOC' +
        ', '
      '               ASO.NOMBRE                        AS PROM_ASOC, '
      
        '               CRE.ID_PROM_ADM                   AS ID_PROM_ADM,' +
        ' '
      '               ADM.NOMBRE                        AS PROM_ADM, '
      
        '               CRP.CVE_PRESUPUESTO               AS CVE_MERC_OBJ' +
        ', '
      
        '               CRP.DESC_PRESUPUESTO              AS MERCADO_OBJ,' +
        ' '
      '               CAS.IMP_CAP_VIG                   AS VIGENTE_CP, '
      
        '               CAS.IMP_CAP_VDO_NE                AS NOEXIGIBLE_C' +
        'P, '
      
        '               CAS.IMP_CAP_IMP                   AS IMPAGADO_CP,' +
        ' '
      
        '               CAS.IMP_CAP_VDO_EX                AS EXIGIBLE_CP,' +
        ' '
      
        '               ( CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_' +
        'CAP_IMP + CAS.IMP_CAP_VDO_EX ) AS SDO_INSOLUTO, '
      '               CAS.IMP_INT_VIG                   AS VIGENTE_IN, '
      
        '               CAS.IMP_INT_IMP                   AS IMPAGADO_IN,' +
        ' '
      
        '               CAS.IMP_INT_VDO_EX                AS EXIGIBLE_IN,' +
        ' '
      '               CAS.IMP_CTAS_ORD                  AS CTA_ORD_IN, '
      '               0                                 AS MORATORIOS, '
      '               0                                 AS IMP_OTROS, '
      
        '               ( CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_' +
        'CAP_IMP + CAS.IMP_CAP_VDO_EX + '
      
        '                 CAS.IMP_INT_VIG + CAS.IMP_INT_IMP + CAS.IMP_INT' +
        '_VDO_EX + CAS.IMP_CTAS_ORD  ) AS TOT_ADEUDO, '
      
        '               (SELECT TASA_APLICADA FROM CRE_INTERES WHERE ID_C' +
        'REDITO = CAS.ID_CREDITO AND NUM_PERIODO = ( SELECT MAX(NUM_PERIO' +
        'DO) FROM CRE_INTERES WHERE ID_CREDITO =  '
      
        '                CAS.ID_CREDITO AND SIT_INTERES IN ('#39'AC'#39', '#39'IM'#39') )' +
        ' ) AS TASA_TOTAL, '
      '               0                                 AS VALOR_TASA, '
      
        '               0                                 AS TASA_FND_TOT' +
        ' '
      '              ,CCTO.ROE_BRUTA, '
      '               CCTO.ROE_NETA, '
      '               CCTO.PCT_REQ_CAP_MER, '
      '               CCTO.PCT_REQ_CAP_CRE, '
      '               CCTO.PCT_CAPITALIZ, '
      '               CCTO.IMP_INGRESOS_ACR, '
      '               CCTO.NO_CONSUL_BURO, '
      '               CCTO.F_AUT_COMITE, '
      
        '              (TRUNC(CCTO.F_AUT_COMITE) + CCTO.DIAS_PLAZO) AS F_' +
        'VENTO_AUTO, '
      '               CAC.NUM_EMPLEADOS, '
      '               CAC.CVE_SENICREB, '
      '               CSEN.DESC_SENICREB, '
      '               CLC.CVE_LOCAL_CNBV, '
      '               CLC.DESC_LOCAL_CNBV '
      '               ,NULL AS CVE_ANALISTA_RES '
      '               ,'#39'  '#39' AS STATUS '
      '        FROM CR_CON_ADEUDO_SDO   CAS, '
      '             CRE_CREDITO         CRE, '
      '             CONTRATO            CTO, '
      '             CRE_CLIENTE         CAC, '
      '             MONEDA              MON, '
      '             CRE_GRUPO_EMPR      CGE, '
      '             CRE_TIPO_CREDITO    CTC, '
      '             CRE_CAT_MINIMO      CCM, '
      '             CRE_CONTRATO        CCTO,'
      '             CRE_SUB_TIP_BCO     CSB, '
      '             CRE_SUB_TIP_CNBV    CSC, '
      '             CRE_GPO_INGRESO     CPG, '
      '             CRE_PRESUPUESTO     CRP, '
      '             PERSONA             ASO, '
      '             CRE_SENICREB        CSEN, '
      '             CRE_LOCAL_CNBV      CLC, '
      '             PERSONA             ADM '
      '       WHERE CTO.ID_EMPRESA = 2'
      '          AND CAS.F_CIERRE  = TO_DATE('#39'31/03/2010'#39','#39'DD/MM/YYYY'#39')'
      
        '         AND ( ( CSB.F_TRASPASO_ICRE IS NOT NULL AND CRE.SIT_CRE' +
        'DITO NOT IN ( '#39'TA'#39' ) ) '
      '              OR CSB.F_TRASPASO_ICRE IS NULL ) '
      '         AND CRE.ID_CREDITO       = CAS.ID_CREDITO '
      '         AND CCTO.ID_CONTRATO     = CRE.ID_CONTRATO '
      '         AND CSB.CVE_SUB_TIP_BCO  = CCTO.CVE_SUB_TIP_BCO '
      '         AND CCM.CVE_CAT_MIN      = CCTO.CVE_CAT_MIN '
      '         AND MON.CVE_MONEDA       = CTO.CVE_MONEDA '
      '         AND CTO.ID_CONTRATO      = CCTO.ID_CONTRATO '
      '         AND CAC.ID_PERSONA       = CTO.ID_TITULAR '
      '         AND CGE.CVE_GRUPO (+)    = CAC.CVE_GRUPO '
      '         AND CSB.CVE_SUB_TIP_CNBV = CSC.CVE_SUB_TIP_CNBV '
      '         AND CTC.CVE_TIPO_CREDITO = CSC.CVE_TIPO_CREDITO '
      '         AND CPG.CVE_GPO_INGRESO  = CRP.CVE_GPO_INGRESO '
      '         AND CRP.CVE_PRESUPUESTO  = CRE.CVE_PRESUPUESTO '
      '         AND CTO.ID_PERS_ASOCIAD  = ASO.ID_PERSONA(+) '
      '         AND CRE.ID_PROM_ADM      = ADM.ID_PERSONA(+) '
      '         AND CSEN.CVE_SENICREB   (+)= CAC.CVE_SENICREB '
      '         AND CLC.CVE_LOCAL_CNBV   (+)= CAC.CVE_LOCAL_CNBV '
      '  '#9'     AND CRE.SIT_CREDITO NOT IN ( '#39'TA'#39' ) '
      '  UNION ALL '
      '        SELECT CTO.ID_EMPRESA                    AS EMPRESA, '
      
        '               CPR.CVE_PRODUCTO_GPO              AS PRODUCTO_GPO' +
        ', '
      '               CCTO.ID_CONTRATO                  AS CONTRATO, '
      '               CRE.ID_CREDITO                    AS CREDITO, '
      '               CCTO.CVE_PRODUCTO_CRE             AS PRODUCTO, '
      '               CPR.DESC_L_PRODUCTO               AS DESC_PROD, '
      
        '               SUBSTR(PKGCRCONSOLIDADO.FUN_CR_CTASCONTAB( CTO.ID' +
        '_EMPRESA, CCTO.CVE_MONEDA, CCTO.CVE_PRODUCTO_CRE, '#39'CI'#39' ),1,30) C' +
        'TA_ORIGEN, '
      '               CRE.F_AUTORIZA                    AS F_AUTORIZA, '
      
        '               CRE.F_VENCIMIENTO                 AS F_VENCIMIENT' +
        'O, '
      '               CRE.CVE_TASA_REFER                AS CVE_TASA, '
      
        '               CRE.OPERADOR_STASA                AS OPERADOR_STA' +
        'SA, '
      '               CRE.SOBRETASA                     AS SOBRETASA, '
      '              ( CASE '
      
        '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_D' +
        'ES||CVE_FND_PROGRAMA)),0) '
      '  '#9#9'                FROM CR_FND_CREDITO '
      #9#9#9'       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '
      
        #9#9#9'     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) TH' +
        'EN CCTO.IMP_AUTORIZADO '
      '                ELSE 0 '
      '                END '
      '              ) IMP_AUTORIZADO, '
      
        '               NVL(CFN.SDO_VIG_TOTAL,0)          AS SDO_VIG_TOTA' +
        'L, '
      '               CFN.CVE_FND_ENT_DES, '
      '               CFN.CVE_FND_PROGRAMA, '
      
        '               NVL(PCT_REDESCONTADO,0)           AS PCT_REDESCON' +
        'TADO, '
      
        '               CFN.OPERADOR_STASA                AS OPE_STASA_FN' +
        'D, '
      
        '               CFN.SOBRETASA                     AS SOBRETASA_FN' +
        'D, '
      '               CCM.CVE_CAT_MINIMO                AS CAT_MINIMO, '
      
        '               CCM.DESC_CAT_MINIMO               AS DESC_CAT_MIN' +
        'IMO, '
      '               CCTO.CVE_MONEDA                   AS CVE_MONEDA, '
      
        '               MON.DESC_MONEDA                   AS DESC_MONEDA,' +
        ' '
      
        '               NVL(CAC.CVE_GRUPO_ECO,'#39'---'#39')        AS CVE_GRUPO,' +
        ' '
      
        '               NVL(CGE.DESC_GRUPO_ECO,'#39'SIN GRUPO ECONOMICO'#39') AS ' +
        'DESC_GPO, '
      '               CTO.ID_TITULAR                    AS TITULAR, '
      
        '               SUBSTR(PKGCRCONSOLIDADO.FUN_NOM_TIT_CRED(CTO.ID_T' +
        'ITULAR),1,80) NOMBRE, '
      
        '               CPS.CVE_SUB_TIP_BCO               AS SUB_TIP_BCO,' +
        ' '
      '               CRE.TIPO_DISPOSICION              AS TIPO_DISP, '
      '               CPR.CVE_TIPO_CRED_BC              AS TIPO_CTA, '
      
        '               CTO.ID_PERS_ASOCIAD               AS ID_PROM_ASOC' +
        ', '
      '               ASO.NOMBRE                        AS PROM_ASOC, '
      
        '               CRE.ID_PROM_ADM                   AS ID_PROM_ADM,' +
        ' '
      '               ADM.NOMBRE                        AS PROM_ADM, '
      
        '               CRP.CVE_PRESUPUESTO               AS CVE_MERC_OBJ' +
        ', '
      
        '               CRP.DESC_PRESUPUESTO              AS MERCADO_OBJ,' +
        ' '
      '              ( CASE '
      
        '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_D' +
        'ES||CVE_FND_PROGRAMA)),0) '
      '  '#9#9'                FROM CR_FND_CREDITO '
      #9#9#9'       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '
      
        #9#9#9'     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) TH' +
        'EN CAS.IMP_CAP_VIG '
      '                ELSE 0 '
      '                END '
      '               ) VIGENTE_CP, '
      '              ( CASE '
      
        '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_D' +
        'ES||CVE_FND_PROGRAMA)),0) '
      '  '#9#9'                FROM CR_FND_CREDITO '
      #9#9#9'       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '
      
        #9#9#9'     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) TH' +
        'EN CAS.IMP_CAP_VDO_NE '
      '                ELSE 0 '
      '                END '
      '               ) NOEXIGIBLE_CP, '
      '              ( CASE '
      
        '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_D' +
        'ES||CVE_FND_PROGRAMA)),0) '
      '  '#9#9'                FROM CR_FND_CREDITO '
      #9#9#9'       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '
      
        #9#9#9'     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) TH' +
        'EN CAS.IMP_CAP_IMP '
      '                ELSE 0 '
      '                END '
      '               ) IMPAGADO_CP, '
      '              ( CASE '
      
        '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_D' +
        'ES||CVE_FND_PROGRAMA)),0) '
      '  '#9#9'                FROM CR_FND_CREDITO '
      #9#9#9'       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '
      
        #9#9#9'     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) TH' +
        'EN CAS.IMP_CAP_VDO_EX '
      '                ELSE 0 '
      '                END '
      '               ) EXIGIBLE_CP, '
      '              ( CASE '
      
        '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_D' +
        'ES||CVE_FND_PROGRAMA)),0) '
      '  '#9#9'                FROM CR_FND_CREDITO '
      #9#9#9'       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '
      
        #9#9#9'     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) TH' +
        'EN CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.' +
        'IMP_CAP_VDO_EX '
      '                ELSE 0 '
      '                END '
      '               ) SDO_INSOLUTO, '
      '              ( CASE '
      
        '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_D' +
        'ES||CVE_FND_PROGRAMA)),0) '
      '  '#9#9'                FROM CR_FND_CREDITO '
      #9#9#9'       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '
      
        #9#9#9'     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) TH' +
        'EN CAS.IMP_INT_VIG '
      '                ELSE 0 '
      '                END '
      '               ) VIGENTE_IN, '
      '              ( CASE '
      
        '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_D' +
        'ES||CVE_FND_PROGRAMA)),0) '
      '  '#9#9'                FROM CR_FND_CREDITO '
      #9#9#9'       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '
      
        #9#9#9'     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) TH' +
        'EN CAS.IMP_INT_IMP '
      '                ELSE 0 '
      '                END '
      '               ) IMPAGADO_IN, '
      '              ( CASE '
      
        '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_D' +
        'ES||CVE_FND_PROGRAMA)),0) '
      '  '#9#9'                FROM CR_FND_CREDITO '
      #9#9#9'       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '
      
        #9#9#9'     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) TH' +
        'EN CAS.IMP_INT_VDO_EX '
      '                ELSE 0 '
      '                END '
      '               ) EXIGIBLE_IN, '
      '              ( CASE '
      
        '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_D' +
        'ES||CVE_FND_PROGRAMA)),0) '
      '  '#9#9'                FROM CR_FND_CREDITO '
      #9#9#9'       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '
      
        #9#9#9'     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) TH' +
        'EN CAS.IMP_CTAS_ORD '
      '                ELSE 0 '
      '                END '
      '               ) CTA_ORD_IN, '
      '               0                                 AS MORATORIOS, '
      '               0                                 AS IMP_OTROS, '
      '              ( CASE '
      
        '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_D' +
        'ES||CVE_FND_PROGRAMA)),0) '
      '  '#9#9'                FROM CR_FND_CREDITO '
      #9#9#9'       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '
      
        #9#9#9'     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) TH' +
        'EN CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.' +
        'IMP_CAP_VDO_EX + CAS.IMP_INT_VIG + CAS.IMP_INT_IMP + CAS.IMP_INT' +
        '_VDO_EX + CAS.IMP_CTAS_ORD '
      '                ELSE 0 '
      '                END '
      '               ) TOT_ADEUDO, '
      
        '               (SELECT TASA_APLICADA FROM CR_INTERES WHERE ID_CR' +
        'EDITO = CAS.ID_CREDITO AND NUM_PERIODO = ( SELECT MAX(NUM_PERIOD' +
        'O) FROM CR_INTERES WHERE ID_CREDITO =  '
      
        '                CAS.ID_CREDITO AND SIT_INTERES IN ('#39'AC'#39', '#39'IM'#39') )' +
        ' ) AS TASA_TOTAL, '
      '               0                                 AS VALOR_TASA, '
      
        '               (SELECT MAX(TASA_APLICADA) FROM CR_FND_INTERES WH' +
        'ERE ID_CREDITO = CAS.ID_CREDITO AND NUM_PERIODO = ( SELECT MAX(N' +
        'UM_PERIODO) FROM CR_FND_INTERES WHERE ID_CREDITO =  '
      
        '                CAS.ID_CREDITO AND SIT_INTERES IN ('#39'AC'#39', '#39'IM'#39') )' +
        ' ) AS TASA_FND_TOT '
      '              ,CCTO.ROE_BRUTA, '
      '               CCTO.ROE_NETA, '
      '               CCTO.PCT_REQ_CAP_MER, '
      '               CCTO.PCT_REQ_CAP_CRE, '
      '               CCTO.PCT_CAPITALIZ, '
      '               CCTO.IMP_INGRESOS_ACR, '
      '               CCTO.NO_CONSUL_BURO, '
      '               CCTO.F_AUT_COMITE, '
      '               CCTO.F_VENCIMIENTO AS F_VENTO_AUTO, '
      '               CAC.NUM_EMPLEADOS, '
      '               CAC.CVE_SENICREB, '
      '               CSEN.DESC_SENICREB, '
      '               CLC.CVE_LOCAL_CNBV, '
      '               CLC.DESC_LOCAL_CNBV '
      '               ,CCTO.CVE_ANALISTA_RES AS CVE_ANALISTA_RES '
      
        '                ,(SELECT  (CASE  WHEN COUNT(ID_ACREDITADO) = 0 T' +
        'HEN '#39'  '#39' '
      
        '                     WHEN COUNT(ID_ACREDITADO) > 0 THEN '#39'En Recu' +
        'peración'#39' '
      '                     ELSE '#39'CE'#39' '
      '                     END) AS Status_1  '
      
        '                FROM CR_ACRE_RE WHERE TO_DATE('#39'05/01/2011'#39','#39'DD/M' +
        'M/YYYY'#39') >= F_ALTA_RECU '
      
        '                AND (TO_DATE('#39'05/01/2011'#39','#39'DD/MM/YYYY'#39') <= F_BAJ' +
        'A_RECU OR F_BAJA_RECU IS NULL) '
      '                AND ID_ACREDITADO = CTO.ID_TITULAR) AS status '
      '        FROM CR_CON_ADEUDO_SDO   CAS, '
      '             CR_CREDITO          CRE, '
      '             CR_CONTRATO         CCTO, '
      '             CR_PRODUCTO         CPR, '
      '             CR_PROD_SUB_TIPO    CPS, '
      '             CR_FND_CREDITO      CFN, '
      '             CONTRATO            CTO, '
      '             CR_ACREDITADO       CAC, '
      '             MONEDA              MON, '
      '             CR_GRUPO_ECO        CGE, '
      '             CR_CAT_MINIMO       CCM, '
      '             CRE_PRESUPUESTO     CRP, '
      '             PERSONA             ASO, '
      '             CR_LOCAL_CNBV       CLC, '
      '             CRE_SENICREB        CSEN, '
      '             PERSONA             ADM '
      '        WHERE CTO.ID_EMPRESA = 2'
      
        '          AND CAS.F_CIERRE   = TO_DATE('#39'31/03/2010'#39','#39'DD/MM/YYYY'#39 +
        ')'
      '          AND CRE.ID_CREDITO         = CAS.ID_CREDITO '
      '          AND CCTO.ID_CONTRATO       = CRE.ID_CONTRATO '
      '          AND CPR.CVE_PRODUCTO_CRE   = CCTO.CVE_PRODUCTO_CRE '
      '          AND CFN.ID_CREDITO(+)      = CRE.ID_CREDITO '
      '          AND CCM.CVE_CAT_MINIMO     = CPR.CVE_CLAS_CONTAB '
      '          AND MON.CVE_MONEDA         = CCTO.CVE_MONEDA '
      '          AND CTO.ID_CONTRATO        = CCTO.ID_CONTRATO '
      '          AND CAC.ID_ACREDITADO      = CTO.ID_TITULAR '
      '          AND CGE.CVE_GRUPO_ECO (+)  = CAC.CVE_GRUPO_ECO '
      '          AND CPR.CVE_PRODUCTO_CRE   = CPS.CVE_PRODUCTO_CRE '
      '          AND CRP.CVE_PRESUPUESTO    = CPR.CVE_PRESUPUESTO '
      '          AND CTO.ID_PERS_ASOCIAD    = ASO.ID_PERSONA(+) '
      '          AND CRE.ID_PROM_ADM        = ADM.ID_PERSONA(+) '
      '          AND CPR.CVE_PRODUCTO_CRE    = CPS.CVE_PRODUCTO_CRE '
      '          AND CSEN.CVE_SENICREB   (+) = CAC.CVE_SENICREB '
      '          AND CLC.CVE_LOCAL_CNBV  (+) = CAC.CVE_LOCAL_CNBV '
      '      )DATOS '
      ' WHERE 1 = 1'
      ' ORDER BY CVE_MONEDA, CVE_GRUPO, NOMBRE, CONTRATO, CREDITO '
      ' '
      ' ')
    Left = 322
    Top = 20
    object qyConsAdeudoEMPRESA: TFloatField
      FieldName = 'EMPRESA'
    end
    object qyConsAdeudoPRODUCTO_GPO: TStringField
      FieldName = 'PRODUCTO_GPO'
      Size = 6
    end
    object qyConsAdeudoCONTRATO: TFloatField
      FieldName = 'CONTRATO'
    end
    object qyConsAdeudoCREDITO: TFloatField
      FieldName = 'CREDITO'
    end
    object qyConsAdeudoPRODUCTO: TStringField
      FieldName = 'PRODUCTO'
      Size = 6
    end
    object qyConsAdeudoDESC_PROD: TStringField
      FieldName = 'DESC_PROD'
      Size = 80
    end
    object qyConsAdeudoCTA_ORIGEN: TStringField
      FieldName = 'CTA_ORIGEN'
      Size = 30
    end
    object qyConsAdeudoF_AUTORIZA: TDateTimeField
      FieldName = 'F_AUTORIZA'
    end
    object qyConsAdeudoF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qyConsAdeudoCVE_TASA: TStringField
      FieldName = 'CVE_TASA'
      Size = 6
    end
    object qyConsAdeudoOPERADOR_STASA: TStringField
      FieldName = 'OPERADOR_STASA'
      Size = 1
    end
    object qyConsAdeudoSOBRETASA: TFloatField
      FieldName = 'SOBRETASA'
    end
    object qyConsAdeudoIMP_AUTORIZADO: TFloatField
      FieldName = 'IMP_AUTORIZADO'
    end
    object qyConsAdeudoSDO_VIG_TOTAL: TFloatField
      FieldName = 'SDO_VIG_TOTAL'
    end
    object qyConsAdeudoCVE_FND_ENT_DES: TStringField
      FieldName = 'CVE_FND_ENT_DES'
      Size = 10
    end
    object qyConsAdeudoPCT_REDESCONTADO: TFloatField
      FieldName = 'PCT_REDESCONTADO'
    end
    object qyConsAdeudoOPE_STASA_FND: TStringField
      FieldName = 'OPE_STASA_FND'
      Size = 1
    end
    object qyConsAdeudoSOBRETASA_FND: TFloatField
      FieldName = 'SOBRETASA_FND'
    end
    object qyConsAdeudoCAT_MINIMO: TStringField
      FieldName = 'CAT_MINIMO'
    end
    object qyConsAdeudoDESC_CAT_MINIMO: TStringField
      FieldName = 'DESC_CAT_MINIMO'
      Size = 250
    end
    object qyConsAdeudoCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qyConsAdeudoDESC_MONEDA: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object qyConsAdeudoCVE_GRUPO: TStringField
      FieldName = 'CVE_GRUPO'
      Size = 6
    end
    object qyConsAdeudoDESC_GPO: TStringField
      FieldName = 'DESC_GPO'
      Size = 250
    end
    object qyConsAdeudoTITULAR: TFloatField
      FieldName = 'TITULAR'
    end
    object qyConsAdeudoNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qyConsAdeudoSUB_TIP_BCO: TFloatField
      FieldName = 'SUB_TIP_BCO'
    end
    object qyConsAdeudoTIPO_DISP: TStringField
      FieldName = 'TIPO_DISP'
      Size = 2
    end
    object qyConsAdeudoTIPO_CTA: TFloatField
      FieldName = 'TIPO_CTA'
    end
    object qyConsAdeudoID_PROM_ASOC: TFloatField
      FieldName = 'ID_PROM_ASOC'
    end
    object qyConsAdeudoPROM_ASOC: TStringField
      FieldName = 'PROM_ASOC'
      Size = 80
    end
    object qyConsAdeudoID_PROM_ADM: TFloatField
      FieldName = 'ID_PROM_ADM'
    end
    object qyConsAdeudoPROM_ADM: TStringField
      FieldName = 'PROM_ADM'
      Size = 80
    end
    object qyConsAdeudoCVE_MERC_OBJ: TStringField
      FieldName = 'CVE_MERC_OBJ'
      Size = 6
    end
    object qyConsAdeudoMERCADO_OBJ: TStringField
      FieldName = 'MERCADO_OBJ'
      Size = 40
    end
    object qyConsAdeudoVIGENTE_CP: TFloatField
      FieldName = 'VIGENTE_CP'
    end
    object qyConsAdeudoNOEXIGIBLE_CP: TFloatField
      FieldName = 'NOEXIGIBLE_CP'
    end
    object qyConsAdeudoIMPAGADO_CP: TFloatField
      FieldName = 'IMPAGADO_CP'
    end
    object qyConsAdeudoEXIGIBLE_CP: TFloatField
      FieldName = 'EXIGIBLE_CP'
    end
    object qyConsAdeudoSDO_INSOLUTO: TFloatField
      FieldName = 'SDO_INSOLUTO'
    end
    object qyConsAdeudoVIGENTE_IN: TFloatField
      FieldName = 'VIGENTE_IN'
    end
    object qyConsAdeudoIMPAGADO_IN: TFloatField
      FieldName = 'IMPAGADO_IN'
    end
    object qyConsAdeudoEXIGIBLE_IN: TFloatField
      FieldName = 'EXIGIBLE_IN'
    end
    object qyConsAdeudoCTA_ORD_IN: TFloatField
      FieldName = 'CTA_ORD_IN'
    end
    object qyConsAdeudoMORATORIOS: TFloatField
      FieldName = 'MORATORIOS'
    end
    object qyConsAdeudoIMP_OTROS: TFloatField
      FieldName = 'IMP_OTROS'
    end
    object qyConsAdeudoTOT_ADEUDO: TFloatField
      FieldName = 'TOT_ADEUDO'
    end
    object qyConsAdeudoTASA_TOTAL: TFloatField
      FieldName = 'TASA_TOTAL'
    end
    object qyConsAdeudoVALOR_TASA: TFloatField
      FieldName = 'VALOR_TASA'
    end
    object qyConsAdeudoTASA_FND_TOT: TFloatField
      FieldName = 'TASA_FND_TOT'
    end
    object qyConsAdeudoROE_BRUTA: TFloatField
      FieldName = 'ROE_BRUTA'
    end
    object qyConsAdeudoROE_NETA: TFloatField
      FieldName = 'ROE_NETA'
    end
    object qyConsAdeudoPCT_REQ_CAP_MER: TFloatField
      FieldName = 'PCT_REQ_CAP_MER'
    end
    object qyConsAdeudoPCT_REQ_CAP_CRE: TFloatField
      FieldName = 'PCT_REQ_CAP_CRE'
    end
    object qyConsAdeudoPCT_CAPITALIZ: TFloatField
      FieldName = 'PCT_CAPITALIZ'
    end
    object qyConsAdeudoIMP_INGRESOS_ACR: TFloatField
      FieldName = 'IMP_INGRESOS_ACR'
    end
    object qyConsAdeudoNO_CONSUL_BURO: TFloatField
      FieldName = 'NO_CONSUL_BURO'
    end
    object qyConsAdeudoF_AUT_COMITE: TDateTimeField
      FieldName = 'F_AUT_COMITE'
    end
    object qyConsAdeudoF_VENTO_AUTO: TDateTimeField
      FieldName = 'F_VENTO_AUTO'
    end
    object qyConsAdeudoNUM_EMPLEADOS: TFloatField
      FieldName = 'NUM_EMPLEADOS'
    end
    object qyConsAdeudoCVE_SENICREB: TStringField
      FieldName = 'CVE_SENICREB'
      Size = 11
    end
    object qyConsAdeudoDESC_SENICREB: TStringField
      FieldName = 'DESC_SENICREB'
      Size = 100
    end
    object qyConsAdeudoCVE_LOCAL_CNBV: TStringField
      FieldName = 'CVE_LOCAL_CNBV'
      Size = 12
    end
    object qyConsAdeudoDESC_LOCAL_CNBV: TStringField
      FieldName = 'DESC_LOCAL_CNBV'
      Size = 120
    end
    object qyConsAdeudoCVE_ANALISTA_RES: TStringField
      FieldName = 'CVE_ANALISTA_RES'
      Size = 10
    end
    object qyConsAdeudoCVE_FND_PROGRAMA: TStringField
      FieldName = 'CVE_FND_PROGRAMA'
      Size = 10
    end
    object qyConsAdeudoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 15
    end
  end
end
