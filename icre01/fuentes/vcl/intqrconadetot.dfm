object QrConAdeTot: TQrConAdeTot
  Left = 0
  Top = 0
  Width = 1267
  Height = 979
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
    101.6
    2159
    101.6
    2794
    101.6
    101.6
    0)
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = First
  PrintIfEmpty = True
  SnapToGrid = True
  Units = Inches
  Zoom = 120
  object ColumnHeaderBand1: TQRBand
    Left = 46
    Top = 147
    Width = 1175
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
      70.5555555555556
      2590.71180555556)
    BandType = rbColumnHeader
    object QRShape4: TQRShape
      Left = 1039
      Top = -1
      Width = 74
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        67.3484848484849
        2289.84848484848
        -1.20265151515152
        163.560606060606)
      Shape = qrsRectangle
    end
    object QRShape3: TQRShape
      Left = 892
      Top = -1
      Width = 74
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        67.3484848484849
        1966.33522727273
        -1.20265151515152
        162.357954545455)
      Shape = qrsRectangle
    end
    object QRShape13: TQRShape
      Left = 965
      Top = -1
      Width = 74
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        67.3484848484849
        2128.69318181818
        -1.20265151515152
        162.357954545455)
      Shape = qrsRectangle
    end
    object QRShape5: TQRShape
      Left = 378
      Top = 20
      Width = 74
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        833.4375
        44.0972222222222
        163.159722222222)
      Shape = qrsRectangle
    end
    object QRShape5GVL: TQRShape
      Left = 147
      Top = -1
      Width = 27
      Height = 31
      Frame.Color = clBlue
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.0357142857143
        323.169642857143
        -1.88988095238095
        59.53125)
      Shape = qrsRectangle
    end
    object QRShape2: TQRShape
      Left = 173
      Top = -1
      Width = 60
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.0357142857143
        381.755952380952
        -1.88988095238095
        131.346726190476)
      Shape = qrsRectangle
    end
    object QRSHPTChequera: TQRShape
      Left = 0
      Top = -1
      Width = 42
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.0357142857143
        0.944940476190476
        -1.88988095238095
        92.6041666666667)
      Shape = qrsRectangle
    end
    object QRShape1: TQRShape
      Left = 451
      Top = 20
      Width = 75
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        994.833333333333
        44.0972222222222
        164.923611111111)
      Shape = qrsRectangle
    end
    object QRShape18: TQRShape
      Left = 674
      Top = 10
      Width = 146
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        1485.19444444444
        22.9305555555556
        321.027777777778)
      Shape = qrsRectangle
    end
    object QRShape20: TQRShape
      Left = 305
      Top = 20
      Width = 74
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        672.041666666667
        44.0972222222222
        162.277777777778)
      Shape = qrsRectangle
    end
    object QRShape32: TQRShape
      Left = 819
      Top = -1
      Width = 74
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        67.3484848484849
        1805.17992424242
        -1.20265151515152
        162.357954545455)
      Shape = qrsRectangle
    end
    object QRShape31: TQRShape
      Left = 42
      Top = -1
      Width = 131
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.5511363636364
        92.6041666666667
        -2.40530303030303
        289.839015151515)
      Shape = qrsRectangle
    end
    object QRLabel17: TQRLabel
      Left = 61
      Top = 6
      Width = 93
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.282196969697
        134.69696969697
        13.2291666666667
        205.653409090909)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tipo de Credito'
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
      Left = 232
      Top = 0
      Width = 294
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        24.6944444444444
        512.409722222222
        -0.881944444444444
        647.347222222222)
      Shape = qrsRectangle
    end
    object QRLabel18: TQRLabel
      Left = 183
      Top = 6
      Width = 39
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        36.8526785714286
        403.489583333333
        14.1741071428571
        86.9345238095238)
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
    object QRLabel13: TQRLabel
      Left = 5
      Top = 6
      Width = 33
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.9077380952381
        11.3392857142857
        14.1741071428571
        71.8154761904762)
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
    object QRLabel8: TQRLabel
      Left = 328
      Top = 1
      Width = 104
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        722.3125
        2.64583333333333
        230.1875)
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
    object QRLabel1: TQRLabel
      Left = 832
      Top = 3
      Width = 43
      Height = 24
      Frame.Color = clRed
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1834.88541666667
        6.61458333333333
        93.9270833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Riesgo Ejercido'
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
      Left = 232
      Top = 10
      Width = 146
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        512.409722222222
        22.9305555555556
        321.909722222222)
      Shape = qrsRectangle
    end
    object QRLabel11: TQRLabel
      Left = 264
      Top = 12
      Width = 82
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        582.083333333333
        26.4583333333333
        179.916666666667)
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
      Left = 232
      Top = 20
      Width = 73
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        512.409722222222
        44.0972222222222
        160.513888888889)
      Shape = qrsRectangle
    end
    object QRLabel12: TQRLabel
      Left = 251
      Top = 22
      Width = 36
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        552.979166666667
        47.625
        79.375)
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
      Left = 526
      Top = 20
      Width = 73
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        1158.875
        44.0972222222222
        161.395833333333)
      Shape = qrsRectangle
    end
    object QRLabel14: TQRLabel
      Left = 322
      Top = 22
      Width = 41
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        709.083333333333
        47.625
        89.9583333333333)
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
    object QRShape14: TQRShape
      Left = 598
      Top = 20
      Width = 76
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        1319.38888888889
        44.0972222222222
        166.6875)
      Shape = qrsRectangle
    end
    object QRLabel15: TQRLabel
      Left = 470
      Top = 22
      Width = 36
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1037.16666666667
        47.625
        79.375)
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
      Left = 396
      Top = 22
      Width = 38
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        873.125
        47.625
        84.6666666666667)
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
      Left = 378
      Top = 10
      Width = 148
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        833.4375
        22.9305555555556
        326.319444444444)
      Shape = qrsRectangle
    end
    object QRLabel19: TQRLabel
      Left = 712
      Top = 12
      Width = 70
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1568.97916666667
        26.4583333333333
        153.458333333333)
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
      Left = 526
      Top = 10
      Width = 148
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        1158.875
        22.9305555555556
        327.201388888889)
      Shape = qrsRectangle
    end
    object QRShape19: TQRShape
      Left = 746
      Top = 20
      Width = 74
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        1643.94444444444
        44.0972222222222
        162.277777777778)
      Shape = qrsRectangle
    end
    object QRShape22: TQRShape
      Left = 674
      Top = 20
      Width = 72
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.0486111111111
        1485.19444444444
        44.0972222222222
        159.631944444444)
      Shape = qrsRectangle
    end
    object QRShape23: TQRShape
      Left = 526
      Top = 0
      Width = 294
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        24.6944444444444
        1158.875
        -0.881944444444444
        647.347222222222)
      Shape = qrsRectangle
    end
    object QRLabel20: TQRLabel
      Left = 618
      Top = 1
      Width = 109
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1362.60416666667
        2.64583333333333
        240.770833333333)
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
      Left = 570
      Top = 12
      Width = 59
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1256.77083333333
        26.4583333333333
        129.645833333333)
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
      Tag = 161
      Left = 410
      Top = 12
      Width = 83
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        904.875
        26.4583333333333
        182.5625)
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
      Left = 532
      Top = 21
      Width = 61
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        16.7569444444444
        1172.10416666667
        46.7430555555556
        134.055555555556)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Devengado No Exigible'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -4
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 3
    end
    object QRLabel26: TQRLabel
      Left = 617
      Top = 21
      Width = 38
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1360.84027777778
        45.8611111111111
        83.7847222222222)
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
      Left = 762
      Top = 21
      Width = 40
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1680.98611111111
        45.8611111111111
        88.1944444444444)
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
    object QRLabel29: TQRLabel
      Left = 692
      Top = 21
      Width = 34
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1526.64583333333
        45.8611111111111
        75.8472222222222)
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
    object QRLabel3: TQRLabel
      Left = 969
      Top = 3
      Width = 65
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2137.11174242424
        6.01325757575758
        144.318181818182)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Importe Disponible (Linea)'
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
    object QRLabel5: TQRLabel
      Left = 1049
      Top = 3
      Width = 54
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2312.69886363636
        6.01325757575758
        119.0625)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Riesgo Acumulado'
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
    object QRLabel6: TQRLabel
      Left = 903
      Top = 3
      Width = 50
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1991.59090909091
        6.01325757575758
        110.643939393939)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Riesgo Contingente (CCI)'
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
      Left = 1112
      Top = -1
      Width = 49
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        67.7994791666667
        2452.35677083333
        -1.65364583333333
        107.486979166667)
      Shape = qrsRectangle
    end
    object QRLabel4: TQRLabel
      Left = 1112
      Top = 3
      Width = 49
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2452.35677083333
        6.61458333333333
        107.486979166667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Fecha de Vencimiento'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
  end
  object QRBDetalle: TQRBand
    Left = 46
    Top = 223
    Width = 1175
    Height = 11
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBDetalleBeforePrint
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
      24.2534722222222
      2590.71180555556)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 1
      Top = 1
      Width = 39
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.953869047619
        2.83482142857143
        2.83482142857143
        85.0446428571429)
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
    object QRDBText4: TQRDBText
      Left = 41
      Top = 1
      Width = 131
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.0397727272727
        90.1988636363636
        2.40530303030303
        289.839015151515)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'DESC_PRODUCTO'
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
      Left = 173
      Top = 1
      Width = 59
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        381.881944444444
        2.64583333333333
        129.645833333333)
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
      Left = 254
      Top = 1
      Width = 51
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        560.034722222222
        2.64583333333333
        112.888888888889)
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
      Left = 327
      Top = 1
      Width = 51
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.953869047619
        721.934523809524
        2.83482142857143
        112.447916666667)
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
      Left = 401
      Top = 1
      Width = 51
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.953869047619
        884.464285714286
        2.83482142857143
        112.447916666667)
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
      Left = 475
      Top = 1
      Width = 50
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1047.75
        2.64583333333333
        111.125)
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
    object QRDBText22: TQRDBText
      Left = 695
      Top = 1
      Width = 52
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1531.9375
        2.64583333333333
        113.770833333333)
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
      Left = 623
      Top = 1
      Width = 51
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.953869047619
        1372.99851190476
        2.83482142857143
        112.447916666667)
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
      Left = 548
      Top = 1
      Width = 51
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1209.14583333333
        2.64583333333333
        112.888888888889)
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
    object QRDBText28: TQRDBText
      Left = 842
      Top = 1
      Width = 52
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1857.375
        2.64583333333333
        113.770833333333)
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
    object QRDBText32: TQRDBText
      Left = 768
      Top = 1
      Width = 50
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1693.33333333333
        2.64583333333333
        111.125)
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
    object QRDBText5: TQRDBText
      Left = 987
      Top = 1
      Width = 52
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        2176.19791666667
        2.64583333333333
        113.770833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'DISP_LINEA'
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
    object QRExpAcreRiesgoAcum: TQRExpr
      Left = 1063
      Top = 2
      Width = 50
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.1901041666667
        2344.86979166667
        3.30729166666667
        110.794270833333)
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
      Expression = 
        'qyConsAdeudo.TOT_ADEUDO + qyConsAdeudo.DISP_LINEA + qyConsAdeudo' +
        '.IMP_CONTINGENTE'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRDBText6: TQRDBText
      Left = 915
      Top = 2
      Width = 50
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.0397727272727
        2018.04924242424
        3.60795454545455
        110.643939393939)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qyConsAdeudo
      DataField = 'IMP_CONTINGENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRDBText3: TQRDBText
      Left = 1116
      Top = 0
      Width = 44
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.1901041666667
        2460.625
        0
        97.5651041666667)
      Alignment = taRightJustify
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
      Mask = 'dd/mmm/yyyy'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
  end
  object QRFooterAcreditado: TQRBand
    Left = 46
    Top = 234
    Width = 1175
    Height = 13
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
    LinkBand = QRGAcreditado
    Size.Values = (
      28.6631944444444
      2590.71180555556)
    BandType = rbGroupFooter
    object QRLabel23: TQRLabel
      Left = 36
      Top = 0
      Width = 65
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        79.375
        0
        143.315972222222)
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
    object QRExprAcreditado_Suma_CapVigVig: TQRExpr
      Left = 250
      Top = 3
      Width = 56
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.7413194444444
        550.112847222222
        5.51215277777778
        123.472222222222)
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
    object QRExprAcreditado_Suma_CapVigImp: TQRExpr
      Left = 323
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.953869047619
        711.540178571429
        4.72470238095238
        123.787202380952)
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
    object QRExpAcreditado_Suma_CapVenExi: TQRExpr
      Left = 396
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        874.006944444444
        4.40972222222222
        123.472222222222)
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
    object QRExpAcreditado_Suma_CapVenNoExi: TQRExpr
      Left = 470
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1037.16666666667
        4.40972222222222
        123.472222222222)
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
    object QRExpAcreditado_Suma_IntVenOrd: TQRExpr
      Left = 763
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.953869047619
        1682.93898809524
        3.77976190476191
        123.787202380952)
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
    object QRExpAcreditado_Suma_IntVenExi: TQRExpr
      Left = 690
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1521.35416666667
        5.29166666666667
        124.354166666667)
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
    object QRExpAcreditado_Suma_IntVigImp: TQRExpr
      Left = 618
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1362.60416666667
        4.40972222222222
        123.472222222222)
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
    object QRExpAcreditado_Suma_IntVigDev: TQRExpr
      Left = 544
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1198.5625
        5.29166666666667
        123.472222222222)
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
    object QRExpAcreditado_Suma_AdeudoTot: TQRExpr
      Left = 838
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1846.79166666667
        4.40972222222222
        123.472222222222)
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
    object QRExpAcreditado_Suma_ImporteDisp: TQRExpr
      Left = 983
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        2166.9375
        5.29166666666667
        124.354166666667)
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
      Expression = 'SUM(qyConsAdeudo.DISP_LINEA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpAcreditado_Suma_Contingente: TQRExpr
      Left = 909
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.0397727272727
        2003.61742424242
        4.81060606060606
        123.873106060606)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.IMP_CONTINGENTE)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExprSumTotAcreditado: TQRExpr
      Left = 172
      Top = 2
      Width = 60
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        380.118055555556
        5.29166666666667
        132.291666666667)
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
      Master = Owner
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.IMP_AUTORIZADO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpAcreditado_Suma_RiesgoAcum: TQRExpr
      Left = 1058
      Top = 2
      Width = 56
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2331.640625
        4.9609375
        124.0234375)
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
      Transparent = False
      WordWrap = True
      Expression = 
        'sum(qyConsAdeudo.TOT_ADEUDO + qyConsAdeudo.DISP_LINEA  + qyConsA' +
        'deudo.IMP_CONTINGENTE)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
  end
  object QRBand2: TQRBand
    Left = 46
    Top = 46
    Width = 1175
    Height = 101
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
      222.690972222222
      2590.71180555556)
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
        222.690972222222
        0
        0
        2590.71180555556)
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
    Left = 46
    Top = 261
    Width = 1175
    Height = 13
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
    LinkBand = QRGMoneda
    Size.Values = (
      28.6631944444444
      2590.71180555556)
    BandType = rbGroupFooter
    object QRLabel28: TQRLabel
      Left = 12
      Top = 0
      Width = 52
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        26.4583333333333
        0
        114.652777777778)
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
    object QRExpMoneda_Suma_ImporteDisp: TQRExpr
      Left = 983
      Top = 2
      Width = 56
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2168.26041666667
        5.29166666666667
        124.354166666667)
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
      Expression = 'SUM(qyConsAdeudo.DISP_LINEA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpMoneda_Suma_AdeudoTot: TQRExpr
      Left = 837
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.953869047619
        1846.41369047619
        4.72470238095238
        123.787202380952)
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
    object QRExpMoneda_Suma_IntVenExi: TQRExpr
      Left = 691
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1524
        5.29166666666667
        124.354166666667)
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
    object QRExpMoneda_Suma_IntVigImp: TQRExpr
      Left = 618
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1362.60416666667
        4.40972222222222
        123.472222222222)
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
    object QRExpMoneda_Suma_IntVigDev: TQRExpr
      Left = 544
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1198.5625
        5.29166666666667
        124.354166666667)
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
    object QRExpMoneda_Suma_CapVenNoExi: TQRExpr
      Left = 470
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1037.16666666667
        4.40972222222222
        123.472222222222)
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
    object QRExpMoneda_Suma_CapVenExi: TQRExpr
      Left = 397
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        875.770833333333
        4.40972222222222
        123.472222222222)
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
    object QRExpMoneda_Suma_CapVigImp: TQRExpr
      Left = 323
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.953869047619
        711.540178571429
        4.72470238095238
        123.787202380952)
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
    object QRExpMoneda_Suma_CapVigVig: TQRExpr
      Left = 250
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        551.215277777778
        4.40972222222222
        123.472222222222)
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
    object QRExpMoneda_Suma_IntVenOrd: TQRExpr
      Left = 764
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1685.39583333333
        5.29166666666667
        124.354166666667)
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
    object QRExpMoneda_Suma_Contingente: TQRExpr
      Left = 909
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.0397727272727
        2003.61742424242
        4.81060606060606
        123.873106060606)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.IMP_CONTINGENTE)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRESumTotMoneda: TQRExpr
      Left = 173
      Top = 2
      Width = 60
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        381
        4.40972222222222
        132.291666666667)
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
      Master = Owner
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.IMP_AUTORIZADO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpMoneda_Suma_RiesgoAcum: TQRExpr
      Left = 1058
      Top = 1
      Width = 56
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2331.640625
        1.65364583333333
        124.0234375)
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
      Transparent = False
      WordWrap = True
      Expression = 
        'sum(qyConsAdeudo.TOT_ADEUDO + qyConsAdeudo.DISP_LINEA  + qyConsA' +
        'deudo.IMP_CONTINGENTE)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
  end
  object qrgrpFooterGpoEconomico: TQRBand
    Left = 46
    Top = 247
    Width = 1175
    Height = 14
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
    LinkBand = QRGGrpEconomico
    Size.Values = (
      30.8680555555556
      2590.71180555556)
    BandType = rbGroupFooter
    object QRLabel36: TQRLabel
      Left = 24
      Top = 0
      Width = 104
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        52.9166666666667
        0
        229.305555555556)
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
    object QRExpEconomico_Suma_ImporteDisp: TQRExpr
      Left = 983
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        2166.9375
        5.29166666666667
        124.354166666667)
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
      Expression = 'SUM(qyConsAdeudo.DISP_LINEA)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpEconomico_Suma_AdeudoTot: TQRExpr
      Left = 837
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.953869047619
        1846.41369047619
        4.72470238095238
        123.787202380952)
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
    object QRExpEconomico_Suma_IntVenExi: TQRExpr
      Left = 690
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1522.23611111111
        4.40972222222222
        123.472222222222)
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
    object QRExpEconomico_Suma_IntVigImp: TQRExpr
      Left = 618
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1362.60416666667
        5.29166666666667
        123.472222222222)
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
    object QRExpEconomico_Suma_IntVigDev: TQRExpr
      Left = 544
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1199.44444444444
        3.52777777777778
        123.472222222222)
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
    object QRExpEconomico_Suma_CapVenNoExi: TQRExpr
      Left = 470
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        1037.16666666667
        4.40972222222222
        123.472222222222)
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
    object QRExpEconomico_Suma_CapVenExi: TQRExpr
      Left = 397
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        874.888888888889
        4.40972222222222
        123.472222222222)
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
    object QRExpEconomico_Suma_CapVigImp: TQRExpr
      Left = 323
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.953869047619
        711.540178571429
        4.72470238095238
        123.787202380952)
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
    object QRExpEconomico_Suma_CapVigVig: TQRExpr
      Left = 250
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        550.112847222222
        4.40972222222222
        123.472222222222)
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
    object QRExpEconomico_Suma_IntVenOrd: TQRExpr
      Left = 764
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.953869047619
        1683.88392857143
        4.72470238095238
        123.787202380952)
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
    object QRExpEconomico_Suma_Contingente: TQRExpr
      Left = 909
      Top = 2
      Width = 56
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.0397727272727
        2003.61742424242
        3.60795454545455
        123.873106060606)
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
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.IMP_CONTINGENTE)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpSumToTGrpEconomico: TQRExpr
      Left = 172
      Top = 2
      Width = 60
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        35.2777777777778
        380.118055555556
        4.40972222222222
        132.291666666667)
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
      Master = Owner
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(qyConsAdeudo.IMP_AUTORIZADO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
    object QRExpEconomico_Suma_RiesgoAcum: TQRExpr
      Left = 1058
      Top = 1
      Width = 56
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        2331.640625
        1.65364583333333
        124.0234375)
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
      Transparent = False
      WordWrap = True
      Expression = 
        'sum(qyConsAdeudo.TOT_ADEUDO + qyConsAdeudo.DISP_LINEA  + qyConsA' +
        'deudo.IMP_CONTINGENTE)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 4
    end
  end
  object QRGroupContador: TQRGroup
    Left = 46
    Top = 179
    Width = 1175
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
      4.40972222222222
      2590.71180555556)
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGMoneda: TQRGroup
    Left = 46
    Top = 181
    Width = 1175
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRGMonedaBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      30.8680555555556
      2590.71180555556)
    Expression = 'qyConsAdeudo.CVE_MONEDA'
    FooterBand = qrgrpFooterMoneda
    Master = Owner
    ReprintOnNewPage = False
    object QRSHPMoneda: TQRShape
      Left = 5
      Top = 2
      Width = 731
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        28.2222222222222
        10.5833333333333
        3.52777777777778
        1611.3125)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel46: TQRLabel
      Left = 6
      Top = 2
      Width = 31
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        24.2534722222222
        13.2291666666667
        4.40972222222222
        68.3506944444444)
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
      Left = 49
      Top = 3
      Width = 47
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        107.486979166667
        6.61458333333333
        102.526041666667)
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
      Left = 102
      Top = 2
      Width = 66
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        24.2534722222222
        224.895833333333
        4.40972222222222
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
    object QRLTipoCambio: TQRLabel
      Left = 286
      Top = 3
      Width = 50
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        630.590277777778
        6.61458333333333
        110.243055555556)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTipoCambio'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRLabel7: TQRLabel
      Left = 211
      Top = 3
      Width = 71
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        465.225694444444
        6.61458333333333
        156.545138888889)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Tipo de Cambio:'
      Color = clSilver
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
  object QRGGrpEconomico: TQRGroup
    Left = 46
    Top = 195
    Width = 1175
    Height = 14
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
      30.8680555555556
      2590.71180555556)
    Expression = 'qyConsAdeudo.CVE_GRUPO'
    FooterBand = qrgrpFooterGpoEconomico
    Master = Owner
    ReprintOnNewPage = False
    object QRSHPSector: TQRShape
      Left = 16
      Top = 1
      Width = 731
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        24.5684523809524
        34.9627976190476
        2.83482142857143
        1611.12351190476)
      Shape = qrsRectangle
    end
    object QRLabel52: TQRLabel
      Left = 24
      Top = 1
      Width = 76
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        24.2534722222222
        52.9166666666667
        2.20486111111111
        167.569444444444)
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
      Left = 120
      Top = 1
      Width = 54
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        24.2534722222222
        264.583333333333
        2.20486111111111
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
      Left = 180
      Top = 1
      Width = 48
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        24.2534722222222
        396.875
        2.20486111111111
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
  object QRGAcreditado: TQRGroup
    Left = 46
    Top = 209
    Width = 1175
    Height = 14
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
      30.8680555555556
      2590.71180555556)
    Expression = 'qyConsAdeudo.TITULAR'
    FooterBand = QRFooterAcreditado
    Master = Owner
    ReprintOnNewPage = False
    object QRSHPOrigen: TQRShape
      Left = 33
      Top = 1
      Width = 731
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        24.5684523809524
        71.8154761904762
        2.83482142857143
        1611.12351190476)
      Shape = qrsRectangle
    end
    object QRLabel2: TQRLabel
      Left = 42
      Top = 1
      Width = 50
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        24.2534722222222
        92.6041666666667
        2.20486111111111
        110.243055555556)
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
      Left = 96
      Top = 1
      Width = 37
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        24.2534722222222
        211.666666666667
        2.20486111111111
        81.5798611111111)
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
      Left = 586
      Top = 3
      Width = 32
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        19.84375
        1292.04861111111
        6.61458333333333
        70.5555555555556)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
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
    Left = 46
    Top = 274
    Width = 1175
    Height = 10
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
      22.0486111111111
      2590.71180555556)
    BandType = rbSummary
    object QRLabel37: TQRLabel
      Left = 0
      Top = 0
      Width = 53
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.4583333333333
        0
        0
        116.857638888889)
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
    object QRLTot_ImpAut: TQRLabel
      Left = 160
      Top = 1
      Width = 73
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        352.777777777778
        3.30729166666667
        159.852430555556)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_ImpAut'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRLTot_CapViVi: TQRLabel
      Left = 234
      Top = 1
      Width = 73
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        514.835069444444
        3.30729166666667
        159.852430555556)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_CapViVi'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRLTot_CapViIm: TQRLabel
      Left = 307
      Top = 1
      Width = 72
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.953869047619
        676.577380952381
        2.83482142857143
        159.69494047619)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_CapViVi'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRLTot_CapVeEx: TQRLabel
      Left = 381
      Top = 1
      Width = 73
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        17.6388888888889
        839.31712962963
        2.93981481481481
        160.219907407407)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_CapVeEx'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRLTot_CapVeNEx: TQRLabel
      Left = 454
      Top = 1
      Width = 72
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1000.125
        2.64583333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_CapVeNEx'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRLTot_IntViDe: TQRLabel
      Left = 528
      Top = 1
      Width = 72
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1164.16666666667
        2.64583333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_IntViDe'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRLTot_IntViIm: TQRLabel
      Left = 601
      Top = 1
      Width = 72
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1325.5625
        2.64583333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_IntViIm'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRLTot_IntVeEx: TQRLabel
      Left = 674
      Top = 1
      Width = 72
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1486.95833333333
        2.64583333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_IntViIm'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRLTot_IntVeOr: TQRLabel
      Left = 749
      Top = 1
      Width = 72
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1651
        2.64583333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_IntVeOr'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRLTot_AdTo: TQRLabel
      Left = 821
      Top = 1
      Width = 72
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1811.07291666667
        2.64583333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_AdTo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRLTot_LiDi: TQRLabel
      Left = 968
      Top = 1
      Width = 72
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        2135.1875
        2.64583333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_LiDi'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRLTot_RiAc: TQRLabel
      Left = 1042
      Top = 1
      Width = 72
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        2296.58333333333
        2.64583333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_RiAc'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
    object QRLTot_ImCo: TQRLabel
      Left = 894
      Top = 1
      Width = 72
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        18.5208333333333
        1971.14583333333
        2.64583333333333
        158.75)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLTot_ImCo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 4
    end
  end
  object qyConsAdeudo: TQuery
    AutoCalcFields = False
    DatabaseName = 'RCORP'
    SessionName = 'Default'
    SQL.Strings = (
      
        'SELECT cve_moneda, desc_moneda, cve_grupo, desc_gpo, titular, co' +
        'ntrato, '
      
        '       cve_producto, desc_producto,F_VENCIMIENTO, nombre, imp_au' +
        'torizado, vigente_cp, '
      
        '       impagado_cp, exigible_cp, noexigible_cp, vigente_in, impa' +
        'gado_in, '
      '       exigible_in, cta_ord_in, tot_adeudo, '
      
        '       (pkgcrsaldos.stpobtdisponibleaut (contrato, 1) - imp_cont' +
        'ingente '
      '       ) disp_linea, '
      '       imp_contingente '
      
        '  FROM (SELECT   cve_moneda, desc_moneda, cve_grupo, desc_gpo, t' +
        'itular, '
      
        '                 contrato, cve_producto, desc_producto, F_VENCIM' +
        'IENTO,nombre, '
      
        '                 imp_autorizado, SUM (vigente_cp) AS vigente_cp,' +
        ' '
      '                 SUM (impagado_cp) AS impagado_cp, '
      '                 SUM (exigible_cp) AS exigible_cp, '
      '                 SUM (noexigible_cp) AS noexigible_cp, '
      '                 SUM (vigente_in) AS vigente_in, '
      '                 SUM (impagado_in) AS impagado_in, '
      '                 SUM (exigible_in) AS exigible_in, '
      '                 SUM (cta_ord_in) AS cta_ord_in, '
      '                 SUM (tot_adeudo) AS tot_adeudo, '
      '--    0                  as DISP_LINEA, '
      '                 SUM (imp_contingente) AS imp_contingente '
      '            FROM ( '
      
        '--  //INTERCREDITOS - INTERCREDITOS - INTERCREDITOS - INTERCREDI' +
        'TOS - INTERCREDITOS - INTERCREDITOS - INTERCREDITOS '
      '                  SELECT ccto.id_contrato AS contrato, '
      
        '                         SUBSTR (csb.cve_sub_tip_bco, 1, 6) AS c' +
        've_producto, '
      
        '                         SUBSTR (csb.desc_sub_tipo, 1, 40) AS de' +
        'sc_producto, '
      
        '                         ccto.F_AUT_CREDITO + ccto.DIAS_PLAZO as' +
        ' f_vencimiento, '
      '                         cre.id_credito AS credito, '
      '                         ccto.imp_autorizado AS imp_autorizado, '
      '                         cto.cve_moneda AS cve_moneda, '
      '                         mon.desc_moneda AS desc_moneda, '
      '                         NVL (cac.cve_grupo, '#39#39') AS cve_grupo, '
      '                         NVL (cge.desc_grupo, '
      '                              '#39'SIN GRUPO ECONOMICO'#39' '
      '                             ) AS desc_gpo, '
      '                         cto.id_titular AS titular, '
      '                         SUBSTR '
      
        '                            (pkgcrconsolidado.fun_nom_tit_cred (' +
        'cto.id_titular), '
      '                             1, '
      '                             80 '
      '                            ) AS nombre, '
      '                         cas.imp_cap_vig AS vigente_cp, '
      '                         cas.imp_cap_vdo_ne AS noexigible_cp, '
      '                         cas.imp_cap_imp AS impagado_cp, '
      '                         cas.imp_cap_vdo_ex AS exigible_cp, '
      '                         cas.imp_int_vig AS vigente_in, '
      '                         cas.imp_int_imp AS impagado_in, '
      '                         cas.imp_int_vdo_ex AS exigible_in, '
      '                         cas.imp_ctas_ord AS cta_ord_in, '
      '                         (  cas.imp_cap_vig '
      '                          + cas.imp_cap_vdo_ne '
      '                          + cas.imp_cap_imp '
      '                          + cas.imp_cap_vdo_ex '
      '                          + cas.imp_int_vig '
      '                          + cas.imp_int_imp '
      '                          + cas.imp_int_vdo_ex '
      '                          + cas.imp_ctas_ord '
      '                         ) AS tot_adeudo, '
      '                         0 AS imp_contingente '
      '                    FROM cr_con_adeudo_sdo cas, '
      '                         cre_credito cre, '
      '                         contrato cto, '
      '                         cre_cliente cac, '
      '                         moneda mon, '
      '                         cre_grupo_empr cge, '
      '                         cre_sub_tip_bco csb, '
      '                         cre_contrato ccto '
      '                   WHERE cto.id_empresa = 2 '
      
        '                     AND cas.f_cierre = TO_DATE('#39'31/05/2011'#39','#39'DD' +
        '/MM/YYYY'#39')'
      
        '                     AND (   (    csb.f_traspaso_icre IS NOT NUL' +
        'L '
      '                              AND cre.sit_credito NOT IN ('#39'TA'#39') '
      '                             ) '
      '                          OR csb.f_traspaso_icre IS NULL '
      '                         ) '
      '                     AND cre.id_credito = cas.id_credito '
      '                     AND ccto.id_contrato = cre.id_contrato '
      
        '                     AND csb.cve_sub_tip_bco = ccto.cve_sub_tip_' +
        'bco '
      '                     AND mon.cve_moneda = cto.cve_moneda '
      '                     AND cto.id_contrato = ccto.id_contrato '
      '                     AND cac.id_persona = cto.id_titular '
      '                     AND cge.cve_grupo(+) = cac.cve_grupo '
      '                     AND cre.sit_credito NOT IN ('#39'TA'#39') '
      '                  UNION ALL '
      
        '--rac  //ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - I' +
        'CRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 '
      '                  SELECT ccto.id_contrato AS contrato, '
      '                         ccto.cve_producto_cre AS cve_producto, '
      '                         cpr.desc_c_producto AS desc_producto, '
      '                         ccto.F_VENCIMIENTO AS F_VENCIMIENTO, '
      
        '                         cre.id_credito AS credito, ccto.imp_aut' +
        'orizado, '
      '                         ccto.cve_moneda AS cve_moneda, '
      '                         mon.desc_moneda AS desc_moneda, '
      
        '                         NVL (cac.cve_grupo_eco, '#39#39') AS cve_grup' +
        'o, '
      '                         NVL (cge.desc_grupo_eco, '
      '                              '#39'SIN GRUPO ECONOMICO'#39' '
      '                             ) AS desc_gpo, '
      '                         cto.id_titular AS titular, '
      '                         SUBSTR '
      
        '                            (pkgcrconsolidado.fun_nom_tit_cred (' +
        'cto.id_titular), '
      '                             1, '
      '                             80 '
      '                            ) nombre, '
      '                         cas.imp_cap_vig AS vigente_cp, '
      '                         cas.imp_cap_vdo_ne AS noexigible_cp, '
      '                         cas.imp_cap_imp AS impagado_cp, '
      '                         cas.imp_cap_vdo_ex AS exigible_cp, '
      '                         cas.imp_int_vig AS vigente_in, '
      '                         cas.imp_int_imp AS impagado_in, '
      '                         cas.imp_int_vdo_ex AS exigible_in, '
      '                         cas.imp_ctas_ord AS cta_ord_in, '
      '                           cas.imp_cap_vig '
      '                         + cas.imp_cap_vdo_ne '
      '                         + cas.imp_cap_imp '
      '                         + cas.imp_cap_vdo_ex '
      '                         + cas.imp_int_vig '
      '                         + cas.imp_int_imp '
      '                         + cas.imp_int_vdo_ex '
      '                         + cas.imp_ctas_ord AS tot_adeudo, '
      '                         0 AS imp_contingente '
      '                    FROM cr_con_adeudo_sdo cas, '
      '                         cr_credito cre, '
      '                         cr_contrato ccto, '
      '                         cr_producto cpr, '
      '                         cr_fnd_credito cfn, '
      '                         contrato cto, '
      '                         cr_acreditado cac, '
      '                         moneda mon, '
      '                         cr_grupo_eco cge, '
      '                         cre_presupuesto crp '
      '                   WHERE cto.id_empresa = 2 '
      
        '                     AND cas.f_cierre = TO_DATE('#39'31/05/2011'#39','#39'DD' +
        '/MM/YYYY'#39')'
      '                     AND cre.id_credito = cas.id_credito '
      '                     AND ccto.id_contrato = cre.id_contrato '
      
        '                     AND cpr.cve_producto_cre = ccto.cve_product' +
        'o_cre '
      '                     AND cfn.id_credito(+) = cre.id_credito '
      '                     AND mon.cve_moneda = ccto.cve_moneda '
      '                     AND cto.id_contrato = ccto.id_contrato '
      '                     AND cac.id_acreditado = cto.id_titular '
      
        '                     AND cge.cve_grupo_eco(+) = cac.cve_grupo_ec' +
        'o '
      
        '                     AND crp.cve_presupuesto = cpr.cve_presupues' +
        'to '
      '                  UNION '
      '                  --LINEAS SIN UTILIZAR '
      '                  SELECT ccto.id_contrato AS contrato, '
      '                         ccto.cve_producto_cre AS cve_producto, '
      '                         cpr.desc_c_producto AS desc_producto, '
      '                         ccto.f_vencimiento aS f_vencimiento, '
      '                         0 AS credito, '
      
        '                         ccto.imp_autorizado, ccto.cve_moneda AS' +
        ' cve_moneda, '
      '                         mon.desc_moneda AS desc_moneda, '
      
        '                         NVL (cac.cve_grupo_eco, '#39#39') AS cve_grup' +
        'o, '
      
        '                         NVL (cge.desc_grupo_eco,'#39'SIN GRUPO ECON' +
        'OMICO'#39') AS desc_gpo, '
      '                         cto.id_titular AS titular, '
      '                         SUBSTR '
      
        '                            (pkgcrconsolidado.fun_nom_tit_cred (' +
        'cto.id_titular), '
      '                             1, '
      '                             80 '
      '                            ) nombre, '
      '                         0 AS vigente_cp, 0 AS noexigible_cp, '
      
        '                         0 AS impagado_cp, 0 AS exigible_cp, 0 A' +
        'S vigente_in, '
      
        '                         0 AS impagado_in, 0 AS exigible_in, 0 A' +
        'S cta_ord_in, '
      '                         0 AS tot_adeudo, 0 AS imp_contingente '
      '                    FROM cr_contrato ccto, '
      '                         cr_producto cpr, '
      '                         contrato cto, '
      '                         cr_acreditado cac, '
      '                         moneda mon, '
      '                         cr_grupo_eco cge, '
      '                         cre_presupuesto crp '
      '                   WHERE 1 = 1 '
      
        '                     AND ccto.f_aut_comite <= TO_DATE('#39'31/05/201' +
        '1'#39','#39'DD/MM/YYYY'#39')'
      
        '                     AND ccto.f_vencimiento >= TO_DATE('#39'31/05/20' +
        '11'#39','#39'DD/MM/YYYY'#39')'
      '                     AND ccto.sit_linea IN ('#39'AU'#39') '
      
        '                     AND ccto.id_contrato NOT IN (SELECT id_cont' +
        'rato '
      
        '                                                    FROM cr_cred' +
        'ito '
      
        '                                                   WHERE sit_cre' +
        'dito = '#39'AC'#39') '
      
        '                     AND pkgcrsaldos.stpobtdisponibleaut (ccto.i' +
        'd_contrato, 1) > '
      
        '                                                                ' +
        '             0 '
      '                     AND cto.id_empresa = 2 '
      
        '                     AND cpr.cve_producto_cre = ccto.cve_product' +
        'o_cre '
      '                     AND mon.cve_moneda = ccto.cve_moneda '
      '                     AND cto.id_contrato = ccto.id_contrato '
      '                     AND cac.id_acreditado = cto.id_titular '
      
        '                     AND cge.cve_grupo_eco(+) = cac.cve_grupo_ec' +
        'o '
      
        '                     AND crp.cve_presupuesto = cpr.cve_presupues' +
        'to '
      '                  -- '
      '                  UNION ALL '
      '                  --  C A R T A S       D E     C R E D I T O '
      '                  SELECT RESULT.id_contrato AS contrato, '
      
        '                         crcont.cve_producto_cre AS cve_producto' +
        ', '
      '                         cpr.desc_c_producto AS desc_producto, '
      '                         crcont.f_vencimiento as f_vencimiento, '
      '                         RESULT.id_credito AS credito, '
      '                         (SELECT imp_autorizado '
      '                            FROM cr_contrato '
      '                           WHERE id_contrato = '
      '                                         RESULT.id_contrato) '
      
        '                                                            AS i' +
        'mp_autorizado, '
      '                         RESULT.cve_moneda, m.desc_moneda, '
      
        '                         NVL (ca.cve_grupo_eco, '#39#39') AS cve_grupo' +
        ', '
      '                         NVL (cge.desc_grupo_eco, '
      '                              '#39'SIN GRUPO ECONOMICO'#39' '
      '                             ) AS desc_gpo, '
      '                         RESULT.id_titular AS titular, '
      '                         SUBSTR '
      '                            (pkgcrconsolidado.fun_nom_tit_cred '
      
        '                                                            (RES' +
        'ULT.id_titular), '
      '                             1, '
      '                             80 '
      '                            ) AS nombre, '
      '                         0 AS vigente_cp, 0 AS noexigible_cp, '
      
        '                         0 AS impagado_cp, 0 AS exigible_cp, 0 A' +
        'S vigente_in, '
      
        '                         0 AS impagado_in, 0 AS exigible_in, 0 A' +
        'S cta_ord_in, '
      '                         0 AS tot_adeudo, '
      
        '                         RESULT.imp_total_cci AS imp_contingente' +
        ' '
      
        '                    FROM (SELECT ccc1.id_contrato, cto.cve_moned' +
        'a, '
      
        '                                 cto.id_titular, ccc1.id_credito' +
        ', '
      
        '                                 ccc1.imp_credito, pct_adicional' +
        ', '
      '                                   ccc1.imp_credito '
      '                                 + ROUND (  ccc1.imp_credito '
      '                                          * ccc1.pct_adicional '
      '                                          / 100, '
      '                                          2 '
      '                                         ) AS imp_total_cci, '
      '                                   ccc1.imp_credito '
      '                                 + ROUND (  ccc1.imp_credito '
      '                                          * ccc1.pct_adicional '
      '                                          / 100, '
      '                                          2 '
      '                                         ) '
      
        '                                 + NVL (cci_transac.sum_imp_conc' +
        'epto, 0) '
      
        '                                                                ' +
        ' AS saldo_cci '
      
        '                            FROM (   -- Obtiene las cartas de cr' +
        'édito Vigentes '
      
        '                                  SELECT ccc.id_contrato, ccc.id' +
        '_credito, '
      '                                         ccc.imp_credito, '
      '                                         NVL '
      '                                            (ccc.pct_adicional, '
      '                                             0 '
      '                                            ) AS pct_adicional '
      '                                    FROM cr_con_reg_cci ccc '
      '                                   WHERE ccc.id_reg_vigente = 1 '
      
        '                                     AND (   (    ccc.f_disposic' +
        'ion <= TO_DATE('#39'31/05/2011'#39','#39'DD/MM/YYYY'#39')'
      
        '                                     AND ccc.sit_con_reg_cci = '#39 +
        'AC'#39' )'
      
        '                                          OR (ccc.f_liquidacion ' +
        '> TO_DATE('#39'31/05/2011'#39','#39'DD/MM/YYYY'#39'))'
      
        '                                          OR (ccc.f_liquidacion ' +
        'BETWEEN TO_DATE ('#39'01/5/2011'#39','#39'DD/MM/YYYY'#39') AND TO_DATE('#39'31/05/20' +
        '11'#39','#39'DD/MM/YYYY'#39') ) '
      '                                         ) '
      '                                 ) ccc1, '
      '                                 ( '
      
        '                   -- Obtiene todas las afectaciones de las cart' +
        'as de créditos '
      
        '                                  -- aplicadas al corte solicita' +
        'do '
      '                                  SELECT   cci.id_credito, '
      '                                           SUM '
      
        '                                              (  NVL (cci.imp_co' +
        'ncepto, 0) '
      '                                               * DECODE '
      
        '                                                       (ccconc.c' +
        've_afec_saldo, '
      '                                                        '#39'I'#39', 1, '
      
        '                                                        '#39'D'#39', -1,' +
        ' '
      '                                                        0 '
      '                                                       ) '
      
        '                                              ) AS sum_imp_conce' +
        'pto '
      
        '                                      FROM (SELECT ccc2.id_credi' +
        'to '
      
        '                                              FROM cr_con_reg_cc' +
        'i ccc2 '
      
        '                                             WHERE ccc2.id_reg_v' +
        'igente = 1 '
      
        '                                               AND (   (    ccc2' +
        '.f_disposicion <= TO_DATE('#39'31/05/2011'#39','#39'DD/MM/YYYY'#39')'
      
        '                                                        AND ccc2' +
        '.sit_con_reg_cci = '
      
        '                                                                ' +
        '          '#39'AC'#39' '
      '                                                       ) '
      
        '                                                    OR (ccc2.f_l' +
        'iquidacion > TO_DATE('#39'31/05/2011'#39','#39'DD/MM/YYYY'#39') )'
      '                                                       ) '
      
        '                                                    OR (ccc2.f_l' +
        'iquidacion '
      
        '                                                           BETWE' +
        'EN TO_DATE ('#39'01/5/2011'#39','#39'DD/MM/YYYY'#39') AND TO_DATE('#39'31/05/2011'#39','#39 +
        'DD/MM/YYYY'#39')'
      '                                                   )) ccc3, '
      '                                           cr_cci_transac cci, '
      
        '                                           cr_cci_concepto cccon' +
        'c '
      
        '                                     WHERE cci.id_credito = ccc3' +
        '.id_credito '
      
        '                                       AND cci.f_operacion <= TO' +
        '_DATE('#39'31/05/2011'#39','#39'DD/MM/YYYY'#39')'
      
        '                                       AND cci.sit_cci_transac <' +
        '> '#39'CA'#39' '
      
        '                                       AND ccconc.cve_cci_concep' +
        'to = '
      
        '                                                          cci.cv' +
        'e_cci_concepto '
      
        '                                  GROUP BY cci.id_credito) cci_t' +
        'ransac, '
      '                                 ( '
      
        '                   -- Obtiene todas las afectaciones de las cart' +
        'as de créditos '
      '                   -- aplicadas en el MES solicitado '
      '                                  SELECT   cci.id_credito, '
      '                                           SUM '
      
        '                                              (  NVL (cci.imp_co' +
        'ncepto, 0) '
      '                                               * DECODE '
      
        '                                                       (ccconc.c' +
        've_afec_saldo, '
      '                                                        '#39'I'#39', 1, '
      
        '                                                        '#39'D'#39', -1,' +
        ' '
      '                                                        0 '
      '                                                       ) '
      
        '                                              ) AS sum_imp_conce' +
        'pto_mes '
      
        '                                      FROM (SELECT ccc2.id_credi' +
        'to '
      
        '                                              FROM cr_con_reg_cc' +
        'i ccc2 '
      
        '                                             WHERE ccc2.id_reg_v' +
        'igente = 1 '
      
        '                                               AND (   (    ccc2' +
        '.f_disposicion <= TO_DATE('#39'31/05/2011'#39','#39'DD/MM/YYYY'#39') )'
      
        '                                                        AND ccc2' +
        '.sit_con_reg_cci = '#39'AC'#39
      '                                                       ) '
      
        '                                                    OR (ccc2.f_l' +
        'iquidacion > TO_DATE('#39'31/05/2011'#39','#39'DD/MM/YYYY'#39') ) '
      
        '                                                    OR (ccc2.f_l' +
        'iquidacion BETWEEN TO_DATE ('#39'01/5/2011'#39','#39'DD/MM/YYYY'#39') AND TO_DAT' +
        'E('#39'31/05/2011'#39','#39'DD/MM/YYYY'#39')'
      '                                                   )) ccc3, '
      '                                           cr_cci_transac cci, '
      
        '                                           cr_cci_concepto cccon' +
        'c '
      
        '                                     WHERE cci.id_credito = ccc3' +
        '.id_credito '
      
        '                                       AND cci.f_operacion BETWE' +
        'EN TO_DATE ('#39'01/5/2011'#39','#39'DD/MM/YYYY'#39') AND TO_DATE('#39'31/05/2011'#39','#39 +
        'DD/MM/YYYY'#39')'
      
        '                                       AND cci.sit_cci_transac <' +
        '> '#39'CA'#39' '
      
        '                                       AND ccconc.cve_cci_concep' +
        'to = '
      
        '                                                          cci.cv' +
        'e_cci_concepto '
      
        '                                  GROUP BY cci.id_credito) cci_t' +
        'ransac_mes, '
      '                                 contrato cto '
      
        '                           WHERE cto.id_contrato = ccc1.id_contr' +
        'ato '
      
        '                             AND cci_transac.id_credito(+) = ccc' +
        '1.id_credito '
      
        '                             AND cci_transac_mes.id_credito(+) =' +
        ' '
      
        '                                                               c' +
        'cc1.id_credito) RESULT, '
      '                         moneda m, '
      '                         cr_acreditado ca, '
      '                         cr_grupo_eco cge, '
      '                         cr_contrato crcont, '
      '                         cr_producto cpr '
      '                   WHERE m.cve_moneda = RESULT.cve_moneda '
      '                     AND ca.id_acreditado = RESULT.id_titular '
      
        '                     AND cge.cve_grupo_eco(+) = ca.cve_grupo_eco' +
        ' '
      
        '                     AND crcont.id_contrato = RESULT.id_contrato' +
        ' '
      
        '                     AND cpr.cve_producto_cre = crcont.cve_produ' +
        'cto_cre )datos '
      '                  WHERE 1=1    AND DATOS.CVE_GRUPO  = '#39'6119'#39
      
        '  GROUP BY CVE_MONEDA,DESC_MONEDA,CVE_GRUPO,DESC_GPO,TITULAR,CON' +
        'TRATO,CVE_PRODUCTO,DESC_PRODUCTO,F_VENCIMIENTO,NOMBRE,IMP_AUTORI' +
        'ZADO '
      '  ORDER BY CVE_MONEDA,CVE_GRUPO,TITULAR,cve_producto, CONTRATO )'
      '')
    Left = 314
    Top = 52
    object FloatField1: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object StringField2: TStringField
      FieldName = 'DESC_MONEDA'
    end
    object StringField3: TStringField
      FieldName = 'CVE_GRUPO'
      Size = 6
    end
    object StringField4: TStringField
      FieldName = 'DESC_GPO'
      Size = 250
    end
    object FloatField2: TFloatField
      FieldName = 'TITULAR'
    end
    object FloatField3: TFloatField
      FieldName = 'CONTRATO'
    end
    object StringField5: TStringField
      FieldName = 'CVE_PRODUCTO'
      Size = 6
    end
    object StringField6: TStringField
      FieldName = 'DESC_PRODUCTO'
      Size = 40
    end
    object StringField7: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object FloatField4: TFloatField
      FieldName = 'IMP_AUTORIZADO'
    end
    object FloatField5: TFloatField
      FieldName = 'VIGENTE_CP'
    end
    object FloatField6: TFloatField
      FieldName = 'IMPAGADO_CP'
    end
    object FloatField7: TFloatField
      FieldName = 'EXIGIBLE_CP'
    end
    object FloatField8: TFloatField
      FieldName = 'NOEXIGIBLE_CP'
    end
    object FloatField9: TFloatField
      FieldName = 'VIGENTE_IN'
    end
    object FloatField10: TFloatField
      FieldName = 'IMPAGADO_IN'
    end
    object FloatField11: TFloatField
      FieldName = 'EXIGIBLE_IN'
    end
    object FloatField12: TFloatField
      FieldName = 'CTA_ORD_IN'
    end
    object FloatField13: TFloatField
      FieldName = 'TOT_ADEUDO'
    end
    object FloatField14: TFloatField
      FieldName = 'DISP_LINEA'
    end
    object qyConsAdeudoIMP_CONTINGENTE: TFloatField
      FieldName = 'IMP_CONTINGENTE'
    end
    object qyConsAdeudoF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
  end
end
