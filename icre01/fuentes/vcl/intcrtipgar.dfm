object WCrTiposGaran: TWCrTiposGaran
  Left = 524
  Top = 218
  Width = 472
  Height = 540
  Caption = 'Garantías Estados y Municipios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 26
    Top = 98
    Width = 119
    Height = 13
    Caption = 'Garantías Asignadas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lMontos: TLabel
    Left = 163
    Top = 98
    Width = 113
    Height = 13
    Caption = 'Monto Por Garantía'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 285
    Top = 98
    Width = 105
    Height = 13
    Caption = 'Fecha de Registro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 400
    Top = 98
    Width = 62
    Height = 13
    Caption = 'Porcentaje'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbID_CONTRATO: TLabel
    Left = 3
    Top = 54
    Width = 59
    Height = 16
    Caption = 'Contrato'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 17
    Top = 298
    Width = 430
    Height = 3
  end
  object Label6: TLabel
    Left = 20
    Top = 284
    Width = 132
    Height = 13
    Caption = 'Requisitos de Garantía'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 15
    Top = 380
    Width = 96
    Height = 13
    Caption = 'No. de Inscripción E'
  end
  object Label15: TLabel
    Left = 282
    Top = 379
    Width = 64
    Height = 13
    Caption = 'F. Inscrip. Est'
  end
  object Label16: TLabel
    Left = 282
    Top = 405
    Width = 64
    Height = 13
    Caption = 'F. Inscrip.Fed'
  end
  object Label4: TLabel
    Left = 16
    Top = 409
    Width = 95
    Height = 13
    Caption = 'No. de Inscripción F'
  end
  object Bevel2: TBevel
    Left = 0
    Top = 90
    Width = 462
    Height = 3
  end
  object Label1: TLabel
    Left = 139
    Top = 6
    Width = 180
    Height = 20
    Caption = 'Información Garantías'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbF_ALTA: TLabel
    Left = 9
    Top = 484
    Width = 30
    Height = 13
    Caption = 'F. Alta'
  end
  object lbCVE_USU_ALTA: TLabel
    Left = 131
    Top = 484
    Width = 32
    Height = 13
    Caption = 'U. Alta'
  end
  object Bevel3: TBevel
    Left = 17
    Top = 466
    Width = 430
    Height = 3
  end
  object cbhGAR_PART: TCheckBox
    Tag = 18
    Left = 10
    Top = 122
    Width = 153
    Height = 17
    Alignment = taLeftJustify
    BiDiMode = bdLeftToRight
    Caption = 'Garantía con Participación'
    Enabled = False
    ParentBiDiMode = False
    TabOrder = 0
    OnClick = cbhGAR_PARTClick
  end
  object chbGAR_APORT: TCheckBox
    Tag = 18
    Left = 10
    Top = 146
    Width = 153
    Height = 17
    Alignment = taLeftJustify
    BiDiMode = bdLeftToRight
    Caption = 'Garantía con Aportaciones '
    Enabled = False
    ParentBiDiMode = False
    TabOrder = 4
    OnClick = chbGAR_APORTClick
  end
  object chbING_PROPIOS: TCheckBox
    Tag = 18
    Left = 66
    Top = 173
    Width = 97
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Ingresos Propios'
    Enabled = False
    TabOrder = 8
    OnClick = chbING_PROPIOSClick
  end
  object edMON_GAR_PART: TInterEdit
    Tag = 18
    Left = 170
    Top = 117
    Width = 96
    Height = 21
    Hint = 'No aplica para Refinanciamiento'
    HelpContext = 4501
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 1
    UseReType = True
    UseSep = False
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edMON_GAR_APORT: TInterEdit
    Tag = 18
    Left = 170
    Top = 141
    Width = 96
    Height = 21
    Hint = 'No aplica para Refinanciamiento'
    HelpContext = 4501
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 5
    UseReType = True
    UseSep = False
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edMON_ING_PROPIOS: TInterEdit
    Tag = 18
    Left = 170
    Top = 167
    Width = 97
    Height = 22
    Hint = 'No aplica para Refinanciamiento'
    HelpContext = 4501
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 18
    TabOrder = 9
    UseReType = True
    UseSep = False
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edPCT_PART: TEdit
    Tag = 18
    Left = 402
    Top = 118
    Width = 48
    Height = 21
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 3
  end
  object edPCT_APORT: TEdit
    Tag = 18
    Left = 402
    Top = 142
    Width = 48
    Height = 21
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 7
  end
  object edPCT_ING_PROP: TEdit
    Tag = 18
    Left = 402
    Top = 166
    Width = 48
    Height = 21
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 11
  end
  object chbMANDATO: TCheckBox
    Tag = 18
    Left = 9
    Top = 201
    Width = 65
    Height = 17
    Alignment = taLeftJustify
    BiDiMode = bdLeftToRight
    Caption = 'Mandato'
    Enabled = False
    ParentBiDiMode = False
    TabOrder = 12
  end
  object chbINS_IRREV: TCheckBox
    Tag = 18
    Left = 85
    Top = 201
    Width = 148
    Height = 17
    Alignment = taLeftJustify
    BiDiMode = bdLeftToRight
    Caption = 'Instrucciones Irrevocables '
    Enabled = False
    ParentBiDiMode = False
    TabOrder = 13
  end
  object chbFIDEICOMISO: TCheckBox
    Tag = 18
    Left = 242
    Top = 201
    Width = 81
    Height = 17
    Alignment = taLeftJustify
    BiDiMode = bdLeftToRight
    Caption = 'Fideicomiso'
    ParentBiDiMode = False
    TabOrder = 14
  end
  object chbB_COBERTURA_TASA: TCheckBox
    Tag = 18
    Left = 340
    Top = 201
    Width = 109
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Cobertura de Tasa'
    TabOrder = 15
  end
  object rgFUENTE_PAGO: TRadioGroup
    Tag = 18
    Left = 154
    Top = 225
    Width = 154
    Height = 43
    Caption = 'Fuente de Pago'
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Preferente'
      'Subordinada')
    TabOrder = 17
  end
  object rgTIPO_LINEA: TRadioGroup
    Tag = 18
    Left = 306
    Top = 225
    Width = 154
    Height = 43
    Caption = 'Tipo Linea'
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Revocable'
      'Irrevocable')
    TabOrder = 18
  end
  object chbB_AUT_LEG_LOCAL: TCheckBox
    Tag = 18
    Left = 15
    Top = 312
    Width = 161
    Height = 17
    Alignment = taLeftJustify
    BiDiMode = bdLeftToRight
    Caption = 'Autorización Legislativa Local'
    Enabled = False
    ParentBiDiMode = False
    TabOrder = 19
  end
  object chbB_MEC_CLARO_PAGO: TCheckBox
    Tag = 18
    Left = 16
    Top = 329
    Width = 160
    Height = 13
    Alignment = taLeftJustify
    BiDiMode = bdLeftToRight
    Caption = 'Mecanismo Claro de Pago'
    Enabled = False
    ParentBiDiMode = False
    TabOrder = 20
  end
  object chbB_OPIN_DESP_JUR: TCheckBox
    Tag = 18
    Left = 278
    Top = 313
    Width = 169
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Opinión de Despacho Jurídico'
    Enabled = False
    TabOrder = 21
  end
  object chbB_OPIN_INTER_JUR: TCheckBox
    Tag = 18
    Left = 254
    Top = 327
    Width = 193
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Opinión del Área Interna de Jurídico'
    Enabled = False
    TabOrder = 22
  end
  object chbB_APL_INSCR_DEUD: TCheckBox
    Tag = 18
    Left = 14
    Top = 350
    Width = 91
    Height = 19
    HelpContext = 7000
    Alignment = taLeftJustify
    Caption = 'Inscrip. Deuda'
    TabOrder = 23
    OnClick = chbB_APL_INSCR_DEUDClick
  end
  object edNUM_INSCR_DEUDA: TEdit
    Tag = 18
    Left = 116
    Top = 376
    Width = 156
    Height = 21
    HelpContext = 7100
    CharCase = ecUpperCase
    MaxLength = 20
    TabOrder = 24
  end
  object edF_ALTA_INSCR_DEU: TEdit
    Tag = 18
    Left = 350
    Top = 375
    Width = 77
    Height = 21
    HelpContext = 7200
    CharCase = ecUpperCase
    TabOrder = 25
  end
  object idtpF_ALTA_INSCR_DEU: TInterDateTimePicker
    Left = 427
    Top = 375
    Width = 21
    Height = 22
    HelpContext = 7201
    CalAlignment = dtaLeft
    Date = 37781.35659625
    Time = 37781.35659625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 33
    TabStop = False
    Edit = edF_ALTA_INSCR_DEU
    Formato = dfDate
  end
  object idtpF_PROG_INSCR_D: TInterDateTimePicker
    Left = 427
    Top = 399
    Width = 21
    Height = 22
    HelpContext = 7501
    CalAlignment = dtaLeft
    Date = 37781.35659625
    Time = 37781.35659625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 34
    TabStop = False
    Edit = edF_PROG_INSCR_D
    Formato = dfDate
  end
  object edF_PROG_INSCR_D: TEdit
    Tag = 18
    Left = 350
    Top = 399
    Width = 77
    Height = 21
    HelpContext = 7500
    CharCase = ecUpperCase
    TabOrder = 27
  end
  object edINS_FEDERAL: TEdit
    Tag = 18
    Left = 116
    Top = 402
    Width = 156
    Height = 21
    HelpContext = 7100
    CharCase = ecUpperCase
    MaxLength = 20
    TabOrder = 26
  end
  object chbB_REPORTE_SIC: TCheckBox
    Tag = 18
    Left = 15
    Top = 436
    Width = 98
    Height = 17
    Caption = 'Reporta a la SIC'
    TabOrder = 28
    Visible = False
  end
  object chbB_GTIA_LEY_FED: TCheckBox
    Tag = 18
    Left = 127
    Top = 435
    Width = 137
    Height = 17
    Caption = 'Garantia de Ley Federal'
    TabOrder = 29
  end
  object chbB_CONT_GUBERNA: TCheckBox
    Tag = 18
    Left = 281
    Top = 435
    Width = 158
    Height = 17
    Caption = 'Contabilidad Gubernamental'
    TabOrder = 30
  end
  object edF_ALTA: TEdit
    Left = 44
    Top = 480
    Width = 76
    Height = 21
    TabStop = False
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 31
  end
  object edCVE_USU_ALTA: TEdit
    Left = 167
    Top = 480
    Width = 76
    Height = 21
    TabStop = False
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 32
  end
  object rgPOSICION: TRadioGroup
    Tag = 18
    Left = 11
    Top = 225
    Width = 144
    Height = 43
    Caption = ' Garantía '
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Preferente'
      'Subordinada')
    TabOrder = 16
  end
  object edF_REG_GAR_PART: TEdit
    Tag = 18
    Left = 290
    Top = 119
    Width = 77
    Height = 21
    HelpContext = 7200
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object InterDateTimePicker1: TInterDateTimePicker
    Left = 366
    Top = 119
    Width = 21
    Height = 21
    HelpContext = 7201
    CalAlignment = dtaLeft
    Date = 37781.35659625
    Time = 37781.35659625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 35
    TabStop = False
    Edit = edF_REG_GAR_PART
    Formato = dfDate
  end
  object InterDateTimePicker2: TInterDateTimePicker
    Left = 366
    Top = 143
    Width = 21
    Height = 21
    HelpContext = 7201
    CalAlignment = dtaLeft
    Date = 37781.35659625
    Time = 37781.35659625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 36
    TabStop = False
    Edit = edF_REG_GAR_APORT
    Formato = dfDate
  end
  object edF_REG_GAR_APORT: TEdit
    Tag = 18
    Left = 290
    Top = 143
    Width = 77
    Height = 21
    HelpContext = 7200
    CharCase = ecUpperCase
    TabOrder = 6
  end
  object InterDateTimePicker3: TInterDateTimePicker
    Left = 366
    Top = 167
    Width = 21
    Height = 21
    HelpContext = 7201
    CalAlignment = dtaLeft
    Date = 37781.35659625
    Time = 37781.35659625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 37
    TabStop = False
    Edit = edF_REG_ING_PROPIOS
    Formato = dfDate
  end
  object edF_REG_ING_PROPIOS: TEdit
    Tag = 18
    Left = 290
    Top = 167
    Width = 77
    Height = 21
    HelpContext = 7200
    CharCase = ecUpperCase
    TabOrder = 10
  end
  object edID_CONTRATO: TEdit
    Tag = 18
    Left = 66
    Top = 51
    Width = 103
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 38
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesNuevo = InterForma1AntesNuevo
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
    OnBtnBuscarClick = InterForma1BtnBuscarClick
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 10
    Top = 10
  end
end
