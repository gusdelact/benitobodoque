object WCrroefond: TWCrroefond
  Left = 646
  Top = 224
  Width = 437
  Height = 376
  Caption = 'Costo de Fondeo Roe'
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
  object lbCVE_GRUPO_ECO: TLabel
    Left = 22
    Top = 24
    Width = 27
    Height = 13
    Caption = 'Clave'
  end
  object Label2: TLabel
    Left = 23
    Top = 54
    Width = 56
    Height = 13
    Caption = 'Día Mínimo'
  end
  object Label6: TLabel
    Left = 193
    Top = 24
    Width = 57
    Height = 13
    Caption = 'Día Máximo'
  end
  object Label7: TLabel
    Left = 194
    Top = 54
    Width = 81
    Height = 13
    Caption = 'Costo de Fondeo'
  end
  object Shape4: TShape
    Left = 29
    Top = 104
    Width = 66
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label3: TLabel
    Left = 43
    Top = 107
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
    Left = 94
    Top = 104
    Width = 66
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label5: TLabel
    Left = 107
    Top = 107
    Width = 43
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Día Min.'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
  end
  object Shape1: TShape
    Left = 159
    Top = 104
    Width = 66
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label1: TLabel
    Left = 168
    Top = 107
    Width = 49
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Día Max.'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
  end
  object Shape3: TShape
    Left = 224
    Top = 104
    Width = 98
    Height = 18
    Brush.Color = clInfoBk
  end
  object Label4: TLabel
    Left = 232
    Top = 107
    Width = 81
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Costo de Fondeo'
    Color = clInfoBk
    ParentColor = False
    Transparent = True
  end
  object edCveCostoFondeo: TInterEdit
    Tag = 18
    Left = 88
    Top = 20
    Width = 70
    Height = 21
    HelpContext = 1100
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    MaxLength = 6
    TabOrder = 0
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edDiaMin: TInterEdit
    Tag = 18
    Left = 88
    Top = 50
    Width = 70
    Height = 21
    HelpContext = 1100
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    MaxLength = 6
    TabOrder = 1
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edDiaMax: TInterEdit
    Tag = 18
    Left = 288
    Top = 20
    Width = 70
    Height = 21
    HelpContext = 1100
    Prefijo = '1'
    Contrato = -1
    TipoReader = trEntero
    MaxLength = 6
    TabOrder = 2
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object edCostoFondeo: TInterEdit
    Tag = 18
    Left = 288
    Top = 50
    Width = 70
    Height = 21
    HelpContext = 1100
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    MaxLength = 12
    TabOrder = 3
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object strgrdDatos: TStringGrid
    Left = 27
    Top = 120
    Width = 350
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
    TabOrder = 4
    OnDrawCell = strgrdDatosDrawCell
    OnMouseDown = strgrdDatosMouseDown
  end
  object btACTUALIZA: TBitBtn
    Tag = 17
    Left = 297
    Top = 271
    Width = 81
    Height = 21
    Caption = 'Actualiza'
    TabOrder = 5
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
  object PnDatos: TPanel
    Left = 0
    Top = 311
    Width = 417
    Height = 21
    TabOrder = 6
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
    object lbPerfil: TLabel
      Left = 235
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
    object lbDPerfil: TLabel
      Left = 271
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
    Left = 370
    Top = 2
  end
end
