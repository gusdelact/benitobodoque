object FGrFind: TFGrFind
  Left = 390
  Top = 333
  Width = 450
  Height = 87
  Caption = 'Palabra a Buscar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edBuscar: TEdit
    Left = 2
    Top = 2
    Width = 438
    Height = 21
    TabOrder = 0
    OnKeyDown = edBuscarKeyDown
  end
  object btBuscar: TButton
    Left = 283
    Top = 25
    Width = 75
    Height = 25
    Caption = '&Buscar'
    ModalResult = 1
    TabOrder = 1
    OnClick = btBuscarClick
  end
  object btCancela: TButton
    Left = 364
    Top = 25
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
    OnClick = btCancelaClick
  end
end
