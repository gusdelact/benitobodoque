object WCrCompBanca: TWCrCompBanca
  Left = 302
  Top = 208
  Width = 762
  Height = 391
  Caption = 'Comparativo por Segmentación de Cartera por Banca'
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
    Width = 745
    Height = 137
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
      Left = 593
      Top = 78
      Width = 116
      Height = 24
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
    object sbExportarDetalles: TSpeedButton
      Left = 593
      Top = 103
      Width = 116
      Height = 24
      Caption = 'Exportar detalles'
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
      OnClick = sbExportarDetallesClick
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
      Width = 383
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
      Left = 593
      Top = 52
      Width = 116
      Height = 24
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
  end
  object SGCompBanca: TSGCtrl
    Left = 0
    Top = 137
    Width = 713
    Height = 224
    OnCalcRow = SGCompBancaCalcRow
    ShowTab = True
    TabOrder = 1
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
  end
  object cbCartasCredito: TCheckBox
    Left = 528
    Top = 8
    Width = 137
    Height = 17
    Caption = 'Incluir Cartas de Crédito'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object cbInteresesAnticipados: TCheckBox
    Left = 528
    Top = 32
    Width = 217
    Height = 17
    Caption = 'Incluir Intereses Cobrados por Anticipado'
    Checked = True
    State = cbChecked
    TabOrder = 3
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
    Left = 82
    Top = 162
  end
  object SaveXLS: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Archivos de Excel *.xls|*.xls|Todos los archivos|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Exportar a Excel'
    Left = 120
    Top = 160
  end
  object QLeyendaEntidades: TQuery
    SQL.Strings = (
      
        'Select '#39'Incluye información: '#39' || InitCap (Replace (Replace (Nvl' +
        ' (:peTipo_Entidad, PkgCRGPViews.Todas_Entidades), '#39'ORG-DESC'#39', '#39'Ó' +
        'rganos descentralizados'#39'), '#39'|'#39', '#39', '#39')) Leyenda_Entidades'
      '  From Dual             ')
    Left = 198
    Top = 162
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
  end
  object QCompBanca: TQuery
    SQL.Strings = (
      'Select Banca,'
      '       Case When Banca Is Null Then '#39'Cartera comercial'#39
      
        '            When Banca = '#39'GOB'#39' And Desc_Sub_Banca Is Null Then '#39 +
        'Total gobiernos'#39
      '            When Banca = '#39'GOB'#39' And '
      
        '                 Row_Number () Over (Partition By Banca Order By' +
        ' Orden_Sub_Banca Nulls Last) > 1 Then Null '
      '            Else Desc_Banca'
      
        '       End                                                      ' +
        '                Desc_Banca,'
      '       Desc_Sub_Banca,'
      
        '       Round (Imp_Real,        Case When :peFactor = 1000000 The' +
        'n 0 Else 2 End) Imp_Real,'
      
        '       Round (Imp_Presup,      Case When :peFactor = 1000000 The' +
        'n 0 Else 2 End) Imp_Presup,'
      
        '       Round (Imp_Crecimiento, Case When :peFactor = 1000000 The' +
        'n 0 Else 2 End) Imp_Crecimiento,'
      
        '       G2                                                       ' +
        '                G1'
      '  From (Select Case Banca When '#39'GOB'#39'  Then 1'
      '                          When '#39'INFR'#39' Then 2'
      '                          When '#39'DESC'#39' Then 3'
      '                          When '#39'OTR'#39'  Then 4'
      '                          Else             5'
      
        '               End                                              ' +
        '                                   Orden_Banca,'
      '               Case Sub_Banca When '#39'FID/MAN'#39' Then 1'
      '                              When '#39'RECPROP'#39' Then 2'
      '                              When '#39'FACT'#39'    Then 3'
      
        '               End                                              ' +
        '                                   Orden_Sub_Banca,'
      '               Banca,'
      '               Sub_Banca,'
      '               Case Banca When '#39'GOB'#39'  Then '#39'Gobiernos'#39
      
        '                          When '#39'INFR'#39' Then '#39'Infraestructura y Co' +
        'nstruccion'#39
      
        '                          When '#39'DESC'#39' Then '#39'Descuento de documen' +
        'tos y compras de gobierno'#39
      
        '                          When '#39'OTR'#39'  Then '#39'Otros (agro y vivien' +
        'da)'#39
      
        '               End                                              ' +
        '                                   Desc_Banca,'
      
        '               Case Sub_Banca When '#39'FID/MAN'#39' Then '#39'Fideicomiso/M' +
        'andato'#39
      
        '                              When '#39'RECPROP'#39' Then '#39'Recursos prop' +
        'ios'#39
      '                              When '#39'FACT'#39'    Then '#39'Factoraje'#39
      
        '               End                                              ' +
        '                                   Desc_Sub_Banca,'
      
        '               Nvl (Sum (Imp_Real),   0) / :peFactor            ' +
        '                                   Imp_Real,'
      
        '               Nvl (Sum (Imp_Presup), 0) / :peFactor            ' +
        '                                   Imp_Presup,'
      
        '               (Nvl (Sum (Imp_Real),  0) - Nvl (Sum (Imp_Presup)' +
        ', 0)) / :peFactor                  Imp_Crecimiento,'
      
        '               Grouping (Banca)                                 ' +
        '                                   G1,'
      
        '               Grouping (Sub_Banca)                             ' +
        '                                   G2,'
      
        '               Grouping (Banca) + Grouping (Sub_Banca)          ' +
        '                                   Nivel'
      
        '          From (Select Case When Cve_Mercado In ('#39'INFR'#39', '#39'DESC'#39')' +
        '                 Then Cve_Mercado'
      
        '                            When Cve_Mercado In ('#39'GOB'#39', '#39'EST'#39', '#39 +
        'GBF'#39', '#39'ORG DES'#39') Then '#39'GOB'#39
      '                            Else '#39'OTR'#39
      
        '                       End                                      ' +
        '                                                          Banca,'
      
        '                       Case When Cve_Mercado In ('#39'GOB'#39', '#39'EST'#39', '#39 +
        'GBF'#39', '#39'ORG DES'#39') Then'
      
        '                            Case When Producto In ('#39'Producto1'#39', ' +
        #39'Producto2'#39', '#39'Producto3'#39', '
      
        '                                                   '#39'Producto4'#39', ' +
        #39'Producto5'#39', '#39'Producto6'#39') Then '#39'FID/MAN'#39
      
        '                                 When Producto In ('#39'Producto7'#39', ' +
        #39'Producto8'#39', '#39'Producto9'#39') Then '#39'RECPROP'#39
      
        '                                 Else '#39'FACT'#39'                    ' +
        '  '
      '                            End                           '
      '                            Else Null'
      
        '                       End                                      ' +
        '                                                          Sub_Ba' +
        'nca,'
      '                       ((NVL (Imp_Cap_Vig,    0)  +'
      '                         NVL (Imp_Cap_Imp,    0)  + '
      '                         NVL (Imp_Cap_Vdo_Ex, 0)  + '
      '                         NVL (Imp_Cap_Vdo_NE, 0)  +'
      '                         NVL (Imp_Int_Vig,    0)  + '
      '                         NVL (Imp_Int_Imp,    0)  + '
      '                         NVL (Imp_Int_Vdo_Ex, 0)  + '
      '                         NVL (Imp_Int_Vdo_NE, 0)) -'
      
        '                         Case :peInt_Cob_Ant When '#39'V'#39' Then NVL (' +
        'Imp_Int_Cob_Ant, 0) Else 0 End'
      '                       ) *'
      
        '                        Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambio_Re' +
        'gul (Cve_Moneda, '
      
        '                                                                ' +
        '     '#39'D000'#39', '
      
        '                                                                ' +
        '     To_Char (:peFecha, '#39'YYYY'#39'), '
      
        '                                                                ' +
        '     To_Char (:peFecha, '#39'MM'#39')'
      
        '                                                                ' +
        '     )                                                    Imp_Re' +
        'al,'
      
        '                       0                                        ' +
        '                                                          Imp_Pr' +
        'esup'
      
        '                  From Table (Pkgcrgpviews.VW_CR_GP_Consolidado_' +
        'Edos_Mun (:peFecha, :peTipo_Entidad))'
      '                 Where :peCartas_Cred = '#39'V'#39'  '
      '                    Or Tipo_Credito = '#39'CRED'#39
      '                Union All '
      '               Select Banca, Sub_Banca, Imp_Real, Imp_Presup '
      '                 From ('
      
        '                       --Subconsulta para obtener el presupuesto' +
        ' para la fecha especificada'
      
        '                       Select '#39'GOB'#39'  Banca, '#39'FID/MAN'#39' Sub_Banca,' +
        ' 0 Imp_Real, 0 Imp_Presup From Dual Union'
      
        '                       Select '#39'GOB'#39'  Banca, '#39'RECPROP'#39' Sub_Banca,' +
        ' 0 Imp_Real, 0 Imp_Presup From Dual Union'
      
        '                       Select '#39'GOB'#39'  Banca, '#39'FACT'#39'    Sub_Banca,' +
        ' 0 Imp_Real, 0 Imp_Presup From Dual Union'
      
        '                       Select '#39'INFR'#39' Banca, Null      Sub_Banca,' +
        ' 0 Imp_Real, 0 Imp_Presup From Dual Union'
      
        '                       Select '#39'DESC'#39' Banca, Null      Sub_Banca,' +
        ' 0 Imp_Real, 0 Imp_Presup From Dual Union'
      
        '                       Select '#39'OTR'#39'  Banca, Null      Sub_Banca,' +
        ' 0 Imp_Real, 0 Imp_Presup From Dual'
      '                      )'
      '               )'
      '         Group By Rollup (Banca, Sub_Banca)'
      '         Order By Orden_Banca, Orden_Sub_Banca, G1, G2'
      '       )       '
      ' Where Not (Banca In ('#39'INFR'#39', '#39'DESC'#39', '#39'OTR'#39') And Nivel > 0) '
      '    Or Nivel = 2'
      ' Order By Orden_Banca, Orden_Sub_Banca, G1, G2')
    Left = 160
    Top = 161
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
    object QCompBancaBanca: TStringField
      FieldName = 'Banca'
      Visible = False
      Size = 10
    end
    object QCompBancaDesc_Banca: TStringField
      DisplayLabel = '                                     Banca'
      DisplayWidth = 43
      FieldName = 'Desc_Banca'
      Size = 100
    end
    object QCompBancaDesc_Sub_Banca: TStringField
      DisplayLabel = '        Subdivisión'
      DisplayWidth = 18
      FieldName = 'Desc_Sub_Banca'
      Size = 100
    end
    object QCompBancaImp_Real: TFloatField
      DisplayWidth = 18
      FieldName = 'Imp_Real'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QCompBancaImp_Presup: TFloatField
      DisplayWidth = 18
      FieldName = 'Imp_Presup'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QCompBancaImp_Crecimiento: TFloatField
      DisplayLabel = '         Diferencia'
      DisplayWidth = 18
      FieldName = 'Imp_Crecimiento'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QCompBancaG1: TFloatField
      FieldName = 'G1'
      Visible = False
    end
  end
  object QDetalles: TQuery
    SQL.Strings = (
      'Select Case Banca When '#39'GOB'#39'  Then 1'
      '                  When '#39'INFR'#39' Then 2'
      '                  When '#39'DESC'#39' Then 3'
      '                  When '#39'OTR'#39'  Then 4'
      '                  Else             5'
      
        '       End                                                      ' +
        '                                                         Orden_B' +
        'anca,'
      '       Case Sub_Banca When '#39'FID/MAN'#39' Then 1'
      '                      When '#39'RECPROP'#39' Then 2'
      '                      When '#39'FACT'#39'    Then 3'
      
        '       End                                                      ' +
        '                                                         Orden_S' +
        'ub_Banca,'
      '       Banca,'
      '       Sub_Banca,'
      '       Case Banca When '#39'GOB'#39'   Then '#39'Gobiernos'#39
      
        '                  When '#39'INFR'#39'  Then '#39'Infraestructura y Construcc' +
        'ión'#39
      
        '                  When '#39'DESC'#39'  Then '#39'Descuento de documentos y c' +
        'ompras de gobierno'#39
      '                  When '#39'OTR'#39'   Then '#39'Otros (agro y vivienda)'#39
      
        '       End                                                      ' +
        '                                                         Desc_Ba' +
        'nca,'
      '       Case Sub_Banca When '#39'FID/MAN'#39' Then '#39'Fideicomiso/Mandato'#39
      '                      When '#39'RECPROP'#39' Then '#39'Recursos propios'#39
      '                      When '#39'FACT'#39'    Then '#39'Factoraje'#39
      
        '       End                                                      ' +
        '                                                         Desc_Su' +
        'b_Banca,'
      '       Tipo_Entidad,'
      '       Id_Acreditado,'
      '       Nom_Acred_Reg,'
      '       Id_Contrato,'
      '       Id_Credito,'
      '       Tipo_Credito,'
      
        '       Round (Sum (Nvl (Imp_Real, 0) / :peFactor),   Case When :' +
        'peFactor = 1000000 Then 0 Else 2 End)                    Imp_Rea' +
        'l,'
      
        '       Round (Sum (Nvl (Imp_Presup, 0) / :peFactor), Case When :' +
        'peFactor = 1000000 Then 0 Else 2 End)                    Imp_Pre' +
        'sup,'
      
        '       Round (Sum ((Nvl (Imp_Real, 0) - Nvl (Imp_Presup, 0)) / :' +
        'peFactor), '
      
        '              Case When :peFactor = 1000000 Then 0 Else 2 End)  ' +
        '                                                         Imp_Cre' +
        'cimiento'
      '  From ('
      ''
      
        '        Select Case When Cve_Mercado In ('#39'INFR'#39', '#39'DESC'#39')        ' +
        '         Then Cve_Mercado'
      
        '                    When Cve_Mercado In ('#39'GOB'#39', '#39'EST'#39', '#39'GBF'#39', '#39'O' +
        'RG DES'#39') Then '#39'GOB'#39
      '                    Else '#39'OTR'#39
      
        '               End                                              ' +
        '                                                  Banca,'
      
        '               Case When Cve_Mercado In ('#39'GOB'#39', '#39'EST'#39', '#39'GBF'#39', '#39'O' +
        'RG DES'#39') Then'
      
        '                    Case When Producto In ('#39'Producto1'#39', '#39'Product' +
        'o2'#39', '#39'Producto3'#39', '
      
        '                                           '#39'Producto4'#39', '#39'Product' +
        'o5'#39', '#39'Producto6'#39') Then '#39'FID/MAN'#39
      
        '                         When Producto In ('#39'Producto7'#39', '#39'Product' +
        'o8'#39', '#39'Producto9'#39') Then '#39'RECPROP'#39
      '                         Else '#39'FACT'#39'                      '
      '                    End                           '
      '                    Else Null'
      
        '               End                                              ' +
        '                                                  Sub_Banca,'
      '               Tipo_Entidad,'
      '               Id_Acreditado,'
      '               Nom_Acred_Reg,'
      '               Id_Contrato,'
      '               Id_Credito,'
      '               Tipo_Credito,'
      '               ((NVL (Imp_Cap_Vig,    0)  +'
      '                 NVL (Imp_Cap_Imp,    0)  + '
      '                 NVL (Imp_Cap_Vdo_Ex, 0)  + '
      '                 NVL (Imp_Cap_Vdo_NE, 0)  +'
      '                 NVL (Imp_Int_Vig,    0)  + '
      '                 NVL (Imp_Int_Imp,    0)  + '
      '                 NVL (Imp_Int_Vdo_Ex, 0)  + '
      '                 NVL (Imp_Int_Vdo_NE, 0)) -'
      
        '                 Case :peInt_Cob_Ant When '#39'V'#39' Then NVL (Imp_Int_' +
        'Cob_Ant, 0) Else 0 End'
      '               ) *'
      
        '                Pkgcrconsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve' +
        '_Moneda, '
      
        '                                                             '#39'D0' +
        '00'#39', '
      
        '                                                             To_' +
        'Char (:peFecha, '#39'YYYY'#39'), '
      
        '                                                             To_' +
        'Char (:peFecha, '#39'MM'#39')'
      
        '                                                             )  ' +
        '                                                  Imp_Real,'
      
        '               0                                                ' +
        '                                                  Imp_Presup'
      
        '          From Table (Pkgcrgpviews.VW_CR_GP_Consolidado_Edos_Mun' +
        ' (:peFecha, :peTipo_Entidad))'
      '       )'
      ' Where (Nvl (Imp_Real,   0) <> 0 Or  '
      '        Nvl (Imp_Presup, 0) <> 0)'
      '   And (:peCartas_Cred = '#39'V'#39'  Or  '
      '        Tipo_Credito = '#39'CRED'#39')'
      
        ' Group By Banca, Sub_Banca, Tipo_Entidad, Id_Acreditado, Nom_Acr' +
        'ed_Reg, Id_Contrato, Id_Credito, Tipo_Credito'
      
        ' Order By Banca, Sub_Banca, Tipo_Entidad, Id_Acreditado, Nom_Acr' +
        'ed_Reg, Id_Contrato, Id_Credito, Tipo_Credito')
    Left = 240
    Top = 161
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
