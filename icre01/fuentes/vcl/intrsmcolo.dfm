object WRsmColo: TWRsmColo
  Left = 269
  Top = 95
  Width = 574
  Height = 582
  Caption = 'Resumen de Colocaciones'
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
  object Label15: TLabel
    Left = 5
    Top = 15
    Width = 30
    Height = 13
    Caption = 'Fecha'
  end
  object PnDatos: TPanel
    Left = 6
    Top = 524
    Width = 538
    Height = 19
    TabOrder = 3
    object lbEmpresa: TLabel
      Left = 8
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
      Left = 6
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
      Left = 335
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
      Left = 352
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
      Left = 52
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
      Left = 387
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
      Left = 387
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
      Left = 52
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
  object PageControl1: TPageControl
    Left = 5
    Top = 109
    Width = 545
    Height = 411
    ActivePage = TabSheet1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object TabSheet1: TTabSheet
      HelpContext = 2
      Caption = '1.- Colocacion'
      object LtotalReg: TLabel
        Left = 120
        Top = 660
        Width = 6
        Height = 13
        Alignment = taRightJustify
        Caption = '0'
      end
      object Label9: TLabel
        Left = 7
        Top = 664
        Width = 74
        Height = 13
        Caption = 'Total Registros:'
      end
      object Memo1: TMemo
        Left = 8
        Top = 41
        Width = 513
        Height = 79
        ScrollBars = ssVertical
        TabOrder = 2
        Visible = False
      end
      object ButtonEjecuta1: TButton
        Left = 452
        Top = 8
        Width = 70
        Height = 25
        HelpContext = 2
        Caption = 'Ejecuta'
        TabOrder = 1
        OnClick = ButtonEjecuta1Click
      end
      object SGrid1: TStringGrid
        Tag = 1
        Left = 3
        Top = 42
        Width = 524
        Height = 251
        HelpContext = 2
        BiDiMode = bdRightToLeft
        ColCount = 2
        DefaultColWidth = 150
        FixedColor = clInfoBk
        FixedRows = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving, goEditing, goTabs]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
        OnKeyDown = SGrid1KeyDown
      end
    end
    object TabSheet2: TTabSheet
      HelpContext = 3
      Caption = '2.- Pago de Fondeo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object Memo2: TMemo
        Left = 8
        Top = 46
        Width = 521
        Height = 119
        TabOrder = 2
      end
      object ButtonEjecuta2: TButton
        Left = 452
        Top = 8
        Width = 70
        Height = 25
        HelpContext = 3
        Caption = 'Ejecuta'
        TabOrder = 1
        OnClick = ButtonEjecuta2Click
      end
      object SGrid2: TStringGrid
        Tag = 2
        Left = 5
        Top = 42
        Width = 524
        Height = 224
        HelpContext = 3
        BiDiMode = bdRightToLeft
        ColCount = 2
        DefaultColWidth = 110
        FixedColor = clInfoBk
        FixedRows = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving, goEditing, goTabs]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
        OnKeyDown = SGrid1KeyDown
        ColWidths = (
          110
          110)
      end
    end
    object TabSheet3: TTabSheet
      HelpContext = 3
      Caption = '3.- Cobranza'
      ImageIndex = 2
      object ButtonEjecuta3: TButton
        Left = 452
        Top = 8
        Width = 70
        Height = 25
        HelpContext = 4
        Caption = 'Ejecuta'
        TabOrder = 1
        OnClick = ButtonEjecuta3Click
      end
      object Memo3: TMemo
        Left = 3
        Top = 42
        Width = 525
        Height = 46
        TabOrder = 2
        Visible = False
      end
      object SGrid3: TStringGrid
        Tag = 3
        Left = 3
        Top = 42
        Width = 524
        Height = 110
        HelpContext = 4
        BiDiMode = bdRightToLeft
        ColCount = 2
        DefaultColWidth = 120
        FixedColor = clInfoBk
        RowCount = 4
        FixedRows = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving, goEditing, goTabs]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
        OnKeyDown = SGrid1KeyDown
        ColWidths = (
          120
          120)
      end
    end
    object TabSheet4: TTabSheet
      Caption = '4.- Operacion Fiduciaria (Captura Manual)'
      ImageIndex = 4
      object SGrid4: TStringGrid
        Tag = 3
        Left = 2
        Top = 46
        Width = 524
        Height = 326
        HelpContext = 4
        BiDiMode = bdRightToLeft
        ColCount = 3
        DefaultColWidth = 160
        FixedColor = clInfoBk
        FixedCols = 0
        RowCount = 10
        FixedRows = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goColMoving, goEditing, goTabs]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
        OnKeyDown = SGrid4KeyDown
      end
      object Memo8: TMemo
        Left = 2
        Top = 5
        Width = 352
        Height = 30
        BorderStyle = bsNone
        Color = clBtnFace
        Lines.Strings = (
          
            'Nota: <Insert> = agregar nuevo renglon.      <Intro>  = recalcul' +
            'ar totales.'
          
            '          <Supr>  = eliminar renglon señalado.  <Ctrl+A>= recarg' +
            'a defaults.     ')
        ReadOnly = True
        TabOrder = 1
      end
    end
    object TabSheet5: TTabSheet
      HelpContext = 10
      Caption = 'Parametros de Envio de Mensaje'
      ImageIndex = 3
      OnEnter = TabSheet5Enter
      OnShow = TabSheet5Enter
      object Label2: TLabel
        Left = 16
        Top = 12
        Width = 128
        Height = 13
        Caption = 'Encabezado del mensaje : '
      end
      object Label3: TLabel
        Left = 16
        Top = 49
        Width = 17
        Height = 13
        Caption = 'De:'
      end
      object Label4: TLabel
        Left = 228
        Top = 48
        Width = 88
        Height = 13
        Caption = 'Cuenta de correo :'
      end
      object Label5: TLabel
        Left = 8
        Top = 193
        Width = 259
        Height = 13
        Caption = 'Texto Anexo al Mensaje (mostrado al inicio del mismo) :'
      end
      object Memo7: TMemo
        Left = 137
        Top = 218
        Width = 386
        Height = 55
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Para cualquier duda o aclaración, estamos a sus ordenes.'
          ' '
          'Saludos cordiales.')
        ParentFont = False
        TabOrder = 9
      end
      object ButtonEnvia: TButton
        Left = 48
        Top = 351
        Width = 70
        Height = 25
        HelpContext = 100
        Caption = 'Envia'
        TabOrder = 7
        OnClick = ButtonEnviaClick
      end
      object Memo4: TMemo
        Left = 1
        Top = 79
        Width = 20
        Height = 103
        HelpContext = 100
        Lines.Strings = (
          'fer'
          'na'
          'nd'
          'o.ji'
          'me'
          'ne'
          'z'
          '@'
          'dei'
          'nt'
          'ec'
          '.c'
          'om'
          'rc'
          'arri'
          'ag'
          'ac'
          '@i'
          'nt'
          'er'
          'ac'
          'cio'
          'ne'
          's.c'
          'om'
          'jah'
          'er'
          'na'
          'nd'
          'ezr'
          '@i'
          'nt'
          'er'
          'ac'
          'cio'
          'ne'
          's.c'
          'om'
          'ar'
          'am'
          'os'
          'b'
          '@i'
          'nt'
          'er'
          'ac'
          'cio'
          'ne'
          's.c'
          'om')
        TabOrder = 3
        Visible = False
      end
      object Memo5: TMemo
        Left = 1
        Top = -2
        Width = 529
        Height = 11
        ScrollBars = ssHorizontal
        TabOrder = 8
        Visible = False
        WordWrap = False
      end
      object edEncabezado: TEdit
        Left = 152
        Top = 10
        Width = 345
        Height = 21
        HelpContext = 100
        TabOrder = 0
        Text = 'edEncabezado'
      end
      object edNombreEnvia: TEdit
        Left = 40
        Top = 46
        Width = 173
        Height = 21
        HelpContext = 100
        TabOrder = 1
        Text = 'edNombreEnvia'
      end
      object edEmail: TEdit
        Left = 320
        Top = 45
        Width = 174
        Height = 21
        HelpContext = 100
        TabOrder = 2
        Text = 'edEmail'
      end
      object Memo6: TMemo
        Left = 1
        Top = 210
        Width = 531
        Height = 102
        HelpContext = 100
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Buenas tardes.'
          ''
          
            'Por este conducto se envía el Informe de Operación de Crédito y ' +
            'Fiduciaria '
          'Correspondiente al día de hoy.'
          ''
          'Observaciones: No se registran impagos relevantes.'
          ''
          'Cifras en miles.'
          'OPERACION CREDITO'
          ''
          ' ')
        ParentFont = False
        TabOrder = 5
        OnDblClick = Memo6DblClick
      end
      object edAviso: TEdit
        Left = 50
        Top = 328
        Width = 465
        Height = 15
        HelpContext = 100
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
        Text = 'edAviso'
      end
      object ChBInfManual: TCheckBox
        Left = 283
        Top = 190
        Width = 246
        Height = 17
        HelpContext = 100
        Caption = 'Deseo incluir la informacion de captura manual.'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object BtnTo: TButton
        Left = 242
        Top = 115
        Width = 48
        Height = 21
        Caption = ' -->'
        TabOrder = 10
        OnClick = BtnToClick
      end
      object PageControl2: TPageControl
        Left = 302
        Top = 75
        Width = 223
        Height = 110
        ActivePage = TbShPara
        Style = tsFlatButtons
        TabOrder = 11
        object TbShPara: TTabSheet
          Caption = 'Para'
          object Memo9: TMemo
            Left = 0
            Top = 0
            Width = 215
            Height = 79
            Align = alClient
            Color = clInfoBk
            TabOrder = 0
          end
        end
        object TbShCC: TTabSheet
          Caption = 'CC'
          ImageIndex = 1
          object Memo10: TMemo
            Left = 0
            Top = 0
            Width = 215
            Height = 79
            Align = alClient
            Color = clWhite
            TabOrder = 0
          end
        end
        object TbShCCO: TTabSheet
          Caption = 'CCO'
          ImageIndex = 2
          object Memo11: TMemo
            Left = 0
            Top = 0
            Width = 215
            Height = 79
            Align = alClient
            Color = clInactiveCaptionText
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object ChLBDirs: TCheckListBox
        Left = 2
        Top = 80
        Width = 220
        Height = 97
        ItemHeight = 13
        TabOrder = 12
      end
      object BtnNo: TButton
        Left = 242
        Top = 145
        Width = 48
        Height = 21
        Caption = '<--'
        TabOrder = 13
        OnClick = BtnNoClick
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 40
    Width = 536
    Height = 61
    Caption = 'Datos de Control'
    TabOrder = 4
    object Label17: TLabel
      Left = 9
      Top = 38
      Width = 41
      Height = 13
      Caption = 'Sucursal'
    end
    object Label18: TLabel
      Left = 10
      Top = 17
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object EdIDSucursal: TEdit
      Tag = 512
      Left = 120
      Top = 34
      Width = 70
      Height = 21
      HelpContext = 1600
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object BBSucursal: TBitBtn
      Left = 195
      Top = 34
      Width = 21
      Height = 21
      HelpContext = 1601
      TabOrder = 4
      OnClick = BBSucursalClick
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
    object EdDescSucursal: TEdit
      Left = 222
      Top = 34
      Width = 258
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object CBSucursal: TCheckBox
      Left = 499
      Top = 36
      Width = 14
      Height = 17
      HelpContext = 1602
      TabStop = False
      Caption = 'CBSucursal'
      TabOrder = 6
      OnClick = CBSucursalClick
    end
    object edIdEmpresa: TEdit
      Tag = 512
      Left = 120
      Top = 13
      Width = 70
      Height = 21
      Hint = 'Click derecho para Catálogo'
      HelpContext = 1500
      AutoSize = False
      CharCase = ecUpperCase
      Color = clWhite
      MaxLength = 4
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
    end
    object bbEmpresa: TBitBtn
      Left = 195
      Top = 13
      Width = 21
      Height = 21
      HelpContext = 1501
      TabOrder = 1
      OnClick = bbEmpresaClick
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
    object edNombreEmpresa: TEdit
      Left = 222
      Top = 13
      Width = 258
      Height = 21
      Hint = 'Click derecho para Catálogo'
      TabStop = False
      Color = clBtnFace
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
    end
  end
  object edFECHA: TEdit
    Left = 49
    Top = 11
    Width = 70
    Height = 21
    TabOrder = 1
    OnChange = edFECHAChange
  end
  object dtpFecha: TInterDateTimePicker
    Left = 124
    Top = 11
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 38505.5120229514
    Time = 38505.5120229514
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
    Edit = edFECHA
    Formato = dfDate
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
    Left = 10
    Top = 50
  end
  object ilEmpresa: TInterLinkit
    Control = edIdEmpresa
    OnEjecuta = ilEmpresaEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 240
    Top = 103
  end
  object ILSucursal: TInterLinkit
    Control = EdIDSucursal
    OnEjecuta = ILSucursalEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 240
    Top = 136
  end
  object QryMoneda: TQuery
    SQL.Strings = (
      'Select cve_moneda, desc_moneda '
      'from Moneda')
    Left = 369
    Top = 149
  end
  object QryEntDesc: TQuery
    Left = 369
    Top = 181
  end
  object QApoyo: TQuery
    Left = 401
    Top = 150
  end
  object NMSMTP1: TNMSMTP
    Host = '132.1.4.130'
    Port = 253
    ReportLevel = 0
    EncodeType = uuMime
    ClearParams = True
    SubType = mtPlain
    Charset = 'us-ascii'
    Left = 90
    Top = 24
  end
  object QryDirs: TQuery
    Left = 185
    Top = 213
  end
end
