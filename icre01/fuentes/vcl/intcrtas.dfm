object WIntCrTAS: TWIntCrTAS
  Left = 304
  Top = 121
  Width = 551
  Height = 519
  Caption = 'Carga de Archivo TAS'
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
    Left = 0
    Top = 39
    Width = 540
    Height = 137
    BevelOuter = bvNone
    Caption = '$00C08080'
    Color = clTeal
    TabOrder = 0
    object sbFechaArch: TSpeedButton
      Left = 4
      Top = 6
      Width = 313
      Height = 22
      Caption = 'Generar Archivo (Activo) TAS al día: 31/07/2006'
      OnClick = sbFechaArchClick
    end
    object Label1: TLabel
      Left = 363
      Top = 114
      Width = 86
      Height = 13
      Caption = 'Registros (Activo):'
    end
    object lbToTArc: TLabel
      Left = 490
      Top = 114
      Width = 6
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = '0'
      ParentBiDiMode = False
    end
    object sbEnviaActivoSIAR: TSpeedButton
      Left = 328
      Top = 6
      Width = 209
      Height = 22
      Caption = 'Enviar Activo al SIAR'
      OnClick = sbEnviaActivoSIARClick
    end
    object mTAS: TMemo
      Left = 4
      Top = 30
      Width = 532
      Height = 81
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object pbArch: TProgressBar
      Left = 4
      Top = 118
      Width = 353
      Height = 9
      Min = 0
      Max = 3
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 181
    Width = 540
    Height = 137
    BevelOuter = bvNone
    Caption = '$00C08000'
    Color = clGray
    TabOrder = 1
    object sbGeneraPas: TSpeedButton
      Left = 4
      Top = 6
      Width = 313
      Height = 22
      Caption = 'Generar Archivo (Pasivo) TAS al día: 31/07/2006'
      OnClick = sbGeneraPasClick
    end
    object Label2: TLabel
      Left = 370
      Top = 114
      Width = 88
      Height = 13
      Caption = 'Registros (Pasivo):'
    end
    object lbTotPas: TLabel
      Left = 490
      Top = 114
      Width = 6
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = '0'
      ParentBiDiMode = False
    end
    object sbEnviaPasivoSIAR: TSpeedButton
      Left = 328
      Top = 6
      Width = 209
      Height = 22
      Caption = 'Enviar Pasivo al SIAR'
      OnClick = sbEnviaPasivoSIARClick
    end
    object mPas: TMemo
      Left = 4
      Top = 30
      Width = 532
      Height = 81
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object pbPasivo: TProgressBar
      Left = 4
      Top = 118
      Width = 353
      Height = 9
      Min = 0
      Max = 3
      TabOrder = 1
    end
  end
  object PnDatos: TPanel
    Left = 0
    Top = 463
    Width = 537
    Height = 21
    TabOrder = 2
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
      Left = 262
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
      Left = 262
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
      Left = 326
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
      Left = 326
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
  object rgCARGA: TRadioGroup
    Left = 2
    Top = 2
    Width = 530
    Height = 34
    Caption = 'Tipo de Carga'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Carga Temporal'
      'Carga Definitiva')
    TabOrder = 3
  end
  object Panel4: TPanel
    Left = 0
    Top = 323
    Width = 540
    Height = 138
    BevelOuter = bvNone
    Caption = '$00C08000'
    Color = clNavy
    TabOrder = 4
    object sbGenPasCorp: TSpeedButton
      Left = 4
      Top = 8
      Width = 313
      Height = 22
      Caption = 'Generar Información del Corporativo al día: 31/07/2006'
      OnClick = sbGenPasCorpClick
    end
    object Label3: TLabel
      Left = 365
      Top = 116
      Width = 81
      Height = 13
      Caption = 'Registros (Corp.):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbPasCorp: TLabel
      Left = 492
      Top = 116
      Width = 6
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
    end
    object sbEnvPasCorp: TSpeedButton
      Left = 327
      Top = 8
      Width = 209
      Height = 22
      Caption = 'Enviar Información Corporativo al SIAR'
      OnClick = sbEnvPasCorpClick
    end
    object mPasCorp: TMemo
      Left = 4
      Top = 32
      Width = 532
      Height = 81
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object pbPasCorp: TProgressBar
      Left = 4
      Top = 120
      Width = 353
      Height = 12
      Min = 0
      Max = 3
      TabOrder = 1
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
    Left = 562
    Top = 2
  end
  object qActivo1: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'select '#39'x'#39' as PORTAFOLIO,'
      '0 AS ID_CREDITO,'
      '       '#39'X'#39' AS FUENTE,'
      '       '#39'x'#39' AS SIGNO,'
      '       '#39'x'#39' AS ACTIVOFINANCIERO,'
      '       '#39'x'#39' AS ACTIVOBASICO,'
      '       trunc(sysdate) AS FPOSICION,'
      '       trunc(sysdate) AS FECHAINICIO,'
      '       trunc(sysdate) AS FECHAVENCIMIENTO,'
      '       0 AS IMPORTE,'
      '       '#39'x'#39' AS TASAFIJA1,'
      '       '#39'x'#39' AS TASAFIJA2,'
      '       1 AS TIPOCAMBIO,'
      '       '#39'x'#39' AS PLAZOCUPON,'
      '       0 AS NUMEROCUPONES,'
      '       trunc(sysdate) AS FECHAEMISION,'
      '       0 AS FACTORCAPITALIZACION,'
      '       '#39'x'#39' AS FACTORAMORTIZA,'
      '       0 AS CUPONEMPAMOR,'
      '       0 AS NUMEROAMORTIZA,'
      '       '#39'x'#39' AS TIPOCREDITO,'
      '       '#39'x'#39' AS PORTAFOLIOCOL,'
      '       0 AS VALORCOL,'
      '       0 AS TIPOGARANTIA,'
      '       0 AS OTROACC,'
      '       0 AS DIACORTE,'
      '       0 AS ESTATUSGRAL,'
      '       0 AS PORCENTQUEB,'
      '       0 AS TASACUPONAC'
      'from dual')
    Left = 40
    Top = 87
  end
  object qPasivo1: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'select '#39'x'#39' as PORTAFOLIO,'
      '0 AS ID_CREDITO,'
      '       '#39'X'#39' AS FUENTE,'
      '       '#39'x'#39' AS SIGNO,'
      '       '#39'x'#39' AS ACTIVOFINANCIERO,'
      '       '#39'x'#39' AS ACTIVOBASICO,'
      '       trunc(sysdate) AS FPOSICION,'
      '       trunc(sysdate) AS FECHAINICIO,'
      '       trunc(sysdate) AS FECHAVENCIMIENTO,'
      '       0 AS IMPORTE,'
      '       '#39'x'#39' AS TASAFIJA1,'
      '       '#39'x'#39' AS TASAFIJA2,'
      '       1 AS TIPOCAMBIO,'
      '       '#39'x'#39' AS PLAZOCUPON,'
      '       0 AS NUMEROCUPONES,'
      '       trunc(sysdate) AS FECHAEMISION,'
      '       0 AS FACTORCAPITALIZACION,'
      '       '#39'x'#39' AS FACTORAMORTIZA,'
      '       0 AS CUPONEMPAMOR,'
      '       0 AS NUMEROAMORTIZA,'
      '       '#39'x'#39' AS TIPOCREDITO,'
      '       '#39'x'#39' AS PORTAFOLIOCOL,'
      '       0 AS VALORCOL,'
      '       0 AS TIPOGARANTIA,'
      '       0 AS OTROACC,'
      '       0 AS DIACORTE,'
      '       0 AS ESTATUSGRAL,'
      '       0 AS PORCENTQUEB,'
      '       0 AS TASACUPONAC'
      'from dual')
    Left = 40
    Top = 221
  end
  object qPasCorp: TQuery
    SQL.Strings = (
      'select :PHOY, '
      '           :PF_APERTURA, '
      '           :PF_VENCIMIENTO, '
      '           :PF_INICIO_OPER, '
      '           :PF_VENMTO_OPER, '
      '           :PFAPERTURA, '
      '           :PINICIO,'
      '           :PESTATUS'
      'from dual')
    Left = 40
    Top = 362
    ParamData = <
      item
        DataType = ftDate
        Name = 'PHOY'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PF_APERTURA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PF_VENCIMIENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PF_INICIO_OPER'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PF_VENMTO_OPER'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PFAPERTURA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PESTATUS'
        ParamType = ptInput
      end>
  end
  object qActivo3: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'select '#39'x'#39' as PORTAFOLIO,'
      '0 AS ID_CREDITO,'
      '       '#39'X'#39' AS FUENTE,'
      '       '#39'x'#39' AS SIGNO,'
      '       '#39'x'#39' AS ACTIVOFINANCIERO,'
      '       '#39'x'#39' AS ACTIVOBASICO,'
      '       trunc(sysdate) AS FPOSICION,'
      '       trunc(sysdate) AS FECHAINICIO,'
      '       trunc(sysdate) AS FECHAVENCIMIENTO,'
      '       0 AS IMPORTE,'
      '       '#39'x'#39' AS TASAFIJA1,'
      '       '#39'x'#39' AS TASAFIJA2,'
      '       1 AS TIPOCAMBIO,'
      '       '#39'x'#39' AS PLAZOCUPON,'
      '       0 AS NUMEROCUPONES,'
      '       trunc(sysdate) AS FECHAEMISION,'
      '       0 AS FACTORCAPITALIZACION,'
      '       '#39'x'#39' AS FACTORAMORTIZA,'
      '       0 AS CUPONEMPAMOR,'
      '       0 AS NUMEROAMORTIZA,'
      '       '#39'x'#39' AS TIPOCREDITO,'
      '       '#39'x'#39' AS PORTAFOLIOCOL,'
      '       0 AS VALORCOL,'
      '       0 AS TIPOGARANTIA,'
      '       0 AS OTROACC,'
      '       0 AS DIACORTE,'
      '       0 AS ESTATUSGRAL,'
      '       0 AS PORCENTQUEB,'
      '       0 AS TASACUPONAC'
      'from dual')
    Left = 104
    Top = 87
  end
  object qActivo2: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'select '#39'x'#39' as PORTAFOLIO,'
      '0 AS ID_CREDITO,'
      '       '#39'X'#39' AS FUENTE,'
      '       '#39'x'#39' AS SIGNO,'
      '       '#39'x'#39' AS ACTIVOFINANCIERO,'
      '       '#39'x'#39' AS ACTIVOBASICO,'
      '       trunc(sysdate) AS FPOSICION,'
      '       trunc(sysdate) AS FECHAINICIO,'
      '       trunc(sysdate) AS FECHAVENCIMIENTO,'
      '       0 AS IMPORTE,'
      '       '#39'x'#39' AS TASAFIJA1,'
      '       '#39'x'#39' AS TASAFIJA2,'
      '       1 AS TIPOCAMBIO,'
      '       '#39'x'#39' AS PLAZOCUPON,'
      '       0 AS NUMEROCUPONES,'
      '       trunc(sysdate) AS FECHAEMISION,'
      '       0 AS FACTORCAPITALIZACION,'
      '       '#39'x'#39' AS FACTORAMORTIZA,'
      '       0 AS CUPONEMPAMOR,'
      '       0 AS NUMEROAMORTIZA,'
      '       '#39'x'#39' AS TIPOCREDITO,'
      '       '#39'x'#39' AS PORTAFOLIOCOL,'
      '       0 AS VALORCOL,'
      '       0 AS TIPOGARANTIA,'
      '       0 AS OTROACC,'
      '       0 AS DIACORTE,'
      '       0 AS ESTATUSGRAL,'
      '       0 AS PORCENTQUEB,'
      '       0 AS TASACUPONAC'
      'from dual')
    Left = 72
    Top = 87
  end
  object qPasivo3: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'select '#39'x'#39' as PORTAFOLIO,'
      '0 AS ID_CREDITO,'
      '       '#39'X'#39' AS FUENTE,'
      '       '#39'x'#39' AS SIGNO,'
      '       '#39'x'#39' AS ACTIVOFINANCIERO,'
      '       '#39'x'#39' AS ACTIVOBASICO,'
      '       trunc(sysdate) AS FPOSICION,'
      '       trunc(sysdate) AS FECHAINICIO,'
      '       trunc(sysdate) AS FECHAVENCIMIENTO,'
      '       0 AS IMPORTE,'
      '       '#39'x'#39' AS TASAFIJA1,'
      '       '#39'x'#39' AS TASAFIJA2,'
      '       1 AS TIPOCAMBIO,'
      '       '#39'x'#39' AS PLAZOCUPON,'
      '       0 AS NUMEROCUPONES,'
      '       trunc(sysdate) AS FECHAEMISION,'
      '       0 AS FACTORCAPITALIZACION,'
      '       '#39'x'#39' AS FACTORAMORTIZA,'
      '       0 AS CUPONEMPAMOR,'
      '       0 AS NUMEROAMORTIZA,'
      '       '#39'x'#39' AS TIPOCREDITO,'
      '       '#39'x'#39' AS PORTAFOLIOCOL,'
      '       0 AS VALORCOL,'
      '       0 AS TIPOGARANTIA,'
      '       0 AS OTROACC,'
      '       0 AS DIACORTE,'
      '       0 AS ESTATUSGRAL,'
      '       0 AS PORCENTQUEB,'
      '       0 AS TASACUPONAC'
      'from dual')
    Left = 104
    Top = 221
  end
  object qPasivo2: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'select '#39'x'#39' as PORTAFOLIO,'
      '0 AS ID_CREDITO,'
      '       '#39'X'#39' AS FUENTE,'
      '       '#39'x'#39' AS SIGNO,'
      '       '#39'x'#39' AS ACTIVOFINANCIERO,'
      '       '#39'x'#39' AS ACTIVOBASICO,'
      '       trunc(sysdate) AS FPOSICION,'
      '       trunc(sysdate) AS FECHAINICIO,'
      '       trunc(sysdate) AS FECHAVENCIMIENTO,'
      '       0 AS IMPORTE,'
      '       '#39'x'#39' AS TASAFIJA1,'
      '       '#39'x'#39' AS TASAFIJA2,'
      '       1 AS TIPOCAMBIO,'
      '       '#39'x'#39' AS PLAZOCUPON,'
      '       0 AS NUMEROCUPONES,'
      '       trunc(sysdate) AS FECHAEMISION,'
      '       0 AS FACTORCAPITALIZACION,'
      '       '#39'x'#39' AS FACTORAMORTIZA,'
      '       0 AS CUPONEMPAMOR,'
      '       0 AS NUMEROAMORTIZA,'
      '       '#39'x'#39' AS TIPOCREDITO,'
      '       '#39'x'#39' AS PORTAFOLIOCOL,'
      '       0 AS VALORCOL,'
      '       0 AS TIPOGARANTIA,'
      '       0 AS OTROACC,'
      '       0 AS DIACORTE,'
      '       0 AS ESTATUSGRAL,'
      '       0 AS PORCENTQUEB,'
      '       0 AS TASACUPONAC'
      'from dual')
    Left = 72
    Top = 221
  end
  object qFactor: TQuery
    DatabaseName = 'DCORP'
    SQL.Strings = (
      'select FACT_AMORT from lim_siar_famort')
    Left = 216
    Top = 64
    object qFactorFACT_AMORT: TMemoField
      FieldName = 'FACT_AMORT'
      Origin = 'DCORP.LIM_SIAR_FAMORT.FACT_AMORT'
      BlobType = ftMemo
      Size = 2000
    end
  end
end
