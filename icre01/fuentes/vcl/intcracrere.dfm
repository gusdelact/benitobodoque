object WCrAcreRe: TWCrAcreRe
  Left = 422
  Top = 296
  Width = 537
  Height = 342
  Caption = 'Acreditados Recuperación'
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
  object lbID_ACREDITADO: TLabel
    Left = 11
    Top = 18
    Width = 51
    Height = 13
    Caption = 'Acreditado'
  end
  object lbF_ALTA_RECU: TLabel
    Left = 22
    Top = 84
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object lbF_BAJA_RECU: TLabel
    Left = 164
    Top = 84
    Width = 72
    Height = 13
    Caption = 'Fecha  de Baja'
  end
  object lbID_REC: TLabel
    Left = 11
    Top = 58
    Width = 122
    Height = 13
    Caption = 'Número de Recuperación'
  end
  object edID_ACREDITADO: TEdit
    Left = 74
    Top = 10
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 8
    ReadOnly = True
    TabOrder = 5
  end
  object dtpF_ALTA_RECU: TInterDateTimePicker
    Tag = 18
    Left = 109
    Top = 100
    Width = 21
    Height = 21
    HelpContext = 1002
    CalAlignment = dtaLeft
    Date = 40564.3784884954
    Time = 40564.3784884954
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 2
    Edit = edF_ALTA_RECU
    Formato = dfDate
  end
  object edF_ALTA_RECU: TEdit
    Tag = 18
    Left = 19
    Top = 100
    Width = 90
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    TabOrder = 1
    OnExit = edF_ALTA_RECUExit
  end
  object dtpF_BAJA_RECU: TInterDateTimePicker
    Tag = 18
    Left = 255
    Top = 100
    Width = 21
    Height = 21
    HelpContext = 2002
    CalAlignment = dtaLeft
    Date = 40564.3784884954
    Time = 40564.3784884954
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 4
    OnExit = edF_BAJA_RECUExit
    Edit = edF_BAJA_RECU
    Formato = dfDate
  end
  object edF_BAJA_RECU: TEdit
    Tag = 18
    Left = 165
    Top = 100
    Width = 90
    Height = 21
    HelpContext = 2001
    CharCase = ecUpperCase
    TabOrder = 3
    OnExit = edF_BAJA_RECUExit
  end
  object edID_REC: TEdit
    Left = 152
    Top = 50
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 8
    ReadOnly = True
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 5
    Top = 288
    Width = 524
    Height = 19
    TabOrder = 6
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
      Left = 304
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
      Left = 320
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
      Left = 384
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
    object lbDfecha: TLabel
      Left = 384
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
    object lbDempresa: TLabel
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
  object edDESC_ACREDITADO: TEdit
    Left = 152
    Top = 10
    Width = 369
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 7
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 143
    Width = 329
    Height = 137
    Caption = 'Regjstro'
    Enabled = False
    TabOrder = 8
    object lbF_ALTA: TLabel
      Tag = -1
      Left = 8
      Top = 84
      Width = 123
      Height = 13
      Caption = 'Fecha de Registro de Alta'
    end
    object lbF_BAJA: TLabel
      Tag = -1
      Left = 154
      Top = 84
      Width = 126
      Height = 13
      Caption = 'Fecha de Registro de Baja'
    end
    object lbCVE_USU_BAJA: TLabel
      Tag = -1
      Left = 154
      Top = 28
      Width = 120
      Height = 13
      Caption = 'Clave de Usuario de Baja'
    end
    object lbCVE_USU_ALTA: TLabel
      Tag = -1
      Left = 8
      Top = 28
      Width = 117
      Height = 13
      Caption = 'Clave de Usuario de Alta'
    end
    object edF_ALTA: TEdit
      Left = 8
      Top = 100
      Width = 129
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      Enabled = False
      TabOrder = 3
    end
    object edF_BAJA: TEdit
      Left = 153
      Top = 100
      Width = 128
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      Enabled = False
      TabOrder = 0
    end
    object edCVE_USU_BAJA: TEdit
      Left = 153
      Top = 44
      Width = 128
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      Enabled = False
      TabOrder = 1
    end
    object edCVE_USU_ALTA: TEdit
      Left = 8
      Top = 44
      Width = 128
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      Enabled = False
      TabOrder = 2
    end
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesNuevo = InterForma1AntesNuevo
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
    ShowBtnEliminar = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 434
    Top = 44
  end
end
