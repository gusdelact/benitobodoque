object WCrCamTasM: TWCrCamTasM
  Left = 319
  Top = 36
  Width = 636
  Height = 564
  Caption = 'Cambio de Tasa'
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
  object PnDatos: TPanel
    Left = 1
    Top = 504
    Width = 616
    Height = 18
    TabOrder = 4
    object lbEmpresa: TLabel
      Left = 11
      Top = 1
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
      Top = 8
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
      Left = 336
      Top = 8
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
      Left = 59
      Top = 8
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
      Left = 392
      Top = 8
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
      Left = 392
      Top = 1
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
      Left = 59
      Top = 1
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 617
    Height = 121
    Caption = 'Datos de la disposición'
    TabOrder = 0
    object lbID_CREDITO: TLabel
      Left = 8
      Top = 25
      Width = 66
      Height = 13
      Caption = 'Id Disposición'
    end
    object Label1: TLabel
      Left = 8
      Top = 74
      Width = 94
      Height = 13
      Caption = 'Tasa de Referencia'
    end
    object Label9: TLabel
      Left = 11
      Top = 101
      Width = 48
      Height = 13
      Caption = 'STasa (%)'
    end
    object lbCVE_CALCULO: TLabel
      Left = 8
      Top = 50
      Width = 96
      Height = 13
      Caption = 'Cálculo de Intereses'
    end
    object edID_CREDITO: TEdit
      Left = 120
      Top = 21
      Width = 73
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 0
    end
    object edCVE_PRODUCTO: TEdit
      Left = 195
      Top = 21
      Width = 56
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      MaxLength = 8
      TabOrder = 1
    end
    object edDESC_PRODUCTO: TEdit
      Left = 252
      Top = 21
      Width = 313
      Height = 21
      TabStop = False
      Color = clBtnFace
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
    end
    object edCVE_TAS_REF: TEdit
      Left = 120
      Top = 69
      Width = 73
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 3
    end
    object edDESC_TASA_REFER: TEdit
      Left = 195
      Top = 68
      Width = 219
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edSOBRETASA: TEdit
      Left = 120
      Top = 93
      Width = 73
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 5
      Text = '0'
    end
    object edDESC_CALC_INT: TEdit
      Left = 196
      Top = 45
      Width = 218
      Height = 21
      TabStop = False
      Color = clBtnFace
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 6
    end
    object edCVE_CALCULO: TEdit
      Left = 120
      Top = 45
      Width = 73
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 7
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 124
    Width = 617
    Height = 272
    Caption = 'Cambio de Tasa'
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 24
      Width = 22
      Height = 13
      Caption = 'Folio'
    end
    object Label5: TLabel
      Left = 8
      Top = 54
      Width = 83
      Height = 13
      Caption = 'Fecha de Cambio'
    end
    object Label6: TLabel
      Left = 266
      Top = 51
      Width = 85
      Height = 13
      Caption = 'Periodo de interes'
    end
    object lbCVE_TASA_REFER: TLabel
      Left = 224
      Top = 80
      Width = 132
      Height = 13
      Caption = 'Nueva Tasa de Referencia '
    end
    object Label7: TLabel
      Left = 8
      Top = 192
      Width = 100
      Height = 13
      Caption = 'Nueva Sobretasa (%)'
    end
    object lbSITUACION: TLabel
      Left = 8
      Top = 241
      Width = 123
      Height = 13
      Caption = 'Situación del cambio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSIT_CAMBIO: TLabel
      Tag = 18
      Left = 132
      Top = 241
      Width = 4
      Height = 13
      Caption = '|'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 8
      Top = 81
      Width = 136
      Height = 13
      Caption = 'Anterior Tasa de Referencia '
    end
    object Label10: TLabel
      Left = 8
      Top = 107
      Width = 104
      Height = 13
      Caption = 'Anterior Sobretasa (%)'
    end
    object lbSit_Per_Interes: TLabel
      Tag = 18
      Left = 540
      Top = 52
      Width = 4
      Height = 13
      Caption = '|'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label32: TLabel
      Left = 572
      Top = 261
      Width = 37
      Height = 7
      Caption = 'V20140130'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 418
      Top = 51
      Width = 121
      Height = 13
      Caption = 'Situación Periodo Interés:'
    end
    object lbOPERADOR_STASA: TLabel
      Left = 189
      Top = 155
      Width = 84
      Height = 13
      Caption = 'Ope. para cálculo'
    end
    object Label12: TLabel
      Left = 323
      Top = 155
      Width = 95
      Height = 13
      Caption = 'Variación Sobretasa'
    end
    object edFOL_CAMBIO: TEdit
      Left = 48
      Top = 21
      Width = 73
      Height = 21
      HelpContext = 1000
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 0
    end
    object edF_APLICACION: TEdit
      Tag = 18
      Left = 121
      Top = 50
      Width = 76
      Height = 21
      HelpContext = 2000
      Color = clWhite
      TabOrder = 1
      OnEnter = edF_APLICACIONEnter
      OnExit = edF_APLICACIONExit
    end
    object dtpF_APLICACION: TInterDateTimePicker
      Tag = 18
      Left = 198
      Top = 50
      Width = 20
      Height = 21
      HelpContext = 2001
      CalAlignment = dtaLeft
      Date = 37777.7691627546
      Time = 37777.7691627546
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
      OnEnter = edF_APLICACIONEnter
      OnExit = edF_APLICACIONExit
      Edit = edF_APLICACION
      Formato = dfDate
    end
    object edNUM_PERIODO: TInterEdit
      Left = 362
      Top = 47
      Width = 49
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###0'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 3
      UseReType = True
      UseSep = True
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edCVE_TAS_REF_NVA: TEdit
      Tag = 530
      Left = 363
      Top = 76
      Width = 72
      Height = 21
      HelpContext = 3500
      CharCase = ecUpperCase
      TabOrder = 5
      OnExit = edCVE_TAS_REF_NVAExit
    end
    object btTASA_REFER: TBitBtn
      Tag = 18
      Left = 436
      Top = 77
      Width = 22
      Height = 20
      HelpContext = 3501
      TabOrder = 6
      OnClick = btTASA_REFERClick
      OnExit = edCVE_TAS_REF_NVAExit
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
    object edSOBRETASA_NVA: TInterEdit
      Left = 147
      Top = 188
      Width = 49
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###0.0000'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 11
      ReadOnly = True
      UseReType = True
      UseSep = True
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object chB_APL_SIG_PER: TCheckBox
      Left = 208
      Top = 192
      Width = 137
      Height = 17
      HelpContext = 6000
      TabStop = False
      Alignment = taLeftJustify
      Caption = 'Aplica Siguiente Periodo'
      TabOrder = 12
      Visible = False
      OnExit = chB_APL_SIG_PERExit
    end
    object btAUTORIZA: TBitBtn
      Left = 432
      Top = 239
      Width = 88
      Height = 20
      Caption = 'Autorización'
      Enabled = False
      TabOrder = 14
      TabStop = False
      OnClick = btAUTORIZAClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
    object btCANCELA: TBitBtn
      Left = 522
      Top = 239
      Width = 89
      Height = 20
      Caption = 'Cancelación'
      Enabled = False
      TabOrder = 15
      TabStop = False
      OnClick = btCANCELAClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
    end
    object edCVE_TAS_REF_ANT: TEdit
      Left = 147
      Top = 76
      Width = 72
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edSOBRETASA_ANT: TInterEdit
      Left = 147
      Top = 103
      Width = 49
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###0.0000'
      MaxLength = 12
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 7
      ReadOnly = True
      UseReType = True
      UseSep = True
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object chB_REINICIA_PER: TCheckBox
      Left = 368
      Top = 192
      Width = 137
      Height = 17
      HelpContext = 6500
      TabStop = False
      Alignment = taLeftJustify
      Caption = 'Reinicia Cálculo Periodo'
      TabOrder = 13
      Visible = False
      OnExit = chB_REINICIA_PERExit
    end
    object cbOPERADOR_STASA: TEdit
      Tag = 530
      Left = 275
      Top = 151
      Width = 38
      Height = 21
      HelpContext = 4500
      CharCase = ecUpperCase
      MaxLength = 1
      TabOrder = 9
      OnExit = cbOPERADOR_STASAExit
      OnKeyPress = cbOPERADOR_STASAKeyPress
    end
    object edVariacionTasa: TInterEdit
      Tag = 530
      Left = 422
      Top = 151
      Width = 49
      Height = 21
      HelpContext = 5000
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edVariacionTasaExit
      DisplayMask = '###0.0000'
      MaxLength = 12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 10
      UseReType = True
      UseSep = True
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object rgB_APL_PCT_VARIA: TRadioGroup
      Tag = 18
      Left = 8
      Top = 136
      Width = 169
      Height = 41
      HelpContext = 4000
      Caption = 'Tipo de variación de sobretasa'
      Columns = 2
      Items.Strings = (
        'Puntos'
        'Porcentaje')
      TabOrder = 8
      TabStop = True
      OnExit = rgB_APL_PCT_VARIAExit
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 400
    Width = 617
    Height = 65
    TabOrder = 2
    object lbUSUA_ALTA: TLabel
      Left = 2
      Top = 17
      Width = 43
      Height = 13
      Caption = 'Usu. Alta'
    end
    object lbF_ALTA: TLabel
      Left = 2
      Top = 37
      Width = 45
      Height = 13
      Caption = 'F. de Alta'
    end
    object lbUSUA_MODIF: TLabel
      Left = 141
      Top = 17
      Width = 65
      Height = 13
      Caption = 'Usu. Modifica'
    end
    object lbF_MODIF: TLabel
      Left = 141
      Top = 37
      Width = 52
      Height = 13
      Caption = 'F. Modifica'
    end
    object lbUSUA_AUTOR: TLabel
      Left = 301
      Top = 17
      Width = 63
      Height = 13
      Caption = 'Usu. Autoriza'
    end
    object lbF_AUTOR: TLabel
      Left = 301
      Top = 37
      Width = 50
      Height = 13
      Caption = 'F. Autoriza'
    end
    object Label2: TLabel
      Left = 457
      Top = 17
      Width = 64
      Height = 13
      Caption = 'Usu. Cancela'
    end
    object Label3: TLabel
      Left = 457
      Top = 37
      Width = 51
      Height = 13
      Caption = 'F. Cancela'
    end
    object edCVE_USUA_ALTA: TEdit
      Left = 50
      Top = 14
      Width = 70
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edFH_ALTA: TEdit
      Left = 50
      Top = 34
      Width = 90
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edCVE_USUA_MODIF: TEdit
      Left = 208
      Top = 14
      Width = 68
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object edFH_MODIF: TEdit
      Left = 208
      Top = 34
      Width = 90
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edCVE_USUA_AUTOR: TEdit
      Left = 365
      Top = 14
      Width = 68
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edF_AUTOR: TEdit
      Left = 365
      Top = 34
      Width = 90
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object edCVE_USUA_CANCELA: TEdit
      Left = 523
      Top = 14
      Width = 68
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
    end
    object edFH_CANCELA: TEdit
      Left = 523
      Top = 34
      Width = 90
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
  end
  object MsgPanel: TPanel
    Left = 0
    Top = 470
    Width = 617
    Height = 27
    TabOrder = 3
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesNuevo = InterForma1AntesNuevo
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
    Left = 450
    Top = 50
  end
  object ilTASA_REFER: TInterLinkit
    Control = edCVE_TAS_REF_NVA
    OnEjecuta = ilTASA_REFEREjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 475
    Top = 254
  end
end
