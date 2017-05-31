object wCRR4CARGA: TwCRR4CARGA
  Left = 313
  Top = 183
  Width = 898
  Height = 396
  Caption = 'Generación de Reportes R04A'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 1
    Width = 874
    Height = 340
    TabOrder = 0
    object btnAutorizar: TSpeedButton
      Left = 194
      Top = 282
      Width = 81
      Height = 27
      Caption = 'Autorizar'
      OnClick = btnAutorizarClick
    end
    object btnNuevo: TSpeedButton
      Left = 16
      Top = 282
      Width = 81
      Height = 27
      Caption = 'Nuevo Reporte'
      OnClick = btnNuevoClick
    end
    object btnReporteXLS: TSpeedButton
      Left = 726
      Top = 122
      Width = 140
      Height = 27
      Caption = 'Generar Reporte XLS'
      OnClick = btnReporteXLSClick
    end
    object dbGrdCargas: TDBGrid
      Left = 16
      Top = 16
      Width = 705
      Height = 265
      DataSource = dsCargas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'FECHA'
          ReadOnly = True
          Width = 141
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_PERIODO_CARGA'
          ReadOnly = True
          Title.Caption = 'PERIODO'
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE'
          ReadOnly = True
          Title.Caption = 'USUARIO'
          Width = 270
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTATUS'
          ReadOnly = True
          Width = 130
          Visible = True
        end>
    end
    object btnExtraccion: TButton
      Left = 101
      Top = 282
      Width = 90
      Height = 27
      Caption = 'Extraer datos'
      TabOrder = 1
      OnClick = btnExtraccionClick
    end
    object PnDatos: TPanel
      Left = 1
      Top = 318
      Width = 872
      Height = 21
      Align = alBottom
      TabOrder = 2
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
        Left = 398
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
        Left = 398
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
        Left = 462
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
        Left = 462
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
    object rgTipoReporte: TRadioGroup
      Left = 726
      Top = 12
      Width = 140
      Height = 106
      ItemIndex = 0
      Items.Strings = (
        'Cartera Vigente'
        'Cartera Vencida'
        'Estimación Preventiva')
      TabOrder = 3
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
    OnDespuesShow = InterForma1DespuesShow
    Left = 192
    Top = 72
  end
  object dsCargas: TDataSource
    DataSet = qryCargas
    Left = 112
    Top = 72
  end
  object qryCargas: TQuery
    SQL.Strings = (
      'SELECT A.ID_BIT_CARGA '
      '      ,A.ID_PERIODO_CARGA'
      '      ,A.FH_CARGA FECHA'
      '      ,C.NOMBRE'
      '      ,A.ESTATUS'
      '  FROM CR_R04A_BITACORA_CARGA A'
      '      ,USUARIO                B'
      '      ,PERSONA                C'
      ' WHERE A.CVE_USUARIO = B.CVE_USUARIO'
      '   AND B.ID_PERSONA  = C.ID_PERSONA     '
      ' ORDER BY A.FH_CARGA DESC'
      ' ')
    Left = 152
    Top = 72
  end
  object qryColocaciones: TQuery
    SQL.Strings = (
      'SELECT REP.CVE_CONCEPTO'
      
        '      ,CASE WHEN NIVEL = 0 THEN REP.DESCRIPCION ELSE NULL END "N' +
        'IVEL 0"'
      
        '      ,CASE WHEN NIVEL = 1 THEN REP.DESCRIPCION ELSE NULL END "N' +
        'IVEL 1"'
      
        '      ,CASE WHEN NIVEL = 2 THEN REP.DESCRIPCION ELSE NULL END "N' +
        'IVEL 2"'
      
        '      ,CASE WHEN NIVEL = 3 THEN REP.DESCRIPCION ELSE NULL END "N' +
        'IVEL 3"'
      
        '      ,CASE WHEN NIVEL = 4 THEN REP.DESCRIPCION ELSE NULL END "N' +
        'IVEL 4"'
      
        '      ,CASE WHEN NIVEL = 5 THEN REP.DESCRIPCION ELSE NULL END "N' +
        'IVEL 5"'
      '      ,IMPORTES.IMPORTE_PESOS'
      '      ,IMPORTES.IMPORTE_MONEDA_EXTRANJERA'
      '  FROM CR_R04A_MAPEO_REP REP'
      '  LEFT OUTER JOIN ( SELECT A.CVE_CONCEPTO'
      
        '                          ,SUM(CASE WHEN B.CVE_MONEDA  = 484 THE' +
        'N IMP_OPERACION ELSE 0 END) IMPORTE_PESOS'
      
        '                          ,SUM(CASE WHEN B.CVE_MONEDA != 484 THE' +
        'N (IMP_OPERACION*TIPO_CAMBIO_OPER) ELSE 0 END) IMPORTE_MONEDA_EX' +
        'TRANJERA'
      '                      FROM CR_R04A_MAPEO_REP A'
      '                          ,CR_R04A_CARGA     B'
      '                     WHERE A.SECCION         = :paSeccionReporte'
      '                       AND B.ID_BIT_CARGA    = :paIdBitCarga'
      '                       AND A.CVE_CLAS_CONTAB = B.CVE_CLAS_CONTAB'
      '                  GROUP BY A.CVE_CONCEPTO'
      '                  ) IMPORTES'
      '    ON IMPORTES.CVE_CONCEPTO = REP.CVE_CONCEPTO'
      ' WHERE REP.SECCION      = :paSeccionReporte'
      '   AND REP.TIPO_REPORTE = 424'
      'ORDER BY REP.ORDEN'
      ' '
      ' ')
    Left = 264
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'paSeccionReporte'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'paIdBitCarga'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'paSeccionReporte'
        ParamType = ptInput
      end>
  end
  object qrySaldosIniciales: TQuery
    SQL.Strings = (
      'SELECT REP.CVE_CONCEPTO'
      
        '      ,CASE WHEN NIVEL = 0 THEN REP.DESCRIPCION ELSE NULL END "N' +
        'IVEL 0"'
      
        '      ,CASE WHEN NIVEL = 1 THEN REP.DESCRIPCION ELSE NULL END "N' +
        'IVEL 1"'
      
        '      ,CASE WHEN NIVEL = 2 THEN REP.DESCRIPCION ELSE NULL END "N' +
        'IVEL 2"'
      
        '      ,CASE WHEN NIVEL = 3 THEN REP.DESCRIPCION ELSE NULL END "N' +
        'IVEL 3"'
      
        '      ,CASE WHEN NIVEL = 4 THEN REP.DESCRIPCION ELSE NULL END "N' +
        'IVEL 4"'
      
        '      ,CASE WHEN NIVEL = 5 THEN REP.DESCRIPCION ELSE NULL END "N' +
        'IVEL 5"'
      '      ,IMPORTES.IMPORTE_PESOS'
      '      ,IMPORTES.IMPORTE_MONEDA_EXTRANJERA'
      '  FROM CR_R04A_MAPEO_REP REP'
      '  LEFT OUTER JOIN'
      '  ( '
      '  SELECT SALDOS_INICIALES.CVE_CONCEPTO'
      '        ,SUM(SALDOS_INICIALES.IMPORTE_PESOS) IMPORTE_PESOS'
      
        '        ,SUM(SALDOS_INICIALES.IMPORTE_MONEDA_EXTRANJERA) IMPORTE' +
        '_MONEDA_EXTRANJERA'
      '    FROM'
      '(        '
      '  SELECT MAP.CVE_CONCEPTO'
      
        '        ,SUM((IMP_CAP_VIG + IMP_CAP_IMP + IMP_CAP_VDO_EX + IMP_C' +
        'AP_VDO_NE + IMP_INT_VIG + IMP_INT_IMP + IMP_INT_VDO_EX + IMP_INT' +
        '_VDO_NE) * DECODE(CREDITOS.CVE_MONEDA, 484, 1, 0)) IMPORTE_PESOS'
      
        '        ,SUM((IMP_CAP_VIG + IMP_CAP_IMP + IMP_CAP_VDO_EX + IMP_C' +
        'AP_VDO_NE + IMP_INT_VIG + IMP_INT_IMP + IMP_INT_VDO_EX + IMP_INT' +
        '_VDO_NE) * DECODE(CREDITOS.CVE_MONEDA, 484, 0, PKGCRCONTA.STPOBT' +
        '_TIPO_CAMBIO_SAP(CREDITOS.ID_EMPRESA, LAST_DAY(TO_DATE(:paFechaC' +
        'ierre, '#39'DD/MM/YYYY'#39')), CREDITOS.CVE_MONEDA))) IMPORTE_MONEDA_EXT' +
        'RANJERA'
      '    FROM CR_CON_ADEUDO_SDO ADEUDO'
      '        ,(     '
      '           SELECT B.CVE_CAT_MIN'
      '                 ,A.ID_CREDITO'
      '                 ,C.CVE_MONEDA'
      '                 ,C.ID_EMPRESA'
      '             FROM CRE_CREDITO  A'
      '                 ,CRE_CONTRATO B'
      '                 ,CONTRATO     C'
      '            WHERE 1 = 1'
      '              AND B.ID_CONTRATO = A.ID_CONTRATO'
      '              AND C.ID_CONTRATO = B.ID_CONTRATO'
      '         ) CREDITOS'
      '        , CR_R04A_MAPEO_REP MAP '
      
        '   WHERE ADEUDO.F_CIERRE = LAST_DAY(TO_DATE(:paFechaCierre, '#39'DD/' +
        'MM/YYYY'#39'))'
      '     AND MAP.SECCION = 1'
      '     AND ADEUDO.ID_CREDITO   = CREDITOS.ID_CREDITO'
      '     AND MAP.CVE_CLAS_CONTAB = CREDITOS.CVE_CAT_MIN'
      'GROUP BY MAP.CVE_CONCEPTO'
      'UNION SELECT MAP.CVE_CONCEPTO'
      
        '        ,SUM((IMP_CAP_VIG + IMP_CAP_IMP + IMP_CAP_VDO_EX + IMP_C' +
        'AP_VDO_NE + IMP_INT_VIG + IMP_INT_IMP + IMP_INT_VDO_EX + IMP_INT' +
        '_VDO_NE) * DECODE(CREDITOS.CVE_MONEDA, 484, 1 , 0)) IMPORTE_PESO' +
        'S'
      
        '        ,SUM((IMP_CAP_VIG + IMP_CAP_IMP + IMP_CAP_VDO_EX + IMP_C' +
        'AP_VDO_NE + IMP_INT_VIG + IMP_INT_IMP + IMP_INT_VDO_EX + IMP_INT' +
        '_VDO_NE) * DECODE(CREDITOS.CVE_MONEDA, 484, 0 , PKGCRCONTA.STPOB' +
        'T_TIPO_CAMBIO_SAP(CREDITOS.ID_EMPRESA, LAST_DAY(TO_DATE(:paFecha' +
        'Cierre, '#39'DD/MM/YYYY'#39')), CREDITOS.CVE_MONEDA))) IMPORTE_MONEDA_EX' +
        'TRANJERA'
      '    FROM CR_CON_ADEUDO_SDO ADEUDO'
      '        ,(     '
      '           SELECT C.CVE_CLAS_CONTAB CVE_CAT_MIN '
      '                 ,A.ID_CREDITO'
      '                 ,B.CVE_MONEDA'
      '                 ,D.ID_EMPRESA'
      '             FROM CR_CREDITO  A'
      '                 ,CR_CONTRATO B'
      '                 ,CR_PRODUCTO C'
      '                 ,CONTRATO    D'
      '            WHERE 1 = 1 '
      '              AND B.ID_CONTRATO      = A.ID_CONTRATO'
      '              AND B.FOL_CONTRATO     = A.FOL_CONTRATO'
      '              AND C.CVE_PRODUCTO_CRE = B.CVE_PRODUCTO_CRE'
      '              AND D.ID_CONTRATO      = B.ID_CONTRATO'
      '         ) CREDITOS'
      '        , CR_R04A_MAPEO_REP MAP '
      
        '   WHERE ADEUDO.F_CIERRE      = LAST_DAY(TO_DATE(:paFechaCierre,' +
        ' '#39'DD/MM/YYYY'#39'))'
      '     AND MAP.SECCION          = 1'
      '     AND ADEUDO.ID_CREDITO    = CREDITOS.ID_CREDITO'
      '     AND MAP.CVE_CLAS_CONTAB  = CREDITOS.CVE_CAT_MIN '
      '   GROUP BY MAP.CVE_CONCEPTO'
      ') SALDOS_INICIALES'
      'GROUP BY SALDOS_INICIALES.CVE_CONCEPTO'
      ') IMPORTES'
      'ON IMPORTES.CVE_CONCEPTO = REP.CVE_CONCEPTO'
      'WHERE  REP.SECCION      = 1'
      '   AND REP.TIPO_REPORTE = 424'
      'ORDER BY REP.ORDEN ')
    Left = 232
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'paFechaCierre'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'paFechaCierre'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'paFechaCierre'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'paFechaCierre'
        ParamType = ptInput
      end>
  end
  object qryReporte424: TQuery
    SQL.Strings = (
      ' SELECT MAPEO.CVE_CONCEPTO'
      
        '       ,CASE WHEN MAPEO.NIVEL = 0 THEN MAPEO.DESCRIPCION ELSE NU' +
        'LL END NIVEL_0'
      
        '       ,CASE WHEN MAPEO.NIVEL = 1 THEN MAPEO.DESCRIPCION ELSE NU' +
        'LL END NIVEL_1'
      
        '       ,CASE WHEN MAPEO.NIVEL = 2 THEN MAPEO.DESCRIPCION ELSE NU' +
        'LL END NIVEL_2'
      
        '       ,CASE WHEN MAPEO.NIVEL = 3 THEN MAPEO.DESCRIPCION ELSE NU' +
        'LL END NIVEL_3'
      
        '       ,CASE WHEN MAPEO.NIVEL = 4 THEN MAPEO.DESCRIPCION ELSE NU' +
        'LL END NIVEL_4'
      
        '       ,CASE WHEN MAPEO.NIVEL = 5 THEN MAPEO.DESCRIPCION ELSE NU' +
        'LL END NIVEL_5'
      
        '       ,CASE WHEN MAPEO.NIVEL = 6 THEN MAPEO.DESCRIPCION ELSE NU' +
        'LL END NIVEL_6'
      '       ,REP.TOTAL_IMPORTE'
      '       ,REP.IMPORTE_PESOS'
      '       ,REP.IMPORTE_MONEDA_EXTRANJERA'
      '   FROM CR_R04A_MAPEO_REP MAPEO'
      '   LEFT OUTER JOIN'
      '       ( '
      ' SELECT CVE_CONCEPTO'
      '       ,NIVEL_0'
      '       ,NIVEL_1'
      '       ,NIVEL_2'
      '       ,NIVEL_3'
      '       ,NIVEL_4'
      '       ,NIVEL_5'
      '       ,NIVEL_6'
      
        '       ,CASE WHEN SECCION != :paSeccionAjusteCambiario THEN IMPO' +
        'RTE_PESOS + IMPORTE_MONEDA_EXTRANJERA'
      '             ELSE IMPORTE_PESOS'
      '              END TOTAL_IMPORTE'
      
        '       ,CASE WHEN SECCION != :paSeccionAjusteCambiario THEN IMPO' +
        'RTE_PESOS ELSE NULL END IMPORTE_PESOS'
      '       ,IMPORTE_MONEDA_EXTRANJERA'
      '   FROM CR_R04A_REP_PASO'
      '  WHERE ID_BIT_CARGA = :paBitacoraCarga'
      '  ORDER BY SECCION, ORDEN'
      '       ) REP'
      '     ON REP.CVE_CONCEPTO = MAPEO.CVE_CONCEPTO'
      '  WHERE MAPEO.TIPO_REPORTE = :paTipoReporte'
      '  ORDER BY MAPEO.SECCION, MAPEO.ORDEN      '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 208
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'paSeccionAjusteCambiario'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'paSeccionAjusteCambiario'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'paBitacoraCarga'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'paTipoReporte'
        ParamType = ptInput
      end>
  end
  object spGeneraReporte: TStoredProc
    StoredProcName = 'PKGCRREGULATORIOSR04.SP_CR_R04A_GENERAREPORTE'
    Left = 120
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PEIDBITACORACARGA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PETIPOREPORTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = 'PECOMMIT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PSRESPUESTA'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'PSDESCRIPCIONERROR'
        ParamType = ptOutput
      end>
  end
  object spAcumuladosReporte: TStoredProc
    StoredProcName = 'PKGCRREGULATORIOSR04.SP_OBTEN_CIFRAS_REPORTE'
    Left = 168
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PETIPOREPORTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEIDBITACORACARGA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PECOMMIT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PSRESPUESTA'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'PSDESCERROR'
        ParamType = ptOutput
      end>
  end
end
