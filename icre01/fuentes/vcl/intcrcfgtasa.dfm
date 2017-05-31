object WCrCfgTasa: TWCrCfgTasa
  Left = 250
  Top = 150
  Width = 561
  Height = 445
  Caption = 'Tasas de Interés'
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
  object lblCVE_TASA_INDICAD: TLabel
    Left = 5
    Top = 12
    Width = 24
    Height = 13
    Caption = 'Tasa'
  end
  object lblCVE_TASA_BASE: TLabel
    Left = 5
    Top = 39
    Width = 51
    Height = 13
    Caption = 'Tasa Base'
  end
  object Label3: TLabel
    Left = 7
    Top = 316
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object Label10: TLabel
    Left = 7
    Top = 339
    Width = 73
    Height = 13
    Caption = 'Fecha Modifica'
  end
  object Label12: TLabel
    Left = 287
    Top = 316
    Width = 57
    Height = 13
    Caption = 'Usuario Alta'
  end
  object Label13: TLabel
    Left = 287
    Top = 339
    Width = 79
    Height = 13
    Caption = 'Usuario Modifica'
  end
  object rgCVE_VALOR_TASA: TRadioGroup
    Tag = 18
    Left = 4
    Top = 191
    Width = 515
    Height = 34
    HelpContext = 1901
    Caption = 'Valores de tasa a considerar'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Publicados'
      'Vigentes'
      'Publicados y vigente al inicio')
    TabOrder = 7
    TabStop = True
    OnExit = rgCVE_VALOR_TASAExit
  end
  object gbIntegracion: TGroupBox
    Tag = 18
    Left = 4
    Top = 97
    Width = 515
    Height = 51
    Caption = 'Rango de Integración'
    TabOrder = 5
    TabStop = True
    object chbxB_DIA_NATURAL: TCheckBox
      Tag = 18
      Left = 178
      Top = 8
      Width = 327
      Height = 17
      HelpContext = 1501
      TabStop = False
      Caption = 
        'Considerar días calendario (sólo si el rango se compone de días)' +
        '.'
      Enabled = False
      TabOrder = 2
    end
    object chbxB_ULTIMO_CICLO: TCheckBox
      Tag = 18
      Left = 178
      Top = 27
      Width = 175
      Height = 17
      HelpContext = 1601
      TabStop = False
      Caption = 'Considerar último ciclo completo.'
      Enabled = False
      TabOrder = 3
    end
    object edNUM_PLAZO_PER: TEdit
      Tag = 18
      Left = 17
      Top = 18
      Width = 40
      Height = 21
      HelpContext = 1301
      TabOrder = 0
      OnExit = edNUM_PLAZO_PERExit
      OnKeyPress = edSOBRETASAKeyPress
    end
    object cbCVE_PERIODO: TComboBox
      Tag = 18
      Left = 66
      Top = 19
      Width = 80
      Height = 21
      HelpContext = 1401
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = cbCVE_PERIODOChange
      OnExit = cbCVE_PERIODOExit
      Items.Strings = (
        'Dias'
        'Semanas'
        'Meses')
    end
  end
  object PnDatos: TPanel
    Left = 0
    Top = 388
    Width = 524
    Height = 21
    TabOrder = 17
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
  object edCVE_TASA_INDICAD: TEdit
    Tag = 562
    Left = 71
    Top = 5
    Width = 80
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 0
    OnExit = edCVE_TASA_INDICADExit
  end
  object btnCVE_TASA_INDICAD: TBitBtn
    Tag = 50
    Left = 157
    Top = 4
    Width = 22
    Height = 22
    HelpContext = 1002
    TabOrder = 1
    OnClick = btnCVE_TASA_INDICADClick
    OnExit = edCVE_TASA_INDICADExit
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
  object edDESC_TASA_INDICAD: TEdit
    Tag = 20
    Left = 181
    Top = 5
    Width = 337
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 18
  end
  object gbPtosAdic: TGroupBox
    Tag = 18
    Left = 5
    Top = 230
    Width = 284
    Height = 41
    Caption = 'Puntos Adicionales'
    TabOrder = 8
    TabStop = True
    object Label5: TLabel
      Left = 8
      Top = 19
      Width = 44
      Height = 13
      Caption = 'Operador'
    end
    object Label6: TLabel
      Left = 156
      Top = 19
      Width = 48
      Height = 13
      Caption = 'Sobretasa'
    end
    object cbOperador: TComboBox
      Tag = 18
      Left = 87
      Top = 14
      Width = 50
      Height = 21
      HelpContext = 2001
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnExit = edSOBRETASAExit
      Items.Strings = (
        ''
        '+'
        '-'
        '*'
        '/')
    end
    object edSOBRETASA: TEdit
      Tag = 18
      Left = 213
      Top = 13
      Width = 60
      Height = 21
      HelpContext = 2102
      TabOrder = 1
      OnExit = edSOBRETASAExit
      OnKeyPress = edSOBRETASAKeyPress
    end
  end
  object edCVE_TASA_BASE: TEdit
    Tag = 562
    Left = 72
    Top = 32
    Width = 80
    Height = 21
    HelpContext = 1101
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 2
    OnExit = edCVE_TASA_BASEExit
  end
  object btnCVE_TASA_BASE: TBitBtn
    Tag = 50
    Left = 157
    Top = 34
    Width = 22
    Height = 22
    HelpContext = 1102
    TabOrder = 3
    OnClick = btnCVE_TASA_BASEClick
    OnExit = edCVE_TASA_BASEExit
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
  object edDESC_TASA_BASE: TEdit
    Tag = 20
    Left = 181
    Top = 33
    Width = 337
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 19
  end
  object rgCVE_OPERACION: TRadioGroup
    Tag = 18
    Left = 3
    Top = 59
    Width = 516
    Height = 34
    HelpContext = 1201
    Caption = 'Operación'
    Columns = 6
    ItemIndex = 0
    Items.Strings = (
      'Menor'
      'Mayor'
      'Promedio'
      'Inicio'
      'Final'
      'Tasa Equiv.')
    TabOrder = 4
    TabStop = True
    OnClick = rgCVE_OPERACIONClick
    OnExit = rgCVE_OPERACIONExit
  end
  object rgSIT_CFG_TASA: TRadioGroup
    Tag = 18
    Left = 296
    Top = 274
    Width = 223
    Height = 34
    HelpContext = 2201
    Caption = 'Situación'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Activo'
      'Inactivo')
    TabOrder = 11
    TabStop = True
    OnExit = rgSIT_CFG_TASAExit
  end
  object edF_MODIFICA: TEdit
    Tag = 20
    Left = 93
    Top = 336
    Width = 107
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 14
  end
  object edF_ALTA: TEdit
    Tag = 20
    Left = 93
    Top = 312
    Width = 107
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 12
  end
  object edCVE_USU_MODIFICA: TEdit
    Tag = 20
    Left = 403
    Top = 335
    Width = 107
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 15
  end
  object edCVE_USU_ALTA: TEdit
    Tag = 20
    Left = 403
    Top = 312
    Width = 107
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 13
  end
  object btnConfiguraTasasMultiples: TBitBtn
    Tag = 18
    Left = 296
    Top = 235
    Width = 223
    Height = 35
    Caption = 'Configurar tasas múltiples'
    Enabled = False
    TabOrder = 9
    OnClick = btnConfiguraTasasMultiplesClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
      FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
      990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
      990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
      FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
      00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
      00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
      00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
      03FF33337FFF77777333333300000333333F3333777773333333}
    NumGlyphs = 2
  end
  object MsgPanel: TPanel
    Left = 0
    Top = 361
    Width = 524
    Height = 27
    TabOrder = 16
  end
  object gbxParamCapit: TGroupBox
    Left = 4
    Top = 152
    Width = 515
    Height = 36
    Caption = 'Parámetros de capitalización'
    TabOrder = 6
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 142
      Height = 13
      Caption = 'Días de Plazo del Instrumento'
    end
    object Label7: TLabel
      Left = 264
      Top = 16
      Width = 132
      Height = 13
      Caption = 'Días del Periodo de Cálculo'
    end
    object ied_Plazo_Inst_Equiv: TInterEdit
      Tag = 18
      Left = 158
      Top = 10
      Width = 65
      Height = 21
      HelpContext = 1701
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = ied_Plazo_Inst_EquivExit
      DisplayMask = '#,###'
      MaxLength = 12
      TabOrder = 0
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object ied_Num_Dias_Equiv: TInterEdit
      Tag = 18
      Left = 406
      Top = 10
      Width = 65
      Height = 21
      HelpContext = 1801
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = ied_Num_Dias_EquivExit
      DisplayMask = '#,###'
      MaxLength = 12
      TabOrder = 1
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object gbValorTasa: TGroupBox
    Left = 5
    Top = 274
    Width = 285
    Height = 34
    Caption = 'Valor de la tasa:'
    TabOrder = 10
    object lblValorTasa: TLabel
      Left = 40
      Top = 16
      Width = 193
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '   '
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
    Left = 484
    Top = 355
  end
  object ilCVE_TASA_BASE: TInterLinkit
    Control = edCVE_TASA_BASE
    OnEjecuta = ilCVE_TASA_BASEEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCVE_TASA_INDICADCapture
    Left = 344
    Top = 26
  end
  object ilCVE_TASA_INDICAD: TInterLinkit
    Control = edCVE_TASA_INDICAD
    OnEjecuta = ilCVE_TASA_INDICADEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCVE_TASA_INDICADCapture
    Left = 344
    Top = 65535
  end
  object stpCalculaTasa: TStoredProc
    DatabaseName = 'DCORP'
    StoredProcName = 'PKGCRCREDITOO1.STPCALCULA_TASA'
    Left = 208
    Top = 315
    ParamData = <
      item
        DataType = ftString
        Name = 'PECVE_TASA_INDICAD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PECVE_TASA_BASE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PEF_CALCULO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PSVALOR_TASA'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'PSRESULTADO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'PSTX_RESULTADO'
        ParamType = ptOutput
      end>
  end
end
