object WEstResRC: TWEstResRC
  Left = 388
  Top = 275
  Width = 792
  Height = 434
  Caption = 'Estimación Preventiva para Riesgos Crediticios'
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
    Width = 776
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label3: TLabel
      Left = 15
      Top = 16
      Width = 64
      Height = 13
      Alignment = taCenter
      Caption = 'Fecha Inicio :'
    end
    object Label1: TLabel
      Left = 200
      Top = 16
      Width = 61
      Height = 13
      Alignment = taCenter
      Caption = 'Fecha Final :'
    end
    object Label2: TLabel
      Left = 22
      Top = 46
      Width = 57
      Height = 13
      Caption = 'Acreditado :'
    end
    object sbExportarDetalle: TSpeedButton
      Left = 677
      Top = 35
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
    object btBusca: TBitBtn
      Left = 677
      Top = 7
      Width = 116
      Height = 24
      Caption = 'Inicia Busqueda'
      TabOrder = 0
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
    object dtFechaInicio: TDateTimePicker
      Left = 83
      Top = 12
      Width = 83
      Height = 21
      CalAlignment = dtaLeft
      Date = 40988.4704658796
      Time = 40988.4704658796
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      MinDate = 39814
      ParseInput = False
      TabOrder = 1
      OnChange = dtFechaInicioChange
    end
    object dtFechaFinal: TDateTimePicker
      Left = 267
      Top = 12
      Width = 83
      Height = 21
      CalAlignment = dtaLeft
      Date = 40988.4704658796
      Time = 40988.4704658796
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
      OnChange = dtFechaInicioChange
    end
    object edACREDITADO: TEdit
      Tag = 562
      Left = 82
      Top = 43
      Width = 82
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object btACREDITADO: TBitBtn
      Left = 172
      Top = 43
      Width = 21
      Height = 21
      TabOrder = 4
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
      Left = 200
      Top = 43
      Width = 369
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object cbAcreditado: TCheckBox
      Left = 575
      Top = 44
      Width = 14
      Height = 17
      TabStop = False
      Enabled = False
      TabOrder = 6
      OnClick = cbAcreditadoClick
    end
    object rgVista: TRadioGroup
      Left = 388
      Top = 4
      Width = 200
      Height = 34
      Caption = ' Vista '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Línea'
        'Acreditado')
      TabOrder = 7
      OnClick = rgVistaExit
      OnExit = rgVistaExit
    end
  end
  object grdReservas: TSGCtrl
    Left = 0
    Top = 72
    Width = 776
    Height = 324
    ShowTab = True
    Align = alClient
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
    Left = 602
    Top = 18
  end
  object qryVistaLineas: TQuery
    SQL.Strings = (
      'select'
      
        'id_acreditado, nombre, id_pers_asociad, asociado, id_prom_admon,' +
        ' administrador, cve_metodologia,'
      
        'substr(desc_clave, 1, 80) desc_clave, cve_grupo_eco, desc_grupo_' +
        'eco, cve_cat_min, desc_cat_minimo, id_contrato,'
      
        'reserva_l_ant, reserva_acre_ant, total_linea_ant, total_acre_ant' +
        ','
      
        'round((case when (substr(cve_cat_min, 1,2) = '#39'73'#39') or (cve_cat_m' +
        'in is null) then 0.5'
      #9' when reserva_l_ant = 0 and total_linea_ant = 0 then 0'
      #9' else reserva_l_ant / total_linea_ant '
      #9' end ) * 100, 6) pct_reserva_ant,'
      
        'tc_ant, calif_ant, reserva_l_act, reserva_acre_act, total_linea_' +
        'act, total_acre_act, '
      
        'round((case when (substr(cve_cat_min, 1,2) = '#39'73'#39') or (cve_cat_m' +
        'in is null) then 0.5'
      #9' when reserva_l_act = 0 and total_linea_act = 0 then 0'
      #9' else reserva_l_act / total_linea_act '
      #9' end ) * 100, 6) pct_reserva_act,'
      'tc_act, calif_act, '
      '(reserva_l_act - reserva_l_ant) gtot_reserva_por_l,'
      '(total_linea_act - total_linea_ant) gtot_por_linea,'
      '(reserva_acre_act - reserva_acre_ant) gtot_reserva_acre,'
      '(total_acre_act - total_acre_ant) gtot_acreditado,'
      'cve_moneda, desc_moneda'
      ',status_1 Situacion'
      'from ('
      #9' /* */'
      #9'select '
      
        #9'id_acreditado, nombre, id_pers_asociad, asociado, id_prom_admon' +
        ', administrador, cve_metodologia, desc_clave, cve_grupo_eco, des' +
        'c_grupo_eco, '
      #9'cve_cat_min, desc_cat_minimo, id_contrato, id_credito, '
      
        #9'nvl(reserva_ant, 0) reserva_ant, nvl(reserva_l_ant, 0) reserva_' +
        'l_ant, nvl(reserva_acre_ant, 0) reserva_acre_ant, '
      
        #9'nvl(total_ant, 0) total_ant, nvl(total_linea_ant, 0) total_line' +
        'a_ant, '
      #9'nvl(total_acre_ant, 0) total_acre_ant, tc_ant, '
      #9'(calif_exp_ant || '#39' '#39' ||calif_cub_ant) calif_ant,'
      
        #9'nvl(total_act, 0) total_act, nvl(total_linea_act, 0) total_line' +
        'a_act, nvl(total_acre_act, 0) total_acre_act, '
      
        #9'nvl(reserva_act, 0) reserva_act, nvl(reserva_l_act, 0) reserva_' +
        'l_act, '
      #9'nvl(reserva_acre_act, 0) reserva_acre_act, tc_act, '
      #9'(calif_exp_act || '#39' '#39' || calif_cub_act) calif_act,'
      #9'cve_moneda, desc_moneda'
      
        #9',row_number () over (partition by id_acreditado, id_contrato or' +
        'der by id_acreditado, id_contrato) rn'
      #9',status_1'
      #9'from ('
      #9#9'select'
      
        #9#9#9'dat.id_acreditado, nombre, id_pers_asociad, asociado, id_prom' +
        '_admon,'
      
        #9#9#9'administrador, cve_metodologia, desc_clave, cve_grupo_eco, de' +
        'sc_grupo_eco,'
      #9#9#9'cve_cat_min, desc_cat_minimo,'
      
        #9#9#9'id_contrato, id_credito, reserva_ant, reserva_l_ant, reserva_' +
        'acre_ant, total_ant,'
      
        #9#9#9'sum(total_ant) over (partition by dat.id_acreditado, id_contr' +
        'ato '
      
        #9#9#9'                                     order by dat.id_acredita' +
        'do, id_contrato) total_linea_ant, '
      #9#9#9'sum(total_ant) over (partition by dat.id_acreditado '
      
        #9#9#9'                                     order by dat.id_acredita' +
        'do) total_acre_ant, '
      #9#9#9'tc_ant, '
      
        #9#9#9'case when calif_cub_ant = '#39'NA'#39' then '#39'SC'#39' else calif_cub_ant e' +
        'nd calif_cub_ant, '
      
        #9#9#9'case when calif_exp_ant = '#39'NA'#39' then '#39'SC'#39' else calif_exp_ant e' +
        'nd calif_exp_ant,'
      
        #9#9#9'reserva_act, reserva_l_act, reserva_acre_act, tc_act, total_a' +
        'ct,'
      
        #9#9#9'sum(total_act) over (partition by dat.id_acreditado, id_contr' +
        'ato '
      
        #9#9#9'                                     order by dat.id_acredita' +
        'do, id_contrato) total_linea_act, '
      #9#9#9'sum(total_act) over (partition by dat.id_acreditado '
      
        #9#9#9'                                     order by dat.id_acredita' +
        'do) total_acre_act, '
      
        #9#9#9'case when calif_cub_act = '#39'NA'#39' then '#39'SC'#39' else calif_cub_act e' +
        'nd calif_cub_act, '
      
        #9#9#9'case when calif_exp_act = '#39'NA'#39' then '#39'SC'#39' else calif_exp_act e' +
        'nd calif_exp_act,'
      #9#9#9'cve_moneda, desc_moneda, status_1'
      #9#9'from ( '
      #9#9#9'select'
      #9#9#9'----id_contrato, cte.id_acreditado, ---- Eliminar '
      #9#9#9'impsicc.id_credito,'
      #9#9'    impsicc.mes_ant reserva_ant,'
      
        #9#9#9'sum(impsicc.mes_ant) over (partition by id_acreditado, id_con' +
        'trato '
      
        #9#9#9'                                     order by id_acreditado, ' +
        'id_contrato) reserva_l_ant,'
      #9#9#9'sum(impsicc.mes_ant) over (partition by id_acreditado '
      
        #9#9#9'                                     order by id_acreditado) ' +
        'reserva_acre_ant, '
      #9#9#9'impsicc.mes_act reserva_act,'
      
        #9#9#9'sum(impsicc.mes_act) over (partition by id_acreditado, id_con' +
        'trato '
      
        #9#9#9'                                     order by id_acreditado, ' +
        'id_contrato) reserva_l_act, '
      #9#9#9'sum(impsicc.mes_act) over (partition by id_acreditado '
      
        #9#9#9'                                     order by id_acreditado) ' +
        'reserva_acre_act, '
      #9#9#9'(saldoant * tc_ant) total_ant,'
      #9#9'    (saldoact * tc_act) total_act,'
      #9#9#9'tc_ant, tc_act,'#9#9#9#9#9#9#9#9#9#9#9'  '
      #9#9#9'max(calif_cub_ant) over (partition by id_acreditado '
      
        #9#9#9#9'                                    order by id_acreditado, ' +
        'calif_cub_ant asc) calif_cub_ant,'
      #9#9#9'max(calif_exp_ant) over (partition by id_acreditado '
      
        #9#9#9#9'                                    order by id_acreditado, ' +
        'calif_exp_ant asc) calif_exp_ant,'
      #9#9#9'max(calif_cub_act) over (partition by id_acreditado '
      
        #9#9#9#9'                                    order by id_acreditado, ' +
        'calif_cub_act asc) calif_cub_act,'
      #9#9#9'max(calif_exp_act) over (partition by id_acreditado '
      
        #9#9#9#9'                                    order by id_acreditado, ' +
        'calif_exp_act asc) calif_exp_act,'
      #9#9#9'saldoant, saldoact, id_contrato, id_acreditado, nombre, '
      
        #9#9#9'id_pers_asociad ,asociado, id_prom_admon, administrador, cve_' +
        'moneda, desc_moneda,'
      
        #9#9#9'cve_producto, nom_producto, case when substr(cve_cat_min, 1,2' +
        ') = '#39'73'#39' then '#39'1'#39' else cve_metodologia end cve_metodologia, '
      
        #9#9#9'case when substr(cve_cat_min, 1,2) = '#39'73'#39' then '#39'Metodología I' +
        'ndividual'#39' else desc_clave end desc_clave, '
      #9#9#9'cve_grupo_eco, '
      #9#9#9'desc_grupo_eco, cve_cat_min, desc_cat_minimo, rn'
      #9#9#9',status_1'
      #9#9#9'from ('
      #9#9#9#9' select sicc.id_credito,'
      
        #9#9#9#9#9#9' nvl (sic1.imp_reserva_exp, 0) + nvl (sic1.imp_reserva_cub' +
        ', 0) mes_ant,'
      
        #9#9#9#9#9#9' nvl (sic2.imp_reserva_exp + sic2.imp_reserva_cub, 0) mes_' +
        'act'
      #9#9#9#9#9#9' /*---- calificaciones*/'
      
        #9#9#9#9#9#9' ,sic1.cve_calific_cub calif_cub_ant, sic1.cve_calific_exp' +
        ' calif_exp_ant'
      
        #9#9#9#9#9#9' ,sic2.cve_calific_cub calif_cub_act, sic2.cve_calific_exp' +
        ' calif_exp_act'
      #9#9#9#9#9#9' /*---- /calificaciones'
      #9#9#9#9#9#9' ---- saldos de consolidado*/'
      #9#9#9#9#9#9' ,saldoant'
      #9#9#9#9#9#9' ,saldoact'
      #9#9#9#9#9#9' /*---- saldos de consolidado*/'
      #9#9#9#9#9'from (select distinct id_credito'
      #9#9#9#9#9#9#9#9#9' from cr_sicc_califica'
      #9#9#9#9#9#9#9#9#9'where 2 = 2 '
      #9#9#9#9#9#9#9#9#9'  and anio_mes between 200901 and :messanio'
      #9#9#9#9#9#9#9#9#9'  and vigente = 1'
      #9#9#9#9#9#9#9#9' order by id_credito) sicc,'
      #9#9#9#9#9#9' (select   id_credito'
      #9#9#9#9#9#9#9'  from (select sic0.anio_mes, sic0.id_credito,'
      #9#9#9#9#9#9#9#9' sic0.imp_reserva_exp  + sic0.imp_reserva_cub as reserva'
      #9#9#9#9#9#9#9' from cr_sicc_califica sic0'
      #9#9#9#9#9#9#9'where 1 = 1'
      
        #9#9#9#9#9#9#9'  and sic0.anio_mes >= to_number(to_char(add_months(to_da' +
        'te (:messanio,'#39'YYYYMM'#39'),-:mant),'#39'YYYYMM'#39'))'
      
        #9#9#9#9#9#9#9'  and sic0.anio_mes <= to_number(to_char(to_date (:messan' +
        'io,'#39'YYYYMM'#39'),'#39'YYYYMM'#39'))'
      #9#9#9#9#9#9#9'  and sic0.vigente = 1'
      #9#9#9#9#9#9#9#9#9')'
      #9#9#9#9#9#9'  group by id_credito'
      #9#9#9#9#9#9'  order by id_credito) sic0,'
      #9#9#9#9#9#9' (select cscc.id_credito, anio_mes, '
      
        #9#9#9#9#9#9#9#9' imp_cubierto, imp_expuesto, cve_calific_cub, cve_califi' +
        'c_exp,'
      #9#9#9#9#9#9#9#9' imp_reserva_cub, imp_reserva_exp, cont.id_contrato'
      
        #9#9#9#9#9#9#9#9' ,pkgcrppo.funobtsdo(cscc.id_credito, to_char(trunc(last' +
        '_day( add_months(to_date(to_char(:messanio), '#39'yyyymm'#39'),-:mant ) ' +
        ')), '#39'dd/mm/yyyy'#39'), '#39'INSOLUTO'#39', '#39#39') saldoant '
      #9#9#9#9#9#9#9'from cr_sicc_califica cscc'
      #9#9#9#9#9#9#9'left join( --acreditado,contrato,credito '
      #9#9#9#9#9#9#9#9#9'  select con.id_contrato, cre.id_credito'
      #9#9#9#9#9#9#9#9#9'  from cr_acreditado ac'
      
        #9#9#9#9#9#9#9#9#9'  inner join contrato con on (con.id_titular = ac.id_ac' +
        'reditado)'
      
        #9#9#9#9#9#9#9#9#9'  inner join cr_credito cre on (cre.id_contrato = con.i' +
        'd_contrato) '
      #9#9#9#9#9#9#9#9#9'union'
      #9#9#9#9#9#9#9#9#9'  select con.id_contrato, cre.id_credito'
      #9#9#9#9#9#9#9#9#9'  from cre_cliente ac'
      
        #9#9#9#9#9#9#9#9#9'  inner join contrato con on (con.id_titular = ac.id_pe' +
        'rsona)'
      
        #9#9#9#9#9#9#9#9#9'  inner join cre_credito cre on (cre.id_contrato = con.' +
        'id_contrato) '
      #9#9#9#9#9#9#9#9#9') cont on (cscc.id_credito = cont.id_credito)'
      #9#9#9#9#9#9#9#9'   where cscc.vigente  =1'
      
        #9#9#9#9#9#9#9'   and cscc.anio_mes  = to_number (to_char (add_months (t' +
        'o_date (:messanio, '#39'YYYYMM'#39'),-:mant ), '#39'YYYYMM'#39'))'
      #9#9#9#9#9#9' ) sic1,   /*---- mes anterior*/'
      #9#9#9#9#9#9' ('
      #9#9#9#9#9#9#9'select cscc.id_credito, anio_mes, '
      
        #9#9#9#9#9#9#9#9' imp_cubierto, imp_expuesto, cve_calific_cub, cve_califi' +
        'c_exp,'
      #9#9#9#9#9#9#9#9' imp_reserva_cub, imp_reserva_exp, cont.id_contrato'
      
        #9#9#9#9#9#9#9#9' ,pkgcrppo.funobtsdo(cscc.id_credito, to_char(trunc(last' +
        '_day(to_date(to_char(:messanio), '#39'yyyymm'#39'))), '#39'dd/mm/yyyy'#39'), '#39'IN' +
        'SOLUTO'#39', '#39#39') saldoact'
      #9#9#9#9#9#9#9'from cr_sicc_califica cscc'
      #9#9#9#9#9#9#9'left join( /*--acreditado,contrato,credito */'
      #9#9#9#9#9#9#9#9#9'  select con.id_contrato, cre.id_credito'
      #9#9#9#9#9#9#9#9#9'  from cr_acreditado ac'
      
        #9#9#9#9#9#9#9#9#9'  inner join contrato con on (con.id_titular = ac.id_ac' +
        'reditado)'
      
        #9#9#9#9#9#9#9#9#9'  inner join cr_credito cre on (cre.id_contrato = con.i' +
        'd_contrato) '
      #9#9#9#9#9#9#9#9#9'union'
      #9#9#9#9#9#9#9#9#9'  select con.id_contrato, cre.id_credito'
      #9#9#9#9#9#9#9#9#9'  from cre_cliente ac'
      
        #9#9#9#9#9#9#9#9#9'  inner join contrato con on (con.id_titular = ac.id_pe' +
        'rsona)'
      
        #9#9#9#9#9#9#9#9#9'  inner join cre_credito cre on (cre.id_contrato = con.' +
        'id_contrato) '
      #9#9#9#9#9#9#9#9#9') cont on (cscc.id_credito = cont.id_credito)'
      #9#9#9#9#9#9#9#9'   where cscc.vigente  =1'
      #9#9#9#9#9#9#9'and cscc.anio_mes  = :messanio'#9#9#9#9#9#9'   '
      #9#9#9#9#9#9' ) sic2  /*---- mes actual*/'
      #9#9#9#9'   where sicc.id_credito = sic0.id_credito(+)'
      #9#9#9#9#9' and sicc.id_credito = sic1.id_credito(+)'
      #9#9#9#9#9' and sicc.id_credito = sic2.id_credito(+)'
      #9#9#9#9#9' /*--- para pruebas en la seccion de importes de reserva*/'
      #9#9#9#9#9' /*and sicc.id_credito in ('
      #9#9#9#9#9#9#9#9#9#9#9')*/'
      #9#9#9#9#9#9#9') impsicc'
      #9#9#9'left join ( '
      #9#9#9#9'    /*---- datos del cliente*/'
      #9#9#9#9#9'select'
      
        #9#9#9#9#9'id_contrato, id_credito, cte.id_acreditado, nombre, id_pers' +
        '_asociad,'
      
        #9#9#9#9#9'asociado, id_prom_admon, administrador, cve_moneda, desc_mo' +
        'neda,'
      #9#9#9#9#9'cve_producto, nom_producto, cve_metodologia,'
      #9#9#9#9#9'desc_clave, cve_grupo_eco, desc_grupo_eco'
      #9#9#9#9#9',cve_cat_min, desc_cat_minimo,'
      #9#9#9#9#9'case when cve_moneda = 484 then 1 else'
      
        #9#9#9#9#9'pkgcorpo.obttipocambio(pkgrptregcr.funobtfliq('#39'FMAC'#39','#39'D002'#39 +
        ',to_char(trunc(last_day(to_date(to_char(:messanio), '#39'yyyymm'#39'))),' +
        ' '#39'dd/mm/yyyy'#39')), 840 , '#39'V'#39' ) '
      #9#9#9#9#9'end tc_act,'
      #9#9#9#9#9'case when cve_moneda = 484 then 1 else'
      
        #9#9#9#9#9'pkgcorpo.obttipocambio(pkgrptregcr.funobtfliq('#39'FMAC'#39','#39'D002'#39 +
        ',to_char(trunc(last_day(add_months(to_date(to_char(:messanio), '#39 +
        'yyyymm'#39'),-:mant ))), '#39'dd/mm/yyyy'#39')), 840 , '#39'V'#39' ) '
      #9#9#9#9#9'end tc_ant'
      
        #9#9#9#9#9',row_number () over (partition by cte.id_acreditado, id_con' +
        'trato, id_credito'
      
        #9#9#9#9#9#9#9#9'                                     order by cte.id_acr' +
        'editado) rn'
      #9#9#9#9#9',status_1'
      #9#9#9#9#9'from ('
      #9#9#9#9#9'      /*---- icre01*/'
      
        #9#9#9#9#9#9'  select cto.id_contrato, cre.id_credito, ac.id_acreditado' +
        ', per.nombre'
      #9#9#9#9#9#9'  '#9#9' ,cto.id_pers_asociad, pas.nombre asociado '
      #9#9#9#9#9#9#9#9' ,ccto.id_prom_admon, pad.nombre administrador'
      #9#9#9#9#9#9#9#9' ,cto.cve_moneda, m.desc_moneda'
      
        #9#9#9#9#9#9#9#9' ,ccto.cve_producto_cre cve_producto, prod.desc_l_produc' +
        'to nom_producto'
      #9#9#9#9#9#9#9#9' ,prod.cve_clas_contab cve_cat_min, cart.desc_cat_minimo'
      #9#9#9#9#9#9'  from cr_acreditado ac'
      
        #9#9#9#9#9#9'  inner join contrato cto on (cto.id_titular = ac.id_acred' +
        'itado)'
      
        #9#9#9#9#9#9'  inner join cr_contrato ccto on (ccto.id_contrato = cto.i' +
        'd_contrato)'
      
        #9#9#9#9#9#9'  inner join cr_producto prod on (prod.cve_producto_cre = ' +
        'ccto.cve_producto_cre)'
      
        #9#9#9#9#9#9'  inner join cr_cat_minimo cart on (cart.cve_cat_minimo = ' +
        'prod.cve_clas_contab) '
      
        #9#9#9#9#9#9'  inner join cr_credito cre on (cre.id_contrato = cto.id_c' +
        'ontrato)'
      
        #9#9#9#9#9#9'  inner join persona per on (per.id_persona = ac.id_acredi' +
        'tado)'
      
        #9#9#9#9#9#9'  inner join persona pas on (pas.id_persona = cto.id_pers_' +
        'asociad)'
      
        #9#9#9#9#9#9'  inner join persona pad on (pad.id_persona = ccto.id_prom' +
        '_admon)'
      #9#9#9#9#9#9'  inner join moneda m on (m.cve_moneda = cto.cve_moneda)'
      #9#9#9#9#9#9'  where 2 = 2'
      
        #9#9#9#9#9#9'  and    not exists ( select cre.id_credito from cr_con_re' +
        'g_cci cci where cci.id_reg_vigente = 1 and cci.id_credito = cre.' +
        'id_credito)'
      #9#9#9#9#9'   union'
      #9#9#9#9#9#9'  /*---- intercreditos*/'
      
        #9#9#9#9#9#9'  select cto.id_contrato, cre.id_credito, ac.id_persona id' +
        '_acreditado, per.nombre'
      #9#9#9#9#9#9'  '#9#9' ,cto.id_pers_asociad, pas.nombre asociado '
      #9#9#9#9#9#9#9#9' ,ac.id_prom_adm, pad.nombre administrador'
      #9#9#9#9#9#9#9#9' ,cto.cve_moneda, m.desc_moneda'
      
        #9#9#9#9#9#9#9#9' ,dprod.cve_producto cve_producto, dprod.desc_producto n' +
        'om_producto'
      #9#9#9#9#9#9#9#9' ,ccto.cve_cat_min, cart.desc_cat_min'
      #9#9#9#9#9#9'  from cre_cliente ac'
      
        #9#9#9#9#9#9'  inner join contrato cto on (cto.id_titular = ac.id_perso' +
        'na)'
      
        #9#9#9#9#9#9'  inner join cre_contrato ccto on (ccto.id_contrato = cto.' +
        'id_contrato)'
      
        #9#9#9#9#9#9'  inner join producto dprod on (dprod.cve_producto = cto.c' +
        've_producto)'
      
        #9#9#9#9#9#9'  left  join cre_cat_minimo cart on (cart.cve_cat_min = cc' +
        'to.cve_cat_min)'
      
        #9#9#9#9#9#9'  inner join cre_credito cre on (cre.id_contrato = cto.id_' +
        'contrato)'
      
        #9#9#9#9#9#9'  inner join persona per on (per.id_persona = ac.id_person' +
        'a)'
      
        #9#9#9#9#9#9'  inner join persona pas on (pas.id_persona = cto.id_pers_' +
        'asociad)'
      
        #9#9#9#9#9#9'  inner join persona pad on (pad.id_persona = ac.id_prom_a' +
        'dm)'
      #9#9#9#9#9#9'  inner join moneda m on (m.cve_moneda = cto.cve_moneda)'
      #9#9#9#9#9'   union'
      #9#9#9#9#9'      /*---- cartas de credito*/'
      
        #9#9#9#9#9#9'  select cto.id_contrato, cre.id_credito, ac.id_acreditado' +
        ', per.nombre'
      #9#9#9#9#9#9'  '#9#9' ,cto.id_pers_asociad, pas.nombre asociado '
      #9#9#9#9#9#9#9#9' ,ccto.id_prom_admon, pad.nombre administrador'
      #9#9#9#9#9#9#9#9' ,cto.cve_moneda, m.desc_moneda'
      
        #9#9#9#9#9#9#9#9' ,ccto.cve_producto_cre cve_producto, prod.desc_l_produc' +
        'to nom_producto'
      #9#9#9#9#9#9#9#9' ,prod.cve_clas_contab cve_cat_min, cart.desc_cat_minimo'
      #9#9#9#9#9#9'  from cr_acreditado ac'
      
        #9#9#9#9#9#9'  inner join contrato cto on (cto.id_titular = ac.id_acred' +
        'itado)'
      
        #9#9#9#9#9#9'  inner join cr_contrato ccto on (ccto.id_contrato = cto.i' +
        'd_contrato)'
      
        #9#9#9#9#9#9'  inner join cr_producto prod on (prod.cve_producto_cre = ' +
        'ccto.cve_producto_cre)'
      
        #9#9#9#9#9#9'  inner join cr_cat_minimo cart on (cart.cve_cat_minimo = ' +
        'prod.cve_clas_contab)'
      
        #9#9#9#9#9#9'  inner join cr_con_reg_cci  cre on (cre.id_contrato = cto' +
        '.id_contrato)'
      
        #9#9#9#9#9#9'  inner join persona per on (per.id_persona = ac.id_acredi' +
        'tado)'
      
        #9#9#9#9#9#9'  inner join persona pas on (pas.id_persona = cto.id_pers_' +
        'asociad)'
      
        #9#9#9#9#9#9'  inner join persona pad on (pad.id_persona = ccto.id_prom' +
        '_admon)'
      #9#9#9#9#9#9'  inner join moneda m on (m.cve_moneda = cto.cve_moneda)'
      #9#9#9#9#9#9') cte'
      #9#9#9#9#9#9'left join ('
      
        #9#9#9#9#9#9#9#9'select acre.id_acreditado, acre.cve_metodologia, dt.desc' +
        '_clave, acre.cve_grupo_eco, gpoe.desc_grupo_eco '
      #9#9#9#9#9#9#9#9'from cr_acreditado acre'
      
        #9#9#9#9#9#9#9#9'left join cr_grupo_eco gpoe on (gpoe.cve_grupo_eco = acr' +
        'e.cve_grupo_eco)'
      
        #9#9#9#9#9#9#9#9'left join cr_con_cat_data dt on (dt.cve_clave = acre.cve' +
        '_metodologia and dt.cve_con_gpo_cat = '#39'CAT_METODOLOGIA'#39')'
      #9#9#9#9#9#9#9#9'where acre.id_acreditado is not null'
      #9#9#9#9#9#9#9'union'
      
        #9#9#9#9#9#9#9#9'select acre.id_persona id_acreditado, acre.cve_metodolog' +
        'ia, dt.desc_clave, acre.cve_grupo cve_grupo_eco, gpoe.desc_grupo' +
        ' desc_grupo_eco '
      #9#9#9#9#9#9#9#9'from cre_cliente acre'
      
        #9#9#9#9#9#9#9#9'left join cre_grupo_empr gpoe on (gpoe.cve_grupo = acre.' +
        'cve_grupo)'
      
        #9#9#9#9#9#9#9#9'left join cr_con_cat_data dt on (dt.cve_clave = acre.cve' +
        '_metodologia and dt.cve_con_gpo_cat = '#39'CAT_METODOLOGIA'#39')'
      #9#9#9#9#9#9#9#9'where acre.id_persona is not null'
      #9#9#9#9#9#9#9#9') met on (met.id_acreditado = cte.id_acreditado)'
      #9#9#9#9#9#9'left join ('
      #9#9#9#9#9#9#9#9'select (case'
      #9#9#9#9#9#9#9#9'           when count (id_acreditado) = 0 then '#39'  '#39
      
        #9#9#9#9#9#9#9#9'           when count (id_acreditado) > 0 then '#39'En Recup' +
        'eración'#39
      #9#9#9#9#9#9#9#9'           else '#39'CE'#39
      #9#9#9#9#9#9#9#9'        end) as status_1, id_acreditado'
      #9#9#9#9#9#9#9#9'  from cr_acre_re'
      
        #9#9#9#9#9#9#9#9' where 2 = 2 --and to_date ('#39'31/05/2013'#39', '#39'DD/MM/YYYY'#39') ' +
        '>= f_alta_recu'
      #9#9#9#9#9#9#9#9'   and f_baja_recu is null'
      #9#9#9#9#9#9#9#9' group by id_acreditado'#9#9#9#9#9#9
      #9#9#9#9#9#9') st on (st.id_acreditado = cte.id_acreditado)'
      #9#9#9#9#9#9'where 2 = 2 '
      
        #9#9#9#9#9#9'/*---and cte.id_acreditado = 189319  ----solo pruebas de l' +
        'a seccion del cliente */'
      #9#9#9#9#9'/*---- /datos del cliente */'
      #9#9#9#9') cte on (cte.id_credito = impsicc.id_credito and rn = 1)'
      #9#9#9'where 2 = 2 '
      #9#9#9'and impsicc.id_credito in ( /*------ para pruebas*/'
      #9#9#9#9#9#9#9#9#9'select id_credito from ('
      #9#9#9#9#9#9#9#9#9#9'select id_credito, id_contrato, f_alta from cr_credito'
      #9#9#9#9#9#9#9#9#9#9'union'
      
        #9#9#9#9#9#9#9#9#9#9'select id_credito, id_contrato, f_captura_cred from cr' +
        'e_credito'
      #9#9#9#9#9#9#9#9#9#9'union'
      
        #9#9#9#9#9#9#9#9#9#9'select id_credito, id_contrato, fh_alta f_alta from cr' +
        '_con_reg_cci '
      #9#9#9#9#9#9#9#9#9#9'where id_reg_vigente = 1'
      #9#9#9#9#9#9#9#9#9') p'
      
        #9#9#9#9#9#9#9#9#9'where p.id_contrato in (select id_contrato from contrat' +
        'o '
      
        #9#9#9#9#9#9#9#9#9#9'  '#9#9#9'  '#9' where id_titular in (nvl(:petitular, id_titul' +
        'ar)) and id_contrato is not null)'
      
        #9#9#9#9#9#9#9#9#9#9'/*---and    not exists ( select p.id_credito from cr_c' +
        'on_reg_cci cci where cci.id_reg_vigente = 1 and cci.id_credito =' +
        ' p.id_credito)*/'
      #9#9#9#9#9#9#9#9#9'  /*------ /para pruebas*/'
      #9#9#9#9#9#9#9#9#9')'
      #9#9') dat where 2 = 2 '
      #9#9'and RESERVA_ANT + RESERVA_ACT <> 0'
      #9') where 2 = 2'
      ') where Rn = 1  '
      'order by id_acreditado, id_contrato')
    Left = 96
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'messanio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'messanio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'mant'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'messanio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'messanio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'mant'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'messanio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'mant'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'messanio'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'messanio'#9#9#9#9#9#9
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'messanio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'messanio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'mant'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'petitular'
        ParamType = ptInput
      end>
    object qryVistaLineasID_ACREDITADO: TFloatField
      DisplayLabel = 'Id Acreditado'
      DisplayWidth = 12
      FieldName = 'ID_ACREDITADO'
    end
    object qryVistaLineasNOMBRE: TStringField
      DisplayLabel = 'Nombre del Acreditado'
      DisplayWidth = 60
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qryVistaLineasID_PERS_ASOCIAD: TFloatField
      DisplayLabel = 'Id Asociado'
      FieldName = 'ID_PERS_ASOCIAD'
    end
    object qryVistaLineasASOCIADO: TStringField
      DisplayLabel = 'Nombre del Asociado'
      DisplayWidth = 60
      FieldName = 'ASOCIADO'
      Size = 80
    end
    object qryVistaLineasID_PROM_ADMON: TFloatField
      DisplayLabel = 'Id Administrador'
      FieldName = 'ID_PROM_ADMON'
    end
    object qryVistaLineasADMINISTRADOR: TStringField
      DisplayLabel = 'Nombre del Administrador'
      DisplayWidth = 60
      FieldName = 'ADMINISTRADOR'
      Size = 80
    end
    object qryVistaLineasCVE_METODOLOGIA: TStringField
      DisplayLabel = 'Cve. Met.'
      DisplayWidth = 8
      FieldName = 'CVE_METODOLOGIA'
      Size = 2
    end
    object qryVistaLineasDESC_CLAVE: TStringField
      DisplayLabel = 'Metodología'
      DisplayWidth = 25
      FieldName = 'DESC_CLAVE'
      Size = 80
    end
    object qryVistaLineasCVE_GRUPO_ECO: TStringField
      DisplayLabel = 'Cve Gpo Eco'
      DisplayWidth = 12
      FieldName = 'CVE_GRUPO_ECO'
      Size = 6
    end
    object qryVistaLineasDESC_GRUPO_ECO: TStringField
      DisplayLabel = 'Grupo Económico'
      DisplayWidth = 35
      FieldName = 'DESC_GRUPO_ECO'
      Size = 250
    end
    object qryVistaLineasCVE_CAT_MIN: TStringField
      DisplayLabel = 'Cat Mínimo'
      DisplayWidth = 15
      FieldName = 'CVE_CAT_MIN'
    end
    object qryVistaLineasDESC_CAT_MINIMO: TStringField
      DisplayLabel = 'Catálogo Mínimo'
      DisplayWidth = 30
      FieldName = 'DESC_CAT_MINIMO'
      Size = 255
    end
    object qryVistaLineasID_CONTRATO: TFloatField
      DisplayLabel = 'Línea'
      FieldName = 'ID_CONTRATO'
    end
    object qryVistaLineasRESERVA_L_ANT: TFloatField
      DisplayLabel = 'Reserva Línea f1'
      DisplayWidth = 18
      FieldName = 'RESERVA_L_ANT'
      EditFormat = '###,###,###,###,###.00'
    end
    object qryVistaLineasRESERVA_ACRE_ANT: TFloatField
      DisplayLabel = 'Reserva Acreditado f1'
      DisplayWidth = 18
      FieldName = 'RESERVA_ACRE_ANT'
      EditFormat = '###,###,###,###,###.00'
    end
    object qryVistaLineasTOTAL_LINEA_ANT: TFloatField
      DisplayLabel = 'Total Línea f1'
      DisplayWidth = 18
      FieldName = 'TOTAL_LINEA_ANT'
      EditFormat = '###,###,###,###,###.00'
    end
    object qryVistaLineasTOTAL_ACRE_ANT: TFloatField
      DisplayLabel = 'Total Acreditado f1'
      DisplayWidth = 18
      FieldName = 'TOTAL_ACRE_ANT'
      EditFormat = '###,###,###,###,###.00'
    end
    object qryVistaLineasPCT_RESERVA_ANT: TFloatField
      DisplayLabel = '% Reserva f1'
      DisplayWidth = 12
      FieldName = 'PCT_RESERVA_ANT'
    end
    object qryVistaLineasTC_ANT: TFloatField
      DisplayLabel = 'TC f1'
      DisplayWidth = 10
      FieldName = 'TC_ANT'
    end
    object qryVistaLineasCALIF_ANT: TStringField
      DisplayLabel = 'Calif f1'
      DisplayWidth = 10
      FieldName = 'CALIF_ANT'
      Size = 5
    end
    object qryVistaLineasRESERVA_L_ACT: TFloatField
      DisplayLabel = 'Reserva Línea f1+t'
      DisplayWidth = 18
      FieldName = 'RESERVA_L_ACT'
      EditFormat = '###,###,###,###,###.00'
    end
    object qryVistaLineasRESERVA_ACRE_ACT: TFloatField
      DisplayLabel = 'Reserva Acreditado f1+t'
      DisplayWidth = 18
      FieldName = 'RESERVA_ACRE_ACT'
      EditFormat = '###,###,###,###,###.00'
    end
    object qryVistaLineasTOTAL_LINEA_ACT: TFloatField
      DisplayLabel = 'Total Línea f1+t'
      DisplayWidth = 18
      FieldName = 'TOTAL_LINEA_ACT'
      EditFormat = '###,###,###,###,###.00'
    end
    object qryVistaLineasTOTAL_ACRE_ACT: TFloatField
      DisplayLabel = 'Total Acreditado f1+t'
      DisplayWidth = 18
      FieldName = 'TOTAL_ACRE_ACT'
      EditFormat = '###,###,###,###,###.00'
    end
    object qryVistaLineasPCT_RESERVA_ACT: TFloatField
      DisplayWidth = 12
      FieldName = 'PCT_RESERVA_ACT'
    end
    object qryVistaLineasTC_ACT: TFloatField
      DisplayLabel = 'TC f1+t'
      DisplayWidth = 10
      FieldName = 'TC_ACT'
    end
    object qryVistaLineasCALIF_ACT: TStringField
      DisplayLabel = 'Calif f1+t'
      DisplayWidth = 10
      FieldName = 'CALIF_ACT'
      Size = 5
    end
    object qryVistaLineasGTOT_RESERVA_POR_L: TFloatField
      DisplayLabel = 'Dif Reserva Línea'
      DisplayWidth = 18
      FieldName = 'GTOT_RESERVA_POR_L'
      EditFormat = '###,###,###,###,###.00'
    end
    object qryVistaLineasGTOT_POR_LINEA: TFloatField
      DisplayLabel = 'Dif Saldo Línea'
      DisplayWidth = 18
      FieldName = 'GTOT_POR_LINEA'
      EditFormat = '###,###,###,###,###.00'
    end
    object qryVistaLineasGTOT_RESERVA_ACRE: TFloatField
      DisplayLabel = 'Dif Reserva Acreditado'
      DisplayWidth = 18
      FieldName = 'GTOT_RESERVA_ACRE'
      EditFormat = '###,###,###,###,###.00'
    end
    object qryVistaLineasGTOT_ACREDITADO: TFloatField
      DisplayLabel = 'Dif Saldo Acreditado'
      DisplayWidth = 18
      FieldName = 'GTOT_ACREDITADO'
      EditFormat = '###,###,###,###,###.00'
    end
    object qryVistaLineasCVE_MONEDA: TFloatField
      DisplayLabel = 'Cve Moneda'
      DisplayWidth = 10
      FieldName = 'CVE_MONEDA'
    end
    object qryVistaLineasDESC_MONEDA: TStringField
      DisplayLabel = 'Moneda'
      FieldName = 'DESC_MONEDA'
    end
    object qryVistaLineasSITUACION: TStringField
      FieldName = 'SITUACION'
      Size = 15
    end
  end
  object Database1: TDatabase
    AliasName = 'BCORP'
    DatabaseName = 'BCORP'
    Params.Strings = (
      'USER NAME=sistemas')
    SessionName = 'Default'
    Left = 191
    Top = 112
  end
  object qryVistaAcreditado: TQuery
    DatabaseName = 'BCORP'
    SQL.Strings = (
      'select'
      'id_acreditado, nombre, cve_grupo_eco, desc_grupo_eco, '
      
        'reserva_acre_ant, total_acre_ant, reserva_acre_act, total_acre_a' +
        'ct,'
      '(reserva_acre_act - reserva_acre_ant) gtot_reserva_acre,'
      '(total_acre_act - total_acre_ant) gtot_acreditado'
      'from ('
      #9' /* */'
      #9'select '
      
        #9'id_acreditado, nombre, id_pers_asociad, asociado, id_prom_admon' +
        ', administrador, cve_metodologia, desc_clave, cve_grupo_eco, des' +
        'c_grupo_eco, '
      #9'cve_cat_min, desc_cat_minimo, id_contrato, id_credito, '
      
        #9'nvl(reserva_ant, 0) reserva_ant, nvl(reserva_l_ant, 0) reserva_' +
        'l_ant, nvl(reserva_acre_ant, 0) reserva_acre_ant, '
      
        #9'nvl(total_ant, 0) total_ant, nvl(total_linea_ant, 0) total_line' +
        'a_ant, '
      #9'nvl(total_acre_ant, 0) total_acre_ant, tc_ant, '
      #9'(calif_exp_ant || '#39' '#39' ||calif_cub_ant) calif_ant,'
      
        #9'nvl(total_act, 0) total_act, nvl(total_linea_act, 0) total_line' +
        'a_act, nvl(total_acre_act, 0) total_acre_act, '
      
        #9'nvl(reserva_act, 0) reserva_act, nvl(reserva_l_act, 0) reserva_' +
        'l_act, '
      #9'nvl(reserva_acre_act, 0) reserva_acre_act, tc_act, '
      #9'(calif_exp_act || '#39' '#39' || calif_cub_act) calif_act,'
      #9'cve_moneda, desc_moneda'
      
        #9',row_number () over (partition by id_acreditado order by id_acr' +
        'editado) rn'
      #9',status_1'
      #9'from ('
      #9#9'select'
      
        #9#9#9'dat.id_acreditado, nombre, id_pers_asociad, asociado, id_prom' +
        '_admon,'
      
        #9#9#9'administrador, cve_metodologia, desc_clave, cve_grupo_eco, de' +
        'sc_grupo_eco,'
      #9#9#9'cve_cat_min, desc_cat_minimo,'
      
        #9#9#9'id_contrato, id_credito, reserva_ant, reserva_l_ant, reserva_' +
        'acre_ant, total_ant,'
      
        #9#9#9'sum(total_ant) over (partition by dat.id_acreditado, id_contr' +
        'ato '
      
        #9#9#9'                                     order by dat.id_acredita' +
        'do, id_contrato) total_linea_ant, '
      #9#9#9'sum(total_ant) over (partition by dat.id_acreditado '
      
        #9#9#9'                                     order by dat.id_acredita' +
        'do) total_acre_ant, '
      #9#9#9'tc_ant, '
      
        #9#9#9'case when calif_cub_ant = '#39'NA'#39' then '#39'SC'#39' else calif_cub_ant e' +
        'nd calif_cub_ant, '
      
        #9#9#9'case when calif_exp_ant = '#39'NA'#39' then '#39'SC'#39' else calif_exp_ant e' +
        'nd calif_exp_ant,'
      
        #9#9#9'reserva_act, reserva_l_act, reserva_acre_act, tc_act, total_a' +
        'ct,'
      
        #9#9#9'sum(total_act) over (partition by dat.id_acreditado, id_contr' +
        'ato '
      
        #9#9#9'                                     order by dat.id_acredita' +
        'do, id_contrato) total_linea_act, '
      #9#9#9'sum(total_act) over (partition by dat.id_acreditado '
      
        #9#9#9'                                     order by dat.id_acredita' +
        'do) total_acre_act, '
      
        #9#9#9'case when calif_cub_act = '#39'NA'#39' then '#39'SC'#39' else calif_cub_act e' +
        'nd calif_cub_act, '
      
        #9#9#9'case when calif_exp_act = '#39'NA'#39' then '#39'SC'#39' else calif_exp_act e' +
        'nd calif_exp_act,'
      #9#9#9'cve_moneda, desc_moneda, status_1'
      #9#9'from ( '
      #9#9#9'select'
      #9#9#9'----id_contrato, cte.id_acreditado, ---- Eliminar '
      #9#9#9'impsicc.id_credito,'
      #9#9'    impsicc.mes_ant reserva_ant,'
      
        #9#9#9'sum(impsicc.mes_ant) over (partition by id_acreditado, id_con' +
        'trato '
      
        #9#9#9'                                     order by id_acreditado, ' +
        'id_contrato) reserva_l_ant,'
      #9#9#9'sum(impsicc.mes_ant) over (partition by id_acreditado '
      
        #9#9#9'                                     order by id_acreditado) ' +
        'reserva_acre_ant, '
      #9#9#9'impsicc.mes_act reserva_act,'
      
        #9#9#9'sum(impsicc.mes_act) over (partition by id_acreditado, id_con' +
        'trato '
      
        #9#9#9'                                     order by id_acreditado, ' +
        'id_contrato) reserva_l_act, '
      #9#9#9'sum(impsicc.mes_act) over (partition by id_acreditado '
      
        #9#9#9'                                     order by id_acreditado) ' +
        'reserva_acre_act, '
      #9#9#9'(saldoant * tc_ant) total_ant,'
      #9#9'    (saldoact * tc_act) total_act,'
      #9#9#9'tc_ant, tc_act,'#9#9#9#9#9#9#9#9#9#9#9'  '
      #9#9#9'max(calif_cub_ant) over (partition by id_acreditado '
      
        #9#9#9#9'                                    order by id_acreditado, ' +
        'calif_cub_ant asc) calif_cub_ant,'
      #9#9#9'max(calif_exp_ant) over (partition by id_acreditado '
      
        #9#9#9#9'                                    order by id_acreditado, ' +
        'calif_exp_ant asc) calif_exp_ant,'
      #9#9#9'max(calif_cub_act) over (partition by id_acreditado '
      
        #9#9#9#9'                                    order by id_acreditado, ' +
        'calif_cub_act asc) calif_cub_act,'
      #9#9#9'max(calif_exp_act) over (partition by id_acreditado '
      
        #9#9#9#9'                                    order by id_acreditado, ' +
        'calif_exp_act asc) calif_exp_act,'
      #9#9#9'saldoant, saldoact, id_contrato, id_acreditado, nombre, '
      
        #9#9#9'id_pers_asociad ,asociado, id_prom_admon, administrador, cve_' +
        'moneda, desc_moneda,'
      
        #9#9#9'cve_producto, nom_producto, case when substr(cve_cat_min, 1,2' +
        ') = '#39'73'#39' then '#39'1'#39' else cve_metodologia end cve_metodologia, '
      
        #9#9#9'case when substr(cve_cat_min, 1,2) = '#39'73'#39' then '#39'Metodología I' +
        'ndividual'#39' else desc_clave end desc_clave, '
      #9#9#9'cve_grupo_eco, '
      #9#9#9'desc_grupo_eco, cve_cat_min, desc_cat_minimo, rn'
      #9#9#9',status_1'
      #9#9#9'from ('
      #9#9#9#9' select sicc.id_credito,'
      
        #9#9#9#9#9#9' nvl (sic1.imp_reserva_exp, 0) + nvl (sic1.imp_reserva_cub' +
        ', 0) mes_ant,'
      
        #9#9#9#9#9#9' nvl (sic2.imp_reserva_exp + sic2.imp_reserva_cub, 0) mes_' +
        'act'
      #9#9#9#9#9#9' /*---- calificaciones*/'
      
        #9#9#9#9#9#9' ,sic1.cve_calific_cub calif_cub_ant, sic1.cve_calific_exp' +
        ' calif_exp_ant'
      
        #9#9#9#9#9#9' ,sic2.cve_calific_cub calif_cub_act, sic2.cve_calific_exp' +
        ' calif_exp_act'
      #9#9#9#9#9#9' /*---- /calificaciones'
      #9#9#9#9#9#9' ---- saldos de consolidado*/'
      #9#9#9#9#9#9' ,saldoant'
      #9#9#9#9#9#9' ,saldoact'
      #9#9#9#9#9#9' /*---- saldos de consolidado*/'
      #9#9#9#9#9'from (select distinct id_credito'
      #9#9#9#9#9#9#9#9#9' from cr_sicc_califica'
      #9#9#9#9#9#9#9#9#9'where 2 = 2 '
      #9#9#9#9#9#9#9#9#9'  and anio_mes between 200901 and :messanio'
      #9#9#9#9#9#9#9#9#9'  and vigente = 1'
      #9#9#9#9#9#9#9#9' order by id_credito) sicc,'
      #9#9#9#9#9#9' (select   id_credito'
      #9#9#9#9#9#9#9'  from (select sic0.anio_mes, sic0.id_credito,'
      #9#9#9#9#9#9#9#9' sic0.imp_reserva_exp  + sic0.imp_reserva_cub as reserva'
      #9#9#9#9#9#9#9' from cr_sicc_califica sic0'
      #9#9#9#9#9#9#9'where 1 = 1'
      
        #9#9#9#9#9#9#9'  and sic0.anio_mes >= to_number(to_char(add_months(to_da' +
        'te (:messanio,'#39'YYYYMM'#39'),-:mant),'#39'YYYYMM'#39'))'
      
        #9#9#9#9#9#9#9'  and sic0.anio_mes <= to_number(to_char(to_date (:messan' +
        'io,'#39'YYYYMM'#39'),'#39'YYYYMM'#39'))'
      #9#9#9#9#9#9#9'  and sic0.vigente = 1'
      #9#9#9#9#9#9#9#9#9')'
      #9#9#9#9#9#9'  group by id_credito'
      #9#9#9#9#9#9'  order by id_credito) sic0,'
      #9#9#9#9#9#9' (select cscc.id_credito, anio_mes, '
      
        #9#9#9#9#9#9#9#9' imp_cubierto, imp_expuesto, cve_calific_cub, cve_califi' +
        'c_exp,'
      #9#9#9#9#9#9#9#9' imp_reserva_cub, imp_reserva_exp, cont.id_contrato'
      
        #9#9#9#9#9#9#9#9' ,pkgcrppo.funobtsdo(cscc.id_credito, to_char(trunc(last' +
        '_day( add_months(to_date(to_char(:messanio), '#39'yyyymm'#39'),-:mant ) ' +
        ')), '#39'dd/mm/yyyy'#39'), '#39'INSOLUTO'#39', '#39#39') saldoant '
      #9#9#9#9#9#9#9'from cr_sicc_califica cscc'
      #9#9#9#9#9#9#9'left join( --acreditado,contrato,credito '
      #9#9#9#9#9#9#9#9#9'  select con.id_contrato, cre.id_credito'
      #9#9#9#9#9#9#9#9#9'  from cr_acreditado ac'
      
        #9#9#9#9#9#9#9#9#9'  inner join contrato con on (con.id_titular = ac.id_ac' +
        'reditado)'
      
        #9#9#9#9#9#9#9#9#9'  inner join cr_credito cre on (cre.id_contrato = con.i' +
        'd_contrato) '
      #9#9#9#9#9#9#9#9#9'union'
      #9#9#9#9#9#9#9#9#9'  select con.id_contrato, cre.id_credito'
      #9#9#9#9#9#9#9#9#9'  from cre_cliente ac'
      
        #9#9#9#9#9#9#9#9#9'  inner join contrato con on (con.id_titular = ac.id_pe' +
        'rsona)'
      
        #9#9#9#9#9#9#9#9#9'  inner join cre_credito cre on (cre.id_contrato = con.' +
        'id_contrato) '
      #9#9#9#9#9#9#9#9#9') cont on (cscc.id_credito = cont.id_credito)'
      #9#9#9#9#9#9#9#9'   where cscc.vigente  =1'
      
        #9#9#9#9#9#9#9'   and cscc.anio_mes  = to_number (to_char (add_months (t' +
        'o_date (:messanio, '#39'YYYYMM'#39'),-:mant ), '#39'YYYYMM'#39'))'
      #9#9#9#9#9#9' ) sic1,   /*---- mes anterior*/'
      #9#9#9#9#9#9' ('
      #9#9#9#9#9#9#9'select cscc.id_credito, anio_mes, '
      
        #9#9#9#9#9#9#9#9' imp_cubierto, imp_expuesto, cve_calific_cub, cve_califi' +
        'c_exp,'
      #9#9#9#9#9#9#9#9' imp_reserva_cub, imp_reserva_exp, cont.id_contrato'
      
        #9#9#9#9#9#9#9#9' ,pkgcrppo.funobtsdo(cscc.id_credito, to_char(trunc(last' +
        '_day(to_date(to_char(:messanio), '#39'yyyymm'#39'))), '#39'dd/mm/yyyy'#39'), '#39'IN' +
        'SOLUTO'#39', '#39#39') saldoact'
      #9#9#9#9#9#9#9'from cr_sicc_califica cscc'
      #9#9#9#9#9#9#9'left join( /*--acreditado,contrato,credito */'
      #9#9#9#9#9#9#9#9#9'  select con.id_contrato, cre.id_credito'
      #9#9#9#9#9#9#9#9#9'  from cr_acreditado ac'
      
        #9#9#9#9#9#9#9#9#9'  inner join contrato con on (con.id_titular = ac.id_ac' +
        'reditado)'
      
        #9#9#9#9#9#9#9#9#9'  inner join cr_credito cre on (cre.id_contrato = con.i' +
        'd_contrato) '
      #9#9#9#9#9#9#9#9#9'union'
      #9#9#9#9#9#9#9#9#9'  select con.id_contrato, cre.id_credito'
      #9#9#9#9#9#9#9#9#9'  from cre_cliente ac'
      
        #9#9#9#9#9#9#9#9#9'  inner join contrato con on (con.id_titular = ac.id_pe' +
        'rsona)'
      
        #9#9#9#9#9#9#9#9#9'  inner join cre_credito cre on (cre.id_contrato = con.' +
        'id_contrato) '
      #9#9#9#9#9#9#9#9#9') cont on (cscc.id_credito = cont.id_credito)'
      #9#9#9#9#9#9#9#9'   where cscc.vigente  =1'
      #9#9#9#9#9#9#9'and cscc.anio_mes  = :messanio'#9#9#9#9#9#9'   '
      #9#9#9#9#9#9' ) sic2  /*---- mes actual*/'
      #9#9#9#9'   where sicc.id_credito = sic0.id_credito(+)'
      #9#9#9#9#9' and sicc.id_credito = sic1.id_credito(+)'
      #9#9#9#9#9' and sicc.id_credito = sic2.id_credito(+)'
      #9#9#9#9#9' /*--- para pruebas en la seccion de importes de reserva*/'
      #9#9#9#9#9' /*and sicc.id_credito in ('
      #9#9#9#9#9#9#9#9#9#9#9')*/'
      #9#9#9#9#9#9#9') impsicc'
      #9#9#9'left join ( '
      #9#9#9#9'    /*---- datos del cliente*/'
      #9#9#9#9#9'select'
      
        #9#9#9#9#9'id_contrato, id_credito, cte.id_acreditado, nombre, id_pers' +
        '_asociad,'
      
        #9#9#9#9#9'asociado, id_prom_admon, administrador, cve_moneda, desc_mo' +
        'neda,'
      #9#9#9#9#9'cve_producto, nom_producto, cve_metodologia,'
      #9#9#9#9#9'desc_clave, cve_grupo_eco, desc_grupo_eco'
      #9#9#9#9#9',cve_cat_min, desc_cat_minimo,'
      #9#9#9#9#9'case when cve_moneda = 484 then 1 else'
      
        #9#9#9#9#9'pkgcorpo.obttipocambio(pkgrptregcr.funobtfliq('#39'FMAC'#39','#39'D002'#39 +
        ',to_char(trunc(last_day(to_date(to_char(:messanio), '#39'yyyymm'#39'))),' +
        ' '#39'dd/mm/yyyy'#39')), 840 , '#39'V'#39' ) '
      #9#9#9#9#9'end tc_act,'
      #9#9#9#9#9'case when cve_moneda = 484 then 1 else'
      
        #9#9#9#9#9'pkgcorpo.obttipocambio(pkgrptregcr.funobtfliq('#39'FMAC'#39','#39'D002'#39 +
        ',to_char(trunc(last_day(add_months(to_date(to_char(:messanio), '#39 +
        'yyyymm'#39'),-:mant ))), '#39'dd/mm/yyyy'#39')), 840 , '#39'V'#39' ) '
      #9#9#9#9#9'end tc_ant'
      
        #9#9#9#9#9',row_number () over (partition by cte.id_acreditado, id_con' +
        'trato, id_credito'
      
        #9#9#9#9#9#9#9#9'                                     order by cte.id_acr' +
        'editado) rn'
      #9#9#9#9#9',status_1'
      #9#9#9#9#9'from ('
      #9#9#9#9#9'      /*---- icre01*/'
      
        #9#9#9#9#9#9'  select cto.id_contrato, cre.id_credito, ac.id_acreditado' +
        ', per.nombre'
      #9#9#9#9#9#9'  '#9#9' ,cto.id_pers_asociad, pas.nombre asociado '
      #9#9#9#9#9#9#9#9' ,ccto.id_prom_admon, pad.nombre administrador'
      #9#9#9#9#9#9#9#9' ,cto.cve_moneda, m.desc_moneda'
      
        #9#9#9#9#9#9#9#9' ,ccto.cve_producto_cre cve_producto, prod.desc_l_produc' +
        'to nom_producto'
      #9#9#9#9#9#9#9#9' ,prod.cve_clas_contab cve_cat_min, cart.desc_cat_minimo'
      #9#9#9#9#9#9'  from cr_acreditado ac'
      
        #9#9#9#9#9#9'  inner join contrato cto on (cto.id_titular = ac.id_acred' +
        'itado)'
      
        #9#9#9#9#9#9'  inner join cr_contrato ccto on (ccto.id_contrato = cto.i' +
        'd_contrato)'
      
        #9#9#9#9#9#9'  inner join cr_producto prod on (prod.cve_producto_cre = ' +
        'ccto.cve_producto_cre)'
      
        #9#9#9#9#9#9'  inner join cr_cat_minimo cart on (cart.cve_cat_minimo = ' +
        'prod.cve_clas_contab) '
      
        #9#9#9#9#9#9'  inner join cr_credito cre on (cre.id_contrato = cto.id_c' +
        'ontrato)'
      
        #9#9#9#9#9#9'  inner join persona per on (per.id_persona = ac.id_acredi' +
        'tado)'
      
        #9#9#9#9#9#9'  inner join persona pas on (pas.id_persona = cto.id_pers_' +
        'asociad)'
      
        #9#9#9#9#9#9'  inner join persona pad on (pad.id_persona = ccto.id_prom' +
        '_admon)'
      #9#9#9#9#9#9'  inner join moneda m on (m.cve_moneda = cto.cve_moneda)'
      #9#9#9#9#9#9'  where 2 = 2'
      
        #9#9#9#9#9#9'  and    not exists ( select cre.id_credito from cr_con_re' +
        'g_cci cci where cci.id_reg_vigente = 1 and cci.id_credito = cre.' +
        'id_credito)'
      #9#9#9#9#9'   union'
      #9#9#9#9#9#9'  /*---- intercreditos*/'
      
        #9#9#9#9#9#9'  select cto.id_contrato, cre.id_credito, ac.id_persona id' +
        '_acreditado, per.nombre'
      #9#9#9#9#9#9'  '#9#9' ,cto.id_pers_asociad, pas.nombre asociado '
      #9#9#9#9#9#9#9#9' ,ac.id_prom_adm, pad.nombre administrador'
      #9#9#9#9#9#9#9#9' ,cto.cve_moneda, m.desc_moneda'
      
        #9#9#9#9#9#9#9#9' ,dprod.cve_producto cve_producto, dprod.desc_producto n' +
        'om_producto'
      #9#9#9#9#9#9#9#9' ,ccto.cve_cat_min, cart.desc_cat_min'
      #9#9#9#9#9#9'  from cre_cliente ac'
      
        #9#9#9#9#9#9'  inner join contrato cto on (cto.id_titular = ac.id_perso' +
        'na)'
      
        #9#9#9#9#9#9'  inner join cre_contrato ccto on (ccto.id_contrato = cto.' +
        'id_contrato)'
      
        #9#9#9#9#9#9'  inner join producto dprod on (dprod.cve_producto = cto.c' +
        've_producto)'
      
        #9#9#9#9#9#9'  left  join cre_cat_minimo cart on (cart.cve_cat_min = cc' +
        'to.cve_cat_min)'
      
        #9#9#9#9#9#9'  inner join cre_credito cre on (cre.id_contrato = cto.id_' +
        'contrato)'
      
        #9#9#9#9#9#9'  inner join persona per on (per.id_persona = ac.id_person' +
        'a)'
      
        #9#9#9#9#9#9'  inner join persona pas on (pas.id_persona = cto.id_pers_' +
        'asociad)'
      
        #9#9#9#9#9#9'  inner join persona pad on (pad.id_persona = ac.id_prom_a' +
        'dm)'
      #9#9#9#9#9#9'  inner join moneda m on (m.cve_moneda = cto.cve_moneda)'
      #9#9#9#9#9'   union'
      #9#9#9#9#9'      /*---- cartas de credito*/'
      
        #9#9#9#9#9#9'  select cto.id_contrato, cre.id_credito, ac.id_acreditado' +
        ', per.nombre'
      #9#9#9#9#9#9'  '#9#9' ,cto.id_pers_asociad, pas.nombre asociado '
      #9#9#9#9#9#9#9#9' ,ccto.id_prom_admon, pad.nombre administrador'
      #9#9#9#9#9#9#9#9' ,cto.cve_moneda, m.desc_moneda'
      
        #9#9#9#9#9#9#9#9' ,ccto.cve_producto_cre cve_producto, prod.desc_l_produc' +
        'to nom_producto'
      #9#9#9#9#9#9#9#9' ,prod.cve_clas_contab cve_cat_min, cart.desc_cat_minimo'
      #9#9#9#9#9#9'  from cr_acreditado ac'
      
        #9#9#9#9#9#9'  inner join contrato cto on (cto.id_titular = ac.id_acred' +
        'itado)'
      
        #9#9#9#9#9#9'  inner join cr_contrato ccto on (ccto.id_contrato = cto.i' +
        'd_contrato)'
      
        #9#9#9#9#9#9'  inner join cr_producto prod on (prod.cve_producto_cre = ' +
        'ccto.cve_producto_cre)'
      
        #9#9#9#9#9#9'  inner join cr_cat_minimo cart on (cart.cve_cat_minimo = ' +
        'prod.cve_clas_contab)'
      
        #9#9#9#9#9#9'  inner join cr_con_reg_cci  cre on (cre.id_contrato = cto' +
        '.id_contrato)'
      
        #9#9#9#9#9#9'  inner join persona per on (per.id_persona = ac.id_acredi' +
        'tado)'
      
        #9#9#9#9#9#9'  inner join persona pas on (pas.id_persona = cto.id_pers_' +
        'asociad)'
      
        #9#9#9#9#9#9'  inner join persona pad on (pad.id_persona = ccto.id_prom' +
        '_admon)'
      #9#9#9#9#9#9'  inner join moneda m on (m.cve_moneda = cto.cve_moneda)'
      #9#9#9#9#9#9') cte'
      #9#9#9#9#9#9'left join ('
      
        #9#9#9#9#9#9#9#9'select acre.id_acreditado, acre.cve_metodologia, dt.desc' +
        '_clave, acre.cve_grupo_eco, gpoe.desc_grupo_eco '
      #9#9#9#9#9#9#9#9'from cr_acreditado acre'
      
        #9#9#9#9#9#9#9#9'left join cr_grupo_eco gpoe on (gpoe.cve_grupo_eco = acr' +
        'e.cve_grupo_eco)'
      
        #9#9#9#9#9#9#9#9'left join cr_con_cat_data dt on (dt.cve_clave = acre.cve' +
        '_metodologia and dt.cve_con_gpo_cat = '#39'CAT_METODOLOGIA'#39')'
      #9#9#9#9#9#9#9#9'where acre.id_acreditado is not null'
      #9#9#9#9#9#9#9'union'
      
        #9#9#9#9#9#9#9#9'select acre.id_persona id_acreditado, acre.cve_metodolog' +
        'ia, dt.desc_clave, acre.cve_grupo cve_grupo_eco, gpoe.desc_grupo' +
        ' desc_grupo_eco '
      #9#9#9#9#9#9#9#9'from cre_cliente acre'
      
        #9#9#9#9#9#9#9#9'left join cre_grupo_empr gpoe on (gpoe.cve_grupo = acre.' +
        'cve_grupo)'
      
        #9#9#9#9#9#9#9#9'left join cr_con_cat_data dt on (dt.cve_clave = acre.cve' +
        '_metodologia and dt.cve_con_gpo_cat = '#39'CAT_METODOLOGIA'#39')'
      #9#9#9#9#9#9#9#9'where acre.id_persona is not null'
      #9#9#9#9#9#9#9#9') met on (met.id_acreditado = cte.id_acreditado)'
      #9#9#9#9#9#9'left join ('
      #9#9#9#9#9#9#9#9'select (case'
      #9#9#9#9#9#9#9#9'           when count (id_acreditado) = 0 then '#39'  '#39
      
        #9#9#9#9#9#9#9#9'           when count (id_acreditado) > 0 then '#39'En Recup' +
        'eración'#39
      #9#9#9#9#9#9#9#9'           else '#39'CE'#39
      #9#9#9#9#9#9#9#9'        end) as status_1, id_acreditado'
      #9#9#9#9#9#9#9#9'  from cr_acre_re'
      
        #9#9#9#9#9#9#9#9' where 2 = 2 --and to_date ('#39'31/05/2013'#39', '#39'DD/MM/YYYY'#39') ' +
        '>= f_alta_recu'
      #9#9#9#9#9#9#9#9'   and f_baja_recu is null'
      #9#9#9#9#9#9#9#9' group by id_acreditado'#9#9#9#9#9#9
      #9#9#9#9#9#9') st on (st.id_acreditado = cte.id_acreditado)'
      #9#9#9#9#9#9'where 2 = 2 '
      
        #9#9#9#9#9#9'/*---and cte.id_acreditado = 189319  ----solo pruebas de l' +
        'a seccion del cliente */'
      #9#9#9#9#9'/*---- /datos del cliente */'
      #9#9#9#9') cte on (cte.id_credito = impsicc.id_credito and rn = 1)'
      #9#9#9'where 2 = 2 '
      #9#9#9'and impsicc.id_credito in ( /*------ para pruebas*/'
      #9#9#9#9#9#9#9#9#9'select id_credito from ('
      #9#9#9#9#9#9#9#9#9#9'select id_credito, id_contrato, f_alta from cr_credito'
      #9#9#9#9#9#9#9#9#9#9'union'
      
        #9#9#9#9#9#9#9#9#9#9'select id_credito, id_contrato, f_captura_cred from cr' +
        'e_credito'
      #9#9#9#9#9#9#9#9#9#9'union'
      
        #9#9#9#9#9#9#9#9#9#9'select id_credito, id_contrato, fh_alta f_alta from cr' +
        '_con_reg_cci '
      #9#9#9#9#9#9#9#9#9#9'where id_reg_vigente = 1'
      #9#9#9#9#9#9#9#9#9') p'
      
        #9#9#9#9#9#9#9#9#9'where p.id_contrato in (select id_contrato from contrat' +
        'o '
      
        #9#9#9#9#9#9#9#9#9#9'  '#9#9#9'  '#9' where id_titular in (nvl(:petitular, id_titul' +
        'ar)) and id_contrato is not null)'
      
        #9#9#9#9#9#9#9#9#9#9'/*---and    not exists ( select p.id_credito from cr_c' +
        'on_reg_cci cci where cci.id_reg_vigente = 1 and cci.id_credito =' +
        ' p.id_credito)*/'
      #9#9#9#9#9#9#9#9#9'  /*------ /para pruebas*/'
      #9#9#9#9#9#9#9#9#9')'
      #9#9') dat where 2 = 2 '
      #9#9'and RESERVA_ANT + RESERVA_ACT <> 0'
      #9') where 2 = 2'
      ') where Rn = 1  '
      'order by id_acreditado, id_contrato')
    Left = 95
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'messanio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'messanio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'messanio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'messanio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'messanio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'messanio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'messanio'#9#9#9#9#9#9
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'messanio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'messanio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'petitular'
        ParamType = ptUnknown
      end>
    object qryVistaAcreditadoID_ACREDITADO: TFloatField
      DisplayLabel = 'Id Acreditado'
      DisplayWidth = 12
      FieldName = 'ID_ACREDITADO'
    end
    object qryVistaAcreditadoNOMBRE: TStringField
      DisplayLabel = 'Nombre'
      DisplayWidth = 60
      FieldName = 'NOMBRE'
      Size = 80
    end
    object qryVistaAcreditadoCVE_GRUPO_ECO: TStringField
      DisplayLabel = 'Cve. Gpo Eco.'
      DisplayWidth = 12
      FieldName = 'CVE_GRUPO_ECO'
      Size = 6
    end
    object qryVistaAcreditadoDESC_GRUPO_ECO: TStringField
      DisplayLabel = 'Grupo Económico'
      DisplayWidth = 35
      FieldName = 'DESC_GRUPO_ECO'
      Size = 250
    end
    object qryVistaAcreditadoRESERVA_ACRE_ANT: TFloatField
      DisplayLabel = 'Reservas por Acreditado (f1)'
      DisplayWidth = 18
      FieldName = 'RESERVA_ACRE_ANT'
      EditFormat = '###,###,###,###,###.00'
    end
    object qryVistaAcreditadoTOTAL_ACRE_ANT: TFloatField
      DisplayLabel = 'Total por Acreditado (f1)'
      DisplayWidth = 18
      FieldName = 'TOTAL_ACRE_ANT'
      EditFormat = '###,###,###,###,###.00'
    end
    object qryVistaAcreditadoRESERVA_ACRE_ACT: TFloatField
      DisplayLabel = 'Reservas por Acreditado (f1+t)'
      DisplayWidth = 18
      FieldName = 'RESERVA_ACRE_ACT'
      EditFormat = '###,###,###,###,###.00'
    end
    object qryVistaAcreditadoTOTAL_ACRE_ACT: TFloatField
      DisplayLabel = 'Total por Acreditado (f1+t)'
      DisplayWidth = 18
      FieldName = 'TOTAL_ACRE_ACT'
      EditFormat = '###,###,###,###,###.00'
    end
    object qryVistaAcreditadoGTOT_RESERVA_ACRE: TFloatField
      DisplayLabel = 'Comparación Resevas'
      DisplayWidth = 18
      FieldName = 'GTOT_RESERVA_ACRE'
      EditFormat = '###,###,###,###,###.00'
    end
    object qryVistaAcreditadoGTOT_ACREDITADO: TFloatField
      DisplayLabel = 'Comparación Adeudo'
      DisplayWidth = 18
      FieldName = 'GTOT_ACREDITADO'
      EditFormat = '###,###,###,###,###.00'
    end
  end
  object SaveXLS: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Archivos de Excel *.xls|*.xls|Todos los archivos|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Exportar a Excel'
    Left = 192
    Top = 147
  end
end
