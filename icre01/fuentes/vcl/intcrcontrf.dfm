object WCrContrF: TWCrContrF
  Left = 277
  Top = 127
  Width = 814
  Height = 636
  BiDiMode = bdLeftToRight
  Caption = 'Contrato'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  ParentBiDiMode = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnDatos: TPanel
    Left = 0
    Top = 581
    Width = 806
    Height = 21
    Align = alBottom
    TabOrder = 0
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
  object Panel1: TPanel
    Left = 8
    Top = -8
    Width = 785
    Height = 577
    TabOrder = 1
    object lbledChequera: TLabel
      Left = 548
      Top = 212
      Width = 46
      Height = 13
      Caption = 'Chequera'
      WordWrap = True
    end
    object lbledID_Acreditado: TLabel
      Left = 240
      Top = 22
      Width = 51
      Height = 13
      Caption = 'Acreditado'
    end
    object lbledCVE_PRODUCTO_CRE: TLabel
      Left = 8
      Top = 178
      Width = 43
      Height = 13
      Caption = 'Producto'
      WordWrap = True
    end
    object lbledF_ALTA: TLabel
      Left = 8
      Top = 203
      Width = 48
      Height = 26
      Caption = 'Fecha de alta'
      WordWrap = True
    end
    object lbledF_VENCIMIENTO: TLabel
      Left = 8
      Top = 236
      Width = 57
      Height = 26
      Caption = 'Fecha de vencimiento'
      WordWrap = True
    end
    object lbledPlazoContrato: TLabel
      Left = 192
      Top = 210
      Width = 135
      Height = 13
      Caption = 'Plazo del contrato de crédito'
      WordWrap = True
    end
    object lbledIMP_CREDITO: TLabel
      Left = 8
      Top = 269
      Width = 55
      Height = 26
      Caption = 'Importe del crédito'
      WordWrap = True
    end
    object lbledIDPersonaRelacionada: TLabel
      Left = 240
      Top = 72
      Width = 56
      Height = 26
      Caption = 'ID Persona relacionada'
      WordWrap = True
    end
    object lbledSaldoChequera: TLabel
      Left = 548
      Top = 243
      Width = 46
      Height = 26
      Caption = 'Saldo Chequera'
      WordWrap = True
    end
    object lblID_Contrato: TLabel
      Left = 24
      Top = 22
      Width = 54
      Height = 13
      Caption = 'ID Contrato'
      WordWrap = True
    end
    object lbledID_promotor: TLabel
      Left = 240
      Top = 51
      Width = 42
      Height = 13
      Caption = 'Promotor'
    end
    object lbledRelConAcred: TLabel
      Left = 360
      Top = 104
      Width = 127
      Height = 13
      Caption = 'Relación con el acreditado'
      WordWrap = True
    end
    object btID_Contrato: TBitBtn
      Tag = 50
      Left = 181
      Top = 18
      Width = 21
      Height = 21
      HelpContext = 1001
      TabOrder = 1
      OnClick = btID_ContratoClick
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
    object edNOM_PERSONA: TEdit
      Left = 425
      Top = 18
      Width = 329
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
    end
    object edCVE_PRODUCTO_CRE: TEdit
      Left = 104
      Top = 174
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 12
    end
    object edDESC_PRODUCTO: TEdit
      Left = 192
      Top = 174
      Width = 329
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 13
    end
    object edF_VENCIMIENTO: TEdit
      Left = 104
      Top = 240
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 16
    end
    object edF_ALTA: TEdit
      Left = 104
      Top = 207
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 14
    end
    object edPlazoContrato: TEdit
      Left = 344
      Top = 207
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 15
    end
    object edNumChequera: TEdit
      Left = 608
      Top = 207
      Width = 145
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 17
    end
    object edSaldoChequera: TEdit
      Left = 608
      Top = 248
      Width = 145
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 18
    end
    object edIDPersonaRel: TEdit
      Tag = 530
      Left = 312
      Top = 75
      Width = 81
      Height = 21
      HelpContext = 1100
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 2
      OnExit = edIDPersonaRelExit
    end
    object edID_PERSONA: TEdit
      Left = 312
      Top = 18
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object edID_PROMOTOR: TEdit
      Left = 312
      Top = 47
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 9
    end
    object edNombrePromotor: TEdit
      Left = 424
      Top = 47
      Width = 329
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 10
    end
    object edNombrePersonaRelacionada: TEdit
      Left = 424
      Top = 75
      Width = 329
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 11
    end
    object edTipo_Rel: TRadioGroup
      Tag = 18
      Left = 232
      Top = 110
      Width = 113
      Height = 33
      HelpContext = 1200
      Caption = 'Tipo de Relación'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Aval'
        'Otro')
      TabOrder = 4
      OnExit = edTipo_RelExit
    end
    object edRel_Con_Acred: TEdit
      Tag = 530
      Left = 360
      Top = 117
      Width = 393
      Height = 21
      HelpContext = 1300
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 5
      OnExit = edRel_Con_AcredExit
    end
    object sgPersonasRel: TSGCtrl
      Left = 8
      Top = 336
      Width = 745
      Height = 209
      ShowTab = True
      TabOrder = 6
      TabWidth = 0
      ShowBtnPriorNext = True
      ShowBtnFirst = True
      ShowBtnLast = True
      OnDblClick = sgPersonasRelDblClick
    end
    object edIMP_CREDITO: TInterEdit
      Left = 104
      Top = 271
      Width = 153
      Height = 21
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      Color = clBtnFace
      TabOrder = 19
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object MsgPanel: TPanel
      Left = 9
      Top = 310
      Width = 744
      Height = 19
      TabOrder = 20
    end
    object edID_CONTRATO: TEdit
      Tag = 562
      Left = 85
      Top = 18
      Width = 92
      Height = 21
      HelpContext = 1000
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 0
      OnExit = edID_CONTRATOExit
    end
    object btnID_PersonaRelacionada: TBitBtn
      Tag = 18
      Left = 394
      Top = 74
      Width = 21
      Height = 21
      HelpContext = 1101
      TabOrder = 3
      OnClick = btnID_PersonaRelacionadaClick
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
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
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
    Left = 762
    Top = 65530
  end
  object ilID_persona_rel: TInterLinkit
    Control = edIDPersonaRel
    OnEjecuta = ilID_persona_relEjecuta
    TipoReader = trEntero
    CharCase = ecUpperCase
    Left = 437
    Top = 69
  end
  object ilID_CONTRATO: TInterLinkit
    Control = edID_CONTRATO
    OnEjecuta = ilID_CONTRATOEjecuta
    TipoReader = trContrato
    CharCase = ecUpperCase
    Left = 219
    Top = 13
  end
end
