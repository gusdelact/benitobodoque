object WCrMaxFnEd: TWCrMaxFnEd
  Left = 257
  Top = 131
  Width = 977
  Height = 448
  Caption = 
    'Límite Máximo de Financiamiento a Estados en valores absolutos y' +
    ' relativos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 8
    Top = 328
    Width = 17
    Height = 17
    Brush.Color = 15849925
  end
  object Label2: TLabel
    Left = 32
    Top = 328
    Width = 52
    Height = 13
    Caption = 'Producto 1'
  end
  object Shape2: TShape
    Left = 104
    Top = 328
    Width = 17
    Height = 17
    Brush.Color = 14281213
  end
  object Label3: TLabel
    Left = 128
    Top = 328
    Width = 52
    Height = 13
    Caption = 'Producto 4'
  end
  object Shape3: TShape
    Left = 200
    Top = 328
    Width = 17
    Height = 17
    Brush.Color = 12379352
  end
  object Label4: TLabel
    Left = 224
    Top = 328
    Width = 52
    Height = 13
    Caption = 'Producto 7'
  end
  object sbExportar: TSpeedButton
    Left = 824
    Top = 344
    Width = 113
    Height = 22
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
    PopupMenu = pmExportar
    OnClick = sbExportarClick
  end
  object sbPopupExportar: TSpeedButton
    Left = 936
    Top = 344
    Width = 14
    Height = 22
    Glyph.Data = {
      56040000424D5604000000000000360400002800000007000000040000000100
      0800000000002000000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A6000020400000206000002080000020A0000020C0000020E000004000000040
      20000040400000406000004080000040A0000040C0000040E000006000000060
      20000060400000606000006080000060A0000060C0000060E000008000000080
      20000080400000806000008080000080A0000080C0000080E00000A0000000A0
      200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
      200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
      200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
      20004000400040006000400080004000A0004000C0004000E000402000004020
      20004020400040206000402080004020A0004020C0004020E000404000004040
      20004040400040406000404080004040A0004040C0004040E000406000004060
      20004060400040606000406080004060A0004060C0004060E000408000004080
      20004080400040806000408080004080A0004080C0004080E00040A0000040A0
      200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
      200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
      200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
      20008000400080006000800080008000A0008000C0008000E000802000008020
      20008020400080206000802080008020A0008020C0008020E000804000008040
      20008040400080406000804080008040A0008040C0008040E000806000008060
      20008060400080606000806080008060A0008060C0008060E000808000008080
      20008080400080806000808080008080A0008080C0008080E00080A0000080A0
      200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
      200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
      200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
      2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
      2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
      2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
      2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
      2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
      2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
      2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F6F6F600F6F6
      F600F6F6000000F6F600F60000000000F6000000000000000000}
    PopupMenu = pmExportar
    OnClick = sbPopupExportarClick
  end
  object sbImprimir: TSpeedButton
    Left = 824
    Top = 376
    Width = 126
    Height = 22
    Caption = 'Imprimir'
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
    OnClick = sbImprimirClick
  end
  object Label5: TLabel
    Left = 838
    Top = 8
    Width = 112
    Height = 13
    Caption = 'Índice de Capitalización'
  end
  object Shape4: TShape
    Left = 8
    Top = 352
    Width = 17
    Height = 17
    Brush.Color = 14994616
  end
  object Label1: TLabel
    Left = 32
    Top = 352
    Width = 52
    Height = 13
    Caption = 'Producto 2'
  end
  object Shape5: TShape
    Left = 104
    Top = 352
    Width = 17
    Height = 17
    Brush.Color = 11851260
  end
  object Label6: TLabel
    Left = 128
    Top = 352
    Width = 52
    Height = 13
    Caption = 'Producto 5'
  end
  object Shape6: TShape
    Left = 200
    Top = 352
    Width = 17
    Height = 17
    Brush.Color = 10213316
  end
  object Label7: TLabel
    Left = 224
    Top = 352
    Width = 52
    Height = 13
    Caption = 'Producto 8'
  end
  object Shape7: TShape
    Left = 8
    Top = 376
    Width = 17
    Height = 17
    Brush.Color = 14857357
  end
  object Label8: TLabel
    Left = 32
    Top = 376
    Width = 52
    Height = 13
    Caption = 'Producto 3'
  end
  object Shape8: TShape
    Left = 104
    Top = 376
    Width = 17
    Height = 17
    Brush.Color = 9420794
  end
  object Label9: TLabel
    Left = 128
    Top = 376
    Width = 52
    Height = 13
    Caption = 'Producto 6'
  end
  object Shape9: TShape
    Left = 200
    Top = 376
    Width = 17
    Height = 17
    Brush.Color = 5880731
  end
  object Label10: TLabel
    Left = 224
    Top = 376
    Width = 52
    Height = 13
    Caption = 'Producto 9'
  end
  object Label11: TLabel
    Left = 608
    Top = 320
    Width = 342
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 
      '* PI estimada por no contar con la información de Buró de Crédit' +
      'o'
  end
  object dpFecha: TDateTimePicker
    Left = 392
    Top = 16
    Width = 129
    Height = 21
    CalAlignment = dtaLeft
    Date = 40984.3967984722
    Time = 40984.3967984722
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
    TabStop = False
    Visible = False
    OnChange = dpFechaChange
  end
  object Chart: TDBChart
    Left = 368
    Top = 16
    Width = 17
    Height = 25
    BackWall.Brush.Color = clWhite
    BackWall.Color = clWhite
    Title.Text.Strings = (
      'Límite Máximo de Financiamiento a Estados')
    BackColor = clWhite
    BottomAxis.LabelsAngle = 90
    View3D = False
    TabOrder = 1
    Visible = False
  end
  object cbDisplayMarks: TCheckBox
    Left = 376
    Top = 384
    Width = 169
    Height = 17
    Caption = 'Desplegar etiquetas de valores'
    TabOrder = 4
    OnClick = cbDisplayMarksClick
  end
  object rgProyeccion: TRadioGroup
    Left = 376
    Top = 344
    Width = 121
    Height = 33
    Caption = ' Proyección '
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      '2D'
      '3D')
    TabOrder = 2
    OnClick = rgProyeccionClick
  end
  object rgInfoDesplegar: TRadioGroup
    Left = 504
    Top = 344
    Width = 177
    Height = 33
    Caption = ' Desplegar '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Porcentajes'
      'Importes')
    TabOrder = 3
    OnClick = rgInfoDesplegarClick
  end
  object cbFideicomiso: TCheckBox
    Left = 552
    Top = 384
    Width = 81
    Height = 17
    Caption = 'Fideicomiso'
    Checked = True
    State = cbChecked
    TabOrder = 5
    OnClick = rgInfoDesplegarClick
  end
  object cbMandato: TCheckBox
    Left = 640
    Top = 384
    Width = 65
    Height = 17
    Caption = 'Mandato'
    Checked = True
    State = cbChecked
    TabOrder = 6
    OnClick = rgInfoDesplegarClick
  end
  object cbSinEstructura: TCheckBox
    Left = 712
    Top = 384
    Width = 97
    Height = 17
    Caption = 'Sin estructura'
    Checked = True
    State = cbChecked
    TabOrder = 7
    OnClick = rgInfoDesplegarClick
  end
  object rgTipoGrafica: TRadioGroup
    Left = 688
    Top = 344
    Width = 129
    Height = 33
    Caption = ' Tipo de gráfica '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Barra'
      'Línea')
    TabOrder = 8
    OnClick = rgInfoDesplegarClick
  end
  object edIndiceCapitalizacion: TEdit
    Left = 837
    Top = 24
    Width = 113
    Height = 21
    BiDiMode = bdRightToLeft
    Color = clBtnFace
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 9
  end
  object rgFactorMoneda: TRadioGroup
    Left = 8
    Top = 8
    Width = 353
    Height = 41
    Caption = ' Información expresada en: '
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Millones de pesos'
      'Miles de pesos'
      'Pesos')
    TabOrder = 10
    OnClick = dpFechaChange
  end
  object sagDatos: TStringAlignGrid
    Left = 8
    Top = 56
    Width = 945
    Height = 257
    Color = clWhite
    ColCount = 20
    DefaultRowHeight = 20
    RowCount = 3
    FixedRows = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 11
    Wordwrap = ww_wordwrap
    ColWidths = (
      120
      42
      42
      100
      42
      100
      42
      100
      42
      100
      42
      100
      42
      100
      42
      100
      42
      100
      42
      100)
    RowHeights = (
      0
      20
      20)
    Cells = (
      0
      1
      'Entidad'
      1
      1
      'P.I.'
      2
      0
      'Producto 1'
      2
      1
      '(%)'
      3
      1
      '($)'
      4
      0
      'Producto 2'
      4
      1
      '(%)'
      5
      1
      '($)'
      6
      0
      'Producto 3'
      6
      1
      '(%)'
      7
      1
      '($)'
      8
      0
      'Producto  4'
      8
      1
      '(%)'
      9
      1
      '($)'
      10
      0
      'Producto 5'
      10
      1
      '(%)'
      11
      1
      '($)'
      12
      0
      'Producto  6'
      12
      1
      '(%)'
      13
      1
      '($)'
      14
      0
      'Producto  7'
      14
      1
      '(%)'
      15
      1
      '($)'
      16
      0
      'Producto  8'
      16
      1
      '(%)'
      17
      1
      '($)'
      18
      0
      'Producto  9'
      18
      1
      '(%)'
      19
      1
      '($)')
    PropCell = (
      0
      1
      1
      2
      0
      1
      1
      1
      2
      0
      2
      0
      1
      2
      0
      2
      1
      1
      2
      0
      3
      1
      1
      2
      0
      4
      1
      1
      2
      0
      5
      1
      1
      2
      0
      6
      1
      1
      2
      0
      7
      1
      1
      2
      0
      8
      1
      1
      2
      0
      9
      1
      1
      2
      0
      10
      1
      1
      2
      0
      11
      1
      1
      2
      0
      12
      1
      1
      2
      0
      13
      1
      1
      2
      0
      14
      1
      1
      2
      0
      15
      1
      1
      2
      0
      16
      1
      1
      2
      0
      17
      1
      1
      2
      0
      18
      1
      1
      2
      0
      19
      1
      1
      2
      0)
    PropCol = (
      0
      1
      1
      0
      1
      1
      2
      0
      2
      1
      2
      0
      3
      1
      0
      0
      4
      1
      2
      0
      5
      1
      0
      0
      6
      1
      2
      0
      7
      1
      0
      0
      8
      1
      2
      0
      9
      1
      0
      0
      10
      1
      2
      0
      11
      1
      0
      0
      12
      1
      2
      0
      13
      1
      0
      0
      14
      1
      2
      0
      15
      1
      0
      0
      16
      1
      2
      0
      17
      1
      0
      0
      18
      1
      2
      0
      19
      1
      0
      0)
    PropRow = (
      1
      1
      2
      0)
    PropFixedCol = ()
    PropFixedRow = (
      0
      1
      2
      0)
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
    Left = 808
    Top = 64
  end
  object QDatos: TQuery
    AfterOpen = QDatosAfterOpen
    SQL.Strings = (
      'Select *'
      
        '  From Table (PkgCRGPViews.VW_CR_GP_Finan_Max_Edos (To_Date (:Fe' +
        'cha, '#39'dd/mm/yyyy'#39')))'
      ' Order By Desc_Poblacion')
    Left = 544
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Fecha'
        ParamType = ptUnknown
      end>
  end
  object pmExportar: TPopupMenu
    Tag = 3
    Left = 544
    Top = 192
    object Tablaygrfica1: TMenuItem
      Tag = 3
      Caption = 'Tabla &y gráfica'
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = PopupMenuGraficaTabla
    end
    object Solotabla1: TMenuItem
      Tag = 1
      Caption = 'Solo &tabla'
      GroupIndex = 1
      RadioItem = True
      OnClick = PopupMenuGraficaTabla
    end
    object Sologrfica1: TMenuItem
      Tag = 2
      Caption = 'Solo &gráfica'
      GroupIndex = 1
      OnClick = PopupMenuGraficaTabla
    end
  end
  object SaveXLS: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Archivos de Excel *.xls|*.xls|Todos los archivos|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Exportar a Excel'
    Left = 576
    Top = 192
  end
  object QIndiceCapitalizacion: TQuery
    AfterOpen = QIndiceCapitalizacionAfterOpen
    SQL.Strings = (
      'Select Imp_Capital_Basico * :Factor Imp_Capital_Basico'
      
        '  From Table (PkgCRGPViews.VW_CR_GP_Capital_Basico (To_Date (:Fe' +
        'cha, '#39'dd/mm/yyyy'#39')))   '
      ' Where Pct_Capital = 100'
      '   And RowNum      = 1  ')
    Left = 576
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Factor'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Fecha'
        ParamType = ptUnknown
      end>
  end
end
