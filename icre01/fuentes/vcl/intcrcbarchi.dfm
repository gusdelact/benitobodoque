object WCrCbArchivo: TWCrCbArchivo
  Left = 250
  Top = 44
  Width = 524
  Height = 501
  Caption = 'Catálogo de Archivo Nafin'
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
  object lbID_ARCHIVO: TLabel
    Left = 8
    Top = 10
    Width = 91
    Height = 13
    Caption = 'Número de Archivo'
  end
  object lbCVE_ANEXO: TLabel
    Left = 8
    Top = 50
    Width = 75
    Height = 13
    Caption = 'Clave de Anexo'
  end
  object lbF_ARCHIVO: TLabel
    Left = 8
    Top = 90
    Width = 108
    Height = 13
    Caption = 'F. Creación de Archivo'
  end
  object lbTX_NOM_ARCHIVO: TLabel
    Left = 8
    Top = 130
    Width = 91
    Height = 13
    Caption = 'Nombre de Archivo'
  end
  object lbTX_ARC_CONTENIDO: TLabel
    Left = 8
    Top = 154
    Width = 48
    Height = 13
    Caption = 'Contenido'
  end
  object lbSIT_ARCHIVO: TLabel
    Left = 8
    Top = 314
    Width = 83
    Height = 13
    Caption = 'Situación Archivo'
  end
  object lbIMP_TOTAL_ARC: TLabel
    Left = 8
    Top = 350
    Width = 63
    Height = 13
    Caption = 'Imp Total Arc'
  end
  object lbIMP_TOTAL_IVA: TLabel
    Left = 8
    Top = 382
    Width = 62
    Height = 13
    Caption = 'Imp Total Iva'
  end
  object lbNUM_REGISTRO: TLabel
    Left = 8
    Top = 414
    Width = 79
    Height = 13
    Caption = 'Número Registro'
  end
  object lbNUM_ENVIO: TLabel
    Left = 8
    Top = 446
    Width = 67
    Height = 13
    Caption = 'Número Envio'
  end
  object edID_ARCHIVO: TEdit
    Tag = 50
    Left = 136
    Top = 6
    Width = 90
    Height = 21
    HelpContext = 1000
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edCVE_ANEXO: TEdit
    Tag = 18
    Left = 136
    Top = 46
    Width = 90
    Height = 21
    HelpContext = 1100
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object dtpF_ARCHIVO: TInterDateTimePicker
    Tag = 18
    Left = 229
    Top = 86
    Width = 21
    Height = 21
    HelpContext = 1201
    CalAlignment = dtaLeft
    Date = 38643.8318546296
    Time = 38643.8318546296
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
    Edit = edF_ARCHIVO
    Formato = dfDate
  end
  object edF_ARCHIVO: TEdit
    Tag = 18
    Left = 136
    Top = 86
    Width = 90
    Height = 21
    HelpContext = 1200
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object edTX_NOM_ARCHIVO: TEdit
    Tag = 18
    Left = 136
    Top = 126
    Width = 322
    Height = 21
    HelpContext = 1300
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object edSIT_ARCHIVO: TEdit
    Tag = 18
    Left = 136
    Top = 310
    Width = 90
    Height = 21
    HelpContext = 1500
    CharCase = ecUpperCase
    TabOrder = 6
  end
  object edTX_ARC_CONTENIDO: TMemo
    Tag = 18
    Left = 8
    Top = 168
    Width = 449
    Height = 137
    HelpContext = 1400
    ScrollBars = ssBoth
    TabOrder = 5
  end
  object edIMP_TOTAL_ARC: TEdit
    Tag = 18
    Left = 136
    Top = 346
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 7
  end
  object edIMP_TOTAL_IVA: TEdit
    Tag = 18
    Left = 136
    Top = 378
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 8
  end
  object edNUM_REGISTRO: TEdit
    Tag = 18
    Left = 136
    Top = 410
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 9
  end
  object edNUM_ENVIO: TEdit
    Tag = 18
    Left = 136
    Top = 442
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 10
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
    Left = 298
    Top = 10
  end
end
