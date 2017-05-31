object WCrCompInfra: TWCrCompInfra
  Left = 235
  Top = 227
  Width = 885
  Height = 396
  Caption = 
    'Comparativo por Segmentación de Cartera de Infraestructura y Con' +
    'strucción'
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
    Left = 0
    Top = 0
    Width = 873
    Height = 129
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 30
      Height = 13
      Caption = 'Fecha'
      FocusControl = dpFecha
    end
    object sbExportar: TSpeedButton
      Left = 753
      Top = 45
      Width = 116
      Height = 28
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
      Top = 86
      Width = 116
      Height = 28
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
      Left = 8
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
    object rgFactorMoneda: TRadioGroup
      Left = 138
      Top = 8
      Width = 447
      Height = 41
      Caption = ' Información expresada en: '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Millones de pesos'
        'Miles de pesos'
        'Pesos')
      TabOrder = 1
    end
    object btBusca: TBitBtn
      Left = 753
      Top = 4
      Width = 116
      Height = 28
      Caption = 'Inicia Busqueda'
      TabOrder = 2
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
    object GroupBox1: TGroupBox
      Left = 5
      Top = 48
      Width = 580
      Height = 41
      Caption = ' Incluir información de '
      TabOrder = 3
      object cbEstados: TCheckBox
        Left = 96
        Top = 16
        Width = 65
        Height = 17
        Caption = '&Estados'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object cbMunicipios: TCheckBox
        Left = 184
        Top = 16
        Width = 75
        Height = 17
        Caption = '&Municipios'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object cbOrgDesc: TCheckBox
        Left = 288
        Top = 16
        Width = 150
        Height = 17
        Caption = '&Organos Descentralizados'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object cbPrivado: TCheckBox
        Left = 472
        Top = 16
        Width = 97
        Height = 17
        Caption = 'Sector Privado'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object cbFederal: TCheckBox
        Left = 8
        Top = 16
        Width = 62
        Height = 17
        Caption = '&Federal'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
    object cbCartasCredito: TCheckBox
      Left = 16
      Top = 104
      Width = 137
      Height = 17
      Caption = 'Incluir Cartas de Crédito'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object cbInteresesAnticipados: TCheckBox
      Left = 168
      Top = 104
      Width = 217
      Height = 17
      Caption = 'Incluir Intereses Cobrados por Anticipado'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
  end
  object SGCompInfra: TSGCtrl
    Left = 0
    Top = 128
    Width = 873
    Height = 233
    OnCalcRow = SGCompInfraCalcRow
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
    Left = 10
    Top = 18
  end
  object QLeyendaEntidades: TQuery
    SQL.Strings = (
      
        'Select '#39'Incluye información: '#39' || InitCap (Replace (Replace (Nvl' +
        ' (:peTipo_Entidad, PkgCRGPViews.Todas_Entidades), '#39'ORG-DESC'#39', '#39'Ó' +
        'rganos descentralizados'#39'), '#39'|'#39', '#39', '#39')) Leyenda_Entidades'
      '  From Dual             ')
    Left = 286
    Top = 146
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
  end
  object SaveXLS: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Archivos de Excel *.xls|*.xls|Todos los archivos|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Exportar a Excel'
    Left = 192
    Top = 144
  end
  object QCompInfra: TQuery
    SQL.Strings = (
      'SELECT GRUPO,'
      
        '       CASE WHEN Row_Number () OVER (PARTITION BY GRUPO ORDER BY' +
        ' G1, Orden) = 1 THEN '
      '                 CASE GRUPO WHEN 1 THEN '#39'POR SUBSECTOR'#39' '
      '                            WHEN 2 THEN '#39'POR FUENTE DE PAGO'#39
      '                 END'
      '            ELSE NULL'
      
        '       END                                                      ' +
        '                     Desc_Grupo, '
      '       Orden,'
      '       CASE WHEN G1 = 0 THEN Descripcion'
      '            ELSE '#39'TOTAL'#39
      
        '       END                                                      ' +
        '                     Descripcion,'
      
        '       Round (Imp_4TYAnt, Case When :peFactor = 1000000 Then 0 E' +
        'lse 2 End)           Imp_4TYAnt,'
      '       '
      
        '       ROUND (CASE WHEN SUM (Imp_4TYAnt) OVER (PARTITION BY GRUP' +
        'O, G1) = 0 THEN 0'
      
        '                   ELSE Imp_4TYAnt / SUM (Imp_4TYAnt) OVER (PART' +
        'ITION BY GRUPO, G1)'
      
        '              END * 100, 2)                                     ' +
        '                     Pct_4TYAnt,   '
      '       '
      
        '       Round (Imp_1TYAct, Case When :peFactor = 1000000 Then 0 E' +
        'lse 2 End)           Imp_1TYAct,'
      '       '
      
        '       ROUND (CASE WHEN SUM (Imp_1TYAct) OVER (PARTITION BY GRUP' +
        'O, G1) = 0 THEN 0'
      
        '                   ELSE Imp_1TYAct / SUM (Imp_1TYAct) OVER (PART' +
        'ITION BY GRUPO, G1)'
      
        '              END * 100, 2)                                     ' +
        '                     Pct_1TYAct,'
      '                 '
      
        '       Round (Imp_Fecha, Case When :peFactor = 1000000 Then 0 El' +
        'se 2 End)            Imp_Fecha,'
      '       '
      
        '       ROUND (CASE WHEN SUM (Imp_Fecha) OVER (PARTITION BY GRUPO' +
        ', G1) = 0 THEN 0'
      
        '                   ELSE Imp_Fecha / SUM (Imp_Fecha) OVER (PARTIT' +
        'ION BY GRUPO, G1)'
      
        '              END * 100, 2)                                     ' +
        '                     Pct_Fecha,'
      '              '
      
        '       Round (Imp_Dif1, Case When :peFactor = 1000000 Then 0 Els' +
        'e 2 End)             Imp_Dif1,'
      '       '
      
        '       ROUND (CASE WHEN SUM (Imp_Dif1) OVER (PARTITION BY GRUPO,' +
        ' G1) = 0 THEN 0'
      
        '                   ELSE Imp_Dif1 / SUM (Imp_Dif1) OVER (PARTITIO' +
        'N BY GRUPO, G1)'
      
        '              END * 100, 2)                                     ' +
        '                     Pct_Dif1,'
      '              '
      
        '       Round (Imp_4TYAct, Case When :peFactor = 1000000 Then 0 E' +
        'lse 2 End)           Imp_4TYAct,'
      '       '
      
        '       ROUND (CASE WHEN SUM (Imp_4TYAct) OVER (PARTITION BY GRUP' +
        'O, G1) = 0 THEN 0'
      
        '                   ELSE Imp_4TYAct / SUM (Imp_4TYAct) OVER (PART' +
        'ITION BY GRUPO, G1)'
      
        '              END * 100, 2)                                     ' +
        '                     Pct_4TYAct,'
      '                 '
      
        '       Round (Imp_Dif2, Case When :peFactor = 1000000 Then 0 Els' +
        'e 2 End)             Imp_Dif2,'
      '       '
      
        '       ROUND (CASE WHEN SUM (Imp_Dif2) OVER (PARTITION BY GRUPO,' +
        ' G1) = 0 THEN 0'
      
        '                   ELSE Imp_Dif2 / SUM (Imp_Dif2) OVER (PARTITIO' +
        'N BY GRUPO, G1)'
      
        '              END * 100, 2)                                     ' +
        '                     Pct_Dif2,'
      '       G1'
      
        '  FROM (SELECT 1                                                ' +
        '           GRUPO,'
      
        '               Sdo.ID_Sub_Merc                                  ' +
        '           Orden,'
      
        '               Mdo.Desc_Sub_Merc                                ' +
        '           Descripcion,'
      
        '               GROUPING (Sdo.ID_Sub_Merc)                       ' +
        '           G1,'
      
        '               NVL (SUM (Sdo.Imp_4TYAnt), 0)   / :peFactor      ' +
        '           Imp_4TYAnt, '
      
        '               NVL (SUM (Sdo.Imp_1TYAct), 0)   / :peFactor      ' +
        '           Imp_1TYAct, '
      
        '               NVL (SUM (Sdo.Imp_Fecha),  0)   / :peFactor      ' +
        '           Imp_Fecha,'
      '               (NVL (SUM (Sdo.Imp_1TYAct), 0) -'
      
        '                NVL (SUM (Sdo.Imp_Fecha),  0)) / :peFactor      ' +
        '           Imp_Dif1,'
      
        '               NVL (SUM (Sdo.Imp_4TYAct), 0)   / :peFactor      ' +
        '           Imp_4TYAct,'
      '               (NVL (SUM (Sdo.Imp_4TYAct), 0) -'
      
        '                NVL (SUM (Sdo.Imp_4TYAnt), 0)) / :peFactor      ' +
        '           Imp_Dif2'
      '          FROM ( '
      '                SELECT Cve_Mercado,'
      '                       ID_Sub_Merc,'
      '                       SUM (('
      '                             (NVL (Imp_Cap_Vig, 0)     + '
      '                              NVL (Imp_Cap_Imp, 0)     + '
      '                              NVL (Imp_Cap_Vdo_Ex, 0)  + '
      '                              NVL (Imp_Cap_Vdo_NE, 0)  +'
      '                              NVL (Imp_Int_Vig, 0)     + '
      '                              NVL (Imp_Int_Imp, 0)     + '
      '                              NVL (Imp_Int_Vdo_Ex, 0)  + '
      '                              NVL (Imp_Int_Vdo_NE, 0)) -'
      
        '                              Case :peInt_Cob_Ant When '#39'V'#39' Then ' +
        'NVL (Imp_Int_Cob_Ant, 0) Else 0 End'
      '                            ) *'
      
        '                            Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambi' +
        'o_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '         '#39'D000'#39', '
      
        '                                                                ' +
        '         TO_CHAR (:peF_4TYAnt, '#39'YYYY'#39'), '
      
        '                                                                ' +
        '         TO_CHAR (:peF_4TYAnt, '#39'MM'#39')'
      
        '                                                                ' +
        '         )'
      
        '                           )                                    ' +
        '                                          Imp_4TYAnt,'
      
        '                       0                                        ' +
        '                                          Imp_1TYAct,'
      
        '                       0                                        ' +
        '                                          Imp_Fecha,'
      
        '                       0                                        ' +
        '                                          Imp_4TYAct'
      
        '                  FROM TABLE (Pkgcrgpviews.VW_CR_GP_Saldos_Edos_' +
        'Mun (:peF_4TYAnt, :peTipo_Entidad))'
      '                 WHERE Cve_Mercado = '#39'INFR'#39
      '                   AND (:peCartas_Cred = '#39'V'#39' Or '
      '                        Tipo_Credito   = '#39'CRED'#39')'
      '                 GROUP BY Cve_Mercado,'
      '                          ID_Sub_Merc'
      '                 UNION ALL'
      '                SELECT Cve_Mercado,'
      '                       ID_Sub_Merc,'
      
        '                       0                                        ' +
        '                                          Imp_4TYAnt,'
      
        '                       0                                        ' +
        '                                          Imp_1TYAct,'
      '                       SUM (('
      '                             (NVL (Imp_Cap_Vig, 0)     + '
      '                              NVL (Imp_Cap_Imp, 0)     + '
      '                              NVL (Imp_Cap_Vdo_Ex, 0)  + '
      '                              NVL (Imp_Cap_Vdo_NE, 0)  +'
      '                              NVL (Imp_Int_Vig, 0)     + '
      '                              NVL (Imp_Int_Imp, 0)     + '
      '                              NVL (Imp_Int_Vdo_Ex, 0)  + '
      '                              NVL (Imp_Int_Vdo_NE, 0)) -'
      
        '                              Case :peInt_Cob_Ant When '#39'V'#39' Then ' +
        'NVL (Imp_Int_Cob_Ant, 0) Else 0 End'
      '                            ) *'
      
        '                            Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambi' +
        'o_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '         '#39'D000'#39', '
      
        '                                                                ' +
        '         TO_CHAR (:peFecha, '#39'YYYY'#39'), '
      
        '                                                                ' +
        '         TO_CHAR (:peFecha, '#39'MM'#39')'
      
        '                                                                ' +
        '         )'
      
        '                           )                                    ' +
        '                                          Imp_Fecha,'
      
        '                       0                                        ' +
        '                                          Imp_4TYAct'
      
        '                  FROM TABLE (Pkgcrgpviews.VW_CR_GP_Saldos_Edos_' +
        'Mun (:peFecha, :peTipo_Entidad))'
      '                 WHERE Cve_Mercado = '#39'INFR'#39
      '                   AND (:peCartas_Cred = '#39'V'#39' Or '
      '                        Tipo_Credito   = '#39'CRED'#39')'
      '                 GROUP BY Cve_Mercado,'
      '                          ID_Sub_Merc'
      '               ) Sdo'
      
        '           JOIN CR_MERCADO_OBJ_DET Mdo ON Sdo.Cve_Mercado = Mdo.' +
        'Cve_Mercado AND'
      
        '                                          Sdo.ID_Sub_Merc = Mdo.' +
        'ID_Sub_Merc    '
      '          GROUP BY ROLLUP (Sdo.ID_Sub_Merc, Mdo.Desc_Sub_Merc)'
      
        '          HAVING GROUPING (Sdo.ID_Sub_Merc) + GROUPING (Mdo.Desc' +
        '_Sub_Merc) IN (0, 2)  '
      '         UNION ALL'
      
        '        SELECT 2                                                ' +
        '           GRUPO,'
      
        '               Fte.Orden                                        ' +
        '           Orden,'
      
        '               Fte.Desc_Fuente_Pago                             ' +
        '           Descripcion,'
      
        '               GROUPING (Fte.Orden)                             ' +
        '           G1, '
      
        '               NVL (SUM (Sdo.Imp_4TYAnt), 0)   / :peFactor      ' +
        '           Imp_4TYAnt, '
      
        '               NVL (SUM (Sdo.Imp_1TYAct), 0)   / :peFactor      ' +
        '           Imp_1TYAct, '
      
        '               NVL (SUM (Sdo.Imp_Fecha),  0)   / :peFactor      ' +
        '           Imp_Fecha,'
      '               (NVL (SUM (Sdo.Imp_1TYAct), 0) -'
      
        '                NVL (SUM (Sdo.Imp_Fecha),  0)) / :peFactor      ' +
        '           Imp_Dif1,'
      
        '               NVL (SUM (Sdo.Imp_4TYAct), 0)   / :peFactor      ' +
        '           Imp_4TYAct,'
      '               (NVL (SUM (Sdo.Imp_4TYAct), 0) -'
      
        '                NVL (SUM (Sdo.Imp_4TYAnt), 0)) / :peFactor      ' +
        '           Imp_Dif2'
      '          FROM ('
      '                SELECT Cve_Fuente_Pago,'
      '                       SUM (('
      '                             (NVL (Imp_Cap_Vig, 0)     + '
      '                              NVL (Imp_Cap_Imp, 0)     + '
      '                              NVL (Imp_Cap_Vdo_Ex, 0)  + '
      '                              NVL (Imp_Cap_Vdo_NE, 0)  +'
      '                              NVL (Imp_Int_Vig, 0)     + '
      '                              NVL (Imp_Int_Imp, 0)     + '
      '                              NVL (Imp_Int_Vdo_Ex, 0)  + '
      '                              NVL (Imp_Int_Vdo_NE, 0)) -'
      
        '                              Case :peInt_Cob_Ant When '#39'V'#39' Then ' +
        'NVL (Imp_Int_Cob_Ant, 0) Else 0 End'
      '                            ) *'
      
        '                            Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambi' +
        'o_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '         '#39'D000'#39', '
      
        '                                                                ' +
        '         TO_CHAR (:peF_4TYAnt, '#39'YYYY'#39'), '
      
        '                                                                ' +
        '         TO_CHAR (:peF_4TYAnt, '#39'MM'#39')'
      
        '                                                                ' +
        '         )'
      
        '                           )                                    ' +
        '                                          Imp_4TYAnt,'
      
        '                       0                                        ' +
        '                                          Imp_1TYAct,'
      
        '                       0                                        ' +
        '                                          Imp_Fecha,'
      
        '                       0                                        ' +
        '                                          Imp_4TYAct'
      
        '                  FROM TABLE (Pkgcrgpviews.VW_CR_GP_Saldos_Edos_' +
        'Mun (:peF_4TYAnt, :peTipo_Entidad))'
      '                 WHERE Cve_Mercado = '#39'INFR'#39
      '                   AND (:peCartas_Cred = '#39'V'#39' Or '
      '                        Tipo_Credito   = '#39'CRED'#39')'
      '                 GROUP BY Cve_Fuente_Pago'
      '                 UNION ALL '
      '                SELECT Cve_Fuente_Pago,'
      
        '                       0                                        ' +
        '                                          Imp_4TYAnt,'
      
        '                       0                                        ' +
        '                                          Imp_1TYAct,'
      '                       SUM (('
      '                             (NVL (Imp_Cap_Vig, 0)     + '
      '                              NVL (Imp_Cap_Imp, 0)     + '
      '                              NVL (Imp_Cap_Vdo_Ex, 0)  + '
      '                              NVL (Imp_Cap_Vdo_NE, 0)  +'
      '                              NVL (Imp_Int_Vig, 0)     + '
      '                              NVL (Imp_Int_Imp, 0)     + '
      '                              NVL (Imp_Int_Vdo_Ex, 0)  + '
      '                              NVL (Imp_Int_Vdo_NE, 0)) -'
      
        '                              Case :peInt_Cob_Ant When '#39'V'#39' Then ' +
        'NVL (Imp_Int_Cob_Ant, 0) Else 0 End'
      '                            ) *'
      
        '                            Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambi' +
        'o_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '         '#39'D000'#39', '
      
        '                                                                ' +
        '         TO_CHAR (:peFecha, '#39'YYYY'#39'), '
      
        '                                                                ' +
        '         TO_CHAR (:peFecha, '#39'MM'#39')'
      
        '                                                                ' +
        '         )'
      
        '                           )                                    ' +
        '                                          Imp_Fecha,'
      
        '                       0                                        ' +
        '                                          Imp_4TYAct'
      
        '                  FROM TABLE (Pkgcrgpviews.VW_CR_GP_Saldos_Edos_' +
        'Mun (:peFecha, :peTipo_Entidad))'
      '                 WHERE Cve_Mercado = '#39'INFR'#39
      '                   AND (:peCartas_Cred = '#39'V'#39' Or '
      '                        Tipo_Credito = '#39'CRED'#39')'
      '                 GROUP BY Cve_Fuente_Pago'
      '                ) Sdo'
      
        '           JOIN (SELECT '#39'01'#39' Cve_Fuente_Pago, '#39'PPS'#39'             ' +
        '   Desc_Fuente_Pago, 1 Orden FROM Dual UNION  '
      
        '                 SELECT '#39'02'#39' Cve_Fuente_Pago, '#39'CESIÓN DE DERECHO' +
        'S'#39' Desc_Fuente_Pago, 2 Orden FROM Dual UNION  '
      
        '                 SELECT '#39'03'#39' Cve_Fuente_Pago, '#39'FLUJO PROYECTO'#39'  ' +
        '   Desc_Fuente_Pago, 3 Orden FROM Dual UNION        '
      
        '                 SELECT '#39'04'#39' Cve_Fuente_Pago, '#39'NO APLICA'#39'       ' +
        '   Desc_Fuente_Pago, 4 Orden FROM Dual UNION  '
      
        '                 SELECT '#39'06'#39' Cve_Fuente_Pago, '#39'LÍNEA CONTINGENTE' +
        #39'  Desc_Fuente_Pago, 5 Orden FROM Dual UNION   '
      
        '                 SELECT '#39'05'#39' Cve_Fuente_Pago, '#39'OTROS'#39'           ' +
        '   Desc_Fuente_Pago, 6 Orden FROM Dual   '
      
        '                ) Fte ON Sdo.Cve_Fuente_Pago = Fte.Cve_Fuente_Pa' +
        'go              '
      '          GROUP BY ROLLUP (Fte.Orden, Fte.Desc_Fuente_Pago)'
      
        '          HAVING GROUPING (Fte.Orden) + GROUPING (Fte.Desc_Fuent' +
        'e_Pago) IN (0, 2)'
      '       )'
      '  ORDER BY GRUPO, G1, Orden')
    Left = 240
    Top = 145
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peInt_Cob_Ant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peF_4TYAnt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peF_4TYAnt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peF_4TYAnt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
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
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peCartas_Cred'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peInt_Cob_Ant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peF_4TYAnt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peF_4TYAnt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peF_4TYAnt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
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
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peCartas_Cred'
        ParamType = ptUnknown
      end>
    object QCompInfraGrupo: TFloatField
      FieldName = 'Grupo'
      Visible = False
    end
    object QCompInfraDesc_Grupo: TStringField
      DisplayLabel = '              Grupo'
      DisplayWidth = 20
      FieldName = 'Desc_Grupo'
      Size = 100
    end
    object QCompInfraOrden: TFloatField
      FieldName = 'Orden'
      Visible = False
    end
    object QCompInfraDescripcion: TStringField
      DisplayLabel = '                     Concepto'
      DisplayWidth = 30
      FieldName = 'Descripcion'
      Size = 200
    end
    object QCompInfraImp_4TYAnt: TFloatField
      DisplayWidth = 18
      FieldName = 'Imp_4TYAnt'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QCompInfraPct_4TYAnt: TFloatField
      DisplayLabel = '      %'
      DisplayWidth = 8
      FieldName = 'Pct_4TYAnt'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QCompInfraImp_1TYAct: TFloatField
      DisplayWidth = 18
      FieldName = 'Imp_1TYAct'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QCompInfraPct_1TYAct: TFloatField
      DisplayLabel = '      %'
      DisplayWidth = 8
      FieldName = 'Pct_1TYAct'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QCompInfraImp_Fecha: TFloatField
      DisplayWidth = 18
      FieldName = 'Imp_Fecha'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QCompInfraPct_Fecha: TFloatField
      DisplayLabel = '      %'
      DisplayWidth = 8
      FieldName = 'Pct_Fecha'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QCompInfraImp_Dif1: TFloatField
      DisplayLabel = '          Diferencia'
      DisplayWidth = 18
      FieldName = 'Imp_Dif1'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QCompInfraPct_Dif1: TFloatField
      DisplayLabel = '      %'
      DisplayWidth = 8
      FieldName = 'Pct_Dif1'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QCompInfraImp_4TYAct: TFloatField
      DisplayWidth = 18
      FieldName = 'Imp_4TYAct'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QCompInfraPct_4TYAct: TFloatField
      DisplayLabel = '      %'
      DisplayWidth = 8
      FieldName = 'Pct_4TYAct'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QCompInfraImp_Dif2: TFloatField
      DisplayLabel = '          Diferencia'
      DisplayWidth = 18
      FieldName = 'Imp_Dif2'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QCompInfraPct_Dif2: TFloatField
      DisplayLabel = '      %'
      DisplayWidth = 8
      FieldName = 'Pct_Dif2'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QCompInfraG1: TFloatField
      FieldName = 'G1'
      Visible = False
    end
  end
  object QFechas: TQuery
    SQL.Strings = (
      'Select Fecha,'
      '       F_Trim_Ant,'
      
        '       Ceil (To_Char (F_Trim_Ant, '#39'mm'#39') / 3) || '#39'T'#39' || To_Char (' +
        'F_Trim_Ant, '#39'yyyy'#39')     L_Trim_Ant,'
      
        '       To_Date ('#39'31/12/'#39' || (To_Char (Fecha, '#39'yyyy'#39') - 1), '#39'dd/m' +
        'm/yyyy'#39')                F_Ult_Trim_YAnt,'
      
        '       '#39'4T'#39' || (To_Char (Fecha, '#39'yyyy'#39') - 1)                    ' +
        '                        L_Ult_Trim_YAnt,'
      
        '       To_Date ('#39'31/12/'#39' || To_Char (Fecha, '#39'yyyy'#39'), '#39'dd/mm/yyyy' +
        #39')                      F_Ult_Trim_YAct,'
      
        '       '#39'4T'#39' || To_Char (Fecha, '#39'yyyy'#39')                          ' +
        '                        L_Ult_Trim_YAct'
      '  From ('
      '        Select :peFecha Fecha, '
      
        '               To_Date ('#39'01/'#39' || LPad ((Ceil (To_Char (:peFecha,' +
        ' '#39'mm'#39') / 3) - 1) * 3 + 1, 2, '#39'0'#39') || '#39'/'#39' || To_Char (:peFecha, '#39 +
        'yyyy'#39'), '#39'dd/mm/yyyy'#39') - 1 F_Trim_Ant'
      '          From Dual'
      '       )')
    Left = 328
    Top = 145
    ParamData = <
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
      end>
  end
  object QDetalle: TQuery
    SQL.Strings = (
      'Select Grupo,'
      '       Case Grupo When 1 Then '#39'POR SUBSECTOR'#39' '
      '                  When 2 Then '#39'POR FUENTE DE PAGO'#39
      '                  Else Null'
      
        '        End                                                     ' +
        '                 Desc_Grupo,'
      '       Orden,'
      '       Descripcion,'
      '       Tipo_Entidad,'
      '       ID_Acreditado,'
      '       Nom_Acred_Reg,'
      '       ID_Contrato,'
      '       ID_Credito,'
      '       Tipo_Credito,'
      
        '       Round (Imp_4TYAnt, Case When :peFactor = 1000000 Then 0 E' +
        'lse 2 End)       Imp_4TYAnt,'
      '       '
      
        '       Round (Case When Sum (Imp_4TYAnt) Over (Partition By Grup' +
        'o) = 0 Then 0'
      
        '                   Else Imp_4TYAnt / Sum (Imp_4TYAnt) Over (Part' +
        'ition By Grupo)'
      
        '              End * 100, 2)                                     ' +
        '                 Pct_4TYAnt,'
      '                 '
      
        '       Round (Imp_1TYAct, Case When :peFactor = 1000000 Then 0 E' +
        'lse 2 End)       Imp_1TYAct,'
      
        '                                                                ' +
        '      '
      
        '       Round (Case When Sum (Imp_1TYAct) Over (Partition By Grup' +
        'o) = 0 Then 0'
      
        '                   Else Imp_1TYAct / Sum (Imp_1TYAct) Over (Part' +
        'ition By Grupo)'
      
        '              End * 100, 2)                                     ' +
        '                 Pct_1TYAct,'
      '                 '
      
        '       Round (Imp_Fecha, Case When :peFactor = 1000000 Then 0 El' +
        'se 2 End)        Imp_Fecha,'
      '       '
      
        '       Round (Case When Sum (Imp_Fecha) Over (Partition By Grupo' +
        ') = 0 Then 0'
      
        '                   Else Imp_Fecha / Sum (Imp_Fecha) Over (Partit' +
        'ion By Grupo)'
      
        '              End * 100, 2)                                     ' +
        '                 Pct_Fecha,'
      '              '
      
        '       Round (Imp_Dif1, Case When :peFactor = 1000000 Then 0 Els' +
        'e 2 End)         Imp_Dif1,'
      '        '
      
        '       Round (Case When Sum (Imp_Dif1) Over (Partition By Grupo)' +
        ' = 0 Then 0'
      
        '                   Else Imp_Dif1 / Sum (Imp_Dif1) Over (Partitio' +
        'n By Grupo)'
      
        '              End * 100, 2)                                     ' +
        '                 Pct_Dif1,'
      '              '
      
        '       Round (Imp_4TYAct, Case When :peFactor = 1000000 Then 0 E' +
        'lse 2 End)       Imp_4TYAct,'
      '       '
      
        '       Round (Case When Sum (Imp_4TYAct) Over (Partition By Grup' +
        'o) = 0 Then 0'
      
        '                   Else Imp_4TYAct / Sum (Imp_4TYAct) Over (Part' +
        'ition By Grupo)'
      
        '              End * 100, 2)                                     ' +
        '                 Pct_4TYAct,'
      '                 '
      
        '       Round (Imp_Dif2, Case When :peFactor = 1000000 Then 0 Els' +
        'e 2 End)         Imp_Dif2,'
      '       '
      
        '       Round (Case When Sum (Imp_Dif2) Over (Partition By Grupo)' +
        ' = 0 Then 0'
      
        '                   Else Imp_Dif2 / Sum (Imp_Dif2) Over (Partitio' +
        'n By Grupo)'
      
        '              End * 100, 2)                                     ' +
        '                 Pct_Dif2'
      '  From ( '
      
        '        Select 1                                                ' +
        '           Grupo,'
      
        '               Sdo.Id_Sub_Merc                                  ' +
        '           Orden,'
      
        '               Mdo.Desc_Sub_Merc                                ' +
        '           Descripcion,'
      '               Tipo_Entidad,'
      '               Id_Acreditado,'
      '               Nom_Acred_Reg,'
      '               Id_Contrato,'
      '               Id_Credito,'
      '               Tipo_Credito,'
      
        '               Nvl (Sum (Sdo.Imp_4TYAnt), 0)   / :peFactor      ' +
        '           Imp_4TYAnt,'
      
        '               Nvl (Sum (Sdo.Imp_1TYAct), 0)   / :peFactor      ' +
        '           Imp_1TYAct, '
      
        '               Nvl (Sum (Sdo.Imp_Fecha),  0)   / :peFactor      ' +
        '           Imp_Fecha,'
      '               (Nvl (Sum (Sdo.Imp_1TYAct), 0) -'
      
        '                Nvl (Sum (Sdo.Imp_Fecha),  0)) / :peFactor      ' +
        '           Imp_Dif1,'
      
        '               Nvl (Sum (Sdo.Imp_4TYAct), 0)   / :peFactor      ' +
        '           Imp_4TYAct,'
      '               (Nvl (Sum (Sdo.Imp_4TYAct), 0) -'
      
        '                Nvl (Sum (Sdo.Imp_4TYAnt), 0)) / :peFactor      ' +
        '           Imp_Dif2'
      '          From (  '
      '                Select Cve_Mercado,'
      '                       ID_Sub_Merc,'
      '                       Tipo_Entidad,'
      '                       ID_Acreditado,'
      '                       Nom_Acred_Reg,'
      '                       ID_Contrato,'
      '                       ID_Credito,'
      '                       Tipo_Credito,'
      '                       ('
      '                        (Nvl (Imp_Cap_Vig, 0)     + '
      '                         Nvl (Imp_Cap_Imp, 0)     + '
      '                         Nvl (Imp_Cap_Vdo_Ex, 0)  + '
      '                         Nvl (Imp_Cap_Vdo_NE, 0)  +'
      '                         Nvl (Imp_Int_Vig, 0)     + '
      '                         Nvl (Imp_Int_Imp, 0)     + '
      '                         Nvl (Imp_Int_Vdo_Ex, 0)  + '
      '                         Nvl (Imp_Int_Vdo_NE, 0)) - '
      
        '                         Case :peInt_Cob_Ant When '#39'V'#39' Then NVL (' +
        'Imp_Int_Cob_Ant, 0) Else 0 End'
      '                        ) *'
      
        '                            Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambi' +
        'o_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '         '#39'D000'#39', '
      
        '                                                                ' +
        '         To_Char (:peF_4TYAnt, '#39'YYYY'#39'), '
      
        '                                                                ' +
        '         To_Char (:peF_4TYAnt, '#39'MM'#39')'
      
        '                                                                ' +
        '         )                                Imp_4TYAnt,'
      
        '                       0                                        ' +
        '                                          Imp_1TYAct,'
      
        '                       0                                        ' +
        '                                          Imp_Fecha,'
      
        '                       0                                        ' +
        '                                          Imp_4TYAct'
      
        '                  From Table (Pkgcrgpviews.VW_CR_GP_Saldos_Edos_' +
        'Mun (:peF_4TYAnt, :peTipo_Entidad))'
      '                 Where Cve_Mercado = '#39'INFR'#39
      '                   And (:peCartas_Cred = '#39'V'#39' Or '
      '                        Tipo_Credito = '#39'CRED'#39') '
      '                 '
      '                 Union All'
      ' '
      '                Select Cve_Mercado,'
      '                       ID_Sub_Merc,'
      '                       Tipo_Entidad,'
      '                       ID_Acreditado,'
      '                       Nom_Acred_Reg,'
      '                       ID_Contrato,'
      '                       ID_Credito,'
      '                       Tipo_Credito,'
      
        '                       0                                        ' +
        '                                          Imp_4TYAnt,'
      
        '                       0                                        ' +
        '                                          Imp_1TYAct,'
      '                       ('
      '                        (Nvl (Imp_Cap_Vig, 0)     + '
      '                         Nvl (Imp_Cap_Imp, 0)     + '
      '                         Nvl (Imp_Cap_Vdo_Ex, 0)  + '
      '                         Nvl (Imp_Cap_Vdo_NE, 0)  +'
      '                         Nvl (Imp_Int_Vig, 0)     + '
      '                         Nvl (Imp_Int_Imp, 0)     + '
      '                         Nvl (Imp_Int_Vdo_Ex, 0)  + '
      '                         Nvl (Imp_Int_Vdo_NE, 0)) - '
      
        '                         Case :peInt_Cob_Ant When '#39'V'#39' Then NVL (' +
        'Imp_Int_Cob_Ant, 0) Else 0 End'
      '                        ) *'
      
        '                            Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambi' +
        'o_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '         '#39'D000'#39', '
      
        '                                                                ' +
        '         To_Char (:peFecha, '#39'YYYY'#39'), '
      
        '                                                                ' +
        '         To_Char (:peFecha, '#39'MM'#39')'
      
        '                                                                ' +
        '         )                                Imp_Fecha,'
      
        '                       0                                        ' +
        '                                          Imp_4TYAct'
      
        '                  From Table (Pkgcrgpviews.VW_CR_GP_Saldos_Edos_' +
        'Mun (:peFecha, :peTipo_Entidad))'
      '                 Where Cve_Mercado = '#39'INFR'#39
      '                   And (:peCartas_Cred = '#39'V'#39' Or '
      '                        Tipo_Credito = '#39'CRED'#39') '
      '               ) Sdo'
      
        '          Join CR_MERCADO_OBJ_DET Mdo On Sdo.Cve_Mercado = Mdo.C' +
        've_Mercado And'
      
        '                                         Sdo.ID_Sub_Merc = Mdo.I' +
        'D_Sub_Merc'
      
        '         Group By Sdo.Cve_Mercado, Sdo.ID_Sub_Merc, Mdo.Desc_Sub' +
        '_Merc, Tipo_Entidad, ID_Acreditado, Nom_Acred_Reg, ID_Contrato, ' +
        'ID_Credito, Tipo_Credito '
      '         '
      '         Union All'
      ''
      
        '        Select 2                                                ' +
        '           Grupo,'
      
        '               Fte.Orden                                        ' +
        '           Orden,'
      
        '               Fte.Desc_Fuente_Pago                             ' +
        '           Descripcion,'
      '               Tipo_Entidad,'
      '               ID_Acreditado,'
      '               Nom_Acred_Reg,'
      '               ID_Contrato,'
      '               ID_Credito,'
      '               Tipo_Credito,                                    '
      
        '               Nvl (Sum (Sdo.Imp_4TYAnt), 0)   / :peFactor      ' +
        '           Imp_4TYAnt, '
      
        '               Nvl (Sum (Sdo.Imp_1TYAct), 0)   / :peFactor      ' +
        '           Imp_1TYAct, '
      
        '               Nvl (Sum (Sdo.Imp_Fecha),  0)   / :peFactor      ' +
        '           Imp_Fecha,'
      '               (Nvl (Sum (Sdo.Imp_1TYAct), 0) -'
      
        '                Nvl (Sum (Sdo.Imp_Fecha),  0)) / :peFactor      ' +
        '           Imp_Dif1,'
      
        '               Nvl (Sum (Sdo.Imp_4TYAct), 0)   / :peFactor      ' +
        '           Imp_4TYAct,'
      '               (Nvl (Sum (Sdo.Imp_4TYAct), 0) -'
      
        '                Nvl (Sum (Sdo.Imp_4TYAnt), 0)) / :peFactor      ' +
        '           Imp_Dif2'
      '          From (          '
      '                Select Cve_Fuente_Pago,'
      '                       Tipo_Entidad,'
      '                       ID_Acreditado,'
      '                       Nom_Acred_Reg,'
      '                       ID_Contrato,'
      '                       ID_Credito,'
      '                       Tipo_Credito,'
      '                       ('
      '                        (Nvl (Imp_Cap_Vig, 0)     + '
      '                         Nvl (Imp_Cap_Imp, 0)     + '
      '                         Nvl (Imp_Cap_Vdo_Ex, 0)  + '
      '                         Nvl (Imp_Cap_Vdo_NE, 0)  +'
      '                         Nvl (Imp_Int_Vig, 0)     + '
      '                         Nvl (Imp_Int_Imp, 0)     + '
      '                         Nvl (Imp_Int_Vdo_Ex, 0)  + '
      '                         Nvl (Imp_Int_Vdo_NE, 0)) - '
      
        '                         Case :peInt_Cob_Ant When '#39'V'#39' Then NVL (' +
        'Imp_Int_Cob_Ant, 0) Else 0 End'
      '                       ) *'
      
        '                           Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambio' +
        '_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '        '#39'D000'#39', '
      
        '                                                                ' +
        '        To_Char (:Pef_4tyant, '#39'YYYY'#39'), '
      
        '                                                                ' +
        '        To_Char (:peF_4TYAnt, '#39'MM'#39')'
      
        '                                                                ' +
        '        )                                 Imp_4TYAnt,'
      
        '                       0                                        ' +
        '                                          Imp_1TYAct,'
      
        '                       0                                        ' +
        '                                          Imp_Fecha,'
      
        '                       0                                        ' +
        '                                          Imp_4TYAct'
      
        '                  From Table (Pkgcrgpviews.VW_CR_GP_Saldos_Edos_' +
        'Mun (:peF_4TYAnt, :peTipo_Entidad))'
      '                 Where Cve_Mercado = '#39'INFR'#39
      '                   And (:peCartas_Cred = '#39'V'#39' Or '
      '                        Tipo_Credito = '#39'CRED'#39') '
      '        '
      '                 Union All '
      ''
      '                Select Cve_Fuente_Pago,'
      '                       Tipo_Entidad,'
      '                       ID_Acreditado,'
      '                       Nom_Acred_Reg,'
      '                       ID_Contrato,'
      '                       ID_Credito,'
      '                       Tipo_Credito,'
      
        '                       0                                        ' +
        '                                          Imp_4TYAnt,'
      
        '                       0                                        ' +
        '                                          Imp_1TYAct,'
      '                       ('
      '                        (Nvl (Imp_Cap_Vig, 0)     + '
      '                         Nvl (Imp_Cap_Imp, 0)     + '
      '                         Nvl (Imp_Cap_Vdo_Ex, 0)  + '
      '                         Nvl (Imp_Cap_Vdo_NE, 0)  +'
      '                         Nvl (Imp_Int_Vig, 0)     + '
      '                         Nvl (Imp_Int_Imp, 0)     + '
      '                         Nvl (Imp_Int_Vdo_Ex, 0)  + '
      '                         Nvl (Imp_Int_Vdo_NE, 0)) - '
      
        '                         Case :peInt_Cob_Ant When '#39'V'#39' Then NVL (' +
        'Imp_Int_Cob_Ant, 0) Else 0 End'
      '                       ) *'
      
        '                           Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambio' +
        '_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '        '#39'D000'#39', '
      
        '                                                                ' +
        '        TO_CHAR (:peFecha, '#39'YYYY'#39'), '
      
        '                                                                ' +
        '        TO_CHAR (:peFecha, '#39'MM'#39')'
      
        '                                                                ' +
        '        )                                 Imp_Fecha,'
      
        '                       0                                        ' +
        '                                          Imp_4TYAct'
      
        '                  From Table (Pkgcrgpviews.VW_CR_GP_Saldos_Edos_' +
        'Mun (:peFecha, :peTipo_Entidad))'
      '                 Where Cve_Mercado = '#39'INFR'#39
      '                   And (:peCartas_Cred = '#39'V'#39' Or '
      '                        Tipo_Credito = '#39'CRED'#39') '
      '               ) Sdo'
      
        '          Join (Select '#39'01'#39' Cve_Fuente_Pago, '#39'PPS'#39'              ' +
        '  Desc_Fuente_Pago, 1 Orden From Dual Union  '
      
        '                Select '#39'02'#39' Cve_Fuente_Pago, '#39'CESIÓN DE DERECHOS' +
        #39' Desc_Fuente_Pago, 2 Orden From Dual Union  '
      
        '                Select '#39'03'#39' Cve_Fuente_Pago, '#39'FLUJO PROYECTO'#39'   ' +
        '  Desc_Fuente_Pago, 3 Orden From Dual Union        '
      
        '                Select '#39'04'#39' Cve_Fuente_Pago, '#39'NO APLICA'#39'        ' +
        '  Desc_Fuente_Pago, 4 Orden From Dual Union  '
      
        '                Select '#39'06'#39' Cve_Fuente_Pago, '#39'LÍNEA CONTINGENTE'#39 +
        '  Desc_Fuente_Pago, 5 Orden From Dual Union   '
      
        '                Select '#39'05'#39' Cve_Fuente_Pago, '#39'OTROS'#39'            ' +
        '  Desc_Fuente_Pago, 6 Orden From Dual   '
      
        '               ) Fte On Sdo.Cve_Fuente_Pago = Fte.Cve_Fuente_Pag' +
        'o              '
      
        '         Group By Fte.Orden, Fte.Desc_Fuente_Pago, Tipo_Entidad,' +
        ' ID_Acreditado, Nom_Acred_Reg, ID_Contrato, ID_Credito, Tipo_Cre' +
        'dito  '
      '       )'
      ' Where Imp_4TYAnt <> 0 '
      '    Or Imp_1TYAct <> 0 '
      '    Or Imp_Fecha  <> 0 '
      '    Or Imp_4TYAct <> 0')
    Left = 368
    Top = 145
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peInt_Cob_Ant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peF_4TYAnt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peF_4TYAnt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peF_4TYAnt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
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
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peCartas_Cred'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peInt_Cob_Ant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Pef_4tyant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peF_4TYAnt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peF_4TYAnt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
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
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peCartas_Cred'
        ParamType = ptUnknown
      end>
  end
end
