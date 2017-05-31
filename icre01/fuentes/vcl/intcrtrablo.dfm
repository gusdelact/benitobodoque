object WCrTransBloq: TWCrTransBloq
  Left = 350
  Top = 67
  Width = 668
  Height = 591
  Caption = 'Relación Garantía Chequera - Disposición'
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
  object lbIID_BLQ_TRANSAC: TLabel
    Left = 512
    Top = 11
    Width = 22
    Height = 13
    Caption = 'Folio'
  end
  object lbTX_MOTIVO_RECHAZO: TLabel
    Left = 490
    Top = 458
    Width = 96
    Height = 26
    Caption = 'Motivo de Rechazo (En caso de existir)'
    WordWrap = True
  end
  object lbFH_ALTA: TLabel
    Left = 12
    Top = 466
    Width = 85
    Height = 13
    Caption = 'Fecha y Hora Alta'
  end
  object lbFH_ACTIVACION: TLabel
    Left = 12
    Top = 491
    Width = 117
    Height = 13
    Caption = 'Fecha y Hora Activación'
  end
  object lbCVE_USU_ACTIVACION: TLabel
    Left = 274
    Top = 491
    Width = 89
    Height = 13
    Caption = 'Usuario Activación'
  end
  object lbCVE_USU_ALTA: TLabel
    Left = 274
    Top = 466
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object edID_BLQ_TRANSAC: TEdit
    Left = 544
    Top = 8
    Width = 103
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object edTX_MOTIVO_RECHAZO: TEdit
    Left = 489
    Top = 487
    Width = 159
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
  end
  object GroupBox1: TGroupBox
    Left = 7
    Top = 27
    Width = 647
    Height = 110
    Caption = 'Datos de la Disposición'
    TabOrder = 1
    object lbF_INICIO: TLabel
      Left = 8
      Top = 63
      Width = 73
      Height = 13
      Caption = 'Fecha de Inicio'
    end
    object lbID_CREDITO: TLabel
      Left = 8
      Top = 23
      Width = 74
      Height = 13
      Caption = 'No. Disposición'
    end
    object lbNOM_ACREDITADO: TLabel
      Left = 276
      Top = 0
      Width = 51
      Height = 13
      Caption = 'Acreditado'
    end
    object lblF_VENCIMIENTO: TLabel
      Left = 9
      Top = 85
      Width = 52
      Height = 13
      Caption = 'Fecha Vto.'
    end
    object lbIMP_CREDITO: TLabel
      Left = 226
      Top = 63
      Width = 71
      Height = 13
      Caption = 'Importe Crédito'
    end
    object lbSDO_INSOLUTO: TLabel
      Left = 227
      Top = 85
      Width = 67
      Height = 13
      Caption = 'Saldo Insoluto'
    end
    object Bevel1: TBevel
      Left = 0
      Top = 50
      Width = 649
      Height = 2
    end
    object lbIMP_GARANTIZAR: TLabel
      Left = 432
      Top = 62
      Width = 97
      Height = 13
      Caption = 'Importe a Garantízar'
    end
    object lbSIT_CREDITO1: TLabel
      Left = 432
      Top = 86
      Width = 99
      Height = 13
      Caption = 'Situación Diposicion:'
    end
    object lbDESC_MONEDA: TLabel
      Left = 212
      Top = 0
      Width = 39
      Height = 13
      Caption = 'Moneda'
    end
    object edID_CREDITO: TEdit
      Tag = 562
      Left = 86
      Top = 19
      Width = 88
      Height = 21
      HelpContext = 1001
      TabOrder = 0
      OnExit = edID_CREDITOExit
    end
    object btID_CREDITO: TBitBtn
      Tag = 18
      Left = 172
      Top = 21
      Width = 22
      Height = 20
      HelpContext = 1002
      TabOrder = 1
      OnClick = btID_CREDITOClick
      OnExit = edID_CREDITOExit
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
    object edNOM_ACREDITADO: TEdit
      Left = 275
      Top = 20
      Width = 365
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edF_INICIO: TEdit
      Left = 86
      Top = 59
      Width = 87
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object dtpF_INICIO: TInterDateTimePicker
      Left = 170
      Top = 59
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 37781.35659625
      Time = 37781.35659625
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 5
      TabStop = False
      Edit = edF_INICIO
      Formato = dfDate
    end
    object edF_VENCIMIENTO: TEdit
      Left = 86
      Top = 80
      Width = 85
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
    end
    object dtpF_VENCIMIENTO: TInterDateTimePicker
      Left = 170
      Top = 81
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 37781.35659625
      Time = 37781.35659625
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 7
      TabStop = False
      Edit = edF_VENCIMIENTO
      Formato = dfDate
    end
    object edIMP_CREDITO: TInterEdit
      Left = 308
      Top = 58
      Width = 100
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      Color = clBtnFace
      TabOrder = 8
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edSDO_INSOLUTO: TInterEdit
      Left = 308
      Top = 80
      Width = 100
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      Color = clBtnFace
      TabOrder = 9
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_GARANTIZAR: TInterEdit
      Left = 537
      Top = 58
      Width = 103
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      Color = clBtnFace
      TabOrder = 10
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edSIT_CREDITO: TEdit
      Left = 536
      Top = 87
      Width = 100
      Height = 15
      TabStop = False
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
      Text = '||'
    end
    object edDESC_MONEDA: TEdit
      Left = 192
      Top = 20
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 7
    Top = 144
    Width = 647
    Height = 151
    Caption = 'Datos del Otorgante de la Garantía'
    TabOrder = 2
    object lbID_CONTRATO_DV: TLabel
      Left = 12
      Top = 39
      Width = 46
      Height = 13
      Caption = 'Chequera'
    end
    object lbV_SDO_EFE_DV: TLabel
      Left = 8
      Top = 110
      Width = 49
      Height = 26
      Caption = 'Saldo Disponible'
      WordWrap = True
    end
    object lbV_SDO_COMP_DV: TLabel
      Left = 315
      Top = 110
      Width = 67
      Height = 26
      Caption = 'Saldo Comprometido'
      WordWrap = True
    end
    object lbSDO_GTIA_CREDITO: TLabel
      Left = 482
      Top = 110
      Width = 51
      Height = 26
      Caption = 'Saldo Gtía Crédito'
      WordWrap = True
    end
    object lbV_SDO_BLOQ_DV: TLabel
      Left = 162
      Top = 110
      Width = 51
      Height = 26
      Caption = 'Saldo Bloqueado'
      WordWrap = True
    end
    object lbDESC_MONEDA_DV: TLabel
      Left = 209
      Top = 0
      Width = 39
      Height = 13
      Caption = 'Moneda'
    end
    object lbNOM_TITULAR_CTO_DV: TLabel
      Left = 276
      Top = 0
      Width = 29
      Height = 13
      Caption = 'Titular'
    end
    object pnlID_CONTRATO_DV: TInterCtoPanel
      Tag = 50
      Left = 7
      Top = 60
      Width = 634
      Height = 45
      Hint = 'Información del Contrato'
      Lenguaje = 0
      ShowLenguaje = False
      ShowEnviarEMail = False
    end
    object btID_CONTRATO_DV: TBitBtn
      Tag = 18
      Left = 174
      Top = 36
      Width = 22
      Height = 20
      HelpContext = 1103
      TabOrder = 2
      OnClick = btID_CONTRATO_DVClick
      OnExit = edID_CONTRATO_DVExit
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
    object edNOM_TITULAR_CTO_DV: TEdit
      Left = 274
      Top = 36
      Width = 367
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edV_SDO_EFE_DV: TInterEdit
      Left = 61
      Top = 114
      Width = 90
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 6
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edV_SDO_COMP_DV: TInterEdit
      Left = 383
      Top = 114
      Width = 90
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 8
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edSDO_GTIA_CREDITO: TInterEdit
      Left = 537
      Top = 114
      Width = 102
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 9
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edV_SDO_BLOQ_DV: TInterEdit
      Left = 215
      Top = 114
      Width = 90
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 7
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edDESC_MONEDA_DV: TEdit
      Left = 192
      Top = 36
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edID_CONTRATO_DV: TInterEdit
      Tag = 562
      Left = 83
      Top = 32
      Width = 90
      Height = 21
      HelpContext = 1102
      Prefijo = '1'
      Contrato = -1
      TipoReader = trContrato
      OnExit = edID_CONTRATO_DVExit
      MaxLength = 10
      TabOrder = 1
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object chkFilterAcreditado: TCheckBox
      Tag = 562
      Left = 10
      Top = 17
      Width = 272
      Height = 13
      HelpContext = 1101
      Caption = 'Seleccionar Únicamente Chequeras del Acreditado '
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnExit = edID_CONTRATO_DVExit
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 296
    Width = 646
    Height = 159
    Caption = 'Movimientos a Realizar'
    TabOrder = 3
    object lbCVE_BLQ_OPERACION: TLabel
      Left = 8
      Top = 23
      Width = 63
      Height = 13
      Caption = 'Clave Movto.'
    end
    object lbIMP_SALDO: TLabel
      Left = 480
      Top = 18
      Width = 54
      Height = 26
      Caption = 'Importe del Movimiento'
      WordWrap = True
    end
    object lbCVE_BLQ_CPTO: TLabel
      Left = 8
      Top = 47
      Width = 79
      Height = 13
      Caption = 'Clave Concepto.'
    end
    object lbTX_MOTIVO: TLabel
      Left = 8
      Top = 70
      Width = 167
      Height = 13
      Caption = 'Descripción del Motivo del Bloqueo'
    end
    object lbSituacion: TLabel
      Left = 480
      Top = 49
      Width = 62
      Height = 26
      Caption = 'Situación Transacción:'
      WordWrap = True
    end
    object lbSIT_TRANS_BLOQ: TLabel
      Left = 540
      Top = 47
      Width = 98
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Por Activar'
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object edCVE_BLQ_OPERACION: TEdit
      Tag = 562
      Left = 90
      Top = 19
      Width = 82
      Height = 21
      HelpContext = 1201
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = edCVE_BLQ_OPERACIONExit
    end
    object btCVE_BLQ_OPERACION: TBitBtn
      Tag = 18
      Left = 171
      Top = 21
      Width = 22
      Height = 20
      HelpContext = 1202
      TabOrder = 1
      OnClick = btCVE_BLQ_OPERACIONClick
      OnExit = edCVE_BLQ_OPERACIONExit
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
    object edDESC_BLQ_OPERACION: TEdit
      Left = 191
      Top = 19
      Width = 282
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
    end
    object edCVE_BLQ_CPTO: TEdit
      Tag = 562
      Left = 90
      Top = 43
      Width = 82
      Height = 21
      HelpContext = 1301
      CharCase = ecUpperCase
      TabOrder = 2
      OnExit = edCVE_BLQ_CPTOExit
    end
    object btCVE_BLQ_CPTO: TBitBtn
      Tag = 18
      Left = 171
      Top = 44
      Width = 22
      Height = 20
      HelpContext = 1302
      TabOrder = 3
      OnClick = btCVE_BLQ_CPTOClick
      OnExit = edCVE_BLQ_CPTOExit
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
    object edDESC_BLQ_CPTO: TEdit
      Left = 191
      Top = 43
      Width = 282
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object memTX_MOTIVO: TMemo
      Tag = 18
      Left = 6
      Top = 85
      Width = 633
      Height = 65
      HelpContext = 1501
      ScrollBars = ssBoth
      TabOrder = 5
      OnExit = memTX_MOTIVOExit
      OnKeyPress = memTX_MOTIVOKeyPress
    end
    object edIMP_SALDO: TInterEdit
      Tag = 18
      Left = 538
      Top = 16
      Width = 101
      Height = 21
      HelpContext = 1401
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edIMP_SALDOExit
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      TabOrder = 4
      UseReType = True
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object edCVE_USU_ACTIVACION: TEdit
    Left = 369
    Top = 486
    Width = 115
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
  end
  object edCVE_USU_ALTA: TEdit
    Left = 369
    Top = 462
    Width = 115
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object edFH_ALTA: TEdit
    Left = 132
    Top = 462
    Width = 135
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object edFH_ACTIVACION: TEdit
    Left = 132
    Top = 487
    Width = 135
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object PnDatos: TPanel
    Left = 3
    Top = 533
    Width = 655
    Height = 19
    TabOrder = 10
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
      Left = 336
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
      Left = 336
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
      Left = 400
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
      Left = 400
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
  object MsgPanel: TPanel
    Left = 3
    Top = 511
    Width = 655
    Height = 22
    TabOrder = 9
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
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
    Left = 616
    Top = 21
  end
  object ilID_CREDITO: TInterLinkit
    Control = edID_CREDITO
    OnEjecuta = ilID_CREDITOEjecuta
    TipoReader = trEntero
    CharCase = ecNormal
    OnCapture = ilID_CREDITOCapture
    Left = 207
    Top = 50
  end
  object ilID_CONTRATO_DV: TInterLinkit
    Control = edID_CONTRATO_DV
    OnEjecuta = ilID_CONTRATO_DVEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    OnCapture = ilID_CREDITOCapture
    Left = 236
    Top = 186
  end
  object ilCVE_BLQ_OPERACION: TInterLinkit
    Control = edCVE_BLQ_OPERACION
    OnEjecuta = ilCVE_BLQ_OPERACIONEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilID_CREDITOCapture
    Left = 227
    Top = 308
  end
  object ilCVE_BLQ_CPTO: TInterLinkit
    Control = edCVE_BLQ_CPTO
    OnEjecuta = ilCVE_BLQ_CPTOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilID_CREDITOCapture
    Left = 253
    Top = 333
  end
end
