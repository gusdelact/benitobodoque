object WMCatEncab: TWMCatEncab
  Left = 257
  Top = 62
  Width = 490
  Height = 395
  Caption = 'Catálogo de Encabezados'
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
  object lbDESC_EXCEPCION: TLabel
    Left = 0
    Top = 26
    Width = 56
    Height = 13
    Caption = 'Descripción'
  end
  object Label1: TLabel
    Left = 1
    Top = 5
    Width = 30
    Height = 13
    Caption = 'Clave '
    WordWrap = True
  end
  object Label2: TLabel
    Left = 1
    Top = 47
    Width = 93
    Height = 13
    Caption = 'Nombre de Reporte'
    WordWrap = True
  end
  object Label3: TLabel
    Left = 1
    Top = 68
    Width = 134
    Height = 13
    Caption = 'Descripción de Encabezado'
    WordWrap = True
  end
  object edDESC_L_BLOQUE: TEdit
    Tag = 18
    Left = 102
    Top = 22
    Width = 379
    Height = 21
    HelpContext = 2000
    CharCase = ecUpperCase
    MaxLength = 50
    TabOrder = 1
    OnExit = edDESC_L_BLOQUEExit
    OnKeyPress = edDESC_L_BLOQUEKeyPress
  end
  object PnlMsg: TPanel
    Left = 0
    Top = 326
    Width = 481
    Height = 21
    TabOrder = 6
  end
  object PnDatos: TPanel
    Left = 0
    Top = 347
    Width = 481
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
  object edCVE_ENCABEZADO: TEdit
    Tag = 50
    Left = 102
    Top = 1
    Width = 80
    Height = 21
    HelpContext = 1000
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 0
    OnExit = edCVE_ENCABEZADOExit
    OnKeyPress = edCVE_ENCABEZADOKeyPress
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 268
    Width = 481
    Height = 59
    Caption = 'Registro'
    TabOrder = 5
    object lbF_ALTA: TLabel
      Left = 24
      Top = 37
      Width = 51
      Height = 13
      Caption = 'Fecha Alta'
    end
    object lbF_MODIF: TLabel
      Left = 260
      Top = 37
      Width = 73
      Height = 13
      Caption = 'Fecha Modifica'
    end
    object lbUSUA_ALTA: TLabel
      Left = 24
      Top = 16
      Width = 57
      Height = 13
      Caption = 'Usuario Alta'
    end
    object lbUSUA_MODIF: TLabel
      Left = 260
      Top = 16
      Width = 79
      Height = 13
      Caption = 'Usuario Modifica'
    end
    object edF_ALTA: TEdit
      Left = 108
      Top = 33
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edF_MODIFICA: TEdit
      Left = 359
      Top = 33
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edCVE_USU_ALTA: TEdit
      Left = 108
      Top = 12
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      MaxLength = 8
      ReadOnly = True
      TabOrder = 0
    end
    object edCVE_USU_MODIF: TEdit
      Left = 359
      Top = 12
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      MaxLength = 8
      ReadOnly = True
      TabOrder = 2
    end
  end
  object rgSIT_ENCABEZADO: TRadioGroup
    Tag = 18
    Left = 0
    Top = 237
    Width = 481
    Height = 32
    HelpContext = 5000
    Caption = 'Situación'
    Columns = 2
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Inactivo')
    TabOrder = 4
    OnExit = rgSIT_ENCABEZADOExit
  end
  object edNOM_QRP: TEdit
    Tag = 18
    Left = 102
    Top = 43
    Width = 379
    Height = 21
    HelpContext = 3000
    CharCase = ecUpperCase
    MaxLength = 20
    TabOrder = 2
    OnExit = edNOM_QRPExit
    OnKeyPress = edNOM_QRPKeyPress
  end
  object edTX_ENCABEZADO: TMemo
    Tag = 18
    Left = 8
    Top = 83
    Width = 473
    Height = 153
    HelpContext = 4000
    ScrollBars = ssVertical
    TabOrder = 3
    OnExit = edTX_ENCABEZADOExit
    OnKeyPress = edTX_ENCABEZADOKeyPress
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesCancelar = InterForma1DespuesCancelar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesEliminar = InterForma1AntesEliminar
    OnBuscar = InterForma1Buscar
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
    Left = 419
    Top = 39
  end
end
