object WCrResEyMCalif: TWCrResEyMCalif
  Left = 101
  Top = 180
  Width = 965
  Height = 460
  Caption = 'Reservas Estados y Municipios por Grado de Riesgo'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 961
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 8
      Width = 30
      Height = 13
      Caption = 'Fecha'
      FocusControl = dpFecha
    end
    object sbExportar: TSpeedButton
      Left = 609
      Top = 20
      Width = 116
      Height = 24
      Caption = 'Exportar a Excel'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000C40E0000C40E00000000000000000000D8E6E0FF4C77
        57FF3F7450FF396B4EFF38684CFF356549FF336246FF315E42FF2A553DFF2954
        3BFF254F37FF204A33FF1B4630FF18432DFF1A482EFF173827FFD1E3DBFF5B92
        6AFF87BB95FFA5C8B1FFA0C4AAFFA0C4AAFF9CBFA7FF99BCA3FF97BCA3FF96BB
        A2FF91B69DFF8FB59CFF8EB59BFF93BB9FFF659D7BFF19492FFFD2E5DCFF598B
        68FFB6D5BFFFFFFFFEFFF3FBF2FFF0F9EEFFEEF9EDFFECF7EBFFE9F5E8FFECF6
        EBFFF1FDF1FFF0FDEFFFEEFCEBFFF7FFF4FF94BBA1FF18432CFFD3E5DCFF6090
        6EFFB1D3B8FFF5FFF4FFEBF5EBFFE9F4E9FFE5F3E5FFE3F2E4FFE2F3E4FFBFDD
        C1FF8EAE92FF8BA792FF8EA693FF9CAF9DFF86AE93FF1D4832FFD3E5DDFF6A98
        78FFADD4B5FF719075FF436B4CFF496E52FF4D6D54FF507157FF406E48FF4180
        48FF347742FF18582CFF185128FF436549FF85AC92FF244D37FFD5E6DCFF719B
        7EFFBADBC1FF8CB893FF3F894FFF529C63FF559661FF347940FF287232FF68B3
        71FF53A461FF2F8943FF1D722CFFB1DCB5FF9CBEA7FF244F37FFD4E6DCFF769F
        82FFC1DAC7FFF9FFF9FF99C69DFF6AB273FF4FA156FF37883DFF78BF7FFF63AF
        68FF45964EFF1E7029FF1A6025FFA3C4A7FFA3C5ACFF29553BFFD5E7DDFF7FA8
        8AFFC5DBCAFFFFFFFFFFF4FFF4FF86B989FF34823AFF7EC484FF6BB470FF539E
        56FF4E9353FF84B289FF98B89EFFC4D8C5FF9EC1A9FF2A553CFFD5E8DDFF84AC
        90FFC7DCCCFFFFFFFFFFE6F6E8FF8EBC93FF8AC68FFF77BC7FFF5EA764FF4E91
        52FF448247FFCAEACCFFF5FFF7FFF0FBEFFF98BBA4FF315E44FFD7E8DEFF8AAF
        94FFCCE0D1FFEEF8EFFF95C09AFF90C898FF87C68FFF69AE6FFF57985CFF6AAF
        70FF54985AFF49814AFFC5E0C6FFF5FEF5FF9CC1A7FF346347FFD8E9DEFF94BA
        9EFFC4DECAFFA8CAADFF97CC9FFF8BCB96FF74B77EFF7BAE7FFF89B28AFF6FAF
        74FF73BB7BFF4F9453FF477E47FFCAE3C9FFA4C9AFFF346549FFD7E9DFFF98BF
        A2FFBFDAC6FFA7C4ABFF95C19BFF86B58CFF88B08DFFD7EAD8FFEFFCEFFF9CBE
        9FFF7CAB80FF7CAB81FF58845AFFAAC2A9FFABCDB6FF38684CFFD8EADFFF99BE
        A2FFD3E5D8FFFFFFFFFFF3FFF5FFF3FFF4FFF9FFF9FFFFFFFFFFFFFFFEFFF9FF
        FAFFEEFDEFFFEBFCEEFFECFBEFFFFBFFFAFFA5C8B1FF396A4DFFD9E9E0FFA3C5
        ACFFBAD2C0FFD8E3DAFFD4E3D7FFD2E4D6FFCDE0D1FFC7DCCCFFC5DCCAFFC0D9
        C6FFBED9C5FFBBD8C2FFB7D5BEFFB7D6BFFF87BB95FF3F7450FFDDEAE2FF9FBB
        A7FFA3C5ABFF9ABEA2FF97BB9FFF93B89CFF8BB095FF86AC8FFF81A98BFF77A0
        82FF6F9A7CFF689674FF62916FFF598B69FF5B9269FF4C7658FFF8FDF9FFDDEA
        E2FFD9EADFFFD9EADFFFD9E9DFFFD8E9DEFFD8E9DCFFD8E8DEFFD7E8DFFFD4E7
        DDFFD6E6DDFFD5E5DCFFD5E5DCFFD3E5DCFFD1E3DBFFDAE6E0FF}
      OnClick = sbExportarClick
    end
    object sbExportarDetalle: TSpeedButton
      Left = 753
      Top = 20
      Width = 116
      Height = 24
      Caption = 'Exportar detalle'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000C40E0000C40E00000000000000000000D8E6E0FF4C77
        57FF3F7450FF396B4EFF38684CFF356549FF336246FF315E42FF2A553DFF2954
        3BFF254F37FF204A33FF1B4630FF18432DFF1A482EFF173827FFD1E3DBFF5B92
        6AFF87BB95FFA5C8B1FFA0C4AAFFA0C4AAFF9CBFA7FF99BCA3FF97BCA3FF96BB
        A2FF91B69DFF8FB59CFF8EB59BFF93BB9FFF659D7BFF19492FFFD2E5DCFF598B
        68FFB6D5BFFFFFFFFEFFF3FBF2FFF0F9EEFFEEF9EDFFECF7EBFFE9F5E8FFECF6
        EBFFF1FDF1FFF0FDEFFFEEFCEBFFF7FFF4FF94BBA1FF18432CFFD3E5DCFF6090
        6EFFB1D3B8FFF5FFF4FFEBF5EBFFE9F4E9FFE5F3E5FFE3F2E4FFE2F3E4FFBFDD
        C1FF8EAE92FF8BA792FF8EA693FF9CAF9DFF86AE93FF1D4832FFD3E5DDFF6A98
        78FFADD4B5FF719075FF436B4CFF496E52FF4D6D54FF507157FF406E48FF4180
        48FF347742FF18582CFF185128FF436549FF85AC92FF244D37FFD5E6DCFF719B
        7EFFBADBC1FF8CB893FF3F894FFF529C63FF559661FF347940FF287232FF68B3
        71FF53A461FF2F8943FF1D722CFFB1DCB5FF9CBEA7FF244F37FFD4E6DCFF769F
        82FFC1DAC7FFF9FFF9FF99C69DFF6AB273FF4FA156FF37883DFF78BF7FFF63AF
        68FF45964EFF1E7029FF1A6025FFA3C4A7FFA3C5ACFF29553BFFD5E7DDFF7FA8
        8AFFC5DBCAFFFFFFFFFFF4FFF4FF86B989FF34823AFF7EC484FF6BB470FF539E
        56FF4E9353FF84B289FF98B89EFFC4D8C5FF9EC1A9FF2A553CFFD5E8DDFF84AC
        90FFC7DCCCFFFFFFFFFFE6F6E8FF8EBC93FF8AC68FFF77BC7FFF5EA764FF4E91
        52FF448247FFCAEACCFFF5FFF7FFF0FBEFFF98BBA4FF315E44FFD7E8DEFF8AAF
        94FFCCE0D1FFEEF8EFFF95C09AFF90C898FF87C68FFF69AE6FFF57985CFF6AAF
        70FF54985AFF49814AFFC5E0C6FFF5FEF5FF9CC1A7FF346347FFD8E9DEFF94BA
        9EFFC4DECAFFA8CAADFF97CC9FFF8BCB96FF74B77EFF7BAE7FFF89B28AFF6FAF
        74FF73BB7BFF4F9453FF477E47FFCAE3C9FFA4C9AFFF346549FFD7E9DFFF98BF
        A2FFBFDAC6FFA7C4ABFF95C19BFF86B58CFF88B08DFFD7EAD8FFEFFCEFFF9CBE
        9FFF7CAB80FF7CAB81FF58845AFFAAC2A9FFABCDB6FF38684CFFD8EADFFF99BE
        A2FFD3E5D8FFFFFFFFFFF3FFF5FFF3FFF4FFF9FFF9FFFFFFFFFFFFFFFEFFF9FF
        FAFFEEFDEFFFEBFCEEFFECFBEFFFFBFFFAFFA5C8B1FF396A4DFFD9E9E0FFA3C5
        ACFFBAD2C0FFD8E3DAFFD4E3D7FFD2E4D6FFCDE0D1FFC7DCCCFFC5DCCAFFC0D9
        C6FFBED9C5FFBBD8C2FFB7D5BEFFB7D6BFFF87BB95FF3F7450FFDDEAE2FF9FBB
        A7FFA3C5ABFF9ABEA2FF97BB9FFF93B89CFF8BB095FF86AC8FFF81A98BFF77A0
        82FF6F9A7CFF689674FF62916FFF598B69FF5B9269FF4C7658FFF8FDF9FFDDEA
        E2FFD9EADFFFD9EADFFFD9E9DFFFD8E9DEFFD8E9DCFFD8E8DEFFD7E8DFFFD4E7
        DDFFD6E6DDFFD5E5DCFFD5E5DCFFD3E5DCFFD1E3DBFFDAE6E0FF}
      OnClick = sbExportarDetalleClick
    end
    object dpFecha: TDateTimePicker
      Left = 0
      Top = 20
      Width = 121
      Height = 21
      CalAlignment = dtaLeft
      Date = 41008.5208209375
      Time = 41008.5208209375
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object btBusca: TBitBtn
      Left = 465
      Top = 20
      Width = 116
      Height = 24
      Caption = 'Inicia Busqueda'
      TabOrder = 1
      OnClick = btBuscaClick
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
    object cbCartasCredito: TCheckBox
      Left = 160
      Top = 16
      Width = 137
      Height = 17
      Caption = 'Incluir Cartas de Crédito'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object cbInteresesAnticipados: TCheckBox
      Left = 160
      Top = 40
      Width = 217
      Height = 17
      Caption = 'Incluir Intereses Cobrados por Anticipado'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object SGReservas: TSGCtrl
    Left = 0
    Top = 65
    Width = 961
    Height = 360
    OnCalcRow = SGReservasCalcRow
    ShowTab = True
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
    OnBtnAyudaClick = InterForma1BtnAyudaClick
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 154
    Top = 122
  end
  object SaveXLS: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Archivos de Excel *.xls|*.xls|Todos los archivos|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Exportar a Excel'
    Left = 192
    Top = 120
  end
  object QReservasCalif: TQuery
    SQL.Strings = (
      'SELECT GRUPO, Lab_Calific, G1,'
      
        '       Pct_4TYAnt_Estatal, Pct_4TYAnt_Municipal, Pct_4TYAnt_Org_' +
        'Desc, Pct_4TYAnt_Calific,'
      
        '       Pct_Act_Estatal,    Pct_Act_Municipal,    Pct_Act_Org_Des' +
        'c,    Pct_Act_Calific,'
      
        '       Pct_4TYAct_Estatal, Pct_4TYAct_Municipal, Pct_4TYAct_Org_' +
        'Desc, Pct_4TYAct_Calific'
      '  FROM (SELECT GRUPO,'
      '               --Cve_Calific,'
      '               CASE WHEN G1 = 0 THEN Cve_Calific'
      
        '                    ELSE CASE WHEN GRUPO IN ('#39'A'#39', '#39'B'#39') THEN '#39'Tot' +
        'al '#39' || GRUPO'
      
        '                              WHEN GRUPO IS NULL       THEN '#39'Exc' +
        #39' '
      
        '                              ELSE                          '#39'Tot' +
        'al Otros'#39
      '                    END'
      
        '               END                                              ' +
        ' Lab_Calific,'
      '               G1,'
      
        '               SUM (NVL (Pct_4TYAnt_Estatal,   0))              ' +
        ' Pct_4TYAnt_Estatal,'
      
        '               SUM (NVL (Pct_4TYAnt_Municipal, 0))              ' +
        ' Pct_4TYAnt_Municipal,'
      
        '               SUM (NVL (Pct_4TYAnt_Org_Desc,  0))              ' +
        ' Pct_4TYAnt_Org_Desc,'
      
        '               SUM (NVL (Pct_4TYAnt_Calific,   0))              ' +
        ' Pct_4TYAnt_Calific,'
      '               '
      
        '               SUM (NVL (Pct_Act_Estatal,      0))              ' +
        ' Pct_Act_Estatal,'
      
        '               SUM (NVL (Pct_Act_Municipal,    0))              ' +
        ' Pct_Act_Municipal,'
      
        '               SUM (NVL (Pct_Act_Org_Desc,     0))              ' +
        ' Pct_Act_Org_Desc,'
      
        '               SUM (NVL (Pct_Act_Calific,      0))              ' +
        ' Pct_Act_Calific,'
      '               '
      
        '               SUM (NVL (Pct_4TYAct_Estatal,   0))              ' +
        ' Pct_4TYAct_Estatal,'
      
        '               SUM (NVL (Pct_4TYAct_Municipal, 0))              ' +
        ' Pct_4TYAct_Municipal, '
      
        '               SUM (NVL (Pct_4TYAct_Org_Desc,  0))              ' +
        ' Pct_4TYAct_Org_Desc, '
      
        '               SUM (NVL (Pct_4TYAct_Calific,   0))              ' +
        ' Pct_4TYAct_Calific'
      '          FROM ('
      '                SELECT GRUPO,'
      '                       Cve_Calific,'
      '                       CASE WHEN Imp_Total = 0 THEN 0'
      
        '                            ELSE ROUND (NVL (SUM (Imp_Estatal), ' +
        '  0) / Imp_Total * 100, 2)'
      
        '                        END                                     ' +
        '                           Pct_4TYAnt_Estatal,'
      '                       CASE WHEN Imp_Total = 0 THEN 0'
      
        '                            ELSE ROUND (NVL (SUM (Imp_Municipal)' +
        ', 0) / Imp_Total * 100, 2)'
      
        '                        END                                     ' +
        '                           Pct_4TYAnt_Municipal,'
      '                       CASE WHEN Imp_Total = 0 THEN 0'
      
        '                            ELSE ROUND (NVL (SUM (Imp_Org_Desc),' +
        '  0) / Imp_Total * 100, 2)'
      
        '                        END                                     ' +
        '                           Pct_4TYAnt_Org_Desc,'
      '                       CASE WHEN Imp_Total = 0 THEN 0'
      
        '                            ELSE ROUND (NVL (SUM (Imp_Calific), ' +
        '  0) / Imp_Total * 100, 2)'
      
        '                        END                                     ' +
        '                           Pct_4TYAnt_Calific,'
      '                       '
      
        '                       0                                        ' +
        '                           Pct_Act_Estatal,'
      
        '                       0                                        ' +
        '                           Pct_Act_Municipal,'
      
        '                       0                                        ' +
        '                           Pct_Act_Org_Desc,'
      
        '                       0                                        ' +
        '                           Pct_Act_Calific,'
      '                       '
      
        '                       0                                        ' +
        '                           Pct_4TYAct_Estatal,'
      
        '                       0                                        ' +
        '                           Pct_4TYAct_Municipal,'
      
        '                       0                                        ' +
        '                           Pct_4TYAct_Org_Desc,'
      
        '                       0                                        ' +
        '                           Pct_4TYAct_Calific,'
      
        '                       GROUPING (GRUPO) + GROUPING (Cve_Calific)' +
        '                           G1'
      '                  FROM ('
      
        '                        SELECT NVL (Sdo.TIPO_ENTIDAD, Cal.TIPO_E' +
        'NTIDAD)                                                         ' +
        '       TIPO_ENTIDAD,'
      '                               Cal.GRUPO,'
      
        '                               NVL (Sdo.Cve_Calific, Cal.Cve_Cal' +
        'ific)                                                           ' +
        '       Cve_Calific, '
      
        '                               CASE WHEN NVL (Sdo.TIPO_ENTIDAD, ' +
        'Cal.TIPO_ENTIDAD) = '#39'ESTATAL'#39'   THEN NVL (Sdo.Imp_Real, 0) ELSE ' +
        '0 END  Imp_Estatal,                     '
      
        '                               CASE WHEN NVL (Sdo.TIPO_ENTIDAD, ' +
        'Cal.TIPO_ENTIDAD) = '#39'MUNICIPAL'#39' THEN NVL (Sdo.Imp_Real, 0) ELSE ' +
        '0 END  Imp_Municipal,                     '
      
        '                               CASE WHEN NVL (Sdo.TIPO_ENTIDAD, ' +
        'Cal.TIPO_ENTIDAD) = '#39'ORG-DESC'#39'  THEN NVL (Sdo.Imp_Real, 0) ELSE ' +
        '0 END  Imp_Org_Desc,                     '
      
        '                               NVL (Sdo.Imp_Real, 0)            ' +
        '                                                                ' +
        '       Imp_Calific,'
      
        '                               ROUND (SUM (NVL (Sdo.Imp_Real, 0)' +
        ') OVER (), 2)                                                   ' +
        '       Imp_Total'
      
        '                          FROM (SELECT TIPO_ENTIDAD,            ' +
        '                     '
      '                                       ('
      
        '                                        (Nvl (Imp_Cap_Vig, 0)   ' +
        '  + '
      
        '                                         Nvl (Imp_Cap_Imp, 0)   ' +
        '  + '
      
        '                                         Nvl (Imp_Cap_Vdo_Ex, 0)' +
        '  + '
      
        '                                         Nvl (Imp_Cap_Vdo_NE, 0)' +
        '  +'
      
        '                                         Nvl (Imp_Int_Vig, 0)   ' +
        '  + '
      
        '                                         Nvl (Imp_Int_Imp, 0)   ' +
        '  + '
      
        '                                         Nvl (Imp_Int_Vdo_Ex, 0)' +
        '  + '
      
        '                                         Nvl (Imp_Int_Vdo_NE, 0)' +
        ') - '
      
        '                                         Case :peInt_Cob_Ant Whe' +
        'n '#39'V'#39' Then Nvl (Imp_Int_Cob_Ant, 0) Else 0 End'
      
        '                                       ) * Pkgcrconsolidado1.Fnc' +
        '_Obt_Tipo_Cambio_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '                        '#39'D000'#39', '
      
        '                                                                ' +
        '                        TO_CHAR (:peFecha, '#39'YYYY'#39') - 1, '
      
        '                                                                ' +
        '                        12'
      
        '                                                                ' +
        '                        )                                  Imp_R' +
        'eal,'
      
        '                                       NVL (CASE WHEN NVL (Cve_C' +
        'alific_Exp, '#39'NA'#39') <> '#39'NA'#39' THEN Cve_Calific_Exp'
      
        '                                                 ELSE Cve_Califi' +
        'c_Cub'
      
        '                                            END, '#39'Exc'#39')         ' +
        '                                                     Cve_Calific' +
        '    '
      
        '                                   FROM TABLE (Pkgcrgpviews.VW_C' +
        'R_GP_Saldos_PI_Edos_Mun (TRUNC (:peFecha, '#39'yyyy'#39') - 1, '#39'ESTATAL|' +
        'MUNICIPAL|ORG-DESC'#39'))'
      '                                  WHERE :peCartas_Cred = '#39'V'#39
      '                                     OR Tipo_Credito = '#39'CRED'#39' '
      '                               ) Sdo    '
      
        '                          FULL OUTER JOIN (SELECT Ent.TIPO_ENTID' +
        'AD, '
      
        '                                                  R.Calificacion' +
        '                                                Cve_Calific, '
      
        '                                                  CASE WHEN SUBS' +
        'TR (R.Calificacion, 1, 1) IN ('#39'A'#39', '#39'B'#39') THEN '
      
        '                                                          SUBSTR' +
        ' (R.Calificacion, 1, 1) '
      
        '                                                       ELSE '#39'Res' +
        'tante'#39
      
        '                                                  END           ' +
        '                                                GRUPO           ' +
        '                                '
      '                                            FROM CR_GP_RESERVA R'
      
        '                                            CROSS JOIN (SELECT '#39 +
        'ESTATAL'#39'   TIPO_ENTIDAD FROM Dual UNION'
      
        '                                                        SELECT '#39 +
        'MUNICIPAL'#39' TIPO_ENTIDAD FROM Dual UNION'
      
        '                                                        SELECT '#39 +
        'ORG-DESC'#39'  TIPO_ENTIDAD FROM Dual '
      '                                                       ) Ent'
      
        '                                           WHERE R.TIPO_ENTIDAD ' +
        '= '#39'ESTATAL'#39' '
      
        '                                          ) Cal ON Sdo.TIPO_ENTI' +
        'DAD = Cal.TIPO_ENTIDAD AND'
      
        '                                                   Sdo.Cve_Calif' +
        'ic  = Cal.Cve_Calific'
      '                       )'
      '                 GROUP BY ROLLUP (Imp_Total, GRUPO, Cve_Calific)'
      
        '                 HAVING GROUPING (GRUPO) + GROUPING (Cve_Calific' +
        ') IN (0, 1)'
      '                 UNION ALL        '
      '                SELECT GRUPO,'
      '                       Cve_Calific,'
      
        '                       0                                        ' +
        '                           Pct_4TYAnt_Estatal,'
      
        '                       0                                        ' +
        '                           Pct_4TYAnt_Municipal,'
      
        '                       0                                        ' +
        '                           Pct_4TYAnt_Org_Desc,'
      
        '                       0                                        ' +
        '                           Pct_4TYAnt_Calific,'
      '                       '
      '                       CASE WHEN Imp_Total = 0 THEN 0'
      
        '                            ELSE ROUND (NVL (SUM (Imp_Estatal), ' +
        '  0) / Imp_Total * 100, 2)'
      
        '                        END                                     ' +
        '                           Pct_Act_Estatal,'
      '                       CASE WHEN Imp_Total = 0 THEN 0'
      
        '                            ELSE ROUND (NVL (SUM (Imp_Municipal)' +
        ', 0) / Imp_Total * 100, 2)'
      
        '                        END                                     ' +
        '                           Pct_Act_Municipal,'
      '                       CASE WHEN Imp_Total = 0 THEN 0'
      
        '                            ELSE ROUND (NVL (SUM (Imp_Org_Desc),' +
        '  0) / Imp_Total * 100, 2)'
      
        '                        END                                     ' +
        '                           Pct_Act_Org_Desc,'
      '                       CASE WHEN Imp_Total = 0 THEN 0'
      
        '                            ELSE ROUND (NVL (SUM (Imp_Calific), ' +
        '  0) / Imp_Total * 100, 2)'
      
        '                        END                                     ' +
        '                           Pct_Act_Calific,'
      '                       '
      
        '                       0                                        ' +
        '                           Pct_4TYAct_Estatal,'
      
        '                       0                                        ' +
        '                           Pct_4TYAct_Municipal,'
      
        '                       0                                        ' +
        '                           Pct_4TYAct_Org_Desc,'
      
        '                       0                                        ' +
        '                           Pct_4TYAct_Calific,'
      
        '                       GROUPING (GRUPO) + GROUPING (Cve_Calific)' +
        '                           G1'
      '                  FROM ('
      
        '                        SELECT NVL (Sdo.TIPO_ENTIDAD, Cal.TIPO_E' +
        'NTIDAD)                                                         ' +
        '       TIPO_ENTIDAD,'
      '                               Cal.GRUPO,'
      
        '                               NVL (Sdo.Cve_Calific, Cal.Cve_Cal' +
        'ific)                                                           ' +
        '       Cve_Calific, '
      
        '                               CASE WHEN NVL (Sdo.TIPO_ENTIDAD, ' +
        'Cal.TIPO_ENTIDAD) = '#39'ESTATAL'#39'   THEN NVL (Sdo.Imp_Real, 0) ELSE ' +
        '0 END  Imp_Estatal,                     '
      
        '                               CASE WHEN NVL (Sdo.TIPO_ENTIDAD, ' +
        'Cal.TIPO_ENTIDAD) = '#39'MUNICIPAL'#39' THEN NVL (Sdo.Imp_Real, 0) ELSE ' +
        '0 END  Imp_Municipal,                     '
      
        '                               CASE WHEN NVL (Sdo.TIPO_ENTIDAD, ' +
        'Cal.TIPO_ENTIDAD) = '#39'ORG-DESC'#39'  THEN NVL (Sdo.Imp_Real, 0) ELSE ' +
        '0 END  Imp_Org_Desc,                     '
      
        '                               NVL (Sdo.Imp_Real, 0)            ' +
        '                                                                ' +
        '       Imp_Calific,'
      
        '                               ROUND (SUM (NVL (Sdo.Imp_Real, 0)' +
        ') OVER (), 2)                                                   ' +
        '       Imp_Total'
      
        '                          FROM (SELECT TIPO_ENTIDAD,            ' +
        '                     '
      '                                       ('
      
        '                                        (Nvl (Imp_Cap_Vig, 0)   ' +
        '  + '
      
        '                                         Nvl (Imp_Cap_Imp, 0)   ' +
        '  + '
      
        '                                         Nvl (Imp_Cap_Vdo_Ex, 0)' +
        '  + '
      
        '                                         Nvl (Imp_Cap_Vdo_NE, 0)' +
        '  +'
      
        '                                         Nvl (Imp_Int_Vig, 0)   ' +
        '  + '
      
        '                                         Nvl (Imp_Int_Imp, 0)   ' +
        '  + '
      
        '                                         Nvl (Imp_Int_Vdo_Ex, 0)' +
        '  + '
      
        '                                         Nvl (Imp_Int_Vdo_NE, 0)' +
        ') - '
      
        '                                         Case :peInt_Cob_Ant Whe' +
        'n '#39'V'#39' Then Nvl (Imp_Int_Cob_Ant, 0) Else 0 End'
      
        '                                       ) * Pkgcrconsolidado1.Fnc' +
        '_Obt_Tipo_Cambio_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '                        '#39'D000'#39', '
      
        '                                                                ' +
        '                        TO_CHAR (:peFecha, '#39'YYYY'#39'), '
      
        '                                                                ' +
        '                        TO_CHAR (:peFecha, '#39'MM'#39')'
      
        '                                                                ' +
        '                        )                                  Imp_R' +
        'eal,'
      
        '                                       NVL (CASE WHEN NVL (Cve_C' +
        'alific_Exp, '#39'NA'#39') <> '#39'NA'#39' THEN Cve_Calific_Exp'
      
        '                                                 ELSE Cve_Califi' +
        'c_Cub'
      
        '                                            END, '#39'Exc'#39')         ' +
        '                                                     Cve_Calific'
      
        '                                   FROM TABLE (Pkgcrgpviews.VW_C' +
        'R_GP_Saldos_PI_Edos_Mun (:peFecha, '#39'ESTATAL|MUNICIPAL|ORG-DESC'#39')' +
        ')'
      '                                  WHERE :peCartas_Cred = '#39'V'#39
      '                                     OR Tipo_Credito = '#39'CRED'#39' '
      '                               ) Sdo    '
      
        '                          FULL OUTER JOIN (SELECT Ent.TIPO_ENTID' +
        'AD, '
      
        '                                                  R.Calificacion' +
        '                                                Cve_Calific, '
      
        '                                                  CASE WHEN SUBS' +
        'TR (R.Calificacion, 1, 1) IN ('#39'A'#39', '#39'B'#39') THEN '
      
        '                                                          SUBSTR' +
        ' (R.Calificacion, 1, 1) '
      
        '                                                       ELSE '#39'Res' +
        'tante'#39
      
        '                                                  END           ' +
        '                                                GRUPO           ' +
        '                                '
      '                                            FROM CR_GP_RESERVA R'
      
        '                                            CROSS JOIN (SELECT '#39 +
        'ESTATAL'#39'   TIPO_ENTIDAD FROM Dual UNION'
      
        '                                                        SELECT '#39 +
        'MUNICIPAL'#39' TIPO_ENTIDAD FROM Dual UNION'
      
        '                                                        SELECT '#39 +
        'ORG-DESC'#39'  TIPO_ENTIDAD FROM Dual '
      '                                                       ) Ent'
      
        '                                           WHERE R.TIPO_ENTIDAD ' +
        '= '#39'ESTATAL'#39' '
      
        '                                          ) Cal ON Sdo.TIPO_ENTI' +
        'DAD = Cal.TIPO_ENTIDAD AND'
      
        '                                                   Sdo.Cve_Calif' +
        'ic  = Cal.Cve_Calific'
      '                       )'
      '                 GROUP BY ROLLUP (Imp_Total, GRUPO, Cve_Calific)'
      
        '                 HAVING GROUPING (GRUPO) + GROUPING (Cve_Calific' +
        ') IN (0, 1)'
      '               )'
      '         GROUP BY GRUPO, Cve_Calific, G1'
      '         HAVING NOT (GRUPO IS NULL AND G1 = 0) '
      '         ORDER BY GRUPO NULLS LAST, Cve_Calific, G1'
      '       )'
      ' WHERE GRUPO IS NOT NULL '
      '    OR Pct_4TYAnt_Estatal   > 0'
      '    OR Pct_4TYAnt_Municipal > 0'
      '    OR Pct_4TYAnt_Org_Desc  > 0 '
      '    OR Pct_4TYAnt_Calific   > 0'
      '    '
      '    OR Pct_Act_Estatal      > 0 '
      '    OR Pct_Act_Municipal    > 0'
      '    OR Pct_Act_Org_Desc     > 0 '
      '    OR Pct_Act_Calific      > 0 '
      '    '
      '    OR Pct_4TYAct_Estatal   > 0  '
      '    OR Pct_4TYAct_Municipal > 0 '
      '    OR Pct_4TYAct_Org_Desc  > 0 '
      '    OR Pct_4TYAct_Calific   > 0')
    Left = 232
    Top = 121
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peInt_Cob_Ant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peCartas_Cred'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peInt_Cob_Ant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peCartas_Cred'
        ParamType = ptUnknown
      end>
    object QReservasCalifGrupo: TStringField
      FieldName = 'Grupo'
      Visible = False
    end
    object QReservasCalifLab_Calific: TStringField
      DisplayLabel = '  Calificación'
      DisplayWidth = 12
      FieldName = 'Lab_Calific'
    end
    object QReservasCalifG1: TFloatField
      FieldName = 'G1'
      Visible = False
    end
    object QReservasCalifPct_Act_Estatal: TFloatField
      DisplayWidth = 15
      FieldName = 'Pct_Act_Estatal'
      DisplayFormat = '###,###,###,###,###.00%'
    end
    object QReservasCalifPct_Act_Municipal: TFloatField
      DisplayWidth = 15
      FieldName = 'Pct_Act_Municipal'
      DisplayFormat = '###,###,###,###,###.00%'
    end
    object QReservasCalifPct_Act_Org_Desc: TFloatField
      DisplayWidth = 15
      FieldName = 'Pct_Act_Org_Desc'
      DisplayFormat = '###,###,###,###,###.00%'
    end
    object QReservasCalifPct_Act_Calific: TFloatField
      DisplayWidth = 15
      FieldName = 'Pct_Act_Calific'
      DisplayFormat = '###,###,###,###,###.00%'
    end
    object QReservasCalifPct_4TYAnt_Estatal: TFloatField
      DisplayWidth = 15
      FieldName = 'Pct_4TYAnt_Estatal'
      DisplayFormat = '###,###,###,###,###.00%'
    end
    object QReservasCalifPct_4TYAnt_Municipal: TFloatField
      DisplayWidth = 15
      FieldName = 'Pct_4TYAnt_Municipal'
      DisplayFormat = '###,###,###,###,###.00%'
    end
    object QReservasCalifPct_4TYAnt_Org_Desc: TFloatField
      DisplayWidth = 15
      FieldName = 'Pct_4TYAnt_Org_Desc'
      DisplayFormat = '###,###,###,###,###.00%'
    end
    object QReservasCalifPct_4TYAnt_Calific: TFloatField
      DisplayWidth = 15
      FieldName = 'Pct_4TYAnt_Calific'
      DisplayFormat = '###,###,###,###,###.00%'
    end
    object QReservasCalifPct_4TYAct_Estatal: TFloatField
      DisplayWidth = 15
      FieldName = 'Pct_4TYAct_Estatal'
      DisplayFormat = '###,###,###,###,###.00%'
    end
    object QReservasCalifPct_4TYAct_Municipal: TFloatField
      DisplayWidth = 15
      FieldName = 'Pct_4TYAct_Municipal'
      DisplayFormat = '###,###,###,###,###.00%'
    end
    object QReservasCalifPct_4TYAct_Org_Desc: TFloatField
      DisplayWidth = 15
      FieldName = 'Pct_4TYAct_Org_Desc'
      DisplayFormat = '###,###,###,###,###.00%'
    end
    object QReservasCalifPct_4TYAct_Calific: TFloatField
      DisplayWidth = 15
      FieldName = 'Pct_4TYAct_Calific'
      DisplayFormat = '###,###,###,###,###.00%'
    end
  end
  object QDetalle: TQuery
    SQL.Strings = (
      'SELECT Tiempo,'
      '       Nvl (GRUPO, '#39'Exc'#39') Grupo,'
      '       Cve_Calific,'
      '       Tipo_Entidad,'
      '       Info.Cve_Mercado,'
      '       CRM.Desc_Mercado,'
      '       ID_Acreditado,'
      '       Nom_Acred_Reg,'
      '       ID_Contrato,'
      '       ID_Credito,'
      '       Tipo_Credito,'
      '       Imp_4TYAnt_Calific,'
      '       Pct_4TYAnt_Calific,'
      '       Imp_Act_Calific,'
      '       Pct_Act_Calific,'
      '       Imp_4TYAct_Calific,'
      '       Pct_4TYAct_Calific'
      '  FROM ('
      
        '        SELECT 1                                                ' +
        '      Tiempo,'
      '               GRUPO,'
      '               Cve_Calific,'
      '               Tipo_Entidad,'
      '               Cve_Mercado,'
      '               ID_Acreditado,'
      '               Nom_Acred_Reg,'
      '               ID_Contrato,'
      '               ID_Credito,'
      '               Tipo_Credito,'
      
        '               Sum (Imp_Calific)                                ' +
        '      Imp_4TYAnt_Calific,'
      '               CASE WHEN Imp_Total = 0 THEN 0'
      
        '                    ELSE NVL (SUM (Imp_Calific),   0) / Imp_Tota' +
        'l'
      
        '                END                                             ' +
        '      Pct_4TYAnt_Calific,'
      
        '               0                                                ' +
        '      Imp_Act_Calific,'
      
        '               0                                                ' +
        '      Pct_Act_Calific,'
      
        '               0                                                ' +
        '      Imp_4TYAct_Calific,'
      
        '               0                                                ' +
        '      Pct_4TYAct_Calific'
      '          FROM ('
      
        '                SELECT NVL (Sdo.TIPO_ENTIDAD, Cal.TIPO_ENTIDAD) ' +
        '                                                               T' +
        'IPO_ENTIDAD,'
      '                       Cal.GRUPO,'
      
        '                       NVL (Sdo.Cve_Calific, Cal.Cve_Calific)   ' +
        '                                                               C' +
        've_Calific,'
      '                       Cve_Mercado,'
      '                       ID_Acreditado,'
      '                       Nom_Acred_Reg,'
      '                       ID_Contrato,'
      '                       ID_Credito,'
      '                       Tipo_Credito,                     '
      
        '                       NVL (Sdo.Imp_Real, 0)                    ' +
        '                                                               I' +
        'mp_Calific,'
      
        '                       ROUND (SUM (NVL (Sdo.Imp_Real, 0)) OVER (' +
        '), 2)                                                          I' +
        'mp_Total'
      '                  FROM (SELECT TIPO_ENTIDAD,'
      '                               Cve_Mercado,'
      '                               ID_Acreditado,'
      '                               Nom_Acred_Reg,'
      '                               ID_Contrato,'
      '                               ID_Credito,'
      
        '                               Tipo_Credito,                    ' +
        '            '
      '                               ('
      '                                (Nvl (Imp_Cap_Vig, 0)     + '
      '                                 Nvl (Imp_Cap_Imp, 0)     + '
      '                                 Nvl (Imp_Cap_Vdo_Ex, 0)  + '
      '                                 Nvl (Imp_Cap_Vdo_NE, 0)  +'
      '                                 Nvl (Imp_Int_Vig, 0)     + '
      '                                 Nvl (Imp_Int_Imp, 0)     + '
      '                                 Nvl (Imp_Int_Vdo_Ex, 0)  + '
      '                                 Nvl (Imp_Int_Vdo_NE, 0)) - '
      
        '                                 Case :peInt_Cob_Ant When '#39'V'#39' Th' +
        'en Nvl (Imp_Int_Cob_Ant, 0) Else 0 End'
      
        '                               ) * Pkgcrconsolidado1.Fnc_Obt_Tip' +
        'o_Cambio_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '                '#39'D000'#39', '
      
        '                                                                ' +
        '                TO_CHAR (:peFecha, '#39'YYYY'#39') - 1, '
      
        '                                                                ' +
        '                12'
      
        '                                                                ' +
        '                )                                  Imp_Real,'
      
        '                               NVL (CASE WHEN NVL (Cve_Calific_E' +
        'xp, '#39'NA'#39') <> '#39'NA'#39' THEN Cve_Calific_Exp'
      '                                         ELSE Cve_Calific_Cub'
      
        '                                    END, '#39'Exc'#39')                 ' +
        '                                             Cve_Calific    '
      
        '                          FROM TABLE (Pkgcrgpviews.VW_CR_GP_Sald' +
        'os_PI_Edos_Mun (TRUNC (:peFecha, '#39'yyyy'#39') - 1, '#39'ESTATAL|MUNICIPAL' +
        '|ORG-DESC'#39'))'
      '                         WHERE :peCartas_Cred = '#39'V'#39
      '                            OR Tipo_Credito   = '#39'CRED'#39' '
      '                       ) Sdo    '
      '                    FULL OUTER JOIN (SELECT Ent.TIPO_ENTIDAD, '
      
        '                                            R.Calificacion      ' +
        '                                          Cve_Calific, '
      
        '                                            CASE WHEN SUBSTR (R.' +
        'Calificacion, 1, 1) IN ('#39'A'#39', '#39'B'#39') THEN '
      
        '                                                      SUBSTR (R.' +
        'Calificacion, 1, 1) '
      '                                                 ELSE '#39'Restante'#39
      
        '                                             END                ' +
        '                                           GRUPO                ' +
        '                           '
      '                                       FROM CR_GP_RESERVA R'
      
        '                                      CROSS JOIN (SELECT '#39'ESTATA' +
        'L'#39'   TIPO_ENTIDAD FROM Dual UNION'
      
        '                                                  SELECT '#39'MUNICI' +
        'PAL'#39' TIPO_ENTIDAD FROM Dual UNION'
      
        '                                                  SELECT '#39'ORG-DE' +
        'SC'#39'  TIPO_ENTIDAD FROM Dual '
      '                                                 ) Ent'
      
        '                                      WHERE R.TIPO_ENTIDAD = '#39'ES' +
        'TATAL'#39' '
      
        '                                    ) Cal ON Sdo.TIPO_ENTIDAD = ' +
        'Cal.TIPO_ENTIDAD AND'
      
        '                                             Sdo.Cve_Calific  = ' +
        'Cal.Cve_Calific'
      '                               )'
      
        '         GROUP BY GRUPO, Cve_Calific, Tipo_Entidad, Cve_Mercado,' +
        ' ID_Acreditado, Nom_Acred_Reg, ID_Contrato, ID_Credito, Tipo_Cre' +
        'dito, Imp_Total'
      '        HAVING Nvl (Sum (Imp_Calific), 0) <> 0'
      '                        '
      '         UNION ALL  '
      '              '
      
        '        SELECT 2                                                ' +
        '                   Tiempo,'
      '               GRUPO,'
      '               Cve_Calific,'
      '               Tipo_Entidad,'
      '               Cve_Mercado,'
      '               ID_Acreditado,'
      '               Nom_Acred_Reg,'
      '               ID_Contrato,'
      '               ID_Credito,'
      '               Tipo_Credito,'
      
        '               0                                                ' +
        '                   Imp_4TYAnt_Calific,'
      
        '               0                                                ' +
        '                   Pct_4TYAnt_Calific,'
      
        '               Sum (Imp_Calific)                                ' +
        '                   Imp_Act_Calific,'
      '               CASE WHEN Imp_Total = 0 THEN 0'
      
        '                    ELSE NVL (SUM (Imp_Calific),   0) / Imp_Tota' +
        'l'
      
        '                END                                             ' +
        '                   Pct_Act_Calific,'
      
        '               0                                                ' +
        '                   Imp_4TYAct_Calific,'
      
        '               0                                                ' +
        '                   Pct_4TYAct_Calific'
      '          FROM ('
      
        '                SELECT NVL (Sdo.TIPO_ENTIDAD, Cal.TIPO_ENTIDAD) ' +
        '                                                               T' +
        'IPO_ENTIDAD,'
      '                       Cal.GRUPO,'
      
        '                       NVL (Sdo.Cve_Calific, Cal.Cve_Calific)   ' +
        '                                                               C' +
        've_Calific,'
      '                       Cve_Mercado,'
      '                       ID_Acreditado,'
      '                       Nom_Acred_Reg,'
      '                       ID_Contrato,'
      '                       ID_Credito,'
      '                       Tipo_Credito,                     '
      
        '                       NVL (Sdo.Imp_Real, 0)                    ' +
        '                                                               I' +
        'mp_Calific,'
      
        '                       ROUND (SUM (NVL (Sdo.Imp_Real, 0)) OVER (' +
        '), 2)                                                          I' +
        'mp_Total'
      '                  FROM ('
      '                        SELECT TIPO_ENTIDAD,'
      '                               Cve_Mercado,'
      '                               ID_Acreditado,'
      '                               Nom_Acred_Reg,'
      '                               ID_Contrato,'
      '                               ID_Credito,'
      
        '                               Tipo_Credito,                    ' +
        '             '
      '                               ('
      '                                (Nvl (Imp_Cap_Vig, 0)     + '
      '                                 Nvl (Imp_Cap_Imp, 0)     + '
      '                                 Nvl (Imp_Cap_Vdo_Ex, 0)  + '
      '                                 Nvl (Imp_Cap_Vdo_NE, 0)  +'
      '                                 Nvl (Imp_Int_Vig, 0)     + '
      '                                 Nvl (Imp_Int_Imp, 0)     + '
      '                                 Nvl (Imp_Int_Vdo_Ex, 0)  + '
      '                                 Nvl (Imp_Int_Vdo_NE, 0)) - '
      
        '                                 Case :peInt_Cob_Ant When '#39'V'#39' Th' +
        'en Nvl (Imp_Int_Cob_Ant, 0) Else 0 End'
      
        '                               ) * Pkgcrconsolidado1.Fnc_Obt_Tip' +
        'o_Cambio_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '                '#39'D000'#39', '
      
        '                                                                ' +
        '                TO_CHAR (:peFecha, '#39'YYYY'#39'), '
      
        '                                                                ' +
        '                TO_CHAR (:peFecha, '#39'MM'#39')'
      
        '                                                                ' +
        '                )                                  Imp_Real,'
      
        '                               NVL (CASE WHEN NVL (Cve_Calific_E' +
        'xp, '#39'NA'#39') <> '#39'NA'#39' THEN Cve_Calific_Exp'
      '                                         ELSE Cve_Calific_Cub'
      
        '                                    END, '#39'Exc'#39')                 ' +
        '                                             Cve_Calific'
      
        '                          FROM TABLE (Pkgcrgpviews.VW_CR_GP_Sald' +
        'os_PI_Edos_Mun (:peFecha, '#39'ESTATAL|MUNICIPAL|ORG-DESC'#39'))'
      '                         WHERE :peCartas_Cred = '#39'V'#39
      '                            OR Tipo_Credito = '#39'CRED'#39' '
      '                       ) Sdo    '
      '                    FULL OUTER JOIN (SELECT Ent.TIPO_ENTIDAD, '
      
        '                                            R.Calificacion      ' +
        '                                          Cve_Calific, '
      
        '                                            CASE WHEN SUBSTR (R.' +
        'Calificacion, 1, 1) IN ('#39'A'#39', '#39'B'#39') THEN '
      
        '                                                      SUBSTR (R.' +
        'Calificacion, 1, 1) '
      '                                                 ELSE '#39'Restante'#39
      
        '                                             END                ' +
        '                                           GRUPO                ' +
        '                           '
      '                                       FROM CR_GP_RESERVA R'
      
        '                                      CROSS JOIN (SELECT '#39'ESTATA' +
        'L'#39'   TIPO_ENTIDAD FROM Dual UNION'
      
        '                                                  SELECT '#39'MUNICI' +
        'PAL'#39' TIPO_ENTIDAD FROM Dual UNION'
      
        '                                                  SELECT '#39'ORG-DE' +
        'SC'#39'  TIPO_ENTIDAD FROM Dual '
      '                                                 ) Ent'
      
        '                                      WHERE R.TIPO_ENTIDAD = '#39'ES' +
        'TATAL'#39' '
      
        '                                    ) Cal ON Sdo.TIPO_ENTIDAD = ' +
        'Cal.TIPO_ENTIDAD AND'
      
        '                                             Sdo.Cve_Calific  = ' +
        'Cal.Cve_Calific'
      '               )'
      
        '         GROUP BY GRUPO, Cve_Calific, Tipo_Entidad, Cve_Mercado,' +
        ' ID_Acreditado, Nom_Acred_Reg, ID_Contrato, ID_Credito, Tipo_Cre' +
        'dito, Imp_Total'
      '        HAVING Nvl (Sum (Imp_Calific), 0) <> 0'
      '       ) Info'
      
        '  LEFT OUTER JOIN CR_MERCADO_OBJ CRM ON Info.Cve_Mercado = CRM.C' +
        've_Mercado'
      
        ' ORDER BY Grupo, Cve_Calific, Tipo_Entidad, Info.Cve_Mercado, CR' +
        'M.Desc_Mercado, ID_Acreditado, Nom_Acred_Reg, ID_Contrato, ID_Cr' +
        'edito, Tipo_Credito')
    Left = 272
    Top = 121
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peInt_Cob_Ant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peCartas_Cred'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peInt_Cob_Ant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peCartas_Cred'
        ParamType = ptUnknown
      end>
  end
end
