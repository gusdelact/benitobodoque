object wMGenArch: TwMGenArch
  Left = 307
  Top = 156
  Width = 577
  Height = 547
  Caption = 'Generación y envío de Información a NAFIN'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 504
    Top = 466
    Width = 37
    Height = 10
    Caption = 'V.20110204'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object pcPrincipal: TPageControl
    Left = 0
    Top = 9
    Width = 545
    Height = 330
    ActivePage = trCrearArchivo
    TabOrder = 0
    OnChanging = pcPrincipalChanging
    object trCrearArchivo: TTabSheet
      Caption = '         Crear Archivo        '
      ImageIndex = 4
      object rgCVE_TIPO_REPORTE: TRadioGroup
        Left = 8
        Top = 24
        Width = 523
        Height = 177
        Caption = 'Tipo de Reporte'
        Columns = 2
        Items.Strings = (
          'Solicitud de Participación de Riesgos'
          'Saldos de Cartera Garantizada'
          'Calificación de Cartera de Créditos Garantizados'
          'Reporte de Pagos Anticipados SIRAC')
        TabOrder = 0
        OnClick = rgCVE_TIPO_REPORTEClick
      end
      object btnCreaArchivo: TButton
        Left = 424
        Top = 270
        Width = 81
        Height = 23
        Caption = 'Siguente...'
        TabOrder = 1
        OnClick = btnCreaArchivoClick
      end
    end
    object TabSheet1: TTabSheet
      Caption = '           Parámetros         '
      ImageIndex = 3
      object btnPestDosSig: TButton
        Left = 424
        Top = 270
        Width = 81
        Height = 23
        Caption = 'Siguente...'
        TabOrder = 0
        OnClick = btnPestDosSigClick
      end
      object btnPestDosAnt: TButton
        Left = 8
        Top = 270
        Width = 81
        Height = 23
        Caption = 'Anterior...'
        TabOrder = 1
        OnClick = btnPestDosAntClick
      end
      object Panel2: TPanel
        Left = 8
        Top = 24
        Width = 523
        Height = 244
        BevelInner = bvLowered
        TabOrder = 2
        object Label21: TLabel
          Left = 8
          Top = 15
          Width = 76
          Height = 13
          Caption = 'Fecha de Corte '
        end
        object lbID_CREDITO: TLabel
          Left = 8
          Top = 39
          Width = 54
          Height = 13
          Caption = 'Disposición'
        end
        object Label3: TLabel
          Left = 8
          Top = 63
          Width = 51
          Height = 13
          Caption = 'Acreditado'
        end
        object Label1: TLabel
          Left = 8
          Top = 88
          Width = 22
          Height = 13
          Caption = 'Año:'
        end
        object Label2: TLabel
          Left = 275
          Top = 88
          Width = 23
          Height = 13
          Caption = 'Mes:'
        end
        object lbPagoAnt: TLabel
          Left = 296
          Top = 137
          Width = 80
          Height = 26
          Caption = 'Importe de pago de capital'
          WordWrap = True
        end
        object lbMotivoLiq: TLabel
          Left = 8
          Top = 104
          Width = 61
          Height = 26
          Caption = 'Motivo de la Liquidacion'
          WordWrap = True
        end
        object dtpF_CORTE: TInterDateTimePicker
          Left = 173
          Top = 11
          Width = 21
          Height = 21
          CalAlignment = dtaLeft
          Date = 38632.5479840162
          Time = 38632.5479840162
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
          TabStop = False
          Edit = edF_CORTE
          Formato = dfDate
        end
        object edF_CORTE: TEdit
          Left = 99
          Top = 11
          Width = 73
          Height = 21
          TabOrder = 1
          OnChange = edF_CORTEChange
        end
        object edID_CREDITO: TEdit
          Tag = 512
          Left = 99
          Top = 35
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
          OnChange = edID_CREDITOChange
          OnExit = edID_CREDITOExit
        end
        object btID_CREDITO: TBitBtn
          Tag = 17
          Left = 172
          Top = 35
          Width = 21
          Height = 21
          HelpContext = 1001
          TabOrder = 3
          OnClick = btID_CREDITOClick
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
        object edDESC_CREDITO: TEdit
          Tag = 18
          Left = 196
          Top = 35
          Width = 288
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 4
        end
        object cbID_CREDITO: TCheckBox
          Left = 494
          Top = 38
          Width = 14
          Height = 15
          HelpContext = 1100
          TabStop = False
          Enabled = False
          TabOrder = 5
          OnClick = cbID_CREDITOClick
        end
        object edID_ACREDITADO: TEdit
          Tag = 512
          Left = 99
          Top = 59
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 6
          OnChange = edID_ACREDITADOChange
          OnExit = edID_ACREDITADOExit
        end
        object btnID_ACREDITADO: TBitBtn
          Tag = 17
          Left = 172
          Top = 59
          Width = 21
          Height = 21
          HelpContext = 1001
          TabOrder = 7
          OnClick = btnID_ACREDITADOClick
          OnExit = edID_ACREDITADOExit
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
        object edDESC_ACREDITADO: TEdit
          Tag = 18
          Left = 196
          Top = 59
          Width = 288
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 8
        end
        object cbxID_ACREDITADO: TCheckBox
          Left = 494
          Top = 62
          Width = 14
          Height = 15
          HelpContext = 1100
          TabStop = False
          Enabled = False
          TabOrder = 9
          OnClick = cbxID_ACREDITADOClick
        end
        object cbxAnio: TComboBox
          Left = 99
          Top = 84
          Width = 95
          Height = 19
          Style = csOwnerDrawFixed
          ItemHeight = 13
          TabOrder = 10
        end
        object cbxMes: TComboBox
          Left = 355
          Top = 84
          Width = 129
          Height = 19
          Style = csOwnerDrawFixed
          ItemHeight = 13
          TabOrder = 11
        end
        object rgTipoArch: TRadioGroup
          Left = 8
          Top = 169
          Width = 475
          Height = 31
          Caption = 'Tipo de Archivo'
          Columns = 2
          Items.Strings = (
            'Archivo Excel'
            'Archivo de Texto')
          TabOrder = 18
        end
        object ieIMP_PREPAGO: TInterEdit
          Left = 387
          Top = 141
          Width = 95
          Height = 21
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          MaxLength = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 17
          UseReType = True
          UseSep = True
          UseDisplay = True
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object cbxCVE_MOTIVO_LIQ: TCheckBox
          Left = 494
          Top = 110
          Width = 14
          Height = 15
          HelpContext = 1100
          TabStop = False
          Enabled = False
          TabOrder = 15
          OnClick = cbxCVE_MOTIVO_LIQClick
        end
        object edDESC_MOTIVO_LIQ: TEdit
          Tag = 18
          Left = 196
          Top = 107
          Width = 288
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 14
        end
        object btCVE_MOTIVO_LIQ: TBitBtn
          Tag = 17
          Left = 172
          Top = 107
          Width = 21
          Height = 21
          HelpContext = 1001
          TabOrder = 13
          OnClick = btCVE_MOTIVO_LIQClick
          OnExit = btCVE_MOTIVO_LIQExit
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
        object edCVE_MOTIVO_LIQ: TEdit
          Tag = 512
          Left = 99
          Top = 107
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 12
          OnChange = edCVE_MOTIVO_LIQChange
          OnExit = edCVE_MOTIVO_LIQExit
        end
        object rgLiquidacion: TRadioGroup
          Left = 8
          Top = 136
          Width = 281
          Height = 31
          Caption = 'Tipo de Liquidación'
          Columns = 2
          Items.Strings = (
            'Parcial'
            'Total')
          TabOrder = 16
          OnClick = rgLiquidacionClick
        end
        object cbComAnual: TCheckBox
          Left = 288
          Top = 13
          Width = 220
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Pago de comisión x solicitud de garantía'
          TabOrder = 19
          OnClick = cbComAnualClick
        end
        object btnBitacoraAnexo2: TButton
          Left = 8
          Top = 213
          Width = 129
          Height = 25
          Caption = 'Bitácora Anexo2'
          TabOrder = 20
          Visible = False
          OnClick = btnBitacoraAnexo2Click
        end
      end
    end
    object tsArchivo: TTabSheet
      Caption = '             Archivo            '
      OnShow = tsArchivoShow
      object lbStatCargaArch: TLabel
        Left = 496
        Top = 217
        Width = 5
        Height = 17
        AutoSize = False
      end
      object Label6: TLabel
        Left = 16
        Top = 248
        Width = 48
        Height = 13
        Caption = 'Ubicación'
      end
      object sbPathFileName: TSpeedButton
        Left = 67
        Top = 243
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = sbPathFileNameClick
      end
      object lbWarningArchivo: TLabel
        Left = 144
        Top = 271
        Width = 206
        Height = 16
        Caption = 'El archivo ya ha sido enviado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel1: TPanel
        Left = 16
        Top = 24
        Width = 490
        Height = 177
        BevelInner = bvLowered
        TabOrder = 0
        object Label4: TLabel
          Left = 16
          Top = 86
          Width = 36
          Height = 13
          Caption = 'Archivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbIMP_TOTAL_ARC: TLabel
          Left = 16
          Top = 111
          Width = 98
          Height = 13
          Caption = 'Importe Operaciones'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbNUM_REGISTRO: TLabel
          Left = 16
          Top = 143
          Width = 95
          Height = 13
          Caption = 'No. de Operaciones'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbF_ARCHIVO: TLabel
          Left = 255
          Top = 143
          Width = 84
          Height = 13
          Caption = 'Fecha de Archivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbFolioArchivo: TLabel
          Left = 344
          Top = 82
          Width = 22
          Height = 13
          Caption = 'Folio'
        end
        object lbIMP_TOTAL_IVA: TLabel
          Left = 255
          Top = 111
          Width = 55
          Height = 13
          Caption = 'Importe IVA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edTX_NOM_ARCHIVO: TEdit
          Tag = -1
          Left = 128
          Top = 78
          Width = 200
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
        object edF_ARCHIVO: TEdit
          Tag = -1
          Left = 342
          Top = 135
          Width = 115
          Height = 21
          TabOrder = 11
        end
        object edID_ARCHIVO: TEdit
          Tag = -1
          Left = 376
          Top = 78
          Width = 81
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          OnChange = edID_ARCHIVOChange
        end
        object btnGenerar: TBitBtn
          Left = 337
          Top = 12
          Width = 120
          Height = 25
          Caption = 'Genera Archivo'
          TabOrder = 2
          OnClick = btnGenerarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            555555555555555555555555555555555555555555FF5555555555555A055555
            55555555588FF55555555555AAA05555555555558888F55555555555AAA05555
            555555558888FF555555555AAAAA05555555555888888F55555555AAAAAA0555
            5555558888888FF5555558AA05AAA05555555888858888F555558A05555AA055
            55558885555888FF55555555555AAA05555555555558888F555555555555AA05
            555555555555888FF555555555555AA05555555555555888FF5555555555558A
            05555555555555888FF5555555555558A05555555555555888FF555555555555
            5AA0555555555555588855555555555555555555555555555555}
          NumGlyphs = 2
        end
        object rbGenArch: TRadioButton
          Left = 8
          Top = 16
          Width = 100
          Height = 17
          Caption = 'Generar Archivo'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = radiobuttonarchivo
        end
        object rbSelectArch: TRadioButton
          Left = 8
          Top = 44
          Width = 113
          Height = 17
          Caption = 'Seleccionar Archivo'
          TabOrder = 3
          OnClick = radiobuttonarchivo
        end
        object edBuscaArch: TEdit
          Tag = -1
          Left = 152
          Top = 42
          Width = 176
          Height = 21
          HelpContext = 1001
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object btnBuscaArch: TBitBtn
          Left = 128
          Top = 42
          Width = 21
          Height = 21
          HelpContext = 1002
          TabOrder = 4
          OnClick = btnBuscaArchClick
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
        object edNOMBRE_ARCHIVO: TEdit
          Left = 128
          Top = 14
          Width = 200
          Height = 21
          TabOrder = 1
        end
        object edIMP_TOTAL_ARC: TInterEdit
          Tag = -1
          Left = 128
          Top = 103
          Width = 115
          Height = 21
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          MaxLength = 12
          TabOrder = 8
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edIMP_TOTAL_IVA: TInterEdit
          Tag = -1
          Left = 342
          Top = 103
          Width = 115
          Height = 21
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          MaxLength = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 9
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edNUM_REGISTRO: TInterEdit
          Tag = -1
          Left = 128
          Top = 135
          Width = 115
          Height = 21
          Prefijo = '1'
          Contrato = -1
          TipoReader = trEntero
          MaxLength = 6
          TabOrder = 10
          UseReType = True
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
      end
      object btnSigArchivo: TButton
        Left = 424
        Top = 270
        Width = 81
        Height = 23
        Caption = 'Siguente...'
        TabOrder = 4
        OnClick = btnSigArchivoClick
      end
      object btnPestTresAnt: TButton
        Left = 8
        Top = 270
        Width = 81
        Height = 23
        Caption = 'Anterior...'
        TabOrder = 3
        OnClick = btnPestTresAntClick
      end
      object rgTipoEnvio: TRadioGroup
        Left = 16
        Top = 208
        Width = 490
        Height = 31
        Caption = 'Forma de Envío'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Correo Electrónico'
          'Portal Nafín')
        TabOrder = 1
        OnClick = rgTipoEnvioClick
      end
      object edNbrArch: TEdit
        Left = 90
        Top = 244
        Width = 415
        Height = 21
        Color = clBtnFace
        TabOrder = 2
      end
    end
    object tsCorreo: TTabSheet
      Caption = '             Correo             '
      ImageIndex = 1
      object btnAntCorreo: TButton
        Left = 8
        Top = 270
        Width = 81
        Height = 23
        Caption = 'Anterior...'
        TabOrder = 0
        OnClick = btnAntCorreoClick
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 505
        Height = 249
        Caption = 'Formato de Correo                   '
        TabOrder = 1
        object Label9: TLabel
          Left = 16
          Top = 30
          Width = 25
          Height = 13
          Caption = 'Para:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 16
          Top = 54
          Width = 52
          Height = 13
          Caption = 'Con Copia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 16
          Top = 78
          Width = 36
          Height = 13
          Caption = 'Asunto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 16
          Top = 104
          Width = 43
          Height = 13
          Caption = 'Mensaje:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object BitCorreo: TBitBtn
          Left = 101
          Top = 0
          Width = 21
          Height = 21
          HelpContext = 1002
          TabOrder = 0
          OnClick = BitCorreoClick
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
        object BitNvoCorreo: TBitBtn
          Left = 125
          Top = 0
          Width = 21
          Height = 21
          HelpContext = 1002
          TabOrder = 1
          OnClick = BitNvoCorreoClick
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000000000000000000000010000000000001F202000E8EA
            EB00C3C8CB009BA4A8007272720040444700DDDDDD00FFFFFF0083868800B5BC
            BE00D1D6D80035393B00F3F5F5004F505000E0E4E500AFB1B200999999002A2D
            2F00E6E6E600484E5100BDC4C700D5D9DB00EFEFEF007B7B7B00DEDEE600F7F7
            F700393F4100ABABAB00CCCCCC00B3B3B3004C4C4C002B2F3100BDBEBE005A5A
            5A0033333300EAECED0025282A008D8D8D00EFEFF700B7BEC200D8DCDE00D5D5
            D500494F5200C4CACC00454A4D0040414100AFB7BB00A4A4A400393A3B000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000C9D4
            0000000019000000000012F9DC0001040000000000000000000014000000F514
            0000AB0012007C9237009237C70006087C009000140000DF0000000000000000
            0000500000000012F5008100FD0001057C00D47C81000019C900000053009A39
            0000907C800000DF000012F5480000000000200000000012F50019C9D400FB60
            0000F30012007C83990081010800FFFF7C0005FFFF007C810100A2FDDC000094
            7C000100DF000000000000000000FDE90000947CA20000DF000012F9DC000401
            0000020000000000000047C5FC0066EA0000CD58C300DCBAAB0000000000F5CC
            0000EA00120058C3660012F5F80087EB00000077D1007FFDD00012F5F8008832
            0000B877D1000012F500D187FF0004017700380000000075640075644C000014
            000001000000000000000000000000000000100000000000000000000000F64C
            000000001200000000000000000000010000AC0000000012F50019C9B800F814
            0000140012000012F80092B5F400B6867C00007C920000000000DF0090000000
            0000EA00140058C3660017066200000000001201B6000000000047C5FC00F670
            00008100120077D1D50012F6380001B40000C10000000000010000000000CBE8
            0000020071000000000000000000F6A80000A80012000012F60046DBF100F6A8
            00002B0012000012FA0000000400F6A80000040012000000000046CD7D00F6A8
            00002B0012000012FA000000040000240000000000000000000012F9DC000094
            00009400DF0000DF00000000000000010000DC0000000012F90044C47100F6A8
            0000D80012000047E50000000100000000001800000000152500DF009400672E
            000020666900000001000043BF0000007700B00014000012F40000000000F70C
            0000180012007C91EE009206F000FFFF7C00EBFFFF007C920600809A0F000000
            7C000800140000140000809A200000017C000000000000000000000000000000
            0000000000000000000044C0C40025680000440015000016E20015256C00FA30
            0000FF001200FFFFFF0015251800C12E0000680044000015250007290D1F1F1F
            1F1F1F1F1F1111242D20071D210927272727270909092E031A10071D040E0606
            0606060606150A142C10071D17010E0E0E0E0E0E060615141310071D17160101
            121212120E0E28021310071D170C232323010101120E062B1310071D170C1616
            16161623230E0E2B2A10071D1719161616161616010E0E022C10071D17191919
            0C0C0C0C23121C1B0510071D170719191919190C01150F080B2F071D17071919
            1919190E172D11003002071D1707070707071906200E1D171019071D17070707
            070707231C1221190707071D040C0707070707161D2507070707072921051E1E
            1E1E1E1E211B0707070707071612121212121212230707070707}
        end
        object edPara: TEdit
          Left = 88
          Top = 24
          Width = 401
          Height = 21
          TabOrder = 2
        end
        object edConCopia: TEdit
          Left = 88
          Top = 48
          Width = 401
          Height = 21
          TabOrder = 3
        end
        object edAsunto: TEdit
          Left = 88
          Top = 72
          Width = 401
          Height = 21
          TabOrder = 4
        end
        object mMensaje: TMemo
          Left = 88
          Top = 104
          Width = 401
          Height = 100
          ScrollBars = ssBoth
          TabOrder = 5
        end
        object edIdCorreo: TEdit
          Left = 168
          Top = 5
          Width = 9
          Height = 21
          HelpContext = 1001
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          Visible = False
        end
        object edIdEmpresa: TEdit
          Left = 201
          Top = 5
          Width = 9
          Height = 21
          HelpContext = 1001
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          Visible = False
        end
        object btnEnviar: TBitBtn
          Left = 416
          Top = 216
          Width = 85
          Height = 25
          Caption = 'Enviar'
          TabOrder = 8
          OnClick = btnEnviarClick
        end
      end
    end
    object tsBitacoraAnexo2: TTabSheet
      Caption = 'Bitácora Anexo2'
      ImageIndex = 4
      object btnPestCincoAnt: TButton
        Left = 8
        Top = 270
        Width = 81
        Height = 23
        Caption = 'Anterior...'
        TabOrder = 0
        OnClick = btnPestCincoAntClick
      end
      object SGCBitacoraAnexo2: TSGCtrl
        Left = 8
        Top = 8
        Width = 633
        Height = 249
        ShowTab = True
        TabOrder = 1
        TabWidth = 0
        ShowBtnPriorNext = True
        ShowBtnFirst = True
        ShowBtnLast = True
      end
    end
  end
  object PnDatos: TPanel
    Left = 0
    Top = 475
    Width = 545
    Height = 21
    TabOrder = 1
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
      Left = 248
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
      Left = 248
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
      Left = 312
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
      Left = 312
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
  object memInfo: TMemo
    Left = -1
    Top = 342
    Width = 546
    Height = 124
    Color = clInfoBk
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 2
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
    FormaEstilo = feVertical
    CanEdit = False
    IsNewData = False
    ShowBtnNuevo = False
    ShowBtnModificar = False
    ShowBtnCancelar = False
    ShowBtnEliminar = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowBtnBuscar = False
    ShowBtnAyuda = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 466
    Top = 35
  end
  object NMSMTP1: TNMSMTP
    Port = 25
    ReportLevel = 0
    EncodeType = uuMime
    ClearParams = True
    SubType = mtPlain
    Charset = 'us-ascii'
    Left = 404
    Top = 32
  end
  object OutlookApplication1: TOutlookApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 432
    Top = 32
  end
  object qyQueryPA: TQuery
    Left = 468
    Top = 321
  end
  object ilID_CREDITO: TInterLinkit
    Control = edID_CREDITO
    OnEjecuta = ilID_CREDITOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilID_CREDITOCapture
    Left = 271
    Top = 68
  end
  object qyQueryAnexo3: TQuery
    Left = 436
    Top = 321
  end
  object ilID_ACREDITADO: TInterLinkit
    Control = edID_ACREDITADO
    OnEjecuta = ilID_ACREDITADOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilID_ACREDITADOCapture
    Left = 303
    Top = 108
  end
  object sdGenArch: TSaveDialog
    DefaultExt = '*.txt'
    Filter = 'Archivos de texto|*.txt|Todos los archivos|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Seleccione la ubicación y el nombre del archivo'
    Left = 206
    Top = 232
  end
  object ikCVE_MOTIVO_LIQ: TInterLinkit
    Control = edCVE_MOTIVO_LIQ
    OnEjecuta = ikCVE_MOTIVO_LIQEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ikCVE_MOTIVO_LIQCapture
    Left = 303
    Top = 156
  end
end
