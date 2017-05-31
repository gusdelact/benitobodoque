object frmDvCApDato: TfrmDvCApDato
  Left = 524
  Top = 267
  BorderStyle = bsDialog
  Caption = 'Depósitos a la Vista'
  ClientHeight = 203
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 162
    Align = alClient
    TabOrder = 0
    object lblSolicitaDato: TStaticText
      Left = 8
      Top = 9
      Width = 91
      Height = 20
      Caption = 'lblSolicitaDato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object mmCaptura: TMemo
      Left = 3
      Top = 32
      Width = 382
      Height = 121
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
    object edtCaptura: TEdit
      Left = 4
      Top = 32
      Width = 381
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnKeyPress = edtCapturaKeyPress
    end
    object cbCaptura: TComboBox
      Left = 5
      Top = 32
      Width = 379
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 3
    end
  end
  object btnButton: TPanel
    Left = 0
    Top = 162
    Width = 392
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnAceptar: TBitBtn
      Left = 285
      Top = 5
      Width = 100
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
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
    object btnCancela: TBitBtn
      Left = 8
      Top = 5
      Width = 100
      Height = 33
      Caption = 'Cancelar'
      TabOrder = 1
      Visible = False
      OnClick = btnCancelaClick
    end
  end
end
