object WRFCIVA: TWRFCIVA
  Left = 348
  Top = 248
  Width = 317
  Height = 179
  Caption = 'Comprobante Fiscal'
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
  object Label1: TLabel
    Left = 48
    Top = 32
    Width = 36
    Height = 13
    Caption = 'R.F.C. :'
  end
  object Label2: TLabel
    Left = 48
    Top = 80
    Width = 58
    Height = 13
    Caption = 'Importe IVA:'
  end
  object idIVA: TInterEdit
    Left = 128
    Top = 74
    Width = 129
    Height = 22
    Prefijo = '1'
    Contrato = -1
    TipoReader = trDinero
    MaxLength = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 1
    UseReType = False
    UseSep = True
    UseDisplay = True
    PositiveOnly = True
    ColorPos = clBtnText
    ColorNeg = clRed
  end
  object bbCancelar: TBitBtn
    Left = 128
    Top = 120
    Width = 81
    Height = 25
    TabOrder = 3
    OnClick = bbCancelarClick
    Kind = bkCancel
  end
  object bbAceptar: TBitBtn
    Left = 224
    Top = 120
    Width = 81
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
    OnClick = bbAceptarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object edRFC: TInterEdit
    Left = 128
    Top = 26
    Width = 129
    Height = 23
    Prefijo = '1'
    Contrato = -1
    TipoReader = trTexto
    MaxLength = 13
    TabOrder = 0
    CharCase = ecUpperCase
    UseReType = False
    UseSep = True
    UseDisplay = False
    PositiveOnly = False
    ColorPos = clBtnText
    ColorNeg = clRed
  end
end
