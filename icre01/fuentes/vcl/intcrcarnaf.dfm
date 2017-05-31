object WCrCargaNafin: TWCrCargaNafin
  Left = 244
  Top = 267
  Width = 758
  Height = 218
  Caption = 'Catálogo de Cr Carga Nafin'
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
  object lbF_CARGA: TLabel
    Left = 8
    Top = 10
    Width = 61
    Height = 13
    Caption = 'Fecha Carga'
  end
  object lbID_ACUSE: TLabel
    Left = 8
    Top = 50
    Width = 85
    Height = 13
    Caption = 'Número de Acuse'
  end
  object lbID_CARGA_NAFIN: TLabel
    Left = 264
    Top = 10
    Width = 111
    Height = 13
    Caption = 'Número de Carga Nafin'
  end
  object lbCVE_USU_CARGA: TLabel
    Left = 264
    Top = 50
    Width = 95
    Height = 13
    Caption = 'Clave de Usu Carga'
  end
  object lbNOM_ARCHIVO: TLabel
    Left = 496
    Top = 10
    Width = 76
    Height = 13
    Caption = 'Nombre Archivo'
  end
  object lbF_PROCESA: TLabel
    Left = 496
    Top = 50
    Width = 72
    Height = 13
    Caption = 'Fecha Procesa'
  end
  object lbCVE_USU_PROCESA: TLabel
    Left = 8
    Top = 98
    Width = 106
    Height = 13
    Caption = 'Clave de Usu Procesa'
  end
  object lbSIT_CARGA: TLabel
    Left = 8
    Top = 138
    Width = 75
    Height = 13
    Caption = 'Situación Carga'
  end
  object dtpF_CARGA: TInterDateTimePicker
    Tag = 50
    Left = 98
    Top = 26
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 37848.4325759375
    Time = 37848.4325759375
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
    Edit = edF_CARGA
    Formato = dfDate
  end
  object edF_CARGA: TEdit
    Tag = 50
    Left = 8
    Top = 26
    Width = 90
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edID_ACUSE: TEdit
    Tag = 50
    Left = 8
    Top = 66
    Width = 224
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object edID_CARGA_NAFIN: TEdit
    Tag = 18
    Left = 264
    Top = 26
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object edCVE_USU_CARGA: TEdit
    Tag = 18
    Left = 264
    Top = 66
    Width = 128
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object edNOM_ARCHIVO: TEdit
    Tag = 18
    Left = 496
    Top = 26
    Width = 249
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
  end
  object dtpF_PROCESA: TInterDateTimePicker
    Tag = 18
    Left = 586
    Top = 66
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 37848.4325760532
    Time = 37848.4325760532
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 6
    Edit = edF_PROCESA
    Formato = dfDate
  end
  object edF_PROCESA: TEdit
    Tag = 18
    Left = 496
    Top = 66
    Width = 90
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 7
  end
  object edCVE_USU_PROCESA: TEdit
    Tag = 18
    Left = 8
    Top = 114
    Width = 128
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 8
  end
  object edSIT_CARGA: TEdit
    Tag = 18
    Left = 8
    Top = 154
    Width = 128
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 9
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
