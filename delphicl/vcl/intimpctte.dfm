object FrmImpCtte: TFrmImpCtte
  Left = 204
  Top = 108
  Width = 608
  Height = 402
  Caption = 'Impuesto por Contratante'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lContrato: TLabel
    Left = 9
    Top = 40
    Width = 46
    Height = 13
    Caption = 'Contrato :'
  end
  object sbContrato: TSpeedButton
    Tag = 17
    Left = 159
    Top = 37
    Width = 21
    Height = 21
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
    OnClick = sbContratoClick
  end
  object lConEje: TLabel
    Left = 9
    Top = 11
    Width = 151
    Height = 16
    Caption = 'Constancias Ejercicio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lAnioEje: TLabel
    Left = 181
    Top = 11
    Width = 33
    Height = 16
    Alignment = taCenter
    Caption = '1900'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lStaEje: TLabel
    Left = 232
    Top = 11
    Width = 57
    Height = 16
    Alignment = taCenter
    Caption = 'Cerrado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lGuionEje: TLabel
    Left = 220
    Top = 11
    Width = 6
    Height = 16
    Alignment = taCenter
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object eContrato: TInterEdit
    Tag = 562
    Left = 59
    Top = 37
    Width = 98
    Height = 21
    Prefijo = '1'
    Contrato = -1
    TipoReader = trContrato
    MaxLength = 12
    TabOrder = 0
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object eTitular: TEdit
    Left = 181
    Top = 37
    Width = 410
    Height = 21
    Hint = 'Click derecho para Catálogo'
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
  end
  object gbContratantes: TGroupBox
    Tag = 18
    Left = 9
    Top = 95
    Width = 582
    Height = 263
    Caption = 'Contratante(s)'
    TabOrder = 2
    object lEtqPTot1: TLabel
      Left = 466
      Top = 210
      Width = 89
      Height = 16
      AutoSize = False
      Caption = '___________'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lEtqPTot2: TLabel
      Left = 409
      Top = 229
      Width = 54
      Height = 16
      Caption = '% Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lPTotal: TLabel
      Left = 466
      Top = 229
      Width = 89
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '0.00 '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lEtqPCon: TLabel
      Left = 354
      Top = 24
      Width = 110
      Height = 13
      Caption = '% por Contratante :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lActivos: TLabel
      Left = 32
      Top = 29
      Width = 41
      Height = 13
      Caption = 'Activo(s)'
    end
    object lInactivos: TLabel
      Left = 109
      Top = 29
      Width = 49
      Height = 13
      Caption = 'Inactivo(s)'
    end
    object lvwContratantes: TListView
      Left = 11
      Top = 50
      Width = 559
      Height = 163
      Color = clWhite
      Columns = <
        item
          Caption = 'Cve. Ctte'
          Width = 75
        end
        item
          Caption = 'Id. Persona'
          Width = 85
        end
        item
          Caption = 'Nombre'
          Width = 300
        end
        item
          Alignment = taCenter
          Caption = 'Impuesto'
          Width = 75
        end
        item
          Caption = 'Sit. Ctte'
          Width = 0
        end>
      GridLines = True
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnCustomDrawSubItem = lvwContratantesCustomDrawSubItem
    end
    object ePContratante: TEdit
      Tag = 18
      Left = 468
      Top = 20
      Width = 102
      Height = 21
      Color = clWhite
      MaxLength = 6
      TabOrder = 1
      Text = '0.00'
    end
    object bRefrescar: TButton
      Tag = 18
      Left = 11
      Top = 224
      Width = 100
      Height = 25
      Caption = 'Refrescar'
      TabOrder = 2
      OnClick = bRefrescarClick
    end
    object bProrratear: TButton
      Tag = 18
      Left = 115
      Top = 224
      Width = 100
      Height = 25
      Caption = 'Prorratear'
      TabOrder = 3
      OnClick = bProrratearClick
    end
    object pBlanco: TPanel
      Left = 11
      Top = 27
      Width = 15
      Height = 15
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object pAzul: TPanel
      Left = 89
      Top = 27
      Width = 15
      Height = 15
      Color = 16767152
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
  object iImpCtte: TInterForma
    IsMain = True
    OnModificar = iImpCtteModificar
    OnCancelar = iImpCtteCancelar
    OnAceptar = iImpCtteAceptar
    OnAntesAceptar = iImpCtteAntesAceptar
    OnAntesModificar = iImpCtteAntesModificar
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
    ShowGrid = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 563
  end
  object linkContrato: TInterLinkit
    Control = eContrato
    OnEjecuta = linkContratoEjecuta
    TipoReader = trContrato
    CharCase = ecNormal
    OnCapture = linkContratoCapture
    Left = 60
    Top = 35
  end
end
