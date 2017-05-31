object WCrroelneg: TWCrroelneg
  Left = 646
  Top = 224
  Width = 352
  Height = 381
  Caption = 'Línea de Negocio ROE'
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
  object GroupBox2: TGroupBox
    Left = 1
    Top = 85
    Width = 327
    Height = 233
    Caption = 'Tabla'
    TabOrder = 2
    object Shape4: TShape
      Left = 22
      Top = 29
      Width = 66
      Height = 18
      Brush.Color = clInfoBk
    end
    object Label3: TLabel
      Left = 35
      Top = 32
      Width = 42
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Clave'
      Color = clInfoBk
      ParentColor = False
      Transparent = True
    end
    object Shape2: TShape
      Left = 87
      Top = 29
      Width = 180
      Height = 18
      Brush.Color = clInfoBk
    end
    object Label5: TLabel
      Left = 140
      Top = 32
      Width = 56
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Descripción'
      Color = clInfoBk
      ParentColor = False
      Transparent = True
    end
    object strgrdDatos: TStringGrid
      Left = 21
      Top = 46
      Width = 278
      Height = 149
      HelpContext = -1
      TabStop = False
      BiDiMode = bdRightToLeft
      ColCount = 1
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      ParentBiDiMode = False
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      OnDrawCell = strgrdDatosDrawCell
      OnMouseDown = strgrdDatosMouseDown
    end
    object btACTUALIZA: TBitBtn
      Tag = 17
      Left = 100
      Top = 197
      Width = 81
      Height = 20
      Caption = 'Actualiza'
      TabOrder = 1
      OnClick = btACTUALIZAClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
        00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
        00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
        00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
        03FF33337FFF77777333333300000333333F3333777773333333}
      NumGlyphs = 2
    end
    object btALTA_PROD: TBitBtn
      Tag = 17
      Left = 181
      Top = 197
      Width = 119
      Height = 20
      Caption = 'Producto Negocio'
      TabOrder = 2
      OnClick = btALTA_PRODClick
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
  object GroupBox1: TGroupBox
    Left = 1
    Top = -1
    Width = 327
    Height = 84
    Caption = 'Valores'
    TabOrder = 1
    object lbCVE_GRUPO_ECO: TLabel
      Left = 8
      Top = 23
      Width = 27
      Height = 13
      Caption = 'Clave'
    end
    object Label2: TLabel
      Left = 8
      Top = 49
      Width = 56
      Height = 13
      Caption = 'Descripción'
    end
    object edCveLineaNegocio: TInterEdit
      Tag = 18
      Left = 74
      Top = 19
      Width = 70
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 10
      TabOrder = 0
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edDescripcion: TInterEdit
      Tag = 18
      Left = 74
      Top = 45
      Width = 180
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 25
      TabOrder = 1
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object PnDatos: TPanel
    Left = 1
    Top = 319
    Width = 326
    Height = 21
    TabOrder = 0
    object lbEmpresa: TLabel
      Left = 5
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
      Left = 5
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
    object lbDUsuario: TLabel
      Left = 47
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
    object lbDEmpresa: TLabel
      Left = 47
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
    OnDespuesEliminar = InterForma1DespuesEliminar
    OnErrorEliminar = InterForma1ErrorEliminar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesEliminar = InterForma1AntesEliminar
    OnAntesModificar = InterForma1AntesModificar
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
    Left = 290
    Top = 13
  end
end
