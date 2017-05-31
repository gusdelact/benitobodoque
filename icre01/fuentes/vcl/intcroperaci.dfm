object WCrOperacion: TWCrOperacion
  Left = 193
  Top = 216
  Width = 554
  Height = 261
  Caption = 'Catálogo de Operaciones'
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
  object lbCVE_OPERACION: TLabel
    Left = 8
    Top = 18
    Width = 79
    Height = 13
    Caption = 'Clave Operación'
  end
  object lbDESC_C_OPERACION: TLabel
    Left = 192
    Top = 18
    Width = 84
    Height = 13
    Caption = 'Descripción Corta'
  end
  object lbDESC_L_OPERACION: TLabel
    Left = 8
    Top = 54
    Width = 86
    Height = 13
    Caption = 'Descripción Larga'
  end
  object Label1: TLabel
    Left = 296
    Top = 130
    Width = 95
    Height = 13
    Caption = 'Clave Ope. Cancela'
  end
  object Label32: TLabel
    Left = 492
    Top = 181
    Width = 37
    Height = 7
    Caption = 'V20150630'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -7
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object edCVE_OPERACION: TEdit
    Tag = 50
    Left = 104
    Top = 14
    Width = 73
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 0
    OnExit = edCVE_OPERACIONExit
  end
  object edDESC_C_OPERACION: TEdit
    Tag = 18
    Left = 288
    Top = 14
    Width = 238
    Height = 21
    HelpContext = 2001
    CharCase = ecUpperCase
    MaxLength = 50
    TabOrder = 1
    OnExit = edDESC_C_OPERACIONExit
  end
  object edDESC_L_OPERACION: TEdit
    Tag = 18
    Left = 104
    Top = 50
    Width = 422
    Height = 21
    HelpContext = 3001
    CharCase = ecUpperCase
    MaxLength = 50
    TabOrder = 2
    OnExit = edDESC_L_OPERACIONExit
  end
  object rgCVE_AFEC_SALDO: TRadioGroup
    Tag = 18
    Left = 8
    Top = 75
    Width = 517
    Height = 38
    HelpContext = 4001
    Caption = 'Afecta Saldo'
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Incrementa'
      'Decrementa'
      'No Aplica')
    TabOrder = 3
    OnExit = rgCVE_AFEC_SALDOExit
  end
  object chB_EDO_CTA: TCheckBox
    Tag = 18
    Left = 8
    Top = 151
    Width = 153
    Height = 21
    HelpContext = 6001
    Caption = 'Estado de Cuenta'
    TabOrder = 5
    OnExit = chB_EDO_CTAExit
  end
  object cbCVE_ACCESORIO: TComboBox
    Tag = 18
    Left = 8
    Top = 127
    Width = 156
    Height = 21
    HelpContext = 5001
    ItemHeight = 13
    TabOrder = 4
    Text = 'CAPITAL'
    OnExit = cbCVE_ACCESORIOExit
    Items.Strings = (
      'CP - CAPITAL'
      'LN - LINEA DE CREDITO'
      'CR - CREDITO'
      'IN - INTERES'
      'CN - CONCEPTO (COMIS)'
      'DC - DOCUMENTO'
      'CS - SESION')
  end
  object PnDatos: TPanel
    Left = 0
    Top = 188
    Width = 528
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
  object edCVE_OPER_CANCELA: TEdit
    Tag = 18
    Left = 456
    Top = 126
    Width = 73
    Height = 21
    HelpContext = 6001
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 6
    OnExit = edCVE_OPER_CANCELAExit
  end
  object chB_GENERA_CONTA: TCheckBox
    Tag = 18
    Left = 376
    Top = 151
    Width = 153
    Height = 21
    HelpContext = 7001
    Caption = 'Genera Accesorio'
    TabOrder = 7
    OnExit = chB_GENERA_CONTAExit
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
    Left = 218
    Top = 10
  end
end
