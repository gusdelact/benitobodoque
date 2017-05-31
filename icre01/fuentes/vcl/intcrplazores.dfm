object WCrPlazoRe: TWCrPlazoRe
  Left = 112
  Top = 178
  Width = 805
  Height = 521
  Caption = 'Consulta de Plazo Residual'
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
  object PnDatos: TPanel
    Left = -1
    Top = 456
    Width = 778
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
      Left = 423
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
      Left = 423
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
      Left = 487
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
      Left = 487
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 777
    Height = 449
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Plazo Residual'
      object Label2: TLabel
        Left = 8
        Top = 9
        Width = 60
        Height = 13
        Caption = 'Fecha Cierre'
      end
      object Label6: TLabel
        Left = 7
        Top = 356
        Width = 106
        Height = 13
        Caption = 'Generar Archivo Excel'
      end
      object Label1: TLabel
        Left = 537
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Rango (+/-)'
        Enabled = False
      end
      object Label8: TLabel
        Left = 727
        Top = 401
        Width = 40
        Height = 10
        Caption = 'V: 20110204'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object btMuestraDatos: TBitBtn
        Tag = 17
        Left = 641
        Top = 3
        Width = 128
        Height = 25
        Caption = 'Muestra datos'
        TabOrder = 0
        OnClick = btMuestraDatosClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF5555555555555A055555
          55555555588FF55555555555AAA05555555555558888F55555555555AAA05555
          555555558888FF555555555AAAAA05555555555888888F55555555AAAAAA0555
          5555558888888FF5555558AA05AAA05555555888858888F555558A05555AA055
          55558885555888FF55555555555AAA05555555555558888F555555555555AA05
          555555555555888FF555555555555AA05555555555555888FF5555555555558A
          05555555555555888FF5555555555558A05555555555555888FF555555555555
          5AA0555555555555588855555555555555555555555555555555}
        NumGlyphs = 2
      end
      object dtp_FECHACIERRE: TDateTimePicker
        Left = 70
        Top = 5
        Width = 89
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
      object DBGrid1: TDBGrid
        Left = 15
        Top = 35
        Width = 762
        Height = 313
        DataSource = dsConPlazoREsidual
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
        Left = 7
        Top = 373
        Width = 637
        Height = 21
        TabOrder = 3
        Text = 'C:\'
        OnKeyDown = edFileNameXLSKeyDown
      end
      object btnGeneraArchivo: TButton
        Left = 680
        Top = 372
        Width = 88
        Height = 22
        Caption = 'Genera Archivo'
        TabOrder = 4
        OnClick = btnGeneraArchivoClick
      end
      object ProgressBar: TProgressBar
        Left = 7
        Top = 398
        Width = 718
        Height = 17
        Min = 0
        Max = 100
        TabOrder = 5
      end
      object bbExtraeInformacion: TBitBtn
        Tag = 17
        Left = 650
        Top = 350
        Width = 118
        Height = 20
        Caption = 'Extrae información'
        TabOrder = 6
        OnClick = bbExtraeInformacionClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF5555555555555A055555
          55555555588FF55555555555AAA05555555555558888F55555555555AAA05555
          555555558888FF555555555AAAAA05555555555888888F55555555AAAAAA0555
          5555558888888FF5555558AA05AAA05555555888858888F555558A05555AA055
          55558885555888FF55555555555AAA05555555555558888F555555555555AA05
          555555555555888FF555555555555AA05555555555555888FF5555555555558A
          05555555555555888FF5555555555558A05555555555555888FF555555555555
          5AA0555555555555588855555555555555555555555555555555}
        NumGlyphs = 2
      end
      object btnSaveFileName: TButton
        Left = 648
        Top = 373
        Width = 28
        Height = 21
        Caption = '...'
        TabOrder = 7
        OnClick = btnSaveFileNameClick
      end
      object rgTipoConsulta: TRadioGroup
        Left = 161
        Top = 0
        Width = 192
        Height = 31
        Caption = 'Seleccione '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Consulta'
          'Conciliador')
        TabOrder = 8
        OnClick = rgTipoConsultaClick
      end
      object rgTipoConciliador: TRadioGroup
        Left = 351
        Top = 0
        Width = 183
        Height = 31
        Caption = 'Conciliador '
        Columns = 2
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          'General'
          'Diferencias')
        TabOrder = 9
        OnClick = rgTipoConciliadorClick
      end
      object seRango: TSpinEdit
        Left = 597
        Top = 4
        Width = 37
        Height = 22
        EditorEnabled = False
        Enabled = False
        MaxValue = 0
        MinValue = 0
        TabOrder = 10
        Value = 5
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'COINCRE Saldos C/P'
      ImageIndex = 1
      object Label3: TLabel
        Left = 8
        Top = 12
        Width = 60
        Height = 13
        Caption = 'Fecha Cierre'
      end
      object Label4: TLabel
        Left = 7
        Top = 356
        Width = 106
        Height = 13
        Caption = 'Generar Archivo Excel'
      end
      object DateTimePicker1: TDateTimePicker
        Left = 70
        Top = 8
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
      object bbcoicnresaldos: TBitBtn
        Tag = 17
        Left = 641
        Top = 6
        Width = 128
        Height = 25
        Caption = 'Muestra datos'
        TabOrder = 1
        OnClick = bbcoicnresaldosClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF5555555555555A055555
          55555555588FF55555555555AAA05555555555558888F55555555555AAA05555
          555555558888FF555555555AAAAA05555555555888888F55555555AAAAAA0555
          5555558888888FF5555558AA05AAA05555555888858888F555558A05555AA055
          55558885555888FF55555555555AAA05555555555558888F555555555555AA05
          555555555555888FF555555555555AA05555555555555888FF5555555555558A
          05555555555555888FF5555555555558A05555555555555888FF555555555555
          5AA0555555555555588855555555555555555555555555555555}
        NumGlyphs = 2
      end
      object DBGrid2: TDBGrid
        Left = 7
        Top = 43
        Width = 762
        Height = 313
        DataSource = dsCoincreSdos
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
      object Edit1: TEdit
        Left = 7
        Top = 373
        Width = 637
        Height = 21
        TabOrder = 3
        Text = 'C:\'
        OnKeyDown = edFileNameXLSKeyDown
      end
      object Button1: TButton
        Left = 648
        Top = 373
        Width = 28
        Height = 21
        Caption = '...'
        TabOrder = 4
        OnClick = Button1Click
      end
      object bbCoincreSdo: TButton
        Left = 680
        Top = 372
        Width = 88
        Height = 22
        Caption = 'Genera Archivo'
        TabOrder = 5
        OnClick = bbCoincreSdoClick
      end
      object ProgressBar1: TProgressBar
        Left = 7
        Top = 398
        Width = 759
        Height = 17
        Min = 0
        Max = 100
        TabOrder = 6
      end
      object rgCoincreTipoRep: TRadioGroup
        Left = 184
        Top = 2
        Width = 433
        Height = 33
        Caption = 'Tipo de Reporte'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Saldos al Corte'
          'Saldos Promedio')
        TabOrder = 7
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Consolidado X Sectores'
      ImageIndex = 2
      object Label5: TLabel
        Left = 8
        Top = 9
        Width = 60
        Height = 13
        Caption = 'Fecha Cierre'
      end
      object Label7: TLabel
        Left = 7
        Top = 356
        Width = 106
        Height = 13
        Caption = 'Generar Archivo Excel'
      end
      object DateTimePicker2: TDateTimePicker
        Left = 70
        Top = 5
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
      object bbConsolidadoSec: TBitBtn
        Tag = 17
        Left = 641
        Top = 3
        Width = 128
        Height = 25
        Caption = 'Muestra datos'
        TabOrder = 1
        OnClick = bbConsolidadoSecClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF5555555555555A055555
          55555555588FF55555555555AAA05555555555558888F55555555555AAA05555
          555555558888FF555555555AAAAA05555555555888888F55555555AAAAAA0555
          5555558888888FF5555558AA05AAA05555555888858888F555558A05555AA055
          55558885555888FF55555555555AAA05555555555558888F555555555555AA05
          555555555555888FF555555555555AA05555555555555888FF5555555555558A
          05555555555555888FF5555555555558A05555555555555888FF555555555555
          5AA0555555555555588855555555555555555555555555555555}
        NumGlyphs = 2
      end
      object Edit2: TEdit
        Left = 7
        Top = 373
        Width = 637
        Height = 21
        TabOrder = 2
        Text = 'C:\'
        OnKeyDown = edFileNameXLSKeyDown
      end
      object Button3: TButton
        Left = 648
        Top = 373
        Width = 28
        Height = 21
        Caption = '...'
        TabOrder = 3
        OnClick = Button3Click
      end
      object bbGenConsSec: TButton
        Left = 680
        Top = 372
        Width = 88
        Height = 22
        Caption = 'Genera Archivo'
        TabOrder = 4
        OnClick = bbGenConsSecClick
      end
      object ProgressBar2: TProgressBar
        Left = 7
        Top = 398
        Width = 759
        Height = 17
        Min = 0
        Max = 100
        TabOrder = 5
      end
      object DBGrid3: TDBGrid
        Left = 7
        Top = 43
        Width = 762
        Height = 313
        DataSource = dsCoincreSector
        FixedColor = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object InterForma1: TInterForma
    IsMain = True
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
    Left = 178
    Top = 77
  end
  object qryConPLAZORESIDUAL: TQuery
    DatabaseName = 'PCORP'
    SQL.Strings = (
      ' SELECT CCAS.*, CCAC.*, CTAS_SAP.*,   CTO_RIE.ROE_BRUTA,'
      ' CTO_RIE.ROE_NETA,'
      ' CTO_RIE.PCT_REQ_CAP_MER,'
      ' CTO_RIE.PCT_REQ_CAP_CRE,'
      ' CTO_RIE.PCT_CAPITALIZ'
      
        ' FROM  (SELECT * FROM CR_CON_ADEUDO_SDO WHERE F_CIERRE = TO_DATE' +
        '('#39'24/06/2009'#39','#39'DD/MM/YYYY'#39')) CCAS, '
      
        '       (SELECT * FROM CR_CON_ADEU_CLTV WHERE ID_REG_VIGENTE = 1)' +
        ' CCAC, '
      
        '     -- Inicia obtención de cuentas SAP para los productos de IC' +
        'RE e INTERCREDITOS'
      '     ('
      '        SELECT'
      
        '           CP.CVE_PRODUCTO_GPO, CP.CVE_PRODUCTO_CRE,  TEMP.CVE_S' +
        'ECTOR_SAP,'
      
        '           TEMP.CTA_K_VIG, TEMP.CTA_K_IMP, TEMP.CTA_K_VEN_EX, TE' +
        'MP.CTA_K_VEN_NE,'
      
        '           TEMP.CTA_I_VIG, TEMP.CTA_I_IMP, TEMP.CTA_I_VEN_EX, TE' +
        'MP.CTA_I_COB_XANT'
      '         FROM'
      '           ( SELECT CCS1.ID_OLTP_PRODUCTO,'
      '                    CCS1.CVE_SECTOR_SAP,'
      '                    MAX(CCS1.CTA_K_VIG)      AS CTA_K_VIG,'
      '                    MAX(CCS1.CTA_K_IMP)      AS CTA_K_IMP,'
      '                    MAX(CCS1.CTA_K_VEN_EX)   AS CTA_K_VEN_EX,'
      '                    MAX(CCS1.CTA_K_VEN_NE)   AS CTA_K_VEN_NE,'
      '                    MAX(CCS1.CTA_I_VIG)      AS CTA_I_VIG,'
      '                    MAX(CCS1.CTA_I_IMP)      AS CTA_I_IMP,'
      '                    MAX(CCS1.CTA_I_VEN_EX)   AS CTA_I_VEN_EX,'
      '                    MAX(CCS1.CTA_I_COB_XANT) AS CTA_I_COB_XANT'
      '             FROM ( SELECT'
      '                         CCS.ID_OLTP_PRODUCTO,'
      
        '                         DECODE(CCS.ID_REPORTE, 4, CCS.CVE_CUENT' +
        'A, 0) AS CTA_K_VIG,'
      
        '                         DECODE(CCS.ID_REPORTE, 16, CCS.CVE_CUEN' +
        'TA, 0) AS CTA_K_IMP,'
      '                         DECODE(CCS.ID_REPORTE, 20,'
      
        '                                DECODE(SUBSTR(CCS.CVE_CUENTA, 1,' +
        ' 4), '#39'1314'#39', CCS.CVE_CUENTA,'
      '                                       0'
      '                                      ) , 0'
      '                               ) AS CTA_K_VEN_EX,'
      '                         DECODE(CCS.ID_REPORTE, 20,'
      
        '                                DECODE(SUBSTR(CCS.CVE_CUENTA, 1,' +
        ' 4), '#39'1315'#39', CCS.CVE_CUENTA,'
      '                                       0'
      '                                      ) , 0'
      '                               ) AS CTA_K_VEN_NE,'
      
        '                         DECODE(CCS.ID_REPORTE, 30, CCS.CVE_CUEN' +
        'TA, 0) AS CTA_I_VIG,'
      
        '                         DECODE(CCS.ID_REPORTE, 9, CCS.CVE_CUENT' +
        'A, 0) AS CTA_I_IMP,'
      
        '                         DECODE(CCS.ID_REPORTE, 31, CCS.CVE_CUEN' +
        'TA, 0) AS CTA_I_VEN_EX,'
      
        '                         DECODE(CCS.ID_REPORTE, 32, CCS.CVE_CUEN' +
        'TA, 0) AS CTA_I_COB_XANT,'
      '                         CCS.CVE_SECTOR_SAP'
      '                    FROM CR_COINCRE_SAP CCS'
      
        '                    WHERE ((CCS.CVE_CUENTA LIKE '#39'1%'#39' OR CCS.CVE_' +
        'CUENTA LIKE '#39'2%'#39')'
      '                            AND CVE_MONEDA IN (484))'
      '                      OR  ((CCS.CVE_CUENTA LIKE '#39'6%'#39')'
      '                            AND CVE_MONEDA IN (800))'
      '                 ) CCS1'
      
        '              GROUP BY CCS1.ID_OLTP_PRODUCTO, CCS1.CVE_SECTOR_SA' +
        'P'
      '            ) TEMP,'
      '            CR_PRODUCTO CP'
      '         WHERE CP.CVE_PRODUCTO_CRE = TEMP.ID_OLTP_PRODUCTO'
      ''
      '       UNION ALL'
      ''
      '         SELECT'
      
        '           '#39'CRED'#39' AS CVE_PRODUCTO_GPO, TO_CHAR(CSTB.CVE_SUB_TIP_' +
        'BCO) AS CVE_SUB_TIP_BCO,'
      '           TEMP.CVE_SECTOR_SAP,'
      
        '           TEMP.CTA_K_VIG, TEMP.CTA_K_IMP, TEMP.CTA_K_VEN_EX, TE' +
        'MP.CTA_K_VEN_NE,'
      
        '           TEMP.CTA_I_VIG, TEMP.CTA_I_IMP, TEMP.CTA_I_VEN_EX, TE' +
        'MP.CTA_I_COB_XANT'
      '         FROM'
      '           ( SELECT CCS1.ID_OLTP_PRODUCTO,'
      '                    CCS1.CVE_SECTOR_SAP,'
      '                    MAX(CCS1.CTA_K_VIG)      AS CTA_K_VIG,'
      '                    MAX(CCS1.CTA_K_IMP)      AS CTA_K_IMP,'
      '                    MAX(CCS1.CTA_K_VEN_EX)   AS CTA_K_VEN_EX,'
      '                    MAX(CCS1.CTA_K_VEN_NE)   AS CTA_K_VEN_NE,'
      '                    MAX(CCS1.CTA_I_VIG)      AS CTA_I_VIG,'
      '                    MAX(CCS1.CTA_I_IMP)      AS CTA_I_IMP,'
      '                    MAX(CCS1.CTA_I_VEN_EX)   AS CTA_I_VEN_EX,'
      '                    MAX(CCS1.CTA_I_COB_XANT) AS CTA_I_COB_XANT'
      '             FROM ( SELECT'
      '                         CCS.ID_OLTP_PRODUCTO,'
      
        '                         DECODE(CCS.ID_REPORTE, 4, CCS.CVE_CUENT' +
        'A, 0) AS CTA_K_VIG,'
      
        '                         DECODE(CCS.ID_REPORTE, 16, CCS.CVE_CUEN' +
        'TA, 0) AS CTA_K_IMP,'
      '                         DECODE(CCS.ID_REPORTE, 20,'
      
        '                                DECODE(SUBSTR(CCS.CVE_CUENTA, 1,' +
        ' 4), '#39'1314'#39', CCS.CVE_CUENTA,'
      '                                       0'
      '                                      ) , 0'
      '                               ) AS CTA_K_VEN_EX,'
      '                         DECODE(CCS.ID_REPORTE, 20,'
      
        '                                DECODE(SUBSTR(CCS.CVE_CUENTA, 1,' +
        ' 4), '#39'1315'#39', CCS.CVE_CUENTA,'
      '                                       0'
      '                                      ) , 0'
      '                               ) AS CTA_K_VEN_NE,'
      
        '                         DECODE(CCS.ID_REPORTE, 30, CCS.CVE_CUEN' +
        'TA, 0) AS CTA_I_VIG,'
      
        '                         DECODE(CCS.ID_REPORTE, 9, CCS.CVE_CUENT' +
        'A, 0) AS CTA_I_IMP,'
      
        '                         DECODE(CCS.ID_REPORTE, 31, CCS.CVE_CUEN' +
        'TA, 0) AS CTA_I_VEN_EX,'
      
        '                         DECODE(CCS.ID_REPORTE, 32, CCS.CVE_CUEN' +
        'TA, 0) AS CTA_I_COB_XANT,'
      '                         CCS.CVE_SECTOR_SAP'
      '                    FROM CR_COINCRE_SAP CCS'
      
        '                    WHERE ((CCS.CVE_CUENTA LIKE '#39'1%'#39' OR CCS.CVE_' +
        'CUENTA LIKE '#39'2%'#39')'
      
        '                            AND CCS.ID_OLTP_PRODUCTO NOT IN ( SE' +
        'LECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO )'
      '                            AND CVE_MONEDA = 484)'
      '                    OR    ((CCS.CVE_CUENTA LIKE '#39'6%'#39')'
      
        '                            AND CCS.ID_OLTP_PRODUCTO NOT IN ( SE' +
        'LECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO )'
      '                            AND CVE_MONEDA = 800)'
      '                 ) CCS1'
      
        '              GROUP BY CCS1.ID_OLTP_PRODUCTO, CCS1.CVE_SECTOR_SA' +
        'P'
      '            ) TEMP,'
      '            CRE_SUB_TIP_BCO CSTB'
      
        '         WHERE TO_CHAR(CSTB.CVE_SUB_TIP_BCO) = TEMP.ID_OLTP_PROD' +
        'UCTO'
      '     ) CTAS_SAP '
      ' -- Consulta de CONTRATOs para Riesgos '
      ' ,'
      ' (SELECT NVL(CIC.ROE_BRUTA,NVL(CIN.ROE_BRUTA,0)) AS ROE_BRUTA,'
      '         NVL(CIC.ROE_NETA,NVL(CIN.ROE_NETA,0)) AS ROE_NETA,'
      
        '         NVL(CIC.PCT_REQ_CAP_MER,NVL(CIN.PCT_REQ_CAP_MER,0)) AS ' +
        'PCT_REQ_CAP_MER,'
      
        '         NVL(CIC.PCT_REQ_CAP_CRE,NVL(CIN.PCT_REQ_CAP_CRE,0)) AS ' +
        'PCT_REQ_CAP_CRE,'
      
        '         NVL(CIC.PCT_CAPITALIZ,NVL(CIN.PCT_CAPITALIZ,0)) AS PCT_' +
        'CAPITALIZ,'
      '  '#9'   NVL(CIC.ID_CONTRATO, CIN.ID_CONTRATO) AS ID_CONTRATO'
      '  FROM'
      
        '  (SELECT ID_CONTRATO, ROE_BRUTA, ROE_NETA, PCT_REQ_CAP_MER, PCT' +
        '_REQ_CAP_CRE, PCT_CAPITALIZ'
      '  FROM   CR_CONTRATO) CIC,'
      
        '  (SELECT ID_CONTRATO, ROE_BRUTA, ROE_NETA, PCT_REQ_CAP_MER, PCT' +
        '_REQ_CAP_CRE, PCT_CAPITALIZ'
      '  FROM   CRE_CONTRATO) CIN,'
      '  (SELECT DISTINCT(ID_CONTRATO) AS ID_CONTRATO'
      
        '   FROM   (SELECT ID_CONTRATO FROM CR_CONTRATO UNION ALL SELECT ' +
        'ID_CONTRATO FROM CRE_CONTRATO)) BASE'
      '  WHERE CIC.ID_CONTRATO (+)= BASE.ID_CONTRATO'
      '  AND   CIN.ID_CONTRATO (+)= BASE.ID_CONTRATO ) CTO_RIE'
      ' WHERE  1 = 1 '
      ' AND    CCAC.ID_CREDITO (+)= CCAS.ID_CREDITO'
      ' AND    CCAC.ID_CREDITO (+)= CCAS.ID_CREDITO'
      ' AND    CTAS_SAP.CVE_PRODUCTO_CRE (+)= CCAC.CVE_PRODUCTO_CRE '
      
        ' AND    CTAS_SAP.CVE_SECTOR_SAP (+)= CCAC.CVE_SECTOR  AND    CTO' +
        '_RIE.ID_CONTRATO (+)= CCAC.ID_CONTRATO ')
    Left = 386
    Top = 77
  end
  object dsConPlazoREsidual: TDataSource
    AutoEdit = False
    DataSet = qryConPLAZORESIDUAL
    Left = 505
    Top = 85
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.XLS'
    Filter = 'Microsoft Office Excel Workbook (*.xls)|*.xls'
    Left = 600
    Top = 85
  end
  object qryCoincreSdos: TQuery
    DatabaseName = 'PCORP'
    Left = 386
    Top = 157
  end
  object dsCoincreSector: TDataSource
    AutoEdit = False
    DataSet = qrsCoincreSector
    Left = 505
    Top = 237
  end
  object sdCoincreSector: TSaveDialog
    DefaultExt = '*.XLS'
    Filter = 'Microsoft Office Excel Workbook (*.xls)|*.xls'
    Left = 600
    Top = 237
  end
  object qrsCoincreSector: TQuery
    DatabaseName = 'PCORP'
    SQL.Strings = (
      '  SELECT '
      '         P.CVE_TIPO_SECTOR,'
      '         CCAC1.CVE_MONEDA,'
      '         CRMS.CVE_SECTOR_CNBV,'
      '         CCAS.ID_CREDITO,'
      '         CCAC1.CVE_CAT_MINIMO,'
      '         CCAC1.F_VENCIMIENTO,'
      '         CCAS.IMP_CAP_VIG,'
      '         CCAS.IMP_CAP_IMP,'
      '         CCAS.IMP_CAP_VDO_EX,'
      '         CCAS.IMP_CAP_VDO_NE,'
      '         CCAS.IMP_INT_VIG,'
      '         CCAS.IMP_INT_IMP,'
      '         CCAS.IMP_INT_VDO_EX'
      '  FROM CR_CON_ADEUDO_SDO CCAS,'
      '       ( SELECT CCAC.ID_CREDITO,'
      '                CCAC.ID_ACREDITADO,'
      '                CCAC.CVE_CAT_MINIMO,'
      '                CCAC.F_VENCIMIENTO,'
      #9#9'CCAC.CVE_MONEDA'
      '         FROM CR_CON_ADEU_CLTV CCAC'
      '         WHERE CCAC.ID_REG_VIGENTE = 1'
      '       ) CCAC1,'
      '       PERSONA P,'
      '       ADMIPROD.CR_REGUL_MAP_SEC CRMS'
      '  WHERE CCAS.F_CIERRE = TO_DATE('#39'31/10/2009'#39','#39'DD/MM/YYYY'#39')'
      '    AND CCAC1.ID_CREDITO = CCAS.ID_CREDITO'
      '    AND P.ID_PERSONA = CCAC1.ID_ACREDITADO'
      '    AND CRMS.CVE_SECTOR (+)= P.CVE_TIPO_SECTOR')
    Left = 386
    Top = 229
  end
  object dsCoincreSdos: TDataSource
    AutoEdit = False
    DataSet = qryCoincreSdos
    Left = 505
    Top = 157
  end
  object sdCoincreSdos: TSaveDialog
    DefaultExt = '*.XLS'
    Filter = 'Microsoft Office Excel Workbook (*.xls)|*.xls'
    Left = 600
    Top = 149
  end
end
