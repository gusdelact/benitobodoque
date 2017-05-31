object WSfeReceptor: TWSfeReceptor
  Left = 229
  Top = 153
  Width = 770
  Height = 473
  Caption = 'Consulta de Facturas Electrónicas'
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
  object lbSERIE_RECIBO: TLabel
    Left = 592
    Top = 16
    Width = 61
    Height = 13
    Caption = 'Serie Recibo'
  end
  object lbID_CLIENTE: TLabel
    Left = 400
    Top = 16
    Width = 72
    Height = 13
    Caption = 'Número Cliente'
    Visible = False
  end
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 119
    Height = 13
    Caption = 'Situación del Documento'
  end
  object Label2: TLabel
    Left = 168
    Top = 16
    Width = 103
    Height = 13
    Caption = 'Situación del Proceso'
  end
  object edSERIE_RECIBO: TEdit
    Tag = 50
    Left = 592
    Top = 32
    Width = 160
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object PnDatos: TPanel
    Left = 0
    Top = 418
    Width = 762
    Height = 21
    Align = alBottom
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
  object bbConceptos: TButton
    Left = 141
    Top = 392
    Width = 108
    Height = 25
    Caption = 'Conceptos'
    TabOrder = 2
    OnClick = bbConceptosClick
  end
  object bbComprobante: TButton
    Left = 8
    Top = 392
    Width = 108
    Height = 25
    Caption = 'Comprobante'
    TabOrder = 3
    OnClick = bbComprobanteClick
  end
  object bbPersonas: TButton
    Left = 275
    Top = 392
    Width = 108
    Height = 25
    Caption = 'Persona'
    TabOrder = 4
    OnClick = bbPersonasClick
  end
  object bbCancelar: TButton
    Left = 408
    Top = 392
    Width = 121
    Height = 25
    Caption = 'Enviar Cancelación'
    TabOrder = 5
    OnClick = bbCancelarClick
  end
  object bbActualizar: TButton
    Left = 544
    Top = 392
    Width = 211
    Height = 25
    Caption = 'Actualizar y enviar nueva Factura'
    TabOrder = 6
    OnClick = bbActualizarClick
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 64
    Width = 761
    Height = 65
    Caption = 'Operación'
    TabOrder = 7
    object lbID_CESION: TLabel
      Left = 8
      Top = 18
      Width = 87
      Height = 13
      Caption = 'Número de Cesión'
    end
    object lbID_DOCUMENTO: TLabel
      Left = 312
      Top = 18
      Width = 110
      Height = 13
      Caption = 'Número de Documento'
    end
    object lbID_PROVEEDOR: TLabel
      Left = 8
      Top = 42
      Width = 82
      Height = 13
      Caption = 'Número Promotor'
    end
    object lbNOMBRE_PROVEEDOR: TLabel
      Left = 208
      Top = 42
      Width = 82
      Height = 13
      Caption = 'Nombre Promotor'
    end
    object edID_CESION: TEdit
      Tag = 50
      Left = 104
      Top = 14
      Width = 200
      Height = 21
      TabOrder = 0
    end
    object edID_DOCUMENTO: TEdit
      Tag = 50
      Left = 432
      Top = 14
      Width = 320
      Height = 21
      TabOrder = 1
    end
    object edID_PROMOTOR: TEdit
      Tag = 18
      Left = 104
      Top = 38
      Width = 89
      Height = 21
      TabOrder = 2
    end
    object edNOMBRE_PROMOTOR: TEdit
      Tag = 18
      Left = 304
      Top = 38
      Width = 448
      Height = 21
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 136
    Width = 761
    Height = 65
    Caption = 'Cliente'
    TabOrder = 8
    object lbID_PERSONA: TLabel
      Left = 8
      Top = 18
      Width = 79
      Height = 13
      Caption = 'Número Persona'
    end
    object lbRFC_CONTRATANTE: TLabel
      Left = 528
      Top = 18
      Width = 79
      Height = 13
      Caption = 'RFC Contratante'
    end
    object lbE_MAIL: TLabel
      Left = 8
      Top = 40
      Width = 29
      Height = 13
      Caption = 'E Mail'
    end
    object edID_PERSONA: TEdit
      Tag = 18
      Left = 104
      Top = 14
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object edNOMBRE_CLIENTE: TEdit
      Tag = 18
      Left = 200
      Top = 14
      Width = 321
      Height = 21
      TabOrder = 1
    end
    object edRFC_CONTRATANTE: TEdit
      Tag = 18
      Left = 632
      Top = 14
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edE_MAIL: TEdit
      Tag = 18
      Left = 104
      Top = 36
      Width = 417
      Height = 21
      TabOrder = 3
    end
  end
  object edID_CLIENTE: TEdit
    Tag = 18
    Left = 400
    Top = 32
    Width = 89
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 9
    Visible = False
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 208
    Width = 761
    Height = 177
    Caption = 'Domicilio'
    TabOrder = 10
    object lbCALLE_NUMERO: TLabel
      Left = 8
      Top = 18
      Width = 63
      Height = 13
      Caption = 'Calle Número'
    end
    object lbNUM_EXTERIOR: TLabel
      Left = 8
      Top = 40
      Width = 75
      Height = 13
      Caption = 'Número Exterior'
    end
    object lbNUM_INTERIOR: TLabel
      Left = 208
      Top = 40
      Width = 72
      Height = 13
      Caption = 'Número Interior'
    end
    object lbCOLONIA: TLabel
      Left = 384
      Top = 40
      Width = 35
      Height = 13
      Caption = 'Colonia'
    end
    object lbNOM_LOCALIDAD: TLabel
      Left = 8
      Top = 62
      Width = 86
      Height = 13
      Caption = 'Nombre Localidad'
    end
    object lbNOM_MUNICIPIO: TLabel
      Left = 8
      Top = 83
      Width = 85
      Height = 13
      Caption = 'Nombre Municipio'
    end
    object lbNOM_ESTADO: TLabel
      Left = 8
      Top = 104
      Width = 73
      Height = 13
      Caption = 'Nombre Estado'
    end
    object lbNOM_PAIS: TLabel
      Left = 8
      Top = 126
      Width = 62
      Height = 13
      Caption = 'Nombre País'
    end
    object lbCODIGO_POSTAL: TLabel
      Left = 8
      Top = 148
      Width = 65
      Height = 13
      Caption = 'Código Postal'
    end
    object edCALLE_NUMERO: TEdit
      Tag = 18
      Left = 104
      Top = 14
      Width = 649
      Height = 21
      TabOrder = 0
    end
    object edNUM_EXTERIOR: TEdit
      Tag = 18
      Left = 104
      Top = 36
      Width = 89
      Height = 21
      TabOrder = 1
    end
    object edNUM_INTERIOR: TEdit
      Tag = 18
      Left = 296
      Top = 36
      Width = 81
      Height = 21
      TabOrder = 2
    end
    object edCOLONIA: TEdit
      Tag = 18
      Left = 432
      Top = 36
      Width = 320
      Height = 21
      TabOrder = 3
    end
    object edNOM_LOCALIDAD: TEdit
      Tag = 18
      Left = 104
      Top = 58
      Width = 649
      Height = 21
      TabOrder = 4
    end
    object edNOM_MUNICIPIO: TEdit
      Tag = 18
      Left = 104
      Top = 79
      Width = 649
      Height = 21
      TabOrder = 5
    end
    object edNOM_ESTADO: TEdit
      Tag = 18
      Left = 104
      Top = 100
      Width = 649
      Height = 21
      TabOrder = 6
    end
    object edNOM_PAIS: TEdit
      Tag = 18
      Left = 104
      Top = 122
      Width = 649
      Height = 21
      TabOrder = 7
    end
    object edCODIGO_POSTAL: TEdit
      Tag = 18
      Left = 104
      Top = 144
      Width = 89
      Height = 21
      TabOrder = 8
    end
  end
  object edSIT_DOCUMENTO: TEdit
    Tag = 18
    Left = 8
    Top = 32
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 11
  end
  object edSIT_PROCESO: TEdit
    Tag = 18
    Left = 168
    Top = 32
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 12
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
    Left = 698
    Top = 18
  end
end
