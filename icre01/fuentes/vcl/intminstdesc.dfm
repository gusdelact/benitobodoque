object wMInstDesc: TwMInstDesc
  Left = 287
  Top = 215
  Width = 567
  Height = 305
  Caption = 'Catálogo de Institución Descontadora'
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
  object lbCVE_FND_ENT_DES: TLabel
    Left = 8
    Top = 10
    Width = 84
    Height = 26
    Caption = 'Clave de Entidad Descontadora'
    WordWrap = True
  end
  object lbDESC_ENT_DES: TLabel
    Left = 8
    Top = 50
    Width = 94
    Height = 26
    Caption = 'Nombre de Entidad Desccontadora'
    WordWrap = True
  end
  object lbB_CONTABILIZA: TLabel
    Left = 8
    Top = 134
    Width = 51
    Height = 13
    Caption = 'Contabiliza'
  end
  object Label1: TLabel
    Left = 8
    Top = 90
    Width = 83
    Height = 26
    Caption = 'Importe Limite de Operacion'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 174
    Width = 47
    Height = 13
    Caption = 'Garantías'
    WordWrap = True
  end
  object edCVE_FND_ENT_DES: TEdit
    Tag = 50
    Left = 128
    Top = 10
    Width = 160
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edDESC_ENT_DES: TEdit
    Tag = 18
    Left = 128
    Top = 50
    Width = 425
    Height = 21
    HelpContext = 1000
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object chB_CONTABILIZA: TCheckBox
    Tag = 18
    Left = 128
    Top = 130
    Width = 121
    Height = 21
    HelpContext = 1200
    TabOrder = 3
  end
  object PnDatos: TPanel
    Left = 0
    Top = 246
    Width = 559
    Height = 21
    TabOrder = 7
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
  object rgB_TASA_ACTIVA: TRadioGroup
    Tag = 18
    Left = 271
    Top = 110
    Width = 218
    Height = 43
    HelpContext = 1300
    Caption = 'Tipo de Capitalizacion de Credito'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Tasa Activa'
      'Tasa Pasiva')
    TabOrder = 4
    OnExit = rgB_TASA_ACTIVAExit
  end
  object edIMP_LIMITE: TInterEdit
    Tag = 18
    Left = 128
    Top = 90
    Width = 95
    Height = 21
    HelpContext = 1100
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_LIMITEExit
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    TabOrder = 2
    CharCase = ecUpperCase
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object rgCVE_TIPO_LINEA: TRadioGroup
    Tag = 18
    Left = 271
    Top = 197
    Width = 218
    Height = 43
    HelpContext = 1500
    Caption = 'Tipo de Línea'
    Columns = 2
    Items.Strings = (
      'Revocable'
      'Irrevocable')
    TabOrder = 6
    OnExit = rgCVE_TIPO_LINEAExit
  end
  object edDESC_GARANTIA: TEdit
    Tag = 18
    Left = 128
    Top = 169
    Width = 425
    Height = 21
    HelpContext = 1400
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 5
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
    Left = 338
    Top = 10
  end
end
