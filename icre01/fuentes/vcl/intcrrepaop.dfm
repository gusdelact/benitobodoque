object WCrRelPagOprn: TWCrRelPagOprn
  Left = 384
  Top = 206
  Width = 645
  Height = 138
  Caption = 'Opciones de renovacion pagaré'
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
  object lbID_REL_PAG_DISP: TLabel
    Left = 69
    Top = 84
    Width = 212
    Height = 13
    Caption = 'Número de Rel Pag Disp, NO SE MUESTRA'
    Visible = False
    WordWrap = True
  end
  object Label19: TLabel
    Left = 84
    Top = 3
    Width = 78
    Height = 31
    Alignment = taCenter
    AutoSize = False
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label20: TLabel
    Left = 84
    Top = 3
    Width = 78
    Height = 27
    Alignment = taCenter
    AutoSize = False
    Caption = 'Tasa Neta'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label1: TLabel
    Left = 164
    Top = 3
    Width = 25
    Height = 31
    Alignment = taCenter
    AutoSize = False
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label21: TLabel
    Left = 191
    Top = 3
    Width = 155
    Height = 30
    Alignment = taCenter
    AutoSize = False
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label22: TLabel
    Left = 194
    Top = 3
    Width = 149
    Height = 28
    Alignment = taCenter
    AutoSize = False
    Caption = 'Clave a Renovar'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label13: TLabel
    Left = 405
    Top = 3
    Width = 105
    Height = 31
    Alignment = taCenter
    AutoSize = False
    Caption = 'Importe a Renovar'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label4: TLabel
    Left = 348
    Top = 3
    Width = 55
    Height = 30
    Alignment = taCenter
    AutoSize = False
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label8: TLabel
    Left = 351
    Top = 3
    Width = 51
    Height = 28
    Alignment = taCenter
    AutoSize = False
    Caption = 'Porcentaje I.S.R.'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label7: TLabel
    Left = 164
    Top = 3
    Width = 25
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Pzo'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label3: TLabel
    Left = 580
    Top = 3
    Width = 55
    Height = 29
    Alignment = taCenter
    AutoSize = False
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 581
    Top = 3
    Width = 52
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = ' Renovar'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label23: TLabel
    Left = 512
    Top = 3
    Width = 66
    Height = 36
    Alignment = taCenter
    AutoSize = False
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label24: TLabel
    Left = 512
    Top = 3
    Width = 66
    Height = 31
    Alignment = taCenter
    AutoSize = False
    Caption = 'Nueva F Vencimiento'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label5: TLabel
    Left = 3
    Top = 3
    Width = 78
    Height = 31
    Alignment = taCenter
    AutoSize = False
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label6: TLabel
    Left = 4
    Top = 3
    Width = 78
    Height = 27
    Alignment = taCenter
    AutoSize = False
    Caption = 'Tasa Bruta'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Panel1: TPanel
    Left = 580
    Top = 34
    Width = 55
    Height = 22
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clWindow
    TabOrder = 7
  end
  object edID_REL_PAG_DISP: TEdit
    Left = 283
    Top = 82
    Width = 35
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 8
    Visible = False
  end
  object chB_RENOVAR: TCheckBox
    Tag = 18
    Left = 602
    Top = 37
    Width = 14
    Height = 16
    Color = clBtnFace
    ParentColor = False
    TabOrder = 6
    OnClick = chB_RENOVARClick
  end
  object edCVE_IMP_RENOV: TComboBox
    Tag = 18
    Left = 190
    Top = 34
    Width = 158
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    OnChange = edCVE_IMP_RENOVChange
    Items.Strings = (
      'Total al vencer '#39'TO'#39
      'Solo Capital      '#39'CP'#39
      'Importe             '#39'IM'#39
      'No Renovar     '#39'NA'#39)
  end
  object edDIAS_PLAZO: TInterEdit
    Tag = 18
    Left = 164
    Top = 34
    Width = 25
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnEnter = edDIAS_PLAZOEnter
    OnExit = edDIAS_PLAZOExit
    DisplayMask = '###,###,###,###,##0'
    MaxLength = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 2
    UseReType = False
    UseSep = False
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edPCT_ISR: TInterEdit
    Tag = 18
    Left = 348
    Top = 34
    Width = 56
    Height = 21
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,###,##0.000000'
    MaxLength = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 4
    ReadOnly = True
    UseReType = False
    UseSep = False
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clGrayText
    ColorNeg = clGrayText
  end
  object edIMP_RENOVAR: TInterEdit
    Tag = 18
    Left = 405
    Top = 34
    Width = 106
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnEnter = edIMP_RENOVAREnter
    OnExit = edIMP_RENOVARExit
    DisplayMask = '###,###,###,###,###,###,##0.00'
    MaxLength = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 5
    UseReType = False
    UseSep = False
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object PnDatos: TPanel
    Left = 4
    Top = 82
    Width = 633
    Height = 22
    TabOrder = 9
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
      Left = 308
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
      Left = 308
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
      Left = 372
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
      Left = 372
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
  object edTASA_NETA: TInterEdit
    Tag = 18
    Left = 82
    Top = 34
    Width = 81
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnEnter = edTASA_NETAEnter
    OnExit = edTASA_NETAExit
    DisplayMask = '###,###,###,###,##0.00000000'
    MaxLength = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 1
    UseReType = False
    UseSep = False
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edF_VENCIMIENTO: TEdit
    Left = 512
    Top = 34
    Width = 66
    Height = 21
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 10
  end
  object btnTasaInteres: TButton
    Left = 4
    Top = 58
    Width = 140
    Height = 22
    Caption = '&Restaura Tasa a Aplicar'
    TabOrder = 11
    OnClick = btnTasaInteresClick
  end
  object edTASA_BRUTA: TInterEdit
    Tag = 18
    Left = 2
    Top = 34
    Width = 80
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edTASA_BRUTAExit
    DisplayMask = '###,###,###,###,##0.00000000'
    MaxLength = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 0
    UseReType = False
    UseSep = False
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
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
    ShowBtnBuscar = False
    ShowBtnAyuda = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    OnDespuesShow = InterForma1DespuesShow
    Left = 608
    Top = 51
  end
end
