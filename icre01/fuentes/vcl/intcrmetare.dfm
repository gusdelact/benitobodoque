object WCrMetTablaRefer: TWCrMetTablaRefer
  Left = 271
  Top = 207
  Width = 860
  Height = 426
  Caption = 'Configuración de Tablas Referenciadas'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 844
    Height = 361
    Align = alTop
    TabOrder = 0
    object lbID_TABLA_REFEREN: TLabel
      Left = 8
      Top = 12
      Width = 88
      Height = 13
      Caption = 'Identificador Tabla'
    end
    object lbTABLA_REFERENCIADA: TLabel
      Left = 8
      Top = 44
      Width = 94
      Height = 13
      Caption = 'Tabla Referenciada'
    end
    object lbDESCRIPCION: TLabel
      Left = 8
      Top = 76
      Width = 56
      Height = 13
      Caption = 'Descripción'
    end
    object lbNUM_COL_LLAVE: TLabel
      Left = 8
      Top = 108
      Width = 115
      Height = 13
      Caption = 'Número Columnas Llave'
    end
    object lbCOLUMNAS_LLAVE: TLabel
      Left = 8
      Top = 140
      Width = 75
      Height = 13
      Caption = 'Columnas Llave'
    end
    object lbCOLUMNAS_LLAVE_FORAN: TLabel
      Left = 8
      Top = 172
      Width = 117
      Height = 13
      Caption = 'Columnas Llave Foránea'
    end
    object lbCONSULTA_EN_PERSONA: TLabel
      Left = 8
      Top = 204
      Width = 98
      Height = 13
      Caption = 'Consulta en Persona'
    end
    object Label1: TLabel
      Left = 8
      Top = 276
      Width = 100
      Height = 13
      Caption = 'Columna Descripción'
    end
    object edID_TABLA_REFEREN: TEdit
      Left = 136
      Top = 12
      Width = 81
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object rdgSIT_TABLA_REFEREN: TRadioGroup
      Left = 544
      Top = 8
      Width = 201
      Height = 41
      Caption = 'Situación'
      Columns = 2
      Items.Strings = (
        'Activo'
        'Inactivo')
      TabOrder = 9
      TabStop = True
    end
    object edDESCRIPCION: TEdit
      Left = 136
      Top = 76
      Width = 609
      Height = 21
      TabOrder = 3
    end
    object edNUM_COL_LLAVE: TEdit
      Left = 136
      Top = 108
      Width = 81
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edCOLUMNAS_LLAVE: TEdit
      Left = 136
      Top = 140
      Width = 609
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object edCOLUMNAS_LLAVE_FORAN: TEdit
      Left = 136
      Top = 172
      Width = 609
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
    end
    object bbtnACTUALIZA_LLAVE: TBitBtn
      Left = 8
      Top = 320
      Width = 113
      Height = 25
      Action = actActualizarLlave
      Caption = '&Actualizar Llave'
      TabOrder = 10
      Glyph.Data = {
        BA030000424DBA0300000000000036000000280000000F0000000F0000000100
        20000000000084030000C40E0000C40E00000000000000000000000000000000
        000000000000000000000000000000000000CD4D02FF00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000CD4D02FFCD4D02FFCD4D02FB000000000000
        000000000000000000000000000000000000000000000000000000000000D263
        1AFFD05B10FFCF5408FFCD4D02FFCD4D02FFCD4D02FFCD4D02FF000000000000
        00000000000000000000000000000000000000000000D67430FFD46B24FFD263
        1AFFD05B11FFCF5308FFCD4D02FFCD4D02FFCD4D02FF00000000000000000000
        0000000000000000000000000000DB8748FFD97E3BFFD6742FFFD46B24FFD262
        1AFFD05B10FFCE5309FFCD4D02FF000000000000000000000000000000000000
        00000000000000000000DE9155FFDB8749FFD97D3BFF0000000000000000D262
        19FFD05B11FF0000000000000000000000000000000000000000000000000000
        000000000000E19C63FFDE9156FFDC8749FF0000000000000000D46B24FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000E4A671FFE09C64FFDE9155FF000000000000000000000000000000000000
        000000000000CF5309FFCD4D02FFCD4D02FF0000000000000000000000000000
        00000000000000000000000000000000000000000000D67430FF000000000000
        0000D05B11FFCF5309FFCD4D02FF000000000000000000000000000000000000
        0000000000000000000000000000DB8748FFD97D3CFF0000000000000000D263
        1AFFD05A10FFCF5308FF00000000000000000000000000000000000000000000
        000000000000E29E67FFDE9155FFDB8748FFD97E3BFFD6742FFFD46B24FFD262
        1AFFD05B10FF000000000000000000000000000000000000000000000000E6AF
        80FFE3A672FFE19C63FFDE9256FFDB8748FFD97E3BFFD6742FFFD36B24FF0000
        000000000000000000000000000000000000000000000000000000000000E6AF
        80FFE3A572FFE09B64FFDE9155FFDC8748FFD9803EFF00000000000000000000
        000000000000000000000000000000000000000000000000000000000000E6AF
        80FFE3A672FF0000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000E7B2
        84FF00000000000000000000000000000000000000000000000000000000}
    end
    object edTABLA_REFEREN: TEdit
      Left = 136
      Top = 44
      Width = 233
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object btTABLA_REFEREN: TBitBtn
      Left = 368
      Top = 44
      Width = 22
      Height = 20
      TabOrder = 2
      OnClick = btTABLA_REFERENClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        0800000000000002000000000000000000000001000000010000000000008080
        8000000080000080800000800000808000008000000080008000408080004040
        0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
        FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
        80008000FF004080FF000200C4000200CC00000000000000000071658400CC00
        DE00000008000200C00000001100000004000000000000000000000000000000
        00000000A000BA7F000000001C005B00D8005B00B800B87FFF00FFFFBC005B00
        2600B77FF4005D00C00000000A0000000100000000000000A4005B0012000000
        6300F7BFC00000000A00000001000000000000005700EC843F000000D0005B00
        2300F7BF0000000047000200E500F9BF7900F7BF0C000000F4005B002E00F7BF
        5700EC8400000000EC00473300000000460000004A0002002E0000001F000000
        3F002701000047333F0027015000FA3B3F000400000000000000F91AB7000000
        0000010000000A000000FA3B10000000000000003C00D379FF0047335000413C
        3F00FFFF47000000000047333F0008E88C0000000300F91AB700E78207000000
        0000000001000A00C0003F010000080000001F175900B77F14005B0094005B00
        0700B87FFF00FFFFA0005B00E200B77F14005B00AC005B00C200B87FFF00FFFF
        B8005B00B000B77F14005B00C4005B003500B87FFF00FFFFD0005B0061004100
        14005B00DC005B006E004100FF00FFFFE8005B00C100410014005B00F4005B00
        DC004100FF00FFFF00005B001800410014005B00F4005B0025004100FF00FFFF
        00005B009C0041001100000001000000000000009800BA7F0100000000000000
        0000000000000000EC0012010100000000000000000000006000188000000000
        0000000005000000000000000000000000000000000000004C000000C0000000
        000000004C005D00000000000500000003000000A0005D0004000000B4005B00
        400000000000000044005D00260008001B00230078005D0000000000F200B87F
        0000000000000000C800BB7F0000000000000000420073636100782E62007000
        6C005B004700B77FC00000001100000004000000000000000000000000000000
        00000000A000BA7F010000009C005B0058005B000000B87FFF00FFFF3C005B00
        2600B77F88005D00E80000008400581100007811000024875000101100005811
        0000308750001701980014050000000002009204000000006600000000005811
        0000728700005A87000000000000010000000000C80000006600507F1700537F
        10007F112F00A0876E00170164002F0100000000C8000000A000000090000000
        780000007F000000010000001000000000002F01F8005D0010000000AA00507F
        1700537F10002979160066376600A705EC00AC11570036EC4A00030303030303
        030303030303110E1111030303030303030303030303010E0101030303030303
        03030303030E0E110E0E03030303030303030303030E0E010E0E030303030303
        03030303110E11110E1103030303030303030303010E01010E01030303030303
        03030311110E0E0E110E03030303030303030301010E0E0E010E030303030303
        030606060E1111111103030303030303030F0F0F0E0101010103030303030303
        03060111060E110E0303030303030303030F0F01000E010E0303030303030303
        0606010E1106110303030303030303030F0F0F0E010F01030303030303030306
        0601060F0F060303030303030303030F0F0F000F0F0F03030303030303030606
        010E0F06060603030303030303030F0F0F0E0F0F0F0F03030303030303060606
        060F06060303030303030303030F0F0F0F0F0F0F030303030303030306060106
        0606060303030303030303030F0F0F0F0F0F0F03030303030303030606010E0F
        06060303030303030303030F0F0F0E0F0F0F03030303030303030306010E0F06
        06030303030303030303030F0F0E0F0F0F0303030303030303030306060F0606
        03030303030303030303030F0F0F0F0F03030303030303030303030306060603
        0303030303030303030303030F0F0F0303030303030303030303030303030303
        0303030303030303030303030303030303030303030303030303}
      NumGlyphs = 2
    end
    object meCONSULTA_EN_PERSONA: TMemo
      Left = 136
      Top = 204
      Width = 609
      Height = 61
      TabOrder = 7
    end
    object edCOL_DESCRIPCION: TEdit
      Left = 136
      Top = 276
      Width = 233
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 8
    end
  end
  object PnDatos: TPanel
    Left = 0
    Top = 361
    Width = 844
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
      Left = 456
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
      Left = 456
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
      Left = 520
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
      Left = 520
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
  object Nuevo: TButton
    Left = 760
    Top = 8
    Width = 75
    Height = 25
    Action = actNuevo
    TabOrder = 6
  end
  object Button1: TButton
    Left = 760
    Top = 40
    Width = 75
    Height = 25
    Action = actModificar
    TabOrder = 2
  end
  object Button3: TButton
    Left = 760
    Top = 72
    Width = 75
    Height = 25
    Action = actAceptar
    TabOrder = 3
  end
  object Button4: TButton
    Left = 760
    Top = 104
    Width = 75
    Height = 25
    Action = actCancelar
    TabOrder = 4
  end
  object Button5: TButton
    Left = 760
    Top = 168
    Width = 75
    Height = 25
    Action = actBuscar
    TabOrder = 5
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesModificar = InterForma1DespuesModificar
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
    Left = 320
    Top = 314
  end
  object qTablasReferenExis: TQuery
    SQL.Strings = (
      'Select Tabla_Referenciada'
      '  From CR_Met_Tabla_Referen'
      ' Where Tabla_Referenciada = :Tabla_Referen')
    Left = 384
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Tabla_Referen'
        ParamType = ptUnknown
      end>
  end
  object ActionList1: TActionList
    Left = 352
    Top = 312
    object actNuevo: TAction
      Caption = '&Nuevo'
      OnExecute = actNuevoExecute
      OnUpdate = actNuevoUpdate
    end
    object actModificar: TAction
      Caption = '&Modificar'
      OnExecute = actModificarExecute
    end
    object actEliminar: TAction
      Caption = '&Eliminar'
      OnExecute = actEliminarExecute
    end
    object actAceptar: TAction
      Caption = '&Aceptar'
      OnExecute = actAceptarExecute
    end
    object actCancelar: TAction
      Caption = '&Cancelar'
      OnExecute = actCancelarExecute
    end
    object actBuscar: TAction
      Caption = '&Buscar'
      OnExecute = actBuscarExecute
    end
    object actActualizarLlave: TAction
      Caption = '&Actualizar Llave'
      OnExecute = actActualizarLlaveExecute
    end
  end
  object qDatosTabAct: TQuery
    SQL.Strings = (
      'Select Descripcion,'
      '       Sit_Tabla_Referen,'
      '       Num_Col_Llave,'
      '       Columnas_Llave,'
      '       Columnas_Llave_Foran,'
      '       Consulta_En_Persona'
      '  From CR_Met_Tabla_Referen'
      ' Where Tabla_Referenciada = :Tabla_Referenciada')
    Left = 416
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Tabla_Referenciada'
        ParamType = ptUnknown
      end>
  end
end
