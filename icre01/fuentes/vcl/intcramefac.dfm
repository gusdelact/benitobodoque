object WCrAmefac: TWCrAmefac
  Left = 289
  Top = 107
  Width = 543
  Height = 289
  Caption = 'Información Mensual para AMEFAC'
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
    Left = 10
    Top = 9
    Width = 46
    Height = 13
    Caption = 'Al mes de'
  end
  object lblLoad: TLabel
    Left = 10
    Top = 188
    Width = 97
    Height = 13
    Caption = 'Generando Archivos'
  end
  object edF_MES: TEdit
    Tag = 18
    Left = 155
    Top = 5
    Width = 69
    Height = 21
    HelpContext = 5301
    CharCase = ecUpperCase
    TabOrder = 0
    Text = '31/03/2004'
  end
  object dtpF_MES: TInterDateTimePicker
    Tag = 17
    Left = 228
    Top = 5
    Width = 21
    Height = 21
    HelpContext = 5302
    CalAlignment = dtaLeft
    Date = 37781.35659625
    Time = 37781.35659625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
    TabStop = False
    Edit = edF_MES
    Formato = dfDate
  end
  object btGENERA: TBitBtn
    Left = 363
    Top = 195
    Width = 165
    Height = 25
    Caption = '&Genera Archivo en Excel'
    TabOrder = 2
    OnClick = btGENERAClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
      7700333333337777777733333333008088003333333377F73377333333330088
      88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
      000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
      FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
      99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
  end
  object PnDatos: TPanel
    Left = 0
    Top = 220
    Width = 529
    Height = 21
    TabOrder = 3
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
  object ProgressBar: TProgressBar
    Left = 2
    Top = 203
    Width = 359
    Height = 12
    Min = 0
    Max = 100
    TabOrder = 4
  end
  object GroupBox1: TGroupBox
    Left = 2
    Top = 26
    Width = 527
    Height = 100
    Caption = 'Información Mensual AMEFAC'
    TabOrder = 5
    object Label5: TLabel
      Left = 10
      Top = 28
      Width = 93
      Height = 13
      Caption = 'Nombre del Archivo'
    end
    object chINF_MENSUAL: TCheckBox
      Left = 336
      Top = 8
      Width = 182
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Genera Información'
      TabOrder = 0
      OnClick = chINF_MENSUALClick
    end
    object edDIR_INFMENSUAL: TEdit
      Tag = 18
      Left = 153
      Top = 30
      Width = 336
      Height = 21
      CharCase = ecUpperCase
      Color = clBtnFace
      Enabled = False
      TabOrder = 1
      Text = 'C:\'
    end
    object btDIR_INFMENSUAL: TBitBtn
      Left = 498
      Top = 29
      Width = 23
      Height = 22
      Caption = '...'
      Enabled = False
      TabOrder = 2
      OnClick = btDIR_INFMENSUALClick
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 53
      Width = 497
      Height = 41
      Caption = 'Número de Empleados'
      TabOrder = 3
      object Label8: TLabel
        Left = 24
        Top = 18
        Width = 39
        Height = 13
        Caption = 'Directos'
      end
      object Label2: TLabel
        Left = 320
        Top = 18
        Width = 46
        Height = 13
        Caption = 'Indirectos'
      end
      object edEMP_DIRECTOS: TInterEdit
        Left = 136
        Top = 14
        Width = 80
        Height = 21
        HelpContext = 6001
        Prefijo = '1'
        Contrato = -1
        TipoReader = trEntero
        OnExit = edEMP_DIRECTOSExit
        DisplayMask = '####0'
        MaxLength = 5
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 0
        Enabled = False
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edEMP_INDIRECTOS: TInterEdit
        Left = 393
        Top = 14
        Width = 80
        Height = 21
        HelpContext = 6101
        Prefijo = '1'
        Contrato = -1
        TipoReader = trEntero
        OnExit = edEMP_INDIRECTOSExit
        DisplayMask = '####0'
        MaxLength = 5
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        TabOrder = 1
        Enabled = False
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 2
    Top = 127
    Width = 527
    Height = 60
    Caption = 'Información Mensual AMEFAC Cartera Vencida'
    TabOrder = 6
    object Label4: TLabel
      Left = 10
      Top = 36
      Width = 127
      Height = 13
      Caption = 'Ruta del Archivo a generar'
    end
    object chINF_VENCIDA: TCheckBox
      Left = 336
      Top = 8
      Width = 185
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Genera Información'
      TabOrder = 0
      OnClick = chINF_VENCIDAClick
    end
    object edDIR_INFVENCIDA: TEdit
      Tag = 18
      Left = 153
      Top = 32
      Width = 336
      Height = 21
      CharCase = ecUpperCase
      Color = clBtnFace
      Enabled = False
      TabOrder = 1
      Text = 'C:\'
    end
    object btDIR_INFVENCIDA: TBitBtn
      Left = 498
      Top = 31
      Width = 23
      Height = 22
      Caption = '...'
      Enabled = False
      TabOrder = 2
      OnClick = btDIR_INFVENCIDAClick
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
    Left = 188
    Top = 2
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    Filter = 
      'Archivos Excell (*.xls)|*.xls|Archivos de Texto (*.txt)|*.txt|To' +
      'dos los Archivos (*.*)|*.*'
    Left = 234
  end
  object SaveDialog2: TSaveDialog
    DefaultExt = 'xls'
    Filter = 
      'Archivos Excell (*.xls)|*.xls|Archivos de Texto (*.txt)|*.txt|To' +
      'dos los Archivos (*.*)|*.*'
    Left = 290
  end
end
