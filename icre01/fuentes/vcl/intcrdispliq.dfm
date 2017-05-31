object WCrdispliq: TWCrdispliq
  Left = 442
  Top = 318
  Width = 482
  Height = 188
  Caption = 'Liquidaciones - Colocaciones en el mes'
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
  object Label6: TLabel
    Left = 3
    Top = 96
    Width = 77
    Height = 13
    Caption = 'Generar Archivo'
  end
  object sbExcel: TSpeedButton
    Left = 97
    Top = 91
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
  object edNbrArch: TEdit
    Left = 124
    Top = 92
    Width = 309
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 0
    OnChange = edNbrArchChange
  end
  object cbxArchivo: TCheckBox
    Left = 449
    Top = 95
    Width = 14
    Height = 15
    TabStop = False
    Enabled = False
    TabOrder = 1
    OnClick = cbxArchivoClick
  end
  object PnDatos: TPanel
    Left = 0
    Top = 133
    Width = 474
    Height = 26
    TabOrder = 2
    object lbEmpresa: TLabel
      Left = 10
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
      Left = 10
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
      Left = 380
      Top = 2
      Width = 29
      Height = 8
      Caption = 'FECHA:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbPerfil: TLabel
      Left = 10
      Top = 16
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
      Left = 55
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
      Left = 55
      Top = 16
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
      Left = 409
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
      Left = 55
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
  object GroupBox1: TGroupBox
    Left = 1
    Top = 1
    Width = 472
    Height = 63
    Caption = 'Seleccionar Rango de Fechas'
    TabOrder = 3
    object Label4: TLabel
      Left = 61
      Top = 29
      Width = 27
      Height = 13
      Caption = 'Inicial'
    end
    object Label8: TLabel
      Left = 279
      Top = 28
      Width = 22
      Height = 13
      Caption = 'Final'
    end
    object edF_Inicial: TEdit
      Tag = 512
      Left = 96
      Top = 25
      Width = 76
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 0
    end
    object edF_Final: TEdit
      Tag = 512
      Left = 308
      Top = 24
      Width = 76
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 1
    end
    object dtpFECHAIni: TInterDateTimePicker
      Left = 174
      Top = 25
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 39960.450694537
      Time = 39960.450694537
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
      TabStop = False
      Edit = edF_Inicial
      Formato = dfDate
    end
    object dtpFECHAFin: TInterDateTimePicker
      Left = 386
      Top = 24
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 39960.450694537
      Time = 39960.450694537
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      TabStop = False
      Edit = edF_Final
      Formato = dfDate
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
    OnBtnPreviewClick = InterForma1BtnPreviewClick
    ShowBtnPreview = False
    OnBtnImprimirClick = InterForma1BtnImprimirClick
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    OnDespuesShow = InterForma1DespuesShow
    Left = 442
    Top = 2
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'prn'
    Filter = 'Archivos Microsoft Excel (*.XLS)|*.XLS'
    Left = 210
    Top = 87
  end
end
