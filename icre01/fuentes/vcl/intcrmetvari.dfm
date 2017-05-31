object WCrMetVariable: TWCrMetVariable
  Left = 213
  Top = 135
  Width = 951
  Height = 540
  Caption = 'Configuración de Variables'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 918
    Height = 489
    Align = alTop
    TabOrder = 0
    object lbID_VARIABLE: TLabel
      Left = 8
      Top = 12
      Width = 99
      Height = 13
      Caption = 'Identificador Variable'
    end
    object lbNOMBRE: TLabel
      Left = 8
      Top = 44
      Width = 78
      Height = 13
      Caption = 'Nombre Variable'
    end
    object lbDESCRIPCION: TLabel
      Left = 8
      Top = 76
      Width = 56
      Height = 13
      Caption = 'Descripción'
    end
    object lbTIPO_DATO: TLabel
      Left = 8
      Top = 108
      Width = 47
      Height = 13
      Caption = 'Tipo Dato'
    end
    object lbLONGITUD: TLabel
      Left = 288
      Top = 108
      Width = 41
      Height = 13
      Caption = 'Longitud'
    end
    object lbPRECISION: TLabel
      Left = 424
      Top = 108
      Width = 43
      Height = 13
      Caption = 'Precisión'
    end
    object lbFORMATO: TLabel
      Left = 528
      Top = 108
      Width = 38
      Height = 13
      Caption = 'Formato'
    end
    object lbVAL_DEFAULT: TLabel
      Left = 8
      Top = 172
      Width = 79
      Height = 13
      Caption = 'Valor por Default'
    end
    object lbFUNC_BUSQUEDA: TLabel
      Left = 8
      Top = 204
      Width = 66
      Height = 13
      Caption = 'Nombre FindIt'
    end
    object lbLISTA_FIJA_OPC: TLabel
      Left = 8
      Top = 268
      Width = 104
      Height = 13
      Caption = 'Lista Fija de Opciones'
    end
    object lbTIPO_CAP_OP_MULTIPLE: TLabel
      Left = 8
      Top = 236
      Width = 137
      Height = 13
      Caption = 'Tipo Captura Opción Múltiple'
    end
    object lbVAL_RET_OP_MULTIPLE: TLabel
      Left = 392
      Top = 236
      Width = 141
      Height = 13
      Caption = 'Valor Retorno Opción Múltiple'
    end
    object lbVAL_DEFAULT_COL_INAC: TLabel
      Left = 8
      Top = 416
      Width = 143
      Height = 13
      Caption = 'Valor Default Variable Inactiva'
    end
    object lbFORMA_INGRESO: TLabel
      Left = 8
      Top = 140
      Width = 67
      Height = 13
      Caption = 'Forma Ingreso'
    end
    object lbURL: TLabel
      Left = 8
      Top = 448
      Width = 22
      Height = 13
      Caption = 'URL'
    end
    object lblVAL_BD: TLabel
      Left = 160
      Top = 268
      Width = 112
      Height = 13
      Caption = 'Valor en Base de Datos'
    end
    object lblELEMENTOS: TLabel
      Left = 344
      Top = 268
      Width = 49
      Height = 13
      Caption = 'Elementos'
    end
    object Label3: TLabel
      Left = 416
      Top = 204
      Width = 56
      Height = 13
      Caption = 'Descripción'
    end
    object edID_VARIABLE: TEdit
      Left = 160
      Top = 12
      Width = 113
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edNOMBRE: TEdit
      Tag = 18
      Left = 160
      Top = 44
      Width = 498
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 1
      OnExit = edNOMBREExit
    end
    object edDESCRIPCION: TEdit
      Tag = 18
      Left = 160
      Top = 76
      Width = 752
      Height = 21
      MaxLength = 100
      TabOrder = 2
    end
    object edLONGITUD: TEdit
      Tag = 18
      Left = 336
      Top = 108
      Width = 50
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 4
      TabOrder = 4
      Text = '1'
      OnExit = edLONGITUDExit
    end
    object edPRECISION: TEdit
      Tag = 18
      Left = 472
      Top = 108
      Width = 20
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 1
      TabOrder = 6
      Text = '1'
      OnExit = edPRECISIONExit
    end
    object edFORMATO: TEdit
      Tag = 18
      Left = 576
      Top = 108
      Width = 337
      Height = 21
      MaxLength = 100
      TabOrder = 8
    end
    object edVAL_DEFAULT: TEdit
      Tag = 18
      Left = 160
      Top = 172
      Width = 752
      Height = 21
      MaxLength = 4000
      TabOrder = 9
    end
    object edFUNC_BUSQUEDA: TEdit
      Tag = 18
      Left = 160
      Top = 204
      Width = 217
      Height = 21
      MaxLength = 4000
      ReadOnly = True
      TabOrder = 10
      OnChange = edFUNC_BUSQUEDAChange
    end
    object edLISTA_FIJA_OPC: TEdit
      Left = 160
      Top = 384
      Width = 345
      Height = 21
      Color = clBtnFace
      MaxLength = 4000
      ReadOnly = True
      TabOrder = 11
      OnChange = edLISTA_FIJA_OPCChange
    end
    object edVAL_DEFAULT_COL_INAC: TEdit
      Tag = 18
      Left = 160
      Top = 416
      Width = 544
      Height = 21
      MaxLength = 100
      TabOrder = 14
    end
    object edURL: TEdit
      Tag = 18
      Left = 160
      Top = 448
      Width = 752
      Height = 21
      MaxLength = 200
      TabOrder = 16
    end
    object rdgSIT_VARIABLE: TRadioGroup
      Tag = 18
      Left = 728
      Top = 12
      Width = 185
      Height = 37
      Caption = 'Situación'
      Columns = 2
      Items.Strings = (
        'Activa'
        'Inactiva')
      TabOrder = 17
      TabStop = True
    end
    object cbTIPO_DATO: TComboBox
      Tag = 18
      Left = 160
      Top = 108
      Width = 105
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnChange = cbTIPO_DATOChange
      Items.Strings = (
        'NUMBER'
        'VARCHAR2'
        'DATE'
        'DATETIME')
    end
    object cbTIPO_CAP_OP_MULTIPLE: TComboBox
      Tag = 18
      Left = 160
      Top = 236
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 12
      OnChange = cbTIPO_CAP_OP_MULTIPLEChange
      Items.Strings = (
        ''
        'RADIOBUTTONS'
        'COMBOBOX'
        'COMBOBOXCHECK')
    end
    object cbVAL_RET_OP_MULTIPLE: TComboBox
      Tag = 18
      Left = 592
      Top = 236
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 13
      Items.Strings = (
        ''
        'VALORES'
        'CONTEO')
    end
    object cbFORMA_INGRESO: TComboBox
      Tag = 18
      Left = 160
      Top = 140
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 15
      OnChange = cbFORMA_INGRESOChange
      Items.Strings = (
        'CAPTURA'
        'CALCULADO'
        'SOLOCONSULTA'
        'URL')
    end
    object updLONGITUD: TUpDown
      Left = 386
      Top = 108
      Width = 16
      Height = 21
      Associate = edLONGITUD
      Enabled = False
      Min = 1
      Max = 4000
      Position = 1
      TabOrder = 5
      TabStop = True
      Wrap = False
    end
    object updPRECISION: TUpDown
      Left = 492
      Top = 108
      Width = 16
      Height = 21
      Associate = edPRECISION
      Enabled = False
      Min = 1
      Max = 8
      Position = 1
      TabOrder = 7
      TabStop = True
      Wrap = False
    end
    object meVAL_BD: TMemo
      Tag = 18
      Left = 160
      Top = 284
      Width = 185
      Height = 89
      ScrollBars = ssBoth
      TabOrder = 18
    end
    object meELEMENTOS: TMemo
      Tag = 18
      Left = 344
      Top = 284
      Width = 185
      Height = 89
      ScrollBars = ssBoth
      TabOrder = 19
    end
    object edDESC_FINDIT: TEdit
      Left = 480
      Top = 204
      Width = 433
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 20
    end
  end
  object PnDatos: TPanel
    Left = 0
    Top = 489
    Width = 918
    Height = 20
    Align = alTop
    TabOrder = 1
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
      Left = 456
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
      Left = 456
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
      Left = 520
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
      Left = 520
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
  object bbtnNOMBRE_FINDIT: TBitBtn
    Tag = 18
    Left = 376
    Top = 204
    Width = 22
    Height = 20
    TabOrder = 2
    OnClick = bbtnNOMBRE_FINDITClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      0800000000000002000000000000000000000001000000010000000000008080
      8000000080000080800000800000808000008000000080008000408080004040
      0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
      FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
      80008000FF004080FF000200C4000200CC00000000000000000071658400CC00
      DE00000008000200C00000001100000004000000000000000000000000000000
      00000000A000BA7F000000001C005B00D8005B00B800B87FFF00FFFFBC005B00
      2600B77FF4005D00C00000000A0000000100000000000000A4005B0012000000
      6300F7BFC00000000A00000001000000000000005700EC843F000000D0005B00
      2300F7BF0000000047000200E500F9BF7900F7BF0C000000F4005B002E00F7BF
      5700EC8400000000EC00473300000000460000004A0002002E0000001F000000
      3F002701000047333F0027015000FA3B3F000400000000000000F91AB7000000
      0000010000000A000000FA3B10000000000000003C00D379FF0047335000413C
      3F00FFFF47000000000047333F0008E88C0000000300F91AB700E78207000000
      0000000001000A00C0003F010000080000001F175900B77F14005B0094005B00
      0700B87FFF00FFFFA0005B00E200B77F14005B00AC005B00C200B87FFF00FFFF
      B8005B00B000B77F14005B00C4005B003500B87FFF00FFFFD0005B0061004100
      14005B00DC005B006E004100FF00FFFFE8005B00C100410014005B00F4005B00
      DC004100FF00FFFF00005B001800410014005B00F4005B0025004100FF00FFFF
      00005B009C0041001100000001000000000000009800BA7F0100000000000000
      0000000000000000EC0012010100000000000000000000006000188000000000
      0000000005000000000000000000000000000000000000004C000000C0000000
      000000004C005D00000000000500000003000000A0005D0004000000B4005B00
      400000000000000044005D00260008001B00230078005D0000000000F200B87F
      0000000000000000C800BB7F0000000000000000420073636100782E62007000
      6C005B004700B77FC00000001100000004000000000000000000000000000000
      00000000A000BA7F010000009C005B0058005B000000B87FFF00FFFF3C005B00
      2600B77F88005D00E80000008400581100007811000024875000101100005811
      0000308750001701980014050000000002009204000000006600000000005811
      0000728700005A87000000000000010000000000C80000006600507F1700537F
      10007F112F00A0876E00170164002F0100000000C8000000A000000090000000
      780000007F000000010000001000000000002F01F8005D0010000000AA00507F
      1700537F10002979160066376600A705EC00AC11570036EC4A00030303030303
      030303030303110E1111030303030303030303030303010E0101030303030303
      03030303030E0E110E0E03030303030303030303030E0E010E0E030303030303
      03030303110E11110E1103030303030303030303010E01010E01030303030303
      03030311110E0E0E110E03030303030303030301010E0E0E010E030303030303
      030606060E1111111103030303030303030F0F0F0E0101010103030303030303
      03060111060E110E0303030303030303030F0F01000E010E0303030303030303
      0606010E1106110303030303030303030F0F0F0E010F01030303030303030306
      0601060F0F060303030303030303030F0F0F000F0F0F03030303030303030606
      010E0F06060603030303030303030F0F0F0E0F0F0F0F03030303030303060606
      060F06060303030303030303030F0F0F0F0F0F0F030303030303030306060106
      0606060303030303030303030F0F0F0F0F0F0F03030303030303030606010E0F
      06060303030303030303030F0F0F0E0F0F0F03030303030303030306010E0F06
      06030303030303030303030F0F0E0F0F0F0303030303030303030306060F0606
      03030303030303030303030F0F0F0F0F03030303030303030303030306060603
      0303030303030303030303030F0F0F0303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303}
    NumGlyphs = 2
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesCancelar = InterForma1DespuesCancelar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
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
    ShowBtnEliminar = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 658
    Top = 330
  end
end
