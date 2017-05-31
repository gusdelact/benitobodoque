object WCracrdmps: TWCracrdmps
  Left = 400
  Top = 257
  Width = 555
  Height = 332
  Caption = 'Evidencia de Capacidad de Pago Acreditado'
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
  object Label2: TLabel
    Left = 11
    Top = 236
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object Label3: TLabel
    Left = 310
    Top = 236
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object PnDatos: TPanel
    Left = -7
    Top = 272
    Width = 544
    Height = 21
    TabOrder = 0
    object lbEmpresa: TLabel
      Left = 11
      Top = 4
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
      Top = 11
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
      Left = 323
      Top = 4
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
      Left = 323
      Top = 11
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
      Left = 56
      Top = 11
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
      Left = 359
      Top = 11
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
      Left = 375
      Top = 4
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
      Left = 56
      Top = 4
      Width = 257
      Height = 8
      AutoSize = False
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object GroupBox1: TGroupBox
    Left = 1
    Top = 3
    Width = 537
    Height = 47
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 20
      Width = 51
      Height = 13
      Caption = 'Acreditado'
      WordWrap = True
    end
    object edACREDITADO: TEdit
      Tag = 512
      Left = 73
      Top = 16
      Width = 76
      Height = 21
      HelpContext = 2000
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edNOMBRE_ACRED: TEdit
      Tag = 512
      Left = 154
      Top = 16
      Width = 365
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 1
    Top = 54
    Width = 537
    Height = 159
    Caption = 'Características'
    TabOrder = 2
    object ChBIncumpli: TCheckBox
      Tag = 18
      Left = 73
      Top = 31
      Width = 410
      Height = 17
      Caption = 'La probabilidad de Incumplimiento intrínseca al acreditado'
      TabOrder = 0
    end
    object ChBGtiasOtor: TCheckBox
      Tag = 18
      Left = 73
      Top = 115
      Width = 410
      Height = 17
      Caption = 'Las garantías otorgadas al crédito reestructurado o renovado'
      TabOrder = 1
    end
    object ChBPrelaAcre: TCheckBox
      Tag = 18
      Left = 73
      Top = 87
      Width = 410
      Height = 17
      Caption = 'La prelación de pago frente a otros acreedores.'
      TabOrder = 2
    end
    object ChBliqacre: TCheckBox
      Tag = 18
      Left = 73
      Top = 59
      Width = 410
      Height = 17
      Caption = 
        'La liquidez del acreditado ante la nueva estructura financiera d' +
        'el financiamiento.'
      TabOrder = 3
    end
  end
  object IEfechaModifica: TEdit
    Left = 93
    Top = 232
    Width = 134
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object IEUsuarioModifica: TEdit
    Left = 399
    Top = 232
    Width = 85
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
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
    Left = 442
    Top = 2
  end
end
