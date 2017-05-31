object WCrGeFiBuro: TWCrGeFiBuro
  Left = 485
  Top = 261
  Width = 522
  Height = 309
  Caption = 'Reportes Buró de Crédito'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain1: TPanel
    Left = 0
    Top = 0
    Width = 529
    Height = 254
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object mmLog: TMemo
      Left = 0
      Top = 105
      Width = 529
      Height = 134
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = 33023
      Font.Height = -13
      Font.Name = 'Courier'
      Font.Style = []
      ParentFont = False
      PopupMenu = mmppLog
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object pnlMain: TPanel
      Left = 0
      Top = 0
      Width = 529
      Height = 105
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 22
        Width = 112
        Height = 13
        Caption = 'Seleccione un proceso:'
      end
      object lblProcesando: TLabel
        Left = 8
        Top = 5
        Width = 5
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object btnProcesa: TBitBtn
        Left = 7
        Top = 64
        Width = 496
        Height = 33
        Anchors = [akLeft, akTop, akRight]
        Caption = '     &G e n e r a   P r o c e s o'
        Enabled = False
        TabOrder = 0
        OnClick = btnProcesaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
          00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
          00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
          F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
          F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
          F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
          FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
          0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
          0033333337FFFFFF773333333000000003333333377777777333}
        NumGlyphs = 2
      end
      object btnConfigura: TBitBtn
        Left = 384
        Top = 33
        Width = 119
        Height = 25
        Caption = 'Configuración >>'
        TabOrder = 1
        OnClick = btnConfiguraClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000084120000841200001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333330000033333333300333330033333303333333330333303300000003
          3033303330CCC03330330333330C0333330303333330300033030300000307B7
          0303030999030BBB03030309990307B703033009990330003033300000033333
          3033330333333333033333300333330033333333300000333333}
      end
      object cbxProcesos: TDBLookupComboBox
        Left = 8
        Top = 36
        Width = 369
        Height = 21
        KeyField = 'VALOR'
        ListField = 'DESC_PARAM_B'
        ListSource = dsProcesos
        TabOrder = 2
        OnClick = cbxProcesosClick
        OnCloseUp = cbxProcesosCloseUp
      end
    end
  end
  object pnlConf: TPanel
    Left = 529
    Top = 0
    Width = 0
    Height = 254
    Align = alClient
    TabOrder = 1
    object lblServer: TLabel
      Left = 16
      Top = 8
      Width = 39
      Height = 13
      Caption = 'Servidor'
    end
    object lblInterfases: TLabel
      Left = 16
      Top = 48
      Width = 46
      Height = 13
      Caption = 'Interfases'
    end
    object edtServer: TEdit
      Left = 16
      Top = 24
      Width = 209
      Height = 21
      Color = clWhite
      TabOrder = 0
      OnChange = edtServerChange
      OnEnter = edtServerEnter
      OnExit = edtServerExit
    end
    object dbListInterfase: TDBLookupListBox
      Left = 16
      Top = 64
      Width = 209
      Height = 160
      KeyField = 'VALOR'
      ListField = 'DESC_PARAM'
      ListSource = dsProcesos
      TabOrder = 1
    end
    object btnNueva: TBitBtn
      Left = 16
      Top = 227
      Width = 90
      Height = 25
      Caption = 'Nueva'
      TabOrder = 2
      OnClick = btnNuevaClick
    end
    object btnElimina: TBitBtn
      Left = 108
      Top = 227
      Width = 90
      Height = 25
      Caption = 'Eliminar'
      TabOrder = 3
      OnClick = btnEliminaClick
    end
  end
  object dsProcesos: TDataSource
    DataSet = qryProcesos
    Left = 432
    Top = 65528
  end
  object qryProcesos: TQuery
    DatabaseName = 'BCORP'
    SQL.Strings = (
      'SELECT   valor_parametro AS valor,'
      
        '         CAST ('#39'('#39' || valor_parametro || '#39') - '#39' || descripcion A' +
        'S VARCHAR2 (64)'
      '              ) AS desc_param,'
      '         descripcion AS desc_param_b'
      '    FROM bc_param_buro'
      '   WHERE id_empresa = 10002'
      'ORDER BY cve_parametro'
      ' '
      ' ')
    Left = 432
    Top = 24
    object qryProcesosVALOR: TStringField
      FieldName = 'VALOR'
      Origin = 'BCORP.DV_PARAM.VALOR'
      Size = 255
    end
    object qryProcesosDESC_PARAM: TStringField
      FieldName = 'DESC_PARAM'
      Size = 64
    end
    object qryProcesosDESC_PARAM_B: TStringField
      FieldName = 'DESC_PARAM_B'
      Size = 255
    end
  end
  object CteSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = CteSocketConnect
    OnDisconnect = CteSocketDisconnect
    OnRead = CteSocketRead
    Left = 432
    Top = 56
  end
  object mmppLog: TPopupMenu
    Left = 240
    Top = 40
    object Guardar1: TMenuItem
      Caption = 'Guardar...'
      OnClick = Guardar1Click
    end
  end
  object sdb: TSaveDialog
    DefaultExt = 'txt'
    FileName = 'LogBC.txt'
    Filter = 'Documento de Texto (*.txt)|*.txt'
    InitialDir = 'c:\'
    Title = 'Guardar Log'
    Left = 352
    Top = 16
  end
end
