object WCrannaf: TWCrannaf
  Left = 274
  Top = 202
  Width = 833
  Height = 468
  Caption = 'Generación y Consulta NAFIN Anexo 8 y 9'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbFechaComplementaria: TLabel
    Left = 10
    Top = 22
    Width = 75
    Height = 13
    Caption = 'Fecha de Cierre'
  end
  object Label1: TLabel
    Left = 7
    Top = 364
    Width = 106
    Height = 13
    Caption = 'Generar Archivo Excel'
  end
  object PnDatos: TPanel
    Left = 4
    Top = 409
    Width = 812
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
  object dtpF_CIERRE: TDateTimePicker
    Left = 97
    Top = 18
    Width = 128
    Height = 21
    CalAlignment = dtaLeft
    Date = 39083.4646909259
    Time = 39083.4646909259
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object btMuestraDatos: TBitBtn
    Left = 228
    Top = 8
    Width = 133
    Height = 41
    Caption = 'Muestra Datos Anexo'
    TabOrder = 2
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
    Left = -4
    Top = 56
    Width = 812
    Height = 297
    DataSource = dsrcAnexo
    FixedColor = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edFileNameXLS: TEdit
    Left = 124
    Top = 360
    Width = 453
    Height = 21
    TabOrder = 4
    Text = 'C:\'
  end
  object btnSaveFileName: TButton
    Left = 586
    Top = 361
    Width = 28
    Height = 21
    Caption = '...'
    TabOrder = 5
    OnClick = btnSaveFileNameClick
  end
  object btnGeneraArchivo: TButton
    Left = 617
    Top = 360
    Width = 88
    Height = 22
    Caption = 'Genera Archivo'
    TabOrder = 6
    OnClick = btnGeneraArchivoClick
  end
  object ProgressBar: TProgressBar
    Left = 4
    Top = 385
    Width = 805
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 7
  end
  object rdAnexo: TRadioGroup
    Left = 376
    Top = 0
    Width = 265
    Height = 49
    Caption = 'Anexo'
    ItemIndex = 0
    Items.Strings = (
      'Saldos'
      'Desembolso y Recuperaciones')
    TabOrder = 8
  end
  object btGeneraDatos: TBitBtn
    Left = 668
    Top = 8
    Width = 141
    Height = 41
    Caption = 'Genera Datos Anexo'
    TabOrder = 9
    OnClick = btGeneraDatosClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
      55555575555555775F55509999999901055557F55555557F75F5001111111101
      105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
      01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
      8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
      0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
      0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
      05555555575FF777755555555500055555555555557775555555}
    NumGlyphs = 2
  end
  object bbConsultaAnexo9: TButton
    Left = 713
    Top = 360
    Width = 88
    Height = 22
    Caption = 'Anexo 9'
    TabOrder = 10
    OnClick = bbConsultaAnexo9Click
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
    Left = 698
    Top = 104
  end
  object QryAnexo: TQuery
    DatabaseName = 'PCORP'
    SQL.Strings = (
      '  SELECT'
      '          R.MERC_OBJ_DET,'
      '          CHR(39) || R.CVE_CAT_MINIMO AS CVE_CAT_MINIMO,'
      '          R.DESC_CAT_MINIMO,'
      '          R.CVE_MONEDA,'
      '          to_number(R.ID_CREDITO) as num_credito,'
      '          R.ID_ACREDITADO,'
      '          R.NOMBRE,'
      '          R.IMP_SDO_K_VIG,'
      '          R.IMP_SDO_K_IMP,'
      '          R.IMP_SDO_K_VEN,'
      '          R.IMP_INT_CORTE,'
      '          R.IMP_SDO_IO_IMP,'
      '          R.IMP_SDO_IO_VEN,'
      '          R.IMP_ADEUDO_TOTAL,'
      '          R.IMP_IO_DEV,'
      '          CHR(39) || R.CVE_CTA_CONTABLE  AS CVE_CTA_CONTABLE,'
      '          R.ID_OLTP_PRODUCTO,'
      '          R.PRODUCTO,'
      '          R.F_INICIO,'
      '          R.F_VENTTO,'
      '          R.ID_CONTRATO,'
      
        '          NVL(CO_ICRE.IMP_AUTORIZADO, CO_CRED.IMP_AUTORIZADO) AS' +
        ' IMP_AUTORIZADO,'
      '          NVL(CA.CVE_GRUPO_ECO, CL.CVE_GRUPO) AS CVE_GRUPO_ECO,'
      '          CTO.ID_PERS_ASOCIAD,'
      '          PROM_ASOC.NOMBRE AS NOM_PROM_ASOCIAD,'
      '          R.ID_PROM_ADM,'
      '          PROM_ADM.NOMBRE AS  NOM_PROM_ADMIN,'
      
        '          NVL(CA.B_ACREDITADO_REL, CL.B_ART_73) AS B_ACREDITADO_' +
        'REL,'
      '          CTAS_SAP.CTA_K_VIG,'
      '          CTAS_SAP.CTA_K_IMP,'
      '          CTAS_SAP.CTA_K_VEN_EX,'
      '          CTAS_SAP.CTA_K_VEN_NE,'
      '          CTAS_SAP.CTA_I_VIG,'
      '          CTAS_SAP.CTA_I_IMP,'
      '          CTAS_SAP.CTA_I_VEN_EX,'
      '          CTAS_SAP.CTA_I_COB_XANT'
      '  FROM ('
      '          SELECT DATOS_COINCRE.*,'
      
        '                 DECODE( NVL(CRED.ID_CREDITO, 0), 0, ICRE.F_INIC' +
        'IO, CRED.F_AUT_OPERACION) AS F_INICIO,'
      
        '                 DECODE( NVL(CRED.ID_CREDITO, 0), 0, ICRE.F_INIC' +
        'IO + ICRE.DIAS_PLAZO,'
      
        '                                                     CRED.F_AUT_' +
        'OPERACION + CRED.DIAS_PLAZO) AS F_VENTTO,'
      
        '                 DECODE( NVL(CRED.ID_CREDITO, 0), 0, ICRE.ID_CON' +
        'TRATO, CRED.ID_CONTRATO) AS ID_CONTRATO,'
      
        '                 DECODE( NVL(CRED.ID_CREDITO, 0), 0, ICRE.ID_PRO' +
        'M_ADM, CRED.ID_PROM_ADM) AS ID_PROM_ADM,'
      '                 CCM.DESC_CAT_MINIMO,'
      '                 CCC.CVE_CTA_CONTABLE'
      '          FROM'
      '                  (  SELECT'
      '                          COINCRE.ID_CREDITO,'
      '                          COINCRE.ID_ACREDITADO,'
      '                          COINCRE.CVE_MONEDA,'
      
        '                          DECODE (P.CVE_PER_JURIDICA, '#39'PF'#39', PF.A' +
        'PELLIDO_PATERNO || '#39' '#39' ||'
      
        '                                                            PF.A' +
        'PELLIDO_MATERNO || '#39' '#39' ||'
      
        '                                                            PF.N' +
        'OMBRE_PERSONA, P.NOMBRE) AS NOMBRE,'
      '                          COINCRE.IMP_SDO_K_VIG,'
      '                          COINCRE.IMP_SDO_K_IMP,'
      '                          COINCRE.IMP_SDO_K_VEN,'
      '                          COINCRE.IMP_INT_CORTE,'
      '                          COINCRE.IMP_SDO_IO_IMP,'
      '                          COINCRE.IMP_SDO_IO_VEN,'
      '                          COINCRE.IMP_IO_DEV,'
      '                          ( COINCRE.IMP_SDO_K_VIG +'
      '                            COINCRE.IMP_SDO_K_IMP +'
      '                            COINCRE.IMP_SDO_K_VEN +'
      '                            COINCRE.IMP_INT_CORTE +'
      '                            COINCRE.IMP_SDO_IO_IMP +'
      
        '                            COINCRE.IMP_SDO_IO_VEN ) AS IMP_ADEU' +
        'DO_TOTAL,'
      '                          COINCRE.MERC_OBJ_DET,'
      '                          COINCRE.CVE_CAT_MINIMO,'
      '                          COINCRE.ID_OLTP_PRODUCTO,'
      '                          COINCRE.PRODUCTO'
      '                     FROM ('
      
        '                          --------------------------------------' +
        '-------------------'
      
        '                          -- Inicia la obtención para el reporte' +
        ' mensual de COINCRE'
      '                           SELECT'
      '                                 DCDC.CREDITO AS ID_CREDITO,'
      
        '                                 DCDC.ID_OLTP_ACREDITADO AS ID_A' +
        'CREDITADO,'
      
        '                                 DCDC.ID_OLTP_MONEDA AS CVE_MONE' +
        'DA,'
      
        '                                 NVL(DCFC.IMP_SDO_K_VIG, 0)   AS' +
        ' IMP_SDO_K_VIG,'
      
        '                                 NVL(DCFC.IMP_SDO_K_IMP, 0)   AS' +
        ' IMP_SDO_K_IMP,'
      
        '                                 NVL(DCFC.IMP_SDO_K_VEN, 0)   AS' +
        ' IMP_SDO_K_VEN,'
      
        '                                 NVL(DCFC.IMP_INT_CORTE, 0)   AS' +
        ' IMP_INT_CORTE,'
      
        '                                 NVL(DCFC.IMP_SDO_IO_IMP, 0)  AS' +
        ' IMP_SDO_IO_IMP,'
      
        '                                 NVL(DCFC.IMP_INT_DEV_VDO, 0) AS' +
        ' IMP_SDO_IO_VEN,'
      
        '                                 NVL(DCFC.IMP_IO_DEV, 0)  AS IMP' +
        '_IO_DEV,'
      '                                 DCDC.MERC_OBJ_DET,'
      '                                 DCDC.CVE_CAT_MINIMO,'
      '                                 DCDC.ID_OLTP_PRODUCTO,'
      '                                 DCDC.PRODUCTO'
      '                          FROM DM_CR_FAC_CREDITO@DWHC DCFC,'
      '                               DM_CR_DIM_CREDITO@DWHC DCDC,'
      '                               ( SELECT DCDM.ID_ANIO_MES'
      '                                 FROM DM_CR_DIM_MES@DWHC DCDM'
      
        '                                 WHERE '#39'M'#39' = '#39'M'#39' -- Si es el rep' +
        'orte MENSUAL, entonces...'
      
        '                                   AND DCDM.NUM_MES = TO_NUMBER(' +
        'TO_CHAR(TO_DATE('#39'30/04/2008'#39','#39'DD/MM/YYYY'#39'),'#39'MM'#39'))'
      
        '                                   AND DCDM.ANIO = TO_NUMBER(TO_' +
        'CHAR(TO_DATE('#39'30/04/2008'#39','#39'DD/MM/YYYY'#39'),'#39'YYYY'#39'))'
      '                               ) DCDM'
      
        '                          WHERE '#39'M'#39' = '#39'M'#39' -- Si es el reporte ME' +
        'NSUAL, entonces...'
      
        '                            AND DCFC.ID_ANIO_MES = DCDM.ID_ANIO_' +
        'MES'
      
        '                            AND DCDC.ID_CREDITO = DCFC.ID_CREDIT' +
        'O'
      '--                            AND DCDC.CREDITO = '#39'23844'#39
      '                            AND DCDC.CREDITO = '#39'4951'#39
      '                            '
      '                       '
      '                       UNION ALL'
      
        '                          --------------------------------------' +
        '----------------------------'
      
        '                          -- Inicia la obtención para el reporte' +
        ' diario para ICRE  23May2008'
      '                          SELECT'
      
        '                               TO_CHAR(CCAS.ID_CREDITO) AS ID_CR' +
        'EDITO,'
      '                               CTO.ID_TITULAR AS ID_ACREDITADO,'
      '                               CTO.CVE_MONEDA,'
      
        '                               CCAS.IMP_CAP_VIG AS IMP_SDO_K_VIG' +
        ','
      
        '                               CCAS.IMP_CAP_IMP AS IMP_SDO_K_IMP' +
        ','
      
        '                               (CCAS.IMP_CAP_VDO_EX + CCAS.IMP_C' +
        'AP_VDO_NE) AS IMP_SDO_K_VEN,'
      
        '                               CCAS.IMP_INT_VIG AS IMP_INT_CORTE' +
        ','
      
        '                               CCAS.IMP_INT_IMP AS IMP_SDO_IO_IM' +
        'P,'
      
        '                               (CCAS.IMP_INT_VDO_EX) AS IMP_SDO_' +
        'IO_VEN, -- No se incluyen los interes vencidos no exigibles'
      '                               0 AS IMP_IO_DEV,'
      '                               GPO.DESC_CARTERA AS MERC_OBJ_DET,'
      
        '                               CP.CVE_CLAS_CONTAB AS CVE_CAT_MIN' +
        'IMO,'
      
        '                               CO.CVE_PRODUCTO_CRE AS ID_OLTP_PR' +
        'ODUCTO,'
      '                               CP.DESC_C_PRODUCTO AS PRODUCTO'
      '                          FROM CR_CON_ADEUDO_SDO CCAS,'
      '                               CR_CREDITO CC,'
      '                               CONTRATO CTO,'
      '                               CR_CONTRATO CO,'
      '                               CR_PRODUCTO CP,'
      '                               CRE_PRESUPUESTO PRES,'
      
        '                               ( SELECT CVE_GPO_INGRESO, UPPER(T' +
        'RIM(DESC_CARTERA)) AS DESC_CARTERA'
      '                                 FROM CRE_GPO_INGRESO'
      '                               ) GPO'
      
        '                          WHERE '#39'D'#39' = '#39'D'#39' -- Si es el reporte DI' +
        'ARIO, entonces...'
      
        '                            AND CCAS.F_CIERRE = TO_DATE('#39'30/04/2' +
        '008'#39','#39'DD/MM/YYYY'#39')'
      '                            AND CC.ID_CREDITO = 23844'
      '                            AND CC.ID_CREDITO = CCAS.ID_CREDITO'
      '                            AND CTO.ID_CONTRATO = CC.ID_CONTRATO'
      '                            AND CO.ID_CONTRATO = CC.ID_CONTRATO'
      
        '                            AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRO' +
        'DUCTO_CRE'
      
        '                            AND PRES.CVE_PRESUPUESTO = CP.CVE_PR' +
        'ESUPUESTO'
      
        '                            AND GPO.CVE_GPO_INGRESO (+) = PRES.C' +
        'VE_GPO_INGRESO'
      '                            '
      '                       UNION ALL'
      
        '                          --------------------------------------' +
        '----------------------------'
      
        '                          -- Inicia la obtención para el reporte' +
        ' diario para INTERCREDITOS 23May2008'
      '                            '
      '                          SELECT'
      
        '                               TO_CHAR(CCAS.ID_CREDITO) AS ID_CR' +
        'EDITO,'
      '                               CTO.ID_TITULAR AS ID_ACREDITADO,'
      '                               CTO.CVE_MONEDA,'
      
        '                               CCAS.IMP_CAP_VIG AS IMP_SDO_K_VIG' +
        ','
      
        '                               CCAS.IMP_CAP_IMP AS IMP_SDO_K_IMP' +
        ','
      
        '                               (CCAS.IMP_CAP_VDO_EX + CCAS.IMP_C' +
        'AP_VDO_NE) AS IMP_SDO_K_VEN,'
      
        '                               CCAS.IMP_INT_VIG AS IMP_INT_CORTE' +
        ','
      
        '                               CCAS.IMP_INT_IMP AS IMP_SDO_IO_IM' +
        'P,'
      
        '                               (CCAS.IMP_INT_VDO_EX) AS IMP_SDO_' +
        'IO_VEN, -- No se incluyen los interes vencidos no exigibles'
      '                               0 AS IMP_IO_DEV,'
      
        '                               PRES.DESC_PRESUPUESTO AS MERC_OBJ' +
        '_DET,'
      '                               CO.CVE_CAT_MIN AS CVE_CAT_MINIMO,'
      
        '                               TO_CHAR(CO.CVE_SUB_TIP_BCO) AS ID' +
        '_OLTP_PRODUCTO,'
      '                               CSTB.DESC_SUB_TIPO AS PRODUCTO'
      '                          FROM CR_CON_ADEUDO_SDO CCAS,'
      '                               CRE_CREDITO CC,'
      '                               CONTRATO CTO,'
      '                               CRE_CONTRATO CO,'
      '                               CRE_SUB_TIP_BCO CSTB,'
      '                               CRE_PRESUPUESTO PRES,'
      
        '                               ( SELECT CVE_GPO_INGRESO, UPPER(T' +
        'RIM(DESC_CARTERA)) AS DESC_CARTERA'
      '                                 FROM CRE_GPO_INGRESO'
      '                               ) GPO'
      
        '                          WHERE '#39'D'#39' = '#39'D'#39' -- Si es el reporte DI' +
        'ARIO, entonces...'
      
        '                            AND CCAS.F_CIERRE = TO_DATE('#39'30/04/2' +
        '008'#39','#39'DD/MM/YYYY'#39')'
      '                            AND CC.ID_CREDITO = 4951'
      '                            AND CC.ID_CREDITO = CCAS.ID_CREDITO'
      '                            AND CTO.ID_CONTRATO = CC.ID_CONTRATO'
      '                            AND CO.ID_CONTRATO = CC.ID_CONTRATO'
      
        '                            AND CSTB.CVE_SUB_TIP_BCO = CO.CVE_SU' +
        'B_TIP_BCO'
      
        '                            AND PRES.CVE_PRESUPUESTO = CC.CVE_PR' +
        'ESUPUESTO'
      
        '                            AND GPO.CVE_GPO_INGRESO (+) = PRES.C' +
        'VE_GPO_INGRESO'
      '                          ) COINCRE,'
      '                          PERSONA P,'
      '                          PERSONA_FISICA PF'
      '                     WHERE P.ID_PERSONA = COINCRE.ID_ACREDITADO'
      '                       AND PF.ID_PERSONA (+)= P.ID_PERSONA'
      '                 ) DATOS_COINCRE,'
      '                 CR_CREDITO ICRE,'
      
        '                 ( SELECT ID_CREDITO, ID_CONTRATO, F_AUT_OPERACI' +
        'ON, DIAS_PLAZO, ID_PROM_ADM'
      '                   FROM CRE_CREDITO CRED'
      '                   WHERE SIT_CREDITO NOT IN ('#39'CA'#39','#39'TA'#39','#39'TL'#39')'
      '                 ) CRED,'
      '                 CR_CAT_MINIMO CCM,'
      '                 ( SELECT ID_OLTP_PRODUCTO,'
      
        '                          MIN(CVE_CTA_CONTABLE) AS CVE_CTA_CONTA' +
        'BLE'
      '                   FROM CR_COINCRE_CONC'
      
        '                   WHERE ID_REPORTE IN (1, 4) -- Se toman las cu' +
        'entas de Capital Vigente'
      '                   GROUP BY ID_OLTP_PRODUCTO'
      '                 ) CCC'
      '          WHERE ICRE.ID_CREDITO (+)= DATOS_COINCRE.ID_CREDITO'
      '            AND CRED.ID_CREDITO (+)= DATOS_COINCRE.ID_CREDITO'
      
        '            AND CCM.CVE_CAT_MINIMO (+)= DATOS_COINCRE.CVE_CAT_MI' +
        'NIMO'
      
        '            AND CCC.ID_OLTP_PRODUCTO (+)= DATOS_COINCRE.ID_OLTP_' +
        'PRODUCTO'
      '      ) R,'
      
        '      -- Inicia obtención de cuentas SAP para los productos de I' +
        'CRE e INTERCREDITOS'
      '      (  '
      '         SELECT'
      '            CP.CVE_PRODUCTO_GPO,'
      '            CP.CVE_PRODUCTO_CRE,'
      '            CP.DESC_L_PRODUCTO,'
      '            TEMP.CTA_K_VIG,'
      '            TEMP.CTA_K_IMP,'
      '            TEMP.CTA_K_VEN_EX,'
      '            TEMP.CTA_K_VEN_NE,'
      '            TEMP.CTA_I_VIG,'
      '            TEMP.CTA_I_IMP,'
      '            TEMP.CTA_I_VEN_EX,'
      '            TEMP.CTA_I_COB_XANT'
      '          FROM '
      '            ( SELECT CCS1.ID_OLTP_PRODUCTO,'
      '                     MAX(CCS1.CTA_K_VIG)      AS CTA_K_VIG,'
      '                     MAX(CCS1.CTA_K_IMP)      AS CTA_K_IMP,'
      '                     MAX(CCS1.CTA_K_VEN_EX)   AS CTA_K_VEN_EX,'
      '                     MAX(CCS1.CTA_K_VEN_NE)   AS CTA_K_VEN_NE,'
      '                     MAX(CCS1.CTA_I_VIG)      AS CTA_I_VIG,'
      '                     MAX(CCS1.CTA_I_IMP)      AS CTA_I_IMP,'
      '                     MAX(CCS1.CTA_I_VEN_EX)   AS CTA_I_VEN_EX,'
      '                     MAX(CCS1.CTA_I_COB_XANT) AS CTA_I_COB_XANT'
      '              FROM ( SELECT'
      '                          CCS.ID_OLTP_PRODUCTO,'
      
        '                          DECODE(CCS.ID_REPORTE, 4, CCS.CVE_CUEN' +
        'TA, 0) AS CTA_K_VIG,'
      
        '                          DECODE(CCS.ID_REPORTE, 16, CCS.CVE_CUE' +
        'NTA, 0) AS CTA_K_IMP,'
      '                          DECODE(CCS.ID_REPORTE, 20,  '
      
        '                                 DECODE(SUBSTR(CCS.CVE_CUENTA, 1' +
        ', 4), '#39'1314'#39', CCS.CVE_CUENTA,'
      '                                        0'
      '                                       ) , 0'
      '                                ) AS CTA_K_VEN_EX,'
      '                          DECODE(CCS.ID_REPORTE, 20,  '
      
        '                                 DECODE(SUBSTR(CCS.CVE_CUENTA, 1' +
        ', 4), '#39'1315'#39', CCS.CVE_CUENTA,'
      '                                        0'
      '                                       ) , 0'
      '                                ) AS CTA_K_VEN_NE,'
      
        '                          DECODE(CCS.ID_REPORTE, 30, CCS.CVE_CUE' +
        'NTA, 0) AS CTA_I_VIG,'
      
        '                          DECODE(CCS.ID_REPORTE, 9, CCS.CVE_CUEN' +
        'TA, 0) AS CTA_I_IMP,'
      
        '                          DECODE(CCS.ID_REPORTE, 31, CCS.CVE_CUE' +
        'NTA, 0) AS CTA_I_VEN_EX,'
      
        '                          DECODE(CCS.ID_REPORTE, 32, CCS.CVE_CUE' +
        'NTA, 0) AS CTA_I_COB_XANT,'
      '                          CCS.CVE_SECTOR_SAP'
      '                     FROM CR_COINCRE_SAP CCS'
      
        '                     WHERE (CCS.CVE_CUENTA LIKE '#39'1%'#39' OR CCS.CVE_' +
        'CUENTA LIKE '#39'2%'#39')'
      '                       AND CVE_MONEDA = 484'
      '                  ) CCS1'
      '               GROUP BY CCS1.ID_OLTP_PRODUCTO'
      '             ) TEMP,'
      '             CR_PRODUCTO CP'
      '          WHERE CP.CVE_PRODUCTO_CRE = TEMP.ID_OLTP_PRODUCTO'
      '        '
      '        UNION ALL'
      '        '
      '          SELECT'
      '            '#39'CRED'#39' AS CVE_PRODUCTO_GPO,'
      '            TO_CHAR(CSTB.CVE_SUB_TIP_BCO) AS CVE_SUB_TIP_BCO,'
      '            CSTB.DESC_SUB_TIPO,'
      '            TEMP.CTA_K_VIG,'
      '            TEMP.CTA_K_IMP,'
      '            TEMP.CTA_K_VEN_EX,'
      '            TEMP.CTA_K_VEN_NE,'
      '            TEMP.CTA_I_VIG,'
      '            TEMP.CTA_I_IMP,'
      '            TEMP.CTA_I_VEN_EX,'
      '            TEMP.CTA_I_COB_XANT'
      '          FROM '
      '            ( SELECT CCS1.ID_OLTP_PRODUCTO,'
      '                     MAX(CCS1.CTA_K_VIG)      AS CTA_K_VIG,'
      '                     MAX(CCS1.CTA_K_IMP)      AS CTA_K_IMP,'
      '                     MAX(CCS1.CTA_K_VEN_EX)   AS CTA_K_VEN_EX,'
      '                     MAX(CCS1.CTA_K_VEN_NE)   AS CTA_K_VEN_NE,'
      '                     MAX(CCS1.CTA_I_VIG)      AS CTA_I_VIG,'
      '                     MAX(CCS1.CTA_I_IMP)      AS CTA_I_IMP,'
      '                     MAX(CCS1.CTA_I_VEN_EX)   AS CTA_I_VEN_EX,'
      '                     MAX(CCS1.CTA_I_COB_XANT) AS CTA_I_COB_XANT'
      '              FROM ( SELECT'
      '                          CCS.ID_OLTP_PRODUCTO,'
      
        '                          DECODE(CCS.ID_REPORTE, 4, CCS.CVE_CUEN' +
        'TA, 0) AS CTA_K_VIG,'
      
        '                          DECODE(CCS.ID_REPORTE, 16, CCS.CVE_CUE' +
        'NTA, 0) AS CTA_K_IMP,'
      '                          DECODE(CCS.ID_REPORTE, 20,  '
      
        '                                 DECODE(SUBSTR(CCS.CVE_CUENTA, 1' +
        ', 4), '#39'1314'#39', CCS.CVE_CUENTA,'
      '                                        0'
      '                                       ) , 0'
      '                                ) AS CTA_K_VEN_EX,'
      '                          DECODE(CCS.ID_REPORTE, 20,  '
      
        '                                 DECODE(SUBSTR(CCS.CVE_CUENTA, 1' +
        ', 4), '#39'1315'#39', CCS.CVE_CUENTA,'
      '                                        0'
      '                                       ) , 0'
      '                                ) AS CTA_K_VEN_NE,'
      
        '                          DECODE(CCS.ID_REPORTE, 30, CCS.CVE_CUE' +
        'NTA, 0) AS CTA_I_VIG,'
      
        '                          DECODE(CCS.ID_REPORTE, 9, CCS.CVE_CUEN' +
        'TA, 0) AS CTA_I_IMP,'
      
        '                          DECODE(CCS.ID_REPORTE, 31, CCS.CVE_CUE' +
        'NTA, 0) AS CTA_I_VEN_EX,'
      
        '                          DECODE(CCS.ID_REPORTE, 32, CCS.CVE_CUE' +
        'NTA, 0) AS CTA_I_COB_XANT,'
      '                          CCS.CVE_SECTOR_SAP'
      '                     FROM CR_COINCRE_SAP CCS'
      
        '                     WHERE (CCS.CVE_CUENTA LIKE '#39'1%'#39' OR CCS.CVE_' +
        'CUENTA LIKE '#39'2%'#39')'
      
        '                       AND CCS.ID_OLTP_PRODUCTO NOT IN ( SELECT ' +
        'CVE_PRODUCTO_CRE FROM CR_PRODUCTO )'
      '                       AND CVE_MONEDA = 484'
      '                  ) CCS1'
      '               GROUP BY CCS1.ID_OLTP_PRODUCTO'
      '             ) TEMP,'
      '             CRE_SUB_TIP_BCO CSTB'
      '          WHERE CSTB.CVE_SUB_TIP_BCO = TEMP.ID_OLTP_PRODUCTO'
      '      ) CTAS_SAP,'
      '      CONTRATO CTO,'
      '      CR_CONTRATO CO_ICRE,'
      '      CRE_CONTRATO CO_CRED,'
      '      CR_ACREDITADO CA,'
      '      CRE_CLIENTE CL,'
      '      PERSONA PROM_ASOC,'
      '      PERSONA PROM_ADM'
      '  WHERE CTO.ID_CONTRATO = R.ID_CONTRATO'
      '    AND CO_ICRE.ID_CONTRATO  (+)= R.ID_CONTRATO'
      '    AND CO_CRED.ID_CONTRATO  (+)= R.ID_CONTRATO'
      '    AND CA.ID_ACREDITADO     (+)= CTO.ID_TITULAR'
      '    AND CL.ID_PERSONA        (+)= CTO.ID_TITULAR'
      '    AND PROM_ASOC.ID_PERSONA (+)= CTO.ID_PERS_ASOCIAD'
      '    AND PROM_ADM.ID_PERSONA (+)= R.ID_PROM_ADM'
      
        '    AND CTAS_SAP.CVE_PRODUCTO_CRE (+)= R.ID_OLTP_PRODUCTO -- 23M' +
        'ay2008')
    Left = 26
    Top = 77
  end
  object dsrcAnexo: TDataSource
    AutoEdit = False
    DataSet = QryAnexo
    Left = 105
    Top = 77
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.XLS'
    Filter = 'Microsoft Office Excel Workbook (*.xls)|*.xls'
    Left = 552
    Top = 288
  end
end
