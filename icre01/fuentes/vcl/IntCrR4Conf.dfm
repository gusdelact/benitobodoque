object wCrR4Conf: TwCrR4Conf
  Left = 280
  Top = 120
  Width = 818
  Height = 594
  Caption = 'Configuración de Reportes R04'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPantalla: TPanel
    Left = 16
    Top = 16
    Width = 777
    Height = 529
    Caption = 'Editar Registro'
    TabOrder = 0
    object Label2: TLabel
      Left = 25
      Top = 357
      Width = 225
      Height = 13
      Caption = 'Claves de Operación relacionadas a la sección:'
    end
    object lblSeccion: TLabel
      Left = 256
      Top = 357
      Width = 3
      Height = 13
    end
    object PnDatos: TPanel
      Left = 1
      Top = 504
      Width = 775
      Height = 24
      Align = alBottom
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
        Left = 404
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
        Left = 404
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
        Left = 468
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
        Left = 468
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
    object GroupBox1: TGroupBox
      Left = 25
      Top = 20
      Width = 401
      Height = 49
      Caption = 'Seleccione'
      TabOrder = 1
      object Label1: TLabel
        Left = 107
        Top = 19
        Width = 41
        Height = 13
        Caption = 'Reporte:'
      end
      object dbCboTipoReporte: TDBLookupComboBox
        Left = 160
        Top = 16
        Width = 233
        Height = 21
        DropDownRows = 3
        KeyField = 'TIPO_REPORTE'
        ListField = 'DESCRIPCION_REPORTE'
        ListSource = dsTipoReporte
        TabOrder = 0
      end
    end
    object dbgConfiguracion: TDBGrid
      Left = 25
      Top = 72
      Width = 729
      Height = 281
      DataSource = dsConfiguracion
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgConfiguracionDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'CVE_CONCEPTO'
          Title.Caption = 'CONCEPTO'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Width = 376
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CVE_CLAS_CONTAB'
          Title.Caption = 'CLASIF. CONTAB'
          Width = 103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SECCION'
          Title.Caption = 'No. SECCIÓN'
          Width = 85
          Visible = True
        end>
    end
    object dbGrdOperacion: TDBGrid
      Left = 25
      Top = 372
      Width = 464
      Height = 117
      DataSource = dsOperacion
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CVE_OPERACION'
          Title.Caption = 'CVE. OPERACIÓN'
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_L_OPERACION'
          Title.Caption = 'DESCRIPCIÓN'
          Width = 325
          Visible = True
        end>
    end
    object btnEditar: TButton
      Left = 664
      Top = 354
      Width = 90
      Height = 25
      Caption = 'Editar Registro'
      TabOrder = 4
      OnClick = btnEditarClick
    end
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
    OnDespuesShow = InterForma1DespuesShow
    Left = 360
    Top = 8
  end
  object dsTipoReporte: TDataSource
    DataSet = cdsTipoReporte
    OnDataChange = dsTipoReporteDataChange
    Left = 400
    Top = 40
  end
  object cdsTipoReporte: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 432
    Top = 40
    object cdsTipoReporteTIPO_REPORTE: TIntegerField
      FieldName = 'TIPO_REPORTE'
    end
    object cdsTipoReporteDESCRIPCION_REPORTE: TStringField
      FieldName = 'DESCRIPCION_REPORTE'
      Size = 100
    end
  end
  object qryConfiguracion: TQuery
    SQL.Strings = (
      'SELECT CVE_CONCEPTO'
      '      ,CASE WHEN NIVEL = 0 THEN DESCRIPCION'
      '            WHEN NIVEL = 1 THEN '#39'     '#39' || DESCRIPCION'
      '            WHEN NIVEL = 2 THEN '#39'        '#39' || DESCRIPCION'
      '            WHEN NIVEL = 3 THEN '#39'           '#39' || DESCRIPCION'
      '            WHEN NIVEL = 4 THEN '#39'              '#39' || DESCRIPCION'
      
        '            WHEN NIVEL = 5 THEN '#39'                 '#39' || DESCRIPCI' +
        'ON'
      
        '            WHEN NIVEL = 6 THEN '#39'                    '#39' || DESCRI' +
        'PCION '
      '        END DESCRIPCION'
      '      ,CVE_CLAS_CONTAB'
      '      ,CONCEPTO'
      '      ,SECCION'
      '      ,ORDEN'
      '      ,NIVEL'
      '  FROM CR_R04A_MAPEO_REP'
      ' WHERE TIPO_REPORTE = :paTipoReporte'
      ' ORDER BY SECCION, ORDEN')
    Left = 520
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'paTipoReporte'
        ParamType = ptInput
      end>
  end
  object dsConfiguracion: TDataSource
    DataSet = qryConfiguracion
    OnDataChange = dsConfiguracionDataChange
    Left = 552
    Top = 56
  end
  object dsOperacion: TDataSource
    DataSet = qryOperacion
    Left = 632
    Top = 64
  end
  object qryOperacion: TQuery
    SQL.Strings = (
      'SELECT A.CVE_OPERACION'
      '       ,B.DESC_L_OPERACION'
      '   FROM CR_R04A_CAT_OPERA A'
      '       ,CR_OPERACION      B'
      '  WHERE A.TIPO_REPORTE = :paTipoReporte'
      '    AND A.CONCEPTO = :paConcepto'
      '    AND B.CVE_OPERACION = A.CVE_OPERACION   '
      '  ORDER BY DESC_C_OPERACION')
    Left = 600
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'paTipoReporte'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'paConcepto'
        ParamType = ptInput
      end>
  end
  object qrySeccion: TQuery
    SQL.Strings = (
      'SELECT DESCRIPCION'
      '   FROM CR_R04A_MAPEO_REP'
      '  WHERE TIPO_REPORTE = :paTipoReporte'
      '    AND SECCION      = :paSeccion'
      '    AND ORDEN = (    '
      ' SELECT MAX(ORDEN)'
      '   FROM CR_R04A_MAPEO_REP'
      '  WHERE TIPO_REPORTE = :paTipoReporte'
      '    AND SECCION      = :paSeccion'
      '    AND CVE_CLAS_CONTAB IS NULL)')
    Left = 528
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'paTipoReporte'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'paSeccion'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'paTipoReporte'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'paSeccion'
        ParamType = ptInput
      end>
  end
end
