object WCrExpPPDe: TWCrExpPPDe
  Left = 236
  Top = 112
  Width = 483
  Height = 435
  Caption = 'Explorador de Propósitos y Destino de los Recursos del Proyecto'
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
  object lbID_CREDITO: TLabel
    Left = 2
    Top = 12
    Width = 53
    Height = 13
    Caption = 'No. Crédito'
  end
  object lbID_SOLICITUD: TLabel
    Left = 2
    Top = 33
    Width = 60
    Height = 13
    Caption = 'No. Solicitud'
  end
  object Shape9: TShape
    Left = 8
    Top = 70
    Width = 140
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label22: TLabel
    Left = 29
    Top = 73
    Width = 98
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Clave de Propósito'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
  end
  object Shape1: TShape
    Left = 147
    Top = 70
    Width = 326
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label18: TLabel
    Left = 241
    Top = 73
    Width = 139
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Descripción'
    Color = clInfoBk
    ParentColor = False
  end
  object Shape2: TShape
    Left = 8
    Top = 54
    Width = 465
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label1: TLabel
    Left = 171
    Top = 57
    Width = 139
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Propósitos del Proyecto'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Shape3: TShape
    Left = 8
    Top = 232
    Width = 140
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label2: TLabel
    Left = 29
    Top = 235
    Width = 98
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Clave de Tipo'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
  end
  object Shape4: TShape
    Left = 147
    Top = 232
    Width = 326
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label3: TLabel
    Left = 241
    Top = 235
    Width = 139
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Descripción'
    Color = clInfoBk
    ParentColor = False
  end
  object Shape5: TShape
    Left = 8
    Top = 216
    Width = 465
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label4: TLabel
    Left = 135
    Top = 219
    Width = 210
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Tipos de Detino de los Recursos'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object edID_CREDITO: TEdit
    Left = 72
    Top = 8
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  object edDESC_CREDITO: TEdit
    Left = 152
    Top = 8
    Width = 321
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object edID_SOLICITUD: TEdit
    Left = 72
    Top = 29
    Width = 73
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object PnDatos: TPanel
    Left = 0
    Top = 379
    Width = 473
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
      Left = 320
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
      Left = 320
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
      Left = 384
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
      Left = 384
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
  object sgcDATA: TSGCtrl
    Left = 8
    Top = 88
    Width = 465
    Height = 121
    ShowTab = True
    TabOrder = 3
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnDblClick = sgcDATADblClick
    object btnEliminaProp: TBitBtn
      Left = 389
      Top = 97
      Width = 75
      Height = 20
      Caption = 'Eliminar'
      TabOrder = 3
      OnClick = btnEliminaPropClick
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
    object btnAgregaProp: TBitBtn
      Left = 310
      Top = 97
      Width = 75
      Height = 20
      Caption = 'Agregar'
      TabOrder = 2
      OnClick = btnAgregaPropClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
  end
  object sgcDatos: TSGCtrl
    Left = 8
    Top = 250
    Width = 465
    Height = 121
    ShowTab = True
    TabOrder = 4
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnDblClick = sgcDatosDblClick
    object btnEliminaDes: TBitBtn
      Left = 389
      Top = 97
      Width = 75
      Height = 20
      Caption = 'Eliminar'
      TabOrder = 3
      OnClick = btnEliminaDesClick
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
    object btnAgregaDes: TBitBtn
      Left = 310
      Top = 97
      Width = 75
      Height = 20
      Caption = 'Agregar'
      TabOrder = 2
      OnClick = btnAgregaDesClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
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
    OnDespuesShow = InterForma1DespuesShow
    Left = 330
    Top = 12
  end
end
