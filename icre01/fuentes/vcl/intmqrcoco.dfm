object WMqrcoco: TWMqrcoco
  Left = 547
  Top = 136
  Width = 871
  Height = 672
  Caption = 'Reporte Comporativo de Saldos COINCRE- CONTABILIDAD'
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 850
    Height = 579
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Reporte'
      object Bevel1: TBevel
        Left = 6
        Top = 136
        Width = 636
        Height = 62
      end
      object sbtnExcel: TSpeedButton
        Left = 612
        Top = 143
        Width = 25
        Height = 24
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
          3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
          33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
          333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        NumGlyphs = 2
        OnClick = sbtnExcelClick
      end
      object rgTipoReporte: TRadioGroup
        Left = 4
        Top = 8
        Width = 338
        Height = 70
        Caption = 'Tipo Reporte'
        ItemIndex = 1
        Items.Strings = (
          'Mensual'
          'Díario')
        TabOrder = 0
        OnClick = rgTipoReporteClick
      end
      object cbMes: TComboBox
        Left = 101
        Top = 26
        Width = 106
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = 'Enero'
        OnChange = cbMesChange
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
        Left = 234
        Top = 26
        Width = 85
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        Text = '2000'
        OnChange = cbAnioChange
        Items.Strings = (
          '2005'
          '2006'
          '2007'
          '2008'
          '2009'
          '2010'
          '2011'
          '2012'
          '2013'
          '2014'
          '2015'
          '2016'
          '2017'
          '2018'
          '2019'
          '2020')
      end
      object rgTipoCar: TRadioGroup
        Left = 5
        Top = 81
        Width = 338
        Height = 48
        Caption = 'Tipo de Saldo'
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          'Capitales'
          'Intereses'
          'Ambos')
        TabOrder = 3
        OnClick = rgTipoCarClick
      end
      object cbGenArchExcel: TCheckBox
        Left = 13
        Top = 147
        Width = 125
        Height = 17
        Caption = 'Genera Archivo Excel'
        TabOrder = 4
        OnClick = cbGenArchExcelClick
      end
      object cbArchivoQry: TCheckBox
        Left = 173
        Top = 172
        Width = 97
        Height = 17
        Caption = 'Archivo Qry'
        TabOrder = 5
        Visible = False
        OnClick = cbArchivoQryClick
      end
      object btnArchivoQry: TBitBtn
        Left = 612
        Top = 171
        Width = 25
        Height = 22
        Caption = '...'
        Enabled = False
        TabOrder = 6
        Visible = False
        OnClick = btnArchivoQryClick
      end
      object edArchivoQry: TEdit
        Left = 253
        Top = 171
        Width = 358
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 7
        Text = 'C:\Qry.txt'
        Visible = False
      end
      object edRuta: TEdit
        Left = 142
        Top = 145
        Width = 469
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 8
        Text = 'C:\'
      end
      object grbxCapital: TGroupBox
        Left = 349
        Top = 8
        Width = 91
        Height = 122
        Caption = 'Mostrar Capital'
        TabOrder = 9
        object chkbxK_VIG: TCheckBox
          Left = 9
          Top = 23
          Width = 77
          Height = 17
          Caption = 'Vigente'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkbxK_VIGClick
        end
        object chkbxK_VEN: TCheckBox
          Left = 8
          Top = 93
          Width = 77
          Height = 17
          Caption = 'Vencido'
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = chkbxK_VIGClick
        end
        object chkbxK_IMP: TCheckBox
          Left = 8
          Top = 58
          Width = 77
          Height = 17
          Caption = 'Impagado'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = chkbxK_VIGClick
        end
      end
      object grbxInteres: TGroupBox
        Left = 446
        Top = 8
        Width = 195
        Height = 122
        Caption = 'Mostrar Interés'
        TabOrder = 10
        object Label2: TLabel
          Left = 151
          Top = 108
          Width = 36
          Height = 10
          Caption = 'V20151106'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object chkbxI_VIG: TCheckBox
          Left = 9
          Top = 23
          Width = 176
          Height = 16
          Caption = 'Vigente / Cobrado por Antcipado'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkbxK_VIGClick
        end
        object chkbxI_VEN: TCheckBox
          Left = 7
          Top = 93
          Width = 97
          Height = 17
          Caption = 'Vencido'
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = chkbxK_VIGClick
        end
        object chkbxI_IMP: TCheckBox
          Left = 7
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Impagado'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = chkbxK_VIGClick
        end
      end
      object cbGenerarArchCont: TCheckBox
        Left = 13
        Top = 172
        Width = 151
        Height = 17
        Caption = 'Generar Archivo Contable'
        Enabled = False
        TabOrder = 11
      end
      object cbFechaEspecifica: TCheckBox
        Left = 101
        Top = 54
        Width = 105
        Height = 17
        Caption = 'Fecha Especifica'
        Checked = True
        State = cbChecked
        TabOrder = 12
        OnClick = cbFechaEspecificaClick
      end
      object dtpFechaEspecifica: TDateTimePicker
        Left = 233
        Top = 50
        Width = 87
        Height = 21
        CalAlignment = dtaLeft
        Date = 39519.4772914815
        Time = 39519.4772914815
        Color = clBtnFace
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 13
        OnChange = dtpFechaEspecificaChange
      end
      object Panel1: TPanel
        Left = 164
        Top = 7
        Width = 31
        Height = 14
        BevelOuter = bvNone
        TabOrder = 14
        object Label1: TLabel
          Left = 4
          Top = 1
          Width = 20
          Height = 13
          Caption = 'Mes'
        end
      end
      object Panel2: TPanel
        Left = 275
        Top = 6
        Width = 26
        Height = 14
        BevelOuter = bvNone
        TabOrder = 15
        object Label4: TLabel
          Left = 2
          Top = 1
          Width = 19
          Height = 13
          Caption = 'Año'
        end
      end
      object BContaIcre2: TCheckBox
        Left = 8
        Top = 200
        Width = 161
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Conta Icre 2 (Cuentas 2012)'
        TabOrder = 16
        OnClick = BContaIcre2Click
      end
      object cbContaIcreN: TCheckBox
        Left = 200
        Top = 200
        Width = 209
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Conta Icre 2 (Nuevo plan Ctas (DE))'
        Checked = True
        State = cbChecked
        TabOrder = 17
        OnClick = cbContaIcreNClick
      end
      object cbContaIcreNRE: TCheckBox
        Left = 416
        Top = 200
        Width = 209
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Conta Icre 2 (Nuevo plan Ctas (RE))'
        TabOrder = 18
        OnClick = cbContaIcreNREClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      object Label3: TLabel
        Left = 16
        Top = 5
        Width = 30
        Height = 13
        Caption = 'Fecha'
      end
      object SGClBusMovNoAut: TSGCtrl
        Left = 0
        Top = 23
        Width = 841
        Height = 288
        Hint = 'Doble click para ver detalle...'
        ShowTab = True
        ShowHint = True
        TabOrder = 0
        TabWidth = 0
        ShowBtnPriorNext = True
        ShowBtnFirst = True
        ShowBtnLast = True
        OnDblClick = SGClBusMovNoAutDblClick
      end
      object SGClBusMovNoAutDet: TSGCtrl
        Left = 0
        Top = 313
        Width = 337
        Height = 239
        Hint = 'Doble click para ver detalle...'
        ShowTab = True
        ShowHint = True
        TabOrder = 1
        TabWidth = 0
        ShowBtnPriorNext = True
        ShowBtnFirst = True
        ShowBtnLast = True
        OnDblClick = SGClBusMovNoAutDetDblClick
      end
      object BitBtn1: TBitBtn
        Left = 704
        Top = 286
        Width = 136
        Height = 20
        Caption = 'G.E.N.E.R.A.R......'
        TabOrder = 2
        OnClick = BitBtn1Click
      end
      object dtpFechaConciliador: TDateTimePicker
        Left = 61
        Top = 2
        Width = 87
        Height = 21
        CalAlignment = dtaLeft
        Date = 39519.4772914815
        Time = 39519.4772914815
        Color = clBtnFace
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 3
        OnChange = dtpFechaConciliadorChange
      end
      object SGClBusMovNoAutDet2: TSGCtrl
        Left = 344
        Top = 352
        Width = 497
        Height = 199
        ShowTab = True
        TabOrder = 4
        TabWidth = 0
        ShowBtnPriorNext = True
        ShowBtnFirst = True
        ShowBtnLast = True
      end
      object RGDet2: TRadioGroup
        Left = 345
        Top = 311
        Width = 497
        Height = 43
        Caption = 'Detalle:'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Transaccione'
          'ContaIcre2'
          'Saldos Cuenta')
        TabOrder = 5
        OnClick = RGDet2Click
      end
    end
  end
  object PnDatos: TPanel
    Left = 3
    Top = 582
    Width = 848
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
      Left = 328
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
      Left = 328
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
      Left = 392
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
      Left = 392
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
    OnImprimir = InterForma1Imprimir
    OnPreview = InterForma1Preview
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
    Left = 671
    Top = 16
  end
  object SaveDialog1: TSaveDialog
    Left = 473
    Top = 155
  end
  object Query1: TQuery
    Left = 620
    Top = 192
  end
end
