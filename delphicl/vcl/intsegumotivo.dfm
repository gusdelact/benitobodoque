object wSegMotivo: TwSegMotivo
  Left = 368
  Top = 379
  Width = 428
  Height = 102
  Caption = 'Motivos de cambio de password'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LbCveMotivo: TLabel
    Left = 8
    Top = 16
    Width = 27
    Height = 13
    Caption = 'Clave'
  end
  object LbDescMotivo: TLabel
    Left = 8
    Top = 44
    Width = 56
    Height = 13
    Caption = 'Descripción'
  end
  object EdCveMotivo: TEdit
    Tag = 50
    Left = 72
    Top = 11
    Width = 65
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 0
  end
  object EdDescMotivo: TEdit
    Tag = 18
    Left = 72
    Top = 40
    Width = 329
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 40
    TabOrder = 1
  end
  object InterForma1: TInterForma
    IsMain = True
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
    Left = 186
    Top = 10
  end
end
