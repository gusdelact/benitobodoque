object WCrconsulta: TWCrconsulta
  Left = 241
  Top = 86
  Width = 848
  Height = 627
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
  object lbID_CREDITO: TLabel
    Left = 746
    Top = 12
    Width = 74
    Height = 13
    Caption = 'No. Disposición'
  end
  object lblPeriodos: TLabel
    Left = 2
    Top = 430
    Width = 824
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
    Left = 237
    Top = 446
    Width = 10
    Height = 10
    Brush.Color = clBlue
    Pen.Color = clBlue
  end
  object lblLiquidados: TLabel
    Left = 251
    Top = 445
    Width = 51
    Height = 13
    Caption = 'Liquidados'
  end
  object lblActivos: TLabel
    Left = 23
    Top = 445
    Width = 35
    Height = 13
    Caption = 'Activos'
  end
  object shpActivos: TShape
    Left = 7
    Top = 446
    Width = 10
    Height = 10
    Brush.Color = clGreen
    Pen.Color = clGreen
  end
  object lblNoAutorizados: TLabel
    Left = 80
    Top = 445
    Width = 72
    Height = 13
    Caption = 'No Autorizados'
  end
  object shpNoAutorizados: TShape
    Left = 63
    Top = 446
    Width = 10
    Height = 10
    Brush.Color = clBlack
  end
  object lblCancelados: TLabel
    Left = 326
    Top = 445
    Width = 56
    Height = 13
    Caption = 'Cancelados'
  end
  object shpCancelados: TShape
    Left = 309
    Top = 446
    Width = 10
    Height = 10
    Brush.Color = clGray
    Pen.Color = clGray
  end
  object Shape56: TShape
    Left = 160
    Top = 446
    Width = 9
    Height = 10
    Brush.Color = clRed
    Pen.Color = clRed
  end
  object Label44: TLabel
    Left = 174
    Top = 445
    Width = 52
    Height = 13
    Caption = 'Impagados'
  end
  object Label46: TLabel
    Left = 788
    Top = 458
    Width = 37
    Height = 7
    Caption = 'V20150630'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -7
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object pgctrlConsulta: TPageControl
    Left = 1
    Top = 49
    Width = 825
    Height = 340
    ActivePage = tbshtInteres
    TabOrder = 0
    OnChange = pgctrlConsultaChange
    object tbshtCapital: TTabSheet
      Caption = 'Capital'
      object Shape1: TShape
        Left = 1
        Top = 5
        Width = 26
        Height = 33
        Brush.Color = 12320767
      end
      object Label1: TLabel
        Left = 1
        Top = 17
        Width = 27
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
      object PnlTitulos: TPanel
        Left = 28
        Top = 5
        Width = 768
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
          Width = 226
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
        object shp11: TShape
          Left = 374
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
          Left = 748
          Top = 0
          Width = 19
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
        object lblImpVencido: TLabel
          Left = 378
          Top = 18
          Width = 68
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Vencido'
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
          Width = 221
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
          Left = 749
          Top = 10
          Width = 18
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
        object Shape10: TShape
          Left = 448
          Top = 0
          Width = 301
          Height = 17
          Brush.Color = 12320767
        end
        object shp12: TShape
          Left = 448
          Top = 16
          Width = 76
          Height = 17
          Brush.Color = 12320767
        end
        object shp13: TShape
          Left = 523
          Top = 16
          Width = 76
          Height = 17
          Brush.Color = 12320767
        end
        object shp14: TShape
          Left = 673
          Top = 16
          Width = 76
          Height = 17
          Brush.Color = 12320767
        end
        object lblImporteMora: TLabel
          Left = 451
          Top = 2
          Width = 296
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Importe MORA'
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
        object lblMoraAcumulado: TLabel
          Left = 452
          Top = 18
          Width = 68
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Acumulado'
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
        object lblMOraPAgado: TLabel
          Left = 526
          Top = 19
          Width = 71
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
        object lblMoraVencido: TLabel
          Left = 677
          Top = 18
          Width = 69
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Vencido'
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
        object Shape57: TShape
          Left = 598
          Top = 16
          Width = 76
          Height = 17
          Brush.Color = 12320767
        end
        object lblMOraCondonado: TLabel
          Left = 602
          Top = 18
          Width = 68
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Condonado'
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
        Left = -3
        Top = 37
        Width = 820
        Height = 273
        ColCount = 1
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        PopupMenu = PopupMenuCapital
        ScrollBars = ssVertical
        TabOrder = 1
        OnDblClick = strgrdCapitalDblClick
        OnDrawCell = strgrdCapitalDrawCell
        OnKeyDown = strgrdCapitalKeyDown
      end
    end
    object tbshtInteres: TTabSheet
      Caption = 'Interés'
      ImageIndex = 1
      object Shape2: TShape
        Left = 3
        Top = 5
        Width = 26
        Height = 57
        Brush.Color = 12320767
      end
      object Label2: TLabel
        Left = 3
        Top = 23
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
      object Label47: TLabel
        Left = 22
        Top = 296
        Width = 118
        Height = 13
        Caption = 'F Fin Periodo Gracia F.A.'
      end
      object strgrdInteres: TStringGrid
        Left = 2
        Top = 62
        Width = 595
        Height = 211
        ColCount = 1
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        PopupMenu = PopupMenuInteres
        ScrollBars = ssVertical
        TabOrder = 0
        OnClick = strgrdInteresClick
        OnDblClick = strgrdCapitalDblClick
        OnDrawCell = strgrdCapitalDrawCell
        OnKeyDown = strgrdCapitalKeyDown
        OnMouseDown = strgrdInteresMouseDown
        OnSelectCell = strgrdInteresSelectCell
        OnTopLeftChanged = strgrdInteresTopLeftChanged
      end
      object pnlTitulosInteres: TPanel
        Left = 28
        Top = 5
        Width = 672
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
          Width = 226
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
        object Shape12: TShape
          Left = 389
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
        object Label9: TLabel
          Left = 393
          Top = 32
          Width = 68
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Vencido'
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
          Width = 221
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
          Left = 464
          Top = 0
          Width = 37
          Height = 57
          Brush.Color = 12320767
        end
        object Label31: TLabel
          Left = 464
          Top = 10
          Width = 38
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
        object Shape58: TShape
          Left = 500
          Top = 0
          Width = 33
          Height = 57
          Brush.Color = 12320767
        end
        object Label45: TLabel
          Left = 498
          Top = 10
          Width = 38
          Height = 41
          Alignment = taCenter
          AutoSize = False
          Caption = 'Tipo'#13#10'Finan. Adic.'
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
        object PanelSituacion: TPanel
          Left = 532
          Top = -1
          Width = 25
          Height = 58
          BevelOuter = bvNone
          TabOrder = 0
          object shp17: TShape
            Left = 0
            Top = 1
            Width = 17
            Height = 57
            Brush.Color = 12320767
          end
          object Label10: TLabel
            Left = 1
            Top = 23
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
        end
      end
      object PageControl1: TPageControl
        Left = 595
        Top = 0
        Width = 222
        Height = 309
        ActivePage = TabSheet2
        TabOrder = 2
        OnChange = pgctrlConsultaChange
        object TabSheet2: TTabSheet
          Caption = 'Moratorios'
          ImageIndex = 1
          object Panel4: TPanel
            Left = 0
            Top = 5
            Width = 305
            Height = 33
            BevelOuter = bvNone
            TabOrder = 0
            object Shape69: TShape
              Left = 0
              Top = 0
              Width = 212
              Height = 17
              Brush.Color = 12320767
            end
            object Shape71: TShape
              Left = 0
              Top = 16
              Width = 67
              Height = 17
              Brush.Color = 12320767
            end
            object Shape72: TShape
              Left = 127
              Top = 16
              Width = 85
              Height = 17
              Brush.Color = 12320767
            end
            object Label55: TLabel
              Left = 3
              Top = 2
              Width = 206
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Importe MORA'
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
            object Label58: TLabel
              Left = 3
              Top = 18
              Width = 60
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
            object Shape73: TShape
              Left = 66
              Top = 16
              Width = 62
              Height = 17
              Brush.Color = 12320767
            end
            object Label59: TLabel
              Left = 129
              Top = 18
              Width = 80
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Condonado'
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
            object Label57: TLabel
              Left = 73
              Top = 18
              Width = 47
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
          end
          object strgrdMorasInt: TStringGrid
            Left = 1
            Top = 38
            Width = 211
            Height = 243
            ColCount = 1
            DefaultRowHeight = 16
            FixedCols = 0
            RowCount = 1
            FixedRows = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
            ScrollBars = ssVertical
            TabOrder = 1
            OnDrawCell = strgrdCapitalDrawCell
            OnSelectCell = strgrdInteresSelectCell
            OnTopLeftChanged = strgrdInteresTopLeftChanged
            ColWidths = (
              2)
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Capital'
          object Shape54: TShape
            Left = 0
            Top = 5
            Width = 108
            Height = 33
            Brush.Color = 12320767
          end
          object Label42: TLabel
            Left = 5
            Top = 9
            Width = 95
            Height = 27
            Alignment = taCenter
            AutoSize = False
            Caption = 'Importe'#13#10'Capital'
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
          object Shape55: TShape
            Left = 107
            Top = 5
            Width = 106
            Height = 33
            Brush.Color = 12320767
          end
          object Label43: TLabel
            Left = 112
            Top = 9
            Width = 97
            Height = 27
            Alignment = taCenter
            AutoSize = False
            Caption = 'Fecha de'#13#10'Vencimiento'
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
          object strgrdCapital2: TStringGrid
            Left = 1
            Top = 38
            Width = 213
            Height = 247
            DefaultRowHeight = 16
            FixedCols = 0
            RowCount = 1
            FixedRows = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
            ScrollBars = ssVertical
            TabOrder = 0
            OnDrawCell = strgrdCapitalDrawCell
            OnSelectCell = strgrdInteresSelectCell
            OnTopLeftChanged = strgrdInteresTopLeftChanged
            ColWidths = (
              2
              2
              2
              64
              64)
          end
        end
      end
      object Rtfinan: TRadioGroup
        Left = 387
        Top = 277
        Width = 201
        Height = 33
        Caption = 'Tipo de Financiamiento Adicional'
        Columns = 2
        Enabled = False
        Items.Strings = (
          'Directo (DR)'
          'Prorrateo (PR)')
        TabOrder = 3
        OnClick = RtfinanClick
      end
      object cbAllFA: TCheckBox
        Left = 232
        Top = 295
        Width = 146
        Height = 17
        HelpContext = 2300
        Alignment = taLeftJustify
        Caption = 'Modificar todos los periodos'
        TabOrder = 4
        OnClick = cbAllFAClick
      end
      object edF_FIN_PERGRA_FA: TEdit
        Tag = 18
        Left = 146
        Top = 291
        Width = 80
        Height = 21
        HelpContext = 7501
        Color = clBtnFace
        Enabled = False
        TabOrder = 5
      end
    end
    object tbshtComision: TTabSheet
      Caption = 'Comisión'
      ImageIndex = 2
      object Shape27: TShape
        Left = 62
        Top = 21
        Width = 67
        Height = 17
        Brush.Color = 12320767
      end
      object Shape28: TShape
        Left = 62
        Top = 5
        Width = 197
        Height = 17
        Brush.Color = 12320767
      end
      object shp3: TShape
        Left = 0
        Top = 5
        Width = 63
        Height = 33
        Brush.Color = 12320767
      end
      object lblDescripcion: TLabel
        Left = 1
        Top = 14
        Width = 59
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Descripción'
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
        Left = 128
        Top = 21
        Width = 66
        Height = 17
        Brush.Color = 12320767
      end
      object Shape30: TShape
        Left = 193
        Top = 21
        Width = 66
        Height = 17
        Brush.Color = 12320767
      end
      object Shape31: TShape
        Left = 301
        Top = 5
        Width = 226
        Height = 17
        Brush.Color = 12320767
      end
      object Shape32: TShape
        Left = 301
        Top = 21
        Width = 76
        Height = 17
        Brush.Color = 12320767
      end
      object Shape33: TShape
        Left = 376
        Top = 21
        Width = 76
        Height = 17
        Brush.Color = 12320767
      end
      object Shape34: TShape
        Left = 451
        Top = 21
        Width = 76
        Height = 17
        Brush.Color = 12320767
      end
      object Shape35: TShape
        Left = 258
        Top = 5
        Width = 45
        Height = 33
        Brush.Color = 12320767
      end
      object Shape36: TShape
        Left = 525
        Top = 5
        Width = 226
        Height = 17
        Brush.Color = 12320767
      end
      object Shape37: TShape
        Left = 525
        Top = 21
        Width = 76
        Height = 17
        Brush.Color = 12320767
      end
      object Shape38: TShape
        Left = 600
        Top = 21
        Width = 76
        Height = 17
        Brush.Color = 12320767
      end
      object Shape39: TShape
        Left = 675
        Top = 21
        Width = 76
        Height = 17
        Brush.Color = 12320767
      end
      object Shape40: TShape
        Left = 750
        Top = 5
        Width = 19
        Height = 33
        Brush.Color = 12320767
      end
      object Label19: TLabel
        Left = 64
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
        Left = 64
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
        Left = 131
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
        Left = 195
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
        Left = 307
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
        Left = 380
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
      object Label25: TLabel
        Left = 455
        Top = 23
        Width = 68
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Vencido'
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
        Left = 304
        Top = 7
        Width = 221
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
      object Label26: TLabel
        Left = 528
        Top = 7
        Width = 221
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Importe MORA'
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
      object Label27: TLabel
        Left = 531
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
      object Label28: TLabel
        Left = 604
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
      object Label29: TLabel
        Left = 679
        Top = 23
        Width = 68
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Vencido'
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
        Left = 752
        Top = 15
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
      object strgrdComision: TStringGrid
        Left = 0
        Top = 37
        Width = 789
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
        OnDblClick = strgrdCapitalDblClick
        OnDrawCell = strgrdCapitalDrawCell
        OnKeyDown = strgrdCapitalKeyDown
      end
    end
    object tbshtDocumentos: TTabSheet
      Caption = 'Documentos'
      ImageIndex = 3
      object Shape14: TShape
        Left = 715
        Top = 7
        Width = 19
        Height = 33
        Brush.Color = 12320767
      end
      object Shape15: TShape
        Left = 220
        Top = 23
        Width = 66
        Height = 17
        Brush.Color = 12320767
      end
      object Shape16: TShape
        Left = 350
        Top = 23
        Width = 66
        Height = 17
        Brush.Color = 12320767
      end
      object Shape18: TShape
        Left = 285
        Top = 23
        Width = 66
        Height = 17
        Brush.Color = 12320767
      end
      object Shape19: TShape
        Left = 220
        Top = 7
        Width = 196
        Height = 17
        Brush.Color = 12320767
      end
      object Label11: TLabel
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
      object Label12: TLabel
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
      object Label13: TLabel
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
      object Label14: TLabel
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
      object Label15: TLabel
        Left = 717
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
      object Shape20: TShape
        Left = 565
        Top = 23
        Width = 76
        Height = 17
        Brush.Color = 12320767
      end
      object Shape21: TShape
        Left = 490
        Top = 23
        Width = 76
        Height = 17
        Brush.Color = 12320767
      end
      object Shape22: TShape
        Left = 415
        Top = 23
        Width = 76
        Height = 17
        Brush.Color = 12320767
      end
      object Shape23: TShape
        Left = 415
        Top = 7
        Width = 301
        Height = 17
        Brush.Color = 12320767
      end
      object Label16: TLabel
        Left = 418
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
      object Shape24: TShape
        Left = 6
        Top = 7
        Width = 167
        Height = 33
        Brush.Color = 12320767
      end
      object Label17: TLabel
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
      object Shape25: TShape
        Left = 172
        Top = 7
        Width = 50
        Height = 33
        Brush.Color = 12320767
      end
      object Label18: TLabel
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
      object Shape26: TShape
        Left = 640
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
      object strgrdDocumentos1: TStringGrid
        Left = 6
        Top = 39
        Width = 407
        Height = 270
        ColCount = 1
        DefaultColWidth = 165
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ScrollBars = ssNone
        TabOrder = 0
        OnDblClick = strgrdCapitalDblClick
        OnDrawCell = strgrdCapitalDrawCell
        OnKeyDown = strgrdCapitalKeyDown
        OnSelectCell = strgrdDocumentos1SelectCell
        OnTopLeftChanged = strgrdDocumentos3TopLeftChanged
      end
      object strgrdDocumentos2: TStringGrid
        Left = 413
        Top = 39
        Width = 303
        Height = 271
        ColCount = 1
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
        ScrollBars = ssHorizontal
        TabOrder = 1
        OnDblClick = strgrdCapitalDblClick
        OnDrawCell = strgrdCapitalDrawCell
        OnKeyDown = strgrdCapitalKeyDown
        OnSelectCell = strgrdDocumentos1SelectCell
        OnTopLeftChanged = strgrdDocumentos3TopLeftChanged
      end
      object strgrdDocumentos3: TStringGrid
        Left = 715
        Top = 39
        Width = 41
        Height = 270
        ColCount = 1
        DefaultColWidth = 17
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ScrollBars = ssVertical
        TabOrder = 2
        OnDblClick = strgrdCapitalDblClick
        OnDrawCell = strgrdCapitalDrawCell
        OnKeyDown = strgrdCapitalKeyDown
        OnSelectCell = strgrdDocumentos1SelectCell
        OnTopLeftChanged = strgrdDocumentos3TopLeftChanged
      end
    end
    object tbshtFinanciamiento: TTabSheet
      Caption = 'Financiamiento'
      ImageIndex = 4
      object Shape42: TShape
        Left = 10
        Top = 5
        Width = 26
        Height = 33
        Brush.Color = 12320767
      end
      object Label32: TLabel
        Left = 10
        Top = 15
        Width = 27
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
      object strgrdFinanciamiento: TStringGrid
        Left = 6
        Top = 36
        Width = 613
        Height = 272
        ColCount = 1
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ScrollBars = ssVertical
        TabOrder = 0
        OnDblClick = strgrdCapitalDblClick
        OnDrawCell = strgrdCapitalDrawCell
        OnKeyDown = strgrdCapitalKeyDown
      end
      object Panel2: TPanel
        Left = 35
        Top = 5
        Width = 587
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
          Width = 226
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
        object Shape50: TShape
          Left = 389
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
          Left = 464
          Top = 0
          Width = 19
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
        object Label39: TLabel
          Left = 393
          Top = 18
          Width = 68
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Vencido'
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
          Width = 221
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
          Left = 466
          Top = 10
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
      end
    end
    object tbshtNone: TTabSheet
      Caption = 'tbshtNone'
      ImageIndex = 5
      object Shape53: TShape
        Left = 0
        Top = 131
        Width = 787
        Height = 60
        Brush.Color = clRed
      end
      object lblMsgError: TLabel
        Left = 5
        Top = 135
        Width = 774
        Height = 52
        Alignment = taCenter
        AutoSize = False
        Caption = 
          'No existen documentos configurados para el producto "CVE_PRODUCT' +
          'O" de está disposición'
        Color = 8454143
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
    end
  end
  object tbstSituacion: TTabSet
    Left = 0
    Top = 411
    Width = 826
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
      'Impagados'
      'Por Activar'
      'Cancelados')
    TabIndex = 0
    OnChange = tbstSituacionChange
  end
  object icpCONTRATO: TInterCtoPanel
    Left = 5
    Top = 2
    Width = 732
    Height = 45
    Hint = 'Información del Contrato'
    Lenguaje = 0
    ShowLenguaje = False
    ShowEnviarEMail = False
  end
  object edID_CREDITO: TEdit
    Left = 745
    Top = 26
    Width = 79
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object PnDatos: TPanel
    Left = 5
    Top = 562
    Width = 820
    Height = 21
    TabOrder = 4
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
      Left = 400
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
      Left = 400
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
      Left = 464
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
      Left = 464
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
    Top = 390
    Width = 826
    Height = 22
    TabOrder = 5
    object lblPeriodo: TLabel
      Left = 363
      Top = 4
      Width = 36
      Height = 13
      Caption = 'Periodo'
    end
    object btnRefrescar: TBitBtn
      Left = 741
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
    object edNum_Periodo: TEdit
      Left = 405
      Top = 0
      Width = 33
      Height = 21
      TabOrder = 3
      OnKeyPress = edNum_PeriodoKeyPress
    end
    object btnIr: TBitBtn
      Left = 437
      Top = -1
      Width = 28
      Height = 23
      Caption = '&Ir'
      TabOrder = 4
      OnClick = btnIrClick
    end
  end
  object GBFProg: TGroupBox
    Left = 0
    Top = 468
    Width = 825
    Height = 85
    Caption = 'Cambio de Fechas Programadas'
    TabOrder = 6
    object lbArchivoEntrada: TLabel
      Left = 120
      Top = 36
      Width = 148
      Height = 13
      Caption = 'Nombre del Archivo de Entrada'
    end
    object sbArchivoEntrada: TSpeedButton
      Left = 522
      Top = 51
      Width = 23
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      OnClick = sbArchivoEntradaClick
    end
    object edArchivoEntrada: TEdit
      Left = 121
      Top = 52
      Width = 400
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 1
    end
    object bbImportar: TBitBtn
      Left = 552
      Top = 48
      Width = 97
      Height = 25
      Caption = 'Importar'
      TabOrder = 2
      OnClick = bbImportarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
    end
    object pAniBar: TPanel
      Left = 120
      Top = 16
      Width = 697
      Height = 17
      TabOrder = 4
    end
    object Rconcepto: TRadioGroup
      Left = 8
      Top = 16
      Width = 105
      Height = 57
      ItemIndex = 0
      Items.Strings = (
        'Capital'
        'Interes')
      TabOrder = 0
    end
    object bbCamFhProg: TBitBtn
      Left = 656
      Top = 48
      Width = 161
      Height = 25
      Caption = 'Actualizar F. Programadas'
      TabOrder = 3
      OnClick = bbCamFhProgClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
      Spacing = 6
    end
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
    Left = 582
    Top = 47
  end
  object ImageList: TImageList
    Width = 77
    Left = 392
    Top = 98
    Bitmap = {
      494C01010200040004004D001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000034010000100000000100200000000000004D
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
      0000000000000000000000000000000000000000000099A8AC00E2EFF100E2EF
      F100E2EFF100E2EFF100E2EFF100E2EFF100E2EFF100E2EFF100E2EFF100E2EF
      F100E2EFF1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099A8AC00E2EFF100E2EFF100E2EFF100E2EFF100E2EF
      F100E2EFF100E2EFF100E2EFF100E2EFF100E2EFF100E2EFF100000000000000
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
      00000000000099A8AC00646F7100F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099A8AC00646F
      7100F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800E2EFF10000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000099A8AC00646F7100F8F8
      F80000000000000000000000000000000000000000000000000000000000F8F8
      F800E2EFF1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099A8AC00646F7100F8F8F800F8F8F800F8F8F8000000
      0000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800E2EFF100000000000000
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
      00000000000099A8AC00646F7100F8F8F8000000000000000000000000000000
      0000000000000000000000000000F8F8F800E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099A8AC00646F
      7100F8F8F800F8F8F800000000000000000000000000F8F8F800F8F8F800F8F8
      F800F8F8F800E2EFF10000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000099A8AC00646F7100F8F8
      F80000000000000000000000000000000000000000000000000000000000F8F8
      F800E2EFF1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099A8AC00646F7100F8F8F80000000000000000000000
      00000000000000000000F8F8F800F8F8F800F8F8F800E2EFF100000000000000
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
      00000000000099A8AC00646F7100F8F8F8000000000000000000000000000000
      0000000000000000000000000000F8F8F800E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099A8AC00646F
      7100F8F8F8000000000000000000F8F8F800000000000000000000000000F8F8
      F800F8F8F800E2EFF10000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000099A8AC00646F7100F8F8
      F80000000000000000000000000000000000000000000000000000000000F8F8
      F800E2EFF1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099A8AC00646F7100F8F8F80000000000F8F8F800F8F8
      F800F8F8F800000000000000000000000000F8F8F800E2EFF100000000000000
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
      00000000000099A8AC00646F7100F8F8F8000000000000000000000000000000
      0000000000000000000000000000F8F8F800E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099A8AC00646F
      7100F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800000000000000
      0000F8F8F800E2EFF10000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000099A8AC00646F7100F8F8
      F800000000000000000000000000000000000000000000000000000000000000
      0000E2EFF1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099A8AC00646F7100F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F80000000000F8F8F800E2EFF100000000000000
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
      00000000000099A8AC00646F7100000000000000000000000000000000000000
      00000000000000000000F8F8F800F8F8F800E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099A8AC00646F
      7100F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800E2EFF10000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000099A8AC00646F7100646F
      7100646F7100646F7100646F7100646F7100646F7100646F7100646F7100646F
      7100E2EFF1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099A8AC00646F7100646F7100646F7100646F7100646F
      7100646F7100646F7100646F7100646F7100646F7100E2EFF100000000000000
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
      00000000000099A8AC0099A8AC0099A8AC0099A8AC0099A8AC0099A8AC0099A8
      AC0099A8AC0099A8AC0099A8AC0099A8AC0099A8AC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099A8AC0099A8
      AC0099A8AC0099A8AC0099A8AC0099A8AC0099A8AC0099A8AC0099A8AC0099A8
      AC0099A8AC0099A8AC0000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000034010000100000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC00000000000000000000000000000000000000000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFC00000000000000000000000000000000000000000
      FF8007FFFFFFFFFFFFFFFC003FFFFFFFFFFFFFC0000000000000000000000000
      0000000000000000FF8007FFFFFFFFFFFFFFFC003FFFFFFFFFFFFFC000000000
      00000000000000000000000000000000FF8FE7FFFFFFFFFFFFFFFC003FFFFFFF
      FFFFFFC00000000000000000000000000000000000000000FF8FE7FFFFFFFFFF
      FFFFFC003FFFFFFFFFFFFFC00000000000000000000000000000000000000000
      FF8FE7FFFFFFFFFFFFFFFC003FFFFFFFFFFFFFC0000000000000000000000000
      0000000000000000FF8FE7FFFFFFFFFFFFFFFC003FFFFFFFFFFFFFC000000000
      00000000000000000000000000000000FF8FE7FFFFFFFFFFFFFFFC003FFFFFFF
      FFFFFFC00000000000000000000000000000000000000000FF8FE7FFFFFFFFFF
      FFFFFC003FFFFFFFFFFFFFC00000000000000000000000000000000000000000
      FF8FF7FFFFFFFFFFFFFFFC003FFFFFFFFFFFFFC0000000000000000000000000
      0000000000000000FF9FC7FFFFFFFFFFFFFFFC003FFFFFFFFFFFFFC000000000
      00000000000000000000000000000000FF8007FFFFFFFFFFFFFFFC003FFFFFFF
      FFFFFFC00000000000000000000000000000000000000000FF8007FFFFFFFFFF
      FFFFFC003FFFFFFFFFFFFFC00000000000000000000000000000000000000000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0000000000000000000000000
      0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object PopupMenuCapital: TPopupMenu
    OnPopup = PopupMenuCapitalPopup
    Left = 662
    Top = 46
    object ConsultadePeriodo1: TMenuItem
      Caption = 'Consulta de Periodo'
      OnClick = ConsultadePeriodo1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object ProrrogaxFechadeVencimiento1: TMenuItem
      Caption = 'Prorroga x Fecha de Vencimiento'
      OnClick = ProrrogaxFechadeVencimiento1Click
    end
    object ProrrogaxAjustedeImporte1: TMenuItem
      Caption = 'Prorroga x Ajuste de Importe'
      OnClick = ProrrogaxAjustedeImporte1Click
    end
    object ProrrogaxIncdePeriodo1: TMenuItem
      Caption = 'Prorroga x Incremento de Periodo'
      OnClick = ProrrogaxIncdePeriodo1Click
    end
  end
  object PopupMenuInteres: TPopupMenu
    OnPopup = PopupMenuCapitalPopup
    Left = 739
    Top = 46
    object MenuItem1: TMenuItem
      Caption = 'Consulta de Periodo'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object ProrrogaxFechadeVencimiento2: TMenuItem
      Caption = 'Prorroga x Fecha de Vencimiento'
      OnClick = ProrrogaxFechadeVencimiento2Click
    end
  end
  object odArchivoEntrada: TOpenDialog
    DefaultExt = '.xlsx'
    Filter = '*.xlsx|*.xlsx|*.xls|*.xls'
    Left = 576
    Top = 472
  end
  object ExcelWorksheetI: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 616
    Top = 472
  end
  object ExcelApplicationI: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 648
    Top = 472
  end
  object ExcelWorkbookI: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 688
    Top = 472
  end
end
