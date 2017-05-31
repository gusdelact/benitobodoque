object WCrCieEdc: TWCrCieEdc
  Left = 380
  Top = 231
  Width = 795
  Height = 441
  Caption = 'Cierre Estados de Cuenta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 144
    Top = 14
    Width = 60
    Height = 13
    Caption = 'Fecha Cierre'
  end
  object Label5: TLabel
    Left = 698
    Top = 363
    Width = 72
    Height = 13
    Caption = 'Ver: IR 201404'
  end
  object Memo2: TQRMemo
    Left = 91
    Top = 41
    Width = 43
    Height = 16
    Enabled = False
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      42.3333333333333
      240.770833333333
      108.479166666667
      113.770833333333)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object InterProcesos1: TInterProcesos
    Left = 0
    Top = 38
    Width = 773
    Height = 324
    OnGeneraProceso = InterProcesos1GeneraProceso
    OnDespuesProceso = InterProcesos1DespuesProceso
  end
  object bbApertura: TBitBtn
    Left = 520
    Top = 5
    Width = 169
    Height = 30
    Caption = 'Inicia Proceso'
    TabOrder = 0
    TabStop = False
    OnClick = bbAperturaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330FFFFF
      FFF03333337F3FFFF3F73333330F0000F0F03333337F777737373333330FFFFF
      FFF033FFFF7FFF33FFF77000000007F00000377777777FF777770BBBBBBBB0F0
      FF037777777777F7F3730B77777BB0F0F0337777777777F7F7330B7FFFFFB0F0
      0333777F333377F77F330B7FFFFFB0009333777F333377777FF30B7FFFFFB039
      9933777F333377F777FF0B7FFFFFB0999993777F33337777777F0B7FFFFFB999
      9999777F3333777777770B7FFFFFB0399933777FFFFF77F777F3070077007039
      99337777777777F777F30B770077B039993377FFFFFF77F777330BB7007BB999
      93337777FF777777733370000000073333333777777773333333}
    NumGlyphs = 2
  end
  object PnDatos: TPanel
    Left = 1
    Top = 392
    Width = 773
    Height = 19
    TabOrder = 2
    object lbEmpresa: TLabel
      Left = 11
      Top = 1
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
      Top = 8
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
      Left = 420
      Top = 1
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
      Left = 420
      Top = 8
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
      Top = 8
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
      Left = 484
      Top = 8
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
      Left = 484
      Top = 1
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
      Top = 1
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
  object edFECHA_CIERRE: TEdit
    Left = 214
    Top = 10
    Width = 90
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
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
    Left = 754
    Top = 5
  end
  object NMFTP1: TNMFTP
    Port = 21
    ReportLevel = 0
    Vendor = 2411
    ParseList = False
    ProxyPort = 0
    Passive = False
    FirewallType = FTUser
    FWAuthenticate = False
    Left = 4
    Top = 6
  end
  object NMSMTP1: TNMSMTP
    Host = '132.1.4.130'
    Port = 25
    ReportLevel = 0
    PostMessage.LocalProgram = 'NetMasters SMTP Demo'
    EncodeType = uuMime
    ClearParams = True
    SubType = mtPlain
    Charset = 'us-ascii'
    Left = 724
    Top = 5
  end
end
