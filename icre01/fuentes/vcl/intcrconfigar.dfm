object WCrConfigAr: TWCrConfigAr
  Left = 296
  Top = 147
  Width = 656
  Height = 447
  Caption = 'Catálogo de CrConfigAr'
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
  object lbNOMBRE_CAM_ARC: TLabel
    Left = 8
    Top = 50
    Width = 80
    Height = 13
    Caption = 'Nombre Cam Arc'
  end
  object lbNOMBRE_CAM_BD: TLabel
    Left = 8
    Top = 90
    Width = 77
    Height = 13
    Caption = 'Nombre Cam Bd'
  end
  object lbVALOR_OMISON: TLabel
    Left = 8
    Top = 130
    Width = 62
    Height = 13
    Caption = 'Valor Omison'
  end
  object lbSIT_CONF_ARCNAF: TLabel
    Left = 8
    Top = 170
    Width = 103
    Height = 13
    Caption = 'Situación Conf Arcnaf'
  end
  object lbB_OBLIGATORIO: TLabel
    Left = 8
    Top = 210
    Width = 50
    Height = 13
    Caption = 'Obligatorio'
    Visible = False
  end
  object lbF_ALTA: TLabel
    Left = 8
    Top = 250
    Width = 51
    Height = 13
    Caption = 'Fecha Alta'
  end
  object lbCVE_USU_ALTA: TLabel
    Left = 8
    Top = 290
    Width = 85
    Height = 13
    Caption = 'Clave de Usu Alta'
  end
  object lbF_MODIFICA: TLabel
    Left = 8
    Top = 330
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object lbCVE_USU_MODIFICA: TLabel
    Left = 8
    Top = 370
    Width = 107
    Height = 13
    Caption = 'Clave de Usu Modifica'
  end
  object lbCVE_FORMATO_NAF: TLabel
    Left = 8
    Top = 2
    Width = 103
    Height = 13
    Caption = 'Clave Formato NAFIN'
  end
  object edNOMBRE_CAM_ARC: TEdit
    Tag = 50
    Left = 8
    Top = 66
    Width = 640
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edNOMBRE_CAM_BD: TEdit
    Tag = 18
    Left = 8
    Top = 106
    Width = 320
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object edVALOR_OMISON: TEdit
    Tag = 18
    Left = 8
    Top = 146
    Width = 320
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object edSIT_CONF_ARCNAF: TEdit
    Tag = 18
    Left = 8
    Top = 186
    Width = 32
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object chB_OBLIGATORIO: TCheckBox
    Tag = 18
    Left = 8
    Top = 226
    Width = 192
    Height = 21
    Caption = 'Obligatorio'
    TabOrder = 5
  end
  object dtpF_ALTA: TInterDateTimePicker
    Tag = 18
    Left = 98
    Top = 266
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 38644.5718326389
    Time = 38644.5718326389
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 6
    Edit = edF_ALTA
    Formato = dfDate
  end
  object edF_ALTA: TEdit
    Tag = 18
    Left = 8
    Top = 266
    Width = 90
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 7
  end
  object edCVE_USU_ALTA: TEdit
    Tag = 18
    Left = 8
    Top = 306
    Width = 128
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 8
  end
  object dtpF_MODIFICA: TInterDateTimePicker
    Tag = 18
    Left = 98
    Top = 346
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 38644.5718326389
    Time = 38644.5718326389
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 9
    Edit = edF_MODIFICA
    Formato = dfDate
  end
  object edF_MODIFICA: TEdit
    Tag = 18
    Left = 8
    Top = 346
    Width = 90
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 10
  end
  object edCVE_USU_MODIFICA: TEdit
    Tag = 18
    Left = 8
    Top = 386
    Width = 128
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 11
  end
  object edCVE_FORMATO_NAF: TEdit
    Tag = 50
    Left = 8
    Top = 18
    Width = 100
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 0
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
    Left = 370
    Top = 170
  end
end
