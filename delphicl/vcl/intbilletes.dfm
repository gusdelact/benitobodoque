object WBillete: TWBillete
  Left = 318
  Top = 146
  Width = 291
  Height = 343
  Caption = 'Denominación de Billetes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 283
    Height = 309
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 38
      Width = 129
      Height = 13
      Caption = 'Importe en Billetes 1   Dólar'
    end
    object Label2: TLabel
      Left = 7
      Top = 68
      Width = 129
      Height = 13
      Caption = 'Importe en Billetes 2   Dólar'
    end
    object Label3: TLabel
      Left = 7
      Top = 98
      Width = 129
      Height = 13
      Caption = 'Importe en Billetes 5   Dólar'
    end
    object Label4: TLabel
      Left = 7
      Top = 128
      Width = 132
      Height = 13
      Caption = 'Importe en Billetes 10  Dólar'
    end
    object Label5: TLabel
      Left = 7
      Top = 158
      Width = 132
      Height = 13
      Caption = 'Importe en Billetes 20  Dólar'
    end
    object Label6: TLabel
      Left = 7
      Top = 188
      Width = 132
      Height = 13
      Caption = 'Importe en Billetes 50  Dólar'
    end
    object Label7: TLabel
      Left = 7
      Top = 218
      Width = 135
      Height = 13
      Caption = 'Importe en Billetes 100 Dólar'
    end
    object Label8: TLabel
      Left = 8
      Top = 248
      Width = 120
      Height = 13
      Caption = 'Importe en Moneda Dólar'
    end
    object Label9: TLabel
      Left = 8
      Top = 8
      Width = 129
      Height = 13
      Caption = 'Importe a Pagar                  '
    end
    object sbAceptaAdi: TBitBtn
      Left = 175
      Top = 277
      Width = 97
      Height = 25
      HelpContext = 1205
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = sbAceptaAdiClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF5555555555555A055555
        55555555588FF55555555555AAA05555555555558888F55555555555AAA05555
        555555558888FF555555555AAAAA05555555555888888F55555555AAAAAA0555
        5555558888888FF5555558AA05AAA05555555888858888F555558A05555AA055
        55558885555888FF55555555555AAA05555555555558888F555555555555AA05
        555555555555888FF555555555555AA05555555555555888FF5555555555558A
        05555555555555888FF5555555555558A05555555555555888FF555555555555
        5AA0555555555555588855555555555555555555555555555555}
      NumGlyphs = 2
    end
    object edImporte: TInterEdit
      Left = 150
      Top = 5
      Width = 121
      Height = 21
      Prefijo = '1'
      Contrato = -1
      TipoReader = trTexto
      DisplayMask = '################.0000'
      MaxLength = 10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TabOrder = 1
      ReadOnly = True
      UseReType = False
      UseSep = True
      UseDisplay = False
      PositiveOnly = True
      ColorPos = clBtnText
      ColorNeg = clRed
    end
    object ed1: TMaskEdit
      Left = 150
      Top = 34
      Width = 121
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 2
    end
    object ed2: TMaskEdit
      Left = 150
      Top = 64
      Width = 121
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 3
    end
    object ed5: TMaskEdit
      Left = 150
      Top = 94
      Width = 121
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 4
    end
    object ed10: TMaskEdit
      Left = 150
      Top = 124
      Width = 121
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 5
    end
    object ed20: TMaskEdit
      Left = 150
      Top = 154
      Width = 121
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 6
    end
    object ed50: TMaskEdit
      Left = 150
      Top = 184
      Width = 121
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 7
    end
    object ed100: TMaskEdit
      Left = 150
      Top = 214
      Width = 121
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 8
    end
    object edM: TMaskEdit
      Left = 150
      Top = 244
      Width = 121
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 9
    end
  end
  object Query1: TQuery
    Left = 304
    Top = 32
  end
end
