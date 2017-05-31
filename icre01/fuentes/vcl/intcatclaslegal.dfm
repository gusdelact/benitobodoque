object wCatClasLegal: TwCatClasLegal
  Left = 347
  Top = 360
  Width = 426
  Height = 132
  Caption = 'Catálogo de Clasificación Legal'
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
  object LbClave: TLabel
    Left = 8
    Top = 8
    Width = 27
    Height = 13
    Caption = 'Clave'
  end
  object LbDescripcion: TLabel
    Left = 115
    Top = 8
    Width = 56
    Height = 13
    Caption = 'Descripción'
  end
  object edCveClasLegal: TInterEdit
    Tag = 50
    Left = 8
    Top = 24
    Width = 97
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    MaxLength = 10
    TabOrder = 0
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edDescClasLegal: TInterEdit
    Tag = 18
    Left = 112
    Top = 24
    Width = 297
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    MaxLength = 30
    TabOrder = 1
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object InterForma: TInterForma
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
    Left = 368
    Top = 56
  end
end
