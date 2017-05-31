object WCrbitchip: TWCrbitchip
  Left = 192
  Top = 178
  Width = 788
  Height = 451
  Caption = 'Catálogo de Crbitchip'
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
    Left = 3
    Top = 387
    Width = 758
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
  object SGDatos: TSGCtrl
    Left = 7
    Top = 8
    Width = 754
    Height = 377
    ShowTab = True
    BevelOuter = bvNone
    TabOrder = 1
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
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
    Left = 538
    Top = 10
  end
  object vgQry: TQuery
    DatabaseName = 'pcorp'
    SQL.Strings = (
      'SELECT'
      '   '#9'RESULT.NUM_EMPLEADO'#9','
      
        '    (PF.APELLIDO_PATERNO || '#39' '#39' || PF.APELLIDO_MATERNO || '#39' '#39' ||' +
        ' PF.NOMBRE_PERSONA) AS NOMBRE,'
      '    RESULT.IMP_CAPITAL'#9','
      '    RESULT.IMP_INTERES_PROY'#9','
      '    RESULT.IMP_IVA'#9','
      '    RESULT.IMP_COMISION'#9','
      '    RESULT.IMP_IVA_COMISION ,'
      '    RESULT.IMP_TOTAL'
      'FROM'
      '   ('
      '    -- Disposiciones  INTERCREDITOS   '
      '    SELECT E.ID_EMPRESA,'
      '           E.NUM_EMPLEADO,'
      '           E.ID_PERSONA, '
      '           SUM(CA_CRED.IMP_CAPITAL)            AS IMP_CAPITAL,'
      
        '           SUM(CI_CRED.IMP_INTERES_PROY)       AS IMP_INTERES_PR' +
        'OY,'
      '           SUM(CI_CRED.IMP_IVA)                AS IMP_IVA,'
      '           SUM(NVL(CDC_CRED.IMP_COMISION,0))   AS IMP_COMISION,'
      
        '           SUM(NVL(CDC_CRED.IMP_IVA,0))        AS IMP_IVA_COMISI' +
        'ON,'
      '           SUM(CA_CRED.IMP_CAPITAL +'
      '               CI_CRED.IMP_INTERES_PROY +'
      '               CI_CRED.IMP_IVA +'
      '               NVL(CDC_CRED.IMP_COMISION, 0) +'
      '               NVL(CDC_CRED.IMP_IVA,0)) AS IMP_TOTAL'
      '    FROM ( SELECT CA.ID_CREDITO, CA.IMP_CAPITAL '
      '           FROM CRE_CAPITAL CA'
      '           WHERE CA.F_VENCIMIENTO = :pFNomina'
      
        '             AND CA.SIT_CAPITAL NOT IN ('#39'TA'#39','#39'TC'#39','#39'TI'#39','#39'TL'#39','#39'TP'#39 +
        ','#39'TR'#39','#39'TS'#39', '#39'CA'#39') --HERJA'
      '         ) CA_CRED,'
      '         ( SELECT CI.ID_CREDITO, CI.IMP_INTERES_PROY, CI.IMP_IVA'
      '           FROM CRE_INTERES CI'
      '           WHERE CI.F_VENCIMIENTO = :pFNomina'
      
        '             AND CI.SIT_INTERES NOT IN ('#39'TA'#39','#39'TC'#39','#39'TI'#39','#39'TL'#39','#39'TP'#39 +
        ','#39'TR'#39','#39'TS'#39', '#39'CA'#39') --HERJA'
      '         ) CI_CRED,'
      '         ( SELECT CDC.ID_CREDITO, CDC.IMP_COMISION, CDC.IMP_IVA'
      '           FROM CRE_DET_COMISION CDC'
      '           WHERE CDC.F_VENCIMIENTO = :pFNomina'
      
        '             AND CDC.SIT_COMISION NOT IN ('#39'TA'#39','#39'TC'#39','#39'TI'#39','#39'TL'#39','#39'T' +
        'P'#39','#39'TR'#39','#39'TS'#39', '#39'CA'#39') --HERJA           '
      '         ) CDC_CRED,'
      '          CRE_CREDITO CC,'
      '          CRE_CONTRATO CO,'
      '          CONTRATO CTO,'
      '          ( SELECT E.ID_EMPRESA, ID_PERSONA, E.NUM_EMPLEADO'
      '            FROM EMPLEADO E,'
      '                 DWH_EMPLEADO_V@LBOWBREPO_SEL EMPLEADO_LOBO'
      
        '            WHERE EMPLEADO_LOBO.CVE_EMPLEADO = E.NUM_EMPLEADO   ' +
        '  '
      '              AND EMPLEADO_LOBO.FECHA_DE_BAJA IS NULL'
      '              AND E.ID_EMPRESA = :pIdEmpresa'
      '              AND E.SIT_EMPLEADO = '#39'AC'#39
      '          ) E'
      '    WHERE 1=1'
      '      AND CC.SIT_CREDITO = '#39'AC'#39
      '      AND CA_CRED.ID_CREDITO = CC.ID_CREDITO'
      '      AND CI_CRED.ID_CREDITO = CC.ID_CREDITO'
      '      AND CDC_CRED.ID_CREDITO (+)= CC.ID_CREDITO'
      '      AND CO.ID_CONTRATO = CC.ID_CONTRATO'
      
        '      AND CO.CVE_SUB_TIP_BCO  IN (-- PRODUCTOS ABCD DE INTERCRED' +
        'ITOS'
      
        '                                   SELECT TO_NUMBER(CVE_CLAVE) A' +
        'S CVE_SUB_TIP_BCO'
      '                                   FROM CR_CON_CAT_DATA '
      
        '                                   WHERE CVE_CON_GPO_CAT = '#39'CAT_' +
        'PROD_ABCD_C'#39
      '                                 )'
      '      AND CTO.ID_CONTRATO = CC.ID_CONTRATO'
      '      AND E.ID_PERSONA = CTO.ID_TITULAR'
      '    GROUP BY E.ID_EMPRESA, E.NUM_EMPLEADO, E.ID_PERSONA  '
      'UNION'
      '   -- Disposiciones  ICRE01'
      '    SELECT E.ID_EMPRESA,'
      '           E.NUM_EMPLEADO,'
      '           E.ID_PERSONA, '
      '           SUM(CA_ICRE.IMP_CAPITAL)            AS IMP_CAPITAL,'
      
        '           SUM(CI_ICRE.IMP_INTERES_PROY)       AS IMP_INTERES_PR' +
        'OY,'
      '           SUM(CI_ICRE.IMP_IVA)                AS IMP_IVA,'
      '           SUM(NVL(CDC_ICRE.IMP_COMISION,0))   AS IMP_COMISION,'
      
        '           SUM(NVL(CDC_ICRE.IMP_IVA,0))        AS IMP_IVA_COMISI' +
        'ON,'
      '           SUM(CA_ICRE.IMP_CAPITAL +'
      '               CI_ICRE.IMP_INTERES_PROY + '
      '               CI_ICRE.IMP_IVA +'
      '               NVL(CDC_ICRE.IMP_COMISION, 0) +'
      '               NVL(CDC_ICRE.IMP_IVA,0)) AS IMP_TOTAL'
      '    FROM ( SELECT CA.ID_CREDITO, CA.IMP_CAPITAL'
      '           FROM ( SELECT CC.ID_CREDITO'
      '                  FROM (-- PRODUCTOS ABCD DE ICRE01'
      '                         SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE'
      '                         FROM CR_CON_CAT_DATA'
      '                         WHERE CVE_CON_GPO_CAT = '#39'CAT_PROD_ABCD'#39
      '                       ) CPROD_ICRE,'
      '                       CR_CREDITO CC,'
      '                       CR_CONTRATO CO'
      
        '                  WHERE CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRO' +
        'DUCTO_CRE'
      '                    AND CC.ID_CONTRATO = CO.ID_CONTRATO'
      '                    AND CC.SIT_CREDITO = '#39'AC'#39' --HERJA'
      '                ) CC,'
      '                CR_CAPITAL CA'
      '           WHERE CA.ID_CREDITO = CC.ID_CREDITO'
      '             AND CA.F_VENCIMIENTO = :pFNomina'
      '             AND CA.SIT_CAPITAL IN ('#39'AC'#39') --HERJA'
      '         ) CA_ICRE,'
      '         ( SELECT CI.ID_CREDITO, CI.IMP_INTERES_PROY, CI.IMP_IVA'
      '           FROM ( SELECT CC.ID_CREDITO'
      '                  FROM (-- PRODUCTOS ABCD DE ICRE01'
      '                         SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE '
      '                         FROM CR_CON_CAT_DATA '
      '                         WHERE CVE_CON_GPO_CAT = '#39'CAT_PROD_ABCD'#39
      '                       ) CPROD_ICRE,'
      '                       CR_CREDITO CC,'
      '                       CR_CONTRATO CO'
      
        '                  WHERE CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRO' +
        'DUCTO_CRE'
      '                    AND CC.ID_CONTRATO = CO.ID_CONTRATO'
      '                    AND CC.SIT_CREDITO = '#39'AC'#39' --HERJA'
      '                )  CC,'
      '                CR_INTERES CI'
      '           WHERE CI.ID_CREDITO = CC.ID_CREDITO'
      '             AND CI.F_VENCIMIENTO = :pFNomina'
      '             AND CI.SIT_INTERES IN ('#39'AC'#39') --HERJA'
      '         ) CI_ICRE,'
      '         ( SELECT CDC.ID_CREDITO, CDC.IMP_COMISION, CDC.IMP_IVA'
      '           FROM ( SELECT CC.ID_CREDITO'
      '                  FROM (-- PRODUCTOS ABCD DE ICRE01'
      '                         SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE'
      '                         FROM CR_CON_CAT_DATA'
      '                         WHERE CVE_CON_GPO_CAT = '#39'CAT_PROD_ABCD'#39
      '                       ) CPROD_ICRE,'
      '                       CR_CREDITO CC,'
      '                       CR_CONTRATO CO'
      
        '                  WHERE CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRO' +
        'DUCTO_CRE'
      '                    AND CC.ID_CONTRATO = CO.ID_CONTRATO'
      '                    AND CC.SIT_CREDITO = '#39'AC'#39' --HERJA'
      '                )  CC,'
      '                CR_COMISION CDC'
      '           WHERE CDC.ID_CREDITO = CC.ID_CREDITO'
      '             AND CDC.F_VENCIMIENTO = :pFNomina'
      '             AND CDC.SIT_COMISION IN ('#39'AC'#39') --HERJA             '
      '         ) CDC_ICRE,'
      '          CR_CREDITO CC,'
      '          CR_CONTRATO CO,'
      '          CONTRATO CTO,'
      '          ( SELECT E.ID_EMPRESA, ID_PERSONA, E.NUM_EMPLEADO'
      '            FROM EMPLEADO E,'
      '                 DWH_EMPLEADO_V@LBOWBREPO_SEL EMPLEADO_LOBO'
      '            WHERE EMPLEADO_LOBO.CVE_EMPLEADO = E.NUM_EMPLEADO'
      '              AND EMPLEADO_LOBO.FECHA_DE_BAJA IS NULL'
      '              AND E.ID_EMPRESA = :pIdEmpresa'
      '              AND E.SIT_EMPLEADO = '#39'AC'#39
      '          ) E,'
      '          (-- PRODUCTOS ABCD DE ICRE01'
      '            SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE '
      '            FROM CR_CON_CAT_DATA '
      '            WHERE CVE_CON_GPO_CAT = '#39'CAT_PROD_ABCD'#39
      '          ) CPROD_ICRE'
      '    WHERE 1=1'
      '      AND CC.SIT_CREDITO = '#39'AC'#39
      '      AND CA_ICRE.ID_CREDITO = CC.ID_CREDITO'
      '      AND CI_ICRE.ID_CREDITO = CC.ID_CREDITO'
      '      AND CDC_ICRE.ID_CREDITO (+)= CC.ID_CREDITO'
      '      AND CO.ID_CONTRATO = CC.ID_CONTRATO'
      '      AND CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRODUCTO_CRE'
      '      AND CTO.ID_CONTRATO = CC.ID_CONTRATO'
      '      AND E.ID_PERSONA = CTO.ID_TITULAR'
      '    GROUP BY E.ID_EMPRESA, E.NUM_EMPLEADO, E.ID_PERSONA'
      '  )  RESULT,'
      '  PERSONA_FISICA PF      '
      'WHERE PF.ID_PERSONA = RESULT.ID_PERSONA'
      'ORDER BY RESULT.NUM_EMPLEADO'
      ' '
      ' '
      ' '
      ' ')
    Left = 478
    Top = 7
    ParamData = <
      item
        DataType = ftDate
        Name = 'pFNomina'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pFNomina'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pFNomina'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'pIdEmpresa'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pFNomina'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pFNomina'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pFNomina'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'pIdEmpresa'
        ParamType = ptInput
      end>
  end
end
