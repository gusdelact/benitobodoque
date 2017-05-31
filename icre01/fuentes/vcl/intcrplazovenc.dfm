object WCrPlzVenc: TWCrPlzVenc
  Left = 280
  Top = 165
  Width = 960
  Height = 424
  Caption = 'Concentración de Cartera por Plazo'
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
    Width = 953
    Height = 105
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
      Left = 836
      Top = 44
      Width = 116
      Height = 21
      Caption = 'Exportar resumen'
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
    object sbExportarDetalleXLS: TSpeedButton
      Left = 836
      Top = 76
      Width = 116
      Height = 21
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
      OnClick = sbExportarDetalleXLSClick
    end
    object btBusca: TBitBtn
      Left = 836
      Top = 12
      Width = 116
      Height = 21
      Caption = 'Inicia Busqueda'
      TabOrder = 0
      OnClick = GeneraDatosEvent
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
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 56
      Width = 492
      Height = 41
      Caption = ' Incluir información de '
      TabOrder = 2
      object cbEstados: TCheckBox
        Left = 80
        Top = 16
        Width = 65
        Height = 17
        Caption = '&Estados'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object cbMunicipios: TCheckBox
        Left = 149
        Top = 16
        Width = 81
        Height = 17
        Caption = '&Municipios'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object cbOrgDesc: TCheckBox
        Left = 235
        Top = 16
        Width = 153
        Height = 17
        Caption = '&Organos Descentralizados'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object cbPrivado: TCheckBox
        Left = 392
        Top = 16
        Width = 97
        Height = 17
        Caption = 'Sector Privado'
        TabOrder = 4
      end
      object cbFederal: TCheckBox
        Left = 8
        Top = 16
        Width = 65
        Height = 17
        Caption = '&Federal'
        TabOrder = 0
      end
    end
    object rgFactorMoneda: TRadioGroup
      Left = 138
      Top = 8
      Width = 359
      Height = 41
      Caption = ' Información expresada en: '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Millones de pesos'
        'Miles de pesos'
        'Pesos')
      TabOrder = 3
    end
    object cbInteresesAnticipados: TCheckBox
      Left = 513
      Top = 13
      Width = 217
      Height = 17
      Caption = 'Incluir intereses cobrados por anticipado'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 112
    Width = 953
    Height = 273
    ActivePage = TabSheet1
    TabOrder = 1
    TabPosition = tpBottom
    object TabSheet1: TTabSheet
      Caption = 'Resumen'
      object sgPlazoVto: TSGCtrl
        Left = 0
        Top = 0
        Width = 945
        Height = 245
        OnCalcRow = sgPlazoVtoCalcRow
        ShowTab = False
        Align = alClient
        TabOrder = 0
        TabWidth = 0
        ShowBtnPriorNext = True
        ShowBtnFirst = True
        ShowBtnLast = True
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Desglose'
      ImageIndex = 1
      object sgPlazoDesglose: TSGCtrl
        Left = 0
        Top = 0
        Width = 905
        Height = 237
        OnCalcRow = sgPlazoVtoCalcRow
        ShowTab = True
        Align = alClient
        TabOrder = 0
        TabWidth = 0
        ShowBtnPriorNext = True
        ShowBtnFirst = True
        ShowBtnLast = True
      end
    end
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
    Left = 58
    Top = 2
  end
  object QResumen: TQuery
    SQL.Strings = (
      'Select Case When Grouping (Mdo.Cve_Mercado)  = 1 Then '#39'TOTAL'#39
      '            When Mdo.Cve_Mercado Is Null         And'
      '                 Grouping (Mdo.Cve_Mercado)  = 0 And'
      
        '                 Grouping (Mdo.Desc_Mercado) = 0 Then '#39'(SIN MERC' +
        'ADO OBJETIVO)'#39' '
      '            Else Mdo.Desc_Mercado'
      
        '       End                                                      ' +
        '                                                           Desc_' +
        'Mercado,                                       '
      
        '       Round (Nvl (Sum (Sdo.Impagado),         0) / :peFactor * ' +
        '100, Case When :peFactor = 1000000 Then 0 Else 2 End)      Impag' +
        'ado,  '
      
        '       Round (Nvl (Sum (Sdo.Hasta_12_Meses),   0) / :peFactor * ' +
        '100, Case When :peFactor = 1000000 Then 0 Else 2 End)      Hasta' +
        '_12_Meses,  '
      
        '       Round (Nvl (Sum (Sdo.De_13_A_36_Meses), 0) / :peFactor * ' +
        '100, Case When :peFactor = 1000000 Then 0 Else 2 End)      De_13' +
        '_A_36_Meses,  '
      
        '       Round (Nvl (Sum (Sdo.De_37_A_60_Meses), 0) / :peFactor * ' +
        '100, Case When :peFactor = 1000000 Then 0 Else 2 End)      De_37' +
        '_A_60_Meses,  '
      
        '       Round (Nvl (Sum (Sdo.Mas_De_60_Meses),  0) / :peFactor * ' +
        '100, Case When :peFactor = 1000000 Then 0 Else 2 End)      Mas_D' +
        'e_60_Meses,'
      
        '       Grouping (Mdo.Cve_Mercado)                               ' +
        '                                                           G1'
      '  From CR_Mercado_Obj Mdo'
      '  Full Outer Join (Select Cve_Mercado,'
      
        '                          Nvl (Sum (Impagado),         0)  Impag' +
        'ado,'
      
        '                          Nvl (Sum (Hasta_12_Meses),   0)  Hasta' +
        '_12_Meses,'
      
        '                          Nvl (Sum (De_13_A_36_Meses), 0)  De_13' +
        '_A_36_Meses,'
      
        '                          Nvl (Sum (De_37_A_60_Meses), 0)  De_37' +
        '_A_60_Meses,'
      
        '                          Nvl (Sum (Mas_De_60_Meses),  0)  Mas_D' +
        'e_60_Meses'
      '                     From (Select Cve_Mercado, '
      '                                  Cve_Moneda,'
      
        '                                  Sum (Case When Situacion = '#39'IM' +
        #39'                                      Then Imp_Total Else 0 End' +
        ') * Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda, '#39'D0' +
        '00'#39', To_Char (:peFecha, '#39'YYYY'#39'), To_Char (:peFecha, '#39'MM'#39')) Impag' +
        'ado,'
      
        '                                  Sum (Case When Situacion In ('#39 +
        'AC'#39', '#39'PA'#39') And Meses <= 12             Then Imp_Total Else 0 End' +
        ') * Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda, '#39'D0' +
        '00'#39', To_Char (:peFecha, '#39'YYYY'#39'), To_Char (:peFecha, '#39'MM'#39')) Hasta' +
        '_12_Meses,'
      
        '                                  Sum (Case When Situacion In ('#39 +
        'AC'#39', '#39'PA'#39') And Meses Between 13 And 36 Then Imp_Total Else 0 End' +
        ') * Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda, '#39'D0' +
        '00'#39', To_Char (:peFecha, '#39'YYYY'#39'), To_Char (:peFecha, '#39'MM'#39')) De_13' +
        '_A_36_Meses,'
      
        '                                  Sum (Case When Situacion In ('#39 +
        'AC'#39', '#39'PA'#39') And Meses Between 37 And 60 Then Imp_Total Else 0 End' +
        ') * Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda, '#39'D0' +
        '00'#39', To_Char (:peFecha, '#39'YYYY'#39'), To_Char (:peFecha, '#39'MM'#39')) De_37' +
        '_A_60_Meses,'
      
        '                                  Sum (Case When Situacion In ('#39 +
        'AC'#39', '#39'PA'#39') And Meses > 60              Then Imp_Total Else 0 End' +
        ') * Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda, '#39'D0' +
        '00'#39', To_Char (:peFecha, '#39'YYYY'#39'), To_Char (:peFecha, '#39'MM'#39')) Mas_D' +
        'e_60_Meses  '
      
        '                             From Table (Pkgcrgpviews.VW_CR_GP_S' +
        'aldos_Plazo_Vto (:peFecha, :peTipo_Entidad, :peInt_Cob_Ant))'
      '                            Group By Cve_Mercado, Cve_Moneda'
      '                          )'
      '                    Group By Cve_Mercado       '
      
        '                  )   Sdo On Mdo.Cve_Mercado = Sdo.Cve_Mercado  ' +
        ' '
      ' Group By Rollup (Mdo.Cve_Mercado, Mdo.Desc_Mercado)'
      ' Having Grouping (Mdo.Cve_Mercado)  = 1 Or'
      '        Grouping (Mdo.Desc_Mercado) = 0 '
      ' Order By G1, Mdo.Desc_Mercado')
    Left = 144
    Top = 176
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
        Name = 'peInt_Cob_Ant'
        ParamType = ptUnknown
      end>
    object QResumenDesc_Mercado: TStringField
      DisplayLabel = '                                            Banca'
      DisplayWidth = 49
      FieldName = 'Desc_Mercado'
      Size = 100
    end
    object QResumenImpagado: TFloatField
      DisplayLabel = '        Impagada ($)'
      DisplayWidth = 19
      FieldName = 'Impagado'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QResumenHasta_12_Meses: TFloatField
      DisplayLabel = '   Hasta 12 Meses ($)'
      DisplayWidth = 19
      FieldName = 'Hasta_12_Meses'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QResumenDe_13_A_36_Meses: TFloatField
      DisplayLabel = ' De 13 hasta 36 Meses ($)'
      DisplayWidth = 22
      FieldName = 'De_13_A_36_Meses'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QResumenDe_37_A_60_Meses: TFloatField
      DisplayLabel = ' De 37 hasta 60 Meses ($)'
      DisplayWidth = 22
      FieldName = 'De_37_A_60_Meses'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QResumenMas_De_60_Meses: TFloatField
      DisplayLabel = ' Mayores a 60 Meses ($)'
      DisplayWidth = 21
      FieldName = 'Mas_De_60_Meses'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QResumenG1: TFloatField
      FieldName = 'G1'
      Visible = False
    end
  end
  object QDesglosado: TQuery
    SQL.Strings = (
      'Select Desc_Mercado,'
      '       Desc_Rango,'
      
        '       Round (Trim_Ant, Case When :peFactor = 1000000 Then 0 Els' +
        'e 2 End)                              Imp_Trim_Ant,'
      
        '       Round (Case When Sum (Trim_Ant) Over (Partition By Desc_M' +
        'ercado) = 0 Then 0'
      
        '                   Else Trim_Ant / Sum (Trim_Ant) Over (Partitio' +
        'n By Desc_Mercado) '
      
        '              End * 100, 2)                                     ' +
        '                                      Pct_Trim_Ant,'
      
        '       Round (Mes_Act, Case When :peFactor = 1000000 Then 0 Else' +
        ' 2 End)                               Imp_Mes_Act,'
      
        '       Round (Case When Sum (Mes_Act) Over (Partition By Desc_Me' +
        'rcado) = 0 Then 0'
      
        '                   Else Mes_Act / Sum (Mes_Act) Over (Partition ' +
        'By Desc_Mercado) '
      
        '              End * 100, 2)                                     ' +
        '                                      Pct_Mes_Act,'
      
        '       Round (Diferencia, Case When :peFactor = 1000000 Then 0 E' +
        'lse 2 End)                            Imp_Diferencia,'
      
        '       Round (Case When Sum (Diferencia) Over (Partition By Desc' +
        '_Mercado) = 0 Then 0'
      
        '                   Else Diferencia / Sum (Diferencia) Over (Part' +
        'ition By Desc_Mercado) '
      
        '              End * 100, 2)                                     ' +
        '                                      Pct_Diferencia,'
      
        '       Round (Trim_Ant_Anio_Sig, Case When :peFactor = 1000000 T' +
        'hen 0 Else 2 End)                     Imp_Trim_Ant_Anio_Sig,'
      
        '       Round (Case When Sum (Trim_Ant_Anio_Sig) Over (Partition ' +
        'By Desc_Mercado) = 0 Then 0'
      
        '                   Else Trim_Ant_Anio_Sig / Sum (Trim_Ant_Anio_S' +
        'ig) Over (Partition By Desc_Mercado) '
      
        '              End * 100, 2)                                     ' +
        '                                      Pct_Trim_Ant_Anio_Sig,'
      
        '       G2                                                       ' +
        '                                      G1                        ' +
        '                                                                ' +
        '    '
      '  From (Select Dat.Cve_Mercado,'
      '               Dat.Rango, '
      
        '               Case When Dat.Desc_Mercado Is Not Null           ' +
        '                  Then Dat.Desc_Mercado'
      
        '                    When Dat.Desc_Mercado Is Null And Dat.Cve_Me' +
        'rcado Is Not Null Then '#39'TOTAL '#39' || Mdo.Desc_Mercado'
      
        '                    When Dat.Desc_Mercado Is Null And Dat.Cve_Me' +
        'rcado Is Null Then'
      
        '                    Case When G4 = 0 Then '#39'(SIN MERCADO OBJETIVO' +
        ')'#39
      
        '                         When G1 = 0 Then '#39'TOTAL (SIN MERCADO OB' +
        'JETIVO)'#39
      '                         When G1 = 1 Then '#39'TOTAL CARTERA'#39
      '                    End'
      
        '               End                                              ' +
        '                                             Desc_Mercado, '
      '               Dat.Desc_Rango, '
      
        '               Dat.Trim_Ant          / :peFactor                ' +
        '                                             Trim_Ant,'
      
        '               Dat.Mes_Act           / :peFactor                ' +
        '                                             Mes_Act,'
      
        '               Dat.Diferencia        / :peFactor                ' +
        '                                             Diferencia,'
      
        '               Dat.Trim_Ant_Anio_Sig / :peFactor                ' +
        '                                             Trim_Ant_Anio_Sig,'
      '               Dat.G1,'
      
        '               Dat.G2                                           ' +
        '                                                        '
      '          From (Select Sdo.Cve_Mercado,'
      '                       Mdo.Desc_Mercado,'
      '                       Sdo.Rango,'
      '                       Rgo.Desc_Rango,'
      
        '                       Grouping (Sdo.Cve_Mercado)               ' +
        '                    G1, '
      
        '                       Grouping (Sdo.Rango)                     ' +
        '                    G2, '
      
        '                       Grouping (Mdo.Desc_Mercado)              ' +
        '                    G3, '
      
        '                       Grouping (Rgo.Desc_Rango)                ' +
        '                    G4,'
      
        '                       Nvl (Sum (Sdo.Trim_Ant), 0)              ' +
        '                    Trim_Ant,'
      
        '                       Nvl (Sum (Sdo.Mes_Act), 0)               ' +
        '                    Mes_Act,'
      
        '                       Nvl (Sum (Sdo.Trim_Ant), 0) - Nvl (Sum (S' +
        'do.Mes_Act), 0)     Diferencia,'
      
        '                       Nvl (Sum (Sdo.Trim_Ant_Anio_Sig), 0)     ' +
        '                    Trim_Ant_Anio_Sig'
      '                  From (Select Cve_Mercado,'
      '                               Rango,'
      
        '                               Null                             ' +
        '   Trim_Ant,'
      
        '                               Imp_Total                        ' +
        '   Mes_Act,'
      
        '                               Null                             ' +
        '   Trim_Ant_Anio_Sig'
      '                          From (Select Cve_Mercado, '
      '                                       Rango,'
      
        '                                       Sum (Imp_Total)  Imp_Tota' +
        'l'
      '                                  From (Select Cve_Mercado,'
      '                                               Rango,'
      
        '                                               Sum (Imp_Total) *' +
        ' Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda, '#39'D000'#39 +
        ', To_Char (:peFecha, '#39'YYYY'#39'), To_Char (:peFecha, '#39'MM'#39')) Imp_Tota' +
        'l'
      
        '                                          From (Select Cve_Merca' +
        'do, '
      
        '                                                       Cve_Moned' +
        'a,'
      
        '                                                       Imp_Total' +
        ','
      
        '                                                       Case When' +
        ' Situacion = '#39'IM'#39'                                      Then 1 --' +
        #39'Impagado'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses <= 12             Then 2 --' +
        #39'Hasta 12 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses Between 13 And 36 Then 3 --' +
        #39'De 13 A 36 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses Between 37 And 60 Then 4 --' +
        #39'De 37 A 60 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses > 60              Then 5 --' +
        #39'Mas De 60 Meses'#39
      
        '                                                       End      ' +
        '                                                                ' +
        '                  Rango              '
      
        '                                                  From Table (Pk' +
        'gcrgpviews.VW_CR_GP_Saldos_Plazo_Vto (:peFecha, :peTipo_Entidad,' +
        ' :peInt_Cob_Ant))'
      '                                               )'
      
        '                                         Group By Cve_Mercado, C' +
        've_Moneda, Rango'
      '                                       )'
      '                                 Group By Cve_Mercado, Rango'
      '                               ) '
      '                         Where Rango Is Not Null'
      '                        Union'
      '                        Select Cve_Mercado,'
      '                               Rango,'
      
        '                               Imp_Total                        ' +
        '   Trim_Ant,'
      
        '                               Null                             ' +
        '   Mes_Act,'
      
        '                               Null                             ' +
        '   Trim_Ant_Anio_Sig'
      '                          From (Select Cve_Mercado, '
      '                                       Rango,'
      
        '                                       Sum (Imp_Total)  Imp_Tota' +
        'l'
      '                                  From (Select Cve_Mercado,'
      '                                               Rango,'
      
        '                                               Sum (Imp_Total) *' +
        ' Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda, '#39'D000'#39 +
        ', To_Char (:peFechaTA, '#39'YYYY'#39'), To_Char (:peFechaTA, '#39'MM'#39')) Imp_' +
        'Total'
      
        '                                          From (Select Cve_Merca' +
        'do, '
      
        '                                                       Cve_Moned' +
        'a,'
      
        '                                                       Imp_Total' +
        ','
      
        '                                                       Case When' +
        ' Situacion = '#39'IM'#39'                                      Then 1 --' +
        #39'Impagado'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses <= 12             Then 2 --' +
        #39'Hasta 12 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses Between 13 And 36 Then 3 --' +
        #39'De 13 A 36 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses Between 37 And 60 Then 4 --' +
        #39'De 37 A 60 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses > 60              Then 5 --' +
        #39'Mas De 60 Meses'#39
      
        '                                                       End      ' +
        '                                                                ' +
        '                  Rango              '
      
        '                                                  From Table (Pk' +
        'gcrgpviews.VW_CR_GP_Saldos_Plazo_Vto (:peFechaTA, :peTipo_Entida' +
        'd, :peInt_Cob_Ant))'
      '                                               )'
      
        '                                         Group By Cve_Mercado, C' +
        've_Moneda, Rango'
      '                                       )'
      '                                 Group By Cve_Mercado, Rango'
      '                               )'
      '                         Where Rango Is Not Null'
      '                        Union'
      '                        Select Cve_Mercado,'
      '                               Rango,'
      
        '                               Null                             ' +
        '   Trim_Ant,'
      
        '                               Null                             ' +
        '   Mes_Act,'
      
        '                               Imp_Total                        ' +
        '   Trim_Ant_Anio_Sig'
      '                          From (Select Cve_Mercado, '
      '                                       Rango,'
      
        '                                       Sum (Imp_Total)  Imp_Tota' +
        'l'
      '                                  From (Select Cve_Mercado,'
      '                                               Rango,'
      
        '                                               Sum (Imp_Total) *' +
        ' Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda, '#39'D000'#39 +
        ', To_Char (:peFechaTASA, '#39'YYYY'#39'), To_Char (:peFechaTASA, '#39'MM'#39')) ' +
        'Imp_Total'
      
        '                                          From (Select Cve_Merca' +
        'do, '
      
        '                                                       Cve_Moned' +
        'a,'
      
        '                                                       Imp_Total' +
        ','
      
        '                                                       Case When' +
        ' Situacion = '#39'IM'#39'                                      Then 1 --' +
        #39'Impagado'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses <= 12             Then 2 --' +
        #39'Hasta 12 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses Between 13 And 36 Then 3 --' +
        #39'De 13 A 36 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses Between 37 And 60 Then 4 --' +
        #39'De 37 A 60 Meses'#39
      
        '                                                            When' +
        ' Situacion In ('#39'AC'#39', '#39'PA'#39') And Meses > 60              Then 5 --' +
        #39'Mas De 60 Meses'#39
      
        '                                                       End      ' +
        '                                                                ' +
        '                  Rango              '
      
        '                                                  From Table (Pk' +
        'gcrgpviews.VW_CR_GP_Saldos_Plazo_Vto (:peFechaTASA, :peTipo_Enti' +
        'dad, :peInt_Cob_Ant))'
      '                                               )'
      
        '                                         Group By Cve_Mercado, C' +
        've_Moneda, Rango'
      '                                       )'
      '                                 Group By Cve_Mercado, Rango'
      '                               ) '
      '                         Where Rango Is Not Null'
      '                       ) Sdo'
      
        '                  Join (Select 1 Rango, '#39'Impagado'#39'         Desc_' +
        'Rango From Dual Union'
      
        '                        Select 2 Rango, '#39'Hasta 12 Meses'#39'   Desc_' +
        'Rango From Dual Union '
      
        '                        Select 3 Rango, '#39'De 13 A 36 Meses'#39' Desc_' +
        'Rango From Dual Union '
      
        '                        Select 4 Rango, '#39'De 37 A 60 Meses'#39' Desc_' +
        'Rango From Dual Union '
      
        '                        Select 5 Rango, '#39'Mas De 60 Meses'#39'  Desc_' +
        'Rango From Dual  '
      '                       ) Rgo On Sdo.Rango = Rgo.Rango     '
      
        '                  Full Outer Join CR_Mercado_Obj Mdo On Sdo.Cve_' +
        'Mercado = Mdo.Cve_Mercado'
      
        '                 Group By Rollup (Sdo.Cve_Mercado, Sdo.Rango, Md' +
        'o.Desc_Mercado, Rgo.Desc_Rango)'
      '                 Having Grouping (Sdo.Cve_Mercado) + '
      '                        Grouping (Sdo.Rango) + '
      '                        Grouping (Mdo.Desc_Mercado) + '
      '                        Grouping (Rgo.Desc_Rango) In (0, 3, 4) '
      '                 Order By Sdo.Cve_Mercado Nulls Last, Sdo.Rango'
      '               ) Dat'
      
        '          Left Outer Join CR_Mercado_Obj Mdo On Dat.Cve_Mercado ' +
        '= Mdo.Cve_Mercado       '
      
        '         Where (Dat.Desc_Mercado Is Null Or Dat.Cve_Mercado Is N' +
        'ot Null)    --Descarta los mercado objetivo que no tienen inform' +
        'ación'
      '       ) Dat       '
      'Order By Dat.Cve_Mercado Nulls Last, Dat.G1, Dat.G2, Dat.Rango')
    Left = 184
    Top = 176
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
        Name = 'peInt_Cob_Ant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFechaTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFechaTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFechaTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peInt_Cob_Ant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFechaTASA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFechaTASA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peFechaTASA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peInt_Cob_Ant'
        ParamType = ptUnknown
      end>
    object QDesglosadoDesc_Mercado: TStringField
      DisplayLabel = '                                            Banca'
      DisplayWidth = 49
      FieldName = 'Desc_Mercado'
      Size = 100
    end
    object QDesglosadoDesc_Rango: TStringField
      DisplayLabel = '           Rango'
      DisplayWidth = 16
      FieldName = 'Desc_Rango'
    end
    object QDesglosadoImp_Trim_Ant: TFloatField
      DisplayWidth = 20
      FieldName = 'Imp_Trim_Ant'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDesglosadoPct_Trim_Ant: TFloatField
      Alignment = taCenter
      DisplayLabel = '    %'
      DisplayWidth = 6
      FieldName = 'Pct_Trim_Ant'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDesglosadoImp_Mes_Act: TFloatField
      DisplayLabel = '        Mes actual ($)'
      DisplayWidth = 20
      FieldName = 'Imp_Mes_Act'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDesglosadoPct_Mes_Act: TFloatField
      Alignment = taCenter
      DisplayLabel = '    %'
      DisplayWidth = 6
      FieldName = 'Pct_Mes_Act'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDesglosadoImp_Diferencia: TFloatField
      DisplayLabel = '        Diferencia ($)'
      DisplayWidth = 20
      FieldName = 'Imp_Diferencia'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDesglosadoPct_Diferencia: TFloatField
      Alignment = taCenter
      DisplayLabel = '    %'
      DisplayWidth = 6
      FieldName = 'Pct_Diferencia'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDesglosadoImp_Trim_Ant_Anio_Sig: TFloatField
      DisplayWidth = 20
      FieldName = 'Imp_Trim_Ant_Anio_Sig'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDesglosadoPct_Trim_Ant_Anio_Sig: TFloatField
      Alignment = taCenter
      DisplayLabel = '    %'
      DisplayWidth = 6
      FieldName = 'Pct_Trim_Ant_Anio_Sig'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDesglosadoG1: TFloatField
      FieldName = 'G1'
      Visible = False
    end
  end
  object QFechas: TQuery
    SQL.Strings = (
      
        '--Utilizando una fecha pasada como parámetro, determina el últim' +
        'o día del trimestre anterior,'
      '--y el último día del trimestre anterior para el siguiente año '
      'Select Fecha, '
      '       Fin_Trim_Ant, '
      
        '       Add_Months (Fin_Trim_Ant, 12)                            ' +
        '                                  Fin_Trim_Ant_SA,'
      
        '       (To_Char (Fin_Trim_Ant, '#39'MM'#39') / 3) || '#39'T'#39' ||  To_Char (Fi' +
        'n_Trim_Ant, '#39'YYYY'#39')               Trim_Ant, '
      
        '       (To_Char (Fin_Trim_Ant, '#39'MM'#39') / 3) || '#39'T'#39' || (To_Char (Fi' +
        'n_Trim_Ant, '#39'YYYY'#39') + 1)          Trim_AntSA '
      '  From ('
      '        Select Fecha, '
      
        '               To_Date ('#39'01'#39' || Primer_Mes_Trim || To_Char (Fech' +
        'a, '#39'YYYY'#39'), '#39'DDMMYYYY'#39') - 1 Fin_Trim_Ant'
      '          From (       '
      
        '                Select :peFecha Fecha, LPad (Trunc ((To_Char (:p' +
        'eFecha, '#39'MM'#39') - 1) / 3) * 3 + 1, 2, '#39'0'#39') Primer_Mes_Trim'
      '                  From Dual'
      '               )'
      '       )')
    Left = 223
    Top = 176
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
      end>
  end
  object SaveXLS: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Archivos de Excel *.xls|*.xls|Todos los archivos|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Exportar a Excel'
    Left = 104
    Top = 176
  end
  object QLeyendaEntidades: TQuery
    SQL.Strings = (
      
        'Select '#39'Incluye información: '#39' || InitCap (Replace (Replace (Nvl' +
        ' (:peTipo_Entidad, PkgCRGPViews.Todas_Entidades), '#39'ORG-DESC'#39', '#39'Ó' +
        'rganos descentralizados'#39'), '#39'|'#39', '#39', '#39')) Leyenda_Entidades'
      '  From Dual             ')
    Left = 310
    Top = 178
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
  end
  object QDesgloseCredito: TQuery
    SQL.Strings = (
      'Select Tipo_Entidad,'
      '       Desc_Mercado,'
      '       ID_Acreditado,'
      '       Nom_Acred_Reg,'
      '       ID_Contrato,'
      '       ID_Credito,'
      
        '       Round (Nvl (Sum (Impagado),         0) / :peFactor, Case ' +
        'When :peFactor = 1000000 Then 0 Else 2 End)  Impagado,'
      
        '       Round (Nvl (Sum (Hasta_12_Meses),   0) / :peFactor, Case ' +
        'When :peFactor = 1000000 Then 0 Else 2 End)  Hasta_12_Meses,'
      
        '       Round (Nvl (Sum (De_13_A_36_Meses), 0) / :peFactor, Case ' +
        'When :peFactor = 1000000 Then 0 Else 2 End)  De_13_A_36_Meses,'
      
        '       Round (Nvl (Sum (De_37_A_60_Meses), 0) / :peFactor, Case ' +
        'When :peFactor = 1000000 Then 0 Else 2 End)  De_37_A_60_Meses,'
      
        '       Round (Nvl (Sum (Mas_De_60_Meses),  0) / :peFactor, Case ' +
        'When :peFactor = 1000000 Then 0 Else 2 End)  Mas_De_60_Meses'
      '  From (Select Sdo.Cve_Mercado, '
      '               Mdo.Desc_Mercado,'
      '               Sdo.Tipo_Entidad,'
      '               Sdo.ID_Acreditado,'
      '               Sdo.Nom_Acred_Reg,'
      '               Sdo.ID_Contrato,'
      '               Sdo.ID_Credito,'
      
        '               Sum (Case When Sdo.Situacion = '#39'IM'#39'              ' +
        '                            Then Sdo.Imp_Total Else 0 End) * Pkg' +
        'crconsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Sdo.Cve_Moneda, '#39'D000'#39 +
        ', To_Char (:peFecha, '#39'YYYY'#39'), To_Char (:peFecha, '#39'MM'#39')) Impagado' +
        ','
      
        '               Sum (Case When Sdo.Situacion In ('#39'AC'#39', '#39'PA'#39') And ' +
        'Sdo.Meses <= 12             Then Sdo.Imp_Total Else 0 End) * Pkg' +
        'crconsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Sdo.Cve_Moneda, '#39'D000'#39 +
        ', To_Char (:peFecha, '#39'YYYY'#39'), To_Char (:peFecha, '#39'MM'#39')) Hasta_12' +
        '_Meses,'
      
        '               Sum (Case When Sdo.Situacion In ('#39'AC'#39', '#39'PA'#39') And ' +
        'Sdo.Meses Between 13 And 36 Then Sdo.Imp_Total Else 0 End) * Pkg' +
        'crconsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Sdo.Cve_Moneda, '#39'D000'#39 +
        ', To_Char (:peFecha, '#39'YYYY'#39'), To_Char (:peFecha, '#39'MM'#39')) De_13_A_' +
        '36_Meses,'
      
        '               Sum (Case When Sdo.Situacion In ('#39'AC'#39', '#39'PA'#39') And ' +
        'Sdo.Meses Between 37 And 60 Then Sdo.Imp_Total Else 0 End) * Pkg' +
        'crconsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Sdo.Cve_Moneda, '#39'D000'#39 +
        ', To_Char (:peFecha, '#39'YYYY'#39'), To_Char (:peFecha, '#39'MM'#39')) De_37_A_' +
        '60_Meses,'
      
        '               Sum (Case When Sdo.Situacion In ('#39'AC'#39', '#39'PA'#39') And ' +
        'Sdo.Meses > 60              Then Sdo.Imp_Total Else 0 End) * Pkg' +
        'crconsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Sdo.Cve_Moneda, '#39'D000'#39 +
        ', To_Char (:peFecha, '#39'YYYY'#39'), To_Char (:peFecha, '#39'MM'#39')) Mas_De_6' +
        '0_Meses  '
      
        '          From Table (Pkgcrgpviews.VW_CR_GP_Saldos_Plazo_Vto (:p' +
        'eFecha, :peTipo_Entidad, :peInt_Cob_Ant)) Sdo'
      
        '          Join CR_Mercado_Obj Mdo On Sdo.Cve_Mercado = Mdo.Cve_M' +
        'ercado'
      '         Group By Sdo.Cve_Mercado,'
      '                  Mdo.Desc_Mercado, '
      '                  Sdo.Tipo_Entidad,'
      '                  Sdo.ID_Acreditado,'
      '                  Sdo.Nom_Acred_Reg,'
      '                  Sdo.ID_Contrato,'
      '                  Sdo.ID_Credito,'
      '                  Sdo.Cve_Moneda'
      '       )'
      ' Group By Tipo_Entidad,'
      '          Desc_Mercado,'
      '          ID_Acreditado,'
      '          Nom_Acred_Reg,'
      '          ID_Contrato,'
      '          ID_Credito'
      'Having Nvl (Sum (Impagado),         0) <> 0'
      '    Or Nvl (Sum (Hasta_12_Meses),   0) <> 0'
      '    Or Nvl (Sum (De_13_A_36_Meses), 0) <> 0'
      '    Or Nvl (Sum (De_37_A_60_Meses), 0) <> 0'
      '    Or Nvl (Sum (Mas_De_60_Meses),  0) <> 0'
      ' Order By Tipo_Entidad,'
      '          Desc_Mercado,'
      '          ID_Acreditado,'
      '          Nom_Acred_Reg,'
      '          ID_Contrato,'
      '          ID_Credito                 ')
    Left = 268
    Top = 174
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
        Name = 'peInt_Cob_Ant'
        ParamType = ptUnknown
      end>
  end
end
