object WCtrlInt: TWCtrlInt
  Left = 378
  Top = 182
  Width = 540
  Height = 336
  Caption = 'Información de Control Interno'
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
  object lbTX_COMENTARIO: TLabel
    Left = 23
    Top = 172
    Width = 53
    Height = 13
    Caption = 'Comentario'
  end
  object lbTX_REFERENCIA: TLabel
    Left = 23
    Top = 10
    Width = 52
    Height = 13
    Caption = 'Referencia'
  end
  object lbTX_INF_FISCAL: TLabel
    Left = 23
    Top = 90
    Width = 42
    Height = 13
    Caption = 'Inf Fiscal'
  end
  object Cerrar: TButton
    Left = 232
    Top = 263
    Width = 75
    Height = 25
    Caption = 'Cerrar'
    TabOrder = 0
    OnClick = CerrarClick
  end
  object edTX_REFERENCIA: TMemo
    Left = 23
    Top = 26
    Width = 485
    Height = 57
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object edTX_COMENTARIO: TMemo
    Left = 23
    Top = 189
    Width = 485
    Height = 57
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object edTX_INF_FISCAL: TMemo
    Left = 23
    Top = 107
    Width = 485
    Height = 57
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object qconsulta: TQuery
    SQL.Strings = (
      'select * from dv_transaccion_int'
      'where id_transaccion = :idtrn')
    Left = 368
    Top = 120
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idtrn'
        ParamType = ptInput
      end>
  end
end
