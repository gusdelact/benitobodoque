object WCrctacont: TWCrctacont
  Left = 471
  Top = 230
  Width = 441
  Height = 214
  Caption = 'Catálogo de Cuentas Contables PPO'
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
  object Label25: TLabel
    Left = 11
    Top = 134
    Width = 33
    Height = 13
    Caption = 'F. Alta:'
  end
  object Label27: TLabel
    Left = 267
    Top = 134
    Width = 43
    Height = 13
    Caption = 'Usu Alta:'
  end
  object PnDatos: TPanel
    Left = 0
    Top = 164
    Width = 433
    Height = 21
    TabOrder = 0
    object lbEmpresa: TLabel
      Left = 4
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
      Left = 4
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
      Left = 293
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
      Left = 310
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
      Left = 49
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
      Left = 346
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
      Left = 346
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
      Left = 49
      Top = 2
      Width = 240
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
  object GroupBox2: TGroupBox
    Left = 1
    Top = 1
    Width = 432
    Height = 119
    Caption = 'Alta de Cuenta'
    TabOrder = 1
    object Label3: TLabel
      Left = 10
      Top = 26
      Width = 34
      Height = 13
      Caption = 'Cuenta'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 11
      Top = 57
      Width = 53
      Height = 13
      Caption = 'Cve. Desc.'
      WordWrap = True
    end
    object Label1: TLabel
      Left = 11
      Top = 87
      Width = 37
      Height = 13
      Caption = 'F. Inicio'
      WordWrap = True
    end
    object Label4: TLabel
      Left = 254
      Top = 34
      Width = 56
      Height = 13
      Caption = 'Descripción'
      WordWrap = True
    end
    object CBXCveDesc: TComboBox
      Tag = 18
      Left = 79
      Top = 53
      Width = 92
      Height = 21
      ItemHeight = 13
      MaxLength = 5
      TabOrder = 1
      OnChange = CBXCveDescChange
      Items.Strings = (
        'PROV'
        'CNEJ'
        'GSTO')
    end
    object edDesc: TInterEdit
      Left = 169
      Top = 53
      Width = 250
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 10
      Color = clBtnFace
      TabOrder = 3
      ReadOnly = True
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object dtpFECHA: TInterDateTimePicker
      Tag = 18
      Left = 150
      Top = 85
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 40966.4495066667
      Time = 40966.4495066667
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
      OnEnter = dtpFECHAEnter
      OnExit = dtpFECHAExit
      Edit = edF_Inicio
      Formato = dfDate
    end
    object edCuenta: TInterEdit
      Tag = 18
      Left = 79
      Top = 21
      Width = 90
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 9
      TabOrder = 0
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edFECHAINI: TInterEdit
      Tag = 18
      Left = 79
      Top = 85
      Width = 72
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 10
      TabOrder = 4
      ReadOnly = True
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edF_Inicio: TEdit
      Tag = 512
      Left = 169
      Top = 85
      Width = 76
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 5
      Visible = False
      OnChange = edF_InicioChange
      OnExit = edF_InicioExit
    end
  end
  object edUsuAlta: TInterEdit
    Left = 329
    Top = 130
    Width = 90
    Height = 21
    HelpContext = 1100
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    MaxLength = 6
    Color = clBtnFace
    TabOrder = 2
    ReadOnly = True
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edF_ALTA: TInterEdit
    Left = 81
    Top = 130
    Width = 90
    Height = 21
    HelpContext = 1100
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    MaxLength = 6
    Color = clBtnFace
    TabOrder = 3
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesCancelar = InterForma1DespuesCancelar
    OnAntesAceptar = InterForma1AntesAceptar
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
    Left = 402
    Top = 2
  end
end
