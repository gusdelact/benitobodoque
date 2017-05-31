object WCrPerfProdUsu: TWCrPerfProdUsu
  Left = 467
  Top = 203
  Width = 502
  Height = 395
  Caption = 'Perfil de Usuario por Producto'
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
  object lbCVE_PRODUCTO: TLabel
    Left = 5
    Top = 7
    Width = 43
    Height = 13
    Caption = 'Producto'
  end
  object lbCVE_GPO_ACCESO: TLabel
    Left = 5
    Top = 31
    Width = 68
    Height = 13
    Caption = 'Grupo Acceso'
  end
  object lbF_ALTA: TLabel
    Left = 5
    Top = 285
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object lbF_MODIFICA: TLabel
    Left = 5
    Top = 307
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object lbCVE_USU_ALTA: TLabel
    Left = 251
    Top = 285
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object lbCVE_USU_MODIFICA: TLabel
    Left = 251
    Top = 307
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object edCVE_PRODUCTO: TEdit
    Tag = 562
    Left = 85
    Top = 3
    Width = 73
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    TabOrder = 0
    OnExit = edCVE_PRODUCTOExit
  end
  object edCVE_GPO_ACCESO: TEdit
    Tag = 562
    Left = 85
    Top = 27
    Width = 73
    Height = 21
    HelpContext = 2001
    CharCase = ecUpperCase
    TabOrder = 3
    OnExit = edCVE_GPO_ACCESOExit
  end
  object rgSIT_PERFIL: TRadioGroup
    Tag = 18
    Left = 5
    Top = 245
    Width = 476
    Height = 31
    HelpContext = 5001
    Caption = 'Situación'
    Columns = 2
    Items.Strings = (
      'Activo'
      'Inactivo')
    TabOrder = 8
    OnExit = rgSIT_PERFILExit
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 53
    Width = 476
    Height = 148
    Caption = 'Configuración de Dispocisión'
    TabOrder = 6
    object lbIMP_MAXIMO_AUT: TLabel
      Left = 8
      Top = 128
      Width = 109
      Height = 13
      Caption = 'Imp Maximo a Autorizar'
    end
    object chB_AUTORIZA_DISP: TCheckBox
      Tag = 18
      Left = 8
      Top = 20
      Width = 100
      Height = 21
      HelpContext = 3001
      Caption = 'Autoriza'
      TabOrder = 0
      OnExit = chB_AUTORIZA_DISPExit
    end
    object chB_CANCELA_DISP: TCheckBox
      Tag = 18
      Left = 8
      Top = 41
      Width = 100
      Height = 21
      HelpContext = 3101
      Caption = 'Cancela'
      TabOrder = 1
      OnExit = chB_CANCELA_DISPExit
    end
    object chB_RECHAZA_DISP: TCheckBox
      Tag = 18
      Left = 176
      Top = 20
      Width = 100
      Height = 21
      HelpContext = 3401
      Caption = 'Rechaza'
      TabOrder = 4
      OnExit = chB_RECHAZA_DISPExit
    end
    object chB_REACTIVA_DISP: TCheckBox
      Tag = 18
      Left = 176
      Top = 41
      Width = 100
      Height = 21
      HelpContext = 3501
      Caption = 'Reactiva'
      TabOrder = 5
      OnExit = chB_REACTIVA_DISPExit
    end
    object IedIMP_MAXIMO_AUT: TInterEdit
      Tag = 18
      Left = 176
      Top = 120
      Width = 137
      Height = 21
      HelpContext = 3601
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = IedIMP_MAXIMO_AUTExit
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 12
      UseReType = True
      UseSep = True
      UseDisplay = True
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object chB_ALTA_PROCAM: TCheckBox
      Tag = 18
      Left = 320
      Top = 41
      Width = 140
      Height = 21
      HelpContext = 3801
      Caption = 'Aplica Alta PROCAMPO'
      TabOrder = 9
      OnExit = chB_ALTA_PROCAMExit
    end
    object chB_CANCELA_SIEB: TCheckBox
      Tag = 18
      Left = 320
      Top = 20
      Width = 121
      Height = 21
      HelpContext = 3701
      Caption = 'Cancela SIEBAN'
      TabOrder = 8
      OnExit = chB_CANCELA_SIEBExit
    end
    object chB_IMPRIME_CTO: TCheckBox
      Tag = 18
      Left = 176
      Top = 63
      Width = 129
      Height = 21
      HelpContext = 3601
      Caption = 'Imprime Contrato'
      TabOrder = 6
      OnExit = chB_IMPRIME_CTOExit
    end
    object chB_MODIF_DISP_AUT: TCheckBox
      Tag = 18
      Left = 9
      Top = 87
      Width = 163
      Height = 21
      HelpContext = 3301
      Caption = 'Modificación Disp. Autorizada'
      TabOrder = 3
      OnExit = chB_MODIF_DISP_AUTExit
    end
    object chB_MOD_COMISION: TCheckBox
      Tag = 18
      Left = 8
      Top = 63
      Width = 153
      Height = 21
      HelpContext = 3201
      Caption = 'Modifica Comision'
      TabOrder = 2
      OnExit = chB_MOD_COMISIONExit
    end
    object chB_MOD_INF_TASA: TCheckBox
      Tag = 18
      Left = 320
      Top = 63
      Width = 145
      Height = 21
      HelpContext = 3901
      Caption = 'Modifica Informacion Tasa'
      TabOrder = 10
      OnExit = chB_MOD_INF_TASAExit
    end
    object chB_Autoriza_CTas: TCheckBox
      Tag = 18
      Left = 176
      Top = 87
      Width = 129
      Height = 21
      HelpContext = 3610
      Caption = 'Autoriza Cambio Tasa'
      TabOrder = 7
      OnExit = chB_Autoriza_CTasExit
    end
    object chB_Cancela_CTas: TCheckBox
      Tag = 18
      Left = 320
      Top = 87
      Width = 129
      Height = 21
      HelpContext = 3910
      Caption = 'Cancela Cambio Tasa'
      TabOrder = 11
      OnExit = chB_Cancela_CTasExit
    end
  end
  object GroupBox2: TGroupBox
    Left = 5
    Top = 202
    Width = 476
    Height = 41
    Caption = 'Configuración Cobranza'
    TabOrder = 7
    object chB_APLI_COBRANZA: TCheckBox
      Tag = 18
      Left = 16
      Top = 17
      Width = 120
      Height = 17
      HelpContext = 4001
      Caption = 'Aplica Cobranza'
      TabOrder = 0
      OnExit = chB_APLI_COBRANZAExit
    end
    object chB_CANCELA_COB: TCheckBox
      Tag = 18
      Left = 176
      Top = 17
      Width = 120
      Height = 17
      HelpContext = 4101
      Caption = 'Cancela Cobranza'
      TabOrder = 1
      OnExit = chB_CANCELA_COBExit
    end
  end
  object PnDatos: TPanel
    Left = -3
    Top = 327
    Width = 484
    Height = 21
    TabOrder = 13
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
  object btnCVE_GPO_ACCESO: TBitBtn
    Tag = 50
    Left = 160
    Top = 27
    Width = 22
    Height = 20
    HelpContext = 2002
    TabOrder = 4
    TabStop = False
    OnClick = btnCVE_GPO_ACCESOClick
    OnExit = edCVE_GPO_ACCESOExit
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
  object edNOM_GPO_ACCESO: TEdit
    Left = 183
    Top = 27
    Width = 289
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 5
  end
  object edDESC_PRODUCTO: TEdit
    Left = 183
    Top = 3
    Width = 289
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 2
  end
  object btPRODUCTO: TBitBtn
    Tag = 18
    Left = 160
    Top = 3
    Width = 22
    Height = 20
    HelpContext = 1002
    TabOrder = 1
    OnClick = btPRODUCTOClick
    OnExit = edCVE_PRODUCTOExit
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
  object edF_MODIFICA: TEdit
    Left = 85
    Top = 303
    Width = 140
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 11
  end
  object edF_ALTA: TEdit
    Left = 85
    Top = 281
    Width = 140
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 9
  end
  object edCVE_USU_MODIFICA: TEdit
    Left = 374
    Top = 303
    Width = 96
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 12
  end
  object edCVE_USU_ALTA: TEdit
    Left = 374
    Top = 281
    Width = 96
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 10
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
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
    Left = 271
    Top = 7
  end
  object ilPRODUCTO: TInterLinkit
    Control = edCVE_PRODUCTO
    OnEjecuta = ilPRODUCTOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilPRODUCTOCapture
    Left = 200
  end
  object ilACCESO: TInterLinkit
    Control = edCVE_GPO_ACCESO
    OnEjecuta = ilACCESOEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilACCESOCapture
    Left = 208
    Top = 32
  end
end
