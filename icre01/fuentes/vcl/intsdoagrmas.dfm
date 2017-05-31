object WSdoAgrMas: TWSdoAgrMas
  Left = 145
  Top = 45
  Width = 997
  Height = 696
  Caption = 'Genera Saldos'
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
  object Label1: TLabel
    Left = 9
    Top = 47
    Width = 69
    Height = 13
    Caption = 'Cabeceros :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 9
    Top = 279
    Width = 154
    Height = 13
    Caption = 'Detalle de Transacciones :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbArchivoEntrada: TLabel
    Left = 480
    Top = 18
    Width = 68
    Height = 13
    Caption = 'Ruta de salida'
  end
  object sbArchivoEntrada: TSpeedButton
    Left = 859
    Top = 13
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
      00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
      00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
      00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
      0003737FFFFFFFFF7F7330099999999900333777777777777733}
    NumGlyphs = 2
    OnClick = sbArchivoEntradaClick
  end
  object PnDatos: TPanel
    Left = 0
    Top = 630
    Width = 985
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
      Left = 520
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
      Left = 520
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
      Left = 584
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
      Left = 584
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
  object btnGeneraBloque: TBitBtn
    Left = 730
    Top = 44
    Width = 231
    Height = 25
    Caption = 'Genera Automáticamente &Bloque Excel'
    TabOrder = 1
    OnClick = btnGeneraBloqueClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000078
      88887FFFFFFFFF0788887F6F6F6F6F0778887FF6F6F6FF0078887F6F6F6F6F08
      07887FFFFFFFFF0807787F4C4C4FFF0800787FFFFFFFFF08080787888888888F
      0807887F4C4C4CFF0808887FFFFFFFFF08088887888888888F0888887F4C4CFF
      FF0888887FFFFFFFFF0888888777777777888888888888888888}
  end
  object DBGrid1: TDBGrid
    Left = 9
    Top = 136
    Width = 960
    Height = 137
    DataSource = dstot
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object directorio: TEdit
    Left = 560
    Top = 16
    Width = 281
    Height = 21
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 74
    Top = 16
    Width = 257
    Height = 52
    TabOrder = 4
    object Label3: TLabel
      Left = 28
      Top = 25
      Width = 25
      Height = 13
      Caption = 'Inicio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 140
      Top = 25
      Width = 14
      Height = 13
      Caption = 'Fin'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object chbFilCred: TCheckBox
      Left = 5
      Top = 4
      Width = 153
      Height = 17
      Caption = 'Filtrar Crédito'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = chbFilCredClick
    end
    object edIdCreditoIni: TEdit
      Left = 64
      Top = 22
      Width = 70
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object edIdCreditoFin: TEdit
      Left = 160
      Top = 22
      Width = 70
      Height = 21
      TabOrder = 2
      Text = '0'
    end
  end
  object bbFiltrar: TBitBtn
    Left = 344
    Top = 46
    Width = 75
    Height = 25
    Caption = '&Filtra'
    TabOrder = 5
    OnClick = bbFiltrarClick
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
    Left = 8
    Top = 304
    Width = 969
    Height = 321
    ActivePage = Chequera
    TabOrder = 6
    object Chequera: TTabSheet
      Caption = 'Chequera'
      object DBGrid2: TDBGrid
        Left = 9
        Top = 8
        Width = 944
        Height = 277
        DataSource = dsdet
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object Saldos: TTabSheet
      Caption = 'Saldos'
      ImageIndex = 1
      object sgSaldos: TSGCtrl
        Left = 4
        Top = 6
        Width = 949
        Height = 275
        ShowTab = True
        BevelOuter = bvNone
        TabOrder = 0
        TabWidth = 0
        ShowBtnPriorNext = True
        ShowBtnFirst = True
        ShowBtnLast = True
      end
    end
  end
  object chbMultiSelect: TCheckBox
    Left = 344
    Top = 24
    Width = 113
    Height = 17
    Caption = 'Selección Múltiple'
    TabOrder = 7
  end
  object btnGeneraUno: TBitBtn
    Left = 512
    Top = 44
    Width = 185
    Height = 25
    Caption = 'Genera Manualmente &Uno'
    TabOrder = 8
    OnClick = btnGeneraUnoClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000078
      88887FFFFFFFFF0788887F6F6F6F6F0778887FF6F6F6FF0078887F6F6F6F6F08
      07887FFFFFFFFF0807787F4C4C4FFF0800787FFFFFFFFF08080787888888888F
      0807887F4C4C4CFF0808887FFFFFFFFF08088887888888888F0888887F4C4CFF
      FF0888887FFFFFFFFF0888888777777777888888888888888888}
  end
  object pAniBar: TPanel
    Left = 162
    Top = 278
    Width = 807
    Height = 25
    TabOrder = 9
  end
  object BitBtn1: TBitBtn
    Left = 730
    Top = 84
    Width = 231
    Height = 25
    Caption = 'Genera Automáticamente &Bloque CSV'
    TabOrder = 10
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000078
      88887FFFFFFFFF0788887F6F6F6F6F0778887FF6F6F6FF0078887F6F6F6F6F08
      07887FFFFFFFFF0807787F4C4C4FFF0800787FFFFFFFFF08080787888888888F
      0807887F4C4C4CFF0808887FFFFFFFFF08088887888888888F0888887F4C4CFF
      FF0888887FFFFFFFFF0888888777777777888888888888888888}
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
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 661
    Top = 40
  end
  object qSaldos: TQuery
    Left = 288
    Top = 8
  end
  object ExcelWorksheetO: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 368
    Top = 8
  end
  object ExcelWorkbookO: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 408
    Top = 8
  end
  object ExcelApplicationO: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 448
    Top = 8
  end
  object dstot: TDataSource
    DataSet = QueryTot
    Left = 40
    Top = 40
  end
  object qDetalle: TQuery
    DatabaseName = 'RCORP'
    DataSource = dstot
    SQL.Strings = (
      'SELECT'
      '              DV.ID_TRANSACCION   As Referencia,'
      '              DV.F_LIQUIDACION    As FLiquidacion,'
      #9#9#9#9#9#9#9'DV.CVE_OPERACION    As CveOperacion,'
      #9#9#9#9#9#9#9'OPE.DESC_L_ID_PRIM AS DescOperacion,'
      '              DV.IMP_TRANS       As Importe,'
      '              DV.TX_REFERENCIA,   DV.SDO_DISPONIBLE,'
      ' '#9#9#9'        OPE.CVE_AF_SDO_EFE  As Naturaleza'
      ''
      '            FROM DV_TRANSACCION DV, DV_OPERACION OPE'
      '           WHERE'
      '               DV.ID_CONTRATO = :ID_CONTRATO'
      '             AND DV.ID_COD_RESP = 0'
      '             AND DV.CVE_OPERACION = OPE.CVE_OPERACION'
      #9'     AND OPE.B_MUESTRA_EDOCTA='#39'V'#39
      '         ORDER BY ID_TRANSACCION ASC'
      ''
      #9#9#9#9' '
      #9#9' '#9#9' '
      ' '
      ' '
      ' ')
    Left = 40
    Top = 288
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID_CONTRATO'
        ParamType = ptUnknown
      end>
    object qDetalleREFERENCIA: TFloatField
      FieldName = 'REFERENCIA'
    end
    object qDetalleFLIQUIDACION: TDateTimeField
      FieldName = 'FLIQUIDACION'
    end
    object qDetalleCVEOPERACION: TStringField
      FieldName = 'CVEOPERACION'
      Size = 6
    end
    object qDetalleDESCOPERACION: TStringField
      FieldName = 'DESCOPERACION'
      Size = 50
    end
    object qDetalleIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object qDetalleTX_REFERENCIA: TStringField
      FieldName = 'TX_REFERENCIA'
      Size = 200
    end
    object qDetalleSDO_DISPONIBLE: TFloatField
      FieldName = 'SDO_DISPONIBLE'
    end
    object qDetalleNATURALEZA: TStringField
      FieldName = 'NATURALEZA'
      Size = 1
    end
  end
  object dsdet: TDataSource
    DataSet = qDetalle
    Left = 72
    Top = 288
  end
  object QueryTot: TQuery
    DatabaseName = 'RCORP'
    SQL.Strings = (
      
        'select to_number (rtrim (PKGCRPERIODO.STPObtChqCte (null, null, ' +
        'cre.id_credito, '#39'AC'#39', '#39'AD'#39', '#39'CR'#39') ) ) as ID_CONTRATO,'
      '       PER.NOMBRE,'
      '       cre.id_credito'
      'from   cr_contrato crc,'
      '       cr_credito cre,'
      '       contrato cto,'
      '       persona per'
      'where  cre.id_contrato = crc.id_contrato'
      'and    crc.cve_producto_cre in (select CVE_PRODUCTO_CRE'
      '                                from   CR_PRODUCTO'
      
        '                                where  desc_l_producto like '#39'%AG' +
        'RO%MAS%'#39')'
      'and    cre.sit_credito = '#39'AC'#39
      'and    cto.id_contrato = crc.id_contrato'
      'and    per.id_persona = cto.id_titular'
      'order by cre.id_credito')
    Left = 22
    Top = 15
    object QueryTotID_CONTRATO: TFloatField
      FieldName = 'ID_CONTRATO'
    end
    object QueryTotNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object QueryTotID_CREDITO: TFloatField
      FieldName = 'ID_CREDITO'
    end
  end
end
