object WCrGpFinanMax: TWCrGpFinanMax
  Left = 296
  Top = 229
  Width = 813
  Height = 365
  Caption = 'Estructura de Límites Autorizados E y M'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 162
      Top = 13
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object Label2: TLabel
      Left = 320
      Top = 13
      Width = 66
      Height = 13
      Caption = 'Tipo de Limite'
    end
    object Label3: TLabel
      Left = 16
      Top = 12
      Width = 30
      Height = 13
      Alignment = taCenter
      Caption = 'Fecha'
    end
    object btBusca: TBitBtn
      Left = 666
      Top = 5
      Width = 116
      Height = 28
      Caption = 'Inicia Busqueda'
      TabOrder = 0
      OnClick = btBuscaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
    object cbxEntidad: TComboBox
      Left = 204
      Top = 9
      Width = 101
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        'Estatal'
        'Municipal'
        'Todos')
    end
    object cbxLimite: TComboBox
      Left = 392
      Top = 9
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'Fideicomiso'
        'Instrucciones Irrevocables o Mandato'
        'Sin Estructura'
        'Todos')
    end
    object dtFConsulta: TDateTimePicker
      Left = 51
      Top = 9
      Width = 83
      Height = 21
      CalAlignment = dtaLeft
      Date = 40988.4704658796
      Time = 40988.4704658796
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
    end
  end
  object grdLimites: TSGCtrl
    Left = 0
    Top = 41
    Width = 783
    Height = 276
    ShowTab = True
    TabOrder = 1
    PopupMenu = popLimite
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnDblClick = grdLimitesDblClick
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
    Left = 298
    Top = 90
  end
  object popLimite: TPopupMenu
    Left = 176
    Top = 97
    object ModificarDatos1: TMenuItem
      Caption = 'Datos Individuales'
      OnClick = ModificarDatos1Click
    end
  end
end
