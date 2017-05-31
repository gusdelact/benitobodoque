object WCrcathrfe: TWCrcathrfe
  Left = 444
  Top = 212
  Width = 505
  Height = 236
  Caption = 'Modifica Horario'
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
  object GroupBox1: TGroupBox
    Left = 2
    Top = 1
    Width = 495
    Height = 110
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 25
      Width = 39
      Height = 13
      Caption = 'Proceso'
    end
    object Label4: TLabel
      Left = 11
      Top = 70
      Width = 51
      Height = 13
      Caption = 'Hora Inicio'
    end
    object Label5: TLabel
      Left = 285
      Top = 70
      Width = 40
      Height = 13
      Caption = 'Hora Fin'
    end
    object Label6: TLabel
      Left = 82
      Top = 85
      Width = 85
      Height = 13
      Caption = '(Formato 24 HRS)'
    end
    object Label7: TLabel
      Left = 346
      Top = 85
      Width = 85
      Height = 13
      Caption = '(Formato 24 HRS)'
    end
    object edCVE_PROCESO: TEdit
      Tag = 512
      Left = 70
      Top = 20
      Width = 81
      Height = 21
      Color = clBtnFace
      TabOrder = 0
    end
    object edDESC_PROCESO: TEdit
      Tag = 512
      Left = 156
      Top = 20
      Width = 321
      Height = 21
      Color = clBtnFace
      TabOrder = 1
    end
    object edH_INI: TInterEdit
      Tag = 18
      Left = 70
      Top = 66
      Width = 110
      Height = 21
      HelpContext = 2000
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      OnExit = edH_INIExit
      MaxLength = 10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 2
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edH_FIN: TInterEdit
      Tag = 18
      Left = 332
      Top = 66
      Width = 110
      Height = 21
      HelpContext = 2000
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 3
      UseReType = False
      UseSep = True
      UseDisplay = True
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object TGroupBox
    Left = 2
    Top = 120
    Width = 495
    Height = 55
    Caption = 'Datos de la última modificación'
    TabOrder = 1
    object Label2: TLabel
      Left = 11
      Top = 24
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label3: TLabel
      Left = 283
      Top = 24
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object IEfechaModifica: TEdit
      Left = 71
      Top = 20
      Width = 112
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object IEUsuarioModifica: TEdit
      Left = 332
      Top = 20
      Width = 109
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
  end
  object PnDatos: TPanel
    Left = 2
    Top = 186
    Width = 495
    Height = 21
    TabOrder = 2
    object lbEmpresa: TLabel
      Left = 7
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
      Left = 7
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
      Left = 316
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
      Left = 316
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
      Left = 51
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
      Left = 369
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
      Left = 51
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
    object lbDPerfil: TLabel
      Left = 352
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
    Left = 434
    Top = 2
  end
end
