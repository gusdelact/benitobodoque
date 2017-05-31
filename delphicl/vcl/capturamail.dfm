object Email: TEmail
  Left = 184
  Top = 280
  Width = 538
  Height = 172
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbCorreo: TLabel
    Left = 16
    Top = 12
    Width = 87
    Height = 13
    Caption = 'Correo Electronico'
  end
  object lbPass: TLabel
    Left = 16
    Top = 60
    Width = 52
    Height = 13
    Caption = 'Password: '
  end
  object lbCPass: TLabel
    Left = 16
    Top = 84
    Width = 99
    Height = 13
    Caption = 'Confirmar Password: '
  end
  object lbMsg: TLabel
    Left = 120
    Top = 0
    Width = 323
    Height = 26
    Caption = 
      'El contrato actual cuenta con un contrato Inet Asociado, se le d' +
      'ebe '#13#10'indicar al cliente que ahi debe capturar su password.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lbMensaje: TLabel
    Left = 72
    Top = 36
    Width = 397
    Height = 13
    Caption = 
      'El formato del Password es: LNNLLLLL donde L es letra o número y' +
      ' N es un número'
  end
  object edMail: TEdit
    Left = 120
    Top = 8
    Width = 361
    Height = 21
    TabOrder = 0
  end
  object btnAceptar: TButton
    Left = 168
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 1
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 272
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object mePass: TMaskEdit
    Left = 120
    Top = 56
    Width = 361
    Height = 21
    EditMask = 'A00AAAAA;1;_'
    MaxLength = 8
    TabOrder = 3
    Text = '        '
  end
  object meCPass: TMaskEdit
    Left = 120
    Top = 80
    Width = 361
    Height = 21
    EditMask = 'A00AAAAA;1;_'
    MaxLength = 8
    TabOrder = 4
    Text = '        '
  end
end
