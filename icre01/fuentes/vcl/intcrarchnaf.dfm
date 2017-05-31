object WCrArchNaf: TWCrArchNaf
  Left = 292
  Top = 62
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Carga de Archivo Nafin'
  ClientHeight = 557
  ClientWidth = 778
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
  object lbFiltro: TLabel
    Left = 7
    Top = 9
    Width = 39
    Height = 14
    Caption = 'Formato'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 7
    Top = 33
    Width = 106
    Height = 14
    Caption = 'Entidad Descontadora'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object PnDatos: TPanel
    Left = 3
    Top = 532
    Width = 774
    Height = 21
    TabOrder = 4
    object lbEmpresa: TLabel
      Left = 11
      Top = 2
      Width = 42
      Height = 8
      Caption = 'EMPRESA :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbUsuario: TLabel
      Left = 11
      Top = 9
      Width = 44
      Height = 8
      Caption = 'USUARIO : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbFecha: TLabel
      Left = 368
      Top = 2
      Width = 50
      Height = 8
      Caption = 'FECHA HOY :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbPerfil: TLabel
      Left = 368
      Top = 9
      Width = 33
      Height = 8
      Caption = 'PERFIL :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDUsuario: TLabel
      Left = 75
      Top = 9
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDPerfil: TLabel
      Left = 432
      Top = 9
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDFecha: TLabel
      Left = 432
      Top = 2
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDEmpresa: TLabel
      Left = 75
      Top = 2
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PageControl: TPageControl
    Left = 2
    Top = 58
    Width = 775
    Height = 473
    ActivePage = TabSheet1
    TabOrder = 3
    OnChanging = PageControlChanging
    object TabSheet1: TTabSheet
      Caption = 'Paso 1  ( Cargar )'
      object Label6: TLabel
        Left = 759
        Top = 432
        Width = 6
        Height = 13
        Caption = '$'
      end
      object gbxArchivo: TGroupBox
        Left = 96
        Top = 5
        Width = 577
        Height = 145
        TabOrder = 0
        object Label5: TLabel
          Left = 83
          Top = 25
          Width = 208
          Height = 13
          Caption = 'Indique la Ruta del Archivo Nafin a Cargar...'
        end
        object lblLoad: TLabel
          Left = 84
          Top = 75
          Width = 85
          Height = 13
          Caption = 'Cargando Archivo'
        end
        object lblRegisters: TLabel
          Left = 324
          Top = 94
          Width = 83
          Height = 13
          Caption = 'Leyendo Registro'
        end
        object lblCount: TLabel
          Left = 459
          Top = 94
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = '0 de 0'
        end
        object lbTokenTexto: TLabel
          Left = 336
          Top = 25
          Width = 97
          Height = 13
          Caption = 'Delimitador de Texto'
          Visible = False
        end
        object edFileName: TEdit
          Left = 86
          Top = 44
          Width = 379
          Height = 21
          TabOrder = 0
          OnChange = edFileNameChange
        end
        object btnFileName: TBitBtn
          Left = 465
          Top = 45
          Width = 23
          Height = 22
          Caption = '...'
          TabOrder = 1
          OnClick = btnFileNameClick
        end
        object ProgressBar: TProgressBar
          Left = 182
          Top = 75
          Width = 307
          Height = 16
          Min = 0
          Max = 100
          TabOrder = 2
        end
        object btnLoadFile: TBitBtn
          Left = 424
          Top = 112
          Width = 113
          Height = 25
          Caption = '&Cargar'
          TabOrder = 3
          OnClick = btnLoadFileClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333000003333333333F777773FF333333008F88800
            33333337733333773F33330FFF8F888F033333733333333373F330DEFFF8F8FE
            D03337F33333333337F330DDEFFFFFEDD0333733333FFF33373F0BBFDE000EDF
            BB037F33337773F3337F0AABB08880BBAA037F3337F3F7F3337F0EEAA08080AA
            EE037F3337F737F3337F0AABB08880BBAA037F33373FF733337F0BBFDE000EDB
            BB0373F333777333337330DDEFFFFFEDD03337F33333333337F330DEF8F8FFFE
            D033373F333333333733330FFF8F8FFF03333373FF33333F733333300FF8F800
            3333333773FFFF77333333333000003333333333377777333333}
          NumGlyphs = 2
        end
        object cbTokenTexto: TComboBox
          Left = 440
          Top = 21
          Width = 48
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
          Visible = False
          Items.Strings = (
            '"'
            #39)
        end
      end
      object gbxLoadAcuse: TGroupBox
        Left = 96
        Top = 160
        Width = 577
        Height = 89
        TabOrder = 1
        object lblAcuse: TLabel
          Left = 16
          Top = 30
          Width = 30
          Height = 13
          Caption = 'Acuse'
        end
        object Label2: TLabel
          Left = 240
          Top = 30
          Width = 91
          Height = 13
          Caption = 'Nombre de Archivo'
        end
        object edId_Acuse: TEdit
          Tag = 512
          Left = 56
          Top = 26
          Width = 145
          Height = 21
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object btnID_ACUSE: TBitBtn
          Tag = 512
          Left = 209
          Top = 26
          Width = 25
          Height = 22
          Enabled = False
          TabOrder = 1
          TabStop = False
          OnClick = btnID_ACUSEClick
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
        object edNom_Archivo: TEdit
          Left = 344
          Top = 26
          Width = 193
          Height = 21
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 2
        end
        object btnLoadAcuse: TBitBtn
          Left = 424
          Top = 51
          Width = 113
          Height = 25
          Caption = '&Cargar Acuse'
          Enabled = False
          TabOrder = 3
          OnClick = btnLoadAcuseClick
          NumGlyphs = 2
        end
      end
      object opLoadFile: TRadioButton
        Left = 104
        Top = 1
        Width = 149
        Height = 17
        Caption = 'Realizar Carga por Archivo'
        Checked = True
        TabOrder = 2
        TabStop = True
        OnClick = opLoadAcuseClick
      end
      object opLoadAcuse: TRadioButton
        Left = 104
        Top = 160
        Width = 153
        Height = 17
        Caption = 'Cargar Acuse en Específico'
        TabOrder = 3
        OnClick = opLoadAcuseClick
      end
      object gbxLoadAcuseByDate: TGroupBox
        Left = 96
        Top = 256
        Width = 577
        Height = 77
        TabOrder = 4
        object Label3: TLabel
          Left = 66
          Top = 22
          Width = 106
          Height = 13
          Caption = 'Que se encuentren en'
          Enabled = False
        end
        object dtpFrom: TDateTimePicker
          Left = 194
          Top = 19
          Width = 105
          Height = 21
          CalAlignment = dtaLeft
          Date = 37844.4812430093
          Time = 37844.4812430093
          Color = clBtnFace
          DateFormat = dfShort
          DateMode = dmComboBox
          Enabled = False
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
        end
        object cbxFilter: TComboBox
          Left = 301
          Top = 19
          Width = 121
          Height = 21
          Color = clBtnFace
          Enabled = False
          ItemHeight = 13
          TabOrder = 1
          Text = 'Entre'
          OnChange = cbxFilterChange
          Items.Strings = (
            'Entre'
            'Menor Que'
            'Mayor Que'
            'Menor o Igual Que'
            'Mayor o Igual Que'
            'Igual')
        end
        object dtpTo: TDateTimePicker
          Left = 423
          Top = 19
          Width = 97
          Height = 21
          CalAlignment = dtaLeft
          Date = 37844.4813321412
          Time = 37844.4813321412
          Color = clBtnFace
          DateFormat = dfShort
          DateMode = dmComboBox
          Enabled = False
          Kind = dtkDate
          ParseInput = False
          TabOrder = 2
        end
        object btnLoadAcuses: TBitBtn
          Left = 416
          Top = 45
          Width = 113
          Height = 25
          Caption = '&Cargar Acuses'
          Enabled = False
          TabOrder = 3
          OnClick = btnLoadAcusesClick
          NumGlyphs = 2
        end
      end
      object opLoadAcuseByDate: TRadioButton
        Left = 104
        Top = 254
        Width = 145
        Height = 17
        Caption = 'Cargar Acuses por Fecha'
        TabOrder = 5
        OnClick = opLoadAcuseClick
      end
      object Merrores: TMemo
        Left = 96
        Top = 340
        Width = 578
        Height = 102
        Color = 12320767
        ScrollBars = ssBoth
        TabOrder = 6
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Paso 2  ( Corregir )'
      ImageIndex = 1
      object Bevel3: TBevel
        Left = 655
        Top = 356
        Width = 100
        Height = 85
        Shape = bsFrame
        Style = bsRaised
      end
      object lblStep2: TLabel
        Left = 24
        Top = 16
        Width = 8
        Height = 13
        Caption = '||||'
      end
      object lblAcusesER: TLabel
        Left = 376
        Top = 390
        Width = 128
        Height = 13
        Caption = 'Total de Docs. con Error  ='
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblAcusesAC: TLabel
        Left = 376
        Top = 365
        Width = 135
        Height = 13
        Caption = 'Total de Docs. por Aplicar  ='
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblAcusesAP: TLabel
        Left = 376
        Top = 415
        Width = 212
        Height = 13
        Caption = 'Total de Docs. Ya Aplicados Anteriormente ='
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 650
        Top = 359
        Width = 9
        Height = 78
        Shape = bsLeftLine
      end
      object lblTotalAcuses: TLabel
        Left = 16
        Top = 416
        Width = 86
        Height = 13
        Caption = 'Total de Acuses ='
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblAcusesEncontrados: TLabel
        Left = 17
        Top = 367
        Width = 110
        Height = 13
        Caption = 'Acuse(s) Encontrado(s)'
      end
      object Bevel2: TBevel
        Left = 360
        Top = 359
        Width = 9
        Height = 78
        Shape = bsLeftLine
      end
      object lblOpcion: TLabel
        Left = 16
        Top = 384
        Width = 4
        Height = 13
        Caption = '||'
      end
      object Label4: TLabel
        Left = 665
        Top = 363
        Width = 79
        Height = 13
        Caption = 'Configuración'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object strGrdDataErrors: TStringGrid
        Left = 15
        Top = 56
        Width = 482
        Height = 295
        DefaultRowHeight = 18
        FixedColor = 13434879
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
        ScrollBars = ssHorizontal
        TabOrder = 0
        OnDrawCell = strGrdDataErrorsDrawCell
        OnSelectCell = strGrdDataErrorsSelectCell
        OnTopLeftChanged = strGrdDataErrorsTopLeftChanged
        ColWidths = (
          64
          128
          126
          64
          198)
      end
      object strGrdDataErrors1: TStringGrid
        Left = 496
        Top = 56
        Width = 257
        Height = 295
        ColCount = 1
        DefaultRowHeight = 18
        FixedColor = 13434879
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
        TabOrder = 1
        OnDrawCell = strGrdDataErrorsDrawCell
        OnKeyPress = strGrdDataErrors1KeyPress
        OnSelectCell = strGrdDataErrorsSelectCell
        OnTopLeftChanged = strGrdDataErrorsTopLeftChanged
        ColWidths = (
          232)
      end
      object edAcusesAC: TEdit
        Left = 594
        Top = 363
        Width = 50
        Height = 21
        TabStop = False
        Color = clBtnFace
        TabOrder = 3
      end
      object edAcusesER: TEdit
        Left = 594
        Top = 387
        Width = 50
        Height = 21
        TabStop = False
        Color = clBtnFace
        TabOrder = 4
      end
      object edAcusesAP: TEdit
        Left = 594
        Top = 411
        Width = 50
        Height = 21
        TabStop = False
        Color = clBtnFace
        TabOrder = 5
      end
      object edLoadedFileName: TEdit
        Left = 312
        Top = 16
        Width = 441
        Height = 21
        TabStop = False
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Text = '""'
      end
      object edTotalAcuses: TEdit
        Left = 136
        Top = 412
        Width = 50
        Height = 21
        TabStop = False
        Color = clBtnFace
        TabOrder = 2
      end
      object btnEmisor: TButton
        Left = 663
        Top = 384
        Width = 84
        Height = 17
        Caption = '&Emisor'
        Enabled = False
        TabOrder = 7
        OnClick = btnEmisorClick
      end
      object btnProveedor: TButton
        Left = 663
        Top = 400
        Width = 84
        Height = 18
        Caption = '&Proveedor/Sirac'
        Enabled = False
        TabOrder = 8
        OnClick = btnProveedorClick
      end
      object memAcuses: TMemo
        Left = 136
        Top = 363
        Width = 209
        Height = 49
        ReadOnly = True
        TabOrder = 9
      end
      object btnRelacionEmiProv: TButton
        Left = 663
        Top = 417
        Width = 84
        Height = 17
        Caption = 'Emi / Prov'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = btnRelacionEmiProvClick
      end
    end
    object tbshAplicar: TTabSheet
      Caption = 'Paso 3 (Aplicar)'
      ImageIndex = 2
      OnShow = tbshAplicarShow
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 245
        Height = 13
        Caption = 'Indique los Acuses con sus Autorizaciones a Aplicar'
      end
      object Label7: TLabel
        Left = 640
        Top = 343
        Width = 95
        Height = 13
        Caption = 'Solo Aplica  Dolarés'
      end
      object StringGrid: TStringGrid
        Left = 4
        Top = 40
        Width = 596
        Height = 296
        DefaultRowHeight = 18
        FixedColor = 13434879
        FixedCols = 0
        RowCount = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing]
        ParentFont = False
        ScrollBars = ssNone
        TabOrder = 0
        OnDrawCell = StringGridDrawCell
        OnKeyDown = StringGridKeyDown
        OnKeyPress = StringGridKeyPress
        OnMouseDown = StringGridMouseDown
        OnSelectCell = StringGridSelectCell
        OnTopLeftChanged = StringGrid1TopLeftChanged
        ColWidths = (
          64
          64
          215
          64
          64)
      end
      object StringGrid1: TStringGrid
        Left = 601
        Top = 40
        Width = 160
        Height = 296
        ColCount = 2
        DefaultRowHeight = 18
        FixedColor = 13434879
        FixedCols = 0
        RowCount = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnDrawCell = StringGrid1DrawCell
        OnSelectCell = StringGrid1SelectCell
        OnTopLeftChanged = StringGrid1TopLeftChanged
        ColWidths = (
          69
          48)
      end
      object Button2: TButton
        Left = 640
        Top = 382
        Width = 120
        Height = 25
        Caption = '&Aplicar'
        TabOrder = 2
        OnClick = Button2Click
      end
      object btnId_Contrato: TBitBtn
        Tag = 512
        Left = 440
        Top = 61
        Width = 17
        Height = 18
        TabOrder = 3
        TabStop = False
        OnClick = btnId_ContratoClick
        Glyph.Data = {
          CA020000424DCA0200000000000036000000280000000E0000000F0000000100
          18000000000094020000C40E0000C40E00000000000000000000C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FFFFFF00FFFF00FFFFFFFFFF00FFFFFFFF
          FF00FFFF0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400FFFF00FFFFFFFF
          FF00FFFFFFFFFFFFFFFF00FFFFFFFFFF0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D400FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF00FFFFFFFFFF0000C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400FFFF00FFFF00FFFFFFFFFFFF
          FFFFFFFFFF00FFFF0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480000080
          0000800000FFFFFF00FFFF00FFFF00FFFF00FFFF0000C8D0D4C8D0D4C8D0D4C8
          D0D4C8D0D4C8D0D480000080808000FFFF800000FFFFFF00FFFFFFFFFF00FFFF
          0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4800000800000808080FFFFFF00FFFF
          80000000FFFF00FFFFFFFFFF0000C8D0D4C8D0D4C8D0D4C8D0D4800000800000
          808080800000C0C0C0C0C0C0800000FFFFFF00FFFF00FFFF0000C8D0D4C8D0D4
          C8D0D4800000800000808080FFFFFFC0C0C0800000800000800000C8D0D400FF
          FF00FFFF0000C8D0D4C8D0D4800000800000800000800000C0C0C08000008000
          00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D48000008000008080808000
          00800000800000800000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400008000
          00800000808080FFFFFFC0C0C0800000800000C8D0D4C8D0D4C8D0D4C8D0D4C8
          D0D4C8D0D4C8D0D40000800000808080FFFFFFC0C0C0800000800000C8D0D4C8
          D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000800000800000C0C0C080
          0000800000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
          0000C8D0D4800000800000800000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D40000}
      end
      object MemoMessages: TMemo
        Left = 5
        Top = 342
        Width = 628
        Height = 94
        Color = 12320767
        ScrollBars = ssBoth
        TabOrder = 4
      end
      object chB_OPERA_DIA_SIG: TCheckBox
        Left = 640
        Top = 355
        Width = 119
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Opera día Siguiente'
        TabOrder = 5
      end
    end
  end
  object edCVE_FORMATO_NAF: TEdit
    Tag = 512
    Left = 120
    Top = 6
    Width = 89
    Height = 21
    HelpContext = 1005
    TabOrder = 0
  end
  object btnCVE_FORMATO_NAF: TBitBtn
    Tag = 17
    Left = 212
    Top = 7
    Width = 22
    Height = 20
    HelpContext = 1006
    TabOrder = 1
    OnClick = btnCVE_FORMATO_NAFClick
    OnExit = btnCVE_FORMATO_NAFExit
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
  object edDESC_C_FORMATO: TEdit
    Left = 240
    Top = 6
    Width = 532
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 2
  end
  object edCVE_ENT_DESC: TEdit
    Tag = 512
    Left = 120
    Top = 30
    Width = 89
    Height = 21
    HelpContext = 1005
    TabOrder = 5
  end
  object btCVE_ENT_DESC: TBitBtn
    Tag = 17
    Left = 212
    Top = 31
    Width = 22
    Height = 20
    HelpContext = 1006
    TabOrder = 6
    OnClick = btCVE_ENT_DESCClick
    OnExit = btCVE_ENT_DESCExit
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
  object edDESC_ENT_DESC: TEdit
    Left = 240
    Top = 30
    Width = 532
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 7
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
    Left = 713
    Top = 51
  end
  object ImgList: TImageList
    Height = 24
    Width = 30
    Left = 684
    Top = 51
    Bitmap = {
      494C01010200040004001E001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000078000000180000000100200000000000002D
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004039300040393000403930004039
      3000403930004039300040393000403930004039300040393000403930004039
      3000403930004039300040393000403930004039300040393000403930004039
      3000403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D00403930004039300040393000403930004039
      3000403930004039300040393000403930004039300040393000403930004039
      300040393000403930004039300040393000403930003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000040393000403931003E3830003D37
      2F00423C34003E3830003F3931003E3830003E3830003E3830003E3830003E38
      30003E38300038322900413B32003F382F00494239003B342B00403931004039
      3000403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D003E3830003D372F00423C34003E3830003F39
      31003E3830003E3830003E3830003E3830003E3830003E38300038322900413B
      32003F382F00494239003B342B0040393100403930003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000040393000413B3300423C35003F39
      31003E3830003D372F003F3931003F3931003F3931003F3931003F3931003F39
      31003F393100423B3300423B33003F3930003B342C003E372E00443D35004039
      3000403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D00423C35003F3931003E3830003D372F003F39
      31003F3931003F3931003F3931003F3931003F3931003F393100423B3300423B
      33003F3930003B342C003E372E00443D3500403930003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000403930003C362E003F393200403A
      3200413C3400A9A39C00D1CBC300D6D0C900D6D0C900D6D0C900D6D0C900D6D0
      C900D6D0C900D6CFC600D3CDC400D6D0C70077706700453E35003D372E004039
      3000403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D003F393200403A3200413C3400A9A39C00D1CB
      C300D6D0C900D6D0C900D6D0C900D6D0C900D6D0C900D6D0C900D6CFC600D3CD
      C400D6D0C70077706700453E35003D372E00403930003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000403930003D372F003F393200453F
      3800433D3600EEE8E000CCC6BE00A29C9400A29C9400A29C9400A29C9400A29C
      9400A29C9400A49D9400A0999100AFA89F00B4ADA5003E372E00423B32004039
      3000403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D003F393200453F3800433D3600EEE8E000CCC6
      BE00A29C9400A29C9400A29C9400A29C9400A29C9400A29C9400A49D9400A099
      9100AFA89F00B4ADA5003E372E00423B3200403930003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000040393000433C33003F3830003B34
      2B009C968E00EEE8E0003F3931003D373000423D36003D37300039342E003B37
      3000403B3400403B3400403B34003B362F00FFFFFA003A342C00403A32003F39
      3100403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D003F3830003B342B009C968E00EEE8E0003F39
      31003D373000423D36003D37300039342E003B373000403B3400403B3400403B
      34003B362F00FFFFFA003A342C00403A32003F3931003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000403930003C352D003E372F004039
      3100C2BBB300D2CCC400433D35003B352E00363029003B3631003B3631003F3A
      34003A352F0039342D003A352E00403A3300FFFFFA006E686000423C35003F39
      3100403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D003E372F0040393100C2BBB300D2CCC400433D
      35003B352E0036302900413C35008A857E003F3A34003A352F0039342D003A35
      2E00403A3300FFFFFA006E686000423C35003F3931003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000403930003C352D003E3830003E38
      3000D1CBC400A7A19A0038332B00443E380047423C003B3631003B3631003B36
      31003B3631003D383100413C3500413C3500FFFFF900736E66003C362E003F39
      3100403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D003E3830003E383000D1CBC400A7A19A003833
      2B00443E380047423C005B565000F5F1EB004E4A44003B3631003D383100413C
      3500413C3500FFFFF900736E66003C362E003F3931003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000040393000403B3300403A33003F39
      3200D6D0CA009E999300403B35003B3631003B3631003B3631003B3631003B36
      31003B3631003F3A33003B362F003C373000FFFFFA00746F67003F3931003F39
      3100403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D00403A33003F393200D6D0CA009E999300403B
      35003E3A3400BAB6B100F8F4EE00A6A29D00EBE7E2004D4945003F3A33003B36
      2F003C373000FFFFFA00746F67003F3931003F3931003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000403930003C372F00403A33003F39
      3200D0CAC400A6A19B0038342D003B3631003B3631003B3631003B3631003B36
      31003B363100433E37003A352E00443F3800FFFFF800726D65003B362E003F39
      3100403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D00403A33003F393200D0CAC400A6A19B003834
      2D007A757000FFFEF9007C78730047433F00FCF8F3009F9B9700433E37003A35
      2E00443F3800FFFFF800726D65003B362E003F3931003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000403930003B352E003E3832003F39
      3300BDB8B200CECAC400423D37003B3631003B3631003A3631003B3631003B36
      31003B3631003D3831003A342D00433D3600FFFFFA0059534B00423D35003F39
      3100403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D003E3832003F393300BDB8B200CECAC400423D
      370068645F00999490003A3631003E3A360096928E00FFFDF9003D3831003A34
      2D00433D3600FFFFFA0059534B00423D35003F3931003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000403930003F3931003C372F003B36
      2F00625D5600FFFFFB0057524B00423D37003B3731003B3731003B3631003B36
      31003B3631003B363100423C35003D373000D9D3CC003B352D003E3830003F39
      3100403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D003C372F003B362F00625D5600FFFFFB005752
      4B00423D37003B3731003B37310037332E00423F3A006965600076716A00423C
      35003D373000D9D3CC003B352D003E3830003F3931003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000040393000423D35003F393200413C
      340045403800EEE9E200E2DED700D5D0CA00D0CCC700D1CDC700CFCBC600CCC8
      C300CCC8C300CCC8C300CCC8C300D4CEC700AEA9A1003F393100403A32003F39
      3100403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D003F393200413C340045403800EEE9E200E2DE
      D700D5D0CA00D0CCC700D1CDC700CFCBC600CCC8C300DBD7D200FFFBF500D2CD
      C600D4CEC700AEA9A1003F393100403A32003F3931003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000040393000433D34003A342B00433C
      34003C352D00817B7300A6A09900A6A09900A29D9600A09B9400A49F99009F9B
      94009F9B94009F9B94009F9B94009F9B9400625C5500433D35003C362E003F39
      3100403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D003A342B00433C34003C352D00817B7300A6A0
      9900A6A09900A29D9600A09B9400A49F99009F9B94009F9A9400F0EBE400FAF4
      ED00A7A19A00625C5500433D35003C362E003F3931003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000403930003D352A00423A3000433B
      3100433C3200423C32003E372E003E372E00413B3200423C33003D372F003E38
      30003B352D003B362F003B3631003B3631003B3631003B363100423C34003F39
      3100403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D00423A3000433B3100433C3200423C32003E37
      2E003E372E00413B3200423C33003D372F003E3830003B352D003B362F00A19C
      9500FFFDF600433D36003B352E00423C34003D372F003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000403930003F372D0041392F004039
      2E00413A3000423B31003E372E003E372E003E382F00423B3300403A32003E39
      31003B352E003B3631003B3631003B3631003B3631003B3631003B3631003B36
      31003B3631000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D0041392F0040392E00413A3000423B31003E37
      2E003E372E003E382F00423B3300403A32003E3931003B352E00403B3400413C
      3500B3AEA7003E3831003C362E003D372F003D372F003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004039300049403500443B30004138
      2D003F362C0040382D00423B300040382E003D352C003D362C00413A3200413A
      32004039310039342D003B362F003E3932003D3730003D372F003F3931003F39
      3100403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D00443B300041382D003F362C0040382D00423B
      300040382E003D352C003D362C00413A3200413A32004039310039342D003B36
      2F003E3932003D3730003D372F003F3931003D372F003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004039300040393000403930004039
      3000403930004039300040393000403930004039300040393000403930004039
      3000403930004039300040393000403930004039300040393000403930004039
      3000403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D00403930004039300040393000403930004039
      3000403930004039300040393000403930004039300040393000403930004039
      3000403930004039300040393000403930003D372F003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004039300040393000403930004039
      3000403930004039300040393000403930004039300040393000403930004039
      3000403930004039300040393000403930004039300040393000403930004039
      3000403930000000000000000000000000000000000000000000000000000000
      0000000000000000000041382D00403930004039300040393000403930004039
      3000403930004039300040393000403930004039300040393000403930004039
      3000403930004039300040393000403930003D372F003D372F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000078000000180000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFF00000000000000000
      FFFFFFFFFFFFFFF00000000000000000FFFFFFFFFFFFFFF00000000000000000
      FFFFFFFFFFFFFFF00000000000000000000007FC00003FF00000000000000000
      000007FC00003FF00000000000000000000007FC00003FF00000000000000000
      000007FC00003FF00000000000000000000007FC00003FF00000000000000000
      000007FC00003FF00000000000000000000007FC00003FF00000000000000000
      000007FC00003FF00000000000000000000007FC00003FF00000000000000000
      000007FC00003FF00000000000000000000007FC00003FF00000000000000000
      000007FC00003FF00000000000000000000007FC00003FF00000000000000000
      000007FC00003FF00000000000000000000007FC00003FF00000000000000000
      000007FC00003FF00000000000000000000007FC00003FF00000000000000000
      000007FC00003FF00000000000000000000007FC00003FF00000000000000000
      000007FC00003FF0000000000000000000000000000000000000000000000000
      000000000000}
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'csv'
    Filter = 
      'Archivos Excell (*.csv)|*.csv|Archivos de Texto (*.txt)|*.txt|To' +
      'dos los Archivos (*.*)|*.*'
    Title = 'Eliga el Archivo de Cadenas Nafin a Importar'
    Left = 743
    Top = 51
  end
  object ikCVE_FORMATO_NAF: TInterLinkit
    Control = edCVE_FORMATO_NAF
    OnEjecuta = ikCVE_FORMATO_NAFEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    Left = 336
  end
  object ikCVE_ENT_DESC: TInterLinkit
    Control = edCVE_ENT_DESC
    OnEjecuta = ikCVE_ENT_DESCEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    Left = 384
    Top = 24
  end
end
