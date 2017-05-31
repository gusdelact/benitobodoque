object WCrComCuotaAc: TWCrComCuotaAc
  Left = 506
  Top = 291
  Width = 424
  Height = 365
  Caption = 'Catálogo de Cr Com Cuota Acceso'
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
  object lbID_ACCESORIO: TLabel
    Left = 8
    Top = 10
    Width = 102
    Height = 13
    Caption = 'Número de Accesorio'
  end
  object lbFOL_ACCESORIO: TLabel
    Left = 8
    Top = 50
    Width = 64
    Height = 13
    Caption = 'Fol Accesorio'
  end
  object lbCVE_ACCESORIO: TLabel
    Left = 8
    Top = 90
    Width = 92
    Height = 13
    Caption = 'Clave de Accesorio'
  end
  object lbCVE_COMISION: TLabel
    Left = 8
    Top = 130
    Width = 87
    Height = 13
    Caption = 'Clave de Comision'
  end
  object lbNUM_PERIODO: TLabel
    Left = 8
    Top = 170
    Width = 76
    Height = 13
    Caption = 'Número Periodo'
  end
  object lbPLAZO: TLabel
    Left = 8
    Top = 210
    Width = 26
    Height = 13
    Caption = 'Plazo'
  end
  object lbF_VENCIMIENTO: TLabel
    Left = 8
    Top = 250
    Width = 91
    Height = 13
    Caption = 'Fecha Vencimiento'
  end
  object lbF_PROG_PAGO: TLabel
    Left = 8
    Top = 290
    Width = 83
    Height = 13
    Caption = 'Fecha Prog Pago'
  end
  object lbIMP_CUOTA: TLabel
    Left = 216
    Top = 90
    Width = 48
    Height = 13
    Caption = 'Imp Cuota'
  end
  object lbIMP_IVA: TLabel
    Left = 216
    Top = 130
    Width = 35
    Height = 13
    Caption = 'Imp Iva'
  end
  object lbTASA_APLICADA: TLabel
    Left = 216
    Top = 10
    Width = 68
    Height = 13
    Caption = 'Tasa Aplicada'
  end
  object lbSIT_COM_CUOTA: TLabel
    Left = 216
    Top = 50
    Width = 99
    Height = 13
    Caption = 'Situación Com Cuota'
  end
  object edID_ACCESORIO: TEdit
    Tag = 50
    Left = 8
    Top = 26
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edFOL_ACCESORIO: TEdit
    Tag = 50
    Left = 8
    Top = 66
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edCVE_ACCESORIO: TEdit
    Tag = 50
    Left = 8
    Top = 106
    Width = 32
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object edCVE_COMISION: TEdit
    Tag = 50
    Left = 8
    Top = 146
    Width = 96
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object edNUM_PERIODO: TEdit
    Tag = 50
    Left = 8
    Top = 186
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object edPLAZO: TEdit
    Tag = 18
    Left = 8
    Top = 226
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
  end
  object dtpF_VENCIMIENTO: TInterDateTimePicker
    Tag = 18
    Left = 98
    Top = 266
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 38917.7128606713
    Time = 38917.7128606713
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 6
    Edit = edF_VENCIMIENTO
    Formato = dfDate
  end
  object edF_VENCIMIENTO: TEdit
    Tag = 18
    Left = 8
    Top = 266
    Width = 90
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 7
  end
  object dtpF_PROG_PAGO: TInterDateTimePicker
    Tag = 18
    Left = 98
    Top = 306
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 38917.7128606713
    Time = 38917.7128606713
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 8
    Edit = edF_PROG_PAGO
    Formato = dfDate
  end
  object edF_PROG_PAGO: TEdit
    Tag = 18
    Left = 8
    Top = 306
    Width = 90
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 9
  end
  object edIMP_CUOTA: TEdit
    Tag = 18
    Left = 216
    Top = 106
    Width = 150
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 10
  end
  object edIMP_IVA: TEdit
    Tag = 18
    Left = 216
    Top = 146
    Width = 150
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 11
  end
  object edTASA_APLICADA: TEdit
    Tag = 18
    Left = 216
    Top = 26
    Width = 150
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 12
  end
  object edSIT_COM_CUOTA: TEdit
    Tag = 18
    Left = 216
    Top = 66
    Width = 32
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 13
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
