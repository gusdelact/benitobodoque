object WCrConc: TWCrConc
  Left = 321
  Top = 139
  Width = 608
  Height = 380
  Caption = 'Conciliador Interno'
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
    Left = 8
    Top = 288
    Width = 585
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
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 585
    Height = 273
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Conciliador'
      object lbArchivoEntrada: TLabel
        Left = 8
        Top = 26
        Width = 148
        Height = 13
        Caption = 'Nombre del Archivo de Entrada'
      end
      object sbArchivoEntrada: TSpeedButton
        Left = 467
        Top = 21
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
      object lbFCierre: TLabel
        Left = 8
        Top = 72
        Width = 75
        Height = 13
        Caption = 'Fecha de Cierre'
      end
      object lbArchivoSalida: TLabel
        Left = 8
        Top = 114
        Width = 140
        Height = 13
        Caption = 'Nombre del Archivo de Salida'
      end
      object sbArchivoSalida: TSpeedButton
        Left = 467
        Top = 109
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
      object edArchivoEntrada: TEdit
        Tag = 50
        Left = 169
        Top = 22
        Width = 280
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnExit = edArchivoEntradaExit
      end
      object dtFCierre: TDateTimePicker
        Left = 166
        Top = 68
        Width = 85
        Height = 21
        CalAlignment = dtaLeft
        Date = 39973.4085888657
        Time = 39973.4085888657
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
      object edArchivoSalida: TEdit
        Tag = 18
        Left = 168
        Top = 110
        Width = 281
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
        OnExit = edArchivoSalidaExit
      end
      object cbFVal: TCheckBox
        Left = 8
        Top = 152
        Width = 137
        Height = 17
        Caption = 'Utilizar fecha valor'
        TabOrder = 3
        Visible = False
      end
      object bbConciliar: TBitBtn
        Left = 8
        Top = 173
        Width = 153
        Height = 25
        Caption = 'Conciliar'
        TabOrder = 4
        OnClick = bbConciliarClick
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
      object pAniBar: TPanel
        Left = 202
        Top = 180
        Width = 367
        Height = 25
        TabOrder = 5
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Créditos NO en Buró'
      ImageIndex = 1
      object Label1: TLabel
        Left = 112
        Top = 46
        Width = 65
        Height = 13
        Caption = 'Buró - Cartera'
      end
      object Label2: TLabel
        Left = 372
        Top = 46
        Width = 65
        Height = 13
        Caption = 'Cartera - Buró'
      end
      object buroSGDatos: TSGCtrl
        Left = 63
        Top = 64
        Width = 186
        Height = 177
        ShowTab = True
        BevelOuter = bvNone
        TabOrder = 0
        TabWidth = 0
        ShowBtnPriorNext = True
        ShowBtnFirst = True
        ShowBtnLast = True
      end
      object bActInfo: TButton
        Left = 8
        Top = 8
        Width = 169
        Height = 25
        Caption = 'Actualiza Información'
        TabOrder = 1
        OnClick = bActInfoClick
      end
      object carteraSGDATOS: TSGCtrl
        Left = 311
        Top = 64
        Width = 186
        Height = 177
        ShowTab = True
        BevelOuter = bvNone
        TabOrder = 2
        TabWidth = 0
        ShowBtnPriorNext = True
        ShowBtnFirst = True
        ShowBtnLast = True
      end
    end
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
    Left = 405
    Top = 184
  end
  object sdArchivoSalida: TSaveDialog
    DefaultExt = 'xls'
    Filter = '*.xls|*.xls'
    Left = 30
    Top = 65535
  end
  object ExcelWorkbookI: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 264
    Top = 184
  end
  object ExcelWorksheetI: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 232
    Top = 184
  end
  object ExcelApplicationI: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 432
    Top = 184
  end
  object ExcelApplicationO: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 432
    Top = 152
  end
  object ExcelWorksheetO: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 232
    Top = 152
  end
  object ExcelWorkbookO: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 264
    Top = 152
  end
  object odArchivoEntrada: TOpenDialog
    DefaultExt = 'xls'
    Filter = '*.xls|*.xls'
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'xls'
    Filter = '*.xls|*.xls'
  end
  object OpenDialog2: TOpenDialog
    DefaultExt = 'xls'
    Filter = '*.xls|*.xls'
  end
end
