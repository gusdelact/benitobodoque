object WCrplazores: TWCrplazores
  Left = 524
  Top = 103
  Width = 345
  Height = 164
  Caption = 'Reporte Plazo Residual'
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
  object lbCAMPO1: TLabel
    Left = 48
    Top = 26
    Width = 30
    Height = 13
    Caption = 'Fecha'
  end
  object dtpCAMPO1: TInterDateTimePicker
    Tag = 18
    Left = -22
    Top = 130
    Width = 23
    Height = 21
    CalAlignment = dtaLeft
    Date = 40123.4620434375
    Time = 40123.4620434375
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
    Visible = False
    Edit = edCAMPO1
    Formato = dfDate
  end
  object edCAMPO1: TEdit
    Tag = 18
    Left = -128
    Top = -22
    Width = 129
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    Visible = False
  end
  object edFecha: TEdit
    Left = 48
    Top = 40
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object dtpFecha: TDateTimePicker
    Left = 168
    Top = 40
    Width = 22
    Height = 21
    CalAlignment = dtaLeft
    Date = 40123
    Time = 40123
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
    OnChange = dtpFechaChange
  end
  object btnVisualizar: TButton
    Left = 224
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Visualizar'
    TabOrder = 4
    OnClick = btnVisualizarClick
  end
  object btnImprimir: TButton
    Left = 224
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 5
    OnClick = btnImprimirClick
  end
  object cbxPasivo: TCheckBox
    Left = 48
    Top = 72
    Width = 65
    Height = 17
    Caption = 'Pasivo'
    TabOrder = 6
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
    FormaTipo = ftImprimir
    CanEdit = False
    IsNewData = False
    Panel = dtpCAMPO1
    ShowBtnNuevo = False
    ShowBtnModificar = False
    ShowBtnAceptar = False
    ShowBtnCancelar = False
    ShowBtnEliminar = False
    Version = 20
    HideButtons = False
    ShowBtnBuscar = False
    ShowBtnAyuda = False
    ShowGrid = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 162
    Top = 2
  end
end
