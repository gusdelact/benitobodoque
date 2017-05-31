object WDomConvertido: TWDomConvertido
  Left = 406
  Top = 216
  Width = 417
  Height = 291
  Caption = 'Catálogo de Domicilios Convertidos'
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
  object lbID_DOMICILIO: TLabel
    Left = 8
    Top = 10
    Width = 71
    Height = 13
    Caption = 'ID de Domicilio'
  end
  object lbCALLE_NUMERO: TLabel
    Left = 8
    Top = 66
    Width = 63
    Height = 13
    Caption = 'Calle Numero'
  end
  object lbCALLE: TLabel
    Left = 8
    Top = 114
    Width = 23
    Height = 13
    Caption = 'Calle'
  end
  object lbNUM_EXTERIOR: TLabel
    Left = 8
    Top = 162
    Width = 75
    Height = 13
    Caption = 'Número Exterior'
  end
  object lbNUM_INTERIOR: TLabel
    Left = 152
    Top = 162
    Width = 72
    Height = 13
    Caption = 'Número Interior'
  end
  object edID_DOMICILIO: TEdit
    Left = 8
    Top = 26
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    Enabled = False
    ReadOnly = True
    TabOrder = 0
  end
  object edCALLE_NUMERO: TEdit
    Tag = 18
    Left = 8
    Top = 82
    Width = 385
    Height = 21
    HelpContext = 1010
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edCALLE: TEdit
    Tag = 18
    Left = 8
    Top = 130
    Width = 385
    Height = 21
    HelpContext = 2010
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object edNUM_EXTERIOR: TEdit
    Tag = 18
    Left = 8
    Top = 178
    Width = 121
    Height = 21
    HelpContext = 3010
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object edNUM_INTERIOR: TEdit
    Tag = 18
    Left = 152
    Top = 178
    Width = 121
    Height = 21
    HelpContext = 4010
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object PnDatos: TPanel
    Left = 8
    Top = 221
    Width = 385
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
    Left = 242
    Top = 10
  end
end
