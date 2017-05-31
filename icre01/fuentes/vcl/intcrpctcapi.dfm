object WCrPctCapitaliz: TWCrPctCapitaliz
  Left = 244
  Top = 165
  Width = 545
  Height = 223
  Caption = 'Catálogo de Porcentaje de Capitalización'
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
  object lbPCT_CAPITALIZA: TLabel
    Left = 336
    Top = 36
    Width = 51
    Height = 13
    Caption = 'Porcentaje'
  end
  object lbDESC_CAPITALIZA: TLabel
    Left = 8
    Top = 74
    Width = 56
    Height = 13
    Caption = 'Descripción'
  end
  object Label1: TLabel
    Left = 8
    Top = 42
    Width = 65
    Height = 13
    Caption = 'Capitalización'
  end
  object Label2: TLabel
    Left = 8
    Top = 27
    Width = 44
    Height = 13
    Caption = 'Grupo de'
  end
  object edDESC_CAPITALIZA: TEdit
    Tag = 18
    Left = 80
    Top = 70
    Width = 449
    Height = 21
    HelpContext = 3001
    CharCase = ecUpperCase
    MaxLength = 80
    TabOrder = 2
    OnExit = edDESC_CAPITALIZAExit
  end
  object PnDatos: TPanel
    Left = 2
    Top = 166
    Width = 529
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
  object edPCT_CAPITALIZA: TInterEdit
    Tag = 18
    Left = 408
    Top = 32
    Width = 121
    Height = 21
    HelpContext = 2001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_CAPITALIZAExit
    DisplayMask = '###,##0.0000'
    MaxLength = 3
    TabOrder = 1
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edCVE_GPO_CAPITALIZ: TEdit
    Tag = 50
    Left = 80
    Top = 32
    Width = 121
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 0
    OnExit = edCVE_GPO_CAPITALIZExit
  end
  object MsgPanel: TPanel
    Left = 1
    Top = 147
    Width = 530
    Height = 19
    TabOrder = 4
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnBuscar = InterForma1Buscar
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
    Left = 402
    Top = 18
  end
end
