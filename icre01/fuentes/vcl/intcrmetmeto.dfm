object WCrMetMetodologi: TWCrMetMetodologi
  Left = 283
  Top = 174
  Width = 842
  Height = 264
  Caption = 'Configuración de Metodologías'
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
    Width = 809
    Height = 209
    Align = alTop
    TabOrder = 0
    object lbID_METODOLOGIA: TLabel
      Left = 8
      Top = 12
      Width = 136
      Height = 13
      Caption = 'Identificador de Metodología'
    end
    object lbDESCRIPCION: TLabel
      Left = 8
      Top = 76
      Width = 56
      Height = 13
      Caption = 'Descripción'
    end
    object lbCVES_MET_RELAC: TLabel
      Left = 8
      Top = 108
      Width = 133
      Height = 13
      Caption = 'Metodologías Relacionadas'
    end
    object lbNOMBRE: TLabel
      Left = 8
      Top = 44
      Width = 100
      Height = 13
      Caption = 'Nombre Metodología'
    end
    object edID_METODOLOGIA: TEdit
      Left = 152
      Top = 12
      Width = 81
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edDESCRIPCION: TEdit
      Tag = 18
      Left = 152
      Top = 76
      Width = 673
      Height = 21
      TabOrder = 2
    end
    object rdgSIT_METODOLOGIA: TRadioGroup
      Tag = 18
      Left = 640
      Top = 16
      Width = 185
      Height = 33
      Caption = 'Situación'
      Columns = 2
      Items.Strings = (
        'Activa'
        'Inactiva')
      TabOrder = 4
      TabStop = True
    end
    object edNOMBRE: TEdit
      Tag = 18
      Left = 152
      Top = 44
      Width = 369
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object clbCVES_MET_RELAC: TCheckListBox
      Tag = 18
      Left = 152
      Top = 108
      Width = 321
      Height = 85
      OnClickCheck = clbCVES_MET_RELACClickCheck
      ItemHeight = 13
      TabOrder = 3
    end
    object edCVES_MET_RELAC: TEdit
      Left = 152
      Top = 204
      Width = 121
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 5
      Visible = False
      OnChange = edCVES_MET_RELACChange
    end
  end
  object PnDatos: TPanel
    Left = 0
    Top = 209
    Width = 809
    Height = 19
    Align = alTop
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
      Left = 456
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
      Left = 456
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
      Left = 520
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
      Left = 520
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
    Left = 578
    Top = 130
  end
  object qMetodologiasRelac: TQuery
    SQL.Strings = (
      'Select Cve_Clave,'
      '       Initcap (Desc_Clave) Desc_Cve'
      '  From Cr_Con_Cat_Data'
      ' Where Cve_Con_Gpo_Cat = '#39'CAT_METODOLOGIA'#39)
    Left = 608
    Top = 128
  end
end
