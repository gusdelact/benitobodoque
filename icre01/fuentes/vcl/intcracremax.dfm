object WCrAcreMax: TWCrAcreMax
  Left = 390
  Top = 176
  Width = 751
  Height = 391
  Caption = 'Concentración de Acreditados Mayores Estados y Municipios'
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
  object sgMayores: TSGCtrl
    Left = 0
    Top = 92
    Width = 609
    Height = 260
    ShowTab = True
    TabOrder = 0
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 735
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 115
      Top = 2
      Width = 57
      Height = 13
      Caption = 'Exceptuado'
      Visible = False
    end
    object Label2: TLabel
      Left = 7
      Top = 2
      Width = 88
      Height = 13
      Caption = 'Fecha de consulta'
    end
    object sbExportarDetalle: TSpeedButton
      Left = 617
      Top = 67
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
    object edtExceptuado: TEdit
      Left = 115
      Top = 18
      Width = 64
      Height = 21
      TabOrder = 1
      Visible = False
    end
    object rgFactorMoneda: TRadioGroup
      Left = 120
      Top = 0
      Width = 361
      Height = 41
      Caption = ' Información expresada en: '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Millones de pesos'
        'Miles de pesos'
        'Pesos')
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 48
      Width = 604
      Height = 41
      Caption = ' Incluir información de '
      TabOrder = 3
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
        Left = 205
        Top = 16
        Width = 76
        Height = 17
        Caption = '&Municipios'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object cbOrgDesc: TCheckBox
        Left = 315
        Top = 16
        Width = 150
        Height = 17
        Caption = '&Organos Descentralizados'
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
        Left = 8
        Top = 16
        Width = 65
        Height = 17
        Caption = '&Federal'
        TabOrder = 0
      end
    end
    object dpFecha: TDateTimePicker
      Left = 8
      Top = 16
      Width = 97
      Height = 21
      CalAlignment = dtaLeft
      Date = 41079.4778591782
      Time = 41079.4778591782
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object btBusca: TBitBtn
      Left = 617
      Top = 44
      Width = 116
      Height = 21
      Caption = 'Inicia Busqueda'
      TabOrder = 6
      OnClick = Recalcular
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
      Left = 488
      Top = 3
      Width = 217
      Height = 17
      Caption = 'Incluir cartas de crédito'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object cbInteresesAnticipados: TCheckBox
      Left = 488
      Top = 27
      Width = 217
      Height = 17
      Caption = 'Incluir intereses cobrados por anticipado'
      Checked = True
      State = cbChecked
      TabOrder = 5
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
    Left = 74
    Top = 186
  end
  object QAcreditados: TQuery
    SQL.Strings = (
      'Select Case When Grupo > 0 And'
      
        '                 Orden = 1 Then '#39'Grupo '#39' || Grupo Else Null End ' +
        '    Desc_Grupo,'
      '       Desc_Concepto, '
      
        '       Round (Importe / :peFactor, Case When :peFactor = 1000000' +
        ' Then 0 Else 2 End)                              Importe,'
      '       Case '
      '          When Grupo In  (1, 2) And Orden = 2 Then '
      '               Case   '
      
        '                 --   Cap Bas >= Suma de los (3, 5) acreditados ' +
        'mayores'
      
        '                 When Importe >= Lag (Importe) Over (Partition B' +
        'y Grupo Order By Orden) Then '#39'SI'#39
      '                 Else '#39'NO'#39
      '               End'
      '          When Grupo = 3 And Orden = 3 Then '
      
        '               Case   --El menor entre el capital básico y el 10' +
        '% de la cartera total'
      
        '                 When Least (Importe, Lag (Importe) Over (Partit' +
        'ion By Grupo Order By Orden)) >='
      '                      -- >= El acreditado mayor  '
      
        '                      Lag (Importe, 2) Over (Partition By Grupo ' +
        'Order By Orden) Then '#39'SI'#39
      '                 Else '#39'NO'#39
      '               End'
      
        '       End                                                      ' +
        '    Cumplimiento,'
      '       Grupo'
      '  From ('
      
        '        Select CBD.Grupo, CBD.Orden, CBD.Desc_Concepto, CB.Imp_C' +
        'ap_Basico * CBD.Factor Importe'
      
        '          From (Select Imp_Capital_Basico * 1000000       Imp_Ca' +
        'p_Basico'
      
        '                  From Table (PkgCrGpViews.VW_CR_GP_Capital_Basi' +
        'co (:peFecha, '#39'ESTATAL'#39'))'
      '                 Where Pct_Capital = 100'
      '               ) CB'
      
        '          Cross Join (Select 0 Grupo, 2 Orden, '#39'Capital Básico'#39' ' +
        '          Desc_Concepto, 1   Factor From Dual Union'
      
        '                      Select 1 Grupo, 2 Orden, '#39'Capital Básico 2' +
        '.5 Veces'#39' Desc_Concepto, 2.5 Factor From Dual Union'
      
        '                      Select 2 Grupo, 2 Orden, '#39'Capital Básico 3' +
        ' Veces'#39'   Desc_Concepto, 3   Factor From Dual Union '
      
        '                      Select 3 Grupo, 2 Orden, '#39'Capital Básico'#39' ' +
        '          Desc_Concepto, 1   Factor From Dual '
      '                     ) CBD'
      '        Union All'
      
        '        Select CTD.Grupo, CTD.Orden, CTD.Desc_Concepto, CT.Impor' +
        'te * CTD.Factor Importe'
      '          From (Select Sum ((Nvl (Imp_Cap_Vig,     0) + '
      '                             Nvl (Imp_Cap_Imp,     0) +'
      '                             Nvl (Imp_Cap_Vdo_Ex,  0) +'
      '                             Nvl (Imp_Cap_Vdo_NE,  0) +'
      '                             Nvl (Imp_Int_Vig,     0) +'
      '                             Nvl (Imp_Int_Imp,     0) +'
      '                             Nvl (Imp_Int_Vdo_Ex,  0) +'
      '                             Nvl (Imp_Int_Vdo_NE,  0) -'
      
        '                             Case :peInt_Cob_Ant When '#39'V'#39' Then N' +
        'vl (Imp_Int_Cob_Ant, 0) Else 0 End'
      
        '                            ) * PkgCrConsolidado1.Fnc_Obt_Tipo_C' +
        'ambio_Regul (Cve_Moneda,  '
      
        '                                                                ' +
        '             '#39'D000'#39', '
      
        '                                                                ' +
        '             To_Char (:peFecha, '#39'YYYY'#39'),'
      
        '                                                                ' +
        '             To_Char (:peFecha, '#39'MM'#39')'
      
        '                                                                ' +
        '            )'
      
        '                           )                                    ' +
        '                                             Importe'
      
        '                  From Table (PkgCrGpViews.VW_CR_GP_Saldos_Edos_' +
        'Mun (:peFecha, :peTipo_Entidad))'
      
        '                 Where (:peCartas_Cred = '#39'V'#39' Or Tipo_Credito   =' +
        ' '#39'CRED'#39')'
      
        '                   And (Tipo_Entidad, Cve_Estado) Not In (('#39'ESTA' +
        'TAL'#39', '#39'ESCOA'#39'))'
      '               ) CT'
      
        '           Cross Join (Select 0 Grupo, 1 Orden, '#39'Cartera Total'#39' ' +
        '    Desc_Concepto, 1   Factor From Dual Union'
      
        '                       Select 3 Grupo, 3 Orden, '#39'10% Cartera Tot' +
        'al'#39' Desc_Concepto, 0.1 Factor From Dual '
      '                      ) CTD'
      '        Union All'
      '        Select Gp.Grupo, '
      '               Gp.Orden,'
      '               Gp.Desc_Concepto,'
      '               Case Num_Acred When 1 Then Imp.Importe_1'
      '                              When 3 Then Imp.Importe_3'
      '                              When 5 Then Imp.Importe_5'
      
        '               End                                             I' +
        'mporte                       '
      '          From (       '
      
        '                Select 3 Grupo, 1 Orden, '#39'Acreditado mayor'#39'     ' +
        '                 Desc_Concepto, 1 Num_Acred From Dual Union '
      
        '                Select 1 Grupo, 1 Orden, '#39'Suma de los tres acred' +
        'itados mayores'#39'  Desc_Concepto, 3 Num_Acred From Dual Union'
      
        '                Select 2 Grupo, 1 Orden, '#39'Suma de los 5 acredita' +
        'dos más grandes'#39' Desc_Concepto, 5 Num_Acred From Dual '
      '               ) Gp'
      
        '          Cross Join (Select Sum (Case When Renglon  = 1 Then Im' +
        'porte Else 0 End)    Importe_1,'
      
        '                             Sum (Case When Renglon <= 3 Then Im' +
        'porte Else 0 End)    Importe_3,'
      
        '                             Sum (Case When Renglon <= 5 Then Im' +
        'porte Else 0 End)    Importe_5'
      '                        From ('
      '                              Select Ac.ID_Acreditado,'
      '                                     Ac.ID_Aval_Gob,'
      
        '                                     Ac.Importe                 ' +
        '                     Importe_Acred,'
      
        '                                     Av.Importe                 ' +
        '                     Importe_Aval,'
      
        '                                     Ac.Importe + Nvl (Av.Import' +
        'e, 0)                Importe,'
      
        '                                     Row_Number () Over (Order B' +
        'y Ac.Importe Desc)   Renglon'
      '                                From (Select ID_Acreditado,'
      '                                             ID_Aval_Gob,'
      
        '                                             Sum ((Nvl (Imp_Cap_' +
        'Vig,     0) + '
      
        '                                                   Nvl (Imp_Cap_' +
        'Imp,     0) +'
      
        '                                                   Nvl (Imp_Cap_' +
        'Vdo_Ex,  0) +'
      
        '                                                   Nvl (Imp_Cap_' +
        'Vdo_NE,  0) +'
      
        '                                                   Nvl (Imp_Int_' +
        'Vig,     0) +'
      
        '                                                   Nvl (Imp_Int_' +
        'Imp,     0) +'
      
        '                                                   Nvl (Imp_Int_' +
        'Vdo_Ex,  0) +'
      
        '                                                   Nvl (Imp_Int_' +
        'Vdo_NE,  0) -'
      
        '                                                   Case :peInt_C' +
        'ob_Ant When '#39'V'#39' Then Nvl (Imp_Int_Cob_Ant, 0) Else 0 End'
      
        '                                                  ) * PkgCrConso' +
        'lidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda,  '
      
        '                                                                ' +
        '                                   '#39'D000'#39', '
      
        '                                                                ' +
        '                                   To_Char (:peFecha, '#39'YYYY'#39'),'
      
        '                                                                ' +
        '                                   To_Char (:peFecha, '#39'MM'#39')'
      
        '                                                                ' +
        '                                  )'
      
        '                                                 )              ' +
        '                                                                ' +
        '   Importe'
      
        '                                        From Table (PkgCrGpViews' +
        '.VW_CR_GP_Saldos_Edos_Mun (:peFecha, :peTipo_Entidad))'
      
        '                                       Where (:peCartas_Cred = '#39 +
        'V'#39' Or Tipo_Credito   = '#39'CRED'#39')'
      
        '                                         And (Tipo_Entidad, Cve_' +
        'Estado) Not In (('#39'ESTATAL'#39', '#39'ESCOA'#39'))'
      
        '                                       Group By ID_Acreditado, I' +
        'D_Aval_Gob  '
      '                                     ) Ac'
      
        '                                Left Outer Join (Select ID_Acred' +
        'itado,'
      
        '                                                        Sum ((Nv' +
        'l (Imp_Cap_Vig,     0) + '
      
        '                                                              Nv' +
        'l (Imp_Cap_Imp,     0) +'
      
        '                                                              Nv' +
        'l (Imp_Cap_Vdo_Ex,  0) +'
      
        '                                                              Nv' +
        'l (Imp_Cap_Vdo_NE,  0) +'
      
        '                                                              Nv' +
        'l (Imp_Int_Vig,     0) +'
      
        '                                                              Nv' +
        'l (Imp_Int_Imp,     0) +'
      
        '                                                              Nv' +
        'l (Imp_Int_Vdo_Ex,  0) +'
      
        '                                                              Nv' +
        'l (Imp_Int_Vdo_NE,  0) -'
      
        '                                                              Ca' +
        'se :peInt_Cob_Ant When '#39'V'#39' Then Nvl (Imp_Int_Cob_Ant, 0) Else 0 ' +
        'End'
      
        '                                                             ) *' +
        ' PkgCrConsolidado1.Fnc_Obt_Tipo_Cambio_Regul (Cve_Moneda,  '
      
        '                                                                ' +
        '                                              '#39'D000'#39', '
      
        '                                                                ' +
        '                                              To_Char (:peFecha,' +
        ' '#39'YYYY'#39'),'
      
        '                                                                ' +
        '                                              To_Char (:peFecha,' +
        ' '#39'MM'#39')'
      
        '                                                                ' +
        '                                             )'
      
        '                                                            )   ' +
        '                                                                ' +
        '              Importe'
      
        '                                                   From Table (P' +
        'kgCrGpViews.VW_CR_GP_Saldos_Edos_Mun (:peFecha, :peTipo_Entidad)' +
        ')'
      
        '                                                  Where (:peCart' +
        'as_Cred = '#39'V'#39' Or Tipo_Credito   = '#39'CRED'#39')'
      
        '                                                    And (Tipo_En' +
        'tidad, Cve_Estado) Not In (('#39'ESTATAL'#39', '#39'ESCOA'#39'))'
      
        '                                                  Group By ID_Ac' +
        'reditado'
      
        '                                                ) Av On Ac.ID_Av' +
        'al_Gob = Av.ID_Acreditado       '
      '                               Order By Renglon               '
      '                             )'
      '                       Where Renglon <= 5               '
      '                     ) Imp       '
      '       )'
      ' Order By Grupo, Orden')
    Left = 40
    Top = 188
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
        Name = 'peFecha'
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
    object QAcreditadosDesc_Grupo: TStringField
      Alignment = taCenter
      DisplayLabel = '    Grupo'
      DisplayWidth = 10
      FieldName = 'Desc_Grupo'
      Size = 100
    end
    object QAcreditadosDesc_Concepto: TStringField
      DisplayLabel = '                                  Concepto'
      DisplayWidth = 43
      FieldName = 'Desc_Concepto'
      Size = 100
    end
    object QAcreditadosImporte: TFloatField
      DisplayLabel = '               Totales'
      DisplayWidth = 20
      FieldName = 'Importe'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QAcreditadosCumplimiento: TStringField
      Alignment = taCenter
      DisplayLabel = ' Cumplimiento'
      DisplayWidth = 12
      FieldName = 'Cumplimiento'
      Size = 10
    end
    object QAcreditadosGrupo: TFloatField
      FieldName = 'Grupo'
      Visible = False
    end
  end
  object SaveXLS: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Archivos de Excel *.xls|*.xls|Todos los archivos|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Exportar a Excel'
    Left = 192
    Top = 120
  end
  object QDetalles: TQuery
    SQL.Strings = (
      'Select Ac.Tipo_Entidad,'
      '       Ac.ID_Acreditado,'
      '       Ac.Nom_Acred_Reg,'
      '       Ac.ID_Aval_Gob,'
      '       Ac.Tipo_Credito,'
      '       Case When :peFactor = 1000000 Then '
      '              Round (Ac.Importe / :peFactor)'
      '            Else  '
      '              Ac.Importe                  / :peFactor'
      
        '       End                                                      ' +
        '         Importe_Acred,'
      '       Case When :peFactor = 1000000 Then'
      '              Round (Nvl (Av.Importe, 0) / :peFactor)'
      '            Else'
      '              Nvl (Av.Importe, 0)         / :peFactor'
      
        '       End                                                      ' +
        '         Importe_Aval,'
      '       Case When :peFactor = 1000000 Then'
      
        '              Round ((Ac.Importe + Nvl (Av.Importe, 0)) / :peFac' +
        'tor)'
      '            Else'
      '              (Ac.Importe + Nvl (Av.Importe, 0)) / :peFactor'
      
        '       End                                                      ' +
        '         Importe_Total,'
      
        '       Row_Number () Over (Order By Ac.Importe Desc)            ' +
        '         Renglon'
      '  From (Select Tipo_Entidad,'
      '               ID_Acreditado,'
      '               Nom_Acred_Reg,'
      '               ID_Aval_Gob,'
      '               Tipo_Credito,'
      '               Sum ((Nvl (Imp_Cap_Vig,     0) + '
      '                     Nvl (Imp_Cap_Imp,     0) +'
      '                     Nvl (Imp_Cap_Vdo_Ex,  0) +'
      '                     Nvl (Imp_Cap_Vdo_NE,  0) +'
      '                     Nvl (Imp_Int_Vig,     0) +'
      '                     Nvl (Imp_Int_Imp,     0) +'
      '                     Nvl (Imp_Int_Vdo_Ex,  0) +'
      '                     Nvl (Imp_Int_Vdo_NE,  0) -'
      
        '                     Case :peInt_Cob_Ant When '#39'V'#39' Then Nvl (Imp_' +
        'Int_Cob_Ant, 0) Else 0 End'
      
        '                    ) * PkgCrConsolidado1.Fnc_Obt_Tipo_Cambio_Re' +
        'gul (Cve_Moneda,  '
      
        '                                                                ' +
        '     '#39'D000'#39', '
      
        '                                                                ' +
        '     To_Char (:peFecha, '#39'YYYY'#39'),'
      
        '                                                                ' +
        '     To_Char (:peFecha, '#39'MM'#39')'
      
        '                                                                ' +
        '    )'
      
        '                   )                                            ' +
        '                                     Importe'
      
        '          From Table (PkgCrGpViews.VW_CR_GP_Saldos_Edos_Mun (:pe' +
        'Fecha, :peTipo_Entidad))'
      '         Where (:peCartas_Cred = '#39'V'#39' Or Tipo_Credito   = '#39'CRED'#39')'
      
        '           And (Tipo_Entidad, Cve_Estado) Not In (('#39'ESTATAL'#39', '#39'E' +
        'SCOA'#39'))'
      
        '         Group By Tipo_Entidad, ID_Acreditado, Nom_Acred_Reg, ID' +
        '_Aval_Gob, Tipo_Credito  '
      '       ) Ac'
      '  Left Outer Join (Select ID_Acreditado,'
      '                          Sum ((Nvl (Imp_Cap_Vig,     0) + '
      '                                Nvl (Imp_Cap_Imp,     0) +'
      '                                Nvl (Imp_Cap_Vdo_Ex,  0) +'
      '                                Nvl (Imp_Cap_Vdo_NE,  0) +'
      '                                Nvl (Imp_Int_Vig,     0) +'
      '                                Nvl (Imp_Int_Imp,     0) +'
      '                                Nvl (Imp_Int_Vdo_Ex,  0) +'
      '                                Nvl (Imp_Int_Vdo_NE,  0) -'
      
        '                                Case :peInt_Cob_Ant When '#39'V'#39' The' +
        'n Nvl (Imp_Int_Cob_Ant, 0) Else 0 End'
      
        '                               ) * PkgCrConsolidado1.Fnc_Obt_Tip' +
        'o_Cambio_Regul (Cve_Moneda,  '
      
        '                                                                ' +
        '                '#39'D000'#39', '
      
        '                                                                ' +
        '                To_Char (:peFecha, '#39'YYYY'#39'),'
      
        '                                                                ' +
        '                To_Char (:peFecha, '#39'MM'#39')'
      
        '                                                                ' +
        '               )'
      
        '                              )                                 ' +
        '                                                Importe'
      
        '                     From Table (PkgCrGpViews.VW_CR_GP_Saldos_Ed' +
        'os_Mun (:peFecha, :peTipo_Entidad))'
      
        '                    Where (:peCartas_Cred = '#39'V'#39' Or Tipo_Credito ' +
        '  = '#39'CRED'#39')'
      
        '                      And (Tipo_Entidad, Cve_Estado) Not In (('#39'E' +
        'STATAL'#39', '#39'ESCOA'#39'))'
      '                    Group By ID_Acreditado'
      '                  ) Av On Ac.ID_Aval_Gob = Av.ID_Acreditado'
      
        ' Where Ac.Importe + Nvl (Av.Importe, 0) > 0                     ' +
        '    '
      ' Order By Renglon')
    Left = 112
    Top = 188
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
  object QLeyendaEntidades: TQuery
    SQL.Strings = (
      
        'Select '#39'Incluye información: '#39' || InitCap (Replace (Replace (Nvl' +
        ' (:peTipo_Entidad, PkgCRGPViews.Todas_Entidades), '#39'ORG-DESC'#39', '#39'Ó' +
        'rganos descentralizados'#39'), '#39'|'#39', '#39', '#39')) Leyenda_Entidades'
      '  From Dual             ')
    Left = 342
    Top = 114
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
  end
end
