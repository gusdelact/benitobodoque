object WCrgpopbca: TWCrgpopbca
  Left = 356
  Top = 176
  Width = 554
  Height = 328
  Caption = 'Catálogo de Grupo Producto Banca'
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
  object Panel1: TPanel
    Left = 1
    Top = 1
    Width = 545
    Height = 268
    TabOrder = 0
    object lbCVE_GRUPO_ECO: TLabel
      Left = 12
      Top = 29
      Width = 97
      Height = 13
      Caption = 'Cve. Gpo. Producto:'
    end
    object Label1: TLabel
      Left = 13
      Top = 65
      Width = 59
      Height = 13
      Caption = 'Desc. Corta:'
    end
    object Label2: TLabel
      Left = 12
      Top = 101
      Width = 61
      Height = 13
      Caption = 'Desc. Larga:'
    end
    object GroupBox1: TGroupBox
      Left = 10
      Top = 178
      Width = 520
      Height = 76
      TabOrder = 0
      object lbF_ALTA: TLabel
        Left = 12
        Top = 22
        Width = 33
        Height = 13
        Caption = 'F. Alta:'
      end
      object lbCVE_USU_ALTA: TLabel
        Left = 289
        Top = 22
        Width = 46
        Height = 13
        Caption = 'Usu. Alta:'
      end
      object lbF_MODIFICA: TLabel
        Left = 12
        Top = 51
        Width = 55
        Height = 13
        Caption = 'F. Modifica:'
      end
      object lbCVE_USU_MODIFICA: TLabel
        Left = 289
        Top = 51
        Width = 68
        Height = 13
        Caption = 'Usu. Modifica:'
      end
      object edF_ALTA: TInterEdit
        Left = 94
        Top = 18
        Width = 90
        Height = 21
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 6
        Color = clBtnFace
        TabOrder = 0
        CharCase = ecUpperCase
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edCVE_USU_MODIFICA: TInterEdit
        Left = 384
        Top = 47
        Width = 90
        Height = 21
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 6
        Color = clBtnFace
        TabOrder = 3
        CharCase = ecUpperCase
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edF_MODIFICA: TInterEdit
        Left = 94
        Top = 47
        Width = 90
        Height = 21
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 6
        Color = clBtnFace
        TabOrder = 2
        CharCase = ecUpperCase
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
      object edCVE_USU_ALTA: TInterEdit
        Left = 384
        Top = 18
        Width = 90
        Height = 21
        HelpContext = 1100
        Prefijo = '1'
        Contrato = -1
        TipoReader = trTexto
        MaxLength = 6
        Color = clBtnFace
        TabOrder = 1
        CharCase = ecUpperCase
        UseReType = False
        UseSep = True
        UseDisplay = False
        PositiveOnly = False
        ColorPos = clBtnText
        ColorNeg = clRed
      end
    end
    object edCveGpoProd: TInterEdit
      Tag = 18
      Left = 114
      Top = 25
      Width = 103
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 9
      TabOrder = 1
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object edDescCorta: TInterEdit
      Tag = 18
      Left = 114
      Top = 61
      Width = 415
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 29
      TabOrder = 2
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object rgSITUACION: TRadioGroup
      Tag = 18
      Left = 10
      Top = 132
      Width = 520
      Height = 40
      HelpContext = 1400
      Caption = 'Situación'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Activo'
        'Inactivo')
      TabOrder = 4
    end
    object edDescLarga: TInterEdit
      Tag = 18
      Left = 114
      Top = 97
      Width = 415
      Height = 21
      HelpContext = 1100
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      MaxLength = 79
      TabOrder = 3
      CharCase = ecUpperCase
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = False
      ColorPos = clBtnText
      ColorNeg = clRed
    end
  end
  object PnDatos: TPanel
    Left = 1
    Top = 278
    Width = 545
    Height = 21
    TabOrder = 1
    object lbEmpresa: TLabel
      Left = 11
      Top = 4
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
      Top = 11
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
      Top = 4
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
      Top = 11
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
      Left = 56
      Top = 11
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
      Left = 298
      Top = 11
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
      Left = 298
      Top = 4
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
      Left = 56
      Top = 4
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
    OnDespuesNuevo = InterForma1DespuesNuevo
    OnDespuesModificar = InterForma1DespuesModificar
    OnAntesAceptar = InterForma1AntesAceptar
    OnBuscar = InterForma1Buscar
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
    Top = 10
  end
end
