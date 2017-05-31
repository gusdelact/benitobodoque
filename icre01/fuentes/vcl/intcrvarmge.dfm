object WCrVarMge: TWCrVarMge
  Left = 380
  Top = 158
  Width = 361
  Height = 248
  Caption = 'Reporte Variación de Margen'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 8
    Width = 108
    Height = 13
    Caption = 'Mes / Año a consultar:'
  end
  object btnExcel: TSpeedButton
    Left = 300
    Top = 4
    Width = 23
    Height = 25
    Hint = 'Enviar a excel la información'
    Glyph.Data = {
      66010000424D6601000000000000760000002800000014000000140000000100
      040000000000F000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888F00008888888888888888888F00008222222222222222288F00008222
      222222222222288F0000822FFFFFFFFFFFF2288F0000822FFFFFFF222222288F
      0000822F2222222F2222288F0000822F222222F222F2288F0000822F22222F22
      22F2288F0000822FF222F22222F2288F0000822FFF2F2222FFF2288F0000822F
      F2F222222FF2288F0000822F2F22222222F2288F0000822F22222F2222F2288F
      0000822F2222FFF222F2288F0000822FFFFFFFFFFFF2288F0000822222222222
      2222288F00008222222222222222288F00008888888888888888888F0000FFFF
      FFFFFFFFFFFFFFFF0000}
    ParentShowHint = False
    ShowHint = True
    OnClick = btnExcelClick
  end
  object rgTipoReporte: TRadioGroup
    Left = 32
    Top = 28
    Width = 293
    Height = 105
    Caption = 'Tipo de Reporte'
    ItemIndex = 0
    Items.Strings = (
      'Consulta de acreditados nuevos en el mes.'
      'Consulta de acreditados liquidados en el mes anterior.'
      'Consulta de intereses devengado en el bimestre.')
    TabOrder = 0
    OnClick = rgTipoReporteClick
  end
  object dtpFechaReporte: TDateTimePicker
    Left = 193
    Top = 5
    Width = 22
    Height = 21
    CalAlignment = dtaLeft
    Date = 38463
    Time = 38463
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
    OnCloseUp = dtpFechaReporteCloseUp
  end
  object edFecha: TInterEdit
    Left = 142
    Top = 5
    Width = 51
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    DisplayMask = '  /    '
    MaxLength = 10
    TabOrder = 2
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object ProgressBarA: TProgressBar
    Left = 32
    Top = 119
    Width = 285
    Height = 13
    Anchors = [akLeft, akRight, akBottom]
    Min = 0
    Max = 100
    TabOrder = 3
    Visible = False
  end
  object PnDatos: TPanel
    Left = 0
    Top = 178
    Width = 353
    Height = 35
    TabOrder = 4
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
      Left = 11
      Top = 17
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
      Left = 11
      Top = 24
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
      Left = 63
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
      Left = 63
      Top = 24
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
      Left = 63
      Top = 17
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
      Left = 63
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
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnImprimir = InterForma1Imprimir
    OnPreview = InterForma1Preview
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
    Left = 253
    Top = 2
  end
  object qryEnviaExcel: TQuery
    DatabaseName = 'BCORP'
    SQL.Strings = (
      
        'select 0 AS ID_TITULAR,  '#39'a'#39' AS NOMBRE,     0 AS CVE_MONEDA,    ' +
        ' '
      '          '#39'a'#39' AS CVE_PRODUCTO_CRE, '
      
        '          0 AS ID_CONTRATO, 0 AS ID_CREDITO,  '#39'a'#39' AS CVE_TASA_RE' +
        'FER, '
      '          '#39'0.00'#39' AS IMP_CAP_VIG1, '
      '          '#39'0.00'#39' AS IMP_INTERES_DIA1,  '
      '          '#39'0.00'#39' AS TASA_PROMEDIO1,'
      '          '#39'0.00'#39' AS IMP_CAP_VIG2, '
      '          '#39'0.00'#39' AS IMP_INTERES_DIA2,'
      '          '#39'0.00'#39' AS TASA_PROMEDIO2,'
      '          '#39'0.00'#39' AS TASAVARIACION,'
      '          '#39'0.00'#39' AS VARIACION'
      'from dual')
    Left = 216
    Top = 2
    object qryEnviaExcelID_TITULAR: TFloatField
      FieldName = 'ID_TITULAR'
    end
    object qryEnviaExcelNOMBRE: TStringField
      FieldName = 'NOMBRE'
      FixedChar = True
      Size = 1
    end
    object qryEnviaExcelCVE_MONEDA: TFloatField
      FieldName = 'CVE_MONEDA'
    end
    object qryEnviaExcelID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
    object qryEnviaExcelCVE_TASA_REFER: TStringField
      FieldName = 'CVE_TASA_REFER'
      FixedChar = True
      Size = 1
    end
    object qryEnviaExcelIMP_CAP_VIG1: TStringField
      FieldName = 'IMP_CAP_VIG1'
      FixedChar = True
      Size = 4
    end
    object qryEnviaExcelIMP_INTERES_DIA1: TStringField
      FieldName = 'IMP_INTERES_DIA1'
      FixedChar = True
      Size = 4
    end
    object qryEnviaExcelTASA_PROMEDIO1: TStringField
      FieldName = 'TASA_PROMEDIO1'
      FixedChar = True
      Size = 4
    end
    object qryEnviaExcelIMP_CAP_VIG2: TStringField
      FieldName = 'IMP_CAP_VIG2'
      FixedChar = True
      Size = 4
    end
    object qryEnviaExcelIMP_INTERES_DIA2: TStringField
      FieldName = 'IMP_INTERES_DIA2'
      FixedChar = True
      Size = 4
    end
    object qryEnviaExcelTASA_PROMEDIO2: TStringField
      FieldName = 'TASA_PROMEDIO2'
      FixedChar = True
      Size = 4
    end
    object qryEnviaExcelTASAVARIACION: TStringField
      FieldName = 'TASAVARIACION'
      FixedChar = True
      Size = 4
    end
    object qryEnviaExcelVARIACION: TStringField
      FieldName = 'VARIACION'
      FixedChar = True
      Size = 4
    end
  end
end
