object WCrPersF: TWCrPersF
  Left = 435
  Top = 131
  Width = 641
  Height = 605
  Caption = 'Persona'
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
    Left = 0
    Top = 550
    Width = 633
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
    Top = 8
    Width = 617
    Height = 153
    TabOrder = 1
    object Label11: TLabel
      Left = 8
      Top = 53
      Width = 51
      Height = 13
      Caption = 'Acreditado'
      WordWrap = True
    end
    object Label20: TLabel
      Left = 8
      Top = 85
      Width = 21
      Height = 13
      Caption = 'RFC'
      WordWrap = True
    end
    object Label21: TLabel
      Left = 8
      Top = 108
      Width = 77
      Height = 26
      Caption = 'Actividad Clave SITI'
      WordWrap = True
    end
    object Label5: TLabel
      Left = 347
      Top = 85
      Width = 30
      Height = 13
      Caption = 'CURP'
      WordWrap = True
    end
    object Label27: TLabel
      Left = 8
      Top = 23
      Width = 53
      Height = 13
      Caption = 'ID Persona'
      WordWrap = True
    end
    object Label6: TLabel
      Left = 343
      Top = 23
      Width = 80
      Height = 13
      Caption = 'ID Persona FIRA'
      WordWrap = True
    end
    object btID_PERSONA: TBitBtn
      Tag = 50
      Left = 189
      Top = 18
      Width = 21
      Height = 21
      HelpContext = 1001
      TabOrder = 1
      OnClick = btID_PERSONAClick
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
      Left = 104
      Top = 49
      Width = 417
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edCVE_SENICREB: TEdit
      Left = 104
      Top = 112
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edRFC: TEdit
      Left = 104
      Top = 81
      Width = 129
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object Edit20: TEdit
      Left = 384
      Top = 81
      Width = 137
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
    end
    object edDESC_SENICREB: TEdit
      Left = 192
      Top = 112
      Width = 329
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object edID_PERSONA: TEdit
      Tag = 562
      Left = 104
      Top = 18
      Width = 81
      Height = 21
      HelpContext = 1000
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 0
      OnExit = edID_PERSONAExit
    end
    object edID_PERS_FIRA: TEdit
      Tag = 530
      Left = 440
      Top = 18
      Width = 81
      Height = 21
      HelpContext = 1100
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 2
      OnExit = edID_PERS_FIRAExit
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 168
    Width = 617
    Height = 201
    Caption = 'Domicilio'
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 26
      Width = 58
      Height = 13
      Caption = 'Domicilio n.°'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 16
      Top = 54
      Width = 79
      Height = 26
      Caption = 'Calle, avenida o vía'
      WordWrap = True
    end
    object Label26: TLabel
      Left = 16
      Top = 126
      Width = 46
      Height = 26
      Caption = 'Ciudad o población'
      WordWrap = True
    end
    object Label3: TLabel
      Left = 295
      Top = 59
      Width = 74
      Height = 13
      Caption = 'Número exterior'
      WordWrap = True
    end
    object Label7: TLabel
      Left = 455
      Top = 59
      Width = 71
      Height = 13
      Caption = 'Número interior'
      WordWrap = True
    end
    object Label8: TLabel
      Left = 16
      Top = 91
      Width = 60
      Height = 26
      Caption = 'Colonia o urbanización'
      WordWrap = True
    end
    object Label9: TLabel
      Left = 294
      Top = 91
      Width = 54
      Height = 26
      Caption = 'Delegación o municipio'
      WordWrap = True
    end
    object Label10: TLabel
      Left = 294
      Top = 133
      Width = 14
      Height = 13
      Caption = 'CP'
      WordWrap = True
    end
    object Label12: TLabel
      Left = 16
      Top = 168
      Width = 33
      Height = 13
      Caption = 'Estado'
      WordWrap = True
    end
    object Label13: TLabel
      Left = 294
      Top = 168
      Width = 42
      Height = 13
      Caption = 'Teléfono'
      WordWrap = True
    end
    object edNDomincilio: TEdit
      Left = 112
      Top = 23
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object btAnt: TButton
      Left = 200
      Top = 21
      Width = 25
      Height = 25
      HelpContext = 1110
      Caption = '<'
      TabOrder = 1
      OnClick = btAntClick
    end
    object btSig: TButton
      Left = 224
      Top = 21
      Width = 25
      Height = 25
      HelpContext = 1111
      Caption = '>'
      TabOrder = 2
      OnClick = btSigClick
    end
    object edCALLE: TEdit
      Left = 112
      Top = 58
      Width = 177
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edPOBLACION: TEdit
      Left = 112
      Top = 129
      Width = 177
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edNum_Exterior: TEdit
      Left = 375
      Top = 58
      Width = 65
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object edNUM_INTERIOR: TEdit
      Left = 535
      Top = 58
      Width = 65
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
    end
    object edCOLONIA: TEdit
      Left = 112
      Top = 94
      Width = 177
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object edCIUDAD: TEdit
      Left = 374
      Top = 94
      Width = 177
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
    end
    object edCODIGOPOSTAL: TEdit
      Left = 374
      Top = 129
      Width = 177
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 9
    end
    object edESTADO: TEdit
      Left = 112
      Top = 164
      Width = 177
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 10
    end
    object edTelefono: TEdit
      Left = 374
      Top = 164
      Width = 177
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 11
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 376
    Width = 617
    Height = 145
    TabOrder = 3
    object Label4: TLabel
      Left = 8
      Top = 39
      Width = 114
      Height = 13
      Caption = 'Fecha de última revisión'
      WordWrap = True
    end
    object Label14: TLabel
      Left = 8
      Top = 72
      Width = 53
      Height = 13
      Caption = 'Frecuencia'
      WordWrap = True
    end
    object Label15: TLabel
      Left = 8
      Top = 99
      Width = 123
      Height = 13
      Caption = 'Fecha de próxima revisión'
      WordWrap = True
    end
    object edB_EXP_DIA: TCheckBox
      Tag = 18
      Left = 8
      Top = 8
      Width = 113
      Height = 17
      HelpContext = 1200
      Alignment = taLeftJustify
      Caption = 'Expediente al día'
      TabOrder = 0
      OnExit = edB_EXP_DIAExit
    end
    object edFRECUENCIA: TComboBox
      Tag = 18
      Left = 160
      Top = 68
      Width = 145
      Height = 21
      HelpContext = 1400
      ItemHeight = 13
      TabOrder = 2
      OnExit = edFRECUENCIAExit
      Items.Strings = (
        'mensual'
        'trimestral'
        'semestral'
        'anual')
    end
    object edF_ULT_REV: TEdit
      Tag = 18
      Left = 160
      Top = 35
      Width = 81
      Height = 21
      HelpContext = 1300
      CharCase = ecUpperCase
      TabOrder = 1
      OnExit = edF_ULT_REVExit
    end
    object dptF_ULT_REV: TInterDateTimePicker
      Tag = 18
      Left = 244
      Top = 35
      Width = 21
      Height = 21
      HelpContext = 1301
      CalAlignment = dtaLeft
      Date = 40254.444936875
      Time = 40254.444936875
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 4
      Edit = edF_ULT_REV
      Formato = dfDate
    end
    object edF_PROX_REV: TEdit
      Tag = 18
      Left = 160
      Top = 95
      Width = 81
      Height = 21
      HelpContext = 1500
      CharCase = ecUpperCase
      TabOrder = 3
      OnExit = edF_PROX_REVExit
    end
    object dptF_PROX_REV: TInterDateTimePicker
      Tag = 18
      Left = 244
      Top = 95
      Width = 21
      Height = 21
      HelpContext = 1501
      CalAlignment = dtaLeft
      Date = 40254.444936875
      Time = 40254.444936875
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 5
      Edit = edF_PROX_REV
      Formato = dfDate
    end
  end
  object MsgPanel: TPanel
    Left = 7
    Top = 526
    Width = 618
    Height = 19
    TabOrder = 4
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
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
    Left = 578
    Top = 122
  end
  object ilID_PERSONA: TInterLinkit
    Control = edID_PERSONA
    OnEjecuta = ilID_PERSONAEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    Left = 80
    Top = 57
  end
end
