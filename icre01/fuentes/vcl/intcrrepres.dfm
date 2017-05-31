object WCrRepres: TWCrRepres
  Left = 267
  Top = 162
  Width = 525
  Height = 456
  Caption = 'Información del Representante o Contacto'
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
  object lbID_CREDITO: TLabel
    Left = 8
    Top = 8
    Width = 51
    Height = 13
    Caption = 'Acreditado'
  end
  object Label1: TLabel
    Left = 17
    Top = 39
    Width = 70
    Height = 13
    Caption = 'Representante'
  end
  object Label2: TLabel
    Left = 0
    Top = 75
    Width = 87
    Height = 13
    Caption = 'Correo Electrónico'
  end
  object lbUSUA_ALTA: TLabel
    Left = 172
    Top = 112
    Width = 43
    Height = 13
    Caption = 'Usu. Alta'
  end
  object lbUSUA_MODIF: TLabel
    Left = 152
    Top = 139
    Width = 65
    Height = 13
    Caption = 'Usu. Modifica'
  end
  object lbF_ALTA: TLabel
    Left = 26
    Top = 114
    Width = 45
    Height = 13
    Caption = 'F. de Alta'
  end
  object lbF_MODIF: TLabel
    Left = 19
    Top = 139
    Width = 52
    Height = 13
    Caption = 'F. Modifica'
  end
  object edID_ACREDITADO: TEdit
    Tag = 562
    Left = 66
    Top = 4
    Width = 67
    Height = 21
    HelpContext = 1000
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 10
    TabOrder = 0
    OnExit = edID_ACREDITADOExit
  end
  object edACREDITADO: TEdit
    Left = 164
    Top = 4
    Width = 339
    Height = 21
    HelpContext = 1002
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object edNOMBRE_REPRESENTANTE: TEdit
    Tag = 530
    Left = 165
    Top = 35
    Width = 336
    Height = 21
    HelpContext = 3000
    TabOrder = 4
    OnExit = edNOMBRE_REPRESENTANTEExit
    OnKeyPress = edID_REPRESENTANTEKeyPress
  end
  object edEMail: TEdit
    Tag = 18
    Left = 96
    Top = 72
    Width = 211
    Height = 21
    HelpContext = 4000
    TabOrder = 5
    OnExit = edEMailExit
    OnKeyPress = edID_REPRESENTANTEKeyPress
  end
  object PnDatos: TPanel
    Left = 2
    Top = 400
    Width = 515
    Height = 21
    TabOrder = 8
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
  object edID_REPRESENTANTE: TEdit
    Tag = 562
    Left = 95
    Top = 35
    Width = 63
    Height = 21
    HelpContext = 2000
    TabOrder = 3
    OnExit = edID_REPRESENTANTEExit
  end
  object rgSIT_REPRESENTANTE: TRadioGroup
    Tag = 18
    Left = 336
    Top = 62
    Width = 164
    Height = 38
    HelpContext = 5000
    Caption = 'Activo'
    Columns = 2
    Items.Strings = (
      'ACtivo'
      'INactivo')
    TabOrder = 6
    TabStop = True
    OnExit = rgSIT_REPRESENTANTEExit
  end
  object ChBB_PREDETERMINADO: TCheckBox
    Tag = 18
    Left = 334
    Top = 123
    Width = 168
    Height = 17
    HelpContext = 6000
    Caption = 'Representante Predeterminado'
    TabOrder = 7
    OnClick = ChBB_PREDETERMINADOClick
    OnExit = ChBB_PREDETERMINADOExit
  end
  object Panel1: TPanel
    Left = 0
    Top = 159
    Width = 517
    Height = 241
    Caption = 'Panel1'
    TabOrder = 9
    object Shape1: TShape
      Left = 305
      Top = 27
      Width = 82
      Height = 18
      Brush.Color = clInfoBk
    end
    object Shape4: TShape
      Left = 124
      Top = 27
      Width = 183
      Height = 18
      Brush.Color = clInfoBk
    end
    object Shape3: TShape
      Left = 9
      Top = 27
      Width = 116
      Height = 18
      Brush.Color = clInfoBk
    end
    object Shape5: TShape
      Left = 9
      Top = 10
      Width = 378
      Height = 18
      Brush.Color = clInfoBk
    end
    object Label8: TLabel
      Left = 15
      Top = 30
      Width = 98
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Tipo de Telefono'
      Color = clInfoBk
      ParentColor = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 83
      Top = 14
      Width = 210
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Números telefónicos'
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label10: TLabel
      Left = 141
      Top = 30
      Width = 139
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Número'
      Color = clInfoBk
      ParentColor = False
    end
    object Label3: TLabel
      Left = 313
      Top = 30
      Width = 65
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Extensión'
      Color = clInfoBk
      ParentColor = False
    end
    object Label4: TLabel
      Left = 410
      Top = 72
      Width = 81
      Height = 13
      Caption = 'Tipo de Telefono'
      Visible = False
    end
    object Label5: TLabel
      Left = 394
      Top = 122
      Width = 112
      Height = 13
      Caption = 'Numero Tel. (10 digitos)'
      Visible = False
    end
    object Label6: TLabel
      Left = 427
      Top = 169
      Width = 46
      Height = 13
      Caption = 'Extension'
      Visible = False
    end
    object sgcDatos: TSGCtrl
      Left = 8
      Top = 45
      Width = 379
      Height = 187
      HelpContext = -1
      ShowTab = True
      TabOrder = 1
      TabWidth = 0
      ShowBtnPriorNext = True
      ShowBtnFirst = True
      ShowBtnLast = True
      object btnEliminaTel: TBitBtn
        Left = 302
        Top = 161
        Width = 75
        Height = 22
        Caption = 'Eliminar'
        TabOrder = 3
        OnClick = btnEliminaTelClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object btnAgregaTel: TBitBtn
        Left = 152
        Top = 161
        Width = 75
        Height = 22
        Caption = 'Agregar'
        TabOrder = 2
        OnClick = btnAgregaTelClick
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
      object btnModificaTel: TBitBtn
        Left = 227
        Top = 161
        Width = 75
        Height = 22
        Caption = 'Modificar'
        TabOrder = 4
        OnClick = btnModificaTelClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
      end
    end
    object bbTIPO_TELEFONO: TBitBtn
      Tag = 18
      Left = 593
      Top = 33
      Width = 22
      Height = 20
      HelpContext = 10
      TabOrder = 2
      Visible = False
      OnClick = bbTIPO_TELEFONOClick
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
    object edTIPO_TELEFONO: TEdit
      Left = 520
      Top = 32
      Width = 69
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 3
      Visible = False
    end
    object edNUM_TELEFONO: TEdit
      Left = 395
      Top = 138
      Width = 110
      Height = 21
      TabOrder = 4
      Visible = False
    end
    object edEXTENSION: TEdit
      Left = 395
      Top = 186
      Width = 110
      Height = 21
      TabOrder = 5
      Visible = False
    end
    object CBTipoTel: TComboBox
      Left = 395
      Top = 88
      Width = 110
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 6
      Visible = False
      OnChange = CBTipoTelChange
    end
    object Memo1: TMemo
      Left = 403
      Top = 31
      Width = 94
      Height = 28
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      Color = clBtnFace
      Lines.Strings = (
        '   Valores nuevos'
        '(Agregar/Modificar)')
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 7
      Visible = False
    end
    object edInt: TEdit
      Left = 466
      Top = 52
      Width = 36
      Height = 21
      TabStop = False
      TabOrder = 0
      Visible = False
    end
  end
  object bbId_Acreditado: TBitBtn
    Tag = 50
    Left = 137
    Top = 4
    Width = 21
    Height = 21
    HelpContext = 1001
    TabOrder = 1
    OnClick = bbId_AcreditadoClick
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
  object edCVE_USUA_ALTA: TEdit
    Left = 224
    Top = 104
    Width = 70
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
    OnExit = edCVE_USUA_ALTAExit
  end
  object edF_ALTA: TEdit
    Left = 78
    Top = 106
    Width = 70
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 11
    OnExit = edF_ALTAExit
  end
  object edF_MODIF: TEdit
    Left = 78
    Top = 131
    Width = 69
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 12
    OnExit = edF_MODIFExit
  end
  object edCVE_USUA_MODIF: TEdit
    Left = 225
    Top = 131
    Width = 68
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 13
    OnExit = edCVE_USUA_MODIFExit
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnBuscar = InterForma1Buscar
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
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    OnDespuesShow = InterForma1DespuesShow
    Left = 298
    Top = 26
  end
  object ilID_ACREDITADO: TInterLinkit
    Control = edID_ACREDITADO
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 195
    Top = 4
  end
  object illTIPO_TELEFONO: TInterLinkit
    TipoReader = trTexto
    CharCase = ecNormal
    Left = 375
    Top = 108
  end
  object ilID_REPRESENTANTE: TInterLinkit
    Control = edID_REPRESENTANTE
    TipoReader = trTexto
    CharCase = ecNormal
    Left = 170
    Top = 37
  end
end
