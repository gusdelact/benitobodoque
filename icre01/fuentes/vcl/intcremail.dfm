object WCrEmail: TWCrEmail
  Left = 306
  Top = 112
  Width = 579
  Height = 507
  Caption = 'Catálogo de Correos'
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
  object lbID_TIPO_EMAIL: TLabel
    Left = 1
    Top = 6
    Width = 70
    Height = 13
    Caption = 'Tipo de Correo'
  end
  object lbTITULO_EMAIL: TLabel
    Left = 2
    Top = 30
    Width = 28
    Height = 13
    Caption = 'Título'
  end
  object lbDESC_EMAIL: TLabel
    Left = 1
    Top = 51
    Width = 56
    Height = 13
    Caption = 'Descripción'
  end
  object lbCUERPO_EMAIL: TLabel
    Left = 2
    Top = 130
    Width = 34
    Height = 13
    Caption = 'Cuerpo'
  end
  object Label1: TLabel
    Left = 2
    Top = 318
    Width = 120
    Height = 13
    Caption = 'Etiquetas posibles a usar:'
  end
  object edID_TIPO_EMAIL: TEdit
    Tag = 50
    Left = 74
    Top = 2
    Width = 96
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edTITULO_EMAIL: TEdit
    Tag = 18
    Left = 74
    Top = 25
    Width = 495
    Height = 21
    TabOrder = 1
  end
  object memCUERPO_EMAIL: TMemo
    Tag = 18
    Left = 3
    Top = 145
    Width = 566
    Height = 171
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object memDESC_EMAIL: TMemo
    Tag = 18
    Left = 3
    Top = 66
    Width = 566
    Height = 59
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object PnDatos: TPanel
    Left = 0
    Top = 454
    Width = 570
    Height = 19
    TabOrder = 4
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
  object Memo1: TMemo
    Left = 3
    Top = 333
    Width = 565
    Height = 120
    Color = clInfoBk
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      
        'Una "Etiqueta" es una palabra clave que ocupa el sistema en  el ' +
        'correo,'
      
        'para sustituirlo por un valor designado, conforme a la siguiente' +
        ' tabla:'
      ''
      
        '----------------------------------------------------------------' +
        '-------'
      
        '         ETIQUETA        |      VALOR QUE OBTIENE PARA SUSTITUIR' +
        'LO'
      
        '----------------------------------------------------------------' +
        '-------'
      '<*FECHA*>                | Fecha de la Empresa (Hoy)'
      
        '----------------------------------------------------------------' +
        '-------'
      '<*NOMBRE*>               | Nombre del Acreditado (Emisor)'
      
        '----------------------------------------------------------------' +
        '-------'
      
        '<*CALLE_NUMERO*>         | Domicilio del Acreditado, Calle y Núm' +
        'ero'
      
        '----------------------------------------------------------------' +
        '-------'
      '<*DESC_POBLACION*>       | Domicilio del Acreditado, Estado'
      
        '----------------------------------------------------------------' +
        '-------'
      '<*COLONIA*>              | Domicilio del Acreditado, Colonia'
      
        '----------------------------------------------------------------' +
        '-------'
      
        '<*CODIGO_POSTAL*>        | Domicilio del Acreditado, Código Post' +
        'al'
      
        '----------------------------------------------------------------' +
        '-------'
      
        '<*ATENCION*>             | Aplica   únicamente  para  "Notificac' +
        'ión  de '
      
        '                         | Cesiones", lo sustituye por el valor ' +
        'indicado'
      '                         | por el usuario en "A la Atención de"'
      
        '----------------------------------------------------------------' +
        '-------'
      
        '<*MENSAJE_ADICIONAL*>    | Diversas Aplicaciones, depende del co' +
        'rreo a'
      '                         | enviar.'
      
        '----------------------------------------------------------------' +
        '-------'
      
        '<*REPRESENTANTES*>       | Aplica   únicamente  para  "Notificac' +
        'ión  de '
      
        '                         | Cesiones",  coloca  los  Representant' +
        'es  que '
      
        '                         | estén    configurados   para   esa   ' +
        'cesión, '
      '                         | separando estos por comas.'
      
        '----------------------------------------------------------------' +
        '-------'
      
        '<*TESTIGOS*>             | Aplica   únicamente  para  "Notificac' +
        'ión  de '
      
        '                         | Cesiones",  coloca  los Testigos  que' +
        '  estén'
      
        '                         | estén    configurados   para   esa   ' +
        'cesión, '
      '                         | separando estos por comas.'
      
        '----------------------------------------------------------------' +
        '-------')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 5
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
    Left = 537
    Top = 416
  end
end
