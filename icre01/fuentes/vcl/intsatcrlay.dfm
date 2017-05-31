object WSatCrLayout: TWSatCrLayout
  Left = 295
  Top = 74
  Width = 661
  Height = 654
  Caption = 'Catálogo de Detalle de Constancias Hipotecarias'
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
  object lbID_EMPRESA: TLabel
    Left = 8
    Top = 2
    Width = 41
    Height = 13
    Caption = 'Empresa'
  end
  object lbEJERCICIO: TLabel
    Left = 72
    Top = 2
    Width = 40
    Height = 13
    Caption = 'Ejercicio'
  end
  object lbID_CONTRATO: TLabel
    Left = 88
    Top = 66
    Width = 40
    Height = 13
    Caption = 'Contrato'
  end
  object lbID_CREDITO: TLabel
    Left = 8
    Top = 66
    Width = 36
    Height = 13
    Caption = ' Credito'
  end
  object lbSDO_PROMEDIO: TLabel
    Left = 136
    Top = 242
    Width = 74
    Height = 13
    Caption = 'Saldo Promedio'
  end
  object lbTIPO_REGISTRO: TLabel
    Left = 424
    Top = 66
    Width = 63
    Height = 13
    Caption = 'Tipo Registro'
  end
  object lbCONSECUTIVO: TLabel
    Left = 536
    Top = 2
    Width = 59
    Height = 13
    Caption = 'Consecutivo'
  end
  object lbCVE_IDENTIFICADOR: TLabel
    Left = 504
    Top = 50
    Width = 58
    Height = 26
    Caption = 'Clave de Identificador'
    WordWrap = True
  end
  object lbRFC_CURP: TLabel
    Left = 8
    Top = 114
    Width = 21
    Height = 13
    Caption = 'RFC'
  end
  object lbNOMBRE_TIT: TLabel
    Left = 136
    Top = 114
    Width = 29
    Height = 13
    Caption = 'Titular'
  end
  object lbDOMICILIO: TLabel
    Left = 8
    Top = 338
    Width = 91
    Height = 13
    Caption = 'Domicilio del Titular'
  end
  object lbNUM_REFERENCIA: TLabel
    Left = 192
    Top = 66
    Width = 92
    Height = 13
    Caption = 'Número Referencia'
  end
  object lbNUM_REG_FIDE: TLabel
    Left = 8
    Top = 194
    Width = 109
    Height = 13
    Caption = 'Núm. Reg. Fideicomiso'
  end
  object lbCVE_DEST_CREDITO: TLabel
    Left = 584
    Top = 50
    Width = 58
    Height = 26
    Caption = 'Cve de Dest Credito'
    WordWrap = True
  end
  object lbIMP_INT_NOM_DEV: TLabel
    Left = 8
    Top = 290
    Width = 74
    Height = 13
    Caption = 'Int. Devengado'
  end
  object lbIMP_INT_PAG_ORD: TLabel
    Left = 136
    Top = 290
    Width = 100
    Height = 13
    Caption = 'Int. Pagado Ordinario'
  end
  object lbIMP_INT_MOR_DEV: TLabel
    Left = 264
    Top = 290
    Width = 121
    Height = 13
    Caption = 'Int. Moratorio Devengado'
  end
  object lbIMP_INT_MOR_PAG: TLabel
    Left = 392
    Top = 290
    Width = 102
    Height = 13
    Caption = 'Int. Moratorio Pagado'
  end
  object lbIMP_INT_REAL: TLabel
    Left = 520
    Top = 290
    Width = 40
    Height = 13
    Caption = 'Int. Real'
  end
  object lbSDO_CIE_ANIO_ANT: TLabel
    Left = 8
    Top = 242
    Width = 116
    Height = 13
    Caption = 'Saldo de Cierre Año Ant.'
  end
  object lbSDO_FEC_CONTR: TLabel
    Left = 264
    Top = 242
    Width = 68
    Height = 13
    Caption = 'Sdo Fec Contr'
  end
  object lbF_CONTRATACION: TLabel
    Left = 296
    Top = 66
    Width = 93
    Height = 13
    Caption = 'Fecha Contratacion'
  end
  object lbPROP_DEDUCIBLE: TLabel
    Left = 136
    Top = 194
    Width = 102
    Height = 13
    Caption = 'Proporcion Deducible'
  end
  object lbPCT_COP_SOC_CONY: TLabel
    Left = 392
    Top = 194
    Width = 61
    Height = 13
    Caption = 'Pct Conyuge'
  end
  object lbNUM_COPROPIET: TLabel
    Left = 8
    Top = 434
    Width = 90
    Height = 13
    Caption = 'Núm. Copropietario'
  end
  object lbRFC_CURP_COPRO: TLabel
    Left = 8
    Top = 482
    Width = 86
    Height = 13
    Caption = 'RFC Copropietario'
  end
  object lbNOMBRE_COPRO: TLabel
    Left = 136
    Top = 482
    Width = 102
    Height = 13
    Caption = 'Nombre Copropietario'
  end
  object lbRFC_CURP_CONYU: TLabel
    Left = 8
    Top = 530
    Width = 66
    Height = 13
    Caption = 'RFC Conyuge'
  end
  object lbNOMBRE_CONYU: TLabel
    Left = 136
    Top = 530
    Width = 82
    Height = 13
    Caption = 'Nombre Conyuge'
  end
  object lbDOMICILIO_INMU: TLabel
    Left = 336
    Top = 338
    Width = 105
    Height = 13
    Caption = 'Domicilio del Inmueble'
  end
  object lbNUM_IMPRESION: TLabel
    Left = 432
    Top = 2
    Width = 85
    Height = 13
    Caption = 'Número Impresion'
  end
  object lbPCT_PARTICIPACION: TLabel
    Left = 264
    Top = 194
    Width = 80
    Height = 13
    Caption = 'Pct Participacion'
  end
  object lbF_IMPRESION: TLabel
    Left = 328
    Top = 2
    Width = 78
    Height = 13
    Caption = 'Fecha Impresion'
  end
  object lbF_TIPO_UDI_INI: TLabel
    Left = 392
    Top = 242
    Width = 87
    Height = 13
    Caption = 'Fecha Tipo Udi Ini'
  end
  object lbF_TIPO_UDI_FIN: TLabel
    Left = 520
    Top = 242
    Width = 90
    Height = 13
    Caption = 'Fecha Tipo Udi Fin'
  end
  object edID_EMPRESA: TEdit
    Tag = -1
    Left = 8
    Top = 18
    Width = 49
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edEJERCICIO: TEdit
    Tag = -1
    Left = 72
    Top = 18
    Width = 57
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edID_CONTRATO: TEdit
    Tag = -1
    Left = 88
    Top = 82
    Width = 89
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 6
  end
  object edID_CREDITO: TEdit
    Tag = -1
    Left = 8
    Top = 82
    Width = 65
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 5
  end
  object edTIPO_REGISTRO: TEdit
    Tag = -1
    Left = 424
    Top = 82
    Width = 65
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 9
  end
  object edCONSECUTIVO: TEdit
    Tag = -1
    Left = 536
    Top = 18
    Width = 65
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object edCVE_IDENTIFICADOR: TEdit
    Tag = -1
    Left = 504
    Top = 82
    Width = 65
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 10
  end
  object edRFC_CURP: TEdit
    Tag = -1
    Left = 8
    Top = 130
    Width = 113
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 12
  end
  object edNOMBRE_TIT: TEdit
    Tag = -1
    Left = 136
    Top = 130
    Width = 497
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 13
  end
  object edNUM_REFERENCIA: TEdit
    Tag = -1
    Left = 192
    Top = 82
    Width = 89
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 7
  end
  object edNUM_REG_FIDE: TEdit
    Tag = 18
    Left = 8
    Top = 210
    Width = 113
    Height = 21
    HelpContext = 2010
    CharCase = ecUpperCase
    TabOrder = 15
    OnExit = edNUM_REG_FIDEExit
  end
  object edCVE_DEST_CREDITO: TEdit
    Tag = -1
    Left = 584
    Top = 82
    Width = 56
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 11
  end
  object edF_CONTRATACION: TEdit
    Tag = -1
    Left = 296
    Top = 82
    Width = 90
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 8
  end
  object edPROP_DEDUCIBLE: TEdit
    Tag = 18
    Left = 136
    Top = 210
    Width = 113
    Height = 21
    HelpContext = 2020
    CharCase = ecUpperCase
    TabOrder = 16
    OnExit = edPROP_DEDUCIBLEExit
  end
  object edPCT_COP_SOC_CONY: TEdit
    Tag = 18
    Left = 392
    Top = 210
    Width = 113
    Height = 21
    HelpContext = 2040
    CharCase = ecUpperCase
    TabOrder = 18
    OnExit = edPCT_COP_SOC_CONYExit
  end
  object edNUM_COPROPIET: TEdit
    Tag = -1
    Left = 8
    Top = 450
    Width = 89
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 33
  end
  object edRFC_CURP_COPRO: TEdit
    Tag = -1
    Left = 8
    Top = 498
    Width = 113
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 34
  end
  object edNOMBRE_COPRO: TEdit
    Tag = -1
    Left = 136
    Top = 498
    Width = 337
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 35
  end
  object edRFC_CURP_CONYU: TEdit
    Tag = -1
    Left = 8
    Top = 546
    Width = 113
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 36
  end
  object edNOMBRE_CONYU: TEdit
    Tag = -1
    Left = 136
    Top = 546
    Width = 336
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 37
  end
  object edNUM_IMPRESION: TEdit
    Tag = -1
    Left = 432
    Top = 18
    Width = 89
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object edPCT_PARTICIPACION: TEdit
    Tag = 18
    Left = 264
    Top = 210
    Width = 113
    Height = 21
    HelpContext = 2030
    CharCase = ecUpperCase
    TabOrder = 17
    OnExit = edPCT_PARTICIPACIONExit
  end
  object edF_IMPRESION: TEdit
    Tag = -1
    Left = 328
    Top = 18
    Width = 90
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object chB_REPORTA_SAT: TCheckBox
    Tag = 18
    Left = 8
    Top = 162
    Width = 128
    Height = 21
    HelpContext = 1010
    Caption = 'Reporta al SAT'
    TabOrder = 14
  end
  object dtpF_TIPO_UDI_INI: TInterDateTimePicker
    Tag = 18
    Left = 482
    Top = 258
    Width = 21
    Height = 21
    HelpContext = 3041
    CalAlignment = dtaLeft
    Date = 41647.767815162
    Time = 41647.767815162
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 23
    Edit = edF_TIPO_UDI_INI
    Formato = dfDate
  end
  object edF_TIPO_UDI_INI: TEdit
    Tag = 18
    Left = 392
    Top = 258
    Width = 90
    Height = 21
    HelpContext = 3040
    CharCase = ecUpperCase
    TabOrder = 22
    OnExit = edF_TIPO_UDI_INIExit
  end
  object dtpF_TIPO_UDI_FIN: TInterDateTimePicker
    Tag = 18
    Left = 610
    Top = 258
    Width = 21
    Height = 21
    HelpContext = 3051
    CalAlignment = dtaLeft
    Date = 41647.7678151736
    Time = 41647.7678151736
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 25
    Edit = edF_TIPO_UDI_FIN
    Formato = dfDate
  end
  object edF_TIPO_UDI_FIN: TEdit
    Tag = 18
    Left = 520
    Top = 258
    Width = 90
    Height = 21
    HelpContext = 3050
    CharCase = ecUpperCase
    TabOrder = 24
    OnExit = edF_TIPO_UDI_FINExit
  end
  object edSDO_PROMEDIO: TInterEdit
    Tag = 18
    Left = 135
    Top = 256
    Width = 114
    Height = 21
    HelpContext = 3020
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edSDO_PROMEDIOExit
    DisplayMask = '###,###,###,###,###,##0.00'
    MaxLength = 50
    Font.Charset = ANSI_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    TabOrder = 20
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edSDO_CIE_ANIO_ANT: TInterEdit
    Tag = 18
    Left = 7
    Top = 256
    Width = 114
    Height = 21
    HelpContext = 3010
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edSDO_CIE_ANIO_ANTExit
    DisplayMask = '###,###,###,###,###,##0.00'
    MaxLength = 50
    Font.Charset = ANSI_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    TabOrder = 19
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edIMP_INT_NOM_DEV: TInterEdit
    Tag = 18
    Left = 7
    Top = 304
    Width = 114
    Height = 21
    HelpContext = 4010
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_INT_NOM_DEVExit
    DisplayMask = '###,###,###,###,###,##0.00'
    MaxLength = 50
    Font.Charset = ANSI_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    TabOrder = 26
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edIMP_INT_PAG_ORD: TInterEdit
    Tag = 18
    Left = 135
    Top = 304
    Width = 114
    Height = 21
    HelpContext = 4020
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_INT_PAG_ORDExit
    DisplayMask = '###,###,###,###,###,##0.00'
    MaxLength = 50
    Font.Charset = ANSI_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    TabOrder = 27
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edIMP_INT_MOR_DEV: TInterEdit
    Tag = 18
    Left = 263
    Top = 304
    Width = 114
    Height = 21
    HelpContext = 4030
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_INT_MOR_DEVExit
    DisplayMask = '###,###,###,###,###,##0.00'
    MaxLength = 50
    Font.Charset = ANSI_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    TabOrder = 28
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edIMP_INT_MOR_PAG: TInterEdit
    Tag = 18
    Left = 391
    Top = 304
    Width = 114
    Height = 21
    HelpContext = 4040
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_INT_MOR_PAGExit
    DisplayMask = '###,###,###,###,###,##0.00'
    MaxLength = 50
    Font.Charset = ANSI_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    TabOrder = 29
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edIMP_INT_REAL: TInterEdit
    Tag = 18
    Left = 519
    Top = 304
    Width = 114
    Height = 21
    HelpContext = 4050
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_INT_REALExit
    DisplayMask = '###,###,###,###,###,##0.00'
    MaxLength = 50
    Font.Charset = ANSI_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    TabOrder = 30
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edSDO_FEC_CONTR: TInterEdit
    Tag = 18
    Left = 263
    Top = 256
    Width = 114
    Height = 21
    HelpContext = 3030
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edSDO_FEC_CONTRExit
    DisplayMask = '###,###,###,###,###,##0.00'
    MaxLength = 50
    Font.Charset = ANSI_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    TabOrder = 21
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edDOMICILIO: TMemo
    Tag = 18
    Left = 8
    Top = 352
    Width = 289
    Height = 73
    HelpContext = 5010
    TabOrder = 31
    OnExit = edDOMICILIOExit
  end
  object edDOMICILIO_INMU: TMemo
    Tag = 18
    Left = 336
    Top = 352
    Width = 289
    Height = 73
    HelpContext = 5020
    TabOrder = 32
    OnExit = edDOMICILIO_INMUExit
  end
  object PnDatos: TPanel
    Left = 0
    Top = 590
    Width = 633
    Height = 21
    TabOrder = 38
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
  object MsgPanel: TPanel
    Left = 2
    Top = 572
    Width = 631
    Height = 20
    TabOrder = 39
  end
  object btBITACORA_CRED: TBitBtn
    Left = 496
    Top = 543
    Width = 136
    Height = 20
    Caption = 'Bitacora x Credito'
    TabOrder = 40
    OnClick = btBITACORA_CREDClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
  end
  object btBITACORA_TOT: TBitBtn
    Left = 496
    Top = 511
    Width = 136
    Height = 20
    Caption = 'Bitacora General'
    TabOrder = 41
    OnClick = btBITACORA_TOTClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
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
    Left = 154
    Top = 10
  end
end
