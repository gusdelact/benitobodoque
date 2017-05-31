object WCrSigDirrepasis: TWCrSigDirrepasis
  Left = 387
  Top = 370
  Width = 768
  Height = 130
  Caption = 'Catálogo de Cr Sig Dirrepasis'
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
  object lbCLAVE: TLabel
    Left = 8
    Top = 10
    Width = 27
    Height = 13
    Caption = 'Clave'
  end
  object lbDIRECCION: TLabel
    Left = 8
    Top = 50
    Width = 45
    Height = 13
    Caption = 'Direccion'
  end
  object edCLAVE: TEdit
    Tag = 50
    Left = 8
    Top = 26
    Width = 96
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edDIRECCION: TEdit
    Tag = 18
    Left = 8
    Top = 66
    Width = 752
    Height = 21
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
    Left = 10
    Top = 10
  end
end
