object wCrR4MapRe: TwCrR4MapRe
  Left = 362
  Top = 168
  Width = 451
  Height = 314
  Caption = 'Edición de registro de Reporte R04A'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlForma: TPanel
    Left = 5
    Top = 7
    Width = 420
    Height = 258
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 96
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Clave de Concepto:'
    end
    object Label4: TLabel
      Left = 16
      Top = 126
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Descripción:'
    end
    object Label5: TLabel
      Left = 16
      Top = 188
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Concepto:'
    end
    object Label6: TLabel
      Left = 16
      Top = 148
      Width = 94
      Height = 26
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Clasificación Contable:'
      WordWrap = True
    end
    object gbDatosGenerales: TGroupBox
      Left = 16
      Top = 8
      Width = 377
      Height = 73
      Caption = 'Datos Generales'
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 73
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Reporte:'
      end
      object Label2: TLabel
        Left = 8
        Top = 44
        Width = 73
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Sección:'
      end
      object lblTipoReporte: TLabel
        Left = 88
        Top = 25
        Width = 69
        Height = 13
        Caption = 'lblTipoReporte'
      end
      object lblSeccion: TLabel
        Left = 88
        Top = 45
        Width = 49
        Height = 13
        Caption = 'lblSeccion'
      end
    end
    object PnDatos: TPanel
      Left = 1
      Top = 236
      Width = 418
      Height = 21
      Align = alBottom
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
        Left = 256
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
        Left = 256
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
        Left = 320
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
        Left = 320
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
    object edtCveConcepto: TEdit
      Tag = -1
      Left = 116
      Top = 91
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edtDescripcion: TEdit
      Tag = 18
      Left = 116
      Top = 122
      Width = 269
      Height = 21
      MaxLength = 200
      TabOrder = 3
    end
    object edtConcepto: TEdit
      Tag = -1
      Left = 116
      Top = 184
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object edtTipoReporte: TEdit
      Tag = -1
      Left = 280
      Top = 90
      Width = 105
      Height = 21
      TabOrder = 5
      Visible = False
    end
    object edtCveClasContab: TEdit
      Tag = 18
      Left = 116
      Top = 153
      Width = 121
      Height = 21
      MaxLength = 20
      TabOrder = 6
    end
    object edtSeccion: TEdit
      Tag = -1
      Left = 320
      Top = 152
      Width = 81
      Height = 21
      TabOrder = 7
      Visible = False
    end
    object edtOrden: TEdit
      Tag = -1
      Left = 320
      Top = 176
      Width = 81
      Height = 21
      TabOrder = 8
      Visible = False
    end
    object edtNivel: TEdit
      Tag = -1
      Left = 320
      Top = 200
      Width = 81
      Height = 21
      TabOrder = 9
      Visible = False
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
    Left = 173
    Top = 7
  end
end
