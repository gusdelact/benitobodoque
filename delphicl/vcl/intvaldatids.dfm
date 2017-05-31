object FrmValDatIds: TFrmValDatIds
  Left = 429
  Top = 121
  Width = 581
  Height = 200
  Caption = 'Personas semejantes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lvwPersonas: TListView
    Left = 2
    Top = 2
    Width = 569
    Height = 163
    Color = clWhite
    Columns = <
      item
        Caption = 'Id. Persona'
        Width = 85
      end
      item
        Caption = 'Nombre'
        Width = 300
      end
      item
        Caption = 'Sexo'
        Width = 80
      end
      item
        Caption = 'F. Nacimiento'
        Width = 80
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object InterForma: TInterForma
    IsMain = True
    OnSalir = InterFormaSalir
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
    ShowGrid = False
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 4
    Top = 23
  end
end
