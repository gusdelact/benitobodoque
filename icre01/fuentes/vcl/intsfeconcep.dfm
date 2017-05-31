object WSfeConcepto: TWSfeConcepto
  Left = 394
  Top = 171
  Width = 774
  Height = 295
  Caption = 'Catálogo de SFE Concepto'
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
    Left = 528
    Top = 8
    Width = 61
    Height = 13
    Caption = 'Serie Recibo'
  end
  object PnDatos: TPanel
    Left = 0
    Top = 240
    Width = 766
    Height = 21
    Align = alBottom
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
  object edSERIE_RECIBO: TEdit
    Tag = 50
    Left = 592
    Top = 4
    Width = 160
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 32
    Width = 761
    Height = 201
    Caption = 'Operación'
    TabOrder = 2
    object lbID_CESION: TLabel
      Left = 8
      Top = 18
      Width = 87
      Height = 13
      Caption = 'Número de Cesion'
    end
    object lbID_DOCUMENTO: TLabel
      Left = 312
      Top = 18
      Width = 110
      Height = 13
      Caption = 'Número de Documento'
    end
    object lbCANTIDAD: TLabel
      Left = 8
      Top = 44
      Width = 42
      Height = 13
      Caption = 'Cantidad'
    end
    object Label1: TLabel
      Left = 8
      Top = 97
      Width = 51
      Height = 13
      Caption = 'Conceptos'
    end
    object LUnidad: TLabel
      Left = 216
      Top = 44
      Width = 87
      Height = 13
      Caption = 'Unidad de Medida'
    end
    object LIMP_UNITARIO: TLabel
      Left = 304
      Top = 68
      Width = 74
      Height = 13
      Caption = 'Importe Unitario'
    end
    object LIMP_TOTAL: TLabel
      Left = 560
      Top = 68
      Width = 62
      Height = 13
      Caption = 'Importe Total'
    end
    object Lclave: TLabel
      Left = 8
      Top = 68
      Width = 27
      Height = 13
      Caption = 'Clave'
    end
    object LDESCRIPCION: TLabel
      Left = 440
      Top = 44
      Width = 56
      Height = 13
      Caption = 'Descripción'
    end
    object edID_CESION: TEdit
      Tag = 50
      Left = 104
      Top = 14
      Width = 200
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object edID_DOCUMENTO: TEdit
      Tag = 50
      Left = 432
      Top = 14
      Width = 320
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object edCANTIDAD: TEdit
      Tag = 18
      Left = 104
      Top = 40
      Width = 97
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edTXT_LEYENDA_1: TEdit
      Tag = 18
      Left = 104
      Top = 94
      Width = 473
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object edTXT_LEYENDA_2: TEdit
      Tag = 18
      Left = 104
      Top = 118
      Width = 473
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
    end
    object edTXT_LEYENDA_3: TEdit
      Tag = 18
      Left = 104
      Top = 142
      Width = 473
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
    end
    object edTXT_LEYENDA_4: TEdit
      Tag = 18
      Left = 104
      Top = 166
      Width = 473
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
    end
    object edTXT_DATO_1: TEdit
      Tag = 18
      Left = 584
      Top = 94
      Width = 169
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 7
    end
    object edTXT_DATO_2: TEdit
      Tag = 18
      Left = 584
      Top = 118
      Width = 168
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 8
    end
    object edTXT_DATO_3: TEdit
      Tag = 18
      Left = 584
      Top = 142
      Width = 168
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 9
    end
    object edTXT_DATO_4: TEdit
      Tag = 18
      Left = 584
      Top = 166
      Width = 168
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 10
    end
    object IEUnidad: TInterEdit
      Tag = 18
      Left = 312
      Top = 40
      Width = 113
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trContrato
      MaxLength = 12
      TabOrder = 11
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object IEIMP_UNITARIO: TInterEdit
      Tag = 18
      Left = 384
      Top = 64
      Width = 121
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      TabOrder = 12
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object IEIMP_TOTAL: TInterEdit
      Tag = 18
      Left = 632
      Top = 64
      Width = 121
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trDinero
      DisplayMask = '###,###,###,###,##0.00'
      MaxLength = 12
      TabOrder = 13
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object IEClave: TInterEdit
      Tag = 18
      Left = 104
      Top = 64
      Width = 185
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trContrato
      MaxLength = 12
      TabOrder = 14
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object IEDESCRIPCION: TInterEdit
      Tag = 18
      Left = 504
      Top = 40
      Width = 249
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trContrato
      MaxLength = 12
      TabOrder = 15
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
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
    Left = 706
    Top = 194
  end
end
