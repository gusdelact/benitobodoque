object WCrProcampo: TWCrProcampo
  Left = 261
  Top = 71
  Width = 677
  Height = 338
  Caption = 'PROCAMPO'
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
    Top = 45
    Width = 54
    Height = 13
    Caption = 'Disposición'
  end
  object lbCVE_SUB_DIVISION: TLabel
    Left = 8
    Top = 83
    Width = 59
    Height = 13
    Caption = 'Sub División'
  end
  object lbNUM_HECTAREAS: TLabel
    Left = 8
    Top = 110
    Width = 84
    Height = 13
    Caption = 'No. de Hectáreas'
  end
  object lbSUBSIDIO_HECTAR: TLabel
    Left = 8
    Top = 134
    Width = 89
    Height = 13
    Caption = 'SubSidio Hectárea'
  end
  object lbCUOTA_CREDITO: TLabel
    Left = 8
    Top = 158
    Width = 79
    Height = 13
    Caption = 'Cuota de Crédito'
  end
  object lbFONDO_CONTINGEN: TLabel
    Left = 8
    Top = 182
    Width = 95
    Height = 13
    Caption = 'Fondo Contingencia'
  end
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 112
    Height = 13
    Caption = 'Autorización / Producto'
  end
  object Label2: TLabel
    Left = 240
    Top = 45
    Width = 37
    Height = 13
    Caption = 'F. Inicio'
  end
  object Label3: TLabel
    Left = 356
    Top = 45
    Width = 83
    Height = 13
    Caption = 'Plazo Disp. (días)'
  end
  object Label4: TLabel
    Left = 518
    Top = 45
    Width = 70
    Height = 13
    Caption = 'F. Vencimiento'
  end
  object Label6: TLabel
    Left = 240
    Top = 134
    Width = 75
    Height = 13
    Caption = 'Global SubSidio'
  end
  object Label7: TLabel
    Left = 240
    Top = 158
    Width = 89
    Height = 13
    Caption = 'Global Cuota Créd.'
  end
  object Label8: TLabel
    Left = 240
    Top = 182
    Width = 63
    Height = 13
    Caption = 'Global Fondo'
  end
  object lbSITUACION: TLabel
    Left = 468
    Top = 182
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
  object lbSIT_PROCAMPO: TLabel
    Tag = 18
    Left = 531
    Top = 182
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
  object edID_CREDITO: TEdit
    Left = 131
    Top = 41
    Width = 100
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object edCVE_SUB_DIVISION: TEdit
    Tag = 530
    Left = 131
    Top = 79
    Width = 73
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    TabOrder = 0
    OnExit = edCVE_SUB_DIVISIONExit
  end
  object MsgPanel: TPanel
    Left = 6
    Top = 264
    Width = 660
    Height = 20
    TabOrder = 7
  end
  object PnDatos: TPanel
    Left = 6
    Top = 284
    Width = 660
    Height = 18
    TabOrder = 8
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
  object edNOMBRE_SUBDIVISION: TEdit
    Left = 233
    Top = 79
    Width = 430
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 9
  end
  object btSUBDIVISION: TBitBtn
    Tag = 18
    Left = 208
    Top = 79
    Width = 22
    Height = 20
    HelpContext = 1002
    TabOrder = 1
    OnClick = btSUBDIVISIONClick
    OnExit = edCVE_SUB_DIVISIONExit
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
  object edPRODUCTO: TEdit
    Left = 233
    Top = 12
    Width = 120
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
  end
  object edDESC_PRODUCTO: TEdit
    Left = 355
    Top = 12
    Width = 308
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 11
  end
  object edCONTRATO: TEdit
    Left = 131
    Top = 12
    Width = 100
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 12
  end
  object edF_INICIO: TEdit
    Left = 283
    Top = 41
    Width = 70
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 13
  end
  object edF_VTO: TEdit
    Left = 593
    Top = 41
    Width = 70
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 14
  end
  object edIMP_GSUBSIDIO: TInterEdit
    Left = 355
    Top = 130
    Width = 100
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
    TabOrder = 15
    ReadOnly = True
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edIMP_GCUOTA_CRED: TInterEdit
    Left = 355
    Top = 154
    Width = 100
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
    TabOrder = 16
    ReadOnly = True
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edIMP_GFONDO_CONT: TInterEdit
    Left = 355
    Top = 178
    Width = 100
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
    TabOrder = 17
    ReadOnly = True
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edPLAZO: TInterEdit
    Left = 459
    Top = 41
    Width = 54
    Height = 21
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    DisplayMask = '000'
    MaxLength = 6
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 18
    ReadOnly = True
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 200
    Width = 657
    Height = 64
    Caption = 'Registro'
    TabOrder = 19
    object lbF_ALTA: TLabel
      Left = 16
      Top = 42
      Width = 45
      Height = 13
      Caption = 'F. de Alta'
    end
    object lbF_MODIF: TLabel
      Left = 234
      Top = 41
      Width = 52
      Height = 13
      Caption = 'F. Modifica'
    end
    object lbUSUA_ALTA: TLabel
      Left = 16
      Top = 17
      Width = 43
      Height = 13
      Caption = 'Usu. Alta'
    end
    object lbUSUA_MODIF: TLabel
      Left = 234
      Top = 16
      Width = 65
      Height = 13
      Caption = 'Usu. Modifica'
    end
    object lbUSUA_AUTOR: TLabel
      Left = 452
      Top = 16
      Width = 63
      Height = 13
      Caption = 'Usu. Autoriza'
    end
    object lbF_AUTOR: TLabel
      Left = 452
      Top = 41
      Width = 50
      Height = 13
      Caption = 'F. Autoriza'
    end
    object edF_ALTA: TEdit
      Left = 93
      Top = 38
      Width = 130
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edF_MODIF: TEdit
      Left = 317
      Top = 37
      Width = 130
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edCVE_USUA_ALTA: TEdit
      Left = 93
      Top = 13
      Width = 130
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edCVE_USUA_MODIF: TEdit
      Left = 317
      Top = 12
      Width = 130
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object edCVE_USUA_AUTOR: TEdit
      Left = 521
      Top = 12
      Width = 130
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edF_AUTOR: TEdit
      Left = 521
      Top = 37
      Width = 130
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
  end
  object edFONDO_CONTINGEN: TInterEdit
    Tag = 18
    Left = 131
    Top = 178
    Width = 100
    Height = 21
    HelpContext = 5001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edFONDO_CONTINGENExit
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 5
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edCUOTA_CREDITO: TInterEdit
    Tag = 18
    Left = 131
    Top = 154
    Width = 100
    Height = 21
    HelpContext = 4001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edCUOTA_CREDITOExit
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 4
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edSUBSIDIO_HECTAR: TInterEdit
    Tag = 18
    Left = 131
    Top = 130
    Width = 100
    Height = 21
    HelpContext = 3001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edSUBSIDIO_HECTARExit
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 3
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edNUM_HECTAREAS: TInterEdit
    Tag = 18
    Left = 131
    Top = 106
    Width = 100
    Height = 21
    HelpContext = 2001
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edNUM_HECTAREASExit
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 2
    UseReType = True
    UseSep = True
    UseDisplay = True
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnAntesAceptar = InterForma1AntesAceptar
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
    Left = 146
    Top = 10
  end
  object ilSUBDIVISION: TInterLinkit
    Control = edCVE_SUB_DIVISION
    OnEjecuta = ilSUBDIVISIONEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 248
    Top = 72
  end
end
