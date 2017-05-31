object WBcLayVC: TWBcLayVC
  Left = 48
  Top = 42
  Width = 1055
  Height = 632
  Caption = 'Venta de Cartera para BC_LAYOUT'
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
  object lbTIPO_CARGA: TLabel
    Left = 8
    Top = 0
    Width = 52
    Height = 13
    Caption = 'Tipo Carga'
  end
  object lbNUMERO_CUENTA: TLabel
    Left = 73
    Top = 0
    Width = 74
    Height = 13
    Caption = 'Numero Cuenta'
  end
  object lbUID_CUS: TLabel
    Left = 216
    Top = 0
    Width = 37
    Height = 13
    Caption = 'Uid Cus'
  end
  object lbRFC: TLabel
    Left = 424
    Top = 0
    Width = 17
    Height = 13
    Caption = 'Rfc'
  end
  object lbPRIMER_NOMBRE: TLabel
    Left = 8
    Top = 41
    Width = 69
    Height = 13
    Caption = 'Primer Nombre'
  end
  object lbSEGUNDO_NOMBRE: TLabel
    Left = 216
    Top = 41
    Width = 83
    Height = 13
    Caption = 'Segundo Nombre'
  end
  object lbAPELLIDO_PATERNO: TLabel
    Left = 424
    Top = 41
    Width = 77
    Height = 13
    Caption = 'Apellido Paterno'
  end
  object lbAPELLIDO_MATERNO: TLabel
    Left = 632
    Top = 41
    Width = 79
    Height = 13
    Caption = 'Apellido Materno'
  end
  object lbAPELLIDO_ADICIONAL: TLabel
    Left = 840
    Top = 41
    Width = 83
    Height = 13
    Caption = 'Apellido Adicional'
  end
  object lbFECHA_NACIMIENTO: TLabel
    Left = 8
    Top = 87
    Width = 86
    Height = 13
    Caption = 'Fecha Nacimiento'
  end
  object lbSEXO: TLabel
    Left = 128
    Top = 88
    Width = 24
    Height = 13
    Caption = 'Sexo'
  end
  object lbESTADO_CIVIL: TLabel
    Left = 160
    Top = 88
    Width = 55
    Height = 13
    Caption = 'Estado Civil'
  end
  object lbNAT: TLabel
    Left = 227
    Top = 88
    Width = 17
    Height = 13
    Caption = 'Nat'
  end
  object lbECON_ACT: TLabel
    Left = 272
    Top = 88
    Width = 44
    Height = 13
    Caption = 'Econ Act'
  end
  object lbTIPO_CLIENTE: TLabel
    Left = 456
    Top = 88
    Width = 56
    Height = 13
    Caption = 'Tipo Cliente'
  end
  object lbINDICADOR_DEFUNCION: TLabel
    Left = 664
    Top = 88
    Width = 96
    Height = 13
    Caption = 'Indicador Defuncion'
  end
  object lbFECHA_DEFUNCION: TLabel
    Left = 771
    Top = 88
    Width = 82
    Height = 13
    Caption = 'Fecha Defuncion'
  end
  object lbPAIS: TLabel
    Left = 873
    Top = 88
    Width = 20
    Height = 13
    Caption = 'Pais'
  end
  object lbESTADO: TLabel
    Left = 910
    Top = 88
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  object lbNOM_CIT: TLabel
    Left = 9
    Top = 131
    Width = 52
    Height = 13
    Caption = 'Nombre Cit'
  end
  object lbDELEGACION_MUNICIPIO: TLabel
    Left = 217
    Top = 131
    Width = 102
    Height = 13
    Caption = 'Delegacion Municipio'
  end
  object lbCOLONIA_POBLACION: TLabel
    Left = 425
    Top = 131
    Width = 85
    Height = 13
    Caption = 'Colonia Poblacion'
  end
  object lbNUMERO_EXTERIOR: TLabel
    Left = 633
    Top = 130
    Width = 75
    Height = 13
    Caption = 'Numero Exterior'
  end
  object lbCODIGO_POSTAL: TLabel
    Left = 841
    Top = 130
    Width = 65
    Height = 13
    Caption = 'Codigo Postal'
  end
  object lbNUMERO_TELEFONO: TLabel
    Left = 929
    Top = 130
    Width = 82
    Height = 13
    Caption = 'Numero Telefono'
  end
  object lbEXTENSION_TELEFONICA: TLabel
    Left = 9
    Top = 178
    Width = 99
    Height = 13
    Caption = 'Extension Telefonica'
  end
  object lbTIPO_DOMICILIO: TLabel
    Left = 217
    Top = 178
    Width = 66
    Height = 13
    Caption = 'Tipo Domicilio'
  end
  object lbTIPO_RESPONSABILIDAD: TLabel
    Left = 297
    Top = 178
    Width = 102
    Height = 13
    Caption = 'Tipo Responsabilidad'
  end
  object edTIPO_CARGA: TEdit
    Tag = 50
    Left = 8
    Top = 16
    Width = 16
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edNUMERO_CUENTA: TEdit
    Tag = 50
    Left = 72
    Top = 16
    Width = 136
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edUID_CUS: TEdit
    Tag = 18
    Left = 216
    Top = 16
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object edRFC: TEdit
    Tag = 18
    Left = 424
    Top = 16
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object edPRIMER_NOMBRE: TEdit
    Tag = 18
    Left = 8
    Top = 57
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object edSEGUNDO_NOMBRE: TEdit
    Tag = 18
    Left = 216
    Top = 57
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
  end
  object edAPELLIDO_PATERNO: TEdit
    Tag = 18
    Left = 424
    Top = 57
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 6
  end
  object edAPELLIDO_MATERNO: TEdit
    Tag = 18
    Left = 632
    Top = 57
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 7
  end
  object edAPELLIDO_ADICIONAL: TEdit
    Tag = 18
    Left = 840
    Top = 57
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 8
  end
  object dtpFECHA_NACIMIENTO: TInterDateTimePicker
    Tag = 18
    Left = 98
    Top = 103
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 41263.4905073843
    Time = 41263.4905073843
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 9
    Edit = edFECHA_NACIMIENTO
    Formato = dfDate
  end
  object edFECHA_NACIMIENTO: TEdit
    Tag = 18
    Left = 8
    Top = 103
    Width = 90
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 10
  end
  object edSEXO: TEdit
    Tag = 18
    Left = 128
    Top = 104
    Width = 18
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 11
  end
  object edESTADO_CIVIL: TEdit
    Tag = 18
    Left = 162
    Top = 104
    Width = 19
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 12
  end
  object edNAT: TEdit
    Tag = 18
    Left = 228
    Top = 104
    Width = 32
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 13
  end
  object edECON_ACT: TEdit
    Tag = 18
    Left = 272
    Top = 104
    Width = 176
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 14
  end
  object edTIPO_CLIENTE: TEdit
    Tag = 18
    Left = 456
    Top = 104
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 15
  end
  object edINDICADOR_DEFUNCION: TEdit
    Tag = 18
    Left = 664
    Top = 104
    Width = 16
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 16
  end
  object dtpFECHA_DEFUNCION: TInterDateTimePicker
    Tag = 18
    Left = 844
    Top = 104
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 41263.4905073843
    Time = 41263.4905073843
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 17
    Edit = edFECHA_DEFUNCION
    Formato = dfDate
  end
  object edFECHA_DEFUNCION: TEdit
    Tag = 18
    Left = 771
    Top = 104
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 18
  end
  object edPAIS: TEdit
    Tag = 18
    Left = 873
    Top = 104
    Width = 32
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 19
  end
  object edESTADO: TEdit
    Tag = 18
    Left = 910
    Top = 104
    Width = 64
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 20
  end
  object edNOM_CIT: TEdit
    Tag = 18
    Left = 9
    Top = 147
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 21
  end
  object edDELEGACION_MUNICIPIO: TEdit
    Tag = 18
    Left = 217
    Top = 147
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 22
  end
  object edCOLONIA_POBLACION: TEdit
    Tag = 18
    Left = 425
    Top = 147
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 23
  end
  object edNUMERO_EXTERIOR: TEdit
    Tag = 18
    Left = 633
    Top = 146
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 24
  end
  object edCODIGO_POSTAL: TEdit
    Tag = 18
    Left = 841
    Top = 146
    Width = 80
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 25
  end
  object edNUMERO_TELEFONO: TEdit
    Tag = 18
    Left = 929
    Top = 146
    Width = 110
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 26
  end
  object edEXTENSION_TELEFONICA: TEdit
    Tag = 18
    Left = 9
    Top = 194
    Width = 200
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 27
  end
  object edTIPO_DOMICILIO: TEdit
    Tag = 18
    Left = 217
    Top = 194
    Width = 16
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 28
  end
  object edTIPO_RESPONSABILIDAD: TEdit
    Tag = 18
    Left = 297
    Top = 194
    Width = 16
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 29
  end
  object btCargaVC: TBitBtn
    Left = 601
    Top = 188
    Width = 192
    Height = 25
    BiDiMode = bdLeftToRight
    Caption = 'Importar Venta de Cartera'
    ParentBiDiMode = False
    TabOrder = 30
    OnClick = btCargaVCClick
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
    Layout = blGlyphRight
  end
  object sgcDatos: TSGCtrl
    Left = 1022
    Top = 305
    Width = 11
    Height = 29
    ShowTab = True
    TabOrder = 31
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
  end
  object Panel1: TPanel
    Left = 7
    Top = 229
    Width = 1033
    Height = 21
    Caption = 'IMPORTACIONES HISTÓRICAS (ordenadas descendentemente)'
    Color = clYellow
    TabOrder = 32
  end
  object DBGrid1: TDBGrid
    Left = 7
    Top = 248
    Width = 1033
    Height = 344
    DataSource = DSQryHistoVC
    FixedColor = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 33
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -12
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDrawDataCell = DBGrid1DrawDataCell
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnBuscar = InterForma1Buscar
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
    Left = 680
  end
  object odArchivoCarga: TOpenDialog
    Left = 471
    Top = 190
  end
  object Excel_Application: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 503
    Top = 190
  end
  object Excel_Worksheet: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 535
    Top = 190
  end
  object Excel_Workbook: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 568
    Top = 190
  end
  object QryHistoVC: TQuery
    SQL.Strings = (
      
        'SELECT F_PROCESO, ID_CSC, TIPO_CARGA, TIPO_CARTERA, NUMERO_CUENT' +
        'A, UID_CUS, '
      
        'TIPO_CONTRATO, TIPO_CREDITO, CLAVE_MONEDA, FECHA_APERTURA, FECHA' +
        '_REESTRUCTURA, NUMERO_PAGOS,'
      
        'EXPERIENCIAS_CREDITICIAS, CLAVE_FRECUENCIA_PAGOS, CLAVE_FRECUENC' +
        'IA_PAGOS_NUM, LIMITE_CREDITO, CREDITO_MAXIMO,'
      
        'SALDO_INICIAL, SALDO_ACTUAL, SALDO_VENCIDO, PAGOS_VENCIDOS, DIAS' +
        '_VENCIDO, MONTO_A_PAGAR,'
      
        'PLAZO, IMPORTE_AVALUO, GARANTIA, IMPORTE_PAGO, PAGO_EFECTIVO, SA' +
        'LDO_QUITA, SALDO_DACION, QUEBRANTO,'
      
        'FECHA_ULTIMO_PAGO, FECHA_ULTIMA_COMPRA, FECHA_QUEBRANTO, FECHA_L' +
        'IQUIDACION, FECHA_CIERRE, CLAVE_OBSERVACION,'
      
        'CALIFICACION_CARTERA, CUENTA_CONTABLE, NUMERO_CONTRATO_ANTERIOR,' +
        ' NOMBRE_OTORGANTE_ANTERIOR,'
      
        'CLAVE_OTORGANTE_ANTERIOR, NUMERO_CUENTA_ANTERIOR, BLOQUEO, FECHA' +
        '_PRIMER_INCUM, CLAVE_CONSOLIDA_EM,'
      
        'SALDO_INSOLUTO, MONTO_ULTIMO_PAGO, SIT_VC_HISTO, F_ALTA, CVE_USU' +
        '_ALTA, F_MODIFICA, CVE_USU_MODIFICA '
      'FROM  BC_LAYOUT_VC_HISTO '
      'WHERE  TIPO_CARGA = '#39'A'#39
      'AND  TIPO_CARTERA = '#39'VC'#39
      'AND  NUMERO_CUENTA = '#39'101010'#39
      'AND  UID_CUS = '#39'45678'#39
      'ORDER BY F_PROCESO, ID_CSC')
    Left = 856
    Top = 208
  end
  object DSQryHistoVC: TDataSource
    DataSet = QryHistoVC
    Left = 889
    Top = 208
  end
end
