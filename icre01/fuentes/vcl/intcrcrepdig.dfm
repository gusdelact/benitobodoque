object WCrCRepDig: TWCrCRepDig
  Left = 268
  Top = 144
  Width = 606
  Height = 393
  Caption = 'Estados de Cuenta Digitalizados.'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PDirect: TPanel
    Left = -7
    Top = 1
    Width = 584
    Height = 320
    Caption = 'PDirect'
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 8
      Width = 179
      Height = 13
      Caption = 'Seleccione el Documento Digitalizado'
      Color = clBtnFace
      ParentColor = False
    end
    object Label4: TLabel
      Left = 208
      Top = 56
      Width = 20
      Height = 13
      Caption = 'Mes'
    end
    object Label5: TLabel
      Left = 16
      Top = 56
      Width = 19
      Height = 13
      Caption = 'Año'
    end
    object Label9: TLabel
      Left = 247
      Top = 27
      Width = 30
      Height = 13
      Caption = 'Fecha'
      WordWrap = True
    end
    object lbDir: TListBox
      Left = 13
      Top = 80
      Width = 564
      Height = 209
      ItemHeight = 13
      TabOrder = 0
    end
    object Button2: TButton
      Left = 494
      Top = 292
      Width = 75
      Height = 25
      Caption = 'Visualizar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object cbMes: TComboBox
      Left = 232
      Top = 53
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = cbMesChange
      OnClick = cbMesClick
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
      Left = 40
      Top = 53
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnChange = cbAnioChange
      OnClick = cbAnioClick
    end
    object rgTipoArchivo: TRadioGroup
      Left = 392
      Top = 43
      Width = 177
      Height = 31
      Caption = 'Tipo de Archivo'
      Columns = 2
      Items.Strings = (
        'PDF'
        'Excel')
      TabOrder = 4
      OnClick = rgTipoArchivoClick
    end
    object Ltemp: TListBox
      Left = 408
      Top = 8
      Width = 33
      Height = 25
      ItemHeight = 13
      TabOrder = 5
      Visible = False
    end
    object edFECHA: TEdit
      Left = 280
      Top = 23
      Width = 75
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 6
      OnChange = edFECHAChange
    end
    object dtpFecha: TInterDateTimePicker
      Left = 357
      Top = 23
      Width = 21
      Height = 21
      CalAlignment = dtaLeft
      Date = 37770.450694537
      Time = 37770.450694537
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 7
      TabStop = False
      Edit = edFECHA
      Formato = dfDate
    end
  end
  object PnDatos: TPanel
    Left = -26
    Top = 329
    Width = 609
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
    ShowBtnNuevo = False
    ShowBtnModificar = False
    ShowBtnAceptar = False
    ShowBtnCancelar = False
    ShowBtnEliminar = False
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowBtnBuscar = False
    ShowBtnAyuda = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 474
    Top = 2
  end
  object FTPInter9: TNMFTP
    Host = 'inter9.gfinter.com'
    Port = 21
    ReportLevel = 0
    UserID = 'digdoc'
    Password = 'docdig'
    OnListItem = FTPInter9ListItem
    Vendor = 2411
    ParseList = False
    ProxyPort = 0
    Passive = False
    FirewallType = FTUser
    FWAuthenticate = False
    Left = 514
    Top = 6
  end
end
