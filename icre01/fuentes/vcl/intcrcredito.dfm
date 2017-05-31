object WCrCredito: TWCrCredito
  Left = 376
  Top = 59
  Width = 613
  Height = 638
  Caption = 'Alta de Solicitudes de Disposición'
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
    Left = 518
    Top = 32
    Width = 74
    Height = 13
    Caption = 'No. Disposición'
  end
  object lbID_CONTRATO: TLabel
    Left = 3
    Top = 49
    Width = 94
    Height = 13
    Caption = 'Autorización / Prod.'
  end
  object lbSITUACION: TLabel
    Left = 405
    Top = 486
    Width = 58
    Height = 13
    Caption = 'Situación:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbSIT_CREDITO: TLabel
    Tag = 18
    Left = 474
    Top = 486
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
  object lbCVE_LIQUIDACION: TLabel
    Left = 2
    Top = 69
    Width = 55
    Height = 13
    Caption = 'Tipo Liquid.'
  end
  object lbID_PROM_ADM: TLabel
    Left = 298
    Top = 71
    Width = 63
    Height = 13
    Caption = 'Prom Admon.'
  end
  object Label22: TLabel
    Left = 2
    Top = 92
    Width = 37
    Height = 13
    Caption = 'F. Inicio'
  end
  object lbDIAS_PLAZO: TLabel
    Left = 2
    Top = 113
    Width = 83
    Height = 13
    Caption = 'Plazo Disp. (días)'
  end
  object Label26: TLabel
    Left = 2
    Top = 134
    Width = 73
    Height = 13
    Caption = 'F. Vencimiento '
  end
  object lbIMP_CREDITO: TLabel
    Left = 218
    Top = 92
    Width = 77
    Height = 13
    Caption = 'Imp. Disposición'
  end
  object Label18: TLabel
    Left = 218
    Top = 113
    Width = 71
    Height = 13
    Caption = 'Imp. Ministrado'
  end
  object Label24: TLabel
    Left = 218
    Top = 134
    Width = 72
    Height = 13
    Caption = 'Imp. Disponible'
  end
  object Label12: TLabel
    Left = 401
    Top = 92
    Width = 83
    Height = 13
    Caption = 'Disponible Acred.'
  end
  object Label2: TLabel
    Left = 401
    Top = 113
    Width = 94
    Height = 13
    Caption = 'Disponible Gpo Acr.'
  end
  object Label1: TLabel
    Left = 401
    Top = 134
    Width = 71
    Height = 13
    Caption = 'Disponible Aut.'
  end
  object Bevel1: TBevel
    Left = 214
    Top = 86
    Width = 2
    Height = 87
  end
  object Bevel4: TBevel
    Left = 397
    Top = 83
    Width = 2
    Height = 92
  end
  object Bevel3: TBevel
    Left = 2
    Top = 86
    Width = 591
    Height = 2
  end
  object Bevel2: TBevel
    Left = 2
    Top = 173
    Width = 591
    Height = 2
  end
  object lbF_LIQUIDACION: TLabel
    Left = 2
    Top = 155
    Width = 66
    Height = 13
    Caption = 'F. Liquidación'
  end
  object lbIMP_DISPUESTO: TLabel
    Left = 218
    Top = 155
    Width = 70
    Height = 13
    Caption = 'Imp. Dispuesto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbF_TRASPASO_VENC: TLabel
    Left = 401
    Top = 155
    Width = 78
    Height = 13
    Caption = 'F. Traspaso Vdo'
  end
  object Label27: TLabel
    Left = 2
    Top = 203
    Width = 53
    Height = 13
    Caption = 'Comisión %'
  end
  object Label28: TLabel
    Left = 220
    Top = 203
    Width = 62
    Height = 13
    Caption = 'Imp Comisión'
  end
  object lbCVE_CALIF_CRE: TLabel
    Left = 220
    Top = 245
    Width = 50
    Height = 13
    Caption = 'Calif. Disp.'
  end
  object Label29: TLabel
    Left = 346
    Top = 245
    Width = 58
    Height = 13
    Caption = 'Comentarios'
  end
  object Label3: TLabel
    Left = 220
    Top = 224
    Width = 68
    Height = 13
    Caption = 'ID Crédito Ext.'
  end
  object Label11: TLabel
    Left = 2
    Top = 224
    Width = 71
    Height = 13
    Caption = 'No Control Ext.'
  end
  object lbCVE_CALCULO: TLabel
    Left = 3
    Top = 269
    Width = 96
    Height = 13
    Caption = 'Cálculo de Intereses'
  end
  object lbFACT_MORAS: TLabel
    Left = 426
    Top = 269
    Width = 62
    Height = 13
    Caption = 'Factor Moras'
  end
  object lbCVE_TASA_REFER: TLabel
    Left = 3
    Top = 289
    Width = 97
    Height = 13
    Caption = 'Tasa de Referencia '
  end
  object Label6: TLabel
    Left = 3
    Top = 312
    Width = 41
    Height = 13
    Caption = 'Tasa (%)'
  end
  object lbOPERADOR_STASA: TLabel
    Left = 213
    Top = 310
    Width = 57
    Height = 13
    Caption = 'Ope. STasa'
  end
  object Label9: TLabel
    Left = 323
    Top = 310
    Width = 48
    Height = 13
    Caption = 'STasa (%)'
  end
  object lbTASA_CREDITO: TLabel
    Left = 426
    Top = 309
    Width = 68
    Height = 13
    Caption = 'Tasa Aplicada'
  end
  object Label15: TLabel
    Left = 4
    Top = 328
    Width = 102
    Height = 13
    Caption = 'U. Tiempo Rev. Tasa'
    WordWrap = True
  end
  object Label16: TLabel
    Left = 213
    Top = 329
    Width = 62
    Height = 13
    Caption = 'No Unidades'
  end
  object Label17: TLabel
    Left = 323
    Top = 328
    Width = 44
    Height = 13
    Caption = 'Día Rev.'
  end
  object Label21: TLabel
    Left = 427
    Top = 328
    Width = 56
    Height = 13
    Caption = 'F Prox Rev.'
  end
  object Bevel5: TBevel
    Left = 2
    Top = 263
    Width = 591
    Height = 2
  end
  object lbCVE_AMORTIZACION: TLabel
    Left = 3
    Top = 349
    Width = 99
    Height = 13
    Caption = 'Tipo de Amortización'
  end
  object Label4: TLabel
    Left = 4
    Top = 369
    Width = 95
    Height = 13
    Caption = 'U. Tiempo Amortiza.'
  end
  object Label19: TLabel
    Left = 213
    Top = 369
    Width = 62
    Height = 13
    Caption = 'No Unidades'
  end
  object Label5: TLabel
    Left = 321
    Top = 369
    Width = 46
    Height = 13
    Caption = 'Día Pago'
  end
  object Label13: TLabel
    Left = 426
    Top = 369
    Width = 66
    Height = 13
    Caption = 'F Primer Pago'
  end
  object lbCVE_PAG_INTERES: TLabel
    Left = 3
    Top = 389
    Width = 86
    Height = 13
    Caption = 'Pago de Intereses'
  end
  object Label7: TLabel
    Left = 4
    Top = 410
    Width = 84
    Height = 13
    Caption = 'U. Tiempo Interés'
  end
  object Label20: TLabel
    Left = 213
    Top = 410
    Width = 62
    Height = 13
    Caption = 'No Unidades'
  end
  object Label8: TLabel
    Left = 321
    Top = 410
    Width = 46
    Height = 13
    Caption = 'Día Pago'
  end
  object Label14: TLabel
    Left = 426
    Top = 410
    Width = 66
    Height = 13
    Caption = 'F Primer Pago'
  end
  object Label31: TLabel
    Left = 401
    Top = 203
    Width = 46
    Height = 13
    Caption = 'Operativa'
  end
  object Label10: TLabel
    Left = 426
    Top = 289
    Width = 48
    Height = 13
    Caption = 'Tipo Tasa'
  end
  object lbUSUA_ALTA: TLabel
    Left = 0
    Top = 474
    Width = 43
    Height = 13
    Caption = 'Usu. Alta'
  end
  object lbF_ALTA: TLabel
    Left = 0
    Top = 494
    Width = 45
    Height = 13
    Caption = 'F. de Alta'
  end
  object lbUSUA_MODIF: TLabel
    Left = 125
    Top = 474
    Width = 65
    Height = 13
    Caption = 'Usu. Modifica'
  end
  object lbF_MODIF: TLabel
    Left = 125
    Top = 494
    Width = 52
    Height = 13
    Caption = 'F. Modifica'
  end
  object lbUSUA_AUTOR: TLabel
    Left = 267
    Top = 474
    Width = 63
    Height = 13
    Caption = 'Usu. Autoriza'
  end
  object lbF_AUTOR: TLabel
    Left = 267
    Top = 494
    Width = 50
    Height = 13
    Caption = 'F. Autoriza'
  end
  object lbTIPO_CREDITO: TLabel
    Left = 405
    Top = 471
    Width = 92
    Height = 13
    Caption = 'TIPO_CREDITO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label23: TLabel
    Left = 401
    Top = 224
    Width = 64
    Height = 13
    Caption = '% Req. Capit.'
  end
  object Label25: TLabel
    Left = 2
    Top = 245
    Width = 64
    Height = 13
    Caption = 'Fol. Adhesión'
  end
  object Label30: TLabel
    Left = 426
    Top = 430
    Width = 62
    Height = 13
    Caption = 'F. Cred Rest.'
  end
  object lbCVE_PER_JUR_REG: TLabel
    Left = 4
    Top = 430
    Width = 78
    Height = 13
    Caption = 'Tipo Liquidación'
  end
  object Label32: TLabel
    Left = 556
    Top = 508
    Width = 37
    Height = 7
    Caption = 'V20160408'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -7
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lb_Credescto: TLabel
    Left = 405
    Top = 501
    Width = 127
    Height = 13
    Caption = 'Existen Redescuentos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object lbNoSolDisp: TLabel
    Left = 519
    Top = -1
    Width = 71
    Height = 13
    Caption = 'No. Sol. Dispo.'
  end
  object Label33: TLabel
    Left = 4
    Top = 449
    Width = 69
    Height = 13
    Caption = 'Tipo Garantía:'
  end
  object LbF_FIN_PERGRA_FA: TLabel
    Left = 250
    Top = 179
    Width = 113
    Height = 13
    Caption = 'F. Fin Per. de Gracia FA'
  end
  object edID_CREDITO: TEdit
    Left = 520
    Top = 45
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    OnChange = edID_CREDITOChange
  end
  object icpCONTRATO: TInterCtoPanel
    Left = 0
    Top = -1
    Width = 518
    Height = 45
    Hint = 'Información del Contrato'
    Lenguaje = 0
    ShowLenguaje = False
    ShowEnviarEMail = False
  end
  object MsgPanel: TPanel
    Left = 2
    Top = 560
    Width = 590
    Height = 20
    TabOrder = 65
  end
  object PnDatos: TPanel
    Left = 1
    Top = 580
    Width = 591
    Height = 18
    TabOrder = 66
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
      Left = 280
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
      Left = 280
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
      Left = 75
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
      Left = 344
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
      Left = 344
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
      Left = 75
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
  object iedID_CONTRATO: TInterEdit
    Tag = 562
    Left = 111
    Top = 45
    Width = 76
    Height = 21
    HelpContext = 1001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trContrato
    OnExit = iedID_CONTRATOExit
    MaxLength = 12
    TabOrder = 1
    PopupMenu = pmAcreditado
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object btCONTRATO: TBitBtn
    Tag = 50
    Left = 189
    Top = 45
    Width = 22
    Height = 20
    HelpContext = 1002
    PopupMenu = pmAcreditado
    TabOrder = 2
    OnClick = btCONTRATOClick
    OnExit = iedID_CONTRATOExit
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
  object edCVE_PRODUCTO: TEdit
    Left = 212
    Top = 45
    Width = 76
    Height = 21
    TabStop = False
    Color = clBtnFace
    PopupMenu = pmAcreditado
    ReadOnly = True
    TabOrder = 68
  end
  object edDESC_PRODUCTO: TEdit
    Left = 288
    Top = 45
    Width = 228
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 69
  end
  object edCVE_LIQUIDACION: TEdit
    Tag = 530
    Left = 111
    Top = 65
    Width = 50
    Height = 21
    HelpContext = 2001
    CharCase = ecUpperCase
    TabOrder = 3
    OnExit = edCVE_LIQUIDACIONExit
  end
  object btTIPO_LIQ: TBitBtn
    Tag = 18
    Left = 165
    Top = 65
    Width = 22
    Height = 21
    HelpContext = 2002
    TabOrder = 4
    OnClick = btTIPO_LIQClick
    OnExit = edCVE_LIQUIDACIONExit
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
  object edDESC_TIPO_LIQ: TEdit
    Left = 188
    Top = 65
    Width = 102
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 70
  end
  object edID_PROM_ADM: TEdit
    Tag = 512
    Left = 362
    Top = 66
    Width = 42
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 59
  end
  object edNOMBRE_PROM_ADM: TEdit
    Left = 404
    Top = 66
    Width = 189
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 71
  end
  object edF_INICIO: TEdit
    Tag = 18
    Left = 111
    Top = 88
    Width = 76
    Height = 21
    HelpContext = 4001
    Color = clWhite
    TabOrder = 5
    OnExit = edF_INICIOExit
  end
  object edDIAS_PLAZO: TInterEdit
    Tag = 18
    Left = 111
    Top = 109
    Width = 76
    Height = 21
    HelpContext = 4101
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    OnExit = edDIAS_PLAZOExit
    DisplayMask = '####0'
    MaxLength = 5
    TabOrder = 7
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edF_VENCIMIENTO: TEdit
    Tag = 18
    Left = 111
    Top = 130
    Width = 76
    Height = 21
    HelpContext = 4201
    Color = clWhite
    ReadOnly = True
    TabOrder = 9
    OnExit = edF_VENCIMIENTOExit
  end
  object dtpF_INICIO: TInterDateTimePicker
    Tag = 18
    Left = 189
    Top = 88
    Width = 20
    Height = 21
    HelpContext = 4002
    CalAlignment = dtaLeft
    Date = 37777.7691627546
    Time = 37777.7691627546
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 6
    OnExit = edF_INICIOExit
    Edit = edF_INICIO
    Formato = dfDate
  end
  object btDIASPLAZO: TBitBtn
    Tag = 18
    Left = 189
    Top = 109
    Width = 20
    Height = 20
    HelpContext = 4102
    TabOrder = 8
    TabStop = False
    OnClick = btDIASPLAZOClick
    OnExit = edDIAS_PLAZOExit
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
      73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
      0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
      0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
      0333337F777777737F333308888888880333337F333333337F33330888888888
      03333373FFFFFFFF733333700000000073333337777777773333}
    NumGlyphs = 2
  end
  object dtpF_VENCIMIENTO: TInterDateTimePicker
    Tag = 18
    Left = 189
    Top = 130
    Width = 20
    Height = 21
    HelpContext = 4202
    CalAlignment = dtaLeft
    Date = 37777.7691627546
    Time = 37777.7691627546
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 10
    OnExit = edF_VENCIMIENTOExit
    Edit = edF_VENCIMIENTO
    Formato = dfDate
  end
  object edIMP_CREDITO: TInterEdit
    Tag = 18
    Left = 300
    Top = 88
    Width = 95
    Height = 21
    HelpContext = 4401
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edIMP_CREDITOExit
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    TabOrder = 11
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edIMP_MINISTRADO: TInterEdit
    Left = 300
    Top = 109
    Width = 95
    Height = 21
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    Color = clBtnFace
    TabOrder = 72
    ReadOnly = True
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edIMP_DISPONIBLE: TInterEdit
    Left = 300
    Top = 130
    Width = 95
    Height = 21
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 73
    ReadOnly = True
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object iedDISPONIBLE_ACRED: TInterEdit
    Left = 498
    Top = 88
    Width = 95
    Height = 21
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 18
    Color = clBtnFace
    TabOrder = 74
    ReadOnly = True
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object iedIMP_DISP_GPO: TInterEdit
    Left = 498
    Top = 109
    Width = 95
    Height = 21
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 18
    Color = clBtnFace
    TabOrder = 75
    ReadOnly = True
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object iedDISPONIBLE_AUT: TInterEdit
    Left = 498
    Top = 130
    Width = 95
    Height = 21
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 18
    Color = clBtnFace
    TabOrder = 76
    ReadOnly = True
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edF_LIQUIDACION: TEdit
    Left = 111
    Top = 151
    Width = 98
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 77
  end
  object edIMP_DISPUESTO: TInterEdit
    Left = 300
    Top = 151
    Width = 95
    Height = 21
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,###,##0.00'
    MaxLength = 18
    Color = clBtnFace
    TabOrder = 78
    ReadOnly = True
    UseReType = False
    UseSep = False
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edF_TRASPASO_VENC: TEdit
    Left = 498
    Top = 151
    Width = 95
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 79
  end
  object chB_APLICA_IVA: TCheckBox
    Tag = 18
    Left = 2
    Top = 178
    Width = 81
    Height = 17
    HelpContext = 5000
    Alignment = taLeftJustify
    Caption = 'Aplica IVA'
    TabOrder = 12
    OnExit = chB_APLICA_IVAExit
  end
  object chB_FINANC_ADIC: TCheckBox
    Tag = 18
    Left = 95
    Top = 178
    Width = 140
    Height = 17
    HelpContext = 5050
    Alignment = taLeftJustify
    Caption = 'Aplica Financ. Adicional'
    TabOrder = 13
    OnClick = chB_FINANC_ADICClick
    OnExit = chB_FINANC_ADICExit
  end
  object chB_APLICA_COM: TCheckBox
    Tag = 18
    Left = 476
    Top = 178
    Width = 118
    Height = 17
    HelpContext = 5100
    Alignment = taLeftJustify
    Caption = 'Aplica Comis. x Disp.'
    TabOrder = 16
    OnClick = chB_APLICA_COMClick
    OnEnter = chB_APLICA_COMEnter
    OnExit = chB_APLICA_COMExit
  end
  object edPCT_COMISION: TInterEdit
    Tag = 18
    Left = 110
    Top = 199
    Width = 96
    Height = 21
    HelpContext = 5200
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_COMISIONExit
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    TabOrder = 17
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edIMP_COMISION: TInterEdit
    Left = 300
    Top = 199
    Width = 95
    Height = 21
    HelpContext = 5201
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 18
    Color = clBtnFace
    TabOrder = 80
    ReadOnly = True
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edCVE_CALIF_CRE: TEdit
    Tag = 18
    Left = 300
    Top = 241
    Width = 41
    Height = 21
    HelpContext = 5800
    MaxLength = 4
    TabOrder = 22
    OnExit = edCVE_CALIF_CREExit
  end
  object meTX_COMENTARIO: TMemo
    Tag = 18
    Left = 414
    Top = 241
    Width = 155
    Height = 21
    HelpContext = 5900
    MaxLength = 299
    TabOrder = 23
    OnExit = meTX_COMENTARIOExit
  end
  object edID_CRED_EXTERNO: TInterEdit
    Tag = 18
    Left = 300
    Top = 220
    Width = 95
    Height = 21
    HelpContext = 5500
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    OnExit = edID_CRED_EXTERNOExit
    MaxLength = 19
    Color = clWhite
    TabOrder = 20
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edID_CONTROL_EXT: TInterEdit
    Tag = 18
    Left = 110
    Top = 220
    Width = 95
    Height = 21
    HelpContext = 5400
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    OnExit = edID_CONTROL_EXTExit
    MaxLength = 29
    Color = clWhite
    TabOrder = 19
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edCVE_CALCULO: TEdit
    Tag = 530
    Left = 110
    Top = 265
    Width = 72
    Height = 21
    HelpContext = 6001
    CharCase = ecUpperCase
    TabOrder = 25
    OnExit = edCVE_CALCULOExit
  end
  object btCALC_INT: TBitBtn
    Tag = 18
    Left = 183
    Top = 265
    Width = 22
    Height = 21
    HelpContext = 6002
    TabOrder = 26
    OnClick = btCALC_INTClick
    OnExit = edCVE_CALCULOExit
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
  object edDESC_CALC_INT: TEdit
    Left = 205
    Top = 265
    Width = 219
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 81
  end
  object edFACT_MORAS: TInterEdit
    Tag = 18
    Left = 503
    Top = 265
    Width = 90
    Height = 21
    HelpContext = 6101
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edFACT_MORASExit
    DisplayMask = '#0.0000'
    MaxLength = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 27
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edCVE_TASA_REFER: TEdit
    Tag = 530
    Left = 110
    Top = 285
    Width = 72
    Height = 21
    HelpContext = 6201
    CharCase = ecUpperCase
    TabOrder = 28
    OnExit = btTASA_REFERExit
  end
  object btTASA_REFER: TBitBtn
    Tag = 18
    Left = 183
    Top = 286
    Width = 22
    Height = 20
    HelpContext = 6202
    TabOrder = 29
    OnClick = btTASA_REFERClick
    OnExit = btTASA_REFERExit
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
  object edDESC_TASA_REFER: TEdit
    Left = 205
    Top = 285
    Width = 219
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 82
  end
  object edVALOR_TASA: TInterEdit
    Left = 110
    Top = 305
    Width = 70
    Height = 21
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edTASA_CREDITOExit
    DisplayMask = '##0.0000'
    MaxLength = 12
    Color = clBtnFace
    TabOrder = 83
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object cbOPERADOR_STASA: TEdit
    Tag = 530
    Left = 281
    Top = 305
    Width = 38
    Height = 21
    HelpContext = 6401
    CharCase = ecUpperCase
    MaxLength = 1
    TabOrder = 31
    OnExit = cbOPERADOR_STASAExit
    OnKeyPress = cbOPERADOR_STASAKeyPress
  end
  object edSOBRETASA: TInterEdit
    Tag = 18
    Left = 374
    Top = 305
    Width = 49
    Height = 21
    HelpContext = 6501
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edSOBRETASAExit
    DisplayMask = '###0.0000'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 32
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edTASA_CREDITO: TInterEdit
    Tag = 18
    Left = 503
    Top = 305
    Width = 90
    Height = 20
    HelpContext = 6601
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edTASA_CREDITOExit
    DisplayMask = '##0.0000'
    MaxLength = 12
    TabOrder = 33
    PopupMenu = pmTASAS
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object cbUNIDAD_TIEMPO_RE: TEdit
    Left = 110
    Top = 325
    Width = 72
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 64
  end
  object bbUNIDAD_TIEMPO_RE: TBitBtn
    Tag = 18
    Left = 183
    Top = 325
    Width = 22
    Height = 21
    HelpContext = 6701
    TabOrder = 34
    OnClick = bbUNIDAD_TIEMPO_REClick
    OnExit = bbUNIDAD_TIEMPO_REExit
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
  object edNUM_UNIDADES_RE: TInterEdit
    Tag = 18
    Left = 281
    Top = 325
    Width = 38
    Height = 21
    HelpContext = 6801
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    OnExit = edNUM_UNIDADES_REExit
    DisplayMask = '####0'
    MaxLength = 5
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 35
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object cbDIA_REVISION: TEdit
    Tag = 530
    Left = 374
    Top = 325
    Width = 49
    Height = 21
    HelpContext = 6901
    CharCase = ecUpperCase
    MaxLength = 2
    TabOrder = 36
    Text = '31'
    OnExit = cbDIA_REVISIONExit
    OnKeyPress = cbDIA_REVISIONKeyPress
  end
  object edF_PROX_REVISION: TEdit
    Tag = 18
    Left = 503
    Top = 324
    Width = 67
    Height = 21
    HelpContext = 7001
    Color = clWhite
    ReadOnly = True
    TabOrder = 37
    OnExit = edF_PROX_REVISIONExit
  end
  object dtpF_PROX_REVISION: TInterDateTimePicker
    Tag = 18
    Left = 571
    Top = 324
    Width = 22
    Height = 21
    HelpContext = 7002
    CalAlignment = dtaLeft
    Date = 37777.7691627546
    Time = 37777.7691627546
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 38
    OnExit = edF_PROX_REVISIONExit
    Edit = edF_PROX_REVISION
    Formato = dfDate
  end
  object edCVE_AMORTIZACION: TEdit
    Tag = 530
    Left = 110
    Top = 345
    Width = 72
    Height = 21
    HelpContext = 7101
    CharCase = ecUpperCase
    TabOrder = 39
    OnExit = edCVE_AMORTIZACIONExit
  end
  object btTIPO_AMORT: TBitBtn
    Tag = 18
    Left = 183
    Top = 346
    Width = 22
    Height = 20
    HelpContext = 7102
    TabOrder = 40
    OnClick = btTIPO_AMORTClick
    OnExit = edCVE_AMORTIZACIONExit
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
  object edDESC_TIPO_AMORT: TEdit
    Left = 205
    Top = 345
    Width = 388
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 84
  end
  object cbUNIDAD_TIEMPO_CP: TEdit
    Left = 110
    Top = 365
    Width = 72
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 85
  end
  object edNUM_UNIDADES_CP: TInterEdit
    Tag = 18
    Left = 280
    Top = 366
    Width = 38
    Height = 21
    HelpContext = 7301
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    OnExit = edNUM_UNIDADES_CPExit
    DisplayMask = '####0'
    MaxLength = 5
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 42
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object cbDIA_PAGO_CAP: TEdit
    Tag = 530
    Left = 373
    Top = 365
    Width = 49
    Height = 21
    HelpContext = 7401
    CharCase = ecUpperCase
    MaxLength = 2
    TabOrder = 43
    Text = '31'
    OnEnter = cbDIA_PAGO_CAPEnter
    OnExit = cbDIA_PAGO_CAPExit
    OnKeyPress = cbDIA_REVISIONKeyPress
  end
  object edF_INI_PAG_CAP: TEdit
    Tag = 18
    Left = 503
    Top = 365
    Width = 67
    Height = 21
    HelpContext = 7501
    Color = clWhite
    ReadOnly = True
    TabOrder = 44
    OnExit = edF_INI_PAG_CAPExit
  end
  object edCVE_PAG_INTERES: TEdit
    Tag = 530
    Left = 110
    Top = 385
    Width = 72
    Height = 21
    HelpContext = 8001
    CharCase = ecUpperCase
    TabOrder = 46
    OnExit = edCVE_PAG_INTERESExit
  end
  object btPAGO_INT: TBitBtn
    Tag = 18
    Left = 183
    Top = 386
    Width = 22
    Height = 20
    HelpContext = 8002
    TabOrder = 47
    OnClick = btPAGO_INTClick
    OnExit = edCVE_PAG_INTERESExit
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
  object edDESC_PAGO_INT: TEdit
    Left = 205
    Top = 385
    Width = 388
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 86
  end
  object cbUNIDAD_TIEMPO_IN: TEdit
    Left = 110
    Top = 405
    Width = 72
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 87
  end
  object bbUNIDAD_TIEMPO_IN: TBitBtn
    Tag = 18
    Left = 183
    Top = 406
    Width = 22
    Height = 20
    HelpContext = 8101
    TabOrder = 48
    OnClick = bbUNIDAD_TIEMPO_INClick
    OnExit = bbUNIDAD_TIEMPO_INExit
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
  object edNUM_UNIDADES_IN: TInterEdit
    Tag = 18
    Left = 280
    Top = 405
    Width = 38
    Height = 21
    HelpContext = 8201
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    OnExit = edNUM_UNIDADES_INExit
    DisplayMask = '####0'
    MaxLength = 5
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 49
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object cbDIA_PAGO_INT: TEdit
    Tag = 530
    Left = 373
    Top = 405
    Width = 49
    Height = 21
    HelpContext = 8301
    CharCase = ecUpperCase
    MaxLength = 2
    TabOrder = 50
    Text = '31'
    OnEnter = cbDIA_PAGO_INTEnter
    OnExit = cbDIA_PAGO_INTExit
    OnKeyPress = cbDIA_REVISIONKeyPress
  end
  object edF_INI_PAG_INT: TEdit
    Tag = 18
    Left = 503
    Top = 405
    Width = 67
    Height = 21
    HelpContext = 8401
    Color = clWhite
    ReadOnly = True
    TabOrder = 51
    OnExit = edF_INI_PAG_INTExit
  end
  object dtpF_INI_PAG_INT: TInterDateTimePicker
    Tag = 18
    Left = 571
    Top = 405
    Width = 22
    Height = 21
    HelpContext = 8402
    CalAlignment = dtaLeft
    Date = 37777.7691627546
    Time = 37777.7691627546
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 52
    OnExit = edF_INI_PAG_INTExit
    Edit = edF_INI_PAG_INT
    Formato = dfDate
  end
  object dtpF_INI_PAG_CAP: TInterDateTimePicker
    Tag = 18
    Left = 571
    Top = 365
    Width = 22
    Height = 21
    HelpContext = 7502
    CalAlignment = dtaLeft
    Date = 37777.7691627546
    Time = 37777.7691627546
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 45
    OnExit = edF_INI_PAG_CAPExit
    Edit = edF_INI_PAG_CAP
    Formato = dfDate
  end
  object btCVE_OPERATIVA: TBitBtn
    Tag = 18
    Left = 472
    Top = 199
    Width = 22
    Height = 21
    HelpContext = 5300
    PopupMenu = pmOperativa
    TabOrder = 18
    OnClick = btCVE_OPERATIVAClick
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
  object edNOM_CVE_OPERATIVA: TEdit
    Left = 496
    Top = 199
    Width = 97
    Height = 21
    TabStop = False
    Color = clBtnFace
    PopupMenu = pmOperativa
    ReadOnly = True
    TabOrder = 88
  end
  object cbTIPO_TASA: TComboBox
    Tag = 18
    Left = 503
    Top = 285
    Width = 91
    Height = 21
    HelpContext = 6301
    ItemHeight = 13
    TabOrder = 30
    OnExit = cbTIPO_TASAExit
    Items.Strings = (
      'FIJA'
      'VARIABLE')
  end
  object ControlBar1: TControlBar
    Left = -1
    Top = 514
    Width = 414
    Height = 23
    BevelEdges = [beLeft, beTop]
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelKind = bkSoft
    TabOrder = 89
    object ToolBar1: TToolBar
      Left = 15
      Top = 2
      Width = 376
      Height = 19
      Align = alNone
      AutoSize = True
      ButtonHeight = 19
      ButtonWidth = 94
      Caption = 'ToolBar1'
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      List = True
      ShowCaptions = True
      TabOrder = 0
      Transparent = True
      Wrapable = False
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Caption = 'Disposición'
        Grouped = True
        MenuItem = dispo1
      end
      object ToolButton2: TToolButton
        Left = 94
        Top = 0
        Caption = 'Agronegocios'
        Grouped = True
        MenuItem = Agronegocios1
      end
      object ToolButton3: TToolButton
        Left = 188
        Top = 0
        Caption = 'Redescuento'
        Grouped = True
        MenuItem = Redescuento1
      end
      object ToolButton4: TToolButton
        Left = 282
        Top = 0
        Caption = 'Oper. Eventuales'
        Grouped = True
        MenuItem = RenovReest1
      end
    end
  end
  object btCANCELA: TBitBtn
    Left = 503
    Top = 537
    Width = 89
    Height = 20
    Caption = 'Cancelación'
    TabOrder = 62
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
  object BitBtn1: TBitBtn
    Left = 414
    Top = 516
    Width = 178
    Height = 20
    Caption = 'Elementos de Disposición'
    TabOrder = 60
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
      55555575555555775F55509999999901055557F55555557F75F5001111111101
      105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
      01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
      8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
      0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
      0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
      05555555575FF777755555555500055555555555557775555555}
    NumGlyphs = 2
  end
  object edCVE_USUA_ALTA: TEdit
    Left = 52
    Top = 471
    Width = 70
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 90
  end
  object edF_ALTA: TEdit
    Left = 52
    Top = 491
    Width = 70
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 91
  end
  object edCVE_USUA_MODIF: TEdit
    Left = 192
    Top = 471
    Width = 68
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 92
  end
  object edF_MODIF: TEdit
    Left = 192
    Top = 491
    Width = 68
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 93
  end
  object edCVE_USUA_AUTOR: TEdit
    Left = 331
    Top = 471
    Width = 68
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 94
  end
  object edF_AUTOR: TEdit
    Left = 331
    Top = 491
    Width = 68
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 95
  end
  object edID_CRE_RENUEVA: TEdit
    Left = 64
    Top = 65
    Width = 9
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 96
    Visible = False
  end
  object edID_CRE_RENOVADO: TEdit
    Left = 96
    Top = 65
    Width = 12
    Height = 21
    TabStop = False
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 97
    Visible = False
  end
  object btAUTORIZA: TBitBtn
    Left = 416
    Top = 537
    Width = 88
    Height = 20
    Caption = 'Autorización'
    TabOrder = 61
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
  object edCVE_GPO_CAPITALIZ: TEdit
    Left = 496
    Top = 220
    Width = 97
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 63
  end
  object btTX_XOMENTARIOS: TBitBtn
    Tag = 17
    Left = 571
    Top = 241
    Width = 22
    Height = 21
    HelpContext = 5901
    TabOrder = 24
    OnClick = btTX_XOMENTARIOSClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
      0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
      0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
      0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
      0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
      0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
      5555557FFFFF7755555555500000005555555577777775555555555555555555
      5555555555555555555555555555555555555555555555555555}
    NumGlyphs = 2
  end
  object edNUM_FOL_FIDEICOM: TInterEdit
    Tag = 18
    Left = 110
    Top = 241
    Width = 95
    Height = 21
    HelpContext = 5400
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    OnExit = edNUM_FOL_FIDEICOMExit
    MaxLength = 29
    Color = clWhite
    TabOrder = 21
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edPCT_CAPITALIZA: TEdit
    Left = 472
    Top = 220
    Width = 24
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 98
  end
  object bbUNIDAD_TIEMPO_CP: TBitBtn
    Tag = 18
    Left = 183
    Top = 367
    Width = 22
    Height = 20
    HelpContext = 7201
    TabOrder = 41
    OnClick = bbUNIDAD_TIEMPO_CPClick
    OnExit = bbUNIDAD_TIEMPO_CPExit
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
  object edF_RESTRINGIDO: TEdit
    Tag = 18
    Left = 503
    Top = 426
    Width = 68
    Height = 21
    HelpContext = 8601
    TabOrder = 55
    OnExit = edF_RESTRINGIDOExit
  end
  object dtpF_RESTRINGIDO: TInterDateTimePicker
    Tag = 18
    Left = 572
    Top = 426
    Width = 21
    Height = 21
    HelpContext = 8602
    CalAlignment = dtaLeft
    Date = 37777.7691627546
    Time = 37777.7691627546
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 56
    TabStop = False
    OnExit = edF_RESTRINGIDOExit
    Edit = edF_RESTRINGIDO
    Formato = dfDate
  end
  object edCVE_TIPO_BAJA: TEdit
    Tag = 530
    Left = 110
    Top = 426
    Width = 73
    Height = 21
    HelpContext = 8501
    TabOrder = 53
    OnExit = edCVE_TIPO_BAJAExit
  end
  object btCVE_TIPO_BAJA: TBitBtn
    Tag = 18
    Left = 183
    Top = 426
    Width = 21
    Height = 20
    HelpContext = 8502
    TabOrder = 54
    OnClick = btCVE_TIPO_BAJAClick
    OnExit = edCVE_TIPO_BAJAExit
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
  object edDESC_TIPO_BAJA: TEdit
    Left = 204
    Top = 426
    Width = 218
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 99
  end
  object edNoSolDisp: TEdit
    Left = 520
    Top = 11
    Width = 73
    Height = 21
    TabStop = False
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 100
    Text = '0'
  end
  object edTIPO_RENUEVA: TEdit
    Left = 74
    Top = 65
    Width = 13
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 101
    Visible = False
  end
  object cbCVE_CALIDAD_GTIA: TComboBox
    Tag = 18
    Left = 110
    Top = 446
    Width = 107
    Height = 21
    HelpContext = 8701
    ItemHeight = 13
    TabOrder = 57
    OnExit = cbCVE_CALIDAD_GTIAExit
    Items.Strings = (
      'FIJA'
      'VARIABLE')
  end
  object btValidaRSRE: TBitBtn
    Left = 319
    Top = 537
    Width = 96
    Height = 20
    Caption = 'Validar RS/RE'
    TabOrder = 102
    Visible = False
    OnClick = btValidaRSREClick
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
  object chB_INT_DIASIG: TCheckBox
    Tag = 18
    Left = 226
    Top = 448
    Width = 183
    Height = 17
    HelpContext = 8801
    Alignment = taLeftJustify
    Caption = 'Calculo de Interes Dia Siguiente'
    TabOrder = 58
    OnExit = chB_INT_DIASIGExit
  end
  object edTIPO_CARTERA: TEdit
    Left = 504
    Top = 449
    Width = 89
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 103
    Visible = False
  end
  object DtpF_FIN_PERGRA_FA: TInterDateTimePicker
    Tag = 18
    Left = 449
    Top = 175
    Width = 20
    Height = 21
    HelpContext = 5052
    CalAlignment = dtaLeft
    Date = 42471.7691627546
    Time = 42471.7691627546
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 15
    OnExit = DtpF_FIN_PERGRA_FAExit
    Edit = EdF_FIN_PERGRA_FA
    Formato = dfDate
  end
  object EdF_FIN_PERGRA_FA: TEdit
    Tag = 18
    Left = 371
    Top = 175
    Width = 76
    Height = 21
    HelpContext = 5051
    Color = clWhite
    ReadOnly = True
    TabOrder = 14
    OnExit = EdF_FIN_PERGRA_FAExit
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesCancelar = InterForma1DespuesCancelar
    OnDespuesAceptar = InterForma1DespuesAceptar
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
    ShowBtnEliminar = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    OnDespuesShow = InterForma1DespuesShow
    Left = 386
    Top = 2
  end
  object ilCALINT: TInterLinkit
    Control = edCVE_CALCULO
    OnEjecuta = ilCALINTEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 323
    Top = 251
  end
  object ilPAGINT: TInterLinkit
    Control = edCVE_PAG_INTERES
    OnEjecuta = ilPAGINTEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 267
    Top = 381
  end
  object ilTIPAMORT: TInterLinkit
    Control = edCVE_AMORTIZACION
    OnEjecuta = ilTIPAMORTEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 323
    Top = 335
  end
  object ilTIPLIQ: TInterLinkit
    Control = edCVE_LIQUIDACION
    OnEjecuta = ilTIPLIQEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 499
    Top = 56
  end
  object ilIDCONTRATO: TInterLinkit
    Control = iedID_CONTRATO
    OnEjecuta = ilIDCONTRATOEjecuta
    TipoReader = trContrato
    CharCase = ecNormal
    Left = 427
    Top = 50
  end
  object ilTASA_REFER: TInterLinkit
    Control = edCVE_TASA_REFER
    OnEjecuta = ilTASA_REFEREjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 387
    Top = 251
  end
  object pmAcreditado: TPopupMenu
    Left = 132
    Top = 6
    object ConsultaSectorPersona1: TMenuItem
      Caption = '&Acceso a Acreditado'
      OnClick = ConsultaSectorPersona1Click
    end
    object CatlogodePersona1: TMenuItem
      Caption = 'Accesos a &Personas Corporativas'
      OnClick = CatlogodePersona1Click
    end
    object AcessoaProducto: TMenuItem
      Caption = 'Acesso a P&roducto'
      OnClick = AcessoaProductoClick
    end
    object Autorizaciones1: TMenuItem
      Caption = 'Acceso a A&utorizaciones'
      OnClick = Autorizaciones1Click
    end
  end
  object pmTASAS: TPopupMenu
    Left = 536
    Top = 304
    object DatosAdicionalesaTasas1: TMenuItem
      Caption = 'Datos Adicionales a Tasas'
      OnClick = DatosAdicionalesaTasas1Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 279
    Top = 11
    object dispo1: TMenuItem
      Caption = 'Disposición'
      object Rechazos1: TMenuItem
        Caption = 'Rechazos'
        object Consulta1: TMenuItem
          Caption = 'Consulta'
          OnClick = Consulta1Click
        end
        object Rechazar1: TMenuItem
          Caption = 'Rechazar'
          OnClick = Rechazar1Click
        end
        object Reactivar1: TMenuItem
          Caption = 'Reactivar'
          OnClick = Reactivar1Click
        end
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object AdministracinTasas1: TMenuItem
        Caption = 'Administración Tasas'
        OnClick = AdministracinTasas1Click
      end
      object CambiodeTasa1: TMenuItem
        Caption = 'Cambio de Tasa'
        OnClick = CambiodeTasa1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Comisiones1: TMenuItem
        Caption = 'Comisiones'
        OnClick = Comisiones1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Seguros2: TMenuItem
        Caption = 'Seguros'
        OnClick = Seguros2Click
      end
      object Garantas2: TMenuItem
        Caption = 'Garantías'
        OnClick = Garantas2Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object GarantiaNafin1: TMenuItem
        Caption = 'Sol. de Garantía NAFIN'
        OnClick = GarantiaNafin1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Documentacin2: TMenuItem
        Caption = 'Documentación'
        OnClick = Documentacin2Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object DatosComplementarios1: TMenuItem
        Caption = 'Datos Complementarios'
        object A1: TMenuItem
          Caption = 'Acreditado'
          OnClick = ConsultaSectorPersona1Click
        end
        object PersonaCorporativa1: TMenuItem
          Caption = 'Persona Corporativa'
          OnClick = CatlogodePersona1Click
        end
        object ProductodeCrdito1: TMenuItem
          Caption = 'Producto de Crédito'
          OnClick = AcessoaProductoClick
        end
        object Autorizacin1: TMenuItem
          Caption = 'Autorización'
          OnClick = Autorizaciones1Click
        end
        object Chequeras: TMenuItem
          Caption = 'Chequeras'
          OnClick = ChequerasClick
        end
        object ObligadoSolidario1: TMenuItem
          Caption = 'Obligado Solidario'
        end
      end
      object Impresin1: TMenuItem
        Caption = 'Impresión'
        OnClick = Impresin1Click
      end
      object Cuotas1: TMenuItem
        Caption = 'Cuotas'
        OnClick = Cuotas1Click
      end
      object M1: TMenuItem
        Caption = 'Configurar Moratorios'
        OnClick = M1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object TipoLiquidacin1: TMenuItem
        Caption = 'Tipo Liquidación'
        OnClick = TipoLiquidacin1Click
      end
    end
    object Agronegocios1: TMenuItem
      Caption = 'Agronegocios'
      object Procampo1: TMenuItem
        Caption = 'Procampo'
        OnClick = Procampo1Click
      end
      object SIEBAN1: TMenuItem
        Caption = 'SIEBAN'
        OnClick = SIEBAN1Click
      end
    end
    object Redescuento1: TMenuItem
      Caption = 'Redescuento'
      object Redescuento2: TMenuItem
        Caption = 'Redescuento'
        OnClick = Redescuento2Click
      end
    end
    object RenovReest1: TMenuItem
      Caption = 'Oper. Eventuales'
      object RenvacinReestructuracin1: TMenuItem
        Caption = 'Renovación / Reestructuración'
        OnClick = RenvacinReestructuracin1Click
      end
      object ConvenioModificatorio1: TMenuItem
        Caption = 'Conv. Modif. / Avent. Acel.'
        OnClick = RenvacinReestructuracin1Click
      end
    end
  end
  object ilCVE_TIPO_BAJA: TInterLinkit
    OnEjecuta = ilCVE_TIPO_BAJAEjecuta
    TipoReader = trEntero
    CharCase = ecNormal
    Left = 236
    Top = 407
  end
  object pmOperativa: TPopupMenu
    Left = 544
    Top = 104
    object EliminarOperativa1: TMenuItem
      Caption = 'Eliminar Operativa'
      OnClick = EliminarOperativa1Click
    end
  end
end
