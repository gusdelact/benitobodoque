object WCreConfDriver: TWCreConfDriver
  Left = 279
  Top = 346
  Width = 620
  Height = 277
  Caption = 'Configuración de Driver (Metify)'
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
  object lbID_CENT_COSTO: TLabel
    Left = 8
    Top = 10
    Width = 61
    Height = 13
    Caption = 'Centro Costo'
  end
  object lbTX_DISPONER: TLabel
    Left = 8
    Top = 50
    Width = 42
    Height = 13
    Caption = 'Disponer'
  end
  object lbTX_MONITOREAR: TLabel
    Left = 8
    Top = 90
    Width = 50
    Height = 13
    Caption = 'Monitorear'
  end
  object lbTX_RECUPERAR: TLabel
    Left = 8
    Top = 130
    Width = 50
    Height = 13
    Caption = 'Recuperar'
  end
  object lbCVE_USU_ALTA: TLabel
    Left = 8
    Top = 170
    Width = 85
    Height = 13
    Caption = 'Clave de Usu Alta'
  end
  object lbFH_ALTA: TLabel
    Left = 120
    Top = 170
    Width = 85
    Height = 13
    Caption = 'Fecha y Hora Alta'
  end
  object lbCVE_USU_MOD: TLabel
    Left = 311
    Top = 170
    Width = 88
    Height = 13
    Caption = 'Clave de Usu Mod'
  end
  object lbFH_MODIFICA: TLabel
    Left = 424
    Top = 170
    Width = 107
    Height = 13
    Caption = 'Fecha y Hora Modifica'
  end
  object edID_CENT_COSTO: TEdit
    Tag = 50
    Left = 8
    Top = 26
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edTX_DISPONER: TEdit
    Tag = 18
    Left = 8
    Top = 66
    Width = 594
    Height = 21
    TabOrder = 1
  end
  object edTX_MONITOREAR: TEdit
    Tag = 18
    Left = 8
    Top = 106
    Width = 594
    Height = 21
    TabOrder = 2
  end
  object edTX_RECUPERAR: TEdit
    Tag = 18
    Left = 8
    Top = 146
    Width = 594
    Height = 21
    TabOrder = 3
  end
  object edCVE_USU_ALTA: TEdit
    Tag = 18
    Left = 8
    Top = 186
    Width = 100
    Height = 21
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 4
  end
  object edFH_ALTA: TEdit
    Tag = 18
    Left = 120
    Top = 186
    Width = 180
    Height = 21
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 5
  end
  object edCVE_USU_MOD: TEdit
    Tag = 18
    Left = 311
    Top = 186
    Width = 100
    Height = 21
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 6
  end
  object edFH_MODIFICA: TEdit
    Tag = 18
    Left = 424
    Top = 186
    Width = 180
    Height = 21
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 7
  end
  object PnDatos: TPanel
    Left = 0
    Top = 220
    Width = 611
    Height = 21
    TabOrder = 8
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
    Left = 189
    Top = 194
  end
  object qDatos: TQuery
    Left = 431
    Top = 18
  end
end
