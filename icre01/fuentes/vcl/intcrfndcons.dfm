object WCrFndCons: TWCrFndCons
  Left = 453
  Top = 125
  Width = 799
  Height = 603
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Detalle de Crédito / Periodos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblPeriodos: TLabel
    Left = 2
    Top = 494
    Width = 775
    Height = 15
    AutoSize = False
    Caption = '||'
    Color = 12320767
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object shpLiquidados: TShape
    Left = 232
    Top = 518
    Width = 10
    Height = 10
    Brush.Color = clBlue
    Pen.Color = clBlue
  end
  object lblLiquidados: TLabel
    Left = 246
    Top = 517
    Width = 51
    Height = 13
    Caption = 'Liquidados'
  end
  object lblActivos: TLabel
    Left = 23
    Top = 517
    Width = 35
    Height = 13
    Caption = 'Activos'
  end
  object shpActivos: TShape
    Left = 7
    Top = 518
    Width = 10
    Height = 10
    Brush.Color = clGreen
    Pen.Color = clGreen
  end
  object lblNoAutorizados: TLabel
    Left = 80
    Top = 517
    Width = 72
    Height = 13
    Caption = 'No Autorizados'
  end
  object shpNoAutorizados: TShape
    Left = 63
    Top = 518
    Width = 10
    Height = 10
    Brush.Color = clBlack
  end
  object lblCancelados: TLabel
    Left = 321
    Top = 517
    Width = 56
    Height = 13
    Caption = 'Cancelados'
  end
  object shpCancelados: TShape
    Left = 304
    Top = 518
    Width = 10
    Height = 10
    Brush.Color = clGray
    Pen.Color = clGray
  end
  object Shape56: TShape
    Left = 160
    Top = 518
    Width = 9
    Height = 10
    Brush.Color = clRed
    Pen.Color = clRed
  end
  object Label44: TLabel
    Left = 174
    Top = 517
    Width = 52
    Height = 13
    Caption = 'Impagados'
  end
  object pgctrlConsulta: TPageControl
    Left = 1
    Top = 105
    Width = 776
    Height = 342
    ActivePage = tbshtCapital
    TabOrder = 0
    OnChange = pgctrlConsultaChange
    object tbshtCapital: TTabSheet
      Caption = 'Capital'
      object Shape1: TShape
        Left = 75
        Top = 5
        Width = 32
        Height = 33
        Brush.Color = 12320767
      end
      object Label1: TLabel
        Left = 77
        Top = 17
        Width = 28
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Prog.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape10: TShape
        Left = 6
        Top = 5
        Width = 70
        Height = 33
        Brush.Color = 12320767
      end
      object Label9: TLabel
        Left = 8
        Top = 17
        Width = 65
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Ent. Desc.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape15: TShape
        Left = 106
        Top = 5
        Width = 28
        Height = 36
        Brush.Color = 12320767
      end
      object Label13: TLabel
        Left = 107
        Top = 17
        Width = 27
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'Pdo.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object PnlTitulos: TPanel
        Left = 135
        Top = 5
        Width = 429
        Height = 33
        BevelOuter = bvNone
        TabOrder = 0
        object shp5: TShape
          Left = -1
          Top = 16
          Width = 67
          Height = 17
          Brush.Color = 12320767
        end
        object shp4: TShape
          Left = -1
          Top = 0
          Width = 197
          Height = 17
          Brush.Color = 12320767
        end
        object shp6: TShape
          Left = 65
          Top = 16
          Width = 66
          Height = 17
          Brush.Color = 12320767
        end
        object shp7: TShape
          Left = 130
          Top = 16
          Width = 66
          Height = 17
          Brush.Color = 12320767
        end
        object shp9: TShape
          Left = 224
          Top = 0
          Width = 151
          Height = 17
          Brush.Color = 12320767
        end
        object shp10: TShape
          Left = 224
          Top = 16
          Width = 76
          Height = 17
          Brush.Color = 12320767
        end
        object Shape8: TShape
          Left = 299
          Top = 16
          Width = 76
          Height = 17
          Brush.Color = 12320767
        end
        object shp8: TShape
          Left = 195
          Top = 0
          Width = 30
          Height = 33
          Brush.Color = 12320767
        end
        object Shape17: TShape
          Left = 374
          Top = 0
          Width = 35
          Height = 33
          Brush.Color = 12320767
        end
        object lblFecha: TLabel
          Left = 1
          Top = 2
          Width = 193
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Fechas'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblVencimiento: TLabel
          Left = 1
          Top = 18
          Width = 62
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Vencimiento'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblProgramado: TLabel
          Left = 68
          Top = 18
          Width = 62
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Programado'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblPago: TLabel
          Left = 132
          Top = 18
          Width = 62
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Pago'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblImpProgramado: TLabel
          Left = 230
          Top = 18
          Width = 68
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Programado'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblImpPagado: TLabel
          Left = 303
          Top = 18
          Width = 68
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Pagado'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblImpCapital: TLabel
          Left = 227
          Top = 2
          Width = 142
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Importe Capital'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblSituacion: TLabel
          Left = 377
          Top = 10
          Width = 25
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Sit.'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
      end
      object strgrdCapital: TStringGrid
        Left = 1
        Top = 37
        Width = 610
        Height = 272
        ColCount = 1
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ScrollBars = ssVertical
        TabOrder = 1
        OnDrawCell = strgrdCapitalDrawCell
        OnKeyDown = strgrdCapitalKeyDown
      end
    end
    object tbshtInteres: TTabSheet
      Caption = 'Interés'
      ImageIndex = 1
      object Shape2: TShape
        Left = 106
        Top = 5
        Width = 28
        Height = 57
        Brush.Color = 12320767
      end
      object Label2: TLabel
        Left = 105
        Top = 25
        Width = 30
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'Pdo.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape12: TShape
        Left = 75
        Top = 5
        Width = 32
        Height = 57
        Brush.Color = 12320767
      end
      object Shape14: TShape
        Left = 6
        Top = 5
        Width = 70
        Height = 57
        Brush.Color = 12320767
      end
      object Label11: TLabel
        Left = 8
        Top = 25
        Width = 65
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Ent. Desc.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label12: TLabel
        Left = 74
        Top = 25
        Width = 31
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Prog.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object strgrdInteres: TStringGrid
        Left = 2
        Top = 62
        Width = 610
        Height = 246
        ColCount = 1
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ScrollBars = ssVertical
        TabOrder = 0
        OnDrawCell = strgrdCapitalDrawCell
        OnKeyDown = strgrdCapitalKeyDown
        OnSelectCell = strgrdInteresSelectCell
        OnTopLeftChanged = strgrdInteresTopLeftChanged
      end
      object pnlTitulosInteres: TPanel
        Left = 133
        Top = 5
        Width = 476
        Height = 57
        BevelOuter = bvNone
        TabOrder = 1
        object Shape3: TShape
          Left = 0
          Top = 29
          Width = 67
          Height = 28
          Brush.Color = 12320767
        end
        object Shape4: TShape
          Left = 0
          Top = 0
          Width = 197
          Height = 30
          Brush.Color = 12320767
        end
        object Shape5: TShape
          Left = 66
          Top = 29
          Width = 66
          Height = 28
          Brush.Color = 12320767
        end
        object Shape6: TShape
          Left = 131
          Top = 29
          Width = 66
          Height = 28
          Brush.Color = 12320767
        end
        object Shape7: TShape
          Left = 239
          Top = 0
          Width = 151
          Height = 30
          Brush.Color = 12320767
        end
        object Shape9: TShape
          Left = 239
          Top = 29
          Width = 76
          Height = 28
          Brush.Color = 12320767
        end
        object Shape11: TShape
          Left = 314
          Top = 29
          Width = 76
          Height = 28
          Brush.Color = 12320767
        end
        object Shape13: TShape
          Left = 196
          Top = 0
          Width = 45
          Height = 57
          Brush.Color = 12320767
        end
        object Label3: TLabel
          Left = 2
          Top = 6
          Width = 193
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Fechas'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label4: TLabel
          Left = 2
          Top = 32
          Width = 62
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Vencimiento'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label5: TLabel
          Left = 69
          Top = 31
          Width = 62
          Height = 15
          Alignment = taCenter
          AutoSize = False
          Caption = 'Programado'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label6: TLabel
          Left = 133
          Top = 32
          Width = 62
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Pago'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label7: TLabel
          Left = 245
          Top = 32
          Width = 68
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Programado'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label8: TLabel
          Left = 318
          Top = 32
          Width = 68
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Pagado'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblImpInteres: TLabel
          Left = 242
          Top = 6
          Width = 143
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Importe Interés'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Shape41: TShape
          Left = 389
          Top = 0
          Width = 36
          Height = 57
          Brush.Color = 12320767
        end
        object Label31: TLabel
          Left = 392
          Top = 10
          Width = 33
          Height = 41
          Alignment = taCenter
          AutoSize = False
          Caption = 'Aplica'#13#10'Finan. Adic.'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object shp17: TShape
          Left = 424
          Top = 0
          Width = 35
          Height = 57
          Brush.Color = 12320767
        end
        object Label10: TLabel
          Left = 430
          Top = 23
          Width = 25
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Sit.'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
      end
    end
    object tbshtComision: TTabSheet
      Caption = 'Comisión'
      ImageIndex = 2
      object Shape27: TShape
        Left = 158
        Top = 21
        Width = 67
        Height = 17
        Brush.Color = 12320767
      end
      object Shape28: TShape
        Left = 158
        Top = 5
        Width = 197
        Height = 17
        Brush.Color = 12320767
      end
      object shp3: TShape
        Left = 100
        Top = 5
        Width = 59
        Height = 33
        Brush.Color = 12320767
      end
      object lblDescripcion: TLabel
        Left = 104
        Top = 17
        Width = 52
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Desc.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape29: TShape
        Left = 224
        Top = 21
        Width = 66
        Height = 17
        Brush.Color = 12320767
      end
      object Shape30: TShape
        Left = 289
        Top = 21
        Width = 66
        Height = 17
        Brush.Color = 12320767
      end
      object Shape31: TShape
        Left = 397
        Top = 5
        Width = 151
        Height = 17
        Brush.Color = 12320767
      end
      object Shape32: TShape
        Left = 397
        Top = 21
        Width = 76
        Height = 17
        Brush.Color = 12320767
      end
      object Shape33: TShape
        Left = 472
        Top = 21
        Width = 76
        Height = 17
        Brush.Color = 12320767
      end
      object Shape35: TShape
        Left = 354
        Top = 5
        Width = 45
        Height = 33
        Brush.Color = 12320767
      end
      object Shape40: TShape
        Left = 547
        Top = 5
        Width = 50
        Height = 33
        Brush.Color = 12320767
      end
      object Label19: TLabel
        Left = 160
        Top = 7
        Width = 193
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Fechas'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label20: TLabel
        Left = 160
        Top = 23
        Width = 62
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Vencimiento'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label21: TLabel
        Left = 227
        Top = 23
        Width = 62
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Programado'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label22: TLabel
        Left = 291
        Top = 23
        Width = 62
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Pago'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label23: TLabel
        Left = 403
        Top = 23
        Width = 68
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Programado'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label24: TLabel
        Left = 476
        Top = 23
        Width = 68
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Pagado'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object lblImpComision: TLabel
        Left = 400
        Top = 7
        Width = 145
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Importe Comisión'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label30: TLabel
        Left = 558
        Top = 15
        Width = 25
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Sit.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape16: TShape
        Left = 1
        Top = 5
        Width = 70
        Height = 33
        Brush.Color = 12320767
      end
      object Label14: TLabel
        Left = 8
        Top = 17
        Width = 57
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Ent. Desc.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape20: TShape
        Left = 70
        Top = 5
        Width = 32
        Height = 33
        Brush.Color = 12320767
      end
      object Label17: TLabel
        Left = 73
        Top = 17
        Width = 27
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Prog.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object strgrdComision: TStringGrid
        Left = 0
        Top = 37
        Width = 610
        Height = 272
        ColCount = 1
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ParentShowHint = False
        ScrollBars = ssVertical
        ShowHint = True
        TabOrder = 0
        OnDrawCell = strgrdCapitalDrawCell
        OnKeyDown = strgrdCapitalKeyDown
      end
    end
    object tbshtDocumentos: TTabSheet
      Caption = 'Documentos'
      ImageIndex = 4
      object Shape22: TShape
        Left = 637
        Top = 23
        Width = 76
        Height = 17
        Brush.Color = 12320767
      end
      object Shape26: TShape
        Left = 564
        Top = 23
        Width = 76
        Height = 17
        Brush.Color = 12320767
      end
      object Shape50: TShape
        Left = 220
        Top = 7
        Width = 196
        Height = 17
        Brush.Color = 12320767
      end
      object Shape25: TShape
        Left = 415
        Top = 23
        Width = 76
        Height = 17
        Brush.Color = 12320767
      end
      object Shape24: TShape
        Left = 415
        Top = 7
        Width = 298
        Height = 17
        Brush.Color = 12320767
      end
      object Shape34: TShape
        Left = 350
        Top = 23
        Width = 66
        Height = 17
        Brush.Color = 12320767
      end
      object Shape36: TShape
        Left = 285
        Top = 23
        Width = 66
        Height = 17
        Brush.Color = 12320767
      end
      object Shape37: TShape
        Left = 220
        Top = 23
        Width = 66
        Height = 17
        Brush.Color = 12320767
      end
      object Label25: TLabel
        Left = 222
        Top = 25
        Width = 62
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Compra'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label26: TLabel
        Left = 288
        Top = 25
        Width = 62
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Programado'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape21: TShape
        Left = 490
        Top = 23
        Width = 76
        Height = 17
        Brush.Color = 12320767
      end
      object lbl4: TLabel
        Left = 644
        Top = 25
        Width = 68
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'lbl4'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape23: TShape
        Left = 712
        Top = 7
        Width = 20
        Height = 33
        Brush.Color = 12320767
      end
      object Label27: TLabel
        Left = 714
        Top = 17
        Width = 16
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Sit.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label28: TLabel
        Left = 414
        Top = 9
        Width = 298
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Importe'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object lbl1: TLabel
        Left = 420
        Top = 25
        Width = 68
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'lbl1'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object lbl2: TLabel
        Left = 494
        Top = 25
        Width = 68
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'lbl2'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object lbl3: TLabel
        Left = 569
        Top = 25
        Width = 68
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'lbl3'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label29: TLabel
        Left = 352
        Top = 25
        Width = 62
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Pago'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape38: TShape
        Left = 172
        Top = 7
        Width = 50
        Height = 33
        Brush.Color = 12320767
      end
      object Label39: TLabel
        Left = 174
        Top = 11
        Width = 46
        Height = 27
        Alignment = taCenter
        AutoSize = False
        Caption = 'Tipo de'#13#10'Interés'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape39: TShape
        Left = 6
        Top = 7
        Width = 167
        Height = 33
        Brush.Color = 12320767
      end
      object Label42: TLabel
        Left = 7
        Top = 17
        Width = 165
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Identificador de  Documento'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label43: TLabel
        Left = 220
        Top = 9
        Width = 194
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Fecha'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object strgrdDocumentos1: TStringGrid
        Left = 6
        Top = 39
        Width = 410
        Height = 252
        ColCount = 1
        DefaultColWidth = 165
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ScrollBars = ssNone
        TabOrder = 0
        OnDrawCell = strgrdCapitalDrawCell
        OnKeyDown = strgrdCapitalKeyDown
      end
      object strgrdDocumentos2: TStringGrid
        Left = 413
        Top = 39
        Width = 303
        Height = 242
        ColCount = 1
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
        ScrollBars = ssHorizontal
        TabOrder = 1
        OnDrawCell = strgrdCapitalDrawCell
        OnKeyDown = strgrdCapitalKeyDown
      end
      object strgrdDocumentos3: TStringGrid
        Left = 715
        Top = 39
        Width = 41
        Height = 252
        ColCount = 1
        DefaultColWidth = 17
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ScrollBars = ssVertical
        TabOrder = 2
        OnDrawCell = strgrdCapitalDrawCell
        OnKeyDown = strgrdCapitalKeyDown
      end
    end
    object tbshtFinanciamiento: TTabSheet
      Caption = 'Financiamiento'
      ImageIndex = 4
      object Shape42: TShape
        Left = 100
        Top = 5
        Width = 35
        Height = 33
        Brush.Color = 12320767
      end
      object Label32: TLabel
        Left = 1
        Top = 15
        Width = 36
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Pdo.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape18: TShape
        Left = 1
        Top = 5
        Width = 70
        Height = 33
        Brush.Color = 12320767
      end
      object Shape19: TShape
        Left = 70
        Top = 5
        Width = 32
        Height = 33
        Brush.Color = 12320767
      end
      object Label15: TLabel
        Left = 73
        Top = 17
        Width = 27
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Prog.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label16: TLabel
        Left = 8
        Top = 17
        Width = 57
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Ent. Desc.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label18: TLabel
        Left = 105
        Top = 17
        Width = 30
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'Pdo.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object strgrdFinanciamiento: TStringGrid
        Left = 1
        Top = 36
        Width = 610
        Height = 272
        ColCount = 1
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ScrollBars = ssVertical
        TabOrder = 0
        OnDrawCell = strgrdCapitalDrawCell
        OnKeyDown = strgrdCapitalKeyDown
      end
      object Panel2: TPanel
        Left = 134
        Top = 5
        Width = 486
        Height = 33
        BevelOuter = bvNone
        TabOrder = 1
        object Shape43: TShape
          Left = 0
          Top = 16
          Width = 67
          Height = 17
          Brush.Color = 12320767
        end
        object Shape44: TShape
          Left = 0
          Top = 0
          Width = 197
          Height = 17
          Brush.Color = 12320767
        end
        object Shape45: TShape
          Left = 66
          Top = 16
          Width = 66
          Height = 17
          Brush.Color = 12320767
        end
        object Shape46: TShape
          Left = 131
          Top = 16
          Width = 66
          Height = 17
          Brush.Color = 12320767
        end
        object Shape47: TShape
          Left = 239
          Top = 0
          Width = 151
          Height = 17
          Brush.Color = 12320767
        end
        object Shape48: TShape
          Left = 239
          Top = 16
          Width = 76
          Height = 17
          Brush.Color = 12320767
        end
        object Shape49: TShape
          Left = 314
          Top = 16
          Width = 76
          Height = 17
          Brush.Color = 12320767
        end
        object Shape51: TShape
          Left = 196
          Top = 0
          Width = 45
          Height = 33
          Brush.Color = 12320767
        end
        object Shape52: TShape
          Left = 389
          Top = 0
          Width = 78
          Height = 33
          Brush.Color = 12320767
        end
        object Label33: TLabel
          Left = 2
          Top = 2
          Width = 193
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Fechas'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label34: TLabel
          Left = 2
          Top = 18
          Width = 62
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Vencimiento'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label35: TLabel
          Left = 69
          Top = 18
          Width = 62
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Programado'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label36: TLabel
          Left = 133
          Top = 18
          Width = 62
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Pago'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label37: TLabel
          Left = 245
          Top = 18
          Width = 68
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Programado'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label38: TLabel
          Left = 318
          Top = 18
          Width = 68
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Pagado'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label40: TLabel
          Left = 242
          Top = 2
          Width = 143
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Importe Financiamiento'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label41: TLabel
          Left = 420
          Top = 10
          Width = 25
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Sit.'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
      end
    end
  end
  object tbstSituacion: TTabSet
    Left = 0
    Top = 468
    Width = 777
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Tabs.Strings = (
      'Todos'
      'Vigentes'
      'Liquidados'
      'Por Activar'
      'Cancelados')
    TabIndex = 0
    OnChange = tbstSituacionChange
  end
  object icpCONTRATO: TInterCtoPanel
    Left = 5
    Top = 2
    Width = 500
    Height = 45
    Hint = 'Información del Contrato'
    Lenguaje = 0
    ShowLenguaje = False
    ShowEnviarEMail = False
  end
  object PnDatos: TPanel
    Left = -11
    Top = 538
    Width = 788
    Height = 21
    TabOrder = 3
    object lbEmpresa: TLabel
      Left = 11
      Top = 2
      Width = 42
      Height = 8
      Caption = 'EMPRESA :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbUsuario: TLabel
      Left = 11
      Top = 9
      Width = 44
      Height = 8
      Caption = 'USUARIO : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbFecha: TLabel
      Left = 208
      Top = 2
      Width = 50
      Height = 8
      Caption = 'FECHA HOY :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbPerfil: TLabel
      Left = 208
      Top = 9
      Width = 33
      Height = 8
      Caption = 'PERFIL :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDUsuario: TLabel
      Left = 75
      Top = 9
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDPerfil: TLabel
      Left = 272
      Top = 9
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDFecha: TLabel
      Left = 272
      Top = 2
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDEmpresa: TLabel
      Left = 75
      Top = 2
      Width = 6
      Height = 8
      Caption = ' |'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -7
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 447
    Width = 777
    Height = 22
    TabOrder = 4
    object btnRefrescar: TBitBtn
      Left = 341
      Top = 0
      Width = 85
      Height = 23
      Caption = 'Refrescar'
      TabOrder = 0
      OnClick = btnRefrescarClick
    end
    object btnExcellSelected: TBitBtn
      Left = 22
      Top = -1
      Width = 23
      Height = 23
      Hint = 'Copiar Seleccionado'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FFFFFFFF0000FF
        0000FF0000FF0000FFFFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFF0000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF848484008400848484008400848484FF0000FFFFFFFFFFFFFF0000
        FFFFFF008400848484008400848484008400848484008400FFFFFF0084008484
        84008400FF0000FFFFFFFFFFFFFF0000FFFFFF84848400840084848400840084
        8484008400FFFFFF008400848484008400FFFFFFFF0000FFFFFFFFFFFFFF0000
        FFFFFF008400848484008400848484008400FFFFFF0084008484840084008484
        84FFFFFFFF0000FFFFFFFFFFFFFF0000FFFFFFFFFFFF008400848484008400FF
        FFFF008400848484008400848484008400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF008400FFFFFF008400848484008400848484FFFFFFFFFF
        FFFFFFFFFF0000FFFFFFFFFFFFFF0000FFFFFFFFFFFF008400FFFFFF00840084
        8484008400848484008400848484FFFFFFFFFFFFFF0000FFFFFFFFFFFFFF0000
        FFFFFF008400FFFFFF0084008484840084008484840084008484840084008484
        84FFFFFFFF0000FFFFFFFFFFFFFF0000FFFFFF84848400840084848400840084
        8484FFFFFF848484008400848484008400FFFFFFFF0000FFFFFFFFFFFFFF0000
        FFFFFF008400848484008400848484FFFFFFFFFFFFFFFFFF8484840084008484
        84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFF0000
        FF0000FF0000FF0000FFFFFFFF0000FF0000FF0000FF0000FFFFFFFF0000FF00
        00FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object btnExcellAll: TBitBtn
      Left = 0
      Top = -1
      Width = 25
      Height = 23
      Hint = 'Copiar Todo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF0000FF0000
        0084008484840084008484840084008484840084008484840084008484840084
        00848484FF0000FF0000FF000000840084848400840084848400840084848400
        8400848484008400848484008400848484008400FF0000FF0000008400848484
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF008400848484848484008400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF848484008400848484008400848484848484008400008400848484
        FFFFFF008400848484008400848484008400848484008400FFFFFF0084008484
        84008400008400848484848484008400FFFFFF84848400840084848400840084
        8484008400FFFFFF008400848484008400FFFFFF848484008400008400848484
        FFFFFF008400848484008400848484008400FFFFFF0084008484840084008484
        84FFFFFF008400848484848484008400FFFFFFFFFFFF008400848484008400FF
        FFFF008400848484008400848484008400FFFFFF848484008400008400848484
        FFFFFFFFFFFFFFFFFF008400FFFFFF008400848484008400848484FFFFFFFFFF
        FFFFFFFF008400848484848484008400FFFFFFFFFFFF008400FFFFFF00840084
        8484008400848484008400848484FFFFFFFFFFFF848484008400008400848484
        FFFFFF008400FFFFFF0084008484840084008484840084008484840084008484
        84FFFFFF008400848484848484008400FFFFFF84848400840084848400840084
        8484FFFFFF848484008400848484008400FFFFFF848484008400008400848484
        FFFFFF008400848484008400848484FFFFFFFFFFFFFFFFFF8484840084008484
        84FFFFFF008400848484848484008400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848484008400FF0000FF0000
        0084008484840084008484840084008484840084008484840084008484840084
        00848484FF0000FF0000FF0000FF000084848400840084848400840084848400
        8400848484008400848484008400848484008400FF0000FF0000}
    end
  end
  object Rorden: TRadioGroup
    Left = 8
    Top = 56
    Width = 313
    Height = 41
    Caption = 'Ordenar por'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Por Entidad y Programa'
      'Por Fecha de Vencimiento')
    TabOrder = 5
    OnClick = RordenClick
  end
  object InterForma1: TInterForma
    IsMain = True
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
    ShowNavigator = False
    ShowError = False
    IsCancel = False
    Left = 406
    Top = 327
  end
end
