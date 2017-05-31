object WCrCalculoInt: TWCrCalculoInt
  Left = 273
  Top = 207
  Width = 549
  Height = 282
  Caption = 'Tipos de Cálculo de Intereses'
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
  object lbCVE_CALCULO_INT: TLabel
    Left = 8
    Top = 18
    Width = 124
    Height = 13
    Caption = 'Tipo de Cálculo de Interés'
  end
  object lbDESC_CALCULO: TLabel
    Left = 8
    Top = 58
    Width = 56
    Height = 13
    Caption = 'Descripción'
  end
  object edCVE_CALCULO_INT: TEdit
    Tag = 50
    Left = 144
    Top = 18
    Width = 121
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 2
    TabOrder = 1
    OnExit = edCVE_CALCULO_INTExit
  end
  object edDESC_CALCULO: TEdit
    Tag = 18
    Left = 144
    Top = 50
    Width = 385
    Height = 21
    HelpContext = 2001
    CharCase = ecUpperCase
    MaxLength = 80
    TabOrder = 2
    OnExit = edDESC_CALCULOExit
  end
  object PnDatos: TPanel
    Left = 0
    Top = 220
    Width = 530
    Height = 21
    TabOrder = 0
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
  object chB_INT_DIASIG: TCheckBox
    Tag = 18
    Left = 10
    Top = 153
    Width = 183
    Height = 17
    HelpContext = 5001
    Alignment = taLeftJustify
    Caption = 'Calculo de Interes Dia Siguiente'
    TabOrder = 5
    OnExit = chB_INT_DIASIGExit
  end
  object chB_INTERES_MOR: TCheckBox
    Tag = 18
    Left = 10
    Top = 89
    Width = 183
    Height = 17
    HelpContext = 3001
    Alignment = taLeftJustify
    Caption = 'Interes Moratorio'
    TabOrder = 3
    OnExit = chB_INTERES_MORExit
  end
  object chB_INTERES_ORD: TCheckBox
    Tag = 18
    Left = 10
    Top = 121
    Width = 183
    Height = 17
    HelpContext = 4001
    Alignment = taLeftJustify
    Caption = 'Interes Ordinario'
    TabOrder = 4
    OnExit = chB_INTERES_ORDExit
  end
  object chB_RECALC_CTAS: TCheckBox
    Tag = 18
    Left = 10
    Top = 185
    Width = 183
    Height = 17
    HelpContext = 6001
    Alignment = taLeftJustify
    Caption = 'Recalcular tramos en Cambio Tasa'
    TabOrder = 6
    OnExit = chB_RECALC_CTASExit
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
    Left = 410
    Top = 10
  end
end
