object WCrActPa: TWCrActPa
  Left = 419
  Top = 146
  Width = 538
  Height = 371
  Caption = 'Actualizaciones Parciales'
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
  object PnDatos: TPanel
    Left = 0
    Top = 310
    Width = 530
    Height = 21
    TabOrder = 0
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
  object Panel1: TPanel
    Left = 8
    Top = 5
    Width = 513
    Height = 297
    TabOrder = 1
    object lbArchivoSalida: TLabel
      Left = 240
      Top = 74
      Width = 95
      Height = 13
      Caption = 'Nombre del Reporte'
    end
    object lbFInicio: TLabel
      Left = 8
      Top = 16
      Width = 129
      Height = 13
      Caption = 'Fecha de Inicio del Periodo'
    end
    object sbArchivoSalidaPF: TSpeedButton
      Left = 467
      Top = 93
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
      OnClick = sbArchivoSalidaPFClick
    end
    object lbFFin: TLabel
      Left = 8
      Top = 48
      Width = 118
      Height = 13
      Caption = 'Fecha de Fin del Periodo'
    end
    object sbArchivoSalidaH: TSpeedButton
      Left = 467
      Top = 133
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
      OnClick = sbArchivoSalidaHClick
    end
    object sbArchivoSalidaPM: TSpeedButton
      Left = 467
      Top = 173
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
      OnClick = sbArchivoSalidaPMClick
    end
    object bbGenReporte: TBitBtn
      Left = 8
      Top = 237
      Width = 153
      Height = 25
      Caption = 'Genera Reportes'
      TabOrder = 0
      OnClick = bbGenReporteClick
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
    object edArchivoSalidaPF: TEdit
      Tag = 18
      Left = 168
      Top = 94
      Width = 281
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object dtFInicio: TDateTimePicker
      Left = 166
      Top = 12
      Width = 85
      Height = 21
      CalAlignment = dtaLeft
      Date = 39973.4085888657
      Time = 39973.4085888657
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
    end
    object dtFFin: TDateTimePicker
      Left = 166
      Top = 44
      Width = 85
      Height = 21
      CalAlignment = dtaLeft
      Date = 39973.4085888657
      Time = 39973.4085888657
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      OnChange = dtFFinChange
    end
    object cbPersonasFisicas: TCheckBox
      Left = 8
      Top = 96
      Width = 129
      Height = 17
      Caption = 'Personas Físicas'
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = cbPersonasFisicasClick
    end
    object cbHipotecarios: TCheckBox
      Left = 8
      Top = 136
      Width = 97
      Height = 17
      Caption = 'Hipotecarios'
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = cbHipotecariosClick
    end
    object edArchivoSalidaH: TEdit
      Tag = 18
      Left = 168
      Top = 134
      Width = 281
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
    end
    object cbPersonasMorales: TCheckBox
      Left = 8
      Top = 176
      Width = 129
      Height = 17
      Caption = 'PersonasMorales'
      Checked = True
      State = cbChecked
      TabOrder = 7
      OnClick = cbPersonasMoralesClick
    end
    object edArchivoSalidaPM: TEdit
      Tag = 18
      Left = 168
      Top = 174
      Width = 281
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 8
    end
    object pAniBar: TPanel
      Left = 170
      Top = 238
      Width = 279
      Height = 25
      TabOrder = 9
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
    Left = 101
    Top = 16
  end
  object sdArchivoSalidaPF: TSaveDialog
    DefaultExt = 'ext'
    Filter = '*.ext|*.ext'
    InitialDir = 'c:\'
    Top = 19
  end
  object sdArchivoSalidaH: TSaveDialog
    DefaultExt = 'ext'
    Filter = '*.ext|*.ext'
    InitialDir = 'c:\'
    Left = 32
    Top = 19
  end
  object sdArchivoSalidaPM: TSaveDialog
    DefaultExt = 'ext'
    Filter = '*.ext|*.ext'
    InitialDir = 'c:\'
    Left = 64
    Top = 19
  end
end
