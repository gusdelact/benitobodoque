object WCrBlqConcepto: TWCrBlqConcepto
  Left = 461
  Top = 225
  Width = 655
  Height = 167
  Caption = 'Catálogo Concepto de Bloqueo'
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
  object lbCVE_BLQ_CPTO: TLabel
    Left = 5
    Top = 8
    Width = 27
    Height = 13
    Caption = 'Clave'
  end
  object lbDESC_BLQ_CPTO: TLabel
    Left = 103
    Top = 8
    Width = 182
    Height = 13
    Caption = 'Descripción del Concepto de Bloqueo '
  end
  object Label1: TLabel
    Left = 7
    Top = 57
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object Label2: TLabel
    Left = 7
    Top = 82
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object Label3: TLabel
    Left = 264
    Top = 82
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object Label4: TLabel
    Left = 264
    Top = 57
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object edCVE_BLQ_CPTO: TEdit
    Tag = 50
    Left = 5
    Top = 23
    Width = 94
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 0
  end
  object edDESC_BLQ_CPTO: TEdit
    Tag = 18
    Left = 101
    Top = 23
    Width = 538
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 50
    TabOrder = 1
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 355
    Top = 78
    Width = 135
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object edCVE_USU_ALTA: TEdit
    Left = 355
    Top = 53
    Width = 135
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object edF_ALTA: TEdit
    Left = 101
    Top = 53
    Width = 135
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object edF_MODIFICA: TEdit
    Left = 101
    Top = 78
    Width = 135
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object PnDatos: TPanel
    Left = 0
    Top = 111
    Width = 642
    Height = 19
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
      Left = 336
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
      Left = 336
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
      Left = 400
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
      Left = 400
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
  object rgSIT_BLQ_CONCEPTO: TRadioGroup
    Tag = 18
    Left = 494
    Top = 48
    Width = 148
    Height = 52
    HelpContext = 3000
    Caption = 'Situación'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Cancelado')
    TabOrder = 2
    TabStop = True
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
    Left = 604
    Top = 61
  end
end
