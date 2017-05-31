object WCrsatadc: TWCrsatadc
  Left = 341
  Top = 203
  Width = 507
  Height = 169
  Caption = 'Relacion Contrato-Domicilio Const.Hip.'
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
  object lbID_CONTRATO: TLabel
    Left = 8
    Top = 10
    Width = 40
    Height = 13
    Caption = 'Contrato'
  end
  object lbID_DOM_FISCAL: TLabel
    Left = 8
    Top = 50
    Width = 66
    Height = 13
    Caption = 'ID Dom Fiscal'
  end
  object lbID_DOM_GARANTIA: TLabel
    Left = 120
    Top = 50
    Width = 79
    Height = 13
    Caption = 'ID Dom Garantia'
  end
  object lbSIGLAS_RFC: TLabel
    Left = 232
    Top = 50
    Width = 48
    Height = 13
    Caption = 'Siglas Rfc'
  end
  object lbF_RFC: TLabel
    Left = 312
    Top = 50
    Width = 50
    Height = 13
    Caption = 'Fecha Rfc'
  end
  object lbHOMOCLAVE_RFC: TLabel
    Left = 408
    Top = 50
    Width = 74
    Height = 13
    Caption = 'Homoclave Rfc'
  end
  object edID_CONTRATO: TEdit
    Left = 8
    Top = 26
    Width = 97
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 0
  end
  object edID_DOM_FISCAL: TEdit
    Tag = 18
    Left = 8
    Top = 66
    Width = 97
    Height = 21
    HelpContext = 1010
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edID_DOM_GARANTIA: TEdit
    Tag = 18
    Left = 120
    Top = 66
    Width = 97
    Height = 21
    HelpContext = 1020
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object edSIGLAS_RFC: TEdit
    Tag = 18
    Left = 232
    Top = 66
    Width = 64
    Height = 21
    HelpContext = 1030
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object edF_RFC: TEdit
    Tag = 18
    Left = 312
    Top = 66
    Width = 81
    Height = 21
    HelpContext = 1040
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object edHOMOCLAVE_RFC: TEdit
    Tag = 18
    Left = 408
    Top = 66
    Width = 64
    Height = 21
    HelpContext = 1050
    CharCase = ecUpperCase
    TabOrder = 5
  end
  object PnDatos: TPanel
    Left = 8
    Top = 101
    Width = 473
    Height = 21
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
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 258
    Top = 10
  end
end
