object WCrCatTipAval: TWCrCatTipAval
  Left = 259
  Top = 235
  Width = 475
  Height = 234
  Caption = 'Catálogo Tipo de Aval'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 467
    Height = 97
    Align = alTop
    TabOrder = 0
    object lbDESC_TIPO_AVAL: TLabel
      Left = 8
      Top = 50
      Width = 104
      Height = 13
      Caption = 'Descripción Tipo Aval'
    end
    object lbCVE_AVAL: TLabel
      Left = 8
      Top = 10
      Width = 66
      Height = 13
      Caption = 'Clave de Aval'
    end
    object edDESC_TIPO_AVAL: TEdit
      Tag = 18
      Left = 9
      Top = 66
      Width = 448
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnExit = edDESC_TIPO_AVALExit
    end
    object edCVE_AVAL: TEdit
      Left = 8
      Top = 26
      Width = 73
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      Enabled = False
      TabOrder = 0
    end
    object rgSIT_GARANT: TRadioGroup
      Tag = 18
      Left = 312
      Top = 12
      Width = 145
      Height = 37
      Caption = 'Situación'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Activo'
        'Inactivo')
      TabOrder = 2
      TabStop = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 467
    Height = 64
    Align = alClient
    TabOrder = 1
    object lbF_ALTA: TLabel
      Left = 8
      Top = 10
      Width = 51
      Height = 13
      Caption = 'Fecha Alta'
    end
    object lbFH_MODIFICACION: TLabel
      Left = 136
      Top = 10
      Width = 127
      Height = 13
      Caption = 'Fecha y Hora Modificacion'
    end
    object lbCVE_USUAR_MODIF: TLabel
      Left = 304
      Top = 10
      Width = 144
      Height = 13
      Caption = 'Clave de Usuario Modificación'
    end
    object edF_ALTA: TEdit
      Left = 8
      Top = 28
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 0
    end
    object edFH_MODIFICACION: TEdit
      Left = 133
      Top = 28
      Width = 140
      Height = 21
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 1
    end
    object edCVE_USUAR_MODIF: TEdit
      Left = 304
      Top = 28
      Width = 128
      Height = 21
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 2
    end
  end
  object PnlMsg: TPanel
    Left = 0
    Top = 161
    Width = 467
    Height = 20
    Align = alBottom
    TabOrder = 2
  end
  object PnDatos: TPanel
    Left = 0
    Top = 181
    Width = 467
    Height = 19
    Align = alBottom
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
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesNuevo = InterForma1AntesNuevo
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
    Left = 90
    Top = 2
  end
end
