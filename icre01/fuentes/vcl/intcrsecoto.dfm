object WCrSeCoTo: TWCrSeCoTo
  Left = 205
  Top = 105
  Width = 806
  Height = 507
  Caption = 'Seguimiento de Cobranza (Tesorería)'
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
  object Label17: TLabel
    Left = 5
    Top = 44
    Width = 59
    Height = 14
    Caption = 'Fecha Inicial'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 353
    Top = 44
    Width = 55
    Height = 14
    Caption = 'Fecha Final'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 5
    Top = 390
    Width = 91
    Height = 13
    Caption = 'Referencia Externa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object btCANCELA: TBitBtn
    Left = 575
    Top = 386
    Width = 100
    Height = 23
    Caption = 'Reversa'
    TabOrder = 0
    OnClick = btCANCELAClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btIDENTIFICA: TBitBtn
    Left = 680
    Top = 386
    Width = 100
    Height = 23
    Caption = 'Identifica'
    TabOrder = 1
    OnClick = btIDENTIFICAClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF5555555555555A055555
      55555555588FF55555555555AAA05555555555558888F55555555555AAA05555
      555555558888FF555555555AAAAA05555555555888888F55555555AAAAAA0555
      5555558888888FF5555558AA05AAA05555555888858888F555558A05555AA055
      55558885555888FF55555555555AAA05555555555558888F555555555555AA05
      555555555555888FF555555555555AA05555555555555888FF5555555555558A
      05555555555555888FF5555555555558A05555555555555888FF555555555555
      5AA0555555555555588855555555555555555555555555555555}
    NumGlyphs = 2
  end
  object Merrores: TMemo
    Left = 0
    Top = 410
    Width = 782
    Height = 36
    TabStop = False
    Color = clInfoBk
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object PnDatos: TPanel
    Left = 0
    Top = 446
    Width = 780
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
      Left = 472
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
      Left = 472
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
      Left = 536
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
      Left = 536
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
  object rgSITUACION: TRadioGroup
    Left = 5
    Top = 5
    Width = 777
    Height = 31
    Caption = 'Situación'
    Columns = 4
    Items.Strings = (
      'No Identificados'
      'Identificados'
      'Cancelados'
      'Todos')
    TabOrder = 4
    OnClick = rgSITUACIONClick
  end
  object btBUSCA: TBitBtn
    Left = 624
    Top = 40
    Width = 157
    Height = 23
    Caption = 'Inicia Busqueda'
    TabOrder = 5
    OnClick = btBUSCAClick
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
  object edF_FINAL: TEdit
    Left = 426
    Top = 41
    Width = 73
    Height = 21
    Color = clMenu
    TabOrder = 6
    Text = '22/07/2003'
    OnExit = edF_FINALExit
  end
  object dtF_FINAL: TInterDateTimePicker
    Left = 501
    Top = 41
    Width = 20
    Height = 21
    CalAlignment = dtaLeft
    Date = 37554
    Time = 37554
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 7
    OnExit = edF_FINALExit
    Edit = edF_FINAL
    Formato = dfDate
  end
  object dtF_INICIAL: TInterDateTimePicker
    Left = 163
    Top = 41
    Width = 20
    Height = 21
    CalAlignment = dtaLeft
    Date = 37554.5731407176
    Time = 37554.5731407176
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 8
    OnExit = edF_INICIALExit
    Edit = edF_INICIAL
    Formato = dfDate
  end
  object edF_INICIAL: TEdit
    Left = 88
    Top = 41
    Width = 73
    Height = 21
    Color = clMenu
    TabOrder = 9
    Text = '22/07/2003'
    OnExit = edF_INICIALExit
  end
  object sgcDATOS: TSGCtrl
    Left = 0
    Top = 84
    Width = 783
    Height = 302
    OnCalcRow = sgcDATOSCalcRow
    ShowTab = True
    TabOrder = 10
    PopupMenu = pmReactivar
    TabWidth = 0
    ShowBtnPriorNext = True
    ShowBtnFirst = True
    ShowBtnLast = True
    OnDblClick = sgcDATOSDblClick
  end
  object edREFER_EXTERNA: TEdit
    Tag = 17
    Left = 104
    Top = 386
    Width = 361
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    TabOrder = 11
  end
  object Edit1: TEdit
    Left = 1
    Top = 66
    Width = 20
    Height = 16
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 12
    Text = 'SEL'
  end
  object Edit3: TEdit
    Left = 192
    Top = 66
    Width = 85
    Height = 16
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 13
    Text = '       IMPORTE'
  end
  object Edit4: TEdit
    Left = 278
    Top = 66
    Width = 61
    Height = 16
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 14
    Text = 'CHEQUERA'
  end
  object Edit5: TEdit
    Left = 424
    Top = 66
    Width = 150
    Height = 16
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 15
    Text = '                   CLIENTE'
  end
  object Edit6: TEdit
    Left = 575
    Top = 66
    Width = 167
    Height = 16
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 16
    Text = '                 PROMOTOR'
  end
  object Edit7: TEdit
    Left = 743
    Top = 66
    Width = 27
    Height = 16
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 17
    Text = '  SIT'
  end
  object btREPORTE: TBitBtn
    Left = 470
    Top = 386
    Width = 100
    Height = 23
    Caption = 'Reporte'
    TabOrder = 18
    OnClick = btREPORTEClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object Edit8: TEdit
    Left = 340
    Top = 66
    Width = 83
    Height = 16
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 19
    Text = '       SALDO'
  end
  object edTIT_FECHA: TEdit
    Left = 22
    Top = 66
    Width = 65
    Height = 16
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 20
    Text = '    FECHA'
  end
  object edTIT_MODO_PAGO: TEdit
    Left = 88
    Top = 66
    Width = 103
    Height = 16
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 21
    Text = '   MODO DE PAGO     '
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
    Left = 386
    Top = 10
  end
  object pmReactivar: TPopupMenu
    AutoHotkeys = maManual
    Left = 386
    Top = 227
    object Reactivar1: TMenuItem
      Caption = '&Reactivar Transacción'
      OnClick = Reactivar1Click
    end
  end
end
