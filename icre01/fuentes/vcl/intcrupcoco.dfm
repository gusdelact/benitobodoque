object WCrUpCoCo: TWCrUpCoCo
  Left = 246
  Top = 108
  Width = 730
  Height = 327
  Caption = 'Cambios en CoIncre'
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
  object Label6: TLabel
    Left = 8
    Top = 5
    Width = 54
    Height = 13
    Caption = 'Disposición'
    WordWrap = True
  end
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 20
    Height = 13
    Caption = 'Mes'
  end
  object Label2: TLabel
    Left = 232
    Top = 32
    Width = 19
    Height = 13
    Caption = 'Año'
  end
  object Label12: TLabel
    Left = 336
    Top = 32
    Width = 74
    Height = 13
    Caption = 'Tipo de Cambio'
  end
  object lbTIpoCambio: TLabel
    Left = 424
    Top = 32
    Width = 8
    Height = 13
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PnDatos: TPanel
    Left = 0
    Top = 270
    Width = 721
    Height = 21
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
  object MsgPanel: TPanel
    Left = 0
    Top = 249
    Width = 721
    Height = 21
    TabOrder = 1
  end
  object edID_CREDITO: TEdit
    Tag = 512
    Left = 96
    Top = 1
    Width = 70
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object btDisposicion: TBitBtn
    Tag = 17
    Left = 72
    Top = 1
    Width = 21
    Height = 21
    TabOrder = 3
    OnClick = btDisposicionClick
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
  object edAcreditado: TEdit
    Left = 168
    Top = 1
    Width = 553
    Height = 21
    HelpContext = 3003
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object cbMes: TComboBox
    Left = 72
    Top = 28
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'Enero'
    Items.Strings = (
      'Enero'
      'Febrero'
      'Marzo'
      'Abril'
      'Mayo'
      'Junio'
      'Julio'
      'Agosto'
      'Septiembre'
      'Octubre'
      'Noviembre'
      'Diciembre')
  end
  object cbAnio: TComboBox
    Left = 256
    Top = 28
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Text = '2000'
    Items.Strings = (
      '2005'
      '2006'
      '2007'
      '2008'
      '2009'
      '2010'
      '2011'
      '2012'
      '2013'
      '2014'
      '2015'
      '2016'
      '2017'
      '2018'
      '2019'
      '2020')
  end
  object btBUSCA: TBitBtn
    Left = 504
    Top = 25
    Width = 217
    Height = 30
    Caption = '&Buscar Registro'
    TabOrder = 7
    OnClick = btBUSCAClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 56
    Width = 721
    Height = 129
    ActivePage = TabSheet1
    TabOrder = 8
    object TabSheet1: TTabSheet
      Caption = 'Saldos'
      object dbgDATOS: TDBGrid
        Left = 0
        Top = 5
        Width = 713
        Height = 60
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
      end
      object DBNavigator1: TDBNavigator
        Left = 464
        Top = 72
        Width = 224
        Height = 25
        DataSource = DataSource1
        VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
        TabOrder = 1
      end
    end
  end
  object MErrores: TMemo
    Left = 0
    Top = 192
    Width = 721
    Height = 57
    TabStop = False
    Color = clInfoBk
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 9
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
    Left = 370
    Top = 50
  end
  object Database1: TDatabase
    AliasName = 'PDWHC'
    Connected = True
    DatabaseName = 'dbPDWHC'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SISTEMAS'
      'PASSWORD=DEVELOP')
    SessionName = 'Default'
    Left = 64
    Top = 56
  end
  object tbDM_CR_FAC_CREDITO: TTable
    DatabaseName = 'dbPDWHC'
    FieldDefs = <
      item
        Name = 'ID_CREDITO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'ID_ANIO_MES'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'IMP_SPM_K_VIG'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SDO_K_VIG'
        DataType = ftFloat
      end
      item
        Name = 'IMP_IO_DEV'
        DataType = ftFloat
      end
      item
        Name = 'IMP_IO_DEVUELTO'
        DataType = ftFloat
      end
      item
        Name = 'IMP_IO_VEN_PAG'
        DataType = ftFloat
      end
      item
        Name = 'IMP_IO_DEV_VEN'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SPM_IO_VIG'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SDO_IO_VIG'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SPM_IO_IMP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SDO_IO_IMP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SPM_IO_VEN'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SDO_IO_VEN'
        DataType = ftFloat
      end
      item
        Name = 'IMP_IM'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SPM_K_IMP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SDO_K_IMP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SPM_K_VEN'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SDO_K_VEN'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COMISION'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SPM_K_VIG_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SDO_K_VIG_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_IO_DEV_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_IO_DEVUELTO_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_IO_VEN_PAG_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_IO_DEV_VEN_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SPM_IO_VIG_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SDO_IO_VIG_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SPM_IO_IMP_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SDO_IO_IMP_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SPM_IO_VEN_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SDO_IO_VEN_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_IM_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SPM_K_IMP_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SDO_K_IMP_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SPM_K_VEN_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_SDO_K_VEN_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COMISION_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_INT_CORTE'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COLOCACION'
        DataType = ftFloat
      end
      item
        Name = 'IMP_CASTIGO'
        DataType = ftFloat
      end
      item
        Name = 'IMP_QUEBRANTO'
        DataType = ftFloat
      end
      item
        Name = 'IMP_REESTRUCTURA'
        DataType = ftFloat
      end
      item
        Name = 'IMP_RENOVACION'
        DataType = ftFloat
      end
      item
        Name = 'IMP_MARGEN'
        DataType = ftFloat
      end
      item
        Name = 'IMP_INT_CORTE_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COLOCACION_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_CASTIGO_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_QUEBRANTO_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_REESTRUCTURA_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_RENOVACION_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_MARGEN_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_RESERVAS_PREV'
        DataType = ftFloat
      end
      item
        Name = 'IMP_RESERV_PREV_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_FIDE_HIP_UDIS'
        DataType = ftFloat
      end
      item
        Name = 'IMP_FIDE_HIP_UDIS_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_VIG_K'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_VIG_K_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_IMP_K'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_IMP_K_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_VDO_K'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_VDO_K_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_VIG_INT'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_VIG_INT_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_IMP_INT'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_IMP_INT_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_VDO_INT'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_VDO_INT_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_VIG_REF'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_VIG_REF_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_IMP_REF'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_IMP_REF_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_VDO_REF'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_VDO_REF_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_COM'
        DataType = ftFloat
      end
      item
        Name = 'IMP_COB_COM_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_DACION'
        DataType = ftFloat
      end
      item
        Name = 'IMP_DACION_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_ADJUDICACION'
        DataType = ftFloat
      end
      item
        Name = 'IMP_ADJUDICA_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_QUITA'
        DataType = ftFloat
      end
      item
        Name = 'IMP_QUITA_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_CONDONA'
        DataType = ftFloat
      end
      item
        Name = 'IMP_CONDONA_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_RES_PRE_CUB'
        DataType = ftFloat
      end
      item
        Name = 'IMP_RES_PRE_CUB_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_RES_PRE_EXP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_RES_PRE_EXP_VP'
        DataType = ftFloat
      end
      item
        Name = 'IMP_INT_DEV_VDO'
        DataType = ftFloat
      end
      item
        Name = 'IMP_INT_DEV_VDO_VP'
        DataType = ftFloat
      end>
    StoreDefs = True
    TableName = 'DM_CR_FAC_CREDITO'
    Left = 28
    Top = 56
    object tbDM_CR_FAC_CREDITOIMP_SDO_K_VIG: TFloatField
      DisplayLabel = 'Cap. Vigente'
      FieldName = 'IMP_SDO_K_VIG'
      EditFormat = '###,###,###,##0.00'
    end
    object tbDM_CR_FAC_CREDITOIMP_SDO_K_IMP: TFloatField
      DisplayLabel = 'Cap. Impagado'
      FieldName = 'IMP_SDO_K_IMP'
      EditFormat = '###,###,###,##0.00'
    end
    object tbDM_CR_FAC_CREDITOIMP_SDO_K_VEN: TFloatField
      DisplayLabel = 'Cap. Vencido'
      FieldName = 'IMP_SDO_K_VEN'
      EditFormat = '###,###,###,##0.00'
    end
    object tbDM_CR_FAC_CREDITOIMP_SPM_K_VIG: TFloatField
      DisplayLabel = 'Prom. Cap. Vig.'
      FieldName = 'IMP_SPM_K_VIG'
      EditFormat = '###,###,###,##0.00'
    end
    object tbDM_CR_FAC_CREDITOIMP_SPM_K_IMP: TFloatField
      DisplayLabel = 'Prom. Cap. Imp.'
      FieldName = 'IMP_SPM_K_IMP'
      EditFormat = '###,###,###,##0.00'
    end
    object tbDM_CR_FAC_CREDITOIMP_INT_CORTE: TFloatField
      DisplayLabel = 'Int. Vigente'
      FieldName = 'IMP_INT_CORTE'
      EditFormat = '###,###,###,##0.00'
    end
    object tbDM_CR_FAC_CREDITOIMP_SDO_IO_IMP: TFloatField
      DisplayLabel = 'Int. Impagado'
      FieldName = 'IMP_SDO_IO_IMP'
      EditFormat = '###,###,###,##0.00'
    end
    object tbDM_CR_FAC_CREDITOIMP_SDO_IO_VEN: TFloatField
      DisplayLabel = 'Int. Vdo.'
      FieldName = 'IMP_SDO_IO_VEN'
      EditFormat = '###,###,###,##0.00'
    end
    object tbDM_CR_FAC_CREDITOIMP_INT_DEV_VDO: TFloatField
      FieldName = 'IMP_INT_DEV_VDO'
      Visible = False
      EditFormat = '###,###,###,##0.00'
    end
    object tbDM_CR_FAC_CREDITOID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
      Required = True
      Visible = False
      EditFormat = '###,###,###,##0.00'
    end
    object tbDM_CR_FAC_CREDITOID_ANIO_MES: TFloatField
      FieldName = 'ID_ANIO_MES'
      Required = True
      Visible = False
      EditFormat = '###,###,###,##0.00'
    end
  end
  object DataSource1: TDataSource
    DataSet = tbDM_CR_FAC_CREDITO
    Left = 104
    Top = 56
  end
end
