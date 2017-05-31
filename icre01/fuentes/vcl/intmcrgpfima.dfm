object WMCrGpFiMa: TWMCrGpFiMa
  Left = 437
  Top = 226
  Width = 421
  Height = 274
  Caption = 'Mantenimiento Límites'
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
  object lbTIPO_ENTIDAD: TLabel
    Left = 8
    Top = 10
    Width = 60
    Height = 13
    Caption = 'Tipo Entidad'
  end
  object lbTIPO_LIMITE: TLabel
    Left = 112
    Top = 10
    Width = 51
    Height = 13
    Caption = 'Tipo Limite'
  end
  object lbNIVEL_FINAN_MAX: TLabel
    Left = 240
    Top = 10
    Width = 76
    Height = 13
    Caption = 'Nivel Finan Max'
  end
  object lbF_VIGENTE_DESDE: TLabel
    Left = 8
    Top = 58
    Width = 89
    Height = 13
    Caption = 'Fecha de Vigencia'
  end
  object lbPCT_PI_SUP: TLabel
    Left = 8
    Top = 100
    Width = 63
    Height = 13
    Caption = '% PI Superior'
  end
  object lbPCT_SP: TLabel
    Left = 144
    Top = 100
    Width = 72
    Height = 13
    Caption = '% Sev. Perdida'
  end
  object lbPCT_RES_SUP: TLabel
    Left = 286
    Top = 100
    Width = 76
    Height = 13
    Caption = '% Reserva Sup.'
  end
  object lbPCT_COL_1: TLabel
    Left = 8
    Top = 146
    Width = 87
    Height = 13
    Caption = '% Capital Basico 1'
  end
  object lbPCT_COL_2: TLabel
    Left = 144
    Top = 146
    Width = 87
    Height = 13
    Caption = '% Capital Basico 2'
  end
  object lbPCT_COL_3: TLabel
    Left = 288
    Top = 146
    Width = 87
    Height = 13
    Caption = '% Capital Basico 3'
  end
  object lbUSUARIO_CREACION: TLabel
    Left = 8
    Top = 194
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object lbFH_CREACION: TLabel
    Left = 112
    Top = 194
    Width = 51
    Height = 13
    Caption = 'Fecha Alta'
  end
  object lbUSUARIO_MODIFICA: TLabel
    Left = 224
    Top = 194
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object lbFH_MODIFICA: TLabel
    Left = 312
    Top = 194
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object edNIVEL_FINAN_MAX: TEdit
    Tag = 50
    Left = 240
    Top = 26
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object dtpF_VIGENTE_DESDE: TInterDateTimePicker
    Tag = 18
    Left = 98
    Top = 74
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 40989.4577465162
    Time = 40989.4577465162
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
    Edit = edF_VIGENTE_DESDE
    Formato = dfDate
  end
  object edF_VIGENTE_DESDE: TEdit
    Tag = 18
    Left = 8
    Top = 74
    Width = 90
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object edPCT_PI_SUP: TEdit
    Tag = 18
    Left = 8
    Top = 116
    Width = 120
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object edPCT_SP: TEdit
    Tag = 18
    Left = 144
    Top = 116
    Width = 120
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object edPCT_RES_SUP: TEdit
    Tag = 18
    Left = 286
    Top = 116
    Width = 120
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
  end
  object edPCT_COL_1: TEdit
    Tag = 18
    Left = 8
    Top = 162
    Width = 122
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 6
  end
  object edPCT_COL_2: TEdit
    Tag = 18
    Left = 144
    Top = 162
    Width = 122
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 7
  end
  object edPCT_COL_3: TEdit
    Tag = 18
    Left = 288
    Top = 162
    Width = 122
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 8
  end
  object edUSUARIO_CREACION: TEdit
    Left = 8
    Top = 210
    Width = 89
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 9
  end
  object dtpFH_CREACION: TInterDateTimePicker
    Left = 200
    Top = 210
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 40989.4577465394
    Time = 40989.4577465394
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 10
    Edit = edFH_CREACION
    Formato = dfDateTime
  end
  object edFH_CREACION: TEdit
    Left = 112
    Top = 210
    Width = 89
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 11
  end
  object edUSUARIO_MODIFICA: TEdit
    Left = 224
    Top = 210
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 12
  end
  object dtpFH_MODIFICA: TInterDateTimePicker
    Left = 400
    Top = 210
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 40989.4577465509
    Time = 40989.4577465509
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 13
    Edit = edFH_MODIFICA
    Formato = dfDateTime
  end
  object edFH_MODIFICA: TEdit
    Left = 312
    Top = 210
    Width = 89
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 14
  end
  object cbxTIPO_ENTIDAD: TComboBox
    Tag = 50
    Left = 8
    Top = 26
    Width = 97
    Height = 21
    ItemHeight = 13
    TabOrder = 15
  end
  object cbxTIPO_LIMITE: TComboBox
    Tag = 50
    Left = 112
    Top = 26
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 16
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
    Left = 178
    Top = 50
  end
end
