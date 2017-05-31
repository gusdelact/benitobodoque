object WCrCartBnc: TWCrCartBnc
  Left = 280
  Top = 163
  Width = 758
  Height = 437
  Caption = 'Concentración de Cartera por Banca'
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
    Width = 725
    Height = 121
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object sbExportar: TSpeedButton
      Left = 621
      Top = 25
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
    object sbExportarDetalle: TSpeedButton
      Left = 621
      Top = 48
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
      OnClick = sbExportarDetalleClick
    end
    object btBusca: TBitBtn
      Left = 621
      Top = 1
      Width = 116
      Height = 21
      Caption = 'Inicia Busqueda'
      TabOrder = 5
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
    object dpFecha: TDateTimePicker
      Left = 8
      Top = 28
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
    object GroupBox1: TGroupBox
      Left = 5
      Top = 56
      Width = 612
      Height = 41
      Caption = ' Incluir información de '
      TabOrder = 2
      object cbEstados: TCheckBox
        Left = 104
        Top = 16
        Width = 65
        Height = 17
        Caption = '&Estados'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object cbMunicipios: TCheckBox
        Left = 200
        Top = 16
        Width = 81
        Height = 17
        Caption = '&Municipios'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object cbOrgDesc: TCheckBox
        Left = 296
        Top = 16
        Width = 153
        Height = 17
        Caption = '&Organos Descentralizados'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object cbPrivado: TCheckBox
        Left = 488
        Top = 16
        Width = 97
        Height = 17
        Caption = 'Sector Privado'
        TabOrder = 4
      end
      object cbFederal: TCheckBox
        Left = 16
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
      Width = 479
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
    object cbCartasCredito: TCheckBox
      Left = 8
      Top = 102
      Width = 137
      Height = 17
      Caption = 'Incluir cartas de crédito'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object cbInteresesAnticipados: TCheckBox
      Left = 144
      Top = 102
      Width = 217
      Height = 17
      Caption = 'Incluir intereses cobrados por anticipado'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object sgBanca: TSGCtrl
    Left = -1
    Top = 136
    Width = 618
    Height = 265
    OnCalcRow = sgBancaCalcRow
    ShowTab = False
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
    Left = 178
    Top = 34
  end
  object vlQry: TQuery
    SQL.Strings = (
      'Select Cve_Mercado, '
      '       Desc_Mercado,'
      '       Pct_Minimo,'
      '       Pct_Maximo,'
      
        '       Round (Imp_Real / :peFactor, Case When :peFactor = 100000' +
        '0 Then 0 Else 2 End)              Imp_Real,'
      '       Pct_Real,'
      
        '       Case When Pct_Real < Nvl (Pct_Minimo, 0)                 ' +
        '                  Then '#39'NO'#39
      
        '            When Pct_Real Between Nvl (Pct_Minimo, 0) And Nvl (P' +
        'ct_Maximo, 0)     Then '#39'SI'#39
      
        '            When Pct_Real > Nvl (Pct_Maximo, 0)                 ' +
        '                  Then '#39'EXCEDE'#39
      
        '       End                                                      ' +
        '                                  B_Cumplimiento'
      '  From (Select Orden,'
      '               Cve_Mercado,'
      '               Desc_Mercado,'
      '               Pct_Minimo,'
      '               Pct_Maximo,'
      '               Imp_Real,'
      '               Case When Sum (Imp_Real) Over () = 0 Then 0 '
      
        '                    Else Round (Imp_Real / Sum (Imp_Real) Over (' +
        ') * 100)'
      
        '               End                                              ' +
        '               Pct_Real'
      '          From (Select Mdo.Orden,'
      
        '                       Case When Mdo.Cve_Mercado In ('#39'GOB'#39', '#39'EST' +
        #39', '#39'GBF'#39', '#39'ORG DES'#39') Then '#39'GOB'#39
      '                            Else Mdo.Cve_Mercado'
      
        '                       End                                      ' +
        '                                                Cve_Mercado,  '
      
        '                       Case When Mdo.Cve_Mercado In ('#39'GOB'#39', '#39'EST' +
        #39', '#39'GBF'#39', '#39'ORG DES'#39') Then '#39'GOBIERNO'#39
      '                            Else Mdo.Desc_Mercado'
      
        '                       End                                      ' +
        '                                                Desc_Mercado,  '
      '                       Mdo.Pct_Minimo,'
      '                       Mdo.Pct_Maximo,'
      '                       Sum ((Nvl (Sdo.Imp_Cap_Vig,     0) +'
      '                             Nvl (Sdo.Imp_Cap_Imp,     0) + '
      '                             Nvl (Sdo.Imp_Cap_Vdo_NE,  0) +'
      '                             Nvl (Sdo.Imp_Cap_Vdo_Ex,  0) +  '
      '                             Nvl (Sdo.Imp_Int_Vig,     0) + '
      '                             Nvl (Sdo.Imp_Int_Imp,     0) +'
      '                             Nvl (Sdo.Imp_Int_Vdo_NE,  0) +'
      '                             Nvl (Sdo.Imp_Int_Vdo_Ex,  0) -'
      
        '                             Case :peInt_Cob_Ant When '#39'V'#39' Then N' +
        'vl (Imp_Int_Cob_Ant, 0) Else 0 End '
      '                           ) * '
      
        '                           PkgCrConsolidado1.Fnc_Obt_Tipo_Cambio' +
        '_Regul (Cve_Moneda, '
      
        '                                                                ' +
        '    '#39'D000'#39', '
      
        '                                                                ' +
        '    To_Char (:peFecha, '#39'YYYY'#39'), '
      
        '                                                                ' +
        '    To_Char (:peFecha, '#39'MM'#39')'
      
        '                                                                ' +
        '   )'
      
        '                           )                                    ' +
        '                                                Imp_Real'
      '                  From (Select Pct.Orden, '
      '                               Mdo.Cve_Mercado,'
      '                               Mdo.Desc_Mercado,'
      '                               Pct.Pct_Maximo,'
      '                               Pct.Pct_Minimo'
      '                          From CR_Mercado_Obj Mdo      '
      
        '                          Left Outer Join (Select 1 Orden, '#39'GOB'#39 +
        '  Cve_Mercado,   75 Pct_Minimo,   85 Pct_Maximo From Dual Union ' +
        ' '
      
        '                                           Select 2 Orden, '#39'INFR' +
        #39' Cve_Mercado,   17 Pct_Minimo,   25 Pct_Maximo From Dual Union'
      
        '                                           Select 3 Orden, '#39'DESC' +
        #39' Cve_Mercado,  7.5 Pct_Minimo,   15 Pct_Maximo From Dual Union'
      
        '                                           Select 4 Orden, '#39'AGR'#39 +
        '  Cve_Mercado,   16 Pct_Minimo,   22 Pct_Maximo From Dual Union'
      
        '                                           Select 5 Orden, '#39'OTR'#39 +
        '  Cve_Mercado,    2 Pct_Minimo,    4 Pct_Maximo From Dual Union ' +
        ' '
      
        '                                           Select 6 Orden, '#39'HIP'#39 +
        '  Cve_Mercado, Null Pct_Minimo, Null Pct_Maximo From Dual Union ' +
        ' '
      
        '                                           Select 7 Orden, '#39'CON'#39 +
        '  Cve_Mercado, Null Pct_Minimo, Null Pct_Maximo From Dual Union ' +
        ' '
      
        '                                           Select 8 Orden, '#39'BEN'#39 +
        '  Cve_Mercado, Null Pct_Minimo, Null Pct_Maximo From Dual'
      
        '                                          ) Pct On Mdo.Cve_Merca' +
        'do = Pct.Cve_Mercado'
      '                       ) Mdo'
      
        '                  Left Outer Join Table (PkgCrGPViews.VW_CR_GP_S' +
        'aldos_Edos_Mun (:peFecha, :peTipo_Entidad)) Sdo On Mdo.Cve_Merca' +
        'do = Sdo.Cve_Mercado'
      '                 Where :peCartas_Cred   = '#39'V'#39
      '                    Or Sdo.Tipo_Credito = '#39'CRED'#39' '
      '                 Group By Mdo.Orden, '
      
        '                       Case When Mdo.Cve_Mercado In ('#39'GOB'#39', '#39'EST' +
        #39', '#39'GBF'#39', '#39'ORG DES'#39') Then '#39'GOB'#39
      '                            Else Mdo.Cve_Mercado'
      '                       End,  '
      
        '                       Case When Mdo.Cve_Mercado In ('#39'GOB'#39', '#39'EST' +
        #39', '#39'GBF'#39', '#39'ORG DES'#39') Then '#39'GOBIERNO'#39
      '                            Else Mdo.Desc_Mercado'
      '                       End,  '
      '                       Mdo.Pct_Minimo, '
      '                       Mdo.Pct_Maximo'
      '               )'
      '         Order By Orden             '
      '       )'
      '')
    Left = 311
    Top = 144
    ParamData = <
      item
        DataType = ftFloat
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'peFactor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peInt_Cob_Ant'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'peFecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peCartas_Cred'
        ParamType = ptUnknown
      end>
  end
  object SaveXLS: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Archivos de Excel *.xls|*.xls|Todos los archivos|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Exportar a Excel'
    Left = 192
    Top = 152
  end
  object QLeyendaEntidades: TQuery
    SQL.Strings = (
      
        'Select '#39'Incluye información: '#39' || InitCap (Replace (Replace (Nvl' +
        ' (:peTipo_Entidad, PkgCRGPViews.Todas_Entidades), '#39'ORG-DESC'#39', '#39'Ó' +
        'rganos descentralizados'#39'), '#39'|'#39', '#39', '#39')) Leyenda_Entidades'
      '  From Dual             ')
    Left = 342
    Top = 146
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
  end
  object QDetalle: TQuery
    SQL.Strings = (
      'Select Desc_Mercado,'
      '       Tipo_Entidad,'
      '       Nom_Acred_Reg,'
      '       ID_Acreditado,'
      '       ID_Contrato,'
      '       ID_Credito,'
      '       Tipo_Credito,'
      '       Pct_Minimo,'
      '       Pct_Maximo,'
      
        '       Round (Imp_Real / :peFactor, Case When :peFactor = 100000' +
        '0 Then 0 Else 2 End)              Imp_Real,'
      '       Case When Sum (Imp_Real) Over () = 0 Then 0'
      '            Else Imp_Real / (Sum (Imp_Real) Over ())'
      
        '       End                                                      ' +
        '                                  Pct_Real'
      '  From (Select Mdo.Orden,'
      
        '               Nvl (Mdo.Desc_Mercado, '#39'Sin Mercado'#39') Desc_Mercad' +
        'o,'
      '               Sdo.Tipo_Entidad,'
      '               Sdo.Nom_Acred_Reg,'
      '               Sdo.ID_Acreditado,'
      '               Sdo.ID_Contrato,'
      '               Sdo.ID_Credito,'
      '               Sdo.Tipo_Credito,'
      '               Mdo.Pct_Minimo,'
      '               Mdo.Pct_Maximo,'
      '               ((Nvl (Sdo.Imp_Cap_Vig,     0) +'
      '                 Nvl (Sdo.Imp_Cap_Imp,     0) +'
      '                 Nvl (Sdo.Imp_Cap_Vdo_NE,  0) +'
      '                 Nvl (Sdo.Imp_Cap_Vdo_Ex,  0) + '
      '                 Nvl (Sdo.Imp_Int_Vig,     0) + '
      '                 Nvl (Sdo.Imp_Int_Imp,     0) +'
      '                 Nvl (Sdo.Imp_Int_Vdo_NE,  0) +'
      '                 Nvl (Sdo.Imp_Int_Vdo_Ex,  0) -'
      
        '                 Case :peInt_Cob_Ant When '#39'V'#39' Then Nvl (Imp_Int_' +
        'Cob_Ant, 0) Else 0 End'
      '                ) * '
      
        '                PkgCrConsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve' +
        '_Moneda, '
      
        '                                                             '#39'D0' +
        '00'#39', '
      
        '                                                             To_' +
        'Char (:peFecha, '#39'YYYY'#39'), '
      
        '                                                             To_' +
        'Char (:peFecha, '#39'MM'#39')'
      '                                                            )'
      
        '               )                                                ' +
        '                                           Imp_Real '
      
        '          From Table (PkgCrGPViews.VW_CR_GP_Saldos_Edos_Mun (:pe' +
        'Fecha, :peTipo_Entidad)) Sdo'
      '          Left Outer Join (Select Pct.Orden, '
      '                                  Mdo.Cve_Mercado,'
      '                                  Mdo.Desc_Mercado,'
      '                                  Pct.Pct_Maximo,'
      '                                  Pct.Pct_Minimo'
      '                             From CR_Mercado_Obj Mdo      '
      
        '                             Left Outer Join (Select 1 Orden, '#39'G' +
        'OB'#39'  Cve_Mercado,   75 Pct_Minimo,   85 Pct_Maximo From Dual Uni' +
        'on  '
      
        '                                              Select 2 Orden, '#39'I' +
        'NFR'#39' Cve_Mercado,   17 Pct_Minimo,   25 Pct_Maximo From Dual Uni' +
        'on'
      
        '                                              Select 3 Orden, '#39'D' +
        'ESC'#39' Cve_Mercado,  7.5 Pct_Minimo,   15 Pct_Maximo From Dual Uni' +
        'on'
      
        '                                              Select 4 Orden, '#39'A' +
        'GR'#39'  Cve_Mercado,   16 Pct_Minimo,   22 Pct_Maximo From Dual Uni' +
        'on'
      
        '                                              Select 5 Orden, '#39'O' +
        'TR'#39'  Cve_Mercado,    2 Pct_Minimo,    4 Pct_Maximo From Dual Uni' +
        'on  '
      
        '                                              Select 6 Orden, '#39'H' +
        'IP'#39'  Cve_Mercado, Null Pct_Minimo, Null Pct_Maximo From Dual Uni' +
        'on  '
      
        '                                              Select 7 Orden, '#39'C' +
        'ON'#39'  Cve_Mercado, Null Pct_Minimo, Null Pct_Maximo From Dual Uni' +
        'on  '
      
        '                                              Select 8 Orden, '#39'B' +
        'EN'#39'  Cve_Mercado, Null Pct_Minimo, Null Pct_Maximo From Dual'
      
        '                                             ) Pct On Mdo.Cve_Me' +
        'rcado = Pct.Cve_Mercado'
      
        '                         ) Mdo On Case When Sdo.Cve_Mercado In (' +
        #39'GOB'#39', '#39'EST'#39', '#39'GBF'#39', '#39'ORG DES'#39') Then '#39'GOB'#39
      '                                            Else Sdo.Cve_Mercado'
      '                                       End = Mdo.Cve_Mercado'
      '          Where /*Sdo.F_Cierre Is Not Null'
      
        '            And*/ (:peCartas_Cred = '#39'V'#39' Or Sdo.Tipo_Credito = '#39'C' +
        'RED'#39')'
      '       )'
      '  Where Imp_Real <> 0              '
      
        '  Order By Orden Nulls Last, Tipo_Entidad, Nom_Acred_Reg, ID_Acr' +
        'editado, ID_Contrato, ID_Credito'
      '')
    Left = 311
    Top = 192
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
