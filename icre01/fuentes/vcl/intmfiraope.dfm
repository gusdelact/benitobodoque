object wMFiraOpe: TwMFiraOpe
  Left = 487
  Top = 289
  Width = 518
  Height = 179
  Caption = 'Catálogo Operativas'
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
  object Label3: TLabel
    Left = 1
    Top = 8
    Width = 27
    Height = 13
    Caption = 'Clave'
    WordWrap = True
  end
  object Label4: TLabel
    Left = 1
    Top = 29
    Width = 56
    Height = 13
    Caption = 'Descripción'
    WordWrap = True
  end
  object PnlMsg: TPanel
    Left = 0
    Top = 101
    Width = 510
    Height = 21
    TabOrder = 2
  end
  object PnDatos: TPanel
    Left = 0
    Top = 122
    Width = 510
    Height = 21
    TabOrder = 3
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
      Left = 262
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
      Left = 262
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
      Left = 326
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
      Left = 326
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
  object edCVE_OPERATIVA: TEdit
    Tag = 50
    Left = 101
    Top = 4
    Width = 80
    Height = 21
    Hint = 'Clave de identificación de tipo de garantía'
    HelpContext = 1000
    CharCase = ecUpperCase
    MaxLength = 6
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnExit = edCVE_OPERATIVAExit
  end
  object edDESC_OPERATIVA: TEdit
    Tag = 18
    Left = 101
    Top = 25
    Width = 403
    Height = 21
    Hint = 'Descripción del tipo de garantía'
    HelpContext = 2000
    CharCase = ecUpperCase
    MaxLength = 50
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnExit = edDESC_OPERATIVAExit
  end
  object Button1: TButton
    Left = 440
    Top = 0
    Width = 57
    Height = 25
    Caption = 'Button1'
    TabOrder = 4
    Visible = False
    OnClick = Button1Click
  end
  object rgSIT_OPERATIVA: TRadioGroup
    Tag = 18
    Left = 99
    Top = 58
    Width = 179
    Height = 32
    HelpContext = 3000
    Caption = 'Situación de la Operativa'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Activa'
      'Inactiva')
    TabOrder = 5
    TabStop = True
    OnExit = rgSIT_OPERATIVAExit
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesEliminar = InterForma1AntesEliminar
    OnBuscar = InterForma1Buscar
    msgSinRegistros = 'No existe un Registro para realizar la operación.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = '¿Desea Eliminar el Registro Actual?'
    FormaEstilo = feHorizontal
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 395
  end
end
