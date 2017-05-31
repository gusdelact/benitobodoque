object WMReFondeo: TWMReFondeo
  Left = 248
  Top = 168
  Width = 766
  Height = 391
  Caption = 'Fondeo Diario'
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
    Top = 8
    Width = 34
    Height = 13
    Caption = 'Al día :'
  end
  object Label2: TLabel
    Left = 1
    Top = 27
    Width = 63
    Height = 14
    AutoSize = False
    Caption = '      F VTO.'
    Color = clInfoBk
    ParentColor = False
  end
  object lbFolio: TLabel
    Left = 66
    Top = 27
    Width = 74
    Height = 14
    AutoSize = False
    Caption = ' DISPOSICION'
    Color = clInfoBk
    ParentColor = False
  end
  object lbDiposicion: TLabel
    Left = 141
    Top = 27
    Width = 87
    Height = 14
    AutoSize = False
    Caption = 'ID. PROV. EXT.'
    Color = clInfoBk
    ParentColor = False
  end
  object lbDescripcion: TLabel
    Left = 229
    Top = 27
    Width = 238
    Height = 14
    AutoSize = False
    Caption = '                        NOMBRE'
    Color = clInfoBk
    ParentColor = False
  end
  object lbImporte: TLabel
    Left = 646
    Top = 27
    Width = 108
    Height = 14
    AutoSize = False
    Caption = '   SALDO INSOLUTO'
    Color = clInfoBk
    ParentColor = False
  end
  object Label3: TLabel
    Left = 468
    Top = 27
    Width = 63
    Height = 14
    AutoSize = False
    Caption = '    F. INICIO'
    Color = clInfoBk
    ParentColor = False
  end
  object Label4: TLabel
    Left = 532
    Top = 27
    Width = 65
    Height = 14
    AutoSize = False
    Caption = ' TASA BASE'
    Color = clInfoBk
    ParentColor = False
  end
  object Label5: TLabel
    Left = 598
    Top = 27
    Width = 47
    Height = 14
    AutoSize = False
    Caption = '  PLAZO'
    Color = clInfoBk
    ParentColor = False
  end
  object InterDateTimePicker1: TInterDateTimePicker
    Left = 128
    Top = 4
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 37967.7032326736
    Time = 37967.7032326736
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
    Edit = edFECHA_DIA
    Formato = dfDate
  end
  object edFECHA_DIA: TEdit
    Tag = 18
    Left = 48
    Top = 4
    Width = 81
    Height = 21
    TabOrder = 1
  end
  object PnDatos: TPanel
    Left = 5
    Top = 333
    Width = 748
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
      Left = 424
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
      Left = 424
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
      Left = 488
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
      Left = 488
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
  object sgDatos: TSGCtrl
    Left = 0
    Top = 42
    Width = 754
    Height = 289
    ShowTab = True
    TabOrder = 3
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    object btCANCELA: TBitBtn
      Left = 615
      Top = 264
      Width = 135
      Height = 22
      Caption = '&Busca Datos Fondeo'
      TabOrder = 2
      OnClick = btCANCELAClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
    end
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
    OnDespuesShow = InterForma1DespuesShow
    Left = 258
    Top = 65532
  end
end
