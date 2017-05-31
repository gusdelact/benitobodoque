object WCrCto: TWCrCto
  Left = 383
  Top = 85
  Width = 649
  Height = 631
  Caption = 'Alta de Autorización'
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
  object lbSITLINEA: TLabel
    Left = 442
    Top = 522
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
  object lbSIT_LINEA: TLabel
    Tag = 18
    Left = 506
    Top = 521
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
  object lbF_ALTA: TLabel
    Left = 4
    Top = 496
    Width = 30
    Height = 13
    Caption = 'F. Alta'
  end
  object lbF_MODIFICA: TLabel
    Left = 4
    Top = 520
    Width = 33
    Height = 13
    Caption = 'F. Mod'
  end
  object lbCVE_USU_ALTA: TLabel
    Left = 200
    Top = 496
    Width = 32
    Height = 13
    Caption = 'U. Alta'
  end
  object lbCVE_USU_MODIFICA: TLabel
    Left = 199
    Top = 520
    Width = 35
    Height = 13
    Caption = 'U. Mod'
  end
  object lbCVE_USU_AUTORIZA: TLabel
    Left = 315
    Top = 496
    Width = 30
    Height = 13
    Caption = 'U. Aut'
  end
  object ControlBar1: TControlBar
    Left = -1
    Top = 540
    Width = 624
    Height = 24
    BevelEdges = [beLeft, beTop]
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelKind = bkSoft
    TabOrder = 7
    object ToolBar1: TToolBar
      Left = 11
      Top = 2
      Width = 202
      Height = 19
      Align = alNone
      AutoSize = True
      ButtonHeight = 19
      ButtonWidth = 126
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
        Caption = 'Datos Complementarios '
        Grouped = True
        MenuItem = Autorizacin1
      end
      object ToolButton2: TToolButton
        Left = 126
        Top = 0
        AutoSize = True
        Caption = 'Agronegocios'
        Grouped = True
        MenuItem = Agronegocios1
      end
    end
  end
  object gbFOLIO: TGroupBox
    Left = 578
    Top = -1
    Width = 41
    Height = 46
    HelpContext = 900
    Caption = 'Folio '
    TabOrder = 1
    object lbFOL_CONTRATO: TLabel
      Tag = 50
      Left = 18
      Top = 18
      Width = 8
      Height = 13
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object icpCONTRATO: TInterCtoPanel
    Tag = 50
    Left = 0
    Top = 0
    Width = 563
    Height = 45
    Hint = 'Información del Contrato'
    Lenguaje = 0
    ShowLenguaje = False
    ShowEnviarEMail = False
  end
  object PnDatos: TPanel
    Left = 0
    Top = 567
    Width = 625
    Height = 21
    TabOrder = 9
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
      Left = 416
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
      Left = 416
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
      Left = 480
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
      Left = 480
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
    Left = 213
    Top = 540
    Width = 411
    Height = 23
    TabOrder = 8
  end
  object edF_ALTA: TEdit
    Left = 42
    Top = 493
    Width = 138
    Height = 21
    TabStop = False
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object edF_MODIFICA: TEdit
    Left = 41
    Top = 516
    Width = 138
    Height = 21
    TabStop = False
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object edCVE_USU_ALTA: TEdit
    Left = 237
    Top = 493
    Width = 67
    Height = 21
    TabStop = False
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 237
    Top = 516
    Width = 66
    Height = 21
    TabStop = False
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object edCVE_USU_AUTORIZA: TEdit
    Left = 349
    Top = 493
    Width = 75
    Height = 21
    TabStop = False
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object PageCon_Datos: TPageControl
    Left = 0
    Top = 45
    Width = 625
    Height = 441
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Datos Generales'
      object Bevel11: TBevel
        Left = 216
        Top = 143
        Width = 395
        Height = 121
        Shape = bsFrame
      end
      object Bevel10: TBevel
        Left = 0
        Top = 143
        Width = 217
        Height = 121
        Shape = bsFrame
      end
      object lbCVE_PRODUCTO_CRE: TLabel
        Left = 0
        Top = 27
        Width = 43
        Height = 13
        Caption = 'Producto'
      end
      object Label7: TLabel
        Left = 0
        Top = 4
        Width = 93
        Height = 13
        Caption = 'Acreditado \ Sector'
      end
      object lbCVE_ORIGEN_REC: TLabel
        Left = 0
        Top = 49
        Width = 94
        Height = 13
        Caption = 'Origen de Recursos'
      end
      object lbCVE_DESTINO: TLabel
        Left = 308
        Top = 49
        Width = 89
        Height = 13
        Caption = 'Dest. de la Dispos.'
      end
      object lbPromAdmon: TLabel
        Left = 0
        Top = 73
        Width = 93
        Height = 13
        Caption = 'Prom. Administrador'
      end
      object lbCVE_CARACT_CTO: TLabel
        Left = 308
        Top = 73
        Width = 88
        Height = 13
        Caption = 'Característica Cto.'
      end
      object lbCVE_COMPROB_ING: TLabel
        Left = 0
        Top = 97
        Width = 88
        Height = 13
        Caption = 'Comprob. Ingresos'
      end
      object lbCVE_SEC_LABORAL: TLabel
        Left = 308
        Top = 97
        Width = 69
        Height = 13
        Caption = 'Sector Laboral'
      end
      object LBIMP_INGRESOS_ACR: TLabel
        Left = 0
        Top = 123
        Width = 73
        Height = 13
        Caption = 'Ingresos Brutos'
      end
      object Label25: TLabel
        Left = 241
        Top = 312
        Width = 126
        Height = 13
        Caption = 'Datos de Aurorización'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel9: TBevel
        Left = 3
        Top = 328
        Width = 603
        Height = 2
      end
      object Bevel1: TBevel
        Left = 408
        Top = 211
        Width = 200
        Height = 2
        Shape = bsTopLine
      end
      object lbIMP_AUTORIZADO: TLabel
        Left = 226
        Top = 164
        Width = 50
        Height = 13
        Caption = 'Autorizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbIMP_DISPUESTO: TLabel
        Left = 226
        Top = 188
        Width = 47
        Height = 13
        Caption = 'Dispuesto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 226
        Top = 240
        Width = 60
        Height = 13
        Caption = 'Disponible'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbIMP_TRANSITO: TLabel
        Left = 407
        Top = 218
        Width = 96
        Height = 13
        Caption = 'Fin. Adicional Global'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 289
        Top = 227
        Width = 8
        Height = 13
        Caption = '='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 289
        Top = 174
        Width = 5
        Height = 13
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 407
        Top = 241
        Width = 73
        Height = 13
        Caption = 'Riesgo Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 415
        Top = 164
        Width = 49
        Height = 13
        Caption = 'Disponible'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 415
        Top = 187
        Width = 81
        Height = 13
        Caption = 'Disponible Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 426
        Top = 144
        Width = 164
        Height = 13
        Caption = 'Monto por Disponer del Acreditado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 221
        Top = 144
        Width = 180
        Height = 13
        Caption = 'Monto por Disponer de la Autorización'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 408
        Top = 202
        Width = 149
        Height = 9
        Caption = '(No aplica para Refinanciamiento)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lbBloqueado: TLabel
        Left = 226
        Top = 215
        Width = 51
        Height = 13
        Caption = 'Bloqueado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 289
        Top = 200
        Width = 5
        Height = 13
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel7: TBevel
        Left = 406
        Top = 143
        Width = 5
        Height = 69
        Shape = bsLeftLine
      end
      object Bevel8: TBevel
        Left = 299
        Top = 229
        Width = 100
        Height = 5
        Shape = bsBottomLine
        Style = bsRaised
      end
      object Bevel4: TBevel
        Left = 0
        Top = 184
        Width = 215
        Height = 2
      end
      object lbF_AUT_COMITE: TLabel
        Left = 8
        Top = 191
        Width = 33
        Height = 13
        Caption = 'Fecha '
      end
      object lbDIAS_PLAZO: TLabel
        Left = 8
        Top = 215
        Width = 56
        Height = 13
        Caption = 'Plazo (días)'
      end
      object lbF_VENCIMIENTO: TLabel
        Left = 8
        Top = 242
        Width = 67
        Height = 13
        Caption = 'Fecha de Vto.'
      end
      object Bevel5: TBevel
        Left = 93
        Top = 233
        Width = 119
        Height = 2
      end
      object lbCVE_COMITE_AUT: TLabel
        Left = 8
        Top = 165
        Width = 30
        Height = 13
        Caption = 'Clave '
      end
      object Label26: TLabel
        Left = 77
        Top = 144
        Width = 58
        Height = 13
        Caption = 'Autorización'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label29: TLabel
        Left = 401
        Top = 288
        Width = 58
        Height = 13
        Caption = 'Imp. Exceso'
      end
      object Label18: TLabel
        Left = 2
        Top = 288
        Width = 86
        Height = 13
        Caption = 'Fecha Origen Vto.'
      end
      object Label31: TLabel
        Left = 223
        Top = 288
        Width = 58
        Height = 13
        Caption = 'Imp. Original'
      end
      object SpeedButton1: TSpeedButton
        Left = 474
        Top = 284
        Width = 23
        Height = 22
      end
      object Label27: TLabel
        Left = 5
        Top = 263
        Width = 134
        Height = 13
        Caption = 'Control de Importes Excesos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel12: TBevel
        Left = 0
        Top = 262
        Width = 611
        Height = 48
        Shape = bsFrame
      end
      object edCVE_PRODUCTO_CRE: TEdit
        Tag = 562
        Left = 100
        Top = 23
        Width = 73
        Height = 21
        HelpContext = 2001
        CharCase = ecUpperCase
        PopupMenu = pmAcreditado
        TabOrder = 3
        OnExit = edCVE_PRODUCTO_CREExit
      end
      object btPRODUCTO: TBitBtn
        Tag = 18
        Left = 174
        Top = 23
        Width = 21
        Height = 19
        HelpContext = 2002
        PopupMenu = pmAcreditado
        TabOrder = 4
        OnClick = btPRODUCTOClick
        OnExit = edCVE_PRODUCTO_CREExit
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
      object edDESC_PRODUCTO: TEdit
        Left = 196
        Top = 23
        Width = 413
        Height = 21
        HelpContext = 2003
        TabStop = False
        Color = clBtnFace
        PopupMenu = pmAcreditado
        TabOrder = 5
      end
      object edACREDITADO: TEdit
        Tag = 562
        Left = 100
        Top = 0
        Width = 73
        Height = 21
        HelpContext = 1001
        PopupMenu = pmAcreditado
        TabOrder = 0
        OnExit = edACREDITADOExit
      end
      object btACREDITADO: TBitBtn
        Tag = 50
        Left = 176
        Top = 0
        Width = 19
        Height = 19
        HelpContext = 1002
        PopupMenu = pmAcreditado
        TabOrder = 1
        OnClick = btACREDITADOClick
        OnExit = edACREDITADOExit
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
      object edNOMBRE_ACRED: TEdit
        Left = 233
        Top = 0
        Width = 376
        Height = 21
        HelpContext = 1004
        TabStop = False
        Color = clBtnFace
        PopupMenu = pmAcreditado
        ReadOnly = True
        TabOrder = 2
      end
      object edCVE_ORIGEN_REC: TEdit
        Tag = 530
        Left = 100
        Top = 45
        Width = 73
        Height = 21
        HelpContext = 3001
        CharCase = ecUpperCase
        MaxLength = 6
        TabOrder = 6
        OnExit = edCVE_ORIGEN_RECExit
      end
      object edCVE_DESTINO: TEdit
        Tag = 530
        Left = 403
        Top = 45
        Width = 73
        Height = 21
        HelpContext = 4001
        CharCase = ecUpperCase
        MaxLength = 6
        TabOrder = 10
        OnExit = edCVE_DESTINOExit
      end
      object btCVE_ORIGEN_REC: TBitBtn
        Tag = 18
        Left = 174
        Top = 45
        Width = 21
        Height = 19
        HelpContext = 3002
        TabOrder = 7
        OnClick = btCVE_ORIGEN_RECClick
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
      object btCVE_DESTINO: TBitBtn
        Tag = 18
        Left = 477
        Top = 45
        Width = 21
        Height = 19
        HelpContext = 4002
        TabOrder = 12
        OnClick = btCVE_DESTINOClick
        OnExit = btCVE_DESTINOExit
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
      object edDESC_ORIGEN_REC: TEdit
        Left = 196
        Top = 45
        Width = 110
        Height = 21
        HelpContext = 3003
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 8
        OnExit = edDESC_ORIGEN_RECExit
      end
      object edDESC_DESTINO: TEdit
        Left = 499
        Top = 45
        Width = 110
        Height = 21
        HelpContext = 4003
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 9
        OnExit = edDESC_DESTINOExit
      end
      object edSECTOR_CORP: TEdit
        Left = 196
        Top = 0
        Width = 37
        Height = 21
        HelpContext = 1003
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        PopupMenu = pmAcreditado
        ReadOnly = True
        ShowHint = True
        TabOrder = 11
      end
      object btPROM_ADM: TBitBtn
        Tag = 18
        Left = 174
        Top = 69
        Width = 22
        Height = 19
        HelpContext = 4011
        TabOrder = 14
        OnClick = btPROM_ADMClick
        OnExit = btPROM_ADMExit
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
      object edNAME_PROM_ADM: TEdit
        Left = 196
        Top = 69
        Width = 110
        Height = 21
        Hint = 'Click derecho para Catálogo'
        HelpContext = 4012
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 15
        OnExit = edNAME_PROM_ADMExit
      end
      object edID_PROM_ADM: TEdit
        Left = 100
        Top = 69
        Width = 73
        Height = 20
        Hint = 'Click derecho para Catálogo'
        HelpContext = 4010
        TabStop = False
        AutoSize = False
        CharCase = ecUpperCase
        Color = clBtnFace
        MaxLength = 4
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
        OnExit = edID_PROM_ADMExit
      end
      object edCVE_CARACT_CTO: TEdit
        Tag = 530
        Left = 403
        Top = 69
        Width = 73
        Height = 21
        HelpContext = 4201
        TabOrder = 16
        OnExit = edCVE_CARACT_CTOExit
      end
      object btCVE_CARACT_CTO: TBitBtn
        Tag = 18
        Left = 477
        Top = 69
        Width = 22
        Height = 19
        HelpContext = 4202
        TabOrder = 17
        OnClick = btCVE_CARACT_CTOClick
        OnExit = edCVE_CARACT_CTOExit
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
      object edDES_CVE_CARACT_CTO: TEdit
        Left = 499
        Top = 69
        Width = 110
        Height = 21
        Hint = 'Click derecho para Catálogo'
        HelpContext = 4203
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 18
        OnExit = edDES_CVE_CARACT_CTOExit
      end
      object btCVE_COMPROB_ING: TBitBtn
        Tag = 18
        Left = 174
        Top = 94
        Width = 22
        Height = 19
        HelpContext = 4302
        TabOrder = 20
        OnClick = btCVE_COMPROB_INGClick
        OnExit = edCVE_COMPROB_INGExit
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
      object btCVE_SEC_LABORAL: TBitBtn
        Tag = 18
        Left = 477
        Top = 93
        Width = 22
        Height = 19
        HelpContext = 4402
        TabOrder = 23
        OnClick = btCVE_SEC_LABORALClick
        OnExit = edCVE_SEC_LABORALExit
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
      object edCVE_COMPROB_ING: TEdit
        Tag = 530
        Left = 100
        Top = 93
        Width = 73
        Height = 21
        HelpContext = 4301
        TabOrder = 19
        OnExit = edCVE_COMPROB_INGExit
      end
      object edCVE_SEC_LABORAL: TEdit
        Tag = 530
        Left = 403
        Top = 93
        Width = 73
        Height = 21
        HelpContext = 4401
        TabOrder = 22
        OnExit = edCVE_SEC_LABORALExit
      end
      object edDESC_CVE_SEC_LABORAL: TEdit
        Left = 499
        Top = 93
        Width = 110
        Height = 21
        Hint = 'Click derecho para Catálogo'
        HelpContext = 4403
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 24
        OnExit = edDESC_CVE_SEC_LABORALExit
      end
      object edDES_CVE_COMPROB_ING: TEdit
        Left = 196
        Top = 93
        Width = 110
        Height = 21
        Hint = 'Click derecho para Catálogo'
        HelpContext = 4302
        TabStop = False
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 21
        OnExit = edDES_CVE_COMPROB_INGExit
      end
      object edIMP_INGRESOS_ACR: TInterEdit
        Tag = 18
        Left = 100
        Top = 118
        Width = 96
        Height = 21
        Hint = 'No aplica para Refinanciamiento'
        HelpContext = 4501
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = edIMP_INGRESOS_ACRExit
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 25
        UseReType = True
        UseSep = False
        UseDisplay = True
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object chB_ESTRUCTURADO: TCheckBox
        Tag = 18
        Left = 526
        Top = 119
        Width = 82
        Height = 17
        HelpContext = 4601
        Alignment = taLeftJustify
        Caption = 'Estructurado'
        TabOrder = 26
        OnExit = chB_ESTRUCTURADOExit
      end
      object chB_EVENTUAL: TCheckBox
        Tag = 18
        Left = 168
        Top = 330
        Width = 71
        Height = 17
        HelpContext = 6050
        Caption = 'Eventual'
        TabOrder = 46
        OnExit = chB_EVENTUALExit
      end
      object chB_REESTRUCTURA: TCheckBox
        Tag = 18
        Left = 503
        Top = 346
        Width = 108
        Height = 17
        HelpContext = 6350
        Caption = 'Apli Reestructura'
        TabOrder = 52
        OnExit = chB_REESTRUCTURAExit
      end
      object chB_PARAMETRICO: TCheckBox
        Tag = 18
        Left = 340
        Top = 330
        Width = 86
        Height = 17
        HelpContext = 6100
        Caption = 'Es Paramétrico'
        TabOrder = 47
        OnExit = chB_PARAMETRICOExit
      end
      object chB_FINAN_CALIF: TCheckBox
        Tag = 18
        Left = 503
        Top = 329
        Width = 93
        Height = 17
        HelpContext = 6150
        Caption = 'Apli Financ Calif'
        TabOrder = 48
        OnExit = chB_FINAN_CALIFExit
      end
      object chB_APL_CONVE_MOD: TCheckBox
        Tag = 18
        Left = 3
        Top = 347
        Width = 76
        Height = 17
        HelpContext = 6200
        Caption = 'Conv. Modif.'
        TabOrder = 49
        OnExit = chB_APL_CONVE_MODExit
      end
      object chB_APL_RENOVACION: TCheckBox
        Tag = 18
        Left = 3
        Top = 331
        Width = 97
        Height = 17
        HelpContext = 6000
        Caption = 'Apli Renovación'
        Enabled = False
        TabOrder = 45
        OnExit = chB_APL_RENOVACIONExit
      end
      object cbB_DISP_EN_LINEA: TCheckBox
        Tag = 18
        Left = 168
        Top = 346
        Width = 101
        Height = 17
        HelpContext = 6250
        Caption = 'Apl Disp en Línea'
        TabOrder = 50
        OnExit = cbB_DISP_EN_LINEAExit
      end
      object chB_EMPLEADO: TCheckBox
        Tag = 18
        Left = 340
        Top = 346
        Width = 78
        Height = 17
        HelpContext = 6300
        Caption = 'Es Empleado'
        TabOrder = 51
        OnExit = chB_EMPLEADOExit
      end
      object edIMP_AUTORIZADO: TInterEdit
        Tag = 18
        Left = 299
        Top = 160
        Width = 100
        Height = 20
        Hint = 'No aplica para Refinanciamiento'
        HelpContext = 5501
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = edIMP_AUTORIZADOExit
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 34
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edIMP_DISPUESTO: TInterEdit
        Left = 299
        Top = 185
        Width = 100
        Height = 21
        HelpContext = 5503
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = edIMP_DISPUESTOExit
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        TabOrder = 36
        ReadOnly = True
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object iedDISPONIBLE_AUT: TInterEdit
        Left = 299
        Top = 236
        Width = 100
        Height = 21
        HelpContext = 5507
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = iedDISPONIBLE_AUTExit
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        TabOrder = 40
        ReadOnly = True
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edIMP_FINANC_ADIC: TInterEdit
        Left = 505
        Top = 216
        Width = 100
        Height = 20
        HelpContext = 5506
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = edIMP_FINANC_ADICExit
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        TabOrder = 39
        ReadOnly = True
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object iedRIESGO_TOTAL: TInterEdit
        Left = 505
        Top = 237
        Width = 100
        Height = 20
        HelpContext = 5508
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = iedRIESGO_TOTALExit
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        TabOrder = 41
        ReadOnly = True
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object iedDISPONIBLE_ACRED: TInterEdit
        Left = 505
        Top = 160
        Width = 100
        Height = 20
        HelpContext = 5502
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = iedDISPONIBLE_ACREDExit
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        TabOrder = 35
        ReadOnly = True
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edDISPONIBLE_GRUPO_ECO: TInterEdit
        Left = 505
        Top = 183
        Width = 100
        Height = 19
        HelpContext = 5504
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = edDISPONIBLE_GRUPO_ECOExit
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        TabOrder = 37
        ReadOnly = True
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edIMP_BLOQUEADO: TInterEdit
        Left = 299
        Top = 209
        Width = 100
        Height = 21
        HelpContext = 5505
        TabStop = False
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = edIMP_BLOQUEADOExit
        DisplayMask = '###,###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        TabOrder = 38
        ReadOnly = True
        UseReType = False
        UseSep = False
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object dtpF_AUT_COMITE: TInterDateTimePicker
        Tag = 18
        Left = 189
        Top = 187
        Width = 21
        Height = 21
        HelpContext = 5102
        CalAlignment = dtaLeft
        Date = 37781.35659625
        Time = 37781.35659625
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 29
        TabStop = False
        OnExit = edF_AUT_COMITEExit
        Edit = edF_AUT_COMITE
        Formato = dfDate
      end
      object edF_AUT_COMITE: TEdit
        Tag = 18
        Left = 100
        Top = 187
        Width = 87
        Height = 21
        HelpContext = 5101
        CharCase = ecUpperCase
        TabOrder = 28
        OnExit = edF_AUT_COMITEExit
      end
      object edDIAS_PLAZO: TInterEdit
        Tag = 18
        Left = 100
        Top = 211
        Width = 87
        Height = 21
        HelpContext = 5201
        Prefijo = '1'
        Contrato = -1
        TipoReader = trEntero
        OnExit = edDIAS_PLAZOExit
        DisplayMask = '####0'
        MaxLength = 6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 30
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object btPLAZOCREDITO: TBitBtn
        Tag = 18
        Left = 189
        Top = 211
        Width = 19
        Height = 21
        HelpContext = 5202
        TabOrder = 31
        TabStop = False
        OnClick = btPLAZOCREDITOClick
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
      object edF_VENCIMIENTO: TEdit
        Tag = 18
        Left = 100
        Top = 238
        Width = 87
        Height = 21
        HelpContext = 5301
        CharCase = ecUpperCase
        TabOrder = 32
        OnExit = edF_VENCIMIENTOExit
      end
      object dtpF_VENCIMIENTO: TInterDateTimePicker
        Tag = 18
        Left = 189
        Top = 238
        Width = 21
        Height = 21
        HelpContext = 5302
        CalAlignment = dtaLeft
        Date = 37781.35659625
        Time = 37781.35659625
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 33
        TabStop = False
        OnExit = edF_VENCIMIENTOExit
        Edit = edF_VENCIMIENTO
        Formato = dfDate
      end
      object edCVE_COMITE_AUT: TEdit
        Tag = 18
        Left = 100
        Top = 161
        Width = 112
        Height = 21
        HelpContext = 5001
        CharCase = ecUpperCase
        TabOrder = 27
        OnExit = edCVE_COMITE_AUTExit
      end
      object edIMP_EXCESO_EVE: TInterEdit
        Left = 499
        Top = 284
        Width = 100
        Height = 20
        HelpContext = 5602
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = edIMP_EXCESO_EVEExit
        DisplayMask = '###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 44
        ReadOnly = True
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edF_VTO_EXCESO: TEdit
        Tag = 18
        Left = 95
        Top = 284
        Width = 87
        Height = 21
        HelpContext = 5600
        CharCase = ecUpperCase
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 42
        OnExit = edF_VTO_EXCESOExit
      end
      object edIMP_AUT_ORIG: TInterEdit
        Left = 293
        Top = 284
        Width = 100
        Height = 20
        HelpContext = 5601
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = edIMP_AUT_ORIGExit
        DisplayMask = '###,###,###,##0.00'
        MaxLength = 18
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 43
        ReadOnly = True
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object chB_REVOLVENTE: TCheckBox
        Tag = 18
        Left = 3
        Top = 363
        Width = 71
        Height = 17
        HelpContext = 6400
        Caption = 'Revolvente'
        Enabled = False
        TabOrder = 53
        OnExit = chB_REVOLVENTEExit
      end
      object chB_APL_PRORROGA: TCheckBox
        Tag = 18
        Left = 168
        Top = 363
        Width = 86
        Height = 17
        HelpContext = 6450
        Caption = 'Apl. Prorrogas'
        Enabled = False
        TabOrder = 54
        OnExit = chB_APL_PRORROGAExit
      end
      object chB_FINANC_ADIC: TCheckBox
        Tag = 18
        Left = 340
        Top = 362
        Width = 93
        Height = 17
        HelpContext = 6500
        Caption = 'Apli Financ Adic'
        TabOrder = 55
        OnExit = chB_FINANC_ADICExit
      end
      object chB_APL_EVEN_ACEL: TCheckBox
        Tag = 18
        Left = 503
        Top = 362
        Width = 76
        Height = 17
        HelpContext = 6550
        Caption = 'Evento Acel'
        TabOrder = 56
        OnExit = chB_APL_EVEN_ACELExit
      end
      object chB_EMPROBLEMADA: TCheckBox
        Tag = 18
        Left = 3
        Top = 379
        Width = 102
        Height = 17
        HelpContext = 6600
        Caption = 'Es Emproblemado'
        TabOrder = 57
        OnExit = chB_EMPROBLEMADAExit
      end
      object chB_RAMO_28: TCheckBox
        Tag = 18
        Left = 168
        Top = 379
        Width = 78
        Height = 17
        HelpContext = 6650
        Caption = 'Es Ramo 28'
        TabOrder = 58
        OnExit = chB_RAMO_28Exit
      end
      object chCVE_FORMA_DISP: TCheckBox
        Tag = 18
        Left = 340
        Top = 379
        Width = 139
        Height = 17
        HelpContext = 6700
        Caption = 'No Rev. una Disposición'
        TabOrder = 59
        OnExit = chCVE_FORMA_DISPExit
      end
      object chB_LITIGIOSO: TCheckBox
        Tag = 18
        Left = 503
        Top = 379
        Width = 70
        Height = 17
        HelpContext = 6750
        Caption = 'Litigioso'
        TabOrder = 60
        OnExit = chB_LITIGIOSOExit
      end
      object chkB_TIPO_LINEA: TCheckBox
        Tag = 18
        Left = 3
        Top = 395
        Width = 151
        Height = 17
        HelpContext = 6800
        Caption = 'Línea de Crédito Revocable'
        TabOrder = 61
        OnExit = chkB_TIPO_LINEAExit
      end
      object chkB_PRELACION_PGO: TCheckBox
        Tag = 18
        Left = 168
        Top = 395
        Width = 157
        Height = 17
        HelpContext = 6900
        Caption = 'Prelación de Pago Preferente'
        TabOrder = 62
        OnExit = chkB_PRELACION_PGOExit
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Datos Generales 2'
      ImageIndex = 1
      object gbCONFIG_CRED: TGroupBox
        Left = 0
        Top = 4
        Width = 614
        Height = 349
        TabOrder = 0
        object Bevel3: TBevel
          Left = 2
          Top = 93
          Width = 603
          Height = 2
        end
        object lbOPERADOR_STASA: TLabel
          Left = 176
          Top = 74
          Width = 81
          Height = 13
          Caption = 'Ope. Sobre-Tasa'
        end
        object lbSOBRETASA: TLabel
          Left = 297
          Top = 72
          Width = 64
          Height = 13
          Caption = 'Dif. BInter (%)'
        end
        object lbTX_COND_GRALES: TLabel
          Left = 8
          Top = 158
          Width = 64
          Height = 13
          Caption = 'Cond. Grales.'
        end
        object lbCVE_TASA_REFER: TLabel
          Left = 5
          Top = 46
          Width = 62
          Height = 13
          Caption = 'Tasa de Ref.'
        end
        object lbCVE_MONEDA: TLabel
          Left = 5
          Top = 18
          Width = 39
          Height = 13
          Caption = 'Moneda'
        end
        object Label8: TLabel
          Left = 5
          Top = 72
          Width = 51
          Height = 13
          Caption = 'Tasa Base'
        end
        object Label23: TLabel
          Left = 8
          Top = 110
          Width = 68
          Height = 13
          Caption = 'Req. Capitaliz.'
        end
        object Label10: TLabel
          Left = 189
          Top = 110
          Width = 14
          Height = 13
          Caption = '[%]'
        end
        object lbCVE_SUB_TIP_COB: TLabel
          Left = 410
          Top = 110
          Width = 97
          Height = 13
          Hint = 'Tipo de cobranza anticipada'
          Caption = 'Cobranza anticipada'
          ParentShowHint = False
          ShowHint = True
        end
        object lbID_CREDITO_MARCO: TLabel
          Left = 410
          Top = 159
          Width = 87
          Height = 13
          Caption = 'Disposición Marco'
        end
        object TLabel
          Left = 8
          Top = 171
          Width = 3
          Height = 13
        end
        object lbROE_BRUTA: TLabel
          Left = 8
          Top = 135
          Width = 51
          Height = 13
          Caption = 'ROE Bruta'
        end
        object lbROE_NETA: TLabel
          Left = 125
          Top = 135
          Width = 49
          Height = 13
          Caption = 'ROE Neta'
        end
        object lbPCT_REQ_CAP_MER: TLabel
          Left = 240
          Top = 135
          Width = 67
          Height = 13
          Caption = '% R. Mercado'
        end
        object lbPCT_REQ_CAP_CRE: TLabel
          Left = 372
          Top = 135
          Width = 58
          Height = 13
          Caption = '% R. Crédito'
        end
        object Label20: TLabel
          Left = 497
          Top = 135
          Width = 41
          Height = 13
          Caption = '% I. CAP'
        end
        object Label22: TLabel
          Left = 8
          Top = 184
          Width = 86
          Height = 13
          Caption = 'Garantia Gobierno'
        end
        object Label24: TLabel
          Left = 430
          Top = 184
          Width = 63
          Height = 13
          Caption = 'Analista Asig:'
        end
        object Label9: TLabel
          Left = 8
          Top = 207
          Width = 79
          Height = 13
          Caption = 'Alta de la Dispos'
        end
        object lbNO_CONSUL_BURO: TLabel
          Left = 393
          Top = 270
          Width = 66
          Height = 13
          Caption = 'Consulta Buró'
        end
        object Bevel6: TBevel
          Left = 3
          Top = 252
          Width = 603
          Height = 2
        end
        object Label11: TLabel
          Left = 4
          Top = 293
          Width = 77
          Height = 13
          Caption = 'Producto Banca'
        end
        object Label15: TLabel
          Left = 4
          Top = 321
          Width = 93
          Height = 13
          Caption = 'Periodicidad Capital'
        end
        object Label14: TLabel
          Left = 304
          Top = 321
          Width = 93
          Height = 13
          Caption = 'Periodicidad Interés'
        end
        object Label16: TLabel
          Left = 367
          Top = 207
          Width = 43
          Height = 13
          Caption = 'ID CNBV'
        end
        object Fecha: TLabel
          Left = 222
          Top = 269
          Width = 61
          Height = 13
          Caption = 'Fecha de Hit'
        end
        object Label21: TLabel
          Left = 8
          Top = 232
          Width = 82
          Height = 13
          Caption = 'Baja de la Dispos'
        end
        object Label28: TLabel
          Left = 367
          Top = 232
          Width = 68
          Height = 13
          Caption = 'Fecha de baja'
        end
        object edDesc_Periodicidad_CAT: TEdit
          Tag = 512
          Left = 198
          Top = 315
          Width = 99
          Height = 21
          HelpContext = 9402
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 52
          OnExit = edDesc_Periodicidad_CATExit
        end
        object btTASA_REFER: TBitBtn
          Tag = 18
          Left = 149
          Top = 42
          Width = 22
          Height = 20
          HelpContext = 7101
          TabOrder = 6
          OnClick = btTASA_REFERClick
          OnExit = edCVE_TASA_REFERExit
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
          Tag = 512
          Left = 180
          Top = 42
          Width = 244
          Height = 21
          HelpContext = 7102
          Color = clBtnFace
          TabOrder = 7
          OnExit = edDESC_TASA_REFERExit
        end
        object cbOPERADOR_STASA: TComboBox
          Tag = 18
          Left = 261
          Top = 68
          Width = 33
          Height = 21
          HelpContext = 8002
          ItemHeight = 13
          TabOrder = 12
          Text = '+'
          OnExit = cbOPERADOR_STASAExit
        end
        object mTX_COND_GRALES: TMemo
          Tag = 18
          Left = 100
          Top = 155
          Width = 300
          Height = 20
          HelpContext = 9000
          MaxLength = 255
          ScrollBars = ssVertical
          TabOrder = 25
          OnExit = mTX_COND_GRALESExit
          OnKeyPress = mTX_COND_GRALESKeyPress
        end
        object edCVE_TASA_REFER: TEdit
          Tag = 530
          Left = 70
          Top = 42
          Width = 73
          Height = 21
          HelpContext = 7100
          CharCase = ecUpperCase
          TabOrder = 5
          OnExit = edCVE_TASA_REFERExit
        end
        object edSOBRETASA: TInterEdit
          Tag = 18
          Left = 363
          Top = 68
          Width = 65
          Height = 20
          HelpContext = 8003
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edSOBRETASAExit
          DisplayMask = '#,###,##0.0000'
          MaxLength = 12
          TabOrder = 13
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edDESC_MONEDA: TEdit
          Left = 181
          Top = 14
          Width = 242
          Height = 21
          HelpContext = 7002
          Color = clBtnFace
          TabOrder = 2
          OnExit = edDESC_MONEDAExit
        end
        object edTASA_BASE: TInterEdit
          Tag = 18
          Left = 70
          Top = 68
          Width = 73
          Height = 20
          HelpContext = 8000
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edTASA_BASEExit
          DisplayMask = '###0.0000'
          MaxLength = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 10
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = False
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object btCVE_GPO_CAPITALIZ: TBitBtn
          Tag = 18
          Left = 149
          Top = 69
          Width = 22
          Height = 20
          HelpContext = 8001
          TabOrder = 11
          OnClick = btCVE_GPO_CAPITALIZClick
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
        object edPCT_CAPITALIZA: TEdit
          Left = 205
          Top = 106
          Width = 57
          Height = 21
          HelpContext = 8110
          Color = clBtnFace
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 17
          OnExit = edPCT_CAPITALIZAExit
        end
        object edDESC_CAPITALIZA: TEdit
          Left = 262
          Top = 106
          Width = 147
          Height = 21
          HelpContext = 8115
          Color = clBtnFace
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 18
          OnExit = edDESC_CAPITALIZAExit
        end
        object edCVE_GPO_CAPITALIZ: TEdit
          Tag = 18
          Left = 100
          Top = 106
          Width = 61
          Height = 21
          HelpContext = 8100
          CharCase = ecUpperCase
          MaxLength = 6
          TabOrder = 16
          OnExit = edCVE_GPO_CAPITALIZExit
        end
        object edCVE_MONEDA: TEdit
          Tag = 562
          Left = 70
          Top = 14
          Width = 73
          Height = 21
          HelpContext = 7000
          CharCase = ecUpperCase
          TabOrder = 0
          OnExit = edCVE_MONEDAExit
        end
        object btMONEDA: TBitBtn
          Tag = 50
          Left = 149
          Top = 14
          Width = 22
          Height = 19
          HelpContext = 7001
          TabOrder = 1
          OnClick = btMONEDAClick
          OnExit = edCVE_MONEDAExit
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
        object edMAX_PZO_DISP: TInterEdit
          Tag = 18
          Left = 545
          Top = 14
          Width = 60
          Height = 20
          HelpContext = 8011
          Prefijo = '1'
          Contrato = -1
          TipoReader = trEntero
          OnExit = edMAX_PZO_DISPExit
          DisplayMask = '###0'
          MaxLength = 5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 4
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = True
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edMAX_DIAS_DISPON: TInterEdit
          Tag = 18
          Left = 545
          Top = 42
          Width = 60
          Height = 20
          HelpContext = 8021
          Prefijo = '1'
          Contrato = -1
          TipoReader = trEntero
          OnExit = edMAX_DIAS_DISPONExit
          DisplayMask = '###0'
          MaxLength = 5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 9
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = True
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edMAX_TASA: TInterEdit
          Tag = 18
          Left = 545
          Top = 68
          Width = 60
          Height = 20
          HelpContext = 8031
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edMAX_TASAExit
          DisplayMask = '###0.0000'
          MaxLength = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 15
          UseReType = False
          UseSep = True
          UseDisplay = False
          PositiveOnly = True
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object cbMAX_TASA: TCheckBox
          Tag = 18
          Left = 430
          Top = 70
          Width = 115
          Height = 17
          HelpContext = 8030
          Caption = 'Tasa Max. a Cobrar'
          TabOrder = 14
          OnClick = cbMAX_TASAClick
          OnExit = cbMAX_TASAExit
        end
        object cbMAX_DIAS_DISPON: TCheckBox
          Tag = 18
          Left = 430
          Top = 44
          Width = 115
          Height = 17
          HelpContext = 8020
          Caption = 'Plazo Máx. a Disp.'
          TabOrder = 8
          OnClick = cbMAX_DIAS_DISPONClick
          OnExit = cbMAX_DIAS_DISPONExit
        end
        object cbMAX_PZO_DISP: TCheckBox
          Tag = 18
          Left = 430
          Top = 15
          Width = 115
          Height = 17
          HelpContext = 8010
          Caption = 'Plazo de Disp.'
          TabOrder = 3
          OnClick = cbMAX_PZO_DISPClick
          OnExit = cbMAX_PZO_DISPExit
        end
        object cbCVE_SUB_TIP_COB: TComboBox
          Tag = 18
          Left = 511
          Top = 106
          Width = 95
          Height = 21
          Hint = 'Tipo de cobranza anticipada'
          HelpContext = 8120
          Style = csDropDownList
          ItemHeight = 13
          ParentShowHint = False
          ShowHint = True
          TabOrder = 19
          OnExit = cbCVE_SUB_TIP_COBExit
          Items.Strings = (
            'Acortar Plazo'
            'Disminuir Monto')
        end
        object btnCREDITO_MARCO: TBitBtn
          Tag = 18
          Left = 582
          Top = 155
          Width = 22
          Height = 20
          HelpContext = 9006
          TabOrder = 27
          OnClick = btnCREDITO_MARCOClick
          OnExit = btnCREDITO_MARCOExit
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
        object edID_CREDITO_MARCO: TEdit
          Left = 503
          Top = 155
          Width = 76
          Height = 21
          HelpContext = 9005
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 26
          OnExit = edID_CREDITO_MARCOExit
        end
        object edROE_BRUTA: TInterEdit
          Tag = 18
          Left = 62
          Top = 131
          Width = 61
          Height = 20
          Hint = 'No aplica para Refinanciamiento'
          HelpContext = 8201
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edROE_BRUTAExit
          DisplayMask = '###0.0000'
          MaxLength = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 20
          UseReType = False
          UseSep = False
          UseDisplay = False
          PositiveOnly = True
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edROE_NETA: TInterEdit
          Tag = 18
          Left = 176
          Top = 131
          Width = 61
          Height = 20
          Hint = 'No aplica para Refinanciamiento'
          HelpContext = 8301
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edROE_NETAExit
          DisplayMask = '###0.0000'
          MaxLength = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 21
          UseReType = False
          UseSep = False
          UseDisplay = False
          PositiveOnly = True
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edPCT_REQ_CAP_MER: TInterEdit
          Tag = 18
          Left = 308
          Top = 131
          Width = 61
          Height = 20
          Hint = 'No aplica para Refinanciamiento'
          HelpContext = 8401
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edPCT_REQ_CAP_MERExit
          DisplayMask = '###0.0000'
          MaxLength = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 22
          UseReType = False
          UseSep = False
          UseDisplay = False
          PositiveOnly = True
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edPCT_REQ_CAP_CRE: TInterEdit
          Tag = 18
          Left = 433
          Top = 131
          Width = 61
          Height = 20
          Hint = 'No aplica para Refinanciamiento'
          HelpContext = 8501
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edPCT_REQ_CAP_CREExit
          DisplayMask = '###0.0000'
          MaxLength = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 23
          UseReType = False
          UseSep = False
          UseDisplay = False
          PositiveOnly = True
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object BitBtn1: TBitBtn
          Tag = 18
          Left = 174
          Top = 203
          Width = 22
          Height = 20
          HelpContext = 9201
          TabOrder = 34
          OnClick = BitBtn1Click
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
        object edDESC_TIPO_ALTA: TEdit
          Tag = 512
          Left = 198
          Top = 203
          Width = 158
          Height = 21
          HelpContext = 9202
          Color = clBtnFace
          TabOrder = 35
          OnExit = edDESC_TIPO_ALTAExit
        end
        object edCVE_TIPO_ALTA: TEdit
          Tag = 18
          Left = 100
          Top = 203
          Width = 73
          Height = 21
          HelpContext = 9200
          CharCase = ecUpperCase
          TabOrder = 33
          OnExit = edCVE_TIPO_ALTAExit
        end
        object edPCT_CAPITALIZ: TInterEdit
          Tag = 18
          Left = 541
          Top = 131
          Width = 63
          Height = 20
          Hint = 'No aplica para Refinanciamiento'
          HelpContext = 8601
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edPCT_CAPITALIZExit
          DisplayMask = '###0.0000'
          MaxLength = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 24
          UseReType = False
          UseSep = False
          UseDisplay = False
          PositiveOnly = True
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edID_AVAL_GOB: TEdit
          Tag = 18
          Left = 100
          Top = 179
          Width = 73
          Height = 21
          HelpContext = 9100
          CharCase = ecUpperCase
          TabOrder = 28
          OnExit = edID_AVAL_GOBExit
        end
        object chkB_HIT_SIC: TCheckBox
          Tag = 18
          Left = 134
          Top = 267
          Width = 52
          Height = 17
          HelpContext = 9260
          Caption = 'Hit SIC'
          TabOrder = 43
          OnExit = chkB_HIT_SICExit
        end
        object edNO_CONSUL_BURO: TInterEdit
          Tag = 18
          Left = 462
          Top = 265
          Width = 70
          Height = 20
          Hint = 'No aplica para Refinanciamiento'
          HelpContext = 9270
          TabStop = False
          Prefijo = '1'
          Contrato = -1
          TipoReader = trDinero
          OnExit = edNO_CONSUL_BUROExit
          DisplayMask = '###############0'
          MaxLength = 16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 46
          UseReType = False
          UseSep = False
          UseDisplay = False
          PositiveOnly = True
          ColorPos = clBtnText
          ColorNeg = clRed
        end
        object edCVE_PRODUCTO_BCA: TEdit
          Tag = 530
          Left = 100
          Top = 289
          Width = 73
          Height = 21
          HelpContext = 9300
          CharCase = ecUpperCase
          Color = clWhite
          TabOrder = 47
          OnExit = edCVE_PRODUCTO_BCAExit
        end
        object btnCVE_PRODUCTO_BCA: TBitBtn
          Tag = 18
          Left = 174
          Top = 290
          Width = 22
          Height = 20
          HelpContext = 9301
          TabOrder = 48
          OnClick = btnCVE_PRODUCTO_BCAClick
          OnExit = edCVE_PRODUCTO_BCAExit
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
        object edDESC_PROD_BCA: TEdit
          Tag = 512
          Left = 198
          Top = 289
          Width = 403
          Height = 21
          HelpContext = 9302
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 49
          OnExit = edDESC_PROD_BCAExit
        end
        object edPeriodicidad_CAT: TEdit
          Tag = 530
          Left = 100
          Top = 315
          Width = 73
          Height = 21
          HelpContext = 9400
          TabOrder = 50
          OnExit = edPeriodicidad_CATExit
        end
        object btnPeriodicidad_CAT: TBitBtn
          Tag = 18
          Left = 175
          Top = 315
          Width = 22
          Height = 20
          HelpContext = 9401
          TabOrder = 51
          OnClick = btnPeriodicidad_CATClick
          OnExit = edPeriodicidad_CATExit
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
        object edPeriodicidad_Interes: TEdit
          Tag = 530
          Left = 400
          Top = 315
          Width = 73
          Height = 21
          HelpContext = 9450
          TabOrder = 53
          OnExit = edPeriodicidad_InteresExit
        end
        object edDesc_Periodicidad_Interes: TEdit
          Tag = 512
          Left = 496
          Top = 315
          Width = 104
          Height = 21
          HelpContext = 9452
          Color = clBtnFace
          TabOrder = 55
        end
        object btnPeriodicidad_Interes: TBitBtn
          Tag = 18
          Left = 473
          Top = 315
          Width = 22
          Height = 20
          HelpContext = 9451
          TabOrder = 54
          OnClick = btnPeriodicidad_InteresClick
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
        object EdCod_CNBV: TEdit
          Tag = 18
          Left = 414
          Top = 203
          Width = 190
          Height = 21
          HelpContext = 9250
          CharCase = ecUpperCase
          TabOrder = 36
          OnExit = EdCod_CNBVExit
        end
        object edDESC_ACRED_GOB: TEdit
          Tag = 512
          Left = 198
          Top = 178
          Width = 230
          Height = 21
          HelpContext = 9102
          Color = clBtnFace
          TabOrder = 30
          OnExit = edDESC_ACRED_GOBExit
        end
        object btnID_ACRED_GOB: TBitBtn
          Tag = 18
          Left = 173
          Top = 179
          Width = 22
          Height = 20
          HelpContext = 9101
          TabOrder = 29
          TabStop = False
          OnClick = btnID_ACRED_GOBClick
          OnExit = edID_AVAL_GOBExit
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
        object edCVE_ANALISTA_RES: TEdit
          Left = 502
          Top = 179
          Width = 77
          Height = 21
          HelpContext = 9150
          CharCase = ecUpperCase
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 31
          OnExit = edCVE_ANALISTA_RESExit
        end
        object btCVE_ANALISTA_RES: TBitBtn
          Tag = 18
          Left = 582
          Top = 180
          Width = 21
          Height = 21
          HelpContext = 9151
          TabOrder = 32
          OnClick = btCVE_ANALISTA_RESClick
          OnExit = btCVE_ANALISTA_RESExit
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
        object chkB_REPORTE_SIC: TCheckBox
          Tag = 18
          Left = 5
          Top = 267
          Width = 98
          Height = 17
          HelpContext = 9259
          Caption = 'Reporta a la SIC'
          TabOrder = 42
          OnExit = chkB_REPORTE_SICExit
        end
        object edF_REP_SIC: TEdit
          Tag = 18
          Left = 286
          Top = 265
          Width = 65
          Height = 21
          HelpContext = 9261
          TabOrder = 44
          OnExit = edF_REP_SICExit
        end
        object edpF_REP_SIC: TInterDateTimePicker
          Left = 351
          Top = 265
          Width = 21
          Height = 20
          HelpContext = 9262
          CalAlignment = dtaLeft
          Date = 41606.6197763194
          Time = 41606.6197763194
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 45
          OnExit = edpF_REP_SICExit
          Edit = edF_REP_SIC
          Formato = dfDate
        end
        object edCve_Tipo_Baja: TEdit
          Tag = 18
          Left = 100
          Top = 228
          Width = 73
          Height = 21
          HelpContext = 9251
          TabOrder = 37
          OnExit = edCve_Tipo_BajaExit
        end
        object btnCve_Tipo_Baja: TBitBtn
          Tag = 18
          Left = 174
          Top = 229
          Width = 22
          Height = 20
          HelpContext = 9252
          TabOrder = 38
          OnClick = btnCve_Tipo_BajaClick
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
        object edDesc_Tipo_Baja: TEdit
          Left = 198
          Top = 228
          Width = 158
          Height = 21
          HelpContext = 9253
          Color = clBtnFace
          TabOrder = 39
          OnExit = edDesc_Tipo_BajaExit
        end
        object edF_Baja: TEdit
          Tag = 18
          Left = 440
          Top = 228
          Width = 139
          Height = 21
          HelpContext = 9254
          TabOrder = 40
          OnExit = edF_BajaExit
        end
        object edpF_Baja: TInterDateTimePicker
          Tag = 18
          Left = 582
          Top = 228
          Width = 21
          Height = 21
          HelpContext = 9255
          CalAlignment = dtaLeft
          Date = 42548.7077829514
          Time = 42548.7077829514
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 41
          OnExit = edpF_BajaExit
          Edit = edF_Baja
          Formato = dfDate
        end
      end
    end
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesEliminar = InterForma1DespuesEliminar
    OnDespuesCancelar = InterForma1DespuesCancelar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesNuevo = InterForma1AntesNuevo
    OnAntesEliminar = InterForma1AntesEliminar
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
    OnDespuesShow = InterForma1DespuesShow
    Left = 277
    Top = 6
  end
  object ilPRODUCTO: TInterLinkit
    OnEjecuta = ilPRODUCTOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 248
    Top = 86
  end
  object ilACREDITADO: TInterLinkit
    OnEjecuta = ilACREDITADOEjecuta
    TipoReader = trTexto
    CharCase = ecNormal
    Left = 136
    Top = 51
  end
  object pmAcreditado: TPopupMenu
    Left = 228
    Top = 46
    object ConsultaSectorPersona1: TMenuItem
      Caption = '&Acceso a Acreditado'
      OnClick = ConsultaSectorPersona1Click
    end
    object CatlogodePersona1: TMenuItem
      Caption = '&Accesos a Personas Corporativas'
      OnClick = CatlogodePersona1Click
    end
    object AccesoProducto1: TMenuItem
      Caption = 'Acceso  &Producto'
      OnClick = AccesoProducto1Click
    end
  end
  object ilTASA_REFER: TInterLinkit
    OnEjecuta = ilTASA_REFEREjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 192
    Top = 132
  end
  object MainMenu1: TMainMenu
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Left = 264
    Top = 544
    object Autorizacin1: TMenuItem
      Caption = 'Datos Complementarios '
      object Documentacin1: TMenuItem
        Caption = '&Documentación'
        OnClick = Documentacin1Click
      end
      object Garantas1: TMenuItem
        Caption = '&Operativas Fdo. Fomento'
        OnClick = Garantas1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Comisiones1: TMenuItem
        Caption = 'Registro de Comisiones'
        OnClick = Comisiones1Click
      end
      object IncrementoDecementodeTemporada1: TMenuItem
        Caption = 'Incremento / Decremento de Temporada'
        OnClick = IncrementoDecementodeTemporada1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object CalificacionCreditoEstructurado1: TMenuItem
        Caption = 'Calificacion Estructurado'
        OnClick = CalificacionCreditoEstructurado1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object DarVistoBuenodelAnalista1: TMenuItem
        Caption = 'Dar Visto Bueno del Analista'
        OnClick = DarVistoBuenodelAnalista1Click
      end
      object VerVistosBuenosdelAnalista1: TMenuItem
        Caption = 'Ver Vistos Buenos del Analista'
        OnClick = VerVistosBuenosdelAnalista1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnComplementos: TMenuItem
        Caption = 'Complementos'
        OnClick = mnComplementosClick
      end
      object EstadosyMunicipios1: TMenuItem
        Caption = 'Estados y Municipios'
        OnClick = EstadosyMunicipios1Click
      end
      object PortafoliodeCrdito1: TMenuItem
        Caption = 'Portafolio de Crédito'
        OnClick = PortafoliodeCrdito1Click
      end
    end
    object Agronegocios1: TMenuItem
      Caption = 'Agronegocios'
      object SIEBAN1: TMenuItem
        Caption = '&SIEBAN'
        OnClick = SIEBAN1Click
      end
    end
  end
  object ilREQ_PCT_CAPITALIZ: TInterLinkit
    OnEjecuta = ilREQ_PCT_CAPITALIZEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 254
    Top = 362
  end
  object ilMONEDA: TInterLinkit
    OnEjecuta = ilMONEDAEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    OnCapture = ilMONEDACapture
    Left = 192
    Top = 83
  end
  object ilORIG_REC: TInterLinkit
    OnEjecuta = ilORIG_RECEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 55
    Top = 97
  end
  object InterLinkit1: TInterLinkit
    OnEjecuta = InterLinkit1Ejecuta
    TipoReader = trTexto
    CharCase = ecNormal
    Left = 528
    Top = 88
  end
  object InterLinkit2: TInterLinkit
    OnEjecuta = InterLinkit2Ejecuta
    TipoReader = trTexto
    CharCase = ecNormal
    Left = 192
    Top = 184
  end
  object spElimina: TStoredProc
    Left = 360
    Top = 549
  end
  object ilCVE_PRODUCTO_BCA: TInterLinkit
    OnEjecuta = ilCVE_PRODUCTO_BCAEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 224
    Top = 325
  end
  object ilDEST_CRED: TInterLinkit
    OnEjecuta = ilDEST_CREDEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 439
    Top = 89
  end
  object InterLinkit3: TInterLinkit
    OnEjecuta = InterLinkit3Ejecuta
    TipoReader = trTexto
    CharCase = ecNormal
    Left = 528
    Top = 152
  end
  object qEstadosMpios: TQuery
    Left = 304
    Top = 544
  end
end
