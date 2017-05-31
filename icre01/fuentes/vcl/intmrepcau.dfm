object WRepCau: TWRepCau
  Left = 291
  Top = 111
  BorderStyle = bsSingle
  Caption = ' Reporte de Garantías PRLV'
  ClientHeight = 440
  ClientWidth = 589
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grpContrato: TGroupBox
    Left = 5
    Top = 48
    Width = 579
    Height = 254
    TabOrder = 1
    object Bevel3: TBevel
      Left = 3
      Top = 132
      Width = 566
      Height = 3
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 9
      Top = 23
      Width = 51
      Height = 13
      Caption = 'Acreditado'
    end
    object Label2: TLabel
      Left = 9
      Top = 49
      Width = 42
      Height = 13
      Caption = 'Promotor'
    end
    object Label3: TLabel
      Left = 9
      Top = 75
      Width = 54
      Height = 13
      Caption = 'Disposición'
    end
    object Label9: TLabel
      Left = 267
      Top = 148
      Width = 134
      Height = 13
      Caption = 'Filtrar x Fechas Crédito de....'
    end
    object Label4: TLabel
      Left = 9
      Top = 101
      Width = 84
      Height = 13
      Caption = 'Mercado Objetivo'
    end
    object edID_CREDITO: TEdit
      Tag = 512
      Left = 97
      Top = 70
      Width = 84
      Height = 21
      HelpContext = 1001
      CharCase = ecUpperCase
      TabOrder = 9
    end
    object btnCredito: TBitBtn
      Tag = 512
      Left = 180
      Top = 68
      Width = 25
      Height = 23
      HelpContext = 1002
      TabOrder = 10
      OnClick = btnCreditoClick
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
    object edNom_Credito: TEdit
      Left = 203
      Top = 69
      Width = 346
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 11
    end
    object chkCredito: TCheckBox
      Left = 555
      Top = 70
      Width = 18
      Height = 17
      TabOrder = 12
      OnClick = chkCreditoClick
    end
    object edID_PROMOTOR: TEdit
      Tag = 512
      Left = 98
      Top = 44
      Width = 84
      Height = 21
      HelpContext = 1001
      CharCase = ecUpperCase
      TabOrder = 5
    end
    object edNombre_Promotor: TEdit
      Left = 203
      Top = 44
      Width = 346
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object btnPromotor: TBitBtn
      Tag = 512
      Left = 181
      Top = 41
      Width = 25
      Height = 23
      HelpContext = 1002
      TabOrder = 6
      OnClick = btnPromotorClick
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
    object chkPromotor: TCheckBox
      Left = 555
      Top = 44
      Width = 18
      Height = 17
      TabOrder = 8
      OnClick = chkPromotorClick
    end
    object chkAcreditado: TCheckBox
      Left = 555
      Top = 18
      Width = 18
      Height = 17
      TabOrder = 4
      OnClick = chkAcreditadoClick
    end
    object edID_ACREDITADO: TEdit
      Tag = 512
      Left = 98
      Top = 18
      Width = 86
      Height = 21
      TabOrder = 0
    end
    object btnId_Persona: TBitBtn
      Tag = 512
      Left = 179
      Top = 18
      Width = 26
      Height = 22
      HelpContext = 2101
      TabOrder = 1
      TabStop = False
      OnClick = btnId_PersonaClick
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
    object edNombre: TEdit
      Left = 203
      Top = 18
      Width = 346
      Height = 21
      Color = clBtnFace
      TabOrder = 3
    end
    object chkInicio: TCheckBox
      Left = 268
      Top = 177
      Width = 53
      Height = 17
      Caption = 'Inicio'
      TabOrder = 18
      OnClick = chkInicioClick
    end
    object dtpFromInicio: TDateTimePicker
      Left = 353
      Top = 176
      Width = 85
      Height = 21
      CalAlignment = dtaLeft
      Date = 37525.5033361343
      Time = 37525.5033361343
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 19
    end
    object dtpToInicio: TDateTimePicker
      Left = 484
      Top = 176
      Width = 84
      Height = 21
      CalAlignment = dtaLeft
      Date = 37525.5033361343
      Time = 37525.5033361343
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 20
    end
    object cbxInicio: TComboBox
      Left = 435
      Top = 176
      Width = 50
      Height = 21
      Color = 16767411
      Enabled = False
      ItemHeight = 13
      TabOrder = 21
      OnChange = cbxInicioChange
      Items.Strings = (
        'Entre'
        '<'
        '>'
        '<='
        '>='
        '=')
    end
    object chkVencimiento: TCheckBox
      Left = 267
      Top = 207
      Width = 82
      Height = 17
      Caption = 'Vencimiento'
      TabOrder = 22
      OnClick = chkVencimientoClick
    end
    object dtpFromVencimiento: TDateTimePicker
      Left = 353
      Top = 204
      Width = 84
      Height = 21
      CalAlignment = dtaLeft
      Date = 37525.5033361343
      Time = 37525.5033361343
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 23
    end
    object cbxVencimiento: TComboBox
      Left = 434
      Top = 204
      Width = 50
      Height = 21
      Color = 16767411
      Enabled = False
      ItemHeight = 13
      TabOrder = 24
      OnChange = cbxVencimientoChange
      Items.Strings = (
        'Entre'
        '<'
        '>'
        '<='
        '>='
        '=')
    end
    object dtpToVencimiento: TDateTimePicker
      Left = 483
      Top = 204
      Width = 84
      Height = 21
      CalAlignment = dtaLeft
      Date = 37525.5033361343
      Time = 37525.5033361343
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 25
    end
    object grpSituacion: TGroupBox
      Left = 124
      Top = 147
      Width = 134
      Height = 95
      Caption = 'Sit. Crédito con PRLV'
      TabOrder = 17
      object Bevel1: TBevel
        Left = 2
        Top = 43
        Width = 129
        Height = 5
        Shape = bsTopLine
      end
      object chkActivos: TCheckBox
        Left = 27
        Top = 48
        Width = 97
        Height = 17
        Caption = 'Activos'
        TabOrder = 1
        OnClick = chkActivosClick
      end
      object chkNoActivo: TCheckBox
        Left = 27
        Top = 102
        Width = 97
        Height = 16
        Caption = 'No Activo'
        TabOrder = 3
        Visible = False
        OnClick = chkActivosClick
      end
      object chkCancelados: TCheckBox
        Left = 27
        Top = 119
        Width = 97
        Height = 16
        Caption = 'Cancelados'
        TabOrder = 4
        Visible = False
        OnClick = chkActivosClick
      end
      object chkLiquidados: TCheckBox
        Left = 27
        Top = 65
        Width = 97
        Height = 17
        Caption = 'Liquidados'
        TabOrder = 2
        OnClick = chkActivosClick
      end
      object chkTodos: TCheckBox
        Left = 27
        Top = 23
        Width = 97
        Height = 17
        Caption = 'Todos'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = chkTodosClick
      end
      object chkSinReferencia: TCheckBox
        Left = 27
        Top = 137
        Width = 97
        Height = 16
        Caption = 'Sin Referencia'
        TabOrder = 5
        Visible = False
        OnClick = chkActivosClick
      end
    end
    object grpMonto: TGroupBox
      Left = 10
      Top = 147
      Width = 106
      Height = 95
      Caption = 'Monto del Crédito'
      TabOrder = 16
      object opFaltante: TRadioButton
        Left = 13
        Top = 44
        Width = 74
        Height = 17
        Caption = 'Faltante'
        TabOrder = 1
      end
      object opSobrante: TRadioButton
        Left = 13
        Top = 66
        Width = 74
        Height = 17
        Caption = 'Sobrante'
        TabOrder = 2
      end
      object opTodos: TRadioButton
        Left = 13
        Top = 24
        Width = 74
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
    end
    object edCVE_PRESUPUESTO: TEdit
      Tag = 512
      Left = 98
      Top = 96
      Width = 84
      Height = 21
      HelpContext = 1001
      CharCase = ecUpperCase
      TabOrder = 13
    end
    object btCVE_PRESUPUESTO: TBitBtn
      Tag = 512
      Left = 180
      Top = 94
      Width = 25
      Height = 23
      HelpContext = 1002
      TabOrder = 2
      OnClick = btCVE_PRESUPUESTOClick
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
    object edDESC_PRESUPUESTO: TEdit
      Left = 203
      Top = 95
      Width = 346
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 14
    end
    object cbCVE_PRESUPUESTO: TCheckBox
      Left = 555
      Top = 98
      Width = 18
      Height = 17
      TabOrder = 15
      OnClick = cbCVE_PRESUPUESTOClick
    end
  end
  object Edit1: TEdit
    Left = 289
    Top = 460
    Width = 273
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
  object grpCredito: TGroupBox
    Left = 6
    Top = 3
    Width = 578
    Height = 43
    Caption = 'Tipo de Valuación'
    TabOrder = 0
    object opCierredeAyer: TRadioButton
      Left = 345
      Top = 17
      Width = 113
      Height = 17
      Caption = 'Al Cierre de Ayer'
      TabOrder = 0
    end
    object opPreciodeMercado: TRadioButton
      Left = 97
      Top = 17
      Width = 126
      Height = 17
      Caption = 'Al Precio del Mercado'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
  end
  object Edit2: TEdit
    Left = 9
    Top = 459
    Width = 233
    Height = 21
    TabOrder = 3
    Text = 'Edit2'
  end
  object PnDatos: TPanel
    Left = 4
    Top = 411
    Width = 581
    Height = 22
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
      Left = 292
      Top = 1
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
      Left = 292
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
      Left = 356
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
      Left = 356
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
  object grbReporte: TGroupBox
    Left = 5
    Top = 308
    Width = 581
    Height = 98
    Caption = 'Mostrar Reporte de Créditos...'
    TabOrder = 5
    object Bevel6: TBevel
      Left = 7
      Top = 50
      Width = 569
      Height = 34
    end
    object Label8: TLabel
      Left = 356
      Top = 61
      Width = 80
      Height = 13
      Caption = 'Tipo de Formato:'
    end
    object chkExcel: TCheckBox
      Left = 15
      Top = 59
      Width = 146
      Height = 17
      Caption = 'Archivo de Salida a Excel'
      TabOrder = 0
      OnClick = chkExcelClick
    end
    object edFileName: TEdit
      Left = 162
      Top = 56
      Width = 170
      Height = 21
      Color = clBtnFace
      TabOrder = 1
      Text = 'C:\'
    end
    object btFileExcel: TButton
      Left = 328
      Top = 57
      Width = 21
      Height = 21
      Caption = '...'
      Enabled = False
      TabOrder = 2
      OnClick = btFileExcelClick
    end
    object opPlano: TRadioButton
      Left = 454
      Top = 59
      Width = 57
      Height = 17
      Caption = 'Plano'
      Checked = True
      Enabled = False
      TabOrder = 3
      TabStop = True
    end
    object opReporte: TRadioButton
      Left = 510
      Top = 59
      Width = 61
      Height = 17
      Caption = 'Reporte'
      Enabled = False
      TabOrder = 4
    end
    object Panel1: TPanel
      Left = 6
      Top = 16
      Width = 570
      Height = 27
      BevelOuter = bvNone
      TabOrder = 5
      object opCreditosInternosA: TRadioButton
        Left = 40
        Top = 7
        Width = 209
        Height = 17
        Caption = 'Internos (Agrupado x Crédito)'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object opCreditosInternosB: TRadioButton
        Left = 302
        Top = 7
        Width = 209
        Height = 17
        Caption = 'Internos (Con Totales x Acreditado)'
        TabOrder = 1
      end
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
    FormaTipo = ftImprimir
    FormaEstilo = feHorizontal
    CanEdit = False
    IsNewData = False
    ShowBtnNuevo = False
    ShowBtnModificar = False
    ShowBtnAceptar = False
    ShowBtnCancelar = False
    ShowBtnEliminar = False
    Version = 20
    HideButtons = False
    OnBtnPreviewClick = InterForma1BtnPreviewClick
    ShowBtnPreview = False
    OnBtnImprimirClick = InterForma1BtnImprimirClick
    ShowBtnBuscar = False
    ShowGrid = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 455
    Top = 117
  end
  object ilID_Acreditado: TInterLinkit
    Control = edID_ACREDITADO
    OnEjecuta = ilID_AcreditadoEjecuta
    TipoReader = trEntero
    CharCase = ecNormal
    OnCapture = ilID_AcreditadoCapture
    Left = 221
    Top = 60
  end
  object Query1: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'select * from cre_credito'
      'where rownum <= 1')
    Left = 527
    Top = 116
  end
  object Qry: TQuery
    Left = 499
    Top = 116
  end
  object ILCredito: TInterLinkit
    Control = edID_CREDITO
    OnEjecuta = ILCreditoEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilID_AcreditadoCapture
    Left = 303
    Top = 120
  end
  object ILPromotor: TInterLinkit
    Control = edID_PROMOTOR
    OnEjecuta = ILPromotorEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    OnCapture = ilID_AcreditadoCapture
    Left = 262
    Top = 87
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.xls'
    Filter = 'Microsoft Excel (*.xls)|*.xls'
    Left = 429
    Top = 252
  end
  object ilCVE_PRESUPUESTO: TInterLinkit
    Control = edCVE_PRESUPUESTO
    OnEjecuta = ilCVE_PRESUPUESTOEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    OnCapture = ilCVE_PRESUPUESTOCapture
    Left = 340
    Top = 143
  end
end
