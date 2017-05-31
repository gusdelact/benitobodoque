object wMCapBasic: TwMCapBasic
  Left = 200
  Top = 205
  Width = 503
  Height = 226
  Caption = 'Capital Básico Trimestral'
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
  object Label1: TLabel
    Left = 121
    Top = 33
    Width = 76
    Height = 13
    Caption = 'Fecha Trimestre'
  end
  object Label2: TLabel
    Left = 121
    Top = 65
    Width = 67
    Height = 13
    Caption = 'Capital Básico'
  end
  object Label3: TLabel
    Left = 121
    Top = 97
    Width = 43
    Height = 13
    Caption = '% Básico'
  end
  object stpF_TRIMESTRE: TInterDateTimePicker
    Tag = 50
    Left = 353
    Top = 29
    Width = 21
    Height = 21
    HelpContext = 1001
    CalAlignment = dtaLeft
    Date = 38314.7913728472
    Time = 38314.7913728472
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
    OnExit = edF_TRIMESTREExit
    Edit = edF_TRIMESTRE
    Formato = dfDate
  end
  object edF_TRIMESTRE: TEdit
    Tag = 50
    Left = 257
    Top = 29
    Width = 97
    Height = 21
    HelpContext = 1000
    TabOrder = 0
    OnExit = edF_TRIMESTREExit
  end
  object edCAPITAL_BASICO: TInterEdit
    Tag = 18
    Left = 257
    Top = 61
    Width = 117
    Height = 21
    HelpContext = 1100
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edCAPITAL_BASICOExit
    MaxLength = 12
    TabOrder = 2
    CharCase = ecUpperCase
    UseReType = True
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edPCT_BASICO: TInterEdit
    Tag = 18
    Left = 257
    Top = 93
    Width = 117
    Height = 21
    HelpContext = 1200
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_BASICOExit
    DisplayMask = '###,###.####'
    MaxLength = 12
    TabOrder = 3
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object PnDatos: TPanel
    Left = 1
    Top = 166
    Width = 488
    Height = 21
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
      Left = 262
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
      Left = 262
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
      Left = 326
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
      Left = 326
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
  object PnlMsg: TPanel
    Left = 1
    Top = 144
    Width = 488
    Height = 22
    TabOrder = 5
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnBuscar = InterForma1Buscar
    msgSinRegistros = 'No existe un Registro para realizar la operación.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = '¿Desea Eliminar el Registro Actual?'
    FormaEstilo = feHorizontal
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 444
    Top = 6
  end
end
