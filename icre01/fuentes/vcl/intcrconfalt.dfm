object WCrConFaltantes: TWCrConFaltantes
  Left = 301
  Top = 197
  Width = 952
  Height = 395
  Caption = 'Registros con Configuración Faltante'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnDatos: TPanel
    Left = 4
    Top = 340
    Width = 936
    Height = 19
    TabOrder = 0
    object lbEmpresa: TLabel
      Left = 11
      Top = 2
      Width = 42
      Height = 8
      Caption = 'EMPRESA :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbUsuario: TLabel
      Left = 11
      Top = 9
      Width = 44
      Height = 8
      Caption = 'USUARIO : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbFecha: TLabel
      Left = 472
      Top = 2
      Width = 50
      Height = 8
      Caption = 'FECHA HOY :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbPerfil: TLabel
      Left = 472
      Top = 9
      Width = 33
      Height = 8
      Caption = 'PERFIL :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDUsuario: TLabel
      Left = 75
      Top = 9
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDPerfil: TLabel
      Left = 536
      Top = 9
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDFecha: TLabel
      Left = 536
      Top = 2
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDEmpresa: TLabel
      Left = 75
      Top = 2
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object sgcDATA: TSGCtrl
    Left = 1
    Top = 3
    Width = 939
    Height = 336
    HelpContext = 8000
    ShowTab = True
    TabOrder = 1
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
  end
  object InterForma1: TInterForma
    IsMain = True
    msgSinRegistros = 'No existe un Registro para realizar la operación.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = '¿Desea Eliminar el Registro Actual?'
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 866
    Top = 287
  end
  object Query1: TQuery
    DatabaseName = 'PCORP'
    SQL.Strings = (
      
        'SELECT CCGTD.CVE_MONEDA, CCGTD.CVE_CTA_CONTABLE, CCGTD.CVE_PRODU' +
        'CTO, CP.DESC_L_PRODUCTO, CCGTD.ID_CREDITO, CCGTD.ID_ACREDITADO, ' +
        'P.NOMBRE AS NOM_ACREDITADO, P.CVE_TIPO_SECTOR'
      'FROM ( SELECT FOL_GENERACION FROM CR_CONT_GEN_TRAN'
      '       WHERE F_OPERACION = TO_DATE('#39'25/11/2008'#39','#39'DD/MM/YYYY'#39')'
      '     ) CCGT,'
      '     CR_CONT_GEN_TR_D CCGTD,'
      '     PERSONA P,'
      '     CR_PRODUCTO CP'
      'WHERE CCGTD.FOL_GENERACION = CCGT.FOL_GENERACION'
      '  AND CCGTD.CVE_CTA_CONTABLE = '#39'9013000000'#39
      '  AND CP.CVE_PRODUCTO_CRE = CCGTD.CVE_PRODUCTO'
      '  AND P.ID_PERSONA = CCGTD.ID_ACREDITADO')
    Left = 810
    Top = 288
    object Query1CVE_CTA_CONTABLE: TStringField
      DisplayLabel = 'Cuenta Contable'
      DisplayWidth = 20
      FieldName = 'CVE_CTA_CONTABLE'
      Size = 24
    end
    object Query1CVE_MONEDA: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Moneda'
      DisplayWidth = 12
      FieldName = 'CVE_MONEDA'
    end
    object Query1CVE_PRODUCTO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Cve. Producto'
      DisplayWidth = 18
      FieldName = 'CVE_PRODUCTO'
      Size = 6
    end
    object Query1DESC_L_PRODUCTO: TStringField
      DisplayLabel = 'Producto'
      DisplayWidth = 87
      FieldName = 'DESC_L_PRODUCTO'
      Size = 80
    end
    object Query1ID_CREDITO: TFloatField
      DisplayLabel = 'No. Disposición'
      DisplayWidth = 15
      FieldName = 'ID_CREDITO'
    end
    object Query1ID_ACREDITADO: TFloatField
      DisplayLabel = 'Id. Acreditado'
      DisplayWidth = 18
      FieldName = 'ID_ACREDITADO'
    end
    object Query1NOM_ACREDITADO: TStringField
      DisplayLabel = 'Nom. Acreditado'
      DisplayWidth = 96
      FieldName = 'NOM_ACREDITADO'
      Size = 80
    end
    object Query1CVE_TIPO_SECTOR: TStringField
      Alignment = taCenter
      DisplayLabel = 'Sector'
      DisplayWidth = 9
      FieldName = 'CVE_TIPO_SECTOR'
      Size = 2
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = Query1
    Left = 838
    Top = 288
  end
end
