object QrAcreMax: TQrAcreMax
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
  DataSet = QAcreditados
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
    Height = 119
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
      314.854166666667
      1957.91666666667)
    BandType = rbColumnHeader
    object QRLabel1: TQRLabel
      Left = 88
      Top = 90
      Width = 46
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        232.833333333333
        238.125
        121.708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Grupo'
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
    object QRLabel2: TQRLabel
      Left = 136
      Top = 90
      Width = 225
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        359.833333333333
        238.125
        595.3125)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Descripción'
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
      Top = 90
      Width = 133
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        963.083333333333
        238.125
        351.895833333333)
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
      Left = 500
      Top = 90
      Width = 100
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1322.91666666667
        238.125
        264.583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cumplimiento'
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
      Left = 88
      Top = 114
      Width = 512
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.29166666666667
        232.833333333333
        301.625
        1354.66666666667)
      Shape = qrsRectangle
    end
    object QRLCartas: TQRLabel
      Left = 8
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
        21.1666666666667
        0
        976.3125)
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
      Left = 381
      Top = 0
      Width = 348
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1008.0625
        0
        920.75)
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
    Top = 247
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
    object qrTxtGrupo: TQRDBText
      Left = 88
      Top = 2
      Width = 46
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        232.833333333333
        5.29166666666667
        121.708333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QAcreditados
      DataField = 'Desc_Grupo'
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
    object qrTxtDesc_Grupo: TQRDBText
      Left = 136
      Top = 2
      Width = 225
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        359.833333333333
        5.29166666666667
        595.3125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QAcreditados
      DataField = 'Desc_Concepto'
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
      Width = 133
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
        351.895833333333)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QAcreditados
      DataField = 'Importe'
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
    object qrTxtCumple: TQRDBText
      Left = 500
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
        1322.91666666667
        5.29166666666667
        264.583333333333)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QAcreditados
      DataField = 'Cumplimiento'
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
  object QRGroupLinea: TQRGroup
    Left = 38
    Top = 241
    Width = 740
    Height = 6
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
      15.875
      1957.91666666667)
    Expression = 'Grupo'
    FooterBand = qrFooterLinea
    Master = Owner
    ReprintOnNewPage = False
  end
  object qrFooterLinea: TQRBand
    Left = 38
    Top = 269
    Width = 740
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
      26.4583333333333
      1957.91666666667)
    BandType = rbGroupFooter
    object QRShape1: TQRShape
      Left = 88
      Top = 3
      Width = 512
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.29166666666667
        232.833333333333
        7.9375
        1354.66666666667)
      Shape = qrsRectangle
    end
  end
  object SummaryBand1: TQRBand
    Left = 38
    Top = 279
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
    BandType = rbSummary
    object QRLeyendaMoneda: TQRLabel
      Left = 88
      Top = 2
      Width = 512
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        232.833333333333
        5.29166666666667
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
  end
  object QAcreditados: TQuery
    SQL.Strings = (
      'Select Case When Grupo > 0 And'
      
        '                 Orden = 1 Then '#39'Grupo '#39' || Grupo Else Null End ' +
        '    Desc_Grupo,'
      '       Desc_Concepto, '
      
        '       Round (Importe / :peFactor, 2)                           ' +
        '    Importe,'
      '       Case '
      '          When Grupo In  (1, 2) And Orden = 2 Then '
      '               Case   '
      
        '                 --   Cap Bas >= Suma de los (3, 5) acreditados ' +
        'mayores'
      
        '                 When Importe >= Lag (Importe) Over (Partition B' +
        'y Grupo Order By Orden) Then '#39'SI'#39
      '                 Else '#39'NO'#39
      '               End'
      '          When Grupo = 3 And Orden = 3 Then '
      
        '               Case   --El menor entre el capital básico y el 10' +
        '% de la cartera total'
      
        '                 When Least (Importe, Lag (Importe) Over (Partit' +
        'ion By Grupo Order By Orden)) >='
      '                      -- >= El acreditado mayor  '
      
        '                      Lag (Importe, 2) Over (Partition By Grupo ' +
        'Order By Orden) Then '#39'SI'#39
      '                 Else '#39'NO'#39
      '               End'
      
        '       End                                                      ' +
        '    Cumplimiento,'
      '       Grupo'
      '  From ('
      
        '        Select CBD.Grupo, CBD.Orden, CBD.Desc_Concepto, CB.Imp_C' +
        'ap_Basico * CBD.Factor Importe'
      
        '          From (Select Imp_Capital_Basico * 1000000       Imp_Ca' +
        'p_Basico'
      
        '                  From Table (PkgCrGpViews.VW_CR_GP_Capital_Basi' +
        'co (:peFecha, '#39'ESTATAL'#39'))'
      '                 Where Pct_Capital = 100'
      '               ) CB'
      
        '          Cross Join (Select 0 Grupo, 2 Orden, '#39'Capital Básico'#39' ' +
        '          Desc_Concepto, 1   Factor From Dual Union'
      
        '                      Select 1 Grupo, 2 Orden, '#39'Capital Básico 2' +
        '.5 Veces'#39' Desc_Concepto, 2.5 Factor From Dual Union'
      
        '                      Select 2 Grupo, 2 Orden, '#39'Capital Básico 3' +
        ' Veces'#39'   Desc_Concepto, 3   Factor From Dual Union '
      
        '                      Select 3 Grupo, 2 Orden, '#39'Capital Básico'#39' ' +
        '          Desc_Concepto, 1   Factor From Dual '
      '                     ) CBD'
      '        Union All'
      
        '        Select CTD.Grupo, CTD.Orden, CTD.Desc_Concepto, CT.Impor' +
        'te * CTD.Factor Importe'
      '          From (Select Sum ((Nvl (Imp_Cap_Vig, 0) +'
      '                             Nvl (Imp_Cap_Imp, 0) +'
      '                             Nvl (Imp_Int_Vig, 0) +'
      '                             Nvl (Imp_Int_Imp, 0) '
      
        '                            ) * PkgCrConsolidado1.Fnc_Obt_Tipo_C' +
        'ambio_Regul (Cve_Moneda,  '
      
        '                                                                ' +
        '             '#39'D000'#39', '
      
        '                                                                ' +
        '             To_Char (:peFecha, '#39'YYYY'#39'),'
      
        '                                                                ' +
        '             To_Char (:peFecha, '#39'MM'#39')'
      
        '                                                                ' +
        '            )'
      
        '                           )                                    ' +
        '                                             Importe'
      
        '                  From Table (PkgCrGpViews.VW_CR_GP_Saldos_Edos_' +
        'Mun (:peFecha, :peTipo_Entidad))'
      '               ) CT'
      
        '           Cross Join (Select 0 Grupo, 1 Orden, '#39'Cartera Total'#39' ' +
        '    Desc_Concepto, 1   Factor From Dual Union'
      
        '                       Select 3 Grupo, 3 Orden, '#39'10% Cartera Tot' +
        'al'#39' Desc_Concepto, 0.1 Factor From Dual '
      '                      ) CTD'
      '        Union All'
      '        Select Gp.Grupo, '
      '               Gp.Orden,'
      '               Gp.Desc_Concepto,'
      '               Case Num_Acred When 1 Then Imp.Importe_1'
      '                              When 3 Then Imp.Importe_3'
      '                              When 5 Then Imp.Importe_5'
      
        '               End                                             I' +
        'mporte                       '
      '          From (       '
      
        '                Select 3 Grupo, 1 Orden, '#39'Acreditado mayor'#39'     ' +
        '                 Desc_Concepto, 1 Num_Acred From Dual Union '
      
        '                Select 1 Grupo, 1 Orden, '#39'Suma de los tres acred' +
        'itados mayores'#39'  Desc_Concepto, 3 Num_Acred From Dual Union'
      
        '                Select 2 Grupo, 1 Orden, '#39'Suma de los 5 acredita' +
        'dos más grandes'#39' Desc_Concepto, 5 Num_Acred From Dual '
      '               ) Gp'
      
        '          Cross Join (Select Sum (Case When Renglon  = 1 Then Im' +
        'porte Else 0 End)    Importe_1,'
      
        '                             Sum (Case When Renglon <= 3 Then Im' +
        'porte Else 0 End)    Importe_3,'
      
        '                             Sum (Case When Renglon <= 5 Then Im' +
        'porte Else 0 End)    Importe_5'
      '                        From ('
      '                              Select Ac.ID_Acreditado,'
      '                                     Ac.ID_Aval_Gob,'
      
        '                                     Ac.Importe                 ' +
        '                     Importe_Acred,'
      
        '                                     Av.Importe                 ' +
        '                     Importe_Aval,'
      
        '                                     Ac.Importe + Nvl (Av.Import' +
        'e, 0)                Importe,'
      
        '                                     Row_Number () Over (Order B' +
        'y Ac.Importe Desc)   Renglon'
      '                                From (Select ID_Acreditado,'
      '                                             ID_Aval_Gob,'
      
        '                                             Sum ((Nvl (Imp_Cap_' +
        'Vig, 0) +'
      
        '                                                   Nvl (Imp_Cap_' +
        'Imp, 0) +'
      
        '                                                   Nvl (Imp_Int_' +
        'Vig, 0) +'
      
        '                                                   Nvl (Imp_Int_' +
        'Imp, 0) '
      
        '                                                  ) * PkgCrConso' +
        'lidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda,  '
      
        '                                                                ' +
        '                                   '#39'D000'#39', '
      
        '                                                                ' +
        '                                   To_Char (:peFecha, '#39'YYYY'#39'),'
      
        '                                                                ' +
        '                                   To_Char (:peFecha, '#39'MM'#39')'
      
        '                                                                ' +
        '                                  )'
      
        '                                                 )              ' +
        '                                                                ' +
        '   Importe'
      
        '                                        From Table (PkgCrGpViews' +
        '.VW_CR_GP_Saldos_Edos_Mun (:peFecha, :peTipo_Entidad))'
      
        '                                       Group By ID_Acreditado, I' +
        'D_Aval_Gob  '
      '                                     ) Ac'
      
        '                                Left Outer Join (Select ID_Acred' +
        'itado,'
      
        '                                                        Sum ((Nv' +
        'l (Imp_Cap_Vig, 0) +'
      
        '                                                              Nv' +
        'l (Imp_Cap_Imp, 0) +'
      
        '                                                              Nv' +
        'l (Imp_Int_Vig, 0) +'
      
        '                                                              Nv' +
        'l (Imp_Int_Imp, 0) '
      
        '                                                             ) *' +
        ' PkgCrConsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda,  '
      
        '                                                                ' +
        '                                              '#39'D000'#39', '
      
        '                                                                ' +
        '                                              To_Char (:peFecha,' +
        ' '#39'YYYY'#39'),'
      
        '                                                                ' +
        '                                              To_Char (:peFecha,' +
        ' '#39'MM'#39')'
      
        '                                                                ' +
        '                                             )'
      
        '                                                            )   ' +
        '                                                                ' +
        '              Importe'
      
        '                                                   From Table (P' +
        'kgCrGpViews.VW_CR_GP_Saldos_Edos_Mun (:peFecha, :peTipo_Entidad)' +
        ')'
      
        '                                                  Group By ID_Ac' +
        'reditado'
      
        '                                                ) Av On Ac.ID_Av' +
        'al_Gob = Av.ID_Acreditado       '
      '                               Order By Renglon               '
      '                             )'
      '                       Where Renglon <= 5               '
      '                     ) Imp       '
      '       )'
      ' Order By Grupo, Orden              '
      ''
      '                  ')
    Left = 40
    Top = 188
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
        Name = 'peTipo_Entidad'
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
        Name = 'peTipo_Entidad'
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
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
    object QAcreditadosDesc_Grupo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Grupo'
      DisplayWidth = 10
      FieldName = 'Desc_Grupo'
      Size = 100
    end
    object QAcreditadosDesc_Concepto: TStringField
      DisplayLabel = 'Concepto'
      DisplayWidth = 43
      FieldName = 'Desc_Concepto'
      Size = 100
    end
    object QAcreditadosImporte: TFloatField
      DisplayLabel = 'Totales'
      DisplayWidth = 20
      FieldName = 'Importe'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QAcreditadosCumplimiento: TStringField
      Alignment = taCenter
      DisplayWidth = 12
      FieldName = 'Cumplimiento'
      Size = 10
    end
    object QAcreditadosGrupo: TFloatField
      FieldName = 'Grupo'
      Visible = False
    end
  end
  object QLeyendaEntidades: TQuery
    SQL.Strings = (
      
        'Select '#39'Incluye información: '#39' || InitCap (Replace (Replace (Nvl' +
        ' (:peTipo_Entidad, PkgCRGPViews.Todas_Entidades), '#39'ORG-DESC'#39', '#39'Ó' +
        'rganos descentralizados'#39'), '#39'|'#39', '#39', '#39')) Leyenda_Entidades'
      '  From Dual             ')
    Left = 70
    Top = 194
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
  end
end
