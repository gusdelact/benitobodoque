object WRepCre50M: TWRepCre50M
  Left = 401
  Top = 146
  Width = 717
  Height = 483
  Caption = 'Creditos con Montos Autorizados mayores a 50 Millones'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnDatos: TPanel
    Left = 0
    Top = 423
    Width = 705
    Height = 18
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
      Left = 325
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
      Left = 325
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
      Left = 488
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
      Left = 488
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
  object PageControl1: TPageControl
    Left = 0
    Top = 80
    Width = 705
    Height = 337
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Reporte 50 M'
      object sgDatos: TSGCtrl
        Left = 0
        Top = 8
        Width = 697
        Height = 305
        ShowTab = True
        TabOrder = 0
        TabWidth = 0
        ShowBtnPriorNext = True
        ShowBtnFirst = True
        ShowBtnLast = True
        object btConsulta: TBitBtn
          Left = 558
          Top = 280
          Width = 136
          Height = 21
          Caption = '&Ejecuta Consulta'
          TabOrder = 2
          OnClick = btConsultaClick
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
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Resumen 50M'
      ImageIndex = 1
      object lbArchivoSalida: TLabel
        Left = 8
        Top = 282
        Width = 106
        Height = 13
        Caption = 'Generar Archivo Excel'
      end
      object sbArchivoSalida: TSpeedButton
        Left = 459
        Top = 277
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
        OnClick = sbArchivoSalidaClick
      end
      object edArchivoSalida: TEdit
        Tag = 18
        Left = 120
        Top = 278
        Width = 337
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object sagR50_LAYOUT: TStringAlignGrid
        Left = 8
        Top = 24
        Width = 473
        Height = 245
        ColCount = 3
        RowCount = 2
        TabOrder = 1
        ColWidths = (
          64
          256
          128)
        Cells = (
          1
          0
          'Grupo'
          2
          0
          'Monto')
        PropCell = ()
        PropCol = ()
        PropRow = ()
        PropFixedCol = ()
        PropFixedRow = ()
      end
      object btActualiza: TBitBtn
        Left = 344
        Top = 0
        Width = 136
        Height = 21
        Caption = '&Ejecuta Consulta'
        TabOrder = 2
        OnClick = btActualizaClick
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
    end
    object TabSheet3: TTabSheet
      Caption = 'Resumen Cartera'
      ImageIndex = 2
      object Label5: TLabel
        Left = 8
        Top = 282
        Width = 106
        Height = 13
        Caption = 'Generar Archivo Excel'
      end
      object sbArchivoSalida2: TSpeedButton
        Left = 459
        Top = 277
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
        OnClick = sbArchivoSalida2Click
      end
      object btActualiza2: TBitBtn
        Left = 344
        Top = 0
        Width = 136
        Height = 21
        Caption = '&Ejecuta Consulta'
        TabOrder = 0
        OnClick = btActualiza2Click
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
      object sagRC_LAYOUT: TStringAlignGrid
        Left = 8
        Top = 24
        Width = 473
        Height = 245
        ColCount = 3
        RowCount = 2
        TabOrder = 1
        ColWidths = (
          64
          256
          128)
        Cells = (
          1
          0
          'Grupo'
          2
          0
          'Monto')
        PropCell = ()
        PropCol = ()
        PropRow = ()
        PropFixedCol = ()
        PropFixedRow = ()
      end
      object edArchivoSalida2: TEdit
        Tag = 18
        Left = 120
        Top = 278
        Width = 337
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 2
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 697
    Height = 71
    Caption = 'Parámetros de Consulta'
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 20
      Width = 39
      Height = 13
      Caption = 'Fecha:  '
    end
    object Label2: TLabel
      Left = 300
      Top = 20
      Width = 120
      Height = 13
      Caption = 'Tipo de Cambio (DOLAR)'
    end
    object Label3: TLabel
      Left = 12
      Top = 48
      Width = 112
      Height = 13
      Caption = 'Límite inferior del monto'
    end
    object Label4: TLabel
      Left = 305
      Top = 48
      Width = 118
      Height = 13
      Caption = 'Límite superior del monto'
    end
    object DTP_FECHA_DIA: TDateTimePicker
      Left = 149
      Top = 16
      Width = 110
      Height = 21
      CalAlignment = dtaLeft
      Date = 39827.4162567708
      Time = 39827.4162567708
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object ed_TipoCambio: TEdit
      Left = 498
      Top = 16
      Width = 109
      Height = 21
      MaxLength = 10
      TabOrder = 1
      OnKeyPress = ed_TipoCambioKeyPress
    end
    object ed_montoinf: TInterEdit
      Left = 148
      Top = 44
      Width = 109
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      MaxLength = 12
      TabOrder = 2
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object ed_montosup: TInterEdit
      Left = 498
      Top = 44
      Width = 109
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      MaxLength = 12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 3
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
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
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    OnDespuesShow = InterForma1DespuesShow
    Left = 8
    Top = 232
  end
  object qDatos: TQuery
    DatabaseName = 'PCORP'
    Left = 8
    Top = 168
  end
  object sdArchivoSalida: TSaveDialog
    DefaultExt = 'xls'
    Filter = '*.xls|*.xls'
    Left = 8
    Top = 200
  end
  object ExcelWorksheetO: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 672
    Top = 24
  end
  object ExcelWorkbookO: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 672
    Top = 56
  end
  object ExcelApplicationO: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 672
    Top = 88
  end
end
