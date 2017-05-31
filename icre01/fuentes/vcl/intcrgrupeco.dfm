object WCrGrupoEco: TWCrGrupoEco
  Left = 322
  Top = 102
  Width = 538
  Height = 282
  Caption = 'Catálogo de Grupo Económico'
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
  object pgAltaDatos: TPageControl
    Left = 0
    Top = 0
    Width = 530
    Height = 225
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Alta de Datos'
      object lbDESC_TIPO_ACRED: TLabel
        Left = 8
        Top = 82
        Width = 56
        Height = 13
        Caption = 'Descripción'
      end
      object lbCVE_GRUPO_ECO: TLabel
        Left = 8
        Top = 42
        Width = 85
        Height = 13
        Caption = 'Grupo Económico'
      end
      object Label5: TLabel
        Left = 8
        Top = 125
        Width = 90
        Height = 13
        Caption = 'Importe Máx. Oper.'
      end
      object edCVE_GRUPO_ECO: TEdit
        Tag = 50
        Left = 120
        Top = 38
        Width = 121
        Height = 21
        HelpContext = 1001
        CharCase = ecUpperCase
        MaxLength = 6
        TabOrder = 0
        OnExit = edCVE_GRUPO_ECOExit
      end
      object edDESC_AGRUPO_ECO: TEdit
        Tag = 18
        Left = 120
        Top = 78
        Width = 393
        Height = 21
        HelpContext = 2001
        CharCase = ecUpperCase
        MaxLength = 250
        TabOrder = 1
        OnExit = edDESC_AGRUPO_ECOExit
      end
      object edIMP_MAX_OPERA: TInterEdit
        Tag = 18
        Left = 120
        Top = 120
        Width = 121
        Height = 21
        HelpContext = 3001
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = edIMP_MAX_OPERAExit
        DisplayMask = '###,###,###,##0.00'
        MaxLength = 18
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 2
        UseReType = True
        UseSep = True
        UseDisplay = True
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Alta en Bloque'
      ImageIndex = 1
      object Lbtotal: TLabel
        Left = 8
        Top = 129
        Width = 89
        Height = 13
        Caption = 'Total de Registros:'
      end
      object lbTotalReg: TLabel
        Left = 103
        Top = 129
        Width = 8
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 407
        Top = 0
        Width = 99
        Height = 13
        Caption = 'Imp. Max. Autorizado'
      end
      object Bevel4: TBevel
        Left = 391
        Top = 0
        Width = 5
        Height = 16
      end
      object Label12: TLabel
        Left = 104
        Top = 0
        Width = 56
        Height = 13
        Caption = 'Descripción'
      end
      object Bevel3: TBevel
        Left = 89
        Top = 0
        Width = 5
        Height = 16
      end
      object Label7: TLabel
        Left = 43
        Top = 0
        Width = 27
        Height = 13
        Caption = 'Clave'
      end
      object RGinformacion: TRadioGroup
        Left = 0
        Top = 95
        Width = 360
        Height = 32
        Caption = 'Información'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Reemplazar Registros'
          'Adicionar Registros')
        TabOrder = 0
        OnClick = RGinformacionClick
      end
      object btCarga: TBitBtn
        Left = 368
        Top = 101
        Width = 153
        Height = 25
        Caption = 'Carga en Bloques'
        TabOrder = 1
        OnClick = btCargaClick
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
      object pbRegistros: TProgressBar
        Left = 142
        Top = 131
        Width = 377
        Height = 11
        Min = 0
        Max = 100
        TabOrder = 2
      end
      object MErrores: TMemo
        Left = 0
        Top = 150
        Width = 522
        Height = 47
        Align = alBottom
        Color = clInfoBk
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object SAGta: TStringAlignGrid
        Left = 0
        Top = 16
        Width = 522
        Height = 73
        ColCount = 3
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        PopupMenu = PopupMenu1
        ScrollBars = ssVertical
        TabOrder = 4
        OnExit = SAGtaExit
        OnKeyDown = SAGtaKeyDown
        ColWidths = (
          90
          300
          100)
        PropCell = ()
        PropCol = (
          2
          1
          0
          0)
        PropRow = ()
        PropFixedCol = ()
        PropFixedRow = ()
      end
    end
  end
  object PnDatos: TPanel
    Left = 0
    Top = 225
    Width = 530
    Height = 21
    Align = alTop
    TabOrder = 1
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
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnDespuesAceptar = InterForma1DespuesAceptar
    OnAntesAceptar = InterForma1AntesAceptar
    OnBuscar = InterForma1Buscar
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
    Left = 298
    Top = 10
  end
  object PopupMenu1: TPopupMenu
    Left = 204
    object Pegar1: TMenuItem
      Caption = '&Pegar'
      ShortCut = 16470
      OnClick = Pegar1Click
    end
  end
end
