object WSfeComprobante: TWSfeComprobante
  Left = 284
  Top = 167
  Width = 775
  Height = 527
  Caption = 'Catálogo de SFE Comprobante'
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
  object lbSERIE_RECIBO: TLabel
    Left = 528
    Top = 8
    Width = 61
    Height = 13
    Caption = 'Serie Recibo'
  end
  object PnDatos: TPanel
    Left = 0
    Top = 472
    Width = 767
    Height = 21
    Align = alBottom
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
  object edSERIE_RECIBO: TEdit
    Tag = 50
    Left = 592
    Top = 4
    Width = 160
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 30
    Width = 761
    Height = 65
    Caption = 'Operación '
    TabOrder = 2
    object lbID_CESION: TLabel
      Left = 8
      Top = 18
      Width = 87
      Height = 13
      Caption = 'Número de Cesión'
    end
    object lbID_DOCUMENTO: TLabel
      Left = 312
      Top = 18
      Width = 110
      Height = 13
      Caption = 'Número de Documento'
    end
    object lbID_TRANSACCION: TLabel
      Left = 8
      Top = 41
      Width = 89
      Height = 13
      Caption = 'Número Operación'
    end
    object lbSIT_COMPROBANTE: TLabel
      Left = 312
      Top = 41
      Width = 110
      Height = 13
      Caption = 'Situación Comprobante'
    end
    object edID_CESION: TEdit
      Tag = 50
      Left = 104
      Top = 14
      Width = 200
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object edID_DOCUMENTO: TEdit
      Tag = 50
      Left = 432
      Top = 14
      Width = 320
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object edID_TRANSACCION: TEdit
      Tag = 18
      Left = 104
      Top = 37
      Width = 200
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edSIT_COMPROBANTE: TEdit
      Tag = 18
      Left = 432
      Top = 37
      Width = 20
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object EDescSitComprob: TEdit
      Tag = 18
      Left = 456
      Top = 37
      Width = 97
      Height = 21
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 96
    Width = 761
    Height = 166
    Caption = 'Comprobante '
    TabOrder = 3
    object lbDESC_T_COMPROB: TLabel
      Left = 8
      Top = 20
      Width = 87
      Height = 13
      Caption = 'Tipo Comprobante'
    end
    object lbDESC_PRODUCTO: TLabel
      Left = 8
      Top = 43
      Width = 43
      Height = 13
      Caption = 'Producto'
    end
    object lbIMP_NETO: TLabel
      Left = 8
      Top = 67
      Width = 61
      Height = 13
      Caption = 'Importe Neto'
    end
    object lbTX_PRIMA_TOTAL: TLabel
      Left = 268
      Top = 90
      Width = 53
      Height = 13
      Caption = 'Prima Total'
    end
    object lbCUENTA_BANCO: TLabel
      Left = 8
      Top = 114
      Width = 68
      Height = 13
      Caption = 'Cuenta Banco'
    end
    object lbDESC_MONEDA: TLabel
      Left = 268
      Top = 114
      Width = 98
      Height = 13
      Caption = 'Descripción Moneda'
    end
    object lbF_OPERACION: TLabel
      Left = 8
      Top = 140
      Width = 82
      Height = 13
      Caption = 'Fecha Operación'
    end
    object lbF_VALOR: TLabel
      Left = 288
      Top = 140
      Width = 57
      Height = 13
      Caption = 'Fecha Valor'
    end
    object lbF_REMISION: TLabel
      Left = 528
      Top = 140
      Width = 76
      Height = 13
      Caption = 'Fecha Remisión'
    end
    object lbTASA_IMPTO: TLabel
      Left = 268
      Top = 67
      Width = 44
      Height = 13
      Caption = 'Tasa IVA'
    end
    object lbIMP_IVA: TLabel
      Left = 543
      Top = 67
      Width = 55
      Height = 13
      Caption = 'Importe IVA'
    end
    object LTotal: TLabel
      Left = 8
      Top = 88
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object Label1: TLabel
      Left = 528
      Top = 114
      Width = 86
      Height = 13
      Caption = 'Tipo comprobante'
    end
    object edDESC_T_COMPROB: TEdit
      Tag = 18
      Left = 104
      Top = 16
      Width = 648
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object edDESC_PRODUCTO: TEdit
      Tag = 18
      Left = 104
      Top = 39
      Width = 649
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object edTX_PRIMA_TOTAL: TEdit
      Tag = 18
      Left = 328
      Top = 86
      Width = 425
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edCUENTA_BANCO: TEdit
      Tag = 18
      Left = 104
      Top = 110
      Width = 150
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object edDESC_MONEDA: TEdit
      Tag = 18
      Left = 372
      Top = 110
      Width = 150
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
    end
    object dtpF_OPERACION: TInterDateTimePicker
      Tag = 18
      Left = 194
      Top = 136
      Width = 21
      Height = 25
      CalAlignment = dtaLeft
      Date = 40144.4843384607
      Time = 40144.4843384607
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 5
      Edit = edF_OPERACION
      Formato = dfDate
    end
    object edF_OPERACION: TEdit
      Tag = 18
      Left = 104
      Top = 136
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
    end
    object dtpF_VALOR: TInterDateTimePicker
      Tag = 18
      Left = 450
      Top = 136
      Width = 21
      Height = 25
      CalAlignment = dtaLeft
      Date = 40144.4843384607
      Time = 40144.4843384607
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 7
      Edit = edF_VALOR
      Formato = dfDate
    end
    object edF_VALOR: TEdit
      Tag = 18
      Left = 360
      Top = 136
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 8
    end
    object dtpF_REMISION: TInterDateTimePicker
      Tag = 18
      Left = 730
      Top = 136
      Width = 21
      Height = 25
      CalAlignment = dtaLeft
      Date = 40144.4843384607
      Time = 40144.4843384607
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 9
      Edit = edF_REMISION
      Formato = dfDate
    end
    object edF_REMISION: TEdit
      Tag = 18
      Left = 640
      Top = 136
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 10
    end
    object IeIMP_IVA: TInterEdit
      Tag = 18
      Left = 603
      Top = 63
      Width = 150
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      TabOrder = 11
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object IeTASA_IMPTO: TInterEdit
      Tag = 18
      Left = 328
      Top = 63
      Width = 150
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '##0.0000'
      MaxLength = 12
      TabOrder = 12
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_NETO: TInterEdit
      Tag = 18
      Left = 104
      Top = 63
      Width = 150
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      TabOrder = 13
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object IETotal: TInterEdit
      Tag = 18
      Left = 104
      Top = 86
      Width = 150
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      TabOrder = 14
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object IETipo_comprobante: TInterEdit
      Tag = 18
      Left = 620
      Top = 110
      Width = 133
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 10
      TabOrder = 15
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 262
    Width = 761
    Height = 41
    Caption = 'Control '
    TabOrder = 4
    object lbSIT_PROCESO: TLabel
      Left = 8
      Top = 18
      Width = 86
      Height = 13
      Caption = 'Situación Proceso'
    end
    object lbDESC_ERROR: TLabel
      Left = 232
      Top = 18
      Width = 81
      Height = 13
      Caption = 'Descripción Error'
    end
    object edSIT_PROCESO: TEdit
      Tag = 18
      Left = 104
      Top = 14
      Width = 20
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object edDESC_ERROR: TEdit
      Tag = 18
      Left = 320
      Top = 14
      Width = 433
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object EDescSitProc: TEdit
      Tag = 18
      Left = 128
      Top = 14
      Width = 97
      Height = 21
      TabOrder = 2
    end
  end
  object GBConceptos: TGroupBox
    Left = 0
    Top = 304
    Width = 761
    Height = 110
    Caption = ' Conceptos '
    TabOrder = 5
    object EdTXT_LEYENDA_1: TEdit
      Tag = 18
      Left = 104
      Top = 12
      Width = 473
      Height = 21
      TabOrder = 0
    end
    object EdTXT_LEYENDA_2: TEdit
      Tag = 18
      Left = 104
      Top = 35
      Width = 473
      Height = 21
      TabOrder = 1
    end
    object EdTXT_LEYENDA_3: TEdit
      Tag = 18
      Left = 104
      Top = 58
      Width = 473
      Height = 21
      TabOrder = 2
    end
    object EdTXT_LEYENDA_4: TEdit
      Tag = 18
      Left = 104
      Top = 81
      Width = 473
      Height = 21
      TabOrder = 3
    end
    object EdTXT_DATO_3: TEdit
      Tag = 18
      Left = 581
      Top = 58
      Width = 169
      Height = 21
      TabOrder = 4
    end
    object edTXT_DATO_4: TEdit
      Tag = 18
      Left = 581
      Top = 81
      Width = 169
      Height = 21
      TabOrder = 5
    end
    object EdTXT_DATO_1: TInterEdit
      Tag = 18
      Left = 581
      Top = 12
      Width = 169
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 10
      TabOrder = 6
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edTXT_DATO_2: TInterEdit
      Tag = 18
      Left = 581
      Top = 35
      Width = 169
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 10
      TabOrder = 7
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object GBTimbre: TGroupBox
    Left = 0
    Top = 416
    Width = 761
    Height = 49
    Caption = 'Datos Timbre '
    TabOrder = 6
    object LFechaTimbre: TLabel
      Left = 8
      Top = 20
      Width = 62
      Height = 13
      Caption = 'FechaTimbre'
    end
    object LUuid: TLabel
      Left = 312
      Top = 20
      Width = 27
      Height = 13
      Caption = 'UUID'
    end
    object IEFecha_Timbre: TInterEdit
      Tag = 18
      Left = 104
      Top = 16
      Width = 185
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 10
      TabOrder = 0
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object IEUuid: TInterEdit
      Tag = 18
      Left = 344
      Top = 16
      Width = 409
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 10
      TabOrder = 1
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
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
    Left = 642
    Top = 18
  end
end
