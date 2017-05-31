object wBitDVOperacion: TwBitDVOperacion
  Left = 256
  Top = 231
  Width = 900
  Height = 363
  Caption = 'Bitacora de Claves de Operación'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object plCatalogos: TPanel
    Left = 0
    Top = 0
    Width = 881
    Height = 73
    TabOrder = 0
    object Panel1: TPanel
      Left = 8
      Top = 8
      Width = 865
      Height = 49
      BevelWidth = 3
      TabOrder = 0
      object lblFolio: TLabel
        Left = 27
        Top = 13
        Width = 198
        Height = 21
        AutoSize = False
        Caption = 'Folio   de :                        a :'
        FocusControl = edFolioIni
        Layout = tlCenter
      end
      object lblClave: TLabel
        Left = 272
        Top = 13
        Width = 61
        Height = 21
        AutoSize = False
        Caption = 'Clave'
        Layout = tlCenter
      end
      object sbClave: TSpeedButton
        Left = 417
        Top = 13
        Width = 23
        Height = 22
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000CE0E0000D80E00000001000000000000000000008080
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
        OnClick = sbClaveClick
      end
      object edFolioIni: TEdit
        Left = 79
        Top = 13
        Width = 66
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 8
        TabOrder = 0
        OnKeyPress = edFolioIniKeyPress
      end
      object edFolioFin: TEdit
        Left = 163
        Top = 13
        Width = 66
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
        OnKeyPress = edFolioFinKeyPress
      end
      object edClave: TEdit
        Left = 315
        Top = 13
        Width = 97
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
        OnKeyPress = edClaveKeyPress
      end
    end
  end
  object T: TSGCtrl
    Left = 0
    Top = 80
    Width = 881
    Height = 248
    ShowTab = True
    TabOrder = 1
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
  end
  object Interforma: TInterForma
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
    ShowBtnNuevo = False
    ShowBtnModificar = False
    ShowBtnAceptar = False
    ShowBtnCancelar = False
    ShowBtnEliminar = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    OnBtnBuscarClick = InterformaBtnBuscarClick
    ShowBtnBuscar = False
    ShowBtnAyuda = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    OnDespuesShow = InterformaDespuesShow
    Left = 752
    Top = 24
  end
  object qryBitDVOperacion: TQuery
    DatabaseName = 'dbCorp'
    SQL.Strings = (
      'SELECT OP.BIT_FOLIO, '
      '       OP.BIT_REGISTRO, '
      '       OP.CVE_OPERACION, '
      '       IM.DESC_INST_MON, '
      '       DECODE(OP.SIT_OPERACION'
      '             ,'#39'AC'#39','#39'Activo'#39','#39'Inactivo'#39
      '             ) AS SIT_OPERACION, '
      '       OP.BIT_CVE_USUARIO, '
      '       OP.BIT_FACTUALIZA, '
      '       OP.BIT_OBSERVACIONES'
      '  FROM DV_OPERACION_BIT OP'
      '      ,LDIN_INST_MON IM'
      ' WHERE IM.CVE_INST_MON = OP.CVE_INST_MON'
      '   AND OP.BIT_FOLIO BETWEEN NVL(:PFOLIOINI,0)'
      '                        AND NVL(:PFOLIOFIN,999999999999)'
      '   AND OP.CVE_OPERACION  =  NVL(:PCVEOPERACION,OP.CVE_OPERACION)'
      'ORDER BY OP.BIT_FOLIO DESC, OP.BIT_REGISTRO DESC ')
    Left = 672
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFOLIOINI'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFOLIOFIN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCVEOPERACION'
        ParamType = ptInput
      end>
    object qryBitDVOperacionBIT_FOLIO: TFloatField
      DisplayLabel = 'Folio'
      DisplayWidth = 6
      FieldName = 'BIT_FOLIO'
    end
    object qryBitDVOperacionBIT_REGISTRO: TStringField
      DisplayLabel = 'Registro'
      DisplayWidth = 10
      FieldName = 'BIT_REGISTRO'
      Size = 5
    end
    object qryBitDVOperacionCVE_OPERACION: TStringField
      DisplayLabel = 'Cve Operación'
      DisplayWidth = 13
      FieldName = 'CVE_OPERACION'
      Size = 6
    end
    object qryBitDVOperacionDESC_INST_MON: TStringField
      DisplayLabel = 'Instrumento Monetario'
      DisplayWidth = 30
      FieldName = 'DESC_INST_MON'
      Size = 40
    end
    object qryBitDVOperacionSIT_OPERACION: TStringField
      DisplayLabel = 'Estatus'
      DisplayWidth = 10
      FieldName = 'SIT_OPERACION'
      Size = 8
    end
    object qryBitDVOperacionBIT_CVE_USUARIO: TStringField
      DisplayLabel = 'Clave Usuario'
      DisplayWidth = 12
      FieldName = 'BIT_CVE_USUARIO'
      Size = 100
    end
    object qryBitDVOperacionBIT_FACTUALIZA: TDateTimeField
      DisplayLabel = 'Fecha Actualiza'
      DisplayWidth = 22
      FieldName = 'BIT_FACTUALIZA'
    end
    object qryBitDVOperacionBIT_OBSERVACIONES: TStringField
      DisplayLabel = 'Referencia'
      DisplayWidth = 35
      FieldName = 'BIT_OBSERVACIONES'
      Size = 100
    end
  end
  object dsBitDVOperacion: TDataSource
    DataSet = qryBitDVOperacion
    Left = 712
    Top = 24
  end
end
