object WValidPwd: TWValidPwd
  Left = 439
  Top = 264
  BorderStyle = bsSingle
  Caption = 'Confirmación'
  ClientHeight = 119
  ClientWidth = 217
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnAceptar: TButton
    Left = 55
    Top = 88
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    TabOrder = 1
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 135
    Top = 88
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object GroupBox1: TGroupBox
    Left = 7
    Top = 2
    Width = 202
    Height = 80
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 18
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label2: TLabel
      Left = 9
      Top = 49
      Width = 54
      Height = 13
      Caption = 'Contraseña'
    end
    object edPASSWORD: TMaskEdit
      Left = 74
      Top = 44
      Width = 117
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      OnKeyDown = edCVE_USUARIOKeyDown
    end
    object edCVE_USUARIO: TEdit
      Left = 74
      Top = 15
      Width = 116
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyDown = edCVE_USUARIOKeyDown
    end
  end
end
