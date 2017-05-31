object WCrSituacion: TWCrSituacion
  Left = 240
  Top = 41
  Width = 639
  Height = 211
  Caption = 'Catálogo de Situaciones'
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
  object lbCVE_SITUACION: TLabel
    Left = 8
    Top = 26
    Width = 69
    Height = 13
    Caption = 'Cve. Situación'
  end
  object lbDESC_L_SITUACION: TLabel
    Left = 8
    Top = 74
    Width = 86
    Height = 13
    Caption = 'Descripción Larga'
  end
  object edCVE_SITUACION: TEdit
    Tag = 50
    Left = 104
    Top = 26
    Width = 77
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 2
    TabOrder = 0
    OnExit = edCVE_SITUACIONExit
  end
  object edDESC_C_SITUACION: TEdit
    Tag = 18
    Left = 184
    Top = 26
    Width = 441
    Height = 21
    HelpContext = 2001
    CharCase = ecUpperCase
    MaxLength = 50
    TabOrder = 1
    OnExit = edDESC_C_SITUACIONExit
  end
  object edDESC_L_SITUACION: TEdit
    Tag = 18
    Left = 104
    Top = 74
    Width = 521
    Height = 21
    HelpContext = 3001
    CharCase = ecUpperCase
    MaxLength = 50
    TabOrder = 2
    OnExit = edDESC_L_SITUACIONExit
  end
  object PnDatos: TPanel
    Left = 0
    Top = 155
    Width = 631
    Height = 21
    TabOrder = 5
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
  object chB_DISPOSICION: TCheckBox
    Tag = 18
    Left = 8
    Top = 114
    Width = 192
    Height = 21
    HelpContext = 4001
    Alignment = taLeftJustify
    Caption = 'Aplica para Disposición'
    TabOrder = 3
    OnExit = chB_DISPOSICIONExit
  end
  object chB_PERIODO: TCheckBox
    Tag = 18
    Left = 440
    Top = 114
    Width = 184
    Height = 21
    HelpContext = 5001
    Alignment = taLeftJustify
    Caption = 'Aplica para Periodos'
    TabOrder = 4
    OnExit = chB_PERIODOExit
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
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
    Left = 290
    Top = 10
  end
end
