object WPrgavencimiento: TWPrgavencimiento
  Left = 342
  Top = 149
  Width = 453
  Height = 473
  Caption = 'Prórroga por Fecha de Vencimiento'
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
  object Shape25: TShape
    Left = 4
    Top = 153
    Width = 50
    Height = 33
    Brush.Color = 12320767
    Enabled = False
  end
  object lblNUM_PERIODO: TLabel
    Left = 12
    Top = 155
    Width = 33
    Height = 27
    Alignment = taCenter
    AutoSize = False
    Caption = 'Pdo.'
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Shape1: TShape
    Left = 53
    Top = 153
    Width = 193
    Height = 17
    Brush.Color = 12320767
    Enabled = False
  end
  object lblFechaVencimiento: TLabel
    Left = 59
    Top = 155
    Width = 181
    Height = 12
    Alignment = taCenter
    AutoSize = False
    Caption = 'Fecha Vencimiento'
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Shape18: TShape
    Left = 53
    Top = 169
    Width = 75
    Height = 17
    Brush.Color = 12320767
    Enabled = False
  end
  object lblF_VENCIMIENTO: TLabel
    Left = 56
    Top = 172
    Width = 66
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Actual'
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Shape2: TShape
    Left = 127
    Top = 169
    Width = 119
    Height = 17
    Brush.Color = 12320767
    Enabled = False
  end
  object lblF_VENC_PRGA: TLabel
    Left = 129
    Top = 171
    Width = 111
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Nueva'
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Shape3: TShape
    Left = 245
    Top = 153
    Width = 61
    Height = 33
    Brush.Color = 12320767
    Enabled = False
  end
  object lblSIT_CAPITAL: TLabel
    Left = 248
    Top = 156
    Width = 55
    Height = 27
    Alignment = taCenter
    AutoSize = False
    Caption = 'Situación'
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Shape4: TShape
    Left = 305
    Top = 153
    Width = 80
    Height = 33
    Brush.Color = 12320767
    Enabled = False
  end
  object lblIMP_CAPITAL: TLabel
    Left = 310
    Top = 155
    Width = 69
    Height = 27
    Alignment = taCenter
    AutoSize = False
    Caption = 'Importe'#13#10
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object grbxCorrimiento: TGroupBox
    Left = 4
    Top = 103
    Width = 434
    Height = 42
    Caption = '                  '
    TabOrder = 8
    object lblCorrimiento: TLabel
      Left = 8
      Top = -2
      Width = 52
      Height = 13
      Caption = 'Corrimiento'
      Color = clBtnFace
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object opAutomatico: TRadioButton
      Left = 20
      Top = 16
      Width = 89
      Height = 17
      Caption = 'Automático'
      Color = clBtnFace
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      OnClick = opManualClick
    end
    object opManual: TRadioButton
      Left = 263
      Top = 16
      Width = 90
      Height = 17
      Caption = 'Manual'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = opManualClick
    end
  end
  object strGrdData: TStringGrid
    Left = 1
    Top = 184
    Width = 433
    Height = 147
    ColCount = 6
    DefaultRowHeight = 16
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 2
    OnDrawCell = strGrdDataDrawCell
    ColWidths = (
      2
      48
      72
      117
      60
      78)
  end
  object GroupBox4: TGroupBox
    Left = 4
    Top = 2
    Width = 434
    Height = 47
    TabOrder = 0
    object Label9: TLabel
      Left = 15
      Top = 13
      Width = 68
      Height = 27
      AutoSize = False
      Caption = 'Número de'#13#10'Disposición'
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
    object Label12: TLabel
      Left = 261
      Top = 13
      Width = 61
      Height = 27
      AutoSize = False
      Caption = 'Periodo'#13#10'a Prorrogar'
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
      Left = 90
      Top = 15
      Width = 91
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 0
    end
    object edNUM_PERIODO: TEdit
      Left = 344
      Top = 17
      Width = 54
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 4
    Top = 51
    Width = 434
    Height = 46
    Caption = 'Fecha de Vencimiento'
    TabOrder = 1
    object Label15: TLabel
      Left = 58
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
      Left = 261
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
      Left = 101
      Top = 17
      Width = 68
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 0
      Text = '00/00/0000'
    end
    object InterDateTimePicker2: TInterDateTimePicker
      Left = 164
      Top = 17
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
      Edit = dtpF_VENCIMIENTO
      Formato = dfDate
    end
    object dtpF_VENC_PRGA: TEdit
      Left = 314
      Top = 17
      Width = 68
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = '00/00/0000'
      OnChange = dtpF_VENC_PRGAChange
    end
    object InterDateTimePicker1: TInterDateTimePicker
      Left = 377
      Top = 17
      Width = 20
      Height = 21
      CalAlignment = dtaLeft
      Date = 37554.5731407176
      Time = 37554.5731407176
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      OnChange = dtpF_VENC_PRGAChange
      Edit = dtpF_VENC_PRGA
      Formato = dfDate
    end
  end
  object PnDatos: TPanel
    Left = 0
    Top = 414
    Width = 437
    Height = 21
    TabOrder = 5
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
      Left = 280
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
      Left = 280
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
      Left = 344
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
      Left = 344
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
  object PnlMsg: TPanel
    Left = 0
    Top = 393
    Width = 437
    Height = 21
    TabOrder = 6
  end
  object memMessage: TMemo
    Left = 3
    Top = 334
    Width = 354
    Height = 53
    Color = clInfoBk
    TabOrder = 3
  end
  object btnAplicar: TButton
    Left = 359
    Top = 334
    Width = 76
    Height = 34
    Caption = '&Aplicar'
    TabOrder = 4
    OnClick = btnAplicarClick
  end
  object dtpF_VENC_PRGA_NVO: TDateTimePicker
    Left = 229
    Top = 184
    Width = 18
    Height = 19
    CalAlignment = dtaLeft
    Date = 38119.5185998727
    Time = 38119.5185998727
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 7
    Visible = False
    OnCloseUp = dtpF_VENC_PRGA_NVOCloseUp
    OnChange = dtpF_VENC_PRGA_NVOChange
    OnDropDown = dtpF_VENC_PRGA_NVODropDown
    OnEnter = dtpF_VENC_PRGA_NVOEnter
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
    Left = 383
    Top = 271
  end
end
