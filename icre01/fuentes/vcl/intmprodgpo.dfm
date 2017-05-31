object wMProdGpo: TwMProdGpo
  Left = 340
  Top = 177
  Width = 527
  Height = 394
  Caption = 'Catálogo de Grupo de Productos'
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
  object lbClave: TLabel
    Left = 1
    Top = 8
    Width = 30
    Height = 13
    Caption = 'Clave:'
    WordWrap = True
  end
  object lbDescCorta: TLabel
    Left = 1
    Top = 29
    Width = 87
    Height = 13
    Caption = 'Descripción Corta:'
  end
  object lbDescLarga: TLabel
    Left = 1
    Top = 50
    Width = 89
    Height = 13
    Caption = 'Descripción Larga:'
  end
  object lbEntidades: TLabel
    Left = 1
    Top = 98
    Width = 47
    Height = 13
    Caption = 'Entidades'
  end
  object lbDescontadoras: TLabel
    Left = 1
    Top = 114
    Width = 75
    Height = 13
    Caption = 'Descontadoras:'
  end
  object lbTasaFija: TLabel
    Left = 1
    Top = 277
    Width = 46
    Height = 13
    Caption = 'Tasa Fija:'
  end
  object lbTasaVariable: TLabel
    Left = 1
    Top = 302
    Width = 68
    Height = 13
    Caption = 'Tasa Variable:'
  end
  object PnlMsg: TPanel
    Left = 8
    Top = 323
    Width = 510
    Height = 21
    TabOrder = 3
  end
  object PnDatos: TPanel
    Left = 8
    Top = 344
    Width = 510
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
  object edCVE_PRODUCTO_GPO: TEdit
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
    OnExit = edCVE_PRODUCTO_GPOExit
  end
  object edDESC_C_PROD_GPO: TEdit
    Tag = 18
    Left = 101
    Top = 25
    Width = 403
    Height = 21
    Hint = 'Descripción del tipo de garantía'
    HelpContext = 2000
    CharCase = ecUpperCase
    MaxLength = 30
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnExit = edDESC_C_PROD_GPOExit
  end
  object edDESC_L_PROD_GPO: TEdit
    Tag = 18
    Left = 101
    Top = 46
    Width = 403
    Height = 21
    Hint = 'Descripción del tipo de garantía'
    HelpContext = 3000
    CharCase = ecUpperCase
    MaxLength = 80
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnExit = edDESC_L_PROD_GPOExit
  end
  object cbxB_APLICA_FONDEO: TCheckBox
    Tag = 18
    Left = 102
    Top = 72
    Width = 97
    Height = 17
    HelpContext = 4000
    Caption = 'Aplica Fondeo'
    TabOrder = 5
    OnExit = cbxB_APLICA_FONDEOExit
  end
  object CL_EntDesc: TCheckListBox
    Left = 104
    Top = 96
    Width = 401
    Height = 145
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 6
  end
  object Lidentdesc: TListBox
    Left = 16
    Top = 184
    Width = 25
    Height = 17
    TabStop = False
    ItemHeight = 13
    TabOrder = 7
    Visible = False
  end
  object cbxB_APLICA_CAT: TCheckBox
    Tag = 18
    Left = 102
    Top = 249
    Width = 97
    Height = 17
    HelpContext = 5000
    Caption = 'Aplica CAT'
    TabOrder = 8
    OnExit = cbxB_APLICA_CATExit
  end
  object edtTasaFija: TEdit
    Tag = 18
    Left = 72
    Top = 273
    Width = 432
    Height = 21
    Hint = 'Leyenda CAT Tasa Fija'
    HelpContext = 2000
    MaxLength = 30
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnExit = edtTasaFijaExit
  end
  object edtTasaVariable: TEdit
    Tag = 18
    Left = 72
    Top = 297
    Width = 432
    Height = 21
    Hint = 'Leyenda CAT Tasa Variable'
    HelpContext = 2000
    MaxLength = 30
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnExit = edtTasaVariableExit
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesEliminar = InterForma1DespuesEliminar
    OnDespuesCancelar = InterForma1DespuesCancelar
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
    Left = 211
  end
end
