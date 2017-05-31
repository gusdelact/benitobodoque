object wCrCiProc: TwCrCiProc
  Left = 345
  Top = 168
  Width = 538
  Height = 199
  Caption = 'Catálogo Ciclos Procampo'
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
  object lbCVE_OPERACION: TLabel
    Left = 24
    Top = 18
    Width = 82
    Height = 13
    Caption = 'Fecha Aplicación'
  end
  object lbDESC_L_OPERACION: TLabel
    Left = 24
    Top = 45
    Width = 97
    Height = 13
    Caption = 'Subsidio X Hectárea'
  end
  object Label1: TLabel
    Left = 24
    Top = 73
    Width = 104
    Height = 13
    Caption = 'Fondo de Contigencia'
  end
  object edFechApli: TEdit
    Tag = 18
    Left = 135
    Top = 14
    Width = 73
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 6
    ReadOnly = True
    TabOrder = 0
  end
  object edSubHect: TEdit
    Tag = 18
    Left = 135
    Top = 41
    Width = 95
    Height = 21
    HelpContext = 3001
    CharCase = ecUpperCase
    MaxLength = 50
    TabOrder = 1
  end
  object rgSituacion: TRadioGroup
    Tag = 18
    Left = 23
    Top = 98
    Width = 281
    Height = 38
    HelpContext = 4001
    Caption = 'Situación'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Inactivo')
    TabOrder = 3
  end
  object PnDatos: TPanel
    Left = 0
    Top = 140
    Width = 528
    Height = 21
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
      Left = 248
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
      Left = 248
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
      Left = 312
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
      Left = 312
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
  object tpFechApli: TInterDateTimePicker
    Tag = 18
    Left = 209
    Top = 14
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 38230.5232205787
    Time = 38230.5232205787
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 5
    TabStop = False
    Edit = edFechApli
    Formato = dfDate
  end
  object edFonCont: TEdit
    Tag = 18
    Left = 135
    Top = 69
    Width = 95
    Height = 21
    HelpContext = 3001
    CharCase = ecUpperCase
    MaxLength = 50
    TabOrder = 2
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
    FormaEstilo = feVertical
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 282
    Top = 2
  end
end
