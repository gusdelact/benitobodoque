object WCrCreRest: TWCrCreRest
  Left = 312
  Top = 162
  Width = 787
  Height = 506
  Caption = 'Consulta de Créditos Restringidos'
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
    Width = 777
    Height = 465
    TabOrder = 0
    object Label3: TLabel
      Left = 8
      Top = 12
      Width = 60
      Height = 13
      Caption = 'Fecha Cierre'
    end
    object Label4: TLabel
      Left = 7
      Top = 356
      Width = 106
      Height = 13
      Caption = 'Generar Archivo Excel'
    end
    object bbCredRest: TBitBtn
      Tag = 17
      Left = 641
      Top = 6
      Width = 128
      Height = 25
      Caption = 'Muestra datos'
      TabOrder = 0
      OnClick = bbCredRestClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF5555555555555A055555
        55555555588FF55555555555AAA05555555555558888F55555555555AAA05555
        555555558888FF555555555AAAAA05555555555888888F55555555AAAAAA0555
        5555558888888FF5555558AA05AAA05555555888858888F555558A05555AA055
        55558885555888FF55555555555AAA05555555555558888F555555555555AA05
        555555555555888FF555555555555AA05555555555555888FF5555555555558A
        05555555555555888FF5555555555558A05555555555555888FF555555555555
        5AA0555555555555588855555555555555555555555555555555}
      NumGlyphs = 2
    end
    object dtpFechaCierre: TDateTimePicker
      Left = 70
      Top = 8
      Width = 89
      Height = 21
      CalAlignment = dtaLeft
      Date = 39083.4646909259
      Time = 39083.4646909259
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object dbgCredRest: TDBGrid
      Left = 7
      Top = 43
      Width = 762
      Height = 313
      DataSource = dsCredRest
      FixedColor = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object edArchivoCredRest: TEdit
      Left = 7
      Top = 373
      Width = 637
      Height = 21
      TabOrder = 3
      Text = 'C:\'
    end
    object ProgressBar1: TProgressBar
      Left = 7
      Top = 398
      Width = 759
      Height = 17
      Min = 0
      Max = 100
      TabOrder = 4
    end
    object PnDatos: TPanel
      Left = -1
      Top = 444
      Width = 778
      Height = 21
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
        Left = 423
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
        Left = 423
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
        Left = 487
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
        Left = 487
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
  end
  object bArchivoCredRest: TButton
    Left = 648
    Top = 373
    Width = 28
    Height = 21
    Caption = '...'
    TabOrder = 1
    OnClick = bArchivoCredRestClick
  end
  object bbGenArchivoCredRest: TButton
    Left = 680
    Top = 372
    Width = 88
    Height = 22
    Caption = 'Genera Archivo'
    TabOrder = 2
    OnClick = bbGenArchivoCredRestClick
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
    Left = 738
    Top = 149
  end
  object qryCreditosRestringidos: TQuery
    DatabaseName = 'PCORP'
    Left = 738
    Top = 117
  end
  object dsCredRest: TDataSource
    AutoEdit = False
    DataSet = qryCreditosRestringidos
    Left = 737
    Top = 85
  end
  object sdCredRest: TSaveDialog
    DefaultExt = '*.XLS'
    Filter = 'Microsoft Office Excel Workbook (*.xls)|*.xls'
    Left = 736
    Top = 53
  end
end
