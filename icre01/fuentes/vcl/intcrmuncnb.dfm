object WCrMunicipioCnbv: TWCrMunicipioCnbv
  Left = 373
  Top = 322
  Width = 547
  Height = 344
  Caption = 'Catálogo de Claves de Municipio'
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
    Width = 539
    Height = 310
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Alta de Datos'
      object lbFOLIO: TLabel
        Left = 8
        Top = 10
        Width = 22
        Height = 13
        Caption = 'Folio'
      end
      object lbCVE_ESTADO: TLabel
        Left = 8
        Top = 50
        Width = 78
        Height = 13
        Caption = 'Clave de Estado'
      end
      object lbNOM_ESTADO: TLabel
        Left = 8
        Top = 90
        Width = 90
        Height = 13
        Caption = 'Nombre del Estado'
      end
      object lbNOM_MUNICIPIO: TLabel
        Left = 8
        Top = 130
        Width = 100
        Height = 13
        Caption = 'Nombre de Municipio'
      end
      object lbCVE_MUNICIPIO: TLabel
        Left = 8
        Top = 170
        Width = 90
        Height = 13
        Caption = 'Clave de Municipio'
      end
      object lbCOL_MINUCIPIO: TLabel
        Left = 8
        Top = 208
        Width = 83
        Height = 13
        Caption = 'Colonia Minucipio'
      end
      object edFOLIO: TEdit
        Tag = 50
        Left = 8
        Top = 26
        Width = 81
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edCVE_ESTADO: TEdit
        Tag = 18
        Left = 8
        Top = 66
        Width = 81
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object edNOM_ESTADO: TEdit
        Tag = 18
        Left = 8
        Top = 106
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object edNOM_MUNICIPIO: TEdit
        Tag = 18
        Left = 8
        Top = 146
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 3
      end
      object edCVE_MUNICIPIO: TEdit
        Tag = 18
        Left = 8
        Top = 184
        Width = 81
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 4
      end
      object edCOL_MINUCIPIO: TEdit
        Tag = 18
        Left = 8
        Top = 224
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 5
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Alta en Bloque'
      ImageIndex = 1
      object Lbtotal: TLabel
        Left = 8
        Top = 182
        Width = 89
        Height = 13
        Caption = 'Total de Registros:'
      end
      object lbTotalReg: TLabel
        Left = 103
        Top = 182
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
      object RGinformacion: TRadioGroup
        Left = 0
        Top = 148
        Width = 360
        Height = 32
        Caption = 'Información'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Reemplazar Registros'
          'Adicionar Registros')
        TabOrder = 0
      end
      object btCarga: TBitBtn
        Left = 368
        Top = 153
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
        Top = 184
        Width = 377
        Height = 11
        Min = 0
        Max = 100
        TabOrder = 2
      end
      object MErrores: TMemo
        Left = 0
        Top = 208
        Width = 531
        Height = 74
        Align = alBottom
        Color = clInfoBk
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object SAGta: TStringAlignGrid
        Left = 0
        Top = 0
        Width = 531
        Height = 145
        Align = alTop
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        ScrollBars = ssVertical
        TabOrder = 4
        OnKeyDown = SAGtaKeyDown
        ColWidths = (
          80
          410
          64
          64
          64)
        PropCell = ()
        PropCol = ()
        PropRow = ()
        PropFixedCol = ()
        PropFixedRow = ()
      end
    end
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnModificar = InterForma1Modificar
    OnDespuesModificar = InterForma1DespuesModificar
    OnAceptar = InterForma1Aceptar
    OnAntesNuevo = InterForma1AntesNuevo
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
    ShowBtnAyuda = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 285
    Top = 64
  end
end
