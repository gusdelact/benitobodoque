object QrFiSoPa: TQrFiSoPa
  Left = 0
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  AfterPrint = QuickRepAfterPrint
  DataSet = qryQrFiSoPa
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
  object PageHeaderBand1: TQRBand
    Left = 48
    Top = 48
    Width = 960
    Height = 84
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
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
  object ColumnHeaderBand1: TQRBand
    Left = 48
    Top = 137
    Width = 960
    Height = 417
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      1103.3125
      2540)
    BandType = rbColumnHeader
    object QRShape1: TQRShape
      Left = 3
      Top = 146
      Width = 137
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        7.9375
        386.291666666667
        362.479166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlbIMP_CAPITAL: TQRLabel
      Left = 9
      Top = 153
      Width = 128
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        116.416666666667
        23.8125
        404.8125
        338.666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Capital'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape2: TQRShape
      Left = 138
      Top = 146
      Width = 137
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        365.125
        386.291666666667
        362.479166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblIMP_INTERES: TQRLabel
      Left = 142
      Top = 153
      Width = 128
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        116.416666666667
        375.708333333333
        404.8125
        338.666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Intereses Ordinarios'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape3: TQRShape
      Left = 274
      Top = 146
      Width = 137
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        724.958333333333
        386.291666666667
        362.479166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblIMP_MORATORIO: TQRLabel
      Left = 280
      Top = 153
      Width = 128
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        116.416666666667
        740.833333333333
        404.8125
        338.666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Intereses Moratorios'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape4: TQRShape
      Left = 410
      Top = 146
      Width = 137
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        1084.79166666667
        386.291666666667
        362.479166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblIMP_FND_RESERVA: TQRLabel
      Left = 416
      Top = 153
      Width = 128
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        116.416666666667
        1100.66666666667
        404.8125
        338.666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fondos de Reserva'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape5: TQRShape
      Left = 546
      Top = 146
      Width = 137
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        1444.625
        386.291666666667
        362.479166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblIMP_HONORARIOS: TQRLabel
      Left = 552
      Top = 153
      Width = 128
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        116.416666666667
        1460.5
        404.8125
        338.666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Honorarios Fideicomisario'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape6: TQRShape
      Left = 682
      Top = 146
      Width = 137
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        1804.45833333333
        386.291666666667
        362.479166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel6: TQRLabel
      Left = 688
      Top = 153
      Width = 128
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        116.416666666667
        1820.33333333333
        404.8125
        338.666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Diferencias por presentación Extemporánea'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape7: TQRShape
      Left = 818
      Top = 146
      Width = 137
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        2164.29166666667
        386.291666666667
        362.479166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlblTOTAL: TQRLabel
      Left = 824
      Top = 153
      Width = 128
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        116.416666666667
        2180.16666666667
        404.8125
        338.666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Total Requerido'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape8: TQRShape
      Left = 3
      Top = 123
      Width = 952
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        7.9375
        325.4375
        2518.83333333333)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object QRLabel8: TQRLabel
      Left = 9
      Top = 128
      Width = 942
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        23.8125
        338.666666666667
        2492.375)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'DESTINO DE LA CANTIDAD REQUERIDA'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrlblNOM_FIDEICOMISAR: TQRLabel
      Left = 8
      Top = 1
      Width = 186
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        21.1666666666667
        2.64583333333333
        492.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fideicomisario en Primer Lugar:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrlblNOM_FIDEICOMISO: TQRLabel
      Left = 8
      Top = 25
      Width = 186
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        21.1666666666667
        66.1458333333333
        492.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Nombre del FIDEICOMISO:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrlblSDO_INSOLUTO: TQRLabel
      Left = 8
      Top = 49
      Width = 186
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        21.1666666666667
        129.645833333333
        492.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Saldo Insoluto del Crédito:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrlblNUM_DIAS_PERIODO: TQRLabel
      Left = 8
      Top = 73
      Width = 186
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        21.1666666666667
        193.145833333333
        492.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Días del Periodo:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrlblNOM_INET: TQRLabel
      Left = 8
      Top = 97
      Width = 186
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        21.1666666666667
        256.645833333333
        492.125)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Depositar el Banco:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrdbNOM_FIDEICOMISAR: TQRDBText
      Left = 197
      Top = 1
      Width = 740
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        521.229166666667
        2.64583333333333
        1957.91666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'NOM_FIDEICOMISAR'
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
    object qrdbNOM_FIDEICOMISO: TQRDBText
      Left = 198
      Top = 25
      Width = 256
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        523.875
        66.1458333333333
        677.333333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'NOM_FIDEICOMISO'
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
    object qrdbSDO_INSOLUTO: TQRDBText
      Left = 198
      Top = 49
      Width = 256
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        523.875
        129.645833333333
        677.333333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'SDO_INSOLUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrdbNUM_DIAS_PERIODO: TQRDBText
      Left = 198
      Top = 73
      Width = 256
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        523.875
        193.145833333333
        677.333333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'NUM_DIAS_PERIODO'
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
    object qrdbNOM_INET: TQRDBText
      Left = 198
      Top = 97
      Width = 256
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        523.875
        256.645833333333
        677.333333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'NOM_INET'
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
    object qrlblNUM_FOL_ADHESION: TQRLabel
      Left = 480
      Top = 25
      Width = 218
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1270
        66.1458333333333
        576.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Número de Folio Adhesión:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrlblTASA_TOTAL: TQRLabel
      Left = 480
      Top = 49
      Width = 218
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1270
        129.645833333333
        576.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tasa de Interés Proyectada del Periodo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrlblF_VENCIMIENTO: TQRLabel
      Left = 480
      Top = 73
      Width = 218
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1270
        193.145833333333
        576.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha de Pago:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel17: TQRLabel
      Left = 480
      Top = 97
      Width = 218
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1270
        256.645833333333
        576.791666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'A la Cuenta Número:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrdbNUM_FOL_ADHESION: TQRDBText
      Left = 706
      Top = 25
      Width = 232
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1867.95833333333
        66.1458333333333
        613.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'NUM_FOL_ADHESION'
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
    object qrdbTASA_TOTAL: TQRDBText
      Left = 706
      Top = 49
      Width = 232
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1867.95833333333
        129.645833333333
        613.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'TASA_TOTAL'
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
    object qrdbF_VENCIMIENTO: TQRDBText
      Left = 706
      Top = 73
      Width = 232
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1867.95833333333
        193.145833333333
        613.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'F_VENCIMIENTO'
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
    object qrdbCUENTA_BANCO: TQRDBText
      Left = 706
      Top = 97
      Width = 232
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        1867.95833333333
        256.645833333333
        613.833333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'CUENTA_BANCO'
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
    object QRShape9: TQRShape
      Left = 3
      Top = 202
      Width = 137
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        7.9375
        534.458333333333
        362.479166666667)
      Shape = qrsRectangle
    end
    object QRShape10: TQRShape
      Left = 138
      Top = 202
      Width = 137
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        365.125
        534.458333333333
        362.479166666667)
      Shape = qrsRectangle
    end
    object QRShape11: TQRShape
      Left = 274
      Top = 202
      Width = 137
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        724.958333333333
        534.458333333333
        362.479166666667)
      Shape = qrsRectangle
    end
    object QRShape12: TQRShape
      Left = 410
      Top = 202
      Width = 137
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        1084.79166666667
        534.458333333333
        362.479166666667)
      Shape = qrsRectangle
    end
    object QRShape13: TQRShape
      Left = 546
      Top = 202
      Width = 137
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        1444.625
        534.458333333333
        362.479166666667)
      Shape = qrsRectangle
    end
    object QRShape14: TQRShape
      Left = 682
      Top = 202
      Width = 137
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        1804.45833333333
        534.458333333333
        362.479166666667)
      Shape = qrsRectangle
    end
    object QRShape15: TQRShape
      Left = 818
      Top = 202
      Width = 137
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.8125
        2164.29166666667
        534.458333333333
        362.479166666667)
      Shape = qrsRectangle
    end
    object QRShape16: TQRShape
      Left = 3
      Top = 269
      Width = 952
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        7.9375
        711.729166666667
        2518.83333333333)
      Shape = qrsRectangle
    end
    object QRShape17: TQRShape
      Left = 3
      Top = 302
      Width = 952
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.5
        7.9375
        799.041666666667
        2518.83333333333)
      Shape = qrsRectangle
    end
    object QRLabel9: TQRLabel
      Left = 9
      Top = 273
      Width = 942
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        23.8125
        722.3125
        2492.375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Entrega de la Cantidad Límite'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel10: TQRLabel
      Left = 9
      Top = 306
      Width = 942
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        23.8125
        809.625
        2492.375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 
        'Detalle de la Aplicación de los Recursos para el Periodo Anterio' +
        'r'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape18: TQRShape
      Left = 546
      Top = 335
      Width = 137
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        1444.625
        886.354166666667
        362.479166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlbIMP_CAP_ACEL: TQRLabel
      Left = 552
      Top = 339
      Width = 128
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1460.5
        896.9375
        338.666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Capital'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape19: TQRShape
      Left = 682
      Top = 335
      Width = 137
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        1804.45833333333
        886.354166666667
        362.479166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlbIMP_MOR_ACEL: TQRLabel
      Left = 688
      Top = 339
      Width = 128
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        1820.33333333333
        896.9375
        338.666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Intereses Moratorios'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape20: TQRShape
      Left = 818
      Top = 335
      Width = 137
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.7916666666667
        2164.29166666667
        886.354166666667
        362.479166666667)
      Brush.Color = clSilver
      Shape = qrsRectangle
    end
    object qrlbIMP_SDO_INS_ACEL: TQRLabel
      Left = 824
      Top = 339
      Width = 128
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.9166666666667
        2180.16666666667
        896.9375
        338.666666666667)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Saldo Insoluto'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape21: TQRShape
      Left = 546
      Top = 360
      Width = 137
      Height = 49
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        129.645833333333
        1444.625
        952.5
        362.479166666667)
      Shape = qrsRectangle
    end
    object QRShape22: TQRShape
      Left = 682
      Top = 360
      Width = 137
      Height = 49
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        129.645833333333
        1804.45833333333
        952.5
        362.479166666667)
      Shape = qrsRectangle
    end
    object QRShape23: TQRShape
      Left = 818
      Top = 360
      Width = 137
      Height = 49
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        129.645833333333
        2164.29166666667
        952.5
        362.479166666667)
      Shape = qrsRectangle
    end
    object qrdbIMP_CAPITAL: TQRDBText
      Left = 9
      Top = 227
      Width = 126
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        23.8125
        600.604166666667
        333.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'IMP_CAPITAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrdbIMP_INTERES: TQRDBText
      Left = 144
      Top = 227
      Width = 126
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        381
        600.604166666667
        333.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'IMP_INTERES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrdbIMP_MORATORIO: TQRDBText
      Left = 280
      Top = 227
      Width = 126
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        740.833333333333
        600.604166666667
        333.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'IMP_MORATORIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrdbIMP_FND_RESERVA: TQRDBText
      Left = 417
      Top = 227
      Width = 126
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1103.3125
        600.604166666667
        333.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'IMP_FND_RESERVA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrdbIMP_DIF_EXTEMP: TQRDBText
      Left = 689
      Top = 227
      Width = 126
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1822.97916666667
        600.604166666667
        333.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'IMP_DIF_EXTEMP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrdbIMP_HONORARIOS: TQRDBText
      Left = 552
      Top = 227
      Width = 126
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1460.5
        600.604166666667
        333.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'IMP_HONORARIOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrdbTOTAL: TQRDBText
      Left = 825
      Top = 227
      Width = 126
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2182.8125
        600.604166666667
        333.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrdbIMP_CAP_ACEL: TQRDBText
      Left = 552
      Top = 379
      Width = 126
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1460.5
        1002.77083333333
        333.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'IMP_CAP_ACEL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrdbIMP_MOR_ACEL: TQRDBText
      Left = 689
      Top = 379
      Width = 126
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1822.97916666667
        1002.77083333333
        333.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'IMP_MOR_ACEL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrdbIMP_SDO_INS_ACEL: TQRDBText
      Left = 825
      Top = 379
      Width = 126
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        2182.8125
        1002.77083333333
        333.375)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'IMP_SDO_INS_ACEL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '###,###,###,###,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object TitleBand1: TQRBand
    Left = 48
    Top = 132
    Width = 960
    Height = 5
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
      13.2291666666667
      2540)
    BandType = rbTitle
  end
  object qrDetail: TQRBand
    Left = 48
    Top = 590
    Width = 960
    Height = 5
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
      13.2291666666667
      2540)
    BandType = rbDetail
  end
  object qrGrpIndice1: TQRGroup
    Left = 48
    Top = 554
    Width = 960
    Height = 18
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
      47.625
      2540)
    Expression = 'qryQrFiSoPa.INDICE'
    FooterBand = qrFootIndice1
    Master = Owner
    ReprintOnNewPage = False
    object qrdbNOMBRE_1: TQRDBText
      Left = 4
      Top = 1
      Width = 200
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        10.5833333333333
        2.64583333333333
        529.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'NOMBRE_1'
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
    object qrdbNOMBRE_2: TQRDBText
      Left = 213
      Top = 1
      Width = 200
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        563.5625
        2.64583333333333
        529.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'NOMBRE_2'
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
    object qrdbNOMBRE_3: TQRDBText
      Left = 421
      Top = 1
      Width = 200
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1113.89583333333
        2.64583333333333
        529.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'NOMBRE_3'
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
    object qrdbNOMBRE_4: TQRDBText
      Left = 629
      Top = 1
      Width = 200
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1664.22916666667
        2.64583333333333
        529.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'NOMBRE_4'
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
  object qrFootIndice2: TQRBand
    Left = 48
    Top = 595
    Width = 960
    Height = 5
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
      13.2291666666667
      2540)
    BandType = rbGroupFooter
  end
  object qrFootIndice1: TQRBand
    Left = 48
    Top = 600
    Width = 960
    Height = 5
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
      13.2291666666667
      2540)
    BandType = rbGroupFooter
  end
  object qrGrpIndice2: TQRGroup
    Left = 48
    Top = 572
    Width = 960
    Height = 18
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
      47.625
      2540)
    Expression = 'qryQrFiSoPa.INDICE'
    FooterBand = qrFootIndice2
    Master = Owner
    ReprintOnNewPage = False
    object qrdbPUESTO_1: TQRDBText
      Left = 4
      Top = 1
      Width = 200
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        10.5833333333333
        2.64583333333333
        529.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'PUESTO_1'
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
    object qrdbPUESTO_2: TQRDBText
      Left = 213
      Top = 1
      Width = 200
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        563.5625
        2.64583333333333
        529.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'PUESTO_2'
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
    object qrdbPUESTO_3: TQRDBText
      Left = 421
      Top = 1
      Width = 200
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1113.89583333333
        2.64583333333333
        529.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'PUESTO_3'
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
    object qrdbPUESTO_4: TQRDBText
      Left = 629
      Top = 1
      Width = 200
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        1664.22916666667
        2.64583333333333
        529.166666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'PUESTO_4'
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
  object QRBand1: TQRBand
    Left = 48
    Top = 605
    Width = 960
    Height = 102
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
      269.875
      2540)
    BandType = rbPageFooter
    object QRLabel1: TQRLabel
      Left = 9
      Top = 6
      Width = 175
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        23.8125
        15.875
        463.020833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'Fideicomisario en Primer Lugar'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel2: TQRLabel
      Left = 9
      Top = 54
      Width = 223
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        23.8125
        142.875
        590.020833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'Original: Fideicomisario en Primer Lugar'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel3: TQRLabel
      Left = 9
      Top = 70
      Width = 91
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        23.8125
        185.208333333333
        240.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'Copia: Fiduciario'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel4: TQRLabel
      Left = 9
      Top = 86
      Width = 120
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        23.8125
        227.541666666667
        317.5)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'Copia: Fideicomitente'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText1: TQRDBText
      Left = 8
      Top = 21
      Width = 740
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.5625
        21.1666666666667
        55.5625
        1957.91666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = qryQrFiSoPa
      DataField = 'NOM_FIDEICOMISAR'
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
    object QRLabel5: TQRLabel
      Left = 545
      Top = 6
      Width = 183
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.6875
        1441.97916666667
        15.875
        484.1875)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'Fecha de Recepción de Fiduciario'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object qryQrFiSoPa: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'SELECT DATOS.*,'
      '       PER_INTERES.TASA_APLICADA + TASA_ESTIMADA AS TASA_TOTAL,'
      '       (NVL(IMP_CAPITAL,0)+NVL(IMP_INTERES,0)+'
      
        '        NVL(IMP_MORATORIO,0)+NVL(IMP_FND_RESERVA,0)+NVL(IMP_HONO' +
        'RARIOS,0)+NVL(IMP_DIF_EXTEMP,0))TOTAL,'
      '       DELEGADOS.*'
      '  FROM (SELECT SOLICITUD_PAGO.*, I.NOM_INET'
      
        '          FROM (SELECT CFSP.NOM_FIDEICOMISAR, CFM.NUM_FOL_ADHESI' +
        'ON AS NOM_FIDEICOMISO,'
      
        '                       CFSP.NUM_FOL_FIDEICOM AS NUM_FOL_ADHESION' +
        ','
      
        '                       CFSP.SDO_INSOLUTO    , CFSP.TASA_ESTIMADA' +
        '   ,'
      
        '                       CFSP.NUM_DIAS_PERIODO, CFM.CUENTA_BANCO  ' +
        '   ,'
      
        '                       CFSP.ID_INTERMEDIARIO, CFSP.IMP_CAPITAL  ' +
        '   ,'
      
        '                       (NVL(CFSP.IMP_INTERES,0) + NVL(CFSP.IMP_I' +
        'NTERES_EST,0)) AS IMP_INTERES,'
      
        '                       CFSP.IMP_MORATORIO   , CFSP.IMP_FND_RESER' +
        'VA ,'
      
        '                       CFSP.IMP_HONORARIOS  , CFSP.IMP_DIF_EXTEM' +
        'P  ,'
      
        '                       CFSP.IMP_CAP_ACEL    , CFSP.IMP_MOR_ACEL ' +
        '   ,'
      '                       CFSP.IMP_SDO_INS_ACEL, CFSP.F_VENCIMIENTO'
      
        '                  FROM ( SELECT CR_FID_SOL_PAGO.*, CA.F_VENCIMIE' +
        'NTO, CC.NUM_FOL_FIDEICOM'
      '                         FROM CR_FID_SOL_PAGO,'
      '                              CR_CAPITAL CA,'
      '                              CR_CREDITO CC'
      
        '                         WHERE CA.ID_CREDITO = CR_FID_SOL_PAGO.I' +
        'D_CREDITO'
      
        '                           AND CA.NUM_PERIODO = CR_FID_SOL_PAGO.' +
        'NUM_PERIODO'
      
        '                           AND CC.ID_CREDITO = CR_FID_SOL_PAGO.I' +
        'D_CREDITO) CFSP ,'
      '                       CR_FID_REL_DISP CFRD,'
      '                       CR_FID_MAESTRO CFM'
      '                 WHERE CFSP.ID_FID_SOL_PAGO = 3'
      '                   AND CFRD.ID_CREDITO = CFSP.ID_CREDITO'
      '                   AND CFM.ID_FID_MAESTRO = CFRD.ID_FID_MAESTRO'
      '               )SOLICITUD_PAGO, INTERMEDIARIO I'
      
        '         WHERE I.ID_INTERMEDIARIO (+)= SOLICITUD_PAGO.ID_INTERME' +
        'DIARIO'
      '       )DATOS,'
      '       (   SELECT CI.ID_CREDITO, CI.TASA_APLICADA'
      '           FROM CR_INTERES CI,'
      
        '                ( SELECT CI.ID_CREDITO, MAX(CI.NUM_PERIODO) AS M' +
        'AX_NUM_PERIODO'
      '                  FROM CR_INTERES CI,'
      '                       ( SELECT  CA.ID_CREDITO,'
      '                               (F_VENCIMIENTO - PLAZO) AS F_INI,'
      '                                F_VENCIMIENTO AS F_FIN'
      '                         FROM CR_CAPITAL CA,'
      '                           ( SELECT * FROM CR_FID_SOL_PAGO'
      '                              WHERE ID_FID_SOL_PAGO = 3'
      '                            ) CFSP'
      '                         WHERE CA.ID_CREDITO = CFSP.ID_CREDITO'
      '                          AND CA.NUM_PERIODO = CFSP.NUM_PERIODO'
      '                      ) CA'
      '                  WHERE CA.ID_CREDITO = CI.ID_CREDITO'
      
        '                    AND CI.F_VENCIMIENTO BETWEEN CA.F_INI AND CA' +
        '.F_FIN'
      '                  GROUP BY CI.ID_CREDITO'
      '                ) TEMP'
      '          WHERE CI.ID_CREDITO = TEMP.ID_CREDITO'
      '            AND CI.NUM_PERIODO = TEMP.MAX_NUM_PERIODO'
      '       ) PER_INTERES,'
      '       (SELECT TRUNC((REGISTRO+3)/4) INDICE,'
      
        '               MAX(DECODE( MOD(REGISTRO,4) ,1, NOM_DELEGADO, '#39' '#39 +
        ')) NOMBRE_1,'
      
        '               MAX(DECODE( MOD(REGISTRO,4) ,1, TX_PUESTO, '#39' '#39')) ' +
        'PUESTO_1,'
      
        '               MAX(DECODE( MOD(REGISTRO,4) ,2, NOM_DELEGADO, '#39' '#39 +
        ')) NOMBRE_2,'
      
        '               MAX(DECODE( MOD(REGISTRO,4) ,2, TX_PUESTO, '#39' '#39')) ' +
        'PUESTO_2,'
      
        '               MAX(DECODE( MOD(REGISTRO,4) ,3, NOM_DELEGADO, '#39' '#39 +
        ')) NOMBRE_3,'
      
        '               MAX(DECODE( MOD(REGISTRO,4) ,3, TX_PUESTO, '#39' '#39')) ' +
        'PUESTO_3,'
      
        '               MAX(DECODE( MOD(REGISTRO,4) ,0, NOM_DELEGADO, '#39' '#39 +
        ')) NOMBRE_4,'
      
        '               MAX(DECODE( MOD(REGISTRO,4) ,0, TX_PUESTO, '#39' '#39')) ' +
        'PUESTO_4'
      '          FROM '
      '       (SELECT ROWNUM AS REGISTRO,'
      
        '               SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2( NULL, NUL' +
        'L,'
      
        '               CFD.ID_PERSONA), 1, 255) AS NOM_DELEGADO, '#39'DELEGA' +
        'DO FIDUCIARIO'#39' AS TX_PUESTO'
      '          FROM CR_FID_SOL_PAGO CFSP,'
      '               CR_FID_REL_DISP CFRDISP,'
      '               ( SELECT * FROM CR_FID_REL_DEL'
      '                 WHERE SIT_FID_REL_DEL <> '#39'CA'#39' )  CFRDEL,'
      '               ( SELECT * FROM CR_FID_DELEGADO'
      '                 WHERE SIT_FID_DELEGADO <> '#39'CA'#39' ) CFD'
      '          WHERE CFSP.ID_FID_SOL_PAGO = 3'
      '            AND CFRDISP.ID_CREDITO = CFSP.ID_CREDITO'
      '            AND CFRDEL.ID_FID_MAESTRO = CFRDISP.ID_FID_MAESTRO'
      '            AND CFD.ID_PERSONA = CFRDEL.ID_PERSONA'
      '          ORDER BY NOM_DELEGADO       '
      '       )'
      '         GROUP BY TRUNC((REGISTRO+3)/4)'
      '        )DELEGADOS')
    Left = 18
    Top = 9
    object qryQrFiSoPaNOM_FIDEICOMISAR: TStringField
      FieldName = 'NOM_FIDEICOMISAR'
      Size = 250
    end
    object qryQrFiSoPaNOM_FIDEICOMISO: TStringField
      FieldName = 'NOM_FIDEICOMISO'
      Size = 80
    end
    object qryQrFiSoPaNUM_FOL_ADHESION: TStringField
      FieldName = 'NUM_FOL_ADHESION'
    end
    object qryQrFiSoPaSDO_INSOLUTO: TFloatField
      FieldName = 'SDO_INSOLUTO'
    end
    object qryQrFiSoPaTASA_ESTIMADA: TFloatField
      FieldName = 'TASA_ESTIMADA'
    end
    object qryQrFiSoPaNUM_DIAS_PERIODO: TFloatField
      FieldName = 'NUM_DIAS_PERIODO'
    end
    object qryQrFiSoPaCUENTA_BANCO: TStringField
      FieldName = 'CUENTA_BANCO'
    end
    object qryQrFiSoPaID_INTERMEDIARIO: TFloatField
      FieldName = 'ID_INTERMEDIARIO'
    end
    object qryQrFiSoPaIMP_CAPITAL: TFloatField
      FieldName = 'IMP_CAPITAL'
    end
    object qryQrFiSoPaIMP_INTERES: TFloatField
      FieldName = 'IMP_INTERES'
    end
    object qryQrFiSoPaIMP_MORATORIO: TFloatField
      FieldName = 'IMP_MORATORIO'
    end
    object qryQrFiSoPaIMP_FND_RESERVA: TFloatField
      FieldName = 'IMP_FND_RESERVA'
    end
    object qryQrFiSoPaIMP_HONORARIOS: TFloatField
      FieldName = 'IMP_HONORARIOS'
    end
    object qryQrFiSoPaIMP_DIF_EXTEMP: TFloatField
      FieldName = 'IMP_DIF_EXTEMP'
    end
    object qryQrFiSoPaIMP_CAP_ACEL: TFloatField
      FieldName = 'IMP_CAP_ACEL'
    end
    object qryQrFiSoPaIMP_MOR_ACEL: TFloatField
      FieldName = 'IMP_MOR_ACEL'
    end
    object qryQrFiSoPaIMP_SDO_INS_ACEL: TFloatField
      FieldName = 'IMP_SDO_INS_ACEL'
    end
    object qryQrFiSoPaF_VENCIMIENTO: TDateTimeField
      FieldName = 'F_VENCIMIENTO'
    end
    object qryQrFiSoPaNOM_INET: TStringField
      FieldName = 'NOM_INET'
      Size = 80
    end
    object qryQrFiSoPaTASA_TOTAL: TFloatField
      FieldName = 'TASA_TOTAL'
    end
    object qryQrFiSoPaTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object qryQrFiSoPaINDICE: TFloatField
      FieldName = 'INDICE'
    end
    object qryQrFiSoPaNOMBRE_1: TStringField
      FieldName = 'NOMBRE_1'
      Size = 255
    end
    object qryQrFiSoPaPUESTO_1: TStringField
      FieldName = 'PUESTO_1'
      Size = 19
    end
    object qryQrFiSoPaNOMBRE_2: TStringField
      FieldName = 'NOMBRE_2'
      Size = 255
    end
    object qryQrFiSoPaPUESTO_2: TStringField
      FieldName = 'PUESTO_2'
      Size = 19
    end
    object qryQrFiSoPaNOMBRE_3: TStringField
      FieldName = 'NOMBRE_3'
      Size = 255
    end
    object qryQrFiSoPaPUESTO_3: TStringField
      FieldName = 'PUESTO_3'
      Size = 19
    end
    object qryQrFiSoPaNOMBRE_4: TStringField
      FieldName = 'NOMBRE_4'
      Size = 255
    end
    object qryQrFiSoPaPUESTO_4: TStringField
      FieldName = 'PUESTO_4'
      Size = 19
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.SQL'
    Filter = 'SQL File|*.SQL'
    Left = 54
    Top = 9
  end
end
