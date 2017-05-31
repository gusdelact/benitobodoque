object wCrEstHist: TwCrEstHist
  Left = 408
  Top = 187
  Width = 506
  Height = 179
  Caption = 'Estadísticas Históricas'
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
  object Label4: TLabel
    Left = 16
    Top = 16
    Width = 130
    Height = 17
    AutoSize = False
    Caption = 'Fecha de Consulta'
    WordWrap = True
  end
  object PnDatos: TPanel
    Left = 0
    Top = 122
    Width = 497
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
  object Panel1: TPanel
    Left = 0
    Top = 48
    Width = 497
    Height = 65
    TabOrder = 1
    object Label1: TLabel
      Left = 31
      Top = 14
      Width = 89
      Height = 17
      AutoSize = False
      Caption = 'Archivo de Salida'
      WordWrap = True
    end
    object edArchivo: TEdit
      Left = 32
      Top = 32
      Width = 457
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object btGuardar: TBitBtn
      Left = 9
      Top = 31
      Width = 23
      Height = 23
      TabOrder = 1
      TabStop = False
      OnClick = btGuardarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
    end
  end
  object edF_Consulta: TEdit
    Left = 126
    Top = 13
    Width = 90
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object dtpF_Consulta: TInterDateTimePicker
    Left = 217
    Top = 13
    Width = 21
    Height = 21
    CalAlignment = dtaLeft
    Date = 37770.450694537
    Time = 37770.450694537
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
    TabStop = False
    Edit = edF_Consulta
    Formato = dfDate
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
    OnBtnImprimirClick = InterForma1BtnImprimirClick
    ShowBtnImprimir = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 370
    Top = 34
  end
  object sdArchivo: TSaveDialog
    DefaultExt = 'txt'
    Filter = '*.txt|*.txt|*.csv|*.csv|*.*|*.*'
    Left = 304
    Top = 16
  end
  object qyConsulta: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'SELECT'
      ' TO_CHAR(HIST.F_ESTADISTICA,'#39'DD/MM/YYYY'#39') F_ESTADISTICA,'
      '  TO_CHAR(HIST.F_ESTADISTICA,'#39'YYYYMM'#39') ANIO_MES,'
      '  HIST.ID_ACREDITADO,'
      
        '  DECODE(PACRED.CVE_PER_JURIDICA,'#39'PM'#39',PACRED.NOMBRE,PFACRED.APEL' +
        'LIDO_PATERNO||'#39' '#39'||PFACRED.APELLIDO_MATERNO||'#39' '#39'||PFACRED.NOMBRE' +
        '_PERSONA) ACREDITADO,'
      '  HIST.ID_PROM_ASOC,'
      
        '  DECODE(PASOC.CVE_PER_JURIDICA,'#39'PM'#39',PASOC.NOMBRE,PFASOC.APELLID' +
        'O_PATERNO||'#39' '#39'||PFASOC.APELLIDO_MATERNO||'#39' '#39'||PFASOC.NOMBRE_PERS' +
        'ONA) PROM_ASOC,'
      '  HIST.ID_PROM_ADM,'
      
        '  DECODE(PADM.CVE_PER_JURIDICA,'#39'PM'#39',PADM.NOMBRE,PFADM.NOMBRE_PER' +
        'SONA ||'#39' '#39'|| PFADM.APELLIDO_PATERNO||'#39' '#39'||PFADM.APELLIDO_MATERNO' +
        ') PROM_ADMIN,'
      '  HIST.CVE_MERCADO,'
      '  PRESUP.DESC_PRESUPUESTO DESC_MERCADO ,'
      '  HIST.CVE_SUBMERCADO,'
      '  CGI.DESC_CARTERA DESC_SUBMERCADO,'
      
        '  DECODE(HIST.CVE_SIT_CARTERA, '#39'VI'#39', '#39'Vigente'#39', '#39'IM'#39', '#39'Impagada'#39 +
        ', '#39'VE'#39', '#39'Vencida'#39', '#39'No definida'#39') SIT_CARTERA ,'
      '  IMP_COLOC_DOC, IMP_COLOC_OTROS,'
      '  IMP_VENC_DOC, IMP_VENC_OTROS,'
      
        '  IMP_SDO, IMP_SDO_PROM, IMP_MORATORIO, IMP_MARGEN, IMP_COMISION' +
        ', IMP_UTILIDAD,'
      '  IMP_COL_DOC_DIA, IMP_COL_OTR_DIA,'
      '  IMP_VNC_AC_DOC, IMP_VNC_AC_OTR'
      '  FROM CR_ESTAD_HIST HIST,'
      '      PERSONA             PACRED,'
      '      PERSONA_FISICA      PFACRED,'
      '      PERSONA             PASOC,'
      '      PERSONA_FISICA      PFASOC,'
      '      PERSONA             PADM,'
      '      PERSONA_FISICA      PFADM,'
      '      CRE_PRESUPUESTO     PRESUP,'
      
        '      (SELECT DISTINCT(CVE_GPO_INGRESO) CVE_GPO_INGRESO, DESC_CA' +
        'RTERA'
      '         FROM CRE_GPO_INGRESO'
      '      ) CGI'
      'WHERE HIST.F_ESTADISTICA =  :pFecha'
      '  AND HIST.ID_ACREDITADO =   PACRED.ID_PERSONA(+)'
      '  AND HIST.ID_ACREDITADO =   PFACRED.ID_PERSONA(+)'
      '  AND HIST.ID_PROM_ASOC  =   PASOC.ID_PERSONA(+)'
      '  AND HIST.ID_PROM_ASOC  =   PFASOC.ID_PERSONA(+)'
      '  AND HIST.ID_PROM_ADM   =   PADM.ID_PERSONA(+)'
      '  AND HIST.ID_PROM_ADM   =   PFADM.ID_PERSONA(+)'
      '  AND HIST.CVE_MERCADO   =   PRESUP.CVE_PRESUPUESTO(+)'
      '  AND HIST.CVE_SUBMERCADO=   CGI.CVE_GPO_INGRESO(+)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 343
    Top = 5
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'pFecha'
        ParamType = ptInput
        Value = 0
      end>
    object qyConsultaF_ESTADISTICA: TStringField
      FieldName = 'F_ESTADISTICA'
      Size = 10
    end
    object qyConsultaANIO_MES: TStringField
      FieldName = 'ANIO_MES'
      Size = 6
    end
    object qyConsultaID_ACREDITADO: TFloatField
      FieldName = 'ID_ACREDITADO'
    end
    object qyConsultaACREDITADO: TStringField
      FieldName = 'ACREDITADO'
      Size = 80
    end
    object qyConsultaID_PROM_ASOC: TFloatField
      FieldName = 'ID_PROM_ASOC'
    end
    object qyConsultaPROM_ASOC: TStringField
      FieldName = 'PROM_ASOC'
      Size = 80
    end
    object qyConsultaID_PROM_ADM: TFloatField
      FieldName = 'ID_PROM_ADM'
    end
    object qyConsultaPROM_ADMIN: TStringField
      FieldName = 'PROM_ADMIN'
      Size = 80
    end
    object qyConsultaCVE_MERCADO: TStringField
      FieldName = 'CVE_MERCADO'
      Size = 6
    end
    object qyConsultaDESC_MERCADO: TStringField
      FieldName = 'DESC_MERCADO'
      Size = 40
    end
    object qyConsultaCVE_SUBMERCADO: TStringField
      FieldName = 'CVE_SUBMERCADO'
      Size = 6
    end
    object qyConsultaDESC_SUBMERCADO: TStringField
      FieldName = 'DESC_SUBMERCADO'
      Size = 40
    end
    object qyConsultaSIT_CARTERA: TStringField
      FieldName = 'SIT_CARTERA'
      Size = 11
    end
    object qyConsultaIMP_COLOC_DOC: TFloatField
      FieldName = 'IMP_COLOC_DOC'
      currency = True
    end
    object qyConsultaIMP_COLOC_OTROS: TFloatField
      FieldName = 'IMP_COLOC_OTROS'
      currency = True
    end
    object qyConsultaIMP_VENC_DOC: TFloatField
      FieldName = 'IMP_VENC_DOC'
      currency = True
    end
    object qyConsultaIMP_VENC_OTROS: TFloatField
      FieldName = 'IMP_VENC_OTROS'
      currency = True
    end
    object qyConsultaIMP_SDO: TFloatField
      FieldName = 'IMP_SDO'
      currency = True
    end
    object qyConsultaIMP_SDO_PROM: TFloatField
      FieldName = 'IMP_SDO_PROM'
      currency = True
    end
    object qyConsultaIMP_MORATORIO: TFloatField
      FieldName = 'IMP_MORATORIO'
      currency = True
    end
    object qyConsultaIMP_MARGEN: TFloatField
      FieldName = 'IMP_MARGEN'
      currency = True
    end
    object qyConsultaIMP_COMISION: TFloatField
      FieldName = 'IMP_COMISION'
      currency = True
    end
    object qyConsultaIMP_UTILIDAD: TFloatField
      FieldName = 'IMP_UTILIDAD'
      currency = True
    end
    object qyConsultaIMP_COL_DOC_DIA: TFloatField
      FieldName = 'IMP_COL_DOC_DIA'
      currency = True
    end
    object qyConsultaIMP_COL_OTR_DIA: TFloatField
      FieldName = 'IMP_COL_OTR_DIA'
      currency = True
    end
    object qyConsultaIMP_VNC_AC_DOC: TFloatField
      FieldName = 'IMP_VNC_AC_DOC'
      currency = True
    end
    object qyConsultaIMP_VNC_AC_OTR: TFloatField
      FieldName = 'IMP_VNC_AC_OTR'
      currency = True
    end
  end
end
