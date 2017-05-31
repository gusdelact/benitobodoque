object wMDoMedio: TwMDoMedio
  Left = 207
  Top = 202
  Width = 511
  Height = 147
  Caption = 'Catálogo de Medio'
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
    Top = 35
    Width = 56
    Height = 13
    AutoSize = False
    Caption = 'Descripción'
  end
  object Label1: TLabel
    Left = 0
    Top = 14
    Width = 82
    Height = 13
    AutoSize = False
    Caption = 'Clave del Medio'
  end
  object Label2: TLabel
    Left = 0
    Top = 56
    Width = 109
    Height = 13
    AutoSize = False
    Caption = 'Prelación entre medios'
  end
  object edDESC_MEDIO: TEdit
    Tag = 18
    Left = 125
    Top = 31
    Width = 376
    Height = 21
    HelpContext = 2000
    CharCase = ecUpperCase
    MaxLength = 60
    TabOrder = 1
    OnExit = edDESC_MEDIOExit
  end
  object PnlMsg: TPanel
    Left = 0
    Top = 76
    Width = 501
    Height = 21
    TabOrder = 3
  end
  object PnDatos: TPanel
    Left = 0
    Top = 97
    Width = 501
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
  object edCVE_MEDIO: TEdit
    Tag = 50
    Left = 125
    Top = 10
    Width = 80
    Height = 21
    HelpContext = 1000
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 0
    OnExit = edCVE_MEDIOExit
  end
  object edNIVEL_MEDIO: TInterEdit
    Tag = 18
    Left = 125
    Top = 52
    Width = 80
    Height = 21
    HelpContext = 3000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    OnExit = edNIVEL_MEDIOExit
    MaxLength = 1
    TabOrder = 2
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
    OnAntesEliminar = InterForma1AntesEliminar
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
    Left = 265
    Top = 4
  end
end
