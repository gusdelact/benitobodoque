object WSubServFin: TWSubServFin
  Left = 157
  Top = 132
  Width = 1106
  Height = 540
  Caption = 'Reporte de bitacora de Sub Servicio Financiero'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object psplitter: TPanel
    Left = 584
    Top = 0
    Width = 506
    Height = 502
    Align = alRight
    TabOrder = 0
    object btnHideFiltros: TSpeedButton
      Left = 0
      Top = 224
      Width = 9
      Height = 41
      Hint = 'Ocultar Filtros'
      Flat = True
      Glyph.Data = {
        66020000424D6602000000000000360000002800000005000000230000000100
        18000000000030020000C40E0000C40E0000000000000000000040FF4040FF40
        40FF4040FF4040FF4000D1D1D1D1D1D140FF4040FF4040FF4000D1D1D1ECECEC
        D1D1D140FF4040FF4000D1D1D1ECECECECECECD1D1D140FF4000D1D1D1ECECEC
        ECECECECECECD1D1D100D1D1D1ECECECECECECECECECD1D1D100D1D1D1ECECEC
        ECECECECECECD1D1D100D1D1D1ECECECECECECECECECD1D1D100D1D1D1ECECEC
        ECECECECECECD1D1D100D1D1D1ECECECECECECECECECD1D1D100D1D1D1ECECEC
        ECECECECECECD1D1D100D1D1D1ECECECECECECECECECD1D1D100D1D1D1ECECEC
        ECECECECECECD1D1D100D1D1D1ECECECECECECECECECD1D1D100D1D1D1ECECEC
        ECECECECECECD1D1D100D1D1D1454343ECECECECECECD1D1D100D1D1D1454343
        454343ECECECD1D1D100D1D1D1454343454343454343D1D1D100D1D1D1454343
        454343ECECECD1D1D100D1D1D1454343ECECECECECECD1D1D100D1D1D1ECECEC
        ECECECECECECD1D1D100D1D1D1ECECECECECECECECECD1D1D100D1D1D1ECECEC
        ECECECECECECD1D1D100D1D1D1ECECECECECECECECECD1D1D100D1D1D1ECECEC
        ECECECECECECD1D1D100D1D1D1ECECECECECECECECECD1D1D100D1D1D1ECECEC
        ECECECECECECD1D1D100D1D1D1ECECECECECECECECECD1D1D100D1D1D1ECECEC
        ECECECECECECD1D1D100D1D1D1ECECECECECECECECECD1D1D100D1D1D1ECECEC
        ECECECECECECD1D1D100D1D1D1ECECECECECECD1D1D140FF4000D1D1D1ECECEC
        D1D1D140FF4040FF4000D1D1D1D1D1D140FF4040FF4040FF400040FF4040FF40
        40FF4040FF4040FF4000}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnHideFiltrosClick
    end
    object pcDetalle: TPageControl
      Left = 16
      Top = 8
      Width = 489
      Height = 241
      ActivePage = tsAuditoria
      TabOrder = 0
      object tsAuditoria: TTabSheet
        Caption = 'Filtros Auditoría'
        object gbFiltros: TGroupBox
          Left = 0
          Top = 0
          Width = 481
          Height = 209
          TabOrder = 0
          object lbidauditoria: TLabel
            Left = 8
            Top = 19
            Width = 55
            Height = 13
            Caption = '&Id Auditoría'
            FocusControl = edIdEmpresa
          end
          object lbEmpresa: TLabel
            Left = 8
            Top = 43
            Width = 41
            Height = 13
            Caption = 'Empresa'
          end
          object lbMedio: TLabel
            Left = 8
            Top = 67
            Width = 29
            Height = 13
            Caption = 'Medio'
          end
          object lbAplicacion: TLabel
            Left = 8
            Top = 91
            Width = 49
            Height = 13
            Caption = 'Aplicació&n'
            FocusControl = edAplicacion
          end
          object lbevento: TLabel
            Left = 8
            Top = 115
            Width = 34
            Height = 13
            Caption = 'Evento'
          end
          object lbReferencia: TLabel
            Left = 8
            Top = 163
            Width = 52
            Height = 13
            Caption = '&Referencia'
            FocusControl = edReferencia
          end
          object lbGrupo: TLabel
            Left = 8
            Top = 187
            Width = 29
            Height = 13
            Caption = '&Grupo'
            FocusControl = edGrupo
          end
          object ieIdAuditoria: TInterEdit
            Left = 80
            Top = 16
            Width = 105
            Height = 21
            Prefijo = '1'
            Contrato = -1
            TipoReader = trEntero
            MaxLength = 6
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            TabOrder = 0
            UseReType = False
            UseSep = False
            UseDisplay = False
            PositiveOnly = True
            ColorPos = clBtnText
            ColorNeg = clRed
          end
          object edIdEmpresa: TEdit
            Tag = 512
            Left = 80
            Top = 40
            Width = 65
            Height = 21
            Hint = 'Click derecho para Catálogo'
            AutoSize = False
            CharCase = ecUpperCase
            Color = clWhite
            MaxLength = 4
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 1
          end
          object bbEmpresa: TBitBtn
            Left = 144
            Top = 40
            Width = 21
            Height = 20
            HelpContext = 2002
            TabOrder = 2
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
            Left = 168
            Top = 40
            Width = 305
            Height = 21
            Hint = 'Click derecho para Catálogo'
            Color = clBtnFace
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 3
          end
          object edMedio: TEdit
            Tag = -1
            Left = 80
            Top = 64
            Width = 105
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 4
            Text = 'CORP'
          end
          object bbMedio: TBitBtn
            Left = 184
            Top = 64
            Width = 21
            Height = 20
            HelpContext = 2002
            TabOrder = 5
            OnClick = bbMedioClick
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
          object edDescMedio: TEdit
            Tag = -1
            Left = 208
            Top = 64
            Width = 265
            Height = 21
            Hint = 'Click derecho para Catálogo'
            Color = clBtnFace
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 6
            Text = 'CORPORATIVO'
          end
          object edAplicacion: TEdit
            Left = 80
            Top = 88
            Width = 105
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 7
            Text = 'CORP'
          end
          object edEvento: TEdit
            Tag = -1
            Left = 80
            Top = 112
            Width = 105
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 8
          end
          object bbevento: TBitBtn
            Left = 184
            Top = 112
            Width = 21
            Height = 20
            HelpContext = 2002
            TabOrder = 9
            OnClick = bbeventoClick
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
          object edDescEvento: TEdit
            Left = 208
            Top = 112
            Width = 265
            Height = 21
            Hint = 'Click derecho para Catálogo'
            Color = clBtnFace
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 10
          end
          object dtpfini: TDateTimePicker
            Left = 80
            Top = 136
            Width = 97
            Height = 21
            CalAlignment = dtaLeft
            Date = 42487.5837418287
            Time = 42487.5837418287
            DateFormat = dfShort
            DateMode = dmComboBox
            Enabled = False
            Kind = dtkDate
            ParseInput = False
            TabOrder = 12
          end
          object dtpffin: TDateTimePicker
            Left = 184
            Top = 136
            Width = 97
            Height = 21
            CalAlignment = dtaLeft
            Date = 42487.5838263542
            Time = 42487.5838263542
            DateFormat = dfShort
            DateMode = dmComboBox
            Enabled = False
            Kind = dtkDate
            ParseInput = False
            TabOrder = 13
          end
          object edReferencia: TEdit
            Left = 80
            Top = 160
            Width = 145
            Height = 21
            TabOrder = 14
          end
          object edGrupo: TEdit
            Left = 80
            Top = 184
            Width = 145
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 15
            Text = 'CAT_SUBSERVFIN'
          end
          object cbPeriodo: TCheckBox
            Left = 8
            Top = 139
            Width = 65
            Height = 17
            Caption = 'Perio&do'
            TabOrder = 11
            OnClick = cbPeriodoClick
          end
        end
      end
      object tsDetalle: TTabSheet
        Caption = 'Filtro del Detalle'
        ImageIndex = 1
        object bbAgrDet: TBitBtn
          Left = 392
          Top = 40
          Width = 81
          Height = 25
          Caption = '&Agregar Filtro'
          TabOrder = 0
          OnClick = bbAgrDetClick
        end
        object bbEliDet: TBitBtn
          Left = 392
          Top = 96
          Width = 81
          Height = 25
          Caption = '&Eliminar Filtro'
          TabOrder = 1
          OnClick = bbEliDetClick
        end
        object bbLimDet: TBitBtn
          Left = 392
          Top = 152
          Width = 81
          Height = 25
          Caption = '&Limpiar Filtro'
          TabOrder = 2
          OnClick = bbLimDetClick
        end
        object dbgDetalle: TDBGrid
          Left = 16
          Top = 8
          Width = 361
          Height = 201
          DataSource = dsDetalle
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'Campo'
              Title.Alignment = taCenter
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Arial Narrow'
              Title.Font.Style = [fsBold]
              Width = 160
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Valor'
              Title.Alignment = taCenter
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Arial Narrow'
              Title.Font.Style = [fsBold]
              Width = 160
              Visible = True
            end>
        end
        object pfiltro: TPanel
          Left = 128
          Top = 56
          Width = 217
          Height = 89
          TabOrder = 3
          object lbcampo: TLabel
            Left = 8
            Top = 11
            Width = 33
            Height = 13
            Caption = 'Campo'
          end
          object lbValor: TLabel
            Left = 8
            Top = 35
            Width = 24
            Height = 13
            Caption = 'Valor'
          end
          object edCampo: TEdit
            Left = 48
            Top = 8
            Width = 161
            Height = 21
            TabOrder = 0
          end
          object edValor: TEdit
            Left = 48
            Top = 32
            Width = 161
            Height = 21
            TabOrder = 1
          end
          object bbAceptar: TBitBtn
            Left = 16
            Top = 56
            Width = 81
            Height = 25
            Caption = 'Ace&ptar'
            Default = True
            TabOrder = 2
            OnClick = bbAceptarClick
          end
          object bbCancelar: TBitBtn
            Left = 120
            Top = 56
            Width = 81
            Height = 25
            Cancel = True
            Caption = '&Cancelar'
            TabOrder = 3
            OnClick = bbCancelarClick
          end
        end
      end
    end
    object gbDetalle: TGroupBox
      Left = 16
      Top = 248
      Width = 489
      Height = 253
      Caption = 'Detalle'
      TabOrder = 1
      object sgcDetalle: TSGCtrl
        Left = 8
        Top = 16
        Width = 473
        Height = 233
        ShowTab = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        TabOrder = 0
        TabWidth = 0
        ShowBtnPriorNext = True
        ShowBtnFirst = True
        ShowBtnLast = True
      end
    end
  end
  object pCabecera: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 502
    Align = alClient
    TabOrder = 1
    object sgcBitacora: TSGCtrl
      Left = 1
      Top = 0
      Width = 584
      Height = 505
      ShowTab = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      TabOrder = 0
      TabWidth = 0
      ShowBtnPriorNext = True
      ShowBtnFirst = True
      ShowBtnLast = True
      OnDblClick = sgcBitacoraDblClick
    end
  end
  object ifrepssf: TInterForma
    IsMain = True
    OnPreview = ifrepssfPreview
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
    OnDespuesShow = ifrepssfDespuesShow
    Left = 984
    Top = 184
  end
  object ilEmpresa: TInterLinkit
    OnEjecuta = ilEmpresaEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilEmpresaCapture
    Left = 784
    Top = 16
  end
  object qbitacora: TQuery
    Left = 208
    Top = 240
  end
  object qDetalle: TQuery
    Left = 728
    Top = 293
  end
  object rxmdDetalle: TRxMemoryData
    FieldDefs = <>
    Left = 956
    Top = 40
    object rxmdDetalleCampo: TStringField
      FieldName = 'Campo'
      Size = 100
    end
    object rxmdDetalleValor: TStringField
      FieldName = 'Valor'
      Size = 300
    end
  end
  object dsDetalle: TDataSource
    DataSet = rxmdDetalle
    Left = 900
    Top = 40
  end
end
