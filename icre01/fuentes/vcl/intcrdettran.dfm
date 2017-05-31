object WCrDetTransac: TWCrDetTransac
  Left = 2
  Top = 6
  Width = 518
  Height = 218
  Caption = 'Consulta de Detalles de Transacciones'
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
  object lbID_TRANSACCION: TLabel
    Left = 8
    Top = 34
    Width = 59
    Height = 13
    Caption = 'Transaccion'
  end
  object lbCVE_OPERACION: TLabel
    Left = 8
    Top = 66
    Width = 79
    Height = 13
    Caption = 'Clave Operación'
  end
  object lbCVE_CONCEPTO: TLabel
    Left = 8
    Top = 98
    Width = 76
    Height = 13
    Caption = 'Clave Concepto'
  end
  object lbIMP_CONCEPTO: TLabel
    Left = 8
    Top = 130
    Width = 69
    Height = 13
    Caption = 'Imp. Concepto'
  end
  object edID_TRANSACCION: TEdit
    Tag = 50
    Left = 112
    Top = 30
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edCVE_OPERACION: TEdit
    Tag = 50
    Left = 112
    Top = 62
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edCVE_CONCEPTO: TEdit
    Tag = 50
    Left = 112
    Top = 94
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object edIMP_CONCEPTO: TEdit
    Tag = 18
    Left = 112
    Top = 126
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object PnDatos: TPanel
    Left = 9
    Top = 158
    Width = 496
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
  object edDESC_OPERACION: TEdit
    Left = 192
    Top = 62
    Width = 315
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object edDESC_CONCEPTO: TEdit
    Tag = 512
    Left = 192
    Top = 94
    Width = 318
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 6
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
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
    ShowBtnNuevo = False
    ShowBtnModificar = False
    ShowBtnAceptar = False
    ShowBtnCancelar = False
    ShowBtnEliminar = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 458
    Top = 10
  end
end
