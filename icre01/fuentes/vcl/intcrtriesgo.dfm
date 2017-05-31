object WCrTRiesgo: TWCrTRiesgo
  Left = 293
  Top = 206
  Width = 646
  Height = 187
  Caption = 'Catálogo Tipo de Riesgo'
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
  object lbCVE_TIPO_RIESGO: TLabel
    Left = 7
    Top = 6
    Width = 27
    Height = 13
    Caption = 'Clave'
  end
  object lbDESC_TIPO_RIESGO: TLabel
    Left = 7
    Top = 31
    Width = 72
    Height = 13
    Caption = 'Tipo de Riesgo'
  end
  object lbF_ALTA: TLabel
    Left = 7
    Top = 62
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object lbF_MODIFICA: TLabel
    Left = 7
    Top = 85
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object LBCVE_USU_ALTA: TLabel
    Left = 217
    Top = 62
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object lbCVE_USU_MODIFICA: TLabel
    Left = 217
    Top = 86
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object edCVE_TIPO_RIESGO: TEdit
    Tag = 50
    Left = 88
    Top = 3
    Width = 96
    Height = 21
    HelpContext = 1000
    CharCase = ecUpperCase
    TabOrder = 0
    OnExit = edCVE_TIPO_RIESGOExit
  end
  object edDESC_TIPO_RIESGO: TEdit
    Tag = 18
    Left = 88
    Top = 25
    Width = 544
    Height = 21
    HelpContext = 1100
    CharCase = ecUpperCase
    MaxLength = 50
    TabOrder = 1
    OnExit = edDESC_TIPO_RIESGOExit
  end
  object edF_MODIFICA: TEdit
    Left = 88
    Top = 82
    Width = 103
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object edF_ALTA: TEdit
    Left = 88
    Top = 58
    Width = 103
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 307
    Top = 82
    Width = 106
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object edCVE_USU_ALTA: TEdit
    Left = 307
    Top = 58
    Width = 106
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object rgSIT_TIPO_RIESGO: TRadioGroup
    Tag = 18
    Left = 430
    Top = 50
    Width = 206
    Height = 56
    HelpContext = 1200
    Caption = 'Sit. Calificación Acred. por  Calificadora'
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Cancelado')
    TabOrder = 2
    TabStop = True
    OnExit = rgSIT_TIPO_RIESGOExit
  end
  object MsgPanel: TPanel
    Left = 2
    Top = 108
    Width = 633
    Height = 21
    TabOrder = 7
  end
  object PnDatos: TPanel
    Left = 2
    Top = 130
    Width = 633
    Height = 21
    TabOrder = 8
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
      Left = 312
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
      Left = 312
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
      Left = 376
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
      Left = 376
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
    Left = 602
    Top = 114
  end
end
