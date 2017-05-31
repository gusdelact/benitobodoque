object WCrroepneg: TWCrroepneg
  Left = 531
  Top = 208
  Width = 450
  Height = 397
  Caption = 'Producto Negocio ROE'
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
    Top = 51
    Width = 440
    Height = 289
    Caption = 'Tabla'
    TabOrder = 2
    object Shape4: TShape
      Left = 16
      Top = 88
      Width = 70
      Height = 18
      Brush.Color = clInfoBk
    end
    object Label3: TLabel
      Left = 23
      Top = 91
      Width = 55
      Height = 13
      Alignment = taCenter
      Caption = 'Clave Prod.'
      Color = clInfoBk
      ParentColor = False
      Transparent = True
    end
    object Shape2: TShape
      Left = 85
      Top = 88
      Width = 70
      Height = 18
      Brush.Color = clInfoBk
    end
    object Label5: TLabel
      Left = 92
      Top = 91
      Width = 56
      Height = 13
      Alignment = taCenter
      Caption = 'Clave Linea'
      Color = clInfoBk
      ParentColor = False
      Transparent = True
    end
    object Shape1: TShape
      Left = 154
      Top = 88
      Width = 168
      Height = 18
      Brush.Color = clInfoBk
    end
    object Label1: TLabel
      Left = 186
      Top = 91
      Width = 102
      Height = 13
      Alignment = taCenter
      Caption = 'Descripción Producto'
      Color = clInfoBk
      ParentColor = False
      Transparent = True
    end
    object Shape3: TShape
      Left = 321
      Top = 88
      Width = 75
      Height = 18
      Brush.Color = clInfoBk
    end
    object Label4: TLabel
      Left = 330
      Top = 91
      Width = 58
      Height = 13
      Alignment = taCenter
      Caption = 'Roe Mínima'
      Color = clInfoBk
      ParentColor = False
      Transparent = True
    end
    object lbCVE_GRUPO_ECO: TLabel
      Left = 8
      Top = 23
      Width = 55
      Height = 13
      Caption = 'Clave Prod.'
    end
    object Label6: TLabel
      Left = 8
      Top = 55
      Width = 58
      Height = 13
      Caption = 'Clave Línea'
    end
    object Label7: TLabel
      Left = 184
      Top = 55
      Width = 58
      Height = 13
      Caption = 'Roe Mínima'
    end
    object Label2: TLabel
      Left = 184
      Top = 23
      Width = 56
      Height = 13
      Caption = 'Descripción'
    end
    object strgrdDatos: TStringGrid
      Left = 15
      Top = 105
      Width = 406
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
      Left = 341
      Top = 256
      Width = 81
      Height = 21
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
    object edCveProd: TInterEdit
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
      TabOrder = 2
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edCveLineaNeg: TInterEdit
      Tag = 18
      Left = 74
      Top = 51
      Width = 70
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 10
      TabOrder = 3
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
      Left = 250
      Top = 19
      Width = 162
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 25
      TabOrder = 4
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edRoeMin: TInterEdit
      Tag = 18
      Left = 250
      Top = 51
      Width = 70
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      MaxLength = 12
      TabOrder = 5
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object GroupBox1: TGroupBox
    Left = 1
    Top = -1
    Width = 440
    Height = 51
    TabOrder = 1
    object Label8: TLabel
      Left = 6
      Top = 11
      Width = 426
      Height = 13
      Caption = 
        'NOTA: Antes de realizar cualquier alta en esta pantalla, asegure' +
        'se que se encuentre dada'
    end
    object Label9: TLabel
      Left = 132
      Top = 25
      Width = 206
      Height = 13
      Caption = 'de alta en el catálogo de Línea de Negocio'
    end
  end
  object PnDatos: TPanel
    Left = 1
    Top = 347
    Width = 440
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
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
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
    Left = 402
    Top = 2
  end
end
