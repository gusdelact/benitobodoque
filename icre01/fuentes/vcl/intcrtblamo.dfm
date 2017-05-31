object WCrTblAmo: TWCrTblAmo
  Left = 267
  Top = 127
  Width = 729
  Height = 492
  Caption = 'Consulta Consoldado de Amortización'
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
  object lblF_CIERRE: TLabel
    Left = 7
    Top = 13
    Width = 39
    Height = 13
    Caption = 'F. Cierre'
  end
  object Label8: TLabel
    Left = 6
    Top = 32
    Width = 74
    Height = 13
    Caption = 'No. Disposición'
  end
  object Label9: TLabel
    Left = 7
    Top = 56
    Width = 43
    Height = 13
    Caption = 'Producto'
  end
  object Label10: TLabel
    Left = 306
    Top = 15
    Width = 51
    Height = 13
    Caption = 'Acreditado'
  end
  object Label11: TLabel
    Left = 210
    Top = 16
    Width = 66
    Height = 13
    Caption = 'Id. Acreditado'
  end
  object edID_CREDITO: TEdit
    Tag = 512
    Left = 86
    Top = 30
    Width = 74
    Height = 21
    TabOrder = 0
  end
  object edNOMBRE: TEdit
    Left = 299
    Top = 31
    Width = 417
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object edDESC_L_PRODUCTO: TEdit
    Left = 183
    Top = 53
    Width = 533
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object edID_ACREDITADO: TEdit
    Left = 184
    Top = 31
    Width = 113
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object edCVE_PRODUCTO_CRE: TEdit
    Left = 86
    Top = 53
    Width = 96
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object PnDatos: TPanel
    Left = 2
    Top = 429
    Width = 715
    Height = 19
    TabOrder = 5
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
      Left = 328
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
      Left = 328
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
      Left = 392
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
      Left = 392
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
  object dtpF_CIERRE: TInterDateTimePicker
    Left = 160
    Top = 6
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 38575.7299910532
    Time = 38575.7299910532
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 6
    OnCloseUp = dtpF_CIERRECloseUp
    Edit = edF_CIERRE
    Formato = dfDate
  end
  object edF_CIERRE: TEdit
    Left = 86
    Top = 6
    Width = 73
    Height = 21
    TabOrder = 7
    OnExit = edF_CIERREExit
  end
  object btIdCredito: TBitBtn
    Left = 162
    Top = 31
    Width = 22
    Height = 20
    HelpContext = 1802
    TabOrder = 8
    OnClick = btIdCreditoClick
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
  object DBGrid1: TDBGrid
    Left = 9
    Top = 85
    Width = 703
    Height = 256
    DataSource = DataSource1
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 360
    Width = 689
    Height = 65
    Caption = 'Variables Calculadas'
    TabOrder = 10
    object Label5: TLabel
      Left = 16
      Top = 16
      Width = 28
      Height = 13
      Caption = 'ATR :'
    end
    object Label1: TLabel
      Left = 16
      Top = 40
      Width = 41
      Height = 13
      Caption = 'VECES :'
    end
    object Label2: TLabel
      Left = 264
      Top = 16
      Width = 51
      Height = 13
      Caption = 'MAXATR :'
    end
    object Label3: TLabel
      Left = 264
      Top = 40
      Width = 44
      Height = 13
      Caption = '%PAGO :'
    end
    object Label4: TLabel
      Left = 464
      Top = 16
      Width = 29
      Height = 13
      Caption = '%PR :'
    end
    object ATR: TLabel
      Left = 56
      Top = 16
      Width = 3
      Height = 13
    end
    object VECES: TLabel
      Left = 64
      Top = 40
      Width = 3
      Height = 13
    end
    object MAXATR: TLabel
      Left = 320
      Top = 17
      Width = 3
      Height = 13
    end
    object POR_PAGO: TLabel
      Left = 320
      Top = 40
      Width = 3
      Height = 13
    end
    object POR_PR: TLabel
      Left = 496
      Top = 16
      Width = 3
      Height = 13
    end
  end
  object InterForma1: TInterForma
    IsMain = True
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
    Left = 644
    Top = 254
  end
  object DataSource1: TDataSource
    DataSet = QryCR_TBL_AMOR_R04
    Left = 329
    Top = 199
  end
  object QryCR_TBL_AMOR_R04: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'SELECT F_CIERRE,  ID_CREDITO_ORIG, '
      '        F_PROG_PAGO, F_VENCIMIENTO, F_PAGO,'
      '       IMP_EXIGIBLE, IMP_PAGADO, IMP_PAGADO_TRAN,'
      '       NUM_DIAS_ATR, NUM_PER_ATR'
      'From CR_TBL_AMOR_R04'
      ' Where ID_CREDITO = 270277'
      '   And F_CIERRE   = TO_DATE('#39'31/05/201'#39','#39'DD/MM/YYYY'#39')'
      'ORDER BY F_PROG_PAGO')
    Left = 579
    Top = 256
    object QryCR_TBL_AMOR_R04F_CIERRE: TDateTimeField
      DisplayLabel = 'F. Operación'
      DisplayWidth = 12
      FieldName = 'F_CIERRE'
    end
    object QryCR_TBL_AMOR_R04ID_CREDITO_ORIG: TFloatField
      DisplayLabel = 'Disposición'
      FieldName = 'ID_CREDITO_ORIG'
    end
    object QryCR_TBL_AMOR_R04F_PROG_PAGO: TDateTimeField
      DisplayLabel = 'F. Prog Pago'
      DisplayWidth = 12
      FieldName = 'F_PROG_PAGO'
    end
    object QryCR_TBL_AMOR_R04F_VENCIMIENTO: TDateTimeField
      DisplayLabel = 'F. Vencimiento'
      DisplayWidth = 12
      FieldName = 'F_VENCIMIENTO'
    end
    object QryCR_TBL_AMOR_R04F_PAGO: TDateTimeField
      DisplayLabel = 'F. Pago'
      DisplayWidth = 12
      FieldName = 'F_PAGO'
    end
    object QryCR_TBL_AMOR_R04IMP_EXIGIBLE: TFloatField
      DisplayLabel = 'Imp. Exigible'
      FieldName = 'IMP_EXIGIBLE'
    end
    object QryCR_TBL_AMOR_R04IMP_PAGADO: TFloatField
      DisplayLabel = 'Imp Pagado'
      FieldName = 'IMP_PAGADO'
    end
    object QryCR_TBL_AMOR_R04NUM_DIAS_ATR: TFloatField
      DisplayLabel = 'Días de Atraso'
      FieldName = 'NUM_DIAS_ATR'
    end
    object QryCR_TBL_AMOR_R04NUM_PER_ATR: TFloatField
      DisplayLabel = 'Per. de Atraso'
      FieldName = 'NUM_PER_ATR'
    end
  end
  object ilID_CREDITO: TInterLinkit
    Control = edID_CREDITO
    OnEjecuta = ilID_CREDITOEjecuta
    TipoReader = trEntero
    CharCase = ecNormal
    OnCapture = ilID_CREDITOCapture
    Left = 236
    Top = 35
  end
end
