object WCrMetify: TWCrMetify
  Left = 359
  Top = 317
  Width = 549
  Height = 208
  Caption = 'M  E  T  I  F  Y'
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
  object Panel1: TPanel
    Left = 0
    Top = 7
    Width = 540
    Height = 137
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 0
    object sbFechaArch: TSpeedButton
      Left = 113
      Top = 95
      Width = 313
      Height = 25
      Caption = 'Genera Información'
      Glyph.Data = {
        46030000424D46030000000000003600000028000000120000000E0000000100
        1800000000001003000000000000000000000000000000000000DE3C00006500
        0065000065000065000065000065000065000065000065000065000065000065
        00006500006500006500006500FFFFFF0000DE3C00006500006500FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        6500006500FFFFFF0000DE3800006500006500FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF006500006500006500006500006500006500006500FFFFFF
        0000DE3800006500006500FFFFFF006500006500006500006500006500006500
        006500FFFFFF006500006500006500006500006500FFFFFF0000DE3C00006500
        006500FFFFFF006500006500006500006500006500006500FFFFFF0065000065
        00006500FFFFFF006500006500FFFFFF0000DE3800006500006500FFFFFF0065
        00006500006500006500006500FFFFFF006500006500006500006500FFFFFF00
        6500006500FFFFFF0000D63800006500006500FFFFFFFFFFFF00650000650000
        6500FFFFFF006500006500006500006500006500FFFFFF006500006500FFFFFF
        0000D63400006500006500FFFFFFFFFFFFFFFFFF006500FFFFFF006500006500
        006500006500FFFFFFFFFFFFFFFFFF006500006500FFFFFF0000D63400006500
        006500FFFFFFFFFFFF006500FFFFFF0065000065000065000065000065000065
        00FFFFFFFFFFFF006500006500FFFFFF0000D63400006500006500FFFFFF0065
        00FFFFFF006500006500006500006500006500006500006500006500FFFFFF00
        6500006500FFFFFF0000C63000006500006500FFFFFF00650000650000650000
        6500006500FFFFFF006500006500006500006500FFFFFF006500006500FFFFFF
        0000C63000006500006500FFFFFF006500006500006500006500FFFFFFFFFFFF
        FFFFFF006500006500006500FFFFFF006500006500FFFFFF0000C63400006500
        006500FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF006500006500FFFFFF0000C634000065000065000065000065
        0000650000650000650000650000650000650000650000650000650000650000
        6500006500FFFFFF0000}
      OnClick = sbFechaArchClick
    end
    object Label4: TLabel
      Left = 50
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Archivo:'
    end
    object sbExcel: TSpeedButton
      Left = 96
      Top = 13
      Width = 23
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      OnClick = sbExcelClick
    end
    object Label1: TLabel
      Left = 50
      Top = 56
      Width = 39
      Height = 13
      Caption = 'Periodo:'
    end
    object edNbrArch: TEdit
      Left = 122
      Top = 13
      Width = 354
      Height = 21
      Color = clBtnFace
      TabOrder = 0
      Text = 'c:\metify.xls'
    end
    object EDFecha: TEdit
      Tag = -1
      Left = 101
      Top = 48
      Width = 94
      Height = 21
      Color = clBtnFace
      TabOrder = 1
    end
    object dtFecha: TInterDateTimePicker
      Left = 197
      Top = 48
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 35921.5224651389
      Time = 35921.5224651389
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
      Edit = EDFecha
      Formato = dfDate
    end
    object edFin: TEdit
      Tag = -1
      Left = 253
      Top = 48
      Width = 94
      Height = 21
      Color = clBtnFace
      TabOrder = 3
    end
    object dtFin: TInterDateTimePicker
      Left = 349
      Top = 48
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 35921.5224651389
      Time = 35921.5224651389
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 4
      Edit = edFin
      Formato = dfDate
    end
  end
  object PnDatos: TPanel
    Left = 0
    Top = 148
    Width = 540
    Height = 21
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
      Left = 262
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
      Left = 262
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
      Left = 326
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
      Left = 326
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
    Left = 562
    Top = 2
  end
  object qDatos1: TQuery
    DatabaseName = 'DCORP'
    Top = 7
  end
  object qDatos2: TQuery
    DatabaseName = 'DCORP'
    Top = 39
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'XLS'
    Filter = 'Archivos Microsoft Excel (*.XLS)|*.XLS'
    Left = 461
    Top = 194
  end
  object SaveDialog2: TSaveDialog
    DefaultExt = 'XLS'
    Filter = 'Archivos Microsoft Excel (*.XLS)|*.XLS'
    Left = 461
    Top = 194
  end
  object qDatos3: TQuery
    DatabaseName = 'DCORP'
    Top = 71
  end
end
