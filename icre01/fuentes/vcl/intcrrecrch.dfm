object WCrRelCredCheq: TWCrRelCredCheq
  Left = 300
  Top = 124
  Width = 623
  Height = 483
  Caption = 'Chequeras por Disposición'
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
  object lbID_CREDITO: TLabel
    Left = 8
    Top = 10
    Width = 54
    Height = 13
    Caption = 'Disposición'
  end
  object lbCUENTA_BANCO: TLabel
    Left = 192
    Top = 8
    Width = 79
    Height = 13
    Caption = 'Cuenta  / Banco'
  end
  object lbIMP_BLOQUEADO: TLabel
    Left = 336
    Top = 56
    Width = 74
    Height = 13
    Caption = 'Imp. a Bloquear'
  end
  object Label3: TLabel
    Left = 8
    Top = 33
    Width = 66
    Height = 13
    Caption = 'Titular Cuenta'
  end
  object lbUSUA_ALTA: TLabel
    Left = 10
    Top = 361
    Width = 43
    Height = 13
    Caption = 'Usu. Alta'
  end
  object lbF_ALTA: TLabel
    Left = 10
    Top = 382
    Width = 45
    Height = 13
    Caption = 'F. de Alta'
  end
  object lbUSUA_MODIF: TLabel
    Left = 333
    Top = 361
    Width = 65
    Height = 13
    Caption = 'Usu. Modifica'
  end
  object lbF_MODIF: TLabel
    Left = 333
    Top = 382
    Width = 52
    Height = 13
    Caption = 'F. Modifica'
  end
  object Label23: TLabel
    Left = 38
    Top = 229
    Width = 171
    Height = 13
    Caption = '                      Chequeras                  '
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label1: TLabel
    Left = 6
    Top = 229
    Width = 31
    Height = 13
    Caption = ' Sec.  '
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 210
    Top = 229
    Width = 341
    Height = 13
    Caption = 
      '                                                    Titular     ' +
      '                                               '
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 552
    Top = 229
    Width = 33
    Height = 13
    Caption = '   Sit.   '
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lbSECUENCIA: TLabel
    Left = 8
    Top = 56
    Width = 51
    Height = 13
    Caption = 'Secuencia'
  end
  object edID_CREDITO: TEdit
    Left = 113
    Top = 6
    Width = 65
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  object edCUENTA_BANCO: TEdit
    Left = 297
    Top = 4
    Width = 280
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object IedIMP_A_BLOQUEAR: TInterEdit
    Left = 480
    Top = 52
    Width = 97
    Height = 21
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = IedIMP_A_BLOQUEARExit
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 12
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 2
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object rgSIT_REL_CRED: TRadioGroup
    Tag = 18
    Left = 5
    Top = 328
    Width = 580
    Height = 30
    HelpContext = 9000
    Caption = 'Situación'
    Columns = 2
    Items.Strings = (
      'Activo'
      'Inactivo')
    TabOrder = 4
    OnExit = rgSIT_REL_CREDExit
  end
  object edNOMBRE_TITULAR: TEdit
    Left = 113
    Top = 29
    Width = 464
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object edF_ALTA: TEdit
    Left = 116
    Top = 379
    Width = 150
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
  end
  object edCVE_USUA_ALTA: TEdit
    Left = 116
    Top = 358
    Width = 150
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
  end
  object edF_MODIF: TEdit
    Left = 436
    Top = 379
    Width = 150
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 9
  end
  object edCVE_USUA_MODIF: TEdit
    Left = 436
    Top = 358
    Width = 150
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
  end
  object MsgPanel: TPanel
    Left = 2
    Top = 401
    Width = 585
    Height = 20
    TabOrder = 11
  end
  object PnDatos: TPanel
    Left = 1
    Top = 421
    Width = 586
    Height = 18
    TabOrder = 12
    object lbEmpresa: TLabel
      Left = 11
      Top = 1
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
      Top = 8
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
      Left = 336
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
      Left = 336
      Top = 8
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
      Top = 8
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
      Left = 400
      Top = 8
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
      Left = 400
      Top = 1
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
      Top = 1
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
  object sgDATOS: TStringAlignGrid
    Left = 5
    Top = 241
    Width = 580
    Height = 89
    ColCount = 4
    DefaultRowHeight = 15
    FixedColor = clWhite
    FixedCols = 0
    FixedRows = 0
    PopupMenu = pmDV
    TabOrder = 13
    OnClick = sgDATOSClick
    ColWidths = (
      30
      170
      340
      20)
    PropCell = ()
    PropCol = (
      0
      1
      1
      0
      1
      1
      1
      0
      2
      1
      1
      0
      3
      1
      1
      0)
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = ()
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 80
    Width = 577
    Height = 146
    Caption = 'Configuración Aportaciones / Participaciones u Otro'
    TabOrder = 3
    object lbCTA_FIDEICOMISO: TLabel
      Left = 248
      Top = 21
      Width = 88
      Height = 13
      Caption = 'Cta. Fidei. Maestro'
    end
    object lbIMP_MIN_DEPOSITO: TLabel
      Left = 248
      Top = 44
      Width = 120
      Height = 13
      Caption = 'Imp. Minimo Part. / Aport.'
    end
    object lbDIA_RECEP_APORT: TLabel
      Left = 8
      Top = 99
      Width = 170
      Height = 13
      Caption = 'Día Inicio de Recep. Aport / PART.'
    end
    object lbDIA_SOLIC_PAGO: TLabel
      Left = 8
      Top = 120
      Width = 67
      Height = 13
      Caption = 'Día Sol. Pago'
    end
    object Bevel1: TBevel
      Left = 3
      Top = 65
      Width = 571
      Height = 2
    end
    object Bevel2: TBevel
      Left = 314
      Top = 67
      Width = 2
      Height = 75
    end
    object IedCTA_FIDEICOMISO: TInterEdit
      Tag = 18
      Left = 346
      Top = 17
      Width = 223
      Height = 21
      HelpContext = 4000
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      OnExit = IedCTA_FIDEICOMISOExit
      MaxLength = 20
      TabOrder = 1
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object IedIMP_MIN_DEPOSITO: TInterEdit
      Tag = 18
      Left = 472
      Top = 40
      Width = 97
      Height = 21
      HelpContext = 5000
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = IedIMP_MIN_DEPOSITOExit
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 2
      UseReType = True
      UseSep = True
      UseDisplay = True
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object IedDIA_RECEP_APORT: TInterEdit
      Tag = 18
      Left = 282
      Top = 95
      Width = 25
      Height = 21
      HelpContext = 7000
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      OnExit = IedDIA_RECEP_APORTExit
      MaxLength = 10
      TabOrder = 4
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object chB_MES_SIN_REC: TCheckBox
      Tag = 18
      Left = 328
      Top = 74
      Width = 244
      Height = 21
      HelpContext = 9000
      Alignment = taLeftJustify
      BiDiMode = bdLeftToRight
      Caption = 'Aplica Meses sin Recepción de Recursos'
      ParentBiDiMode = False
      TabOrder = 6
      OnExit = chB_MES_SIN_RECExit
    end
    object chB_DEPOSITO_APORT: TCheckBox
      Tag = 18
      Left = 8
      Top = 69
      Width = 297
      Height = 21
      HelpContext = 6000
      Alignment = taLeftJustify
      BiDiMode = bdLeftToRight
      Caption = 'Se recibirán depósitos por Aport./ Participaciones u Otro'
      ParentBiDiMode = False
      TabOrder = 3
      OnExit = chB_DEPOSITO_APORTExit
    end
    object IedDIA_SOLIC_PAGO: TInterEdit
      Tag = 18
      Left = 282
      Top = 116
      Width = 25
      Height = 21
      HelpContext = 8000
      Prefijo = '1'
      Contrato = -1
      TipoReader = trEntero
      OnExit = IedDIA_SOLIC_PAGOExit
      MaxLength = 10
      TabOrder = 5
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object rgCVE_TIPO_RAMO: TRadioGroup
      Tag = 18
      Left = 7
      Top = 14
      Width = 234
      Height = 44
      HelpContext = 3000
      Caption = 'Tipo Ramo'
      Columns = 3
      Items.Strings = (
        'Ramo 28'
        'Ramo 33'
        'Otro')
      TabOrder = 0
      OnExit = rgCVE_TIPO_RAMOExit
    end
    object btMESES_EXCEP: TBitBtn
      Tag = 17
      Left = 328
      Top = 99
      Width = 246
      Height = 39
      Caption = 'Meses Excepción'
      TabOrder = 7
      OnClick = btMESES_EXCEPClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
        777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
        79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
        777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
        79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
        CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
      NumGlyphs = 2
    end
  end
  object edSECUENCIA: TEdit
    Tag = 18
    Left = 113
    Top = 52
    Width = 73
    Height = 21
    HelpContext = 1000
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesEliminar = InterForma1DespuesEliminar
    OnDespuesCancelar = InterForma1DespuesCancelar
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
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    OnDespuesShow = InterForma1DespuesShow
    Left = 290
    Top = 2
  end
  object pmDV: TPopupMenu
    Left = 256
    Top = 264
    object ConsultaDepsitosalaVista1: TMenuItem
      Caption = 'Consulta Depósitos a la Vista'
      OnClick = ConsultaDepsitosalaVista1Click
    end
  end
end
