object WCrFeUsuarioInet: TWCrFeUsuarioInet
  Left = 236
  Top = 225
  Width = 527
  Height = 205
  Caption = 'Configuración Usuario Internet'
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
  object lbCVE_USUARIO_INET: TLabel
    Left = 8
    Top = 10
    Width = 102
    Height = 13
    Caption = 'Clave de Usuario Inet'
  end
  object lbCVE_USUARIO_CORP: TLabel
    Left = 280
    Top = 10
    Width = 106
    Height = 13
    Caption = 'Clave de Usuario Corp'
  end
  object lbSIT_USUARIO: TLabel
    Left = 8
    Top = 44
    Width = 83
    Height = 13
    Caption = 'Situación Usuario'
  end
  object lbF_ALTA: TLabel
    Left = 8
    Top = 82
    Width = 51
    Height = 13
    Caption = 'Fecha Alta'
  end
  object lbCVE_USU_ALTA: TLabel
    Left = 280
    Top = 82
    Width = 85
    Height = 13
    Caption = 'Clave de Usu Alta'
  end
  object lbF_MODIFICA: TLabel
    Left = 8
    Top = 114
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object lbCVE_USU_MODIFICA: TLabel
    Left = 280
    Top = 114
    Width = 107
    Height = 13
    Caption = 'Clave de Usu Modifica'
  end
  object edCVE_USUARIO_INET: TEdit
    Tag = 50
    Left = 152
    Top = 6
    Width = 89
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edCVE_USUARIO_CORP: TEdit
    Left = 424
    Top = 6
    Width = 89
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 1
  end
  object edF_ALTA: TEdit
    Left = 152
    Top = 78
    Width = 90
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 2
  end
  object edCVE_USU_ALTA: TEdit
    Left = 424
    Top = 78
    Width = 89
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 3
  end
  object edF_MODIFICA: TEdit
    Left = 152
    Top = 110
    Width = 90
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 4
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 424
    Top = 110
    Width = 89
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 5
  end
  object PnDatos: TPanel
    Left = 1
    Top = 142
    Width = 512
    Height = 21
    TabOrder = 6
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
  object rgSIT_USUARIO: TRadioGroup
    Tag = 18
    Left = 152
    Top = 33
    Width = 361
    Height = 35
    HelpContext = 2100
    Caption = 'Situación Proveedor'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Inactivo')
    TabOrder = 7
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
    Left = 394
    Top = 18
  end
end
