object WCrCoCtDt: TWCrCoCtDt
  Left = 239
  Top = 250
  Width = 544
  Height = 230
  Caption = 'Catálogo de Tipos de Liquidacion'
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
    Left = 13
    Top = 47
    Width = 29
    Height = 13
    Caption = 'Grupo'
  end
  object Label2: TLabel
    Left = 14
    Top = 12
    Width = 27
    Height = 13
    Caption = 'Clave'
  end
  object Label3: TLabel
    Left = 14
    Top = 80
    Width = 56
    Height = 13
    Caption = 'Descripcion'
  end
  object Label4: TLabel
    Left = 14
    Top = 109
    Width = 53
    Height = 13
    Caption = 'Cve. Adic.*'
  end
  object edCVE_CON_GPO_CAT: TEdit
    Tag = 18
    Left = 53
    Top = 43
    Width = 123
    Height = 21
    HelpContext = 1200
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
    OnExit = edCVE_CON_GPO_CATExit
  end
  object edCVE_CLAVE: TEdit
    Tag = 18
    Left = 54
    Top = 7
    Width = 122
    Height = 21
    HelpContext = 1000
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnExit = edCVE_CLAVEExit
  end
  object edDESC_CLAVE: TEdit
    Tag = 18
    Left = 80
    Top = 73
    Width = 324
    Height = 21
    HelpContext = 3000
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 4
    OnExit = edDESC_CLAVEExit
  end
  object RGGpoCat: TRadioGroup
    Tag = 530
    Left = 188
    Top = 0
    Width = 214
    Height = 66
    HelpContext = 1100
    Items.Strings = (
      'Es Padre (CAT_TIPO_LIQUIDA)'
      'Es Hijo (CAT_TIPO_LQ_DET)')
    TabOrder = 1
    OnClick = RGGpoCatClick
    OnExit = RGGpoCatExit
  end
  object PnDatos: TPanel
    Left = 0
    Top = 173
    Width = 534
    Height = 21
    TabOrder = 3
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
      Left = 248
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
      Left = 248
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
      Left = 312
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
      Left = 312
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
  object edCVE_VALOR_ADIC: TEdit
    Tag = 18
    Left = 78
    Top = 102
    Width = 108
    Height = 21
    HelpContext = 4000
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 5
    OnExit = edCVE_VALOR_ADICExit
  end
  object MsgPanel: TPanel
    Left = -56
    Top = 154
    Width = 590
    Height = 20
    TabOrder = 6
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnAntesAceptar = InterForma1AntesAceptar
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
    Left = 338
    Top = 114
  end
end
