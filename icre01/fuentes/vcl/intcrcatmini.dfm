object WCrCatMinimo: TWCrCatMinimo
  Left = 307
  Top = 126
  Width = 820
  Height = 430
  Caption = 'Cat�logo de Clasificaci�n Contable'
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
  object pgAltaDatos: TPageControl
    Left = 0
    Top = 0
    Width = 787
    Height = 385
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Alta de Datos'
      object lbCVE_CAT_MIN_VEN: TLabel
        Left = 8
        Top = 66
        Width = 102
        Height = 13
        Caption = 'Cve. M�nimo Vencido'
      end
      object lbCVE_SITI: TLabel
        Left = 8
        Top = 106
        Width = 45
        Height = 13
        Caption = 'Cve. SITI'
      end
      object lbCVE_CAT_MINIMO: TLabel
        Left = 8
        Top = 25
        Width = 57
        Height = 13
        Caption = 'Cve M�nimo'
      end
      object lbDESC_CAT_MINIMO: TLabel
        Left = 8
        Top = 235
        Width = 56
        Height = 13
        Caption = 'Descripci�n'
      end
      object Label8: TLabel
        Left = 8
        Top = 264
        Width = 138
        Height = 13
        Caption = 'Clave Operaci�n Facturaci�n'
      end
      object lbCVE_CARTERA: TLabel
        Left = 8
        Top = 147
        Width = 73
        Height = 13
        Caption = 'Tipo de Cartera'
      end
      object edCVE_SITI: TEdit
        Tag = 18
        Left = 128
        Top = 102
        Width = 388
        Height = 21
        Hint = 'Introduzca la clave del tipo de acreditado'
        HelpContext = 3001
        CharCase = ecUpperCase
        MaxLength = 20
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnExit = edCVE_SITIExit
      end
      object edCVE_CAT_MIN_VEN: TEdit
        Tag = 18
        Left = 128
        Top = 62
        Width = 388
        Height = 21
        Hint = 'Introduzca la descripci�n del tipo de acreditado'
        HelpContext = 2001
        CharCase = ecUpperCase
        MaxLength = 20
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnExit = edCVE_CAT_MIN_VENExit
      end
      object edCVE_CAT_MINIMO: TEdit
        Tag = 50
        Left = 128
        Top = 21
        Width = 388
        Height = 21
        HelpContext = 1001
        CharCase = ecUpperCase
        MaxLength = 20
        TabOrder = 0
        OnExit = edCVE_CAT_MINIMOExit
      end
      object edDESC_CAT_MINIMO: TEdit
        Tag = 18
        Left = 128
        Top = 231
        Width = 388
        Height = 21
        HelpContext = 6001
        CharCase = ecUpperCase
        MaxLength = 250
        TabOrder = 8
        OnExit = edDESC_CAT_MINIMOExit
      end
      object rgCVE_CLASIF_DEST: TRadioGroup
        Tag = 18
        Left = 8
        Top = 176
        Width = 220
        Height = 41
        HelpContext = 4001
        Caption = 'Clave de Clasificaci�n de Destino'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Banco'
          'Fideicomiso')
        TabOrder = 6
        OnExit = rgCVE_CLASIF_DESTExit
      end
      object rgPERSONA_JURIDICA: TRadioGroup
        Tag = 18
        Left = 296
        Top = 176
        Width = 220
        Height = 41
        HelpContext = 5001
        Caption = 'Personalidad Jur�dica'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Persona Moral'
          'Persona Fisica')
        TabOrder = 7
        OnExit = rgPERSONA_JURIDICAExit
      end
      object edCVE_OPER_FACT: TEdit
        Tag = 18
        Left = 152
        Top = 259
        Width = 65
        Height = 21
        HelpContext = 7001
        CharCase = ecUpperCase
        MaxLength = 6
        TabOrder = 9
        OnExit = edCVE_OPER_FACTExit
      end
      object edCVE_CARTERA: TEdit
        Tag = 530
        Left = 128
        Top = 140
        Width = 73
        Height = 21
        HelpContext = 1050
        CharCase = ecUpperCase
        MaxLength = 20
        TabOrder = 3
        OnExit = edCVE_CARTERAExit
      end
      object btCVE_CARTERA: TBitBtn
        Tag = 18
        Left = 207
        Top = 140
        Width = 22
        Height = 20
        HelpContext = 1051
        TabOrder = 4
        OnClick = btCVE_CARTERAClick
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
      object edDESC_CARTERA: TEdit
        Left = 228
        Top = 140
        Width = 285
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 5
      end
      object rgSIT_CAT_MINIMO: TRadioGroup
        Tag = 18
        Left = 2
        Top = 291
        Width = 240
        Height = 41
        HelpContext = 8000
        Caption = 'Situaci�n de Cat�logo M�nimo'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Activo'
          'Inactivo')
        TabOrder = 10
        OnExit = rgSIT_CAT_MINIMOExit
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Alta en Bloque'
      ImageIndex = 1
      object Lbtotal: TLabel
        Left = 8
        Top = 161
        Width = 89
        Height = 13
        Caption = 'Total de Registros:'
      end
      object lbTotalReg: TLabel
        Left = 103
        Top = 161
        Width = 8
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 0
        Width = 45
        Height = 13
        Caption = 'Cve. Min.'
      end
      object Bevel3: TBevel
        Left = 125
        Top = 0
        Width = 5
        Height = 16
      end
      object Label12: TLabel
        Left = 436
        Top = 0
        Width = 56
        Height = 13
        Caption = 'Descripci�n'
      end
      object Bevel1: TBevel
        Left = 429
        Top = 0
        Width = 5
        Height = 16
      end
      object Label1: TLabel
        Left = 214
        Top = 0
        Width = 45
        Height = 13
        Caption = 'Cve. SITI'
      end
      object Bevel2: TBevel
        Left = 207
        Top = 0
        Width = 5
        Height = 16
      end
      object Label2: TLabel
        Left = 135
        Top = 0
        Width = 70
        Height = 13
        Caption = 'Cve. Min. Vdo.'
      end
      object Bevel4: TBevel
        Left = 267
        Top = 0
        Width = 5
        Height = 16
      end
      object Bevel5: TBevel
        Left = 349
        Top = 0
        Width = 5
        Height = 16
      end
      object Label3: TLabel
        Left = 274
        Top = 0
        Width = 75
        Height = 13
        Caption = 'Clasif. Destino**'
      end
      object Label4: TLabel
        Left = 357
        Top = 0
        Width = 71
        Height = 13
        Caption = 'Pers. Juridica**'
      end
      object Label6: TLabel
        Left = 3
        Top = 97
        Width = 574
        Height = 14
        Caption = 
          '** NOTAS :  Claves Personalidad Juridica : Persona Moral (PM), P' +
          'ersona F�sica (PF)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 87
        Top = 112
        Width = 406
        Height = 14
        Caption = 'Claves Clasificaci�n destino: Banco (BC), Fideicomiso (FI)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object Bevel6: TBevel
        Left = 560
        Top = -1
        Width = 5
        Height = 16
      end
      object Label9: TLabel
        Left = 567
        Top = -1
        Width = 69
        Height = 13
        Caption = 'Cve Oper Fact'
      end
      object Bevel7: TBevel
        Left = 641
        Top = -1
        Width = 5
        Height = 16
      end
      object Label10: TLabel
        Left = 652
        Top = -1
        Width = 58
        Height = 13
        Caption = 'Tipo Cartera'
      end
      object Bevel8: TBevel
        Left = 721
        Top = -1
        Width = 5
        Height = 16
      end
      object Label11: TLabel
        Left = 731
        Top = -1
        Width = 44
        Height = 13
        Caption = 'Situaci�n'
      end
      object RGinformacion: TRadioGroup
        Left = 0
        Top = 127
        Width = 360
        Height = 32
        Caption = 'Informaci�n'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Reemplazar Registros'
          'Adicionar Registros')
        TabOrder = 0
      end
      object btCarga: TBitBtn
        Left = 368
        Top = 131
        Width = 153
        Height = 25
        Caption = 'Carga en Bloques'
        TabOrder = 1
        OnClick = btCargaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
      object pbRegistros: TProgressBar
        Left = 142
        Top = 163
        Width = 377
        Height = 11
        Min = 0
        Max = 100
        TabOrder = 2
      end
      object MErrores: TMemo
        Left = 0
        Top = 310
        Width = 779
        Height = 47
        Align = alBottom
        Color = clInfoBk
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object SAGta: TStringAlignGrid
        Left = 0
        Top = 16
        Width = 793
        Height = 77
        ColCount = 9
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        PopupMenu = PopupMenu1
        ScrollBars = ssVertical
        TabOrder = 4
        OnExit = SAGtaExit
        OnKeyDown = SAGtaKeyDown
        ColWidths = (
          125
          80
          60
          80
          80
          130
          80
          80
          64)
        PropCell = ()
        PropCol = ()
        PropRow = ()
        PropFixedCol = ()
        PropFixedRow = ()
      end
    end
  end
  object PnDatos: TPanel
    Left = 0
    Top = 385
    Width = 787
    Height = 21
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
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnBuscar = InterForma1Buscar
    msgSinRegistros = 'No existe un Registro para realizar la operaci�n.'
    msgModificarRegistro = 'Imposible Modificar el Registro Actual.'
    msgEliminarRegistro = 'Imposible Eliminar el Registro Actual.'
    msgCrearRegistro = 'Imposible Crear el Registro Actual.'
    msgAceptarRegistro = 'Imposible Aceptar los cambios del Registro Actual.'
    msgCancelarRegistro = 'Imposible Cancelar los cambios del Registro Actual.'
    msgPreguntaEliminar = '�Desea Eliminar el Registro Actual?'
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
    Left = 466
    Top = 2
  end
  object PopupMenu1: TPopupMenu
    Left = 452
    Top = 40
    object Pegar1: TMenuItem
      Caption = '&Pegar'
      ShortCut = 16470
      OnClick = Pegar1Click
    end
  end
  object ilCVE_CARTERA: TInterLinkit
    OnEjecuta = ilCVE_CARTERAEjecuta
    TipoReader = trTexto
    CharCase = ecUpperCase
    OnCapture = ilCVE_CARTERACapture
    Left = 504
    Top = 8
  end
  object QTipoCartera: TQuery
    SQL.Strings = (
      'Select Count (1) Total'
      '  From CR_Cartera_Cat_Minimo'
      ' Where Cve_Cartera = :Cve_Cartera')
    Left = 620
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Cve_Cartera'
        ParamType = ptUnknown
      end>
  end
end
