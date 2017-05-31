object QrSecPubl: TQrSecPubl
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
  DataSet = QDatos
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
    100
    2794
    100
    2159
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
  object ColumnHeaderBand1: TQRBand
    Left = 38
    Top = 122
    Width = 740
    Height = 79
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
      209.020833333333
      1957.91666666667)
    BandType = rbColumnHeader
    object QRLabel2: TQRLabel
      Left = 72
      Top = 47
      Width = 289
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        190.5
        124.354166666667
        764.645833333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Entidad'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel3: TQRLabel
      Left = 364
      Top = 47
      Width = 149
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        963.083333333333
        124.354166666667
        394.229166666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel4: TQRLabel
      Left = 517
      Top = 47
      Width = 100
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1367.89583333333
        124.354166666667
        264.583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Porcentaje'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRShape2: TQRShape
      Left = 73
      Top = 71
      Width = 543
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.29166666666667
        193.145833333333
        187.854166666667
        1436.6875)
      Shape = qrsRectangle
    end
    object QRLCartas: TQRLabel
      Left = 8
      Top = 0
      Width = 345
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        21.1666666666667
        0
        912.8125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLCartas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLIntereses: TQRLabel
      Left = 360
      Top = 0
      Width = 369
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        952.5
        0
        976.3125)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLIntereses'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object DetailBand1: TQRBand
    Left = 38
    Top = 201
    Width = 740
    Height = 22
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
      58.2083333333333
      1957.91666666667)
    BandType = rbDetail
    object qrTxtDesc_Grupo: TQRDBText
      Left = 72
      Top = 2
      Width = 289
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        190.5
        5.29166666666667
        764.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'TITULO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrTxtImporte: TQRDBText
      Left = 364
      Top = 2
      Width = 149
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        963.083333333333
        5.29166666666667
        394.229166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Saldo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrTxtCumple: TQRDBText
      Left = 518
      Top = 2
      Width = 100
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1370.54166666667
        5.29166666666667
        264.583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QDatos
      DataField = 'Pct_Saldo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object TitleBand1: TQRBand
    Left = 38
    Top = 38
    Width = 740
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
      1957.91666666667)
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
        1957.91666666667)
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
  object SummaryBand1: TQRBand
    Left = 38
    Top = 223
    Width = 740
    Height = 393
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
      1039.8125
      1957.91666666667)
    BandType = rbSummary
    object QRExpr1: TQRExpr
      Left = 365
      Top = 8
      Width = 148
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        965.729166666667
        21.1666666666667
        391.583333333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'sum(QDatos.Saldo)'
      Mask = '###,###,###,###,###.00'
      FontSize = 8
    end
    object QRLabel11: TQRLabel
      Left = 288
      Top = 8
      Width = 71
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        762
        21.1666666666667
        187.854166666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLeyendaMoneda: TQRLabel
      Left = 200
      Top = 34
      Width = 512
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        529.166666666667
        89.9583333333333
        1354.66666666667)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRExpr2: TQRExpr
      Left = 517
      Top = 8
      Width = 102
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1367.89583333333
        21.1666666666667
        269.875)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clBlack
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'sum(QDatos.Pct_Saldo)'
      Mask = '###,###,###,###,###.00'
      FontSize = 8
    end
  end
  object QDatos: TQuery
    SQL.Strings = (
      'Select  F.Titulo                            Titulo, '
      
        '        Case When F.Titulo = '#39'Federación'#39'                       ' +
        '                 Then 1  '
      
        '             When F.Titulo = '#39'Entidades'#39'                        ' +
        '                 Then 2'
      
        '             When F.Titulo = '#39'Municipios'#39'                       ' +
        '                 Then 3'
      
        '             When F.Titulo = '#39'Factoraje Federación'#39'             ' +
        '                 Then 4 '
      
        '             When F.Titulo = '#39'Factoraje Entidades'#39'              ' +
        '                 Then 5'
      
        '             When F.Titulo = '#39'Factoraje Municipios'#39'             ' +
        '                 Then 6 '
      
        '             When F.Titulo = '#39'Factoraje Organismos Descentraliza' +
        'dos Federales'#39'   Then 7  '
      
        '             When F.Titulo = '#39'Factoraje Organismos Descentraliza' +
        'dos Estatales'#39'   Then 8  '
      
        '             When F.Titulo = '#39'Factoraje Organismos Descentraliza' +
        'dos Municipales'#39' Then 9 End B_Orden, '
      
        '        Round(F.Saldo / :peFactor, 2)                           ' +
        '  Saldo , '
      '        Tot.Saldo                           Saldo_Total,'
      
        '        Round (F.Saldo / Decode(Tot.Saldo,0,1,Tot.Saldo), 4) * 1' +
        '00 Pct_Saldo  '
      '  From( '
      
        '       Select Case When  Grouping(T.Titulo) = 1 Then '#39'Total'#39' Els' +
        'e T.Titulo End Titulo,'
      '               Sum(Nvl (I.Saldo, 0)) Saldo,'
      '               Grouping(T.Titulo) B_Total'
      '         From ('
      '               Select Case When RowNum = 1  Then '#39'Federación'#39'  '
      '                           When RowNum = 2  Then '#39'Entidades'#39
      '                           When RowNum = 3  Then '#39'Municipios'#39' '
      
        '                           When RowNum = 4  Then '#39'Factoraje Fede' +
        'ración'#39'  '
      
        '                           When RowNum = 5  Then '#39'Factoraje Enti' +
        'dades'#39
      
        '                           When RowNum = 6  Then '#39'Factoraje Muni' +
        'cipios'#39
      
        '                           When RowNum = 7  Then '#39'Factoraje Orga' +
        'nismos Descentralizados Federales'#39'   '
      
        '                           When RowNum = 8  Then '#39'Factoraje Orga' +
        'nismos Descentralizados Estatales'#39'   '
      
        '                           When RowNum = 9  Then '#39'Factoraje Orga' +
        'nismos Descentralizados Municipales'#39' End Titulo'
      
        '                From Table (PkgCrGpViews.VW_CR_GP_Saldos_Edos_Mu' +
        'n(:peFecha))'
      '               Where RowNum <= 9) T'
      '         Left Outer Join ( '
      
        '                          Select Titulo , Sum(Saldos) Saldo     ' +
        '   '
      '                            From ('
      
        '                                  Select Case When Tipo_Entidad ' +
        '= '#39'FEDERAL'#39'   And B_Factoraje    = '#39'F'#39' Then  '#39'Federación'#39'  '
      
        '                                              When Tipo_Entidad ' +
        '= '#39'ESTATAL'#39'   And B_Factoraje    = '#39'F'#39' Then  '#39'Entidades'#39
      
        '                                              When Tipo_Entidad ' +
        '= '#39'MUNICIPAL'#39' And B_Factoraje    = '#39'F'#39' Then  '#39'Municipios'#39' '
      
        '                                              When Tipo_Entidad ' +
        '= '#39'FEDERAL'#39'   And B_Factoraje    = '#39'V'#39' Then  '#39'Factoraje Federaci' +
        'ón'#39'  '
      
        '                                              When Tipo_Entidad ' +
        '= '#39'ESTATAL'#39'   And B_Factoraje    = '#39'V'#39' Then  '#39'Factoraje Entidade' +
        's'#39
      
        '                                              When Tipo_Entidad ' +
        '= '#39'MUNICIPAL'#39' And B_Factoraje    = '#39'V'#39' Then  '#39'Factoraje Municipi' +
        'os'#39
      
        '                                              When Tipo_Entidad ' +
        '= '#39'ORG_DESC'#39'  And B_Factoraje    = '#39'V'#39' Then  '#39'Factoraje Organism' +
        'os Descentralizados Federales'#39' End Titulo,'
      
        '                                         Case When Tipo_Entidad ' +
        '= '#39'FEDERAL'#39'   And B_Factoraje    = '#39'F'#39' Then  Nvl (Saldo, 0)  '
      
        '                                              When Tipo_Entidad ' +
        '= '#39'ESTATAL'#39'   And B_Factoraje    = '#39'F'#39' Then  Nvl (Saldo, 0)'
      
        '                                              When Tipo_Entidad ' +
        '= '#39'MUNICIPAL'#39' And B_Factoraje    = '#39'F'#39' Then  Nvl (Saldo, 0)'
      
        '                                              When Tipo_Entidad ' +
        '= '#39'FEDERAL'#39'   And B_Factoraje    = '#39'V'#39' Then  Nvl (Saldo, 0)  '
      
        '                                              When Tipo_Entidad ' +
        '= '#39'ESTATAL'#39'   And B_Factoraje    = '#39'V'#39' Then  Nvl (Saldo, 0)'
      
        '                                              When Tipo_Entidad ' +
        '= '#39'MUNICIPAL'#39' And B_Factoraje    = '#39'V'#39' Then  Nvl (Saldo, 0)'
      
        '                                              When Tipo_Entidad ' +
        '= '#39'ORG_DESC'#39'  And B_Factoraje    = '#39'V'#39' Then  Nvl (Saldo, 0) End ' +
        'Saldos'
      '                                    From ('
      '                                          Select S.*, '
      
        '                                                 Case When Subst' +
        'r (Cve_Producto_Cre,1,3) = '#39'FAC'#39'  Or'
      
        '                                                           Subst' +
        'r (Cve_Producto_Cre,4,3) = '#39'FAC'#39'  Then '#39'V'#39' Else '#39'F'#39' End   B_Fact' +
        'oraje,'
      
        '                                                 (S.Imp_Cap_Vig ' +
        '+ S.Imp_Cap_Imp + S.Imp_Int_Vig + S.Imp_Int_Imp) * '
      
        '                                                 PkgCrConsolidad' +
        'o1.Fnc_Obt_Tipo_Cambio_Regul '
      
        '                                                 (Cve_Moneda, '#39'D' +
        '000'#39', Extract (Year From :peFecha),Extract (Month From :peFecha)' +
        ')  Saldo'
      
        '                                            From Table (PkgCrGpV' +
        'iews.VW_CR_GP_Saldos_Edos_Mun(:peFecha)) S'
      '                                         ) '
      '                                  ) Group By Titulo '
      '                          ) I On T.Titulo = I.Titulo   '
      '        Where T.Titulo Is Not Null '
      '        Group By RollUp (T.Titulo) '
      '       ) F'
      'Left Outer Join ('
      
        '                 Select T.Titulo, Sum(Nvl (I.Saldo, 0)) Saldo, G' +
        'rouping(T.Titulo) B_Total'
      '                   From ('
      
        '                         Select Case When RowNum = 1  Then '#39'Fede' +
        'ración'#39'  '
      
        '                                     When RowNum = 2  Then '#39'Enti' +
        'dades'#39
      
        '                                     When RowNum = 3  Then '#39'Muni' +
        'cipios'#39' '
      
        '                                     When RowNum = 4  Then '#39'Fact' +
        'oraje Federación'#39'  '
      
        '                                     When RowNum = 5  Then '#39'Fact' +
        'oraje Entidades'#39
      
        '                                     When RowNum = 6  Then '#39'Fact' +
        'oraje Municipios'#39
      
        '                                     When RowNum = 7  Then '#39'Fact' +
        'oraje Organismos Descentralizados Federales'#39'   '
      
        '                                     When RowNum = 8  Then '#39'Fact' +
        'oraje Organismos Descentralizados Estatales'#39'   '
      
        '                                     When RowNum = 9  Then '#39'Fact' +
        'oraje Organismos Descentralizados Municipales'#39' End Titulo'
      
        '                          From Table (PkgCrGpViews.VW_CR_GP_Sald' +
        'os_Edos_Mun(:peFecha))'
      '                         Where RowNum <= 9) T'
      '                   Left Outer Join ( '
      
        '                                    Select Titulo , Sum(Saldos) ' +
        'Saldo        '
      '                                      From ('
      
        '                                            Select Case When Tip' +
        'o_Entidad = '#39'PRIVADO'#39'   And Cve_Sector_Eco = 11 And B_Factoraje ' +
        '= '#39'F'#39' Then  '#39'Federación'#39'  '
      
        '                                                        When Tip' +
        'o_Entidad = '#39'ESTATAL'#39'   And B_Factoraje    = '#39'F'#39'                ' +
        '      Then  '#39'Entidades'#39
      
        '                                                        When Tip' +
        'o_Entidad = '#39'MUNICIPAL'#39' And B_Factoraje    = '#39'F'#39'                ' +
        '      Then  '#39'Municipios'#39' '
      
        '                                                        When Tip' +
        'o_Entidad = '#39'PRIVADO'#39'   And Cve_Sector_Eco = 11 And B_Factoraje ' +
        '= '#39'V'#39' Then  '#39'Factoraje Federación'#39'  '
      
        '                                                        When Tip' +
        'o_Entidad = '#39'ESTATAL'#39'   And B_Factoraje    = '#39'V'#39'                ' +
        '      Then  '#39'Factoraje Entidades'#39
      
        '                                                        When Tip' +
        'o_Entidad = '#39'MUNICIPAL'#39' And B_Factoraje    = '#39'V'#39'                ' +
        '      Then  '#39'Factoraje Municipios'#39
      
        '                                                        When Tip' +
        'o_Entidad = '#39'ORG_DESC'#39'  And B_Factoraje    = '#39'V'#39'                ' +
        '      Then  '#39'Factoraje Organismos Descentralizados Federales'#39' En' +
        'd Titulo,'
      
        '                                                   Case When Tip' +
        'o_Entidad = '#39'PRIVADO'#39'   And Cve_Sector_Eco = 11 And B_Factoraje ' +
        '= '#39'F'#39' Then  Nvl (Saldo, 0)  '
      
        '                                                        When Tip' +
        'o_Entidad = '#39'ESTATAL'#39'   And B_Factoraje    = '#39'F'#39'                ' +
        '      Then  Nvl (Saldo, 0)'
      
        '                                                        When Tip' +
        'o_Entidad = '#39'MUNICIPAL'#39' And B_Factoraje    = '#39'F'#39'                ' +
        '      Then  Nvl (Saldo, 0)'
      
        '                                                        When Tip' +
        'o_Entidad = '#39'PRIVADO'#39'   And Cve_Sector_Eco = 11 And B_Factoraje ' +
        '= '#39'V'#39' Then  Nvl (Saldo, 0)  '
      
        '                                                        When Tip' +
        'o_Entidad = '#39'ESTATAL'#39'   And B_Factoraje    = '#39'V'#39'                ' +
        '      Then  Nvl (Saldo, 0)'
      
        '                                                        When Tip' +
        'o_Entidad = '#39'MUNICIPAL'#39' And B_Factoraje    = '#39'V'#39'                ' +
        '      Then  Nvl (Saldo, 0)'
      
        '                                                        When Tip' +
        'o_Entidad = '#39'ORG_DESC'#39'  And B_Factoraje    = '#39'V'#39'                ' +
        '      Then  Nvl (Saldo, 0) End Saldos'
      '                                              From ('
      '                                                    Select S.*, '
      
        '                                                           Case ' +
        'When Substr (Cve_Producto_Cre,1,3) = '#39'FAC'#39'  Or'
      
        '                                                                ' +
        '     Substr (Cve_Producto_Cre,4,3) = '#39'FAC'#39'  Then '#39'V'#39' Else '#39'F'#39' En' +
        'd   B_Factoraje,'
      
        '                                                           (S.Im' +
        'p_Cap_Vig + S.Imp_Cap_Imp + S.Imp_Int_Vig + S.Imp_Int_Imp) * '
      
        '                                                           PkgCr' +
        'Consolidado1.Fnc_Obt_Tipo_Cambio_Regul '
      
        '                                                           (Cve_' +
        'Moneda, '#39'D000'#39', Extract (Year From :peFecha),Extract (Month From' +
        ' :peFecha))  Saldo'
      
        '                                                      From Table' +
        ' (PkgCrGpViews.VW_CR_GP_Saldos_Edos_Mun(:peFecha)) S'
      '                                                   ) '
      '                                            ) Group By Titulo '
      
        '                                    ) I On T.Titulo = I.Titulo  ' +
        ' '
      '                  Where T.Titulo Is Not Null '
      '                  Group By RollUp (T.Titulo)'
      '                 ) Tot On Tot.B_Total= 1'
      ' Where F.Titulo Is Not Null  And F.Titulo <> '#39'Total'#39
      '  Order By B_Orden'
      ' '
      '')
    Left = 86
    Top = 45
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end>
    object QDatosSaldo: TFloatField
      FieldName = 'Saldo'
    end
    object QDatosTitulo: TStringField
      FieldName = 'Titulo'
    end
    object QDatosPct_Saldo: TFloatField
      FieldName = 'Pct_Saldo'
    end
  end
end
