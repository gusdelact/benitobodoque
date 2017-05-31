object WCrTAve: TWCrTAve
  Left = 355
  Top = 293
  Width = 378
  Height = 105
  Caption = 'Catálogo de Acreditado en Vigilancia Especial'
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
  object lbFOLIO: TLabel
    Left = 8
    Top = 18
    Width = 22
    Height = 13
    Caption = 'Folio'
  end
  object lbCVE_AVE: TLabel
    Left = 8
    Top = 44
    Width = 64
    Height = 13
    Caption = 'Clave de Ave'
  end
  object edFOLIO: TEdit
    Left = 80
    Top = 12
    Width = 97
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  object edCVE_AVE: TEdit
    Tag = 18
    Left = 80
    Top = 38
    Width = 305
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
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
    Left = 202
    Top = 2
  end
end
