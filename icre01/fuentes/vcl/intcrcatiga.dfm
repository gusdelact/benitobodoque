object WCrCatTipGar: TWCrCatTipGar
  Left = 326
  Top = 293
  Width = 645
  Height = 230
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
  object PnlMsg: TPanel
    Left = 0
    Top = 157
    Width = 637
    Height = 20
    Align = alBottom
    TabOrder = 0
  end
  object PnDatos: TPanel
    Left = 0
    Top = 177
    Width = 637
    Height = 19
    Align = alBottom
    TabOrder = 1
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 637
    Height = 105
    Align = alTop
    TabOrder = 2
    object lbDESC_GARANT: TLabel
      Left = 8
      Top = 51
      Width = 95
      Height = 13
      Caption = 'Descripción de Aval'
    end
    object edDESC_GARANT: TEdit
      Tag = 18
      Left = 8
      Top = 67
      Width = 385
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 104
      Height = 48
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object lbCVE_GARANT: TLabel
        Left = 8
        Top = 2
        Width = 66
        Height = 13
        Caption = 'Clave de Aval'
      end
      object edCVE_GARANT: TEdit
        Tag = 18
        Left = 8
        Top = 18
        Width = 89
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
    object rgSIT_GARANT: TRadioGroup
      Tag = 18
      Left = 440
      Top = 51
      Width = 129
      Height = 41
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
    Top = 105
    Width = 637
    Height = 52
    Align = alClient
    TabOrder = 3
    object lbF_ALTA: TLabel
      Left = 8
      Top = 4
      Width = 51
      Height = 13
      Caption = 'Fecha Alta'
    end
    object lbFH_MODIFICACION: TLabel
      Left = 112
      Top = 4
      Width = 127
      Height = 13
      Caption = 'Fecha y Hora Modificacion'
    end
    object lbCVE_USUAR_MODIF: TLabel
      Left = 248
      Top = 4
      Width = 144
      Height = 13
      Caption = 'Clave de Usuario Modificación'
    end
    object edF_ALTA: TEdit
      Tag = 18
      Left = 8
      Top = 20
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object edFH_MODIFICACION: TEdit
      Tag = 18
      Left = 112
      Top = 20
      Width = 129
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object edCVE_USUAR_MODIF: TEdit
      Tag = 18
      Left = 248
      Top = 20
      Width = 128
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
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
    Left = 434
    Top = 66
  end
end
