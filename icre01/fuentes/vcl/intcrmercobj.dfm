object WCrMercadoObj: TWCrMercadoObj
  Left = 345
  Top = 176
  Width = 510
  Height = 194
  Caption = 'Catálogo de Cr Mercado Obj'
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
  object lbCVE_MERCADO: TLabel
    Left = 8
    Top = 10
    Width = 87
    Height = 13
    Caption = 'Clave de Mercado'
  end
  object lbDESC_MERCADO: TLabel
    Left = 8
    Top = 50
    Width = 101
    Height = 13
    Caption = 'Descripción Mercado'
  end
  object lbFH_ALTA: TLabel
    Left = 8
    Top = 98
    Width = 51
    Height = 13
    Caption = 'Fecha Alta'
  end
  object lbCVE_USU_ALTA: TLabel
    Left = 128
    Top = 98
    Width = 85
    Height = 13
    Caption = 'Clave de Usu Alta'
  end
  object lbFH_MODIFICA: TLabel
    Left = 264
    Top = 98
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object lbCVE_USU_MODIFICA: TLabel
    Left = 384
    Top = 98
    Width = 107
    Height = 13
    Caption = 'Clave de Usu Modifica'
  end
  object edCVE_MERCADO: TEdit
    Tag = 18
    Left = 8
    Top = 26
    Width = 113
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edDESC_MERCADO: TEdit
    Tag = 18
    Left = 8
    Top = 66
    Width = 505
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object dtpFH_ALTA: TInterDateTimePicker
    Tag = 18
    Left = 98
    Top = 114
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 40976.6047195833
    Time = 40976.6047195833
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 2
    Edit = edFH_ALTA
    Formato = dfDate
  end
  object edFH_ALTA: TEdit
    Left = 8
    Top = 114
    Width = 90
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object edCVE_USU_ALTA: TEdit
    Left = 128
    Top = 114
    Width = 128
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object dtpFH_MODIFICA: TInterDateTimePicker
    Tag = 18
    Left = 354
    Top = 114
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 40976.6047195949
    Time = 40976.6047195949
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 5
    Edit = edFH_MODIFICA
    Formato = dfDate
  end
  object edFH_MODIFICA: TEdit
    Left = 264
    Top = 114
    Width = 90
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 384
    Top = 114
    Width = 128
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
  end
  object rgSIT_MERC_OBJ: TRadioGroup
    Tag = 18
    Left = 360
    Top = 15
    Width = 153
    Height = 33
    Hint = 'Situación del registro de garantía'
    HelpContext = 5000
    Caption = 'Situación'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Activa'
      'Inactiva')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnAntesAceptar = InterForma1AntesAceptar
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
