object WMsgConfirm: TWMsgConfirm
  Left = 332
  Top = 210
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 
    '                                                     C O N F I R' +
    ' M A C I Ó N ....'
  ClientHeight = 128
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnMensaje: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    Caption = '!!!! PROCESOS CONCLUIDOS !!!!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object bbAutorizar: TBitBtn
    Tag = 17
    Left = 136
    Top = 94
    Width = 97
    Height = 25
    Caption = '&Continuar'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TabStop = False
    OnClick = bbAutorizarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
      3333333337773F333333333330FFF03333333333733373F3333333330FFFFF03
      33333337F33337F3333333330FFFFF0333333337F33337F3333333330FFFFF03
      33333337FFFFF7F3333333330777770333333337777777F3333333330FF7FF03
      33333337F37F37F3333333330FF7FF03333333373F7FF7333333333330000033
      33333333777773FFF33333333330330007333333337F37777F33333333303033
      307333333373733377F33333333303333303333333F7F33337F3333333330733
      330333333F777F3337F333333370307330733333F77377FF7733333337033300
      0733333F77333777733333337033333333333337733333333333}
    NumGlyphs = 2
  end
end
