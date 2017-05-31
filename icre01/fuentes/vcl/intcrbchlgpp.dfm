object WCRBCHLGPP: TWCRBCHLGPP
  Left = 172
  Top = 231
  Width = 866
  Height = 468
  Caption = 'Bitácora de Cambios Histórico Líneas Garantía Primeras Pérdidas'
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
  object lblFechaAlta: TLabel
    Left = 2
    Top = 22
    Width = 72
    Height = 13
    Caption = 'Fecha Registro'
  end
  object Label3: TLabel
    Left = 103
    Top = 23
    Width = 12
    Height = 13
    Caption = 'de'
  end
  object Label4: TLabel
    Left = 243
    Top = 23
    Width = 6
    Height = 13
    Caption = 'a'
  end
  object lbAplica: TLabel
    Left = 571
    Top = 2
    Width = 81
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Aplica Búsqueda'
    WordWrap = True
  end
  object edFIniAlta: TEdit
    Tag = 17
    Left = 127
    Top = 17
    Width = 81
    Height = 21
    HelpContext = 2001
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 0
  end
  object stpInicioAlta: TInterDateTimePicker
    Tag = 17
    Left = 210
    Top = 17
    Width = 21
    Height = 21
    HelpContext = 3101
    CalAlignment = dtaLeft
    Date = 38196.3921868981
    Time = 38196.3921868981
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
    TabStop = False
    Edit = edFIniAlta
    Formato = dfDate
  end
  object edFFinAlta: TEdit
    Tag = 17
    Left = 261
    Top = 17
    Width = 81
    Height = 21
    HelpContext = 2001
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 2
  end
  object stpFinAlta: TInterDateTimePicker
    Tag = 17
    Left = 345
    Top = 17
    Width = 21
    Height = 21
    HelpContext = 3101
    CalAlignment = dtaLeft
    Date = 38196.3921868981
    Time = 38196.3921868981
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
    TabStop = False
    Edit = edFFinAlta
    Formato = dfDate
  end
  object chkFechaAlta: TCheckBox
    Tag = 512
    Left = 603
    Top = 19
    Width = 18
    Height = 17
    TabOrder = 4
    OnClick = chkFechaAltaClick
  end
  object PnDatos: TPanel
    Left = -2
    Top = 409
    Width = 851
    Height = 21
    TabOrder = 5
    object lbEmpresa: TLabel
      Left = 5
      Top = 3
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
      Left = 5
      Top = 10
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
      Left = 344
      Top = 3
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
      Left = 344
      Top = 10
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
      Left = 69
      Top = 10
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
      Left = 408
      Top = 10
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
      Left = 408
      Top = 3
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
      Left = 69
      Top = 3
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
  object sgcData: TSGCtrl
    Left = 0
    Top = 72
    Width = 849
    Height = 337
    ShowTab = True
    TabOrder = 6
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
  end
  object bGenera: TButton
    Left = 705
    Top = 44
    Width = 129
    Height = 25
    Caption = 'Generar'
    TabOrder = 7
    OnClick = bGeneraClick
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
    Left = 398
    Top = 17
  end
end
