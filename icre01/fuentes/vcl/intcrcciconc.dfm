object WCrCciConcepto: TWCrCciConcepto
  Left = 288
  Top = 337
  Width = 661
  Height = 227
  Caption = 'Conceptos Cartas de Crédito'
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
  object lbCVE_CCI_CONCEPTO: TLabel
    Left = 8
    Top = 10
    Width = 185
    Height = 13
    Caption = 'Clave de Concepto de Carta de Crédito'
  end
  object lbDESC_CCI_CONCEPT: TLabel
    Left = 8
    Top = 51
    Width = 120
    Height = 13
    Caption = 'Descripción de Concepto'
  end
  object edCVE_CCI_CONCEPTO: TEdit
    Tag = 50
    Left = 8
    Top = 26
    Width = 128
    Height = 21
    HelpContext = 1000
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 0
    OnExit = edCVE_CCI_CONCEPTOExit
  end
  object edDESC_CCI_CONCEPT: TEdit
    Tag = 530
    Left = 8
    Top = 67
    Width = 639
    Height = 21
    HelpContext = 1100
    CharCase = ecUpperCase
    MaxLength = 80
    TabOrder = 1
    OnExit = edDESC_CCI_CONCEPTExit
  end
  object MsgPanel: TPanel
    Left = 7
    Top = 147
    Width = 640
    Height = 19
    TabOrder = 3
  end
  object PnDatos: TPanel
    Left = 7
    Top = 167
    Width = 640
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
      Left = 300
      Top = 0
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
      Left = 316
      Top = 10
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
      Left = 364
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
      Left = 364
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
  object rgCVE_AFEC_SALDO: TRadioGroup
    Tag = 530
    Left = 6
    Top = 96
    Width = 642
    Height = 49
    HelpContext = 1800
    Caption = 'Afectación de Saldo'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Disminuye Saldo'
      'Aumenta Saldo'
      'No Afecta Saldo')
    TabOrder = 2
    TabStop = True
    OnExit = rgCVE_AFEC_SALDOExit
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
    Left = 616
    Top = 9
  end
end
