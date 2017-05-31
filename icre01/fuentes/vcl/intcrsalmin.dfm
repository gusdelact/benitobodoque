object WCrSalarioMinimo: TWCrSalarioMinimo
  Left = 511
  Top = 359
  Width = 582
  Height = 251
  Caption = 'Catálogo de Cr Salario Minimo'
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
  object lbID_SALARIO: TLabel
    Left = 136
    Top = 34
    Width = 155
    Height = 16
    Caption = 'Salario Mínimo Actual:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbF_ACTUALIZACION: TLabel
    Left = 8
    Top = 74
    Width = 96
    Height = 13
    Caption = 'Fecha Actualizacion'
  end
  object lbIMP_SALARIO: TLabel
    Left = 144
    Top = 74
    Width = 136
    Height = 13
    Caption = 'Importe Salario Minimo Diario'
  end
  object Label1: TLabel
    Left = 8
    Top = 10
    Width = 87
    Height = 13
    Caption = 'Número de Salario'
  end
  object lbsalmin_ac: TLabel
    Left = 336
    Top = 34
    Width = 29
    Height = 16
    Caption = '0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edID_SALARIO: TEdit
    Tag = 50
    Left = 8
    Top = 26
    Width = 97
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 0
  end
  object dtpF_ACTUALIZACION: TInterDateTimePicker
    Tag = 18
    Left = 98
    Top = 90
    Width = 21
    Height = 21
    HelpContext = 1002
    CalAlignment = dtaLeft
    Date = 40570.5593628819
    Time = 40570.5593628819
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 2
    OnExit = edF_ACTUALIZACIONExit
    Edit = edF_ACTUALIZACION
    Formato = dfDate
  end
  object edF_ACTUALIZACION: TEdit
    Tag = 18
    Left = 8
    Top = 90
    Width = 90
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    TabOrder = 1
    OnExit = edF_ACTUALIZACIONExit
  end
  object edIMP_SALARIO: TEdit
    Tag = 18
    Left = 144
    Top = 90
    Width = 89
    Height = 21
    HelpContext = 2001
    CharCase = ecUpperCase
    TabOrder = 3
    OnExit = edIMP_SALARIOExit
  end
  object PnDatos: TPanel
    Left = 2
    Top = 193
    Width = 568
    Height = 19
    TabOrder = 4
    object lbEmpresa: TLabel
      Left = 11
      Top = 2
      Width = 42
      Height = 8
      Caption = 'EMPRESA :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbUsuario: TLabel
      Left = 11
      Top = 9
      Width = 44
      Height = 8
      Caption = 'USUARIO : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbFecha: TLabel
      Left = 320
      Top = 2
      Width = 50
      Height = 8
      Caption = 'FECHA HOY :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbPerfil: TLabel
      Left = 320
      Top = 9
      Width = 33
      Height = 8
      Caption = 'PERFIL :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDUsuario: TLabel
      Left = 75
      Top = 9
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDPerfil: TLabel
      Left = 384
      Top = 9
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDFecha: TLabel
      Left = 384
      Top = 2
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDEmpresa: TLabel
      Left = 75
      Top = 2
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnAntesNuevo = InterForma1AntesNuevo
    OnBuscar = InterForma1Buscar
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
    Left = 354
    Top = 10
  end
end
