object WCrEmailEnvio: TWCrEmailEnvio
  Left = 0
  Top = 0
  Width = 768
  Height = 410
  Caption = 'Catálogo de Cr Email Envio'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
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
    FormaEstilo = feAutomatico
    CanEdit = False
    IsNewData = False
    Version = 20
    HideButtons = False
    ShowError = False
    CentrarForma = True
    Left = 10
    Top = 10
  end
  object lbNUM_FOLIO: TLabel
    Left = 8
    Top = 10
    Width = 62
    Height = 13
    Caption = 'Número Folio'
    Visible = True
  end
  object edNUM_FOLIO: TEdit
    Tag = 50
    Left = 8
    Top = 26
    Width = 200
    Height = 21
    CharCase = ECUPPERCASE
  end
  object lbID_CREDITO: TLabel
    Left = 8
    Top = 50
    Width = 88
    Height = 13
    Caption = 'Número de Credito'
    Visible = True
  end
  object edID_CREDITO: TEdit
    Tag = 50
    Left = 8
    Top = 66
    Width = 200
    Height = 21
    CharCase = ECUPPERCASE
  end
  object lbF_ENVIO: TLabel
    Left = 8
    Top = 90
    Width = 60
    Height = 13
    Caption = 'Fecha Envio'
    Visible = True
  end
  object dtpF_ENVIO: TInterDateTimePicker
    Left = 98
    Top = 106
    Width = 21
    Height = 21
    Tag = 18
    Formato = dfDate
    Edit = edF_ENVIO
  end
  object edF_ENVIO: TEdit
    Tag = 18
    Left = 8
    Top = 106
    Width = 90
    Height = 21
    CharCase = ECUPPERCASE
  end
  object lbID_TIPO_EMAIL: TLabel
    Left = 8
    Top = 130
    Width = 104
    Height = 13
    Caption = 'Número de Tipo Email'
    Visible = True
  end
  object edID_TIPO_EMAIL: TEdit
    Tag = 18
    Left = 8
    Top = 146
    Width = 96
    Height = 21
    CharCase = ECUPPERCASE
  end
  object lbTITULO_FINAL: TLabel
    Left = 8
    Top = 170
    Width = 51
    Height = 13
    Caption = 'Titulo Final'
    Visible = True
  end
  object edTITULO_FINAL: TEdit
    Tag = 18
    Left = 8
    Top = 186
    Width = 752
    Height = 21
    CharCase = ECUPPERCASE
  end
  object lbTEXTO_FINAL: TLabel
    Left = 8
    Top = 210
    Width = 52
    Height = 13
    Caption = 'Texto Final'
    Visible = True
  end
  object edTEXTO_FINAL: TEdit
    Tag = 18
    Left = 8
    Top = 226
    Width = 752
    Height = 21
    CharCase = ECUPPERCASE
  end
  object lbDESTINATARIO: TLabel
    Left = 8
    Top = 250
    Width = 56
    Height = 13
    Caption = 'Destinatario'
    Visible = True
  end
  object edDESTINATARIO: TEdit
    Tag = 18
    Left = 8
    Top = 266
    Width = 752
    Height = 21
    CharCase = ECUPPERCASE
  end
  object lbCVE_USU_ENVIO: TLabel
    Left = 8
    Top = 290
    Width = 94
    Height = 13
    Caption = 'Clave de Usu Envio'
    Visible = True
  end
  object edCVE_USU_ENVIO: TEdit
    Tag = 18
    Left = 8
    Top = 306
    Width = 128
    Height = 21
    CharCase = ECUPPERCASE
  end
  object lbSIT_ENVIO_EMAIL: TLabel
    Left = 8
    Top = 330
    Width = 102
    Height = 13
    Caption = 'Situación Envio Email'
    Visible = True
  end
  object edSIT_ENVIO_EMAIL: TEdit
    Tag = 18
    Left = 8
    Top = 346
    Width = 32
    Height = 21
    CharCase = ECUPPERCASE
  end
end
