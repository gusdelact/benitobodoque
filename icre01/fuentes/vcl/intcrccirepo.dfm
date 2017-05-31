object WCrCciReporte: TWCrCciReporte
  Left = 221
  Top = 47
  Width = 931
  Height = 661
  Caption = 'Reporte de Cartas de Crédito'
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
    Left = 8
    Top = 11
    Width = 30
    Height = 13
    Caption = 'Fecha'
  end
  object lbFileNameExcel: TLabel
    Left = 14
    Top = 575
    Width = 48
    Height = 13
    Caption = 'Ubicación'
  end
  object dtpF_CIERRE: TDateTimePicker
    Left = 54
    Top = 7
    Width = 85
    Height = 21
    CalAlignment = dtaLeft
    Date = 39973.4085888657
    Time = 39973.4085888657
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
    OnChange = dtpF_CIERREChange
  end
  object btBusca: TButton
    Left = 144
    Top = 7
    Width = 141
    Height = 21
    Caption = '&Muestra Información'
    TabOrder = 1
    OnClick = btBuscaClick
  end
  object PnDatos: TPanel
    Left = 3
    Top = 602
    Width = 912
    Height = 21
    TabOrder = 2
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
      Left = 460
      Top = 1
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
      Left = 476
      Top = 10
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
      Left = 524
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
      Left = 524
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
  object SGDatos: TSGCtrl
    Left = 3
    Top = 37
    Width = 910
    Height = 527
    ShowTab = True
    BevelOuter = bvNone
    TabOrder = 3
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
  end
  object btnGenArchivoXLS: TButton
    Left = 784
    Top = 568
    Width = 130
    Height = 22
    Caption = 'Salida a Excel'
    TabOrder = 4
    OnClick = btnGenArchivoXLSClick
  end
  object edFileNameExcel: TEdit
    Left = 71
    Top = 569
    Width = 684
    Height = 21
    TabOrder = 5
    Text = 'C:\'
  end
  object btnFileNameXLS: TButton
    Left = 755
    Top = 569
    Width = 23
    Height = 22
    Caption = '...'
    TabOrder = 6
    OnClick = btnFileNameXLSClick
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
    Left = 881
    Top = 589
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'XLS'
    Filter = 'Archivo Excel (*.xls)|.XLS|XLS'
    Left = 792
    Top = 524
  end
end
