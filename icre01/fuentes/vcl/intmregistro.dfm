object wMRegistro: TwMRegistro
  Left = 349
  Top = 102
  Width = 571
  Height = 600
  Caption = 'Registro de Garantías'
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
  object Label3: TLabel
    Left = 0
    Top = 89
    Width = 39
    Height = 13
    Caption = 'Moneda'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 378
    Top = 4
    Width = 60
    Height = 13
    Caption = 'No. Solicitud'
  end
  object Label4: TLabel
    Left = 0
    Top = 47
    Width = 81
    Height = 13
    Caption = 'Tipo de Garantía'
    WordWrap = True
  end
  object Label5: TLabel
    Left = 0
    Top = 172
    Width = 58
    Height = 13
    Caption = 'Comentarios'
  end
  object Label1: TLabel
    Left = 0
    Top = 68
    Width = 78
    Height = 13
    Caption = 'F. última revisión'
  end
  object Label7: TLabel
    Left = 208
    Top = 68
    Width = 90
    Height = 13
    Caption = 'Grado de prelación'
  end
  object Label8: TLabel
    Left = 0
    Top = 131
    Width = 79
    Height = 13
    Caption = 'Valor Ponderado'
  end
  object Label15: TLabel
    Left = 208
    Top = 110
    Width = 153
    Height = 13
    Caption = 'Proporción Garantía-Disposición'
  end
  object Label16: TLabel
    Left = 0
    Top = 110
    Width = 95
    Height = 13
    Caption = 'Valor de la Garantía'
  end
  object Label17: TLabel
    Left = 0
    Top = 26
    Width = 66
    Height = 13
    Caption = 'Id. Acreditado'
  end
  object Label6: TLabel
    Left = 392
    Top = 68
    Width = 65
    Height = 13
    Caption = '%Garantizado'
    Visible = False
  end
  object Label18: TLabel
    Left = 0
    Top = 155
    Width = 99
    Height = 13
    Caption = 'Registro Único de G.'
  end
  object PnlMsg: TPanel
    Left = 0
    Top = 519
    Width = 553
    Height = 21
    TabOrder = 28
  end
  object PnDatos: TPanel
    Left = 0
    Top = 540
    Width = 553
    Height = 21
    TabOrder = 29
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
      Left = 262
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
      Left = 262
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
      Left = 326
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
      Left = 326
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
  object GroupBox4: TGroupBox
    Left = 0
    Top = 462
    Width = 553
    Height = 58
    Caption = 'Registro'
    TabOrder = 27
    object lbF_ALTA: TLabel
      Left = 25
      Top = 37
      Width = 51
      Height = 13
      Caption = 'Fecha Alta'
    end
    object lbF_MODIF: TLabel
      Left = 296
      Top = 37
      Width = 73
      Height = 13
      Caption = 'Fecha Modifica'
    end
    object lbUSUA_ALTA: TLabel
      Left = 25
      Top = 16
      Width = 57
      Height = 13
      Caption = 'Usuario Alta'
    end
    object lbUSUA_MODIF: TLabel
      Left = 296
      Top = 16
      Width = 79
      Height = 13
      Caption = 'Usuario Modifica'
    end
    object edF_ALTA: TEdit
      Left = 101
      Top = 33
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edF_MODIFICA: TEdit
      Left = 437
      Top = 33
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edCVE_USU_ALTA: TEdit
      Left = 101
      Top = 12
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      MaxLength = 8
      ReadOnly = True
      TabOrder = 0
    end
    object edCVE_USU_MODIF: TEdit
      Left = 437
      Top = 12
      Width = 110
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      MaxLength = 8
      ReadOnly = True
      TabOrder = 2
    end
  end
  object rgSITUACION: TRadioGroup
    Tag = 18
    Left = 0
    Top = 410
    Width = 553
    Height = 33
    Hint = 'Situación del registro de garantía'
    HelpContext = 5000
    Caption = 'Situación'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Activa'
      'Inactiva')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 24
    OnExit = rgSITUACIONExit
  end
  object btCVE_MONEDA: TBitBtn
    Tag = 18
    Left = 182
    Top = 85
    Width = 21
    Height = 21
    HelpContext = 1501
    TabOrder = 12
    OnClick = btCVE_MONEDAClick
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
  object edNOM_MONEDA: TEdit
    Left = 208
    Top = 85
    Width = 345
    Height = 21
    Hint = 'Descripción del tipo de garantía'
    TabStop = False
    Color = clBtnFace
    TabOrder = 13
  end
  object edCVE_MONEDA: TInterEdit
    Tag = 530
    Left = 101
    Top = 85
    Width = 80
    Height = 21
    Hint = 'Moneda en que se encuentra valuada la garantía'
    HelpContext = 1500
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    OnExit = edCVE_MONEDAExit
    MaxLength = 3
    TabOrder = 11
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edID_SOLICITUD: TInterEdit
    Left = 473
    Top = 0
    Width = 80
    Height = 21
    Hint = 'Identificador del registro de garantía'
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    MaxLength = 6
    Color = clBtnFace
    TabOrder = 0
    ReadOnly = True
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clRed
    ColorNeg = clRed
  end
  object edCVE_GARANTIA: TEdit
    Tag = 530
    Left = 101
    Top = 43
    Width = 80
    Height = 21
    Hint = 'Tipo de Garantía'
    HelpContext = 1100
    CharCase = ecUpperCase
    MaxLength = 6
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnExit = edCVE_GARANTIAExit
  end
  object btCVE_GARANTIA: TBitBtn
    Tag = 18
    Left = 182
    Top = 43
    Width = 21
    Height = 21
    HelpContext = 1101
    TabOrder = 5
    OnClick = btCVE_GARANTIAClick
    OnExit = edCVE_GARANTIAExit
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
  object edNOM_CVE_GARANTIA: TEdit
    Left = 208
    Top = 43
    Width = 345
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 6
  end
  object edTX_COMENTARIO: TMemo
    Tag = 18
    Left = 101
    Top = 172
    Width = 452
    Height = 45
    Hint = 'Comentarios para el registro de la garantía'
    HelpContext = 1900
    MaxLength = 150
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
    OnExit = edTX_COMENTARIOExit
  end
  object edF_REVISION_GAR: TEdit
    Tag = 18
    Left = 101
    Top = 64
    Width = 80
    Height = 21
    Hint = 'Fecha de última revisión de la garantía (dd/mm/yyyy)'
    HelpContext = 1300
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnExit = edF_REVISION_GARExit
  end
  object dtpF_REVISION_GAR: TInterDateTimePicker
    Tag = 18
    Left = 182
    Top = 64
    Width = 21
    Height = 21
    Hint = 'dd/mm/yyyy'
    CalAlignment = dtaLeft
    Date = 38166.4080691319
    Time = 38166.4080691319
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    TabStop = False
    Edit = edF_REVISION_GAR
    Formato = dfDate
  end
  object edID_SECUENCIA: TInterEdit
    Tag = 18
    Left = 304
    Top = 64
    Width = 80
    Height = 21
    Hint = 'Grado de prelación de la garantía'
    HelpContext = 1400
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    OnExit = edID_SECUENCIAExit
    DisplayMask = '###,##0'
    MaxLength = 3
    TabOrder = 10
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object rgCVE_TIPO_SEGURO: TRadioGroup
    Left = 0
    Top = 218
    Width = 553
    Height = 34
    Hint = 'Tipo de aplicación de seguro para la garantía'
    Caption = 'Tipo de aplicación de seguro'
    Columns = 4
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Obligatorio'
      'Opcional'
      'Exceptuado'
      'No aplica')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
    OnExit = rgCVE_TIPO_SEGUROExit
  end
  object edVALOR_PONDERADO: TInterEdit
    Left = 101
    Top = 127
    Width = 80
    Height = 21
    Hint = 'Parte proporcional %Cobertura sobre %Garantizado'
    TabStop = False
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edVALOR_PONDERADOExit
    DisplayMask = '###,###,###,##0.00'
    MaxLength = 16
    Color = clBtnFace
    TabOrder = 16
    ReadOnly = True
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 253
    Width = 553
    Height = 61
    Caption = 'Garantía Fiducuaria'
    TabOrder = 21
    object Label9: TLabel
      Left = 8
      Top = 37
      Width = 75
      Height = 13
      Caption = 'No. Fideicomiso'
    end
    object Label10: TLabel
      Left = 206
      Top = 37
      Width = 45
      Height = 13
      Caption = 'Fiduciario'
    end
    object cbxB_APLICA_GAR_FID: TCheckBox
      Tag = 18
      Left = 9
      Top = 16
      Width = 150
      Height = 17
      HelpContext = 2100
      Caption = 'Aplica Garantía Fiducuaria'
      TabOrder = 0
      OnClick = cbxB_APLICA_GAR_FIDClick
      OnExit = cbxB_APLICA_GAR_FIDExit
    end
    object edNOMBRE_FIDUCIARIO: TEdit
      Tag = 18
      Left = 261
      Top = 33
      Width = 287
      Height = 21
      Hint = 'Nombre de Fiduciario'
      HelpContext = 2300
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnExit = edNOMBRE_FIDUCIARIOExit
    end
    object edID_FIDEICOMISO: TEdit
      Tag = 18
      Left = 101
      Top = 33
      Width = 100
      Height = 21
      HelpContext = 2200
      CharCase = ecUpperCase
      TabOrder = 1
      OnExit = edID_FIDEICOMISOExit
      OnKeyPress = edID_FIDEICOMISOKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 314
    Width = 275
    Height = 96
    Caption = 'Registro Público de la Propiedad'
    TabOrder = 22
    object Label11: TLabel
      Left = 8
      Top = 16
      Width = 68
      Height = 13
      Caption = 'No.Inscripción'
    end
    object Label12: TLabel
      Left = 8
      Top = 41
      Width = 78
      Height = 13
      Caption = 'F. de Inscripción'
    end
    object edINSCRIPCION_RPP: TEdit
      Tag = 18
      Left = 101
      Top = 16
      Width = 168
      Height = 21
      Hint = 'Número de inscripción al R.P.P.'
      HelpContext = 3100
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = edINSCRIPCION_RPPChange
      OnExit = edINSCRIPCION_RPPExit
    end
    object edFECHA_INSC_RPP: TEdit
      Tag = 18
      Left = 101
      Top = 37
      Width = 80
      Height = 21
      Hint = 'Fecha de inscripción al R.P.P. (dd/mm/yyyy)'
      HelpContext = 3200
      CharCase = ecUpperCase
      MaxLength = 10
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnExit = edFECHA_INSC_RPPExit
    end
    object idtFECHA_INSC_RPP: TInterDateTimePicker
      Tag = 18
      Left = 182
      Top = 37
      Width = 21
      Height = 21
      Hint = 'dd/mm/yyyy'
      CalAlignment = dtaLeft
      Date = 38166.4080691319
      Time = 38166.4080691319
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TabStop = False
      Edit = edFECHA_INSC_RPP
      Formato = dfDate
    end
    object rgSIT_INSC_RPP: TRadioGroup
      Tag = 18
      Left = 8
      Top = 58
      Width = 261
      Height = 35
      Hint = 'Estado de inscripción al R.P.P.'
      HelpContext = 3300
      Caption = 'Situación de R.P.P.'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Realizado'
        'Pendiente'
        'No Aplica')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = rgSIT_INSC_RPPClick
      OnExit = rgSIT_INSC_RPPExit
    end
  end
  object GroupBox3: TGroupBox
    Left = 278
    Top = 314
    Width = 275
    Height = 96
    Caption = 'Registro Público de Comercio'
    TabOrder = 23
    object Label13: TLabel
      Left = 8
      Top = 16
      Width = 68
      Height = 13
      Caption = 'No.Inscripción'
    end
    object Label14: TLabel
      Left = 8
      Top = 41
      Width = 78
      Height = 13
      Caption = 'F. de Inscripción'
    end
    object edINSCRIPCION_RPC: TEdit
      Tag = 18
      Left = 101
      Top = 16
      Width = 168
      Height = 21
      Hint = 'Número de inscripción al R.P.C.'
      HelpContext = 4100
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = edINSCRIPCION_RPCChange
      OnExit = edINSCRIPCION_RPCExit
    end
    object edFECHA_INSC_RPC: TEdit
      Tag = 18
      Left = 101
      Top = 37
      Width = 80
      Height = 21
      Hint = 'Fecha de inscripción al R.P.C. (dd/mm/yyyy)'
      HelpContext = 4200
      CharCase = ecUpperCase
      MaxLength = 10
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnExit = edFECHA_INSC_RPCExit
    end
    object idtFECHA_INSC_RPC: TInterDateTimePicker
      Tag = 18
      Left = 182
      Top = 37
      Width = 21
      Height = 21
      Hint = 'dd/mm/yyyy'
      CalAlignment = dtaLeft
      Date = 38166.4080691319
      Time = 38166.4080691319
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TabStop = False
      Edit = edFECHA_INSC_RPC
      Formato = dfDate
    end
    object rgSIT_INSC_RPC: TRadioGroup
      Tag = 18
      Left = 8
      Top = 58
      Width = 261
      Height = 35
      Hint = 'Estado de inscripción al R.P.C.'
      HelpContext = 4300
      Caption = 'Situación de R.P.C.'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Realizado'
        'Pendiente'
        'No Aplica')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = rgSIT_INSC_RPCClick
      OnExit = rgSIT_INSC_RPCExit
    end
  end
  object cbxB_INTEG_MASA_GAR: TCheckBox
    Tag = 18
    Left = 208
    Top = 129
    Width = 144
    Height = 17
    Hint = 'Integra masa de garantía'
    HelpContext = 1800
    Caption = 'Integra masa de garantías'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
    OnExit = cbxB_INTEG_MASA_GARExit
  end
  object edVALOR_GARANTIA: TInterEdit
    Tag = 18
    Left = 101
    Top = 106
    Width = 80
    Height = 21
    Hint = 'Importe de la Garantía'
    HelpContext = 1600
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edVALOR_GARANTIAExit
    DisplayMask = '#,###,###,###,##0.00'
    MaxLength = 16
    TabOrder = 14
    CharCase = ecUpperCase
    UseReType = True
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object btClasifica: TBitBtn
    Tag = 17
    Left = 443
    Top = 444
    Width = 110
    Height = 21
    Caption = 'Clasificación'
    TabOrder = 26
    OnClick = btClasificaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
      000333FFF3777777777F3000330FFFFFFF033777FF7F3FF3FF7F07B7030F00F0
      0F0377777F7F7737737F0BBB030FFFFFFF0377777F7F3FFFF37F07B7030F0000
      FF037777737F7777337F3000330FFFFFFF033777337F3FF3FF7F3333330F00F0
      00033333337F7737777F3333330FFFF0FF033FFFFF7F3FF7F3730000030F08F0
      F03377777F7F7737F7330999030FFFF0033377777F7FFFF77333099903000000
      333377777F7777773333099903333333333377777F33FFFFFFF3000003300000
      00337777733777777733333333330CCC033333333333777773333333333330C0
      3333333333333777333333333333330333333333333333733333}
    NumGlyphs = 2
  end
  object btSeguro: TBitBtn
    Tag = 17
    Left = 327
    Top = 444
    Width = 110
    Height = 21
    Caption = 'Seguro'
    TabOrder = 25
    OnClick = btSeguroClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
      555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
      05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
      FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
      FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
      FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
      05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
      555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
      9055575757575757775505050505055505557575757575557555}
    NumGlyphs = 2
  end
  object edID_ACREDITADO: TEdit
    Tag = 562
    Left = 101
    Top = 22
    Width = 80
    Height = 21
    Hint = 'Identificador del Acreditado'
    HelpContext = 1000
    CharCase = ecUpperCase
    TabOrder = 1
    OnExit = edID_ACREDITADOExit
  end
  object btACREDITADO: TBitBtn
    Tag = 50
    Left = 182
    Top = 22
    Width = 21
    Height = 21
    HelpContext = 1001
    TabOrder = 2
    OnClick = btACREDITADOClick
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
  object edNOMBRE_ACRED: TEdit
    Left = 208
    Top = 22
    Width = 345
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object edPCT_GAR_DISP: TEdit
    Left = 472
    Top = 107
    Width = 9
    Height = 21
    TabStop = False
    TabOrder = 30
    Visible = False
  end
  object edPCT_GARANTIZADO: TInterEdit
    Tag = 18
    Left = 465
    Top = 64
    Width = 88
    Height = 21
    Hint = '%Garantizado de la garantía'
    HelpContext = 1200
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    OnExit = edPCT_GARANTIZADOExit
    DisplayMask = '###,###,###,###,##0.0000'
    MaxLength = 8
    TabOrder = 7
    CharCase = ecUpperCase
    Visible = False
    UseReType = False
    UseSep = True
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edPCT_GAR_DISP_2: TEdit
    Tag = 18
    Left = 384
    Top = 106
    Width = 80
    Height = 21
    HelpContext = 1700
    CharCase = ecUpperCase
    MaxLength = 4
    TabOrder = 15
    OnExit = edPCT_GAR_DISP_2Exit
    OnKeyPress = edPCT_GAR_DISP_2KeyPress
  end
  object BitBtn1: TBitBtn
    Tag = 17
    Left = 211
    Top = 444
    Width = 110
    Height = 21
    Caption = 'Ligar Línea'
    TabOrder = 31
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300033300000
      00003777FF377777777707070330FFFFFFF077777F37F3FF3FF707370330F00F
      00F077F77F37F773773707370330FFFFFFF077F77F37F3FFFF3707070330F000
      0FF077777337F777733730003330FFFFFFF037773337F3FF3FF733033330F00F
      0000337FFF37F773777733000330FFFF0FF033777FF7F3FF7F3733007030F08F
      0F03337777F7F7737F7330703700FFFF003337773777FFFF7733307333700000
      0333377FF37777777FFF33073070333000033377F777FF37777F333077000307
      7770333777777F7777773333003300003300333377337777FF77333333333307
      7770333333333377777733333333333000033333333333377773}
    NumGlyphs = 2
  end
  object edFOL_REG_GAR: TEdit
    Tag = 530
    Left = 101
    Top = 150
    Width = 80
    Height = 21
    Hint = 'Tipo de Garantía'
    HelpContext = 1100
    CharCase = ecUpperCase
    MaxLength = 9
    ParentShowHint = False
    ShowHint = True
    TabOrder = 32
  end
  object cbxB_Regulatorio: TCheckBox
    Tag = 18
    Left = 208
    Top = 148
    Width = 97
    Height = 17
    HelpContext = 1800
    Caption = 'Reportes R04'
    Enabled = False
    TabOrder = 18
    OnExit = cbxB_RegulatorioExit
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesEliminar = InterForma1DespuesEliminar
    OnDespuesCancelar = InterForma1DespuesCancelar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesEliminar = InterForma1AntesEliminar
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
    Left = 339
    Top = 65533
  end
  object ilCVE_MONEDA: TInterLinkit
    Control = edCVE_MONEDA
    OnEjecuta = ilCVE_MONEDAEjecuta
    TipoReader = trEntero
    CharCase = ecNormal
    OnCapture = ilCVE_MONEDACapture
    Left = 294
    Top = 81
  end
  object ilCVE_GARANTIA: TInterLinkit
    Control = edCVE_GARANTIA
    OnEjecuta = ilCVE_GARANTIAEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCVE_GARANTIACapture
    Left = 225
    Top = 39
  end
  object ilACREDITADO: TInterLinkit
    Control = edID_ACREDITADO
    OnEjecuta = ilACREDITADOEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    OnCapture = ilACREDITADOCapture
    Left = 386
    Top = 18
  end
  object qTipoGaran: TQuery
    Left = 392
    Top = 144
  end
end
