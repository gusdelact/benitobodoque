object WCrctroeob: TWCrctroeob
  Left = 559
  Top = 201
  Width = 545
  Height = 447
  Caption = 'ROE Objetivo'
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
  object GroupBox1: TGroupBox
    Left = 1
    Top = 1
    Width = 536
    Height = 416
    TabOrder = 0
    object Shape2: TShape
      Left = 137
      Top = 65
      Width = 57
      Height = 18
      Brush.Color = clInfoBk
    end
    object Label6: TLabel
      Left = 19
      Top = 363
      Width = 88
      Height = 13
      Caption = 'Indicar la ROE:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 19
      Top = 296
      Width = 65
      Height = 13
      Caption = 'Plazo Máximo'
    end
    object Label2: TLabel
      Left = 19
      Top = 262
      Width = 67
      Height = 13
      Caption = 'Plazo Mínimo:'
    end
    object Label8: TLabel
      Left = 258
      Top = 296
      Width = 125
      Height = 13
      Caption = 'Monto Máximo del Crédito:'
    end
    object Label7: TLabel
      Left = 258
      Top = 262
      Width = 124
      Height = 13
      Caption = 'Monto Mínimo del Crédito:'
    end
    object lbCVE_GRUPO_ECO: TLabel
      Left = 19
      Top = 24
      Width = 76
      Height = 13
      Caption = 'Clave Producto:'
    end
    object Label1: TLabel
      Left = 19
      Top = 330
      Width = 35
      Height = 13
      Caption = 'Rango:'
    end
    object Shape4: TShape
      Left = 22
      Top = 65
      Width = 60
      Height = 18
      Brush.Color = clInfoBk
    end
    object Label4: TLabel
      Left = 30
      Top = 68
      Width = 43
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Rango'
      Color = clInfoBk
      ParentColor = False
      Transparent = True
    end
    object Shape1: TShape
      Left = 81
      Top = 65
      Width = 57
      Height = 18
      Brush.Color = clInfoBk
    end
    object Label5: TLabel
      Left = 86
      Top = 68
      Width = 48
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Plazo Min.'
      Color = clInfoBk
      ParentColor = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 141
      Top = 68
      Width = 50
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Plazo Max.'
      Color = clInfoBk
      ParentColor = False
      Transparent = True
    end
    object Shape3: TShape
      Left = 193
      Top = 65
      Width = 122
      Height = 18
      Brush.Color = clInfoBk
    end
    object Label10: TLabel
      Left = 218
      Top = 68
      Width = 66
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Monto Min.'
      Color = clInfoBk
      ParentColor = False
      Transparent = True
    end
    object Shape5: TShape
      Left = 314
      Top = 65
      Width = 122
      Height = 18
      Brush.Color = clInfoBk
    end
    object Label11: TLabel
      Left = 345
      Top = 68
      Width = 66
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Monto Max.'
      Color = clInfoBk
      ParentColor = False
      Transparent = True
    end
    object Shape6: TShape
      Left = 435
      Top = 65
      Width = 56
      Height = 18
      Brush.Color = clInfoBk
    end
    object Label12: TLabel
      Left = 437
      Top = 68
      Width = 51
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'ROE Obj.'
      Color = clInfoBk
      ParentColor = False
      Transparent = True
    end
    object strgrdDatos: TStringGrid
      Left = 22
      Top = 82
      Width = 493
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
      TabOrder = 8
      OnDrawCell = strgrdDatosDrawCell
      OnMouseDown = strgrdDatosMouseDown
    end
    object edCveProd: TInterEdit
      Left = 108
      Top = 20
      Width = 103
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 5
      TabOrder = 0
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edDescProd: TInterEdit
      Tag = 18
      Left = 218
      Top = 20
      Width = 298
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 10
      TabOrder = 1
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object Panel1: TPanel
      Left = 22
      Top = 239
      Width = 493
      Height = 4
      TabOrder = 9
    end
    object Panel3: TPanel
      Left = 22
      Top = 55
      Width = 493
      Height = 4
      TabOrder = 10
    end
    object edIdRango: TInterEdit
      Tag = 18
      Left = 125
      Top = 326
      Width = 84
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 10
      TabOrder = 6
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edPlazoMin: TInterEdit
      Tag = 18
      Left = 125
      Top = 258
      Width = 84
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      OnExit = edPlazoMinExit
      DisplayMask = '#####'
      MaxLength = 4
      TabOrder = 2
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edPlazoMax: TInterEdit
      Tag = 18
      Left = 125
      Top = 292
      Width = 84
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      OnExit = edPlazoMaxExit
      DisplayMask = '#####'
      MaxLength = 4
      TabOrder = 4
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edRoeObj: TInterEdit
      Tag = 18
      Left = 125
      Top = 359
      Width = 84
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 12
      TabOrder = 7
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edImpMin: TInterEdit
      Tag = 18
      Left = 389
      Top = 258
      Width = 124
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      MaxLength = 18
      TabOrder = 3
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edImpMax: TInterEdit
      Tag = 18
      Left = 389
      Top = 292
      Width = 124
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edImpMaxExit
      MaxLength = 18
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
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesEliminar = InterForma1DespuesEliminar
    OnDespuesCancelar = InterForma1DespuesCancelar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnAntesNuevo = InterForma1AntesNuevo
    OnAntesEliminar = InterForma1AntesEliminar
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
    Left = 434
    Top = 10
  end
end
