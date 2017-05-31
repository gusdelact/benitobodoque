object WCBCOpn: TWCBCOpn
  Left = 1460
  Top = 102
  Width = 661
  Height = 519
  Caption = 'Consultas Repositorios Buró'
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
  object RGRepositorios: TRadioGroup
    Left = 4
    Top = 4
    Width = 646
    Height = 130
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Repositorios '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Accionistas Carga Original Binter'
      'Carga BC_LAYOUT Original Binter'
      'BC_LAYOUT de Paso Interna'
      'Carga Excepciones Binter'
      'Créditos con Cve Obs UP'
      'Castigos en Arch Excel BCExc NO Marcados en ICRE/INTER'
      'Copia manual de la información de BC_LAYOUT (BAK)'
      'Castigos en ICRE/INTER NO Incluidos en Arch Excel BCExc'
      'Carga Venta de Cartera BINTER (Total histórico)'
      'Carga Venta de Cartera BINTER (Carga más reciente)')
    TabOrder = 0
  end
  object bConsultaRepositorios: TButton
    Left = 4
    Top = 149
    Width = 646
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Consulta Datos'
    TabOrder = 1
    OnClick = bConsultaRepositoriosClick
  end
  object SGCCBCO: TSGCtrl
    Left = 3
    Top = 172
    Width = 646
    Height = 289
    ShowTab = True
    TabOrder = 2
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
  end
  object PnDatos: TPanel
    Left = 4
    Top = 461
    Width = 646
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
      Left = 392
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
      Left = 392
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
      Left = 456
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
      Left = 456
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
    Left = 386
    Top = 106
  end
end
