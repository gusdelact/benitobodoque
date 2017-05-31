object WCrCarteCatMinim: TWCrCarteCatMinim
  Left = 336
  Top = 217
  Width = 768
  Height = 237
  Caption = 'Tipo de Cartera de Catálogo Mínimo'
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
  object lbCVE_CARTERA: TLabel
    Left = 8
    Top = 10
    Width = 79
    Height = 13
    Caption = 'Clave de Cartera'
  end
  object lbDESC_CARTERA: TLabel
    Left = 8
    Top = 50
    Width = 93
    Height = 13
    Caption = 'Descripción Cartera'
  end
  object lbCVE_USU_ALTA: TLabel
    Left = 8
    Top = 130
    Width = 40
    Height = 13
    Caption = 'Usu Alta'
  end
  object lbFH_ALTA: TLabel
    Left = 144
    Top = 130
    Width = 85
    Height = 13
    Caption = 'Fecha y Hora Alta'
  end
  object lbCVE_USU_MODIFICA: TLabel
    Left = 352
    Top = 130
    Width = 62
    Height = 13
    Caption = 'Usu Modifica'
  end
  object lbFH_MODIFICA: TLabel
    Left = 488
    Top = 130
    Width = 107
    Height = 13
    Caption = 'Fecha y Hora Modifica'
  end
  object edCVE_CARTERA: TEdit
    Tag = 50
    Left = 8
    Top = 26
    Width = 48
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edDESC_CARTERA: TEdit
    Tag = 18
    Left = 8
    Top = 66
    Width = 752
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edCVE_USU_ALTA: TEdit
    Tag = 18
    Left = 8
    Top = 146
    Width = 128
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object edFH_ALTA: TEdit
    Tag = 18
    Left = 144
    Top = 146
    Width = 180
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object edCVE_USU_MODIFICA: TEdit
    Tag = 18
    Left = 352
    Top = 146
    Width = 128
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object edFH_MODIFICA: TEdit
    Tag = 18
    Left = 488
    Top = 146
    Width = 180
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object PnDatos: TPanel
    Left = 0
    Top = 177
    Width = 760
    Height = 21
    TabOrder = 7
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
  object rgSIT_CARTERA: TRadioGroup
    Tag = 18
    Left = 10
    Top = 96
    Width = 240
    Height = 30
    HelpContext = 8000
    Caption = 'Situación Cartera'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Activa'
      'Inactiva')
    TabOrder = 2
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
    Left = 410
    Top = 10
  end
end
