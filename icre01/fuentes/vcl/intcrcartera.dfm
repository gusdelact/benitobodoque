object WCrCartera: TWCrCartera
  Left = 293
  Top = 251
  Width = 528
  Height = 252
  Caption = 'Cartera Crediticia Institucional (F1001)'
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
  object Panel1: TPanel
    Left = -1
    Top = 45
    Width = 520
    Height = 42
    TabOrder = 0
    object btReporte: TBitBtn
      Left = 394
      Top = 7
      Width = 120
      Height = 29
      Caption = 'Ver Reporte'
      TabOrder = 0
      OnClick = btReporteClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 3
      Width = 377
      Height = 34
      Caption = 'Agrupación de Información para el Reporte en pantalla'
      TabOrder = 1
      object cbCte: TCheckBox
        Left = 6
        Top = 14
        Width = 75
        Height = 17
        Caption = 'Por Cliente'
        TabOrder = 0
        OnMouseDown = cbCteMouseDown
      end
      object cbCto: TCheckBox
        Left = 92
        Top = 14
        Width = 83
        Height = 17
        Caption = 'Por Contrato'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnMouseDown = cbCtoMouseDown
      end
      object cbAmbas: TCheckBox
        Left = 190
        Top = 14
        Width = 56
        Height = 17
        Caption = 'Ambas'
        TabOrder = 2
        OnMouseDown = cbAmbasMouseDown
      end
      object cbSinGpo: TCheckBox
        Left = 270
        Top = 14
        Width = 97
        Height = 17
        Caption = 'Por Disposición'
        TabOrder = 3
        OnMouseDown = cbSinGpoMouseDown
      end
    end
  end
  object PnDatos: TPanel
    Left = -1
    Top = 195
    Width = 520
    Height = 21
    TabOrder = 1
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
      Left = 262
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
      Left = 262
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
      Left = 326
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
      Left = 326
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
  object Panel2: TPanel
    Left = -1
    Top = 90
    Width = 520
    Height = 103
    TabOrder = 2
    object sbExcel: TSpeedButton
      Left = 51
      Top = 48
      Width = 23
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      OnClick = sbExcelClick
    end
    object Label4: TLabel
      Left = 5
      Top = 51
      Width = 39
      Height = 13
      Caption = 'Archivo:'
    end
    object btArchivo: TBitBtn
      Left = 396
      Top = 42
      Width = 120
      Height = 29
      Caption = 'Generar Archivo'
      TabOrder = 0
      OnClick = btArchivoClick
      Glyph.Data = {
        46030000424D46030000000000003600000028000000120000000E0000000100
        1800000000001003000000000000000000000000000000000000DE3C00006500
        0065000065000065000065000065000065000065000065000065000065000065
        00006500006500006500006500FFFFFF0000DE3C00006500006500FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        6500006500FFFFFF0000DE3800006500006500FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF006500006500006500006500006500006500006500FFFFFF
        0000DE3800006500006500FFFFFF006500006500006500006500006500006500
        006500FFFFFF006500006500006500006500006500FFFFFF0000DE3C00006500
        006500FFFFFF006500006500006500006500006500006500FFFFFF0065000065
        00006500FFFFFF006500006500FFFFFF0000DE3800006500006500FFFFFF0065
        00006500006500006500006500FFFFFF006500006500006500006500FFFFFF00
        6500006500FFFFFF0000D63800006500006500FFFFFFFFFFFF00650000650000
        6500FFFFFF006500006500006500006500006500FFFFFF006500006500FFFFFF
        0000D63400006500006500FFFFFFFFFFFFFFFFFF006500FFFFFF006500006500
        006500006500FFFFFFFFFFFFFFFFFF006500006500FFFFFF0000D63400006500
        006500FFFFFFFFFFFF006500FFFFFF0065000065000065000065000065000065
        00FFFFFFFFFFFF006500006500FFFFFF0000D63400006500006500FFFFFF0065
        00FFFFFF006500006500006500006500006500006500006500006500FFFFFF00
        6500006500FFFFFF0000C63000006500006500FFFFFF00650000650000650000
        6500006500FFFFFF006500006500006500006500FFFFFF006500006500FFFFFF
        0000C63000006500006500FFFFFF006500006500006500006500FFFFFFFFFFFF
        FFFFFF006500006500006500FFFFFF006500006500FFFFFF0000C63400006500
        006500FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF006500006500FFFFFF0000C634000065000065000065000065
        0000650000650000650000650000650000650000650000650000650000650000
        6500006500FFFFFF0000}
    end
    object edNbrArch: TEdit
      Left = 77
      Top = 48
      Width = 307
      Height = 21
      Color = clBtnFace
      TabOrder = 1
      Text = 'C:\Cartera.xls'
    end
    object rgArchivo: TRadioGroup
      Left = 4
      Top = 5
      Width = 513
      Height = 33
      Caption = 'Tipo de Archivo'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Información por Cliente'
        'Información por Contrato'
        'Todas las Disposiciones')
      TabOrder = 2
    end
    object pbCartera: TProgressBar
      Left = 4
      Top = 81
      Width = 353
      Height = 9
      Min = 0
      Max = 5
      TabOrder = 3
    end
  end
  object Panel3: TPanel
    Left = -1
    Top = 1
    Width = 520
    Height = 41
    TabOrder = 3
    object Label1: TLabel
      Left = 212
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object EDFecha: TEdit
      Tag = -1
      Left = 258
      Top = 13
      Width = 94
      Height = 21
      Color = clBtnFace
      TabOrder = 0
    end
    object dtFecha: TInterDateTimePicker
      Left = 348
      Top = 13
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 35921.5224651389
      Time = 35921.5224651389
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      Edit = EDFecha
      Formato = dfDate
    end
  end
  object InterForma1: TInterForma
    IsMain = True
    OnImprimir = InterForma1Imprimir
    OnPreview = InterForma1Preview
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
    Left = 482
    Top = 163
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'XLS'
    Filter = 'Archivos Microsoft Excel (*.XLS)|*.XLS'
    Left = 453
    Top = 163
  end
  object qDatos: TQuery
    SQL.Strings = (
      '( '
      
        'SELECT A.ID_OLTP_ACREDITADO, A.ACREDITADO, A.ID_OLTP_PROM_ASOC,A' +
        '.ID_OLTP_PROM_ADMIN, A.CREDITO, A.producto, A.ORI_REC_GBL, A.ORI' +
        'GEN_INFO, A.IMP_INT_CORTE,'
      
        '       A.ID_OLTP_MONEDA,A.CVE_CAT_MINIMO, A.t_credito, A.IMP_SDO' +
        '_K_VIG_VP, A.IMP_SDO_K_IMP_VP, A.IMP_SDO_K_VEN_VP, A.IMP_INT_COR' +
        'TE_VP, A.IMP_SDO_IO_IMP_VP, '
      
        '       C.ID_PERSONA, C.ID_CREDITO, C.T_PERS, C.grupo, C.CVE_ACTI' +
        'V_ECO_SITI, C.LOCALIDAD, C.ID_CONTRATO, C.CVE_PER_JURIDICA, C.F_' +
        'INICIO, '
      
        '       C.F_VENCIMIENTO, C.CVE_OPERATIVA, C.CVE_AMORTIZACION, C.C' +
        'VE_PAG_INTERES, C.IMP_CREDITO, C.CVE_TASA_REFER, C.SOBRETASA, C.' +
        'CVE_GRUPO_ECO, '
      
        '       D.cve_cal_acred, E.CVE_CALIFIC_CUB, E.IMP_CUBIERTO, E.IMP' +
        '_EXPUESTO, E.IMP_RESERVA_CUB, '
      '       E.IMP_RESERVA_EXP, E.PCT_CUBIERTO, E.PCT_EXPUESTO, '
      
        '       decode(CVE_PER_JURIDICA,'#39'PM'#39',ACREDITADO,NOMBREF) AS NOMBR' +
        'E, '
      
        '       NVL(TABCTA.CUENTA_VIGENTE_K,TABCTAICRE.CVE_CTA_CONT_CAREV' +
        'I) AS CUENTA_CONTABLE, '
      
        '       NVL(TABCTA.CUENTA_VIGENTE_INT,TABCTAICRE.CVE_CTA_CONT_INR' +
        'EVI) AS CUENTA_INTERES , 0 AS IMPORTEREF, (E.IMP_RESERVA_CUB + E' +
        '.IMP_RESERVA_EXP) TOT_RESERVA'
      ',0.0 AS TOTCREDITO'
      'FROM '
      '    /***** BUSCA EN DWH *****/'
      
        '    ( select ID_OLTP_ACREDITADO, ACREDITADO, ID_OLTP_PROM_ASOC,I' +
        'D_OLTP_PROM_ADMIN, '
      
        '             CREDITO, ID_OLTP_PRODUCTO||'#39#39'||PRODUCTO producto, O' +
        'RI_REC_GBL, ORIGEN_INFO,'
      
        '             ID_OLTP_MONEDA,CVE_CAT_MINIMO, ID_OLTP_TIPO_CREDITO' +
        '||'#39#39'||TIPO_CREDITO t_credito,'
      
        '             IMP_SDO_K_VIG_VP, IMP_SDO_K_IMP_VP, IMP_SDO_K_VEN_V' +
        'P, IMP_INT_CORTE_VP, IMP_SDO_IO_IMP_VP , IMP_INT_CORTE'
      '      from DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '
      '      where aa.ID_ANIO_MES = 306 '
      '      and   aa.ID_CREDITO = bb.ID_CREDITO '
      '      and   ORIGEN_INFO='#39'ICRE'#39')  A, '
      '    /***** BUSCA DATOS GENERALES EN CORPORATIVO *****/'
      '    ( select '
      
        '       P.ID_PERSONA, C.ID_CREDITO, decode(p.CVE_PER_JURIDICA,'#39'PM' +
        #39','#39'MORAL'#39',DECODE(B_ACTIV_EMPRESA,'#39'V'#39','#39'FISICA ACT EMP'#39','#39'FISICA'#39'))' +
        ' T_PERS, '
      
        '       decode(p.CVE_PER_JURIDICA,'#39'PM'#39','#39#39',TRIM(APELLIDO_PATERNO)|' +
        '|'#39#39'||TRIM(APELLIDO_MATERNO)||'#39#39'||NOMBRE_PERSONA) NOMBREF, '
      
        '       '#39'grupo'#39'as grupo,p.CVE_ACTIV_ECO_SITI, PB.DESC_POBLACION A' +
        'S LOCALIDAD, C.ID_CONTRATO, p.CVE_PER_JURIDICA, '
      
        '       C.F_INICIO,C.F_VENCIMIENTO, C.CVE_OPERATIVA, C.CVE_AMORTI' +
        'ZACION, C.CVE_PAG_INTERES, C.IMP_CREDITO, C.CVE_TASA_REFER, C.SO' +
        'BRETASA, '
      
        '       cve_producto_cre, CCT.cve_moneda, id_empresa, CVE_GRUPO_E' +
        'CO  '
      
        '      from CR_CREDITO C, CONTRATO CT, cr_contrato CCT, persona p' +
        ', persona_fisica pf, persona_moral pm, '
      '           DOMICILIO D, POBLACION PB, CR_ACREDITADO CA '
      '      where C.ID_CONTRATO =CT.ID_CONTRATO '
      '      AND CCT.id_contrato = CT.id_contrato '
      '      AND CT.ID_TITULAR = P.ID_PERSONA '
      
        '      AND (pm.ID_PERSONA(+)= p.ID_PERSONA AND pf.ID_PERSONA(+)=p' +
        '.ID_PERSONA) '
      '      AND D.ID_DOMICILIO = P.ID_DOMICILIO '
      '      AND PB.CVE_POBLACION= D.CVE_ESTADO '
      '      AND CA.ID_ACREDITADO = P.ID_PERSONA ) C, '
      '     /***** BUSCA CALIFICACIÓN DEL DEUDOR EN SICC *****/ '
      
        '    ( SELECT ID_ACREDITADO, cve_cal_acred   FROM cr_sicc_cal_acr' +
        'e csa '
      
        '      WHERE CSA.ANIO_MES=  200606 AND CSA.SIT_SICC_CAL_ACR = '#39'AC' +
        #39') D, '
      '    /***** BUSCA DATOS DEL CREDITO EN SIC *****/ '
      
        '    ( SELECT id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPU' +
        'ESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUES' +
        'TO '
      
        '      FROM CR_SICC_CAL_CRED CSC  WHERE CSC.ANIO_MES=  200606 AND' +
        ' CSC.SIT_SICC_CAL_CRE = '#39'AC'#39') E, '
      '    /***** CUENTA DE CAPITAL Y CUENTA DE INTERESES *****/ '
      
        #9'( SELECT PROD.ID_EMPRESA, PROD.CVE_PRODUCTO_CRE, PROD.CVE_MONED' +
        'A, '
      
        '             SUBSTR(INREVI.CVE_CTA_CONT,1,30) CVE_CTA_CONT_INREV' +
        'I, SUBSTR(CAREVI.CVE_CTA_CONT,1,30) CVE_CTA_CONT_CAREVI '
      ' '#9'  FROM '
      #9#9' (SELECT CP.*, CRPM.CVE_MONEDA '
      '          FROM CR_PRODUCTO CP, '
      
        '              (SELECT CVE_MONEDA, CVE_PRODUCTO_CRE, COUNT(*) FRO' +
        'M CR_REL_PROD_MON CRPM GROUP BY CVE_MONEDA, CVE_PRODUCTO_CRE ORD' +
        'ER BY CVE_MONEDA, CVE_PRODUCTO_CRE) CRPM '
      
        '               WHERE CP.CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO' +
        '_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = '#39'CTICRE'#39') '
      
        '               AND   CRPM.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE' +
        ') PROD, '
      
        '              (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_' +
        'MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_' +
        'PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran '
      
        '               WHERE CVE_OPER_CRED = '#39'INREVI'#39'AND   CVE_COMISION ' +
        '= '#39'NA'#39'AND   CVE_CONCEPTO = '#39'IMPBRU'#39'AND   CVE_TIPO_MOVTO = '#39'MD'#39'AN' +
        'D   TIPO_AFECTACION = '#39'D'#39') INREVI, '
      
        '              (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_' +
        'MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_' +
        'PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran '
      
        '               WHERE CVE_OPER_CRED = '#39'CAREVI'#39'AND   CVE_COMISION ' +
        '= '#39'NA'#39'AND   CVE_CONCEPTO = '#39'IMPBRU'#39'AND   CVE_TIPO_MOVTO = '#39'MD'#39'AN' +
        'D   TIPO_AFECTACION = '#39'D'#39') CAREVI '
      '          WHERE INREVI.ID_EMPRESA    (+)= PROD.ID_EMPRESA '
      '          AND   INREVI.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE '
      '          AND   INREVI.CVE_MONEDA    (+)= PROD.CVE_MONEDA  '
      '          AND   CAREVI.ID_EMPRESA    (+)= PROD.ID_EMPRESA  '
      
        '          AND   CAREVI.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE ' +
        ' '
      
        '          AND   CAREVI.CVE_MONEDA    (+)= PROD.CVE_MONEDA   )TAB' +
        'CTAICRE,  '
      
        '         (SELECT CP.CVE_PRODUCTO_CRE, CUENTA_VIGENTE_INT, NVL(Ct' +
        'aAgrK.CUENTA_VIGENTE,CtaDDK.CUENTA_VIGENTE ) CUENTA_VIGENTE_K '
      '          FROM cr_producto CP, '
      
        '              (SELECT '#39'IN'#39'AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, ' +
        'SUBSTR(GC.CUENTA_CONTABLE,1,4) || '#39'-'#39'||  '
      
        '                      SUBSTR(GC.CUENTA_CONTABLE,5,4) || '#39'-'#39'|| SU' +
        'BSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE_INT '
      
        '               FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, GUIA_C' +
        'ONTABLE@SICA GC '
      '               WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '
      '               AND CCP.CVE_PRODUCTO_CR NOT LIKE '#39'%FAC'#39
      '               AND CCP.CVE_PRODUCTO_CR NOT LIKE '#39'%AGR'#39
      '               AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '
      '               AND GC.EMPRESA = '#39'BCO2'#39
      '               AND GC.CODIGO_TRANSACCION IN (306000, 306710) '
      '               AND GC.CAMPO_IMPORTE IN ('#39'03'#39','#39'06'#39') '
      '               AND GC.CLAVE_MONEDA = '#39'PESOS'#39
      
        '               AND (GC.CUENTA_CONTABLE LIKE '#39'13%'#39'OR GC.CUENTA_CO' +
        'NTABLE LIKE '#39'26%'#39')) CtaInt, '
      '              (SELECT '#39'KA'#39'AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, '
      
        '                      SUBSTR(GC.CUENTA_CONTABLE,1,4)|| '#39'-'#39'|| SUB' +
        'STR(GC.CUENTA_CONTABLE,5,4)||'#39'-'#39'|| SUBSTR(GC.CUENTA_CONTABLE,9,2' +
        ')AS CUENTA_VIGENTE '
      
        '               FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, GUIA_C' +
        'ONTABLE@SICA GC '
      '               WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '
      '               AND CCP.CVE_PRODUCTO_CR NOT LIKE '#39'%FAC'#39
      '               AND CCP.CVE_PRODUCTO_CR NOT LIKE '#39'%AGR'#39
      '               AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '
      '               AND GC.EMPRESA = '#39'BCO2'#39
      '               AND GC.CODIGO_TRANSACCION IN (300000)    '
      '               AND GC.CLAVE_MONEDA = '#39'PESOS'#39' '
      '               AND GC.CAMPO_IMPORTE = '#39'02'#39'  '
      '               AND (GC.CUENTA_CONTABLE LIKE '#39'13%'#39')) CtaAgrK,   '
      
        '             (SELECT '#39'KA'#39'AS CVE_CONCEPTO, CCP.CVE_PRODUCTO_CR,CT' +
        'A_CONTABLE||'#39'-'#39'||SUBSTR(SUB_CTA_CONTABLE,1,4)||'#39'-'#39'||SUBSTR(SUB_C' +
        'TA_CONTABLE,5,2) AS CUENTA_VIGENTE '
      '              FROM CR_CONT_PRODUCTO  CCP '
      '              WHERE CVE_PRODUCTO_CR LIKE '#39'%XXX'#39') CtaDDK '
      
        '          WHERE CtaInt.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE' +
        ' '
      '          AND CtaAgrK.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '
      
        '          AND CtaDDK.CVE_PRODUCTO_CR (+)= cp.CVE_PRODUCTO_CRE  )' +
        'TABCTA '
      'WHERE A.CREDITO=C.ID_CREDITO '
      'AND   D.ID_ACREDITADO(+)=A.ID_OLTP_ACREDITADO '
      'AND   E.id_credito(+)=C.ID_CREDITO  '
      'AND   C.CVE_PRODUCTO_CRE = TABCTA.CVE_PRODUCTO_CRE(+) '
      'AND   TABCTAICRE.ID_EMPRESA (+)= C.ID_EMPRESA '
      'AND   TABCTAICRE.CVE_PRODUCTO_CRE (+)= C.CVE_PRODUCTO_CRE '
      'AND   TABCTAICRE.CVE_MONEDA (+)= C.CVE_MONEDA '
      ') '
      'union all'
      '( '
      
        'SELECT A.ID_OLTP_ACREDITADO, A.ACREDITADO, A.ID_OLTP_PROM_ASOC,A' +
        '.ID_OLTP_PROM_ADMIN, A.CREDITO, A.producto, A.ORI_REC_GBL, A.ORI' +
        'GEN_INFO,  A.IMP_INT_CORTe,'
      
        '       A.ID_OLTP_MONEDA,A.CVE_CAT_MINIMO, A.t_credito, A.IMP_SDO' +
        '_K_VIG_VP, A.IMP_SDO_K_IMP_VP, A.IMP_SDO_K_VEN_VP, A.IMP_INT_COR' +
        'TE_VP, A.IMP_SDO_IO_IMP_VP, '
      
        '       C.ID_PERSONA, C.ID_CREDITO, C.T_PERS, C.grupo, C.CVE_ACTI' +
        'V_ECO_SITI, C.LOCALIDAD, C.ID_CONTRATO, C.CVE_PER_JURIDICA, C.F_' +
        'INICIO, '
      
        '       C.F_VENCIMIENTO, C.CVE_OPERATIVA, C.CVE_AMORTIZACION, C.C' +
        'VE_PAG_INTERES, C.IMP_CREDITO, C.CVE_TASA_REFER, C.SOBRETASA, C.' +
        'CVE_GRUPO_ECO, '
      
        '       D.cve_cal_acred, E.CVE_CALIFIC_CUB, E.IMP_CUBIERTO, E.IMP' +
        '_EXPUESTO, E.IMP_RESERVA_CUB, '
      '       E.IMP_RESERVA_EXP, E.PCT_CUBIERTO, E.PCT_EXPUESTO, '
      
        '       decode(CVE_PER_JURIDICA,'#39'PM'#39',ACREDITADO,NOMBREF) AS NOMBR' +
        'E, '
      '       DECODE (TIPO_DISPOSICION,'#39'RN'#39', '
      
        '         DECODE(CVE_SUB_TIP_BCO-47,0,TIPO_CUENTA||'#39'-'#39'||SUBSTR(CT' +
        'A_CONTABLE,1,4)||'#39'-'#39'||SUBSTR(CTA_CONTABLE,5,2), '
      
        '                                         '#39'1324-'#39'||substr(TIPO_CU' +
        'ENTA,4,2)||'#39'01-00'#39'), '
      
        '           TIPO_CUENTA||'#39'-'#39'||SUBSTR(CTA_CONTABLE,1,4)||'#39'-'#39'||SUBS' +
        'TR(CTA_CONTABLE,5,2) )  CUENTA_CONTABLE, '
      '       DECODE (TIPO_DISPOSICION, '#39'RN'#39', '
      '         DECODE(CVE_SUB_TIP_BCO-47,0, '
      
        '            DECODE(CVE_CALCULO,'#39'AN'#39','#39'2601-'#39'||SUBSTR(CTA_INTERES,' +
        '5,2)||'#39'-0000'#39', '
      
        '                   SUBSTR(CTA_INTERES,1,4)||'#39'-'#39'||SUBSTR(CTA_INTE' +
        'RES,5,4)||'#39'-'#39'||SUBSTR(CTA_INTERES,9,2)), '
      '             '#39'1319-2000-00'#39'),  '
      
        '             DECODE(CVE_CALCULO,'#39'AN'#39','#39'2601-'#39'||SUBSTR(CTA_INTERES' +
        ',5,2)||'#39'-0000'#39', '
      
        '             SUBSTR(CTA_INTERES,1,4)||'#39'-'#39'||SUBSTR(CTA_INTERES,5,' +
        '4)||'#39'-'#39'||SUBSTR(CTA_INTERES,9,2)) )  CUENTA_INTERES '
      
        '                  ,  0 AS IMPORTEREF, (E.IMP_RESERVA_CUB + E.IMP' +
        '_RESERVA_EXP) TOT_RESERVA'
      ',0.0 AS TOTCREDITO'
      'FROM'
      '    /***** BUSCA EN DWH *****/ '
      
        '    ( select ID_OLTP_ACREDITADO, ACREDITADO, ID_OLTP_PROM_ASOC,I' +
        'D_OLTP_PROM_ADMIN, '
      
        '             CREDITO, ID_OLTP_PRODUCTO||'#39#39'||PRODUCTO producto, O' +
        'RI_REC_GBL, ORIGEN_INFO, '
      
        '             ID_OLTP_MONEDA,CVE_CAT_MINIMO, ID_OLTP_TIPO_CREDITO' +
        '||'#39#39'||TIPO_CREDITO t_credito, '
      
        '             IMP_SDO_K_VIG_VP, IMP_SDO_K_IMP_VP, IMP_SDO_K_VEN_V' +
        'P, IMP_INT_CORTE_VP, IMP_SDO_IO_IMP_VP, IMP_INT_CORTE'
      '      from DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '
      '      where aa.ID_ANIO_MES = 306 '
      '      and   aa.ID_CREDITO = bb.ID_CREDITO '
      '      and   ORIGEN_INFO='#39'INTERCREDITOS'#39')  A, '
      '    /***** BUSCA DATOS GENERALES EN CORPORATIVO *****/'
      '    ( select '
      
        '       P.ID_PERSONA, C.ID_CREDITO, decode(p.CVE_PER_JURIDICA,'#39'PM' +
        #39','#39'MORAL'#39',DECODE(B_ACTIV_EMPRESA,'#39'V'#39','#39'FISICA ACT EMP'#39','#39'FISICA'#39'))' +
        ' T_PERS, '
      
        '       decode(p.CVE_PER_JURIDICA,'#39'PM'#39','#39#39',TRIM(APELLIDO_PATERNO)|' +
        '|'#39#39'||TRIM(APELLIDO_MATERNO)||'#39#39'||NOMBRE_PERSONA) NOMBREF, '
      
        '       '#39'grupo'#39'as grupo,p.CVE_ACTIV_ECO_SITI, PB.DESC_POBLACION A' +
        'S LOCALIDAD, C.ID_CONTRATO, p.CVE_PER_JURIDICA, '
      
        '       C.F_AUT_OPERACION AS F_INICIO, C.F_TRASPASO_VENC AS F_VEN' +
        'CIMIENTO, '#39'N/A'#39'AS CVE_OPERATIVA,  '
      
        '       DECODE(C.B_CAPITAL_PER,'#39'V'#39','#39'POR PERIODO'#39','#39'AL VENCIMIENTO'#39 +
        ')AS CVE_AMORTIZACION, '
      
        '       DECODE(B_INTERES_PER,'#39'V'#39','#39'POR PERIODOS'#39',DECODE(CVE_CALCUL' +
        'O,'#39'AN'#39','#39'AL INICIO'#39','#39'AL VENCIMIENTO'#39'))AS CVE_PAG_INTERES, '
      
        '       C.IMP_CREDITO, C.CVE_TASA_REFER, C.SOBRETASA,CTA_INTERES,' +
        'CVE_CALCULO,CST.CVE_SUB_TIP_BCO,TIPO_DISPOSICION, '
      
        '       CTA_CONTABLE,CTC.TIPO_CUENTA, CA.CVE_GRUPO AS CVE_GRUPO_E' +
        'CO '
      
        '      from CRE_CREDITO C, CONTRATO CT, CRE_contrato CCT, persona' +
        ' p, persona_fisica pf, persona_moral pm, '
      
        '           DOMICILIO D, POBLACION PB, CRE_SUB_TIP_BCO CST, CRE_S' +
        'UB_TIP_CNBV cnbv, CRE_TIPO_CREDITO CTC, CRE_CLIENTE CA   '
      '      where C.ID_CONTRATO =CT.ID_CONTRATO '
      '      AND CCT.id_contrato = CT.id_contrato '
      '      AND CT.ID_TITULAR = P.ID_PERSONA '
      
        '      AND (pm.ID_PERSONA(+)= p.ID_PERSONA AND pf.ID_PERSONA(+)=p' +
        '.ID_PERSONA) '
      '      AND D.ID_DOMICILIO = P.ID_DOMICILIO '
      '      AND PB.CVE_POBLACION= D.CVE_ESTADO '
      '      AND CCT.CVE_SUB_TIP_BCO  =  CST.CVE_SUB_TIP_BCO '
      '      AND CST.CVE_SUB_TIP_CNBV= CNBV.CVE_SUB_TIP_CNBV  '
      '      AND CNBV.CVE_TIPO_CREDITO = CTC.CVE_TIPO_CREDITO '
      '      AND CA.ID_PERSONA = P.ID_PERSONA  ) C, '
      '    /***** BUSCA CALIFICACIÓN DEL DEUDOR EN SICC *****/'
      
        '    ( SELECT ID_ACREDITADO, cve_cal_acred   FROM cr_sicc_cal_acr' +
        'e csa '
      
        '      WHERE CSA.ANIO_MES=  200606 AND CSA.SIT_SICC_CAL_ACR = '#39'AC' +
        #39') D, '
      '    /***** BUSCA DATOS DEL CREDITO EN SIC *****/ '
      
        '    ( SELECT id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPU' +
        'ESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUES' +
        'TO '
      
        '      FROM CR_SICC_CAL_CRED CSC  WHERE CSC.ANIO_MES=  200606 AND' +
        ' CSC.SIT_SICC_CAL_CRE = '#39'AC'#39') E '
      '    /***** CUENTA DE CAPITAL Y CUENTA DE INTERESES *****/'
      'WHERE A.CREDITO=C.ID_CREDITO '
      'AND   D.ID_ACREDITADO(+)=A.ID_OLTP_ACREDITADO '
      'AND   E.id_credito(+)=C.ID_CREDITO  '
      ')'
      ''
      ''
      '')
    Left = 423
    Top = 162
  end
end
