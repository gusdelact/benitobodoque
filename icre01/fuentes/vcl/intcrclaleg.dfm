object WCrClasLegal: TWCrClasLegal
  Left = 376
  Top = 199
  Width = 569
  Height = 314
  Caption = 'Catálogo de Clasificación Legal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgAltaDatos: TPageControl
    Left = 0
    Top = 0
    Width = 553
    Height = 249
    ActivePage = TabSheet2
    Align = alTop
    TabOrder = 0
    OnChange = pgAltaDatosChange
    object TabSheet1: TTabSheet
      Caption = 'Alta de Datos'
      object lbDESC_TIPO_ACRED: TLabel
        Left = 8
        Top = 98
        Width = 56
        Height = 13
        Caption = 'Descripción'
      end
      object lbCVE_GRUPO_ECO: TLabel
        Left = 8
        Top = 42
        Width = 77
        Height = 13
        Caption = 'Cve. Clas. Legal'
      end
      object edCVE_CLAS_LEGAL: TEdit
        Tag = 50
        Left = 104
        Top = 38
        Width = 32
        Height = 21
        HelpContext = 1001
        CharCase = ecUpperCase
        MaxLength = 2
        TabOrder = 0
        OnExit = edCVE_CLAS_LEGALExit
      end
      object edDESC_CLAS_LEGAL: TEdit
        Tag = 18
        Left = 104
        Top = 94
        Width = 408
        Height = 21
        HelpContext = 2001
        CharCase = ecUpperCase
        MaxLength = 250
        TabOrder = 1
        OnExit = edDESC_CLAS_LEGALExit
      end
      object chbB_EXCLUYE_CAT: TCheckBox
        Tag = 18
        Left = 10
        Top = 149
        Width = 183
        Height = 17
        HelpContext = 2002
        Caption = 'Excluye del CAT de Contrato'
        TabOrder = 2
        OnExit = chbB_EXCLUYE_CATExit
      end
    end
    object TabSheet2: TTabSheet
      BorderWidth = 5
      Caption = 'Alta en Bloque'
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
      object Label7: TLabel
        Left = 45
        Top = 0
        Width = 27
        Height = 13
        Caption = 'Clave'
      end
      object Bevel3: TBevel
        Left = 82
        Top = -2
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
      object Label1: TLabel
        Left = 440
        Top = 0
        Width = 61
        Height = 13
        Caption = 'Excluye CAT'
      end
      object Bevel1: TBevel
        Left = 433
        Top = -2
        Width = 5
        Height = 16
      end
      object Bevel2: TBevel
        Left = 33
        Top = -2
        Width = 5
        Height = 16
      end
      object Label2: TLabel
        Left = 8
        Top = 0
        Width = 23
        Height = 13
        Caption = 'Reg.'
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
        Top = 99
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
      object SAGta: TStringAlignGrid
        Left = 0
        Top = 16
        Width = 521
        Height = 73
        ColCount = 3
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        PopupMenu = PopupMenu1
        ScrollBars = ssVertical
        TabOrder = 3
        OnKeyDown = SAGtaKeyDown
        ColWidths = (
          82
          350
          64)
        PropCell = ()
        PropCol = ()
        PropRow = ()
        PropFixedCol = ()
        PropFixedRow = ()
      end
      object MErrores: TMemo
        Left = 0
        Top = 152
        Width = 535
        Height = 59
        Align = alBottom
        Color = clInfoBk
        ScrollBars = ssVertical
        TabOrder = 4
      end
    end
  end
  object PnDatos: TPanel
    Left = 0
    Top = 249
    Width = 553
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
    Left = 314
    Top = 10
  end
  object PopupMenu1: TPopupMenu
    Left = 348
    Top = 8
    object Pegar1: TMenuItem
      Caption = '&Pegar'
      ShortCut = 16470
      OnClick = Pegar1Click
    end
  end
end
