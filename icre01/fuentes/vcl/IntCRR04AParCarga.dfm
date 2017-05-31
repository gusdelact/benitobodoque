object wR4AParCga: TwR4AParCga
  Left = 295
  Top = 212
  Width = 436
  Height = 214
  Caption = 'Creación de Proceso R04A'
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
  object pnlEjecutaCarga: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 176
    Align = alClient
    TabOrder = 0
    object btnCrear: TSpeedButton
      Left = 24
      Top = 105
      Width = 73
      Height = 25
      Caption = 'Generar'
      OnClick = btnCrearClick
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 16
      Width = 385
      Height = 80
      Caption = 'Seleccione'
      TabOrder = 0
      object Label2: TLabel
        Left = 54
        Top = 21
        Width = 19
        Height = 13
        Caption = 'Año'
      end
      object Label3: TLabel
        Left = 57
        Top = 45
        Width = 20
        Height = 13
        Caption = 'Mes'
      end
      object edtAnio: TEdit
        Left = 88
        Top = 17
        Width = 65
        Height = 21
        MaxLength = 4
        TabOrder = 0
        OnKeyPress = edtAnioKeyPress
      end
      object dbCboMes: TDBLookupComboBox
        Left = 88
        Top = 41
        Width = 201
        Height = 21
        DropDownRows = 12
        DropDownWidth = 300
        KeyField = 'MES'
        ListField = 'DESCRIPCION_MES'
        ListSource = dsMes
        TabOrder = 1
      end
    end
    object PnDatos: TPanel
      Left = 0
      Top = 138
      Width = 416
      Height = 21
      TabOrder = 1
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
        Left = 256
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
        Left = 256
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
        Left = 320
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
        Left = 320
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
  end
  object dsTipoReporte: TDataSource
    DataSet = cdsTipoReporte
    Left = 272
    Top = 32
  end
  object cdsTipoReporte: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 32
    object cdsTipoReporteTIPO_REPORTE: TIntegerField
      FieldName = 'TIPO_REPORTE'
    end
    object cdsTipoReporteDESCRIPCION_REPORTE: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRIPCION_REPORTE'
      Size = 100
    end
  end
  object cdsMes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 96
    object cdsMesMES: TStringField
      FieldName = 'MES'
    end
    object cdsMesDESCRIPCION_MES: TStringField
      FieldName = 'DESCRIPCION_MES'
    end
  end
  object dsMes: TDataSource
    DataSet = cdsMes
    Left = 376
    Top = 96
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
    FormaEstilo = feVertical
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
    Left = 96
    Top = 8
  end
  object spCarga: TStoredProc
    StoredProcName = 'PKGCRREGULATORIOSR04.SP_CR_R04A_CARGA'
    Left = 112
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PEEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PEUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEPERIODO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PECOMMIT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PSRESPUESTA'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'PSDESCERROR'
        ParamType = ptOutput
      end>
  end
end
