object WCrLinGPPerd: TWCrLinGPPerd
  Left = 323
  Top = 258
  Width = 513
  Height = 361
  Caption = 'Líneas Garantía Primeras Pérdidas'
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
    Left = 3
    Top = 10
    Width = 60
    Height = 13
    Caption = 'No. Solicitud'
  end
  object shp4: TShape
    Left = 1
    Top = 31
    Width = 74
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label2: TLabel
    Left = 4
    Top = 34
    Width = 68
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Autorización'
    Color = clInfoBk
    ParentColor = False
  end
  object Shape6: TShape
    Left = 197
    Top = 31
    Width = 171
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label9: TLabel
    Left = 201
    Top = 34
    Width = 163
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Descripción Producto'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
  end
  object Shape4: TShape
    Left = 74
    Top = 31
    Width = 51
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label6: TLabel
    Left = 78
    Top = 34
    Width = 43
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Folio'
    Color = clInfoBk
    ParentColor = False
  end
  object Shape7: TShape
    Left = 367
    Top = 31
    Width = 74
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label8: TLabel
    Left = 371
    Top = 34
    Width = 66
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'F.Vencimiento'
    Color = clInfoBk
    ParentColor = False
  end
  object Shape9: TShape
    Left = 440
    Top = 31
    Width = 54
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label11: TLabel
    Left = 444
    Top = 34
    Width = 46
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Sit. Cto.'
    Color = clInfoBk
    ParentColor = False
  end
  object Label12: TLabel
    Left = 0
    Top = 246
    Width = 72
    Height = 13
    Caption = 'Usuario de Alta'
  end
  object Label13: TLabel
    Left = 291
    Top = 246
    Width = 66
    Height = 13
    Caption = 'Fecha de Alta'
  end
  object Shape1: TShape
    Left = 124
    Top = 31
    Width = 74
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label3: TLabel
    Left = 127
    Top = 34
    Width = 68
    Height = 12
    Alignment = taCenter
    AutoSize = False
    Caption = 'Clave'
    Color = clInfoBk
    ParentColor = False
  end
  object Label4: TLabel
    Left = 0
    Top = 225
    Width = 58
    Height = 13
    Caption = 'Autorización'
  end
  object edID_SOLICITUD: TEdit
    Left = 76
    Top = 6
    Width = 121
    Height = 21
    Hint = 'Tipo de Garantía'
    HelpContext = 1100
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 6
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
  end
  object sgcDATA: TSGCtrl
    Left = 0
    Top = 49
    Width = 495
    Height = 167
    ShowTab = True
    TabOrder = 1
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnMoveRow = sgcDATAMoveRow
    object btEliminar: TBitBtn
      Left = 368
      Top = 143
      Width = 126
      Height = 20
      Caption = 'Eliminar Autorización'
      TabOrder = 2
      OnClick = btEliminarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btContrato: TBitBtn
      Left = 242
      Top = 143
      Width = 124
      Height = 20
      Caption = 'Agrega Autorización'
      TabOrder = 3
      OnClick = btContratoClick
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
  object PnDatos: TPanel
    Left = -2
    Top = 302
    Width = 497
    Height = 21
    TabOrder = 2
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
      Left = 283
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
      Left = 283
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
      Left = 347
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
      Left = 347
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
  object edID_CONTRATO: TInterEdit
    Left = 80
    Top = 221
    Width = 121
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trContrato
    MaxLength = 10
    Color = clBtnFace
    TabOrder = 3
    ReadOnly = True
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edF_ALTA: TEdit
    Left = 368
    Top = 242
    Width = 121
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object edCVE_USU_ALTA: TEdit
    Left = 80
    Top = 242
    Width = 121
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object btnBitCambios: TBitBtn
    Tag = 17
    Left = 264
    Top = 275
    Width = 232
    Height = 21
    Caption = 'Bitácora Cambio'
    TabOrder = 6
    OnClick = btnBitCambiosClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
      555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
      05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
      FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
      FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
      FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
      05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
      555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
      9055575757575757775505050505055505557575757575557555}
    NumGlyphs = 2
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
    OnDespuesShow = InterForma1DespuesShow
    Left = 449
    Top = 65535
  end
end
