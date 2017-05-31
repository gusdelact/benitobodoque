object WMsgError: TWMsgError
  Left = 321
  Top = 145
  Width = 631
  Height = 549
  Caption = 'Mensaje de error al enviar información al SIAR'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 623
    Height = 18
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 'Información Enviada'
    Color = 8421887
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 18
    Width = 623
    Height = 341
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 4
      Top = 4
      Width = 33
      Height = 13
      Caption = 'Fuente'
    end
    object Label2: TLabel
      Left = 4
      Top = 28
      Width = 44
      Height = 13
      Caption = 'Portafolio'
    end
    object Label3: TLabel
      Left = 4
      Top = 52
      Width = 27
      Height = 13
      Caption = 'Signo'
    end
    object Label4: TLabel
      Left = 4
      Top = 76
      Width = 82
      Height = 13
      Caption = 'Activo Financiero'
    end
    object Label5: TLabel
      Left = 4
      Top = 100
      Width = 65
      Height = 13
      Caption = 'Activo Básico'
    end
    object Label6: TLabel
      Left = 4
      Top = 124
      Width = 52
      Height = 13
      Caption = 'Tasa Fija 1'
    end
    object Label7: TLabel
      Left = 4
      Top = 148
      Width = 52
      Height = 13
      Caption = 'Tasa Fija 2'
    end
    object Label8: TLabel
      Left = 4
      Top = 172
      Width = 60
      Height = 13
      Caption = 'Plazo Cupón'
    end
    object Label9: TLabel
      Left = 4
      Top = 196
      Width = 84
      Height = 13
      Caption = 'Fact Amortización'
    end
    object Label10: TLabel
      Left = 4
      Top = 220
      Width = 57
      Height = 13
      Caption = 'Tipo Crédito'
    end
    object Label11: TLabel
      Left = 4
      Top = 244
      Width = 62
      Height = 13
      Caption = 'Portafolio Col'
    end
    object Label12: TLabel
      Left = 4
      Top = 268
      Width = 73
      Height = 13
      Caption = 'Fecha Posición'
    end
    object Label13: TLabel
      Left = 4
      Top = 292
      Width = 58
      Height = 13
      Caption = 'Fecha Inicio'
    end
    object Label14: TLabel
      Left = 4
      Top = 316
      Width = 91
      Height = 13
      Caption = 'Fecha Vencimiento'
    end
    object Label15: TLabel
      Left = 309
      Top = 4
      Width = 69
      Height = 13
      Caption = 'Fecha Emisión'
    end
    object Label16: TLabel
      Left = 309
      Top = 28
      Width = 35
      Height = 13
      Caption = 'Importe'
    end
    object Label17: TLabel
      Left = 309
      Top = 52
      Width = 89
      Height = 13
      Caption = 'Fact Capitalización'
    end
    object Label18: TLabel
      Left = 309
      Top = 76
      Width = 74
      Height = 13
      Caption = 'Tipo de Cambio'
    end
    object Label19: TLabel
      Left = 309
      Top = 100
      Width = 78
      Height = 13
      Caption = 'Porc. Quebranto'
    end
    object Label20: TLabel
      Left = 309
      Top = 124
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label21: TLabel
      Left = 309
      Top = 148
      Width = 80
      Height = 13
      Caption = 'Otros Accesorios'
    end
    object Label22: TLabel
      Left = 309
      Top = 172
      Width = 58
      Height = 13
      Caption = 'Tasa Cupón'
    end
    object Label23: TLabel
      Left = 309
      Top = 196
      Width = 62
      Height = 13
      Caption = 'No. Cupones'
    end
    object Label24: TLabel
      Left = 309
      Top = 220
      Width = 88
      Height = 13
      Caption = 'Cupon Emp Amort.'
    end
    object Label25: TLabel
      Left = 309
      Top = 244
      Width = 74
      Height = 13
      Caption = 'Núm. Amortizac'
    end
    object Label26: TLabel
      Left = 309
      Top = 268
      Width = 69
      Height = 13
      Caption = 'Tipo Garantias'
    end
    object Label27: TLabel
      Left = 309
      Top = 292
      Width = 46
      Height = 13
      Caption = 'Día Corte'
    end
    object edFuente: TEdit
      Left = 100
      Top = 4
      Width = 200
      Height = 21
      TabOrder = 0
    end
    object edPortafolio: TEdit
      Left = 100
      Top = 28
      Width = 200
      Height = 21
      TabOrder = 1
    end
    object edSigno: TEdit
      Left = 100
      Top = 52
      Width = 200
      Height = 21
      TabOrder = 2
    end
    object edActivoFinanciero: TEdit
      Left = 100
      Top = 76
      Width = 200
      Height = 21
      TabOrder = 3
    end
    object edActivoBasico: TEdit
      Left = 100
      Top = 100
      Width = 200
      Height = 21
      TabOrder = 4
    end
    object edTasaFija1: TEdit
      Left = 100
      Top = 124
      Width = 200
      Height = 21
      TabOrder = 5
    end
    object edTasaFija2: TEdit
      Left = 100
      Top = 148
      Width = 200
      Height = 21
      TabOrder = 6
    end
    object edPlazoCupon: TEdit
      Left = 100
      Top = 172
      Width = 200
      Height = 21
      TabOrder = 7
    end
    object edFactorAmoritizacion: TEdit
      Left = 100
      Top = 196
      Width = 200
      Height = 21
      TabOrder = 8
    end
    object edTipoCredito: TEdit
      Left = 100
      Top = 220
      Width = 200
      Height = 21
      TabOrder = 9
    end
    object edPortafolioCol: TEdit
      Left = 100
      Top = 244
      Width = 200
      Height = 21
      TabOrder = 10
    end
    object edFechaPosicion: TEdit
      Left = 100
      Top = 268
      Width = 200
      Height = 21
      TabOrder = 11
    end
    object edFechaInicio: TEdit
      Left = 100
      Top = 292
      Width = 200
      Height = 21
      TabOrder = 12
    end
    object edFechaVencimiento: TEdit
      Left = 100
      Top = 316
      Width = 200
      Height = 21
      TabOrder = 13
    end
    object edFechaEmision: TEdit
      Left = 405
      Top = 4
      Width = 200
      Height = 21
      TabOrder = 14
    end
    object edImporte: TEdit
      Left = 405
      Top = 28
      Width = 200
      Height = 21
      TabOrder = 15
    end
    object edFactCapitalizacion: TEdit
      Left = 405
      Top = 52
      Width = 200
      Height = 21
      TabOrder = 16
    end
    object edTipoCambio: TEdit
      Left = 405
      Top = 76
      Width = 200
      Height = 21
      TabOrder = 17
    end
    object edPorceQuebranto: TEdit
      Left = 405
      Top = 100
      Width = 200
      Height = 21
      TabOrder = 18
    end
    object edValor: TEdit
      Left = 405
      Top = 124
      Width = 200
      Height = 21
      TabOrder = 19
    end
    object edOtrosAccesorios: TEdit
      Left = 405
      Top = 148
      Width = 200
      Height = 21
      TabOrder = 20
    end
    object edTasaCupon: TEdit
      Left = 405
      Top = 172
      Width = 200
      Height = 21
      TabOrder = 21
    end
    object edNoCupones: TEdit
      Left = 405
      Top = 196
      Width = 200
      Height = 21
      TabOrder = 22
    end
    object edCuponEmpAmort: TEdit
      Left = 405
      Top = 220
      Width = 200
      Height = 21
      TabOrder = 23
    end
    object edNumAmortizaciones: TEdit
      Left = 405
      Top = 244
      Width = 200
      Height = 21
      TabOrder = 24
    end
    object edTipoGarantias: TEdit
      Left = 405
      Top = 268
      Width = 200
      Height = 21
      TabOrder = 25
    end
    object edDiaCorte: TEdit
      Left = 405
      Top = 292
      Width = 200
      Height = 21
      TabOrder = 26
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 359
    Width = 623
    Height = 18
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 'Mensaje de Error'
    Color = 8421631
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 0
    Top = 377
    Width = 623
    Height = 78
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 3
    object Label29: TLabel
      Left = 5
      Top = 5
      Width = 83
      Height = 13
      Caption = 'Mensaje de Error:'
    end
    object edMensaje: TEdit
      Left = 96
      Top = 6
      Width = 505
      Height = 65
      AutoSize = False
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 473
    Width = 623
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 4
    object Label28: TLabel
      Left = 56
      Top = 14
      Width = 137
      Height = 13
      Caption = '¿Desea intentarlo de nuevo?'
    end
    object btSalir: TBitBtn
      Left = 323
      Top = 8
      Width = 100
      Height = 25
      Hint = 'Abandona la captura'
      HelpContext = 2600
      Caption = '&No'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btSalirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
    end
    object sbAceptaAdi: TBitBtn
      Left = 196
      Top = 8
      Width = 100
      Height = 25
      HelpContext = 1205
      Caption = '&Si'
      TabOrder = 1
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
    object bbCancel: TBitBtn
      Left = 480
      Top = 8
      Width = 100
      Height = 25
      Caption = 'Abortar carga'
      TabOrder = 2
      OnClick = bbCancelClick
      Glyph.Data = {
        BE060000424DBE06000000000000360400002800000024000000120000000100
        0800000000008802000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
        A400000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303F8F80303030303030303030303030303030303FF03030303030303030303
        0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
        03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
        030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
        FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
        030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
        F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
        010101F8030303030303030303F8FF030303030303FFF8030303030303030303
        030101010101F80303030303030303030303F8FF0303030303F8030303030303
        0303030303F901010101F8030303030303030303030303F8FF030303F8030303
        0303030303030303F90101010101F8030303030303030303030303F803030303
        F8FF030303030303030303F9010101F8010101F803030303030303030303F803
        03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
        03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
        03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
        0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
        030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
        03030303030303030303030303030303030303030303030303F8F8F803030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303}
      NumGlyphs = 2
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 455
    Width = 623
    Height = 18
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 'Decisión'
    Color = 8421631
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
end
