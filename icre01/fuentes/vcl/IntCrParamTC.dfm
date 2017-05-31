object WCrParamTC: TWCrParamTC
  Left = 321
  Top = 121
  Width = 587
  Height = 604
  Caption = 'Configuración de Parámetros usados por Algoritmos B-6'
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
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 97
    Height = 13
    Caption = 'Clave de parámetros'
  end
  object Label32: TLabel
    Left = 514
    Top = 508
    Width = 37
    Height = 7
    Caption = 'V20160831'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -7
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object PnDatos: TPanel
    Left = 14
    Top = 540
    Width = 554
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
  object edCVE_PAR_TRASCAR: TInterEdit
    Tag = 50
    Left = 136
    Top = 21
    Width = 89
    Height = 21
    HelpContext = 1000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    MaxLength = 6
    TabOrder = 1
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edPCT_PSOS_KPAGPER: TInterEdit
    Tag = 18
    Left = 296
    Top = 197
    Width = 89
    Height = 21
    HelpContext = 4000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_PSOS_KPAGPERExit
    MaxLength = 4
    TabOrder = 4
    Enabled = False
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edPCT_PSOS_KPAGVEN: TInterEdit
    Tag = 18
    Left = 296
    Top = 157
    Width = 89
    Height = 21
    HelpContext = 3000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_PSOS_KPAGVENExit
    MaxLength = 4
    TabOrder = 3
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edDIAS_IN_PAGADO: TInterEdit
    Tag = 18
    Left = 296
    Top = 237
    Width = 89
    Height = 21
    HelpContext = 5000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    OnExit = edDIAS_IN_PAGADOExit
    MaxLength = 2
    TabOrder = 5
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edDIAS_VENC_REVOL: TInterEdit
    Tag = 18
    Left = 296
    Top = 85
    Width = 89
    Height = 21
    HelpContext = 2000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    MaxLength = 2
    TabOrder = 2
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edPCT_PLAZO_RSRE: TInterEdit
    Tag = 18
    Left = 296
    Top = 277
    Width = 89
    Height = 21
    HelpContext = 6000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_PLAZO_RSREExit
    MaxLength = 4
    TabOrder = 6
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edPCT_PAG_K_RSRE: TInterEdit
    Tag = 18
    Left = 295
    Top = 321
    Width = 89
    Height = 21
    HelpContext = 7000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_PAG_K_RSREExit
    MaxLength = 4
    TabOrder = 7
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object StaticText1: TStaticText
    Left = 32
    Top = 192
    Width = 241
    Height = 30
    AutoSize = False
    Caption = '% Capital pagado en créditos periodicos para pago sostenido'
    TabOrder = 12
  end
  object StaticText2: TStaticText
    Left = 32
    Top = 152
    Width = 246
    Height = 29
    AutoSize = False
    Caption = 
      '% Capital pagado en créditos Bullet o SemiBullet para pago soste' +
      'nido'
    TabOrder = 13
  end
  object StaticText3: TStaticText
    Left = 32
    Top = 232
    Width = 246
    Height = 29
    AutoSize = False
    Caption = 
      'Días de interes devengado en créditos Bullet o SemiBullet para p' +
      'ago sostenido'
    TabOrder = 14
  end
  object StaticText4: TStaticText
    Left = 32
    Top = 80
    Width = 255
    Height = 29
    AutoSize = False
    Caption = 
      'Días de impago para créditos revolventes vigentes y traspasarlos' +
      ' a vencido'
    TabOrder = 15
  end
  object StaticText5: TStaticText
    Left = 32
    Top = 272
    Width = 255
    Height = 29
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 
      '% para dividir en 2 el plazo del crédito y determinar la cartera' +
      ' de RS/RE (80 - 20)'
    ParentBiDiMode = False
    TabOrder = 16
  end
  object StaticText6: TStaticText
    Left = 32
    Top = 320
    Width = 255
    Height = 33
    AutoSize = False
    Caption = 
      '% de capital pagado en el último rango del plazo del crédito y d' +
      'eterminar la cartera de RS/RE'
    TabOrder = 17
  end
  object StaticText7: TStaticText
    Left = 24
    Top = 56
    Width = 194
    Height = 17
    Caption = 'EVALUACIÓN DE CARTERA VIGENTE'
    TabOrder = 18
  end
  object StaticText8: TStaticText
    Left = 24
    Top = 128
    Width = 194
    Height = 17
    Caption = 'EVALUACIÓN DE CARTERA VENCIDA'
    TabOrder = 19
  end
  object MsgPanel: TPanel
    Left = 13
    Top = 518
    Width = 555
    Height = 20
    TabOrder = 20
  end
  object StaticText9: TStaticText
    Left = 32
    Top = 368
    Width = 255
    Height = 41
    AutoSize = False
    Caption = 
      '% sobre importe dispuesto de la línea de crédito para traspasar ' +
      'a cartera vencida todas las disposiciones al amparo de la misma'
    TabOrder = 21
  end
  object edPCT_LIN_RSRE_VEN: TInterEdit
    Tag = 18
    Left = 295
    Top = 377
    Width = 89
    Height = 21
    HelpContext = 8000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_LIN_RSRE_VENExit
    MaxLength = 4
    TabOrder = 8
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object StaticText10: TStaticText
    Left = 32
    Top = 424
    Width = 255
    Height = 29
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 
      'Dias de Interes devengado después de la fecha de corte para cons' +
      'iderar pagado el interés'
    ParentBiDiMode = False
    TabOrder = 22
  end
  object edDIAS_IN_DEVENGADO: TInterEdit
    Tag = 18
    Left = 296
    Top = 429
    Width = 89
    Height = 21
    HelpContext = 9000
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    OnExit = edDIAS_IN_DEVENGADOExit
    MaxLength = 4
    TabOrder = 9
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object StaticText11: TStaticText
    Left = 32
    Top = 464
    Width = 255
    Height = 29
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 
      'Fecha de liberación quitar  +/- 5 días de  traspaso a cartera ve' +
      'ncida en interéses'
    ParentBiDiMode = False
    TabOrder = 23
  end
  object dtpF_Sin_Masmen_5: TInterDateTimePicker
    Tag = 18
    Left = 373
    Top = 464
    Width = 20
    Height = 21
    HelpContext = 9051
    CalAlignment = dtaLeft
    Date = 37777.7691627546
    Time = 37777.7691627546
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 11
    OnExit = dtpF_Sin_Masmen_5Exit
    Edit = edF_Sin_Masmen_5
    Formato = dfDate
  end
  object edF_Sin_Masmen_5: TEdit
    Tag = 18
    Left = 295
    Top = 464
    Width = 76
    Height = 21
    HelpContext = 9050
    Color = clWhite
    TabOrder = 10
    OnExit = edF_Sin_Masmen_5Exit
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
    FormaEstilo = feVertical
    CanEdit = False
    IsNewData = False
    ShowBtnNuevo = False
    ShowBtnEliminar = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowBtnBuscar = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 410
    Top = 10
  end
end
