object WCrProvSector: TWCrProvSector
  Left = 303
  Top = 88
  Width = 652
  Height = 288
  Caption = 'Sector por Proveedor'
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
  object lbCVE_SECTOR_PRO: TLabel
    Left = 8
    Top = 10
    Width = 61
    Height = 13
    Caption = 'Clave Sector'
  end
  object lbDESC_SECTOR: TLabel
    Left = 8
    Top = 34
    Width = 56
    Height = 13
    Caption = 'Descripción'
  end
  object lbPCT_MAX_PROV_PF: TLabel
    Left = 8
    Top = 58
    Width = 66
    Height = 13
    Caption = '% Máximo  PF'
  end
  object lbPCT_MAX_PROV_PM: TLabel
    Left = 8
    Top = 82
    Width = 69
    Height = 13
    Caption = '% Máximo  PM'
  end
  object lbIMP_MAX_PROV_PF: TLabel
    Left = 384
    Top = 58
    Width = 75
    Height = 13
    Caption = 'Imp. Máximo PF'
  end
  object lbIMP_MAX_PROV_PM: TLabel
    Left = 384
    Top = 82
    Width = 78
    Height = 13
    Caption = 'Imp. Máximo PM'
  end
  object Label16: TLabel
    Left = 8
    Top = 151
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object Label18: TLabel
    Left = 8
    Top = 178
    Width = 66
    Height = 13
    Caption = 'Hora Modifica'
  end
  object Label17: TLabel
    Left = 384
    Top = 151
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object Label19: TLabel
    Left = 384
    Top = 178
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object edCVE_SECTOR_PRO: TEdit
    Tag = 50
    Left = 136
    Top = 6
    Width = 110
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 0
    OnExit = edCVE_SECTOR_PROExit
  end
  object edDESC_SECTOR: TEdit
    Tag = 18
    Left = 136
    Top = 30
    Width = 497
    Height = 21
    HelpContext = 2001
    CharCase = ecUpperCase
    MaxLength = 60
    TabOrder = 1
    OnExit = edDESC_SECTORExit
  end
  object IedPCT_MAX_PROV_PF: TInterEdit
    Tag = 18
    Left = 136
    Top = 54
    Width = 110
    Height = 21
    HelpContext = 3001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = IedPCT_MAX_PROV_PFExit
    DisplayMask = '#######0.0000'
    MaxLength = 12
    TabOrder = 2
    UseReType = False
    UseSep = False
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object IedPCT_MAX_PROV_PM: TInterEdit
    Tag = 18
    Left = 136
    Top = 78
    Width = 110
    Height = 21
    HelpContext = 5001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = IedPCT_MAX_PROV_PMExit
    DisplayMask = '#######0.0000'
    MaxLength = 12
    TabOrder = 4
    UseReType = False
    UseSep = False
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object IedIMP_MAX_PROV_PF: TInterEdit
    Tag = 18
    Left = 523
    Top = 54
    Width = 110
    Height = 21
    HelpContext = 4001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = IedIMP_MAX_PROV_PFExit
    DisplayMask = '###,###,###,###,###,##0.00'
    MaxLength = 12
    TabOrder = 3
    UseReType = True
    UseSep = False
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object rgSIT_PROV_SECTOR: TRadioGroup
    Tag = 18
    Left = 8
    Top = 106
    Width = 625
    Height = 37
    HelpContext = 7001
    Caption = 'Situación del Sector'
    Columns = 2
    Items.Strings = (
      'Activo'
      'Inactivo')
    TabOrder = 6
    TabStop = True
    OnExit = rgSIT_PROV_SECTORExit
  end
  object MsgPanel: TPanel
    Left = 1
    Top = 205
    Width = 640
    Height = 25
    TabOrder = 7
  end
  object PnDatos: TPanel
    Left = 1
    Top = 230
    Width = 640
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
      Left = 352
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
      Left = 352
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
      Left = 416
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
      Left = 416
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
  object edFH_CAPTURA: TEdit
    Left = 136
    Top = 147
    Width = 160
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 9
  end
  object edH_MODIFICA: TEdit
    Left = 136
    Top = 174
    Width = 160
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 10
  end
  object edCVE_USU_ALTA: TEdit
    Left = 523
    Top = 147
    Width = 110
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 11
  end
  object edCVE_USUARIO_MOD: TEdit
    Left = 523
    Top = 174
    Width = 110
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 12
  end
  object IedIMP_MAX_PROV_PM: TInterEdit
    Tag = 18
    Left = 523
    Top = 78
    Width = 110
    Height = 21
    HelpContext = 6001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = IedIMP_MAX_PROV_PMExit
    DisplayMask = '###,###,###,###,###,##0.00'
    MaxLength = 12
    TabOrder = 5
    UseReType = True
    UseSep = False
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
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
    Left = 354
    Top = 2
  end
end
