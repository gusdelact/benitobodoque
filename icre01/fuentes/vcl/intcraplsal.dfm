object WCrAplicSaldo: TWCrAplicSaldo
  Left = 195
  Top = 122
  Width = 538
  Height = 242
  Caption = 'Catálogo de Aplicación de Saldos'
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
  object lbCVE_APLIC_SALDO: TLabel
    Left = 8
    Top = 18
    Width = 89
    Height = 13
    Caption = 'Clave Aplica Saldo'
  end
  object lbDESC_L_APLIC_SDO: TLabel
    Left = 8
    Top = 58
    Width = 56
    Height = 13
    Caption = 'Descripción'
  end
  object lbCVE_TIPO_METODO: TLabel
    Left = 8
    Top = 98
    Width = 90
    Height = 13
    Caption = 'Clave Tipo Método'
  end
  object edCVE_APLIC_SALDO: TEdit
    Tag = 50
    Left = 112
    Top = 14
    Width = 73
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 0
    OnExit = edCVE_APLIC_SALDOExit
  end
  object edDESC_L_APLIC_SDO: TEdit
    Tag = 18
    Left = 112
    Top = 54
    Width = 417
    Height = 21
    HelpContext = 2001
    CharCase = ecUpperCase
    MaxLength = 50
    TabOrder = 1
    OnExit = edDESC_L_APLIC_SDOExit
  end
  object PnDatos: TPanel
    Left = 7
    Top = 181
    Width = 522
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
  object cbCVE_TIPO_METODO: TComboBox
    Tag = 18
    Left = 112
    Top = 96
    Width = 153
    Height = 21
    HelpContext = 3001
    ItemHeight = 13
    TabOrder = 2
    Text = 'PERIODO UNICO'
    OnExit = cbCVE_TIPO_METODOExit
  end
  object gbSITUACION_PERIODO: TGroupBox
    Left = 144
    Top = 128
    Width = 385
    Height = 41
    Caption = 'Situación de los Periodos'
    TabOrder = 4
    object chB_ACTIVO: TCheckBox
      Tag = 18
      Left = 16
      Top = 12
      Width = 57
      Height = 21
      HelpContext = 5001
      Caption = 'Activo'
      TabOrder = 0
      OnExit = chB_ACTIVOExit
    end
    object chB_POR_ACTIVAR: TCheckBox
      Tag = 18
      Left = 96
      Top = 12
      Width = 81
      Height = 21
      HelpContext = 6001
      Caption = 'Por Activar'
      TabOrder = 1
      OnExit = chB_POR_ACTIVARExit
    end
    object chB_LIQUIDADO: TCheckBox
      Tag = 18
      Left = 197
      Top = 12
      Width = 73
      Height = 21
      HelpContext = 7001
      Caption = 'Liquidado'
      TabOrder = 2
      OnExit = chB_LIQUIDADOExit
    end
    object chB_CANCELADO: TCheckBox
      Tag = 18
      Left = 288
      Top = 12
      Width = 81
      Height = 21
      HelpContext = 8001
      Caption = 'Cancelado'
      TabOrder = 3
      OnExit = chB_CANCELADOExit
    end
  end
  object gbORDEN: TGroupBox
    Left = 8
    Top = 128
    Width = 129
    Height = 41
    Caption = 'Ordenar de Manera'
    TabOrder = 3
    object chB_ASCENDENTE: TCheckBox
      Tag = 18
      Left = 16
      Top = 12
      Width = 81
      Height = 21
      HelpContext = 4001
      Caption = 'Ascendente'
      TabOrder = 0
      OnExit = chB_ASCENDENTEExit
    end
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
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
    Left = 474
    Top = 2
  end
end
