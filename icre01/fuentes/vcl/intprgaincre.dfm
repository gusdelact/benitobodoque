object WPrgaincremento: TWPrgaincremento
  Left = 351
  Top = 224
  Width = 525
  Height = 280
  Caption = 'Prórroga por Incremento de Periodo'
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
    Left = 5
    Top = 220
    Width = 511
    Height = 21
    TabOrder = 7
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
      Left = 264
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
      Left = 264
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
      Left = 316
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
      Left = 316
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
  object memMessage: TMemo
    Left = 6
    Top = 143
    Width = 402
    Height = 45
    TabStop = False
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 5
  end
  object btnAplicar: TButton
    Left = 412
    Top = 143
    Width = 103
    Height = 46
    Caption = '&Aplicar'
    TabOrder = 4
    OnClick = btnAplicarClick
  end
  object Panel1: TPanel
    Left = 5
    Top = 6
    Width = 510
    Height = 39
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label27: TLabel
      Left = 19
      Top = 14
      Width = 92
      Height = 15
      AutoSize = False
      Caption = 'Núm. Disposición'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label26: TLabel
      Left = 315
      Top = 11
      Width = 46
      Height = 17
      AutoSize = False
      Caption = 'Periodo'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object edID_CREDITO: TEdit
      Left = 107
      Top = 9
      Width = 68
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 0
    end
    object edNUM_PERIODO: TEdit
      Left = 369
      Top = 10
      Width = 54
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 94
    Width = 316
    Height = 46
    Caption = 'Importe de Capital'
    TabOrder = 2
    object Label15: TLabel
      Left = 10
      Top = 20
      Width = 43
      Height = 18
      AutoSize = False
      Caption = 'Actual'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label16: TLabel
      Left = 161
      Top = 20
      Width = 43
      Height = 18
      AutoSize = False
      Caption = 'Nuevo'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object edIMP_CAPITAL_NVO: TInterEdit
      Left = 205
      Top = 15
      Width = 95
      Height = 21
      HelpContext = 5501
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      OnExit = edIMP_CAPITAL_NVOExit
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      TabOrder = 1
      UseReType = False
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edIMP_CAPITAL: TInterEdit
      Left = 52
      Top = 15
      Width = 95
      Height = 21
      HelpContext = 5501
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      Color = cl3DLight
      TabOrder = 0
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object GroupBox2: TGroupBox
    Left = 325
    Top = 94
    Width = 191
    Height = 46
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 11
      Width = 74
      Height = 27
      AutoSize = False
      Caption = 'Imp. Capital del'#13#10'Periodo Original'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object edIMP_DIFERENCIA: TInterEdit
      Left = 88
      Top = 15
      Width = 95
      Height = 21
      HelpContext = 5501
      TabStop = False
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 18
      Color = cl3DLight
      TabOrder = 0
      ReadOnly = True
      UseReType = False
      UseSep = False
      UseDisplay = True
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object GroupBox3: TGroupBox
    Left = 5
    Top = 46
    Width = 511
    Height = 48
    Caption = 'Fecha de  Vencimiento'
    TabOrder = 1
    object Label3: TLabel
      Left = 9
      Top = 20
      Width = 43
      Height = 18
      AutoSize = False
      Caption = 'Actual'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 289
      Top = 20
      Width = 43
      Height = 18
      AutoSize = False
      Caption = 'Nuevo'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object dtpF_VENCIMIENTO: TEdit
      Left = 82
      Top = 18
      Width = 65
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 0
      Text = '00/00/0000'
    end
    object InterDateTimePicker1: TInterDateTimePicker
      Left = 148
      Top = 18
      Width = 20
      Height = 21
      CalAlignment = dtaLeft
      Date = 37554.5731407176
      Time = 37554.5731407176
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      TabStop = False
      Edit = dtpF_VENCIMIENTO
      Formato = dfDate
    end
    object dtpF_VENC_PRGA: TEdit
      Left = 337
      Top = 16
      Width = 68
      Height = 21
      Color = clMenu
      TabOrder = 2
      Text = '00/00/0000'
    end
    object InterDateTimePicker2: TInterDateTimePicker
      Left = 402
      Top = 16
      Width = 20
      Height = 22
      CalAlignment = dtaLeft
      Date = 37554.5731407176
      Time = 37554.5731407176
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      Edit = dtpF_VENC_PRGA
      Formato = dfDate
    end
  end
  object PnlMsg: TPanel
    Left = 6
    Top = 193
    Width = 509
    Height = 25
    TabOrder = 6
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
    Left = 481
    Top = 10
  end
end
