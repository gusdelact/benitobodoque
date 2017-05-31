object WAcreditPI: TWAcreditPI
  Left = 397
  Top = 207
  Width = 795
  Height = 420
  Caption = 'SP - PI por Acreditado'
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
  object lbPeriodo: TLabel
    Left = 5
    Top = 9
    Width = 36
    Height = 13
    Caption = 'Periodo'
  end
  object cbPeriodos: TComboBox
    Left = 4
    Top = 25
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnChange = cbPeriodosChange
  end
  object SGCtrl1: TSGCtrl
    Left = 5
    Top = 56
    Width = 794
    Height = 321
    ShowTab = False
    TabOrder = 1
    TabWidth = 0
    ShowBtnPriorNext = False
    ShowBtnFirst = False
    ShowBtnLast = False
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
    ShowBtnAyuda = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 362
    Top = 2
  end
  object Query1: TQuery
    DatabaseName = 'BCORP'
    SQL.Strings = (
      
        'SELECT   f_proceso, id_credito, acreditado, id_contrato, desc_es' +
        'tado,'
      '         desc_clave, sp, pi,'
      '            ROUND (  (CASE'
      '                         WHEN tot_x_credito = 0'
      '                            THEN 0'
      '                         ELSE tot_x_credito / imp_autorizado'
      '                      END'
      '                     )'
      '                   * 100,'
      '                   4'
      '                  )'
      '         || '#39'%'#39' AS pct_recerva,'
      '         renglon,'
      '         (CASE'
      '             WHEN pi_aval IS NOT NULL'
      '                THEN '#39'** PI de Aval   '#39
      '             ELSE '#39#39
      '          END'
      '         ) AS tx_observacion'
      '    FROM (SELECT   cre.id_credito, cto.id_contrato,'
      '                   p.id_persona AS acreditado, be.desc_estado,'
      '                   p.nombre AS desc_clave,'
      '                   NVL ((csc.s_perdida * 100), 0) || '#39'%'#39' AS sp,'
      
        '                   NVL ((csc.p_incumpl * 100), 0) || '#39'%'#39' AS pi, ' +
        'csc.pi_aval,'
      
        '                   TRUNC (csc.anio_mes) f_proceso, crcto.imp_aut' +
        'orizado,'
      
        '                   SUM (csc.imp_reserva_exp + csc.imp_reserva_cu' +
        'b'
      
        '                       ) OVER (PARTITION BY cre.id_credito ORDER' +
        ' BY cre.id_credito)'
      
        '                                                             AS ' +
        'tot_x_credito,'
      
        '                   ROW_NUMBER () OVER (PARTITION BY cto.id_contr' +
        'ato ORDER BY cto.id_contrato,'
      '                    cp.id_usr_cod_post DESC) renglon'
      '              FROM cr_sicc_califica csc'
      '                   JOIN'
      
        '                   ( /* Agregamos las Cartas de Credito */SELECT' +
        ' id_credito,'
      
        '                                                                ' +
        ' id_contrato'
      
        '                                                            FROM' +
        ' cr_credito cre'
      
        '                                                           WHERE' +
        '     2 = 2'
      
        '                                                                ' +
        ' AND cre.sit_credito ='
      
        '                                                                ' +
        '          '#39'AC'#39
      
        '                                                              OR' +
        ' 201208 <='
      
        '                                                                ' +
        '    TO_CHAR'
      
        '                                                                ' +
        '       (cre.f_liquidacion,'
      
        '                                                                ' +
        '        '#39'yyyymm'#39
      
        '                                                                ' +
        '       )'
      
        '                                                          UNION ' +
        'ALL'
      
        '                                                          SELECT' +
        ' id_credito,'
      
        '                                                                ' +
        ' id_contrato'
      
        '                                                            FROM' +
        ' admiprod.cr_con_reg_cci cci'
      
        '                                                           WHERE' +
        ' cci.id_reg_vigente ='
      
        '                                                                ' +
        '             1) cre'
      '                   ON (cre.id_credito = csc.id_credito)'
      
        '                   JOIN contrato cto ON (cto.id_contrato = cre.i' +
        'd_contrato)'
      '                   JOIN cr_contrato crcto'
      '                   ON (    crcto.id_contrato = cre.id_contrato'
      '                       AND cto.id_contrato = cto.id_contrato'
      '                      )'
      '                   JOIN cr_tipos_garan crg'
      '                   ON (crg.id_contrato = cto.id_contrato)'
      
        '                   JOIN persona p ON p.id_persona = cto.id_titul' +
        'ar'
      '                   JOIN domicilio d'
      
        '                   ON d.id_domicilio = NVL (p.id_dom_fiscal, p.i' +
        'd_domicilio)'
      
        '                   JOIN codigo_postal cp ON cp.codigo_postal = d' +
        '.codigo_postal'
      
        '                   JOIN bc_estado be ON be.cve_estado = cp.id_es' +
        'tado_pml'
      '             WHERE 2 = 2'
      '               AND csc.vigente = 1'
      '               AND TRUNC (csc.anio_mes) ='
      '                      (SELECT anio_mes'
      '                         FROM cr_sicc_vobo_per'
      '                        WHERE cve_situacion = '#39'AC'#39
      '                          AND cve_vobo = 1'
      '                          AND anio_mes = 201208)'
      '          ORDER BY p.id_persona, cre.id_credito)'
      '   WHERE renglon = 1'
      'ORDER BY desc_estado, desc_clave')
    Left = 200
    Top = 16
    object Query1F_PROCESO: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Periodo'
      DisplayWidth = 8
      FieldName = 'F_PROCESO'
    end
    object Query1ID_CREDITO: TFloatField
      DisplayWidth = 9
      FieldName = 'ID_CREDITO'
      Visible = False
    end
    object Query1ACREDITADO: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Acreditado'
      FieldName = 'ACREDITADO'
    end
    object Query1ID_CONTRATO: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Contrato'
      DisplayWidth = 11
      FieldName = 'ID_CONTRATO'
    end
    object Query1DESC_ESTADO: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 23
      FieldName = 'DESC_ESTADO'
      Size = 50
    end
    object Query1DESC_CLAVE: TStringField
      DisplayLabel = 'Municipio'
      DisplayWidth = 47
      FieldName = 'DESC_CLAVE'
      Size = 150
    end
    object Query1SP: TStringField
      Alignment = taCenter
      DisplayWidth = 7
      FieldName = 'SP'
      Size = 41
    end
    object Query1PI: TStringField
      Alignment = taCenter
      DisplayWidth = 7
      FieldName = 'PI'
      Size = 41
    end
    object Query1PCT_RECERVA: TStringField
      FieldName = 'PCT_RECERVA'
      Visible = False
      Size = 41
    end
    object Query1RENGLON: TFloatField
      FieldName = 'RENGLON'
      Visible = False
    end
    object Query1TX_OBSERVACION: TStringField
      DisplayLabel = 'Observaciones'
      DisplayWidth = 13
      FieldName = 'TX_OBSERVACION'
      Size = 16
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 232
    Top = 16
  end
  object qPeriodos: TQuery
    SQL.Strings = (
      'Select *'
      '  From Cr_Sicc_VoBo_Per '
      ' Where Cve_Situacion = '#39'AC'#39' And Cve_VoBo = 1'
      ' Order By ANIO_MES Desc')
    Left = 264
    Top = 16
  end
  object sdExcel: TSaveDialog
    Left = 296
    Top = 16
  end
  object Database1: TDatabase
    AliasName = 'BCORP'
    DatabaseName = 'BCORP'
    Params.Strings = (
      'USER NAME=admiprod')
    SessionName = 'Default'
    Left = 168
    Top = 16
  end
end
