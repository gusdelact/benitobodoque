object WCorrecP: TWCorrecP
  Left = 358
  Top = 271
  Width = 626
  Height = 351
  Caption = 'Reinicio de Contabilidad en Dolares'
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
    Left = 8
    Top = 286
    Width = 601
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
      Left = 320
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
      Left = 320
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
      Left = 384
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
      Left = 384
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
  object GBReinDolar: TGroupBox
    Left = 8
    Top = 16
    Width = 601
    Height = 81
    Caption = 'Reinicio de Contabilidad en Dolares'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label22: TLabel
      Left = 26
      Top = 44
      Width = 62
      Height = 13
      Caption = 'F. Reinicio'
    end
    object edF_REINICIO: TEdit
      Left = 95
      Top = 36
      Width = 76
      Height = 21
      HelpContext = 1001
      Color = clWhite
      TabOrder = 0
    end
    object dtpF_REINICIO: TInterDateTimePicker
      Left = 173
      Top = 36
      Width = 20
      Height = 21
      HelpContext = 1002
      CalAlignment = dtaLeft
      Date = 37777.7691627546
      Time = 37777.7691627546
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      Edit = edF_REINICIO
      Formato = dfDate
    end
    object btACEPTAR: TBitBtn
      Left = 238
      Top = 34
      Width = 83
      Height = 22
      Caption = 'Aceptar'
      TabOrder = 2
      OnClick = btACEPTARClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
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
  end
  object GBcve_ope_cont: TGroupBox
    Left = 8
    Top = 120
    Width = 601
    Height = 153
    Caption = 'Alta/Modificacion CR_CONT_OPE_CON'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 107
      Height = 13
      Caption = 'CVE_OPER_CRED'
    end
    object Label2: TLabel
      Left = 200
      Top = 32
      Width = 93
      Height = 13
      Caption = 'CVE_COMISION'
    end
    object Label3: TLabel
      Left = 384
      Top = 32
      Width = 99
      Height = 13
      Caption = 'CVE_CONCEPTO'
    end
    object Label4: TLabel
      Left = 16
      Top = 96
      Width = 112
      Height = 13
      Caption = 'CVE_TIPO_MOVTO'
    end
    object Label5: TLabel
      Left = 200
      Top = 96
      Width = 98
      Height = 13
      Caption = 'CVE_OPE_CONT'
    end
    object cbCVE_OPER_CRED: TComboBox
      Left = 16
      Top = 48
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'AFIADI'
        'AJFDIN'
        'AJFVCN'
        'AJFVCP'
        'AJFVFN'
        'AJFVIN'
        'AMORCP'
        'AMORIN'
        'APFNFD'
        'CADVPA'
        'CAPVFD'
        'CAREVI'
        'CASTCN'
        'CASTCP'
        'CASTFN'
        'CASTIN'
        'CAVEEX'
        'CAVENE'
        'CIIMVD'
        'CMORCN'
        'CMORCP'
        'CMORFN'
        'CMORIN'
        'CODIPR'
        'CODISP'
        'CODNCN'
        'CODNCP'
        'CODNFN'
        'CODNIN'
        'COIMVD'
        'CPIMVD'
        'CPIMVG'
        'CVEGEN'
        'CVEINT'
        'DEGAFE'
        'DEGALI'
        'DEPGPY'
        'DEPODV'
        'DEPOGF'
        'DERCGF'
        'DERCGP'
        'DINTRA'
        'DISPCR'
        'DISPCS'
        'DISPFD'
        'DISPRE'
        'DISPRS'
        'DPDVDL'
        'DSCRDL'
        'DSCSDL'
        'DVMRFR'
        'FDVTCN'
        'FDVTCP'
        'FDVTFN'
        'FDVTIN'
        'FNIMVD'
        'FNIMVG'
        'FONCON'
        'FONDEO'
        'INGAFE'
        'INGALI'
        'INPROV'
        'INREVI'
        'INVEEX'
        'INVENE'
        'IVDEPE'
        'KAGAFE'
        'MORACN'
        'MORACP'
        'MORAFN'
        'MORAIN'
        'PAGCAP'
        'PAGIDP'
        'PAGOCN'
        'PAGOCP'
        'PAGOFN'
        'PAGOII'
        'PAGOIN'
        'PAINFA'
        'PARECP'
        'PARSCN'
        'PARSCP'
        'PARSFN'
        'PARSIN'
        'PGANCN'
        'PGANCP'
        'PGANFN'
        'PGANIN'
        'PGAPCP'
        'PGAPFN'
        'PGCNDD'
        'PGCNGF'
        'PGCNGL'
        'PGCPDD'
        'PGCPGF'
        'PGCPGL'
        'PGCPGP'
        'PGDMCP'
        'PGFNGF'
        'PGFNGL'
        'PGFNRF'
        'PGFNRI'
        'PGFNRK'
        'PGFNRN'
        'PGINDD'
        'PGINGF'
        'PGINGL'
        'PGINGP'
        'PGSTCP'
        'PROVII'
        'PROVIS'
        'PRVENE'
        'PVCICN'
        'PVCIGP'
        'PVRTFD'
        'QUEBCN'
        'QUEBCP'
        'QUEBIN'
        'QUITCN'
        'QUITCP'
        'QUITIN'
        'RAFIAD'
        'RCASCP'
        'RCCNGF'
        'RCCPGF'
        'RCCPGP'
        'RCDVPA'
        'RCFNGF'
        'RCIMVD'
        'RCINGF'
        'RCINGP'
        'RCMRCN'
        'RCMRCP'
        'RCMRFN'
        'RCONCP'
        'RCPIMV'
        'RDEPDV'
        'RDISCR'
        'RDISFD'
        'RDMRFR'
        'RDRCGF'
        'RDRCGP'
        'RDVTCN'
        'RDVTCP'
        'RDVTFN'
        'REMAGA'
        'REMAIN'
        'REPGPY'
        'REPOGF'
        'REREIN'
        'RETGPY'
        'RETIDV'
        'RETIGF'
        'RGCNGF'
        'RGCPGF'
        'RGCPGP'
        'RGDMCP'
        'RGFNGF'
        'RGFNRF'
        'RGFNRI'
        'RGFNRK'
        'RGFNRN'
        'RGINGF'
        'RGINGP'
        'RINTRA'
        'RIPARE'
        'RJFVCN'
        'RJFVCP'
        'RJFVFN'
        'RJFVIN'
        'RMINDL'
        'RMORCP'
        'RPAGCN'
        'RPAGCP'
        'RPAGFN'
        'RPAGIN'
        'RPAINF'
        'RPCNGL'
        'RPCPGL'
        'RPFNFD'
        'RPGACN'
        'RPGCND'
        'RPGCPD'
        'RPGDCP'
        'RPGIND'
        'RPGNCP'
        'RPGNFN'
        'RPGNIN'
        'RPGPCP'
        'RPGPFN'
        'RPINGL'
        'RRCNGF'
        'RRCPGF'
        'RRCPGP'
        'RREMGA'
        'RREMIN'
        'RRERIN'
        'RRETDV'
        'RRFNGF'
        'RRINDL'
        'RRINGF'
        'RRINGP'
        'RRTIGF'
        'RRTIGP'
        'RTDVDL'
        'VEPROV')
    end
    object cbCVE_TIPO_MOVTO: TComboBox
      Left = 16
      Top = 112
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'AN'
        'AV'
        'IM'
        'IV'
        'MD'
        'MV')
    end
    object cbCVE_COMISION: TComboBox
      Left = 200
      Top = 48
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        'NA'
        'CACV'
        'CADSUP'
        'CFACTI'
        'CFINAN'#9
        'CINFVE'#9
        'COANIV'#9
        'COAP'#9
        'COCONV'#9
        'CODI'
        'CODIPR'
        'CODIVA'
        'COESVA'
        'COGNOT'#9
        'COGRDE'#9
        'COMANU'#9
        'COMEST'#9
        'COMGTA'#9
        'COMGTC'#9
        'COPANT'#9
        'CORE'
        'COREME'#9
        'CUFEGA'
        'GANO'
        'GASLE'
        'GTBMEX'
        'PEFIRA'
        'PSDA'
        'PSVI'
        'PSVIEM'
        'SAEE'
        'SVEE')
    end
    object cbCVE_OPE_CONT: TComboBox
      Left = 200
      Top = 112
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        'CAIM'
        'CANMOR'
        'CAPI'
        'CASTIG'
        'CAVE'
        'CMORCP'
        'COLO'
        'IMVE'
        'PAGO'
        'PAGOFG'
        'PRMOR'
        'PRVE'
        'PRVEAN'
        'PSVI'
        'PVCI'
        'PVCIAN'
        'PVCN'
        'QUITA'
        'RECUFG'
        'RECUGP'
        'REMA'
        'REREGF'
        'REREGP'
        'REREMA'
        'REVC'
        'REVE'
        'RPAGO'
        'RPSVI'
        'RVCAPI'
        'RVPAGO'
        'TEMP')
    end
    object cbCVE_CONCEPTO: TComboBox
      Left = 384
      Top = 48
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'IMBRVA'
        'IMDDVA'
        'IMFVVA'
        'IMIVVA'
        'IMMOVA'
        'IMPBRU'
        'IMPCPA'
        'IMPDIA'
        'IMPDID'
        'IMPFND'
        'IMPFVA'
        'IMPIVA'
        'IMPMOR'
        'IMPPRY'
        'IVAMOR'
        'IVAPRY')
    end
    object Bguardar: TBitBtn
      Left = 382
      Top = 114
      Width = 83
      Height = 22
      Caption = 'Guardar'
      TabOrder = 5
      OnClick = BguardarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
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
    FormaTipo = ftConsulta
    CanEdit = False
    IsNewData = False
    ShowBtnNuevo = False
    ShowBtnModificar = False
    ShowBtnAceptar = False
    ShowBtnCancelar = False
    ShowBtnEliminar = False
    Version = 20
    HideButtons = True
    ShowBtnPreview = False
    ShowBtnImprimir = False
    ShowBtnBuscar = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 322
    Top = 2
  end
end
