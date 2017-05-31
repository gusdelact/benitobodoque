object WCRCARTDIV: TWCRCARTDIV
  Left = 297
  Top = 140
  Width = 624
  Height = 430
  Caption = 'Concentración de Cartera por Divisa'
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 30
    Height = 13
    Caption = 'Fecha'
    FocusControl = dpFecha
  end
  object sbExportar: TSpeedButton
    Left = 479
    Top = 321
    Width = 116
    Height = 25
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
  object sbExportarDetalles: TSpeedButton
    Left = 479
    Top = 354
    Width = 116
    Height = 25
    Caption = 'Exportar Detalles'
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
    Width = 342
    Height = 41
    Caption = ' Información expresada en: '
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Millones de pesos'
      'Miles de pesos'
      'Pesos')
    TabOrder = 1
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 48
    Width = 596
    Height = 41
    Caption = ' Incluir información de '
    TabOrder = 2
    object cbEstados: TCheckBox
      Left = 118
      Top = 16
      Width = 65
      Height = 17
      Caption = '&Estados'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object cbMunicipios: TCheckBox
      Left = 206
      Top = 16
      Width = 81
      Height = 17
      Caption = '&Municipios'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object cbOrgDesc: TCheckBox
      Left = 308
      Top = 16
      Width = 153
      Height = 17
      Caption = '&Organos Descentralizados'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object cbPrivado: TCheckBox
      Left = 476
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Sector Privado'
      TabOrder = 3
    end
    object cbFederal: TCheckBox
      Left = 19
      Top = 16
      Width = 65
      Height = 17
      Caption = '&Federal'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object btBusca: TBitBtn
    Left = 487
    Top = 14
    Width = 116
    Height = 28
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
  object bbImprimir: TBitBtn
    Tag = 17
    Left = 479
    Top = 288
    Width = 116
    Height = 25
    Caption = '&Imprimir'
    TabOrder = 6
    OnClick = bbImprimirClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000C40E0000C40E00000000000000000000000000000000
      0000000000004949498F515151905052508F5052508F5052508F5052508F5052
      508F5052508F5052508F4F4F4F90000000000000000000000000000000000000
      000000000000BEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFC8C8C8FF000000000000000000000000FEFEFE07FEFE
      FE13FFFFFF01BDBDBDFDFDFDFDFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFDFDFDFFC2C2C2FF00000000FFFFFF14FFFFFF069C9C9C0DB2B2
      B274AEAEACBABAB9B9FCD4D4D4FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1
      D1FFD1D1D1FFD4D4D4FF9A9A9AFFADADACC5B3B3B3739999990A0A0A0A786666
      66F9696968F5595959FF656565FF646464FF646464FF646464FF646464FF6464
      64FF646464FF656566FF5A5A5AFF676766FF6A6A6AFB0606067812121263BDBC
      BAFBB4B3B3F55C5B5CFF4F4D4FFF525052FF525052FF525152FF535153FF5351
      53FF535253FF535253FF514F51FFB0AFAFFFC9C8C6FF070707601616164ED4D3
      D2F7CECDCDF67A7A7CFF676669FF656366FF5E5E61FF59585BFF535256FF4E4D
      50FF48484BFF414244FF3B3B3EFFCAC9C9FFE0DFDEFC0A0A0A491515153CDAD9
      D8F0D4D4D3F5A7A7A8FF979899FF929194FF8D8D8FFF858587FF7D7D7FFF7877
      7AFF6E6D70FF616163FF5B5B5DFFD0D0CFFFE7E6E5F60909093608080839D4D3
      D1E8DEDDDCF5BDBCBCFFC7C6C6FFCDCDCCFFC6C5C4FFBFBFBFFFBCBBBCFFC0BF
      BFFFC8C7C7FFC1BFC0FFADADACFFDCDBDAFFDEDDDCED000000330000000A9C9B
      9BDAE0E0DFF5BAB9B9FFBCBCBBFFBBBBBBFFBABAB9FFBCBCBBFFBCBCBBFFB9B9
      B8FFB9B9B8FFBABAB9FFB4B3B2FFE2E2E1FFA3A2A0E10000000000000000AAAA
      AA1E61615F637E7D7DF4FAF9F9FFF8F7F7FFF8F7F7FFF8F6F6FFF8F6F6FFF7F6
      F6FFF7F6F6FFFBFAFAFFAEAEAEFD5C5C5C6BB3A9A91B0000000000000000FFFF
      FF01B0B0B00D7B7B7BECF9F8F8FFF6F5F5FFF6F5F5FFF6F5F5FFF6F5F5FFF7F6
      F6FFF7F6F6FFFAF9F9FFADACACFBB6B6B60E0000000000000000000000000000
      000000000000444444B6FFFFFFFFF6F5F5FFF6F5F5FFF6F5F5FFF6F5F5FFF6F5
      F5FFF6F5F5FFFFFFFFFFA2A1A1E2000000000000000000000000000000000000
      000000000000424242B5FFFFFFFFF6F5F5FFF6F5F5FFF6F5F5FFF6F5F5FFF6F5
      F5FFF6F5F5FFFFFFFFFFA1A1A1E2000000000000000000000000000000000000
      000000000000464444B9FFFFFFFFFDFCFCFFFEFDFDFFFEFDFDFFFEFDFDFFFFFE
      FEFFFFFEFEFFFFFFFFFFA9A8A8E5000000000000000000000000000000000000
      0000000000001010106A5E5E5E9D5A59599D5A59599D5A5A5A9D5A5A5A9D5C5A
      5A9D5C5A5A9D5F5F5F9D3E3C3C6E000000000000000000000000}
  end
  object sgDivisas: TSGCtrl
    Left = 0
    Top = 120
    Width = 601
    Height = 161
    OnCalcRow = sgDivisasCalcRow
    ShowTab = False
    TabOrder = 7
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
  end
  object sgImpagado: TSGCtrl
    Left = 0
    Top = 304
    Width = 385
    Height = 81
    ShowTab = True
    ShowHint = True
    TabOrder = 8
    TabWidth = 0
    ShowBtnPriorNext = False
    ShowBtnFirst = False
    ShowBtnLast = False
  end
  object cbCartasCredito: TCheckBox
    Left = 8
    Top = 95
    Width = 137
    Height = 17
    Caption = 'Incluir cartas de crédito'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object cbInteresesAnticipados: TCheckBox
    Left = 144
    Top = 95
    Width = 217
    Height = 17
    Caption = 'Incluir intereses cobrados por anticipado'
    Checked = True
    State = cbChecked
    TabOrder = 4
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
    Left = 416
    Top = 8
  end
  object QDatos: TQuery
    SQL.Strings = (
      'Select C1.IdPlazo,'
      
        '       Case When C1.Maximo Is Null Then '#39'Total'#39' Else Trim (To_Ch' +
        'ar(C1.Maximo, '#39'9990.00'#39')) End                                  M' +
        'aximo,'
      '       C1.B_Total,'
      '       C1.B_Valida,'
      '       C1.Saldo_Pesos,'
      '       C1.Saldo_Dolares,'
      
        '       Round (C1.Saldo_Pesos   / C2.Saldo_Total_Pesos * 100, 2) ' +
        '                                             Pct_Saldo_Pesos,'
      
        '       Round (C1.Saldo_Dolares / C2.Saldo_Total_Dls   * 100, 2) ' +
        '                                             Pct_Saldo_Dls, '
      
        '       Round ((C1.Saldo_Pesos  + C1.Saldo_Dolares) / ( C2.Saldo_' +
        'Total_Pesos +C2.Saldo_Total_Dls  )* 100, 2)  Total, '
      '       Case When  C1.B_Total =  1 Then Null'
      '            When Round ((C1.Saldo_Pesos   + C1.Saldo_Dolares) / '
      
        '                         ( C2.Saldo_Total_Pesos +C2.Saldo_Total_' +
        'Dls  )* 100, 2)  < C1.Maximo Then '#39'SI'#39' Else '#39'NO'#39' End Cumplimient' +
        'o,'
      '       C2.Saldo_Total_Pesos,'
      '       C2.Saldo_Total_dls'
      '  From ('
      '        Select IdPlazo,'
      '              Maximo,'
      '              Sum (Saldo_Pesos)  Saldo_Pesos,'
      '              Sum (Saldo_Dls)    Saldo_Dolares,'
      '              Grouping (IdPlazo)  B_Total ,'
      '              Grouping (Maximo)   B_Valida,'
      
        '              Case When Grouping (IdPlazo) = 1 Then Sum (Saldo_P' +
        'esos) End  Saldo_Total_Pesos,   '
      
        '              Case When Grouping (IdPlazo) = 1 Then Sum (Saldo_d' +
        'ls)   End  Saldo_Total_Dls'
      '         From ('
      '               Select IdPlazo,'
      '                      Maximo,'
      '                      Moneda,'
      
        '                      Case When Moneda = '#39'Pesos'#39'     Then Nvl (S' +
        'um (Saldo), 0) Else 0 end Saldo_Pesos,'
      
        '                      Case When Moneda = '#39'Dolares'#39'   Then Nvl (S' +
        'um (Saldo * PKGCRCONSOLIDADO1.FNC_OBT_TIPO_CAMBIO_REGUL '
      
        '                                                             (84' +
        '0, '#39'D000'#39', Extract (Year From :peFecha),'
      
        '                                                                ' +
        '                     Extract (Month From :peFecha))),0)'
      
        '                                                                ' +
        '             Else 0 end Saldo_Dls        '
      '                From ('
      '                      Select Plazo,'
      
        '                             Case When Plazo <= 180             ' +
        ' Then '#39'Hasta 180 días'#39
      
        '                                  When Plazo Between 181 And 365' +
        ' Then '#39'Entre 180 y 365 días'#39
      
        '                                  When Plazo Between 366 And 720' +
        ' Then '#39'Entre 365 y 720 días'#39
      
        '                                  When Plazo > 720              ' +
        ' Then '#39'Más de 720 días'#39'       End     IdPlazo,'
      
        '                             Case When Plazo <= 180             ' +
        '      Then 5'
      
        '                                  When Plazo Between 181 And 365' +
        ' Then 10 '
      
        '                                  When Plazo Between 366 And 720' +
        ' Then 15  '
      
        '                                  When Plazo > 720              ' +
        ' Then 20                      End      Maximo,'
      
        '                             Case When Cve_Moneda = 484         ' +
        ' Then '#39'Pesos'#39
      
        '                                  When Cve_Moneda = 840         ' +
        ' Then '#39'Dolares'#39'               End      Moneda,'
      
        '                             Nvl (Imp_Cap_Vig,     0) + Nvl (Imp' +
        '_Cap_Imp,    0) +'
      
        '                             Nvl (Imp_Cap_Vdo_NE,  0) + Nvl (Imp' +
        '_Cap_Vdo_Ex, 0) + '
      
        '                             Nvl (Imp_Int_Vig,     0) + Nvl (Imp' +
        '_Int_Imp,    0) +'
      
        '                             Nvl (Imp_Int_Vdo_NE,  0) + Nvl (Imp' +
        '_Int_Vdo_Ex, 0) -'
      
        '                             Case :peInt_Cob_Ant When '#39'V'#39' Then N' +
        'vl (Imp_Int_Cob_Ant, 0) Else 0 End     Saldo'
      
        '                        From Table (Pkgcrgpviews.VW_CR_GP_Saldos' +
        '_Edos_Mun(:peFecha, :peTipo_Entidad))'
      '                       Where Fol_Contrato = 1 '
      '                         And F_Vencimiento Is Not Null'
      
        '                         And (:peCartas_Cred = '#39'V'#39' Or Tipo_Credi' +
        'to = '#39'CRED'#39')'
      '                     )    '
      '               Group By (IdPlazo, Maximo, Moneda)'
      '              )'
      '        Group By RollUp(IdPlazo, Maximo) )C1'
      '  Left Outer Join '
      '       (Select IdPlazo,'
      '               Maximo,'
      '               Sum (Saldo_Pesos)  Saldo_Pesos,'
      '               Sum (Saldo_Dls)    Saldo_Dolares,'
      '               Grouping (IdPlazo)  B_Total ,'
      '               Grouping (Maximo)   B_Valida,'
      
        '               Case When Grouping (IdPlazo) = 1 Then Decode (Sum' +
        ' (Saldo_Pesos),0,1, Sum (Saldo_Pesos)) End  Saldo_Total_Pesos,  ' +
        ' '
      
        '               Case When Grouping (IdPlazo) = 1 Then Decode (Sum' +
        ' (Saldo_dls)  ,0,1, Sum (Saldo_dls )) End  Saldo_Total_Dls'
      '          From ('
      '                Select IdPlazo,'
      '                       Maximo,'
      '                       Moneda,'
      
        '                       Case When Moneda = '#39'Pesos'#39'   Then Nvl (Su' +
        'm (Saldo),0) Else 0 end Saldo_Pesos,'
      
        '                       Case When Moneda = '#39'Dolares'#39' Then Nvl (Su' +
        'm (Saldo * PKGCRCONSOLIDADO1.FNC_OBT_TIPO_CAMBIO_REGUL '
      
        '                                                             (84' +
        '0, '#39'D000'#39', Extract (Year From :peFecha),'
      
        '                                                                ' +
        '                     Extract (Month From :peFecha))),0)'
      
        '                                                                ' +
        '            Else 0 end Saldo_Dls        '
      '                 From ('
      '                       Select Plazo,'
      
        '                              Case When Plazo <= 180            ' +
        '  Then '#39'Hasta 180 días'#39
      
        '                                   When Plazo Between 181 And 36' +
        '5 Then '#39'Entre 180 y 365 días'#39
      
        '                                   When Plazo Between 366 And 72' +
        '0 Then '#39'Entre 365 y 720 días'#39
      
        '                                   When Plazo > 720             ' +
        '  Then '#39'Más de 720 días'#39'      End      IdPlazo,'
      
        '                              Case When Plazo <= 180            ' +
        '  Then 5'
      
        '                                   When Plazo Between 181 And 36' +
        '5 Then 10'
      
        '                                   When Plazo Between 366 And 72' +
        '0 Then 15'
      
        '                                   When Plazo > 720             ' +
        '  Then 20                     End      Maximo,'
      
        '                              Case When Cve_Moneda = 484 Then '#39'P' +
        'esos'#39
      
        '                                   When Cve_Moneda = 840 Then '#39'D' +
        'olares'#39'                       End      Moneda,'
      
        '                              Nvl (Imp_Cap_Vig,     0) + Nvl (Im' +
        'p_Cap_Imp,    0) +'
      
        '                              Nvl (Imp_Cap_Vdo_NE,  0) + Nvl (Im' +
        'p_Cap_Vdo_Ex, 0) + '
      
        '                              Nvl (Imp_Int_Vig,     0) + Nvl (Im' +
        'p_Int_Imp,    0) +'
      
        '                              Nvl (Imp_Int_Vdo_NE,  0) + Nvl (Im' +
        'p_Int_Vdo_Ex, 0) -'
      
        '                              Case :peInt_Cob_Ant When '#39'V'#39' Then ' +
        'Nvl (Imp_Int_Cob_Ant, 0) Else 0 End    Saldo'
      
        '                         From Table (Pkgcrgpviews.VW_CR_GP_Saldo' +
        's_Edos_Mun(:peFecha, :peTipo_Entidad))'
      '                        Where Fol_Contrato = 1 '
      '                          And F_Vencimiento Is Not Null'
      
        '                          And (:peCartas_Cred = '#39'V'#39' Or Tipo_Cred' +
        'ito = '#39'CRED'#39')'
      '                      )    '
      '                Group By (IdPlazo, Maximo, Moneda)'
      '               )'
      '             Group By RollUp (IdPlazo, Maximo)'
      '        ) C2 On  C2.B_Total = 1 '
      '   Where C1.B_Total = 1 or C1.B_Valida = 0      '
      '   Order By C1.Maximo')
    Left = 232
    Top = 144
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
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peCartas_Cred'
        ParamType = ptUnknown
      end>
    object QDatosIdPlazo: TStringField
      DisplayLabel = '               Plazo'
      DisplayWidth = 20
      FieldName = 'IdPlazo'
      Size = 30
    end
    object QDatosMaximo: TStringField
      Alignment = taCenter
      DisplayLabel = '           % Maximo'
      DisplayWidth = 20
      FieldName = 'Maximo'
    end
    object QDatosPct_Saldo_Pesos: TFloatField
      Alignment = taCenter
      DisplayLabel = '  % Moneda Nal'
      DisplayWidth = 14
      FieldName = 'Pct_Saldo_Pesos'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDatosPct_Saldo_Dls: TFloatField
      Alignment = taCenter
      DisplayLabel = '     % Dólares'
      DisplayWidth = 14
      FieldName = 'Pct_Saldo_Dls'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDatosTotal: TFloatField
      Alignment = taCenter
      DisplayLabel = '     Total'
      FieldName = 'Total'
      DisplayFormat = '###,###,###,###,###.00'
      EditFormat = '14'
    end
    object QDatosCumplimiento: TStringField
      Alignment = taCenter
      DisplayLabel = '        Cumplimiento'
      FieldName = 'Cumplimiento'
    end
    object QDatosB_Total: TFloatField
      FieldName = 'B_Total'
      Visible = False
    end
  end
  object QDatos2: TQuery
    SQL.Strings = (
      
        'Select '#39'Impagado'#39'                                               ' +
        '                                                              Sa' +
        'ldo, '
      '          Saldo_Imp_Nal,'
      
        '          Saldo_Imp_Nal / Decode (Saldo_Imp_Nal, 0, 1, Saldo_Imp' +
        '_Nal) * 100                                                     ' +
        'Pct_Saldo_Imp_Nal,'
      '          Saldo_Imp_Dls,'
      
        '          Saldo_Imp_Dls / Decode (Saldo_Imp_Dls, 0, 1, Saldo_Imp' +
        '_Dls) * 100                                                     ' +
        'Pct_Saldo_Imp_Dls,'
      
        '          Saldo_Imp_Nal +  Saldo_Imp_Dls                        ' +
        '                                                                ' +
        'Total,'
      
        '          (Saldo_Imp_Nal + Saldo_Imp_Dls) / Decode((Saldo_Imp_Na' +
        'l + Saldo_Imp_Dls), 0, 1,(Saldo_Imp_Nal + Saldo_Imp_Dls)) * 100 ' +
        'Pct_Total'
      '     From (      '
      '           Select '#39'Impagado'#39'  Saldo, '
      
        '                  Nvl (Max (Case When Moneda =    484 Then    Sa' +
        'ldo_Imp End), 0)                                Saldo_Imp_Nal,'
      
        '                  Nvl (Max (Case When Moneda =    840 Then    Nv' +
        'l(Saldo_Imp, 0) * '
      
        '                                                              Pk' +
        'gCrConsolidado1.Fnc_Obt_Tipo_Cambio_Regul('
      
        '                                                                ' +
        '                840, '
      
        '                                                                ' +
        '                '#39'D000'#39', '
      
        '                                                                ' +
        '                Extract (Year From :peFecha), '
      
        '                                                                ' +
        '                Extract (Month From :peFecha))  '
      
        '                                                                ' +
        '                End),0)                         Saldo_Imp_Dls'
      '             From ('
      
        '                   Select Nvl(Sum (Nvl (Imp_Cap_Imp,     0) + Nv' +
        'l (Imp_Int_Imp,    0) + '
      
        '                                   Nvl (Imp_Cap_Vdo_Ex,  0) + Nv' +
        'l (Imp_Int_Vdo_Ex, 0) -'
      
        '                                   Case :peInt_Cob_Ant When '#39'V'#39' ' +
        'Then Nvl (Imp_Int_Cob_Ant, 0) Else 0 End'
      
        '                                  ), 0)                         ' +
        '                                                Saldo_Imp,    '
      
        '                          Cve_Moneda                       Moned' +
        'a                                                  '
      
        '                     From Table (Pkgcrgpviews.VW_CR_GP_Saldos_Ed' +
        'os_Mun(:peFecha, :peTipo_Entidad))'
      '                    Where Fol_Contrato = 1 '
      '                      And F_Vencimiento Is Not Null'
      
        '                      And (:peCartas_Cred = '#39'V'#39' Or Tipo_Credito ' +
        '  = '#39'CRED'#39')'
      '                    Group By RollUp (Cve_Moneda)'
      '                  )'
      '          )')
    Left = 264
    Top = 144
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
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peCartas_Cred'
        ParamType = ptUnknown
      end>
    object QDatos2Saldo: TStringField
      DisplayLabel = '               Saldo'
      FieldName = 'Saldo'
    end
    object QDatos2Pct_Saldo_Imp_Nal: TFloatField
      Alignment = taCenter
      DisplayLabel = '  % Moneda Nal'
      DisplayWidth = 14
      FieldName = 'Pct_Saldo_Imp_Nal'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDatos2Pct_Saldo_Imp_Dls: TFloatField
      Alignment = taCenter
      DisplayLabel = '     % Dólares'
      DisplayWidth = 14
      FieldName = 'Pct_Saldo_Imp_Dls'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object QDatos2Pct_Total: TFloatField
      Alignment = taCenter
      DisplayLabel = '         Total'
      DisplayWidth = 14
      FieldName = 'Pct_Total'
      DisplayFormat = '###,###,###,###,###.00'
    end
  end
  object SaveXLS: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Archivos de Excel *.xls|*.xls|Todos los archivos|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Exportar a Excel'
    Left = 1122
    Top = 112
  end
  object QLeyendaEntidades: TQuery
    SQL.Strings = (
      
        'Select '#39'Incluye información: '#39' || InitCap (Replace (Replace (Nvl' +
        ' (:peTipo_Entidad, PkgCRGPViews.Todas_Entidades), '#39'ORG-DESC'#39', '#39'Ó' +
        'rganos descentralizados'#39'), '#39'|'#39', '#39', '#39')) Leyenda_Entidades'
      '  From Dual             ')
    Left = 310
    Top = 146
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'peTipo_Entidad'
        ParamType = ptUnknown
      end>
  end
  object QDetalles: TQuery
    SQL.Strings = (
      'Select Tipo_Entidad,'
      '       Nom_Acred_Reg,'
      '       Id_Acreditado,'
      '       Id_Contrato,'
      '       Id_Credito,'
      '       Tipo_Credito,'
      '       F_Cierre,'
      '       Plazo,'
      '       Imp_Cap_Imp,'
      '       Imp_Int_Imp, '
      '       IdPlazo,'
      '       Maximo,'
      '       Moneda,'
      '       Saldo,'
      '       Case When Sum (Saldo) Over () = 0 Then  0'
      '       Else      Saldo / Sum (Saldo) Over ()  End Porcentaje,'
      '       Case When Moneda = '#39'Pesos'#39'   Then 1'
      '            When Moneda = '#39'Dolares'#39' Then 2 End B_OrdMon'
      '  From ('
      '        Select Tipo_Entidad,'
      '               Nom_Acred_Reg,'
      '               Id_Acreditado,'
      '               Id_Contrato,'
      '               Id_Credito,'
      '               Tipo_Credito,'
      '               F_Cierre,'
      '               Plazo,'
      '               Imp_Cap_Imp,'
      '               Imp_Int_Imp,       '
      
        '               Case When Plazo <= 180              Then '#39'Hasta 1' +
        '80 días'#39
      
        '                    When Plazo Between 181 And 365 Then '#39'Entre 1' +
        '80 y 365 días'#39
      
        '                    When Plazo Between 366 And 720 Then '#39'Entre 3' +
        '65 y 720 días'#39
      
        '                    When Plazo > 720               Then '#39'Más de ' +
        '720 días'#39'       End       IdPlazo,'
      '               Case When Plazo <= 180                   Then 5'
      '                    When Plazo Between 181 And 365 Then 10 '
      '                    When Plazo Between 366 And 720 Then 15  '
      
        '                    When Plazo > 720               Then 20      ' +
        '                End       Maximo,'
      '               Case When Cve_Moneda = 484          Then '#39'Pesos'#39
      
        '                    When Cve_Moneda = 840          Then '#39'Dolares' +
        #39'               End       Moneda,'
      
        '               Nvl (Imp_Cap_Vig,     0) + Nvl (Imp_Cap_Imp,    0' +
        ') +  '
      
        '               Nvl (Imp_Cap_Vdo_NE,  0) + Nvl (Imp_Cap_Vdo_Ex, 0' +
        ') +'
      
        '               Nvl (Imp_Int_Vig,     0) + Nvl (Imp_Int_Imp,    0' +
        ') +'
      
        '               Nvl (Imp_Int_Vdo_NE,  0) + Nvl (Imp_Int_Vdo_Ex, 0' +
        ') -'
      
        '               Case :peInt_Cob_Ant When '#39'V'#39' Then Nvl (Imp_Int_Co' +
        'b_Ant, 0) Else 0 End      Saldo'
      
        '          From Table (Pkgcrgpviews.VW_CR_GP_Saldos_Edos_Mun(:peF' +
        'echa, :peTipo_Entidad))'
      '         Where Fol_Contrato  = 1 '
      '           And F_Vencimiento Is Not Null'
      '           And F_Cierre      Is Not Null'
      '           And (:peCartas_Cred = '#39'V'#39' Or Tipo_Credito = '#39'CRED'#39')'
      '        )'
      '  Where Nvl (Imp_Cap_Imp, 0) <> 0'
      '     Or Nvl (Imp_Int_Imp, 0) <> 0'
      '     Or Nvl (Saldo,       0) <> 0       '
      
        '  Order By B_OrdMon, Nom_Acred_Reg, Id_Acreditado, Id_Contrato, ' +
        'Id_Credito, Plazo')
    Left = 344
    Top = 150
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
