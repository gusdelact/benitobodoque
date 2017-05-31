object WCrCalAcred: TWCrCalAcred
  Left = 334
  Top = 129
  Width = 661
  Height = 490
  Caption = 'Calificación Acreditado por Calificadora'
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
  object pgAltaDatos: TPageControl
    Left = 0
    Top = 8
    Width = 635
    Height = 390
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Alta de Datos'
      object lbID_CAL_ACRED: TLabel
        Left = 478
        Top = 7
        Width = 22
        Height = 13
        Caption = 'Folio'
      end
      object lbID_ACREDITADO: TLabel
        Left = 8
        Top = 31
        Width = 66
        Height = 13
        Caption = 'Id. Acreditado'
      end
      object lbID_CALIFICADORA: TLabel
        Left = 8
        Top = 52
        Width = 70
        Height = 13
        Caption = 'Id. Calificadora'
      end
      object lbCVE_TIPO_RIESGO: TLabel
        Left = 203
        Top = 152
        Width = 72
        Height = 13
        Alignment = taCenter
        Caption = 'Tipo de Riesgo'
      end
      object lbFH_CALIFICACION: TLabel
        Left = 478
        Top = 152
        Width = 121
        Height = 13
        Caption = 'Fecha y Hora Calificacion'
      end
      object lbCalificacion: TLabel
        Left = 7
        Top = 173
        Width = 54
        Height = 13
        Caption = 'Calificación'
      end
      object lbF_ALTA: TLabel
        Left = 7
        Top = 202
        Width = 66
        Height = 13
        Caption = 'Fecha de Alta'
      end
      object lbF_MODIFICA: TLabel
        Left = 7
        Top = 225
        Width = 73
        Height = 13
        Caption = 'Fecha Modifica'
      end
      object LBCVE_USU_ALTA: TLabel
        Left = 217
        Top = 202
        Width = 57
        Height = 13
        Caption = 'Usuario Alta'
      end
      object lbCVE_USU_MODIFICA: TLabel
        Left = 217
        Top = 226
        Width = 79
        Height = 13
        Caption = 'Usuario Modifica'
      end
      object lbCVE_CALIFICACION: TLabel
        Left = 89
        Top = 152
        Width = 99
        Height = 13
        Caption = 'Clave de Calificación'
      end
      object lbCVE_GRADO_RIESGO: TLabel
        Left = 280
        Top = 140
        Width = 98
        Height = 39
        Caption = 'Puntos de Distancia para Capitalización (Nivel)'
        WordWrap = True
      end
      object lbNUM_PUNTOS_DIST: TLabel
        Left = 380
        Top = 140
        Width = 95
        Height = 26
        Caption = 'Puntos de Distancia para la Calificación'
        WordWrap = True
      end
      object lbNOM_ACRED_CALIF: TLabel
        Left = 7
        Top = 115
        Width = 125
        Height = 28
        AutoSize = False
        Caption = 'Nombre del acreditado usado por la calificadora'
        WordWrap = True
      end
      object lbTXT_COMENTARIO: TLabel
        Left = 8
        Top = 247
        Width = 136
        Height = 13
        Caption = 'Comentario de la Calificacion'
      end
      object edID_CAL_ACRED: TEdit
        Left = 506
        Top = 4
        Width = 120
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clBtnFace
        TabOrder = 17
      end
      object edID_ACREDITADO: TEdit
        Tag = 562
        Left = 88
        Top = 26
        Width = 97
        Height = 21
        HelpContext = 1000
        CharCase = ecUpperCase
        TabOrder = 0
        OnExit = edID_ACREDITADOExit
      end
      object edID_CALIFICADORA: TEdit
        Tag = 562
        Left = 88
        Top = 49
        Width = 96
        Height = 21
        HelpContext = 1100
        CharCase = ecUpperCase
        TabOrder = 2
        OnExit = edID_CALIFICADORAExit
      end
      object edCVE_TIPO_RIESGO: TEdit
        Left = 200
        Top = 168
        Width = 77
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 6
      end
      object dtpFH_CALIFICACION: TInterDateTimePicker
        Tag = 18
        Left = 605
        Top = 169
        Width = 21
        Height = 21
        HelpContext = 1301
        CalAlignment = dtaLeft
        Date = 38498.8309309491
        Time = 38498.8309309491
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 10
        OnExit = edFH_CALIFICACIONExit
        Edit = edFH_CALIFICACION
        Formato = dfDateTime
      end
      object edFH_CALIFICACION: TEdit
        Tag = 18
        Left = 475
        Top = 168
        Width = 131
        Height = 21
        HelpContext = 1300
        CharCase = ecUpperCase
        TabOrder = 9
        OnExit = edFH_CALIFICACIONExit
      end
      object edCVE_CALIFICACION: TEdit
        Left = 109
        Top = 168
        Width = 90
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 5
      end
      object edF_MODIFICA: TEdit
        Left = 88
        Top = 222
        Width = 103
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 13
      end
      object edF_ALTA: TEdit
        Left = 88
        Top = 198
        Width = 103
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 12
      end
      object edCVE_USU_MODIFICA: TEdit
        Left = 307
        Top = 222
        Width = 106
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 15
      end
      object edCVE_USU_ALTA: TEdit
        Left = 307
        Top = 198
        Width = 106
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 14
      end
      object rgSIT_CAL_ACRED: TRadioGroup
        Tag = 18
        Left = 421
        Top = 190
        Width = 206
        Height = 56
        HelpContext = 1400
        Caption = 'Sit. Calificación Acred. por  Calificadora'
        ItemIndex = 0
        Items.Strings = (
          'Activo'
          'Cancelado')
        TabOrder = 11
        TabStop = True
        OnExit = rgSIT_CAL_ACREDExit
      end
      object btID_ACREDITADO: TBitBtn
        Tag = 50
        Left = 185
        Top = 25
        Width = 24
        Height = 22
        HelpContext = 1001
        TabOrder = 1
        OnClick = btID_ACREDITADOClick
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
      object edNOM_ACREDITADO: TEdit
        Left = 208
        Top = 26
        Width = 419
        Height = 21
        TabStop = False
        Color = clBtnFace
        TabOrder = 18
      end
      object btID_CALIFICADORA: TBitBtn
        Tag = 50
        Left = 185
        Top = 49
        Width = 24
        Height = 22
        HelpContext = 1101
        TabOrder = 3
        OnClick = btID_CALIFICADORAClick
        OnExit = edID_CALIFICADORAExit
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
      object edNOM_CALIFICADORA: TEdit
        Left = 208
        Top = 48
        Width = 419
        Height = 21
        TabStop = False
        Color = clBtnFace
        TabOrder = 19
      end
      object btCVE_CALIFICACION: TBitBtn
        Tag = 18
        Left = 87
        Top = 168
        Width = 24
        Height = 22
        HelpContext = 1200
        TabOrder = 4
        OnClick = btCVE_CALIFICACIONClick
        OnExit = btCVE_CALIFICACIONExit
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
      object edNUM_NIVEL: TEdit
        Left = 279
        Top = 168
        Width = 101
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clBtnFace
        MaxLength = 6
        ReadOnly = True
        TabOrder = 7
      end
      object edNUM_PUNTOS_DIST: TInterEdit
        Left = 381
        Top = 168
        Width = 94
        Height = 21
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trEntero
        MaxLength = 4
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 8
        ReadOnly = True
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = True
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edNOM_ACRED_CALIF: TEdit
        Left = 135
        Top = 118
        Width = 491
        Height = 21
        TabStop = False
        Color = clBtnFace
        TabOrder = 20
      end
      object rgCVE_ENTIDAD: TRadioGroup
        Tag = 18
        Left = 5
        Top = 75
        Width = 621
        Height = 36
        HelpContext = 1200
        Caption = 'Tipo de Entidad'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Estado'
          'Municipio'
          'Gobiernos Descentralizados')
        TabOrder = 21
        TabStop = True
      end
      object edTXT_COMENTARIO: TMemo
        Tag = 18
        Left = 8
        Top = 264
        Width = 601
        Height = 89
        HelpContext = 1500
        Lines.Strings = (
          'edTXT_COMENTARIO')
        MaxLength = 2000
        ScrollBars = ssVertical
        TabOrder = 16
        OnExit = edTXT_COMENTARIOExit
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Alta en Bloque'
      ImageIndex = 1
      object Label1: TLabel
        Left = 4
        Top = 111
        Width = 210
        Height = 13
        Caption = 'Indique el nombre del archivo Excel a cargar'
      end
      object Label15: TLabel
        Left = 3
        Top = 154
        Width = 242
        Height = 13
        Caption = 'Avance de obtención y complementación de Datos'
      end
      object lblCounter: TLabel
        Left = 286
        Top = 175
        Width = 36
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCVE_TIPO_RIESGO1: TLabel
        Left = 3
        Top = 51
        Width = 72
        Height = 13
        Caption = 'Tipo de Riesgo'
      end
      object lbInstrucciones: TLabel
        Left = 3
        Top = 1
        Width = 618
        Height = 38
        AutoSize = False
        Caption = 
          'Esta pantalla sirve para realizar la carga de las calificaciones' +
          ' en Bloque, donde el formato que debe tener el archivo debe de s' +
          'er igual al que se muestra en los links de ejemplos:'
        WordWrap = True
      end
      object lbLink1: TLabel
        Left = 115
        Top = 30
        Width = 154
        Height = 13
        Cursor = crHandPoint
        Caption = 'Ver Fomato de Archivo de Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = lbLink1Click
      end
      object lbLink2: TLabel
        Left = 339
        Top = 30
        Width = 156
        Height = 13
        Cursor = crHandPoint
        Caption = 'Ver Ejemplo de Archivo de Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = lbLink2Click
      end
      object btCarga: TBitBtn
        Tag = 21
        Left = 329
        Top = 168
        Width = 153
        Height = 25
        Caption = 'Carga en Bloque'
        TabOrder = 6
        OnClick = btCargaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
      object MErrores: TMemo
        Left = 0
        Top = 268
        Width = 627
        Height = 94
        Align = alBottom
        Color = clInfoBk
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 7
      end
      object edFileName: TEdit
        Tag = 21
        Left = 3
        Top = 128
        Width = 594
        Height = 21
        TabOrder = 3
      end
      object Button1: TButton
        Tag = 21
        Left = 596
        Top = 128
        Width = 29
        Height = 22
        Caption = '...'
        TabOrder = 4
        OnClick = Button1Click
      end
      object cbB_BREAK_ON_ERROR: TCheckBox
        Tag = 21
        Left = 330
        Top = 151
        Width = 296
        Height = 17
        Caption = 'En caso de encontrar Error en el archivo, detener la carga'
        TabOrder = 5
      end
      object ProgressBar: TProgressBar
        Left = 0
        Top = 173
        Width = 281
        Height = 17
        Min = 0
        Max = 100
        TabOrder = 8
      end
      object edCVE_TIPO_RIESGO1: TEdit
        Tag = 533
        Left = 79
        Top = 49
        Width = 106
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object btCVE_TIPO_RIESGO1: TBitBtn
        Tag = 21
        Left = 184
        Top = 48
        Width = 24
        Height = 22
        TabOrder = 1
        OnClick = btCVE_TIPO_RIESGO1Click
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
      object edDESC_TIPO_RIESGO1: TEdit
        Left = 206
        Top = 48
        Width = 419
        Height = 21
        TabStop = False
        Color = clBtnFace
        TabOrder = 9
      end
      object btAdminArch: TButton
        Tag = 21
        Left = 481
        Top = 168
        Width = 144
        Height = 25
        Caption = '&Administración Archivos'
        TabOrder = 10
        OnClick = btAdminArchClick
      end
      object rgCVE_ENTIDAD1: TRadioGroup
        Tag = 21
        Left = 4
        Top = 76
        Width = 622
        Height = 31
        HelpContext = 1200
        Caption = 'Tipo de Entidad del Archivo a Cargar'
        Columns = 3
        Items.Strings = (
          'Estado'
          'Municipio'
          'Gobiernos Descentralizados')
        TabOrder = 2
        TabStop = True
      end
    end
  end
  object MsgPanel: TPanel
    Left = 2
    Top = 400
    Width = 633
    Height = 21
    TabOrder = 1
  end
  object PnDatos: TPanel
    Left = 2
    Top = 421
    Width = 633
    Height = 21
    TabOrder = 2
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
      Left = 312
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
      Left = 312
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
      Left = 376
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
      Left = 376
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
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesNuevo = InterForma1AntesNuevo
    OnAntesModificar = InterForma1AntesModificar
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
    Left = 298
    Top = 3
  end
  object ilID_ACREDITADO: TInterLinkit
    Control = edID_ACREDITADO
    OnEjecuta = ilID_ACREDITADOEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    OnCapture = ilID_ACREDITADOCapture
    Left = 215
    Top = 41
  end
  object ilID_CALIFICADORA: TInterLinkit
    Control = edID_CALIFICADORA
    TipoReader = trEntero
    CharCase = ecUpperCase
    Left = 215
    Top = 74
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'xls'
    Filter = 'XLS (Archivo Excel) (*.csv)|*.xls'
    Left = 581
    Top = 99
  end
  object ilCVE_TIPO_RIESGO1: TInterLinkit
    Control = edCVE_TIPO_RIESGO1
    OnEjecuta = ilCVE_TIPO_RIESGO1Ejecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilID_ACREDITADOCapture
    Left = 254
    Top = 54
  end
  object Query1: TQuery
    SQL.Strings = (
      ' INSERT INTO CR_CAL_AR_DETALL'
      ' ( ID_CAL_AR_DETALL,  ID_CAL_AR_CABEC,  DESC_TIPO_ENTIDAD,'
      '   NOM_ACRED_CALIF,   CVE_CALIFICACION, TX_CALIFICACION,'
      '   SIT_CAL_AR_DETALL, CVE_USU_ALTA,     F_ALTA ) '
      ' VALUES '
      ' ( :PID_CAL_AR_DETALL,  :PID_CAL_AR_CABEC,  :PDESC_TIPO_ENTIDAD,'
      '   :PNOM_ACRED_CALIF,   :PCVE_CALIFICACION, :PTX_CALIFICACION,'
      '   :PSIT_CAL_AR_DETALL, :PCVE_USU_ALTA,     :PF_ALTA ) ')
    Left = 228
    Top = 203
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PID_CAL_AR_DETALL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PID_CAL_AR_CABEC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDESC_TIPO_ENTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNOM_ACRED_CALIF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCVE_CALIFICACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PTX_CALIFICACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PSIT_CAL_AR_DETALL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCVE_USU_ALTA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PF_ALTA'
        ParamType = ptInput
      end>
  end
end
