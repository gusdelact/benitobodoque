object WCrMesesSinRec: TWCrMesesSinRec
  Left = 279
  Top = 46
  Width = 588
  Height = 312
  Caption = 'Meses de Excepción'
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
  object lbSECUENCIA: TLabel
    Left = 448
    Top = 10
    Width = 51
    Height = 13
    Caption = 'Secuencia'
  end
  object lbCUENTA_BANCO: TLabel
    Left = 8
    Top = 32
    Width = 79
    Height = 13
    Caption = 'Cuenta  / Banco'
  end
  object Label3: TLabel
    Left = 8
    Top = 54
    Width = 66
    Height = 13
    Caption = 'Titular Cuenta'
  end
  object Label1: TLabel
    Left = 8
    Top = 76
    Width = 70
    Height = 13
    Caption = 'Mes Exception'
  end
  object Label2: TLabel
    Left = 344
    Top = 76
    Width = 106
    Height = 13
    Caption = 'Fecha Fin Mes Excep.'
  end
  object Label4: TLabel
    Left = 8
    Top = 10
    Width = 54
    Height = 13
    Caption = 'Disposición'
  end
  object edTIT_FECHA: TEdit
    Left = 4
    Top = 96
    Width = 75
    Height = 16
    TabStop = False
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 2
    Text = ' DISPOSICION'
  end
  object Edit9: TEdit
    Left = 80
    Top = 96
    Width = 261
    Height = 16
    TabStop = False
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 3
    Text = 
      '                                   CHEQUERA                     ' +
      '             '
  end
  object Edit7: TEdit
    Left = 342
    Top = 96
    Width = 70
    Height = 16
    TabStop = False
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 4
    Text = '  SECUENCIA '
  end
  object Edit8: TEdit
    Left = 413
    Top = 96
    Width = 89
    Height = 16
    TabStop = False
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 5
    Text = '            MES          '
  end
  object sgcDATOS: TSGCtrl
    Left = 1
    Top = 111
    Width = 576
    Height = 129
    ShowTab = True
    TabOrder = 6
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnMoveRow = sgcDATOSMoveRow
  end
  object edSECUENCIA: TEdit
    Left = 512
    Top = 6
    Width = 65
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
  end
  object edDESC_CREDITO: TEdit
    Left = 170
    Top = 6
    Width = 271
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
  end
  object edID_CREDITO: TEdit
    Left = 104
    Top = 6
    Width = 65
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 9
  end
  object edCUENTA_BANCO: TEdit
    Left = 104
    Top = 28
    Width = 200
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
  end
  object edBANCO: TEdit
    Left = 304
    Top = 28
    Width = 273
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 11
  end
  object edNOMBRE_TITULAR: TEdit
    Left = 104
    Top = 50
    Width = 473
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 12
  end
  object MsgPanel: TPanel
    Left = 2
    Top = 238
    Width = 575
    Height = 20
    TabOrder = 13
  end
  object PnDatos: TPanel
    Left = 1
    Top = 258
    Width = 576
    Height = 18
    TabOrder = 14
    object lbEmpresa: TLabel
      Left = 11
      Top = 1
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
      Top = 8
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
      Top = 1
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
      Top = 8
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
      Top = 8
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
      Top = 8
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
      Top = 1
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
      Top = 1
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
  object Edit1: TEdit
    Left = 503
    Top = 96
    Width = 71
    Height = 16
    TabStop = False
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 15
    Text = '      AÑO    '
  end
  object edF_INI_MES: TEdit
    Tag = 18
    Left = 104
    Top = 72
    Width = 87
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    TabOrder = 0
    OnExit = edF_INI_MESExit
  end
  object dtpF_INI_MES: TInterDateTimePicker
    Tag = 18
    Left = 192
    Top = 72
    Width = 21
    Height = 21
    HelpContext = 1002
    CalAlignment = dtaLeft
    Date = 37781.35659625
    Time = 37781.35659625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
    TabStop = False
    OnExit = edF_INI_MESExit
    Edit = edF_INI_MES
    Formato = dfDate
  end
  object edF_FIN_MES: TEdit
    Left = 468
    Top = 72
    Width = 87
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    Enabled = False
    ReadOnly = True
    TabOrder = 16
  end
  object dtpF_FIN_MES: TInterDateTimePicker
    Left = 556
    Top = 72
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 37781.35659625
    Time = 37781.35659625
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 17
    TabStop = False
    Edit = edF_FIN_MES
    Formato = dfDate
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
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
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    OnDespuesShow = InterForma1DespuesShow
    Left = 10
    Top = 10
  end
end
