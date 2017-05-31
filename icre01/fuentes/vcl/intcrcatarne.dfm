object WCrcatarne: TWCrcatarne
  Left = 429
  Top = 204
  Width = 480
  Height = 227
  Caption = 'Catálogo - Área de Negocio'
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
  object lbF_ALTA: TLabel
    Left = 14
    Top = 134
    Width = 54
    Height = 13
    Caption = 'Fecha Alta:'
  end
  object lbCVE_USU_ALTA: TLabel
    Left = 251
    Top = 134
    Width = 60
    Height = 13
    Caption = 'Usuario Alta:'
  end
  object lbF_MODIFICA: TLabel
    Left = 14
    Top = 170
    Width = 57
    Height = 13
    Caption = 'Fecha Mod:'
  end
  object lbCVE_USU_MODIFICA: TLabel
    Left = 251
    Top = 170
    Width = 63
    Height = 13
    Caption = 'Usuario Mod:'
  end
  object GroupBox2: TGroupBox
    Left = 1
    Top = 2
    Width = 470
    Height = 84
    Caption = 'Datos'
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 21
      Width = 27
      Height = 13
      Caption = 'Clave'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 14
      Top = 53
      Width = 56
      Height = 13
      Caption = 'Descripción'
      WordWrap = True
    end
    object edCLAVE: TInterEdit
      Tag = 18
      Left = 82
      Top = 16
      Width = 76
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 1
      Color = clBtnFace
      TabOrder = 0
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edDESC_CLAVE: TInterEdit
      Tag = 18
      Left = 82
      Top = 49
      Width = 365
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 200
      Color = clBtnFace
      TabOrder = 1
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object rgSITUACION: TRadioGroup
    Tag = 18
    Left = 1
    Top = 88
    Width = 470
    Height = 33
    HelpContext = 1400
    Caption = 'Situación'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Inactivo')
    TabOrder = 1
  end
  object edF_ALTA: TInterEdit
    Left = 83
    Top = 130
    Width = 76
    Height = 21
    HelpContext = 1100
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    MaxLength = 6
    Color = clBtnFace
    TabOrder = 2
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edF_MODIFICA: TInterEdit
    Left = 83
    Top = 166
    Width = 76
    Height = 21
    HelpContext = 1100
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    MaxLength = 6
    Color = clBtnFace
    TabOrder = 3
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edCVE_USU_ALTA: TInterEdit
    Left = 339
    Top = 130
    Width = 76
    Height = 21
    HelpContext = 1100
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    MaxLength = 6
    Color = clBtnFace
    TabOrder = 4
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edCVE_USU_MODIFICA: TInterEdit
    Left = 339
    Top = 166
    Width = 76
    Height = 21
    HelpContext = 1100
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    MaxLength = 6
    Color = clBtnFace
    TabOrder = 5
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnAntesAceptar = InterForma1AntesAceptar
    OnBuscar = InterForma1Buscar
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
    Left = 426
    Top = 2
  end
end
