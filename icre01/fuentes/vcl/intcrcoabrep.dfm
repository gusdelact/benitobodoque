object WCrCoABRep: TWCrCoABRep
  Left = 76
  Top = 99
  Width = 1136
  Height = 592
  Caption = 'Reportes para cobranza ABCD'#39's'
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
    Left = 10
    Top = 529
    Width = 1111
    Height = 21
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
      Left = 712
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
      Left = 712
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
      Left = 776
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
      Left = 776
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
  object Panel1: TPanel
    Left = 10
    Top = 6
    Width = 1111
    Height = 520
    TabOrder = 1
    object Label2: TLabel
      Left = 11
      Top = 19
      Width = 100
      Height = 13
      Caption = 'Fecha de Nómina'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbFileNameExcel: TLabel
      Left = 9
      Top = 419
      Width = 48
      Height = 13
      Caption = 'Ubicación'
    end
    object Label1: TLabel
      Left = 8
      Top = 44
      Width = 76
      Height = 18
      Caption = 'Empresas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 245
      Top = 45
      Width = 157
      Height = 18
      Caption = 'Créditos ABCD'#39's de :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object lbEmpresa1: TLabel
      Left = 413
      Top = 45
      Width = 8
      Height = 18
      Caption = '||'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 1170
      Top = 1
      Width = 40
      Height = 10
      Caption = 'v:2011.04.05'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 820
      Top = 509
      Width = 40
      Height = 10
      Caption = 'V: 20131125'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 776
      Top = 19
      Width = 115
      Height = 13
      Caption = 'Fecha de Cobro Anterior'
    end
    object Label7: TLabel
      Left = 488
      Top = 19
      Width = 126
      Height = 13
      Caption = 'Fecha de Cobro Siguiente:'
    end
    object dtpF_CIERRE: TDateTimePicker
      Left = 121
      Top = 7
      Width = 128
      Height = 28
      CalAlignment = dtaLeft
      Date = 39973.4085888657
      Time = 39973.4085888657
      DateFormat = dfShort
      DateMode = dmComboBox
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Kind = dtkDate
      ParseInput = False
      ParentFont = False
      TabOrder = 0
      OnCloseUp = dtpF_CIERRECloseUp
      OnChange = dtpF_CIERREChange
    end
    object btBusca: TButton
      Left = 259
      Top = 8
      Width = 141
      Height = 21
      Caption = '&Seleccionar Empresas'
      TabOrder = 1
      OnClick = btMuestraInformacionClick
    end
    object edReporteCobranza: TEdit
      Left = 72
      Top = 416
      Width = 761
      Height = 21
      TabOrder = 2
      Text = 'J:\Depositos Nomina\Lobo_Interfaces_Bancarias\'
    end
    object SGDatos: TSGCtrl
      Left = 480
      Top = 68
      Width = 625
      Height = 335
      ShowTab = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      BevelOuter = bvNone
      TabOrder = 3
      TabWidth = 0
      ShowBtnPriorNext = True
      ShowBtnFirst = True
      ShowBtnLast = True
    end
    object btnDReporteCobranza: TButton
      Left = 847
      Top = 417
      Width = 23
      Height = 22
      Caption = '...'
      TabOrder = 4
      OnClick = btnDReporteCobranzaClick
    end
    object btnGenArchivo: TButton
      Left = 899
      Top = 418
      Width = 130
      Height = 30
      Caption = 'Generar &Archivo CSV'
      TabOrder = 5
      OnClick = btnGenArchivoClick
    end
    object rgTiposReporte: TRadioGroup
      Left = 12
      Top = 443
      Width = 477
      Height = 64
      Caption = 'Formato de Reporte a generar'
      ItemIndex = 0
      Items.Strings = (
        'Tipo 1 "Carga Nómina" (No empleado, Total).'
        
          'Tipo 2 "Reporte Excel CSV" (Capital, Intéres, IVA de Int., Comis' +
          'iones, IVA de Comis. y Total).')
      TabOrder = 6
    end
    object TreeView1: TTreeView
      Left = 8
      Top = 68
      Width = 457
      Height = 334
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Images = ImageList1
      Indent = 19
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      OnClick = TreeView1Click
    end
    object btnGebReporte: TButton
      Left = 898
      Top = 465
      Width = 131
      Height = 27
      Caption = 'Reporte'
      TabOrder = 8
      OnClick = btnGebReporteClick
    end
    object rgOrdenar: TRadioGroup
      Left = 496
      Top = 444
      Width = 377
      Height = 64
      Caption = 'Ordenar por:'
      ItemIndex = 0
      Items.Strings = (
        'Nombre'
        'Número de Empleado')
      TabOrder = 9
    end
    object F_Cobro_Ant: TEdit
      Left = 896
      Top = 8
      Width = 121
      Height = 28
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
      Text = 'F_Cobro_Ant'
    end
    object F_Cobro_Sig: TEdit
      Left = 616
      Top = 8
      Width = 121
      Height = 28
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
      Text = 'F_Cobro_Sig'
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
    Version = 20
    HideButtons = False
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 694
    Top = 521
  end
  object sdReporteCobranza: TSaveDialog
    DefaultExt = 'CSV'
    FileName = 'Nomina.csv'
    Filter = 'CSV (delimitado por comas) *.csv|*.csv'
    InitialDir = 'J:\Depositos Nomina'
    Left = 782
    Top = 420
  end
  object ImageList1: TImageList
    Left = 112
    Top = 48
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6008484
      8400C6C6C6000000000000000000000000000000000000FFFF008484840000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      8400000084008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C6008484840000000000000000000000000000FFFF0000FF
      FF0000000000C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6008484
      8400C6C6C6000000000000000000000000000000000000FFFF008484840000FF
      FF00000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C6000000000000008400000084000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      000000000000C6C6C600C6C6C60084848400000000000000000000FFFF0000FF
      FF00C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6008484
      8400C6C6C60000FFFF0000FFFF0000FFFF000000000000FFFF008484840000FF
      FF000000000000FFFF0000FFFF0000000000000000000000000000008400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000008400000084000000
      840000008400848484000000000000000000000000000000000084840000C6C6
      C600C6C6C600000000000000000000000000848484000000000000FFFF0000FF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C6000000000000FFFF0000FFFF000000000000FFFF008484840000FF
      FF000000000000FFFF0000FFFF00000000000000000000008400C6C6C600C6C6
      C600C6C6C60000FFFF0000FFFF0000000000C6C6C600C6C6C60084848400C6C6
      C600C6C6C6000000840000848400000000000000000084840000C6C6C600C6C6
      C600C6C6C60084840000C6C6C600848400000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C6000000000000FFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000FFFF0000FFFF00C6C6C600C6C6C600C6C6C60000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000848400008484
      0000C6C6C600C6C6C600C6C6C600C6C6C6008484000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C6008484840000FFFF0000FF
      FF0000FFFF0084848400C6C6C6000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000FFFF000000000000008400C6C6C600C6C6C600C6C6
      C60000FFFF0000FFFF0000000000C6C6C600C6C6C600C6C6C60000FFFF0000FF
      FF000000000000FFFF0000FFFF000000000000000000FFFF0000000000008484
      000084840000C6C6C60000FF000000FF00008484000084840000000000008484
      840000000000C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484008484840000FFFF0000FF
      FF0000FFFF0084848400848484000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000FFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C60000FFFF0000FFFF00C6C6C600C6C6C600C6C6C60000FFFF0000FFFF00C6C6
      C60000FFFF0000FFFF0000FFFF000000000000000000FFFF0000848400000000
      00008484000084840000848400008484000084840000C6C6C600848400000000
      000084848400C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000FFFF000000000000000000FFFFFF00C6C6C600C6C6
      C600C6C6C60084848400C6C6C600C6C6C600C6C6C60000FFFF0000FFFF000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000FFFF000000FF
      000000000000848400008484000084840000C6C6C600C6C6C600C6C6C6008484
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000FFFFFF0000FFFF0000FF
      FF0000FFFF008484840084848400C6C6C600C6C6C600C6C6C6008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000FFFF
      000000FF0000000000008484000084840000C6C6C600C6C6C600C6C6C60000FF
      0000848400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C6000000000000FFFF0000FFFF0000FFFF0000FFFF0000000000C6C6C6000000
      000000FFFF0000FFFF0000FFFF000000000000000000FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000FFFF000000FF0000000000008484000084840000C6C6C600C6C6C6008484
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF008484840000FFFF0000FFFF0000FFFF0000FFFF008484840000FFFF008484
      840000FFFF0000FFFF0000FFFF000000000000000000FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000C6C6C6000000
      000000000000FFFF000000FF0000000000008484000000FF0000848400000000
      0000FFFF00008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF000000
      000000FFFF0000FFFF0000FFFF000000000000000000FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000C6C6C600C6C6C600C6C6
      C6000000000000000000FFFF000000FF00000000000084840000000000008484
      0000FFFF00008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000C6C6C6000000
      0000000000000000000000000000FFFF000000FF00000000000084840000FFFF
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C6000000000000000000FFFF000084840000FFFF00008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600000000000000000000000000FFFF0000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00C78FEFFFF7FF0000C707E3FFE1C10000
      C000C07FC0800000C000C00380400000800080000039000000000000801F0000
      0000000080090000000000008001000000008000C003000080008000E0030000
      C0008000F0070000C000800088030000C00080008C030000C00080008E070000
      C000807FF30F0000FFC1C0FFF39F000000000000000000000000000000000000
      000000000000}
  end
  object vgQryNomina: TQuery
    DatabaseName = 'pcorp'
    SQL.Strings = (
      'SELECT'
      '   '#9'RESULT.NUM_EMPLEADO'#9','
      
        '    (PF.APELLIDO_PATERNO || '#39' '#39' || PF.APELLIDO_MATERNO || '#39' '#39' ||' +
        ' PF.NOMBRE_PERSONA) AS NOMBRE,'
      '    RESULT.IMP_CAPITAL'#9','
      '    RESULT.IMP_INTERES_PROY'#9','
      '    RESULT.IMP_IVA'#9','
      '    RESULT.IMP_COMISION'#9','
      '    RESULT.IMP_IVA_COMISION ,'
      '    RESULT.IMP_TOTAL'
      'FROM'
      '   ('
      '    -- Disposiciones  INTERCREDITOS   '
      '    SELECT E.ID_EMPRESA,'
      '           E.NUM_EMPLEADO,'
      '           E.ID_PERSONA, '
      '           SUM(CA_CRED.IMP_CAPITAL)            AS IMP_CAPITAL,'
      
        '           SUM(CI_CRED.IMP_INTERES_PROY)       AS IMP_INTERES_PR' +
        'OY,'
      '           SUM(CI_CRED.IMP_IVA)                AS IMP_IVA,'
      '           SUM(NVL(CDC_CRED.IMP_COMISION,0))   AS IMP_COMISION,'
      
        '           SUM(NVL(CDC_CRED.IMP_IVA,0))        AS IMP_IVA_COMISI' +
        'ON,'
      '           SUM(CA_CRED.IMP_CAPITAL +'
      '               CI_CRED.IMP_INTERES_PROY +'
      '               CI_CRED.IMP_IVA +'
      '               NVL(CDC_CRED.IMP_COMISION, 0) +'
      '               NVL(CDC_CRED.IMP_IVA,0)) AS IMP_TOTAL'
      '    FROM ( SELECT CA.ID_CREDITO, CA.IMP_CAPITAL '
      '           FROM CRE_CAPITAL CA'
      '           WHERE CA.F_VENCIMIENTO = :pFNomina'
      
        '             AND CA.SIT_CAPITAL NOT IN ('#39'TA'#39','#39'TC'#39','#39'TI'#39','#39'TL'#39','#39'TP'#39 +
        ','#39'TR'#39','#39'TS'#39', '#39'CA'#39') --HERJA'
      '         ) CA_CRED,'
      '         ( SELECT CI.ID_CREDITO, CI.IMP_INTERES_PROY, CI.IMP_IVA'
      '           FROM CRE_INTERES CI'
      '           WHERE CI.F_VENCIMIENTO = :pFNomina'
      
        '             AND CI.SIT_INTERES NOT IN ('#39'TA'#39','#39'TC'#39','#39'TI'#39','#39'TL'#39','#39'TP'#39 +
        ','#39'TR'#39','#39'TS'#39', '#39'CA'#39') --HERJA'
      '         ) CI_CRED,'
      '         ( SELECT CDC.ID_CREDITO, CDC.IMP_COMISION, CDC.IMP_IVA'
      '           FROM CRE_DET_COMISION CDC'
      '           WHERE CDC.F_VENCIMIENTO = :pFNomina'
      
        '             AND CDC.SIT_COMISION NOT IN ('#39'TA'#39','#39'TC'#39','#39'TI'#39','#39'TL'#39','#39'T' +
        'P'#39','#39'TR'#39','#39'TS'#39', '#39'CA'#39') --HERJA           '
      '         ) CDC_CRED,'
      '          CRE_CREDITO CC,'
      '          CRE_CONTRATO CO,'
      '          CONTRATO CTO,'
      '          ( SELECT E.ID_EMPRESA, ID_PERSONA, E.NUM_EMPLEADO'
      '            FROM EMPLEADO E,'
      '                 DWH_EMPLEADO_V@LBOWBREPO_SEL EMPLEADO_LOBO'
      
        '            WHERE EMPLEADO_LOBO.CVE_EMPLEADO = E.NUM_EMPLEADO   ' +
        '  '
      '              AND EMPLEADO_LOBO.FECHA_DE_BAJA IS NULL'
      '              AND E.ID_EMPRESA = :pIdEmpresa'
      '              AND E.SIT_EMPLEADO = '#39'AC'#39
      '          ) E'
      '    WHERE 1=1'
      '      AND CC.SIT_CREDITO = '#39'AC'#39
      '      AND CA_CRED.ID_CREDITO = CC.ID_CREDITO'
      '      AND CI_CRED.ID_CREDITO = CC.ID_CREDITO'
      '      AND CDC_CRED.ID_CREDITO (+)= CC.ID_CREDITO'
      '      AND CO.ID_CONTRATO = CC.ID_CONTRATO'
      
        '      AND CO.CVE_SUB_TIP_BCO  IN (-- PRODUCTOS ABCD DE INTERCRED' +
        'ITOS'
      
        '                                   SELECT TO_NUMBER(CVE_CLAVE) A' +
        'S CVE_SUB_TIP_BCO'
      '                                   FROM CR_CON_CAT_DATA '
      
        '                                   WHERE CVE_CON_GPO_CAT = '#39'CAT_' +
        'PROD_ABCD_C'#39
      '                                 )'
      '      AND CTO.ID_CONTRATO = CC.ID_CONTRATO'
      '      AND E.ID_PERSONA = CTO.ID_TITULAR'
      '    GROUP BY E.ID_EMPRESA, E.NUM_EMPLEADO, E.ID_PERSONA  '
      'UNION'
      '   -- Disposiciones  ICRE01'
      '    SELECT E.ID_EMPRESA,'
      '           E.NUM_EMPLEADO,'
      '           E.ID_PERSONA, '
      '           SUM(CA_ICRE.IMP_CAPITAL)            AS IMP_CAPITAL,'
      
        '           SUM(CI_ICRE.IMP_INTERES_PROY)       AS IMP_INTERES_PR' +
        'OY,'
      '           SUM(CI_ICRE.IMP_IVA)                AS IMP_IVA,'
      '           SUM(NVL(CDC_ICRE.IMP_COMISION,0))   AS IMP_COMISION,'
      
        '           SUM(NVL(CDC_ICRE.IMP_IVA,0))        AS IMP_IVA_COMISI' +
        'ON,'
      '           SUM(CA_ICRE.IMP_CAPITAL +'
      '               CI_ICRE.IMP_INTERES_PROY + '
      '               CI_ICRE.IMP_IVA +'
      '               NVL(CDC_ICRE.IMP_COMISION, 0) +'
      '               NVL(CDC_ICRE.IMP_IVA,0)) AS IMP_TOTAL'
      '    FROM ( SELECT CA.ID_CREDITO, CA.IMP_CAPITAL'
      '           FROM ( SELECT CC.ID_CREDITO'
      '                  FROM (-- PRODUCTOS ABCD DE ICRE01'
      '                         SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE'
      '                         FROM CR_CON_CAT_DATA'
      '                         WHERE CVE_CON_GPO_CAT = '#39'CAT_PROD_ABCD'#39
      '                       ) CPROD_ICRE,'
      '                       CR_CREDITO CC,'
      '                       CR_CONTRATO CO'
      
        '                  WHERE CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRO' +
        'DUCTO_CRE'
      '                    AND CC.ID_CONTRATO = CO.ID_CONTRATO'
      '                    AND CC.SIT_CREDITO = '#39'AC'#39' --HERJA'
      '                ) CC,'
      '                CR_CAPITAL CA'
      '           WHERE CA.ID_CREDITO = CC.ID_CREDITO'
      '             AND CA.F_VENCIMIENTO = :pFNomina'
      '             AND CA.SIT_CAPITAL IN ('#39'AC'#39') --HERJA'
      '         ) CA_ICRE,'
      '         ( SELECT CI.ID_CREDITO, CI.IMP_INTERES_PROY, CI.IMP_IVA'
      '           FROM ( SELECT CC.ID_CREDITO'
      '                  FROM (-- PRODUCTOS ABCD DE ICRE01'
      '                         SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE '
      '                         FROM CR_CON_CAT_DATA '
      '                         WHERE CVE_CON_GPO_CAT = '#39'CAT_PROD_ABCD'#39
      '                       ) CPROD_ICRE,'
      '                       CR_CREDITO CC,'
      '                       CR_CONTRATO CO'
      
        '                  WHERE CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRO' +
        'DUCTO_CRE'
      '                    AND CC.ID_CONTRATO = CO.ID_CONTRATO'
      '                    AND CC.SIT_CREDITO = '#39'AC'#39' --HERJA'
      '                )  CC,'
      '                CR_INTERES CI'
      '           WHERE CI.ID_CREDITO = CC.ID_CREDITO'
      '             AND CI.F_VENCIMIENTO = :pFNomina'
      '             AND CI.SIT_INTERES IN ('#39'AC'#39') --HERJA'
      '         ) CI_ICRE,'
      '         ( SELECT CDC.ID_CREDITO, CDC.IMP_COMISION, CDC.IMP_IVA'
      '           FROM ( SELECT CC.ID_CREDITO'
      '                  FROM (-- PRODUCTOS ABCD DE ICRE01'
      '                         SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE'
      '                         FROM CR_CON_CAT_DATA'
      '                         WHERE CVE_CON_GPO_CAT = '#39'CAT_PROD_ABCD'#39
      '                       ) CPROD_ICRE,'
      '                       CR_CREDITO CC,'
      '                       CR_CONTRATO CO'
      
        '                  WHERE CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRO' +
        'DUCTO_CRE'
      '                    AND CC.ID_CONTRATO = CO.ID_CONTRATO'
      '                    AND CC.SIT_CREDITO = '#39'AC'#39' --HERJA'
      '                )  CC,'
      '                CR_COMISION CDC'
      '           WHERE CDC.ID_CREDITO = CC.ID_CREDITO'
      '             AND CDC.F_VENCIMIENTO = :pFNomina'
      '             AND CDC.SIT_COMISION IN ('#39'AC'#39') --HERJA             '
      '         ) CDC_ICRE,'
      '          CR_CREDITO CC,'
      '          CR_CONTRATO CO,'
      '          CONTRATO CTO,'
      '          ( SELECT E.ID_EMPRESA, ID_PERSONA, E.NUM_EMPLEADO'
      '            FROM EMPLEADO E,'
      '                 DWH_EMPLEADO_V@LBOWBREPO_SEL EMPLEADO_LOBO'
      '            WHERE EMPLEADO_LOBO.CVE_EMPLEADO = E.NUM_EMPLEADO'
      '              AND EMPLEADO_LOBO.FECHA_DE_BAJA IS NULL'
      '              AND E.ID_EMPRESA = :pIdEmpresa'
      '              AND E.SIT_EMPLEADO = '#39'AC'#39
      '          ) E,'
      '          (-- PRODUCTOS ABCD DE ICRE01'
      '            SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE '
      '            FROM CR_CON_CAT_DATA '
      '            WHERE CVE_CON_GPO_CAT = '#39'CAT_PROD_ABCD'#39
      '          ) CPROD_ICRE'
      '    WHERE 1=1'
      '      AND CC.SIT_CREDITO = '#39'AC'#39
      '      AND CA_ICRE.ID_CREDITO = CC.ID_CREDITO'
      '      AND CI_ICRE.ID_CREDITO = CC.ID_CREDITO'
      '      AND CDC_ICRE.ID_CREDITO (+)= CC.ID_CREDITO'
      '      AND CO.ID_CONTRATO = CC.ID_CONTRATO'
      '      AND CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRODUCTO_CRE'
      '      AND CTO.ID_CONTRATO = CC.ID_CONTRATO'
      '      AND E.ID_PERSONA = CTO.ID_TITULAR'
      '    GROUP BY E.ID_EMPRESA, E.NUM_EMPLEADO, E.ID_PERSONA'
      '  )  RESULT,'
      '  PERSONA_FISICA PF      '
      'WHERE PF.ID_PERSONA = RESULT.ID_PERSONA'
      'ORDER BY RESULT.NUM_EMPLEADO'
      ' '
      ' '
      ' '
      ' ')
    Left = 299
    Top = 87
    ParamData = <
      item
        DataType = ftDate
        Name = 'pFNomina'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pFNomina'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pFNomina'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'pIdEmpresa'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pFNomina'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pFNomina'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pFNomina'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'pIdEmpresa'
        ParamType = ptInput
      end>
  end
end
