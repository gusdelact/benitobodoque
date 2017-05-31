object WCrCalArDetall: TWCrCalArDetall
  Left = 164
  Top = 118
  Width = 799
  Height = 530
  Caption = 'Administración Archivos de Calificación'
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
  object Bevel3: TBevel
    Left = 188
    Top = 422
    Width = 598
    Height = 28
    Shape = bsFrame
    Style = bsRaised
  end
  object lbFH_CALIFICACION_CARGA: TLabel
    Left = 191
    Top = 35
    Width = 136
    Height = 13
    Caption = 'Fecha y Hora de Calificación'
  end
  object lbID_CALIFICADORA1: TLabel
    Left = 6
    Top = 61
    Width = 55
    Height = 13
    Caption = 'Calificadora'
  end
  object lbCVE_TIPO_RIESGO1: TLabel
    Left = 5
    Top = 85
    Width = 72
    Height = 13
    Caption = 'Tipo de Riesgo'
  end
  object lbDESC_TIPO_ENTIDAD: TLabel
    Left = 1
    Top = 108
    Width = 84
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Tipo Entidad'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label1: TLabel
    Left = 87
    Top = 108
    Width = 241
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'Nombre de la  Entidad Calificada'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 490
    Top = 108
    Width = 58
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'Calificación'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label3: TLabel
    Left = 550
    Top = 108
    Width = 53
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'Acreditado'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label4: TLabel
    Left = 605
    Top = 108
    Width = 177
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'Nombre del Acreditado'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object Label5: TLabel
    Left = 215
    Top = 430
    Width = 79
    Height = 13
    Caption = 'Configuración'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 331
    Top = 108
    Width = 157
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'Comentario Calificadora'
    Color = clInfoBk
    ParentColor = False
    WordWrap = True
  end
  object edNOM_ARCHIVO: TEdit
    Left = 212
    Top = 6
    Width = 570
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 6
  end
  object btID_CALIFICADORA1: TBitBtn
    Tag = 512
    Left = 190
    Top = 6
    Width = 24
    Height = 23
    TabOrder = 1
    OnClick = btID_CALIFICADORA1Click
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
  object edFH_CALIFICACION: TEdit
    Left = 332
    Top = 31
    Width = 171
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 7
  end
  object dtpFH_CALIFICACION_CARGA: TInterDateTimePicker
    Left = 501
    Top = 31
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 38498.8309309491
    Time = 38498.8309309491
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 8
    Edit = edFH_CALIFICACION
    Formato = dfDateTime
  end
  object edID_CALIFICADORA: TEdit
    Left = 85
    Top = 57
    Width = 105
    Height = 21
    Color = clBtnFace
    TabOrder = 9
  end
  object edNOM_CALIFICADORA: TEdit
    Left = 192
    Top = 57
    Width = 591
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 10
  end
  object edDESC_TIPO_RIESGO: TEdit
    Left = 191
    Top = 81
    Width = 591
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 12
  end
  object edCVE_TIPO_RIESGO: TEdit
    Left = 85
    Top = 81
    Width = 104
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    TabOrder = 11
  end
  object btnCancela: TBitBtn
    Tag = 512
    Left = 2
    Top = 422
    Width = 99
    Height = 28
    Caption = 'Cancelación'
    Enabled = False
    TabOrder = 5
    OnClick = btnCancelaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333333333333333333FFF33FF333FFF339993370733
      999333777FF37FF377733339993000399933333777F777F77733333399970799
      93333333777F7377733333333999399933333333377737773333333333990993
      3333333333737F73333333333331013333333333333777FF3333333333910193
      333333333337773FF3333333399000993333333337377737FF33333399900099
      93333333773777377FF333399930003999333337773777F777FF339993370733
      9993337773337333777333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object rgSIT_CAL_AR_CABE: TRadioGroup
    Left = 532
    Top = 27
    Width = 252
    Height = 30
    Caption = 'Situación Archivo'
    Columns = 2
    Enabled = False
    ItemIndex = 1
    Items.Strings = (
      'Activo'
      'Cancelado')
    TabOrder = 13
  end
  object MsgPanel: TPanel
    Left = 1
    Top = 453
    Width = 786
    Height = 21
    TabOrder = 14
  end
  object PnDatos: TPanel
    Left = 1
    Top = 474
    Width = 786
    Height = 21
    TabOrder = 15
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
      Left = 344
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
      Left = 344
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
      Left = 408
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
      Left = 408
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
  object btnMuestraAcredCalif: TButton
    Left = 306
    Top = 424
    Width = 236
    Height = 24
    Caption = '&Muestra Relación Calificadora - Acreditado'
    Enabled = False
    TabOrder = 3
    OnClick = btnMuestraAcredCalifClick
  end
  object pnlCancelado: TPanel
    Left = 676
    Top = 37
    Width = 59
    Height = 17
    BevelOuter = bvNone
    Caption = 'Cancelado'
    TabOrder = 16
  end
  object Panel1: TPanel
    Left = 1
    Top = 127
    Width = 785
    Height = 294
    Caption = 'Panel1'
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 1
      Top = 179
      Width = 783
      Height = 3
      Cursor = crVSplit
      Align = alTop
      Beveled = True
    end
    object Panel2: TPanel
      Left = 1
      Top = 182
      Width = 783
      Height = 19
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Label7: TLabel
        Left = 0
        Top = 2
        Width = 85
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = 'Id. Acreditado'
        Color = clSilver
        ParentColor = False
        WordWrap = True
      end
      object lblAcredFaltantes: TLabel
        Left = 88
        Top = 2
        Width = 695
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = '||'
        Color = clSilver
        ParentColor = False
        WordWrap = True
      end
    end
    object StrGrdListadoCalif: TStringGrid
      Left = 1
      Top = 1
      Width = 783
      Height = 178
      Align = alTop
      ColCount = 7
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      ScrollBars = ssVertical
      TabOrder = 0
      OnDblClick = btnMuestraAcredCalifClick
      OnKeyDown = StrGrdListadoCalifKeyDown
      ColWidths = (
        2
        81
        244
        159
        58
        55
        155)
    end
    object strGrdAcredFaltantes: TStringGrid
      Left = 1
      Top = 201
      Width = 783
      Height = 92
      Align = alClient
      ColCount = 2
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      ScrollBars = ssVertical
      TabOrder = 1
      OnDblClick = btnMuestraAcredCalifClick
      OnKeyDown = StrGrdListadoCalifKeyDown
      ColWidths = (
        84
        673)
    end
  end
  object rgBuscador: TRadioGroup
    Left = 4
    Top = 0
    Width = 183
    Height = 52
    Caption = 'Buscar Por'
    ItemIndex = 0
    Items.Strings = (
      'Nombre de Archivo'
      'Nombre de Archivo e Identidad')
    TabOrder = 0
  end
  object btnRelAcredCalif: TButton
    Left = 543
    Top = 424
    Width = 236
    Height = 24
    Caption = '&Relacióna Calificadora - Acreditado'
    Enabled = False
    TabOrder = 4
    OnClick = btnRelAcredCalifClick
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
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 522
    Top = 70
  end
end
