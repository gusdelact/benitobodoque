object WCrCoInRi: TWCrCoInRi
  Left = 225
  Top = 150
  Width = 818
  Height = 501
  Caption = 'Consulta Integral de Crédito.'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 162
    Height = 13
    Caption = 'Fecha de Consulta de Información'
  end
  object Label2: TLabel
    Left = 7
    Top = 412
    Width = 106
    Height = 13
    Caption = 'Generar Archivo Excel'
  end
  object Label10: TLabel
    Left = 779
    Top = 448
    Width = 37
    Height = 7
    Caption = 'V20100422'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -7
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 7
    Top = 34
    Width = 57
    Height = 13
    Caption = 'Acreditado :'
  end
  object dtpF_CIERRE: TDateTimePicker
    Left = 185
    Top = 4
    Width = 89
    Height = 21
    CalAlignment = dtaLeft
    Date = 39083.4646909259
    Time = 39083.4646909259
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object btMuestraDatos: TBitBtn
    Left = 636
    Top = 20
    Width = 180
    Height = 21
    Caption = 'Consulta Datos'
    TabOrder = 1
    OnClick = btMuestraDatosClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
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
  object DBGrid1: TDBGrid
    Left = 4
    Top = 56
    Width = 812
    Height = 349
    DataSource = dsrcCOINCRE
    FixedColor = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edFileNameXLS: TEdit
    Left = 124
    Top = 408
    Width = 574
    Height = 21
    TabOrder = 3
    Text = 'C:\'
    OnKeyDown = edFileNameXLSKeyDown
  end
  object btnSaveFileName: TButton
    Left = 698
    Top = 409
    Width = 28
    Height = 21
    Caption = '...'
    TabOrder = 4
    OnClick = btnSaveFileNameClick
  end
  object btnGeneraArchivo: TButton
    Left = 730
    Top = 408
    Width = 88
    Height = 22
    Caption = 'Genera Archivo'
    TabOrder = 5
    OnClick = btnGeneraArchivoClick
  end
  object ProgressBar: TProgressBar
    Left = 4
    Top = 433
    Width = 813
    Height = 14
    Min = 0
    Max = 100
    TabOrder = 6
  end
  object PnDatos: TPanel
    Left = 4
    Top = 455
    Width = 812
    Height = 21
    TabOrder = 7
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
      Left = 392
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
      Left = 392
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
      Left = 456
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
      Left = 456
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
  object cbTest: TCheckBox
    Left = 577
    Top = 8
    Width = 50
    Height = 17
    Caption = 'Test'
    TabOrder = 8
    Visible = False
  end
  object edACREDITADO: TEdit
    Tag = 562
    Left = 67
    Top = 31
    Width = 82
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 9
  end
  object btACREDITADO: TBitBtn
    Left = 157
    Top = 31
    Width = 21
    Height = 21
    TabOrder = 10
    OnClick = btACREDITADOClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      0800000000000002000000000000000000000001000000010000000000008080
      8000000080000080800000800000808000008000000080008000408080004040
      0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
      FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
      80008000FF004080FF0000001F00000000000000000000000000000000000000
      A000BA7F0000000008005B00C4005B00B800B87FFF00FFFFA8005B002600B77F
      F4005D00C00000000A000000010000000000000090005B00FE0000006300F7BF
      C00000000A00000001000000000000005700D8843F000000BC005B002300F7BF
      0000000047000200E500F9BF7900F7BFF8000000E0005B002E00F7BF5700D884
      00000000D80047330000000046000000360002002E0000001F0000003F002701
      000047333F0027013C00FA3B3F000400000000000000F91AB700000000000100
      00000A000000FA3B10000000000000002800D379FF0047333C00413C3F00FFFF
      47000000000047333F0008E8780000000300F91AB700E7820700000000000000
      01000A00C0003F010000080000001F175900B77F00005B0080005B000700B87F
      FF00FFFF8C005B00E200B77F00005B0098005B00C200B87FFF00FFFFA4005B00
      B000B77F00005B00B0005B003500B87FFF00FFFFBC005B006100410000005B00
      C8005B006E006D307700CE4835001A3D0000528700000000E0000700DC004100
      0000FFFFEC005B0018004100500020001000200001000000FF00E0FFFF000000
      5E00E0010000FF10040000040000CE4800000000000000008200150000000000
      00000000000007400100000000000100200010000000E74850000B0195000C01
      01000000B700F4FEFF0000005E00F0A60100B710040000040000964800000000
      000000009B001500D400FFFF030000003C005E0004000000A000010020000000
      0000AF4808000700000000001B00240054005E0000000000F200B87F00000000
      00000000C800BB7F00000000000000004200736361000000E7000000AF00683D
      A7004840D700F7BF37000000C4005B003F002000CC00000074000000F4005D00
      20000000F8005B005D00B77F0100000000000000000000002000000034001704
      00000002F4005D00A8005B004700B77F20000000000000200000000205000000
      000000004400071852002A009000301200002011000034875000E01000003012
      0000408750001701A8001405000000000200920400000000A200000000003012
      0000828700006A87000000000000010000000000C80000007600507F1700537F
      E00027112F00B0876E00170164002F0100000000C8000000B0000000A0000000
      200000002700000001000000E000000000002F01E0005E0020000000BA00507F
      1700537F200029798600A233A200A705FC00AC1157001AEC5E00030303030303
      03030E11110E110E111103030303030303030E01010E010E0101030303030303
      0311110E110E0E110E0E0303030303030301010E010E0E010E0E030303030303
      0311110E110E11110E110303030303030301010E010E01010E01030303030303
      03031111110E0E0E110E03030303030303030101010E0E0E0F0E030303030303
      030606060E1111111111030303030303030F0F0F0E0101010F0F030303030303
      03060111060E110E110E030303030303030F0101000E010E010E030303030303
      0606010E110611110E110303030303030F0F010E010F01010E01030303030306
      0601060F0F060E11110E03030303030F0F01000F0F010E01010E030303030606
      010E0F06060603111103030303030F0F010E0F0F0F0F03010103030303060606
      060F06060303030303030303030F0F0F0F0F0F0F030303030303030306060106
      0606060303030303030303030F0F010F0F0F0F03030303030303030606010E0F
      06060303030303030303030F0F010E0F0F0F03030303030303030306010E0F06
      06030303030303030303030F010E0F0F0F0303030303030303030306060F0606
      03030303030303030303030F0F0F0F0F03030303030303030303030306060603
      0303030303030303030303030F0F0F0303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303}
    NumGlyphs = 2
  end
  object edNOMBRE_ACRED: TEdit
    Left = 185
    Top = 31
    Width = 369
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 11
  end
  object cbAcreditado: TCheckBox
    Left = 560
    Top = 32
    Width = 14
    Height = 17
    TabStop = False
    Enabled = False
    TabOrder = 12
    OnClick = cbAcreditadoClick
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
    Left = 403
    Top = 14
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.XLS'
    Filter = 'Microsoft Office Excel Workbook (*.xls)|*.xls'
    Left = 768
    Top = 48
  end
  object QryCOINCRE: TQuery
    DatabaseName = 'BCORP'
    SQL.Strings = (
      'select'
      '0.0        ID_CREDITO, to_date(sysdate,'#39'dd/mm/yyyy'#39')  F_CIERRE, '
      
        'to_date(sysdate,'#39'dd/mm/yyyy'#39')        FH_ALTA, 1        ID_REG_VI' +
        'GENTE,'
      '0.0        ID_MERC_OBJ_DET, 0.0        IMP_CAP_VIG,'
      '0.0        IMP_CAP_IMP, 0.0        IMP_CAP_VDO_EX,'
      '0.0        IMP_CAP_VDO_NE, 0.0        IMP_INT_VIG, '
      '0.0        IMP_INT_IMP, 0.0        IMP_INT_VDO_EX,'
      '0.0        IMP_INT_VDO_NE, 0.0        IMP_CTAS_ORD, '
      '0.0        IMP_CONCEP_COB, 0.0        IMP_CONCEP_VIG,'
      
        '0.0        IMP_CONCEP_IMP, 0.0        IMP_MOR_CP, 0.0        IMP' +
        '_MOR_FN, 0.0        IMP_MOR_IN,'
      
        '0.0        IMP_MOR_CN, 0.0        IMP_RESP_TOT, 0.0        PCT_C' +
        'UB_CREDITO, 0.0        IMP_AUTORIZADO,'
      
        '0.0        IMP_AMORTIZA, 0.0        IMP_INT_X_COB, 0.0        PC' +
        'T_GTIA_FND, 0.0        IMP_CAPITALIZA,'
      
        '0.0        IMP_PREVEN_CUB, 0.0        IMP_PREVEN_EXP, 0.0       ' +
        ' PCT_GARANTIZA, 0.0        IMP_GARANTIA,'
      
        '0.0        IMP_SPM_CAP_VIG, 0.0        IMP_SPM_CAP_IMP, 0.0     ' +
        '   IMP_SPM_CAP_VDO, 0.0        IMP_COMISION_C,'
      
        #39' '#39'        NOM_ACREDITADO, 0.0        ID_ACREDITADO, 0.0        ' +
        'ID_CONTRATO, '#39' '#39'        RFC,'
      
        #39' '#39'        CVE_GRUPO_ECO, '#39' '#39'        DESC_GRUPO_ECO, '#39' '#39'        ' +
        'CVE_CAT_MINIMO, '#39' '#39'        CVE_SENICREB,'
      
        #39' '#39'        DESC_SENICREB, '#39' '#39'        CVE_LOCAL_CNBV, '#39' '#39'        ' +
        'DESC_LOCAL_CNBV, '#39' '#39'        CVE_TAM_ACRED,'
      
        #39' '#39'        DESC_TAM_ACRED, '#39' '#39'        CVE_CLAS_CONTAB, '#39' '#39'      ' +
        '  CVE_DESTINO, '#39' '#39'        DESC_DESTINO,'
      'to_date(sysdate,'#39'dd/mm/yyyy'#39')        F_DISPOSICION, '
      'to_date(sysdate,'#39'dd/mm/yyyy'#39')        F_VENCIMIENTO, '
      'to_date(sysdate,'#39'dd/mm/yyyy'#39')        F_AMORTIZACION, '#39' '#39'        '
      'CVE_AMORTIZACION,'
      #39' '#39'        DESC_AMORTIZACION, '#39' '#39'        CVE_PAG_INTERES, '
      #39' '#39'        DESC_PAG_INTERES, '#39' '#39'        CVE_MONEDA,'
      #39' '#39'        DESC_MONEDA, '#39' '#39'        CVE_FUENTE_PAGO, '
      #39' '#39'        DESC_FUENTE_PAGO, 0.0        TASA_BASE,'
      #39' '#39'        CVE_TASA_REFER, 0.0        SOBRETASA, '
      '99        NUM_FREC_REV_TAS, '#39' '#39'        CVE_SIT_CREDITO,'
      #39' '#39'        CVE_REESTRUCTURA, '#39' '#39'        CVE_CAL_DEU, '
      #39' '#39'        CVE_CAL_OPE_CUB, '#39' '#39'        CVE_CAL_OPE_EXP,'
      #39' '#39'        CVE_TIPO_GTIA, '
      'to_date(sysdate,'#39'dd/mm/yyyy'#39')        F_VAL_GARANTIA, '
      '99        NUM_PRELACION, '#39'B'#39'        B_ACRED_RELAC,'
      #39' '#39'        CVE_ACRED_RELAC, 0.0        ID_PROM_ADM, '
      #39' '#39'        NOM_PROM_ADM, 0.0        ID_PROM_ASOC,'
      #39' '#39'        NOM_PROM_ASOC, 0.0        NUM_PERIODO_G, '
      #39' '#39'        CVE_LIQUIDACION, '#39' '#39'        CVE_SECTOR_ECO,'
      #39' '#39'        DESC_SECTOR_ECO, '#39' '#39'        CVE_ORIGEN_INFO, '
      #39' '#39'        CVE_MER_OBJETIVO, '#39' '#39'        DESC_MERC_OBJETI,'
      #39' '#39'        CVE_MERC_OB_GPO, '#39' '#39'        DESC_MER_OB_GPO, '
      #39' '#39'        CVE_ORIGEN_REC, '#39' '#39'        DESC_ORIGEN_REC,'
      #39' '#39'        CVE_POBLAC_EDO, '#39' '#39'        DESC_POBLAC_EDO, '
      #39' '#39'        CVE_PRODUCTO_CRE, '#39' '#39'        DESC_L_PRODUCTO,'
      
        #39' '#39'        CVE_SECTOR, '#39' '#39'        CTA_K_VIG, '#39' '#39'        CTA_K_IM' +
        'P, '
      #39' '#39'        CTA_K_VEN_EX,'
      #39' '#39'        CTA_K_VEN_NE, '#39' '#39'        CTA_I_VIG, '
      #39' '#39'        CTA_I_IMP, '#39' '#39'        CTA_I_VEN_EX,'
      #39' '#39'        CTA_I_COB_XANT, 0.0        ROE_BRUTA_1, '
      '0.0        ROE_NETA_1, '
      '0.0'#9#9'   RAM_MEZCLA, 0.0'#9'RAM_FTP,'
      '0.0        PCT_REQ_CAP_MER_1,'
      '0.0        PCT_REQ_CAP_CRE_1, 0.0        PCT_CAPITALIZ_1, '
      #39' '#39'         CALIF_DEUDOR, 0.0        IMP_EXPUESTO,'
      '0.0        IMP_CUBIERTO, '#39' '#39'        CVE_CALIFIC_EXP, '
      #39' '#39'        CVE_CALIFIC_CUB, 0.0        IMP_RESERVA_EXP,'
      '0.0        IMP_RESERVA_CUB, 0.0        IMP_CARTA_CREDITO, '
      '0.0        PCT_ADICIONAL, 0.0        IMP_TOTAL_CCI,'
      '0.0        PAGOS_MES, 0.0        SALDO_ACTUAL_CCI, '
      #39' '#39'        CVE_CALCULO, '#39' '#39'        DESC_CALCULO,'
      'to_date(sysdate,'#39'dd/mm/yyyy'#39')        F_INICIO_INT, '
      'to_date(sysdate,'#39'dd/mm/yyyy'#39')        F_VENCIMIENTO_INT, '
      '0.0        TC, '#39'V'#39'        ESTRUCTURADO,'
      #39' '#39'        INS_FEDERAL, '#39'V'#39'        REG_SECRETARIA, '
      
        'to_date(sysdate,'#39'dd/mm/yyyy'#39')        F_INS_FEDERAL, 0.0        I' +
        'D_AVAL_GOB,'
      #39' '#39'        CAL_FITCH, '#39' '#39'        CAL_MOODYS, '
      #39' '#39'        CAL_HR, '#39' '#39'        CAL_STANDARD,'
      #39' '#39'        CAL_VERUM, 3        NUM_CALIF, '
      '150        PND'
      'from dual'#9)
    Left = 130
    Top = 181
    object QryCOINCREF_CIERRE: TDateTimeField
      DisplayLabel = 'Fecha de Consulta'
      FieldName = 'F_CIERRE'
    end
    object QryCOINCREID_CREDITO: TFloatField
      DisplayLabel = 'Número de Crédito'
      FieldName = 'ID_CREDITO'
    end
    object QryCOINCREIMP_CAP_VIG: TFloatField
      DisplayLabel = 'Capital Vigente'
      FieldName = 'IMP_CAP_VIG'
    end
    object QryCOINCREIMP_CAP_IMP: TFloatField
      DisplayLabel = 'Capital Impagado'
      FieldName = 'IMP_CAP_IMP'
    end
    object QryCOINCREIMP_CAP_VDO_EX: TFloatField
      DisplayLabel = 'Capital Vencido Exigible'
      FieldName = 'IMP_CAP_VDO_EX'
    end
    object QryCOINCREIMP_CAP_VDO_NE: TFloatField
      DisplayLabel = 'Capital Vencido No Exigible'
      FieldName = 'IMP_CAP_VDO_NE'
    end
    object QryCOINCREIMP_INT_VIG: TFloatField
      DisplayLabel = 'Interés Vigente'
      FieldName = 'IMP_INT_VIG'
    end
    object QryCOINCREIMP_INT_IMP: TFloatField
      DisplayLabel = 'Interés Impagado'
      FieldName = 'IMP_INT_IMP'
    end
    object QryCOINCREIMP_INT_VDO_EX: TFloatField
      DisplayLabel = 'Interés Vencido Exigible'
      FieldName = 'IMP_INT_VDO_EX'
    end
    object QryCOINCREIMP_INT_VDO_NE: TFloatField
      DisplayLabel = 'Interés Vencido No Exigible'
      FieldName = 'IMP_INT_VDO_NE'
    end
    object QryCOINCREIMP_CTAS_ORD: TFloatField
      DisplayLabel = 'Interés Cuenta Orden'
      FieldName = 'IMP_CTAS_ORD'
    end
    object QryCOINCREIMP_AUTORIZADO: TFloatField
      DisplayLabel = 'Importe Autorizado'
      FieldName = 'IMP_AUTORIZADO'
    end
    object QryCOINCREIMP_INT_X_COB: TFloatField
      DisplayLabel = 'Monto de Intereses por Cobrar'
      FieldName = 'IMP_INT_X_COB'
    end
    object QryCOINCREPCT_GTIA_FND: TFloatField
      DisplayLabel = 'Porcentaje de Garantía de Fondos'
      FieldName = 'PCT_GTIA_FND'
    end
    object QryCOINCREIMP_RESERVA: TFloatField
      DisplayLabel = 'Estimaciones Preventivas'
      FieldName = 'IMP_RESERVA'
    end
    object QryCOINCREPCT_GARANTIZA: TFloatField
      DisplayLabel = 'Porcentaje que garantiza el Aval'
      FieldName = 'PCT_GARANTIZA'
    end
    object QryCOINCREIMP_GARANTIA: TFloatField
      DisplayLabel = 'Valor de la Garantía'
      FieldName = 'IMP_GARANTIA'
    end
    object QryCOINCREIMP_COMISION_C: TFloatField
      DisplayLabel = 'Comisión Cobrada'
      FieldName = 'IMP_COMISION_C'
    end
    object QryCOINCREFH_ALTA: TDateTimeField
      FieldName = 'FH_ALTA'
    end
    object QryCOINCREID_REG_VIGENTE: TFloatField
      FieldName = 'ID_REG_VIGENTE'
    end
    object QryCOINCRENOM_ACREDITADO: TStringField
      DisplayLabel = 'Nombre del deudor'
      FieldName = 'NOM_ACREDITADO'
      Size = 80
    end
    object QryCOINCREID_ACREDITADO: TFloatField
      DisplayLabel = 'Id. Acreditado'
      FieldName = 'ID_ACREDITADO'
    end
    object QryCOINCREID_CONTRATO: TFloatField
      DisplayLabel = 'No Autorización'
      FieldName = 'ID_CONTRATO'
    end
    object QryCOINCRERFC: TStringField
      FieldName = 'RFC'
      Size = 14
    end
    object QryCOINCRECVE_GRUPO_ECO: TStringField
      DisplayLabel = 'Clave del Grupo Ecónomico '
      FieldName = 'CVE_GRUPO_ECO'
      Size = 6
    end
    object QryCOINCREDESC_GRUPO_ECO: TStringField
      DisplayLabel = 'Nombre del Grupo Ecónomico'
      FieldName = 'DESC_GRUPO_ECO'
      Size = 250
    end
    object QryCOINCRECVE_CAT_MINIMO: TStringField
      DisplayLabel = 'Clasificación Contable '
      FieldName = 'CVE_CAT_MINIMO'
      Size = 16
    end
    object QryCOINCRECVE_SENICREB: TStringField
      DisplayLabel = 'Clave Actividad Económica'
      FieldName = 'CVE_SENICREB'
      Size = 11
    end
    object QryCOINCREDESC_SENICREB: TStringField
      DisplayLabel = 'Actividad Económica'
      FieldName = 'DESC_SENICREB'
      Size = 100
    end
    object QryCOINCRECVE_LOCAL_CNBV: TStringField
      DisplayLabel = 'Clave Región o País'
      FieldName = 'CVE_LOCAL_CNBV'
      Size = 8
    end
    object QryCOINCREDESC_LOCAL_CNBV: TStringField
      DisplayLabel = 'Región o País'
      FieldName = 'DESC_LOCAL_CNBV'
      Size = 120
    end
    object QryCOINCRECVE_TAM_ACRED: TStringField
      DisplayLabel = 'Clave Tamaño del Acreditado'
      FieldName = 'CVE_TAM_ACRED'
      Size = 4
    end
    object QryCOINCREDESC_TAM_ACRED: TStringField
      DisplayLabel = 'Tamaño del Acreditado'
      FieldName = 'DESC_TAM_ACRED'
      Size = 250
    end
    object QryCOINCRECVE_CLAS_CONTAB: TStringField
      DisplayLabel = 'Clasificación Legal'
      FieldName = 'CVE_CLAS_CONTAB'
      Size = 16
    end
    object QryCOINCRECVE_DESTINO: TStringField
      DisplayLabel = 'Clave Destino de la autorización de créditos'
      FieldName = 'CVE_DESTINO'
      Size = 6
    end
    object QryCOINCREDESC_DESTINO: TStringField
      DisplayLabel = 'Destino de la autorización de créditos'
      FieldName = 'DESC_DESTINO'
      Size = 250
    end
    object QryCOINCREF_DISPOSICION: TDateTimeField
      DisplayLabel = 'Fecha de la Disposición'
      FieldName = 'F_DISPOSICION'
    end
    object QryCOINCREF_VENCIMIENTO: TDateTimeField
      DisplayLabel = 'Fecha de Vencimiento'
      FieldName = 'F_VENCIMIENTO'
    end
    object QryCOINCREF_AMORTIZACION: TDateTimeField
      DisplayLabel = 'Fecha de Amortización'
      FieldName = 'F_AMORTIZACION'
    end
    object QryCOINCRECVE_AMORTIZACION: TStringField
      DisplayLabel = 'Clave Periodicidad de las amortizaciones'
      FieldName = 'CVE_AMORTIZACION'
      Size = 2
    end
    object QryCOINCREDESC_AMORTIZACION: TStringField
      DisplayLabel = 'Periodicidad de las amortizaciones'
      FieldName = 'DESC_AMORTIZACION'
      Size = 250
    end
    object QryCOINCRECVE_PAG_INTERES: TStringField
      DisplayLabel = 'Clave de Forma de Pago de los Intereses'
      FieldName = 'CVE_PAG_INTERES'
      Size = 2
    end
    object QryCOINCREDESC_PAG_INTERES: TStringField
      DisplayLabel = 'Forma de Pago de los Intereses'
      FieldName = 'DESC_PAG_INTERES'
      Size = 250
    end
    object QryCOINCREDesc_Calculo: TStringField
      DisplayLabel = 'Tipo de Cálculo de los Intereses'
      FieldName = 'Desc_Calculo'
      Size = 80
    end
    object QryCOINCREF_Inicio_Int: TDateTimeField
      DisplayLabel = 'Fecha de inicio de intereses'
      FieldName = 'F_Inicio_Int'
    end
    object QryCOINCREF_Vencimiento_Int: TDateTimeField
      DisplayLabel = 'Fecha de vencimiento de intereses'
      FieldName = 'F_Vencimiento_Int'
    end
    object QryCOINCRECVE_MONEDA: TStringField
      FieldName = 'CVE_MONEDA'
      FixedChar = True
      Size = 1
    end
    object QryCOINCREDESC_MONEDA: TStringField
      DisplayLabel = 'Moneda'
      FieldName = 'DESC_MONEDA'
    end
    object QryCOINCRETC: TCurrencyField
      DisplayLabel = 'Tipo de cambio'
      FieldName = 'TC'
    end
    object QryCOINCREDESC_FUENTE_PAGO: TStringField
      DisplayLabel = 'Fuente de Fondeo de los Recursos'
      FieldName = 'DESC_FUENTE_PAGO'
      Size = 50
    end
    object QryCOINCRETASA_BASE: TFloatField
      DisplayLabel = 'Tasa Bruta'
      FieldName = 'TASA_BASE'
    end
    object QryCOINCRECVE_TASA_REFER: TStringField
      DisplayLabel = 'Tasa de Referencia'
      FieldName = 'CVE_TASA_REFER'
      Size = 8
    end
    object QryCOINCRESOBRETASA: TFloatField
      DisplayLabel = 'Ajuste en la Tasa de Referencia'
      FieldName = 'SOBRETASA'
    end
    object QryCOINCRENUM_FREC_REV_TAS: TFloatField
      DisplayLabel = 'Número de Frecuencia Revisión de Tasa'
      FieldName = 'NUM_FREC_REV_TAS'
    end
    object QryCOINCRECVE_SIT_CREDITO: TStringField
      DisplayLabel = 'Situación del Crédito'
      FieldName = 'CVE_SIT_CREDITO'
      Size = 1
    end
    object QryCOINCRECVE_REESTRUCTURA: TStringField
      DisplayLabel = 'Reestructuras o Renovaciones'
      FieldName = 'CVE_REESTRUCTURA'
      Size = 1
    end
    object QryCOINCRECALIF_DEUDOR: TStringField
      DisplayLabel = 'Calificación Equivalente del Deudor Met'
      FieldName = 'CALIF_DEUDOR'
      Size = 2
    end
    object QryCOINCRECVE_CALIFIC_CNBV: TStringField
      DisplayLabel = 'Calif por Operación Met CNVB'
      FieldName = 'CVE_CALIFIC_CNBV'
      Size = 2
    end
    object QryCOINCRECVE_TIPO_GTIA: TStringField
      DisplayLabel = 'Clave Tipo de Garantía'
      FieldName = 'CVE_TIPO_GTIA'
      Size = 2
    end
    object QryCOINCREF_VAL_GARANTIA: TDateTimeField
      DisplayLabel = 'Fecha Valuación de Garantía'
      FieldName = 'F_VAL_GARANTIA'
    end
    object QryCOINCRENUM_PRELACION: TFloatField
      DisplayLabel = 'Grado de Prelación de la Garantía'
      FieldName = 'NUM_PRELACION'
    end
    object QryCOINCREB_ACRED_RELAC: TStringField
      DisplayLabel = 'Acreditado Relacionado'
      FieldName = 'B_ACRED_RELAC'
      Size = 1
    end
    object QryCOINCRECVE_ACRED_RELAC: TStringField
      DisplayLabel = 'Tipo de Acreditado Relacionado'
      FieldName = 'CVE_ACRED_RELAC'
      Size = 6
    end
    object QryCOINCREID_PROM_ADM: TFloatField
      DisplayLabel = 'ID del Promotor Administrador'
      FieldName = 'ID_PROM_ADM'
    end
    object QryCOINCRENOM_PROM_ADM: TStringField
      DisplayLabel = 'Nombre del Promotor Administrador'
      FieldName = 'NOM_PROM_ADM'
      Size = 80
    end
    object QryCOINCREID_PROM_ASOC: TFloatField
      DisplayLabel = 'ID del Promotor Asociado  '
      FieldName = 'ID_PROM_ASOC'
    end
    object QryCOINCRENOM_PROM_ASOC: TStringField
      DisplayLabel = 'Nombre del Promotor Asociado'
      FieldName = 'NOM_PROM_ASOC'
      Size = 80
    end
    object QryCOINCRECVE_LIQUIDACION: TStringField
      DisplayLabel = 'Clave de Liquidación'
      FieldName = 'CVE_LIQUIDACION'
      Size = 2
    end
    object QryCOINCRECVE_SECTOR_ECO: TStringField
      DisplayLabel = 'Clave Sector Económico'
      FieldName = 'CVE_SECTOR_ECO'
      Size = 4
    end
    object QryCOINCREDESC_SECTOR_ECO: TStringField
      DisplayLabel = 'Sector Económico'
      FieldName = 'DESC_SECTOR_ECO'
      Size = 250
    end
    object QryCOINCREID_MERC_OBJ_DET: TFloatField
      DisplayLabel = 'Clave Mercado Objetivo'
      FieldName = 'ID_MERC_OBJ_DET'
    end
    object QryCOINCRECVE_ORIGEN_INFO: TStringField
      DisplayLabel = 'Origen de la Información '
      FieldName = 'CVE_ORIGEN_INFO'
      Size = 1
    end
    object QryCOINCRECVE_MERC_OB_GPO: TStringField
      DisplayLabel = 'Clave del Grupo de Mercado Objetivo'
      FieldName = 'CVE_MERC_OB_GPO'
      Size = 10
    end
    object QryCOINCRECVE_PRODUCTO_CRE: TStringField
      DisplayLabel = 'Clave del Producto'
      FieldName = 'CVE_PRODUCTO_CRE'
      Size = 6
    end
    object QryCOINCREDESC_L_PRODUCTO: TStringField
      DisplayLabel = 'Producto'
      FieldName = 'DESC_L_PRODUCTO'
      Size = 80
    end
    object QryCOINCRECVE_SECTOR: TStringField
      DisplayLabel = 'Sector del Deudor'
      FieldName = 'CVE_SECTOR'
      Size = 2
    end
    object QryCOINCRECTA_K_VIG: TStringField
      DisplayLabel = 'Cta SAP Cap Vigente'
      FieldName = 'CTA_K_VIG'
      Size = 10
    end
    object QryCOINCRECTA_K_IMP: TStringField
      DisplayLabel = 'Cta SAP Cap Impagado'
      FieldName = 'CTA_K_IMP'
      Size = 10
    end
    object QryCOINCRECTA_K_VEN_EX: TStringField
      DisplayLabel = 'Cta SAP Cap Vencido Ex'
      FieldName = 'CTA_K_VEN_EX'
      Size = 10
    end
    object QryCOINCRECTA_K_VEN_NE: TStringField
      DisplayLabel = 'Cta SAP Cap Vencido No Ex'
      FieldName = 'CTA_K_VEN_NE'
      Size = 10
    end
    object QryCOINCRECTA_I_VIG: TStringField
      DisplayLabel = 'Cta SAP Interés Vigente'
      FieldName = 'CTA_I_VIG'
      Size = 10
    end
    object QryCOINCRECTA_I_IMP: TStringField
      DisplayLabel = 'Cta SAP Interés Impagado'
      FieldName = 'CTA_I_IMP'
      Size = 10
    end
    object QryCOINCRECTA_I_VEN_EX: TStringField
      DisplayLabel = 'Cta SAP Interés Vencido'
      FieldName = 'CTA_I_VEN_EX'
      Size = 10
    end
    object QryCOINCRECTA_I_COB_XANT: TStringField
      DisplayLabel = 'Cta SAP Interés Cob x Ant'
      FieldName = 'CTA_I_COB_XANT'
      Size = 10
    end
    object QryCOINCRECVE_MER_OBJETIVO: TStringField
      DisplayLabel = 'Clave Mercado Objetivo'
      FieldName = 'CVE_MER_OBJETIVO'
      Size = 6
    end
    object QryCOINCREDESC_MERC_OBJETI: TStringField
      DisplayLabel = 'Mercado Objetivo'
      FieldName = 'DESC_MERC_OBJETI'
      Size = 40
    end
    object QryCOINCREDESC_MER_OB_GPO: TStringField
      DisplayLabel = 'Grupo de Mercado Objetivo'
      FieldName = 'DESC_MER_OB_GPO'
      Size = 40
    end
    object QryCOINCRECVE_ORIGEN_REC: TStringField
      DisplayLabel = 'Clave de Origen Recursos'
      FieldName = 'CVE_ORIGEN_REC'
      Size = 6
    end
    object QryCOINCREDESC_ORIGEN_REC: TStringField
      DisplayLabel = 'Origen Recursos'
      FieldName = 'DESC_ORIGEN_REC'
      Size = 250
    end
    object QryCOINCRECVE_POBLAC_EDO: TStringField
      DisplayLabel = 'Clave Problación'
      FieldName = 'CVE_POBLAC_EDO'
      Size = 6
    end
    object QryCOINCREDESC_POBLAC_EDO: TStringField
      DisplayLabel = 'Población'
      FieldName = 'DESC_POBLAC_EDO'
      Size = 40
    end
    object QryCOINCREROE_BRUTA_1: TFloatField
      DisplayLabel = 'ROE Bruta'
      FieldName = 'ROE_BRUTA_1'
    end
    object QryCOINCREROE_NETA_1: TFloatField
      DisplayLabel = 'ROE Neta'
      FieldName = 'ROE_NETA_1'
    end
    object QryCOINCRERAM_MEZCLA: TFloatField
      DisplayLabel = 'RAM Mezcla'
      FieldName = 'RAM_MEZCLA'
    end
    object QryCOINCRERAM_FTP: TFloatField
      DisplayLabel = 'RAM Ftp'
      FieldName = 'RAM_FTP'
    end
    object QryCOINCREREG_SECRETARIA: TStringField
      DisplayLabel = 'Cuenta C/Registro Federal'
      FieldName = 'REG_SECRETARIA'
      FixedChar = True
      Size = 1
    end
    object QryCOINCREEstructurado: TStringField
      DisplayLabel = 'Contrato Estructurado'
      FieldName = 'Estructurado'
      Size = 1
    end
    object QryCOINCREINS_FEDERAL: TStringField
      DisplayLabel = 'Registro Federal'
      FieldName = 'INS_FEDERAL'
      FixedChar = True
      Size = 1
    end
    object QryCOINCREF_INS_FEDERAL: TDateTimeField
      DisplayLabel = 'Fecha de Reg. Federal'
      FieldName = 'F_INS_FEDERAL'
    end
    object QryCOINCREID_AVAL_GOB: TFloatField
      DisplayLabel = 'ID Aval'
      FieldName = 'ID_AVAL_GOB'
    end
    object QryCOINCRENUM_CALIF: TFloatField
      DisplayLabel = '# de Calificadoras'
      FieldName = 'NUM_CALIF'
    end
    object QryCOINCRECal_FITCH: TStringField
      DisplayLabel = 'Calif. Acred. por FITCH IBCA'
      FieldName = 'Cal_FITCH'
    end
    object QryCOINCRECal_MOODYS: TStringField
      DisplayLabel = 'Calif. Acred. por MOODY'#39'S'
      FieldName = 'Cal_MOODYS'
    end
    object QryCOINCRECal_HR: TStringField
      DisplayLabel = 'Calif. Acred. por HR RATINGS'
      FieldName = 'Cal_HR'
    end
    object QryCOINCRECal_STANDARD: TStringField
      DisplayLabel = 'Calif. Acred. por STANDARD & POOR'#39'S'
      FieldName = 'Cal_STANDARD'
    end
    object QryCOINCRECAL_VERUM: TStringField
      DisplayLabel = 'Calif. Acred. por Verum'
      FieldName = 'CAL_VERUM'
      FixedChar = True
      Size = 1
    end
    object QryCOINCREIMP_CARTA_CREDITO: TFloatField
      DisplayLabel = 'Importe de Cartas de Crédito'
      FieldName = 'IMP_CARTA_CREDITO'
    end
    object QryCOINCREPct_Adicional: TFloatField
      DisplayLabel = '% Adicional'
      FieldName = 'Pct_Adicional'
    end
    object QryCOINCREImp_Total_CCI: TFloatField
      DisplayLabel = 'Importe Total de la CCI'
      FieldName = 'Imp_Total_CCI'
    end
    object QryCOINCREPagos_Mes: TFloatField
      DisplayLabel = 'Pagos del mes'
      FieldName = 'Pagos_Mes'
    end
    object QryCOINCRESaldo_Actual_CCI: TFloatField
      DisplayLabel = 'Saldo Actual de la CCI'
      FieldName = 'Saldo_Actual_CCI'
    end
    object QryCOINCREIMP_PREVEN_CUB: TFloatField
      FieldName = 'IMP_PREVEN_CUB'
    end
    object QryCOINCREIMP_PREVEN_EXP: TFloatField
      FieldName = 'IMP_PREVEN_EXP'
    end
    object QryCOINCRECVE_CAL_DEU: TStringField
      FieldName = 'CVE_CAL_DEU'
      FixedChar = True
      Size = 1
    end
    object QryCOINCRECVE_CAL_OPE_CUB: TStringField
      FieldName = 'CVE_CAL_OPE_CUB'
      FixedChar = True
      Size = 1
    end
    object QryCOINCRECVE_CAL_OPE_EXP: TStringField
      FieldName = 'CVE_CAL_OPE_EXP'
      FixedChar = True
      Size = 1
    end
    object QryCOINCREIMP_EXPUESTO: TFloatField
      FieldName = 'IMP_EXPUESTO'
    end
    object QryCOINCREIMP_CUBIERTO: TFloatField
      FieldName = 'IMP_CUBIERTO'
    end
    object QryCOINCRECVE_CALCULO: TStringField
      FieldName = 'CVE_CALCULO'
      FixedChar = True
      Size = 1
    end
    object QryCOINCREP_INCUMPL: TFloatField
      DisplayLabel = 'Probabilidad de Incumplimiento'
      FieldName = 'P_INCUMPL'
    end
    object QryCOINCRES_PERDIDA: TFloatField
      DisplayLabel = 'Severidad de la Pérdida'
      FieldName = 'S_PERDIDA'
    end
    object QryCOINCREB_REVOLVENTE: TStringField
      DisplayLabel = 'Crédito Revolvente'
      FieldName = 'B_REVOLVENTE'
      Size = 1
    end
    object QryCOINCREB_REVOCABLE: TStringField
      DisplayLabel = 'Crédito Revocable'
      FieldName = 'B_REVOCABLE'
      Size = 1
    end
    object QryCOINCREF_VENCIMIENTO_CONTRATO: TDateTimeField
      DisplayLabel = 'Fecha de Vencimiento del Contrato'
      FieldName = 'F_VENCIMIENTO_CONTRATO'
    end
    object QryCOINCREDESC_CAT_MINIMO: TStringField
      DisplayLabel = 'Descripción Clasificación Contable'
      FieldName = 'DESC_CAT_MINIMO'
      Size = 255
    end
  end
  object dsrcCOINCRE: TDataSource
    AutoEdit = False
    DataSet = QryCOINCRE
    Left = 97
    Top = 98
  end
  object spGenera08: TStoredProc
    Left = 192
    Top = 160
  end
end
