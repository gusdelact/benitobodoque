object WRepDepRef: TWRepDepRef
  Left = 489
  Top = 207
  Width = 291
  Height = 254
  Caption = 'Carta Depósito  Referenciado'
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
  object Fecha: TLabel
    Left = 8
    Top = 18
    Width = 30
    Height = 13
    Caption = 'Fecha'
  end
  object Label1: TLabel
    Left = 8
    Top = 176
    Width = 167
    Height = 13
    Caption = 'Listado del Filtro (separar por coma)'
  end
  object edFecha: TEdit
    Tag = 18
    Left = 65
    Top = 10
    Width = 105
    Height = 21
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 0
  end
  object cbManual: TCheckBox
    Left = 10
    Top = 45
    Width = 167
    Height = 17
    HelpContext = 1900
    Caption = 'Impresión en Modo Manual'
    TabOrder = 1
  end
  object rgFiltro: TRadioGroup
    Left = 8
    Top = 80
    Width = 233
    Height = 81
    Caption = 'Opciones de Filtro'
    Items.Strings = (
      'Por Crédito(s)'
      'Por Titular(s)')
    TabOrder = 2
  end
  object edFiltro: TEdit
    Left = 8
    Top = 192
    Width = 273
    Height = 21
    TabOrder = 3
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnImprimir = InterForma1Imprimir
    OnPreview = InterForma1Preview
    msgSinRegistros = 'No existe un Registro para realizar la operación.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = '¿Desea Eliminar el Registro Actual?'
    FormaTipo = ftImprimir
    CanEdit = False
    IsNewData = False
    ShowBtnNuevo = False
    ShowBtnModificar = False
    ShowBtnAceptar = False
    ShowBtnCancelar = False
    ShowBtnEliminar = False
    Version = 20
    HideButtons = False
    ShowBtnBuscar = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 202
    Top = 10
  end
end
