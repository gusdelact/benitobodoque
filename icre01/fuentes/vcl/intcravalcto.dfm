object WCrAvalCto: TWCrAvalCto
  Left = 355
  Top = 161
  Width = 621
  Height = 466
  Caption = 'Porcentaje de Garantía por Línea '
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
  object Bevel11: TBevel
    Left = 0
    Top = 0
    Width = 593
    Height = 33
    Shape = bsFrame
  end
  object lbCVE_GRUPO_ECO: TLabel
    Left = 11
    Top = 10
    Width = 51
    Height = 13
    Caption = 'Clave Aval'
  end
  object pgAltaDatos: TPageControl
    Left = 0
    Top = 33
    Width = 593
    Height = 361
    ActivePage = TabSheet2
    TabOrder = 2
    OnChange = pgAltaDatosChange
    object TabSheet1: TTabSheet
      Caption = 'Alta de Datos'
      object lbDESC_TIPO_ACRED: TLabel
        Left = 16
        Top = 8
        Width = 48
        Height = 13
        Caption = 'No. Línea'
      end
      object Label5: TLabel
        Left = 16
        Top = 34
        Width = 51
        Height = 13
        Caption = 'Porcentaje'
      end
      object edPORCENTAJE: TInterEdit
        Tag = 18
        Left = 119
        Top = 28
        Width = 49
        Height = 21
        HelpContext = 3001
        Prefijo = '1'
        Contrato = -1
        TipoReader = trDinero
        OnExit = edPORCENTAJEExit
        DisplayMask = '#,###,##0.00'
        MaxLength = 12
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 2
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 103
        Width = 569
        Height = 225
        Caption = 'Contratos Relacionados'
        TabOrder = 4
        object Label2: TLabel
          Left = 14
          Top = 16
          Width = 48
          Height = 13
          Caption = 'No. Línea'
        end
        object Label8: TLabel
          Left = 107
          Top = 16
          Width = 8
          Height = 13
          Caption = '%'
        end
        object Bevel1: TBevel
          Left = 85
          Top = 13
          Width = 3
          Height = 18
        end
        object Label3: TLabel
          Left = 200
          Top = 16
          Width = 40
          Height = 13
          Caption = 'Usr. Alta'
        end
        object Bevel2: TBevel
          Left = 133
          Top = 13
          Width = 3
          Height = 18
        end
        object Bevel4: TBevel
          Left = 247
          Top = 13
          Width = 3
          Height = 18
        end
        object Label1: TLabel
          Left = 271
          Top = 16
          Width = 30
          Height = 13
          Caption = 'F. Alta'
        end
        object Bevel5: TBevel
          Left = 357
          Top = 13
          Width = 3
          Height = 18
        end
        object Label4: TLabel
          Left = 359
          Top = 16
          Width = 62
          Height = 13
          Caption = 'Usr. Modifica'
        end
        object Bevel6: TBevel
          Left = 424
          Top = 13
          Width = 3
          Height = 18
        end
        object Label6: TLabel
          Left = 442
          Top = 16
          Width = 52
          Height = 13
          Caption = 'F. Modifica'
        end
        object Bevel8: TBevel
          Left = 187
          Top = 13
          Width = 3
          Height = 18
        end
        object Label10: TLabel
          Left = 138
          Top = 16
          Width = 45
          Height = 13
          Caption = 'Tipo Aval'
        end
        object sgContratos: TSGCtrl
          Left = 8
          Top = 32
          Width = 549
          Height = 190
          OnCalcRow = sgContratosCalcRow
          ShowTab = True
          TabOrder = 0
          TabWidth = 0
          ShowBtnPriorNext = True
          ShowBtnFirst = True
          ShowBtnLast = True
          OnMoveRow = sgContratosMoveRow
        end
      end
      object btCONTRATO: TBitBtn
        Tag = 50
        Left = 197
        Top = 2
        Width = 22
        Height = 20
        HelpContext = 1002
        TabOrder = 1
        OnClick = btCONTRATOClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          0800000000000002000000000000000000000001000000010000000000008080
          8000000080000080800000800000808000008000000080008000408080004040
          0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
          FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
          80008000FF004080FF0000001F00000000000000000000000000000000000000
          A000BA7F0000000008005B00C4005B00B800B87FFF00FFFFA8005B002600B77F
          F4005D00C00000000A000000010000000000000090005B00FE0000006300F7BF
          C00000000A00000001000000000000005700D8843F000000BC005B002300F7BF
          0000000047000200E500F9BF7900F7BFF8000000E0005B002E00F7BF5700D884
          00000000D80047330000000046000000360002002E0000001F0000003F002701
          000047333F0027013C00FA3B3F000400000000000000F91AB700000000000100
          00000A000000FA3B10000000000000002800D379FF0047333C00413C3F00FFFF
          47000000000047333F0008E8780000000300F91AB700E7820700000000000000
          01000A00C0003F010000080000001F175900B77F00005B0080005B000700B87F
          FF00FFFF8C005B00E200B77F00005B0098005B00C200B87FFF00FFFFA4005B00
          B000B77F00005B00B0005B003500B87FFF00FFFFBC005B006100410000005B00
          C8005B006E006D307700CE4835001A3D0000528700000000E0000700DC004100
          0000FFFFEC005B0018004100500020001000200001000000FF00E0FFFF000000
          5E00E0010000FF10040000040000CE4800000000000000008200150000000000
          00000000000007400100000000000100200010000000E74850000B0195000C01
          01000000B700F4FEFF0000005E00F0A60100B710040000040000964800000000
          000000009B001500D400FFFF030000003C005E0004000000A000010020000000
          0000AF4808000700000000001B00240054005E0000000000F200B87F00000000
          00000000C800BB7F00000000000000004200736361000000E7000000AF00683D
          A7004840D700F7BF37000000C4005B003F002000CC00000074000000F4005D00
          20000000F8005B005D00B77F0100000000000000000000002000000034001704
          00000002F4005D00A8005B004700B77F20000000000000200000000205000000
          000000004400071852002A009000301200002011000034875000E01000003012
          0000408750001701A8001405000000000200920400000000A200000000003012
          0000828700006A87000000000000010000000000C80000007600507F1700537F
          E00027112F00B0876E00170164002F0100000000C8000000B0000000A0000000
          200000002700000001000000E000000000002F01E0005E0020000000BA00507F
          1700537F200029798600A233A200A705FC00AC1157001AEC5E00030303030303
          03030E11110E110E111103030303030303030E01010E010E0101030303030303
          0311110E110E0E110E0E0303030303030301010E010E0E010E0E030303030303
          0311110E110E11110E110303030303030301010E010E01010E01030303030303
          03031111110E0E0E110E03030303030303030101010E0E0E0F0E030303030303
          030606060E1111111111030303030303030F0F0F0E0101010F0F030303030303
          03060111060E110E110E030303030303030F0101000E010E010E030303030303
          0606010E110611110E110303030303030F0F010E010F01010E01030303030306
          0601060F0F060E11110E03030303030F0F01000F0F010E01010E030303030606
          010E0F06060603111103030303030F0F010E0F0F0F0F03010103030303060606
          060F06060303030303030303030F0F0F0F0F0F0F030303030303030306060106
          0606060303030303030303030F0F010F0F0F0F03030303030303030606010E0F
          06060303030303030303030F0F010E0F0F0F03030303030303030306010E0F06
          06030303030303030303030F010E0F0F0F0303030303030303030306060F0606
          03030303030303030303030F0F0F0F0F03030303030303030303030306060603
          0303030303030303030303030F0F0F0303030303030303030303030303030303
          0303030303030303030303030303030303030303030303030303}
        NumGlyphs = 2
      end
      object edID_CONTRATO: TInterEdit
        Tag = 562
        Left = 119
        Top = 2
        Width = 76
        Height = 21
        HelpContext = 1001
        Prefijo = '1'
        Contrato = -1
        TipoReader = trContrato
        OnExit = edID_CONTRATOExit
        MaxLength = 12
        TabOrder = 0
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object rgTTIPO_AVAL: TRadioGroup
        Tag = 18
        Left = 9
        Top = 56
        Width = 568
        Height = 41
        HelpContext = 3001
        Caption = ' Tipo de Aval '
        Columns = 3
        Items.Strings = (
          '1. Aval'
          '2. Obligado solidario'
          '3. Factorado')
        TabOrder = 3
        OnExit = rgTTIPO_AVALExit
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Alta en Bloque'
      ImageIndex = 1
      object Lbtotal: TLabel
        Left = 14
        Top = 142
        Width = 89
        Height = 13
        Caption = 'Total de Registros:'
      end
      object lbTotalReg: TLabel
        Left = 109
        Top = 142
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
      object Label12: TLabel
        Left = 238
        Top = 3
        Width = 51
        Height = 13
        Caption = 'Procentaje'
      end
      object Bevel3: TBevel
        Left = 68
        Top = 3
        Width = 5
        Height = 16
      end
      object Label7: TLabel
        Left = 14
        Top = 3
        Width = 40
        Height = 13
        Caption = 'Renglón'
      end
      object Label9: TLabel
        Left = 86
        Top = 3
        Width = 46
        Height = 13
        Caption = 'No. Linea'
      end
      object Bevel7: TBevel
        Left = 220
        Top = 3
        Width = 5
        Height = 16
      end
      object Bevel9: TBevel
        Left = 310
        Top = 3
        Width = 5
        Height = 16
      end
      object Label11: TLabel
        Left = 318
        Top = 3
        Width = 87
        Height = 13
        Caption = 'Tipo Aval  - (1,2,3)'
      end
      object Bevel10: TBevel
        Left = 423
        Top = 3
        Width = 5
        Height = 16
      end
      object RGinformacion: TRadioGroup
        Left = 0
        Top = 98
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
        Left = 365
        Top = 103
        Width = 137
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
        Left = 148
        Top = 144
        Width = 267
        Height = 11
        Min = 0
        Max = 100
        TabOrder = 2
      end
      object MErrores: TMemo
        Left = 8
        Top = 160
        Width = 489
        Height = 177
        Color = clInfoBk
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object SAGta: TStringAlignGrid
        Left = 8
        Top = 19
        Width = 489
        Height = 73
        ColCount = 4
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
          60
          150
          80
          75)
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
    Top = 396
    Width = 593
    Height = 21
    TabOrder = 3
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
      Left = 313
      Top = 10
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
  object edNOM_AVAL: TEdit
    Left = 185
    Top = 6
    Width = 305
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 6
    ReadOnly = True
    TabOrder = 1
  end
  object edCVE_AVAL: TEdit
    Left = 81
    Top = 6
    Width = 81
    Height = 21
    HelpContext = 1001
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 6
    ReadOnly = True
    TabOrder = 0
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
    OnAntesModificar = InterForma1AntesModificar
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
    OnDespuesShow = InterForma1DespuesShow
    Left = 298
    Top = 10
  end
  object PopupMenu1: TPopupMenu
    Left = 140
    Top = 256
    object Pegar1: TMenuItem
      Caption = '&Pegar'
      ShortCut = 16470
      OnClick = Pegar1Click
    end
  end
  object ilIDCONTRATO: TInterLinkit
    Control = edID_CONTRATO
    OnEjecuta = ilIDCONTRATOEjecuta
    TipoReader = trContrato
    CharCase = ecNormal
    OnCapture = ilIDCONTRATOCapture
    Left = 451
    Top = 18
  end
end
