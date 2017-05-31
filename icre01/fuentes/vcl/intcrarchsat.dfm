object WCrarchsat: TWCrarchsat
  Left = 320
  Top = 0
  Width = 745
  Height = 670
  Caption = 'Generador de Archivos SAT'
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
  object lbLiqF_INICIO: TLabel
    Left = 496
    Top = 12
    Width = 40
    Height = 13
    Caption = 'Ejercicio'
  end
  object Label25: TLabel
    Left = 10
    Top = 12
    Width = 42
    Height = 14
    Caption = 'Empresa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object btEMPRESA: TSpeedButton
    Left = 161
    Top = 8
    Width = 24
    Height = 23
    Caption = '1'
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000CE0E0000D80E00000001000000000000000000008080
      8000000080000080800000800000808000008000000080008000408080004040
      0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
      FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
      80008000FF004080FF000200C4000200CC00000000000000000071658400CC00
      DE00000008000200C00000001100000004000000000000000000000000000000
      00000000A000BA7F000000001C005B00D8005B00B800B87FFF00FFFFBC005B00
      2600B77FF4005D00C00000000A0000000100000000000000A4005B0012000000
      6300F7BFC00000000A00000001000000000000005700EC843F000000D0005B00
      2300F7BF0000000047000200E500F9BF7900F7BF0C000000F4005B002E00F7BF
      5700EC8400000000EC00473300000000460000004A0002002E0000001F000000
      3F002701000047333F0027015000FA3B3F000400000000000000F91AB7000000
      0000010000000A000000FA3B10000000000000003C00D379FF0047335000413C
      3F00FFFF47000000000047333F0008E88C0000000300F91AB700E78207000000
      0000000001000A00C0003F010000080000001F175900B77F14005B0094005B00
      0700B87FFF00FFFFA0005B00E200B77F14005B00AC005B00C200B87FFF00FFFF
      B8005B00B000B77F14005B00C4005B003500B87FFF00FFFFD0005B0061004100
      14005B00DC005B006E004100FF00FFFFE8005B00C100410014005B00F4005B00
      DC004100FF00FFFF00005B001800410014005B00F4005B0025004100FF00FFFF
      00005B009C0041001100000001000000000000009800BA7F0100000000000000
      0000000000000000EC0012010100000000000000000000006000188000000000
      0000000005000000000000000000000000000000000000004C000000C0000000
      000000004C005D00000000000500000003000000A0005D0004000000B4005B00
      400000000000000044005D00260008001B00230078005D0000000000F200B87F
      0000000000000000C800BB7F0000000000000000420073636100782E62007000
      6C005B004700B77FC00000001100000004000000000000000000000000000000
      00000000A000BA7F010000009C005B0058005B000000B87FFF00FFFF3C005B00
      2600B77F88005D00E80000008400581100007811000024875000101100005811
      0000308750001701980014050000000002009204000000006600000000005811
      0000728700005A87000000000000010000000000C80000006600507F1700537F
      10007F112F00A0876E00170164002F0100000000C8000000A000000090000000
      780000007F000000010000001000000000002F01F8005D0010000000AA00507F
      1700537F10002979160066376600A705EC00AC11570036EC4A00030303030303
      030303030303110E1111030303030303030303030303010E0101030303030303
      03030303030E0E110E0E03030303030303030303030E0E010E0E030303030303
      03030303110E11110E1103030303030303030303010E01010E01030303030303
      03030311110E0E0E110E03030303030303030301010E0E0E010E030303030303
      030606060E1111111103030303030303030F0F0F0E0101010103030303030303
      03060111060E110E0303030303030303030F0F01000E010E0303030303030303
      0606010E1106110303030303030303030F0F0F0E010F01030303030303030306
      0601060F0F060303030303030303030F0F0F000F0F0F03030303030303030606
      010E0F06060603030303030303030F0F0F0E0F0F0F0F03030303030303060606
      060F06060303030303030303030F0F0F0F0F0F0F030303030303030306060106
      0606060303030303030303030F0F0F0F0F0F0F03030303030303030606010E0F
      06060303030303030303030F0F0F0E0F0F0F03030303030303030306010E0F06
      06030303030303030303030F0F0E0F0F0F0303030303030303030306060F0606
      03030303030303030303030F0F0F0F0F03030303030303030303030306060603
      0303030303030303030303030F0F0F0303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303}
    Margin = 2
    OnClick = btEMPRESAClick
  end
  object lbRFC_EMPRESA: TLabel
    Left = 9
    Top = 43
    Width = 65
    Height = 13
    Caption = 'RFC Empresa'
  end
  object edEJERCICIO: TEdit
    Left = 541
    Top = 6
    Width = 74
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object btBUSCA: TBitBtn
    Left = 632
    Top = 7
    Width = 80
    Height = 25
    Caption = 'Busca'
    TabOrder = 0
    OnClick = btBUSCAClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
  end
  object edID_EMPRESA: TEdit
    Tag = 512
    Left = 89
    Top = 8
    Width = 68
    Height = 21
    Color = clMenu
    TabOrder = 1
  end
  object edNOM_EMPRESA: TEdit
    Tag = -1
    Left = 185
    Top = 8
    Width = 304
    Height = 21
    TabStop = False
    Color = clMenu
    TabOrder = 2
  end
  object edRFC_EMPRESA: TEdit
    Left = 88
    Top = 39
    Width = 207
    Height = 21
    TabOrder = 4
  end
  object PageControl1: TPageControl
    Left = 3
    Top = 63
    Width = 713
    Height = 561
    ActivePage = TabSheet1
    TabOrder = 5
    object TabSheet1: TTabSheet
      Caption = 'Datos a enviar al archivo'
      object SpeedButton7: TSpeedButton
        Left = 463
        Top = 361
        Width = 23
        Height = 22
        Hint = 'Presione el botón para cambiar ruta'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton7Click
      end
      object SpeedButton1: TSpeedButton
        Left = 463
        Top = 386
        Width = 23
        Height = 22
        Hint = 'Presione el botón para cambiar ruta'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object sagDATOS: TStringAlignGrid
        Left = -9
        Top = 9
        Width = 705
        Height = 352
        ColCount = 50
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 2
        PopupMenu = PopupMenu1
        TabOrder = 0
        OnSelectCell = sagDATOSSelectCell
        ColWidths = (
          50
          80
          80
          180
          150
          200
          200
          200
          260
          100
          100
          260
          80
          100
          120
          120
          120
          120
          120
          120
          120
          120
          120
          150
          200
          200
          100
          100
          100
          100
          260
          100
          100
          100
          100
          100
          100
          100
          100
          100
          100
          200
          600
          600
          64
          300
          140
          140
          64
          64)
        RowHeights = (
          50
          18)
        Cells = (
          0
          0
          'Tipo de registro'
          1
          0
          'Consecutivo de registro'
          2
          0
          'Clave de identificador '
          3
          0
          'RFC'
          4
          0
          'CURP'
          5
          0
          'Nombre(s)'
          6
          0
          'Apellido Paterno'
          7
          0
          'Apellido Materno'
          8
          0
          'Calle'
          9
          0
          'Número exterior'
          10
          0
          'Número interior'
          11
          0
          'Colonia'
          12
          0
          'Localidad (Código Postal)'
          13
          0
          'Municipio'
          14
          0
          'Entidad Federativa'
          15
          0
          'No. de referencia / No de Contrato'
          16
          0
          'No. de registro del fideicomiso'
          17
          0
          'Destino del crédito hipotecario'
          18
          0
          'Interés nominal devengado en el ejercicio'
          19
          0
          'Interés nominal pagado en el ejercicio'
          20
          0
          'Interés moratorio devengado en el ejercicio'
          21
          0
          'Interés moratorio pagado en el ejercicio'
          22
          0
          'Interés real'
          23
          0
          
            'Monto del crédito al 31 de diciembre del ejercicio inmediato ant' +
            'erior'
          24
          0
          
            'Monto del crédito hipotecario a la fecha de contratación (sólo c' +
            'uando ésta ocurra en el ejercicio al que corresponde la informac' +
            'ión).'
          25
          0
          
            'Fecha de contratación del crédito (sólo cuando ésta ocurra en el' +
            ' ejercicio al que corresponde la información)'
          26
          0
          'Proporción deducible'
          27
          0
          '(Dom. Hipotecado) Calle'
          28
          0
          '(Dom. Hipotecado) Número exterior'
          29
          0
          '(Dom. Hipotecado) Número interior'
          30
          0
          '(Dom. Hipotecado) Colonia'
          31
          0
          '(Dom. Hipotecado) Localidad (Código Postal)'
          32
          0
          '(Dom. Hipotecado) Municipio'
          33
          0
          '(Dom. Hipotecado) Entidad Federativa'
          34
          0
          '(No se envía al SAT) % Copropiedad'
          35
          0
          '(No se envía al SAT) No. propietarios'
          36
          0
          '(No se envía al SAT) RFC o CURP de Copropietarios'
          37
          0
          '(No se envía al SAT) Nombre Copropietario'
          38
          0
          '(No se envía al SAT) RFC Conyuges'
          39
          0
          '(No se envía al SAT) Nombre Conyuges'
          40
          0
          '(No se envía al SAT) Domicilio Conyuges'
          41
          0
          'Nombre del Cliente (Sin Separación)'
          42
          0
          'Domicilio del Cliente Sin Separación'
          43
          0
          'Domicilio Hipotecado, Sin Separación'
          44
          0
          'Clave Subtipo Banco'
          45
          0
          'Subtipo Banco'
          46
          0
          
            'Importe Total de las disposiciones otorgadas al acreditado en el' +
            ' periodo'
          47
          0
          'Importe del Saldo Insoluto del Ejercicio que se Reportar'
          48
          0
          'Credito'
          49
          0
          'Contrato')
        PropCell = (
          1
          0
          2
          1
          0
          2
          0
          1
          2
          2
          1
          0
          9
          0
          2
          1
          0
          10
          0
          2
          1
          0
          12
          0
          2
          1
          0
          13
          0
          2
          1
          0
          14
          0
          2
          1
          0
          15
          0
          2
          1
          0
          16
          0
          2
          1
          0
          17
          0
          2
          1
          0
          18
          0
          1
          2
          2
          1
          0
          19
          0
          2
          1
          0
          38
          0
          1
          2
          0)
        PropCol = (
          0
          1
          0
          0
          1
          1
          0
          0
          2
          1
          0
          0
          16
          1
          0
          0
          17
          1
          0
          0
          18
          1
          0
          0
          19
          1
          0
          0
          20
          1
          0
          0
          21
          1
          0
          0
          22
          1
          0
          0
          23
          1
          0
          0
          24
          1
          0
          0
          42
          1
          0
          0)
        PropRow = (
          0
          1
          2
          4
          16744448
          0
          6
          16777215
          -11
          'MS Sans Serif'
          0
          317847552
          0)
        PropFixedCol = ()
        PropFixedRow = (
          0
          1
          2
          2
          1
          4
          16763025
          0
          0)
      end
      object btnGenArchivo: TBitBtn
        Left = 495
        Top = 361
        Width = 205
        Height = 23
        Caption = 'Genera Archivo'
        TabOrder = 1
        OnClick = btnGenArchivoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
          00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
          00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
          00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
          0003737FFFFFFFFF7F7330099999999900333777777777777733}
        NumGlyphs = 2
      end
      object EDRUTA: TEdit
        Left = -1
        Top = 361
        Width = 463
        Height = 21
        Hint = 'Ruta dode se generará el archivo'
        Color = clInfoBk
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = 'C:\'
      end
      object MErrores: TMemo
        Left = -3
        Top = 412
        Width = 705
        Height = 117
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object btnGenArchivoXLS: TButton
        Left = 495
        Top = 385
        Width = 204
        Height = 25
        Caption = 'Genera Archivo Excel'
        TabOrder = 4
        OnClick = btnGenArchivoXLSClick
      end
      object edFileNameExcel: TEdit
        Left = -1
        Top = 386
        Width = 463
        Height = 21
        Hint = 'Ruta dode se generará el archivo'
        Color = 8454016
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Text = 'C:\'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Revisión de Crédito'
      ImageIndex = 1
      object lbDirectory: TLabel
        Left = 4
        Top = 406
        Width = 45
        Height = 13
        Caption = 'Directorio'
      end
      object Label2: TLabel
        Left = 656
        Top = 520
        Width = 44
        Height = 10
        Caption = '26/03/2012'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBGrid1: TDBGrid
        Left = 4
        Top = 50
        Width = 694
        Height = 329
        DataSource = dscDataQry
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object TabSet1: TTabSet
        Left = 3
        Top = 378
        Width = 694
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        StartMargin = 0
        Tabs.Strings = (
          'Saldo Inicial'
          'Periodos Interes'
          'Moratorios'
          'Periodos Interés Liquidados'
          'Desglose Capital'
          'Desglose Comisión'
          'Pagos Ene Periodos Dic'
          'Imp. Tot. de Creditos Otorg al Acred.'
          'Datos a Enviar SAT')
        TabIndex = 0
        OnChange = TabSet1Change
      end
      object btnMuestra: TButton
        Left = 617
        Top = 2
        Width = 75
        Height = 22
        Caption = '&Muestra'
        TabOrder = 3
        OnClick = btnMuestraClick
      end
      object edDirectory: TEdit
        Left = 56
        Top = 403
        Width = 558
        Height = 21
        TabOrder = 4
        Text = 'C:\'
      end
      object btnGenera: TButton
        Left = 620
        Top = 401
        Width = 75
        Height = 25
        Caption = '&Genera'
        TabOrder = 5
        OnClick = btnGeneraClick
      end
      object opID_CREDITO: TRadioButton
        Left = 6
        Top = 5
        Width = 101
        Height = 17
        Caption = 'Crédito a Revisar'
        Checked = True
        TabOrder = 6
        TabStop = True
      end
      object opGenerarTodos: TRadioButton
        Left = 6
        Top = 30
        Width = 107
        Height = 17
        Caption = 'Generar Todos'
        TabOrder = 7
      end
      object ProgressBar1: TProgressBar
        Left = 116
        Top = 30
        Width = 572
        Height = 17
        Min = 0
        Max = 100
        TabOrder = 8
      end
      object edID_CREDITO: TInterEdit
        Left = 115
        Top = 4
        Width = 101
        Height = 21
        HelpContext = 1401
        Prefijo = '1'
        Contrato = -1
        TipoReader = trEntero
        MaxLength = 10
        TabOrder = 0
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object Button1: TButton
        Left = 608
        Top = 440
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 9
        Visible = False
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Generacion Inicial'
      ImageIndex = 2
      object btnGenLayoutSAT: TButton
        Left = 3
        Top = 68
        Width = 489
        Height = 56
        Caption = 'Genera LAYOUT del SAT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnGenLayoutSATClick
      end
      object opID_CREDITO2: TRadioButton
        Left = 6
        Top = 5
        Width = 101
        Height = 17
        Caption = 'Crédito a Revisar'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object opGenerarTodos2: TRadioButton
        Left = 6
        Top = 30
        Width = 107
        Height = 17
        Caption = 'Generar Todos'
        TabOrder = 2
      end
      object edID_CREDITO2: TInterEdit
        Left = 115
        Top = 4
        Width = 101
        Height = 21
        HelpContext = 1401
        Prefijo = '1'
        Contrato = -1
        TipoReader = trEntero
        MaxLength = 10
        TabOrder = 3
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object btnRegenDomicilioSAT: TButton
        Left = 3
        Top = 180
        Width = 489
        Height = 56
        Caption = 'Actualiza Domicilios Convertidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = btnRegenDomicilioSATClick
      end
    end
  end
  object grbxTipoDeclaracion: TGroupBox
    Left = 300
    Top = 32
    Width = 413
    Height = 32
    TabOrder = 6
    object Label1: TLabel
      Left = 10
      Top = 12
      Width = 96
      Height = 13
      Caption = 'Tipo de Declaración'
    end
    object lbFechaComplementaria: TLabel
      Left = 282
      Top = 12
      Width = 30
      Height = 13
      Caption = 'Fecha'
      Enabled = False
    end
    object opNormal: TRadioButton
      Left = 117
      Top = 11
      Width = 58
      Height = 17
      Caption = 'Normal'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = opNormalClick
    end
    object opComplementaria: TRadioButton
      Left = 180
      Top = 11
      Width = 100
      Height = 17
      Caption = 'Complementaria'
      TabOrder = 1
      OnClick = opComplementariaClick
    end
    object dtpFechaComplementaria: TDateTimePicker
      Left = 319
      Top = 8
      Width = 89
      Height = 20
      CalAlignment = dtaLeft
      Date = 39083.4646909259
      Time = 39083.4646909259
      Color = clBtnFace
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
    end
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
    OnDespuesShow = InterForma1DespuesShow
    Left = 338
    Top = 5
  end
  object ilEMPRESA: TInterLinkit
    Control = edID_EMPRESA
    TipoReader = trTexto
    CharCase = ecNormal
    Left = 216
  end
  object OpenDialogXLS: TOpenDialog
    DefaultExt = 'XLS'
    Filter = 'Archivos Excel (*.XLS)|*.XLS'
    Left = 663
    Top = 388
  end
  object QrySaldoInicial: TQuery
    Left = 235
    Top = 81
  end
  object QryPeriodosInteres: TQuery
    Left = 264
    Top = 81
  end
  object QueryMoratorios: TQuery
    Left = 293
    Top = 81
  end
  object desarrollo: TQuery
    Left = 321
    Top = 81
  end
  object QryDesglosCap: TQuery
    Left = 494
    Top = 81
  end
  object QryDesgloseComision: TQuery
    Left = 379
    Top = 81
  end
  object dscDataQry: TDataSource
    AutoEdit = False
    DataSet = QrySaldoInicial
    Left = 526
    Top = 85
  end
  object QryPagEnero: TQuery
    Left = 407
    Top = 81
  end
  object QrySatCreLayout: TQuery
    Left = 435
    Top = 81
  end
  object OpenDialog1: TOpenDialog
    Left = 664
    Top = 352
  end
  object QryImpCredOtorgados: TQuery
    Left = 462
    Top = 81
  end
  object QryInteresLiquidado: TQuery
    Left = 350
    Top = 81
  end
  object PopupMenu1: TPopupMenu
    Left = 183
    Top = 231
    object DetalleLayout1: TMenuItem
      Caption = 'Detalle Layout'
      OnClick = DetalleLayout1Click
    end
    object DomicilioConvertidoContrato1: TMenuItem
      Caption = 'Domicilio Convertido Contrato'
      OnClick = DomicilioConvertidoContrato1Click
    end
    object DomicilioConvertidoInmueble1: TMenuItem
      Caption = 'Domicilio Convertido Inmueble'
      OnClick = DomicilioConvertidoInmueble1Click
    end
    object RelacionContratoDomicilios1: TMenuItem
      Caption = 'Relacion Contrato - Domicilios'
      OnClick = RelacionContratoDomicilios1Click
    end
  end
end
