object FCrReAcBu: TFCrReAcBu
  Left = 216
  Top = 224
  Width = 936
  Height = 283
  Caption = 'Seleccionar Contrato'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgSelecionar: TDBGrid
    Left = 3
    Top = 3
    Width = 921
    Height = 210
    DataSource = DataSource
    FixedColor = clYellow
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgSelecionarDblClick
  end
  object btnAceptar: TBitBtn
    Left = 774
    Top = 219
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    TabOrder = 1
    OnClick = btnAceptarClick
    Kind = bkYes
  end
  object btnCancela: TBitBtn
    Left = 851
    Top = 219
    Width = 74
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 2
    OnClick = btnCancelaClick
    Kind = bkCancel
  end
  object Query: TQuery
    SQL.Strings = (
      ' SELECT CO.ID_CONTRATO,'
      '        CO.FOL_CONTRATO,'
      '        CTO.ID_TITULAR,'
      '        CO.CVE_PRODUCTO_CRE,'
      '        CP.DESC_C_PRODUCTO,'
      '        CO.IMP_AUTORIZADO,'
      '        CTO.NOMB_CONTRATO,'
      '        CO.CVE_MONEDA,'
      '        '#39' '#39' AS CVE_FND_ENT_DES,'
      '        '#39' '#39' AS CVE_EMISOR_EXT'
      ' FROM CR_PRODUCTO CP,'
      '      CR_CONTRATO CO,'
      '      CONTRATO CTO'
      ' WHERE CTO.ID_TITULAR = 1696'
      '   AND CO.ID_CONTRATO = CTO.ID_CONTRATO '
      '   AND CO.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE'
      ''
      'UNION ALL'
      ''
      ' SELECT CTO.ID_CONTRATO, '
      '        CO.FOL_CONTRATO, '
      '        CTO.ID_TITULAR,'
      '        CO.CVE_PRODUCTO_CRE, '
      '        CP.DESC_C_PRODUCTO,'
      '        CO.IMP_AUTORIZADO,'
      '        CTO.NOMB_CONTRATO,'
      '        CO.CVE_MONEDA,'
      '        CE.CVE_FND_ENT_DES,'
      '        CE.CVE_EMISOR_EXT'
      '  FROM CR_REL_EMI_CTO CREC,'
      '       CONTRATO CTO,'
      '       CR_CONTRATO CO,'
      '       CR_PRODUCTO CP,'
      '       CR_EMISOR CE'
      '  WHERE CREC.ID_EMISOR = 1696'
      '    AND CTO.ID_CONTRATO = CREC.ID_CONTRATO_REL '
      '    AND CO.ID_CONTRATO = CTO.ID_CONTRATO'
      '    AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE'
      '    AND CE.ID_ACREDITADO = CTO.ID_TITULAR')
    Left = 12
    Top = 162
    object QueryID_CONTRATO: TFloatField
      DisplayLabel = 'No. Autorizacion'
      DisplayWidth = 10
      FieldName = 'ID_CONTRATO'
    end
    object QueryFOL_CONTRATO: TFloatField
      DisplayLabel = 'Folio'
      DisplayWidth = 4
      FieldName = 'FOL_CONTRATO'
    end
    object QueryID_TITULAR: TFloatField
      DisplayLabel = 'Emisor'
      DisplayWidth = 8
      FieldName = 'ID_TITULAR'
    end
    object QueryCVE_PRODUCTO_CRE: TStringField
      Alignment = taCenter
      DisplayLabel = 'Cve. Producto'
      DisplayWidth = 8
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 6
    end
    object QueryDESC_C_PRODUCTO: TStringField
      DisplayLabel = 'Producto'
      DisplayWidth = 18
      FieldName = 'DESC_C_PRODUCTO'
      Size = 30
    end
    object QueryIMP_AUTORIZADO: TFloatField
      DisplayLabel = 'Imp. Autorizado'
      DisplayWidth = 15
      FieldName = 'IMP_AUTORIZADO'
      DisplayFormat = '###,###,###,##0.00'
      EditFormat = '###,###,###,##0.00'
    end
    object QueryNOMB_CONTRATO: TStringField
      DisplayLabel = 'Acreditado/Emisor'
      DisplayWidth = 37
      FieldName = 'NOMB_CONTRATO'
      Size = 80
    end
    object QueryCVE_MONEDA: TFloatField
      DisplayLabel = 'Moneda'
      DisplayWidth = 7
      FieldName = 'CVE_MONEDA'
    end
    object QueryCVE_FND_ENT_DES: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ent. Descontadora'
      DisplayWidth = 11
      FieldName = 'CVE_FND_ENT_DES'
      Size = 10
    end
    object QueryCVE_EMISOR_EXT: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cve. Emisor Ext.'
      DisplayWidth = 10
      FieldName = 'CVE_EMISOR_EXT'
      Size = 6
    end
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 40
    Top = 162
  end
end
