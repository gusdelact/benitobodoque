object WCrFrmtNaf: TWCrFrmtNaf
  Left = 184
  Top = 160
  Width = 559
  Height = 177
  Caption = 'Catálogo de CrFrmtoNaf'
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
  object lbDESC_C_FORMATO: TLabel
    Left = 8
    Top = 50
    Width = 138
    Height = 13
    Caption = 'Descripción corta del formato'
  end
  object lbDESC_L_FORMATO: TLabel
    Left = 8
    Top = 90
    Width = 137
    Height = 13
    Caption = 'Descripción larga del formato'
  end
  object lbCVE_FORMATO_NAF: TLabel
    Left = 8
    Top = 2
    Width = 103
    Height = 13
    Caption = 'Clave Formato NAFIN'
  end
  object edDESC_C_FORMATO: TEdit
    Tag = 18
    Left = 8
    Top = 66
    Width = 273
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 30
    TabOrder = 1
  end
  object edDESC_L_FORMATO: TEdit
    Tag = 18
    Left = 8
    Top = 106
    Width = 505
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 80
    TabOrder = 2
  end
  object edCVE_FORMATO_NAF: TEdit
    Tag = 50
    Left = 8
    Top = 18
    Width = 100
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 0
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
    Left = 362
    Top = 10
  end
end
