object QRCarteraVigProm: TQRCarteraVigProm
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = QCarteVig
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
    100
    2159
    100
    2794
    100
    100
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
  object QRBand1: TQRBand
    Left = 38
    Top = 38
    Width = 980
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
      2592.91666666667)
    BandType = rbPageHeader
    object QRInterEncabezado1: TQRInterEncabezado
      Left = 0
      Top = 0
      Width = 980
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
        2592.91666666667)
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
  object QRBand2: TQRBand
    Left = 38
    Top = 122
    Width = 980
    Height = 31
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clBlack
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      82.0208333333333
      2592.91666666667)
    BandType = rbColumnHeader
    object QRLabel3: TQRLabel
      Left = 8
      Top = 5
      Width = 123
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        21.1666666666667
        13.2291666666667
        325.4375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'PROMOTOR ASOCIADO'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel1: TQRLabel
      Left = 240
      Top = 5
      Width = 155
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        635
        13.2291666666667
        410.104166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'PROMOTOR ADMINISTRADOR'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel8: TQRLabel
      Left = 512
      Top = 5
      Width = 70
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1354.66666666667
        13.2291666666667
        185.208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ACREDITADO'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel7: TQRLabel
      Left = 752
      Top = 5
      Width = 97
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1989.66666666667
        13.2291666666667
        256.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'SALDO PROMEDIO'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel4: TQRLabel
      Left = 888
      Top = 5
      Width = 50
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2349.5
        13.2291666666667
        132.291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'UTILIDAD'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object QRGroup2: TQRGroup
    Left = 38
    Top = 153
    Width = 980
    Height = 20
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
      52.9166666666667
      2592.91666666667)
    Expression = 'QCarteVig.MONEDA'
    FooterBand = QRBand6
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText10: TQRDBText
      Left = 8
      Top = 1
      Width = 209
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        21.1666666666667
        2.64583333333333
        552.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'MONEDA'
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
  end
  object QRGroup1: TQRGroup
    Left = 38
    Top = 173
    Width = 980
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
      2592.91666666667)
    Expression = 'QCarteVig.PROMOTOR_ASOCIADO'
    FooterBand = QRBand4
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRGroup3: TQRGroup
    Left = 38
    Top = 177
    Width = 980
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
      2592.91666666667)
    Expression = 'QCarteVig.PROMOTOR_ADMIN'
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRBand3: TQRBand
    Left = 38
    Top = 181
    Width = 980
    Height = 11
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
      29.1041666666667
      2592.91666666667)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 512
      Top = 1
      Width = 209
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1354.66666666667
        2.64583333333333
        552.979166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'ACREDITADO'
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
      Left = 752
      Top = 1
      Width = 87
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1989.66666666667
        2.64583333333333
        230.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'SALDO_PROMEDIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText6: TQRDBText
      Left = 888
      Top = 1
      Width = 44
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        2349.5
        2.64583333333333
        116.416666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'UTILIDAD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText4: TQRDBText
      Left = 240
      Top = 1
      Width = 244
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        635
        2.64583333333333
        645.583333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'PROMOTOR_ADMIN'
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
    object QRDBText2: TQRDBText
      Left = 8
      Top = 1
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
        2.64583333333333
        574.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'PROMOTOR_ASOCIADO'
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
  object QRBand6: TQRBand
    Left = 38
    Top = 206
    Width = 980
    Height = 29
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
      76.7291666666667
      2592.91666666667)
    BandType = rbGroupFooter
    object QRShape2: TQRShape
      Left = 208
      Top = 2
      Width = 770
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.8541666666667
        550.333333333333
        5.29166666666667
        2037.29166666667)
      Shape = qrsRectangle
    end
    object QRDBText11: TQRDBText
      Left = 240
      Top = 6
      Width = 137
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        635
        15.875
        362.479166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QCarteVig
      DataField = 'MONEDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRExpr12: TQRExpr
      Left = 752
      Top = 5
      Width = 87
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1989.66666666667
        13.2291666666667
        230.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QCarteVig.SALDO_PROMEDIO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 8
    end
    object QRExpr13: TQRExpr
      Left = 888
      Top = 5
      Width = 87
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        2349.5
        13.2291666666667
        230.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QCarteVig.UTILIDAD)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 8
    end
  end
  object QRBand4: TQRBand
    Left = 38
    Top = 192
    Width = 980
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
      2592.91666666667)
    BandType = rbGroupFooter
    object QRExpr1: TQRExpr
      Left = 752
      Top = 1
      Width = 87
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1989.66666666667
        2.64583333333333
        230.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QCarteVig.SALDO_PROMEDIO)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 8
    end
    object QRExpr2: TQRExpr
      Left = 888
      Top = 1
      Width = 87
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2349.5
        2.64583333333333
        230.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QCarteVig.UTILIDAD)'
      Mask = '###,###,###,###,###,##0.00'
      FontSize = 8
    end
  end
  object QCarteVig: TQuery
    DatabaseName = 'PCORP'
    SQL.Strings = (
      'SELECT DimCre.MONEDA,'
      '       DimCre.ACREDITADO,'
      '       DimCre.PROMOTOR_ASOCIADO,'
      '       DimCre.PROMOTOR_ADMIN,'
      '       SUM(Imp_SPM_K_VIG +'
      '           Imp_SPM_K_Imp) AS SALDO_PROMEDIO,'
      
        '       ROUND(SUM(Imp_Comision + (TasFon.TASA_FONDEO * (Imp_SPM_K' +
        '_VIG + Imp_SPM_K_Imp) * 31 / 36000)),2) AS UTILIDAD'
      
        'FROM  (SELECT * FROM DM_CR_FAC_Credito@dwhc FacCre WHERE FacCre.' +
        'id_anio_mes = 266) FacCre,'
      
        '      (SELECT * FROM DM_CR_DIM_Credito@dwhc DimCre WHERE DimCre.' +
        'CVE_TIPO_CARTERA  = '#39'BANCAR'#39') DimCre,'
      '       DM_CR_DIM_Mes@dwhc DimMes,'
      '      (select * from CR_COINCRE_TAS_FON) TasFon'
      'WHERE  FacCre.Id_Credito        = DimCre.Id_Credito'
      'AND    DimMes.Id_Anio_Mes       = FacCre.Id_Anio_Mes'
      'AND    TasFon.ID_ANIO_MES       = FacCre.Id_Anio_Mes'
      'AND    TasFon.CVE_MERC_OBJ_DET  = DimCre.ID_OLTP_MERC_OBJ_DET'
      'GROUP BY DimCre.MONEDA,'
      '         DimCre.PROMOTOR_ASOCIADO,'
      '         DimCre.PROMOTOR_ADMIN,'
      '         DimCre.ACREDITADO'
      
        'ORDER BY DimCre.MONEDA, DimCre.PROMOTOR_ASOCIADO, DimCre.PROMOTO' +
        'R_ADMIN, DimCre.ACREDITADO ')
    Left = 248
    Top = 16
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 704
    Top = 32
  end
end
