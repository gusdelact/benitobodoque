object WMQrCoin: TWMQrCoin
  Left = 180
  Top = 171
  Width = 604
  Height = 316
  Caption = 'Consultas Saldos COINCRE'
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
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 20
    Height = 13
    Caption = 'Mes'
  end
  object Label2: TLabel
    Left = 328
    Top = 8
    Width = 19
    Height = 13
    Caption = 'Año'
  end
  object Label6: TLabel
    Left = 13
    Top = 238
    Width = 77
    Height = 13
    Caption = 'Generar Archivo'
  end
  object sbExcel: TSpeedButton
    Left = 125
    Top = 233
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
  object PnDatos: TPanel
    Left = 5
    Top = 258
    Width = 588
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
      Left = 320
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
      Left = 320
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
      Left = 384
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
      Left = 384
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
  object cbMes: TComboBox
    Left = 88
    Top = 4
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'Enero'
    Items.Strings = (
      'Enero'
      'Febrero'
      'Marzo'
      'Abril'
      'Mayo'
      'Junio'
      'Julio'
      'Agosto'
      'Septiembre'
      'Octubre'
      'Noviembre'
      'Diciembre')
  end
  object cbAnio: TComboBox
    Left = 376
    Top = 4
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = '2000'
    Items.Strings = (
      '2005'
      '2006'
      '2007'
      '2008'
      '2009'
      '2010'
      '2011'
      '2012'
      '2013'
      '2014'
      '2015'
      '2016'
      '2017'
      '2018'
      '2019'
      '2020')
  end
  object rgTipoReporte: TRadioGroup
    Left = 7
    Top = 71
    Width = 586
    Height = 161
    Caption = 'Reporte'
    ItemIndex = 0
    Items.Strings = (
      'Cartera Banco Interaciones Vigente - Impagada'
      
        'Consulta Créditos Fondeo          --------------->  (Salida Exce' +
        'l)'
      'Conuslta Consultas Integración Cartera --->  (Salida Excel)'
      'Relación Características de la Cartera')
    TabOrder = 3
  end
  object rgTipoCartera: TRadioGroup
    Left = 8
    Top = 29
    Width = 289
    Height = 41
    Caption = 'Tipo de Cartera'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Bancaria'
      'No Bancaria'
      'Ambos')
    TabOrder = 4
  end
  object rgGrupoMon: TRadioGroup
    Left = 304
    Top = 29
    Width = 289
    Height = 41
    Caption = 'Agrupación Moneda'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Agrupa por Moneda'
      'Sin Agrupación')
    TabOrder = 5
  end
  object cbDetalle: TCheckBox
    Left = 495
    Top = 6
    Width = 97
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Detalle'
    TabOrder = 6
  end
  object edNbrArch: TEdit
    Left = 149
    Top = 234
    Width = 436
    Height = 21
    Color = clBtnFace
    TabOrder = 7
  end
  object InterForma1: TInterForma
    IsMain = True
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnImprimir = InterForma1Imprimir
    OnPreview = InterForma1Preview
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
    Left = 474
    Top = 2
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'prn'
    Filter = '*.prn|*.prn'
    Left = 509
    Top = 78
  end
end
